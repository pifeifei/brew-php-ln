#!/bin/bash
# Creator: Pi Feifei
# Email: pifeifei1989@qq.com
# weibo: @kis龍

brew_prefix=$(brew --prefix)

brew_array=("5.6" "7.0" "7.1" "7.2" "7.3" "7.4" "8.0" "8.1")
php_array=("php@5.6" "php@7.0" "php@7.1" "php@7.2" "php@7.3" "php@7.4" "php@8.0" "php@8.1")
php_installed_array=()
php_opt_path="$brew_prefix/opt/"
php_version="php@$1"
php_major=0

# Has the user submitted a version required
if [[ -z "$1" ]]; then
    echo "usage: brew-php-ln version [-m]"
    echo
    echo "    version    one of:" ${brew_array[@]}
    echo "    -m|major   major version, sample php8 or php81"
    echo
    exit
fi

# Check for skip & change flag
while [[ $# -gt 0 ]]; do
    key="$1"
    case "$key" in
    # This is a flag type option. Will catch either -s or --skip
    -m | -major)
        if [[ "${1#*=}" == "-m" ]]; then
            php_major=1
        fi
        ;;

    esac
    # Shift after checking all the cases to get the next option
    shift
done

# What versions of php are installed via brew
for i in ${php_array[*]}; do
    if [[ -n "$(brew ls --versions "$i")" ]]; then
        php_installed_array+=("$i")
        if [[ $1 == ${i:4:3} ]]; then
            php_major=1
        fi
    fi
done

if [[ 1 == $php_major ]]; then
    ln_version=${php_version:4:1}
else
    ln_version="${php_version:4:1}${php_version:6:1}"
fi

# Check that the requested version is supported
if [[ " ${php_array[*]} " == *"$php_version"* ]]; then
    # Check that the requested version is installed
    if [[ " ${php_installed_array[*]} " == *"$php_version"* ]]; then
        echo "ln to $php_version"
        echo "ln your shell"

        ln -sf "$php_opt_path$php_version/bin/pear" "$brew_prefix/bin/pear${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/peardev" "$brew_prefix/bin/peardev${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/pecl" "$brew_prefix/bin/pecl${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/phar" "$brew_prefix/bin/phar${ln_version}"

        ln -sf "$php_opt_path$php_version/bin/php" "$brew_prefix/bin/php${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/php-cgi" "$brew_prefix/bin/php-cgi${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/php-config" "$brew_prefix/bin/php-config${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/phpdbg" "$brew_prefix/bin/phpdbg${ln_version}"
        ln -sf "$php_opt_path$php_version/bin/phpize" "$brew_prefix/bin/phpize${ln_version}"
        # composer
        cat <<EOF >"$brew_prefix/bin/composer${ln_version}"
#!/bin/bash
PATH=$php_opt_path$php_version/bin:\$PATH
/opt/homebrew/opt/composer/bin/composer \$*
EOF
        chmod +x "$brew_prefix/bin/composer${ln_version}"

        echo
        echo "    php${ln_version} -v"
        echo "    php-config${ln_version} --php-binary"
        echo "    composer${ln_version} -V"
        echo
    fi

    echo "All done!"
else
    echo "Unknown version of PHP. PHP Link can only handle arguments of:" ${brew_array[@]}
fi
