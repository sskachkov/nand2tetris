from curses.ascii import isalpha, isdigit
import sys
from enum import Enum

class InstructionType(Enum):
    A, C, L = range(3)

class AssemblerException(Exception):
    def __init__(self, message, line : int):
        self.message = message
        self.line = line

    def __repr__(self) -> str:
        return f"AssemblerError({self.message})"

    def _category(self):
        return "AssemblerError"
class Parser:
    def __init__(self, source) -> None:
            self.lines = []
            self.lineIndex = -1
            self.codeLineNumber = -1
            rawLines = source.splitlines()
            for rawLine in rawLines:
                rawLine = rawLine.strip()
                commentIndex = rawLine.find('//')
                if commentIndex != -1:
                    rawLine = rawLine[:commentIndex].strip()
                if len(rawLine) == 0:
                    continue
                self.lines.append(rawLine)
        
    def hasMoreLines(self):
        return self.lineIndex + 1 < len(self.lines)
    
    def advance(self):
        self.lineIndex += 1
        self._parse()

    def _parse(self):
        statementStr = self.lines[self.lineIndex]
        if statementStr.startswith('@'):
            self.codeLineNumber += 1
            self.instructionType = InstructionType.A
            self.symbol = statementStr[1:]
        elif statementStr.startswith('('):
            # code line number remains the same for an L instruction
            self.instructionType = InstructionType.L
            self.symbol = statementStr[1:-1]
        else:
            self.codeLineNumber += 1
            self.instructionType = InstructionType.C
            self.symbol = None
            destStr = None
            compStr = None
            jmpStr = None
            if '=' in statementStr:
                lines = statementStr.split('=')
                destStr = lines[0].strip()
                statementStr = lines[1].strip()
            if ';' in statementStr:
                lines = statementStr.split(';')
                jmpStr = lines[1].strip()
                statementStr = lines[0].strip()
            compStr = statementStr
            self.dest = self._parseDest(destStr, self.lineIndex)
            self.jump = self._parseJmp(jmpStr, self.lineIndex)
            self.comp = self._parseComp(compStr, self.lineIndex)

    def _parseDest(self, destStr, line):
        if destStr == None:
            return '000'

        match destStr:
            case 'null':
                return '000'
            case 'M':
                return '001'
            case 'D':
                return '010'
            case 'DM' | 'MD':
                return '011'
            case 'A':
                return '100'
            case 'AM' | 'MA':
                return '101'
            case 'AD' | 'DA':
                return '110'
            case 'ADM' | 'AMD' | 'DAM' | 'DMA' | 'MAD' | 'MDA':
                return '111'
        raise AssemblerException(f'Unexpected DEST field [{destStr}]', line)

    def _parseJmp(self, jmpStr, line):
        if jmpStr == None:
            return '000'
        match jmpStr:
            case 'null':
                return '000'
            case 'JGT':
                return '001'
            case 'JEQ':
                return '010'
            case 'JGE':
                return '011'
            case 'JLT':
                return '100'
            case 'JNE':
                return '101'
            case 'JLE':
                return '110'
            case 'JMP':
                return '111'
        raise AssemblerException(f'Unexpected JUMP field [{jmpStr}]', line)

    def _parseComp(self, compStr, line):
        match compStr:
            case '0':
                return '0101010'
            case '1':
                return '0111111'
            case '-1':
                return '0111010'
            case 'D':
                return '0001100'
            case 'A':
                return '0110000'
            case 'M':
                return '1110000'
            case '!D':
                return '0001101'
            case '!A':
                return '0110001'
            case '!M':
                return '1110001'
            case 'D+1':
                return '0011111'
            case 'A+1':
                return '0110111'
            case 'M+1':
                return '1110111'
            case 'D-1':
                return '0001110'
            case 'A-1':
                return '0110010'
            case 'M-1':
                return '1110010'
            case 'D+A' | 'A+D':
                return '0000010'
            case 'D+M' | 'M+D':
                return '1000010'
            case 'D-A':
                return '0010011'
            case 'D-M':
                return '1010011'
            case 'A-D':
                return '0000111'
            case 'M-D':
                return '1000111'
            case 'D&A' | 'A&D':
                return '0000000'
            case 'D&M' | 'M&D':
                return '1000000'
            case 'D|A' | 'A|D':
                return '0010101'
            case 'D|M' | 'M|D':
                return '1010101'
        raise AssemblerException(f'Unexpected COMP field [{compStr}]', line)

class Assembler:
    def __init__(self):
        pass
    def main(self):
        if len(sys.argv) != 2:
            print("Usage : assembler.py [script.asm]")
            sys.exit(64)
        else:
            filename = sys.argv[1]
            if '.' in filename and filename.endswith('.asm'):
                strippedFilename = filename[:-4]
                pass
            elif '.' in filename and not filename.endswith('.asm'):
                print('Provided source file name must have .asm extension.')
                sys.exit(64)
            else:
                strippedFilename = filename
                filename += '.asm'
            print(f"Assembling {filename}")
            with open(filename) as f: 
                source = f.read()
                binaryStrings = []

            symbolTable = {'SP' : 0, 'LCL' : 1, 'ARG' : 2, 'THIS' : 3, 'THAT' : 4,
            'R0' : 0, 'R1' : 1, 'R2' : 2, 'R3' : 3, 'R4' : 4, 'R5' : 5, 'R6' : 6, 'R7' : 7, 
            'R8' : 8, 'R9' : 9, 'R10' : 10, 'R11' : 11, 'R12' : 12, 'R13' : 13, 'R14' : 14, 'R15' : 15,
            'SCREEN' : 16384, 'KBD' : 24576}
            ADDR = 16
            try:
                parser = Parser(source)
                while parser.hasMoreLines():
                    parser.advance()
                    iType = parser.instructionType
                    match iType:
                        case InstructionType.A:
                            pass
                        case InstructionType.L:
                            symbolTable[parser.symbol] = parser.codeLineNumber + 1
                            pass
                        case InstructionType.C:
                            pass
                
                parser = Parser(source)
                while parser.hasMoreLines():
                    parser.advance()
                    iType = parser.instructionType
                    match iType:
                        case InstructionType.A:
                            symbol = parser.symbol
                            if symbol[0].isdigit():
                                numSymbol = symbol
                            else:
                                if symbol not in symbolTable:
                                    symbolTable[symbol] = ADDR
                                    ADDR += 1
                                numSymbol = symbolTable[symbol]
                            str = "0" + bin(int(numSymbol))[2:]
                            str = str.rjust(16, '0')
                            binaryStrings.append(str)
                        case InstructionType.L:
                            pass
                        case InstructionType.C:
                            str = '111' + parser.comp + parser.dest +  parser.jump
                            binaryStrings.append(str)
                with open(strippedFilename + '.bin', 'w') as bf:
                    for binStr in binaryStrings:
                        bf.write(binStr + '\n')
            except AssemblerException as err:
                print (err)
                sys.exit(65)

if __name__ == "__main__":
    assembler = Assembler()
    assembler.main()
