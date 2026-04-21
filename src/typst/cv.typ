#import "data.typ": cv
#import "data/index.typ": data
#import "data/contributions.typ": contributions_section
#import "layout.typ": *

#let (personal, sections) = data

#set document(
  title: personal.name + " - CV",
  author: personal.name,
)

#set page(
  paper: "a4",
  margin: (x: 1.55cm, y: 1.35cm),
)

#set text(
  font: "Helvetica",
  size: 10pt,
  lang: lang,
)

#set par(
  leading: 0.55em,
  justify: false,
)

#set list(
  marker: "-",
  indent: 1.05em,
  body-indent: 0.45em,
)

#align(center)[
  #text(size: 17pt, weight: "bold")[#personal.name]
  #linebreak()
  #text(size: 10.5pt)[#tr(personal.tagline)]
  #linebreak()
  #text(size: 9.2pt)[
    #link("mailto:" + personal.email)[#personal.email]
    | #personal.phone
    | #link("https://" + personal.github)[#cv.personal.github]
    | #link("https://" + personal.linkedin)[#cv.personal.linkedin]
    | #tr(personal.location)
  ]
]

#let (work_experience, education, language, interest, skills) = sections

#section-title(tr(work_experience.title))
#for (job_title, date, company, location, details) in work_experience.entries {
  header_row(
    job_title,
    date,
    company,
    location,
  )
  // v(0.2em)

  for entry in details {
    [- #tr(entry)]
  }
  v(0.5em)
}

#section-title(tr(education.title))
#for (degree, date, institution, location) in education.entries {
  header_row(
    degree,
    date,
    institution,
    location,
  )
  v(0.5em)
}

#section-title(tr(language.title))
#for item in language.entries {
  [
    - #strong(tr(item.language)): #tr(item.level) - #tr(item.description)
  ]
}

#section-title(tr(interest.title))
#for item in interest.entries {
  [
    - #tr(item.description)
  ]
}

#section-title(tr(skills.title))
#for item in skills.categories {
  [
    #tr(item.name)
    #for i in (item.items) {
      [- #tr(i.name): #tr(i.description)]
    }
  ]
}
