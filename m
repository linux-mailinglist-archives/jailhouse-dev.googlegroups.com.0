Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBSXN7OWAMGQEJKKZ5PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7D82A1A3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 20:58:04 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id 5b1f17b1804b1-40d62d3ae0csf39375035e9.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 11:58:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704916684; cv=pass;
        d=google.com; s=arc-20160816;
        b=RWDInbbUPaNj1XIMOt5WKr/jhZ4zuq5rB8WJw4a1ZlMD3C4ETPdl/WEjs3GmRe3cAW
         bNLewikjTQ6El4ME/abTJKjV9YNqV9MOwKTntOtxD3l4vQP1VoVppXh3dnDf9PXRZTH1
         PisO1FRqHeZ8uF3gbojbGobdZQi0F0ZQli51F3DSvpyM4EhTdIn9DsIhTUfysNoc0mR6
         8tKeY1TzAhueMU1JnMHBA0SIkIwJKl6iOcskZIFn5inW0fQXFFCqrQ6a8X+NXCZgs1bm
         HhTLsYmPlRYnC52P6OHu02ZOfeBwaKwm9TF96Obl5e3MGOnwIFjZiblugK8c9blCxLn8
         bAbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=/XHDpp20EPWOIjSauH7K9VHp5XU7r5gM/pRab3q3HbE=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=yI2SUjqP4rHl+aHTRZNH4UmNFZZ5KMfWQqi5qk7Wgf+V5Tp0C8P6TtD4mRvjp8le51
         DVXitxIp+rpMElWf95LOTmHh65/bTKUYXmPGPSjWylCcKsfeMe11RYWZYfoVtNiEkjmM
         YFklX6cjYvcuJDM4NSUGcbVW4J2pB+txi7lJk6IF3PrEFBbNhvK1c9+ZfJfIS1fM1D4I
         c6hDVA7il2JyT9Bb3NjRql2Xz51kK/nD6E9Ml1YjL35jjd5SE/nAyq7HEP5Gc1TucIUq
         nVqxl/O55vCO3uPgB9uU0AoKcqMcJeIFZr45sCj5+2fg4X36j0nYpvfHc+o8iEfObGPe
         MAew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=qNvK+OiK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704916684; x=1705521484; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/XHDpp20EPWOIjSauH7K9VHp5XU7r5gM/pRab3q3HbE=;
        b=YF2OHbeKaGHpSTEGvBsrzolJw6EtuPyqOWgM1jY/TrKTEIbrtGrKA3qBwEY6ktcPKC
         9G8FBoEJ1/P3VvquO7Asrk0Eem4JM/qcw2aIcH7IH30hAwjhVnQbytCo5Lv4/3yoAVhM
         GVHA7FA9TquvzVsbyKmlq+4dOh61Y99f/GcKyzRBCl3tPnQ882DOARx99PUHSqja11SZ
         7nC5gwcLcmovs1vM/kndr8V4VoxoGoR514R3pqUBBCt51e/GyA+R8Uw+IDniL0yq+951
         Jzj4ImAWMeFWopA8z+GqCMzucC/qqYOgX1FkF5fzJnGqZW3Y7uxfuHncapqNrKFi3xSB
         sZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916684; x=1705521484;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XHDpp20EPWOIjSauH7K9VHp5XU7r5gM/pRab3q3HbE=;
        b=iGbEnhRv0eT737Hoddpi1EF3Lk1sBRI3fpCP1Ffq6irRUsKumndZDQSMbFaakgsIfp
         A5pJXsExoSouV6nmT+nORxc0Cgu5h2F925A317uM2MtMo4v/1xG8YDftmCJjqNKTVeQi
         ThSuXR4q9Rhk7rA3uq1JWHu2aDjnOU7raE7EGnBVosxfbmRMpTnURyEbCYh20JBNmOQI
         QEsNdN/yEQnf+gbJsvWOP2ouO5Ycv7NA6YnK1Ib3koE0a9tZ/NpTRkIjo3Qvcdg4kS48
         IWHpmNHbEYU4TGwYmW019t8cRQIvXH1eqw+Xc/oiZcOYDErfcH5c9zXngrLxv0Elnqoo
         Rpbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yw1ejQ5jSv8M7y6IXoFijah2cyeeJaCe74hO7yTqAykI8SNGmXQ
	/JGzC2R6yhxXumYDNFGI8TE=
X-Google-Smtp-Source: AGHT+IG77y2Fi4YM0dEDX08D55hBjF5jgPuc5Dktt+mZ8ml362iwO+2njZi/14rXhaMHYZlbjqdc7A==
X-Received: by 2002:a05:600c:694:b0:40e:5303:9c73 with SMTP id a20-20020a05600c069400b0040e53039c73mr897361wmn.67.1704916683307;
        Wed, 10 Jan 2024 11:58:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4fc1:b0:40d:5b95:8e21 with SMTP id
 o1-20020a05600c4fc100b0040d5b958e21ls268338wmq.0.-pod-prod-05-eu; Wed, 10 Jan
 2024 11:58:01 -0800 (PST)
X-Received: by 2002:a05:600c:4445:b0:40e:4386:11c6 with SMTP id v5-20020a05600c444500b0040e438611c6mr937088wmn.13.1704916680689;
        Wed, 10 Jan 2024 11:58:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916680; cv=none;
        d=google.com; s=arc-20160816;
        b=QNqMqS1f4Oz9X8PeaOtNfa9fpjcGeOm7byuyS8liLOVvGSxXLrSY1LkwVn0yCR/bOG
         H0H/Fs778HgQQX2Nre45nav2hbCAQKSc4WrUeUh3LK0fogwe2v8RvT8atD9OU1fcJjAv
         AinzcU9ZasJxelEvLPULhitAvl6jCzgDG6e+/TeZw54u63mFJMOiakf1kLlZzEDEPkqd
         9yOQF5H2Xu84HoDeTYHO1EvEaGHT4fsiBmnkcTzQzmDgqI2eYXH+9o49ZpHiwGUbmY7n
         toP+nuT1pCN/1NQ0gM2DLSYcHDccWkncmDCTA/N1eLCEBMut1ptFb58aLTs8/HmvF9A4
         w2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dlITx1XL2mgznKP5zniyfi44dhBvZrUNF7k9EbsRtOg=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=EnlJ5s90kbFhbkSnUfVYNPyeiSKLFp/y98GyRajXjGQJl19DZbk6MvOhBxGElBWJEP
         Hmm8WUrTqUtwFXdXCb3YBEJbi9lxLcAq2953b+gLhQFgNs0SCkh9rM5YrVx7lzs+GZj3
         W8ZJE8BsAVYJk1WNUhALCCBzgYgyBTUNtGkpT7ZVIMJMdkPOYkWtrgJLlEQOMgFB8i6t
         VlX5H9mGu6pVvkcVES0SsOOS8ioyczuGLTWo7qrePgUd5FDIFr0lE9wEPDrqxBBQ9TyL
         IizL1le959DQmoWHPwOha49eOfLmR0yO5O5OrPYFzr+VcTXSatz1LKfOTskuYJpuxSZ6
         JWTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=qNvK+OiK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id o37-20020a05600c512500b0040d2cb644e3si72783wms.1.2024.01.10.11.58.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:58:00 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 56C412E04D8;
	Wed, 10 Jan 2024 20:57:59 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4T9JWB6hkRzxq2;
	Wed, 10 Jan 2024 20:57:58 +0100 (CET)
Received: from [172.23.3.108] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Jan
 2024 20:57:58 +0100
Message-ID: <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
Date: Wed, 10 Jan 2024 20:57:58 +0100
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=qNvK+OiK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
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

Hi Michele,

On 10/01/2024 17:40, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> I'm attaching the configurations I'm currently using. I'll try disabling=
=20
> KASLR.

[=E2=80=A6]
                 /* high RAM */
                 {
                         .phys_start =3D 0x42100000,
                         .virt_start =3D 0x00101000,
                         .size =3D 0x8000000,
[=E2=80=A6]

Alignment of your high ram is odd. Virt & Phys should have the same=20
alignment. Try to use .phys=3D.virt=3D0x42100000, I guess that should help.

Thanks,
   Ralf


>=20
> Thank you for your help,
> Michele
>=20
> Il giorno mercoled=C3=AC 10 gennaio 2024 alle 17:24:35 UTC+1 Ralf Ramsaue=
r ha=20
> scritto:
>=20
>     Hi,
>=20
>     On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > Just an update, I was able to get the following output by adding -=
c
>      > "earlyprintk=3DttyS0,115200" to the command line:
>      >
>      > Started cell "linux-1"
>      >
>      >
>      > Invalid physical address chosen!
>=20
>     could you please share your system and non-root cell configuration?
>=20
>     It smells like you have an overlap with the communication region. You
>     can check that with tools/jailhouse-config-check.
>=20
>      >
>      >
>      >
>      >
>      > Physical KASLR disabled: no suitable memory region!
>=20
>     Disable KASLR in your kernel for the moment. You don't need it while
>     ramping up your system.
>=20
>     Thanks,
>     Ralf
>=20
>      >
>      > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DE=
SKTOP)
>      > (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11)
>     12.3.0, GNU
>      > ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =C2=A07
>     18:35:23 CET 2024
>      > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
>      > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: =
'x87
>     floating
>      > point registers'
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: =
'SSE
>     registers'
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: =
'AVX
>     registers'
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xst=
ate_sizes[2]:
>      =C2=A0256
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, con=
text size
>     is 832
>      > bytes, using 'compacted' format.
>      > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
>      > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>     0x0000000000000000-0x000000000009efff] usable
>      > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
>      > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>      > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x0000000000000000-0x0000000000001fff] usable
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x0000000000002000-0x000000000000212b] usable
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x000000000000212c-0x000000000009efff] usable
>      > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>      > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E820_T=
YPE_RAM!
>      > [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x40=
0000000
>      > [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: WB =C2=A0WC=
 =C2=A0UC- UC =C2=A0WB
>      =C2=A0WP =C2=A0UC- WT
>      > Memory KASLR using RDRAND RDTSC...
>      > [ =C2=A0 =C2=A00.032374] Using GB pages for direct mapping
>      > [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc_low_pag=
es: can not
>      > alloc memory
>      > [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6=
.2.0-rc3 #2
>      > [ =C2=A0 =C2=A00.049702] Call Trace:
>      > [ =C2=A0 =C2=A00.052134] =C2=A0<TASK>
>      > [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
>      > [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
>      > [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
>      > [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0
>      > [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
>      > [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
>      > [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
>      > [ =C2=A0 =C2=A00.079135] =C2=A0?
>     __raw_callee_save___native_queued_spin_unlock+0x15/0x30
>      > [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_init+0x11=
e/0x29a
>      > [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+0xf/0x=
20
>      > [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273/0x410
>      > [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping+0xec/0x15=
0
>      > [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x2e7
>      > [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
>      > [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f
>      > [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
>      > [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations+0x24/0x2c
>      > [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff
>      > [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_verify+0xe5=
/0xeb
>      > [ =C2=A0 =C2=A00.133400] =C2=A0</TASK>
>      > [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syncing:
>     alloc_low_pages: can
>      > not alloc memory ]---
>      > Closing cell "linux-1"
>      > Page pool usage after cell destruction: mem 254/32211, remap
>     16392/131072
>      > CPU 4 received SIPI, vector 96
>      > CPU 5 received SIPI, vector 96
>      >
>      > This happens both with and without the initrd in the command,
>     i'll try
>      > to solve this and see what happens.
>      >
>      > By the way, is it possible that the new cell starts transmitting
>     with a
>      > baud rate different than the root cell? Without specifying the
>     speed in
>      > the command above the serial console stopped receiving anything
>     until I
>      > disabled and re-enabled the hypervisor. If not I may have somethin=
g
>      > wrong on my end to solve
>      >
>      > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele
>     Pescap=C3=A8 ha
>      > scritto:
>      >
>      > I stand corrected, the freeze happens when i do not set
>      > JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
>      >
>      > Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele =
Pescap=C3=A8
>      > ha scritto:
>      >
>      > Hi, thank you for replying.
>      >
>      > ttyS0 is indeed whitelisted in the inmate and the number of
>      > pio_regions is set accordingly.
>      >
>      > As for the crash after disable/shutdown, I think it was related
>      > to the PCI device, after commenting that and the corresponding
>      > regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST an=
d
>      > CONFIG_JAILHOUSE_DBCON were already set in the kernel
>      > configuration I'm using for the non root linux; still, I
>      > recompiled it just in case.
>      >
>      > Michele
>      >
>      > Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
>      > Ramsauer ha scritto:
>      >
>      > Hi,
>      >
>      > On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
>      > > Hi all,
>      > >
>      > > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
>      > is to run two
>      > > non root linux cells, however, as of right now, I'm not
>      > able to start
>      > > any non root linux cells.
>      > > First of all I don't receive an output from the cell (I
>      > do get output
>      > > from the apic-demo though), therefore I don't really know
>      > if they're
>      > > even crashing or not; this is the output I get from the
>      > hypervisor after
>      > > enabling the root cell and issuing the following command:
>      > >
>      > > sudo jailhouse cell linux configs/x86/linux_guest1.cell
>      > > ../buildroot-2023.11/output/images/bzImage -i
>      > > ../buildroot-2023.11/output/images/rootfs.cpio
>      >
>      > for the first few tries, simply don't load a ramdisk. Try to
>      > get the
>      > kernel booting. It will crash with "cannot mount rootfs". If
>      > we get so
>      > far, then you can continue specifying the ramdisk. But
>      > first, we have to
>      > get that far.
>      >
>      > >
>      > > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
>      > > Created cell "linux-x86-demo"
>      > > Page pool usage after cell creation: mem 336/32211, remap
>      > 16392/131072
>      > > Cell "linux-x86-demo" can be loaded
>      > > CPU 4 received SIPI, vector 100
>      > > CPU 3 received SIPI, vector 100
>      > > Started cell "linux-x86-demo"
>      > >
>      > > After this the cell appears to be running in cell list,
>      > however I can't
>      > > seem to get any output to confirm that (I even set
>      > > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
>      > appears on the vrtual
>      > > console accessed via "jailhouse console -f"). I also
>      > tried adding -c
>      > > "console=3DttyS0,115200".
>      >
>      > ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
>      > configuration?
>      > Actually, your cmdline is correct.
>      >
>      > > At this point if I try to disable/shutdown the cell, the
>      > system freezes
>      > > requiring a hard reset.
>      >
>      > Okay, is the guest Linux compiled with Jailhouse guest
>      > support? Please
>      > ensure that non-root Linux is compiled with
>      > CONFIG_JAILHOUSE_GUEST and
>      > CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
>      > Linux guests.
>      >
>      > >
>      > > Also, there seems to be a mismatch between the PCI bdf
>      > value in the log
>      > > above and the one in the cell's configuration. In both
>      > root and non root
>      > > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net device
>      > and the Root
>      > > cell correctly reports that ("Adding virtual PCI device
>      > 00:0f.0 to cell
>      > > "RootCell"").
>      >
>      > First things first. Let's try to get Linux kicked off before
>      > diving into
>      > PCI. Comment it out for the moment, let's do that later.
>      >
>      > Ralf
>      >
>      > >
>      > > If I understood correctly, once the cell works properly I
>      > won't need to
>      > > set the console anymore as I can assign an ip (-c "ip
>      > x.x.x.x" in the
>      > > cell linux command) and ssh to the cell, right?
>      > >
>      > > I attach the root and non root cells' configurations in
>      > case they're
>      > > needed. I can provide both the root and non root cell's
>      > kernel .conf and
>      > > the buildroot configuration I used if needed.
>      > >
>      > > Thank you for your time,
>      > > Michele
>      > >
>      > > --
>      > > You received this message because you are subscribed to
>      > the Google
>      > > Groups "Jailhouse" group.
>      > > To unsubscribe from this group and stop receiving emails
>      > from it, send
>      > > an email to jailhouse-de...@googlegroups.com
>      > > <mailto:jailhouse-de...@googlegroups.com>.
>      > > To view this discussion on the web visit
>      > >
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-87=
8e-7203214b4fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4=
fc3n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/82=
4bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com>> <https://groups.go=
ogle.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40goog=
legroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.=
com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegro=
ups.com?utm_medium=3Demail&utm_source=3Dfooter> <https://groups.google.com/=
d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.=
com?utm_medium=3Demail&utm_source=3Dfooter <https://groups.google.com/d/msg=
id/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com?u=
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
>     https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f=
9f-699daf338843n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338=
843n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/9a021e3f-caca-4ebe-9351-b=
e2c3e999446n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/9a021e3f-caca-4ebe-9351-be2c3e999446n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e4aef5c1-45fa-49f2-8b6c-04f36d7f556d%40oth-regensburg.de.
