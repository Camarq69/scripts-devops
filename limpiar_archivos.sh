#!/bin/bash

# === CONFIGURACIÓN DE RUTAS ===
LOGS="./logs"
BACKUPS="./backups"

# Crear directorios si no existen (buena práctica para scripts de mantenimiento)
[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -d "$BACKUPS" ] && mkdir -p "$BACKUPS"

# === VARIABLES DE CONFIGURACIÓN ===
RUTAS=("$LOGS" "$BACKUPS")   # Directorios a revisar
LIMITE_DIAS=7                # Umbral de antigüedad para eliminar archivos

echo " Inicando limpieza de archivos con más de $LIMITE_DIAS días ..."

# === PROCESO DE LIMPIEZA ===
for RUTA in "${RUTAS[@]}"; do
    if [ -d "$RUTA" ]; then
        echo " Revisando carpeta: $RUTA"

        # Buscar archivos más antiguos que el límite
        ENCONTRADOS=$(find "$RUTA" -type f -mtime +$LIMITE_DIAS)

        if [ -z "$ENCONTRADOS" ]; then
            echo " No se encontraron archivos antiguos en $RUTA"
        else
            echo " Archivos a eliminar:"
            echo "$ENCONTRADOS"
            # Eliminar los archivos y registrar los eliminados
            find "$RUTA" -type f -mtime +$LIMITE_DIAS -exec sh -c 'echo " Archivo eliminado: $1"; rm "$1"' _ {} \;
        fi
    else
        echo " Carpeta no encontrada: $RUTA"
    fi
done

echo " Limpieza finalizada."
# Fin del script de limpieza