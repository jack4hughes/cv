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

//Footer logic
#let today = datetime.today()
#set page(
  columns: 2,
)

//Call to header function inside format.typ
#place(
  top + left,
  scope: "parent",
  float: true,
  cv_header(
    name: "Jack Hughes", //TODO: need to add name finding to convert.py
    address: none, //TODO: need to add address finding to convert.py
    telephone: none, //TODO: need to add telephone regex to convert.py
    links: {LINKS}
))


//main body.
{MAIN_BODY_CONTENT}
