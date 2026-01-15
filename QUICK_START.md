/**
 * GUÍA DE INICIO RÁPIDO
 * Sistema de Admisión ULEAM - TypeScript Edition
 */

# 🚀 Guía de Inicio Rápido

## ⚡ Quick Start (5 minutos)

### 1. Requisitos Previos
- Node.js v18+ ([descargar](https://nodejs.org/))
- npm (incluido con Node.js)
- Git (opcional)

### 2. Instalación

**Windows:**
```bash
# Ejecutar el script de setup
setup.bat
```

**Linux/macOS:**
```bash
# Dar permiso de ejecución
chmod +x setup.sh

# Ejecutar setup
./setup.sh
```

**Manual (en cualquier SO):**
```bash
# 1. Instalar dependencias
npm install

# 2. Compilar TypeScript
npm run build

# 3. Ejecutar
npm run dev
```

### 3. Servidor Iniciado ✓
```
🚀 Servidor ejecutándose en puerto 5000
```

### 4. Probar API

Usar Postman, Thunderclient o curl:

```bash
# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"usuario":"1234567890"}'

# Ver sedes
curl http://localhost:5000/api/admision/sedes

# Ver carreras
curl http://localhost:5000/api/admision/carreras
```

---

## 📁 Estructura Mínima Entendible

```
src/
├── app.ts              ← Servidor (punto de entrada)
├── config.ts           ← Configuración
├── models/             ← Clases de datos
├── services/           ← Lógica de negocio
├── controllers/        ← Manejadores HTTP
├── routes/             ← Definición de rutas
├── database/           ← Base de datos (Excel)
└── types/              ← Interfaces TypeScript
```

### ¿Dónde está qué?

| Necesito | Archivo |
|---------|---------|
| Cambiar puerto | src/config.ts |
| Agregar ruta | src/routes/*.ts |
| Agregar modelo | src/models/*.ts |
| Cambiar base de datos | src/database/excel_manager.ts |
| Agregar servicio | src/services/*.ts |
| Cambiar lógica de login | src/services/auth_service.ts |
| Enviar email | src/services/mail_service.ts |

---

## 🔧 Comandos Principales

```bash
# Desarrollo (compilación automática)
npm run dev

# Producción (compilado)
npm start

# Compilar sin ejecutar
npm run build

# Compilar en tiempo real (watch)
npm run watch

# Ver ejemplos de uso
npm run ejemplos

# Verificar código (linter)
npm run lint
```

---

## 📚 Documentación Disponible

| Archivo | Para |
|---------|------|
| README_TS.md | 📖 Documentación principal |
| MIGRATION_GUIDE.md | 🔄 Cómo se migró de Python |
| CONVERSION_SUMMARY.md | 📊 Resumen de cambios |
| PROJECT_STRUCTURE.md | 📁 Estructura de carpetas |
| QUICK_START.md | ⚡ Este archivo |

---

## 🎯 Ejemplo Básico: Crear un Nuevo Endpoint

### 1. Crear el controlador (controllers/micontrolador.ts)
```typescript
import { Request, Response } from 'express';

export class MiControlador {
  hola(req: Request, res: Response): void {
    res.json({ mensaje: '¡Hola TypeScript!' });
  }
}
```

### 2. Crear la ruta (routes/misrutas.ts)
```typescript
import { Router } from 'express';
import { MiControlador } from '../controllers/micontrolador';

export function crearRutasMias(): Router {
  const router = Router();
  const ctrl = new MiControlador();

  router.get('/hola', (req, res) => ctrl.hola(req, res));

  return router;
}
```

### 3. Registrar en app.ts
```typescript
import { crearRutasMias } from './routes/misrutas';

// En inicializarRutas():
this.express.use('/api/mi', crearRutasMias());
```

### 4. Compilar y probar
```bash
npm run build
npm run dev

# En otra terminal:
curl http://localhost:5000/api/mi/hola
```

---

## 🔐 Configuración de Email (Importante)

### Usando Gmail:
1. Ir a https://myaccount.google.com/apppasswords
2. Generar contraseña de aplicación
3. Copiar contraseña en `.env`:

```env
MAIL_USERNAME=tu_email@gmail.com
MAIL_PASSWORD=contraseña_generada
```

### Usando otro servidor SMTP:
```env
MAIL_SERVER=smtp.tuservidor.com
MAIL_PORT=587
MAIL_USERNAME=tu_usuario
MAIL_PASSWORD=tu_contraseña
```

---

## 🧪 Probar Funcionalidades

### 1. Test de Login
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"usuario":"1234567890"}'
```

### 2. Test de Sedes
```bash
curl http://localhost:5000/api/admision/sedes
```

### 3. Test de Carreras
```bash
curl http://localhost:5000/api/admision/carreras
```

### 4. Correr ejemplos
```bash
npm run ejemplos
```

---

## 🆘 Troubleshooting

### Error: "PORT already in use"
```bash
# Cambiar puerto en .env
PORT=3000
```

### Error: "Cannot find module"
```bash
# Reinstalar dependencias
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Error: "TypeScript compilation failed"
```bash
# Verificar sintaxis
npm run lint

# Limpiar y reconstruir
rm -rf dist
npm run build
```

### Excel no se actualiza
```bash
# Verificar ruta en .env
EXCEL_PATH=./datos_admision.xlsx

# Verificar que el archivo exista
ls datos_admision.xlsx
```

---

## 📊 Stack Tecnológico

```
Frontend:          HTML/CSS/JavaScript (por hacer)
Servidor:          Express.js + TypeScript
Base de Datos:     Excel (exceljs)
Email:             Nodemailer (Gmail SMTP)
Sesiones:          express-session
Seguridad:         Helmet, CORS
```

---

## 🚀 Próximas Etapas

Después de familiarizarte:

1. **Frontend**
   - Convertir templates HTML a EJS
   - O crear frontend SPA (React/Vue)

2. **Tests**
   ```bash
   npm install --save-dev jest @types/jest ts-jest
   ```

3. **Base de Datos Relacional**
   - Migrar de Excel a PostgreSQL/MySQL
   - Usar un ORM como Prisma

4. **Autenticación Mejorada**
   - Implementar JWT
   - Hashing de contraseñas (bcrypt)

5. **Deployment**
   - Nginx reverse proxy
   - SSL/HTTPS
   - PM2 para proceso management

---

## 📞 Soporte Rápido

### Verificar instalación
```bash
node --version    # Debe ser v18+
npm --version     # Debe ser 9+
npm list          # Ver dependencias
```

### Logs de error
```bash
npm run dev       # Ver errores en tiempo real
```

### Información del servidor
```bash
curl http://localhost:5000/  # Info del servidor
```

---

## ✅ Checklist de Verificación

- [ ] Node.js v18+ instalado
- [ ] npm funcionando
- [ ] Dependencias instaladas (`npm install`)
- [ ] TypeScript compilado (`npm run build`)
- [ ] Servidor inicia sin errores (`npm run dev`)
- [ ] Endpoints responden (curl o Postman)
- [ ] Email configurado en .env (opcional)
- [ ] Ejemplos ejecutan (`npm run ejemplos`)

---

## 🎓 Recursos Adicionales

- [Express.js Docs](https://expressjs.com/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [exceljs Documentation](https://github.com/exceljs/exceljs)
- [Nodemailer Guide](https://nodemailer.com/about/)

---

## 📝 Notas Importantes

1. **Desarrollo vs Producción**
   - Desarrollo: `npm run dev` (con hot reload)
   - Producción: `npm run build` + `npm start`

2. **Base de Datos**
   - Actualmente usa Excel
   - Para producción: usar PostgreSQL/MySQL

3. **Seguridad**
   - En producción: HTTPS, variables de entorno seguros
   - Nunca commitear .env a Git

4. **Performance**
   - Excel es lento para muchos usuarios
   - Considerar base de datos relacional

5. **Escalabilidad**
   - Para múltiples servidores: usar Redis para sesiones
   - Considerar load balancer

---

**Última actualización**: Enero 2026
**Estado**: ✅ Listo para usar

Para más información, ver README_TS.md
