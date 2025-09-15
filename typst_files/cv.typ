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
= Core Skills:
<core-skills>
- #strong[Design tools:] MP Lab, Solidworks, PCB design in Eagle
- #strong[Programming Languages:] C/C++, Python (Numpy, TensorFlow,
  Pandas, Matplotlib, OpenCV, PyQT), ROS2, MATLAB, Verilog VHDL
- #strong[Hardware:] ESP32, dsPIC, FPGA boards, electrical testing using
  oscilloscopes, function generators and worktop power supplies
- #strong[IT Skills:] linux, git, docker.
- #strong[Languages:] English, Conversational German

= Education:
<education>
== UWE: Robotics BEng (Hons):
<uwe-robotics-beng-hons>
2:1 (2022-2025)

=== Final Year Project:
<final-year-project>
- Designed control system for Assistive Robotic Arm attached to
  wheelchair.
- Used ROS2, QT and OpenCV to design a real-time gaze-processing
  pipleline that detected when a user was looking at a screen, then used
  this to expand robot control system.
- Evaluated the performance of multiple control schemes by designing and
  conducting user testing experiments, then analysing task completion
  rates and user satisfaction using standardised tests (NASA TLX and
  SUS).

=== Group Design and Integration Project:
<group-design-and-integration-project>
- Helped to write and then work to engineering requirements, having
  regular meetings to discuss most pressing requirements.
- Focused on writing modular, extensable and testable code.
- Designed communication system between high level python code and
  microcontroller-powered robotic arm.

== UWE: BA (Hons) Journalism:
<uwe-ba-hons-journalism>
(2019-2022)

= Work experience:
<work-experience>
== Research Internship - Bristol Centre for Machine Vision (2024):
<research-internship---bristol-centre-for-machine-vision-2024>
- Acted as research assistant for study that used eye-tracking to detect
  early signs of dementia.
- Worked with researchers to manually label eye tracking data.
- Made sure data labelling was submitted on-time by creating a
  data-labelling tool to track progress.
- Conducted statistical analysis on experimental data.
- Completed literature review of other eye-tracking methods used to
  detect early dementia symptoms.

== Marketing Assistant - Latcham (2023 - 2025):
<marketing-assistant---latcham-2023---2025>
- Moved Latcham from WordPress web environment to HubSpot, debugging and
  fixing issues with HTML, CSS and JavaScript.
- Wrote marketing copy for Latcham, improving communication, editing and
  rewriting webpages.

== HR Assistant - Latcham (2019 - 2023):
<hr-assistant---latcham-2019---2023>
- Moved Latcham from paper-based HR filing system to PeopleHR HR
  platform.
- improved budgeting reporting by designing linked Excel documents,
  reducing manual entry by sales team. \# Societies:

== UWE AI Society (2024-2025):
<uwe-ai-society-2024-2025>
- Worked with the UWE SLAM team to vectorise fastSLAM algorithm using
  Numpy, leading to 10x speedup and inprovments to
- Assisted with testing of UWE Formula AI car during competion and at
  testing days.
- Wrote documentation on fastSLAM code for incoming Formula Student
  members.

