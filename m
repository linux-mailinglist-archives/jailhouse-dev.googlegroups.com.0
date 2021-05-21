Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBNAT2CQMGQEAJEJW7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C29238C53F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:48:38 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id f4-20020a2e97440000b02900e0cf71110dsf8708237ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:48:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621594117; cv=pass;
        d=google.com; s=arc-20160816;
        b=cRoLRV64M1/I0AvL347WURV2MBumSKQIAxE1JQNedvenQbGYCb/LNjio1PbrPno8qG
         ot+h7fpvFLddLQ597oTgnWn9y0vn4WexizoIAAUdHrx6ENue+8XjQxHDnppSjVBgVS/V
         FgUUv0njOZJGzDowLpP29FA8H0Utp3C6YfwPIzb+P9z3zrXPfKOEi/k6EBC693B2Z3H0
         mGN5OwDKyUZ2+vlZ2XC5v7/RquJxzsMEYH+uDqZ4xea7+U0dIGTRx3kLxJ+iW+EoOda3
         qdUKtro17ASsmDldaX24knX+1r8k+7c6+aJ8lN3MM/TwDiNvLwevVfEtpX8Wjbz4Hiqq
         0NDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=YhwytUjuHYExLMCl4QCLKBKURTBFb4cHqqx3rs8/IuI=;
        b=FkpfquNjNMm1tW10w/VLjCUCmxg3psZXmDhQL3/ekZyMOlA+Wbcyo6xTEf4DBpE6+l
         zmUP1UrKObgbweVqhzDhJ0wrl5gfq+CPVtR2aOASd8H/gCHZJAyftE2/x3MjOd5/RC7C
         pQlTPnsKwdYPRH+KDpfEBxAEMiesxai6pVCL2E1TaEjyr0YEY4g6mDfsuLXS68pycHwE
         LmNRpXHGxyprJhjlEaKW+lkF3NOdDIKCx0rEgtRLs5dNaHvg7mX0M/PlUXt/HnwRBct3
         9cEODPCpHYOxlTeXO5OqQlyTKypnDgBZb7iJSFzQ54iVeq5KyboTaDjjUI81983/Ef8Q
         H1GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YhwytUjuHYExLMCl4QCLKBKURTBFb4cHqqx3rs8/IuI=;
        b=CXwbT+HvT7JByNW1shGYKn4PUdymc7yxoRtScZR1/Hvpfhoq9kAoiIvle22fYtX/Gs
         iTCknqc6zGhDDcFopYc/82ems7eK0XQoYT+97IUGw4zytbnB9YM1+8ls3CVBVG0Iu520
         RuIaz6Vh9bOItTvPrGkGDmzgSJMpnkpItLzBuu4vD+58g/pqnZIN4pCXIbMBuPnOdsgQ
         h+ahsno2yU26lNVyWlUxAZztRB+vh6d+CAaUhjWHyz/K/8pdnju42hRM+b5SkYzXkw/J
         5bupzTicf1EiIE6Fb4ZK9xOP4p+1bYFFMK2p+EGTzvn7viy5ZWiijCi63eQlLwunyJ2a
         Zv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YhwytUjuHYExLMCl4QCLKBKURTBFb4cHqqx3rs8/IuI=;
        b=GifYO6UjK0y9I05yZFGNpLjhMoGyTwabxKAPp9CsFXXjBRE/hbz5gtmvHR0MScSUCE
         3+UEUvxLxBLo50KBg5tlyDMLbrMgxHVyPtCMPURaLMev35Q30vOh16mniOQby0Z6oDwU
         BJbgr/5iovaj9JdXCIY3iRDaarivYBxVulM7ea0STUEnp0kPGIpzuhdpdS1i0V0n+qsh
         cUbk1RAvZJvudNMeLRH98WHaKohoQkCOyItNkNz5bZ6kR7kIUySJuvJOxzyLmT6ka0PU
         n6g6Ud7zxxTNYQCslQoR60sLu5ZYE6AVeon765M7OFof6zrCLEZ8soq3bez6ArkkCVIn
         rImg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zuc7G1gIcRcqkAG7qGB4UgiKaRtl3xMCTIpDxStNpGI5nXrjs
	pcJj7s505vBsds7ljetXEEo=
X-Google-Smtp-Source: ABdhPJxr2RdiG2NB27USW0Uvty2kvkALbQ2PEf4RkCckvJvs/xwIUYMHc1ZMuENTrznwfHxIEZ3HcA==
X-Received: by 2002:ac2:4e05:: with SMTP id e5mr1801596lfr.613.1621594117815;
        Fri, 21 May 2021 03:48:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:592a:: with SMTP id v10ls341246lfi.2.gmail; Fri, 21 May
 2021 03:48:36 -0700 (PDT)
X-Received: by 2002:a05:6512:3b87:: with SMTP id g7mr1789741lfv.241.1621594116731;
        Fri, 21 May 2021 03:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621594116; cv=none;
        d=google.com; s=arc-20160816;
        b=1EXtXxLskCARbFNxwraIr332vW841iZliK2q8aUmhxMb5PTx3Wcge37nTcbVrIT38p
         kcj2srFNUs6A+qFZ9BSoYefX5CG7weUOGfE+T5PRJYec0sobaS8Cl8XfoOqUmqduiUqx
         fHXEp7Xbbt8yfEqQaHBeGno0HxnDnnjKDUvU6ViWmmYsO/9apZZrbqpVaenqOApidnNG
         HvYvJVw90XZ1Cvbg5bstCRSmhjIN9EhXRaTtLSewtKshf1tto4XIrZihvjLoEm3uJRar
         shQwdmNuFE0A+l1wT6Gdqn2Pn1MvGxsfV98TmN+uLa8fA9+43RuTt7VnFxqq8I6Apxyw
         e8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+NeteLB0mZGbig77FtRu9ScTA/s0wdKoasjF8yHmLWE=;
        b=nk0DFOR5Kj+u4RPoK/k7/SS+UUJkk/xt3C0uNAuZN9r8qTkgbBKMsIyCh2UFb8SFGl
         wbiKFCmMjUBXTBE+tveNvHwkkQ7gyQBGvN04TcQ1fqclWbJ/qaiQKB5pIJYYFE+BULah
         307JIZ6ZxTWpSve88VzdJ3xWq3E+n0cWtDNsqGn5r8hiP7oyrHvF+UszYSoVNhtTxN92
         5jN7kawLH2ukBz333KI/Gfnt2h7dfURu1oj7wx58fOpSsXDXWIkfTk/SHTpx30sHkNMy
         hcaL2VB/TTS9lRfSoeChJ6iFO9XzUTrXr96XS393qZ65TW3Na8btUtvskNTuzSRlcbFj
         cOeg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w26si240857ljw.8.2021.05.21.03.48.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAmaWW028741
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:48:36 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcM032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 17/22] trusted-firmware-a-rpi4: Add patch to improve memory reservation
Date: Fri, 21 May 2021 12:37:29 +0200
Message-Id: <6d357384165d963ba7f831c00ac8de5934fbe9cd.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Will be needed for supporting upstream kernels.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...memreserve-pattern-for-rpi3-and-rpi4.patch | 214 ++++++++++++++++++
 .../trusted-firmware-a-rpi4_2.4.bb            |   3 +
 2 files changed, 217 insertions(+)
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch

diff --git a/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch b/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
new file mode 100644
index 0000000..fe7ac43
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
@@ -0,0 +1,214 @@
+From 84bb39be8756f655e3882bbe529ac9921525fdb5 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Mon, 22 Mar 2021 19:58:58 +0100
+Subject: [PATCH] rpi: Use common memreserve pattern for rpi3 and rpi4
+
+This fixes the issue that recent kernels already have a memreserve for
+the startup stubs at address 0 and dislike adding another reservation at
+the same address.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Change-Id: I275194ba59405728f1a7913cb0fea0d02e75fc50
+---
+ plat/rpi/common/include/rpi_shared.h |  2 +
+ plat/rpi/common/rpi3_common.c        | 62 ++++++++++++++++++++++++
+ plat/rpi/rpi3/rpi3_bl31_setup.c      | 70 +---------------------------
+ plat/rpi/rpi4/rpi4_bl31_setup.c      |  3 +-
+ 4 files changed, 66 insertions(+), 71 deletions(-)
+
+diff --git a/plat/rpi/common/include/rpi_shared.h b/plat/rpi/common/include/rpi_shared.h
+index ddf239eb5..858bff2eb 100644
+--- a/plat/rpi/common/include/rpi_shared.h
++++ b/plat/rpi/common/include/rpi_shared.h
+@@ -38,4 +38,6 @@ int rpi3_vc_hardware_get_board_revision(uint32_t *revision);
+ 
+ int plat_rpi_get_model(void);
+ 
++void rpi3_dtb_add_mem_rsv(void *dtb, uint64_t rsc_base, uint64_t rsv_size);
++
+ #endif /* RPI3_PRIVATE_H */
+diff --git a/plat/rpi/common/rpi3_common.c b/plat/rpi/common/rpi3_common.c
+index ef88bf10e..77cd90b8b 100644
+--- a/plat/rpi/common/rpi3_common.c
++++ b/plat/rpi/common/rpi3_common.c
+@@ -6,6 +6,8 @@
+ 
+ #include <assert.h>
+ 
++#include <libfdt.h>
++
+ #include <platform_def.h>
+ 
+ #include <arch_helpers.h>
+@@ -245,3 +247,63 @@ uint32_t plat_interrupt_type_to_line(uint32_t type, uint32_t security_state)
+ 	/* Secure interrupts are signalled on the FIQ line always. */
+ 	return  __builtin_ctz(SCR_FIQ_BIT);
+ }
++
++#if defined(RPI3_PRELOADED_DTB_BASE) || PLAT == rpi4
++void rpi3_dtb_add_mem_rsv(void *dtb, uint64_t rsv_base, uint64_t rsv_size)
++{
++	int i, regions, rc;
++	uint64_t addr, size;
++
++	INFO("rpi3: Checking DTB...\n");
++
++	/* Return if no device tree is detected */
++	if (fdt_check_header(dtb) != 0)
++		return;
++
++	regions = fdt_num_mem_rsv(dtb);
++
++	VERBOSE("rpi3: Found %d mem reserve region(s)\n", regions);
++
++	/* We expect to find one reserved region that we can modify */
++	if (regions < 1)
++		return;
++
++	/*
++	 * Look for the region that corresponds to the default boot firmware. It
++	 * starts at address 0, and it is not needed when the default firmware
++	 * is replaced by this port of the Trusted Firmware.
++	 */
++	for (i = 0; i < regions; i++) {
++		if (fdt_get_mem_rsv(dtb, i, &addr, &size) != 0)
++			continue;
++
++		if (addr != 0x0)
++			continue;
++
++		VERBOSE("rpi3: Firmware mem reserve region found\n");
++
++		rc = fdt_del_mem_rsv(dtb, i);
++		if (rc != 0) {
++			INFO("rpi3: Can't remove mem reserve region (%d)\n", rc);
++		}
++
++		break;
++	}
++
++	if (i == regions) {
++		VERBOSE("rpi3: Firmware mem reserve region not found\n");
++	}
++
++	/*
++	 * Reserve all SRAM. As said in the documentation, this isn't actually
++	 * secure memory, so it is needed to tell BL33 that this is a reserved
++	 * memory region. It doesn't guarantee it won't use it, though.
++	 */
++	rc = fdt_add_mem_rsv(dtb, rsv_base, rsv_size);
++	if (rc != 0) {
++		WARN("rpi3: Can't add mem reserve region (%d)\n", rc);
++	}
++
++	INFO("rpi3: Reserved 0x%llx - 0x%llx in DTB\n", rsv_base, rsv_base + rsv_size);
++}
++#endif
+diff --git a/plat/rpi/rpi3/rpi3_bl31_setup.c b/plat/rpi/rpi3/rpi3_bl31_setup.c
+index 59157536b..959694e77 100644
+--- a/plat/rpi/rpi3/rpi3_bl31_setup.c
++++ b/plat/rpi/rpi3/rpi3_bl31_setup.c
+@@ -6,8 +6,6 @@
+ 
+ #include <assert.h>
+ 
+-#include <libfdt.h>
+-
+ #include <platform_def.h>
+ 
+ #include <common/bl_common.h>
+@@ -151,76 +149,10 @@ void bl31_plat_arch_setup(void)
+ 	enable_mmu_el3(0);
+ }
+ 
+-#ifdef RPI3_PRELOADED_DTB_BASE
+-/*
+- * Add information to the device tree (if any) about the reserved DRAM used by
+- * the Trusted Firmware.
+- */
+-static void rpi3_dtb_add_mem_rsv(void)
+-{
+-	int i, regions, rc;
+-	uint64_t addr, size;
+-	void *dtb = (void *)RPI3_PRELOADED_DTB_BASE;
+-
+-	INFO("rpi3: Checking DTB...\n");
+-
+-	/* Return if no device tree is detected */
+-	if (fdt_check_header(dtb) != 0)
+-		return;
+-
+-	regions = fdt_num_mem_rsv(dtb);
+-
+-	VERBOSE("rpi3: Found %d mem reserve region(s)\n", regions);
+-
+-	/* We expect to find one reserved region that we can modify */
+-	if (regions < 1)
+-		return;
+-
+-	/*
+-	 * Look for the region that corresponds to the default boot firmware. It
+-	 * starts at address 0, and it is not needed when the default firmware
+-	 * is replaced by this port of the Trusted Firmware.
+-	 */
+-	for (i = 0; i < regions; i++) {
+-		if (fdt_get_mem_rsv(dtb, i, &addr, &size) != 0)
+-			continue;
+-
+-		if (addr != 0x0)
+-			continue;
+-
+-		VERBOSE("rpi3: Firmware mem reserve region found\n");
+-
+-		rc = fdt_del_mem_rsv(dtb, i);
+-		if (rc != 0) {
+-			INFO("rpi3: Can't remove mem reserve region (%d)\n", rc);
+-		}
+-
+-		break;
+-	}
+-
+-	if (i == regions) {
+-		VERBOSE("rpi3: Firmware mem reserve region not found\n");
+-	}
+-
+-	/*
+-	 * Reserve all SRAM. As said in the documentation, this isn't actually
+-	 * secure memory, so it is needed to tell BL33 that this is a reserved
+-	 * memory region. It doesn't guarantee it won't use it, though.
+-	 */
+-	rc = fdt_add_mem_rsv(dtb, SEC_SRAM_BASE, SEC_SRAM_SIZE);
+-	if (rc != 0) {
+-		WARN("rpi3: Can't add mem reserve region (%d)\n", rc);
+-	}
+-
+-	INFO("rpi3: Reserved 0x%llx - 0x%llx in DTB\n", SEC_SRAM_BASE,
+-	     SEC_SRAM_BASE + SEC_SRAM_SIZE);
+-}
+-#endif
+-
+ void bl31_platform_setup(void)
+ {
+ #ifdef RPI3_PRELOADED_DTB_BASE
+ 	/* Only modify a DTB if we know where to look for it */
+-	rpi3_dtb_add_mem_rsv();
++	rpi3_dtb_add_mem_rsv((void *)RPI3_PRELOADED_DTB_BASE, SEC_SRAM_BASE, SEC_SRAM_SIZE);
+ #endif
+ }
+diff --git a/plat/rpi/rpi4/rpi4_bl31_setup.c b/plat/rpi/rpi4/rpi4_bl31_setup.c
+index cfacd1fe1..bd3c28fef 100644
+--- a/plat/rpi/rpi4/rpi4_bl31_setup.c
++++ b/plat/rpi/rpi4/rpi4_bl31_setup.c
+@@ -228,8 +228,7 @@ static void rpi4_prepare_dtb(void)
+ 	}
+ 
+ 	/* Reserve memory used by Trusted Firmware. */
+-	if (fdt_add_reserved_memory(dtb, "atf@0", 0, 0x80000))
+-		WARN("Failed to add reserved memory nodes to DT.\n");
++	rpi3_dtb_add_mem_rsv(dtb, 0, 0x80000);
+ 
+ 	offs = fdt_node_offset_by_compatible(dtb, 0, "arm,gic-400");
+ 	gic_int_prop[0] = cpu_to_fdt32(1);		// PPI
+-- 
+2.26.2
+
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
index 2a655a3..98d6904 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.4.bb
@@ -11,4 +11,7 @@
 
 require trusted-firmware-a_${PV}.inc
 
+SRC_URI += " \
+    file://0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch"
+
 TF_A_PLATFORM = "rpi4"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d357384165d963ba7f831c00ac8de5934fbe9cd.1621593454.git.jan.kiszka%40siemens.com.
