# 🧰 pretty — Code Formatter CLI

`pretty` es una herramienta CLI en Bash para formatear proyectos automáticamente usando Prettier y generar un `.editorconfig` consistente.

> ⚠️ Importante: Esta herramienta no se instala como un paquete npm. Es un script local que se añade manualmente al PATH del sistema.

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
  - --force → sobrescribe `.editorconfig` existente
- Integración con hooks de Git

---

## 📦 Requisitos

### Dependencias explícitas

- Node.js
- npm (incluye npx)
- Prettier (usado vía npx)
- Git (opcional para --staged)

---

## ⚙️ Instalación (REAL)

Este CLI no se instala como un paquete npm. Es un script local que se añade manualmente al PATH del sistema.

### 1. Crear el directorio de comandos locales

mkdir -p ~/.local/bin  

---

### 2. Crear el script

nano ~/.local/bin/pretty  

👉 Pega aquí el contenido del script Bash de `pretty`

---

### 3. Dar permisos de ejecución

chmod +x ~/.local/bin/pretty  

---

### 4. Añadir al PATH (Zsh)

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc  
source ~/.zshrc  

---

### 5. Verificar instalación

which pretty  
pretty spaces --check  

Si devuelve una ruta como:
~/.local/bin/pretty  
la instalación es correcta. 

---

## 🔍 Verificación de instalación

Para comprobar que está correctamente instalado:

which pretty  
pretty spaces --check  

Si el comando devuelve una ruta como:
~/.local/bin/pretty  
entonces la instalación es correcta.

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

## ⚠️ Comportamiento importante (Edge cases)

- Si Prettier encuentra errores de sintaxis, el proceso fallará inmediatamente.
- Si no hay archivos en staging con --staged, el script termina sin ejecutar Prettier.
- .editorconfig no se sobrescribe por defecto (solo con --force).
- Si el proyecto no es un repositorio Git, --staged mostrará un error.
- Si no hay archivos para procesar, el script no ejecuta Prettier.

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
