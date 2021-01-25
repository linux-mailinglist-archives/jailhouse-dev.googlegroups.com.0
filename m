Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHHGXKAAMGQER5L4QTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320630248B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:33 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id f30sf5455117ljo.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576092; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cc2gJRCrRdZnQJ71BK0BvfMHZo1qLkhFJunSFG1l6aanf27Hqq98nQLlmifayUMNzf
         Ul1WygHEo2eBvTFJ09z8z9/al1x0+TMK7w2kodGqz1B9RQREE16A/fr1x8ggusjk4lsR
         NYIfjiwB41grtzY3ANLHcFCcvyGHRVH7+fktpjOwIcOn5qVkBWERZCvtke+lA0tgZJ4t
         GAHk3R3gbPw0GNrC21Wa7RgisMWUZC25sNPGSajBNK5k9lcIYQJzHBGkteVSaKysbRsV
         GhlIMVf8TjsyYYXwEtlwbJVLwLJCaXB00gv2LdLYy1vkjNcDi0tLg4eHWvXuKrIU3c97
         JshA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=rjCWwWVQgu98QegvnRbC+LXYDsgKUGI0TN1bT9BAKXM=;
        b=EfwimZo8jaNyXSpts+XBJ67FWvTd8Y21HwjezAgNFyHoU3qt0ZjHEVzoPPKA8ZRLdB
         09CzgHqd7lq/I/RdZKz5LQUTBUdo2NCRLFfwm2twyHD/4m1fy91+YhN1NReT0dvntI7r
         3JMicCrLrrWlL9OPiMMS2xV+I+V1PIyWFrSCXaLgNz6XYYR8getXB156JDGXgdFaoCLC
         fwWnHpNaCo2NGVHrkLbYIh8QS3Y7Ai9JzsSubelq0pWZrHjZ+xuVnnU2RGwhVcdWc93J
         ftN9s1HmTsIxWPsPfXgwu7QVF6edOu7kvFCBM6J9f48ozV3sg9NpTrPyCpbZ68ACSyxB
         6iPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OCahpFXz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rjCWwWVQgu98QegvnRbC+LXYDsgKUGI0TN1bT9BAKXM=;
        b=hw5FXkp1EAsMFydQhUkQGp9PM6SFS1teR2Y9tT1GQfoUwArxXXqv5k0CfwqRtSb1r5
         ftdBroDKPwPHI2SNRYJ7UPySynPhZck1jZXXJFpUVUw2vr2lHQhjmL/6xVNhUlI9eUFY
         GbZ5Y2ZwF+0tiNHWTuG3M3nzYDLRaQb8/B5DCuGRSjOqpSGQgO+liC5uXBLEl+BCcPp1
         aguFOcUQj83RrP5XPuuNRvQTW+yNhclqEBUUmaulPOv9cizMNHWfDGGvoFZuTsKMxNLE
         KVWrZdGzmV3w1hlkb0X2Ovu7zATNu1WPMv3fCHAMA6tqr6A5Xd7gZTMSjGu6lVBZZq6O
         ZPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rjCWwWVQgu98QegvnRbC+LXYDsgKUGI0TN1bT9BAKXM=;
        b=F/L5sXDy2tyScB1P+GJN22kmwfAnbqMYl13/xMgjwRoH29TczLj2WudVFEpgBYN3hh
         DqifZHCLNQBbvYE6nRw0DUYdkjxIORueDyqJ4Rj7ZiC97qROscTwC+Z/shuMwvK5HPOE
         Wj2TWw2s2cyTbbkGbMZeV9WzX6vnyHZUceH5bPPUx4CvuxC+YhBBYBiWJhbtFlqtNK2M
         prZKX9xGfLlHpysS0qiuZlZFvPFN7iTVnvPHGMs/PZ4Z+Mkt3tBNUWOffgFgV3qKS9Rr
         Ys5f0KhEU/GPKnxP5oJ/8bVQZxZFwYLtUakk8KAhQjdI3DMk7Ea447kOmEAxz9sdYMma
         IOoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532hhZr/gzlBGkN1Ly8PeOPJ8hL6ddTwAvwjq4g9zECSHC/D8B54
	pRKUCNSFu75z4Aj+w5aDAPw=
X-Google-Smtp-Source: ABdhPJybqo9VyjEyUcgUuSgKAxQfPU1kZToQXL9slTJqs2czV/nb/Hpfiq3GtlYo9P3QqJdepBoJ1Q==
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr124960lfp.108.1611576092781;
        Mon, 25 Jan 2021 04:01:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9ad2:: with SMTP id p18ls2361908ljj.5.gmail; Mon, 25 Jan
 2021 04:01:31 -0800 (PST)
X-Received: by 2002:a2e:b543:: with SMTP id a3mr32703ljn.336.1611576091759;
        Mon, 25 Jan 2021 04:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576091; cv=none;
        d=google.com; s=arc-20160816;
        b=N9oK6HSwltPMn6p7o8tvKcmPGdcZW14Za1OYSYbsG2SsRegvA5bF0GwW8ovVpHNOqp
         ijqtRragBwstvtEeQqyQGpuG9Gwu5GZsmsd52BPmCogSlFCGMO8ClpMmi+alWZI2qZaO
         CphgSVxGEkFXHiAXg3Dr8y1NPvzyNwwwW3D3JtgpvObmVot8+PaXxD1M1bGbfSyWgm81
         DIiKmCQC//2HSjicwnlQHs0wVUUsEUbV8lXItQIzAcCS2R10o5MjEG2qYVgHW7fecdQL
         9dSWwz5jqdTfpPnRV+E3aQ0NycQzj2NQuir3zKMb0g9l+L6j5t5KJFlwfZOf++g6WtW0
         LZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WNLlzUnufxLzz2qJW1jl0Vl7vYNRK7wqSNw4UQ/6MEk=;
        b=i5hE/r7L5sroeCYb90yuoXm8Orr+1bC509qR+VE8+y6eyke37LWDtQZqOqAHJAN207
         sIoTlKvZdHcAPJdmdXtTu1k8r5oPtRasO54ZD6FWAnDMijO9u6Bf7axc1Si4UmFs2Erf
         csPPq7r07lTHeeGkeEa/cysyVGBpSlwWWK48/ENjsXmq4AH+Y32YCx+Mg4O4AJ/rDXZ8
         vDRCRxiQeiHBgw4F0cdPudWU2JB8ZqB56YP/L3mJ1X7KHspLGzEGn6NHXT8rc+b45pSF
         zzWoEy4+7NuzRVZLIelIbkcTUQ/BAlHAMjVnHU5/NdUxkfqs3A99+pvEO0C777VsAhQQ
         vLOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OCahpFXz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id i190si416304lfi.8.2021.01.25.04.01.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:31 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3v1FXVzydg;
	Mon, 25 Jan 2021 13:01:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
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
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id HL2A7lgBVqtP; Mon, 25 Jan 2021 13:01:30 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3t2nFmzyd8;
	Mon, 25 Jan 2021 13:01:30 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 03/23] hypervisor: arm64: add cache coloring implementation
Date: Mon, 25 Jan 2021 13:00:24 +0100
Message-Id: <20210125120044.56794-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=OCahpFXz;       spf=pass
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

Each colored operation has to identify the correct physically colored
address where to map successive virtual addresses according to
contiguous coloring regions (expressed as contiguous bits in the color
bitmask).

Coloring is still disabled since coloring_way_size is not yet
determined.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/Kbuild                 |   1 +
 hypervisor/arch/arm64/coloring.c             | 186 +++++++++++++++++++
 hypervisor/arch/arm64/include/asm/coloring.h |  85 +++++++--
 3 files changed, 258 insertions(+), 14 deletions(-)
 create mode 100644 hypervisor/arch/arm64/coloring.c

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
index 00000000..ea19560c
--- /dev/null
+++ b/hypervisor/arch/arm64/coloring.c
@@ -0,0 +1,186 @@
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
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+#include <jailhouse/control.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/mmio.h>
+#include <asm/control.h>
+#include <asm/coloring.h>
+
+/**
+ *  Only parameter needed to determine the coloring.
+ */
+u64 coloring_way_size =3D 0;
+
+static inline int coloring_mem_destroy(struct cell *cell,
+				       struct jailhouse_memory *mr)
+{
+	int err =3D 0;
+
+	/* Coloring was not created for subpages */
+	if (JAILHOUSE_MEMORY_IS_SUBPAGE(mr)) {
+		BUG();
+	}
+
+	err =3D arch_unmap_memory_region(cell, mr);
+	if (err)
+		return err;
+
+	if (!(mr->flags & (JAILHOUSE_MEM_COMM_REGION |
+					JAILHOUSE_MEM_ROOTSHARED))) {
+		err =3D remap_to_root_cell(mr, WARN_ON_ERROR);
+	}
+
+	return err;
+}
+
+static inline int coloring_mem_start(struct jailhouse_memory *mr)
+{
+	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
+		BUG();
+	}
+
+	/* Match the address specified during load */
+	mr->virt_start +=3D ROOT_MAP_OFFSET;
+
+	return arch_unmap_memory_region(&root_cell, mr);
+}
+
+static inline int coloring_mem_load(struct jailhouse_memory *mr)
+{
+	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
+		BUG();
+	}
+
+	/* Fix addr to match the driver's IPA ioremap */
+	mr->virt_start +=3D ROOT_MAP_OFFSET;
+
+	/* Create an ad-hoc mapping just to load this image */
+	return arch_map_memory_region(&root_cell, mr);
+}
+
+static int dispatch_op(struct cell *cell, struct jailhouse_memory *mr,
+			      unsigned int op, unsigned int flags)
+{
+	if (op & COL_OP_CREATE) {
+		return arch_map_memory_region(cell, mr);
+	}
+
+	if (op & COL_OP_DESTROY) {
+		return coloring_mem_destroy(cell, mr);
+	}
+
+	if (op & COL_OP_START) {
+		return coloring_mem_start(mr);
+	}
+
+	if (op & COL_OP_LOAD) {
+		return coloring_mem_load(mr);
+	}
+
+	if (op & COL_OP_FLUSH) {
+		arm_dcache_flush_memory_region(mr->phys_start, mr->size, flags);
+		return 0;
+	}
+
+	/* shouldn't get here */
+	BUG();
+
+	/* keep compiler happy */
+	return 0;
+}
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
+	size_t *bitmask,
+	unsigned int *low,
+	unsigned int *size)
+{
+	unsigned int _range;
+
+	//col_print("mask: 0x%lx ", *bitmask);
+
+	*low =3D ffsl(*bitmask);
+	_range =3D *bitmask >> *low;
+	*bitmask =3D _range & (_range + 1UL);
+
+	_range =3D _range ^ *bitmask;
+	*size =3D msbl(_range) + 1;
+
+	//col_print("range: 0x%x, low: %u, size %u\n", _range, *low, *size);
+}
+
+int color_cell_op(struct cell *cell,
+		  const struct jailhouse_memory *col_mem,
+		  unsigned int op, unsigned int flags)
+{
+	size_t colors;
+	u64 phys_start =3D col_mem->phys_start;
+	u64 virt_start =3D col_mem->virt_start;
+	struct jailhouse_memory mr;
+	unsigned int start, low, size;
+	unsigned int n;
+	int err =3D -EINVAL;
+
+	col_print("OP 0x%x: PHYS 0x%08llx -> VIRT 0x%08llx "
+			"(C: 0x%08lx, F: 0x%x)\n",
+			op, col_mem->phys_start,
+			col_mem->virt_start,
+			col_mem->colors, flags);
+
+	n =3D 0;
+	mr.flags =3D col_mem->flags;
+	while (virt_start < col_mem->virt_start + col_mem->size) {
+		start =3D low =3D size =3D 0;
+		colors =3D col_mem->colors;
+
+		while (colors !=3D 0) {
+			/* update colors with next color-range */
+			get_bit_range(&colors, &low, &size);
+			start +=3D low;
+			mr.size =3D size * PAGE_SIZE;
+			mr.phys_start =3D phys_start + (start * PAGE_SIZE) +
+					(n * coloring_way_size);
+			mr.virt_start =3D virt_start;
+			/* update next round */
+			virt_start +=3D mr.size;
+			n++;
+#if 0
+			col_print("V: 0x%08llx -> P: 0x%08llx (size =3D 0x%08llx)\n",
+					mr.virt_start, mr.phys_start,
+					mr.size);
+#endif
+			err =3D dispatch_op(cell, &mr, op, flags);
+			if (err)
+				return err;
+		}
+	}
+
+	col_print("Result: %d\n", err);
+	return err;
+}
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch=
/arm64/include/asm/coloring.h
index 54bfa9dd..44c1ca38 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -1,9 +1,13 @@
 /*
  * Jailhouse Cache Coloring Support
  *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
  * Copyright (C) Technical University of Munich, 2020
  *
  * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
  *  Andrea Bastoni <andrea.bastoni@tum.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
@@ -12,13 +16,34 @@
 #ifndef _JAILHOUSE_COLORING_H
 #define _JAILHOUSE_COLORING_H
=20
-#include <asm/dcaches.h>
+#include <jailhouse/cell.h>
=20
-/* Initial empty stub for coloring functions. */
-static inline void arm_color_init(void)
-{
-	return;
-}
+#define col_print(fmt, ...)			\
+	printk("[COL] " fmt, ##__VA_ARGS__)
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
+/**
+ * Colored operations on a cell / memory region.
+ *
+ * Encapsulate the loops needed to iterate through a region and identify
+ * the color-compatible phys2virt mappings.
+ */
+extern int color_cell_op(struct cell *cell,
+			 const struct jailhouse_memory *mr,
+			 unsigned int op, unsigned int flags);
+
+/* -------------------- COLORING ARCH API --------------------------------=
-- */
=20
 /* Make sure we catch incorrect calls to these functions for arm */
 static inline void arm_color_dcache_flush_memory_region(
@@ -26,34 +51,66 @@ static inline void arm_color_dcache_flush_memory_region=
(
 		const struct jailhouse_memory *mr,
 		enum dcache_flush flush_type)
 {
-	BUG();
+       (void)color_cell_op(cell, mr, COL_OP_FLUSH, flush_type);
+}
+
+/**
+ * Autodetection of coloring_way_size.
+ */
+static inline void arm_color_init(void)
+{
+	return;
 }
=20
+/* ------------------------- COLORING API --------------------------------=
-- */
+
 static inline void arch_color_unmap_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
-	BUG();
+	int err;
+
+	if (coloring_way_size =3D=3D 0) {
+		/* TODO: add assert() for debugging jailhouse? */
+		/* must have mapped before */
+		BUG();
+	}
+
+	err =3D color_cell_op(cell, mr, COL_OP_DESTROY, 0);
+	if (err) {
+		BUG();
+	}
 }
=20
 static inline int arch_color_map_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	// assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
+
+	return color_cell_op(cell, mr, COL_OP_CREATE, 0);
 }
=20
 static inline int arch_color_remap_to_root(const struct jailhouse_memory *=
mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	return color_cell_op(&root_cell, mr, COL_OP_LOAD, 0);
 }
=20
 static inline int arch_color_unmap_from_root(const struct jailhouse_memory=
 *mr)
 {
-	BUG();
-	return 0;
+	if (coloring_way_size =3D=3D 0) {
+		return -ENODEV;
+	}
+
+	return color_cell_op(&root_cell, mr, COL_OP_START, 0);
 }
=20
 #endif
--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210125120044.56794-4-andrea.bastoni%40tum.de.
