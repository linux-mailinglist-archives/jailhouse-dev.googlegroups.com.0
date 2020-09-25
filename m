Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQW6W35QKGQELXUKZGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E0527832D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:11 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id 6sf772313lju.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023811; cv=pass;
        d=google.com; s=arc-20160816;
        b=lN48F5KfYNNFqE04gvT1UhWylj0+yQMR0DjHjJUaXSzrjP/XfXUgfGh/bqO7QKIv+W
         WasS0ftvdE0I94nDS6Awgp89Tyxm8ryxwIilNsCee3uCz1H9LuIr8UqR+6oeacy6hmM2
         go11z5EpUpaL+BbWViI7hEOEZ4GjmmNLZYdn8Xw9Nd8kYmwkIof1VbQ2FKwsr6BiNGAA
         zQBrlBIl4283slEjHJxEJEU7+mZvpiiDdpub/GDJ9IS00+ZadElDegT1RXsNBCiNxe7j
         EcOnN5Xu/QI0RQxvxLS6imVUkthE8/PYIKL9n6250YFbSFbXfMFxNvEIjrEXe1vj4gEg
         Jl3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lMHJUu7/y8nnPl+h/iBA3y1c71Oik8WQVEkDtRisNzk=;
        b=XO4k6WflJaHexAchpm8BqwujaLx22sm0G2tIXPN+ucF3ALCyvNkItwLvWMY2ANB2mD
         aYk+ob4dHcImDJAw1kF0r0hSAv/eOe3BhTSGBg25SxEWRBhBDnh+GFaIwUz4Oq8ie7qN
         Bl1ZRrVPNmylUP9YOnIFjoYUuwVKyoZPzSrruRcb6DdkuKf03z/6rYc3WHmRMUs6+6kD
         wT2STtRq5rNs5gtNwXX0m0jN0GRZ29jQLdjvDS5CfEinKmEwNR/ro26Bvf3IdMe0GQXY
         Z94wxNv38QalSObJfZsX5a1y+/lMsI4WwJca6q2hyQRoW4UfN1Iivsoc+piNTHNz74GQ
         Ugng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lMHJUu7/y8nnPl+h/iBA3y1c71Oik8WQVEkDtRisNzk=;
        b=AHSyJhWa6JK6Cok6IiayGa6U8mGJ7tkUh75inSj2eLqjh7kpdE79kaIkJ9CaVo9J6j
         bZ/fNDduzeFp9odd/NHAKojr2TTk30YwoQyIKMk6HVBozLi/p2Z5+y154npAFYCvPEke
         JM7ea+nsC1n5Hzk4NiHSBdeHsIDeeOnAKk/wN+oyHXk8maD+Cdykbp3U4TjUrIakimL6
         JtIZBuZUGSfLrwTEOok/IMc/Ud8xZt7A3eIaIXyf3i5mXGkH1j99M/+leJHJFh8UMwvS
         FZ8MrZJhVw5Hc0Y8zJt6lBc7FukAC92GVZFJ1qVJpgK91+fv/ZVv6F0eJYNghms0G8FJ
         q8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lMHJUu7/y8nnPl+h/iBA3y1c71Oik8WQVEkDtRisNzk=;
        b=WzPu7OkluSWevP8JdIkrTNrM0FQkKpzvZA4baVCgOgvsqWabZnZt7SiEQlCOPq1eAS
         cnQOJbYUbsRfKW6KQ/CYaf4gPpRUpe//Vk9cgVTPvBlXYGtlRJGcSwZAW58sAhqAwZBj
         ikh1N3iKlv+hbjzxc8bZKlSbezJo+X8nkOTK37x1IgllMR9A0nd9rIpnZANFrBjtUCux
         gjp4wEjodearMq5FuRArB+rtN5GajiGlz/FIk0K9E+ONgYllUv7pmhFVwMwetgW7PJht
         hQn+xOPx+cvCcHugd3XP8hOvceAvYhWmjOXU3qZFczq5FSEtX8t8QVqVeTyVzdDDu0Kd
         n6Nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532j4RLcoY5Mx7w3v2Fz+WBfMxBQSvfH7cclzbIGRLB/nnXPQcYm
	PxQeEtz5nhLXbN+Juy2C8qY=
X-Google-Smtp-Source: ABdhPJxjI/5MZ/ZO3x35h5ZB/psK7NDGbuDs+PfJGC6OTpyAFfSD03uCt46mievEhY7/oLCXxeXDzw==
X-Received: by 2002:a2e:9d98:: with SMTP id c24mr979616ljj.281.1601023811315;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls262322ljh.11.gmail; Fri, 25 Sep
 2020 01:50:09 -0700 (PDT)
X-Received: by 2002:a2e:8693:: with SMTP id l19mr1065182lji.25.1601023809796;
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023809; cv=none;
        d=google.com; s=arc-20160816;
        b=Yhi+FGmTVadnwQdpTClPyJcokfhRLr5x+73bhrEbKZw4nrzfOj4UcuZRwRXPLTAPDV
         aYQ0C3w4+RiVT34QD0osDfYFJ2ufoVS75LB5xoRj8C2OEx8n3yKFNkb8VSgwNY6lV2h1
         /++zKOliH+Qk+4jvlVC69DCsbQkwxIOvnAV2sm6FMmLLBA52te6P/qAD4Tr4/T/MaoSq
         i0wlBBf6NYPHOhTlLRVDcm6M5LaZyiu4NiOvytXFqzbM5+ODOmAI84/mM/ws/G46tWSv
         ok6cZ+yPNqdO7ctGIlLYCHtVer39Lv/RPnNs0QtuFFkTMHpWKM3cEoSaDObw9S3AiuJH
         /9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WIowlcOxJ28+L4qHiwQEDOrMARNlHdEjHhJgj4ptGJA=;
        b=FlsVYTC/Vc6/gPCuKC9XyGAZPPgte47SOwHZ+p4L4ITCrZOxjnLeTqJATVp5/tTDYH
         AVMG2KPfV06p2RUd4K/NeeN9+bPyqzf5I/ebWcnjNg5WRxYPszTjL+x3EN+FaGYydn1e
         oD9xTz9gUM6ei+TcubtnnQyZMINcR2uPwOAaGdkWGuWi6JENEnr/y2+VClveFfNPRUEX
         pzReL8vSGkbkQHD9T5a+FfmJ/Lwkh3lEYZn3o35KdLPQ0ZiAIdCqgl5UhxZafUUCqOk+
         7aA4pRUCxfhVkmERtbstwl3JHjaJ0U5tXg6tqbzJl/TwZQzMJTQ+34b3Q0ON96RS5Tvf
         uGNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f12si61966lfs.1.2020.09.25.01.50.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P8o9CG032109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IJ027224;
	Fri, 25 Sep 2020 10:50:08 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/8] arm64: smmu: Allow arm_smmu_init_context_bank to return an error
Date: Fri, 25 Sep 2020 10:50:01 +0200
Message-Id: <f258244cc57e69dbba1ff4a94d4f35541cdf8baa.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

If arm_smmu_init_context_bank detects an invalid/unsupported pa_size,
allow it to return an error and handle that properly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 8975e8b7..3b2d6e15 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -349,9 +349,9 @@ static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
-				       struct arm_smmu_cfg *cfg,
-				       struct cell *cell)
+static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
+				      struct arm_smmu_cfg *cfg,
+				      struct cell *cell)
 {
 	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
 	struct paging_structures *pg_structs;
@@ -400,10 +400,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
 		break;
 	default:
-		printk("Not supported\n");
-		break;
-		/* TODO */
-		//goto out_free_data;
+		return trace_error(-EIO);
 	}
 
 	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
@@ -417,6 +414,8 @@ static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
 	vttbr |= (u64)(cell_table & TTBR_MASK);
 	cb->ttbr[0] = vttbr;
+
+	return 0;
 }
 
 static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
@@ -877,7 +876,10 @@ static int arm_smmu_cell_init(struct cell *cell)
 		cfg->irptndx = cfg->cbndx;
 		cfg->vmid = cfg->cbndx + 1;
 
-		arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		ret = arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		if (ret)
+			return ret;
+
 		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
 
 		smr = smmu_device[i].smrs;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f258244cc57e69dbba1ff4a94d4f35541cdf8baa.1601023807.git.jan.kiszka%40siemens.com.
