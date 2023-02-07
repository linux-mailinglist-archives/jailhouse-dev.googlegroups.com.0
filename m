Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ4GRGPQMGQEUNNDQ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F968D68D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:16 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id f3-20020a2ea0c3000000b00292fe8261ccsf1526350ljm.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772775; cv=pass;
        d=google.com; s=arc-20160816;
        b=l/GA6ZY8eLoyneqDL+S9oZWGv5jsRTUcN3kbNBqZmgmexYwuastpFBPhqja7aD4BFY
         MFHVD5haA4GCoHNsbQ7jZ8PMp02p/yTvoeUlRFnPqQb/uoxdPQRQeTnDP0FInBV9n71w
         owKbfxp2pFWQhPhagCkdZNb6/EwJy3jU+MjIgx/uLyTOphO0Ia/q06OGV+Wvig2gpX3A
         k6EmYjZebiwr/eXfoVAqo9/N9GrelY7+0wFmjS43jIvnVAbiMKEnvVZT5KzIvPcH/nOc
         Oogiw68UWJpgwHh5elbqLsFRLAt2jo6XW/fbCRLg3HRhePTAD7QdOXZuejDqQozr14FV
         L5WA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MhgJqTz/INN9Mxjht8Ma2KNuypqjibJB/TUPjG6BAEE=;
        b=rhsLMZyoRseFZf258DbS729xlWfRShC7qxF/570e8YmIf75h8lVuD7ZJeVQ5NAn+WH
         7Qv3eo/8FSWJ9XyOX9ShTUSy4Cw+2DO/yhMjPTFfEtvcpkgxO7wP/c64TeoGbHHdb3fD
         38ScwOiTByTgzw2d/cKUoPD9YWI+3brRtWYSl8YUnzE7rbUnE5tUAYGaPfoCkQDhpObF
         CGREAuACjREMLIjodYI4HarUwJD0u79mv/eAEER+c2whv3gKUAS8GGvAkdO70psvUjH9
         ZTU+Xap0rlZ3ftPiJ6R9o+UtcEPYzxwX3Io2fmGIVrP3fLoEM8IIpb+hVU7NRNRRvCJu
         mnRA==
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
        bh=MhgJqTz/INN9Mxjht8Ma2KNuypqjibJB/TUPjG6BAEE=;
        b=FWJ9SmHs6pNYrfD76j80Cqi8hBusqcjskg9NNeysxBC+W3Z6F4JWVplCfrVD6WXAKd
         s8hbhu6ivhkwfLy0N1lmiQQ2ILszSyNXV0gvijWNiJ4vXAbnVYCLf311X4Wr2mBJ8LD4
         EfCAOtxI0gxGQHc+/k/LDkzpWpIm7Z1iMQH9aGVp5uvUL55XUT1zwRuu66oVGNCnLLlr
         H4GWzsQJGIgsekzZz5pa1BBUTvKfeoG/lqEOeDwaOeI9s0hjXm+U+kBUCxs5chdUTYfQ
         5VSGz0Xgs8PdGcKALGogWwXaBGLHwqlkQUUGLalKu9VJ9nr6scxGV5t64rBURG9wXiPD
         8lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhgJqTz/INN9Mxjht8Ma2KNuypqjibJB/TUPjG6BAEE=;
        b=B89WsvvQD4/6+snbyLf8WWRZ59pSlO24oyVv1vPlqRiypW0zF4Yo9lBejLM5ZPINAs
         og1POFdSkAhqfmpaK7UseXuuTjHAL3AxpuYR+3lYzRJoVzCzjW8bC3esI4hp+8o2xBhY
         aNyECX73WCHQiVAb6u3nISHaiIczqDAIUKd6rUPgkYvCgML7LI77ld1hrnHW7ahNs4I3
         Af07oOrFTgXO/RpC/ji2Vyh8cxgBlc6S0dwA0dNd3obgI+24FkU56sVBvY8QJ3dmVLs+
         2dGwFi13MGpTrm/yIaXxFD9bEtOMoHUiEkuRLQLeJ0qZrVbZP4CJqFMYVNwPu5TrH3P7
         otJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVGn6YFqYZ7qcOcW5kyQj6ajkzSDZjsxfj974D0eLGBMx/Eb1o8
	5MYdKwf8w6i/FlOheziF6zY=
X-Google-Smtp-Source: AK7set8EJY44ZvCp2pb3ipB9YoATK6epvP7gLC5uwrn+gUzqDJ+gbqTewwujucrW4esH418M6Z08Qg==
X-Received: by 2002:a19:a40a:0:b0:4d8:6262:c982 with SMTP id q10-20020a19a40a000000b004d86262c982mr501910lfc.106.1675772775674;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc0a:0:b0:290:6183:37b4 with SMTP id b10-20020a2ebc0a000000b00290618337b4ls2099569ljf.0.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:13 -0800 (PST)
X-Received: by 2002:a05:651c:548:b0:28d:86a0:3bf3 with SMTP id q8-20020a05651c054800b0028d86a03bf3mr1060396ljp.30.1675772773911;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772773; cv=none;
        d=google.com; s=arc-20160816;
        b=jkfP2og/i2NY0k+dId20ekPBatLbvXhV0k3au8xlU57JcsSzsUN+4NiFcswfyb/2PI
         FVWIfPdfFYBannG792nwA1oLl2cmkjK6bFn0CBpLDaxSoLzRPGJqAbVkmUBPwzyuh010
         3xz5+v1ge6bgBB91Q8KIfeYl6qyUtdxk0SAq3JncTu3VBRmyXGb/gPsyjZO2QFWsSMYp
         +nirH8s8bzGrvK/3Dao1i8AuWDuP5eG2qlhy7JDYQiounU0G0dscgVnB7VdRe1yV5Uue
         Mol/RoRRDnKahcAvqkibEcKsVBJ6eJCxVFsrHAvl7+kG+9JdeskygH359yIGDz+leCNa
         Mi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=YjR++/HmRsrHSOszCCc2PXZSRSmLvfJ5bzuZrRt3/aU=;
        b=UeNySHEMl4wF38XATXPuCsKib/zM8WNcPRTsyUaEWHv6r0x1e+2NgEeRg54Djuv8Li
         v6lsjoqtzLrqIfh9K6XOsFGagt5Mzs8GzsZamth4qbc6JZNxqXHSMVAys8EG38O09/dr
         8s0Dpo9g0tbQ4awr4Ympp1DOkxPuqqLGh0jZH6ARc9/uJ0R5exLZ/OYIQWQWxrJF4Tmh
         kAQSeZncWkPlKU4TAP5WO1Zz/zRMf/418Ttj8z4L3YbOSg65DUIFDWjz84+672PwYWIG
         FtYob+njcx3IWzY3XqhddA9IGPJnSc6B9dVpm9iOhlEIp4e3RhTHVEDl3IiuNBCtM1f8
         C5LA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p22-20020a2ea416000000b002905672e241si464966ljn.5.2023.02.07.04.26.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RT0kNBzy8J;
	Tue,  7 Feb 2023 13:26:13 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 30/47] core: riscv: Add irqchip abstraction layer
Date: Tue,  7 Feb 2023 13:25:26 +0100
Message-Id: <20230207122543.1128638-31-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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

Later, we will add support for PLIC and APLIC. This irqchip layer adds a
level of abstraction for both irqchips, and will hold code that is
shared between both.

With this commit, fill irqchip.c with life, and and the common code for
both.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild    |   4 +-
 hypervisor/arch/riscv/irqchip.c | 182 ++++++++++++++++++++++++++++++++
 2 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 hypervisor/arch/riscv/irqchip.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 7809007c..57c52854 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,5 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o paging.o
-lib-y += pci.o traps.o lib.o
+lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o irqchip.o
+lib-y += paging.o pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
new file mode 100644
index 00000000..880f1fab
--- /dev/null
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -0,0 +1,182 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/processor.h>
+#include <asm/irqchip.h>
+
+/* Could also be used for arm-common/irqchip.c */
+#define IRQCHIP_PINS \
+	(sizeof(((struct jailhouse_irqchip *)0)->pin_bitmap) * 8)
+
+#define IRQ_BITMAP_PINS \
+	(sizeof(((struct cell *)0)->arch.irq_bitmap) * 8)
+
+struct irqchip irqchip;
+
+static unsigned int irqchip_mmio_count_regions(struct cell *cell)
+{
+	return 1;
+}
+
+/* Borrowed from ARM */
+static void irqchip_config_commit(struct cell *cell)
+{
+	unsigned int n;
+
+	if (!cell)
+		return;
+
+	for (n = 1; n < MAX_IRQS; n++) {
+		if (irqchip_irq_in_cell(cell, n) && cell != &root_cell)
+			irqchip.adjust_irq_target(cell, n);
+
+		if (irqchip_irq_in_cell(&root_cell, n))
+			irqchip.adjust_irq_target(&root_cell, n);
+	}
+}
+
+static enum mmio_result irqchip_mmio(void *arg, struct mmio_access *access)
+{
+	/* only allow 32bit access */
+	if (access->size != IRQCHIP_REG_SZ)
+		return MMIO_ERROR;
+
+	return irqchip.mmio_handler(arg, access);
+}
+
+static int irqchip_cell_init(struct cell *cell)
+{
+	const struct jailhouse_irqchip *chip;
+	unsigned int n, pos;
+
+	mmio_region_register(cell, irqchip_phys(), irqchip_size(),
+			     irqchip_mmio, cell);
+
+	memset(cell->arch.irq_bitmap, 0, sizeof(cell->arch.irq_bitmap));
+
+	for_each_irqchip(chip, cell->config, n) {
+		/* Only support one single PLIC at the moment */
+		if (chip->address !=
+		    system_config->platform_info.riscv.irqchip.base_address)
+			return trace_error(-EINVAL);
+
+		if (chip->pin_base % 32 != 0 ||
+		    chip->pin_base + IRQCHIP_PINS > IRQ_BITMAP_PINS)
+			return trace_error(-EINVAL);
+
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+				chip->pin_bitmap[pos];
+	}
+
+	/* This logic is shared with arm-common */
+	if (cell == &root_cell)
+		return 0;
+
+	for_each_irqchip(chip, cell->config, n)
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] &=
+				~chip->pin_bitmap[pos];
+
+	return 0;
+}
+
+static inline bool guest_ext_pending(void)
+{
+	return !!(csr_read(CSR_HVIP) &
+			((1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT));
+}
+
+int irqchip_set_pending(void)
+{
+	int err;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_VIRQ]++;
+
+	err = irqchip.claim_irq();
+	if (err)
+		return err;
+
+	/*
+	 * We can directly inject the IRQ into the guest if the IRQ is not
+	 * pending, because we know that the IRQ is enabled, otherwise we
+	 * wouldn't have received it
+	 */
+	guest_inject_ext();
+
+	/*
+	 * Don't claim complete! This must be done by the guest. We will handle
+	 * that in plic_handler(). In the meanwhile we simply deactivate S-Mode
+	 * External IRQs, and reenable them when the guest claims it. In this
+	 * way, we only need to store one pending IRQ per hart.
+	 */
+	ext_disable();
+
+	return 0;
+}
+
+static int irqchip_init(void)
+{
+	int err;
+
+	/* We don't have a working irqchip yet */
+	switch (irqchip_type()) {
+		default:
+			return trace_error(-ENOSYS);
+	}
+
+	irqchip.base = paging_map_device(irqchip_phys(), irqchip_size());
+	if (!irqchip.base)
+		return -ENOMEM;
+
+
+	err = irqchip_cell_init(&root_cell);
+	if (err)
+		return err;
+
+	err = irqchip.init();
+
+	return err;
+}
+
+static void irqchip_shutdown(void)
+{
+	if (!irqchip.base)
+		return;
+
+	paging_unmap_device(irqchip_phys(), irqchip.base, irqchip_size());
+}
+
+static void irqchip_cell_exit(struct cell *cell)
+{
+	const struct jailhouse_irqchip *chip;
+	unsigned int n, pos;
+
+	mmio_region_unregister(cell, irqchip_phys());
+
+	/* set all pins of the old cell in the root cell */
+	for_each_irqchip(chip, cell->config, n)
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+				chip->pin_bitmap[pos];
+
+	/* mask out pins again that actually didn't belong to the root cell */
+	for_each_irqchip(chip, root_cell.config, n)
+	        for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] &=
+				chip->pin_bitmap[pos];
+}
+
+DEFINE_UNIT(irqchip, "RISC-V irqchip");
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-31-ralf.ramsauer%40oth-regensburg.de.
