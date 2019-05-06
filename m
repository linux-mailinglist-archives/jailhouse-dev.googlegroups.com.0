Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAXCYLTAKGQEOTPZRLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FA155F2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:15 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id a16sf9503792wrs.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180675; cv=pass;
        d=google.com; s=arc-20160816;
        b=m4NOC2zYY/ldhf+jh/9d+QHZGXQqEOcF3oGaG8u+eDw4b8f59H7h5MTL9BNfjhHmtV
         kl4jyQ4qz3mAoCXLoGFRlaNX0VW8bgM1sEqUsGoWHSORS4rfGgrlrD75YblwUGhzzMwh
         zOOaN2l9XPtsBd+f9M5qBUh60IfW/px81KNTykZBh8+ES7XcKWKFccCvnWrv9Z5FVi/G
         yJSGuz1dAeq8huHrssGyjmuulx0/4QUKdwopbcdPWRYXo30JWGbtunRxQuO5OR7uUm4W
         ISUBCXpw+/wLEqey+doWUOb0tfXhCUmcYIrs0FxKKUdu+A3eK+V80QD8g5BBuMgs0E46
         wr5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=w1BJtFQjDoeMyVHesS89VoAnp5H2srq7vcLdpcUk8rc=;
        b=kehjlwM9eol7io7t8rdhZGGUsXZavBg29td1LGWYzSX1b3meR20tfEdVkUdmnpgdhe
         0lA01cbCmJwVXI1CPxfpksEd+Cb+/aj4V1T8OeoYRQF/j3mnhEwuVIo2I0EDBvdU0dST
         C7N0QtLPJPyR+LSB0r0N6RDcQ+Iu6Uclbd11l25ICJ121TLJkufSdF74C2K1eY/cBic1
         U3nsJh7E+jwAaVDOuLVcfJfSZgt87HVi3sncNx5FmyYhs5kBNUuUK9FH0RusVo0bCgfK
         qSEQdJStggitMmHQck/wsBa3dXEhEPIuQzbxS3J8VLSvNNb9jak4a+tTYIvuUA0kRw63
         i4Ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w1BJtFQjDoeMyVHesS89VoAnp5H2srq7vcLdpcUk8rc=;
        b=U/7WMNoZgcEhreL53ONd1CFKKQZO4l6NbovhFqcErFx8Qye7b/bv7ToDn50/KA3eME
         9+SV1oOp75LE5gT5760pipnQzWjI5fz/piuWTgCsvHHf63zTijolh68fGg5GLpOEpog3
         IITq9jmxDSUcTQGyRM1AQjsdb/v/DRt0jTihzoQHxLPVGNLRut+MBga1hMVLkYJjEhI0
         MXuTWtDDh4fkhrl/kGsx3yZvz8+wHEjtlXz4dfka2rro47xQfYByyGFHpw3KhlvMM2Ge
         IUQKjCjHW2ZfKxnVM1q5P2xgK1uJPNHtX4NuxZoRvRqrdKiF5ZZcUiBBxzEyJrXdh7RN
         7Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w1BJtFQjDoeMyVHesS89VoAnp5H2srq7vcLdpcUk8rc=;
        b=A/iTta5iXyLHRyLiCHb5nFMjbviutSfHMFuOY5JYH+l7Ws75qVnOyhcTencs3xQ01T
         lqttgwctfURGOMKQgwkSuaLEJupqg4WsK3CBhFq25mq6UjjbmbfuwTObTrAkIfN+/lPV
         QSdQI9mKovfS9AtfkgohVBnbnpSKXx1PmUT7j+X5QbHxeBYuv4cC+KqaWLm1xbGjuXXm
         b0xn+5+N77P8gd1b+1s+r2UlIlipzjOk6CLSYItdGRmCokSMCiLPbew4MVYfFWSEEHAV
         QjlhLBsGL4n/NDJCkn0m/FzjfO7QlRG7tY00KQpMzVxHcBIOpyD/6LBEaO7homokJOmq
         xGlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9Ah9BS1RhmJeA2eGBmyDTUEkar/SkmAyTrqJiPMa370wdYwhl
	tRyf3evhmlQW6TIR0oMTh2Q=
X-Google-Smtp-Source: APXvYqy8qexfvKAbqls6AjFgW/42QQgHWC+G3PQd2tohES3OvjksX4ab2F4amSqC1voshVFDLdb+eQ==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr20626284wrv.131.1557180674996;
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9696:: with SMTP id y144ls4188224wmd.2.gmail; Mon, 06
 May 2019 15:11:14 -0700 (PDT)
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr19291496wmt.10.1557180674548;
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180674; cv=none;
        d=google.com; s=arc-20160816;
        b=dRdQHYg9HWPowpQbmU8uqJJHDqXXCuzj2V2S/O4xYg0ExUsoTYc5qg82BK2ii7r714
         Dc7rXSrjhrwzV8tV/rpuLnGj0a5+YiWLMgdbtaaIl3CNz+AtDFLW35ZnaVXWvlolH5EC
         VsTV69QZTRP6FLqHRKXaXMBAQyfupDeVEGtGSXIWOQJJTuRb0+hGllnO4tD00Xf72Rtq
         vSwrC6HCay7qckwJLCVllAmf9OmghOoRuAfbQUoBgdxybwX6UPKxZflT5oQSPxjNzjYZ
         Rg/9myQsNYQyQKdWEJah2QKzdjDN5b1coZuv7r/RiWSG5eot+VJ96Xk6Cm1R4bowE/CL
         uS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=XJnLcG5RCLOhUg4EFt6DJxnHdfSCigi0nmDfz9fUPVw=;
        b=RW3mpw1bxeWQHKMPWa3VtzXQYJTmXMnzGS1HJBVPop72UAZv5jSdmN/QyrowyG4BxD
         MuNbsdKpah7Wida/Lv6xLHfeyP627Jt7E3d0x4Xqc+HmC5gBbyjNzNI2Y5bJw3CP+09q
         mIayhZbQXsXEhSuRpgvdyRSz1Lo9XeX7PHt64OlL5iFu2IUAGtxZ1DCIhJmakClP7p4/
         C8VEqJTGNXd6VZtkQulVoGeEheAsmDmzK4OyyQYQyiEkNMTTxC3ayh5vZDjmOxf3TzvX
         nVUSm7diFIqucbUKXyUzY7ZrIa4po+tA7rKvPTPMsSNGW6azcSJD09igqBuy7ynpDCXy
         gtWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h5si267250wrc.1.2019.05.06.15.11.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQB0Yb3zyBH;
	Tue,  7 May 2019 00:11:14 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 7/7] pci: use new PCI_CAP_ID_ definition from cell-config.h
Date: Tue,  7 May 2019 00:11:10 +0200
Message-Id: <20190506221110.19495-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

pci.h also defined two IDs for MSI and MSIX. Replace usages of these
definitions with the one defined in cell-config.h.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/include/jailhouse/pci.h |  3 ---
 hypervisor/ivshmem.c               |  2 +-
 hypervisor/pci.c                   | 26 +++++++++++++-------------
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index 4e744edb..ea8c1a0b 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -35,9 +35,6 @@
 
 #define PCI_DEV_CLASS_OTHER	0xff
 
-#define PCI_CAP_MSI		0x05
-#define PCI_CAP_MSIX		0x11
-
 #define PCI_IVSHMEM_NUM_MMIO_REGIONS	2
 
 struct cell;
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 6c0d5720..53644deb 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -69,7 +69,7 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[0x34/4] = IVSHMEM_CFG_MSIX_CAP,
 	/* MSI-X capability */
 	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16
-				   | (0x00 << 8) | PCI_CAP_MSIX,
+				   | (0x00 << 8) | PCI_CAP_ID_MSIX,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 4,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 4,
 };
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index e04d4c58..4ab5fea3 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -240,7 +240,7 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
 		return PCI_ACCESS_PERFORM;
 
 	cap_offs = address - cap->start;
-	if (cap->id == PCI_CAP_MSI && cap_offs >= 4 &&
+	if (cap->id == PCI_CAP_ID_MSI && cap_offs >= 4 &&
 	    (cap_offs < 10 || (device->info->msi_64bits && cap_offs < 14))) {
 		*value = device->msi_registers.raw[cap_offs / 4] >>
 			((cap_offs % 4) * 8);
@@ -331,7 +331,7 @@ enum pci_access pci_cfg_write_moderate(struct pci_device *device, u16 address,
 		return PCI_ACCESS_REJECT;
 
 	cap_offs = address - cap->start;
-	if (cap->id == PCI_CAP_MSI &&
+	if (cap->id == PCI_CAP_ID_MSI &&
 	    (cap_offs < 10 || (device->info->msi_64bits && cap_offs < 14))) {
 		device->msi_registers.raw[cap_offs / 4] &= ~mask;
 		device->msi_registers.raw[cap_offs / 4] |= value;
@@ -345,7 +345,7 @@ enum pci_access pci_cfg_write_moderate(struct pci_device *device, u16 address,
 		 */
 		if (cap_offs >= 4)
 			return PCI_ACCESS_DONE;
-	} else if (cap->id == PCI_CAP_MSIX && cap_offs < 4) {
+	} else if (cap->id == PCI_CAP_ID_MSIX && cap_offs < 4) {
 		device->msix_registers.raw &= ~mask;
 		device->msix_registers.raw |= value;
 
@@ -527,9 +527,9 @@ void pci_prepare_handover(void)
 		if (!device->cell)
 			continue;
 		for_each_pci_cap(cap, device, n) {
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				arch_pci_suppress_msi(device, cap, true);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_suppress_msix(device, cap, true);
 		}
 	}
@@ -556,10 +556,10 @@ void pci_reset_device(struct pci_device *device)
 	pci_write_config(device->info->bdf, PCI_CFG_COMMAND, PCI_CMD_MEM, 2);
 
 	for_each_pci_cap(cap, device, n) {
-		if (cap->id == PCI_CAP_MSI || cap->id == PCI_CAP_MSIX)
+		if (cap->id == PCI_CAP_ID_MSI || cap->id == PCI_CAP_ID_MSIX)
 			/* Disable MSI/MSI-X by clearing the control word. */
 			pci_write_config(device->info->bdf, cap->start+2, 0, 2);
-		if (cap->id == PCI_CAP_MSIX)
+		if (cap->id == PCI_CAP_ID_MSIX)
 			/* Mask each MSI-X vector also physically. */
 			for (n = 0; n < device->info->num_msix_vectors; n++)
 				mmio_write32(&device->msix_table[n].raw[3],
@@ -713,9 +713,9 @@ static int pci_cell_init(struct cell *cell)
 			goto error;
 
 		for_each_pci_cap(cap, device, ncap)
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				pci_save_msi(device, cap);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_save_msix(device, cap);
 	}
 
@@ -805,12 +805,12 @@ void pci_config_commit(struct cell *cell_added_removed)
 		if (!device->cell)
 			continue;
 		for_each_pci_cap(cap, device, n) {
-			if (cap->id == PCI_CAP_MSI) {
+			if (cap->id == PCI_CAP_ID_MSI) {
 				err = arch_pci_update_msi(device, cap);
 				if (device->cell == &root_cell)
 					arch_pci_suppress_msi(device, cap,
 							      false);
-			} else if (cap->id == PCI_CAP_MSIX) {
+			} else if (cap->id == PCI_CAP_ID_MSIX) {
 				err = pci_update_msix(device, cap);
 				if (device->cell == &root_cell)
 					pci_suppress_msix(device, cap, false);
@@ -875,9 +875,9 @@ static void pci_shutdown(void)
 			continue;
 
 		for_each_pci_cap(cap, device, n)
-			if (cap->id == PCI_CAP_MSI)
+			if (cap->id == PCI_CAP_ID_MSI)
 				pci_restore_msi(device, cap);
-			else if (cap->id == PCI_CAP_MSIX)
+			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_restore_msix(device, cap);
 
 		if (device->cell != &root_cell)
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
