Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GLZTYAKGQENO6IEGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E4B1311F2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:00 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id n18sf4332607edo.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313200; cv=pass;
        d=google.com; s=arc-20160816;
        b=PD5F7XAiT/GN3CBFMoOR7hLHOlouoVlDB0PuTbuza4hzCjrow1geKZeLTTEzkYqrtU
         4ksvgSrVytfPn4Iisn5Ab5R0ET5y4iQQR66A3AIUPItVQ35wyJ+n5lfVsOAroMkLwARY
         pbXDst/MSYmKXeGUfuasWtf85+J4a2nORqyV60aW4ibR565MsS/6EaInp5sg2vln+1Xh
         tONifz/OcMWvIbVZZYoCfP6opogLFtDNQUb6HnY03O6KHh7eBPsdcXM/vWespME3PAtE
         l5cZNqJy+h30P+VgXKz4DeLMh/nQOyq8r6ci5atG4wiyRvQC3c1Is98a3gtPEZ/4P3iA
         ZtDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=udnO+fpkU695Kd2KedBnMCL6PWWV8z36Br2F31fVNeg=;
        b=CpCXfx9UzaNe/THdrh27CjhiCSlffAHQxiFjzChszAQ3Y+dbzRUX8Aj3cbUVs1Afdv
         eoncPWHOCKVkCUqINOHqoirOMYkxQBuloLqP6U8ku2GDhMe1MvrmI/ocjaJjRgj1+jWm
         fgbticeWZZyY1nmkhz6Mkc5UW4OwFDmFVOES1lqKqrvAQKgYI4x3Ppf3VywGS+srFj6B
         YCnj+SwhmGtsnpcMXkTLADTRpBSPubUqjlrdsPjFCLaL4GKAuMcpusXKMUibcipT/zxq
         YrZUVw+ihGyRGJyGQMZw6S/tTCTRhoKsUwPlvyQdjjKFjpRpZNXZaBqipkxQDHQLVfUx
         EeqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=udnO+fpkU695Kd2KedBnMCL6PWWV8z36Br2F31fVNeg=;
        b=M2XVgjAAUcXKAkTwmA++yIsuVZ1+gskO0O1fiX8YQeUzlGQJR8uCW9VOUq2bwFG1zv
         ZQdJi/guq37ol51ZjzJ8m7vxp+RO2p0y8db4rH2m4fzYu3hEBGhUWipo3zbEAylPX94M
         Mb6AwjOLFdK0uB5QBlukLmgekM4WbS3pqJmL2lCynGhS9MrVYGnTeQeWjDLfSy/Ios2V
         JRoMFEmFxWYK8VfXkZWQdcApvhFioc/T4Nv8oPbGlXTwVfVGF1E47YpgVt/iXPSapcNO
         NAiQ8+VGrZh6OKu8J3HHoGJrc2i2+c+9Ge4yZglhNn/gyHmVh6qO4K+P5KzEzT8TbUK0
         nJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=udnO+fpkU695Kd2KedBnMCL6PWWV8z36Br2F31fVNeg=;
        b=Dl2s8WBXmagTbaUtxx3RSOB8TYFaX7d9tZ/bm0bmCANZpT8jZmqfCjlcITwuRUL2hB
         9ydB8AWqR+EasViqKQoGoLNWZXvxSnAm/sto8jN7yoM0TRg3QLhSNi1i2xZbiVbB+JA0
         eNd7r8Qir9Pnsk0rVvwA66CQKyJVqMm/lzrTId7zsUDgB/pnP/HTO+ZRWgcif1RaPlJG
         LqZcpsbrUN549XXx22tIzK9Z12Vo/ClA51Qfya8QniiIDkv4VW63u1A9EgPLWV+zFXj7
         jbbuyVf2BWPfsMhV7h8vrqmpXOOYADCmLEvAz93MPKw5bMXmYdnFhqeeRx7WquY2P5Vd
         phDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWjIIuHDd9PuP75qFyYUhBEx8izVqG6Q/pw1SJApvmjK0C7Pluu
	je+JaIsrdwrtT0ySRwHD4NA=
X-Google-Smtp-Source: APXvYqwcLwPabNripufuVWXuvHItOeUZ2snjqstcsVNot32Mxtj+MQvSFc5tTdu0CYHt+Www3CNHvA==
X-Received: by 2002:a17:906:3601:: with SMTP id q1mr85043732ejb.276.1578313200285;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bb47:: with SMTP id y65ls14008052ede.1.gmail; Mon, 06
 Jan 2020 04:19:59 -0800 (PST)
X-Received: by 2002:aa7:c890:: with SMTP id p16mr107384011eds.127.1578313199556;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313199; cv=none;
        d=google.com; s=arc-20160816;
        b=kmZ/7WOye2REJ8zB6BUPgcIxJAm2r8RpsU3zJAPWPTFg5GOqnEn01z7OwZ5bnE0G9B
         MWpgu1KFvdm+Z9kG4cSb+9BSbSmdD3qEQacZ9JBQcePi6acti7RRMxZgtAOv/xU5J1OZ
         nigCbijRwiyrS7+UAIi1Mfhwc8OqASBZYn4ErlDFWflo0Dir6o8+tmsTPWZt3OXVQQWW
         b161yoqOUxykG6abGSnsZnm8x5i3Y0gv3Lo221PKrI7kYWgC91/cnE6TnLbUTTBxEjSl
         MjWE9vcugF+/RzROQuNx6JWoHa7CXxrm44beHvgoxyXWZ3mt2ogO+6F5cxL7++QzdfD7
         FwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=k5ZOQMaMZYT9M8DIAQyRGHERWW73yPftQ+/4DNEaMo4=;
        b=mmvp6DHZRaVUO1wX7rAzFdHwg1+4aiwGkBGe5/FhfgpRI3K+DIs/6duLqCC0rN9SaC
         hfsgBSEMuNk/5O8WTFBSPMIZgkImomZ3rH7E1mWVSUtzb+I4px5WdHvWT/2j0WgGSlw8
         pZfdkTY2LxsJ6kH5pwEZhoMja3BSjxnUHIb8U2lhuDtl//mAyIb7cWuhxw05ggI7pQOy
         AXF5EnDjaLCxZaHA9xfseaGbBxXfcXO5AhT7GYesnqQqbXfa1Ko96ARt79DQ9ITQhKrM
         bkbWyE8XFxjhEbrmIBKxFf66MbUEP8tUJBJXblpPIxfmtZmP31mXS72aOqQMGkiWAyEh
         UEfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id cc24si2420392edb.5.2020.01.06.04.19.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CJxIH020514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEm029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/38] core: ivshmem: Add PCI-conforming INTx mask
Date: Mon,  6 Jan 2020 13:17:55 +0100
Message-Id: <d9b343063d868bf0d479f115a165e7ad831f2b80.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Simple enough to add, and newer PCI specs demand this feature anyway:
allow to mask the INTx line via the command register.

For this purpose, factor out ivshmem_update_intx that determines the
state of the line prior to calling arch_ivshmem_update_intx. It also
skips over this call in case num_msix_vectors is non-null, offloading
this check from the arch function. Furthermore, move the calculation if
INTx is enabled and unmasked into that generic ivshmem_update_intx as
well.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/ivshmem.c   |  7 ++-----
 hypervisor/arch/x86/ivshmem.c          |  2 +-
 hypervisor/include/jailhouse/ivshmem.h |  3 ++-
 hypervisor/ivshmem.c                   | 16 +++++++++++++++-
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index 19d300d3..ccf49aa5 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -41,14 +41,11 @@ int arch_ivshmem_update_msix(struct pci_device *device)
 	return 0;
 }
 
-void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive)
+void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 {
 	u8 pin = ive->cspace[PCI_CFG_INT/4] >> 8;
 	struct pci_device *device = ive->device;
 
-	if (device->info->num_msix_vectors != 0)
-		return;
-
-	ive->arch.irq_id = (ive->intx_ctrl_reg & IVSHMEM_INTX_ENABLE) ?
+	ive->arch.irq_id = enabled ?
 		(32 + device->cell->config->vpci_irq_base + pin - 1) : 0;
 }
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index 7ec3ea70..c1180012 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -65,6 +65,6 @@ int arch_ivshmem_update_msix(struct pci_device *device)
 	return 0;
 }
 
-void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive)
+void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 {
 }
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index dae67f44..a60d4f0f 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -67,8 +67,9 @@ int arch_ivshmem_update_msix(struct pci_device *device);
 /**
  * Update cached INTx state (if any) of the given ivshmem device.
  * @param ive		Ivshmem endpoint to be updated.
+ * @param enabled	True if INTx is enabled and unmasked.
  */
-void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive);
+void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled);
 
 /** @} IVSHMEM */
 #endif /* !_JAILHOUSE_IVSHMEM_H */
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 45306b85..ce0bed4c 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -91,6 +91,15 @@ static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
 	spin_unlock(&ive->remote_lock);
 }
 
+static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
+{
+	bool enabled = ive->intx_ctrl_reg & IVSHMEM_INTX_ENABLE;
+	bool masked = ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_INTX_OFF;
+
+	if (ive->device->info->num_msix_vectors == 0)
+		arch_ivshmem_update_intx(ive, enabled && !masked);
+}
+
 static enum mmio_result ivshmem_register_mmio(void *arg,
 					      struct mmio_access *mmio)
 {
@@ -108,7 +117,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 	case IVSHMEM_REG_INTX_CTRL:
 		if (mmio->is_write) {
 			ive->intx_ctrl_reg = mmio->value & IVSHMEM_INTX_ENABLE;
-			arch_ivshmem_update_intx(ive);
+			ivshmem_update_intx(ive);
 		} else {
 			mmio->value = ive->intx_ctrl_reg;
 		}
@@ -238,6 +247,11 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 		*cmd = (*cmd & ~PCI_CMD_MEM) | (val & PCI_CMD_MEM);
 	}
 
+	if ((val & PCI_CMD_INTX_OFF) != (*cmd & PCI_CMD_INTX_OFF)) {
+		*cmd = (*cmd & ~PCI_CMD_INTX_OFF) | (val & PCI_CMD_INTX_OFF);
+		ivshmem_update_intx(ive);
+	}
+
 	return 0;
 }
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d9b343063d868bf0d479f115a165e7ad831f2b80.1578313099.git.jan.kiszka%40siemens.com.
