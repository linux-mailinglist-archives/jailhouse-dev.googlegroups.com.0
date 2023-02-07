Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB3EGRGPQMGQE4HZBHYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A45C68D69F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:21 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id m3-20020a2ea583000000b0029099954a31sf3517305ljp.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772780; cv=pass;
        d=google.com; s=arc-20160816;
        b=gslaVtHyqO5LXZZxEX04YbVQ+FidTjVQUBjoClFS6SrXn7rEVY5tJyDYGY0G7htqma
         rmsfPTb+BsM0Vf7YdYsoplznAIhH7tWTXGTVOSvntyT39FphC1Udnf98cELV2xLXR48k
         ZtZ+Gj1EIqCiD6KiKYvIayxynShOVLlkDmOr008NnKfEIv5VmuCm6S/+uobj06djvJEE
         wdDgxXg2SuqVfIpWtWL3L481ogJjpcXw+Vb+mEgKE117WOpAv1BCct5tYOupvgie94Ni
         eDmEOsZKUhUHF5PaxnhPyCaPTi3EusOdnNVYdY97mK+ZipPaEshzbBWJO4HM5yN2cKvo
         R8pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=eApVOi1nLKWHBJ0FEJ8dAcS5kJH8LLq2wJJ/Ma/tzOY=;
        b=T4s+gT/OiC7XYPaR/6g4SI25Rn1Jw2SadXhj4AKz+5eMuj2JabNMwixUKQwEeRT3nn
         M4UNf7BciExE1DrYm18u/1rpy4uX1YJzJPFbw+PJ6Xj5nqDvAHBL0u6m80raO8VWVGFg
         1ILPnbAzBpQJasPVvU+NK+7eji95U7SnVD1EvCpG/ENIRBosCztlPIneCqPyAhbHoWgF
         e93C4gCibPLVqYoF+hLt12ggOKaexeC6dX8i3B3kULkpFv7rk+AVwiEdNm13hrKAizsO
         Tuc11kz/EQi1/iaEgH7MnhUf5uhOIReAl3NTCNELzjxGzBjIyhciOS1svHXZWn8zbz8b
         0qYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eApVOi1nLKWHBJ0FEJ8dAcS5kJH8LLq2wJJ/Ma/tzOY=;
        b=oaBO0ivdYt4wN1ABoV02RkP4CBY33a7X2yWotJZJ6Y9cfw0CS46VwJwMsz64sgVpf3
         KXeQknPMwfbGlVAw2FDpQL/dUBDTRLoFLHvXwSUc4TW21gKDtW0vw8Gluyds2zyc3thy
         NzBytUgaKZtr/GnCEh2it/mxpp8dqamESUfRn0vd54oek4eN6xSWmlCTlgL1OJQEVVrY
         1zFcFKWeI8W+sb+HRdW3/SO+eFC3PxaWXKjdEeNqZzqpN6YhmokPbS3bDf/iS0OQPC3d
         ysdoJiwgOnUXExQ9K4b4BQj1wRJ7IaRtCDRbKSoWXrzKaGsROQELLjcvY03TqkLKINpM
         b7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eApVOi1nLKWHBJ0FEJ8dAcS5kJH8LLq2wJJ/Ma/tzOY=;
        b=2XQ4Sa0QuP18GKpiI0DCvGao1MJ1yR3ZCAoNctyVBL4g071i2JBwU8r4g8fUYZwgCX
         q2PbwmRSiUIq9w5/Q54x9dqEMel7ZdIxNMJK/wlnGK/ZN8cSe4jOMsHQCiUj6cWSVwoC
         KZ3SEzEh89oG/aMfoF7ha6sOj3PvUEwoSB/DnPcRjud1GMwHk8UYTAEZkyYKeYskh0RX
         EnsToQ5RtfkjkSWmUNJeoaAWg+6w1eGm3kzG60GX7/4aCE6Qhj8vKZXx6qxmhORzjt38
         CcY+Fxtl4J92Kk1KAYO5Y/RHSeh3ji3ADIUlw/OKrTahH9ayZXZqDJeD5+VUsGuG8SvX
         VhDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVMiydLoWFj4hdhqQyYkhVsmF7dTXfMiFw8DRSRHM82Lrm1kt9c
	rVdjU1UYKVK3V7HkIDXjiYk=
X-Google-Smtp-Source: AK7set8IVs7UDIgQVYwAxGankJ1SYjLm5g/4gHfO8+otz86HwBF7Kwh7xu+NRocSqkUCv5JA0zZ7OA==
X-Received: by 2002:ac2:5924:0:b0:4ca:fa1a:3956 with SMTP id v4-20020ac25924000000b004cafa1a3956mr403789lfi.230.1675772780792;
        Tue, 07 Feb 2023 04:26:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d1f:b0:4d1:8575:2d31 with SMTP id
 d31-20020a0565123d1f00b004d185752d31ls72306lfv.0.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:19 -0800 (PST)
X-Received: by 2002:ac2:4282:0:b0:4cc:7a44:f05f with SMTP id m2-20020ac24282000000b004cc7a44f05fmr738836lfh.31.1675772778925;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772778; cv=none;
        d=google.com; s=arc-20160816;
        b=vUmu4gB3ltGJdAS+b6OimQAgGw16D3TBjVeRK2N8qIGXjanHMOlZh32T7Cnna/kORP
         Q0kWigMaM0wl4KnGb8xamGkXZK1NgjJ//k6f6XZSSirYs6uyKHr2pegzxminGukeKPjQ
         aRYLXV+FvSYZi+sAYkn/uGbh1FtJ8verdxyLC7QYd7UzscicecLgFuR44qLczWyl14k8
         4Xl1UOGditVSFuMvXJcACNvARx6DAb1Rj9HjohliarqFgcIaxTStmw3NOhib/blovsdX
         iHksnTFiuvpjYZ0LJeuWu/IMgGGHbO/psy/VDHgeViJlpfkIfZwvOwzkMj2sQGFavwuc
         R9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=36GBmOSLYOt1HF2i06kYBC1k+EZSVfmL+4d6a0AAJQg=;
        b=08+o8khZ9jvXGMp5yyZWRyvxnQy9vvhkmSomcISvgE8EbNbTrwCaqAKHjWDzZbpkLq
         hFdn4m8gQMly8dYlMqaRelSFEyjtad7YtnGB/eBQeDeREyyRK6AiAxaIgJusV8IVwH1W
         SpbuXN5DUc5W1VB8z7S1uI47SO73xRZdBIlKqrOMJuLxlKN4JWmWib8GblaMipjrr42K
         TusCsU4gA6Y7sEASku1ULD5TOAJUY0p7JkTLgWXGM08GQlurGXVaVjaedfuGYIvSAKk7
         cSyAzeBx1CxrfZ7dLmqtpXBhgt88IDV3KUsXunM0ruUGaf0rInGHW9or9OnPbylyYGFq
         vcJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f16-20020a05651232d000b004d09f629f63si647751lfg.8.2023.02.07.04.26.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RZ0BFJz106g;
	Tue,  7 Feb 2023 13:26:18 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 45/47] core: riscv: plic: introduce vIRQ support
Date: Tue,  7 Feb 2023 13:25:41 +0100
Message-Id: <20230207122543.1128638-46-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

For demonstration purposes only.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/cell.h    |   1 +
 hypervisor/arch/riscv/include/asm/irqchip.h |  16 +++
 hypervisor/arch/riscv/include/asm/ivshmem.h |   1 +
 hypervisor/arch/riscv/include/asm/percpu.h  |   6 +-
 hypervisor/arch/riscv/irqchip.c             |  48 +++++++++
 hypervisor/arch/riscv/ivshmem.c             |  38 +++++++-
 hypervisor/arch/riscv/plic.c                | 103 +++++++++++++++++++-
 hypervisor/arch/riscv/traps.c               |   1 +
 8 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 9da228d4..8bfbef8a 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -22,6 +22,7 @@ struct arch_cell {
 	struct paging_structures mm;
 
 	u32 irq_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
+	u32 virq_present_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
index 24e8fdaf..297bd483 100644
--- a/hypervisor/arch/riscv/include/asm/irqchip.h
+++ b/hypervisor/arch/riscv/include/asm/irqchip.h
@@ -29,6 +29,11 @@ struct irqchip {
 	int (*claim_irq)(void);
 	void (*adjust_irq_target)(struct cell *cell, unsigned int irq);
 
+	void (*send_virq)(struct cell *cell, unsigned int irq);
+	void (*register_virq)(struct cell *cell, unsigned int irq);
+	void (*unregister_virq)(struct cell *cell, unsigned int irq);
+	bool (*inject_pending_virqs)(void);
+
 	void *base;
 	unsigned long pending[MAX_CPUS];
 };
@@ -82,6 +87,11 @@ static inline bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq)
 	return irq_bitmap_test(cell->arch.irq_bitmap, irq);
 }
 
+static inline bool irqchip_virq_in_cell(struct cell *cell, unsigned int irq)
+{
+	return irq_bitmap_test(cell->arch.virq_present_bitmap, irq);
+}
+
 static inline void guest_inject_ext(void)
 {
 	csr_set(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
@@ -104,4 +114,10 @@ static inline void ext_enable(void)
 
 int irqchip_set_pending(void);
 
+void irqchip_register_virq(unsigned int irq);
+void irqchip_unregister_virq(unsigned int irq);
+void irqchip_send_virq(struct cell *cell, unsigned int irq);
+void irqchip_process_pending_virqs(void);
+bool irqchip_inject_pending_virqs(void);
+
 #endif /* __ASSEMBLY__ */
diff --git a/hypervisor/arch/riscv/include/asm/ivshmem.h b/hypervisor/arch/riscv/include/asm/ivshmem.h
index 03251590..8b193947 100644
--- a/hypervisor/arch/riscv/include/asm/ivshmem.h
+++ b/hypervisor/arch/riscv/include/asm/ivshmem.h
@@ -11,4 +11,5 @@
  */
 
 struct arch_ivshmem_irq_cache {
+	u16 id[IVSHMEM_MSIX_VECTORS];
 };
diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index f57e6d57..c6dd8cb2 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -42,6 +42,10 @@ enum sbi_hart_state {
 	} hsm;								\
 	bool wait_for_power_on;						\
 	bool reset;							\
-	bool park;
+	bool park;							\
+	struct {							\
+		u32 enabled_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
+		u32 pending_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
+	} virq;
 
 #define ARCH_PERCPU_FIELDS
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
index 693c37bf..0e965bdf 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -67,6 +67,8 @@ static int irqchip_cell_init(struct cell *cell)
 			     irqchip_mmio, cell);
 
 	memset(cell->arch.irq_bitmap, 0, sizeof(cell->arch.irq_bitmap));
+	memset(cell->arch.virq_present_bitmap, 0,
+	       sizeof(cell->arch.virq_present_bitmap));
 
 	for_each_irqchip(chip, cell->config, n) {
 		/* Only support one single PLIC at the moment */
@@ -188,4 +190,50 @@ static void irqchip_cell_exit(struct cell *cell)
 				chip->pin_bitmap[pos];
 }
 
+void irqchip_send_virq(struct cell *cell, unsigned int irq)
+{
+	//printk("sending vIRQ %u from %s to %s\n", irq, this_cell()->config->name, cell->config->name);
+	irqchip.send_virq(cell, irq);
+}
+
+void irqchip_register_virq(unsigned int irq)
+{
+	struct cell *cell = this_cell();
+
+	if (irqchip_irq_in_cell(cell, irq)) {
+		printk("FATAL: irqchip: Unable to register vIRQ %u\n", irq);
+		panic_stop();
+	}
+
+	irqchip.register_virq(cell, irq);
+}
+
+void irqchip_unregister_virq(unsigned int irq)
+{
+	irqchip.unregister_virq(this_cell(), irq);
+}
+
+bool irqchip_inject_pending_virqs(void)
+{
+	return irqchip.inject_pending_virqs();
+}
+
+void irqchip_process_pending_virqs(void)
+{
+	/*
+	 * We can only inject IRQs if there's no other IRQ waiting. No problem:
+	 * If other IRQs are currently being handled, the cell must somewhen
+	 * acknowledge the interrupt. On acknowledgement, this routine is
+	 * called again, so we won't miss the IRQ.
+	 */
+	if (guest_ext_pending())
+		return;
+
+	if (!irqchip_inject_pending_virqs())
+		return;
+
+	ext_disable();
+	guest_inject_ext();
+}
+
 DEFINE_UNIT(irqchip, "RISC-V irqchip");
diff --git a/hypervisor/arch/riscv/ivshmem.c b/hypervisor/arch/riscv/ivshmem.c
index e5dd7973..e459a45b 100644
--- a/hypervisor/arch/riscv/ivshmem.c
+++ b/hypervisor/arch/riscv/ivshmem.c
@@ -1,21 +1,37 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2016-2019
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/entry.h>
+#include <jailhouse/control.h>
 #include <jailhouse/ivshmem.h>
+#include <jailhouse/cell.h>
+#include <asm/processor.h>
+#include <asm/irqchip.h>
 
 void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 				    unsigned int vector)
 {
+	unsigned int irq_id = ive->irq_cache.id[vector];
+
+	if (irq_id) {
+		/*
+		 * Ensure that all data written by the sending guest is visible
+		 * to the target before triggering the interrupt.
+		 */
+		memory_barrier();
+
+		irqchip_send_virq(ive->device->cell, irq_id);
+	}
 }
 
 int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
@@ -26,4 +42,22 @@ int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
 
 void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 {
+	u8 pin = ive->cspace[PCI_CFG_INT/4] >> 8;
+	struct pci_device *device = ive->device;
+	unsigned int virq;
+
+	/*
+	 * Lock used as barrier, ensuring all interrupts triggered after return
+	 * use the new setting.
+	 */
+	virq = device->cell->config->vpci_irq_base + pin - 1;
+	spin_lock(&ive->irq_lock);
+	if (enabled) {
+		ive->irq_cache.id[0] = virq;
+		irqchip_register_virq(virq);
+	} else {
+		ive->irq_cache.id[0] = 0;
+		irqchip_unregister_virq(virq);
+	}
+	spin_unlock(&ive->irq_lock);
 }
diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
index 2c820c96..8422111a 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -146,6 +146,7 @@ static inline void plic_passthru(const struct mmio_access *access)
 static inline enum mmio_result
 plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 {
+	/* clear pending bit */
 	if (!access->is_write) {
 		access->value = irqchip.pending[hart];
 		return MMIO_HANDLED;
@@ -158,7 +159,9 @@ plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 		return MMIO_ERROR;
 	}
 
-	plic_write(access->address, access->value);
+	/* TODO: vIRQ could have been disabled before acknowledgement */
+	if (!irq_bitmap_test(this_cell()->arch.virq_present_bitmap, access->value))
+		plic_write(access->address, access->value);
 
 	/* Check if there's another physical IRQ pending */
 	/* TODO: This is where we would need to prioritise vIRQs */
@@ -166,6 +169,11 @@ plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 	if (irqchip.pending[hart])
 		return MMIO_HANDLED;
 
+	/* TODO: vIRQ has the lowest prio at the moment */
+	irqchip_inject_pending_virqs();
+	if (irqchip.pending[hart])
+		return MMIO_HANDLED;
+
 	guest_clear_ext();
 	ext_enable();
 
@@ -226,6 +234,12 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 	irq = access->address / IRQCHIP_REG_SZ;
 
+	if (irqchip_virq_in_cell(this_cell(), irq)) {
+		// TODO: Allow priorities
+		printk("PLIC: virq priorities not supported!\n");
+		return MMIO_HANDLED;
+	}
+
 	/*
 	 * When booting non-root Linux, it will set priorities of all IRQs.
 	 * Hence, simply ignore non-allowed writes instead of crashing the
@@ -247,8 +261,8 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 static enum mmio_result plic_handle_enable(struct mmio_access *access)
 {
+	u32 *virq_enabled, irq_allowed_bitmap, virq_allowed_bitmap;
 	struct public_per_cpu *pc;
-	u32 irq_allowed_bitmap;
 	unsigned int idx, cpu;
 	short int ctx;
 
@@ -273,20 +287,28 @@ allowed:
 	 */
 	idx = ((access->address - PLIC_ENABLE_BASE) % PLIC_ENABLE_OFF)
 		* 8 / IRQCHIP_BITS_PER_REG;
+	// TODO: Should this be locked? virq_allowed_bitmap could be changed
+	// during execution
+	virq_enabled = &pc->virq.enabled_bitmap[idx];
 
 	if (!access->is_write) {
-		access->value = plic_read(access->address);
+		access->value = plic_read(access->address) | *virq_enabled;
 		return MMIO_HANDLED;
 	}
 
 	/* write case */
 	irq_allowed_bitmap = this_cell()->arch.irq_bitmap[idx];
+	virq_allowed_bitmap = this_cell()->arch.virq_present_bitmap[idx];
 
-	if (access->value & ~irq_allowed_bitmap) {
+	if (access->value & ~(irq_allowed_bitmap | virq_allowed_bitmap)) {
 		printk("FATAL: Cell enabled non-assigned IRQ\n");
 		return MMIO_ERROR;
 	}
 
+	*virq_enabled = access->value & virq_allowed_bitmap;
+
+	/* Only forward physical IRQs to the PLIC */
+	access->value &= irq_allowed_bitmap;
 	plic_passthru(access);
 
 	return MMIO_HANDLED;
@@ -365,9 +387,82 @@ cont:
 	}
 }
 
+static void plic_send_virq(struct cell *cell, unsigned int irq)
+{
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq)) {
+		printk("vIRQ not present in destination\n");
+		return;
+	}
+
+	// Do we need to lock this section? A vIRQ could be disabled during injection
+	for_each_cpu(cpu, &cell->cpu_set) {
+		pcpu = public_per_cpu(cpu);
+		if (irq_bitmap_test(pcpu->virq.enabled_bitmap, irq)) {
+			irq_bitmap_set(pcpu->virq.pending_bitmap, irq);
+			memory_barrier();
+			arch_send_event(pcpu);
+			break;
+		}
+	}
+}
+
+static void plic_register_virq(struct cell *cell, unsigned int irq)
+{
+	irq_bitmap_set(cell->arch.virq_present_bitmap, irq);
+}
+
+static void plic_unregister_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int cpu;
+
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq))
+		return;
+
+	irq_bitmap_clear(cell->arch.virq_present_bitmap, irq);
+	for_each_cpu(cpu, &cell->cpu_set)
+		irq_bitmap_clear(public_per_cpu(cpu)->virq.enabled_bitmap, irq);
+}
+
+static bool plic_inject_pending_virqs(void)
+{
+	struct public_per_cpu *pcpu = this_cpu_public();
+	u32 idx, irq = 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(pcpu->virq.pending_bitmap); idx++) {
+		irq = pcpu->virq.pending_bitmap[idx];
+		if (!irq)
+			continue;
+
+		/*
+		 * FIXME: For the moment, simply inject the first pending IRQ.
+		 * Later, we need to prioritise those IRQs. Haha. Per call of
+		 * this routine, we can only inject ONE single IRQ. That's not
+		 * an issue, as the guest will trap again after acknowledging
+		 * the last irq. So there will be no misses of pending IRQs.
+		 */
+
+		irq = ffsl(irq) + idx * 32;
+
+		irqchip.pending[pcpu->phys_id] = irq;
+
+		irq_bitmap_clear(pcpu->virq.pending_bitmap, irq);
+		return true;
+	}
+
+	return false;
+}
+
 const struct irqchip irqchip_plic = {
 	.init = plic_init,
 	.claim_irq = plic_claim_irq,
 	.adjust_irq_target = plic_adjust_irq_target,
 	.mmio_handler = plic_handler,
+
+	.send_virq = plic_send_virq,
+	.register_virq = plic_register_virq,
+	.unregister_virq = plic_unregister_virq,
+	.inject_pending_virqs = plic_inject_pending_virqs,
 };
diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index de29288a..77a6cd23 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -155,6 +155,7 @@ static int handle_ipi(void)
 	 * IPI is acknowledged here, as from now on, further IPIs might already
 	 * be sent by remote CPUs.
 	 */
+	irqchip_process_pending_virqs();
 	spin_unlock(&pcpu->control_lock);
 
 	if (check_events)
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-46-ralf.ramsauer%40oth-regensburg.de.
