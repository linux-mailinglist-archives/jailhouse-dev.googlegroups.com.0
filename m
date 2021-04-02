Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBHPNTKBQMGQEO6WHZSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5137335267F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Apr 2021 08:15:58 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id o70sf5231990qke.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Apr 2021 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4GpYCqBGqsYD/l4L5779T1bg697Y204XHz1lfHVn3+o=;
        b=LrjaYTTft5HM/NexuhKdp5nL3YVBdcc5cmRNJNfpLa318R4SUPLcc71Ngy6KG1u5xE
         k2vZGLzaeUZxO+VbW4hHoIxoo7CIItk5A28Mp0EfPmMG5P/yDPvwsT1jnrW+qXEgDrTR
         aPBUXiCv/JjwEQh213eSnnqCkliavL+HBbMJ6Nt94K7BpChU1F0sxYdXtX/jifs8qfB4
         BKHzMXHbCyR+2WwU4b8YWzx3CgbemzB48LKiO918X+2YzKVZmTvxwYOfEw2Vsx/e65Qj
         fvMVXJM3ekchHEEZVBNrS/h4jYoJh3Vk8k6fIMa87xaHxR4zmyrxAOFCAmeMEOLajyTa
         x21Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4GpYCqBGqsYD/l4L5779T1bg697Y204XHz1lfHVn3+o=;
        b=NU8TJ5bLxzEFuya5Kyq5jdHePJZRbMzYORHHeq0u/XK9HGh8pPT0CDBdgnFp9Aa+7+
         3OpzOWqk6PzXtWWGLBiEUAfzISNTE11Kp/j2An9rs1UBL8bIcvFWsSFGNHn38+oDerCW
         TxXybwp8dPlDSueVCGfZvByMiZEbdfwW3B2WxWZILHByROKQcYhOXlKI4W4yiNKn157t
         ZYTj6uGuA+gub3yZ4pEAPMkCnH4uYHAYSy5gzp2u4n6fzSuv9OdKpyzQkSH8nQrLfgNi
         xrk7OApIQMlvfFcNZLvXQq1ocJjlXqwas1sWsbAWwOPk83BLRww8ORhML4sn9Z2lcedN
         qD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4GpYCqBGqsYD/l4L5779T1bg697Y204XHz1lfHVn3+o=;
        b=njG0KvVpEsR+q3R7EfXLnliU2+hNAwyemZdDkDtBCfJ44sTT4DE88X8yzpT8VCNB2e
         TnKyc+eAxZctgeZ7XBHmmbZYfTo80yOhQbJ4BjDhxAinoKd1rkqbMkR//FvDn+fOZPRe
         M5t5+obE7FTvbM4zxMHlpBaKXxhfiEDc1BkkWAJaeV2pdSAJDTuzVNwHoPuJ6FpLckH5
         3+kEqXELz7lp9hS/9vrrj3B/IO1mmIE0I7FkuusRXfL+Gw9eu4sVYPiQgzltRwyaY/T3
         SxykZEtuvavF+tm0CyY7a5Nx2OrsYvy4vVZwLf3mkDGrRaghwCFmQV6gz4ACPAHsqBPk
         +uQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hjI9Lf7nI9dzKcQ/q1uBzu53mTa6vuNQGnfXWMzgGzQ0nn9uF
	jxmU3a1UldvtKglOrniG3p4=
X-Google-Smtp-Source: ABdhPJwDbtBK67Yq1c/QtNtjPb7hhW3KY7pCvMazitVJhWvRpf1e4AayAIpVHLPxpYmd4QYm8UqIrQ==
X-Received: by 2002:ae9:f706:: with SMTP id s6mr12208820qkg.163.1617344157325;
        Thu, 01 Apr 2021 23:15:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:5189:: with SMTP id b9ls2172769qvp.7.gmail; Thu, 01 Apr
 2021 23:15:56 -0700 (PDT)
X-Received: by 2002:ad4:5629:: with SMTP id cb9mr11601696qvb.62.1617344156644;
        Thu, 01 Apr 2021 23:15:56 -0700 (PDT)
Date: Thu, 1 Apr 2021 23:15:56 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b1ae52ed-bea8-4be2-9fd4-766506db6133n@googlegroups.com>
In-Reply-To: <321eddc.40ef8.1788d817ec9.Coremail.caohp19@lzu.edu.cn>
References: <321eddc.40ef8.1788d817ec9.Coremail.caohp19@lzu.edu.cn>
Subject: Re: HELP
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8430_1435532207.1617344156159"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_8430_1435532207.1617344156159
Content-Type: multipart/alternative; 
	boundary="----=_Part_8431_1285237943.1617344156159"

------=_Part_8431_1285237943.1617344156159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have asked a  question about document.=20
https://groups.google.com/g/jailhouse-dev/c/cP_CdvN2uw0

The .pdf is the best doc.
Jailhouse is a "jailhouse" for everyone who want to know more about it.
=E5=9C=A82021=E5=B9=B44=E6=9C=881=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8=
 =E4=B8=8B=E5=8D=888:56:48<=E6=9B=B9=E5=AE=8F=E9=B9=8F> =E5=86=99=E9=81=93=
=EF=BC=9A

> Dear sir,
>
> I wanted to know how to write my own config files about non-root cell. By=
=20
> the way, I tried to alter the=20
> rpi4-linux-demo.c and compiled it. Of course, it was successful in that=
=20
> way.=20
>
> 1. But I don't understand why there are several memory regions definition=
s.
> 2. How to know the memory addresses.
> 3. How many memory regions should be defined.=20
>
> Whether should I reference the Raspberry Pi 4 model B's manual to resolve=
=20
> three questions.
> Here is the part of rpi4-linux-demo.c about memory definitions.(I didn't=
=20
> why there are 5 memory regions, 2 RAM definitions).
>
> .mem_regions =3D {
> /* IVSHMEM shared memory regions (demo) */
> {
> .phys_start =3D 0x3faf0000,
> .virt_start =3D 0x3faf0000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x3faf1000,
> .virt_start =3D 0x3faf1000,
> .size =3D 0x9000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x3fafa000,
> .virt_start =3D 0x3fafa000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x3fafc000,
> .virt_start =3D 0x3fafc000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x3fafe000,
> .virt_start =3D 0x3fafe000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> /* IVSHMEM shared memory region */
> JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
> /* UART */ {
> .phys_start =3D 0xfe215040,
> .virt_start =3D 0xfe215040,
> .size =3D 0x40,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
> JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> },
> /* RAM */ {
> .phys_start =3D 0x3f900000,
> .virt_start =3D 0,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> },
> /* RAM */ {
> .phys_start =3D 0x30000000,
> .virt_start =3D 0x30000000,
> .size =3D 0x8000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> JAILHOUSE_MEM_LOADABLE,
> },
> /* communication region */ {
> .virt_start =3D 0x80000000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_COMM_REGION,
> },
> }
>
> By the way, what information should I obtained so that I can write my own=
=20
> cell config.
> If I can get your generous help, I will appreciate.
> Thank you again !
>
> Yours sincerely,
> Hongpeng Cao.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b1ae52ed-bea8-4be2-9fd4-766506db6133n%40googlegroups.com.

------=_Part_8431_1285237943.1617344156159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I have asked a&nbsp; question about document.&nbsp;</div>https://group=
s.google.com/g/jailhouse-dev/c/cP_CdvN2uw0<br><br><div>The .pdf is the best=
 doc.</div><div>Jailhouse is a "jailhouse" for everyone who want to know mo=
re about it.<br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D=
"gmail_attr">=E5=9C=A82021=E5=B9=B44=E6=9C=881=E6=97=A5=E6=98=9F=E6=9C=9F=
=E5=9B=9B UTC+8 =E4=B8=8B=E5=8D=888:56:48&lt;=E6=9B=B9=E5=AE=8F=E9=B9=8F> =
=E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddi=
ng-left: 1ex;">Dear sir,<p>I wanted to know how to write my own config file=
s about non-root cell. By the way, I tried to alter the <br>rpi4-linux-demo=
.c and compiled it. Of course, it was successful in that way. <p>1. But I d=
on&#39;t understand why there are several memory regions definitions.<br>2.=
 How to know the memory addresses.<br>3. How many memory regions should be =
defined. <p>Whether should I reference the Raspberry Pi 4 model B&#39;s man=
ual to resolve three questions.<br>Here is the part of rpi4-linux-demo.c ab=
out memory definitions.(I didn&#39;t why there are 5 memory regions, 2 RAM =
definitions).<br> <br>.mem_regions =3D {<br> /* IVSHMEM shared memory regio=
ns (demo) */<br> {<br> .phys_start =3D 0x3faf0000,<br> .virt_start =3D 0x3f=
af0000,<br> .size =3D 0x1000,<br> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_ROOTSHARED,<br> },<br> {<br> .phys_start =3D 0x3faf1000,<br> .virt_sta=
rt =3D 0x3faf1000,<br> .size =3D 0x9000,<br> .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br> JAILHOUSE_MEM_ROOTSHARED,<br> },<br> {<br> .phy=
s_start =3D 0x3fafa000,<br> .virt_start =3D 0x3fafa000,<br> .size =3D 0x200=
0,<br> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,<br> },<br>=
 {<br> .phys_start =3D 0x3fafc000,<br> .virt_start =3D 0x3fafc000,<br> .siz=
e =3D 0x2000,<br> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,=
<br> },<br> {<br> .phys_start =3D 0x3fafe000,<br> .virt_start =3D 0x3fafe00=
0,<br> .size =3D 0x2000,<br> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE |<br> JAILHOUSE_MEM_ROOTSHARED,<br> },<br> /* IVSHMEM shared memory r=
egion */<br> JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),<br> /* UART */ {<b=
r> .phys_start =3D 0xfe215040,<br> .virt_start =3D 0xfe215040,<br> .size =
=3D 0x40,<br> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br> JAI=
LHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |<br> JAILHOUSE_MEM_IO_32 | JAILHOUSE_ME=
M_ROOTSHARED,<br> },<br> /* RAM */ {<br> .phys_start =3D 0x3f900000,<br> .v=
irt_start =3D 0,<br> .size =3D 0x10000,<br> .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |<br> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<=
br> },<br> /* RAM */ {<br> .phys_start =3D 0x30000000,<br> .virt_start =3D =
0x30000000,<br> .size =3D 0x8000000,<br> .flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE |<br> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<br> JAI=
LHOUSE_MEM_LOADABLE,<br> },<br> /* communication region */ {<br> .virt_star=
t =3D 0x80000000,<br> .size =3D 0x00001000,<br> .flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br> JAILHOUSE_MEM_COMM_REGION,<br> },<br> }<p>By=
 the way, what information should I obtained so that I can  write my own ce=
ll config.<br>If I can get your generous help, I will appreciate.<br>Thank =
you again !<p>Yours sincerely,<br>Hongpeng Cao.</p></p></p></p></p></blockq=
uote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b1ae52ed-bea8-4be2-9fd4-766506db6133n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b1ae52ed-bea8-4be2-9fd4-766506db6133n%40googlegroups.co=
m</a>.<br />

------=_Part_8431_1285237943.1617344156159--

------=_Part_8430_1435532207.1617344156159--
