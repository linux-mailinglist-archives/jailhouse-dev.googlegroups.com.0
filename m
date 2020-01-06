Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOMEZXYAKGQEVNGPPNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016713137C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id v10sf7971075lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320441; cv=pass;
        d=google.com; s=arc-20160816;
        b=w3F3B6U7wNhXoxlKaQ9Y+Y1NEhfvHxQ5Y3dRakzaOQSllxnZDRxBTuCVl1bWfn/EJ3
         Wna5ssVf6zGHzkDtKcC18q7+BiEqFvBCqayLapRWFPChouxl1IJbMyRzWnCaXr+wmUB1
         MrhyJVfpoZ5IiKlBvjZjBMVwUPY4s2Wk77nxdatxfWm4PnSOktnAGDBS3PMWKAGHDvk2
         lLvERoFHqwY63cK3P5oKo0gN4MZIF08vxM9Z1MaOrSSnutj0sKt3hZGF0lSwdViMxpGm
         Xz+y5NyVj6SLOUX1FCmwhShz7jEf7f4xtXPyLoXSlwg1HtPqsuHgSBDShqELT1oxZ5Q+
         CCTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=84M/feKTqewQchnWpYjaBxhApU8KIVne4YqxGgYPjh8=;
        b=CiBBiOuTKfaldcclJneVXK208QgW1/xS5ocFm7ArjghJnFRRk7jeq4dPr72YDJKJvn
         74IDgHoCPbOlqr8WwQtPnYiC6jZeV1Q8BrPAziJpkWrcwLLmw37C9HUNPjg968IOf7WF
         0LBaCfuYGZd5ZkAOqC1LhNCWcTQ23V0841v7ZfND/d1mK+qRZtBIUBZDqP++r2Nt8ecG
         Hfz5QiQ9WwZ3EepY4w/5KCe0fFA8LKcZA6dbU3MnOP4qJyO6hra8x7frjbh78sb8Sxo0
         LuKajoTj8da8x4V3HuTC02pZL9jq8wYoK66tZDA7xUMXYAIQdW6xq/cWOAQmmZs14uSX
         5xnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=84M/feKTqewQchnWpYjaBxhApU8KIVne4YqxGgYPjh8=;
        b=cnZMOyleWWCa2owCTvdN/75np+FjQqoECLknnrKJOFv3jY79WOp0uIL8wmyUuJiaUZ
         dIXbC3cB21iIpp4zdfeGvmwo+S69ixZqQRtmBFTQ/3ReIsnR+CAQei7dGIH4+vuQBf1C
         wlz6UWYyA+IlOivWVbVFV4eaN8hJfeiEJpgZGNSaPeutkA5CtmvUPpbPl7mEflrGljfU
         cEDAx6Y/L/L3A/NP3De1tqXgP3T7Rs01DywRvOj21H/7RxcJd7z8sC2Nx7ilaEo93+lA
         qnQz90qfbdSpl67vr7luRqh5eDpV0tK8Jz/nFGh5Ud46E6acPicX03aOony6BUHcGvN9
         Pfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=84M/feKTqewQchnWpYjaBxhApU8KIVne4YqxGgYPjh8=;
        b=NG0kCzVC0rUNcis2amBfAr9BiN53uF+3IpCaOOCK0tNnw8q3omc595oEg32Ks18xYp
         xn4ATXqPI2mBSuGkIqbfaH2LRc9A1COu5A08v8D1l9uQpK/TgkiH+AVDUo4iA2OCZ6Hg
         MwJNiAqkQ/9xf186mijSM3dP2wODtAWmbxCf2V1qjAJPBSxlPsmYg0yylo7FTLqP+zyZ
         W7e6eQocB6Jj6elV2Qf/SnyzLIMoNI9zLFNKCfZOprhjl/rm0Kq8S37obyEprcOR1Tv5
         iWQv+grY9W9V27Bu0X6F9Fiu7q9ImFPqQtgMjV2ocvpwL2qepM5Tj3+PmMmk2ZWV4P4S
         HgGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXyJVgIgmIlyIsTXGYUzQifxPb+XwPZbmZJzIkx6E+7GBlmQBKM
	ec2jzGGmBduCl1PDXU2R+/s=
X-Google-Smtp-Source: APXvYqyxl0YXSg+vrEQvzyYSzQKhEnZV+OnaiTFyZzwYdGk9eZgHv4+0K6ClUoW3hlZm/yNEH73u8w==
X-Received: by 2002:a19:6a06:: with SMTP id u6mr57603777lfu.187.1578320441679;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:730c:: with SMTP id o12ls4970475ljc.12.gmail; Mon, 06
 Jan 2020 06:20:40 -0800 (PST)
X-Received: by 2002:a2e:93d5:: with SMTP id p21mr62883707ljh.50.1578320440914;
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320440; cv=none;
        d=google.com; s=arc-20160816;
        b=HszVX3LiYJxbeph40F9ZtJMsTyMOKWhz7Qkvt+UqdOveFmgLItYQizXUDFsk1jeOQo
         Bfm+85TJdC1zTJBw0i+2fLiy4Y7CRLF4MpFjRQOCjlLIkuHD0dTp3sYJyhkqnmbkfPw2
         q/2vhlbF9NHxqjnd+z2zrg2GFw7sDoSYxL2YmV7QWF6ETxXu2R59FIreGnzSVFgx2vDY
         99sm0zt6gWREWamfxKOSofPjWEDH8mfZBw6b5ih3jvDERHbiUuxc9X4tIGL7sljyvcGh
         rgh4Ty0IlRWR6tdoeTeNPwHsjxsnrU90hE/Nt8ozUes0rRW6MeKMrVoaaPnQLXhn/iYJ
         6LTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=wSUGtYodcYNiAQVAq5gKggnN7H2Fb6CTHUIch3oOnRE=;
        b=RNzteESv0fh5Ff17tm5p+MwJ6QIljcVKSU/lfkKOqvGq8EnRyKECEwV39m/sV4do0p
         vaF1I7yjiY9HXzbYhENomyuPjKKuj+80onsh2AbbdS485K64HSkk4EC1uF7C/DIgIQAc
         m74i2iNipGj0jx3Lr7QrpljL0hlnN586WH9fTGnOQcbvWHhLUd6Jy01wh4I2SDSmL1bh
         BXvDvENtchSeGNKgAFDEU4MrTf2trYi7XAGlg+2NuUARNGL/qEfevqyIhF56ulI0fFKX
         d3YzpTGtU+5gvf1mjUJdrTR7J39lUQsw+7b/dMbuzDqkNIzI9a48CmY0rkM7v2pxInk3
         xYsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o24si2876511lji.4.2020.01.06.06.20.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKelk019197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjM008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/19] configs: arm/arm64: Remove uart demos
Date: Mon,  6 Jan 2020 15:20:30 +0100
Message-Id: <8771cb77e4ea0e170272397bb59e491633e1b1f1.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
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

Those add no value, compared to the gic-demo configs. They only increase
maintenance efforts.

The emtrion boards only have uart demos, no gic equivalents. Keep those
for now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-uart-demo.c        | 77 ---------------------------------
 configs/arm64/amd-seattle-uart-demo.c   | 69 -----------------------------
 configs/arm64/foundation-v8-uart-demo.c | 69 -----------------------------
 configs/arm64/k3-am654-uart-demo.c      | 71 ------------------------------
 configs/arm64/k3-j721e-evm-uart-demo.c  | 72 ------------------------------
 5 files changed, 358 deletions(-)
 delete mode 100644 configs/arm/bananapi-uart-demo.c
 delete mode 100644 configs/arm64/amd-seattle-uart-demo.c
 delete mode 100644 configs/arm64/foundation-v8-uart-demo.c
 delete mode 100644 configs/arm64/k3-am654-uart-demo.c
 delete mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c

diff --git a/configs/arm/bananapi-uart-demo.c b/configs/arm/bananapi-uart-demo.c
deleted file mode 100644
index 0621ca52..00000000
--- a/configs/arm/bananapi-uart-demo.c
+++ /dev/null
@@ -1,77 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for uart-demo inmate on Banana Pi:
- * 1 CPU, 64K RAM, serial ports 4-7, CCU
- *
- * Copyright (c) Siemens AG, 2014
- *
- * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "bananapi-uart-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-
-		.console = {
-			.address = 0x01c29c00,
-			.clock_reg = 0x01c2006c,
-			.gate_nr = 23,
-			.divider = 0x0d,
-			.type = JAILHOUSE_CON_TYPE_8250,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x2,
-	},
-
-	.mem_regions = {
-		/* CCU */ {
-			.phys_start = 0x01c20000,
-			.virt_start = 0x01c20000,
-			.size = 0x400,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
-		},
-		/* UART 4-7 */ {
-			.phys_start = 0x01c29000,
-			.virt_start = 0x01c29000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* RAM */ {
-			.phys_start = 0x7bff0000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	}
-};
diff --git a/configs/arm64/amd-seattle-uart-demo.c b/configs/arm64/amd-seattle-uart-demo.c
deleted file mode 100644
index a0b6b551..00000000
--- a/configs/arm64/amd-seattle-uart-demo.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for uart-demo inmate on AMD Seattle:
- * 1 CPU, 64K RAM, serial port 2
- *
- * Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
- *
- * Authors:
- *  Antonios Motakis <antonios.motakis@huawei.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "pl011-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
-
-		.console = {
-			.address = 0xe1010000,
-			.type = JAILHOUSE_CON_TYPE_PL011,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x4,
-	},
-
-	.mem_regions = {
-		/* UART 2 */ {
-			.phys_start = 0xe1010000,
-			.virt_start = 0xe1010000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* RAM */ {
-			.phys_start = 0x83b0010000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	}
-};
diff --git a/configs/arm64/foundation-v8-uart-demo.c b/configs/arm64/foundation-v8-uart-demo.c
deleted file mode 100644
index ca78270b..00000000
--- a/configs/arm64/foundation-v8-uart-demo.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for uart-demo inmate on Foundation Model v8:
- * 1 CPU, 64K RAM, serial port 2
- *
- * Copyright (C) 2015 Huawei Technologies Duesseldorf GmbH
- *
- * Authors:
- *  Antonios Motakis <antonios.motakis@huawei.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "pl011-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
-
-		.console = {
-			.address = 0x1c090000,
-			.type = JAILHOUSE_CON_TYPE_PL011,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x4,
-	},
-
-	.mem_regions = {
-		/* UART 2 */ {
-			.phys_start = 0x1c0b0000,
-			.virt_start = 0x1c090000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* RAM */ {
-			.phys_start = 0xfbff0000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	}
-};
diff --git a/configs/arm64/k3-am654-uart-demo.c b/configs/arm64/k3-am654-uart-demo.c
deleted file mode 100644
index 28dcf86c..00000000
--- a/configs/arm64/k3-am654-uart-demo.c
+++ /dev/null
@@ -1,71 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for uart-demo inmate on K3 based platforms:
- * 1 CPU, 64K RAM, 1 serial port(MCU UART 0)
- *
- * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
- *
- * Authors:
- *  Nikhil Devshatwar <nikhil.nd@ti.com>
- *  Lokesh Vutla <lokeshvutla@ti.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "uart-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
-
-		.console = {
-			.address = 0x40a00000,
-			.divider = 0x35,
-			.type = JAILHOUSE_CON_TYPE_8250,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x2,
-	},
-
-	.mem_regions = {
-		/* MCU UART 0 */ {
-			.phys_start = 0x40a00000,
-			.virt_start = 0x40a00000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* RAM */ {
-			.phys_start = 0x8e0000000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	}
-};
diff --git a/configs/arm64/k3-j721e-evm-uart-demo.c b/configs/arm64/k3-j721e-evm-uart-demo.c
deleted file mode 100644
index 05dfd834..00000000
--- a/configs/arm64/k3-j721e-evm-uart-demo.c
+++ /dev/null
@@ -1,72 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for uart-demo inmate on K3 based platforms:
- * 1 CPU, 64K RAM, serial port 3
- *
- * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
- *
- * Authors:
- *  Nikhil Devshatwar <nikhil.nd@ti.com>
- *  Lokesh Vutla <lokeshvutla@ti.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "uart-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
-
-		.console = {
-			.address = 0x02810000,
-			.divider = 0x1b,
-			.type = JAILHOUSE_CON_TYPE_8250,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_MDR_QUIRK |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x2,
-	},
-
-	.mem_regions = {
-		/* main_uart1 */ {
-			.phys_start = 0x02810000,
-			.virt_start = 0x02810000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* RAM */ {
-			.phys_start = 0x89ff00000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	}
-};
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8771cb77e4ea0e170272397bb59e491633e1b1f1.1578320435.git.jan.kiszka%40siemens.com.
