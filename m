Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5GLZTYAKGQE472SQ7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4891311FF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:04 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id n12sf267439edq.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313204; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZyN3bDFJiw2NJHrISwUupwJQoZjk6TvWl1rJDiVoZrjBNtlaq6HZ02AK6l4GIUfSkU
         JNmphdYMo4W1ULKqh+/IKc5lAmMhlfTZi+FvGFCNNb786B1iUC0vRv5Ne0ogfiz9hONm
         CNNb4uwCa2NCdbqiceyuzrUwMO0bOx55YoRt3a53GD0TXDo1nPdDKLNu/ncccOQ7jfQY
         l7DV8fnWgGq0/9LgNULO5szSvYv3+vb8bZ93C2tqpgczX2QyWUocfABV7iOe6cMwo363
         mMPJO5NpCEpXzns0BKk+eGhCc8pim6v576/J7AtS7ugPt7HLVTrF0rhI7BEr/+cXJ62M
         aFjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=rJPy1D8KiyQOhEwEGq6yvLZs1i+w81qddyHmUDQsFdc=;
        b=LoU0o8RYPs48rlfgzPtlprv/vpQ8XJIOiCj8ew67sKzcg6921jukiunB3Zpae6Yp94
         mpj4ZLb3/SFFRSakzuqTJNNl0HSIkHC0GMy8sUqdrig9yXd/ED4YSqbgf5dk5KdD+bzr
         o3jxul8j00cnRUlE+fKpaPm+tvie9jw/ndS93ru/q9z0rz7c7NFsghj1YE1NyP6j9Sxf
         3SVrnnPr/CJ130KbjQK6H12VaLw/+XOLFsz+xP7kZkNDC+u3b6q498gVipooqCvGKij9
         bEDC0/alnlsx7jEAj50lz8j+2mFE6v6+yOk1mwG2BWk1PybgVbV6PP9PeIAfz/L0TTyR
         dOBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rJPy1D8KiyQOhEwEGq6yvLZs1i+w81qddyHmUDQsFdc=;
        b=FeLF+JaoZYMpkrSOsSDpU9NdQYSog3udN9tfTZr0vzoxn6x1k657jSzbupo5fCphax
         WmUd8gWa4zBmIiz3ook26hRN/pBCynidKoeEytO2/tDX+Fqg6UNVr53R/g5+M22bb7KR
         80OiaDA6vHHYZKodOt7SAdPKoUxSEgiBBoQVAt3H1L37P/ux/jvjCysVlX7zqWIPOS4R
         SQiMt9e32bC8pl8yqf6uHU5Q8B6cxBccsqXP8O9wzpq26QNBfyo2+zSbC+jTPE2qwN4H
         oq70NhMh+p69ksCy14jJegUow6yKLcnOMWmQcw1iL2s42f2O7Fc5OvvpM7vwCBNEwFXD
         6j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rJPy1D8KiyQOhEwEGq6yvLZs1i+w81qddyHmUDQsFdc=;
        b=RiiJWpco8+y2lq9msLHaGyqGlpsv7+Y7zkrgJuD74GaEbDu+lVPwdO6fWUBoC0oUfi
         dOSeYa7i3a2hwZQe0t3omFY8/HDMUZk/gYjOrZi6nV4zb9IoANFkKQBPYm4kwEvGCh6W
         RKxG8zYudSnsTvf5EiFIpoZS+3+l281+ZyTXofyGOFGWUU/M/UV8rddYxo+1R7WOOnbe
         QaAtLhjYKgu8wpAucQuyFgvQA2VGf7W/Lbcb74rO/Qk28D0C9eaQJWCCOp7wgTPl91fr
         Bj2QNZSidskk35ANH2x8+9NDx5sA4a+6nirM2Q3p8v3jTm/uzL1Ypr5Rkl92UlURRgP+
         QSwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWxTmP1MYOwQ+qKJCBv4i92ERAiaH8fFFyJZqjFSMU1btvESHJ/
	Z8Oy+OhFXC9Il3yl3ILnI+w=
X-Google-Smtp-Source: APXvYqz1cUhi+LZ+O3QWAbhdWfqGQm0ejLE5yqGbcdL1XP6mTiCdBZEcHKG40CuV+tS6tkdtBF1gTA==
X-Received: by 2002:aa7:c68f:: with SMTP id n15mr106102199edq.112.1578313204179;
        Mon, 06 Jan 2020 04:20:04 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:118d:: with SMTP id uz13ls15482460ejb.0.gmail; Mon,
 06 Jan 2020 04:20:03 -0800 (PST)
X-Received: by 2002:a17:906:7c58:: with SMTP id g24mr108958907ejp.112.1578313203489;
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313203; cv=none;
        d=google.com; s=arc-20160816;
        b=rbzhkGD4LFDuRtzYXeT+zNwcOiRh7um5tIhr1cWp/wQuo4FNF1k4u2ZHAbmr9HheT8
         It5O/nagaNsea3bX83JFimTVJQIgmj6WnLpmGOiCuCgKzwUrvDfClqzptm4e1Tqmwq/X
         6Pev1SvDnNAE5frGqZ4CKqCgz2tBfmdIiYBCBz04YAlJrWA3JGSo3QPp5VXG8AsPVj0e
         ZfZDuufWdn1JwcG2jk40NXdSUJ8JtCre680eivCUu3s1+w+aIQMhlT/c+FtN504gXJdD
         ShcDy1JxZLfb1tPJXpLcbWDh52VHbDOklAG6looBYvDr6cZIjmhNef8LLKb4EjRci6Xa
         qu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=2oxJKDGQ6hKVCO+E3of84OOJENGl+2Bs5LX2lyHuBU0=;
        b=KD1mjWEYMXdrvy/GUIPt4Ec9w0DtLWBnmwt+KioZa2jXNBqM1fol1WxnclkBQlxdiP
         jNd9r0FckH7dAk4xiTNte3+Xe6PyHprIOkf23SfMKBH6YI4fbve5lOV6dJVYxHuNDiR7
         r/loiCQ9YldHLvPvTjgpSYWSQR+2i8jp3PdPlGhHHnuDW1VDtIp9MSdbIpDN71/k5YPZ
         tqC6oNIa+8iHOkiGWNlBe0IZf41IQmKSL9G3Un/vzxXsNFg80bOSFtnheUIHwDK1hNec
         r8MEUBK6wfg8dm8mIOrVedIcYTMPZIqPqk0Jly0mRIudGFAsjc8L3hEHHT9gxXchfb4k
         PCuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id n21si2535568eja.0.2020.01.06.04.20.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK33e025142
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:03 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF2029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 28/38] core: ivshmem: Switch to ivshmem_endpoint as parameter of arch_ivshmem_update_msix
Date: Mon,  6 Jan 2020 13:18:09 +0100
Message-Id: <e3e4b5bfc61f24af31df139b9ba1d3c9f759365a.1578313099.git.jan.kiszka@siemens.com>
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

For the sake of consistency: ivshmem-internal functions should use the
ivshmem_endpoint, external ones pci_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/ivshmem.c   | 4 ++--
 hypervisor/arch/x86/ivshmem.c          | 4 ++--
 hypervisor/include/jailhouse/ivshmem.h | 4 ++--
 hypervisor/ivshmem.c                   | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm-common/ivshmem.c b/hypervisor/arch/arm-common/ivshmem.c
index 986eb2cb..d9622c39 100644
--- a/hypervisor/arch/arm-common/ivshmem.c
+++ b/hypervisor/arch/arm-common/ivshmem.c
@@ -21,9 +21,9 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 		irqchip_set_pending(NULL, irq_id);
 }
 
-int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive,  bool enabled)
 {
-	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
+	struct pci_device *device = ive->device;
 	unsigned int irq_id = 0;
 
 	if (enabled) {
diff --git a/hypervisor/arch/x86/ivshmem.c b/hypervisor/arch/x86/ivshmem.c
index 3692271c..51d63db9 100644
--- a/hypervisor/arch/x86/ivshmem.c
+++ b/hypervisor/arch/x86/ivshmem.c
@@ -23,10 +23,10 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive)
 		apic_send_irq(ive->irq_cache.msg);
 }
 
-int arch_ivshmem_update_msix(struct pci_device *device, bool enabled)
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, bool enabled)
 {
-	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 	struct apic_irq_message irq_msg = { .valid = 0 };
+	struct pci_device *device = ive->device;
 	union x86_msi_vector msi;
 
 	if (enabled) {
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index fe641dd0..5de45e73 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -61,12 +61,12 @@ void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive);
 
 /**
  * Update cached MSI-X state (if any) of the given ivshmem device.
- * @param device	The device to be updated.
+ * @param ive		Ivshmem endpoint to be updated.
  * @param enabled	True if MSI-X is enabled and unmasked.
  *
  * @return 0 on success, negative error code otherwise.
  */
-int arch_ivshmem_update_msix(struct pci_device *device, bool enabled);
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, bool enabled);
 
 /**
  * Update cached INTx state (if any) of the given ivshmem device.
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 72699437..293dedc5 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -131,7 +131,7 @@ int ivshmem_update_msix(struct pci_device *device)
 		!ive->device->msix_vectors[0].masked &&
 		ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MASTER;
 
-	return arch_ivshmem_update_msix(device, enabled);
+	return arch_ivshmem_update_msix(ive, enabled);
 }
 
 static void ivshmem_update_intx(struct ivshmem_endpoint *ive)
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e3e4b5bfc61f24af31df139b9ba1d3c9f759365a.1578313099.git.jan.kiszka%40siemens.com.
