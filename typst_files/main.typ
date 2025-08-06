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
    name: "Jack Hughes",
    address: "210 Millwrights Place, BS1 6JZ, Bristol",
    telephone: "07494878784",
    email: "jackmhughes1998@gmail.com",
    links: (
      "linkedin": "https://www.linkedin.com/in/jack-hughes-latchamdirect/",
      "Github": "https://github.com/jack4hughes"
    )
))


//main body.
= Academic History:
<academic-history>
== BEng Robotics: 2:1 #subtle("(2025)")
<beng-robotics>
- Designed robot control system using handheld controller input and gaze-tracking using ROS2 and OpenCV.
- Designed embedded systems for robot control, requiring communication between different micro-controllers using UART and interfacing with digital and analog sensors.
- Trained and evaluated the performance of machine vision models for classifying and localising objects within an image.

== BA Broadcast Journalism: #subtle("(2022)")
<ba-journalism>
- Learned video and audio editing, as well as camera and presenting
  skills.
- Worked efficiently to meet highly demanding daily deadlines.

= Work Experience:
<work-experience>
== Research Internship - Bristol Centre for Machine Vision #subtle("(2024)")
<research-internship>
- Acted as research assistant for study that used eye-tracking to detect early signs of dementia using an eye test designed to trigger the #link("https://en.wikipedia.org/wiki/Simon_effect")[Simon Effect.]
- Conducted statistical analysis on experimental data to find effect size and significance.
- Completed literature review of other eye-tracking methods used to detect early dementia symptoms.

== Marketing Assistant - Latcham #subtle("(2022 - 2025)")
<marketing-assistant---latcham>
- Moved Latcham from WordPress web environment to HubSpot, debugging and fixing issues with HTML, CSS and JavaScript.
- Wrote marketing copy for Latcham, improving communication, editing and
  rewriting webpages.

== HR Assistant - Latcham #subtle("(2019 - 2022)")
<hr-assistant---latcham>
- Moved Latcham from paper-based HR filing system to PeopleHR HR
  platform.
- Processed data using Excel and Power BI, giving directors dashboards
  to understand the company's financial performance and the performance
  of individual marketing sectors.
= Societies:
== UWE AI Society #subtle("(2024-2025)"):
<uwe-ai>
- Designed vectorised version of SLAM mapping system using Numpy, leading to 50x speedup when compared to previous Python implementation
- Assisted with testing of UWE Formula AI car during competion and at
  testing days.
- Wrote documentation on fastSLAM code for incoming Formula Student members.
= Skills:
- Embedded systems
- Machine Learning
- Data Analysis/Visualisation
- Project planning
- Systems integration
- Control (Tuning and evaluation of PID, Fuzzy Logic Systems and neural-net based control systems.)
== Coding Languages: #linebreak()
- C (Embedded experience with DSPic and STM32 boards.)
- Python (NumPy, Pandas, TensorFlow and MatplotLib), 
- MATLAB (Data Analysis, Algorithms and Data Visualisation), 
- Basic Rust
== Languages:
English, Basic German
