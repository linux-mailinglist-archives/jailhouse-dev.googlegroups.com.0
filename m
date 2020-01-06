Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WLZTYAKGQE4A2KO3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E01311FB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:03 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id u18sf26998024wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313203; cv=pass;
        d=google.com; s=arc-20160816;
        b=CZJmRh3pQfeYXRtgDGk+SNFELlJI7+oGVxKonI9G6+JzIVGJUIrsFYrZeycA4sTO2u
         yTBIc+53gYBCInQQnabASR1U6NGUo3MYQkZ2LdX6NaG2rqL76t9wskugVhuI+fucTD+C
         rxoSdiIFLprzomIuQamQZCY8ncXHUKuoernVCetrme1zJ/WANGr1nkiykFv0S4N4VxQi
         G6npCPqWORO8C6xVUfmTG9Vj/finDs5sXqgK5ez0VKzTpzd7mNg1dxaq+NPEuo+zkjT6
         QS8hHJ6jHMvnuuAbyyd138/dKqwIAebhOrxfJ3AC94OokkOzezp5G+U3izaii4Q1AU/D
         1APg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=txE/e85xjY/l6ofg9mV5kXDDC+eEhbbXdkM/WsFX0k8=;
        b=hiMvVIB5wT4LEW901xpEf2TRZwgOI4v4YKz99Ybq29wiWcBJVpzsHcA8fgfa6Oji93
         jolb7xG/eR8qsCp6trweREuuV5U5SqpKmtCCGN2NEH8F+D8/Hb03bKRhUiM8sxwrCygi
         wg6Q3znM3ac37cnOqh5Mscls7tmg1YpaadVt6mbsC5xt+QFhs1GT8p7JNtmR3z0x2yse
         8l/QwgzgKFmbgQS1D4kV1wdTuKdNOiLKNrjRYEx0/1iTSNfrIeCnN3f131kA7tcMwfuY
         rn2jlc5stEPsi9W9K7Lk3qHxE+tfblLvYNdR7GNCPLTeheO/zHdiP0w/yy957zGW/6Dx
         4HqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=txE/e85xjY/l6ofg9mV5kXDDC+eEhbbXdkM/WsFX0k8=;
        b=dA+XLEhzYKsB9uO+NlxE5np3ZMAPpYoYZKRncM17XWKMy//KHQkCbCh81mfoBfe2Rd
         lgWFVzBG32PdopL0f6ydNQmApPhjN8mbdjQklchdnHJ9HT3lawyvVn/s+zmoNtAVmbyP
         nKQBQa0+bDNHSx177R4pKwyQtU41DzzL2G1bBcXIQYZMduIbxpq2kfWriRszNSb7+Cvb
         Qq/KcvJA/ywZQnHRHzksoJRtoMYC+U9e5PTpJ89uoU5sHpNuZj0IKziJFf1/ynEDaGO0
         3bWbVeREPjht3eGIUB/G0pDASlC3VPKYB4JZ/Gz3uAUtiWW6v541Y1pQ90B2PV6UrW1P
         Nhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=txE/e85xjY/l6ofg9mV5kXDDC+eEhbbXdkM/WsFX0k8=;
        b=TgPhmbgO1qy6pk+H7CtC/IazZFI87LL1wj63kOLQ18y/1EG/IYQePeyMv/gb/nZ+C0
         729AbwM7DCul6sLiSPxyG1GVi7l714I8NZSYzW+YDlshey8h1eOdqxWv/WULiroBhc07
         C+hq9RiineZz2IIoKC4nIoUD91w4veXFl3/l10TmnYjUf/ghMCzav6eebYz5/n5sk2GI
         5e+HBq0lgVjahCT5F74GnTIN0F6LTbyI4nv3kRNg62OsVcF37oa8QElsgNVvXwvguInV
         4q0SrSy2rXSoj3P6FmJB4SkGqrH4mS1l7KJxpPt9RiIXBykEljWB1+BZW0TgUM9s+dtd
         S1Vw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU/sle760ZzdlTlJFRUCmlsUbfGWsGJEKrIcjwLv5HbZ9vMqt0K
	AOL0EGYwwZUSvHZKCKFRjCo=
X-Google-Smtp-Source: APXvYqyLFrVbTdXxmROz1nBmYPAPjquFgd/0/QA0PZF/cRBtRstfQHzHLpk/SALSYQsmhJlitSYmzQ==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr84857015wrx.288.1578313202847;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9808:: with SMTP id a8ls2279924wme.0.gmail; Mon, 06 Jan
 2020 04:20:02 -0800 (PST)
X-Received: by 2002:a7b:c750:: with SMTP id w16mr36002871wmk.46.1578313202118;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313202; cv=none;
        d=google.com; s=arc-20160816;
        b=aAlp7SSkLPTiQbFaP290LfAr94YTfMFoHrJtfaea9Xq5sadMSjF3S60w7f4fNGas88
         HICragy8ytQ9HRM38maZRf8VJNol61arrVAAKUW/hFgGdIaKs8XznTB+4JnJGWPMzdWE
         MqatUR5cb0vPkqSAnNz0GUl17jMr+IIFPZ3eylk902QD2baTn+ELqric5l+EAgctTuSP
         cxewE4KII0phwZEZh16bc5NaGShZiUJOSqfSQVpma/VwiMpRmu3Pv6b8BPcyG23YUo3Q
         W5AMXMJisfA+BRARjCN9iPhkWrcpTGIfxy+UhA7zqaNwijKuL6hhj7YasHu1zHNQg6Q5
         52kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=p7tysDP6B8n+1WM2F12kW3FFhp4jECmvnOtiteUgpRc=;
        b=skNjyGML7NFEVl8uExMKR9FNvpoplWh+Cgp5ObchNL9MOeZClLY4CHFJiujk6ephy8
         nRPiLh/70yVYMpCmRSfb1DeVoZ/C6qd9gL0L0bjVqfmV6v5q9KnrD0LNKrWlLUJd65Qc
         IuwFfdxkVSIJ4Vaaj81olVKGMt5a39H33/gSSqA2q7khnAwTzGUz8vUM8JsLWiSi7yFe
         mR1dSjzXm41X2+xbpmYTtE/6+oZg1mM5hioK4Ipts+76bPxtvQOK8lR+S5+DhCPZdbkG
         91jUlsU0Fzffs8atq/AEEQdUSnpR8MCvk+zPD64Q0fEBz+YzMqW9gsOkbm+1oZyN+Q1V
         5wuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y185si758249wmd.2.2020.01.06.04.20.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK1b1019350
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEw029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 24/38] configs: Move ivshmem memory regions at array start
Date: Mon,  6 Jan 2020 13:18:05 +0100
Message-Id: <c7c9cc901548895d2ecb25387a4e3ebb764160af.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

Simplifies index calculation and reduces risk of errors. The only
downside is that regions are no longer ordered according to their
physical addresses.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  6 +++---
 configs/arm/bananapi.c                        |  6 +++---
 configs/arm/emtrion-rzg1e-linux-demo.c        |  6 +++---
 configs/arm/emtrion-rzg1e.c                   |  6 +++---
 configs/arm/emtrion-rzg1h-linux-demo.c        |  6 +++---
 configs/arm/emtrion-rzg1h.c                   |  6 +++---
 configs/arm/emtrion-rzg1m-linux-demo.c        |  6 +++---
 configs/arm/emtrion-rzg1m.c                   |  6 +++---
 configs/arm/jetson-tk1-linux-demo.c           |  6 +++---
 configs/arm/jetson-tk1.c                      |  6 +++---
 configs/arm/orangepi0-linux-demo.c            |  6 +++---
 configs/arm/orangepi0.c                       |  6 +++---
 configs/arm64/amd-seattle-linux-demo.c        |  6 +++---
 configs/arm64/amd-seattle.c                   |  6 +++---
 configs/arm64/espressobin-linux-demo.c        |  6 +++---
 configs/arm64/espressobin.c                   |  6 +++---
 configs/arm64/hikey-linux-demo.c              |  6 +++---
 configs/arm64/hikey.c                         |  6 +++---
 configs/arm64/jetson-tx1-linux-demo.c         |  6 +++---
 configs/arm64/jetson-tx1.c                    |  7 +++----
 configs/arm64/k3-am654-idk-linux-demo.c       |  6 +++---
 configs/arm64/k3-am654-idk.c                  |  6 +++---
 configs/arm64/macchiatobin-linux-demo.c       |  6 +++---
 configs/arm64/macchiatobin.c                  |  6 +++---
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  6 +++---
 configs/arm64/miriac-sbc-ls1046a.c            |  6 +++---
 configs/arm64/qemu-arm64-linux-demo.c         |  6 +++---
 configs/arm64/qemu-arm64.c                    |  6 +++---
 configs/arm64/ultra96-linux-demo.c            |  6 +++---
 configs/arm64/ultra96.c                       |  6 +++---
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 12 ++++++------
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 12 ++++++------
 configs/arm64/zynqmp-zcu102.c                 | 12 ++++++------
 configs/x86/ivshmem-demo.c                    | 18 +++++++++---------
 configs/x86/linux-x86-demo.c                  |  6 +++---
 configs/x86/qemu-x86.c                        | 22 +++++++++++-----------
 36 files changed, 131 insertions(+), 132 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 474ad6d1..a6714736 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -52,6 +52,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* CCU (HACK) */ {
 			.phys_start = 0x01c2006c,
 			.virt_start = 0x01c2006c,
@@ -81,8 +83,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -106,7 +106,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 7f7393ff..3dd3a2a3 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -70,6 +70,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* SPI */ {
 			.phys_start = 0x01c05000,
 			.virt_start = 0x01c05000,
@@ -182,8 +184,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -201,7 +201,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 16,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 4dbaecff..5b24db92 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -51,6 +51,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* RST, MODEMR */ {
 			.phys_start = 0xe6160060,
 			.virt_start = 0xe6160060,
@@ -116,8 +118,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -155,7 +155,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 744e7aeb..528b2f45 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -70,6 +70,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* CPG */ {
 			.phys_start = 0xe6150000,
 			.virt_start = 0xe6150000,
@@ -196,8 +198,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -229,7 +229,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 16,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index b8b1c869..c971bcc0 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -51,6 +51,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* RST, MODEMR */ {
 			.phys_start = 0xe6160060,
 			.virt_start = 0xe6160060,
@@ -130,8 +132,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -169,7 +169,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 95c21d67..c2b3e16a 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -70,6 +70,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* SYS-DMAC */ {
 			.phys_start = 0xe6700000,
 			.virt_start = 0xe6700000,
@@ -322,8 +324,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -355,7 +355,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 16,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 5e166fa5..1dc57b4c 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -51,6 +51,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* RST, MODEMR */ {
 			.phys_start = 0xe6160060,
 			.virt_start = 0xe6160060,
@@ -130,8 +132,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -169,7 +169,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 41bccba9..21d05116 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -70,6 +70,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* Thermal Sensor */ {
 			.phys_start = 0xe61f0000,
 			.virt_start = 0xe61f0000,
@@ -231,8 +233,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -264,7 +264,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 16,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 1fe3636a..2e0a898c 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -53,6 +53,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 1),
 		/* UART */ {
 			.phys_start = 0x70006000,
 			.virt_start = 0x70006000,
@@ -77,8 +79,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -109,7 +109,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 187e82a2..18a36449 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -74,6 +74,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 0),
 		/* PCIe */ {
 			.phys_start = 0x01000000,
 			.virt_start = 0x01000000,
@@ -226,8 +228,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 0),
 	},
 
 	.irqchips = {
@@ -253,7 +253,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 21,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 7d3022a3..1b0a27f6 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -50,6 +50,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
 		/* UART 0-3 */ {
 			.phys_start = 0x01c28000,
 			.virt_start = 0x01c28000,
@@ -72,8 +74,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -97,7 +97,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 5e654a01..441f211c 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -67,6 +67,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
 		/* MMIO 1 (permissive) */ {
 			.phys_start = 0x01c00000,
 			.virt_start = 0x01c00000,
@@ -123,8 +125,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
 	},
 
 	.irqchips = {
@@ -142,7 +142,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 8,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index df44b76e..b6c6b2e0 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -47,6 +47,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 1),
 		/* UART */ {
 			.phys_start = 0xe1010000,
 			.virt_start = 0xe1010000,
@@ -91,8 +93,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 1),
 		/* v2m */ {
 			.phys_start = 0xe1180000,
 			.virt_start = 0xe1180000,
@@ -138,7 +138,7 @@ struct {
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 6,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index dd22b324..37cbb91a 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -64,6 +64,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 0),
 		/* gpio */ {
 			.phys_start = 0xe0030000,
 			.virt_start = 0xe0030000,
@@ -176,8 +178,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 0),
 	},
 	.irqchips = {
 		/* GIC */ {
@@ -216,7 +216,7 @@ struct {
 			.bdf = 0x0078,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 16,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 87d0db41..dc12d2b3 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -49,6 +49,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
 		/* UART */ {
 			.phys_start = 0xd0012000,
 			.virt_start = 0xd0012000,
@@ -71,8 +73,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -99,7 +99,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index e606beae..c9e62077 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -68,6 +68,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xd0000000,
 			.virt_start = 0xd0000000,
@@ -89,8 +91,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
 	},
 
 	.irqchips = {
@@ -109,7 +109,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 384f8be8..d6cc9f2d 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -49,6 +49,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* UART 3 */ {
 			.phys_start = 0xf7113000,
 			.virt_start = 0xf7113000,
@@ -71,8 +73,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -96,7 +96,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 2e0ddc64..057dcd05 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -67,6 +67,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xf4100000,
 			.virt_start = 0xf4100000,
@@ -95,8 +97,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -115,7 +115,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index aeed067a..b0518c4d 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -58,6 +58,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 1),
 		/* UART */ {
 			.phys_start = 0x70006000,
 			.virt_start = 0x70006000,
@@ -81,8 +83,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -113,7 +113,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index a525d2b8..60a8906d 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -72,7 +72,8 @@ struct {
 
 
 	.mem_regions = {
-
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 0),
 		/* APE 1 */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
@@ -367,8 +368,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 0),
 	},
 	.irqchips = {
 		/* GIC */ {
@@ -393,7 +392,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 42,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 0c39dd29..d546add6 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -54,6 +54,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
 		/* RAM load */ {
 			.phys_start = 0x8FFFF0000,
 			.virt_start = 0x0,
@@ -70,8 +72,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
 		/* MCU UART0 */ {
 			.phys_start = 0x40a00000,
 			.virt_start = 0x40a00000,
@@ -137,7 +137,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 750657e8..4dea206a 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -65,6 +65,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
 		/* RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
@@ -79,8 +81,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
 		/* RAM. Reserved for inmates */ {
 			.phys_start = 0x8E0000000,
 			.virt_start = 0x8E0000000,
@@ -211,7 +211,7 @@ struct {
 			.domain = 1,
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 629da548..9da732d9 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -50,6 +50,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 1),
 		/* UART */ {
 			.phys_start = 0xf0512000,
 			.virt_start = 0xf0512000,
@@ -79,8 +81,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -107,7 +107,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 12df0a7a..893b116d 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -70,6 +70,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xf0300000,
 			.virt_start = 0xf0300000,
@@ -98,8 +100,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
 	},
 
 	.irqchips = {
@@ -118,7 +118,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index cd60959c..71981611 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -51,6 +51,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 1),
 		/* DUART1 */
         	{
 			.phys_start = 0x21c0000,
@@ -82,8 +84,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 1),
 	},
 
 	.irqchips = {
@@ -119,7 +119,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index ce67cba1..1e3aa9c4 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -72,6 +72,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
 		/* DDR memory controller */ {
 			.phys_start = 0x01080000,
 			.virt_start = 0x01080000,
@@ -427,8 +429,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
 	},
 
 	.irqchips = {
@@ -454,7 +454,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = ARRAY_SIZE(config.mem_regions) - 1,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index 00cf6b99..e0c95039 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -50,6 +50,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
 		/* UART */ {
 			.phys_start = 0x09000000,
 			.virt_start = 0x09000000,
@@ -72,8 +74,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -100,7 +100,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 015f47d6..4b0826cd 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -68,6 +68,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0x09000000,
 			.virt_start = 0x09000000,
@@ -82,8 +84,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* "physical" PCI ECAM */ {
 			.phys_start = 0x4010000000,
 			.virt_start = 0x4010000000,
@@ -109,7 +109,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 78262146..4aea2922 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -49,6 +49,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* UART */ {
 			.phys_start = 0xff010000,
 			.virt_start = 0xff010000,
@@ -71,8 +73,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -99,7 +99,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index c62c3a6b..ef49b824 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -67,6 +67,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xfd000000,
 			.virt_start = 0xfd000000,
@@ -81,8 +83,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
@@ -101,7 +101,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index dfae6404..5248952d 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -50,6 +50,10 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 1),
+		/* IVSHMEM shared memory region for 00:02.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 1),
 		/* RAM */ {
 			.phys_start = 0x800610000,
 			.virt_start = 0,
@@ -65,10 +69,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region for 00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 1),
-		/* IVSHMEM shared memory region for 00:02.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -95,7 +95,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -103,7 +103,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 1,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index de11c5c2..f9b804a4 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -49,6 +49,10 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
+		/* IVSHMEM shared memory region for 00:02.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
 		/* UART */ {
 			.phys_start = 0xff010000,
 			.virt_start = 0xff010000,
@@ -71,10 +75,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
-		/* IVSHMEM shared memory region for 00:02.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
@@ -101,7 +101,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -109,7 +109,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 1,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index d009b00d..efd81389 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -70,6 +70,10 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region for 0001:00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
+		/* IVSHMEM shared memory region for 0001:00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xfd000000,
 			.virt_start = 0xfd000000,
@@ -91,10 +95,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 0001:00:00.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
-		/* IVSHMEM shared memory region for 0001:00:01.0 */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
 		/* PCI host bridge */ {
 			.phys_start = 0x8000000000,
 			.virt_start = 0x8000000000,
@@ -120,7 +120,7 @@ struct {
 			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -129,7 +129,7 @@ struct {
 			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_region = 4,
+			.shmem_region = 1,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index c6c1f4c2..e53965ff 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -50,6 +50,14 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* RAM */ {
 			.phys_start = 0x3ee00000,
 			.virt_start = 0,
@@ -63,14 +71,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f0f0000,
-			.virt_start = 0x3f0f0000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
 	},
 
 	.pio_regions = {
@@ -85,7 +85,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 2,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 		},
 	},
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 6d076c67..70cfc4ad 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -54,6 +54,8 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 		/* low RAM */ {
 			.phys_start = 0x3a600000,
 			.virt_start = 0,
@@ -76,8 +78,6 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
 		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
 		{
@@ -141,7 +141,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 3,
+			.shmem_region = 0,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 2dcaa481..4aa789b1 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -74,6 +74,15 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory region (demo) */
+		{
+			.phys_start = 0x3f0f0000,
+			.virt_start = 0x3f0f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* IVSHMEM shared memory region (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 		/* RAM */ {
 			.phys_start = 0x0,
 			.virt_start = 0x0,
@@ -171,15 +180,6 @@ struct {
 			.size = 0x1000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
-		/* IVSHMEM shared memory region (demo) */
-		{
-			.phys_start = 0x3f0f0000,
-			.virt_start = 0x3f0f0000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* IVSHMEM shared memory region (networking) */
-		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 	},
 
 	.irqchips = {
@@ -277,7 +277,7 @@ struct {
 			.bdf = 0x0e << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 14,
+			.shmem_region = 0,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
@@ -287,7 +287,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
-			.shmem_region = 15,
+			.shmem_region = 1,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c7c9cc901548895d2ecb25387a4e3ebb764160af.1578313099.git.jan.kiszka%40siemens.com.
