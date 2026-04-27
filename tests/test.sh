#!/bin/bash
set -e

echo "🧪 Ejecutando tests..."

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit 1

# ---------- TEST 1: spaces ----------
echo "📏 Test indentación 2 espacios"

echo "function test(){
console.log('hola')
}" > test.js

pretty spaces > /dev/null

# Verificar que hay 2 espacios antes de console.log
if grep -q "^  console.log" test.js; then
  echo "✅ spaces OK"
else
  echo "❌ spaces FAIL"
  exit 1
fi

# ---------- TEST 2: tabs ----------
echo "📏 Test indentación tabs"

echo "function test(){
console.log('hola')
}" > test2.js

pretty tabs > /dev/null

# Verificar que hay un TAB (no espacios)
if grep -q $'^\tconsole.log' test2.js; then
  echo "✅ tabs OK"
else
  echo "❌ tabs FAIL"
  exit 1
fi

# ---------- TEST 3: editorconfig ----------
echo "📄 Test .editorconfig"

if grep -q "indent_style = tab" .editorconfig; then
  echo "✅ editorconfig OK"
else
  echo "❌ editorconfig FAIL"
  exit 1
fi

# ---------- TEST 4: check mode ----------
echo "🔍 Test --check"

echo "function test(){console.log('hola')}" > bad.js

if pretty spaces --check > /dev/null 2>&1; then
  echo "❌ check FAIL (debería fallar)"
  exit 1
else
  echo "✅ check detecta errores"
fi

echo "🎉 Todos los tests pasaron"
