Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKHHML5ICRUBDTBIOYC@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53f.google.com (mail-pg1-x53f.google.com [IPv6:2607:f8b0:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6A7DA5F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 13:36:05 +0200 (CEST)
Received: by mail-pg1-x53f.google.com with SMTP id l11sf23597927pgc.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 04:36:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564659364; cv=pass;
        d=google.com; s=arc-20160816;
        b=I8pMq7znDYfFrejZkgF7jMPTP69G8Y5aw2CN5kfQ6jn7SX8/ZNENlWf+f2ndHxahEg
         3WbnLuYFtinPQJHPd606/kQk90TzJ6OZBIFCKQJ33zeErVyDNRgW8QSHOG8tqwkkKLqb
         G0LoGB4aVzAdwZ1AHZHj1+WmuaOO8zcnbhlczd7B10sx0jN+9D28l6FDvGU1P9ZaqZlY
         Ta6oZYIMxmHdnu9q7JML82Kl7w6OiwYY2NONfiUwnucMMOkrCxJ9SbeJYXe4Tqt1I6h9
         3JUgCbezbDJsUxq/HR8Zs6V4JIqW3z9VskwfSB/oBsNPiDpz23dMmARCTA8wJLJwcahA
         mJmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MWBsc/HNET/2Gj8viQDUhH3CMM7rexWjX+vi+jC0Wxo=;
        b=VlflBdJKO3MFYCPlF4Y4bxDe7zB9TQy1urV/Kbr41AB73uV49iEG5b4WBXmwtruVD9
         +UdM/ZWtqBS+fCHuVC+s7ECkqEM6AyK1QemsXPSDGaXdz4lyRNsnyGPiR/NEGZ7BoVMV
         XltrercoYkllQ7SJcTdrDjM/2c8klm+dbudBDrSADkJXEcP+BSjXQNulZxn+bRi/gzQO
         DnW2IVVZaELcyRrwZIWFoIRi6bxEPwIi+b3468jGHXNIxLUGAgbo/ABNuNlPB9a+EVBe
         pY77/DtkfF3i2SPUbpRwyn0N3Rf7ljKUi+ABM8iPtjVAKMwEFxDjTljvOfO5hXt5Uolo
         pg3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klVISp34;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MWBsc/HNET/2Gj8viQDUhH3CMM7rexWjX+vi+jC0Wxo=;
        b=iuJ17zZCTPXQVlA4aGsD+jSDtmnNvWXW5c8D43w4FQGUMGg3ZBUD9RMYLLhILyTVIN
         4Wn8joZpa64sTBgYbu+t/ZHjUr1N3R5JMjOyPGImFU1uy+WIgX4/15tqQhf3KSagtsrh
         ++JD22sO7rne/Oc0bDmQEw1iVdZAf5rgOEqltmmYZj10vyTtrRgepXcmmvCmpYvVJNLS
         7ncFGyc4Hjf3VKycbhN4EpQWVuufrbLlU0s2LhNxJM3s1NMIpdD2w0GKxCeT+I8eD+Jw
         x8UebzI2qArrVwGqkBKTbFwQYsUuZy35Pg5Mg/Azn3liDikeg3vDGGGXhjqzc+8Hlx4x
         FK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MWBsc/HNET/2Gj8viQDUhH3CMM7rexWjX+vi+jC0Wxo=;
        b=mCbj+b56BJHcCnRu1JIr9sG1HwYOcVYWD5Rhb88x2msMLGkKlgHHck13a0L8mCDR7a
         28LRl8z1Op7RB2WCQF53J5lZNn+6DR2h4SlaZvjnDNSVnXLlz0dOFokkcWd4ShPEXCE2
         IQ5VxRgaMC0IE4CPWHw/QJS1UyuaEMkMyQv5GvIC0DN+hpuhacasr2BIo3s0A0ZZBtCV
         pwC38A6L4yw2eOdGJ0ib+XZccyufbvIj/HByHx2NhWuf5BVMFeH1Bjsq3LH4sUs41OQq
         WkXevExttHRFJ31OGazU0AOEmae+3MJNOmESsX53EjmKhL6iRIMhB8akrsQp6/NApIPj
         xoiQ==
X-Gm-Message-State: APjAAAXsklXWxmYMUqjxdtVkl74So13/q3OFVKLQyou37MgoPuBZn8KT
	QLNUDFFt1sFL8pHU+zZLwE4=
X-Google-Smtp-Source: APXvYqws1lnwBvqtkyhfVaPqWT+odQI/8WZ74GcJTFxxYmwwQEhp0KLslVd2Z3oXOGExib8Zr63LCQ==
X-Received: by 2002:a17:90a:970a:: with SMTP id x10mr8341701pjo.12.1564659363957;
        Thu, 01 Aug 2019 04:36:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:34e:: with SMTP id 75ls13818987pgd.11.gmail; Thu, 01 Aug
 2019 04:36:03 -0700 (PDT)
X-Received: by 2002:a65:620a:: with SMTP id d10mr72527768pgv.8.1564659363356;
        Thu, 01 Aug 2019 04:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564659363; cv=none;
        d=google.com; s=arc-20160816;
        b=pxIjBssjPbmjJR34C/6ut+ZW5FEOK7R5bi6vx4L+mw6WNQsdSN9kprJQuHKsFn9SiF
         3l0O5dG25vVX1/INmBysONas0m29nmB5KumS6Z9DGuKfRbHSjUWvVE+ytMSwbpqKdwTc
         Udzao47iVhVg7DjmxlQlk/jVN3xXmzM+f6IeDBTSyuh9oa3ilv1mL2VrFJsvn/qkR4dd
         FrUyrzYHdvb+qTsk7e3k+RhBskuOms8jauWjEcsWips+m50s144EvRRhIM35Ski/5pJC
         Zkki1AyzD5aNrk7vRLhvyYUSduHzkfKF/8mEnI2olciUOYf9v3xdXJH93sP/36aLrGZS
         glFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OsF2+c4NyOG0gvD9Ese8shCM6uFHVpunJtPpDoMgMew=;
        b=wpxC7MaEY0GAqFXi/JwDydAlAxl1OrmEXrcdo2/KG6lO58oT0LgzI9b+Oi3f4QOvra
         jkHmChzW1PnIKRqKkKa292FT0UCY1REHg3Y5HQHz5kB1M4A2/NiY1JB3McQdEdTluB4v
         vsNV8whSzynrSlBQzHgH40fey3LJPT9BcGEsWnoNlwLiTXUHuMYQFlCw0CxF4DDVK6rU
         r7U3dqHvladM+CXY9GDpNKcoruFhejaDQfHK2exbAmwvLJxY/N7CAP2SDDIddOqt3F5q
         LZILK0tsjJB/PP3w0PDjrb8oy4JPMXUvR2e7AkaXwTmQDJUzCTXW3wQ0n7VMuXBI+E4J
         Y/9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klVISp34;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id cl17si2797172plb.3.2019.08.01.04.36.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71Ba2KR094832;
	Thu, 1 Aug 2019 06:36:02 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71Ba2MN002416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2019 06:36:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 06:36:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 06:36:02 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71BZxHN060549;
	Thu, 1 Aug 2019 06:36:00 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v4 2/6] arm-common: Introduce iommu functionality
Date: Thu, 1 Aug 2019 17:05:21 +0530
Message-ID: <20190801113521.7311-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801112648.6569-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=klVISp34;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
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
---
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 hypervisor/arch/arm-common/control.c          |  2 +
 .../arch/arm-common/include/asm/iommu.h       | 27 ++++++++++++
 hypervisor/arch/arm-common/iommu.c            | 44 +++++++++++++++++++
 hypervisor/arch/arm-common/mmu_cell.c         | 20 ++++++++-
 include/jailhouse/cell-config.h               |  2 +
 6 files changed, 94 insertions(+), 3 deletions(-)
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
index 00000000..cb6fd032
--- /dev/null
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -0,0 +1,44 @@
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
+	if (!system_config->platform_info.arm.iommu_units[units].base)
+		return 0;
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
index bbdd05d4..e325bd08 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190801113521.7311-1-lokeshvutla%40ti.com.
