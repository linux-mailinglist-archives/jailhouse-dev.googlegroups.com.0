Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5GLZTYAKGQE472SQ7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A148131200
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:04 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id f19sf10576380ljm.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313204; cv=pass;
        d=google.com; s=arc-20160816;
        b=zeDvbtnNzBuK7wXw2j6F6IcCNyHFQpjZcVDO6QUQQEQBwGzS7ZknvZzeeGKztOTCTp
         oWyrNNwp6NeVvmn3EWaPFp98sb8dzTT6KC16L4czyiYWDWZSHkn9FC5BSBhLt7/CJNeW
         iChuY3il9KD0xVm7wjHAma5MRYAFHtPFb/dRK9bTnRtN/IAq96In10aPrN/ySpIvW7vU
         J+kWCi6jmONbgqV4qafj8X9Vw6xrFdhonbIR8WRa0eBWoJyTLpAPEWM8VNrqDH6kUC0O
         CUnsuGtQ4NR2mRmOxCslGlBfu5TlX1S2Ysc5yZGhh/HrAvCY4KWdJNSlUbsYH8M8xE0i
         VGEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5oE7+ez4oRNWKK98IUnrCmDvI8hq/eJ1ZhYqMbV0rjc=;
        b=Dg4xg46kBr2lulHyF/ysZhHW0epY10JonlCQRNZuzXig5QBT+WBh27WsGu/d4yvzhS
         c0yBtyqA9qXKKu7Pvs/CWSZn5MHDX0E4AuqtuBl+VlTqe/LfmO145XqUWN0QS58+aKqo
         quuHQb4FqPj3aBPkE2RQ+bSkcumbTqxpyULaIoV+w3Xl028c8O0R0fOEadjOmHW1CZf/
         CdWR3rD/chO9g8l5fDIuEW/F5elzjS6V/MEb+49AmKyx8unG3wSov0c9T+BuNCnoXYeZ
         t6HCXB8L/m0r+eXqwjFDj/+oTCxi8LD7V1mr53Kp4ilMAktcPaH5UD0U1+YOPp+KgGji
         CzTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5oE7+ez4oRNWKK98IUnrCmDvI8hq/eJ1ZhYqMbV0rjc=;
        b=dRvpsAEb/lngVZQxIapN7t6s/3w7fLhe1YxsqlwWgDNxl9ixlXX9HSKGG3rsAX/ZZ7
         DencyuXkQWQdawJTDSs76rdfV19TMNKYFCALdllC5JlAuGDOdbegxQjVT7SdRdjZvqaR
         45weZtkICpdPZRN03dKp/HybrtUjbpEO+1xu61RzxaqrVjKkZ5pAocfNVlVLV5kjDIX6
         AWHpVncTbIPDzhttBhoXBAlnkMAfPLm7d9J1Kvj93PUJ3DHub2wr896A6lgx622WjFXn
         MNI1VyOc8scATIqJxfLyAV0Wkvk0qZU5V91Wf7WoWmgWi9Q6iovdNDPRpIg6gj6wYp1y
         OrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5oE7+ez4oRNWKK98IUnrCmDvI8hq/eJ1ZhYqMbV0rjc=;
        b=eGSnY+gkZH7605CiqQTJe1W2QEuyEN900wfSfsE7hWfMOhiGEYa8rqtEKPj1e6v9qh
         rd/zbyVUK9XT/JGljDJBsoaPe+NpZ8JLNWu+QS1a4xBDaCbY+8tbacfryNpBw9AXe0y5
         +1AzuFVWid6jZ9hRfmMool5T3kZEZZYtduxR9Dz/DB+tqaLPq7FL0JWfAYDBg3SmIobq
         JYX1eydReKef0tDpAbZvjeNckyfRzjOXPt6qSZyU8O6Ag06nX3ukhdlNkm1RTizAuknF
         tl5rXJpobORHhGDBTlu/EVBrIBmQcIhffQymNd5UYxdLRFu3lIw2Zua+0s1HQnnD8+iV
         Rv5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVWKmLvnTphBoXSrzAgSs8bnt8PInJ2Xa/6lyfWZkZbZgAgbbl5
	gZGlyb0jmVvLjjGqfN6FaEI=
X-Google-Smtp-Source: APXvYqxHvODyPwGEpoKJy4LkuASliFsiwUETzBc57kh2RAyC/eDfpKZOinMDfAaAcBR9z+gbBglt7Q==
X-Received: by 2002:a2e:98c4:: with SMTP id s4mr60367013ljj.102.1578313204191;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d90:: with SMTP id c16ls5789756ljj.1.gmail; Mon, 06 Jan
 2020 04:20:03 -0800 (PST)
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr61138729ljj.26.1578313203420;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313203; cv=none;
        d=google.com; s=arc-20160816;
        b=otWq2PRTAzBKNnxo7nxV6nn01s7/L54Np7XQdpnjKggprI4MX7MgnAA72UgqIJnlkq
         9DnZJB91c7A2zjNXAaP3SaTGELl6i1LMSpwGBv9KcaZxRu/2uSqHQVfko2VO1aMj7iTf
         zOXXjFn4YJOZ7Ft+mNWOWtGYgiAc+xeiVeG9Z0ItQWp/9f4L67e9D0PnyJfsFjiiitUy
         veAqwV95y6mRz6G5w+nAvS7I9KRwaCzxA2YUqZu/h5mNxV34KBjCJKxCzwxlzvNHXOjI
         qE8Phy3/kAQdnV6FP1DPkHM3AjzxlV+YF8ycxPjEKamN8nOB/eAsnEldninTgWMxL1A+
         8lNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=di0r7rubNFjiqd98JVyF4nBc5g1X7DPhRHLBktoa+ps=;
        b=0aE/pp4aVqHSGtf23nTwR6jqFdRPadTpPv3lCY8WgUxazBXDCLa+BjtsBJc8VAscet
         9oeFsoZOjhEyYDs0vcaMs4n8HWeUbgavKDrpwz51Mg2wZydWQWo9xbnK9Ylc1E7mb/1R
         GA0IAn6YRrNAH6zK7imNDrPWgTqKv3TENF+g5Z0GEDTbTTQ/eRLqZ1+T4qiRlmqZI+aQ
         cua5dq5cIXLoiPNZaPRONzJ8bq+1wxPfz9YZRrZGydglB/pBHrtU6qZabeuOyBLdrJ3i
         i3RBtpMLJtAfRbjV27I34bYxxj/9Gc4w3CwOELJ1bxDK5MZgnDVWLxrTptJz/3NR6Etm
         /38g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o193si1361446lff.4.2020.01.06.04.20.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK2BS011268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF0029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 26/38] core: ivshmem: Rework interrupt configuration and injection
Date: Mon,  6 Jan 2020 13:18:07 +0100
Message-Id: <a3830f502e125fe7f08259d8ed2f42d8bd13c425.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

Revamp data structure, updating and locking around ivshmem interrupt
injection.

The structure arch_pci_ivshmem is renamed to arch_ivshmem_irq_cache to
clarify the purpose of this. This allows to invalidate the case
generically by setting it to 0.

The remote_lock is redefined as irq_lock, now protecting cache update
and usage as well as serializing updates with injections. We do not need
a lock around ivshmem_endpoint::remote updates because the pointer will
never reference an object that is no longer existing after removal.
Instead, the update of irq_cache while holding irq_lock now acts as
barrier.

Furthermore, ensure irq_cache invalidation on device reset. Not
performing that step so far could have caused bogus interrupt delivery
between cell reset and ivshmem device re-initialization.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/ivshmem.h |  4 +-
 hypervisor/arch/arm-common/ivshmem.c             | 20 +++++--
 hypervisor/arch/x86/include/asm/ivshmem.h        |  4 +-
 hypervisor/arch/x86/ivshmem.c                    | 67 ++++++++++--------------
 hypervisor/include/jailhouse/ivshmem.h           |  6 ++-
 hypervisor/ivshmem.c                             | 39 +++++++++-----
 6 files changed, 79 insertions(+), 61 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/ivshmem.h b/hypervisor/arch/arm-common/include/asm/ivshmem.h
index 8110ca30..a6ff33df 100644
--- a/hypervisor/arch/arm-common/include/asm/ivshmem.h
+++ b/hypervisor/arch/arm-common/include/asm/ivshmem.h
@@ -10,6 +10,6 @@
  * the COPYING file in the top-level directory.
  */
 
-struct arch_pci_ivshmem {
-	u16 irq_id;
+struct arch_ivshmem_irq_cache {
+	u16 id;
 };
diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index 7b98b6da..986eb2cb 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2019
  *
  * Author:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -15,7 +15,7 @@
 
 void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 {
-	unsigned int irq_id = ive->arch.irq_id;
+	unsigned int irq_id = ive->irq_cache.id;
 
 	if (irq_id)
 		irqchip_set_pending(NULL, irq_id);
@@ -33,7 +33,13 @@ int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
 			return -EPERM;
 	}
 
-	ive->arch.irq_id = irq_id;
+	/*
+	 * Lock used as barrier, ensuring all interrupts triggered after return
+	 * use the new setting.
+	 */
+	spin_lock(&ive->irq_lock);
+	ive->irq_cache.id = irq_id;
+	spin_unlock(&ive->irq_lock);
 
 	return 0;
 }
@@ -43,6 +49,12 @@ void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 	u8 pin = ive->cspace[PCI_CFG_INT/4] >> 8;
 	struct pci_device *device = ive->device;
 
-	ive->arch.irq_id = enabled ?
+	/*
+	 * Lock used as barrier, ensuring all interrupts triggered after return
+	 * use the new setting.
+	 */
+	spin_lock(&ive->irq_lock);
+	ive->irq_cache.id = enabled ?
 		(32 + device->cell->config->vpci_irq_base + pin - 1) : 0;
+	spin_unlock(&ive->irq_lock);
 }
diff --git a/hypervisor/arch/x86/include/asm/ivshmem.h b/hypervisor/arch/x86/include/asm/ivshmem.h
index 6eb66da1..bf9e61f0 100644
--- a/hypervisor/arch/x86/include/asm/ivshmem.h
+++ b/hypervisor/arch/x86/include/asm/ivshmem.h
@@ -12,6 +12,6 @@
 
 #include <asm/apic.h>
 
-struct arch_pci_ivshmem {
-	struct apic_irq_message irq_msg;
+struct arch_ivshmem_irq_cache {
+	struct apic_irq_message msg;
 };
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index 909b7f8e..3692271c 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -1,10 +1,11 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2019
  *
  * Author:
  *  Henning Schild <henning.schild@siemens.com>
+ *  Jan Kiszka <jan.kiszka@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -18,49 +19,39 @@
 
 void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 {
-	/* Get a copy of the struct before using it. */
-	struct apic_irq_message irq_msg = ive->arch.irq_msg;
-
-	/* The read barrier makes sure the copy is consistent. */
-	memory_load_barrier();
-	if (irq_msg.valid)
-		apic_send_irq(irq_msg);
+	if (ive->irq_cache.msg.valid)
+		apic_send_irq(ive->irq_cache.msg);
 }
 
 int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
-	union x86_msi_vector msi = {
-		.raw.address = device->msix_vectors[0].address,
-		.raw.data = device->msix_vectors[0].data,
-	};
-	struct apic_irq_message irq_msg;
-
-	/* before doing anything mark the cached irq_msg as invalid,
-	 * on success it will be valid on return. */
-	ive->arch.irq_msg.valid = 0;
-	memory_barrier();
-
-	if (!enabled)
-		return 0;
-
-	irq_msg = x86_pci_translate_msi(device, 0, 0, msi);
-	if (!irq_msg.valid)
-		return 0;
-
-	if (!apic_filter_irq_dest(device->cell, &irq_msg)) {
-		panic_printk("FATAL: ivshmem MSI-X target outside of "
-			     "cell \"%s\" device %02x:%02x.%x\n",
-			     device->cell->config->name,
-			     PCI_BDF_PARAMS(device->info->bdf));
-		return -EPERM;
+	struct apic_irq_message irq_msg = { .valid = 0 };
+	union x86_msi_vector msi;
+
+	if (enabled) {
+		msi.raw.address = device->msix_vectors[0].address;
+		msi.raw.data = device->msix_vectors[0].data;
+
+		irq_msg = x86_pci_translate_msi(device, 0, 0, msi);
+
+		if (irq_msg.valid &&
+		    !apic_filter_irq_dest(device->cell, &irq_msg)) {
+			panic_printk("FATAL: ivshmem MSI-X target outside of "
+				     "cell \"%s\" device %02x:%02x.%x\n",
+				     device->cell->config->name,
+				     PCI_BDF_PARAMS(device->info->bdf));
+			return -EPERM;
+		}
 	}
-	/* now copy the whole struct into our cache and mark the cache
-	 * valid at the end */
-	irq_msg.valid = 0;
-	ive->arch.irq_msg = irq_msg;
-	memory_barrier();
-	ive->arch.irq_msg.valid = 1;
+
+	/*
+	 * Lock used as barrier, ensuring all interrupts triggered after return
+	 * use the new setting.
+	 */
+	spin_lock(&ive->irq_lock);
+	ive->irq_cache.msg = irq_msg;
+	spin_unlock(&ive->irq_lock);
 
 	return 0;
 }
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index b62564d8..fe641dd0 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -31,14 +31,16 @@ struct ivshmem_link;
 
 struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
+	/** Lock protecting accesses to irq_cache, also synchronizing
+	 * interrupt submissions with device shutdown. */
+	spinlock_t irq_lock;
+	struct arch_ivshmem_irq_cache irq_cache;
 	u32 state;
 	u32 ioregion[2];
 	struct pci_device *device;
 	struct ivshmem_link *link;
 	const struct jailhouse_memory *shmem;
 	struct ivshmem_endpoint *remote;
-	spinlock_t remote_lock;
-	struct arch_pci_ivshmem arch;
 	u32 intx_ctrl_reg;
 };
 
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 8d3dae00..bcc20ed2 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -81,14 +81,18 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 
 static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
 {
+	struct ivshmem_endpoint *remote = ive->remote;
+
+	if (!remote)
+		return;
+
 	/*
-	 * Hold the remote lock while sending the interrupt so that
-	 * ivshmem_exit can synchronize on the completion of the delivery.
+	 * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
+	 * can synchronize on the completion of the delivery.
 	 */
-	spin_lock(&ive->remote_lock);
-	if (ive->remote)
-		arch_ivshmem_trigger_interrupt(ive->remote);
-	spin_unlock(&ive->remote_lock);
+	spin_lock(&remote->irq_lock);
+	arch_ivshmem_trigger_interrupt(remote);
+	spin_unlock(&remote->irq_lock);
 }
 
 static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
@@ -394,6 +398,14 @@ void ivshmem_reset(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 
+	/*
+	 * Hold the spinlock while invalidating in order to synchronize with
+	 * any in-flight interrupt from remote sides.
+	 */
+	spin_lock(&ive->irq_lock);
+	memset(&ive->irq_cache, 0, sizeof(ive->irq_cache));
+	spin_unlock(&ive->irq_lock);
+
 	if (ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MEM) {
 		mmio_region_unregister(device->cell, ive->ioregion[0]);
 		mmio_region_unregister(device->cell, ive->ioregion[1]);
@@ -440,15 +452,16 @@ void ivshmem_exit(struct pci_device *device)
 	struct ivshmem_endpoint *remote = ive->remote;
 	struct ivshmem_link **linkp;
 
+	/*
+	 * Hold the spinlock while invalidating in order to synchronize with
+	 * any in-flight interrupt from remote sides.
+	 */
+	spin_lock(&ive->irq_lock);
+	memset(&ive->irq_cache, 0, sizeof(ive->irq_cache));
+	spin_unlock(&ive->irq_lock);
+
 	if (remote) {
-		/*
-		 * The spinlock synchronizes the disconnection of the remote
-		 * device with any in-flight interrupts targeting the device
-		 * to be destroyed.
-		 */
-		spin_lock(&remote->remote_lock);
 		remote->remote = NULL;
-		spin_unlock(&remote->remote_lock);
 
 		ivshmem_write_state(ive, 0);
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a3830f502e125fe7f08259d8ed2f42d8bd13c425.1578313099.git.jan.kiszka%40siemens.com.
