# Scripts de Mantenimiento Bash para DevOps

Este repositorio contiene varios scripts prácticos de automatización escritos en Bash, orientados a tareas reales de mantenimiento que puede realizar un perfil DevOps Junior.

---

## Contenido

- `limpiar_archivos.sh`: Limpia archivos con más de X días de antigüedad en carpetas de logs y backups.
- `verificar_servicios.sh`: Verifica si ciertos servicios están activos y genera un log con la salida.
- `test_velocidad_red.sh`: Realiza una prueba sencilla de velocidad de descarga y registra el resultado.
- `monitorea_recursos.sh`: Monitorea el uso de CPU y RAM del sistema en tiempo real (compatible con Windows vía Git Bash).

---

## Requisitos

- Bash (Git Bash, WSL o Linux)
- Comandos utilizados: `find`, `ps`, `grep`, `date`, `rm`, `tee`, `wmic`, `curl`

---

## Cómo usar

### 1. Ejecutar `limpiar_archivos.sh`

```bash
chmod +x limpiar_archivos.sh
./limpiar_archivos.sh
```

Este script detecta y elimina archivos con más de 7 días de antigüedad en las carpetas `logs/` y `backups/`.
Si las carpetas no existen, las crea automáticamente antes de ejecutar la limpieza.

---

### 2. Ejecutar `verificar_servicios.sh`

```bash
chmod +x verificar_servicios.sh
./verificar_servicios.sh
```

Este script verifica si los servicios `nginx`, `docker`, `ssh` y `cron` están activos.
Genera un archivo `estado_servicios.log` con la información, e imprime el estado en consola.

---

### 3. Ejecutar `test_velocidad_red.sh`

```bash
chmod +x test_velocidad_red.sh
./test_velocidad_red.sh
```

Descarga un archivo de prueba desde un servidor de Internet, mide el tiempo y calcula la velocidad estimada de descarga.
Guarda el resultado en `log_velocidad_red.log`.

---

### 4. Ejecutar `monitorea_recursos.sh`

```bash
chmod +x monitorea_recursos.sh
./monitorea_recursos.sh
```

Este script muestra en tiempo real el porcentaje de uso de CPU y RAM utilizando herramientas de Windows (`wmic`).
Ideal para comprobar la carga del sistema antes o durante procesos de automatización.

---

## Estructura del proyecto

```
repositorio_scripts/
├── limpiar_archivos.sh
├── verificar_servicios.sh
├── test_velocidad_red.sh
├── monitorea_recursos.sh
├── log_velocidad_red.log
├── estado_servicios.log
├── .gitignore
└── README.md
```

---

## Notas

Este proyecto hace parte de un plan intensivo de estudio en DevOps, con prácticas diarias orientadas a la resolución de tareas comunes de mantenimiento.  
El repositorio funciona como una bitácora de avance y portafolio técnico personal.
