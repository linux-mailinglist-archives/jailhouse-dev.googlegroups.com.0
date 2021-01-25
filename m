Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG7GXKAAMGQESHY25TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027830248A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:32 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id u17sf7278997edi.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576092; cv=pass;
        d=google.com; s=arc-20160816;
        b=s3ZopGerKiCMQsZ2QLtTO6EIYE6cu1hRxaZ4nvxjFKnJr/3XS6Hp9pdgIv3D4n/zhA
         jMmyXzNPAQmvcBWwu8c73VVAc7iVs54RcL9ItKtjMFDWkSF1x/MyQ32L/kuEWCN1kvsK
         KlnFPEBFVLAkSlkNuSEjcK3FXtY7GUmfIXVyFJEDmP5eJgq/1Op7kyDlfCFsT/W14T+V
         EfaapRs60lQt9rucf/bauxA1f688wHS9g61YvmdOUTEspHg/QEBQiSa46Nu6YzqY3Uz4
         9TW3dZ34G1gIaPiW2NoWdqS2Iao82wJiANs1iREGk8NgLM6b+4EQhAXjfC6P23iqW4rc
         +IsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lGmLr3QhtyYxaTbkLAU/zbl+FaaiKj+gLIxf5+R0m7w=;
        b=ZC0foJElJtFgf2X/X4+hsvPubpaUwSS2Sns4tAITy9o93SQzSRcC8EbpO3JqvLGxu0
         fEYhy6QVTTDd3z5+hg6Lt/zvMmqK5ZDDivfgre7m51FXQKezxjNyKviXi8BrO9QKJneg
         sYl9qCy3tfDm4cR237HWIb/YDR5ICD35DNIG8CFAVWIWDPzJ3vvW0QHx32QaQy0wAxHT
         yFSRIXzUrqfKPf48cnAIGov0SzxadcidAAfBGfJeDys9Df8CRS0Qp5NYlr1K3XNaf1Qf
         UoHEI7y7bUKqG4AK7c6PC9u1D1SXYh7f86EOvXSxHOhndtp5iCc0iOpYmnncGmIJj2Rc
         62JA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CLOrlWwv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lGmLr3QhtyYxaTbkLAU/zbl+FaaiKj+gLIxf5+R0m7w=;
        b=sM//DNOfeNJBt2O1khXLVcJi8HGV8UbvmWBwNirXX/57EmQDJzs00IuEBWixPoEk09
         Sc1cLNRavmpWivzV1fs8khgGmOUjdG3IANgb/AVPXOCPV1V9QtWaNVjTbLxH7c3d7gqR
         WgigUSE46gbuT5KmIDeE+vz6A+aRdfUQwS5fYkpt3g4coFDreQb+8jTdkwen3qR7oWnY
         /1tWn1ZIJNhT/j2Lf2WFdRs0JwjDQPcQntYBiXnmO/MP89E5wkt8ir8s+bMJEophz+Na
         /uwTIzjes4KyNGTKmjM+EIVW+8y+0NLhSjHq01gJo+7fW7EE+VVyKalFbBeYv82v0XZd
         XuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lGmLr3QhtyYxaTbkLAU/zbl+FaaiKj+gLIxf5+R0m7w=;
        b=MyYauKHgmpDMETnH7thH67Nshiwgh+YnNzMpnZLognQqJEzCSQCCqNPHgnNNSlCDRo
         cayFZ/eBmwJTI/hW7lfOMneOO0n94drEdNNA7r7+abaJ8B6ucL9HFrOJ8fQclRZqefxW
         6r/pFCg9vd9iyFAkpoxdc7zRqTIOEv+7XCUQCgtEpUSNLLNkTmf5oUg1LYO5MKp9gw32
         8mx2yvl4vTgXx3JcxShBm7AjA2ut7rXfolTljaQbWoCRjWDJU9zzwI9i0E3/27cnxAUp
         bIRUsr/g7ZPA4onF+mbLJ3o6S6IfrtZU0SUceiVN/2oXSPh4oQ3sQAKqogMKmZhxTtq5
         IYhw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Zmi0W5JSDhXN1nh5h3AKk1mQ3up3153zzHsPyXlbYYeO3weNu
	9gOEskU7Y+RMkn9VMjiWKco=
X-Google-Smtp-Source: ABdhPJyeWzRfqeO4OpaVPKe50ZhU6f0OD8jRx9xJz6+A3a7Hesih39Z8H3/wm9DyDULKp3+hoKLdIQ==
X-Received: by 2002:aa7:cd62:: with SMTP id ca2mr136793edb.81.1611576091782;
        Mon, 25 Jan 2021 04:01:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c159:: with SMTP id r25ls16118348edp.1.gmail; Mon, 25
 Jan 2021 04:01:31 -0800 (PST)
X-Received: by 2002:a50:eb96:: with SMTP id y22mr140496edr.159.1611576090959;
        Mon, 25 Jan 2021 04:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576090; cv=none;
        d=google.com; s=arc-20160816;
        b=hHhJVFTnlbQQi5EsV2PeTHiMcYDwDyUBSKALm6k8x75uF+g7xRyNH7dw7uq+XynxWR
         IhmX8JcMqymyQnd/vtErcZb4D2boh2DEcCtP6fl5Zq7Ru5nc87enARkp32jv6AykFv3Y
         Chiwq9SAs/KR2Gtb+Bi/+DMCC/esvt+0RYFGvrNZ0Qyu6KoUnQ1pHGhAwU48gwtQhHt1
         w7j7r+4DTPxBnBgObNn56UhhGHo0S/+mdGHaHPO90jTotaymIVcOyl1Q5drL3o12VeJb
         +qfUlc2Gt0Y4ztu/Z+/LrtWP7pQDPLt7EOC5qYg/jvRqWo0YU0hk92Ne1fcZVokIdwKq
         bP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tmrVhbkLznf/umABjjzs6D/2/aGiotAsFHvdltopYPI=;
        b=qKPrAbmnSyCgHv8NUb8H0nLPKm0AVJXrG1nNXD7KAnPZWcDBtLJt0lK0NZYRl8CFKf
         sYsTDIifLyrQf+pdMRDxbWNM5JuwcjXVn8zwNmC4lr44w1Ba3DaCQrzNOtS9iSYLf46v
         ePi4vu7VAh0/tdYBXpHlwGv7MXBM2YRS81VQIM23MxDw9gVqRQGA+F5LZY8vp1K0IoEt
         LctG5sYjbxDDca5l9cZYt7ZtN9k/J0AU7x/Zisnh2jKXo1SHzSl0lv1bGV1S5ktutyj8
         mRuL0iDUszgxvLTXFaRWHfUqLulYcC/s5eEQhG2o9mDIpGDGePH2tTerYBeDDBkEPT5u
         5Ogw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CLOrlWwv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id k20si748708edx.3.2021.01.25.04.01.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3t4t6Jzydw;
	Mon, 25 Jan 2021 13:01:30 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id vOTYvlwtwX9p; Mon, 25 Jan 2021 13:01:29 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3s29wpzydg;
	Mon, 25 Jan 2021 13:01:29 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 02/23] hypervisor, driver, archs: add basic empty infrastructure for coloring
Date: Mon, 25 Jan 2021 13:00:23 +0100
Message-Id: <20210125120044.56794-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=CLOrlWwv;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Add generic architecture API layer needed to implement coloring:

arch_color_map_memory_region()   // cell_create
arch_color_unmap_memory_region() // cell_destroy
arch_color_remap_to_root()       // cell_load
arch_color_unmap_from_root()     // cell_start

Currently only arm64 will implement the API. arm32 could be also a
possible target for coloring. x86 already features CAT support.

ARM architectures also implement:

arm_color_dcache_flush_memory_region()  // range flushing
arm_color_init()                        // hook for the initialization of coloring

The architecture operations implement functionalities that consider the
color assigned to a memory region when performing the VA <-> PA
translation.

This patch uses a reserved memory region as mapping-scratchpad to
perform coloring during the load operations. The mapping is removed
during the start operation. A later patch makes the start of the memory
region configurable.

Refer to the Documentation/cache-coloring.md for an introduction of the
coloring isolation software techniques.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 driver/cell.c                                 | 10 +++-
 .../arch/arm-common/include/asm/dcaches.h     |  8 +++
 hypervisor/arch/arm-common/mmu_cell.c         | 52 ++++++++++------
 hypervisor/arch/arm/include/asm/coloring.h    | 59 +++++++++++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h  | 59 +++++++++++++++++++
 hypervisor/arch/arm64/setup.c                 |  3 +
 hypervisor/arch/x86/include/asm/coloring.h    | 45 ++++++++++++++
 hypervisor/control.c                          | 56 ++++++++++++------
 hypervisor/include/jailhouse/control.h        |  7 +++
 include/jailhouse/cell-config.h               |  6 ++
 10 files changed, 267 insertions(+), 38 deletions(-)
 create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 hypervisor/arch/x86/include/asm/coloring.h

diff --git a/driver/cell.c b/driver/cell.c
index ade61edb..30a4c501 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -333,7 +333,15 @@ static int load_image(struct cell *cell,
 	if (regions == 0)
 		return -EINVAL;
 
-	phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+	if (mem->flags & JAILHOUSE_MEM_COLORED) {
+		/* Tweak the base address to request remapping of
+		 * a reserved, high memory region.
+		 */
+		phys_start = (mem->virt_start + ROOT_MAP_OFFSET + image_offset)
+			      & PAGE_MASK;
+	} else {
+		phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+	}
 	page_offs = offset_in_page(image_offset);
 	image_mem = jailhouse_ioremap(phys_start, 0,
 				      PAGE_ALIGN(image.size + page_offs));
diff --git a/hypervisor/arch/arm-common/include/asm/dcaches.h b/hypervisor/arch/arm-common/include/asm/dcaches.h
index 87c316dc..26c5201a 100644
--- a/hypervisor/arch/arm-common/include/asm/dcaches.h
+++ b/hypervisor/arch/arm-common/include/asm/dcaches.h
@@ -11,6 +11,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_DCACHES_H
+#define _JAILHOUSE_DCACHES_H
 
 #ifndef __ASSEMBLY__
 
@@ -22,7 +24,13 @@ enum dcache_flush {
 	DCACHE_CLEAN_AND_INVALIDATE,
 };
 
+void arm_dcache_flush_memory_region(
+		unsigned long region_addr,
+		unsigned long region_size,
+		enum dcache_flush flush);
 void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush);
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush);
 
 #endif /* !__ASSEMBLY__ */
+
+#endif
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-common/mmu_cell.c
index 7f9bb10a..202cc621 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -16,6 +16,7 @@
 #include <asm/sysregs.h>
 #include <asm/control.h>
 #include <asm/iommu.h>
+#include <asm/coloring.h>
 
 int arch_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
@@ -73,9 +74,33 @@ unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
 	return paging_virt2phys(&this_cell()->arch.mm, gphys, flags);
 }
 
+void arm_dcache_flush_memory_region(
+		unsigned long region_addr,
+		unsigned long region_size,
+		enum dcache_flush flush)
+{
+	unsigned long size;
+
+	while (region_size > 0) {
+		size = MIN(region_size,
+				NUM_TEMPORARY_PAGES * PAGE_SIZE);
+
+		/* cannot fail, mapping area is preallocated */
+		paging_create(&this_cpu_data()->pg_structs, region_addr,
+				size, TEMPORARY_MAPPING_BASE,
+				PAGE_DEFAULT_FLAGS,
+				PAGING_NON_COHERENT | PAGING_NO_HUGE);
+
+		arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
+				flush);
+
+		region_addr += size;
+		region_size -= size;
+	}
+}
+
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
 {
-	unsigned long region_addr, region_size, size;
 	struct jailhouse_memory const *mem;
 	unsigned int n;
 
@@ -83,24 +108,13 @@ void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
 		if (mem->flags & (JAILHOUSE_MEM_IO | JAILHOUSE_MEM_COMM_REGION))
 			continue;
 
-		region_addr = mem->phys_start;
-		region_size = mem->size;
-
-		while (region_size > 0) {
-			size = MIN(region_size,
-				   NUM_TEMPORARY_PAGES * PAGE_SIZE);
-
-			/* cannot fail, mapping area is preallocated */
-			paging_create(&this_cpu_data()->pg_structs, region_addr,
-				      size, TEMPORARY_MAPPING_BASE,
-				      PAGE_DEFAULT_FLAGS,
-				      PAGING_NON_COHERENT | PAGING_NO_HUGE);
-
-			arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
-					  flush);
-
-			region_addr += size;
-			region_size -= size;
+		if (mem->flags & JAILHOUSE_MEM_COLORED) {
+			arm_color_dcache_flush_memory_region(cell, mem,
+							       flush);
+		} else {
+			arm_dcache_flush_memory_region(mem->phys_start,
+						       mem->size,
+						       flush);
 		}
 	}
 
diff --git a/hypervisor/arch/arm/include/asm/coloring.h b/hypervisor/arch/arm/include/asm/coloring.h
new file mode 100644
index 00000000..12d973ca
--- /dev/null
+++ b/hypervisor/arch/arm/include/asm/coloring.h
@@ -0,0 +1,59 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See the
+ * COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_COLORING_H
+#define _JAILHOUSE_COLORING_H
+
+#include <asm/dcaches.h>
+
+/* Coloring is only implemented on arm64, nothing to initialize on arm */
+static inline void arm_color_init(void)
+{
+	return;
+}
+
+/* Make sure we catch incorrect calls to these functions for arm */
+static inline void arm_color_dcache_flush_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr,
+		enum dcache_flush flush_type)
+{
+	BUG();
+}
+
+static inline void arch_color_unmap_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+}
+
+static inline int arch_color_map_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_remap_to_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_unmap_from_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+#endif
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
new file mode 100644
index 00000000..54bfa9dd
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -0,0 +1,59 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See the
+ * COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_COLORING_H
+#define _JAILHOUSE_COLORING_H
+
+#include <asm/dcaches.h>
+
+/* Initial empty stub for coloring functions. */
+static inline void arm_color_init(void)
+{
+	return;
+}
+
+/* Make sure we catch incorrect calls to these functions for arm */
+static inline void arm_color_dcache_flush_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr,
+		enum dcache_flush flush_type)
+{
+	BUG();
+}
+
+static inline void arch_color_unmap_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+}
+
+static inline int arch_color_map_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_remap_to_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_unmap_from_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+#endif
diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index a24bf1d7..548e49b7 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -20,6 +20,7 @@
 #include <asm/irqchip.h>
 #include <asm/setup.h>
 #include <asm/smccc.h>
+#include <asm/coloring.h>
 
 extern u8 __trampoline_start[];
 
@@ -40,6 +41,8 @@ int arch_init_early(void)
 	if (err)
 		return err;
 
+	arm_color_init();
+
 	return arm_init_early();
 }
 
diff --git a/hypervisor/arch/x86/include/asm/coloring.h b/hypervisor/arch/x86/include/asm/coloring.h
new file mode 100644
index 00000000..e1f37413
--- /dev/null
+++ b/hypervisor/arch/x86/include/asm/coloring.h
@@ -0,0 +1,45 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See the
+ * COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_COLORING_H
+#define _JAILHOUSE_COLORING_H
+
+/* Coloring is only implemented on arm64.
+ * Make sure we catch incorrect calls to these functions for x86
+ */
+static inline void arch_color_unmap_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+}
+
+static inline int arch_color_map_memory_region(
+		struct cell *cell,
+		const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_remap_to_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+static inline int arch_color_unmap_from_root(const struct jailhouse_memory *mr)
+{
+	BUG();
+	return 0;
+}
+
+#endif
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2214406f..b99d4380 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -21,9 +21,9 @@
 #include <jailhouse/utils.h>
 #include <asm/control.h>
 #include <asm/spinlock.h>
+#include <asm/coloring.h>
 
 enum msg_type {MSG_REQUEST, MSG_INFORMATION};
-enum failure_mode {ABORT_ON_ERROR, WARN_ON_ERROR};
 enum management_task {CELL_START, CELL_SET_LOADABLE, CELL_DESTROY};
 
 /** System configuration as used while activating the hypervisor. */
@@ -319,8 +319,8 @@ static int unmap_from_root_cell(const struct jailhouse_memory *mem)
 	return arch_unmap_memory_region(&root_cell, &tmp);
 }
 
-static int remap_to_root_cell(const struct jailhouse_memory *mem,
-			      enum failure_mode mode)
+int remap_to_root_cell(const struct jailhouse_memory *mem,
+		       enum failure_mode mode)
 {
 	const struct jailhouse_memory *root_mem;
 	struct jailhouse_memory overlap;
@@ -380,17 +380,23 @@ static void cell_destroy_internal(struct cell *cell)
 	}
 
 	for_each_mem_region(mem, cell->config, n) {
-		if (!JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
-			/*
-			 * This cannot fail. The region was mapped as a whole
-			 * before, thus no hugepages need to be broken up to
-			 * unmap it.
-			 */
-			arch_unmap_memory_region(cell, mem);
+		if (mem->flags & JAILHOUSE_MEM_COLORED) {
+			/* Coloring requires fine-granular unmap + remap */
+			arch_color_unmap_memory_region(cell, mem);
+		} else {
+			if (!JAILHOUSE_MEMORY_IS_SUBPAGE(mem)) {
+				/*
+				 * This cannot fail. The region was mapped as
+				 * a whole before, thus no hugepages need to
+				 * be broken up to unmap it.
+				 */
+				arch_unmap_memory_region(cell, mem);
+			}
 
-		if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
-				    JAILHOUSE_MEM_ROOTSHARED)))
-			remap_to_root_cell(mem, WARN_ON_ERROR);
+			if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
+					    JAILHOUSE_MEM_ROOTSHARED)))
+				remap_to_root_cell(mem, WARN_ON_ERROR);
+		}
 	}
 
 	for_each_unit_reverse(unit)
@@ -531,10 +537,16 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 				goto err_destroy_cell;
 		}
 
-		if (JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
+		if (JAILHOUSE_MEMORY_IS_SUBPAGE(mem)) {
 			err = mmio_subpage_register(cell, mem);
-		else
-			err = arch_map_memory_region(cell, mem);
+		} else {
+			if (mem->flags & JAILHOUSE_MEM_COLORED) {
+				/* Coloring always at page boundaries */
+				err = arch_color_map_memory_region(cell, mem);
+			} else {
+				err = arch_map_memory_region(cell, mem);
+			}
+		}
 		if (err)
 			goto err_destroy_cell;
 	}
@@ -633,7 +645,11 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 		/* unmap all loadable memory regions from the root cell */
 		for_each_mem_region(mem, cell->config, n)
 			if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-				err = unmap_from_root_cell(mem);
+				if (mem->flags & JAILHOUSE_MEM_COLORED) {
+					err = arch_color_unmap_from_root(mem);
+				} else {
+					err = unmap_from_root_cell(mem);
+				}
 				if (err)
 					goto out_resume;
 			}
@@ -711,7 +727,11 @@ static int cell_set_loadable(struct per_cpu *cpu_data, unsigned long id)
 	/* map all loadable memory regions into the root cell */
 	for_each_mem_region(mem, cell->config, n)
 		if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-			err = remap_to_root_cell(mem, ABORT_ON_ERROR);
+			if (mem->flags & JAILHOUSE_MEM_COLORED) {
+				err = arch_color_remap_to_root(mem);
+			} else {
+				err = remap_to_root_cell(mem, ABORT_ON_ERROR);
+			}
 			if (err)
 				goto out_resume;
 		}
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index f2b07c0d..76eb0428 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -132,6 +132,13 @@ void shutdown(void);
 void __attribute__((noreturn)) panic_stop(void);
 void panic_park(void);
 
+enum failure_mode {ABORT_ON_ERROR, WARN_ON_ERROR};
+/**
+ * (Re)Mapping of a cell memory into root cell upon loading and destroy.
+ */
+int remap_to_root_cell(const struct jailhouse_memory *mem,
+		       enum failure_mode mode);
+
 /**
  * Resume a suspended remote CPU.
  * @param cpu_id	ID of the target CPU.
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6b54e34b..8a3a201f 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -115,6 +115,7 @@ struct jailhouse_cell_desc {
 #define JAILHOUSE_MEM_LOADABLE		0x0040
 #define JAILHOUSE_MEM_ROOTSHARED	0x0080
 #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
+#define JAILHOUSE_MEM_COLORED		0x0200
 #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
 #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
@@ -127,8 +128,13 @@ struct jailhouse_memory {
 	__u64 virt_start;
 	__u64 size;
 	__u64 flags;
+	/* only meaningful with JAILHOUSE_MEM_COLORED */
+	size_t colors;
 } __attribute__((packed));
 
+// FIXME: COLORING depending on design discussions, keep / remove / adapt
+#define ROOT_MAP_OFFSET                 0x0C000000000UL
+
 #define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
 	{								\
 		.phys_start = start,					\
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-3-andrea.bastoni%40tum.de.
