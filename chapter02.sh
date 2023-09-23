# chapter 2: UNIXコマンド

fname='data/popular-names.txt'

## 10. 行数のカウント
## https://nlp100.github.io/ja/ch02.html#10-%E8%A1%8C%E6%95%B0%E3%81%AE%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88
echo -e '\n10. 行数のカウント\n'

wc -l $fname

echo -e '\ndone'

## 11. タブをスペースに置換
## https://nlp100.github.io/ja/ch02.html#11-%E3%82%BF%E3%83%96%E3%82%92%E3%82%B9%E3%83%9A%E3%83%BC%E3%82%B9%E3%81%AB%E7%BD%AE%E6%8F%9B
echo -e '\n11. タブをスペースに置換\n'

fname_11='data/popular-names_11.txt'
sed -e 's/\t/ /g' $fname > $fname_11

echo 'done'

## 12. 1列目をcol1.txtに, 2列目をcol2.txtに保存
## https://nlp100.github.io/ja/ch02.html#12-1%E5%88%97%E7%9B%AE%E3%82%92col1txt%E3%81%AB2%E5%88%97%E7%9B%AE%E3%82%92col2txt%E3%81%AB%E4%BF%9D%E5%AD%98
echo -e '\n12. 1列目をcol1.txtに, 2列目をcol2.txtに保存\n'

awk -F'\t' '{print $1}' data/popular-names.txt > data/col1.txt
awk -F'\t' '{print $2}' data/popular-names.txt > data/col2.txt

echo 'done'

## 13. col1.txtとcol2.txtをマージ
## https://nlp100.github.io/ja/ch02.html#13-col1txt%E3%81%A8col2txt%E3%82%92%E3%83%9E%E3%83%BC%E3%82%B8
echo -e '\n13. col1.txtとcol2.txtをマージ\n'

paste -d '\t' data/col1.txt data/col2.txt > data/col_1_2.txt

echo 'done'

## 14. 先頭からN行を出力
## https://nlp100.github.io/ja/ch02.html#14-%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89n%E8%A1%8C%E3%82%92%E5%87%BA%E5%8A%9B
echo -e '\n14. 先頭からN行を出力\n'

function headN() {
    head -n $1 $fname
}

headN 3


echo -e '\ndone'

## 15. 末尾のN行を出力
## https://nlp100.github.io/ja/ch02.html#15-%E6%9C%AB%E5%B0%BE%E3%81%AEn%E8%A1%8C%E3%82%92%E5%87%BA%E5%8A%9B
echo -e '\n15. 末尾のN行を出力\n'

function tailN() {
    tail -n $1 $fname
}

tailN 3

echo -e '\ndone'

## 16. ファイルをN分割する
## https://nlp100.github.io/ja/ch02.html#16-%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92n%E5%88%86%E5%89%B2%E3%81%99%E3%82%8B
echo -e '\n16. ファイルをN分割する\n'

function split_file() {
    split -n l/$1 $fname $fname. -a 4
}

split_file 5

wc -l $fname.aa*

echo -e '\ndone'

## 17. １列目の文字列の異なり
## https://nlp100.github.io/ja/ch02.html#17-%EF%BC%91%E5%88%97%E7%9B%AE%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%AE%E7%95%B0%E3%81%AA%E3%82%8A
echo -e '\n17. １列目の文字列の異なり\n'

awk -F'\t' '{print $1}' $fname | sort | uniq | head -n 3

echo -e '\ndone'

## 18. 各行を3コラム目の数値の降順にソート
## https://nlp100.github.io/ja/ch02.html#18-%E5%90%84%E8%A1%8C%E3%82%923%E3%82%B3%E3%83%A9%E3%83%A0%E7%9B%AE%E3%81%AE%E6%95%B0%E5%80%A4%E3%81%AE%E9%99%8D%E9%A0%86%E3%81%AB%E3%82%BD%E3%83%BC%E3%83%88
echo -e '\n18. 各行を3コラム目の数値の降順にソート\n'

sort -r -n -k 3 $fname | head -n 10

echo -e '\ndone'

## 19. 各行の1コラム目の文字列の出現頻度を求め, 出現頻度の高い順に並べる
## https://nlp100.github.io/ja/ch02.html#19-%E5%90%84%E8%A1%8C%E3%81%AE1%E3%82%B3%E3%83%A9%E3%83%A0%E7%9B%AE%E3%81%AE%E6%96%87%E5%AD%97%E5%88%97%E3%81%AE%E5%87%BA%E7%8F%BE%E9%A0%BB%E5%BA%A6%E3%82%92%E6%B1%82%E3%82%81%E5%87%BA%E7%8F%BE%E9%A0%BB%E5%BA%A6%E3%81%AE%E9%AB%98%E3%81%84%E9%A0%86%E3%81%AB%E4%B8%A6%E3%81%B9%E3%82%8B
echo -e '\n19. 各行の1コラム目の文字列の出現頻度を求め, 出現頻度の高い順に並べる\n'

awk -F'\t' '{print $1}' $fname | sort | uniq -c | sort -r -n -k 1 | head -n 10

echo -e '\ndone'