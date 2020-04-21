Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBGEK7P2AKGQEEGB6QPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B81B2391
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:09 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id v22sf5608120lfa.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463449; cv=pass;
        d=google.com; s=arc-20160816;
        b=HflJuFXdvTvuVR5R77T7/1bQPgN/RMKIOVOREdlq/P9Mcvnb/+b5a0RcTZyq5Cz8Jx
         CWFSXUXSGRtiT8NsZSDSkaGp7pzAVFQMzG7B1UsMfoD3XPNb3NZ8vpPuBihdpdZeImcE
         np6UQ2SeetgMz8nat2FvX334CeI4CRJaOBeEoUXi9m/aRAptRJM3J1kpbDwuyGRs/EcI
         ySx24iMiIJhFR0F+LMFToNsebz7rWwSsAUgJKj+ygjk7/Hc6Fh/KL+Lw3/u/j2WlGDFi
         5KOjuP1fIe7jSLQOJH3NbY5MKeFJNscuXTq7AYOgo83o/cimD5JDarsyDzz3VG1gm32t
         VPsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=XQATDGE2Qymo6RPAFYC0PkVCV/3fukRqdN8wUX22c4Q=;
        b=KqgpNQHueywdP90BowqIl+Met0rtw2VDlZqn0QcuxBjBGl7Q6KFhI265QH/eWUw1TA
         hVN8azXMcZ8Ag+IngVPqvJu+Dw76sYGbHkQX07T6enJBOVk26DAhn+0jOjC3KzTuIs3C
         jojFIz0HRnN1IIALQNxkvDBt9uzk/C+rAQ+68ISa4fTwoh5JGq6Wi8Mn9OtDcd6zj2oH
         O2ULIZiHKgIJatZzcznzc042T9xkPYxnTzgJ/kF91ebWNKzgFoJwqyBFvFVn6a01yugU
         W4Ib3zEHsGRc/YxUXhNCgdLRjVIB67j3VT97qea2MNNA3HKEmqDDddnbiW3UQ0xzOVAc
         8ZoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=mFrPHaRk;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XQATDGE2Qymo6RPAFYC0PkVCV/3fukRqdN8wUX22c4Q=;
        b=cozrsOD/Kpp9fJCMicbxsAAHgUurJxWl6saefYLnSAFLyhWZp4iFfXy9AMXiud+Mlk
         BJgxit8yvbbrUKeHYj9HsuPWp7Xx7J8JYKZzrGYWQzEBSuB0MukP/+gE7dDG1yYbbcA6
         pKQafdb6ve6lbkflp5szsyG+cXYU5hui7cmvoE96tXUoaZsq2SI0hwr6duADvlRIZsZF
         nz3GD5dWyUapfdF/InfSlQoC7n2b4OcK4DoStGm2WAecNqNNwQMN3s7xNjwLMNLdKshV
         8/ry7HFJwI8ejBgdyyldFz6ST3118if9OylmJ+wSgW6nPycHhAAm3H0zGdCZVz9xcJGr
         Yt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XQATDGE2Qymo6RPAFYC0PkVCV/3fukRqdN8wUX22c4Q=;
        b=tV7bgEPU0NFYLcIfRFj99HlHtaKjYjZAUYC8pp+3ewyyHeVUdZNemq24cKWZmtCFWP
         B9l3ReKgirUqhOXIGr3WAJnH3WzCq5/03GnfX2SqRVegZoQoaazl3xPsS7eStvuFVuYb
         pl53jmaBXRdrIcU0AnK9b/nkAgbDvj7mkDTXqPqFu7oGwnQEw9DOZ6H6QlgBLkzbg36H
         N4Wa5IYqfuWnVNvXWas5tYuPeoe5TmPVXu3Jn/JU/NgFevR1/fGdtUgkKaesg52XmYy9
         ng69P1FKKC+QzSBvAFOFJNvsB2TU/w1KW3pdCJncDhDa+1/nEZWeTLcD3LVqj7OdSyqP
         7Kng==
X-Gm-Message-State: AGi0PuZuRRrgRNBqvPWp5FrQYWATzkWeNS1KOaeC3wRMWM2+bAHoqF44
	sKHCGqgY8/mUdb5pkMQfrlU=
X-Google-Smtp-Source: APiQypJARvCtMYQYGOQJApQTmLvJi2r83zok8pUkbEgl1WObmREH8vc6FQHqr2A+zOBFEZBRtQQ1dQ==
X-Received: by 2002:a05:651c:107a:: with SMTP id y26mr7227596ljm.80.1587463448800;
        Tue, 21 Apr 2020 03:04:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8e8b:: with SMTP id z11ls1212435ljk.0.gmail; Tue, 21 Apr
 2020 03:04:08 -0700 (PDT)
X-Received: by 2002:a05:651c:554:: with SMTP id q20mr13625250ljp.104.1587463447955;
        Tue, 21 Apr 2020 03:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463447; cv=none;
        d=google.com; s=arc-20160816;
        b=nRDONEhy8cQwui653JqTV/U3xuk1wwNkL29+LPs1imejpVJLP91+00iiym7EKH0Va7
         JAnTICxddKN/37EwEM0gD9h53NDqFNcQuOBFejpdexws4OntMDYOPxnb91mikPkLVWrG
         gqVahj9YnnE13FztrSmYxxKzlw5yziHyRRjoNR0BoVz15l+Rt+YFhxKzRSUlrGqwl5fH
         9R5cJDc8xJImI/VsPmTPBSFpsIJmg5UkDxDX4fZdsoGx0FnhSjl9R6HWkZOo+aDsN9lO
         KW1o4qwoxlz5G4P/rGXOW6o8rY4mrnMKt1QLOvTsHYS+VJTKU6Oa2Lm9ICHn6erpSx4p
         Kiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kOzbbyqz1OqM1tEnyw2S3ns55h6ePtFIR0zHKzST3FU=;
        b=ZTm5bhyEUs3Sj3/UCEriuvd5UZc41NNHT4l7ehpY6CqipS+8TK10KfV38mlO3UV83z
         7cyJ/qrjfxZtWVD1s9GUuSFXVMNDDe900e7/i6h6Pm/rNMdrkprlRCoWmGENSnoztwc3
         5OtZTQRuh6DBY9of0GW3G/nCgMCYd9cryIaFJQ3AvHn3XWdy0Pz8pX+6c/TvHcmmRUbl
         dvt3eVuD0phX2Tq++n9OuOuUCrlS6WJS/vsRr3YszQkFRZIwkwQuSSteHYfMhUM0LYPC
         swfmZ3lU1enTgcQXFav0v86Y87bCnZe7H11hDt3SwQw0VduD1QUUu3KlTr5dkyg1T8WN
         3heg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=mFrPHaRk;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id j13si92273lfj.1.2020.04.21.03.04.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl8-0005CH-RR; Tue, 21 Apr 2020 12:04:07 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 8/9] configs: add colored cell configuations for ZCU102
Date: Tue, 21 Apr 2020 12:03:50 +0200
Message-Id: <20200421100351.292395-9-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=mFrPHaRk;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
---
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  79 +++++++++++
 configs/arm64/zynqmp-zcu102-linux-demo-col.c  | 128 ++++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c

diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo-col.c b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
new file mode 100644
index 00000000..83188b27
--- /dev/null
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo-col.c
@@ -0,0 +1,79 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for demo inmate on Xilinx ZynqMP ZCU102 eval board:
+ * 1 CPU, 64K RAM, 1 serial port, color range [0-7]
+ *
+ * Copyright (c) Universita' degli Studi di Modena e Reggio Emilia 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
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
+	struct jailhouse_cache cache_regions[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo-col",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
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
+		0x2,
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
+			.phys_start = 0x800600000,
+			.virt_start = 0,
+			.size =  0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
+				JAILHOUSE_MEM_COLORED,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.cache_regions = {
+		{
+			.start = 0,
+			.size = 8,
+		},
+	},
+};
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-col.c b/configs/arm64/zynqmp-zcu102-linux-demo-col.c
new file mode 100644
index 00000000..66f12a66
--- /dev/null
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-col.c
@@ -0,0 +1,128 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for linux-demo inmate on ZynqMP ZCU102:
+ * 2 CPUs, 128M RAM, serial port 2, color range [0-7]
+ *
+ * Copyright (c) Universita' degli Studi di Modena e Reggio Emilia 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
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
+	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_cache cache_regions[1];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "ZynqMP-linux-demo-col",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
+		.vpci_irq_base = 140-32,
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
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
+		/* IVSHMEM shared memory region for 00:03.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
+		/* UART */ {
+			.phys_start = 0xff010000,
+			.virt_start = 0xff010000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0x800600000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
+			.phys_start = 0x810000000,
+			.virt_start = 0x81000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE | JAILHOUSE_MEM_COLORED,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.cache_regions = {
+		{
+			.start = 0,
+			.size = 8,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0xf9010000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (54 - 32),
+				0,
+				0,
+				(1 << (141 - 128)) | (1 << (143 - 128))
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:01.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+		/* 00:03.0 */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.bdf = 3 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+};
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-9-ms%40xt3.it.
