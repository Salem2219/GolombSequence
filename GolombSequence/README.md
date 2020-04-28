# Golomb sequence
In mathematics, the Golomb sequence is a non-decreasing integer sequence where n-th (up to 14) term is equal to number of times n appears in the sequence.

The first few values are
1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, ……

Explanation of few terms:
Third term is 2, note that three appears 2 times.
Second term is 2, note that two appears 2 times.
Fourth term is 3, note that four appears 3 times.



Given a positive integer n. The task is to find the first n terms of Golomb sequence.

Examples :

Input : n = 4
Output : 1 2 2 3

Input : n = 6
Output : 1 2 2 3 3 4
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to find the nth term in golomb sequence.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/GolombSequence.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd GolombSequence
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 9, then y = 5:

    ```sh
    $ vsim work.tb
    ```
