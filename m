Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7B66BQMGQEAXFHBYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFE8364CC9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:35 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id z135-20020a1c7e8d0000b02901297f50f20dsf49797wmc.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866395; cv=pass;
        d=google.com; s=arc-20160816;
        b=y7r66rLBO1GIi+SA85YoCwlf3LuHjGtOXQHLHX1EQKw1nc5C0/rqDvxZXF5vlpdsMp
         SAbtQQcCaRIifvjuLP8I/BZ9DZmRZgu5Sa7/OrFOIhCASYXjFiLfvqob6VelERWyqeoB
         QO1diD5e7Wr4QbIcNzeziiCfJeajZgVAS0mdpDvM2z1SDXv9td6LuByDCvLpgADjiubg
         pTUbcCqWbqyDnHlP0uC+t/lN01eZB4NoOkyftcSL9hsWNl9cJOc7E3/glACX+DIb1P5T
         kGnpU7vFVq/XTAxIaDqzMBSNjACzEvUUTFMbu0NfUg4X+nM+exEubqsMf4N5DM5OjAvq
         jMvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=V/nkDiVPfOefpBgYqIOtlD8SE3mueXTyTHjyuRrzD74=;
        b=rGEW0XsrVi5bBvs8TKcjInYlCBHEQYvqWETEBFase2k/8dEe4eFiPe1pto8uMXbIvv
         CQSp1SGQy0UFKTgho8ndSBPcpNjWw4qNF8MaMtvHQ0+7+2ajqaqCxwkqwywbjc62Gr7C
         xjhUfRWZ5PiKTSZK3xJfAxY21m2N0QqzUYpxGGOMiWuRvLx8jXD88bVEanqqNHBNADIF
         QcA4LiekHVWFPaL7TkjGydUhOK9JfuChNamvG16OXUa0oV+QZ3izYWc4Oqn7p3xq1Sm9
         +zR6CIIFv/Bwkl/4iFk/9EcyfSjHiVR3g43J+YD5BDdIEHnzRY2UKbGElLa9k15DW0Wd
         GyXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V/nkDiVPfOefpBgYqIOtlD8SE3mueXTyTHjyuRrzD74=;
        b=qpf36czQj83EgFgCHyZh//76nsY7AkkhGwAA3Mq2gZpehGJFYq5Wv6k200UTF6O2FR
         Gig0QcgXoybNSTEJCMiCSI8OIvhY+066/9N61BOABGUVQJO724vy4yEoevz/Cx8PDqXy
         1Z5bh8NT2emLQL/0ZQ/ufP5bfQJJsMIVUpQrRqpRMnK/8yXLoNHiUsYvHF1KcQwDbIH1
         8nPtXeFKc8GcfCy9S7CbLtkcJ65dR1fjDqIMIydJy6XrBMekT19w6UNwr//TbO4L+rpZ
         2ajy6eG0cgazs6AICzS6hKLO+HUgXb0XGdBQ0CpiWfzckiIAhaVRP3bB5pG3/4XJK08k
         O8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V/nkDiVPfOefpBgYqIOtlD8SE3mueXTyTHjyuRrzD74=;
        b=uc8JcMPKu1585NHUTrX94LOQcCJHlT2EllFVWAs6FjpeL64NT4cNq/fTeDgrJj8XPx
         7TspF1Z9lMOrlkLw49OJm1IA3YXXMoUh6rDrIaBw8ssSjiEdxFKMXQ23F7/qhVTI9dJ3
         IDz9FgyxjJNsqqHwfGP+QxZgt+j/A6GQbWxRDU15AUI2DkGx2OCGh4Ug1E+FqYy7jMg3
         neppS7m2yc86bOtJYf4IfbaxVXVwoHOde+Cyg23lWMpzlZE9F3A3ieW15NPRn+jvrkQm
         uY70nG4NRqUP1SCLBhg6vLAgJc7pABylyY9QEY9HuKWjW56yaGjVIUbsERagfNPqWM6k
         kLXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LnCAaFaL+3Cg521D0s5vizIhxSoZX2vb6mM+r9idRkbsHGbkW
	GjFX9sOTz/NkwDLhyKX0EpA=
X-Google-Smtp-Source: ABdhPJxSULc/xxuaMLrijBAvQT0lS4p2g60MPdfj0zAN0qkFSTSdnn5AeKJqHxGy6i1Za+vrKWgQaw==
X-Received: by 2002:a5d:4a86:: with SMTP id o6mr16736528wrq.192.1618866395719;
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c205:: with SMTP id s5ls295144wmf.3.canary-gmail; Mon,
 19 Apr 2021 14:06:34 -0700 (PDT)
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr941384wmj.188.1618866394712;
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866394; cv=none;
        d=google.com; s=arc-20160816;
        b=xLv2ZHIotXOzckPmXIl4WhnD7B13oTzYyDiSVtfbZc2g7lrPD4jomEQJgnCsQ1AsNh
         xSVtpfAM2mpKqUQFDICzYjAYMVmtU0jqA/Hqso+WmgHZusY6vADYr751f+RRNeMRSZkC
         nnWB9pTk2cFmH3FIlqzJoYPY6PT1n118mAvz52zanRqHHd0w1j//uEHd7shbv+PF5gOw
         cCLQ5e9/EP5Po3xgL6P/HDvhY4IM2lQRBHzXh7ag2isbvlyItFyq46gmzOe0IA3D3SAg
         7MQlAESewtIUeMTyuy+WC3+v6iCsrkLU05g7droS4Sgad8zzXyKHvriD5VDRFXnxdmX1
         lr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+NeteLB0mZGbig77FtRu9ScTA/s0wdKoasjF8yHmLWE=;
        b=Aw0vqN9I0/W1trD68Rt92WBQSJrHlrGAfdpO/1pqWSyvaXopA4H6pcVwxDuOY5Gfne
         nesN0va1dcQ31CTjUWyRNN1hZ72jNbSu+9kF1bL5VlBYpInvN0weBIaE5T2Clhlsry/a
         WSoQcsrIbKDiH4JX8OHeWt2KGqyVz6DqFI97gIcaQRy+duljYP2ElfSsBFEVgx/rcK5H
         70uTmxRmZrwGwQienSA3tOOhsvHE9y/bgia9eW3pFVkN9TmtiMRTEVFqoVA1ap3oc3tK
         72QTaUOfGxU9QDqx5OHRlu/S51Dnk5pQVQO2rv+DHr80GJb6bUaoczX8MaF3QnAmaNf1
         V2AQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a191si129009wme.3.2021.04.19.14.06.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6YRJ022652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpk015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:34 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 17/20] trusted-firmware-a-rpi4: Add patch to improve memory reservation
Date: Mon, 19 Apr 2021 23:06:26 +0200
Message-Id: <80221c6ee7f1c91a321d4549bf0f41ccab57572b.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/80221c6ee7f1c91a321d4549bf0f41ccab57572b.1618866389.git.jan.kiszka%40siemens.com.
