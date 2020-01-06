Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WLZTYAKGQE4A2KO3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id E17761311FA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:02 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id q26sf1327982wmq.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313202; cv=pass;
        d=google.com; s=arc-20160816;
        b=r4iovZ5R2TTYXnHXAfALolBM3iPYWJPiPQbxtYV/+H7SiYxfyFmuXJYDUn+hPx6GhD
         vQpvKpECgXp+0RCNgqk0UyJM/x9pf6rzgRlj61AgPxOBz4OIKI6HILmd2Aor12vKqp5G
         DfJVEZUohYQbtyUeirPzKcX5mTfBSgsF6lWEY2XgREts1veVOYAPWJG4xsoAyN9pHxN2
         G99jVQ+dfv6SJ3hewhsxKruTdTwosE15/ztavUILCy65ZdXvOdGr1hAxCTraWlXd2zSY
         S+3O8uosad4Cab3RKnIPOThDDBvPJ772WrGFxx5dN8VEDD3+XNBFobxnaB/hkD7r8hvK
         Xg/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=yShSFsYeD+o2NB30AMEwkGHjW2erdFvZVF8PXErEKE0=;
        b=A7HtXAh4bMq2J0WYXUmPmTMB9zjLfjyDzY2KGK5os5JzmlW0U1M+hWjKjna4mrJvMN
         SAKaWmQIiCEiHDPMbeIrDUtctvEm2m1pS2IlXk9LECTNCNUTp3ngdpoa8MmmEgZ5Zqrx
         QhLd7fddE4bG74358Y3jLwwL1AW23nQw0+ZpbYgS+qcP/g1QUl57AcuJEs37h9gr3I1z
         4VlVIc7W1MboH+ee6knzniugXbA1OwF9JQ99YMMyd2hQiafm7yPvJXmHXCeST7ObJFVL
         DNDaLos+M/9vwXDoyb03CgBkZTJ3g5ID5gdEcCE3EMQheKLaA99IVF6T0AWo3b7Bt6SS
         C4zw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yShSFsYeD+o2NB30AMEwkGHjW2erdFvZVF8PXErEKE0=;
        b=oXMqWrgSQucpg0wqqO2ijp3GVvGugFYAQLBPzwREhlBfd4Gkf8nG48vjP8QDfa3Uxc
         UF0IPp7NbaZTiTBnprvKKOVxwLtXJlB3DRXOCIvvwlsrbQvLKretKipIk7glJdSs7h/Q
         ovBVbTCBrpAcsV1+3gbeORRfQTe+IPKjZPheo4VZA+GWmxB6s6koXzdfzbnJOqN3dctl
         lE1PYh4nSfIs9F4GCEIRrbvLPq8CFaHtUwkpbn136Lc8AphZ3Bw8AttQrUm2VfbtKGWm
         HlllZq1I/cDZxn3dFl6WZexaX4nuI1OdsKq5sb4t+0SIJ7RbGrpq3w5PuujQUEzQ8Yqz
         2arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yShSFsYeD+o2NB30AMEwkGHjW2erdFvZVF8PXErEKE0=;
        b=NoAIrAlqCcOSV6p/eaiKdhpYDzneBrcyAuv2rs5ssTIoWXpEGmaVmzSu7e7jTyM275
         sfRD5tIDuZ6d6W3YNZwkwW5Vn8eDEKHAJR+/ngblmPIOVhUI18VWbbDgZ2OyuR866Ik3
         bkZ6sx36IOgH09zGTc/HWO0Jecz74QYEhjfVW3wCrAeL1Ie8zbTCO38JSx+XdU/lNvdC
         zLcxqnwuBf6iuAqTAYRaBUHKEj2PX5JSbdo9avga7DslV7K7OMGepB/3h4ae34A/1Dl5
         /+cNdeNk9SSXnRi4UCcQyXIqb1cCpghFCnyho/xmWtofNZJvI4kruefhXYUjx5FgjnqJ
         a/ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXw0QFNUZo+dovYweFMcYerp66tKjv/7bMkZ4p0nU+BfeW8irw4
	QMC9TpbD+IH0xl9KMkG0PTk=
X-Google-Smtp-Source: APXvYqzDuLg7pkREyzdukESDAPVasPgTskoApc+kWCJH2Fsa0jtxlq1tbK8F6O3YFd1NYAvCOsWuVw==
X-Received: by 2002:adf:df90:: with SMTP id z16mr109489940wrl.273.1578313202478;
        Mon, 06 Jan 2020 04:20:02 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9808:: with SMTP id a8ls2279911wme.0.gmail; Mon, 06 Jan
 2020 04:20:01 -0800 (PST)
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr35742833wmj.170.1578313201709;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313201; cv=none;
        d=google.com; s=arc-20160816;
        b=n3mlx8zHa+XAzZwOw1Pdt8bWl9dhInBDYYsmGatwrRHaGRLOpPvw6MsC6dqPwuor4S
         5k2ofwsK0Sw0iO2/TGnhyFCrtTqip5UtLBQaIpvKbGjh4CbDlfL/G2MCLucjpRg0D99K
         Tr6bipzG6h9PAIgrOZn8ytXy5rPxN8r4IOKiQuJ+70MVeh7WEEVGieU4EWC1RL4AX1VA
         7OVAh0pUjauuxzZE46/eX/5XxhZlJz4LakSrCGIADEOdgztIUH0/xorj2UD5ytf1RLOX
         1g5lbySoa7+/uyJBYFbXs5/CLY+Qg8DZRMTr5kocjlaWdveQf7tZoeFJSWxWrkidvs4c
         FsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=qSsYJmvNHyYDmU01YVJj7Rrjm5kOm50A15C8wvVcuJQ=;
        b=aYQ0cqCbcneIFAwb8tHIkgUAYnM9Fr+bpqbZr8He1K5SfyL3/H9mqMSmKjqRRlTUvj
         1ywhOvGaE5dzs7VuAXcrSQoQkithe985DVqnZZHMgekiV90wEgHiHbxHPO0SP80fkHh6
         hHUpEYoM1vxaSZ+MASfsnCBsGBClLa1exOf0KgWT30AyM/T1WAo3o6JAsn3KzBX5tWCq
         iR7TdgyA/mfnHdKkn2ERzIswnuOhIRI7ahevSsSQsXPtLXqZFHvnnJFd7jcsjORpnAdq
         6Rd2c84D3O/Y2PECLVH2kM6bLczGohcD/+WI4IIAeWaIYTs4tg88PnPtMBpUfE6Z894m
         ePhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u9si2274945wri.3.2020.01.06.04.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK1rh021148
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEv029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:01 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 23/38] configs: Factor out ivshmem memory region macro for network devices
Date: Mon,  6 Jan 2020 13:18:04 +0100
Message-Id: <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

This helps with defining the default case of the memory region that an
ivshmem network device needs. Just provide the start address, and
JAILHOUSE_SHMEM_NET_REGIONS will create a shared 1 MB region. The macro
already takes the device ID in order to be prepared for upcoming
unidirectional regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  9 ++-------
 configs/arm/bananapi.c                        |  8 ++------
 configs/arm/emtrion-rzg1e-linux-demo.c        |  9 ++-------
 configs/arm/emtrion-rzg1e.c                   |  8 ++------
 configs/arm/emtrion-rzg1h-linux-demo.c        |  9 ++-------
 configs/arm/emtrion-rzg1h.c                   |  8 ++------
 configs/arm/emtrion-rzg1m-linux-demo.c        |  9 ++-------
 configs/arm/emtrion-rzg1m.c                   |  8 ++------
 configs/arm/jetson-tk1-linux-demo.c           |  9 ++-------
 configs/arm/jetson-tk1.c                      |  8 ++------
 configs/arm/orangepi0-linux-demo.c            |  9 ++-------
 configs/arm/orangepi0.c                       |  8 ++------
 configs/arm64/amd-seattle-linux-demo.c        |  9 ++-------
 configs/arm64/amd-seattle.c                   |  8 ++------
 configs/arm64/espressobin-linux-demo.c        |  9 ++-------
 configs/arm64/espressobin.c                   |  8 ++------
 configs/arm64/hikey-linux-demo.c              |  9 ++-------
 configs/arm64/hikey.c                         |  8 ++------
 configs/arm64/jetson-tx1-linux-demo.c         |  9 ++-------
 configs/arm64/jetson-tx1.c                    |  8 ++------
 configs/arm64/k3-am654-idk-linux-demo.c       |  8 ++------
 configs/arm64/k3-am654-idk.c                  |  8 ++------
 configs/arm64/k3-j721e-evm-linux-demo.c       |  9 ++-------
 configs/arm64/k3-j721e-evm.c                  |  8 ++------
 configs/arm64/macchiatobin-linux-demo.c       |  9 ++-------
 configs/arm64/macchiatobin.c                  |  8 ++------
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  9 ++-------
 configs/arm64/miriac-sbc-ls1046a.c            |  8 ++------
 configs/arm64/qemu-arm64-linux-demo.c         |  9 ++-------
 configs/arm64/qemu-arm64.c                    |  8 ++------
 configs/arm64/ultra96-linux-demo.c            |  9 ++-------
 configs/arm64/ultra96.c                       |  8 ++------
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 18 ++++--------------
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 18 ++++--------------
 configs/arm64/zynqmp-zcu102.c                 | 16 ++++------------
 configs/x86/linux-x86-demo.c                  |  8 +-------
 configs/x86/qemu-x86.c                        |  7 +------
 include/jailhouse/cell-config.h               |  9 +++++++++
 38 files changed, 87 insertions(+), 260 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 070b909e..474ad6d1 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -81,13 +81,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 73c8ea8e..7f7393ff 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -182,12 +182,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index de984de8..4dbaecff 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -116,13 +116,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 0301e97d..744e7aeb 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -196,12 +196,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index 77234e80..b8b1c869 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -130,13 +130,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index d8eec098..95c21d67 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -322,12 +322,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 6e028a67..5e166fa5 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -130,13 +130,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index c8ff9ec5..41bccba9 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -231,12 +231,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index cc605058..1fe3636a 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -77,13 +77,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0xfbf00000,
-			.virt_start = 0xfbf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 2e8c0a02..187e82a2 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -226,12 +226,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0xfbf00000,
-			.virt_start = 0xfbf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfbf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 06dbf559..7d3022a3 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -72,13 +72,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x4f700000,
-			.virt_start = 0x4f700000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 4cd5b49d..5e654a01 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -123,12 +123,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x4f700000,
-			.virt_start = 0x4f700000,
-			.size =         0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x4f700000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 1ced1d7f..df44b76e 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -91,13 +91,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x83e4000000,
-			.virt_start = 0x83e4000000,
-			.size =           0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 1),
 		/* v2m */ {
 			.phys_start = 0xe1180000,
 			.virt_start = 0xe1180000,
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index a5414d6b..dd22b324 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -176,12 +176,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x83e4000000,
-			.virt_start = 0x83e4000000,
-			.size =           0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x83e4000000, 0),
 	},
 	.irqchips = {
 		/* GIC */ {
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index d2b19988..87d0db41 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -71,13 +71,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x3fb00000,
-			.virt_start = 0x3fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index e228b373..e606beae 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -89,12 +89,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x3fb00000,
-			.virt_start = 0x3fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index e17e0b04..384f8be8 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -71,13 +71,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index e9e2cd5f..2e0ddc64 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -95,12 +95,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index 1b7e1263..aeed067a 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -81,13 +81,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x17bf00000,
-			.virt_start = 0x17bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index e437d85d..a525d2b8 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -367,12 +367,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x17bf00000,
-			.virt_start = 0x17bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x17bf00000, 0),
 	},
 	.irqchips = {
 		/* GIC */ {
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 5dab6d8a..0c39dd29 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -70,12 +70,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x8dfb00000,
-			.virt_start = 0x8dfb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
 		/* MCU UART0 */ {
 			.phys_start = 0x40a00000,
 			.virt_start = 0x40a00000,
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 429ccdca..750657e8 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -79,12 +79,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x8dfb00000,
-			.virt_start = 0x8dfb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
 		/* RAM. Reserved for inmates */ {
 			.phys_start = 0x8E0000000,
 			.virt_start = 0x8E0000000,
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 8a2222e1..58b5f2c4 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -54,13 +54,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x89fe00000,
-			.virt_start = 0x89fe00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 7e0dc031..65afe570 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -67,12 +67,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x89fe00000,
-			.virt_start = 0x89fe00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
 			.virt_start = 0x00100000,
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 418f3b31..629da548 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -79,13 +79,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x13fb00000,
-			.virt_start = 0x13fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 4eebaa32..12df0a7a 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -98,12 +98,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x13fb00000,
-			.virt_start = 0x13fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 865fba63..cd60959c 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -82,13 +82,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-		/* IVSHMEM shared memory region */ {
-                        .phys_start = 0xc0400000,
-                        .virt_start = 0xc0400000,
-                        .size = 0x100000,
-                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-                                JAILHOUSE_MEM_ROOTSHARED,
-                },
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 1),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index a5b54ddc..ce67cba1 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -427,12 +427,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0xc0400000,
-			.virt_start = 0xc0400000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index b095900f..00cf6b99 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -72,13 +72,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7fb00000,
-			.virt_start = 0x7fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 51543183..015f47d6 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -82,12 +82,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x7fb00000,
-			.virt_start = 0x7fb00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* "physical" PCI ECAM */ {
 			.phys_start = 0x4010000000,
 			.virt_start = 0x4010000000,
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index ed65ecf5..78262146 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -71,13 +71,8 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 2e038ae6..c62c3a6b 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -81,12 +81,8 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x7bf00000,
-			.virt_start = 0x7bf00000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 	},
 
 	.irqchips = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 683bdee4..dfae6404 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -65,20 +65,10 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x800500000,
-			.virt_start = 0x800500000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x800700000,
-			.virt_start = 0x800700000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 1),
+		/* IVSHMEM shared memory region for 00:02.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 1),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 0b93c799..de11c5c2 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -71,20 +71,10 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x800400000,
-			.virt_start = 0x800400000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* IVSHMEM shared memory region */ {
-			.phys_start = 0x800700000,
-			.virt_start = 0x800700000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		/* IVSHMEM shared memory region for 00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
+		/* IVSHMEM shared memory region for 00:02.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
 		/* communication region */ {
 			.virt_start = 0x80000000,
 			.size = 0x00001000,
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 090470dd..d009b00d 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -91,18 +91,10 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* IVSHMEM shared memory region for 00:00.0 */ {
-			.phys_start = 0x800400000,
-			.virt_start = 0x800400000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
-		/* IVSHMEM shared memory region for 00:01.0 */ {
-			.phys_start = 0x800500000,
-			.virt_start = 0x800500000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		/* IVSHMEM shared memory region for 0001:00:00.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
+		/* IVSHMEM shared memory region for 0001:00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
 		/* PCI host bridge */ {
 			.phys_start = 0x8000000000,
 			.virt_start = 0x8000000000,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 69ea2bfa..6d076c67 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -77,13 +77,7 @@ struct {
 				JAILHOUSE_MEM_LOADABLE,
 		},
 		/* IVSHMEM shared memory region */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 1),
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
 		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
 		{
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 9621370c..2dcaa481 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -179,12 +179,7 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
 		/* IVSHMEM shared memory region (networking) */
-		{
-			.phys_start = 0x3f100000,
-			.virt_start = 0x3f100000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
-		},
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 	},
 
 	.irqchips = {
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index a62fa1ee..f82bbe8d 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -129,6 +129,15 @@ struct jailhouse_memory {
 	__u64 flags;
 } __attribute__((packed));
 
+#define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
+	{								\
+		.phys_start = start,					\
+		.virt_start = start,					\
+		.size = 0x100000,					\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
+			JAILHOUSE_MEM_ROOTSHARED,			\
+	}
+
 #define JAILHOUSE_MEMORY_IS_SUBPAGE(mem)	\
 	((mem)->virt_start & PAGE_OFFS_MASK || (mem)->size & PAGE_OFFS_MASK)
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka%40siemens.com.
