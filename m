Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3OLZTYAKGQEQEHNX7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B0F1311EB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:58 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id t3sf26259522wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313198; cv=pass;
        d=google.com; s=arc-20160816;
        b=C7OJt/GG3j42F3VMVkJKDThGl/vnKRlxTF6vYk5purTUGM7mTv+Ojic4QBbcv07HIy
         NC9KKJGX2vVk9eX3r/SUcOw7BioK6WLNoaYNt0Ir5b2Dm6xWnj2r47r/55wvB4CYDSv4
         FyPF9zFscruJ+JlqCNhqiJHcnKsf5fUuYVrsVTPJh7tvaUrvpuu8UlCz2xkwbjke7I2k
         mZQrQQ+WuBPg4E2hShrl7seg0EFH37K+7/pgkHznQmWlbVOEXjAqTd3RFS4/p60txNnM
         ybXvycQmTml3NEemZZPpmnQR2f2WR8/s4F1xkOLdv26OECO8ho/F9rknUmzGXVA9VE8/
         WrSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=2eYH2jrH8QIdvisKc0mJPW5380/hm2KV8kfPaUS1XOM=;
        b=pv9WT4nJ3jfPOiLgpZiTWhbW21ZDFKcUTcLEj44dtRRQtGINf+jQ73Y3fiz3JGWQ3G
         VAejnYcvxPsr77bi04rw6dansGxySi+eAK536sSyhurVsBUkzVaIbOVu4jJBNH+54rX+
         BBxwuDC6vWNJUdU4v7uTltXUeyODTVLzhE/z4u0q1fFh8bot4hnRqFB0cy+Vyyy5dmoL
         sDcTq3cFCxsv181QA9UZrZOeJshlCFR1Y5WxyiuP4MKGVcvArwne8XcOeORtUFP2lMQO
         UEoXOP6puWhxHEI09bwyOjfD0F4lx94zN5bMU5BcW6rcr906zYkTCg5Mkba3tvFJFA9J
         k5qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2eYH2jrH8QIdvisKc0mJPW5380/hm2KV8kfPaUS1XOM=;
        b=lUD6fD5EH7CGpu7Jt+eot0hiY9Z7fnyOKjwn7zCViv3WlRdvk87Kxs7OJic87vInPP
         G0IYy+/IYwQDNBORX6AgaVN+HRekQ6YghojbG7Eh5G+lykwnnn+UoDDLKl6jM5M4ZX2g
         jbL9gc39C7tEGxWtVzNahvwwIzfn4i/z0sdFlIvmombBSuuk03bFUstXrECp1UuEQCC9
         c159cRu9ugEbHRBubzfTzeccga2AY18EZhPDZ0BI9+OWNoonZ7OQ6gvIyhAF4nJkrkw+
         t2v/LAtbfNlT+BW4mUx+ntLVV+sadZ4R/Rzc5m6iGejpwQNKbBUhyGGrUr5rBUW17WLE
         wwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2eYH2jrH8QIdvisKc0mJPW5380/hm2KV8kfPaUS1XOM=;
        b=U/T11lxalCjXIpOWsyQF9LM+YDS1cFOKk8CvsVAlEATE3NFQfvfkETFqRpQ/hGGc5T
         dy+6Qp1J6eBEMBwYexjOL6XCKmkwV67Rcau5BELW4Z9lj/awpAlsKKYL8yQgKYZfjoH/
         1u75O31m55q2Uz0eVyqjgiUTr/7SvriSvYMFB0szKfrrzhzM1mz7wXE49cU8G8TMVoqH
         +s5VjKMXJmn+HCnXUyWbyLC/fFg5aGETlAxhzlgcfHUhlHeopRf7q/x3OI0l8QJwPFtx
         dt2MxJotX47OmX9TTwL1OkQgH3vg55tKxP4/KhxenFq43zz7YwyFjkjNd0F8JrmvIjTM
         63Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXzi4UJiTpX1A28DRRLyrSL+H+L3ZQjdIDZMdri31rgYe56Nf/d
	ALLYCnYsZL5t+xiw+9dSJpk=
X-Google-Smtp-Source: APXvYqxXctyB9gcOGxv3Fxf5+GOg88Wv7+c68rkgvnjkqygJWH6NDJx5Gw+3SrZdF0S5CtTUEVhWtw==
X-Received: by 2002:a1c:20d3:: with SMTP id g202mr34845031wmg.169.1578313198028;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7409:: with SMTP id p9ls2279189wmc.4.gmail; Mon, 06 Jan
 2020 04:19:57 -0800 (PST)
X-Received: by 2002:a1c:770e:: with SMTP id t14mr36664638wmi.101.1578313197346;
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313197; cv=none;
        d=google.com; s=arc-20160816;
        b=XTYRLzbxikcAADKBWusXQoS2pZEL4rDCCUFy58m0zhNgVmh2nO5SzzR54mcOR4EAKx
         nuOTJUgH8rQklmv/B1xhCpow7rrhtO29UmRFOcSgnyyBqFxMz9TTr2vIJgQFFCZicgno
         4ZmL3vRp/C8VFIVDjKB4PGVcp5M4LfbQ2rHawrRqDeEUswi5NdqcR71Q76Ns+Wn12tSy
         +zOpIHwCOVeCH3FFMJLStDxsSuJPHNbVhJMLWB4wrVgBlscJiRenU52PHmxsw+AP/M2K
         FYcgEeKkvDZMeYs8Q6cHIKkZuhmA4QsXYDBf5gqDLfx6e1Qbh78zFmtJETVS0bxYLUkn
         cSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=pCgif7h/XzzTWwAgQgjtNmHJMNcOD0VvWBCDv0Zz8dM=;
        b=W8cE1d+GGiMITm/62QFlDupetraCYDENLiBOENyTcRqlg3G4TA+heTydfCyHZ1+0o4
         g/uYXw0yW+7saCXtGPFRC5JWevR8bOwdIbHAPIpVTJ2htAIMv+uO5AS7oEPOgcxfDL8i
         ltOVWDI8s8CVDxljAsGdpGY+wPaC5RP7IhlNk+T/Qt0ehHa02nMEAd70gRQoxxmQFhuh
         +U43/5UPDSlLy4QgBXsb2YUieHBp/39iIFa4p/NM+0Ewly1imogAUd1Zk4O4oj5MpR5F
         nXt9HgCtunmbAIblL8sajFQ0OfPPAXHS7vrA7mxkenCifFLvTMcBowJYfL8L2nS8ttny
         Lhmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y185si537490wmg.0.2020.01.06.04.19.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CJuQt020453
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:57 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEf029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:56 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/38] core: ivshmem: Move MSI-X region into 32-bit BAR1
Date: Mon,  6 Jan 2020 13:17:48 +0100
Message-Id: <7a90de7b67985977ec6c905a6a3ad43232b53f21.1578313099.git.jan.kiszka@siemens.com>
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

Compact the BAR usage and also reduce the MSI-X region to 32-bit again -
there is no need for 64-bit.

As both the MMIO register and the MSI-X region are now 32-bit, convert
their internal representation in ivshmem_endpoint to an u32 array.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/ivshmem.h |  3 +--
 hypervisor/include/jailhouse/pci.h     |  1 -
 hypervisor/ivshmem.c                   | 36 ++++++++++++++++------------------
 include/jailhouse/cell-config.h        |  4 ++--
 4 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 8872876e..59ce2e97 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -32,8 +32,7 @@ struct ivshmem_endpoint {
 	u32 cspace[IVSHMEM_CFG_SIZE / sizeof(u32)];
 	u32 ivpos;
 	u32 state;
-	u64 bar0_address;
-	u64 bar4_address;
+	u32 ioregion[2];
 	struct pci_device *device;
 	const struct jailhouse_memory *shmem;
 	struct ivshmem_endpoint *remote;
diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index 8f14ec7b..f463381d 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -23,7 +23,6 @@
 #define PCI_CFG_STATUS		0x06
 # define PCI_STS_CAPS		(1 << 4)
 #define PCI_CFG_BAR		0x10
-# define PCI_BAR_64BIT		0x4
 #define PCI_CFG_BAR_END		0x27
 #define PCI_CFG_ROMBAR		0x30
 #define PCI_CFG_CAPS		0x34
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 884388ca..15592bab 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -40,18 +40,18 @@
 
 #define IVSHMEM_MSIX_VECTORS	1
 
+/*
+ * Make the region two times as large as the MSI-X table to guarantee a
+ * power-of-2 size (encoding constraint of a BAR).
+ */
+#define IVSHMEM_MSIX_SIZE		(0x10 * IVSHMEM_MSIX_VECTORS * 2)
+
 #define IVSHMEM_REG_INTX_CTRL	0
 #define IVSHMEM_REG_IVPOS	8
 #define IVSHMEM_REG_DBELL	12
 #define IVSHMEM_REG_LSTATE	16
 #define IVSHMEM_REG_RSTATE	20
 
-/*
- * Make the region two times as large as the MSI-X table to guarantee a
- * power-of-2 size (encoding constraint of a BAR).
- */
-#define IVSHMEM_BAR4_SIZE	(0x10 * IVSHMEM_MSIX_VECTORS * 2)
-
 struct ivshmem_data {
 	struct ivshmem_endpoint eps[2];
 	u16 bdf;
@@ -69,8 +69,8 @@ static const u32 default_cspace[IVSHMEM_CFG_SIZE / sizeof(u32)] = {
 	/* MSI-X capability */
 	[IVSHMEM_CFG_MSIX_CAP/4] = (IVSHMEM_MSIX_VECTORS - 1) << 16
 				   | (0x00 << 8) | PCI_CAP_ID_MSIX,
-	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 4,
-	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 4,
+	[(IVSHMEM_CFG_MSIX_CAP + 0x4)/4] = 1,
+	[(IVSHMEM_CFG_MSIX_CAP + 0x8)/4] = 0x10 * IVSHMEM_MSIX_VECTORS | 1,
 };
 
 static void ivshmem_remote_interrupt(struct ivshmem_endpoint *ive)
@@ -210,19 +210,19 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 
 	if ((val & PCI_CMD_MEM) != (*cmd & PCI_CMD_MEM)) {
 		if (*cmd & PCI_CMD_MEM) {
-			mmio_region_unregister(device->cell, ive->bar0_address);
-			mmio_region_unregister(device->cell, ive->bar4_address);
+			mmio_region_unregister(device->cell, ive->ioregion[0]);
+			mmio_region_unregister(device->cell, ive->ioregion[1]);
 		}
 		if (val & PCI_CMD_MEM) {
-			ive->bar0_address = device->bar[0] & ~0xf;
+			ive->ioregion[0] = device->bar[0] & ~0xf;
 			/* Derive the size of region 0 from its BAR mask. */
-			mmio_region_register(device->cell, ive->bar0_address,
+			mmio_region_register(device->cell, ive->ioregion[0],
 					     ~device->info->bar_mask[0] + 1,
 					     ivshmem_register_mmio, ive);
 
-			ive->bar4_address = (*(u64 *)&device->bar[4]) & ~0xfL;
-			mmio_region_register(device->cell, ive->bar4_address,
-					     IVSHMEM_BAR4_SIZE,
+			ive->ioregion[1] = device->bar[1] & ~0xf;
+			mmio_region_register(device->cell, ive->ioregion[1],
+					     IVSHMEM_MSIX_SIZE,
 					     ivshmem_msix_mmio, ive);
 		}
 		*cmd = (*cmd & ~PCI_CMD_MEM) | (val & PCI_CMD_MEM);
@@ -381,8 +381,8 @@ void ivshmem_reset(struct pci_device *device)
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
 
 	if (ive->cspace[PCI_CFG_COMMAND/4] & PCI_CMD_MEM) {
-		mmio_region_unregister(device->cell, ive->bar0_address);
-		mmio_region_unregister(device->cell, ive->bar4_address);
+		mmio_region_unregister(device->cell, ive->ioregion[0]);
+		mmio_region_unregister(device->cell, ive->ioregion[1]);
 	}
 
 	memset(device->bar, 0, sizeof(device->bar));
@@ -398,8 +398,6 @@ void ivshmem_reset(struct pci_device *device)
 			(((device->info->bdf >> 3) & 0x3) + 1) << 8;
 		/* disable MSI-X capability */
 		ive->cspace[PCI_CFG_CAPS/4] = 0;
-	} else {
-		device->bar[4] = PCI_BAR_64BIT;
 	}
 
 	ive->cspace[IVSHMEM_CFG_SHMEM_PTR/4] = (u32)ive->shmem->virt_start;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 78726506..64b59ca2 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -191,8 +191,8 @@ struct jailhouse_pci_device {
 
 #define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX			\
 	{						\
-		0xfffff000, 0x00000000, 0x00000000,	\
-		0x00000000, 0xffffffe0, 0xffffffff,	\
+		0xfffff000, 0xffffffe0, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
 	}
 
 #define JAILHOUSE_PCI_EXT_CAP		0x8000
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7a90de7b67985977ec6c905a6a3ad43232b53f21.1578313099.git.jan.kiszka%40siemens.com.
