# 📈 S&P 500 Data Downloader

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Yigitbasi/s-and-p-500-data/issues)
[![Language](https://img.shields.io/badge/language-R-blue.svg)](https://www.r-project.org/)

**S&P 500 Data Downloader**, S&P 500 endeksindeki tüm şirketlerin en güncel fiyat verilerini ve sektör bilgilerini tek bir dosyada toplamayı kolaylaştıran bir R scriptidir.

## 🚀 Özellikler

- **Tüm S&P 500:** Endeksteki ~500 şirketin verilerini otomatik indirir.
- **Güncel Veriler:** Son günlük fiyat (Open, High, Low, Close, Volume, Adjusted Close) bilgilerini çeker.
- **Hata Yönetimi:** İndirilemeyen semboller atlanarak script'in tamamlanması sağlanır.
- **Zengin İçerik:** Fiyat verileri, şirketin sektör ve endüstri bilgileriyle birleştirilir.
- **Tek Dosya Çıktı:** Tüm veriler analiz için tek bir temiz CSV dosyasında toplanır.

## 🖼️ Örnek Veri Seti Görünümü

Aşağıda oluşturulan CSV dosyasının örnek bir ekran görüntüsü bulunmaktadır:

![Veri Seti Ekran Görüntüsü](images/dataset_sample.png)

> **Not:** Kendi veri seti ekran görüntünüzü eklemek için aşağıdaki adımları takip ediniz.

---

## 🛠️ Kurulum ve Kullanım

### Gereksinimler

- [R](https://cran.r-project.org/) ve [RStudio](https://posit.co/download/rstudio-desktop/) kurulu olmalı.

### Kurulum Adımları

1. **Depoyu Klonlayın:**
    ```sh
    git clone https://github.com/Yigitbasi/s-and-p-500-data.git
    cd s-and-p-500-data
    ```

2. **RStudio'da `Low.R` dosyasını açın.**

3. **Gerekli kütüphaneleri yükleyin:**
    ```R
    install.packages(c("quantmod", "dplyr", "openxlsx"))
    ```

### Kullanım

1. `sp500_verileri.csv` dosyasının proje klasöründe olduğundan emin olun.
2. `Low.R` script'ini RStudio'da çalıştırın (`Ctrl+Shift+Enter` ile tamamını çalıştırabilirsiniz).
3. Her şirket için veri indirme işlemi başlayacak ve konsolda ilerleme mesajları göreceksiniz.
4. İşlem tamamlandığında, proje klasöründe **`sp500_daily_data.csv`** dosyası oluşacaktır.

---

## ✨ Katkı Sağlayın

Her türlü katkıya açığız! Özellik önerileri, hata bildirimleri veya geliştirme istekleriniz için lütfen fork'layıp pull request gönderin ya da [issue açın](https://github.com/Yigitbasi/s-and-p-500-data/issues).

- Fork'layın
- Yeni bir dal oluşturun (`git checkout -b feature/HarikaOzellik`)
- Değişikliklerinizi commitleyin (`git commit -m 'Harika özelliği ekle'`)
- Branch'i gönderin (`git push origin feature/HarikaOzellik`)
- Pull Request açın

Daha fazla bilgi için [Katkı Rehberi](CONTRIBUTING.md) dosyasına göz atabilirsiniz.

---

## 📝 Lisans

Bu proje MIT lisansı ile dağıtılmaktadır. Daha fazla bilgi için `LICENSE` dosyasını inceleyebilirsiniz.

---

## 📷 README'ye Veri Seti Ekran Görüntüsü Eklemek

1. **Veri setinizin (örneğin, `sp500_daily_data.csv`) bir kısmının ekran görüntüsünü alın.**
2. Proje klasörünüzde `images` adında bir klasör oluşturun ve ekran görüntüsünü örneğin `dataset_sample.png` adıyla bu klasöre ekleyin.
3. README dosyanızda ilgili bölüme şu markdown satırını ekleyin:
    ```markdown
    ![Veri Seti Ekran Görüntüsü](images/dataset_sample.png)
    ```
4. Değişiklikleri kaydedip GitHub'a gönderin. Görsel otomatik olarak README'de görünecektir.

---

Herhangi bir sorunuz olursa lütfen [issue](https://github.com/Yigitbasi/s-and-p-500-data/issues) açmaktan çekinmeyin!
