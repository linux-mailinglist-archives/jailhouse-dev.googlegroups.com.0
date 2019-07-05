Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBQOD7XUAKGQEVWMT4NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id A474D6081C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:11 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id e11sf588878oiy.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337730; cv=pass;
        d=google.com; s=arc-20160816;
        b=hyzX+iFK04he9U/uHgCWYwOzU1sNkep9svSAoJgp0fNrykCSJeCJFuBjDd1r9RSXdl
         W6tQAWZW8LHXK1tyf0lQ3dlgCK6Cv3mEWL/D7E6sf4V8pokT6xZ5+3lMsMrL6f4jd9La
         zJm5BGKUChHSO4ySeIs1q0aK571P3NSNFzcKJnHI0lkhMYTrsE/V5+yiKldNyh5grIx7
         hoPugkaHUtlGX8xDUw03L89GKWut4jAL2dw+4UqlAmmEne6zNYX/bCMhaFTGX6PAkft9
         FossMdjMrpNfAn3empovBKe1e0VB6ezNx/Aa6rvQ0bRejkNvgGtWj23UjPw0IyVJX+tN
         AQkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EHvD1CO29ToZTGtpGt1sLGeHOl/6v1E+i4EmNt1NuFc=;
        b=f8jPOkEhujASlCV1qp5Yrvb7J0Rn0uUqvO3d2R9SQbrEhFpRpM0gTgoSusrL2My917
         aCYjT0euZIuoEN0ZecBWoRLFVDGW7yfJ3lG4k1G2ndONDKw2qvVQjaozQgOPjlyJJvCT
         GQT9IJUh+t/Mil66EV6JEuy2McQEONgRCXH2ANwIQpdD7cC5FbuBUj9MblNIYyZ4h/lk
         m3ZFvPawhHTdBCC5fXYLchtVCKbZXTZn5p/jlYxWiQ2H1Fi2T+vXwPAXtpAcTgUrXL7V
         CAWT6A6GcDrSrYGCKX88NdyxL6TpFYso9KkW99MIc3QIT85ShE+4ZflknjGanz2N+1K3
         LaDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vcgFoGv2;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EHvD1CO29ToZTGtpGt1sLGeHOl/6v1E+i4EmNt1NuFc=;
        b=YaqvqIsdLUfcjzKF03o4C1YRTuLLyCTymIuSe98Y+tMlZmWC8R+tAmYsuhOR74ue49
         avlGv7mMKW9NsVlxdWZguZbrvWUDN4UjS/vOJck2ds74feKLOHgve+yc4spccarF8KB6
         CEtK9MYvMYC+eKwZplVfPcowpshkEQ/ktJLrCZIdLvQgm8wLHS+g2O43qWuynqy3sNU+
         0Og1iDNQuSNH9Y06EUvmI09s67lwFDn98oeTwdm5Sn9RmgD9t0ZYgz6fNbEbp5XK900b
         n/Lzeuc2A2KYcQ6/AvfwASStxgNZqWMdjv7+mfDTrSWETwJTKrKrQvM6OGIyrP2c9IuF
         vfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EHvD1CO29ToZTGtpGt1sLGeHOl/6v1E+i4EmNt1NuFc=;
        b=hxVHJuTaHcStA0ewGRD35yJsOAs8lAqMb5vDIfU4esDrgKlaCALQzkY8PKjP+XGz8m
         gdiPtykyLDUuJ7IvMTiLS4nC+8OPGLmzKwUFGCO9ofsCSA4SjnaYxYIIBjWfUPJ8cPcK
         VDTYxteoZkNZPMAu9iZK1259UHgESfWzYmQDEo9zObrBidwf8UuFOSFnMcFh0Ob/ISTn
         32PwqPTy8ZxFLlLMrg5GLJ6amPVVKs4mecW1rBgWECWRhwkEmofkF08pTUmDJQYMuLWN
         iJUnJ4bohlREZX6X6Hv0PD2Cj+BAaplUX1JBQPnrDQRJNTF5UBnuI/JEKWxQ+7omCRCD
         JknA==
X-Gm-Message-State: APjAAAXkVBv/3vTdLFP02R7zXORNiUysvqAR/v/w/LPOOiMcKSBpJtIF
	HpHp7P9LO0rSQJZ+DCGBblw=
X-Google-Smtp-Source: APXvYqycJUYKkxwjYPmGhfd4dfikS1pt1/JNRLKMP42NVdbs574ZW+DFtCoMazFZi4iEd/f6xhzmDw==
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr2233901oig.117.1562337730144;
        Fri, 05 Jul 2019 07:42:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3ea:: with SMTP id f97ls1684931otf.5.gmail; Fri, 05 Jul
 2019 07:42:09 -0700 (PDT)
X-Received: by 2002:a9d:5510:: with SMTP id l16mr3241383oth.63.1562337729742;
        Fri, 05 Jul 2019 07:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337729; cv=none;
        d=google.com; s=arc-20160816;
        b=X85ICDfCwTXx6Xcl/f6Cl6Sbg39ncF9czlZgQ10bvAvW1BG91ApCcLFRk0X845APfi
         67RJcu0THlPkfbIyxpjd5e0t9iOERq+fs6kMv6FbMDoU9UYs23MoWwm7eDDq/LliNwdU
         6pVAScTzK/yTsjGkFFSJUGVMH9N/ZKtS1PwnptkPlyKtSvEmnwimPnnjWzZa3U6kBt+G
         1JzaLmAMO+glRIoh3TrEA5YCVkZ1jQXb1mP9BropuLomZmyjbNbmgAxXR8PZVKdZ1rF6
         f2MyQksOvmCr61u7qrjt+cl/9ld9LtRcb3u499U3Nx0f54Wz168dhb/heHRFeyPEQxCm
         KHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bb56geuxHOONjiFcWHNju2q/TcTgY9WID1YWg1FQ0/Y=;
        b=lly5e9tBdlculIS4xOuH8vlUVvdoEDolsmfO7hyyvY+0f0geS52K+ZaJe2R46KQTYV
         bDvNrFhUFmMlK5I6GFGCx5yjUmRZYf8R5tCVgzH9R9vq0nnTj6cHY2Snno5gJCh8K2Se
         K13vVSW/LfZXcOznzgUHnIvv3y4IGcAUhAsxzE2XAhS/VtNRKuPUFz+5G80xlh1px9oY
         f74L9tQ6ZLZHw4EgM5g+z+3T0nqvEO04GzQc9EvcpfZOlvoZLTI9ZSqegIUIIemUNdzW
         vqfO1Dybjo8gOottXK1JoEvFMM1NE1C/Dmdw7tiCN7ZAX77w/4hNMQsh0ybDlZfOoYHX
         lx5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vcgFoGv2;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id g16si744938otn.2.2019.07.05.07.42.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg9Gx051798;
	Fri, 5 Jul 2019 09:42:09 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65Eg9Ko107463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:09 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1o1067904;
	Fri, 5 Jul 2019 09:42:07 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 2/6] arm-common: Introduce iommu functionality
Date: Fri, 5 Jul 2019 20:12:21 +0530
Message-ID: <20190705144225.7126-3-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705144225.7126-1-p-yadav1@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=vcgFoGv2;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-3-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
