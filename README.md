# Sistema de Admisión ULEAM - TypeScript

Versión reescrita en **TypeScript + Express.js**

## 🚀 Instalación Rápida

```bash
# 1. Instalar dependencias
npm install

# 2. Compilar TypeScript
npm run build

# 3. Ejecutar
npm run dev
```

El servidor estará en: **http://localhost:5000**

## 📁 Estructura

```
src/
├── app.ts                    # Servidor Express
├── config.ts                 # Configuración
├── controllers/              # Controladores
├── database/                 # Excel Manager + Validadores
├── models/                   # Modelos de negocio
├── routes/                   # Rutas REST
├── services/                 # Servicios
└── types/                    # Interfaces TypeScript
```

## 🔧 Scripts

```bash
npm run dev       # Desarrollo (ts-node)
npm start         # Producción (node)
npm run build     # Compilar TypeScript
npm run watch     # Compilar en tiempo real
npm run ejemplos  # Ver ejemplos de uso
```

## 📚 Endpoints

```
POST   /api/auth/login
POST   /api/auth/logout
GET    /api/auth/session
GET    /api/admision/sedes
GET    /api/admision/carreras
GET    /api/admision/estudiante
POST   /api/admision/enviar-info-carrera
```

## ⚙️ Configuración

Editar `.env`:

```
NODE_ENV=development
PORT=5000
SECRET_KEY=tu_clave_secreta
MAIL_USERNAME=tu_email@gmail.com
MAIL_PASSWORD=tu_contraseña
```

## 📦 Dependencias

- **express** - Framework web
- **typescript** - Lenguaje tipado
- **exceljs** - Manejo de Excel
- **nodemailer** - Envío de emails
- **helmet** - Seguridad
- **cors** - CORS middleware

## ✨ Características

✅ Autenticación con sesiones
✅ CRUD de registros en Excel
✅ Validaciones robustas
✅ Envío de emails
✅ Tipado fuerte (TypeScript)
✅ SOLID principles
✅ Async/Await

---

**Versión**: 1.0.0  
**Lenguaje**: TypeScript 5.3  
**Runtime**: Node.js v18+
