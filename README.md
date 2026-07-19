# FIFO_verilog

# Asynchronous FIFO Design in Verilog

## Overview

This project implements an **Asynchronous FIFO (First-In First-Out)** using Verilog HDL. The FIFO safely transfers data between two independent clock domains by employing Gray code pointers and two-stage synchronizers to minimize metastability.

The design follows a modular architecture, where each functional block is implemented as an independent RTL module.

---

## Features

- Independent write and read clocks
- Gray code pointer generation
- Two-stage synchronizers for clock-domain crossing
- FIFO Full detection
- FIFO Empty detection
- Separate memory module
- Modular RTL design
- Behavioral simulation and waveform verification

---

## Architecture

```
                +----------------------+
                |   Write Pointer      |
                +----------+-----------+
                           |
                      Binary Pointer
                           |
                    Gray Converter
                           |
                    Synchronizer
                           |
                     Full Logic
                           |
                           |
                    FIFO Memory
                           |
                           |
                    Empty Logic
                           |
                    Synchronizer
                           |
                    Gray Converter
                           |
                +----------+-----------+
                |    Read Pointer      |
                +----------------------+
```

---

## Project Structure

```
rtl/
    async_fifo.v
    fifomem.v
    write_pointer.v
    read_pointer.v
    gray_converter.v
    sync_r2w.v
    sync_w2r.v
    empty_logic.v
    full_logic.v

TEST_BENCH/
    tb_async_fifo.v

waveform
    tb_async_fifo_behave.wcfg
```

---

## RTL Modules

| Module | Description |
|---------|-------------|
| async_fifo | Top-level structural module |
| fifomem | FIFO memory array |
| write_pointer | Binary write pointer generation |
| read_pointer | Binary read pointer generation |
| gray_converter | Binary-to-Gray code conversion |
| sync_r2w | Read pointer synchronizer |
| sync_w2r | Write pointer synchronizer |
| full_logic | FIFO full detection |
| empty_logic | FIFO empty detection |

---

## Simulation

The design was verified using a self-checking testbench in Vivado.

Simulation verifies:

- Reset operation
- Write operation
- Read operation
- FIFO Empty condition
- FIFO Full condition
- Pointer synchronization
- Gray code generation

---

## Key Concepts

- Asynchronous FIFO
- Clock Domain Crossing (CDC)
- Gray Code
- Two-Flip-Flop Synchronizer
- FIFO Full Detection
- FIFO Empty Detection
- Structural Verilog Design

---

## Tools Used

- Verilog HDL
- Xilinx Vivado Simulator



---

## Author

**T. Sathwik**

B.Tech Electronics and Communication Engineering

IIT Bhubaneswar
