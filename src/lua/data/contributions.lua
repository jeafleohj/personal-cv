---@type InterestEntry[]
local contribution_entries = {
  {
    topic = {
      en = "",
      es = "",
    },
    description = {
      en = "Contributions to nixpkgs (Codex): build fixes and update workflow improvements, iterating with reviewer feedback.",
      es = "Contribuciones a nixpkgs (Codex): fixes de compilacion y mejoras al flujo de actualizacion, iterando con feedback de reviewers.",
    },
  },
}

local contributions_section = {
  title = {
    en = "Open Source Contributions",
    es = "Contribuciones Open Source",
  },
  entries = contribution_entries,
}

return contributions_section
