Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4OLZTYAKGQE4WG5QGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE081311F6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:01 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id g5sf7675115ljj.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313201; cv=pass;
        d=google.com; s=arc-20160816;
        b=gBHilvauzW+uLzaviC4YIKNRURP4/bT5FkDq1qaEuJLH6z1X3dTDmu09pZZIX/4YjC
         dBusUuXA+YpRiWko3sVOvQ9LoUJ/bB6fm3FQOCDo/JrwQpans5J6KZJ+Gi1MIrEs2gb/
         UioqBOb5581Sx4j2Zznnywh32r7IFlkoKeK8FBuiZ8/CM6NBizSeYzHK5P8ZzWuXq2Qh
         csvxzSg5hrV6fpBISUngX58dldpBmbVLWwB6pZtsXAp1jXJ7urebDlOsgJutVEtKjNa8
         +hlI848JZdzlnkoGaDe0nE9UwAPQ69JJo1jqZgcBgAXBqzaBfWoALVJuR2GObDF2prC0
         /unA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ydKnjTOf+zS6FY6A3s+IcD7b2bVC0eDpVKtpTgN+O68=;
        b=ICVm7SWOYwNHy63db8uHeX9vqFHm1k61HMWVw+F1fmgSn3t5bD37tUULDm8NAkAkeg
         R3twxhHUYCAmgNPp3xPsToS3gn4VrP5+dBSurAgkgno8AkH/zpmUP8pv+4rbbMtCEyKT
         Nj0AS0sWJUxnqtOOBDmzn5MgJg9THTKaGB21FQaeRz2XKbBnHpONNrnqimPArGPZ8DXn
         5NOVO03g8uHlawfjgZRRLO93gUuKA265yKbEUnA9vuL5kgDxEHSGxwxsjiEUtUdIGtEJ
         3XbKOJQdc/Qx1sb4Bi+Ea4glcLhEvMoBIaUVdmR7hFXu0l4BINGXv49zD36B26wViBKG
         MpmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ydKnjTOf+zS6FY6A3s+IcD7b2bVC0eDpVKtpTgN+O68=;
        b=qJSze750vlG5DVXV+5yWsaAM2J0J+OuCzxX0RuPme52YVmUqBP4wY5U/QRvE6cp+j1
         7+kG+xpWrvvQKJWrEai4VMw/qvkMwabqpu7FndJrdcJqrIi1RLJAlJdV+39/kh8YQgna
         4WYQtU82LoAQlgiKqeRO0b9eY9jUUy+exzZXHnGs/svZOG9ya7DQuS0FxFFAjxt3s6p6
         N8RlGW6IesmMR9Rw+yeTlh0Il3QjFRcQ2a2peKrMLLeY7YqtAK7UgxZ9D5qt2Mi9m42P
         TLJIYq1PF6f7pfQ6f97aQoDN0VQP7713XMnSwRFD/k9dhL/lFukX/PEelSW6eJlMzlo7
         jw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ydKnjTOf+zS6FY6A3s+IcD7b2bVC0eDpVKtpTgN+O68=;
        b=Pt5hRvIhrCba2/RBrF+B5nO6qVVhzOm83nrrAWx9p5NcsmozAqjwfxJuSdagJ1Trkh
         C6tfPHdewrqcNAaVkzWaKoKILPfyUhiZlSrGrISQlIRm9rcFfDQRwkPEVmME9Xzpncfl
         z06zldm16kSBWbxueUvt2xqHxdrQs2MolcDPWLv+plDQrs+nIOou/gah9gKQZKgkWcwJ
         kJ47BEzHytMDxl6qgL0V8c8rIwW08DHj6sx7L8ZSD5Bwzm+le80/Q7Uaws4UhXxlDyYB
         ZnZkK23N599fM8J3kIvB46b8O8tvlYFMdOLIpe6nm19rAYGUMHK5+/I/pZlJaRHFwNKP
         qEag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUBysxgQwnzLpyp35IWhM2Du51MUtumMtVfetRQcd7flT/LcT9x
	O3vqJoa9R8IIGtnoD+WbNlY=
X-Google-Smtp-Source: APXvYqy7L+oyVigdXn5Wg+dnArfKeuBK1tgA2sDVSUTu5A+kr5gpg3IiceOZcNA/ceMJTh9P0WxAgw==
X-Received: by 2002:a2e:9999:: with SMTP id w25mr51148748lji.142.1578313201199;
        Mon, 06 Jan 2020 04:20:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:730c:: with SMTP id o12ls4924848ljc.12.gmail; Mon, 06
 Jan 2020 04:20:00 -0800 (PST)
X-Received: by 2002:a2e:8946:: with SMTP id b6mr58783052ljk.1.1578313200458;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313200; cv=none;
        d=google.com; s=arc-20160816;
        b=HQDoimW1IDB3qrnmeta+7r3Jh4p1Z8rIzrmqg2wiuy9Anf4TdGI6y8278urSFCzAdB
         NX+dhNTofeKHMGHtObpu88t3OYdhY1weVAKSv6D90nivbrwhTX6M6qkr7nXVZO/9NsE8
         4jLq+K6MYrMkI6SIsOHNzIY60LvUCr6NruDKdSXoQCHEQj7akGaZ+Ep7zic4ULDdFgSM
         QrXZ/1w7WRhEkZso0F0z+FBZS2F4wb5vMBnNJwRWJUMYJpHZenEt5eeDht/5aCiIGMZz
         xgBwwXb/dyGtJjJ/S0S08fdAgX5Pb1iEOKZSpuIHnpFjWBkuX/zpr5D9G2SWvJzKXV3S
         ip8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=fDqEUswo0YDASyCa0E1RYpWNaO3Qtig3RFmBSkxNlXM=;
        b=b19z+m2WQ7ltM0IOEt4jkxPl5R7aPsyfv7lmhSQVj73j+BcMsA2g6tilfNnA6gb1K2
         0JcFKXUlNSRfdvCNZVKUaJOeDwZv196PxLiwad2N2O8sTyEHDkW3CASeZhzm11w7hf0X
         8Qa1oWoL6xULAs1chOjZHuyS8ST8uw6xOyJZhxTAUETUoYwwNTdV73c5g8o9+c0lQz0T
         2LVZfKCx3jYkS74p0o/miY6Gbfe4fr41PO6ADz30zHrjOq+v0xnQF1RQshG1ZLrsoFcS
         iv42MKad35Xbc4JlPVbDkWpvdgCvkOhYggdo8TWKwAcrEOUZl2YFwuTTKpvwa4b7M4Rt
         i41g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j30si3040340lfp.5.2020.01.06.04.20.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJxGo019213
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEp029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 17/38] core: ivshmem: Fold ivshmem_write_msix_control into caller
Date: Mon,  6 Jan 2020 13:17:58 +0100
Message-Id: <631b40d161a7b648aac842d5a756cd9ec076fde5.1578313099.git.jan.kiszka@siemens.com>
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

Using pci_msix_registers to model the update of the MSI-X control
register does not really simplify the code. Rather use a plain mask that
contains all modifiable bits, PCI_MSIX_CTRL_RW_MASK, and perform the
update in ivshmem_pci_cfg_write directly, analogously to the vendor
capability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/pci.h |  2 ++
 hypervisor/ivshmem.c               | 21 ++++-----------------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/hypervisor/include/jailhouse/pci.h b/hypervisor/include/jailhouse/pci.h
index f463381d..ee530c03 100644
--- a/hypervisor/include/jailhouse/pci.h
+++ b/hypervisor/include/jailhouse/pci.h
@@ -100,6 +100,8 @@ union pci_msix_registers {
 	/** @publicsection */
 } __attribute__((packed));
 
+#define PCI_MSIX_CTRL_RW_MASK	(BIT_MASK(15, 14) << 16)
+
 /** MSI-X table entry. See PCI specification. */
 union pci_msix_vector {
 	/** @privatesection */
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 760163a2..e270582d 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -246,22 +246,6 @@ static int ivshmem_write_command(struct ivshmem_endpoint *ive, u16 val)
 	return 0;
 }
 
-static int ivshmem_write_msix_control(struct ivshmem_endpoint *ive, u32 val)
-{
-	union pci_msix_registers *p = (union pci_msix_registers *)&val;
-	union pci_msix_registers newval = {
-		.raw = ive->cspace[IVSHMEM_CFG_MSIX_CAP/4]
-	};
-
-	newval.enable = p->enable;
-	newval.fmask = p->fmask;
-	if (ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] != newval.raw) {
-		ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] = newval.raw;
-		return ivshmem_update_msix(ive->device);
-	}
-	return 0;
-}
-
 /**
  * Handler for MMIO-write-accesses to PCI config space of this virtual device.
  * @param device	The device that access should be performed on.
@@ -289,7 +273,10 @@ enum pci_access ivshmem_pci_cfg_write(struct pci_device *device,
 			return PCI_ACCESS_REJECT;
 		break;
 	case IVSHMEM_CFG_MSIX_CAP / 4:
-		if (ivshmem_write_msix_control(ive, value))
+		ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] &= ~PCI_MSIX_CTRL_RW_MASK;
+		ive->cspace[IVSHMEM_CFG_MSIX_CAP/4] |=
+			value & PCI_MSIX_CTRL_RW_MASK;
+		if (ivshmem_update_msix(device))
 			return PCI_ACCESS_REJECT;
 	}
 	return PCI_ACCESS_DONE;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/631b40d161a7b648aac842d5a756cd9ec076fde5.1578313099.git.jan.kiszka%40siemens.com.
