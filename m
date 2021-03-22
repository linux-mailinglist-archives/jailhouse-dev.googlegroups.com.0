Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWXH4OBAMGQEQBYT2VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BB634502E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:31 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id j14sf75980lfh.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442331; cv=pass;
        d=google.com; s=arc-20160816;
        b=V92aTsqlS4mzAqa2VWGVahisWqc6Exle0uRFY5B/0elcoP9NNlMbiLJtHFskPXDXb8
         rqsGGmOuJj/xeVp8FptSJANU/25TH4rVFXI064CZox5RMBMFKQOAXbhMPcndpeBIv1nT
         GErcboASWGjpKg0gy3uT+NjRym0N7uwGE86P31cDVWMA8O7HfWHuG/J/z6VALjjRkPBS
         y3VBtEt770uuulBYVU5suHj+ypeloBtP/yM/1AnczRLWHdvr1tG5OcNqWRql+i+YCa6d
         MSHIfa3OKgV2yg6tj0LKaUaSt9L4Vww9BjQZRsgzwjtQKzNXLMp6AJQRggkjczGT0vTE
         Wx/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=EpbpP7SverXT8rfsWzdCz2m4ukhrPGK+3hUDgEGAVhw=;
        b=jJI5U+UAnJLivvVSw0s4Z6eB9tSe7VEFBrPbiqedGDfhfv9UOlu1vdjor+RQzidJQE
         mYPXXf5ugXi917S352vfeC0kDLE0rLdcC7bMqYFrVbzo7hgzLmB/9DCFFZXW2bVJMGTZ
         t7bRUKMY4xp4/wwAQU8Q+p0hhjKdzpTUIVvAvuWDqRYptYZcaNBwxoRnQ+wP8npvNWg+
         yRv5yi3QxTD1nivOIKllWVTmLFxe29banEP3h4NEgiHqePAWoN5on7ebmUzRTGcMJHL+
         UQGVivuVRoNn7ke7lV8sRhjcAMfT84LHtmnr3Es8VlDvA6bta2pCGSTAKATSgf945m/W
         MH2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1X56fHRZ;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EpbpP7SverXT8rfsWzdCz2m4ukhrPGK+3hUDgEGAVhw=;
        b=Vqc5LGJ8+d5KX9E9J+Lmnjwo4aMCZ0MwYSlhapC20uY0wNbJ75VxSbT5zJ6m76u7oq
         3Ipql7tXnJ5LtNlktiRbUwyjSDrds+53UoaKkubS/RrQPLrMV8xcw53iAam6KoZ5Wbc5
         vykLkWrTuYcPsBmbtIuvsHmGibNxRBuIpV3KwN6JF9yxNXnFnnnHdASChABRsYFrEKW2
         WCAf4/QSPiAUx49Q1kNVzhxvhMiIWGJFKZyFVvdGc28/Y/F3LxrfNBAGPHsDm6i0UGIB
         VBaceRpKjwyqFXl7UGue5Eu2Anj+p6KU6eBwhjc5MAerRJHYoFcxJ0sgxfqH64Y1svg3
         Q68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EpbpP7SverXT8rfsWzdCz2m4ukhrPGK+3hUDgEGAVhw=;
        b=sPVPlpC2EctTiR5PSP/2zKjzTUzs79+m8lhoLbtD1dgSjbE7lFam3l/3UAc1Wdzc2A
         ldrm9phQIYN2DmUGUMReDV993YV5FdFuOzud8QFVfptDmuzcnbFxPPa2Z1Q65bdW/RFh
         VxR4L/+7AKULCPLDhKm9R8ymo0qCKbO4hIQHlZJEGqsXUo/Ai8IDanCgQPSXu1KaPZeG
         Ld5BfdiY6vbYGS/S6WEzRdx6iZ+3HX4FvbjVItwgUgeyH8siZhTheNQMdDHNk0lldUbC
         zklGh5alqDU6q9ZaSSh7TRuVU6rC8ghA9hw3Csrzdvs7G1ticYILM4qVCJFZ2iGzHNUf
         VAqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xWPpnX2od1P6QZBJIYAulDGmuK2/7+vwgAKN8oMQ44czPk//d
	4pWDThA4+uJqcPzwsZHbFs0=
X-Google-Smtp-Source: ABdhPJwTDPg6r5hSG8f6z42TrvHH2dojrtsfYr5gvp+XfpRXm2i0g/dJUm8+kcZcNb3eJnN6Mm5O2g==
X-Received: by 2002:a05:6512:2026:: with SMTP id s6mr496798lfs.43.1616442330893;
        Mon, 22 Mar 2021 12:45:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8503:: with SMTP id j3ls2667079lji.6.gmail; Mon, 22 Mar
 2021 12:45:29 -0700 (PDT)
X-Received: by 2002:a2e:5c03:: with SMTP id q3mr718228ljb.68.1616442329797;
        Mon, 22 Mar 2021 12:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442329; cv=none;
        d=google.com; s=arc-20160816;
        b=O2j6vte9TX2bcJXtad349ry/IOn6ovxD4rx9dbt9PybDInpn65QOJLckbilESsicXb
         hPIVbvOgD+lcIaBpL1Mhe7FplxAM4bMDWICTDyvSzlt3v9ihAXjB/cvLGUGZyO4ospx7
         D0dSIS6QgcziURmsYtapOQo50abNvA9E9eyoGy/yTOrVij3+6CbswfQjDF8JqzGMANXZ
         zA1fd3sKGM5bA0CjBOgfCCslBVlE8fZL8woeMncQ2/T9EX+YLCma2bS1IW9nEqfQ8Buy
         LIdWpjFEGgs4yvcbMae0JhtKaPMPKxlXZHqHi285y5TqUR/TIcwfrnAkgSZvwPQMj/6U
         qXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oMO8npt41mBdxYt4VNez0u122GbXvXMM/n4DA0ME434=;
        b=eYPqlE6ILAXF/kWVP5AQ5oc5d/ic+KLg0/FFSag8xwUn3fplE/jXRg4dvbggK3WG6A
         o3aKV4X0MSCnQKp/s4ZXoJRlW/iKFsOrIM4qNkWAsygXY3H5DlfMpBXvdzAPfRaVp27R
         WgsYM4ZGJh7zVvyw0dEzweZpA2uaZWlK8aN0diYR+I/Uv35s5VGMkt1cLVg5sF2QhuWF
         NobY0DS2TaUzTGqSX/0GbvWnLV+3aMEQpDZJuQApehMbQHlaf+fS1460RH0QR+aDG/bA
         mDAMzawECLgpku+FGC0W4mw2rOrXtT6ATA741BPFzJ1n09FMIpdi0t3t3o8f8TmeaodS
         6RfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1X56fHRZ;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a10si568944lfs.11.2021.03.22.12.45.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jP1zmzzyVG;
	Mon, 22 Mar 2021 20:45:29 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id WZ884WAt5rL4; Mon, 22 Mar 2021 20:45:28 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jN1Rv7zyVB;
	Mon, 22 Mar 2021 20:45:28 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 4/9] hypervisor: arm64, arm-common: add cache-partitioning via coloring
Date: Mon, 22 Mar 2021 20:45:02 +0100
Message-Id: <20210322194507.82643-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=1X56fHRZ;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Extend mapping/unmapping operations to consider cache partitions
specified via "coloring" and perform virt2phys mapping accordingly.

Also provide colored flushing of a memory region as well as an
initialization helper to read the configuration parameters (way_size,
root_map_offset).

The root_map_offset is used as offset scratchpad to simplify the
remapping_to/unmap_from root operations when loading and starting
inmates.

Refer to the Documentation/cache-coloring.md for an introduction of the
coloring isolation software techniques.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 .../arch/arm-common/include/asm/coloring.h    |  45 +++++
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  68 +++++---
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 108 ++++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h  | 155 ++++++++++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/control.c                          |  23 ++-
 hypervisor/include/jailhouse/control.h        |   4 +
 include/jailhouse/coloring.h                  |  39 +++++
 10 files changed, 431 insertions(+), 23 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 include/jailhouse/coloring.h

diff --git a/hypervisor/arch/arm-common/include/asm/coloring.h b/hypervisor=
/arch/arm-common/include/asm/coloring.h
new file mode 100644
index 00000000..91aa6285
--- /dev/null
+++ b/hypervisor/arch/arm-common/include/asm/coloring.h
@@ -0,0 +1,45 @@
+/*
+ * Jailhouse Cache Coloring Support - Stubs for ARMv7
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de> at https://rtsl.cps.mw.tum.de
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_ASM_COLORING_H
+#define _JAILHOUSE_ASM_COLORING_H
+
+#include <jailhouse/utils.h>
+#include <jailhouse/control.h>
+
+static inline void arm_color_dcache_flush_memory_region(
+	unsigned long phys,
+	unsigned long size,
+	unsigned long virt,
+	u64 color_mask,
+	enum dcache_flush flush_type)
+{
+	BUG();
+}
+
+static inline int
+color_paging_create(const struct paging_structures *pg_structs,
+		    unsigned long phys, unsigned long size, unsigned long virt,
+		    unsigned long access_flags, unsigned long paging_flags,
+		    u64 color_mask, u64 mem_flags)
+{
+	return -EINVAL;
+}
+
+static inline int
+color_paging_destroy(const struct paging_structures *pg_structs,
+		     unsigned long phys, unsigned long size, unsigned long virt,
+		     unsigned long paging_flags, u64 color_mask, u64 mem_flags)
+{
+	return -EINVAL;
+}
+
+#endif
diff --git a/hypervisor/arch/arm-common/include/asm/dcaches.h b/hypervisor/=
arch/arm-common/include/asm/dcaches.h
index 87c316dc..26c5201a 100644
--- a/hypervisor/arch/arm-common/include/asm/dcaches.h
+++ b/hypervisor/arch/arm-common/include/asm/dcaches.h
@@ -11,6 +11,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_DCACHES_H
+#define _JAILHOUSE_DCACHES_H
=20
 #ifndef __ASSEMBLY__
=20
@@ -22,7 +24,13 @@ enum dcache_flush {
 	DCACHE_CLEAN_AND_INVALIDATE,
 };
=20
+void arm_dcache_flush_memory_region(
+		unsigned long region_addr,
+		unsigned long region_size,
+		enum dcache_flush flush);
 void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush f=
lush);
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush);
=20
 #endif /* !__ASSEMBLY__ */
+
+#endif
diff --git a/hypervisor/arch/arm-common/mmu_cell.c b/hypervisor/arch/arm-co=
mmon/mmu_cell.c
index 7f9bb10a..4c7827ce 100644
--- a/hypervisor/arch/arm-common/mmu_cell.c
+++ b/hypervisor/arch/arm-common/mmu_cell.c
@@ -16,6 +16,7 @@
 #include <asm/sysregs.h>
 #include <asm/control.h>
 #include <asm/iommu.h>
+#include <asm/coloring.h>
=20
 int arch_map_memory_region(struct cell *cell,
 			   const struct jailhouse_memory *mem)
@@ -46,7 +47,12 @@ int arch_map_memory_region(struct cell *cell,
 	if (err)
 		return err;
=20
-	err =3D paging_create(&cell->arch.mm, phys_start, mem->size,
+	if (mem->flags & JAILHOUSE_MEM_COLORED)
+		err =3D color_paging_create(&cell->arch.mm, phys_start,
+				mem->size, mem->virt_start, access_flags,
+				paging_flags, mem->colors, mem->flags);
+	else
+		err =3D paging_create(&cell->arch.mm, phys_start, mem->size,
 			    mem->virt_start, access_flags, paging_flags);
 	if (err)
 		iommu_unmap_memory_region(cell, mem);
@@ -63,6 +69,11 @@ int arch_unmap_memory_region(struct cell *cell,
 	if (err)
 		return err;
=20
+	if (mem->flags & JAILHOUSE_MEM_COLORED)
+		return color_paging_destroy(&cell->arch.mm,
+				mem->phys_start, mem->size, mem->virt_start,
+				PAGING_COHERENT, mem->colors, mem->flags);
+
 	return paging_destroy(&cell->arch.mm, mem->virt_start, mem->size,
 			      PAGING_COHERENT);
 }
@@ -73,9 +84,33 @@ unsigned long arch_paging_gphys2phys(unsigned long gphys=
, unsigned long flags)
 	return paging_virt2phys(&this_cell()->arch.mm, gphys, flags);
 }
=20
+void arm_dcache_flush_memory_region(
+		unsigned long region_addr,
+		unsigned long region_size,
+		enum dcache_flush flush)
+{
+	unsigned long size;
+
+	while (region_size > 0) {
+		size =3D MIN(region_size,
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
+		region_addr +=3D size;
+		region_size -=3D size;
+	}
+}
+
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush)
 {
-	unsigned long region_addr, region_size, size;
 	struct jailhouse_memory const *mem;
 	unsigned int n;
=20
@@ -83,24 +118,17 @@ void arm_cell_dcaches_flush(struct cell *cell, enum dc=
ache_flush flush)
 		if (mem->flags & (JAILHOUSE_MEM_IO | JAILHOUSE_MEM_COMM_REGION))
 			continue;
=20
-		region_addr =3D mem->phys_start;
-		region_size =3D mem->size;
-
-		while (region_size > 0) {
-			size =3D MIN(region_size,
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
-			region_addr +=3D size;
-			region_size -=3D size;
+		if (mem->flags & JAILHOUSE_MEM_COLORED) {
+			arm_color_dcache_flush_memory_region(
+					mem->phys_start,
+					mem->size,
+					mem->virt_start,
+					mem->colors,
+					flush);
+		} else {
+			arm_dcache_flush_memory_region(mem->phys_start,
+						       mem->size,
+						       flush);
 		}
 	}
=20
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 4d328021..a5525811 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -23,3 +23,4 @@ lib-y :=3D $(common-objs-y)
 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
 lib-y +=3D smmu.o
+lib-y +=3D coloring.o
diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/color=
ing.c
new file mode 100644
index 00000000..5ec437f1
--- /dev/null
+++ b/hypervisor/arch/arm64/coloring.c
@@ -0,0 +1,108 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
+ *  Andrea Bastoni <andrea.bastoni@tum.de> at https://rtsl.cps.mw.tum.de
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+#include <jailhouse/control.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/coloring.h>
+#include <asm/coloring.h>
+
+/**
+ *  Only parameter needed to determine the coloring.
+ */
+u64 coloring_way_size =3D 0;
+
+/** Temporary load-mapping parameter */
+u64 coloring_root_map_offset =3D 0;
+
+static int dispatch_op(
+	struct color_op *op,
+	unsigned long bphys,
+	unsigned long bvirt,
+	unsigned long bsize)
+{
+	if (op->op & (COL_OP_CREATE | COL_OP_LOAD)) {
+		if (op->op & COL_OP_LOAD) {
+			/* Fix addr to match the driver's IPA ioremap */
+			bvirt +=3D coloring_root_map_offset;
+		}
+		return paging_create(op->pg_structs, bphys, bsize, bvirt,
+				     op->access_flags, op->paging_flags);
+	}
+
+	if (op->op & (COL_OP_DESTROY | COL_OP_START)) {
+		if (op->op & COL_OP_START) {
+			/* Match the address specified during load */
+			bvirt +=3D coloring_root_map_offset;
+		}
+		return paging_destroy(op->pg_structs, bvirt, bsize,
+				      op->paging_flags);
+	}
+
+	if (op->op & COL_OP_FLUSH) {
+		arm_dcache_flush_memory_region(bphys, bsize, op->flush_type);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+int color_do_op(struct color_op *op)
+{
+	unsigned long bvirt, bphys, bsize;
+	/* bit: start, low, contiguous bit range width */
+	unsigned int bs, bl, bw;
+	unsigned int n;
+	u64 colors;
+	int err;
+
+	col_print("[%c] OP 0x%x: P: 0x%08lx V: 0x%08lx "
+			"(S: 0x%lx C: 0x%08llx A: 0x%lx P: 0x%lx F: 0x%d)\n",
+			(op->pg_structs =3D=3D &root_cell.arch.mm) ? 'r' : 'c',
+			op->op, op->phys, op->virt, op->size, op->color_mask,
+			op->access_flags, op->paging_flags, op->flush_type);
+
+	n =3D 0;
+	bvirt =3D op->virt;
+	bphys =3D bsize =3D 0;
+	while (bvirt < op->virt + op->size) {
+		bs =3D bl =3D bw =3D 0;
+		colors =3D op->color_mask;
+
+		while (colors !=3D 0) {
+			/* update colors with next color-range */
+			get_bit_range(&colors, &bl, &bw);
+			bs +=3D bl;
+			bsize =3D bw * PAGE_SIZE;
+			bphys =3D op->phys + (bs * PAGE_SIZE) +
+					(n * coloring_way_size);
+
+			err =3D dispatch_op(op, bphys, bvirt, bsize);
+			if (err)
+				return err;
+
+			/* update next round */
+			bvirt +=3D bsize;
+		}
+		n++;
+	}
+
+	col_print("end P: 0x%08lx V: 0x%08lx (bsize =3D 0x%08lx)\n",
+			bphys, bvirt - bsize, bsize);
+
+	return err;
+}
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch=
/arm64/include/asm/coloring.h
new file mode 100644
index 00000000..233237fc
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -0,0 +1,155 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
+ *  Andrea Bastoni <andrea.bastoni@tum.de> at https://rtsl.cps.mw.tum.de
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_ASM_COLORING_H
+#define _JAILHOUSE_ASM_COLORING_H
+
+#include <jailhouse/cell-config.h>
+#include <jailhouse/utils.h>
+#include <jailhouse/control.h>
+
+#ifdef CONFIG_DEBUG
+#define col_print(fmt, ...)			\
+	printk("[COL] " fmt, ##__VA_ARGS__)
+#else
+#define col_print(fmt, ...) do { } while (0)
+#endif
+
+/** Color operations */
+#define COL_OP_CREATE	0x1
+#define COL_OP_DESTROY	0x2
+#define COL_OP_START	0x4
+#define COL_OP_LOAD	0x8
+#define COL_OP_FLUSH	0x10
+
+/**
+ * Only parameter needed to determine the coloring.
+ */
+extern u64 coloring_way_size;
+
+/** Temporary load-mapping parameter */
+extern u64 coloring_root_map_offset;
+
+/**
+ * Colored Operation
+ */
+struct color_op {
+	const struct paging_structures *pg_structs;
+	unsigned long phys;
+	unsigned long size;
+	unsigned long virt;
+	unsigned long access_flags;
+	unsigned long paging_flags;
+	u64 color_mask;
+	enum dcache_flush flush_type;
+	unsigned int op;
+};
+
+/**
+ * Colored operations on a cell / memory region.
+ *
+ * Encapsulate the loops needed to iterate through a region and identify
+ * the color-compatible phys2virt mappings.
+ */
+extern int color_do_op(struct color_op *op);
+
+static inline void arm_color_dcache_flush_memory_region(
+	unsigned long phys,
+	unsigned long size,
+	unsigned long virt,
+	u64 color_mask,
+	enum dcache_flush flush_type)
+{
+	struct color_op op;
+
+	if (coloring_way_size =3D=3D 0)
+		BUG();
+
+	op.phys =3D phys;
+	op.size =3D size;
+	op.virt =3D virt;
+	op.color_mask =3D color_mask;
+	op.flush_type =3D flush_type;
+	op.op =3D COL_OP_FLUSH;
+
+	color_do_op(&op);
+}
+
+/**
+ * Detection of coloring way size.
+ */
+static inline void arm_color_init(void)
+{
+	coloring_way_size =3D system_config->platform_info.color.way_size;
+	coloring_root_map_offset =3D
+		system_config->platform_info.color.root_map_offset;
+
+	printk("Init Coloring: Way size: 0x%llx, TMP load addr: 0x%llx\n",
+	       coloring_way_size, coloring_root_map_offset);
+}
+
+static inline int
+color_paging_create(const struct paging_structures *pg_structs,
+		    unsigned long phys, unsigned long size, unsigned long virt,
+		    unsigned long access_flags, unsigned long paging_flags,
+		    u64 color_mask, u64 mem_flags)
+{
+	struct color_op op;
+
+	if (coloring_way_size =3D=3D 0)
+		return -EINVAL;
+
+	op.pg_structs =3D pg_structs;
+	op.phys =3D phys;
+	op.size =3D size;
+	op.virt =3D virt;
+	op.access_flags =3D access_flags;
+	op.paging_flags =3D paging_flags;
+	op.color_mask =3D color_mask;
+	if (mem_flags & JAILHOUSE_MEM_TMP_ROOT_REMAP) {
+		op.op =3D COL_OP_LOAD;
+	} else {
+		op.op =3D COL_OP_CREATE;
+	}
+
+	return color_do_op(&op);
+}
+
+static inline int
+color_paging_destroy(const struct paging_structures *pg_structs,
+		     unsigned long phys, unsigned long size, unsigned long virt,
+		     unsigned long paging_flags, u64 color_mask, u64 mem_flags)
+{
+	struct color_op op;
+
+	if (coloring_way_size =3D=3D 0)
+		return -EINVAL;
+
+	op.pg_structs =3D pg_structs;
+	op.phys =3D phys;
+	op.size =3D size;
+	op.virt =3D virt;
+	op.paging_flags =3D paging_flags;
+	op.color_mask =3D color_mask;
+	if (mem_flags & JAILHOUSE_MEM_TMP_ROOT_REMAP) {
+		op.op =3D COL_OP_START;
+	} else {
+		op.op =3D COL_OP_DESTROY;
+	}
+
+	return color_do_op(&op);
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
=20
 extern u8 __trampoline_start[];
=20
@@ -40,6 +41,8 @@ int arch_init_early(void)
 	if (err)
 		return err;
=20
+	arm_color_init();
+
 	return arm_init_early();
 }
=20
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2214406f..d3b40c6a 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -300,7 +300,7 @@ static bool address_in_region(unsigned long addr,
 	       addr < (region->phys_start + region->size);
 }
=20
-static int unmap_from_root_cell(const struct jailhouse_memory *mem)
+static int unmap_from_root_cell(const struct jailhouse_memory *mem, bool c=
reate)
 {
 	/*
 	 * arch_unmap_memory_region and mmio_subpage_unregister use the
@@ -316,6 +316,12 @@ static int unmap_from_root_cell(const struct jailhouse=
_memory *mem)
 		return 0;
 	}
=20
+	if (!create && (mem->flags & JAILHOUSE_MEM_COLORED)) {
+		/* start cell: remove temporary mapping */
+		tmp.flags |=3D JAILHOUSE_MEM_TMP_ROOT_REMAP;
+		tmp.virt_start =3D mem->virt_start;
+	}
+
 	return arch_unmap_memory_region(&root_cell, &tmp);
 }
=20
@@ -347,6 +353,17 @@ static int remap_to_root_cell(const struct jailhouse_m=
emory *mem,
 			overlap.phys_start - root_mem->phys_start;
 		overlap.flags =3D root_mem->flags;
=20
+		if (mem->flags & JAILHOUSE_MEM_COLORED) {
+			/* Use the colors from the to-be-remapped region */
+			overlap.flags |=3D JAILHOUSE_MEM_COLORED;
+			overlap.colors =3D mem->colors;
+			if (mode =3D=3D ABORT_ON_ERROR) {
+				/* load cell: setup temporary mapping */
+				overlap.flags |=3D JAILHOUSE_MEM_TMP_ROOT_REMAP;
+				overlap.virt_start =3D mem->virt_start;
+			}
+		}
+
 		if (JAILHOUSE_MEMORY_IS_SUBPAGE(&overlap))
 			err =3D mmio_subpage_register(&root_cell, &overlap);
 		else
@@ -526,7 +543,7 @@ static int cell_create(struct per_cpu *cpu_data, unsign=
ed long config_address)
 		 */
 		if (!(mem->flags & (JAILHOUSE_MEM_COMM_REGION |
 				    JAILHOUSE_MEM_ROOTSHARED))) {
-			err =3D unmap_from_root_cell(mem);
+			err =3D unmap_from_root_cell(mem, true);
 			if (err)
 				goto err_destroy_cell;
 		}
@@ -633,7 +650,7 @@ static int cell_start(struct per_cpu *cpu_data, unsigne=
d long id)
 		/* unmap all loadable memory regions from the root cell */
 		for_each_mem_region(mem, cell->config, n)
 			if (mem->flags & JAILHOUSE_MEM_LOADABLE) {
-				err =3D unmap_from_root_cell(mem);
+				err =3D unmap_from_root_cell(mem, false);
 				if (err)
 					goto out_resume;
 			}
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/ja=
ilhouse/control.h
index f2b07c0d..03b0f3fd 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -9,6 +9,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_CONTROL_H
+#define _JAILHOUSE_CONTROL_H
=20
 #include <jailhouse/bitops.h>
 #include <jailhouse/percpu.h>
@@ -291,3 +293,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
 void arch_panic_park(void);
=20
 /** @} */
+
+#endif
diff --git a/include/jailhouse/coloring.h b/include/jailhouse/coloring.h
new file mode 100644
index 00000000..86158196
--- /dev/null
+++ b/include/jailhouse/coloring.h
@@ -0,0 +1,39 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+/** MSB/LSB function names differs between Jailhouse and Linux */
+#define _lsb(x)	ffsl(x)
+#define _msb(x)	msbl(x)
+
+/**
+ *  Get range of contiguous bits in a bitmask.
+ *
+ *  The function returns:
+ *  - bitmask without the extracted bit range.
+ *  - low: original bit position of range start.
+ *  - size: size of the range
+ *
+ *  The function assumes bitmask is not 0.
+ */
+static inline void get_bit_range(
+	u64 *bitmask,
+	unsigned int *low,
+	unsigned int *size)
+{
+	unsigned int _range;
+
+	*low =3D _lsb(*bitmask);
+	_range =3D *bitmask >> *low;
+	*bitmask =3D _range & (_range + 1UL);
+
+	_range =3D _range ^ *bitmask;
+	*size =3D _msb(_range) + 1;
+}
--=20
2.30.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210322194507.82643-5-andrea.bastoni%40tum.de.
