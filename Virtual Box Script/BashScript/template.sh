#! /bin/bash
echo "Genel Kurulumlar"

# User Variable
UPDATED="Güncelleme"
CLEANER="Temizleme"
INSTALL="Yükleme"
DELETED="Silme"
WHICH="Nerede ?"

# System Variable

# Updated
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Güncelleme istiyor musunuz  E/H ?" updatedResult
if [[ $updatedResult == "E" || $updatedResult == "e"  ]]
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudoa apt-get upgrade -y
else
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi

# Yükleme
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Yükleme istiyor musunuz  E/H ?" installingResult
if [[ $installingResult == "E" || $installingResult == "e"  ]]
then
    echo -e "Yükleme Başlandı... "  
    
else
     echo -e "Yükleme Yapılmadı!!!\n "   
fi


# Temizleme
sleep 2
echo -e "\n### ${CLEANER} ###"
echo -e "\nSistem Temizliği istiyor musunuz ? E/H" cleanResult
if [[ $cleanResult == "E" || $cleanResult == "e"  ]]
then
    echo -e "Temizlik Başlandı... "  
    sudo apt-get clean
    sudo apt-get autoremove -y
else
     echo -e "Temizlik Yapılmadı!!!\n "   
fi

