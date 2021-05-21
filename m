Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLE6T2CQMGQENLZTHKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1AB38C530
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:45:01 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id k30-20020a2e6f1e0000b02900fd86165caasf2170511ljc.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:45:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593900; cv=pass;
        d=google.com; s=arc-20160816;
        b=oFKBHSSZXgy2UasCVx6f8nj/J9A6PdXN+AEezg6adOpZt0TVNJNz+5m8S3u1cZKYBM
         ip3oVC0+1d99NKcBt+1dkntfDdilysJslogNq2oTLX4Q5AO3QLJ7t/cpUCbOWp+EjYhD
         pE37VTbuyk4ZWjdGiQh2ZMoH2KosmwCFdx0J6qDabxUtfo5T7Wlf4YNBcT8secPYiWHw
         h8Z7/UL1OVX0HNSEF/Sl7bPnddKFjUZKDxbYmEt4cTelcZXa+buVXSHZex15wPlG4FRE
         zNeR9HCgH8MWnA5Q2QgGZD7AVn2l6Izq2/z7kuNWcjDFIR6SCeYLU8xQTxz46slHehCU
         Dpog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=78wmhIKrMlSS6fGZrb1mB2wFrssUQVPI0TKWGn38tOI=;
        b=Gea702YwlRA+Uua6pq+557wVyDbl4iRA/5CdR5Rpqat3b5Kg20l8fwaNFpBr/T//BC
         1O8u2D9cNtg3aCycImFTPwvjsGFlhO5poOpBSFqEU0opnJSTzQ9d2Lpixr6xTbvuut6o
         ZhaNfNWaK6tzENAxCNQ980rcxiS1PSt7IGrkahVNEmuT02cBXD2eAINabcgy2kBgtQhQ
         Kb4Nv5HZzFjDaJXqc6cllp+vSZTrm4MyrK8P7MvUQuGXpGQSb/pdoWBWP0BYeLvQYaQo
         PGvzGaCXdv/09mVPuUGEKrIKLGIyEXlKrmnUv330eh3Y1ji3ciZ5eoW1rMG+dCSdBTd8
         pfOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=78wmhIKrMlSS6fGZrb1mB2wFrssUQVPI0TKWGn38tOI=;
        b=i2Gq6NNVl3ZIxjN3fRfp6RvIO5W7UlUe6VaRIm235EmyyaSE+o+ndC3vwb1zvQgZLU
         mL87ZzcLbbONPXgelHuFPxSYPbQCnOmwCk9hYIHQyoE8RBZOhCi5R11akdHvut8fVlRK
         JJKJ90Mq0GPvu2BUwHorO4ZibEbYp76zFy1E3LpxnmVGOZ5MTC01DANaHvPmgy+FG9g2
         b3VAE6PmXpCdG1vmkpoSKiHm0DLenBgxmWa8pnHi+cOreYHvpUUCzK0pb0AOuK/j3BQh
         nZF7odV8/2p1bcwvfC95OyLogRplLHMZeEv4lNfGzYm9IgCEkkckIDsXGxnGLAO0yC8j
         AQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=78wmhIKrMlSS6fGZrb1mB2wFrssUQVPI0TKWGn38tOI=;
        b=IHbkllrfD5grKlZHZZUqLcwYTWiJDiU6eq+inaaeFk1vb/jHXV0HBu7ov3jY978Vx1
         eU60E2jMnRiKkDSD7PsTl65Z9e2cEOk+IlQBb6iJZoa+85qPPDMYhPK9k7fBH18whyqQ
         CP90aiQ+Mpc1zcBQfJS7mzupKQcTNRaftygnBBYtRrvEYv6C7ieo+Atr9X8/VvzxCvLk
         gBbxgtZRh64VV811WSrRjVvQmIo0SXI+VgMHL8OpXl/lhlXEsovLWIwWM1MPtO/Zh8qx
         PRn+4m8lJ/lQkPDpzLUGh/3zeRaM1QX9X/ILg9pmSn7l+zQ7RbwON+yBBFNFcsOabm/i
         c4Yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530b4iEWFcnmKlusK4Q+MqumnXkVsp+IIKmJzcrWPFTGGEC1c5vu
	BF4WZzrbNj+ze/6AQsiatwA=
X-Google-Smtp-Source: ABdhPJxvEw8Yp/NBJKl2IcryJ5i8avgNjGRP4wHnQw7Ui1buzL5K/uMTN4SpIYKivwZZ0pWAGs949g==
X-Received: by 2002:a05:6512:49e:: with SMTP id v30mr1822255lfq.644.1621593900813;
        Fri, 21 May 2021 03:45:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:230f:: with SMTP id o15ls335361lfu.1.gmail; Fri, 21
 May 2021 03:44:59 -0700 (PDT)
X-Received: by 2002:a05:6512:2208:: with SMTP id h8mr1721930lfu.389.1621593899700;
        Fri, 21 May 2021 03:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593899; cv=none;
        d=google.com; s=arc-20160816;
        b=KWd315/x2qyP3ZaU8BUjyzsx2vjO5/xs5CE8XOZJre2jkO0dMhJWMvF8D7Huq07TIO
         rImiABR04pBmkOpKaOCpYSBqJrePfmND1O0e/gRYvKA4R0yiRabk+j8GpeF8xBOFpkJv
         b4r6Fg7tweeBj8INq/6Y3/BrOjGRF00dbzvUvFoZrLiobEY2+PD2IIj0u891o2HkXpZL
         M71l3bHMSrYD8tRfyLdfpfO/9Bk6dWRDOmZL/N15FKTQnr125XmvJdbpXqlyGzo2Qn/5
         c5D2c7C8N4cIuooCuJKnhVlh9aRUoo9IyQKMZ3RvBkphNWPyRWdq7XIae824MLzWogzV
         lDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=6ajXud5xY739vpun3l96ReAoNmcVc9jAtQIQO8ptUOw=;
        b=CxBVutax9adRvQRTZrZyoC/tOWR6Sbw8ZzHLNS8Y0ZpSavdwZZnylTTEecbQxk4fdi
         fcKQ/55RnkPyuBH3yRU4UBfkRtHiVNn+zP1yv/yLO0ukjkipj6aZUGSN1CzjlP+rlDA9
         vIdciF2F6PP34NJNqvTD72GldYTa6+Cto/pj2osEahrsCKBTPodDpXnVbyRygxacSHPv
         wNR9j3sNI9TcjS3m0X81d0nt4rH04bFabAtkgYMLBEY5xKLC5PRzlbrW0cEakKqG4ovF
         j7BjEb5qRchAs1m1LIJkO4AlWtQ+1oaNu5ulVqfpotF3TIPVwhMVXpQ/fnnO1uX8Tdw+
         7nwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q8si349682ljg.4.2021.05.21.03.44.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAixCV024468
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:44:59 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcN032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 18/22] rpi4: Move jailhouse reservation
Date: Fri, 21 May 2021 12:37:30 +0200
Message-Id: <810d56f964954c5bba60d64ceda89c75fde30b65.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/810d56f964954c5bba60d64ceda89c75fde30b65.1621593454.git.jan.kiszka%40siemens.com.
