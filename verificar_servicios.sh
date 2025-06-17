#!/bin/bash

# Lista de servicios comunes a verificar (puedes agregar más)
# En Windows se buscarán por su nombre de proceso
SERVICES=("nginx" "docker" "ssh" "cron" "com.docker.backend.exe" "Docker Desktop.exe" "docker.exe")

# Archivo de log
LOG="estado_servicios.log"

# Fecha actual
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo " Verificación de servicios - $FECHA" >> "$LOG"
echo "----------------------------------------" >> "$LOG"

for servicio in "${SERVICES[@]}"; do
    # Verificación en sistemas Linux con systemctl
    if command -v systemctl &> /dev/null; then
        if systemctl is-active --quiet "$servicio"; then
            echo "El servicio $servicio está activo." | tee -a "$LOG"
        else
            echo "El servicio $servicio no está activo." | tee -a "$LOG"
        fi
    else
        # Verificación para entornos Windows usando tasklist
        if tasklist | grep -i "$servicio" > /dev/null; then
            echo "El servicio $servicio está activo." | tee -a "$LOG"
        else
            echo "El servicio $servicio no está activo." | tee -a "$LOG"
        fi
    fi
done

echo "" >> "$LOG"
echo "Verificación completada - $FECHA" >> "$LOG"
echo "----------------------------------------" >> "$LOG"

# Mostrar contenido del log
cat "$LOG"
