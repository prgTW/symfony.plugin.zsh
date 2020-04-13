# Basic command completion

_symfony_console() {
    if [[ -x "$dir/symfony" ]]; then
        # local Symfony Client
        echo "$dir/symfony console"
        return 0;
    elif command -v symfony >/dev/null 2>&1; then
        # Symfony Client in PATH
        echo "$(command -v symfony) console"
        return 0;
    fi

    dir="$PWD";

    # Upward search
    while ((1)); do

        if [[ -f "$dir/bin/console" ]]; then
            # Symfony 3 + 4
            echo "php $dir/bin/console";
            return 0;
        elif [[ -f "$dir/app/console" ]]; then
            # Symfony 2
            echo "php $dir/app/console";
            return 0;
        fi

        [[ "$dir" == '' ]] && break;

        dir="${dir%/*}";
    done

    return 1;
}

_symfony_xdebug_console () {
  echo "php -dxdebug.remote_autostart=1 `_symfony_console_script`"
}

_symfony2_get_command_list () {
   `_symfony_console` --no-ansi | sed "1,/Available commands/d" | awk '/^  ?[^ ]+ / { print $1 }'
}

_symfony2 () {
   compadd `_symfony2_get_command_list`
}

compdef _symfony2 '`_symfony_console`'
compdef _symfony2 'app/console'
compdef _symfony2 'bin/console'
compdef _symfony2 'sf'
compdef _symfony2 'sfdev'
compdef _symfony2 'sfprod'
compdef _symfony2 'sfx'
compdef _symfony2 'sfxdev'
compdef _symfony2 'sfxdev'

#Alias
alias sf='`_symfony_console`'
alias sfcl='sf cache:clear'
alias sfsr='sf server:run -vvv'
alias sfcw='sf cache:warmup'
alias sfroute='sf debug:router'
alias sfcontainer='sf debug:container'
alias sfgb='sf generate:bundle'
alias sfdev='sf --env=dev'
alias sfprod='sf --env=prod'

#Xdebug enabled aliases (useful for debugging purposes)
alias sfx='`_symfony_xdebug_console`'
alias sfxcl='sfx cache:clear'
alias sfxcw='sfx cache:warmup'
alias sfxdev='sfx --env=dev'
