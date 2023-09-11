Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBEHG7STQMGQE3OQ3WUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF5279A9C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Sep 2023 17:32:34 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id 4fb4d7f45d1cf-52c55b44141sf3189264a12.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Sep 2023 08:32:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694446354; cv=pass;
        d=google.com; s=arc-20160816;
        b=0eMiooP5uypJf7MAplV2j+f59jBhOGeVn3qPn3U6CCKm1cQGAXD7RiuCAQVeTTbTxl
         7QsKLQPZmAz28e47r1S+mBnXL8w26NqnbsiXZJ0yi/FET8gPVUtHZte5+7yuu5a9mrnu
         9f7sAiaIGM+ItOsUOM5nZUe4eH4DWGPHQd71Wy744YqX7F1drKbxFrndizmSeGabixq5
         EmICnZWBspxYobaKa+D/sYFkNJrUqJMqXC7ZVBlu0EwHUozMhLxjBobILrLe/lCK4BGc
         sGnG6Z4U1G+sgC3gs+kkaGEoOOyXDq8jJTUH7EgSCrQV2pUauJ1L09nnaJDBAbEhs+vV
         PulA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=DriE5ZQGg2EXjgle8JqILAvWI2d07T8k93OexysLJ8k=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=UMvI6YOtoV/TfskpEsX/GMJY7LrCdKx01VAvXTwpAsbx+9WpUy8XVkEtKP2/oTzOCg
         T10rS8cxUlestVkkMZPUFep+1VFTMWX5apHpsA6JZwaffoslBLnI+BAhHTXhXaXXam50
         kp6G+4nLzi9KboRcHI/XzQ6NwzqOzEpopBVcXUnIR3phFCjFkK9Q0ZDaINgE5+MIbQe8
         uxo2hCANLxQDwydNz2FqodX4mAuBUCeleljWievriQREBZBeb4i+eRLSzht3QzeF/1CB
         5Zzu/JcLfi9a3LrCtLj0lRQTPRw/feQZu6YiwyZ2036GqkMWYP37STBXNkVpzdsEfcAv
         txEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sfkVZPIR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694446354; x=1695051154; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DriE5ZQGg2EXjgle8JqILAvWI2d07T8k93OexysLJ8k=;
        b=eCgPweUhtYMm6HkzHv56QhLzFFqWF3Vv1ccxErU9kfjT1TcvbPFLpjX51n/38eWshu
         8u5cFahPSo3+MG9hoJIKoXoLsPXkC3FBmG3hnLFE72qWexhVw25Xnb1ir/wKZ6KdDTc1
         iuSgq1VPkn3m+nNQ6LcuXVuQd39yBGET6eB1LhAaLcIZs8orh1daWaliDRrqF67O0gM3
         sXPJDgF5nOZAgrSKG+t+qAFlGJtCQiugn0bzGaPWIDQ36xlykNExV+cpss0UXm0GNGH6
         aRUUu4kFPigfKAeAHURMUlqifi8FougjnmOsD9OW/uy5Mm+EVH0HACyRvfoF3bTpsllu
         SnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694446354; x=1695051154;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DriE5ZQGg2EXjgle8JqILAvWI2d07T8k93OexysLJ8k=;
        b=jk+07+AXykjaA1MQrwVeviDxTqYDPiQag1Tzte4kuZsohzx7LjUp0UeeB8oROFFzQB
         JG9w5/1F9gWOK49qKU6cuYaYQozskeTuti8PkyaCivHTBzDxoPFoi5mcHSL0QEWoQNq4
         swJBGpezlDHde+BxkKGXxa4SIgtCrjW5nyEAtBZyNlWWoAIOBh1kUaLdQ7l3DVwCyr5q
         D2eDN/t9uMdfN/FUkWM6qAPdaZlQ+Zj04wg4bLKVHfVGPt0NA4FJIQxiIrbP5Lmdd5ai
         KMCM9TI/HArWmIopJmVLl6MBefyhQooskZWF2CATWeHM6oLNnEC6DAh5HjC1GGX2ESjp
         4ktw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyZ3nN66T1lMDUyo/6PKPgFjaieJvfU2y3NRlh1cdX3IYDD5QSz
	h6+r4m/K2f0h+RUIPIdhiX8=
X-Google-Smtp-Source: AGHT+IExud+YxIAE1EKfP3FbKQ+ScZGObkTJ+Hv/mZ9VwYwtPUdePD5n/g4mU56ZpBVpK+caNtsy9g==
X-Received: by 2002:a50:ed03:0:b0:52e:1d58:a6fc with SMTP id j3-20020a50ed03000000b0052e1d58a6fcmr8283607eds.5.1694446353504;
        Mon, 11 Sep 2023 08:32:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb0d:0:b0:525:5162:2bbc with SMTP id d13-20020a50fb0d000000b0052551622bbcls2155348edq.1.-pod-prod-08-eu;
 Mon, 11 Sep 2023 08:32:31 -0700 (PDT)
X-Received: by 2002:a05:6402:2b8a:b0:52f:2bd3:6f4d with SMTP id fj10-20020a0564022b8a00b0052f2bd36f4dmr5469086edb.0.1694446351154;
        Mon, 11 Sep 2023 08:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694446351; cv=none;
        d=google.com; s=arc-20160816;
        b=OoFNMx2YepAdXmRmljm4Jtmxe4yIMQ4kOIe57mkeshJgTP+B8fzuMghecBKntwjoNx
         2EofmHEYrDBO+DPSOGPldM5W+zbTk/dNn5RYosNIjGx+VI0tDusxk7YWFy4ce8Cvqz9s
         KEF8rL4KADCpZFVbg09AdcPyfVzo9lutosBUbaCfyw3CxctZJdDL/Eag/E7Rk/6/YI4g
         ZpuAGqHREvh6DW5SLMqatMpg6Pef+dq0uocTdGvmDOPtu6PWRzp/5YwGDU+3/tZI2cxD
         OcQnAgcZC+F4g6IoAJlclPUNJ3x+qU7Y9HuRFBu5XwK4tZxKkHCP7qgv+o+o7JSRT0lK
         pH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ACPGzm9WBPbPnY2BlIiCFxsI2jqR1EzIrbQQ8Tpr7jw=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=0qpdvqviQSK204ZYCkNhUr+njmwehz8f3+2ZVJxegd5U084xeSpr1qQKA5AmqEQiiQ
         OHysspIFkDa9Ls+eUjaikJE/m1KF/h1436Q85FFlbxGDCBrXQAVn1WgDVvHqCRPoVM3P
         fupYjA4eAZWqydNm3V9GiLbsDnbqCB8eyVWwZnknELL4abb7HTyoDRhpFUyhIOSoqA2O
         X3TmTWQtBj7hKGyb+htZ4vf4rRnGubvkA1HD8tETFzwoxmJl5bkFg8ZCXpYR/NGmwOY0
         YCwvgwssKuVrnAsEJHhARGUOB8MLUF2/5uRO34e2tqYRhsdQ5SqSQKgoE+BR1lw+s6xZ
         S3aA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sfkVZPIR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id d35-20020a056402402300b0051fe05f750asi636985eda.2.2023.09.11.08.32.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [194.95.104.11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 16B452A0121;
	Mon, 11 Sep 2023 17:32:30 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4RkrLj5zSlzxq2;
	Mon, 11 Sep 2023 17:32:29 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 11 Sep
 2023 17:32:29 +0200
Message-ID: <17cc3819-f515-4be0-8302-16333e580a22@oth-regensburg.de>
Date: Mon, 11 Sep 2023 17:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to set the value of pci_mmconfig_base in rootcell
Content-Language: en-US
To: bot crack <unintialized@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n@googlegroups.com>
 <e1577ac3-ab02-4fe4-9641-b56a923d6fb2@oth-regensburg.de>
 <c9479468-1514-439a-a775-5eb2d25877f3n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c9479468-1514-439a-a775-5eb2d25877f3n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=sfkVZPIR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 11/09/2023 07:25, bot crack wrote:
> hi,
> Now I change my a configuration to:
> /.platform_info =3D {
> .pci_mmconfig_base =3D 0xe0000000, // virt address
> .pci_mmconfig_end_bus =3D 0,
> .pci_is_virtual =3D 1,
> .pci_domain =3D 1,
> /
> /............./
>=20
> Then I didn=E2=80=99t see the error log
> /[ =C2=A0 35.130190] pci-host-generic e0000000.pci: host bridge /pci@0 ra=
nges:
> [ =C2=A0 35.130241] pci-host-generic e0000000.pci: =C2=A0 =C2=A0 =C2=A0ME=
M=20
> 0x00e0100000..0x00e0101fff -> 0x00e0100000
> [ =C2=A0 35.130295] pci-host-generic e0000000.pci: ECAM at [mem=20
> 0xe0000000-0xe00fffff] for [bus 00]
> [ =C2=A0 35.130457] pci-host-generic e0000000.pci: PCI host bridge to bus=
 0001:00
> [ =C2=A0 35.130470] pci_bus 0001:00: root bus resource [bus 00]
> [ =C2=A0 35.130480] pci_bus 0001:00: root bus resource [mem=20
> 0xe0100000-0xe0101fff]
> [ =C2=A0 35.130519] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
> [ =C2=A0 35.130545] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000ff=
f]
> [ =C2=A0 35.137255] pci 0001:00:00.0: BAR 0: assigned [mem 0xe0100000-0xe=
0100fff]
> /
> /[ =C2=A0 35.137602] The Jailhouse is opening.
> [ =C2=A0 35.251548] vcc3v3_lcd1_n: disabling
> [ =C2=A0 35.285180] psci: CPU3 killed (polled 0 ms)
> /
>=20
>=20
> Then I insert uio_ivshmem.ko (build from=20
> https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse)
> /[ =C2=A0 35.287908] Created Jailhouse cell "inmate-demo"
> [ =C2=A0 50.988039] uio_ivshmem 0001:00:00.0: ivshmem_pci_proben
> [ =C2=A0 50.988085] uio_ivshmem 0001:00:00.0: enabling device (0000 -> 00=
02)
> [ =C2=A0 50.988548] uio_ivshmem 0001:00:00.0: using jailhouse mode/
> /
> /
> /
> /
> Then run /usr/local/sbin/ivshmem-demo and it will show mmap failure.
> ID =3D 0
> Maximum peers =3D 3
> /usr/local/sbin/ivshmem-demo: mmap(state): No such device

I never used uio-ivshmem, so I don't know internals. You could use=20
strace to see which mmap fails and why.

   Ralf

>=20
>=20
> Why does mmap fail?
> On Saturday, September 9, 2023 at 7:38:59=E2=80=AFPM UTC+8 Ralf Ramsauer =
wrote:
>=20
>=20
>=20
>     On 09/09/2023 08:04, bot crack wrote:
>      > Hi, everybody
>      >
>      > I encountered some problems when using ivshmem-demo. How should I
>     set
>      > the value of pci_mmconfig_base?
>=20
>     Set it to a region where it does physically not collide with any othe=
r
>     IO/Memory.
>=20
>      >
>      > my rootcell:
>      > /.platform_info =3D {
>      > .pci_mmconfig_base =3D 0x7BC00000,
>      > .pci_mmconfig_end_bus =3D 0,
>      > .pci_is_virtual =3D 1,
>      > .pci_domain =3D 1,
>      > .arm =3D {
>      > .gic_version =3D 3,/
>      >
>      > .......
>      >
>      >
>      > my linux dts:
>      > /&reserved_memory {
>      >
>      > jailhouse: jailhouse@0x70000000{
>      > reg =3D <0x0 0x70000000 0x0 0xBC00000>;
>      > alignment =3D <0x1000>;
>      > no-map;
>      > status =3D "okay";
>      > };
>      >
>      > pci_reserved: pci@0x7BC00000{
>      > reg =3D <0x0 0x7BC00000 0x0 0x00200000>;
>      > alignment =3D <0x1000>;
>      > no-map;
>      > status =3D "okay";
>      > };
>=20
>     There's no need to reserve it via device tree, because it isn't backe=
d
>     with anything in any case.
>=20
>      >
>      > };
>      > /
>      > Kernel output after inserting jailhouse.ko
>      > /[ =C2=A0264.612191] jailhouse: loading out-of-tree module taints =
kernel.
>      > [ =C2=A0264.624958] pci-host-generic 7bc00000.pci: host bridge /pc=
i@0
>     ranges:
>      > [ =C2=A0264.625007] pci-host-generic 7bc00000.pci: =C2=A0 =C2=A0 =
=C2=A0MEM
>      > 0x007bd00000..0x007bd01fff -> 0x007bd00000
>      > [ =C2=A0264.625028] pci-host-generic 7bc00000.pci: *resource
>     collision: [mem
>      > 0x7bd00000-0x7bd01fff] conflicts with reserved [mem
>     0x70000000-0x7bdfffff]*
>=20
>     This happens due to your device tree reservation. If there's nothing
>     behind 0x7bc..., then simply go without reservation.
>=20
>      > [ =C2=A0264.625051] pci-host-generic: probe of 7bc00000.pci failed
>     with error -12
>      > [ =C2=A0264.625475] The Jailhouse is opening.
>      > [ =C2=A0264.792429] psci: CPU3 killed (polled 0 ms)
>      > [ =C2=A0264.794210] Created Jailhouse cell "inmate-demo"
>      > /
>      > The operating environment is arm64, linux5.10.160
>      >
>      > *How should I set the value of pci_mmconfig_base?*
>=20
>     See above, a free (ideally aligned) memory region in your physical
>     address space.
>=20
>     Ralf
>=20
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab=
65-bd51c2d0ed83n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0e=
d83n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/c9479468-1514-439a-a775-5=
eb2d25877f3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/c9479468-1514-439a-a775-5eb2d25877f3n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/17cc3819-f515-4be0-8302-16333e580a22%40oth-regensburg.de.
