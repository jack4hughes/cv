/*This is my CV! Its created in a markup language called Typst. If you 
want to know more about Typst, or you want to compile this CV on your
own, then ill leave a link to the documentation here: 
https://typst.app/docs/. 

Basically it's a competitor/attempted improvment to LaTeX. 

*/

#import "format.typ": cv_header, subtle
#import "links.typ": links, display_links
//setting up global variables and functions.
#set text(region: "GB")
#set text(11pt)
//Footer logic
#let today = datetime.today()
#set page(
  columns: 2,
)

#show heading.where(
  level: 1
): it => text(
  size: 15pt,
  weight: "bold",
  it.body + parbreak()
)

#show heading.where(
  level: 2
): it => text(
  size: 13pt,
  weight: "bold",
  it.body + linebreak(),
)

//Call to header function inside format.typ
#place(
  top + left,
  scope: "parent",
  float: true,
  cv_header(
    name: "Jack Hughes",//TODO: need to add name finding to convert.py
    address:"BS1 | Bristol", //TODO: need to add address finding to convert.py
    telephone: "07494878784", //TODO: need to add telephone regex to convert.py
    links: (
      linkedin: "https://www.linkedin.com/in/jack-hughes-latchamdirect/",
      github: "https://github.com/jack4hughes"
    )
))


//main body.
{MAIN_BODY_CONTENT}
