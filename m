Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB74VTL5AKGQEN7MVPYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422525349D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Aug 2020 18:17:04 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id o10sf684041wrs.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Aug 2020 09:17:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598458623; cv=pass;
        d=google.com; s=arc-20160816;
        b=a6j05Tk6XB+miApbRVvCHghQYT4BjrdzRveJLMiNNbcsYCdKPcFJEc5hmPnk+WnMqR
         KtLJZWzbR/w8K8Yh5GhP/IxAOw4eMTC6IiMqQEYBV2izYxbWeu4qtO9rq/BxksDTNk8E
         C9tY2cpptPmUjCNqABDPiejdvVxeg41vxczJjBPxQS2PyPtATt3/vArhjy3xRcGMNLyn
         gF75vMgx3w8CFUWmp+1zXWwKuXVUawD/A7nJ1uH1Tan3k6ghd+HBI4mPC8sp6C1R94JT
         ta2dI7h5jQNDEPHv1m/NHAeAw8Z1GnaBsllpRArlT+LcALYRP12twwQ2SNZ0RaCtP4z6
         cqaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=aGEtghhIMxOpsrcQ5qgt0ZVFLk6Do+w4iHEQ75o7kYY=;
        b=Q7klq3w8+mAbbS5jivgOKWhp13b5xNO+Y+012o+Erx+OdZ/gCXpZ4F5zm46lA0Hlpc
         eVhfCCJk8wWc9BbDt/ux5GaT+gHyX26vgKFaQWyJB1rgo1skaCKOaAddBy3J74Y+XufV
         bccBfD1RIZk1ak2QYlBjjjWcVdCzpOHbMPH9hJ3wNjzTV73Le8TizFQvf6skQHyQVORb
         KFjZGFvU+ntZkg02rIH/FoAeTyqezkMlC0iUFcQrJvBu8Vm+pYf0NqYUKqlFtPOzqJuw
         POdvMGGA/Y/aiowXXLSjbPji8SX4XjGMKO6MWqk3xqFaJmlgtlzM9Xzuiw2QoeLehySm
         YIxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=TMulKWw8;
       spf=neutral (google.com: 2a00:1450:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aGEtghhIMxOpsrcQ5qgt0ZVFLk6Do+w4iHEQ75o7kYY=;
        b=poEPDOq2KJuTSLB4KfHL6MH0TOSrmgy4a8oFpjL9sDnYr0iLERP7YvOAK6dIk0IJaP
         IiVKIyqHShK0rKCUjhgAcgh3c7JFKNPK9ucio/+mi5zgRlPAdG+D+dyEcojHrLlYFfqX
         QVqJNzqiC4HHK2Fy+tjilfOoMln4tv/FyBpqZoMTmIzTxp0dhTVB407STM4+SuxjlJ41
         mSgA9Kv04Vx1XBgiA4AmKhADTFXbMSz7bIDkyUx0UFPnZJkhUZhz0FtDaIg8/2Hr+DPT
         T8CEkFlcFz8Qd/kOnRLjLCfnMKJlOs1xIwtF6eguVA7pw7E4aqcJWVegqHQmiU7Zo4o/
         6p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aGEtghhIMxOpsrcQ5qgt0ZVFLk6Do+w4iHEQ75o7kYY=;
        b=hcAQUQafKxg8TqjFTWoTGPpZN0/ic2w3Zm7OiqA02+p3JgZP6Zf3Qip4Xewd58D9NB
         o80CNdQju/eE4TX5Rz27tLO3zOd2jjJHmOCLPm0J11VQrZzEEllge/t+CrBth32zSpE6
         0VgfZH0zYa6z5mK80TJYX/9SIXPBTpnt9J2ajRN7l9Y3fPI6d/fKTxt7uHkh+oDuqHfI
         OR0zacp9TJ20FwkVXlkfw2BSUIq3lW3vjBcIQfWBqUjYRySOM6H0TECO7skr1OZNMqjn
         nGjY4c7/+seImFFPuoHqK+1y7IML5AzcCXiz6Qsv4HDu9xnRJd+0hX7+ZDVJzs0NVtNp
         OVTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533c425/eqoCHhN+5eDNMiCB9tI7yskOAuUfjWYLBd/9vUtzOlYG
	twXJmEtDWlKPOx5w2MisHg0=
X-Google-Smtp-Source: ABdhPJwsLnaDZsb1Aj97kOaGM+dstUHO+7FIXMfYaH0oypAgWxWHu3hWIfr+n1bAviUni75qfVaSeA==
X-Received: by 2002:a1c:7dc3:: with SMTP id y186mr8193063wmc.59.1598458623722;
        Wed, 26 Aug 2020 09:17:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4c:: with SMTP id 73ls1331675wma.0.canary-gmail; Wed, 26
 Aug 2020 09:17:02 -0700 (PDT)
X-Received: by 2002:a1c:14e:: with SMTP id 75mr8237308wmb.114.1598458622679;
        Wed, 26 Aug 2020 09:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598458622; cv=none;
        d=google.com; s=arc-20160816;
        b=Kke65X8Ym8A1Jfi57hA+BaSxoFIFuYbn9btVwyM83u+gld0WqpVa2ntoVaMMY6n5Vs
         /H68pk5bK0zPG7nmTrzUgg6uMB3t8yrHp6AygolPkhv+BrUa96MCn5tVersaP69XbYot
         yi9s9ns/2yHLaB21SQZ2rqw2pIxs8zTMrFT/rnp/O1VdLmbK5J/GnX8Ty9Oir8zBvmVJ
         tPaYFFR9r7WlYXFj9j1nlBF+W4Z5Gvkk+I1F8um8TjfEgLmeIJhgZNqFFtLYLlqvlTb1
         fy10n3+Vpf3IDBnhE2H6p2kQ/j100UbMdWCsf0wkAmFzc6f+ktiR9+Hig4eXgnD9MfVL
         tyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=cedCfwQp7hiCDFaJH0M0+Hmp/z13xe5o+61KHaR130Q=;
        b=bH9hdXRMsZ1gFtqPjbvVwoKH4qOmC0qcseUcXhjtPRY6n+17IWRwKLQ6mv91Trrrl+
         3BwqsQcFeukoU24d8b/pV+UCHcQxk2quDqSwjGPkgabQmPT8n79HdOsFL6Jo7Sq5oNHr
         RN6ZCFnFt33VYqzU7Yh2WWRN/V7B8BqI14cw+S/YuZwsKKgMFeOb2R8TtGk39QPN5SCF
         uCeB27ZAPlZp5MsROHaqSjE1LF5/WBmlIsAm6Ltcjh513y8E9Fjpkr4SpPthbg1gTqay
         wcxPE20CACxfZqn0mq953OoyH+zwnd9pZ9zz/VIcLFPzkPkAxoaB84lBV6UCGpOSr/MX
         eyEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=TMulKWw8;
       spf=neutral (google.com: 2a00:1450:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com. [2a00:1450:4864:20::343])
        by gmr-mx.google.com with ESMTPS id b20si104562wme.0.2020.08.26.09.17.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 09:17:02 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2a00:1450:4864:20::343;
Received: by mail-wm1-x343.google.com with SMTP id t14so2360622wmi.3
        for <jailhouse-dev@googlegroups.com>; Wed, 26 Aug 2020 09:17:02 -0700 (PDT)
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr6758789wml.17.1598458621768;
        Wed, 26 Aug 2020 09:17:01 -0700 (PDT)
Received: from kamikaze.localdomain (91-139-8-18.customers.tmcz.cz. [91.139.8.18])
        by smtp.googlemail.com with ESMTPSA id u17sm8497216wrp.81.2020.08.26.09.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:17:00 -0700 (PDT)
From: Jakub Luzny <jakub@luzny.cz>
To: jailhouse-dev@googlegroups.com
Cc: Jakub Luzny <jakub@luzny.cz>
Subject: [PATCH v2] configs: arm64: Add support for RPi4 with more than 1G of memory
Date: Wed, 26 Aug 2020 18:16:42 +0200
Message-Id: <20200826161642.275038-1-jakub@luzny.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=TMulKWw8;       spf=neutral (google.com: 2a00:1450:4864:20::343 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

Add the required memory regions to support 2G, 4G and 8G RAM variants
of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
have one on hand and it's not available anymore.

Also moved the memory used by Jailhouse for the hypervisor and cells from
0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
gpu_mem setting of up to 256. The memory is supposed to be reserved using
reserved-memory node in the device tree.

To support variants with >2G RAM, the PCI MMIO config space was moved into the
ARM Local Peripherals address range, into free space behind the GIC.

Signed-off-by: Jakub Luzny <jakub@luzny.cz>
---
 configs/arm64/dts/inmate-rpi4.dts |  2 +-
 configs/arm64/rpi4-inmate-demo.c  | 22 ++++++------
 configs/arm64/rpi4-linux-demo.c   | 28 ++++++++--------
 configs/arm64/rpi4.c              | 56 +++++++++++++++++++++----------
 4 files changed, 65 insertions(+), 43 deletions(-)

diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
index 52fd3ac2..ac6d4f58 100644
--- a/configs/arm64/dts/inmate-rpi4.dts
+++ b/configs/arm64/dts/inmate-rpi4.dts
@@ -96,7 +96,7 @@
 				<0 0 0 2 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
 				<0 0 0 3 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
 				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
-		reg = <0x0 0xe0000000 0x0 0x100000>;
+		reg = <0x0 0xff900000 0x0 0x100000>;
 		ranges =
 			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
 	};
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
index 62442e7c..09dfc1f0 100644
--- a/configs/arm64/rpi4-inmate-demo.c
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -51,34 +51,34 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions (demo) */
 		{
-			.phys_start = 0x3faf0000,
-			.virt_start = 0x3faf0000,
+			.phys_start = 0x2faf0000,
+			.virt_start = 0x2faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3faf1000,
-			.virt_start = 0x3faf1000,
+			.phys_start = 0x2faf1000,
+			.virt_start = 0x2faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafa000,
-			.virt_start = 0x3fafa000,
+			.phys_start = 0x2fafa000,
+			.virt_start = 0x2fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafc000,
-			.virt_start = 0x3fafc000,
+			.phys_start = 0x2fafc000,
+			.virt_start = 0x2fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafe000,
-			.virt_start = 0x3fafe000,
+			.phys_start = 0x2fafe000,
+			.virt_start = 0x2fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
@@ -91,7 +91,7 @@ struct {
 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x3fa00000,
+			.phys_start = 0x2fa00000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
index 9e7fad26..cf36fa22 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -52,39 +52,39 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions (demo) */
 		{
-			.phys_start = 0x3faf0000,
-			.virt_start = 0x3faf0000,
+			.phys_start = 0x2faf0000,
+			.virt_start = 0x2faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3faf1000,
-			.virt_start = 0x3faf1000,
+			.phys_start = 0x2faf1000,
+			.virt_start = 0x2faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafa000,
-			.virt_start = 0x3fafa000,
+			.phys_start = 0x2fafa000,
+			.virt_start = 0x2fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafc000,
-			.virt_start = 0x3fafc000,
+			.phys_start = 0x2fafc000,
+			.virt_start = 0x2fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0x3fafe000,
-			.virt_start = 0x3fafe000,
+			.phys_start = 0x2fafe000,
+			.virt_start = 0x2fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
 		/* UART */ {
 			.phys_start = 0xfe215040,
 			.virt_start = 0xfe215040,
@@ -94,15 +94,15 @@ struct {
 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		/* RAM */ {
-			.phys_start = 0x3f900000,
+			.phys_start = 0x2f900000,
 			.virt_start = 0,
 			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
 		/* RAM */ {
-			.phys_start = 0x30000000,
-			.virt_start = 0x30000000,
+			.phys_start = 0x20000000,
+			.virt_start = 0x20000000,
 			.size = 0x8000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
index 92463184..7b6a7a02 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
+ * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
  *
  * Copyright (c) Siemens AG, 2020
  *
@@ -10,6 +10,8 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
  */
 
 #include <jailhouse/types.h>
@@ -18,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -27,7 +29,7 @@ struct {
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0x3fc00000,
+			.phys_start = 0x2fc00000,
 			.size       = 0x00400000,
 		},
 		.debug_console = {
@@ -38,7 +40,7 @@ struct {
 				 JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
-			.pci_mmconfig_base = 0xe0000000,
+			.pci_mmconfig_base = 0xff900000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = 1,
@@ -70,37 +72,37 @@ struct {
 	.mem_regions = {
 		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
 		{
-			.phys_start = 0x3faf0000,
-			.virt_start = 0x3faf0000,
+			.phys_start = 0x2faf0000,
+			.virt_start = 0x2faf0000,
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0x3faf1000,
-			.virt_start = 0x3faf1000,
+			.phys_start = 0x2faf1000,
+			.virt_start = 0x2faf1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 		{
-			.phys_start = 0x3fafa000,
-			.virt_start = 0x3fafa000,
+			.phys_start = 0x2fafa000,
+			.virt_start = 0x2fafa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 		{
-			.phys_start = 0x3fafc000,
-			.virt_start = 0x3fafc000,
+			.phys_start = 0x2fafc000,
+			.virt_start = 0x2fafc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0x3fafe000,
-			.virt_start = 0x3fafe000,
+			.phys_start = 0x2fafe000,
+			.virt_start = 0x2fafe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
 		/* MMIO 1 (permissive) */ {
 			.phys_start = 0xfd500000,
 			.virt_start = 0xfd500000,
@@ -115,10 +117,30 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* RAM */ {
+		/* RAM (0M-~762M) */ {
 			.phys_start = 0x0,
 			.virt_start = 0x0,
-			.size = 0x3fa10000,
+			.size = 0x2fa10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+
+		/* ~2M reserved for shared memory regions */
+
+		/* 4M reserved for the hypervisor */
+
+		/* RAM (768M-4032M) */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0xcc000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+
+		/* RAM (4096M-8192M) */ {
+			.phys_start = 0x100000000,
+			.virt_start = 0x100000000,
+			.size = 0x100000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200826161642.275038-1-jakub%40luzny.cz.
