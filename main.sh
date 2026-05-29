#!/bin/bash

# Fadile Çolak

# 2420171040

# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=pKmhqJpL64

# https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=VP1cglrP8X

# file:///C:/Users/Fadile/OneDrive%20-%20istinye%20%C3%BCniversitesi/Masa%C3%BCst%C3%BC/5d9d77e0-a565-41cb-8317-0b87896bd672.pdf

LOG_FILE="report.log"

echo "Rapor Başlangıç Tarihi: $(date -Iseconds)" > $LOG_FILE

echo "=== ISLEMCI ===" >> $LOG_FILE

wmic cpu get name >> $LOG_FILE

echo "=== RAM ===" >> $LOG_FILE

wmic memorychip get capacity >> $LOG_FILE

echo "=== ANAKART ===" >> $LOG_FILE

wmic baseboard get product,manufacturer >> $LOG_FILE

echo "=== UUID ===" >> $LOG_FILE

wmic csproduct get uuid >> $LOG_FILE

echo "=== DISK ===" >> $LOG_FILE

wmic diskdrive get model >> $LOG_FILE

echo "=== MAC ===" >> $LOG_FILE

getmac >> $LOG_FILE

read -sp "Parola giriniz: " PAROLA

echo ""

gpg --batch --yes --passphrase "$PAROLA" -c --cipher-algo AES256 report.log

rm report.log

echo "Sifreleme tamamlandi."

echo "=== TXT DOSYALARI ===" >> $LOG_FILE
find . -name "*.txt" >> $LOG_FILE

echo "=== ILK 5 SATIR ===" >> $LOG_FILE
head -5 main.sh >> $LOG_FILE

echo "=== SON 5 SATIR ===" >> $LOG_FILE
tail -5 main.sh >> $LOG_FILE

echo "=== PIPE ORNEGI ===" >> $LOG_FILE
type main.sh | sort | uniq >> $LOG_FILE
