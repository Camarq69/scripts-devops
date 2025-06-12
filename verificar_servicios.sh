#!/bin/bash

# lista de servicios a verificar
SERVICES=("nginx" "docker" "ssh" "cron")

# Nombre del archivo log
LOG="estado_servicios.log"

# Fecha actual
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo " Verificación de servicios - $FECHA" >> "$LOG"
echo "----------------------------------------" >> "$LOG"

for servicio in "${SERVICES[@]}"; do
    # Verificamos si systemctl está disponible (Linux) o usamos ps como fallback (GitBash)
    if command -v systemctl &> /dev/null; then
        if systemctl is-active --quiet "$servicio"; then
            echo "El servicio $servicio está activo." | tee -a "$LOG"
        else
            echo "El servicio $servicio no está activo." | tee -a "$LOG"
        fi
    else
        # Fallback para GitBash (Windows)
        if ps aux | grep "$servicio" | grep -v "grep" &>/dev/null; then
            echo "El servicio $servicio está activo." | tee -a "$LOG"
        else
            echo "El servicio $servicio no está activo." | tee -a "$LOG"
        fi
    fi
done 

echo "" >> "$LOG"
echo "Verificación completada - $FECHA" >> "$LOG"
echo "----------------------------------------" >> "$LOG"
# Fin del script
# Mostrar el contenido del log
cat "$LOG"
# Fin del script