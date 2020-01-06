Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNUEZXYAKGQEYJRGY3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B7131371
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:38 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id j13sf12997164wrr.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320438; cv=pass;
        d=google.com; s=arc-20160816;
        b=AsrArRO0BSgIsePe/WQLiz1Wyyf7dL735bd0y8u5o5jPOVD/IymZqJwBsEOwDE48vU
         uou/PL/4yNN/4KaSfn/pXtDgSMD+zaBDdo6vMERgaB7w62A0sZBeGNOSqAu7BqBHw9Yh
         UuKgzgz61aVpEgAjduNu3l2ZV4Gwo9HkXIq9aSWh1X17fAUycw8P5Eo6S8oC1mgJNp+i
         Jt3ppukB5x6Hks8JGbgXKqb3lFDZ5shap26NgMsJrcKSK+ZWiZZr37dH9/nFjdQS5IGe
         A18xjGbDmeAICkw4kUg4abPoj9zSR2CfOmzhQZ+7WEK5SHzGt6rCd+1sYKJh5MMULdoV
         xTTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ALX7ADFzcJAhC8hOnvsRRfmw6AMJphpx+82v+RMl9ts=;
        b=TgQ60rxdA7AltyoxJDGl5g7zPa1+BDJyAs/hIAg+lEjRtIt36wJURDWvoU/FpX/vGZ
         rKUhTHsLBqnzWpkUAtzRXbA4D0aHBx2udzGuE2t5Gnro4sKS8k4fymjEjr3BbdDZHUQG
         vzQK7bP/GKLFDaAi3EtSoBQKg6JnENHRr7BMbb1e33nfA937Z594KhisKR7oYLaUMGgT
         AchQwYmfTvVpJogVVDJpYztoRBtKcD5qYD+LsQpUf9HelH+xRkj5zdQjmLbLtLT1JyVE
         sMj7WRm4xm2Sf7n+hSXNy9CbGYz88RBl5ZfN9U/zDYqRgONqZ1aZgSKRMw6g5ssgYjfy
         YU5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ALX7ADFzcJAhC8hOnvsRRfmw6AMJphpx+82v+RMl9ts=;
        b=Ozud5PB2lTrCdNx/al5NGzqDWg4hYzV4TnE5I/aoDm+uWhH27VdjXfX+/Z5o8Q3oLi
         K9wOPUkc1isqFay0eVtvOWOUcAZaQvQt1x+KYJEYYkVjgJPh4SBMrgWerhD3VYHbySWW
         a1GkmhzEV18dktjk2e58BtQO6etTvHurgrqMNuRRoM7pF5AzOTBSMuiOrEJCgxNg4DrZ
         oB8P2G+QpA9ZugvJhjS/NYbS0stCxzSIaa8+EtmH6dO50f6UDgMy3MYe/vOb59gSoxnn
         mf52xxWlhJwIrP4y2wlGjOvMRPI9TwzYn0SYRW3cta3UqqpJlZcKwecwzU6qDtDscZYo
         irVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ALX7ADFzcJAhC8hOnvsRRfmw6AMJphpx+82v+RMl9ts=;
        b=hf778tTJmIyL3SJMOjmiGvYAdruEIXnJ0MS3fXwMkx3f1TqD6bfM/3MmzvSF2PON9p
         0LPMhN8FQ+SYI/xfdyWLbE5cAwkhYxIiaxjATEhQWvrsPMbZ2qSJhyO4EhWl9tIs7t++
         OxQFjw1NvxiB4nShX6Im0GLtXII5RIpZNfTNZIWYhHQWm+CKPb4Yr/TrJ3MBv7fZbEB3
         o2siPEL7H5lKE5om9j4tsaSZP2N+oVpQwU6v1YWu67SQpT4WYuiPpo7H645KfDXwpl/P
         IKN+AoLQN0b+xvQJAkgKs7ZT9EVeNdOgX27heZ59wkhiAjZ5g28kyv8wHU0AEzpnn4X0
         t0dA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVhjBt5/g/oomBS9xlgVV2zycCDWquNk+O7TH86Y+2twtMJK19W
	AhsItxz4CheWOdvoz1BhLiQ=
X-Google-Smtp-Source: APXvYqzXdiWgIoWaO5zqA8PMXNGrNW9DXHTskZpxEBSpIDHIABYbi6dMCJQWwp29h9xj9iauHpMjgQ==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr99928522wrn.245.1578320438459;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls12996190wrs.9.gmail; Mon, 06 Jan
 2020 06:20:37 -0800 (PST)
X-Received: by 2002:adf:f98c:: with SMTP id f12mr99149871wrr.138.1578320437851;
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320437; cv=none;
        d=google.com; s=arc-20160816;
        b=rB8LcA0XJSoQmK7trnv+qpu+bi3zErnOL9Y7nQDMLE4hdnsUGW5OEpN1q62VDfNQCe
         hcOxSudILK2Kkwy/kzMqABug/EqPdFexL7YtFb0DUEzOv9+QOJUplJLRq8E/X/Jrb9J+
         3gkHdmouqVSM55jkTsJ0PfIzIjLCZg1gg92+ToSAvwSlCgH7g6+SB4KqpK/FV/K6jifd
         gaXuZgOW1SJwx7VC0VqVcQRnrEkyc6SMdFlfr+j5pOSXLq/OK8Vkolh6dJFaB1JgEnAK
         HMYhUI7VVoFwVATiCpiKEyKjfR3rufbX8cN3ea44KRq423MlM/akNReDhoV/B9vbsmAx
         Wbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=ktM5kgQsZva+VRVgwnArB9IAsUtVAD9PQeT5uOqR1xo=;
        b=qIvAsH967wteOqwC5sB/LiMxGcG/OPiQ+XEhHyy/AXAHr7fE5juDTR1+6tBwEK04Yx
         ibiQb5pIVPGUG1uFNTfeFe8tEDF3bunUdHbCo5ul5ZjKYDncd/REqiJIrPPjl5FvBqN/
         jGIGcnbB6LMW8h3wO6ydORceEAMIAua1Xw9fSSTdgcbJXoygjQcV+382ocKoPTKWS/cG
         RsCS/iX72n+ZpVqWuAgD1d/Fa3TGAHQLD19zO2IjiPkZB2lpq3vZSrsmcaeSRpQ+aXcj
         JxxK9LG5aDC4LoLugyLY7BHr0reY6GRcF/ZFOrSqBwXtc+R/Tfh7h0gLDqlTv7nTZlfs
         UWcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 80si765798wme.4.2020.01.06.06.20.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKbie025675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjC008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/19] configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo
Date: Mon,  6 Jan 2020 15:20:20 +0100
Message-Id: <a8c0e957d9f81bd54dd2b3a66a1132ef77ab7eab.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/linux-x86-demo.c | 42 +++++++++++++++++++++++++++++++++++-------
 configs/x86/qemu-x86.c       | 37 ++++++++++++++++++++++++++++++++-----
 2 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index c542967d..47cb6517 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -19,17 +19,17 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_memory mem_regions[20];
+	struct jailhouse_memory mem_regions[24];
 #else
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[20];
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[3];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_pci_device pci_devices[4];
+	struct jailhouse_pci_device pci_devices[5];
 #else
-	struct jailhouse_pci_device pci_devices[3];
+	struct jailhouse_pci_device pci_devices[4];
 #endif
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
@@ -54,6 +54,22 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region (virtio-blk front) */
+		{
+			.phys_start = 0x3f000000,
+			.virt_start = 0x3f000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f001000,
+			.virt_start = 0x3f001000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
 		/* IVSHMEM shared memory region (virtio-con front) */
 		{
 			.phys_start = 0x3f0e0000,
@@ -184,13 +200,25 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0,
+			.bdf = 0x0c << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 2,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_BLOCK,
+		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
 			.bdf = 0x0d << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 3,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
@@ -202,7 +230,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
-			.shmem_regions_start = 4,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 2,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
@@ -213,7 +241,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 9,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 4ef6b283..f209f372 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -22,10 +22,10 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[27];
+	struct jailhouse_memory mem_regions[31];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[12];
-	struct jailhouse_pci_device pci_devices[10];
+	struct jailhouse_pci_device pci_devices[11];
 	struct jailhouse_pci_capability pci_caps[11];
 } __attribute__((packed)) config = {
 	.header = {
@@ -74,6 +74,21 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region (virtio-blk back-end) */
+		{
+			.phys_start = 0x3f000000,
+			.virt_start = 0x3f000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x3f001000,
+			.virt_start = 0x3f001000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
 		/* IVSHMEM shared memory region (virtio-con back-end) */
 		{
 			.phys_start = 0x3f0e0000,
@@ -310,13 +325,25 @@ struct {
 			.msix_region_size = 0x1000,
 			.msix_address = 0xfebda000,
 		},
+		{ /* IVSHMEM (virtio-blk back-end) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0,
+			.bdf = 0x0c << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
+			.num_msix_vectors = 2,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_BLOCK,
+		},
 		{ /* IVSHMEM (virtio-con back-end) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
 			.bdf = 0x0d << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 3,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
@@ -328,7 +355,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 16,
-			.shmem_regions_start = 4,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 0,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
@@ -339,7 +366,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 9,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a8c0e957d9f81bd54dd2b3a66a1132ef77ab7eab.1578320435.git.jan.kiszka%40siemens.com.
