Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBZHRRHZAKGQEPCXY76I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13e.google.com (mail-il1-x13e.google.com [IPv6:2607:f8b0:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 96225158C17
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 10:50:30 +0100 (CET)
Received: by mail-il1-x13e.google.com with SMTP id s9sf9052025ilk.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Feb 2020 01:50:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581414629; cv=pass;
        d=google.com; s=arc-20160816;
        b=MsARC1GleRKTOqY3UvI0aF93cbOE880P9DX1chXRDMRL6yVTEaS+1ruivcgn26AzSr
         PZBh7mgb1MWJquDnEs4tG/Ikl+n1wytFhrTc0UUkNZ5sXDTTaSdEpX9oA7PJ882rcKlG
         7pTNZX/VXfnWGVmpt1WnjsDrC/sH2CnfyvDYeqLa6dWvGVqYrFOolT7VigCHdXUYM2sZ
         bk/JAYx30Enc6s/TnX90/oU75BSyoYEvH2VZQxV36waCNhyLTsbP3ZnnFGSXlz2wA+8j
         rquHKKiiEit140XCItZ2zTZEzEJ0SYQQ0w6/y/egOo1fN/VhuFAb7+MCkvMn6YWR2d6r
         IQFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=YY1IRX3TZGf9mZyCdEKB5A5SKVkLfT5MKchiTgeD6Xo=;
        b=Pi+1f4NO7ZNTU/1xZee5brbndmmC1R/1QRbtBX7YjuOCA1yLZExod3CERPad/CKt0t
         tXM7LOAFqf+Je8z99xjpAwZ3etAKHSofgd+L+4iGxsZKx3xY+Fo0FlphikqxOQhM35lc
         vnkc//FmSRBJcFguZuGVMKPZeRTPh/sgRz+oKbF8Sh48Y1ruB4Yf+wZYG1YfQtKiGBdt
         rbinXrrBqWXVN8RDhtAlGx4yYkFrhl+jHVtyMEpqnzkJiL+Azspz/iH1HnO4SuzPzExy
         X/DgQCL+QNvFMqQC8ErQIQsingFUk2oD7CM2EVGiTooWzadEenPryJIXNJM8V/bCpK2/
         L29g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKh7FbXe;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YY1IRX3TZGf9mZyCdEKB5A5SKVkLfT5MKchiTgeD6Xo=;
        b=POCSvpiwajVPFYxEaDm1K3dyW+Km+Js77oZuoSmx6//+ROt0B0ycYgZisGewO5sxv2
         JN5hqk9b2DOlqB9gX0TxLxj0iApiwDb55yQdJ88jTRm+G3pLh+Lbl5m/XiuZtJiysBf1
         RowquJl7w6N7HZvrvMgYiZph+JeiaMJHCCSWNeDqaUEN/m2laIT4WhcZBzesKeZwV+HA
         jmcUjjb7RCkK+f9xyKG0S5utu/K1/AvpYR8wDNKCTTX4lPO7BUZe++qDql8xijrHTipD
         2LtQudB6Sz4bb5Y6I+na/O2gsFhVlOW4owwjdPFT1ibcHwgsJ2xuWzGhLAvADmgiusIb
         cSqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YY1IRX3TZGf9mZyCdEKB5A5SKVkLfT5MKchiTgeD6Xo=;
        b=i9FzbITUY0bSzgGu/ME83otRXRJUVyBYFA7o6I/2xhzk1R7/lEzXV1qwABHjXzZgm1
         vMzfeqskSTVp9d//W2ZlfwcP6/Vwh83UabNuHOlXatHXh4DcGyo5l6ukXSQDVztJx7uR
         2u/F31HQ4hgvobE6aNVM23rJwdoPfcRpsFi5+ZNjawsxsGVTPsSMQoK4adzk9qk3YjPe
         p716I3AWST4Y0NQtqITs+SAozwJ9aGczEj4o4yX8ObQ2D2zq9Kh2RFHhOdPBEnAWm7Oe
         0JCCMVdrQIiBZZklPIjUhL8iAbyiChJ2XrUgnOgVT5fcP3Matr6+IHSA4t6JoF5Kw8go
         RK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YY1IRX3TZGf9mZyCdEKB5A5SKVkLfT5MKchiTgeD6Xo=;
        b=OyQSpOv0uFtJcAQ7IAyEefSVtQ1q/5KQGdiumKIEi9zqT8cgYntVUEROdQJDusQ4Mo
         USiVap4watm6NLe6KSzxpMdwCS+BoTHXU7HY47ttI46wwaztrVqu1TihPHFQ+yKpohER
         EMgqWP3b5vVrEAJ9jovTS3J0GezeJTh9+5CygvveFKjzePy5tThYHQeUKuWm15IxLBRA
         CebR+Uz4mxVVV3k8jzv7JXvCBVvHpWIpx0lISxIoE4icYmrca0SlbNyg+plYhrTk3tMb
         wMYAcV1GrEBpBzgQ0FMk1gVz2ZkwSRW6bAzX8nhYnMjCV2nrs16cjVKLNilA5fml0e8I
         qcAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW5tUKVFucIbg2OnHByMaT/fus3FvbEAOhgYxsTaTIhGm2P4czG
	zMRnOjdbG5T3juEH0w+rHkA=
X-Google-Smtp-Source: APXvYqzbYpitKlbsOA2b9IbZLn2DdlHTmHtyQWPb9I+eAyxsE/XL9jb8vvij9Mf1tnqO6Zqus95mQg==
X-Received: by 2002:a02:7b28:: with SMTP id q40mr13234050jac.140.1581414629165;
        Tue, 11 Feb 2020 01:50:29 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:3d8b:: with SMTP id k11ls2395440ilf.10.gmail; Tue, 11
 Feb 2020 01:50:28 -0800 (PST)
X-Received: by 2002:a92:4448:: with SMTP id a8mr4500330ilm.256.1581414628421;
        Tue, 11 Feb 2020 01:50:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581414628; cv=none;
        d=google.com; s=arc-20160816;
        b=LpLqy2PbYPO+zF6odwWEb8EQNBK2/ht5jnuBNH8DHO6pYYxnOqAX7d81Iv2k8Yyrxy
         u3EChiz1IBPAYWzaOGj4szPJrSSJoS3Eoo1mtInyuXleocAo8S5M621JcvezyStdI+we
         DVz8ghMFV1vGJwDjswZHIZiZG8AgLlk6NxnonHKRdDypHc0BLw6ejSWfRSWxPvMlCKhR
         MgRF3fVOK07dFqUoDyB6+cVvoJ6w78fOR86erqMZ68UKMgu38yzBxH+JZdwgeCc/KRrZ
         GZyUdPPXS4pYl2mJYXWZyxg79IiNkCi/7uAJOaMwsb+Eewkzi+WeTgoljslyKLPuSeSI
         Wc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=aiZP5PQt/WKXuo6uHfOU4p5JEzB89/jfM5LKnVZr280=;
        b=jFfgUrU0t1WPV1TtSppg7N8SRNXNEQXT0G+N+nsXU0b+rDL4V9diUJGok3LyMFWwkS
         XYocQFw9ZcKk7ujm6tqswCsq0w3JJv0uLVVEWvcArw51jBr2zvEmVr3AaVYIum8r7aHn
         iSMKLoBcGE09tozG4EMu6UD3iEzxga7wA9bjO7rYD3JVihRRetqY3Qzx3R2aSgXixWvJ
         pg/Lr5wKTb+cYgkne6pS4LyeM8VNj4w5I8UlZiUVT2IAgsHG/sYIeCzuoSpsWts0m1EL
         IBQ6fL/pznG5yitGmFUUlzP5KDREOyEsgP5o40ZLfxUJUauen94IGM6isgJyqmxUPLFA
         5JnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKh7FbXe;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com. [2607:f8b0:4864:20::542])
        by gmr-mx.google.com with ESMTPS id p9si145442iog.5.2020.02.11.01.50.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 01:50:28 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) client-ip=2607:f8b0:4864:20::542;
Received: by mail-pg1-x542.google.com with SMTP id b9so5419983pgk.12
        for <jailhouse-dev@googlegroups.com>; Tue, 11 Feb 2020 01:50:28 -0800 (PST)
X-Received: by 2002:aa7:8191:: with SMTP id g17mr2485762pfi.25.1581414627330;
        Tue, 11 Feb 2020 01:50:27 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id v8sm3269354pgt.52.2020.02.11.01.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 01:50:26 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v4 1/3] configs/arm64: Add support for pine64-plus board
Date: Tue, 11 Feb 2020 15:20:08 +0530
Message-Id: <20200211095010.11234-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
References: <32b59107-d919-a2c8-0761-4e03f5138209@siemens.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=LKh7FbXe;       spf=pass
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
Changes in v4:
 Addressed review comments from Jan.
   - Added mem=1792M in comments
   - Removed meaningless pci domains
   - Added IRQ(156) for ivshmem-net
   - Fixed shmemid for ivshmem net

 configs/arm64/pine64-plus.c | 375 ++++++++++++++++++++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100644 configs/arm64/pine64-plus.c

diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
new file mode 100644
index 00000000..c824ca78
--- /dev/null
+++ b/configs/arm64/pine64-plus.c
@@ -0,0 +1,375 @@
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
+ *
+ * NOTE: Add "mem=1792M" to the kernel command line.
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
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		/* IVSHMEM 00:01.0 (networking) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200211095010.11234-1-vijaikumar.kanagarajan%40gmail.com.
