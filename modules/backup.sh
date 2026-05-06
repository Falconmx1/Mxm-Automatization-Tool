#!/bin/bash
BACKUP_DIR="$HOME/storage/shared/MxmBackups"
mkdir -p "$BACKUP_DIR"
clear
echo -e "\033[0;32m💾 RESPALDO DE ARCHIVOS\033[0m"
echo "======================"
echo -e "\033[0;33m📁 Directorio actual: $HOME\033[0m"
echo -e "\033[0;33m🗂️  Carpeta a respaldar: \033[0m"
read -p "➜ Nombre: " folder
date=$(date +%Y%m%d_%H%M%S)
backup_file="$BACKUP_DIR/backup_${folder}_${date}.tar.gz"
tar -czf "$backup_file" "$HOME/$folder" 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "\033[0;32m✅ Respaldo creado: $backup_file\033[0m"
else
    echo -e "\033[0;31m❌ Error: La carpeta '$folder' no existe\033[0m"
fi
read -p "Presiona Enter para continuar..."
