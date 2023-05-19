Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWN5T6RQMGQEYKXMO6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27370A0E3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:58 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id ffacd0b85a97d-30940b01998sf1409412f8f.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528858; cv=pass;
        d=google.com; s=arc-20160816;
        b=LpND+aY6GohMOJeGcKKY+KN6oTbtfgjMxb1pjNVnPj0b6QWcgl27otQ8oGG9NSzWCq
         slB4JUIpFamZNP9AL3qb/O+Gks1ZjKxWVAhLWrDfKUYQ5JOj0cS3P5TbOuqvNuJsFbg/
         um5xjK/lSs7tJDHUFmZIZ2BfOMh+kr0IHruTSzSZ+ITjuHyucscWOAT9VFUehlCECxYy
         XoQz3wz6soa2Xndl1xkbgTbrQdFM55KMpf+xaHBScLzHN/m90QakZeS0HmGe35Ji53RG
         1mpZqKd2qPvpq3fNF+zEiuoQHddlpj7Ah2kVOWnTE90IKnymBy2JjgBm/0XhdSd6uC9z
         JPeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=7hvKr5IouyKmh+rrwsB8dqxHrpWgygFWEI6h/zB/pm8=;
        b=K77v6EoUOC4UshOobIFP1/acLXsj6IcimoPJxvl8E4lbPuYL9Y5rLhp7RNVrzzuiUg
         Vy26KSRWrfjd9QIk9Oj9tgauyTmCF5z5Rm/KM31v+brKed3zHPUnE4Y4zkyjo5XDM8VY
         gBfvU4vQ0tAWzFHq7KurUxSTk5+52X5DgJH6klyyCTMiEBTpYnGGiVqB45SJkXVjMP44
         R6nkofcbiRoyXl5dtI+E4hLc/7pmjdnxTbL0ANWKht5l1ewbHsGJCr0O6OQ+51lxsFEf
         lFayXPMez7rNxfdISXl8FNiKYK/vaf6m3FbX2FRJNedFxkQU10TG7alrYVHpU1DQNVIE
         edUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hvKr5IouyKmh+rrwsB8dqxHrpWgygFWEI6h/zB/pm8=;
        b=pQECyHXMVUIJi9sEFxqMFBHMM/EUSJz4A34b4cBNQsfF8Mr+ubZN1UHPAshCG33eQq
         Y2mbxtjqTz0JN+hnu3uXLy5vWeGyJ1pgauVUXrs8laCCM9On3rjEKItlBSjnULf8lLgn
         9bQWBuDDxeZN6a1sMit6Q7IezRn/yD/brF1esAgo9Ekr3C1i0Wev7K5F3DYCVWhfR4ws
         AQ3Zjcjg8F/Eil78A8yxUhTsGhGgarPZaRbDaS4TII1SM/7TsfTee3FWbg6KTI+Pn61N
         vrQbpdNzs7z0fGqYbug3Vlq7i8vxmRhw4yADqZyiHIwg4MXSAhVmZiG1X6i/Bm4v0cYk
         LT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hvKr5IouyKmh+rrwsB8dqxHrpWgygFWEI6h/zB/pm8=;
        b=JsAKRpnrpn9c6ISGhHJ0wdLkQ+jTIcYGokM0F3ZM9mY6C8Iqje4tIVdB3Y+pT2smB9
         TRYkO97M9bA3wLEFEVmMV10oP+wBXcebeFH2edp3D2E/G2eW5g1bfiA9AWPZNrlGdght
         jINGOCRzC5jMG6ZPpu4Ni0jMBcmPwMNsbPxI8VVD4DlgzGFEQy82t1k7GYlgTj6CWTJG
         OLkOzgLJvLVmEuvVGzQoMSNfrSSKhpsCLELcPUISxV/+kiiNxdFk2SZmB/PTvbl0kkl4
         k+Nzy18wvL6jRjISijzOSwiv/KJwA6IFMxVp42P4AuoDXqb52YBRhFOzTpqnIDdvqAPo
         jQoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzdpDDAQZrL6KK48Qm/r4iaw8d5O63CklZjpUoxDEIhGwMwWQ17
	B+Um2OT68/6DR0xaYtEJguE=
X-Google-Smtp-Source: ACHHUZ694Whct1TOjZSV9VoHbaFJite7nP01zuWaZCqyfXMDFcbjdZk9LkhtMZjB1oUdqLPThRRobw==
X-Received: by 2002:adf:dec1:0:b0:309:50ee:836b with SMTP id i1-20020adfdec1000000b0030950ee836bmr419704wrn.12.1684528857987;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:5c1:b0:306:41d1:2803 with SMTP id
 bh1-20020a05600005c100b0030641d12803ls1252665wrb.1.-pod-prod-07-eu; Fri, 19
 May 2023 13:40:56 -0700 (PDT)
X-Received: by 2002:a5d:44cf:0:b0:309:54b6:33b0 with SMTP id z15-20020a5d44cf000000b0030954b633b0mr2363656wrr.44.1684528856232;
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528856; cv=none;
        d=google.com; s=arc-20160816;
        b=zB90wprMsfFNMne6t4epgDeYZ+IKx2ctUXhKNmOU85gqHtDuKlVTT81GdROA0XQzHD
         ZSKH3Yq4lM9FdwQuohv3BJE/ersiK1HA9hGEsqP0vVuv+44OayN7M/5ho9B7gcXD3+wg
         GmkCXgx4g+y4D9tn6ayoi4sCJzTH8NQc8N+33DDTnWiX1ZMQz8Ta/DeydhPIC7JrIdRy
         N9rP5bBMlcU8vGmSnT4i5DQDotFkkm1Bu6ji0jN4E7t8H24dx7lZsJfYC1wXeQNM3Vng
         mk9ZLO2X6zHQm2gU9TcItcmpHCES5wtPAXhR/gKqBMudOy5VxBs7HtDTkex321BQ5wrK
         LQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zghIHILBd3kB2+BDNixycv6Tjgu9JzNSWD/yIfhVmww=;
        b=LCNiGqdVGHQ9xBxnKrhCtaq04RkPq9Gx/EnOkTdtU4DGOgCCBM+FaNxPEKsQwgQpmb
         t4wwk6pTr8oCOBcFnWIfxWqgcL3dOgZS4km+Twe/Af7C9SgRd4PmqTaNgHOWooZYSqWc
         rwJDMzSPlKBx4Gaortz93TaUnCNz/uNpiYI1hUXUH5kzkN3/CHoh2NuKPbqzo7/5kWB5
         dtkqiZRw24AIuuFtWnxLev/Bh4mY3Z5b9qkJ5IU2RehUX85vVdGK+N1w1ql+D7p39EJO
         HhY+clemiGiLjnr3KKX4lTXAfcdi4MW9iCbWMFlstqQCqqWpqcHENgRNfFBthkR+G9Rh
         mchw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id by3-20020a056000098300b00309385d6135si921wrb.1.2023.05.19.13.40.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdg5Ptlzxpk;
	Fri, 19 May 2023 22:40:55 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 49/73] core: riscv: Add irqchip abstraction layer
Date: Fri, 19 May 2023 22:40:09 +0200
Message-Id: <20230519204033.643200-50-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-50-ralf.ramsauer%40oth-regensburg.de.
