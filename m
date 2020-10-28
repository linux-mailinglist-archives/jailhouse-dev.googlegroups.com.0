Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKF4476AKGQECWLXUQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC529D249
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id s6sf69622lfc.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919400; cv=pass;
        d=google.com; s=arc-20160816;
        b=zZpYQr97Javm6MHb4fKMJnUBpLkZzCt9z+2iAvJuwgIgp0J1bv/Pu1dNLp7v5YiFTK
         aWBpcR4yx1Ld4GY2OloHIh7SzaDp5Of0B/Dkpf1NbWHL1HWnavd+4iJp5DksOPfXgEYO
         H0rqcY8YaU2Jwn5M1zppoXq/SIWgPVqXsrSPtD1XUm13CS02go3p6o78+ltwWAnUYifO
         fOZ4Wp34xhrWhF42eu459ohij/4U2oYyFQrg7o3vMcbxWL2iOlYdp7kXx9kAn0pfWLas
         qgeZFD5r8qSd/huDIhmbheNdFzGRQ6UJCaFMHxwA6/gSYv7l895teQJuUMaJH0L+ypM2
         0efg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=EURbKE9GHQ0voiFLXQ9HqI3r6cdXlTMoSR7/qsQKWMQ=;
        b=zFzPCmeVSwSVeg8m5eFmWHL8FX37W5E5fHrZJ9Z09qyKl+sVTe5f5s11HHdREFGVsB
         guc5vNu4mmXieWJ99GU9MwykArdocK5u9MuxfQORpwWR8jrgx+lQheOYRvdjkWx4l5bB
         XqHBlAGuoge3z8BoqwPdSsos2z0tj6YESjVyD/1SJEB8nNMWy3XOwWAusGMyk0GPhIX1
         Jl/lohmb2c7VYyb9ryqbqbrPzmarF0RlLMn6EQLgLv1+QPaxYW7vU39SUrpgllIf2rWf
         KbG3tBwwY8n2Ezd3/KUwu/F7D5qNDLeNrmp0qaD/W92395opx9l3rImohI5hj5GXUkSr
         k5VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=UtjeeSTA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EURbKE9GHQ0voiFLXQ9HqI3r6cdXlTMoSR7/qsQKWMQ=;
        b=IdY2Gj7lrouIPMhKJ9+yzq9pHP1Pw/dOewwV0Pg+/v+mxl4WbX2NWX7O7nJ501GQ3L
         khm13/PDas6Fr9/SlZE7ckv/7wA8TfhFm6J1QouqXbB59OF3VXBM4jUnvtYwoCN5UI/8
         a/p5uUJGdGf7CVXZSdXveeNEdtiASsvwq7XGcjNFwhfsSQeKkuKAbMhHhBRWxfxmzMj0
         QQwOuO/ynb87Ve6wxHprWkxH4va9aMnj+M1NZW+NkJ2nyLPr7xImOLNmRT7QXzEcyh1i
         hOwZMiQgw0fuWmTIoqPvk/IrGVcUiA/padMyVgfj5bbR7gM4wDXMHc0NLZSRBOcIvEey
         3mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EURbKE9GHQ0voiFLXQ9HqI3r6cdXlTMoSR7/qsQKWMQ=;
        b=uV3FwFQqoWjSMCva4YV2z/+AAMc4ysmJrSxNev9lyhBnil9hrW+384wAazntsIXJ3R
         PGTuYSFDxVnR8hWE8BK34oWsKUFcdD2Gb2bYsJqtuF5iVxOXUJUUWd1WiQSCgtKv7iUo
         pwZcBBpfwmxSBuVwXjEWBuqsDWwl2nxz/8uD7Vv4GWBb8Tncqogopculn7hIap7QgAzu
         2Y+BzYY7eko3OjVx0ZoUxW1iJzM/0xWSGLOa5e5u3WdCNM32MAIh+C1MOMVuUh413ijK
         sf06Om6VCA0qLkcW7hnB/NMpgGsyXJ0dgMa7dR7hbl3KXWP3HCjhi7Yz8rb4i4nWM2kD
         d8gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wwJSVfVJ2+Vxt+cr+x7JpVeZ5+4NTdy+TV+QhP+cRjwh6djlH
	e67+H4q/5dehovwGYWNVapk=
X-Google-Smtp-Source: ABdhPJwuzjFxKxTxDcEwVxa7UbzAUt3yREoXHlwXK4CyY4J+KU9JFDOK6quuNBArEzoyI5ps7WKMHw==
X-Received: by 2002:a2e:7815:: with SMTP id t21mr396373ljc.217.1603919400487;
        Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f48:: with SMTP id v8ls130490ljk.9.gmail; Wed, 28 Oct
 2020 14:09:59 -0700 (PDT)
X-Received: by 2002:a2e:3615:: with SMTP id d21mr406920lja.89.1603919399269;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919399; cv=none;
        d=google.com; s=arc-20160816;
        b=UCFB9HgZhASd4sVAvAKVT1JnzkCbTHkBVpTq7DuZCyQnWpDxLwr922e06gNBj1+TFd
         6mEqh6tvPCm2ijXuyr6cq2T6AvGlsWFMxdbhPoXDk9rrgavYdnQ+D6cS9HmFuGiHFOIX
         pdPYrbyVTs/ykQ7mCTzK1QEK0e7queCqj7XLI6WMuCYP4FPTFWhMY7MVF4ADVdus6Fer
         DAZqCEOB0sQ0sHH40JJXWOAvrabIHntVo94rIdFr+Tnor3nQlyED3/8VKZanmBUpHrOr
         GeMHiSoeArhNp0b8nH4Urp6bbQsZr9QiMuHsbI+rsRl1C0hiGCz1U5vzxxv3ZeRbn068
         VjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=FAfnomtQiS49yTGytpd0/fRq+rNwoihE5/2b/7rU42U=;
        b=cTvMEHjfBXCj2krjgbIZDjo+8uk8qRg7GgLR2ZqZXYD7kZLYcRqJnK7qoUlAc+snS5
         9yGbTqKr6y4fHcNYIS05zZcpE44BV9ajsrwppjx8KzzHiYGAZa/4wKKRdz1m38jREZR+
         f4EMXsfdEc5Z69ZJOePWI0GxPxq4U4XazfwJShihIi3gyrfXMfltVNlpzaW9LTLFXdMp
         na38YqEes8aTSLE00UXBFIXHLIuGPIEnLenjljjsBdHPkF3Elr/nTPfFeCypwt7ScqXB
         wWVO8xTByaliSi2g9Bm8VowXSxmdKDLAsHhmBAkDwLDpVI7OKQdAjX1JmnJBIYNuQoIx
         B1xA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=UtjeeSTA;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id t20si15815lfk.10.2020.10.28.14.09.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rp5ZXNzyT2
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
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
	with LMTP id TotZgfIV1tWg for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rp2mgkzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 16/22] x86: fix simple Wsign-compare warnings
Date: Wed, 28 Oct 2020 22:09:27 +0100
Message-Id: <20201028210933.138379-17-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=UtjeeSTA;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/paging.c | 2 +-
 hypervisor/arch/x86/svm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/paging.c b/hypervisor/arch/x86/paging.c
index 9f846dc9..cb7ff929 100644
--- a/hypervisor/arch/x86/paging.c
+++ b/hypervisor/arch/x86/paging.c
@@ -41,7 +41,7 @@ static void x86_64_clear_entry(pt_entry_t pte)
 static bool x86_64_page_table_empty(page_table_t page_table)
 {
 	pt_entry_t pte;
-	int n;
+	unsigned int n;
 
 	for (n = 0, pte = page_table; n < PAGE_SIZE / sizeof(u64); n++, pte++)
 		if (x86_64_entry_valid(pte, PAGE_FLAG_PRESENT))
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 3c3e6854..9b1664a5 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -698,7 +698,7 @@ static bool svm_parse_mov_to_cr(struct vmcb *vmcb, unsigned long pc,
 	struct parse_context ctx = {};
 	/* No prefixes are supported yet */
 	u8 opcodes[] = {0x0f, 0x22}, modrm;
-	int n;
+	unsigned int n;
 
 	vcpu_get_guest_paging_structs(&pg_structs);
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-17-andrea.bastoni%40tum.de.
