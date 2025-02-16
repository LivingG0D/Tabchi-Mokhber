#!/bin/bash

# Color Definitions
RED='\033[38;2;231;76;60m'      # Red
BLUE='\033[38;5;32m'            # Blue
GREEN='\033[38;5;82m'           # Green
YELLOW='\033[38;5;226m'         # Yellow
CYAN='\033[38;5;51m'            # Cyan
MAGENTA='\033[38;5;171m'        # Magenta
NC='\033[0m'                    # No Color

install_tabchi_mokhber() {
    echo "Starting installation process..."

    sudo apt update && sudo apt upgrade -y
    sudo apt install python3 python3-pip -y
    pip install uv
    pip install telethon
    sudo apt install wget unzip -y
    mkdir -p mokhber
    wget -O tabchi-mokhber.zip https://github.com/MrAminiDev/Tabchi-Mokhber/archive/refs/heads/main.zip
    unzip tabchi-mokhber.zip -d mokhber
    mv mokhber/Tabchi-Mokhber-main/* mokhber/
    rm -r mokhber/Tabchi-Mokhber-main
    rm tabchi-mokhber.zip

    read -p "Enter your API_ID: " api_id
    sed -i "s/AminiMokhberAPIID/$api_id/" mokhber/main.py

    read -p "Enter your API_HASH: " api_hash
    sed -i "s/AminiMokhberAPIHASH/$api_hash/" mokhber/main.py

    read -p "Enter your Admin ID: " admin_id
    sed -i "s/AminiMokhberADMINID/$admin_id/" mokhber/main.py
    cd mokhber
    sleep 2
    sudo uv run main.py

    echo "Your bot has been successfully run. Check the commands using the 'Help' command in Telegram."
    sleep 10  # Adding a 10-second delay before returning to the menu
}

update_tabchi_mokhber() {
    echo "Updating Tabchi Mokhber..."
    install_tabchi_mokhber
}

uninstall_tabchi_mokhber() {
    echo "Removing mokhber folder..."
    sudo rm -rf mokhber
}


create_service() {
    echo "Creating systemd service..."

    echo "[Unit]" | sudo tee /etc/systemd/system/mokhber.service
    echo "Description=mokhber" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "After=network.target" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "[Service]" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "Type=simple" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "User=root" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "WorkingDirectory=/root/mokhber" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "ExecStart=/usr/local/bin/uv run main.py" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "Restart=always" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "[Install]" | sudo tee -a /etc/systemd/system/mokhber.service
    echo "WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/mokhber.service

    sudo systemctl daemon-reload
    sudo systemctl enable mokhber.service
    sudo systemctl start mokhber.service
}




while true; do
    clear
    echo -e "${CYAN}+======================================================================+${NC}"
    echo -e "${RED}         ___ ___   ___   __  _  __ __  ____     ___  ____  ${NC}"
    echo -e "${RED}        |   |   | /   \ |  |/ ]|  |  ||    \   /  _]|    \  ${NC}"
    echo -e "${RED}        | _   _ ||     ||  ' / |  |  ||  o  ) /  [_ |  D  )${NC}"
    echo -e "${RED}        |  \_/  ||  O  ||    \ |  _  ||     ||    _]|    /  ${NC}"
    echo -e "${RED}        |   |   ||     ||     \|  |  ||  O  ||   [_ |    \  ${NC}"
    echo -e "${RED}        |   |   ||     ||  .  ||  |  ||     ||     ||  .  \ ${NC}"
    echo -e "${RED}        |___|___| \___/ |__|\_||__|__||_____||_____||__|\_| ${NC}"
    echo -e ""
    echo -e "${CYAN}+======================================================================+${NC}"
    echo -e "|  Telegram Channel : ${MAGENTA}@AminiDev ${NC}|  Version : ${GREEN} 3.0.5${NC} "
    echo -e "${CYAN}+======================================================================+${NC}"
    echo -e "${CYAN}== Main Menu ==${NC}"
    echo -e "1) Install Tabchi Mokhber"
    echo -e "2) Update Tabchi Mokhber"
    echo -e "3) Uninstall"
    echo -e "0) Exit"
    read -p "Enter your choice: " main_choice  # Fixed variable name

    case $main_choice in  # Using $main_choice instead of $option
        1)
            install_tabchi_mokhber
            create_service
            ;;
        2)
            update_tabchi_mokhber
            ;;
        3)
            uninstall_tabchi_mokhber
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    read -p "Press [Enter] to continue..."
done
