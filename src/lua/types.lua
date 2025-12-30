---@alias Lang
---| "en"
---| "es"

---@class LocalizedString
---@field en string
---@field es string
---


---@class WorkExperienceEntry
---@field company LocalizedString -- Company name
---@field job_title LocalizedString -- Role/title
---@field date LocalizedString -- e.g. "Jan 2020 -- Present"
---@field location LocalizedString -- City - Country
---@field details LocalizedString[] -- Bullet points for responsibilities/impact

---@alias WorkExperienceEntryList WorkExperienceEntry[]

---@class EducationEntry
---@field institution LocalizedString -- University/Institute
---@field degree LocalizedString -- Degree or program
---@field date LocalizedString -- e.g. "March 2017 -- July 2022"
---@field location LocalizedString -- City - Country
---@field details? LocalizedString[] -- Optional bullets (achievements/notes)

---@alias EducationEntryList EducationEntry[]

---@class LanguageEntry
---@field language LocalizedString -- Language name
---@field level LocalizedString -- "Native" | "Fluent" | "Intermediate" | "Basic"
---@field description? LocalizedString -- Extra notes

---@class InterestEntry
---@field topic LocalizedString -- Interest title
---@field description LocalizedString -- Free-form details

---@class SkillItem
---@field name LocalizedString -- Skill name (e.g. "JavaScript/TypeScript")
---@field description LocalizedString -- Short details

---@class SkillCategory
---@field name LocalizedString -- Category title (e.g. "Frameworks")
---@field items SkillItem[]

---@class SkillsSection
---@field title LocalizedString -- Section title (e.g. "Technical Skills")
---@field categories SkillCategory[]



---@alias Section<T> { title: LocalizedString, entries: T[] }

---@class CvData
---@field work_experience Section<WorkExperienceEntry>
---@field education Section<EducationEntry>
---@field language Section<LanguageEntry>
---@field interest Section<InterestEntry>
---@field skills SkillsSection

---@class CvLegacyData
---@field experience WorkExperienceEntry[]
---@field education_entry EducationEntry[]
---@field language_entry LanguageEntry[]
---@field interest_entry InterestEntry[]
---@field skills_section SkillsSection

-- ---@alias WorkExperienceSection Section<WorkExperienceEntry>
-- ---@alias EducationSection Section<EducationEntry>
-- ---@alias LanguageSection Section<LanguageEntry>
-- -- FIX: Miisng one-@alias Section Section<WorkExperienceEntry>
