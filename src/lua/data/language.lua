---@type LanguageEntry[]
local language_entry = {
  {
    language = {
      en = "Spanish",
      es = "Español",
    },
    level = {
      en = "Native",
      es = "Nativo",
    },
    description = {
      en = "Continuous professional and academic use.",
      es = "Uso profesional y académico continuo.",
    },
  },
  {
    language = {
      en = "English",
      es = "Inglés",
    },
    level = {
      en = "Intermediate",
      es = "Intermedio",
    },
    description = {
      en = "Reading of technical documentation and listening comprehension in a software context; continuous learning.",
      es =
      "Lectura de documentación técnica y comprensión auditiva en contexto de software; aprendizaje continuo.",
    },
  },
  {
    language = {
      en = "Portuguese",
      es = "Portugués",
    },
    level = {
      en = "Basic",
      es = "Básico",
    },
    description = {
      en = "Basic reading and listening comprehension.",
      es = "Comprensión básica de lectura y contenido oral.",
    },
  },
}


local language_section = {
  title = {
    en = "Languages",
    es = "Idiomas",
  },
  entries = language_entry,
}

return language_section
