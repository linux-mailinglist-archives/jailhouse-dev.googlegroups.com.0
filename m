Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBSOD7XUAKGQEMPXNN4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC76081F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:18 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id x16sf2384401qtk.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337738; cv=pass;
        d=google.com; s=arc-20160816;
        b=KMG0qk7geCwdowrS5w0IYXTHlKYdlrjSEXAs1rNKZdDgZWZSUOg6wKUVJoJOXTOpGr
         MWXp1QsXPANGCDpxJCEoNLwAAmkgLDzm1YX1lG0sPlfLZ+AFBYJFRmTrvwqMHnwDT11e
         0nJebHjKGr5Q6PdOjScAcXVCLPkgEDhEgP8hdJRda/xSnDjGPqVHaw3bU2W2xHGN4rxb
         Pl1yZGYfg854us7P+dZLr2CuRt46yhr6CObqBiOciqqa9woR5PqQcQJIFAMsNq5OJuI8
         9ItsC71JbppeGjemMh5ZdGdoHp6BY3X3r7BqaIcj/ToM+X0BJhR5LCZfp8w4lQqrxlzT
         OtfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jgr5s48FdD6YOziOmFC7MFrdCKb2VEsEQi4UCAOiJEI=;
        b=iCgktnMfS1CVsg/dajWCpWb9UG6JA3MQyqKvuv5Sb0YN0ch/6Nrxe5YPPsQ6uFg9oC
         BwGCqqRMboGCnkQ8KVOo2HYWrz8UCuKFYjoZRcL/WP8z98VTAz4kAln6AdWyaqmzuEwf
         6BIbYStPLVjiWcCE1gZBKo9giTalmyT8WPzw8n1ur60RfMOdD9fIbEF0YNsbTGr2Uxpz
         /9r5YyEtJA/V5M2gKCbwhOVOvX48HyeA5+2eJm5Jhctf9IRk9uOBkZW3rOFN05yp7r33
         3bVwaX3LD2iS4nIoSFoQGntb3XBunD+a7pn/vOX6PcA9MFZWrDIs1loj3W0r1f6/umAF
         ejtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qvjkPEgT;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jgr5s48FdD6YOziOmFC7MFrdCKb2VEsEQi4UCAOiJEI=;
        b=f66vnMFnsLoX/mLAWN1HeeE0DgG5j/0Qtnli4p1zXAkeYc4lqeMRHUjWBWXOO/cZpI
         EEPmJ9D0NFbP1xQYnUriFZS+NU8aIj+C9FUQ5F2jV9FsaBZuTUlCrrR1lH1kVDzMHuSf
         +hkkW6eQqK+sjycmtXB3LAky3dEm1c5jmbzTWnBNf/OD9mD09V5j6f0OKbelu1ybBqnB
         Yw094pkFpGLQznr8Bdlz4kJ5k55BNyH3FMi5JaJVfaZKlxigSgrDblSUjXrs9snkuA1d
         E9a1dmnbuvf19bJRnkQ/XHBMrYx6i8IPe0g8GXWw0ph8kTiUL9wMMobeGNdqrtu0zfU5
         B/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jgr5s48FdD6YOziOmFC7MFrdCKb2VEsEQi4UCAOiJEI=;
        b=izyOgmwfXHK8YfWDzWqhutHWdIOpOUNiJE6WL1q+9H1HixB1fa/epj635ndkyGunfw
         XTdfPCa3ftYqex6ZTcIZddXiXYKEnbepZKoMgdBklqPmLoltuEAWPfElLaNHQZWynYKS
         gD+R+RDpojUa8MgodB3b7n/zeQPEZZ31kH8/EP96Q4rkjlTCiUQ5UTsVKZOmBVUOiWub
         xVDlg5slLcNsNhfByFXSwxbvStJf8oSZU74uUtPUjbsBJxGFkZxsLKRPYyaOsftP2TCJ
         xIJbIQe5AGsvwUveDtOGAOG9eCYplG+t58kfYcGFzNNuwmmHa35GcT0VwX1xjdLNn1QB
         LhVQ==
X-Gm-Message-State: APjAAAUVlWgV0TclPRLP5Ae2sx3HsJOwY/HNl5PbIiuUSl4b/lDJIVQY
	dZ/Ofia0+e9EaXGpMfrChMg=
X-Google-Smtp-Source: APXvYqxwBO83km+fmY/xNoXd3ohtu8B62Qk79pRDF8vAgVrSKOixPUp7xZTFjsKDDyft+CEB+9WHGw==
X-Received: by 2002:a05:6214:1447:: with SMTP id b7mr225434qvy.89.1562337737721;
        Fri, 05 Jul 2019 07:42:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:718b:: with SMTP id w11ls416589qto.1.gmail; Fri, 05 Jul
 2019 07:42:17 -0700 (PDT)
X-Received: by 2002:ac8:39a3:: with SMTP id v32mr3052297qte.262.1562337737310;
        Fri, 05 Jul 2019 07:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337737; cv=none;
        d=google.com; s=arc-20160816;
        b=mpWfrTvPQwU3rcl/k1ViLDn+Dm637iz1BbUgDktMXaUn/2MjYNV4iyzt+t990mZzlf
         pWYGtZtTf7ARI+Cl+JamVRMZzUE3T4TFUSJpT3ARhx3HPkdS2Z+7VHc+sOvqWOeRCe4a
         omFupoxZ/awD4ugnqSBRC1eqxCnXzrS//OnZKieYjKCXMDBS3Ha8JJzLx/IihOxnYFoU
         n48CgbjBeeDpIIZaxNW3YTMMdaMAK879JA4LOCLAoJrEZbmp+a8h1nbmvDEq0cSKJlks
         6cUgRGETbagyjyKjYjiWT0tIxm6e11pbtlW6zNM7MrzV1CgbuXgiS7CWLHAnWrAez58C
         dbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PDZeJ+7UgVejtbcxq0zH8ghQU1NM48YAMXw+BFHyOrk=;
        b=PKKGo4xrAY10EyK1eDtAEPNptHSbgxbz6QGDDBLUvWEZUAUqBBuOQhhpQAPN5M5gyO
         XWI5HkveMsOUHzCXWjLw8KP/vxKsW8aPWLQY/7FMSJejEZ3ywvdMEWOTNRXFQhj33B0r
         InzDA4HCrMrBm1J7MmkW5isY0Z6/ssj9SCHerbdWyL9dKlgoPQ9AvQ11vUX0Y5EPeNOU
         ieq3WUu4mGAmAXTOXtR5QW+OjwYGeG9emnYzhzF99cFA6A0UlNFTbImiltEeGC2wM9Bo
         ABcxmnEEsgRLA5Jaws64eGbjwOvV+se1uZ0yAj9tlYYaiOjLnHMUwZh3I/NRjSi45F/7
         7/Tw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qvjkPEgT;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id o6si609372qtj.3.2019.07.05.07.42.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65EgGCi051828;
	Fri, 5 Jul 2019 09:42:16 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65EgGUk004419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:16 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:16 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1o4067904;
	Fri, 5 Jul 2019 09:42:14 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 5/6] arm64: iommu: smmu-v3: Add data structure initialization and stage 2 for SMMUv3
Date: Fri, 5 Jul 2019 20:12:24 +0530
Message-ID: <20190705144225.7126-6-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705144225.7126-1-p-yadav1@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=qvjkPEgT;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

A System Memory Management Unit(SMMU) performs a task analogous to a
CPU's MMU, translating addresses for device requests from system I/O
devices before the requests are passed into the system interconnect.

Implement a driver for SMMU v3 that maps and unmaps memory for specified
stream ids.

The guest cells are assigned stream IDs in their configs and only those
assigned stream IDs can be used by the cells. There is no checking in
place to make sure two cells do not use the same stream IDs. This must
be taken care of when creating the cell configs.

This driver is implemented based on the following assumptions:
- Running on a Little endian 64 bit core compatible with ARM v8
  architecture.
- SMMU supporting only AARCH64 mode.
- SMMU AARCH 64 stage 2 translation configurations are compatible with
  ARMv8 VMSA. So re-using the translation tables of CPU for SMMU.

This driver is loosely based on the Linux kernel SMMU v3 driver.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
v2:
- Split the driver into two parts

 hypervisor/arch/arm64/Kbuild         |    2 +-
 hypervisor/arch/arm64/smmu-v3.c      | 1120 ++++++++++++++++++++++++++
 hypervisor/include/jailhouse/entry.h |    1 +
 3 files changed, 1122 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 7283a008..323b78b6 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -20,4 +20,4 @@ always := lib.a
 # irqchip (common-objs-y), <generic units>
 
 lib-y := $(common-objs-y)
-lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
+lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o smmu-v3.o
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
new file mode 100644
index 00000000..371c4982
--- /dev/null
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -0,0 +1,1120 @@
+/*
+ * Jailhouse AArch64 support
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * Authors:
+ *  Lokesh Vutla <lokeshvutla@ti.com>
+ *  Pratyush Yadav <p-yadav1@ti.com>
+ *
+ * An emulated SMMU is presented to inmates by trapping access to MMIO
+ * registers to enable stage 1 translations. Accesses to the SMMU memory mapped
+ * registers are trapped and then routed to the emulated SMMU. This is not
+ * emulation in the sense that we fully emulate the device top to bottom. The
+ * emulation is used to provied an interface to the SMMU that the hypervisor
+ * can control to make sure the inmates are not doing anything they should not.
+ * The actual translations are done by hardware.
+ *
+ * Emulation is needed because both stage 1 and stage 2 parameters are
+ * configured in a single data structure, the stream table entry. For this
+ * reason, the inmates can't be allowed to directly control the stream table
+ * entries, and by extension, the stream table.
+ *
+ * The guest cells are assigned stream IDs in their configs and only those
+ * assigned stream IDs can be used by the cells. There is no checking in place
+ * to make sure two cells do not use the same stream IDs. This must be taken
+ * care of when creating the cell configs.
+ *
+ * This driver is implemented based on the following assumptions:
+ * - Running on a Little endian 64 bit core compatible with ARM v8 architecture.
+ * - SMMU supporting only AARCH64 mode.
+ * - SMMU AARCH 64 stage 2 translation configurations are compatible with ARMv8
+ *   VMSA. So re using the translation tables of CPU for SMMU.
+ *
+ * This driver is loosely based on the Linux kernel SMMU v3 driver.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See the
+ * COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/string.h>
+#include <asm/control.h>
+#include <jailhouse/unit.h>
+#include <asm/iommu.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/mmio.h>
+
+/* Offset of addr from start of the page. */
+#define PAGE_OFFSET(addr)		((addr) & PAGE_OFFS_MASK)
+
+#define LOWER_32_BITS(n)		((u32)(n))
+#define UPPER_32_BITS(n)		((n) >> 32)
+
+/* MMIO registers */
+#define ARM_SMMU_IDR0			0x0
+#define IDR0_ST_LVL			BIT_MASK(28, 27)
+#define IDR0_TTENDIAN			BIT_MASK(22, 21)
+#define IDR0_VATOS			(1 << 20)
+#define IDR0_PRI			(1 << 16)
+#define IDR0_ATOS			(1 << 15)
+#define IDR0_MSI			(1 << 13)
+#define IDR0_ASID16			(1 << 12)
+#define IDR0_NS1ATS			(1 << 11)
+#define IDR0_ATS			(1 << 10)
+#define IDR0_S2P			(1 << 0)
+#define IDR0_S1P			(1 << 1)
+#define IDR0_HTTU			BIT_MASK(7, 6)
+#define IDR0_COHACC			(1 << 4)
+#define IDR0_TTF			BIT_MASK(3, 2)
+
+#define IDR0_TTF_AARCH64		2
+#define IDR0_TTENDIAN_LE		2
+#define IDR0_ST_LVL_2LVL		1
+
+#define ARM_SMMU_IDR1			0x4
+#define IDR1_TABLES_PRESET		(1 << 30)
+#define IDR1_QUEUES_PRESET		(1 << 29)
+#define IDR1_REL			(1 << 28)
+#define IDR1_CMDQS			BIT_MASK(25, 21)
+#define IDR1_EVTQS			BIT_MASK(20, 16)
+#define IDR1_SSIDSIZE			BIT_MASK(10, 6)
+#define IDR1_SIDSIZE			BIT_MASK(5, 0)
+
+#define ARM_SMMU_IDR2			0x8
+#define ARM_SMMU_IDR3			0xC
+#define ARM_SMMU_IDR4			0x10
+#define ARM_SMMU_IDR5			0x14
+
+#define ARM_SMMU_CR0			0x20
+#define CR0_CMDQEN			(1 << 3)
+#define CR0_EVTQEN			(1 << 2)
+#define CR0_SMMUEN			(1 << 0)
+
+#define ARM_SMMU_CR0ACK			0x24
+
+#define ARM_SMMU_CR1			0x28
+#define CR1_TABLE_SH			BIT_MASK(11, 10)
+#define CR1_TABLE_OC			BIT_MASK(9, 8)
+#define CR1_TABLE_IC			BIT_MASK(7, 6)
+#define CR1_QUEUE_SH			BIT_MASK(5, 4)
+#define CR1_QUEUE_OC			BIT_MASK(3, 2)
+#define CR1_QUEUE_IC			BIT_MASK(1, 0)
+/* CR1 cacheability fields don't quite follow the usual TCR-style encoding */
+#define CR1_CACHE_NC			0
+#define CR1_CACHE_WB			1
+#define CR1_CACHE_WT			2
+
+#define ARM_SMMU_CR2			0x2c
+#define CR2_PTM				(1 << 2)
+#define CR2_RECINVSID			(1 << 1)
+#define CR2_E2H				(1 << 0)
+
+#define ARM_SMMU_STRTAB_BASE		0x80
+#define STRTAB_BASE_RA			(1UL << 62)
+#define STRTAB_BASE_ADDR_MASK		BIT_MASK(51, 6)
+
+#define ARM_SMMU_STRTAB_BASE_CFG	0x88
+#define STRTAB_BASE_CFG_FMT		BIT_MASK(17, 16)
+#define STRTAB_BASE_CFG_FMT_LINEAR	0
+#define STRTAB_BASE_CFG_FMT_2LVL	1
+#define STRTAB_BASE_CFG_SPLIT		BIT_MASK(10, 6)
+#define STRTAB_BASE_CFG_LOG2SIZE	BIT_MASK(5, 0)
+
+#define ARM_SMMU_CMDQ_BASE		0x90
+#define ARM_SMMU_CMDQ_PROD		0x98
+#define ARM_SMMU_CMDQ_CONS		0x9c
+
+#define ARM_SMMU_EVTQ_BASE		0xa0
+#define ARM_SMMU_EVTQ_PROD		0x100a8
+#define ARM_SMMU_EVTQ_CONS		0x100ac
+#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
+#define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
+#define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
+
+#define ARM_SMMU_GERROR			0x60
+#define GERROR_CMDQ_ERR			(1 << 0)
+
+#define ARM_SMMU_GERRORN		0x64
+#define ARM_SMMU_IRQ_CTRL		0x50
+#define ARM_SMMU_IRQ_CTRLACK		0x54
+#define ARM_SMMU_GERROR_IRQ_CFG0	0x68
+#define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
+
+/* Common memory attribute values */
+#define ARM_SMMU_SH_NSH			0
+#define ARM_SMMU_SH_OSH			2
+#define ARM_SMMU_SH_ISH			3
+#define ARM_SMMU_MEMATTR_DEVICE_nGnRE	0x1
+#define ARM_SMMU_MEMATTR_OIWB		0xf
+
+#define Q_IDX(reg, shift)		((reg) & ((1 << (shift)) - 1))
+#define Q_WRP(reg, shift)		((reg) & (1 << (shift)))
+#define Q_OVERFLOW_FLAG			(1 << 31)
+#define Q_OVF(reg)			((reg) & Q_OVERFLOW_FLAG)
+#define Q_EMPTY(prod, cons, shift)	\
+			(Q_IDX((prod), (shift)) == Q_IDX((cons), (shift)) && \
+			 Q_WRP((prod), (shift)) == Q_WRP((cons), (shift)))
+#define Q_FULL(prod, cons, shift)	\
+			(Q_IDX((prod), (shift)) == Q_IDX((cons), (shift)) && \
+			 Q_WRP((prod), (shift)) != Q_WRP((cons), (shift)))
+
+#define Q_BASE_RWA			(1UL << 62)
+#define Q_BASE_ADDR_MASK		BIT_MASK(51, 5)
+#define Q_BASE_LOG2SIZE			BIT_MASK(4, 0)
+
+/*
+ * Stream table.
+ *
+ * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
+ * 2lvl: 128k L1 entries,
+ *       256 lazy entries per table (each table covers a PCI bus)
+ */
+#define STRTAB_L1_SZ_SHIFT		20
+#define STRTAB_SPLIT			8
+
+#define STRTAB_L1_DESC_DWORDS		1
+#define STRTAB_L1_DESC_SIZE		(STRTAB_L1_DESC_DWORDS << 3)
+#define STRTAB_L1_DESC_SPAN		BIT_MASK(4, 0)
+#define STRTAB_L1_DESC_L2PTR_MASK	BIT_MASK(51, 6)
+
+#define STRTAB_STE_DWORDS		8
+#define STRTAB_STE_DWORDS_BITS		3
+#define STRTAB_STE_SIZE			(STRTAB_STE_DWORDS << 3)
+#define STRTAB_STE_0_V			(1UL << 0)
+#define STRTAB_STE_0_CFG		BIT_MASK(3, 1)
+#define STRTAB_STE_0_CFG_ABORT		0
+#define STRTAB_STE_0_CFG_BYPASS		4
+#define STRTAB_STE_0_CFG_S1_TRANS	5
+#define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_S1CTXPTR		BIT_MASK(51, 6)
+#define STRTAB_STE_0_S1CDMAX		BIT_MASK(63, 59)
+#define STRTAB_STE_1_S1DSS		BIT_MASK(1, 0)
+#define STRTAB_STE_1_S1CIR		BIT_MASK(3, 2)
+#define STRTAB_STE_1_S1COR		BIT_MASK(5, 4)
+#define STRTAB_STE_1_S1CSH		BIT_MASK(7, 6)
+#define STRTAB_STE_1_S1STALLD		(1UL << 27)
+#define STRTAB_CTXDESC_DWORDS		8
+#define STRTAB_CTXDESC_S1CTXPTR_SHIFT	6
+
+#define STRTAB_STE_1_SHCFG		BIT_MASK(45, 44)
+#define STRTAB_STE_1_SHCFG_INCOMING	1UL
+
+#define STRTAB_STE_2_S2VMID		BIT_MASK(15, 0)
+#define STRTAB_STE_2_VTCR		BIT_MASK(50, 32)
+#define STRTAB_STE_2_S2AA64		(1UL << 51)
+#define STRTAB_STE_2_S2ENDI		(1UL << 52)
+#define STRTAB_STE_2_S2PTW		(1UL << 54)
+#define STRTAB_STE_2_S2R		(1UL << 58)
+
+#define STRTAB_STE_3_S2TTB_MASK		BIT_MASK(51, 4)
+
+#define CTXDESC_1_TTB0			BIT_MASK(51, 4)
+#define CTXDESC_2_TTB1			BIT_MASK(51, 4)
+#define CTXDESC_TTB0_SHIFT		4
+#define CTXDESC_TTB1_SHIFT		4
+
+/* Command queue */
+#define CMDQ_ENT_DWORDS			2
+#define CMDQ_ENT_SIZE			(CMDQ_ENT_DWORDS << 3)
+#define CMDQ_MAX_SZ_SHIFT		8
+
+#define CMDQ_CONS_ERR			BIT_MASK(30, 24)
+#define CMDQ_ERR_CERROR_NONE_IDX	0
+#define CMDQ_ERR_CERROR_ILL_IDX		1
+#define CMDQ_ERR_CERROR_ABT_IDX		2
+
+#define CMDQ_0_OP			BIT_MASK(7, 0)
+#define CMDQ_0_SSV			(1UL << 11)
+
+#define CMDQ_PREFETCH_0_SSID		BIT_MASK(31, 12)
+#define CMDQ_PREFETCH_0_SID		BIT_MASK(63, 32)
+#define CMDQ_PREFETCH_1_SIZE		BIT_MASK(4, 0)
+#define CMDQ_PREFETCH_1_ADDR_MASK	BIT_MASK(63, 12)
+
+#define CMDQ_CFGI_0_SID			BIT_MASK(63, 32)
+#define CMDQ_CFGI_1_LEAF		(1UL << 0)
+#define CMDQ_CFGI_1_RANGE		BIT_MASK(4, 0)
+
+#define CMDQ_TLBI_0_VMID		BIT_MASK(47, 32)
+#define CMDQ_TLBI_0_ASID		BIT_MASK(63, 48)
+#define CMDQ_TLBI_1_LEAF		(1UL << 0)
+#define CMDQ_TLBI_1_VA_MASK		BIT_MASK(63, 12)
+#define CMDQ_TLBI_1_IPA_MASK		BIT_MASK(51, 12)
+
+#define CMDQ_PRI_0_SSID			BIT_MASK(31, 12)
+#define CMDQ_PRI_0_SID			BIT_MASK(63, 32)
+#define CMDQ_PRI_1_GRPID		BIT_MASK(8, 0)
+#define CMDQ_PRI_1_RESP			BIT_MASK(13, 12)
+
+#define CMDQ_SYNC_0_CS			BIT_MASK(13, 12)
+#define CMDQ_SYNC_0_CS_NONE		0
+#define CMDQ_SYNC_0_CS_IRQ		1
+#define CMDQ_SYNC_0_CS_SEV		2
+#define CMDQ_SYNC_0_MSH			BIT_MASK(23, 22)
+#define CMDQ_SYNC_0_MSIATTR		BIT_MASK(27, 24)
+#define CMDQ_SYNC_0_MSIDATA		BIT_MASK(63, 32)
+#define CMDQ_SYNC_1_MSIADDR_MASK	BIT_MASK(51, 2)
+
+/* Event queue */
+#define EVTQ_ENT_DWORDS			4
+#define EVTQ_MAX_SZ_SHIFT		7
+
+#define EVTQ_0_ID			BIT_MASK(7, 0)
+
+#define ARM_SMMU_SYNC_TIMEOUT		1000000
+
+#define FIELD_PREP(mask, val)	\
+			(((u64)(val) << (__builtin_ffsl((mask)) - 1)) & (mask))
+#define FIELD_GET(mask, reg)	\
+			(((reg) & (mask)) >> (__builtin_ffsl((mask)) - 1))
+#define FIELD_CLEAR(mask, reg)	\
+			((reg) & (~(mask)))
+
+#define CMDQ_OP_PREFETCH_CFG	0x1
+#define CMDQ_OP_PREFETCH_ADDR	0x2
+#define CMDQ_OP_CFGI_STE	0x3
+#define CMDQ_OP_CFGI_ALL	0x4
+#define CMDQ_OP_TLBI_NH_ASID	0x11
+#define CMDQ_OP_TLBI_NH_VA	0x12
+#define CMDQ_OP_TLBI_EL2_ALL	0x20
+#define CMDQ_OP_TLBI_S12_VMALL	0x28
+#define CMDQ_OP_TLBI_S2_IPA	0x2a
+#define CMDQ_OP_TLBI_NSNH_ALL	0x30
+#define CMDQ_OP_CMD_SYNC	0x46
+#define ARM_SMMU_FEAT_2_LVL_STRTAB	(1 << 0)
+
+/* High-level queue structures */
+struct arm_smmu_cmdq_ent {
+	/* Common fields */
+	u8				opcode;
+	bool				substream_valid;
+
+	/* Command-specific fields */
+	union {
+		struct {
+			u32			sid;
+			u8			size;
+			u64			addr;
+		} prefetch;
+
+		struct {
+			u32			sid;
+			union {
+				bool		leaf;
+				u8		span;
+			};
+		} cfgi;
+
+		struct {
+			u16			asid;
+			u16			vmid;
+			bool			leaf;
+			u64			addr;
+		} tlbi;
+
+		struct {
+			u32			msidata;
+			u64			msiaddr;
+		} sync;
+	};
+};
+
+struct arm_smmu_queue {
+	u64	*base;
+	u64	base_dma;
+	u64	q_base;
+	u64	ent_dwords;
+	u32	max_n_shift;
+	u32	prod;
+	u32	cons;
+	u32 	*prod_reg;
+	u32 	*cons_reg;
+};
+
+struct arm_smmu_cmdq {
+	struct arm_smmu_queue		q;
+	spinlock_t			lock;
+};
+
+struct arm_smmu_evtq {
+	struct arm_smmu_queue		q;
+};
+
+/* High-level stream table structures */
+struct arm_smmu_strtab_l1_desc {
+	u8	span;
+	__u64	*l2ptr;
+	u64	l2ptr_dma;
+	u32	active_stes;
+};
+
+struct arm_smmu_strtab_cfg {
+	__u64				*strtab;
+	u64				strtab_dma;
+	struct arm_smmu_strtab_l1_desc	*l1_desc;
+	unsigned int			num_l1_ents;
+	u64				strtab_base;
+	u32				strtab_base_cfg;
+};
+
+/* An SMMUv3 instance */
+struct arm_smmu_device {
+	void				*base;
+	u32				features;
+	struct arm_smmu_cmdq		cmdq;
+	struct arm_smmu_evtq		evtq;
+	unsigned int			sid_bits;
+	struct arm_smmu_strtab_cfg	strtab_cfg;
+} smmu[JAILHOUSE_MAX_IOMMU_UNITS];
+
+/* Low-level queue manipulation functions */
+static bool queue_full(struct arm_smmu_queue *q)
+{
+	u32 shift = q->max_n_shift;
+
+	return Q_FULL(q->prod, q->cons, shift);
+}
+
+static bool queue_empty(struct arm_smmu_queue *q)
+{
+	u32 shift = q->max_n_shift;
+
+	return Q_EMPTY(q->prod, q->cons, shift);
+}
+
+static void queue_sync_cons(struct arm_smmu_queue *q)
+{
+	q->cons = mmio_read32(q->cons_reg);
+}
+
+static bool queue_error(struct arm_smmu_queue *q)
+{
+	return mmio_read32(q->cons_reg) & 0x1;
+}
+
+static void queue_inc_prod(struct arm_smmu_queue *q)
+{
+	u32 shift = q->max_n_shift;
+	u32 prod = (Q_WRP(q->prod, shift) | Q_IDX(q->prod, shift)) + 1;
+
+	q->prod = Q_OVF(q->prod) | Q_WRP(prod, shift) | Q_IDX(prod, shift);
+	mmio_write32(q->prod_reg, q->prod);
+}
+
+static void queue_write(__u64 *dst, __u64 *src, u32 n_dwords)
+{
+	int i;
+
+	for (i = 0; i < n_dwords; ++i)
+		*dst++ = *src++;
+	dsb(ish);
+}
+
+static __u64 *queue_entry(struct arm_smmu_queue *q)
+{
+	return q->base + (Q_IDX(q->prod, q->max_n_shift) * q->ent_dwords);
+}
+
+static int queue_insert_raw(struct arm_smmu_queue *q, __u64 *ent)
+{
+	while (queue_full(q))
+	{}
+
+	queue_write(queue_entry(q), ent, q->ent_dwords);
+	queue_inc_prod(q);
+	while (!queue_empty(q) && !queue_error(q)) {
+		queue_sync_cons(q);
+	}
+	return 0;
+}
+
+/* High-level queue accessors */
+static int arm_smmu_cmdq_build_cmd(__u64 *cmd, struct arm_smmu_cmdq_ent *ent)
+{
+	u64 vmid = (u64)this_cell()->config->id;
+	memset(cmd, 0, CMDQ_ENT_SIZE);
+	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
+
+	switch (ent->opcode) {
+	case CMDQ_OP_TLBI_EL2_ALL:
+	case CMDQ_OP_TLBI_NSNH_ALL:
+		break;
+	case CMDQ_OP_PREFETCH_ADDR:
+		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
+		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
+		/* Fallthrough */
+	case CMDQ_OP_PREFETCH_CFG:
+		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
+		break;
+	case CMDQ_OP_CFGI_STE:
+		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
+		break;
+	case CMDQ_OP_CFGI_ALL:
+		/* Cover the entire SID range */
+		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
+		break;
+	case CMDQ_OP_TLBI_NH_VA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
+		break;
+	case CMDQ_OP_TLBI_S2_IPA:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
+		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
+		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
+		break;
+	case CMDQ_OP_TLBI_NH_ASID:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
+		/* Fallthrough */
+	case CMDQ_OP_TLBI_S12_VMALL:
+		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		if (ent->sync.msiaddr)
+			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
+		else
+			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
+		/*
+		 * Commands are written little-endian, but we want the SMMU to
+		 * receive MSIData, and thus write it back to memory, in CPU
+		 * byte order, so big-endian needs an extra byteswap here.
+		 */
+		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA, ent->sync.msidata);
+		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, __u64 *cmd)
+{
+	struct arm_smmu_queue *q = &smmu->cmdq.q;
+
+	queue_insert_raw(q, cmd);
+}
+
+static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
+				    struct arm_smmu_cmdq_ent *ent)
+{
+	u64 cmd[CMDQ_ENT_DWORDS];
+
+	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
+		printk("WARN: SMMU ignoring unknown CMDQ opcode 0x%x\n",
+			 ent->opcode);
+		return;
+	}
+
+	spin_lock(&smmu->cmdq.lock);
+	arm_smmu_cmdq_insert_cmd(smmu, cmd);
+	spin_unlock(&smmu->cmdq.lock);
+}
+
+static void arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_cmdq_ent ent = { .opcode = CMDQ_OP_CMD_SYNC };
+	u64 cmd[CMDQ_ENT_DWORDS];
+
+	arm_smmu_cmdq_build_cmd(cmd, &ent);
+
+	spin_lock(&smmu->cmdq.lock);
+	arm_smmu_cmdq_insert_cmd(smmu, cmd);
+	spin_unlock(&smmu->cmdq.lock);
+}
+
+/* Stream table manipulation functions */
+static void
+arm_smmu_write_strtab_l1_desc(__u64 *dst, struct arm_smmu_strtab_l1_desc *desc)
+{
+	u64 val = 0;
+
+	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, desc->span);
+	val |= desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
+
+	/* Assuming running on Little endian cpu */
+	*dst = val;
+	dsb(ish);
+}
+
+static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode	= CMDQ_OP_CFGI_STE,
+		.cfgi	= {
+			.sid	= sid,
+			.leaf	= true,
+		},
+	};
+
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+	arm_smmu_cmdq_issue_sync(smmu);
+}
+
+static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
+				      __u64 *guest_ste, __u64 *dst,
+				      bool bypass, u32 vmid)
+{
+	struct paging_structures *pg_structs = &this_cell()->arch.mm;
+	u64 val = dst[0], vttbr, mask;
+
+	/* Bypass */
+	if (bypass) {
+		dst[0] = STRTAB_STE_0_V;
+		dsb(ish);
+		val = FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
+		dst[0] = val;
+		dst[1] = FIELD_PREP(STRTAB_STE_1_SHCFG,
+				    STRTAB_STE_1_SHCFG_INCOMING);
+		dst[2] = vmid;
+		dsb(ish);
+		if (smmu) {
+			arm_smmu_sync_ste_for_sid(smmu, sid);
+		}
+		return;
+	}
+
+	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
+		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
+		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
+		 STRTAB_STE_2_S2R;
+
+	vttbr = paging_hvirt2phys(pg_structs->root_table);
+	dst[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
+
+	dst[0] |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	dst[0] |= STRTAB_STE_0_V;
+	dsb(ish);
+
+	arm_smmu_sync_ste_for_sid(smmu, sid);
+}
+
+static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
+{
+	unsigned int i;
+
+	for (i = 0; i < nent; ++i) {
+		arm_smmu_write_strtab_ent(NULL, -1, NULL, strtab, true,
+					  (u32)this_cell()->config->id);
+		strtab += STRTAB_STE_DWORDS;
+	}
+}
+
+static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
+{
+	void *strtab;
+	u64 reg;
+	u32 size;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	size = (1 << smmu->sid_bits) * STRTAB_STE_SIZE;
+	strtab = page_alloc_aligned(&mem_pool, PAGES(size));
+	if (!strtab) {
+		printk("ERROR: SMMU failed to allocate l1 stream table (%u bytes)\n",
+		       size);
+		return -ENOMEM;
+	}
+	cfg->strtab_dma = paging_hvirt2phys(strtab);
+	cfg->strtab = strtab;
+	cfg->num_l1_ents = 1 << smmu->sid_bits;
+
+	/* Configure strtab_base_cfg for a linear table covering all SIDs */
+	reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_LINEAR);
+	reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
+	cfg->strtab_base_cfg = reg;
+
+	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
+	return 0;
+}
+
+static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
+	void *strtab = smmu->strtab_cfg.strtab;
+	unsigned int i;
+
+	cfg->l1_desc = page_alloc(&mem_pool, PAGES(size));
+	if (!cfg->l1_desc) {
+		printk("ERROR: SMMU failed to allocate l1 stream table desc\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < cfg->num_l1_ents; ++i) {
+		memset(&cfg->l1_desc[i], 0, sizeof(*cfg->l1_desc));
+		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[i]);
+		cfg->l1_desc[i].active_stes = 0;
+		strtab += STRTAB_L1_DESC_SIZE;
+	}
+
+	return 0;
+}
+
+static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	u32 size, l1size;
+	void *strtab;
+	u64 reg;
+	int ret;
+
+	/* Calculate the L1 size, capped to the SIDSIZE. */
+	size = STRTAB_L1_SZ_SHIFT - 3;
+	size = MIN(size, smmu->sid_bits - STRTAB_SPLIT);
+	cfg->num_l1_ents = 1 << size;
+
+	size += STRTAB_SPLIT;
+	if (size < smmu->sid_bits)
+		printk("WARN: SMMU 2-level strtab only covers %u/%u bits of SID\n",
+		       size, smmu->sid_bits);
+
+	l1size = cfg->num_l1_ents * STRTAB_L1_DESC_SIZE;
+	strtab = page_alloc_aligned(&mem_pool, PAGES(l1size));
+	if (!strtab) {
+		printk("ERROR: SMMU failed to allocate l1 stream table (%u bytes)\n",
+		       size);
+		return -ENOMEM;
+	}
+	cfg->strtab_dma = paging_hvirt2phys(strtab);
+	cfg->strtab = strtab;
+
+	/* Configure strtab_base_cfg for 2 levels */
+	reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_2LVL);
+	reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, size);
+	reg |= FIELD_PREP(STRTAB_BASE_CFG_SPLIT, STRTAB_SPLIT);
+	cfg->strtab_base_cfg = reg;
+
+	ret = arm_smmu_init_l1_strtab(smmu);
+
+	if (ret) {
+		page_free(&mem_pool, strtab, PAGES(l1size));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
+{
+	u64 reg;
+	int ret;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+		ret = arm_smmu_init_strtab_2lvl(smmu);
+	else
+		ret = arm_smmu_init_strtab_linear(smmu);
+
+	if (ret)
+		return ret;
+
+	/* Set the strtab base address */
+	reg  = smmu->strtab_cfg.strtab_dma & STRTAB_BASE_ADDR_MASK;
+	reg |= STRTAB_BASE_RA;
+	smmu->strtab_cfg.strtab_base = reg;
+
+	return 0;
+}
+
+static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+				   struct arm_smmu_queue *q,
+				   unsigned long prod_off,
+				   unsigned long cons_off,
+				   unsigned long dwords)
+{
+	/* Queue size is capped to 4K. So allocate 1 page */
+	q->base = page_alloc(&mem_pool, 1);
+	if (!q->base) {
+		printk("ERROR: SMMU failed to allocate queue\n");
+		return -ENOMEM;
+	}
+	q->base_dma = paging_hvirt2phys(q->base);;
+
+	q->prod_reg	= smmu->base + prod_off;
+	q->cons_reg	= smmu->base + cons_off;
+	q->ent_dwords	= dwords;
+
+	q->q_base  = Q_BASE_RWA;
+	q->q_base |= q->base_dma & Q_BASE_ADDR_MASK;
+	q->q_base |= FIELD_PREP(Q_BASE_LOG2SIZE, q->max_n_shift);
+
+	q->prod = q->cons = 0;
+	return 0;
+}
+
+static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	/* cmdq */
+	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, ARM_SMMU_CMDQ_PROD,
+				      ARM_SMMU_CMDQ_CONS, CMDQ_ENT_DWORDS);
+	if (ret)
+		return ret;
+
+	/* evtq */
+	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, ARM_SMMU_EVTQ_PROD,
+				      ARM_SMMU_EVTQ_CONS, EVTQ_ENT_DWORDS);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	ret = arm_smmu_init_queues(smmu);
+	if (ret)
+		return ret;
+
+	return arm_smmu_init_strtab(smmu);
+}
+
+static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
+				   unsigned int reg_off, unsigned int ack_off)
+{
+	u32 i, timeout = ARM_SMMU_SYNC_TIMEOUT;
+
+	mmio_write32(smmu->base + reg_off, val);
+	for (i = 0; i < timeout; i++) {
+		if (mmio_read32(smmu->base + ack_off) == val)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
+{
+	int ret;
+
+	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
+	if (ret)
+		printk("ERROR: SMMU failed to clear cr0\n");
+
+	return ret;
+}
+
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 reg, enables;
+	struct arm_smmu_cmdq_ent cmd;
+
+	/* Clear CR0 and sync (disables SMMU and queue processing) */
+	reg = mmio_read32(smmu->base + ARM_SMMU_CR0);
+	if (reg & CR0_SMMUEN)
+		printk("ERROR: SMMU currently enabled! Resetting...\n");
+
+	ret = arm_smmu_device_disable(smmu);
+	if (ret)
+		return ret;
+
+	/* CR1 (table and queue memory attributes) */
+	reg = FIELD_PREP(CR1_TABLE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_TABLE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_TABLE_IC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_SH, ARM_SMMU_SH_ISH) |
+	      FIELD_PREP(CR1_QUEUE_OC, CR1_CACHE_WB) |
+	      FIELD_PREP(CR1_QUEUE_IC, CR1_CACHE_WB);
+	mmio_write32(smmu->base + ARM_SMMU_CR1, reg);
+
+	/* Stream table */
+	mmio_write64(smmu->base + ARM_SMMU_STRTAB_BASE,
+		     smmu->strtab_cfg.strtab_base);
+	mmio_write32(smmu->base + ARM_SMMU_STRTAB_BASE_CFG,
+		     smmu->strtab_cfg.strtab_base_cfg);
+
+	/* Command queue */
+	mmio_write64(smmu->base + ARM_SMMU_CMDQ_BASE, smmu->cmdq.q.q_base);
+	mmio_write32(smmu->base + ARM_SMMU_CMDQ_PROD, smmu->cmdq.q.prod);
+	mmio_write32(smmu->base + ARM_SMMU_CMDQ_CONS, smmu->cmdq.q.cons);
+
+	enables = CR0_CMDQEN;
+	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+				      ARM_SMMU_CR0ACK);
+	if (ret) {
+		printk("ERROR: SMMU failed to enable command queue\n");
+		return ret;
+	}
+
+	/* Invalidate any cached configuration */
+	cmd.opcode = CMDQ_OP_CFGI_ALL;
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+	arm_smmu_cmdq_issue_sync(smmu);
+
+	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+
+	/* Invalidate any stale TLB entries */
+	cmd.opcode = CMDQ_OP_TLBI_EL2_ALL;
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+	arm_smmu_cmdq_issue_sync(smmu);
+
+	/* Event queue */
+	mmio_write64(smmu->base + ARM_SMMU_EVTQ_BASE, smmu->evtq.q.q_base);
+	mmio_write32(smmu->base + ARM_SMMU_EVTQ_PROD, smmu->evtq.q.prod);
+	mmio_write32(smmu->base + ARM_SMMU_EVTQ_CONS, smmu->evtq.q.cons);
+
+	enables |= CR0_EVTQEN;
+	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+				      ARM_SMMU_CR0ACK);
+	if (ret) {
+		printk("ERROR: SMMU failed to enable event queue\n");
+		return ret;
+	}
+
+	/* ToDo: Add support for PRI queue and IRQs  */
+
+	enables |= CR0_SMMUEN;
+	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+				      ARM_SMMU_CR0ACK);
+	if (ret) {
+		printk("ERROR: SMMU failed to enable SMMU interface\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int arm_smmu_device_init_features(struct arm_smmu_device *smmu)
+{
+	u32 reg;
+
+	/* IDR0 */
+	reg = mmio_read32(smmu->base + ARM_SMMU_IDR0);
+
+	smmu->features = 0;
+	/* 2-level structures */
+	if (FIELD_GET(IDR0_ST_LVL, reg) == IDR0_ST_LVL_2LVL)
+		smmu->features |= ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	if (!(reg & IDR0_S2P)) {
+		printk("ERROR: SMMU stage2 translations not supported\n");
+		return -ENXIO;
+	}
+
+	if (FIELD_GET(IDR0_S1P, reg)) {
+		smmu->features |= IDR0_S1P;
+	}
+
+	/* IDR1 */
+	reg = mmio_read32(smmu->base + ARM_SMMU_IDR1);
+	if (reg & (IDR1_TABLES_PRESET | IDR1_QUEUES_PRESET | IDR1_REL)) {
+		printk("ERROR: SMMU embedded implementation not supported\n");
+		return -ENXIO;
+	}
+
+	/* Queue sizes, capped at 4k */
+	smmu->cmdq.q.max_n_shift = MIN(CMDQ_MAX_SZ_SHIFT,
+				       FIELD_GET(IDR1_CMDQS, reg));
+	if (!smmu->cmdq.q.max_n_shift) {
+		printk("ERROR: SMMU unit-length command queue not supported\n");
+		return -ENXIO;
+	}
+	smmu->evtq.q.max_n_shift = MIN(EVTQ_MAX_SZ_SHIFT,
+				       FIELD_GET(IDR1_EVTQS, reg));
+
+	/* SID sizes */
+	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
+
+	/*
+	 * If the SMMU supports fewer bits than would fill a single L2 stream
+	 * table, use a linear table instead.
+	 */
+	if (smmu->sid_bits <= STRTAB_SPLIT)
+		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
+
+	return 0;
+}
+
+static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_strtab_l1_desc *desc;
+	void *strtab;
+	u32 size;
+
+	desc = &cfg->l1_desc[sid >> STRTAB_SPLIT];
+	if (desc->l2ptr) {
+		desc->active_stes++;
+		return 0;
+	}
+
+	size = 1 << (STRTAB_SPLIT + STRTAB_STE_DWORDS_BITS + 3);
+	strtab = &cfg->strtab[(sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS];
+
+	desc->span = STRTAB_SPLIT + 1;
+	desc->l2ptr = page_alloc_aligned(&mem_pool, PAGES(size));
+	if (!desc->l2ptr) {
+		printk("ERROR: SMMU failed to allocate l2 stream table (%u bytes)\n",
+		       size);
+		return -ENOMEM;
+	}
+	desc->l2ptr_dma = paging_hvirt2phys(desc->l2ptr);
+	desc->active_stes = 1;
+	arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
+	arm_smmu_write_strtab_l1_desc(strtab, desc);
+
+	return 0;
+}
+
+static void arm_smmu_uninit_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+	struct arm_smmu_strtab_l1_desc *desc;
+	void *strtab;
+	u32 size;
+
+	desc = &cfg->l1_desc[sid >> STRTAB_SPLIT];
+
+	desc->active_stes--;
+	if (desc->active_stes)
+		return;
+
+	size = 1 << (STRTAB_SPLIT + STRTAB_STE_DWORDS_BITS + 3);
+	page_free(&mem_pool, desc->l2ptr, PAGES(size));
+	desc->l2ptr = NULL;
+	desc->l2ptr_dma = 0;
+	desc->span = 0;
+	strtab = &cfg->strtab[(sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS];
+	arm_smmu_write_strtab_l1_desc(strtab, desc);
+
+	return;
+}
+
+static __u64 *arm_smmu_get_step_for_sid(struct arm_smmu_device *smmu, u32 sid)
+{
+	__u64 *step;
+	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+		struct arm_smmu_strtab_l1_desc *l1_desc;
+		int idx;
+
+		/* Two-level walk */
+		idx = (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
+		l1_desc = &cfg->l1_desc[idx];
+		idx = (sid & ((1 << STRTAB_SPLIT) - 1)) * STRTAB_STE_DWORDS;
+		step = &l1_desc->l2ptr[idx];
+	} else {
+		/* Simple linear lookup */
+		step = &cfg->strtab[sid * STRTAB_STE_DWORDS];
+	}
+
+	return step;
+}
+
+static int arm_smmu_init_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
+{
+	__u64 *step;
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+		arm_smmu_init_l2_strtab(smmu, sid);
+
+	step = arm_smmu_get_step_for_sid(smmu, sid);
+	arm_smmu_write_strtab_ent(smmu, sid, NULL, step, false, vmid);
+
+	return 0;
+}
+
+static void arm_smmu_uninit_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
+{
+	__u64 *step;
+
+	step = arm_smmu_get_step_for_sid(smmu, sid);
+	arm_smmu_write_strtab_ent(smmu, sid, NULL, step, true, vmid);
+
+	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
+		arm_smmu_uninit_l2_strtab(smmu, sid);
+}
+
+static int arm_smmuv3_cell_init(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	struct arm_smmu_cmdq_ent cmd;
+	int ret, i, j, sid;
+
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+		iommu = &system_config->platform_info.arm.iommu_units[i];
+		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
+			continue;
+
+		for_each_stream_id(sid, cell->config, j) {
+			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
+			if (ret) {
+				printk("ERROR: SMMU INIT ste failed: sid = %d\n",
+				       sid);
+				return ret;
+			}
+		}
+	}
+
+	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
+	cmd.tlbi.vmid	= cell->config->id;
+	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+	arm_smmu_cmdq_issue_sync(smmu);
+
+	return 0;
+}
+
+static void arm_smmuv3_cell_exit(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	int i, sid;
+
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+		iommu = &system_config->platform_info.arm.iommu_units[i];
+		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
+			continue;
+
+		for_each_stream_id(sid, cell->config, i) {
+			arm_smmu_uninit_ste(&smmu[i], sid, cell->config->id);
+		}
+	}
+
+}
+
+static int arm_smmuv3_init(void)
+{
+	struct jailhouse_iommu *iommu;
+	int ret, i;
+
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+		iommu = &system_config->platform_info.arm.iommu_units[i];
+		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
+			continue;
+
+		smmu[i].base = paging_map_device(iommu->base, iommu->size);
+
+		/* ToDo: irq allocation*/
+
+		ret = arm_smmu_device_init_features(&smmu[i]);
+		if (ret)
+			return ret;
+
+		ret = arm_smmu_init_structures(&smmu[i]);
+		if (ret)
+			return ret;
+
+		/* Reset the device */
+		ret = arm_smmu_device_reset(&smmu[i]);
+		if (ret)
+			return ret;
+	}
+
+	return arm_smmuv3_cell_init(&root_cell);
+}
+
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmuv3);
+DEFINE_UNIT_SHUTDOWN_STUB(arm_smmuv3);
+DEFINE_UNIT(arm_smmuv3, "ARM SMMU v3");
diff --git a/hypervisor/include/jailhouse/entry.h b/hypervisor/include/jailhouse/entry.h
index 26360a6e..da1c9da2 100644
--- a/hypervisor/include/jailhouse/entry.h
+++ b/hypervisor/include/jailhouse/entry.h
@@ -21,6 +21,7 @@
 #define EPERM		1
 #define ENOENT		2
 #define EIO		5
+#define ENXIO		6
 #define E2BIG		7
 #define ENOMEM		12
 #define EBUSY		16
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-6-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
