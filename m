Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBQW64GYAMGQEE6WJDEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B88A2227
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:16:20 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dced704f17csf543538276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712877379; x=1713482179; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YV1mbAJcjRqXukKF4hgdahZOL493WSHcNqFlUKoTLGY=;
        b=g30vFTJssEwLz9d2GIS0nfhdSw6XJgoEMaNUTtCD/ILbwtu65LnbwtkAev3/MoZ2N3
         GE8v4LIvLZyTCDfMFVWJboFeR2paz1z4Hh5f8IQuhIb5hQXm8foE4yT20WirshTMf7ZU
         pnq67I7a+A5TaEz7S79u4E29vW1myL9OFTMK48qcNkJoXsbfIw0YqlHWZ0Vy8pIVARMj
         8z9AzBu58wEAXDQrwDYNUpP/63lJdq4yoRxSro44oSwUXQt2uFVqJHaa6cKTeCjdVkg3
         4793AQWT9ULfUokUETAZnmr5QZZLvnkkhzs+EB2OJRYwniz50oOS0+lI11G6TWWyKof2
         fDtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712877379; x=1713482179; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV1mbAJcjRqXukKF4hgdahZOL493WSHcNqFlUKoTLGY=;
        b=UCd14kTrNwdzLIrDrwAha+MSHDVrxJ6x4Y0EjRP2EKJDMsJ+UNU8jKW8S/z8BCL/gk
         eWUcy07Ct+0uaslNEnl5bW9BDpxob/ud2YaeY0hNroPHNSuu9IsPZGuH4n4cfl69YFX4
         RZP2CHgNE8dT1gh1FGf/8X8ayk6QP5y0WU01FgxAd7xHDr4lnxxkOxf4KKeOGQcs2dKP
         59E5nCAB+52pX2OoQ8Gcqf/hbnAqBTKNm8q/6bgX1iub0umRbxjEN2bdkScOXCyIKRuG
         6gcDdNQDh9GTvXlFkVtC+2uktI5pKpDMyJ0BoC+R8jJ+KlxPanJG9WdEtnTeuT0F5hqz
         1oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712877379; x=1713482179;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YV1mbAJcjRqXukKF4hgdahZOL493WSHcNqFlUKoTLGY=;
        b=mDnpN7ZmuSKDtvQDthgd/MBnohC+n1moYtmXVWRgRxzozJ4cYFYrPvH/5yae0NThKQ
         7I+hYAyGxIID152tYCS//KqlpY6pmILIrqVJmeOej0PxWQQeZ5GJRFiDYvm+4Oeuhh9X
         pdsOHdP9h6wGyT49tUzx8O3B2R0251ONn26vgoZqp/Zk9EAzRDeY1PWpf7754QXXbd1I
         RtQuc87xxcN2pGT9ls2F7HLkz/Bmi7yLZLmDlN+0Enrls+QteJiwtrV0ZlgnYu1xEXuP
         aMNfQc/eheNkCWSIKjAVGBl5yeT2QNsMvd+oplCFRiyZL3esAHQsKVPTNXvkb2Q6l5l+
         7pkg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCViJ5PzhTC/AKyNmvjIQ9m57/tGrNJH4ytDS/zC0DE7RzpZgpTx5TqzHI6/LK4nNXr1x5abSLLkKGupycOeovCswVdFob5Lg6VXC9I=
X-Gm-Message-State: AOJu0Yx6cMmxxT8bvrDOPpQHsRmvEloMOatpe1O5/X2xy8fftCQV60wO
	AuMFSiiaCdxPDpQkZF+3uBJVtUBdcdFMH6P9R5c4rELk2QYVCUgM
X-Google-Smtp-Source: AGHT+IEzk/w8TG5v+gprgkHz5kXEN9sIDhjVEZNg5anPjvV7hHBX6AGsHOCzaMoWv68+6IWg+wJcxg==
X-Received: by 2002:a25:af48:0:b0:dce:53c9:4d9f with SMTP id c8-20020a25af48000000b00dce53c94d9fmr901720ybj.58.1712877379592;
        Thu, 11 Apr 2024 16:16:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d009:0:b0:dcb:b370:7d0c with SMTP id h9-20020a25d009000000b00dcbb3707d0cls478131ybg.1.-pod-prod-02-us;
 Thu, 11 Apr 2024 16:16:18 -0700 (PDT)
X-Received: by 2002:a0d:ca07:0:b0:615:27b6:7624 with SMTP id m7-20020a0dca07000000b0061527b67624mr211056ywd.6.1712877377960;
        Thu, 11 Apr 2024 16:16:17 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:16:17 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <38566a76-8dfa-4bfb-8fb3-5f365e891c61n@googlegroups.com>
In-Reply-To: <c54d2322-fd4a-4568-bc01-8d96e83845f0n@googlegroups.com>
References: <c54d2322-fd4a-4568-bc01-8d96e83845f0n@googlegroups.com>
Subject: Re: How the root cell access virtqueue memory created by Linux
 inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_145954_1849504107.1712877377340"
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

------=_Part_145954_1849504107.1712877377340
Content-Type: multipart/alternative; 
	boundary="----=_Part_145955_1792193666.1712877377340"

------=_Part_145955_1792193666.1712877377340
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

On Friday, July 14, 2023 at 7:29:31=E2=80=AFAM UTC+1 Johnson Wang wrote:

> Hi all,
>
> Recently I am working on porting jailhouse hypervisor onto arm64 platform=
s.
> I've brought up the root-cell and also linux non-root cell.
>
> Now I want to make virtio-console work, I started to write my virtio B/E=
=20
> framework by reference the demo code[1]. I'm pretty sure that the ivshmem=
=20
> region is working
> as virtio_ivshmem.c finishes its .probe() callback, and virtio_console.c=
=20
> has registered a hvc0 node. My virtio B/E can R/W the ivshmem region=20
> properly.
>
> However, I noticed that when virtio_ivshmem.c calls=20
> vring_create_virtqueue() to allocate virtqueue structure, it uses inmate=
=20
> private memory to allocate it, which is inaccessible for root-cell. For=
=20
> example, the inmate memory is starting from 0x1d0c00000 and virtqueue=20
> structure is starting from 0x1d29be000. The virtqueue structure is=20
> allocated inside the inmate memory, not shared memory. This means that=20
> virtio B/E fails to retrieve the vring infomations.
>
> Is it possible for root-cell to access inmate memory?
> or create virtqueue in the ivshemem region that is accessible for=20
> root-cell?
> Does jailhouse have any MMU translation mechanism?
>
> Please give me some suggestion. Thanks for watching this.
>
>
> [1]=20
> https://git.kiszka.org/?p=3Dlinux.git;a=3Dcommit;h=3Db6a3ec1cee44b986b556=
b60ed2368d0da1faca51
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/38566a76-8dfa-4bfb-8fb3-5f365e891c61n%40googlegroups.com.

------=_Part_145955_1792193666.1712877377340
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
 Friday, July 14, 2023 at 7:29:31=E2=80=AFAM UTC+1 Johnson Wang wrote:<br/>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi all,<div><br><=
/div><div>Recently I am working on porting jailhouse hypervisor onto arm64 =
platforms.</div><div>I&#39;ve brought up the root-cell and also linux non-r=
oot cell.</div><div><br></div><div>Now I want to make virtio-console work, =
I started to write my virtio B/E framework by reference the demo code[1]. I=
&#39;m pretty sure that the ivshmem region is working</div><div>as virtio_i=
vshmem.c finishes its .probe() callback, and virtio_console.c has registere=
d a hvc0 node. My virtio B/E can R/W the ivshmem region properly.</div><div=
><br></div><div>However, I noticed that when virtio_ivshmem.c calls vring_c=
reate_virtqueue() to allocate virtqueue structure, it uses inmate private m=
emory to allocate it, which is=C2=A0inaccessible for root-cell. For example=
, the inmate memory is starting from 0x1d0c00000 and virtqueue structure is=
 starting from 0x1d29be000. The virtqueue structure is allocated inside the=
 inmate memory, not shared memory. This means that virtio B/E fails to retr=
ieve the vring infomations.</div><div><br></div><div>Is it possible for roo=
t-cell to access inmate memory?</div><div>or create virtqueue in the ivshem=
em region that is accessible for root-cell?</div><div>Does jailhouse have a=
ny MMU translation=C2=A0mechanism?</div><div><br></div><div>Please give me =
some suggestion. Thanks for watching this.</div><div><br></div><div><br></d=
iv><div>[1]=C2=A0<a href=3D"https://git.kiszka.org/?p=3Dlinux.git;a=3Dcommi=
t;h=3Db6a3ec1cee44b986b556b60ed2368d0da1faca51" target=3D"_blank" rel=3D"no=
follow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3D=
https://git.kiszka.org/?p%3Dlinux.git;a%3Dcommit;h%3Db6a3ec1cee44b986b556b6=
0ed2368d0da1faca51&amp;source=3Dgmail&amp;ust=3D1712963411311000&amp;usg=3D=
AOvVaw2PYT89-RBd6XKKAir_BUyX">https://git.kiszka.org/?p=3Dlinux.git;a=3Dcom=
mit;h=3Db6a3ec1cee44b986b556b60ed2368d0da1faca51</a></div><div><br></div></=
blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/38566a76-8dfa-4bfb-8fb3-5f365e891c61n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/38566a76-8dfa-4bfb-8fb3-5f365e891c61n%40googlegroups.co=
m</a>.<br />

------=_Part_145955_1792193666.1712877377340--

------=_Part_145954_1849504107.1712877377340--
