Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBUHP7XWAKGQEVJ2RGEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC05D3059
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 20:26:25 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id z128sf6302421qke.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 11:26:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570731984; cv=pass;
        d=google.com; s=arc-20160816;
        b=KO+ZL6lAykws6VumV/81QDnBll55XfxXDISbiL7h01YjFZRMqmROaeEY3wUbKCVIGC
         60s4/bDCIf/t3Wtd5rGdFLQyALrTi2dZ4l3ffB1ViiSyvWnwqOa5NvAwrAacgt8mDPtx
         JkRp/lLe79wIL3OIFgnXrN29EO07ACsS/3BgalPTtHL3kDrWZz8Dj5AkCXomyTu/NIi3
         wLQ+2fe8gZxKbSKJf6vW7rUf+imMoGqicFRB3hhi/z6j3WsePO4p8dSteX1YE+sau54f
         v+NfyZBe1yFEy0S4ATm5T6h1LEp8D0H/hGQZH85yJypdDVIebc/xciNmszYAFUJkj7Hw
         f4AA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tEg8D6XuGMK4xpiN4+9WHwqOeXUc4JdZOgspp1Q92i8=;
        b=kP+JDW7uKG4CCWj2u0AXPsGNGD5z8C8GyNniZSUvLEBBB9CcpxfzcfUcrd2YtmuaM0
         ArVLuw1P7v/+Ap7mBshkjYp904jRb/ncZbVxztMllneMNW1JUzLRPzK8N+fHhirZv95b
         YAQx+fDBLMrKw7vorL5dIZBFuj0igCHp5xaEwCVc7B+PxM3WH1zR0cFO9KxD8PhwNikC
         Tk1xbyC44DSplC6+Y3VPgBakDiovfKtoUVK9RcPqUFeW+rSO/yUJ4f/c4Wanl6WKk6sp
         hUJ+9tESwgRDn3LuIFch19DSoe7b2F9f0syn6oHswCDW0TXtDEvrXSiXYDExzmMq4T2j
         gQ8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AXVgTfK8;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tEg8D6XuGMK4xpiN4+9WHwqOeXUc4JdZOgspp1Q92i8=;
        b=G0ckxkS14fFNVSJRRSdAconXtbiz52wyqfxHBgpQopZjwdBNTObxk4CfZ0uuOm4Azg
         H/w/n3wqe/J1lMmKvfGZOrmgYb/kViw5qRsAJUG3Z4j3oaSKP/ftTIQPaA4fFCtH9ggn
         IOyicZGbo3KcX9ZUWr0Kol5g78fOw2ppGW+y/SPlYuW996G/ThRQa2c/YwXhgyZgP3NJ
         qaGe778xG7T89u9Gyx69iUVupjRT8D7U6XRPjRNsz3ubkVoQvFXjgHVBAPxxr58BpXMT
         mUFowERTdwXWrkknVMtxNwP4MEkA8F+T4NPYflOwD3eR6JLjPsmcp6lw+Lc9GePE33+G
         rDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tEg8D6XuGMK4xpiN4+9WHwqOeXUc4JdZOgspp1Q92i8=;
        b=myisxmHEd23Cx824zYy5+B56Gmi2hN48pS9yPD3TPjJU+glaIcYTC5yfiZEL4CVDqk
         soxv9rTQD0eRd2f6WqGpsDNouZVTBl9KolVy9WHtMYMwzM6fvDc+H70l+pA2Q+cOhRSW
         y9q5HVBvgpAmwgMgRWPQXrDS9mvWObf737lfKGpnY+z9E24tewvVLzuBi7qua4/aMhfk
         aP4hTJyYjf/plBZXtGqDR6IpjaMnH4h02fwpmWhlr0YICQjO4LOquWXSuKnghm26b7BG
         c0TOK3q5sVeH3vVUeTWnGAah21YExPhPBZCORtYjt7WByDjL2ZFOi/NThbvzUMSpQdAQ
         bruQ==
X-Gm-Message-State: APjAAAUrh5Di9v0Gg/gSDVBxYlkOpk0DY0O4WWuprMRTat9j8cCemSJq
	DKH5nQUv0IQR0bbtkxfI4rI=
X-Google-Smtp-Source: APXvYqzA2MBR+X7lcxotNuHYVZDkLo1Fsg6xlAq6cmrPmrLXUzsAu1SVAoUGywlUbg/5oYU3NHIf9g==
X-Received: by 2002:ac8:3f11:: with SMTP id c17mr12357484qtk.116.1570731984532;
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:2c55:: with SMTP id e21ls650947qta.1.gmail; Thu, 10 Oct
 2019 11:26:24 -0700 (PDT)
X-Received: by 2002:ac8:1244:: with SMTP id g4mr12077933qtj.3.1570731984141;
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570731984; cv=none;
        d=google.com; s=arc-20160816;
        b=JtMf41+pkRMIGAKHyK9nCxB8+0O931uSDMMpCEUrbI+ZfqOyExu1rJl3FPur05qhkk
         K+Rzk+YX/gc2Ne/cRdCEOlq1z1z8IFZ59v17jU/XTevqPzZVq8sMRUHO4pZJiNVbku8q
         MoEs6IhEu3M28NNNGvf7M76ZzihaW2Fa/oAxcG7bLivPRjJ/Zd77TJbPuhQpGqUX43R+
         wgah39XOdftWqGM/8j0KKfOu3CIl8CQGd1WhNO/HPu6NMkMG+tz/HF/Nzb0/NTN4czWl
         HTS7uIaNBbX81eTYvTylN1g0HjcsHM26suJtryx+a1iFUgIt/nrmOw7jmkXaVVnJYJr+
         xV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BiNvxuWKgVAyMgnYjfVymmox5810ywxzYaHYsOeiOKE=;
        b=LYSJhdmLQQ9sOX3TlCIAEei35fUcUKG5A4wbohspuZWEn3QhVKi1FM6tx8cXwWcwZ9
         zKUsB7GH70l/4jxBXJTRucIMt/cA7ZGpYIl/m+PzZw9GWvZuQIKIVIDGI50AN9Bjh4yj
         q5HJhf6sAjc4k+D+bMJsPRk6C0lH/ZE/Q76X6TXBIXUjqtYY9jaIyRrtekLtLHqkJFw1
         3iURzQc4XkmrlaONAkuUsAuxvRtbrluVIvJ+jj7+xZQwjqk6QjUurDzH4DKWM4SEnje4
         9IizNuy3DaNMgq7K6KBIGTdC+A9r8M/loWh9y95+f2Ls1DHG+2UMzmddn/rzl0J1RoYL
         xS6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AXVgTfK8;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id c78si466860qkb.7.2019.10.10.11.26.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQNIm009557;
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AIQNes120157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 13:26:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 13:26:19 -0500
Received: from uda0794637.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQLl3008251;
	Thu, 10 Oct 2019 13:26:22 -0500
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 3/4] arm: am57xx: introduce support for TI am57xx SOC
Date: Thu, 10 Oct 2019 14:20:49 -0400
Message-ID: <1570731650-5335-4-git-send-email-vitalya@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570731650-5335-1-git-send-email-vitalya@ti.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=AXVgTfK8;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

This commit introduces support for TI AM57xx SOC. Original support was done
by Jan Kiszka for v0.7 version, but wasn't upstreamed yet.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 hypervisor/arch/arm/Kbuild   |  2 +
 hypervisor/arch/arm/am57xx.c | 98 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 hypervisor/arch/arm/am57xx.c

diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
index e1bec1b..2ef89c3 100644
--- a/hypervisor/arch/arm/Kbuild
+++ b/hypervisor/arch/arm/Kbuild
@@ -26,3 +26,5 @@ lib-y += mmu_hyp.o caches.o
 #  gcc7 will bring a new function attribute "no_profile_instrument_function"
 #  should switch to that for higher granularity, but gcc7 is not even there
 CFLAGS_mmu_hyp.o += -fno-profile-arcs -fno-test-coverage
+
+lib-$(CONFIG_MACH_AM57XX) += am57xx.o
diff --git a/hypervisor/arch/arm/am57xx.c b/hypervisor/arch/arm/am57xx.c
new file mode 100644
index 0000000..1aa2328
--- /dev/null
+++ b/hypervisor/arch/arm/am57xx.c
@@ -0,0 +1,98 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) ARM Limited, 2014
+ * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Texas Instruments Incorporated, 2019
+ *
+ * Authors:
+ *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Vitaly Andrianov <vitalya@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/mmio.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/percpu.h>
+#include <asm/control.h>
+#include <asm/psci.h>
+#include <asm/smccc.h>
+#include <asm/setup.h>
+#include <asm/traps.h>
+#include <asm/sysregs.h>
+
+#define OMAP_WKUPGEN_BASE	0x48281000
+#define OMAP_AUX_CORE_BOOT_0	0x800
+
+const unsigned int smp_mmio_regions;
+
+static void *wkupgen_base = NULL;
+
+static int am57xx_init(void)
+{
+	wkupgen_base = paging_map_device(OMAP_WKUPGEN_BASE, PAGE_SIZE);
+
+	return (wkupgen_base == NULL) ? -ENOMEM : 0;
+}
+
+static int am57xx_cell_init(struct cell *cell)
+{
+	return 0;
+}
+
+void suspend_cpu(unsigned int cpu_id);
+static void am57xx_cell_exit(struct cell *cell)
+{
+	unsigned int cpu;
+	for_each_cpu(cpu, cell->cpu_set) {
+		public_per_cpu(cpu)->cpu_on_entry =
+			mmio_read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
+				    cpu * 4);
+		public_per_cpu(cpu)->cpu_on_context = 0;
+		suspend_cpu(cpu);
+		arch_reset_cpu(cpu);
+	}
+}
+
+int arch_handle_smc(struct trap_context *ctx)
+{
+	unsigned long *regs = ctx->regs;
+
+	switch (regs[12]) {
+	case 0x102:
+		arm_write_banked_reg(ELR_hyp, regs[0]);
+		return TRAP_HANDLED;
+	case 0x109:
+		asm volatile(
+			".arch_extension sec\n\t"
+			"push {r0-r12, lr}\n\t"
+			"mov ip,%0\n\t"
+			"mov r0,%1\n\t"
+			"smc #0\n\t"
+			"pop {r0-r12, lr}\n\t"
+			: : "r" (regs[0]), "r" (regs[12]));
+		arch_skip_instruction(ctx);
+		return TRAP_HANDLED;
+	}
+
+	if (SMCCC_IS_CONV_64(regs[0]))
+		return TRAP_FORBIDDEN;
+
+	if (IS_PSCI_UBOOT(regs[0])) {
+		regs[0] = psci_dispatch(ctx);
+		arch_skip_instruction(ctx);
+		return TRAP_HANDLED;
+	}
+
+	return handle_smc(ctx);
+}
+
+DEFINE_UNIT_SHUTDOWN_STUB( am57xx );
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB( am57xx );
+DEFINE_UNIT( am57xx, "AM57XX" );
+
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1570731650-5335-4-git-send-email-vitalya%40ti.com.
