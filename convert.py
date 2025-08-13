import re
import subprocess

MARKDOWN_LOC = "cv_copy.md"
TYPST_TEMPLATE_LOC = "typst_files/template.typ"
OUTPUT_FILE_LOC = "typst_files/cv.typ"
OUTPUT_PDF_LOC = "cv.pdf"


def convert_markdown_to_typst(input_text):
    """This converts the main body of our input_text from markdown to typst using
    Pandoc."""
    result = subprocess.run(
        ["pandoc", "-f", "markdown", "-t", "typst"],
        input=input_text,
        text=True,  # Handle as text, not bytes
        capture_output=True,
        check=True,  # Raises exception on error
    )
    return result.stdout


def convert_link_to_typst(link: str) -> str:
    """Converts a markdown link to a typst link!"""
    link_name, url = re.match("\[(.*)\]\((.*)\)", link).groups()
    print(link_name, url)


def seperate_header(markdown_text: str) -> (str, str):
    """seperates the header and the body of the text, returning both in a tuple.

    INPUTS:
        markdown_text: This is the raw text contained in cv_copy.md.
    OUTPUTS:
        header: This is the raw markdown in the header. The header is defined as the text under our first H1 or # tag.

    TODO: should seperate header detection from splitting to allow for easy format changes if I get the time."""
    heading_pattern = r"^#[^#](.*)"
    names = re.findall(heading_pattern, markdown_text, flags=re.MULTILINE)
    print(names)
    # the only h1 before body starts should be our intro.
    body_start = names[1]

        # Grab everything before body_start
    body_start_index = markdown_text.index(body_start)
    # must be a better way to strip final hashtag.
    header = markdown_text[:body_start_index].strip()[:-1]

    body = markdown_text[body_start_index - 2 :]  # This is the start of the body.

    return header, body


def parse_header(header: str) -> str:
    """Converts our markdown header to a header that can be inserted into typst document.

    """
    
   # finding telephone
    telephone_numbers_found = re.match(r"\b07\d{9}\b", header, re.MULTILINE)
    ## Finding Links:
    bracket_text = r"[^\]]+"  # anything except ]
    paren_url = r"[^)]+"  # anything except )
    pattern = rf"\[({bracket_text})\]\(({paren_url})\)"

    links_found = re.findall(pattern, header)

    for link in links_found:
        convert_link_to_typst()
    return


def convert_body(body: str) -> str:
    """Converts the body of the CV to Typst format.

    inputs:
        body: a text string containing markdown for the body of a text.
    outputs:
        typst_body, the converted

    This is very similar to convert_markdown_to_typst but there are some style differences 
    (that I still need to implement!):

    1. anything in parentheses () in a heading is wrapped with a #subtle tag. This is used to make
    dates less prominent.
    2. Add other style differences here:

    TODO: Implement subtle date processing"""
    return convert_markdown_to_typst(body)


# Thttps://github.com/jack4hugheiODO: I Think I can make most of this simpler
if __name__ == "__main__":
    # load in markdown CV
    with open(MARKDOWN_LOC, "r") as f:
        raw_markdown = f.read()
    
    # Load Typst CV Template.
    with open(TYPST_TEMPLATE_LOC, "r") as f:   
        typst_template = f.read()

    header, main_body = seperate_header(raw_markdown) 
    main_body_typst = convert_body(main_body)

    # If you want to add any more dynamically decided variables to your typst document, 
    # add them to the format dict.
    format_dict = {
            "MAIN_BODY_CONTENT": main_body_typst,
            }
    
    #write typst document
    typst_document = typst_template.format(**format_dict)
    
    with open(OUTPUT_FILE_LOC, "w") as f:
        f.write(typst_document)
    
    subprocess.run([
        "typst", 
        "compile",
        OUTPUT_FILE_LOC, 
        OUTPUT_PDF_LOC
        ]
    )
    
    # Opens PDF viewer, then immediately returns to your terminal shell/code editor.
    # This currently only works for MacOS
    result = subprocess.run([
    "osascript", "-e", 
    'tell application "System Events" to return name of first application process whose frontmost is true'
    ], 
    capture_output=True, 
    text=True)

    current_app = result.stdout.strip()

    subprocess.run(["open", "-g", OUTPUT_PDF_LOC])
    subprocess.run([
        "osascript", 
        "-e", 
        f'tell application "{current_app}" to activate'
        ]
                   )


