#!/bin/bash
input_dir="$1"
output_dir="$2"

files=$(find "$input_dir" -type f)

i=-1

for file in $files; do
    name=$(basename "$file")

    ((i++))

    new_path="${output_dir}/${name}_${i}"
    
    cp "$file" "$new_path"
done



echo "Список файлов в $1:"

find "$input_dir" -maxdepth 1 -type f -exec basename {} \;

echo "Список директорий в $1:"

find "$input_dir" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;

echo "Список всех вложенных файлов:"

find "$input_dir" -type f -exec basename {} \;

