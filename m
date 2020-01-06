Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3WLZTYAKGQEPAMI5BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2771311EC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:58 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id c6sf17684319wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313198; cv=pass;
        d=google.com; s=arc-20160816;
        b=ARVvUf9bsAHhTZaooST5PqTBjmuWCY5qddL2dkuprC5Hrnp95M3a+Ep1MECQ71VEzo
         zukdo5L9B3ZOiWZepATeByUacxCmDFG8iQIHBhOS5VR5pn7RMjqYJrVtRDpPECWuzKxe
         aB/xSKH9Y1kgkwu3K8HWOVaiOXquCXv9tqhz+dku9qc3ZJGcxWqGFIcTdaZdvMipVzUt
         NSJ5q6E8X0XNMFSK6Is5v5/CFrPdmMS2uMeUIzaTNiTvzKXKsOHzz5sfl6CxpeQpfVgf
         s8AgFz2lzSY2xlaGvUGeCAG5uagv1EcPfBIYisApZGARY1PEgYPVmzmbBnAlLrZ+k3Wy
         maEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5t/W1/o11IQ4u2T9P93G5BTFWodgsxGWCPv2f+zTZX0=;
        b=ux2ZONHkdwfYYA8pC3UWKSZreAvKbRCANGoGO4bZQyZPyvTdupWYqwTkDxjwHKBxDY
         fvUw2fnCUBcfvwkr55cxmouo2/N0ygnrRpjRz9vpqJrOxVm7sUxpjXIrzmnxVROShN6O
         J0yoNq9xpH78F0Bxua/iz377lBTy+ocmuTrAld3LR9cSfcrR4iTjy6uM0Gn2qfgOgV+l
         TbuIhuvvuiU360m/jZKCe8easihgFk8dgCvH6qb3aNWvWEQ0Fxp4vKq8b6GVcekb4/Q2
         cU6sskMUaOwPRMdCkcDtohdHLZW6oHg3v5nvKgb4Ud1wqUPD92xgPTw6bX8eM73kuZ8Y
         py/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5t/W1/o11IQ4u2T9P93G5BTFWodgsxGWCPv2f+zTZX0=;
        b=sszDdrRgQUC31/229P1A3iAZ86K0Jw602UbhY/EePNA5596hiO4PCTSYUiGAJs68YW
         E/tGkD2hyt70ur7STN8GXC+1Cu+qgT6WB2VQlUqcK8/0LyYLOhoXVTUvYN06KfKZ6p9j
         IKKZ3KODBp5EnM7n9opnBHB5zQAVrKLwDgo/5p8QREg8qx4UidmiVGRsv3zdrU9xzQsr
         V3hF4JhhFgieqYZ0CkWde07bgw2pwEpCctSb+JqhQLkErTxkQVOWlAQTsCv5HkzEKp42
         DjJLAtXj0NrK3gecVClh2JSEbtxKj6oBAqFEj3PV2lPVeIo7QXmPwOPGhfbjuNCNoWn5
         o/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5t/W1/o11IQ4u2T9P93G5BTFWodgsxGWCPv2f+zTZX0=;
        b=ikvBcpjl4C2k0OG19IELp12pWYYJ9ReTPuqPPLPcsyUou7bGLs/dmXmlo1ZqcSErYG
         dSbST5D0tKnwP45NKwpZS3gjDu1ZexEwNFj0EDr4qFwZ1RqXZsU/A3lf0bS+Gf3a5l+L
         ngmgNg22+1pLxhKkVWDzwiINz4hhlxC7+DmZGzvFSxHQHa9M/zREglSHIYhp37l5GaSi
         VVtga+aIel5PlnxRhJvn2uXtk/SNLk+To9Fti7WiAOCYFDrJQTIR4Ww+Yk3cnUwITn7r
         qfJluqq8AzG//EVzyFH/3pvOw0gvVsqsnfI8MenIQRApztPIYXXxiRoFlW5TtkhYL1Qp
         P6IA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVHT/QFZnUbWQEO8A0gjOZ9u7VCrs/qxqkTp+WbBH3SY4pthTNS
	bEJa75g4leJcWbSlEGgQbmM=
X-Google-Smtp-Source: APXvYqxVieVUBdvVfSdfgRTSJN+cFyo8F/ze1vy+RTnylcAWSBsoYWevNTF9v2e1Aso1m7sTPZ2oEA==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr34096888wme.82.1578313198523;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls12876794wrw.4.gmail; Mon, 06
 Jan 2020 04:19:57 -0800 (PST)
X-Received: by 2002:a5d:404b:: with SMTP id w11mr107247884wrp.171.1578313197638;
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313197; cv=none;
        d=google.com; s=arc-20160816;
        b=RHAFNKJI9mA5/nFORMDz4EUAbZnC9uLALmfm4Ik+1/drYei9d0VcuHJrJ1JKnMkPY+
         fyJhU0n19VK7+hCCu+R5xEVjKQmHgiHuMAgx7L2PTLMLxYGIM3JbxyT/PbLtmMbnKBcE
         dBYi/zdFCB8nMge9K/dXwjdNPW6Czr8tatkAKjGbS+ty6mJ4rNZ9reqd6gpMmV9JTi4P
         8P204vBAKN+WJq6YNcCA2C7VWlocyFsnYI2hS0pODrAx8vkAMIYE+g++PZ4jkKdzDK7B
         fuoCKBJfu6gPamGgN2SibhEZtvol3DXl4+E7wmlejoJGgaUFHkaXOL7+wxTz2eGug3ME
         rHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=CjmjP4DRislXp0cJWnyJX4p+7z4tqdb5WlewwvMoB10=;
        b=c9M5+RiyXUlR5+HQQBOVOvDnQmgx7RmRTUo5QfydMSf7lEjdHBkczsbt9HVC+t4Yig
         1t67KOWZdtNB5Qwir4TOMbjPXTka3/owLwhqYWzEAh7AXbc7tFPvOU3UemFplRF5DhLY
         Dsq93yWApMcWXbjdGPmM3eEo3JraWxHmteFGwJju/ydDdG/PoyiIrMoOabmzYzQTBKxu
         bmw7mDDAvnzqFG+0LQzn8M6xTWxGCeFh8e/NU0qpAN9DcbhNIYRmCclJ0xp2q9Zwsjhd
         fSRQm5FLSSsrzQpkzq0MfxF67NsPGT4Txo+at81vl6f77G4As7GBMvDKAmjSMDYwOGU+
         Flfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w11si972132wmk.0.2020.01.06.04.19.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJvtt019177
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:57 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEg029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:56 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/38] core: ivshmem: Move shared memory parameters into vendor specific capability
Date: Mon,  6 Jan 2020 13:17:49 +0100
Message-Id: <2e499d8cb509ab2bb7f0db2f345ca526f1ff134a.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

This gives us more flexibility in extending the parameters we expose via
the config space. The capability is already layed out to leave holes for
upcoming extensions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  5 ++---
 hypervisor/ivshmem.c                   | 34 +++++++++++++++++++---------------
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 59ce2e97..16d0cef0 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2019
  *
  * Authors:
  *  Henning Schild <henning.schild@siemens.com>
@@ -18,8 +18,7 @@
 #include <asm/ivshmem.h>
 #include <asm/spinlock.h>
 
-#define IVSHMEM_CFG_MSIX_CAP	0x50
-#define IVSHMEM_CFG_SIZE	(IVSHMEM_CFG_MSIX_CAP + 12)
+#define IVSHMEM_CFG_SIZE	0x80
 
 #define IVSHMEM_INTX_ENABLE	0x1
 
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 15592bab..739b91b9 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2019
  *
  * Authors:
  *  Henning Schild <henning.schild@siemens.com>
@@ -32,11 +32,13 @@
 #define PCI_VENDOR_ID_SIEMENS		0x110a
 #define IVSHMEM_DEVICE_ID		0x4106
 
-/* in jailhouse we can not allow dynamic remapping of the actual shared memory
- * the location and the size are stored here. A memory-BAR size of 0 will tell
- * device drivers that they are dealing with a special ivshmem device */
-#define IVSHMEM_CFG_SHMEM_PTR	0x40
-#define IVSHMEM_CFG_SHMEM_SZ	0x48
+#define IVSHMEM_CFG_VNDR_CAP		0x40
+#define IVSHMEM_CFG_MSIX_CAP		(IVSHMEM_CFG_VNDR_CAP + \
+					 IVSHMEM_CFG_VNDR_LEN)
+
+#define IVSHMEM_CFG_SHMEM_RW_SZ		(IVSHMEM_CFG_VNDR_CAP + 0x08)
+#define IVSHMEM_CFG_SHMEM_ADDR		(IVSHMEM_CFG_VNDR_CAP + 0x18)
+#define IVSHMEM_CFG_VNDR_LEN		0x20
 
 #define IVSHMEM_MSIX_VECTORS	1
 
@@ -65,10 +67,11 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[0x04/4] = (PCI_STS_CAPS << 16),
 	[0x08/4] = PCI_DEV_CLASS_OTHER << 24,
 	[0x2c/4] = (IVSHMEM_DEVICE_ID << 16) | PCI_VENDOR_ID_SIEMENS,
-	[0x34/4] = IVSHMEM_CFG_MSIX_CAP,
-	/* MSI-X capability */
-	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16
-				   | (0x00 << 8) | PCI_CAP_ID_MSIX,
+	[PCI_CFG_CAPS/4] = IVSHMEM_CFG_VNDR_CAP,
+	[IVSHMEM_CFG_VNDR_CAP/4] = (IVSHMEM_CFG_VNDR_LEN << 16) |
+				(IVSHMEM_CFG_MSIX_CAP << 8) | PCI_CAP_ID_VNDR,
+	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16 |
+				   (0x00 << 8) | PCI_CAP_ID_MSIX,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 1,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 1,
 };
@@ -397,14 +400,15 @@ void ivshmem_reset(struct pci_device *device)
 		ive->cspace[PCI_CFG_INT/4] =
 			(((device->info->bdf >> 3) & 0x3) + 1) << 8;
 		/* disable MSI-X capability */
-		ive->cspace[PCI_CFG_CAPS/4] = 0;
+		ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &= 0xffff00ff;
 	}
 
-	ive->cspace[IVSHMEM_CFG_SHMEM_PTR/4] = (u32)ive->shmem->virt_start;
-	ive->cspace[IVSHMEM_CFG_SHMEM_PTR/4 + 1] =
+	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4] = (u32)ive->shmem->size;
+	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4 + 1] =
+		(u32)(ive->shmem->size >> 32);
+	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4] = (u32)ive->shmem->virt_start;
+	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4 + 1] =
 		(u32)(ive->shmem->virt_start >> 32);
-	ive->cspace[IVSHMEM_CFG_SHMEM_SZ/4] = (u32)ive->shmem->size;
-	ive->cspace[IVSHMEM_CFG_SHMEM_SZ/4 + 1] = (u32)(ive->shmem->size >> 32);
 
 	ive->state = 0;
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e499d8cb509ab2bb7f0db2f345ca526f1ff134a.1578313099.git.jan.kiszka%40siemens.com.
