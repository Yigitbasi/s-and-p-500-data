
# Gerekli kütüphaneleri yükle
library(quantmod)
library(dplyr)
library(openxlsx)

# --- 1. Veri Kaynaklarını Ayarlama ---
# S&P 500 sembollerinin olduğu dosyayı oku
veri <- read.csv("sp500_verileri.csv", fileEncoding = "UTF-8")
semboller <- veri$Symbol[1:503]
# Yahoo Finance formatına uygun hale getirmek için '.' karakterini '-' ile değiştir
semboller <- gsub("\\.", "-", semboller)

# Bu satır, harf (A-Z) ve tire (-) dışındaki her şeyi (akıllı tırnaklar, boşluklar vb.) siler.
semboller <- gsub("[^A-Z-]", "", semboller)


# --- 2. Hisse Senedi Fiyat Verilerini Çekme ---
hisse_listesi <- list()
options(timeout = 300) # İndirme zaman aşımı süresini artır

for (tek_sembol in semboller) {
  print(paste("Veri cekiliyor:", tek_sembol))
  tryCatch({
    # Son 100 günlük veriyi çek ve doğrudan bir değişkene ata
    hisse_fiyat <- getSymbols(
      Symbols = tek_sembol,
      src = "yahoo",
      from = Sys.Date() - 100, # Hesaplamalar için daha fazla veri çekmek daha sağlıklı olacaktır
      to = Sys.Date(),
      auto.assign = FALSE,
      adjust = TRUE
    )
    
    # İndirilen veriyi, hisse senedinin adıyla listeye ekle
    hisse_listesi[[tek_sembol]] <- hisse_fiyat
    
  }, error = function(e) {
    print(paste(tek_sembol, "için veri indirilemedi:", e$message))
  })
  
  # Sunucuyu yormamak için kısa bir ara ver
  Sys.sleep(0.2)
}

print("İndirilen hisse senetleri:")
print(names(hisse_listesi))

# --- 3. Veri İşleme ve Teknik Göstergeleri Hesaplama ---
gecici_df_listesi <- list()

for (hisse_adi in names(hisse_listesi)) {
  
  hisse_xts <- hisse_listesi[[hisse_adi]]
  
  # xts objesini data.frame'e dönüştür
  hisse_df <- data.frame(Tarih = index(hisse_xts), coredata(hisse_xts))
  
  # Sütun isimlerini temizle
  colnames(hisse_df) <- gsub(pattern = ".+\\.", replacement = "", x = colnames(hisse_df))
  
  # Hangi hisseye ait olduğunu belirtmek için "Sembol" sütunu ekle
  hisse_df$Sembol <- hisse_adi

  # Sadece son günün verisini al
  son_gun_verisi <- last(hisse_df)
  
  # Düzenlenmiş bu temiz data.frame'i listeye ekle
  gecici_df_listesi[[hisse_adi]] <- son_gun_verisi
}

# --- 4. Verileri Birleştirme ve Son Haline Getirme ---
# Tüm hisselerin son gün verilerini tek bir veri çerçevesinde birleştir
birlesik_veri_cercevesi <- do.call(rbind, gecici_df_listesi)

# Satır isimlerini sıfırla
rownames(birlesik_veri_cercevesi) <- NULL

# Sektör verileri ile birleştirme
fiyat_ve_sektor_verisi <- left_join(birlesik_veri_cercevesi, veri, by = c("Sembol" = "Symbol"))

# --- 5. Sonuçları Kaydetme ---

# Excel uyumluluğu için UTF-8 BOM ile kaydetme
write.csv(fiyat_ve_sektor_verisi,
          file = "x",
          row.names = FALSE,
          fileEncoding = "UTF-8")

print("Islem tamamlandi!")
print("Tüm hisse senedi verileri teknik göstergelerle birlikte 'tum_hisseler_teknik_analizli.csv' adıyla kaydedildi.")

# Sonucu kontrol etmek için ilk birkaç satıra bakalım
print(head(fiyat_ve_sektor_verisi))

# RStudio'da görüntülemek için
View(fiyat_ve_sektor_verisi)