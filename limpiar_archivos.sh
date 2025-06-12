#!/bin/bash

# === CONFIGURACIÓN ===
RUTAS=(./logs ./backups)	# Carpetas a revisar
LIMITE_DIAS=7			# Umbral de antiguedad

echo " Inicando limpieza de archivos con más de $LIMITE_DIAS días ..."

# === PROCESO DE LIMPIEZA ===
for RUTA in "${RUTAS[@]}"; do
	if [ -d "$RUTA" ]; then
		echo " Revisando carpeta: $RUTA"

		#Buscar archivos antiguos
		ENCONTRADOS=$(find "$RUTA" -type f -mtime +$LIMITE_DIAS)

		if [ -z "$ENCONTRADOS" ]; then
			echo " No se encontraron archivos antiguos en $RUTA"
		else
			echo " Archivos a eliminar:"
			echo "$ENCONTRADOS" 
			# Ejecutar  eliminación
			find "$RUTA" -type f -mtime +$LIMITE_DIAS -exec sh -c 'echo " Archivo eliminado: $1"; rm "$1"' _ {} \;
		fi
		else
			echo " Carpeta no encontrada: $RUTA"
		fi
	done

echo " Limpieza finalizada."
