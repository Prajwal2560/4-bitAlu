# 4-bit ALU FPGA Implementation Tutorial

## Step 1: Launch Vivado

1. Click **Start** → Search **Vivado** → Click **Vivado Design Suite**
2. Wait for the welcome window to appear

---

## Step 2: Create New Project

1. In the welcome window, click **Create Project**
2. **Project name**: `alu_project`
3. **Project location**: Browse to `C:\Users\User\Documents\4bitalu`
4. Click **Next**
5. Select **RTL Project**
6. Check **"Now add design sources"** checkbox is **unchecked**
7. Click **Next** twice
8. **Default Part**: 
   - Click **Boards** tab → Search: `Basys3`
   - Select: `Basys3`
   - Click **Next** → **Finish**

---

## Step 3: Add Design Source

1. In the **Sources** window (left panel), right-click → **Add Sources**
2. Select **Add or Create Design Sources**
3. Click **Add Files**
4. Browse to `C:\Users\User\Documents\4bitalu` → Select `alu.v` → Click **OK**
5. Click **Next** → **Finish**

---

## Step 4: Add Constraint File (SP701)

**Option A (Recommended)**: Skip this step - SP701 board is selected so Vivado auto-assigns pins.

**Option B**: Use the provided constraint file:
1. Right-click in **Sources** pane → **Add Sources**
2. Select **Add or Create Constraints**
3. Click **Add Files**
4. Browse to `C:\Users\User\Documents\4bitalu` → Select `alu_constraints.xdc` → **OK**
5. Click **Next** → **Finish**

---

## Step 5: Add Simulation Source

1. Right-click in **Sources** pane → **Add Sources**
2. Select **Add or Create Simulation Sources**
3. Click **Add Files**
4. Select `alu_tb.v` → **OK**
5. Click **Next** → **Finish**

---

## Step 6: Run Behavioral Simulation

1. In the **Flow Navigator** (left panel), click **Run Simulation** → **Run Behavioral Simulation**
2. Wait for simulation to compile (~10-20 seconds)
3. The **Log window** at bottom shows test results
4. Click **Zoom Fit** in the waveform window to see all signals

---

## Step 7: Run Synthesis

1. In **Flow Navigator**, click **Run Synthesis**
2. If prompted, click **OK** to save
3. Wait for synthesis to complete (~1-2 minutes)
4. Click **OK** when "Synthesis Complete" dialog appears

---

## Step 8: Open Synthesized Design

1. Click **Open Synthesized Design** in the dialog
2. Wait for design to load
3. View the schematic in the main window

---

## Step 9: Run Implementation

1. In **Flow Navigator**, click **Run Implementation**
2. Wait for place-and-route (~1-2 minutes)
3. Click **OK** when complete

---

## Step 10: Generate Bitstream

1. In **Flow Navigator**, click **Generate Bitstream**
2. Click **OK** if prompted
3. Wait for bitstream generation (~30 seconds)
4. Click **OK** when complete

---

## Step 11: Program FPGA

1. Connect your FPGA board to PC via USB cable
2. In **Flow Navigator**, click **Open Hardware Manager**
3. Click **Open Target** → **Auto Connect**
4. Wait for Vivado to detect the device
5. Click **Program Device** → **Program**
6. Done LED should light up

---

## Step 12: Test on Hardware (Basys3)

Basys3 has:
- **16 switches**: SW0-SW15
- **16 LEDs**: LD0-LD15

| Switch | Function |
|--------|----------|
| SW0-SW3 | A[3:0] |
| SW4-SW7 | B[3:0] |
| SW8-SW10 | S[2:0] |

| LED | Function |
|-----|----------|
| LD0-LD3 | Y[3:0] |
| LD4 | N |
| LD5 | Z |
| LD6 | V |

### Test Values:

| Switches | Binary | Decimal | Expected |
|----------|--------|---------|----------|
| 5 + 3 | 0101 + 0011 | 5 + 3 | 8 (LD0-3: 1000) |
| 8 - 2 | 1000 - 0010 | 8 - 2 | 6 (LD0-3: 0110) |
| 12 AND 10 | 1100 & 1010 | 12 & 10 | 8 (1000) |
| 12 OR 10 | 1100 \| 1010 | 12 \| 10 | 14 (1110) |