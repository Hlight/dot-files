# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh
    else
        local arg=-sh
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@"
    else
        du $arg .[^.]* *
    fi
}

# Use Git’s colored diff when available
# hash git &>/dev/null
# if [ $? -eq 0 ]; then
#     function diff() {
#         git diff --no-index --color-words "$@"
#     }
# fi

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# # Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# # Start a PHP server from a directory, optionally specifying the port
# # (Requires PHP 5.4.0+.)
# function phpserver() {
#     local port="${1:-4000}"
#     local ip=$(ipconfig getifaddr en1)
#     sleep 1 && open "http://${ip}:${port}/" &
#     php -S "${ip}:${port}"
# }
function phpserver() {
    local port="${1:-4000}"
    local ip="${2:-0.0.0.0}"
    #local ip=$(ipconfig getifaddr en1)
    sleep 1 && open "http://${ip}:${port}/" & # OSX
    # sleep 1 && x-www-browser "http://${ip}:${port}/" & # ubuntu
    php -S "${ip}:${port}"
}

# Get gzipped file size
function gz() {
    echo "orig size (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
    encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript
    else # pipe
        python -mjson.tool | pygmentize -l javascript
    fi
}

# All the dig info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    echo # newline
}

# Get a character’s Unicode code point
function codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
    echo # newline
}

## SVN
# If confined to a Linux console I find it very helpful to put the following function in my .bashrc
# svndiff() { vimdiff <(svn cat "$1") "$1";  }
# The command
# svndiff MyFile.txt
# will then open vimdiff and show you the differences side-by-side.
svndiff() { vimdiff <(svn cat "$1") "$1";  }


## Perl String Replace In File
#
# use: str_replaceInFile "find" "replace" "file"
#
function str_replaceInFile() {

    search=$(perl -e "print quotemeta('$1')")
    replace=$(perl -e "print quotemeta('$2')")

    perl -p -i -e 's/'"$search/$replace"'/g' $3
}
export -f str_replaceInFile

## String Find-In-File
#
# use: str_findInFile "find" "file"
#
function str_findInFile() {
    search=$(perl -e "print quotemeta('$1')")
    file=$2
    perl -n -e 'while(/'$search[^\"]+'/g){print "$&\n";}' $file
}
export -f str_findInFile


## A helper function to launch docker container using mattrayner/lamp with overrideable parameters
#
# $1 - Apache Port (optional)
# $2 - MySQL Port (optional - no value will cause MySQL not to be mapped)
function launchdockerwithparams {
    APACHE_PORT=80
    MYSQL_PORT_COMMAND=""
    
    if ! [[ -z "$1" ]]; then
        APACHE_PORT=$1
    fi
    
    if ! [[ -z "$2" ]]; then
        MYSQL_PORT_COMMAND="-p \"$2:3306\""
    fi

    docker run -i -t -p "$APACHE_PORT:80" $MYSQL_PORT_COMMAND -v ${PWD}/app:/app -v ${PWD}/mysql:/var/lib/mysql mattrayner/lamp:latest
}
alias launchdocker='launchdockerwithparams $1 $2'
alias ldi='launchdockerwithparams $1 $2'



########
# https://stackoverflow.com/a/1850490
function llperms() {
  ls -l | awk '{
    k = 0
    s = 0
    for( i = 0; i <= 8; i++ )
    {
        k += ( ( substr( $1, i+2, 1 ) ~ /[rwxst]/ ) * 2 ^( 8 - i ) )
    }
    j = 4 
    for( i = 4; i <= 10; i += 3 )
    {
        s += ( ( substr( $1, i, 1 ) ~ /[stST]/ ) * j )
        j/=2
    }
    if ( k )
    {
        printf( "%0o%0o ", s, k )
    }
    print
}'  
}