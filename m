Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBCOTRD3QKGQELJY7NZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ABD1F6855
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:35 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id n65sf2123629pfn.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880074; cv=pass;
        d=google.com; s=arc-20160816;
        b=bQ5qXTYYqw5Nh43SiJJFCbPbVJzu/kG1YbCRf3DgcbStz5tZ+3CJC7ODAf+GKmG/Ui
         CDT8A3nivMO2O9oA9DWG5R0E6bqVbmkRJszcsaOgx5ncmLWI1Zz0DyQ0gW4lftUrPNIz
         jwwtI00nvP1McJ3+uh2XlVmDNjBGmzAyLF0OMACG/mTr7Nt1xIYkHoe2D1+QxbBDkO3y
         gqBhAqBRf66vBdLjOZD0wV1omuXBARQOt+2vWZ10oZ01C4g8zT1KxGB+j5iRZ8HnnaAK
         i9WtuE+kaj30qmblQJNPgBTiwLyBFDwMmvSDesYDtjENOD2vR+BQaxYpEEos5Ch9D9TV
         x1Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BY9vjp7q/jVmxRjOBKnQ15Sjp5nknWxUYxhvA2QUJ3M=;
        b=L9E6Rlk9z4xu6RsCcjRALmKHBb6Hyqdlvd9J+/OGX8vvHkuPA68U9hv4TY3NxHMW31
         0RolSYAX+16CSW4OOp7EifKEl25prKkTiN74wrnuOfRXHvhyMaEdLGYIj4GwI0efZsuw
         6TRNRcMo3UohTfD3I5XlzELyzG2l2TNLfYeGENWX344ZxJFBRgIrkrBwbuFTp3C89jYT
         DlHxkZ+8r26kBZqnMrbIMahpltLk764zF32PvYBPzdJbRicc6i62WVtnZZFY2M/4JVU2
         /rY/IUNO5BwKuKJv3Hk0DpPunrWKVy99vtRbP34f9B3bZkDvwxB9RhXrwoo/bpLCj/DU
         4etQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U043QHsO;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BY9vjp7q/jVmxRjOBKnQ15Sjp5nknWxUYxhvA2QUJ3M=;
        b=cEyfJo+LYHJzox/UkVW9fqGO6Bgj39QhyT0fWJHSv397FHaNfnnTH1zVqsJIkJwFAw
         ujHzbll2aompDV1BqCfhPy9ule+Ps6c8yDLPKioUIXVcEtHugFUgOpfIHuhJUvUu5Fs9
         qXNGfqXhe1V0ode6idfrpM8P82o4+4/yu75vSlDLk+vwBJIRu+7g3b7IN74R1LwEm9Lx
         JrorxLSv9TLUuQ9zbI26UE4+7tYhjxx+qlxz/rmw4C7W9t1IV0Zdzn53sj17HARlay3J
         Ns818B8iB6WFp1UsYRGYhq0EUliZBVWSCw3ORUz+e9kfNxOO1Is1KJepdiSTbXs8OnNW
         AKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BY9vjp7q/jVmxRjOBKnQ15Sjp5nknWxUYxhvA2QUJ3M=;
        b=RTTdHx9Ag/YcvJbSMkE/iopBfG+go/ro3+RbLnCGG0P9QsAfGA7Hazwtztj2SDiPc5
         9MBbIEupS329vfOnLeIEBi0zFavypAY8jTuro4KaFYGK+0+Dedu26o09bG03yJ13Deud
         zTl82pYqrlNFEZT43WXgcXnZDzDSCwf4sGlXuPP6sjTSvmEOnox9xUIHLG00H/xCWVn5
         SVgOrK1ZrHvP0VlLmGi1VbUmzq7oHzkr9+3sjp//PVqli8Q3H180y11FIQJd6HGY3PDD
         d0j6ecMpekP+daQwUTd6V390C5ympsiPNRR87dQ82bm9ywo6mAlozPUIfuZPtNTFWtUN
         Ws7w==
X-Gm-Message-State: AOAM531FNoSS8jVVhhqhH4yHm3pgZnSetL0wie+zDZ2ssgqXNQNw3eag
	ysoMzbtb4kn+QZVp3QBnWf4=
X-Google-Smtp-Source: ABdhPJyemCE9iqPNPqTLj0lNs3es9wn6w3MCvUsaiA+Smx2pRc8rSHSALrgXXZlBlKE+yYQODlzKPA==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr7326846plr.64.1591880074030;
        Thu, 11 Jun 2020 05:54:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:f410:: with SMTP id g16ls358541pgi.0.gmail; Thu, 11 Jun
 2020 05:54:33 -0700 (PDT)
X-Received: by 2002:a65:4904:: with SMTP id p4mr7064782pgs.333.1591880073525;
        Thu, 11 Jun 2020 05:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880073; cv=none;
        d=google.com; s=arc-20160816;
        b=z4ApllPAn1IAIZgBuE/JDJZoAm6Apo8wsSHhKpv1cPYFSCtepKleRA3E0oSUqm7M/i
         lLhKlhIcF5/GysvjYiGxuBo0VHlG6EKO2fKii4NC4ccKKMYLw/OUMUbDzqccPpD6TcuW
         9IvJmZ1Cpw/uM0NC8FRxcW6qDJkP+Vgy29XYpeFV8bJqhFw3+IjhOBn6SK3HRHPqcbY2
         mgLu8rJXs+N0ASKHicxCuV6G50m8xKYElgMYn8A1ij2cQTME2Pu49R7dpERgCt6if81M
         0HjMjAodM4/5+5f+Q6HYs2Ctl3WEXMIkgDjZ34KHvqp9mJmVQA7g1oAYUZ9V56VfPzW5
         X6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DSbgODr5L9QgY5AU47SS8FtYmmCen8m2yUYmtk7bzc4=;
        b=CLpMgk++T3Vl+U/BFXYNdn8IAHCcVkyOAOXkxrUG1xhtBce5eKiJ/Lfx74C3DkI7vW
         cV2RXNUSm5i2NsT/UvpqsqqYK2uESmqLLLfTlF3FahTE/V0EOdXm+0wbXolDvfO89miT
         Rnzsvxg1aI7e1BcWGuU6nr1NwssWlI+eInE8Ic/Ftn+gfVFcoCfBYTtYGaomu5fFmkv+
         2SG44Re3+lgz/yN+qAc+d8fYcTNrHQLP2gQ1cpjgKF+GT125IRFye/LU7K58L8W1hkww
         elB4h8nTEel+x2btG5265Fh+xOQChE0clU+u3gT0GYfzY0Gs153MRBDqdLj28NqAYgPw
         J3sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U043QHsO;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id j3si210896pjy.1.2020.06.11.05.54.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsWPw101796;
	Thu, 11 Jun 2020 07:54:32 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsWCM104597
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:32 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:32 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2h062138;
	Thu, 11 Jun 2020 07:54:31 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
Date: Thu, 11 Jun 2020 18:24:18 +0530
Message-ID: <20200611125423.16770-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=U043QHsO;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-5-nikhil.nd%40ti.com.
