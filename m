Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBNX247YAKGQECL455QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3a.google.com (mail-yw1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06E13828B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 17:52:08 +0100 (CET)
Received: by mail-yw1-xc3a.google.com with SMTP id c68sf4999839ywa.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Jan 2020 08:52:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578761527; cv=pass;
        d=google.com; s=arc-20160816;
        b=mHCjOBlILSSUbvrqfYeQ+9FT429QSmzH+0e6SyIvwQoqalJ02CGG9QmWUrThaHapcy
         Xi6mORE8WAC+Nms9QmBpq1fp8nRUwxIQa+xacgpn0+DhPZ+5drMT1VOES9BM+bQ55Fz5
         0HAATVyPhjH4sDInc2Fs9wVym66Yxgbq3DDKlVIwPY7Ovupqk+DoHlbax2r3iZrfYHmq
         CFuawXpc1rwVGzaFol7fCg2SlP90o13jkspiCtGWdwLLTuF7AluoacZ67pCT2Vr4fIgx
         OFqfCaabuO8XufytivJjG0bsokT4q8jlnqCzPHJcBajvoJIt0v+OikmqtVRnKyK7zWMJ
         /9Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=t0QHjlGmXZxpw5ZkTwp7tyseu66nhS2XavmHDsr1ub0=;
        b=Bn0pB7B+15z+bjUQ7hsid+e4OOrqwSQXTXPVy60SoNDgq4z8uRxn4mLdHZONOG7ffS
         inp+Ut8FSyiOPmCWZqVpYXzJ06GM9MyQ3xyx66fFp85xqtySxHuU+zC1d8ZX5z4N1NiD
         5Clm63RKYjlZWdPqlURQ+FVTNXb0f7iQdGMWC81HlBY0V1xw5Qy7E62gehbrPCIDbQwC
         MqLpVqalLq0nOkHIVCAwKny7pWXQWSY+XTbtlug7mpBNfuGmPMARfbxXiDw8tWBSzlgW
         hu9X9+S9Jce1ud0aL+EcvnYjLyZHV3YA1gZxWRhxzvT2g1QHAJ9lGAITBVDSecegHtcP
         XgPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1qDZTKe;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t0QHjlGmXZxpw5ZkTwp7tyseu66nhS2XavmHDsr1ub0=;
        b=pvJ4mkFuBmCu33TD4NX3rEg61UT6kLjBcD+ITIR9HcPi6ynZBKwxM34F+5nc7R+iZG
         VcvMRmgsF+M/DTxnzUKZHemtqZFvolvpsHe/oSeLztnRbbd4m7SbiGQU/W1pZshUc7pm
         eXfjXSNLbSakuYSSuFB4TmDCqBjS+quvz3Ac3GFryP/IF/+jCyQupuandzkkvqd4Wk6G
         rD7YzC/ZNdPVisp+8Hz5Aq6OUU0Av/xBLNlsWLlJ0iPvCIU5OTPv1Na7runxRmFR6BY4
         nZMfwr9rNxp58IKE1sM80uVBFo624nIjPoBOlrlbgPDhmzFkhbiF9zsJVH3hh2qiF5ou
         Ctiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t0QHjlGmXZxpw5ZkTwp7tyseu66nhS2XavmHDsr1ub0=;
        b=UjapOFEQMXX9DzFl7U47AXdWm/do8MlagurZUdAeweVSqAgY4NKZcBE6g5kF0zYCDa
         XLGrRcdaDazbUEizAK3A2+uCXnujP41+OHoD0314PW5j9H0SNdXSfcWjLdakHMz6brNN
         krQdlKszB8OP11FZUYvMllqJGU6GSklepdIVGx7jmoxG9dy73/W4ZcM6k5by4BlZpfP3
         IJMr85CqnrK9h+i6xhtKYXfz8vGHq7U35fYSJODNMZgCS5OZkEsrq0ST/IVr1IurMmgd
         eRqcVVZIvNbcaFp/jaTIFfM5eSX4c3ihu0h/Eah82jweeilv0xE9TCn1GlxjzqG7sZEZ
         QRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t0QHjlGmXZxpw5ZkTwp7tyseu66nhS2XavmHDsr1ub0=;
        b=aG9ldZnlT52E8Q/txgOBTOHYNz/WVy4E5KwD4L/iy0fCEzInClkxeGtjjsk02Jy1t2
         45+Iph1KZF7PSb5Mty9TEnY/5Sp3xZnYK4hDUJKa8/3S7Sqi1eoj9VKm1c4BPxVgbhIm
         yPTLUM8I5yqFouhIBz7HHWVB+zmQ/on5Qz+AJJnMR0jfKLBgAdNRqPEDo8e4tC1XoFwu
         q16EinylSDBrFg7tbcVNtR5l+3LF8CsRkjg2+4b9z5F45CuOqLfOEvczcGXpRVHquOk0
         64GUnE8YIYtjEMmbELGR1LxZAYpYNfA0hinzL3CyW1ZQaVIsEsk0N6hSsPwXAbWH9IbS
         6Xig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVOc+7GaOXg4VKeotcCtabPpYBG+q/8AqZLIXOdJgpS3mpOd0qK
	zEd5depzcUmQ7dXezTBbwHc=
X-Google-Smtp-Source: APXvYqw1g0Rgk77AcGVJYVg2wO4sjkleTOpj4wdXROWfTWPu06D6NveWPpkL1U9K42NHUtq6pnRbJQ==
X-Received: by 2002:a25:9709:: with SMTP id d9mr7150552ybo.39.1578761527290;
        Sat, 11 Jan 2020 08:52:07 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:dc43:: with SMTP id f64ls1327476ywe.2.gmail; Sat, 11 Jan
 2020 08:52:06 -0800 (PST)
X-Received: by 2002:a0d:e24b:: with SMTP id l72mr3637649ywe.440.1578761526683;
        Sat, 11 Jan 2020 08:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578761526; cv=none;
        d=google.com; s=arc-20160816;
        b=s/VyWPN+wIhfmYu4+kRthi6vZC25aUM/7Wg8YYmgMRf4VEjaV5zeQDa6dvBEX2bIUR
         LwPdqYELfxZL5SkUqREeM1y98psaU3IwqvXZrChmvJ9RuyFEgELviyUkPQe/+/3snV1g
         Y5LcignyoG3Jrl67ZvodJRmYiuyWE2W7fAU1NHaD71ht4BK9+U6fX9oUbnI5p8B/EXdm
         uhJ+1w595x6qmLUs8z/eBqGmQY2GPxOe/W6Rr0UmnIcur2kb0BFfATWib7QbFiE1b+QP
         oiuE2tnYYm08nGset3HIbAnBABJJhl0wUF2Co4+lXUtdTT4EX/ftYTfcEmTJ85TmyhMh
         NHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=m515ZSYJzK+hVwTC1unlS+snQ3EcIs6FF7JIhSIXZYU=;
        b=q6BcGRsEbx7nI+pzaEszxZcw6bEqUcN1GazX8SdnWs4aIcflYSnTpugj3tHCPkOcCD
         TzP7Wh3Ige9gfU92wlMqUUigyVk59nJoczgwDSY3OQCqkxXBghuYJtQqQrAPPZwxV/Zs
         Onz44kFeI7IbHZDblNctFBTaKzI78198ERdjJh+c6b1rkJdOOLVW2GX3F0xNHQ8KxHyB
         GgEio6ISo0DC4CDPMWWlVs5LD72Vusf6hxud7BDeRoPVObbjab4MDLLTmXraXQq1ic2D
         2IxS/tU+jEXtJ9joiucjF6OR8xkd1y8W/quBGj0iN6QO9I8DP604UFVYzDD4ERnjyQ+O
         zA2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1qDZTKe;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com. [2607:f8b0:4864:20::542])
        by gmr-mx.google.com with ESMTPS id p187si288160ywe.1.2020.01.11.08.52.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2020 08:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) client-ip=2607:f8b0:4864:20::542;
Received: by mail-pg1-x542.google.com with SMTP id b9so2518730pgk.12
        for <jailhouse-dev@googlegroups.com>; Sat, 11 Jan 2020 08:52:06 -0800 (PST)
X-Received: by 2002:a63:5807:: with SMTP id m7mr11117257pgb.83.1578761525518;
        Sat, 11 Jan 2020 08:52:05 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id y6sm7221824pgc.10.2020.01.11.08.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2020 08:52:05 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH 1/2] configs/arm64: Add support for pine64-plus board
Date: Sat, 11 Jan 2020 22:21:33 +0530
Message-Id: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=X1qDZTKe;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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

Add config for Pine64+ board.
https://www.pine64.org/devices/single-board-computers/pine-a64/

Allwinner A64(Quad core A53) + 2GB RAM

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/pine64-plus.c | 339 ++++++++++++++++++++++++++++++++++++
 1 file changed, 339 insertions(+)
 create mode 100644 configs/arm64/pine64-plus.c

diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
new file mode 100644
index 00000000..9a0730c0
--- /dev/null
+++ b/configs/arm64/pine64-plus.c
@@ -0,0 +1,339 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Pine64+ board, 2 GB
+ *
+ * Copyright (c) Vijai Kumar K, 2019
+ *
+ * Authors:
+ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[35];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xbc000000,
+			.size =       0x04000000,
+		},
+		.debug_console = {
+			.address = 0x01c28000,
+			.size = 0x400,
+			.type = JAILHOUSE_CON_TYPE_PL011,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfc000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x01c81000,
+				.gicc_base = 0x01c82000,
+				.gich_base = 0x01c84000,
+				.gicv_base = 0x01c86000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "Pine64-Plus",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+
+			.vpci_irq_base = 108,
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+                /* SRAM */ {
+                        .phys_start = 0x00018000,
+                        .virt_start = 0x00018000,
+                        .size =       0x00028000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_EXECUTE,
+                },
+                /* Clock */ {
+                        .phys_start = 0x01000000,
+                        .virt_start = 0x01000000,
+                        .size =       0x00100000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* 1100000.mixer */ {
+                        .phys_start = 0x01100000,
+                        .virt_start = 0x01100000,
+                        .size =       0x00100000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* 1200000.mixer */ {
+                        .phys_start = 0x01200000,
+                        .virt_start = 0x01200000,
+                        .size =       0x00100000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* Syscon */ {
+                        .phys_start = 0x01c00000,
+                        .virt_start = 0x01c00000,
+                        .size =       0x00001000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* DMA */ {
+                        .phys_start = 0x01c02000,
+                        .virt_start = 0x01c02000,
+                        .size =       0x00001000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* LCD1 */ {
+                        .phys_start = 0x01c0c000,
+                        .virt_start = 0x01c0c000,
+                        .size =       0x00001000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* LCD2 */ {
+                        .phys_start = 0x01c0d000,
+                        .virt_start = 0x01c0d000,
+                        .size =       0x00001000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* MMC */ {
+                        .phys_start = 0x01c0f000,
+                        .virt_start = 0x01c0f000,
+                        .size =       0x00001000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* EEPROM */ {
+                        .phys_start = 0x01c14000,
+                        .virt_start = 0x01c14000,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c19000,
+                        .virt_start = 0x01c19000,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c19400,
+                        .virt_start = 0x01c19400,
+                        .size =       0x00000014,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1a000,
+                        .virt_start = 0x01c1a000,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1a400,
+                        .virt_start = 0x01c1a400,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1a800,
+                        .virt_start = 0x01c1a800,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1b000,
+                        .virt_start = 0x01c1b000,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1b400,
+                        .virt_start = 0x01c1b400,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* USB */ {
+                        .phys_start = 0x01c1b800,
+                        .virt_start = 0x01c1b800,
+                        .size =       0x00000004,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* Clock */ {
+                        .phys_start = 0x01c20000,
+                        .virt_start = 0x01c20000,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* Pincontrol */ {
+                        .phys_start = 0x01c20800,
+                        .virt_start = 0x01c20800,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* Watchdog */ {
+                        .phys_start = 0x01c20ca0,
+                        .virt_start = 0x01c20ca0,
+                        .size =       0x00000020,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* UART */ {
+                        .phys_start = 0x01c28000,
+                        .virt_start = 0x01c28000,
+                        .size =       0x00000020,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* I2C */ {
+                        .phys_start = 0x01c2b000,
+                        .virt_start = 0x01c2b000,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* Ethernet */ {
+                        .phys_start = 0x01c30000,
+                        .virt_start = 0x01c30000,
+                        .size =       0x00010000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* GPU */ {
+                        .phys_start = 0x01c40000,
+                        .virt_start = 0x01c40000,
+                        .size =       0x00010000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* SRAM */ {
+                        .phys_start = 0x01d00000,
+                        .virt_start = 0x01d00000,
+                        .size =       0x00040000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_EXECUTE,
+                },
+                /* HDMI */ {
+                        .phys_start = 0x01ee0000,
+                        .virt_start = 0x01ee0000,
+                        .size =       0x00010000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* HDMI */ {
+                        .phys_start = 0x01ef0000,
+                        .virt_start = 0x01ef0000,
+                        .size =       0x00010000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+                /* RTC */ {
+                        .phys_start = 0x01f00000,
+                        .virt_start = 0x01f00000,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* Interrupt Controller */ {
+                        .phys_start = 0x01f00c00,
+                        .virt_start = 0x01f00c00,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* Clock */ {
+                        .phys_start = 0x01f01400,
+                        .virt_start = 0x01f01400,
+                        .size =       0x00000100,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* Pincontrol */ {
+                        .phys_start = 0x01f02c00,
+                        .virt_start = 0x01f02c00,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
+                },
+                /* RSB(Reduced Serial Bus) */ {
+                        .phys_start = 0x01f03400,
+                        .virt_start = 0x01f03400,
+                        .size =       0x00000400,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* System RAM */ {
+			.phys_start = 0x40000000,
+			.virt_start = 0x40000000,
+			.size = 0x7c000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* IVSHMEM shared memory region */ {
+			.phys_start = 0xbbf00000,
+			.virt_start = 0xbbf00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x01c81000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 0001:00:00.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0x00,
+			.bar_mask = {
+				0xffffff00, 0xffffffff, 0x00000000,
+				0x00000000, 0x00000000, 0x00000000,
+			},
+			.shmem_region = 34,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200111165134.1421-1-vijaikumar.kanagarajan%40gmail.com.
