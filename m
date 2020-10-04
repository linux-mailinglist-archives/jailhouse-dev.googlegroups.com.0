Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB0282CB3
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 13sf1593334wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=G0NV5HH3gJrL0ynJDsYr17uCN6j+ZkJfTRYmv5Jx38fFjKqo+jLyaq68pqj0kV9HnJ
         fACSBtxndsKxlR+lxmpbiCH+2ZWkTlZtw0VPJF9GgQci36bwpN3oO7I86eOb2uBCp1KY
         Hl0yYxPFduArn62J9v06CYFUEo5jrwdEiENk4Rkh/ufksH9J/LfNd5JuFQ0JouA+7MYA
         Pyqhly42HnnnNdn+Up24DCZTsJf1UWeX4UGLtitvoZRPWrqyIY0rV7ofMiwWP68RVjtg
         PFodVEcv1NZ3MGVfsFJldffbUOCUOeKZQosPyzRKNG80X/Q9i76JPdSp1Lono14bdk/j
         xO6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=m0lXBvkVXHbHYSDeqMo9BjEkid+v+KRWAkKXIsGjxtI=;
        b=PlBLEpdiGg6pZZr2/iGp4Jk2xJbIdIHtkqIq6NvAHl9Npqh3ouiEYtsI5CsJ9ogrSC
         meqC6OxFGRNNy1UkCi/toBpIIo7+IJkUV0RupO785yquVb+UZcvOW0DkcDQrcbEzAVp0
         i6i+B7nRdkGrtsSBmle0CfhiDAgfmnY9pyAJ/vwoynVUNEafJ4UcphLX1Rq2MWaSSCbu
         qlXM5j44FDwAVBC0AxywhX4HzSrazCaIxdx04Sx6FaJ/fqJHuBY3ap+A7pnJzp2t711y
         kKkRuaGh4iO/gAIM8nPxJ7fgOb2pt8aMcY8vbxJEzBzBt4BNCJGmH6H0QmiQXaU7mKqK
         IIAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m0lXBvkVXHbHYSDeqMo9BjEkid+v+KRWAkKXIsGjxtI=;
        b=FhYhB116WAMocS2SzItduulQCqwChG0Fg8LGM+Do7ns9A1C8GjzzwTkqXR81v1VIqQ
         kjcpN9jlSvBR9sycmCa5s0d9v86VtSXqXsTPArF1v883cZiJHchtq3ZGFo3HGkFuohWC
         OYOOpL8DePbpy9GbBtupNzI0PB+p5m7AeAp8VUJiT9ceCBwNPXrzQ5YMfDeiRUEkuPi9
         514ZSjW7f8J1160qeHDKPBXN3SVXqUR45lzbYFl0VroAou5ELc8TLcr9IypKxsiruhdi
         1rkEVuTtAsaDI5eknn+i1g+Nn+i38EhEk2CFnFDIo44BhlVkyH8ClZ2cXTxoUFeLOsje
         DYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m0lXBvkVXHbHYSDeqMo9BjEkid+v+KRWAkKXIsGjxtI=;
        b=P0tXaySOrdbBGX0on3xCj1pK0yLQGG+ZiBiPyqTZCYyqHgUOIwfeLmftvdnuvV9qLB
         N9H4/KGINZLM3QlaqBZK2dgBHyb3dUB4piGPVWBf1Nv/gzNedzQL4WEv79wn3jNG1hr6
         JOIQHIhinMuxBC0Hra4yL1nwPQ41AovFbGQYeAwVX4IDhq6tF2EQyPpu0lRof+/mIntY
         /IkvxJiMM9gvMkhQuia06ZLQkqIJlKh1tD14yX0ZPwQmejTfL1Q7iz5PiJ0tsFvSSQf8
         BOCua/5m7tkVchEOk1mGaqfi0/LgJRsVPrGT6LXUOQ82PsL/ia19Pj2VSggXrs5RRugP
         jRQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5333DGwnsEKByLrwYXP2N27DjlXw3jSgKzl5cBJz3R1HVXXaFo/q
	+EKAX/EBVZ517L4qHJucwiw=
X-Google-Smtp-Source: ABdhPJz8I7/NKzrJC5hfU8isPbd69mSESpnVsPigbmljWAn79qIW38GxDsV2oItQgboi6uw5kaewJg==
X-Received: by 2002:a05:600c:20b:: with SMTP id 11mr13375847wmi.147.1601838011849;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls5160365wrm.1.gmail; Sun, 04 Oct
 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr3511781wrq.157.1601838010755;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=ce93lx+BmDyiC4FiKgoH23RDN+2qhGOWVWbG++dUZVBFsBB08TXFE01bUW3FLC1QAp
         i4hOFRpTHnXnc9oUUk46Jiyjtpenda1cBPLWgVt6S3ZyBfU0peuoNBTNSB3AVvtACT7r
         iAnN4JF4O5nni8fKd1xwt7Ah0TR/cAHgwCNnLzrYL67aPMvPr1+9TrXzohOYuXP85pKl
         X6xeGU22HrJSpTFO7SQbSA0hXrB6AHWrdLmLA1N7mjepyqbIDRH/gaxhdj5Xn/8Dh2ys
         yiGVpZ62Uq0CtuSEc0q8o83ZbRuxDiG7F+y2WtMT0fvj5fHVNkK5DO+56H0cdFXF3uee
         z7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Zo0mS5o0V2+6KzJ6eYybazIIJSUDQbDPR/CNnvm+otM=;
        b=C70zU5AZWByhqFfM4US7Z+YLEbUGVYZolMYN29Dod0tANEc0zte56C+vtjLadK2T80
         XmuaQXzNOslZWV+wI15tgLqPOqbjBpoxE01R9LPr7anSfmYpZDwtnkNL//bT7Sa+gAHj
         alDC77qSszDv3eOjxILed/SH/i1DrmhjAe/8ngIsSHaDpjnoAFiKd3B8apbOuEwcdDyN
         RLRMyz2hUDF04iTIqO0qx5IcVEJ8ACWcMuckRgKOI0p4seOkbXjuwGq32zuwTVpXb00J
         ZIK5hW5JS0rN0A0RrZB3L6zWAAMx230Qk2xszSd7cZTTknNm2M5z2GSq4eDVlHOIWA6X
         KqAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f144si65828wmf.0.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0A5i025053
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060N017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/45] arm64: smmu: Make sCR0 write-only
Date: Sun,  4 Oct 2020 20:59:32 +0200
Message-Id: <6aee39334bc289b65ff14e9885e5cd989efa9732.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

There is no need to preserve existing settings, and reserved fields can
always be overwritten by zeros (Should-Be-Zero-*or*-Preserved).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9078fbe9..34c99a6a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -96,8 +96,6 @@
 #define sCR0_PTM			(1 << 12)
 #define sCR0_FB				(1 << 13)
 #define sCR0_VMID16EN			(1 << 31)
-#define sCR0_BSU_SHIFT			14
-#define sCR0_BSU_MASK			0x3
 
 /* Auxiliary Configuration Register */
 #define ARM_SMMU_GR0_sACR		0x10
@@ -532,23 +530,11 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
 
-	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
-
 	/* Enable fault reporting */
-	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
-
-	/* Disable TLB broadcasting. */
-	reg |= (sCR0_VMIDPNE | sCR0_PTM);
-
-	/* Enable client access, handling unmatched streams as appropriate */
-	reg &= ~sCR0_CLIENTPD;
-	reg |= sCR0_USFCFG;
-
-	/* Disable forced broadcasting */
-	reg &= ~sCR0_FB;
+	reg = sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE;
 
-	/* Don't upgrade barriers */
-	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
+	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
+	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
 
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
 		reg |= sCR0_VMID16EN;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6aee39334bc289b65ff14e9885e5cd989efa9732.1601838005.git.jan.kiszka%40siemens.com.
