Return-Path: <jailhouse-dev+bncBCF23YV2QAERBR4L2WBQMGQEQMJANBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id C289E35D8B5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 09:18:32 +0200 (CEST)
Received: by mail-qt1-x83a.google.com with SMTP id w13sf691531qts.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 00:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wnzDv/+3LnfUZS8oQKIp/YP4czqJNkPI1aW9bZrIAcM=;
        b=stNHwznCsQk5x97tfSHRCAYns3Dped02b8DsCaMXZ1I5xD77hufxmbTB8q8mbZYTcz
         aA3A73srBlmBqRtYsE9AO2XVr6qelmMkYOeEIwP1YTFpw7Svc6IgPk5NmmmXTWQWkzV3
         +7bl8vRlqIcrAA15TlVZz5baqdFSMc2j8Df8NSqb3XgWwvGREH0LMkxDDk3h5h7OK/dL
         Jb36xa4s3id1JU16LZOV5aACZeawU1GaFJT9aIerIXlp6g9T3JPI/2yUhgO1+vPfU7Vr
         pOkLQEf5/Jb4ZhvJ2OOQTOMxxBQNCN/8ezEFTNSOMCnb1ta+tHmw4+8wZRViJ+RgM28W
         7Pow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wnzDv/+3LnfUZS8oQKIp/YP4czqJNkPI1aW9bZrIAcM=;
        b=VjLQaS/7Z3l2lpPU8pb7YfZr956mNB778pR0zIwHzZhVMjHR5tHdeRghpJcyiG95OR
         2C32rC1RLRU6zugTRdTUFhNl1amFvsnJoRFbGrm8vRy5W6+GjSjXAMQhVZBP3GGr20Zj
         ugphyC5z3dpnqaM1J3Wx7/KA+2Yjdr98a15BeK/kX8yZISB70kMIU/od72IO8AIBVkbw
         PEAOTss+zatscSewvv1Rs5sPrdM522qmYcp8SH2rQsxf8WgTWhHpGK4zrOEg50y2kpMP
         cL1oqeu3nXyoinkk1aV20rImc3quoVub7JM2UgQL2sbqbj+/QYpfLRyA3Sr6TTmqZCsJ
         v/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wnzDv/+3LnfUZS8oQKIp/YP4czqJNkPI1aW9bZrIAcM=;
        b=ABliQ+uJJXjYgzkyeG8L8mfnHhTXxCHLnvnLjz3dy2Js0GolxBqTdjPOPnSp4jqRC9
         NtCq5QJahMynlvqg4dDCc8DbxT+celneb+jHimRqEdCNtCvPPMwflBEl9sU2OWlt1vR3
         dp8w8wVvQGRlcL2DYRv1xbz+1A3FEfE4dYBa8tu1+iBbZIQXBJKzhxzDYnNmf5MH4AQ2
         7Xo2D8+Pqmuor4HLHdc7WjRCffb+uXHEz4L0enN/LLsXz0EJmfnf45GtGNqom3Sw5VMI
         YCOel6ES4ZmYQmTPgUfrClRZPrl0iKJLp/jGFnFBpZCo1UMYGI/ET+dl5YsS8+1qPvg+
         rCYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531mPCVuM0RNvfOQTP+d/Cb7uLQXwfRyiL+nbnU9gwJSxAuUwsmJ
	x0yhP7g7OO+dhEJoLMK3yDU=
X-Google-Smtp-Source: ABdhPJz8ER9hr4u16SV0Hft8KoZu2oIEW5BIrbRDVySduWBXbPcWN9UtHqDsjB4hSL2n7aDUJhNIAA==
X-Received: by 2002:a0c:ed2c:: with SMTP id u12mr31771643qvq.30.1618298311882;
        Tue, 13 Apr 2021 00:18:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:c207:: with SMTP id i7ls10634644qkm.9.gmail; Tue, 13 Apr
 2021 00:18:31 -0700 (PDT)
X-Received: by 2002:a37:6c2:: with SMTP id 185mr7934730qkg.228.1618298311175;
        Tue, 13 Apr 2021 00:18:31 -0700 (PDT)
Date: Tue, 13 Apr 2021 00:18:30 -0700 (PDT)
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <447e0050-c0a1-48b2-8390-2dcfba0fca5dn@googlegroups.com>
In-Reply-To: <680669ce-69bb-1403-1c2f-8ccaa317baa9@web.de>
References: <96f74988-49c2-45b7-be31-67bf46c75cedn@googlegroups.com>
 <680669ce-69bb-1403-1c2f-8ccaa317baa9@web.de>
Subject: Re: How to build jailhouse in Raspberry Pi 4b
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2986_20677770.1618298310521"
X-Original-Sender: zhuzhuzhuzai@gmail.com
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

------=_Part_2986_20677770.1618298310521
Content-Type: multipart/alternative; 
	boundary="----=_Part_2987_1894692648.1618298310521"

------=_Part_2987_1894692648.1618298310521
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hello!
I success build it now with linux jailhouse-enabling-5.4-rpi kernel. But I=
=20
can't enable the jailhouse . dmesg tells I didn't reserve mem_regions, =20
while I did use mem=3D768M in cmdline .

=E5=9C=A82021=E5=B9=B44=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+=
8 =E4=B8=8B=E5=8D=889:25:54<Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A

> On 11.04.21 05:20, =E6=9C=B1=E8=8B=A5=E5=87=A1 wrote:
> > I just want to build jailhouse in my Raspberry Pi 4b which is supported
> > arm64. If jailhouse is support Raspberry Pi 4b arm board now? If there
> > is any page for how to build it in Raspberry Pi? Can some one help me ?
> > Thanks very much!
> >
>
> You mean use 32-bit ARM on the RPi4 with Jailhouse. Might work with the
> existing configurations as well, never tried. But what would that be
> good for? 32-bit is slowly fading out, arm64 is standard on hardware
> that supports it (downstream raspi does 32-bit only for legacy reasons,
> some images for old hardware).
>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/447e0050-c0a1-48b2-8390-2dcfba0fca5dn%40googlegroups.com.

------=_Part_2987_1894692648.1618298310521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>Hello!<div>I success build it now with linux jailhouse-enabling-5.4-rpi=
 kernel. But I can't enable the jailhouse . dmesg tells I didn't reserve me=
m_regions,&nbsp; while I did use mem=3D768M in cmdline .</div><div><br></di=
v><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=
=A82021=E5=B9=B44=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC+8 =E4=
=B8=8B=E5=8D=889:25:54&lt;Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A<br/></div=
><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-lef=
t: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 11.04.21 05:20, =E6=
=9C=B1=E8=8B=A5=E5=87=A1 wrote:
<br>&gt; I just want to build jailhouse in my=C2=A0Raspberry Pi 4b which is=
 supported
<br>&gt; arm64. If jailhouse is support Raspberry Pi 4b arm board now? If t=
here
<br>&gt; is any page for how to build it in Raspberry Pi? Can some one help=
 me ?
<br>&gt; Thanks very much!
<br>&gt;
<br>
<br>You mean use 32-bit ARM on the RPi4 with Jailhouse. Might work with the
<br>existing configurations as well, never tried. But what would that be
<br>good for? 32-bit is slowly fading out, arm64 is standard on hardware
<br>that supports it (downstream raspi does 32-bit only for legacy reasons,
<br>some images for old hardware).
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2dcfba0fca5dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/447e0050-c0a1-48b2-8390-2dcfba0fca5dn%40googlegroups.co=
m</a>.<br />

------=_Part_2987_1894692648.1618298310521--

------=_Part_2986_20677770.1618298310521--
