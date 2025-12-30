-- Entry point for Lua helpers used in LuaLaTeX.
local H = {}

local function tex_escape(value)
  return tostring(value):gsub("([%%#$&_{}])", "\\%1")
end

function H.personalinfo(tagline)
  local phone = os.getenv("CV_PHONE")

  tex.sprint("\\name{JHONY ELMER ANGULO FABIAN}")
  tex.sprint("\\tagline{" .. tagline .. "}")
  tex.sprint("\\personalinfo{")
  tex.sprint("\\email{jhonyangulof@gmail.com}")
  if phone and phone ~= "" then
    tex.sprint("\\phone{" .. tex_escape(phone) .. "}")
  end
  tex.sprint("\\location{Lima, Peru}")
  tex.sprint("\\github{jeafleohj}")
  tex.sprint("\\linkedin{jhony-angulo-fabian-011a6a1a1}")
  tex.sprint("}")
end

---@type Rendering
local rendering = dofile("src/lua/rendering.lua")


---@param lang Lang
---@return fun(section: Section<WorkExperienceEntry>): nil
function H.make_render_work_experience_section(lang)
  local localizer = rendering.make_localizer(lang)
  local render_experience = rendering.make_render_work_experience_section(localizer)

  return function(section)
    render_experience(section)
  end
end

---@param lang Lang
---@return fun(section: Section<WorkExperienceEntry>): nil
function H.make_render_experiences(lang)
  return H.make_render_work_experience_section(lang)
end

---@param lang Lang
---@return fun(section: Section<EducationEntry>): nil
function H.make_render_education_section(lang)
  local localizer = rendering.make_localizer(lang)
  return rendering.make_render_education_section(localizer)
end

---@param lang Lang
---@return fun(section: Section<LanguageEntry>): nil
function H.make_render_language_section(lang)
  local localizer = rendering.make_localizer(lang)
  return rendering.make_render_language_section(localizer)
end

---@param lang Lang
---@return fun(section: Section<InterestEntry>): nil
function H.make_render_interest_section(lang)
  local localizer = rendering.make_localizer(lang)
  return rendering.make_render_interest_section(localizer)
end

---@param lang Lang
---@return fun(section: SkillsSection): nil
function H.make_render_skills_section(lang)
  local localizer = rendering.make_localizer(lang)
  return rendering.make_render_skills_section(localizer)
end

---@param lang Lang
---@return nil
function H.make_render_cv(lang)
  local localizer = rendering.make_localizer(lang)
  local render_work_experience = rendering.make_render_work_experience_section(localizer)
  local render_education = rendering.make_render_education_section(localizer)
  local render_language = rendering.make_render_language_section(localizer)
  local render_interest = rendering.make_render_interest_section(localizer)
  local render_skills = rendering.make_render_skills_section(localizer)

  ---@type CvData
  local data = dofile("src/lua/data/index.lua")

  render_work_experience(data.work_experience)
  render_education(data.education)
  render_language(data.language)
  render_interest(data.interest)
  render_skills(data.skills)
end

return H
