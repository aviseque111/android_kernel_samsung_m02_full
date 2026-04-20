/* SPDX-License-Identifier: GPL-2.0 */
#ifndef __ASM_ASSEMBLER_H__
#define __ASM_ASSEMBLER_H__

#include <asm/asm-offsets.h>
#include <asm/opcodes-virt.h>
#include <asm/thread_info.h>

.macro	disable_irq_notrace
	cpsid	i
.endm

.macro	enable_irq_notrace
	cpsie	i
.endm

#endif /* __ASM_ASSEMBLER_H__ */
