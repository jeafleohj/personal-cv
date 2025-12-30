---@type InterestEntry[]
local interest_entries = {
  {
    topic = {
      en = "Category Theory",
      es = "Teoría de Categorías",
    },
    description = {
      en =
      "Interest in the study of mathematical structures and their application to functional programming to improve code reliability.",
      es =
      "Interés en el estudio de estructuras matemáticas y su aplicación a la programación funcional para mejorar la fiabilidad del código.",
    }
  },
  {
    topic = {
      en = "Functional Programming Languages",
      es = "Lenguajes de Programación Funcional",
    },
    description = {
      en =
      "Interest in functional languages such as Haskell and Clojure, focused on efficient, reliable, and concise code.",
      es =
      "Interés en lenguajes funcionales como Haskell y Clojure, con foco en código eficiente, fiable y conciso.",
    }
  },
  {
    topic = {
      en = "Rust Programming Language",
      es = "Lenguaje de Programación Rust",
    },
    description = {
      en =
      "Interest in Rust for performance, safety, and concurrency applied to systems programming.",
      es =
      "Interés en Rust por su rendimiento, seguridad y concurrencia aplicados a programación de sistemas.",
    },
  },
  {
    topic = {
      en = "Cloud Computing",
      es = "Computación en la Nube",

    },
    description = {
      en =
      "Interest in scalable and efficient cloud architectures to improve operations.",
      es =
      "Interés en arquitecturas en la nube escalables y eficientes para mejorar operaciones.",
    }
  }
}

local interest_section = {
  title = {
    en = "Interests",
    es = "Intereses",
  },
  entries = interest_entries,
}

return interest_section
