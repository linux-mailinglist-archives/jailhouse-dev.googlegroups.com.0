Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5GLZTYAKGQE472SQ7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id C632F131201
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:04 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id c2sf7680478edx.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313204; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vy9Y+/Z4uC9IQRKnPWB0IyAqgF5AbM3s0x/hVYUUVHLDWya647Q9D0yXRj4aUa83wU
         nRHjtWdvyHKJyMLzLhs9qZQesRNQbrpSuwCUnDwrgONIlPHzZbRmntQ3vkyp39+AA0M6
         lXmmHSkxhbO06V9usXQcKeelkgUjjYeGGivHzPKBRyCBBmu0hpDIaONsq9FScyxrv8AZ
         PT0zI/RP2H3T7z108QzN9cPL3InsrLO7qIZPrbVRBpfeAkjQq7txZDDFNTtapVLZk+dO
         h7EMHi4lzPTg3jwOr7On6FsHG0t5qOfS48sKxqUWa2gZLTMnPSXacmnG9TVmOxTBkKLX
         kLRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=TwWOGaGj4hfJRLWZI3hWhkgYMJGYAVfcqsnxD4Df7UQ=;
        b=rV0ypncBREkS6M0E9hLZm4+pg0dn+e1rXY+t6hsW3N+WFs8cYnf3rxOhe5MbNn1w9U
         7PRf6YZIhfIbfx6q7P9CRlDLy7MHnz3J5MK+ic3QIQIRdTaKNgIY/nqs77EvcfO8ls2k
         cu5nWWxcTmSbXUf2DfLN4HgbNl0B8T9ydpxugKqu8MBJaDB5AxG1JA0RB1M2BlFqnurD
         3Psq2n1NjndeeB4G005Jd8LQxPv2eZpTaYF59F3e6YhPr8jbRLSsMNrZSmrLkj3IN4YZ
         XNOKRsmxquMs8qspkLjKa9U8QmrMtfAztnwspB8oCaltB8XJzJo3dg1F6FCzSJdbko8Q
         e3/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TwWOGaGj4hfJRLWZI3hWhkgYMJGYAVfcqsnxD4Df7UQ=;
        b=AtBZAGHcbupyzterkMaUYQUhyyCGrKImDkFnciDkf3ALUkWqA1VX6DujeYJcClCraa
         aDcBwJiqNBbzyJCCL48NOj+cqeeyIHmU6fufBJ4wqEQ2D6LIQPt1kPlzpRyzV9GQS4jj
         u4gRgECiBQuMVxWFbAmZlUIL1Ko3uF4ybHZNz+HGNA2TRLq9K2GBM6jozmSoY3phZ6qs
         Vv3xdPBf4DhC7uCgjU46KGnYrwr1FqboQfP45v2QuoYAjtS1seqU3NatNO+FBB8LMpi+
         qlA9y0UUincIhL8olvzU/9tyRvgeVlrLcbUh2+vAIKmhS2Hz0XD47E3RIPPQgvAvZHcx
         13EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TwWOGaGj4hfJRLWZI3hWhkgYMJGYAVfcqsnxD4Df7UQ=;
        b=HR3WozeTPsvWXUvf0d7dqpeNUP8Pw0ckSCU7eT75uEij8hL+0gpU0DIUHcz5dlfUrZ
         MnFepUzXe23NqQkhGnEe4O9hCwMkxB4HoylFMkm/e+mhmb6LtjNgq7NcnXmIAwErDoNU
         /hhyOyDaK2W2Uci5gGPKaJ1994/bLMB1vzCgLNi2Tdy3IJJiKEHm6EF1O5ZOF4ZMq7+e
         so/G0EJoHNvm6hWpz2NXM4JzPZtIfAkghq4UV+P2sT2mseC43mG9IIxrhsS7ZSOKpBhj
         Jp5yK8OcGgQTlTcmfwPeZyl7I0lhMzmmKpH3e2jWuw0FS2Z9Y2QnUJof0m+2XCSHNROx
         0hHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUT2ewHpn3G0hLxYhOhcYCim5H76XuiASnfxfWtUt9/VyTjSGpq
	VAWi1uXtPv49eozdItIvcn4=
X-Google-Smtp-Source: APXvYqxNySqOPtRuHKE9PucGUxUYnEGp3mfHuz5vSEPyWbjobX9HGbsbLjBZE59iyrmcqvv/KX/5+w==
X-Received: by 2002:a05:6402:1611:: with SMTP id f17mr106345698edv.266.1578313204454;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:897:: with SMTP id e23ls13993549edy.12.gmail; Mon,
 06 Jan 2020 04:20:03 -0800 (PST)
X-Received: by 2002:a50:fb96:: with SMTP id e22mr106487664edq.18.1578313203688;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313203; cv=none;
        d=google.com; s=arc-20160816;
        b=naTdBuTHUOm5/dn3F3Mch22n/IVq5Vj5o2TWOcCEyOzhJcg/c0vZmJ+oPk3LnYxSHb
         auMjT7wdspuD8Hkt7FZkz+UcbKT8CbTKuq7rBJJuI0N8MYVyGDBekrguR1NNhbXTdiFL
         KNrt5iU43O7jcUwRWL4j2Y+2/5Vm8Rw1ONNk1xz2PJ2jpoI7QE9EUCXO0QWdgG6xvVB7
         ejMJwt1F2RecmxMICpjlwmO/sjHDJsXAC2CZJ/bta30QinYYKFtO7Bionh1DZtoUg87Z
         uJHj7n3FH+Y0LffzKEgqRQ2xl7v2nYXwOrg2OC2xNwMNHJ6896pzRlq8b5gPvwn6ggn+
         gUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=J4WVyl8MVsdBVu/w75m/XkCwfgtNT5Nj3eHawVt3TnM=;
        b=Jn7rdM9Cae+88n1P5aw3dIpERP6vFtXOJuqLqX2q4CViudrf4KNVqjQDmaFpJbX0Hi
         akwaB1fJunwhowIM3b5EjjWdz5t6tRwd3g2mHhPnMDYTAzC0Qf5mxnNDM9qtd//qoKy6
         aWzH7Ki+rBrcfa/78329gKC4hOPyzrzZ49cx0bhUV2NQ2YSvc1rjOh3S6yqi2go6oiQk
         um6/Cd3fWdjDAJRgK/5GWPgzRDyi6aEGocksdoT5RXqse4RxCuXNjEfg9LU16d8HqeNL
         1ZxfOdxUTTq1I1wh6xTmEHoy8eTRhtwTGfapQZVkF5+WR0Ppgt4H52j9NNjEi11q2Y09
         7qCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id n21si2535569eja.0.2020.01.06.04.20.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK3Th025164
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF3029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 29/38] core: ivshmem: Add support for multiple interrupt vectors
Date: Mon,  6 Jan 2020 13:18:10 +0100
Message-Id: <f7c7a2364a12366c7e6aaa3af49217646221e36a.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

The MSI-X MMIO region is expanded to hold the maximum possible number of
vectors (currently 16). This static sizing keeps the hypervisor simple.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/ivshmem.h |  2 +-
 hypervisor/arch/arm-common/ivshmem.c             | 14 +++---
 hypervisor/arch/x86/include/asm/ivshmem.h        |  2 +-
 hypervisor/arch/x86/ivshmem.c                    | 18 ++++---
 hypervisor/arch/x86/vtd.c                        |  2 +-
 hypervisor/include/jailhouse/ivshmem.h           | 16 ++++--
 hypervisor/ivshmem.c                             | 63 +++++++++++++++++-------
 include/jailhouse/cell-config.h                  |  2 +-
 8 files changed, 79 insertions(+), 40 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/ivshmem.h b/hypervisor/arch/arm-common/include/asm/ivshmem.h
index a6ff33df..655ad704 100644
--- a/hypervisor/arch/arm-common/include/asm/ivshmem.h
+++ b/hypervisor/arch/arm-common/include/asm/ivshmem.h
@@ -11,5 +11,5 @@
  */
 
 struct arch_ivshmem_irq_cache {
-	u16 id;
+	u16 id[IVSHMEM_MSIX_VECTORS];
 };
diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index d9622c39..98206f05 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -13,22 +13,24 @@
 #include <jailhouse/ivshmem.h>
 #include <asm/irqchip.h>
 
-void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
+void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
+				    unsigned int vector)
 {
-	unsigned int irq_id = ive->irq_cache.id;
+	unsigned int irq_id = ive->irq_cache.id[vector];
 
 	if (irq_id)
 		irqchip_set_pending(NULL, irq_id);
 }
 
-int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive,  bool enabled)
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
+			     bool enabled)
 {
 	struct pci_device *device = ive->device;
 	unsigned int irq_id = 0;
 
 	if (enabled) {
 		/* FIXME: validate MSI-X target address */
-		irq_id = device->msix_vectors[0].data;
+		irq_id = device->msix_vectors[vector].data;
 		if (irq_id < 32 || !irqchip_irq_in_cell(device->cell, irq_id))
 			return -EPERM;
 	}
@@ -38,7 +40,7 @@ int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive,  bool enabled)
 	 * use the new setting.
 	 */
 	spin_lock(&ive->irq_lock);
-	ive->irq_cache.id = irq_id;
+	ive->irq_cache.id[vector] = irq_id;
 	spin_unlock(&ive->irq_lock);
 
 	return 0;
@@ -54,7 +56,7 @@ void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 	 * use the new setting.
 	 */
 	spin_lock(&ive->irq_lock);
-	ive->irq_cache.id = enabled ?
+	ive->irq_cache.id[0] = enabled ?
 		(32 + device->cell->config->vpci_irq_base + pin - 1) : 0;
 	spin_unlock(&ive->irq_lock);
 }
diff --git a/hypervisor/arch/x86/include/asm/ivshmem.h b/hypervisor/arch/x86/include/asm/ivshmem.h
index bf9e61f0..69662b70 100644
--- a/hypervisor/arch/x86/include/asm/ivshmem.h
+++ b/hypervisor/arch/x86/include/asm/ivshmem.h
@@ -13,5 +13,5 @@
 #include <asm/apic.h>
 
 struct arch_ivshmem_irq_cache {
-	struct apic_irq_message msg;
+	struct apic_irq_message msg[IVSHMEM_MSIX_VECTORS];
 };
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index 51d63db9..62c1808e 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -17,23 +17,25 @@
 #include <jailhouse/printk.h>
 #include <asm/pci.h>
 
-void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
+void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
+				    unsigned int vector)
 {
-	if (ive->irq_cache.msg.valid)
-		apic_send_irq(ive->irq_cache.msg);
+	if (ive->irq_cache.msg[vector].valid)
+		apic_send_irq(ive->irq_cache.msg[vector]);
 }
 
-int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, bool enabled)
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
+			     bool enabled)
 {
 	struct apic_irq_message irq_msg = { .valid = 0 };
 	struct pci_device *device = ive->device;
 	union x86_msi_vector msi;
 
 	if (enabled) {
-		msi.raw.address = device->msix_vectors[0].address;
-		msi.raw.data = device->msix_vectors[0].data;
+		msi.raw.address = device->msix_vectors[vector].address;
+		msi.raw.data = device->msix_vectors[vector].data;
 
-		irq_msg = x86_pci_translate_msi(device, 0, 0, msi);
+		irq_msg = x86_pci_translate_msi(device, vector, 0, msi);
 
 		if (irq_msg.valid &&
 		    !apic_filter_irq_dest(device->cell, &irq_msg)) {
@@ -50,7 +52,7 @@ int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, bool enabled)
 	 * use the new setting.
 	 */
 	spin_lock(&ive->irq_lock);
-	ive->irq_cache.msg = irq_msg;
+	ive->irq_cache.msg[vector] = irq_msg;
 	spin_unlock(&ive->irq_lock);
 
 	return 0;
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 8065d8fe..377aa00d 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -400,7 +400,7 @@ static int vtd_emulate_inv_int(unsigned int unit_no, unsigned int index)
 	device = pci_get_assigned_device(&root_cell, irte_usage->device_id);
 	/* On x86, ivshmem devices only support MSI-X. */
 	if (device && device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM)
-		return ivshmem_update_msix(device);
+		return ivshmem_update_msix_vector(device, irte_usage->vector);
 
 	irq_msg = iommu_get_remapped_root_int(unit_no, irte_usage->device_id,
 					      irte_usage->vector, index);
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 5de45e73..aa5472ac 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -15,9 +15,12 @@
 #define _JAILHOUSE_IVSHMEM_H
 
 #include <jailhouse/pci.h>
-#include <asm/ivshmem.h>
 #include <asm/spinlock.h>
 
+#define IVSHMEM_MSIX_VECTORS	PCI_EMBEDDED_MSIX_VECTS
+
+#include <asm/ivshmem.h>
+
 #define IVSHMEM_CFG_SIZE	0x80
 
 #define IVSHMEM_INTX_ENABLE	0x1
@@ -47,6 +50,7 @@ struct ivshmem_endpoint {
 int ivshmem_init(struct cell *cell, struct pci_device *device);
 void ivshmem_reset(struct pci_device *device);
 void ivshmem_exit(struct pci_device *device);
+int ivshmem_update_msix_vector(struct pci_device *device, unsigned int vector);
 int ivshmem_update_msix(struct pci_device *device);
 enum pci_access ivshmem_pci_cfg_write(struct pci_device *device,
 				      unsigned int row, u32 mask, u32 value);
@@ -56,17 +60,21 @@ enum pci_access ivshmem_pci_cfg_read(struct pci_device *device, u16 address,
 /**
  * Trigger interrupt on ivshmem endpoint.
  * @param ive		Ivshmem endpoint the interrupt should be raised at.
+ * @param vector	Interrupt vector to trigger.
  */
-void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive);
+void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
+				    unsigned int vector);
 
 /**
- * Update cached MSI-X state (if any) of the given ivshmem device.
+ * Update cached MSI-X state (if any) of the given ivshmem device and vector.
  * @param ive		Ivshmem endpoint to be updated.
+ * @param vector	Interrupt vector to update.
  * @param enabled	True if MSI-X is enabled and unmasked.
  *
  * @return 0 on success, negative error code otherwise.
  */
-int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, bool enabled);
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
+			     bool enabled);
 
 /**
  * Update cached INTx state (if any) of the given ivshmem device.
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 293dedc5..46a18d0d 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -43,8 +43,6 @@
 #define IVSHMEM_CFG_SHMEM_ADDR		(IVSHMEM_CFG_VNDR_CAP + 0x18)
 #define IVSHMEM_CFG_VNDR_LEN		0x20
 
-#define IVSHMEM_MSIX_VECTORS	1
-
 /*
  * Make the region two times as large as the MSI-X table to guarantee a
  * power-of-2 size (encoding constraint of a BAR).
@@ -73,20 +71,20 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	[PCI_CFG_CAPS/4] = IVSHMEM_CFG_VNDR_CAP,
 	[IVSHMEM_CFG_VNDR_CAP/4] = (IVSHMEM_CFG_VNDR_LEN << 16) |
 				(IVSHMEM_CFG_MSIX_CAP << 8) | PCI_CAP_ID_VNDR,
-	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16 |
-				   (0x00 << 8) | PCI_CAP_ID_MSIX,
+	[IVSHMEM_CFG_MSIX_CAP/4] = (0x00 << 8) | PCI_CAP_ID_MSIX,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 1,
 	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 1,
 };
 
-static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
+static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
+				      unsigned int vector)
 {
 	/*
 	 * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
 	 * can synchronize on the completion of the delivery.
 	 */
 	spin_lock(&ive->irq_lock);
-	arch_ivshmem_trigger_interrupt(ive);
+	arch_ivshmem_trigger_interrupt(ive, vector);
 	spin_unlock(&ive->irq_lock);
 }
 
@@ -113,25 +111,33 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 		ive->state = new_state;
 
 		target_ive = &ive->link->eps[dev_info->shmem_dev_id ^ 1];
-		ivshmem_trigger_interrupt(target_ive);
+		ivshmem_trigger_interrupt(target_ive, 0);
 	}
 }
 
-int ivshmem_update_msix(struct pci_device *device)
+int ivshmem_update_msix_vector(struct pci_device *device, unsigned int vector)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	union pci_msix_registers cap;
 	bool enabled;
 
-	if (device->info->num_msix_vectors == 0)
-		return 0;
-
 	cap.raw = ive->cspace[IVSHMEM_CFG_MSIX_CAP/4];
 	enabled = cap.enable && !cap.fmask &&
-		!ive->device->msix_vectors[0].masked &&
+		!device->msix_vectors[vector].masked &&
 		ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MASTER;
 
-	return arch_ivshmem_update_msix(ive, enabled);
+	return arch_ivshmem_update_msix(ive, vector, enabled);
+}
+
+int ivshmem_update_msix(struct pci_device *device)
+{
+	unsigned int vector, num_vectors = device->info->num_msix_vectors;
+	int err = 0;
+
+	for (vector = 0; vector < num_vectors && !err; vector++)
+		err = ivshmem_update_msix_vector(device, vector);
+
+	return err;
 }
 
 static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
@@ -147,7 +153,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 					      struct mmio_access *mmio)
 {
 	struct ivshmem_endpoint *target_ive, *ive = arg;
-	unsigned int target;
+	unsigned int num_vectors, vector, target;
 
 	switch (mmio->address) {
 	case IVSHMEM_REG_ID:
@@ -168,13 +174,26 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		break;
 	case IVSHMEM_REG_DOORBELL:
 		if (mmio->is_write) {
+			/*
+			 * All peers have the same number of MSI-X vectors,
+			 * thus we can derive the limit from the local device.
+			 */
+			num_vectors = ive->device->info->num_msix_vectors;
+			if (num_vectors == 0)
+				num_vectors = 1; /* INTx means one vector */
+
+			vector = GET_FIELD(mmio->value, 15, 0);
+			/* ignore out-of-range requests */
+			if (vector >= num_vectors)
+				break;
+
 			target = GET_FIELD(mmio->value, 31, 16);
 			if (target >= IVSHMEM_MAX_PEERS)
 				break;
 
 			target_ive = &ive->link->eps[target];
 
-			ivshmem_trigger_interrupt(target_ive);
+			ivshmem_trigger_interrupt(target_ive, vector);
 		} else {
 			mmio->value = 0;
 		}
@@ -195,6 +214,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 
 static enum mmio_result ivshmem_msix_mmio(void *arg, struct mmio_access *mmio)
 {
+	unsigned int vector = mmio->address / sizeof(union pci_msix_vector);
 	struct ivshmem_endpoint *ive = arg;
 	u32 *msix_table = (u32 *)ive->device->msix_vectors;
 
@@ -211,9 +231,11 @@ static enum mmio_result ivshmem_msix_mmio(void *arg, struct mmio_access *mmio)
 		}
 	/* MSI-X Table */
 	} else {
+		if (vector >= ive->device->info->num_msix_vectors)
+			goto fail;
 		if (mmio->is_write) {
 			msix_table[mmio->address / 4] = mmio->value;
-			if (ivshmem_update_msix(ive->device))
+			if (ivshmem_update_msix_vector(ive->device, vector))
 				return MMIO_ERROR;
 		} else {
 			mmio->value = msix_table[mmio->address / 4];
@@ -349,7 +371,8 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
 
 	if (dev_info->shmem_regions_start + 2 >
-	    cell->config->num_memory_regions)
+	    cell->config->num_memory_regions ||
+	    dev_info->num_msix_vectors > IVSHMEM_MSIX_VECTORS)
 		return trace_error(-EINVAL);
 
 	for (link = ivshmem_links; link; link = link->next)
@@ -402,6 +425,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 void ivshmem_reset(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
+	unsigned int n;
 
 	/*
 	 * Hold the spinlock while invalidating in order to synchronize with
@@ -430,7 +454,10 @@ void ivshmem_reset(struct pci_device *device)
 		/* disable MSI-X capability */
 		ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &= 0xffff00ff;
 	} else {
-		device->msix_vectors[0].masked = 1;
+		ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] |=
+			(device->info->num_msix_vectors - 1) << 16;
+		for (n = 0; n < device->info->num_msix_vectors; n++)
+			device->msix_vectors[n].masked = 1;
 	}
 
 	ive->cspace[IVSHMEM_CFG_SHMEM_STATE_TAB_SZ/4] = (u32)ive->shmem[0].size;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index da100e18..10ac60f9 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -208,7 +208,7 @@ struct jailhouse_pci_device {
 
 #define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX			\
 	{						\
-		0xfffff000, 0xffffffe0, 0x00000000,	\
+		0xfffff000, 0xfffffe00, 0x00000000,	\
 		0x00000000, 0x00000000, 0x00000000,	\
 	}
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f7c7a2364a12366c7e6aaa3af49217646221e36a.1578313099.git.jan.kiszka%40siemens.com.
