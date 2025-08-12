# Plan for CV converter:
I want my CV to be able to be viewed in three seperate formats:
- Markdown (for github)
- PDF (for submission to job applications)
- HTML (for a website im designing.)

I dont want to edit the CV in multiple places, so we will need to write a conversion pipeline to do this.

I want the original CV file to be a single document, I dont want to mess around with multiple tags or different relational databases of skills/education entries.

I dont want to call an LLM each time I make edits, so I'm using code to convert between different formats.

# The Plan:
+ seperate the header section (everything before Academic History, but in reality Contact Details and the title)
+ Process the header section to allow for seperate formatting in Typst and HTML.
+ Convert the body section using Pandoc or another off-the-shelf converter tool.

This will produce .typ and .html outputs from a .md input.

# The Implementations:
At the moment, I'm using some slightly dodgy regex commands to process the document, I need to clean this up at some point! I should seperate the logic that seperates the header and the body from the code that returns a seperate header and body document. 
