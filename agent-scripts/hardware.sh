#!/bin/bash

echo "===== HARDWARE STATUS REPORT ====="
echo "Data/Hora: $(date)"
echo "Hostname: $(hostname)"
echo

# CPU
echo ">>> CPU"
lscpu | grep -E 'Model name|Socket|Thread|Core|CPU MHz'
echo "Uso atual da CPU:"
top -bn1 | grep "Cpu(s)" | awk '{print "Uso: " $2 "% Usuário, " $4 "% Sistema, " $8 "% Ocioso"}'
echo

# Temperatura CPU (se disponível)
echo ">>> Temperatura da CPU"
sensors | grep -i 'Core\|Package\|temp'
echo

# Memória RAM
echo ">>> Memória RAM"
free -h
echo

# Disco
echo ">>> Disco (uso)"
df -hT | grep -v tmpfs
echo

# Disco - SMART (saúde do disco principal)
echo ">>> Saúde do disco (SMART)"
DISK=$(lsblk -ndo NAME,TYPE | awk '$2=="disk"{print "/dev/"$1; exit}')
sudo smartctl -H "$DISK"
echo

# Placa-mãe
echo ">>> Placa-mãe"
sudo dmidecode -t baseboard | grep -E 'Manufacturer|Product Name|Version'
echo

# Placa de vídeo
echo ">>> Placa de vídeo"
lspci | grep -i vga
echo

# Interfaces de rede
echo ">>> Interfaces de Rede"
ip -br address show
echo

# Bateria (para notebooks)
if upower -e | grep -q battery; then
    echo ">>> Bateria"
    upower -i $(upower -e | grep battery)
else
    echo ">>> Bateria: Não encontrado (desktop ou sem suporte)"
fi

echo "===== FIM DO RELATÓRIO ====="
