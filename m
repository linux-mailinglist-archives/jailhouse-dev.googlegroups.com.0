Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4NTQPYAKGQELZNA7LQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id F351E1297D3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 16:14:59 +0100 (CET)
Received: by mail-pf1-x43e.google.com with SMTP id j7sf11979620pfa.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 07:14:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577114098; cv=pass;
        d=google.com; s=arc-20160816;
        b=ozXx1DUz6Gz5iHTBYFaCcx7wqEW86u7sk87IAlQr3OJFDr3+OA3hHwc4FvcnoZg15+
         h6mLonzEj0AoDMSJ/vdXHLUhf7f+BoGapMnbCDsMWi6ZRJK3r6ofDlOOn5gKhbPNxIZ1
         xvhYcek3BC2M8EroKRq1zWKRwZtiXlZZ+ByiJYdRjAzOjOer3eijTi8jYTnwMvuMJvoX
         +BLcMcFfRMIE4wDKQtlDnbm2q9u1zIQSUQ4EsbJr4b8N9ucIMJb+vfg6ljZj6x8AWdII
         68+2CIv2vrsW8Bye5pQntWiO+/ScgfixAZukw0E7Pgr1FhSrAiMFyewcBNpSfIN/8VQK
         KBBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3n9rBRVVVG+Lb6bNh+JAlg7/mfKP1e7fDB9yZ1rjww0=;
        b=dQMgAzwGPHoM52aOWOpyqfFaLJPzdZRbAWBuhiP+JK1IT3rAuE60L3XV+BzhEmgdW3
         KCTPzU6yilAI5GDTe+fumrLCeMtRbBRSYaD/6AuM661hSKIVGaJeQcMggaGl/oqGYSmi
         BvFXlzfLsV7vUEJbuG+3QHF2zDC9zcQEbOk3WGoFwJrM53C3PfHCWlqIfK51nKq2hypa
         zOCHyUWLpy72L0UKUfK4tx2TuesOJW/SjbMQVZ9VtsRFhVTCnGUWtwNjJM29xLOBjK+w
         bSGKTwkjnoqSGQriiGb4njAv6R/wjzgebDZ9kkN2ImLgai1JBRwO2TCcw1VJEntbPY0l
         q+9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klt8AIPJ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3n9rBRVVVG+Lb6bNh+JAlg7/mfKP1e7fDB9yZ1rjww0=;
        b=C3dtqTY1TDEpaYfR9dfwx26hBqNw829Mj95thdKlQ75VOXEB1UIWfTQKmeXrHTE7/6
         nKhAclExedLb6xpxoNufMCxKasyyKPugtwaQR+udeMI+P3lGIzgSkq35ANvMe8wkMSW+
         rrSqkMLqKKLM7Dw1GayShq84R58NM35lswYcuVs1pTyZdHjN/4aVSeEsaS5YoZWbU8Q4
         4E1pld/WF66OofQq/kkEoGWBWNOQ2FD8TgJpQJ0XaWlxAe7vuwsEkwUAI6yl/fa5aEu5
         txq3sp4op/W+kS8+Yov1VIobesv5xrkfy0mxx9m/aZ3N3Tm6f9ND53J5QOiDzCeziNcv
         4AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3n9rBRVVVG+Lb6bNh+JAlg7/mfKP1e7fDB9yZ1rjww0=;
        b=XA3RhqxiM8M1lnLKltBwgkhRcurwGbzx9SMqRg3wyIKi6v18dgbmN3zQG7ZMOP9Lo3
         TMJy8/PNFhUhxERfiHFDn3X1DDs9X1flAlIFHbAPlbBtPsxASLJ9DfIdW//uVIatvSKi
         JhFngAZOTIiDau0eZx3Idk+F3QXYQpLtmMwjbkpeXRpFMM86cbC1Jrc/900PMizR6+PE
         zLbOsRh054Likoi9sTU6NvQbaamayZ9m5vcfSntTpZfQz+ZkbJKDhbkmZWg2FEIWVLp7
         VjSYpKR4hoWdSWgJ4Bwag4k6Ts+U+wxgeuK7hQIzrZNtKPlK2K/EZJ3VqUzf9Zr7/xy5
         77LQ==
X-Gm-Message-State: APjAAAUn7skGD20ORCglIysW3VxyBjHmPdjnVJO6YDExxv4En34cjISk
	TMPXM3LhYnxMV+DawDOW+Xw=
X-Google-Smtp-Source: APXvYqwnoJaBLSCmGDSRHHh9DvuY/NyPMmFoGn2tUi7lG+QkxyNnf/vfTnvIA5iE5BTPDFGYvM2Qmg==
X-Received: by 2002:aa7:9816:: with SMTP id e22mr33264451pfl.229.1577114098059;
        Mon, 23 Dec 2019 07:14:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:68cc:: with SMTP id k12ls4087184pgt.15.gmail; Mon, 23
 Dec 2019 07:14:57 -0800 (PST)
X-Received: by 2002:a62:b508:: with SMTP id y8mr8256179pfe.251.1577114097609;
        Mon, 23 Dec 2019 07:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577114097; cv=none;
        d=google.com; s=arc-20160816;
        b=sKxWm3r8PtbzVIiHXbKjEmtXX18aT1Y6PUjEwpbGX+FSoY4z6nZVT3YEz0IWL6vvK2
         nngZiJ4VNhvFzcfMMF8JoBhn51NwJB5LP2PVUbVU2uTl3bngsbqZ9jU3RcSqpmbwfrEb
         viP3Zij4g1Kp9h7p+EnKsasu0j1YSLFqSHR2oQ6fLm8e/nocwUCkFhDsz2mQrRVNWsMn
         Vhb9F4Vk/8XWGvsRW5QMke0Cpcs+Yj6tGqVP2DqtEkm4wAgZ3R5Lt43n2gN2SSasFOvO
         vOkS0piPgH78CM6mk9jnPMWgimqayLDmnv2DuApDWx2EnerCckyOiMThZ+BnbOub1rOG
         pwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+0YRdiUUnsLcIb3majJzSeukmvrZ0ZdCZ4cW+bDvjzY=;
        b=r4Z4HeXcwYNnd8ziZAVXX8mB5UKg++tPd453tuMdWze1anIDOe7P96EtgFO+UW+0Hc
         qyNQvpTHmeVvftLy20NebLs6+1mIc5Se6RqfiOziGt3ZzKNzmt8VVx8CBJ2TqkPg7toc
         2OTWchIzldn1XYO/OUdo7FMicOLTQo8//1hjEDT7F1ZbLN4o/XkB+FLWxRZRigra3sXq
         w9/Ujk+gQctj4B6CJYdWENgDX9p1nxYPP9YFM6L/L6yXirgn3CifncA5SdMNir/DtPUn
         Xgi76sE7hrtNEiZTL4d2R1vm8J0YaYNhmPXMnqO0ky1TKVaPRiJLSF8wjcMZ+DrtqJZ4
         cu8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=klt8AIPJ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k1si868232pgj.0.2019.12.23.07.14.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEuam108570;
	Mon, 23 Dec 2019 09:14:56 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBNFEuNa069930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2019 09:14:56 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 09:14:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 09:14:56 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEZ1S020577;
	Mon, 23 Dec 2019 09:14:55 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v4 3/4] configs: arm64: Add gic and uart demos for j721-evm board
Date: Mon, 23 Dec 2019 20:43:52 +0530
Message-ID: <20191223151353.22495-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223151353.22495-1-nikhil.nd@ti.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=klt8AIPJ;       spf=pass
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

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Remove pio_bitmap_size references

 configs/arm64/k3-j721e-evm-gic-demo.c  | 72 ++++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c | 72 ++++++++++++++++++++++++++
 2 files changed, 144 insertions(+)
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c

diff --git a/configs/arm64/k3-j721e-evm-gic-demo.c b/configs/arm64/k3-j721e-evm-gic-demo.c
new file mode 100644
index 00000000..0c122fee
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
index 00000000..05dfd834
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
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191223151353.22495-4-nikhil.nd%40ti.com.
