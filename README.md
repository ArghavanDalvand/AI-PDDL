# AI-PDDL
## Introduction
    This repository contains PDDL (Planning Domain Definition Language) code for planning problems solved using the Best-First Width Search (BFWS) solver.

## Requirements
  . Any PDDL editor (optional, for editing PDDL files).
  . BFWS Solver.

---

### Context of this project
In the context of space exploration on Mars, the next-generation autonomous rover, MR-1, is tasked with conducting terrain analysis operations to collect scientific data. Equipped with advanced sensors and sophisticated data processing capabilities, MR-1 is designed to explore the Martian terrain and gather crucial mission information.

### Mission Steps
The MR-1 mission involves several steps to ensure the successful gathering of chemical information from the soil:

1. **Navigation and Positioning**
   - MR-1 navigates the Martian surface using a topological map and real-time navigation algorithms, maintaining stability over varied terrain.

2. **Deployment of Scientific Instruments**
   - MR-1 deploys its scientific instruments, including spectrometers, cameras, and radar systems, to collect data on the Martian surface.

3. **Data Collection**
   - MR-1 activates the appropriate instruments to gather location-specific scientific data, such as surface composition and subsurface features.

4. **Data Processing**
   - The collected data is processed partly onboard and partly transmitted to Earth for further analysis.

5. **Decision Making**
   - MR-1 makes decisions on data collection based on location-specific requirements, including the number of readings needed for each sensor.

6. **Data Transmission**
   - After data collection, MR-1 transmits the data back to Earth during suitable communication windows.

### PDDL Implementation
This project includes a PDDL domain that models the "scientist Martian rover scenario" and at least one PDDL problem that generates a valid plan for MR-1's mission. The PDDL code covers all aspects of MR-1's capabilities, including navigation, instrument deployment, data collection, processing, decision making, and data transmission.
