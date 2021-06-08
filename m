Return-Path: <jailhouse-dev+bncBCMYJFG524BBBWFN7WCQMGQE6IOM2HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6139F537
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Jun 2021 13:39:04 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id t11-20020a056402524bb029038ffacf1cafsf1362138edd.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Jun 2021 04:39:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623152344; cv=pass;
        d=google.com; s=arc-20160816;
        b=oH8t8d9Qsjo3JtLoscrOXUORTyAja38ITGTKpsyVF52qnGBcS0sqzr6pPuYR6rbvaf
         AmdwFgiYaxhK6zxYZ1jIj4eFJyWQx3sotUnv5gA4W8lV6KFZKT8WGSntEHXVSpeHlXna
         IKl9Z+3SwUTWyGiKVgaGGIu6DIUJQFepTK/+mAE2UiZBGGQifBHejLyCEi2C+BpHAxjp
         HXunMy0HeFUy5lflOI93pXkpUeiqh4A3dd03KAplJ2HXT374ymwNMlC9PqU/ao7y30zI
         3Eges4vif+4eu5CeU3t+UrDDNRozqwDI/xPcLOoJaPTnDxGNoka5zBLtZbkXwirx0kQu
         hNWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=7cKs5x/HjD6heUQNsWoOkAe63avD9qDNfieI0YZmK8s=;
        b=0B5ck5FsxBQ5clcVDcf1MoZgQCEoQNMHeu8blCYVKRtatv3WRKTAvbwk9EhUgJ+6d0
         EEPd0GEAoONq61bR+DVS56r4UvlcbZsNFoggCCxTZsWTnLLpVHfMQMz1ZSJmeBHED9HP
         wMonrwuZRDez32dGOHIxRUx9pOg5BT8EKLDvntiPY5Cef9R9hlmKRtZ9whOwq+kI/Wzb
         +ygoYK6+joNakk5qJOYBeviszVtRt9voc2E/CNVrPwpJpBFsymc1WhHJMwRq7yBohiyn
         rk2EF82kqQYoi0Ev6Yhw3kN3q8Wp5z8dkE/TcnClzwpA8EDO3IhSuNvDyJzZvpmSvUxL
         nrTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GMDTqMRj;
       spf=pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::230 as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7cKs5x/HjD6heUQNsWoOkAe63avD9qDNfieI0YZmK8s=;
        b=WmxVg1Tu9x1p5m5VAeB0cLTOgarmDmWlFcFL814RY5XWKBPCTlJPZmny1ZoSD1TCST
         gEQ9vWbLU5DKxA/AU0ApArPc2VgLgiQ60JXVmdiHHWWlGOM0+We3JEzoglRBfHaBQlnt
         ymPS+4ZYlpPdTaKQ3U13JFTvL0AQnChQCs6O5mu4/p0UpjAXbPcK1ble52VJyx/1RqAr
         GI423K27dwIToi05jEVTkzefk2ACLYqbFRFhs8tGcwXf6MM2QEk+KYwJzNsHuwuFx5Ej
         8II6ClA6gJkJ0P2UmnSoHu9wTDGUQXvNq7vLkUexMHNlgVCRyujfzYFHWkTCHcBzdPi1
         z7Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7cKs5x/HjD6heUQNsWoOkAe63avD9qDNfieI0YZmK8s=;
        b=mvEnIVknZW6KC9JW/QSunNbE3uMZZsqy9fAtFs2yhPAsersB3woNmPzMTOOL+wb7SR
         59wgh0WVIp4ZU+1bTBYYUo2UofxzhK9iNO2Wttnh3Uqdvp9iug29a0DBaXVKXxcjfYPt
         sQXNELyt/aXRTIC/mPDIHnZcoKpH4BpZIEDW3+vgz8qaOx7ZDs/J84FPHyL7qf/IOBKE
         EJP4ns4gehQDs7hGxnu59lOPpCt4/9neZB6sUU6AhtDxPDFs/ANwl0OvsfXaHwxp8J66
         b6cboTlGIBeAXEoWPyiPWd87ojcTGrqNCrN4uy1TF+/KW0PyicSw25K8rXYxzHjzDYXQ
         zhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7cKs5x/HjD6heUQNsWoOkAe63avD9qDNfieI0YZmK8s=;
        b=a0XTJdVFQNqOVyaLP3qQwzTJhb/ps0SuPQ1cOMdDCYlRgPG3U455gn6vY9QHvaRaqA
         /7rVLkFas2Pd7vf1E5+Dg1Pg3J8I3SamWhWpIphzKRAE10gcTFI4CYMsefF0UBhPniEM
         0TkSvV926ETDeOeI1luBRa6+oQ46gkotEutwIuVURzY/JYg07qvWNT9YtflPRTjqsEhr
         mO8jaqn3FxXp1o9s6tikdr1WPhpYnmMMV5cOiKoQUlTWiI+Qk6pO5enydGINV8wTCFtc
         JWNipF5OoFbu93wpRaEhuGjsfSWcnS33S22wUint6532B/ALdkGll5vb9R4zwsXqUshU
         TIyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yREwgm/T4FZ1WL6C3CHUWewkWUQ1eDtPwJPvG2+vP7+LIUVzs
	FAoCt+hSSHetlig0yT3DRJs=
X-Google-Smtp-Source: ABdhPJyhCJ92S2tQQE22KQAD7Y2/ixUqFH0b0yRFRuDqjPhh+Ff664jWN/UXomTijOMLueYQ5nG8Mw==
X-Received: by 2002:a05:6402:11cb:: with SMTP id j11mr7648596edw.24.1623152344679;
        Tue, 08 Jun 2021 04:39:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:58d6:: with SMTP id e22ls3459218ejs.7.gmail; Tue, 08
 Jun 2021 04:39:03 -0700 (PDT)
X-Received: by 2002:a17:906:9706:: with SMTP id k6mr22687299ejx.456.1623152343757;
        Tue, 08 Jun 2021 04:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623152343; cv=none;
        d=google.com; s=arc-20160816;
        b=VgVbYRP0Ae45mLTbiNfsUuHrauzwM2fC/zhq8Hj5h1QbF/nPT3hWUhBxrH9Y1mggOT
         CDDnen+IUOj837FqNHTVKRbMSRQN5TRbXkNcA6B42HuQLzsn5FIxx/Vn2EPBXOfTFsV5
         dbdqvN4OXJN6gOGObY4cio4cpWE+mghpNXvK2O7MH5DpO9VSjRNDQ5jOXl2y8UTD8fSR
         +rxlr8Y0Rm86ypqPpTHsOSaK6KIkUaEagSM3LZqNf9wrf2+CWIE+waDC6CQrPnxQDUIC
         rMb3A00y/Ky/J1EkhsvOZdEMh2LJrq9sWT3sBQR5dMzojn0DT+J8/tkWMX8WkC9JVL8O
         aucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nT+OZn/8teah5tf6b9XgrfH7YlmcQSl4pmz7SCgZIW4=;
        b=PbsmwMoOLsEEZzEkonQqhTQ59saUUbZJvciAFOMFbtJtgnBNMDXwxh1HGT8zsT78OH
         VforcdXKNaFg13fEAESiYOtSxIyxm7QqBUrJkyo3i/cT7/ZWwj8Fj0lXZT+qpuozOw7/
         9ay687rioDEExnFouxjxv8Z4FNKQqG8jpSepX74y1QPpUEyPQySPIAgP9QRqMSondWx9
         Ofhev4kqeSjgzVq5hK3vYdnUTwu8rqzVL48I3PjHMfDyvqf5MR5OK1zDt3pRLvd8ke2d
         +GtQzYisulasmOb+4MBSwkEt8NONBMEyA+Il9RdnbzLbPsJxcPqkD6bXx3vNYdEGD8dy
         3bzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GMDTqMRj;
       spf=pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::230 as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com. [2a00:1450:4864:20::230])
        by gmr-mx.google.com with ESMTPS id w2si179696edi.2.2021.06.08.04.39.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 04:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of nmiliakopoulou@gmail.com designates 2a00:1450:4864:20::230 as permitted sender) client-ip=2a00:1450:4864:20::230;
Received: by mail-lj1-x230.google.com with SMTP id o8so26598413ljp.0
        for <jailhouse-dev@googlegroups.com>; Tue, 08 Jun 2021 04:39:03 -0700 (PDT)
X-Received: by 2002:a2e:a554:: with SMTP id e20mr17849772ljn.23.1623152343229;
 Tue, 08 Jun 2021 04:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <8a66aab0-1fff-007e-5a7a-dc150fb15031@oth-regensburg.de> <a2718c06-afe6-603e-e9bb-92e7518c48ab@siemens.com>
In-Reply-To: <a2718c06-afe6-603e-e9bb-92e7518c48ab@siemens.com>
From: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>
Date: Tue, 8 Jun 2021 14:38:52 +0300
Message-ID: <CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCRiHvjeMtg@mail.gmail.com>
Subject: Re: install and run jailhouse on rpi4 board
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, 
	Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d5a8fb05c43f9a2d"
X-Original-Sender: nmiliakopoulou@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=GMDTqMRj;       spf=pass
 (google.com: domain of nmiliakopoulou@gmail.com designates
 2a00:1450:4864:20::230 as permitted sender) smtp.mailfrom=nmiliakopoulou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000d5a8fb05c43f9a2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you all for the guidance.

=CE=A3=CF=84=CE=B9=CF=82 =CE=A0=CE=B1=CF=81, 4 =CE=99=CE=BF=CF=85=CE=BD 202=
1 =CF=83=CF=84=CE=B9=CF=82 4:44 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Jan Kiszka <j=
an.kiszka@siemens.com>
=CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:

> On 04.06.21 15:32, Ralf Ramsauer wrote:
> > Hi Nikoleta,
> >
> > On 04/06/2021 12:24, Nikoleta Markela Iliakopoulou wrote:
> >> Dear all,
> >>
> >> I am student in ECE NTUA and I am studying Jailhouse for my diploma
> >> thesis. So far I managed to install and run jailhouse in virtual
> >> environment (QEMU) in x86 and use ready-to-use jailhouse images for vi=
rt
> >> environment for both x86 and arm architecture. Now I am assigned to
> >> install it on rpi4 board.
> >>
> >> I know there is this repo https://github.com/siemens/jailhouse-images
> >> with ready to use image for rpi4, but I would like to install it
> >> manually to explore better all the options provided, write some code o=
n
> >> my own and test it.
> >>
> >> I have already explored the internet and this google group for further
> >> information, and apart from some general guidance, I didnt find anythi=
ng
> >> specific/(or maybe I coudn't understand some key points).
> >>
> >>
> >> I would really appreciate it if someone could give me some
> >> advice/guidance on this subject.
> >
> > It's basically just a few steps:
> >   - Take the distro of your choice
> >   - Clone Jailhouse
> >   - Clone Jan's Linux/Jailhouse tree [1]
>
I'm trying to build (cross-compile with gcc-linaro-7.5.0-2019.12 ) and
install the jailhouse-enabling linux-5.10 from
https://github.com/siemens/linux/tree/jailhouse-enabling/5.10 .


> >   - Build & boot your own kernel (you can refer to the config in
> >     jailhouse-images)
>
So, regarding the configuration I found this file :
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linu=
x/files/arm64_defconfig_5.10
.
I copied the file to .config and ran : make oldconfig because it was the
only way for the config options to get accepted. Then I am asked for other
general config options as well, which I put at random.

Am I doing something wrong here?

After that I built the kernel and transferred the Image to the raspberrypi4
made the necessary adjustments in config.txt (kernel=3Dnewkernel.img) and r=
an
sudo reboot.

It doesn't boot at all..

>   - Build and run Jailhouse
> >
>
> In addition on this target:
>
>  - adjust the boot process to use TF-A
>
I managed to do that as well.

>  - inject memory reservation as DT overlay
>
I thought of compiling the latest jailhouse.dts and aliases.dts files as
long as I boot the new kernel.

>
> Finding the right combination of versions yourself can be very tedious
> (I've already spent many hours on this, again and again). So it is best
> to follow what jailhouse-images does - or, even better, build your
> customizations on top.
>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

Any comment on this is greatly appreciated.

Thanks again in advance.

Nikoleta

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCRiHvjeMtg%40mail.gm=
ail.com.

--000000000000d5a8fb05c43f9a2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,=C2=A0</div><div><br></div><div>Thank you all f=
or the guidance.</div><div><br></div><img width=3D"0" height=3D"0" class=3D=
"mailtrack-img" alt=3D"" style=3D"display:flex" src=3D"https://mailtrack.io=
/trace/mail/38b76e49f66b1e71925ee7055851446ed2b03582.png?u=3D6390373"><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=CE=A3=CF=84=CE=
=B9=CF=82 =CE=A0=CE=B1=CF=81, 4 =CE=99=CE=BF=CF=85=CE=BD 2021 =CF=83=CF=84=
=CE=B9=CF=82 4:44 =CE=BC.=CE=BC., =CE=BF/=CE=B7 Jan Kiszka &lt;<a href=3D"m=
ailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; =CE=AD=CE=B3=
=CF=81=CE=B1=CF=88=CE=B5:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 04.06.21 15:32, Ralf Ramsauer wrote:<br>
&gt; Hi Nikoleta,<br>
&gt; <br>
&gt; On 04/06/2021 12:24, Nikoleta Markela Iliakopoulou wrote:<br>
&gt;&gt; Dear all,=C2=A0<br>
&gt;&gt;<br>
&gt;&gt; I am student in ECE NTUA and I am studying Jailhouse for my diplom=
a<br>
&gt;&gt; thesis. So far I managed to install and run jailhouse in virtual<b=
r>
&gt;&gt; environment (QEMU) in x86 and use ready-to-use jailhouse images fo=
r virt<br>
&gt;&gt; environment for both x86 and arm architecture. Now I am assigned t=
o<br>
&gt;&gt; install it on rpi4 board.=C2=A0<br>
&gt;&gt;<br>
&gt;&gt; I know there is this repo=C2=A0<a href=3D"https://github.com/sieme=
ns/jailhouse-images" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/siemens/jailhouse-images</a><br>
&gt;&gt; with ready to use image for rpi4, but I would like to install it<b=
r>
&gt;&gt; manually to explore better all the options provided, write some co=
de on<br>
&gt;&gt; my own and test it.=C2=A0<br>
&gt;&gt;<br>
&gt;&gt; I have already explored the internet and this google group for fur=
ther<br>
&gt;&gt; information, and apart from some general guidance, I didnt find an=
ything<br>
&gt;&gt; specific/(or maybe I coudn&#39;t understand some key points).=C2=
=A0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I would really appreciate it if someone could give me some<br>
&gt;&gt; advice/guidance on this subject.<br>
&gt; <br>
&gt; It&#39;s basically just a few steps:<br>
&gt;=C2=A0 =C2=A0- Take the distro of your choice<br>
&gt;=C2=A0 =C2=A0- Clone Jailhouse<br>
&gt;=C2=A0 =C2=A0- Clone Jan&#39;s Linux/Jailhouse tree [1]=C2=A0<br></bloc=
kquote><div>I&#39;m trying=C2=A0to build (cross-compile with=C2=A0gcc-linar=
o-7.5.0-2019.12 ) and install the jailhouse-enabling linux-5.10 from=C2=A0<=
a href=3D"https://github.com/siemens/linux/tree/jailhouse-enabling/5.10">ht=
tps://github.com/siemens/linux/tree/jailhouse-enabling/5.10</a> .=C2=A0</di=
v><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt;=C2=A0 =C2=A0- Build &amp; boot your own kernel (you can refer to the c=
onfig in<br>
&gt;=C2=A0 =C2=A0 =C2=A0jailhouse-images)<br></blockquote><div>So, regardin=
g the configuration I found this file :=C2=A0=C2=A0<a href=3D"https://githu=
b.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/arm64=
_defconfig_5.10">https://github.com/siemens/jailhouse-images/blob/master/re=
cipes-kernel/linux/files/arm64_defconfig_5.10</a> .=C2=A0</div><div>I copie=
d the file to .config and ran : make oldconfig because it was the only way =
for the config options to get accepted. Then I am asked for other general c=
onfig options as well, which I put at random.</div><div><br></div><div>Am I=
 doing something wrong here?=C2=A0</div><div><br></div><div>After that I bu=
ilt the kernel and transferred the Image to the raspberrypi4 made the neces=
sary adjustments in config.txt (kernel=3Dnewkernel.img) and ran sudo reboot=
.=C2=A0</div><div><br></div><div>It doesn&#39;t boot at all..=C2=A0</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0- Build and run Jailhouse<br>
&gt; <br>
<br>
In addition on this target:<br>
<br>
=C2=A0- adjust the boot process to use TF-A<br></blockquote><div>I managed =
to do that as well.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0- inject memory reservation as DT overlay<br></blockquote><div>I thou=
ght of compiling the latest jailhouse.dts and aliases.dts files as long as =
I boot the new kernel.</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Finding the right combination of versions yourself can be very tedious<br>
(I&#39;ve already spent many hours on this, again and again). So it is best=
<br>
to follow what jailhouse-images does - or, even better, build your<br>
customizations on top.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, T RDA IOT<br>
Corporate Competence Center Embedded Linux<br></blockquote><div><br></div><=
div>Any comment on this is greatly appreciated.</div><div><br></div><div>Th=
anks again in advance.</div><div><br></div><div>Nikoleta</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCRiHvjeMt=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAMPOHCnrnzQCiruXMCpoUzoq1t5-UgyyonGfXAwmCR=
iHvjeMtg%40mail.gmail.com</a>.<br />

--000000000000d5a8fb05c43f9a2d--
