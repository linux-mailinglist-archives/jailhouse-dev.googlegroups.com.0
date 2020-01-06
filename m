Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GLZTYAKGQENO6IEGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DC1311F4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:01 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id w3sf762225edt.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313200; cv=pass;
        d=google.com; s=arc-20160816;
        b=K43v+j/2xlmnVG6mNvcyP691vjqELYG5ew8A7vw2PFQzpDsJrRgb/qwvEjlWe122aK
         TR46yQzpqHyiEnOi+9NmzT/2EjkKNV8dqY+zP1/6dNyp9vaPYpgZUfoT7UoZpsO9Vt8c
         1+mwXTsZ48crq7gkWBVm5XQ00REOmSMVd6eQwBh2xKhw9zz/txYNZZtfDi5rT6dEwygw
         KxmH0+EzRVaIFhFpm34ocv3WQthjLl4VeZhgDd4UuvTFHFVANalgsugrUwkuSt13SUIR
         LulOviRjWHLmyzeftHND0CXe2+GRY3sykh2o+C+w6lqHSg0d2RMpnIUZ7eq6e9gfBo4h
         GOrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=zT5Ga/670AWk++AnkR8XU5NtBbyvOS90nhWczBwyjiU=;
        b=jfYPSnCOe0iO+SUrJmRQfPQYPodWpn5oUHlsGK08G6jP4a8clmJuabZ1JSKRAw6A7N
         G0sbv/H8H+M7eBQP2aDR9CN4jCM/3+hbHZeGMLn8iYBX4u0GkioTN5PrgZ5nT9CiSZ4e
         UJkY0iYxHKmAv6jeZ3dXeJkgEY4eb1y5BiQ8D+FUf/II+GqHAjKpSQ5ovpDlR8bdAmWI
         seIjvemcDk8NKu+z6M6EFPOq2fgijvEJNV+k+MWCI0CC6T3Yavjo7vSPuAbSlEmEicmK
         6hxEZoB/9C+OimtGD1AM81CCcZIUomChgD4JllKqz7nqqnlkjgzk5F811eEfQtJsiREt
         gG3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zT5Ga/670AWk++AnkR8XU5NtBbyvOS90nhWczBwyjiU=;
        b=bAOtgE8wAIYwTY6ABvk2rdksgLGnb128kQISzsFfTf0a6lmLVsYzAAxQGWVplpn7EA
         8qsyY8K5KhiWBqufqbJMLd+ao6aEk/C7ouWmBbUfQJv28hfiyOGRGWBnmY8TSHXjXVN4
         YSqjZtdNSRGCKFba9WdggLPMyEktVLZkSR3+FeNj5ll1iVJboU7cD6Ul7lXgSvP2nBN0
         igktwM03WLFGWPit5ddkVynfidPPTcnkPcwcQDIjkU9rJhM190Uq6A5ePo2oerYL6RtA
         gFJEUJ0TRWiUEJziXE55Sr6Mv9XVhTKP3Ws6J9LJXCz0sJafmIgQgbzBvZxfHiVV8gyT
         1QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zT5Ga/670AWk++AnkR8XU5NtBbyvOS90nhWczBwyjiU=;
        b=QY5rcegET3e6+EuR6s2yvr1KIeEY39nQ5AxessN8o5s6KiKP2uw/sO1WVKVCl8nxKF
         bd9Kw/x1v8oNDtyiRJ6JtdZ31v5k+8qolwOK6rESAkH/yaUN/706de5L9cCVfqPcEpUM
         7lAY1lI/T0wmXChzSbm+plYSMzDgzWZdBnqUf8iDubY/dB8TXCzfPSOqJCO+rTLG52is
         ay8pX2gt9aTm5uIL9LS4NfJx/ta55rtFaAVTKIB0xaGB6MTuT2NmF839FO+GKqi8YYja
         NLuGn8eKjttCZZndBn+hDw5rHfudHTpVFF/55uhOLUtuJNDzc6qJLtcI0aNCw6bMEVJ6
         9iKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUnkEMz7M1fC1ygRvR1kMvFEJZniEtG8AIYpWqFYJNxv4iKcstq
	3vxHtRmwjLbNJHO34CDDNxQ=
X-Google-Smtp-Source: APXvYqwUxpOYUCsE1kO+YJfWitWP2/90gDev8lqbSa1ydELJyL2JdgI1GrFfjcHdQMqA0U0kdnyyIg==
X-Received: by 2002:a17:906:b296:: with SMTP id q22mr50698024ejz.63.1578313200760;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:64c:: with SMTP id u12ls14000485edx.15.gmail; Mon,
 06 Jan 2020 04:20:00 -0800 (PST)
X-Received: by 2002:aa7:d507:: with SMTP id y7mr106015483edq.267.1578313199969;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313199; cv=none;
        d=google.com; s=arc-20160816;
        b=qizDuz5azaWUl8tTRRIQJpkoYnJ0jcyfoNIp7lmouPSwD7j8WRxUtsmkMaps5ZX3Fw
         PwrEq6DTZ2shR43WjnwGPNtVQ+UOkj5iEjAfQl+EF0IgAXgX3ycJ9ZgFr7/UxCCzHGGU
         m9C3cIm3L+1rggG/+6IuvYxQAJbaLZpzjA7DwT+H/Z6LdenoWNXp3DLRslcMIsJyVjuk
         kx/rz8GAjFEmQF1PoFxA4f64hNu+CyS5NZIdN3gEb9vsPaLhkDgz4xxzQ8iTee74hLaX
         oLDOO+StDopRp0Gc3XdrDkgvOerMYqxMngUia8b0V/TOz53UCEozGN7W9spOrHfQIr7L
         m57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=n7A8R1AP9YwxLONBsJfRtyFjlOnF4ExYFqSJa5NwcwI=;
        b=rtIhrQds2QGbrPlfVNoxuYLifU/HzrN/35c9lo+MWLvA3C+qCQvlbZ8MrLiBMqFJFW
         w1oj7Yqd4wPuEtHJETHD8Qrye/WbxVKbjn7LwBVm72D6ym1NC57Zg0K9RgQ0N9JLXKxE
         GWz3YtWMCKiGtxDHWv9U0eV+3TuSAtwVg+QNqY5ehPTtE40K1qlHvn4dqCnJpZUDiHtl
         OfprTHMqHDvtVHFs08u1k7erB22lZBoQSl8hP9NSqgW5joVPsuRbTxvT5Zj2Zi+v8lfY
         ym5oUvBF+3ZGErlmK6b2M3zyAfEfyb4Zvmww4Zcv9ayLA8ICB0jIs98BxtXXIYR++e0H
         cm7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x18si2237399eds.2.2020.01.06.04.19.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJx8k019201
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEo029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 16/38] core: ivshmem: Reintroduce ivshmem_update_msix
Date: Mon,  6 Jan 2020 13:17:57 +0100
Message-Id: <ae9ee963d6994ee2f7093a9b97321d04ec8e0522.1578313099.git.jan.kiszka@siemens.com>
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

This function consolidates the check for num_msix_vectors > 0 and
ivshmem_is_msix_masked, leaving arch_ivshmem_update_msix with less work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/ivshmem.c   |  7 ++---
 hypervisor/arch/x86/ivshmem.c          |  4 +--
 hypervisor/arch/x86/vtd.c              |  2 +-
 hypervisor/include/jailhouse/ivshmem.h |  5 ++--
 hypervisor/ivshmem.c                   | 49 ++++++++++++++--------------------
 hypervisor/pci.c                       |  2 +-
 6 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index ccf49aa5..7b98b6da 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -21,15 +21,12 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 		irqchip_set_pending(NULL, irq_id);
 }
 
-int arch_ivshmem_update_msix(struct pci_device *device)
+int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	unsigned int irq_id = 0;
 
-	if (device->info->num_msix_vectors == 0)
-		return 0;
-
-	if (!ivshmem_is_msix_masked(ive)) {
+	if (enabled) {
 		/* FIXME: validate MSI-X target address */
 		irq_id = device->msix_vectors[0].data;
 		if (irq_id < 32 || !irqchip_irq_in_cell(device->cell, irq_id))
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index c1180012..909b7f8e 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -27,7 +27,7 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 		apic_send_irq(irq_msg);
 }
 
-int arch_ivshmem_update_msix(struct pci_device *device)
+int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	union x86_msi_vector msi = {
@@ -41,7 +41,7 @@ int arch_ivshmem_update_msix(struct pci_device *device)
 	ive->arch.irq_msg.valid = 0;
 	memory_barrier();
 
-	if (ivshmem_is_msix_masked(ive))
+	if (!enabled)
 		return 0;
 
 	irq_msg = x86_pci_translate_msi(device, 0, 0, msi);
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index 2ad7e228..8065d8fe 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -400,7 +400,7 @@ static int vtd_emulate_inv_int(unsigned int unit_no, unsigned int index)
 	device = pci_get_assigned_device(&root_cell, irte_usage->device_id);
 	/* On x86, ivshmem devices only support MSI-X. */
 	if (device && device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM)
-		return arch_ivshmem_update_msix(device);
+		return ivshmem_update_msix(device);
 
 	irq_msg = iommu_get_remapped_root_int(unit_no, irte_usage->device_id,
 					      irte_usage->vector, index);
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index a60d4f0f..acf74834 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -48,8 +48,6 @@ enum pci_access ivshmem_pci_cfg_write(struct pci_device *device,
 enum pci_access ivshmem_pci_cfg_read(struct pci_device *device, u16 address,
 				     u32 *value);
 
-bool ivshmem_is_msix_masked(struct ivshmem_endpoint *ive);
-
 /**
  * Trigger interrupt on ivshmem endpoint.
  * @param ive		Ivshmem endpoint the interrupt should be raised at.
@@ -59,10 +57,11 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive);
 /**
  * Update cached MSI-X state (if any) of the given ivshmem device.
  * @param device	The device to be updated.
+ * @param enabled	True if MSI-X is enabled and unmasked.
  *
  * @return 0 on success, negative error code otherwise.
  */
-int arch_ivshmem_update_msix(struct pci_device *device);
+int arch_ivshmem_update_msix(struct pci_device *device, bool enabled);
 
 /**
  * Update cached INTx state (if any) of the given ivshmem device.
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 0f52e7bd..760163a2 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -91,6 +91,23 @@ static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
 	spin_unlock(&ive->remote_lock);
 }
 
+int ivshmem_update_msix(struct pci_device *device)
+{
+	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
+	union pci_msix_registers cap;
+	bool enabled;
+
+	if (device->info->num_msix_vectors == 0)
+		return 0;
+
+	cap.raw = ive->cspace[IVSHMEM_CFG_MSIX_CAP/4];
+	enabled = cap.enable && !cap.fmask &&
+		!ive->device->msix_vectors[0].masked &&
+		ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MASTER;
+
+	return arch_ivshmem_update_msix(device, enabled);
+}
+
 static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
 {
 	bool enabled = ive->intx_ctrl_reg & IVSHMEM_INTX_ENABLE;
@@ -150,32 +167,6 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 	return MMIO_HANDLED;
 }
 
-/**
- * Check if MSI-X doorbell interrupt is masked.
- * @param ive		Ivshmem endpoint the mask should be checked for.
- *
- * @return True if MSI-X interrupt is masked.
- */
-bool ivshmem_is_msix_masked(struct ivshmem_endpoint *ive)
-{
-	union pci_msix_registers c;
-
-	/* global mask */
-	c.raw = ive->cspace[IVSHMEM_CFG_MSIX_CAP/4];
-	if (!c.enable || c.fmask)
-		return true;
-
-	/* local mask */
-	if (ive->device->msix_vectors[0].masked)
-		return true;
-
-	/* PCI Bus Master */
-	if (!(ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MASTER))
-		return true;
-
-	return false;
-}
-
 static enum mmio_result ivshmem_msix_mmio(void *arg, struct mmio_access *mmio)
 {
 	struct ivshmem_endpoint *ive = arg;
@@ -196,7 +187,7 @@ static enum mmio_result ivshmem_msix_mmio(void *arg, struct mmio_access *mmio)
 	} else {
 		if (mmio->is_write) {
 			msix_table[mmio->address / 4] = mmio->value;
-			if (arch_ivshmem_update_msix(ive->device))
+			if (ivshmem_update_msix(ive->device))
 				return MMIO_ERROR;
 		} else {
 			mmio->value = msix_table[mmio->address / 4];
@@ -222,7 +213,7 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 
 	if ((val & PCI_CMD_MASTER) != (*cmd & PCI_CMD_MASTER)) {
 		*cmd = (*cmd & ~PCI_CMD_MASTER) | (val & PCI_CMD_MASTER);
-		err = arch_ivshmem_update_msix(device);
+		err = ivshmem_update_msix(device);
 		if (err)
 			return err;
 	}
@@ -266,7 +257,7 @@ static int ivshmem_write_msix_control(struct ivshmem_endpoint *ive, u32 val)
 	newval.fmask = p->fmask;
 	if (ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] != newval.raw) {
 		ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] = newval.raw;
-		return arch_ivshmem_update_msix(ive->device);
+		return ivshmem_update_msix(ive->device);
 	}
 	return 0;
 }
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index b1a9613d..0f12e8b7 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -819,7 +819,7 @@ void pci_config_commit(struct cell *cell_added_removed)
 				goto error;
 		}
 		if (device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM) {
-			err = arch_ivshmem_update_msix(device);
+			err = ivshmem_update_msix(device);
 			if (err) {
 				cap = NULL;
 				goto error;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ae9ee963d6994ee2f7093a9b97321d04ec8e0522.1578313099.git.jan.kiszka%40siemens.com.
