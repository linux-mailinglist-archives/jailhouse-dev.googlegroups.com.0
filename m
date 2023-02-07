Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB24GRGPQMGQEO2WT3ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BE68D69C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:20 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id f3-20020a2ea0c3000000b00292fe8261ccsf1526435ljm.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772780; cv=pass;
        d=google.com; s=arc-20160816;
        b=af2sB4tZ+Ckn8lPI61sdIkG+27LSqD+IYg2PfbNlCgF3e9K5EaFF7MVa1J8qzD3qiY
         4snoVl3ABq/daww/8O7ThstAMvme3EQSa15P9l8NwXmZJk3Lki4lY44Wh89yiPAt5AqK
         Cdc7sMJErvQeLpwBNCGdVEamuri5N67JTbX2RAyvzdYEXnvK5KG0tnX8JaEBV1/3gFur
         dOjRO8aGV3C4p2bzGYn4Z2Lg5laGTMqXvMOvk5ovjJe/EHILSTSfcFtK1MoTeczLuv6v
         ZuansimtSj9Pdytcse4WDjxH3dWyaKjq3qIhhfxC6tQFJakdK7EUWPbi+N7L3Yk+iePb
         7qvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=C2mD8TtdnmDDjsNL8+4MbWDFq/jCDuogfnaOqwAtJyg=;
        b=Pf4LoCO2y+kT+Jtg2meRUep2jEDlhIhOjupx4iIILT4VARpqjaVdKipjr35ctWaqN7
         evSpi6XKMxS0/OnknFwL2bKvIdp2ztQONa/WF0oAU1isj/JnzVK8pS/UdvcAyW8sqO4X
         Q619gHFIdBN4BmcAphjvZOhVQxstbH6baTeKGNrJMzcMCxY64Rf6JTpITU5h/m35A3ws
         hPyTvY/5UB4GPhbKGQuFSa+RDa6zB36PdjfxubPX6scnZlfehMU1il76lzWMyYlX8ZUz
         kXZ9mL8aeLAIGBexEH7Lf9h07flOQhx2DJl6I0I5U3FRJtL5tJJXxEGsmrSMDtWWeFPo
         ZcZA==
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
        bh=C2mD8TtdnmDDjsNL8+4MbWDFq/jCDuogfnaOqwAtJyg=;
        b=JrKe/n1Cc1rQkM2inR/qjOJQjE9H8V8ljlPxTaY6DL3H4TW/LnTmyvsSE7/kt3/2ya
         Fl+OQBPbtBi35FlvY0AOozXU7WpakTwEAfZbrj8Z/ZXRBnuwDJz5PIJucbsUPrbykMyt
         4p/YVIhj4Ev2yXa7fKT1vSbJu1bLYFwhjgO/A3065JA1KHXIeB55kmNY1mxysx1/TYm3
         HDX0Kfzm38bZLtU4pWZb3eNiyFulKmJSZ3BJKyzjKjb9quzgw+TvVF8Tmcp+ZK7s4lt5
         FDgKRDJAisLe7xSri+D4KdeH3iPT2OoPV9vRTlXTJXOgRxwI7QyxVgF9xK96zJPzNScv
         ttFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2mD8TtdnmDDjsNL8+4MbWDFq/jCDuogfnaOqwAtJyg=;
        b=VjdtNUurEZP8xWr5recTaMTWloBM6WANp3qsxkPcIIhAJxue1KiwFUQGoYrk0JcoiH
         UPVNJ5JiE2iDGsnhSLxLPPYQB7H3SxRchzYHAu0a0LQcABd7hf+63tzE6DWCTtFkIf1S
         4C3SqJP/GnFpR3MA+y7AnyLI6bNuprPXZTO9f69fruoPTAwhpJJ9CsJCGGxkrFIKPsf4
         836lluVg8rsPD9iELuCAUjM3cT/o3DXQHj7aefBIg1B7ak0KHQcBPDt6pGUxF5z/OoxX
         +EjQySKjngKmW613eXT/d0hnLGTgtJHK3a91UsRxgnKowtoLpghX934G1nW/h0+CqXCD
         +vOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWjO9VIfZZ8gYPRhgVpGQXYU3G3mO9ftGyWbNLkCsiJxAysZQT5
	eGC7x0oC9D4BMFfWcERkxFM=
X-Google-Smtp-Source: AK7set99VL1a3eFYaZzzxr4DfevuGh5VPhEp8W5k6V6QhC9Ov74ToGtHHoyuafCuYinGFkoUm3Wjug==
X-Received: by 2002:a2e:9106:0:b0:28f:55c6:8664 with SMTP id m6-20020a2e9106000000b0028f55c68664mr536070ljg.31.1675772780388;
        Tue, 07 Feb 2023 04:26:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9048:0:b0:28b:86c7:a456 with SMTP id n8-20020a2e9048000000b0028b86c7a456ls2087302ljg.11.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:18 -0800 (PST)
X-Received: by 2002:a2e:879a:0:b0:28b:5621:7ba with SMTP id n26-20020a2e879a000000b0028b562107bamr791439lji.0.1675772778531;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772778; cv=none;
        d=google.com; s=arc-20160816;
        b=eG9Zb5HHkHGwEIPtExiZqdBFZJ2+1yfnpnGfpmAUgp1VUHL7OCIKsHsvWst134VVh6
         aYQ6+WWYJ9ZB1iMhgsLzoEY2fxnTcBtIRSbMTbFxZTYAiO5sGLtYFMusZ8BQGpCvhk58
         jqbPTxb5/A2IHUie2IsL78WCISrjbjny39fOhWm0GRm58K1OG33+FxX+7qW5zrGfSnE5
         wUr24uBX+rkttE91DBLHZLRvmCJFF5d9u0UJcZylP7eW5zQj/7mKBwkqR44GyrhfyvAi
         NsTR7NugK2oJKLHu9zLo2miSxPQ7L5Wq6H9PrW0hb40YIwiR8inVPT8ChZqq7576RPAd
         U95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=T9tqB64TlCeRaYlJ/xKR7m0H8jMyVtyR0jmPiq2L3/Q=;
        b=luAgfrplwELfCtyujgxcOdNUBZvt2JxJOsxtdpQp4mltc5TcQt9dfKzbCTPqaergGQ
         CpLu0xMrD2E3+LJsu+nT1JEQUFNkTtzA3LHTlNGSejTSDxsC6WVkSLmT+npEgeblhCiI
         BnC0h9PCg6WOQOeE8gIAgCEoP6vxPeLgMe5YrgvZgyJ4TIbwh+67Mh6yxTxwMiHaEcyO
         z3Oljgikd8amW2mmEfiydymgBhrJjkeCUlHJgQEClm+PHbxhx5j5JYEfuMe3iwMNIpiy
         NV5C8HHyqSDrjjs1ecL6tmgd29jXLlYHN+NDWu4IouIh+tUTPCcU2nb/X9OGwDq8SB2V
         QXsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bi39-20020a0565120ea700b004d57ca1c967si606773lfb.0.2023.02.07.04.26.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RY4L6Vzy6b;
	Tue,  7 Feb 2023 13:26:17 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 44/47] core: riscv: implement APLIC support
Date: Tue,  7 Feb 2023 13:25:40 +0100
Message-Id: <20230207122543.1128638-45-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __COURIER_PHRASE 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PASSWORD_IN_BODY 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_25 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

This adds APLIC support for wired IRQs. For wired IRQs, the situation is
basically the same as with the APLIC: We have to fully moderate access,
due to the memory layout.

Major differences to the PLIC:
  - An IRQ can only be routed to a single HART (PLIC supported HART
    target masks)
  - IRQs are only claimed and NOT acknowledged
  - Global IRQ disabling is not supported (via DOMAINCFG). But we don't
    really need it.

So let's do the same as with the PLIC and softemulate it.

The situation will get better, once we add support for MSIs: The with
IMSIC-support, the APLIC can present all wired IRQs as MSIs, and also
supports 'virtual MSIs' that can for example be used to model IPIs.

With the IMSIC, situation will get better for us.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild    |   4 +-
 hypervisor/arch/riscv/aplic.c   | 444 ++++++++++++++++++++++++++++++++
 hypervisor/arch/riscv/irqchip.c |   6 +-
 3 files changed, 451 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/riscv/aplic.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 0e7d3719..e8f0eb9f 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,5 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o irqchip.o
-lib-y += paging.o pci.o plic.o traps.o lib.o
+lib-y := aplic.o entry.o exception.o setup.o dbg-write.o control.o ivshmem.o
+lib-y += irqchip.o paging.o pci.o plic.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/aplic.c b/hypervisor/arch/riscv/aplic.c
new file mode 100644
index 00000000..94111885
--- /dev/null
+++ b/hypervisor/arch/riscv/aplic.c
@@ -0,0 +1,444 @@
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
+#define REGISTER(X) REG_RANGE((X), (X) + IRQCHIP_REG_SZ)
+
+#define DOMAINCFG		0x0
+#define  DOMAINCFG_DM		2
+#define  DOMAINCFG_BE		0
+#define  DOMAINCFG_IE		8
+#define  DOMAINCFG_DEFAULT	((1 << 31) | (1 << DOMAINCFG_IE))
+
+#define SOURCECFG_BASE 		0x4
+#define  SOURCECFG_D		10
+#define SOURCECFG_END 		0x1000
+
+#define TARGET_BASE		0x3004
+#define TARGET_DM_HART_SHIFT	18
+
+#define SETIE_BASE		0x1e00
+#define SETIENUM		0x1edc
+
+#define CLRIE_START		0x1f00
+#define CLRIE_END		(0x1f7c + IRQCHIP_REG_SZ)
+#define CLRIENUM		0x1fdc
+
+/* Per-Hart Interrupt Delivery Control (IDC) */
+#define IDC_BASE		0x4000
+#define IDC_SIZE		0x20
+#define  IDC_CLAIMI		0x1c
+
+static inline u32 aplic_read(u32 reg)
+{
+	return mmio_read32(irqchip.base + reg);
+}
+
+static inline void aplic_write(u32 reg, u32 value)
+{
+	mmio_write32(irqchip.base + reg, value);
+}
+
+static inline u32 aplic_read_setie(unsigned short no)
+{
+	return aplic_read(SETIE_BASE + no * IRQCHIP_REG_SZ);
+}
+
+static inline bool aplic_irq_is_enabled(unsigned int irq)
+{
+	u32 en = aplic_read_setie(irq / IRQCHIP_BITS_PER_REG);
+
+	return !!(en & IRQ_MASK(irq));
+}
+
+static inline void aplic_write_target(unsigned int target, u32 val)
+{
+	aplic_write(TARGET_BASE + target * IRQCHIP_REG_SZ, val);
+}
+
+static inline void aplic_write_sourcecfg(unsigned int source, u32 val)
+{
+	aplic_write(SOURCECFG_BASE + source * IRQCHIP_REG_SZ, val);
+}
+
+static inline u32 aplic_read_target(unsigned int target)
+{
+	return aplic_read(TARGET_BASE + target * IRQCHIP_REG_SZ);
+}
+
+static inline void aplic_write_clrienum(unsigned int irq)
+{
+	aplic_write(CLRIENUM, irq);
+}
+
+static void aplic_adjust_irq_target(struct cell *cell, unsigned int irq)
+{
+	u32 target, hart_index;
+	unsigned int cpu;
+
+	/* Assumption: We're in direct delivery mode */
+	target = aplic_read_target(irq - 1);
+	hart_index =  target >> 18;
+	for_each_cpu(cpu, &cell->cpu_set) {
+		if (public_per_cpu(cpu)->phys_id == hart_index)
+			return;
+	}
+
+	/*
+	 * Disable the IRQ. As IRQs must globally stay enabled in DOMAINCFG, we
+	 * need to selecively disable it here to prevent spurious IRQs in the
+	 * new cell.
+	 */
+	aplic_write_sourcecfg(irq - 1, 0);
+
+	/* We have to adjust the IRQ. Locate it on the first CPU of the cell */
+	hart_index = public_per_cpu(first_cpu(&cell->cpu_set))->phys_id;
+	target = (hart_index << 18) | (target & 0xff);
+
+	aplic_write_target(irq - 1, target);
+}
+
+static inline u32 aplic_read_idc(unsigned long hart, unsigned long reg)
+{
+	return aplic_read(IDC_BASE + IDC_SIZE * hart + reg);
+}
+
+static inline u32 aplic_read_claimi(unsigned long hart)
+{
+	return aplic_read_idc(hart, IDC_CLAIMI);
+}
+
+static int aplic_claim_irq(void)
+{
+	u32 claimi, source;
+	unsigned int hart;
+
+	hart = phys_processor_id();
+
+	claimi = aplic_read_claimi(hart);
+
+	source = (claimi >> 16) & 0x7ff;
+	if (source == 0) /* spurious IRQ, should not happen */
+		return -EINVAL;
+
+	if (source > irqchip_max_irq())
+		return -EINVAL;
+
+	irqchip.pending[hart] = claimi;
+
+	return 0;
+}
+
+static inline void aplic_passthru(const struct mmio_access *access)
+{
+	aplic_write(access->address, access->value);
+}
+
+static inline unsigned int idc_to_hart(unsigned int idc)
+{
+	/*
+	 * For the moment, assume that we only have one APLIC and #IDC = #HART
+	 */
+	return idc;
+}
+
+static inline enum mmio_result
+aplic_handle_claimi(struct mmio_access *access, unsigned int idc)
+{
+	unsigned long hart = idc_to_hart(idc);
+
+	if (access->is_write)
+		return MMIO_ERROR;
+
+	access->value = irqchip.pending[hart];
+
+	irqchip.pending[hart] = aplic_read(access->address);
+
+	guest_clear_ext();
+	ext_enable();
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handle_idc(struct mmio_access *access)
+{
+	unsigned long hart;
+	unsigned int cpu, idc, reg;
+
+	idc = (access->address - IDC_BASE) / IDC_SIZE;
+	reg = access->address % IDC_SIZE;
+
+	/*
+	 * It is clear that a hart is allowed to access its own IDC.
+	 * But we also need to allow accesses to IDCs of neighboured
+	 * harts within the cell.
+	 *
+	 * In (probably) 99% of all cases, the current active CPU will access
+	 * its own context. So do this simple check first, and check other
+	 * contexts of the cell (for loop) later. This results in a bit more
+	 * complex code, but results in better performance.
+	 */
+	hart = phys_processor_id();
+	if (idc_to_hart(idc) == hart)
+		goto allowed;
+
+	/*
+	 * If we land here, then a HART accesses the IDC register of a
+	 * neighboured HART. In this case, we forbid the access if a HART tries
+	 * to cross-claim the interrupt. The reason is simple: If we would
+	 * allow cross-core claiming of IRQs, then we would need to grab a lock
+	 * inside aplic_handle_claimi() to prevent race conditions, which is
+	 * too costful. I never saw any cross-HART irq claims.
+	 */
+	 if (reg == IDC_CLAIMI)
+		return trace_error(MMIO_ERROR);
+
+	for_each_cpu_except(cpu, &this_cell()->cpu_set, this_cpu_id())
+		if (idc_to_hart(public_per_cpu(cpu)->phys_id) == idc)
+			goto passthru;
+
+	return trace_error(MMIO_ERROR);
+
+allowed:
+	if (reg == IDC_CLAIMI)
+		return aplic_handle_claimi(access, hart);
+
+passthru:
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handle_ienum(struct mmio_access *access)
+{
+	/* Spec: A read always returns zero */
+	if (!access->is_write) {
+		access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	if (!irqchip_irq_in_cell(this_cell(), access->value))
+		return MMIO_ERROR;
+
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handle_sourcecfg(struct mmio_access *access)
+{
+	unsigned int source;
+
+	/* Check if the source IRQ belongs to the cell */
+	source = (access->address - SOURCECFG_BASE) / IRQCHIP_REG_SZ + 1;
+
+	/* If not, simply ignore the access. */
+	if (!irqchip_irq_in_cell(this_cell(), source)) {
+		if (!access->is_write)
+			access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	/* If read, then pass through */
+	if (!access->is_write) {
+		access->value = aplic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* Don't support delegations at the moment */
+	if (access->value & (1 << 10)) /* Delegation */
+		return MMIO_ERROR;
+
+	/* If no delegations, simply pass through */
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static bool hart_in_cell(struct cell *cell, unsigned long hart)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, &cell->cpu_set)
+		if (public_per_cpu(cpu)->phys_id == hart)
+			return true;
+
+	return false;
+}
+
+/* Assumption: We're in direct delivery mode */
+static enum mmio_result aplic_handle_target(struct mmio_access *access)
+{
+	unsigned int source;
+	struct cell *cell = this_cell();
+	u32 target;
+
+	/* Check if the source IRQ belongs to the cell */
+	source = (access->address - TARGET_BASE) / IRQCHIP_REG_SZ + 1;
+
+	/* If not, simply ignore the access. */
+	if (!irqchip_irq_in_cell(cell, source)) {
+		if (!access->is_write)
+			access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	/* If read, then pass through */
+	if (!access->is_write) {
+		access->value = aplic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* Here we are in the write case */
+	target = access->value >> TARGET_DM_HART_SHIFT;
+
+	/*
+	 * Linux initialises all targets with default priorities, even if the
+	 * IRQ doesn't belong to it. Just return success.
+	 */
+	if (hart_in_cell(cell, target))
+		aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handle_clrie(struct mmio_access *access)
+{
+	unsigned int idx;
+	u32 allowed;
+
+	idx = (access->address - CLRIE_START) / IRQCHIP_REG_SZ;
+
+	/* Only allow clearing of IRQs that are in the cell */
+	allowed = this_cell()->arch.irq_bitmap[idx];
+
+	aplic_write(access->address, access->value & allowed);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handle_domaincfg(struct mmio_access *access)
+{
+	/*
+	 * Domaincfg is handled as follows: We can not allow guests to globally
+	 * disable IRQs (i.e., modify the IE bit of the APLIC) as this would
+	 * affect other cells. The easy strategy for the moment is, to simple
+	 * ignore disabling of the IE bit. This avoids complex softemulation,
+	 * and works for most situations, as IRQs that are assigned to a cell
+	 * are disabled up on cell creation.
+	 *
+	 * So if Domaincfg is read, deliver that IE is enabled, and that's it.
+	 * Ignore any modification of the IE bit, and don't allow to touch
+	 * other bits, such as DM and BE.
+	 */
+	 if (!access->is_write) {
+		access->value = DOMAINCFG_DEFAULT;
+		return MMIO_HANDLED;
+	}
+
+	if (access->value & ((1 << DOMAINCFG_DM) | (1 << DOMAINCFG_BE)))
+		return MMIO_ERROR;
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handler(void *arg, struct mmio_access *access)
+{
+	enum mmio_result res = MMIO_ERROR;
+
+	switch (access->address) {
+	case REGISTER(DOMAINCFG):
+		res = aplic_handle_domaincfg(access);
+		break;
+
+	case REGISTER(SETIENUM):
+	case REGISTER(CLRIENUM):
+		res = aplic_handle_ienum(access);
+		break;
+
+	case REG_RANGE(CLRIE_START, CLRIE_END):
+		res = aplic_handle_clrie(access);
+		break;
+
+	case REG_RANGE(SOURCECFG_BASE, SOURCECFG_END):
+		res = aplic_handle_sourcecfg(access);
+		break;
+
+	case REG_RANGE(TARGET_BASE, IDC_BASE):
+		res = aplic_handle_target(access);
+		break;
+
+	case REG_RANGE(IDC_BASE, IDC_BASE + IDC_SIZE * MAX_CPUS):
+		res = aplic_handle_idc(access);
+		break;
+
+	default:
+		printk("Unknown APLIC access: 0x%lx - 0x%lx - %s\n",
+		       access->address, access->value,
+		       access->is_write ? "Write" : "Read");
+		break;
+	}
+
+	return res;
+}
+
+static int aplic_init(void)
+{
+	unsigned int irq;
+	u32 tmp;
+
+	/* Some sanity checks. Disallow MSI & Delegations for the moment */
+	tmp = aplic_read(DOMAINCFG);
+	if (tmp & (1 << DOMAINCFG_DM)) {
+		printk("MSI Delivery mode not supported!\n");
+		return -ENOSYS;
+	}
+
+	for (irq = 1; irq < MAX_IRQS; irq++) {
+		tmp = aplic_read(SOURCECFG_BASE + irq * IRQCHIP_REG_SZ);
+		if (tmp & (1 << SOURCECFG_D)) {
+			printk("IRQ delegation not supported: %d\n", irq);
+			return -ENOSYS;
+		}
+	}
+
+	/*
+	 * If we check during early initialisation if all enabled IRQs belong
+	 * to the root cell, then we don't need to check if an IRQ belongs to a
+	 * cell on arrival.
+	 */
+	for (irq = 0; irq < MAX_IRQS; irq++)
+		if (aplic_irq_is_enabled(irq) &&
+		    !irqchip_irq_in_cell(&root_cell, irq)) {
+			printk("Error: IRQ %u active in root cell\n",
+			       irq);
+			return trace_error(-EINVAL);
+		}
+
+	return 0;
+}
+
+const struct irqchip irqchip_aplic = {
+	.init = aplic_init,
+	.claim_irq = aplic_claim_irq,
+	.adjust_irq_target = aplic_adjust_irq_target,
+	.mmio_handler = aplic_handler,
+};
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
index 4d8ade0b..693c37bf 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -23,7 +23,7 @@
 #define IRQ_BITMAP_PINS \
 	(sizeof(((struct cell *)0)->arch.irq_bitmap) * 8)
 
-extern const struct irqchip irqchip_plic;
+extern const struct irqchip irqchip_aplic, irqchip_plic;
 
 struct irqchip irqchip;
 
@@ -138,6 +138,10 @@ static int irqchip_init(void)
 			irqchip = irqchip_plic;
 			break;
 
+		case JAILHOUSE_RISCV_APLIC:
+			irqchip = irqchip_aplic;
+			break;
+
 		default:
 			return trace_error(-ENOSYS);
 	}
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-45-ralf.ramsauer%40oth-regensburg.de.
