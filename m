Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRPG575QKGQEESJ7F2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id E67242844F0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:32:05 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id n24sf2430755ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:32:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958725; cv=pass;
        d=google.com; s=arc-20160816;
        b=VmqnApgd2WH5gGUoxpgYUlGjnPjc4lop4UftKwgnr63a0PvM/ltAb+LcIhJlj6Q9kB
         4Y5Q7+T9sSCFF63dn5KhMmP7NRAU1/NU7vzqIhIPNW257hk8gHGIAH35YNEw/48hYkGh
         oIblfIQgOclWgc11JUuspKysZE0/RMeXE2epLh5xqHBRCcVReJ1G+foSatylIUhXjph0
         y3DPSRyTtJ9c4Sf9JoHNLn1heetXTM+h8Xke56Wcp/OozMKKWwCAWzLHHOYtcpDtEdlw
         nKrtfO3l3nW7DlYYjkn6ypB4vhpayoWL3PXx5WLgWsuwPk9lg0keIXCrhvWUfLucUjzI
         Cjhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=dRvKKZgIhihQnIQynj8k2u+JpYICfbYLyLx8cHpKIVU=;
        b=lnlvuoik/XNb8XJP5OWDx07+IXQe3VZ6osIQKX1ROcQ5pBSCZ9Fdv4W9oJU1SqPnPc
         iTo+1LoQlnRkaieQgGNZ1bYLss890Z4KsTCnvmUvLYNCTJL9XuGtq4L1UVs/xkl0363W
         E7dnUKYjF6EGlGRKaOKuaBFN4/ZRq5A571DS210kSEZhjMthd8CUGs0RTG7jhqBeRGDy
         2YPJlgzVOqqZNXvU/cELc39tf/YAMypXg7gxmUjN4Tn7NUBi1p8TpTy8A1grIVp2hHyD
         Gb+7bARQ9rvNB+BGRtY3VnyzUfemRGIJmUOGriJB/SW8AbmLpSMXw8gPyCxiWV8eBRHV
         2Mig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dRvKKZgIhihQnIQynj8k2u+JpYICfbYLyLx8cHpKIVU=;
        b=p1Aq5fmWkvvJzuNZYzNM1Df6JkOCD9qNlX1hqqB0Yg4P+HnjKRjLEA38PoqPtsO7pc
         Wqf7YF2boQBjLzuCMXmOcQGNrBk7bDg+Y7t7GajNTENoJ05J6w5iA3jZsnQItNGUiKRS
         tW/8gFXxBiV4cEAzIB2vKGidautO3LgyGpbv1W1xrgrCX1L7PPopFkF0FHIJdb8A7F/7
         BnOkz/kjdc6she2sFWJDlYCYQTc6m8+I+fiGoeoFGY4kmCZxXvj72lfA1VnFox9Gkxaa
         u1xrDPcgKOE/UBA2B1FjW6237bw/y3kEjo3EFwofPzLboiD38XV/3+Rsq0wnqkLPCLln
         oHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dRvKKZgIhihQnIQynj8k2u+JpYICfbYLyLx8cHpKIVU=;
        b=dxwNi5fLKWFjQRCAU3ph4fg6WTYGs/ZCX6s2ah+EKaBDp/bCPWkkI0HMaRU9lGMIGm
         pgPG5ELQfkvQqhin0KxyrlxYIgjoijZKY8K34fE1pnsqnGXVlR0YLToIZeoWo9CcJeh7
         Dm3JGHGm4x3Ykwksag2PcwJo/U7T2cWui28Z8emCemUeoJOI3JWYaJmQX8gJe9TYZJg9
         8cAJmByiOWBOdMX8ybuyZXa2g+I2Ek/oTqnGlBliNNJyJRCwG0RwCHMu0au4S34tS3Lp
         t6aUGwgdHNa/Y+lvQcuej40K9aKp6PM6hqj0PSb5PeS15dtdq0AIh5h6dg1ptbmIPJlq
         +qaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330ict72C1+Sl0IGiHbIL4MkKILwrUUKv30poyF/txE2ayP9F+q
	URF2IltmR28GJiZEtihuxx8=
X-Google-Smtp-Source: ABdhPJwa55XcrrNNjG29kMq94nm36z+G14HTX3dzVL2UvrTZj7wwpKECTJJ3ZXxiKdDJDjJkMCOYJQ==
X-Received: by 2002:a05:6512:3399:: with SMTP id h25mr885651lfg.524.1601958725405;
        Mon, 05 Oct 2020 21:32:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls1439882ljq.4.gmail; Mon, 05
 Oct 2020 21:32:04 -0700 (PDT)
X-Received: by 2002:a2e:a306:: with SMTP id l6mr1097453lje.286.1601958724187;
        Mon, 05 Oct 2020 21:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958724; cv=none;
        d=google.com; s=arc-20160816;
        b=xODEsb3nMJ3UetJnfKgGxK+Joq8NYdUjDv298VdjPc1WZphRLEjVT45q5Pgd9mhCbC
         a0t81itBDBVKMgykuFrZ4kR7RJPztYoGfscto4B1iOFxDAX5XMxw1NWHky/R5PPhIWaL
         YVQOBzoZO/f1PAkG4Fffz/tUvegfMgvdyg+fRo4tpXSlKOlPWW2bxU+jC6KEEC8TFExh
         z3WlDlj6AEVrZmz28vbvQj6KuVb6wkilQKAYCckoQcNJ97Nq6+2EGoQiu+bpRvrH32W/
         6CQlWf/oUprM5QQtkc0UM56eAkKYudbvaIGo4l8tInlBm+ttP26OR1thnumIqd4UJZyE
         RE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8kxpC0x6faoeDwUKkPOsdevo2WEbk9AlJiOHmtjh43Y=;
        b=IegklMjtSs2JcUaaMjXUQG9+39cnXN1c0iaBlyoMt2CEkvOQ+qn6fuC/ZI0u9vLlUH
         zaCaz9PGvN5ceGftQ+/Jn2CqEgHzFjktxAcbDE+qikuD9Z5E84VTB23Tz/zeuKxINQAH
         6SFfV504F5TiqO2OsUNzpHIActD/qcC1TqIWh8GxcjHmr/alFBt8V+UQxo5vHHcBsJ1W
         F8kFyfHiUHrefvz55yU91/wNuO0kw0QpsYyk8L4yi/rMzeDHigJ53Z+iZ3YfThnZAw4s
         D+ABBeMhHpPrmtsURCSPJGZ7X7bGGDNK5xCK+xyV95SqXoygpw4X6rQrpanhDF6XJJjd
         CHgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id n5si45233lji.5.2020.10.05.21.32.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:32:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964W3Tr029784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:32:03 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY85008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:32:02 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 19/19] arm-trusted-firmware: Remove now unused artifacts
Date: Tue,  6 Oct 2020 06:31:34 +0200
Message-Id: <93a0c5bfcdd39ac277422cf2dbeabac1ae61e624.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Last user converted, let's clean up.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arm-trusted-firmware_2.2.inc              |  20 ---
 ...-Prepare-for-skipping-initialisation.patch | 127 ------------------
 ...2-plat-rpi4-Skip-UART-initialisation.patch | 109 ---------------
 ...pi3-4-Add-support-for-offlining-CPUs.patch |  47 -------
 4 files changed, 303 deletions(-)
 delete mode 100644 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
 delete mode 100644 recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
deleted file mode 100644
index 9f75497..0000000
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-FILESPATH =. "${LAYERDIR_jailhouse}/recipes-bsp/arm-trusted-firmware/files:"
-
-SRC_URI += " \
-    https://github.com/ARM-software/arm-trusted-firmware/archive/v${ATF_PV}.tar.gz;downloadfilename=atf-v${ATF_PV}.tar.gz;name=atf \
-    file://0001-console-16550-Prepare-for-skipping-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
-    file://0002-plat-rpi4-Skip-UART-initialisation.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
-    file://0003-rpi3-4-Add-support-for-offlining-CPUs.patch;patchdir=${WORKDIR}/arm-trusted-firmware-${ATF_PV} \
-    "
-SRC_URI[atf.sha256sum] = "07e3c058ae2d95c7d516a46fc93565b797e912c3271ddbf29df523b1ab1ee911"
diff --git a/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch b/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
deleted file mode 100644
index 10ca776..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/0001-console-16550-Prepare-for-skipping-initialisation.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 62b9c075700eedbc6d308b51b17e90c031c1a300 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Thu, 12 Dec 2019 12:00:15 +0000
-Subject: [PATCH 1/3] console: 16550: Prepare for skipping initialisation
-
-On some platforms the UART might have already been initialised, for
-instance by firmware running before TF-A or by a separate management
-processor. In this case it would not be need to initialise it again
-(doing so could create spurious characters). But more importantly this
-saves us from knowing the right baudrate and the right base clock rate
-for the UART. This can lead to more robust and versatile firmware builds.
-
-Allow to skip the 16550 UART initialisation and baud rate divisor
-programming, by interpreting an input clock rate of "0" to signify this
-case. This will just skip the call to console_16550_core_init, but still
-will register the console properly.
-
-Users should just pass 0 as the second parameter, the baudrate (third
-parameter) will then be ignored as well.
-
-Fix copy & paste typos in comments for the console_16550_register()
-function on the way.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Change-Id: I9f8fca5b358f878fac0f31dc411358fd160786ee
----
- drivers/ti/uart/aarch32/16550_console.S | 18 +++++++++++++-----
- drivers/ti/uart/aarch64/16550_console.S |  9 ++++++++-
- include/drivers/ti/uart/uart_16550.h    |  5 +++++
- 3 files changed, 26 insertions(+), 6 deletions(-)
-
-diff --git a/drivers/ti/uart/aarch32/16550_console.S b/drivers/ti/uart/aarch32/16550_console.S
-index 692188412..5cd9b30cd 100644
---- a/drivers/ti/uart/aarch32/16550_console.S
-+++ b/drivers/ti/uart/aarch32/16550_console.S
-@@ -89,16 +89,19 @@ endfunc console_16550_core_init
- 	.globl console_16550_register
- 
- 	/* -------------------------------------------------------
--	 * int console_stm32_register(uintptr_t baseaddr,
-+	 * int console_16550_register(uintptr_t baseaddr,
- 	 *     uint32_t clock, uint32_t baud,
--	 *     struct console_stm32 *console);
--	 * Function to initialize and register a new STM32
-+	 *     console_16550_t *console);
-+	 * Function to initialize and register a new 16550
- 	 * console. Storage passed in for the console struct
- 	 * *must* be persistent (i.e. not from the stack).
-+	 * If r1 (UART clock) is 0, initialisation will be
-+         * skipped, relying on previous code to have done
-+         * this already. r2 is ignored then as well.
- 	 * In: r0 - UART register base address
- 	 *     r1 - UART clock in Hz
--	 *     r2 - Baud rate
--	 *     r3 - pointer to empty console_stm32 struct
-+	 *     r2 - Baud rate (ignored if r1 is 0)
-+	 *     r3 - pointer to empty console_16550_t struct
- 	 * Out: return 1 on success, 0 on error
- 	 * Clobber list : r0, r1, r2
- 	 * -------------------------------------------------------
-@@ -110,10 +113,15 @@ func console_16550_register
- 	beq	register_fail
- 	str	r0, [r4, #CONSOLE_T_16550_BASE]
- 
-+	/* A clock rate of zero means to skip the initialisation. */
-+	cmp	r1, #0
-+	beq	register_16550
-+
- 	bl	console_16550_core_init
- 	cmp	r0, #0
- 	beq	register_fail
- 
-+register_16550:
- 	mov	r0, r4
- 	pop	{r4, lr}
- 	finish_console_register 16550 putc=1, getc=1, flush=1
-diff --git a/drivers/ti/uart/aarch64/16550_console.S b/drivers/ti/uart/aarch64/16550_console.S
-index dab46e8c5..80c1b8646 100644
---- a/drivers/ti/uart/aarch64/16550_console.S
-+++ b/drivers/ti/uart/aarch64/16550_console.S
-@@ -92,9 +92,12 @@ endfunc console_16550_core_init
- 	 * Function to initialize and register a new 16550
- 	 * console. Storage passed in for the console struct
- 	 * *must* be persistent (i.e. not from the stack).
-+	 * If w1 (UART clock) is 0, initialisation will be
-+	 * skipped, relying on previous code to have done
-+	 * this already. w2 is ignored then as well.
- 	 * In: x0 - UART register base address
- 	 *     w1 - UART clock in Hz
--	 *     w2 - Baud rate
-+	 *     w2 - Baud rate (ignored if w1 is 0)
- 	 *     x3 - pointer to empty console_16550_t struct
- 	 * Out: return 1 on success, 0 on error
- 	 * Clobber list : x0, x1, x2, x6, x7, x14
-@@ -106,9 +109,13 @@ func console_16550_register
- 	cbz	x6, register_fail
- 	str	x0, [x6, #CONSOLE_T_16550_BASE]
- 
-+	/* A clock rate of zero means to skip the initialisation. */
-+	cbz	w1, register_16550
-+
- 	bl	console_16550_core_init
- 	cbz	x0, register_fail
- 
-+register_16550:
- 	mov	x0, x6
- 	mov	x30, x7
- 	finish_console_register 16550 putc=1, getc=1, flush=1
-diff --git a/include/drivers/ti/uart/uart_16550.h b/include/drivers/ti/uart/uart_16550.h
-index 32e38f0ac..2b95fa33a 100644
---- a/include/drivers/ti/uart/uart_16550.h
-+++ b/include/drivers/ti/uart/uart_16550.h
-@@ -87,6 +87,11 @@ typedef struct {
-  * framework. The |console| pointer must point to storage that will be valid
-  * for the lifetime of the console, such as a global or static local variable.
-  * Its contents will be reinitialized from scratch.
-+ * When |clock| has a value of 0, the UART will *not* be initialised. This
-+ * means the UART should already be enabled and the baudrate and clock setup
-+ * should have been done already, either by platform specific code or by
-+ * previous firmware stages. The |baud| parameter will be ignored in this
-+ * case as well.
-  */
- int console_16550_register(uintptr_t baseaddr, uint32_t clock, uint32_t baud,
- 			   console_16550_t *console);
--- 
-2.16.4
-
diff --git a/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch b/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
deleted file mode 100644
index 56cac70..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/0002-plat-rpi4-Skip-UART-initialisation.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 0ea846120c1df90cf8cf29ab3f664cf7e3eabc22 Mon Sep 17 00:00:00 2001
-From: Andre Przywara <andre.przywara@arm.com>
-Date: Thu, 12 Dec 2019 16:31:11 +0000
-Subject: [PATCH 2/3] plat: rpi4: Skip UART initialisation
-
-So far we have seen two different clock setups for the Raspberry Pi 4
-board, with the VPU clock divider being different. This was handled by
-reading the divider register and adjusting the base clock rate
-accordingly.
-Recently a new GPU firmware version appeared that changed the clock rate
-*again*, though this time at a higher level, so the VPU rate (and the
-apparent PLLC parent clock) did not seem to change, judging by reading
-the clock registers.
-So rather than playing cat and mouse with the GPU firmware or going
-further down the rabbit hole of exploring the whole clock tree, let's
-just skip the baud rate programming altogether. This works because the
-GPU firmware actually sets up and programs the debug UART already, so
-we can just use it.
-
-Pass 0 as the base clock rate to let the console driver skip the setup,
-also remove the no longer needed clock code.
-
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
-Change-Id: Ica88a3f3c9c11059357c1e6dd8f7a4d9b1f98fd7
----
- plat/rpi/rpi4/aarch64/plat_helpers.S |  4 ++--
- plat/rpi/rpi4/include/rpi_hw.h       |  8 --------
- plat/rpi/rpi4/rpi4_bl31_setup.c      | 16 +++++-----------
- 3 files changed, 7 insertions(+), 21 deletions(-)
-
-diff --git a/plat/rpi/rpi4/aarch64/plat_helpers.S b/plat/rpi/rpi4/aarch64/plat_helpers.S
-index 46073b791..083c30e71 100644
---- a/plat/rpi/rpi4/aarch64/plat_helpers.S
-+++ b/plat/rpi/rpi4/aarch64/plat_helpers.S
-@@ -136,8 +136,8 @@ endfunc platform_mem_init
- 	 */
- func plat_crash_console_init
- 	mov_imm	x0, PLAT_RPI3_UART_BASE
--	mov_imm	x1, PLAT_RPI4_VPU_CLK_RATE
--	mov_imm	x2, PLAT_RPI3_UART_BAUDRATE
-+	mov	x1, xzr
-+	mov	x2, xzr
- 	b	console_16550_core_init
- endfunc plat_crash_console_init
- 
-diff --git a/plat/rpi/rpi4/include/rpi_hw.h b/plat/rpi/rpi4/include/rpi_hw.h
-index ed367ee20..b1dd4e92e 100644
---- a/plat/rpi/rpi4/include/rpi_hw.h
-+++ b/plat/rpi/rpi4/include/rpi_hw.h
-@@ -58,13 +58,6 @@
-  */
- #define RPI3_PM_RSTS_WRCFG_HALT		U(0x00000555)
- 
--/*
-- * Clock controller
-- */
--#define RPI4_IO_CLOCK_OFFSET		ULL(0x00101000)
--#define RPI4_CLOCK_BASE			(RPI_IO_BASE + RPI4_IO_CLOCK_OFFSET)
--#define RPI4_VPU_CLOCK_DIVIDER		ULL(0x0000000c)
--
- /*
-  * Hardware random number generator.
-  */
-@@ -88,7 +81,6 @@
-  */
- #define RPI3_IO_MINI_UART_OFFSET	ULL(0x00215040)
- #define RPI3_MINI_UART_BASE		(RPI_IO_BASE + RPI3_IO_MINI_UART_OFFSET)
--#define PLAT_RPI4_VPU_CLK_RATE		ULL(1000000000)
- 
- /*
-  * GPIO controller
-diff --git a/plat/rpi/rpi4/rpi4_bl31_setup.c b/plat/rpi/rpi4/rpi4_bl31_setup.c
-index 53ab0c2e2..9e3b53979 100644
---- a/plat/rpi/rpi4/rpi4_bl31_setup.c
-+++ b/plat/rpi/rpi4/rpi4_bl31_setup.c
-@@ -119,8 +119,6 @@ void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
- 				u_register_t arg2, u_register_t arg3)
- 
- {
--	uint32_t div_reg;
--
- 	/*
- 	 * LOCAL_CONTROL:
- 	 * Bit 9 clear: Increment by 1 (vs. 2).
-@@ -136,16 +134,12 @@ void bl31_early_platform_setup2(u_register_t arg0, u_register_t arg1,
- 
- 	/*
- 	 * Initialize the console to provide early debug support.
--	 * Different GPU firmware revisions set up the VPU divider differently,
--	 * so read the actual divider register to learn the UART base clock
--	 * rate. The divider is encoded as a 12.12 fixed point number, but we
--	 * just care about the integer part of it.
-+	 * We rely on the GPU firmware to have initialised the UART correctly,
-+	 * as the baud base clock rate differs across GPU firmware revisions.
-+	 * Providing a base clock of 0 lets the 16550 UART init routine skip
-+	 * the initial enablement and baud rate setup.
- 	 */
--	div_reg = mmio_read_32(RPI4_CLOCK_BASE + RPI4_VPU_CLOCK_DIVIDER);
--	div_reg = (div_reg >> 12) & 0xfff;
--	if (div_reg == 0)
--		div_reg = 1;
--	rpi3_console_init(PLAT_RPI4_VPU_CLK_RATE / div_reg);
-+	rpi3_console_init(0);
- 
- 	bl33_image_ep_info.pc = plat_get_ns_image_entrypoint();
- 	bl33_image_ep_info.spsr = rpi3_get_spsr_for_bl33_entry();
--- 
-2.16.4
-
diff --git a/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch b/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
deleted file mode 100644
index 02d0440..0000000
--- a/recipes-bsp/arm-trusted-firmware/files/0003-rpi3-4-Add-support-for-offlining-CPUs.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 6368eab6c5129f4ee6679a2daa6f0d5315cfd655 Mon Sep 17 00:00:00 2001
-From: Jan Kiszka <jan.kiszka@siemens.com>
-Date: Sun, 8 Dec 2019 20:48:46 +0100
-Subject: [PATCH 3/3] rpi3/4: Add support for offlining CPUs
-
-The hooks were populated but the power down left the CPU in limbo-land.
-What we need to do - until there is a way to actually power off - is to
-turn off the MMU and enter the spinning loop as if we were cold-booted.
-This allows the on-call to pick up the CPU again.
-
-Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
-Change-Id: Iefc7a58424e3578ad3dd355a7bd6eaba4b412699
----
- plat/rpi/common/rpi3_pm.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/plat/rpi/common/rpi3_pm.c b/plat/rpi/common/rpi3_pm.c
-index 8c2d070c4..2a6bf076b 100644
---- a/plat/rpi/common/rpi3_pm.c
-+++ b/plat/rpi/common/rpi3_pm.c
-@@ -123,6 +123,15 @@ static void rpi3_pwr_domain_off(const psci_power_state_t *target_state)
- #endif
- }
- 
-+void __dead2 plat_secondary_cold_boot_setup(void);
-+
-+static void __dead2
-+rpi3_pwr_domain_pwr_down_wfi(const psci_power_state_t *target_state)
-+{
-+	disable_mmu_el3();
-+	plat_secondary_cold_boot_setup();
-+}
-+
- /*******************************************************************************
-  * Platform handler called when a power domain is about to be turned on. The
-  * mpidr determines the CPU to be turned on.
-@@ -224,6 +233,7 @@ static void __dead2 rpi3_system_off(void)
- static const plat_psci_ops_t plat_rpi3_psci_pm_ops = {
- 	.cpu_standby = rpi3_cpu_standby,
- 	.pwr_domain_off = rpi3_pwr_domain_off,
-+	.pwr_domain_pwr_down_wfi = rpi3_pwr_domain_pwr_down_wfi,
- 	.pwr_domain_on = rpi3_pwr_domain_on,
- 	.pwr_domain_on_finish = rpi3_pwr_domain_on_finish,
- 	.system_off = rpi3_system_off,
--- 
-2.16.4
-
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/93a0c5bfcdd39ac277422cf2dbeabac1ae61e624.1601958694.git.jan.kiszka%40siemens.com.
