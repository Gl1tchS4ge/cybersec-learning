#!/bin/zsh 

read "TARGET?Enter target ip or domain: " 
read "URL?Enter target URL (https://example.com): "  
OUTDIR="$HOME/Desktop/reports/$TARGET"

for tool in gobuster nmap; do 
    if ! which $tool &>/dev/null; then 
        echo "$tool not found" 
    fi 
done 

echo "\nSelect tools to run:"
echo "  1) nmap only"
echo "  2) gobuster only"
echo "  3) both"
read "CHOICE?Enter choice [1-3]: "

mkdir -p $OUTDIR
touch $OUTDIR/report.md

echo "# Recon Report - $TARGET" >> $OUTDIR/report.md 

run_nmap() {
    echo "## nmap" >> $OUTDIR/report.md
    sudo nmap -sV -sS -F $TARGET >> $OUTDIR/report.md 
}

run_gobuster() {
    echo "## gobuster" >> $OUTDIR/report.md
    gobuster dir -u $URL -w /usr/share/seclists/Discovery/Web-Content/common.txt >> $OUTDIR/report.md 
}

case $CHOICE in
    1) run_nmap ;;
    2) run_gobuster ;;
    3) run_nmap; run_gobuster ;;
    *) echo "Invalid choice, exiting."; exit 1 ;;
esac

cat $OUTDIR/report.md
