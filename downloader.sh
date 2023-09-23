mkdir -p data

# chapter 2
wget -O data/popular-names.txt https://nlp100.github.io/data/popular-names.txt

# chapter 3
wget -O data/jawiki-country.json.gz https://nlp100.github.io/data/jawiki-country.json.gz
gzip -f -d data/jawiki-country.json.gz