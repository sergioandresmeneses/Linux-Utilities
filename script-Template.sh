#!/bin/bash
#
# @Author:
# @Version:
#
# @Description:
#
# @Usage:

#Define your local IFS, this default value is a blank space
#A custom example for reference: IFS="\040\t\n"
OLDIFS=$IFS
IFS=' '

#Reset of the PATH variable
OLDPATH="$PATH"
PATH=/bin:/usr/bin
export PATH

error(){
  echo "$@" 1>&2
  usage_and_exit 1
}

usage(){
  echo "Usage: $SCRIPT [--all] [--help] [--version] envvar pattern(s)"
}

usage_and_exit(){
  usage
  exit $1
}

version(){
  echo "$SCRIPT version $VERSION"
}

if [ $# -eq "0" ] ; then
  error "No options provided"
fi

while test $# -gt 0; do
  case $1 in
    --help )
      usage
      ;;
    --version )
      version
      ;;
    * )
      usage
      ;;
  esac
  shift
done

## Restore of the old Environment Variables after the execution of the script
IFS=$OLDIFS
PATH="$OLDPATH"
export PATH
