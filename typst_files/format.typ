// Need to find some way of making this more extensible? Maybe with some mapping of a dictionary or a list with specific icons if they are known already?

#import "links.typ": display_links, links
// simple subtle function to make dates grey. #TODO: change colour and move to format.typ
#let subtle(input_text) = {
  return text(input_text, fill: rgb(128, 128, 128, 255))
}

#let contact_details(
  address: "210 Millwrights Place,  Bristol, BS1 9JZ", 
  telephone: "07494878784",
  email: "jackmhughes1998@gmail.com",
  links: none) = {
    set align(right)
    set text(size: 10pt)
    [
      #if address != none {
        let parts = address.split(", ")
        parts.map(part => part.trim()).join([,#linebreak()])
        linebreak()
      }
      #if telephone != none {
        [#telephone #linebreak()]
      }
      #if email != none {
        [#email #linebreak()]
      }
      #if links != none {
        display_links(links)
      }
    ]
}

#let title(name) = {
  set text(
    font: "Charter",
    size: 36pt, 
    fill: rgb(4, 82, 125, 255),
    stretch: 150%
  )
  [#name - CV]
}

#let cv_header(
  name: none,
  address: none, 
  telephone: none,
  email: none,
  links: none
) = {
  pad(grid(
    columns: (2fr, 1fr),
    title(name),
    contact_details(
      address: address, 
      telephone: telephone, 
      links: links
    )
  ),
  bottom: 10pt
)
}
