Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3GLZTYAKGQEPYI7MRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B31311E8
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:57 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id f10sf18785735wro.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313196; cv=pass;
        d=google.com; s=arc-20160816;
        b=rgcseO69JgtwURgkYHnS/L3RSMvE9Hy5h95Y/DkGqFS4GIDJZa/EEq3+ym9Bl+ddPX
         YDko/F9/QnCdef1boUO7FcR9z/HraopOpi/mVQ/Pml/YwCm8vMXTsb/BXA4UMg/SkTXa
         FhYM3O62Xnjz9ZkwKMpAtkpS65TQysAZvj3W1fo2mZ1Rv8VeWy6SPnK5HAjRImudwtmf
         1y+ipbD2CqGoZxhpmbws6nxi3hThHecTes84j9JibHmewEvg9zdO+pxFEcNJ7+oLizT3
         jOoOIat/YvyYRhhueOxT/POxMcBzWyfx53Uo0HOVYu+tJRI+YZmJ5DLgQ+9KydIYjSGT
         597Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=/u4KBqMZUoCt6avvTmsoQ+0PZZzpFCLRVVt2Z0Eufmc=;
        b=T4yDjxIST70W8LdMRvktnXD8N9/TZcaUrxKNGYKNRKoWXyDOsayLxwVE201HcFIaOz
         ut0V7jTCISWdSPKtcKdCetZOcujqsJH9QSk4TmnuqSh6IwZzfgbHf1MzJZ8EMAMIFysT
         UMTFvFUpl56HxH+FkKxOC33dyO2E9kTuWa/1aznbcbJI60sbECjpaszJOW1UHna/VbP/
         TUJD4KPxDkC3QZ38Qm3Nd79r9le0xtOp2Nh78XnpmE3MU4vATcjqcfh6op6HKzY7lBPh
         R8l6CNEH2rQKXWSCz8Unk0HskxHP7ecL6J4Je7TnF+NDliz8fg5Tg2a/sWmXoktCjn9h
         ujzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/u4KBqMZUoCt6avvTmsoQ+0PZZzpFCLRVVt2Z0Eufmc=;
        b=N5rv6aIah2g+aiXdSKIiSoOcYgTrBmqmH8Z/V5uFijOSPoXqezUTCsCr8EUXUdjpeH
         wWGoo+lL03B/AJkTuChNUTkH0LMrqA40fNshkL8IGHhKyWlxQizuznusV/lrP4Ua3dkZ
         zizLWxsSgxrTKgJE2XfRyEIYZ+r95LJSgCZCJDT7iWAXku2Lmi3hiICcvxiyDK+CmYoS
         9kLKFZZE3oet+DgWh6qEtBzCdGyJ3uGRebMlrEWGQh79/LUs8O0Mhs14AvDv+m+/PjAk
         H5Jj8Urf2WdSyT+xEwSNerr5XZPLfMOS5bbgOF/Hz/R/nXQPjLSaESe/PQJ6YMe0ywJB
         KHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/u4KBqMZUoCt6avvTmsoQ+0PZZzpFCLRVVt2Z0Eufmc=;
        b=gAPfMQECI8Wmy3cgSZVfaPnUv789vpkF0PWfA1Ecn+wXxGWac6Hj2KXnmSfVhpiV3j
         ZCtTkZVSDBJDMBpVtE0yWVpV78EOKn6mSbid8jSQ/BGeHTKUeeUjWmHNZg8TfNaA4BsU
         9GEpSGSV5U/0XN7xp8Xc4y+gYdX3QWrhrVS49KMYB5h6Yi6a3n43rJG6N615q85C5AYZ
         ElXP72LQFZIhmjLN5BzrYV4JjunKJrm7taaTWQl1t3gjYSQN5ArsSuabThWXXHm+1HT8
         l+ZP3OpC68ZrHoAPnhxVB17baJlp0K0O/d8rYC+GKz9P16GhBB3utvF2JdlcPP3g3oop
         WEiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFNWpvODDu2L/Cd3VnJwVJ+Aftj/3UQOXiVUl1/oEtRsis+zBN
	5c1PnNzOSdAbEvLyNb7nkfo=
X-Google-Smtp-Source: APXvYqxkkgzPjqWSXFRB9B74ZKcUeJ3dkRa5avJLumlz/pszEY7inEZuRV5sDQ50LeGdfxqaO+TudQ==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr32175891wmb.17.1578313196712;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls12896992wrs.9.gmail; Mon, 06 Jan
 2020 04:19:56 -0800 (PST)
X-Received: by 2002:a5d:6692:: with SMTP id l18mr109412414wru.382.1578313196029;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313196; cv=none;
        d=google.com; s=arc-20160816;
        b=KjXOMhNSDIkbySvxm6n1W+FrtKtOFbURRdDfFm/U3yLquV+MKJogdElKlHUePVbe/K
         2Pkkf6DfDtsh73hOX+QRz9j5l6FxCWQk+otJYj3EHhcwcjQIbmGgho7KqTn47KkodPjp
         6V77K3iKFRtN5oh1UwFl6m93r5khxp4//hv6Vc4d0+60bryMBqPj2jY9zL96jtGXjSg0
         q2dlH7WEwPAHTAzTGuqT6Iffs9cAgRfoK/ylLIlutrN6ZszGmm/ifGF+VsMmukqMFhVY
         5aKQp50qprBgWezfvuov6rjiQA2C09xJ5aieuHSS3zd3pG5s6nD7uBklNgban8JB8crf
         LmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=rZcWLUzua1AvqPNyC/WdQ+O3mZNLUx3cfvBLNWmHPgM=;
        b=DIUDEpljXbPtD+YfH0IEpFsWMMgmxxu4NOEIy3ugNbq5AShwDH8Ixq1Q4T/PchLYst
         5Iq/Syg8n/zEgDvD4WDt0+bR+ZbIGg1CzbiDaHoC7F80xlFFyG7nLVILJWojN/OqgPRJ
         OcvpsFmjfvfiIuWTZtQeSNEr9+g4NQvfxwE4hixZtCyvFdUUmc0RZfCgPavf/Vi+WjN9
         ryyrYDCYV/B7lnGYsElHRZkxGJFaEJ5UtYHAMDv4moCQklo2ZRa1Ycq458A/RP0FSoHF
         GYXwbnYLm1GrfThQXyg8nUHZikCg+ZOn0CMt4ltRQ1Nh4EsL1QkPqiK+wY7ubWu8K2Oh
         QcSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o139si842717wme.1.2020.01.06.04.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJtSm019111
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEe029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/38] core: ivshmem: Convert MMIO register region to 4K and 32-bit
Date: Mon,  6 Jan 2020 13:17:47 +0100
Message-Id: <deb9716d0eeebe7a4eb04df4e74d59e390dfe1f4.1578313099.git.jan.kiszka@siemens.com>
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

Page-alignment is required so that the cell OS can map the region as a
whole to its user space. If a cell may use larger minimal page sizes,
the mask for BAR 0 has to be adjusted accordingly. For now we assume all
are on 4K.

While at it, reduce the MMIO region to 32-bit which saves one BAR.
64-bit was needlessly wasteful.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c            | 10 ++--------
 include/jailhouse/cell-config.h |  4 ++--
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 0310cb47..884388ca 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -214,12 +214,8 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 			mmio_region_unregister(device->cell, ive->bar4_address);
 		}
 		if (val & PCI_CMD_MEM) {
-			ive->bar0_address = (*(u64 *)&device->bar[0]) & ~0xfL;
-			/*
-			 * Derive the size of region 0 from its BAR mask.
-			 * This reasonably assumes that all unmodifiable bits
-			 * of the BAR, i.e. all zeros, are in the lower dword.
-			 */
+			ive->bar0_address = device->bar[0] & ~0xf;
+			/* Derive the size of region 0 from its BAR mask. */
 			mmio_region_register(device->cell, ive->bar0_address,
 					     ~device->info->bar_mask[0] + 1,
 					     ivshmem_register_mmio, ive);
@@ -392,8 +388,6 @@ void ivshmem_reset(struct pci_device *device)
 	memset(device->bar, 0, sizeof(device->bar));
 	device->msix_registers.raw = 0;
 
-	device->bar[0] = PCI_BAR_64BIT;
-
 	memcpy(ive->cspace, &default_cspace, sizeof(default_cspace));
 
 	ive->cspace[0x08/4] |= device->info->shmem_protocol << 8;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 7ffe84fe..78726506 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -185,13 +185,13 @@ struct jailhouse_pci_device {
 
 #define JAILHOUSE_IVSHMEM_BAR_MASK_INTX			\
 	{						\
-		0xffffff00, 0xffffffff, 0x00000000,	\
+		0xfffff000, 0x00000000, 0x00000000,	\
 		0x00000000, 0x00000000, 0x00000000,	\
 	}
 
 #define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX			\
 	{						\
-		0xffffff00, 0xffffffff, 0x00000000,	\
+		0xfffff000, 0x00000000, 0x00000000,	\
 		0x00000000, 0xffffffe0, 0xffffffff,	\
 	}
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/deb9716d0eeebe7a4eb04df4e74d59e390dfe1f4.1578313099.git.jan.kiszka%40siemens.com.
