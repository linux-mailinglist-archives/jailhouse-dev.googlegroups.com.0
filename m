Return-Path: <jailhouse-dev+bncBDS77PFL3YERBXGM3CCAMGQEUCCXDHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FD376FD5
	for <lists+jailhouse-dev@lfdr.de>; Sat,  8 May 2021 07:49:17 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id m13-20020a2ea58d0000b02900befedba4e4sf5801500ljp.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 May 2021 22:49:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620452956; cv=pass;
        d=google.com; s=arc-20160816;
        b=QkAOxRrDgbmujyPf9FeQB6tP80ab3g8UTg/7EWkMqYZoS3XBl36LVdAMf4jFFru7Bx
         meNUOcb5JaKtSE7FxXp32uev1+EaNEoQvbe2D4Hh0Iu+K237bBQf1udvXsaIu62fDprK
         0oJ8jnvYYNY3OH2kj9WwC+8MMbqy3rxhGoRdj1GW1YwHYUN4baYkjzGNA3Tq6VQoJW1c
         2CwFbipWMSjSnMOl21+D+45mQrVGHA0HI5XNO+/bnChSczGQaYoGYcen9qL/EY7jT/NZ
         M02YBpaM9Z77p8kSHOnvTFcaLSfaFdHT8hMlzEFjWbtR87vG8hNflUIxMtCwDpKrObJJ
         tWeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=mkI2JYvTG6ravmMuNwIJpkhrUjEGGcSpgFL8CK8SIJk=;
        b=zcX6EkoZKPFxMOPPwLBV0Zt3o7Z/G2ESecPLJYBjP79XpM+VCPCMAZU+1Ks2dh4EGf
         jw/m245P+sLskg30VnXplRfTezcB8APErOAAptDBZ43Tn45iTKZW98Vjs/UEDnKEWCvq
         RjYx5jCMXs9Zxi0sb+IkL3djRSQ3fK4Tj9wmDsuCwb9g2KNKQWHY2s+/z7IQ4wLDi74X
         TbdUqu6CZbpsNjmvDFOvCqn6hizXS0YvkcWnvcMd3MKtRnbX7vjQxJPb0ytrOcOfIqBn
         dW9udlaH3Jg6/tMh8nljTX7rIkP1rouj+x/HJkprc00A7MoLg8sOdTWPCW2GvvFURrn1
         ZxXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=InsBxOy6;
       spf=pass (google.com: domain of pkali@cimware.in designates 2a00:1450:4864:20::132 as permitted sender) smtp.mailfrom=pkali@cimware.in
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mkI2JYvTG6ravmMuNwIJpkhrUjEGGcSpgFL8CK8SIJk=;
        b=dG9bVysJl63oUz6RZfIAaR08ecJbxH6pdSaP2cCDpeCaXC0veCxR4JbfJnE9UGrLHV
         W+Ml/SqeQuy8U6axxGZMrb2mNWsqmQwSmRKrvL5ROKtUQfwmGU3YjiSTTyF5e1PqVlKK
         cYttk7f5rbH4fhTUsTuRGvwIqZkl9QbptPkB1gGw4fMu01CAQ9eZIzFfbZap0hqk9n68
         ip5Gb5Z5UJbgt15lB7a4sbycCQJvNC77DBHz/1wp4L73w5zl3bTwdbQTeuXSR0G2hBYI
         Opb1MZbmODnhqTbwf3mwhVHf++q9BxXWiJ7PgxU0i4jOupZX+N+D7XiHPZKwMjW8bh/O
         H55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mkI2JYvTG6ravmMuNwIJpkhrUjEGGcSpgFL8CK8SIJk=;
        b=siE6choYzbHIUBCEeZKiwsUSzMKWQeHWtieqNgMh7+i8MVhKQwfASqA6y3Y/z5GT7L
         tZeJurGrYp3x/BMjOW+jfjm6U59zb1zH+sp9bFFQbjAy6lSgZVp4Do7mDE/GBhTKBHNo
         eyeFI8ZfKiQzUQLR3Lf4MMq6oshuTtI9gCosEuk+zu7bsG3hACqmvYwbaj4fD+Cw0uUl
         wvxTjOKnpQDmRfiV9GYDZN/h/dBWj8LfmvfArN0P4paqm5FfNjidXB1QaPR3q/Bfhhs8
         kQhuV2DYoj1Ed9VKDaUPRs+qyBtbfZw2n7LGfX1MB9Sg/S8XzRiDnOq3+olDXeJT8GqG
         YlIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pHDWs98ttaFzrTDpbZfQucDDLAnKt0JomswRz5rcb/AKgRuSL
	Muggrj9R8CNjk0va9LergEE=
X-Google-Smtp-Source: ABdhPJwbC4JRV5SWhTB8WhPWBelI+MSi07M7mltJLUClwGvoaqhQL9qP47n3+kCV8rmWGGXd21u5oA==
X-Received: by 2002:a19:f707:: with SMTP id z7mr8836855lfe.653.1620452956831;
        Fri, 07 May 2021 22:49:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e2c:: with SMTP id o12ls5803567lfg.2.gmail; Fri, 07 May
 2021 22:49:15 -0700 (PDT)
X-Received: by 2002:a19:7dc1:: with SMTP id y184mr9118394lfc.96.1620452955218;
        Fri, 07 May 2021 22:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620452955; cv=none;
        d=google.com; s=arc-20160816;
        b=Jn57btRlUeNhzWBEd+lP+yXm010pd7VKqd6oQVcpiB7+DsfqEhbQGM7FpClvF53HUR
         ad18JdHxXu2gIS8zj5ubHiicjnaTOU4q8+Yi/IkoBa3lb5q67P3RLZ8C2F7q1swiGbrT
         riihdhMSA3ZbYfO90KpgGdaAocvWFwaxySgBonVT7z4F5C+b96Ehr8+R+F/jXLxNap4T
         sVDsUE/mqggu1EgXumw9VLAF6B2zu/kJ/lGlyQ5I6ZIYMNKNPpshZcaTjXpoGYqcruc+
         uJmCSBUCWOtQkMVn4Yd0SIO/pNYKx6XgnMIcg+f/LMLjVcQjfThtPEZco2hFqSINvH88
         w21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ziYwGmxYqTAslu/rfXC4GkxHkcQ3EPT7AulAKN1ufKA=;
        b=aVl8T+aJ8lryLRJaG/2vY+dNL+5B29vRPM8bQX+NRoxcZ/XdKF5eD4NVpVysUmeGkX
         xM+MFmLutYBB983mNGvLWBPo6QIaD0vBkgg5WN7hcGJVfCq28D1O3qOedvZYcvEC2aEd
         6fkMMlWMMCifsEQIDrbk8EoRBxBSoDID+fQCXljqnPeYBqlDkbLI0SmETU+xOoBYb0xe
         CdUKjFm4mYlfqJ4F6fKB2DU3asJ/0UGwN1pVPL880l07UkVm9Y4/mp4ENq5Y72f01/rI
         r370RGTC4JPjz+Yh9qvjPXLPLcfw2qsGG/LBkBdaXek0kckOvzYpjDExDMjTUVC04m1c
         ianA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623 header.b=InsBxOy6;
       spf=pass (google.com: domain of pkali@cimware.in designates 2a00:1450:4864:20::132 as permitted sender) smtp.mailfrom=pkali@cimware.in
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com. [2a00:1450:4864:20::132])
        by gmr-mx.google.com with ESMTPS id u22si364223lfu.7.2021.05.07.22.49.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 22:49:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pkali@cimware.in designates 2a00:1450:4864:20::132 as permitted sender) client-ip=2a00:1450:4864:20::132;
Received: by mail-lf1-x132.google.com with SMTP id z9so15737284lfu.8
        for <jailhouse-dev@googlegroups.com>; Fri, 07 May 2021 22:49:14 -0700 (PDT)
X-Received: by 2002:ac2:4a8d:: with SMTP id l13mr8884279lfp.493.1620452954208;
 Fri, 07 May 2021 22:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <299a190c-72fb-1027-0efc-7a45b98bffe0@cimware.in> <AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB666300B8BE60E746F395D53DB6579@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Prashant Kalikotay <pkali@cimware.in>
Date: Sat, 8 May 2021 11:19:01 +0530
Message-ID: <CACNW3nS7kc-PwpimTmWFtF-MpFar+3Hsx7RFgOCtfpOOdxFszw@mail.gmail.com>
Subject: Re: Can Jailhouse work with CentOS
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000b60a4105c1cb1a96"
X-Original-Sender: pkali@cimware.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@cimware-in.20150623.gappssmtp.com header.s=20150623
 header.b=InsBxOy6;       spf=pass (google.com: domain of pkali@cimware.in
 designates 2a00:1450:4864:20::132 as permitted sender) smtp.mailfrom=pkali@cimware.in
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

--000000000000b60a4105c1cb1a96
Content-Type: text/plain; charset="UTF-8"

Thank you so much for your reply. While my installation I run sudo make and
that fails with the error : /path/to/build no such file or directory is
present. I checked the path/to/build and it exists and i have also given
superuser privileges to the user.
Could anyone get me anything on this. I am using CentOS 8.

Regards,
Prashant K

On Fri, 7 May 2021, 14:37 Bram Hooimeijer, <
bram.hooimeijer@prodrive-technologies.com> wrote:

>
> > Dear Sir/Madam,
> >
> >                              I am trying to install jailhouse in CentOS
> but the installation did
> > not work or it did not get installed. Whereas when I tried to install in
> Ubuntu
> > it readily installed. My query is does Jailhouse install in CentOS or is
> there any
> > additional things to be done to install it?.
>
> What errors do you get? Maybe there's someone on the list who encountered
> those before.
>
> As far as I know, Jailhouse should run given that the kernel is properly
> configured.
> For newer Linux kernels, you might need some patches:
> http://git.kiszka.org/?p=linux.git;a=summary
> I have it running with minimal modifications on Linux 5.4
>
> Best, Bram Hooimeijer
>
>
> >
> > Thanking you in advance.
> >
> >
> > Regards,
> >
> > Prashant K
> >
> > --
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACNW3nS7kc-PwpimTmWFtF-MpFar%2B3Hsx7RFgOCtfpOOdxFszw%40mail.gmail.com.

--000000000000b60a4105c1cb1a96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you so much for your reply. While my installation I=
 run sudo make and that fails with the error : /path/to/build no such file =
or directory is present. I checked the=C2=A0<span style=3D"font-family:sans=
-serif">path/to/build and it exists and i have also given superuser privile=
ges to the user.</span><div dir=3D"auto"><span style=3D"font-family:sans-se=
rif">Could anyone get me anything on this. I am using CentOS 8.</span></div=
><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></div>=
<div dir=3D"auto"><span style=3D"font-family:sans-serif">Regards,</span></d=
iv><div dir=3D"auto"><span style=3D"font-family:sans-serif">Prashant K</spa=
n></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, 7 May 2021, 14:37 Bram Hooimeijer, &lt;<a href=3D"mailto:br=
am.hooimeijer@prodrive-technologies.com">bram.hooimeijer@prodrive-technolog=
ies.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0<br>
&gt; Dear Sir/Madam,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I am trying to install jailhouse in Cent=
OS but the installation did<br>
&gt; not work or it did not get installed. Whereas when I tried to install =
in Ubuntu<br>
&gt; it readily installed. My query is does Jailhouse install in CentOS or =
is there any<br>
&gt; additional things to be done to install it?.<br>
<br>
What errors do you get? Maybe there&#39;s someone on the list who encounter=
ed those before. <br>
<br>
As far as I know, Jailhouse should run given that the kernel is properly co=
nfigured. <br>
For newer Linux kernels, you might need some patches: <br>
<a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary" rel=3D"norefer=
rer noreferrer" target=3D"_blank">http://git.kiszka.org/?p=3Dlinux.git;a=3D=
summary</a><br>
I have it running with minimal modifications on Linux 5.4<br>
<br>
Best, Bram Hooimeijer<br>
<br>
<br>
&gt; <br>
&gt; Thanking you in advance.<br>
&gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; <br>
&gt; Prashant K<br>
&gt; <br>
&gt; --<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACNW3nS7kc-PwpimTmWFtF-MpFar%2B3Hsx7RFgOCtfpOOdxF=
szw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CACNW3nS7kc-PwpimTmWFtF-MpFar%2B3Hsx7RFgO=
CtfpOOdxFszw%40mail.gmail.com</a>.<br />

--000000000000b60a4105c1cb1a96--
