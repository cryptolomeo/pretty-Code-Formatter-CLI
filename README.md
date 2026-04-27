# 🧰 pretty — Code Formatter CLI

`pretty` es una herramienta CLI en Bash para formatear proyectos automáticamente usando Prettier y generar un `.editorconfig` consistente.

---

## 🚀 Características

- Formatea código con Prettier
- Genera `.editorconfig` automáticamente
- Soporta:
  - Tabs (ancho visual 4)
  - Espacios (2 espacios)
- Flags profesionales:
  - --check → solo verifica formato
  - --staged → solo archivos en staging (Git)
  - --force → sobrescribe .editorconfig existente
- Integración con hooks de Git

---

## 📦 Requisitos

- Node.js
- npx (incluido con npm)
- Git (opcional para --staged)

---

## ⚙️ Instalación

mkdir -p ~/.local/bin  
nano ~/.local/bin/pretty  
chmod +x ~/.local/bin/pretty  

Añadir al PATH (Zsh):

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc  
source ~/.zshrc  

---

## 🧪 Uso

### Formatear todo el proyecto

pretty spaces  
pretty tabs  

---

### Solo comprobar formato (modo CI)

pretty spaces --check  

---

### Solo archivos en staging (Git)

pretty spaces --staged  

---

### Forzar sobrescritura de .editorconfig

pretty spaces --force  

---

## 🔁 Integración con Git (pre-commit)

Crear hook:

nano .git/hooks/pre-commit  

Contenido:

#!/bin/bash  
pretty spaces --staged  

Permisos:

chmod +x .git/hooks/pre-commit  

---

## ⚠️ Comportamiento importante

- Si Prettier encuentra errores de sintaxis, el proceso fallará.
- .editorconfig no se sobrescribe por defecto.
- Usa --force si quieres reemplazarlo manualmente.

---

## 📁 Ejemplo de flujo

git add .  
pretty spaces --staged  
git commit -m "formatted code"  

---

## 🧠 Objetivo

Estandarizar automáticamente el formato de código en proyectos para evitar inconsistencias en equipos y repositorios.

---

## 📜 Licencia

MIT
