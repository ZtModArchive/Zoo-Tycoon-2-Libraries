; source chunk: alwaysrun.bin
; x86 standard (32-bit, little endian, doubles)

; function [0] definition (level 1)
; 0 upvalues, 0 params, 2 stacks
.function  0 0 0 2
.const  "include"  ; 0
.const  "scenario/scripts/awards.lua"  ; 1
.const  "exec"  ; 2

; function [0] definition (level 2)
; 0 upvalues, 1 params, 7 stacks
.function  0 1 0 7
.const  "queryObject"  ; 0
.const  "ZTStatus"  ; 1
.const  "ZT_GET_IS_CAMPAIGN"  ; 2
.const  "BFLOG"  ; 3
.const  "checking awards through alwaysrun.lua"  ; 4
.const  "checkawards"  ; 5
.const  "hideAwardBonus"  ; 6
.const  nil  ; 7
.const  "BFScenarioMgr"  ; 8
.const  "UI_HIDE"  ; 9
.const  "award bonus"  ; 10
.const  1  ; 11
[01] getglobal  1   0        ; queryObject
[02] loadk      2   1        ; "ZTStatus"
[03] call       1   2   2  
[04] test       1   1   0    ; to [6] if true
[05] jmp        23           ; to [29]
[06] self       2   1   252  ; "ZT_GET_IS_CAMPAIGN"
[07] call       2   2   2  
[08] loadbool   3   1   0    ; true
[09] eq         0   2   3    ; to [11] if true
[10] jmp        18           ; to [29]
[11] getglobal  3   3        ; BFLOG
[12] loadk      4   4        ; "checking awards through alwaysrun.lua"
[13] call       3   2   1  
[14] getglobal  3   5        ; checkawards
[15] move       4   0      
[16] call       3   2   1  
[17] gettable   3   0   256  ; "hideAwardBonus"
[18] eq         0   3   257  ; nil, to [20] if true
[19] jmp        9            ; to [29]
[20] getglobal  3   0        ; queryObject
[21] loadk      4   8        ; "BFScenarioMgr"
[22] call       3   2   2  
[23] eq         1   3   257  ; nil, to [25] if false
[24] jmp        4            ; to [29]
[25] self       4   3   259  ; "UI_HIDE"
[26] loadk      6   10       ; "award bonus"
[27] call       4   3   1  
[28] settable   0   256 261  ; "hideAwardBonus" 1
[29] return     0   1      
; end of function

[1] getglobal  0   0        ; include
[2] loadk      1   1        ; "scenario/scripts/awards.lua"
[3] call       0   2   1  
[4] closure    0   0        ; 0 upvalues
[5] setglobal  0   2        ; exec
[6] return     0   1      
; end of function

