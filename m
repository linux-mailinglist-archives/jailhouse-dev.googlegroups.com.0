Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIOFX77AKGQEAQZ5AZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA92D33FD
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 21:31:30 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id z19sf5667939lfg.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 12:31:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607459489; cv=pass;
        d=google.com; s=arc-20160816;
        b=fv524k6sHgG19+IsVUh1OPcmw8tZ1FLwUbYsfRRTbSkKK5Ul3rFVkiz4FAATt97pEj
         5UZ23kXtCI4uZwrFW0NM4/3L/0ymL84tez00EOS1fBXDm+RdGR6qPt8/yJ23CmuJg7iI
         XJieoF3h/UZ11AJBGeAYkg4dudWVaV980ikF8gY/4W7VPBaW+XRC7cP9v+mZ6W+6Sg5c
         n594C8AVPNkw/HigTK+BYpzK423dDPaxk3nQmqYxkXilkCpRjC4S2k5s/HjV/BwF0Ptr
         Brg3XeQSSubn9rBfAMKOgHKdK7EZU+CW7SKT79R+fustSSCQiJLdgo29Dr6G9lK3ow5q
         f/qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=bBwUOY2actVt73vuWf8sdnN2CsLGGHX3CCIoV9BTAB8=;
        b=WsNgYY2gK0V8n6k+RCGRekiyPLZW0cP2otOYqKOTCVYKFcSnskDE3L+nYDz5DJY5Un
         btYfK2b6kMQop4/sl4ige6oIjTJ0DdrjAbLC0+9gE2gqsOBeBtWS+3T3le2rA46W7X2V
         2+SsqE8ud4u1pBKwaqXeXM+Nx3zcRAWCbz2j6pMtY7rcHD1PH/JxuEZq7VlTbgPLHloU
         qf2bpRlyg+mHhIcHZKHcpvGixckgOtvTU/4WunLUoJuXxYTdndJXmGjWyibOSm0VyKEZ
         859DVds1YwPC5VapcGOFrWoj0NhnEujjgX2zjiL8Tk5sgRsoSRtuiOFUYrjS1cCOdPZj
         GjCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bBwUOY2actVt73vuWf8sdnN2CsLGGHX3CCIoV9BTAB8=;
        b=gxcuCnqgbWUQD9fSy2ZSrhNZBDLQN9AGRkEsW3pjKdGlPl4+RTvA2WVrTyprorR/XL
         W18g5e49JWNv9PTrKWB7fkCmu/BVKPhAC5TQoPLg9nvM6hzyrIcMO+PeHHw9abldwgWb
         a/YLMgE/DSZDsvy7YeqVEFMHYrKhYeS8tj6mY8yKgAXuS3HB0J9mDgHPTrUO8B2EkT+6
         gElSbv/EWS77mOuGgpEWj4gAfJ4ZFPKI+5BL5v9LTaXT2J1NSsNha9axQwFB8JAMcWgh
         dlTHb/ORbtgkis5cuCl7sGexg0QzAJ9t14rbiQMQuJD2FU++Ia24VC1mGUjeZdN9T3eY
         Z1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bBwUOY2actVt73vuWf8sdnN2CsLGGHX3CCIoV9BTAB8=;
        b=hec6OcgfLlvCi0g+sDl8P04kroGiTgM3FSLrmzTga35exsWorJ2Z7IyI+320eJZ+yN
         gM2ZroKKion1jKEDLJN2JGmG5xTjkxDzi/Y5yLpA7oRwHc8xKmi/dfTwQEpZRYuv986B
         pHwUD6GjSUeLfyPpSUO2hwHyLkDShFkOT/j6XkAkJQYBFty4aOaVsS/RRH1F0nqdHzQe
         qlscp9+IyL7q981xM53tN89jcSoCjYMPQ0RrX7W6ZaxHt9R9zDKAk+VUmOv4f1NiMQH8
         R92HjUX63zoVuDUe57vPEns/rrtPnkciug0NEUXc+fafd9l5+qJHNFNWOB3XOV0L7XpK
         wMcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LnqTzBSwj0FtcTfCOTwcJJK/J8RhOOtYtbhgnUha3WLh8ATCj
	/9qqr9h5RDbtbEBMJmRxRm0=
X-Google-Smtp-Source: ABdhPJxgGrG1HQVTFZWb1HMcve4qhD/D360DwwSGmWuRgMaqP2aXUhZO0HYLTcnWrczwHMoaAaLghA==
X-Received: by 2002:a2e:8909:: with SMTP id d9mr12170285lji.399.1607459489669;
        Tue, 08 Dec 2020 12:31:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3614:: with SMTP id d20ls1583512lja.6.gmail; Tue, 08 Dec
 2020 12:31:28 -0800 (PST)
X-Received: by 2002:a05:651c:10d4:: with SMTP id l20mr10944438ljn.389.1607459488097;
        Tue, 08 Dec 2020 12:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607459488; cv=none;
        d=google.com; s=arc-20160816;
        b=AOifck+mKgzJdprqWph3d0RM2fsJWQT8ksT/Auts1npQHjYWHckSw+gU2EdzKzeaOO
         0bHlHz7yupRAtumKG4L/wx1isnwQnMiQXy3+D4IV/Raju7XvOoOmtrHwIhwKv8FzztSH
         nu8HXpPLLH40uQS+81UYDMgUjrGoRR855RnPLydYAe7/fqUjLYB8me/bPq75HrX/wdsU
         6z7KNV+c6v4ZeounHwkpY4PJzgHC/v+fNbDxG4BPuDYuP0dyItrodKRGDms8VqjLBf70
         ziR5uvHeCm/rDdG2wvbZ4h3kKqawsVd7XfiivEoFuhXd8VXGR+SHCZYaNAgFXSUn1oma
         dUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ObyioZoPwFBb+75x3B1rVIPjiWOBJ6j3brIKBwrlb2s=;
        b=W9DB5yy7UgD8jmThlqWqd19XljrtpeWOizWg3nvA1NEL0dhgVb4XFbFC1lfAgEte0F
         Y8SFAo2+cC/sZ8hgE0B9EUMDbk4t4H6dJGqphF0M51JzqDVU4kgJREU7eh35RfD0iXvM
         HbJovFm02mM1A2gNQqvvgksp/Ff0sLaKqC+M/Slc7NvIeWO4G7Cr99D3Rsl+eZYAXPyI
         YaoETE/EaS+uAabWcvo5Empd2nS6Ws6Uoq9+IRJqiJn9tiZ9ztoJf1VJbOMQUEzc3efx
         H8R0wsGh4FHnJJy/nAMWUxMGBt6PdPiS2D0Uun6lQvUaiJI9GtxpQO0VI4mzaIxTvvbr
         XHsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e18si429516lfn.6.2020.12.08.12.31.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 12:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B8KVQeH012328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Dec 2020 21:31:26 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B8KVPeK014096;
	Tue, 8 Dec 2020 21:31:26 +0100
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
 <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
 <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
 <b6206c2f-ea42-a3ec-d95c-5e84931ece21@siemens.com>
 <313f42e9-5551-4f77-afc1-498f355d3e95n@googlegroups.com>
 <0031a2f2-07ed-453e-924a-8b9756af8ff9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cd91d157-bdcb-13e2-c3bd-a67912389b79@siemens.com>
Date: Tue, 8 Dec 2020 21:31:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0031a2f2-07ed-453e-924a-8b9756af8ff9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 08.12.20 16:26, Chung-Fan Yang wrote:
> I made some progress.
>=20
> I successful applied the device tree overlay and BL31 firmware.
> Now, the hypervisor did see the reserved memory and starts loading with
> a mainline 5.9 PREEMPT_RT patched kernel.
> (I did add the extra EXPORT_SYMBOLS for this to work.)
> Not yet tested with any additional cell.
>=20
> Thank you guys for the hints on the device tree fix.
>=20
> I also tried the jailhouse-image repository, that works fine too.
>=20
> I would like to ask an additional question:
>=20
> Why is it necessary to load a custom BL31 firmware instead of the in
> EEPROM one?
> Is it for the PSCI CPU on/offlining?
>=20

Yes, exactly: We need PSCI for offlining and onlining CPUs under Linux
during cell creation and destruction. See also [1]. The proprietary
loader (the one that comes after the ROM loader) does not include that.

It's good to hear that upstream works on the RPi4 now! Will allow to
drop [2] when moving [3] to 5.10.

Jan

[1]
https://github.com/ARM-software/arm-trusted-firmware/commit/9e78cb189a1f26b=
e765662a27ed5caf81793cfd1
[2] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4-rpi
[2] https://github.com/siemens/linux/commits/jailhouse-enabling/5.4

>=20
> ---
> Yang
>=20
> 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 16:17:44 UT=
C+9 Chung-Fan Yang:
>=20
>=20
>=20
>     2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 15:14:5=
0 UTC+9 j.kiszka...@gmail.com:
>=20
>         On 07.12.20 02:29, Chung-Fan Yang wrote:
>         > Thanks you for the suggestion of using an approved image.
>         > I will try it out.
>         >
>         > However, I really like to know the root cause and get the
>         current Debian
>         > setup working.
>=20
>         [1] officially supports the RPi4 on buster (despite the pain that
>         brings, hope 5.10 improves the situation at bit). You should
>         derive from
>         that, specifically the DT overlay-based memory reservation which
>         was
>         fixed not so long ago.
>=20
>=20
>     Thank you.
>     I see the commit now.
>     So basically I have to include an additional dtbo the the boot
>     process, am I right?
>     Will it work only on the device-tree from rpi-firmware or also the
>     in kernel-tree one?
>     I am currently using the in-tree device tree from=C2=A0 kernel 5.9
>     without any overlay.
>=20
>     By the way, by pain, what do you mean?
>=20
>     ---
>     Yang
>     =C2=A0
>=20
>=20
>         For the kernel, I didn't do a rebase of your patch series yet.
>         [2] is
>         the latest upstream based queue.
>=20
>         Jan
>=20
>         [1] https://github.com/siemens/jailhouse-images
>         <https://github.com/siemens/jailhouse-images>
>         [2]
>         http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/=
queues/jailhouse
>         <http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads=
/queues/jailhouse>
>=20
>=20
>         >
>         > Yang
>         >
>         >
>         > 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5=
:01:26 UTC+9 jsmo...@linuxfoundation.org:
>         >
>         > Check our GSoC project on Automotive Grade Linux:
>         >
>         https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-=
jailhouse
>         <https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl=
-jailhouse>
>=20
>         >
>         <https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl=
-jailhouse
>         <https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl=
-jailhouse>>
>=20
>         >
>         > It can build for PI.
>         >
>         > An it can serve as inspiration for the values needed.
>         >
>         > =C2=A0
>         >
>         >
>         > js
>         >
>         > Chung-Fan Yang <sonic...@gmail.com> schrieb am So., 6. Dez.
>         2020, 17:34:
>         >
>         > Hi,
>         >
>         > I am working to get jailhouse work with my R-Pi4.
>         >
>         > I have been using a 64bit Debian buster rootfs with
>         > a custom compiled 5.9 preempt-rt kernel.
>         >
>         > I have successful reserved >736M for jailhouse and inserted the
>         > jailhouse.ko, but when I do jailhouse enable I got the followin=
g
>         > error on uart.
>         >
>         > Any suggestions are appreciated.
>         >
>         > Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU =
1
>         > Code location: 0x0000ffffc0200800
>         > Page pool usage after early setup: mem 39/994, remap 0/131072
>         > Initializing processors:
>         > =C2=A0CPU 1...
>         > FATAL: Unhandled HYP exception: synchronous abort from EL2
>         > =C2=A0pc: 0000ffffc0203864=C2=A0=C2=A0 lr: 0000ffffc0203850 sps=
r:
>         200003c9=C2=A0=C2=A0=C2=A0=C2=A0 EL2
>         > =C2=A0sp: 0000ffffc0222e40=C2=A0 elr: 0000ffffc0203864=C2=A0 es=
r: 00 1 0000000
>         > =C2=A0x0: 0000000084000000=C2=A0=C2=A0 x1: 0000000000000000=C2=
=A0=C2=A0 x2:
>         0000000080003580
>         > =C2=A0x3: 0000000000000014=C2=A0=C2=A0 x4: 0000000000000002=C2=
=A0=C2=A0 x5:
>         0000000000000001
>         > =C2=A0x6: 0000000000000029=C2=A0=C2=A0 x7: 0000ffffc0219ec0=C2=
=A0=C2=A0 x8:
>         000000000000002a
>         > =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=A0 x1=
1:
>         0000000000000001
>         > x12: 0000000000000015=C2=A0 x13: 0000000000000001=C2=A0 x14:
>         0000ffffc0219000
>         > x15: 0000ffffc0015040=C2=A0 x16: 0000ffffc020da50=C2=A0 x17:
>         ffffaf45951e7518
>         > x18: 0000000000000001=C2=A0 x19: 0000ffffc0222000=C2=A0 x20:
>         0000ffffc0219000
>         > x21: 0000ffffc0200000=C2=A0 x22: 0000ffffc0219000=C2=A0 x23:
>         0000000000000001
>         > x24: 0000000000000001=C2=A0 x25: 0000ffffc0222000=C2=A0 x26:
>         0000ffffc0223000
>         > x27: 0000ffffc020f000=C2=A0 x28: 0000ffffc0218000=C2=A0 x29:
>         0000ffffc0222e40
>         >
>         > Hypervisor stack before exception Stopping CPU 1 (Cell:
>         > "Raspberry-Pi4")
>         >
>         > PS. I did noticed there is a similar post, but it has no
>         solution.
>         >
>         > --
>         > You received this message because you are subscribed to the
>         > Google Groups "Jailhouse" group.
>         > To unsubscribe from this group and stop receiving emails from
>         > it, send an email to jailhouse-de...@googlegroups.com.
>         > To view this discussion on the web visit
>         >
>         https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428=
e-a97c-91524477c7e1n%40googlegroups.com
>         <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%40googlegroups.com>
>=20
>         >
>         <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfo=
oter
>         <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfo=
oter>>.
>=20
>         >
>         > --
>         > You received this message because you are subscribed to the
>         Google
>         > Groups "Jailhouse" group.
>         > To unsubscribe from this group and stop receiving emails from
>         it, send
>         > an email to jailhouse-de...@googlegroups.com
>         > <mailto:jailhouse-de...@googlegroups.com>.
>         > To view this discussion on the web visit
>         >
>         https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-432=
9-bb95-bddead90c9f7n%40googlegroups.com
>         <https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-43=
29-bb95-bddead90c9f7n%40googlegroups.com>
>=20
>         >
>         <https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-43=
29-bb95-bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfo=
oter
>         <https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-43=
29-bb95-bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfo=
oter>>.
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0031a2f2-07ed-453e-924a-8=
b9756af8ff9n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/0031a2f2-07ed-453e-924a-=
8b9756af8ff9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.


--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cd91d157-bdcb-13e2-c3bd-a67912389b79%40siemens.com.
