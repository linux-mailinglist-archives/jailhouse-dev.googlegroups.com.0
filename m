Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQUJ7OWAMGQEMJ4PZYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id DB06B829E77
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 17:24:36 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id 2adb3069b0e04-50e7b20360bsf3619782e87.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jan 2024 08:24:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704903876; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kg0PrTN0E7mfrVycumPpl43LHYolyWELS43e87/YIwEAlne6zbGaMNzKdRKsrUXuYZ
         ItpepqYgABgvyQ8rU8munC5a/j6/MwLqVLHuo/mE6o6YAiN/LxOCru8bmvIP5lBkmrRy
         KZeb2olt4y2IGkrlzypVQZpY/NgS6juGxZuiPGx24cDU7dC7ZWjpHGuMarMRoFwv8T2i
         kBYCSrmMQ8lZawvN86ohOhAjg339QbcJoBDT/qsQ51vsTX23VAD4xrly/NpDzHv8S+Mp
         JczG52YHhFDREarz+wXuOfPMdHnU8IvdfC92ldjTbKkqIaOz937nf0+GR84A9Nxc+HcB
         +9bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=6wrTRKCrrrXsmGQ9x13igejply+ytdbL+n2qmheJdV4=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=CU53oP/F8vKRYrjog3OqMS7dg9pmoUzuD3+82pY0AfYY7ZHx+JpoOYnFABKzWdtr9k
         GGcVmvCqT06yaWjaWxFRzldaqHJu3m+suyihYszaZ2Vy8h1UmVh5y9ka0tiRfE2e4fV9
         OcuV9sKxbUk9NJvsNPw3ccn/gid0Si1etZWWJLz4KpAMYBDOLdF9zGAz0Oh5aRdotqgd
         7Kzny+h9/9fqo5AKp8giRd+/Pd1sv4IcTKHH67l0NPxZzt2GGCIpBnxwGgyzDV7BtKs8
         kI7h+HocGIo6N/4kKvB9HId6Wbhb19yOI7ajQJzlRLQucluIi6KIwpCsuzJ3yBQ6YiGL
         PFow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SklSnYrc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704903876; x=1705508676; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6wrTRKCrrrXsmGQ9x13igejply+ytdbL+n2qmheJdV4=;
        b=A5d77ApiGGKimLygpVD2iu87dL/dlPVM7yoc3WdfxIBwyzbpwf09czM391yLvckPry
         Uu/+IQqu7EP2628OMr9pOMD/D/0c02sOrUSQHh2fL66p+g14FjOSms77MYKGeWcWRq1M
         qIX2WvLGTvSRuPwEkauhzN6oKiqWec9syyxny/5I/BSLVdcXASS5Q3EeCg2k/c8gWMeT
         wLgf5dX6+OAgfpiqg258dErvmFdfmKOFbwiswd2YS6ZUH2xbdyiEDQIpIDMvghRGHj88
         sMC21wtfuFBXEMtDmJnVE/LKKA5l63/dWkLERU7W+jWS0vIJOQjC/xQE/U/LymbLIT5i
         qAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704903876; x=1705508676;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wrTRKCrrrXsmGQ9x13igejply+ytdbL+n2qmheJdV4=;
        b=ra0Ww9uH3jxHMzt2t8jQPzOWlhSbEfGZ6d462bm6hNKDb2Vl2eKfXsvv2JkTRcar3T
         VDhf+BBPLc0V/QHVdDrJJs04r/cudoNwgf674Q9h+8zGP4xCKj4ojzzpaflH+n/5pJlt
         Y6WgIdAFljDLS7rPW8Igu/7jZDp3zVESmj10DjlHlfUMAF/PCywUaTiJAyuYM9uqCUN5
         cxpymlcAIeRsDHG9Or3mqwfdcCIG7LbZ41ljFpxOD68/3lCzf0WDb1ONaKtz5Qlt1bWJ
         tTegAR00bVizNKPzvpgCErR++q+soBFc4s2nZnNFsF/wBMv/KOxtqxkmMEqH7yIPunPc
         gkoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YymOaoFZWE0MQ7KGIJjnwZdcVX4hvhEwiLfzrU4r2HGk0QLD/iN
	HXbLt2ZVRPBriqO3kjICgBA=
X-Google-Smtp-Source: AGHT+IHA/Y8nRADYHoS05Qe1nXtGZHGudPtyGXQD2vGP9LYDd0qclKnHtAvVtqL5L9ski5vnljP3Vg==
X-Received: by 2002:a05:6512:3683:b0:50e:aa8c:e558 with SMTP id d3-20020a056512368300b0050eaa8ce558mr518746lfs.2.1704903875136;
        Wed, 10 Jan 2024 08:24:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:a8f:b0:50e:7d1d:f1ff with SMTP id
 m15-20020a0565120a8f00b0050e7d1df1ffls166885lfu.1.-pod-prod-05-eu; Wed, 10
 Jan 2024 08:24:32 -0800 (PST)
X-Received: by 2002:a05:6512:3b07:b0:50e:7daf:3141 with SMTP id f7-20020a0565123b0700b0050e7daf3141mr773085lfv.58.1704903871933;
        Wed, 10 Jan 2024 08:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704903871; cv=none;
        d=google.com; s=arc-20160816;
        b=GQzELIVfqx2UMYiEtIg+JUpsZqndsF8lDRu1DZTkFlcsSktKd2iDIAXrqDrCu9FMvH
         IEwPpR7qSitO7+H0o07BxNj1DBiK7+BXZLQnsARVse4xyynzAdQ5lOqJKIimmyoa7+FT
         UXGAylnYTjerNo1C0kSIhQUwUtDJt3fp2RNRuUHPVFFIe8tLwF1QBNDLE6lg+FJd8I5K
         zATy9pyqjaBzJi3HJeTuPAPPRv4TirYhFrwQGJDLxqluO8B5B5kYRradGO8eFhjZLGBk
         Xqy/a235jNC3WyyKuuQVc7F4/zVKWzfr+/jLtjuOT8fzSkeJKaoQCWdq25cZsFlO+Td3
         NRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TbQbkT7eC8/hhOPli/cTscB2LnS6evrcYwCTP2jnabM=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=WvGuIAAFRN3PywSN1tb/bzVND8PlpY7KeV3YHhPrT4M1NASATnL3+lKAcAqpPbsZoK
         PlW/hdMN76k5QfDzPxIookp6srTTy3uzUYo735A4N5WBs3Y0dtvnSeFqAzKOJkA8pU10
         vGeqRjbf/lGl9cIyU4USh1JRpvY+/5+WmcNN2UrLnH7dV2UhPVSRKa0j69kE+/RZmfsX
         62eq8MpRwgH5CARVZLjbTzyp/dAMDDT4Hha8/g+XttXAgUOBOMJVSjMZdQP3KTuPlv3o
         d9vRetZGQuzFE8XlBQhqzPBpzBQwxvVpic5zaap+8aAuv+N66FEyFnGzKaVqkjAOmXZJ
         TWuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SklSnYrc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id y15-20020a19640f000000b0050e6482697bsi250149lfb.12.2024.01.10.08.24.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:24:31 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 690C02A0540;
	Wed, 10 Jan 2024 17:24:30 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4T9Cmt16MQzxq2;
	Wed, 10 Jan 2024 17:24:30 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Jan
 2024 17:24:29 +0100
Message-ID: <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
Date: Wed, 10 Jan 2024 17:24:29 +0100
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <2202bf30-5b2c-45ea-9f9f-699daf338843n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SklSnYrc;
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

Hi,

On 09/01/2024 19:58, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> Just an update, I was able to get the following output by adding -c=20
> "earlyprintk=3DttyS0,115200" to the command line:
>=20
> Started cell "linux-1"
>=20
>=20
> Invalid physical address chosen!

could you please share your system and non-root cell configuration?

It smells like you have an overlap with the communication region. You=20
can check that with tools/jailhouse-config-check.

>=20
>=20
>=20
>=20
> Physical KASLR disabled: no suitable memory region!

Disable KASLR in your kernel for the moment. You don't need it while=20
ramping up your system.

Thanks,
   Ralf

>=20
> [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=
=20
> (x86_64-buildroot-linux-gnu-gcc.br_real (Buildroot 2023.11) 12.3.0, GNU=
=20
> ld (GNU Binutils) 2.40) #2 SMP PREEMPT_DYNAMIC Sun Jan =C2=A07 18:35:23 C=
ET 2024
> [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
> [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
> [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
> [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 fl=
oating=20
> point registers'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_siz=
es[2]: =C2=A0256
> [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context si=
ze is 832=20
> bytes, using 'compacted' format.
> [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1776
> [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
> [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem 0x0000000000000000-0x00000000000=
9efff] usable
> [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
> [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
> [ =C2=A0 =C2=A00.000000] extended physical RAM map:
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000000000-0x0000000000001fff] usable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000002000-0x000000000000212b] usable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x000000000000212c-0x000000000009efff] usable
> [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
> [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
> [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
> [ =C2=A0 =C2=A00.000019] .text .data .bss are not marked as E820_TYPE_RAM=
!
> [ =C2=A0 =C2=A00.005751] last_pfn =3D 0x3630 max_arch_pfn =3D 0x400000000
> [ =C2=A0 =C2=A00.011039] x86/PAT: Configuration [0-7]: WB =C2=A0WC =C2=A0=
UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT
> Memory KASLR using RDRAND RDTSC...
> [ =C2=A0 =C2=A00.032374] Using GB pages for direct mapping
> [ =C2=A0 =C2=A00.036743] Kernel panic - not syncing: alloc_low_pages: can=
 not=20
> alloc memory
> [ =C2=A0 =C2=A00.043712] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc=
3 #2
> [ =C2=A0 =C2=A00.049702] Call Trace:
> [ =C2=A0 =C2=A00.052134] =C2=A0<TASK>
> [ =C2=A0 =C2=A00.054219] =C2=A0dump_stack_lvl+0x3a/0x58
> [ =C2=A0 =C2=A00.057865] =C2=A0dump_stack+0x10/0x18
> [ =C2=A0 =C2=A00.061162] =C2=A0panic+0x15c/0x308
> [ =C2=A0 =C2=A00.064205] =C2=A0alloc_low_pages+0x7d/0x1c0
> [ =C2=A0 =C2=A00.068024] =C2=A0phys_pmd_init+0x1f2/0x2eb
> [ =C2=A0 =C2=A00.071758] =C2=A0phys_pud_init+0x114/0x2d5
> [ =C2=A0 =C2=A00.075493] =C2=A0phys_p4d_init+0x4c/0x269
> [ =C2=A0 =C2=A00.079135] =C2=A0? __raw_callee_save___native_queued_spin_u=
nlock+0x15/0x30
> [ =C2=A0 =C2=A00.085649] =C2=A0__kernel_physical_mapping_init+0x11e/0x29a
> [ =C2=A0 =C2=A00.090859] =C2=A0kernel_physical_mapping_init+0xf/0x20
> [ =C2=A0 =C2=A00.095631] =C2=A0init_memory_mapping+0x273/0x410
> [ =C2=A0 =C2=A00.099890] =C2=A0init_range_memory_mapping+0xec/0x150
> [ =C2=A0 =C2=A00.104574] =C2=A0init_mem_mapping+0x268/0x2e7
> [ =C2=A0 =C2=A00.108567] =C2=A0setup_arch+0x839/0xdcf
> [ =C2=A0 =C2=A00.112039] =C2=A0? lockdown_lsm_init+0x21/0x2f
> [ =C2=A0 =C2=A00.116120] =C2=A0start_kernel+0x6e/0x997
> [ =C2=A0 =C2=A00.119680] =C2=A0x86_64_start_reservations+0x24/0x2c
> [ =C2=A0 =C2=A00.124281] =C2=A0x86_64_start_kernel+0xec/0xff
> [ =C2=A0 =C2=A00.128360] =C2=A0secondary_startup_64_no_verify+0xe5/0xeb
> [ =C2=A0 =C2=A00.133400] =C2=A0</TASK>
> [ =C2=A0 =C2=A00.135570] ---[ end Kernel panic - not syncing: alloc_low_p=
ages: can=20
> not alloc memory ]---
> Closing cell "linux-1"
> Page pool usage after cell destruction: mem 254/32211, remap 16392/131072
> CPU 4 received SIPI, vector 96
> CPU 5 received SIPI, vector 96
>=20
> This happens both with and without the initrd in the command, i'll try=20
> to solve this and see what happens.
>=20
> By the way, is it possible that the new cell starts transmitting with a=
=20
> baud rate different than the root cell? Without specifying the speed in=
=20
> the command above the serial console stopped receiving anything until I=
=20
> disabled and re-enabled the hypervisor. If not I may have something=20
> wrong on my end to solve
>=20
> Il giorno marted=C3=AC 9 gennaio 2024 alle 17:37:48 UTC+1 Michele Pescap=
=C3=A8 ha=20
> scritto:
>=20
>     I stand corrected, the freeze happens when i do not set
>     JAILHOUSE_CELL_PASSIVE_COMMREG in the inmate
>=20
>     Il giorno marted=C3=AC 9 gennaio 2024 alle 17:26:57 UTC+1 Michele Pes=
cap=C3=A8
>     ha scritto:
>=20
>         Hi, thank you for replying.
>=20
>         ttyS0 is indeed whitelisted in the inmate and the number of
>         pio_regions is set accordingly.
>=20
>         As for the crash after disable/shutdown, I think it was related
>         to the PCI device, after commenting that and the corresponding
>         regions out I no longer get that freeze. CONFIG_JAILHOUSE_GUEST a=
nd
>         CONFIG_JAILHOUSE_DBCON were already set in the kernel
>         configuration I'm using for the non root linux; still, I
>         recompiled it just in case.
>=20
>         Michele
>=20
>         Il giorno marted=C3=AC 9 gennaio 2024 alle 14:14:33 UTC+1 Ralf
>         Ramsauer ha scritto:
>=20
>             Hi,
>=20
>             On 08/01/2024 23:56, Michele Pescap=C3=A8 wrote:
>              > Hi all,
>              >
>              > I have an AMD Ryzen 2600 on a b450 motherboard. My goal
>             is to run two
>              > non root linux cells, however, as of right now, I'm not
>             able to start
>              > any non root linux cells.
>              > First of all I don't receive an output from the cell (I
>             do get output
>              > from the apic-demo though), therefore I don't really know
>             if they're
>              > even crashing or not; this is the output I get from the
>             hypervisor after
>              > enabling the root cell and issuing the following command:
>              >
>              > sudo jailhouse cell linux configs/x86/linux_guest1.cell
>              > ../buildroot-2023.11/output/images/bzImage -i
>              > ../buildroot-2023.11/output/images/rootfs.cpio
>=20
>             for the first few tries, simply don't load a ramdisk. Try to
>             get the
>             kernel booting. It will crash with "cannot mount rootfs". If
>             we get so
>             far, then you can continue specifying the ramdisk. But
>             first, we have to
>             get that far.
>=20
>              >
>              > Adding PCI device ff:1f.7 to cell "linux-x86-demo"
>              > Created cell "linux-x86-demo"
>              > Page pool usage after cell creation: mem 336/32211, remap
>             16392/131072
>              > Cell "linux-x86-demo" can be loaded
>              > CPU 4 received SIPI, vector 100
>              > CPU 3 received SIPI, vector 100
>              > Started cell "linux-x86-demo"
>              >
>              > After this the cell appears to be running in cell list,
>             however I can't
>              > seem to get any output to confirm that (I even set
>              > JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE, but nothing
>             appears on the vrtual
>              > console accessed via "jailhouse console -f"). I also
>             tried adding -c
>              > "console=3DttyS0,115200".
>=20
>             ttyS0, i.e., x86 Port 0x3f8 is whitelisted in the cell
>             configuration?
>             Actually, your cmdline is correct.
>=20
>              > At this point if I try to disable/shutdown the cell, the
>             system freezes
>              > requiring a hard reset.
>=20
>             Okay, is the guest Linux compiled with Jailhouse guest
>             support? Please
>             ensure that non-root Linux is compiled with
>             CONFIG_JAILHOUSE_GUEST and
>             CONFIG_JAILHOUSE_DBCON. The first one is mandatory for x86
>             Linux guests.
>=20
>              >
>              > Also, there seems to be a mismatch between the PCI bdf
>             value in the log
>              > above and the one in the cell's configuration. In both
>             root and non root
>              > cells i set .bdf =3D (0x0f << 3) for the IVSHMEM net devic=
e
>             and the Root
>              > cell correctly reports that ("Adding virtual PCI device
>             00:0f.0 to cell
>              > "RootCell"").
>=20
>             First things first. Let's try to get Linux kicked off before
>             diving into
>             PCI. Comment it out for the moment, let's do that later.
>=20
>             Ralf
>=20
>              >
>              > If I understood correctly, once the cell works properly I
>             won't need to
>              > set the console anymore as I can assign an ip (-c "ip
>             x.x.x.x" in the
>              > cell linux command) and ssh to the cell, right?
>              >
>              > I attach the root and non root cells' configurations in
>             case they're
>              > needed. I can provide both the root and non root cell's
>             kernel .conf and
>              > the buildroot configuration I used if needed.
>              >
>              > Thank you for your time,
>              > Michele
>              >
>              > --
>              > You received this message because you are subscribed to
>             the Google
>              > Groups "Jailhouse" group.
>              > To unsubscribe from this group and stop receiving emails
>             from it, send
>              > an email to jailhouse-de...@googlegroups.com
>              > <mailto:jailhouse-de...@googlegroups.com>.
>              > To view this discussion on the web visit
>              >
>             https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae=
-47c9-878e-7203214b4fc3n%40googlegroups.com <https://groups.google.com/d/ms=
gid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7203214b4fc3n%40googlegroups.com>=
 <https://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-7=
203214b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <htt=
ps://groups.google.com/d/msgid/jailhouse-dev/824bacc4-b7ae-47c9-878e-720321=
4b4fc3n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/2202bf30-5b2c-45ea-9f9f-6=
99daf338843n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/2202bf30-5b2c-45ea-9f9f-699daf338843n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0431cb6c-c2ca-4417-97d4-f0dc9bc3f389%40oth-regensburg.de.
