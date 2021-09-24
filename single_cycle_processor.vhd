library IEEE; use IEEE.STD_LOGIC_1164.a11;
entity arm is
--single cycle processor
  port(clk, reset:    in STD_LOGIC:
    PC:               out STD LOGIC_VECTOR(31 downto 0);
    Instr:            in STD_LOGIC_VECTOR(31 downto 0);
    MemWrite:         out STD_LOGIC;
    ALUResult, WriteData: out STO LOGIC_VECTOR(31 downto 0);
    ReadData:         in STD LOGIC VECTOR(31 downto 0));
end;

architecture struct of arm is
  component controller
  port(clk, reset:     in STD_LOGIC;
        Instr:         in STD_LOGIC_VECTOR(31 downto 12);
        ALUFTags:      in STD_LOGIC_VECTOR(3 downto 0);
        RegSrc:        in STD_LOGIC_VECTOR(1 downto 0);
        RegWrite:      out STD_LOGIC;
        ImmSrc:        out STD_LOGIC_VECTOR(1 downto 0);
        ALUSTC:        out STD_LOGIC;
        ALUControl:    out STD_LOGIC_VECTOR(1 downto 0);
        MemWrite:      out STD_LOGIC;
        MemtoReg:      out STD_LOGIC;
        PCSrc:         out STD_LOGIC);
      end component:
      component datapath
      port(clk, reset: in           STD_LOGIC;
        RegSrc:        in           STD_LOGIC_VECTOR(1 downto 0);
        RegWrite:      in           STD_LOGIC;
        ImmSrc:        in           STD_LOGIC_VECTOR(1 downto 0);
        ALUSrc:        in           STD_LOGIC;
        ALUControl:    in           STD_LOGIC_VECTOR(1 downto 0);
        MemtoReg:      in           STD_LOGIC;
        PCSrc:         in           STD_LOGIC;
        ALUFlags:      out          STD_LOGIC_VECTOR(3 downto 0);
        PC:            buffer       STD_LOGIC_VECTOR(31 downto 0);
        Instr:         in           STD_LOGIC_VECTOR(31 downto 0);
        ALUResult, WriteData:buffer STD_LOGIC_VECTOR(31 downto 0);
        ReadData:      in           STD LOGIC VECTOR(31 downto 0));
      end component;
      signal RegWrite. ALUSrc, MemtoReg. PCSrc: STD_LOGIC:
      signal RegSrc, ImmSrc, ALUControl: STD_LOGIC_VECTOR
                                    (1 downto 0);
      signal ALUFTags: STD_LOGIC_VECTOR(3 downto 0):
    begin
      cont: controller port map(clk, reset, Instr(31 downto 12),
                                ALUFlags, RegSrc, RegWrite,
                                ImmSrc, ALUSrc, ALUControl,
                                MemWrite, MemtoReg, PCSrc):
      dp: datapath port map(clk, reset, RegSrc, RegWrite, ImmSrc,
                            ALUSrc, ALUControl, MemtoReg. PCSrc,
                            ALUFTags, PC, Instr, ALUResult,
                            WriteData, ReadData);
      end:
