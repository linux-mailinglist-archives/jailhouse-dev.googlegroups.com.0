Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBPG5VKYAMGQE5MCFYCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id BB302893B27
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:55:26 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-61460f335bcsf5620067b3.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711976125; x=1712580925; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZUuymlyPuVRaOxtw7l5EAnFhQIfjMLcuRw+n6sqS/k=;
        b=qo2scz4GZnFjgsKAtXiUYMc10UeQJ74PbfctDc1Ji7CXtkrbbNAInGunh+fiYV/qeu
         C05ltyzANfjOnirTKTYvL310C6kRyhzCO+Z+SUmguw44mjtZI1O1jrDUmEZe1efY7nI/
         wNV6pu9BUVEbygH7IbN3joQ0r4NEjNs5/Cz8vZtyeWXX5XTtzjS7P+59rT/BzXdS2shQ
         UllYFYXi0c2wWupBGy+YRrjuyRxCCMe/Hlt754ulxZQLmS4Pzs+4e1creWySqiME12PM
         FCMKKXT31MkUbpcumH4wILvVy0PsDibNkhAtR+vq3cORPzpwvEaqjGWVQkfvEWK3spoA
         IAWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711976125; x=1712580925; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZUuymlyPuVRaOxtw7l5EAnFhQIfjMLcuRw+n6sqS/k=;
        b=N9mknTD1/tII/HVEYJWfaLibeA0uwTqW0mp06ooYqMKP76cadPq2/y4JKVDiSCgqJw
         IpqEcouYCAatumdfbf9rAyfApNyZNMX1ETmfbwvBjue3toKrEqSwIuhJbV/lEZWFMFHm
         XAloxQpYbx3CeJYVU1Jn9uPaumpDGRSm9PaHWY1K2RCMLVra53m9FoGRp3m2NNgkcs7U
         lLlR4Joim07+soyc/pXphkv5sgbDsGc7CvBa1sJjfksDTe1i5c2p8yTdxZO6hFoViLg3
         FBS6knaKaKKDo0YCqING/nQW4TIeGzx0WeDhbUV8RSkxU6WndG7VuvAKrBlaVPuhD/af
         rRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711976125; x=1712580925;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZUuymlyPuVRaOxtw7l5EAnFhQIfjMLcuRw+n6sqS/k=;
        b=Hic1JxJuWVEcKG2xwTc5dVsEr4y5jcRSqQJyfoIR8F4KN3vZ/UY8F/sDcY63BhjXdo
         8rWUPy830aL/z4wlaA42YM3XYoWp1JJ/GKLx940bCdQC2PHaUiCFLy6KOMdVxHjEoA9s
         WrXAyDPQskQZwasfVS06FruZMSOY4TSGgAocGevoFHN/N4+CBe8mDfP53nqWjqafEUoU
         eAc5INnbMoSVtNWgD7IxRHC4OhAL38UZ637DgDB0h19sjrdf49dQOQGJ+aMBDhfjMvtE
         +eqfvNPXmrNud9Ml8TXupw1JC6yiowetoCFqBukXpX5afwaJt0iBoPyPUYbNEmyrDn0G
         9nyA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWiWUPBXvw8hxHPQn2Ecyu+V8nkxem4tGC0PME9zEP7Lhk8sPFjO9ZccXXVonc0PAdXvn02o3gOU+xiHVuOG8Iykb+aSWpZPDR+KH0=
X-Gm-Message-State: AOJu0Yy65kTcvTFkUvtuqkZhQ4TGpP6iLBzBLynBUa8CEjurrvl7vAmt
	KIYkYc+w04fkUxMpkMVbCQEKwDKFeyecaUctnGQ/owBLclKkxDfG
X-Google-Smtp-Source: AGHT+IE4JvFdaiDcnvKVj4ug8SxJgEPfkbbMDhZ9gwcDRKKj1BRDs8+r7ezpNQGxxOJwg2164OsEPg==
X-Received: by 2002:a25:7446:0:b0:dc7:45fd:b454 with SMTP id p67-20020a257446000000b00dc745fdb454mr5309017ybc.1.1711976125352;
        Mon, 01 Apr 2024 05:55:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:abef:0:b0:dcd:a08f:c840 with SMTP id v102-20020a25abef000000b00dcda08fc840ls435543ybi.1.-pod-prod-09-us;
 Mon, 01 Apr 2024 05:55:24 -0700 (PDT)
X-Received: by 2002:a05:6902:1586:b0:dcb:b9d7:2760 with SMTP id k6-20020a056902158600b00dcbb9d72760mr3122059ybu.13.1711976123833;
        Mon, 01 Apr 2024 05:55:23 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:55:23 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b3c29b14-71da-43bd-88a2-438e6ca5180dn@googlegroups.com>
In-Reply-To: <cfa0c6a3-854f-4619-8e60-384823fb634e@oth-regensburg.de>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
 <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
 <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
 <91a64cf9-a3b4-419b-b030-fc3d295e577en@googlegroups.com>
 <cfa0c6a3-854f-4619-8e60-384823fb634e@oth-regensburg.de>
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_265710_1424523564.1711976123124"
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

------=_Part_265710_1424523564.1711976123124
Content-Type: multipart/alternative; 
	boundary="----=_Part_265711_190590114.1711976123124"

------=_Part_265711_190590114.1711976123124
Content-Type: text/plain; charset="UTF-8"

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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b3c29b14-71da-43bd-88a2-438e6ca5180dn%40googlegroups.com.

------=_Part_265711_190590114.1711976123124
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
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b3c29b14-71da-43bd-88a2-438e6ca5180dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b3c29b14-71da-43bd-88a2-438e6ca5180dn%40googlegroups.co=
m</a>.<br />

------=_Part_265711_190590114.1711976123124--

------=_Part_265710_1424523564.1711976123124--
