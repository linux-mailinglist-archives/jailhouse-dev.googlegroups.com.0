Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOEEZXYAKGQEUBXLI4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C3131379
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:41 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id g26sf1383286wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320440; cv=pass;
        d=google.com; s=arc-20160816;
        b=A4dikk/YDHoLpKSPNCTLZaGjq0wvt9pgx1zGJoyc4v1MvnZEPuBFlWI5tl0wcBVwMI
         bOkqd07hiFynZ3NZEpERthP38CiY9savHg/1HAsDCPZTnV1dHrajKp3ev7YV9A4Lexx6
         cI0xe1b5XTwk4pdb5dN0Vhlbx7BX2F2Mv8OdRe9Pvb0OYnv2fvN+guRW+HuDBZISCMPW
         +5nG/yRZqp69SDZyijsRWybtkY9jppeKUqe5A0lKTTFqPGmqRwm85LHaXVhKEVkznhvq
         ODEhCawVw6+JHTGl+3gjC/jdxh+jtZvSke9XiOjWSezrDmYCOE122Bhw1UNEzLfSeGIa
         6glw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=8+QHWXI99wX9G6HCYxBnvTlOG8ZO3Oq13kGmA4tEqik=;
        b=H6FLXAvOKhteNn0jE898f+effwwT9fV7VMPLFZFzCdQlWKKMU3eujOttHJJyIdWcX0
         bdcG4zZd1zywygxTmi1JjW+iWrw+fWHGGbziGOKgohzLZ/NR5MR0yNyx6Iaxd03UHVI8
         ugFvAbdIaERjH3uRd2cEp4m1B98EdAsFcf/abLTsKxJdwNJyY5dqQk570YzXmXblYVc9
         JFXYLq69nw0eJdlSOvKMef7PGFvOZy3LEh4dDGHbsYnCjA7LUWDPdjsr31J/ylmFChiq
         Cs1IRXbGvLZ1Kl/k+j0MMv29TcLQDJayLWU0DC2lcok09OxACwLsKniqWJAOo6pSgWa/
         yt4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8+QHWXI99wX9G6HCYxBnvTlOG8ZO3Oq13kGmA4tEqik=;
        b=tQzQlPdikSBpFQFxCnB1VRHvWuztSGEvoPWWD+VnP67FxluYKrqn3N42lv7oYCrNtR
         2WB+obM6RAkbbyGkuIGXNXxxD1+pYz8I9fGqpiG4VY5pck1yv6kC8F5Dt6ctCF1R20og
         ARe0ofjTlDl5B/Z7LsxDB7bfN6Gz8qrNXXV5EeYY91S4Pw3/H0MfZHIaiLFlZHCKRd1y
         7tLeWJpBBuMsYXSBheXL6GwJ1HSd/aS5xxKl63fLfvjxqUDOySJ6WYKVU3EN8BrotM7n
         ceYv+bkjN0benwPY68tE8Apef8c/eHIAR2lX6Nxt9qZdffxCWWotavTjHIYVmJa/qZjM
         JGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=8+QHWXI99wX9G6HCYxBnvTlOG8ZO3Oq13kGmA4tEqik=;
        b=oQtAYoehGkPgQB/KGWQfBom8PJlaiMApfHfs9PLBwR+Jatn0Devgc4KNUcYKzl53JE
         4qeLuoi8BfpHWtSCqi42qnKfMLEo/yL88JIGZLN+8Ga6M04tMRU86SOm4vh1pOi7IEBx
         uzN5yZWEfvu45JBL4OeAHLuM00YbJSQALGTyqbsA7JViwPylhs9F273FvP7GV9mCXENk
         bSsIKhsdT8iXpkdHmXFjSrZmCvZgIwJPAt2hF/Uefkdg1hPO1To7DFSv5Cv8X1lr9KM9
         GYPwGwSbBT/HbF1hatx6Eh3kzCjGecPIT039DuSTJcir83d0W7bMgRg9x8EvRc8UqoTB
         uKjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVrGmuAta/PxUNE8bHrsWQkm2O7mCBpCwchtQFT2FozKf07sTkz
	wr4ja6NNuul7YKeGewXCUAM=
X-Google-Smtp-Source: APXvYqx5cJvlbtMGYEiHTa9jZ/wayc90QX6c6WCa+UFVK1dBhLbhhtcS0aQgAKsVMdHZckBDq1XdVA==
X-Received: by 2002:a5d:6652:: with SMTP id f18mr106966661wrw.246.1578320440660;
        Mon, 06 Jan 2020 06:20:40 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e913:: with SMTP id q19ls5368106wmc.3.canary-gmail; Mon,
 06 Jan 2020 06:20:39 -0800 (PST)
X-Received: by 2002:a05:600c:2c13:: with SMTP id q19mr33972853wmg.144.1578320439859;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320439; cv=none;
        d=google.com; s=arc-20160816;
        b=G5zaqEsFIraOmquKEAljYDqjXTt1JQlBDJij4XLgAEcOp7EuxPJROn4pqta6PEfojR
         E89A952AH7zxSvJbGSJuXlyeOkPoVa2XoRiLlCCd2DHZC8xrUaZF5xUs23+7aO6XFESi
         LJx18qNkNFnoZiPAfmksmMhMJS6zZ7Bxch4oGgEs0LX/5BFTEeNIWenEGArlC+6kkMAB
         jvvtKR8CByy0o4y89PqyjLU611IZwTf6Tg6+y8ee5OrdqUGUaH8enKM/i5Nmuse81uOM
         +kvxZ/Xpoz2sfkMq4PVjatQEd5hOoX/tgtlgHSGkA5WsiS9zf+1sUp2kbxWbqBJ2CLtD
         3CMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=kKoFsy0PopHC0IafC4+R+5nRkC1BzV9HTMaQJ+4P1+4=;
        b=q+yf+/j1C3Sb/wN55GgSkeZmzbRuCGWmJHzIV78GOsw0SdPcbo+JFsJiUlyOKwTacC
         pAT/28yaOB3usDRzftd2mwIgXCMSVh6HVcNOEVrqsaK2/pGkT7ldIQyZgFOY2f3bjkUB
         ez0MaZhgm8XEB7lnzLJ3q81tJXpyXU2LkQ/hk0f2ghnxWepfZI5RsGHDUgsE0gS24J3e
         5Jx5c9BuOvAaMZCp24hacSK+A3tPlCMCxZk/tMZazoC2BfQZWlftrCCPd0XWt0z4fWI2
         Ex9ApxwfbtiTGny+vFMxzOqcjK0GmHkkrKKuE5ztVeL67iHa+YdZ6mAd+JOAB74FgHxu
         FF/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 80si765802wme.4.2020.01.06.06.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKd6H016653
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjK008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:39 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/19] inmates: Rewrite ivshmem-demo
Date: Mon,  6 Jan 2020 15:20:28 +0100
Message-Id: <3d123343f83d3b1ff2ed4038ab4289544b7fac23.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Provide a bare-metal demo inmate for the new ivshmem device, exploiting
almost all its features: state table, unidirectional shared memory,
multi-peer support, multiple interrupt vectors. This demo will be
accompanied by a Linux tool in order to span 3-peer demo between root,
bare-metal and a secondary Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/arm/Makefile       |   3 +-
 inmates/demos/arm64/Makefile     |   3 +-
 inmates/demos/ivshmem-demo.c     | 227 +++++++++++++++++++++++++++++++++++++++
 inmates/demos/x86/Makefile       |   2 +-
 inmates/demos/x86/ivshmem-demo.c | 169 -----------------------------
 5 files changed, 232 insertions(+), 172 deletions(-)
 create mode 100644 inmates/demos/ivshmem-demo.c
 delete mode 100644 inmates/demos/x86/ivshmem-demo.c

diff --git a/inmates/demos/arm/Makefile b/inmates/demos/arm/Makefile
index b0fda4ed..b1c25497 100644
--- a/inmates/demos/arm/Makefile
+++ b/inmates/demos/arm/Makefile
@@ -12,9 +12,10 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := gic-demo.bin uart-demo.bin
+INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
 
 gic-demo-y	:= gic-demo.o
 uart-demo-y	:= uart-demo.o
+ivshmem-demo-y	:= ../ivshmem-demo.o
 
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/demos/arm64/Makefile b/inmates/demos/arm64/Makefile
index 49abe09b..2af4f0ca 100644
--- a/inmates/demos/arm64/Makefile
+++ b/inmates/demos/arm64/Makefile
@@ -12,9 +12,10 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := gic-demo.bin uart-demo.bin
+INMATES := gic-demo.bin uart-demo.bin ivshmem-demo.bin
 
 gic-demo-y	:= ../arm/gic-demo.o
 uart-demo-y	:= ../arm/uart-demo.o
+ivshmem-demo-y	:= ../ivshmem-demo.o
 
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
new file mode 100644
index 00000000..e7a7f711
--- /dev/null
+++ b/inmates/demos/ivshmem-demo.c
@@ -0,0 +1,227 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2014-2020
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#include <inmate.h>
+
+#define VENDORID			0x110a
+#define DEVICEID			0x4106
+
+#define BAR_BASE			0xff000000
+
+#define IVSHMEM_CFG_STATE_TAB_SZ	0x04
+#define IVSHMEM_CFG_RW_SECTION_SZ	0x08
+#define IVSHMEM_CFG_OUT_SECTION_SZ	0x10
+#define IVSHMEM_CFG_ADDRESS		0x18
+
+#define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
+
+#if defined(__x86_64__)
+#define DEFAULT_IRQ_BASE	32
+#elif defined(__arm__) || defined(__aarch64__)
+#define DEFAULT_IRQ_BASE	(comm_region->vpci_irq_base + 32)
+#else
+#error Not implemented!
+#endif
+
+#define MAX_VECTORS	4
+
+static int irq_counter[MAX_VECTORS];
+static struct ivshmem_dev_data dev;
+static unsigned int irq_base, vectors;
+
+struct ivshm_regs {
+	u32 id;
+	u32 max_peers;
+	u32 int_control;
+	u32 doorbell;
+	u32 state;
+};
+
+struct ivshmem_dev_data {
+	u16 bdf;
+	struct ivshm_regs *registers;
+	u32 *state_table;
+	u32 state_table_sz;
+	u32 *rw_section;
+	u64 rw_section_sz;
+	u32 *in_sections;
+	u32 *out_section;
+	u64 out_section_sz;
+	u32 *msix_table;
+	u32 id;
+	int msix_cap;
+};
+
+static u64 pci_cfg_read64(u16 bdf, unsigned int addr)
+{
+	return pci_read_config(bdf, addr, 4) |
+		((u64)pci_read_config(bdf, addr + 4, 4) << 32);
+}
+
+static void print_shmem(struct ivshmem_dev_data *d)
+{
+	printk("state[0] = %d\n", d->state_table[0]);
+	printk("state[1] = %d\n", d->state_table[1]);
+	printk("state[2] = %d\n", d->state_table[2]);
+	printk("rw[0] = %d\n", d->rw_section[0]);
+	printk("rw[1] = %d\n", d->rw_section[1]);
+	printk("rw[2] = %d\n", d->rw_section[2]);
+	printk("in@0x0000 = %d\n", d->in_sections[0/4]);
+	printk("in@0x2000 = %d\n", d->in_sections[0x2000/4]);
+	printk("in@0x4000 = %d\n", d->in_sections[0x4000/4]);
+}
+
+static void irq_handler(unsigned int irq)
+{
+	unsigned int n;
+	u32 value;
+
+	if (irq < irq_base || irq >= irq_base + vectors)
+		return;
+
+	n = irq - irq_base;
+	irq_counter[n]++;
+	if (dev.msix_cap > 0)
+		value = irq_counter[dev.id];
+	else
+		value = irq_counter[0];
+	dev.rw_section[dev.id] = value;
+	dev.out_section[0] = value * 10;
+	printk("\nIVSHMEM: got interrupt %d (#%d)\n", n, irq_counter[n]);
+	print_shmem(&dev);
+}
+
+static void init_device(struct ivshmem_dev_data *d)
+{
+	unsigned long baseaddr, addr, size;
+	int vndr_cap, n;
+	u32 max_peers;
+
+	vndr_cap = pci_find_cap(d->bdf, PCI_CAP_VENDOR);
+	if (vndr_cap < 0) {
+		printk("IVSHMEM ERROR: missing vendor capability\n");
+		stop();
+	}
+
+	d->registers = (struct ivshm_regs *)BAR_BASE;
+	pci_write_config(d->bdf, PCI_CFG_BAR, (unsigned long)d->registers, 4);
+	printk("IVSHMEM: bar0 is at %p\n", d->registers);
+
+	d->msix_table = (u32 *)(BAR_BASE + PAGE_SIZE);
+	pci_write_config(d->bdf, PCI_CFG_BAR + 4,
+			 (unsigned long)d->msix_table, 4);
+	printk("IVSHMEM: bar1 is at %p\n", d->msix_table);
+
+	pci_write_config(d->bdf, PCI_CFG_COMMAND,
+			 (PCI_CMD_MEM | PCI_CMD_MASTER), 2);
+
+	map_range((void *)BAR_BASE, 2 * PAGE_SIZE, MAP_UNCACHED);
+
+	d->id = mmio_read32(&d->registers->id);
+	printk("IVSHMEM: ID is %d\n", d->id);
+
+	max_peers = mmio_read32(&d->registers->max_peers);
+	printk("IVSHMEM: max. peers is %d\n", max_peers);
+
+	d->state_table_sz =
+		pci_read_config(d->bdf, vndr_cap + IVSHMEM_CFG_STATE_TAB_SZ, 4);
+	d->rw_section_sz =
+		pci_cfg_read64(d->bdf, vndr_cap + IVSHMEM_CFG_RW_SECTION_SZ);
+	d->out_section_sz =
+		pci_cfg_read64(d->bdf, vndr_cap + IVSHMEM_CFG_OUT_SECTION_SZ);
+	baseaddr = pci_cfg_read64(d->bdf, vndr_cap + IVSHMEM_CFG_ADDRESS);
+
+	addr = baseaddr;
+	d->state_table = (u32 *)addr;
+
+	addr += d->state_table_sz;
+	d->rw_section = (u32 *)addr;
+
+	addr += d->rw_section_sz;
+	d->in_sections = (u32 *)addr;
+
+	addr += d->id * d->out_section_sz;
+	d->out_section = (u32 *)addr;
+
+	printk("IVSHMEM: state table is at %p\n", d->state_table);
+	printk("IVSHMEM: R/W section is at %p\n", d->rw_section);
+	printk("IVSHMEM: input sections start at %p\n", d->in_sections);
+	printk("IVSHMEM: output section is at %p\n", d->out_section);
+
+	size = d->state_table_sz + d->rw_section_sz +
+		max_peers * d->out_section_sz;
+	map_range((void *)baseaddr, size, MAP_CACHED);
+
+	d->msix_cap = pci_find_cap(d->bdf, PCI_CAP_MSIX);
+	vectors = d->msix_cap > 0 ? MAX_VECTORS : 1;
+	for (n = 0; n < vectors; n++) {
+		if (d->msix_cap > 0)
+			pci_msix_set_vector(d->bdf, irq_base + n, n);
+		irq_enable(irq_base + n);
+	}
+}
+
+static void send_irq(struct ivshmem_dev_data *d)
+{
+	u32 int_no = d->msix_cap > 0 ? (d->id + 1) : 0;
+	u32 target = d->id < 2 ? (d->id + 1) : 0;
+
+	disable_irqs();
+	printk("\nIVSHMEM: sending IRQ %d to peer %d\n", int_no, target);
+	enable_irqs();
+	mmio_write32(&d->registers->doorbell, int_no | (target << 16));
+}
+
+void inmate_main(void)
+{
+	unsigned int class_rev;
+	int bdf;
+
+	irq_base = cmdline_parse_int("irq_base", DEFAULT_IRQ_BASE);
+
+	irq_init(irq_handler);
+	pci_init();
+
+	bdf = pci_find_device(VENDORID, DEVICEID, 0);
+	if (bdf == -1) {
+		printk("IVSHMEM: No PCI devices found .. nothing to do.\n");
+		stop();
+	}
+
+	printk("IVSHMEM: Found device at %02x:%02x.%x\n",
+	       bdf >> 8, (bdf >> 3) & 0x1f, bdf & 0x3);
+	class_rev = pci_read_config(bdf, 0x8, 4);
+	if (class_rev != (PCI_DEV_CLASS_OTHER << 24 |
+	    JAILHOUSE_SHMEM_PROTO_UNDEFINED << 8)) {
+		printk("IVSHMEM: class/revision %08x, not supported\n",
+		       class_rev);
+		stop();
+	}
+
+	dev.bdf = bdf;
+	init_device(&dev);
+	printk("IVSHMEM: initialized device\n");
+
+	mmio_write32(&dev.registers->int_control, 1);
+
+	mmio_write32(&dev.registers->state, dev.id + 1);
+	dev.rw_section[dev.id] = 0;
+	dev.out_section[0] = 0;
+	print_shmem(&dev);
+
+	enable_irqs();
+
+	while (1) {
+		delay_us(1000*1000);
+		send_irq(&dev);
+	}
+}
diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
index 8defc67c..f53b739e 100644
--- a/inmates/demos/x86/Makefile
+++ b/inmates/demos/x86/Makefile
@@ -20,7 +20,7 @@ apic-demo-y	:= apic-demo.o
 ioapic-demo-y	:= ioapic-demo.o
 pci-demo-y	:= pci-demo.o
 e1000-demo-y	:= e1000-demo.o
-ivshmem-demo-y	:= ivshmem-demo.o
+ivshmem-demo-y	:= ../ivshmem-demo.o
 smp-demo-y	:= smp-demo.o
 
 $(eval $(call DECLARE_32_BIT,32-bit-demo))
diff --git a/inmates/demos/x86/ivshmem-demo.c b/inmates/demos/x86/ivshmem-demo.c
deleted file mode 100644
index 185c9ff7..00000000
--- a/inmates/demos/x86/ivshmem-demo.c
+++ /dev/null
@@ -1,169 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright (c) Siemens AG, 2014-2016
- *
- * Authors:
- *  Henning Schild <henning.schild@siemens.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-#include <inmate.h>
-
-#define VENDORID	0x1af4
-#define DEVICEID	0x1110
-
-#define IVSHMEM_CFG_SHMEM_PTR	0x40
-#define IVSHMEM_CFG_SHMEM_SZ	0x48
-
-#define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
-
-#define IRQ_VECTOR	32
-
-#define MAX_NDEV	4
-#define UART_BASE	0x3F8
-
-static char str[32] = "Hello From IVSHMEM  ";
-static int ndevices;
-static int irq_counter;
-
-struct ivshmem_dev_data {
-	u16 bdf;
-	u32 *registers;
-	void *shmem;
-	u32 *msix_table;
-	u64 shmemsz;
-	u64 bar2sz;
-};
-
-static struct ivshmem_dev_data devs[MAX_NDEV];
-
-static u64 pci_cfg_read64(u16 bdf, unsigned int addr)
-{
-	u64 bar;
-
-	bar = ((u64)pci_read_config(bdf, addr + 4, 4) << 32) |
-	      pci_read_config(bdf, addr, 4);
-	return bar;
-}
-
-static void pci_cfg_write64(u16 bdf, unsigned int addr, u64 val)
-{
-	pci_write_config(bdf, addr + 4, (u32)(val >> 32), 4);
-	pci_write_config(bdf, addr, (u32)val, 4);
-}
-
-static u64 get_bar_sz(u16 bdf, u8 barn)
-{
-	u64 bar, tmp;
-	u64 barsz;
-
-	bar = pci_cfg_read64(bdf, PCI_CFG_BAR + (8 * barn));
-	pci_cfg_write64(bdf, PCI_CFG_BAR + (8 * barn), 0xffffffffffffffffULL);
-	tmp = pci_cfg_read64(bdf, PCI_CFG_BAR + (8 * barn));
-	barsz = ~(tmp & ~(0xf)) + 1;
-	pci_cfg_write64(bdf, PCI_CFG_BAR + (8 * barn), bar);
-
-	return barsz;
-}
-
-static void map_shmem_and_bars(struct ivshmem_dev_data *d)
-{
-	int cap = pci_find_cap(d->bdf, PCI_CAP_MSIX);
-
-	if (cap < 0) {
-		printk("IVSHMEM ERROR: device is not MSI-X capable\n");
-		return;
-	}
-
-	d->shmemsz = pci_cfg_read64(d->bdf, IVSHMEM_CFG_SHMEM_SZ);
-	d->shmem = (void *)pci_cfg_read64(d->bdf, IVSHMEM_CFG_SHMEM_PTR);
-
-	printk("IVSHMEM: shmem is at %p\n", d->shmem);
-	d->registers = (u32 *)((u64)(d->shmem + d->shmemsz + PAGE_SIZE - 1)
-		& PAGE_MASK);
-	pci_cfg_write64(d->bdf, PCI_CFG_BAR, (u64)d->registers);
-	printk("IVSHMEM: bar0 is at %p\n", d->registers);
-	d->bar2sz = get_bar_sz(d->bdf, 2);
-	d->msix_table = (u32 *)((u64)d->registers + PAGE_SIZE);
-	pci_cfg_write64(d->bdf, PCI_CFG_BAR + 16, (u64)d->msix_table);
-	printk("IVSHMEM: bar2 is at %p\n", d->msix_table);
-
-	pci_write_config(d->bdf, PCI_CFG_COMMAND,
-			 (PCI_CMD_MEM | PCI_CMD_MASTER), 2);
-	map_range(d->shmem, d->shmemsz + PAGE_SIZE + d->bar2sz, MAP_UNCACHED);
-}
-
-static int get_ivpos(struct ivshmem_dev_data *d)
-{
-	return mmio_read32(d->registers + 2);
-}
-
-static void send_irq(struct ivshmem_dev_data *d)
-{
-	printk("IVSHMEM: %02x:%02x.%x sending IRQ\n",
-	       d->bdf >> 8, (d->bdf >> 3) & 0x1f, d->bdf & 0x3);
-	mmio_write32(d->registers + 3, 1);
-}
-
-static void irq_handler(unsigned int irq)
-{
-	printk("IVSHMEM: got interrupt ... %d\n", irq_counter++);
-}
-
-void inmate_main(void)
-{
-	int i;
-	int bdf = 0;
-	unsigned int class_rev;
-	struct ivshmem_dev_data *d;
-	volatile char *shmem;
-
-	irq_init(irq_handler);
-
-	while ((ndevices < MAX_NDEV) &&
-	       (-1 != (bdf = pci_find_device(VENDORID, DEVICEID, bdf)))) {
-		printk("IVSHMEM: Found %04x:%04x at %02x:%02x.%x\n",
-		       pci_read_config(bdf, PCI_CFG_VENDOR_ID, 2),
-		       pci_read_config(bdf, PCI_CFG_DEVICE_ID, 2),
-		       bdf >> 8, (bdf >> 3) & 0x1f, bdf & 0x3);
-		class_rev = pci_read_config(bdf, 0x8, 4);
-		if (class_rev != (PCI_DEV_CLASS_OTHER << 24 |
-				  JAILHOUSE_SHMEM_PROTO_UNDEFINED << 8)) {
-			printk("IVSHMEM: class/revision %08x, not supported "
-			       "skipping device\n", class_rev);
-			bdf++;
-			continue;
-		}
-		ndevices++;
-		d = devs + ndevices - 1;
-		d->bdf = bdf;
-		map_shmem_and_bars(d);
-		printk("IVSHMEM: mapped the bars got position %d\n",
-			get_ivpos(d));
-
-		memcpy(d->shmem, str, 32);
-
-		pci_msix_set_vector(bdf, IRQ_VECTOR + ndevices - 1, 0);
-		bdf++;
-	}
-
-	if (!ndevices) {
-		printk("IVSHMEM: No PCI devices found .. nothing to do.\n");
-		goto out;
-	}
-
-	asm volatile("sti");
-	while (1) {
-		for (i = 0; i < ndevices; i++) {
-			d = devs + i;
-			delay_us(1000*1000);
-			shmem = d->shmem;
-			shmem[19]++;
-			send_irq(d);
-		}
-	}
-out:
-	halt();
-}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3d123343f83d3b1ff2ed4038ab4289544b7fac23.1578320435.git.jan.kiszka%40siemens.com.
