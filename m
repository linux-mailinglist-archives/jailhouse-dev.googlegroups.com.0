Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUVLQGWQMGQEOL4P2AI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030282B64A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jan 2024 21:55:49 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id 38308e7fff4ca-2cce9de723csf49954591fa.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jan 2024 12:55:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705006549; cv=pass;
        d=google.com; s=arc-20160816;
        b=hvDCkVzeP34FnTmZb18glpkYy3FfVrkunGQDEjVpqUgR+iqXplzAAnw+Erily/gaLh
         wmKk76lftLXFgLFHfXcVrSsVDVARnQiku269vK3ef7upmgEiQVRlnNqcPcLyv60gsz/l
         7otm4IpfnB1stK1qYTShq2NpN0RK1kNpKDTEuNXLf++R9CcwufL0H+Fh8Li4so5GWU2c
         HX+E/B16fp3oJJytDDB1oXfN2KBjXsYqB1h8C9jaaoEvFE/fnWiGkzDHyCTDYtCJfYZX
         ApfS+AbztyouUjHyWgQeGlBkBgPmEwu15ToIY87ZkjNxYbVok/wJTFyfnTtxHzIXFRZx
         yfMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=H0yjGt9REpHaOOv+rEH4qQxsoN7n+MoZGEPxP2evMYY=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=dZkX7cXFsdfph+4i1YnZRrxznRst6FtkZEEVFnleXR86NkbKXNXZB16p96FPBmr/iO
         bU7yyaMpOnXtVhI3UY2VYkBzbiQfKHoK8Sd9PAnH6gon+e3unUMzF2kfAKxkk+u9nXWo
         N0Di+vC03uIYXABESB8ZV90FC39ANLvriQPSJdZgvq824q6sPhsFh+gMaeKRR1EuIn54
         FIFH0qcfShSDFUgRuLPyGxTnRgWlSZiSCjRnqZv18B4vw8ZJvH/75DIahdAXN/8IPxpq
         Q9cZSwdJYhfH1QrYQoo4iO1u809y69NA0+11FrqRUkqO7gy18ZtTihnAODEUASyJvHAe
         5FrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=JM2Xx1yp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705006549; x=1705611349; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H0yjGt9REpHaOOv+rEH4qQxsoN7n+MoZGEPxP2evMYY=;
        b=jeiLNAJGoJ/Slz7T/EtLZBNEnwDnSUfmjO2nWt/BqW1i8qrfzfcYxSW2wyKnWm0iTK
         In9T+qy/GgH7pGCgO/rzYHTmxGvgLonHvhEvdu23EOlc/6/ngcyACnTrg0PUCI0RGMd+
         BJu6aU19S/L4c0oUE6ogFtQOpFdqzueqslWUMpgQOMqHj+Rm9zQ9XtEWdgpggDNXK1+6
         /Chc38qHZzYFjhvdu0LsHBo42BOviLxXaWNSi8rccAOkYHEjkXlyvViy+IZOh+8ht1Lw
         Y4tuD6cF6ct+ZPXPMwEjsdcghp5kCTcYLiLvqFiCCLSELvUKjjAh/hl+fDoL0Ljjyzi3
         Ad2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705006549; x=1705611349;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0yjGt9REpHaOOv+rEH4qQxsoN7n+MoZGEPxP2evMYY=;
        b=jUFFTQHlVWkQLth12ymYPlWTczyZ6fNLNzMpyexyHd0KupGO8QouSVX2rOup51PcMc
         QE5VL5UlKFaXTVsNqIJpommW1WCo8zm2XJSPhaPpgcb82XSQl5u8n6yW928AQXPuREpo
         95DhqHnLkZKXV8Sa5ZrVrqk2rHO8/Y9K87zVzPmhHOBnN+OJNkKeHmmcvWUsEKMDzaDU
         6N7DuJS97liok7H0jZxjEhfbC/PuvQ8P5Gs3D7+n/UCMYVE2MdpkRVAE/wT2Qi2rdiqW
         ufpPkt29kz12VYfwC0WJl2T4b0xsL2gKU+Q7lpR6Cm2YrZAf/aYDOESg++pkJo+LA+Z0
         qv/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwJXb7wh9DdXXkOrGoz0AqahAtOgF/IHqVxccip9W5w8gzI6PFJ
	8HzgF1kT7bqBIwkzJbvSNsU=
X-Google-Smtp-Source: AGHT+IFo2R+fiQgYDYVtPXziVCU+0GKdTHLM/i0vVF7d3YYRpK3eGRcLg3OxFY30tWFZapzWdEigAQ==
X-Received: by 2002:a05:6512:3104:b0:50e:a688:4a1f with SMTP id n4-20020a056512310400b0050ea6884a1fmr129060lfb.112.1705006547846;
        Thu, 11 Jan 2024 12:55:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:a8f:b0:50e:7221:e544 with SMTP id
 m15-20020a0565120a8f00b0050e7221e544ls1322332lfu.1.-pod-prod-06-eu; Thu, 11
 Jan 2024 12:55:44 -0800 (PST)
X-Received: by 2002:a05:6512:477:b0:50e:e1e7:3199 with SMTP id x23-20020a056512047700b0050ee1e73199mr142830lfd.29.1705006543970;
        Thu, 11 Jan 2024 12:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705006543; cv=none;
        d=google.com; s=arc-20160816;
        b=zI1OwoRSrr6ZV6TLRs8LvXLiPhWy/9L+LB5m0U1+r/lj1LOxHtudaV0lTPyT8LodSN
         7K/sbQcoZ2Z/I/bXKZoUCcSf2a7WO+zsEsw2JeM+YTjol785ly9ISLx8ZYRv4wjN6ako
         JySVkdErdrP1prifSYrMkdfpd+vXD3zHcq+QPmgQbElHk+omhcTy8gFehi4yV5aMCtor
         pnJylY1yvV4XYqILQ2TpbKik5dz575AVCAAWHzJ8czmWBSTvj5M1MU3WOk8sP4gVt6wc
         x0ZWdl+td1HmLb2TF04xftZOlvxw7RApUnMR9x4TYpPMC9GVC2ZL3cz4frD1LUO/qJWa
         Reaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xY+35L0jIPxheXq9pBVskQNijajzhDLCS+jg13tnWBI=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=gmUJJTsTllbkDdpGgu3CUmV309orwhJmdcXnPtToA2abvUFmS5BbR44OZevi4bhTRI
         bU+uqIm9hjEK69h363gLBEhaquT+4xut9H3Q57xM1XmMGOCXsEtFSSu9tOpsdQ7/wSX/
         sFNI65QJjBBzmpvAIdNeU6G3NvVYz4aVxm67fLaD75lM8zmaVaT8ZznoW99Dy8uDnTpV
         Gn6ONIwZQufXFkeW9+K54WDS7cf5/kblMiUJK2MtI2JzE/H0ORj6kHsZjthoox4b9H6Z
         3M0Dm0IIaqnLAf9zjYwOIWuamczn6XZ5ArOfOSF8YvKnot6cO2K0luiRbhTt3amT7cNZ
         SCsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=JM2Xx1yp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [2001:638:d:c302:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id m18-20020a0565120a9200b0050ed4c7fd46si69133lfu.7.2024.01.11.12.55.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 12:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c302:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id 2720E3E015A;
	Thu, 11 Jan 2024 21:55:42 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4T9xlK5rJCzxsK;
	Thu, 11 Jan 2024 21:55:41 +0100 (CET)
Received: from [172.16.2.22] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jan
 2024 21:55:41 +0100
Message-ID: <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
Date: Thu, 11 Jan 2024 21:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
Content-Language: en-US
To: =?UTF-8?Q?Michele_Pescap=C3=A8?= <mic.pescape@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <d36e18a4-dd64-4f9c-b2cf-89b02b1a0469@oth-regensburg.de>
 <c9dad4f3-f856-4f25-b6ad-41ec63cf2c64n@googlegroups.com>
 <219b013e-4970-4bb3-969f-bb0d7bae3ab7n@googlegroups.com>
 <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=JM2Xx1yp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c302:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 11/01/2024 13:57, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> after changing the virt_start to match the phys_start for that memory=20
> region I got an invalid argument error when starting the cell
>=20
> Traceback (most recent call last):
>  =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 73=
9,=20
> in <module>
>  =C2=A0 =C2=A0 cell.load(arch.kernel_image, arch.kernel_address())
>  =C2=A0 File "/usr/local/lib/python3.10/dist-packages/pyjailhouse/cell.py=
",=20
> line 44, in load
>  =C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
> OSError: [Errno 22] Invalid argument

Are you sure that you created the cell with the correct config? What=20
does dmesg say? Any output on the hypervisor console when this error=20
happens?

>=20
> Printing the arch.kernel_address() returned 16760320 (should be=20
> 0xffbe00), so I thought that the bzImage was too big for the low ram regi=
on.

jailhouse-cell-linux won't load the bzImage to the low ram region. You=20
can use the -w option to dump a file that prints the commands that=20
jailhouse-cell-linux would invoke.

> I increased the size to .size =3D 0x04000000 and shifted the virt and=20
> phys_start of the other two regions to match the change (virt_start =3D=
=20
> 0x04000000 for the comm region and virt=3Dphys_start =3D 0x46000000 for t=
he=20
> third region) .
> No issues were reported by config check but after starting the cell i=20
> got no output even using earlyprintk.
>=20
> I also tried using an initrd but I got a similar issue, invalid argument=
=20
> when starting the cell, this time it was the arch.ramdisk_address()=20
> which was 107327488 (0x665b000).
> So i tried increasing even more the size of the first region to size =3D=
=20
> 0x0a000000 (comm region now starts at .virt_start =3D 0x0a000000, and the=
=20
> third region starts at=C2=A0 virt=3D.phys_start =3D 0x4c000000 with size =
=3D=20
> 0x6000000).
> Again, no config check issues so I started it but no output again, the=20
> hypervisor only reports:
>=20
> Created cell "linux-1"
> Page pool usage after cell creation: mem 268/32211, remap 16392/131072
> Cell "linux-1" can be loaded
> CPU 5 received SIPI, vector 100
> CPU 4 received SIPI, vector 100
> Started cell "linux-1"
>=20
> My bzImage is 12,9MB and the rootfs.cpio is 23.1MB if that matters.

Try starting without the ramdisk. We can later take care of the ramdisk,=20
but first the kernel needs to start.

For a compressed image, your kernel is really huge. I bet you can boil=20
it down to a few MBs. With a kernel of that size, you might want to play=20
around with jailhouse-cell-linux -k.

   Ralf

>=20
> Thanks,
> Michele
>=20
>=20
>=20
> Il giorno mercoled=C3=AC 10 gennaio 2024 alle 20:58:03 UTC+1 Ralf Ramsaue=
r ha=20
> scritto:
>=20
>     Hi Michele,
>=20
>     On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > I'm attaching the configurations I'm currently using. I'll try
>     disabling
>      > KASLR.
>=20
>     [=E2=80=A6]
>     /* high RAM */
>     {
>     .phys_start =3D 0x42100000,
>     .virt_start =3D 0x00101000,
>     .size =3D 0x8000000,
>     [=E2=80=A6]
>=20
>     Alignment of your high ram is odd. Virt & Phys should have the same
>     alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that should=
 help.
>=20
>     Thanks,
>     Ralf
>=20
>=20
>      >
>      > Thank you for your help,
>      > Michele
>      >
>      > Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi,
>      >
>      > On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
>      > > Hi,
>      > >
>      > > Just an update, I was able to get the following output by
>     adding -c
>      > > "earlyprintk=3DttyS0,115200" to the command line:
>      > >
>      > > Started cell "linux-1"
>      > >
>      > >
>      > > Invalid physical address chosen!
>      >
>      > could you please share your system and non-root cell configuration=
?
>      >
>      > It smells like you have an overlap with the communication region.
>     You
>      > can check that with tools/jailhouse-config-check.
>      >
>      > >
>      > >
>      > >
>      > >
>      > > Physical KASLR disabled: no suitable memory region!
>      >
>      > Disable KASLR in your kernel for the moment. You don't need it whi=
le
>      > ramping up your system.
>      >
>      > Thanks,
>      > Ralf
>      >
>      > >
>      > > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-=
DESKTOP)
>      > > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11)
>      > 12.3.0, GNU
>      > > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =C2=A07
>      > 18:35:23 CET 2024
>      > > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,11520=
0
>      > > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001=
: 'x87
>      > floating
>      > > point registers'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002=
: 'SSE
>      > registers'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004=
: 'AVX
>      > registers'
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, x=
state_sizes[2]:
>      > =C2=A0256
>      > > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, c=
ontext size
>      > is 832
>      > > bytes, using 'compacted' format.
>      > > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
>      > > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>      > 0x0000000000000000-0x000000000009efff] usable
>      > > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
>      > > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>      > > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x0000000000000000-0x0000000000001fff] usable
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x0000000000002000-0x000000000000212b] usable
>      > > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > > 0x000000000000212c-0x000000000009efff] usable
>      > > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      > > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > > [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E820=
_TYPE_RAM!
>      > > [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x=
400000000
>      > > [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: WB =C2=A0=
WC =C2=A0UC- UC =C2=A0WB
>      > =C2=A0WP =C2=A0UC- WT
>      > > Memory KASLR using RDRAND RDTSC...
>      > > [ =C2=A0 =C2=A00.032374] Using GB pages for direct mapping
>      > > [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc_low_p=
ages: can
>     not
>      > > alloc memory
>      > > [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not tainted
>     6.2.0-rc3 #2
>      > > [ =C2=A0 =C2=A00.049702] Call Trace:
>      > > [ =C2=A0 =C2=A00.052134] =C2=A0<TASK>
>      > > [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
>      > > [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
>      > > [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
>      > > [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0
>      > > [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
>      > > [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
>      > > [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
>      > > [ =C2=A0 =C2=A00.079135] =C2=A0?
>      > __raw_callee_save___native_queued_spin_unlock+0x15/0x30
>      > > [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_init+0x=
11e/0x29a
>      > > [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+0xf/=
0x20
>      > > [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273/0x410
>      > > [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping+0xec/0x=
150
>      > > [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x2e7
>      > > [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
>      > > [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f
>      > > [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
>      > > [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations+0x24/0x=
2c
>      > > [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff
>      > > [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_verify+0x=
e5/0xeb
>      > > [ =C2=A0 =C2=A00.133400] =C2=A0</TASK>
>      > > [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syncing:
>      > alloc_low_pages: can
>      > > not alloc memory ]---
>      > > Closing cell "linux-1"
>      > > Page pool usage after cell destruction: mem 254/32211, remap
>      > 16392/131072
>      > > CPU 4 received SIPI, vector 96
>      > > CPU 5 received SIPI, vector 96
>      > >
>      > > This happens both with and without the initrd in the command,
>      > i'll try
>      > > to solve this and see what happens.
>      > >
>      > > By the way, is it possible that the new cell starts transmitting
>      > with a
>      > > baud rate different than the root cell? Without specifying the
>      > speed in
>      > > the command above the serial console stopped receiving anything
>      > until I
>      > > disabled and re-enabled the hypervisor. If not I may have
>     something
>      > > wrong on my end to solve
>      > >
>      > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michel=
e
>      > Pescap=C3=A8 ha
>      > > scritto:
>      > >
>      > > I stand corrected, the freeze happens when i do not set
>      > > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
>      > >
>      > > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michel=
e
>     Pescap=C3=A8
>      > > ha scritto:
>      > >
>      > > Hi, thank you for replying.
>      > >
>      > > ttyS0 is indeed whitelisted in the inmate and the number of
>      > > pio_regions is set accordingly.
>      > >
>      > > As for the crash after disable/shutdown, I think it was related
>      > > to the PCI device, after commenting that and the corresponding
>      > > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST
>     and
>      > > CONFIG_JAILHOUSE_DBCON were already set in the kernel
>      > > configuration I'm using for the non root linux; still, I
>      > > recompiled it just in case.
>      > >
>      > > Michele
>      > >
>      > > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
>      > > Ramsauer ha scritto:
>      > >
>      > > Hi,
>      > >
>      > > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
>      > > > Hi all,
>      > > >
>      > > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
>      > > is to run two
>      > > > non root linux cells, however, as of right now, I'm not
>      > > able to start
>      > > > any non root linux cells.
>      > > > First of all I don't receive an output from the cell (I
>      > > do get output
>      > > > from the apic-demo though), therefore I don't really know
>      > > if they're
>      > > > even crashing or not; this is the output I get from the
>      > > hypervisor after
>      > > > enabling the root cell and issuing the following command:
>      > > >
>      > > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
>      > > > ../buildroot-2023.11/output/images/bzImage -i
>      > > > ../buildroot-2023.11/output/images/rootfs.cpio
>      > >
>      > > for the first few tries, simply don't load a ramdisk. Try to
>      > > get the
>      > > kernel booting. It will crash with "cannot mount rootfs". If
>      > > we get so
>      > > far, then you can continue specifying the ramdisk. But
>      > > first, we have to
>      > > get that far.
>      > >
>      > > >
>      > > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
>      > > > Created cell "linux-x86-demo"
>      > > > Page pool usage after cell creation: mem 336/32211, remap
>      > > 16392/131072
>      > > > Cell "linux-x86-demo" can be loaded
>      > > > CPU 4 received SIPI, vector 100
>      > > > CPU 3 received SIPI, vector 100
>      > > > Started cell "linux-x86-demo"
>      > > >
>      > > > After this the cell appears to be running in cell list,
>      > > however I can't
>      > > > seem to get any output to confirm that (I even set
>      > > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
>      > > appears on the vrtual
>      > > > console accessed via "jailhouse console -f"). I also
>      > > tried adding -c
>      > > > "console=3DttyS0,115200".
>      > >
>      > > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
>      > > configuration?
>      > > Actually, your cmdline is correct.
>      > >
>      > > > At this point if I try to disable/shutdown the cell, the
>      > > system freezes
>      > > > requiring a hard reset.
>      > >
>      > > Okay, is the guest Linux compiled with Jailhouse guest
>      > > support? Please
>      > > ensure that non-root Linux is compiled with
>      > > CONFIG_JAILHOUSE_GUEST and
>      > > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
>      > > Linux guests.
>      > >
>      > > >
>      > > > Also, there seems to be a mismatch between the PCI bdf
>      > > value in the log
>      > > > above and the one in the cell's configuration. In both
>      > > root and non root
>      > > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
>      > > and the Root
>      > > > cell correctly reports that ("Adding virtual PCI device
>      > > 00:0f.0 to cell
>      > > > "RootCell"").
>      > >
>      > > First things first. Let's try to get Linux kicked off before
>      > > diving into
>      > > PCI. Comment it out for the moment, let's do that later.
>      > >
>      > > Ralf
>      > >
>      > > >
>      > > > If I understood correctly, once the cell works properly I
>      > > won't need to
>      > > > set the console anymore as I can assign an ip (-c "ip
>      > > x.x.x.x" in the
>      > > > cell linux command) and ssh to the cell, right?
>      > > >
>      > > > I attach the root and non root cells' configurations in
>      > > case they're
>      > > > needed. I can provide both the root and non root cell's
>      > > kernel .conf and
>      > > > the buildroot configuration I used if needed.
>      > > >
>      > > > Thank you for your time,
>      > > > Michele
>      > > >
>      > > > --
>      > > > You received this message because you are subscribed to
>      > > the Google
>      > > > Groups "Jailhouse" group.
>      > > > To unsubscribe from this group and stop receiving emails
>      > > from it, send
>      > > > an email to jailhouse-de...@googlegroups.com
>      > > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > > To view this discussion on the web visit
>      > > >
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-87=
8e-7203214b4fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4=
fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40goog=
legroups.com <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae=
-47c9-878e-7203214b4fc3n%40googlegroups.com> <https://groups.google.com/d/m=
sgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com=
 <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com>>> <https://groups.google.com/d/msgid/jailh=
ouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_mediu=
m=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-=
dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3De=
mail&utm_source=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/=
824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail=
&utm_source=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/824ba=
cc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_=
source=3Dfooter>> <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4=
-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_sou=
rce=3Dfooter <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae=
-47c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=
=3Dfooter> <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-4=
7c9-878e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Df=
ooter <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-8=
78e-7203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=
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
>     https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f=
9f-699daf338843n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338=
843n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/22=
02bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?u=
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
>     https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-93=
51-be2c3e999446n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999=
446n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/23a9c30e-5507-449e-9589-6=
97904becac4n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/23a9c30e-5507-449e-9589-697904becac4n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/81df336d-a7bb-49e2-8762-a1294aef67e9%40oth-regensburg.de.
