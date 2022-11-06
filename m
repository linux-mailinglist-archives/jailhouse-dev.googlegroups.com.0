Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRBQP3UCNQMGQE2XNBJDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id B827761E771
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Nov 2022 00:05:39 +0100 (CET)
Received: by mail-oo1-xc3e.google.com with SMTP id f26-20020a4a9d5a000000b0044e0692f7d0sf2385040ook.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Nov 2022 15:05:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1667775938; cv=pass;
        d=google.com; s=arc-20160816;
        b=yEO8r42aZSqBgULegZZ0KX8SwvUY9eyd0f1MlPANEc4HvBpVY1I3PL1ArOyHfQkXdg
         hiXj+tvRlKVmNGLoF/zFNGE13LThPG2IqDuoz42j3FFTpQnLKp6DE5WfwxggMCWSH8Z/
         8BTRBT6ZgsGqAP6UepK2+7pm4BpvXss1o888jAp8Qc8XTQuWyWEO1hs6vJe2/09bJAGv
         82Eki+u2nhIk7IgITzftLNSURXjzeHpvRrdoCaZvTGPCIYj5on7WWuAXqYypiZGm/Fs2
         Mp6pWdY5o8uV6TuEP6EEi1msLykQ+JUzTkyZR10j0RwoVru+0FJsa12azqjlg3+GtYSY
         558Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=XNoHGstq+LO7BhUZ3HmJ8mnvTh0UXoG+1bhN2X33teY=;
        b=kStCIIAxCJmMwPG1F4mP+erc7A4aYjyzec5Bg0vSHtKxQu71Xs0bXf0Tc1+HQV8itk
         pTfZKHlhD+Nh0AdDB6iCzJW6nelYDTSMwl0Nt48ur8x5Se5eL5CBbwOrSAR8Lc7ahW/L
         GgZi/Ba99xznagzxVNpnEBmAROjBBuL845XNgX9MsSrZC8jEIOotmvJw3WlGCS5cw3I5
         rZpmDmtCeHgzI3AqNM3T33LfNY9WTGPysHbK2xpXEnhjz/A9I5riGti3sBPVAGxadTXb
         dT0vVJ4SDVAajuM6ZWRMOUa+N5Bq6eYkMrhYIimrr3cQ/hOeOoOA3G4IKK47Gwec8l1B
         1ZBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNoHGstq+LO7BhUZ3HmJ8mnvTh0UXoG+1bhN2X33teY=;
        b=J9U8+vxGbaksRIZUAuIJXVmf+DhEZJbl7IBBlECT2m5MlalyVOswOlCAU0oy3F+tgK
         fOxY1uw+jupgWi+0F/qchXiwSRnZe+wJv5VDxHTW6FbDT/mO8vlBtc9i99kPZf6PyaVP
         TNast1Uoqle/W6fKNIMP7UDHavKXfT32xUFIYXI0EpoS1tv6Tve2TWZqNysTXrPc/VPL
         KiV6Jm7lddg6NKLAYVcm+F/Do72vHeVvXTM1l2RXIJ85FUUiVzmCqbn9hI/8YBNbgl91
         lYNa+Dssz5RhYgNDErgxaHjRhMufUtBuVDQBhblbS9N65f/zY7irF06zFLiueHdk+H3x
         Ea5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNoHGstq+LO7BhUZ3HmJ8mnvTh0UXoG+1bhN2X33teY=;
        b=NqzZAW6nloqxN6kx1XElAY/gOWvthSCWHqkfUjsS7PJ9M5vPs3lV1N9fVKxGvwMcHk
         eOJiHW41zS9y6V7MnRRSIV7/7juADF9SfVTg/WXWjQ8CjEChjV27RRQRDteBwxqbYklf
         kugX7aAQuM4NgjPDLzXu5Xjx0ojFO/TaFKoe8vwqIdNtvlC7cDWRpwuRyEGF81pDtuad
         x+wl2xfB8JqZoAYsNg5h9itrVU5cSyp/PQqTSkbQNEFd1gZDdg2qDs4rpiTEh+g5+9fM
         W5XsnA/PNCojT07i/HSCMv+MZJJ6KCG8kixqHSRRs9WGG81g3lWpaaUvTnakHPiafi8R
         Sgrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf00sj35ZOU+QIeJ3Zy/cxZMxjptYQZltH+fIFsEc0bE+KF3LwXW
	h4B8eUCPVqQNPg1SbiG3o3M=
X-Google-Smtp-Source: AMsMyM4rvpCeDb7bbX7h5/Bqo687V3x/KbYYoWVR3dFrwMAhURkQLzBYektXQ+ns1hFyiIjX7JR+jg==
X-Received: by 2002:a05:6870:960c:b0:13b:f4f1:7c51 with SMTP id d12-20020a056870960c00b0013bf4f17c51mr27078413oaq.232.1667775938212;
        Sun, 06 Nov 2022 15:05:38 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:264d:b0:668:d7a2:6181 with SMTP id
 f13-20020a056830264d00b00668d7a26181ls1690897otu.11.-pod-prod-gmail; Sun, 06
 Nov 2022 15:05:37 -0800 (PST)
X-Received: by 2002:a05:6830:3145:b0:66c:7fee:a635 with SMTP id c5-20020a056830314500b0066c7feea635mr10144544ots.264.1667775937576;
        Sun, 06 Nov 2022 15:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667775937; cv=none;
        d=google.com; s=arc-20160816;
        b=l+Of3sh1qihmfedehB/m2F0saSAPuWMXOCLcYg8/W/vtawUnXczOiDz37RWDppeUew
         MA64dDotzPJgEbWc9X3fw+ACwjd9gSIo8odHY2/mGA2v9nF1OrdJxT6UnrNpdDQ5c+7w
         /Q97tJvRuUlRbJW/OpROomDjiyeHyQ8GiY3SUQ6zrhKvfa0RIM2LAn/MT/yENaRsy9Cj
         1pw+37GsZyvV/AlZgV0gyovrNeIPTlftTGoCmZ2X0AXrZJmeu0Zt51TYYouyhflOC9ur
         qoOcELxXosJfQXaOG9R7wM3P9j/x4T9RD09rnjhRfWnzpO4JUKqGyX9gF5ux8icJDuUZ
         GgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=2nM8gM+pf+P217sv1OW89TBUTtksjuFIka/f2q/Ywt0=;
        b=je+JdFheGtIUbm71Tmd2uZRogbMQcdgwYufHSTW4J8Uhe5IPXZZ///tFy2vopQWzd9
         JkM3Y3DDXke3R3xB/3HZOaMLl4jxVM3JU8A0sQ8vYt2rvQsQlnLBJ74DZMXGXn0hqcnU
         bmMZ5CWfgDzx9ZwSl0snesJAAQhL5tYfzFFESJK/vKx76aXtuWO6zojMjN6XXMggKrBl
         xBMQUkwPgNoqQfaFHGASGvdxq6+0hqzdubWTgTfqjw8JHlGXKUTr6xawL9madh+0ELdp
         Ky4xScJ1jkzzaQos+n2fSB12cLmzO1Tm/M98H13e82QggQC5SpXtnC6s90YcMvmJoGEe
         i3tw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id v3-20020aca6103000000b00359a21e3ffesi223291oib.2.2022.11.06.15.05.36
        for <jailhouse-dev@googlegroups.com>;
        Sun, 06 Nov 2022 15:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.96,142,1665414000"; 
   d="scan'208";a="139133151"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2022 08:05:35 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E95F940071E7;
	Mon,  7 Nov 2022 08:05:33 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND 2/3] configs: arm64: Add root cell config for Renesas RZ/G2M SoC
Date: Sun,  6 Nov 2022 23:05:22 +0000
Message-Id: <20221106230523.22567-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
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

Add root cell config for Renesas RZ/G2M SoC based on Renesas BSP-3.0.0 [0]
(5.10 kernel).

Tested on HopeRun HiHope RZ/G2M platform [1].

[0] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 configs/arm64/renesas-r8a774a1.c | 1134 ++++++++++++++++++++++++++++++
 1 file changed, 1134 insertions(+)
 create mode 100644 configs/arm64/renesas-r8a774a1.c

diff --git a/configs/arm64/renesas-r8a774a1.c b/configs/arm64/renesas-r8a774a1.c
new file mode 100644
index 00000000..1d51c829
--- /dev/null
+++ b/configs/arm64/renesas-r8a774a1.c
@@ -0,0 +1,1134 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for HopeRun HiHope RZ/G2M platform
+ * based on R8A774A1/R8A774A3
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[148];
+	struct jailhouse_irqchip irqchips[4];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x88000000,
+			.size =       0x1000000,
+		},
+		.debug_console = {
+			.address = 0xe6e88000,
+			.size = 0x40,
+			.type = JAILHOUSE_CON_TYPE_SCIF,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0xf1010000,
+				.gicc_base = 0xf102f000,
+				.gich_base = 0xf1040000,
+				.gicv_base = 0xf106f000,
+				.maintenance_irq = 25,
+			}
+		},
+		.root_cell = {
+			.name = "Renesas HopeRun HiHope RZ/G2M",
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x48000000,
+			.virt_start = 0x48000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Leave hole for hypervisor */
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start = 0x89000000,
+			.virt_start = 0x89000000,
+			.size = 0x6400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM - reserved for inmate */ {
+			.phys_start = 0x8f400000,
+			.virt_start = 0x8f400000,
+			.size = 0x19c00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0xa9000000,
+			.virt_start = 0xa9000000,
+			.size = 0x17000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM */ {
+			.phys_start = 0x600000000,
+			.virt_start = 0x600000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* QOS */ {
+			.phys_start = 0xe67e0000,
+			.virt_start = 0xe67e0000,
+			.size = 0x10090,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* RWDT */ {
+			.phys_start = 0xe6020000,
+			.virt_start = 0xe6020000,
+			.size = 0x0c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO0 */ {
+			.phys_start = 0xe6050000,
+			.virt_start = 0xe6050000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO1 */ {
+			.phys_start = 0xe6051000,
+			.virt_start = 0xe6051000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO2 */ {
+			.phys_start = 0xe6052000,
+			.virt_start = 0xe6052000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO3 */ {
+			.phys_start = 0xe6053000,
+			.virt_start = 0xe6053000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO4 */ {
+			.phys_start = 0xe6054000,
+			.virt_start = 0xe6054000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO5 */ {
+			.phys_start = 0xe6055000,
+			.virt_start = 0xe6055000,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO6 */ {
+			.phys_start = 0xe6055400,
+			.virt_start = 0xe6055400,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GPIO7 */ {
+			.phys_start = 0xe6055800,
+			.virt_start = 0xe6055800,
+			.size = 0x50,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PFC */ {
+			.phys_start = 0xe6060000,
+			.virt_start = 0xe6060000,
+			.size = 0x50c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT0 */ {
+			.phys_start = 0xe60f0000,
+			.virt_start = 0xe60f0000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT1 */ {
+			.phys_start = 0xe6130000,
+			.virt_start = 0xe6130000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT2 */ {
+			.phys_start = 0xe6140000,
+			.virt_start = 0xe6140000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CMT3 */ {
+			.phys_start = 0xe6148000,
+			.virt_start = 0xe6148000,
+			.size = 0x1004,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CPG */ {
+			.phys_start = 0xe6150000,
+			.virt_start = 0xe6150000,
+			.size = 0x0bb0,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* RST */ {
+			.phys_start = 0xe6160000,
+			.virt_start = 0xe6160000,
+			.size = 0x018c,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SYSC */ {
+			.phys_start = 0xe6180000,
+			.virt_start = 0xe6180000,
+			.size = 0x0400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe6198000,
+			.virt_start = 0xe6198000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe61a0000,
+			.virt_start = 0xe61a0000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TSC */ {
+			.phys_start = 0xe61a8000,
+			.virt_start = 0xe61a8000,
+			.size = 0x0100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* INTC EX */ {
+			.phys_start = 0xe61c0000,
+			.virt_start = 0xe61c0000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU0 */ {
+			.phys_start = 0xe61e0000,
+			.virt_start = 0xe61e0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU1 */ {
+			.phys_start = 0xe6fc0000,
+			.virt_start = 0xe6fc0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU2 */ {
+			.phys_start = 0xe6fd0000,
+			.virt_start = 0xe6fd0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU3 */ {
+			.phys_start = 0xe6fe0000,
+			.virt_start = 0xe6fe0000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TMU4 */ {
+			.phys_start = 0xffc00000,
+			.virt_start = 0xffc00000,
+			.size = 0x30,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C0 */ {
+			.phys_start = 0xe6500000,
+			.virt_start = 0xe6500000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C1 */ {
+			.phys_start = 0xe6508000,
+			.virt_start = 0xe6508000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C2 */ {
+			.phys_start = 0xe6510000,
+			.virt_start = 0xe6510000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C3 */ {
+			.phys_start = 0xe66d0000,
+			.virt_start = 0xe66d0000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C4 */ {
+			.phys_start = 0xe66d8000,
+			.virt_start = 0xe66d8000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C5 */ {
+			.phys_start = 0xe66e0000,
+			.virt_start = 0xe66e0000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C6 */ {
+			.phys_start = 0xe66e8000,
+			.virt_start = 0xe66e8000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* I2C DVFS */ {
+			.phys_start = 0xe60b0000,
+			.virt_start = 0xe60b0000,
+			.size = 0x425,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF0 */ {
+			.phys_start = 0xe6540000,
+			.virt_start = 0xe6540000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF1 */ {
+			.phys_start = 0xe6550000,
+			.virt_start = 0xe6550000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF2 */ {
+			.phys_start = 0xe6560000,
+			.virt_start = 0xe6560000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF3 */ {
+			.phys_start = 0xe66a0000,
+			.virt_start = 0xe66a0000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSCIF4 */ {
+			.phys_start = 0xe66b0000,
+			.virt_start = 0xe66b0000,
+			.size = 0x60,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HSUSB */ {
+			.phys_start = 0xe6590000,
+			.virt_start = 0xe6590000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 CLKSEL */ {
+			.phys_start = 0xe6590630,
+			.virt_start = 0xe6590630,
+			.size = 0x2,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 |
+				JAILHOUSE_MEM_IO_32 |JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB DMAC0 */ {
+			.phys_start = 0xe65a0000,
+			.virt_start = 0xe65a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB DMAC1 */ {
+			.phys_start = 0xe65b0000,
+			.virt_start = 0xe65b0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB3 PHY */ {
+			.phys_start = 0xe65ee000,
+			.virt_start = 0xe65ee000,
+			.size = 0x90,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC0 */ {
+			.phys_start = 0xe6700000,
+			.virt_start = 0xe6700000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC1 */ {
+			.phys_start = 0xe7300000,
+			.virt_start = 0xe7300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DMAC2 */ {
+			.phys_start = 0xe7310000,
+			.virt_start = 0xe7310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU DS0 */ {
+			.phys_start = 0xe6740000,
+			.virt_start = 0xe6740000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU DS1 */ {
+			.phys_start = 0xe7740000,
+			.virt_start = 0xe7740000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU HC */ {
+			.phys_start = 0xe6570000,
+			.virt_start = 0xe6570000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU MM */ {
+			.phys_start = 0xe67b0000,
+			.virt_start = 0xe67b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU MP */ {
+			.phys_start = 0xec670000,
+			.virt_start = 0xec670000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU PV0 */ {
+			.phys_start = 0xfd800000,
+			.virt_start = 0xfd800000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU PV1 */ {
+			.phys_start = 0xfd950000,
+			.virt_start = 0xfd950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU VC0 */ {
+			.phys_start = 0xfe6b0000,
+			.virt_start = 0xfe6b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IPMMU VI0 */ {
+			.phys_start = 0xfebd0000,
+			.virt_start = 0xfebd0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AVB */ {
+			.phys_start = 0xe6800000,
+			.virt_start = 0xe6800000,
+			.size = 0x800,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CAN0 */ {
+			.phys_start = 0xe6c30000,
+			.virt_start = 0xe6c30000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CAN1 */ {
+			.phys_start = 0xe6c38000,
+			.virt_start = 0xe6c38000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CANFD */ {
+			.phys_start = 0xe66c0000,
+			.virt_start = 0xe66c0000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM0 */ {
+			.phys_start = 0xe6e30000,
+			.virt_start = 0xe6e30000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM1 */ {
+			.phys_start = 0xe6e31000,
+			.virt_start = 0xe6e31000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM2 */ {
+			.phys_start = 0xe6e32000,
+			.virt_start = 0xe6e32000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM3 */ {
+			.phys_start = 0xe6e33000,
+			.virt_start = 0xe6e33000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM4 */ {
+			.phys_start = 0xe6e34000,
+			.virt_start = 0xe6e34000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM5 */ {
+			.phys_start = 0xe6e35000,
+			.virt_start = 0xe6e35000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PWM6 */ {
+			.phys_start = 0xe6e36000,
+			.virt_start = 0xe6e36000,
+			.size = 0x8,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* TPU */ {
+			.phys_start = 0xe6e80000,
+			.virt_start = 0xe6e80000,
+			.size = 0x148,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF0 */ {
+			.phys_start = 0xe6e60000,
+			.virt_start = 0xe6e60000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF1 */ {
+			.phys_start = 0xe6e68000,
+			.virt_start = 0xe6e68000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF2 */ {
+			.phys_start = 0xe6e88000,
+			.virt_start = 0xe6e88000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF3 */ {
+			.phys_start = 0xe6c50000,
+			.virt_start = 0xe6c50000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF4 */ {
+			.phys_start = 0xe6c40000,
+			.virt_start = 0xe6c40000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SCIF5 */ {
+			.phys_start = 0xe6f30000,
+			.virt_start = 0xe6f30000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF0 */ {
+			.phys_start = 0xe6e90000,
+			.virt_start = 0xe6e90000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF1 */ {
+			.phys_start = 0xe6ea0000,
+			.virt_start = 0xe6ea0000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF2 */ {
+			.phys_start = 0xe6c00000,
+			.virt_start = 0xe6c00000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* MSIOF3 */ {
+			.phys_start = 0xe6c10000,
+			.virt_start = 0xe6c10000,
+			.size = 0x64,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN0 */ {
+			.phys_start = 0xe6ef0000,
+			.virt_start = 0xe6ef0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN1 */ {
+			.phys_start = 0xe6ef1000,
+			.virt_start = 0xe6ef1000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN2 */ {
+			.phys_start = 0xe6ef2000,
+			.virt_start = 0xe6ef2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN3 */ {
+			.phys_start = 0xe6ef3000,
+			.virt_start = 0xe6ef3000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN4 */ {
+			.phys_start = 0xe6ef4000,
+			.virt_start = 0xe6ef4000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN5 */ {
+			.phys_start = 0xe6ef5000,
+			.virt_start = 0xe6ef5000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN6 */ {
+			.phys_start = 0xe6ef6000,
+			.virt_start = 0xe6ef6000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VIN7 */ {
+			.phys_start = 0xe6ef7000,
+			.virt_start = 0xe6ef7000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec500000,
+			.virt_start = 0xec500000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec5a0000,
+			.virt_start = 0xec5a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec540000,
+			.virt_start = 0xec540000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec541000,
+			.virt_start = 0xec541000,
+			.size = 0x280,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SOUND */ {
+			.phys_start = 0xec760000,
+			.virt_start = 0xec760000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AUDMA0 */ {
+			.phys_start = 0xec700000,
+			.virt_start = 0xec700000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* AUDMA1 */ {
+			.phys_start = 0xec720000,
+			.virt_start = 0xec720000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* XHCI0 */ {
+			.phys_start = 0xee000000,
+			.virt_start = 0xee000000,
+			.size = 0xc00,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB3 PERI */ {
+			.phys_start = 0xee020000,
+			.virt_start = 0xee020000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* OHCI0 */ {
+			.phys_start = 0xee080000,
+			.virt_start = 0xee080000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* OHCI1 */ {
+			.phys_start = 0xee0a0000,
+			.virt_start = 0xee0a0000,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* EHCI0 */ {
+			.phys_start = 0xee080100,
+			.virt_start = 0xee080100,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* EHCI1 */ {
+			.phys_start = 0xee0a0100,
+			.virt_start = 0xee0a0100,
+			.size = 0x100,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 PHY0 */ {
+			.phys_start = 0xee080200,
+			.virt_start = 0xee080200,
+			.size = 0x700,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* USB2 PHY1 */ {
+			.phys_start = 0xee0a0200,
+			.virt_start = 0xee0a0200,
+			.size = 0x700,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI0 */ {
+			.phys_start = 0xee100000,
+			.virt_start = 0xee100000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI1 */ {
+			.phys_start = 0xee120000,
+			.virt_start = 0xee120000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI2 */ {
+			.phys_start = 0xee140000,
+			.virt_start = 0xee140000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* SDHI3 */ {
+			.phys_start = 0xee160000,
+			.virt_start = 0xee160000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* GSX */ {
+			.phys_start = 0xfd000000,
+			.virt_start = 0xfd000000,
+			.size = 0x40000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe100000,
+			.virt_start = 0xfe100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0xfe200000,
+			.virt_start = 0xfe200000,
+			.size = 0x200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0x30000000,
+			.virt_start = 0x30000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI0 */ {
+			.phys_start = 0x38000000,
+			.virt_start = 0x38000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xee800000,
+			.virt_start = 0xee800000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xee900000,
+			.virt_start = 0xee900000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xeea00000,
+			.virt_start = 0xeea00000,
+			.size = 0x200000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PCI1 */ {
+			.phys_start = 0xc8000000,
+			.virt_start = 0xc8000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPCI0 */ {
+			.phys_start = 0xfe8df000,
+			.virt_start = 0xfe8df000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPCS */ {
+			.phys_start = 0xfe90f000,
+			.virt_start = 0xfe90f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IVDP1C */ {
+			.phys_start = 0xfe8d0000,
+			.virt_start = 0xfe8d0000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* IVDP1C */ {
+			.phys_start = 0xfe8d0200,
+			.virt_start = 0xfe8d0200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VCPLF */ {
+			.phys_start = 0xfe910000,
+			.virt_start = 0xfe910000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VCPLF */ {
+			.phys_start = 0xfe910200,
+			.virt_start = 0xfe910200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VDPB */ {
+			.phys_start = 0xfe900000,
+			.virt_start = 0xfe900000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VDPB */ {
+			.phys_start = 0xfe900200,
+			.virt_start = 0xfe900200,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FDP0 */ {
+			.phys_start = 0xfe940000,
+			.virt_start = 0xfe940000,
+			.size = 0x2400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FDP0 */ {
+			.phys_start = 0xfe950000,
+			.virt_start = 0xfe950000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD0 */ {
+			.phys_start = 0xfea27000,
+			.virt_start = 0xfea27000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD1 */ {
+			.phys_start = 0xfea2f000,
+			.virt_start = 0xfea2f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* FCPVD2 */ {
+			.phys_start = 0xfea37000,
+			.virt_start = 0xfea37000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP */ {
+			.phys_start = 0xfe960000,
+			.virt_start = 0xfe960000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP-B */ {
+			.phys_start = 0xfe96f000,
+			.virt_start = 0xfe96f000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD0 */ {
+			.phys_start = 0xfea20000,
+			.virt_start = 0xfea20000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD1 */ {
+			.phys_start = 0xfea28000,
+			.virt_start = 0xfea28000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPD2 */ {
+			.phys_start = 0xfea30000,
+			.virt_start = 0xfea30000,
+			.size = 0x5000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSP */ {
+			.phys_start = 0xfe9a0000,
+			.virt_start = 0xfe9a0000,
+			.size = 0x8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* VSPI0 */ {
+			.phys_start = 0xfe9af000,
+			.virt_start = 0xfe9af000,
+			.size = 0x200,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CSI20 */ {
+			.phys_start = 0xfea80000,
+			.virt_start = 0xfea80000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* CSI40 */ {
+			.phys_start = 0xfeaa0000,
+			.virt_start = 0xfeaa0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* HDMI0 */ {
+			.phys_start = 0xfead0000,
+			.virt_start = 0xfead0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* DU */ {
+			.phys_start = 0xfeb00000,
+			.virt_start = 0xfeb00000,
+			.size = 0x70000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* LVDS */ {
+			.phys_start = 0xfeb90000,
+			.virt_start = 0xfeb90000,
+			.size = 0x14,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+		/* PRR */ {
+			.phys_start = 0xfff00044,
+			.virt_start = 0xfff00044,
+			.size = 0x4,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0xf1010000,
+			.pin_base = 416,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221106230523.22567-3-prabhakar.mahadev-lad.rj%40bp.renesas.com.
