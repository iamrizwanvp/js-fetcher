# js-fetcher
Download your target js files in your local system after you can analyze and review them for sensitive leak or hidden endpoints

# Usage

run bash js-fetcher.sh 
enter your path file of js like /root/target/targetjs.txt 
the js files will downlaod and save your local machine folder named js-files
you can review them eaily 

# Example usage

waybackurls target.com > wayback.txt
cat wayback.txt | grep .js$ targetjs.txt
bash js-fetcher.sh /root/targetjs.txt


Simple but powerful you can get sometimes P1 bugs 
Enjoy Hacking !
