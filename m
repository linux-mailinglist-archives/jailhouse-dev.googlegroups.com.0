Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBSEH4XYQKGQEUFORKQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EED15189F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 11:13:31 +0100 (CET)
Received: by mail-pg1-x53d.google.com with SMTP id o21sf11279665pgm.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 02:13:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580811209; cv=pass;
        d=google.com; s=arc-20160816;
        b=XqREpz0gZwt/mPFJ56Y8L7QOy600du9G1Vx0frkPC9HWDMmAGeGQcpg8fyy0E18CVE
         KgE1eYBvAdgZdqgP0/PpZDrT90tUB83Rh/FLWGCqGFN7fhdZvnz8VaLeKvoInsDQlaSm
         6CxIGsFeyIg2t38C8nNq+b8omXWnKNK9KVsr6RzA5WScEFKMzNkGoJlE6ohSAgeyaY7l
         saX0237f4FrkB/U2iYqDblZY9CyC6S7meVw3o8GHcz+qCFC3WaJGFz8u2cQnpttBwyCk
         WIiWRrlSXQdj+S0SAQzsdVuNgIuDXgWZysDUNQ7kY6Sw5mKjMMBAnqHK13boh8s377RX
         2fdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=1C0EZwO+nJcfA91YODbfH/Esh9N0GRwhnbLQl5ZCiH4=;
        b=NoZlogMtMyCHSWpByZfht4MVhIdfXfs8eo9Bc7Gp8ezLxxCCX2tOL1nU4k1Ki8qy3g
         x/CYrXFoEfs0X1BhZrqRAYNT+x7IePERLpQKo8wCM0kKa3CrWTURxyQrTzUIUrF+yMTl
         AHXtG6Tdm45esHLrzrtuCkW3qVNivJhbDnTDxoh92QctueVQ1z2fjTCPbcGDAJROUaCZ
         qg16+nqcqmrYmy7ROAN13aAK+/BQ7LVXjEwQT7uwqz/69KridKFGzJeJTTbyp98XpSyJ
         fd2daTMq3Xr8PdbJx5FDtT2xYF6B9eQSpuBATdanBAgbBCL8Vmi4/Yoqg9Zl4F+nO3YV
         JW0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ly3OMj9q;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1C0EZwO+nJcfA91YODbfH/Esh9N0GRwhnbLQl5ZCiH4=;
        b=bvPcKWFLkss7i7HQP6a6AAEZ1dOtjUrUaH8jJQIH4OFOtCArnbt8y003NBzkFykcgN
         Cisru1myL558NR3DA8jF9YgOb6gFDTrQpP0+xqY+kfRIZkcFLLIttPkXqd7CuvoVC9gw
         RsvppMyvo6tm5RW7/w5QT0FPaLcuqYl1X/PtQXxAazdSAnEP9oKdqOlJ59vNj5+S8CAU
         RgBzXlQCdydqPfylgbA+Esf7KjZfdFS1ehNQHZ1LmGCcxHPGGrt3LDKUVfE+XmGP/SH+
         3/aaVSQQZY++AmukdJwzzb+ikUrpHXNPX9IzJ2w8DTLDlKQb++O2/4WNTXHphfe4ZIsz
         bNAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1C0EZwO+nJcfA91YODbfH/Esh9N0GRwhnbLQl5ZCiH4=;
        b=kMb4ta7HCba0eJncHcovLLLshYLiR73wPEpSh3QJKOSV+x9JBQ0WjeXcwLnorEqCiX
         VLM6E5TQCNydImzlrrHZOySmoyor3hM1r5To7/c8UAEbp4ER4qTd7QzRnvs6dkAfXeTx
         GQMph2aY4X3Hoz9Rt7zb23AYVPv3n6iFH1aZRvIzHwKl4G8iqad6TdYLY2EzAcCEgt6w
         DODX4gUgYThTwIRhXQDZerhsFkvjpa2LQ/ZCCKMYX+7ozINb5Ens2SXC5hvqTWzXuS5v
         GhnaQWRCWGjMP783gC7yNxjT4AnQo8YYLsCb9mLf2/Ctj1TjG1QPJYbLPdDV5AUVKLaE
         xx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1C0EZwO+nJcfA91YODbfH/Esh9N0GRwhnbLQl5ZCiH4=;
        b=iUvwRX+t95L27A4IuzTn/4J4zhoI/XDQYSQPeIYl29l42Jpve6ihafhM+G5XiI4reE
         CQe3s2CVuTFs1U/Z+QXiHvppA21gMNZrbwtNFf/uSV2nYkMG9mrA/kND0mAinW8iO/Bv
         lWauBt6DrPxMU3qxZ4n1T5nncgXNk7SRLFa5zDYZVYDAoR9CvYuNTPbwXreaLt4KKxuZ
         KHD7xJkbpD6OJSka6yn7Ayva48yOo4yZ6qs9Z6ChnAQ4AUUUXvCart5ldrN46FcY4V3m
         c1UYciRDSSObpCWuO6nkrYhSEBzrMAN+upAiqLr5Tl374Aq4yVECuslvpefyZbTJ4EBt
         DDIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdvvCI6un1F4Fy5w074EAFJYNhOcAefcfPm3pvg/Q8cu9q4trr
	TV7Ny/wmJoIhK+HC6BvNiko=
X-Google-Smtp-Source: APXvYqxJoXGXjUv9G1g/K43qexxJUGiyUi8qYoWUJ/I7JzzU2V2SXhOFXjd6lGYFjERGgB86VrJQTw==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr5665084pjz.72.1580811209260;
        Tue, 04 Feb 2020 02:13:29 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:1bc6:: with SMTP id r6ls1175800pjr.1.canary-gmail;
 Tue, 04 Feb 2020 02:13:28 -0800 (PST)
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr29124834plo.260.1580811208553;
        Tue, 04 Feb 2020 02:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580811208; cv=none;
        d=google.com; s=arc-20160816;
        b=nccEWbKd+BuHGro2AsvxBc2k/PEv09+JHhFxlRqM6IAztAGBllCUORP9+riO8TLYo1
         N6QViTwdGez8Pw1qNR8Yg36iNXIBREctQyKV7eeA49j49o+MINMiYK1zdbNZ5SS++Kpe
         XUn+f/fZe9NIKtVTs8QIcT5vBRqfFpzTMxk807tFslJ9qD3QG9VCTy1sIzsJNOSo1o3O
         bwMyw9ZXPKREuSwiwDxForPULCP3EhQjPRw2e6TqUoHUUXpACCOEqvtiScr+VmxfMxgI
         Dt/7A5ElQr28rvXGV1hRu6H9BVNCIqQFhTDNzQMY2HYY37U5YIKhb377ESF4c4xkbX1y
         X/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=tjuoy29fApSWhHDHhfg0fK/2SO4FzO+42CUbIB5WaJE=;
        b=dVJ429ebOQvtecR3BQIqOZRD1x1VpFJ9tFSPqtF/ALiSBjY3t4HRCbWdo0Af4jzD1u
         mDJRnzeWJ/7li1ccSRsYfK4SC4ilvuj+C/dTkH0919gtDvfXEyhsApm18tTuX8EOvk18
         Mi+U6f0BmZlFuwKfWu70N4RFmgbT4hyBpAD35Lv3yJMYraz2V3lcc0DxKFYXB2RuWBqk
         kvLIBYFy/fNqsk4q2gSDMbpyE9o22hTkV9+k+M1RyuGbBZXrvnJCFdNjRb6qb4hhQN1q
         VLUqM980nqwkJPWcsd4VaQHgBw3FCiWidFll1RTKynek91lYHj0BZ4dNVhSQcuv7Tdjc
         3Utg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ly3OMj9q;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com. [2607:f8b0:4864:20::643])
        by gmr-mx.google.com with ESMTPS id j10si306278pgg.2.2020.02.04.02.13.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::643 as permitted sender) client-ip=2607:f8b0:4864:20::643;
Received: by mail-pl1-x643.google.com with SMTP id y1so7075509plp.7
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Feb 2020 02:13:28 -0800 (PST)
X-Received: by 2002:a17:902:41:: with SMTP id 59mr29747162pla.39.1580811208001;
        Tue, 04 Feb 2020 02:13:28 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id p24sm22834066pgk.19.2020.02.04.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 02:13:27 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v3 1/3] configs/arm64: Add support for pine64-plus board
Date: Tue,  4 Feb 2020 15:43:11 +0530
Message-Id: <20200204101313.2495-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
References: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Ly3OMj9q;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::643 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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
 configs/arm64/pine64-plus.c | 376 ++++++++++++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)
 create mode 100644 configs/arm64/pine64-plus.c

diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
new file mode 100644
index 00000000..24b4a61c
--- /dev/null
+++ b/configs/arm64/pine64-plus.c
@@ -0,0 +1,376 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for Pine64+ board, 2 GB
+ *
+ * Copyright (c) Vijai Kumar K, 2019-2020
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
+	struct jailhouse_memory mem_regions[43];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[2];
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
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x02000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = 1,
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
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		/* State Table */ {
+			.phys_start = 0xbbef1000,
+			.virt_start = 0xbbef1000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* Read/Write Section */ {
+			.phys_start = 0xbbef2000,
+			.virt_start = 0xbbef2000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Output (peer 0) */ {
+			.phys_start = 0xbbefb000,
+			.virt_start = 0xbbefb000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Output (peer 1) */ {
+			.phys_start = 0xbbefd000,
+			.virt_start = 0xbbefd000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* Output (peer 2) */ {
+			.phys_start = 0xbbeff000,
+			.virt_start = 0xbbeff000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		 /* IVSHMEM shared memory region for 00:01.0 (networking)*/
+                JAILHOUSE_SHMEM_NET_REGIONS(0xbbf01000, 0),
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
+			.size = 0x7bef1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
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
+		{ /* IVSHMEM 0001:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM 0001:00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200204101313.2495-2-vijaikumar.kanagarajan%40gmail.com.
