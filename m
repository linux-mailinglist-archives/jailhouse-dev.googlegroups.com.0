Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBINWSLUQKGQEZY2QKEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC96373B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:19 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id h3sf5742651pgc.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680098; cv=pass;
        d=google.com; s=arc-20160816;
        b=HC9/zJNx6qG6Gg8ZZQtOxKq4GQ5P6lSDxLCzhe9TVA2pGTHnMWhN+OfMbGNI8oqBvr
         gJia/INERcwbtT10kAag07jayexI+uzZQ7ayGrjIk9eTribzTKMAlPqOMyIs5LLsphrx
         Kmw++0xOaGRXw9M2JaF6mjD5b6VGALCOAVHIU+++Z6sjRReK7+oL4OJmFuNNkxjbA4B4
         7gSstRsSXyfniZbBjr0VGyq07s0aoKiwIHF7R3fl08kfYl+L8d86b2cu7s10fBbDHhDT
         +euTFW8v+QUYLdB/GTIT9SfySfousDlSqbH/MiX6HqkicDxy4Zb/JVZV5ZKc1M469aQV
         36DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PO2eeP2ga7MqOFoY0niHtDuP00kqhfaQybTRrr4GdD0=;
        b=s28vw81nVLtgB8J1l7q7wlhaZ/YL5fN03rz/y+ni4gbwthgBcBRxl4oPcZHvDJvNFy
         zhi4oSSFrAAvl8bSUKUGA8pBnOcO+8CU2RY+wCIh3jXS8rbZCLxrpOdb+oGJszvAgE8j
         pTUmnZovaF7U6IvRgH+Nz1CJ/F71OgrT7nxx5DptStXgX2Q89UvS+Nn4KOfYzj1kCE7w
         im9pNLql5CZ45iWG1MPY3TlAlN0GQ8WxtJyWc+TkJVUrOU+6LRgdd0+q8cROB2h/Vsj0
         PbBFueMooiKyfoH4zQDqNJa/F9oGaH82/P0odC0NsJC0J7iNiUoMuO7tIJkeY5favMQH
         HC9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VanRaVWl;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PO2eeP2ga7MqOFoY0niHtDuP00kqhfaQybTRrr4GdD0=;
        b=fcZyfsCqGoJg2GRMaCTYuKrZK4OqCUBfDSQvQuxSTU7uq4UGyleaVOxnkcV7dA3hFr
         9L3UB/JkF0ISOPGPKUee3/hYi4T9cCxRW+cyd1fYYSXZJw71i42TnUgwjTmYNuDHCaAV
         U4yGzuX1KzA9/RB8r69AOe4DT9nemyrPYNFfxWUcUuE2M4E95Egdcc+lsXSrd8m91Yah
         c9mceFSTDg8bHstydIiTgrZPV5LjCB5+7uqYp0Fc7LPHEykDx89n3qoZ/2+zJTqiGmJn
         T5zgPFTZC44zGdhcrIbMzl/IonDpA8xdBgrGkgqELpOdWI29JWS08oBQ0SY28GUXwIKS
         LGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PO2eeP2ga7MqOFoY0niHtDuP00kqhfaQybTRrr4GdD0=;
        b=rYnYmXwG0UNToNLs2s2vUgtqoectnqf7ooYMNT9CTVELay8nDzSs6+qFF+uiWmw7l+
         4kyx+PaUFR+f42t6PlanAf+TP7N43UjvyMk3bmZIFdLNE5ARjrxcgxvoP54o9bHHahpS
         UM6GvU3Pw7ZDlFoLyTOKn/0HtIk7iR4xhFPSwlPXVm6T0ECZJRg51lV/1sWzorGxhO6i
         LCrXxjufAerp7SEsaEU7JZMUX9+qxeNwKQ3hd8oSN94s8G7hPv+nJAGgmipWBg+gG+d8
         NsQdd1tVVx1bKlcRiO7gcKsSk2VW6RI1twQgT7cBbTvwm8dZOQ4e38TMyX9jTTddXM8l
         3SNQ==
X-Gm-Message-State: APjAAAXQH00CSL1SrQiJb0GVf/KFm1Mkqty6QDiNAi4oLcA82mw/rlYw
	u8NoYkds1lcBUdEHLq+0Jxo=
X-Google-Smtp-Source: APXvYqxGs01hTckNlPTgvfOV1jtE9OyOIaL+vGN1DdHD1EWSURySleFmCLvp531NSNQQ2NTSg/Oo1w==
X-Received: by 2002:a17:90a:246f:: with SMTP id h102mr159671pje.126.1562680097876;
        Tue, 09 Jul 2019 06:48:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:905:: with SMTP id bo5ls1179951pjb.0.canary-gmail;
 Tue, 09 Jul 2019 06:48:17 -0700 (PDT)
X-Received: by 2002:a17:90a:ad41:: with SMTP id w1mr207352pjv.52.1562680097505;
        Tue, 09 Jul 2019 06:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680097; cv=none;
        d=google.com; s=arc-20160816;
        b=PvdoL3hMc4P29Q0+vAuvk4XRkkYRktWZ8ALydBBiu16MolR2MeYbPxhVbjgZ1XGh3l
         Y2P81DFuw4LiLzvKqNG2gkNKRU6mBX1aoRT1kbdTjF2sKp5Iabom45W3NtvoxD7H7gnW
         UKe7eRLd92sEUwibG3iIipjMLJehAnVBHFTNr0ckcnfLecKo6tYOfh9Oz67Tl44JBHB9
         xwQIzLb62vudFli5KTlkZlhhx+bjEsCsJyaYBZFC9Subi3vFCJvOszr+KvW3KxQuhB9l
         OGIeI2O95wK6o5BNcyfy5ZoDIOaOL3ojmoKNTY3SqLQ5Iui1qd/CdyLtsSc2bTZx30ze
         wYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bb56geuxHOONjiFcWHNju2q/TcTgY9WID1YWg1FQ0/Y=;
        b=pTn/0mT/5jvUvYTDQaBzZotgcgFZr8sCIhDcBB1/sanRjnNcUBD28mrtXbZaNI60x8
         M62a4m8VNh+4W6wohno52gIaP16nmWOcfOVodd7ETpHS3SbA3oMeLcVCv6kM6FB8ZQCY
         7JWPKgXSdBVEaNs+BjaLdAVWRE8Hbe86Q64a/dxrxNl3eXOZ3wVXo1zjxp4fx3HBySfJ
         WWYeQAeeo5lrcMK1PD72RAO+esEvly7lYjj59jhhtBrp6EMcUCNvSfHbVYwFL1VoxXKL
         NW0834xk/zNNlcWbfikTLwGD28tCVPz9K9W8SXbIgbxogUhMqUBs7i5em2lPehH9hNTL
         o5Pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VanRaVWl;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id g189si731902pgc.3.2019.07.09.06.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmG3V106105;
	Tue, 9 Jul 2019 08:48:16 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmGPA100272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:16 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9P1107982;
	Tue, 9 Jul 2019 08:48:14 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 2/6] arm-common: Introduce iommu functionality
Date: Tue, 9 Jul 2019 19:18:32 +0530
Message-ID: <20190709134836.10485-3-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709134836.10485-1-p-yadav1@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=VanRaVWl;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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
dummy implementations.
Update the Kbuild to include new iommu files

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
 hypervisor/arch/arm-common/control.c          |  6 ++++
 .../arch/arm-common/include/asm/iommu.h       | 26 +++++++++++++++
 hypervisor/arch/arm-common/iommu.c            | 32 +++++++++++++++++++
 hypervisor/arch/arm-common/mmu_cell.c         | 25 +++++++++++++++
 hypervisor/include/jailhouse/control.h        |  1 +
 hypervisor/setup.c                            |  2 +-
 include/jailhouse/cell-config.h               |  2 ++
 8 files changed, 94 insertions(+), 2 deletions(-)
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
index b59c05d6..d712b049 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -16,6 +16,7 @@
 #include <jailhouse/printk.h>
 #include <asm/control.h>
 #include <asm/psci.h>
+#include <asm/iommu.h>
 
 static void enter_cpu_off(struct public_per_cpu *cpu_public)
 {
@@ -208,7 +209,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 
 void arch_config_commit(struct cell *cell_added_removed)
 {
+	u8 err;
+
 	irqchip_config_commit(cell_added_removed);
+	err = iommu_config_commit(cell_added_removed);
+	if (err)
+		printk("WARNING: iommu_config_commit failed\n");
 }
 
 void __attribute__((noreturn)) arch_panic_stop(void)
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
new file mode 100644
index 00000000..d33ec17c
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -0,0 +1,26 @@
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
+#ifndef _JAILHOUSE_ASM_IOMMU_H
+#define _JAILHOUSE_ASM_IOMMU_H
+
+#include <jailhouse/types.h>
+#include <jailhouse/utils.h>
+#include <jailhouse/config.h>
+#include <jailhouse/cell-config.h>
+
+int iommu_map_memory_region(struct cell *cell,
+			    const struct jailhouse_memory *mem);
+int iommu_unmap_memory_region(struct cell *cell,
+			      const struct jailhouse_memory *mem);
+int iommu_config_commit(struct cell *cell);
+#endif
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
new file mode 100644
index 00000000..5bc9e6a9
--- /dev/null
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -0,0 +1,32 @@
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
+int iommu_config_commit(struct cell *cell)
+{
+	return 0;
+}
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index 36a3016f..d51f92ca 100644
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
@@ -37,6 +39,17 @@ int arch_map_memory_region(struct cell *cell,
 		flags |= S2_PAGE_ACCESS_XN;
 	*/
 
+	/*
+	 * Entire hypervisor memory is mapped to empty_page to avoid faults
+	 * at the shutdown. We don't need this in the IOMMU mapping
+	 * Skip mapping empty_page in the iommu mapping
+	 */
+	if (mem->phys_start != paging_hvirt2phys(empty_page)) {
+		err = iommu_map_memory_region(cell, mem);
+		if (err)
+			return err;
+	}
+
 	return paging_create(&cell->arch.mm, phys_start, mem->size,
 			     mem->virt_start, flags, PAGING_COHERENT);
 }
@@ -44,6 +57,18 @@ int arch_map_memory_region(struct cell *cell,
 int arch_unmap_memory_region(struct cell *cell,
 			     const struct jailhouse_memory *mem)
 {
+	int err = 0;
+
+	/*
+	 * empty_page is not mapped in the iommu
+	 * Skip all the calls to unmap as well
+	 */
+	if (mem->phys_start != paging_hvirt2phys(empty_page)) {
+		err = iommu_unmap_memory_region(cell, mem);
+		if (err)
+			return err;
+	}
+
 	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
 			      PAGING_COHERENT);
 }
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 72518f6a..43dee950 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -20,6 +20,7 @@
 
 extern volatile unsigned long panic_in_progress;
 extern unsigned long panic_cpu;
+extern const u8 empty_page[PAGE_SIZE];
 
 /**
  * @defgroup Control Control Subsystem
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 99a2b0c3..e3b1b3c8 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -24,7 +24,7 @@
 
 extern u8 __text_start[], __page_pool[];
 
-static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
+const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
 
 static DEFINE_SPINLOCK(init_lock);
 static unsigned int master_cpu_id = -1;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 781aac88..c988f7c5 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -258,6 +258,8 @@ struct jailhouse_system {
 				u64 gich_base;
 				u64 gicv_base;
 				u64 gicr_base;
+				struct jailhouse_iommu
+					iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
 			} __attribute__((packed)) arm;
 		} __attribute__((packed));
 	} __attribute__((packed)) platform_info;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-3-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
