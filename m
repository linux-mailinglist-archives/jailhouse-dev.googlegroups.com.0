Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZM2UDVAKGQEPT4ED2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD1817D0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 13:05:09 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b14sf40623002wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 04:05:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565003109; cv=pass;
        d=google.com; s=arc-20160816;
        b=izKEK+RN2u3zH6v78FUwUxVm9nnG6CrnmtfudGmn/S4rGPTBeMNmlomxFMBXW010u9
         TGH20R+31JVVVL+4tsfubSbtQ/d7EgdZnuMCsWTqmSxrkgKIR3+qtOLedX5meLL3d2lW
         5bCb9Q1vIWs7L/HA6f18L1tN7BcmJo+q2pwvnHmJMHSLej6AOqeym+8zYMNFl4LsdVSf
         P3dougfvu9AArniobZpPUocXiHAWa0MFuSItzh3BLiitQOZ/ZvF6btT3AMGWC3QdilOj
         8i1qsux9LcC5oLjsPys1D4zLwgZneo5QWpvGtUTkooTdgYUv26tr7ICqmCYUl0exD+Xs
         ZY7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6xPaG+owmB8YXPglpTH+/yFkTO6yIeVRzOTXrqCMnag=;
        b=xA5tDF+wDiATDTfnH1/421TYDTLJWmSqNFUtMkwiX90DFpnzz4SIiYM5WDUvue1U66
         ra/9o+u4ANe4fD38+rwhguki0P7WAW9MlKtFRwHlUnzrwv/Qgf5LDrQieb2ApbmIJKoL
         fGlnDbgpvZDLpM3a6TEWkpc5VPTSXBY9Tb6AxtZCG9Zlp4x0Ftq8azhPr9xruPAF8Y32
         b4+l71yMWS9Rmwj9YE0kXOWukdExuBkITFBGM0LzIkSKIIbcMyHqtkmHT5OLtiz0L56W
         wYJLmXxif9CDegaHh8tQec8ncDrewZI3Oo4L4GDVQ+qp/xk5Q82ei2Bm5RrTO94tGP7H
         hpcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6xPaG+owmB8YXPglpTH+/yFkTO6yIeVRzOTXrqCMnag=;
        b=VpsImYMIEyiOKvzINAAiPN+tdzQ++K82wm5tHsDA9ZPDHM/PADspmyWHQ3V3SatAqm
         Smu7SpEeoyAuhaVoqqvzB0T3TJDVQ+Gt6LmW2TK3ry28apsovRwtM13nwBnBMQ2fD0Bj
         Owb0W/ahvkuRieLu0ze6IxEoKkwGHcVt11kNtIIHbibRTZd5UDvIKZXU++xLLU1tKBOQ
         cC2qIogWTU4/S7dVug/5hcjghxChghwSYCj+zMowWjL3/4eolCs1xXHQnrgx4Fj9/o3U
         2xhwT+syT8qiC0f9n1oQ8P8UK+72LG1nzIb6e0OxweLTUQYtj1k9MaFnu6xa8tIrp66S
         tZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6xPaG+owmB8YXPglpTH+/yFkTO6yIeVRzOTXrqCMnag=;
        b=gc70OmgCyWN5gAUQPQoBBZkdMZpytR/57ig3suTHlYSaXHUeqfQuTKggmIKXGFx4vy
         vwq/GZtN8ghtgfg0qcpJiTm8LXfJ78zoyQtqj+KnwfrORgBXbS0w56VfzYVnZdULA++E
         5ZlgF/p2NjclEH29X5ujZwzSHKvNrEzayjWoG+fRBXb9xjOSvn4XEWRsucgX2XWYtzFa
         CWsAu99U2mUOeTRdanQ+g/BHyPVNj/A4o1HeCwjPcAxDOKeFsefR59ww0DuGknxaD5hf
         hL27iEceAP/AXJbH9Yw3d1t34dqCFNnO4pGVBOlJ4+nXM79qo1XLEf0IZZ1kOX/zbSqL
         q3Tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVUyDf4NChipBA9Uts9Omlqb8XjNW3XrmtA8wqRxnwIg7CG34re
	etaEtW1qyVEry505yKa8+wU=
X-Google-Smtp-Source: APXvYqwvjcvURuuSVN8hzuoI84RO4/4OS/2D5DrToCVxFZu6nbHQDt9whvZgl7+ptB0PqPSC2J885A==
X-Received: by 2002:a1c:6504:: with SMTP id z4mr17920709wmb.172.1565003109314;
        Mon, 05 Aug 2019 04:05:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5144:: with SMTP id u4ls24483563wrt.4.gmail; Mon, 05 Aug
 2019 04:05:08 -0700 (PDT)
X-Received: by 2002:a5d:6709:: with SMTP id o9mr14894768wru.301.1565003108547;
        Mon, 05 Aug 2019 04:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565003108; cv=none;
        d=google.com; s=arc-20160816;
        b=Niug2IuE68ZG4GYvShOWh/WyKG2e79TSVASc7vOo22WKiId17QCj+c74exCMNCkW9h
         MZEteDWGPJdiDZyjDu5yMuFKZWy36VkMEgWy+m0KJhguONDuomQ6I0mC9y6TQaSJD0tG
         9LY2tlLR5y31HSGfrdoXG9G9VlL7kYRV0xv1QnuCa7tNw31IRt3fwGxOxxOqO9xf84Xd
         7MndvcskY1qtL0VXXPIPJcZqe+jsNXlPWY9n3JuxOoTyHoqCDiF8QoJhdJn4eo1Lb6Yu
         PRW2GHLdoepTBux/0YJF5oNNrWEhvdecie20b1kQxqvX3a1HS5xf3rU3E+xSJohCGiCQ
         +DAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=fRJT0HDvmQJ2g+0A1c+HlE/oN6FZLQiJRSh77zX5Vrw=;
        b=Kaifq1t11qj0dqus8Bh9nom0ksHXfrYvH6o4JCBLlHdZiQ9TLWrGaQU484+tBS4JQZ
         zFRbiYXEWNR+IDO8b+l6gAi3ig7iWBOd4snDoXVGy0CLNim0BANXrIvQlbf3tFTHPz+A
         p61CCHPC6VLyaylgl2kpTy70wFKFE1SpIRt4+wTqjGk+cdcjNhbLntarCrvBxmjUh83x
         Hn4lF97/ZIFl/at0Tubj9XIh14zPriJeLrgvrWZ2Lp7oB1dCQVrWu2bjlVfnZPt62FH0
         MOqYBffXUsUupVUE0r/mLO/74qqB0yGGY6fgtQeFVSgncoATbhseJ1a4/3IgJNn//sMp
         bTOQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a10si4443963wmm.2.2019.08.05.04.05.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 04:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x75B576Y012664
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 13:05:07 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x75B574P022737;
	Mon, 5 Aug 2019 13:05:07 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
Date: Mon, 5 Aug 2019 13:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.08.19 12:00, Jo=C3=A3o Reis wrote:
> Ok, so i've increased non-root cell's RAM memory region by 256MB (now it =
starts
> from 0x50000000), and changed the reserved memory for hypervisor and non-=
root
> cells (on u-boot: mem=3D1280M, which is equal to 0x50000000 bytes).

OK, good.

>=20
> It can load the cell, and when it starts it gives me an error related to =
UART0 (?):
>=20
> [=C2=A0 =C2=A062.493128] Created Jailhouse cell "non-root"
> Cell "non-root" can be loaded
> Started cell "non-root"
> Unhandled data read at 0xff000024(4)

If you advertise UART0 to the non-root cell via the inmate device tree, you=
 will
get such an access. Are you doing that? The device trees we ship in Jailhou=
se
use UART1.

Jan

> FATAL: unhandled trap (exception class 0x24)
> Cell state before exception:
> =C2=A0pc: ffffff8008480448=C2=A0 =C2=A0lr: ffffff8008473a70 spsr: 8000008=
5=C2=A0 =C2=A0 =C2=A0EL1
> =C2=A0sp: ffffff800801b9e0=C2=A0 esr: 24 1 1830007
> =C2=A0x0: ffffff800d83c038=C2=A0 =C2=A0x1: 0000000000000000=C2=A0 =C2=A0x=
2: ffffff8008480440
> =C2=A0x3: ffffff8008011024=C2=A0 =C2=A0x4: 0000000000000000=C2=A0 =C2=A0x=
5: 0000000000000064
> =C2=A0x6: 0000000000000051=C2=A0 =C2=A0x7: 3030303035323620=C2=A0 =C2=A0x=
8: 7820612073692029
> =C2=A0x9: 2030535079747420=C2=A0 x10: 204f494d4d207461=C2=A0 x11: 3030303=
066667830
> x12: 2071726928203030=C2=A0 x13: 736162202c35203d=C2=A0 x14: 3d2064756162=
5f65
> x15: ffffffffffffffff=C2=A0 x16: 0000000000000001=C2=A0 x17: 000000000000=
0001
> x18: 0000000000000010=C2=A0 x19: ffffffc03a990000=C2=A0 x20: ffffff800d83=
c038
> x21: ffffff800d6104c0=C2=A0 x22: ffffffc03a990100=C2=A0 x23: ffffff800d60=
e000
> x24: 0000000000000000=C2=A0 x25: ffffffc03a99eb00=C2=A0 x26: ffffff800895=
9a38
> x27: ffffffc03a99e600=C2=A0 x28: 0000000000000005=C2=A0 x29: ffffff800801=
b9e0
> Parking CPU 2 (Cell: "non-root")
>=20
> segunda-feira, 5 de Agosto de 2019 =C3=A0s 07:30:59 UTC+1, Jan Kiszka esc=
reveu:
>=20
>     On 02.08.19 21:46, Jo=C3=A3o Reis wrote:
>     > I send in attachment the root cell (ultra96.c) and non root cell
>     > (ultra96-linux-demo2.c) config files, along with the .dtb i am usin=
g.
>     >
>     > The Image and rootfs.cpio files occupy 89,9MB and 79,4MB, respectiv=
ely.
>     (link to
>     > download them if you want to:
>     > http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3
>     <http://www.mediafire.com/folder/sopta5vdf01yfm8,kwk1yt5jc9zcpl3>)
>=20
>     That's obviously too large for the remaining space in that region. I =
will
>     try to
>     reproduce in order to understand why the loader attempts this neverth=
eless.
>     Meanwhile, you could try if expanding that region a bit more makes it=
 work - or
>     just moves the problem around.
>=20
>     Jan
>=20
>     >
>     > sexta-feira, 2 de Agosto de 2019 =C3=A0s 08:28:52 UTC+1, Jan Kiszka=
 escreveu:
>     >
>     > =C2=A0 =C2=A0 On 02.08.19 04:34, Jo=C3=A3o Reis wrote:
>     > =C2=A0 =C2=A0 > The value of arch.ramdisk_address() is=C2=A02062893=
056, converted to
>     > =C2=A0 =C2=A0 hexadecimal is
>     > =C2=A0 =C2=A0 > 0x7AF54000, which is within the newly added RAM mem=
ory region that
>     begins at
>     > =C2=A0 =C2=A0 > address 0x60000000.
>     > =C2=A0 =C2=A0 >
>     >
>     > =C2=A0 =C2=A0 OK, and what' the size that shall be transferred here=
? Keep in mind
>     that there
>     > =C2=A0 =C2=A0 is only 0xF9C000 (16367616) left in that region. That=
 information is
>     part of
>     > =C2=A0 =C2=A0 the
>     > =C2=A0 =C2=A0 'load' structure JailhouseCell.load assembles. If tha=
t size if too
>     large, the
>     > =C2=A0 =C2=A0 driver will reject it. That would explain the error, =
not yet the
>     reason for
>     > =C2=A0 =C2=A0 jailhouse-cell-linux to make that mistake.
>     >
>     > =C2=A0 =C2=A0 If you share your configs, the kernel and dtb images =
and the
>     information how
>     > =C2=A0 =C2=A0 large the initramfs is, I can try to reproduce that.
>     >
>     > =C2=A0 =C2=A0 Jan
>     >
>     > =C2=A0 =C2=A0 > quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 =
UTC+1, Jan Kiszka
>     escreveu:
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 On 31.07.19 02:40, Jo=C3=A3o Reis wro=
te:
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > Other thing i forgot was that on Ul=
trascale+ the RAM finishes
>     at 2GB
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > (0x80000000), so i moved the memory=
 region to 0x60000000, with a
>     > =C2=A0 =C2=A0 different
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 size
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > to not overlap any other memory reg=
ion.
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > /* RAM */ {
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > .phys_start =3D 0x60000000,
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > .virt_start =3D 0x60000000,
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > .size =3D 0x1bef0000, //must be pag=
e size aligned
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > .flags =3D JAILHOUSE_MEM_READ | JAI=
LHOUSE_MEM_WRITE |
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_M=
EM_LOADABLE |
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > JAILHOUSE_MEM_DMA,
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > },
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > But now it gives me the error on ra=
mdisk_address:
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > Traceback (most recent call last):
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > =C2=A0 File "/usr/local/libexec/jai=
lhouse/jailhouse-cell-linux", line
>     > =C2=A0 =C2=A0 831, in
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 <module>
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 cell.load(args.initrd=
.read(), arch.ramdisk_address())
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > =C2=A0 File
>     "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",
>     > =C2=A0 =C2=A0 line
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 44, in
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > load
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 fcntl.ioctl(self.dev =
<http://self.dev> <http://self.dev>
>     <http://self.dev>,
>     > =C2=A0 =C2=A0 self.JAILHOUSE_CELL_LOAD, load)
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 > IOError: [Errno 22] Invalid argumen=
t
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 To make this a bit more systematic, I=
 would recommend you to
>     > =C2=A0 =C2=A0 instrument the
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 code, dump this address e.g., and mat=
ch against what you think you
>     > =C2=A0 =C2=A0 configured.
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 Jan
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 --
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT =
RDA IOT SES-DE
>     > =C2=A0 =C2=A0 > =C2=A0 =C2=A0 Corporate Competence Center Embedded =
Linux
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > --
>     > =C2=A0 =C2=A0 > You received this message because you are subscribe=
d to the Google
>     Groups
>     > =C2=A0 =C2=A0 > "Jailhouse" group.
>     > =C2=A0 =C2=A0 > To unsubscribe from this group and stop receiving e=
mails from it,
>     send an
>     > =C2=A0 =C2=A0 email
>     > =C2=A0 =C2=A0 > to jailho...@googlegroups.com <javascript:>
>     > =C2=A0 =C2=A0 > <mailto:jailhouse-dev+unsubscribe@googlegroups.com =
<javascript:>
>     <javascript:>>.
>     > =C2=A0 =C2=A0 > To view this discussion on the web visit
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0
>     https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd=
2d-c7cbdad1507c%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com>
>=20
>     > =C2=A0 =C2=A0
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com>>
>=20
>     >
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>=20
>     > =C2=A0 =C2=A0
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-b=
d2d-c7cbdad1507c%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
>>.
>=20
>     >
>     >
>     > =C2=A0 =C2=A0 --
>     > =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     > =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
>     >
>     > --
>     > You received this message because you are subscribed to the Google =
Groups
>     > "Jailhouse" group.
>     > To unsubscribe from this group and stop receiving emails from it, s=
end an
>     email
>     > to jailho...@googlegroups.com <javascript:>
>     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.
>     > To view this discussion on the web visit
>     >
>     https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-ac=
e6-a38e99a441d4%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-a=
ce6-a38e99a441d4%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-a=
ce6-a38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/f1de42fc-bae2-4962-a=
ce6-a38e99a441d4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
>.
>=20
>=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-2=
50d9a7e7078%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/82a56f53-a498-4a27-8458-=
250d9a7e7078%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/211c06d2-9f92-cbd1-8215-12c577eefa62%40siemens.com.
