Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKF4476AKGQECWLXUQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585E29D248
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:10:00 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id t17sf342441wrm.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919400; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vzb+FvuttAjt+9YYxPhbi6zuj5f1BO/pWUolW0Wa0gBlpG+rqF0RGmhhIf/TnKU0Vr
         1MapiwOYNOY7VNakhO9rQXpxd+9zhWBTsxcXDExjniHX4/meNA8cBmyw4Zw5MCUE9px3
         gzorHT9KzaYkgPy2XKIAQwPftbqESu4SS1dVSD/RARgcy3y/0uKwX2UaxQ49/jPRF3ph
         9nxdiucWv1Z9NLsQDZidNRs/pwzpPS+zKkHMXyCItWTLRS3oQ7AbkGjrepl2ZuU00/VO
         PXR/Y34uI3zXzuz46/pDGgtVxtNgL4xi4H6r6kmWH1bxLh4f7hFZHB3PB/fknvrCN3x9
         d2Vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=paAok611NfAchoDJRMrRuI5Gyo6VIwZX3yjQwdlk0qk=;
        b=oAkLCujgXSvqggntRvTRq75JOkQ1BaPBzhKjO/L34GFbjJAFg8sdwhim3I9Zyoz7CU
         4Lqv7ICJXysCd2abatGq45/t3wQ2DzQO1yFaM4qumQZCZMzR/Rn3b0no/u/PzNp2aP5W
         eTWI1d/BtzP6XmjPjJiR8FHX+sVs/9W7cOIOQDI6C1lNU7h2VY5ahHMgII1358EyWc0w
         37h63bvgtqUZQlGdSB3Nd513jdbYw6JCf7N+UJ9nQ43Wi8e2Oas5xrLIQmvnd5t4kTbt
         X/fJ2+B+O0mENDh9JBI4iypDCMByqYWj4fJ120O5o4P7Mxhl46EKlWaonicLh/w47a+5
         z31w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=HO7bWAKE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=paAok611NfAchoDJRMrRuI5Gyo6VIwZX3yjQwdlk0qk=;
        b=O2IOsLrYDW2NudtnZ8PRqH9yyUjofazB4CeZTw8FGcGscYsXgqzFfDwMlZuwfSAH1p
         pbI+QLaG8m7m9XI2ZpKSDH0X2ig/68OwkAd2r2vP+G5nYMs2LdHN5MaBZ0p2h/Y3+jAN
         OalqfVgadUsSzcE0kSnFHYir/32uPmvp+FHZ1hvnJRm6moLOMCS5aCRbektNK3Fuedox
         Le35tLMnGrnXFfaTF7JqKJKjjIam2CWMp7SbG9dWqGE5Miq3ya7FsvlztJItPN51zyss
         8e/O+WatzY/18nV+THxWYaO2C72aRvs6GwvzMqY75p5tjD5R44uKg70onbBZsxCav+9o
         6znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=paAok611NfAchoDJRMrRuI5Gyo6VIwZX3yjQwdlk0qk=;
        b=PPUieTkGxppw8BShEziurOVxcmLRqNjn7ymEYYhZkZNjjdNAXE4m2LsmVaI61blA0m
         PoGSl9+hLy/k6qQk0CpMmJzPf5HC34MaVsR+dhDFkGO1wCo6tLbsRN/MaNIxJc0tI2GY
         BSt0kq00n+W5vVTLlT/qdhy+CxMlVa96UMQ+itQysIiF6eDr3paNLRRd6JMbrz2eRjnx
         lND0SkIqeFsqMm4fXaBFCSRLgzOfdwK99B7SfsnjTgF9S4BvqQbj0Eg9XOmpZ/59rhoM
         qsqvUHCrG4Ph0xiC56wMmkhXdxE13yYXUYm6aNqx3FXHu3Y2PW+rgkFpFDtco0f8o99I
         K+SA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jR54qxQQJtg4KoIwK2A4e8dSfXVStvdszTOjiex8Q8vWQ+EMI
	fKPaipBHp0nYVo5IpuFT8Yo=
X-Google-Smtp-Source: ABdhPJyIGeBvgI5eyxPqawUYsoi13l7kwaiA6lQ/uaz9JIW1afgqlhUajfU7maxKr/IHJirlts95jg==
X-Received: by 2002:a1c:2c02:: with SMTP id s2mr841493wms.66.1603919400310;
        Wed, 28 Oct 2020 14:10:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls406470wrb.3.gmail; Wed, 28 Oct
 2020 14:09:59 -0700 (PDT)
X-Received: by 2002:a5d:6cc9:: with SMTP id c9mr1561715wrc.276.1603919399493;
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919399; cv=none;
        d=google.com; s=arc-20160816;
        b=xd1/MiwXMCI0oRa5ryN0aXew30ASudTab+A4Eng0Fy/y58+pEgQbjnwjAJhYl65w1Z
         7wrx6ZUmTLQX9y/E7fJY6Nm0AEIfQOUOfdZLxLIG6+80PyG/8U8XflwVnC6KZ22r5H5s
         bShbDrt5UUfGCaJhAxIEyVuSR+mrw5LHrJ0DCgGb7CQ06lDWLVpukpQezXe9rtZNO5VL
         OYWzRl02MzAJPfntOmwTKdJtHJujhmXZhcuG9Y7SzHysarpTvoBL2TvcccG6xPYwjiZ7
         tIlpl13xPbv8QHGUxdVKR5hAvyUmV51tyEXl+5SUf2GuIF+Oij86Ez0lUWej4w9va6dJ
         h3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=TbC3hGY6s4gObreufsUMl1hvLWxlRwRNmlxrUzO+l4w=;
        b=zntswIvW+3UkViaQ/73qVeTpNXz9oO7fpM3vsqiX4M//rVCkLvkLCTA71DrCgwSPEx
         Qd6VuAAdQ1/41/oFNHvvcAATbJHl5KnEWiZBsodYLkq2a5ziidRv61R/DoPm2NGcAPKC
         QDaglXzUxR2hELZiVVcUqPoupjoXeDC8C5VXeYm5sQhGrnyaMpAMMy0qdyLoO21bcVHK
         f9TimMb+BeDyL42AMLfMGB7eM6b0uCVo+1GMPrGjNM00s9L0qiBLFdfpq+6D0oszmQwn
         yYFtWjQxQixgj29hcdh/mT8HfDDomLuLsla1DiNtMp9iV30YR6FhDWNA5+UoqJMbDsRr
         lO0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=HO7bWAKE;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id y14si22355wrq.0.2020.10.28.14.09.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rq2HlwzyTC
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:59 +0100 (CET)
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
	with LMTP id ynFcSpkDqf-w for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:59 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rp6YXRzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 18/22] x86: cat: fix Wsign-compare
Date: Wed, 28 Oct 2020 22:09:29 +0100
Message-Id: <20201028210933.138379-19-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=HO7bWAKE;       spf=pass
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
 hypervisor/arch/x86/cat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index b8412140..644bb3e5 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -141,13 +141,14 @@ static int cat_cell_init(struct cell *cell)
 
 	cell->arch.cos = CAT_ROOT_COS;
 
+	/* NOTE: the EBUSY check below relies on this */
 	if (cos_max < 0)
 		return 0;
 
 	if (cell->config->num_cache_regions > 0) {
 		if (cell != &root_cell) {
 			cell->arch.cos = get_free_cos();
-			if (cell->arch.cos > cos_max)
+			if (cell->arch.cos > (u32)cos_max)
 				return trace_error(-EBUSY);
 		}
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-19-andrea.bastoni%40tum.de.
