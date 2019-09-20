Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB7X5SPWAKGQEBZ724XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id BD777B95B0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 18:31:58 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id f10sf1173504wmh.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 09:31:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568997118; cv=pass;
        d=google.com; s=arc-20160816;
        b=TzYOgYbs9v2IXxHfYWrMINUwRWR4ifyq6gz6rse8SDPiUPp9CNGA/Dw28OuMgtNd7s
         GQTaARCs8kvZcGMYAUkWXWlPK6v3Y/tEeqWTSepFVxudVkUu71bstI51LVn/e2Gn6mCO
         P6zKerLxplBBjES2m9z0TCS7j6TbVzqA6VGtAkZlp4VcvsYGiikn5MJRR841yEgrj6Br
         LQ76iH1Hf9x5YnQeq+KzMVFfEo4hETeFAOF93FdjT7O+L2+MuoffKBbg5ETbxjmBxJ8D
         xZiJy5631NXm1+VCh2mAMyq7GWQJuFzyMTm6SlWvjDcjbGu2SnIEcHCYEEVLuRivVZhL
         MEBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=yclQeBj3bk4llBIIjXghQjml4RJ8olop/MdmCEezPk4=;
        b=BYqhbZ3Kpa7+lS+OeL1wIxfr6aOTfozC8yfVtXdnKqBGCamqqUTq4bQ0FX25N4LE07
         3SxsvFObcr2TvrIz7K7Oj7evJllJ2W+erGjMwA29gPEFomXNGt0oAgxufyiLXNd2H0yj
         obJi/ZyvBmt8+aU13vtrXN0bT3iyOlcgyb56f57YqpALPzoZS+vkAEHBBpIkPI6oD5Du
         44x6wD5fmIW82fYHLc4oyGbrE73QCI/S54Op/ZAz+BoIhx2Ajohi8c6HulOrggBgcKRY
         klcnhl5HadJtN0XJSsi4gxtgPESE0oB+3dT1fOAL7QYbwvMSKwdeemN+8av23YS1sakD
         /I0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yclQeBj3bk4llBIIjXghQjml4RJ8olop/MdmCEezPk4=;
        b=Pjkkf4TqZgfBq6rdmFe005gXrcH/K7/jSMcuU3z7W6QR5hTv5cXtv6PohnmtyF4CUb
         qZ0kc7n2NtNB21waIBxMPiF1l8kvoM3FqNLida+Jd4bPil8ASoXLDR8U0vVa9oPLXGlF
         ru1Egsf4+xrGw27P1iMx7rhtkXunaWCgW6tcBs3R8OkRwgWNiLz60zD7j6cP1ExKW/Cj
         EvQiJlEBsNK1vHJ0BwE4Kteao/De6NukAafyuNaDwQylomc4Jbkb2dShlQp7CjfuOjzj
         Li3TwdwHyMlmWkx7k3uJERcEQ0nit7pR9Gasjx3wIP1YKIBdMX7yXqaIPmuuXybmYHO2
         l3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yclQeBj3bk4llBIIjXghQjml4RJ8olop/MdmCEezPk4=;
        b=XXVDISLd4uOD7/0eOeb6rQj3nnRSQzFuEgLIqD8PZ5O3/pCv198sDIkdaLzKVpGjHH
         jqV3KnAeDwuFhZ+nwnsNqQL61aOHJ8OYNGCnK8E5dIFrbOhI/f04yrCHadqIZBsyXiCJ
         KXjaN8yr69siwXp3lB9REISKftSW0gkoDHrulUbNaBe9W5pvYC65XAuXUVU5NsQRL5DK
         G0sglDlQqiSGUmX1FfEIFkThi81yXYqpD5Ezj0aAuMvH6G5dKyoRC17TfrElBBynl4UD
         eT89hy36RCdcHIbuet0EpPodzMab2qNpPAgWrcKSOHIUB2s+USCfOn7Q7388Aq4iRPBd
         mmKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUodkjl3alztVU1cfikYqUmseZHacZKaL8DLMKy131IPxQnGOxj
	NYMRFPDLezf8zz1UEKTov/o=
X-Google-Smtp-Source: APXvYqy7uZrgyoA7YbIRHqHOkdptJFI3D5LbUliz/ZlxiXgcMPVwtyO21lqnLailPuhrnfds7ZmnsA==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr4156768wmk.137.1568997118420;
        Fri, 20 Sep 2019 09:31:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1ca:: with SMTP id r10ls2050734wra.6.gmail; Fri, 20 Sep
 2019 09:31:57 -0700 (PDT)
X-Received: by 2002:adf:ed05:: with SMTP id a5mr12396616wro.35.1568997117758;
        Fri, 20 Sep 2019 09:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568997117; cv=none;
        d=google.com; s=arc-20160816;
        b=A/oowIe4Y7245ZCNHit0joo5e647v+Y7ucGm4hjZKI0BAu1ZYHWXOXxxvwlnhiHNs8
         2z7zMmLG8eo4Rl6ap/249x24FPEsWclBoQpTkSK3aZ+Ikcm1kDKNZ784oKbO3kYc3tbL
         f/f60HRInMHobX0KkxKocQysoxcG6skmbpz0kkMrR00GXCZoKKKVKV4pbrsZkf4eGyOS
         hxy946xzaXRkPjkwPtn0BegMJiF8Z66mXjsr4x145ywxkP1z7G9JKzb78tPgdDplGiS2
         9CVfaCqOjrh/pGe4kHTHOemZYXEO8yUs0GwFCX7elIzaDm5ftLeRZJUk/pyx+BaQao27
         /y9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Qy/jt4CyYJ2KZeNSzWXE7l2NNR0hlp0ZbCwDpRMnA7U=;
        b=WAKIV2LE1d5Cht+w5WaKXi5v47v6Wv4kUaTDtS/lrnBn0FJJHEtxnfIIfP1sbkB8qR
         ta2ZJozVCTWldODq68Eq1LCZScFjShztITBZjqRBDA0dWtxDumXFTl1fxA2mlAmo0GUJ
         Cyra8Sg8T4KBfatlkgP2l7qgAeMAFzQIp5+3Db+vYXWz0JGXHg5Ciz4zS8/ME50dWKfg
         WXPTLb57swngoqfLVZjThRPD6Yy0WRwykB6fN9Gh1+N29Jj36fpqRFIDz1rHF4BufARv
         IW5WNjdN75atwE2bwbVpRFvaMehyM1dL8K/oUUCCryTZFz3/2Iu9qy4XWy5nGHSsUENh
         2O/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u15si130831wmc.1.2019.09.20.09.31.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 09:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x8KGVu92027208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Sep 2019 18:31:57 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.220])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8KGVuuO030926;
	Fri, 20 Sep 2019 18:31:56 +0200
Date: Fri, 20 Sep 2019 18:31:56 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Peter Smith <salerio@gmail.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
 <jailhouse-dev@googlegroups.com>,
        Cevat =?UTF-8?B?Qm9zdGFuY8Sxb8SfbHU=?=
 <bostancioglucevat@gmail.com>,
        Ola Redell <ola.redell@retotech.se>
Subject: Re: Compilation error (jailhouse.c) in Yocto build
Message-ID: <20190920183156.124c073b@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAOx=Z6G31=FjMiNSNj8derZiZw-mwEvx8TdRGyMcY630nkOV6A@mail.gmail.com>
References: <e5e387e0-eeba-4719-bf73-5e16f65f4d63@googlegroups.com>
	<00e5a697-7301-25f8-494d-04aa43d0b343@siemens.com>
	<CAOx=Z6G31=FjMiNSNj8derZiZw-mwEvx8TdRGyMcY630nkOV6A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
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

Nice to hear that works for you. If you find any issues with that go
ahead and take me in CC to questions here in the list. And check out
the other "forks".

There is also
https://github.com/cevatbostancioglu/meta-orangepi/tree/master/yocto/meta-orangepi/recipes-jailhouse/jailhouse

and
https://bitbucket.org/retotech/meta-jailhouse/commits/branch/imx8-dev

These two somehow contain my fixes +X, have not looked into the
details. The former one is the most recent, but lacks git-history.

Maybe we get lucky and see a new "master" with 0.11 support on
bitbucket.

If your build system does not have to be yocto, check out
jailhouse-images ... using isar as build system.

Henning

Am Wed, 11 Sep 2019 14:35:22 +0100
schrieb Peter Smith <salerio@gmail.com>:

> Thanks, I found some other layers to work from (
> https://github.com/henning-schild-work/meta-jailhouse) also. I
> understand why I was getting the error now, working through it all.
> New to Jailhouse.
> 
> Best Regards
> Peter
> 
> 
> On Wed, 11 Sep 2019 at 13:42, Jan Kiszka <jan.kiszka@siemens.com>
> wrote:
> 
> > On 11.09.19 13:23, Peter Smith wrote:  
> > > Apologize if this is a stupid question.
> > >
> > > I am trying to build jailhouse as part of a Yocto (thud) build
> > > for the  
> > US+  
> > > MPSoC. I have based my recipe on one found in
> > > meta-ti/kernel/jailhouse  
> > as it  
> > > seemed to be the most up to date recipe I could find.
> > >
> > > The recipe builds using the following:
> > >
> > > EXTRA_OEMAKE = "ARCH=${JH_ARCH} CROSS_COMPILE=${TARGET_PREFIX}
> > > KDIR=${STAGING_KERNEL_BUILDDIR}"
> > >
> > > do_compile() {
> > > oe_runmake V=1
> > > }
> > >
> > >
> > > Everything proceeds well until the make process reaches the
> > > tools  
> > directory  
> > > where I get a compilation errors complaining about a missing
> > > <stdio.h>  
> > which Is  
> > > rather odd I thought.
> > >
> > >
> > > |
> > >  
> > /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse-gcov-extract.c:13:10:
> >  
> > > fatal error: stdio.h: No such file or directory
> > > |  #include <stdio.h>
> > > |           ^~~~~~~~~
> > > | compilation terminated.
> > > |
> > >  
> > /build1/peter/PE2/ZCU/build/tmp/work/zcu102_zynqmp-poky-linux/jailhouse/0.11+gitAUTOINC+955a9418df-r0/git/tools/jailhouse.c:14:10:
> >  
> > > fatal error: stdio.h: No such file or directory
> > > |  #include <stdio.h>
> > > |           ^~~~~~~~~
> > > | compilation terminated.
> > >
> > > So my question is, is this expected behavior?
> > >
> > > Can the tools be built via Yocto?
> > >  
> >
> > Sure, you can. There have been various layers shared in the list
> > before, check
> > e.g. this thread:
> >
> >
> > https://groups.google.com/d/msgid/jailhouse-dev/CABPcKDPEVAW0Y1x8ndpc6LQutq8cCsEKu20inFyFhrMRwa%2B--w%40mail.gmail.com?utm_medium=email&utm_source=footer
> >
> > Jan
> >
> > --
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > Corporate Competence Center Embedded Linux
> >  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190920183156.124c073b%40md1za8fc.ad001.siemens.net.
