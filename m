Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHMXYH6AKGQENF5CVNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D8294F2D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:22 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id q15sf2821904wrw.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292062; cv=pass;
        d=google.com; s=arc-20160816;
        b=DVpCwCFpcoMooTpUsF74b6GlGlcjuVdK5rXZVsjWtR19MqbipXiG9AXoyw9VW9kyXU
         WCX42V77SEx+Fpe/Cm3zVR0RZKEl8Fc3D+L6mFxRanAYc+di/PGZGKOvp/xGOaFQWX0k
         n0Wc9H6R94jQoP0/p/G1zkU3CXHzwtnuo82FvasoOuh1QdAstH/sGpEyKQi9bE5P5+M+
         9ncQ182H2IyJCxTo3t07aYm6gCXGdgG8hMbJvxkyxVXt0EocCyw2ZXXdaCex+aMRZOXB
         8E8Lb7R//DgaPxNn16Lkr07jeGjmldewxN7eB7WsjchpfDSGWnCtVFyZ5WGUJ9CPdVZu
         9+EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ghtyZ0m3B+UmxschoFWNKgydx0Os6TXwiPjObbeY05I=;
        b=LWZZ969uUmoW+u1rw4gbay5miI9zDmx5E2/RqdiCP7wJ/o5Qju2TMJ4LFVanWGUoDY
         UyfNFdOvc0S1spOEWFyZYUnGbbBYqpbaSdGg90fieWGhDxITiVrSvegxeIvxcqpNykfO
         j6Wq7wsfRJ8/ISzCO9plODbOMqAWyaVUPZAAna3aBWwcZ3A2JjqW2PomfdeJrb9f1T2Q
         jzHswOmoEJjs/3g3uOanb1HEOg2R7YxY+5r/Dn6Y1xsmC5nenl/mgP0+GXRchXErDPJ0
         gYFmpuUKU4NRCTv3vYxFcsQr19RMOcQnq/EwdoboDn0vBtRDF3cZ00oQxvNV6ae/z2Q6
         9ABQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=HUjY0Deb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ghtyZ0m3B+UmxschoFWNKgydx0Os6TXwiPjObbeY05I=;
        b=j9il3zONwsUC5HNmEX/jiBE8FEy9p9y/2WJ915ytm9I7zbZfhwDK0HZJMmELinsIEP
         Rk3+RZzuerIZOqApQFb2rtJ9AthKgdM1/JUWDASh+beibrRKk4U3rjk6++DhrMvBwL67
         NmfVOYpUbYTCYbUSUjLxGC6KdNNYjhFr90Rfqg9+lZjWxf4sthJ4gmz7SbnEc0K5st2z
         dZ9Hobenfpbz0L9NfBqE7hvlfkPFgQCot4qElznDLSOxH5jN6O8xejmAU1CKxcWEhf47
         1oBvuONxYdajylSfzg4AFfXetZ8ufCPdjJubngYoSlrCPojtqimqdYQgN67onLlZj5ie
         s/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ghtyZ0m3B+UmxschoFWNKgydx0Os6TXwiPjObbeY05I=;
        b=JTiLbnDGpQvy1nm99gaSnAS2pnIU1B5KQ61Um+9Pc9nQLoueuxtFHUYif086g+NKDB
         pCvbQhDBe9I01idOLIexBQj96TWdSe09OOoZ5gMrQz0z2Vxc3aMP9h6tCQbZ0ruoikIo
         OfXBqNGlUWVK893FgwSe0Zx9VXXSLYqx/TUdDpCNDuzGbPcSD5DLE8r96T2QQLVUsnwE
         iZOx5Kb9bqhpSG9ZjNykmI56zqklP8VDvz9iqkSM1R/0/b5whudgQNScebC3qPZOE2Jq
         WsUA3bWIwb9kugSpByC9pPavJjOaB8O+LAq8/NsWtNPOugWfvHtW2Oq7HB5oPW2kGqbN
         1ySA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GfDl+KvFINP1zpMWi1MgtMcYm3wrgow2QFRLM2qFZASNF88ND
	wf4S/j35KVXfuQKoqLpj43Q=
X-Google-Smtp-Source: ABdhPJyWrhnqmpYmmJ78pOI2FJ3sbckpVsw/uN9vJ/MjhTQuS11b6UTCqadZUAtmLNfPwv2KRs0e9g==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr5489864wrn.188.1603292062125;
        Wed, 21 Oct 2020 07:54:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls59564wrj.0.gmail; Wed, 21 Oct
 2020 07:54:21 -0700 (PDT)
X-Received: by 2002:adf:f903:: with SMTP id b3mr5311779wrr.142.1603292061166;
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292061; cv=none;
        d=google.com; s=arc-20160816;
        b=zv0VJiP6hSQoUdnzyyfFKmkhHGW6ZEluZSQL2ZICy1Kz6jQ5C8qqPv3OvI8UMkLeDZ
         Gx72Ce27rAuDvOdmEGBXBkWdTMO5H+N/s9AybaTJoRTySpDs5lMldQ4m364A9ef8uqw+
         pbDPMoKXPFgrD61/J9WQ+Uy7yPKC949McOJxUdTGT1sCgtAoRBfxjiEoPQx5M5RaUkMv
         omvtOogkjk8kGw5L6uuirD0ZElLMvpqVVUO3MBGAX9k9Yi6dBrKGuVa+nhLb9TRafZ7Y
         p8FkKSTWTmjwV5Q9ZTPYzY1Ys2WrT0mW/gfDWBBAIN5TTPxDIkgtYi9X50NKdm11gc7A
         sPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=YRQoK+Ft78Djdu5ZSRpiCLhBAIdCZbjcn9tkxtitT3o=;
        b=EPLU5NufwNi33qyu3X24kzgrroiI4WaJpmDjKh3+uE7ahPUJTvuGRELljtey5SzNje
         TwFtjUWSA/2p6+++6GTBqyToMLKP9NK1VYuPxjJBwQfQWsw7ieSPDe55NBCt0n3Y3t/j
         DNfKwkJGnoWUuaBl014jrA15mGCBctblktLbd/ua6TcQ7Ele9U0TE6y9lQG0e1cfrgLW
         KoCuDXRFYSlXXGdy02iNkt/ubBt1dU2UifYIMFT8LDgj2/qGub4foFhAV9GoUxq+Capi
         /fgY9t0N2zwCmgUIxZIW6rozpehg9Zvtif9F1raMC8neax5AN4MYkKLt0G9cbLzNFDYQ
         RSkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=HUjY0Deb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id 11si70397wmg.0.2020.10.21.07.54.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRc754GzyVy
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
	with LMTP id lyCWnlNoAfmU for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRc42b9zyXL
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 26/26] arm64: smmu: fix double negative
Date: Wed, 21 Oct 2020 16:54:04 +0200
Message-Id: <20201021145404.100463-27-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=HUjY0Deb;       spf=pass
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

Don't negate the return value of arm_smmu_find_sme() if it's already
negative.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 7266fdb6..26d5024a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -431,7 +431,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		for_each_stream_id(sid, cell->config, n) {
 			ret = arm_smmu_find_sme(sid, smmu);
 			if (ret < 0)
-				return trace_error(-ret);
+				return trace_error(ret);
 			idx = ret;
 
 			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-27-andrea.bastoni%40tum.de.
