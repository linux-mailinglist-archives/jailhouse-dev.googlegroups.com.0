Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH4XYH6AKGQEGRF4YZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 74850294F30
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:25 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id a4sf1804990ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292065; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pf7Np35BdEH2SWLptz7qsh4uzJ3ZyrWs1nqcCwMIlKPb3/W1bqJqQJipjj15A6WTRU
         2/EZgVoNkmfVXS0sNZv28PoCFxTyj99uUSuQExXT75QliOR89KWG3KQTZ/mG0nxsp2dU
         TZsdgTzoV1UqAbfVE90O/JAw05gW738qHUOD5UQUnqF91zkvkHmSeRXil9Qg+4cDf/GC
         RmjpEOhY8977v2Ot9/TzMGUSosUKV1eok5AOdoQgkdxUXsY/ZIh93J47POPtTgKO7/uo
         8u5doOAqa7vzw4AV4aFGbfFfTGRMQ4IXjuTDOX5Bp4xqVlmo+DGNF0HNKVdHB6ZcVoX9
         26PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mpdkILRKody/BoxAk+U2sxMoO2DIxN4n+tO89JcVnqY=;
        b=r44xPrJf1tnSsO+38itpwKd8jmJM8ZXFbyjM3zXvLDLE5MFmeuNNm3j46UhBu3Jicr
         uqXGk6AgrRS2RB1ERuLwgc0cncBjxvJBAEE2Jt6yYbOr/hX82dGSGmbvV40mQD4RlO2Y
         UbpeKOk3T62QyhI238WWna+53BVKTc6sTu3B+TmLF19Ex2M3ZET7wals7XTrpLm8HBMB
         xPawSmCHtWiOTIE4rA9VmFx0rR8HXVVCcFwz+ngEpX/Uwyl/4PG1IeWhSIfe0g1ofLSE
         81Vb6YGo9C4TlNPNZ5PpgvVhjt/VRQ6tk/S1C64Xcj9awbMlFfgQ8NMHL9u94X1ApDey
         gLNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=V3v8V+bS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mpdkILRKody/BoxAk+U2sxMoO2DIxN4n+tO89JcVnqY=;
        b=FfuBlT6GLznvEfDGC75eYXvCb+hxt/RN/T7PE2MTUq7OCfPP0vkkFv4zTwdvTzAABb
         S4+wSmTQruub5NVtfzUodEjYXrKJHba5DqZeMCG29hnF4oSYEEwbeQDX3sljLSfAp1iZ
         zLCmJaHn1bMeMs1CKQkjET1m+trG2hprp/I0tIXswWSoTXnc1GR+Hit/FYBrGyicQnzv
         tsYENcmj/QbCSEcruXE9eZKYDvMWcHDBY2b+e3YRT6KekLxtcpm/MBdaUD7tKk7JrxvJ
         z8FDnu/ZeYVdePO3FF6fuY3KOTYdtuQN3FuUhzgyRaMxWY29sFyYEvcfk3NzGx0WwcKP
         17Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mpdkILRKody/BoxAk+U2sxMoO2DIxN4n+tO89JcVnqY=;
        b=Y4NBPh2ffVE4glgtOKIYJM9o5acI3kfPEFDjdnjLpc5K2AG+vzaLL+ZPFWGfiWygrN
         tjCDhgZxtALxNdyXDhB7RpfJeZq3L5Bh/QnY+lph7YYtw+oh9NtypGc6oITT4jiC91pB
         M40RvD1T50oJSCAEprlBQ8aGLgj1G5VvRqiBllk6XQqtzaXKCMxMlqnyXgR9kbKAQcxz
         3x/AXdKu7/2n5Ip+Iswnyvn+vojU7e5/nyMK/jK2zzZrwnp495wjAeYXhX+cL7jMYbvg
         o1NkcWKBmzKFa33ayNTa9yWEBSJYW0ADIK8df7qTj/OplrIgpRs0kSEASmlwcNFFW2A6
         2eaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533IHSsmaSyOOayNPqPNTaO8HoCuHBfxetO2HGakqwiJKIWOFqxk
	toz0ufQRM5gMP7f1TfCLTzE=
X-Google-Smtp-Source: ABdhPJx+28yfxFpYmPbwu5cpFvdRQ7AZZuTTMt+J+iretYrQWlrYG5RB9eZDsB3lfXQo5qgPyqsOpg==
X-Received: by 2002:a05:651c:294:: with SMTP id b20mr1707936ljo.288.1603292063557;
        Wed, 21 Oct 2020 07:54:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b016:: with SMTP id y22ls1079991ljk.3.gmail; Wed, 21 Oct
 2020 07:54:22 -0700 (PDT)
X-Received: by 2002:a2e:9955:: with SMTP id r21mr1537056ljj.124.1603292062441;
        Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292062; cv=none;
        d=google.com; s=arc-20160816;
        b=y3ARPpT2QjnvKhz8iY+plq9yFu0nSkr/pOgMediImRqqGkXEUlSvfaXtK/tHkvls2f
         5XAvfZP5XQs2P55IB3oBaOijDgcUFQsMrdXZe4SrtrLQgVl96RbO1ePH3pZgDH2HIp1C
         ETuAsxHALg1IRflhdR8I7COunySIs2lBQn5pNrpfXmLJwhUJeNxDdMogZO9gy6n+QxYz
         1v0wWx3RIK6w3cq8LRO4NsY3hwXPeverfS2jgtJmG4o8VrYk0QsymFV6pcW+dTgMirrc
         e1ZssYkOR7KfSW2L2DnUjnm1pECjJAd0YSxAGJl+8+/UyNVEZ7ou3MePXMHhedQBNLfw
         2olA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=MZ9+ZtfTIHPp7yEnKmXGJFizXJmsM5+J7yu8nAXe4/o=;
        b=fVUO5ovaCYuyolSXvdGqTEVDGOjU6oUXc8bHpov+r930S09eRemG8Ay9I7m+nAiCnc
         1ReKrN958Etx2VjKOu6QtT54vA9ujuZn4NC01RwH220YnZy4KIx5TqHqCbs17DRoW5uP
         otYrsV/EGQ2h+CQGqmQIHV8qB66Y6i9QoOmpujR19VOmZCuxzHpgbJct7baA4ls6G0wU
         MhOIAjNkGZn5Q865VoH3n609CuL94Syj5by/7dFxu/d6Pba+mQdxJCEIJdLHrx+1/hR3
         +8id2dHTjEqm6OZRRqweoBLqlaU/3Nt/VIvdW0wVcWdZpLzKEjuJdL7peDL13kjgHk25
         Y/1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=V3v8V+bS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id l28si81438lfp.11.2020.10.21.07.54.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRc5bX7zyX2
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
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
	with LMTP id UB9Tk4k6tIyz for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRb74dKzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 24/26] x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
Date: Wed, 21 Oct 2020 16:54:02 +0200
Message-Id: <20201021145404.100463-25-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=V3v8V+bS;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
index 6d265bca..140aad3a 100644
--- a/hypervisor/arch/x86/include/asm/bitops.h
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -51,7 +51,7 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	int oldbit;
 
-	asm volatile("lock bts %2,%1\n\t"
+	asm volatile("lock btsq %2,%1\n\t"
 		     "sbb %0,%0" : "=r" (oldbit), BITOP_ADDR(addr)
 		     : "Ir" (nr) : "memory");
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-25-andrea.bastoni%40tum.de.
