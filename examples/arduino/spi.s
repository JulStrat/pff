	.file "spi.pas"
# Begin asmlist al_procedures

.section .text.n_spi_ss_spi_init_master,"ax"
.globl	SPI_ss_SPI_INIT_MASTER
SPI_ss_SPI_INIT_MASTER:
.Lc2:
# [spi.pas]
# [22] begin
# [24] DDRB := DDRB or ((1 shl 2) or (1 shl 3) or (1 shl 5));
	in	r18,4
	ori	r18,44
	out	4,r18
# [25] SPCR := (1 shl SPE) or (1 shl MSTR);
	ldi	r18,80
	out	44,r18
# [26] end;
	ret
.Lc1:
.Le0:
	.size	SPI_ss_SPI_INIT_MASTER, .Le0 - SPI_ss_SPI_INIT_MASTER

.section .text.n_spi_ss_spi_transceiversbytessbyte,"ax"
.globl	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE:
.Lc4:
# Var $result located in register r18
# Var d located in register r24
# [29] begin
# Var d located in register r24
# [30] SPDR := d;
	out	46,r24
.Lj7:
# [31] while (SPSR and (1 shl SPIF)) = 0 do ;
	in	r18,45
	andi	r18,-128
	breq	.Lj7
# Var $result located in register r24
# [32] Result := SPDR;
	in	r24,46
# [33] end;
	ret
.Lc3:
.Le1:
	.size	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE, .Le1 - SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# End asmlist al_procedures
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc5:
	.long	.Lc7-.Lc6
.Lc6:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	24
	.byte	12
	.uleb128	13
	.uleb128	1
	.byte	5
	.uleb128	24
	.uleb128	0
	.balign 4,0
.Lc7:
	.long	.Lc9-.Lc8
.Lc8:
	.short	.Lc5
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc9:
	.long	.Lc12-.Lc11
.Lc11:
	.short	.Lc5
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc12:
# End asmlist al_dwarf_frame

