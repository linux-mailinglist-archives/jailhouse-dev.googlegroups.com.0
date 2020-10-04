Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVX5D5QKGQEAV2MSHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF9282CD3
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id y6sf1213440wmi.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838018; cv=pass;
        d=google.com; s=arc-20160816;
        b=VSmrvgmLVU/aIE4ZXkO/OW28NnhrMA1+t2Wo2lr6TtI9ewLLumsaDqBixLhY2SDeF0
         XuN/UBNcEAx91mQ60ga+4qmR8AU7pbeIWxnub+h9wwfYS8rNKmJev17gy0MFygTU9JQj
         zulY5QynhZ3eO8mduHQUcozYm+eqd6dR1EVuqeeFnnfGLWhA/gkKhwa9oYErAmYpCKGo
         MS5WgRsE/Ml85A66YSihDE7EXhkXuxJrrnyEAp11+h4Ie4z3a/TfynCwPG2fPXAYXwiQ
         FgYadfmhQJ/rYWwhY49VC8nBj53uKbHBYFl2XLcqfFMSfeOaVKauuyiLI2m6G5k52xjl
         HVnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=bhBpP5Q4SF9Hw3yum6ZZ/ZV/GU0Ji0YLKmrwhgvadiU=;
        b=eqNXCOsNKvDR9CoNeDIS5zEjWjm6LJZ0V6txKC4SabDpln1JhzvdL0QS/43MBijdDH
         xmP1gpuXfrMisQE2KxVRrz+Kjyx3I7cV1AMWp+tWqWDqN7dCdZDlDjtUkR0GyWxQ3j8t
         Ld6fxEcMTrogkjxG8h6hkowYFwJqBMEnFXnhJny2L/ySFqdn2ug/yfNdT/tlzj8Oxy0u
         loechOBOvFh+8DYunMwurTk0TZSyqCNp6XIcVuE5wEInCHJJ3odhwo4GGaVor8iyu72M
         9YFLJifF1CHVcxguSWk4VT50HIl2V4QG+kOTquUdWedbwVx7ikDfmmGypUDnrGgPdmWH
         eLGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bhBpP5Q4SF9Hw3yum6ZZ/ZV/GU0Ji0YLKmrwhgvadiU=;
        b=TOkBYwpJ11fPAd3GtswY5iYVFC517bfQrVAPdBvP8MDxMLsyjFMiUDccXB6cCs7ndo
         rfpPgiy2Ofg3CjPuddUy65nDj8wBFc62meW+8aKIOIU2l+Lisr1rbMnffhQYxb+IbOSH
         NupWz5kl8Gz6bp4nWuw7MENOx92Sg2snJI5mZ0CP3bXvciB2zMG8L+GTKhvei/U/e1uK
         OHdjJbzKcdD4BRqm4fhvw+MKx+vtxPbKLUSZKRKaHIyZ9LUV0ocv+Mqau6f4Py4H8N5L
         k5k8lIy3PBvt3AduM587vvYi2JnVoJWaKzKxgNJeup1pRlGy7ZJNRWGHujc5TrYJnqT8
         0o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bhBpP5Q4SF9Hw3yum6ZZ/ZV/GU0Ji0YLKmrwhgvadiU=;
        b=NUIL6yh9AYsFayuQNi57UiKeljkEVMyfSyLrAYdFIrW6GrF4QbpWT0ci5ljvNQAJYY
         0GH+Y+V9PgKc1Z+RTg2KwxpSe05274CUhXIkh5ptMXuZwQmBTjrMRnn9fFEtVKsTFMuP
         O1HNF2zTyWrRxgu/Nb2hbNAGjZa77bzSmlpsLPUoyPcZrp6COGUYpF7aII66K8Bbgwq9
         6zm/i31QGknmc0V+wfB395KvG/4MDov43QgSlSCqtKc3Wj6pUF9X0SxCgk0540poTiPA
         Q3vDbC9JvsJlsyuvBIZTcKVIdD8XyBs7APKihJgfXP8zNaMJhIR95+Ga4yn+qg34Exrv
         72vA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533lFm9uDdpG6QifYrhmmUGs+we6lvjwhTJLX/dwHicCmPHnl1fa
	pCLtobmZH1MQy2p8qz48FAQ=
X-Google-Smtp-Source: ABdhPJx05demd1xBzM90sHxrdQt7b1ElJqfgdXRuALL83BfRmZJbFFZ1UrXsLDZkidn1X2uNwxiH4w==
X-Received: by 2002:a1c:4943:: with SMTP id w64mr6891689wma.165.1601838018507;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls5160846wrm.1.gmail; Sun, 04 Oct
 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:adf:9043:: with SMTP id h61mr14018307wrh.237.1601838017471;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=gNI574Tjhzw40qyUflZXCXb4hDZsa+BxlgYkSq4RrWHUNf5NaeG92pLiStvCoqX4Cr
         wBv7hQPKz9XzLKAv0WKAaOXAaNp4clvEM2o4HmY6HNb+0u3vkvSrmYsmhu8KbWJyzgit
         Z1E8ly9JoPNExFRE0jdSR8aTLL6KgwqAio873c+MAhkdNQaVccoFizfS7zaclRx2LjC1
         SMffhqRqsbFjOcHlzhZ+44rBTLoy/RIUqwc1XffX1xjgA0z2RhTks5+7rQJ7lk/4tkcw
         otTuMBMaNtU6ZChhnRqKfnwWlRfpppCLTUps4DcdpwX0HyzBVqkV6XE4xtIYAMMtihm2
         UpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=AeEdRcyR7BSYcq8fbMUBbV+yDnu5DZriEbmWFX9c0uA=;
        b=k+U+Rawg0etlmdTMFyI/G/2LjcK3trCAvfLowVZYSDKumyQw1MBHN7VMhHcIrYb8aJ
         6g7ondZ5awi52wGMqbNyt0rhEc67c3v3EQ5N5KGxQ6Saus2wOUBddBBSv7AeRWmAD90d
         OdwGEKDcNvYMVF1fXQ4qbho7lx50oqk1fHRz5Ukrm4oIAyOSkmYKwWXGfi1dPhFAaHA/
         lpIV6HmJOTm2gSSwWYFqH69pOOUM21d2ATCbxvGcyNBQU0PkmiYFMDsPCXVPybpxV5Lc
         Uzw0cvRTJDl8nelO3NPoFlU1awKiHAyZZ0ahUb32Uaccj0bxBKBks8IfqfQqoMDhS6UC
         FGRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 11si36368wmg.0.2020.10.04.12.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0GLx025212
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060s017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 42/45] arm64: smmu: Fix CNn_TTBR construction
Date: Sun,  4 Oct 2020 21:00:03 +0200
Message-Id: <4c37dc7211856ca2f49542876406762b49b9e915.1601838005.git.jan.kiszka@siemens.com>
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

There is no VMID in CNn_TTBR - stop writing to reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e255e381..eb79711d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -229,7 +229,6 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 	cell_table = paging_hvirt2phys(pg_structs->root_table);
 	u64 vttbr = 0;
 
-	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
 	vttbr |= (u64)(cell_table & TTBR_MASK);
 	cb->ttbr = vttbr;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4c37dc7211856ca2f49542876406762b49b9e915.1601838005.git.jan.kiszka%40siemens.com.
