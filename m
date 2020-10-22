Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE67296442
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id z8sf1033894lji.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389525; cv=pass;
        d=google.com; s=arc-20160816;
        b=o4CQNRioB3SQ33PttVlWLds7BNco+Z599vTqbp1gVfScH9L/D7JOM8O4abkIqDV0e3
         QaQwCnq+h9hBNxZ1zSPekN96ruXYAQiWJpKMO5sPXkr9EQolt7SxdhW5qiryI97TP8nO
         QDcdzyAEmo8jL9Qr/W+hkyT8xpzJYvqpVM+WkVlsS6FwhDKcaRMnRMdvWa+dSn8UcjEq
         7T5D/qmqWpenCVWNprm1UFM+JKEsZ0qNWAo+AyrZms+eQhGV4MGY2ChQqy4F2Dl0X6mJ
         SLC0WTdoXx+I+pmSYBX7a0ebVEu6Rsp04aYGs8KY9SBZXcrU6GlemJw5820XNuBlpIu/
         uAug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=vtCTF6iBfNsBdGEF+T+CE/5i23AHrrdegNPcfAZXiYA=;
        b=DAKwfJKYrWw/KaFoukv4iuOSRr21NDKCNPgAHRvOMqYFXCxYlRdZBXCsOyWray/A4e
         WpOVGPg3cnZH6VXq99D082Yx0v84uVBz41uJKJ9d5dVdornNZFKP57vAv5yXUtclBQ9T
         HIAs8YBgObKP7I0i6EgDQsw0thm7s4wRHgw9QneXuUZ4pHghVbUgfGKSzCoNk956VJ/x
         ROfdY5d3A3yqjgdG0gTmax+RFb8B64A9iFBENLvIYLYrYORW9LkgavtquUNtwi8lgF+Y
         iHXmv3ydWXu40sT7uQ44oka4zyLG886RO4LtyD//8UeJ/+biCAWgUxkQJ/MBLJjVAJ7V
         OY5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YmiD4rY8;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vtCTF6iBfNsBdGEF+T+CE/5i23AHrrdegNPcfAZXiYA=;
        b=nq5gr7B0gtojjfhkMbJlHKlSdkZX2XboLsd1TP9tx9wqgcYmlOLSCfCB628HE9vsWf
         oPWQWqXJkZrXaMJMOvtd8hF4hoaCP0xutUkW7oiSzwaSG9lzA7vpeJ4mnbTXi4E7gcBo
         NQDE4b7yYO60/MpLCV0uQKV+c89DGnb215+Cqz+saeMNsCJnUqvAJ3DWnQetuXno/rRn
         gAh0f0gzyJpL8dY52OcHNuNPdmSETsGu8rVdAcHQbux0CjvVupDgsIItOr4tkf2TkAsI
         gKOpHlaJNHR0/jWpfGKib6DQ85BaaP2KyiU3cr+az5XZpClhzTJyZ7mF75fo/XF77asS
         TamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vtCTF6iBfNsBdGEF+T+CE/5i23AHrrdegNPcfAZXiYA=;
        b=gG6IeKaNN2h1hieZDLCNPgjgYfU8wKxSvWrYAbAq+vAA3juhEmY3MF6EJw0/CMmwyI
         rLXgLp53L4kTz7mxu1C6zyb/QSKrGRPXa8sTEd+7Ebn82lYM1Ic7kFul1fVnrJMzdZV6
         YJIExqGcFw0uLvP0D1b4gtTgc9P9X7o5hezpmZO+yP9Ocied/8DryPTWpFCU04pU4d4c
         swxevycUl2JmUTR1MVA6ausEMrMgo6m+knJmUYapmmjLaqWc1Kk3UTc/eR+mlSqKScGh
         +NADevuSo3xa+Io231ZigCX8BaWZF9eYNaV4OZbX5KtYG42WmPMdFQPyeS+usotudKOu
         7mpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532I16mYilUOQTe+vyFmVrsauaIW7oP1b9wdHSn0tgUVZA+wg7hL
	6Vr1eZ+U0N4sphvPad4aRwA=
X-Google-Smtp-Source: ABdhPJwKqkP2O0ib8a629FPP/RAFiXl32WJIviksR2Ac/y3yfch5AW/c9avMQ8vEubrhMQN6sP8oXA==
X-Received: by 2002:a2e:9255:: with SMTP id v21mr1483930ljg.228.1603389525622;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a0e:: with SMTP id v14ls494105ljc.7.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a2e:9210:: with SMTP id k16mr1583278ljg.9.1603389524422;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=MCpufQuFy7c2Qe9Sn2ikoYo9/XWtsgYLvCem+4+KZdc8PvAR1s+EPzmg6yujzXlGyk
         2QQ/JzZmYaKgOu+LYuX775H6HNqfXyQrkgdIcEhxo9F7f9zWyNYAnDVtABhXWq0K2vJT
         +cG8+Y4bT76GGHoF6oJIKQbWoOpQqnmlXGZ37ZwhMRqNdTXBbwNhK9vqflBmnhA/hzOv
         7cDLSmK/xJj+WwqrZWff2ple96xuevQqS4fx6+l+210VoD8als6/iJZTYPfwR/tYjllO
         fDMT6DKHRkF828HPOIK6Jrd8eA/VTgxk4JjDb4e+bA6RIYjtaOVaxAQU1WlX9FDCoyJJ
         MjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Bj55iUt3+J7VEpzXrViJyOvujqN7oU4R/5ne9G8XiVA=;
        b=HkPSgcQZy0YQbl54/IEZzq+OWqF/EyRq6G83j9sx1OA2HMrxvUrcM4PSHyzYpelznN
         QGcoKAHxdvLny/h/LrdEu4pIHukBXozkD0oIUXLxt/p9MBhA4r7HRt0VJQmjMVAWDZJD
         7sxxcjU1WiOmFliBh28zd8dundZm5z6WsMud89bxPVGiPwT0AYPCPaDEySpZiSckS/lE
         aQcsEaGRq1Lc/080GpM6u6N5bZRh0LsGzGPzOTdXY2IYqNTkm+lInceXbazSfZaPah20
         qkNJtgFDk3AJmLgTtGVx/YZ9TI+hwW/fakcV/Ch/DzFMFHVUNZES/UYMmHOWbSm2JIYf
         Ij+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YmiD4rY8;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id i16si77576ljj.3.2020.10.22.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTv57h4zyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
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
	with LMTP id H3Jkkpgb7aAM for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTv2vq0zyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 22/33] arm64: smmu: Wsign-compare: make iterator uint
Date: Thu, 22 Oct 2020 19:58:14 +0200
Message-Id: <20201022175826.199614-23-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=YmiD4rY8;       spf=pass
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

Partial fix, Wconversion will complain anyway due to the return int.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 41c0ffb4..26d5024a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -370,7 +370,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	int i, free_idx = -EINVAL;
+	int free_idx = -EINVAL;
+	unsigned int i;
 
 	/* Stream indexing is blissfully easy */
 	if (!smrs)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-23-andrea.bastoni%40tum.de.
