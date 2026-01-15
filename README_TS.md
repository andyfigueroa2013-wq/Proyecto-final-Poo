/**
 * README - Sistema de Admisión ULEAM (TypeScript)
 * 
 * Este proyecto es una reescritura completa del Sistema de Admisión ULEAM
 * de Python (Flask) a TypeScript (Express.js)
 */

# Sistema de Admisión ULEAM - TypeScript

## Descripción

Sistema completo de gestión de admisiones para la Universidad Laica Eloy Alfaro de Manabí (ULEAM), implementado en TypeScript con Express.js, aplicando principios SOLID.

## Conversión de Python a TypeScript

### Cambios Principales:
- **Framework Web**: Flask → Express.js
- **Base de Datos**: openpyxl → exceljs
- **Correo**: Flask-Mail → Nodemailer
- **Servidor de Aplicación**: Flask devserver → Node.js nativo

### Estructura del Proyecto

```
proyecto/
├── src/
│   ├── app.ts                 # Aplicación principal
│   ├── config.ts              # Configuración
│   ├── index.ts               # Índices de exportación
│   ├── controllers/           # Controladores (lógica de rutas)
│   │   ├── auth_controller.ts
│   │   └── admision_controller.ts
│   ├── database/              # Base de datos
│   │   ├── excel_manager.ts   # Gestor de Excel
│   │   └── validators.ts      # Validadores
│   ├── models/                # Modelos de negocio
│   │   ├── Postulante.ts
│   │   ├── RegistroNacional.ts
│   │   ├── SedeCampus.ts
│   │   ├── OfertaCarrera.ts
│   │   ├── Inscripcion.ts
│   │   ├── Evaluacion.ts
│   │   ├── Asignacion.ts
│   │   └── PuntajePostulacion.ts
│   ├── routes/                # Definición de rutas
│   │   ├── auth_routes.ts
│   │   └── admision_routes.ts
│   ├── services/              # Servicios de negocio
│   │   ├── auth_service.ts
│   │   ├── mail_service.ts
│   │   └── registro_service.ts
│   ├── types/                 # Tipos e interfaces TypeScript
│   │   └── models.ts
│   ├── public/                # Archivos estáticos
│   │   └── css/
│   └── views/                 # Templates EJS
├── dist/                      # Código compilado (generado)
├── .env                       # Variables de entorno
├── .gitignore
├── package.json
├── tsconfig.json
└── README.md
```

## Instalación

### Prerrequisitos
- Node.js v18+
- npm o yarn

### Pasos

1. **Instalar dependencias**
   ```bash
   npm install
   ```

2. **Configurar variables de entorno**
   ```bash
   cp .env.example .env
   # Editar .env con tus configuraciones
   ```

3. **Compilar TypeScript**
   ```bash
   npm run build
   ```

4. **Iniciar servidor**
   - Desarrollo: `npm run dev`
   - Producción: `npm start`

## Equivalencias Python → TypeScript

### Modelos
| Python | TypeScript |
|--------|-----------|
| `Postulante` (clase) | `Postulante` (clase + interfaz) |
| `RepositorioPostulantesEnMemoria` | Implementación integrada |
| Herencia | Implementación de interfaces |
| `@abstractmethod` | Interfaces abstractas |

### Base de Datos
| Python | TypeScript |
|--------|-----------|
| `openpyxl.load_workbook()` | `exceljs.Workbook` |
| `ws.iter_rows()` | `ws.getRow()` |
| Thread locks | Manejo async/await |

### Servicios
| Python | TypeScript |
|--------|-----------|
| `FlaskMail` | `nodemailer` |
| `@route` (Flask) | `router.get/post` (Express) |
| Sesiones Flask | `express-session` |

### Validadores
| Python | TypeScript |
|--------|-----------|
| `CedulaValidator` | Reescrito con misma lógica |
| `EmailValidator` | Usando regex similar |
| `CalificacionValidator` | Métodos adicionales para flexibilidad |

## API Endpoints

### Autenticación
```
POST   /api/auth/login          - Iniciar sesión
POST   /api/auth/logout         - Cerrar sesión
GET    /api/auth/session        - Obtener sesión actual
```

### Admisión
```
GET    /api/admision/sedes                - Listar todas las sedes
GET    /api/admision/carreras             - Listar todas las carreras
GET    /api/admision/estudiante           - Obtener datos del estudiante
POST   /api/admision/enviar-info-carrera  - Enviar info por email
```

## Variables de Entorno (.env)

```
NODE_ENV=development
PORT=5000
SECRET_KEY=tu_clave_secreta

# Email
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USE_TLS=true
MAIL_USERNAME=tu_email@gmail.com
MAIL_PASSWORD=tu_contraseña_app

# Base de Datos
EXCEL_PATH=datos_admision.xlsx
```

## Principios SOLID Implementados

- **S** (Single Responsibility): Cada clase tiene una única responsabilidad
- **O** (Open/Closed): Clases abiertas para extensión, cerradas para modificación
- **L** (Liskov Substitution): Las subclases pueden sustituir a sus padres
- **I** (Interface Segregation): Interfaces pequeñas y específicas
- **D** (Dependency Inversion): Dependencia en abstracciones

## Scripts npm

```bash
npm run build   # Compilar TypeScript
npm run start   # Iniciar en producción
npm run dev     # Iniciar en desarrollo
npm run watch   # Compilar en tiempo real
npm run lint    # Ejecutar linter
```

## Diferencias Clave con la Versión Python

1. **Tipado Fuerte**: TypeScript añade seguridad de tipos
2. **Async/Await**: Manejo de asincronía más claro
3. **Validaciones**: Más robustas y reutilizables
4. **Performance**: Node.js es generalmente más rápido que Flask
5. **Escalabilidad**: Mejor preparado para clusters y microservicios

## Autores

- Jean Pierre Flores Piloso
- Braddy Londre Vera
- Bismark Gabriel Cevallos

## Licencia

MIT

## Notas Importantes

- En producción, usar variables de entorno para credenciales
- Implementar HTTPS
- Usar base de datos relacional en lugar de Excel para producción
- Configurar CORS adecuadamente según dominio
- Implementar autenticación con JWT para APIs públicas

---
*Última actualización: Enero 2026*
