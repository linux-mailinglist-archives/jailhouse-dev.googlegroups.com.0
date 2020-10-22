Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F21296433
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id f3sf1016260ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389515; cv=pass;
        d=google.com; s=arc-20160816;
        b=cLjzD3uqViogepatVZmsN2zXWVFqiqC9qt7xBI20WUnbrMtZXPO+SOfnEu0ChAhWa4
         miYH+e8USr8+F82QAKsdGmFy94l5mHCqjE3BD3zghUvQr82HerulVSHplFoORJ+ijY6F
         qjTCkw1U0tG3lCuUPy3qCBc8cpByLuxCSnvkNrTBRTjQ9/e9XkcpoFgL7kQuAYsGRZHm
         IbYcPLeNFqiRGyIyrA+GsUP2/suuwVLAW1JNua1QiKzs7s/ezZz/Zq4b1VcUhBY++xQ+
         Uk7c7jdpQshy5Dbt4MEC3J5I8+yc8ZRUeNaP6wucAk89nxf75hHGnC8JzXNnH1GyzEib
         kHAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1oBFDcGATCddwoJvt2yMLli5Z6SNqT7KJSuMxKPNc48=;
        b=ikHR1zPhnRfEqZLSnHahOPePkpEYPBJKor+lB1GRs2bRNPWKQOO1uVo/dhin09qJ+H
         v3V4CVam7xS7xVIxznSYxlAmgfrm/24iAADCIwSEgjKheMVCCrphZW2tr9fsCPAkZrmX
         W79mZzF3xaAJ8zJYUIq6QfKk6VgEoQp47lqLgpL0dH7YslWEV6w4oWY3aGSr2+C9MrVB
         WxYZ25H6GsvTDYBiEPwvT3xVr8ZrRWdKJApPdhCgS6+vvRgWGSyCXxPjJWlZfhQScN5C
         qid2LcpNOBl2RjVd+IcKRYWxsZ1xLH+h3CGrwqvlTXYOGJNo4dvYZ42i5o2+pHKvoDW/
         TNPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=a+lwgocV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1oBFDcGATCddwoJvt2yMLli5Z6SNqT7KJSuMxKPNc48=;
        b=eP9tSHBsUH3kECUZ/YTKlUkcvoKSTpV9676htKRwwchYTVwDE+vGct1wl+akZ8VVwc
         8NjC3VwpnTuZG0GwFxhwoGhpt4JgVQaf+ix/GjIGj3kpwCmaFdrHPUforP4aC1CSeqcw
         qbViN4SjThgGKArHw/iQCvcA9ht3Dh3DYQ19WjAEmrBlcfqUgJA2j2l6IDC/pPbyLRle
         dcInNVffbs1sZvAAZjN+fX/soWdEDnfEa0AQBIehxIKGvqUFbabj0lTS7ZZglUrFTPul
         GET1dp5OiRKyLTAabtIfIuvKkMB/VbtUKsPfgU08Jd+5BquNsKIzgxPHdxZEPWVsr1BG
         qq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1oBFDcGATCddwoJvt2yMLli5Z6SNqT7KJSuMxKPNc48=;
        b=tdjZuAhivDs+/Nm9S/1T5Kq61KsSgfgioxhI/57dWenZDqi/S5Ml7pCMf1ojxFkojR
         /bv1yK2UhoNHo3MhNRFy6+guc1Anr28wI44evTt+G+wacA/v/33ygZEo+H5wURpwLNaV
         3LaKFy+g4S/YCdkb2D4SbEoyuJ08xp5SjLsfmh5fgrTWWq+QPIyj6pzQFh/P5YYqI12y
         aWe6tvaYwOVcP3n3OnPUkCSoHj+6UWeUnzleKntrdYMJcg/sroHIT2rPRN/AZ875E0Nj
         GxDguxRUda8ztEHLzsJY+kuFqL6w2hgN/LdZGhjjMXdbjZA64QJteftt//XoLvKy00Ph
         lcMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vThEX6jW96r7O5SwVdhIUjsjCAZxgSm2k5HVBL+wj+xlzmX2H
	g5bTrttdVFNQWGMKnhbZGuU=
X-Google-Smtp-Source: ABdhPJz107U9tStH1m8ubwgt3zseIvuk2QGo2bDG0peTx20JvgF65Esp1oBIz2rTi9mvHzaFQCXIsQ==
X-Received: by 2002:a19:6001:: with SMTP id u1mr1388803lfb.59.1603389515212;
        Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bc1:: with SMTP id w1ls500187ljj.4.gmail; Thu, 22 Oct
 2020 10:58:34 -0700 (PDT)
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr1564965ljm.121.1603389514097;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389514; cv=none;
        d=google.com; s=arc-20160816;
        b=R2paDccwDCyjXu3sPcd8wQbbo81/2yiG6RSSJmHTnTYYdwTQ0sN/v5ZewtiBk373aB
         dps0Tw79suVA8yeZZ64E0sZBOH8m3n8pOyee/nzSJ0xS9HS+rFteaUdcgT9/LY5391Vl
         KnoIKnZ81TjO51JUmdyMwWcugTtu5/f3qEVmfrcEgPvCf9g1DXXFxxfw567Gb/J6238K
         +/ugmwOYErd9uY8FXPw7VUkXzZ3d8fHYQHcwbagvCpeMDkwH+f7zWBrLYc+6YAkJaeOi
         RlzFvXgV+VJQbTMUCAl0YzrtCZ/1LywJcb8g1yY/U6AiEBBsu3nfEuYz9QqrgpNZojYV
         GruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=bYNyXa2nM/BzVceFwqjY0fk+ugpJ7UE9lm7m8JiOmDU=;
        b=Jh3o1JQv9PXrJlgefq9/J8LRDh6FBaNaceq7np9CoWjwCr5DnYDBygSy+QMPKwzZvu
         opnb5ml+cpwVKM9FthZJKFV6nf44LYO164Z2GI0MvUGQVlHfJQ+fiGEK5H2Ai/+6ZT2O
         icM5QtUSCqH8ioV7l4QvBBcqVif7aNAewg0wK2hUoYZc4YJ21uVEc4IEROPOvdMJ9Ha4
         nbI6TgtuzeEM6j7bOjWUpFhNN3WlP5I7lXm9hNNEa6ak4m+p0+k0aVdyxPwA+efAojAp
         SzTgqq484n1uNFzXlTeGJHGCOVj/qkJ8Dh0KAqyRa0vMUL2eTq4qM91qU/zr7s7l14RV
         ix4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=a+lwgocV;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id e1si118577ljg.6.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTj3NTqzyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id T1gMQcN0j57M for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTj094zzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 05/33] arm64: smmu-v3: avoid shadowing smmu
Date: Thu, 22 Oct 2020 19:57:57 +0200
Message-Id: <20201022175826.199614-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=a+lwgocV;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

The symbol "smmu" is declared and defined only in the smmu-v3
compilation unit. Give different names and pass a pointer as parameter
to preserve generality of the accessor functions and avoid shadowing the
smmu name.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu-v3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 2f57868d..3b5117ba 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -360,7 +360,9 @@ struct arm_smmu_device {
 	struct arm_smmu_evtq		evtq;
 	unsigned int			sid_bits;
 	struct arm_smmu_strtab_cfg	strtab_cfg;
-} smmu[JAILHOUSE_MAX_IOMMU_UNITS];
+};
+
+static struct arm_smmu_device the_smmu[JAILHOUSE_MAX_IOMMU_UNITS];
 
 /* Low-level queue manipulation functions */
 static bool queue_full(struct arm_smmu_queue *q)
@@ -1043,6 +1045,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int ret, i, j, sid;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
 		return 0;
@@ -1072,6 +1075,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int i, j, sid;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
 		return;
@@ -1096,6 +1100,7 @@ static int arm_smmuv3_init(void)
 {
 	struct jailhouse_iommu *iommu;
 	int ret, i;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, i++) {
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-6-andrea.bastoni%40tum.de.
