; Fills a band across the screen with vertical bars in all 256
; attributes, then cycles a portion of the palette until a key is
; pressed.
; Assemble with MASM or TASM
;
USE_BIOS                equ     1       ;set to 1 to use BIOS functions to access the
                                        ; DAC, 0 to read and write the DAC directly
GUARD_AGAINST_INTS      equ     1       ;1 to turn off interrupts and set write index
                                        ; before loading each DAC location, 0 to rely
                                        ; on the DAC auto-incrementing
WAIT_VSYNC              equ     1       ;set to 1 to wait for the leading edge of
                                        ; vertical sync before accessing the DAC, 0
                                        ; not to wait
NOT_8088                equ     0       ;set to 1 to use REP INSB and REP OUTSB when
                                        ; accessing the  DAC directly, 0 to use
                                        ; IN/STOSB and LODSB/OUT
CYCLE_SIZE              equ     256     ;# of DAC locations to cycle, 256 max
SCREEN_SEGMENT          equ     0a000h  ;mode 13h display memory segment
SCREEN_WIDTH_IN_BYTES   equ     320     ;# of bytes across the screen in mode 13h
INPUT_STATUS_1          equ     03dah   ;input status 1 register port
DAC_READ_INDEX          equ     03c7h   ;DAC Read Index register
DAC_WRITE_INDEX         equ     03c8h   ;DAC Write Index register
DAC_DATA                equ     03c9h   ;DAC Data register

if NOT_8088
        .286
endif   ;NOT_8088

        .model  small
        .stack  100h
        .data
;Storage for all 256 DAC locations, organized as one three-byte
; (actually three 6-bit values; upper two bits of each byte aren't
; significant) RGB triplet per color.
PaletteTemp     db      256*3 dup(?)
        .code
start:
        mov     ax,@data
        mov     ds,ax

;Select VGA's standard 256-color graphics mode, mode 13h.
        mov     ax,0013h        ;AH = 0: set mode function,
        int     10h             ; AL = 13h: mode # to set

;Read all 256 DAC locations into PaletteTemp (3 6-bit values, one
; each for red, green, and blue, per DAC location).

if WAIT_VSYNC
;Wait for the leading edge of the vertical sync pulse; this ensures
; that we read the DAC starting during the vertical non-display
; period.
        mov     dx,INPUT_STATUS_1
WaitNotVSync:                   ;wait to be out of vertical sync
        in      al,dx
        and     al,08h
        jnz     WaitNotVSync
WaitVSync:                      ;wait until vertical sync begins
        in      al,dx
        and     al,08h
        jz      WaitVSync
endif   ;WAIT_VSYNC

if USE_BIOS
        mov     ax,1017h        ;AH = 10h: set DAC function,
                                ; AL = 17h: read DAC block subfunction
        sub     bx,bx           ;start with DAC location 0
        mov     cx,256          ;read out all 256 locations
        mov     dx,seg PaletteTemp
        mov     es,dx
        mov     dx,offset PaletteTemp ;point ES:DX to array in which
                                ; the DAC values are to be stored
        int     10h             ;read the DAC
else    ;!USE_BIOS
 if GUARD_AGAINST_INTS
        mov     cx,CYCLE_SIZE   ;# of DAC locations to load
        mov     di,seg PaletteTemp
        mov     es,di
        mov     di,offset PaletteTemp ;dump the DAC into this array
        sub     ah,ah           ;start with DAC location 0
DACStoreLoop:
        mov     dx,DAC_READ_INDEX
        mov     al,ah
        cli
        out     dx,al           ;set the DAC location #
        mov     dx,DAC_DATA
        in      al,dx           ;get the red component
        stosb
        in      al,dx           ;get the green component
        stosb
        in      al,dx           ;get the blue component
        stosb
        sti
        inc     ah
        loop    DACStoreLoop
 else   ;!GUARD_AGAINST_INTS
        mov     dx,DAC_READ_INDEX
        sub     al,al
        out     dx,al           ;set the initial DAC location to 0
        mov     di,seg PaletteTemp
        mov     es,di
        mov     di,offset PaletteTemp ;dump the DAC into this array
        mov     dx,DAC_DATA
  if NOT_8088
        mov     cx,CYCLE_SIZE*3
        rep     insb            ;read CYCLE_SIZE DAC locations at once
  else  ;!NOT_8088
        mov     cx,CYCLE_SIZE   ;# of DAC locations to load
DACStoreLoop:
        in      al,dx           ;get the red component
        stosb
        in      al,dx           ;get the green component
        stosb
        in      al,dx           ;get the blue component
        stosb
        loop    DACStoreLoop
  endif ;NOT_8088
 endif  ;GUARD_AGAINST_INTS
endif   ;USE_BIOS

;Draw a series of 1-pixel-wide vertical bars across the screen in
; attributes 1 through 255.
        mov     ax,SCREEN_SEGMENT
        mov     es,ax
        mov     di,50*SCREEN_WIDTH_IN_BYTES ;point ES:DI to the start
                                ; of line 50 on the screen
        cld
        mov     dx,100          ;draw 100 lines high
RowLoop:
        mov     al,1            ;start each line with attr 1
        mov     cx,SCREEN_WIDTH_IN_BYTES ;do a full line across
ColumnLoop:
        stosb                   ;draw a pixel
        add     al,1            ;increment the attribute
        adc     al,0            ;if the attribute just turned
                                ; over to 0, increment it to 1
                                ; because we're not going to
                                ; cycle DAC location 0, so
                                ; attribute 0 won't change
        loop    ColumnLoop
        dec     dx
        jnz     RowLoop

;Cycle the specified range of DAC locations until a key is pressed.
CycleLoop:
;Rotate colors 1-255 one position in the PaletteTemp array;
; location 0 is always left unchanged so that the background
; and border don't change.
        push    word ptr PaletteTemp+(1*3)      ;set aside PaletteTemp
        push    word ptr PaletteTemp+(1*3)+2    ; setting for attr 1
        mov     cx,254
        mov     si,offset PaletteTemp+(2*3)
        mov     di,offset PaletteTemp+(1*3)
        mov     ax,ds
        mov     es,ax
        mov     cx,254*3/2
        rep     movsw           ;rotate PaletteTemp settings
                                ; for attrs 2 through 255 to
                                ; attrs 1 through 254
        pop     bx              ;get back original settings
        pop     ax              ; for attribute 1 and move
        stosw                   ; them to the PaletteTemp
        mov     es:[di],bl      ; location for attribute 255

if WAIT_VSYNC
;Wait for the leading edge of the vertical sync pulse; this ensures
; that we reload the DAC starting during the vertical non-display
; period.
        mov     dx,INPUT_STATUS_1
WaitNotVSync2:                  ;wait to be out of vertical sync
        in      al,dx
        and     al,08h
        jnz     WaitNotVSync2
WaitVSync2:                     ;wait until vertical sync begins
        in      al,dx
        and     al,08h
        jz      WaitVSync2
endif   ;WAIT_VSYNC

if USE_BIOS
;Set the new, rotated palette.
        mov     ax,1012h        ;AH = 10h: set DAC function,
                                ; AL = 12h: set DAC block subfunction
        sub     bx,bx           ;start with DAC location 0
        mov     cx,CYCLE_SIZE   ;# of DAC locations to set
        mov     dx,seg PaletteTemp
        mov     es,dx
        mov     dx,offset PaletteTemp ;point ES:DX to array from which
                                ; to load the DAC
        int     10h             ;load the DAC
else    ;!USE_BIOS
 if GUARD_AGAINST_INTS
        mov     cx,CYCLE_SIZE   ;# of DAC locations to load
        mov     si,offset PaletteTemp ;load the DAC from this array
        sub     ah,ah           ;start with DAC location 0
DACLoadLoop:
        mov     dx,DAC_WRITE_INDEX
        mov     al,ah
        cli
        out     dx,al           ;set the DAC location #
        mov     dx,DAC_DATA
        lodsb
        out     dx,al           ;set the red component
        lodsb
        out     dx,al           ;set the green component
        lodsb
        out     dx,al           ;set the blue component
        sti
        inc     ah
        loop    DACLoadLoop
 else   ;!GUARD_AGAINST_INTS
        mov     dx,DAC_WRITE_INDEX
        sub     al,al
        out     dx,al           ;set the initial DAC location to 0
        mov     si,offset PaletteTemp ;load the DAC from this array
        mov     dx,DAC_DATA
  if NOT_8088
        mov     cx,CYCLE_SIZE*3
        rep     outsb           ;load CYCLE_SIZE DAC locations at once
  else  ;!NOT_8088
        mov     cx,CYCLE_SIZE   ;# of DAC locations to load
DACLoadLoop:
        lodsb
        out     dx,al           ;set the red component
        lodsb
        out     dx,al           ;set the green component
        lodsb
        out     dx,al           ;set the blue component
        loop    DACLoadLoop
  endif ;NOT_8088
 endif  ;GUARD_AGAINST_INTS
endif   ;USE_BIOS

;See if a key has been pressed.
        mov     ah,0bh          ;DOS check standard input status fn
        int     21h
        and     al,al           ;is a key pending?
        jz      CycleLoop       ;no, cycle some more

;Clear the keypress.
        mov     ah,1            ;DOS keyboard input fn
        int     21h

;Restore text mode and done.
        mov     ax,0003h        ;AH = 0: set mode function,
        int     10h             ; AL = 03h: mode # to set
        mov     ah,4ch          ;DOS terminate process fn
        int     21h

        end     start

