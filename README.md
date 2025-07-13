/

# 🧠 Arbiter FSM in Verilog

This project implements a **priority-based arbiter** using a **Moore Finite State Machine (FSM)** in Verilog HDL.  
The arbiter manages access to a shared resource from four requesters and grants access based on a fixed priority scheme.

---

## 📁 Files Included

- `arbiter.v` – Main Verilog module implementing the FSM logic  
- `arbiter_tb.v` – Testbench for simulation with vector input  
- `test_vectors.txt` – Predefined input vectors used by the testbench    
- `state_diagram.pdf` – FSM state transition diagram (Moore model)    

---

## ⚙️ Features

- Inputs: `clk`, `reset`, `req_0` to `req_3`  
- Outputs: `gnt_0` to `gnt_3`  
- FSM Type: **Moore**  
- States: `IDLE`, `GNT0`, `GNT1`, `GNT2`, `GNT3`  
- Priority: Fixed priority from `req_0` (highest) to `req_3` (lowest)  
- Reset brings the FSM to `IDLE` state  
- Each grant remains active as long as the corresponding request is active

---

## 🧪 Simulation

Simulated using ModelSim with `test_vectors.txt`:
- Verifies correct state transitions and grant output behavior
- Demonstrates prioritization among multiple simultaneous requests

---



