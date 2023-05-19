Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWV5T6RQMGQENKOBQFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441470A0E4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:59 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id 4fb4d7f45d1cf-511b509b55bsf1037337a12.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528858; cv=pass;
        d=google.com; s=arc-20160816;
        b=nSKz+XO2Gyr5vDxKuIciYIlbappeCY3O7Up9yG1rfSLivP1WNokC9IsU1jSVfKSdVv
         zGcyYb8S4GN0mMHSyg6HF2jm3bj8nLHP6McStWiHYmSgNdhLnlQT4be/wpmrTgYEvrrx
         SNmBm0rZhC9V2EFctL8c77m255wpYlYv5XHA25XOab4Zk9/nJeyDQIZcKiNVaBZ6Ee9g
         YiqXGzvKZd0+eReUKOvlKFgeVOKvE0Du5fgP4K/3VpYRDijUR19XGzom+y6pcdhryZER
         c9b/DFtfrcbEJ6Z5q2Oqiy5EPkJQZmI4WQ+UL/W7l1ffvXGDsdh6MO2/PHaTx3LZOqyu
         iHyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Wq9prRTRbNRu5EUL9tOd1cQYnLKoNj3Icwy6xnucEos=;
        b=RXHx5v2b48DzYUP/e7a0+RazU2uzlM4RsmfbfbbF9JsBGoZ7KG2oeVk3gKjdoknyBu
         dWHnDms9SQplV+GqU5LHCdJ+X/5kSce4Y+h/xoQ500xxWeG59kyif9mdiuTU2QWcujCg
         acbwQ3xoVl/VokY7DX4H9tbB17sOWdrbjqJw09jI0gQ3VNZ8Fpim52jO5PjJzxaTNjsH
         E4P3dX2Mn0p52QOLkTozxPX+LRH6B+vpQjk0qdwFIks2Hrmdqkapuic0j0fMpkO4puec
         Q3JPEy2KX+ho2kgG/ifpwb+mLS6M7Q3ePXNR6nNCVoSJKyU4+Oc3tpG0G6qDzcLDRm2B
         6E2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq9prRTRbNRu5EUL9tOd1cQYnLKoNj3Icwy6xnucEos=;
        b=fos/gPe7/+zFhhEG8G7WaBEs9/VQsQLnUAgKLJ39rWm14FStVTinu478oWfOPUbOZA
         gKubGbSqkWjTCu6lI8Qq0RJRfmixOwz0Xdj9uv11jdyEtm57vWpLXPw1CR0pAwIU7/G5
         0VZgfz80IN1ejpvkxG5upcXb1B/2opMQrvrLQ0vq3002umBhX/XnhyHLmrOV54WJApA6
         IgxowtRhHxBWQ4X2duykf0G0mXTF98be30+WWJfcqTjkw+nV0R6revhiHVMLkxgnUdsU
         LFFcoxVjS8hrnFh7CNNsR8V9FtW+onSMz24u37pR52Ya52ywNzeQXR6ad0564rdBX3p0
         oJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq9prRTRbNRu5EUL9tOd1cQYnLKoNj3Icwy6xnucEos=;
        b=Dy+k/8dQFaQYSotj31FS47tFYdLH1YXfeAyA3nR2cuoh8Orl7dnSI0p0mVcBwxV0KW
         APslobbudbbM+6vCGTZE6rrqp5h2B4QRW0E4C3UUMTl6OnUOZdVoL6uAOS4bxxVatfzJ
         QWK3B+P5zxgAr8Iehl9Q+Cn0i+NYKe8FLAmvb2rk3Ek9kORTKgjuwtadXZEeV3KWCg7e
         Oe+G3pJYEuvedYOs2sQ99FGqNKPdUCmYV5dvPVsNTae3NQ5ho2TGN1FvpdJuYjECRmNT
         EmCagVXddpx8XGdqJuhUTCRb4LbBY7FavevUHfvrISM+o8KZXERjxod3cZpKfyxn542j
         /nqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxXo+QLBMdhiu3QArnC7eevRTeOWyuZ6WB8a+D4/9/lokTRfeQv
	+vtBWdJ6mVf4RTsF7WUpK4g=
X-Google-Smtp-Source: ACHHUZ7FtoW4X1OZ8AbOPPik2smurvUJCs3gQziH3YYjnfcElciHeuup1DFQoqGxra2HWjxzD3fduw==
X-Received: by 2002:a17:907:75e8:b0:969:d495:c6c with SMTP id jz8-20020a17090775e800b00969d4950c6cmr936250ejc.14.1684528858560;
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d894:0:b0:50b:c6d7:3964 with SMTP id u20-20020aa7d894000000b0050bc6d73964ls6177411edq.0.-pod-prod-09-eu;
 Fri, 19 May 2023 13:40:56 -0700 (PDT)
X-Received: by 2002:a05:6402:2047:b0:50b:cbac:93e5 with SMTP id bc7-20020a056402204700b0050bcbac93e5mr2705178edb.35.1684528856693;
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528856; cv=none;
        d=google.com; s=arc-20160816;
        b=vAwBtdweVXIQu1U3A/afrwFfR9AMEs0jb3kF2im4vwQ4PUE8GEJVQKE3CS2JhC4Xzb
         eCafLyVIqcGj7b2dhjUcivBcF8uzq94KgTaDVivjc5Tu3AjQ90vnMR90vv5RIVQw5v/6
         8JJSxio93smOEmnGK1ZVtj0J8BJCFBvBhu+NRQu/DDN3jz4wWW9pffyuCZxAKWvjDpgA
         1yVr/zr/9J/fqlitmgSfrFa7vbmb1FxsKVdaJPOYIxaUCjv9ihah/M/Q3NUtyXL20M5Z
         oUBCY2WZTPq7Cw55mwIEGwiIbBHYbUifQGI7qvpYFF3nGvU19N8auGUQqZY2PCWhye+i
         BZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=X1E+zhkxeiRnxAt1MZXWYYzZ6dUMxt2b2y7DhSMgiJY=;
        b=kgkTZcElkCmse0Utab1ORjGflmR+m7GvXNxG9t7mPGmnJtzbm44qJEz2HZjbCZRlrg
         EkZSv65WMneXRyw8H+ecYaxctS1OokbXMW4CFu9V2sxD60B154LgD81yhw1uJI86v60r
         rM5OXnT8q4e5uJHAY2IMqyCJ2Vjb9LOKDqEIrVgDnAkFQxEYjspSxZm2fSU9Q5/XZQ6Z
         kOoa8E3s9sQuFQ50VCOABN2asdHYYXrewqvBDKxOk78jYxn6Kc2EGtJrDf3ZiXJ6XeHs
         7CIH2BS1NCvcJX0TeQPu7o0oEG+4lIDpV95b522rBNfiobvDhv+JOhQX50/WOTsoBKD4
         uy3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id fi22-20020a056402551600b00510d963132csi21694edb.0.2023.05.19.13.40.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdh0chzzxr0;
	Fri, 19 May 2023 22:40:56 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 50/73] core: riscv: Add PLIC implementation
Date: Fri, 19 May 2023 22:40:10 +0200
Message-Id: <20230519204033.643200-51-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

The design of the PLIC is poor: We basically need to trap & moderate
each access.

The strategy is as follows:

On IRQ arrival in S-Mode, we directly acknowledge the IRQ, save it in a
shadow register, and reinject it to the VS-Mode guest. Now disable IRQs
for S-Mode, until the guest has claimed and acknowledged the IRQ.

After the guest acknowledged the IRQ, reenable IRQs in S-Mode again.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild    |   2 +-
 hypervisor/arch/riscv/irqchip.c |   7 +-
 hypervisor/arch/riscv/plic.c    | 392 ++++++++++++++++++++++++++++++++
 3 files changed, 399 insertions(+), 2 deletions(-)
 create mode 100644 hypervisor/arch/riscv/plic.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 57c52854..0e7d3719 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -15,4 +15,4 @@
 always-y := lib.a
 
 lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o irqchip.o
-lib-y += paging.o pci.o traps.o lib.o
+lib-y += paging.o pci.o plic.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
index 880f1fab..4d8ade0b 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -23,6 +23,8 @@
 #define IRQ_BITMAP_PINS \
 	(sizeof(((struct cell *)0)->arch.irq_bitmap) * 8)
 
+extern const struct irqchip irqchip_plic;
+
 struct irqchip irqchip;
 
 static unsigned int irqchip_mmio_count_regions(struct cell *cell)
@@ -131,8 +133,11 @@ static int irqchip_init(void)
 {
 	int err;
 
-	/* We don't have a working irqchip yet */
 	switch (irqchip_type()) {
+		case JAILHOUSE_RISCV_PLIC:
+			irqchip = irqchip_plic;
+			break;
+
 		default:
 			return trace_error(-ENOSYS);
 	}
diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
new file mode 100644
index 00000000..a65de82c
--- /dev/null
+++ b/hypervisor/arch/riscv/plic.c
@@ -0,0 +1,392 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022-2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/paging.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/control.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/printk.h>
+#include <asm/irqchip.h>
+
+#define PLIC_PRIO_BASE		0x0
+#define PLIC_PENDING_BASE	0x1000
+#define PLIC_ENABLE_BASE	0x2000
+#define PLIC_ENABLE_OFF		0x80
+#define PLIC_ENABLE_END		0x1f2000
+#define PLIC_CTX_BASE		0x200000
+#define PLIC_CTX_PRIO_TH	0x0
+#define PLIC_CTX_CLAIM		0x4
+#define PLIC_CTX_SZ		0x1000
+#define PLIC_CTX_END		0x4000000
+
+static inline s16 hart_to_context(unsigned int hartid)
+{
+	if (hartid > ARRAY_SIZE(SYSCONFIG_IRQCHIP.hart_to_context))
+		return -1;
+
+	return SYSCONFIG_IRQCHIP.hart_to_context[hartid];
+}
+
+static inline u16 plic_max_priority(void)
+{
+	return SYSCONFIG_IRQCHIP.max_priority;
+}
+
+static inline unsigned int plic_size(void)
+{
+	return SYSCONFIG_IRQCHIP.size;
+}
+
+static inline u32 plic_read(u32 reg)
+{
+	return mmio_read32(irqchip.base + reg);
+}
+
+static inline void plic_write(u32 reg, u32 value)
+{
+	mmio_write32(irqchip.base + reg, value);
+}
+
+static inline u32 plic_read_context(u32 context, u32 off)
+{
+	return plic_read(PLIC_CTX_BASE + context * PLIC_CTX_SZ + off);
+}
+
+static inline u16 plic_read_claim(u32 context)
+{
+	return plic_read_context(context, PLIC_CTX_CLAIM);
+}
+
+static inline u32 plic_en_reg(s16 context, unsigned int irq)
+{
+	u32 reg;
+
+	reg = PLIC_ENABLE_BASE + (context * PLIC_ENABLE_OFF) +
+	      (irq / IRQCHIP_BITS_PER_REG) * IRQCHIP_REG_SZ;
+
+	return reg;
+}
+
+static inline u32 plic_read_enabled(s16 context, unsigned int irq)
+{
+	return plic_read(plic_en_reg(context, irq));
+}
+
+static inline void plic_write_enabled(s16 context, unsigned int irq, u32 val)
+{
+	plic_write(plic_en_reg(context, irq), val);
+}
+
+static inline bool plic_irq_is_enabled(s16 context, unsigned int irq)
+{
+	u32 en = plic_read_enabled(context, irq);
+
+	return !!(en & IRQ_MASK(irq));
+}
+
+static inline void plic_enable_irq(s16 context, unsigned int irq)
+{
+	u32 val;
+
+	val = plic_read_enabled(context, irq) | IRQ_MASK(irq);
+	plic_write_enabled(context, irq, val);
+}
+
+static inline void plic_disable_irq_ctx(s16 context, unsigned int irq)
+{
+	u32 val;
+
+	val = plic_read_enabled(context, irq) & ~IRQ_MASK(irq);
+	plic_write_enabled(context, irq, val);
+}
+
+static int plic_claim_irq(void)
+{
+	unsigned long hart;
+	unsigned short irq;
+	int my_context;
+
+	hart = phys_processor_id();
+
+	/* Assume that phys_processor_id always returns something < 64 */
+	my_context = hart_to_context(hart);
+	if (my_context < 0)
+		return -ENOSYS;
+
+	irq = plic_read_claim(my_context);
+	if (irq == 0) /* spurious IRQ, should not happen */
+		return -EINVAL;
+
+	if (irq > irqchip_max_irq())
+		return -EINVAL;
+
+	irqchip.pending[hart] = irq;
+
+	return 0;
+}
+
+static inline void plic_passthru(const struct mmio_access *access)
+{
+	plic_write(access->address, access->value);
+}
+
+static inline enum mmio_result
+plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
+{
+	if (!access->is_write) {
+		access->value = irqchip.pending[hart];
+		return MMIO_HANDLED;
+	}
+
+	/* claim write case */
+	if (access->value != irqchip.pending[hart]) {
+		printk("FATAL: Guest acknowledged non-pending IRQ %lu\n",
+		       access->value);
+		return MMIO_ERROR;
+	}
+
+	plic_write(access->address, access->value);
+
+	/* Check if there's another physical IRQ pending */
+	/* TODO: This is where we would need to prioritise vIRQs */
+	irqchip.pending[hart] = plic_read(access->address);
+	if (irqchip.pending[hart])
+		return MMIO_HANDLED;
+
+	guest_clear_ext();
+	ext_enable();
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_context(struct mmio_access *access)
+{
+	unsigned int cpu;
+	unsigned long hart;
+	int ctx;
+	u64 addr;
+
+	addr = access->address - PLIC_CTX_BASE;
+	ctx = addr / PLIC_CTX_SZ;
+
+	/*
+	 * It is clear that a hart is allowed to access its own context.
+	 * But we also need to allow accesses to context to neighboured
+	 * harts within the cell.
+	 *
+	 * In (probably) 99% of all cases, the current active CPU will access
+	 * its own context. So do this simple check first, and check other
+	 * contexts of the cell (for loop) later. This results in a bit more
+	 * complex code, but results in better performance.
+	 */
+	hart = phys_processor_id();
+	if (hart_to_context(hart) == ctx)
+		goto allowed;
+
+	for_each_cpu_except(cpu, &this_cell()->cpu_set, this_cpu_id())
+		if (hart_to_context(public_per_cpu(cpu)->phys_id) == ctx)
+			goto allowed;
+
+	return trace_error(MMIO_ERROR);
+
+allowed:
+	addr -= ctx * PLIC_CTX_SZ;
+	if (addr == PLIC_CTX_CLAIM) {
+		return plic_handle_context_claim(access, hart);
+	} else if (addr == PLIC_CTX_PRIO_TH) {
+		/* We land here if we permit the access */
+		if (access->is_write)
+			plic_passthru(access);
+		else
+			access->value = plic_read(access->address);
+	} else {
+		return MMIO_ERROR;
+	}
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_prio(struct mmio_access *access)
+{
+	unsigned int irq;
+	unsigned int prio = access->value;
+
+	irq = access->address / IRQCHIP_REG_SZ;
+
+	if (!irqchip_irq_in_cell(this_cell(), irq))
+		return MMIO_ERROR;
+
+	/*
+	 * Maybe we can abandon this check. The cell should know the max
+	 * allowed value, so simply allow any value?
+	 */
+	if (prio > plic_max_priority())
+		return MMIO_ERROR;
+
+	plic_passthru(access);
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_enable(struct mmio_access *access)
+{
+	struct public_per_cpu *pc;
+	u32 irq_allowed_bitmap;
+	unsigned int idx, cpu;
+	short int ctx;
+
+	ctx = (access->address - PLIC_ENABLE_BASE) / PLIC_ENABLE_OFF;
+
+	/* Does the context even belong to one of the cell's CPUs? */
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		pc = public_per_cpu(cpu);
+		if (hart_to_context(pc->phys_id) == ctx)
+			goto allowed;
+	}
+
+	/*
+	 * FIXME: Why does Linux read non-allowed ctxs? This seems to be an
+	 * actual bug in Linux. When we remove a CPU from Linux, and we later
+	 * change the affinity of the IRQ, then Linux will try to access
+	 * Contexts which it is not in charge of any longer. While Linux
+	 * disables IRQs, it does not adjust smp_affinities when removing CPUs.
+	 *
+	 * For the moment, and as a workaround, simply report any read as 0,
+	 * and forbid writes != 0.
+	 *
+	 * ... Okay, we really have a Linux bug here.
+	 *  (a) Linux doesn't remove the affinity from removed CPUs
+	 *  (b) Linux allows to set affinity to non-present CPUs
+	 *
+	 * Actually, we should always return MMIO_ERROR here.
+	 */
+
+#if 1
+	if (!access->is_write) {
+		access->value = 0;
+	} else if (access->value != 0)
+		return MMIO_ERROR;
+	return MMIO_HANDLED;
+#else
+	return MMIO_ERROR;
+#endif
+
+allowed:
+	/*
+	 * Now we have to check if we have a read or write access. In case of
+	 * reads, simply return the real value of the PLIC.
+	 *
+	 * In case of writes, compare against the irq_bitmap, if we're allowed
+	 * to perform the write.
+	 */
+	idx = ((access->address - PLIC_ENABLE_BASE) % PLIC_ENABLE_OFF)
+		* 8 / IRQCHIP_BITS_PER_REG;
+
+	if (!access->is_write) {
+		access->value = plic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* write case */
+	irq_allowed_bitmap = this_cell()->arch.irq_bitmap[idx];
+
+	if (access->value & ~irq_allowed_bitmap) {
+		printk("FATAL: Cell enabled non-assigned IRQ\n");
+		return MMIO_ERROR;
+	}
+
+	plic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handler(void *arg, struct mmio_access *access)
+{
+	switch (access->address) {
+	case REG_RANGE(PLIC_PRIO_BASE, PLIC_PENDING_BASE):
+		return plic_handle_prio(access);
+		break;
+
+	case REG_RANGE(PLIC_ENABLE_BASE, PLIC_ENABLE_END):
+		return plic_handle_enable(access);
+		break;
+
+	case REG_RANGE(PLIC_CTX_BASE, PLIC_CTX_END):
+		if (access->address < plic_size())
+			return plic_handle_context(access);
+		break;
+
+	default:
+		break;
+	}
+
+	return MMIO_ERROR;
+}
+
+static int plic_init(void)
+{
+	unsigned short irq;
+	unsigned int cpu;
+	s16 context;
+
+	/*
+	 * If we check during early initialisation if all enabled IRQs belong
+	 * to the root cell, then we don't need to check if an IRQ belongs to a
+	 * cell on arrival.
+	 */
+	for_each_cpu(cpu, &root_cell.cpu_set) {
+		context = hart_to_context(cpu);
+		for (irq = 0; irq < irqchip_max_irq(); irq++) {
+			if (plic_irq_is_enabled(context, irq) &&
+			    !irqchip_irq_in_cell(&root_cell, irq)) {
+				printk("Error: IRQ %u active in root cell\n",
+				       irq);
+				return trace_error(-EINVAL);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void plic_disable_irq(unsigned long hart, unsigned int irq)
+{
+	s16 ctx = hart_to_context(hart);
+	if (ctx == -1)
+		return;
+
+	plic_disable_irq_ctx(ctx, irq);
+}
+
+static void plic_adjust_irq_target(struct cell *cell, unsigned int irq)
+{
+	unsigned long hart;
+	unsigned int cpu;
+
+	/* Disable the IRQ on each hart that does not belong to cell */
+	for (hart = 0; hart < MAX_CPUS; hart++) {
+		for_each_cpu(cpu, &cell->cpu_set)
+			if (public_per_cpu(cpu)->phys_id == hart)
+				goto cont;
+
+		plic_disable_irq(hart, irq);
+cont:
+	}
+}
+
+const struct irqchip irqchip_plic = {
+	.init = plic_init,
+	.claim_irq = plic_claim_irq,
+	.adjust_irq_target = plic_adjust_irq_target,
+	.mmio_handler = plic_handler,
+};
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-51-ralf.ramsauer%40oth-regensburg.de.
