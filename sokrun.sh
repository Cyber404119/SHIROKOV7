#!/bin/bash

# Warna Cuy
yellow='\033[33;1m'
blue='\033[34;1m'
cyan='\033[36;1m'

clear

echo -e "${blue}
██████╗ ███████╗████████╗██╗  ██╗ ██████╗ ███████╗
██╔══██╗██╔════╝╚══██╔══╝██║  ██║██╔═══██╗██╔════╝
██████╔╝█████╗     ██║   ███████║██║   ██║█████╗  
██╔═══╝ ██╔══╝     ██║   ██╔══██║██║   ██║██╔══╝  
██║     ███████╗   ██║   ██║  ██║╚██████╔╝███████╗
╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
"
echo -e "${yellow} Author : By.Thonxyzz404 "

# Teks motivasi
echo -e "${cyan}"
teks1="Haii Selamat Datang Di Shiroko Versi Generasi Toolsv7 !! "
teks2="Saya Akan Membantu Kamu Dalam Kesulitan!! Hidup Inii !! "
teks3="Saya Akan Memberikan Nasihat Kepada Kamu Agar Kamu Lebih Semangat Dalam Menjalankan Hidup Ini !! "
teks4="Motivasi Hari Ini : Janganlah Kamu Mengejar Sesuatu Yang Tidak Pasti Bagimu !! "
teks5="Janganlah Pernah Putus Asaa Mau Sesusah Apapun Ujianmu Dan Pantanganmu Ingat Keberhasilan Bkn Di Awall Tetapi Keberhasilan Adalah Tepatnya Di Ahkirr !! "
teks6="Ingat Ingat Bro Jangan Merasa Paling Sombong Dengan Segala Apapun Di Atas Langit Masih Ada Langit Bro !! "
teks7="Kamu Gagall Dalam Percintaan?? Ingat Kata² Amon Lebih Baik Di Takutii Daripada Di Cintaii !! "
teks8="Lanjutkan Bro!! Kamu Pasti Bisa Dalam Segala Hal Apapun : BY THONXYZZ404 "

# Fungsi animasi teks
print_sementara() {
  text=$1
  delay=${2:-0.05}
  for ((i=0; i<${#text}; i++)); do
    echo -n "${text:i:1}"
    sleep $delay
  done
  echo
}

# Tampilkan teks dengan animasi
print_sementara "$teks1"
sleep 2
print_sementara "$teks2"
sleep 2
print_sementara "$teks3"
sleep 2
print_sementara "$teks4"
sleep 2
for i in {1..1}; do
  print_sementara "Terimakasih Sudah Mendengarkan Nasihat Dari Generasi Toolsv7 !! "
  sleep 2
done
print_sementara "$teks5"
sleep 2

# Memblokir sebelum menutup
read -p "Tekan Enter untuk keluar..."
