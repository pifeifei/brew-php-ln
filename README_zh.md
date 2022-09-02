# Brew PHP ln

[中文文档](README_zh.md)
[English](README.md)

Brew PHP ln 是一个创建软连接的简单脚本。

## 警告（暂定）

仅适用于通过 Homebrew 安装 PHP 的 OSX 用户，并且仅适用于 PHP 版本 5.6、7.0、7.1、7.2、7.3、7.4、 8.0 和 8.1。

## 安装

```shell
curl -o brew-php-ln https://github.com/pifeifei/brew-php-ln/raw/main/phpln.sh && chmod +x brew-php-ln
curl -o brew-php-ln https://gitee.com/pifeifei/brew-php-ln/raw/main/phpln.sh && chmod +x brew-php-ln
# git clone https://github.com/pifeifei/brew-php-ln.git

# brew 安装（TODO）
brew install brew-php-ln
```

如果存在 5.6，请根据所需的版本，替换为 5.6、7.0、7.1、7.2、7.3、7.4、 8.0 和 8.1 的语法。

```shell
brew-php-ln 8.0 # php80 及其相关
php80 -v
composer80 -V

brew-php-ln 8.0 -m # php8 及其相关
php8 -v
composer8 -V
```

PS: 小版本升级不用重新创建软连接。
