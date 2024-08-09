# Brew PHP ln

[中文文档](README_zh.md)
[English](README.md)

Brew PHP ln 是一个创建软连接的简单脚本。

## 警告（暂定）

仅适用于通过 Homebrew 安装 PHP 的 OSX 用户，并且仅适用于 PHP 版本 5.6 - 8.3。

## 安装

```shell
brew tap pifeifei/pff
brew install pifeifei/pff/phpln
```

## 使用

```shell
phpln 8.0 # php80 及其相关
php80 -v
composer80 -V
php-config80 --version

phpln 8.0 -m # php8 及其相关
php8 -v
composer8 -V

# 默认版本
phpln 8.0 -d # php 及其相关
php -v
composer -V
```

PS: 小版本升级不用重新创建软连接。
