Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG4XYH6AKGQEYP2ZNHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E3102294F25
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id o15sf1709504wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292059; cv=pass;
        d=google.com; s=arc-20160816;
        b=BJ3VvTBpqIai0btYfKNac0XYlu78pL3Prf7k2+hg1C0zudpY8QbPdw2M2j9nJr9sik
         Il+Px/LsPmeVDzEgfM8jxjxznJf4O/ZwTHNzILFiID+NXmZyWYZIExrOBSll0gHD9hqe
         rTJONZiJ4wsvSoUUqQ4RjFMcGFKkJBavMBG9yGrKjCokq31vv1Gq9HlHnbK9HZrXzsRg
         aBm08bpfEcX7BgZwOagBUXkLbvr1NNn9BrEXwbHAIrtLSk3RIoDOcRzieBD9ceG+xr0G
         Czc5I8P44YWYd7vUEzRVmMdsnKz52AjVa3ZNNEXtS/KVR4bVK58oDX3P3dUw7RtxCSqq
         eKlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=LebDE5KdNcBg2Os33BZMwlbDCqE8tVQJbgwVZsstR/c=;
        b=hRwOz7t3iNAi2QVI4VsiV6pf8J4ulBTpKgWq7Iwq2eiEfvkM8/htK6r/n79+D4UT6K
         3uxBVu+c7fGnxlUTcIYaWEyHGOL+C/bRevo6wtQ+4WaWOo7rSH1gF/rGL3WU7dhOU9Dh
         i0dHmUDB/b1jKezFdmfeGWtRg/nPqEgsfDDYFCjmi4ryfgrGVsyvduFm3TDXRr7zkH/9
         OZUhSSInubKrZegMniKvs87+bbV+72eie1oez7CIz2wBSl74hOV8oZYEHtPHUECOEO6/
         gMgJ3xTD6owg00VsrC5L5jRAhD6QgRrRM1l2Oi9B2sTqJkAfOVIaH7QFXz2z0v2elu4/
         e/2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mbROAwId;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LebDE5KdNcBg2Os33BZMwlbDCqE8tVQJbgwVZsstR/c=;
        b=k6JPHyzMYHUf6LQtZaLY+Pip680cyVXHcH3FIKkX++7Ze2T9xe+s5sxdGpa89kFqOl
         gbO3/hmkERKWdrWbhgFl5mMjPzaweq4T4/qmWCobfL0g4bLS60mRxFSsfatirssTyl/c
         gw4eiQ0GiggGDhMgKJVt2mxN8P1B+QFd9n0l06VGJnP/bzHO7Wb9++YxCfPwnBXwRECx
         9liOf+XH43IJCb+/ToGksfaKY7j7plL5UvB9d0+TX5qRYJdtCRheap0cIZCHMZhM8ijv
         I+Bv3XPHeiSUJY1dJ3hWov3M3rHoQd/6JvRAkm64LyxglcZsxx2jR+lfG1CUiD4qjJKa
         WyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LebDE5KdNcBg2Os33BZMwlbDCqE8tVQJbgwVZsstR/c=;
        b=ZrxO9tIf+IjHUVjNtVimQB7/3A/dIpNocguo85AT9OYu2+AqXOW7zOXAQXYQyyJKKq
         KEg5aCfcvVn3oDn5Z/lr89Yim4ExvyMfcUPsEXTfvIRhXOSSn/1xpVQxYk9DW2pBdHg9
         x3gQY8t4NSxnxqDz2aCs62ibbBTh//SQVviVUZo0JvPH1nercIMDfplqgWyqgYkbBS7k
         PP3E1RcNSFfJAfJJFUd01m4l0FB4R5H9e6HV9PCo3wmh0845/hcbZWEtxaIGVifoOfR5
         mHQ3fbhgPcPYaWIed2BFaydsiKMkPvXFJsuPRfosnWo0mZTe6FuZG0ZKuaFA4tkXIF4S
         UFvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TA28VgsGE3gYeEeXdFAfaJGU82t+8yED5MvBjVDTYqeUQjw6j
	S4QGVaWRYhaFbSbpR+Ayg+Y=
X-Google-Smtp-Source: ABdhPJwTUxSUpv0BO4PMEeor9W4XvqqLFfjk01CDN2eSgMlYYs3UaCV7Rekz+KseUXnCeCg8xEuenA==
X-Received: by 2002:a1c:3d7:: with SMTP id 206mr4092941wmd.155.1603292059658;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls27638wrb.3.gmail; Wed, 21 Oct
 2020 07:54:18 -0700 (PDT)
X-Received: by 2002:adf:bb07:: with SMTP id r7mr5567697wrg.150.1603292058668;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292058; cv=none;
        d=google.com; s=arc-20160816;
        b=RGLTnqq6DzoFbeFuHJz5+qdJ4xPcdsD4grsGrDTp79r1BQUju7/IpzaIlktvwCFYGo
         Rkv2tIzHRoSCEATrzroMBfzRnU4G5/uKF6jxLKgqnXVM99oN/fi7sPsbCY5E9z0dE+Oc
         MlnTLJmoEUaY7W76B1PmMVWyINCzHRFODvC61O6FrhnLxMsH2wFQqCGhJNF+qsfgDW3m
         rilEFUHG9jAznmLCfa3nrDYRznEh3DABVK2lvSPhIO2EjLEzf/lvql1bYJ9djzjHUjBJ
         WgwNFrG3JRbmUxCrvUgRTTuYt/u7lmG/Eb5COKKl376b5+0Xsulwnr250Ulc9lsEoYae
         Zzww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=TbC3hGY6s4gObreufsUMl1hvLWxlRwRNmlxrUzO+l4w=;
        b=IMd7Gyjvi86om5ugDUt8Ss7L0NvawQcfAhuJHt5DVXNGsEMpqNTgOzq0ngt+zzsRy7
         D7QHQJaidgWQcJ9cnpyQcqNV02m+7fJ0CuKmKt52szg6hfwBvW8BTSOkHS/Rm/71ivk1
         s00JOHNbR9Uj9ocqFU/nV0OSMlKOK5ssqhnv3qhbwSNy4PA/6OIvFNSWZyI91HIStOih
         QrVN4xqykltWoJRSN6I75/w2zufdEpqhyUxOJuCWzt0uIe1/pqJpnyUWm8NYGXqAoB5D
         XvTfNuyWThWP8fWac78zUvYiUoBtmqCTrAWemAxTDATFoU6pTn1KIkALviZ0BA92CFuC
         h46w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=mbROAwId;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id j5si64112wro.2.2020.10.21.07.54.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRZ3XL4zyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
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
	with LMTP id 7dWVVDqLrUKE for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRZ02xdzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:17 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 17/26] x86: cat: fix Wsign-compare
Date: Wed, 21 Oct 2020 16:53:55 +0200
Message-Id: <20201021145404.100463-18-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=mbROAwId;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-18-andrea.bastoni%40tum.de.
