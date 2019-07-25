Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY4R47UQKGQEBX4CNCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id A267B7527B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 17:21:07 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id i2sf24103203wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 08:21:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564068067; cv=pass;
        d=google.com; s=arc-20160816;
        b=MHrBKzEVuxXoqzclgfvVe7CQliwaCmurAYR3mkO6TfysrUifOrS8nGP5BVa0zXa/6U
         sva11Vg4rbMvZj7AnI/Xy0AyB83SuGyt67DOq1jjAcXrW8AJJisxktZzbRusfYdPgKAD
         nlWMN926OR0O7XOc6TvMJMv76oydDJn7NocEMOQEGqMQtfxQ/tfuCU73ITY5C+3icDn3
         xZG1nMTZNkA/lG/XmNfXiluhul9HQF2R8y9xHttVBs8PHWHpQxUnV6s30Ppmx2r3o6fm
         8LtdlYVFtsIr6zGrZ+o9r/SlcMTeoZ0XGZqt6qpKaVDMeUJrQDaGUULokA34iVsE3Pk5
         ebwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+W0Sf0d8g7497VIcy4RIwN7bLbGM90s7ZxEk7hVxrGU=;
        b=JdG7CIep/lxCKqN+tDPbFJXz8QcaHGjg1oliToVWP8mBJboBZ2kVCAnx0epRlXBoPT
         xWfDKD2onrpuuxPOjbpIu9Qi5tISX+Ny/bGZSOLybEViO+5E7fTCZMh3XBfkJ4vw+MOJ
         m+MTtWRZIEA3SZzM/qinfza3Qz+5ZXxUluyE4Rm5qHmoGmrIJT9GdUaqQ+ZHAamMZf4t
         45O2agZrqQHhS0szEUqvSygaUfg6WkF2tKrA8YbesFzKq+GOzTEpa1Xr82gJGogTZx1z
         QMocCy/QMSV81cfpWJU7yFIK5YfU4jEh1/dpdbRzz05hlRjVrt2uu6pGxDWQsZgBQkmo
         yp8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+W0Sf0d8g7497VIcy4RIwN7bLbGM90s7ZxEk7hVxrGU=;
        b=Hu8XmVlmhgKCaXGMstN3vDC9+uxmDCGJ0FNOvh8FZqXDIpVHlAb+O2gcTqMZDMJqKx
         bd0KqrvZKrvniYyGMX/M8l8NHi0Blwz4ZRIwDqSahVZEAai0E1cPHbCdk8u2U62iAvU/
         /s8m0Gek7gMMXxuc1go96qAIVfvWy8C3Kqn/Rn8egkZKTSWFoR3ZIoQnJgi8gqIpxcHo
         g6DdZf7CreXmR811nl7glSfE3WLF8F3eecVlM+gw4Xk6D1xyZRNfolQvuJc2IIa88uVj
         NSTOlBxHryfUGoP21osnow7Gh67tVeMyDmXSTraL4RmpgcZV1ANT8G6oldh9Lq5xI2di
         OSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+W0Sf0d8g7497VIcy4RIwN7bLbGM90s7ZxEk7hVxrGU=;
        b=Zkd2puHCB4Qius21rzW9uSImf2+Kfi5InjjYZlUSx47lcqnDLIv3tk9RI8XkqEMsW8
         tXERmuQ2fcRmkfqhz1+aoQajKxhFhD0IiSEjv0t7D0SFltI+P96Y+eWmmdLGP5PEVBQc
         5hRZBxjGKjZjIx1xM+YJ7dSdBjxmmWfk1XpxMDCAOfh/x1B+v4A+2Uw5Fup7343BN+Dy
         D7dV68MTaEJGK1Z9qJAnJWsrqylHJT5xqL6LBW+vFdjaNbKK3P0zQbn4bEtvSQHwzZnS
         oVrxIqPJHSHOvnXJxvsGqltz+66o65HNlNnMmCBLF2Z5VPPx93eV7slqYXaQysx85LwR
         ChiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnKuQN4ueYbUO8ubQ/jX5WiKVELMMyvWss6Cmw9vz8Hbw1oejE
	YZQZByKR8BnAPl9Juyu7bgY=
X-Google-Smtp-Source: APXvYqxREMacl3ZH4GXhLwxYTtqCCousPm9JCKVpDFxvHNDV/+NjX7RTbg1biKD85RXrlwYiKnCQqA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr83730018wml.175.1564068067324;
        Thu, 25 Jul 2019 08:21:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5411:: with SMTP id i17ls17836987wmb.2.canary-gmail;
 Thu, 25 Jul 2019 08:21:06 -0700 (PDT)
X-Received: by 2002:a1c:4054:: with SMTP id n81mr81860160wma.78.1564068066503;
        Thu, 25 Jul 2019 08:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564068066; cv=none;
        d=google.com; s=arc-20160816;
        b=BUmOGuiI4d8ASdAsghkCJ7KMdqNjVn1dhsrlGkWlhxNoBec7vofSczUhI8neKJvd+4
         odC+CQ/cksDIov4wQcEYnRkk8QX50euDpGb560Vb9T35snHPTxYmp0LCJwynvSMb6QdZ
         Abe+lVloyRAqGFFjiu7k+KuH+R9YWgTlOLPZ5sr4GktrLK8unUQW34jJsyyu+d92P1O/
         pRFniSfpSE8XNCyjqiGcNOpHZo275SnRIM4MeMJ3DfFwwGT1LAEMLZoMtgKtxpE0sNXp
         WDT2CR3B5XsjmVcjs0D5OEtdgkwmVb3MF2Sr9RVX98X1R764v1rifjkUoxz9zC5IiaB3
         pI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qEePV/f1Wl7+qbA63DkKlTcqfr17byeIZcAsN3akVdI=;
        b=g4yZljcNQLTbCW/sj5+gXv3iAEUqB5WGIhlyD5tQR5o5f4AOiFWP2bA3aZDkH3iDNf
         vCrUGDHfGg296WIwEKyF7xal/6fyYnhIoPxfWgDq4qv9QituCs2jcm4F54tsHqVz/1a4
         8yom0aYC5khFynfT2Y3bPRBak9OnD52E/6i9mLjAqsleKT+N2P/OuRqd5uMaQ/EwjaZ2
         eFGn0wilGn8AWysSj09eAGmf33wKtwWcsnQDdGs72PpSBz68pbEBB8VHEABMNwu8vRqy
         qa59AmBFcTSO6JBPX6G7LRhbslXyvs7hlmbUxHcK0Yyq3TPYfzKx4wIt1SC7emPmVLsj
         phcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o4si1802273wrp.4.2019.07.25.08.21.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 08:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6PFL48i007912
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 17:21:05 +0200
Received: from [139.23.76.89] ([139.23.76.89])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6PFL4Gf010060;
	Thu, 25 Jul 2019 17:21:04 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
Date: Thu, 25 Jul 2019 17:21:04 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 25.07.19 14:53, Jo=C3=A3o Reis wrote:
> Even when i set all RAM regions to non rootshared, the problem continues =
(send
> in attachment the newly adjusted config file). Is the linux image that i =
am
> using too big (1,2GB)? I've generated the image using the steps described
> on=C2=A0setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).
>=20

If I do the math right, you are even not close to that 1.2 GB when it comes=
 to
the RAM you assigned. It's maybe some 700 MB.

Jan

>=20
> quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kiszka escr=
eveu:
>=20
>     On 25.07.19 11:32, Jo=C3=A3o Reis wrote:
>     > Hello,
>     >
>     > I'm trying to apply cache coloring to Linux and Erika. As root cell=
 Linux
>     cannot
>     > be colored, i intend to use colored Linux in a non-root cell and co=
lored
>     Erika
>     > in another non-root cell (the system stays as: Linux in root cell, =
Linux and
>     > Erika in non-root cells).
>     >
>     > The problem that is occuring to me is when i issue the command: jai=
lhouse
>     cell
>     > linux ultra96-linux-demo.cell Image -i rootfs.cpio -c "console=3Dtt=
yS0, 115200"
>     >
>     > The error is the following:
>     >
>     > root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux
>     ultra96-linux-demo.cell
>     > Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c "console=3Dtt=
yS0, 115200"
>     > [=C2=A0 127.150370] python invoked oom-killer:
>     > gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK), nodemask=
=3D(null),=C2=A0
>     > order=3D0, oom_score_adj=3D0
>=20
>     Looks like your inmate configuration grants too little memory for the=
 Linux
>     guest. Note that the in-tree configs may only be happily used with ve=
ry small
>     Linux images, just as the buildroot we generate via jailhouse-images.
>=20
>     Looking at your config...
>=20
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RAM */ {
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x74000000,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x74000000,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x7ef0000,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
JAILHOUSE_MEM_LOADABLE,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>=20
>     This one is fine and will be available to the guest.
>=20
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RAM */{
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x3fd00000,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x3fd00000,
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x202f0000, //must be page size aligne=
d
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
JAILHOUSE_MEM_ROOTSHARED, //se tirar
>     JAILHOUSE_MEM_ROOTSHARED da exception
>     fault 0x20
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>=20
>     This one isn't because it shares RAM with the root cell that is proba=
bly not
>     intended to be shared. But it will also not be presented as RAM to th=
e non-root
>     cell (via the devices tree) because of the ROOTSHARED tag.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-=
ddb68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c1a63d36-2dd0-5b52-bb16-31794ab93b62%40siemens.com.
