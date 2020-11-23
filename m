Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBT576D6QKGQEQSSHXHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id C976C2C16B2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:11 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id l12sf7017093edw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164431; cv=pass;
        d=google.com; s=arc-20160816;
        b=i2MESzMZhx4GBgU6eA6Whr7cKVoWPnwoWHk76cO2x74UJZ1vaQnPGfMlc3mt5Eo7TU
         lTS+Dg9jnz0ojhWk6JOz4cys3+neGitXgEZizqz5xBOnUxcoVj10tWWIwx+Rxr2qtNyU
         i0wmV9Fwq7Y0QnUBPtNQyLWADjIcTDyGG2ihRBPJudz/d3AFgjF2iaqa+XhVooxelQua
         5cK7bo47Zljax2RIW1rkFfgmYnmlUz8rg8LuCZDs9lxW+drS+Amoe2KuQl456/5uwbNT
         Z6FQLS+PLe8WzD9jg0FDaHAfw8ib2CnRmSM3NmBJeVRS7E3MuluDUYlpyn/3Aav7/mni
         CZHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=wwFaUgjJ8bfoZaTCaPgASupb/ztICDA/973Fj5gpoV8=;
        b=slepBCpYd3qf96jQXt42qMnT7mH9KLOZ8CyvbXkKLKIdity/iaQiXs3OoL9rEuvhEY
         zw0GFUirqntyWQAwdG/uPMqpfwWCmKxL851QIpTT878fwjs3KpAnV3TqHSdDIKK/Dkp2
         GwBq9aUtW3iaU2W1YaQJ5ky3LcqamcZPJroXceeNo/3Um37A8ZN34md5trk3pIdZv7/m
         KYQB057WQsLeUAs3huh5szD5d/C6Id1HiD2f3HzSqraFeBlISWKsPXat33QSSeNUgI81
         If/7uMc8iRYIZ2/Q9Vz7710WQoiBT/xOHULPqxDJ9MLwZQyAeCAtimR0WnBch9iK4OMD
         qc/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Jw9wI2o3;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wwFaUgjJ8bfoZaTCaPgASupb/ztICDA/973Fj5gpoV8=;
        b=Xv25XVQTVHT8so9dcaZVXk9Qu8UDP6AM/m9e0K2zEjgen8reGJy7UYbaRuZ2w1Yh9B
         S3gnB0ngvOJ/CYeQ/jzMyG2YB4SmDH7KVS/CeAh56NZZhP7s01NHJlzZAwsTh8CpGPi4
         OJhXDloYuDrY0Vl8quoBAxp1lloAuOBcjJi9P8XUH2NRSyuRvnJfwJCfRBi7krd7DRP4
         VustGAUHK+7gtvzotS1PCXesV9+lgSc7PVMPbafBY58uZkaPQQPTURym2Tubzsfeaf8t
         OwDFUa20d4o+944OBBGZPLyKLGErYrE91mwsW3tef5f0qSo5JUaCbG9zLK7DGjpMqb4Q
         jipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wwFaUgjJ8bfoZaTCaPgASupb/ztICDA/973Fj5gpoV8=;
        b=SM8Tjc2lYNLTWtu1ldar1XF2QzeWhNdbwcPC6pkrm4NZilezWnislgYBs8NSyJRQdR
         Kgv9tl3DdTE1eeFKmN5l5hc1px8uutuZOaBZ+2wJA204sFVMPbJKawX+6MiqKn7ZJBkM
         Avce15MK45XtYv1BLbE27x63OjgFLg4kwSeAVYFC1XpOyDhZKzm5VrGONbnOHnPwiNpf
         Js8FNiRQ/2FLYKehur+8Svx1j8UQ2nLJre1DbFHy7fxi0JGf3xb6gh0NvduxHUW3Kc8s
         Cz0rK+uYfxrdS7F8WNMc6eTT0zDjnzrKIfYEyhuGYZDm3YlE2uheQ+tjPX9sXpXiYYdd
         0Ttw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Lhge3zPOQDbsoT0FB+D8Zx+WRjf6wGD2n81kZ7j0zJCZVkYYD
	YeXLR7RY2tTwg1Tlj4Alnqc=
X-Google-Smtp-Source: ABdhPJwAjI1clWcHxQ6eLDBWcrwSgtY3QbjY4Z/hEBN7cXPgBjxTlMwOIejfwVYBCHzJEmi5Nl4twA==
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr1303939ejb.78.1606164431580;
        Mon, 23 Nov 2020 12:47:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b5b:: with SMTP id v27ls6610882ejg.7.gmail; Mon, 23
 Nov 2020 12:47:10 -0800 (PST)
X-Received: by 2002:a17:907:2631:: with SMTP id aq17mr1275450ejc.497.1606164430478;
        Mon, 23 Nov 2020 12:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164430; cv=none;
        d=google.com; s=arc-20160816;
        b=DdOaFeowhs8S9RcuSwfRVdLznJttXuecFUvL3OKum2e4liMdQqLa5qYkBPEAB73tQP
         bngyXbzorozoqxTdgTDMkjp0nCcMD9Pyzd82797t4GMndK6wxhoJ3RjEk0YjxY173qvc
         8NVyKYlbHAYHT7yF6Gm5uaBm9GvLJLiTT2NzQiU8gPmhWkUJ9KB1JbHQrx9nre9tCiUu
         550+Ie3nYrYiNCSXq10ayw7jhh3mp+JcjqPaGKskp9MGwzPS7Gg9xb1cMWMXO9C01sTf
         XzeUzJZ5s6SUycXr+hwUgyjPphY294H6Xvn8HryaSjC6DohXTVRY5ZW9l+Kuxe6bCZsy
         zQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i3g2oINcIwlNk0jg5d4fTxetkM1io+yGtPFaO1w8ErE=;
        b=xjNIRwMP4WtFPy2klbTvigrGLgeTESOVIaoPv+XeXLq9XnoVt47bI44PXyeC8edpay
         XPBouNuq2Bsvapxr369MwHlrYN74Tajfb5jqVKYYZLxMDC47xJwzggaXIplWpS0XC4ry
         A0VCLeP+zBUFjrUEgmjO4/4gohXPMVpZsDQZ49tDfMjrtEjGh/DFJggk8SMT5yWo7mH+
         XDv2HOmjAVeTOcLumUHrPWssjc6lMFSBXZlT/CcjrV8NVV1muIYgmP7y4UKBi4BN1Ft6
         6gqm9mAth+3ssIK3DylzrLFljlqKum3G/2MnA+kDM+0R3xCHcFYJsthQm1oVwoS1+IDq
         Vncg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Jw9wI2o3;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id a11si257857edq.1.2020.11.23.12.47.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjV1MBdzyTf;
	Mon, 23 Nov 2020 21:47:10 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
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
	LRZ_TO_SHORT=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 5QwEQ4WG3M9W; Mon, 23 Nov 2020 21:47:09 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjT25FdzyTj;
	Mon, 23 Nov 2020 21:47:09 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 02/14] hypervisor, driver, archs: add basic empty infrastructure for coloring
Date: Mon, 23 Nov 2020 21:46:01 +0100
Message-Id: <20201123204613.252563-3-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Jw9wI2o3;       spf=pass
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
index 57b25dbc..ec825a16 100644
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
index 472cb4bb..e62e692b 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-3-andrea.bastoni%40tum.de.
