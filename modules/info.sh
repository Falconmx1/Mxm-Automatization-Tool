#!/bin/bash
clear
echo -e "\033[0;35m📱 INFORMACIÓN DEL DISPOSITIVO\033[0m"
echo "=============================="
echo -e "\033[0;36m📌 Usuario:\033[0m $(whoami)"
echo -e "\033[0;36m🖥️  Hostname:\033[0m $(hostname)"
echo -e "\033[0;36m💾 RAM libre:\033[0m $(free -h | awk '/Mem:/ {print $4}')"
echo -e "\033[0;36m💿 Almacenamiento:\033[0m $(df -h $HOME | awk 'NR==2 {print $4}')"
echo -e "\033[0;36m🔋 Batería (si es Android):\033[0m"
termux-battery-status 2>/dev/null || echo "No disponible"
echo -e "\033[0;36m🌐 IP local:\033[0m $(ifconfig wlan0 2>/dev/null | grep inet | awk '{print $2}')"
echo -e "\033[0;36m📡 IP pública:\033[0m $(curl -s ifconfig.me 2>/dev/null || echo 'Sin internet')"
read -p "Presiona Enter para continuar..."
