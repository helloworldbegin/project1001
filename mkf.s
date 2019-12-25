	.text
	.file	"mkf.i"
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   // @main
// BB#0:
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 8-byte Folded Spill
	add	x29, sp, #48            // =48
	adrp	x8, .L.str
	add	x8, x8, :lo12:.L.str
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x1, [x29, #-16]
	ldr	x0, [x1, #8]
	mov	 x1, x8
	bl	fopen
	str	x0, [sp, #24]
	ldr	x8, [sp, #24]
	cbnz	x8, .LBB0_2
// BB#1:
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	adrp	x30, .L.str.2
	add	x1, x30, :lo12:.L.str.2
	ldur	x30, [x29, #-16]
	ldr	x30, [x30, #8]
	str	w0, [sp, #16]           // 4-byte Folded Spill
	mov	 x0, x30
	bl	fopen
	str	x0, [sp, #24]
	b	.LBB0_3
.LBB0_2:
	ldr	x0, [sp, #24]
	bl	fclose
	adrp	x30, .L.str.3
	add	x30, x30, :lo12:.L.str.3
	str	w0, [sp, #12]           // 4-byte Folded Spill
	mov	 x0, x30
	bl	printf
	adrp	x30, .L.str.4
	add	x1, x30, :lo12:.L.str.4
	ldur	x30, [x29, #-16]
	ldr	x30, [x30, #8]
	str	w0, [sp, #8]            // 4-byte Folded Spill
	mov	 x0, x30
	bl	fopen
	str	x0, [sp, #24]
.LBB0_3:
	ldr	x0, [sp, #24]
	bl	fgetc
	str	w0, [sp, #20]
.LBB0_4:                                // =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	cmn		w8, #1          // =1
	b.eq	.LBB0_6
// BB#5:                                //   in Loop: Header=BB0_4 Depth=1
	ldr	w0, [sp, #20]
	bl	putchar
	ldr	x30, [sp, #24]
	str	w0, [sp, #4]            // 4-byte Folded Spill
	mov	 x0, x30
	bl	fgetc
	str	w0, [sp, #20]
	b	.LBB0_4
.LBB0_6:
	ldr	x0, [sp, #24]
	bl	fclose
	mov	 w8, wzr
	str		w0, [sp]        // 4-byte Folded Spill
	mov	 w0, w8
	ldp	x29, x30, [sp, #48]     // 8-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main

	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"r"
	.size	.L.str, 2

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"New file will be created\n"
	.size	.L.str.1, 26

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"w+"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"Opening file\n"
	.size	.L.str.3, 14

	.type	.L.str.4,@object        // @.str.4
.L.str.4:
	.asciz	"r+"
	.size	.L.str.4, 3


	.ident	"clang version 4.0.0 (tags/RELEASE_400/final)"
	.section	".note.GNU-stack","",@progbits
