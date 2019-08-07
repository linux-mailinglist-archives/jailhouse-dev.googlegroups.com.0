Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKHCFK5ICRUBFXG5XLO@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0784671
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:21 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id j8sf12471417ybm.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164580; cv=pass;
        d=google.com; s=arc-20160816;
        b=lczYF4NkePXo8q1deKqpbYJE6i7VC1aoPhKZmbYZ9CE4Jk18QJ8k96woYFsyNpjzkG
         BKUpa8V5EEAVTl4CQU+HsDq60INBL0Vg3euKN68E9ocl0oOTRp0y0smSGv397Lc9Ti9Y
         gfR2EsLCTNPvT16Jt9WUzxdJQSErlTH0eW1w4OzYL0RsVeI9578R6EYcVCal7geIakK6
         unBP77bHuwNdDUnkAHqIqZ1gvJVhQxlVB/2iKHia6czLJSqh/KIHamnUhZPyBs6GUAvP
         Byt0ynoktdzG/Dc4fEXn/Pr7zzIK3h1v+LF6wWXyBoWEZHyhlf9OwpS1gL8+x9BxFCNB
         3XFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HKHFaBT5NrXJbMUNYZZdcILPKaY5IT6b3EiHMOdmuCM=;
        b=qbacDw+gfdCOMLQAatjOhXT4xTgPPUPGRz/8cf8Qg7IlWDBLWhz+Q2ZqkW0x1ERQtu
         4Tlhu6MifKnymveo5iMYIvzGW5pjpE90/EMUHyYMsVZLjdyKAcEBjaBrxFIKm4vlL8D4
         xTpQOKfpuzx47JaBdG0Znlu++OQiL9VCGuFbXdijbaTn4c8Mxhp3R1BRn03w6cgyDkRr
         xf0jgaZyWBLrMI1sr0B2X4irmteBnejC/92NqVRkpIkaZbSRzk6t85djwAZoA/Odob16
         zrSx9iNdVmA9BnaXesJZXBq1iGIcxmHY8qKdPerN4w6V6+Dl923r6tGzxkfgEFC5E7uX
         jMWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YBos1UiA;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HKHFaBT5NrXJbMUNYZZdcILPKaY5IT6b3EiHMOdmuCM=;
        b=W2Rj/m2I2glwnUAm/dlTn+yXpkVTO29GbToyT1FU43LNFoa4hKDKoZLQZCJwaEZg26
         tGM8v1TaAKkU3QJeSxykAYkfkBccM7E81lBxC/+o4wIWyGgt3s6YKvU5hVpTkhVxB9Wb
         /2a9zUMzAxYZU53GnPmLEAwJ/4G1rBe7kngDJKn6Xxay6sPVqrD76apcODIgZN8+mdvL
         qAUKjCKnv/KraR97U7FhRpTuznRR0g689knw0kU4Uukbctv5V2JYVnw7H+hXy1UesdI7
         Poq5Po8W3jwfpZUpmLieJ2FVph0QLzLA8IXmvc1PPvhclaD/sRkk2QiPWMhD531Z/r/8
         t1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HKHFaBT5NrXJbMUNYZZdcILPKaY5IT6b3EiHMOdmuCM=;
        b=NKyXb/91T7nOLDc42bCoBF8HFEEvX0ywxoJlHu/MkmIcQbYJR4sS84NkjMT3KQMeCZ
         WBXpzJ2t0+1u0QoEdMds1F7dHrooOdcMZ1p7qPHQWpBQWFay46WaBJ9kN7MF/SYFwU6W
         eDrcLB5/srr/45NibzYo5Zzm8nCDgXtg7VdpQHWAJMBaNm2Od6vW1VyUJPBnHBdTJ26u
         FXRmA5ABhe7ViE3/S9bc6+IpvKZ5SG5ez4fy0oLHWqwoIpFMXJcBG71mAQzeGIyjJnjb
         0whKeKn12i+znyhRk5cMq3pCDfjK18lBq8TwwwUBDuVEI4XZ1KgVfgiZHEtsCAuerr0H
         t/Wg==
X-Gm-Message-State: APjAAAWHv1FyhQrly7Jiz7dIDu3O/Xka2OnSDts4/j+zttHx1gWRT/bZ
	JcXyWKtXvJxVlZhy5PLj5X8=
X-Google-Smtp-Source: APXvYqxnwAY9U3/9bkmHyLbqS1PPL1Yk40g7jgMozsgaEjxYDw/RC+BqZ5pZ+2J7EJS0pAZxMuxfSA==
X-Received: by 2002:a25:5744:: with SMTP id l65mr5440732ybb.467.1565164580196;
        Wed, 07 Aug 2019 00:56:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3288:: with SMTP id y130ls16742572yby.5.gmail; Wed, 07
 Aug 2019 00:56:19 -0700 (PDT)
X-Received: by 2002:a25:5d09:: with SMTP id r9mr5621866ybb.237.1565164579676;
        Wed, 07 Aug 2019 00:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164579; cv=none;
        d=google.com; s=arc-20160816;
        b=aDUGeexB4APqCp3Vj0h4JCMdCgOZ5MIOdtvAc6OuN9hrUeC4Olgelny0FmxwKszaO9
         F29xOD+kt0Zg47XGcmclrNAX7Qqpwr4b3ac1VxqXFXCjmXEzuYe5xUrWShaQIcTKU1OL
         wBe70C0tI6MLdQpP1NgNg6D8Wsegex/tZ7Xqj8BkNLOYj+Zki6azNud6MgZHXgZTMvqA
         zXc+jTU/jt6VFLkTLOQ7eB10Jop9DDlvRYrgELsUWyE7dBtN3HQSgSv0EFknQESGnnnz
         58onjJ+v9uyg9eY6O/7YZJuc1bShe5nQmIi69s0UpZhyWxJnIor8HXJeGYXbGRieVwPs
         /x3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jkI0NPYtVFndaDQMhKuhhM0FCKaYthLmXC88XI0UuhM=;
        b=RvfDUv6hxIeCREJ/jg4tXMuTaWx8U7SAJjTSSOin7b2S8AU2IfRsKt1FDDjycnSOZk
         cOm9+YLE4gAjZliDvYpUApjzmEgbbg41G7xoLUQIfJs19nWqB5Xj+WbeVS9ew6fphRz6
         Fc/JPEssw6vz6SClrszd+yzpT+1iJTBb4k29eExNRTMfYx1HdmRfqg1oIy7qZKKepdG0
         QM81l4QykMgAabDVs+rqcF8ZohC9BwgyBgUoDwcpn7HRnmVbQwBazGOc3Cw0GJ70kOXh
         UIiG6GczgzpPTbci56S4xuAMbNY5F7/x3U0/xn+J5AD5B2QzJP3NQtRmBY7A9wcSg6pL
         Sz2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YBos1UiA;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id x5si3059544ybn.2.2019.08.07.00.56.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uJd3076569;
	Wed, 7 Aug 2019 02:56:19 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uJlr059517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:19 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:18 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmU128703;
	Wed, 7 Aug 2019 02:56:16 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 2/6] arm-common: Introduce iommu functionality
Date: Wed, 7 Aug 2019 13:25:26 +0530
Message-ID: <20190807075530.30444-3-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=YBos1UiA;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Add the iommu hooks for ARM and ARM64 architectures with
dummy implementations and update the Kbuild to include new iommu files

Introduce following hooks:
iommu_map_memory - Setup iommu mapping for the memory region
iommu_unmap_memory - Unmap the iommu mapping for the mem region
iommu_config_commit - Commit all the changes to the mem mapping

Call the map/unmap iommu functions in addition to CPU map/unmap and
config_commit.
Also add iommu_units in the platform data for ARM cells.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 hypervisor/arch/arm-common/control.c          |  2 +
 .../arch/arm-common/include/asm/iommu.h       | 27 ++++++++++++
 hypervisor/arch/arm-common/iommu.c            | 41 +++++++++++++++++++
 hypervisor/arch/arm-common/mmu_cell.c         | 20 ++++++++-
 include/jailhouse/cell-config.h               |  2 +
 6 files changed, 91 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 78b9e512..6f57ef02 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -17,6 +17,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
 objs-y += uart-hscif.o uart-scifa.o uart-imx.o
-objs-y += gic-v2.o gic-v3.o smccc.o
+objs-y += gic-v2.o gic-v3.o smccc.o iommu.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index b59c05d6..106ffad4 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -16,6 +16,7 @@
 #include <jailhouse/printk.h>
 #include <asm/control.h>
 #include <asm/psci.h>
+#include <asm/iommu.h>
 
 static void enter_cpu_off(struct public_per_cpu *cpu_public)
 {
@@ -209,6 +210,7 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 void arch_config_commit(struct cell *cell_added_removed)
 {
 	irqchip_config_commit(cell_added_removed);
+	iommu_config_commit(cell_added_removed);
 }
 
 void __attribute__((noreturn)) arch_panic_stop(void)
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
new file mode 100644
index 00000000..67ac34eb
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -0,0 +1,27 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_IOMMU_H
+#define _JAILHOUSE_ASM_IOMMU_H
+
+#include <jailhouse/types.h>
+#include <jailhouse/utils.h>
+#include <jailhouse/config.h>
+#include <jailhouse/cell-config.h>
+
+unsigned int iommu_count_units(void);
+int iommu_map_memory_region(struct cell *cell,
+			    const struct jailhouse_memory *mem);
+int iommu_unmap_memory_region(struct cell *cell,
+			      const struct jailhouse_memory *mem);
+void iommu_config_commit(struct cell *cell);
+#endif
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
new file mode 100644
index 00000000..f3fe56b8
--- /dev/null
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -0,0 +1,41 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) 2018 Texas Instruments Incorporated - http://www.ti.com
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/config.h>
+#include <asm/iommu.h>
+
+unsigned int iommu_count_units(void)
+{
+	unsigned int units = 0;
+
+	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
+	       system_config->platform_info.arm.iommu_units[units].base)
+		units++;
+	return units;
+}
+
+int iommu_map_memory_region(struct cell *cell,
+			    const struct jailhouse_memory *mem)
+{
+	return 0;
+}
+
+int iommu_unmap_memory_region(struct cell *cell,
+			      const struct jailhouse_memory *mem)
+{
+	return 0;
+}
+
+void iommu_config_commit(struct cell *cell)
+{
+}
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index 36a3016f..0607374e 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -15,12 +15,14 @@
 #include <jailhouse/printk.h>
 #include <asm/sysregs.h>
 #include <asm/control.h>
+#include <asm/iommu.h>
 
 int arch_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
 {
 	u64 phys_start = mem->phys_start;
 	u32 flags = PTE_FLAG_VALID | PTE_ACCESS_FLAG;
+	int err = 0;
 
 	if (mem->flags & JAILHOUSE_MEM_READ)
 		flags |= S2_PTE_ACCESS_RO;
@@ -37,13 +39,27 @@ int arch_map_memory_region(struct cell *cell,
 		flags |= S2_PAGE_ACCESS_XN;
 	*/
 
-	return paging_create(&cell->arch.mm, phys_start, mem->size,
-			     mem->virt_start, flags, PAGING_COHERENT);
+	err = iommu_map_memory_region(cell, mem);
+	if (err)
+		return err;
+
+	err = paging_create(&cell->arch.mm, phys_start, mem->size,
+			    mem->virt_start, flags, PAGING_COHERENT);
+	if (err)
+		iommu_unmap_memory_region(cell, mem);
+
+	return err;
 }
 
 int arch_unmap_memory_region(struct cell *cell,
 			     const struct jailhouse_memory *mem)
 {
+	int err = 0;
+
+	err = iommu_unmap_memory_region(cell, mem);
+	if (err)
+		return err;
+
 	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
 			      PAGING_COHERENT);
 }
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 740db758..fc0617d3 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -268,6 +268,8 @@ struct jailhouse_system {
 				u64 gich_base;
 				u64 gicv_base;
 				u64 gicr_base;
+				struct jailhouse_iommu
+					iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
 			} __attribute__((packed)) arm;
 		} __attribute__((packed));
 	} __attribute__((packed)) platform_info;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-3-lokeshvutla%40ti.com.
