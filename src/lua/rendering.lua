---@class Rendering
---@field make_localizer fun(lang: Lang): fun(value: LocalizedString): string
---@field make_render_section_title fun(localizer: fun(value: LocalizedString): string): fun(title: LocalizedString): nil
---@field make_render_work_experience_section fun(localizer: fun(value: LocalizedString): string): fun(section: Section<WorkExperienceEntry>): nil
---@field make_render_education_section fun(localizer: fun(value: LocalizedString): string): fun(section: Section<EducationEntry>): nil
---@field make_render_language_section fun(localizer: fun(value: LocalizedString): string): fun(section: Section<LanguageEntry>): nil
---@field make_render_interest_section fun(localizer: fun(value: LocalizedString): string): fun(section: Section<InterestEntry>): nil
---@field make_render_skills_section fun(localizer: fun(value: LocalizedString): string): fun(section: SkillsSection): nil


---@alias LocalizedStringMapper fun(value: LocalizedString): string

---@param text string
---@return string
local function escape_latex(text)
  local escaped = text
  escaped = escaped:gsub("\\", "\\textbackslash{}")
  escaped = escaped:gsub("&", "\\&")
  escaped = escaped:gsub("%%", "\\%%")
  escaped = escaped:gsub("%$", "\\$")
  escaped = escaped:gsub("#", "\\#")
  escaped = escaped:gsub("_", "\\_")
  escaped = escaped:gsub("{", "\\{")
  escaped = escaped:gsub("}", "\\}")
  escaped = escaped:gsub("~", "\\textasciitilde{}")
  escaped = escaped:gsub("%^", "\\textasciicircum{}")
  return escaped
end

---@param text string
---@return string
local function wrap_in_braces(text)
  return "{" .. text .. "}"
end

---@param text string
---@return string
local function to_bold(text)
  return "\\textbf" .. wrap_in_braces(text)
end

---@param text string
---@return string
local function to_italic(text)
  return "\\textit" .. wrap_in_braces(text)
end

---@param lang "en"|"es"
---@return LocalizedStringMapper
local function make_localizer(lang)
  ---@type LocalizedStringMapper
  return function(value)
    return escape_latex(value[lang] or "")
  end
end

---@param localizer LocalizedStringMapper
---@return fun(item: LocalizedString): nil
local function make_render_item(localizer)
  return function(item)
    tex.print("\\item" .. wrap_in_braces(localizer(item)))
  end
end

---@param localizer LocalizedStringMapper
---@return fun(items :LocalizedString[]): nil
local function make_render_items(localizer)
  local render_item = make_render_item(localizer)

  return function(items)
    local wrapped_itemize = wrap_in_braces("itemize")
    tex.print("\\begin" .. wrapped_itemize)
    for _, item in ipairs(items) do
      render_item(item)
    end
    tex.print("\\end" .. wrapped_itemize)
  end
end

---@param items string[]
local function render_plain_items(items)
  local wrapped_itemize = wrap_in_braces("itemize")
  tex.print("\\begin" .. wrapped_itemize)
  for _, item in ipairs(items) do
    tex.print("\\item" .. wrap_in_braces(item))
  end
  tex.print("\\end" .. wrapped_itemize)
end

---@param localizer LocalizedStringMapper
---@return fun(localized_str: LocalizedString): nil
local function make_render_section_title(localizer)
  return function(localized_str)
    local title = localizer(localized_str)
    if title ~= "" then
      tex.print("\\cvsection" .. wrap_in_braces(title))
    end
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(work_experience: WorkExperienceEntry): nil
local function make_render_work_experience(localizer)
  local render_items = make_render_items(localizer)
  return function(work_experience)
    local job_title = wrap_in_braces(localizer(work_experience.job_title))
    local company = wrap_in_braces(localizer(work_experience.company))
    local date = wrap_in_braces(localizer(work_experience.date))
    local location = wrap_in_braces(localizer(work_experience.location))
    tex.print("\\cvevent" .. job_title .. company .. date .. location)
    render_items(work_experience.details)
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(list: WorkExperienceEntry[]): nil
local function make_render_work_experience_list(localizer)
  local render_experience = make_render_work_experience(localizer)
  return function(list)
    local length = #list
    for i, exp in ipairs(list) do
      render_experience(exp)
      if i ~= length then
        tex.print("\\divider\\newline")
      end
    end
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(section: Section<WorkExperienceEntry>): nil
local function make_render_work_experience_section(localizer)
  local render_title = make_render_section_title(localizer)
  local render_work_experience_list = make_render_work_experience_list(localizer)

  return function(section)
    render_title(section.title)
    render_work_experience_list(section.entries)
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(education: EducationEntry): nil
local function make_render_education(localizer)
  local render_items = make_render_items(localizer)
  return function(education)
    local degree = wrap_in_braces(localizer(education.degree))
    local institution = wrap_in_braces(localizer(education.institution))
    local date = wrap_in_braces(localizer(education.date))
    local location = wrap_in_braces(localizer(education.location))
    tex.print("\\cvevent" .. degree .. institution .. date .. location)
    if education.details and #education.details > 0 then
      render_items(education.details)
    end
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(list: EducationEntry[]): nil
local function make_render_education_list(localizer)
  local render_education = make_render_education(localizer)
  return function(list)
    local length = #list
    for i, education in ipairs(list) do
      render_education(education)
      if i ~= length then
        tex.print("\\divider\\newline")
      end
    end
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(section: Section<EducationEntry>): nil
local function make_render_education_section(localizer)
  local render_title = make_render_section_title(localizer)
  local render_education_list = make_render_education_list(localizer)
  return function(section)
    render_title(section.title)
    render_education_list(section.entries)
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(section: Section<LanguageEntry>): nil
local function make_render_language_section(localizer)
  local render_title = make_render_section_title(localizer)
  return function(section)
    render_title(section.title)
    local items = {}
    for i, language in ipairs(section.entries) do
      local name = localizer(language.language)
      local level = localizer(language.level)
      local description = language.description and localizer(language.description) or ""
      if description ~= "" then
        items[i] = to_bold(name) .. ": " .. level .. " - " .. description
      else
        items[i] = to_bold(name) .. ": " .. level
      end
    end
    render_plain_items(items)
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(section: Section<InterestEntry>): nil
local function make_render_interest_section(localizer)
  local render_title = make_render_section_title(localizer)
  return function(section)
    render_title(section.title)
    local items = {}
    for i, interest in ipairs(section.entries) do
      local description = localizer(interest.description)
      if description ~= "" then
        items[i] = description
      else
        items[i] = localizer(interest.topic)
      end
    end
    render_plain_items(items)
  end
end

---@param localizer fun(value: LocalizedString): string
---@return fun(section: SkillsSection): nil
local function make_render_skills_section(localizer)
  local render_title = make_render_section_title(localizer)
  return function(section)
    render_title(section.title)
    local length = #section.categories
    for i, category in ipairs(section.categories) do
      tex.print("\\textbf" .. wrap_in_braces(localizer(category.name)))
      local items = {}
      for i, skill in ipairs(category.items) do
        local name = localizer(skill.name)
        local description = localizer(skill.description)
        if description ~= "" then
          items[i] = to_bold(name) .. ": " .. description
        else
          items[i] = name
        end
      end
      render_plain_items(items)
      if i ~= length then
        tex.print("\\divider\\newline")
      end
    end
  end
end

return {
  make_localizer = make_localizer,
  make_render_section_title = make_render_section_title,
  make_render_work_experience_section = make_render_work_experience_section,
  make_render_education_section = make_render_education_section,
  make_render_language_section = make_render_language_section,
  make_render_interest_section = make_render_interest_section,
  make_render_skills_section = make_render_skills_section,
  to_bold = to_bold,
  to_italic = to_italic,
}
