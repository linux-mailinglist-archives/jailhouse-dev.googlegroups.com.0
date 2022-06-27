Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9941155BA00
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id z13-20020a056402274d00b004357fcdd51fsf7158521edd.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336563; cv=pass;
        d=google.com; s=arc-20160816;
        b=tHZGarQO3FqsMXRDoUxhOFDNHDzE8BJyWjikfD4l1XYQesWBstKW6XBkNGscSZQ4Tb
         EWTGINTDZ+NBmw/Zr5odWorJSXJy/ij2Nv5Zwg1SA5a8mq1qPDyFtcfcf+uyRniQzq2P
         JZpTBhWeo7h8LBp6od1tgMRAj4yLAyT+29REw5rcd2ml2LcHz7VgMAYOPKgt731TcUpu
         595yWdjeIbkmWcLcFTIdjGt+VLB3CtWy1yJtjIbDb8ebePQTOH4MPMie4i4j6ukn6lG+
         F6hiZf69rUJeVZfxvwCrRQ2yuL2GK54DGRK5aL+d4Xe1jCs8Tyf5GMyl/YZ7mt/V5A8E
         f44A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fIYTe5KEs7XPzib9qtS4RApl5HK3RdOKk8TYIwe+vgg=;
        b=OoXKn1gHqINNVhZ4jpusJwicC5sg+GIg8PM0T8/XY2YEXx/s5aG/r83nIm1flFX4bI
         9aoRknLnQTH0ZEBQFT2s/4Wii8Bsz9fuLmh8LoFnhfZzC0iJP5UdmwvYmZtdSHiLVzvH
         KSZoHJCHzHwfohA7xpv4EXbtNCGx039KngbAF9+t7pUsMjeXu0pVQD1I+d92wG93vppp
         MwjwSdWedBO9pC7sBUlg7f16SJfeNu2eIQe6fkB4m4sdABm0LziX1OpqSzuS+DXN0Swd
         Agwh877DiKhtGaQsCYg5xR3Ikao8slZcNPhCzagvnBfGPKnMDhUtMPapMeSorNZ/pXWl
         5wfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fOE0drX4;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fIYTe5KEs7XPzib9qtS4RApl5HK3RdOKk8TYIwe+vgg=;
        b=ilgCOU5u34jmq5fHD2OT/WVsfFrDzah4z5mRoe6DXXeeYrKas6qYe8miEeNfToF3p8
         ZQCbxVa5yJpAaEadBD1Za3fi5OohA5iJMo6aSR9JvjSCY6VdUVYxtmlbesoEFzOiZJIP
         SOejUfyhKVnevsb1PRT1jyNUGyGGr1nx9Gtxq9aRZ++JR8Ca6v7ybsije13KOczdyrLf
         dFtljMYSA+8MkFVMfdmEdNIyeFRuaEcopOsLoSeMww2N9REj9cTRBMG0le5zUysunYmV
         zhChOSL2gG0RN/Z2aSMhiLbQvV7SegdNjaU2d+WqsP0/4JUW52rTpifA18jqnOVZomvO
         G4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fIYTe5KEs7XPzib9qtS4RApl5HK3RdOKk8TYIwe+vgg=;
        b=oizsvE26NNcSoK5lbc/rGJ9xghA6mM/NED+GpMROw5HZnyP4doAUZ3pVKXo1rMAFv8
         cD53PbTRVo+o1c2e21QY5xiX5ppUl98RY2ti9qeevHvwQADYisZMLO3gQ8F/u3ohGz/d
         9VDXJIqbYenCL/C25pi2yYYuo2gAecQt/b4eFlJuLhzZqn4YzzadmfHxclc1dfrDryYz
         iCfsoP15qeiik98DIYZqPwJQ62/fBzDkTG9zqokcW2iYZa7V52kkcNfotOfyWXiawTmR
         7VM91dRxmSXRCyxCtEs4GYf7Jvx7zmqN7XZiNSQCyjydlROje2XGKQ69/VIKQXlPRSOn
         ZusQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9YK2HL1xhiF3IKZYRSnvqJMUr4NJm9fVDcXvOH2HPn2nFzOzfl
	uipSgckbTkeZ0rltLLZXE7c=
X-Google-Smtp-Source: AGRyM1uzuaAAqeHiK+wjWZyCtwRPqkQ1bd2ZHWX7QFrSqROJmXVTcBFrr1PfMzzyyW0zk8Gn91Pllw==
X-Received: by 2002:a17:907:72d5:b0:722:def3:9160 with SMTP id du21-20020a17090772d500b00722def39160mr12797534ejc.164.1656336563346;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7e9e:b0:726:31a9:49f2 with SMTP id
 qb30-20020a1709077e9e00b0072631a949f2ls4102834ejc.8.gmail; Mon, 27 Jun 2022
 06:29:21 -0700 (PDT)
X-Received: by 2002:a17:906:6545:b0:722:7c99:1ad7 with SMTP id u5-20020a170906654500b007227c991ad7mr12566791ejn.325.1656336561785;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=fk+Yk32sUMvPrPeWqziA5BuxNaAe980PCtV/V9XoZjMik0cDM4YznHW09TUMGHPO8X
         NW/PrFLm+j9gqVFh+aaIvQqpCC9VMLuByYynf8YZzQHIV5+KSV20LDtgixv9JePgktPe
         iIk+RliAf5mZzWs/JRRzqXN0ohuzYTxtKutRtGKU9C+WqLr8EYmavQQ6gugNqbKn4fVG
         vTpFRJa+dr7YWMnI6A9/38UEqipUdjchfBGpOL6U7WEPBT4AXOrGFTtMZKv+AQCFXxWj
         QsGBiD9sf7FbLEdGlussxD1/wlYekPZ7ngPAgxeesRPQ9QbroiLRdFK2xkP9Xdxzitqn
         O21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bDRdHStRSoaKUhswM6zQNcvKj+PyjfZTHru7dnolO1Q=;
        b=w1XKjPOfG99/RUZVLstO5TIXCOzWWqQp8NLQj6Tnjm24yVQV0D9yVEnSO2OnmV3Zyj
         0rndbQmogCmRNxZyXyGkdV5POd5P/T4ozbzjeQ8dfD+bMpRqYAapxL5I153e0Hmxn202
         6HXoAUdstX92Nhw/+WYXmoVlN5fb9CIQwNLVqgAsV27iCNCo07MIgvjS+r1QBMLjpIqp
         Jr3ou0PwyyFdu9Si9v42rAQSy13bdlTiSnA6CPOoZkxR+8cUc4YmvPwyGA4S0JK8Qlgr
         O3yCPlk4geUfBZQjObECDuTabdgtwz9Uhc2Gd+FD4G2yG2eCjZOOtpik1c3pZ3gqrCfP
         rCew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fOE0drX4;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id t1-20020a056402524100b0042d687c85d2si328073edd.0.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV93FxqzxxZ;
	Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:21 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 26/42] core: riscv: implement setup.c
Date: Mon, 27 Jun 2022 15:28:49 +0200
Message-ID: <20220627132905.4338-27-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=fOE0drX4;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

And do some heavy liftig.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/setup.c | 198 ++++++++++++++++++++++++++++++++--
 1 file changed, 190 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 985f27e2..dadffc70 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -2,37 +2,219 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
 #include <jailhouse/entry.h>
-#include <asm/processor.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/percpu.h>
+#include <asm/csr64.h>
 #include <asm/setup.h>
 
+extern unsigned long bt_tbl_l0[PAGE_SIZE / sizeof(unsigned long)];
+
+void riscv_park_loop(void);
+
 int arch_init_early(void)
 {
-	return -ENOSYS;
+	int err;
+
+	err = riscv_paging_cell_init(&root_cell);
+	if (err)
+		return err;
+
+	parking_pt.root_paging = root_cell.arch.mm.root_paging;
+
+	err = paging_create(&parking_pt, paging_hvirt2phys(riscv_park_loop),
+			PAGE_SIZE, 0, PAGE_DEFAULT_FLAGS | RISCV_PTE_FLAG(G) | RISCV_PTE_FLAG(U),
+			PAGING_COHERENT | PAGING_NO_HUGE);
+
+	return 0;
 }
 
 int arch_cpu_init(struct per_cpu *cpu_data)
 {
-	return -ENOSYS;
+	struct public_per_cpu *ppc = &cpu_data->public;
+	unsigned long final_pt;
+
+	spin_init(&ppc->control_lock);
+
+	ppc->reset = false;
+	ppc->park = false;
+	ppc->wait_for_power_on = false;
+
+	ppc->phys_id =
+		jailhouse_cell_cpus(root_cell.config)[cpu_data->public.cpu_id]
+		.phys_id;
+	ppc->hsm.state = STARTED;
+
+	final_pt = paging_hvirt2phys(&ppc->root_table_page);
+	enable_mmu_satp(hv_atp_mode, final_pt);
+
+	return 0;
 }
 
-void __attribute__((noreturn))
-riscv_deactivate_vmm(union registers *regs, int errcode)
+void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 {
-	while (1);
+	union registers *regs;
+	unsigned long tmp;
+
+	regs = &this_cpu_data()->guest_regs;
+
+	/* VSBE = 0 -> VS-Mode mem accesses are LE */
+	csr_write(CSR_HSTATUS,
+		HSTATUS_SPV | /* Return to VS-Mode */
+		(2ULL << HSTATUS_VSXL_SHIFT)); /* xlen = 64 */
+
+	csr_write(CSR_HEDELEG,
+		(1UL << EXC_INST_MISALIGNED) |
+		(1UL << EXC_INST_ACCESS) |
+		(1UL << EXC_INST_ILLEGAL) |
+		(1UL << EXC_BREAKPOINT) |
+		(1UL << EXC_LOAD_ACCESS_MISALIGNED) |
+		(1UL << EXC_LOAD_ACCESS) |
+		(1UL << EXC_AMO_ADDRESS_MISALIGNED) |
+		(1UL << EXC_STORE_ACCESS) |
+		(1UL << EXC_SYSCALL) |
+		(1UL << EXC_INST_PAGE_FAULT) |
+		(1UL << EXC_LOAD_PAGE_FAULT) |
+		(1UL << EXC_STORE_PAGE_FAULT));
+
+	csr_write(CSR_HGEIE, 0);
+	csr_write(CSR_HCOUNTEREN, SCOUNTEREN_TM);
+	csr_write(CSR_HTIMEDELTA, 0);
+
+	tmp = csr_read(sip);
+	csr_write(sip, tmp); /* clear pending */
+	csr_write(CSR_HVIP, tmp); /* reinject pending */
+
+	riscv_paging_vcpu_init(&this_cell()->arch.mm);
+
+	/* Return value */
+	regs->a0 = 0;
+
+	csr_write(sepc, regs->ra); /* We will use sret, so move ra->sepc */
+
+	tmp = csr_swap(sscratch, regs->sp);
+	asm volatile("mv sp, %0\n"
+		     "j vmreturn\n" : : "r"(tmp));
+
+	__builtin_unreachable();
 }
 
-void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
+static unsigned long symbol_offset(const void *addr)
 {
-	while (1);
+	return (unsigned long)addr - (unsigned long)&hypervisor_header;
+}
+
+void __attribute__((noreturn)) riscv_deactivate_vmm(union registers *regs, int errcode)
+{
+	unsigned long linux_tables_offset, bootstrap_table_phys;
+	register union registers *_regs;
+	register int _errcode;
+	u8 atp_mode;
+
+	linux_tables_offset = symbol_offset((void*)hypervisor_header.initial_load_address);
+
+	/* Do not return to VS-mode, rather return to S-Mode */
+	csr_clear(CSR_HSTATUS, HSTATUS_SPV);
+
+	/*
+	 * We don't know which page table is currently active. So in any case,
+	 * just jump back to the bootstrap tables, as they contain the old
+	 * Linux mapping of Jailhouse
+	 */
+	bootstrap_table_phys = system_config->hypervisor_memory.phys_start +
+		symbol_offset(&bt_tbl_l0);
+	/* Take Linux's MMU mode */
+	atp_mode = csr_read(CSR_VSATP) >> ATP_MODE_SHIFT;
+	enable_mmu_satp(atp_mode, bootstrap_table_phys);
+
+	/* next access to regs will be under Linux's old page table, so amend the address */
+	_regs = (void*)regs + linux_tables_offset;
+	_errcode = errcode;
+
+	/* Before switching back, we need to jump to original load location */
+	asm volatile(
+			"add sp, sp, %0\n" /* Get stack under control */
+			"jalr zero, 0(%1)\n" /* Jump to pre-virtual paging location */
+			:
+			: "r"(linux_tables_offset),
+			  "r"(&&linux_tables + linux_tables_offset)
+			:);
+linux_tables:
+	/*
+	 * From now on, we can safely access stack variables, but we must not
+	 * use any absolute addresses
+	 */
+	csr_from_csr(satp, CSR_VSATP);
+	asm volatile("sfence.vma");
+	/* From here on, Linux's paging is active. */
+
+	/* Restore S-mode CSRs from VS-mode */
+	csr_from_csr(stval, CSR_VSTVAL);
+	csr_from_csr(scause, CSR_VSCAUSE);
+	csr_from_csr(sscratch, CSR_VSSCRATCH);
+	csr_from_csr(sie, CSR_VSIE);
+	csr_from_csr(stvec, CSR_VSTVEC);
+	csr_from_csr(sstatus, CSR_VSSTATUS);
+
+	/*
+	 * We came from an ecall, so we may clobber a0-a7. That's just fine, we
+	 * can use them as scratch.
+	 */
+	asm volatile(
+			/* scratch setup */
+			"mv a2, %0\n" /* holds registers */
+			"csrr a1, sepc\n" /* a1 hold return address */
+			"addi a1, a1, 4\n" /* we came from an ecall */
+
+			/* restore original sepc */
+			//"csrr a0, csr_vsepc\n"
+			"csrr a0, %2\n"
+			"csrw sepc, a0\n"
+
+			/* set return code */
+			"mv a0, %1\n"
+
+			/* restore registers */
+			"ld ra, 8(a2)\n"
+			"ld sp, 16(a2)\n"
+			"ld gp, 24(a2)\n"
+			"ld tp, 32(a2)\n"
+			"ld t0, 40(a2)\n"
+			"ld t1, 48(a2)\n"
+			"ld t2, 56(a2)\n"
+			"ld s0, 64(a2)\n"
+			"ld s1, 72(a2)\n"
+			/* Skip clobbers a0 - a7 */
+			"ld s2, 144(a2)\n"
+			"ld s3, 152(a2)\n"
+			"ld s4, 160(a2)\n"
+			"ld s5, 168(a2)\n"
+			"ld s6, 176(a2)\n"
+			"ld s7, 184(a2)\n"
+			"ld s8, 192(a2)\n"
+			"ld s9, 200(a2)\n"
+			"ld s10, 208(a2)\n"
+			"ld s11, 216(a2)\n"
+			"ld t3, 224(a2)\n"
+			"ld t4, 232(a2)\n"
+			"ld t5, 240(a2)\n"
+			"ld t6, 248(a2)\n"
+			/* And we're done. */
+			"jalr zero, a1, 0\n"
+			:: "r"(_regs), "r"(_errcode), "i"(CSR_VSEPC) :);
+
+	__builtin_unreachable();
 }
 
 void arch_cpu_restore(unsigned int cpu_id, int return_code)
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-27-ralf.ramsauer%40oth-regensburg.de.
