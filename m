Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9F55B9B3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 10-20020a1c020a000000b003a03f8cc1acsf3981377wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335618; cv=pass;
        d=google.com; s=arc-20160816;
        b=taDX9w4G5G1JsFFCyXYZmkIOVGKamv783dk210rDx6W4Lxn29aYtDE+WTbdens3jB1
         TEuUX+z88gpra0jZVfY9OG0+j5N2H98mOx10JZasDmds+8bEaBmC8UslgJjlr8Jd2K/P
         88tRyQp6KWYGmz4SP2wp30Fss8XRxGD1tXti0+2HICiUW1Z8D6YOI7YM7cT1YOOV55fH
         WvY1/cEZIpVG++AotucDaRReRTOB8jGAlY+EX+mfAmCBQ+NuqMpL0sHY6WF5vVMCtsmE
         Yap5nf64XuBKPv+6W/vZnAuhdXq2TtlRQ910XzR3Vdhv/V/eSZPrG1gL0MqZnvEhB/CC
         d3ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=i+thFWLegsQJQDz7Bkmoh+3KHfxOimkk3w4bvlEXOzA=;
        b=g9usImAdrTTYcOnJ2e+Sm0UEx3Yi0iK2BhJ3HNFpLHO6qDBtPFePpImCYiJ2WZ6UXp
         JQFheZrA0Ph1KuMUjqUp+JxMPxP88VBQof+pPLZS3Q5UmKvGdBbKpjpiDi0qM/nM1S+o
         gtqRw8xalLUYVHOex3dfr2g49uyXAJkPoOSygmMyPfFUdkw6VcgErctP4ZrzueF3EoDV
         bO6vgyz6bNLBO2GUrhMgdwcHhvG2kYzyNASN9ndhPq/OuKNtwG9bfspQtOa0TF3w5pDL
         ag61us8qo6qPQM1uiVepkD+0vZu9kaFqLTZxRkb+XvtRhMsUlgReb8qSGcaVD/w2zXxl
         DPHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=k6E7mbzT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i+thFWLegsQJQDz7Bkmoh+3KHfxOimkk3w4bvlEXOzA=;
        b=qH2AKh0PxhlHSUDyel+RoUEpazhdNjsmvaqnyIYrTqy8sIhNGSYn3DhwnRwClqz1HN
         tT5bZ3jtvev712teZ/7hjqCXoumWCdPfQu4Qj2U6IaxpveoyQOhU5k2Scb1Gk/VSXtar
         tdSpZNcT3KUCJSI39Lv5363c2RymGiL1goibr8e3GZS/hmOyA4C7EvTe1Xfkag2xEF68
         JXzLSg6aMdw6QUb44HJo6AC2FhsRbBkqLr9pQPesUrPQNYd8w9zpNJtNq0Ia/MDezkw2
         EfFQ6LinZrjPocdAdZUEEnFDdYvTmgef1SzpVQUemWmdqkfUTfFAnLDLPXEKKyjX4I4p
         v3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i+thFWLegsQJQDz7Bkmoh+3KHfxOimkk3w4bvlEXOzA=;
        b=oWBsZo/RzFSKmOjAxUnXkZoEAsK1tafiQbCH7ooX1w68WlXGfLENdxMDIhtlSISnn5
         uFFOXzYz7AK6h2IWN9UVtANC9KKva5AK2dMG71UzdrLb1AwSCWHauJBym376XIWrJqiD
         k58ZyfHR30CphXmBRXp+O7Hi2V5KgipWXaJ+yFytqhHjcGtpCu81sh94ukXYaI8ReXqJ
         VeczOhBblcevNgaoQ+0eJPhyB/bVTrjo84l1VVOwfj0DogSXJKYQAtFoGPTAQwgKRPsF
         yKzkSgonJ3hkwqFFSDju/gaa9Wi0JzItAgBop3S/8JCWpNBP9QhJI451fTpk7pkI4koA
         SyMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+/cZoBpfF5UXe3QXK7f/Zk5PUuNnRf0Bdr3P0+NoYf65l2sIF7
	V84aO1wjai/UBlKXMLGS+I4=
X-Google-Smtp-Source: AGRyM1vgyJXBimvLHpRch3A3iRUB7WZ/l5+nKcPyRcBdvvRXKXp9GKX+KypZfGWxb3/0C6gYGKBH8Q==
X-Received: by 2002:a05:6000:144a:b0:21b:c9bc:ec87 with SMTP id v10-20020a056000144a00b0021bc9bcec87mr7031813wrx.178.1656335618696;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5848:0:b0:219:b7ea:18e1 with SMTP id i8-20020a5d5848000000b00219b7ea18e1ls26728350wrf.2.gmail;
 Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
X-Received: by 2002:adf:fa04:0:b0:21d:1864:3172 with SMTP id m4-20020adffa04000000b0021d18643172mr650141wrr.292.1656335617043;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=MsrTkG48RBN9jwf+SzP7MeveDR3XaQeAqMBMMyUgIat4OHW72nB8uaxBxu6+mkdS8C
         fPCMLk3XZCM89WHJ3at2ttsz+y6edBnnNA+m9p3NgQ84D1MQTLeG1RfJqmYYnfx0/zmF
         FNR4jH2PGz1Q8IWOGV2eHgOcnjMvuDhfUURJHJYv4/ynLKeMJ+bkOE3Ee7Xvp64VTwwY
         D7naq/B67Wyctf9FXRBlezpDsCaypHhajzllm3qSQay6tFFv8Tm6fql/R9Mcq++a0r3v
         6oF5cm3fmw6J0Db4gg2GfVFGn8wL0ObzrjRS8EDI+NfZ7uDeljHbmFkjL3z4+ULQKHkj
         /GPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h6b7eC1VbZQNNqThOgFF3EeP3ZNgaynGCBtYPQLkI5U=;
        b=kBrijR4BQU3/zuLCCEqjolFfffIDxC10Sl8v4Y1LQDZBn1lXUtzDzoI6Ng4dW1acWC
         ny/9gh2wuuMLKICW6gWgtgZllfzZn5k9xlw80jalTd+L9mcw3J3k8k6Lrqf7r/UGFVHG
         IwltmSOISYAzXW3ch8CYAPS+oXfcIWjYHTpxN867kJNM3I1VlZVOju/4jVUW3+CQfbCx
         Q+gSj33H7vkf5CosMr6E3YguOL0hXQlqkJ7A/u1FQJeuOyTMYMxvg7vmM9HKsDH1WEXT
         TQX7sny1piuhUajvA9OChN7JTwY76ymSKwGfVM5cGGvlY83/X1xoxDe/YWqLz0xOhbLT
         NUIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=k6E7mbzT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id w8-20020a5d5448000000b0021b892cde48si356076wrv.8.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp805Jmyzy86;
	Mon, 27 Jun 2022 15:13:36 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 05/20] core: Convert config_commit into a unit callback
Date: Mon, 27 Jun 2022 15:13:14 +0200
Message-ID: <20220627131329.3659-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=k6E7mbzT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This simplifies the code as it obsoletes arch_config_commit. The
programmatic order of commit functions called by config_commit and
arch_config_commit were already in line with the unit order.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c             |  6 ------
 hypervisor/arch/arm-common/include/asm/iommu.h   |  1 -
 hypervisor/arch/arm-common/include/asm/irqchip.h |  2 --
 hypervisor/arch/arm-common/irqchip.c             |  4 ++--
 hypervisor/arch/arm/iommu.c                      |  4 ----
 hypervisor/arch/arm64/Kbuild                     |  4 ++--
 hypervisor/arch/arm64/include/asm/smmu.h         | 12 ------------
 hypervisor/arch/arm64/include/asm/ti-pvu.h       |  2 --
 hypervisor/arch/arm64/iommu.c                    |  7 -------
 hypervisor/arch/arm64/smmu-v3.c                  |  1 +
 hypervisor/arch/arm64/smmu.c                     |  7 +++----
 hypervisor/arch/arm64/ti-pvu.c                   | 14 +++++++-------
 hypervisor/arch/x86/amd_iommu.c                  |  4 ++--
 hypervisor/arch/x86/cat.c                        |  3 ++-
 hypervisor/arch/x86/control.c                    |  6 ------
 hypervisor/arch/x86/include/asm/ioapic.h         |  4 +---
 hypervisor/arch/x86/include/asm/iommu.h          |  2 --
 hypervisor/arch/x86/ioapic.c                     |  4 ++--
 hypervisor/arch/x86/test-device.c                |  3 ++-
 hypervisor/arch/x86/vtd.c                        |  4 ++--
 hypervisor/control.c                             |  9 ++++-----
 hypervisor/include/jailhouse/control.h           | 10 ----------
 hypervisor/include/jailhouse/pci.h               |  4 +---
 hypervisor/include/jailhouse/unit.h              |  7 ++++++-
 hypervisor/pci.c                                 | 11 ++---------
 25 files changed, 39 insertions(+), 96 deletions(-)
 delete mode 100644 hypervisor/arch/arm64/include/asm/smmu.h

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 44c66225..d61c81d9 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -211,12 +211,6 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 			public_per_cpu(cpu)->flush_vcpu_caches = true;
 }
 
-void arch_config_commit(struct cell *cell_added_removed)
-{
-	irqchip_config_commit(cell_added_removed);
-	iommu_config_commit(cell_added_removed);
-}
-
 void __attribute__((noreturn)) arch_panic_stop(void)
 {
 	asm volatile ("1: wfi; b 1b");
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index dde762c0..33f05011 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -27,5 +27,4 @@ int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
 int iommu_unmap_memory_region(struct cell *cell,
 			      const struct jailhouse_memory *mem);
-void iommu_config_commit(struct cell *cell);
 #endif
diff --git a/hypervisor/arch/arm-common/include/asm/irqchip.h b/hypervisor/arch/arm-common/include/asm/irqchip.h
index 06401f91..d058093a 100644
--- a/hypervisor/arch/arm-common/include/asm/irqchip.h
+++ b/hypervisor/arch/arm-common/include/asm/irqchip.h
@@ -87,8 +87,6 @@ void irqchip_cpu_shutdown(struct public_per_cpu *cpu_public);
 
 void irqchip_cell_reset(struct cell *cell);
 
-void irqchip_config_commit(struct cell *cell_added_removed);
-
 void irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id);
 void irqchip_handle_irq(void);
 
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 256af114..fdb15c9d 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) ARM Limited, 2014
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
@@ -506,7 +506,7 @@ static void irqchip_cell_exit(struct cell *cell)
 		irqchip.cell_exit(cell);
 }
 
-void irqchip_config_commit(struct cell *cell_added_removed)
+static void irqchip_config_commit(struct cell *cell_added_removed)
 {
 	unsigned int n;
 
diff --git a/hypervisor/arch/arm/iommu.c b/hypervisor/arch/arm/iommu.c
index 2c02c812..30ecbb2d 100644
--- a/hypervisor/arch/arm/iommu.c
+++ b/hypervisor/arch/arm/iommu.c
@@ -28,7 +28,3 @@ int iommu_unmap_memory_region(struct cell *cell,
 {
 	return 0;
 }
-
-void iommu_config_commit(struct cell *cell)
-{
-}
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 4d328021..59102226 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -2,7 +2,7 @@
 # Jailhouse AArch64 support
 #
 # Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
-# Copyright (c) Siemens AG, 2016
+# Copyright (c) Siemens AG, 2016-2022
 #
 # Authors:
 #  Antonios Motakis <antonios.motakis@huawei.com>
@@ -17,7 +17,7 @@ include $(src)/../arm-common/Kbuild
 always-y := lib.a
 
 # units initialization order as defined by linking order:
-# irqchip (common-objs-y), <generic units>
+# irqchip (common-objs-y), smmu-v3, ti-pvu, <generic units>
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
diff --git a/hypervisor/arch/arm64/include/asm/smmu.h b/hypervisor/arch/arm64/include/asm/smmu.h
deleted file mode 100644
index def7cbde..00000000
--- a/hypervisor/arch/arm64/include/asm/smmu.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright Siemens AG, 2020
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/cell.h>
-
-void arm_smmu_config_commit(struct cell *cell);
diff --git a/hypervisor/arch/arm64/include/asm/ti-pvu.h b/hypervisor/arch/arm64/include/asm/ti-pvu.h
index 62aec7c0..da04fbf6 100644
--- a/hypervisor/arch/arm64/include/asm/ti-pvu.h
+++ b/hypervisor/arch/arm64/include/asm/ti-pvu.h
@@ -126,6 +126,4 @@ int pvu_iommu_map_memory(struct cell *cell,
 int pvu_iommu_unmap_memory(struct cell *cell,
 		const struct jailhouse_memory *mem);
 
-void pvu_iommu_config_commit(struct cell *cell);
-
 #endif /* _IOMMMU_PVU_H_ */
diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
index ca998789..ff1aa7bd 100644
--- a/hypervisor/arch/arm64/iommu.c
+++ b/hypervisor/arch/arm64/iommu.c
@@ -12,7 +12,6 @@
 
 #include <jailhouse/control.h>
 #include <asm/iommu.h>
-#include <asm/smmu.h>
 #include <asm/ti-pvu.h>
 
 unsigned int iommu_count_units(void)
@@ -36,9 +35,3 @@ int iommu_unmap_memory_region(struct cell *cell,
 {
 	return pvu_iommu_unmap_memory(cell, mem);
 }
-
-void iommu_config_commit(struct cell *cell)
-{
-	arm_smmu_config_commit(cell);
-	pvu_iommu_config_commit(cell);
-}
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 5a76a68d..b93aff35 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -1134,4 +1134,5 @@ static int arm_smmuv3_init(void)
 
 DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmuv3);
 DEFINE_UNIT_SHUTDOWN_STUB(arm_smmuv3);
+DEFINE_UNIT_CONFIG_COMMIT_STUB(arm_smmuv3);
 DEFINE_UNIT(arm_smmuv3, "ARM SMMU v3");
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 7869b66b..73b780b2 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright 2018-2020 NXP
- * Copyright Siemens AG, 2020
+ * Copyright Siemens AG, 2020-2022
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -14,7 +14,6 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/unit.h>
 #include <asm/iommu.h>
-#include <asm/smmu.h>
 
 #include <jailhouse/cell-config.h>
 
@@ -522,12 +521,12 @@ static void arm_smmu_cell_exit(struct cell *cell)
 	}
 }
 
-void arm_smmu_config_commit(struct cell *cell)
+static void arm_smmu_config_commit(struct cell *cell_added_removed)
 {
 	struct arm_smmu_device *smmu;
 	unsigned int dev;
 
-	if (cell != &root_cell)
+	if (cell_added_removed != &root_cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index 5da85b5c..629f3dd7 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -442,12 +442,12 @@ int pvu_iommu_unmap_memory(struct cell *cell,
 	return 0;
 }
 
-void pvu_iommu_config_commit(struct cell *cell)
+static void pvu_iommu_config_commit(struct cell *cell_added_removed)
 {
 	union jailhouse_stream_id virtid;
 	unsigned int i;
 
-	if (pvu_count == 0 || !cell)
+	if (pvu_count == 0 || !cell_added_removed)
 		return;
 
 	/*
@@ -456,17 +456,17 @@ void pvu_iommu_config_commit(struct cell *cell)
 	 * Sort the entries in descending order of page sizes to reduce effects
 	 * of chaining and thus reducing average translation latency
 	 */
-	pvu_entrylist_sort(cell->arch.iommu_pvu.entries,
-			   cell->arch.iommu_pvu.ent_count);
+	pvu_entrylist_sort(cell_added_removed->arch.iommu_pvu.entries,
+			   cell_added_removed->arch.iommu_pvu.ent_count);
 
-	for_each_stream_id(virtid, cell->config, i) {
+	for_each_stream_id(virtid, cell_added_removed->config, i) {
 		if (virtid.id > MAX_VIRTID)
 			continue;
 
-		pvu_iommu_program_entries(cell, virtid.id);
+		pvu_iommu_program_entries(cell_added_removed, virtid.id);
 	}
 
-	cell->arch.iommu_pvu.ent_count = 0;
+	cell_added_removed->arch.iommu_pvu.ent_count = 0;
 }
 
 static int pvu_iommu_cell_init(struct cell *cell)
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 40ec4e20..894d92ef 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Valentine Sinitsyn, 2014, 2015
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
@@ -472,7 +472,7 @@ static void amd_iommu_init_fault_nmi(void)
 	apic_send_nmi_ipi(target_data);
 }
 
-void iommu_config_commit(struct cell *cell_added_removed)
+static void amd_iommu_config_commit(struct cell *cell_added_removed)
 {
 	struct amd_iommu *iommu;
 
diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index 051ac296..790584e1 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2015, 2016
+ * Copyright (c) Siemens AG, 2015-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -226,4 +226,5 @@ static int cat_init(void)
 
 DEFINE_UNIT_SHUTDOWN_STUB(cat);
 DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(cat);
+DEFINE_UNIT_CONFIG_COMMIT_STUB(cat);
 DEFINE_UNIT(cat, "Cache Allocation Technology");
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 9a2c6680..11cfee49 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -101,12 +101,6 @@ void arch_cell_reset(struct cell *cell)
 	ioapic_cell_reset(cell);
 }
 
-void arch_config_commit(struct cell *cell_added_removed)
-{
-	iommu_config_commit(cell_added_removed);
-	ioapic_config_commit(cell_added_removed);
-}
-
 void arch_prepare_shutdown(void)
 {
 	ioapic_prepare_handover();
diff --git a/hypervisor/arch/x86/include/asm/ioapic.h b/hypervisor/arch/x86/include/asm/ioapic.h
index f58ea2fc..327d4412 100644
--- a/hypervisor/arch/x86/include/asm/ioapic.h
+++ b/hypervisor/arch/x86/include/asm/ioapic.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -92,5 +92,3 @@ int ioapic_get_or_add_phys(const struct jailhouse_irqchip *irqchip,
 			   struct phys_ioapic **phys_ioapic_ptr);
 
 void ioapic_cell_reset(struct cell *cell);
-
-void ioapic_config_commit(struct cell *cell_added_removed);
diff --git a/hypervisor/arch/x86/include/asm/iommu.h b/hypervisor/arch/x86/include/asm/iommu.h
index 848feb77..a5b32a00 100644
--- a/hypervisor/arch/x86/include/asm/iommu.h
+++ b/hypervisor/arch/x86/include/asm/iommu.h
@@ -41,8 +41,6 @@ int iommu_map_interrupt(struct cell *cell,
 			unsigned int vector,
 			struct apic_irq_message irq_msg);
 
-void iommu_config_commit(struct cell *cell_added_removed);
-
 void iommu_prepare_shutdown(void);
 
 struct public_per_cpu *iommu_select_fault_reporting_cpu(void);
diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index 65ac00f2..41dd0ee0 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -412,7 +412,7 @@ static void ioapic_cell_exit(struct cell *cell)
 	page_free(&mem_pool, cell->arch.ioapics, 1);
 }
 
-void ioapic_config_commit(struct cell *cell_added_removed)
+static void ioapic_config_commit(struct cell *cell_added_removed)
 {
 	struct apic_irq_message irq_msg;
 	union ioapic_redir_entry entry;
diff --git a/hypervisor/arch/x86/test-device.c b/hypervisor/arch/x86/test-device.c
index d9cee834..44142816 100644
--- a/hypervisor/arch/x86/test-device.c
+++ b/hypervisor/arch/x86/test-device.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2018
+ * Copyright (c) Siemens AG, 2018-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -102,4 +102,5 @@ static int testdev_init(void)
 }
 
 DEFINE_UNIT_SHUTDOWN_STUB(testdev);
+DEFINE_UNIT_CONFIG_COMMIT_STUB(testdev);
 DEFINE_UNIT(testdev, "Test device");
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index acc97919..5f991d3b 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -885,7 +885,7 @@ static void vtd_cell_exit(struct cell *cell)
 	 */
 }
 
-void iommu_config_commit(struct cell *cell_added_removed)
+static void vtd_config_commit(struct cell *cell_added_removed)
 {
 	void *inv_queue = unit_inv_queue;
 	void *reg_base = dmar_reg_base;
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 5da95ada..1e1c7f03 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -279,12 +279,11 @@ static void cell_exit(struct cell *cell)
  * Apply system configuration changes.
  * @param cell_added_removed	Cell that was added or removed to/from the
  * 				system or NULL.
- *
- * @see arch_config_commit
- * @see pci_config_commit
  */
 void config_commit(struct cell *cell_added_removed)
 {
+	struct unit *unit;
+
 	/*
 	 * We do not need to flush the caches during setup, i.e. when the root
 	 * cell was added, because there was no reconfiguration of the new
@@ -296,8 +295,8 @@ void config_commit(struct cell *cell_added_removed)
 			arch_flush_cell_vcpu_caches(cell_added_removed);
 	}
 
-	arch_config_commit(cell_added_removed);
-	pci_config_commit(cell_added_removed);
+	for_each_unit(unit)
+		unit->config_commit(cell_added_removed);
 }
 
 static bool address_in_region(unsigned long addr,
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 9d1e74fa..ececa026 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -263,16 +263,6 @@ void arch_cell_destroy(struct cell *cell);
  */
 void arch_cell_reset(struct cell *cell);
 
-/**
- * Performs the architecture-specific steps for applying configuration changes.
- * @param cell_added_removed	Cell that was added or removed to/from the
- * 				system or NULL.
- *
- * @see config_commit
- * @see pci_config_commit
- */
-void arch_config_commit(struct cell *cell_added_removed);
-
 /**
  * Architecture-specific preparations before shutting down the hypervisor.
  */
diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index ee530c03..0d332a1b 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Ivan Kolchin <ivan.kolchin@siemens.com>
@@ -157,8 +157,6 @@ void pci_reset_device(struct pci_device *device);
 
 void pci_cell_reset(struct cell *cell);
 
-void pci_config_commit(struct cell *cell_added_removed);
-
 unsigned int pci_enabled_msi_vectors(struct pci_device *device);
 
 void pci_prepare_handover(void);
diff --git a/hypervisor/include/jailhouse/unit.h b/hypervisor/include/jailhouse/unit.h
index 40e1cbfe..377a5de1 100644
--- a/hypervisor/include/jailhouse/unit.h
+++ b/hypervisor/include/jailhouse/unit.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2018
+ * Copyright (c) Siemens AG, 2018-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -21,6 +21,7 @@ struct unit {
 	unsigned int (*mmio_count_regions)(struct cell *);
 	int (*cell_init)(struct cell *);
 	void (*cell_exit)(struct cell *);
+	void (*config_commit)(struct cell *);
 };
 
 #define DEFINE_UNIT(__name, __description)				\
@@ -32,6 +33,7 @@ struct unit {
 		.mmio_count_regions	= __name##_mmio_count_regions,	\
 		.cell_init		= __name##_cell_init,		\
 		.cell_exit		= __name##_cell_exit,		\
+		.config_commit		= __name##_config_commit,	\
 	}
 
 #define DEFINE_UNIT_SHUTDOWN_STUB(__name)				\
@@ -41,6 +43,9 @@ struct unit {
 	static unsigned int __name##_mmio_count_regions(struct cell *cell) \
 	{ return 0; }
 
+#define DEFINE_UNIT_CONFIG_COMMIT_STUB(__name)				\
+	static void __name##_config_commit(struct cell *cell_added_removed) { }
+
 extern struct unit __unit_array_start[0], __unit_array_end[0];
 
 #define for_each_unit(unit)						\
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 6934c33d..4a485357 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Ivan Kolchin <ivan.kolchin@siemens.com>
@@ -785,14 +785,7 @@ static void pci_cell_exit(struct cell *cell)
 	page_free(&mem_pool, cell->pci_devices, devlist_pages);
 }
 
-/**
- * Apply PCI-specific configuration changes.
- * @param cell_added_removed	Cell that was added or removed to/from the
- * 				system or NULL.
- *
- * @see arch_config_commit
- */
-void pci_config_commit(struct cell *cell_added_removed)
+static void pci_config_commit(struct cell *cell_added_removed)
 {
 	const struct jailhouse_pci_capability *cap;
 	struct pci_device *device;
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-6-ralf.ramsauer%40oth-regensburg.de.
