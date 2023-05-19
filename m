Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTF5T6RQMGQELBDRQ2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1270A0B3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id ffacd0b85a97d-309571456a1sf514241f8f.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528845; cv=pass;
        d=google.com; s=arc-20160816;
        b=x8MNQqu7X7gjmx+5oGnNLfk1VO2sjBkNDeZjig3M35fDg4TiQE+NDwyDjOFf/NTnnS
         YxwKva88GaMN+rd9LUL1sN4+nCpvB6OvLNu7YsgrATBBN6sOT0/RNCkdM1oni+3VawV3
         mGjNVmSvctCGaZys48qFBHqZuiD6nyDs44YqUJA5J7CjUzU3p/htjJPSqo9zBZI7Nvuw
         +ofj4qsrBt18LioWEmv7LGxe6kVrrChOezSTY7JsyaUGsYxh+qQ1vaFb2PCv1cw9FkPV
         3Y9rBcN9PUtys0ZChH1ci9fpTcgB3xT5N8vBzDpfBKKbyER3U3lB+0ztm4FX9FJmErJw
         8j/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vSdkCpGB7ms9K9dLftVQw7uZlFAK8NzL64HlaLLSWSE=;
        b=g9WMKtM0bHlJbaIXFPe73m40b5H6iK/GQ/yiTwyVKG3NPSJKnw2ZcprlfIeQPrNSXN
         8E0/oMCOETMBaqwm8lUEuRT0w+PzOV4CRD8+e4RrenaicfeZNlsoml+kXcVLI6xQXM0e
         rzQ0Mu+Z4E9nR+ZngmOo4zDaJejrJLU6aVH+6kIn/7hZH/mx2hEGkvnard+r0WmBgHxk
         M6WYM7tZg2nhd/slcPNs8q4Yru4pdS7bjR6Xdzb8/X1KPI3M1QB/Jn/e76RbGdIcHS1w
         k8lGKgsBFlEHnTDaUz/RKhSqNQTMjUVejQl6QvTdECzyutVUQjJCaWQlkcp1sfDiTamQ
         3rCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSdkCpGB7ms9K9dLftVQw7uZlFAK8NzL64HlaLLSWSE=;
        b=B1+may8YxSk8Yf2zpDUCzy2s2BI+p1KIJlB21pyFyuBfWan2CLa1FqL0WPK/WZR6vT
         TJrEWGZDWP83ZbMkzK0gTTXUotnUMO87bYKYq/40cDhIDizIyqx3vIPT2TAdKA2q8eWK
         g2/5XOcP6+9FvmgdO68uXfhdwVoIWhR5jsRQAIU1See71D06cSAYoBzkIPDdesPDOt0z
         DBJxCM739vT9NDBDu9fQk+3dHPZMQWPyxOq5Ye7a9BjRifFZOowN7/Kqi98qHPtBo7zO
         x6GFmjWq8k1qKDZi6n023U30F7WsJHL7yTvzpWXDAn/Yb5bMeiC3vdYL0MgVFmTXe+9F
         MJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSdkCpGB7ms9K9dLftVQw7uZlFAK8NzL64HlaLLSWSE=;
        b=itoX4hcHWdyPYMUxgBPqZ0WfUaZnC1NuDbsDVO88d4MLvAcWyKt88iiMGrnLcm1mRL
         /zUjHl/M7gW2UUalUr8cVNLXpgZPFprBpd6CpGOW3KgLjgzm2JIt79SbbG+rwEAp1vVK
         p2Jls+jwz0RBdLW1QIq7R4RLjwf6DocfnjzG+ba57PTGC95k8T6NKMhpQt2Xy2GXsVQp
         VW47Ej7lIxH0WM3DKAarjev/ToqgOequJrBSNkS8hBMD4y4d+BKDWe6VxLfIISTgIYWs
         wlfjOEzHlNiGDQhYoj91VeJ2tq9hlvqnoaGb2qDqbSo/jOcHm5PX5Xn/cXF/SwjrOIgc
         VO2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxf0oRgN7i5Ih3JDh0TYxyvdnAFRSDYG7M2WYvZfdUBZztuXv3W
	Yt3kiGSibp/dx/sHjFWlesA=
X-Google-Smtp-Source: ACHHUZ5RnYFXfPrvQ504gih5DY722Dx8klkzVlXrrlJtk7nXDU5Nmte/NVFeiKYpeKHEdNDC2t8xSQ==
X-Received: by 2002:a05:6000:15c3:b0:306:28af:9a1b with SMTP id y3-20020a05600015c300b0030628af9a1bmr1637062wry.1.1684528845408;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da1:b0:3f4:f1c0:4e20 with SMTP id
 p33-20020a05600c1da100b003f4f1c04e20ls1510150wms.0.-pod-prod-06-eu; Fri, 19
 May 2023 13:40:43 -0700 (PDT)
X-Received: by 2002:adf:fd8a:0:b0:309:45b0:e7f7 with SMTP id d10-20020adffd8a000000b0030945b0e7f7mr2245332wrr.52.1684528843605;
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528843; cv=none;
        d=google.com; s=arc-20160816;
        b=a4YE5qu8M3EWkO8CZIIUsxqGR3hW7Vdf9YVN5UC5bmpCHk5eaLIP3MCy/EHAMp975Q
         KG664LrzrLPjqK+mRsEsOg3EKzLVyTIc+A9cD+i0BhDmnlgumdLkeifAT3ZeAH4fzse4
         pg2sLYmjrFW5zF/2Aj1qzLTDF70iYCdJV2vuli9QOOP8QqkE4Fdn8ECm8aJUQtwYX2R0
         lpp1Pw2AvPIRcGEz02Gdt7YUZCeGFcifvRkLKKQD6rw9nun84AnAbdbTRfGMrAIwoZKO
         XYzrYtdaD5bYmc7mRXxq/JbeN4EfXCGr0wNnpXba0p1a6tn6rHxdF62u3RB5HIuJEAj6
         SxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=nMClrorgTsEJ5V4Pw+47z1H1Pcvu1XX68r2jJkuOadA=;
        b=KFbE2A4B4M9AK/cN0wfA7KkY/HIMmyXYp/epqKoGw4yQLrkdt3cRbTG1RRDJZ9Pz/v
         daSdyP4JJ7GudcFbLbBwuCr2sqrcnSG1LluRnXTylFgbH+vvDjgHnTVrVn8Y04hw6eA7
         9TjSHwX8D9Ds2py4OT00gR7yD4/o8M6j73SqRDn2BXi0f0JpE5/l0n5lwYeyqGS7ClRt
         /dcAMPpmo9cCbiVnWCCVOQ+HIon/4ZURV4GXqS2END8zTwcSq6u3qAWHKycGM7bucEbz
         9DHi9oS4QAHAU7Pqg66tdov6TOZnE7apq+cnrTOoXrpGrqpP+aPsDrVBIPCCtpHRUQlE
         cfWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bt16-20020a056000081000b00308f130be6esi2330wrb.0.2023.05.19.13.40.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdR0Tkszxr2;
	Fri, 19 May 2023 22:40:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 05/73] core: Convert config_commit into a unit callback
Date: Fri, 19 May 2023 22:39:25 +0200
Message-Id: <20230519204033.643200-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CANPHARM_COPYRIGHT 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FRAUD_WEBMAIL 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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
index ccd0bdde..35c2d1db 100644
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
@@ -884,7 +884,7 @@ static void vtd_cell_exit(struct cell *cell)
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-6-ralf.ramsauer%40oth-regensburg.de.
