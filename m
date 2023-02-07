Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZMGRGPQMGQEJRRXB6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8F68D688
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:14 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id v15-20020adfe4cf000000b002bf9413bc50sf2001312wrm.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772774; cv=pass;
        d=google.com; s=arc-20160816;
        b=z0Ufle/SVDGVVWc4hIZYn8ysZOddZ6KryQNgOTi/J2BoZ84dD7wRpeu9kZpA17h2S1
         fP1ehnNgCc70CJq+WBa3isYGly4/Uey8+sTfnJsu1cR2uIi1OlYRkYzhB1nwMfW8So5O
         I80EFEeif0zHIlRiv3wDuf/vxokgf7qzGn+KUKiynNJR2GcYkpEGKpOmrbOoiPgfKxib
         XRdHIhX4s4DYvVWgoaBy/Tk4qGi3CtJPn0q4cQe8T1lbNf1BWmNim7wrGWwfV8kr563a
         jBH1NcxA0kX2a6gUntgP9DT9LoXBSX2Hz8qDDu83bmtekwGtBautzSGK9TOJz9Pz0g4V
         L0Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Otf7Q1ixrkjKwRsctviuxyRN6m2J7/xHHUxB/M27EJM=;
        b=V5lQrJLygrhhjcd1kKn3zfll4ua4WS5Y23bqrg42x/r/+R8BXWytO88JHti3eyQ/Fa
         fav5VelNv87PfnQf99keuJCpB6cQRihB1MHXc6GH1ussNVwfSDvPyxPfdoVR5/O5aLDa
         PVhXwjPpXDQ5dQNNJOJbj2aHF9/IhuKEs7/9klrY+X75mm5ueIs7fhNIjXRGs1tf8Wma
         dUh9nYgWcxNsM1g0oyTGneQVfAsZSskNtOW6pnPOgcPys7TNAu2biaaN7QNWIHKnOSaV
         y7iCAkypmZJVLiCPcXfEaNg/a/3LmPHY7wkR4tfUMwF3oi8aLnevPRZqY2FpAxdtJ5xr
         h8QA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otf7Q1ixrkjKwRsctviuxyRN6m2J7/xHHUxB/M27EJM=;
        b=UMuXO1nye7Hq4tFUEXJrH3GIROLZKfi5NeM2sg/Y3JpOqpkcqZ922kITNjxN8CNoeH
         DBVMbKit4Z9zfse81ta7x8Y+acv7jYTCprOP+QEZvGvPwdx7Ypju++UaP0htveLj5qKa
         kp1IFgtk4Z5rTAl8JMr5utANi19Niadv21KyjHe6BnMSKaP9D6ffG1OaYXoSBkWsi0c/
         nHbHWop+HVULgC3oojC/EUzJyhINedW6/PKckOmhHitirOe6GgOkYs1NkggXRQjG7i+P
         kMpZBryDHrm9KtR0oz08nX+6H02UZfaV9Uct2fYRlpf9QzFvsPOuo6z2Et49rAyRkJ84
         uJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Otf7Q1ixrkjKwRsctviuxyRN6m2J7/xHHUxB/M27EJM=;
        b=ifCOHyBr9IjC1E2VTS+MmNaB7GXyUBsK1IqcjbDlQHlLkFhTGHh0XMuPtOLWMMlKkg
         RzWPIXM3G7dQqNFVoxs1Swz2gP+InYCyl8EO2NXsnzkbZ2ffIXwW/nVwIkDfspyVisJR
         2PUha5yPGvDhJnEB5C0K/4s0xVlHmg1gK0n1ppT+1b0lGbk7AHGTiRBSTi9EjTLM3T0J
         5PpQGHf4h6JQkQACYrtR8OAC8SYuR/vm8qu4UesOEeKQxBP4esrH8rHvD+FpJnkj/vTr
         jBmYm+zEuGm+Pd5gOuVNF67ZiHt0HorW1KPATO8ZvH+A/a1dCPApOenJFUyQWjdeo1de
         fPQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWPVO3YJ4ti/svBjkz1qbuQ5pseVAiOhB3znu+a+18BYdKbQS0Z
	hTNwm9jNIkxICClLCmtpZcw=
X-Google-Smtp-Source: AK7set+vQR45yWPVQ9c5tBYLYzt162L6BNhvkUrLfRAWjIdzqm9LXwtB3n7qLdavYWM6AZSAt2JMBA==
X-Received: by 2002:a7b:c345:0:b0:3dd:2823:e1a4 with SMTP id l5-20020a7bc345000000b003dd2823e1a4mr348904wmj.153.1675772773940;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6f0a:0:b0:2bf:ccef:53a6 with SMTP id ay10-20020a5d6f0a000000b002bfccef53a6ls21108546wrb.0.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:12 -0800 (PST)
X-Received: by 2002:adf:f584:0:b0:2be:d02:1bdd with SMTP id f4-20020adff584000000b002be0d021bddmr2537890wro.43.1675772772216;
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772772; cv=none;
        d=google.com; s=arc-20160816;
        b=DXeXI+DhFCdZzRgcZiR1avMLx3vXLJU/r96ypoop+QtfAcvPyfGWj6TLGAQsTF4dh9
         9JbM+CFmZDcESuG4suCYdZHjCxdi0MZ25Gwp9J5WuySSyH2FDvy3owXty2BCvAumVrJQ
         8fLbR3pr6iBdEx08Uyodw4gP3Y06cyHdQug6mritW4QfyhsBWSN1UnWguuQZkorOiquF
         2wR39d2Tm0pYVSt3+UMpsAgA0KBB6hPXxcbXjHtSdDc2F06JfyGRbHOk46YZk1dnixqN
         u3nRkGgHUtD9/xUvYyC2+Qcb6YjjVi7jwvKGttFWPI5pb3lGBaSDDDjuWTmfPsu/lUjK
         qrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mfEncdmaY2ojOepOV9Zpa/IBFXLdKGZ3+nX9KxgN6J4=;
        b=ed5uMTFvM08csxom0G4KLil/JiPAswDUUgI0KByoaNE4KVgasgg1ffJcKRdGYEnGS/
         +MgwQKy+3anIE+K/MZ29NBAuur7QgJR/V17vEQGPsc1jXplDciFOrddxCq+++iKNtWPo
         sJEJvMTvDMUOZWMKo6ax7AR4ZH8dHM/xzKblvb9IDm3TVdKEzUHxy6vgNvNNQXroLGB6
         J/VOSBX3B1WJUSnwB3WGX+wFRI4lp7cjnsm44rpMpJb2Ot/K8J5UkXTbCmMBKZ/lSamK
         ZQUVaBdDvcR9wJXZRrp/887B55iCHUZpT4T+GxrYD+tAhSKgTFXHhz8aWC5uUX4EWm0N
         xPHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n15-20020a05600c500f00b003d9c774d43fsi109825wmr.2.2023.02.07.04.26.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RR4sBkz1083;
	Tue,  7 Feb 2023 13:26:11 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 25/47] core: riscv: implement control.c
Date: Tue,  7 Feb 2023 13:25:21 +0100
Message-Id: <20230207122543.1128638-26-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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
[RFC v2: fix incorrect hsm state on cell reset]
---
 hypervisor/arch/riscv/control.c             | 197 ++++++++++++++++++--
 hypervisor/arch/riscv/include/asm/control.h |  13 ++
 2 files changed, 193 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index 7d4c31be..002e0610 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -2,70 +2,218 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022-2023
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
 {
-	return -ENOSYS;
+	union registers *regs;
+
+	regs = &this_cpu_data()->guest_regs;
+
+	memset(regs, 0, sizeof(union registers));
+	regs->pc = pc;
+	regs->a0 = a0;
+	regs->a1 = a1;
+
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
+{
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
+	if (pcpu->hsm.state == START_PENDING) {
+		pcpu->reset = false;
+		riscv_cpu_reset(pcpu->hsm.start_addr, pcpu->phys_id,
+				pcpu->hsm.opaque);
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
+	return paging_create(
+		&cell->arch.mm,
+		mem->flags & JAILHOUSE_MEM_COMM_REGION ?
+		paging_hvirt2phys (&cell->comm_page) : mem->phys_start,
+		mem->size, mem->virt_start,
+		PAGE_GUEST_PRESENT_FLAGS |
+		(mem->flags & JAILHOUSE_MEM_READ ? RISCV_PTE_FLAG(R) : 0) |
+		(mem->flags & JAILHOUSE_MEM_WRITE ? RISCV_PTE_FLAG(W) : 0) |
+		(mem->flags & JAILHOUSE_MEM_EXECUTE ? RISCV_PTE_FLAG(X) : 0),
+		PAGING_COHERENT |
+		(mem->flags & JAILHOUSE_MEM_NO_HUGEPAGES ? 0 : PAGING_HUGE));
 }
 
-int arch_unmap_memory_region(struct cell *cell,
-			     const struct jailhouse_memory *mem)
+int arch_unmap_memory_region(struct cell *const cell,
+			     const struct jailhouse_memory *mem_original)
 {
-	return -ENOSYS;
+	return paging_destroy(&cell->arch.mm, mem_original->virt_start,
+			      mem_original->size, PAGING_COHERENT);
 }
 
-void arch_check_events(void)
+void arch_flush_cell_vcpu_caches(struct cell *const cell)
 {
+	/*
+	 * The necessary TLB invalidation has already been performed in the
+	 * map/unmap routines. Doing it here would require the entire cell's
+	 * TLB to be flushed, because this function does not receive
+	 * information about the memory segment to invalidate. That would be
+	 * overkill (although the current unmap_region implementation does this
+	 * nonetheless, owing to other API shortcomings).
+	 */
 }
 
-void arch_flush_cell_vcpu_caches(struct cell *cell)
+int arch_cell_create(struct cell *const cell)
 {
+	struct public_per_cpu *ppc;
+	unsigned int cpu;
+
+	cell->arch.mm.root_paging = riscv_Sv39x4;
+	cell->arch.mm.root_table =
+		page_alloc_aligned(&mem_pool, CELL_ROOT_PT_PAGES);
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
+	for_each_cpu_except(cpu, &cell->cpu_set, first) {
+		pcpu = public_per_cpu(cpu);
+		pcpu->wait_for_power_on = true;
+		pcpu->hsm.state = STOPPED;
+	}
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
+	pc->park = true;
+
+	resume_cpu(cpu_id);
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
@@ -102,3 +250,18 @@ retry:
 		panic_stop();
 	}
 }
+
+void riscv_park_cpu(void)
+{
+	this_cpu_public()->hsm.state = STOPPED;
+
+	/*
+	 * When parking a HART, we let the CPU spin in a wfi loop. To avoid
+	 * that we busily spin that loop, deactivate interrupts while sitting
+	 * on the parking page.
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-26-ralf.ramsauer%40oth-regensburg.de.
