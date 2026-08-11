#!/usr/bin/env python3

import sys, traceback
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
            case 'label':
                self.commandType = CommandType.C_LABEL
                self.arg1 = words[1]
            case 'goto':
                self.commandType = CommandType.C_GOTO
                self.arg1 = words[1]
            case 'if-goto':
                self.commandType = CommandType.C_IF
                self.arg1 = words[1]
            case 'function':
                self.commandType = CommandType.C_FUNCTION
                self.arg1 = words[1]
                self.arg2 = words[2]
            case 'call':
                self.commandType = CommandType.C_CALL
                self.arg1 = words[1]
                self.arg2 = words[2]
            case 'return':
                self.commandType = CommandType.C_RETURN
                self.arg1 = None
                self.arg2 = None


class CodeGenerator:
    def __init__(self, fileName) -> None:
        self.lines = []
        self.fileName = fileName
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
        labelCounter = self._getNextLabelCounterValue()
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


    def _getNextLabelCounterValue(self):
        self.cmpCounter += 1
        return self.cmpCounter

    def genLabel(self, labelName, scope):
        lines = self.lines
        lines.append(f'({self.fileName}_{scope}_{labelName})')
    
    def genGoto(self, labelName, scope):
        lines = self.lines
        lines.append('//Command goto start.')
        lines.append(f'@{self.fileName}_{scope}_{labelName}')
        lines.append('0;JMP')
        lines.append('//Command goto end.')

    def genIf(self, labelName, scope):
        lines = self.lines
        lines.append('//Command if-goto start.')
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('D=M')
        lines.append(f'@{self.fileName}_{scope}_{labelName}')
        lines.append('D;JNE')
        lines.append('//Command if-goto end.')

    def genFunc(self, funcName, nVars):
        lines = self.lines
        lines.append(f'//Function header {funcName} start.')
        lines.append(f'({funcName})')
        for i in range(nVars):
            self.genPush('constant', 0)
        lines.append(f'//Function header {funcName} end.')

    def genCallFunc(self, funcName, nArgs, scope):
        lines = self.lines
        counter = self._getNextLabelCounterValue()
        returnAddr = f'{self.fileName}_{scope}_{counter}'
        lines.append(f'//call to {funcName} start.')
        self.genPush('constant', returnAddr)
        self.genPushValue('LCL')
        self.genPushValue('ARG')
        self.genPushValue('THIS')
        self.genPushValue('THAT')
        lines.append('//move ARG')
        lines.append('@SP')
        lines.append('D=M')
        lines.append(f'@{5 + nArgs}')
        lines.append('D=D-A')
        lines.append('@ARG')
        lines.append('M=D')

        lines.append('//move LCL')
        lines.append('@SP')
        lines.append('D=M')
        lines.append('@LCL')
        lines.append('M=D')
        lines.append('//func call and return label')
        lines.append(f'@{funcName}')
        lines.append('0;JMP')
        lines.append(f'({returnAddr})')
        lines.append(f'//call to {funcName} end.')

    def genReturn(self):
        lines = self.lines
        lines.append('//return start')
        #frame = LCL
        lines.append('@LCL')
        lines.append('D=M')
        lines.append('@frame')
        lines.append('M=D')
        #retAddr = *(frame - 5)
        lines.append('@5')
        lines.append('A=D-A')
        lines.append('D=M')
        lines.append('@retAddr')
        lines.append('M=D')
        #*ARG = pop() -- reposition the return value for the caller
        lines.append('@SP')
        lines.append('M=M-1')
        lines.append('A=M')
        lines.append('D=M')
        lines.append('@ARG')
        lines.append('A=M')
        lines.append('M=D')
        #SP = ARG + 1
        lines.append('@ARG')
        lines.append('D=M+1')
        lines.append('@SP')
        lines.append('M=D')
        #THAT = *(frame - 1)
        lines.append('@frame')
        lines.append('D=M')
        lines.append('@1')
        lines.append('A=D-A')
        lines.append('D=M')
        lines.append('@THAT')
        lines.append('M=D')
        #THIS = *(frame - 2)
        lines.append('@frame')
        lines.append('D=M')
        lines.append('@2')
        lines.append('A=D-A')
        lines.append('D=M')
        lines.append('@THIS')
        lines.append('M=D')
        #ARG = *(frame - 3)
        lines.append('@frame')
        lines.append('D=M')
        lines.append('@3')
        lines.append('A=D-A')
        lines.append('D=M')
        lines.append('@ARG')
        lines.append('M=D')
        #LCL = *(frame - 4)
        lines.append('@frame')
        lines.append('D=M')
        lines.append('@4')
        lines.append('A=D-A')
        lines.append('D=M')
        lines.append('@LCL')
        lines.append('M=D')
        #goto retAddr
        lines.append('@retAddr')
        lines.append('A=M')
        lines.append('0;JMP')
        lines.append('//return end')

        
    def genPushValue(self, varName):
        lines = self.lines
        lines.append(f'//Command "push value of {varName} start.')
        lines.append(f'@{varName}')
        lines.append('D=M')
        self._genPushD()
        lines.append(f'//Command "push value of {varName} end.')



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
            strippedFilenameWithPath = strippedFilename
            folderSeparatorIndex = strippedFilename.rfind('/')
            if folderSeparatorIndex != -1:
                strippedFilename = strippedFilename[folderSeparatorIndex + 1:]

            print(f"Assembling {strippedFilenameWithPath}")
            with open(filename) as f: 
                source = f.read()
            try:
                parser = Parser(source)
                gen = CodeGenerator(strippedFilename)
                scope = ''
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
                        case CommandType.C_LABEL:
                            gen.genLabel(parser.arg1, scope)
                        case CommandType.C_GOTO:
                            gen.genGoto(parser.arg1, scope)
                        case CommandType.C_IF:
                            gen.genIf(parser.arg1, scope)
                        case CommandType.C_FUNCTION:
                            scope = parser.arg1
                            gen.genFunc(parser.arg1, int(parser.arg2))
                        case CommandType.C_RETURN:
                            scope = ''
                            gen.genReturn()
                        case CommandType.C_CALL:
                            gen.genCallFunc(parser.arg1, int(parser.arg2), scope)
                       
                        
                asmStrings = gen.lines
                with open(strippedFilenameWithPath + '.asm', 'w') as bf:
                    for asmStr in asmStrings:
                        bf.write(asmStr + '\n')

            except Exception as err:
                print (traceback.format_exc())
                sys.exit(65)

if __name__ == "__main__":
    assembler = Translator()
    assembler.main()
