Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBYVIY7WQKGQE72YWRUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F4E3866
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 18:42:11 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id q7sf737377lfd.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 09:42:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571935331; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRTRxL6BFMwdyv4QTn3FblwfOfLwKsFjaTqNoWKjwyPEqqh5KkzIWnarwQdtNxyATr
         /1EbIXjvuvakfLJx9cIRKLHzp8xOxMYto1yKXLDE58jg4d12Jgau2WNqHnCdRuE6sR+q
         UqLGjoGn1oTL/nmuOsUQiTWiuEWNiZUyMvjJ+9AxCVjLYEdngRamChSIFTz+EvAdr49G
         gcl4LD973xp5k0gWRLWt2L9wwSUzd2ViOe9tOLfnsBgZuN1k5vpVuKchWAMT91Z5Mu5Y
         6uN4H4rdytbTcPUxyBWC9+vxxCVGysnqyEhSqJ7Z6bdvSAlH9cKjqEzOsS4RVgPMpeiY
         OGOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=YPNc6xIkrXKCeIPenD0Re3uuMb6H48zvHZanBOpOw/E=;
        b=IcXLbasraHGHULVz6oVJXnDwHqr4jqmBNZO8t8tFpNpskxGK/gQrfj9QMvc+kgOpvl
         gNL83Vy2y+NMB4kPCHCSdGqXajvBxwREGzrtK98kxT15tZq4S0vfYUmqUk7AUyevD43t
         AFMGAqge6CvRwJTemdE6gNc3cQCG8ySe+XsufSEwFsXzdo08rewKoLfWzFqOPMRXrzN7
         6UEZt1TOH14HJWZ7fYowMoyagOsogQn2o8+YxhBARAUCBSbtKrkU5gQ8K/PPJp0lYp3W
         6C4e2O48ydIeQKmOzEQ6U8pFe8/W/T7PjigeYi2wkG7AO0+iq5dG2U6kaWDzg+sppX3Q
         Bq7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OpHOID23;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YPNc6xIkrXKCeIPenD0Re3uuMb6H48zvHZanBOpOw/E=;
        b=tg59ydbhET+r91io/ipWeSGy09HISQFSnOTKrqcmHRNzCgLj/YFeYJaS6g2kJ4FIpL
         URAcHBDEu2ER/20tgKKFxPPJdF5iR1FoFBUmEcQLdETMKSAANGnmu/s+7SBs2vIe/5E4
         QsR9P0Jo61ZtPEMiSTUmLJHW067usQGWN+/Ua/D1Og0d2vK0vu2JpXeGop/avACzT//O
         Gc9DtuZk8p9w6BgfLveTfpLuojbYC9c3gKYYExZHl3yDtLTxKiEHwSjU0UKuCEeQCXH4
         1Qa4GzbaLbhnsXrWL638HiOD0Sl+b42qcPHKbX30ceZwRElOI5vWnVsnynn5lAI69R66
         V/lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YPNc6xIkrXKCeIPenD0Re3uuMb6H48zvHZanBOpOw/E=;
        b=t6J+rjSfy46ckk8HVbe2acYk/BR7S+u2+rCt4We3CYAVrnStRHN5sHbufntd1b/UF5
         /kXHbAdcfbqRVzfrtJwk15YgmWFFz1YtVXQM5T/P4zQ18eCw4xqv2lNUwGwxvHtLDRuK
         7fApwDkcPt4RCziCV5Mxkahszagyn4waPtPEXU5zaJ1y0okZNOV1f/Xv11b0xYr6nJk5
         Fo/AQDq1K0fxpERBIpNvQYVgwUqnLIduwakSl3t++aq74PLRaBlaBc41sJulF/kzrNfz
         DB29OewQ/Tt++r8UFcplB75G4esK183UYnJ8O9kYzrS2YICd9a2v5P3eH2poa9rzWcjE
         pXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YPNc6xIkrXKCeIPenD0Re3uuMb6H48zvHZanBOpOw/E=;
        b=p8vSl19Pk4UdImQRRpk1p4sk/6J0fuzLe7iZbMwOptRx9PXppGpQOtNqSPU0hdhioG
         cOImT/lBlE7ti3VqNjuKqR8bbTzBMZ/nYXrfusnzroDrhjp7b5Usa5VqWuHYWofVVJjO
         +tR8u/K2S02LqKk5Y8ly32SJ2o2uSIUP4nWU7/2efjBazM7OmV3hJzBoLS8PcT7Ii+lc
         bwLL+yc4nj64BG9wQkeZWUpLCBOiLNXza53LcOwq6p9tzGKXzBh37IeAUDNR0eDWcAf+
         9RvWUzJsAmbAxKzBWaeFhwxvdUjg+ZD+xfv45ITq0V/HD4RSRB1dSVypziRfm+WmlOYI
         /s4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXZGUPGoZpSgN5UJxdv5Y5TEoH/ACsl1CVnMgIMELgkM8vactoh
	6wOWO5rMCZejYGwnv7DRqVk=
X-Google-Smtp-Source: APXvYqw97PVyyDYUWGsfPpPcitso6iU6Qw5fXffNr1WpVrYR0MseMrzD9YMtXgbg16TVw2e4cMx86w==
X-Received: by 2002:a05:651c:1042:: with SMTP id x2mr27572322ljm.127.1571935330943;
        Thu, 24 Oct 2019 09:42:10 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b0d:: with SMTP id u13ls866262lji.10.gmail; Thu, 24 Oct
 2019 09:42:09 -0700 (PDT)
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr17876587ljk.45.1571935329936;
        Thu, 24 Oct 2019 09:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571935329; cv=none;
        d=google.com; s=arc-20160816;
        b=dsK8HOhdBuaU9wlYqjSqq24eZ3N4Q6YiS+ZId3Wdw2vRgde/dDOceP8F5QLNIrG5zl
         sVIHoiAzioDDwxRWjYh0TB1DF9lhA/Fy8d3FBLwHaPUwiHOn3jVEj49JaHT0SR+GogiA
         ZhYKW92Bg7NUzyJxjwiRzkYc4xdztP9UdPKBbd+g2tNb7fvqlKwURXwAZm6UZhW5R12r
         9ayCbkCzFGOYyCI0BHCPyWQCsIU2L2DJeQUjp1v5NGBWgPR9tXRMBBWXDxlrmLgNrLkX
         k+tcCDkUMLYfoUvMvDuL7yKwcXP1g5d+4O+i2q3xq1HRs55/HIrl2kfaBPWxH9muOZef
         ps9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=L2LWwVqAa2jRtzCZIp9MIHBAr2EjZhNG4d09DjcNCmw=;
        b=XS71nTeWvAlRp7PIead9j3QqIe37P31iuJcHOZwoMkAqAjb9j+P9npL1Hx8dC2GnKa
         KqsLRtXusJ9hW0oA3djRnosuPk32F6Nwth3FoQtG3Dxs+Vo+mBqmBfsB2PNe8+S1kx74
         xZAlJZSKIP/ckDue8cM6jCC/EIxRlO55qQCZQyU3eAT0vzyzYtD7Uon5EtSdntafYQnc
         g+G4dL4L08fNCGuCeV6OYbbqGQ28O7JWrtCDQ1yUJepqyxVN8yHIwznbSOsum2ggn+zb
         4QDhoJCZgS3NjXC+kdYTPyylg0RBgDdK7+g78SuyAytcj3Yj4TUJQ5Geh4ECKavLlu2+
         IdQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OpHOID23;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id k24si1185998lji.3.2019.10.24.09.42.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id q13so21876854wrs.12
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Oct 2019 09:42:09 -0700 (PDT)
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr4898265wrx.105.1571935328518;
        Thu, 24 Oct 2019 09:42:08 -0700 (PDT)
Received: from localhost.localdomain (27.red-79-152-66.dynamicip.rima-tde.net. [79.152.66.27])
        by smtp.googlemail.com with ESMTPSA id 26sm3341383wmi.17.2019.10.24.09.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 09:42:07 -0700 (PDT)
From: Alex Largacha <alexlargacha@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Alex Largacha <alexlargacha@gmail.com>
Subject: [PATCH 1/3] configs: arm64: add config files for UltraZed SOM + UltraZed carrier IOCC
Date: Thu, 24 Oct 2019 18:41:56 +0200
Message-Id: <1571935318-25453-2-git-send-email-alexlargacha@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
X-Original-Sender: alexlargacha@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=OpHOID23;       spf=pass
 (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443
 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
---
 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c | 120 +++++++++++++++++++++
 configs/arm64/ultrazed3eg-iocc.c             | 154 +++++++++++++++++++++++++++
 2 files changed, 274 insertions(+)
 create mode 100644 configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
 create mode 100644 configs/arm64/ultrazed3eg-iocc.c

diff --git a/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
new file mode 100644
index 0000000..3c676e3
--- /dev/null
+++ b/configs/arm64/ultrazed3eg-iocc-pl-gic-demo.c
@@ -0,0 +1,120 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for pl-irq-demo inmate on Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card 
+ * 1 CPU, 64K RAM, 1 serial port
+ *
+ *
+ * Authors:
+ *  Alejandro Largacha <alexlargacha@gmail.com>
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
+    struct jailhouse_irqchip irqchips[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "pl-gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0xff010000,
+			.type = JAILHOUSE_CON_TYPE_XUARTPS,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* UART */ {
+			.phys_start = 0xff010000,
+			.virt_start = 0xff010000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x42000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* GPIO_SWITCHES */ {
+			.phys_start = 0xA0000000,
+			.virt_start = 0xA0000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* GPIO_LEDS */ {
+			.phys_start = 0xA0001000,
+			.virt_start = 0xA0001000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+
+		/* GPIO_stop_counter */ {
+			.phys_start = 0xA0003000,
+			.virt_start = 0xA0003000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+
+		/* TIMER 0 Capture*/ {
+			.phys_start = 0xA0002000,
+			.virt_start = 0xA0002000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+
+		/* TIMER 0 Cpature*/ {
+			.phys_start = 0xA0004000,
+			.virt_start = 0xA0004000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf9010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (54 - 32),
+				0,
+				0,
+				1 << (136 - 128)
+			},
+		},
+	}
+};
diff --git a/configs/arm64/ultrazed3eg-iocc.c b/configs/arm64/ultrazed3eg-iocc.c
new file mode 100644
index 0000000..9e38d0a
--- /dev/null
+++ b/configs/arm64/ultrazed3eg-iocc.c
@@ -0,0 +1,154 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card
+ *
+ *
+ * Authors:
+ *  Alejandro Largacha <alexlargacha@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Reservation via device tree: 0x800000000..0x83fffffff
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+//#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[11];
+	struct jailhouse_irqchip irqchips[1];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x40000000,
+			.size =       0x01000000,
+		},
+		.debug_console = {
+			.address = 0xff000000,
+			.size = 0x1000,
+			.type = JAILHOUSE_CON_TYPE_XUARTPS,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfc000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0xf9010000,
+				.gicc_base = 0xf902f000,
+				.gich_base = 0xf9040000,
+				.gicv_base = 0xf906f000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "UltraZed SoM",
+
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 136-32,
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* MMIO (permissive) */ {
+			.phys_start = 0xfd000000,
+			.virt_start = 0xfd000000,
+			.size =	      0x03000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x0,
+			.virt_start = 0x0,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM */ {
+			.phys_start = 0x42000000,
+			.virt_start = 0x42000000,
+			.size = 0x3e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* PL gpio switches */ {
+			.phys_start = 0xA0000000,
+			.virt_start = 0xA0000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PL gpio leds */ {
+			.phys_start = 0xA0001000,
+			.virt_start = 0xA0001000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* PL gpio stop timer */ {
+			.phys_start = 0xA0003000,
+			.virt_start = 0xA0003000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* PL Timer 0 */ {
+			.phys_start = 0xA0002000,
+			.virt_start = 0xA0002000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* PL Timer 1 PWM */ {
+			.phys_start = 0xA0004000,
+			.virt_start = 0xA0004000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* IVSHMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0x41400000,
+			.virt_start = 0x41400000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* IVSHMEM shared memory region for 00:01.0 */ {
+			.phys_start = 0x41500000,
+			.virt_start = 0x41500000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf9010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+};
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1571935318-25453-2-git-send-email-alexlargacha%40gmail.com.
