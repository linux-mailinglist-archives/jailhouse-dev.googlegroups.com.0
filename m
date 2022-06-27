Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMPB42KQMGQEZVSHWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FD55B9F6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id t13-20020adfe10d000000b0021bae3def1esf1188480wrz.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sn9yUqRHnQLrERM7ZMGMEsar6hFg4R0z/z8MrGUjPE/F8q5GYXcs1WZ0+ZCEi6Dcgc
         79U9eRZVn3bEmR80sYPpLiFC8+HHLuLa0DRyXTVpyXy1paBKxomMGLboKFQIc6M7AOt4
         Aq8P5aPAYO5R+P1bJlGbHQLb8XYJCiGAy5nRjDMLPnmWc76DKA8M/9YmJY9Wavacd6Dt
         /IRpGy05+d5mCXInGEtvGA7qWrpaKiteZRZv0JD6j+OlVsINLKQyQHWYPN30lsWd2tTO
         zU+ah1EZ2WF3Z4OfSeZqJJDTy0K2DAsJCxDe2gdK5mg5TH3yPBXfaBF9RZGFVbfd0iym
         o7EQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=eLqQb9ARvUFeoRa/h6gttKetDAPjeu37/6tWdkTQnk8=;
        b=b/b4DuxACFFuThEjVw2Bvgus9iPF1u3aFPPpb0VG4+0VbNplCDGtYkqMYqyXJ/AIQw
         PpeZMq6056BiAsHPHNa1ybc49SGDnDscgMXlh3YEhQN/t5VHZBaNNJ2g1icXNTjOfrV/
         fdErCdTRvoaYt2ZiWeQudK35XkM+rR/jwF3mO3P4G9PnZjetpsl03O4AB0wxmVALS2F7
         Shhn2m4xL51mZXDDdwWFjnBPDnl0gJQiBtcDRbemiM9TrmXMDMQMntWi5RHWhTUxeqOD
         nSnvLDx3XSubFf2LFbgbDrHUDUzrGZ9pQ+ExnU3ms0M0Zo8kA+8pB4D9HMt5K5QOvsOu
         jalg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sXzhYkaD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eLqQb9ARvUFeoRa/h6gttKetDAPjeu37/6tWdkTQnk8=;
        b=aOoUxAai3RYh2LQTR2uDvBRrgM7X1ByeV3p/LX4mjac403+B1JFnojdI57qwM6VxPT
         syuqFPwg9GsY7dyxzXz1EcU8k3cRz4cCdrIyjNG93onkUtGn97LZzdfaxBFnz/wSqlS6
         rfAEZykClNU124Vq7KcjXx6Z2dXvsMQ69T4cVBDwdnLzzvmOSf2YPr0Ek7YJy4fAiqpm
         vRvrHNtOCkTOI5fVLqQWH6OUwvlBRPgBQ/ukHph+CNp6/21XEgjjIfXevUxKKZ0TFEzv
         352N4eZHJTBMOEqQQUS795yGSD8tO8q9j2R3+uU4AireRztfXQHjiS1ASiHqkuPqiTkV
         nCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eLqQb9ARvUFeoRa/h6gttKetDAPjeu37/6tWdkTQnk8=;
        b=6y9VKsQLJrFzoMxjUTDyDJw7vZcV+Z71GP9sD2PLBUdjbbCkn/2CkOXnrlwil4WVZI
         W0qmPUQknx3jKSy9dauu5C+wi1WyL6bXOZLf5zrXjY17+8wFkVNiYMTyAf7Xd4O60rU2
         x+7v1D9LKjN7T0KCd627MM53TH3j2huoT+1ed12A4X+MmIX75OkG2zfgqh0eNVGFbuhX
         bGt90KSHtIzA73ezZYPBb2rDEG/jAY8aAevF5BnEDA6pzxz11oT5EkP+BtS/UcDYARXX
         t/nv28rfBXaqK+/c9GKNxqVncSoxUBcohr/ZWpNCM7jtsJAe2VT46MMfUn0P4SQmG3Im
         3ILQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9cr4M738ZOjWFz6A88omnyRFmJMZ/dfk9w/jCWtmFX+YcIuJZJ
	TuqUyzb8O5PKpuKEyI+yU8U=
X-Google-Smtp-Source: AGRyM1sGqSht2fjPmOmilSgXa3DZt0ErdTWDtICCZpLx8TLUA4vAlyl5ZYkk/N0tGKgFBF7IwekijA==
X-Received: by 2002:a05:6000:1a8b:b0:219:ad61:f4e3 with SMTP id f11-20020a0560001a8b00b00219ad61f4e3mr13420384wry.190.1656336561949;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1887:b0:218:5c3b:1a23 with SMTP id
 a7-20020a056000188700b002185c3b1a23ls5783514wri.0.gmail; Mon, 27 Jun 2022
 06:29:20 -0700 (PDT)
X-Received: by 2002:adf:f751:0:b0:21a:3ab8:1991 with SMTP id z17-20020adff751000000b0021a3ab81991mr12994882wrp.711.1656336560443;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336560; cv=none;
        d=google.com; s=arc-20160816;
        b=dJZVQTSNUBwV3otunn/rD5UL7D3QifmL+Zq9IY5KE5IjaJdC2/dbZoauVGTgchbVVc
         i9aA3lbhFYL+p+mXdmQ+cHnyvZ2Ws4kvqoKddsBcjUa0xQbtZsZLVJ1ghrNTPhNRCoH5
         pERLnOy4nGtl/IUDz+HjsgafLPn9rLdEC4RmKG17ssBXPKHkkKazDuphXdN8gE6H1Ztr
         N5ZK66ws8K9PNo69/QvCXk7tBNF08o4DaBI4Zu/O5f59koRsuP/6qC0QTLusKubsc8yC
         MOyQwTvcrVakIdKdqf1F8yUCnw4q96wpmHLX1tuvJ82uN+OdBjZ0Jp53vVzDGSJHR8jI
         u7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4Vad+nkvOJQq+AliYoQhnkt0MhBRroIzvAHjGs3ntbQ=;
        b=etiPD3fhxGMdPnZNQW/tmbFjGXadWtYGPzr7SPmq8jQIRyPqlT57gANiIhtvuKLaaf
         VdvN2zVo1JkI2sm4m0+0/qME4LiPz5ais1mk8v871ELxZZJ/W+SNqHY99kcC43idQ0bb
         V8sSX3HrVmZ5x4jswiJ+QxKuPyKXqBjAS6oS9Qj/ACW8+Sj1tBDGg1pmeO8VrkBd2CcA
         Bmgh1aDjQu61ktBM9oS6CwC1ZQMrpvkpC+NxZrT0iUMWzOz81MuzUSMu/Lrw3Fnv7Z2M
         /6bNcOk5SHARv44BYcPgfctcUKmcCDdSgReX0hCZmrNOVpG+16pcw71l0xz+ip8jJoli
         2x/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sXzhYkaD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id m7-20020adffa07000000b0021a07a20517si344481wrr.7.2022.06.27.06.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV818WmzxxZ;
	Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:19 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 19/42] core: riscv: Hypervisor entry code
Date: Mon, 27 Jun 2022 15:28:42 +0200
Message-ID: <20220627132905.4338-20-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sXzhYkaD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

Now we have to think of Jailhouse's memory layout.

RISC-V has a bunch of MMU variants SVxx (SV39, SV48, SV57), while xx
denotes the number of virtually adressable bits. And there's an
exceptional case: If bit xx-1 is set in a vaddr, then all bits >= XX
must be 1.

For the virtual HV location, we need a virtual address that is valid for
each MMU type. Let's virtually place the hypervisor at the topmost 16
MiB of a SV39. This results in address 0xffff_ffd0_0000_0000.

On RISC-V, Linux could map the hypervisor to any virtual location, so we
need to setup bootstrap page tables that help us to jump to our link
location. Now this gets funny, as we need to support ALL MMU types for
the trampoline, as Linux might map us to a very high address.

The position-independent startup/trampoline code sets up a trampoline
that consists of two entries:
  - Virtual Linux Load Location -> physical HV memory
  - 0xffff_ffd0_0000_0000       -> physical HV memory

The startup code will create and activate this table, and jump to the
destination address where it was linked. From now on, we can use
position-dependant code.

Later, those trampoline page tables will not be destroyed, as we can
reuse them when disabling the hypervisor, or when errors occur during
startup.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild                  |   3 +-
 hypervisor/arch/riscv/entry.S                 | 349 +++++++++++++++++-
 hypervisor/arch/riscv/exception.S             |  91 +++++
 .../arch/riscv/include/asm/jailhouse_header.h |  24 +-
 hypervisor/arch/riscv/include/asm/setup.h     |  14 +
 hypervisor/arch/riscv/setup.c                 |  10 +-
 6 files changed, 481 insertions(+), 10 deletions(-)
 create mode 100644 hypervisor/arch/riscv/exception.S
 create mode 100644 hypervisor/arch/riscv/include/asm/setup.h

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 4213194f..7809007c 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,4 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o traps.o lib.o
+lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o paging.o
+lib-y += pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/entry.S b/hypervisor/arch/riscv/entry.S
index def55516..524270cf 100644
--- a/hypervisor/arch/riscv/entry.S
+++ b/hypervisor/arch/riscv/entry.S
@@ -2,16 +2,355 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-	.text
-	.globl arch_entry
+#include <asm/asm-defines.h>
+#include <asm/csr64.h>
+#include <asm/paging.h>
+
+#define SSTATUS_INITIAL (SR_SPIE | SR_SPP | SR_FS_DIRTY | \
+			 SR_VS_DIRTY | SR_XS_DIRTY | SR_UXL_64)
+
+#define PAGING_FLAGS_NEXT_LEVEL	RISCV_PTE_FLAG(G) | RISCV_PTE_FLAG(V)
+#define PAGING_FLAGS_BOOTSTRAP	PAGE_DEFAULT_FLAGS | RISCV_PTE_FLAG(G)
+
+/*
+ * hideleg needs to be set early, otherwise vsip/vsie are forced to 0. Bits set
+ * here causes aliasing of VSIP/HIP and VSIE/HIE
+ */
+#define INITIAL_HIDELEG \
+	((IE_SIE << VSIP_TO_HVIP_SHIFT) | \
+	(IE_TIE << VSIP_TO_HVIP_SHIFT) | \
+	(IE_EIE << VSIP_TO_HVIP_SHIFT))
+
+#define INITIAL_SIE (IE_SIE | IE_TIE | IE_EIE)
+
+.macro csr_from_csr vsreg, sreg, t
+	csrr	\t, \sreg
+	csrw	\vsreg, \t
+.endm
+
+.macro load_csr	csr, temp, value
+	li	\temp, \value
+	csrw	\csr, \temp
+.endm
+
+.macro access_config op, reg, offset
+	\op	\reg, \offset (t4)
+.endm
+
+.macro ld_constant reg, constant
+	ld	\reg, %lo (pool_\constant - constant_pool) (t6)
+.endm
+
+.macro bootstrap_page macro
+	.irp page,\
+		bt_tbl_l0,\
+		bt_tbl_l1_0,\
+		bt_tbl_l2_0,\
+		bt_tbl_l3_0,\
+		bt_tbl_l1_1,\
+		bt_tbl_l2_1,\
+		bt_tbl_l3_1
+	\macro	\page
+	.endr
+.endm
+.globl bt_tbl_l0
+
+.macro define_page page
+	.p2align RISCV_PAGE_WIDTH
+	\page:
+	.skip (1 << RISCV_PAGE_WIDTH)
+.endm
+
+.macro pool_constant symbol
+	.p2align 3
+	pool_\symbol:
+	.8byte	\symbol
+.endm
+
+/*
+ * level: 0 for 4 KiB leaves
+ * virt: virtual address to map
+ * pte: pte contents: phys addr for leaves, sub node otherwise; clobbered
+ * table: node to write pte to
+ * temp: clobberable register
+ * flags: PTE flag bits
+ */
+.macro riscv_pt_write_pte level, virt, pte, table, temp, flags
+	ori	\pte, \pte, \flags
+	/* RISC-V uses 12-bit _signed_ immediates, so extracting the
+	 * least-significant 12 bits can't be done in a single instruction of
+	 * the base ABI
+	 */
+	srli	\temp, \virt,\
+			(RISCV_PAGE_WIDTH + (\level) * RISCV_PTES_PER_NODE)
+	andi	\temp, \temp, 1 << (RISCV_PAGE_WIDTH - RISCV_PTE_SIZE) - 1
+	slli	\temp, \temp, RISCV_PTE_SIZE
+	add	\temp, \temp, \table
+	sd	\pte, 0 (\temp)
+.endm
+
+.macro riscv_pt_write_address level, virt, addr, table, temp, flags
+	srli	\addr, \addr, 2
+	riscv_pt_write_pte	\level, \virt, \addr, \table, \temp, \flags
+.endm
+
+.macro write_table lvl, table, dst, flags
+	la	t0, \table
+	ld_constant	t3, \dst
+	add	t4, a2, t3
+	riscv_pt_write_address   \lvl, t2, t4, t0, t5, \flags
+.endm
+
+.macro sv57_map_2M l0, l1, l2, l3, phys
+	write_table	4, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	3, \l1, \l2, PAGING_FLAGS_NEXT_LEVEL
+	write_table	2, \l2, \l3, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l3, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+.macro sv48_map_2M l0, l1, l2, phys
+	write_table	3, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	2, \l1, \l2, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l2, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+.macro sv39_map_2M l0, l1, phys
+	write_table	2, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l1, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+/* place large constants into here */
+.section .rodata
+pool_constant	virtual_arch_entry
+bootstrap_page	pool_constant
+
+.p2align 3
+constant_pool:
+.p2align 3
+pool_jailhouse_base:
+	.8byte	JAILHOUSE_BASE
+
+.section .data
+	bootstrap_page	define_page
+	.purgem	define_page
+
+.text
+.globl arch_entry
 arch_entry:
-	li	a0,-55
-	ret
+	/*
+	 * a0: cpuid
+	 * t5: hypervisor_header
+	 * t6: __page_pool
+	 */
+	la	t5, hypervisor_header
+	la	t6, __page_pool
+
+	/*
+	 * t1: max_cpus
+	 * t2: sizeof(struct per_cpu)
+	 * Note: this would also be available directly: sizeof$struct$per_cpu
+	 */
+	lw		t1, HEADER_MAX_CPUS (t5)
+	lw		t2, HEADER_PERCPU_SIZE (t5)
+
+	/* t4: configuration area */
+	mul	t2, t2, t1
+	add	t4, t2, t6
+
+	/* t6: constant_pool */
+	la	t6, constant_pool
+
+	/*
+	 * these pages are used during the initialization phase currently, they
+	 * are not reclaimed afterwards. Create a "bootstrap" paging table
+	 * that maps the the hypervisor image to the logical/physical addresses
+	 * it was linked and also where it was currently linked.
+	 *
+	 * In case of any MMU variant, we always need to map 2M-Pages.
+	 * Depending on the MMU variant, this may require different 'n' levels
+	 * of page tables.
+	 *   SV39: 2 levels
+	 *   SV48: 3 levels
+	 *   SV57: 4 levels
+	 *
+	 * We always require one root table, and then (n-1)*2 subtables.
+	 *   SV39: 1+1*2 = 3 pages
+	 *   SV48: 1+2*2 = 5 pages
+	 *   SV57: 1+3*2 = 7 pages
+	 *
+	 * The problem is the location of those page tables. For the worst
+	 * case, SV57, which we need to prepare for, we would need to reserve 7
+	 * pages somewhere. If we then land on a SV39 system, we waste 4 pages
+	 * (16KiB).
+	 *
+	 * So for the moment, simply always statically allocate 7 pages that
+	 * are dedicated for the bootstrap page tables. We can't reclaim
+	 * memory, as we need those bootstrap tables for the rollback
+	 * trampoline, when disabling the hypervisor.
+	 *
+	 * An alternative I could think of is to allocate those pages at the
+	 * very end of hypervisor_mem. We could fill pages, and mark those
+	 * pages as used during arch_paging_init. This way, we wouldn't waste
+	 * any memory, but it's more complex. For the moment, let's implement
+	 * the simple variant, and allocate 7 pages.
+	 *
+	 * Just some further notes:
+	 * If Linux chose to select, for example, SV48, the the bootstrap
+	 * tables MUST also select SV48. This is, because there's a 99% chance
+	 * that Linux chose an address to remap Jailhouse that is only
+	 * adressable with a SV48. Hence, the trampolin page tables must also
+	 * be at least SV48. Later, when setting up the final tables, we could
+	 * switch down to SV39. This is recommendable, as it requires less page
+	 * table lookups.
+	 *
+	 * t0: Lx VA bootstrap_table_l0
+	 * t3: JH VA of bootstrap_table_hypervisor_l1
+	 */
+	ld_constant	t2, jailhouse_base
+	/* a3: jailhouse_memory.phys_start */
+	access_config	ld, a3, CFG_PHYS_START
+	/* a2: virt_to_phys; phys = virt_to_phys + virt */
+	sub	a2, a3, t2
+
+	/* Get MMU-Variant that Linux currently uses */
+	csrr	a4, satp
+	srli	a4, a4, ATP_MODE_SHIFT
+	/* And choose the same variant for the bootstrap tables */
+	li	t2, ATP_MODE_SV39
+	beq	a4, t2, sv39
+	li	t2, ATP_MODE_SV48
+	beq	a4, t2, sv48
+	li	t2, ATP_MODE_SV57
+	beq	a4, t2, sv57
+
+	/* Unknown MMU type if we reach that */
+1:	wfi
+	j	1b
+
+	/* virt must be held in t2 */
+sv39:
+	ld_constant	t2, jailhouse_base
+	sv39_map_2M	bt_tbl_l0, bt_tbl_l1_0, jailhouse_base
+	la		t2, arch_entry
+	sv39_map_2M	bt_tbl_l0, bt_tbl_l1_1, jailhouse_base
+
+	li	t0,	ATP_MODE_SV39
+	j	setup_satp
+
+sv48:
+	ld_constant	t2, jailhouse_base
+	sv48_map_2M	bt_tbl_l0, bt_tbl_l1_0, bt_tbl_l2_0, jailhouse_base
+	la		t2, arch_entry
+	sv48_map_2M	bt_tbl_l0, bt_tbl_l1_1, bt_tbl_l2_1, jailhouse_base
+
+	li	t0,	ATP_MODE_SV48
+	j	setup_satp
+
+sv57:
+	ld_constant	t2, jailhouse_base
+	sv57_map_2M	bt_tbl_l0, bt_tbl_l1_0, bt_tbl_l2_0, bt_tbl_l3_0, \
+			jailhouse_base
+	la		t2, arch_entry
+	sv57_map_2M	bt_tbl_l0, bt_tbl_l1_1, bt_tbl_l2_1, bt_tbl_l3_1, \
+			jailhouse_base
+
+	li	t0,	ATP_MODE_SV57
+	j	setup_satp
+
+setup_satp:
+	ld_constant	a3, bt_tbl_l0
+	add	a3, a2, a3
+	srli	a3, a3, RISCV_PAGE_WIDTH
+	slli	t0, t0, ATP_MODE_SHIFT
+	or	a3, a3, t0
+
+	sfence.vma	zero, zero
+	csrrw	a4, satp, a3
+	csrw	CSR_VSATP, a4
+
+	ld_constant	t1, virtual_arch_entry
+	/* leave pos independant code with this jump */
+	jalr	t0, t1, 0
+
+	# a0 ... cpuid
+	# a2 ... physical - virtual address offset
+	# a3 ... bootstrap satp
+	# a4 ... linux page table root	(currently unused)
+	# ra ... linux return address
+	# t0 ... return address for call from arch_entry
+virtual_arch_entry:
+	# set up stack pointer -- this is hart-dependent
+
+	# percpu data = pool + cpuid * percpu_size
+	la	t1, __page_pool
+
+	la	t6, hypervisor_header
+	lw	t2, HEADER_PERCPU_SIZE (t6)
+
+	mul	t2, t2, a0
+	add	a1, t2, t1
+	# a1 ... percpu data
+
+	mv	t6, sp	# need to restore this later
+
+	li	t1, PCPU_GUEST_REGS
+	add	sp, a1, t1
+
+	sd	t6, REG_SP (sp)
+	sd	ra, REG_RA (sp)
+	sd	t0, REG_T0 (sp)
+	sd	gp, REG_GP (sp)
+	sd	tp, REG_TP (sp)
+	sd	s0, REG_S0 (sp)
+	sd	s1, REG_S1 (sp)
+	sd	s2, REG_S2 (sp)
+	sd	s3, REG_S3 (sp)
+	sd	s4, REG_S4 (sp)
+	sd	s5, REG_S5 (sp)
+	sd	s6, REG_S6 (sp)
+	sd	s7, REG_S7 (sp)
+	sd	s8, REG_S8 (sp)
+	sd	s9, REG_S9 (sp)
+	sd	s10, REG_S10 (sp)
+	sd	s11, REG_S11 (sp)
+	# fp is s0 -> fp is restored
+
+	# vsstatus receives value of sstatus
+	csr_from_csr	CSR_VSSTATUS, sstatus, t1
+
+	li	t1, SSTATUS_INITIAL
+	csrw	sstatus, t1
+
+	load_csr	CSR_HIDELEG, t1, INITIAL_HIDELEG
+
+	csr_from_csr	CSR_VSIE, sie, t1
+
+	load_csr	sie, t1, INITIAL_SIE
+
+
+	csr_from_csr	CSR_VSCAUSE, scause, t1
+	csr_from_csr	CSR_VSTVAL, stval, t1
+
+	csr_from_csr	CSR_VSSCRATCH, sscratch, t1
+	csrw	sscratch, sp
+
+	csr_from_csr	CSR_VSTVEC, stvec, t1
+	la	t1, nested_exception_handler
+	csrw	stvec, t1
+
+	jal	ra, entry
+	/* return from entry means an error occurred */
+
+	mv	a1, a0
+	mv	a0, sp
+	j	riscv_deactivate_vmm
diff --git a/hypervisor/arch/riscv/exception.S b/hypervisor/arch/riscv/exception.S
new file mode 100644
index 00000000..0c623602
--- /dev/null
+++ b/hypervisor/arch/riscv/exception.S
@@ -0,0 +1,91 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/asm-defines.h>
+
+.macro  load_csr        csr, temp, value
+	li      \temp, \value
+	csrw    \csr, \temp
+.endm
+
+.macro context_save_all cmd
+	.irp reg 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, \
+		 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+		\cmd    x\reg, 8*(\reg)(sp)
+	.endr
+.endm
+
+/*
+ * This entry point is used when the hypervisor has been entered already. The
+ * existing stack is reused.
+ */
+.align 4
+.globl nested_exception_handler
+nested_exception_handler:
+	/*
+	 * We reuse the old S-Mode stack, so make some place for union
+	 * registers. We must not acces this_cpu()-related stuff, as this will
+	 * point to the old register set. But it's not necessary, as nested
+	 * exception only occur in rare situations, and only one of them (hlvx)
+	 * is recoverable. Performance isn't an optimisation criteria, as a
+	 * nested exception of hlvx will lead to a crash of the cell in any
+	 * case.
+	 */
+	addi	sp, sp, -REGISTERS_SIZE
+	context_save_all sd
+	mv	a0, sp
+	addi	a0, a0, REGISTERS_SIZE
+	sd	a0, REG_SP (sp)
+	addi	a0, a0, -REGISTERS_SIZE
+
+	jal	arch_handle_fault
+
+	context_save_all	ld
+	addi	sp, sp, REGISTERS_SIZE
+	sret
+
+/*
+ * This entry point is used when the guest is running.  A new stack needs to be
+ * established (and is taken from sscratch).
+ */
+.align 4
+.globl exception_handler
+exception_handler:
+	csrrw	sp, sscratch, sp
+	context_save_all sd
+
+	csrr	t1, sscratch
+	sd	t1, REG_SP (sp)
+
+	la	a0, nested_exception_handler
+	csrw	stvec, a0
+
+	mv	a0, sp
+	jal	arch_handle_trap
+
+.globl vmreturn
+vmreturn:
+	la	a0, exception_handler
+	csrw	stvec, a0
+
+	context_save_all ld
+	csrrw	sp, sscratch, sp
+	sret
+
+.p2align	12
+.globl riscv_park_loop
+riscv_park_loop:
+	wfi
+	j riscv_park_loop
+.p2align 12
diff --git a/hypervisor/arch/riscv/include/asm/jailhouse_header.h b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
index a0c22083..c4e1c24c 100644
--- a/hypervisor/arch/riscv/include/asm/jailhouse_header.h
+++ b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
@@ -4,11 +4,29 @@
  * Copyright (C) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#define JAILHOUSE_BASE			__JH_CONST_UL(0xffffffdfff000000)
-#define JAILHOUSE_BORROW_ROOT_PT	1
+/*
+ * RISC-V defined architectural constraints on the address space:
+ * Address immediates are sign extended.
+ *
+ * lui+jalr can jump to absolute addresses +-2 GiB around zero
+ *  --> this best left free for millicode routines (or boot ROM),
+ *      at least on 64-bit machines.
+ *      This is the range 0xffff_ffff_8000_000--0x0000_0000_7fff_ffff
+ *
+ * Legal virtual addresses are sign extensions of the most-significant bit
+ * mapped by the virtual addressing mode; e.g., in Sv39, bits 63:39 of an
+ * address must be a copy of bit 38. Hence, the lowest (signed) address
+ * available is 0xffff_ffc0_0000_0000.
+ *
+ * Linux normally maps itself at 0xffff_ffe0_0000_0000 and modules at
+ * 0xffff_ffd0_0000_0000.
+ */
+
+/* this provides 16 MB of space for the Jailhouse core */
+#define JAILHOUSE_BASE			0xffffffdfff000000
diff --git a/hypervisor/arch/riscv/include/asm/setup.h b/hypervisor/arch/riscv/include/asm/setup.h
new file mode 100644
index 00000000..a5b6f564
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/setup.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode);
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 53cdce80..985f27e2 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -4,13 +4,15 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
 #include <jailhouse/entry.h>
+#include <asm/processor.h>
+#include <asm/setup.h>
 
 int arch_init_early(void)
 {
@@ -22,6 +24,12 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 	return -ENOSYS;
 }
 
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode)
+{
+	while (1);
+}
+
 void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
 {
 	while (1);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-20-ralf.ramsauer%40oth-regensburg.de.
