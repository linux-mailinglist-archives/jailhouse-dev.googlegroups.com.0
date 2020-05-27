Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBYF3XH3AKGQE4STUGUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93e.google.com (mail-ua1-x93e.google.com [IPv6:2607:f8b0:4864:20::93e])
	by mail.lfdr.de (Postfix) with ESMTPS id 210881E425B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:32:34 +0200 (CEST)
Received: by mail-ua1-x93e.google.com with SMTP id w24sf7111947uae.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:32:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582753; cv=pass;
        d=google.com; s=arc-20160816;
        b=JhOKRjvb2Q6296anB67bfubIsy6mbGMPxEi80i7WoZPosZ1sNBkt5nTk7sCBT9Te2h
         ltVxOfISrpymnpElyJb/N4Eu8+ZAO7Soxi+B/JtY31YDL1y1uZKCaJ2RaE+KIAZMFjor
         48zfadUTHv5rLKblcEOawQtxYXqPMOppAGt/ykM3ObpPJp4Hswid4Fwx6pMm8HoLeMHi
         Ir30knQxVzZnzNFTPz6go5+CXuNpATU1Dl2u9iDy/HKt3xmOgbowiB6XKo/IXW+M0DJG
         EZCfhPSlTLY4Uuo/+24n3epy6AbntfmQyB2nrlS2HUxy7u0RjMAV7CZFFBygpoRL7h7P
         Zxvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qRRAhFk6pvyrui4GZQ36zxncJ6WlsBS23sWJcSPD/oc=;
        b=pmTZvt37GYXj9/VE0zJXyhlZq5SQw89zGC3kowI+xSUC79a35YmXpyeOTQyMeGLO8r
         t+t+Qr0cnj3RKy7EuWdQ4qm2dJs8RcK9Q6ia7/rkU8fzjG1zkwhYC8mTdvVyYIhBBjxO
         Y4+R4WiwoPeEhYJwCUFBYZI0+YJjpw79qgw3lci2oJo0a2eOqBJaw6S8qxWmbXwt41gZ
         1qmN2o7VLmBeib6iVdKkworvLgGIX/39YZdyDiwDbAS9lAeusNjjsqkdRtWHvKp3et8D
         jvqghkguLyVf65XnDA0/dm5N+v6s17fsPABZSU3NPfTPuQ+LOuGoT6o0z/vVxA2UhFFl
         D79Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lQThctUL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qRRAhFk6pvyrui4GZQ36zxncJ6WlsBS23sWJcSPD/oc=;
        b=ZU92Btn09tY/QkuJ5bdghNV/uZPXmGWGCYFRjjrzQRI8xRNACLTs3mOOmw5hKmEZPM
         wvMBdBr45cjfdnIwgj0oxVEDqo5OlHGJ4cIKBtyQcvkmD/z4i578QZLgzfGNgS5LxhNa
         Tq4XUe0HRucuUfnE6h59R4apUR/iUKQrxCVq9rdXKt8wPLKbDY1SEYwThHdg2VFladTV
         0oTyHTcZ20lbvf4muFgnocns3pvh+ZRwjOXKb+AMydx03sy3YX2YKMi0XQbLh2v9uwMw
         7M+MjcllQSkuGS3GyxTy77oNfJREozIWdNXiRfeeLRIby10FD0NdhwmlDX1hi0eKBc7F
         ygag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qRRAhFk6pvyrui4GZQ36zxncJ6WlsBS23sWJcSPD/oc=;
        b=ehBMHZHqhrC5cZAeGKIHZ3/mhcA1PfJKQYFPqfS5e/ZDysjg/0o3GUlFFVcRygf8/w
         3gCa5d0Ixe6rOeBG3rOiZsaldIW9sCN3YlC491Psl+t/o55Akq0joBvy19WaXNjsoORc
         fXy8yceRBvOub2/7pb2N5+YcujVdovXBLBQ/9Ys9L+mpVkxLxtZ2421+rTPn5jVTpkAr
         Uocdp6MQrOTfDOyzvlBwZtRf4hKBoPR1nDfBYR5VV/x8Ayef14tZ2o4AC/B/rFWc9Onv
         xEU66QjlIyXyF6YHGi0m8azFuuKVC5RdNVvQsWxeMF4s0s+QIS6GEhiE449ndQhZ2OEH
         W6ew==
X-Gm-Message-State: AOAM530r1zUdwa3sYyzUe+rDr88SIuy+qEVrgBjyfDI3jBmWmZreVHaB
	2R+gCDG+Ho/S0f8q3ZWruHY=
X-Google-Smtp-Source: ABdhPJyPvpZ03BFa7mFY5GNzKenOdO77EO1LRI413izkJUJ5Y05wJ0F6oDa6GR4mHYbXO+gu8B8GjQ==
X-Received: by 2002:ab0:473:: with SMTP id 106mr4512333uav.72.1590582753031;
        Wed, 27 May 2020 05:32:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:6e8b:: with SMTP id b11ls933876uav.7.gmail; Wed, 27 May
 2020 05:32:32 -0700 (PDT)
X-Received: by 2002:ab0:36d9:: with SMTP id v25mr4292634uau.126.1590582752428;
        Wed, 27 May 2020 05:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582752; cv=none;
        d=google.com; s=arc-20160816;
        b=o9rWxNgtQx1MMrFcrhKEl7zXa4OqHGS5k4GfQKOH/lWI25EOVh7BX2COqUEjpkDA52
         JNyZw9b8m4uIsWHdKe1oTm4scqxMIrEK01WJMqvWVB3ILHM4Omek7huUZziHm/f5dqHo
         g1Cf46/wnC4h2oe63riEUzeGMkKVj/DYXjTBgq0OcWQmnsKpnpTYIJ+HxeFyKrhslarn
         V9LYT84ZwUctNDqurM77JlVZBuwCrmtQEnnGFFq1ZysuuhAMpnnVu26ErFkff6/LEga7
         1Pj3mPWTFQ90Ik9fYuTWTH2pQ7AXEjsw94QrBCz++ZUz4xTyqhM7nfFzO6IauVVtm0/v
         coaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=o9tr1+OQ3NxPou819Z3of7d+aHAIHYPZRYVmxQVJE60=;
        b=bnJpMKZY87jxHFHg4zLE4IfnYkhgwac/ouz7lzirtUwjpIg3erq86NSfFiyAICi2a2
         QrbDus9huj120x7jiXPOMvZ2fFv33Aw5ZJfQomGaNYMlkckrrEi6Ok0VnMg8OaE7iv4E
         cD5sfqYtuUrpVaPb4VP6bPmPhnekmZQfIl7z6hRCiBEvRPQo2E9L8wtZr09ViC8Jtw/X
         K7GmQvDj1MkqP91tUEbdVL0lS9XP6E/La9VUNoq926LESDuAN5T324ZX2b3w301pNCed
         8uNGjTFQcDJ13o9KeN3zK69iV/9gLAH192W94otGPjjRkt+JhMVioW3qJ+4N23VTeD2F
         SrDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lQThctUL;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id a126si174384vsd.2.2020.05.27.05.32.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWVQr080850;
	Wed, 27 May 2020 07:32:31 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWVeh073838;
	Wed, 27 May 2020 07:32:31 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:32:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:32:31 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWPj7096152;
	Wed, 27 May 2020 07:32:29 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
Date: Wed, 27 May 2020 18:02:23 +0530
Message-ID: <20200527123225.31726-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527123225.31726-1-nikhil.nd@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=lQThctUL;       spf=pass
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

Add a virtual PCI device with IVSHMEM type (id = 1)
Create IVSHMEM regions for 2 peer communication
Enable the vpci_irq for doorbell interrupt

This allows to run the ivshmem-demo baremetal inmate
inside this cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 7440a258..e09c4850 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -20,7 +20,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -30,8 +32,9 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
+		.num_irqchips = 1,
+		.num_pci_devices = 1,
+		.vpci_irq_base = 195 -32,
 
 		.console = {
 			.address = 0x02810000,
@@ -48,6 +51,33 @@ struct {
 	},
 
 	.mem_regions = {
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
 		/* main_uart1 */ {
 			.phys_start = 0x02810000,
 			.virt_start = 0x02810000,
@@ -68,5 +98,30 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/*
+			 * virtual PCI SPI_163		=> idx 1 bit [3]
+			 */
+			.pin_bitmap = {
+				0x00000000, 0x00000008, 0x00000000, 0x00000000,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527123225.31726-3-nikhil.nd%40ti.com.
