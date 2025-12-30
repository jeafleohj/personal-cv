local companies = {
  prestamype = "Prestamype",
  tandia = "Tandia",
  link_miners = "LinkMiners"
}

--- @type WorkExperienceEntryList
local work_experience_entry = {
  {
    job_title = {
      en = "Backend Developer",
      es = "Desarrollador backend",
    },
    date = {
      en = "August 2024 -- Present",
      es = "Agosto 2024 -- Actualidad",
    },
    company = {
      en = companies.prestamype,
      es = companies.prestamype,
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    details = {
      {
        en =
        "Architecture and development of the backend in TypeScript, integrating tRPC for efficient client-server communication and using Hono as a lightweight, high-performance framework.",
        es =
        "Arquitectura y desarrollo del backend en TypeScript, integrando tRPC para comunicación eficiente entre cliente y servidor y usando Hono como framework ligero y de alto rendimiento.",
      },
      {
        en =
        "Implementation of middleware and authentication/authorization systems in tRPC, ensuring access control with JWT (jose) and cookie handling.",
        es =
        "Implementación de middleware y sistemas de autenticación/autorización en tRPC, asegurando el control de accesos con JWT (jose) y manejo de cookies.",
      },
      {
        en =
        "Design of a non-relational database in DynamoDB using the Single Table Design pattern to maximize efficiency and scalability.",
        es =
        "Diseño de base de datos no relacional en DynamoDB con el patrón Single Table Design para maximizar eficiencia y escalabilidad.",
      },
      {
        en =
        "Coordination with the business team to adjust the product proposal to client requirements and ensure technical alignment.",
        es =
        "Coordinación con el equipo de negocios para ajustar la propuesta del producto a los requerimientos del cliente y asegurar alineación técnica.",
      },
    },
  },
  {
    job_title = {
      en = "Backend Developer",
      es = "Desarrollador backend",
    },
    company = {
      en = companies.prestamype,
      es = companies.prestamype,
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    date = {
      en = "November 2022 -- January 2024",
      es = "Noviembre 2022 -- Enero 2024",
    },
    details = {
      {
        en = "Debugging of critical features to identify selected users within a reservation.",
        es = "Depuración de funcionalidades críticas para discriminar a los usuarios seleccionados en una reserva.",
      },
      {
        en =
        "Modeling of MongoDB collections and development of transactional services to avoid collisions and ensure correct email deliveries.",
        es =
        "Modelado de colecciones en MongoDB y desarrollo de servicios con transacciones para evitar colisiones y asegurar envíos correctos.",
      },
      {
        en =
        "Migrations with mongo-migrate to standardize collections when modifying schemas defined with Mongoose.",
        es =
        "Migraciones con mongo-migrate para estandarizar colecciones al modificar esquemas definidos con Mongoose.",
      },
      {
        en =
        "Refactoring of functions and methods, with partial migration to TypeScript to improve scalability and ensure schema consistency.",
        es =
        "Refactorización de funciones y métodos, con migración parcial a TypeScript para mejorar la escalabilidad y asegurar la consistencia del esquema.",
      },
      {
        en =
        "Code review to ensure standards and best practices across backend and frontend teams (Vue/Nuxt).",
        es =
        "Revisión de código para asegurar estándares y mejores prácticas en equipos de backend y frontend (Vue/Nuxt).",
      },
      {
        en =
        "Development and deployment of an AWS Lambda function to automate PDF rendering and speed up document processing.",
        es =
        "Desarrollo y despliegue de una función en AWS Lambda para automatizar la renderización de PDF y agilizar el procesamiento de documentos.",
      },
      {
        en =
        "Adaptation of an AWS S3 file upload service to project requirements, improving functionality and data management.",
        es =
        "Adaptación de un servicio de carga de archivos en AWS S3 a los requisitos del proyecto, mejorando la funcionalidad y la gestión de datos.",
      },
    },
  },
  {
    job_title = {
      en = "Backend Developer",
      es = "Desarrollador backend",
    },
    date = {
      en = "January 2022 -- October 2022",
      es = "Enero 2022 -- Octubre 2022",
    },
    company = {
      en = companies.tandia,
      es = companies.tandia,
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    details = {
      {
        en = "Maintenance of the web platform with Node.js and Laravel.",
        es = "Mantenimiento de la plataforma web con Node.js y Laravel.",
      },
      {
        en =
        "Development of services to generate Excel reports on sales transactions and warehouse stock.",
        es =
        "Desarrollo de servicios para generar informes en Excel sobre transacciones de ventas y stock de productos en almacenes.",
      },
      {
        en = "Development of services for a management dashboard in Node.js and MySQL.",
        es = "Desarrollo de servicios para un tablero de gestión en Node.js y MySQL.",
      },
      {
        en =
        "Implementation of a base template with clean architecture for new platform services using Fastify.js and Awilix in TypeScript.",
        es =
        "Implementación de una plantilla base con arquitectura limpia para nuevos servicios de plataforma usando Fastify.js y Awilix en TypeScript.",
      },
    }
  },
  {
    job_title = {
      en = "Fullstack Developer",
      es = "Desarrollador Fullstack",
    },
    date = {
      en = "September 2021 -- December 2021",
      es = "Septiembre 2021 -- Diciembre 2021",
    },
    company = {
      en = companies.link_miners,
      es = companies.link_miners,
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    details = {
      {
        en = "Maintenance of the web platform with PHP Blade and Vue.js.",
        es = "Mantenimiento de la plataforma web con PHP Blade y Vue.js.",
      },
      {
        en = "Optimization of high-latency services.",
        es = "Optimización de servicios con alta latencia.",
      },
      {
        en =
        "Correction of a critical vulnerability that allowed unauthorized access to restricted content.",
        es =
        "Corrección de una vulnerabilidad crítica que permitía acceso no autorizado a contenido restringido.",
      },
      {
        en = "Implementation of new services with unit tests using PHPUnit.",
        es = "Implementación de nuevos servicios con pruebas unitarias usando PHPUnit.",
      },
    }
  },
  {
    job_title = {
      en = "Backend Developer",
      es = "Desarrollador backend",
    },
    company = {
      en = companies.prestamype,
      es = companies.prestamype,
    },
    date = {
      en = "March 2020 -- June 2020",
      es = "Marzo 2020 -- Junio 2020",
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    details = {
      {
        en = "Maintenance and development of services in Koa.js and Mongoose.",
        es = "Mantenimiento y desarrollo de servicios en Koa.js y Mongoose.",
      },
      {
        en = "Modeling of MongoDB collections for new platform features.",
        es = "Modelado de colecciones en MongoDB para nuevas funcionalidades de la plataforma.",
      },
      {
        en =
        "Development of a service to register photos and visit data in a web application.",
        es =
        "Desarrollo de un servicio para registrar fotos y datos de visitas en una aplicación web.",
      },
    }
  },
  {
    job_title = {
      en = "Web Developer",
      es = "Desarrollador web",
    },
    date = {
      en = "March 2018 -- March 2019",
      es = "Marzo 2018 -- Marzo 2019",
    },
    company = {
      en = companies.prestamype,
      es = companies.prestamype,
    },
    location = {
      en = "Lima - Peru",
      es = "Lima - Perú",
    },
    details = {
      {
        en = "Maintenance and implementation of services with Node.js, jQuery, and Vue.js.",
        es = "Mantenimiento e implementación de servicios con Node.js, jQuery y Vue.js.",
      },
      {
        en =
        "Design of a template with a monolithic architecture for the backend with Koa.js and Mongoose.",
        es = "Diseño de una plantilla con arquitectura monolítica para el backend con Koa.js y Mongoose.",
      },
    }
  },
}

local work_experience_section = {
  title = {
    en = "Work Experience",
    es = "Experiencia laboral",
  },
  entries = work_experience_entry,
}

return work_experience_section
