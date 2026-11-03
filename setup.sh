#!/bin/bash
set -e

# 系统更新
sudo apt update -y
sudo apt upgrade -y

# 安装R本体 + 绘图所需系统库
sudo apt install -y r-base r-base-dev \
    libcairo2-dev libpng-dev libjpeg-dev libtiff-dev \
    libfontconfig1-dev libfreetype6-dev \
    libssl-dev libcurl4-openssl-dev libxml2-dev

# 安装科研绘图常用R包（国内镜像加速）
Rscript -e '
options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN"))
install.packages(c(
    "data.table", "dplyr", "tidyr",
    "ggplot2", "ggrepel", "ggpubr", "patchwork",
    "scales", "RColorBrewer", "viridis"
), Ncpus = 4)
'

echo "===== R环境就绪 ====="
R --version
