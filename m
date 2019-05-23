Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOU3TTTQKGQEX7JAGQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id D391D28C31
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 23:16:44 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id r25sf4084013pgv.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:16:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558646203; cv=pass;
        d=google.com; s=arc-20160816;
        b=WmQ+zAw861WTqCaVL8vt2DMxVE/ZB2ExkXAIElmW+upcdxekukRiUwnqz6yiHCpt8k
         qVGcmvteLVJ7BTzIbse3N6X8UvbTkI/S+ZdWP7XievR0qg3AsFmHAY6/Ak/ZYvYznh7f
         Pod4ZmX6B/FJWH8phqfqLCj7znQcTM+ZHHL/trGkbNKEVCuO1mxwmfE3PEu2/WOI/LgZ
         97K3FQiyaKQrL7ldhn+z1cRGyfqyA0bitK2Wh0steYBmW86fvA+pxgBTUdhhltJBtO8b
         l4m/A776ysNC3vQEslliHGHgFwb3gBh7WfQVTrQpk+JYyVbL4u01N/gZRBF9bvnhV8EG
         ZTUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wpU4oyVpqBRhcMr7h8A5AQXn1WTaaQ18ocx3mYCpcLA=;
        b=lFQgQ8OUQX2cK97AUYm5VbKMHDUak5HcnfY9iDppP0ZQMUbPyUUFNqxpPN+ek5nIdf
         NZTKodGw65h39gPvvxpJHvTQvH5lS7nWoJyJc4P4xKVP5Y/s4TreYoHj4Q6jNCF8Dl9F
         nCqOoba2hGC2Nb3watGsqWToQOUCM5S8TUAjm6Gh7d6jlPKFCX539JNqfgd1MvjCGD2W
         2Ol5wQpBaAKQIPhkaukBok95ozO7FnFOtSpZcJiny74NGouBeYpYC3ClQDwgHF7sX1ax
         Rsg04BSSSdLdpAptkC+1OmQceozXKqmL4rtIgGGqK+d3wvvLvO71I2ZiGT4ObLUccVvF
         YDYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q0MYRd5E;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wpU4oyVpqBRhcMr7h8A5AQXn1WTaaQ18ocx3mYCpcLA=;
        b=Aqbk5JezDFV36KC7iYXMCzjIftYbOyQjIIa8rIi57zxF19Rqoug6Gdoghs+lcGP5k/
         ijHcfV1i+1iQ68NB39Sww+6g9WE7qUyM8GczKgepyo71jaqi4cotw8NzXZ7/ZJQD3gne
         kRFFisopHaGgBjq4jWu9AwQTodxQ1PZRJG7PYjXcv8UNgtewn73x6t9mTF1w3TcHWhAg
         R24rLNbJ4Xr6ajqjImsEYRrDcd9IFtpwS3AE7mAnciMkCsQkpsPlF1k2NuspepEDd5od
         HJBjquHLHFdXw2CiKaTP5xKjvN55m1l/gWisY99DlGBUFD1kSQwhk4TsrudrGg2D4jmO
         9QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wpU4oyVpqBRhcMr7h8A5AQXn1WTaaQ18ocx3mYCpcLA=;
        b=GaNZcCHh8j82k7+pTHdtsXny+TnBQFu/BQfYRWOrthY9bJ5GGO0tps/GOO+sTmPXZc
         POlOq43+5vSYC5ONGz9w2uclO6kCxcMPLMj3ryUH0/FWyqtaCiDuVWLGbHBNRVp/0YRH
         0OczzJX0xlmyMFjvrSS1bH+urbI15+OaCqKmaDduJIm/ATwkiPcmH+8ledSmzN6P2oQ+
         Ov+TtzRNvmOIR13K9NbXKy6StxA+7jxDULzEzek+o35SUDua9K9tAyLxTHdZpasxjM0o
         XRsrz4iAY7WF7Xvnt2QvOUmEcpoaq4l5WjnQpPrMqQj915GnPAV0hhwBnY5620jPboX+
         iP4g==
X-Gm-Message-State: APjAAAXq9H6zCXUqyfBIWirvGp/W5peILK4RFb5PMF+vxJpIYsAWTlLX
	l28tENxNjoKFk9nS0UKhwSg=
X-Google-Smtp-Source: APXvYqysBuT3V6gQeyMhiJ7yIN1aDQw/e94qZ8eSM3Uu77gh1ycxuRyqsjWOqyHYX5+3ThwmANuE+A==
X-Received: by 2002:a17:902:f208:: with SMTP id gn8mr102108132plb.312.1558646203014;
        Thu, 23 May 2019 14:16:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7dcb:: with SMTP id y194ls1178943pfc.5.gmail; Thu, 23
 May 2019 14:16:42 -0700 (PDT)
X-Received: by 2002:a63:7443:: with SMTP id e3mr5368742pgn.391.1558646202591;
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558646202; cv=none;
        d=google.com; s=arc-20160816;
        b=YJGlUcMUjWcXzq3iN7bCQTlDFUGXnyynLSKpFdrlUYkvKnUSLJ8YubfnMPpW8CxNkn
         WVZHtBlipK61mcLU6aeXHEpaxrX4WU4Wqc/HFiGRw0W0i+wcjRkC44PvL3paIp2mPGwY
         /ZOoXX0fBA6rZ79gRRI01/vir3NNdqX298tT2uC0gA7R21OrpzNhlLhJjq0mk0VLwbk3
         ORCETSYXoRsSYgTryoD66QJNiJafO6mWmNysQyavQdq/uVJ7u2/oc6Se1O1zSUcRd5z8
         YSHPZKMAt4GVD4/d6yYTaN/jrG+Xr7LLgZ7SnL/wrfvm9Gp8DAQtRm7KPnXQ8S/yLT01
         bRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cQJK2sFwPrSI5kPztRVNfWmK8ILtPgIx96S4qJuYOi4=;
        b=bX71u2aRbQbl2ibBAoErRpAaVsfYoEcqQfiq0IPbB5UIJNLP5OM7kBdVWeGUWU7v8T
         pbug9RZ3HMRXqjgQNIwHUFDcqYhZv23Q9ldsOup38rdaqJvlHp/db2KIj6fzZ0tZ06h/
         j7cbC32x6Bipngm3IXlJgW/ogSA5tbgsaKWMxb+V4CWq0i+vQXVoP+Q/1rhgi+He7l/e
         WytwB6fC5LlcLO72z9Ut2RS3F0YjirOuCmuLQtZj08X5BuFmboZlIlUfNBOTJ7JOJ+bM
         M6+YQsb9eKMuUJNV3aPYV5xBm/qpS5QOKaItgC7tgcwjqHgkusSWSvjx0fv6CiuaFmqc
         OTrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q0MYRd5E;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id z6si17409pgv.0.2019.05.23.14.16.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 14:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfkJ123736;
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NLGfqW091681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 May 2019 16:16:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 16:16:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 16:16:41 -0500
Received: from NiksLab.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NLGfOZ116843;
	Thu, 23 May 2019 16:16:41 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH 2/5] configs: arm64: Add gic and uart demos for j721-evm board
Date: Thu, 23 May 2019 16:16:20 -0500
Message-ID: <20190523211623.9718-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523211623.9718-1-nikhil.nd@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=q0MYRd5E;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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
 configs/arm64/k3-j721e-evm-gic-demo.c  | 72 ++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c | 72 ++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c

diff --git a/configs/arm64/k3-j721e-evm-gic-demo.c b/configs/arm64/k3-j721e-evm-gic-demo.c
new file mode 100644
index 00000000..f92cd880
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
+		.pio_bitmap_size = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART 3 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xd0000000,
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
index 00000000..ea0cba42
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
+		.pio_bitmap_size = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x02810000,
+			.divider = 0x1b,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART 3 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xd0000000,
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
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190523211623.9718-3-nikhil.nd%40ti.com.
For more options, visit https://groups.google.com/d/optout.
