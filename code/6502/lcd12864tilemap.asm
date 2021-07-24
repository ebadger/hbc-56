!to "lcd12864tilemap.o", plain

!source "hbc56.asm"

LCD_BUFFER_ADDR = $0200
LCD_MODEL = 12864
!source "gfx/bitmap.asm"
!source "lcd/lcd.asm"
!source "ut/memory.asm"

!align 255, 0
c64FontData:
	!bin "c64-font-ascii.bin"

!source "gfx/tilemap.asm"




main:

	jsr lcdInit
	jsr lcdHome
	jsr lcdClear
	jsr lcdGraphicsMode

	+tilemapCreateDefault (TILEMAP_SIZE_X_16 | TILEMAP_SIZE_Y_8), c64FontData

start:

        ldy #0
        lda #32
        clc

-
        tya
        clc
        adc #32
        sta (TILEMAP_TMP_BUFFER_ADDR), y
        iny
        cpy #128
        bne -

        jsr tilemapRender


jmp start

medDelay:
	jsr delay
	jsr delay


delay:
	ldx #255
	ldy #255
.loop:
	dex
	bne .loop 
	ldx #255
	dey
	bne .loop
	rts
