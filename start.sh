if [[ $USER != "root" ]]; then
    echo "Mohon jalankan perintah ini sebagai root."
    exit 1
fi

while true; do
    read -p "Mau Setting Hostname? (Y/N): " pilihan
    if [[ $pilihan =~ ^[Yy]$ ]]; then
        read -p "Masukkan Hostname yang kamu inginkan: " newhostname
        hostname $newhostname
        sudo sed -i "$(($(sed -n '$=' /etc/hosts)-1))s/\S\+$/$newhostname/" /etc/hosts
        apt update
        apt install curl wget gpg git python3 pip sudo nano -y
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        sudo apt update
        sudo apt install -y nodejs git
        wget -O ~/.bashrc https://raw.githubusercontent.com/xAezteruu/rdp/refs/heads/main/.bashrc.example
        source ~/.bashrc
        clear
        curl https://sshx.io/get | sh
        su $USER
        break
    elif [[ $pilihan =~ ^[Nn]$ ]]; then
        apt update
        apt install curl wget gpg git python3 pip sudo nano -y
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
        sudo apt update
        sudo apt install -y nodejs git
        wget -O ~/.bashrc https://raw.githubusercontent.com/xAezteruu/rdp/refs/heads/main/.bashrc.example
        source ~/.bashrc
        clear
        curl https://sshx.io/get | sh
        su $USER
        break
    else
        echo "Pilihan tidak valid. Harap pilih (Y)es atau (N)o."
        sleep 2
    fi
done
