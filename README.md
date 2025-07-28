
# S&P 500 Data Downloader

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Yigitbasi/s-and-p-500-data/issues)
[![Language](https://img.shields.io/badge/language-R-blue.svg)](https://www.r-project.org/)

A simple yet powerful R script to download the latest daily price data for all S&P 500 constituents directly from Yahoo Finance.

This project aims to provide a clean, easy-to-use tool for researchers, students, and analysts who need up-to-date financial data for the entire S&P 500 index.

## ✨ Key Features

* **Comprehensive:** Downloads data for all ~500 companies in the S&P 500.
* **Up-to-Date:** Fetches the most recent daily price data (Open, High, Low, Close, Volume, Adjusted Close).
* **Robust:** Includes error handling to skip any tickers that fail to download, ensuring the script runs to completion.
* **Enriched Data:** Automatically joins the downloaded price data with corresponding company sector and industry information.
* **Single Output:** Consolidates all data into a single, clean CSV file for easy analysis.

## 🚀 Getting Started

Follow these steps to get the data on your local machine.

### Prerequisites

You need to have R and RStudio installed on your computer.
* [Download R](https://cran.r-project.org/)
* [Download RStudio Desktop](https://posit.co/download/rstudio-desktop/)

### Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/Yigitbasi/s-and-p-500-data.git
    cd s-and-p-500-data
    ```

2. **Open the R script `Low.R` in RStudio.**

3. **Install the required libraries** by running the following command in the R console:
    ```R
    install.packages(c("quantmod", "dplyr", "openxlsx"))
    ```

### Usage

1. **Ensure `sp500_verileri.csv` is in the same directory.** This file contains the list of S&P 500 symbols and their sectors.
2. **Run the entire `Low.R` script** in RStudio (you can press `Ctrl+Shift+Enter`).
3. The script will start downloading the data for each company. You will see progress messages in the console.
4. Once finished, a file named **`sp500_daily_data.csv`** will be created in the project directory. This file contains the data you need!

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please see our **[Contributing Guide](CONTRIBUTING.md)** for more details on our code of conduct and the process for submitting pull requests.

## 📝 License

This project is distributed under the MIT License. See `LICENSE` for more information.
