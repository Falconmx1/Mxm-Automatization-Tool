#!/bin/bash

# ============================================
# MXM AUTOMATION TOOL - Termux Edition
# Author: Ese Bro
# Version: 1.0
# ============================================

# Colores chingones
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[0;33m'
AZUL='\033[0;34m'
MORADO='\033[0;35m'
CYAN='\033[0;36m'
BLANCO='\033[0;37m'
RESET='\033[0m'

# Directorios
MODULES_DIR="modules"
CONFIG_DIR="config"
CONFIG_FILE="$CONFIG_DIR/settings.conf"

# Función para mostrar banner
banner() {
    clear
    echo -e "${ROJO}"
    echo "  ███╗   ███╗ ╚██╗██╔╝ ██████╗ ███╗   ███╗"
    echo "  ████╗ ████║  ╚███╔╝  ██╔══██╗████╗ ████║"
    echo "  ██╔████╔██║  ███╔╝   ██████╔╝██╔████╔██║"
    echo "  ██║╚██╔╝██║ ███╔╝    ██╔══██╗██║╚██╔╝██║"
    echo "  ██║ ╚═╝ ██║███████╗  ██████╔╝██║ ╚═╝ ██║"
    echo "  ╚═╝     ╚═╝╚══════╝  ╚═════╝ ╚═╝     ╚═╝"
    echo -e "${RESET}"
    echo -e "${CYAN}    Automatization Tool v1.0 - Termux${RESET}"
    echo -e "${AMARILLO}    Creado por: Mfalconh${RESET}"
    echo "==========================================="
}

# Menú principal
menu() {
    echo -e "${VERDE}[1]${RESET} 🔍 Escáner de red/puertos"
    echo -e "${VERDE}[2]${RESET} 💾 Respaldo de archivos"
    echo -e "${VERDE}[3]${RESET} 🧹 Limpieza de sistema"
    echo -e "${VERDE}[4]${RESET} 📱 Información del dispositivo"
    echo -e "${VERDE}[5]${RESET} 🐳 Utilidades Docker"
    echo -e "${VERDE}[6]${RESET} ⚙️ Configuración"
    echo -e "${VERDE}[7]${RESET} ℹ️ Acerca de"
    echo -e "${ROJO}[0]${RESET} ❌ Salir"
    echo "==========================================="
}

# Función para cargar configuración
load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        echo -e "${AMARILLO}⚠️ No se encontró configuración, usando valores por defecto${RESET}"
        BACKUP_DIR="$HOME/storage/shared/MxmBackups"
        LOG_FILE="$HOME/.mxm_log"
    fi
}

# Función para ejecutar módulos
run_module() {
    local module=$1
    if [ -f "$MODULES_DIR/$module" ]; then
        bash "$MODULES_DIR/$module"
    else
        echo -e "${ROJO}❌ Módulo no encontrado: $module${RESET}"
        sleep 2
    fi
}

# Main loop
main() {
    load_config
    while true; do
        banner
        menu
        echo -n -e "${CYAN}➜ Selecciona una opción: ${RESET}"
        read opcion
        
        case $opcion in
            1) run_module "scanner.sh" ;;
            2) run_module "backup.sh" ;;
            3) run_module "cleaner.sh" ;;
            4) run_module "info.sh" ;;
            5) run_module "docker.sh" ;;
            6) nano "$CONFIG_FILE" ;;
            7) 
                echo -e "${CYAN}Mxm Automation Tool v1.0${RESET}"
                echo -e "${AMARILLO}Herramienta todo-en-uno para Termux${RESET}"
                echo -e "Presiona Enter para continuar..."
                read
                ;;
            0) 
                echo -e "${VERDE}🚀 Bye bro! Nos vemos en la matrix...${RESET}"
                exit 0
                ;;
            *) 
                echo -e "${ROJO}❌ Opción no válida${RESET}"
                sleep 1
                ;;
        esac
    done
}

# Verificar que existan los directorios
mkdir -p "$MODULES_DIR" "$CONFIG_DIR"

# Ejecutar
main
