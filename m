Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBRXD4GYAMGQE7GPMIIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72D8A2247
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:27:04 +0200 (CEST)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-609fe93b5cfsf5354997b3.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878023; x=1713482823; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDgtffLZ79UHSTcwiOxxHWVVwDkcRhCFVhZaLYAk15w=;
        b=tRluHRl/5K+9FC1TpUMXMnTqMEkheFKEnSJWvAqYSUZugzxXFHC1rBUx/4xtQmfov+
         uZu0pu0VfIDtQ4iYCo0ZemUIIBntg7MR0IO5+zTebhJKbMef5mWBMZ0jXuQfikuyIAeK
         AcMerB+R4xcI0e4zrY8oB0YkewZwx1ZMrHAiiIa3M1G5vqhHfKcBPUNuRCdMl4URqDbI
         B7ivsNnWzofXmR5mvc+YYQr069vXDpvSviV4SIKxO6Ouad38Hcy+O4Dd0f5YMUGNQGZu
         3PJVuChJjMbDSyAFbn7zCJkkWjJWufs0RnXPG9yLAy9x/ZzsT2TBcpT1NQDg4KVoH0+Q
         uMmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878023; x=1713482823; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDgtffLZ79UHSTcwiOxxHWVVwDkcRhCFVhZaLYAk15w=;
        b=Ie7NdAzmaQ77yddY4BOVyWvzeOsv6alg50ezimVIO/X4Mv4AuMj3TRvtc43wgEv0jy
         EmN170IgA5qN1mCEwnWLhYaHutdyG8yfkmJMyNIoC7G4dD7YS7zk5Z/u7138MCFeav5v
         dm6+So4BGccBm2k5gKeCDnkdGqqhVy3yybGn6L3V0mDumWAqzZa2MAcYNB3Xp7ks8bDL
         d4fthJz56W/D4hCqMXdJITyboKZIxgTN/5uROKSnt30jcVP6mIDwBf4pZfQ+iEvhJLZ9
         1CXaIIjCRnaHsE+kcv87xjAFXkEpSa3d1UzRhKKoX8imTh+zFHOwiLFX9SuXk1RovA3u
         VNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878023; x=1713482823;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDgtffLZ79UHSTcwiOxxHWVVwDkcRhCFVhZaLYAk15w=;
        b=mfbRFBJ9HNshi9tde4yUCfphYpPZNyTURPHHaddhUyINsqzTEVjIRWE4pjcwvHI4v1
         l+ajXRA5//yMDA6K+7Wv94+5iEuMz0Yf44xVKbOGVwe1Vwb+3AdUMf0xFeGbqULkqRro
         Sqnz33KLy0ABqqikyke1quDiZuU3wyvT0mbLf53bB3jydyltROIOfGrSVHCdcj03/F2k
         ELt0BXos9AErl7OuVjfztkjBwKv1KBODj9SOCRyjjCofP3stExzSI9pwbBbSzOvit9US
         7uCSBQhqnemNYKBb1h74dczifCv/ZislnwR37RC6qcDUwOtmhtgD5cEHDgm9S+xwcQNk
         8O+w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWq6bTUz+tQlCJ+w3ubZl9Qn7XWMQ8T/fLkgR3N7ZJQf/8fK8k4UurJMO3lCW4ER3CNdU2IQhJg0m/9jT9j9c9qhAq/grNiKsisv5c=
X-Gm-Message-State: AOJu0YywipLxei4WwC0m4Mnc5fLhYLBaUamobokw/2JnjlICLR42ZzwD
	e7Y/5jgzf1JTymo8JlpyW/hvGqi5/WecEM6PT5ULAfa35PhgeY/E
X-Google-Smtp-Source: AGHT+IGEVAHvl+clw1BPd1GdxJGuGcVDWr6boI0QZ5tDwsl3u5qg1gzqJs+L53C8SbImXVBSpoGhpg==
X-Received: by 2002:a25:ba4f:0:b0:dcc:96db:fc0d with SMTP id z15-20020a25ba4f000000b00dcc96dbfc0dmr935033ybj.25.1712878023345;
        Thu, 11 Apr 2024 16:27:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7e87:0:b0:dcc:279c:e5c9 with SMTP id z129-20020a257e87000000b00dcc279ce5c9ls699729ybc.1.-pod-prod-01-us;
 Thu, 11 Apr 2024 16:27:01 -0700 (PDT)
X-Received: by 2002:a0d:d806:0:b0:615:5c4:1d17 with SMTP id a6-20020a0dd806000000b0061505c41d17mr217875ywe.5.1712878019799;
        Thu, 11 Apr 2024 16:26:59 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:26:59 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e35b563f-ba4e-4df5-addb-cb111dd899a5n@googlegroups.com>
In-Reply-To: <c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn@googlegroups.com>
References: <c87d6aa0-ef6d-419d-911c-59bcfeaf0a2cn@googlegroups.com>
Subject: Re: Zephyr RTOS now supports Jailhouse ivshmem Ethernet
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_95500_1179582828.1712878019214"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_95500_1179582828.1712878019214
Content-Type: multipart/alternative; 
	boundary="----=_Part_95501_2090251765.1712878019214"

------=_Part_95501_2090251765.1712878019214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Thursday, May 18, 2023 at 7:05:07=E2=80=AFAM UTC+1 Grant Ramsay wrote:

> Hi, I thought people here might be interested that Zephyr RTOS has added=
=20
> support for Jailhouse ivshmem-v2 Ethernet.
>
> PR:
> https://github.com/zephyrproject-rtos/zephyr/pull/55202
>
> QEMU sample:
>
> https://docs.zephyrproject.org/latest/samples/drivers/ethernet/eth_ivshme=
m/README.html
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e35b563f-ba4e-4df5-addb-cb111dd899a5n%40googlegroups.com.

------=_Part_95501_2090251765.1712878019214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Thursday, May 18, 2023 at 7:05:07=E2=80=AFAM UTC+1 Grant Ramsay wrote:<br/=
></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Hi, I thoug=
ht people here might be interested that Zephyr RTOS has added support for J=
ailhouse ivshmem-v2 Ethernet.</div><div><br></div><div>PR:<br></div><div><a=
 href=3D"https://github.com/zephyrproject-rtos/zephyr/pull/55202" target=3D=
"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://github.com/zephyrproject-rtos/zephyr/pull/55202&a=
mp;source=3Dgmail&amp;ust=3D1712964150093000&amp;usg=3DAOvVaw37PERXa6rTOLc_=
YvY09Zm8">https://github.com/zephyrproject-rtos/zephyr/pull/55202</a></div>=
<div><br></div><div>QEMU sample:<br></div><div><a href=3D"https://docs.zeph=
yrproject.org/latest/samples/drivers/ethernet/eth_ivshmem/README.html" targ=
et=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.c=
om/url?hl=3Den&amp;q=3Dhttps://docs.zephyrproject.org/latest/samples/driver=
s/ethernet/eth_ivshmem/README.html&amp;source=3Dgmail&amp;ust=3D17129641500=
93000&amp;usg=3DAOvVaw0hTrdp7tyVusgJCrKnTOYT">https://docs.zephyrproject.or=
g/latest/samples/drivers/ethernet/eth_ivshmem/README.html</a></div></blockq=
uote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e35b563f-ba4e-4df5-addb-cb111dd899a5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e35b563f-ba4e-4df5-addb-cb111dd899a5n%40googlegroups.co=
m</a>.<br />

------=_Part_95501_2090251765.1712878019214--

------=_Part_95500_1179582828.1712878019214--
