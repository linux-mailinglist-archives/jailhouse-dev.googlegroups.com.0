Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIW3YHUAKGQEYLGFGOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73050247
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:28:50 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id n8sf5916086wrx.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:28:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561357730; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZoY53DMfIP8daBxeekZ+AwkH+4zKZQkJB0h4ak6vfXpCFeQBgLEFYfM5ZjCb5kfx+0
         VlA4D4RkWpSD1aMXpJ9HwAZQoj+fOYDG7xaXTULctTIWVwpW8pg6g0qHlIoWeuiKvn2v
         fR3DaJ7O8vqCZHTBbjQC6MT7p4QxnPsjtMhEQJrtnT3oKf/DTFNTtQXVVZ48C+wSpXUN
         5z5I88d09OsTL3+yP9BGS80BWuI1ttuXxpKBvojWf33RkJCuDp9JmJhsF0ngwFsfvXs9
         vht0gbR0HHT/bnnAU9Q0GDmUrtSqZVNmINNh+no2BpesePh6EiVmC6m09zou/kkg5hfg
         g0mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=hw+lHyyZZw7EfpYY2xZqtZX6PFDz+Hj9n8yGOKrLULI=;
        b=vtfbMOa1gQ5xqNb/D6YAVBVGsPc7HYPZD6ge6qZFsiCZYtNRpS9mw5btTqrW96GXJV
         FiE+Kdx9eEDX5TX5uJVNbxTrtwmL+riBnsaULa/ETbS4cRsdGC9x39xQhvpY9AEuLgqQ
         VKA6ihMg1hpKyAc1My2ZHQ/flNjaOEsKZODCnzVizxnFe5yLSIlU/w0O7Sp/2pmpszNC
         tSs3Kq3ikrBPWNWRkmYcz6ZNz6VxN2vK/y0dfqU9ix0vgcO8NEy3vbRQniFsMjmrfC7T
         vVkTwdJCpH0idB6pKdUJ+JhkrI+mhRMjYviDxrESi4G3Dt0P7YD9vZKwCDkvHcVJQOgD
         GXiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hw+lHyyZZw7EfpYY2xZqtZX6PFDz+Hj9n8yGOKrLULI=;
        b=ZEzYCsV/5Wc4opm5XwPOW36aJ9pCIVWtsHT6l27j8HyRgQhIgNqoc7+Ra9mXKr0DhH
         8YGZQnlPsrF0RkRj5w+LpjFqUljdGY0ppbtDW1wK1kFL5fvtCua4l/6oN+ltLsTchiCQ
         elPeb3HDiyZUKtoFd7exLGCHSV1jpz62cJN/67qOGfhrL9rKrAquSNbvzhGvW3hcDFY2
         kIITzxiYfgxF8SzRXJFOhp1PXch/jXJAjvUHrZEKzpRuhFZlaMte9Q75cM5PUn+OtGjo
         sopU+xel6z4EBNa/N3zM9kPdfwt1Cac7HFK3wvJjjsEgmH8UwK03RGMh54I0nvhEQ3Gg
         /vGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hw+lHyyZZw7EfpYY2xZqtZX6PFDz+Hj9n8yGOKrLULI=;
        b=d+uZeQPRGToYemOUldf2sB3D47/uOwVbzTmGxkmBEHd2Jdwp6jsPcmPTDiQRxQl36t
         be41hbzvewrv9CL5lEl1+5nlA3binWmc6cRF25TPvUwiTduJSSU00HpNOwHfFOGlVAnw
         Me4U60vBzD5jfN+39Rs3uy0Zo6CCHBv3ioxB9xBo6SJBJ9LwvQfqPUmoRQ/gGU9fu/7a
         jb/ekxtxBurxrDbJgDOMKNV9pafCBUXihlHM+5+B8W0WozxIc7Ht8bnIDLF8Pva94+Wg
         K9z9j/BtAW4nNBeRcAuvIBVBUm1Q1HZhl/vtiaoV6t+MiUtTictubFOdjrNvh9bznoPq
         bL6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbYJPLBLPVO8rPks3w6e2UVFZY7SrcR2BXIcCxh5nocYbvVqia
	9QYEaws7Gur1wsz6eO4XrE4=
X-Google-Smtp-Source: APXvYqxYkb19dRPPgxiLeDHaiCcfXUuuU095Z7wn8jZdU/CdeuhusVnLIByP304NGgGzYvOF2UoHjw==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr14148933wmd.73.1561357730330;
        Sun, 23 Jun 2019 23:28:50 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls4300411wme.1.gmail; Sun, 23 Jun
 2019 23:28:49 -0700 (PDT)
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr14751129wmc.89.1561357729638;
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561357729; cv=none;
        d=google.com; s=arc-20160816;
        b=rY8EWAYPa0DQfkZCP8CoXhyLANCeKtyOGtvGbbVRROX0UrJBi/W3pabfLxOaOJ7OgW
         wClo5jwuP0MdTwqjKih4AZ+yrHG2q3kLiKeHmH/85T/u1106+I/iCnuNHA4XOwiORpCl
         zEBMwr0DZR9LwG3C4k2v6thfqGGdvDCTaKLUq/iOm292EM8AEMP5OuisGkMhz/Wpvsr7
         mZ3dfqZzlsrU2VLpS/i7MQo35eN+8KCLMgFQYGrdQSOaFXEYkQPCTuMsm+qgNZ6JEOC1
         S4tDvv7FfE9cjKlva3H6Vv20wB4JUbJYWpsJvSeBxrNNxSG1VuRXda33FB0EpAyGpHQc
         7rpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=cM8UmPLQF2IoiYeZd59rVtEZetZObz+hDsQB0uCCcZs=;
        b=DipAMVx3MkO/vYqyWOy+Vdd/3NOu/OooliovIes1reHilhG7EYD6nJgX7CioFEiv45
         xy+6bHQrZdGGb1nBfVT9ONw0raw5CRG4q/zetbj0InkGp/lQrWxg84g4v3Cq5iPgMPYk
         xwdfzCNeM+hMkIXiat36YIspcoRe5EngHwEGs2JDPq2zqcwzCd5ZyX4qHQVjz/CohNgj
         0EknWgw5xggQqxQAQK9bNlYNXbe2IUUEXEdbkVUws06eIfcQA89X3yGKazXMNAxlOaQs
         VFuCj5mcqKiRo2c4eVkJfB2/KXzTXhpMyu9dJth4dvBTxny0tWu6dQO8CYuFHQ05kyzL
         c7jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a1si326571wmb.2.2019.06.23.23.28.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5O6SnIf032674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:49 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5O6SjUa030166
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:48 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/3] core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi
Date: Mon, 24 Jun 2019 08:28:43 +0200
Message-Id: <0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db.1561357723.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
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

As this function both enables and disables the suppression, add a "set"
to its name. Also align the parameter name.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/pci.c   | 6 +++---
 hypervisor/arch/x86/pci.c          | 8 ++++----
 hypervisor/include/jailhouse/pci.h | 8 ++++----
 hypervisor/pci.c                   | 6 +++---
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-common/pci.c
index 4f35175f..8daccee5 100644
--- a/hypervisor/arch/arm-common/pci.c
+++ b/hypervisor/arch/arm-common/pci.c
@@ -31,9 +31,9 @@ void arch_pci_remove_physical_device(struct pci_device *device)
 {
 }
 
-void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap,
-			   bool suppressed)
+void arch_pci_set_suppress_msi(struct pci_device *device,
+			       const struct jailhouse_pci_capability *cap,
+			       bool suppress)
 {
 }
 
diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index 0cbb2f3d..fdd27d19 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -282,9 +282,9 @@ x86_pci_translate_msi(struct pci_device *device, unsigned int vector,
 	return irq_msg;
 }
 
-void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap,
-			   bool suppressed)
+void arch_pci_set_suppress_msi(struct pci_device *device,
+			       const struct jailhouse_pci_capability *cap,
+			       bool suppress)
 {
 	unsigned int n, vectors = pci_enabled_msi_vectors(device);
 	const struct jailhouse_pci_device *info = device->info;
@@ -299,7 +299,7 @@ void arch_pci_suppress_msi(struct pci_device *device,
 	if (!(pci_read_config(info->bdf, PCI_CFG_COMMAND, 2) & PCI_CMD_MASTER))
 		return;
 
-	if (suppressed) {
+	if (suppress) {
 		/*
 		 * Disable delivery by setting no destination CPU bit in logical
 		 * addressing mode.
diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index ea8c1a0b..8f14ec7b 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -210,14 +210,14 @@ void arch_pci_remove_physical_device(struct pci_device *device);
  * Avoid MSI vector delivery of a given device or re-enable it.
  * @param device	Device to be silenced.
  * @param cap		MSI capability of the device.
- * @param suppressed	True to disable delivery, false to allow it again.
+ * @param suppress	True to disable delivery, false to allow it again.
  *
  * @note As events may be lost while a MSI vector is suppressed, re-enabling it
  * may require injecting one event unconditionally.
  */
-void arch_pci_suppress_msi(struct pci_device *device,
-			   const struct jailhouse_pci_capability *cap,
-			   bool suppressed);
+void arch_pci_set_suppress_msi(struct pci_device *device,
+			       const struct jailhouse_pci_capability *cap,
+			       bool suppress);
 
 /**
  * Update MSI vector mapping for a given device.
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 4ab5fea3..b1a9613d 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -528,7 +528,7 @@ void pci_prepare_handover(void)
 			continue;
 		for_each_pci_cap(cap, device, n) {
 			if (cap->id == PCI_CAP_ID_MSI)
-				arch_pci_suppress_msi(device, cap, true);
+				arch_pci_set_suppress_msi(device, cap, true);
 			else if (cap->id == PCI_CAP_ID_MSIX)
 				pci_suppress_msix(device, cap, true);
 		}
@@ -808,8 +808,8 @@ void pci_config_commit(struct cell *cell_added_removed)
 			if (cap->id == PCI_CAP_ID_MSI) {
 				err = arch_pci_update_msi(device, cap);
 				if (device->cell == &root_cell)
-					arch_pci_suppress_msi(device, cap,
-							      false);
+					arch_pci_set_suppress_msi(device, cap,
+								  false);
 			} else if (cap->id == PCI_CAP_ID_MSIX) {
 				err = pci_update_msix(device, cap);
 				if (device->cell == &root_cell)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db.1561357723.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
