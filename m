Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3VNXLZAKGQETRRS5QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98B165FAA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 15:25:51 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id b205sf896676wmh.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 06:25:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582208750; cv=pass;
        d=google.com; s=arc-20160816;
        b=h6Ldub36GJgcMYRnnzhZx9+7Um2WTq2VdK3otIXZTcRiT4r3Q8QWpLKiitqMUjegj6
         h3NmdkHkg+Py5328K9VeaW2AlQAK+QengkZFIKB7BO/fwfNf6jP/cat+El7X7DCm/pja
         XH4IavBc4WZ7iFHxh0X2PFgKmWTQbWtceM1Zt95oZEPDVKz7Ow+AaphweWpVoEG5+E85
         WiQyPz13gedP/Y/nIAAKRbU14cKOvZKLpD8YlE0izAo2PBh94DlKtQFMfSY8EAv+XXyU
         w7AzGDvQo+5yINn9bUdt57qK9WJgDhTvvWqzRDZSNY2BmjcLHVATdU/PA1+JOrm0fCC6
         T53Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=RNCLPGv+QwdeKATi3Eux9SyaEWii4c7ofFSzoBp/FFY=;
        b=SmrXMnA3gRadYPi3++kD80g8V2UxXKpCgfchcxujnkZe/Qds4FOIOhkYT8kvMVJduy
         Dr2MRETfhng28hdXi0SWJG4vFs86ZAIn5n1HgeLR090eB6l46EbRV5q92dHr/IL/ObKD
         jOjP87eL7NaEJK7qjXN4w3mLZVPjq3Sy5O0fEozC+JMhnq/HxQ2eWoJ/0pOXJVPt/82K
         U+GjZAf0ZuuR4P+Su3sqH5VXtoxogW9uw0z3yoVWjsyAdINNk/zNO+DgMAnwsDlJMcpy
         Nuzf17scoP2upSCcOHpif02DrKPEwvmnE0/1rHHziA+d6cbtGnEL1B7chHv67Iyy6GaT
         zWjQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RNCLPGv+QwdeKATi3Eux9SyaEWii4c7ofFSzoBp/FFY=;
        b=cNk8JZXD8YQfou/ee1HKipt4GzIEnE2ri75QQZsnbhDdJYIuE4HBP2P1rL6KEmmuGS
         UcwccTyjUomBkvojWT4eE88DBYZoR1g4SrqtyQnzRURY4LVoNdPvHvX0EK7X00DICmPP
         QZ1n9+Z/38I48HsjBKjaM3/3fMKuiWfiMKrSHRHj9NieZVVZiHlvHuhKK0mspW7NiCWv
         dq3Kfgm3i/ICLj5eNBYS/PlLO0GZQAoN/d4E1gd6wXXdmd2Ju+s4CN3iN5s+6u0iUxLG
         zFPQw37M3aQ+Q8L0WmcQvHzJOufXj2cuHo+NrqdUCAjJD+woDSStg2lhMQCXvO1R5pRt
         MKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RNCLPGv+QwdeKATi3Eux9SyaEWii4c7ofFSzoBp/FFY=;
        b=I7ba+mM7mGMABe0lbY1LR9eJUuf0rDdtruu9RPbeRE8b1+C8U9H4PCCCqqhqbGHjCW
         YDfJfFsxdXrgVFCGjAThcXhN/HV55sUu6NOl9wOGDlugWliQV4y44iDJiQeUkKlX3SKB
         5R/w7rP4dvoCjEoRKfOiVU1y/endJNKJvF8qgcVcqSVpLXt4MuxRZiZhkVDsqlhvvBuJ
         q2BssUi6bBY7//FpLRRyU7dHzBboEIQxMUiqeltLgn1c+xD51QqFGbzC8W96QYq49TcK
         cce+eAHMvvL0BbphcUi6a5Lx2Wx3ixoBrxQsHwYgZ5TEdQ1zMkvJD0sQyn8IYRX1CQK1
         q5bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8wxgL4r7MKo3w41CuaBPkR5fJPaTH6AodB528nSv3W8fn3oQ0
	cd9ncCrM5TKT54O7xTNAgiM=
X-Google-Smtp-Source: APXvYqx5utC1b45hIY9LDxQynR6ZjqXiG16HLw2La0Gx5BGr8BGMfq1+L+KB/fTu3LZaJxRG9uVSrg==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4782064wmf.75.1582208750747;
        Thu, 20 Feb 2020 06:25:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fdc5:: with SMTP id i5ls11590035wrs.9.gmail; Thu, 20 Feb
 2020 06:25:49 -0800 (PST)
X-Received: by 2002:adf:eb48:: with SMTP id u8mr42208486wrn.283.1582208749853;
        Thu, 20 Feb 2020 06:25:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582208749; cv=none;
        d=google.com; s=arc-20160816;
        b=Yc5JITV3uV325xrB4I23gTavOOh9ygTp/NbgHR8U5zgrnIhjcyr25lQEtDAM4CccqF
         6ncmkKLCErkvsH7U9TMaswlnECDDY+9QXvblEy3IZ6LOtLYroj27jz4fgVl7XqHt6SJX
         /+BOK3Gfw2uCZICW0VqTFNJN8hAB+OZfXMgXU2DVLBq2FeS3YnErz/OpovoD1VALwuxC
         zoDmrTUidgJDLmPPWO/SmSNkkdUQwrxu9IMS4P2KwYw4SQ1R2baNvPInfAUxYfAcb55a
         dCJLl5QchOr7a+loPqBeglYYBYGqqwsImAVSPbbNgXyBuUiJG4mZGQjN11l5jr8lbD/e
         b/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=AD7ysYh4OHoZSE7YZy9VbtMmOsYrJuKmJ1PVjd6udDU=;
        b=o6Oh/p8K9rMfuvOm2xxPYOSYOaSvAre7Kzuqa4NdpOd5Br0wTplSWut+QhDy4RWlZ+
         Xe+vuEFabPhynqSycWUsOFdDXlqFMz3P0Tp4g52M9nrr1BUUA/+zjvhY09Hxo8s2NeVb
         MV/ly6ZsmAmfAZAL7Y/xGqMv8kR79gAOmbLt3/lzqFqfZpFO7e1og1lY65tF3D7yOgfs
         GYIGhmBrSdMiC7/WIcxv6Yeh7gXP387hkWu99f+LOR834qMyNp19OMb+SEXi1ztHTlue
         QIYXNMlF7XeKXUgnwgLrD62QVibUzxXnnoaWFN8uNG+dnp7ZEU0Ap5/Dj/i+f153+t3m
         dI/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d16si177737wrv.4.2020.02.20.06.25.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 06:25:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 01KEPmQE010825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2020 15:25:48 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01KEPlsP020127;
	Thu, 20 Feb 2020 15:25:48 +0100
Subject: Re: Linux non-root cell tooling
To: raymanfx@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
 <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
 <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
 <ba1334c7-a13c-fdea-7177-53ad21c23244@siemens.com>
 <221c5f40-594d-4b11-ab0f-dab66585471f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e088a0bc-e100-5acd-7268-a33c134ad821@siemens.com>
Date: Thu, 20 Feb 2020 15:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <221c5f40-594d-4b11-ab0f-dab66585471f@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 20.02.20 14:05, raymanfx@gmail.com wrote:
> Am Donnerstag, 20. Februar 2020 13:24:24 UTC+1 schrieb Jan Kiszka:
>=20
>=20
>     PIO access has no "shared with root cell" mode, like memory regions
>     (and
>     there is can be dangerous): If you grant access to non-root cell, the
>     root cell loses it - and may then run into own violations. I don't
>     recall what triggers access to this port, might be the SERIO things,
>     but
>     it can be configured out.
>=20
>     Jan
>=20
>=20
> That makes sense. But that particular PIO range was not activated for my=
=20
> root cell sysconfig by default, so I figured enabling it in the non-root=
=20
> cell should not cause any issues.
>=20
> Following up on my first email today, I built a guest kernel using the=20
> amd64_defconfig you linked a few days ago.
> But no luck. I'm stuck at the exact same output I pasted earlier:
> |
> Startedcell "linux-x86-demo"
> CPU 3received SIPI,vector 9a
> |
>=20
> The linux-x86-demo config I am using is the following (modified from the=
=20
> 0.12 release):
> |
> diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
> index 47cb6517..0f1e6d9e100644
> ---a/configs/x86/linux-x86-demo.c
> +++b/configs/x86/linux-x86-demo.c
> @@-25,7+25,7@@struct{
> #endif
> structjailhouse_cache cache_regions[1];
> structjailhouse_irqchip irqchips[1];
> -structjailhouse_pio pio_regions[3];
> +structjailhouse_pio pio_regions[4];
> #ifdefCONFIG_QEMU_E1000E_ASSIGNMENT
> structjailhouse_pci_device pci_devices[5];
> #else
> @@-38,7+38,7@@struct{
> .revision =3DJAILHOUSE_CONFIG_REVISION,
> .name =3D"linux-x86-demo",
> .flags =3DJAILHOUSE_CELL_PASSIVE_COMMREG |
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,

In fact, this flag is not evaluated by the Linux kernel, only by our=20
bare-metal inmates so far. See below for how to tell the kernel to use=20
that console.

>=20
> .cpu_set_size =3Dsizeof(config.cpus),
> .num_memory_regions =3DARRAY_SIZE(config.mem_regions),
> @@-47,6+47,12@@struct{
> .num_pio_regions =3DARRAY_SIZE(config.pio_regions),
> .num_pci_devices =3DARRAY_SIZE(config.pci_devices),
> .num_pci_caps =3DARRAY_SIZE(config.pci_caps),
> +
> +.console =3D{
> +.type =3DJAILHOUSE_CON_TYPE_8250,
> +.flags =3DJAILHOUSE_CON_ACCESS_PIO,
> +.address =3D0x3f8,
> +},
> },
>=20
> .cpus =3D{
> @@-186,7+192,7@@struct{
> .irqchips =3D{
> /* IOAPIC */{
> .address =3D0xfec00000,
> -.id =3D0xff00,
> +.id =3D0x100f7,
> .pin_bitmap =3D{
> (1<<3)|(1<<4),
> },
> @@-197,6+203,7@@struct{
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE(0x2f8,=
8),/* serial 2 */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE(0x3f8,=
8),/* serial 1 */
>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE(0xe010=
,8),/* OXPCIe952 serial1 */
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PIO_RANGE(0x80,0x10),
> },
>=20
> .pci_devices =3D{
> |
>=20
>  From what I understood from your comment, this should print the Linux=20
> output to /dev/jailhouse, no?
> I'm sorry if I'm missing something obvious here. My plan was to prepare=
=20
> real UART for more serious debugging once Linux is starting and loading=
=20
> an initrd.
> My non-root cell invocation looks like this (modeled after the=20
> documentation examples):
> |
> jailhouse cell linux linux-x86-demo.cell bzImage -c "console=3DttyS0,1152=
00"
> |

Yeah, to use the virtual console under Linux, you heed=20
"console=3Djailhouse0 console=3Dtty0" (that second console is to avoid a=20
panic because the virtual console does not support input). Make sure=20
that CONFIG_JAILHOUSE_DBGCON=3Dy.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e088a0bc-e100-5acd-7268-a33c134ad821%40siemens.com.
