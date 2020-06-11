Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBC6TRD3QKGQERZHG25Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 727541F6856
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:37 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id l144sf4404752pfd.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880076; cv=pass;
        d=google.com; s=arc-20160816;
        b=uSptGfaxlGHYoskjS5ScBcTJRZPm4kdn9XP0Dn//XuZ3GUcM7j3MjsH5s0mtQxQU9a
         /G9fGa7Vu73D4h4/IJIncYMssf7FlNfPK2d/+B/bfAmCs6nB/Le982/LzJZQPCBfIm6w
         9PTsBbAG4mCAkQSKfnJq9zLHXLfBOg84mzVyh+0uCfq5QnAmDK6uWfWt3Q28g+x76xdT
         UwXgCdWVChqQ86dQ6VtnBlX81zjRQ2UJBKw1YtOBrvHsn4qNh39xpN2z+cK56Uir+gm1
         eeosYNv5PVxiX3X4UpIpDzYuW+r2HAbCUwehvL+NOXod4PmbavqbnP3SbtY0+jdt2yyH
         StRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ryjo3YHlMe1YdHB13bUN5bibdOacTwNs61wt/Y3rk1w=;
        b=rfJ+sttS3ARSl2lzv8u/aA9VOIcHArQf2Uzx0XZH+Mp4DjRrGjin4ePLOSSKT15ub/
         euLJSGN35TAnm9P9QIM5aktmDByo+CbmqerQ5b2qobQekZqnNgbGwMcoVw725wvfsyIh
         YHFKQH2PLT2TkVxWIMKKmvTY/t59syrG0zzVOZHu10q0r1Fywkf4ZVW//qvVFrZgfVwQ
         kzVRRI2tet+fphH5z8oWOl5UyucnSx4TABUpYpm0Xy6wZPSOWFCn08A//8wH2blRNvu7
         0uAHdlMl51L+pmX9xF0uiIc8uj/XnfQZ9L33SKAe7HRWm/v8RPMp24rIgflQyDpDd0wS
         hB1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="vlZ3Y/e5";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ryjo3YHlMe1YdHB13bUN5bibdOacTwNs61wt/Y3rk1w=;
        b=gkYj/zMMKG4cCyubAkWcXxlX5NOgDXEuyNQyVACG0V5XiOHE7Ki7ziuECFDOgsJ8JH
         D+19b/xrx0cyVRQscpQIZDFW1v/ZjTw9Er5hXkUKb2RW/lXAR3YWcPSQ93tfU4cVZOg/
         t0INZ3+OFFarp5kWYGny5YzOvXF9BwQc+jH9smfxK/Qja8L4qxeIgkqDvu8P+rOsKnNT
         J4lh+RwOl/aCrETl2/pZCccpJgqunmFp8kEV3geof74kykRm5TQyaK8svEMnEXuk02DZ
         c8C3jO7gWQ7RscxFJnEOY5r2+PMeHngkMhUoKFJgaZA1PCjPlGA93+L721r0L8bPy+FI
         7DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ryjo3YHlMe1YdHB13bUN5bibdOacTwNs61wt/Y3rk1w=;
        b=TgvjctVf+fCH/wDosFB5mrsLzfpw34fqIiY0/fiCEMOMD0r1ACzfzYufvu1bwz1fhu
         3EiwqAcKnQWA7RWd0Arg3/UZoZ6C9axnsc0SCLVFdDMAODnodtPsMrib+aUCmh8/Cqfz
         Sa4lqbVFM/f4v68pwzmy1lCUJrGl7pg1ZO1EZYpfOAApBlvXvRFgZXxQQqxT7e74VwOe
         /GpnrBr0GLT0kZNSAcvOwb3Pc8JUEOfj9tnFN2sdwXzPSb3TzAHDf1EpzIs5Fgh2+u1q
         GhaGdd63aaXe90jJP/JhKlHceI0mBXHaj/RkG2fAMcdhNujZqY+aUy2AWxzjS6xHGC7Y
         D8aQ==
X-Gm-Message-State: AOAM533zNN0ihD/4K1pUHAv0ncf/YTpQdtAFfPMU+wLmgarvNwTTFiR0
	DpnegS2HPoOQ6mr3Ewk4WJ0=
X-Google-Smtp-Source: ABdhPJyh93AIe5XOBNEWR7Fq0JiZih09feHvL33iCYjnRnKRNQtXAE7651q2QVceRGTLvXiEJpnwsg==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr3827546plo.32.1591880076221;
        Thu, 11 Jun 2020 05:54:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:147:: with SMTP id 65ls821156plb.9.gmail; Thu, 11
 Jun 2020 05:54:35 -0700 (PDT)
X-Received: by 2002:a17:90a:43c5:: with SMTP id r63mr7492517pjg.203.1591880075211;
        Thu, 11 Jun 2020 05:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880075; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpxTHklxlxbIThIpEtOGSXdPg228BU/yqTbsxFQKePEAe9dnPAbFP2bQjPfQyHgMqG
         /C+Fmn65npEnY6ifnJQqXr1SJ/v8ntWangPEp+D9S6dF9QYrj5u4yyXhPo98plp/0zqK
         m5Si9/V/Wc+dfdBzLehs384f5LvXJn55BAv9KLqDCRGUf6I9pAE5kGVAa5Ivt+LzOSq8
         5aWFLBSyZbmCSGDrgyWlzuv/3pEI2mZYKRboDq+J9m5at8Yhl+RC/h4j2jo9hBvlnuWT
         19mldmCWBCiewQYUCnbX/8/uxT5TiaEJXFnvonZ15ox/rsbNWCb11LzfTYslAhpfxSkM
         jf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V05CZ5lTM4zOtqx7e2JohGtaQm5dUejWrE6+LL7CAo0=;
        b=AwQnbGqo+z5XhtMcVgGaO/dlLsFjb+hJK3taoyw7nccqTz21aCQMI7mIppkYhrVdRV
         l/BvTZ1+Z653AaW/AsG8wZR2YCBk4hVYel7NIpDnwLWULFz2+0Defs4sMWY/qlPh7H93
         aD4kHE1UTG6UBk0KVWB1YwNDlFpaR/8q+Q3JzoX4IaD8jYEodBsm1Pw9DXPAFraMa8y+
         CGZ/E1Z2jF3G2gmFVi204uYlIOxiWvKKrbIs0zVM9UgboNfn1IklhIbctgiwH3a1F8Kq
         clZc09DpkxXBvfq9I2Jj91lO1dRvTfV1jpKhEmBqP9lo6wDP6mLunWR3lV9+454VlryJ
         fRMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="vlZ3Y/e5";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id t72si233906pfc.5.2020.06.11.05.54.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsYYC081395;
	Thu, 11 Jun 2020 07:54:34 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsYWP119788;
	Thu, 11 Jun 2020 07:54:34 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:34 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2i062138;
	Thu, 11 Jun 2020 07:54:32 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 5/9] configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
Date: Thu, 11 Jun 2020 18:24:19 +0530
Message-ID: <20200611125423.16770-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="vlZ3Y/e5";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

Add a virtual PCI device with IVSHMEM type (id = 1)
Create IVSHMEM regions for 2 peer communication
Enable the vpci_irq for doorbell interrupt

This allows to run the ivshmem-demo baremetal inmate
inside this cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c | 64 ++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 7440a258..39c6c414 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -20,7 +20,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -30,8 +32,9 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
+		.num_irqchips = 1,
+		.num_pci_devices = 1,
+		.vpci_irq_base = 195 -32,
 
 		.console = {
 			.address = 0x02810000,
@@ -48,6 +51,33 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
 		/* main_uart1 */ {
 			.phys_start = 0x02810000,
 			.virt_start = 0x02810000,
@@ -68,5 +98,31 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/*
+			 * virtual PCI SPI_163		=> idx 1 bit [3]
+			 */
+			.pin_bitmap = {
+				0x00000000, 0x00000008, 0x00000000, 0x00000000,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 (demo) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-6-nikhil.nd%40ti.com.
