# 🧰 pretty — Code Formatter CLI

`pretty` es una herramienta CLI en Bash para formatear proyectos automáticamente usando **Prettier** y generar un `.editorconfig` consistente.

## 🚀 Características

* Formatea código con Prettier
* Genera `.editorconfig` automáticamente
* Soporta:

  * Tabs (ancho visual 4)
  * Espacios (2 espacios)
* Flags profesionales:

  * `--check` → solo verifica formato
  * `--staged` → solo archivos en staging (Git)
* Integración con hooks de Git

---

## 📦 Requisitos

* Node.js
* npx (incluido con npm)
* Git (opcional para `--staged`)

---

## ⚙️ Instalación

```bash
mkdir -p ~/.local/bin
nano ~/.local/bin/pretty
chmod +x ~/.local/bin/pretty
```

Añadir al PATH (Zsh):

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

---

## 🧪 Uso

### Formatear todo el proyecto

```bash
pretty spaces
```

```bash
pretty tabs
```

---

### Solo comprobar formato (modo CI)

```bash
pretty spaces --check
```

---

### Solo archivos en staging (Git)

```bash
pretty spaces --staged
```

---

## 🔁 Integración con Git (pre-commit)

Crear hook:

```bash
nano .git/hooks/pre-commit
```

Contenido:

```bash
#!/bin/bash
pretty spaces --staged
```

Permisos:

```bash
chmod +x .git/hooks/pre-commit
```

---

## ⚠️ Notas

* Si Prettier encuentra errores de sintaxis, el proceso fallará.
* `.editorconfig` se sobrescribe automáticamente.

---

## 📁 Ejemplo de flujo

```bash
git add .
pretty spaces --staged
git commit -m "formatted code"
```

---

## 🧠 Objetivo

Estandarizar el formato de código en proyectos de forma rápida y consistente.

---

## 📜 Licencia

MIT
