#!/bin/bash

URL="https://www.google.com/favicon.ico"  # Archivo pequeño, certificado válido
ARCHIVO="descarga_test.ico"
LOG="log_velocidad_red.log"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

echo "🌐 Iniciando test de velocidad - $FECHA" | tee -a "$LOG"
START=$(date +%s)

# Desactiva validación SSL por compatibilidad (Git Bash/Windows)
curl -o "$ARCHIVO" -L --silent --insecure "$URL"

END=$(date +%s)
TIEMPO=$((END - START))
[ "$TIEMPO" -lt 1 ] && TIEMPO=1

# Verificar que el archivo se descargó
if [ ! -s "$ARCHIVO" ]; then
  echo "❌ Error: No se pudo descargar el archivo o está vacío." | tee -a "$LOG"
  exit 1
fi

BYTES=$(stat -c%s "$ARCHIVO" 2>/dev/null)
MB=$((BYTES / 1048576))
VELOCIDAD=$((MB / TIEMPO))

echo "📥 Archivo de $MB MB descargado en $TIEMPO segundos." | tee -a "$LOG"
echo "🚀 Velocidad estimada: $VELOCIDAD MB/s" | tee -a "$LOG"
echo "✅ Prueba completada." | tee -a "$LOG"
echo "----------------------------------------" >> "$LOG"

rm -f "$ARCHIVO"
