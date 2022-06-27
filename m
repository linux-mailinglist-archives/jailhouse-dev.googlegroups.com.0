Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM7B42KQMGQE2J3YK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EC55BA02
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:24 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id n8-20020a05640205c800b00434fb0c150csf7086650edx.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336564; cv=pass;
        d=google.com; s=arc-20160816;
        b=KSHfM1oIkwAMsYeeAbAh98ds42OGjv+GE6heUEEIOAO5sSKk65W4sMhuHev8xgItve
         UO3VcBATl6J9Cz+2yT5M3n3cC753FGLWqed/eNIKAjtpdaKvV79DehZF5+Y/VjfdOTcd
         yCPHeHpRq1U/oJQwzkujwl/SOGDUP45a2drrxVux8UlbUdqAgk6Kz9C+WLoOja/8ixpM
         yW4mnUHpAnBtvPO4kLQdzh4pD0YIxJYymrPHw1foLOyf16vtFI+7dvVIW//jgJd8eamX
         vZUCfpXM0r/bmTuO8doHBwFQtCW34sNupUDpwCusCFxJVazVMgTkD/N53G2y2WGxb4pv
         IHpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=aOjKbRUsroHWSuojydrwirbtanEYuqPAFQFZcuFhiIQ=;
        b=m8NUC/0eH9LuOLWj92alZW6zlexGd/Ekw1s0jIczFtn3Is4UKQLf1y2FNN4Sf9TEBr
         1Qw80s86ZEElNvHkGwO6FaDeRyvhqWeKUwkBl0MnUT2vYbqf5ta2xnVY4BiWcSZfjNYV
         /2jKnvFa6fjGR2Ogp5eJ5fwZkZPlKiMsukvFi7eHIbkRCC0beeUC1mW4dTwz8Num3fYn
         orx5hPluS1DePpxrahXSw+PD2Z+Om7CZ8YQpnwlXDqkQRJqKJyhvAtuKeajPhr7N7cWV
         tzarbVVvtYj/rndoEULZY9OqJkOYGW9uXWKScu5N0AEHuopP9hTvkqbPTJPSJ3f/8oqi
         hbAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=o1q420Ni;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aOjKbRUsroHWSuojydrwirbtanEYuqPAFQFZcuFhiIQ=;
        b=LyM+5iz5ahoEcmp4dZYLMaTTo0Gr9ZBdeQFBoLfdzPZySHkBBSzcaPfI66KutIjn5R
         yDwVehvX0ePtYZWTvzs7nyGTYFWpWKoN9n7c+cWWUezhfcwGnkN1GnGGvMJGtd6N1koG
         PFy6C5mVeZntgIw3vAooiVqUj0nEj75RuyprgATVfL8/GZJeAAQoguP8y8NMan4wf8KB
         l1WKfpSx7g35cg+5OpqkjqgqAaW/f4SiFF8LSaumpkgu7447DoLpPDREXdfvT4MMY9gV
         BHWMbJ29U59Lt8cOFTzuCwuK3k3xOJnvfuxGDcKfKmOEOCKli2q9XWd5g2FUm5BbJ6pl
         ikeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aOjKbRUsroHWSuojydrwirbtanEYuqPAFQFZcuFhiIQ=;
        b=ZAjKiG2Secnru2w3rrtFJazSLAWHWxU3rHqR3q4YUvFDusIj1Op9U5eHkg/C9zTtt9
         tV/DWMIQNFyDxWUdPhyLnGuYzRst2DNo/F5gaum30oNyXDtyGbW4AR4r8dGylRdlYT0V
         eNHRw8w9UG5PNN/mwbQD+cwE1pWeEJ7B+oIgLgVgk1wWN+8ZkBTIJl2CzxdECSLW/xjl
         Xv8htLAycj+bqyBOeD4Y2yxUMLIZdbxlV09q7mP0yBYam6URGHLmZlg1R56iP8r1dfgJ
         GZhnu2fStt3zO+u/PkbRwZT2U2IrjTOoHKmqfUHpEvm7RZVgMO2wnp9+jlt+onciSh+h
         d9Sw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9oF9BSdDIWY1Au2jicheZCmTA6I49uFFXFqGlqn/i4MMFdCnVq
	wtdNEeZdq6hePtfmjxwQiok=
X-Google-Smtp-Source: AGRyM1s2Yqt3J5tXBsJq2YB1yQKEucXiZsA4hxnLPj+OygwwHmhisLW3vFVNqhz3RwIBrWQQtHtwCw==
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id e21-20020a170906505500b006ff1dfb1e2cmr13084189ejk.200.1656336563977;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:26c9:b0:435:95a1:8b64 with SMTP id
 x9-20020a05640226c900b0043595a18b64ls1431244edd.2.gmail; Mon, 27 Jun 2022
 06:29:22 -0700 (PDT)
X-Received: by 2002:a05:6402:1219:b0:437:74dd:640d with SMTP id c25-20020a056402121900b0043774dd640dmr13186460edw.312.1656336562347;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336562; cv=none;
        d=google.com; s=arc-20160816;
        b=l5wYzN0B6Vh0YY0G9aEuwxfhYoRXVkd6Yl9haUAbj5GUXLLkRwgIrIEMRJSHzb3HCe
         D1F5NCDa4qswjb1JAV9C1C3DMjBhmWQGaxDrTtjvFMXoaMUUMFr0SdchZuE6gLx/tz+r
         DIbsF+zfFq+S2g2AvHhPAEuvA95mu/OfjFbuKNpxrkkZJcmpF2Wjk1bGjh6FypumIfne
         KUqMAsXlb/2e4NdsHxwDEmoROB5jrBH1Wm0aoCqg0yF+P9W58LtutN5cnOzqrZ3enXJR
         w2vDghnIG0YUAt232glFoUTRav8rhIyv1BMlHOhliKogLwBciFsqeU2zTdSNNb3Lp27U
         TNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1It35x+M0bV8geJb8aM5h93G/749t90k7AEZGCtfvCg=;
        b=A7322TKgrXwqiilE9VEev8W2TVGYZiRWUNWZjJG4luPmp9AnFFgNyucWf0cmXSyC7f
         Yvit2SCW9mI4aTbGIfWUWZjRERySIzWSAgrxbHrmB1Yy9NrJkslIPyHugZVczHavX0Vx
         b8i3l4GzWS39ErPuYT48N1gLJeeJFH5nKuaXBKkeb1JJR91lYuRPZxAcc8GlYWmAMCVh
         KA3aOZReam4jyR40Prra7bMRYKWuvfmNuSQ0HTDToUJ1ybfv3N5NfexHPP6iA+o7eHeV
         UBHEkzharzvxitq/xPfD+OiYnEzfyEO4G2uyVqy1VD8MiDBSokNz3FGeC1HMAerlvHyy
         kw9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=o1q420Ni;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q31-20020a056402249f00b0043780485814si192201eda.2.2022.06.27.06.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV971GLzy6H;
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
Subject: [RFC v1 29/42] core: riscv: implement trap handlers
Date: Mon, 27 Jun 2022 15:28:52 +0200
Message-ID: <20220627132905.4338-30-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=o1q420Ni;
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/traps.c | 784 +++++++++++++++++++++++++++++++++-
 1 file changed, 779 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index f61dfc1a..8f59a675 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -10,19 +10,793 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/entry.h>
+#include <jailhouse/percpu.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/utils.h>
+#include <asm/control.h>
 #include <asm/processor.h>
+#include <asm/csr64.h>
+#include <asm/sbi.h>
+#include <asm/setup.h>
 
 void arch_handle_trap(union registers *regs);
 void arch_handle_fault(union registers *regs);
 
-void arch_handle_trap(union registers *regs)
+static const char *causes[] = {
+	[EXC_INST_MISALIGNED]		= "Instruction Address Misaligned",
+	[EXC_INST_ACCESS]		= "Instruction Address Fault",
+	[EXC_INST_ILLEGAL]		= "Illegal Instruction",
+	[EXC_BREAKPOINT]		= "Breakpoint",
+	[EXC_LOAD_ACCESS_MISALIGNED]	= "Load Accesss Misaligned",
+	[EXC_LOAD_ACCESS]		= "Load Access Fault",
+	[EXC_AMO_ADDRESS_MISALIGNED]	= "AMO Address Misaligned",
+	[EXC_STORE_ACCESS]		= "Store Access Fault",
+	[EXC_SYSCALL]			= "Env Call From U-Mode",
+	[EXC_HYPERVISOR_SYSCALL]	= "Env Call From S-Mode",
+	[EXC_SUPERVISOR_SYSCALL]	= "Env Call From VS-Mode",
+	[11]				= "Env Call From M-Mode",
+	[EXC_INST_PAGE_FAULT]		= "Instruction Pagefault",
+	[EXC_LOAD_PAGE_FAULT]		= "Load Pagefault",
+	[14]				= "Reserved",
+	[EXC_STORE_PAGE_FAULT]		= "Store Pagefault",
+	[16 ... 19]			= "Reserved",
+	[EXC_INST_GUEST_PAGE_FAULT]	= "Inst Guest Pagefault",
+	[EXC_LOAD_GUEST_PAGE_FAULT]	= "Load Guest Pagefault",
+	[EXC_VIRTUAL_INST_FAULT]	= "Virtual Instruction Fault",
+	[EXC_STORE_GUEST_PAGE_FAULT]	= "Store Guest Pagefault",
+};
+
+static inline bool is_irq(u64 cause)
+{
+	return !!(cause & CAUSE_IRQ_FLAG);
+}
+
+static inline unsigned long to_irq(unsigned long cause)
+{
+	return cause & ~CAUSE_IRQ_FLAG;
+}
+
+static void dump_regs(union registers *r)
+{
+	struct public_per_cpu *pc = this_cpu_public();
+	unsigned long scause = csr_read(scause);
+	const char *cause_str = "UNKNOWN";
+
+	/* We might want to later exchange it with panic_printk, but for the
+	 * moment of development, printk is more helpful. */
+	void (*printer)(const char *, ...) = panic_printk;
+
+	if (scause <= 23)
+		cause_str = causes[scause];
+	else if (is_irq(scause))
+		cause_str = "IRQ";
+
+	printer("Fatal: Exception on CPU %u (HART %u). Cause: %lu (%s)\n",
+		pc->cpu_id, pc->phys_id, to_irq(scause), cause_str);
+	printer("scause: 0x%016lx, stval: 0x%016lx, htval<<2: 0x%016lx\n",
+		scause, csr_read(stval), csr_read(CSR_HTVAL) << 2);
+	printer(" PC: 0x%016llx RA: 0x%016llx  SP: 0x%016llx\n", r->pc, r->ra, r->sp);
+	printer(" GP: 0x%016llx TP: 0x%016llx  T0: 0x%016llx\n", r->gp, r->tp, r->t0);
+	printer(" T1: 0x%016llx T2: 0x%016llx  S0: 0x%016llx\n", r->t1, r->t2, r->s0);
+	printer(" S1: 0x%016llx A0: 0x%016llx  A1: 0x%016llx\n", r->s1, r->a0, r->a1);
+	printer(" A2: 0x%016llx A3: 0x%016llx  A4: 0x%016llx\n", r->a2, r->a3, r->a4);
+	printer(" A5: 0x%016llx A6: 0x%016llx  A7: 0x%016llx\n", r->a5, r->a6, r->a7);
+	printer(" S2: 0x%016llx S3: 0x%016llx  S4: 0x%016llx\n", r->s2, r->s3, r->s4);
+	printer(" S5: 0x%016llx S6: 0x%016llx  S7: 0x%016llx\n", r->s5, r->s6, r->s7);
+	printer(" S8: 0x%016llx S9: 0x%016llx S10: 0x%016llx\n", r->s8, r->s9, r->s10);
+	printer("S11: 0x%016llx T3: 0x%016llx  T4: 0x%016llx\n", r->s11, r->t3, r->t4);
+	printer(" T5: 0x%016llx T6: 0x%016llx\n", r->t5, r->t6);
+}
+
+static int handle_timer(void)
+{
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_TIMER]++;
+	sbi_set_timer(-1);
+
+	/* inject timer to VS */
+	csr_set(CSR_HVIP, (1 << IRQ_S_TIMER) << VSIP_TO_HVIP_SHIFT);
+
+	return 0;
+}
+
+static inline void riscv_guest_inject_ipi(void)
+{
+	/* inject IPI to VS */
+	csr_set(CSR_HVIP, (1 << IRQ_S_SOFT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static int handle_ipi(void)
+{
+	struct public_per_cpu *pcpu = this_cpu_public();
+	bool check_events = false;
+	u32 *stats = pcpu->stats;
+	int err = 0;
+
+	/* Take the control lock */
+	spin_lock(&pcpu->control_lock);
+
+	/*
+	 * Next, we have to check who's the recipient of the IPI. Is it the
+	 * hypervisor, or is it the guest?
+	 */
+	switch (pcpu->ipi_cause) {
+		case IPI_CAUSE_GUEST:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_IPI]++;
+			riscv_guest_inject_ipi();
+			break;
+
+		case IPI_CAUSE_MGMT:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_MANAGEMENT]++;
+			check_events = true;
+			break;
+
+		case IPI_CAUSE_NONE:
+		default:
+			printk("Fatal: Invalid IPI cause on CPU %u\n", this_cpu_id());
+			err = -EINVAL;
+			break;
+	}
+
+	this_cpu_public()->ipi_cause = IPI_CAUSE_NONE;
+	/*
+	 * IPI must be acknowledged. Clear the IPI by clearing sip.SSIP.
+	 * Alternatively, IPI could be cleared via SBI. This is deprecated and
+	 * unperformant.
+	 */
+	csr_clear(sip, (1 << IRQ_S_SOFT));
+
+	/*
+	 * Unlock the control lock. Another CPU may us now send some further
+	 * events, until we enter arch_check_events. It is important that the
+	 * IPI is acknowledged here, as from now on, further IPIs might already
+	 * be sent by remote CPUs.
+	 */
+	spin_unlock(&pcpu->control_lock);
+
+	if (check_events)
+		arch_check_events();
+
+	return err;
+}
+
+static int handle_irq(u64 irq)
+{
+	int err;
+
+	switch (irq) {
+		case IRQ_S_TIMER:
+			err = handle_timer();
+			break;
+
+		case IRQ_S_SOFT:
+			err = handle_ipi();
+			break;
+
+		case IRQ_S_EXT:
+			err = plic_set_pending();
+			break;
+
+		default:
+			err = -ENOSYS;
+			break;
+	}
+
+	return err;
+}
+
+static int sbi_ext_time(struct sbiret *ret, unsigned int fid, u64 stime)
+{
+	if (fid != SBI_EXT_TIME_SET_TIMER)
+		return -ENOSYS;
+
+	/* Clear pending IRQs */
+	csr_clear(CSR_HVIP, ((1 << IRQ_S_TIMER) << VSIP_TO_HVIP_SHIFT));
+
+	*ret = sbi_set_timer(stime);
+
+	return 0;
+}
+
+static inline void skip_emulated_instruction(union registers *regs, unsigned int b)
+{
+	regs->pc += b;
+	csr_write(sepc, regs->pc);
+}
+
+static bool sbi_permitted_target_mask(unsigned long mask, unsigned long base)
+{
+	unsigned int cpu;
+	unsigned long phys;
+
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		phys = public_per_cpu(cpu)->phys_id;
+		if (phys < base)
+			continue;
+
+		mask &= ~(1UL << (phys - base));
+		if (!mask)
+			return true;
+	}
+
+	return false;
+}
+
+static bool sbi_permitted_hart(unsigned long hartid)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, &this_cell()->cpu_set)
+		if (public_per_cpu(cpu)->phys_id == hartid)
+			return true;
+	return false;
+}
+
+static void cpu_queue_ipi(unsigned int cpu)
+{
+	struct public_per_cpu *pcpu;
+	pcpu = public_per_cpu(cpu);
+
+retry:
+	spin_lock(&pcpu->control_lock);
+	if (pcpu->ipi_cause == IPI_CAUSE_NONE)
+		pcpu->ipi_cause = IPI_CAUSE_GUEST;
+	else {
+		spin_unlock(&pcpu->control_lock);
+		goto retry;
+	}
+	spin_unlock(&pcpu->control_lock);
+}
+
+static int handle_sbi_send_ipi(struct sbiret *ret, unsigned long mask,
+			       unsigned	long base)
+{
+	unsigned long phys;
+	unsigned int cpu;
+
+	/* targets in cell? Check privileges. */
+	if (!sbi_permitted_target_mask(mask, base))
+		return -EPERM;
+
+	for (phys = 0; phys < sizeof(unsigned long) * 8; phys++) {
+		if (!(mask & (1UL << phys)))
+			continue;
+
+		cpu = cpu_by_phys_processor_id(base + phys);
+		if (cpu == this_cpu_id()) {
+			mask &= ~(1UL << phys);
+			riscv_guest_inject_ipi();
+			continue;
+		}
+
+		cpu_queue_ipi(cpu);
+	}
+
+	/* If we land here, we can forward the SBI call */
+
+	/* Only forward the IPI, if in mask is anything left */
+	if (mask)
+		*ret = sbi_send_ipi(mask, base);
+	else /* Just a single self-IPI */
+		ret->value = ret->error = 0;
+
+	return 0;
+}
+
+
+static inline int handle_sbi_rfence(struct sbiret *ret, unsigned int fid,
+				    unsigned long mask, unsigned long base,
+				    unsigned long a2, unsigned long a3,
+				    unsigned long a4)
+{
+	if (!sbi_permitted_target_mask(mask, base))
+			return -EPERM;
+
+	*ret = sbi_ecall(SBI_EXT_RFENCE, fid, mask, base, a2, a3, a4, 0);
+	return 0;
+}
+
+static int riscv_unpark(struct sbiret *ret, unsigned long hartid, unsigned long start_addr, unsigned long opaque)
+{
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+	struct sbiret tmp;
+	int err = 0;
+
+	cpu = cpu_by_phys_processor_id(hartid);
+	pcpu = public_per_cpu(cpu);
+
+	spin_lock(&pcpu->control_lock);
+	if (pcpu->hsm.state == STARTED || pcpu->hsm.state == START_PENDING) {
+		ret->value = 0;
+		ret->error = SBI_ERR_ALREADY_AVAILABLE;
+		goto unlock_out;
+	}
+
+	pcpu->hsm.start_addr = start_addr;
+	pcpu->hsm.opaque = opaque;
+	pcpu->hsm.state = START_PENDING;
+	pcpu->ipi_cause = IPI_CAUSE_MGMT;
+	// fence?
+
+	tmp = sbi_send_ipi(1UL << hartid, 0);
+	if (tmp.error != SBI_SUCCESS) {
+		err = -EINVAL;
+		goto unlock_out;
+	}
+
+	ret->error = SBI_SUCCESS;
+	ret->value = 0;
+
+unlock_out:
+	spin_unlock(&pcpu->control_lock);
+	return err;
+}
+
+static int handle_sbi_hsm(struct sbiret *ret, unsigned int fid, unsigned long a0,
+			  unsigned long a1, unsigned long a2)
+{
+	int err = 0;
+
+	switch (fid) {
+		case SBI_EXT_HSM_HART_STOP:
+			riscv_park_cpu();
+			break;
+
+		case SBI_EXT_HSM_HART_START:
+			ret->value = 0;
+			if (!sbi_permitted_hart(a0) ||
+			    a0 == this_cpu_public()->phys_id) {
+				ret->error = SBI_ERR_INVALID_PARAM;
+				break;
+			}
+
+			/* FIXME: Check if remote CPU is really parked! */
+			err = riscv_unpark(ret, a0, a1, a2);
+			break;
+
+		case SBI_EXT_HSM_HART_STATUS:
+			if (sbi_permitted_hart(a0)) {
+				ret->error = SBI_SUCCESS;
+				ret->value = public_per_cpu(cpu_by_phys_processor_id(a0))->hsm.state;
+			} else {
+				ret->error = SBI_ERR_INVALID_PARAM;
+				ret->value = 0;
+			}
+			break;
+
+		default:
+			printk("Unknown HSM Fid: %u\n", fid);
+			err = -EINVAL;
+			break;
+	}
+
+	return err;
+}
+
+static int sbi_ext_base(struct sbiret *ret, unsigned long fid, unsigned long a0)
+{
+	int err = 0;
+
+	switch (fid) {
+		case SBI_EXT_BASE_GET_SPEC_VERSION:
+		case SBI_EXT_BASE_GET_IMP_ID:
+		case SBI_EXT_BASE_GET_IMP_VERSION:
+		case SBI_EXT_BASE_PROBE_EXT: /* FIXME Rethink of this one. We could decline HSM for non-root cells */
+		case SBI_EXT_BASE_GET_MVENDORID:
+		case SBI_EXT_BASE_GET_MARCHID:
+		case SBI_EXT_BASE_GET_MIMPID:
+			*ret = sbi_ecall(SBI_EXT_BASE, fid, a0, 0, 0, 0, 0, 0);
+			break;
+
+		default:
+			err = -ENOSYS;
+			break;
+	}
+
+	return err;
+}
+
+static int handle_ecall(union registers *regs)
+{
+	/*
+	 * Spec: In the name of compatibility, SBI extension IDs (EIDs) and SBI
+	 * function IDs (FIDs) are encoded as signed 32-bit integers. When
+	 * passed in registers these follow the standard above calling
+	 * convention rules.
+	 */
+	u32 *stats = this_cpu_public()->stats;
+	unsigned int eid, fid;
+	struct sbiret ret;
+	int err = -ENOSYS;
+
+	eid = regs->a7;
+	fid = regs->a6;
+	ret.value = 0;
+
+	switch (eid) {
+		/* Treat putchar like a hypercall. Accounts for a hypercall. */
+		case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+			ret.error = hypercall(JAILHOUSE_HC_DEBUG_CONSOLE_PUTC,
+					      regs->a0, 0);
+			err = 0;
+			break;
+
+		case SBI_EXT_0_1_CONSOLE_GETCHAR: /* FIXME: Only allow for root cell? */
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			ret = sbi_console_getchar_legacy_0_1();
+			err = 0;
+			break;
+
+		case SBI_EXT_BASE:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			err = sbi_ext_base(&ret, fid, regs->a0);
+			break;
+
+		case SBI_EXT_TIME: /* since SBI v0.2 */
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			err = sbi_ext_time(&ret, fid, regs->a0);
+			break;
+
+		case SBI_EXT_SPI:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			err = handle_sbi_send_ipi(&ret, regs->a0, regs->a1);
+			break;
+
+		case SBI_EXT_RFENCE:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			err = handle_sbi_rfence(&ret, fid, regs->a0, regs->a1, regs->a2,
+                                                regs->a3, regs->a4);
+			break;
+
+		case SBI_EXT_HSM:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI]++;
+			err = handle_sbi_hsm(&ret, fid, regs->a0, regs->a1, regs->a2);
+			break;
+
+		case JAILHOUSE_EID:
+			ret.error = hypercall(fid, regs->a0, regs->a1);
+			if (fid == JAILHOUSE_HC_DISABLE && !ret.error) {
+				riscv_deactivate_vmm(regs, 0);
+			}
+			/* If the HC failed, don't crash the CPU, rather propagate the error */
+			err = 0;
+			break;
+
+		default:
+			printk("Unknown SBI call EID: 0x%x FID: 0x%x\n", eid, fid);
+			return -EINVAL;
+			break;
+	}
+
+	if (err)
+		return err;
+
+	/* If we came from stop, don't propagate error codes */
+	if (eid == SBI_EXT_HSM && fid == SBI_EXT_HSM_HART_STOP)
+		return 0;
+
+	regs->a0 = ret.error;
+	regs->a1 = ret.value;
+	skip_emulated_instruction(regs, 4);
+
+	return 0;
+}
+
+static inline int gmem_read16(unsigned long addr, u16 *val)
+{
+	register unsigned long err asm("a0");
+	register unsigned long _val asm("a1") = (unsigned long)val;
+	register unsigned long _addr asm("a2") = addr;
+
+	/*
+	 * hlvx.hu may fault and throw an exception. This is, so far, the only
+	 * known S-Mode exception that is recoverable and must not crash the
+	 * hypervisor. In this case, the hypervisor will catch the exception,
+	 * and set a0 properly. If a0 remains zero, then no exception occured
+	 * and everything is fine. We need to save sstatus and hstatus before,
+	 * as nested S-Mode exceptions will mess up those registers.
+	 */
+	asm volatile("addi %2, zero, 0\n"
+		     "csrr a3, sstatus\n"
+		     "csrr a4, %3\n"
+		     /* Haha, I wonder what Jan will say to this hack... */
+		     "HLVX:"
+		     ".word 0x643645f3\n" /* hlvx.hu a1, (a2) */
+		     "csrw sstatus, a3\n"
+		     "csrw %3, a4\n"
+		     : "=r"(_val)
+		     : "r"(_addr), "r"(err), "i"(CSR_HSTATUS)
+		     : "memory", "a3", "a4");
+	*val = _val;
+
+	/* err will be set, if an exception has been thrown */
+	return err;
+}
+
+static inline u64 sext(u32 w)
+{
+	u64 ret;
+	asm volatile("sext.w %0, %0" : "=r"(ret) : "r"(w) :);
+	return ret;
+}
+
+#define COMP_RX_OFF	8
+
+union instruction {
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 dest:5;
+		u32 width:3;
+		u32 base:5;
+		u32 offset:12;
+	} load __attribute__((packed));
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 offset40:5;
+		u32 width:3;
+		u32 base:5;
+		u32 src:5;
+		u32 offset115:7;
+	} store __attribute__((packed));
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 rsvd:25;
+	} generic __attribute__((packed));
+	u32 raw;
+} __attribute__((packed));
+
+union cinstruction {
+	struct {
+		u16 opcode:2;
+		u16 src_dst:3;
+		u16 off1:2;
+		u16 base:3;
+		u16 off2:3;
+		u16 funct3:3;
+	} load_store __attribute__((packed));
+	struct {
+		u16 opcode:2;
+		u16 rsvd:14;
+	} generic __attribute__((packed));
+	u16 raw;
+} __attribute__((packed));
+
+struct riscv_mmio_inst {
+	unsigned char reg;
+	unsigned char width;
+	bool sign_extended;
+};
+
+static int riscv_decode_compressed_instruction(struct riscv_mmio_inst *mmio_inst, u16 inst)
 {
-	for (;;)
-		cpu_relax();
+	union cinstruction i;
+	int err = -ENOSYS;
+
+	i.raw = inst;
+	/* SW */
+	if (i.generic.opcode == 0 && i.load_store.funct3 == 6) {
+		mmio_inst->width = 4;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load_store.src_dst + COMP_RX_OFF;
+		err = 0;
+	/* LW */
+	} else if (i.generic.opcode == 0 && i.load_store.funct3 == 2) {
+		mmio_inst->width = 4;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load_store.src_dst + COMP_RX_OFF;
+		err = 0;
+	}
+
+	return err;
+}
+
+static int riscv_decode_instruction(struct riscv_mmio_inst *mmio_inst, u32 inst, bool is_compressed)
+{
+	union instruction i;
+	int err = -ENOSYS;
+
+	if (is_compressed)
+		return riscv_decode_compressed_instruction(mmio_inst, inst);
+
+	i.raw = inst;
+	if (i.generic.type != 0x3)
+		return err;
+
+	/* LB, LH, LW */
+	if (i.generic.opcode == 0x0) {
+		if (i.load.width > 2)
+			return err;
+		mmio_inst->width = 1 << i.load.width;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load.dest;
+		err = 0;
+	/* SB, SW, SH */
+	} else if (i.generic.opcode == 0x8) {
+		if (i.store.width > 2)
+			return err;
+		mmio_inst->width = 1 << i.store.width;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.store.src;
+		err = 0;
+	}
+
+	return err;
+}
+
+static int handle_fault(union registers *regs, bool is_write)
+{
+	struct riscv_mmio_inst mmio_inst;
+	struct mmio_access mmio;
+	enum mmio_result result;
+	bool is_compressed;
+	u32 instruction;
+	size_t *reg;
+	u16 tmp;
+	int err;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
+
+	mmio.is_write = is_write;
+	mmio.address = csr_read(CSR_HTVAL) << 2;
+
+	/*
+	 * Potentially, htval might point to address NULL, while pointing to a
+	 * valid trap value. However, 0 might also indicate that htval is not
+	 * supported by the micro-architecture. Hence, by design, let's say
+	 * that address NULL should (a) not be used or (b) must not cause
+	 * access faults when being used.
+	 *
+	 * Here, we assume that the micro-architecture doesn't support htval,
+	 * if we read back zero on a fault exception.
+	 */
+	if (!mmio.address)
+		return -ENOSYS;
+
+	/* Load remaining lsb two bits from stval */
+	mmio.address |= csr_read(stval) & 0x3;
+
+	/* Load faulting instruction */
+
+	/* check if htinst is available */
+#if 0 /* htinst might hold pseudo-decoded instruction which we don't support yet. */
+	instruction = csr_read(CSR_HTINST);
+#else
+	instruction = 0;
+#endif
+	if (instruction != 0) {
+		is_compressed = (instruction & 0x3) != 0x3;
+	} else { /* if not, load vom guest mem */
+		err = gmem_read16(regs->pc, &tmp);
+		if (err)
+			return err;
+
+		instruction = tmp;
+		if ((instruction & 0x3) == 0x3) {
+			is_compressed = false;
+			err = gmem_read16(regs->pc + 2, &tmp);
+			if (err)
+				return err;
+			instruction |= (u32)tmp << 16;
+		} else
+			is_compressed = true;
+	}
+
+	err = riscv_decode_instruction(&mmio_inst, instruction, is_compressed);
+	if (err)
+		goto unsup;
+
+	if (mmio.is_write)
+		mmio.value = regs->raw.x[mmio_inst.reg];
+	mmio.size = mmio_inst.width;
+
+	result = mmio_handle_access(&mmio);
+	if (result == MMIO_HANDLED) {
+		if (!mmio.is_write) {
+			reg = &regs->raw.x[mmio_inst.reg];
+			*reg = mmio.value;
+			if (mmio_inst.width < 8) {
+				*reg &= ((1UL << mmio_inst.width * 8) - 1);
+				if (mmio_inst.sign_extended)
+					*reg = sext(*reg);
+			}
+		}
+		skip_emulated_instruction(regs, is_compressed ? 2 : 4);
+		return 0;
+	}
+
+	return -ENOSYS;
+
+unsup:
+	printk("Unsupported instruction: 0x%x\n", instruction);
+	return -ENOSYS;
 }
 
 void arch_handle_fault(union registers *regs)
 {
-	for (;;)
-		cpu_relax();
+	unsigned long hlvx_location;
+	/*
+	 * If we have a Load Guest Page Fault, and the fault came from hlvx,
+	 * then set a0 to -EINVAL, skip hlvx instruction, and return.
+	 */
+	regs->pc = csr_read(sepc);
+	if (csr_read(scause) == EXC_LOAD_GUEST_PAGE_FAULT) {
+		asm volatile("la %0, HLVX\n" : "=r"(hlvx_location));
+		if (regs->pc != hlvx_location)
+			goto panic_out;
+
+		skip_emulated_instruction(regs, 4);
+		regs->a0 = -EINVAL;
+		return;
+	}
+
+panic_out:
+	panic_printk("FATAL: Unhandled S-Mode exception.\n");
+	panic_printk("Hypervisor registers:\n");
+	dump_regs(regs);
+	panic_stop();
+}
+
+void arch_handle_trap(union registers *regs)
+{
+	unsigned long cause;
+	int err = -1;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_TOTAL]++;
+
+	regs->pc = csr_read(sepc);
+	cause = csr_read(scause);
+
+	if (is_irq(cause)) {
+		err = handle_irq(cause & ~CAUSE_IRQ_FLAG);
+		goto out;
+	}
+
+	switch (cause) {
+		case EXC_INST_ACCESS:
+		case EXC_LOAD_ACCESS:
+		case EXC_STORE_ACCESS:
+		case EXC_INST_PAGE_FAULT:
+		case EXC_LOAD_PAGE_FAULT:
+		case EXC_STORE_PAGE_FAULT:
+		case EXC_INST_MISALIGNED:
+		case EXC_LOAD_ACCESS_MISALIGNED:
+		case EXC_AMO_ADDRESS_MISALIGNED:
+			printk("\nFaulting Address: %016lx\n", csr_read(stval));
+			err = -ENOSYS;
+			break;
+
+		case EXC_SUPERVISOR_SYSCALL:
+			err = handle_ecall(regs);
+			break;
+
+		case EXC_BREAKPOINT:
+			printk("BP occured @ PC: %016lx\n", regs->pc);
+			err = -1;
+			break;
+
+		case EXC_LOAD_GUEST_PAGE_FAULT:
+			err = handle_fault(regs, false);
+			break;
+
+		case EXC_STORE_GUEST_PAGE_FAULT:
+			err = handle_fault(regs, true);
+			break;
+
+		case EXC_INST_ILLEGAL:
+		default:
+			err = -1;
+			break;
+	}
+
+out:
+	if (err) {
+		dump_regs(regs);
+		panic_park();
+	}
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-30-ralf.ramsauer%40oth-regensburg.de.
