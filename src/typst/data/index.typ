#import "work_experience.typ": work_experience_section
// #import "contributions.typ": contributions_section
#import "education.typ": education_section
#import "language.typ": language_section
#import "interest.typ": interest_section
#import "skills.typ": skills_section

#let data = {
  let personal = (
    name: "JHONY ELMER ANGULO FABIAN",
    tagline: (
      en: "Software Engineer",
      es: "Ingeniero de software",
    ),
    email: "jhonyangulof@gmail.com",
    phone: sys.inputs.at("phone", default: ""),
    location: (
      en: "Lima, Peru",
      es: "Lima, Perú",
    ),
    github: "github.com/jeafleohj",
    linkedin: "linkedin.com/in/jhony-angulo-fabian-011a6a1a1",
  )

  (
    personal: personal,
    sections: (
      work_experience: work_experience_section,
      // contributions: contributions_section,
      education: education_section,
      language: language_section,
      interest: interest_section,
      skills: skills_section,
    ),
  )
}
