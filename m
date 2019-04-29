Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPXTLTAKGQEKZELSBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id E099BDE75
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:53 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id u19sf11214318wmj.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528093; cv=pass;
        d=google.com; s=arc-20160816;
        b=hsv6uDob1UHrT1poxV/qht6Bg65W742KRs9i97et13CpcMvwrYPbJEEYqiyH99BWxI
         aZXf05vcI6tXuKgkN6Ia2FjgOKE3WRLXmFvz0N0f8ZN8WVDZ4kDdCHO0A8TlzmXGK6yc
         /6FG1zTx0Eugym9YfB771FSqsgybfkUaHSKzqqvUeyDEHyNiCPtVzFh+kpak4UwUFMIe
         ZOmMoZxbWovR/1k46sTVkvbeYvJ+tVH5KratkPrqr1IwavBS4FzI9UxYNYyLi8KC/ZWA
         9qnlj3YLXV+1Vw7ISL8xaLsgESlub/62z3KDdjUmuXwdPjVnTxbJvYkcJUXKi9sY5diP
         jBjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=dts+FuE548V8rsn1gJr+5GZSwrqCwdrhHYePKDhXZ+k=;
        b=Xj14wLrVxGSMkqVfsx8nfCQawJUgQ1PwxrWz03WDdqDj+QJJQYRGuQzknybL6gPwSx
         TxPSP4KTKjh6MDNeqqQdUOxCN2dgBTdvAB9DK9iDl/rT1lUfBXOe3coRZZqmBpxFi7bk
         EQ1wfXoNgJJzh1b7ivDuX+HM1td+K9LhbaqVkRjikl9CaxsKAczDQUPj/Em1BCANqkB/
         NsqTJ5r+U3NryXQS2jpIMZ3G54FUI9/kWZKHiG7Ia3NIkKdYDDSe511LxjMwcsYHuzz/
         ycm0eKBz4eVL8aAUIbJigbIz6ygGemyOsOitA4vZPZ/ET7X+3w102JWIzJ/KxPPdhb5D
         Ia4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dts+FuE548V8rsn1gJr+5GZSwrqCwdrhHYePKDhXZ+k=;
        b=Zi1orUUtHn9I9veuKudgeHWlLpvozf+B2kxBb24tiO8XFShbu2w2iocqSfZxgN7rwY
         uWSUhX5t5OR4IfwVbpNfMzWKCtQKqrB5HuNhiMmc2xkk75d261RZRT2QvS11rI4K4hJH
         oOMbx66vLgaNW9Xg/8+bsH6YIDsBGOQsC5Hj6vVCsZh5ifcWhei3A74yNBqIKrxG+h6f
         WorCjaIzilHyxl1e2R8lhZLT1bvTgARdZ6iiX8p5Aj/O8SsPTDhKUplSJC/uJT99FA1g
         InDscUlxFUscpYHn1xYnATSCEtbulDBnI9FzVJHHkEADy1O+O432l1ml/tQOpIe+tjQL
         VCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dts+FuE548V8rsn1gJr+5GZSwrqCwdrhHYePKDhXZ+k=;
        b=I75wQvyaucmbXQfDxw1bH+38KDwskj5ouXHeWqSLx942HH5oOmlgrGrOsD8jjhywMo
         iObp9Hq1+TGrPHdS53UbDVTACPV2U1qnxhR3JN/ehOyBPQCCThgt+hlCxywEYV3P3iDj
         RHa5Bhy7aWkDZoaMQyM5b+o3YPje+ZDZgD7Y/+pK5zB64bGeAdegmSQ299/yBKiG8qtf
         CMwnt/u25ID+U1HNT/l/hO4yVGwuHlyX2ghELcALsUgspNuJOutzDIv+EL5zUrYBEUzS
         c4YnQyj2Yf7fpOjDz6gk+Keqnd2hj/y/77mbq0WSN7GLnlJHVrK9i1JcwE/Gc+8wrKSZ
         urBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVu29PNYhy6hvPkU70kFbyDlPKgkJ8uYPpHXERtn3eP4PitSgXG
	S/d3t3AB7GJf9aHGvTeIvRI=
X-Google-Smtp-Source: APXvYqwsg2e9sQXiEy+g4h9jPCm9ux63JfAx4egmmGXKRpQEO/BpIr27tZAc75jhWG2z6lOOp88R6w==
X-Received: by 2002:a1c:701a:: with SMTP id l26mr6961903wmc.50.1556528093636;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe11:: with SMTP id n17ls286673wrr.4.gmail; Mon, 29 Apr
 2019 01:54:53 -0700 (PDT)
X-Received: by 2002:adf:f78e:: with SMTP id q14mr11670720wrp.100.1556528093085;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528093; cv=none;
        d=google.com; s=arc-20160816;
        b=K3jHq5D1TAgO0KIhdCnQ+hBjaW7wao1a61gMqIp16N4e+xZ0dBG8ZChIMQMgHJ3Xcc
         IEexVbxNDllTyfrLT4u8H4nwUvisp0GlYqY/XXgwv7oDpMA3+d8k7FcDQILvFrHCbcWG
         ice+4zz2dX6EkSgn2+rNXX3Z1qwTbM9Xiqg5R6O7j13CjXlSsSQ/D+M62pfgy/xTWZvV
         YVT1d0BFWlXmXKAdR+eTIDaFIjG8uVipbd5QATS8VJ7s1uOUZz6y6wPPQtzPIdzWkE4U
         qgML9BaQ0u9hgOLFFKbKVzrdwhiAeszXBJMvZqlw1MQfvgM17afMUUjYCqdcH2vtiFsJ
         aggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=kal/VAfBQKcnzenRgtYnr3qQHSz2Btvs1tGy8PH4HYA=;
        b=Vg+rkEhfvhcEjEKY1w7fWjmfDJ/Fk0D05FMO+X8F4nudCv/QZ6In5cPE0HLFPxYR+r
         uwoZd7CxYOt8vcr37dwmW+emtrhr7Ol7yOyOYEGTfPb1JU9KcTB8t8QXw/2bNkgmywmP
         GjNw/zOB+mD9AXj3M06bfavgn5ugTMKifSc2dYNMD6eb/LRzNZ1pGGO3+RLhL6qjLKpW
         h5qMYx53XLYkmMJzXCQJ6DX13ffcq5stO2xATypAyce/6YWhmVc3n56iiuSnBx+MdxPs
         UoAqp9iq4V3TPFxF3Zprp8NnoEYCphaNo7AvnB9UrkjuAMgEfF7RClJjsfAOWAsMNJmn
         bCIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f1si85893wme.1.2019.04.29.01.54.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8sqdq005203
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo7013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/6] pci: Call arch_pci_suppress_msi also on re-enabling
Date: Mon, 29 Apr 2019 10:54:47 +0200
Message-Id: <699f4de9a0dd844d981a0ff869b3d725511eb54c.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

This will allow to move the injection to the end of the suppression
phase.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/pci.c   |  3 ++-
 hypervisor/arch/x86/pci.c          | 39 +++++++++++++++++++++-----------------
 hypervisor/include/jailhouse/pci.h |  6 ++++--
 hypervisor/pci.c                   |  5 ++++-
 4 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-common/pci.c
index b9841c8e..60ffabb8 100644
--- a/hypervisor/arch/arm-common/pci.c
+++ b/hypervisor/arch/arm-common/pci.c
@@ -32,7 +32,8 @@ void arch_pci_remove_physical_device(struct pci_device *device)
 }
 
 void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap)
+			   const struct jailhouse_pci_capability *cap,
+			   bool suppressed)
 {
 }
 
diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index 86c5633c..c557aabc 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -283,7 +283,8 @@ x86_pci_translate_msi(struct pci_device *device, unsigned int vector,
 }
 
 void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap)
+			   const struct jailhouse_pci_capability *cap,
+			   bool suppressed)
 {
 	unsigned int n, vectors = pci_enabled_msi_vectors(device);
 	const struct jailhouse_pci_device *info = device->info;
@@ -297,23 +298,27 @@ void arch_pci_suppress_msi(struct pci_device *device,
 	if (!(pci_read_config(info->bdf, PCI_CFG_COMMAND, 2) & PCI_CMD_MASTER))
 		return;
 
-	/*
-	 * Disable delivery by setting no destination CPU bit in logical
-	 * addressing mode.
-	 */
-	if (info->msi_64bits)
-		pci_write_config(info->bdf, cap->start + 8, 0, 4);
-	pci_write_config(info->bdf, cap->start + 4, (u32)msi.raw.address, 4);
+	if (suppressed) {
+		/*
+		 * Disable delivery by setting no destination CPU bit in logical
+		 * addressing mode.
+		 */
+		if (info->msi_64bits)
+			pci_write_config(info->bdf, cap->start + 8, 0, 4);
+		pci_write_config(info->bdf, cap->start + 4,
+				 (u32)msi.raw.address, 4);
 
-	/*
-	 * Inject MSI vectors to avoid losing events while suppressed.
-	 * Linux can handle rare spurious interrupts.
-	 */
-	msi = pci_get_x86_msi_vector(device);
-	for (n = 0; n < vectors; n++) {
-		irq_msg = x86_pci_translate_msi(device, n, vectors, msi);
-		if (irq_msg.valid)
-			apic_send_irq(irq_msg);
+		/*
+		 * Inject MSI vectors to avoid losing events while suppressed.
+		 * Linux can handle rare spurious interrupts.
+		 */
+		msi = pci_get_x86_msi_vector(device);
+		for (n = 0; n < vectors; n++) {
+			irq_msg = x86_pci_translate_msi(device, n, vectors,
+							msi);
+			if (irq_msg.valid)
+				apic_send_irq(irq_msg);
+		}
 	}
 }
 
diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index c1dd69f2..0429d520 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -210,12 +210,14 @@ int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device);
 void arch_pci_remove_physical_device(struct pci_device *device);
 
 /**
- * Avoid MSI vector delivery of a given device.
+ * Avoid MSI vector delivery of a given device or re-enable it.
  * @param device	Device to be silenced.
  * @param cap		MSI capability of the device.
+ * @param suppressed	True to disable delivery, false to allow it again.
  */
 void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap);
+			   const struct jailhouse_pci_capability *cap,
+			   bool suppressed);
 
 /**
  * Update MSI vector mapping for a given device.
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 89b35382..e04d4c58 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -528,7 +528,7 @@ void pci_prepare_handover(void)
 			continue;
 		for_each_pci_cap(cap, device, n) {
 			if (cap->id == PCI_CAP_MSI)
-				arch_pci_suppress_msi(device, cap);
+				arch_pci_suppress_msi(device, cap, true);
 			else if (cap->id == PCI_CAP_MSIX)
 				pci_suppress_msix(device, cap, true);
 		}
@@ -807,6 +807,9 @@ void pci_config_commit(struct cell *cell_added_removed)
 		for_each_pci_cap(cap, device, n) {
 			if (cap->id == PCI_CAP_MSI) {
 				err = arch_pci_update_msi(device, cap);
+				if (device->cell == &root_cell)
+					arch_pci_suppress_msi(device, cap,
+							      false);
 			} else if (cap->id == PCI_CAP_MSIX) {
 				err = pci_update_msix(device, cap);
 				if (device->cell == &root_cell)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
