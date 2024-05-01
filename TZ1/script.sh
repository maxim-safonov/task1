#!/bin/bash
#обозначим директории как input_dir и output_dir

input_dir="$1" 
output_dir="$2"
                                                
#скопируем все вложенные файлы в "массив"

files=$(find "$input_dir" -type f)

# заведем глобальный счетчик
i=-1

# пойдем циклом for по всем файлам

for file in $files; do
    # получим имя файла
    name=$(basename "$file")
    
    # составим новый пусть в выходную директорию
    new_path="${output_dir}/${i}-${name}"
     
    ((i++))
    # и теперь сделаем, пусть это будет наше новое имя
    cp "$file" "$new_path"
done

# То есть мы взяли имя каждого файла и перезаписали как "глобальный счетчик-" "исходное имя"


# Выведем дополнительные параметры
echo "Список файлов в $1:"

find "$input_dir" -maxdepth 1 -type f -exec basename {} \;

echo "Список директорий в $1:"

find "$input_dir" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;

echo "Список всех вложенных файлов:"


find "$input_dir" -type f -exec basename {} \;

