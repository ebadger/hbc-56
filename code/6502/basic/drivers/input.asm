; Troy's HBC-56 - BASIC - Input
;
; Copyright (c) 2021 Troy Schrapel
;
; This code is licensed under the MIT license
;
; https://github.com/visrealm/hbc-56
;


; -----------------------------------------------------------------------------
; hbc56In - EhBASIC input subroutine (for HBC-56) - must not block
; -----------------------------------------------------------------------------
; Outputs:      A - ASCII character captured from keyboard
;               C - Flag set if key captured, clear if no key pressed
; -----------------------------------------------------------------------------
hbc56In
        jmp kbReadAscii ; HBC-56 keyboard routine can be used directly
                        ; we could just use it directly in the vector 
                        ; table, but it's here for clarity



; -----------------------------------------------------------------------------
; hbc56Break - EhBASIC Ctrl+C check subroutine (for HBC-56) - must not block
; -----------------------------------------------------------------------------
; Outputs:      A - ASCII character captured from keyboard ($03 = Ctrl+C)
; -----------------------------------------------------------------------------
hbc56Break:
        jmp kbReadAscii         ; F4 (Ctrl+C) will return $03
        