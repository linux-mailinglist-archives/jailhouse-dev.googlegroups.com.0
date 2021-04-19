Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPB66BQMGQEY3HEFPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7C364CCC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:38 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id a19-20020a194f530000b02901ae58050516sf2074642lfk.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866397; cv=pass;
        d=google.com; s=arc-20160816;
        b=b2Ie2fnZPzH4dlpv5w3HEYb68YC4N/64vbFXJ8jIvZQs3I7vMoIskfNPS2FP57Dgur
         UUZ6dy7TEVWSryN5v3v0EDTfZcwfj/c5nnAA7VBhor/CXUL94etGQNiqE7ZPyD5PErbA
         TiCAf8tQUKc7uYSparhGfAFvvCnUmeatotgtWIrS6/YkkZxSSj7pMAYTE5FdoMzdda+6
         3yIMX9UPH/VL8hzasy9BEtZjOXhMrIsxuThSHHjgFS7m2dFYBOS1IY1FPXLsnJfQiAa+
         cZ+4uDwOVK2xR3oQVWP4hbfLpu4oOAGLg7qShzaO5Q5T9lhmHZFPuNQFf669AfHzDVd+
         mXJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=DvgX+EapBBJ3SU6y/AS9JokuSvzMCgKYQKzuttUOMjc=;
        b=l1cBmSKpOQkxWwH91vkhOxBKWKG3FZJTkCIKba0zzmghzyzubdn1K6Cnb8cMCwSWg2
         7DmBZ42ezRLNtjxxoWqZtuwQkcBBHOzf+7nEptCAhp3hWBq57Vv4cJqOizcEac3qtXyN
         3sqS04l5Bd6st+/6gmqn1fzRMg7bIVF9z5YSCdoM5RLOx/0Prxk5UpTB4LNOaj3PoNJE
         XuY+UkiNgYR9Ur3Ch7sEtoIRG4lCDu2JMSxq2QYGSzEH4/7QU8rU2JXiYru4X8/Qj9up
         J2PZHew8yNes6iGTCO3hj5M8AfdKrkXt4d1xKO5eaI2X1Tr9wXAOv/f+uG26YKFFC9B3
         z8aQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DvgX+EapBBJ3SU6y/AS9JokuSvzMCgKYQKzuttUOMjc=;
        b=eG1L5Te+H/FOtL2IY7uod/zrEzxtl7kesREB1Jpa0JLvrd/uVWZKU7+Fofe75F0lDf
         9+6mJpte1DVchBgyaEk29QgjgMglAb5gxRyDkoOJbu5wEJi8EzLRbpGFCmByaBndhgYD
         0m/8oGuFaHUHNmn0XHEhEDrlca4noYTtSopgf/PQwesFX4erXeE7A/spI99NV5B6YB7Z
         X/3UPX6Nkmxif8lFtINEesaQr2clUVrhiXng/DmDlrvFBTc/yzg8j7libwZY7cZlU9cM
         uoHD+Sxow/Em3RUC0Eb2okZKmck4ECbN8lVnCMzIo6bjthSSaep8sVwB3PcYI6frhOse
         4Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DvgX+EapBBJ3SU6y/AS9JokuSvzMCgKYQKzuttUOMjc=;
        b=rmawiegn9REM92vSObhW5Eqv0rMKslwDtqPU4EA5YA5XeTAccYqylMur5dOI4OAtF7
         rINmu4Ic+BU3SB+0GGvdIp4MhAjNEfl4TjG+54IxBl/M59l6yFhf+dEwy23Xvp8beYjN
         l3/S98wDNOOvcAGbTyfYe7GCLvutcdmP6frc10M0dgnC4dv6TDvdLhEMm+Iq0cR97u1W
         kLL+nwB4Z5XS+DjcBnoA4daflaKh9T3XSp8Fa1J/Ld+wCmMe0mi1+63gBw/uauAU300a
         bIic3EdsD6rgZtKXInEqaz14RaDFxON8Wi9Wbet5jQyPwTvyJ6cSjHNg4f6cMI9S9mt7
         9A1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Yv5QqmMCVJy6ghNbZ8BCwh1ZuMyWTL/u4mG21rKTzYOIhJfop
	S6nFmElPAowEgCZeIXLg9Ok=
X-Google-Smtp-Source: ABdhPJxWZeawUgjJ0ncCYl2B52wE5mkKn0Nl/BmT7WDw4bJxtkU5mDS/1v0/FNp29j+lDRuUxjER+g==
X-Received: by 2002:ac2:5399:: with SMTP id g25mr7540580lfh.433.1618866397653;
        Mon, 19 Apr 2021 14:06:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f815:: with SMTP id a21ls468928lff.1.gmail; Mon, 19 Apr
 2021 14:06:36 -0700 (PDT)
X-Received: by 2002:a05:6512:24f:: with SMTP id b15mr14057379lfo.51.1618866396386;
        Mon, 19 Apr 2021 14:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866396; cv=none;
        d=google.com; s=arc-20160816;
        b=UsKNOaAmMNJ8NfbPHt059z5E/1EpLRYNNH1A2gOBsDTy30ivXD8OqVWkcS8ZpkC/u/
         RhJIDOXyi2gI5YEWKHH2ZeZhmsp01GcYJpRspk6D9RkOyjJ9FChZiGoOF+BeWvkd5T7V
         YZCeXg1EFhhYIGIk+21+xAQKdVzERbCkj8GnbYrYh99ERnGav0kJr1Xr0A7GZ/FSZhu+
         KPJbpnnAp5mJ2sroG3g0X53zs9lcu4uyg0hhGkiJmX7LTj771+WqsqsOozAOvhlSFtgg
         vxu1CVecwhIdv+pPOH99dSneauoFbvBpt8bjSh4NEFLxv0nLLHPVW9Fr/j/Fb8p29YMV
         8bSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6ajXud5xY739vpun3l96ReAoNmcVc9jAtQIQO8ptUOw=;
        b=cmSQRlFa5JZZ2EOdgJot2jJy3Kp7X6eYHQaqqp48hOsfQkfVvPZkMzJMz2RPzZX6er
         rH0uHtIC7ij/IdivTLLU8jsR9aMkwkIPBqnp2zhH/QBxMDiBJoqUfPv14TJXevftjY5/
         6IBCS6KsyXnp30rRTUFCcN+R3gW7Xv6m3s+FEaDSNK6QzGN2BEM5DPiZejmDQY+8gote
         0L9AsuP5WDkkmuKAoaIaOmUIkAe51hG63Xy0NldgSgGGmWGj95riRgrsK5VFBUA+iduK
         KtRT+k66GL7BQJmyqgRlAoW51zvg6ASaBNwyD5fvCn7Itel/gcD873ChzschEjlWgkr5
         luUA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j7si1038965ljc.6.2021.04.19.14.06.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6Y3H022132
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpl015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 18/20] rpi4: Move jailhouse reservation
Date: Mon, 19 Apr 2021 23:06:27 +0200
Message-Id: <e38dd12746bbba6fa3cca1dcae930931f7eb383e.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

This is needed for using the upstream kernel and is part of the
Jailhouse development branch already.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../rpi-firmware/files/debian/jailhouse.dts   |   4 +-
 ...i4-Move-RAM-reservation-down-by-256-.patch | 257 ++++++++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |   1 +
 3 files changed, 260 insertions(+), 2 deletions(-)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch

diff --git a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
index 1a4f8ab..b51163e 100644
--- a/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
+++ b/recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
@@ -11,8 +11,8 @@
 				#size-cells = <1>;
 				ranges;
 
-				jailhouse@20000000 {
-					reg = <0 0x20000000 0x10000000>;
+				jailhouse@10000000 {
+					reg = <0 0x10000000 0x10000000>;
 					no-map;
 				};
 			};
diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch
new file mode 100644
index 0000000..dff3f15
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch
@@ -0,0 +1,257 @@
+From 6234762737513985d5de14d860773ca3257f858c Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Mon, 22 Mar 2021 23:18:05 +0100
+Subject: [PATCH] configs: arm64: rpi4: Move RAM reservation down by 256 MB
+
+This is needed in order to switch to upstream 5.10 kernel. It refuses to
+reserve the formerly used region, apparently due to conflicts with
+pre-existing reservations.
+
+Beside adjusting the cell configs, we also need to update the inmate DT
+because it now has an overlap with the physical inmate RAM.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm64/dts/inmate-rpi4.dts |  2 +-
+ configs/arm64/rpi4-inmate-demo.c  | 22 +++++++++----------
+ configs/arm64/rpi4-linux-demo.c   | 28 ++++++++++++------------
+ configs/arm64/rpi4.c              | 36 +++++++++++++++----------------
+ 4 files changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
+index ac6d4f58..305ac22f 100644
+--- a/configs/arm64/dts/inmate-rpi4.dts
++++ b/configs/arm64/dts/inmate-rpi4.dts
+@@ -98,6 +98,6 @@
+ 				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+ 		reg = <0x0 0xff900000 0x0 0x100000>;
+ 		ranges =
+-			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
++			<0x02000000 0x00 0x20000000 0x0 0x20000000 0x00 0x10000>;
+ 	};
+ };
+diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
+index 09dfc1f0..1bc244f5 100644
+--- a/configs/arm64/rpi4-inmate-demo.c
++++ b/configs/arm64/rpi4-inmate-demo.c
+@@ -51,34 +51,34 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions (demo) */
+ 		{
+-			.phys_start = 0x2faf0000,
+-			.virt_start = 0x2faf0000,
++			.phys_start = 0x1faf0000,
++			.virt_start = 0x1faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2faf1000,
+-			.virt_start = 0x2faf1000,
++			.phys_start = 0x1faf1000,
++			.virt_start = 0x1faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafa000,
+-			.virt_start = 0x2fafa000,
++			.phys_start = 0x1fafa000,
++			.virt_start = 0x1fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafc000,
+-			.virt_start = 0x2fafc000,
++			.phys_start = 0x1fafc000,
++			.virt_start = 0x1fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafe000,
+-			.virt_start = 0x2fafe000,
++			.phys_start = 0x1fafe000,
++			.virt_start = 0x1fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+@@ -91,7 +91,7 @@ struct {
+ 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x2fa00000,
++			.phys_start = 0x1fa00000,
+ 			.virt_start = 0,
+ 			.size = 0x00010000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
+index cf36fa22..f93c564a 100644
+--- a/configs/arm64/rpi4-linux-demo.c
++++ b/configs/arm64/rpi4-linux-demo.c
+@@ -52,39 +52,39 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions (demo) */
+ 		{
+-			.phys_start = 0x2faf0000,
+-			.virt_start = 0x2faf0000,
++			.phys_start = 0x1faf0000,
++			.virt_start = 0x1faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2faf1000,
+-			.virt_start = 0x2faf1000,
++			.phys_start = 0x1faf1000,
++			.virt_start = 0x1faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafa000,
+-			.virt_start = 0x2fafa000,
++			.phys_start = 0x1fafa000,
++			.virt_start = 0x1fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafc000,
+-			.virt_start = 0x2fafc000,
++			.phys_start = 0x1fafc000,
++			.virt_start = 0x1fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		{
+-			.phys_start = 0x2fafe000,
+-			.virt_start = 0x2fafe000,
++			.phys_start = 0x1fafe000,
++			.virt_start = 0x1fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* IVSHMEM shared memory region */
+-		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
++		JAILHOUSE_SHMEM_NET_REGIONS(0x1fb00000, 1),
+ 		/* UART */ {
+ 			.phys_start = 0xfe215040,
+ 			.virt_start = 0xfe215040,
+@@ -94,15 +94,15 @@ struct {
+ 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x2f900000,
++			.phys_start = 0x1f900000,
+ 			.virt_start = 0,
+ 			.size = 0x10000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+ 		},
+ 		/* RAM */ {
+-			.phys_start = 0x20000000,
+-			.virt_start = 0x20000000,
++			.phys_start = 0x10000000,
++			.virt_start = 0x10000000,
+ 			.size = 0x8000000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
+index 7b6a7a02..68bb1a24 100644
+--- a/configs/arm64/rpi4.c
++++ b/configs/arm64/rpi4.c
+@@ -29,7 +29,7 @@ struct {
+ 		.revision = JAILHOUSE_CONFIG_REVISION,
+ 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+ 		.hypervisor_memory = {
+-			.phys_start = 0x2fc00000,
++			.phys_start = 0x1fc00000,
+ 			.size       = 0x00400000,
+ 		},
+ 		.debug_console = {
+@@ -72,37 +72,37 @@ struct {
+ 	.mem_regions = {
+ 		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+ 		{
+-			.phys_start = 0x2faf0000,
+-			.virt_start = 0x2faf0000,
++			.phys_start = 0x1faf0000,
++			.virt_start = 0x1faf0000,
+ 			.size = 0x1000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		{
+-			.phys_start = 0x2faf1000,
+-			.virt_start = 0x2faf1000,
++			.phys_start = 0x1faf1000,
++			.virt_start = 0x1faf1000,
+ 			.size = 0x9000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+ 		},
+ 		{
+-			.phys_start = 0x2fafa000,
+-			.virt_start = 0x2fafa000,
++			.phys_start = 0x1fafa000,
++			.virt_start = 0x1fafa000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+ 		},
+ 		{
+-			.phys_start = 0x2fafc000,
+-			.virt_start = 0x2fafc000,
++			.phys_start = 0x1fafc000,
++			.virt_start = 0x1fafc000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		{
+-			.phys_start = 0x2fafe000,
+-			.virt_start = 0x2fafe000,
++			.phys_start = 0x1fafe000,
++			.virt_start = 0x1fafe000,
+ 			.size = 0x2000,
+ 			.flags = JAILHOUSE_MEM_READ,
+ 		},
+ 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+-		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
++		JAILHOUSE_SHMEM_NET_REGIONS(0x1fb00000, 0),
+ 		/* MMIO 1 (permissive) */ {
+ 			.phys_start = 0xfd500000,
+ 			.virt_start = 0xfd500000,
+@@ -117,10 +117,10 @@ struct {
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_IO,
+ 		},
+-		/* RAM (0M-~762M) */ {
++		/* RAM (0M-~506M) */ {
+ 			.phys_start = 0x0,
+ 			.virt_start = 0x0,
+-			.size = 0x2fa10000,
++			.size = 0x1fa10000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE,
+ 		},
+@@ -129,10 +129,10 @@ struct {
+ 
+ 		/* 4M reserved for the hypervisor */
+ 
+-		/* RAM (768M-4032M) */ {
+-			.phys_start = 0x30000000,
+-			.virt_start = 0x30000000,
+-			.size = 0xcc000000,
++		/* RAM (512M-4032M) */ {
++			.phys_start = 0x20000000,
++			.virt_start = 0x20000000,
++			.size = 0xdc000000,
+ 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+ 				JAILHOUSE_MEM_EXECUTE,
+ 		},
+-- 
+2.26.2
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index a4a5d9d..d11959a 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
     file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
     file://0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch \
     file://0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch \
+    file://0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch \
     file://0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch \
     "
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e38dd12746bbba6fa3cca1dcae930931f7eb383e.1618866389.git.jan.kiszka%40siemens.com.
