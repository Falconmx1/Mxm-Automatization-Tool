#!/bin/bash
clear
echo -e "\033[0;36m🐳 UTILIDADES DOCKER\033[0m"
echo "======================="
echo -e "\033[0;33m1. Instalar Docker (proot-distro)\033[0m"
echo -e "\033[0;33m2. Ver contenedores\033[0m"
echo -e "\033[0;33m3. Volver\033[0m"
read -p "➜ Opción: " opt

case $opt in
    1)
        pkg install proot-distro -y
        proot-distro install ubuntu
        echo -e "\033[0;32m✅ Ubuntu instalado. Ejecuta: proot-distro login ubuntu\033[0m"
        ;;
    2)
        echo -e "\033[0;32m📦 Contenedores disponibles:\033[0m"
        proot-distro list
        ;;
    3) exit ;;
esac
read -p "Presiona Enter para continuar..."
