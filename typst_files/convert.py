import re
import subprocess

def convert_markdown_to_typst(input_text):
    """This converts the main body of our input_text from markdown to typst using 
    Pandoc."""
    result = subprocess.run(
        ['pandoc', '-f', 'markdown', '-t', 'typst'],
        input=input_text,
        text=True,  # Handle as text, not bytes
        capture_output=True,
        check=True  # Raises exception on error
    )
    return result.stdout

#TODO: I Think I can make most of this simpler.
if __name__ == "__main__":
    with open("../cv_copy.md") as f:
        heading_pattern =r'^#[^#](.*)'
        file = f.read()
    names = re.findall(heading_pattern, file, flags=re.MULTILINE)
      
    #Get paragraphs (set up to stop at a specific point.)
    paras = re.split(
                heading_pattern, 
                file, 
                flags=re.MULTILINE, 
                maxsplit=3)
    print(len(paras))
    
    #There has to be a better way to do this!
    main_body = "## Academic History:" + re.split(r'# Academic.*', file, flags=re.MULTILINE)[1]
    main_body_typst = convert_markdown_to_typst(main_body)
    
    #quick and dirty method to isolate contact details.
    para = str(
                [para for para in paras 
                 if "## contact details" in para][0]
                ) 
    para = para.strip() 
    
    #Editing Address out of paragraphs.
    raw_address_and_links = [line for line in para.split("\n") 
                       if "##" not in line]
    
    #combining address lines into a single delimited line.
    address = '"'
    for line in raw_address_and_links:
        if "[" not in line:
            address += line + " "
    address = address[:-2]
    address += '"'
    print(address)

    #TODO: find telephone
    
    # Finding Links
    links = [line for line in raw_address_and_links if "[" in line]
    # turning links into array of arrays using regex
    links_regex = [re.match('\[(.*)\]\((.*)\)', link).groups() for link in links]

    # finally turning links into a typst dict.
    links_typst_dict = "("
    for link_name, url in links_regex:
        links_typst_dict += f'"{link_name}": "{url}",\n'
    links_typst_dict += ")"
    telephone = "none" #for the moment! Need to create a regex that can detect a UK telephone number: https://www.dialpad.com/uk/blog/uk-phone-number-format/

    format_dict = {
            "ADDRESS": address,
            "LINKS": links_typst_dict,
            "TELEPHONE": "none",
            "MAIN_BODY_CONTENT": main_body_typst 
            }

with open("template.typ", "r") as typst_file:
    typst_template_string = typst_file.read()
    output = typst_template_string.format(**format_dict)

with open("test.typ", "w") as test_file:
    test_file.write(output)
