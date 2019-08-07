Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKFCFK5ICRUBH43ALW2@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D4E84670
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:19 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id 71sf50476680pld.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164578; cv=pass;
        d=google.com; s=arc-20160816;
        b=xzT9iJXzIUKB5Z3ZL0k0cYdD+SJskZ1A0JxorJ3olVWgIs6m/3PQD0pIIerlo2H9vv
         Eq5gT0+AfaGaINzS76vG4fiswrmVJZZLuiRmAyGzL1SaG22t5BQ9GRGPILoTlw/Iy31V
         jO0A3pjysNVYKAl4aRQDtlaL7frWBwNHyB03wHuB8oUG5eVUcMTo+CQQMqaFJx9D9cwk
         +EVGjDlOejCX3uPSfYwZRsIigDYQ97m3VI0+hE7Vjx9a/h67kT7yxsp4//POWGIfYY/u
         YIxN7zfcsDJfrwvaqoewTY2MSSxPjfCwjK8Bf8baz9PV84fpdAqdQ5RIglUJjpQJNY63
         ML/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LxprYQ7xPsXayb4XuZvAVXDf9EFfem9Vbgw6jET4pYM=;
        b=P3F80MgcoZCmZtFauS4MdiN3Fz6CcaGbL9DM5aNtW8LSW4ryiIX2FrHktZoezdPBbJ
         jwilUFy/c3kA97Q3wJ4/CwmqZWh+g7NMD4yQslDURknfVGyUwa7D/rEr5Rb+tSZLxc+q
         tMCFQJpBrsqxQBiDSkZOAeC07F5fK9XCUsSEYzR32ycRCYRGqJULTpqcMsF/qtUP0rY+
         GcR+aGFzoSsVGe9rsriNkQVXGrbz7lCwGqmXJ3K4p3+VD9g/CKQ05bh91IDJh839KMEg
         RrDfhL80mDBroSHI1M5kbr+JbHcdiwmtR6U41LqJn1b2lCbDRAMjTs00QhAc8K1d/VM0
         3FqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VmlVOwsW;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LxprYQ7xPsXayb4XuZvAVXDf9EFfem9Vbgw6jET4pYM=;
        b=GDkIOMHvmsL8OjFppW5SNRWqKAeYdk0+g7XCDDgw/2N/VCveGgWRfGVcDbXgOEgGc1
         DAPwbNbksYjSHxJOMGvyF8aktI13e5FhYxT+clCQZIg6SEGk9z18CqG/qP3mrqquVoXk
         Ut2ShM3/uATJrli7oDPgbxk7G/IAeBsfiiex6lP5ooSy5lFFkRoXZNZuBWp8mUZpzRXA
         FAIvLpSXF2czImF08Byxsr9oWiEmPcZtovdKusn1YuFgOtFqDbjSnPt/4WYbGz7STkan
         lI1omRVeqelnuSQBIsFveAUK7p/b1cmqtIEhbjLwSUfdxETxKD5ZXPTLzTnRBBxzfmb9
         rQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LxprYQ7xPsXayb4XuZvAVXDf9EFfem9Vbgw6jET4pYM=;
        b=K6fA520wKV4azMmKsOP8INn9cSvTJlFZDOolMiLDl4jth8x0cPcY9fsoMlje9TbBjY
         m7H52kMkIM5auLKLy7gWIqGmJ0jGstITF6mwGEJngpjj5n5C87NRFMWVDvjaiSe8EM1/
         7eqhpFPt351S48ImM9hUUrrlIvFPpJqasDw5qRb31cmoV0Dqv9A2dhwfVgMxqgPiHjFr
         FztKiedpTSvu/o/hyL2pD8XcFP6dl/t9IKbT2R76x4jXblJzBWX6AJRaoLCBQWBmiMUn
         v3zmLjQWFoiT9HeCGD3AM587taBcI8DsB++qzJw7s2teIpacQz6jtNeLFFH1kK/hDnod
         6a8A==
X-Gm-Message-State: APjAAAVu3ffpTNVh5aZ9Bzi0aCPw6xSsTWjEvE2FiL1+s/wFZQIXvd6x
	HLt1SfG/Bpio/D9RoGJ5o/A=
X-Google-Smtp-Source: APXvYqx+Oyp4qqt17YPAODh/GTWpQlW8X/4BhzRzwdQ8a8RG3V6ff8jNNsvxC2lrI8haZUnE6o8toA==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr7941114pfa.95.1565164578293;
        Wed, 07 Aug 2019 00:56:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4302:: with SMTP id j2ls11753865pgq.6.gmail; Wed, 07 Aug
 2019 00:56:17 -0700 (PDT)
X-Received: by 2002:a65:6546:: with SMTP id a6mr6859258pgw.220.1565164577811;
        Wed, 07 Aug 2019 00:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164577; cv=none;
        d=google.com; s=arc-20160816;
        b=k5qctXY9vkgHUlYeKpObmEyYtXdCrwE0pm+ZmNQJ13keSj8u66w5gZ5b0Dh2E4ZFQK
         1x766Uc67CvPvmRTXU9KFRTZbX4XzU1TBsGfrvQ7UETzSBsbDtIwoVWkiVpmtLtwrTfv
         /WosRhmLlUg8o/oR1IctRv4Avcbze3t1onq/K2rMXNvNS1XHyqtkIdTU0qOsN5N17+Rl
         0zn8cTgemGLKVb99dE/z1YRLxHe9xfH6neTFYubigixI3KqjPu8qPPLFRFkv8Qltlntp
         qEVyWaIVCZJQIlKv8MysuSuFtlN4qQqEa7maXcLerG8gsgHyDduEsb1SqFv69aQ5RN43
         +TKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I8A2yfI3d4F5NjxWvq4niPln9dLPHNuDt60k8KbfheU=;
        b=kz3B7kuMdk5eMG5l38KUvq8u0p1YNoma1FKYILYUQrcv92Op1YSO+EJ+mOztkoSzil
         T5DZ0EeEosybu88+QoSf02MNrsP+F0TtvN/t4SnDdtuPRJL5296WbvobERVbfUUtXToO
         TxAIvQmF5R9KgCp/mFx7e9GsFOLmsagcSPNT3O3CcDK9DlKhDJkIZtp8NXpmdB7wCZxf
         rnmpz/HfeLxgOmRg0ic5RJYf7KICCOLo/eBevrUm1s2ccdXRbgbMLAx0PjbZe2xH3iHM
         sta0+/MLnaggeDuHie7Cwd4jB6UPX/1dFx7EfoxGyL9BSvBNQXHyHJJYUYz+4eIGoCUd
         Ywcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VmlVOwsW;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id o30si706157pjb.0.2019.08.07.00.56.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uH0S126303;
	Wed, 7 Aug 2019 02:56:17 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uH5O059206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:16 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmT128703;
	Wed, 7 Aug 2019 02:56:14 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 1/6] iommu: x86: Generalize iommu definition
Date: Wed, 7 Aug 2019 13:25:25 +0530
Message-ID: <20190807075530.30444-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=VmlVOwsW;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Right now, jailhouse only supports iommu for x86.
Generalize the data structures to support iommus of different types

Assumption is that each jailhouse_system can define iommu
instances of different types. Extend the jailhouse_iommu
to add type info.

Update the x86 config files to reflect updated data the new type field.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and VT-D]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/f2a88xm-hd3.c       | 1 +
 configs/x86/qemu-x86.c          | 1 +
 hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
 hypervisor/arch/x86/vtd.c       | 2 ++
 include/jailhouse/cell-config.h | 5 +++++
 pyjailhouse/sysfs_parser.py     | 3 +++
 tools/root-cell-config.c.tmpl   | 1 +
 7 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 4332cdc4..cc815b37 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -50,6 +50,7 @@ struct {
 				.pm_timer_address = 0x808,
 				.iommu_units = {
 					{
+						.type = JAILHOUSE_IOMMU_AMD,
 						.base = 0xfeb80000,
 						.size = 0x80000,
 						.amd_bdf = 0x02,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 883ca6c2..f9877a21 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -50,6 +50,7 @@ struct {
 				.vtd_interrupt_limit = 256,
 				.iommu_units = {
 					{
+						.type = JAILHOUSE_IOMMU_INTEL,
 						.base = 0xfed90000,
 						.size = 0x1000,
 					},
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 02712571..2fc6d033 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
 		    &system_config->platform_info.x86.iommu_units[iommu->idx];
 
 		/* Disable MSI during interrupt reprogramming. */
-		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
+		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
 
 		/*
 		 * Write new MSI capability block, re-enabling interrupts with
@@ -782,14 +782,13 @@ static int amd_iommu_init(void)
 
 	iommu = &system_config->platform_info.x86.iommu_units[0];
 	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
+		if (iommu->type != JAILHOUSE_IOMMU_AMD)
+			return trace_error(-EINVAL);
+
 		entry = &iommu_units[iommu_units_count];
 
 		entry->idx = n;
 
-		/* Protect against accidental VT-d configs. */
-		if (!iommu->amd_bdf)
-			return trace_error(-EINVAL);
-
 		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
 
 		/* Initialize PCI registers and MMIO space */
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 8e076b4b..8689e509 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -1024,6 +1024,8 @@ static int vtd_init(void)
 
 	for (n = 0; n < units; n++) {
 		unit = &system_config->platform_info.x86.iommu_units[n];
+		if (unit->type != JAILHOUSE_IOMMU_INTEL)
+			return trace_error(-EINVAL);
 
 		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 4b69654a..740db758 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -197,9 +197,14 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_MAX_IOMMU_UNITS	8
 
+#define JAILHOUSE_IOMMU_AMD		1
+#define JAILHOUSE_IOMMU_INTEL		2
+
 struct jailhouse_iommu {
+	__u32 type;
 	__u64 base;
 	__u32 size;
+
 	__u16 amd_bdf;
 	__u8 amd_base_cap;
 	__u8 amd_msi_cap;
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index a21690db..67dc85d0 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -248,6 +248,7 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
             if size > 0x3000:
                 raise RuntimeError('Unexpectedly large DMAR region.')
             units.append(IOMMUConfig({
+                'type': 'JAILHOUSE_IOMMU_INTEL',
                 'base_addr': base,
                 'mmio_size': size
             }))
@@ -392,6 +393,7 @@ def parse_ivrs(pcidevices, ioapics):
                 mmio_size = 16384
 
             units.append(IOMMUConfig({
+                'type': 'JAILHOUSE_IOMMU_AMD',
                 'base_addr': base_addr,
                 'mmio_size': mmio_size,
                 'amd_bdf': iommu_bdf,
@@ -974,6 +976,7 @@ class IOMemRegionTree:
 
 class IOMMUConfig:
     def __init__(self, props):
+        self.type = props['type']
         self.base_addr = props['base_addr']
         self.mmio_size = props['mmio_size']
         if 'amd_bdf' in props:
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index d24a3666..f9805dcd 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -90,6 +90,7 @@ struct {
 				.iommu_units = {
 					% for unit in iommu_units:
 					{
+						.type = ${unit.type},
 						.base = ${hex(unit.base_addr)},
 						.size = ${hex(unit.mmio_size)},
 						% if unit.is_amd_iommu:
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-2-lokeshvutla%40ti.com.
