#!/bin/zsh

read "TARGET?Enter target IP or domain: "
read "URL?Enter target URL (https://example.com): "

OUTDIR="$HOME/Desktop/reports/$TARGET"
REPORT="$OUTDIR/report.md"

missing=0
for tool in gobuster nmap; do
    if ! which $tool &>/dev/null; then
        echo "$tool not found"
        missing=1
    fi
done

echo "\nSelect tools to run:"
echo "  1) nmap only"
echo "  2) gobuster only"
echo "  3) both"
read "CHOICE?Enter choice [1-3]: "

if [[ $missing -eq 1 ]]; then
    echo "One or more required tools are missing. Please install them and retry."
    exit 1
fi

mkdir -p "$OUTDIR"
echo "# Recon Report - $TARGET" > "$REPORT"

run_nmap() {
    echo "\n## Nmap" >> "$REPORT"
    echo "Scan started: $(date)" >> "$REPORT"
    sudo nmap -sV -sS -F "$TARGET" >> "$REPORT"
}

run_gobuster() {
    echo "\n## Gobuster" >> "$REPORT"
    echo "Scan started: $(date)" >> "$REPORT"
    local wordlist="/usr/share/seclists/Discovery/Web-Content/common.txt"
    if [[ ! -f "$wordlist" ]]; then
        echo "Wordlist not found: $wordlist" | tee -a "$REPORT"
        return 1
    fi
    gobuster dir -u "$URL" -w "$wordlist" >> "$REPORT"
}

case $CHOICE in
    1) run_nmap ;;
    2) run_gobuster ;;
    3) run_nmap; run_gobuster ;;
    *) echo "Invalid choice, exiting."; exit 1 ;;
esac

echo "\n--- Scan complete ---"
cat "$REPORT"
