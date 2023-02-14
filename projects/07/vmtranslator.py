#!/usr/bin/env python3

import sys
from enum import Enum

class CommandType(Enum):
    C_ARITHMETIC, C_PUSH, C_POP, C_LABEL, C_GOTO, C_IF, C_FUNCTION, C_RETURN, C_CALL = range(9)

class TranslatorException(Exception):
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
            self.commandType = None
            self.op = None
            self.arg1 = None
            self.arg2 = None

            rawLines = source.splitlines()
            for rawLine in rawLines:
                line = rawLine.strip()
                if len(line) == 0 or line.startswith('//'):
                    continue
                self.lines.append(line)

    def hasMoreLines(self):
        return self.lineIndex + 1 < len(self.lines)
    
    def advance(self):
        self.lineIndex += 1
        self._parse()

    def _parse(self):
        statementStr = self.lines[self.lineIndex]
        words = statementStr.split()
        op = words[0].lower()
        self.op = op
        match op:
            case 'push':
                self.commandType = CommandType.C_PUSH
                self.arg1 = words[1]
                self.arg2 = words[2]
            case 'pop':
                self.commandType = CommandType.C_POP
                self.arg1 = words[1]
                self.arg2 = words[2]
            case 'add':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'sub':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'neg':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'eq':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'gt':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'lt':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'and':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'or':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None
            case 'not':
                self.commandType = CommandType.C_ARITHMETIC
                self.arg1 = None
                self.arg2 = None

class CodeGenerator:
    def __init__(self, className) -> None:
        self.lines = []
        self.className = className
        self.cmpCounter = -1

    def genArithmetic(self, op):
        lines = self.lines
        match op:
            case 'add' | 'sub' | 'and' | 'or':
                self._genTwoArgCommand(op)
            case  'eq' | 'gt' | 'lt':
                self._genCmpCommand(op)
            case 'neg' | 'not':
                self._genOneArgCommand(op)

    def _genOneArgCommand(self, op):
        match op:
            case 'not':
                cmd = 'M=!M'
            case 'neg':
                cmd = 'M=-M'
            case _:
                raise TranslatorException('Unknown one arg command: ' + op)
        lines = self.lines
        lines.append(f'//Command "{op}" start.')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append(cmd)
        lines.append('@SP')
        lines.append('M=M+1')
        lines.append(f'//Command "{op}" end.')
        lines.append('')



    def _genTwoArgCommand(self, op):
        match op:
            case 'add':
                cmd = 'D=D+A'
            case 'sub':
                cmd = 'D=A-D'
            case 'and':
                cmd = 'D=D&A'
            case 'or':
                cmd = 'D=D|A'
            case _:
                raise TranslatorException('Unknown two arg command: ' + op)
        lines = self.lines
        lines.append(f'//Command "{op}" start.')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('D=M')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('A=M')
        
        lines.append(cmd)

        lines.append('@SP')
        lines.append('A=M')
        lines.append('M=D')
        lines.append('@SP')
        lines.append('M=M+1')
        lines.append(f'//Command "{op}" end.')
        lines.append('')


    def _genCmpCommand(self, op):
        match op:
            case 'eq':
                cmd = 'D;JEQ'
            case 'gt':
                cmd = 'D;JLT'
            case 'lt':
                cmd = 'D;JGT'
            case _:
                raise TranslatorException('Unknown cmp command: ' + op)
        labelCounter = self._getNextCmpLabelCounterValue()
        lines = self.lines
        lines.append(f'//Command "{op}" #{labelCounter} start.')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('D=M')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('A=M')
        lines.append('D=D-A')
        lines.append(f'@L_CMP_SUCCESS_{labelCounter}')
        lines.append(cmd)
        
        lines.append('@0')
        lines.append('D=A')
        self._genPushD()
        lines.append(f'@L_CMP_END_{labelCounter}')
        lines.append('0;JMP')
        lines.append(f'(L_CMP_SUCCESS_{labelCounter})')
        lines.append('D=-1')
        self._genPushD()
        lines.append(f'(L_CMP_END_{labelCounter})')
        lines.append(f'//Command "{op}" #{labelCounter} end.')
        lines.append('')


    def _getNextCmpLabelCounterValue(self):
        self.cmpCounter += 1
        return self.cmpCounter


    def genPush(self, segment, index):
        #segment can be:         argument,  local,  static,  constant,  this,   that, pointer,  temp
        #corresponding pointers: arg,       lcl,    16,      ?,         this,   that, 3 and 4,  5
        lines = self.lines
        lines.append(f'//Command "push {segment} {index}" start.')
        match segment:
            case 'argument' | 'local' | 'this' | 'that':
                varName = ''
                match segment:
                    case 'argument':
                        varName = 'ARG'
                    case 'local':
                        varName = 'LCL'
                    case 'this':
                        varName = 'THIS'
                    case 'that': 
                        varName = 'THAT'
                if index > 0:
                    lines.append(f'@{index}')
                    lines.append('D=A')
                lines.append(f'@{varName}')
                lines.append('A=M')
                if index > 0:
                    lines.append('A=A+D')
                lines.append('D=M')
                self._genPushD()
            case 'static' | 'pointer' | 'temp':
                match segment:
                    case 'static':
                        baseAddr = 16
                    case 'pointer':
                        baseAddr = 3
                    case 'temp':
                        baseAddr = 5
                lines.append(f'@{baseAddr + index}')
                lines.append('D=M')
                self._genPushD()
            case 'constant':
                lines.append(f'@{index}')
                lines.append('D=A')
                self._genPushD()
        lines.append(f'//Command "push {segment} {index}" end.')
        lines.append('')


    def genPop(self, segment, index):
        lines = self.lines
        lines.append(f'//Command "pop {segment} {index}" start.')
        match segment:
            case 'argument' | 'local' | 'this' | 'that':
                varName = ''
                match segment:
                    case 'argument':
                        varName = 'ARG'
                    case 'local':
                        varName = 'LCL'
                    case 'this':
                        varName = 'THIS'
                    case 'that': 
                        varName = 'THAT'
                lines.append(f'@{varName}')
                lines.append('D=M')
                if index > 0:
                    lines.append(f'@{index}')
                    lines.append('D=D+A')

            case 'static' | 'pointer' | 'temp':
                match segment:
                    case 'static':
                        baseAddr = 16
                    case 'pointer':
                        baseAddr = 3
                    case 'temp':
                        baseAddr = 5
                lines.append(f'@{baseAddr + index}')
                lines.append('D=A')

        lines.append('@R13')
        lines.append('M=D')

        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('D=M')

        lines.append('@R13')
        lines.append('A=M')
        lines.append('M=D')
        lines.append(f'//Command "pop {segment} {index}" end.')






















    def genPopOld(self, segment, index):
        lines = self.lines
        lines.append(f'//Command "pop {segment} {index}" start.')
        lines.append('@SP')
        lines.append('A=M')
        lines.append('A=A-1')
        lines.append('D=M')
        lines.append('@R13')
        lines.append('M=D')

        match segment:
            case 'argument' | 'local' | 'this' | 'that':
                varName = ''
                match segment:
                    case 'argument':
                        varName = 'ARG'
                    case 'local':
                        varName = 'LCL'
                    case 'this':
                        varName = 'THIS'
                    case 'that': 
                        varName = 'THAT'
                if index > 0:
                    lines.append(f'@{index}')
                    lines.append('D=A')
                lines.append(f'@{varName}')
                lines.append('A=M')
                if index > 0:
                    lines.append('A=A+D')
            case 'static' | 'pointer' | 'temp':
                match segment:
                    case 'static':
                        baseAddr = 16
                    case 'pointer':
                        baseAddr = 3
                    case 'temp':
                        baseAddr = 5
                lines.append(f'@{baseAddr + index}')

        lines.append('D=M')
        lines.append('@R13')
        lines.append('A=M')
        lines.append('D=M')

        lines.append(f'//Command "pop {segment} {index}" end.')

    def _genPushD(self):
        lines = self.lines
        lines.append('@SP')
        lines.append('A=M')
        lines.append('M=D')
        lines.append('@SP')
        lines.append('M=M+1')

class Translator:
    def __init__(self):
        pass

    def main(self):
        if len(sys.argv) != 2:
            print("Usage : vmtranslator.py [script.vm]")
            sys.exit(64)
        else:
            filename = sys.argv[1]
            if '.' in filename and filename.endswith('.vm'):
                strippedFilename = filename[:-3]
                pass
            elif '.' in filename and not filename.endswith('.vm'):
                print('Provided source file name must have .vm extension.')
                sys.exit(64)
            else:
                strippedFilename = filename
                filename += '.vm'
            print(f"Assembling {filename}")
            with open(filename) as f: 
                source = f.read()
            try:
                parser = Parser(source)
                gen = CodeGenerator(strippedFilename)
                while parser.hasMoreLines():
                    parser.advance()
                    iType = parser.commandType
                    match iType:
                        case CommandType.C_PUSH:
                            gen.genPush(parser.arg1, int(parser.arg2))
                        case CommandType.C_POP:
                            gen.genPop(parser.arg1, int(parser.arg2))
                        case CommandType.C_ARITHMETIC:
                            gen.genArithmetic(parser.op)
                        
                asmStrings = gen.lines
                with open(strippedFilename + '.asm', 'w') as bf:
                    for asmStr in asmStrings:
                        bf.write(asmStr + '\n')

            except Exception as err:
                print (err)
                sys.exit(65)

if __name__ == "__main__":
    assembler = Translator()
    assembler.main()
