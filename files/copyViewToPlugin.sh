#!/bin/sh

# set argument name viewPath
viewPath=$1

# check if viewPath contains a text "Resources"
if [[ $viewPath != *"Resources"* ]]; then
  echo "View path is not correct. Please check the path."
  exit 1
fi

# get string after text "Resources" from viewPath and set it to viewName
viewName=${viewPath#*"Resources"}

# get directories of the current path and save to array
dirs=($(ls -d */))

# show the list of directories as options to select and save selected directory to variable
select dir in "${dirs[@]}"
do
    # if user selected a directory
    if [ -n "$dir" ]; then
      #add string to the end of the path
      dir="/home/brtsos/proj/sw/src/custom/plugins/"$dir"src/Resources"$viewName
      # get folder path without file path from viewPath and save it to folderPaths
      folderPath=${dir%/*}
      echo
      #create folder if not exist
      if [ ! -d "$folderPath" ]; then
        mkdir -p $folderPath
      fi
      # copy view to folder if not exist
      if [ ! -f "$dir" ]; then
        cp -r $viewPath $dir

        # get string after text "storefront" from viewPath and set it to variable
        twigExtendsPath=${viewPath#*"views"}

        echo $twigExtendsPath

        #prepend a text on the beginning of the file
        echo "{% sw_extends '@@Storefront"$twigExtendsPath"' %}" >> $dir
        echo "#############################################################################"
        echo "########         MOVE SW EXTEND FROM END TO TOP THE FILE!            ########"
        echo "#############################################################################"

        echo "View copied to plugin";
        echo $dir;
        exit 0
      else
        echo "View already exists in plugin";
        echo $dir;
        exit 1
      fi

    fi
done



