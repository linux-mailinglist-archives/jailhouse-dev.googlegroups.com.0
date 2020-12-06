Return-Path: <jailhouse-dev+bncBC2PLTFIYAJBBFXRWT7AKGQE73YKKQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D102D0705
	for <lists+jailhouse-dev@lfdr.de>; Sun,  6 Dec 2020 21:01:30 +0100 (CET)
Received: by mail-pf1-x438.google.com with SMTP id q13sf4366419pfn.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 12:01:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607284886; cv=pass;
        d=google.com; s=arc-20160816;
        b=O3MuUT4elMtMMmwaXLOcQ4OVjL51xFIao/6BdZfvRx6Q4w80Du1LPx+jXRR2Qejj5/
         Ftxu3embN/r8r65gZf4H9s7qhkWw3ktoVP58r1IfpPU6GkOeXFNMeHmGqbH/gW/wy5v1
         iSzQGyBpyqqbVO9/5iJ6cboucaamseLIU747+uFfjlaHCyFkyWoGCwdQP+KIKwvAQGQm
         1Uaj6c8lm6FdAXzXQxrVPcYKxXste1fSninqQkDzLSqm8Chzms2TIf2IJxokh2BDtp64
         LCpzljQC3AbcpP/di6EDd8rylY6KOgte9DwDGnaPfJUQzgkbMzIc9sJ1G5tFpTCqXKGT
         5Igg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=fFfpR3B5ev0VFieX1qWuBCjbgKD/zLdLwhXPP1EvFfM=;
        b=VVPkemUxYo44JkXqzcCJ4P1CpIrI3MKsiCmMsYfHlGHMbm+cF9t6tNS2rLPkIzc/63
         8uf0YSX87vjLOLsKcZ2VBOTnKdZpbvEp2WH3YWNXR+jCesMDUg871eqmK11PXKcbTEGU
         pxp9nwPQj1AAI6OxdkX40EBiqgGULJcHAaJmhyzV+MnEMWH+k+YpUBss78UxBMkUuzgJ
         tXyY8+c0MlXLC5hQ8NZy85qFE2dzYPQHXn4AHV1wrUEgyzK+Nusza9WnZ7V2zRF3nUC0
         9eWuxUsIVx87YFSZUwUv12C7JHzKquHHllG+ukpdl/FDjqg5zzPrM3eq9b5Mge2IuhLv
         pMKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gyhp1a9M;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::92d as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fFfpR3B5ev0VFieX1qWuBCjbgKD/zLdLwhXPP1EvFfM=;
        b=R48X6SjYmfcOzAKx3sggsYcqL4qG+YNArNZYSDVxQsJ7W3tVbwchnUZSwbeNBj9+fS
         oIaKOBW8UAc0BXuRzB1tgy2pK2vrWTLz2G8E0hBBLrqGd9cDWCZw5OwP3WZfDf5D6isE
         IMr9+ddMile7MVr8wbs4bfEapW75jt8ChcFbMeNA5iOmBPQzX2PZf7HXfbgctV1bpSMs
         zkUBYXm76ZcJAVV0KmqtTWZElUTt32R6v331WErxVR2PWEuChB2V9su4bX3pEg5Vdk4/
         Z87B1ZXOVyV43Wpfee9+q/RkoAmfhdqz8XuAfwI2aoiwSEIsXc7/sR/7FCToCz4oPAl5
         Jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fFfpR3B5ev0VFieX1qWuBCjbgKD/zLdLwhXPP1EvFfM=;
        b=Ny1Qp6SROHHGu1XOB3ZPFp3RLj57tAIwxDf9DUYvTb/U9dRPbfF+1OPoMu5PTkwDav
         A+1hI9Mjs+m3rCA4m/8m8hLcs9L8OIzO+tazCBntnQrb0HffDxlMnggDfD/DHLXc7VCv
         y1KWchxYDiYhejxA+LtlgFM9Bx5ZVlh74Rl/QYCxzGPZhkZ2RD6zdmh5LzLFF0K9oXiJ
         XuZ9rIVBuzFcnZfBXltJ/glEtLsnoQTHd6teINqoWI4ViiKPCzjWkaZeyrlKPRSrFmg/
         Orp5ltEdPPvJAvYEM7pog6M0jBgbSe0iiNyZ3mgMZejbFMKPc8WRl9KIcPI/EV9tFv5i
         n9ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RiQGZM3LFnf6bbXcRRZfHnPQbeLLLGoopu49qUoXcR/8V6TUc
	at5ohzQatOgQ1oEyWZW1wS4=
X-Google-Smtp-Source: ABdhPJyirxy19zczaf8hDmpxwA5iHhiimPOLiHl/K3VwfxJXk62c1Ln3kv2EOOfUSMMGct2g3UGbJA==
X-Received: by 2002:a17:90a:4d01:: with SMTP id c1mr9870538pjg.158.1607284886464;
        Sun, 06 Dec 2020 12:01:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7f8e:: with SMTP id a136ls714798pfd.7.gmail; Sun, 06 Dec
 2020 12:01:25 -0800 (PST)
X-Received: by 2002:a62:2702:0:b029:19e:d8a:ff94 with SMTP id n2-20020a6227020000b029019e0d8aff94mr1806170pfn.7.1607284885599;
        Sun, 06 Dec 2020 12:01:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607284885; cv=none;
        d=google.com; s=arc-20160816;
        b=c5vd97I0R9P/Nl0D0jH/zuHXVVKrBMBVttbX6CxBcSErJeUlBAusZrVmRnB5HasMiO
         mfOIEYf2T/i/WyrIqiU6eLKIE6TIFUNYCI3sQV8PRI5RvQF2Tmc3XRCg4z1HucEc9N4R
         kQw/pzlRyEdOW2KNQizawiY/DpMA4rocpQSTXqkptkOGW25Gg67C9FUdGUja3ykK6pF9
         nMzzSL57MPII7NC0E7xzFRj/27K3wKImpmOP3g9ipi3CMhDINbw3GorDEhnl2awn/off
         u9gHm19VvN5Fw6KaT+hTxlA9QlAw6yF3mvE9Hmeeybv+d0qjlcTj99fBMrzRBjnIZ1/s
         YfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gTDFmP/RLjAgGXq25uR2ShB+7HelUQou1cg8SM5pIjo=;
        b=ATPEaJPubWU2XMK0LQ57P6Bho7zwCiruy+ZFatSiyS9IUeIrVhK53VeoNwjyqXXr8f
         kUkZ8OCmFxecIshF1PyIhfRx3fsSyt6KeOs5mC/HendVOlqbXi4jHhPyRTKsjxps/oVq
         S6zuWE0KNyqTquMuhOiGH7vwvb07o9oxufrpNUgfHN7OMrrfG6nDkf/b6iGno62DScB4
         10Pv6oA1zfvqny7laQqAaD8XBVefCsGy5kmyLp3X/FJhSUfJ9mEoWCL+0o9oE1ex45n1
         cXFBPQKLdsLGq7GGyjwoRFmVpPiMdAeqzc4lZ4Yrs1uNjZ9kEiRy05NfuRYvMPiOxZdR
         y78g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gyhp1a9M;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::92d as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com. [2607:f8b0:4864:20::92d])
        by gmr-mx.google.com with ESMTPS id q18si747842pgv.5.2020.12.06.12.01.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 12:01:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::92d as permitted sender) client-ip=2607:f8b0:4864:20::92d;
Received: by mail-ua1-x92d.google.com with SMTP id y26so3791560uan.5
        for <jailhouse-dev@googlegroups.com>; Sun, 06 Dec 2020 12:01:25 -0800 (PST)
X-Received: by 2002:a9f:2213:: with SMTP id 19mr3862102uad.15.1607284884728;
 Sun, 06 Dec 2020 12:01:24 -0800 (PST)
MIME-Version: 1.0
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
In-Reply-To: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Date: Sun, 6 Dec 2020 21:01:13 +0100
Message-ID: <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000009b82e305b5d12c4c"
X-Original-Sender: jsmoeller@linuxfoundation.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linuxfoundation.org header.s=google header.b=gyhp1a9M;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org
 designates 2607:f8b0:4864:20::92d as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
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

--0000000000009b82e305b5d12c4c
Content-Type: text/plain; charset="UTF-8"

Check our GSoC project on Automotive Grade Linux:
https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse

It can build for PI.

An it can serve as inspiration for the values needed.


js

Chung-Fan Yang <sonic.tw.tp@gmail.com> schrieb am So., 6. Dez. 2020, 17:34:

> Hi,
>
> I am working to get jailhouse work with my R-Pi4.
>
> I have been using a 64bit Debian buster rootfs with
> a custom compiled 5.9 preempt-rt kernel.
>
> I have successful reserved >736M for jailhouse and inserted the
> jailhouse.ko, but when I do jailhouse enable I got the following error on
> uart.
>
> Any suggestions are appreciated.
>
> Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1
> Code location: 0x0000ffffc0200800
> Page pool usage after early setup: mem 39/994, remap 0/131072
> Initializing processors:
>  CPU 1...
> FATAL: Unhandled HYP exception: synchronous abort from EL2
>  pc: 0000ffffc0203864   lr: 0000ffffc0203850 spsr: 200003c9     EL2
>  sp: 0000ffffc0222e40  elr: 0000ffffc0203864  esr: 00 1 0000000
>  x0: 0000000084000000   x1: 0000000000000000   x2: 0000000080003580
>  x3: 0000000000000014   x4: 0000000000000002   x5: 0000000000000001
>  x6: 0000000000000029   x7: 0000ffffc0219ec0   x8: 000000000000002a
>  x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001
> x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000
> x15: 0000ffffc0015040  x16: 0000ffffc020da50  x17: ffffaf45951e7518
> x18: 0000000000000001  x19: 0000ffffc0222000  x20: 0000ffffc0219000
> x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000001
> x24: 0000000000000001  x25: 0000ffffc0222000  x26: 0000ffffc0223000
> x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc0222e40
>
> Hypervisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")
>
> PS. I did noticed there is a similar post, but it has no solution.
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=email&utm_source=footer>
> .
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy%2B94JTW2dgyA%40mail.gmail.com.

--0000000000009b82e305b5d12c4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Check our GSoC project on Automotive Grade Linux:<div dir=
=3D"auto"><a href=3D"https://git.automotivelinux.org/AGL/meta-agl-devel/tre=
e/meta-agl-jailhouse">https://git.automotivelinux.org/AGL/meta-agl-devel/tr=
ee/meta-agl-jailhouse</a><br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">It can build for PI.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">An it can serve as inspiration for the values needed.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">js</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Chung-=
Fan Yang &lt;<a href=3D"mailto:sonic.tw.tp@gmail.com">sonic.tw.tp@gmail.com=
</a>&gt; schrieb am So., 6. Dez. 2020, 17:34:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div>Hi,</div><div><br></div><div>I am working to get jailhouse =
work with my R-Pi4.</div><div><br></div><div>I have been using a 64bit Debi=
an buster rootfs with <br></div><div>a custom compiled 5.9 preempt-rt kerne=
l.</div><div><br></div><div>I have successful reserved &gt;736M for jailhou=
se and inserted the jailhouse.ko, but when I do jailhouse enable I got the =
following error on uart.</div><div><br></div>Any suggestions are appreciate=
d.<br><div><br></div><div>Initializing Jailhouse hypervisor v0.12 (223-g097=
bed0f) on CPU 1<br>Code location: 0x0000ffffc0200800<br>Page pool usage aft=
er early setup: mem 39/994, remap 0/131072<br>Initializing processors:<br>=
=C2=A0CPU 1... <br>FATAL: Unhandled HYP exception: synchronous abort from E=
L2<br>=C2=A0pc: 0000ffffc0203864=C2=A0=C2=A0 lr: 0000ffffc0203850 spsr: 200=
003c9=C2=A0=C2=A0=C2=A0=C2=A0 EL2<br>=C2=A0sp: 0000ffffc0222e40=C2=A0 elr: =
0000ffffc0203864=C2=A0 esr: 00 1 0000000<br>=C2=A0x0: 0000000084000000=C2=
=A0=C2=A0 x1: 0000000000000000=C2=A0=C2=A0 x2: 0000000080003580<br>=C2=A0x3=
: 0000000000000014=C2=A0=C2=A0 x4: 0000000000000002=C2=A0=C2=A0 x5: 0000000=
000000001<br>=C2=A0x6: 0000000000000029=C2=A0=C2=A0 x7: 0000ffffc0219ec0=C2=
=A0=C2=A0 x8: 000000000000002a<br>=C2=A0x9: 0000000000000000=C2=A0 x10: 000=
0000000000000=C2=A0 x11: 0000000000000001<br>x12: 0000000000000015=C2=A0 x1=
3: 0000000000000001=C2=A0 x14: 0000ffffc0219000<br>x15: 0000ffffc0015040=C2=
=A0 x16: 0000ffffc020da50=C2=A0 x17: ffffaf45951e7518<br>x18: 0000000000000=
001=C2=A0 x19: 0000ffffc0222000=C2=A0 x20: 0000ffffc0219000<br>x21: 0000fff=
fc0200000=C2=A0 x22: 0000ffffc0219000=C2=A0 x23: 0000000000000001<br>x24: 0=
000000000000001=C2=A0 x25: 0000ffffc0222000=C2=A0 x26: 0000ffffc0223000<br>=
x27: 0000ffffc020f000=C2=A0 x28: 0000ffffc0218000=C2=A0 x29: 0000ffffc0222e=
40<br><br>Hypervisor stack before exception Stopping CPU 1 (Cell: &quot;Ras=
pberry-Pi4&quot;)</div><div><br></div><div>PS. I did noticed there is a sim=
ilar post, but it has no solution.<br></div><div><br></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@googlegroups.com<=
/a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"noreferrer">https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-=
428e-a97c-91524477c7e1n%40googlegroups.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy%2B94JTW2d=
gyA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy%=
2B94JTW2dgyA%40mail.gmail.com</a>.<br />

--0000000000009b82e305b5d12c4c--
