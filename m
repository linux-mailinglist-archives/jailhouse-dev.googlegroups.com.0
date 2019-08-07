Return-Path: <jailhouse-dev+bncBCB7D7MXMMIKNCFK5ICRUBDPBH3RW@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18384672
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:23 +0200 (CEST)
Received: by mail-qk1-x738.google.com with SMTP id n190sf78383834qkd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164582; cv=pass;
        d=google.com; s=arc-20160816;
        b=lyAPZbe+ocgmqxFhCtbaiNrtxdwz9F1Xa7nAlkNsEYCvBdp+NPL1YMWwlHE6XdDp3K
         SwyHfbXO1jM2eYddBFAD+DItCevU+3oxN81EDn2eTHdnmKFeZ/AZhsv7QySyJPsEck2Z
         rTsTis9lnamJZCAHY9O8m901ev9Z3D1n6rOFjzuyt+4w+wFUDhmLDknQ59e9FK+eeAS0
         SVh/SuTxTbk1ZwFltaHUlltH0PV2CKD/SGL8udd8krnLd5InW2eV8UkZWdoXSorUiicw
         qGMLPhSrx4X7aHcCYB54esgbMIsP0iZ3UTL7SXcKpV9xFXRI8GO3ati3F2D3qiqMszWU
         py8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vVN5m8yATM3beVCrkE2YRbRr56RV1RLQdCNAErOYN+c=;
        b=d7EDkRbUgQlKDtJ132EWy80YHkuyBdtnZlZ7tVQNET+bgW0rAHK1zSvFYx/rxlKddH
         234n3sZ8h9DcAk6k8pu1GoFhsaLepVcFFavNXPAB80TkptC+qbcPQy/CvI7KKTYfTQ5t
         +UPNx9jvh1X1/ABKpb/VV7IxKUNGn8XyK8vlWuwF+o2ExN4jZJMU4qWn6bLqor/jNB0p
         VgWL+ai/0BRpXsRtN8QOsT+fI/d57/TPGNK0qLEC84sJgPE2g4KX0SbSKMd13uEVNj41
         U73niEuXgA9Cx4MvqVxHK/GU3xpGjxvqGbdON2dYtGzk2ZceYYqZGYvMlKCxZqcJ/u/G
         ap4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n8UGU4UW;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vVN5m8yATM3beVCrkE2YRbRr56RV1RLQdCNAErOYN+c=;
        b=OreY2CfnAkDqqPVtFsemcgaqI/Rn0L0Z/sJJQ85BRy8TSLVSk2B0tzKPMCRUAuyve/
         8QgowdKy1mJ3F5nZhlts7Vj7OpaGyu9uYcLOEMrLxGlnRtfWZaPrnwXuTyV7RLjbmUE6
         9avybCCeeE9/d/YQ4Bsb2Jfs7AcKS/kn3ufKvW7E5U9r2nxeNXicOFpx6yqRDOTANjDJ
         z0IC1jgqtPwwcJ+wA5L60LVzNXceNeKqdJ3h7glvkhvoRc7sVxu/ZfQMJH57tNrmEquW
         GHlRq6QgHOQ34fJVs4vBNNuiTzQ/IPBoVJOBoiDjFdj9HxNfwlQFgN6WAP+M5wBjE/V5
         nfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vVN5m8yATM3beVCrkE2YRbRr56RV1RLQdCNAErOYN+c=;
        b=r4gQT5tyDBCmZ38Am+KcOiel9b/rMp/qIatZMUjgVJCNrvmROln0Hmr/WzeI14+xTg
         qX5ZMlF+HaVzdbYvJyIcjpOheYxeZVg4lRhFAjdNldJ58po9Npd5pyIqp8mCtD5B/ECE
         15bu7CU4TkKcDCyOAZb7eVcwHGuoWa0ztkFLUAmdVfOMUvRAiMSQpDx98OU3ZJVHx3tS
         2zcTOwD5fMeatiyHra2tFkEeoeN+fwQpPPV0tB9gAf10eHcTIMfR7wn7WnLyyQS8ty4g
         7M3Bh2TsPq/nIrIB1XD0T+786mra41S0iNIQStTFBQ0ysQejtbEuwmVEz8ZWbbWmQj8i
         TNcQ==
X-Gm-Message-State: APjAAAU6nw/yIpIfydAZjs6113v4mdWq4h3x0020P6qww1u4sB/v65cp
	DaaLvxld8oeK9v2TzmOmHVw=
X-Google-Smtp-Source: APXvYqxbFSWTO0wcTl2BVh2fEGvgiDCA+S0qVLbALUppHHunENnIq7eNrFaJS4BsRi5xdPG9kJvW7Q==
X-Received: by 2002:a37:ad0f:: with SMTP id f15mr6893144qkm.68.1565164582588;
        Wed, 07 Aug 2019 00:56:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:228c:: with SMTP id f12ls572937qta.9.gmail; Wed, 07 Aug
 2019 00:56:22 -0700 (PDT)
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr6722657qte.260.1565164582160;
        Wed, 07 Aug 2019 00:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164582; cv=none;
        d=google.com; s=arc-20160816;
        b=jULaMp4xATUispMv/4aIxi9LreFhNa0ixcVbG5itwSLi6UQQyqb8JfxFfJlqTpEO+R
         CM6K2R8741XwwCrtrfwCmmE94cfC5Rr49mulOkBpOnVRHswCp+my0Zo4WBztx7j1Orkz
         SUAweRhKIp17Lvwoo3HHNrG7rPsmevhbRIF3vnydIzUpSCpYgx7/23XCiI+gNK5VprPx
         5fKXLRqIIeTC3KlRSgJ/jPyepnQXBGU4FEtNenY0k6IgiEOsGid5UfihqrBXoMByyKZF
         CPJz0hMTHxu/SW64d9e7mnWJyD3uM8TKqA9ON0U5KC3JdX55BeQME1qFeYv5whPFxOvZ
         r/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=92M/vwKRfz09ckpYq2qyhxg0dG4W2udVgPf6j4L614Q=;
        b=Dtr/3P8SzC75TBOnwDYAVA8JtPlmMivc3U4daBdbHaruNytXgz/QwXF48VjUn84zBk
         XwV5CUziJIZK3P2sfy4Ej239MQkI/NTFxa2OTM9NjYcHi9lt3GTAGQVD3h3WOqLBD+o4
         Nxox/TKj1JWWD+g2dRT+tLoUjWEVSGcpjMeO0r2hPBym0WuKn23NozlptJYVBaPMlkuD
         o9OdTBklvV9zVvhOvGwo47tWODJbQilLGuokdP/ZgrkCwgw98vxfsnouTaz+94+sbAkg
         Euux0mnZ6EHvPvec9faR99c6wD1O19dKYTBZOvwpnE/CTww3Gn6YyRLfmsixGDDyIFyC
         2PUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n8UGU4UW;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id c23si3237871qkl.5.2019.08.07.00.56.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uLwY076575;
	Wed, 7 Aug 2019 02:56:21 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uLZ6087073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:21 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:21 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmV128703;
	Wed, 7 Aug 2019 02:56:19 -0500
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
Subject: [PATCH v5 3/6] core: Add stream id list in the cell config
Date: Wed, 7 Aug 2019 13:25:27 +0530
Message-ID: <20190807075530.30444-4-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=n8UGU4UW;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
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

When ARM IOMMU drivers are supported, it will setup the IO address
translation tables unique for each DMA context in the system.

A typical DMA context is identified by an integer called stream id.
To setup the correct IOMMU mapping, hypervisor should know
list of all the streamIDs that should be setup in the IOMMU.

Add an array of stream IDs in the cell config, bump up the config revision.
Change the python struct unpacking logic in the tools to reflect
revised config structure.

While at it, tell struct.calcsize to not use padding for size calculation.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[p-yadav1@ti.com: Make the stream_ids array resizeable]
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/iommu.h |  5 +++++
 include/jailhouse/cell-config.h                | 15 +++++++++++++--
 tools/jailhouse-cell-linux                     |  5 +++--
 tools/jailhouse-hardware-check                 |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index 67ac34eb..9f3e8790 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -18,6 +18,11 @@
 #include <jailhouse/config.h>
 #include <jailhouse/cell-config.h>
 
+#define for_each_stream_id(sid, config, counter)			       \
+	for ((sid) = (jailhouse_cell_stream_ids(config)[0]), (counter) = 0;    \
+	     (counter) < (config)->num_stream_ids;			       \
+	     (sid) = (jailhouse_cell_stream_ids(config)[++(counter)]))
+
 unsigned int iommu_count_units(void);
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index fc0617d3..d43800fb 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update HEADER_REVISION in tools.
  */
-#define JAILHOUSE_CONFIG_REVISION	11
+#define JAILHOUSE_CONFIG_REVISION	12
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -74,6 +74,8 @@
 
 #define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
 
+#define JAILHOUSE_INVALID_STREAMID			(~0)
+
 /**
  * The jailhouse cell configuration.
  *
@@ -95,6 +97,7 @@ struct jailhouse_cell_desc {
 	__u32 num_pio_regions;
 	__u32 num_pci_devices;
 	__u32 num_pci_caps;
+	__u32 num_stream_ids;
 
 	__u32 vpci_irq_base;
 
@@ -286,7 +289,8 @@ jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
 		cell->num_pio_regions * sizeof(struct jailhouse_pio) +
 		cell->num_pci_devices * sizeof(struct jailhouse_pci_device) +
-		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability);
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability) +
+		cell->num_stream_ids * sizeof(__u32);
 }
 
 static inline __u32
@@ -350,4 +354,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
 		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
 }
 
+static inline const __u32 *
+jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
+{
+	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
+		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
+}
+
 #endif /* !_JAILHOUSE_CELL_CONFIG_H */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index ee2c52fd..4863e17f 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -564,8 +564,8 @@ class Irqchip:
 
 
 class Config:
-    _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 11
+    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+    _HEADER_REVISION = 12
 
     def __init__(self, config_file):
         self.data = config_file.read()
@@ -581,6 +581,7 @@ class Config:
          self.num_pio_regions,
          self.num_pci_devices,
          self.num_pci_caps,
+         self.num_stream_ids,
          self.vpci_irq_base,
          self.cpu_reset_address) = \
             struct.unpack_from(Config._HEADER_FORMAT, self.data)
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index afd1139b..37e02b7d 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -136,7 +136,7 @@ class Sysconfig:
     X86_MAX_IOMMU_UNITS = 8
     X86_IOMMU_SIZE = 20
 
-    HEADER_REVISION = 11
+    HEADER_REVISION = 12
     HEADER_FORMAT = '6sH'
 
     def __init__(self, path):
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-4-lokeshvutla%40ti.com.
