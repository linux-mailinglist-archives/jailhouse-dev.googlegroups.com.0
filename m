Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH4XYH6AKGQEGRF4YZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB2294F31
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:25 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id f14sf1775420ljg.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292065; cv=pass;
        d=google.com; s=arc-20160816;
        b=gNTDkVBFWYyS1+ZDMHFSnNrl1Tx516pN19olyTWwwQjxTh87qSsX7MhNL6vK1lY7A+
         YISFBDvT+EdN0Kn3XoeHxrR8Ogpi9Whv77xZsVKrIW3F7pF/o9EFZwVw281kiCdVggtY
         /rNUEkL9FEcaw2vbyP54aJIV0nfCf+1nNq2CIM5ABDg3KwV0820gIxemTlk/U7WsL9wO
         v5gbUgpzfTIlYRXNccVq4HY828/Slb1K8PCdk03vpPKWB/gtRD+5VyrLtGF6Dj+iDRnW
         yiSgy19nkLrsKBDR13uLAQI97M6IDuO2VEINnoFMtdYnZXwNH1lk06hc4i47rE8lyCj4
         gURg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Bt7cpYYabsF87bYGI9q+OapiNMiHH5x+NNrciXY+x1I=;
        b=OKmfMq5S6w20bcHL3+uVyQlf+7P3DzC4kzFQ6ut8Yi5KCMJ1dx4IkBlqj+kkuP+ycF
         SF4BDq6kdFu+LzkL3NceMqM8hVXYMQ4rQEG0I35QmrOpxUlvu7/YQc5LV8Br3lmM4S99
         E7f5pqUQ3MZ7vZLXpRndKyqzA6DaPAoy4lQJtaQKBZJCUnwoUrUs5QFKdsVXYR4PHv6+
         CqdhBR3Qkj01EIPRk9wEm9gisXuiLhVwTykQpMtoF92370CHM2lHgHlX8D2tfsfeTKTD
         wLtUGtoLpmbNZlN/vuCcb/plzhMINkdSKpejizF/k3A9VSVVrIxx8dH8TxQ5ZGIQC0Ez
         Ludg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=B0YQURiA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bt7cpYYabsF87bYGI9q+OapiNMiHH5x+NNrciXY+x1I=;
        b=fJLqZzenXGPf4tACrQzQPbOVR135C4jhKItWSd8y/7JXVEjGDB9qBML135sXgoCsVv
         WCKIVBmZCssEA62RGCI4+WWiY1H85+CyRB/+mDrgjmbxZ0v+J0Es75x2cQFkWI4fdp92
         4TPta9mhi0M88HV4rHy0pv29FVMTcPsXWgUTqXvXornfc+4XggQ5HXuUY29z3TQHEmcb
         nARElq4TKsDG6JCHWy8c3wmD+8cJabglv0rofbe1aNZcdgP39jBu4VkKFAbXQ4YF/YAH
         Mv0zZPRtQY5evrQ+fhFFRche4cyQancBIpFBq07cgB02w1eT0ugWeMuwt66MkffwjqeE
         a//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bt7cpYYabsF87bYGI9q+OapiNMiHH5x+NNrciXY+x1I=;
        b=MkHRBA+xBEBN0pZQWpS/IxgKwQQq1sRSx7Up72eXHUd6sSbYCWMH+4GFgHNOsf6CX3
         c7DEOKuNO4su43M1yBqcsTssTmNtp5Zbu4eqx70mq8Izna7X0PNp5l3TImYbhWfE+lRn
         R6ouqY1SSSMN3A6/+OSHoPxyrDgwH8jVHDeGGQDoDvizcFvho1uh0OKsZx4m68SJbduc
         B8ZWt2Pg9HiOwi8aOgC60eaXWCTCsRHmLTMEBk1ITzXQ3EuDVbrB5hNVlUi1vcDlIOgA
         a95pMSAowAPCK4HuUD50gtogSDL79J46TW3JFwSXKGdmyWjTtfk5oDOtJ7BDHCvliZv4
         a/Og==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OK5caJzdJ6vjn5gw/nsCnjRYRsIX2wQ4A7zuMcC70AIGjgFxG
	HM9YDNc4YSXocX5M5/tW0ng=
X-Google-Smtp-Source: ABdhPJyFw+Pti/d/kY4HaSCQfrEPJG1Lc9mY8uZ2WwkoD2TqEkVTn4jB64Nlr8WbMRfBFlzKcvxEEw==
X-Received: by 2002:a2e:a174:: with SMTP id u20mr1722079ljl.101.1603292063484;
        Wed, 21 Oct 2020 07:54:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls112164lfd.3.gmail; Wed, 21 Oct
 2020 07:54:21 -0700 (PDT)
X-Received: by 2002:a19:8488:: with SMTP id g130mr1422364lfd.424.1603292061050;
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292061; cv=none;
        d=google.com; s=arc-20160816;
        b=WRmwuVrPjFJ9tA0PqkQj0KmUb55TQV/GS6D3erhuRJ7uhQMr5owwCjpov5DzkhXMeq
         aNY2KEW8bqGSHrgXLvKzKcyyIBivpkX+89OHyPqb11F7UdA5psqi1I7mGPRLxZ1ZUyWe
         lhGxne8f6zLjtPhN5tY9Zk9hrYaoweSpJC5llL5acafM1yar90NtSse8fxkKIFuYlSCS
         1Ym6LTw8hREU3O5AWi57b6hjjPRbtdsp2+C9G0YWacTJGkMl3ZuCfwDKNfQl8+tfM3zn
         cHJaz4qgWTeK3qR/+G7q9behQRRNn7RW96RReaw1vVAH3xZXONOEJF9InyNnCj00kpsU
         ojqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=aLiEt6xjYwXMYhMWN+h5yDChrPbrezJmpajHkt4tVuo=;
        b=RgkZmiAJ/apwrON4MYZ163LD6+ssBK11axITD7vALOz1iRBkZ1B+V78uGy+cOSlKBV
         jLR9EP0Jh9q97FBMwWrkbRjBnD6dzx4eT23IBEr5MHPuhglHT0tOGnwVnBwvpejwT7K2
         siMJHFkD0Pog7sKz0+EV0CMDQ4e2vyNfJwuGzDW1XqJqutEWdIRYUUN+t3Ps6JhAvI84
         raRae+01qJ9CQQJ9jlFu4cJJsuHKb43RIQ+IkAdJI6VchMrMPUvgX9ULeF0g1jPss4mz
         t/3oMxMA8k81ozQCpoUWl73Xt8uKRHIw7XeJfL01J+Sw0DzI/03OfCkThnYZct6HNRlA
         Mmhg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=B0YQURiA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 8si85461lfm.7.2020.10.21.07.54.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRb42d5zyWy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
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
	with LMTP id 3rlXqIigJeed for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRb0wq3zyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 21/26] arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned long as size
Date: Wed, 21 Oct 2020 16:53:59 +0200
Message-Id: <20201021145404.100463-22-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=B0YQURiA;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

A better overall fix would be to have size always being specified as
size_t.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/dcaches.h | 2 +-
 hypervisor/arch/arm/mmu_hyp.c                    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/dcaches.h b/hypervisor/arch/arm-common/include/asm/dcaches.h
index 73c2722e..87c316dc 100644
--- a/hypervisor/arch/arm-common/include/asm/dcaches.h
+++ b/hypervisor/arch/arm-common/include/asm/dcaches.h
@@ -22,7 +22,7 @@ enum dcache_flush {
 	DCACHE_CLEAN_AND_INVALIDATE,
 };
 
-void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush);
+void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush);
 void arm_cell_dcaches_flush(struct cell *cell, enum dcache_flush flush);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/hypervisor/arch/arm/mmu_hyp.c b/hypervisor/arch/arm/mmu_hyp.c
index 8a897f2b..676c7fda 100644
--- a/hypervisor/arch/arm/mmu_hyp.c
+++ b/hypervisor/arch/arm/mmu_hyp.c
@@ -47,7 +47,7 @@ static inline unsigned int hvc(unsigned int r0, unsigned int r1)
 	return __r0;
 }
 
-static int set_id_map(int i, unsigned long address, unsigned long size)
+static int set_id_map(unsigned int i, unsigned long address, unsigned long size)
 {
 	if (i >= ARRAY_SIZE(id_maps))
 		return -ENOMEM;
@@ -368,7 +368,7 @@ void __attribute__((noreturn)) arch_shutdown_mmu(struct per_cpu *cpu_data)
 	__builtin_unreachable();
 }
 
-void arm_dcaches_flush(void *addr, long size, enum dcache_flush flush)
+void arm_dcaches_flush(void *addr, unsigned long size, enum dcache_flush flush)
 {
 	while (size > 0) {
 		/* clean / invalidate by MVA to PoC */
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-22-andrea.bastoni%40tum.de.
