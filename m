Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBVGX5XUAKGQEQMHXTAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFE5D1D1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:05 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id v6sf2539948ybq.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078165; cv=pass;
        d=google.com; s=arc-20160816;
        b=IMCQvw/UQ/CVE5FFeGgegXvzeGcu+tc8FzsX3LMX2H7XzGj3z0nWqZXKtwmdD8OYSx
         6MDWeQPuznaBnPjPNJVEbiHppyv5fkuX++tc7oY5BoDJcpwbbXT+7yhlgFJ6hvEPQnXp
         47erhEP7jzNnWG/gxFQ2JGqyi9ePQUdDe5r6jkqFcF06WpnULmFcN5Eqvq9FLPDL2ZDT
         cQJylcdeI+h0jv8wCCyQHDzBucXyNdJT9D/PzusAtQ7kS7Pf+ifScTlU1fhpn/WiajlL
         avK98Ql3pyy+k9+tGeo4LCo12I/6l/VKRX78XbGY2LF8qXXm9GSLYH5+YDs8kesXLqZw
         oN7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pafeWJqPWSzML5IKIelSIvDv0keQ7te+q4e+ypc6O3s=;
        b=tPtLwKxJOAfHeqJ7YMHL4OcDX0SjKdVel2NdT7RZID5kr6TPLuNOGxjx6ucMRkOI0k
         dmjFEhrbUs2q9OcBPNl4jp13seES7+xohS7wT5Oj6lLiIM/n3Sj3zvZrZEy+Tql6dEVd
         v3UdyZadCKku5ipUy4FIeyLR0VztmdpEBJIiwkonZmvTQDpHtiDBxRAoYKA6zEL1/qJi
         AjVQQkU/g+Odmpn6qvlZgTqLVk7ypiJ9mDHmxU6izDfYJfibQrmURchZu6Caq5iY2pVm
         TsXfPJdC5lCENACuH7sLmeTenPhEGyuo7psjgRhNolKUmm1UpnC7vSscfQTSIKoGu7oF
         BAxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CV44+Pnw;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pafeWJqPWSzML5IKIelSIvDv0keQ7te+q4e+ypc6O3s=;
        b=W+grID/e/DR417+lwglI6V0x7w8a7Y7iittVRxXHJD7ATzn1khO8uJBBqvAQ/DyUAg
         NUL94jUQznsVTZSE0nAblb+kO99xVEx4DD1Op6ZostuBTTTv+TT3Ec5L6I/K2DOIF2ko
         DE+L44FRQ0g4RBnBk9UzErGjTkyOTat/JRd1XmDJroN2CxT0O+D0ao/Mjdh0puA0+8Cj
         /TY0tYG5MEAVU4aoZ/IxMMx9VEqh1VCZecdFHVFNw6eUuzaVFFHPzZj5FGt3mltomdBE
         v/epeYseDNZNBfugJDgNZZMALDaMkUU7IpT/teqFFki2BriRGdaPlPFTq8i6ZxTh40Lf
         yYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pafeWJqPWSzML5IKIelSIvDv0keQ7te+q4e+ypc6O3s=;
        b=b+e/tnWCuMCsWZUFnBaT4aY2CuuMQQZvjON2hlSl88fPcel64qPhrFzxHs8sV5F/5r
         wCEFNb+SuV3FrvUIEZOTmqqfh8qQaLaUXcuCgkh21eyvdSNJUybN+aTJegPfxn+q0j+1
         SRKIh7RQ/ySRSvMudAnfMzk3HqyxZ+kjkWVkaEe2unqW6dGfncvHvYs8Rgyr+K3mMzjo
         hHk2+QCCVYp144mG0xjWagoLDorla4GRMXPLxBSElau/FHrqzxU/+MYmdLyCYKX0lDk4
         UMTQDwbHo8DUKeEX0Z2LPimJOJZwvPfxzf9OuomUHacYk1y6D/etYDPNJ87aPe6dJy7T
         7LFQ==
X-Gm-Message-State: APjAAAXKjF8pRvckHjIM/tR5cfMo0nxBHIWX0Ll3P0mJRHv/W4o1SwYi
	TwCschReNOif51q8of7xP1c=
X-Google-Smtp-Source: APXvYqxsQfXST4dMEubkn5Y78OFIAimnfQinlv+2Cz5CIx42i2qKQIW34m/X/XOb4Dfn9kHPxCJyBw==
X-Received: by 2002:a81:3651:: with SMTP id d78mr18306948ywa.237.1562078164808;
        Tue, 02 Jul 2019 07:36:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c6c6:: with SMTP id k189ls495991ybf.15.gmail; Tue, 02
 Jul 2019 07:36:04 -0700 (PDT)
X-Received: by 2002:a25:3b51:: with SMTP id i78mr13863961yba.322.1562078164351;
        Tue, 02 Jul 2019 07:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078164; cv=none;
        d=google.com; s=arc-20160816;
        b=FRX10Z3rIJg49xXwdSU5bC/YwoTh55TVnVQxk67Y6XwsY8QAr1woRVjLYDiFJ6bnnr
         KOYfZ1VDOuLJBXz/fNMMmRd1KAwjvXpZ1n6dDI9Ve0DFJFOorMOb77CGAJQQHI07Imsy
         RYLMpQYJfr1ImJMvAqkFoMP29g5NRgzzfg+pBu6HL0fm8SF/hw6hJ4/PwPiicdst2uGl
         2mEoUJpe1FT3ZTcIn3+wVq36ugZiV7yDAxqGkO3lwb0j0PWjECYvBXA2yGlKlGSNCoQW
         0QgqKdztZseVMFt8eTymPS0wok7aJY6aJ0qKcHvsm5k7j31EYHaGe7o/3/a3nPx/erVB
         LbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B7KSQ0kN44nq/DmgvVKcXz3ydc8afq6rWwYuzhnTuB8=;
        b=vNihOy4S1ceUyhMmsYMv8DAAsx0B4RmrJ+ZDgwETn5jFi/evDQhMklyyR3PrRNW/qu
         8RB9LknEnVAfVxdYi9g8+y4b138lSUJ23zkGYaH6DYl9OvLiNulM2nZhc8D91AjE9806
         zLpA3NuW3BeKVXdqASVcgAmddWWbHC42p/6goy5iVKthbQP1fhQqKp+Kn69Ei1D1JIfk
         5TeiVVZ9hAHrx5kmOAwdj2EGLE6zGpWv4bmJ+ctn1Ke7UUY/IggvCXcc3wHvzIriAXRQ
         YIEAO2pF62RqM76xCQS5FToinpq13aPWS0i05sq9z9JsdIA0gKCEVKuelk2KFixLC9bc
         SHdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CV44+Pnw;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id r13si498718ybg.5.2019.07.02.07.36.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Ea30G084309;
	Tue, 2 Jul 2019 09:36:03 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62Ea3nB130091
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:36:03 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:36:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:36:03 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHY022917;
	Tue, 2 Jul 2019 09:36:01 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 2/6] arm-common: Introduce iommu functionality
Date: Tue, 2 Jul 2019 20:06:03 +0530
Message-ID: <20190702143607.16525-3-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702143607.16525-1-p-yadav1@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CV44+Pnw;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.141 as permitted
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
index f492e409..198fef5c 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -269,6 +269,8 @@ struct jailhouse_system {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-3-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
