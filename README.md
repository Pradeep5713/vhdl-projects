# VHDL Projects

A collection of VHDL projects demonstrating digital circuit designs including logic gates, multiplexers, and other fundamental components.

## 📋 Overview

This repository serves as a centralized location for VHDL code projects, focusing on digital design fundamentals. Each project is organized in its own folder with complete source code, testbenches, and documentation.

## 🗂️ Repository Structure

The repository is organized as follows:

```
vhdl-projects/
│
├── README.md                 # This file
├── and-gate/                 # 2-input AND gate implementation
│   ├── and_gate.vhd         # Main VHDL source code
│   ├── and_gate_tb.vhd      # Testbench
│   └── README.md            # Project-specific documentation
│
├── or-gate/                  # 2-input OR gate implementation
│   ├── or_gate.vhd
│   ├── or_gate_tb.vhd
│   └── README.md
│
├── not-gate/                 # NOT gate (inverter) implementation
│   ├── not_gate.vhd
│   ├── not_gate_tb.vhd
│   └── README.md
│
├── nand-gate/                # NAND gate implementation
│   ├── nand_gate.vhd
│   ├── nand_gate_tb.vhd
│   └── README.md
│
├── nor-gate/                 # NOR gate implementation
│   ├── nor_gate.vhd
│   ├── nor_gate_tb.vhd
│   └── README.md
│
├── xor-gate/                 # XOR gate implementation
│   ├── xor_gate.vhd
│   ├── xor_gate_tb.vhd
│   └── README.md
│
├── mux-2to1/                 # 2-to-1 Multiplexer
│   ├── mux_2to1.vhd
│   ├── mux_2to1_tb.vhd
│   └── README.md
│
├── mux-4to1/                 # 4-to-1 Multiplexer
│   ├── mux_4to1.vhd
│   ├── mux_4to1_tb.vhd
│   └── README.md
│
├── demux-1to2/               # 1-to-2 Demultiplexer
│   ├── demux_1to2.vhd
│   ├── demux_1to2_tb.vhd
│   └── README.md
│
└── half-adder/               # Half Adder circuit
    ├── half_adder.vhd
    ├── half_adder_tb.vhd
    └── README.md
```

## 🚀 Getting Started

### Prerequisites

To work with these VHDL projects, you'll need:

- **VHDL Simulator**: GHDL, ModelSim, or Vivado Simulator
- **Waveform Viewer**: GTKWave (for GHDL) or built-in viewers
- **Text Editor/IDE**: VS Code with VHDL extensions, or dedicated VHDL IDE

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Pradeep5713/vhdl-projects.git
   cd vhdl-projects
   ```

2. Navigate to any project folder:
   ```bash
   cd and-gate
   ```

3. Follow the project-specific README for compilation and simulation instructions.

## 📚 Project Guidelines

Each project folder should contain:

1. **Source Code** (`<project_name>.vhd`)
   - Well-commented VHDL code
   - Entity and architecture definitions
   - Clean, readable code style

2. **Testbench** (`<project_name>_tb.vhd`)
   - Comprehensive test cases
   - Stimulus generation
   - Expected vs. actual result verification

3. **README.md**
   - Project description
   - Truth table (for logic gates)
   - Block diagram or schematic (if applicable)
   - Compilation and simulation instructions
   - Expected results

## 🔧 Usage Example

Here's a typical workflow using GHDL:

```bash
# Navigate to project folder
cd and-gate

# Analyze the source code
ghdl -a and_gate.vhd

# Analyze the testbench
ghdl -a and_gate_tb.vhd

# Elaborate the testbench
ghdl -e and_gate_tb

# Run simulation and generate waveform
ghdl -r and_gate_tb --vcd=and_gate.vcd

# View waveform
gtkwave and_gate.vcd
```

## 📖 Learning Path

Recommended order for beginners:

1. **Basic Logic Gates**: Start with AND, OR, NOT gates
2. **Compound Gates**: Move to NAND, NOR, XOR gates
3. **Combinational Circuits**: Multiplexers and Demultiplexers
4. **Arithmetic Circuits**: Half Adder, Full Adder
5. **Advanced Projects**: Counters, Flip-flops, Registers

## 🤝 Contributing

Contributions are welcome! To add a new project:

1. Create a new folder with a descriptive name
2. Include source code, testbench, and README
3. Follow the established structure and naming conventions
4. Ensure code is properly commented and tested
5. Submit a pull request with a clear description

## 📝 Coding Standards

- Use consistent indentation (2 or 4 spaces)
- Add comments explaining complex logic
- Use meaningful signal and variable names
- Follow entity naming: `<component>_<variant>`
- Include headers with author, date, and description

## 🔗 Resources

- [VHDL Tutorial](https://www.nandland.com/vhdl/tutorials/)
- [GHDL Documentation](https://ghdl.github.io/ghdl/)
- [IEEE VHDL Standards](https://standards.ieee.org/)
- [Digital Design Fundamentals](https://www.allaboutcircuits.com/textbook/digital/)

## 📄 License

This project is open source and available for educational purposes.

## ✉️ Contact

For questions or suggestions, please open an issue in this repository.

---

**Happy Coding! 🎉**
