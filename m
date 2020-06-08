Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBONM7D3AKGQE4BFNVOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE641F16DF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:06 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id m5sf6319737otp.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612986; cv=pass;
        d=google.com; s=arc-20160816;
        b=BIfqJDOsFOQRHCQ4vyc8kfgoM+tHJljaGZ1QnqIBNk4Rxcz3U+dFhTB00ycANcEB/y
         VSYOy6vanBp6sai8Z8zx27eoexd4QLpt4TcJvAplCMPP3zUKrVIYrpaYT+XkSokXDxR7
         toPi1hutdH09X5dPOgp6Ddi9mS3mgwegeiq+XWPS++L51Loak78utbmXL5m7nA9m1KMF
         HdMVLrFPZQ1fKesDvlcO7mf5jPMo2htNQBG4NHEhwhp2XCc+Yutdzu3TMJMuFZv86pq6
         bIibqKYvDBXWuVyhKkMuTD+3l60j5QXaciBENCCdDTl2ASnT70Q/pLSFYQO4hS2rvtBq
         +YJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4q9DhuS0Ctb5JtWJ59PiU7PvpczOirHwW0NNwN+iqHE=;
        b=x5VtzCufs3iuKYeeU0NbxF4t1dAmP3g90/Vvkv+RcpvgbqGwwOzg/LW7LMucYCXErP
         EYbo1fKPI2e6ShAcEaapv3O8lV4l2wmtNCxc2OyLL24Cokp+MhBS9xZYyAtfjs3mO4Yh
         2+29fj4R4YaVfP0UN4YzRtmF4beBfYt/dN6PI9wSOOSjduQVkuUHEOjzsF2ZI78jrMlS
         wCLBe24+TXRGJXTx/iFa6akkTBGGyIrmDATf1LSP1sDlYTMPaxS5WJXt5rV7rWYLBVBv
         1IxFxCrJmriyvcLgskipQy2U3aQyOVYPmqiwSMrm6vzRflLROKc14vgWjz8k+srYLgHX
         0M+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bt5FY6mN;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4q9DhuS0Ctb5JtWJ59PiU7PvpczOirHwW0NNwN+iqHE=;
        b=mGhf7s0esBRBpLByyeyWs/CXLeC1goGqZdcJRp7GHQFSNi7vJYUdtRCGy0qOiYXIi9
         difOFIOnnYIerNWi91VwfD5C6bksLB+Usnk6B/dLtsD/Cygg6PjxAJdpOJ9G4b34oCsZ
         pL4DVz7SHJhKPL0G98RfCZJQaoHjm1xC4L5y3YmKzjMiIl0I3YbFEiJ24wLK2dgTkHrL
         u24TX0WBdxjzQXzvzyD9ow+9ffJ0D5WAGv2gT+lJeiu+uwDAZmyDx2Z01yxEZlff+L/v
         x4hOwajdDqNZYoBH0dJ2g7MjhAEiyMOeKi9PtY4Ud8iLDelhz0VaA4TMjMICnjtwCi2Z
         eGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4q9DhuS0Ctb5JtWJ59PiU7PvpczOirHwW0NNwN+iqHE=;
        b=HVR3+u2M/8mGMMaNZATHPeKkpRoZpvJwmVfwE9h/RcjFYqn1OJJiH6U3rT8yHi81eV
         Tq2e0N4N4UQ9neXpvftKiOiig5oVUFXx82Azfqzch5K+7s0TcisS9VVQ5HVpYt16gGwm
         NY5qXhm+aDqK7QYkEGg0raCrFrmNO7gVbbiCkUzvsrap0XNZfHQ3Mxxg1Baw8fKKbFeG
         SHvIK2oirgkhjzYqGTDywR7MUz48VOc8IVGRr2VTAdSfz3IPGhxpdm3d35xDZbKPQASz
         JxBfHSbMQ/HBPVh/2tTsNC6LCCTQMW4r6vXlTE4LVyMN3X34bnW6VtOh2IErtAfTc9SP
         Jb1A==
X-Gm-Message-State: AOAM5328XK1yTPokF6soxkCoPRa7QKKtclH6ELPVtP7F4zua1FLb5vb0
	ddEn7GC75iRSM4W9sQtBmiM=
X-Google-Smtp-Source: ABdhPJw0SL0EBQ9zkxPeKTbGyJ6BeQT1sEC6NtCnAjcle0veYygV0I9vIzQfCxVQmhPcpyyea7onjw==
X-Received: by 2002:a9d:6645:: with SMTP id q5mr16384180otm.211.1591612985858;
        Mon, 08 Jun 2020 03:43:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:cf10:: with SMTP id f16ls3033012oig.10.gmail; Mon, 08
 Jun 2020 03:43:05 -0700 (PDT)
X-Received: by 2002:aca:cf4d:: with SMTP id f74mr10401118oig.9.1591612985531;
        Mon, 08 Jun 2020 03:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612985; cv=none;
        d=google.com; s=arc-20160816;
        b=foLp7BxJumKUK4/J1kNr057/Kpvum3694z2H6qqt0k9zlO/X2znBhlVfB9L7+gi8ZW
         knmfr4hvUDPRkxsaoTczjI6IlDIgz2E/LnLqrfruKZavEhqNov7S3PZ4rnLeMCpEMczW
         qn9c+ObLEEQYnkEPHVuJwnTdUr8gH185UIk90wtZe2gEwiPjFz57Gs2OjVex6kmJCTLK
         YZnXFIEDIpkv7B1mEWlFY6YL6h/rE92xMqfbgCXxuhhQPHsLj4wjWY5iJGcj0rfeVRbN
         msM1eExF+BK5+kkt0ymCSF/Vh/fa2+KHa4JSSinJ15uV1aPwlqZGP+5bNuw0H8xM1mLi
         OZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DSbgODr5L9QgY5AU47SS8FtYmmCen8m2yUYmtk7bzc4=;
        b=gLBIPrmO9+K2flnkZeqGtIGj4V9GDdKKgzMBUOqK74/zZzwkTepx7hDdL7JqWeWSur
         r7zF0bH/8JMyUSHaXINR5HEfe8X0v6WHj+NwRvx0gPQAQSZ66MRNHK8vzLV6jvALRksI
         lKfZLhp7sxDUxX80bPFhoF6Uljm1yvghSn+T6jttYNSg+ExJ6U2hyawZuuyBNUNOsFnb
         wqvw3HjBFzzEybNcsq9pM5QD2vOlQauao6Tv561pRZgVcgJ6D+9Y/xobNdE8lzT/ULl5
         iMpa/Yg5Pr4imHm0vKDAzK4NK9vFJ4ohYH0kZbztuSgleIHbSegC6DulpZBwTtKwhnVf
         j2cA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bt5FY6mN;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id d25si549555ooa.1.2020.06.08.03.43.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah5Oj126041;
	Mon, 8 Jun 2020 05:43:05 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah5OB008984
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:04 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh5012229;
	Mon, 8 Jun 2020 05:43:03 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
Date: Mon, 8 Jun 2020 16:12:50 +0530
Message-ID: <20200608104255.18358-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=bt5FY6mN;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

Add a new IVSHMEM PCIe virtual device for a 2 peer
IVSHMEM demo communication.
 (0 = root cell, 1 = baremetal / linux-demo)
Also add the corresponding memory regions for state and output
aligned at 64k boundary.

Update the bdf numbers for consistency across all platforms.
Assign domain = 4 since the platform already has 4 physical
controllers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
 configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
 2 files changed, 89 insertions(+), 16 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index cda1614a..05517751 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,9 +24,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[4];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 	__u32 stream_ids[2];
 } __attribute__((packed)) config = {
 	.cell = {
@@ -56,8 +56,35 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
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
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 1),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
@@ -210,13 +237,24 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:01.0 */ {
+		/* 00:00.0 (demo) */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 3ac0b57e..41f4c456 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -19,9 +19,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[36];
+	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[6];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 	__u32 stream_ids[30];
 } __attribute__((packed)) config = {
 	.header = {
@@ -44,7 +44,7 @@ struct {
 			.pci_mmconfig_base = 0x76000000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 3,
+			.pci_domain = 4,
 			.iommu_units= {
 				{
 					.type = JAILHOUSE_IOMMU_SMMUV3,
@@ -97,8 +97,33 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 0),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
@@ -374,14 +399,24 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0003:00:01.0 */ {
+		/* 00:00.0 (demo) */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 3,
-			.bdf = 1 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-5-nikhil.nd%40ti.com.
