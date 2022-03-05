Return-Path: <jailhouse-dev+bncBCA6TFW6UQBRBMEARWIQMGQEYP75Y4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E474CE449
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 11:49:21 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id bb7-20020a05622a1b0700b002e04e16d3easf4040483qtb.16
        for <lists+jailhouse-dev@lfdr.de>; Sat, 05 Mar 2022 02:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=abai9gZhe10y1BKYUAXH1zGwQwpSV0jX2n97CxPtCjA=;
        b=hBViyeTPwZy7t+iXU7KmRkw8vSBtwMgI5iiQZ4j8SuyvOdflBFLuzurdGLJBR9Xooz
         kljjcHOWI1u30fg0GZyrs6vcmh3kYoZNwlHW1ewh0AC77IFmgFirzkA5DtwUjvUAAxMh
         xkxzq4hUcEcmeZSpXJpih33HWa5fH0g6Bnun2YmY7Dqh7gILm0yXEFVFu5suSCWlhCix
         Ah80VGmAcc6Mwo6rHn23eJsHUQSLhDCKa7FD5P/PmwwMk4oMrUVpIFdXYlmyuQ3crID0
         Dpxx/gr/EiuS5k6h4hKC8YsQIknaCUkj4W/TyztGHlXwiMigj5Zq7HCL0+v4xXiwZo9+
         lhPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=abai9gZhe10y1BKYUAXH1zGwQwpSV0jX2n97CxPtCjA=;
        b=IxW/hXed/jnIFZDdDDVY+0S5udt5Z4QL8tnh5HOgzBOuV6ccG2BTtGBKgzkyetjwoV
         Kc2UjQarXDf7z0t8uFU2UBl8BZWh7M2ZQnUIthpNzY1s3Ej0bJlVuBkNlliR3Zv6dVZM
         aj920heGQi0ynATUEaTN/KJecCnBGssMrt1QBOyETvaI8AjfpXDqQ+9Q7bEq6JWQIIFN
         1IBQhnTKRvtuIf/D5P8AhD833P413Pwk3z0nIceIG31N4lQ2IriMLv2ZayOnitx0lIqg
         DxoHmIgeQ4uOu5ZqDid3pxto6hKhhf7UTdtXulvCojhfvf4VklLiSrz24DR8IaQIChYQ
         nNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=abai9gZhe10y1BKYUAXH1zGwQwpSV0jX2n97CxPtCjA=;
        b=2NGhYC0NT9r2frOdWtgqb83obiQHvGqmIY2PXR875BITM/7RRun+iPSKaxVJVCJJfp
         54O1Lc0uT8YlEE7tXRQOVp1e65KgcRnhtknoSBih0gFjW9Kqe0z//SI4NACB4RUxSNyz
         KknU42HhjEH+0cgfKJ9LeWmWxeXgcOk8MSue38yiX9bXU+VF3bB7/ThbTPr/phldMOCU
         T2YxXa9A/gge65InLW3bLKv41mQYm0AZ5yEPysxVgQOEqmjrbuuVGyyeAJ0Z55xF6BRv
         HerJqt4SRtJ/6M2fJ3zZ/2Szns0F3n6hhD9tMImXFFZWhZWMJ7el9mfY3HRzNbHrW/S0
         OvIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531If3FiwEgo+8XWaiPMl/QGXgFSHJMEKp4twiA8J1ND6kTZpC0L
	bM13Evx8Y5uw9JVW5cd+mUs=
X-Google-Smtp-Source: ABdhPJyGzC0mataqVizlE9V+9SE1viFLe5UBBkVGCar+torJt3z9GW5b+bwuDQ3JnPM+jBUpOVXq4A==
X-Received: by 2002:a37:f703:0:b0:62c:ecc5:37ea with SMTP id q3-20020a37f703000000b0062cecc537eamr1650569qkj.601.1646477360732;
        Sat, 05 Mar 2022 02:49:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:3002:b0:432:946e:7c28 with SMTP id
 ke2-20020a056214300200b00432946e7c28ls3489278qvb.5.gmail; Sat, 05 Mar 2022
 02:49:20 -0800 (PST)
X-Received: by 2002:a0c:fd4c:0:b0:432:9d4c:26b4 with SMTP id j12-20020a0cfd4c000000b004329d4c26b4mr1946793qvs.15.1646477359976;
        Sat, 05 Mar 2022 02:49:19 -0800 (PST)
Date: Sat, 5 Mar 2022 02:49:19 -0800 (PST)
From: Giovanni Olino <gianni.olino@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f9df17f0-5dd5-426f-ba2a-34e1a17e33e8n@googlegroups.com>
In-Reply-To: <06f69587-8e20-810b-a142-97378bf1f8da@siemens.com>
References: <77226583-76dd-4c0b-9a0c-c69332e824b9n@googlegroups.com>
 <06f69587-8e20-810b-a142-97378bf1f8da@siemens.com>
Subject: Re: [Banana Pi] make modules_install give "Makefile:1250: recipe
 for target '_modinst_' failed"
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2216_700140088.1646477359478"
X-Original-Sender: gianni.olino@gmail.com
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

------=_Part_2216_700140088.1646477359478
Content-Type: multipart/alternative; 
	boundary="----=_Part_2217_2013122491.1646477359478"

------=_Part_2217_2013122491.1646477359478
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You were right, after disabling Module Verification in the menuconfig=20
finally on the Banana Pi the *make moduels_install *worked fine.
Now I have another issue, I don't know why but:
*make ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- -j$(( $(nproc) + 1 ))=
=20
uImage modules dtbs LOADADDR=3D40008000*
doesn't compile the .dts files in arch/arm/boot/dts  into .dtb files=20
despite in that folder I have a Makefile wich describes all the device tree=
=20
blob.

Any suggestion?

Thx a lot
Il giorno venerd=C3=AC 4 marzo 2022 alle 15:39:35 UTC+1 j.kiszka...@gmail.c=
om ha=20
scritto:

> On 04.03.22 09:35, Giovanni Olino wrote:
> > Hi,
> > I'm trying to get Jailhouse on  a Banana Pi M1.
> > Siemens has a docomentation for it
> > (
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-b=
anana-pi-arm-board.md
> )
> > but I'm using linux_4.19, in particular git clone -b
> > jailhouse-enabling/4.19 https://github.com/siemens/linux.git
> > linux_siemens_4.19.
> > On the compile machine every seems to work properly, I can do Make of
> > Linux, Jailhouse and FreeRTOS without problems or errors but one moved
> > on the Board errors occours.
> >=20
> > On the Bananian, trough sshfs, when I try to mount the compiled kernel
> > with "make mudules_install" this errors come out:
> >=20
> >  /INSTALL block/bfq.ko/
> > /scripts/sign-file: 2: scripts/sign-file: Syntax error: word unexpected
> > (expected "(" )/
> > /scripts/Makefile.modinst:36: recipe for target 'block/bfq.ko' failed
> > /
> > /make[1]: *** [block/bfq.ko] Error 2/
> > /Makefile:1250: recipe for targer '_modinst_' failed/
> > /make ***[_modinst_] Error 2/
> >=20
> > In the sign-file script I don't see where a parenthesis might be missin=
g
> > and  for target block/bfq.ko don't know what to look for.
> >=20
>
> Seems you have module signing enabled. Maybe you can already get away
> with turning that off.
>
> But that how-to is rather old by now, so is this 4.19 kernel. There
> might be more traps remaining. For a more modern integration of a
> similar board, look for the OrangePi image that jailhouse-images
> generates. Never found the time to port that over to the M1, and now
> 32-bit ARM is effectively legacy.
>
> Jan
>
> --=20
> Siemens AG, Technology
> Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f9df17f0-5dd5-426f-ba2a-34e1a17e33e8n%40googlegroups.com.

------=_Part_2217_2013122491.1646477359478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You were right, after disabling Module Verification in the menuconfig final=
ly on the Banana Pi the <i>make moduels_install </i>worked fine.<br><div>No=
w I have another issue, I don't know why but:</div><div><i>make ARCH=3Darm =
CROSS_COMPILE=3Darm-linux-gnueabihf- -j$(( $(nproc) + 1 )) uImage modules d=
tbs LOADADDR=3D40008000</i><br></div><div>doesn't compile the .dts files in=
 arch/arm/boot/dts&nbsp; into .dtb files despite in that folder I have a Ma=
kefile wich describes all the device tree blob.</div><div><br></div><div>An=
y suggestion?</div><div><br></div><div>Thx a lot</div><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno venerd=C3=AC 4 marzo=
 2022 alle 15:39:35 UTC+1 j.kiszka...@gmail.com ha scritto:<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;">On 04.03.22 09:35, Giovanni =
Olino wrote:
<br>&gt; Hi,
<br>&gt; I&#39;m trying to get Jailhouse on=C2=A0 a Banana Pi M1.
<br>&gt; Siemens has a docomentation for it
<br>&gt; (<a href=3D"https://github.com/siemens/jailhouse/blob/master/Docum=
entation/setup-on-banana-pi-arm-board.md" target=3D"_blank" rel=3D"nofollow=
" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dit&amp;q=3Dhttps:=
//github.com/siemens/jailhouse/blob/master/Documentation/setup-on-banana-pi=
-arm-board.md&amp;source=3Dgmail&amp;ust=3D1646563311255000&amp;usg=3DAFQjC=
NHegluJraT6SGxxM1X6HuhWRV54Tg">https://github.com/siemens/jailhouse/blob/ma=
ster/Documentation/setup-on-banana-pi-arm-board.md</a>)
<br>&gt; but I&#39;m using linux_4.19, in particular git clone -b
<br>&gt; jailhouse-enabling/4.19 <a href=3D"https://github.com/siemens/linu=
x.git" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Dit&amp;q=3Dhttps://github.com/siemens/linux.git&amp;=
source=3Dgmail&amp;ust=3D1646563311255000&amp;usg=3DAFQjCNFlOH_3rMWpNhYO1WE=
3wDaTWuHY1g">https://github.com/siemens/linux.git</a>
<br>&gt; linux_siemens_4.19.
<br>&gt; On the compile machine every seems to work properly, I can do Make=
 of
<br>&gt; Linux, Jailhouse and FreeRTOS without problems or errors but one m=
oved
<br>&gt; on the Board errors occours.
<br>&gt;=20
<br>&gt; On the Bananian, trough sshfs, when I try to mount the compiled ke=
rnel
<br>&gt; with &quot;make mudules_install&quot; this errors come out:
<br>&gt;=20
<br>&gt; =C2=A0/INSTALL block/bfq.ko/
<br>&gt; /scripts/sign-file: 2: scripts/sign-file: Syntax error: word unexp=
ected
<br>&gt; (expected &quot;(&quot; )/
<br>&gt; /scripts/Makefile.modinst:36: recipe for target &#39;block/bfq.ko&=
#39; failed
<br>&gt; /
<br>&gt; /make[1]: *** [block/bfq.ko] Error 2/
<br>&gt; /Makefile:1250: recipe for targer &#39;_modinst_&#39; failed/
<br>&gt; /make ***[_modinst_] Error 2/
<br>&gt;=20
<br>&gt; In the sign-file script I don&#39;t see where a parenthesis might =
be missing
<br>&gt; and=C2=A0 for target block/bfq.ko don&#39;t know what to look for.
<br>&gt;=20
<br>
<br>Seems you have module signing enabled. Maybe you can already get away
<br>with turning that off.
<br>
<br>But that how-to is rather old by now, so is this 4.19 kernel. There
<br>might be more traps remaining. For a more modern integration of a
<br>similar board, look for the OrangePi image that jailhouse-images
<br>generates. Never found the time to port that over to the M1, and now
<br>32-bit ARM is effectively legacy.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f9df17f0-5dd5-426f-ba2a-34e1a17e33e8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f9df17f0-5dd5-426f-ba2a-34e1a17e33e8n%40googlegroups.co=
m</a>.<br />

------=_Part_2217_2013122491.1646477359478--

------=_Part_2216_700140088.1646477359478--
