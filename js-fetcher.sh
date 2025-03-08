
#!/bin/bash

# Prompt user for input file containing JS URLs
read -p "Enter the file containing JavaScript URLs: " js_file

# Check if file exists
if [[ ! -f "$js_file" ]]; then
    echo "File not found!"
    exit 1
fi

# Step 1: Filter valid JavaScript URLs using httpx
echo "[*] Checking valid JavaScript URLs..."
httpx -silent -mc 200 -title -content-type -nc -l "$js_file" | grep "application/javascript" | awk '{print $1}' > valid_js.txt

# Step 2: Clean the URLs (Remove unwanted encoding)
echo "[*] Cleaning URLs..."
cat valid_js.txt | awk '{print $1}' | sed 's/%20/ /g' > clean_valid_js.txt

# Step 3: Create a directory for JS files
mkdir -p js-files

# Step 4: Download JavaScript files
echo "[*] Downloading JavaScript files..."
cat clean_valid_js.txt | xargs -I{} wget --no-check-certificate -P js-files {}

echo "[✔] JavaScript files downloaded in the 'js-files' folder!"
