import sys

def clear_ins(l):
	l = l.split('] ')[1] 
	#remove comment
	if ";" in l:
		l = l.split(";")[0].strip()
	out = l.split()
	for i, o in enumerate(out):
		if i > 0:
			out[i] = int(o)
	return out
	
def clear_var(l):
	#remove comment
	if ";" in l:
		l = l.split(";")[0].strip()
	#but also handle the other dtypes
	if '"' in l:
		l = l.replace('"', '')
	elif "nil" == l:
		l = None
	else:
		try:
			l = int(l)
		except:
			pass
	return l


# def getv(n):
	# try:
		# if locals[n] and not registers[n]:
			# return locals[n]
		# else:
			# return registers[n]
			
	# except:
		# return registers[n]
		
def read_instr(closure, i, indent=0, was_self=False, notagain=None):
	def RK(n):
		#RK(B) Register B or a constant index
		#RK(C) Register C or a constant index
		# RK may be registers or constants
		if n < 250:
			return closure.registers[n]
		else:
			return closure.constants[n-250]
	instructions = closure.instructions
	if i == notagain:
		# print("info: terminated loop construct")
		return
	ins = instructions[i]
	# print(ins[0])
		
	###########################################################
	# 6	 Loading Constants
	###########################################################
		
	if ins[0] == "move":
		#A B	 R(A) := R(B)
		A, B = ins[1:]
		closure.registers[A] = closure.registers[B]
		read_instr(closure, i+1, indent, was_self, notagain)
	
	elif ins[0] == "loadk":
		A,B = ins[1:]
		closure.registers[A] = closure.constants[B]
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "loadbool":
		#A B C	 R(A) := (Bool)B; if (C) PC++
		A, B, C = ins[1:]
		closure.registers[A] = bool(B)
		if C:
			read_instr(closure, i+2, indent, was_self, notagain)
		else:
			read_instr(closure, i+1, indent, was_self, notagain)
	
	###########################################################
	# 7	 Upvalues and Globals
	###########################################################
	
	#upvalues only store their name
	elif ins[0] == "getupval":
		#A B   R(A) := UpValue[B]
		A, B = ins[1:]
		closure.registers[A] = closure.upvalues[B]
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "setupval":
		#A B UpValue[B] := R(A)
		A,B = ins[1:]
		closure.upvalues[B] = closure.registers[A]
		# print("setupval",upvalues[B])
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "getglobal":
		#A Bx R(A) := Gbl[Kst(Bx)]
		A, Bx = ins[1:]
		globals[ closure.constants[Bx] ] = closure.constants[Bx]
		closure.registers[A] = globals[ closure.constants[Bx] ]
		# print( "\t"*indent + f"{closure.registers[A]} = {globals[ closure.constants[Bx] ]}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "setglobal":
		#A Bx  Gbl[Kst(Bx)] := R(A)
		A,Bx = ins[1:]
		closure.registers[A] = closure.constants[Bx] 
		# print( "\t"*indent + f"{ closure.constants[Bx] } = {closure.registers[A]}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	###########################################################
	# 8	 Table Instructions
	###########################################################
	elif ins[0] == "settable":
		# A B C	  R(A)[RK(B)] := RK(C)
		A,B,C = ins[1:]
		var_A = closure.registers[A]
		var_B = RK(B)
		var_C = RK(C)
		# int indexing
		if type(var_B) == type(0):
			print( "\t"*indent + f"{var_A}[{var_B}] = {var_C}" )
		else:
			print( "\t"*indent + f"{var_A}.{var_B} = {var_C}" )
		#just continue with the next
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "gettable":
		
		# R(A) := R(B)[RK(C)]
		A,B,C = ins[1:]
		var_A = closure.registers[A]
		var_B = closure.registers[B]
		var_C = RK(C)
		# int indexing
		if type(var_C) == type(0):
			print( "\t"*indent + f"local {var_A} = {var_B}[{var_C}]" )
		else:
			print( "\t"*indent + f"local {var_A} = {var_B}.{var_C}" )
		#just continue with the next
		read_instr(closure, i+1, indent, was_self, notagain)
        
	elif ins[0] == "gettabup":
		
		# R(A) := UpValue[B][RK(C)]
		A,B,C = ins[1:]
		var_A = closure.registers[A]
		var_B = closure.upvalues[B]
		var_C = RK(C)
		# int indexing
		if type(var_C) == type(0):
			print( "\t"*indent + f"local {var_A} = {var_B}[{var_C}]" )
		else:
			print( "\t"*indent + f"local {var_A} = {var_B}.{var_C}" )
		#just continue with the next
		read_instr(closure, i+1, indent, was_self, notagain)
        
	elif ins[0] == "vararg":
		#A B   R(A) := UpValue[B]
		A, B = ins[1:]
		closure.registers[A] = closure.upvalues[B]
		read_instr(closure, i+1, indent, was_self, notagain)
	
	
	###########################################################
	# 9 Arithmetic and String Instructions
	###########################################################
	# note: we can't perform these additions because data may be vars or constants
	elif ins[0] == "add":
		#A B C	R(A) := RK(B) + RK(C)
		A,B,C = ins[1:]
		# closure.registers[A] = RK(B)# + RK(C)
		print( "\t"*indent + f"{closure.registers[A]} = {RK(B)} + {RK(C)}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "sub":
		#A B C	R(A) := RK(B) - RK(C)
		A,B,C = ins[1:]
		# closure.registers[A] = RK(B)# - RK(C)
		print( "\t"*indent + f"{closure.registers[A]} = {RK(B)} - {RK(C)}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "mul":
		#A B C	R(A) := RK(B) * RK(C)
		A,B,C = ins[1:]
		# closure.registers[A] = RK(B)# * RK(C)
		print( "\t"*indent + f"{closure.registers[A]} = {RK(B)} * {RK(C)}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "div":
		#A B C	R(A) := RK(B) / RK(C)
		A,B,C = ins[1:]
		# closure.registers[A] = RK(B)# / RK(C)
		print( "\t"*indent + f"{closure.registers[A]} = {RK(B)} / {RK(C)}")
		read_instr(closure, i+1, indent, was_self, notagain)
	
	elif ins[0] == "pow":
		#A B C	R(A) := RK(B) ^ RK(C)
		A,B,C = ins[1:]
		# closure.registers[A] = RK(B)# ** RK(C)
		print( "\t"*indent + f"{closure.registers[A]} = {RK(B)} ^ {RK(C)}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "concat":
		#A B C R(A) := R(B).. ... ..R(C)
		A,B,C = ins[1:]
		#add lua concatenation operator between all operands
		out = "..".join([str(closure.registers[j]) for j in range(B, C+1)])
		#store
		closure.registers[A] = out
		# print( "\t"*indent + f"...concatenated {out}")
		read_instr(closure, i+1, indent, was_self, notagain)
		
	###########################################################
	# 10  Jumps and Calls
	###########################################################
	
	elif ins[0] == "jmp":
		# sBx PC += sBx
		read_instr(closure, i+ins[1]+1, indent, was_self, notagain)
		
	elif ins[0] == "call":
		#A B C	 R(A), ... ,R(A+C-2) := R(A)(R(A+1), ... ,R(A+B-1))
		A,B,C = ins[1:]
		# A determines start of params & returns
		# B determines amount of parameters: parameters = B-1
		# C determines amount of returns
		
		#get parameters from the registers after A
		if not was_self:
			params = ", ".join([str(closure.registers[j]) for j in range(A+1, A+B)])
			if C == 1:
				print( "\t"*indent + f"{closure.registers[A]}("+ params+")")
			else:
				returns = ", ".join([str(closure.registers[j]) for j in range(A, A+C-1)])
				print( "\t"*indent + f"local {returns} = {closure.registers[A]}("+ params+")")
		else:
			params = ", ".join([str(closure.registers[j]) for j in range(A+2, A+B)])
			if C == 1:
				print( "\t"*indent + f"{closure.registers[A]}:{closure.registers[A+1]}("+ params+")")
			else:
				returns = ", ".join([str(closure.registers[j]) for j in range(A, A+C-1)])
				print( "\t"*indent + f"local {returns} = {closure.registers[A]}:{closure.registers[A+1]}("+ params+")")
			
		read_instr(closure, i+1, indent, False, notagain)
	
	elif ins[0] == "return":
		#A B   return R(A), ... ,R(A+B-2)
		A,B = ins[1:]
		# A determines start of returns
		# B determines amount of returns
		#B == 1 means no return values
		params = ", ".join([str(closure.registers[j]) for j in range(A, A+B-1)])
		print( "\t"*indent + f"return "+ params)
		
	elif ins[0] == "self":
		#A B C	 R(A+1) := R(B); R(A) := R(B)[RK(C)]
		A,B,C = ins[1:]
		# A determines start of params & returns
		# B determines amount of parameters
		# C determines amount of returns
		
		var_A = RK(A)
		var_B = RK(B)
		var_C = RK(C)
		closure.registers[A+1] = var_C
		# registers[A] = var_B+":"+var_C
		closure.registers[A] = closure.registers[B]
		# registers[A] = RK(C)
		# print( "\t"*indent + f"local {var_A} = {var_B}:{var_C}("")")
		read_instr(closure, i+1, indent, True, notagain)
		
	###########################################################
	# 11  Relational and Logic Instructions
	###########################################################
	elif ins[0] in ("eq", "lt", "le"):
		# if ((RK(B) == RK(C)) ~= A) then pc++
		A,B,C = ins[1:]
		#set the comparison operator
		if ins[0] == "eq":
			if A == 1:
				op = "~="
			else:
				op = "=="
		elif ins[0] == "lt":
			if A == 1:
				op = ">"
			else:
				op = "<"
		elif ins[0] == "le":
			if A == 1:
				op = ">="
			else:
				op = "<="
		print( "\t"*indent + f"if {RK(B)} {op} {RK(C)} then" )
		#true path
		read_instr(closure, i+2, indent+1, was_self, notagain)
		#false path
		print( "\t"*indent + "else")
		read_instr(closure, i+1, indent+1, was_self, notagain)
		print( "\t"*indent + "end")
	
	elif ins[0] == "test":
		# A B C	  if (R(B) <=> C) then R(A) := R(B) else pc++ 
		A,B,C = ins[1:]
		#this needs more work
		closure.registers[A] = closure.registers[B]
		print( "\t"*indent + f"if ({closure.registers[B]}) then" )
		#true path
		read_instr(closure, i+2, indent+1, was_self, notagain)
		#false path
		print( "\t"*indent + "else")
		read_instr(closure, i+1, indent+1, was_self, notagain)
		print( "\t"*indent + "end")
	
	###########################################################
	# 12  Loop Instructions
	###########################################################
	elif ins[0] == "forloop":
		#A sBx	  R(A)+=R(A+2)
		#if R(A) <?= R(A+1) then PC+= sBx
		A, sBx = ins[1:]
		print( "\t"*indent + f"for {closure.registers[A]} = {A} do")
		read_instr(closure, i+ins[2]+1, indent+1, was_self, i)
		print( "\t"*indent + f"end")
	
	###########################################################
	# 13  Table Creation
	###########################################################
	
	elif ins[0] == "newtable":
		# A B C	  R(A) := {} (size = B,C)
		A,B,C = ins[1:]
		var_A = closure.registers[A]
		print( "\t"*indent + f"local {var_A} = "+"{}")
		#just continue with the next
		read_instr(closure, i+1, indent, was_self, notagain)
		
	elif ins[0] == "setlist":
		#A Bx	  R(A)[Bx-Bx%FPF+i] := R(A+i),
		# where 1 <= i <= Bx%FPF+1
		A, Bx = ins[1:]
		
		#hardcoded in lua
		FPF = 32
		
		input = ", ".join( [ closure.registers[A+j] for j in range(1, Bx%FPF+1) ] )
		# print(Bx%FPF+1)
		# print(A,Bx)
		print( "\t"*indent + f"{closure.registers[A]} = "+"{"+input+"}")
		read_instr(closure, i+1, indent, was_self, notagain)
	
	###########################################################
	# 14  Closures and Closing
	###########################################################
	
	elif ins[0] == "closure":
		#A Bx	 R(A) := closure(KPROTO[Bx], R(A), ... ,R(A+n))
		A, Bx = ins[1:]
		
		read_instr(closure, i+1, indent, was_self, i+2)
		# todo: get registers[A] _after_ the next instruction
		print( )
		print( "\t"*indent + f"function {closure.registers[A]}()")
		read_instr(closures[Bx+1], 0, indent+1, )
		print( "\t"*indent + f"end")
		read_instr(closure, i+2, indent, was_self, notagain)
		
	else:
		print("\t"*indent + "NOT IMPLEMENTED "+ins[0])
	

def find_all(a_str, sub):
	start = 0
	while True:
		start = a_str.find(sub, start)
		if start == -1: return
		yield start
		start += len(sub)
		
file = "compiled2.asm"
file = "jgb.lua"
file = sys.argv[1]
f = open(file, "r")
text = f.read()
#get locations of functions' starts and ends
starts = list(find_all(text, ".function"))
ends = list(find_all(text, "; end of function"))

#resolve
functions = []
for start in reversed(starts):
	diffs = [end-start for end in ends if end > start]
	end = start+min(diffs)
	ends.remove(end)
	functions.append( (start, end) )
functions.reverse()

#assign levels
level = 1
for i, (start, end) in enumerate(functions):
	print(functions[i])
	if i > 0:
		if start < functions[i-1][1]:
			level+=1
			print("this function is nested",level)
		else:
			print("this function ends before next starts", level)
	else:
		print("toplevel func")
	
print(functions)
start, end = functions[0]

globals = {}
start1, end1 = functions[1]
start2, end2 = functions[-1]
texts = [text[start:start1]+text[end2:end], ] + [ text[start:end] for start, end in functions[1:]]

class LuaClosure():
	def __init__(self, locals, constants, instructions, registers, upvalues):
		self.locals = locals
		self.constants = constants
		self.instructions = instructions
		self.registers = registers
		self.upvalues = upvalues
		
def text_to_closure(text):
	locals = []
	constants = []
	instructions = []
	registers = []
	for line in text.splitlines():
		if line.startswith(".function"):
			# vararg function flag, true if non-zero
			# maximum stack size (number of registers used)
			num_upvalues, num_params, vararg_flag, max_stack_size = [int(j) for j in line[10:].split()]
			
		if line.startswith(".local"):
			locals.append( clear_var(line[8:]) )
			
		if line.startswith(".const"):
			constants.append( clear_var(line[8:]) )
			
		if line.startswith("["):
			instructions.append( clear_ins(line)  )
			
		# if line.startswith("; end of function"):
	# registers = [f"reg{i}" for i in range(max_stack_size)]
	registers = [f"reg{i}" for i in range(255)]
	constants.extend([f"con{i}" for i in range(255)])
	registers[0:len(locals)] = locals
	# upvalues = [f"upval{i}" for i in range(num_upvalues)]
	upvalues = [f"upval{i}" for i in range(255)]
	print(num_upvalues, num_params, vararg_flag, max_stack_size)
	return LuaClosure(locals, constants, instructions, registers, upvalues)

closures = [text_to_closure(text) for text in texts]
read_instr(closures[0], 0)