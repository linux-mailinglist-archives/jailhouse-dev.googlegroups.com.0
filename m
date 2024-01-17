Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYPCT2WQMGQE53XOOLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9338303EF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 11:52:20 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id 2adb3069b0e04-50e7f357b04sf10975905e87.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jan 2024 02:52:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705488739; cv=pass;
        d=google.com; s=arc-20160816;
        b=PKVi1BabmtYYjma+7f5do9jeZn9Xm+kZTaY1mI/1Q2TzOKSj4Iu76Zszd6hd3XlLXH
         Tqu5e1r3iQOPpn1BeKDT3SLQR3fvP1EOLNSJzypeQmb1nFyLSSDI7vt4fZ4+8HuP2+EU
         0hTLZiA3lrwqqaWjc06RQD0/vPCHOhQqWBFg7T950c7kPWUPUrnTwTqhxgCvOkSP7rmt
         Gi34qbaFeJiQye3DG2rqwpZ3800LE9EhOOuzI9TBP1OLQnvjxIn3UdDya516wya/jHXc
         p+aYITK0tCTK3fjdUZfvb1j8rhf0XcH+yPArN8yEPe6jYoakf/0356FgTKG9Ox9XBLI4
         roEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=61vg8U/yycMsbC7G0qiSAe6kj+Pa5cq9KPwjZuBIyYM=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=AXG0i9IGGSmW0qi7E2VQU7sPyCF9GIbyjvDYiYuKk/VchVA+5kqweU/r6/J9Nejsx0
         qLL5WFZuBm6vL5tGcJfbuob3+RaAZNyVYTKzru+B22j1gVBMPGtPAklKg6b3JQF+XgLq
         q7hmmLRlcnpGo1Ra/QUahxY36jUzMStB0hHE8igYEHUSSaTJlAua0/kZrtzxlIZYNDIz
         QEhPUR7DbiLDGsZ3vhmF4LCCjblYboTU/aEZQIfx57eLu8DjvqKse68FApTfzh6ml6np
         BP2bMFnbXYxz2m4yO8pkuJoxsMBE4C4tYXeIJ+f25+/pErcKLj7GJwihg3AyKBGGL38b
         Mj5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cqvn+3hB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705488739; x=1706093539; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=61vg8U/yycMsbC7G0qiSAe6kj+Pa5cq9KPwjZuBIyYM=;
        b=Bsk+f86SE5TESlFRp/Yo86FP7DlThZbXPkbAr2MBd2TC6u9A/ytEZfZlMVS+bz6TdM
         8DikgPV9weB3cWXQUhW9AhBsaSYYJ+51GW0uumme7jtYVBdtQIZHpFm63CFRJIkSYEFA
         BHbwjKIfgXcA/G8md8gtLDV3iC+sh/qd+PD9P+0JZvv21d+9SFuy7jpKuqKB76bAMrqg
         aGRuQ481NtrMlB/b2dKa1ogE6rtO74qjnv2+MuQz0BCuntMjFPvUhgRAbQ43t1ny7iKN
         8e3cKEUXtwaUqBf9pmlTEvskE0nxf2OX/ruJwvRqGp2m/i0prtewkcWM51CtNOe9G3Mv
         xUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705488739; x=1706093539;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61vg8U/yycMsbC7G0qiSAe6kj+Pa5cq9KPwjZuBIyYM=;
        b=vLX0yO1ibXnTUFkWu72OJKt1MbVAE7LRQDHjtyb4XVQE7Uvs6F6oqUbGjXhAaWKQNY
         oFtx2/ta1+zYlm0gDep1uAXEqAQpcWE6/VfBO/W9aGGK7Z+Hlyu9hAMlb9Yt1lIkSW1N
         0j3WI7h6qtMuzeeLCEsOI3Z7ZEUESCLr2xhp/Hv75Qrcmpd4iIDeHQfFt7GyBfMgUuWP
         1Yf/zUi0hm7tUcYhzC9HrEcbd6GlDfbqmMHpFX5TTzieqt8aXP75osX0xu2SNtLdrF0U
         lBQrUW/P3ybFmCNCyIaaPBFbp1JdJTGaXTjKwYO/k45swelNLjUPvzwartZbJGsfTYpH
         6pAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz1w84vm7uwW5SjMCwHpZCyuLhOiXsXNNOU5h5aciUHMjWjN5Uh
	5+IYokBtRDSewdnXJ/m1cYU=
X-Google-Smtp-Source: AGHT+IFS9ulyj05effA3ugHcU0ld7114+SOL7DXHMueT2wyEvjxTK/Mcpn2j7qacCc5KlC5O8WeSVw==
X-Received: by 2002:a05:6512:3124:b0:50e:6a9d:b3c4 with SMTP id p4-20020a056512312400b0050e6a9db3c4mr3907235lfd.128.1705488738051;
        Wed, 17 Jan 2024 02:52:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:ba8:b0:50e:37ff:9fec with SMTP id
 b40-20020a0565120ba800b0050e37ff9fecls631795lfv.2.-pod-prod-07-eu; Wed, 17
 Jan 2024 02:52:15 -0800 (PST)
X-Received: by 2002:a05:6512:3196:b0:50e:b413:400f with SMTP id i22-20020a056512319600b0050eb413400fmr4257699lfe.49.1705488734758;
        Wed, 17 Jan 2024 02:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705488734; cv=none;
        d=google.com; s=arc-20160816;
        b=uxZRDUhMA4MfkWE+XKdx7mVv3FRuO+EVTI2tnMaBwG8CCIQoHLLW1cZn1A8vWD8mVy
         zzc2YLnOFwVtrO3Us8AMzLADpbLZ1O0R+KFYwZp/koGDTjJUA2F/T+47b+0YCotzaM/6
         VoHcU1sv6lt5MzqC64M397gKdeNUaA4ZouxXZUkQrzBOrFk9c8CqttxPzLxnK4KJqoHw
         Fiv5otIilxdpVUIHvvOAKxGg1SnKKbK72BXbeU/iHbZ0B9oeMcnBmDhpgBqiA2vwNhbT
         x025EysfFzmJRro1Bp9giXkTObeMICt7vLbS5lxSK/Am0zLNylJT9IjRJguYEE9LI0KK
         1+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=55f/fnTiWR1bdkDUgXsnI+tT5j1+JB+J0yvgRyebxyQ=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=Xh3T3Z/unFu6TE8snPoqg0wVvFSuZZz0ROnIi6y4bfjjncBpT/clTh5ElNjgb/aVRh
         jq0SNNpx4ijUNgt17z+fS0jI5cNPMWmsD9349eNyGf4y9TB3ndwA9jfCME3W+Opdx3ne
         Cym/jtWDB1NfEfm3ly2cWGg3oXWjoILP1apgKZVrj5s/pmqZt1Yx0AduhDeBBuKftUja
         MOKZc6hoQTw5GWSDUc3NKTy5IndWqhX85H3yZPpJIHHNarOdtvcdHOeWKAwf1ZZwemRr
         bAY5A0UXMotP0EHdnM70P8hp9GFmibIKKDDyLGKR9zqUVcDU/3rqmq1sifmN7rZtoDip
         zMDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cqvn+3hB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id j16-20020a05651231d000b0050e6b19b855si38477lfe.11.2024.01.17.02.52.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 02:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id B4E592A01D3;
	Wed, 17 Jan 2024 11:52:12 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4TFN4D3S4dzxqw;
	Wed, 17 Jan 2024 11:52:12 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Jan
 2024 11:52:12 +0100
Message-ID: <5fc9ef1f-e7ca-496f-aab5-c085c4586326@oth-regensburg.de>
Date: Wed, 17 Jan 2024 11:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
 <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
 <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
 <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
 <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
 <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
 <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
 <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
 <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=cqvn+3hB;
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

Hi Michele,

On 16/01/2024 20:44, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> I'm trying to give network access to the non root cell, however it seems=
=20
> that I'm not able to pass the right PCI device. It always defaults to=20
> taking away the 00:00.0 pci device from the root cell causing a crash=20
> for the root cell.
>=20
> In both the root and non root cell's configs I added the shared memory=20
> regions using the macro JAILHOUSE_SHMEM_NET_REGIONS(0x60000000, 0) for=20
> the root and using dev_id=3D1 for the non root. The resulting regions do=
=20
> not overlap other memory regions, config check does not return any errors=
.
>=20
> I also added the following PCI device in both cells, where=20
> .shmem_regions_start is assigned to the correct index for the first=20
> shared memory region created using the aforementioned macro.
>=20
> /* IVSHMEM: 00:05.0 */
> {
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 0x0,
> .bdf =3D 0x28,

[=E2=80=A6]

> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> .num_msix_vectors =3D 2,
> .shmem_regions_start =3D 0,
> .shmem_dev_id =3D 0, =C2=A0 (1 in the non root cell)
> .shmem_peers =3D 2,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> },
>=20
> I tried using different values for the .bdf, none of which were already=
=20
> used by other devices but none worked. The root cell always sees the new=
=20
> device correctly when starting the hypervisor, I can also see it with=20
> lspci and ifconfig, however once I issue the cell linux command to start=
=20
> the non root cell, I get the following output followed by a streak of=20
> errors from the hypervisor, forcing a manual reset.
>=20
> Removing PCI device 00:00.0 from cell "RootCell"
> Adding PCI device 00:00.0 to cell "linux-1"

.bdf =3D 0x28 doesn't correspond with 00:00.0. Would you please test your=
=20
current configs against jailhouse-config-check, and in case of no=20
errors, would you please attach the current versions again?

Thanks,
   Ralf

> FATAL: unable to get MMIO instruction
> FATAL: Invalid MMIO/RAM write, addr: 0x0000000106d8c020 size: 0
> RIP: 0xffffffffa910ff4c RSP: 0xffffab85400f7de0 FLAGS: 93
> RAX: 0x0000000000000000 RBX: 0x000000000002f170 RCX: 0x0000000000000040
> RDX: 0x0000000000000414 RSI: 0xffff8b6000955400 RDI: 0x0000000000000001
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000000106d8c000 CR4: 0x00000000003506a0
> EFER: 0x0000000000001d01
> Parking CPU 4 (Cell: "RootCell")
> (etc..)
>=20
> I'm not sure what I'm missing here, CONFIG_IVSHMEM_NET is enabled in=20
> both the root and non root kernel config, I also enabled=20
> CONFIG_PCI_HOST_GENERIC in the root linux as suggested in one of the=20
> conversations on this site.
>=20
> Thanks,
> Michele
>=20
>=20
> Il giorno domenica 14 gennaio 2024 alle 15:49:40 UTC+1 Ralf Ramsauer ha=
=20
> scritto:
>=20
>     Hi Michele,
>=20
>     On 14/01/2024 02:18, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > There were PIO writes to ports 4e,4f,2e and 2f, each of size 1
>     and each
>      > one on subsequent restarts. I'm not sure how to figure out what th=
ey
>      > belong to.
>=20
>     Easy and straight forward: Read the jailhouse crash dump.
>=20
>     Look at the program counter, and maybe the return address. Disassembl=
e
>     your kernel (objdump -d vmlinux) and lookup that address. Now you kno=
w
>     the name of the routine in the kernel that caused the crash.
>=20
>     Don't simply whitelist ports. Only whitelist them, if you're sure wha=
t
>     you're doing.
>=20
>      >
>      > CONFIG_ISA_DMA_API is already disabled.
>      >
>      > I missed the irqchip for the uart. However as of right now I just
>     copied
>      > the whole fragment from the root configuration which means I
>     could be
>      > taking away other interrupts from the root cell, I still have to
>     figure
>      > out how to tune that
>      >
>      > /* IOAPIC 13, GSI base 0 */
>      > {
>      > .address =3D 0xfec00000,
>      > .id =3D 0xa0,
>      > .pin_bitmap =3D {
>      > 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>=20
>     With this, you take away ALL interrupts from the root cell, which you
>     don't want to do, you only want to take away the interrupt that
>     corresponds to ttyS0 (i.e. Port 0x3f8).
>=20
>     See here: https://en.wikipedia.org/wiki/COM_(hardware_interface)
>     <https://en.wikipedia.org/wiki/COM_(hardware_interface)>
>=20
>     COM1: I/O port 0x3F8, IRQ 4
>=20
>     So you want to only assign IRQ 4 to your non-root cell. See
>     linux-x86-demo.c to see how that works.
>=20
>      > },
>      > },
>      >
>      > Still, now I can finally login into the non root linux.
>=20
>     Excellent!
>=20
>     Ralf
>=20
>      >
>      > Thanks,
>      > Michele
>      >
>      > Il giorno sabato 13 gennaio 2024 alle 21:09:28 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi Michele,
>      >
>      > On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
>      > > Hi,
>      > >
>      > > The problem was that the ram regions in the non root configurati=
on
>      > > weren't detected as such because of the missing=C2=A0JAILHOUSE_M=
EM_DMA
>      > flag.
>      >
>      > Yikes, makes sense.
>      >
>      > > After adding that, I also had to add two pio_regions because
>     the non
>      > > root linux was crashing because of two ports which aren't
>     present in
>      > > /proc/ioports.
>      >
>      > Uhm - which PIO ports? Don't simply assign PIO ports. There must
>     be a
>      > reason for them. What ports did crash?
>      >
>      > Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefor=
e,
>      > you
>      > have to activate CONFIG_EXPERT first.
>      >
>      > I *bet* it was i8237=E2=80=A6
>      >
>      > > I also had to add mce=3Doff to the command line because i had an
>      > unhandled
>      >
>      > or disable CONFIG_X86_MCE.
>      >
>      > > MSR error, I'll have to disable that in the kernel config.
>      > > At this point the non root linux seems to start, I see the boot
>      > log. No
>      >
>      > Excellent!
>      >
>      > > way of interacting with it as there is not a login prompt or
>      > anything, I
>      > > think I need to ssh to the cell at this point, right?
>      >
>      > Was the initramdisk loaded correctly?
>      >
>      > Did you assign - in your non-root cell config - the irqchip and th=
e
>      > corresponding interrupts of the uart?
>      >
>      > > That means I'll now need to work on those ivshmem net devices.
>      >
>      > If you need ivshmem, then this would be the next step.
>      >
>      > Ralf
>      >
>      > >
>      > > Thanks,
>      > > Michele
>      > >
>      > > Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf
>      > Ramsauer ha
>      > > scritto:
>      > >
>      > > Hi,
>      > >
>      > > On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
>      > > > Hi,
>      > > >
>      > > > You are right, I got confused about those addresses, my bad. A=
t
>      > > least
>      > > > now I know that config is the correct one and I don't have to
>      > tinker
>      > > > with it.
>      > > > I'm back to a kernel panic from the inmate when booting the
>     cell.
>      > > It's
>      > > > similar to the one I had earlier, not sure yet of what the
>      > > problem may be.
>      > >
>      > > Great, we're a step further.
>      > >
>      > > >
>      > > > Created cell "linux-2"
>      > > > Page pool usage after cell creation: mem 406/32211, remap
>      > > 16392/131072
>      > > > Cell "linux-2" can be loaded
>      > > > CPU 9 received SIPI, vector 100
>      > > > Started cell "linux-2"
>      > > > CPU 8 received SIPI, vector 100
>      > > > No EFI environment detected.
>      > > > early console in extract_kernel
>      > > > input_data: 0x000000000275c308
>      > > > input_len: 0x00000000008b0981
>      > > > output: 0x0000000001000000
>      > > > output_len: 0x0000000001fccb30
>      > > > kernel_total_size: 0x0000000001e28000
>      > > > needed_size: 0x0000000002000000
>      > > > trampoline_32bit: 0x000000000009d000
>      > > >
>      > > > Decompressing Linux... Parsing ELF... done.
>      > > > Booting the kernel.
>      > > > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINU=
X-DESKTOP)
>      > > > (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real =
(Buildroot
>     2023.11)
>      > > > 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 S=
MP
>     PREEMPT_DYNAMIC
>      > > Fri
>      > > > Jan 12 17:36:57 CET 2024
>      > > > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115=
200
>      > > > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > > > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > > > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
01: 'x87
>      > > floating
>      > > > point regi =C2=A0 =C2=A0 =C2=A0 sters'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
02: 'SSE
>      > > registers'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x0=
04: 'AVX
>      > > registers'
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576,=
 xstate_sizes[2]:
>      > > =C2=A0256
>      > > > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7,=
 context
>     size
>      > > is 832
>      > > > bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.
>      > > > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
>      > > > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > > > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>      > > 0x0000000000000000-0x000000000009efff] usable
>      > >
>      > > Okay, here should be all memory regions listed. My non-root Linu=
x
>      > in my
>      > > Qemu VM, for example, shows here:
>      > >
>      > > [ 0.000000] BIOS-provided physical RAM map:
>      > > [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000ffff=
f]
>      > > usable
>      > > [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100ff=
f]
>      > > reserved
>      > > [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048ffff=
f]
>      > > usable
>      > >
>      > > Are you absolutely sure, that you have no further modifications =
in
>      > > Jailhouse or the Linux loader?
>      > >
>      > > Actually, in your case, there should be e820 as well (instead of
>      > e801).
>      > > Go to the Linux kernel sources, have a look at
>      > > arch/x86/kernel/e820.c:1279
>      > >
>      > > and Jailhouse's jailhouse-cell-linux:638.
>      > >
>      > > jailhouse-cell-linux fills information of all memory regions int=
o
>      > the
>      > > zero page. Would you please instrument code (Linux/Jailhouse)
>     to see
>      > > where those regions are not parsed?
>      > >
>      > > > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabl=
ed
>      > > > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: acti=
ve
>      > > > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=A0 =
sable
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 =
sable
>      > > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > > 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=A0 =
sable
>      > > > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > > > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      > >
>      > > Just guessing loud: Hmm, you have guest support enabled, that's
>      > not the
>      > > issue.
>      > >
>      > > > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > > > [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as E8=
20_TYPE_RAM!
>      > >
>      > > Here's the next error that makes me curious, why you system fall=
s
>      > back
>      > > to E801...
>      > >
>      > > > [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D =
0x400000000
>      > > > [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because
>      > > CONFIG_X86_PAT is
>      > > > disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
>      > >
>      > > Please enable CONFIG_X86_PAT and MTRR in your kernel.
>      > >
>      > > > [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=
=A0WT =C2=A0UC- UC =C2=A0WB
>      > > =C2=A0WT =C2=A0UC- UC
>      > > > [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
>      > > > [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_low=
_pages: can
>      > not
>      > > > alloc memory
>      > >
>      > > Yeah, that's the logical aftereffect after the errors above.
>      > >
>      > > Thanks,
>      > > Ralf
>      > >
>      > > > [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not taint=
ed
>      > 6.2.0-rc3 #2
>      > > > [ =C2=A0 =C2=A00.052176] Call Trace:
>      > > > [ =C2=A0 =C2=A00.054606] =C2=A0<TASK>
>      > > > [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
>      > > > [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
>      > > > [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
>      > > > [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
>      > > > [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
>      > > > [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
>      > > > [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_ini=
t+0x11a/0x290
>      > > > [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3=
b0
>      > > > [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe=
7/0x145
>      > > > [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298
>      > > > [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
>      > > > [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
>      > > > [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
>      > > > [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_verif=
y+0xe0/0xeb
>      > > > [ =C2=A0 =C2=A00.114085] =C2=A0</TASK>
>      > > > [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing:
>      > > alloc_low_pages: can
>      > > > not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
>      > > >
>      > > >
>      > > > Thank you for your continuous support,
>      > > > Michele
>      > > >
>      > > > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
>      > > Ramsauer ha
>      > > > scritto:
>      > > >
>      > > > Hi Michele,
>      > > >
>      > > > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
>      > > > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
>      > > > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00
>      > parameters
>      > > > -a 0x1000
>      > > > > jailhouse cell start linux-2
>      > > > >
>      > > > > I take it the kernel is loaded at 0xffbe00 which is right
>     at the
>      > > > edge of
>      > > > > the low ram region. In fact after issuing the cell load
>     command
>      > > and
>      > > > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
>      > > Invalid
>      > > > > argument.
>      > > >
>      > > > Just tested cell-linux in a qemu machine, there it works, with
>      > > pretty
>      > > > similar addresses, which got me confused.
>      > > >
>      > > > After double-checking it: 0xffb.e00 is *not* at the edge of lo=
w
>      > mem:
>      > > >
>      > > > Low mem is 0x000.000 -- 0x0ff.fff
>      > > > Comm region is 0x100.000 -- 0x100.fff
>      > > >
>      > > > 0xffb.e00 is (obviously) way above.
>      > > >
>      > > > Please try to set your high mem's .virt_start to 0x200000. The=
n,
>      > > > 0xffbe00 is offsetted ~16MB inside your highmem, and it should
>      > work!
>      > > >
>      > > > IOW:
>      > > >
>      > > > /* high RAM */
>      > > > {
>      > > > .phys_start =3D 0x42300000,
>      > > > .virt_start =3D 0x200000,
>      > > > .size =3D 0x11000000,
>      > > > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>      > > > JAILHOUSE_MEM_EXECUTE |
>      > > > JAILHOUSE_MEM_LOADABLE,
>      > > > },
>      > > >
>      > > > Thanks
>      > > > Ralf
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to the
>     Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails from
>     it,
>      > > send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a=
72-79da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434=
169n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/67=
12361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef=
-49cc-8a72-79da2c434169n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/67123=
61a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/6712361a=
-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef=
-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-4=
9cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8=
a72-79da2c434169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
>>>>.
>      > >
>      > > --
>      > > You received this message because you are subscribed to the Goog=
le
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails from it=
,
>      > send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-92=
12-a3d87ad25b27n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25=
b27n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/86=
0c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?u=
tm_medium=3Demail&utm_source=3Dfooter>>>.
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
>     https://groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-ab=
af-9a2be8c85be5n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85=
be5n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/6146e208-1e8c-4335-abaf-9a2be8c85be5n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/6fb04e63-2f4a-4d5b-9139-c=
11e9a9fc461n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5fc9ef1f-e7ca-496f-aab5-c085c4586326%40oth-regensburg.de.
