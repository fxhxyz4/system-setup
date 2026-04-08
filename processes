#!/bin/bash
 
HOME_DIR="$HOME"
DOCS_DIR="$HOME/Documents"

if [ ! -d "$DOCS_DIR" ]; then
    mkdir "$DOCS_DIR"
    echo "Каталог $DOCS_DIR створено."
else
    echo "Каталог $DOCS_DIR вже існує."
fi

echo ""
echo "--- Завдання 1: ls -la > ~/contents.txt ---"

ls -la > "$HOME_DIR/contents.txt"
echo "Файл contents.txt створено. Вміст:"

cat "$HOME_DIR/contents.txt"
 
echo ""
echo "--- Завдання 2: sort contents.txt >> contents-sorted.txt ---"
sort "$HOME_DIR/contents.txt" >> "$HOME_DIR/contents-sorted.txt"

echo "Файл contents-sorted.txt (перші 5 рядків):"
head -5 "$HOME_DIR/contents-sorted.txt"
 
echo ""
echo "--- Завдання 3: tail -10 /etc/passwd > ~/Documents/passwd_tail.txt ---"
tail -10 /etc/passwd > "$DOCS_DIR/passwd_tail.txt"

echo "Вміст passwd_tail.txt:"
cat "$DOCS_DIR/passwd_tail.txt"
 
echo ""
echo "--- Завдання 4: wc -w contents.txt >> ~/field2.txt ---"
wc -w "$HOME_DIR/contents.txt" >> "$HOME_DIR/field2.txt"
echo "Вміст field2.txt:"
cat "$HOME_DIR/field2.txt"
 
#  Перші 5 рядків /etc/passwd, сортування у зворотному порядку
echo ""
echo "--- Завдання 5: head -5 /etc/passwd | sort -r ---"
head -5 /etc/passwd | sort -r
 
# Підрахувати кількість символів в останніх 9 рядках contents.txt
echo ""
echo "--- Завдання 6: tail -9 contents.txt | wc -c ---"

CHARS=$(tail -9 "$HOME_DIR/contents.txt" | wc -c)
echo "Кількість символів в останніх 9 рядках contents.txt: $CHARS"
 
# Підрахувати файли з назвою 'test' в /usr/share
echo ""
echo "--- Завдання 7: find /usr/share -name 'test' | wc -l ---"
COUNT=$(find /usr/share -name "test" 2>/dev/null | wc -l)
echo "Кількість файлів 'test' у /usr/share: $COUNT"
 
