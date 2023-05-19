Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWF5T6RQMGQE43GKZHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74670A0E1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:57 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f420742d40sf13582045e9.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528857; cv=pass;
        d=google.com; s=arc-20160816;
        b=qnghAKqrRx97TgsUEIVoxoio2zxiEM7XsYM1hq8l5GptXn9NSYnQi5XUiJJeg8LwCX
         TTq8OTRtsb9ldPckytTVtVCkFA1lDZxRbT2Abh9WjAd9zexYTzqOfaIkXUnet82Ggwel
         1yjfpcfa+0/SRar1QMNoio9moNHXn8wPCmSpi8agrKHpasIuuv48dxMuuQvxtxHAGdOQ
         qtpXkXFgqyM/mBc/KYKX0tCLzv7KgErCQmnT2imdFLAlRtgxocPPh4GNGX7VwPfZgkCQ
         y9UPzgyfEwPBeXHSkJUHNXtqxujIvHvt16WjcuJqdGdb05xIZ7Swy+hGoATcrvwY6H4Q
         0JQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/H7Zcg0Lp4xH5n14mx1U7ZQdUVPvaKtB5W9s/hJdA8E=;
        b=iEoUZ9FboZKB7BGGZfcCbx8wq2uTFT8nevkDFTm9Tv72dBKfrEHNuK56Ux1bS3pqd/
         tnE/wAoGMmOJH40YY4ZSCAJeYRWyyBDyXkKeFBvOTRjZD8pM4NyX/5c8RieSTzW6nbzI
         o8VXc+4ScOkJBwYR4nvVibfexIG/DNHhi6Oz39rsK32V/dhWJALcVgNtufIkUNA5tSO0
         mu7zr53FRJ4rUjBYIW+hcluZP+2X7K3kn1SSWhiLKLcpKF2zb6OwfnmPSKDF0fwicOQ/
         1Qae6eFKPW5gKuB8FbNw2gOEAGbIUOrn5AOEU8pB1nySxcu0xcAf/isvwh5TmYMf+zBB
         hwGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H7Zcg0Lp4xH5n14mx1U7ZQdUVPvaKtB5W9s/hJdA8E=;
        b=sGxMtXZPJMl/xRGVxl0KQK03SYa3Oqd6QgeryJtGQ7WAsvR87cnxXBDEbNGPjslyL1
         yA1qkkMz7zg45h1MqvrpoMSquqn47AWEJ4magAUaq9cGZFrzw4EDWTotLX8fFGI+8g0j
         VYwkLIcsmkeVyzYbyKXDMO1lzEKGy5GrmCpLOXwEWqvUNwkR3mNuc+K8wirxszAPIGS9
         j/Ss0ZLLgzPG/yWhfQFC9UTVn7T5N8T5zso7ckpyY8+eMBF9vXa8cV4oLhYwUi7dl9KU
         igcbnmplc4+mMY6lrSA5YSwA76gy8jym5CGUM+V65p0cWXslSViaB7e93V2D5NxKOnOF
         7erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H7Zcg0Lp4xH5n14mx1U7ZQdUVPvaKtB5W9s/hJdA8E=;
        b=iPLromeMCrhpJXyFHzlMqeBjXZ1XpPfsVPu0AOFbcolgnIsDKzpZ3epFNJ4Ipn8uM9
         6jTqM0uNBeC6xOHq40dNtQdiE9mKODAmOY9kH4XX5qVEQFhrXSMfxCiy1FzT9W19WcT9
         kqVPONePKmK8X9berntMkgMfvqEY3IkWMyYmn85EM+xDbhKPeunbAv58WtvIPO1ggW5c
         R0n9Bvrv/zWNAExYgvY2DkwIm+Yf8fUyFT9LGnq5UYQvO4ALBhtIa/VrnECXh4er1k/N
         9cBFnferEea5iIukMhh59MjPkOI1bdG0Qxkuk6A+8fpRk543otDG+aA0eCJMxMpl3hFj
         J7gA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDykfBPU5CTMnnW1hqNN9eIeZUcovVWP3/jz9BQtoG4jLpxL0U6g
	VYffxHNrIozidS1kQYJPw4tEig==
X-Google-Smtp-Source: ACHHUZ7MUi2Q5dvXml2K0zyNuJV/vWbaqq4qAvc+srGNKMy8cmeUlsz2dym0sxNJzRbdpaXLvhHAOA==
X-Received: by 2002:adf:dd89:0:b0:307:8681:a1f7 with SMTP id x9-20020adfdd89000000b003078681a1f7mr411162wrl.11.1684528857185;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b27:b0:3f5:dbda:d09f with SMTP id
 m39-20020a05600c3b2700b003f5dbdad09fls632615wms.1.-pod-prod-02-eu; Fri, 19
 May 2023 13:40:55 -0700 (PDT)
X-Received: by 2002:a05:600c:293:b0:3f5:170:30a1 with SMTP id 19-20020a05600c029300b003f5017030a1mr2092389wmk.23.1684528855375;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528855; cv=none;
        d=google.com; s=arc-20160816;
        b=rRwXrqBb4wm4NuS33JGfi3JhhhTnThY/Pjft7wNR2jpKhpKjteJFxY0OKh9VlzBrfU
         4/sySL3U3tBlthT12OkuKHK3C/CSl5FxH/fYhIpQUVEugaR9Zoz9qgw9Ck+DWDPlfW78
         buriqfnyLUOqhx7GzeaZB/aktnzYgc9oKF0Plj5m0tZMcZxaFMrSaSLIP4aI9SH3Grou
         npBdr9+Pef4RlaTfLbUyS9O2WNVLZklJCtPw6JanSNlCYUGg4bMkiBN/bmPHrlJk1Zct
         cOEwv2GfgeL7sx3AIr7PGc9NXYwYjZNxhtRJtjKqJIjuRS31sCXc1fItAWQXPinKdhq6
         vV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=EkWEi6tFq1CoQYiLzQhuTyUiigRHPb6UIuI5RnZj1/c=;
        b=MgM/9vA6/Cur+oY4I0vpM1k0Qoxc+r6uRLnYwtOyDgLIzyU6Nr1khmP4izYXzmuJlv
         ylbovbh6Qz78FZlS6PdtTVWE1SINTRDHuy5I9pp1MxinqoQLR7kLYPzGQ2cg00GhqF6G
         oBKlcoWRYUBpyKjPTciSox11FDHhL/1qaeK3R59RS4DQYRS0/1yycoUp4wEqC5QgHiqe
         ABsIdEtcywBDHioGAdtJCj/aUEvNLUF1pFLJh+F3k+oiynU+vjL2iw/GlxTLRIK1bwYZ
         6koOeFw/gP+Uq0Fc22ujVDYcV0psWxR1bBR5N5QhAg07AC+O2BZAKkGA/RDaC6eHdixg
         uf6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id he3-20020a05600c540300b003f42c1b8171si18600wmb.0.2023.05.19.13.40.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdf4b8zzxrD;
	Fri, 19 May 2023 22:40:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 46/73] core: riscv: implement control.c
Date: Fri, 19 May 2023 22:40:06 +0200
Message-Id: <20230519204033.643200-47-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
[since RFC v1: fix incorrect hsm state on cell reset]
[since RFC v2: fix parking state]
---
 hypervisor/arch/riscv/control.c             | 200 ++++++++++++++++++--
 hypervisor/arch/riscv/include/asm/control.h |  13 ++
 2 files changed, 196 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index 7d4c31be..cc3ebcb2 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -2,70 +2,221 @@
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
+#include <asm/irqchip.h>
 #include <asm/sbi.h>
 
-int arch_cell_create(struct cell *cell)
+extern void __attribute__((noreturn)) riscv_park_loop(void);
+
+static void riscv_cpu_reset(unsigned long pc, unsigned long a0,
+			    unsigned long a1)
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
+	pcpu->park = false;
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
+	ext_disable();
+	riscv_park_cpu();
 }
 
 void arch_send_event(struct public_per_cpu *target_data)
@@ -102,3 +253,18 @@ retry:
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-47-ralf.ramsauer%40oth-regensburg.de.
