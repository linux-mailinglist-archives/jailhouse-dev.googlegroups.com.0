Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOUEZXYAKGQEN7GSJ3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E61131380
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id dd24sf28833710edb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320442; cv=pass;
        d=google.com; s=arc-20160816;
        b=EGs/rBd0/TjlMHmG1uZOk/sThRKhCSb58zxmsip8sh9i3cPelqBjDWYsgMAvsMzsCx
         bDDuIUBb3jret9rA64IWTnCgT5acdJTD3sDO7tdHcLRPUJTtqiYS1KuSrllqHY962UW6
         FZxOAqkzLTfozyR8GYFD7K6FAe6VU203OY/G51N9gU0lW6Blfnu6+APCPFgvqAARMiZW
         JG0d2g1PJ2iPSQhqS7o7fHDsC7MB7wElBE0y1063FhZCZZQouCYgROJOQhtW27LOLiRz
         VK78yrq7FrOI3MkQpU+dnkK4UM0/NCCv8JINBftfxiUPFbb60KI6BTVYa5rfaRiTE37m
         2khg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=07D3BQ5iAW6/PBkpXy412kFrv5YJoo6Pcz690v2YRc8=;
        b=nSm39gV2SMJYE6pzxAAeLjkZPJcMosGEFF7c33YeuT/zyWWffkGv2650FNhWVjh71g
         jhGaoSG+UAUFrmpX5uF80F44ilNaN3xCTXuEwkhXd/HIgVOXT4jBibcZ5y0aRio74gwG
         uE7pKIo6a1XYTdX/qtHY5ZSQaKrDoiEbx19LOvBbDm9NIgrgA2kX/+qG7wTR6qTonRT8
         T4nytklYnYeCurErnXAoc0RqK8hfl/J92s3br1NClLz3OptfMxxROLSxf8bzmcUEEazK
         kDzrK5SOl09ROV2k2uTlu/1ccc3tHPHkZXIsvtOVGnyEeA2qHf51cYYifdWLBRkEN/Ua
         NMZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=07D3BQ5iAW6/PBkpXy412kFrv5YJoo6Pcz690v2YRc8=;
        b=Hy1eDicQXanZSfkce8/pNJOg6kUfUIBb/O4Bs3emFK8htKy8AczdFSEDV8a93vuFGf
         8Z0URTg3zyq3ySSIvzkGdCFAeunLauvpN2F69GRDtFmhvk1Q+Gr/vWwrgWh8MXD6g/WF
         gOiKOn24fOMxRTGFaB8Dk2ChurAXhGd6In2071lz3hm+VPf0xorl1N7Z4z3ufsGWeywR
         WOgY8rYCdyHj7UKkCtICBhuX+RSUzdKZy5n61Ll99i/yzJbYYO46V3lfOermXq7i2k93
         1ohbA16J+Y5kOm+jfxzTPJEZ8+N8bLhV+OcYsnJZJ2cVrLc0EwIwLltLEerOuew3IJdy
         V7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=07D3BQ5iAW6/PBkpXy412kFrv5YJoo6Pcz690v2YRc8=;
        b=YaU30r5anoJfAlsJCMaOY1BNAnniyyXATPfg6aciyae5WQXGjIqFo29VJlAy9k8Sku
         S88KOFBoQMTIbaxsrs7Iu1dneESdxSOIJhphoBYV08q7HBzg8EC+7lPZz+jyTxxf6oy6
         jwS8QwNF0wTNBNrSb2wQJe0rPdPs/4xaMAdDGjMljtvQ2RUWfGhO+qydBAqECQTyfGJE
         eooHDtupef79YrX1ktD5w0PWoeGLx88rLWE9/lR6Vcj6lpTKignOegNorkHRuXksjAIP
         vvMZGqZSXSM8fhmrj/E9inunfpPcnCCcxiHNQFbrckkjZgar5GZFRotS9crQuonhFTrz
         WJxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUcp7VcYiYXk4SiklsLzuH0JbIEU6slRMWWyBAdI1MCJIJna8IL
	r2yCzk/OW1uCYA2bOCypv50=
X-Google-Smtp-Source: APXvYqzYnDeuaF41NJrTaC1VetaSQaH1nT5VSNn7WetDZMj7C6iWhRxjWBcAxpCMj7YWBKN3m63H2g==
X-Received: by 2002:a17:906:6014:: with SMTP id o20mr86808486ejj.100.1578320442315;
        Mon, 06 Jan 2020 06:20:42 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cd1b:: with SMTP id oz27ls15560517ejb.4.gmail; Mon,
 06 Jan 2020 06:20:41 -0800 (PST)
X-Received: by 2002:a17:906:20c5:: with SMTP id c5mr110601815ejc.330.1578320441550;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320441; cv=none;
        d=google.com; s=arc-20160816;
        b=cARkKkf55k9RdvxEAskf/oPYyrFFKYe71tC/KjK+wljyfUeEF1JssKlvs8Ay2fYgFE
         zsrJ/XFYkHPA8sPPRTvdhg5vMoRmJpu1JJ8zBwFYkv8W7lI5UE/64C6o1+x4QHBIKiWZ
         2QVupZdGKQaFfvso5g2Pe/SY0nR/mYE6C2xtM4fmLmW+afCeaw0Il4+ipGZEXeCB1Fvg
         7AFAcnSlDFGKrs6660fhKvkrk0JTXo6Yj8RniqWhM9Ox6HWFaNiD2jKrayJ5a2hT7PWE
         glMMXVvoZCGdkjKwYEmDdGOKKqbJf3GtsBkytIiODvP/7HFC5EYsHVPMYQmT9RzpN2R7
         TTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=De8T+Ard2L8gTZKUkw97UMc1cVZYtJALI0u6BlnEDH4=;
        b=YmXJEo7Gt5luVYbjNg+NqDiuXFjBnKu7cTVt1DqjVitpkFbXBEJq3eGRFYTyzriGwA
         r52Wge1N49AjHoV1Xl2LPP9nS2BGmlt2xVIZgblhwsXXFy1SdOoCtertK5TGYpr7fgSw
         HG3puXYh7jj2jLnBlihOAsnKsnNyvwTEeh3nZ59LrowoG22HKQII1v00VME+Kxoqe9Ke
         OfxjyQLgUAQFXJCOndhgnHZjlV8TnZWdUpDUbkfbFszrUIWpgoHkm/WV4opKpMNSMRix
         IvCwsGe2NaNuIzg67NemcyPhF1e57QyRdVUmB2uUZmojs12aBrBill8NuJ4sF6cTntgH
         SToQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id ba12si2243059edb.3.2020.01.06.06.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKfDY016678
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:41 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjQ008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:41 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 18/19] configs: arm: Add ivshmem-demo support for orangepi0
Date: Mon,  6 Jan 2020 15:20:34 +0100
Message-Id: <c316cc753968526f1955a8958e564a8b7fa5c72d.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/orangepi0-inmate-demo.c | 68 +++++++++++++++++++++++++++++++++++--
 configs/arm/orangepi0-linux-demo.c  | 57 +++++++++++++++++++++++++++----
 configs/arm/orangepi0.c             | 48 +++++++++++++++++++++++---
 3 files changed, 161 insertions(+), 12 deletions(-)

diff --git a/configs/arm/orangepi0-inmate-demo.c b/configs/arm/orangepi0-inmate-demo.c
index 5b77f1ba..bcbf4823 100644
--- a/configs/arm/orangepi0-inmate-demo.c
+++ b/configs/arm/orangepi0-inmate-demo.c
@@ -19,7 +19,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -29,6 +31,10 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 125,
 
 		.console = {
 			.address = 0x01c28000,
@@ -43,6 +49,39 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x4f6f0000,
+			.virt_start = 0x4f6f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6f1000,
+			.virt_start = 0x4f6f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fa000,
+			.virt_start = 0x4f6fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fc000,
+			.virt_start = 0x4f6fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fe000,
+			.virt_start = 0x4f6fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* GPIO: port A */ {
 			.phys_start = 0x01c20800,
 			.virt_start = 0x01c20800,
@@ -58,7 +97,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x4f6f0000,
+			.phys_start = 0x4f600000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -71,4 +110,29 @@ struct {
 				JAILHOUSE_MEM_COMM_REGION,
 		},
 	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x01c81000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				1 << (157-128),
+			},
+		},
+	},
+
+	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index ee6e51b3..af0dd1a6 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -19,9 +19,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -50,6 +50,39 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x4f6f0000,
+			.virt_start = 0x4f6f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6f1000,
+			.virt_start = 0x4f6f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fa000,
+			.virt_start = 0x4f6fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fc000,
+			.virt_start = 0x4f6fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x4f6fe000,
+			.virt_start = 0x4f6fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* IVSHMEM shared memory region */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
 		/* UART 0-3 */ {
@@ -60,7 +93,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x4f6f0000,
+			.phys_start = 0x4f610000,
 			.virt_start = 0,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -69,7 +102,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x48000000,
 			.virt_start = 0x48000000,
-			.size = 0x76f0000,
+			.size = 0x7600000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
@@ -87,7 +120,10 @@ struct {
 			.address = 0x01c81000,
 			.pin_base = 32,
 			.pin_bitmap = {
-				1 << (32-32), 0, 0, 1 << (155-128),
+				1 << (32-32),
+				0,
+				0,
+				(1 << (155-128)) | (1 << (156-128)),
 			},
 		},
 	},
@@ -95,9 +131,18 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 3f5d026b..90b19b7c 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -18,9 +18,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[17];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -67,6 +67,37 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x4f6f0000,
+			.virt_start = 0x4f6f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x4f6f1000,
+			.virt_start = 0x4f6f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x4f6fa000,
+			.virt_start = 0x4f6fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x4f6fc000,
+			.virt_start = 0x4f6fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x4f6fe000,
+			.virt_start = 0x4f6fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
 		/* IVSHMEM shared memory region */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
 		/* MMIO 1 (permissive) */ {
@@ -121,7 +152,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x40000000,
 			.virt_start = 0x40000000,
-			.size =        0xf700000,
+			.size =        0xf620000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
@@ -140,10 +171,19 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c316cc753968526f1955a8958e564a8b7fa5c72d.1578320435.git.jan.kiszka%40siemens.com.
