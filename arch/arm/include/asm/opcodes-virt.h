/* SPDX-License-Identifier: GPL-2.0 */
#ifndef __ASM_ARM_OPCODES_VIRT_H
#define __ASM_ARM_OPCODES_VIRT_H

#define __HVC(imm)	.inst	0xe1400070 | ((imm) & 0xFFFF)
#define __ERET		.inst	0xe160006e

#endif /* __ASM_ARM_OPCODES_VIRT_H */
