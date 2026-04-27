#let work_experience_section = {
  let companies = (
    prestamype: "Prestamype",
    tandia: "Tandia",
    link_miners: "LinkMiners",
  )

  let work_experience_entry = (
    (
      job_title: (
        en: "Backend Developer",
        es: "Desarrollador backend",
      ),
      date: (
        en: "August 2024 - Present",
        es: "Agosto 2024 - Actualidad",
      ),
      company: (
        en: companies.prestamype,
        es: companies.prestamype,
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      details: (
        (
          en: "Owned backend architecture in TypeScript, defined API contracts with tRPC, and selected a low-overhead, scalable stack.",
          es: "Diseño y responsabilidad sobre la arquitectura backend en TypeScript, definiendo contratos de API con tRPC y seleccionando una arquitectura escalable y de baja sobrecarga.",
        ),
        (
          en: "Defined and implemented platform-level authentication and authorization mechanisms (JWT, cookies), with direct ownership of security and access control.",
          es: "Definición e implementación de mecanismos de autenticación y autorización a nivel de plataforma (JWT, cookies), con responsabilidad directa sobre seguridad y control de accesos.",
        ),
        (
          en: "Designed DynamoDB data models using single-table design, based on access patterns and schema decisions focused on scalability and operational efficiency.",
          es: "Diseño del modelo de datos en DynamoDB utilizando single-table design, basado en patrones de acceso y decisiones de esquema orientadas a escalabilidad y eficiencia operativa.",
        ),
        (
          en: "Implemented event-driven flows with DynamoDB Streams and OpenSearch indexing/search to support efficient queries and eventual consistency.",
          es: "Implementación de flujos orientados a eventos mediante DynamoDB Streams, con indexación y búsqueda en OpenSearch para soportar consultas eficientes y consistencia eventual.",
        ),
        (
          en: "Go tooling for webhook ingestion and validation, improving observability, reliability, and traceability of external integrations.",
          es: "Desarrollo de herramientas en Go para consumo y validación de webhooks, mejorando observabilidad, confiabilidad y trazabilidad de integraciones externas.",
        ),
      ),
    ),
    (
      job_title: (
        en: "Backend Developer",
        es: "Desarrollador backend",
      ),
      company: (
        en: companies.prestamype,
        es: companies.prestamype,
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      date: (
        en: "November 2022 - January 2024",
        es: "Noviembre 2022 - Enero 2024",
      ),
      details: (
        (
          en: "Evolution and maintenance of critical backend services, prioritizing data consistency and operational reliability.",
          es: "Evolución y mantenimiento de servicios backend críticos, priorizando consistencia de datos y confiabilidad operativa.",
        ),
        (
          en: "Design and execution of MongoDB schema changes through controlled migrations, reducing deployment risk.",
          es: "Diseño y ejecución de cambios de esquema en MongoDB mediante migraciones controladas, reduciendo riesgo en despliegues.",
        ),
        (
          en: "Development and deployment of serverless solutions in AWS (Lambda, S3) to automate document processing and internal workflows.",
          es: "Desarrollo y despliegue de soluciones sin servidor en AWS (Lambda, S3) para automatizar procesamiento de documentos y flujos internos.",
        ),
      ),
    ),
    (
      job_title: (
        en: "Backend Developer",
        es: "Desarrollador backend",
      ),
      date: (
        en: "January 2022 - October 2022",
        es: "Enero 2022 - Octubre 2022",
      ),
      company: (
        en: companies.tandia,
        es: companies.tandia,
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      details: (
        (
          en: "Maintenance and evolution of backend services in Node.js and Laravel for production systems.",
          es: "Mantenimiento y evolución de servicios backend en Node.js y Laravel sobre sistemas productivos.",
        ),
        (
          en: "Development of support services for reporting and management dashboards on MySQL.",
          es: "Desarrollo de servicios de soporte para reportes y tableros de gestión sobre MySQL.",
        ),
      ),
    ),
    (
      job_title: (
        en: "Full Stack Developer",
        es: "Desarrollador full stack",
      ),
      date: (
        en: "September 2021 - December 2021",
        es: "Septiembre 2021 - Diciembre 2021",
      ),
      company: (
        en: companies.link_miners,
        es: companies.link_miners,
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      details: (
        (
          en: "Maintenance and optimization of the web platform (PHP, Vue.js), addressing performance and latency issues in production.",
          es: "Mantenimiento y optimización de la plataforma web (PHP, Vue.js), abordando problemas de rendimiento y latencia en producción.",
        ),
        (
          en: "Identification and correction of a critical authorization vulnerability that allowed unauthorized access to restricted content.",
          es: "Identificación y corrección de una vulnerabilidad crítica de autorización que permitía acceso no autorizado a contenido restringido.",
        ),
      ),
    ),
    (
      job_title: (
        en: "Backend Developer",
        es: "Desarrollador backend",
      ),
      company: (
        en: companies.prestamype,
        es: companies.prestamype,
      ),
      date: (
        en: "March 2020 - June 2020",
        es: "Marzo 2020 - Junio 2020",
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      details: (
        (
          en: "Development and maintenance of backend services in Node.js (Koa) with MongoDB, along with implementation of web interfaces using Vue.js for platform features.",
          es: "Desarrollo y mantenimiento de servicios backend en Node.js (Koa) con MongoDB, junto con implementación de interfaces web utilizando Vue.js para funcionalidades de la plataforma.",
        ),
      ),
    ),
    (
      job_title: (
        en: "Web Developer",
        es: "Desarrollador web",
      ),
      date: (
        en: "March 2018 - March 2019",
        es: "Marzo 2018 - Marzo 2019",
      ),
      company: (
        en: companies.prestamype,
        es: companies.prestamype,
      ),
      location: (
        en: "Lima, Peru",
        es: "Lima, Perú",
      ),
      details: (
        (
          en: "Maintenance and implementation of services with Node.js, jQuery, and Vue.js.",
          es: "Mantenimiento e implementación de servicios con Node.js, jQuery y Vue.js.",
        ),
        (
          en: "Designed a monolithic backend template using Koa.js and Mongoose.",
          es: "Diseño de una plantilla con arquitectura monolítica para el backend con Koa.js y Mongoose.",
        ),
      ),
    ),
  )


  (
    title: (
      en: "Work Experience",
      es: "Experiencia laboral",
    ),
    entries: work_experience_entry,
  )
}
