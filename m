Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNMEZXYAKGQEK5SMBVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F513136E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:38 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id z10sf22960354wrt.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320437; cv=pass;
        d=google.com; s=arc-20160816;
        b=EgcdvXzi5pVsD3EiaHk3QmDZ3znh3nEOfND8DBQ6JKon52GL6mt2Q19/Dz3nm3XaeC
         5pCvzUEJh2fqToo4n8kt/AT0tCapc2WjPuyaTJNcoJSKkESr/tdxL+zjAbxv3/uD0JHp
         luQzh50b4ezRz5u9cnh5iE3tCsV15Q/IkXTi1sU/8rbeFV3F9YX0sn9hXp+O66Vq7Q7S
         uZR3Y/vCEwYJbIqQ2bQuoKiSmNfm5Iz3m1WMKkT4BhgYMxxgjSnG3VXbV3uMvfE8TMm2
         UvemcWiyUHialbb106ZdnzWF3Yfs9h6+egU/zJCXaHdN2kQwGQM6QXEHBNIM17+Jawe8
         FZYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=vL8RK72y/Gy0oHqaC9OoKlPYBmhBH4lJgcD95TmgVaQ=;
        b=IxHB6M4HFT19Q0xPADgjHx3XSrn745GE4Ah1zcfr5PIurZdZNkYatM/zpwFxlQiJg2
         /JHorA+0YQ6MjfoYuRy62sq1GYYptqGwoUk9iXaNfP2n53NCfzW2Ac/Zopn1X1W6kc6c
         dvbLK/2u8ctfUHcMRTIO3vqecclOkEZfj4KnwGRFWemBaHxEJylq+H2xvQo3d3lRcmQB
         +llllFl69VCG6Ddrqmr7UU/9gGTEfkLK25NRa5R+CQTUt22V9FEEYsJq+iB+xz3UFtX3
         6nkDkrqysrF+3/2qtbhHffEmRmEy+4vWa58h3viN9zaS3+PDUr8cZg5du9FH1eQBBIYf
         C5tA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vL8RK72y/Gy0oHqaC9OoKlPYBmhBH4lJgcD95TmgVaQ=;
        b=gMbwMWPsYmH2cB/jKerG2AapCmNx9ZHTBBxc+5ttew018mayxV0/OuKEZH5YfoWnR6
         YGKhOs5FMyiusFWmLTFysdblIXWutG6Qx+SPN6ldr9eyoLtujy9wHxDmErRV7XDbLqAt
         CPLa/NDVC/rNu+f/WMXEkf+gx9gkTs2UDiwnTAh6ra3t9HNLYKpuMzI88ueDkwNlIHBe
         6Q9VXOyCCeraNu0qnZBaapuZ5ZMviTUct2hhNnZ4I7zt4aFZpiISXBy8KPxEhotf0vsS
         +fRg/Jo/U+IR8qp5jhUAP8bONul+uXCYfiBkfWeq5HXR8L9MGJnzoJvF/RdRILo73ZJX
         oShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vL8RK72y/Gy0oHqaC9OoKlPYBmhBH4lJgcD95TmgVaQ=;
        b=U0UyvggU1XiLYFEKCAdiwika4ZPIUjixxjT829uE804TD4qVAHh/pEy1yH3CmmAsYk
         YNKDIqPtdV/JhiRztFT+wjEKtspkDKKWiks+jJWVsP6AndSblt/kl8yfdw7OC4xL2XWw
         Bj6+CqTmycU+93vqjMKWrJhqRZjicWJYlhV2B2XXZFTZHTiPVpKSGYmlIhLCgXYQp/un
         aVZMs6ZgmygKWjbpDKbmxHSOGwVBYksCaK+CP1N/CI+tNmzkGXilYGyHXJ/+ZjK9s+9q
         bx54ctYH6mbCRpPxC7VoIdkyOByzpBlII1HlG8yW3SSVnGZfxtsq3qKCOgc1AblbSjBZ
         LVFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVvMFPlF8F0u6nKYOuuDZVcFoRaEdktfnRLsTdfyfxdwNVqyVYQ
	M2iNw4SG1Gumd0t2klNfX6I=
X-Google-Smtp-Source: APXvYqwlNG5GPgb6M44QDeUydUp2FhFFJ+rculYnt8WfwAj3/j9mQyCdkYHh0YLsrpJkkuw1J+54pg==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr35656754wmc.154.1578320437664;
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9808:: with SMTP id a8ls2397413wme.0.gmail; Mon, 06 Jan
 2020 06:20:37 -0800 (PST)
X-Received: by 2002:a7b:c318:: with SMTP id k24mr35820740wmj.54.1578320436991;
        Mon, 06 Jan 2020 06:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320436; cv=none;
        d=google.com; s=arc-20160816;
        b=zh8JZcf/hku+HAf/1jsFuw+q9a2fLTrZsxTH8X9HMd0Cgp9lmCuPsQn+Ju6SWEWQ6p
         UiFrNYK6op6Dttmxoijhen+bcHtwYiiHodmXC24zCREgzsCKHDtzXSkxxL54slgC5b3D
         D2yI3QtHHjaGClJA1RqaoFL2XBHwxOVcMwZaOn7DZt0j6zYgjDXgnClN7/69TSbC0dk0
         bhVYY8+DR7AxrVnvLQS5/ya5Xltg0GClbF5cvBtzrSoZmGY4kPYgMAlxfjIcuTUXsSf1
         Buf6zVX2M6foW6a5m4vUfh3sWupqe6nrFxQk/IPdGk4e5cORs2JYBmQVugDOxe/FbmuR
         CSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=+CWhzCj/CGVpSuBPZmdjDUGo1lc0mXcW3XMwJcPrbDU=;
        b=SrXtKQtx7HO2GQxRo3B4zH3d1WH9WBXNhh62GAQFvT3FmxFJqd7bAvUmghlQELhbbw
         abA9MyemNjMtfiQR4xDmJDUvE+2AY5p3zqXj7fBxGyBFEeHpj+jFrC6D/RNTO8T/YEDf
         LZuUhewCJwaRl14k+Jq5uYDPVGsF9gL69rd3ibgpyfQpvuGsj2/uezkHb9P54ax59+5b
         jg6ChUADzN0IpC09TemmWLRvmAvJNqlBV30tmuIrymoOXHAANW/+ravT268hoPQ9ef+R
         3ITmnZPy6XZDUzN64EoDi8FrJlyfkHHABgZKuGidDUWg8IIcJDRuUAQMXla5ruEeCpkU
         Cgwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b9si2434565wrw.2.2020.01.06.06.20.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKatB019157
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:36 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZj9008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:36 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/19] configs: x86: Add multi-peer ivshmem demo
Date: Mon,  6 Jan 2020 15:20:17 +0100
Message-Id: <597ffd9b3a6048a531cc9c08f61790f84522bf24.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Add the demo ivshmem device also to the linux-x86-demo and make it
3-peers (root, ivshmem-demo, linux-x86-demo). This allows to test and
demonstrate the new multi-peer feature. For that, we need to move
ivshmem-demo on the 2nd CPU and shrink the RAM of the linux-x86-demo by
2 MB.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/ivshmem-demo.c   | 12 ++++++---
 configs/x86/linux-x86-demo.c | 58 ++++++++++++++++++++++++++++++++++++++------
 configs/x86/qemu-x86.c       | 10 ++++++--
 3 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index cea555c9..ce05b6b5 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_pio pio_regions[2];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[0];
@@ -46,7 +46,7 @@ struct {
 	},
 
 	.cpus = {
-		0b0100,
+		0b0010,
 	},
 
 	.mem_regions = {
@@ -77,6 +77,12 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* RAM */ {
 			.phys_start = 0x3ee00000,
 			.virt_start = 0,
@@ -106,7 +112,7 @@ struct {
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
-			.shmem_peers = 2,
+			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 5f9d8ed8..7a6f1efd 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -19,17 +19,17 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_memory mem_regions[11];
+	struct jailhouse_memory mem_regions[16];
 #else
-	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_memory mem_regions[12];
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[3];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[3];
 #else
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 #endif
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
@@ -50,10 +50,43 @@ struct {
 	},
 
 	.cpus = {
-		0xe,
+		0b1100,
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* IVSHMEM shared memory regions (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 		/* low RAM */ {
@@ -73,7 +106,7 @@ struct {
 		/* high RAM */ {
 			.phys_start = 0x3a700000,
 			.virt_start = 0x00200000,
-			.size = 0x4900000,
+			.size = 0x4700000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
@@ -135,13 +168,24 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0,
+			.bdf = 0x0e << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 16,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 5,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index d5ba1764..fe069773 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -22,7 +22,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[22];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[12];
 	struct jailhouse_pci_device pci_devices[9];
@@ -99,6 +99,12 @@ struct {
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
 		/* IVSHMEM shared memory regions (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 		/* RAM */ {
@@ -297,7 +303,7 @@ struct {
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
-			.shmem_peers = 2,
+			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM (networking) */
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/597ffd9b3a6048a531cc9c08f61790f84522bf24.1578320435.git.jan.kiszka%40siemens.com.
