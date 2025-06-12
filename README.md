# Scripts de Mantenimiento Bash para DevOps

Este repositorio contiene dos scripts prácticos de automatización escritos en Bash, orientados
a tareas reales de mantenimiento que puede realizar un perfil DevOps Junior. 

---

## Contenido

- 'limpiar_archivos.sh' - Limpia archivos con más de X días en carpetas de logs y backups. 
- 'Verificar_servicios.sh' - Verifica si ciertos servicios están activos y genera un log. 

---

## Requisitos

- Bash (Git Bash, WSL, o Linux)
- Comandos: 'find', 'ps', 'grep', 'date', 'rm', 'tee'

---

## Cómo usar 

### 1. Ejecutar 'limpiar_archivos.sh'

'''bash
chmod +x limpiar_archivos.sh
./limpiar_archivos.sh

Este script detecta y elimina archivos con más de 7 días de antigüedad en las carpetas logs/ y backups/.

### 2. Ejecutar 'verificar_servicios.sh'

'''bash
chmod +x verificar_servicios.sh
./verificar_servicios.sh

Este script verifica si servicios como nginx, docker, ssh, cron están activos. 
Crea un archivo estado_servicios.log con la salida.

# Estructura del proyecto

repositorio_scripts/
 -limpiar_archivos.sh
 -verificar_servicios.sh
 -.gitignore
 -README.md

## Notas

Este proyecto es parte de mi proceso de aprendizaje DevOps.


