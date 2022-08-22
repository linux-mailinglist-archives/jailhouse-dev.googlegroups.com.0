Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRB47ZR6MAMGQE375DPHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1E859CB48
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Aug 2022 00:02:29 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id x25-20020aa79199000000b005358eeebf49sf5085531pfa.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Aug 2022 15:02:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661205748; cv=pass;
        d=google.com; s=arc-20160816;
        b=OH27sxYmB7IAnGkbsw+AHYtRIEZm/1MIOjaZ32YleEjtGbGhIcaVBlCmkPc2N/vfY1
         JbDcmiDgUDDYBL6w1Oa3TchPlDzfq8eeQYaB7l4bFA7Wwulb2asaNY+Lzqgm/zGAzCA6
         DdjL4EiNoaK44Fn921I7UyUozoeBbjcFlkedAxwJYbu4RFoyq/okuuWuQ9b275voWYbD
         01b48QvL3aZCNm/jUoB40JN/FSeoM9ZRr/I6cpFlnET7r/iVYKGPDNEvPVbB0ZSGEUF9
         ijAjTTeFiUxIA/+O2mLDXMfVWEYYoJTedwmjsjWHqYQgHB4gB4uNsbjV4RGJGpul8YBS
         uTHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=y8F/AbhdDvupdG2g2xAYgmfMx3d4kaKkEMGX1NTJjmE=;
        b=l9WyimEsunEcSkGEmtfdypWroyjV6EpHGtc0uWu6/LPTuJqtsJi2d12fiGU+dAwadi
         je4MQyuWPp6AT1qZNZypK0EZ12+l4JKKFj5QpW6LBj5Dh8uSlvEFEx2eS4l8xKi6BRK+
         THuzzS0k5Xj6ziIvM1ZU5X+rqCYbLuJuPgXEubLawuWYNkneV8a8XUGZld5g/MIjtzyT
         +3eHisTs/SNsvaA8MxbRhwp3oiiLavafxPFofHBfA2sD+qd9QtPA8svAzbNVfMyBukfW
         7vBigadF7TlGXqkBeOpI38cqNqMkYQfaf7Yo6ECdamLqR3aJSS64t0LU18d6j8oJqCeC
         H/5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:references:in-reply-to:message-id:date:subject:cc
         :to:from:mime-version:sender:from:to:cc;
        bh=y8F/AbhdDvupdG2g2xAYgmfMx3d4kaKkEMGX1NTJjmE=;
        b=rimq45TMBAFDKNn2n5ois3Scf1Lt6E/k88+WSvKRoT6pTP2f6mn1oih4pN3+yYd3Ev
         NlZQPuuR4Go9PtpgbgFRPF63yLR9165l/dB8loMmyR1IQVkH7EOUgTMBm+7iOwBuoJqJ
         973pmzV45K00xY3n3rjSImatya/0/VsjxT+OxdSlpZD6YpkNBPAjVcMumOQEoyrWYyLJ
         9hgCWeUCicaSqNBepG8Aw6BPQq5j2jlShQqloPWh6pgWG5Us29i0KRQsb46butnvH8KR
         uofCJTLTTME2/ZRxPlUcUsm5pd5fbEp3MEdlZwharUHs00VNC6rO/aT9tzJFifvP2JOK
         JkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version
         :x-gm-message-state:sender:from:to:cc;
        bh=y8F/AbhdDvupdG2g2xAYgmfMx3d4kaKkEMGX1NTJjmE=;
        b=vMaMp1Q3b9e9OeSzVPwo0+kn3mL6sgKft6TJ88nvlC5MHP4WYYyzZNwehAiDyq/WUK
         eBYCAwTzrmmBSdEOP50CLoxGd0HXy8zSkVPNo8XFxBJiB41gv+j2+3loNxxy4kAbZyYQ
         EzbmhB5RcAP7jR0SjotFdoYuQO2PPa4S3R1s6ElsfFCU//H91YFeWO2SHMfEyUTXuxSG
         UyJqVQ/zN8AVUvzC+Yk4mZtmwmqfuE2FjqkdHf0yVOXdNKmqRBZeeb776bDXA6ctk1tZ
         ML7+U2NF63qxpVswPVJH6Wi4UMbnesHCLTL5ZB3dwPi4bnfjR7tHjY0OlA9ZMrHuN23T
         hCdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo3JPyrUZnn8s9yeilRZiIVCFESS2ubjGW8wKiPt5puXJjFVMig6
	F/w9x2mbhj1tH7vP3pvVD6k=
X-Google-Smtp-Source: AA6agR5WSveaII2iiAm4TmsmE9wH2W749Tp4vagpur2Ber+oa3cp5PqVfK36uupwaGv6TMUC2ld8xg==
X-Received: by 2002:a63:f753:0:b0:42a:bfc9:ea52 with SMTP id f19-20020a63f753000000b0042abfc9ea52mr5328315pgk.408.1661205747976;
        Mon, 22 Aug 2022 15:02:27 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:7e85:b0:16d:82eb:cc57 with SMTP id
 z5-20020a1709027e8500b0016d82ebcc57ls8447388pla.11.-pod-prod-gmail; Mon, 22
 Aug 2022 15:02:26 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:172:9ac1:6e6 with SMTP id o7-20020a170902d4c700b001729ac106e6mr21754382plg.130.1661205746804;
        Mon, 22 Aug 2022 15:02:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661205746; cv=none;
        d=google.com; s=arc-20160816;
        b=xG1y1pBtrNpFjV681rhK43iAEBgjX1Ok6R8TRtFXwLJiTXvAizikI4u6SDOA99OlSt
         yHd6Y+htCY6ipPIOJKcq9a3UI5bUvUAqnsTv3wtKVaGhL0hVNSC/pYChgQfOPm+VOSCf
         WpoidkLneUHAKSBkTMa5PYdY7DjlspMCxhjP5WF9gK4sXj9qlkJj8hePxzNH3jg5FfxK
         doOU4po8Xtaw6BdSRWR9V8lhv2FMdMYjbSACXmohffUNgHIC2c5+nxo1WrtNgvEeJco5
         laCf/dna0nGrV8Om1FpfFnazK2/9KGgR5Umv/ijVukZM7eda8W5SpRVBL9EGu4fbOAtB
         7Z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=FOnQ0zUkr1N7uMmStTVrrpNJUoYFEzY6GMebVUD29G4=;
        b=KrPsb3kAPDw/w3Py4Mb8OiWOZUl8NAvLdJ6twk+VSGiRk6uSrW/ZANnGd7yKA8rHyG
         LEi6uylDsXDFKJ63aeKslW8wN2zGhwczIFCuC3S1wV7hCr2yjoaLo65XQ2+x8hbPE3FS
         S8VQ/U/y/1MCaKzPN4HmlfzATBrysq48HqbnE5XDFQMZgI6NW+uVuRAsQAwGxB8fUOVq
         rxjMYNgJbDWVLf6xRKdrZZtrAf04kEny7fRbG77m0t45X/9OAtOk9nzyhDc4cK7pUltB
         sUsdg/mhiMr3Ql63/G8dNyRS05LPa5cS+CwXdL0f8+wd9ln3o3gDmTc/l7F5uO2NBir7
         CsHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id q19-20020a638c53000000b00423291dc756si497650pgn.5.2022.08.22.15.02.25
        for <jailhouse-dev@googlegroups.com>;
        Mon, 22 Aug 2022 15:02:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.93,255,1654527600"; 
   d="scan'208";a="130222637"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2022 07:02:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EBA50400755C;
	Tue, 23 Aug 2022 07:02:22 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] renesas: Add SCIF support
Date: Mon, 22 Aug 2022 23:02:00 +0100
Message-Id: <20220822220202.26218-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220822220202.26218-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220822220202.26218-2-prabhakar.mahadev-lad.rj%40bp.renesas.com.
