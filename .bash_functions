# load functions shared by bash & zsh.
for file in ~/.{functions}; do
	[ -r "$file" ] && source "$file"
done


## Perl String Replace In File (bash)
#
# use: str_replaceInFile "find" "replace" "file"
#
function str_replaceInFile() {

    search=$(perl -e "print quotemeta('$1')")
    replace=$(perl -e "print quotemeta('$2')")

    perl -p -i -e 's/'"$search/$replace"'/g' $3
}
export -f str_replaceInFile

## String Find-In-File (bash)
#
# use: str_findInFile "find" "file"
#
function str_findInFile() {
    search=$(perl -e "print quotemeta('$1')")
    file=$2
    perl -n -e 'while(/'$search[^\"]+'/g){print "$&\n";}' $file
}
export -f str_findInFile


