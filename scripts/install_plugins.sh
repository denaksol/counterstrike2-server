mkdir -p logs
rm -rf ./logs/plugins.txt
touch ./logs/plugins.txt
find ./plugins -maxdepth 1 -type f -executable -name '*.sh' -exec sh -c '{} >> ./logs/plugins.txt 2>&1' \;