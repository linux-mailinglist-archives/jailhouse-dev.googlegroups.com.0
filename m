Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQV4476AKGQE63BLUDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A829D24D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:27 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id a20sf274349ljn.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919426; cv=pass;
        d=google.com; s=arc-20160816;
        b=cNpHjUkoc5cyEQ++dIMJaO17ij9BW/n7n1XzHVptipFiedlQxKYZWoUhQ4zD44Rjm/
         eM26EB/g64K6k2j5WZIcXk8Lqja5XB/e6GS823sqsSmIX6DRfkf8aW3aJjcBnr8Ln39w
         /c5v6qZHhAjNy1aXuq/0/N4QbkLLH7nxGLTulqzhIkdtN7YPtusMFfQpRkDfB5p2+XfK
         lNTUj3YZN7H5adsod3P8krecnr/UFeHHwhsX8e6m1u4HGMKgfuPjunvegUAAfI1EX+lb
         AwPQSbstzJIFkCj093X8MX1BIk4RMPg1gko65uTEToJVwAPXMq8WZACrGrQ6rVFvgN6v
         vx3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=AbRw9nanANQy2tuqsszoyj9iW+GnaM2G4j1BXh3s/Ac=;
        b=rMY2mpAHrRd7lo1fI1ZT3gVG1aRb0uLet1MWfFZ15AipfiOMG7hUP6utj2Z/0bkqGG
         YZYs0Z7zDYv1/My0OcvsqRbarWzGu0wKyzFsbrXDLTiw/lNM0eY9zw5Y9XyTrOaaz++l
         RHRDPW/f4Wg2tkTQ17Ie/ZQksyZL2Z0xs5U2+Ha5zrI1slADlivg9KZ8l1eXav+4TtZt
         tWu43nFae9Vb9hkTTOufGiQFGPIxPjWiK+vzuAqiGrVtH65dwpmybpl3N19p4nIXMjq9
         K3yoV9R8ARUovmQTPaUxxOtQ1RpTTjEK2wK+HTm7oA/tMZWhS5tBi51l43UvM2MvY01M
         +1fQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=vEHxMTQ1;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AbRw9nanANQy2tuqsszoyj9iW+GnaM2G4j1BXh3s/Ac=;
        b=PNqzSSabtImpeGi8tLLd4l0T++qpV8f3lMsaeVsYh4XWxO0T9SLILtpllOY3R8TbYv
         85pZzrN1iNh4yArdXzshWKi0Cr4fvYGjwrC1suzBiEUXGfc1GLw/+KXwYuN1cuXSynx9
         HRDWWjYVJ+jS7gVdlvI5hIV3g58uqySXwMdwzMynYVxfR8D07oitED74Q0Zi9eTl0XlL
         oZpKY2bedQ4Tm9GhoFaKn4FXS7caUCmrYnDusnY/tfCNqoLlVkvztXY569AHLpaKgdpJ
         qiMAkimSWDedADfgVmWM0nax3BHe8+pPNILnpBt6DA50jxgBfk0B9tHFITstCdYaGdiW
         gHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AbRw9nanANQy2tuqsszoyj9iW+GnaM2G4j1BXh3s/Ac=;
        b=kV7jJ4pS2KG2cQHelLexRQ62/kj9f294PH7/AyVpYHfWEEsa9NWvlQ1Ca4UJq6Rplh
         lJC55bgK19fvZD2bZTIWto6XUeCoao4vDpg08b6jJkPmb54g+DaAZ0JNXMFJl4SaZDCd
         LUIrRXrmMq4VKDmTeAffF/yxVm78DhUjqLZhwF4H5WlMOodVXW2tQI5D2vCe62BCUR9I
         jPZr/bn7IcE1YyYb7KAdOaObpNndxHNxbWABFzJj5DfKEk+FuF92TejnaAlyuD+FcR/3
         3+C2x40Zl2ZsetCx+4DEr0OB6OsqW2ptDFCVPVWyYHdCorsruxJdYMwZhtEpyZ7rWdf6
         J9Eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ya2d8H9MtT6tk12IsaxO1cWiGHdSletoL0zBd8NjRphbYRLkm
	zO2zGd64ASL2wGqc8+a5Ids=
X-Google-Smtp-Source: ABdhPJxAxo1gIpHMGUcFgVgV0rO3TUpUdObNvZ4wyA1sqSmxV2Fo2bmCeQCSV4Aj4q5Taao24R6vew==
X-Received: by 2002:a19:becf:: with SMTP id o198mr377497lff.519.1603919426690;
        Wed, 28 Oct 2020 14:10:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls276165lff.1.gmail; Wed, 28 Oct
 2020 14:10:25 -0700 (PDT)
X-Received: by 2002:a05:6512:32a4:: with SMTP id q4mr375521lfe.477.1603919425492;
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919425; cv=none;
        d=google.com; s=arc-20160816;
        b=OWD966jzxPxYHVxKXlh0re11vMtkxjgQHilyUzgt9ubeKgK1uZOf+5UZhXInZDDOrw
         bb3rUX1tUkTg33Dh93R3f8bcw0iS/no7fxWuLPSOoidm4oyuQUqEV72fDGAACUpMHicI
         Jlrdg3hgp6qaBjj4kNFFgM0R6RTegmxg/4UXtdsLvOsequdt7MY5pekIJ2VlJDTddRJ7
         H3wJDpNGWiYb/e557yad942euqmzQC6Ep0JfgK15WxFp8hnL5Gt97XsUkaT7RzkHmIay
         6xmck8wJeWv39oTwbuL2PNyTK+7oYtdo5r6Rk0MnIHcIRj9enXhhex85h/HfGTLXz8Wr
         liQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=5HL69K8y3LACMto5kMGMFrutlOaTtffh/T1HlBXm9ck=;
        b=k9fGRQQLzspSUEftwglssxH7Af3CxFnSxynYIWTSiXeyYa9H/BEuNRKOJVkSBGJNCg
         LR1u9ICNOrMbXEhFUSiYMEbQiz75BdD9KV5RqrkYS37ktWlCEn1eV4krT35sejMtmMKy
         PQ4pVa14hyiAxw2p6hjtO3izYUDm9YAI00I8CkHdpQ0ps7dRp5GE3tp9jggIj1wrTd52
         psZhB1KDJR4OE5OWw0guoAqbJGlS8PAr+fTbPzBigMRVJe+ICHjTTLqyuGQKooXx6fCM
         BGb5oWaWVXEYnsBmgelfpCB3uzK61qACzg8QZX1IfDgqgQpCg/AucWxRTF4EJBsAfNFD
         0r1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=vEHxMTQ1;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a17si20721ljj.6.2020.10.28.14.10.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:10:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1SK04lNzyXC
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:25 +0100 (CET)
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
	with LMTP id NkiB4vqLn9_9 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:10:02 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rs6V7hzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:10:01 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 20/22] x86: vcpu: force cast to prevent Wsign-compare
Date: Wed, 28 Oct 2020 22:09:31 +0100
Message-Id: <20201028210933.138379-21-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=vEHxMTQ1;       spf=pass
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

The cast is just to prevent fallouts due to the Werror.
rax is really an unsigned value, but int to unsigned promotion is mixed
too many times to be easily fixed.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 7a6543bf..5dd23d49 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -194,7 +194,7 @@ void vcpu_handle_hypercall(void)
 
 	guest_regs->rax = hypercall(code, guest_regs->rdi & arg_mask,
 				    guest_regs->rsi & arg_mask);
-	if (guest_regs->rax == -ENOSYS)
+	if ((int)guest_regs->rax == -ENOSYS)
 		printk("CPU %d: Unknown hypercall %ld, RIP: 0x%016llx\n",
 		       cpu_id, code,
 		       vcpu_vendor_get_rip() - X86_INST_LEN_HYPERCALL);
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-21-andrea.bastoni%40tum.de.
