#!/bin/bash
clear
echo -e "\033[0;33m🧹 LIMPIEZA DE SISTEMA\033[0m"
echo "========================"
echo -e "\033[0;32m🗑️  Limpiando caché de Termux...\033[0m"
rm -rf $HOME/.cache/*
echo -e "\033[0;32m🗑️  Limpiando historial de comandos...\033[0m"
history -c
rm -f $HOME/.bash_history
echo -e "\033[0;32m🗑️  Limpiando archivos temporales...\033[0m"
rm -rf $PREFIX/tmp/*
echo -e "\033[0;32m✅ Limpieza completada!\033[0m"
read -p "Presiona Enter para continuar..."
