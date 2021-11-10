Return-Path: <jailhouse-dev+bncBCIJHPG524PBBE6WV6GAMGQEEBNIBXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA544C4B3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 16:53:56 +0100 (CET)
Received: by mail-qk1-x73b.google.com with SMTP id br11-20020a05620a460b00b004630d0237f2sf2081012qkb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 07:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UAg6tcdc1EG61Dt2zWRvzlH7HH6avsYxEG+hYm+uLVE=;
        b=JUo5XOvhlZWDcWKSA1eiefUGQopBrQYlb4Qls5mUxrPA2T4z38/BlzRmOaKBpAagtI
         UEj2BY7FF7SGIRNwv48pNzMT3/OX3uixtfWpGh9nvMPVyeR2y7qGr2DC+BXcc5nVeaPK
         gnYNDU13fTx9eaLvRQp67Jw2VV6PheYHNASJL9K2tRoVG7ddW03q7PLE6ilYoGmQp3ZW
         EesqDY04CUf5yvzCAwkx88Rtu2fPv92uW4dt9hS3Xhvd2y+bWE8eczT9VFcFPS6Sroc/
         4Ww/5V9hfbpWmtMLBtKgYOpyV+fWjtJDosdACP7IcFwiNXGLZu2HnUMXqxpvYxEKQ/AI
         KvPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UAg6tcdc1EG61Dt2zWRvzlH7HH6avsYxEG+hYm+uLVE=;
        b=jUmZy64gt5AtAFCiDfWCUajhL7pMFfKB03KBeMs3uLbmE4oyMBlEIPc1XZphusDJn4
         oyBxGXWicNOsEb5BCYSXNgP7gr+7j0TT1NW+j58GKksFBgTWMksrQ6kEpStFHzZJ6o2L
         D4wCpSNNphpoKzArJcrLDlgYiN2SE39b5+H9iDBhLyUjBNDZzWqjW7VHB+G7hh6DDIxU
         t8RqwjVNwiESSI5p33AxeuyiGz/yOKR4wBuDv45H542iywJYdiU1KxjlRZFK+F4ccdYn
         DRdNMXkPOPAoHP8MRlcRkGAkNi03/BoXlFWqIr/2hxs/ENktWOHtG5fiqAuc+AM5bOlL
         YpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UAg6tcdc1EG61Dt2zWRvzlH7HH6avsYxEG+hYm+uLVE=;
        b=MMZsdXeOxmAdW/RnVNe2W330LLZW4hpN2K/8q7k5PUeMOUDyyWxwiFTUgwzKnJvMZm
         XuZyc5kXonMbLpG0yQ3XAjgXHXuHzYn4yB6NLjYKHPlFvgrT2pXaHGAcAjn1iV5VTbfR
         5JwMjc65XcKvtZaDezegDKWR9veTu8jYigX3rKtL3Bn2DxnwaJ5eSoN43juDrRpmPu+d
         atHTLY3BKd8EtXnHXAShL5KQiAYq+224WXxia0Awwgy7n1CkEBrPIp9xXZpwATQy0ONa
         uysEG9rHDD9X2zVWfYMXrTTzIew8f/qg27ScUZXsUytI7vfzhaDrypU9Evr08HB3ooTu
         QJYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5322JKsbsObnmPp+Rad7TYeaF3joM0npFx10bqtEejSarcwBu/Ky
	QTXaR1JFbbqSMxgT2Tv0kSE=
X-Google-Smtp-Source: ABdhPJzaJhUaTF7fYgjEu3LfmUcVnd+7GE0Y0wOVk7lGBdemFSVL4UC0A6jBCLDy44RnRNhkXdVIpg==
X-Received: by 2002:a05:620a:2444:: with SMTP id h4mr270459qkn.398.1636559635571;
        Wed, 10 Nov 2021 07:53:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1405:: with SMTP id k5ls150163qtj.7.gmail; Wed, 10 Nov
 2021 07:53:55 -0800 (PST)
X-Received: by 2002:ac8:614b:: with SMTP id d11mr644436qtm.396.1636559634881;
        Wed, 10 Nov 2021 07:53:54 -0800 (PST)
Date: Wed, 10 Nov 2021 07:53:54 -0800 (PST)
From: Andrea Marchetta <marchetta.andrea@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <25eadc4a-57ff-4b94-8b87-43d8b842733cn@googlegroups.com>
In-Reply-To: <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
References: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
 <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
Subject: Re: implicit declaration of add_cpu and remove_cpu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4168_705161641.1636559634361"
X-Original-Sender: marchetta.andrea@gmail.com
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

------=_Part_4168_705161641.1636559634361
Content-Type: multipart/alternative; 
	boundary="----=_Part_4169_2053326688.1636559634362"

------=_Part_4169_2053326688.1636559634362
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry to bother Jan, but the "next" branch yields the same error. I=20
don't know if it's intended, but i can only find the "next" branch and not=
=20
the "master/next" one

Il giorno mercoled=C3=AC 10 novembre 2021 alle 14:46:03 UTC+1=20
j.kiszka...@gmail.com ha scritto:

> On 10.11.21 13:05, Andrea Marchetta wrote:
> > hi, i'm currently using the 5.10 version of jailhouse enabling linux an=
d
> > the master branch of jailhouse. when trying to compile jailhouse in the
> > linux kernel i get the following error:
> > error: implicit declaration of
> > function =E2=80=98remove_cpu=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
> >  243 |    err =3D remove_cpu(cpu);
> >      |          ^~~~~~~~~~
> > error: implicit declaration of
> > function =E2=80=98add_cpu=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
> >  272 |   if (!cpu_online(cpu) && add_cpu(cpu) =3D=3D 0)
> >      |                           ^~~~~~~
> > cc1: some warnings being treated as errors
> >=20
> > any clue what's the issue?
> >=20
>
> You want master/next, not the (meanwhile serious old) last release.
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/25eadc4a-57ff-4b94-8b87-43d8b842733cn%40googlegroups.com.

------=_Part_4169_2053326688.1636559634362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm sorry to bother Jan, but the "next" branch yields the same error. I don=
't know if it's intended, but i can only find the "next" branch and not the=
 "master/next" one<br><br><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">Il giorno mercoled=C3=AC 10 novembre 2021 alle 14:46:03 UT=
C+1 j.kiszka...@gmail.com ha scritto:<br/></div><blockquote class=3D"gmail_=
quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">On 10.11.21 13:05, Andrea Marchetta wrote:
<br>&gt; hi, i&#39;m currently using the 5.10 version of jailhouse enabling=
 linux and
<br>&gt; the master branch of jailhouse. when trying to compile jailhouse i=
n the
<br>&gt; linux kernel i get the following error:
<br>&gt; error: implicit declaration of
<br>&gt; function =E2=80=98remove_cpu=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
<br>&gt; =C2=A0243 | =C2=A0=C2=A0=C2=A0err =3D remove_cpu(cpu);
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~
<br>&gt; error: implicit declaration of
<br>&gt; function =E2=80=98add_cpu=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
<br>&gt; =C2=A0272 | =C2=A0=C2=A0if (!cpu_online(cpu) &amp;&amp; add_cpu(cp=
u) =3D=3D 0)
<br>&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~
<br>&gt; cc1: some warnings being treated as errors
<br>&gt;=20
<br>&gt; any clue what&#39;s the issue?
<br>&gt;=20
<br>
<br>You want master/next, not the (meanwhile serious old) last release.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/25eadc4a-57ff-4b94-8b87-43d8b842733cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/25eadc4a-57ff-4b94-8b87-43d8b842733cn%40googlegroups.co=
m</a>.<br />

------=_Part_4169_2053326688.1636559634362--

------=_Part_4168_705161641.1636559634361--
