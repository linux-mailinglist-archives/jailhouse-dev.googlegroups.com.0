Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOHD5LVAKGQEQOQSNTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B069926AA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 16:27:05 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id i13sf3891837qtq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 07:27:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566224824; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y1y17XIDYjBql0BEvm8OvC438i/pHsjiIAHCN46o7zFEFeLBAT+8qqUgAV5jjoCoS7
         XF8clU4kWOWY7QgqmDRfXh22ktZwB6CZvlUCvemPkUI3hjqp7Bpi3FoU0vBUlA1fdAXQ
         30KHyKWlkkb6leXA+SI4mAPLfbfds8zFUqJfVeO8VgGsHgAPb1xePlRNzdQZE9zI393A
         ZAsqxGjDdWIGUUAAtu7HLywpQAlbeSj2p5cCv/3qSaUssEDcQgi+i+97oEPISpc9vfAR
         t3FwrdbmAwnknISHTHxhJa3j+UlY/eSsyx0xC/wlUuJkudlZDUnSvEzRjxIWlg0QVo8D
         2fVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/7cHvgyPcq7CHOYhMIWAcV2dbqwX4dEhZQZbDxkm8a0=;
        b=In+qkAKBMkTQWzyg80RBp+8VOv7sPEONGXeLKhfucJu+8u1XAQX6nbT4hZ6Ic/LA0e
         NrqHAHx1icfsew/sICJmDfR4L3zn2S0FJkIje6+OJZpxwOnjZn0C27QpW1bhIhl8Y6Q4
         N/WnaadLVpgKSVoXBGEIPgcQrc6HooA5fMzse5oO1EdOKgQS3tMYHX2hSiZFxLBDKcdQ
         Lf64BS//KdAn2PkFO6Vb/+zXYvIjNSnA1LWklp9EUzOSv0U766EE8O8YwNxv98humDR7
         K/9K89DXv3SWYuFBONabv8r4qkEYT6ams8jWHRKtzrFOiRRFDH71NUDa29wT9RgQYYS1
         TS8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DuO+pQLR;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/7cHvgyPcq7CHOYhMIWAcV2dbqwX4dEhZQZbDxkm8a0=;
        b=ZxntESW+rr8L37QTGp9I6jTAdd7+eY7nRwfydaXpg5YKtw90cu+b2ZMBjTDPmL3o3g
         EPg+7vs4zGOo9oOxY7GnWKbF6ekCmEV8sGmWKFaX6Z74Oz24zPU+DLZynytic1+PykvD
         hWNPFzumHniYqqIrfdB9FFlvftDwdIZvnsLNTJEHJs4YR8PmuCa7X82Ut147GBkHUdWX
         F++JVVk3tvHxMCqpQOhGZl9IiBXaNBb4mZQWvXpMllrYFqfYGOCsYZWQ8b3wO8+SSupK
         cpQs1jVPk1Go8puH3w1FKS1YfzmuDsh45/+BXt56gvgZPUr63+iDff97S37BykTJInba
         5cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/7cHvgyPcq7CHOYhMIWAcV2dbqwX4dEhZQZbDxkm8a0=;
        b=AG8NpIjzwTpK9LeFZIZ2XN5PNu56y8e9Xt1tuuneHhdqgUiNvN5eK+9NvZiFhAjFey
         9DyF2727HoqwzX7kJVpd2a+E9Fq2DO5cctaFrB8g7gJ47mEEXXK3i1wHphBUoUzyar7y
         FUCrU0k6WdXDckmErZHs3uBwM7uOgU/PnF0IKvzEsNFnPIZZZoV9797GEpTaRTetFQSE
         a6dC+tB312ZdzoorDj5B/NqU/+/YGBo8CPoBeSNX2K8PFnqp+OAASHUm80v3yIB57rAo
         GNEkhwPdQZ6mBRd3O+LuTxfipHkqi2k2KFNf4bShWPvxRkTnpVnwyWBFc13FjnYDQdz4
         ZVbg==
X-Gm-Message-State: APjAAAVpWqCaKI+jNBbeV/VmkCFxsb5c/I4+qQ9HAlCltrEfeZlASzEd
	72bBDT6OmS8gbuzO6Mad2jI=
X-Google-Smtp-Source: APXvYqyq3LM+3lFyf58ZOF18lSfKOQkmxvhJo/XUmV/O02BywEuWtDrMbmXFoz3/TuuZ2aijKF2c+A==
X-Received: by 2002:a37:65d2:: with SMTP id z201mr20875565qkb.413.1566224824367;
        Mon, 19 Aug 2019 07:27:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ee15:: with SMTP id i21ls1207803qkg.14.gmail; Mon, 19
 Aug 2019 07:27:03 -0700 (PDT)
X-Received: by 2002:a37:79c4:: with SMTP id u187mr1971536qkc.91.1566224823854;
        Mon, 19 Aug 2019 07:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566224823; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZg4La3d26VfIzw82/R75osh4PLDyyHEbI+tEMqd0tIKqACoQVss45B6eYPH3cMAMn
         M676cFo5wXR6A6nCFDUHQ1eOD1BEyG8iw6+bakke6qnRFdbR7TaDkE3qTQwyy7QOdzZ2
         Ysm2sEBh0sraXIb0lbJRti4pQcV0CQM7kDfPAW5zsaj/riqBG38ZwI5+szPhW0XEMCK8
         95LYyHlZCdBDXoFFvlZMjj0UKAtQQ1tQucAN7d/nf+/q+vk8ha8tE4HuYLBfGyoSEkDQ
         zsudhB+ULDlOJYVaUF28trM9Z5s/61SLhmPqt4cpVVquhSFOs5s13smrSxn5dLl9gZyN
         cPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=H23fB4DOgaFGJbHV/BR032WvyXYN0EH9Cs3jnpCOwU4=;
        b=Q/EztP+LgLRJRFtAjY0Bi1U6d5bMh/NMnXxBbhvprnxsVyf+iVWvHiLcU79YfsWuR1
         H03xiNTlUnG8R46Q/8uBDu2aySPNX3qbtxylZQNWwwo+crqTTaEIdc/O2KG6BErMlHaK
         MAT6QRuB9Hbtecm0ukSR/4xqMqJ1tIp2suW7KOlDpEDmUGFABr0DHUYNKLjwEyhIqQAh
         vg9ZLcvz+jTDD4forhdaIaVNmtUXX6Z+vQhkA4Bolo2+CJTE51u0mQcK1WY8g6MUohrO
         sKkehciBVAvas6oWBGohtJCXCpAVkjYccEoB58HURDgPox5uBjcbHY4ubp87XZpH7DR5
         jnTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DuO+pQLR;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id 135si981148qki.6.2019.08.19.07.27.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JER3aD084563;
	Mon, 19 Aug 2019 09:27:03 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JER2dR126303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 09:27:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 09:27:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 09:27:02 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQth1128856;
	Mon, 19 Aug 2019 09:27:01 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 3/4] configs: arm64: Add gic and uart demos for j721-evm board
Date: Mon, 19 Aug 2019 19:56:52 +0530
Message-ID: <1566224813-20129-4-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=DuO+pQLR;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

Add GIC and UART demo cell configs for j721e-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo and uart-demo.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes from v1:
* Remove pio_bitmap_size references

 configs/arm64/k3-j721e-evm-gic-demo.c  | 72 ++++++++++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c | 72 ++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c

diff --git a/configs/arm64/k3-j721e-evm-gic-demo.c b/configs/arm64/k3-j721e-evm-gic-demo.c
new file mode 100644
index 0000000..0c122fe
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-gic-demo.c
@@ -0,0 +1,72 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on K3 based platforms.
+ * 1CPU, 64K RAM, 1 serial port.
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *  Lokesh Vutla <lokeshvutla@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_MDR_QUIRK |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* main_uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x89ff00000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/k3-j721e-evm-uart-demo.c b/configs/arm64/k3-j721e-evm-uart-demo.c
new file mode 100644
index 0000000..05dfd83
--- /dev/null
+++ b/configs/arm64/k3-j721e-evm-uart-demo.c
@@ -0,0 +1,72 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for uart-demo inmate on K3 based platforms:
+ * 1 CPU, 64K RAM, serial port 3
+ *
+ * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Nikhil Devshatwar <nikhil.nd@ti.com>
+ *  Lokesh Vutla <lokeshvutla@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "uart-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_MDR_QUIRK |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* main_uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x89ff00000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1566224813-20129-4-git-send-email-nikhil.nd%40ti.com.
