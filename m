Return-Path: <jailhouse-dev+bncBC653PXTYYERBJ7UV6GAMGQE62R34OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6830444C58B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 17:58:16 +0100 (CET)
Received: by mail-qk1-x73e.google.com with SMTP id t15-20020a05620a450f00b0046325fa7b93sf2322260qkp.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cdligMeHrbgkqAdOh7hX+3blPXthhVNLfpe3mqaF4i4=;
        b=miUcrKxkZbW+im3XPzVK7AYU1IdXegqzYfQh+gHiq4s5wuWzDpbDK0tPDeWV9+4st4
         wdcd0Dc4nM9K+H14UtenRUzxocisGcVvtDk4+7opfStz1hD+t010dMpu+tnw01/GfGtp
         ZiLMqF3ZHlmSYXI4TvkUvbE+fOuxd7bwfyQM7pbCY0XPP6ok64nhMXcIv5lhP+GKJTDs
         1IMaaVQIHpvfSydJErqBbkCpGU1Ks0s3f8t9n5iqRDdixUNtxC+GtT+MvaA8R//njPgq
         2UkhzBMExHgqaULb1jr5g0HEc38c5zP3CvVKTSpiDLjdxOknOX09+ACX7vZKe8z292cJ
         6Xog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cdligMeHrbgkqAdOh7hX+3blPXthhVNLfpe3mqaF4i4=;
        b=CjSJxzZIV7uABChVsQEMCmfH1AoAZxNOP/tyjIvN5hQdTS26S8wFHUE96q6TGDck23
         pxlVX7EicXvwJP2qPDSb/R9zJ98OEP0LBAGuG0FAIxd45W4HPtJqe9U9yrNSBVuRVxXu
         2+jV2Y9xXIMe6xPs3sFomv8NxOhyiWZeEkbgmQf924rbxuBTtATDTc/LDaKLNaMCorvv
         1dA1Jv8nupszfwA8HpMfxU4Y7Cyy1PWd75iKn1ywUEYVYzTNKjdUa5o56QuxY0mkoce3
         JEHawA3kwc6ExuQzLVDUQZLeBHBcETNuc2Dt2WF6hCUVIq9O1LllzGpv0TpgwzayNrSV
         i5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cdligMeHrbgkqAdOh7hX+3blPXthhVNLfpe3mqaF4i4=;
        b=hIO+Oe8wXcB2NGhKKHPwIPB/dDjQFh7RZXt8wiEvvyAQ15Tx4qqmKUieTgEU9WpK0I
         tvru+Mzgy3xBBsWcMA7319s5WZWVq7+WrdLJjA4M91lX8GSaPwWidnLWvjHoFJq2is1U
         nlDiCLEaIexMEZ6yT4cu4gqDjM/M9GkAmqUyuJFWuVTMiCkQIBAILAvPASNnz9schch0
         KLARZ0chJrULVmjfwpueczZKV5d2EBS17bKpUAApGKEaBKKLN1h8nnc68AN/UCea9eFB
         c3vCX4vrMe48EA5CfGFdPYkCSH+gxNzepK2Z6+U5rjVXCPJAfF6BEveyAva56UxjGBcG
         /kMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530EK5P6n+BQ3u4mg2caq0x2qpXHSwdiQyvRHskbz6wdk6hxsqjy
	tLfSOURvyzuH5rRxI0GI1MQ=
X-Google-Smtp-Source: ABdhPJz+kPfjmImbcEeSvJNDwpIJpAtXpIQVBWu+hSK1330hBGIYuCo1oBUot2T6cw1WcBKbeCQg0A==
X-Received: by 2002:ac8:57c2:: with SMTP id w2mr524865qta.54.1636563495388;
        Wed, 10 Nov 2021 08:58:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:3725:: with SMTP id de37ls229281qkb.5.gmail; Wed,
 10 Nov 2021 08:58:15 -0800 (PST)
X-Received: by 2002:a37:b306:: with SMTP id c6mr661046qkf.133.1636563494753;
        Wed, 10 Nov 2021 08:58:14 -0800 (PST)
Date: Wed, 10 Nov 2021 08:58:14 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f3c70343-1f25-4540-ad1f-b0831d31dabdn@googlegroups.com>
In-Reply-To: <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
References: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
 <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
Subject: Re: implicit declaration of add_cpu and remove_cpu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3828_1251531030.1636563494225"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_3828_1251531030.1636563494225
Content-Type: multipart/alternative; 
	boundary="----=_Part_3829_400667607.1636563494225"

------=_Part_3829_400667607.1636563494225
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am not sure, if I should answer to this, but this can be solved by=20
recompiling Linux headers with editing kernel configuration:
add CONFIG_HOTPLUG_CPU=3Dy

this would help your problem, and jailhouse might work, but you might face=
=20
a problem of Jailhouse adding no virtual devices. You can check this by=20
lspci before and after jailhouse enable command.=20

I have one question regarding your 5.10 kernel. I tried compiling it on=20
5.10, but I had different error, so I was using 5.3 and had no PCI devices,=
=20
then upgraded to 5.4 and I got back the PCI devices, but as I said=20
Jailhouse still cannot add virtual PCI device

Best regards,=20
Moustafa Noufale

On Wednesday, 10 November 2021 at 14:46:03 UTC+1 j.kiszka...@gmail.com=20
wrote:

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
jailhouse-dev/f3c70343-1f25-4540-ad1f-b0831d31dabdn%40googlegroups.com.

------=_Part_3829_400667607.1636563494225
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am not sure, if I should answer to this, but this can be solved by recomp=
iling Linux headers with editing kernel configuration:<div><span style=3D"f=
ont-size: 14px;">add CONFIG_HOTPLUG_CPU=3Dy</span></div><div><br></div><div=
>this would help your problem, and jailhouse might work, but you might face=
 a problem of Jailhouse adding no virtual devices. You can check this by ls=
pci before and after jailhouse enable command.&nbsp;</div><div><br></div><d=
iv>I have one question regarding your 5.10 kernel. I tried compiling it on =
5.10, but I had different error, so I was using 5.3 and had no PCI devices,=
 then upgraded to 5.4 and I got back the PCI devices, but as I said Jailhou=
se still cannot add virtual PCI device</div><div><br></div><div>Best regard=
s,&nbsp;<br>Moustafa Noufale<br><br></div><div class=3D"gmail_quote"><div d=
ir=3D"auto" class=3D"gmail_attr">On Wednesday, 10 November 2021 at 14:46:03=
 UTC+1 j.kiszka...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204=
); padding-left: 1ex;">On 10.11.21 13:05, Andrea Marchetta wrote:
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
om/d/msgid/jailhouse-dev/f3c70343-1f25-4540-ad1f-b0831d31dabdn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f3c70343-1f25-4540-ad1f-b0831d31dabdn%40googlegroups.co=
m</a>.<br />

------=_Part_3829_400667607.1636563494225--

------=_Part_3828_1251531030.1636563494225--
