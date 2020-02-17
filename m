Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBEO5VDZAKGQEQ3BAQVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 84510160A43
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 07:11:31 +0100 (CET)
Received: by mail-pg1-x538.google.com with SMTP id b22sf11040886pgs.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Feb 2020 22:11:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581919890; cv=pass;
        d=google.com; s=arc-20160816;
        b=ENXmSwzjcMMC8dExj7vBrZl3tX7cJHDIu3EPyFAsphyhcu7pTiAHXu6+D374soRjlL
         XdeSKfGfccNEN1RcYc+qclvJNAQ7r6bKKqAf53MzoBc4lZ2Zfbpgn5M4XJM6ZbaFwIac
         Xaxa7S2vgQrsT1QFuSZlzKSctweU5xoHaeLDWOJ641OFkqratWoggnXlclxtXInlkJS2
         O8pFtwvaFmrh5R5oZLyAtVUsuhxPrQOmuU6H52cVoNxs+gIuSpD0mkyzs2ql5PFdRsCN
         VqUaOhZ73OcwAIzTTgcPqxTvEjpSZGuKqIyZvttBMpuc2GJJgzmaTD4JCwTr0odoPt0K
         vxAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=CsEIQW+AH57NCaQ+fQR2dXHRgD/IjQbddxPvY7ySDeo=;
        b=vSnjdDYjr8m4If18AfliRI6Eq/CoUyweuMA5Z0/BPrz7wRNTtkThfMfePYLFLq0oAp
         QQBDWSi0eq+KAqryxzKvjlJli25TuDMfk6Sb+iRXMeiztt/NIYtH/X3Gy8ZRT5TqTyE9
         dAP1QkM+XmbsMoknY/OwapE9BG9IjULtztZ8ux/hkEYMr2KWUCbHZYUA0UemhfvtJVA7
         np2NtFNXPyxFYIxSzLTpKBKKTuaZh1n4voS7wU2U3ipye+4z26rWiJLPULk31LaK/p6R
         UaaeELaVxhyizL+pZBYCw5bjeYkB25GpbwJQdZe8tHxZ8ph8nDLg+PiykE5M/IsUj0nL
         lqog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SO9AFhns;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CsEIQW+AH57NCaQ+fQR2dXHRgD/IjQbddxPvY7ySDeo=;
        b=VxKMISb838R1JYK8g+JH2jeDdJe5tnnrd8hrviziXsyIblHAKdWACGataiOn/vM5my
         302X/0QEYvRpC83YAHjY4TdzHCMcmb2wAClLqYlTVxGXEuDyZhVwChygzjADxJFsNg73
         Q7HSSX7+xDpYCkSBaYyInXrfr92Kf4iGTbhVWbaTwyKyinW2gdiCUKszmYruAKjhAAYp
         AORaUfHUTSOtV50PDfM/CPycsTmgAdqRAkdslIVb0TUKZd8BCCi4Dgm6BYCqWbjH4QFl
         cw8C+PdRu0QIGMFbmgGQwzTLANSn9zxQBwQ7Wcm6RmlcF3Ck1SIu8yORHOSN5nAvJtPr
         Omig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CsEIQW+AH57NCaQ+fQR2dXHRgD/IjQbddxPvY7ySDeo=;
        b=vGOH4KXY53SCI8qp8FeZ+bR/1bcO0YCes6NT25ZWDd8yXhU6UQ1mGRFg1NyY+LeUV2
         cqCQTs57rSFN8eaJ/09mmV/foW0X/hmIb82kNVUq9AkNDb0B1ycweotwfZCWrSbhV7aT
         PNjPqEejES384uSQAOoCe3pzsXOogO/Dc1eSfk0MwZDjhYnbdT/1b7DbfZkLlfMgGNgH
         WQKYS8uYMJhFj7RzO9x6uiN/qXI3zsk+gzIxWLVDxn72bq21TfOX/INrew9xcpd6LoIT
         e82T0oluUtrtUPxl60dFI2WW1NHBpxffwY15CYGggXrlzep3s4v7YKZjqNbLsbJ9hrMk
         L7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CsEIQW+AH57NCaQ+fQR2dXHRgD/IjQbddxPvY7ySDeo=;
        b=cNWDmQRfv9VScf+J0+0cqWgmZfoZeOn/sT/Dje8xHD8gBipi+GsEsX9hQkiRjT0cK8
         fiix3BuhTgKBwhfejHU1oV7nv5FhNL1vOso+FxomeE1ANIMm0xt5CuVh7Dg9S1zzW4BP
         PGtMAq2ZBToh3eN4KTfBAWprTZaaoSZD46iay7M6l4tgL08xuFb0653uETvmaFToFbp+
         UYUZT4VtRUS32j0knQk0wqE5iqbLtntpBtpP0C+M4pzDBReqRPiT1p5/XdBZsvUIH7HW
         n8Q+fWoHQexM6voZuLOAkHIOTBiQzYBSCQKmBjzsLtq5VTHufEH5pLUe+JZUQ7lna1+r
         BxGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWoSnWTW42irQ9RA5gnLn3YpBdERDC6v9FcRTx0W+WrMxykzlqc
	bm5pmx4mqOvhh7ZUdFNfI74=
X-Google-Smtp-Source: APXvYqy/3A6m4glEFpXeOi7PRNwcXkh+M5yowEwh7qt2wIK9ImL+xnS2nfMavlZFevh5mdmQSv/B3g==
X-Received: by 2002:a17:902:b206:: with SMTP id t6mr15046410plr.211.1581919889692;
        Sun, 16 Feb 2020 22:11:29 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:c583:: with SMTP id l3ls6041703pjt.2.canary-gmail;
 Sun, 16 Feb 2020 22:11:29 -0800 (PST)
X-Received: by 2002:a17:90a:191a:: with SMTP id 26mr17780395pjg.111.1581919888941;
        Sun, 16 Feb 2020 22:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581919888; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3Swr1DNeFA7FGjFjh88WYmJUcpxhPpsvjlO9nUgrLwgo+2ePMtzxhallJDeOcYrOR
         9XEbzOLAxa3ZrbFUK+tC/i++p7E1ylDdjv04j/Z0TKRtB0CYsF/9IYMLmqPzllsvT4uD
         U8NtYRalkRs0I64nWeE4WeMR/aQY+zAVvpfTxQD1YV+IZbATfPEDxF6uKdFff+mra03B
         dYncC7AeDXLNY+b2tyLnmGvtuwsSJhgFDP1gP7gED1i2qu80JnDtanTRiPj1l2/GqoQs
         0N2kUqhf3yGxfyc5pBCDuBFUpaLgwzGiLc8jKH5HqqI5k+FMy0CYJiO6gZzrXd3joL+V
         rPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=hlrr1EHvkexNYPLBm2QgE4vxrBz4TFMPZTpZji4Qox8=;
        b=Jp6yF/WyWSpsmFHwJmhT1kK0Bo+rDeJ1wfJByLRiL4LUoRMChe7LK0yrd8tQiSmM3k
         DRKIprCJFWEPD3Y7u3bOTo40l50AvLgl5VbbTMMFXPhp/ftV0gRrEMAeVoPzRP0i26/1
         3KYflDMTNdnguD/ZRhpus3NccTym6ndnf7xs7rPf+1HiJZj5GT0zRqsruceHTK3Kumv0
         RDxuSICdCzotJkssKxCYkiFWLodu12wX5RU5DhniclD9PANvMG/QiZhoakJcAPGoQBzZ
         Gke3EntiLfWKXG7ok6D6JlzueqgWn83oesv/oKVbVZhjJ5Phkh04IDgbg2M/ZIq/w3gz
         d4Vw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SO9AFhns;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com. [2607:f8b0:4864:20::442])
        by gmr-mx.google.com with ESMTPS id j123si509951pfd.5.2020.02.16.22.11.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2020 22:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) client-ip=2607:f8b0:4864:20::442;
Received: by mail-pf1-x442.google.com with SMTP id 4so8262992pfz.9
        for <jailhouse-dev@googlegroups.com>; Sun, 16 Feb 2020 22:11:28 -0800 (PST)
X-Received: by 2002:a62:2a07:: with SMTP id q7mr15252581pfq.153.1581919887701;
        Sun, 16 Feb 2020 22:11:27 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id q11sm14687299pff.111.2020.02.16.22.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 22:11:27 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH] recipes-jailhouse: Add pine64 plus patches
Date: Mon, 17 Feb 2020 11:41:11 +0530
Message-Id: <20200217061111.19042-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=SO9AFhns;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Add pine64 plus patches for jailhouse v0.12. This enables us to test
pine64-plus with Jailhouse release 0.12, the latest release as of this
writing.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 ...64-Add-support-for-pine64-plus-board.patch | 401 ++++++++++++++++++
 ...dd-inmate-demo-for-pine64-plus-board.patch | 153 +++++++
 ...arm64-Add-Linux-demo-for-pine64-plus.patch | 293 +++++++++++++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |   6 +-
 4 files changed, 852 insertions(+), 1 deletion(-)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-pine64-plus-board.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch

diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-pine64-plus-board.patch b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-pine64-plus-board.patch
new file mode 100644
index 0000000..cc859db
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-pine64-plus-board.patch
@@ -0,0 +1,401 @@
+From 8700228123cb881477c571a125bb4b79560d9166 Mon Sep 17 00:00:00 2001
+From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Date: Tue, 11 Feb 2020 10:50:08 +0100
+Subject: [PATCH 1/3] configs/arm64: Add support for pine64-plus board
+
+Add config for Pine64+ board.
+https://www.pine64.org/devices/single-board-computers/pine-a64/
+
+Allwinner A64(Quad core A53) + 2GB RAM
+
+Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm64/pine64-plus.c | 375 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 375 insertions(+)
+ create mode 100644 configs/arm64/pine64-plus.c
+
+diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
+new file mode 100644
+index 00000000..c824ca78
+--- /dev/null
++++ b/configs/arm64/pine64-plus.c
+@@ -0,0 +1,375 @@
++/*
++ * Jailhouse, a Linux-based partitioning hypervisor
++ *
++ * Configuration for Pine64+ board, 2 GB
++ *
++ * Copyright (c) Vijai Kumar K, 2019-2020
++ *
++ * Authors:
++ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
++ *
++ * This work is licensed under the terms of the GNU GPL, version 2.  See
++ * the COPYING file in the top-level directory.
++ *
++ * NOTE: Add "mem=1792M" to the kernel command line.
++ */
++
++#include <jailhouse/types.h>
++#include <jailhouse/cell-config.h>
++
++struct {
++	struct jailhouse_system header;
++	__u64 cpus[1];
++	struct jailhouse_memory mem_regions[43];
++	struct jailhouse_irqchip irqchips[1];
++	struct jailhouse_pci_device pci_devices[2];
++} __attribute__((packed)) config = {
++	.header = {
++		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
++		.revision = JAILHOUSE_CONFIG_REVISION,
++		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
++		.hypervisor_memory = {
++			.phys_start = 0xbc000000,
++			.size =       0x04000000,
++		},
++		.debug_console = {
++			.address = 0x01c28000,
++			.size = 0x400,
++			.type = JAILHOUSE_CON_TYPE_8250,
++			.flags = JAILHOUSE_CON_ACCESS_MMIO |
++				 JAILHOUSE_CON_REGDIST_4,
++		},
++		.platform_info = {
++			.pci_mmconfig_base = 0x02000000,
++			.pci_mmconfig_end_bus = 0,
++			.pci_is_virtual = 1,
++			.arm = {
++				.gic_version = 2,
++				.gicd_base = 0x01c81000,
++				.gicc_base = 0x01c82000,
++				.gich_base = 0x01c84000,
++				.gicv_base = 0x01c86000,
++				.maintenance_irq = 25,
++			},
++		},
++		.root_cell = {
++			.name = "Pine64-Plus",
++
++			.cpu_set_size = sizeof(config.cpus),
++			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
++			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
++			.num_irqchips = ARRAY_SIZE(config.irqchips),
++
++			.vpci_irq_base = 108,
++		},
++	},
++
++	.cpus = {
++		0xf,
++	},
++
++	.mem_regions = {
++		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
++		/* State Table */ {
++			.phys_start = 0xbbef1000,
++			.virt_start = 0xbbef1000,
++			.size = 0x1000,
++			.flags = JAILHOUSE_MEM_READ,
++		},
++		/* Read/Write Section */ {
++			.phys_start = 0xbbef2000,
++			.virt_start = 0xbbef2000,
++			.size = 0x9000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
++		},
++		/* Output (peer 0) */ {
++			.phys_start = 0xbbefb000,
++			.virt_start = 0xbbefb000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
++		},
++		/* Output (peer 1) */ {
++			.phys_start = 0xbbefd000,
++			.virt_start = 0xbbefd000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ,
++		},
++		/* Output (peer 2) */ {
++			.phys_start = 0xbbeff000,
++			.virt_start = 0xbbeff000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ,
++		},
++		 /* IVSHMEM shared memory region for 00:01.0 (networking)*/
++                JAILHOUSE_SHMEM_NET_REGIONS(0xbbf01000, 0),
++                /* SRAM */ {
++                        .phys_start = 0x00018000,
++                        .virt_start = 0x00018000,
++                        .size =       0x00028000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_EXECUTE,
++                },
++                /* Clock */ {
++                        .phys_start = 0x01000000,
++                        .virt_start = 0x01000000,
++                        .size =       0x00100000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* 1100000.mixer */ {
++                        .phys_start = 0x01100000,
++                        .virt_start = 0x01100000,
++                        .size =       0x00100000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* 1200000.mixer */ {
++                        .phys_start = 0x01200000,
++                        .virt_start = 0x01200000,
++                        .size =       0x00100000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* Syscon */ {
++                        .phys_start = 0x01c00000,
++                        .virt_start = 0x01c00000,
++                        .size =       0x00001000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* DMA */ {
++                        .phys_start = 0x01c02000,
++                        .virt_start = 0x01c02000,
++                        .size =       0x00001000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* LCD1 */ {
++                        .phys_start = 0x01c0c000,
++                        .virt_start = 0x01c0c000,
++                        .size =       0x00001000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* LCD2 */ {
++                        .phys_start = 0x01c0d000,
++                        .virt_start = 0x01c0d000,
++                        .size =       0x00001000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* MMC */ {
++                        .phys_start = 0x01c0f000,
++                        .virt_start = 0x01c0f000,
++                        .size =       0x00001000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* EEPROM */ {
++                        .phys_start = 0x01c14000,
++                        .virt_start = 0x01c14000,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c19000,
++                        .virt_start = 0x01c19000,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c19400,
++                        .virt_start = 0x01c19400,
++                        .size =       0x00000014,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1a000,
++                        .virt_start = 0x01c1a000,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1a400,
++                        .virt_start = 0x01c1a400,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1a800,
++                        .virt_start = 0x01c1a800,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1b000,
++                        .virt_start = 0x01c1b000,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1b400,
++                        .virt_start = 0x01c1b400,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* USB */ {
++                        .phys_start = 0x01c1b800,
++                        .virt_start = 0x01c1b800,
++                        .size =       0x00000004,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* Clock */ {
++                        .phys_start = 0x01c20000,
++                        .virt_start = 0x01c20000,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* Pincontrol */ {
++                        .phys_start = 0x01c20800,
++                        .virt_start = 0x01c20800,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* Watchdog */ {
++                        .phys_start = 0x01c20ca0,
++                        .virt_start = 0x01c20ca0,
++                        .size =       0x00000020,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* UART */ {
++                        .phys_start = 0x01c28000,
++                        .virt_start = 0x01c28000,
++                        .size =       0x00000020,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* I2C */ {
++                        .phys_start = 0x01c2b000,
++                        .virt_start = 0x01c2b000,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* Ethernet */ {
++                        .phys_start = 0x01c30000,
++                        .virt_start = 0x01c30000,
++                        .size =       0x00010000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* GPU */ {
++                        .phys_start = 0x01c40000,
++                        .virt_start = 0x01c40000,
++                        .size =       0x00010000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* SRAM */ {
++                        .phys_start = 0x01d00000,
++                        .virt_start = 0x01d00000,
++                        .size =       0x00040000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_EXECUTE,
++                },
++                /* HDMI */ {
++                        .phys_start = 0x01ee0000,
++                        .virt_start = 0x01ee0000,
++                        .size =       0x00010000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* HDMI */ {
++                        .phys_start = 0x01ef0000,
++                        .virt_start = 0x01ef0000,
++                        .size =       0x00010000,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++                /* RTC */ {
++                        .phys_start = 0x01f00000,
++                        .virt_start = 0x01f00000,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* Interrupt Controller */ {
++                        .phys_start = 0x01f00c00,
++                        .virt_start = 0x01f00c00,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* Clock */ {
++                        .phys_start = 0x01f01400,
++                        .virt_start = 0x01f01400,
++                        .size =       0x00000100,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* Pincontrol */ {
++                        .phys_start = 0x01f02c00,
++                        .virt_start = 0x01f02c00,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
++                },
++                /* RSB(Reduced Serial Bus) */ {
++                        .phys_start = 0x01f03400,
++                        .virt_start = 0x01f03400,
++                        .size =       0x00000400,
++                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++                                JAILHOUSE_MEM_IO,
++                },
++		/* System RAM */ {
++			.phys_start = 0x40000000,
++			.virt_start = 0x40000000,
++			.size = 0x7bef1000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE,
++		},
++	},
++
++	.irqchips = {
++		/* GIC */ {
++			.address = 0x01c81000,
++			.pin_base = 32,
++			.pin_bitmap = {
++				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
++			},
++		},
++	},
++
++	.pci_devices = {
++		{ /* IVSHMEM 00:00.0 (demo) */
++			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
++			.bdf = 0 << 3,
++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
++			.shmem_regions_start = 0,
++			.shmem_dev_id = 0,
++			.shmem_peers = 3,
++			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
++		},
++		/* IVSHMEM 00:01.0 (networking) */ {
++			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
++			.bdf = 1 << 3,
++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
++			.shmem_regions_start = 5,
++			.shmem_dev_id = 0,
++			.shmem_peers = 2,
++			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
++		},
++	},
++};
+-- 
+2.17.1
+
diff --git a/recipes-jailhouse/jailhouse/files/0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch b/recipes-jailhouse/jailhouse/files/0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch
new file mode 100644
index 0000000..2a77f44
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch
@@ -0,0 +1,153 @@
+From 783f206e0b49f121a043429a8e0dff73baa5f8b3 Mon Sep 17 00:00:00 2001
+From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Date: Tue, 11 Feb 2020 10:50:09 +0100
+Subject: [PATCH 2/3] configs/arm64: Add inmate demo for pine64-plus board
+
+GIC demo and ivshmem-demo are validated.
+
+Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm64/pine64-plus-inmate-demo.c | 130 ++++++++++++++++++++++++
+ 1 file changed, 130 insertions(+)
+ create mode 100644 configs/arm64/pine64-plus-inmate-demo.c
+
+diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
+new file mode 100644
+index 00000000..73cde95c
+--- /dev/null
++++ b/configs/arm64/pine64-plus-inmate-demo.c
+@@ -0,0 +1,130 @@
++/*
++ * Jailhouse, a Linux-based partitioning hypervisor
++ *
++ * Configuration for gic-demo inmate on Pine64+ board
++ *
++ * Copyright (c) Vijai Kumar K, 2019-2020
++ *
++ * Authors:
++ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
++ *
++ * This work is licensed under the terms of the GNU GPL, version 2.  See
++ * the COPYING file in the top-level directory.
++ */
++
++#include <jailhouse/types.h>
++#include <jailhouse/cell-config.h>
++
++struct {
++	struct jailhouse_cell_desc cell;
++	__u64 cpus[1];
++	struct jailhouse_memory mem_regions[8];
++	struct jailhouse_irqchip irqchips[1];
++	struct jailhouse_pci_device pci_devices[1];
++} __attribute__((packed)) config = {
++	.cell = {
++		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
++		.revision = JAILHOUSE_CONFIG_REVISION,
++		.name = "inmate-demo",
++		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
++
++		.cpu_set_size = sizeof(config.cpus),
++		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
++		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
++		.num_irqchips = ARRAY_SIZE(config.irqchips),
++		.vpci_irq_base = 125,
++
++		.console = {
++			.address = 0x1c28000,
++			.type = JAILHOUSE_CON_TYPE_8250,
++			.flags = JAILHOUSE_CON_ACCESS_MMIO |
++				 JAILHOUSE_CON_REGDIST_4,
++		},
++	},
++
++	.cpus = {
++		0x2,
++	},
++
++	.mem_regions = {
++		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
++		/* State Table */ {
++			.phys_start = 0xbbef1000,
++			.virt_start = 0xbbef1000,
++			.size = 0x1000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Read/Write Section */ {
++			.phys_start = 0xbbef2000,
++			.virt_start = 0xbbef2000,
++			.size = 0x9000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 0) */ {
++			.phys_start = 0xbbefb000,
++			.virt_start = 0xbbefb000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 1) */ {
++			.phys_start = 0xbbefd000,
++			.virt_start = 0xbbefd000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 2) */ {
++			.phys_start = 0xbbeff000,
++			.virt_start = 0xbbeff000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* UART */ {
++			.phys_start = 0x1c28000,
++			.virt_start = 0x1c28000,
++			.size = 0x400,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
++				JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* RAM */ {
++			.phys_start = 0xbbee1000,
++			.virt_start = 0,
++			.size = 0x00010000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
++		},
++		/* communication region */ {
++			.virt_start = 0x80000000,
++			.size = 0x00001000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_COMM_REGION,
++		},
++	},
++
++	.irqchips = {
++		/* GIC */ {
++			.address = 0x01c81000,
++			.pin_base = 32,
++			.pin_bitmap = {
++				0,
++				0,
++				0,
++				(1 << (157 - 128))
++			},
++		},
++	},
++
++	.pci_devices = {
++		{ /* IVSHMEM 00:00.0 (demo) */
++			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
++			.bdf = 0 << 3,
++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
++			.shmem_regions_start = 0,
++			.shmem_dev_id = 1,
++			.shmem_peers = 3,
++			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
++		},
++	},
++};
+-- 
+2.17.1
+
diff --git a/recipes-jailhouse/jailhouse/files/0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch b/recipes-jailhouse/jailhouse/files/0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch
new file mode 100644
index 0000000..3e93e2b
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch
@@ -0,0 +1,293 @@
+From 5dbdcbc720c94f79913b1c1b966f87d314d333b5 Mon Sep 17 00:00:00 2001
+From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Date: Tue, 11 Feb 2020 10:50:10 +0100
+Subject: [PATCH 3/3] configs/arm64: Add Linux demo for pine64-plus
+
+Add Linux demo with 2 CPUs and 128M RAM for Pine64+.
+
+Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+---
+ configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++++++++++++
+ configs/arm64/pine64-plus-linux-demo.c   | 148 +++++++++++++++++++++++
+ 2 files changed, 262 insertions(+)
+ create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
+ create mode 100644 configs/arm64/pine64-plus-linux-demo.c
+
+diff --git a/configs/arm64/dts/inmate-pine64-plus.dts b/configs/arm64/dts/inmate-pine64-plus.dts
+new file mode 100644
+index 00000000..0f980c98
+--- /dev/null
++++ b/configs/arm64/dts/inmate-pine64-plus.dts
+@@ -0,0 +1,114 @@
++/*
++ * Jailhouse, a Linux-based partitioning hypervisor
++ *
++ * Device tree for Linux inmate test on Pine64+ board,
++ * corresponds to configs/arm64/pine64-plus-linux-demo.c
++ *
++ * Copyright (c) Vijai Kumar K, 2019-2020
++ *
++ * Authors:
++ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
++ *
++ * This work is licensed under the terms of the GNU GPL, version 2.  See
++ * the COPYING file in the top-level directory.
++ */
++
++#include <dt-bindings/interrupt-controller/arm-gic.h>
++
++/dts-v1/;
++
++/ {
++	model = "Jailhouse cell on Pine64+";
++
++	#address-cells = <1>;
++	#size-cells = <1>;
++
++	interrupt-parent = <&gic>;
++
++	hypervisor {
++		compatible = "jailhouse,cell";
++	};
++
++	cpus {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		cpu@2 {
++			compatible = "arm,cortex-a53";
++			device_type = "cpu";
++			reg = <2>;
++			enable-method = "psci";
++		};
++
++		cpu@3 {
++			compatible = "arm,cortex-a53";
++			device_type = "cpu";
++			reg = <3>;
++			enable-method = "psci";
++		};
++	};
++
++	psci {
++		compatible = "arm,psci-0.2";
++		method = "smc";
++	};
++
++	timer {
++		compatible = "arm,armv8-timer";
++		interrupts = <GIC_PPI 13
++				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
++			     <GIC_PPI 14
++				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
++			     <GIC_PPI 11
++				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
++			     <GIC_PPI 10
++				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
++	};
++
++	clocks {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		osc24M: clk24M {
++			#clock-cells = <0>;
++			compatible = "fixed-clock";
++			clock-frequency = <24000000>;
++			clock-output-names = "osc24M";
++		};
++	};
++
++	gic: interrupt-controller@01c81000 {
++		compatible = "arm,gic-400";
++		reg = <0x01c81000 0x1000>,
++		      <0x01c82000 0x2000>;
++		interrupt-controller;
++		#interrupt-cells = <3>;
++	};
++
++	uart: serial@01c28000 {
++		compatible = "snps,dw-apb-uart";
++		reg = <0x01c28000 0x400>;
++		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
++		reg-shift = <2>;
++		reg-io-width = <4>;
++		clock-frequency = <24000000>;
++	};
++
++	pci@02000000 {
++		compatible = "pci-host-ecam-generic";
++		device_type = "pci";
++		bus-range = <0 0>;
++		#address-cells = <3>;
++		#size-cells = <2>;
++		#interrupt-cells = <1>;
++		interrupt-map-mask = <0 0 0 7>;
++		interrupt-map = <0 0 0 1 &gic GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
++				<0 0 0 2 &gic GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
++				<0 0 0 3 &gic GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
++				<0 0 0 4 &gic GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
++		reg = <0x02000000 0x100000>;
++		ranges =
++			<0x02000000 0x00 0x10000000 0x10000000 0x00 0x10000>;
++	};
++};
+diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
+new file mode 100644
+index 00000000..1d099906
+--- /dev/null
++++ b/configs/arm64/pine64-plus-linux-demo.c
+@@ -0,0 +1,148 @@
++/*
++ * Jailhouse, a Linux-based partitioning hypervisor
++ *
++ * Configuration for linux-demo inmate on Pine64+ board:
++ * 2 CPU, 128M RAM, serial port 0
++ *
++ * Copyright (c) Vijai Kumar K, 2019-2020
++ *
++ * Authors:
++ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
++ *
++ * This work is licensed under the terms of the GNU GPL, version 2.  See
++ * the COPYING file in the top-level directory.
++ */
++
++#include <jailhouse/types.h>
++#include <jailhouse/cell-config.h>
++
++struct {
++	struct jailhouse_cell_desc cell;
++	__u64 cpus[1];
++	struct jailhouse_memory mem_regions[13];
++	struct jailhouse_irqchip irqchips[1];
++	struct jailhouse_pci_device pci_devices[2];
++} __attribute__((packed)) config = {
++	.cell = {
++		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
++		.revision = JAILHOUSE_CONFIG_REVISION,
++		.name = "pine64-plus-linux-demo",
++		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
++			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
++
++		.cpu_set_size = sizeof(config.cpus),
++		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
++		.num_irqchips = ARRAY_SIZE(config.irqchips),
++		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
++
++		.vpci_irq_base = 123,
++
++		.console = {
++			.address = 0x01c28000,
++			.type = JAILHOUSE_CON_TYPE_8250,
++			.flags = JAILHOUSE_CON_ACCESS_MMIO |
++				 JAILHOUSE_CON_REGDIST_4,
++		},
++	},
++
++	.cpus = {
++		0xc,
++	},
++
++	.mem_regions = {
++		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
++		/* State Table */ {
++			.phys_start = 0xbbef1000,
++			.virt_start = 0xbbef1000,
++			.size = 0x1000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Read/Write Section */ {
++			.phys_start = 0xbbef2000,
++			.virt_start = 0xbbef2000,
++			.size = 0x9000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 0) */ {
++			.phys_start = 0xbbefb000,
++			.virt_start = 0xbbefb000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 1) */ {
++			.phys_start = 0xbbefd000,
++			.virt_start = 0xbbefd000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* Output (peer 2) */ {
++			.phys_start = 0xbbeff000,
++			.virt_start = 0xbbeff000,
++			.size = 0x2000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* IVSHMEM shared memory region */
++		JAILHOUSE_SHMEM_NET_REGIONS(0xbbf01000, 1),
++		/* UART 0-3 */ {
++			.phys_start = 0x01c28000,
++			.virt_start = 0x01c28000,
++			.size = 0x1000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
++		},
++		/* RAM */ {
++			.phys_start = 0xbb900000,
++			.virt_start = 0,
++			.size = 0x10000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
++		},
++		/* RAM */ {
++			.phys_start = 0xb0000000,
++			.virt_start = 0xb0000000,
++			.size = 0x8000000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
++				JAILHOUSE_MEM_LOADABLE,
++		},
++		/* communication region */ {
++			.virt_start = 0x80000000,
++			.size = 0x00001000,
++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
++				JAILHOUSE_MEM_COMM_REGION,
++		},
++	},
++
++	.irqchips = {
++		/* GIC */ {
++			.address = 0x01c81000,
++			.pin_base = 32,
++			.pin_bitmap = {
++				1 << (32-32), 0, 0, (1 << (155-128)) | (1 << (156-128)),
++			},
++		},
++	},
++
++	.pci_devices = {
++		{ /* IVSHMEM 00:00.0 (demo) */
++			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
++			.bdf = 0 << 3,
++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
++			.shmem_regions_start = 0,
++			.shmem_dev_id = 2,
++			.shmem_peers = 3,
++			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
++		},
++		/* IVSHMEM 00:01.0 (networking) */ {
++			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
++			.bdf = 1 << 3,
++			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
++			.shmem_regions_start = 5,
++			.shmem_dev_id = 1,
++			.shmem_peers = 2,
++			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
++		},
++	},
++};
+-- 
+2.17.1
+
diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
index 12cee5a..0ace5f9 100644
--- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
+++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
@@ -11,6 +11,10 @@
 
 require jailhouse.inc
 
-SRC_URI += "file://0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch"
+SRC_URI += "file://0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch \
+	file://0001-configs-arm64-Add-support-for-pine64-plus-board.patch \
+	file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
+	file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
+"
 
 SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200217061111.19042-1-vijaikumar.kanagarajan%40gmail.com.
