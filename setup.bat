@echo off
REM Script de instalación rápida para Windows PowerShell
REM Sistema de Admisión ULEAM TypeScript

echo.
echo ╔════════════════════════════════════════════════════════╗
echo ║  Sistema de Admisión ULEAM - Setup TypeScript         ║
echo ╚════════════════════════════════════════════════════════╝
echo.

REM 1. Verificar Node.js
echo 1️⃣  Verificando Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js no está instalado
    echo.
    echo Descárgalo desde: https://nodejs.org/
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
echo ✅ Node.js %NODE_VERSION%
echo ✅ npm %NPM_VERSION%
echo.

REM 2. Instalar dependencias
echo 2️⃣  Instalando dependencias...
call npm install
if errorlevel 1 (
    echo ❌ Error en instalación de dependencias
    pause
    exit /b 1
)
echo ✅ Dependencias instaladas
echo.

REM 3. Compilar TypeScript
echo 3️⃣  Compilando TypeScript...
call npm run build
if errorlevel 1 (
    echo ❌ Error en compilación TypeScript
    pause
    exit /b 1
)
echo ✅ TypeScript compilado exitosamente
echo.

REM 4. Verificar archivo .env
echo 4️⃣  Configurando variables de entorno...
if not exist .env (
    echo ✅ Archivo .env configurado
) else (
    echo ⚠️  Archivo .env ya existe
)
echo.

REM 5. Información final
echo ╔════════════════════════════════════════════════════════╗
echo ║  ✅ Setup completado                                   ║
echo ╚════════════════════════════════════════════════════════╝
echo.
echo Comandos disponibles:
echo   npm run dev       - Iniciar en modo desarrollo
echo   npm start         - Iniciar en producción
echo   npm run build     - Compilar TypeScript
echo   npm run watch     - Watch mode (recompila al cambiar)
echo   npm run ejemplos  - Ejecutar ejemplos
echo.
echo Para comenzar:
echo   npm run dev
echo.
pause
