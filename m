Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTNS5TUQKGQEU2H4BCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id F398A76C71
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 17:16:29 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id f3sf34263854edx.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 08:16:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564154189; cv=pass;
        d=google.com; s=arc-20160816;
        b=k+XktWjcb4F73qnlpo4Cqnm3USYLDH7NsH6k33RSADyHPrd+5uUNGBEzq+unBwh0JK
         QQfjNojAuvVnDfo6jJsroNvCKGNaXlZF/kj71eGi20NNONwA3ixtk74gGbo3H7je1Mdk
         fBztd0DUgo3eKxB9VqHZEN3uoQfEHmazNH6Fv+T62ptcl8C3S/OseLaL/SK11GYbSmcd
         2w5d8A4ZONjPWYx+MWqLzNo5DkaL5vTHmSK1CEhqBv5ycZ4PVEM5Rjf0xOxNVgMx4GeB
         5Yh+fD/zUtUdCwSZWG5vVhlfYri0Yax2f6dKPttCbtGxUygbIabwQt+7vqcVQQEO+WOk
         sdKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rgH6ZqxgqUsKOdznECu3+995zJJwA+Fs9MW7gX3kD+w=;
        b=hmcz8v+J3zjImbMloA0e0AdSRGMUNNuU+I0TOCiXBxamuBPu1s3YvFolEq1z8F5lIU
         pPL0g0tJTBvfLcUpPF46APPltntnRsSppIUsJt/8sxqPtHWKUH+uBUEx2uQSahqyALRQ
         eCtP+uK+vgbwj05d129QHuZE/fUGlK2m+8SjJJHfWGU/35yOmoe2RsSqyn/WNc3nWtFR
         vRszJsrdR2dKb3hIUpmXZOEyzzeKjSIQZ5NUDpm68gEYtJr6bAgZTdTrCZg16NRAl3Qa
         xGxWVbXOxQ1F5d3r/SjwYqpNxVPzUNWxEHXNCx58fAdcUXXSV48Aj18AzkuCCfwyWDV9
         ACug==
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
        bh=rgH6ZqxgqUsKOdznECu3+995zJJwA+Fs9MW7gX3kD+w=;
        b=P5wvd2TNPz55uodM3/xJ9I+qlFPEsEIH4avJCTHmbE2oKjWt8pp5HKWqodjOcQX5CQ
         pKhwRHLFck/GqJ6MNu5ChLYu0c01xmpmDDskqjW3daO67P0wZOnkNxQBL7k3jHVc9gL0
         AKTAtN3bkvANMIWwekuIVCIbTouDd8nismpQX4m6zP8/NNyUj9kDm0PV/VhnEvHATezn
         Oc8RdnPsDoLVl2IXZ0O4CQ7s2lyi1DXbWa6trdX1WvolbghPo/KkDC9NAB7GB9RQixkd
         g9El7QyO+bDLLF/iMWiT7+CWX2KV/x7DqYXxUvXdrAbbedO9cBLiMmF8xbW/bkrvXxJX
         iGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rgH6ZqxgqUsKOdznECu3+995zJJwA+Fs9MW7gX3kD+w=;
        b=h8ymaA2lkTSWiODhlBmfb+mjm3CG7hHo6EfSGqN4zSyPvfRgbkfitgkpH3IdNq/Fp5
         AFLG3dWFYmfYFJiZSIFTHrMmGXnGcTCr6tkXh8QIPtRULe5czRfKo2fKLebRyuhSFgoS
         vfScNW/geJfORxNItYowsEAouYPamwu6kH8sBEljrKCkCyqs/4CdT2ltR8CKse4fVln9
         kxthG2r4q6F4sCbZIhvpg3F22w2Smhd+SR8U4lwJxX6wZzCAYL/GxmEmhNZS3bhmrsY6
         Ozpb4q1LrnsMEamDmrO9mxtZWzdDOqM/2RIR6KTDALkxoif64kz/hDO2LMjijLkuy8pG
         jNzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKX31Kh+GYSEhJ0vGQtHJJyxci7zWXftx6SyPnMpcOENKNLeNE
	fU5lckCNGrxPW6Deh4zfhHQ=
X-Google-Smtp-Source: APXvYqwZoLD5panEh4J8EBN32k2NXYvDuk3R0CBS7Ft89fXiNMxjxwx3roCa5/P2rf5FZzR+CAHhIQ==
X-Received: by 2002:a50:b803:: with SMTP id j3mr81018426ede.208.1564154189742;
        Fri, 26 Jul 2019 08:16:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b61d:: with SMTP id b29ls12661437ede.8.gmail; Fri, 26
 Jul 2019 08:16:29 -0700 (PDT)
X-Received: by 2002:a50:9965:: with SMTP id l34mr86214146edb.152.1564154189094;
        Fri, 26 Jul 2019 08:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564154189; cv=none;
        d=google.com; s=arc-20160816;
        b=cLaKJcRdtV5jwuZtI/0V5Xm4NZypUwrBSZ3lEH0bjuTOTrpudq+21OAv4Fj/mm2QaL
         hnqnoRY/g3JwTD53YmZdB1jL1KZGZYStRWQQtfqrY6xRQ2ThSgvGnkKrSpNlDU3BVokY
         E0YTfD/t13UOhWwmVrMf3EopkPEk5T23tkCwZPAEGwgYW7/73b5i1+VDyZZUE0LFTHlg
         mwd/1w/GoCdLP/jwfpVelBw+04k1KoT5lawoCHc/l62uQ1KmzXabFqhHipz2OWTOjGRr
         eETCAuamlnhL12MAZnXA252p33yue1tDLFIYx2W7FQR00qYSrVKJNl+FfCAeaN4uaCct
         jylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=p61Fx9lZ+LpbIQ+XqUzumGd1fVux/ca68M1Jjs64TJE=;
        b=zuAL8oB0uTGj3YiRo5VKwMhsb0TEAGgAJWqN+CTasWSYmSUbcR5+WsU9UnRs5LrkkS
         9J89t1MQPE13bbjQsjmvfA9OveoWhpWrT8deR5Z03cTk1WCjDKmxEKqfm1T7UeTXlHdx
         bwUvlUSWZQq8kjkP/eh+SrNIe/37IwCW4NzLe9CChRPPlhh8ERPRViMPtAYueQTLj7lK
         LIP6/lpeYfg4rXKnEtiOAFwGtMaCFaldq1rv4IntucqCmm/w99r+DeVv5ESf1U28ZEoj
         8r4GUWLKE2eH0OJB/wQF5/XIJIBMD/fziyDNEESFn6dcCKzGLKEfMAMXZuh8EKFMYDwN
         DYiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t15si2530965ejq.1.2019.07.26.08.16.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 08:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6QFGSoe006707
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 17:16:28 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QFGSTV024316;
	Fri, 26 Jul 2019 17:16:28 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
Date: Fri, 26 Jul 2019 17:16:27 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
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

On 26.07.19 16:29, Jo=C3=A3o Reis wrote:
> Ok, i've reduced the size of the linux image to 550MB and the rootfs.cpio=
 to
> 540MB, but now the output prints "No space found to load all images". I h=
ave a
> memory region with size of 0x3bff0000 (~1GB) and another with 0x24000000(=
~600MB).

Is that the compressed size? One issue is that, when you combine kernel and
initramfs into one image and compress only the kernel, the logic of
jailhouse-cell-linux that calculate the required size after decompression m=
ay
overestimate that space demand. You can try tuning with the -k switch.

Jan

>=20
> quinta-feira, 25 de Julho de 2019 =C3=A0s 16:21:07 UTC+1, Jan Kiszka escr=
eveu:
>=20
>     On 25.07.19 14:53, Jo=C3=A3o Reis wrote:
>     > Even when i set all RAM regions to non rootshared, the problem cont=
inues
>     (send
>     > in attachment the newly adjusted config file). Is the linux image t=
hat i am
>     > using too big (1,2GB)? I've generated the image using the steps des=
cribed
>     > on=C2=A0setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).
>     >
>=20
>     If I do the math right, you are even not close to that 1.2 GB when it=
 comes to
>     the RAM you assigned. It's maybe some 700 MB.
>=20
>     Jan
>=20
>     >
>     > quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kiszk=
a escreveu:
>     >
>     > =C2=A0 =C2=A0 On 25.07.19 11:32, Jo=C3=A3o Reis wrote:
>     > =C2=A0 =C2=A0 > Hello,
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > I'm trying to apply cache coloring to Linux and Eri=
ka. As root cell
>     Linux
>     > =C2=A0 =C2=A0 cannot
>     > =C2=A0 =C2=A0 > be colored, i intend to use colored Linux in a non-=
root cell and
>     colored
>     > =C2=A0 =C2=A0 Erika
>     > =C2=A0 =C2=A0 > in another non-root cell (the system stays as: Linu=
x in root cell,
>     Linux and
>     > =C2=A0 =C2=A0 > Erika in non-root cells).
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > The problem that is occuring to me is when i issue =
the command:
>     jailhouse
>     > =C2=A0 =C2=A0 cell
>     > =C2=A0 =C2=A0 > linux ultra96-linux-demo.cell Image -i rootfs.cpio =
-c
>     "console=3DttyS0, 115200"
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > The error is the following:
>     > =C2=A0 =C2=A0 >
>     > =C2=A0 =C2=A0 > root@xilinx-ultra96-reva-2018_2:~# jailhouse cell l=
inux
>     > =C2=A0 =C2=A0 ultra96-linux-demo.cell
>     > =C2=A0 =C2=A0 > Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio =
-c
>     "console=3DttyS0, 115200"
>     > =C2=A0 =C2=A0 > [=C2=A0 127.150370] python invoked oom-killer:
>     > =C2=A0 =C2=A0 > gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NO=
TRACK),
>     nodemask=3D(null),=C2=A0
>     > =C2=A0 =C2=A0 > order=3D0, oom_score_adj=3D0
>     >
>     > =C2=A0 =C2=A0 Looks like your inmate configuration grants too littl=
e memory for the
>     Linux
>     > =C2=A0 =C2=A0 guest. Note that the in-tree configs may only be happ=
ily used with
>     very small
>     > =C2=A0 =C2=A0 Linux images, just as the buildroot we generate via j=
ailhouse-images.
>     >
>     > =C2=A0 =C2=A0 Looking at your config...
>     >
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RA=
M */ {
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x74000000,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x74000000,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x7ef0000,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_LOADABLE,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>     >
>     > =C2=A0 =C2=A0 This one is fine and will be available to the guest.
>     >
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* RA=
M */{
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x3fd00000,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x3fd00000,
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x202f0000, //must b=
e page size aligned
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0JAILHOUSE_MEM_ROOTSHARED, //se tirar
>     > =C2=A0 =C2=A0 JAILHOUSE_MEM_ROOTSHARED da exception
>     > =C2=A0 =C2=A0 fault 0x20
>     > =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
>     >
>     > =C2=A0 =C2=A0 This one isn't because it shares RAM with the root ce=
ll that is
>     probably not
>     > =C2=A0 =C2=A0 intended to be shared. But it will also not be presen=
ted as RAM to the
>     non-root
>     > =C2=A0 =C2=A0 cell (via the devices tree) because of the ROOTSHARED=
 tag.
>     >
>     > =C2=A0 =C2=A0 Jan
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
>     https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b9=
5f-ddb68083f7ee%40googlegroups.com
>     <https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b=
95f-ddb68083f7ee%40googlegroups.com>
>=20
>     >
>     <https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b=
95f-ddb68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>     <https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b=
95f-ddb68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
>.
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
> https://groups.google.com/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f=
73dc955888d%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-=
f73dc955888d%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b4e7dbee-58cd-3126-ce6b-7b54ee0ef241%40siemens.com.
