Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WLZTYAKGQE4A2KO3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 463661311FC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:03 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id f19sf10576340ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313203; cv=pass;
        d=google.com; s=arc-20160816;
        b=ifkTiOYt9wELPb3JY7OgPb6dAbsG9/4V/ylqHJz+glnZMzrXjyZ+EO6DJbfGaC5rm7
         skfiU1t08Omedhc0hov28ar2TekQ6Z17HQyw5SikX4NnjQGWDw0v2onpuP1JFHN5+l0r
         upezhXppf9SVJ+EEipiQfmHkdixV+b64K89N00Kir58l/Ak1jAC5nRzkY3rzqbxOpIo4
         RyVeo52h7j2iv4RxXl2EI4hQDI7Z17UDddRrvA8y+0hSoK4CL60UTCrv6vmfCIbbzW7b
         O2w/309bzSzXgBWx2FM4f82R7c5Q4V/EbkoWKO92KOKtPf/Z70t9xQLwPTYxTRna+fNr
         saWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5UBUS2R4nJ0tZ7hmZq0a/65dsOYBYwwGPv2ypd/htQQ=;
        b=msLrr+cg8hKcd0nQBJBihDdSEGcrcy+fEruM+mSVJpsuVbUmYgst+Q8neXkfcEL1tg
         /5YqTd36BlnOVJKT2zViMnqVL/BlLh1UFg8iheGafckc71ucJ9tkA4R6zWVGTaJfS0Vq
         SiJzUQ84eLjmGaduGuMxNehy3wyKVeLpyBEPG0YHtLB4Y8Rt9hmmNQhkEtc9zYLbiULH
         r0/8xijxYcLVtJBvmX7hhySi+hIdSobF5H8Y4vLJ0+Q1joLnuN3JpAwsZULPy5JC8VYU
         j2tHPFfJmgp8tD1ZYpcWFE4I4iE5gq6wRZI+Cx5OlxLPtAJlljXlk4ofcxjH2lzpK0mg
         05jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5UBUS2R4nJ0tZ7hmZq0a/65dsOYBYwwGPv2ypd/htQQ=;
        b=rD7Pio2oLbq06M+SuzOBRuDHAiLE7DUIEeHaHoWebdzY3hrZr6e1a5ofsS2rt7WLjH
         JOFioGYs4Fzz6v9TGRvlRm43pqZcq6X15O5ZaiCgWvbpOvt39DbmKMarn2YKMxg4VWth
         +mE7FrJyNZKxVOg1LW73ykHDfPyHjTdyvT0bfOf/7mDRCpYBYVxCGwSLoSncvDB88tX4
         ECr2vuKN95407k1v9DIAY/XwB1EhgfBX5j6B1Sqf98sltbYXZnSvFWv5ZTg7h7hlJe2U
         dkkSRPDaVUjc2+XJZmXN7m/dYlB6usjL3v7RC7sWr6WZStES45KKqLZJ66o5hIpzf7tg
         YOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5UBUS2R4nJ0tZ7hmZq0a/65dsOYBYwwGPv2ypd/htQQ=;
        b=CKJC4YqBT6GtZIP0vaXzQmLNYDQilnCBdDUUSvXCxXBkPQcVfds2bYhyIjn+wifNGG
         3/rR0Vpz6tt22KLH8tHzwicRpqIoO5/i4h5jd4ncPv7ikZY4kdw8ojEZKeZ0k/AjKeWN
         t2jYPt9Fi8ccDQgTT/YLMWhNfkKwI0JdKCzSlHHu4kiFcZUiQT8RsHw37KVtOdfqa1J+
         D2ZVRwa+BGVMlQlplgg/kP7xgxS37g9CJP3Vl+QTtPZwcZE1uq0R8j1zEHHJi9MwZz+M
         oQDR7LnoYxsr5QI7TsynrSEd7zrk9Ro/QZFmOR36pDrNBg4UivBPbGytTDhtBqx5EizU
         0t8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW2Xp+hxh0pfPl1ZuJpGxEEHd0reEhx19f7ZIjc9feZY1Rkb/qJ
	bavyt5mTecQFn5MAHTnouvs=
X-Google-Smtp-Source: APXvYqyJ59/s/f5WMP8Ik04voNF7jmXBVelyGOEzefLGPK7vxiArX7JA2Sb7Tdl1Wxn3L0WkkimMPA==
X-Received: by 2002:a2e:8651:: with SMTP id i17mr50693674ljj.121.1578313202773;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls5780111lji.4.gmail; Mon, 06 Jan
 2020 04:20:01 -0800 (PST)
X-Received: by 2002:a2e:9f47:: with SMTP id v7mr38189114ljk.124.1578313201860;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313201; cv=none;
        d=google.com; s=arc-20160816;
        b=VlRzofdzrli0MZDcHeZH+adXiJKRis3MdAXHJO8yO5HZuJb1eB1ovOko422qj7XuOz
         WPNzzZ9byABmHGLBcfk4d2kEWocim5Wcmh7kp2SJDLzAkBKcyO1sOGz41v5mBOQymwfc
         uVKz5WGsDGH2d9exNaGJNIejU66+hc7s8HwR2sht8UOCSQQuDyYGyr4iTqUqJkntWHAi
         AVCKrn1cqfOh+XqNm/w5X0xOLSE6sni8+SVrr9ZODErMFiWuiiY29bCJReZFvQ+v/jT1
         0svClZRJ9t27upK+5yW6BZOr1xrYnsoadMIwWNT/zY/V0A/WO0yHisDX9ESnEWHyyfd6
         p/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=oeivZACowXva/xjmGoT+LudpcBJjwBQfOQtkqlPXk4E=;
        b=kvwkM6uAeFpoYaClTS16D43jq4jO6296T+DUdPfEsbWmb5BmFQs6P7oFHP++kB73sJ
         DMtBTRcyC69f/tVPz/nm9PUv97Sqj8LqaLSuRDUaUHbqtIeiDkjcJqAQP842bsEAPMUU
         X7vWBaW8+k5xPTo4mG9ZRzlVZOKl9s9A8iZ4MA10clF+Aeivu3SGgu7+uJKJ8HjayJtC
         6ZpbFEOa4QLNveQLWRNay4bgWDVGH25PYChLNZbC/j30bl/k+p0tBnw0l1OXmBQdZqhE
         z5Ce4HeBnAgRmjjTZscDh0C7NEk149/6EYRmpM1njf+ZDJYRqOPXhA7urEJQRfTTUF6Z
         ODDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h8si2193670ljj.3.2020.01.06.04.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK1og020599
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEu029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:00 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 22/38] configs: x86: Rework ivshmem settings
Date: Mon,  6 Jan 2020 13:18:03 +0100
Message-Id: <51f21ea3726f82aa8da6bc78e4038c855d155202.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Align the ivshmem-net size of x86 with arm/arm64 to 1 MB. This will
allow to use the same upcoming memory region macro for all archs. The
smaller demo ivshmem device is moved into the MB below the networking
device. This MB will take further devices later on.

To make space for this, move the demo inmates one MB down in physical
memory.

As we are reordering the memory reservation, also align the PCI device
IDs accordingly, swapping 00:0e.0 and 00:0f.0 for demo and network
device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/apic-demo.c      |  2 +-
 configs/x86/e1000-demo.c     |  2 +-
 configs/x86/ioapic-demo.c    |  2 +-
 configs/x86/ivshmem-demo.c   |  8 ++++----
 configs/x86/linux-x86-demo.c |  6 +++---
 configs/x86/pci-demo.c       |  2 +-
 configs/x86/qemu-x86.c       | 26 +++++++++++++-------------
 configs/x86/smp-demo.c       |  2 +-
 configs/x86/tiny-demo.c      |  2 +-
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
index 3660a74f..d014f267 100644
--- a/configs/x86/apic-demo.c
+++ b/configs/x86/apic-demo.c
@@ -48,7 +48,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3f000000,
+			.phys_start = 0x3ef00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 7ea43e38..8ae31220 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -51,7 +51,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3ef00000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index 60745cb5..863b3ea7 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -49,7 +49,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3ef00000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 7e0851d1..c6c1f4c2 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -51,7 +51,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3f000000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
@@ -65,8 +65,8 @@ struct {
 		},
 		/* IVSHMEM shared memory region */
 		{
-			.phys_start = 0x3f1ff000,
-			.virt_start = 0x3f1ff000,
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
@@ -82,7 +82,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
-			.bdf = 0x0f << 3,
+			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 2,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index e324c84e..69ea2bfa 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -71,7 +71,7 @@ struct {
 		/* high RAM */ {
 			.phys_start = 0x3a700000,
 			.virt_start = 0x00200000,
-			.size = 0x4a00000,
+			.size = 0x4900000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
@@ -80,7 +80,7 @@ struct {
 		{
 			.phys_start = 0x3f100000,
 			.virt_start = 0x3f100000,
-			.size = 0xff000,
+			.size = 0x100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
@@ -144,7 +144,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
-			.bdf = 0x0e << 3,
+			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 3,
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index 92fba8e5..a4115744 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -51,7 +51,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3ef00000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 9b2e0a4e..9621370c 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -84,7 +84,7 @@ struct {
 		/* RAM (inmates) */ {
 			.phys_start = 0x3a600000,
 			.virt_start = 0x3a600000,
-			.size = 0x4b00000,
+			.size = 0x4a00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
 		},
@@ -171,18 +171,18 @@ struct {
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* IVSHMEM shared memory region (networking) */
+		/* IVSHMEM shared memory region (demo) */
 		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0xff000,
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* IVSHMEM shared memory region (demo) */
+		/* IVSHMEM shared memory region (networking) */
 		{
-			.phys_start = 0x3f1ff000,
-			.virt_start = 0x3f1ff000,
-			.size = 0x1000,
+			.phys_start = 0x3f100000,
+			.virt_start = 0x3f100000,
+			.size = 0x100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 	},
@@ -276,7 +276,7 @@ struct {
 			.msix_region_size = 0x1000,
 			.msix_address = 0xfebda000,
 		},
-		{ /* IVSHMEM (networking) */
+		{ /* IVSHMEM (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0e << 3,
@@ -284,9 +284,9 @@ struct {
 			.num_msix_vectors = 1,
 			.shmem_region = 14,
 			.shmem_dev_id = 0,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
-		{ /* IVSHMEM (demo) */
+		{ /* IVSHMEM (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0f << 3,
@@ -294,7 +294,7 @@ struct {
 			.num_msix_vectors = 1,
 			.shmem_region = 15,
 			.shmem_dev_id = 0,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
 
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index e3ba41fd..35bf9504 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -47,7 +47,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3ef00000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index c36a73db..464c7acb 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -50,7 +50,7 @@ struct {
 
 	.mem_regions = {
 		/* RAM */ {
-			.phys_start = 0x3ef00000,
+			.phys_start = 0x3ee00000,
 			.virt_start = 0,
 			.size = 0x00100000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/51f21ea3726f82aa8da6bc78e4038c855d155202.1578313099.git.jan.kiszka%40siemens.com.
