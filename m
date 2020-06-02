Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWN63H3AKGQEAKN5HNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EF1EBDD8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:57 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id p24sf1016296wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107417; cv=pass;
        d=google.com; s=arc-20160816;
        b=d9wVI5FVsg3Ak7KkL6PpKUol8OYhiSVkL9Gfm0zAzKC1+lQAOL1YBZovH9K5m97BJh
         SD4oIBJN9N1h5dMue5FV7x0MKEeIWFqrkJwYACKOovxOa4OXPgTIS7USyJBc80JZXfxP
         DmX0Q+ivpQKdoMW+XIHu9/ZlLoYKNjE6oup30jLM/6kCNoWY+9XtDtW0jqUIead83+Xf
         D1UbO3hv/FAyPFgqsM452k1NRs/T1dyVpJH5VRMM/Tlxkz/4kDpW7aZcaoj/67WJNdVw
         b7I4D9BA7kj+/6bwmpXBXv+aYDZ6uLfhLlxfI9iQij5OoLUlR+K8Zfcl3o2fVhjcPfuj
         4QKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4PZKdcoNxYpVMr7QDft08HzJY/bSxAguaO68TNmuzOY=;
        b=mSDJtQWjrjtcIZ4TKia3IHJBIbnByqQLd4Kdrb9N+PRs48Xe+j536GGzInkECaMPpg
         lr5fG1jxc4k0XUEism+3/hjWngMIdCCQyZExv1EaAOAOWNz39CTO04CkStz2CRVbL82A
         WFp7tzrxRuIbRILHZuP+0WJ7anzOsrf9WkpTzDNGTja8nGokMAYsQ0nE3mXPzw/dTzxb
         o39QGLXDX9Kn/7LeZZO63Oe8m/ZxM8UPRGSGdGpJ1fTJLFF0gsMsgFzYzQbWEQp92uJP
         eBbVCbuUoTByuASKuzekXM6CP7iVKLI5/xvK6bjgYl8DZYGurqnBOC0fXP/0brGJTJ75
         ttzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4PZKdcoNxYpVMr7QDft08HzJY/bSxAguaO68TNmuzOY=;
        b=bWttLnCBE/i2Ixwgm07WYXGEwkdvl91jlo7mpHh14ylF+lViP8voidHveFK+qr1Otu
         0iPT6GIC7CRgprw5JdukMW7P+MIPJx7EPSA535MUOi8tw2Emk+vSY392O/Q2gHUvNkrj
         8uqXSdxiCp+3XFluFzBJDL/gUKFTKOItEFTNn57NoZbnFJ6AqqRAqSoxv52pAZE5Trpv
         IfwbogGnp09l37nQN4SPf97Il9+IpVrItZqdetxWUC5xp802qcz6+wQZQYvRA6sX4Eqc
         ROtTJ+GsqQYl7X33IWnQF6US2PRS0lapkonU+06hx8KsmngXjV6Ud6D5n1S7ebh3xEyL
         CVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4PZKdcoNxYpVMr7QDft08HzJY/bSxAguaO68TNmuzOY=;
        b=UOgmIZrEc7jN72cgPMWDJX6h9CRY9y4OZ8vncJLGfGaxUak+13uGgocOrnstIlggRE
         fphPPhsblGZzWFEk6L/QQ9MqxFFdehLD8fiXHn9jTM2vooHtByHthTyYw31tlfHMwPVU
         5oQTlA2mF/OAUtTFQ4g269G1YdHKAfpMAJcGZuoiLXp0DdmQ4fY/9Dp5e0KeGEmjfJ62
         aBJs+xEEt9EVM2B8H5l6XReGIKBkdzB8KG91INpCDgU/9e6dwIryVmElzDHzBAFK0wrg
         NDRRL0UcyDWf9h/5z5P7Yw/5gLodelVqBYd8jby1JXb/6zxmfRd+FBkIRczmQesQ+/5T
         8jJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bj4ss90QigI5L6ZqEcaZsyCeYkUT5BM9OnFlufzOVk2OuoGun
	3AtCiKMX+fO0VZwP+A40tA8=
X-Google-Smtp-Source: ABdhPJy+gDzGkTBW8BAsm0lgj8rXiGq5PV3FgvI9ESFYnrRb4BcB2EXnBhYC1ztK2MO6HgKTs3JoQw==
X-Received: by 2002:adf:f64e:: with SMTP id x14mr27751507wrp.426.1591107417658;
        Tue, 02 Jun 2020 07:16:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a545:: with SMTP id o66ls1665847wme.2.canary-gmail; Tue,
 02 Jun 2020 07:16:57 -0700 (PDT)
X-Received: by 2002:a05:600c:21d7:: with SMTP id x23mr4588257wmj.95.1591107416966;
        Tue, 02 Jun 2020 07:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107416; cv=none;
        d=google.com; s=arc-20160816;
        b=dbYBLnP0a0helY2kJX3EVLmt90XPsRosCxQbVtxjjK2eAX/xjNPHM7zyJqzJJ2D2mS
         zbqRuWK9Q04WaTEbUeTDiDEC7O/3jco9Dp9UlrGDrNhsQSCWIzJdXaxEK1MLSm3WLnP6
         1i1daVgoaSW5YGt9Gm3yK7I+hDtHC84liVJVp9/GeCJN9Hu9HnyTLHryDsT/312A8SPq
         FnN9J89QodURVfDBjLMuu4PZaRdWdBzfIndezIwBgiSEhEERBr6mXXinuCt4/pXdmPpR
         OoFZNzRtnylX/8dzG2bs5CeEtJ5TQ2Mih2jHB8sdaYifrpyAl5Z9ZG1SazUvMH2eXgL2
         aCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=iw34Mqpx6n8Hgzoy/IaPy+IHrWDX760yco2G0bfSx/U=;
        b=iodVtC9QWlWQLCiPLe7HyZLytw3J+50u2a87CldHSQkTEIQP7nkTPQJaGgRwlBUIkt
         QOrdgyqoZXZUna3+WmS+ocZyuyJdg6c476R+xynCbTbLu6Nhsswcb5EiP2I0Gp7HMPYW
         UeLsXwzJMLaLSiTchAyvvttGOGdArMm0B9PeNKzgSQqrqe3xbi4n4XfGXHYzNsqaOiII
         epWkAVUNybKh0i66b9cu1A5d7UNdGYv+q8I3R0f3gmIhgB8ajHh1tr9KE8KDkPnbvpnL
         e1LjoKnXzhq9PY8UUWSayZRhQKUplw2VVbaT31oaT15ADHQvC7i0Gu/WLPn6F1VR+pxZ
         ZwOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m16si244175wmg.2.2020.06.02.07.16.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGuiB000859
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:56 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdM028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:55 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/15] configs: arm64: Align ultra96 config with qemu-arm64
Date: Tue,  2 Jun 2020 16:16:36 +0200
Message-Id: <95392673a20aed22dd7323b4c098022a729828e3.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

This both fixes an overlap of the ivshmem region with root cell RAM
region and adds full ivshmem demo support to the three configs.
Reference was the qemu-arm64 config set.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/ultra96-inmate-demo.c | 75 ++++++++++++++++++++++++++---
 configs/arm64/ultra96-linux-demo.c  | 59 ++++++++++++++++++++---
 configs/arm64/ultra96.c             | 57 +++++++++++++++++++---
 3 files changed, 169 insertions(+), 22 deletions(-)

diff --git a/configs/arm64/ultra96-inmate-demo.c b/configs/arm64/ultra96-inmate-demo.c
index b9524c37..c61130a1 100644
--- a/configs/arm64/ultra96-inmate-demo.c
+++ b/configs/arm64/ultra96-inmate-demo.c
@@ -4,7 +4,7 @@
  * Configuration for demo inmate on Avnet Ultra96 board:
  * 1 CPU, 64K RAM, 1 serial port
  *
- * Copyright (c) Siemens AG, 2016-2019
+ * Copyright (c) Siemens AG, 2016-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
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
 			.address = 0xff010000,
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
 			.phys_start = 0xff010000,
 			.virt_start = 0xff010000,
@@ -65,5 +102,31 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf9010000,
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
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 102fa754..f1f32fd2 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -4,7 +4,7 @@
  * Configuration for linux-demo inmate on Avnet Ultra96 board:
  * 2 CPUs, 128M RAM, serial port 2
  *
- * Copyright (c) Siemens AG, 2014-2019
+ * Copyright (c) Siemens AG, 2014-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
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
@@ -45,12 +45,45 @@ struct {
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
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
 		/* UART */ {
 			.phys_start = 0xff010000,
 			.virt_start = 0xff010000,
@@ -89,17 +122,27 @@ struct {
 				1 << (54 - 32),
 				0,
 				0,
-				(1 << (141 - 128)) | (1 << (142 - 128))
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
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 51996861..f917dc34 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -3,7 +3,7 @@
  *
  * Configuration for Avnet Ultra96 board
  *
- * Copyright (c) Siemens AG, 2016-2019
+ * Copyright (c) Siemens AG, 2016-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -18,16 +18,16 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
-			.phys_start = 0x7c000000,
+			.phys_start = 0x7fc00000,
 			.size =       0x00400000,
 		},
 		.debug_console = {
@@ -67,8 +67,39 @@ struct {
 	},
 
 	.mem_regions = {
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
 		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xfd000000,
 			.virt_start = 0xfd000000,
@@ -79,7 +110,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x0,
 			.virt_start = 0x0,
-			.size = 0x7c000000,
+			.size = 0x7fa10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
@@ -96,13 +127,23 @@ struct {
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
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/95392673a20aed22dd7323b4c098022a729828e3.1591107398.git.jan.kiszka%40siemens.com.
