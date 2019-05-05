Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJVNXLTAKGQER45QRBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC6213E52
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 09:54:15 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id x1sf8205994wrd.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 00:54:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557042855; cv=pass;
        d=google.com; s=arc-20160816;
        b=CMma7h55vwnl9t7j2sRTY7tdyeUsy75gWmUilqDfTQssuLzM2c538u5jAn7j5bsWlM
         JWP0YMpvvqy9WCkfYaIfcD215O9CRETQZcIZsnkvDtSnioTmlW5M6jAZoRlS8wvwIovA
         6x/V1U6n+PvrGxl3AqEqERl1NPA7Tj19/xY2LR8Hu+vbR5Ofpz5G8gHyPm7ZK16WQ9at
         6/5P+fbtQdmGAFLaajo9XTuqu/rsfPsupp/IMZSMoZKWjtu738zoFuQHTusB78lCF/f+
         cIhV18QqieuuC+FHRgyPHKlmWYxZvoR739ZeSeeHNG8tdeVpPC4V1XMlC58XwXmQ1YKm
         I5Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Kgi2bokPiHn0eWnQg047zcJbkttBVV4rQWS4mTwAGks=;
        b=iOi5E4qhPmEiCBEAFH2UiGQzw4/7kc95gxyM4yLqJZm9ksf/m5oBX1ohN8xG2PdKXV
         uacHtTIQs21iXEadV7yVAPYDsf85fXtCUdWeCbA+AQ2o0p+4/mfOYZbRcCrZ+FSPk/0H
         2CUN23zDhtn1Gbk2iIK1enpkNVLaGA8A6HbVYfVpe+NiI/Iq83dkv42Y+EQ+eiMGd0XI
         12YrVP0K6Xzm70C2/ubCP3MV4wwrT2phqL6g7b9vd5adn3Dhov55d1aLzRnx1JCA4Exw
         v2qFyQJ1RGAITaAkuMvtx1iPPGaGBN7y5v58vyylvHaABl9+5ouSMDKxhUG1qLRu+VP+
         wTKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=euYqyJXv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kgi2bokPiHn0eWnQg047zcJbkttBVV4rQWS4mTwAGks=;
        b=bilnU3ohoqywWNwDrZomaF0G8G7vxwUTXHxa9Q+AT3RmRkqwyt9I51d+Pvm9XB+r5G
         pfOuje0bYJW4ja3chTj4HLRhtMbAJZOQSCdXJvcqWC7IM0Zfb83jDzGG/yddLv67dX9n
         DPeSOlYWPj7DhpFvhv0BHGSBrAhW/MQaHGDPPQCcHSOT/u3r6WqDqDyNB4Kj4xMsfOXl
         XZNzX7Yk7gaMMl+A2F4DDjbBhx7UNoizpKhMFPkO1eOu9A7tzipK7bBazabOHXsBo4cs
         pwsiDmrUpOfebAt8HMD2qSxcpEFAGJK/DqE3Ge+NnoTV8BOaXR+h409tErQkNhSsIk51
         QwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kgi2bokPiHn0eWnQg047zcJbkttBVV4rQWS4mTwAGks=;
        b=ZD1Fh6UNI0LErRL0sndZ0TFwu4dZT/QEdU/Flymn/EsfNgGRga09MxMtxzelCZyxyM
         rt8rRebBvZ8oqCTpNXy7ERcfg5aabtTweO4+bVZa6W9/mS5R7imCwgustmbvwnpkybPx
         cp4IbsZBGKAiC61f+QKP2czl6PnzqCexF7zRKxlyv+KVvZF62qOoUuJWpWlmejhyShnK
         gPpt1Fl4Ec4F2nHuGwCYygBTOGOuZq2rIBmoNB1iV5zbT0YVo08CmioI6WG3Ayf/PtYS
         SqnkhgVtXkJh+DyuN2eVm8zX2w3NZzahvdUlCBCascbN4EiuZFQ0V1E+JXZ8akJu1RuU
         0IGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXWRUUVEMvho9TUpLulT/HvY0mNj1d33b+BFB0hr6ozx3JtJ+wL
	oB/r09d5nW7sgHEwoxMutTE=
X-Google-Smtp-Source: APXvYqybKYUm6hDLVMiklBZ32KvPw8sJdQAjEbVZR8dLBBqSvAtRUmMaUZNt2QXQWue6C+OqZk+LuQ==
X-Received: by 2002:adf:dc8c:: with SMTP id r12mr10075744wrj.139.1557042855410;
        Sun, 05 May 2019 00:54:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b406:: with SMTP id d6ls2857582wmf.2.canary-gmail; Sun,
 05 May 2019 00:54:14 -0700 (PDT)
X-Received: by 2002:a1c:d181:: with SMTP id i123mr12889915wmg.33.1557042854566;
        Sun, 05 May 2019 00:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557042854; cv=none;
        d=google.com; s=arc-20160816;
        b=Qnuf2DML+eU/0QuqTcYutf3pV3SLUtL6mHU2mu3nxzamuVlWYdphXv8XdTZV7cUNgj
         dNEsq2jFB0k+t5OO3HPePD+t2KQGOPlCQreJekRJYUxhqMzcdfzXpYIePJbIfb+xTPbT
         X2R34ZYKaXQvcQCrlHJvhAZUuHqo5GrX5IxqAPKgO4LG7PhI5KeLacfOSnvG/qLN99Mv
         Ept+zgx41RQScQLGCFTfoNEK9GTBbCSlW0+z+ZXCBrBDvcq3tesVdpk+OV3JubMgnF+K
         F+OOGz+YA+kVF1tWiDDyNb7H9aTvJ2MrAey8j9teiMAH7xmSovDyZh/h+6UQspnEZlWH
         gfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fCrYMwit3p+JWVRhRw2ng7PBuMEQDI3b5cVkTPTyVCo=;
        b=u+hThuYn5orjje5iIxl6Ior86mVo8oxdaLWs1T+hNgWhLKvU0RN1AVV4pEhau9TGiI
         Yc6U1zqfpqCKhz/6pSFBIFjaUKgGwYpVIz6OIym1LPP8Ibu6NAyHTDhG64Pr2jDmPmBg
         GRj8Fyo4a4AXxMNcB7AkiF+BWayoQ+gx8sey9jG/BW4Wk39T54Fn3vwOih9ALx96CZJa
         VCNZLXsD42oAfyX6Whu7Bzxuez9dtZs6aBijryk1yxs1ivKLJNcKf9ePaQzPXD62iBaM
         lcLxBSdHCL55dRiKoGSM9ltSkGSkPxLt+gKNXw760JPKv1nbhQ7AU7eTx2FGn+GPfQ5b
         YGfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=euYqyJXv;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id u2si365638wri.2.2019.05.05.00.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 00:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LuuC9-1gfR6i3ccj-0105I8; Sun, 05
 May 2019 09:54:13 +0200
Subject: Re: Building on Orange Pi
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
 <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
 <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <e65bfedc-880a-b2d0-d21c-506e5eea7008@web.de>
Date: Sun, 5 May 2019 09:54:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9dPTV94zD17fl07OUD/XpS0J8I8P+F0jzso4XaNk01dS0lVeLTU
 f24T9TLiqBr2UDGO+KQf3QYGcUa99J3C8pFMplbJIcL2UBoIIFUpR/uy9pLs1kaXoDV7NB6
 QXPjcevxyRK6Zq4adDFmCRrKkfXJup2eVvBY/3Q+YO8U6TP5aC5mS0BhnV/57TjOiICRgiY
 MAuA/IVNiJcoZTMys+RDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D1rVOc22YcQ=:rAj0fttVL0LiojhtxEyYMq
 XG+OjRW1mWuS3cskTimJTl88bQtkfgHMuyvrDpJX8Afcm7S/nUY7Pft0VR8TSGYDdK+gHFXyz
 Ja2igs5c5UXjmqgF8GREqqSU7qv+VepKTRVGG8YZ1QB4NITl6heiHgdgtZ9uFE+P4FwS1lirL
 iz3jcu9TwbCoJb+0im7T5Dusy4xnHJJtpU5AAH6PW5A76r/XB04eQOVu9GYjr080j3IVSlWDc
 rbJ5/PuRUWQzRdOc0+2JGwu9/lk1o4vz/W7gE8ZDblRlsGRooqYZ0g4n7Imnz43srAp2zeGd1
 GCKU4dvD+/m/IFbk/dO8zOb3FgQlxj5pA4qjuyhWOIHmcyqK7CBoCbCcxB//yL5SE6f1Xb3CU
 lw7yZFHdA7aQmlW4RJ82Un7lhxpng5HI1Jj/U+4ogsn66Z2rF6zieWop9ensi7CqrWu7Yhksy
 z7lzO75cq3SRcjmTbAXYHxpuxNfiLpYxkMqsYghgyeOL6JANh2WAuurasv6yqnRrIQbw6pa9J
 HL8/DP8wxHmZMbtFJi++eXps9vGq4R0oikniQ4TQH4xRsUdZ6CVag+W6HZqxnm/0TqrX8zsJ2
 Gi9twdR+GsKFOZZIW6vAMNeupx8EcJ6xa+CdVMIym1AIkNWUsYZc+mFGmevvRjei9XqKrnqL0
 gVlIkl8P+hOH50WrK7yCrEIhFATRpNd+LsrG/NlcHhOGtmgRB/y/LGTX2C80khEYq8O/qUGUK
 dBeW7EY5xG58gnAKNDBWS/0/IEIbufisMhfbAxi8S1W+kS0O0TD/qqD6bUfN+iT97SEzand1X
 EEC0i0l6eFsspQoOQjx8VSiG6xoD1Jti3vcUlfdrJ6eRRz0PS5ATjT925+ppWrY2LJ3F0PBQG
 52K2587gkUU/z9Rj8l6jNMymOxoRHRY/AmYqjT8nMjMKZRDti/Fn8v7AdbuRKNngzF7M2J6AF
 fDSHSLQaMaA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=euYqyJXv;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 02.05.19 16:28, Arvid Ros=C3=A9n wrote:
> Hi again,
>
> Thanks. I=E2=80=99ll try the same thing with the stock kernel source to s=
ee if it=E2=80=99s a
> toolchain or source problem. This kernel came with the orange pi Debian i=
mage. I
> guess it=E2=80=99s patched for that Allwinner chip or something.
>
> Does the jailhouse build derive compiler flags etc. from the kernel heade=
rs
> somehow? That could explain the problem too maybe. I=E2=80=99ll report ba=
ck.

For the hypervisor and the inmates, we should not use the kernel's flags. W=
e
rather try to overload them with our own needs. But that may fail if we are=
 unlucky.

Compare "make V=3D1" builds to find out differences. If you post your logs,=
 we may
help with understanding the switching, and hopefully what went wrong.

Jan

>
> Cheers,
> Arvid
>
> -------------------------------------------------------------------------=
-------
> *Fr=C3=A5n:* jailhouse-dev@googlegroups.com p=C3=A5 uppdrag av Jan Kiszka=
 <jan.kiszka@web.de>
> *Skickat:* torsdag, maj 2, 2019 11:54 fm
> *Till:* Arvid Ros=C3=A9n; jailhouse-dev@googlegroups.com
> *=C3=84mne:* Re: Building on Orange Pi
> On 02.05.19 09:48, Arvid Ros=C3=A9n wrote:
>  > Hi again,
>  >
>  > See my commands and output below.
>  >
>  > =EF=BB=BFOn 2019-05-01, 20:48, "jailhouse-dev@googlegroups.com on beha=
lf of Jan
> Kiszka" <jailhouse-dev@googlegroups.com on behalf of jan.kiszka@web.de> w=
rote:
>  >
>  > > On 30.04.19 21:56, Arvid Ros=C3=A9n wrote:
>  > >> Hi Jan,
>  > >>
>  > >> Thanks! Sorry for top posting and also being unclear. I can pull th=
e
> sources from the repo, and download kernel sources for the running kernel=
.
> However, when I try to build it, just by typing "make", I get a build err=
or
> related to the syntax used in .S files and also something that I think is
> related to tumb2 instructions. I presumed that I either needed some speci=
al
> toolchain, or some custom configuration in the jailhouse tree or maybe so=
me
> patch or something. Or is this supposed to work out of the box?
>  >
>  > > Please describe in more details what all you installed in the target=
. Also
>  > > provide a console dump from what you called and what errors you got.
>  >
>  > I have installed kernel headers of the running kernel, gcc, build-esse=
ntial
> and the packages listed in the control file.
>  > Then, I try to compile jailhouse and explicitly pointing to the instal=
led
> kernel headers. Is this correct btw? Or do I need to get the full kernel =
source
> and compile on my target machine?
>  >
>  > arvid@orangepizero:~/jailhouse$ make KDIR=3D/usr/src/linux-headers-4.1=
9.25-sunxi
>
> Where did you get that kernel from?
>
>  > UPD /home/arvid/jailhouse/hypervisor/include/generated/config.mk
>  > CC /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-gic-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-linux-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi-uart-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/bananapi.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/bananapi.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-linux-demo.cel=
l
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e-uart-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1e.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-linux-demo.cel=
l
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h-uart-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1h.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-linux-demo.cel=
l
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m-uart-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/emtrion-rzg1m.cell
>  > CC /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1-linux-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/jetson-tk1.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/jetson-tk1.cell
>  > CC /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-gic-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0-linux-demo.cell
>  > CC /home/arvid/jailhouse/configs/arm/orangepi0.o
>  > OBJCOPY /home/arvid/jailhouse/configs/arm/orangepi0.cell
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-bananapi.dtb
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1e.dt=
b
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1h.dt=
b
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-emtrion-emconrzg1m.dt=
b
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-jetson-tk1.dtb
>  > DTC /home/arvid/jailhouse/configs/arm/dts/inmate-orangepi0.dtb
>  > UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h
>  > CC [M] /home/arvid/jailhouse/driver/cell.o
>  > CC [M] /home/arvid/jailhouse/driver/main.o
>  > CC [M] /home/arvid/jailhouse/driver/sysfs.o
>  > DTC /home/arvid/jailhouse/driver/vpci_template.dtb
>  > DTB /home/arvid/jailhouse/driver/vpci_template.dtb.S
>  > AS [M] /home/arvid/jailhouse/driver/vpci_template.dtb.o
>  > LD [M] /home/arvid/jailhouse/driver/jailhouse.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/asm-defines.s
>  > GEN
> /home/arvid/jailhouse/hypervisor/arch/arm/include/generated/asm/asm-defin=
es.h
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/control.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/dbg-write.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v2.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/gic-v3.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/irqchip.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/ivshmem.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/lib.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/mmu_cell.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/paging.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/pci.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/psci.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/setup.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/smccc.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-hscif.=
o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-imx.o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-mvebu.=
o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-pl011.=
o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-scifa.=
o
>  > CC /home/arvid/jailhouse/hypervisor/arch/arm/../arm-common/uart-xuartp=
s.o
>  > AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages=
:
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:22: Error: invalid
> register list to push/pop instruction -- `push {r0-r10}'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:26: Error: instruct=
ion not
> supported in Thumb16 mode -- `ands r3,r0,#0x07000000'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:30: Error: only lo =
regs
> allowed with immediate -- `mov r9,#0'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:33: Error: unshifte=
d
> register required -- `add r2,r9,r9,lsr#1'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:34: Error: source1 =
and
> dest must be same register -- `lsr r1,r0,r2'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:35: Error: unshifte=
d
> register required -- `and r1,r1,#7'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:43: Error: unshifte=
d
> register required -- `and r2,r1,#7'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:46: Error: instruct=
ion not
> supported in Thumb16 mode -- `ands r4,r4,r1,lsr#3'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:52: Error: instruct=
ion not
> supported in Thumb16 mode -- `ands r7,r7,r1,lsr#13'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:54: Error: unshifte=
d
> register required -- `orr r10,r9,r8,lsl r5'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: unshifte=
d
> register required -- `orr r10,r10,r7,lsl r2'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:59: Error: instruct=
ion not
> supported in Thumb16 mode -- `subs r7,r7,#1'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:61: Error: instruct=
ion not
> supported in Thumb16 mode -- `subs r8,r8,#1'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:65: Error: lo regis=
ter
> required -- `add r9,r9,#2'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:71: Error: invalid
> register list to push/pop instruction -- `pop {r0-r10}'
>  > scripts/Makefile.build:403: recipe for target
> '/home/arvid/jailhouse/hypervisor/arch/arm/caches.o' failed
>  > make[4]: *** [/home/arvid/jailhouse/hypervisor/arch/arm/caches.o] Erro=
r 1
>  > scripts/Makefile.build:544: recipe for target
> '/home/arvid/jailhouse/hypervisor/arch/arm' failed
>  > make[3]: *** [/home/arvid/jailhouse/hypervisor/arch/arm] Error 2
>  > scripts/Makefile.build:544: recipe for target
> '/home/arvid/jailhouse/hypervisor' failed
>  > make[2]: *** [/home/arvid/jailhouse/hypervisor] Error 2
>  > Makefile:1520: recipe for target '_module_/home/arvid/jailhouse' faile=
d
>  > make[1]: *** [_module_/home/arvid/jailhouse] Error 2
>  > Makefile:40: recipe for target 'modules' failed
>  > make: *** [modules] Error 2
>  >
>  >
>  > This seems to be caused by AS using the wrong syntax or something. Aft=
er some
> searching, I can fix it by adding the line:
>  > .syntax unified
>  > to the top of the file.
>  >
>  > However, I then run into the following problem:
>  > UPD /home/arvid/jailhouse/hypervisor/include/generated/version.h
>  > CC [M] /home/arvid/jailhouse/driver/main.o
>  > LD [M] /home/arvid/jailhouse/driver/jailhouse.o
>  > AS /home/arvid/jailhouse/hypervisor/arch/arm/caches.o
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S: Assembler messages=
:
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:55: Error: shift mu=
st be
> constant -- `orr r10,r9,r8,lsl r5'
>  > /home/arvid/jailhouse/hypervisor/arch/arm/caches.S:56: Error: shift mu=
st be
> constant -- `orr r10,r10,r7,lsl r2'
>  >
>  > My guess is that this is caused by the fact that AS is trying to assem=
ble the
> file for arch=3Dthumb, but the source is written for arch=3Darm.
>  > I'm not good at this, so that might be totally wrong of course.
>  >
>
> It is probably related to the kernel headers package used here, because t=
he
> whole thing works fine with our kernel. May still be a bug in the Jailhou=
se
> build system in the end.
>
> Jan
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email
> to jailhouse-dev+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
