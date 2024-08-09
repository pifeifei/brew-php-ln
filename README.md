# Brew PHP ln

[中文文档](README_zh.md)
[English](README.md)

Brew PHP ln is a simple script for creating soft connections.

## Caveats

For users of OSX only who have installed PHP via Homebrew and for PHP version 5.6 - 8.3.

## Install

```shell
brew tap pifeifei/pff
brew install pifeifei/pff/phpln
```

## use

```shell
phpln 8.0 # php80 and other
php80 -v
composer80 -V
php-config80 --version

# major version
phpln 8.0 -m # php8 and other
php8 -v
composer8 -V

# defaule version
phpln 8.0 -d # php and other
php -v
composer -V
```

Note: There is no need to recreate soft link for minor version upgrade.
