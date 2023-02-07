Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ4GRGPQMGQEUNNDQ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id D264D68D68F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:16 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id x44-20020a2ea9ac000000b0028fd85f2e0asf3569234ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772776; cv=pass;
        d=google.com; s=arc-20160816;
        b=OX0ng0aYWfjGSuJXGvMKaAWxPt8NcX9feH4uAqaKxZht5AWKabnyE4MyrDV1zjevCO
         LxRGrNIKVyMpuwezxW9jiXU5OyuWcqz/UAvgsfJk08Od3RYWRJErhvS4YXqRtKaBUvLA
         27wcGCRDl2R9TX+CnDUi/YqdJ6GxemlQVGivBsjLj/Cl0UrgnSKc6WTFq2xCSkyIOpZG
         u0bNMp+vIknBCB9dOX0nm4FI0GD+BPq4DRCzjeOKVmpvd1IHFOqAbAvbOITZ1Hw2tvUM
         ECQypVsWy8CAfcRpRVo3zhrX8pkR9Vk/TGAJpFyVMLih3KHSRp/xP8Ak7d1TAHSm5WkA
         9UcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=u27vzMY8nR7H8SoG3Vv/zlsh6SuA322hjgS8KhRUT0Y=;
        b=uMP8Hqkch3jZQ3inc3nx+kDCAjYODfn0JHwAaTLVqUUWXLXFCHGvlSBjJB8qlsULIX
         eoJ1GqRooYHR/GrXcP/irz6y2XM0bj7OJm+hC//+fvWhp0z63kVpVQfmO9jor0C9FZ3X
         azzYfL5WumpWgMZdtBfdN25SxcdITPNtbZHrMUs5K4kakYP3hn9x77Nu1Yn6+5GSZXwP
         lFiMJt+EDCT6qYHpDaC/VPC+l++5WWhd/9SKtLgYeJkQeZfdr1egkMHhKic2JdRgZzEc
         dvswCBo2HahzmgNVXDUZBidCvafF2SrKHbfy2og+MFfksDycmmZKQ9CG8Sgce5ctL6Ov
         fhhg==
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
        bh=u27vzMY8nR7H8SoG3Vv/zlsh6SuA322hjgS8KhRUT0Y=;
        b=Q0ZM5pwXHlk9b1qvyfdq/YPlBOkTLN4ZjYMPVEDYqymB+XVl34C/KZyk9ubbYpMesW
         SkTAd+niYvSucqmJ+ITUOOQw+ha3y5lmT2Pql0GWIzWBkd4fOgc0BgCmvlq4EhErV/D+
         EWyaHMRZcz07N528FLO74zc2m3CueKvM2IFOENizvm6wxk1asKX8GLwVD6u0pt8huJz8
         CvN/6+JGyEuOLX05PlzxqqYBvokMDUiYHNw8Z2NfiekqM11FhI2Ud0UM6Ova0KjZXqJB
         xSDhf1TOql2urkHUSCpP6fjBV1W0NCHxJGhWHPZPfEhLXykaO0kiLoaLMVCsO6HXwg55
         h3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u27vzMY8nR7H8SoG3Vv/zlsh6SuA322hjgS8KhRUT0Y=;
        b=hMRgvkZ09xxG4msSGeHT+qERutB923u+bE5rAYOuzoHTuk8wGAmqCrX95dzO7ndYBO
         QOeCe+vIcVTm7A0wpz7gUKCjruXs4KqV+cCGa92MUsHQJTccMld9WXpldac+8Nw2pmNw
         E6joVmLCProvzDkeCPSBxjpfGR41Oflhv788/Ab88NmN2LN02gHJ7vQQQ+ZSr0Qf/c4U
         u6BHV12Bjw510hKUWbfm2eJio1jAhBEDPARxR/9vharaCsHNlVZpZk6Dx7SgZGeGNvwu
         YDVOFAWL9IveeUoJgQZVIrmigtOccAnjoLg2b8mLTxh1jcWMjKrpAL/EOx4lQcQMHBNF
         Z4vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVHo0dGxNbmfB8NqWejUAoZ02yEA+3jKMoPOPlg9kpMmPu6CD8a
	nZ3Y6gnh7q/0G+jv53Oz7I4=
X-Google-Smtp-Source: AK7set8NG66vW8vRY8v6vV6QtQMaZDQpRDlbokPwN5kaMoN1IzcrC9+oOYsmegKz7blr+E7oGnY/Aw==
X-Received: by 2002:ac2:5924:0:b0:4ca:fa1a:3956 with SMTP id v4-20020ac25924000000b004cafa1a3956mr403757lfi.230.1675772776378;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:b1f:b0:293:12a9:1ca5 with SMTP id
 b31-20020a05651c0b1f00b0029312a91ca5ls561953ljr.6.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:14 -0800 (PST)
X-Received: by 2002:a05:651c:221f:b0:285:61a1:d0db with SMTP id y31-20020a05651c221f00b0028561a1d0dbmr1096488ljq.53.1675772774358;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772774; cv=none;
        d=google.com; s=arc-20160816;
        b=bDXGcFtuhcy4Tw+1KBPRPsEq4I2dr+uXLhDGz+hiK91/5+x92e6PQUI6Zi+HP8dvia
         XNzbRdXus0tokbQO9ivmbUqLGdRWOVwUwVtAhZgTuQWmCdWX9nOeZgQWPIXaFs4ntwn6
         Y04jqamcyTsa3+yMAJXp8OeLQsnuozqpCFBXCTEOX4bnwh9rUvOggmsceNmwSO1w55X2
         Zzr7fRTfa7JorXAHTi1QV/ARCsRBe0x1nxpanfe5YFwddDUimY11Dx+yoQ8YrAYP8z78
         PvsW7xxgxaOACZpz4kqeZs1DpJEm3eWk31BONT3D2jp3MAhVtR7bHgI+Nx1wUqUlsOUL
         GaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=yuClVUegxUcMTo28x9SCSc+LTiFAdrLrxGb5hGMLV34=;
        b=EiqteKyJba8igRu+Swvc1a9gPCVAEZR2U7n3X+UUBcPng15VxtX+4dFQ/iwa20jl2t
         Mm7Um5sqqbCBBhPgWx9U6/d+RfVdQRsZFuhfsfc1gQYSLheDLoKzgpWU4QPROiNU5dKt
         xfU9gjYZRN+P/0WXlqcmhMc3Bd9+l5lD2M4rvtuOHSVzBZrgQaTbPG8NI9TrT4SmtojB
         FJ1LtfiMTpk/A4kssUsQAjKMx9nzHlx7IVxAFgdaiTtULs045oDscyzA5z6/DBtxe5uo
         23oXq71csvD1lwCdLlIKxWWsrJjvGY9Cn88FbGFRCM//K9+atIlR4jDxw2v801RD2Fjd
         wYmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id y13-20020a05651c154d00b00292f86f4312si457442ljp.0.2023.02.07.04.26.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RT31dGz107p;
	Tue,  7 Feb 2023 13:26:13 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 31/47] core: riscv: Add PLIC implementation
Date: Tue,  7 Feb 2023 13:25:27 +0100
Message-Id: <20230207122543.1128638-32-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 hypervisor/arch/riscv/plic.c    | 393 ++++++++++++++++++++++++++++++++
 3 files changed, 400 insertions(+), 2 deletions(-)
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
index 00000000..cb2c9069
--- /dev/null
+++ b/hypervisor/arch/riscv/plic.c
@@ -0,0 +1,393 @@
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
+#include <asm/csr64.h>
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
+	if (hartid > ARRAY_SIZE(
+		system_config->platform_info.riscv.irqchip.hart_to_context))
+		return -1;
+
+	return system_config->platform_info.riscv.irqchip.hart_to_context[hartid];
+}
+
+static inline u16 plic_max_priority(void)
+{
+	return system_config->platform_info.riscv.irqchip.max_priority;
+}
+
+static inline unsigned int plic_size(void)
+{
+	return system_config->platform_info.riscv.irqchip.size;
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
+static inline u32 plic_read_claim(u32 context)
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
+	unsigned long irq;
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
+	unsigned int cpu, irq;
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-32-ralf.ramsauer%40oth-regensburg.de.
