#!/bin/bash
# Script de instalación rápida - Sistema de Admisión ULEAM TypeScript
# Compatible con Windows (PowerShell), Linux y macOS

echo "╔════════════════════════════════════════════════════════╗"
echo "║  Sistema de Admisión ULEAM - Setup TypeScript         ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# 1. Verificar Node.js
echo "1️⃣  Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado"
    echo "   Descárgalo desde: https://nodejs.org/"
    exit 1
fi
echo "✅ Node.js $(node --version)"
echo "✅ npm $(npm --version)"
echo ""

# 2. Instalar dependencias
echo "2️⃣  Instalando dependencias..."
npm install
if [ $? -ne 0 ]; then
    echo "❌ Error en instalación de dependencias"
    exit 1
fi
echo "✅ Dependencias instaladas"
echo ""

# 3. Compilar TypeScript
echo "3️⃣  Compilando TypeScript..."
npm run build
if [ $? -ne 0 ]; then
    echo "❌ Error en compilación TypeScript"
    exit 1
fi
echo "✅ TypeScript compilado exitosamente"
echo ""

# 4. Crear archivo .env si no existe
echo "4️⃣  Configurando variables de entorno..."
if [ ! -f .env ]; then
    cp .env .env.bak || true
    echo "✅ Archivo .env configurado"
else
    echo "⚠️  Archivo .env ya existe"
fi
echo ""

# 5. Información final
echo "╔════════════════════════════════════════════════════════╗"
echo "║  ✅ Setup completado                                   ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "Comandos disponibles:"
echo "  npm run dev       - Iniciar en modo desarrollo"
echo "  npm start         - Iniciar en producción"
echo "  npm run build     - Compilar TypeScript"
echo "  npm run watch     - Watch mode (recompila al cambiar)"
echo "  npm run ejemplos  - Ejecutar ejemplos"
echo ""
echo "Para comenzar:"
echo "  npm run dev"
echo ""
