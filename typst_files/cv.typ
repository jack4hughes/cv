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
    name: "Jack Hughes",//TODO: need to add name finding to convert.py
    address:"BS1 | Bristol", //TODO: need to add address finding to convert.py
    telephone: "07494878784", //TODO: need to add telephone regex to convert.py
    links: (
      linkedin: "https://www.linkedin.com/in/jack-hughes-latchamdirect/",
      github: "https://github.com/jack4hughes"
    )
))


//main body.
= Academic History:
<academic-history>
== BEng Robotics: 2:1 (2025)
<beng-robotics-21-2025>
- Studied Robotics at UWE. Achieved 68% overall.
- Designed robot control system for a robotic arm in ROS2 using handheld
  controller, live camera feeds and gaze-tracking user inputs.
- Designed embedded systems for robot control, requiring communication
  between different micro-controllers using UART, interfacing with
  digital and analog sensors and hardware/software debugging.
- Trained and evaluated the performance of machine learning models for
  object detection and robot positioning.

== BA Broadcast Journalism: (2022)
<ba-broadcast-journalism-2022>
Studied Journalism at the University of the West of England. \#
Experience:

== Research Internship - Bristol Centre for Machine Vision (2024)
<research-internship---bristol-centre-for-machine-vision-2024>
- Acted as research assistant for study that used eye-tracking to detect
  early signs of dementia.
- Conducted statistical analysis on experimental data, testing for
  normality, then finding effect size and significance using appropriate
  methods.
- Completed literature review of other eye-tracking methods used to
  detect early dementia symptoms.

== Marketing Assistant - Latcham (2022 - 2025)
<marketing-assistant---latcham-2022---2025>
- Moved Latcham from WordPress web environment to HubSpot, debugging and
  fixing issues with HTML, CSS and JavaScript.
- Wrote marketing copy for Latcham, improving communication, editing and
  rewriting webpages.

== HR Assistant - Latcham (2019 - 2022)
<hr-assistant---latcham-2019---2022>
- Moved Latcham from paper-based HR filing system to PeopleHR HR
  platform.
- Processed data using Excel and Power BI, giving directors dashboards
  to understand the company's financial performance and the performance
  of individual marketing sectors.

= Societies:
<societies>
== UWE AI Society (2024-2025):
<uwe-ai-society-2024-2025>
- Designed vectorised version of SLAM mapping system using Numpy,
  leading to 50x speedup when compared to previous Python implementation
- Assisted with testing of UWE Formula AI car during competion and at
  testing days.
- Wrote documentation on fastSLAM code for incoming Formula Student
  members.

= Skills:
<skills>
- Embedded systems
- Machine Learning
- Data Analysis/Visualisation
- Project planning
- Systems integration
- Control (Tuning and evaluation of PID, Fuzzy Logic Systems and
  neural-net based control systems.)
- prototype design in Solidworks.
- Basic Prototype PCB design.

== Coding Languages:
<coding-languages>
- C (Embedded experience with DSPic and STM32 boards.)
- Python (NumPy, Pandas, TensorFlow and MatplotLib),
- MATLAB (Data Analysis, Algorithms and Data Visualisation),
- Basic Rust

== Languages:
<languages>
English, Basic German

