#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
DISK_USED=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED_SPACE=$(df -h / | awk 'NR==2 {print $3}')
CPU_TEMP=$(sensors 2>/dev/null | grep 'Package id 0:' | awk '{print $4}' | sed 's/+//')

# Constrói o JSON
JSON=$(jq -n \
  --arg cpu "$CPU" \
  --arg mem_total "$MEM_TOTAL" \
  --arg mem_used "$MEM_USED" \
  --arg disk "$DISK_USED" \
  --arg disk_total "$DISK_TOTAL" \
  --arg disk_used "$DISK_USED_SPACE" \
  --arg cpu_temp "$CPU_TEMP" \
  '{
    cpu: ($cpu | tonumber),
    cpu_temp: $cpu_temp,
    memory: {
      total: ($mem_total | tonumber),
      used: ($mem_used | tonumber)
    },
    disk: ($disk | tonumber),
    disk_total: $disk_total,
    disk_used: $disk_used
  }')

# Envia para API
curl -X POST http://localhost:8000/api/hardware/status \
  -H "Content-Type: application/json" \
  -d "$JSON"
