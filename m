Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYGW5CCQMGQEQSOH2CI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B3E39B9E2
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Jun 2021 15:32:16 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id b8-20020a170906d108b02903fa10388224sf3439425ejz.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Jun 2021 06:32:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622813536; cv=pass;
        d=google.com; s=arc-20160816;
        b=pN1eOEW2TYxcgH+0ENKWs/jiSl3Ut+VguWx02lIt3eiAtqAqn5kudjEnaSUG9DhOxp
         GgWmZJ8K0c8tTcptW75xGZbCjO5ritDoGUQZoy2XS0YzjdfKgMXFcomwzI4zqcaaFim9
         W+ajD3XcGBB67kR/MW8O8I/FIFhnarN85WrxWkV17yD3Avk7kmQwKoyQm94g8MkF0o7I
         uceseoEG5rAEwdwNFCy+7muAAEtAlAYBEvNlnaN6BUFyPPpOIPuGCl2WlMZ+tip1G2TY
         2K2jK538u4t9CiUUtRxEqk63PofilnGKi2KmZwyJ0GI39xj5dyL0I5g+TguedFpkD6pF
         oeyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:sender:dkim-signature;
        bh=+/SRUCGM1f6u1GGQlG/Yb1BeJkGWenOAEmwRDTRxCcQ=;
        b=K8k8RcMTZrr4IeJuM8QO/cpYbN9qSOFVBnDtSAxblGAvO3kgnpEembN5mgGVxAXGNz
         F/fgE8YV+mM40G79NiSPEcQSfZ3jgDMceX0QEsbJDLAZcytbDwSIQnPWDi2Fq7XRbnxI
         dSVrM5M0GUsVPEUbVAkIUoJueJdm4onWHClejtSv7MhF92h0i/OF2BFCZUKrOKnYcwtb
         PWxJFJjNxxhXrj1io+uJT+55/baF28Co40ATegYBU6sB2AktY+sdkpr/pMn1guxwJr9P
         Df+EVezWHbNg5nLvFsv3LrL334BtJH2Kq5URsdbaHtc6f59SbYelw60pA+CW3wjw8NdS
         qYYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="bW/Zj+7n";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+/SRUCGM1f6u1GGQlG/Yb1BeJkGWenOAEmwRDTRxCcQ=;
        b=noB4cYU/eEVUb/RbhsZZ7vlnk900XcD6VNTi0pdyiY0X2fHk29Kg4ad2Q7IUpiRLcF
         rPcgukL9pkZREk4jXaShbQD4W6yixsC0yMUbaaKy9CmRa9MsAcQqzvYAPMnVbaCAZVL1
         KnNG2kmwwvChIkmCm6rhfo4h3l4DYsEDTR1IXZ2X883f6YVSIXyqQltMXqPAbOXsqxFL
         BcSB0ZF7iIyeUgfVuqw2Tez2h9giwT/VAxW7Tj2EF/XuXz7H8GsYOFw+aq9wO8CeQVA4
         Fqjb8wjAPw6K/py/657Xa2pwMtg7aYk20mqwn2LHviyxhckJ48WcAUJhROyBInasNuct
         IF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+/SRUCGM1f6u1GGQlG/Yb1BeJkGWenOAEmwRDTRxCcQ=;
        b=KuBiLBX86BY7MbAd8cpmAikGm1GicnZ/zJFPytBoaoqFZuZYuUWCihscPclZNgCwiU
         +Kpwba7FL/+nTUb0tKsWfTm873UwYTkrWmKA/oNWD7VkxxDHrIg8LB6V2fl2a8xlru1G
         P4n2sHFUQtMOZ4gqUULOZoglgQ9x96MmjxwBCs0wPqV726hSfppZse16LH2NyaoGBKcN
         VASCtmYb+Qw7WijMC4FOBpxuiPyaNA4tyvNfhAQN4AyF9VJ6foVEwC9Sy8eZtXVaXhFn
         D0OHWI4S1Qy1BS67YIvDH+4PlqmSNmeNDyScjGuoQ3HnNkz2tajEpQlaskedmvnK6R92
         YJyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DW6sGdntoEGrzKm0M42f+SpNGgSeognWip1wgaOTJ2lmd8dTd
	HG5aWIZvgnNbDa7jyJ97FQY=
X-Google-Smtp-Source: ABdhPJy3KLFlXxAStxMqC5lOrJitJCtaff5q4F1RiTSNAQjhVAcezqsxHiKGamr/IHq2dhaf3TmGqA==
X-Received: by 2002:a17:906:e01:: with SMTP id l1mr4266665eji.280.1622813536331;
        Fri, 04 Jun 2021 06:32:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:318b:: with SMTP id 11ls2706399ejy.2.gmail; Fri, 04
 Jun 2021 06:32:15 -0700 (PDT)
X-Received: by 2002:a17:906:19d0:: with SMTP id h16mr4233707ejd.193.1622813535138;
        Fri, 04 Jun 2021 06:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622813535; cv=none;
        d=google.com; s=arc-20160816;
        b=pAXJgZdE3ooahE+B2uBOP+IOJ7fLK4Vg8udWGpP7naULFLYKdqSQK8Xab94Rx7gxMC
         NtY3mFBGUxxasBO8ae5OVj/O1gK3gYUJSmiN0VLPKPd+qcynDAiPKVQbd3Y7S4kKUxBr
         aDZFBgSe6BIkAmGSjvN/RCpwimMX8nTAA1sPLQcRbQLfNzBBtJXqQs4MYSeJ1mfr3+PI
         5cWZP5kOfl0zquVtjMuRezWL95CKZpEH4eRVca/yhOb5rU1DlDUfhb2i3s6M1/LO5QZj
         og3mJZ9rJKM2z43tP7XNPfH5M8Gfhk5iqmGSJk3bZ7U1dW6AZkC/cjWYOSHzB5j3yKWu
         ee3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:to
         :dkim-signature;
        bh=v9bz8rIRStdRySt7zcEq5EFSs4kbITNsMlEGDfVHa7E=;
        b=IZJU1UBPM7Lf6kydCQ40FI+6ugIBqf9GCdKlcsxcGbUp1AC76VEEH7S3k+hikQ4st2
         +bO83ojWW7SkrMCLPpjS0wyPtBLUoz0EtRr4QlKLPEakKFA3AC7OKaFvdwe6szWeyDYK
         dUkUqcGFeewbQRedi6t+6eMSmZGLZ/w2GHk6CZlWbAisfq9aF9vU5cd8Jm5xEvm7t3NW
         CDk8nibNsk83Lh9afk0t+5s56HJqpKSEiy5+E7GJuUspauWmlocPOqR6IEf0UrmmZmjX
         VOQ97kGTT3o1/EtBWlc6Jl3Eryv52xazmhpYqYpaVAK8HnuJ7KFvK6R0mIdpo9iNESLg
         9j/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="bW/Zj+7n";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id x10si118100ejy.0.2021.06.04.06.32.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 06:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FxNwZ3VXszy8Q;
	Fri,  4 Jun 2021 15:32:14 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::1455] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 4 Jun 2021 15:32:14 +0200
To: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Re: install and run jailhouse on rpi4 board
Message-ID: <8a66aab0-1fff-007e-5a7a-dc150fb15031@oth-regensburg.de>
Date: Fri, 4 Jun 2021 15:32:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="bW/Zj+7n";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Nikoleta,

On 04/06/2021 12:24, Nikoleta Markela Iliakopoulou wrote:
> Dear all,=C2=A0
>=20
> I am student in ECE NTUA and I am studying Jailhouse for my diploma
> thesis. So far I managed to install and run jailhouse in virtual
> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt
> environment for both x86 and arm architecture. Now I am assigned to
> install it on rpi4 board.=C2=A0
>=20
> I know there is this repo=C2=A0https://github.com/siemens/jailhouse-image=
s
> with ready to use image for rpi4, but I would like to install it
> manually to explore better all the options provided, write some code on
> my own and test it.=C2=A0
>=20
> I have already explored the internet and this google group for further
> information, and apart from some general guidance, I didnt find anything
> specific/(or maybe I coudn't understand some key points).=C2=A0
>=20
>=20
> I would really appreciate it if someone could give me some
> advice/guidance on this subject.

It's basically just a few steps:
  - Take the distro of your choice
  - Clone Jailhouse
  - Clone Jan's Linux/Jailhouse tree [1]
  - Build & boot your own kernel (you can refer to the config in
    jailhouse-images)
  - Build and run Jailhouse

Just ask on the list if something odd happens on the way.

  Ralf

[1]
http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jai=
lhouse

>=20
> Thank you all in advance.=C2=A0
>=20
> Nikoleta Iliakopoulou
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/10331404-4fab-410c-ba3f-7=
7f4ed6ccbebn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/10331404-4fab-410c-ba3f-=
77f4ed6ccbebn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8a66aab0-1fff-007e-5a7a-dc150fb15031%40oth-regensburg.de.
