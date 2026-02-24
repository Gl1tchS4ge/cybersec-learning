#!/bin/zsh 

read "TARGET?Enter target ip or domain: " 
read "URL?Enter target URL (https://example.com): "  
OUTDIR="$HOME/Desktop/reports/$TARGET"

for tool in gobuster nmap; do 
    if ! which $tool &>/dev/null; then 
        echo "$tool not found" 
    fi 
done 

mkdir -p $OUTDIR
touch $OUTDIR/report.md

echo "# Recon Report - $TARGET" >> $OUTDIR/report.md 

echo "## nmap" >> $OUTDIR/report.md
sudo nmap -sV -sS -F $TARGET >> $OUTDIR/report.md 

echo "## gobuster" >> $OUTDIR/report.md
gobuster dir -u $URL -w /usr/share/seclists/Discovery/Web-Content/common.txt >> $OUTDIR/report.md 

cat $OUTDIR/report.md
