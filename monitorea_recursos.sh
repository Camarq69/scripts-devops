#!/bin/bash

# === Script para monitorear uso de CPU y Memoria RAM en Git Bash (Windows) ===

# Obtener porcentaje de uso de CPU
USO_CPU=$(wmic cpu get loadpercentage | awk 'NR==2 {print $1}')

# Obtener memoria total y disponible
MEM_TOTAL=$(wmic computersystem get TotalPhysicalMemory | awk 'NR==2 {print $1}')
MEM_DISPONIBLE_KB=$(wmic OS get FreePhysicalMemory | awk 'NR==2 {print $1}')
MEM_DISPONIBLE=$((MEM_DISPONIBLE_KB * 1024))  # convertir a Bytes

# Calcular memoria utilizada y porcentaje
MEM_UTILIZADA=$((MEM_TOTAL - MEM_DISPONIBLE))

if [ "$MEM_TOTAL" -gt 0 ]; then
  USO_MEMORIA=$((MEM_UTILIZADA * 100 / MEM_TOTAL))
else
  USO_MEMORIA=0
fi

# Obtener la hora actual
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

# Log de salida
LOG="log_recursos.txt"
echo "⏱️  $FECHA - CPU: ${USO_CPU}% | RAM: ${USO_MEMORIA}%" | tee -a "$LOG"

# Alertas
[[ "$USO_CPU" -ge 70 ]] && echo "⚠️  ¡Uso de CPU elevado!" | tee -a "$LOG"
[[ "$USO_MEMORIA" -ge 70 ]] && echo "⚠️  ¡Uso de Memoria RAM elevado!" | tee -a "$LOG"
