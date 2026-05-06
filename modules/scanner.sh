#!/bin/bash
clear
echo -e "\033[0;34m🔍 ESCÁNER DE RED/PUERTOS\033[0m"
echo "========================"
echo -e "\033[0;33m1. Escaneo de red local\033[0m"
echo -e "\033[0;33m2. Escaneo de puertos (IP específica)\033[0m"
echo -e "\033[0;33m3. Volver\033[0m"
read -p "➜ Opción: " opt

case $opt in
    1)
        ip=$(ifconfig wlan0 2>/dev/null | grep inet | awk '{print $2}' | cut -d'.' -f1-3)
        echo -e "\033[0;32m📡 Escaneando red $ip.0/24...\033[0m"
        for i in {1..254}; do
            ping -c 1 -W 1 $ip.$i > /dev/null 2>&1 && echo "✓ Host activo: $ip.$i" &
        done
        wait
        ;;
    2)
        read -p "🌐 Ingresa IP: " target
        read -p "🔌 Puerto inicial: " start_port
        read -p "🔌 Puerto final: " end_port
        echo -e "\033[0;32m🔎 Escaneando puertos del $start_port al $end_port...\033[0m"
        for port in $(seq $start_port $end_port); do
            (echo >/dev/tcp/$target/$port) 2>/dev/null && echo "✅ Puerto $port abierto" &
        done
        wait
        ;;
    3) exit ;;
esac
read -p "Presiona Enter para continuar..."
