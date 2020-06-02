Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS563H3AKGQEGAEHECY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4271EBDCC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:44 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id r143sf3520966lff.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107403; cv=pass;
        d=google.com; s=arc-20160816;
        b=C7yeFAzUIQ2X4UP+lPbm6Wf5J93Ed/5tYVzIYrKBADfa1hmVekPRn7FuTpadzjCGo2
         aX01rIRiXMZdnJ9QYxcVS1gdf4CoUK+21C/6JDpppJXe9HHrMkcMVG8Qh068ymo2vpN/
         jZv1WUsyY6HvGOOzeTZvWtLkPV4LCsy8pZKwLTN9LKXEu2V+bRo0TJVaixs57JsQgYQQ
         ZmPESJ0aTAJqjFh28H4LdjeOT1gItWFFH4Ry9Cxoe8aKrYqSTgB4xoqkqCgZ8Lq0z7YN
         SHyjYYgFufjgsZjX02+1jVk5NNieTXb+EX4lHVTuuBuYrZuAIeJ+9rLPd0n/spORugv2
         EkYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=CKB751hkwOrUzV/GBYsVlJ8TvfO+VPk7Qyi7xI5kucI=;
        b=H4dgTQ3GCU/IAngxAWpkmL6St1HB1/A342Uj8PjKY2K1KBN7EWHZn3rvIq2ByBeX1P
         8zSeJ5Nml7/kMF1+jQvLAqyEcgQG8DQIzokGFMg7F5tVWlA+R6TO5uV2HqXJPtdchyBt
         9L0U3Vugy5TsqObvJ0GOSSS+M7CLQT5gdButA6+yFlK+IknLIFfBN+TVuQb35V2LR/2A
         a1xoG6S2EaJDJiHOARSZI/tDKqhxwo40pVJNKG+bygvjFzNToswjm8jMPSXAdCyowrxO
         iUQv1PuUs82zR+RpCcADzT4C9E587HgxWErvvtpMoEezn+SWz4tfFo/H5gYZoKhq8+qG
         ZMBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CKB751hkwOrUzV/GBYsVlJ8TvfO+VPk7Qyi7xI5kucI=;
        b=qJKzalDRhQtqZTmzv3gel4NDPnnM07A/546Grn5uyPDANjpgIy8DtJy7M1rr4ip+xe
         KJgGdG7XPKgUI0AfTE05ICZYyIK8CLxp8I+4JtEK5Mz5MpRWiPlqs8lPLHXALGKQ1j+h
         Oaj0S+Sw4IET93ckfk3ifcYrB19mYKU0ePIuxrUQ/VGQoL8eOAwYw73Q1kDSY4K8975U
         qCMlr3UleXMbG8nZZz26PqnREg96bqNh6eykKkTEhpPDiaOEqp1pKw3U+bCHjnvlV1zw
         SA8IprZT7QgYzo+9NFIDvymkh9qt8/S/kNjBXr4pM4yXOIdoPgQVGEWdgtxSVMV2CqXA
         UBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CKB751hkwOrUzV/GBYsVlJ8TvfO+VPk7Qyi7xI5kucI=;
        b=ErVxM/LvuIsOulwao0fAzi135v9QcmvNzLFD+KNvG53aUnpBXM5Z8mNm84Nw+PGf4V
         ONk4hD5MJBS4hje8Wu1gZK8IN57BvdRXWZx+wcdwFhnufeHojOQe88NshNb7RQU4Yz8X
         TCjJWj4Mr44QZ7BrkWfuw/YI1007I7QoAD7ujMbZO8ReVgJmbxlZs49hmujU7Fvwimwo
         av1IqvIk8H5ThrWc+3skDlTV2CR+LcvX+/I6833MqukmJgg6rl8rgHxHDmyWelqPrn6C
         f19DvblP/ZgJDHFX9KlYT953t5x+b4pkuWyyHhpNFdr58sFu2jIxEc61RweWGB6YnN/s
         Kl+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XIl1IE/03UJhS9K2/U0nzgn/bif4/dAfiwxtuh3ppaTJwD4JM
	fqA5jgIxOJfPkHI4rk8KSBw=
X-Google-Smtp-Source: ABdhPJzW+ZywVQHEhNUuoGRWSHY9UtbMAYYDGmtw0nFh3pjln2IE0yGGn5/IFarMiJhWyMOLi52QRQ==
X-Received: by 2002:a2e:7610:: with SMTP id r16mr13804304ljc.88.1591107403465;
        Tue, 02 Jun 2020 07:16:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:92d6:: with SMTP id k22ls1022756ljh.4.gmail; Tue, 02 Jun
 2020 07:16:42 -0700 (PDT)
X-Received: by 2002:a2e:b529:: with SMTP id z9mr4340595ljm.390.1591107402440;
        Tue, 02 Jun 2020 07:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107402; cv=none;
        d=google.com; s=arc-20160816;
        b=hvGQuLprWxFYGMbJj3X3CzPoDt3zbs/8RDVFTaJZMB+RE6rrVtGTPjWh0HvOLxI4QA
         s/OY+NuLijC3sTZmE1Nppdy1/HJ/ts5rDF0Sld0TdcutS3qTGNu2Zw/9YkvhzPU2aTNU
         UNMdH5PManhVyFkxAdccP6c7/69REls8zp7lRJFVWAgWW0FIl6rg/H15DGekYelGIdzF
         j8rarpoY+Z3KJtLR+Gb14rofcXkCulGnGKdVZmVtH2Y/ggDOFZKljCThVbk1vOeqVUHt
         +vrrt1MS9dbAY+SQOeJjMzTu5J5y7zSMOUsKb3w4Xy0ccEpCMljsqZVCiRIbr2PBcsuL
         O7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=c3MdmsXEvMbc/Qt/7Az+uAmXg3qnBi6CWsPOJpc0Dpk=;
        b=SEVnMUNDeWEFJI7MO/RaMl221f+C0/2JcixSr9vNgvKWlhTLFqg68IhummdOdeJYZK
         zsneM0cLlrnZe+Bw1AJdHrBCxB0BtSa5TapzT+PQ46oT+VTpFydxhpySsmlWMnIkIolq
         BIRXt1xY51cdKxFGvv5V6SmbgZw1JBtGjNd4mvbid2u0XFgXJtrFALLpYwN+cMNDC8dU
         f3N1ZdqNKVkfFP6U5gahvWNtWaagVXgG8LV3znvX9oT2DXTf47PGp75XISvJKTfO4Ht8
         wFw3XdXFNHChtEzgMqplZrOE/LNYqbRn6x3jqX6PdmMezqoMmaG/EGpnNgsaObBYcykE
         is2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id c144si145174lfg.5.2020.06.02.07.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGeYu024106
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:40 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdA028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:40 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/15] configs, core, tools: Pull iommu_units out of arch-specific platform info
Date: Tue,  2 Jun 2020 16:16:24 +0200
Message-Id: <b9df7b984d88f627c1973e8aaa4ef21d62117ab9.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

This is now used by x86 and ARM, so there is no need to keep the same
field in each arch-specific section of the platform_info structure.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/k3-j721e-evm.c    | 15 +++++++--------
 configs/x86/f2a88xm-hd3.c       | 22 ++++++++++-----------
 configs/x86/qemu-x86.c          | 14 +++++++-------
 hypervisor/arch/arm64/iommu.c   |  2 +-
 hypervisor/arch/arm64/smmu-v3.c |  6 +++---
 hypervisor/arch/arm64/ti-pvu.c  |  2 +-
 hypervisor/arch/x86/amd_iommu.c |  4 ++--
 hypervisor/arch/x86/iommu.c     |  2 +-
 hypervisor/arch/x86/vtd.c       |  4 ++--
 include/jailhouse/cell-config.h |  7 ++-----
 tools/jailhouse-cell-linux      |  2 +-
 tools/root-cell-config.c.tmpl   | 34 ++++++++++++++++-----------------
 12 files changed, 55 insertions(+), 59 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 4f9755a8..3ac0b57e 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -45,13 +45,7 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 3,
-			.arm = {
-				.gic_version = 3,
-				.gicd_base = 0x01800000,
-				.gicr_base = 0x01900000,
-				.maintenance_irq = 25,
-			},
-			.arm.iommu_units= {
+			.iommu_units= {
 				{
 					.type = JAILHOUSE_IOMMU_SMMUV3,
 					.base = 0x36600000,
@@ -79,7 +73,12 @@ struct {
 					.tipvu.tlb_size = 0x40000,
 				},
 			},
-
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x01800000,
+				.gicr_base = 0x01900000,
+				.maintenance_irq = 25,
+			},
 		},
 		.root_cell = {
 			.name = "k3-j721e-evm",
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 16708384..e5dfd78f 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -46,19 +46,19 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = 0xe0000000,
 			.pci_mmconfig_end_bus = 0xff,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_AMD,
+					.base = 0xfeb80000,
+					.size = 0x80000,
+					.amd.bdf = 0x02,
+					.amd.base_cap = 0x40,
+					.amd.msi_cap = 0x54,
+					.amd.features = 0x80048824,
+				},
+			},
 			.x86 = {
 				.pm_timer_address = 0x808,
-				.iommu_units = {
-					{
-						.type = JAILHOUSE_IOMMU_AMD,
-						.base = 0xfeb80000,
-						.size = 0x80000,
-						.amd.bdf = 0x02,
-						.amd.base_cap = 0x40,
-						.amd.msi_cap = 0x54,
-						.amd.features = 0x80048824,
-					},
-				},
 			},
 		},
 		.root_cell = {
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index f209f372..9ca5c528 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -45,16 +45,16 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = 0xb0000000,
 			.pci_mmconfig_end_bus = 0xff,
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_INTEL,
+					.base = 0xfed90000,
+					.size = 0x1000,
+				},
+			},
 			.x86 = {
 				.pm_timer_address = 0x608,
 				.vtd_interrupt_limit = 256,
-				.iommu_units = {
-					{
-						.type = JAILHOUSE_IOMMU_INTEL,
-						.base = 0xfed90000,
-						.size = 0x1000,
-					},
-				},
 			},
 		},
 		.root_cell = {
diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
index b3ab51b4..805589b3 100644
--- a/hypervisor/arch/arm64/iommu.c
+++ b/hypervisor/arch/arm64/iommu.c
@@ -19,7 +19,7 @@ unsigned int iommu_count_units(void)
 	unsigned int units = 0;
 
 	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
-	       system_config->platform_info.arm.iommu_units[units].base)
+	       system_config->platform_info.iommu_units[units].base)
 		units++;
 	return units;
 }
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 3889d32b..2f57868d 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -1047,7 +1047,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	if (!iommu_count_units())
 		return 0;
 
-	iommu = &system_config->platform_info.arm.iommu_units[0];
+	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, i++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
@@ -1077,7 +1077,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 		return;
 
 	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
-		iommu = &system_config->platform_info.arm.iommu_units[i];
+		iommu = &system_config->platform_info.iommu_units[i];
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
@@ -1097,7 +1097,7 @@ static int arm_smmuv3_init(void)
 	struct jailhouse_iommu *iommu;
 	int ret, i;
 
-	iommu = &system_config->platform_info.arm.iommu_units[0];
+	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, i++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
index b06ba843..3b9a29ec 100644
--- a/hypervisor/arch/arm64/ti-pvu.c
+++ b/hypervisor/arch/arm64/ti-pvu.c
@@ -536,7 +536,7 @@ static int pvu_iommu_init(void)
 	unsigned int i;
 	int ret;
 
-	iommu = &system_config->platform_info.arm.iommu_units[0];
+	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, i++) {
 
 		if (iommu->type != JAILHOUSE_IOMMU_PVU)
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 6161ccf8..40ec4e20 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -445,7 +445,7 @@ static void amd_iommu_init_fault_nmi(void)
 
 	for_each_iommu(iommu) {
 		struct jailhouse_iommu *cfg =
-		    &system_config->platform_info.x86.iommu_units[iommu->idx];
+		    &system_config->platform_info.iommu_units[iommu->idx];
 
 		/* Disable MSI during interrupt reprogramming. */
 		pci_write_config(cfg->amd.bdf, cfg->amd.msi_cap + 2, 0, 2);
@@ -780,7 +780,7 @@ static int amd_iommu_init(void)
 	unsigned int n;
 	int err;
 
-	iommu = &system_config->platform_info.x86.iommu_units[0];
+	iommu = &system_config->platform_info.iommu_units[0];
 	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
 		if (iommu->type != JAILHOUSE_IOMMU_AMD)
 			return trace_error(-EINVAL);
diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
index de17144f..fa50c2f4 100644
--- a/hypervisor/arch/x86/iommu.c
+++ b/hypervisor/arch/x86/iommu.c
@@ -20,7 +20,7 @@ unsigned int iommu_count_units(void)
 	unsigned int units = 0;
 
 	while (units < JAILHOUSE_MAX_IOMMU_UNITS &&
-	       system_config->platform_info.x86.iommu_units[units].base)
+	       system_config->platform_info.iommu_units[units].base)
 		units++;
 	return units;
 }
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index cc7d3bc6..e33b5ff4 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -965,7 +965,7 @@ static int vtd_init_ir_emulation(unsigned int unit_no, void *reg_base)
 
 	root_cell.arch.vtd.ir_emulation = true;
 
-	base = system_config->platform_info.x86.iommu_units[unit_no].base;
+	base = system_config->platform_info.iommu_units[unit_no].base;
 	mmio_region_register(&root_cell, base, PAGE_SIZE,
 			     vtd_unit_access_handler, unit);
 
@@ -1027,7 +1027,7 @@ static int vtd_init(void)
 		return -ENOMEM;
 
 	for (n = 0; n < units; n++) {
-		unit = &system_config->platform_info.x86.iommu_units[n];
+		unit = &system_config->platform_info.iommu_units[n];
 		if (unit->type != JAILHOUSE_IOMMU_INTEL)
 			return trace_error(-EINVAL);
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 30ec5d06..004d048a 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	12
+#define JAILHOUSE_CONFIG_REVISION	13
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -306,6 +306,7 @@ struct jailhouse_system {
 		__u8 pci_mmconfig_end_bus;
 		__u8 pci_is_virtual;
 		__u16 pci_domain;
+		struct jailhouse_iommu iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
 		union {
 			struct {
 				__u16 pm_timer_address;
@@ -314,8 +315,6 @@ struct jailhouse_system {
 				__u8 padding[3];
 				__u32 tsc_khz;
 				__u32 apic_khz;
-				struct jailhouse_iommu
-					iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
 			} __attribute__((packed)) x86;
 			struct {
 				u8 maintenance_irq;
@@ -325,8 +324,6 @@ struct jailhouse_system {
 				u64 gich_base;
 				u64 gicv_base;
 				u64 gicr_base;
-				struct jailhouse_iommu
-					iommu_units[JAILHOUSE_MAX_IOMMU_UNITS];
 			} __attribute__((packed)) arm;
 		} __attribute__((packed));
 	} __attribute__((packed)) platform_info;
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 007a5c46..de09154a 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -574,7 +574,7 @@ class PIORegion:
 
 class Config:
     _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 12
+    _HEADER_REVISION = 13
 
     def __init__(self, config_file):
         self.data = config_file.read()
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index cca273ef..c28fcfa4 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -83,26 +83,26 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = ${hex(mmconfig.base)},
 			.pci_mmconfig_end_bus = ${hex(mmconfig.end_bus)},
+			% if iommu_units:
+			.iommu_units = {
+				% for unit in iommu_units:
+				{
+					.type = ${unit.type},
+					.base = ${hex(unit.base_addr)},
+					.size = ${hex(unit.mmio_size)},
+					% if unit.is_amd_iommu:
+					.amd.bdf = ${hex(unit.amd_bdf)},
+					.amd.base_cap = ${hex(unit.amd_base_cap)},
+					.amd.msi_cap = ${hex(unit.amd_msi_cap)},
+					.amd.features = ${hex(unit.amd_features)},
+					% endif
+				},
+				% endfor
+			},
+			% endif
 			.x86 = {
 				.pm_timer_address = ${hex(pm_timer_base)},
 				.vtd_interrupt_limit = ${int(vtd_interrupt_limit)},
-				% if iommu_units:
-				.iommu_units = {
-					% for unit in iommu_units:
-					{
-						.type = ${unit.type},
-						.base = ${hex(unit.base_addr)},
-						.size = ${hex(unit.mmio_size)},
-						% if unit.is_amd_iommu:
-						.amd.bdf = ${hex(unit.amd_bdf)},
-						.amd.base_cap = ${hex(unit.amd_base_cap)},
-						.amd.msi_cap = ${hex(unit.amd_msi_cap)},
-						.amd.features = ${hex(unit.amd_features)},
-						% endif
-					},
-					% endfor
-				},
-				% endif
 			},
 		},
 		.root_cell = {
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b9df7b984d88f627c1973e8aaa4ef21d62117ab9.1591107398.git.jan.kiszka%40siemens.com.
