Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLHD5L5QKGQEFZV2TZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A6A28302C
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:57 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id u82sf2013371wmu.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876396; cv=pass;
        d=google.com; s=arc-20160816;
        b=kTUYp05aK7F9mXeWCtwH6949o5H+aHSg8rvIJ00jmnaHbczMrk+jF9vhU6Sgyk7a/j
         e3as0OCzQcp3aI+TlS4UPfO9f+YL6P1un99gfIipxXjFKViQfPtOLYelIHhQnH3pJ/QD
         KpGzSvdER0kAkhgwMnNls6VyToEY/8NGH++dkJURg/krXD22Ui/lBM7BM8fnXUjGBfQw
         SeqEAOs0psw6PndpbKHAsszEYOIkvLw9rGtMoHR9aClfDj6Y2tYobKx7I6wmeRbabUZy
         xtGBEguhWRT6Me9d7TfFeQOPZwDB6S9Kc6o9R4fhlaGG1E6XJRA65FrzrBwd8+YoBA08
         v3Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=BhJY9YxKoqHFGHNwz/dz4QJM1ooV9VG3Db2ENg4YduM=;
        b=P5nDGCfNuXSv1qVT1cBYPO6n0e1E9T8hl5AJwBjO8hCwnChv1BYMiakU6/nE2ASwk0
         IENVnIs0uR9y4gwWJPF+w5tIwS5d774kzK/omhcJMLZTJSErSjiUDxcvswk4wvcx4i6f
         RIBlSMmPgEdnKqAVg+1JCvj9ujty+3BnMQOtJT1tDu5EBxCbAUFECf+qWf+QfkqC0r/v
         XjE0IPWUyvTy1NdcfzVnb0UEjAFFiIvgIAE2UXUFkq9E5Kf8c7g6kinnR9wOvdVa8Pqq
         6nhlQu9NA3qzBC0+y0Jah5Ws3YdGHGbHi3IKNPFNnmBSrZ6nVg7PSA6Lj+aQ8pNKmW0O
         CF9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BhJY9YxKoqHFGHNwz/dz4QJM1ooV9VG3Db2ENg4YduM=;
        b=jWT8HMWsClm6ecNY+1l1bTPrWWYRtmQ2xONRtr6AANzTrHBW4sz07GgdCVT/n34KtT
         fMelhhYn1S1OtfUJAmXeHtlCP8Zv0RaOkI7lks+j5xBX1GkGHspQQnhCn6GIsK1AFpBF
         dBva0weTw/hgGKbodiAYwsGHKm3+bllEmBaFAYbKGfaymHOoPB4zzGK7CHLVFC/c0cx+
         NK9nfhXrujjNF4NSVVtHEluPFkCXaaeHl3qUhcxUl76n1MJxUKoSVSltkJI7wod5eWN7
         +mBr1ArTNn/TWBGM/xxqy31v1/hNbHw+m+51kpVd1jHLY1XBwIUCiDA/jrG24HURqxvC
         +NIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BhJY9YxKoqHFGHNwz/dz4QJM1ooV9VG3Db2ENg4YduM=;
        b=SWjEcj2HhIA/mHRk9xNRerkVbiDWkZ023OWQv0ADeTkHatV04y0+Wuheznq7dtDY99
         /UfeduI/wvQ9uvAbmDAZHsQJ9PZo22l5DobpCyyUsOAKHT3j/bXWzRGwkinZzGclVr4c
         BrmhYdzhrDfmsBACbbB0IDenHT59BFWdHKJkvoWmBp5ElElEfJZHcP35vdPgdCbMeQPa
         Ns9VAWSFQigiJmZLvhZCgwy0egfgziBcaXFWNLM5HHEAZ1wNczqZFo4tGGeMFM8iBqjM
         1SC2HOaGB5NVKOx6Ut9QLVtTXu/biW7W8pBeZkIoJDFxk6yNvlXK6H4wIH71a2FhoMhO
         WJhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BpoicYFlctcakx2z7emLV3m80JwyGZmW3vlNWadRnB9tcfVky
	jqifqMFvE9qKSgx2EycwYd0=
X-Google-Smtp-Source: ABdhPJx3iOTgDrxpGuoiMae6pge0ppQBMWuF5iA5FFTp/mZOogIOnq1LEk/QaHicQ8y9aU/RUFQnxQ==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr16471662wru.363.1601876396810;
        Sun, 04 Oct 2020 22:39:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls6434065wrq.0.gmail; Sun, 04 Oct
 2020 22:39:55 -0700 (PDT)
X-Received: by 2002:adf:bc14:: with SMTP id s20mr5412066wrg.220.1601876395806;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876395; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqVxQn9yfzJ26633SyCmGjrueY2/a6poXvwIHT+OOz66vbf22EwBQFWbOTPXl16OJP
         aKfTt3PbmGkea2esqTmXukzx9zDtGjbtxBIsYEIMKWwg/fDEGjh1OxvJX6eSFU2tSfJM
         dMDstxqyyiUJsv0gJhrj6yxuV0IxJj6g2q0TkT7OksG9329fssHoRDr44GMLh+hCZD96
         wSP6FRlw9j+OKxAZASF7YidKGTCo0RFepCUKW0Y75TNf9vvRblHtD044VW1H1D9JhTta
         AmtOHlJh/FAa2uU7H6LYEO8he3EPYKQS9W4GLysZOrxCwUZKDr4m+SjRXHXkAEh9HHkC
         28wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8kxpC0x6faoeDwUKkPOsdevo2WEbk9AlJiOHmtjh43Y=;
        b=LXIpE09ZU4odYnE3N1E+CnmA3TLGieGi/dScPh85DMkybm3i3WgigvxsEe7YX7R/X3
         cG68g/0Zp0N5XXbZpSQvR2H/T84Zl7s60mMAysYrwSe8MEQ8dSmfPVUu7BIkZaHWsvb4
         Tiqil38IhT/joUymeUImm3YcRVYlor/L6qepJmYIIHgUWW45noBcafI0ukJACHYeZVpa
         CGmtisGgQk/1yf1yj/rB9gqHW5JHLzWRgWFXcQ2/BAUYO+3owau9JjZBq7FqYgNK6apq
         RlCVolEQh++pM+nUkmlBL4duAUUqiIJJFETQtv43lvrIh8L3G+CdKMoYKLnv8o7kgXtl
         G6/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w206si201533wmb.2.2020.10.04.22.39.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0955dt41024054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:55 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncS025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:55 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 19/19] arm-trusted-firmware: Remove now unused artifacts
Date: Mon,  5 Oct 2020 07:39:49 +0200
Message-Id: <6d797f1f59d77782d5542740919a14bc5bf7a665.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d797f1f59d77782d5542740919a14bc5bf7a665.1601876389.git.jan.kiszka%40siemens.com.
