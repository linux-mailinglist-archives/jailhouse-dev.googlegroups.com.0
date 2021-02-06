Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBGHY7GAAMGQEAIJ3FSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FFF311CDE
	for <lists+jailhouse-dev@lfdr.de>; Sat,  6 Feb 2021 12:23:05 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id w8sf4951796lfk.17
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Feb 2021 03:23:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612610584; cv=pass;
        d=google.com; s=arc-20160816;
        b=MOtpB9PyLWKmBhW01hef3JpQ3/PHS5mdI2TpP8OGFM1upyY2SgisFCtwSqUb9w0zZs
         4VkOj0Yl0yVl0P9EMt6RShCe5onjSwwkxzKlhPiGfPgg8q4yowhvGws5mVfr2ZDCTNCc
         A8ynkdWvcarhR6e7iNt4EVw8vzOAIy4h+YoPfzKVkLfimvh0q9lhe6Uk5wQFJYxRYWpn
         b9priJC0fgQknG1vS2zvwkAvrNskx3qucHT67SVPeHBThk5C53ZiKCUdoDiGJaYFts90
         UOobda6yPGcbLR8SZ2mBJmyeNIrWKWaNu+/w9UFR3SQUbbWOdq3CXgH17KdWYiEF/LdG
         FALw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=ianbEQPOoR8RUN0y1driYEDaLi89Bcat9L67blJKi8A=;
        b=CHIpqu2L7vOrJLhrDFqB/m9Ny9AXSt9Vka2ElwaWqoPaK4W96epYoHqHfmiRwihCJF
         6+qTrHUBvcYMN9A5+bzibKhtfjsOXmcxdBWXwJY1Nmrfw5Dg/WMzxnWu4rmWSi/kS9IK
         dkIFVuteIOS8V9wTLBarO+wPHWzoB+pvI3n65+B19kuavKz8jxSUYrnFFqr+OQyUzBXg
         mVBFq8Ubw/Q6KaCDwKeF61VfMP96miMTBln57kN0RLCyGSBhoN0NaI2bNLXdnGBiibbM
         S2zyD/D8otsVAvQVlXgPO/Sx4emo9HImG+tro1d7hp53KQahN3lC37WD8vBUAOaix627
         yZEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ianbEQPOoR8RUN0y1driYEDaLi89Bcat9L67blJKi8A=;
        b=CAdkklQTuJhoyHdR3OJtsIS2wmXEAL3lqQm7GnC2ZjR8wq9wn5BoaNryx+OSPA/L+l
         HyCd4rul7i0CofrHmRBQUpqPIFrDFvSO0vjmp0tIy2akWG5u5espyVegUaB7agBl4fO5
         DcVECVILg5nf+9rG8uTEUA20mKUgRtRONLFJD8wldUw2xEZ11wt15kARCcrGVbMvQSnf
         GqQ6b6WsM0VOjsZwr3Aa/KP9ZVS5prcdRzC2k/0Ija8nGDqrPoaC+U9VXSf7JEwTkDY/
         OG9CRlbnV/6oAQFylImGB6rMcB9qQKuaDUnVq+rXgF8wvXU3PRVHWm9t1S7rbsigo0Mt
         NWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ianbEQPOoR8RUN0y1driYEDaLi89Bcat9L67blJKi8A=;
        b=OXp3z8sbULIv3n0BidUHtWkbAzXTgfNduVgcEFZ3LVP3KS/59MwbyGocWM5gWfhsay
         6hEeklReD5VlDVyBJE286JvIJffxNpegY/uyAQqaitECc+pfUjhxDBPar9nskq38mipH
         4hLyoAkmM3EQ/Ntji8vOj4HfUa4cURoFMPNItGssmRgC5FY5STaFHsiatAdijhqaa8+c
         k0F++B3w+X3lpLTuPPm04Sc5HR1/CyqAhLy1Jrspy+2q7TEYFykMzP/K51kLCx8Sx6AD
         VvTTQghECt4yRBit6j7iJKy5/QJIF1d/wMkCLEd2x5vnu45tOQgJN9NOu6MzildM0I8G
         RYUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yD1ZrVLlON//w051aTKuMVoUOILKxCwFFaglD9dux6TBEiZL5
	VvQE4qFJf0tmgU3ac9hq0zk=
X-Google-Smtp-Source: ABdhPJzBn4XbzgOPnKj/0eMizn0vcyta8ryEhwM3BOydmP9ox7oZTzXYlOYiJFsp23IVtmkH39c8vg==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr834191ljk.303.1612610584666;
        Sat, 06 Feb 2021 03:23:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:285:: with SMTP id b5ls2103093ljo.1.gmail; Sat, 06
 Feb 2021 03:23:03 -0800 (PST)
X-Received: by 2002:a05:651c:54a:: with SMTP id q10mr5307446ljp.454.1612610583671;
        Sat, 06 Feb 2021 03:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612610583; cv=none;
        d=google.com; s=arc-20160816;
        b=RHvHYg9d2VVgJWwuxPCKJwjfgJHYxSFz+Y7cX58mvTI20j+gSMCXnlffFEPHsa85/9
         mqwOn90daRwEcuF53gpP/hXBjZ+gpW3C2GGVnjboJpTDcbWqROZ9ogzViiR898Gh68f8
         f2FaA7O3wYmROzuYEHQB0jR4MhghxXGqyeVmKVrMYi9oA5BAgEUa81RtkANifgdu0ZR5
         bBSCq/ET2J3w6p+XdZi9rax/LUBdfembXZKRHbaGH9EakToug/pWvfzFh8s1loDpNT+8
         dUaDXyUDI5zfcrNjMzrm1T5MYEHTJs1foblBYDKLIMcl3634KzwvBCRqHOwWK/+4OHpE
         ubhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=k0J4XgMVx7WtSSOk8wjci+mPIH9U+CJ4wEhyTbhjL2E=;
        b=wo8f3RLn7cE2zaJfzFq4wlIx/gEcajO3yELUAR+VSBKOLp+0PZaMMKlvP/mMFeLKdv
         /zk8aEXZFpwL4i3I+K9AhbIqs/pheLO3oDJ2gSFVVK+47Fvu+5oW9QqLxubIKh5PzEED
         qkSiEZqfw+xRWefstQNB5jlMt+bCfeAu+tr67nU9CHu1ZUdkMJqCj32zvCs15gW+5GBM
         6kz2aHxRaJE31Cyko2HPpFy6O5uAHmH1/XqTpFu1fJVXlJ6dZ8zrYrK0VBpYFse8cmIg
         HQz9Mdd0EhS4Z31b0LI8OM4zLDvNhKvFFZrB+VLw8ZR6pHq0xK0Tgc5xxrjNMgXMg15s
         YxTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f18si656509ljj.1.2021.02.06.03.23.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Feb 2021 03:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 116BN2Bp021075
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Feb 2021 12:23:02 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.45.43])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 116BN2NJ015974;
	Sat, 6 Feb 2021 12:23:02 +0100
Date: Sat, 6 Feb 2021 12:23:00 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Hongbo Wang <hongbo.wang@nxp.com>,
        Radu-andrei Bulie
 <radu-andrei.bulie@nxp.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
 <jailhouse-dev@googlegroups.com>,
        Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo
 Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>
Subject: Re: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Message-ID: <20210206122300.09b3711c@md1za8fc.ad001.siemens.net>
In-Reply-To: <VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
	<c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
	<VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

Am Thu, 4 Feb 2021 02:33:20 +0000
schrieb Hongbo Wang <hongbo.wang@nxp.com>:

> > >  .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030  
> > +++++++++++++++++  
> > >  configs/arm64/dts/inmate-ls1043a-rdb.dts      |  767 +++++++++++-
> > >  configs/arm64/ls1043a-rdb-linux-demo.c        |   57 +-
> > >  3 files changed, 1843 insertions(+), 11 deletions(-)  create mode
> > > 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
> > >  
> > 
> > What exactly will that allow the non-root cell to do? Own the DPAA
> > completely (taking it from the root cell)? Or does this enable
> > sharing (and then only in a cooperative way, due to architectural
> > limitations of the DPAAv1)? 
> 
> there are some case that user want to non-root cell can connect
> ethernet and cloud via DPAA1 port, and test their performance, so we
> plan to add DPAAv1 support in jailhouse.
>
> in this patch set, all DPAA ports are owned by non-root cell, root
> cell don't connect ethernet directly via DPAA.

Radu-andrei Bulie already has a setup where root and non-root can share
DPAA1 in a cooperative way.

That depends on driver changes in Linux but in the end is much more
powerful than what is proposed here. But it also has nasty implications
on isolation between the cells.

Handing all of DPAA1 to non-root is an extreme case, next to leaving
all in root. While "something in the middle" seems way more
useful/flexible and it would be a shame to just go for the extremes.

I assume that people will want that sharing eventually, so it should be
considered already to see how it fits on the second "extreme" that is
proposed here.

Henning

> 
> thanks,
> hongbo
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210206122300.09b3711c%40md1za8fc.ad001.siemens.net.
