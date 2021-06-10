Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBJWLRCDAMGQEQHZR3NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6B3A2E84
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 16:46:00 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id v7-20020a0ccd870000b0290219d3e21c4esf20512478qvm.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Jun 2021 07:45:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623336359; cv=pass;
        d=google.com; s=arc-20160816;
        b=tkIao470PQmq568W7EHN4q5nQw4pYmVf9FaKv8kw+3X3EdF9zRCeeskeIIStDb0Fiq
         X09aD7gppjAgPKQ09J6R5KLLRfS9Qa93Q/Zl858xQkcf5fe+7f/7DYnUZLLp4MtvKLP2
         CQt1obCV+TbT9kAGnaB5Muh2IP8hYUnuM2lz0Q/7u2ECVjK6xVPkA0E9/v9+Fb3akk6b
         1k71SEJXPwdYYJsw56H5Pf7ea4zN+VCqMEMsSpakiSaUdvx4IN5fjGSS/xNZCqCWA7RE
         zWfDbCRlnN3fIfYQrm2GOqepnFc1mo8mO4am7MV0Zxaf9TNNKX/jHhvF4oajlOExUkGV
         6bdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=hrqGszi/tGgkFaVap45q15iSA3E5s5uxe3C+Sl18JD4=;
        b=CohIXAnaVqRyiCZRKaq6W/uNi2FS2K4Dwz6Z9f/7ZjbBsJ9B4VmWMWrP9PKKNVNGKC
         7eZ51boCCou74ut1t8Mytr1pztNC1LMj/dVa7PjN2jTaj8SoiR02OLkrMzEIxYVZkR5D
         iNiVRmDf09bAbBIsTU78E/bjCztgtOh4NbIA2jyi0tQAL++55c/4hIZ1X8XJLMQGOdue
         dxmDRFE9J8iLajXXievQ3mHKIf7bLcEnYGGZCTmAO44EwZca95e1Mez2sKlWUkjSIGs1
         zPHy+MVWYuv3VUqAJq9NLieT65qoZ2Rei3ODfqNVw95M2AbiNJSg2kmURGRVPinnR5G6
         QUJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hrqGszi/tGgkFaVap45q15iSA3E5s5uxe3C+Sl18JD4=;
        b=iYSjZDHkhtNwi5Kiuv4GRHWdflUw6V0Qi+cfaDe4Mtd3oHDk4QOeIo/WEu0zk0fiEB
         gUUr4kC4GE1LLHIicQMQiwqjMMGSjxS9VeOmZWfiVu4cKLveF8LAxb/pgM4NbblWoP+X
         V0lHGjcrQJ1xVccqWdTopuLZMkL0/V03dm9eCdwTkiLJaWO0P+HWprGixIytuNDM/aYk
         CQHc8WW+8konL+lie6qN7RVsSN3+eHOaV2WPwZ2UBY8xSfpiLBSgtqtVVBm2eiyRvq+A
         KkF0ufMkErPv2n+NZuqNfhQtyak2ciy/toTWxLP0zVYS8SYo/IKJ8Bg3Jfv1ZmJuRoR1
         d0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hrqGszi/tGgkFaVap45q15iSA3E5s5uxe3C+Sl18JD4=;
        b=dqwXNap8aMUM17yRC1l7ugxe+9Js4L9SIjmkNAZsK48o7v9TfsVK99hs2GX5bVUIb8
         QNgKK+4+pthklB1hE7dgYPjEYX+2Gu2vp4Rk75syI0C8G205fsbYFufVm/SGgMekkVCZ
         K4SJl0GcXVHDOH+RwlFTWtzO+gs49jIRhBZZ2dtpvXA0Yr63BKsj21d2megSQfp3FZup
         gHE3AO5oj1BM4+E/BGTHnu4yn05bv/LyVrzbcR0RqiSTHJx1rwVC+UGvxVKHz5mNv2Sa
         Lk/wyi4cqpSg0tyI0yRmik9HF/qHnxsJqWvxqjAXcY93KmHerKZ9wXaQdbP8A9ezO8wv
         fOaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dmTlwuhh038juxX0q8MhiKTFgu5Y6ZLnmY3YDmejJdyDuxF4q
	Iwvxxsz/SM+FYS9znpoUGoA=
X-Google-Smtp-Source: ABdhPJxLr3KfykXqIy6AtKYb7mUyB995/KyQPsGyk2PwdP15ucpinzOTqevANlg8DjK40QY6cg6pxw==
X-Received: by 2002:a0c:ed46:: with SMTP id v6mr5399054qvq.46.1623336358865;
        Thu, 10 Jun 2021 07:45:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:351:: with SMTP id r17ls2883657qtw.11.gmail; Thu,
 10 Jun 2021 07:45:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1189:: with SMTP id m9mr5371507qtk.277.1623336358282;
        Thu, 10 Jun 2021 07:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623336358; cv=none;
        d=google.com; s=arc-20160816;
        b=WkjozaC+l6jKdRWuoNxo4oKKaXOdOgWTdpiLnlVd1WXowXpKHcivDdD6j2qYakuUpj
         5GUW2t4I+kkT1ND13nRxMES4GIsRvUk01Zkqxy6suNt3hnoHnwey8GuTA3nOt+8h0VRp
         IAH8+MGAgSyJ806DdQPXIdhrZXA4HUt9m5LEfaEPIorlAdMxYeEAy7T4IETXKQLznOKd
         gMTjnux4NASAg3nHX0Lm7Al/0jZpGR9+3y7FcoZ4kalwnfiV3Jwtee0GwnNEWfT+OC7i
         PiGfEzXyIUKMOHsMqXPAE/sxn8mM/XCH1/cNVpouiWzGo41yoEvZqTwYHrz/wiJrvNb2
         mowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=VA27mssDcR6XZ+PdGb+KGvY5caQ+aXE7QgaNBl6M+FE=;
        b=HgenfN6WDRWQwiNPd10XvxjMLwbuckmWfgQJBDM+jvFECMo3A6QBJz+3CsuboXx5lS
         8UbDE6en4q+8tzDxiURYSJJZL/HBF4dvT7RqzjxDy3itfkSVCrrT09BCHHEgFiOp4XDM
         igCuBIv7RrNZexY769lStiGZt61ehjd+cHThqSYA75PVm4pMrrHNt7pYP1hqytpAL6m8
         EoLlK1m83ByBxygGsFXUyXsZEEtuV1kgIREcUbM74Wc+smSIHesF17miUopVj1y8C1yz
         /26BcodVvBBX1eadK0C1oLtGNH4hw8dj916UIskkFpTpBCgEVpKLPct7YsPV0nUMpb2K
         svBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y24si296870qtm.0.2021.06.10.07.45.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 07:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 15AEjtNG014063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 10 Jun 2021 16:45:56 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.8.208])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 15AEjtd5021794;
	Thu, 10 Jun 2021 16:45:55 +0200
Date: Thu, 10 Jun 2021 16:45:53 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>,
        Florian Bezdeka
 <florian.bezdeka@siemens.com>
Subject: Re: [PATCH] customizations: include wildcard into SRC_URI
Message-ID: <20210610164553.4755e741@md1za8fc.ad001.siemens.net>
In-Reply-To: <e7a94ecc-c1a2-67f2-f7d7-93840667f09a@siemens.com>
References: <20210607180741.12416-1-henning.schild@siemens.com>
	<e7a94ecc-c1a2-67f2-f7d7-93840667f09a@siemens.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Tue, 8 Jun 2021 07:28:19 +0200
schrieb Jan Kiszka <jan.kiszka@siemens.com>:

> On 07.06.21 20:07, Henning Schild wrote:
> > That kind of tells bitbake that the file is "optional" and it will
> > not warn about it missing when parsing the recipes. It would find
> > it missing in the install task.
> > 
> > That allows re-using jailhouse-images in projects that do not even
> > install the customizations package and would receive warnings when
> > not having a config for the package and their machine.
> > 
> > Signed-off-by: Henning Schild <henning.schild@siemens.com>
> > ---
> >  recipes-core/customizations/customizations.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-core/customizations/customizations.bb
> > b/recipes-core/customizations/customizations.bb index
> > f71a07887bed..c3a1fde01822 100644 ---
> > a/recipes-core/customizations/customizations.bb +++
> > b/recipes-core/customizations/customizations.bb @@ -20,7 +20,7 @@
> > DESCRIPTION = "demo image customizations" 
> >  SRC_URI = " \
> >      file://postinst \
> > -    file://.bash_history-${MACHINE} \
> > +    file://.bash_history* \
> >      file://e1000e-intx.conf \
> >      file://ethernet \
> >      file://ivshmem-net \
> >   
> 
> Taking this, just making it ".bash_history-*".

That sound like you do not want to be add that hypen and turn a second
round, Thanks.

Henning

> 
> Thanks,
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210610164553.4755e741%40md1za8fc.ad001.siemens.net.
