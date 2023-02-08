# verilog_basics_samples

This repository primarily aims to convey the scripting basics of verilog with samples that i wrote during my learning curve. I used a system with Ubuntu 20.04 for this project.

At the end the reader will get enough idea about various types of adders that include 
    
    1. Ripple Carry Adder
    2. Carry bypass adder
    3. Linear carry select adder
    4. square root carry adder

As a future vision i would like to convert these adders to corresponding Netlists and layouts. Here i focused on various digital concepts and the conversion of the same concepts into verilog concepts. 

## Tools used include and Installation steps

 1. GVIM - VIM is a highly configurable text editor and GVIM is simplified VIM with GUI for the user simplicity just a site definition for the noobies :)
    Multiple methods to install the same are available. 
     
     Simple way is to use your terminal and give  :
     ```bash
     sudo apt install vim-gtk3
     ```
 2. Icarius verilog and GTKWave : 
 
    About Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into     some target formats. GTKWave is a simple but powerfull wave viewer.
    
    ```bash
     sudo apt install iverilog gtkwave
     ```
