# Brew PHP ln

[中文文档](README_zh.md)
[English](README.md)

Brew PHP ln is a simple script for creating soft connections.

## Caveats

For users of OSX only who have installed PHP via Homebrew and for PHP version 5.6, 7.0, 7.1, 7.2, 7.3, 7.4, 8.0 and 8.1 only.

## Install

```shell
curl -o brew-php-ln https://github.com/pifeifei/brew-php-ln/raw/main/phpln.sh && chmod +x brew-php-ln
curl -o brew-php-ln https://gitee.com/pifeifei/brew-php-ln/raw/main/phpln.sh && chmod +x brew-php-ln
# git clone https://github.com/pifeifei/brew-php-ln.git

# brew install（TODO）
brew install brew-php-ln
```

Where 8.0 exists, please replace with syntax of 5.6, 7.0, 7.1, 7.2, 7.3, 7.4, 8.0 or 8.1 depending on which version is required.

```shell
brew-php-ln 8.0 # php80 and other
php80 -v
composer80 -V

# major version
brew-php-ln 8.0 -m # php8 and other
php8 -v
composer8 -V
```

Note: There is no need to recreate soft link for minor version upgrade.
