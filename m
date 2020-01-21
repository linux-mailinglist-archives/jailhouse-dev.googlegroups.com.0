Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBX4CTLYQKGQE2DMY7CI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AD14364E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 05:43:11 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id h30sf758987wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 20:43:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579581791; cv=pass;
        d=google.com; s=arc-20160816;
        b=f90gTehUgUqhuLiAChRmlrkPjZzRDbBChmNOPQWDNKgFnlCZwGWjG/AaiiQ2WuOmOc
         9ogQrQYhkp+GeZLPPmJQviLeHi5t5G0XuNvjn9BmXu0N+k88U/+MnYDYjOzZ1ae4EklC
         PmuqjP6REzuk+1u+nUcYB5rbzxGTw29eTwHFzA56SDPTnbpKt3WslOCXB2M87NWxYZEq
         rOdsxbGC49wVPGjbW8Ok6Ykps0sKvz16K/ulIJOhQbW9kfrj43rIOfLjQ7A6VOiRm2pX
         HbLR0d85jJVvMXzHSHqQMh2PU8Ov5xJUwOQdvtk+uxnTHVuujcYbC/AY7PNJQ3zmY1Ns
         iS4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=KLZVKVwjDY89YcXpzyknwaw986yjCKcHnOej5Fsh/xo=;
        b=e9wUZ44GtzNFvvUmRVw0hFe7OF67Z6cWKcupyT1b9TOAJdcwuX81kUmEx3esFIDu2L
         wv9DwqPImiTz53AF73pPmhUZL+AKsXXogad4VRhYbEDS0AMp0EggNBcndxzEgpV+jwzv
         tIwXKG6S7Os0JtjG7jjBI5C9LbdGk5z8M3eLXoYr9vOoMSljQ5+wgR8S6EQDRaouuU4N
         DHIy35hsPMLVNGw4pGKTHEgKb5ieSPMZsnyXureDbYRMv3ew+mvbq74c52fSt5k/Z5KZ
         m4BLxYubHcNeOYLOMOxPrcFuHrBdxibH7aepG2OLjWAPKEWqed4rD5ncR7qqs1Hdld3P
         +1/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODZoXu68;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KLZVKVwjDY89YcXpzyknwaw986yjCKcHnOej5Fsh/xo=;
        b=lGNjdzwT9+cW71NGEOLhxrte5pomABw35tFg74bDYBVO2SIHtr4GoOXuXJ4sFcRH99
         x2qp9prHYe2mLwSiPWtbolUSjCwataI7jf+7kRSmjzrm86qaviJoN9vXp+InAmA2k64+
         zwZhIAlDoEAN+eLVE6K0st+2Xr5k7+aYf6oKhvhuirRqmf6FxxwQNg/h1CC6CMgDT+kx
         1H6oL1CcbZyjLcwEtBm1VmHg2Z1Lgjd65CeB8OQLdnN/frp3epVfKW4faeeBi905G+FV
         s7cSu7w2SxosJmW7Ug4quupXNf8X3rGnTQO7C4/sA5q6rU6X4ou942Dll0DSnY96LAyj
         Du+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KLZVKVwjDY89YcXpzyknwaw986yjCKcHnOej5Fsh/xo=;
        b=Tg9thyFksYL/UsynwY6QY54yRATpNufufRJaD2UQOPDeamCHGtvvXVELTXgqkO251R
         Ksst1UlbRp0DVzb+2sYAaOB8P6JtazV21eA1DnYDUKiwQ8I5oYRBQon3eh8oWMly89NJ
         jCSFga2w8uPmcR3xljRdxnZsaXIuTUzunC7W+/V3YHJQpWbZa2Dj8e6KcRD075dSF+Rx
         ELy9MskORK+M6Ppzwz3Or3POhriJkOiI8mqFTsaxPMXWX2H0t8ACwYXBzScwH+yhnMEM
         3TGt89bkrk658LDiGCtqLqqVTNrqx8heSUJwqOhDtbEaQkcJn7jF+KSuB5G9B3SZEBbi
         XYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KLZVKVwjDY89YcXpzyknwaw986yjCKcHnOej5Fsh/xo=;
        b=jnhrG6cBbMqH/q7TBiAn30dDKVdPPkNLpiDqq6sl0m4KUGFt/3BEZYYZR0BbS5kSbY
         x5RWy8Ngl8lht9AFnzxu6fzlZnd71BPRzL4yADWTGouATjSop5kABcBcDyskcFhlLU9t
         fyBjNQbSa+qCT4IwTrT6RPUb+jami6H4svq3N/3+J6qS6UuAm9TatmPevXX2p341vxj0
         DwWHC+cN5AkIW1Wy52APNn/mXN5Za5QziMdA03tTXEjs6zho2ux5GcND89WGyfn+4UIV
         yBrlNfwwb6/rhGJtSel0CvZUD9Mah/cvcuG+b1n+haLebpAYq6z8jqilO7MY1Bv40lE/
         UBSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXM438E7oTeOfk8kKGH24ui9Z6+EKdII+0sApzRvyDvBqkWygUX
	IY0k3Zaso4WMsBQtybMahSY=
X-Google-Smtp-Source: APXvYqwyHkzlVsWDn3jb78fTGqvzsfkI3bJjvVijOonylh2eBTNBjUURVJ0808ftLxrKhQohEHQUuQ==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr2871051wro.415.1579581791302;
        Mon, 20 Jan 2020 20:43:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cb55:: with SMTP id v21ls458224wmj.4.canary-gmail; Mon,
 20 Jan 2020 20:43:10 -0800 (PST)
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr2275727wmk.52.1579581790544;
        Mon, 20 Jan 2020 20:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579581790; cv=none;
        d=google.com; s=arc-20160816;
        b=O9IW7jiM7cLqRaayLayviZ0gy3OE/7w9HdboudYXezc87QeF9+GRzseREDKTimz+ZE
         Zif34BZsHvw6jLsL9AqWHooVlpUzEPQo5+9+kjbVrfhiFlNDT0yEMsz3JCMxc+UwR43Y
         kHV/+Aw05AeyLpgLQXMTZYSMzfVy6X9DgJCAl7URB3UHVINUe5Hi1HZmmMwMszS+7HCu
         B4zsyz+BPBzEmvVU+q9Z7NYNbNbhIm2FSwseyvd4Mlt8YUM+LEpOg9+q9WUJyS1e2rY3
         QtrG8jiW9wNPoZ1UlTHNKHs/xhbOqbtS5nheWxjpRDKqnAZ36e5tbxurU7e5M14Uvk2l
         DNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=HVHGUBEszn7kMZ1bbJ6cUw8jBhpULPY4wFUi7D//Yio=;
        b=UREJ7Wbv44/B1Iu5IqXriQzA0o+WWDyhN4uUJxC/8mZT9vLLtyB2uz2nJvh0LeygI2
         OvS9OXRuoMhFVRlHTYphO6hGuhhwoBIgQXe+elVmY/Qw3PXyb4iKNmDpuUoqivD5VtdD
         vUl8+eZ0N0v+l9QTuhKpl+ytq2U9nmlAmQw0duBAbwwY51kQdaYCgGrTCxWQ4CwQ55IM
         eaLDKvu7xhBYPBrthHlEqMLVNPhvasBfybv+IZBLiWZYaBzbmBUn0sULCO4kaoN/ig7S
         TqETZAhm+WLUwaeRn+O9gqcdaU1XeJGHRTtrpzA3W4EGd1sYp5QmnyGi7dn2fMwAy+ym
         Sp6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODZoXu68;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com. [2a00:1450:4864:20::441])
        by gmr-mx.google.com with ESMTPS id y185si59809wmd.2.2020.01.20.20.43.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2020 20:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) client-ip=2a00:1450:4864:20::441;
Received: by mail-wr1-x441.google.com with SMTP id w15so1683546wru.4
        for <jailhouse-dev@googlegroups.com>; Mon, 20 Jan 2020 20:43:10 -0800 (PST)
X-Received: by 2002:a5d:5091:: with SMTP id a17mr2855086wrt.362.1579581789915;
        Mon, 20 Jan 2020 20:43:09 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id c17sm50446114wrr.87.2020.01.20.20.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 20:43:09 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 1/2] configs/arm64: Add support for pine64-plus board
Date: Tue, 21 Jan 2020 10:12:54 +0530
Message-Id: <20200121044255.6924-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CALLGG_KzRM+g3+eJf7Y6q7_Bpt-RtFciHSPPr+At96FXakzgBQ@mail.gmail.com>
References: <CALLGG_KzRM+g3+eJf7Y6q7_Bpt-RtFciHSPPr+At96FXakzgBQ@mail.gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ODZoXu68;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::441 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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
Changes in v2:
  - Rebased on top of next

 configs/arm64/pine64-plus.c | 334 ++++++++++++++++++++++++++++++++++++
 1 file changed, 334 insertions(+)
 create mode 100644 configs/arm64/pine64-plus.c

diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
new file mode 100644
index 00000000..6f171ee8
--- /dev/null
+++ b/configs/arm64/pine64-plus.c
@@ -0,0 +1,334 @@
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
+	struct jailhouse_memory mem_regions[38];
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
+		 /* IVSHMEM shared memory region */
+                JAILHOUSE_SHMEM_NET_REGIONS(0xbbf00000, 0),
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
+		/* 0001:00:01.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200121044255.6924-1-vijaikumar.kanagarajan%40gmail.com.
