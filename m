Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKVGML5ICRUBDOV5L7W@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A17DA43
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 13:27:40 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id t19sf44983060pgh.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 04:27:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564658858; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZprgaGLvauG4HOtiC24CIgyxZ/eYr3QLQ64BisnTNQPsvP8CL8tYGm1Y3vvjSGZ/3Y
         XnZnN1/GKtldPXxPs+py+J8kCsdpircOkwVR638ugjfyMSJOcg1II9Dj4rfHysW80cUK
         7A92h8/1ndhZzXDOc8p8FgFvIkfyZYHQVrjpiNVqjGIFMvBRns9HLnSyAsAbxm9MpK52
         XRKw+miSec5A7OKZMhyP6j80vW8GXRwDt/kIW8q5//ReU8msM1d7QLWcZg6Rq+PWNbZY
         IW5m8S7g5u9+fDYeUVgcj1yUl4i7ov3sPo35inKlAx/aDBoF3VQVg0pRqFCZWM2albE9
         h9pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hfkntpmWotJWDsY9FsF2YbUql9ev3zK6imzfG/WCjCI=;
        b=0S4yyyS6OBNWk0eX0Yje7ZF1BCoctlEHmN6F1vqSJPuQ1Qo7BHv2ch3eQwsLEvxmLs
         icG0ZMiJenAikdyeziOauqe3ddtqV/bk724cdTj+w+jx+8MawZ7rXRNc7YEuq2KOIyph
         Ggl3p/Y5MX7g+OMtLbb7ll1Hl9tr45CoRv1GrXwMCLYJaYJ6p1EIrxYPAKo+S2pf26hS
         VSmgpFVU4WPdzoVlt7I4H8Dv4MQire2loTIM9vCcfaeVZ8tEsoAeg2cJaZAf4jnR5wj0
         TnW3CWNEgpPI80ueT3ozG1Ozw458rewkZMMwJKeVaibXTsdTRZLYivseomCHvhZYz2gq
         NCMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JPMHof1f;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hfkntpmWotJWDsY9FsF2YbUql9ev3zK6imzfG/WCjCI=;
        b=JilsCV2nCaWDjN3Hx6vooCuLEv/BIgZicc8FBgoFyQATW8E+w2Z+IoGwTIGoTcWlkM
         OEBGz1I6ZOsxPeTwI5z1othALevniuKsWLEK0CY5jRf/CU1ZrAxUXWmQfmqtBOc8hq2E
         /VQsa6eH7NPyEW35SikS5tHCbWMQvuewJX17DccW1h8nVCqoSMBzTTCMrzYg+hSl5jdm
         V93rckDJTNW7CqOCyEFKKH2Qn7NnKOnVaOgOBZLzzX3HraO0f8ph0wPdrm475nDH9YMG
         GWINw/6gwB76X0jExoiY4sBILnjwWQX7eOcLirkagK8vhA9K4juAaVmAO4pHO4PrshVz
         13KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hfkntpmWotJWDsY9FsF2YbUql9ev3zK6imzfG/WCjCI=;
        b=oVLVXrO1WEFDptOY0T+IsxU9hRzHOjR3Zz9kmtXI135DjNyjB6i2DpRVrTF7Y5rr5B
         SQJfU1Su3A3ZsmTgYWiFDRoyakWdZ9Ua8585S7T58F1Xlxii/OURYpGZNpdOhqlG4b4g
         S/XqzBeSOcC0cujHBH7Sj16nNcmTvB9bwsQd0FiwB/HY+pacTCWbbK3XTWwaaao/6brG
         vJN/lBX+aApyl/KGbuCnCOkhTRMxCrltW4BNQ+83QyCIJ60ex7sQW8zU5KV/wZCmwhdL
         xY/ZIl3okO/VH+EIvClnw5jTehcriIW+Kr6Ih0onf4nvY4cJolnBEckpAW8g/UQSycSi
         gYlA==
X-Gm-Message-State: APjAAAXkuqEKOZVm6NdcnYs+YADg9atOJr1wAQcNeSaabucd8exNJlv2
	YZ69GbOC3qFF1vAFvVfGSvc=
X-Google-Smtp-Source: APXvYqw74hROx2OdqSNylqZhZkZ+3COSD2ZkVh922lIDgspoaqCVMPKjuPK3HHTdyPLfHgC+Q6CaHw==
X-Received: by 2002:aa7:83ce:: with SMTP id j14mr17670651pfn.55.1564658858871;
        Thu, 01 Aug 2019 04:27:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:6b81:: with SMTP id p1ls19339813plk.6.gmail; Thu, 01
 Aug 2019 04:27:38 -0700 (PDT)
X-Received: by 2002:a17:90a:2228:: with SMTP id c37mr8331508pje.9.1564658858468;
        Thu, 01 Aug 2019 04:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564658858; cv=none;
        d=google.com; s=arc-20160816;
        b=o950lEY8Cs0MZsRscMngNK/IubmmYa2h3PF3ducVW87dRGwyMcLCUS/nwPvImFfnm5
         7srJMWmvefMOJf5icsiUeATcuh6/oiYEUFjWqoUjViEoLTNWIyr3tdB47Or6Pa+QVcr3
         F0vW8qdpBLA+XBBKveIpHuLpXE7R4U3u5n0+Iq0OZHmlSYc6x17qMwZOK1imlQ+RBkEl
         uRqXY6x/2ft+oHq1U013Vo8hhPKSE+as7U8SIjNnetPcLyqEgJFavJfStB2oX5IQnE7s
         WRxL+sck6Cr09NojJn1N9ENdwVRiKiiJJt2ATp9BRkxH8N7RTuH3aiAWHNCLzkRrzw9I
         7R9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pi5Ko7MESG3WfwPTzZzQulJijp9Z/UzygxIfA7iOT+4=;
        b=hLjTEtZEvPLdO93byPx7nEPelysNbdtJ88ecnKoqINHPUB59r38oDhJIxKxVaWff4R
         TcrfhMkhnGgna4nS9FvSDa5/Rd0MXE1vrWGb93sCm4YyFQkcX7Lvzo/4F5r7Wi4JttzR
         7s17WvhYOClr+j02DOj7w0dwUkfBOSWj3OYZBnj3zMLNkrp3/bjHaWh4+P3HksZ+2deP
         6HrpZVUdDe2KpCL59e7XngaeB/Yyh1xsV87Zv7z9hQLPEl4pJAYrQY+RhTkrRq7OrCiy
         MUqyTtX/1Qgp8h35PWgAvD1tQBp0T7wdjN1sHqdci7gzOp2ZkafmxdWeBhLDtpRHbf74
         0K9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JPMHof1f;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id q2si2300443pgq.3.2019.08.01.04.27.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71BRbeS092999;
	Thu, 1 Aug 2019 06:27:37 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71BRbcE051824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2019 06:27:37 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 06:27:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 06:27:37 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71BRRX1048824;
	Thu, 1 Aug 2019 06:27:33 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v4 1/6] iommu: x86: Generalize iommu definition
Date: Thu, 1 Aug 2019 16:56:43 +0530
Message-ID: <20190801112648.6569-2-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801112648.6569-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=JPMHof1f;       spf=pass
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
index 4b69654a..bbdd05d4 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -197,9 +197,14 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_MAX_IOMMU_UNITS	8
 
+#define JAILHOUSE_IOMMU_AMD		0
+#define JAILHOUSE_IOMMU_INTEL		1
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190801112648.6569-2-lokeshvutla%40ti.com.
