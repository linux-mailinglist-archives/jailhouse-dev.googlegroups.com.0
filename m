Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB55URKWQMGQE3KFYXBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 1417D82CCF2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 15:13:13 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id ffacd0b85a97d-336862fa1a5sf4695425f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 06:13:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705155192; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fr3Evcyhkx1ny6P+M0gw0La1mYje1PDPHLSdLnvZdSdA27q9bWFXvOnQZRrLyMgCHH
         ffgcrZFRKT4xGkSI2SkKqjO7f2RfmELqLxaO6j2V6koYq7INsf8mU0Uq+cHR52lcl27u
         YNktf15eUcDniXOpGOmHrHGuJ9sA4vCnWkiGzOJUfJHFEHNczgM4CFJvqW/cNKcLRJ/n
         udAAontih+pGgSDgVKmYPdKiytLcjyiIu3A/umocHj5IP5oflHZGo9t++9BA6a7AaOIU
         FlYZnOjoOeIIJH6Gpr4+4RE5BEWpmchEZtyszFLyTBKkFgbP4tEYHC+UpFhqINq5ZQVs
         hu4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=xiA/Y42qHO4kuFckfDUT98HqgDs99j351zqhcUK/JEY=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=jlkU+ElrXHmanBTXSjQZHd8Ci4qMmGYklFznxA652P7Q5C8wZIpPc1/77jjrWene2Z
         XO4ctuW8CSkuPsORwvi/7ZAscQhxaBpxubWjK1McFX3ulSqVjJjh8L02D0vsO4nCrR4N
         pQM3IBmvu8IzVZX4ENbNYEYJgIrJzbQ6NDe9C5V8fmtlh6YVkD7w7CgAtt9AZHqNekjx
         TDMgNjVxywAa7kzppnEhZcRavf3aNcMbQcanTV/Bn2kE4oqRyI0Urwmp5PswxJSPq0AU
         UeN0OHKueLmm0cMgeEBaWVzZyQeUCqRM9/uHfULftcGbE4TMNDi/qWlkZhLI0F6eVG7O
         hilQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pOKdFPfH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705155192; x=1705759992; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xiA/Y42qHO4kuFckfDUT98HqgDs99j351zqhcUK/JEY=;
        b=vyNxANTLov+HnWGzEaBO2ZEwuqO509HI1GW6jHXX6VrAwNRpgO9DPEwsXwebSzRWUT
         /y8CRhiXpmbRpwlunynCuQ2xN3Q/Hvq0+YSjZ46NRnh5tDl7zznBAIvANCu66yoZC+1Q
         kcjP831cLav2biboxfljJk0/f35BExWJYk2L+uQmlNAlj4dWTiFwC+tA5iN1nYfbQO2L
         B8qomrfjlyON6sWsNR0mjO8mLdfYdaQdn1uvxfkC1pREE+1etN/PmG0goStVSa3d2OyS
         JiqAUkbF8aHrCGGD0MJAnAvHI8n4uqQDa9yPqDe2Uan8NE0J8PPzDVJMnAvoMggJA+X6
         IXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705155192; x=1705759992;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiA/Y42qHO4kuFckfDUT98HqgDs99j351zqhcUK/JEY=;
        b=UScinfUBZbjYFvUJ3Wh7OYjm0qEwomomW66Wn3lcNVJTNEvHgDwzXIafei3jkTxV2s
         BVQqcivzqvBlQ0xhbu4MfMFKr+/WycC0J7AaTv4K6zIYwI2zePpNfSqzd1AqZnowxg/T
         NlthIDhoQfp8vKn+VioNtUzbwrZjswJ7AW+XMBO+FzAJupskLGvXfn2MOgu/46rkmtaL
         aNHG42X6TpUdbkPmdFeqlOGHUp/ruyxZMirLuTbqL8gchbNGeiUttLvP3coBF2JB3agJ
         6ZhEtwLAVxRhJWofprtd1YzLvGA1udD5eyIr5hUZjfwY/5ijoR4LVGuUChyy420TPi13
         yPjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzkhZibG/7DoHMxnZWhCMOchC/Er7WMsezWm1wMLOICv1ijSIZO
	zQZ+1I/DAhOYrmQUxGSEm1Q=
X-Google-Smtp-Source: AGHT+IHpeGmnmC8r8TOXTYzkdmcJ0sM9w2fKD8e/d9RWhZmEA3763JWlnu83PKC9NKw08XfF8+VILw==
X-Received: by 2002:adf:e88c:0:b0:337:3f58:e2f9 with SMTP id d12-20020adfe88c000000b003373f58e2f9mr1367745wrm.11.1705155192586;
        Sat, 13 Jan 2024 06:13:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f890:0:b0:336:61a0:bd54 with SMTP id u16-20020adff890000000b0033661a0bd54ls1094662wrp.2.-pod-prod-01-eu;
 Sat, 13 Jan 2024 06:13:10 -0800 (PST)
X-Received: by 2002:a5d:64e9:0:b0:337:9e99:813b with SMTP id g9-20020a5d64e9000000b003379e99813bmr486320wri.41.1705155189793;
        Sat, 13 Jan 2024 06:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705155189; cv=none;
        d=google.com; s=arc-20160816;
        b=yE6y2T0su68lqCiR3IhUjkd20J2t1r8v55yTBCCOXuXa2+NxKsjH1PwJ8f8XnLaNu2
         XqtgxsVn5Lnhm17rms74oAJUUApBhrPqh4X4HuHUjGoL7MOh+CMyoUVW4S9QBklJmMSD
         qu9VrtyzQ7BBlMC+h8p3SD4Om6+Lzv+pEziuzaBYhulGDCLlFdOVkcW2hkwGyhfaRNhT
         ki49C9mmcpCR/OGyjwkjV/fR5tgG45L9M4SWOY6IQpJLKv9HSpg9OC12UJtagR90jmuj
         aJHM+araQr1KY/4KXK1bW0G2Tcq4FAFNIf2Hm4vFbqu6Fatjlia8m1mTndR4YUa3AUKX
         FLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jdSRYvHDvy7Kc2qskeC3wBSl11T2GO4pJDdfjecbfNU=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=0qEf7ZoEB2FQxszsWOMq4BwWC2D278ms/znwrUFeC25H38rbMsmPWWTITw/QVHE4rw
         za5bWlwyOId3QX/guzYOTWs8fqSQlcBs/pNCqCgacqNGvzYEnmSjxqaB7DdqIYT7hF3g
         TSCjIBMwukVynueMM6YZKnF1LBJu22rR9Dl5OYsaHZKiey2UsGcUbP/MC1WvlXwdvvdx
         m4kaLzkBvh+0fYYX4DBy+37Dahu/okNYbnPIfWax1lyBHbCodjU8feXUg5EIuDPTDD2V
         Dvy8evc2S+KqCSkcjAx7aGcEcl1lP8ESV0Jg/xNxgt7lw6BNRxbrryO9OSxXo4rE0R/h
         LEXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pOKdFPfH;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id h11-20020a5d4fcb000000b00336c518da12si166088wrw.5.2024.01.13.06.13.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 06:13:09 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 3E4B82A045B;
	Sat, 13 Jan 2024 15:13:08 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4TC0jw06XMzxq2;
	Sat, 13 Jan 2024 15:13:08 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Jan
 2024 15:13:07 +0100
Message-ID: <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
Date: Sat, 13 Jan 2024 15:13:07 +0100
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
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
 <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
 <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pOKdFPfH;
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

On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> You are right, I got confused about those addresses, my bad. At least=20
> now I know that config is the correct one and I don't have to tinker=20
> with it.
> I'm back to a kernel panic from the inmate when booting the cell. It's=20
> similar to the one I had earlier, not sure yet of what the problem may be=
.

Great, we're a step further.

>=20
> Created cell "linux-2"
> Page pool usage after cell creation: mem 406/32211, remap 16392/131072
> Cell "linux-2" can be loaded
> CPU 9 received SIPI, vector 100
> Started cell "linux-2"
> CPU 8 received SIPI, vector 100
> No EFI environment detected.
> early console in extract_kernel
> input_data: 0x000000000275c308
> input_len: 0x00000000008b0981
> output: 0x0000000001000000
> output_len: 0x0000000001fccb30
> kernel_total_size: 0x0000000001e28000
> needed_size: 0x0000000002000000
> trampoline_32bit: 0x000000000009d000
>=20
> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DESKTOP)=
=20
> (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real (Buildroot =
2023.11)=20
> 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 SMP PREEMPT_=
DYNAMIC Fri=20
> Jan 12 17:36:57 CET 2024
> [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
> [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
> [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
> [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 fl=
oating=20
> point regi =C2=A0 =C2=A0 =C2=A0 sters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX re=
gisters'
> [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_siz=
es[2]: =C2=A0256
> [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context si=
ze is 832=20
> bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.
> [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
> [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
> [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem 0x0000000000000000-0x00000000000=
9efff] usable

Okay, here should be all memory regions listed. My non-root Linux in my=20
Qemu VM, for example, shows here:

[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]=20
reserved
[    0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff] usabl=
e

Are you absolutely sure, that you have no further modifications in=20
Jailhouse or the Linux loader?

Actually, in your case, there should be e820 as well (instead of e801).=20
Go to the Linux kernel sources, have a look at arch/x86/kernel/e820.c:1279

and Jailhouse's jailhouse-cell-linux:638.

jailhouse-cell-linux fills information of all memory regions into the=20
zero page. Would you please instrument code (Linux/Jailhouse) to see=20
where those regions are not parsed?

> [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
> [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
> [ =C2=A0 =C2=A00.000000] extended physical RAM map:
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=A0 sable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 sable
> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem=20
> 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=A0 sable
> [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
> [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse

Just guessing loud: Hmm, you have guest support enabled, that's not the=20
issue.

> [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
> [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as E820_TYPE_RAM=
!

Here's the next error that makes me curious, why you system falls back=20
to E801...

> [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x400000000
> [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because CONFIG_X86=
_PAT is=20
> disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.

Please enable CONFIG_X86_PAT and MTRR in your kernel.

> [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=A0WT =C2=A0=
UC- UC =C2=A0WB =C2=A0WT =C2=A0UC- UC
> [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
> [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_low_pages: can=
 not=20
> alloc memory

Yeah, that's the logical aftereffect after the errors above.

Thanks,
   Ralf

> [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc=
3 #2
> [ =C2=A0 =C2=A00.052176] Call Trace:
> [ =C2=A0 =C2=A00.054606] =C2=A0<TASK>
> [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
> [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
> [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
> [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
> [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
> [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
> [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_init+0x11a/0x2=
90
> [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3b0
> [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe7/0x145
> [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298
> [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
> [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
> [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
> [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_verify+0xe0/0xeb
> [ =C2=A0 =C2=A00.114085] =C2=A0</TASK>
> [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing: alloc_low_p=
ages: can=20
> not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
>=20
>=20
> Thank you for your continuous support,
> Michele
>=20
> Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf Ramsauer ha=20
> scritto:
>=20
>     Hi Michele,
>=20
>     On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
>      > jailhouse cell load linux-2 linux-loader.bin -a 0x0
>      > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameters
>     -a 0x1000
>      > jailhouse cell start linux-2
>      >
>      > I take it the kernel is loaded at 0xffbe00 which is right at the
>     edge of
>      > the low ram region. In fact after issuing the cell load command an=
d
>      > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD: Inval=
id
>      > argument.
>=20
>     Just tested cell-linux in a qemu machine, there it works, with pretty
>     similar addresses, which got me confused.
>=20
>     After double-checking it: 0xffb.e00 is *not* at the edge of low mem:
>=20
>     Low mem is 0x000.000 -- 0x0ff.fff
>     Comm region is 0x100.000 -- 0x100.fff
>=20
>     0xffb.e00 is (obviously) way above.
>=20
>     Please try to set your high mem's .virt_start to 0x200000. Then,
>     0xffbe00 is offsetted ~16MB inside your highmem, and it should work!
>=20
>     IOW:
>=20
>     /* high RAM */
>     {
>     .phys_start =3D 0x42300000,
>     .virt_start =3D 0x200000,
>     .size =3D 0x11000000,
>     .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>     JAILHOUSE_MEM_EXECUTE |
>     JAILHOUSE_MEM_LOADABLE,
>     },
>=20
>     Thanks
>     Ralf
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-7=
9da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b4520b71-86ba-48e7-b9ad-c720c4f6cb42%40oth-regensburg.de.
