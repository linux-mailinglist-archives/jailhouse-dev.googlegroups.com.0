Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJV4476AKGQEVSUPISI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF229D241
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id c204sf307822wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919398; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rfvkvjjg/LaWaBTDzGMXrZ4GqhsKQfabCgPc+JptyGcel9IJ+Hv2Zp/QVJR7Sz/+Tb
         Q0UsTLQVOL3kzuAhR6eWQpmD8oquQwe5UUT3xfTkhqMyurZjX9nXFVwhntScElUwR7/Z
         NTLld9d+Ph7PcMEFT7jDGoS+cQsCTPXSEAc3MNGdP9py02R5Uhu5zSRoEK9GDdvU4pwA
         4beMI/QariUDlK1tY5vJFh1rwMse37fYjxFQkkOswg2M7MwSIAZSQRS10IJ7WOVUr9lW
         5Wtt6iKhlDYe9/c7GxPynPEw1dQJZHmjxxD9eeOownwwJAlGGVkyz9/UtEtODDOJPZcE
         JVAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=yRDHSAY/jPPomF/G+3Y2rKJluEPB0pRSwxErZxs0Zis=;
        b=0VnJQm4cobkIEKHjjtiV7cCV0woeClYycdY87EMSsYrN4FRpv3BpBzPmzsf4fpK/dn
         pT65taM4IVYJlXIipyxYHLoOzRalniIMGVo3qLjMshp6ckuMTZ1UOAasCln2eR3g/Sex
         Tem6h4pfh12DAgE8gg2cS60ZrqzuvrSevpC8HjzRJQp2DUrXCSXkv7Elplchu54oeq0Z
         B8WWOI8bs96XYsSt4qEPkcL2wjRHMtq6t+K8oHekSDi3tFxLNHRV182QgzkYjYU1nlrp
         ynidncwcJT+FVw2QfxZzVr3afTAin+WpIdVAOhwMNIOu5X9RgELmZOLacBq96DryKcNJ
         fxFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=pHZxRf3u;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRDHSAY/jPPomF/G+3Y2rKJluEPB0pRSwxErZxs0Zis=;
        b=gbufNBiEYHcJeR1mCBkPGl90l0Wy+j+JukoDc7gX/hHy5BbCSTJN8iKgrFS9Ytcnf3
         8rUnPKrARhtlSkVI5C8kqMogMbmdYU8+vOjZwk1WFtjb3zCx3hTEyJxP/hEYTCfvxhge
         eby2PcGm8CIftvREYztDRQ1aBNLZL29HF4pEEgPv50ABVXhCujcbzZ5AYJKDZHqF0kXK
         7XCfI+afDefEZc4QPAW6fzYKb5BqqlNyDJIzGNC4nl1JKV0if37XiqEyLSY93f2WjiU7
         XD9pY6XnfiFYfuyiAZ87yzwVrIXSGXsfNx0C/Ep3KDdV3v+DEqw7r/3r0tW0+hWhvbzg
         N9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRDHSAY/jPPomF/G+3Y2rKJluEPB0pRSwxErZxs0Zis=;
        b=A/7SMvala0GeErtdTjOjTQGJ0qO8An77h8tw3Ro5R1/hNc69Z46YEobHvqg18D/3+n
         c3sF8t5xA+qR/rSnIA7Rac7VN9A/g9QxTcX3BsmAIPk7ChmfTyIcpUPfWvGJbKpIeRD1
         K8KkJCVo9Xqz7U9oGu/Po490mKvudU9Nc1JZfHz8V8wMFpyX1QHQvwQKqBWe9NP7CICu
         xCufsocrRaa5KWeEKD3gavDSJJjzNKRkTI7+Mm3gXCxb5Are+zqF3zmDE5Lyo1t7mJrR
         d/13ZGvUpuTILpZEIjHwHP7vnXjbm8A26x+evjRwopP50n9dv6CwjPZ1U0jQ7huET4pm
         zhEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FP8Zb4TjBq9d8zVVeKdTJCQNViKVq0fVGJqzUx7282aY4cYkh
	nZ2rj/8/UQxZK9kTCfRJZxo=
X-Google-Smtp-Source: ABdhPJw4VHOte+A/s3NN3ZZ7lxR6tJSuSTG7TWWDkDNOoCoe5Cy2wuzpc4d4Ko+nRbqZnK8gppS9FA==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr819387wmj.154.1603919398516;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls406368wrb.3.gmail; Wed, 28 Oct
 2020 14:09:57 -0700 (PDT)
X-Received: by 2002:adf:ef51:: with SMTP id c17mr1504653wrp.301.1603919397707;
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919397; cv=none;
        d=google.com; s=arc-20160816;
        b=bh527VSHFhaNvVHpT4oaOHLG3Y/+9OOUXHkGzl8gSS1RYREAivzyB8V26yjln2YGjF
         O7tzD0JK5dKhpZeUV5r5m1KKUFkEJ/R/R+8IoXFNjT61xF1nvkOS8fKggsBSMmr/RGK3
         bgcxgHoP1NlIov0KFkzSEV8r31S53R1aoTt+7Dr7V37KrSXrZUS/uk2wE/j0za3ULskx
         9SNUeAhVo3g2quTUtvN6jXoO+YlmH9nWEwoiY2zDlSj98XlYpCJlVZ3Ymhpx+5Xnfix6
         z5hibv2+NXGdmywqFY4nIU943kz1GjyApoaCCcDMmTkoXdpa/3Wg2zVdDnqOsICqiw+1
         mGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=aLiEt6xjYwXMYhMWN+h5yDChrPbrezJmpajHkt4tVuo=;
        b=sDa/QstzkShD9xuNCXptrPNEFJalR6Cv/zJ47+pV5LeeVG8iJ9ipGTGkSaHuPGWGoS
         Thsk5CI0ug9yNCCqSCZd+00BRiezrOZu7eQECsJkIvaGSjWDUKcF/P+GFIA4jYzsufEH
         SvaSUZk+XPgZ5b5e1iGuafWlGTuEDemw8Rcc7vOtgjMGl/av+8OLwMrJQFcG+dp9XuGc
         Pf1uK1VJg3esszfgv7e8lVjeelHblMYAiOGsyZE8izvELhTlstVlKv4IkQtHfE6S0Czb
         iH22xY9Y+Pu8m4E88IKUgyGH9GtKSCgJSbONmFubE2q+gFyxVjIz0UDd1tPaVueuoZay
         UMvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=pHZxRf3u;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id c20si22775wmd.2.2020.10.28.14.09.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rn3k0yzyTC
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Au9TBFxs8poY for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:57 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rn0TLQzyT0
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 11/22] arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned long as size
Date: Wed, 28 Oct 2020 22:09:22 +0100
Message-Id: <20201028210933.138379-12-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=pHZxRf3u;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-12-andrea.bastoni%40tum.de.
