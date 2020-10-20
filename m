Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBKNLXL6AKGQEO54YAMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3e.google.com (mail-vs1-xe3e.google.com [IPv6:2607:f8b0:4864:20::e3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A2293607
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 09:45:46 +0200 (CEST)
Received: by mail-vs1-xe3e.google.com with SMTP id d9sf289493vsl.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 00:45:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603179945; cv=pass;
        d=google.com; s=arc-20160816;
        b=e3mxfHMTrf3Y07cFo/q3BLyTxmeP/8VzdVMQDSWtslyZg1H7QSJJLLYk5PbT/xRKMV
         0lMMDWqsPna/0Y3x67kTaP9IN1zOOngYq/CEir+kwb7qLwsakFqBvgHaQDsXuWjZRu7w
         vRlDqWbmOFuacKq0kS71jHhtTl3h7FjV1qy0HmPWDwK5i2xK5I15okXowJJuJ3q9AsvD
         +BYufHY1wJZPT73QZwsmEodl4Ijsyx1CCZSQsyJg+8PZFdjN/0OWscI0fRrEpxjw54VP
         SEV3IoEp4Z23yWvAr3/GYlUWSAC3zJ7hVy4KJ0I74x1far3g6BXMS14CoNcYwcRg0gfw
         Jy+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=hmbszDDYsy+E7mbdJhZLG9ENMb189HaLXyiJXJJHQ+g=;
        b=W0y+Hxu/MvViIfWfii2ugJ57QsNFRQCnLMEu6+7mmFi1KSiE1weTtRikCVC2/dpdjK
         TGEWo9KX+183vnyp8rqFLC0S6yA1t5sssyP7maUiu9L4vEE32nGQBHP/gCHwa6AE36+H
         AlXWj/8IEGMDBDBLse6s5duf0MEh8JE11ckyxpHhMFIrLEAIeV6UfNDWwXncSLIgMJ73
         S5vN+yHyQtUVYgSjFlgL23G66IVPkoUpH/ktfQC3Ys1hxgZtSdQt43rMO/h2mfgVCOF7
         PNOPZ5/02KDKEovb3cVwWhkHlh244gvAymzWXRavKe8LcdGlC5mxxloy8CaeE/qHM2Kf
         9pCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nf7UWCzK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hmbszDDYsy+E7mbdJhZLG9ENMb189HaLXyiJXJJHQ+g=;
        b=QjHE3k4c3SI1kxXiZ2bNeONNpvPfisdnGS8NGsTyPSjzdyds7QDyj6Sj5xaqT8PYCA
         SeCAlqCUSCjn+fv1BELtdG/WVCl+A2ULaEdGS/rdYPdsiuNQVnhi4L4zPl2vBJhUIobz
         rL6mkfCSygc79l12r0DqjETR/vClQlxB457mYexcrDLzO+eKw4hQMhB901KPPk0i2tgQ
         FD4z/LUf5wucFHphp4itKLeHz+BE/yeW60k4aUci6Z2sWeLc8n7LO12s5ElnlL0o9jO3
         rbHpasNcNuXbjMHG/iAymvEfrSEBMYzxLbiKPwHJLvOLQkVn4VW7eh3nzGFhDmHl2o4D
         K5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hmbszDDYsy+E7mbdJhZLG9ENMb189HaLXyiJXJJHQ+g=;
        b=kvF51NVpUACWUwknsv7oWBmtHBE5wvbTHzCcJ6O5wyu6OsQlGHXUco3/FSCMm1UtQc
         qfT6HyDN4rL3pZ/OHwE+14Rckrx8MtkDKcvjydLQdjX5GHHiAdDin7avMuDPe3I8lU3Q
         t7YWb8ustHq7WaCJf9UsJxwZOyWqZcoEv0PBqrk2tBP3HKOx8EuHGRFEQch8vjS88rNl
         Wp7HdqqFVs78SLRTddLAFx3s9xeoL7D2Pmxjta2D1yjiELKzgT1pEb+sYDvKnxyxQeKn
         Uiwc/MiDIxqHYBGxnknxQGnoW+Y4EBA1eHHYfUCBmuzZi8S+LVlQmKZjXHOwRYtgOVLZ
         iS2w==
X-Gm-Message-State: AOAM533hkVe10M3AY8nKjKMzayknVg3MS0bbPvVDfwudEWgQmBWzQBmI
	9Mq0NdFkLA6Xs14tH1kMVCI=
X-Google-Smtp-Source: ABdhPJx5KJ+oKcN5idAUW3IHVnaJHtQqMG+8VLpm6Z0JPVmGlLn8Oqp4PVIOqfq1jFohz4/OF+jbNg==
X-Received: by 2002:a67:f857:: with SMTP id b23mr789792vsp.10.1603179945508;
        Tue, 20 Oct 2020 00:45:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6122:1189:: with SMTP id x9ls42734vkn.3.gmail; Tue, 20
 Oct 2020 00:45:44 -0700 (PDT)
X-Received: by 2002:a1f:a905:: with SMTP id s5mr765848vke.10.1603179944810;
        Tue, 20 Oct 2020 00:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603179944; cv=none;
        d=google.com; s=arc-20160816;
        b=MGRQuxq5bUw1WR30mDE7XNZF2Kuj8CwfWn++w60MQcojKGrywzDNxEvHNDw3/0aHhq
         O0BxrOH8T3CWcRdaGEJiyvGmih/3rX6yywI4QganVm/OLjABUwnF3i9nxZ81jFc1KiKS
         mDoKMLdhSvTkuakTez07I/5U/s13tt7bPKQBBE9z2DuJrWevgaLGQ6iGIv+19gFlDFob
         gY6oueOrb5U1AcxentF54tysy1AITGS04F5jmvwd06Fwhx3RC6sG6e5hqBZKKF11U/eQ
         wFR5eDvfN7Mx7xUVqRxwW3AtescFdW/f6So3jbp9nYMOHA2Sv+mRnHM9q+J3c0I44ENO
         6s4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lJIW9GWG0hMm1XGnkaeB8a57k6EeWcA8mVrrVc9nKoU=;
        b=Ih21QVmWpXJv6VySds3c1mOyvg5gzt1eLxYu/30NU7q2EsVDfQnO9z3cBiLipAcU9e
         iunG2YVM2mbFY3G0CUen2v6B5UAE4f5prEH6uNy+z1PNOkdHfNVBTlrZMP7pO19LwBPs
         Sj06cw9rXog1nOZ0z3d3B8uE3nOOago8soTgmrZFo7zpVh9wNRBHj+2gB6VkJDjf3ol1
         vy77GMOWHK3D2hA5+BWDBdu5vi2HizXADvsACF0ZPx0PzyAZyhA5KZyPAjfd27p28ynv
         jfmoyupfztizOKCu76qxXJwqDjSklxagcqMO3QXmBOUqM5DONPS9IbaAIuXcwL22wvPw
         JMRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nf7UWCzK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id w123si65030vke.3.2020.10.20.00.45.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jivi049428;
	Tue, 20 Oct 2020 02:45:44 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7jifK029212
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 02:45:44 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:45:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:45:44 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jaR6011198;
	Tue, 20 Oct 2020 02:45:42 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 2/3] configs: arm64: Add inmate demo config for j7200-evm board
Date: Tue, 20 Oct 2020 13:15:24 +0530
Message-ID: <20201020074525.7941-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020074525.7941-1-nikhil.nd@ti.com>
References: <20201020074525.7941-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Nf7UWCzK;       spf=pass
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

Add inmate demo cell config for j7200-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo, uart-demo and ivshmem-demo.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j7200-evm-inmate-demo.c | 128 +++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 configs/arm64/k3-j7200-evm-inmate-demo.c

diff --git a/configs/arm64/k3-j7200-evm-inmate-demo.c b/configs/arm64/k3-j7200-evm-inmate-demo.c
new file mode 100644
index 00000000..c916b439
--- /dev/null
+++ b/configs/arm64/k3-j7200-evm-inmate-demo.c
@@ -0,0 +1,128 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on K3 J7200 based platforms.
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
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "k3-j7200 inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 1,
+		.num_pci_devices = 1,
+		.vpci_irq_base = 195 - 32,
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
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE,
+		},
+		/* main_uart1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x89ff40000,
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
+	},
+
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/*
+			 * virtual PCI SPI_163		=> idx 1 bit [3]
+			 */
+			.pin_bitmap = {
+				0x00000000, 0x00000008, 0x00000000, 0x00000000,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 (demo) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201020074525.7941-3-nikhil.nd%40ti.com.
