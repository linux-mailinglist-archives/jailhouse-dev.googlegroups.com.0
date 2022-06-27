Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CA355B9FB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id r20-20020adfb1d4000000b0021b8507563esf1198327wra.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZOp16eHyRqA04rkHAg0ld1G3KGJkkXsXgZ9Ww55GEfXHBW8ZBZS2Q/zmTYMy/Nlzpj
         XRrfylAnEVOLr+GrBkToLnanvc0CItLEh2iCiqJ/66cU7OLrdeYcoMmOg2+U3NrHi9o7
         iRdz0Q/wPHMXkymcvwkDvN/WqUtj+hIiJT6zrrKoeR/Yqsd8G+eD7t1tbYeZBgQefAsV
         +U1rqqMdkpwEnr+HttJ1qo7UfsrpWne+bZJJKhBbSvaa7K7qfVb/LtWmfM90iJvd55zc
         m07RHAaBnmCsgrBIp2WW9a/nroyF2+c307ahlV/RdpRqYGMBxgAxzb6F+dC3YOC28KaF
         CxEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=7m0/QBAgJAPE81xMZJRVFkvtfQWUvQiGls4o5ZmEc/g=;
        b=fxoCC6e8akzPI+XBIOGJE9jb9Rf8szvaH9RzF5abiKx1Kyyx+bgsB+RJVJPgnMYXKi
         XkbfbFMU3/aSVYmyKvawjR7TcSq+e9IAA5Ch1Yt6xlmzfd/zw53NGgcVbO94d5Yo0t8c
         L86l/KasvNiCxX7oHsVBOIcG2DsRMlf/o7aMrPKs5RYFbMYUmX4IdC2sehXyqRrCvwg5
         opl0MncmzTrnPPSW4CFpf7y2hBYIxCAI+tVB3I3vdpt/a3AH+KGtucmvU5DArg9n93Zg
         1XhmqtrhZPzv9PSFhvUhdJY/C50Y+HUxa6Chq06vXtYWekLXLNFM6jX2bmGeN8q9Q0/e
         1gFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=lxUcie4e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7m0/QBAgJAPE81xMZJRVFkvtfQWUvQiGls4o5ZmEc/g=;
        b=LO1avyYHvwwuLscZZ2nUPsC8sXKZcklMpx0n8FkQybdmkfgo+SUj+gL5kcmL1r2xUa
         mvCbH0sFmnwP6d1jEcLR/f/XoMopGYAN6ZBeYTjo/n9L92VZBNgPJ8Rwu9qq53wtqWZ2
         U39qkzH/i3GmbLecVYJta23HARq43XvtZ/xhbko0lQ34+vuzWUHPxuyaF5mCkwKmddvG
         EvGuphMLaKfqVJ8Ksda/MzB3yGKz3m6VB+kNEuc8M4S5wiyMYNYzMrSYREEGpG55/YLB
         PNVfKqhcaQuVQ4LkPEdTPMiSBeAn1eZX0Q3PgkdLVvmmTfg55xYRbolRzba4nVHP5jx6
         N9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7m0/QBAgJAPE81xMZJRVFkvtfQWUvQiGls4o5ZmEc/g=;
        b=nAXQEksktCetJnFxOCPoDuarZ9ys58wZAqMEUG8IQtUyeyqwkgUgHXmgeffGguSogQ
         0T131Xu7eTYsiN4d7C7crFtWc3ibOh2z1xkejq41T83k6peIdfVCrLaPglaRw5bOybFK
         NNvYbhH+kktfJpEZPQgC9K435xLjIRPlpDCZp8OlsRwfR1CNqt+JY84eZ+rjTYVUBUcM
         P85nBG/R5H3pWyiOvEaV+ef7h9Ddw4vl+tKr/jVUlNgoJU/Suj0qfpqwe9rmw764eEpR
         m9nLdWisT0KK0ZO1x6d1Ng0Lqyk/lZ5MKwBrswdf5ZpBEn/BtsuAYxSs/dQh7B6tuEbi
         H2Cw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+zNpZjXR4sXgavWTDAtGrGtqrQYaeyfl0KNM9msjNkPhScGUz+
	9Nc/SrFg4h14HavH3OzXFPQ=
X-Google-Smtp-Source: AGRyM1tngP5zA1Zgpg/2lykEQIRkk/r8b4YTL5Cxf/XZz89PMb5bnzU8gVXFHYnTgH+2C0sN8939PQ==
X-Received: by 2002:a5d:470d:0:b0:21a:3dac:8bcf with SMTP id y13-20020a5d470d000000b0021a3dac8bcfmr12679255wrq.113.1656336562651;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083440wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a5d:6791:0:b0:21b:9e4b:2f95 with SMTP id v17-20020a5d6791000000b0021b9e4b2f95mr12941439wru.399.1656336561291;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=Gw9vYX0P4tFO/nVKiL/Oj9oEt6RzlfK7bf5duAUNMU2a5/L2rLTDfkNE2gTIoZ16ZM
         Tj2kilrcatjgLPDLgxFH6/+IkPV3zicWt7LdhS9Yzvas8mpFaGn/UmhpdpaFRp1ZF2Ii
         kWJqkT0kOjRUbvwD6CETxDgRK56lw7geh38zrBSsYhS2WCa1v9SGzF95EKi7YtMxEFE5
         H4PiVPXvPYP5k5rqUdWLoiMZVLfGLdNS8FmFfKY9abBPh0nu0dMjuPeS62aEAumlq+9G
         XE/b+NtHJZOUXcCOSJTD4RJp3YrzMJ1PpeAg3damlSKKJ5Y6HVaeqnEbpt0sF2oDXT2k
         YnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4Lcf77fOdnady/sLAqEDPycLMisL1iOccksPDD2GIm0=;
        b=OUog2oVj+/jV0t9HgkTfrKsQJluPQbrR/6ZvhHJg1oZitX9tDEfCR4zm/ohcoTpWXW
         6xna0OQtlhp7Gz+R5rEhHIPo58vx2M0rQQqpgFhc/wBjKyBg+m7UVIpSfyQDBRt0riNs
         1GsB7bFIGwqgTzbiXg/T3nSegUzd1hjWl3bcoZViUYIbvFi13w9frC0l3tRtJNKeEcG1
         OC8oPRdUJqFZ4GIYs55AXWbZVgC0kthPVfZPY5hU/bgwPd2//hGI3Eb/zaaLBGihfjmI
         a5s/KkV9UHPvetQV+w8DoaVFwIjvWtdQVS/SbWRsG+e/7poX9QhM86RPTx3vIOwoUKKv
         KfZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=lxUcie4e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id m7-20020adffa07000000b0021a07a20517si344482wrr.7.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV90KCyzxpy;
	Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 24/42] core: riscv: implement control.c
Date: Mon, 27 Jun 2022 15:28:47 +0200
Message-ID: <20220627132905.4338-25-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=lxUcie4e;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

---
 hypervisor/arch/riscv/control.c             | 213 ++++++++++++++++++--
 hypervisor/arch/riscv/include/asm/control.h |  13 ++
 2 files changed, 209 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index 263708a7..fa9921e6 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -2,70 +2,230 @@
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
 
 #include <jailhouse/control.h>
+#include <jailhouse/paging.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/string.h>
+#include <asm/control.h>
+#include <asm/csr64.h>
 #include <asm/sbi.h>
 
-int arch_cell_create(struct cell *cell)
+extern void __attribute__((noreturn)) riscv_park_loop(void);
+
+static void riscv_cpu_reset(unsigned long pc, unsigned long a0, unsigned long a1)
+{
+	union registers *regs;
+
+	regs = &this_cpu_data()->guest_regs;
+
+	memset(regs, 0, sizeof(union registers));
+	regs->pc = pc;
+	regs->a0 = a0;
+	regs->a1 = a1;
+
+	/* TBD: Check if we need to clear more registers */
+	csr_write(sepc, regs->pc);
+	csr_write(CSR_VSATP, 0);
+	csr_write(CSR_HIE, 0);
+	csr_write(CSR_HIP, 0);
+	csr_write(CSR_VSSTATUS, 0);
+
+	csr_set(sstatus, SR_SPP); /* Return to VS-Mode */
+}
+
+void arch_check_events(void)
 {
-	return -ENOSYS;
+	struct public_per_cpu *pcpu;
+
+	pcpu = this_cpu_public();
+
+	spin_lock(&pcpu->control_lock);
+
+	if (pcpu->suspend_cpu) {
+		pcpu->cpu_suspended = true;
+
+		spin_unlock(&pcpu->control_lock);
+
+		while (pcpu->suspend_cpu)
+			cpu_relax();
+
+		spin_lock(&pcpu->control_lock);
+	}
+
+	pcpu->cpu_suspended = false;
+
+	if (pcpu->wait_for_power_on) {
+		pcpu->wait_for_power_on = false;
+		goto out;
+	}
+
+	if (pcpu->hsm.state == START_PENDING) { /* We could also check if START_PENDING is set... */
+		pcpu->reset = false;
+		riscv_cpu_reset(pcpu->hsm.start_addr, pcpu->phys_id, pcpu->hsm.opaque);
+		riscv_paging_vcpu_init(&this_cell()->arch.mm);
+		pcpu->hsm.state = STARTED;
+	} else if (pcpu->park) {
+		riscv_park_cpu();
+	}
+
+	if (pcpu->reset) {
+		pcpu->reset = false;
+		riscv_cpu_reset(0x0, pcpu->phys_id, 0);
+		riscv_paging_vcpu_init(&this_cell()->arch.mm);
+	}
+
+out:
+	spin_unlock(&pcpu->control_lock);
 }
 
 int arch_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
 {
-	return -ENOSYS;
+	int result = paging_create(
+		&cell->arch.mm,
+		mem->flags & JAILHOUSE_MEM_COMM_REGION ?
+		paging_hvirt2phys (&cell->comm_page) : mem->phys_start,
+		mem->size, mem->virt_start,
+		/* guests require U access */
+		RISCV_PTE_FLAG(V) | RISCV_PTE_FLAG(U) |
+		(mem->flags & JAILHOUSE_MEM_READ ? RISCV_PTE_FLAG(R) : 0) |
+		(mem->flags & JAILHOUSE_MEM_WRITE ? RISCV_PTE_FLAG(W) : 0) |
+		(mem->flags & JAILHOUSE_MEM_EXECUTE ? RISCV_PTE_FLAG(X) : 0),
+		PAGING_COHERENT |
+		(mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES ? 0 : PAGING_HUGE));
+
+	return result;
 }
 
-int arch_unmap_memory_region(struct cell *cell,
-			     const struct jailhouse_memory *mem)
+int arch_unmap_memory_region(struct cell *const cell,
+			     const struct jailhouse_memory *mem_original)
 {
-	return -ENOSYS;
+	return paging_destroy (&cell->arch.mm,
+				mem_original->virt_start,
+				mem_original->size,
+				PAGING_COHERENT);
 }
 
-void arch_check_events(void)
+void arch_flush_cell_vcpu_caches(struct cell *const cell)
 {
+	/* the necessary TLB invalidation has already been performed
+	in the map/unmap routines */
+	/* doing it here would require the entire cell's TLB to be
+	flushed, because this function does not receive information
+	about the memory segment to invalidate.  That would be overkill
+	(although the current unmap_region implementation does this
+	nonetheless, owing to other API shortcomings).
+	*/
 }
 
-void arch_flush_cell_vcpu_caches(struct cell *cell)
+int arch_cell_create(struct cell *const cell)
 {
+	struct public_per_cpu *ppc;
+	unsigned int cpu;
+
+	cell->arch.mm.root_paging = riscv_Sv39x4;
+	cell->arch.mm.root_table = page_alloc_aligned(&mem_pool, CELL_ROOT_PT_PAGES);
+
+	for_each_cpu(cpu, &cell->cpu_set) {
+		ppc = public_per_cpu(cpu);
+		ppc->wait_for_power_on = false;
+		ppc->park = true;
+		ppc->reset = false;
+	}
+
+	if (!cell->arch.mm.root_table)
+		return -ENOMEM;
+
+	return 0;
 }
 
-void arch_cell_destroy(struct cell *cell)
+void arch_cell_destroy(struct cell *const cell)
 {
+	unsigned int cpu;
+	struct public_per_cpu *ppc;
+
+	page_free(&mem_pool, cell->arch.mm.root_table, CELL_ROOT_PT_PAGES);
+
+	for_each_cpu(cpu, &cell->cpu_set) {
+		ppc = public_per_cpu(cpu);
+		ppc->wait_for_power_on = false;
+		ppc->park = true;
+		ppc->reset = false;
+	}
 }
 
-void arch_cell_reset(struct cell *cell)
+void arch_cell_reset(struct cell *const cell)
 {
+	unsigned int first = first_cpu(&cell->cpu_set);
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+
+	/*
+	 * All CPUs except the first one shall not be started, they shall park
+	 */
+	pcpu = public_per_cpu(first);
+	pcpu->wait_for_power_on = false;
+	pcpu->park = false;
+	for_each_cpu_except(cpu, &cell->cpu_set, first)
+		public_per_cpu(cpu)->wait_for_power_on = true;
 }
 
-void arch_prepare_shutdown(void)
+void arch_reset_cpu(unsigned int const cpu_id)
 {
+	public_per_cpu(cpu_id)->reset = true;
+
+	resume_cpu(cpu_id);
 }
 
-void __attribute__((noreturn)) arch_panic_stop(void)
+void arch_park_cpu(unsigned int const cpu_id)
 {
-	while (1);
+	struct public_per_cpu *pc = public_per_cpu(cpu_id);
+
+	if (pc->hsm.state == STOPPED)
+		return;
+
+	if (pc->cpu_suspended == true)
+		return;
+
+	spin_lock(&pc->control_lock);
+	pc->park = true;
+	arch_send_event(pc);
+	spin_unlock(&pc->control_lock);
+
+	while (pc->hsm.state != STOPPED)
+		cpu_relax();
+
 }
 
-void arch_panic_park(void)
+void arch_prepare_shutdown(void)
 {
 }
 
-void arch_reset_cpu(unsigned int const cpu_id)
+void __attribute__((noreturn)) arch_panic_stop(void)
 {
+	/* No need to check return code here */
+	sbi_hart_stop();
+
+	/*
+	 * If this happens, which should never be the case, then let the CPU
+	 * execute the park loop.
+	 */
+	riscv_park_loop();
 }
 
-void arch_park_cpu(unsigned int cpu_id)
+void arch_panic_park(void)
 {
+	riscv_park_cpu();
 }
 
 void arch_send_event(struct public_per_cpu *target_data)
@@ -83,3 +243,22 @@ void arch_send_event(struct public_per_cpu *target_data)
 		panic_stop();
 	}
 }
+
+void riscv_park_cpu(void)
+{
+	struct public_per_cpu *pcpu = this_cpu_public();
+
+	pcpu->hsm.state = STOPPED;
+	/*
+	 * BUG FIXME: The Timer IRQ might be pending, and we're
+	 * effectively busy waiting here. Apparently, Linux doesn't
+	 * shut down the timer before offlining the CPU. Check this!
+	 *
+	 * Second, do we need to manually disable all external PLIC IRQs of the
+	 * cell? Actually, yes.
+	 */
+	sbi_set_timer(-1);
+
+	riscv_paging_vcpu_init(&parking_pt);
+	riscv_cpu_reset(0, 0, 0);
+}
diff --git a/hypervisor/arch/riscv/include/asm/control.h b/hypervisor/arch/riscv/include/asm/control.h
index e69de29b..466311f8 100644
--- a/hypervisor/arch/riscv/include/asm/control.h
+++ b/hypervisor/arch/riscv/include/asm/control.h
@@ -0,0 +1,13 @@
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
+void riscv_park_cpu(void);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-25-ralf.ramsauer%40oth-regensburg.de.
