Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590F55B9F4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id t14-20020a056402524e00b0043595a18b91sf7133317edd.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336561; cv=pass;
        d=google.com; s=arc-20160816;
        b=oBLaR0dg0M/o22ODPfPvUb2OlREfTeTPWS2ESeFu1Ubhgs46t+E+Wi+VqrgJtK6NwT
         YVyO+xvES6kbciooxRDIptPovsimqZ0CCxPlni+uHDQ9GBlFV454JbgD+3FN7ZPVICZU
         I0JSlc+YjpBQxuDQPho713ALx+cKbkcGXYpVqegm+yPSb+ZZJ/s5pghNsGmxNLgvFpE6
         2CKS36eFg1llt361LTM9Auf7vdMdZNvvdBj1WLFrbhhaVMeJH5cVL7UByUb2YqZfa1vd
         poqL5kLJaI6R6JIpnAs59VXcMha1nckYPnI5sWjjcuD8pXEffJkj4fwcKSakUDwVjDxW
         9dxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=b6YfGjcZ107h5QE6bdrLO8lwE5hj31DuKKGRguj3bUU=;
        b=O38pwQ58siKI9QihV2deGDV5Cjqr3g4oFgP0agEPE9YJHDI3YxQ12JhVZsmtOqwqmj
         mPlaPyC/I5mfC3JgsyQW4EmS7VaKuo+xZBd0rwg91wiw/mFlEMapk8/2n4iBdZlzGdJM
         ynAvx8mDwD3PBq/IbPD2LjeUCRPC0WN/PXDvV1vg/d9CtOqaT2U7PCB2JnKqZ+31nQlS
         3M6XDI1LYlYwJMFNJj7GMq4pZzpqKkNSID0GhHi9FRkhEBV2fHHJE3FVpMJoYmYqbeF+
         GYG3g7lp2gD76RGnOwTznI0csHgqNSslNl2SGux/TyqNJPugabijrEY7n8VBig/iRsoc
         TDRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cip4MNND;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b6YfGjcZ107h5QE6bdrLO8lwE5hj31DuKKGRguj3bUU=;
        b=Pe7deyuSAkVIjtRnPlWxqaeX+Lytoebd94sbvQ/EpqxM0JbSZGvS9qiF2PcXWsC6c4
         o/Sf5ezyOP2fz2dCt1zylDxzyG+hB5k32JW86Hjaq4egu8PTdALsfAPz5lvsVk7L+wD5
         aufdksiER0sPx4UWZ8Vh62PpPMXzIC6hSMxcXLLOM8s7D0+ApNnYN6CRH2rpWiNQ16nc
         RkecQL3ggq/91NzHVMwjqiPuD99HpFZUgtWZNrptLO86ugEnMlhURI+JnX5o5XjGHpfd
         tyTV/z1cwbrT8wC+/ml/RjWUh2F2bgqs6JGH9FvV9/U7iAuYyT+iisv2OOr+/cD//Ywh
         r6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b6YfGjcZ107h5QE6bdrLO8lwE5hj31DuKKGRguj3bUU=;
        b=MRYNfQ1UahXgMLrcXSZZ0aNWa3WVibYQJpuacAT4sEYG13Lu00HRCCE2Py/wA4bG7M
         0DGMNzqEkn3y+Zv1S6D5JgmcDnkYtNMxy5TvOJlzsEBhTFLWZbXFyv/TwgqJpTbet2mF
         o4y04qm8ruE0TVU4xTG6OwnscfCgNJ+er8Gnm6TxcEd4QMDVe+pb9nFRVeSQALMasHb4
         6KIVlTTYpw7IrehQjuOlc6UYiYgBIP+RYZoUShcTErilQRpvprWvTB00X1gbUPl5GaCu
         PPsgRiWEhvq7uKmZ4KEsXFBy5I3wEPyeYN3XOpkU4K4q/SfzqbIbxB6OR01FLutL/oqH
         Mq9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/glP9U8dDsEjOVvxQVbR+qd/fjqTMzFNh63r4nEv1CJ0nRGHI9
	SLGZp5WPpQxJcJOF+bSSao0=
X-Google-Smtp-Source: AGRyM1sKx7VFi3w3H3uc8qfY8f4CIghRVEcrMVKIGCirr4IofRJPubEAq0O/jf4eY9vw15i9hiB0vQ==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id i21-20020a05640242d500b004331727b31cmr16217810edc.9.1656336561143;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2ad6:b0:6fe:976a:7a5 with SMTP id
 m22-20020a1709062ad600b006fe976a07a5ls4103708eje.7.gmail; Mon, 27 Jun 2022
 06:29:19 -0700 (PDT)
X-Received: by 2002:a17:907:7b85:b0:711:e42d:4955 with SMTP id ne5-20020a1709077b8500b00711e42d4955mr12751619ejc.482.1656336559570;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336559; cv=none;
        d=google.com; s=arc-20160816;
        b=oXG5vfgdVDWBUmIOFBmO2uVuX6G7OhtmOrH1UA+jBXaGxbf4QMcWtzKBPWjNQmAJdv
         1YmI7YHCBrPwXMjn8UXnfiM52k51Ez8XuQjiu4BiIh0iLOX1j3LfUhnyPMRNXQdeYjz6
         6o/V5Hc8BbBPBR4casY2mRXYQPvngjwf4mNLVAENlIPPsF7J9+TCzFG7Ib7JBdol+Edp
         srAlSlU9jjlwHSkr+JaRjJPfn0ymv40ojcf2fB1LN8XIbb14DvZB8Nq9DJV3G4LaEzhh
         qRakAyyr7zeiIo0c7Xu792NYp7TwLiVUg9Cx/aoB8wm1fxajXJ1mG3tcEFiEAJ/HpNKw
         A9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ryFds2qCNNHpEihzM5L+Wf7e7dcPw4v/FA7mvfnOQLM=;
        b=zVRqrJYzxtbVK4qZ6Z5ysTU7ffenFly6XDnjzEOkfT8vHRe2mco4K/rpBJoqi6jAhk
         D1QcTuhbvivnD9g7R2kuj/nRgBu0oopeXBRRsoVO8ESQuAH5KqSyE7oUHz+dOlTnmxb6
         Ss6d4z1ChAY1xvFZuLskkcKbjq0dvMYWw7x7BzRUYnEk9PiHo4JX7twuw8+VXtFBRxAQ
         GkL90OrxziNMgDQJlZU71ZliWukT7YuJwkP7x24kI8cP3pTR5mEmgvOWbjJBvkxdqarw
         OI7X47oT355ZjvkXliPYy8DGE5BOvF0sbbTsem86RHAoTj3v5983mJUpqm3F+fUBBmkh
         WPfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cip4MNND;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id t36-20020a056402242400b004379317ffbbsi122662eda.1.2022.06.27.06.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV71p5szy86;
	Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:19 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 15/42] core: riscv: implement PCI support
Date: Mon, 27 Jun 2022 15:28:38 +0200
Message-ID: <20220627132905.4338-16-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cip4MNND;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Basically the same like on arm systems.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/pci.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/pci.c b/hypervisor/arch/riscv/pci.c
index 067a7651..fc6ed5fa 100644
--- a/hypervisor/arch/riscv/pci.c
+++ b/hypervisor/arch/riscv/pci.c
@@ -10,7 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/entry.h>
+#include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 
 u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
@@ -24,7 +24,7 @@ void arch_pci_write_config(u16 bdf, u16 address, u32 value, unsigned int size)
 
 int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device)
 {
-	return -ENOSYS;
+	return 0;
 }
 
 void arch_pci_remove_physical_device(struct pci_device *device)
@@ -40,10 +40,27 @@ void arch_pci_set_suppress_msi(struct pci_device *device,
 int arch_pci_update_msi(struct pci_device *device,
 			const struct jailhouse_pci_capability *cap)
 {
-	return -ENOSYS;
+	const struct jailhouse_pci_device *info = device->info;
+	unsigned int n;
+
+	/*
+	 * NOTE: We don't have interrupt remapping yet. So we write the values
+	 * the cell passed without modifications. Probably not safe on all
+	 * platforms.
+	 */
+	for (n = 1; n < (info->msi_64bits ? 4 : 3); n++)
+		pci_write_config(info->bdf, cap->start + n * 4,
+				 device->msi_registers.raw[n], 4);
+
+	return 0;
 }
 
 int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
 {
-	return -ENOSYS;
+	/* NOTE: See arch_pci_update_msi. */
+	mmio_write64_split(&device->msix_table[index].address,
+			   device->msix_vectors[index].address);
+	mmio_write32(&device->msix_table[index].data,
+		     device->msix_vectors[index].data);
+	return 0;
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-16-ralf.ramsauer%40oth-regensburg.de.
