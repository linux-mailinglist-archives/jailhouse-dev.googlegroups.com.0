Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADF28DB5F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id r19sf1037822ljj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664158; cv=pass;
        d=google.com; s=arc-20160816;
        b=AmnI6hLWN6+AJrch+hGfC5y1yOGNvE3GixU/fwX9Vd1JcCuLNEAHJE6PMCcgg0+DUw
         WSajqA1G0+da5X7SYvkkpGwRJxiQwGZszMDLUdmsY2poR9bqv5DScafx+DC5PcE0WufS
         4Dn9LQ1bXJ0EOJjUNq9rFIJZzHfU7pgluCSUwE59SJfZSPbJyCFJTjSt1Za83BBPzr+H
         /dlRIvxDdif3ksmRJ/+h0D4Zsi74KT2DxvvVZLKGTQtL8hezLC3SJjRMXTT3gI9tNmE4
         660Bho4YiAjJYWiFkJl+E0Wex+SL2CMizzglfM2CF3FB03nQj0hJqkHdMSd3/sovdadH
         tmug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=15m8mgkHEHYPa1uwVRvJkXa0KJsHyaojaUWmgv+Ql6A=;
        b=TIw4A3r0P1iM7DJANlHv3zQ7+aMW4vxTpmjNIT8d+QbZbib7tbnd8pOun80Ed8fTPx
         5r8zZT5nTjx/fo/1ILxTcZrnx2BCp+gCqu9wF6nHdr3auYhEyEHUrJMP9VE5xYj7aZcy
         FUi7LQ9iFBBu47GHMtR2xQmO1O/UC/OzxJFAhdB1Hblxb/YGYChTH5pLHB8btWyBDhqX
         CWbWsFYjhxHGqULEW4ucOy4M3S9RigtMGjj7d1F7TP07nOgyZWhCCQbfS0aB6OUCmTxn
         Vpq4PfwYmsD88+H4DJT90FPYAlK/NusQv2+4umaFRFVWfcdvk/BjcQjmv9ukO24qwZ8v
         y2IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=15m8mgkHEHYPa1uwVRvJkXa0KJsHyaojaUWmgv+Ql6A=;
        b=bBkS/oQ4GKpaBokMWJ0DvWKcNQETkmU2eIdtjQ+kKgolnEJG+rbWx+Sv6m0AMv8XPh
         XILJ0SWfJ1TBHqpSCU1ZEN41/F+Kt/eDhukgYolfzEtn0/+ewH6zLPztB6CKLfAryxYt
         0aWNcQbpU0ZGV2ZCDe5X6Fa8KhrmNzxgxl1R98pei5T9pNhi1W1n5j2BiJWoTnuGSYOf
         D8Pc2TJxnbQIhb9w4EQwZaiUYqat7r+ZuCiphXWfd3XEfTEo0DZRVa/NmC1KcWlfTNwV
         oPR8kkVc7ZlXDf/3UDCUIJzKllx0goNkVN8fWp1RUe2muEjJozOQo7WytR3+eZWzhCzW
         0Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=15m8mgkHEHYPa1uwVRvJkXa0KJsHyaojaUWmgv+Ql6A=;
        b=daVEDW/BHkQl4tqhk1aLmz3yIEWbkiwwUrJ1RlZvKMdl24RlnwycQge/0Nwc8KQuzb
         Wb3EEJlvyxEPCL1Mqr+9V0Mnj0qFZj2epnY3XbCL67i++tNFKTyh0eMC3XCdtAdnhKGC
         sD2tS7fLgevJX8Esi6o5spSZmt2hY2+ySC7cIrncdh2KUnjpmswqET8WSVlKYaqf6eaT
         IncifuQu+3RCj/UWEsM12ozP5NPwS3IZSk5rfjx/yrOHYXRkCyjjVAtdvY6vK/Hcdnz3
         6cHtx/nwdsHmPsjmydw0llrJcOD6jeU0pKwehw1m+sowhM8sk7SxHyj6utXsBhu8gsbH
         uz5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ksjRvlcHOBxyJDIjW2ly1Rr4h+kbMn1ax24PF/zK9vhHVXAFZ
	TXMKZQOQsscurQ0xYuW31ss=
X-Google-Smtp-Source: ABdhPJy4ifpOG/WN6sww7BkRilTgwiz0TAN4xXZCQuPiVX6z0TNrVzs/MbIMGjswbd8Cz+DxRBYGiw==
X-Received: by 2002:ac2:46e4:: with SMTP id q4mr890828lfo.48.1602664158149;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1310949lfd.3.gmail; Wed, 14
 Oct 2020 01:29:17 -0700 (PDT)
X-Received: by 2002:a19:8885:: with SMTP id k127mr974266lfd.594.1602664157009;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664157; cv=none;
        d=google.com; s=arc-20160816;
        b=TfEG0f2TH1OErg4siqURhDtFt2IQP7iKk1Y9oc+DwH9YSA+mvFiW4RvaIFoAoF68fT
         y0g9LsPW51rIf+E8ES+pKnWcLBqU1jL/H1E65bUgpY+u7a9P07Bd3M5YROEYPxIVYlX/
         JYryK5NpWBdx4s89wcInBJBq3V44R6NeIzQg5L/DU8aPPAl5c7FYelABVlkUs1ReOP8s
         GbrppTM6D1TLB2o7KF98cF9OUq5TRq8xSKKTfeSe1pWVimk8t+gsl6MBHzRqfpCLYYbd
         SPUyISRxVzHG5cOd7rXgy1YbrVtwkXCfDfhGU7oeSmPnzGmU9x9rr+r6MhnYUHoCtYri
         kkoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=lhaGAi81CCYoLywn3QEk7/VQoRLT6TA3IY6qe6QJ3xM=;
        b=Y1XrOg53sBJ32gValTDDKQwGtY1Aq6DmYAfgY4sxufaZcYVN2Pm93yz+iwimnzbpnS
         r0J6hXF9Hy4oXvQFHYre4edRWgy9RjU3RpWoQCPWBGaNmx12+70gDanKTelZFK9NGJuh
         pRIelCpD25t4/cRdk65seJQTQ+eoUDveeAOv9KJSII0C3JlFko1v2O6U/ig8kNg2JmiG
         6GmWd3jzksUrOhRLPZPwnVpTrPoHs9emY50fPuzXyNPqc/IcUSMCgaxvMeLdM4yc1iY+
         TolHv1Nd8m0noz/2hNdkXx2vDrFPBV+Tw8ynFeCImv1ZST76jSwhomVGT+mm3EdVf5yJ
         dr2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q11si47391lfo.8.2020.10.14.01.29.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TG8Q032739
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ9002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 23/46] arm64: smmu: Drop write-only va_size field
Date: Wed, 14 Oct 2020 10:28:47 +0200
Message-Id: <067bb6ae100deafb395c0a096e34cefb8a43b61a.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e5a47197..1634a53a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -251,7 +251,6 @@ struct arm_smmu_device {
 	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
-	unsigned long			va_size;
 	unsigned long			ipa_size;
 	unsigned long			pa_size;
 	unsigned long			pgsize_bitmap;
@@ -631,8 +630,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	 * TODO: DMA?
 	 */
 
-	size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
-	smmu->va_size = arm_smmu_id_size_to_bits(size);
 	if (id & ID2_PTFS_4K)
 		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
 	if (id & ID2_PTFS_16K)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/067bb6ae100deafb395c0a096e34cefb8a43b61a.1602664150.git.jan.kiszka%40siemens.com.
