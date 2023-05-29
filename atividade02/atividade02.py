# Autor: Gabriel Gomes - RA: 248287

functions = {
    "addi": { "opcode": "0010011", "f3": "000"},
    "slli": { "opcode": "0010011", "f3": "001", "f7": "0000000" },
    "xor": { "opcode": "0110011", "f3": "100", "f7": "0000000" },
    "mul": { "opcode": "0110011", "f3": "000", "f7": "0000001" },
    "lw": { "opcode": "0000011", "f3": "010" },
    "sw": { "opcode": "0100011", "f3": "010" },
    "beq": { "opcode": "1100011", "f3": "000" },
    "ret": { "opcode": "1100111", "f3": "000" },
    "jalr": { "opcode": "1100111", "f3": "000" },
    "lui": { "opcode": "0110111", "f3": "000" },
    "li": { "opcode": "0110111", "f3": "001" },
    "auipc": { "opcode": "0010111" },
    "call": { "opcode": "1100111", "f3": "001" }
}

regs = {
    "zero": "00000",
    "ra": "00001",
    "sp": "00010",
    "gp": "00011",
    "tp": "00100",
    "t0": "00101",
    "t1": "00110",
    "t2": "00111",
    "fp": "01000",
    "s0": "01000",
    "s1": "01001",
    "a0": "01010",
    "a1": "01011",
    "a2": "01100",
    "a3": "01101",
    "a4": "01110",
    "a5": "01111",
    "a6": "10000",
    "a7": "10001",
    "s2": "10010",
    "s3": "10011",
    "s4": "10100",
    "s5": "10101",
    "s6": "10110",
    "s7": "10111",
    "s8": "11000",
    "s9": "11001",
    "s10": "11010",
    "s11": "11011",
    "t3": "11100",
    "t4": "11101",
    "t5": "11110",
    "t6": "11111"
}

hex = {
    "0000": "0",
    "0001": "1",
    "0010": "2",
    "0011": "3",
    "0100": "4",
    "0101": "5",
    "0110": "6",
    "0111": "7",
    "1000": "8",
    "1001": "9",
    "1010": "A",
    "1011": "B",
    "1100": "C",
    "1101": "D",
    "1110": "E",
    "1111": "F"
}

def getFunction(instruction):
    return functions[instruction]

def getRegister(reg):
    return regs[reg]

def convertBinToHex(bin):
    convertedHex = ""
    for i in range(0, len(bin), 4):
        convertedHex += hex[bin[i:i+4]]

    return "0x" + convertedHex

def convertNumToBin(num):
    bin = ""
    decimal = num
    while decimal > 0:
        bin = f"{(decimal % 2)}" + bin
        decimal = decimal // 2
    
    return bin

def convertToNegBase2(bin):
    newBin = ""

    achou = False
    for i in range(len(bin) - 1, -1, -1) :
        if achou:
            if bin[i] == "0":
                newBin = "1" + newBin
            else:
                newBin = "0" + newBin
        else:
            newBin = bin[i] + newBin

        if bin[i] == "1" and not achou:
            achou = True
    return newBin

def getFillBin(bin, maxSize):
    while len(bin) < maxSize:
        bin = "0" + bin
    return bin

def getImmToBin(num, maxbits, getOtherSide = False):
    convertNum = int(num)

    if (convertNum < 0):
        convertNum *= -1
    
    bin = convertNumToBin(convertNum)

    if len(bin) < maxbits:
        bin = getFillBin(bin, maxbits)

    if not getOtherSide:
        bin = bin[- maxbits:]
    else:
        bin = bin[:maxbits]

    if (int(num) < 0):
        bin = convertToNegBase2(bin)

    return bin

def addi(instruction, expression):
    register = expression.split(',')

    imm = getImmToBin(register[len(register) - 1].strip(), 12)

    return imm + getRegister(register[1].strip()) + instruction["f3"] + getRegister(register[0].strip()) + instruction["opcode"]

def slli(instruction, expression):
    register = expression.split(',')

    shamt = getImmToBin(register[len(register) - 1], 5)

    return instruction["f7"] + shamt + getRegister(register[1].strip()) + instruction["f3"] + getRegister(register[0].strip()) + instruction["opcode"]

def executeR(instruction, expression):
    register = expression.split(',')

    return instruction["f7"] + getRegister(register[2].strip()) + getRegister(register[1].strip()) + instruction["f3"] + getRegister(register[0].strip()) + instruction["opcode"]

def jalr(instruction, expression):
    register = expression.split(',')

    imm = getImmToBin(register[len(register) - 1].strip(), 12)

    return imm + getRegister(register[1].strip()) + instruction["f3"] + getRegister(register[0].strip()) + instruction["opcode"]

def lw(instruction, expression):
    register = expression.split(',')

    imm_rs1 = register[1].strip().split("(")

    imm = getImmToBin(imm_rs1[0].strip(), 12)

    rs1 = imm_rs1[1].split(")")[0].strip()

    return imm + getRegister(rs1) + instruction["f3"] + getRegister(register[0].strip()) + instruction["opcode"]

def sw(instruction, expression):
    register = expression.split(',')

    imm_rs2 = register[1].strip().split("(")

    imm = getImmToBin(imm_rs2[0].strip(), 12)

    rs1 = imm_rs2[1].split(")")[0].strip()

    return imm[0:7] + getRegister(register[0].strip()) + getRegister(rs1) + instruction["f3"] + imm[-5:] + instruction["opcode"]

def beq(instruction, expression):
    register = expression.split(',')

    imm = getImmToBin(register[len(register) - 1].strip(), 13)

    return imm[0] + imm[2:8] + getRegister(register[1].strip()) + getRegister(register[0].strip()) + instruction["f3"] + imm[-5:-1] + imm[1] + instruction["opcode"]

def executeL(instruction, expression):
    register = expression.split(',')

    imm = getImmToBin(register[len(register) - 1].strip(), 20, True)

    return imm[:20] + getRegister(register[0].strip()) + instruction["opcode"]

def main():
    inp = input()
    while inp != "exit":
        instrution = getFunction(inp.split(" ", 1)[0])
        
        if len(inp.split(" ", 1)) > 1:
            expression = inp.split(" ", 1)[1]

        binCode = ""

        if instrution["opcode"] == "0110011": # Tipo R (mul e xor)
            binCode = executeR(instrution, expression)
        elif instrution["opcode"] == "1100011": # beq
            binCode = beq(instrution, expression)
        elif instrution["opcode"] == "0110111": # lui
            if instrution["f3"] == "000": # lui
                binCode = executeL(instrution, expression)
            elif instrution["f3"] == "001": # li
                binCode = executeL(instrution, expression)
                print(convertBinToHex(binCode))

                exp = expression.split(',')
                rs = exp[0].strip()
                imm = exp[1].strip()

                binCode = addi(functions["addi"], f"{rs}, {rs}, {imm}")
        elif instrution["opcode"] == "0010011":
            if instrution["f3"] == "000": # addi
                binCode = addi(instrution, expression)
            elif instrution["f3"] == "001": # slli
                binCode = slli(instrution, expression)
        elif instrution["opcode"] == "1100111":
            if instrution["f3"] == "000": # ret
                binCode = jalr(instrution, "zero, ra, 0")
            elif instrution["f3"] == "001": # call
                binCode = executeL(functions["auipc"], "t1, 0")
                print(convertBinToHex(binCode))
                binCode = jalr(functions["jalr"], f"ra, t1, {expression}")
        elif instrution["opcode"] == "0000011": # lw
            binCode = lw(instrution, expression)
        elif instrution["opcode"] == "0100011": #sw
            binCode = sw(instrution, expression)

        print(convertBinToHex(binCode))

        inp = input()

main()

