Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOMEZXYAKGQEVNGPPNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F013137D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id b13sf9534176wrx.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320441; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vb9jswspfktI2XT3dO3xOCvukRFNzyAil9hdYZhdXph5f4RTXOVRgWd/iie1hCbrJq
         K1aY/u8iNpPRqF4n5ymANZcPMf0OB5G0d7063CtUal1wQL4agzI407b7btKJDJXQvPix
         bXyYIIfK1jQPe39fRLtxFRuvn8N1MLs8Ji3jeGnTSSaeI4vdiF4DrFACToiCxuR5by4U
         fXgY0oFo0mPPpDRQHQS9k1cm/J744PetG6JTCxyz58H3P7g6b1Ulyu/8zguU4K1JgHhB
         3foANuQroKIPxyE0iIBja7YM61mWGQEYILeg8bL7q+ZH/6JEprokyzUzGu6OlUkedoCD
         cDvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=f4QOKonQxE0JdeaK9YWOQtBQxv4I5KHuOpwlfwYNDk4=;
        b=qmaWKKyQNp0Ua3zd5TFgwntdtWX1+XGJGS3+1YqL7AiXwdcqiUe3ZG559XqtgRSt7Z
         zuS3IXWgke8zbmDqhc0RLlj8UctwKFngjxY/7oWprVj0FSFAIVtSM5M3Y4zAfirfWejz
         wEIxYzQ+IDvIbIIFixuppiq8BZcYbmyLPxocNjO5vfkq76WlWQN+CCZM+RsWzbm6Z+is
         PiAMXRblR7sU2c7/B1eCG2CdgCt9aT9s6KS3ntu7BFcyx1r2fRtCMMpPxQ9pJ0VEENmA
         dNeQtXVXwput+CbRID0yxvmJZRGw15IkSITIttiIFF7y6/Db/2uAxD7R6ztaomCBMoHH
         gfRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f4QOKonQxE0JdeaK9YWOQtBQxv4I5KHuOpwlfwYNDk4=;
        b=ZSspyvUOlKD/BDo+ATW6Jv8m03iXPkV0IBcOp19q7xmlPaVdJajLzKMK02V/lWwwjU
         OkeUsD/NiGqvACxKa0DlIGITkjuLcL+rEepvppOshiPLElqk5I6CQIdJeNQf92lw+xTk
         dSpOtgAHonu1YiHEY8Yr2mWNgkdGLUcCkuBjB1LLEbz+mvfTHVzJ4O4pLPYNJzi5TLWX
         N0qzlAw371jVIZcoS7T3gVkB19VgHrgubnpgczsPPvw+v9Fc+Dkc86RMcDM/waRQnrHq
         MAbKK3a826d3FAjtT0cfVsJ4GkDLC2iQqv/FjWgKZ7t1R7Ap5lz2Qd5RoM+0+7ulLokX
         Fugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f4QOKonQxE0JdeaK9YWOQtBQxv4I5KHuOpwlfwYNDk4=;
        b=thIzEwwmmhmERUJVRez3mGzrGkwn3UsA2/T9RPeSDakoo4GO+vUSlxSpoZcYpR1aNY
         J6FA85cvY4OPuUFqF4aQJzwXIBUMyvadMciFHiNTtuyUaYnXHV1Jbqt11QxK9dtElxyc
         wfoJ+/sUVMSFTq1zQFTcrDnXb+M7RZuc/zTvKnTkwXZaKBj9GJmexIYbKem/BSoifqqF
         jYBtPcZcFx3AwgKJDM4Vn0zmyAXJELZdI93l38cuweC7zafA2hNJFowOJfex61oQai8B
         FpScP0Wq/xYTJ8FldEraqv4W6EbW05Dvb1a/E+kJvHWwgjaZZ6+4PzOHQh60PmlpgAms
         C5YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWN7rbNykxpXSyPoCUHai/AIPRLxjSWzJNvTxU6v/L0G4YiS0QY
	/hHNF4tXd27b+gNuJe2gjng=
X-Google-Smtp-Source: APXvYqww1ZebckloPe0nLe+RbTGTm9YXZCYTBRmJTjRFkx+9hV0dWyd/bifMeHqM62pj03dnaFtz4A==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr62157946wrq.129.1578320441858;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c76b:: with SMTP id x11ls5375189wmk.3.gmail; Mon, 06 Jan
 2020 06:20:41 -0800 (PST)
X-Received: by 2002:a1c:4857:: with SMTP id v84mr36150184wma.8.1578320441278;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320441; cv=none;
        d=google.com; s=arc-20160816;
        b=c9w1EO+rHYXy/FLIwNLpD47LsZFVQRk1fqTBMv8QCQBBuB8CxnMssdYPxfzlfC85Bh
         9TLRuWpA4Jubvym/iYLh3swqITsnaDG+Y75CfdsrW5QFOKoRjLOOUvmsEIrEzcj3Dlt5
         jZ+8SbfQRLq2rxrGNYn7gbEHcuJJ6a3+25r065yN1qGQjkrRiZ1/8HbUBEN7t2ZE/qjk
         2xQ0nYZQP7MvfpkeBUACWSWyf1SoCQ6qOyJdlvyQTrtg4UPX3XmYIWwhLefslxYQWmTS
         pZhJYWkmppjK+JwFAzYvvodSP9pgRCiu3+PB+bbePA9DO2DVRJTdJ1Qvv8SxygRQ1Wug
         j7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=AxNsiUQwE0GwZ8ArE8qKtT58T2Chm0uD6qGowbCHn1c=;
        b=i4HvgYgXGsRX61dU6yXpCdNfMRoY8Sow78Xe8+UaZMi3dCkbDpvnjfYr+yeRYnZfnp
         peQ9F9XhZDaKK/qLgvneDhpHDx9TBkX9Kq6PvUN6JWECVgGsaaW3SfIdHbvFbnHv48fF
         MjoCA/JdIeI60Vwzf0DclPQbZkRJ0LJDhR3q2sW/JfSbKSWnNC2ZwlT++reWzMdsg5v/
         c5KPwDtW9dVhij5HiH0BIbzqU9Yag1PEs9qXBNHlewE6+ufUO0l3cuQymYNjJcUt8Awa
         l3IyXfZI6dwgmKKX7D73hLKFALk8XE8PqQUnQ3Hj+pj0ODPb1IO6vLZQybG4W7cICzMv
         rjUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id g3si2455950wrw.5.2020.01.06.06.20.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKeFi025706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:41 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjP008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 17/19] configs: arm64: Add ivshmem-demo support for qemu-arm64
Date: Mon,  6 Jan 2020 15:20:33 +0100
Message-Id: <a59f8d33f182ebf613d41cb3154b35fe30a532b6.1578320435.git.jan.kiszka@siemens.com>
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

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/qemu-arm64-inmate-demo.c | 75 +++++++++++++++++++++++++++++++---
 configs/arm64/qemu-arm64-linux-demo.c  | 57 ++++++++++++++++++++++----
 configs/arm64/qemu-arm64.c             | 53 +++++++++++++++++++++---
 3 files changed, 166 insertions(+), 19 deletions(-)

diff --git a/configs/arm64/qemu-arm64-inmate-demo.c b/configs/arm64/qemu-arm64-inmate-demo.c
index 502e3705..6863ce24 100644
--- a/configs/arm64/qemu-arm64-inmate-demo.c
+++ b/configs/arm64/qemu-arm64-inmate-demo.c
@@ -19,7 +19,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -29,8 +31,10 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 144-32,
 
 		.console = {
 			.address = 0x09000000,
@@ -41,10 +45,43 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0b0010,
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* UART */ {
 			.phys_start = 0x09000000,
 			.virt_start = 0x09000000,
@@ -53,7 +90,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x7faf0000,
+			.phys_start = 0x7fa00000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -65,5 +102,31 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x08000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				(1 << (144 - 128))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index a661beb3..d8096e8e 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
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
@@ -46,10 +46,43 @@ struct {
 	},
 
 	.cpus = {
-		0xc,
+		0b1100,
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* IVSHMEM shared memory region */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
 		/* UART */ {
@@ -60,7 +93,7 @@ struct {
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x7fa00000,
+			.phys_start = 0x7f900000,
 			.virt_start = 0,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -90,17 +123,27 @@ struct {
 				1 << (33 - 32),
 				0,
 				0,
-				(1 << (140 - 128))
+				(1 << (140 - 128)) | (1 << (141 - 128))
 			},
 		},
 	},
 
 	.pci_devices = {
-		/* 00:01.0 */ {
+		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.domain = 1,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index e69c0da3..14d54d3f 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -20,9 +20,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -68,7 +68,38 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:01.0 */
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x7faf0000,
+			.virt_start = 0x7faf0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x7faf1000,
+			.virt_start = 0x7faf1000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x7fafa000,
+			.virt_start = 0x7fafa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x7fafc000,
+			.virt_start = 0x7fafc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0x7fafe000,
+			.virt_start = 0x7fafe000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0x09000000,
@@ -80,7 +111,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x40000000,
 			.virt_start = 0x40000000,
-			.size = 0x3fb00000,
+			.size = 0x3fa10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
@@ -104,13 +135,23 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:01.0 */ {
+		{ /* IVSHMEM 0001:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 1 << 3,
+			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0001:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a59f8d33f182ebf613d41cb3154b35fe30a532b6.1578320435.git.jan.kiszka%40siemens.com.
