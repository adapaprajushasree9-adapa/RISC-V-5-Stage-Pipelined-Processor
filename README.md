# RISC-V 5-Stage Pipelined Processor on Basys 3 FPGA

## Overview

This project presents the design and implementation of a **32-bit 5-Stage Pipelined RISC-V** Processor using **Verilog HDL.** The processor supports the core RV32I instruction set and incorporates pipelining techniques to improve instruction throughput and overall processor performance.

The design implements the classical five-stage RISC-V pipeline consisting of **Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB) stages**. Pipeline registers are inserted between stages to enable concurrent execution of multiple instructions.

To ensure correct execution in a pipelined environment, the processor includes hazard management mechanisms such as data forwarding, load-use hazard detection, pipeline stalling, and pipeline flushing for control hazards.

The complete processor was verified through simulation and successfully deployed on the **Basys 3 FPGA** board. End-to-end functionality was demonstrated by **executing a Fibonacci Series** program and displaying the generated sequence on the onboard seven-segment display.

---

## Features

* 32-bit RISC-V 5-Stage Pipelined Architecture
* Verilog HDL implementation
* Support for arithmetic, logical, immediate, branch, jump, load, and store instructions
* Pipeline registers between all stages
* Data forwarding unit for **Read and Write (RAW)** hazard resolution
* Hazard detection unit for load-use hazards
* Pipeline stalling and flushing mechanisms
* FPGA implementation on Basys 3 Development Board
* Module-level and processor-level verification
* Real-time Fibonacci Series display on seven-segment display

---

## Pipeline Stages

### Instruction Fetch (IF)

The Program Counter (PC) generates the address of the current instruction. The instruction memory is accessed using the PC value and the fetched instruction is stored in the IF/ID pipeline register.

### Instruction Decode (ID)

The instruction is decoded and control signals are generated. Source operands are read from the register file and immediate values are generated using the immediate extension unit.

### Execute (EX)

Arithmetic, logical, comparison, branch evaluation, and address calculation operations are performed by the ALU. Branch target addresses are also generated in this stage.

### Memory Access (MEM)

Load and store instructions access the data memory using addresses computed during the execute stage.

### Write Back (WB)

Results from the ALU, memory, or PC+4 are written back into the register file.

---

## Supported Instructions

### R-Type Instructions

* ADD
* SUB
* SLL
* SLT
* SLTU
* XOR
* SRL
* SRA
* OR
* AND

### I-Type Instructions

* ADDI
* SLTI
* SLTIU
* XORI
* ORI
* ANDI
* SLLI
* SRLI
* SRAI
* LW

### S-Type Instructions

* SW

### B-Type Instructions

* BEQ
* BNE
* BLT
* BGE
* BLTU
* BGEU

### U-Type Instructions

* LUI
* AUIPC

### J-Type Instructions

* JAL
* JALR

---

## Pipeline Registers

### IF/ID Register

Stores fetched instruction and PC-related information between the fetch and decode stages.

### ID/EX Register

Stores decoded operands, control signals, immediate values, and register addresses for execution.

### EX/MEM Register

Stores ALU results, write data, destination register information, and memory control signals.

### MEM/WB Register

Stores memory data, ALU results, and write-back control signals for the final stage.

---

## Hazard Management

### Data Forwarding Unit

Implements operand forwarding from later pipeline stages to the execute stage, eliminating unnecessary stalls caused by read-after-write (RAW) dependencies.

### Hazard Detection Unit

Detects load-use hazards that cannot be resolved through forwarding and inserts pipeline stalls when required.

### Control Hazard Handling

Implements pipeline flushing whenever branches or jumps alter the normal program flow, ensuring correct instruction execution.

---

## Design Modules

### Fetch Stage Modules

* pc.v
* pcmux.v
* pcplus4F.v
* instrmem.v

### Decode Stage Modules

* instruction_decoder.v
* registerfile.v
* immediate_extender.v
* controlunit.v
* maindecoder.v
* alu_decoder.v
* regIF_ID.v

### Execute Stage Modules

* srcae_mux.v
* srcBE_mux.v
* writedataE.v
* alu.v
* pctargetE.v
* regID_E.v

### Memory Stage Modules

* datamem.v
* regE_M.v

### Write Back Stage Modules

* resultW_mux.v
* regM_W.v

### Hazard Handling Modules

* hazardunit.v

### FPGA Interface Modules

* clk_divider.v
* binary_to_bcd.v
* seven_segment.v

### Top-Level Integration

* topmodule.v
* final.v

---

## Verification and Testing

### Module-Level Verification

All major modules were individually verified through simulation, including:

* Program Counter
* Instruction Memory
* Register File
* Immediate Extender
* ALU
* Control Unit
* Pipeline Registers
* Data Memory
* Hazard Detection Unit
* Forwarding Logic
* Seven-Segment Display Controller

Simulation waveforms were analyzed to verify correct functionality under various test scenarios.

### Processor-Level Verification

The complete pipelined processor was tested using assembly programs covering:

* Arithmetic operations
* Logical operations
* Immediate instructions
* Branch instructions
* Jump instructions
* Memory operations
* Pipeline forwarding scenarios
* Load-use hazard scenarios
* Control hazard scenarios

Successful execution verified the correctness of datapath, control path, and hazard handling mechanisms.

---

## FPGA Demonstration

The processor was synthesized, implemented, and deployed on the Basys 3 FPGA Development Board using **Xilinx Vivado**.

### Fibonacci Series Implementation

To validate complete processor functionality, a Fibonacci Series program was executed on the pipelined RISC-V processor.

The demonstration verified:

* Correct pipeline operation
* Simultaneous instruction execution across multiple stages
* Data forwarding functionality
* Hazard detection and stall generation
* Branch and jump execution
* Memory access operations
* Successful hardware deployment

The generated Fibonacci sequence was displayed on the onboard seven-segment display, confirming correct operation of the processor on FPGA hardware.

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Icarus Verilog (iverilog)
* GTKWave
* Basys 3 FPGA Board

---

## Results

* Successfully designed and implemented a 32-bit 5-Stage Pipelined RISC-V Processor.
* Implemented forwarding and hazard detection mechanisms for correct pipeline execution.
* Verified all major modules through simulation and functional testing.
* Successfully deployed the processor on the Basys 3 FPGA board.
* Demonstrated complete processor functionality by executing a Fibonacci Series application and displaying the output on the onboard seven-segment display.
* Achieved improved instruction throughput compared to a traditional single-cycle processor.

---

## Author

Adapa Prajusha Sree

B.Tech, Electronics and Communication Engineering

Indian Institute of Technology , Bhubaneswar
