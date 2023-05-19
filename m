Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYV5T6RQMGQE7TZYGFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAD870A0F2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:07 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id ffacd0b85a97d-30953bcb997sf487322f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528867; cv=pass;
        d=google.com; s=arc-20160816;
        b=gQGf9ZsdUva8X9J94UmloXN2n+7bfGGyUZ7dD4jMm+PBTLEUsQo9d7mPTHntrsx67E
         Owv5qgqT8bOopDtPUxRjpe5fFmGjo6HBJ7m8U1LaX94xq/TAMH2QXHP644GfNS9VyZ16
         Dq42jb1nBc13X8Bt1yPHo8nl/lKmWm8B2ITZE4Dj4gySwsFH1zZ/uRP6MARYIpkRlESb
         BdGeMmQF7PnxXSiTwo0ncOwShE5wyz6HNjbsQUAY8X7e5fXgvX/3dnfeG1fHxWuyu39t
         vMZ+ESBBS3fb4xClSzQu1DYiah/zR0nHmdlPKDD0u90EtEssBFxlPrONKuP1qtvZ+vos
         80vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/vzAKCEFYgoHBAaiVigbzFTKQsdN19hm6xlg78rFcbE=;
        b=EkBV+I0SIlFrl4AJev5LxAd6xsVLHtZeGNd50NNEfzbiRIJyhvpL5vgIZvjnGQyouO
         XdeMk9Repv5ye+LDxfD2sa+dju5lg1+jGc97E3bdT2dwr4PoKr6KBULdDluZ3bT9WdMK
         iEh2inCLPo+WpYtV3T+sDxshAHS4iTmIiF15zjL6OtXRSOpMYixuZN0immLUlArxfnLq
         /aYEVCXTH9IGMdCfP6x3I2xXWlbvRBnUadivdKAUgbARJIbrrGe/kXDsN1nHElfaf/bY
         7lmEJHFrEsAgVAS34Y/7RciEncW/ovp7Hc70BFD11RUiiprdJ9+xyaggNL/9umBoK3h9
         eanQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528867; x=1687120867;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vzAKCEFYgoHBAaiVigbzFTKQsdN19hm6xlg78rFcbE=;
        b=KfUM17UtS6wFhR3qQzq8o2qs4s8M7hCvC+9qTuZGsVYy/vOgA2g+ysUkDEkQU4K6nf
         BnS84hhpjb0Nsc2OhBh3RXQz+XWOx5Tk8lP+Zia7u3ZNn6KIeU4506pg2k+ZHyuDdH+2
         qHQ6XF0QajBmloXQ8spE2Zi9N1uua4X/uhn+h9ijkKTbVmab/Q1CELdljGFFRVh1Q1yI
         ZriBFPnjWUarog0nVAQhvZ2uDY0dsLk3Hdo5htuqEF4owlvUrb72ZaIEWKjFQmvBYsp0
         YdYRl/YB5vgEy7nYhvJGTJTEwt24EgNbby15DqJVgyPETdJ/rd5VcWPkF1+Yrekg4uEo
         IiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528867; x=1687120867;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vzAKCEFYgoHBAaiVigbzFTKQsdN19hm6xlg78rFcbE=;
        b=OwI28RBcBe/u5gS8R5D4TgELkE/5bfjZkV6Q8UvHdtdpxZCrmrcFB+VtI7Ju/r520g
         j9w4DSk1eTnnfwOvnBP7GfbwWIOnINTOyaJLiW9LUYrM+byP+LseG3HD95h57+KPzWzO
         3LsjDZmdcUVhx/5kIoyQvK1/C6lxC6l5aMDG/ZaJCtT+y/oI9kNxaHUslutgqJ+pJWuf
         UCS5+fnv236MyPql7r8jtMGZdXLaBcogsy+1BCdUcK79xzpPbGvR6aXIUtYjvUYfCnT9
         1MMOA6mE4DqKXhO4+g6cQo7D9HXcDxgCOj5SmRigkyWmv1Mb4O4wo6yJI6pzrO/MqHvs
         dNQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz5slzOE76ex0fF+0RBcRzair9zzIQijLA/gaSU2RzjOT1epZec
	8oq37dvplqpHJOaoM7Q39Ck=
X-Google-Smtp-Source: ACHHUZ4tzouqk0V24K2R2MELlm1kRx+/PZ9azl2W8OJpbQhdYAat40e5vDYFDYbjaxuHTDf3hR1fuA==
X-Received: by 2002:adf:e70b:0:b0:309:4227:829b with SMTP id c11-20020adfe70b000000b003094227829bmr449427wrm.8.1684528866993;
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b0a:b0:3f1:6946:24dd with SMTP id
 m10-20020a05600c3b0a00b003f1694624ddls1877574wms.0.-pod-prod-09-eu; Fri, 19
 May 2023 13:41:05 -0700 (PDT)
X-Received: by 2002:a05:600c:2102:b0:3f4:23e5:5bb0 with SMTP id u2-20020a05600c210200b003f423e55bb0mr2253541wml.5.1684528865330;
        Fri, 19 May 2023 13:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528865; cv=none;
        d=google.com; s=arc-20160816;
        b=HcQIijkLYwnldgG8Tir3/Xl32J1G4iV9eZfNJWHfrnOkkjjq9DqVB+EFyQ0qOGPCzK
         k/FWLCAHG3QOfePjivAkgxgl71+ZApLDtHFszXKz/AypNC8XjdxecZ3BbimHWpjw6iiH
         cGUIcqMRFfJHVPH6SZVBT/Ql8cPH3ofsXDcTzTK4U9Jm5ZZkEyHxj/Kz5kV1FEVxxjnj
         +hd0MgsuCqL65YXwAWx/64aqy0gvM5CqY6LyWycymcnLL9XrbjPqPTPGTwBHsuwRN8f3
         6GH+BbvyLYyYHGkYLipkqJDz+cZxTiY3up1zDGrrDTNB/DJH59s2SSQWQltAHhaA7L7I
         iIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=qdy8YkHBLML++UxcNSdqp8RZ1vC8Enb65jO+GEiOJww=;
        b=xYwDaCqleRL0L2yaeUOOavJR2ecV1D41FxwXQZr9trwXjUzuKkW/dtPdT5GUdmHiQc
         GD7yPcreV3sEiMOnjAvl3wjS1vzbc3Yvh69GX3NAI6JwHRVXOW2F8aQD4z7HxQ8Ctikx
         wOyBbT7cZqBzwCn88ni6NN2ov/0PmHWbrphCUKjMpuNnWmuSHIv3Z15ag1fS8DXhN3Jv
         4Ox47GgleM9dCFEJKarwM/tLaKI9f9ilQOcKJ/cLWctTcIYLHjkADuz21g99asWcrhu2
         6PT0Nh7GbXd3JLmLvxbDJZoKQzaE4VKncX5p/UVOkZ4zQfYs7V7jtB7Lu6c42lT/r3Gz
         CdOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p31-20020a05600c1d9f00b003f16ecd5e6esi612927wms.4.2023.05.19.13.41.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdr0vx3zyN4;
	Fri, 19 May 2023 22:41:04 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 64/73] core: riscv: plic: introduce vIRQ support
Date: Fri, 19 May 2023 22:40:24 +0200
Message-Id: <20230519204033.643200-65-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SHIPPING_PHRASE 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

For demonstration purposes only.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c             |   2 +
 hypervisor/arch/riscv/include/asm/cell.h    |   3 +
 hypervisor/arch/riscv/include/asm/irqchip.h |  16 +++
 hypervisor/arch/riscv/include/asm/ivshmem.h |   1 +
 hypervisor/arch/riscv/include/asm/percpu.h  |   6 +-
 hypervisor/arch/riscv/irqchip.c             |  54 ++++++++
 hypervisor/arch/riscv/ivshmem.c             |  38 +++++-
 hypervisor/arch/riscv/plic.c                | 134 ++++++++++++++++++--
 hypervisor/arch/riscv/traps.c               |   1 +
 9 files changed, 244 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index cc3ebcb2..fbd8e81d 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -141,6 +141,8 @@ int arch_cell_create(struct cell *const cell)
 		ppc->reset = false;
 	}
 
+	spin_init(&cell->arch.virq_lock);
+
 	if (!cell->arch.mm.root_table)
 		return -ENOMEM;
 
diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 9da228d4..ee3fd892 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -17,11 +17,14 @@
 
 #include <jailhouse/paging.h>
 #include <jailhouse/types.h>
+#include <asm/spinlock.h>
 
 struct arch_cell {
 	struct paging_structures mm;
 
 	u32 irq_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
+	u32 virq_present_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
+	spinlock_t virq_lock;
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
index 5183f5de..6afdac5c 100644
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
@@ -82,6 +87,17 @@ static inline bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq)
 	return irq_bitmap_test(cell->arch.irq_bitmap, irq);
 }
 
+static inline bool irqchip_virq_in_cell(struct cell *cell, unsigned int irq)
+{
+	return irq_bitmap_test(cell->arch.virq_present_bitmap, irq);
+}
+
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
index 693c37bf..9834dcee 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -67,6 +67,8 @@ static int irqchip_cell_init(struct cell *cell)
 			     irqchip_mmio, cell);
 
 	memset(cell->arch.irq_bitmap, 0, sizeof(cell->arch.irq_bitmap));
+	memset(cell->arch.virq_present_bitmap, 0,
+	       sizeof(cell->arch.virq_present_bitmap));
 
 	for_each_irqchip(chip, cell->config, n) {
 		/* Only support one single PLIC at the moment */
@@ -188,4 +190,56 @@ static void irqchip_cell_exit(struct cell *cell)
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
+	bool ret;
+
+	spin_lock(&this_cell()->arch.virq_lock);
+	ret = irqchip.inject_pending_virqs();
+	spin_unlock(&this_cell()->arch.virq_lock);
+
+	return ret;
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
index 4f4b64fc..30abe7d9 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -141,9 +141,40 @@ static inline void plic_passthru(const struct mmio_access *access)
 	plic_write(access->address, access->value);
 }
 
+/* We must arrive here with the virq lock held */
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
 static inline enum mmio_result
 plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 {
+	/* clear pending bit */
 	if (!access->is_write) {
 		access->value = irqchip.pending[hart];
 		return MMIO_HANDLED;
@@ -156,17 +187,26 @@ plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 		return MMIO_ERROR;
 	}
 
-	plic_write(access->address, access->value);
+	spin_lock(&this_cell()->arch.virq_lock);
+	if (!irq_bitmap_test(this_cell()->arch.virq_present_bitmap, access->value))
+		plic_write(access->address, access->value);
 
 	/* Check if there's another physical IRQ pending */
 	/* TODO: This is where we would need to prioritise vIRQs */
 	irqchip.pending[hart] = plic_read(access->address);
 	if (irqchip.pending[hart])
-		return MMIO_HANDLED;
+		goto out;
+
+	/* TODO: vIRQ has the lowest prio at the moment */
+	plic_inject_pending_virqs();
+	if (irqchip.pending[hart])
+		goto out;
 
 	guest_clear_ext();
 	ext_enable();
 
+out:
+	spin_unlock(&this_cell()->arch.virq_lock);
 	return MMIO_HANDLED;
 }
 
@@ -224,6 +264,12 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
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
@@ -245,9 +291,10 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 static enum mmio_result plic_handle_enable(struct mmio_access *access)
 {
+	u32 *virq_enabled, irq_allowed_bitmap, virq_allowed_bitmap;
 	struct public_per_cpu *pc;
-	u32 irq_allowed_bitmap;
 	unsigned int idx, cpu;
+	enum mmio_result res;
 	short int ctx;
 
 	ctx = (access->address - PLIC_ENABLE_BASE) / PLIC_ENABLE_OFF;
@@ -272,22 +319,35 @@ allowed:
 	idx = ((access->address - PLIC_ENABLE_BASE) % PLIC_ENABLE_OFF)
 		* 8 / IRQCHIP_BITS_PER_REG;
 
+	spin_lock(&this_cell()->arch.virq_lock);
+	virq_enabled = &pc->virq.enabled_bitmap[idx];
+
 	if (!access->is_write) {
-		access->value = plic_read(access->address);
-		return MMIO_HANDLED;
+		access->value = plic_read(access->address) | *virq_enabled;
+		res = MMIO_HANDLED;
+		goto out;
 	}
 
 	/* write case */
 	irq_allowed_bitmap = this_cell()->arch.irq_bitmap[idx];
+	virq_allowed_bitmap = this_cell()->arch.virq_present_bitmap[idx];
 
-	if (access->value & ~irq_allowed_bitmap) {
+	if (access->value & ~(irq_allowed_bitmap | virq_allowed_bitmap)) {
 		printk("FATAL: Cell enabled non-assigned IRQ\n");
-		return MMIO_ERROR;
+		res = MMIO_ERROR;
+		goto out;
 	}
 
+	*virq_enabled = access->value & virq_allowed_bitmap;
+
+	/* Only forward physical IRQs to the PLIC */
+	access->value &= irq_allowed_bitmap;
 	plic_passthru(access);
+	res = MMIO_HANDLED;
 
-	return MMIO_HANDLED;
+out:
+	spin_unlock(&this_cell()->arch.virq_lock);
+	return res;
 }
 
 static enum mmio_result plic_handler(void *arg, struct mmio_access *access)
@@ -364,9 +424,67 @@ cont:
 	}
 }
 
+static void plic_send_virq(struct cell *cell, unsigned int irq)
+{
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+
+	spin_lock(&cell->arch.virq_lock);
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq)) {
+		printk("vIRQ not present in destination\n");
+		goto out;
+	}
+
+	for_each_cpu(cpu, &cell->cpu_set) {
+		pcpu = public_per_cpu(cpu);
+		if (irq_bitmap_test(pcpu->virq.enabled_bitmap, irq)) {
+			irq_bitmap_set(pcpu->virq.pending_bitmap, irq);
+			memory_barrier();
+			arch_send_event(pcpu);
+			break;
+		}
+	}
+
+out:
+	spin_unlock(&cell->arch.virq_lock);
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
+	struct public_per_cpu *pcpu;
+
+	spin_lock(&cell->arch.virq_lock);
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq))
+		goto out;
+
+	irq_bitmap_clear(cell->arch.virq_present_bitmap, irq);
+	for_each_cpu(cpu, &cell->cpu_set) {
+		pcpu = public_per_cpu(cpu);
+		irq_bitmap_clear(pcpu->virq.enabled_bitmap, irq);
+		irq_bitmap_clear(pcpu->virq.pending_bitmap, irq);
+
+		if (irqchip.pending[pcpu->phys_id] == irq)
+			irqchip.pending[pcpu->phys_id] = 0;
+	}
+
+out:
+	spin_unlock(&cell->arch.virq_lock);
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
index cccc47c7..3cc82371 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -175,6 +175,7 @@ static inline int handle_ipi(void)
 	 * IPI is acknowledged here, as from now on, further IPIs might already
 	 * be sent by remote CPUs.
 	 */
+	irqchip_process_pending_virqs();
 	spin_unlock(&pcpu->control_lock);
 
 	if (check_events)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-65-ralf.ramsauer%40oth-regensburg.de.
