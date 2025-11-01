# Chapter 2: Basic Syntax and Structure

## 📝 VHDL Program Structure

Every VHDL design consists of three main parts:

```
┌──────────────────────┐
│  1. Library Clause   │  ← Import libraries
├──────────────────────┤
│  2. Entity           │  ← Define interface (I/O)
├──────────────────────┤
│  3. Architecture     │  ← Define behavior/structure
└──────────────────────┘
```

## 💻 Complete Example: AND Gate

Let's analyze a complete VHDL program line by line:

```vhdl
-- ============================================================================
-- File: and_gate.vhd
-- Description: 2-input AND gate
-- ============================================================================

-- PART 1: LIBRARY DECLARATIONS
library IEEE;                    -- Import IEEE library
use IEEE.STD_LOGIC_1164.ALL;    -- Use standard logic package

-- PART 2: ENTITY DECLARATION
entity and_gate is
    Port ( 
        a : in  STD_LOGIC;      -- Input port 'a'
        b : in  STD_LOGIC;      -- Input port 'b'
        y : out STD_LOGIC       -- Output port 'y'
    );
end and_gate;

-- PART 3: ARCHITECTURE DEFINITION
architecture Behavioral of and_gate is
begin
    y <= a and b;               -- Concurrent signal assignment
end Behavioral;
```

## 🔍 Line-by-Line Explanation

### **Library Clause**

```vhdl
library IEEE;
```
- **Purpose**: Declares which library to use
- **IEEE**: Standard library containing common packages
- **Think of it as**: `#include` in C or `import` in Python

```vhdl
use IEEE.STD_LOGIC_1164.ALL;
```
- **Purpose**: Makes all definitions from `STD_LOGIC_1164` package available
- **STD_LOGIC_1164**: Defines multi-valued logic types (0, 1, Z, X, etc.)
- **ALL**: Import everything from the package

### **Entity Declaration**

```vhdl
entity and_gate is
```
- **entity**: Keyword to start entity declaration
- **and_gate**: Name of the entity (must be unique)
- **is**: Keyword indicating start of entity body

```vhdl
    Port ( 
```
- **Port**: Keyword for defining input/output ports
- **Parentheses**: Enclose all port declarations

```vhdl
        a : in  STD_LOGIC;
```
- **a**: Port name (identifier)
- **in**: Direction (input to the entity)
- **STD_LOGIC**: Data type (single bit with multiple states)
- **Semicolon**: Separates port declarations

```vhdl
        b : in  STD_LOGIC;
        y : out STD_LOGIC
```
- **b**: Second input port
- **y**: Output port
- **out**: Direction (output from the entity)
- **Note**: Last port has NO semicolon before closing parenthesis

```vhdl
    );
end and_gate;
```
- **);**: Closes port list
- **end**: Ends entity declaration
- **and_gate**: Must match entity name
- **Semicolon**: Ends the entity statement

### **Architecture Definition**

```vhdl
architecture Behavioral of and_gate is
```
- **architecture**: Keyword to start architecture
- **Behavioral**: Architecture name (you choose this)
- **of**: Keyword linking architecture to entity
- **and_gate**: Must match entity name
- **is**: Starts architecture body

```vhdl
begin
```
- **begin**: Marks start of concurrent statements
- Everything after `begin` executes in parallel

```vhdl
    y <= a and b;
```
- **y**: Target signal (left side)
- **<=**: Signal assignment operator
- **a and b**: Boolean AND operation
- **Semicolon**: Ends the statement
- **This creates**: Physical AND gate in hardware

```vhdl
end Behavioral;
```
- **end**: Ends architecture
- **Behavioral**: Must match architecture name
- **Semicolon**: Ends the architecture statement

## 📊 Port Directions

| Direction | Keyword | Description | Usage |
|-----------|---------|-------------|-------|
| Input | `in` | Data flows INTO entity | Read only inside entity |
| Output | `out` | Data flows OUT of entity | Write only (can't read back) |
| Bidirectional | `inout` | Data flows BOTH ways | Tristate buses |
| Buffer | `buffer` | Output that can be read | Feedback loops |

## 💡 Naming Conventions

### Valid Identifiers:
```vhdl
signal_name       -- Good: lowercase with underscore
SignalName        -- Good: CamelCase
signal1           -- Good: ends with number
my_signal_123     -- Good: mixed
```

### Invalid Identifiers:
```vhdl
1signal           -- Bad: starts with number
signal-name       -- Bad: hyphen not allowed
signal name       -- Bad: space not allowed
and               -- Bad: reserved keyword
```

### Reserved Keywords (Cannot use as identifiers):
```
entity, architecture, signal, port, in, out, begin, end,
process, if, then, else, case, when, loop, for, while,
and, or, not, xor, nand, nor, xnor, etc.
```

## 🎨 Multiple Architecture Styles

You can have multiple architectures for the same entity:

```vhdl
-- Architecture 1: Dataflow style
architecture dataflow of and_gate is
begin
    y <= a and b;
end dataflow;

-- Architecture 2: Behavioral style
architecture behavioral of and_gate is
begin
    process(a, b)
    begin
        if (a = '1' and b = '1') then
            y <= '1';
        else
            y <= '0';
        end if;
    end process;
end behavioral;

-- Architecture 3: Structural style
architecture structural of and_gate is
    component nand_gate
        port(a, b : in std_logic; y : out std_logic);
    end component;
    signal temp : std_logic;
begin
    U1: nand_gate port map(a, b, temp);
    U2: nand_gate port map(temp, temp, y);
end structural;
```

## 📐 Code Layout Best Practices

```vhdl
-- 1. File header with documentation
-- 2. Library declarations
-- 3. Entity declaration
--    - Align port names
--    - Group related ports
--    - Add comments for complex ports
-- 4. Architecture declaration
--    - Declare internal signals
--    - Organize concurrent statements
--    - Use meaningful names
-- 5. End with blank line
```

## ⚠️ Common Syntax Errors

### 1. Missing Semicolon
```vhdl
-- WRONG:
y <= a and b

-- CORRECT:
y <= a and b;
```

### 2. Wrong Assignment Operator
```vhdl
-- WRONG (this is equality comparison):
y = a and b;

-- CORRECT (signal assignment):
y <= a and b;
```

### 3. Entity/Architecture Name Mismatch
```vhdl
-- WRONG:
entity and_gate is
...
end or_gate;  -- Different name!

-- CORRECT:
entity and_gate is
...
end and_gate;
```

### 4. Missing Library
```vhdl
-- WRONG (no library):
entity my_design is
    port(a : in STD_LOGIC);  -- STD_LOGIC undefined!
end my_design;

-- CORRECT:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity my_design is
    port(a : in STD_LOGIC);
end my_design;
```

## 💻 Complete Examples

### Example 1: OR Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end or_gate;

architecture Behavioral of or_gate is
begin
    y <= a or b;
end Behavioral;
```

### Example 2: NOT Gate (Inverter)
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port ( 
        a : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end not_gate;

architecture Behavioral of not_gate is
begin
    y <= not a;
end Behavioral;
```

### Example 3: 3-Input AND Gate
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3_gate is
    Port ( 
        a : in  STD_LOGIC;
        b : in  STD_LOGIC;
        c : in  STD_LOGIC;
        y : out STD_LOGIC
    );
end and3_gate;

architecture Behavioral of and3_gate is
begin
    y <= a and b and c;
end Behavioral;
```

## 🎯 Key Takeaways

1. **Three Parts**: Library, Entity, Architecture
2. **Entity**: Defines interface (what)
3. **Architecture**: Defines implementation (how)
4. **Concurrent**: Statements after `begin` execute in parallel
5. **Signal Assignment**: Use `<=` operator
6. **Case Insensitive**: But be consistent
7. **Semicolons**: End every statement

## 📚 Next Chapter

In Chapter 3, we'll explore:
- Data types in detail (STD_LOGIC, INTEGER, etc.)
- Signals vs Variables
- Arrays and vectors
- Type conversions

---

**Practice Exercise**: Create a 4-input NAND gate using the structure learned!
