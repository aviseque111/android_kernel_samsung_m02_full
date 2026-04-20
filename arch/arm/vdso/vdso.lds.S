/* SPDX-License-Identifier: GPL-2.0 */
#include <asm-generic/vmlinux.lds.h>
#include <asm/page.h>

OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)

SECTIONS
{
	. = VDSO_LBASE + SIZEOF_HEADERS;
	.hash		: { *(.hash) }			:text
	.gnu.hash	: { *(.gnu.hash) }
	.dynsym		: { *(.dynsym) }
	.dynstr		: { *(.dynstr) }
	.gnu.version	: { *(.gnu.version) }
	.gnu.version_d	: { *(.gnu.version_d) }
	.gnu.version_r	: { *(.gnu.version_r) }
	.note		: { *(.note.*) }		:text	:note
	.dynamic	: { *(.dynamic) }		:text	:dynamic
	.rodata		: { *(.rodata*) }		:text
	.text		: { *(.text*) }			:text	:text
	.data		: { *(.data*) }
	.got		: { *(.got) }
	.got.plt	: { *(.got.plt) }
	. = ALIGN(4);
	__bss_start = .;
	.bss		: { *(.bss) }
	. = ALIGN(4);
	__bss_end = .;
	/DISCARD/	: { *(.note.GNU-stack) *(.gnu_debuglink) }
}
