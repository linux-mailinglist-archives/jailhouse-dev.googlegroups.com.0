Return-Path: <jailhouse-dev+bncBCZKRDGF7APRBOHX5L4QKGQER6HMJBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DFC246DE5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 19:17:45 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id f14sf2985773ljg.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 10:17:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597684665; cv=pass;
        d=google.com; s=arc-20160816;
        b=bXiopQlqysnWZhejwO45nIZPB+qRGap0pAK+qxl1maNL3FJzaC30qEoldfSQhfGFpU
         NxaMyniyIZ3omeKfZrMU98T2icFsaAp1LpAiC33bybd1so2LIWNv9luNlA+l+qPtVkcy
         +K4LkCPEFI9Xw9L6GxhBpO1E1jNKjS77JI17hBD837a6F+9jG1lf8jkSDv9bA3i3GJY5
         2XBYUkCou99vessvUPcYy/9VXqA4pYtJ6ySj6aus3XDwXoy3m9A0I/J8m2Y673OA6DoR
         EZEe+zcS1VmKhtUhP007wxZs3vQSXbCubfG6dFlUxB3UNHDeQNlZ7j8g5V/Zd1GIpZ3W
         R3eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=J3SkcmcdkiMTT/w/rTJilfgONMORYg6sGE0y9zf0XTY=;
        b=fhPwgbZk7hv1NE/4EjxXGYo6qaap+3lcqvW2m8zGov8xGer31b1Fz86lnAhp1zKsfQ
         Fht6sjZwFE0zovVF5LiS6Z2LDSgebQw/g5kFh7cf2CR4B3WseN0UfmnZyHkQLxMyHmQj
         LoHCflLyKhBvWuslojETRYuKh5TulDYklCpsgGutUJJ4w2Y2uXChdox8dQOVOIhkhMEs
         2jPbp3OM4nyGkEIraNJ0kpfwIZzU9I4EEYIygkjU8Wn8xFvd7KU5quD2odlGTyMqqma3
         hrnEEapqQ2p0hwLhyWI42nVx0lOx1Ogp/yJAXNWvVsXqoxb6uUiQruWRtee5yvrEHv/p
         +rXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=h0hFBSUh;
       spf=neutral (google.com: 2a00:1450:4864:20::641 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J3SkcmcdkiMTT/w/rTJilfgONMORYg6sGE0y9zf0XTY=;
        b=q+Axh+qqqGPrw/xF5yQujCvx0d0fa2EiTUguzw2HLo41/UXXs/Bko0PIYFegfhF1gY
         ArbkME+aRTz9XpN8nMv/rkMp/eUItHvIjT+97pIhgHlf99WLqe1BS06HWcu2iYN/omfD
         9VekGx7GAbrwFQkALl81QYiN/sG3Ox7U6CAa8pF7d1L53bmcy7CNeE0UFM81crhtoz+0
         PPa2k6EcBEkRsZLw/on6Dql5nZShBEZMhCSVIO42WiSBEGbI2cwU6gqU5STbucJyOzxJ
         zlQlikPQ/SaQzYk7uNoUpnVeWPqTTMcJ6zULmXG2Iuon/qNJU9CQ3hd3tQuHTzKc53Xx
         CygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=J3SkcmcdkiMTT/w/rTJilfgONMORYg6sGE0y9zf0XTY=;
        b=gWC6JOpySOqeUmf//zboHpyeXnHlsy7Qhl5QoTFbRIT37u4LZc+QvcCZvsqV9VdGRR
         HbgkjauuE+pCwj6V18cJUqEwDrx2bSwh0rrTvKT9ACA/ivteKyoEo5bKUHqaCSLp1n1F
         JXNSDk5ureg8cT2zAwvVTZ1exK07L6xZ7cbd7kzmmHzHPuw8Ur0sKKDJLQpYxDQLgFk/
         PQyr1b7hHPke6AyLavZ7FVvnqxeXHRd5AKAtLY1glVt7ZvHKu6UyZmFqkhziFKFVkPmA
         lz5Xa0EciyuqH4+GO0QkRONPCXF1b8Z1HhWqqCJYD3l4xKiu1STV4G4pO67o02i97p+B
         w8qQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530TrQpX0Y4IOwvhJDddiptnRnE+Va6y5U1UCAFvpqLesytPpUsp
	KC5rHk2VCfNQSOMeimyRa58=
X-Google-Smtp-Source: ABdhPJyWXi9Use6GA716u1+lyJHz/OaFfbxk5L+fmorzoQB1tyZSU7GDaSi/HMs7p6ccHghkfZoyxw==
X-Received: by 2002:a05:651c:1344:: with SMTP id j4mr8434659ljb.164.1597684664976;
        Mon, 17 Aug 2020 10:17:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4845:: with SMTP id 5ls248331lfy.2.gmail; Mon, 17 Aug
 2020 10:17:44 -0700 (PDT)
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr7911774lfq.89.1597684664242;
        Mon, 17 Aug 2020 10:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597684664; cv=none;
        d=google.com; s=arc-20160816;
        b=waTWHyXSEtq2PDqCMTFAfSeH6gdm0esRbE9/pdP1HPHwqL2HEWo+aBUYGHsApCslEE
         EuySPbqF4pcn1yfdb0U+UiCMi+ys84tyznbKyeOTxJr7hqIdBOlz6tP4h4qa8Sr1MilB
         3uSqr1ObijElSN4GsFT8SiOhti08iVmxMAUvOK+HAP/JEzy0NtcE2py5T0jsCqKd6HV8
         5alhfQky11/e1P+QzP4BwlgSgJ/u/FP5ZgN6FJ7T5nYtFAO4iL0Q35mAyacktSJNI3Wa
         VZUle15n2MiiJerAI3quHKlMnrni3kKeOeu0cR0QhxgmScSnIYxWKD+k4nLTcenxj/hU
         Sv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lNp9qYfBAmhyKXcPT1EbPjQ5I2qsAX7M9jnZPHh7Sfc=;
        b=UsqTiuIm8abT/6H4T/adTO3k72M+cdKgSoqKGkD+N70sBdxGnEhjt5Wc3tsLsV66fg
         UnFtKXHgfQlI4KUa8Hgojin/I6tlbCyqQgBdIXBu3GhOoaU9OTBAPmNawV9zW/n9qAFQ
         ZX5yykynM7aYxPX2HAh6YYD8q8LBPk1QplnT94fLIz/99NJAnqufQfEQQYwoVdVpEz6a
         3qoRbqZpSVhg1CH5fN8ScGsqzY7I7Fr7FhfhKKj7edLqkoL6ePeS8oemK7nqksAU9YEO
         oy0/YvYbJKMxFYMo0b81QdeviblvX3aO2emOZ32GxG/P5dPjaq3AfVcruU9X6n+D+Sto
         OwGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=h0hFBSUh;
       spf=neutral (google.com: 2a00:1450:4864:20::641 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com. [2a00:1450:4864:20::641])
        by gmr-mx.google.com with ESMTPS id a23si784192lji.7.2020.08.17.10.17.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 10:17:44 -0700 (PDT)
Received-SPF: neutral (google.com: 2a00:1450:4864:20::641 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2a00:1450:4864:20::641;
Received: by mail-ej1-x641.google.com with SMTP id m22so18606255eje.10
        for <jailhouse-dev@googlegroups.com>; Mon, 17 Aug 2020 10:17:44 -0700 (PDT)
X-Received: by 2002:a17:906:248d:: with SMTP id e13mr15721617ejb.169.1597684663016;
        Mon, 17 Aug 2020 10:17:43 -0700 (PDT)
Received: from kamikaze.localdomain ([46.39.173.230])
        by smtp.googlemail.com with ESMTPSA id di5sm14096169edb.16.2020.08.17.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 10:17:42 -0700 (PDT)
From: Jakub Luzny <jakub@luzny.cz>
To: jailhouse-dev@googlegroups.com
Cc: Jakub Luzny <jakub@luzny.cz>
Subject: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of memory
Date: Mon, 17 Aug 2020 19:17:36 +0200
Message-Id: <20200817171736.78100-1-jakub@luzny.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=h0hFBSUh;       spf=neutral (google.com: 2a00:1450:4864:20::641 is
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
reserved-memory node in the device tree. To support variants with >2G RAM,
another region for PCI MMIO space has to be also reserved.
---
 configs/arm64/rpi4-inmate-demo.c | 22 ++++++------
 configs/arm64/rpi4-linux-demo.c  | 28 +++++++--------
 configs/arm64/rpi4.c             | 62 +++++++++++++++++++++++---------
 3 files changed, 71 insertions(+), 41 deletions(-)

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
index 92463184..c25bd8d2 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
+ * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
  *
  * Copyright (c) Siemens AG, 2020
  *
@@ -10,6 +10,9 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
+ *                              reg = <0x0 0xe0000000 0x200000>;
  */
 
 #include <jailhouse/types.h>
@@ -18,7 +21,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[15];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -27,7 +30,7 @@ struct {
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0x3fc00000,
+			.phys_start = 0x2fc00000,
 			.size       = 0x00400000,
 		},
 		.debug_console = {
@@ -70,37 +73,37 @@ struct {
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
@@ -115,10 +118,37 @@ struct {
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
+		/* ~6M reserved for the hypervisor and the shared memory regions */
+
+		/* RAM (768M-3584M) */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0xb0000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+
+        /* 2M reserved for PCI MMIO space */
+
+        /* RAM (3586M-4032M) */ {
+			.phys_start = 0xe0200000,
+			.virt_start = 0xe0200000,
+			.size = 0x1be00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200817171736.78100-1-jakub%40luzny.cz.
