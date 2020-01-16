Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id B25D213D7F4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id c2sf13595308edx.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=tVEdv7W3afSnBMxdrGlYsvUsvNmfLcaWxuJgHVIFLUBNGtt2/lDkGFA7eWKg1sF0YB
         A+7sgvYDUyxVrnxoPABf6e3FAIDgGRBgO7GxNhX76n16DjVDOJgoJ2v2uS1o9whjqBMb
         hO4U2qW84yLz5ruI7qhNbHWXnEUJ5coHvPk3sCjHfHayOWobiFBb0hSz0Y0ZKKZyuqKx
         K5dwVfcaGGEVuiijnIs/Rk69FQOJKvYtjsKOHiFlhTISzljhPIxHmWBJk+sL/sUWFksx
         F45/VAvCCPMo7yqNu/1ynt0cWocXwLvUSIPIqPQpS7hrU8fyR7q9prHUif/GP725OOIJ
         Pbrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=08xGsS10nvzNw5Jo+Zz9/N8kpVLsNv+L7MMB5bAKIVo=;
        b=JS1LIQCrJWpVefNHtJOxIIaWXUJmuoFAcJFOh0MWsqYW1sT/vCAgpedeB+JD5bfva4
         7NoZEpwsy7ePNU0QJHmBvrKny6Sl0hLe0HTGAo3j6CIufZvAj+t02h0+ysLG1W7WcMCk
         8Xu7Sp9Fv8hsmZiCCF36qC7M/RxgdjPOHLmqPWHiP+duJZolZQfUeUCpx7r/chGuJjmm
         Fo7OpDuV9uEoLRseO9tOx1XqG23NXSAinAx58mYklMsNKk+JlOULLqCA1Wmv0pBGh81E
         ao20pQox/FE/P5MNYBb+rRDT/r8tmpc3sp2WCJp5w5Qmpyi90BCqs2XV9l5/nCNxwHba
         ZtoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=08xGsS10nvzNw5Jo+Zz9/N8kpVLsNv+L7MMB5bAKIVo=;
        b=pIqZfRpVDdbPIMKaRgff3vbeSWqoudWhIkpLEcbqP6mzKvvdJg9UOU+kOl2yiEKAvA
         YUbuH2DkM1KF6iQUB6O2DSsbclsSoztlO0Do52aECtUQa9wwVzPk4S+YRMRt0IB1LUG+
         CuXv5JcfsVk4tZtjRQhxhI8a/c4rv6myicYepfg2sb5zi3rXZ4W1al2seMK76JAhKPk5
         C2R84GBYjY0Xzya+DTNWXoQJy5qoIgwkp/rBDxhzSjQDrbA9Qa2gpZGwRqBxFkBo5yhM
         F7ey4WOODdpfPGXlGEHlYOWbNtzxuGigysH0Umbv3bGOL9JQgXmz9sPkTwLQ2uz+HQZu
         2A9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=08xGsS10nvzNw5Jo+Zz9/N8kpVLsNv+L7MMB5bAKIVo=;
        b=Qmq0mOGJtvDyI0sIHHHebvlMO2/qvsx+C+GCSV/GN+Med5RA0TErXUnHcHK+zEJz7K
         N881lH1X9pmnOrj+WAEGDPRpPxJH6kbz9OdfSokFcxuXBp6yHH2UAM9lUll8h/XTSha+
         HxwWUPZtQUKLM805u64YGRNrqxElQ8RP1jbU42ZWvH2X4y2nFQgZiX+rKPUJhfPNoqCJ
         o/9oTvBme8trBOmRVZrf8Mxbkxis077AqmMYgrrJ4A1zaOHdmiVlgoQ87Ecwn1X2vSfd
         LZ0BXMU7e9Sip7pHtKkZIgm3LfkvELJ8QAN3lr32eBUDCeTagaEPecaIOyGzlNJGhnwh
         00dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBYlgHAh2pUV/oZ/n7KQK0HqxEtgYN/MO8FmuN6E8mUFl/wNDt
	dwzxlcwg4ak+NepzWtnG2iA=
X-Google-Smtp-Source: APXvYqz+W2fOYKdjDFSYsW/gEpzK2eGMdGIGwKGGCYb+nZthLWZJz2p+5vo1CCHfAwlrkoRZRgPzgg==
X-Received: by 2002:a17:906:6014:: with SMTP id o20mr2169555ejj.100.1579170890368;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9ac2:: with SMTP id p60ls5027950edb.7.gmail; Thu, 16 Jan
 2020 02:34:49 -0800 (PST)
X-Received: by 2002:a50:9ee8:: with SMTP id a95mr35722349edf.86.1579170889581;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=c9UxWm9/LiOzP8VvHn/AZgWnrNVq6Uugx8GC7N3/JZ0EZvOAZntH7mMQRhKrlWMTxY
         3ipVcF8LX4lTGNxv6CznXBBrFn3BNpqvkaDKMusIZlA/7qmbsIgLJWPSRaqzFRcMeH0k
         W1FnbCdkWRBhp7FEQaCN8ozyICppjhzZoQufS2KUaZTNgcI4W/bRFVInISMtuM/QIyQ4
         FftjyHsNrV92shhMICsCzWBACrMDgluIjHifi9+LveI+jLW3AH/B9J9nizgCP/PIkGjp
         q+2rSUG1ab0qMFZuWYj3MzytYat79PfZ1mj/cXSN3gWaCHlnN8fSHuUqQBp6l41PTyOu
         PV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=480CyuaQPeusRFFNHsKeJsFjFBlS2P7AJ9hpGN8QIoo=;
        b=LvLzZ89/TdpDl8rMKpTX0pbypke4sQe3RB6E++/ciKDKOIH+09341e3M6NnsOEuRdo
         uVdC37JKbTwldW0NOfsKt3ZsNUEkmepQTr6RX4mw0A1mwlaiNcoymHfo6JVxjbuOKYER
         scpE8vkZuOrTCWHWu1YE7duU7lmOoYtWM0S2y9i0Aq3eynBHkd9kByiD9jSC9+567kkx
         tr3AYKh/zY8heSAL6U6rkTgKmFbfxPYcIQgIhkKVYyFwgQxIzf0BrHqq5m/a7c0x3OIe
         Uh/52U6gHTh2U5GN3X2AddtQTT+NGno2uX11ee5fb8w7oLOSzDA9qEq/EvylQY0wbrp1
         7xHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id d29si977599edj.0.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYnY2032071
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQG031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 06/18] jailhouse: Adjust nuc6cay configs to upstream changes
Date: Thu, 16 Jan 2020 11:34:35 +0100
Message-Id: <67a7e0e1d48832baa4aab40482fbe9037034d767.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

Account for the config format changes, including the addition of a demo
ivshmem device to the non-root linux cell. Changes are analogous to
those to qemu-x86 and linux-x86-demo.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../jailhouse/files/linux-nuc6cay-demo.c           | 75 +++++++++++++++++-----
 recipes-jailhouse/jailhouse/files/nuc6cay.c        | 70 +++++++++++++++-----
 2 files changed, 112 insertions(+), 33 deletions(-)

diff --git a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
index 5211f2f..8366d6b 100644
--- a/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
+++ b/recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo.c
@@ -20,8 +20,8 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -40,6 +40,41 @@ struct {
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
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 		/* low RAM */ {
 			.phys_start = 0x3a600000,
 			.virt_start = 0,
@@ -56,32 +91,38 @@ struct {
 		/* high RAM */ {
 			.phys_start = 0x3a700000,
 			.virt_start = 0x00200000,
-			.size = 0x4a00000,
+			.size = 0x4900000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0xff000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
 	},
 
 	.pci_devices = {
+		/* IVSHMEM: 00:10.0 */
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
 			.domain = 0x0,
 			.bdf = 0x10 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
-			.num_msix_vectors = 1,
-			.shmem_region = 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 16,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM: 00:11.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x11 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay.c
index 5b3b84e..7600745 100644
--- a/recipes-jailhouse/jailhouse/files/nuc6cay.c
+++ b/recipes-jailhouse/jailhouse/files/nuc6cay.c
@@ -41,10 +41,10 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[54];
+	struct jailhouse_memory mem_regions[62];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[6];
-	struct jailhouse_pci_device pci_devices[21];
+	struct jailhouse_pci_device pci_devices[22];
 	struct jailhouse_pci_capability pci_caps[53];
 } __attribute__((packed)) config = {
 	.header = {
@@ -96,6 +96,39 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0f1000,
+			.virt_start = 0x3f0f1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f0fe000,
+			.virt_start = 0x3f0fe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 		/* MemRegion: 00000000-0003efff : System RAM */
 		{
 			.phys_start = 0x0,
@@ -479,14 +512,7 @@ struct {
 		{
 			.phys_start = 0x3a600000,
 			.virt_start = 0x3a600000,
-			.size = 0x4b00000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0xff000,
+			.size = 0x4a00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 	},
@@ -878,12 +904,24 @@ struct {
 			.iommu = 1,
 			.domain = 0x0,
 			.bdf = 0x10 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
-			.num_msix_vectors = 1,
-			.shmem_region = 53,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 16,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM: 00:11.0 */
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.iommu = 1,
+			.domain = 0x0,
+			.bdf = 0x11 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 3,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/67a7e0e1d48832baa4aab40482fbe9037034d767.1579170887.git.jan.kiszka%40siemens.com.
