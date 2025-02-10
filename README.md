# Abstract

This project presents the development of a Reduced Instruction Set Computing (RISC) CPU using Verilog, aiming to progressively expand its capabilities from basic arithmetic operations to encompass more intricate instructions and processor elements. Utilizing Intel Quartus Prime for design, the project progresses through various phases focusing on datapath construction, memory subsystem integration, logic implementation for instruction selection and encoding, conditional branching, and the control unit. Challenges encountered during hardware execution proved difficult for the team and eventually led to incompletion of the final part of the last phase of the project. However, despite this obstacle, significant milestones were achieved, and the project was a great educational experience for all team members. Future improvements will focus on addressing hardware execution challenges and optimizing performance metrics, to hopefully eventually get the system running on an FPGA.

# Table of Contents

- [Project Specification](#project-specification)
- [Project Design and Implementation](#project-design-and-implementation)
  - [Datapath](#datapath)
  - [Phase 1](#phase-1)
  - [Phase 2](#phase-2)
  - [Control Unit](#control-unit)
  - [Phase 3](#phase-3)
  - [Additional Features](#additional-features)
  - [Phase 4](#phase-4)
- [Evaluation Results](#evaluation-results)
  - [Maximum Frequency of Operation](#maximum-frequency-of-operation)
  - [Average Instruction Length](#average-instruction-length)
  - [Average Cycle Per Instruction (CPI)](#average-cycle-per-instruction-cpi)
  - [Percentage of Chip Area](#percentage-of-chip-area)
  - [On-Board Operation](#on-board-operation)
- [Discussion](#discussion)
- [Conclusion and Future Work](#conclusion-and-future-work)

# Project Specification

The objective of the project was to create a Reduced Instruction Set Computing (RISC) CPU, using the hardware modelling language Verilog, chosen by the team. This CPU was to execute a small set of simple instructions quickly and efficiently with increasing complexity and intricacy at each phase. Starting off with simple instructions such as ADD, SUB, MUL, etc., and subsequently adding immediate instructions, load, store and branching instructions, using conditional checks. 

Additionally, the group was able to implement a control unit that oversaw the execution of instructions and was able to fetch them from memory, decode them and complete the execution, by allocating the necessary resources. This allowed for faster and more efficient processing, allowing it to manage operations with data movement between registers and memory. 

Lastly, the group was able to verify the processor’s operations through a simulation. This step also involved running the program on an FPGA, however; the group was unable to get the seven-segment display to increment properly and fully demonstrate the processor on a hardware level. 

All of this was to be completed in Intel Quartus Prime, which is a design software by Intel for programmable logic devices. The group was previously familiar with this software from classes such as ELEC 271 and ELEC 374, that taught basic use of VHDL and creating schematic based logic systems. 

# Project Design and Implementation

## Datapath

The final design’s datapath was implemented by following the instructions for the Mini-SRC in the Lab Reader and from the first 2 phases of the lab. The primary components of the datapath are the 16 general purpose registers, the ALU, the memory subsystem, the select and encode logic, the PC, the IR, the external port connections, and the bus that connects them all together. An overview of the datapath can be seen below. 

![0](https://github.com/user-attachments/assets/1aa55177-863a-4350-a21a-46b1f5e0c855)

## Phase 1

The first phase of the lab involved designing the general-purpose registers, the special registers, the ALU, and the bus for the datapath. To accomplish this, two register Verilog modules were created, one with a data width of 32 bits and one with a data width of 64 bits for the Z register. Then, control signals for data in and data out were created for each register as well as 32-bit wires for the output of each register to be connected to the bus input. The chosen bus is a single, bidirectional 32-bit bus which uses a 32:1 multiplexer as well as a 32-to-5 decoder to select which of the 23 signals should be put on the bus at any given time. 

Another major component of this phase was the ALU. To achieve this, an overall ALU module was created to handle the assignment of inputs and outputs, and then multiple smaller ALU modules were created to implement ALU functions that could not be achieved using simple Verilog syntax (or were prohibited by the lab instructions). The three additional modules created were a ripple carry adder-subtractor, a Booth’s bit-pair multiplication module, and a non-restoring division module. 

The adder-subtractor implemented ripple carry addition with an addition mode signal to handle both addition and subtraction with the same circuit. The diagram from which this weas modeled on can be seen below. 

![1](https://github.com/user-attachments/assets/a17c578c-811c-4d6e-80d6-b67aa20a5275)

The multiplication module implemented Booth’s algorithm with bit-pair recoding of the multiplier. This was implemented by looking at 3 bits of the multiplier at a time and using the recoding table to determine whether an addition or subtraction should be performed and whether a shift left or right should be performed. The division module implemented the non-restoring division algorithm as described in class, meaning that the algorithm is repeated 32 times for the 32-bit divisor. 

Since both the multiplication and division modules took 2 32-bit inputs and produced 64-bits worth of output, a special Z register needed to be created to handle the incoming data and then to transfer that data over 2 cycles onto the 32-bit bus. 

## Phase 2

The primary design goals of phase 2 were to implement the memory subsystem, the select and encode logic, the conditional logic, as well as to add functionality to some of the special registers that were only created as general-purpose registers in phase 1. 

Firstly, the memory subsystem was implemented by creating a custom two-port RAM module loosely based on the RAM6116 SRAM specification. However, as mentioned, the design was adapted to a 2-port design and the output enable signal was removed for simplicity. Additionally, rather than using components from Quartus’ built-in IP catalog, our RAM was stored as an array of 512 32-bit wide regs in the custom RAM module. This tradeoff of increased chip usage was made for simplicity and while it increased the overall chip usage of our design, we were still able to reduce the memory size to run the proper test programs in phase 3 and phase 4. After creating the RAM module, the MAR and MDR registers were configured to send and receive signals from the RAM module according to the figure below.

![2](https://github.com/user-attachments/assets/7e5f9723-62fd-433f-acec-22144bca34a9)

Meanwhile, another module was created to handle the select and encode logic. The purpose of this module was to use the IR contents and 6 additional control signals to handle the assertion of any of the input or output signals for all general-purpose registers as well as the immediate value from the instruction. This was a relatively simple process and makes use of multiple switch and if statements to select the corresponding signal based on the input values. 

Elsewhere, the condition logic module was created by following the specifications as described in the Lab Reader. However, there were some challenges with a delays from the CON module’s inputs and the CON flip flop input where the CON flip flop would capture data before the real data was properly asserted in the circuit, resulting in incorrect branch conditions being met. To fix this, a manual 2 ns delay was added to the CONin signal to give time for the inputs to propagate through the circuit before being captured in the CON flip flop. The circuit implemented can be seen below. 

![3](https://github.com/user-attachments/assets/993ac498-5e11-4d73-bcda-5b1e5cae69c7)

The last changes in this phase were relatively simple tweaks and involved creating a specialized R0 register module to handle the assertion of the BAout signal as well as connecting the in and out ports to “external” connections in the testbenches. 

And with the completion of phase 2, the full datapath was completed, although, at that point it still required manual control in testbenches to perform operations as there was no control unit to provide signals. 

## Control Unit

### Phase 3

The goal of phase 3 was to develop a control unit that would handle the assertion and de-assertion of all signals for all supported instructions. When combined with the existing datapath, the result would be a fully functional processor capable of executing any set of instructions. 

Implementation of the control unit was done using a finite state machine (FSM) with 77 distinct states to handle each step of each instruction. Each instruction uses the same first 3 steps to fetch the instruction from memory. Next, the opcode can be extracted and used by the control unit to determine the proper next state of the FSM for every instruction. Each instruction then goes through its requisite steps where the control unit asserts the proper signals to control registers, the ALU, and the memory subsystem as needed. Then, assuming the halt command is not received, the FSM returns to the instruction fetch steps and the whole operation repeats.  

Once the FSM was properly configured and the proper signals were asserted in each state, the last requirement was to integrate the control unit with the datapath from phase 1 and phase 2. This meant configuring the output reg signals from the control unit module to corresponding to the wires previously generated in phase 1 and 2. As a result, the manual signals used in the testbenches were no longer required as all control was transferred to the control unit. 

![4](https://github.com/user-attachments/assets/73207189-3d2f-4bc2-95a5-56bde1e52357)

## Additional Features

### Phase 4

The intended goal of phase 4 was to run an extended test program in simulation and on an FPGA. To achieve this, the input and output signals to the `datapath` module would need to be changed so that they could be configured to the requisite pins on the DE0-CV board. This greatly simplified the inputs to the CPU `datapath` as seen in the table below.

| Inputs                         | Outputs                                           |
|--------------------------------|--------------------------------------------------|
| `sysclock` (the 50MHz clock of the DE0-CV board) | `run` (an LED indicating whether the program is running or not) |
| `switches[7:0]` (The bottom 8 switches) | `hexDisplays[15:0]` (The lowest 2 7-segment displays) |
| `resetButton`                 |                                                  |
| `stopButton`                  |                                                  |

Additionally, to support operation at frequencies other than the clock of the DE0-CV, a frequency divider was added to the `datapath` which would convert the board’s clock to a slower frequency by using a counter to delay the cycle of the internal clock signal.

Using this configuration, the team was able to successfully simulate the phase 4 test program in **ModelSim**, however, the team was unable to run the complete program on the board. Despite this, it was clear that the design was successfully loaded on the board as the stop button, reset button, and LED run indicator were all successfully implemented on the FPGA. Images of this operation can be seen in [FPGA Pictures](#fpga-pictures).

Due to time constraints in the labs and time spent debugging issues with loaded the Mini-SRC onto the FPGA, no additional features such as a 3-bus design were implemented in this phase. 

# Evaluation Results

## Maximum Frequency of Operation
The Mini-SRC design has been proven to run with a clock frequency of 50MHz in the simulator in multiple testbenches. However, since this is only a simulator, this is not necessarily representative of true performance. 

## Simulator Frequency
Since the current design implements delays of up to 2ns in some modules, a half-period of 3ns would be required to successfully evaluate each instruction. This would result in a period of 6ns which is equal to a theoretical maximum clock frequency of frequency of 166.67 MHz. 

It is also possible that the delays in the design could be shortened so that the speed of the design would only be limited by the speed at which the ModelSim program could simulate the execution. However, due to time constraints and a focus on achieving on-board results, these modifications to the design were not made as they would be impractical to run in the real world, so the theoretical highest frequency of operation remains at 166.67 MHz for the final design. 

## On-Board Frequency
The maximum frequency for the Mini-SRC while operating on the FPGA is unknown as, since the test program was not run, it was impossible to evaluate the performance of the design. However, an estimated guess can be made using results of labs from prior years. According to the professor, running on the physical board usually requires a frequency of around 1 MHz, or about 50x slower than the default clock of the DE0-CV.  

## Average Instruction Length

Thanks to the custom SRAM implementation, there are no additional delays in accessing memory as the address can be sent in one instruction and the data captured from the registers on the next instruction.  
Average Length = 5.704

As a result, the average instruction length can be calculated by averaging the number of steps for each instruction plus the common 3 step instruction fetch for each instruction. The calculation is as follows: 

## Average Cycle Per Instruction (CPI)

To calculate the CPI of the test programs, we must divide the time the program took to execute by the period and then again by the number of instructions executed. To find the number of instructions executed, the Signal Search tool in ModelSim was used to count the number of rising edges on the IncPC signal, a signal that only occurs once per instruction. The total time was calculated by measuring the time that the run signal was high. 

**Phase 3**

- **Num instructions** = 44
- **Run signal high** = \( 5320\text{ns} - 40\text{ns} = 5280\text{ns} \)

$$
CPI = \frac{\text{Time}}{\text{period} \times \text{N instr.}} = \frac{5280ns}{20ns \times 44} = 6 \text{ cycles/instruction}
$$

**Phase 4**

It is worth noting that this calculation was performed on the adapted program for use in the simulation which has a delay of 0x2 rather than 0xFFFF between each hex display change. This will slightly affect the results as there are significantly less `subi` instructions being performed in the waiting loop, however, the results should still provide insight.

- **Num instructions** = 530  
- **Run signal high** = \( 63580\text{ns} - 40\text{ns} = 63540\text{ns} \)

$$
CPI = \frac{\text{Time}}{period \times \text{N instr.}} = \frac{63540ns}{20ns \times 530} = 5.99 \text{ cycles/instruction}
$$

The results of the phase 3 and phase 4 calculation match expectations as both values are close to the average instruction length of 5.7 as calculated above.


## Percentage of Chip Area

After decreasing the size of the RAM from 2kB to 1kB, the design was able to be successfully loaded onto the chip using 13% of overall pins and 85% of the available logic (ALMs). The majority of the ALM usage is for the custom SRAM implementation which uses registers on the chip itself rather than built in RAM on the DE0-CV board. While this tradeoff was made for faster, more consistent performance and simplicity, future implementations of the design should implement premade designs from Quartus’ IP catalog that can make use of the existing RAM on the DE0-CV board to reduce chip usage. 

## On-Board Operation

As discussed in the [Project Design and Implementation](#project-design-and-implementation), the final project implementation was unable to successfully run the test program on the FPGA board. However, it was verified that the design was loaded in some capacity on the board as the stop button, reset button, and run indicator light all proved functional. 

The team theorizes that the issues with running the test program on the board are memory-related. Our best theories are that the issue is due to improper loading of the program into board memory or due to an erroneous first memory address which means that CPU cannot find the program starting location. 

# Discussion

### Challenges Encountered

When implementing Booth’s bit-pair multiplication, the group encountered issues when dealing with large and negative numbers. The team’s initial approach wasn’t producing the intended input and subsequently switched to a different method of implementing the Booth’s bit-pair multiplication, which resolved the issue, allowing the design to handle a wide range of inputs of positive and negative numbers.

Additionally, the group faced issues creating the select and encode module. Passing values to wires was not working and to address this the team introduced additional registers for intermediate steps and allocated wire values at the end of the module to ensure proper transmission.

Within the Control Unit, a problem arose where the fetch2 state was retrieving the IR contents of the preceding instruction instead of the current one resulting in the execution of the old command with the new registers. Thus, the team added a 1ns delay in the fetch2 instruction, enabling the switch statement to capture the new IR value effectively.

Lastly, in the final lab, the team attempted to get the simulation to run on an FPGA but were unable to get the seven-segment display to increment. The group attributes this fault to an issue using custom RAM, as opposed to the Intel premade memory modules, discussed later. 

# Conclusion and Future Work

Overall, the team is proud of what was accomplished and learned a lot about Verilog and hardware design. Besides the final step of getting the code to execute on hardware, the team was able to accomplish all the phases of the Mini-SRC processor development.

In the future, the group would like to get the RISC computer executing instructions on the board, as the team fell short of this objective in the current timeframe of the course. The team wasn’t entirely able to diagnose the issues that would prevent the board and seven segment displays to update, however; it was most likely due to the current system’s RAM implementation. Since the group created its own RAM modules, since it was easier for phase 2 of testing, instead of the premade IP catalog memory, issues were discovered when moving from the simulation to hardware. If the group was able to implement Intel’s designs, perhaps it would work more seamlessly on the FPGAs and allow the group to execute instructions. Additionally, implementing premade memory would also allow for larger memory sizes and less chip utilization as mentioned in the evaluation of the [Percentage of Chip Area](#percentage-of-chip-area).

Additionally, the team would investigate optimizing some key instructions and streamline the execution of frequently used operations to improve the overall efficiency and performance of the processor. In a real-world implementation, energy efficiency and low heat dissipation are crucial in modern CPUs and working to optimize instructions would improve our system in those departments, to mimic how a real computer architecture team would look to improve their processor. Plus, as the CPU’s capabilities grow with development, the scalability will be important and optimizing basic instructions, especially those accessed by other instructions, will have a significant impact on the processor’s performance.

Credit: Mitchell Winter, Logan White, Zeph Van Iterson 

# Appendix

## Functional Simulation

### Zoomed Out Waveforms

![5](https://github.com/user-attachments/assets/870843f7-338a-478d-b42d-4bcc694af6cb)

![6](https://github.com/user-attachments/assets/9a2b1fd0-819e-4acb-a778-1743bc8520f7)

![7](https://github.com/user-attachments/assets/3a81fa75-1cb9-429c-9a97-2e9a02b91032)

### Detailed View of First Instructions

These screenshots show a more zoomed-in view of the first 6 instructions with a look at some the basic control signals. 

![8](https://github.com/user-attachments/assets/374d9ea1-fa3f-48c7-a5a6-3f89029692e2)

![9](https://github.com/user-attachments/assets/f918886f-004e-4e6a-83a6-0bc45a924824)

![10](https://github.com/user-attachments/assets/219f19c0-c714-4994-8b34-be3355c26885)

## Memory Printout

### Phase 3

#### Before

![11](https://github.com/user-attachments/assets/849ed0c7-bfb8-49fa-80fa-ecfd91698feb)

#### After

![12](https://github.com/user-attachments/assets/b538c7ca-6833-4591-8e42-25601ff48dd1)

### Phase 4

#### Before

![13](https://github.com/user-attachments/assets/0746c96a-007b-4094-b54e-9e2cea19be82)

### After

![14](https://github.com/user-attachments/assets/3a69ad45-9164-4a47-8c7e-2845581d5828)

### FPGA Pictures

#### Normal Operation

![15](https://github.com/user-attachments/assets/a216bc7b-89f1-4842-be5c-59d66731fe37)

#### With Stop Button Depressed

![16](https://github.com/user-attachments/assets/d6dd106b-8b45-4484-b8ab-fcc22a44cef1)

