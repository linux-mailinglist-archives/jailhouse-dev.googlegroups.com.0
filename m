Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRBQH3UCNQMGQE2HWVGPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED461E770
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Nov 2022 00:05:37 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id e19-20020a9d0193000000b0066754f1a8efsf4817860ote.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Nov 2022 15:05:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1667775936; cv=pass;
        d=google.com; s=arc-20160816;
        b=C5qb+pOzBJgnZIZQhuvYaH6hQaVLXO7w5UbsBf8IDm1i7u1KGg4CBwlFYvWxe5rc/I
         md2bfCIgbDiDRyP08uX3SzJaYPy6U6s0SEEYnz0V9qmHCY7+Jc2Ekvv3cP3hvzkhYCDC
         /yFEeYpq3nOjjQYqHbFIQsLjS/BXtAx+lM9phHlwVSdubkUKudDGWfLCVJsiQkZXJtIZ
         l/oEAO9IcUoygnWmUeeUlIxLbXrRbcxshDcgyAYq20Q9QZbMI9YKxQZ54EHuAdNf352h
         5QhR/CvVXVk6Wgmp1PW7xcJyx3ZrMIKNAXfSdO3ssdoc8MUD9E8JGwrfrKpAwKb59yRG
         WelA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=dec3eFFbh2Wr+8yTk/xZTdTK+YwioIF50VOrTKBqi1U=;
        b=WrMU1ORFkQAJOTbEI4QblJVukeIR67IO0fSn4htfvkkGUCZJMrSDpRKIU2kh9blIBW
         H6kGnDqyphZcDwr5QdHdYiGwJBJyTG5Pu5WgcF4ChWe0c6ApMi2Kq2VKxWBpMBVH1s6x
         j3m9EEErPczB/AC0xscvARaDK3b7ZYn6q3xFjStjsJ+MfSZDmjcwzKY5xD7PNVrlVjn2
         jEOzw+bMQC6Q9qHzswiLk2YJdh8Nh+BQs8wbWrR0PPABqzqIIcV7Bzx2KrYAngLVIWD0
         1o3AdFwhKN8TTAuBoKkNh/15f4z5B202flzK9ebmE6f/yuB85vZS6QhrgR7BbIe/Uwik
         Anqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dec3eFFbh2Wr+8yTk/xZTdTK+YwioIF50VOrTKBqi1U=;
        b=e5QeE6uBOnhog/SU85RLk0UnGWaMMCBx35mfWWoEEUAppZkzuNxqE48ksNdZWA3zcq
         GaVGmaSEeTEqNH1jaOl0ArfJ04y+UXESatkK4jEZ7K2aJf4FsE86PGowto57ezfclugb
         HWgjdEu7cLjVzxOspdXP5T5wykiuZrmequyAsxZYMq0fBzzzbTfcorurkQBZyePbgX6l
         ihCJWHE+jwiXvln2f+kiZjSkqRlS3Qb8FxjV2m6ArKtTwxzo/bxEbX07fxt05yQFQ8pE
         nRHWR2lqRmYza6hpFBix1+FMYEVki2EOmrh30jmkNWpRZ3rp860VgZmuhVD09eDn+TLx
         BH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dec3eFFbh2Wr+8yTk/xZTdTK+YwioIF50VOrTKBqi1U=;
        b=UDieCaR6GAj+uJd29n5EFKxDfG8n9aifgoD72EpV6191MwygXnFUhSI3+3k/tzXci8
         XWTn46X7dd0O+Ty9jpYzX8uHARkq5FVBpaYjeWQ9bUfxgRTPWmDvKWE9U61QmJ/hEcrc
         6f3sHvmkfvy3C7wtwVTti27CgtTpsP6nSdpVSY3Z0YryVrJazrDB/eDVUNU24pXJ3lam
         jziikDn56DA1NCt0V69YGvSTdQIxFcOsUaXdY4UtX3WPl4jPE5lSGYH9j/P/4NM2PU2S
         zW9+O8Kt3/+mEDy6GipJQPkNiQLGwCA1UVpzUzFmAstVxvYAXWoGemdnSzwSSjh5j/tS
         ftrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0WIAlZ/kA3tGb91aUEcSeNQE8BeyHZ8CSuZbWRb6BqDMIMqJoR
	hN7DruIEEZJzaiJfv9mh89A=
X-Google-Smtp-Source: AMsMyM7wxssi8Yp786GuuOx44+CUEFcHxt+wL2uOJoosVGIk3myNN9cbHUjGaOHzqsYAPR8+X7ogEw==
X-Received: by 2002:a05:6870:3516:b0:13b:8bc3:1140 with SMTP id k22-20020a056870351600b0013b8bc31140mr37255349oah.293.1667775936720;
        Sun, 06 Nov 2022 15:05:36 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:5305:b0:132:4cb:dd6 with SMTP id
 j5-20020a056870530500b0013204cb0dd6ls3297216oan.2.-pod-prod-gmail; Sun, 06
 Nov 2022 15:05:36 -0800 (PST)
X-Received: by 2002:a05:6870:b14f:b0:127:d4f1:6a90 with SMTP id a15-20020a056870b14f00b00127d4f16a90mr27724700oal.116.1667775936160;
        Sun, 06 Nov 2022 15:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667775936; cv=none;
        d=google.com; s=arc-20160816;
        b=QfK/zjmv4pPAABbkW77Mr+wN6z+kg64gam8iY0LgUXd/mEtuO6CFo8kONa23+85Z06
         TdCCK91Z+/qXZqvYLnMU8CowEcL7r5YNCMrJ1+hYnAkADZ18txMZd+1Ke0xQD6PTThps
         /EP/ohW+z3pYrMGVArDZoTS++YYPWdciJRYaeAzKZ9KkhiPASeZwcOhhMDI5PaP+JoHF
         kEFXPdEQCNm8dnzeM9qQ5Vo8KJXqTWSomsERo23q6CYhKJAYz8ftNZfYckqcq9R7ZoVC
         xvNQaobWdmWsFh46qYK+NQKZEOwJpb7czVoMWywkU+BQjhPaEg5rw4nXQfRGOhC+AIqq
         vysg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=FOnQ0zUkr1N7uMmStTVrrpNJUoYFEzY6GMebVUD29G4=;
        b=HCOaGFnLdWD/Tcr27ZuP/RO/Uw4rJ2fjByvdvBG/pprKqfWO74SMZ+HN4/G//paHhu
         l49zBuRyz4jCBfz7yLB3A0W7QYnd/+iqmbbSmVxlWFeNI1XMuukFQdB4mq/AiwuvnQDu
         vMMsykkghuP25qgDvyH0MuML00mRRd6bwsQLLvHHscw9vLD5FHiBDm77OMXnWSCbMK7m
         Hylg569kdB/VGjal4NcbU4CTfWSPDTsXL7IlqEGoZIg65qENE2vyBRUvCFSr3WWmwgwO
         MvfO2F/vhUiGgkoj1pf7yxuZXqUlQwcxsBPTr2vl6HggM/GgeAzMjCqO9uypyJF3FAOr
         bMWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id v3-20020aca6103000000b00359a21e3ffesi223291oib.2.2022.11.06.15.05.35
        for <jailhouse-dev@googlegroups.com>;
        Sun, 06 Nov 2022 15:05:36 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.96,142,1665414000"; 
   d="scan'208";a="139133144"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2022 08:05:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C24184005B2A;
	Mon,  7 Nov 2022 08:05:31 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND 1/3] renesas: Add SCIF support
Date: Sun,  6 Nov 2022 23:05:21 +0000
Message-Id: <20221106230523.22567-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
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

The Renesas R-Car and RZ/G2 families have SCIF for serial communication.
So introduce SCIF support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/debug-output.md                 |  1 +
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 hypervisor/arch/arm-common/dbg-write.c        |  2 +
 hypervisor/arch/arm-common/include/asm/uart.h |  2 +-
 hypervisor/arch/arm-common/uart-scif.c        | 44 +++++++++++++
 include/jailhouse/console.h                   |  1 +
 inmates/lib/arm-common/Makefile.lib           |  2 +-
 inmates/lib/arm-common/uart-scif.c            | 65 +++++++++++++++++++
 inmates/lib/arm-common/uart.c                 |  2 +
 9 files changed, 118 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/uart-scif.c
 create mode 100644 inmates/lib/arm-common/uart-scif.c

diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
index 50d91e29..b364bf08 100644
--- a/Documentation/debug-output.md
+++ b/Documentation/debug-output.md
@@ -28,6 +28,7 @@ Possible debug outputs for arm and arm64:
     - JAILHOUSE_CON_TYPE_MVEBU     /* Marvell UART */
     - JAILHOUSE_CON_TYPE_HSCIF     /* Renesas HSCIF UART */
     - JAILHOUSE_CON_TYPE_SCIFA     /* Renesas SCIFA UART */
+    - JAILHOUSE_CON_TYPE_SCIF      /* Renesas SCIF UART */
     - JAILHOUSE_CON_TYPE_IMX       /* NXP i.MX UART */
     - JAILHOUSE_CON_TYPE_IMX_LPUART/* NXP i.MX LPUART */
 
diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 9ddbc950..885eecd4 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -18,7 +18,7 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
-objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
+objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o uart-scif.o
 objs-y += gic-v2.o gic-v3.o smccc.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/dbg-write.c b/hypervisor/arch/arm-common/dbg-write.c
index d4cd4399..0a758b09 100644
--- a/hypervisor/arch/arm-common/dbg-write.c
+++ b/hypervisor/arch/arm-common/dbg-write.c
@@ -34,6 +34,8 @@ void arch_dbg_write_init(void)
 		uart = &uart_mvebu_ops;
 	else if (con_type == JAILHOUSE_CON_TYPE_HSCIF)
 		uart = &uart_hscif_ops;
+	else if (con_type == JAILHOUSE_CON_TYPE_SCIF)
+		uart = &uart_scif_ops;
 	else if (con_type == JAILHOUSE_CON_TYPE_SCIFA)
 		uart = &uart_scifa_ops;
 	else if (con_type == JAILHOUSE_CON_TYPE_IMX)
diff --git a/hypervisor/arch/arm-common/include/asm/uart.h b/hypervisor/arch/arm-common/include/asm/uart.h
index f620501d..8a505aa3 100644
--- a/hypervisor/arch/arm-common/include/asm/uart.h
+++ b/hypervisor/arch/arm-common/include/asm/uart.h
@@ -12,4 +12,4 @@
 
 extern struct uart_chip uart_pl011_ops, uart_xuartps_ops, uart_mvebu_ops,
 			uart_hscif_ops, uart_scifa_ops, uart_imx_ops,
-			uart_imx_lpuart_ops;
+			uart_imx_lpuart_ops, uart_scif_ops;
diff --git a/hypervisor/arch/arm-common/uart-scif.c b/hypervisor/arch/arm-common/uart-scif.c
new file mode 100644
index 00000000..e3e3372d
--- /dev/null
+++ b/hypervisor/arch/arm-common/uart-scif.c
@@ -0,0 +1,44 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/mmio.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/uart.h>
+
+#define SCIF_SCFTDR		0x0c	/* Transmit FIFO data register */
+#define SCIF_SCFSR		0x10	/* Serial status register */
+#define SCIF_SCFSR_TDFE		0x20
+#define SCIF_SCFSR_TEND		0x40
+
+static void uart_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_is_busy(struct uart_chip *chip)
+{
+	return (!((SCIF_SCFSR_TDFE | SCIF_SCFSR_TEND) &
+		mmio_read16(chip->virt_base + SCIF_SCFSR)));
+}
+
+static void uart_write_char(struct uart_chip *chip, char c)
+{
+	mmio_write8(chip->virt_base + SCIF_SCFTDR, c);
+	mmio_write16(chip->virt_base + SCIF_SCFSR,
+		     mmio_read16(chip->virt_base + SCIF_SCFSR) &
+		     ~(SCIF_SCFSR_TDFE | SCIF_SCFSR_TEND));
+}
+
+struct uart_chip uart_scif_ops = {
+	.init = uart_init,
+	.is_busy = uart_is_busy,
+	.write_char = uart_write_char,
+};
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index 34dd7209..e7c934a5 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -50,6 +50,7 @@
 #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
 #define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
+#define JAILHOUSE_CON_TYPE_SCIF		0x000a
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index c13696f3..b50533e4 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -40,7 +40,7 @@ objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
 objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
-objs-y += uart-pl011.o uart-imx-lpuart.o
+objs-y += uart-pl011.o uart-imx-lpuart.o uart-scif.o
 objs-y += gic-v2.o gic-v3.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/inmates/lib/arm-common/uart-scif.c b/inmates/lib/arm-common/uart-scif.c
new file mode 100644
index 00000000..aa15c6f9
--- /dev/null
+++ b/inmates/lib/arm-common/uart-scif.c
@@ -0,0 +1,65 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ *
+ * Authors:
+ *  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <uart.h>
+
+#define SCIF_SCFTDR		0x0c	/* Transmit FIFO data register */
+#define SCIF_SCFSR		0x10	/* Serial status register */
+#define SCIF_SCFSR_TDFE		0x20
+#define SCIF_SCFSR_TEND		0x40
+
+static void uart_scif_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_scif_is_busy(struct uart_chip *chip)
+{
+	return (!((SCIF_SCFSR_TDFE | SCIF_SCFSR_TEND) &
+		mmio_read16(chip->base + SCIF_SCFSR)));
+}
+
+static void uart_scif_write(struct uart_chip *chip, char c)
+{
+	mmio_write8(chip->base + SCIF_SCFTDR, c);
+	mmio_write16(chip->base + SCIF_SCFSR,
+		     mmio_read16(chip->base + SCIF_SCFSR) &
+		     ~(SCIF_SCFSR_TDFE | SCIF_SCFSR_TEND));
+}
+
+DEFINE_UART(scif, "SCIF", JAILHOUSE_CON_TYPE_SCIF);
diff --git a/inmates/lib/arm-common/uart.c b/inmates/lib/arm-common/uart.c
index 90a322b5..c03909a8 100644
--- a/inmates/lib/arm-common/uart.c
+++ b/inmates/lib/arm-common/uart.c
@@ -45,6 +45,7 @@ DECLARE_UART(imx);
 DECLARE_UART(imx_lpuart);
 DECLARE_UART(mvebu);
 DECLARE_UART(pl011);
+DECLARE_UART(scif);
 DECLARE_UART(scifa);
 DECLARE_UART(xuartps);
 
@@ -55,6 +56,7 @@ struct uart_chip *uart_array[] = {
 	&UART_OPS_NAME(imx_lpuart),
 	&UART_OPS_NAME(mvebu),
 	&UART_OPS_NAME(pl011),
+	&UART_OPS_NAME(scif),
 	&UART_OPS_NAME(scifa),
 	&UART_OPS_NAME(xuartps),
 	NULL
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221106230523.22567-2-prabhakar.mahadev-lad.rj%40bp.renesas.com.
