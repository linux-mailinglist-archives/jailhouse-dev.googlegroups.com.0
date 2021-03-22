Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBI7H4OBAMGQEFNQG4DY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC9345022
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:36 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id m17sf12439wml.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442276; cv=pass;
        d=google.com; s=arc-20160816;
        b=kRUNGb4vxsapr12rv540iecNtG3GLeFMjkzsur2egOIrhTgxUTUyYC3XicyMPgOOln
         8cF385+qn7IyeASuSkejpvIBir/SYSmwaeOwgfucGfaVLBaZ2zH6K14Q9e06v8yyy0r8
         H29CnO/r1hNav95zwz/XafidEhiOxbzkm1tpUToC1DQiDDA0tzYP7OutflvPIdYe6aFx
         RxdsgIzsb6lvKyWTr2jGkFjY6l6fMrmjdnYSL2n/UXpYXDoDxMVkQp6xbCEwymr+CD5R
         RtDdIJa0O87hFZQElc5MjC7Vv57OGVoLSp6uKFI9g346AgyXl1kwFTGuNr73YurBxILO
         dYxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=Ogqjn8CzrQ4CknAETY5gwCU7aC/jKsnjilDv9AiJuQM=;
        b=DPPgvUWHks/nWwUyFHbLrudC3P8Pqt/2vwuztAUrGwKmDN3I5dOiVPRPpb4RAw3nie
         1H05ikVtPAzu/x+yknWYuGEvrs97d07Otc3lBdvyfkr/u32pFNqrRSLsnnGEAfNOt6h0
         mgsJJvohJWs6XsSzzQc46ntfzP7M6b4QCtrGWdxYZxh1EG4hvlN9Om31JBl5Acg2vZ/2
         0cYY6XEmqKr/35PuzVU2i4zRwQQNptHatsZP05N92BYdKJlCMbJ/LUtmSBMlzBfgQUxH
         pcStKpZUZH9A2eGSpViyGsW024yyjLNDPkAfgh1DtM40rxE7jkjLWm79eViaIanUUWC/
         5QUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=iZRmOnlg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ogqjn8CzrQ4CknAETY5gwCU7aC/jKsnjilDv9AiJuQM=;
        b=Kdcs4IB3WAHyJA20OFHH1yOBQg82BsSKuqyz6bThl8QGdr8F3yAlrPZFUZSDb0/EQI
         ayRTnlVf5JcUiJZE7ZCLryYYaOgaOR55oZmQv47I7VfU+qSqpdKRnWHP8Y+Dt0e25QYd
         nrMUALg1KGa55dnMkOpe7Gi+Ara1oTsQJFIp0W6QIc4riGtzNrN06vCSdnCU4hijLL9e
         CxDW5lFLkRCjxiLPZOxrEDBXTw9z6yBkS8DyMznhxsxRk+TWm9rGIB0RK5AAVPdYwZrG
         uCKJ8NNSE95PVUW3WTWEjrrP0PqJWG6xioFmxdCBl88XTnaXq8u0a+dv+CP6Wu93Gx6/
         kygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ogqjn8CzrQ4CknAETY5gwCU7aC/jKsnjilDv9AiJuQM=;
        b=X0/liPjOtOTZaGd1LpQcXS2hxqAX5k6O0lOlRWZPijtHPITwQAVsp6W+lLHif30oO7
         eGbFrKBc9GsJRiNqiC/DHd28FI23DvaLkpL7H0w5szP7iNG/+bd2pTgy1EDeF8b/bSlU
         AEhKK6dA6v38IhzCcRdn4zqzopnKANOE1cDV/S0rxFWrkkzsOVYzm/+7Y2UIX/sAGAZx
         QY7LO5q2LX6C33MiHrmo01f4YHyLtNwq2MFKqlVEmM5Sn6d5fKaVqFl+XNebXUYtcxbi
         0re3qzTfiRt6XyS6zRszhD35dGAMVZ/7uhpbI+Fk7PCAa+N0XVbMYrrFvgsgBC397Hq6
         mHtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530VGhHVaJHjsstpxntpgSCEBNbfxMjKQoMP8AHo4MTVm6AKeFDg
	JRrL7VvLr97821yJcS1i3Bg=
X-Google-Smtp-Source: ABdhPJyKkrAhb9O8e9K91/gALXm29QqsFU35gSYgb34eJSjziZOrImkJAOZlhQ+Yg+UQUFOShGE5fg==
X-Received: by 2002:a5d:5904:: with SMTP id v4mr175179wrd.261.1616442275718;
        Mon, 22 Mar 2021 12:44:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls892450wrb.1.gmail; Mon, 22
 Mar 2021 12:44:34 -0700 (PDT)
X-Received: by 2002:a5d:6312:: with SMTP id i18mr186676wru.149.1616442274795;
        Mon, 22 Mar 2021 12:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442274; cv=none;
        d=google.com; s=arc-20160816;
        b=zQqWrHk1FeQV6AGHuyiHhJfJvUSCBeQNQvmuDSC3EeVKEoZBYW7RAZOHDFVFcP/c7C
         aY1IoV9mwHM82kMqo++PjV3T7I66xxWAwVK0jNdMOTB+mtRZTst3hnADuI9ShLDRdukk
         AZeTG+yvlLP/Jkmjnda4zUAZ4/p9zKzQaN8qoDZfQRrLuEAMXpaGty3o3YgfN4YwN/oN
         qD7PyAqG48iCP8McdkcCxug//Z8b0RIE3LPZ1SjL2LhWiFvKfuQaL4iBMiduMN4O5FbL
         lMEYdsLvuDH1EE/7OPaabjQoe1BaV8ht5uwYhaFJ/5xqGATmPXhbvdlHty5eGZHtkoVt
         NaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c/TIc7j7PzxKVEfClNtjnRrjAv1vbFiumVadUCgqR4w=;
        b=dryzJPaGwTHdNKEEX9FKodoKfKCNHYitmSvsQVUpzN2G9uY5i7MNyS7vC+UrfnDROd
         4+zmH7ju51N+ZfokL8E7hNK+IrwvXBKlPxDidF3fKJpbosybeV3US7Sp8d/pr63t8jfq
         QsXhoPeYhTEBmDSvhdCSFgWKfZTDFDrISeeNrGvqRzX9zkPde075G75lSvjSDq6XNt3f
         B7bupwM+kIMqMUdkhmsZZUyqDkf/xMUXgvZhr74M7pAAjO9hGlGuvqyBo4MbBn3a7oT1
         Yu5awA0QcGXuWZvOhYVTskNe2niGeZ4TpPJIeCRX3D0JBd8b7xQrB9rWi/RcFAJW7+iR
         v9/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=iZRmOnlg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id b5si18529wmc.2.2021.03.22.12.44.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hL4DTjzyWn;
	Mon, 22 Mar 2021 20:44:34 +0100 (CET)
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
	with LMTP id cw0Sn7vwIm7H; Mon, 22 Mar 2021 20:44:33 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hK40G3zyWm;
	Mon, 22 Mar 2021 20:44:33 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 3/9] hypervisor: arm64, arm-common: add cache-partitioning via coloring
Date: Mon, 22 Mar 2021 20:44:04 +0100
Message-Id: <20210322194411.82520-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=iZRmOnlg;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
initialization helper to read the configuration parameters.

Refer to the Documentation/cache-coloring.md for an introduction of the
coloring isolation software techniques.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 .../arch/arm-common/include/asm/coloring.h    |  45 ++++++
 .../arch/arm-common/include/asm/dcaches.h     |   8 +
 hypervisor/arch/arm-common/mmu_cell.c         |  68 ++++++---
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 109 ++++++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h  | 140 ++++++++++++++++++
 hypervisor/arch/arm64/setup.c                 |   3 +
 hypervisor/control.c                          |   6 +
 hypervisor/include/jailhouse/control.h        |   4 +
 include/jailhouse/coloring.h                  |  39 +++++
 10 files changed, 403 insertions(+), 20 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
 create mode 100644 include/jailhouse/coloring.h

diff --git a/hypervisor/arch/arm-common/include/asm/coloring.h b/hypervisor=
/arch/arm-common/include/asm/coloring.h
new file mode 100644
index 00000000..19543be0
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
+		    u64 color_mask)
+{
+	return -EINVAL;
+}
+
+static inline int
+color_paging_destroy(const struct paging_structures *pg_structs,
+		     unsigned long phys, unsigned long size, unsigned long virt,
+		     unsigned long paging_flags, u64 color_mask)
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
index 7f9bb10a..33cc145f 100644
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
+				paging_flags, mem->colors);
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
+				PAGING_COHERENT, mem->colors);
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
index 00000000..8966e5b6
--- /dev/null
+++ b/hypervisor/arch/arm64/coloring.c
@@ -0,0 +1,109 @@
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
+static int dispatch_op(
+	struct color_op *op,
+	unsigned long bphys,
+	unsigned long bvirt,
+	unsigned long bsize)
+{
+	if (op->op & COL_OP_CREATE) {
+		if (op->pg_structs =3D=3D &root_cell.arch.mm) {
+			/* root-cell doesn't have colors, this is a remapping
+			 * op. Preserve 1:1 mapping.
+			 */
+			bvirt =3D bphys;
+		}
+		return paging_create(op->pg_structs, bphys, bsize, bvirt,
+				     op->access_flags, op->paging_flags);
+	}
+
+	if (op->op & COL_OP_DESTROY) {
+		if (op->pg_structs =3D=3D &root_cell.arch.mm) {
+			/* root-cell doesn't have colors, this is an unmapping
+			 * op. Preserve 1:1 mapping.
+			 */
+			bvirt =3D bphys;
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
index 00000000..963d15ec
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -0,0 +1,140 @@
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
+#define COL_OP_FLUSH	0x10
+
+/**
+ * Only parameter needed to determine the coloring.
+ */
+extern u64 coloring_way_size;
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
+
+	printk("Init Coloring: Way size: 0x%llx\n",
+	       coloring_way_size);
+}
+
+static inline int
+color_paging_create(const struct paging_structures *pg_structs,
+		    unsigned long phys, unsigned long size, unsigned long virt,
+		    unsigned long access_flags, unsigned long paging_flags,
+		    u64 color_mask)
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
+	op.op =3D COL_OP_CREATE;
+
+	return color_do_op(&op);
+}
+
+static inline int
+color_paging_destroy(const struct paging_structures *pg_structs,
+		     unsigned long phys, unsigned long size, unsigned long virt,
+		     unsigned long paging_flags, u64 color_mask)
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
+	op.op =3D COL_OP_DESTROY;
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
index 2214406f..2927adb8 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -347,6 +347,12 @@ static int remap_to_root_cell(const struct jailhouse_m=
emory *mem,
 			overlap.phys_start - root_mem->phys_start;
 		overlap.flags =3D root_mem->flags;
=20
+		if (mem->flags & JAILHOUSE_MEM_COLORED) {
+			/* Use the colors from the to-be-remapped region */
+			overlap.flags |=3D JAILHOUSE_MEM_COLORED;
+			overlap.colors =3D mem->colors;
+		}
+
 		if (JAILHOUSE_MEMORY_IS_SUBPAGE(&overlap))
 			err =3D mmio_subpage_register(&root_cell, &overlap);
 		else
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
index 00000000..bf025dff
--- /dev/null
+++ b/include/jailhouse/coloring.h
@@ -0,0 +1,39 @@
+/*
+ * Jailhouse Cache Coloring Support
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
jailhouse-dev/20210322194411.82520-4-andrea.bastoni%40tum.de.
