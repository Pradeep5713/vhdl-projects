# Chapter 3: Data Types and Objects

## 📝 Overview

VHDL is a **strongly typed** language, meaning every object must have a defined type, and type checking is strict.

## 🎯 Object Classes

VHDL has four main object classes:

| Object | Scope | Assignment | Usage |
|--------|-------|------------|-------|
| **SIGNAL** | Global (architecture) | `<=` | Wires, registers |
| **VARIABLE** | Local (process) | `:=` | Temporary storage |
| **CONSTANT** | Global/Local | N/A | Fixed values |
| **FILE** | Global | N/A | File I/O |

## 1️⃣ SIGNALS

### 📝 What are Signals?

- Represent **wires** or **connections** in hardware
- Have **history** (remember previous values)
- Updates are **scheduled** (not immediate)
- Used for **communication between processes**

### Syntax:
```vhdl
signal signal_name : type := initial_value;
```

### Example:
```vhdl
architecture Behavioral of example is
    signal count : integer := 0;           -- Integer signal
    signal enable : std_logic := '0';      -- Single bit
    signal data_bus : std_logic_vector(7 downto 0);  -- 8-bit bus
begin
    -- Signals used here
end Behavioral;
```

### 💻 Complete Example: Signal Usage

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signal_example is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end signal_example;

architecture Behavioral of signal_example is
    -- Internal signal declaration
    signal temp : STD_LOGIC;  -- Intermediate wire
begin
    -- First concurrent statement
    temp <= a and b;          -- temp gets a AND b
    
    -- Second concurrent statement  
    y <= not temp;            -- y gets NOT temp
    
    -- Result: y = NOT(a AND b) = NAND gate
end Behavioral;
```

**Line-by-line explanation:**
- `signal temp : STD_LOGIC;` - Declares internal wire
- `temp <= a and b;` - Connects AND gate output to temp
- `y <= not temp;` - Connects NOT gate (inverter) to output
- Both statements execute **concurrently** (in parallel)

## 2️⃣ VARIABLES

### 📝 What are Variables?

- Used **only inside processes**
- Updates are **immediate** (no delay)
- No **hardware** directly created
- Used for **temporary calculations**

### Syntax:
```vhdl
variable variable_name : type := initial_value;
```

### 💻 Complete Example: Variable Usage

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity variable_example is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end variable_example;

architecture Behavioral of variable_example is
begin
    process(a, b, c)  -- Sensitivity list
        variable temp : STD_LOGIC;  -- Variable declaration
    begin
        temp := a and b;     -- Immediate assignment
        temp := temp or c;   -- Uses updated value immediately
        y <= temp;           -- Signal assignment
    end process;
end Behavioral;
```

**Line-by-line explanation:**
- `variable temp : STD_LOGIC;` - Declares temporary variable
- `temp := a and b;` - Immediate assignment (uses `:=`)
- `temp := temp or c;` - Uses the updated temp value
- `y <= temp;` - Assigns final result to output signal

### ⚠️ Signal vs Variable: Critical Difference

```vhdl
-- USING SIGNALS (Scheduled updates)
process(clk)
    signal temp : std_logic;
begin
    temp <= a and b;      -- Scheduled for later
    y <= temp or c;       -- Uses OLD value of temp!
end process;

-- USING VARIABLES (Immediate updates)
process(clk)
    variable temp : std_logic;
begin
    temp := a and b;      -- Updates immediately
    y <= temp or c;       -- Uses NEW value of temp!
end process;
```

## 3️⃣ CONSTANTS

### 📝 What are Constants?

- Values that **never change**
- Improve code **readability**
- Easy to **maintain** (change in one place)

### Syntax:
```vhdl
constant constant_name : type := value;
```

### 💻 Complete Example: Constants

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity constant_example is
    Port ( 
        data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end constant_example;

architecture Behavioral of constant_example is
    -- Constant declarations
    constant BUS_WIDTH : integer := 8;
    constant RESET_VALUE : std_logic_vector(7 downto 0) := "00000000";
    constant MAX_COUNT : integer := 255;
begin
    process
    begin
        if data_in = RESET_VALUE then
            data_out <= (others => '0');
        else
            data_out <= data_in;
        end if;
        wait;
    end process;
end Behavioral;
```

## 📊 Data Types in VHDL

### **Scalar Types** (Single Values)

#### 1. **STD_LOGIC** (Most Common)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

signal my_bit : STD_LOGIC;
```

**STD_LOGIC Values:**
| Value | Meaning | Usage |
|-------|---------|-------|
| `'0'` | Logic 0 | Low/False |
| `'1'` | Logic 1 | High/True |
| `'Z'` | High Impedance | Tristate |
| `'X'` | Unknown | Uninitialized |
| `'U'` | Uninitialized | Default |
| `'W'` | Weak Unknown | Weak drive |
| `'L'` | Weak 0 | Weak low |
| `'H'` | Weak 1 | Weak high |
| `'-'` | Don't Care | Synthesis |

**Example:**
```vhdl
signal enable : STD_LOGIC := '0';     -- Initialize to 0
signal data : STD_LOGIC := 'Z';       -- Tristate
signal unknown : STD_LOGIC := 'X';    -- Unknown state
```

#### 2. **BIT** (Simple Binary)

```vhdl
signal simple_bit : BIT := '0';  -- Only '0' or '1'
```

**Difference from STD_LOGIC:**
- BIT: Only `'0'` and `'1'`
- STD_LOGIC: Nine possible values (better for simulation)

#### 3. **BOOLEAN**

```vhdl
signal flag : BOOLEAN := FALSE;  -- TRUE or FALSE
```

**Example:**
```vhdl
signal is_ready : BOOLEAN;
signal is_done : BOOLEAN := TRUE;

-- Usage
if is_ready then
    -- do something
end if;
```

#### 4. **INTEGER**

```vhdl
signal count : INTEGER := 0;
signal value : INTEGER range 0 to 255;  -- Constrained range
```

**Important Notes:**
- Default range: -2,147,483,648 to 2,147,483,647 (32-bit)
- **Always specify range** for synthesis!
- Uses more resources than std_logic_vector

**Example:**
```vhdl
signal counter : INTEGER range 0 to 15 := 0;  -- 4-bit counter
signal temperature : INTEGER range -40 to 125;  -- Signed value
```

#### 5. **REAL** (Floating Point)

```vhdl
signal voltage : REAL := 3.3;
constant PI : REAL := 3.14159;
```

**⚠️ Warning:** REAL types are **NOT synthesizable**! Use only for simulation.

### **Composite Types** (Multiple Values)

#### 1. **STD_LOGIC_VECTOR** (Most Important!)

```vhdl
signal data_bus : STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit bus
signal address : STD_LOGIC_VECTOR(0 to 15);      -- 16-bit bus
```

**Indexing Styles:**
```vhdl
-- DOWNTO (Most Common)
signal bus1 : STD_LOGIC_VECTOR(7 downto 0);
-- bus1(7) is MSB (Most Significant Bit)
-- bus1(0) is LSB (Least Significant Bit)

-- TO (Less Common)
signal bus2 : STD_LOGIC_VECTOR(0 to 7);
-- bus2(0) is MSB
-- bus2(7) is LSB
```

**💻 Complete Example:**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vector_example is
    Port ( 
        data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end vector_example;

architecture Behavioral of vector_example is
    signal temp : STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Bit-wise operations
    temp(7) <= data_in(0);  -- Individual bit access
    temp(6) <= data_in(1);
    temp(5) <= data_in(2);
    temp(4) <= data_in(3);
    temp(3) <= data_in(4);
    temp(2) <= data_in(5);
    temp(1) <= data_in(6);
    temp(0) <= data_in(7);
    
    data_out <= temp;  -- Bit reversal
end Behavioral;
```

#### 2. **ARRAY**

```vhdl
-- Array type declaration
type memory_array is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);

-- Array signal
signal memory : memory_array;
```

**💻 Complete Example: Memory Array**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_example is
    Port ( 
        address : in  INTEGER range 0 to 15;
        data_in : in  STD_LOGIC_VECTOR(7 downto 0);
        write_en : in  STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end array_example;

architecture Behavioral of array_example is
    -- Define array type
    type memory_type is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    
    -- Declare memory signal
    signal memory : memory_type := (others => "00000000");
begin
    process(write_en, address, data_in)
    begin
        if write_en = '1' then
            memory(address) <= data_in;  -- Write to memory
        end if;
        
        data_out <= memory(address);  -- Read from memory
    end process;
end Behavioral;
```

#### 3. **RECORD**

```vhdl
-- Record type declaration
type instruction_type is record
    opcode : STD_LOGIC_VECTOR(3 downto 0);
    operand1 : STD_LOGIC_VECTOR(7 downto 0);
    operand2 : STD_LOGIC_VECTOR(7 downto 0);
end record;

-- Record signal
signal instruction : instruction_type;
```

**💻 Complete Example:**
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity record_example is
    Port ( 
        opcode_in : in  STD_LOGIC_VECTOR(3 downto 0);
        op1_in : in  STD_LOGIC_VECTOR(7 downto 0);
        op2_in : in  STD_LOGIC_VECTOR(7 downto 0);
        result : out STD_LOGIC_VECTOR(7 downto 0)
    );
end record_example;

architecture Behavioral of record_example is
    -- Define record type
    type instruction_type is record
        opcode : STD_LOGIC_VECTOR(3 downto 0);
        operand1 : STD_LOGIC_VECTOR(7 downto 0);
        operand2 : STD_LOGIC_VECTOR(7 downto 0);
    end record;
    
    signal instr : instruction_type;
begin
    -- Access record fields
    instr.opcode <= opcode_in;
    instr.operand1 <= op1_in;
    instr.operand2 <= op2_in;
    
    -- Use record fields
    result <= instr.operand1 when instr.opcode = "0001" else
              instr.operand2;
end Behavioral;
```

## 🔄 Type Conversions

### Common Conversions:

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- For conversions

-- INTEGER to STD_LOGIC_VECTOR
signal int_val : INTEGER := 42;
signal slv_val : STD_LOGIC_VECTOR(7 downto 0);
slv_val <= STD_LOGIC_VECTOR(TO_UNSIGNED(int_val, 8));

-- STD_LOGIC_VECTOR to INTEGER
signal slv : STD_LOGIC_VECTOR(7 downto 0) := "00101010";
signal int : INTEGER;
int <= TO_INTEGER(UNSIGNED(slv));

-- SIGNED conversions
signal signed_val : SIGNED(7 downto 0);
signed_val <= SIGNED(slv);
int <= TO_INTEGER(signed_val);
```

## 💡 Best Practices

1. **Use STD_LOGIC** instead of BIT (better simulation)
2. **Always specify INTEGER ranges** for synthesis
3. **Use UNSIGNED/SIGNED** from NUMERIC_STD for arithmetic
4. **Signals for hardware**, Variables for algorithms
5. **Constants for magic numbers**

## 📚 Summary Table

| Type | Example | Synthesizable | Usage |
|------|---------|---------------|-------|
| STD_LOGIC | `'0'`, `'1'`, `'Z'` | ✅ Yes | Single bit |
| STD_LOGIC_VECTOR | `"10101010"` | ✅ Yes | Multi-bit bus |
| INTEGER | `42` | ✅ Yes (with range) | Counters |
| BOOLEAN | `TRUE`, `FALSE` | ✅ Yes | Flags |
| REAL | `3.14` | ❌ No | Simulation only |

## 🎯 Next Chapter

In Chapter 4, we'll explore:
- Logical operators (AND, OR, NOT, etc.)
- Relational operators (=, /=, <, >, etc.)
- Arithmetic operators (+, -, *, /)
- Shift and rotate operators

---

**Practice Exercise**: Create a design with signals, variables, and constants!
