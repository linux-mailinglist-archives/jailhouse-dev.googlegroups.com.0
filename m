Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4EZXYAKGQEWM56NHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9613137A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:41 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id c24sf9166186edy.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320441; cv=pass;
        d=google.com; s=arc-20160816;
        b=w6XaVKrJCu1SS28RRvgC0hHXsVrqrXasX9rMj6F9vX3FLnes9Xiuvv4iT2dhMxjH4Y
         SYGdBXRKABqQ39gXYAJKru4jz4ZZDpru/pZZVJB2Nbcmb2FBb3Qdf9Gnxtkg5ae7tWUe
         D9jYeEfJSVTPn9isUWrSEmQjVF6UL1swV78fSrZRopnZ3rrt9DmtuQVBui4ViZ7cMAa2
         ighkJGGAzm3NuTOQpCI16vYFt+1nVzNPjJUTruEhApiyy+JB6641eW+sGiG433XDHwf7
         v2xrZkdDvuPWEPDb8dkQJow73ldyjOAAexxKEMVUZsX9D1h1cecMLaFZIdVM4vYa6oPl
         /0oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=+EZaKEpTBJOH9pqusoEITvWR3wmRcy+SgrpSlf8MgLM=;
        b=z0It4Kuzty+zG5do7/+DjctYwJY+6dCzHDYTMLg/DcAqdTmCSXDPv0vJ7Y0oFbi7XF
         034G02LrPnP0tL8q2IMujGyRne1ZiL5qs+467TrO3ycYaUnh4p5HFs7YDdIx22JkD8e2
         gra5Bx5iw+B2gjbAA9Eyb1ZPFHv2mKNxjIsFhWovpoBE8tRyP7bFVUe+iwE799d4U3Vs
         ugnDwKkd6CvX9YFmg3pFrzuBTdH8P7hLWBLWUaSok5a0SqFY3r8Cxv2rokzhgFwSHKe8
         RnmpQXZr7BkJMis76Qtd48hdPkZHjLlxI2VofvVzlRdvXKYtpKaixc4uiYfrvPhY9tGW
         Tg8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+EZaKEpTBJOH9pqusoEITvWR3wmRcy+SgrpSlf8MgLM=;
        b=O/W04l/wkgLPZZU7tHLW0xooa+Jtn6QyBfnM9uipF5bqajMTXE3AMK56jrBXVFVrAK
         8WvQzSd/oPCJsP6yop28vzoW8VNV8PCTz9CnTIRPU8idZBG0Hz8nL+w3yvgh3EhEXguY
         rV+EW4yL4O1IlVn34ip5B4HtGLy8cOtyL8F/qEkrKWMv+SAUlcFSo7ldfJ584jQ005Uo
         OV4biDd2kL3uQVcSTFxIWvedUh/vq6+Z1fsIHoeS4355DLw7tfFrUh8HB/uX/jf3REN/
         8jWD5c6Dm8xpn1Yab/XXiaNSLZ/sD0a8WZnhIOhj/Y79gJqme55EbfxrkH+rr0qX3Aug
         M9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+EZaKEpTBJOH9pqusoEITvWR3wmRcy+SgrpSlf8MgLM=;
        b=Su1CX/YPt883b4hFIneMnld2aPYAm2yfEeAxKxHuQhcaF6UlQO2Cg3YCPRfH2Rqtyu
         ILYq7zjnT8fDDVXCG0LMEJFtLjqDgZlQjz5VvTqUqtjwpqYZmqxTuYDLYrGQvwNYc4HM
         cNqfhGzTGtNUrVmtRUYhgbE74fPVcADaVN6E33GNPBCM3N5hJpGlLhsJPLAv1Z974duz
         z/Xh5QiKaSMo0AlAlctL4btDtjhi7UhXxktSRaIhpnJdU772qZZl8BxM1m5yNy5EFh/s
         VewEDeo/eHVZBs+rRy9EWSIJG5flJVB0C5ApxSmOl5ZKfKeLhlLXKeElmCFEwSk6ryZQ
         v2XA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLEFw67D/dNWWdu3fyKXwQdjATwGmhPdkBIK9LJS1HlkDziLy6
	OyJh2VOn7/8LOON4Ay9c8JE=
X-Google-Smtp-Source: APXvYqwr2UD8ZomJbz7Z1Zzpzb02jTxF9mrFiDlc4WXVvoWTsH7gtNDydbnEaPQ59x3q/sPi2s8X7A==
X-Received: by 2002:a17:906:90c3:: with SMTP id v3mr107847153ejw.30.1578320439907;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c98d:: with SMTP id c13ls14079071edt.0.gmail; Mon, 06
 Jan 2020 06:20:39 -0800 (PST)
X-Received: by 2002:aa7:c994:: with SMTP id c20mr107061620edt.113.1578320439224;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320439; cv=none;
        d=google.com; s=arc-20160816;
        b=m+e8BYDEpt1YSXZINOo11Yol1pk8iD6l2k3EcxrwwENB8QIdWwwEMYaEE7+2rQL36W
         LNkzt3b4hjA3BnjRfS/qda/BnNY6Z2rVFdXzuhrKCv+GJ2PN8+V3+kmNIDZnbo3N3hW3
         SXALNQHIBWpXhYYVm78RLyTVyW1yia0gDZi8s5CfnJ+/IH/zM3Nw0LZHRjJcWquFi0XO
         QE3U3eaDi31YwGgXLy04zS90U+JsToDcXkJLkELXPhgcUQKHobcxG/jHQu/pHcpa1Upj
         2Z1G2AY64x8KfWysyenE2wfz/vlMFBENMh2QvjjMClCuYYuG8zdId0mzK1iOOMOCS32s
         5M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=UmQJ2Ahvtrxr7X/pQfAQAW2qIj8z1cSSXLlaajBP5N4=;
        b=tXsuwrc8yvU4GQh20Ex9HMOzD8UpyMCogawFOVyqNfPhVUkd90jVK7LR433SdyS37V
         khSxqzC4BeZXiRHaEDRdJAyOFriJ64teLH6NptryVnit8JnbRLRtGWzih+Dcsa1d9hH1
         a9uHWiz+vyoDpIn5E/Nj2zKHPHUz9MqXp/zxrpoWJyGMceyAs7c4GFl/fAjpvbdM23t+
         QeK7MZLivfCLCoeaJRpBKYQ6r2IpnGrEpxg1B+YW5Wlk/8LDRbaIR+Uy9gEgDF4ZYPmv
         Fj0JnwTrDD6Qh43fPDKFXd/igmR06LU3cPV6NhrA4oJqmU3aHAxvGJkHWYA0iHlVrEPe
         6qcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x18si2250521eds.2.2020.01.06.06.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKcMB019187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjH008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/19] inmates: Make PCI support generic
Date: Mon,  6 Jan 2020 15:20:25 +0100
Message-Id: <160f838caa791fe4eb725c9b249c74e5de4fc559.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Provide PCI support for ARM by implementing mmconfig-based
pci_read/write_config and moving shared defines and prototypes into the
common header. pci_msix_set_vector is only implemented as stub on ARM
so far, can be enhanced later.

As mmconfig implies mapping of that MMIO region, pci_init is introduced.
x86 does not need it and only implements a stub in order to allow
arch-independent inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/arm-common/Makefile.lib   |  4 +-
 inmates/lib/{x86 => arm-common}/pci.c | 96 ++++++++++-------------------------
 inmates/lib/include/inmate_common.h   | 34 +++++++++++++
 inmates/lib/x86/include/inmate.h      | 32 ------------
 inmates/lib/x86/pci.c                 |  4 ++
 5 files changed, 66 insertions(+), 104 deletions(-)
 copy inmates/lib/{x86 => arm-common}/pci.c (51%)

diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 669ff485..8a4c2237 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -37,8 +37,8 @@
 #
 
 objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
-objs-y += ../printk.o
-objs-y += printk.o gic.o mem.o timer.o setup.o uart.o
+objs-y += ../printk.o ../pci.o
+objs-y += printk.o gic.o mem.o pci.o timer.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
 objs-y += uart-pl011.o
 objs-y += gic-v2.o gic-v3.o
diff --git a/inmates/lib/x86/pci.c b/inmates/lib/arm-common/pci.c
similarity index 51%
copy from inmates/lib/x86/pci.c
copy to inmates/lib/arm-common/pci.c
index 06dd193f..99210c21 100644
--- a/inmates/lib/x86/pci.c
+++ b/inmates/lib/arm-common/pci.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -38,21 +38,32 @@
 
 #include <inmate.h>
 
-#define PCI_REG_ADDR_PORT	0xcf8
-#define PCI_REG_DATA_PORT	0xcfc
+void pci_init(void)
+{
+	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
+
+	if (mmcfg)
+		map_range(mmcfg, 0x100000, MAP_UNCACHED);
+}
 
-#define PCI_CONE		(1 << 31)
+static void *pci_get_device_mmcfg_base(u16 bdf)
+{
+	void *mmcfg = (void *)(unsigned long)comm_region->pci_mmconfig_base;
+
+        return mmcfg + ((unsigned long)bdf << 12);
+}
 
 u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size)
 {
-	outl(PCI_CONE | ((u32)bdf << 8) | (addr & 0xfc), PCI_REG_ADDR_PORT);
+	void *cfgaddr = pci_get_device_mmcfg_base(bdf) + addr;
+
 	switch (size) {
 	case 1:
-		return inb(PCI_REG_DATA_PORT + (addr & 0x3));
+		return mmio_read8(cfgaddr);
 	case 2:
-		return inw(PCI_REG_DATA_PORT + (addr & 0x3));
+		return mmio_read16(cfgaddr);
 	case 4:
-		return inl(PCI_REG_DATA_PORT);
+		return mmio_read32(cfgaddr);
 	default:
 		return -1;
 	}
@@ -60,78 +71,23 @@ u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size)
 
 void pci_write_config(u16 bdf, unsigned int addr, u32 value, unsigned int size)
 {
-	outl(PCI_CONE | ((u32)bdf << 8) | (addr & 0xfc), PCI_REG_ADDR_PORT);
+	void *cfgaddr = pci_get_device_mmcfg_base(bdf) + addr;
+
 	switch (size) {
 	case 1:
-		outb(value, PCI_REG_DATA_PORT + (addr & 0x3));
+		mmio_write8(cfgaddr, value);
 		break;
 	case 2:
-		outw(value, PCI_REG_DATA_PORT + (addr & 0x3));
+		mmio_write16(cfgaddr, value);
 		break;
 	case 4:
-		outl(value, PCI_REG_DATA_PORT);
+		mmio_write32(cfgaddr, value);
 		break;
 	}
 }
 
 void pci_msix_set_vector(u16 bdf, unsigned int vector, u32 index)
 {
-	int cap = pci_find_cap(bdf, PCI_CAP_MSIX);
-	unsigned int bar;
-	u64 msix_table = 0;
-	u32 addr;
-	u16 ctrl;
-	u32 table;
-
-	if (cap < 0)
-		return;
-	ctrl = pci_read_config(bdf, cap + 2, 2);
-	/* bounds check */
-	if (index > (ctrl & 0x3ff))
-		return;
-	table = pci_read_config(bdf, cap + 4, 4);
-	bar = (table & 7) * 4 + PCI_CFG_BAR;
-	addr = pci_read_config(bdf, bar, 4);
-
-	if ((addr & 6) == PCI_BAR_64BIT) {
-		msix_table = pci_read_config(bdf, bar + 4, 4);
-		msix_table <<= 32;
-	}
-	msix_table |= addr & ~0xf;
-	msix_table += table & ~7;
-
-	/* enable and mask */
-	ctrl |= (MSIX_CTRL_ENABLE | MSIX_CTRL_FMASK);
-	pci_write_config(bdf, cap + 2, ctrl, 2);
-
-	msix_table += 16 * index;
-	mmio_write32((u32 *)msix_table, 0xfee00000 | cpu_id() << 12);
-	mmio_write32((u32 *)(msix_table + 4), 0);
-	mmio_write32((u32 *)(msix_table + 8), vector);
-	mmio_write32((u32 *)(msix_table + 12), 0);
-
-	/* enable and unmask */
-	ctrl &= ~MSIX_CTRL_FMASK;
-	pci_write_config(bdf, cap + 2, ctrl, 2);
-}
-
-void pci_msi_set_vector(u16 bdf, unsigned int vector)
-{
-	int cap = pci_find_cap(bdf, PCI_CAP_MSI);
-	u16 ctl, data;
-
-	if (cap < 0)
-		return;
-
-	pci_write_config(bdf, cap + 0x04, 0xfee00000 | (cpu_id() << 12), 4);
-
-	ctl = pci_read_config(bdf, cap + 0x02, 2);
-	if (ctl & (1 << 7)) {
-		pci_write_config(bdf, cap + 0x08, 0, 4);
-		data = cap + 0x0c;
-	} else
-		data = cap + 0x08;
-	pci_write_config(bdf, data, vector, 2);
-
-	pci_write_config(bdf, cap + 0x02, 0x0001, 2);
+	/* dummy for now, should never be called */
+	*(int *)0xdeaddead = 0;
 }
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index b5ace7bf..7bccd480 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -46,6 +46,31 @@
 #define NS_PER_MSEC		1000000ULL
 #define NS_PER_SEC		1000000000ULL
 
+#define PCI_CFG_VENDOR_ID	0x000
+#define PCI_CFG_DEVICE_ID	0x002
+#define PCI_CFG_COMMAND		0x004
+# define PCI_CMD_IO		(1 << 0)
+# define PCI_CMD_MEM		(1 << 1)
+# define PCI_CMD_MASTER		(1 << 2)
+# define PCI_CMD_INTX_OFF	(1 << 10)
+#define PCI_CFG_STATUS		0x006
+# define PCI_STS_INT		(1 << 3)
+# define PCI_STS_CAPS		(1 << 4)
+#define PCI_CFG_BAR		0x010
+# define PCI_BAR_64BIT		0x4
+#define PCI_CFG_CAP_PTR		0x034
+
+#define PCI_ID_ANY		0xffff
+
+#define PCI_DEV_CLASS_OTHER	0xff
+
+#define PCI_CAP_MSI		0x05
+#define PCI_CAP_VENDOR		0x09
+#define PCI_CAP_MSIX		0x11
+
+#define MSIX_CTRL_ENABLE	0x8000
+#define MSIX_CTRL_FMASK		0x4000
+
 #ifndef __ASSEMBLY__
 typedef s8 __s8;
 typedef u8 __u8;
@@ -102,6 +127,15 @@ typedef void(*irq_handler_t)(unsigned int);
 void irq_init(irq_handler_t handler);
 void irq_enable(unsigned int irq);
 
+void pci_init(void);
+u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size);
+void pci_write_config(u16 bdf, unsigned int addr, u32 value,
+		      unsigned int size);
+int pci_find_device(u16 vendor, u16 device, u16 start_bdf);
+int pci_find_cap(u16 bdf, u16 cap);
+void pci_msi_set_vector(u16 bdf, unsigned int vector);
+void pci_msix_set_vector(u16 bdf, unsigned int vector, u32 index);
+
 #define CMDLINE_BUFFER(size) \
 	const char cmdline[size] __attribute__((section(".cmdline")))
 
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index fb45a945..6de736e4 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -61,30 +61,6 @@
 
 #define APIC_LVL_ASSERT		(1 << 14)
 
-#define PCI_CFG_VENDOR_ID	0x000
-#define PCI_CFG_DEVICE_ID	0x002
-#define PCI_CFG_COMMAND		0x004
-# define PCI_CMD_IO		(1 << 0)
-# define PCI_CMD_MEM		(1 << 1)
-# define PCI_CMD_MASTER		(1 << 2)
-# define PCI_CMD_INTX_OFF	(1 << 10)
-#define PCI_CFG_STATUS		0x006
-# define PCI_STS_INT		(1 << 3)
-# define PCI_STS_CAPS		(1 << 4)
-#define PCI_CFG_BAR		0x010
-# define PCI_BAR_64BIT		0x4
-#define PCI_CFG_CAP_PTR		0x034
-
-#define PCI_ID_ANY		0xffff
-
-#define PCI_DEV_CLASS_OTHER	0xff
-
-#define PCI_CAP_MSI		0x05
-#define PCI_CAP_MSIX		0x11
-
-#define MSIX_CTRL_ENABLE	0x8000
-#define MSIX_CTRL_FMASK		0x4000
-
 #define SMP_MAX_CPUS		255
 
 #ifndef __ASSEMBLY__
@@ -248,14 +224,6 @@ void delay_us(unsigned long microsecs);
 unsigned long apic_timer_init(unsigned int vector);
 void apic_timer_set(unsigned long long timeout_ns);
 
-u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size);
-void pci_write_config(u16 bdf, unsigned int addr, u32 value,
-		      unsigned int size);
-int pci_find_device(u16 vendor, u16 device, u16 start_bdf);
-int pci_find_cap(u16 bdf, u16 cap);
-void pci_msi_set_vector(u16 bdf, unsigned int vector);
-void pci_msix_set_vector(u16 bdf, unsigned int vector, u32 index);
-
 extern volatile u32 smp_num_cpus;
 extern u8 smp_cpu_ids[SMP_MAX_CPUS];
 void smp_wait_for_all_cpus(void);
diff --git a/inmates/lib/x86/pci.c b/inmates/lib/x86/pci.c
index 06dd193f..a04e2db6 100644
--- a/inmates/lib/x86/pci.c
+++ b/inmates/lib/x86/pci.c
@@ -43,6 +43,10 @@
 
 #define PCI_CONE		(1 << 31)
 
+void pci_init(void)
+{
+}
+
 u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size)
 {
 	outl(PCI_CONE | ((u32)bdf << 8) | (addr & 0xfc), PCI_REG_ADDR_PORT);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/160f838caa791fe4eb725c9b249c74e5de4fc559.1578320435.git.jan.kiszka%40siemens.com.
