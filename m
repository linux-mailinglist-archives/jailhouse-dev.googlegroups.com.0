Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBDHUU2PAMGQET6LWUDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516A674535
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 22:45:49 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id h9-20020a1ccc09000000b003db1c488826sf2432030wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 13:45:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674164749; cv=pass;
        d=google.com; s=arc-20160816;
        b=F+4o1pvjtZstQCvh/sPaKoIO0uyR/BS3IYaH1JfD8vfDtKsgGk/n0/ff72kCEEl+l/
         PTqc1VVDQxBVixJxf+eliCQyAhgKueH+g4nwqj4HuAZ6/LHN+qZMhrRMRAhRqOULbxhP
         bKwKW89VhnVo45dIH8PAP+Ntl2BPZYpxz+68Ist3XBB8v2nhuKCD6RjcmrEJzfkM/juj
         4WROjR/q5mIstjo4hgMVJeDmxvZlpLuEmTBnBjOEmm4i3Kif+qE14Uz4gt+dqDfVhJ0G
         7mLNHs6cRFxDt6g/qFxJjI9A4uuHYyXd3N15BQu2YHX6i4a7X82Q0zwiZJ9OMv50KGBl
         5o3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=qiUWBxZgbtoT+ovE7HHJx+PKnKRgTj6eYorhIRSr1gw=;
        b=o5g7vcTU6Obji9Lwu83IfDGNxlqaLaQC0zcM0zm9jhQ4sAnq8DxGxJODT/J6xhbZsJ
         qYYpQooxO+m9vzLceOoVtYnK/nbE0Qh8HIU4Mg3zpOJXwY7ckkrfMnSnkuTTel6hMtRs
         gyNDHdWiSY985+3dIFBA7iVCWg12JG/CxAR+EzjYT2MpXpOid+CwFqGZ5OOwqQM4u11x
         Y0gPo0sFJYx1cfNiXKCGy7pTH78baev7637mEvkwUb6o1vlLY2yk9iiyBRBZpjiy2q3V
         SRrbE6mjAJ6aC92WJMD4afsXaDNI0SBGB8RFUJ+j4HJoayeF2r2MdlBinhN1AprfyBeB
         luew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YPg3SWRc;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::32f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiUWBxZgbtoT+ovE7HHJx+PKnKRgTj6eYorhIRSr1gw=;
        b=WusBcpWCjHDBUVvSKVrBDy5Yf/0WNXJodzRrJ5i3PtUBRTMEUmFdT4oKDSBFkgpb0a
         /cynG9nIpLLSzd5ePDgNrmEO2jxvAKXCaJDiz/4lU28hlWLxG2jY5iJRANQXbbnLc1rS
         KhgU63VyAo/n4cBXrcQ9B8iXdSfJ03enyUSs7teizKSAuYvjIDqcepVnQveVzLJCu+y1
         QZhn2dVqTX5wmNLj/Ud0HsEG6d2054TaTSF/Ldtiw/VjfLWTel1D+JWuNnAm54+Znorb
         dI15aE3FE0d6TigjCAXHWWND5sUCoEqUkj9wpMoWjrCbnzdFORaCoA9zZWIFnj5z1Xfy
         lN3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qiUWBxZgbtoT+ovE7HHJx+PKnKRgTj6eYorhIRSr1gw=;
        b=jBAgfGL9NWA4aL/q9yymmnwbg25di+7Ujhgky8Y/hE+Rx7u0v1nzSHdWMMBwNhz/6k
         zmGhDAS1S9CyGpzFk9WkrxPquuG8whrOkdVsEC5H6itei3nPrY8E22oGDyVBQ1X/qPX7
         iNGmAQCyrF3dMu64taFMva3pi97/NOaAtTouuFSwQ8MlusXQUoHtlypv7QH/iNDOmB57
         UxGwPknkI/RSSaL8Ff+WNEgAT8XRqTciYahSulJJfWY6VLp6iGyczhrgibTGDd8+ePrz
         EVE1YymAuzEr5S2XRoOWyFywniBK4quPHDtZ/8e9tVm6MCMcDTQO0RXhRsgq5FF1INmm
         2WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qiUWBxZgbtoT+ovE7HHJx+PKnKRgTj6eYorhIRSr1gw=;
        b=vcfAPGEXRL+R5Mhx3OQpvIQXp111t02T6B9H9mOLikHqUrbT2hJ8KZun4uIewAVAha
         TSSfdrR8q+vKaugeethDiVC1UeL1r6mHyvOc3z37z7V/AwUKlbkYOHPCz2dwfrnDylBG
         eTTK9WS7zFSlbKLbXG+nkotjAWjaUzqpGDvlAi02Q5yEUuI/QzSvchztFsUxKcOMPKEN
         6PmscKpN5IjXzSO5ZzoBXTz7H6VcZ/hF3ggzo4IvyUqRB5xN9m2s2xpfbwfyByJKrnJq
         0tMUgGVAlJX5/BG0FOV4JC1IlE2oYzEbdoPj0t9JjQ1frDknxFMs9BTvuzHnd0YYfrIE
         Vr8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koVRKtTHdWzD0EwyxM2KXZq9VR+4ygp6meV+AsWLz9sQMKyKHYi
	n5NS+JNF9A+JnCqr2mz1PFc=
X-Google-Smtp-Source: AMrXdXvRbbpUq15TfDHboktfvJP9vK+1MjFu8XNizwoNn0WkUxMQdqemP4HnZB6S/McvBH2l6GnqUQ==
X-Received: by 2002:a05:600c:a296:b0:3d9:e75b:6d0c with SMTP id hu22-20020a05600ca29600b003d9e75b6d0cmr798064wmb.34.1674164749064;
        Thu, 19 Jan 2023 13:45:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d211:0:b0:225:6559:3374 with SMTP id j17-20020adfd211000000b0022565593374ls3062479wrh.2.-pod-prod-gmail;
 Thu, 19 Jan 2023 13:45:47 -0800 (PST)
X-Received: by 2002:adf:edd1:0:b0:2bd:c6ce:7bfc with SMTP id v17-20020adfedd1000000b002bdc6ce7bfcmr11244189wro.42.1674164747250;
        Thu, 19 Jan 2023 13:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674164747; cv=none;
        d=google.com; s=arc-20160816;
        b=FhFOFFMbSedHc3iJKTeD4g7UVUStaAvW1HTxTLeUusM9AAjTRM/qWII9ZuoN/RjYRR
         ZvopkwieSkGLRVnnRkwzAhfFHZAdE2uqwAYnkIZZwaPp1dAlrCtHhUoWW/+x5sOWuFGL
         XJeEi15yTCGsSoLoyNTYcD14NQEoGS6hln+X7eoMjvK1zW+yQ89E82ecsJwmLIOaPRMm
         PFphA0egP8xCLppcJ3kUI51IHOGhOWQtUzW7/tXtxY9A72Js77qoWS4zqE7XwrWY511R
         plOsx5jsHNeS2owkHzumnqyITJMTy4F4TF6o3dVtYPnMueMkx+xghqBZtmma1mwJMP9z
         KKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vs0gyIWFnEPJBKULAmt9MNH+G3stLxco1LSIB9wIdm8=;
        b=ZApws5tWI6FicMYh8xVQJNOQ8V6z+V+EbJEOlp2r+k97OSMYK2n6PFRi/tLKCOR86n
         P13tQ6/VHhzSfmqQk9gXNqlmRKIqTebCWxcXZvbocJnoHv7PR1ZCZ40wVGRXENZzmJqE
         V2l4VpPpT8j8u4aE3TZEcppT50g1kEWlNYDpgqL2aHOc/CSyXiZonatPVyiejVmo1qge
         j3ePLPH7m/3nZEnH92CUrnVkoL4mKQ0wZeRX6da9O4pZmIuIjL94xgUjX8JbXWmu94Uc
         aregDkeDRro2zLbby7FekyySp1NkaZmYujBTNQRwOgnNo7H5EMhMGh8Wfu9dr8iJkPso
         od6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YPg3SWRc;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::32f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com. [2a00:1450:4864:20::32f])
        by gmr-mx.google.com with ESMTPS id by11-20020a056000098b00b00241d0141fbcsi257654wrb.8.2023.01.19.13.45.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 13:45:47 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::32f as permitted sender) client-ip=2a00:1450:4864:20::32f;
Received: by mail-wm1-x32f.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so4517338wml.3
        for <jailhouse-dev@googlegroups.com>; Thu, 19 Jan 2023 13:45:47 -0800 (PST)
X-Received: by 2002:a05:600c:6008:b0:3db:141c:1e09 with SMTP id az8-20020a05600c600800b003db141c1e09mr7087014wmb.23.1674164746795;
        Thu, 19 Jan 2023 13:45:46 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:3d57:310b:6bc8:3755])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003c70191f267sm337808wmq.39.2023.01.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:45:46 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] configs: arm64: Add inmate-demo cell config for Renesas RZ/G2M
Date: Thu, 19 Jan 2023 21:45:35 +0000
Message-Id: <20230119214536.5247-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=YPg3SWRc;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2a00:1450:4864:20::32f as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add inmate-demo cell config for HopeRun HiHope RZ/G2M platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 configs/arm64/renesas-r8a774a1-inmate-demo.c | 140 +++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 configs/arm64/renesas-r8a774a1-inmate-demo.c

diff --git a/configs/arm64/renesas-r8a774a1-inmate-demo.c b/configs/arm64/renesas-r8a774a1-inmate-demo.c
new file mode 100644
index 00000000..14c77838
--- /dev/null
+++ b/configs/arm64/renesas-r8a774a1-inmate-demo.c
@@ -0,0 +1,140 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for inmate-demo on HopeRun HiHope RZ/G2M
+ * platform based on r8a774a1/r8a774a3: 4xA53 CPUs, SCIF1.
+ *
+ * Copyright (c) 2023, Renesas Electronics Corporation
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
+		.name = "renesas-r8a774a1-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+
+		.vpci_irq_base = 24,
+
+		.console = {
+			.address = 0xe6e68000,
+			.size = 0x40,
+			.type = JAILHOUSE_CON_TYPE_SCIF,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x3c,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory regions (demo) */
+		{
+			.phys_start = 0xa9000000,
+			.virt_start = 0xa9000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa9001000,
+			.virt_start = 0xa9001000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900a000,
+			.virt_start = 0xa900a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900c000,
+			.virt_start = 0xa900c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xa900e000,
+			.virt_start = 0xa900e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* SCIF1 */ {
+			.phys_start = 0xe6e68000,
+			.virt_start = 0xe6e68000,
+			.size = 0x40,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 |
+				 JAILHOUSE_MEM_IO_UNALIGNED | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x89000000,
+			.virt_start = 0x0,
+			.size = 0x6400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				 JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* IVSHMEM */ {
+			.address = 0xf1010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0x1000000, 0x0,
+			},
+		},
+		/* SCIF1 */ {
+			.address = 0xf1010000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0x2000000, 0x0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230119214536.5247-4-prabhakar.mahadev-lad.rj%40bp.renesas.com.
