Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUEQY76AKGQE6PSY3MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEB29643E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:41 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id a4sf1034951ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389521; cv=pass;
        d=google.com; s=arc-20160816;
        b=sSQef3v0fc2QfpHHllZPy6jRQ86VFcAh6SZgc2EGSpN6SexcPy9SX0/t94dwNHM8zS
         7CM4iuyu3TX1eCsllw6TdxXLqP9wgxC/H5eNZ63CP3xJA+b3D3uZZGYzJyFvifhWOXCF
         VYYa0TqOk8nYm5N/5Ig7wCaR1QNO0VYzWhsr7arnhx72aMW+7LZ+lIJO5ObDq/h/eIdQ
         7FMQfBVI1XIX8WkpO7NQtkNYtVMxA/d3yomPlkhDYM4sj/TapQNRQOtbru2s7/Xi6tEX
         vrr60XenkGpjhL0T173ILZqFUhylt2mzPAGDdRpZTlzqcTj4Lc+K2Ae3cedhsKS0q7uo
         0flw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=BUb6rSk9MIaa0gR1R/dw1ipNbcTJWY8yw7BZ31+G2vc=;
        b=Ng1Ku8491M7pSMuceKy5MYyhc5CIl6knbMPU/EVStRYk3c4EZ1EDv2jLl8b1MkTzBD
         zx0FxBILAn9OE0GEtAwMHyclc7OD8nE6w81L9iaYpXPaiwe6DdffvArVdrGXqm19Px9x
         i12vEOuSJvTezsXc6plAT6vgGu33XaGBnR1T0AKZT02+Wbym0pIMNaVumnupkIayXDvx
         /dkkXf/M+o8QDa79lq/BFMwm3PEb0BXDkM0PzGiNnLR9mlf5un4OdXemciUjMSysmOX+
         yMbNIgM+92VmtBMFeq5fEmc+V7pXB0JW6st+cRdPKUYVqbkIqanzUg2HhdgCOFEycE/0
         ZqqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=NMiTU1k4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUb6rSk9MIaa0gR1R/dw1ipNbcTJWY8yw7BZ31+G2vc=;
        b=J3UxYX4u21ZuEIZ9liYwDn6sV++ilAVVTjAc1WdMmKSr+jT7LoGkNu2aYsX5ypE6tZ
         cCX/7v63+xFtHRm45uaLgYGajNPY2Xg15HT/3boF3nZ8Sb/VcZcXbeSCUGn+inJK3AvD
         J+QmLbAh4chwzdbbkdcGLH1r7mO1DiqG2USfUxh0eatRzb1Kj3xWio9Qgwg8AbjJ3dzC
         1tH2T9h+zsVPsbTEhM00kO0g1xROM8HSw+SCx8Mvc0No/bI1KP+nEJqq4RRYMllj0Of7
         w0LBPmX26ziudIdjsZr7wMr3jWHoYwG1fLXJaeAcMpHUZdJjzGKJMioN1bx44uIsFt+A
         b+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BUb6rSk9MIaa0gR1R/dw1ipNbcTJWY8yw7BZ31+G2vc=;
        b=Xmk6RObfw4N63sKlYsgUDVz6VI8AzgB7YuKnie/+Om9sZ+MWgQaFWCD59WTOrn2b04
         qUVPw8iLD4Z95YkwkOiCv2qbqJ9pUebig4mWFBcQnv66+K6/vwBjtZJWzA/AiN+Y7SdV
         ZudB102Ojvt4axuOuIbEJojDG0cZixwCcEo9k0iPDZ14pRttJhCNHn4hJsbo4D4nC4Og
         sGyDn2TyMHhg1D21HjTmfc3ZHi1raT0tMoCZyjA/cI+UkDA/zM+sBabOrurmGrA1TtO/
         dWefc6KiAoCu8fVSubB+nOiQ6bqY2dFHapcFc50Qy1Bo3/2rgS30mB91Yklf1/0ZpbUY
         mmRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533j3sg9RHwRI0sUXqyF0blz5wh6hM4vL8czuU1hpNEPGG9mc1cX
	zC2+ZzHCbqhQzI3cMCWyLVk=
X-Google-Smtp-Source: ABdhPJwlBPDRJIRAZj6b+uBPXVGRYq2sfoEYAY4iCalPhzbH8HIomW85Aj467VMqxmuSq/1PmrkmvA==
X-Received: by 2002:a19:6a04:: with SMTP id u4mr1337536lfu.493.1603389521106;
        Thu, 22 Oct 2020 10:58:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b6d4:: with SMTP id m20ls494134ljo.1.gmail; Thu, 22 Oct
 2020 10:58:40 -0700 (PDT)
X-Received: by 2002:a2e:b4e9:: with SMTP id s9mr1626958ljm.141.1603389519973;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389519; cv=none;
        d=google.com; s=arc-20160816;
        b=WqxAjycOWVrEwwLZy9L/KIIznw087sueAVh6Okh8DHe/nMRBRPq5VrnVKM3chX9ZJl
         ZL7av2OgQYMYaxj0pUwb9rxgMW4MnLEy6jUgEiJMg8kepPDMCptGDBVLbzwRbx63XPgv
         YGT4WuhZ12yoXI4NyVHk4qvgYx4Vjg6Yd9i6o/s4sHjSTGYLFFTfRKfqStNH+VGeR/9I
         Pg0hBU/smHxkNoE5T684Sxl8ZrBB5xCjfj4uxU5NHFu/YFVVjg1MC+xduXZcW+Lvkk4j
         05VCvVyMC8LnDIJmsCqeUspAp1ykdjjg3xK9JS8lAteG6iu2Pdor/xdyy6gYqePDpJOq
         zeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Q2AcqCj2ACJfAaClLkMK9aJaf9YXUIPxmitnDMeXiOY=;
        b=rzRNnbMUs/bf3GNwo9/an6Ni+ps0UkdTc2u0fz1YGzys++MAGyJV6SmZJPt/cwpPTr
         T8e7lSmNfFWuGoaa0nrY5SxaQV8m8lgarRHqgbAJc2BUFMmysX5c30FunwyEzqpg/gIR
         kI0HdLJpol5oVGoak+xFYnGRm8JFW5OHK0Qfv73rHiU4CID9ehfoHbC8dxE4QsKHps0K
         fIDv7YQC5HLiJgyVNlf+kAtLDcGsGKanhrfmc5ua2Ix/Mq7B3e2btxb9oWKBgOs9ZUs2
         70JK7VhcoIeHx2VzwkGTF8x+bpiQst3RcttHxGIMnUqx/TXy3jHKvf2hO8K0QIK9g+gZ
         3CTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=NMiTU1k4;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id x19si81522ljh.2.2020.10.22.10.58.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTq32SqzyZp
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
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
	with LMTP id IbBOr-drOR8M for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTq06ZLzyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 18/33] arm-common: gic*: use uint instead of int when needed (Wsign-compare)
Date: Thu, 22 Oct 2020 19:58:10 +0200
Message-Id: <20201022175826.199614-19-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=NMiTU1k4;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/gic-v2.c | 2 +-
 hypervisor/arch/arm-common/gic-v3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index c5ad0607..6ca8cb0c 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -277,7 +277,7 @@ static void gicv2_send_sgi(struct sgi *sgi)
 
 static int gicv2_inject_irq(u16 irq_id, u16 sender)
 {
-	int i;
+	unsigned int i;
 	int first_free = -1;
 	u32 lr;
 	unsigned long elsr[2];
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 949c4598..152b07e4 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -529,7 +529,7 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
 
 static int gicv3_inject_irq(u16 irq_id, u16 sender)
 {
-	int i;
+	unsigned int i;
 	int free_lr = -1;
 	u32 elsr;
 	u64 lr;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-19-andrea.bastoni%40tum.de.
