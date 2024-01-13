Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB563ROWQMGQEMF22ZSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01E82CE5E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 21:09:29 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id ffacd0b85a97d-336937af9e9sf3495850f8f.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jan 2024 12:09:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705176569; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z+4pYPSJM5AY1fTZUnSrAKKITB1ocuGiAGSCIYH9IPCXcfUVZ4df6PgDrOAr3vjMae
         QufxkNeILJV4OoRqonDbJkwcj9iGwEQvLzc7IbMI8SPpTv00tgr58HseeLP+P/JYVxBu
         1TLP4Jiy5HYkEOp8E9zbIf+Vs+VlH1Dpx3s8PMj4+zZ/aGG3dRrnGYLUXEsDiTKvtIPM
         nZwxXBwwPxXs3JFK8u+JJ6AuFyJ8VcUDiyEPoNk/Razt3sFxTWYi3MQLGchIz1cS1pqy
         6x32SgHB6Unj5NHPT5tTGwyIpri33/F1NXKBKe+CSNrnvy2t2OcnRaTgInIesK7Feaaa
         ozUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:to:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=YZ3acGUkLffI7n9++kiDiIo7dHz0QCLx9HR5zQcvXzM=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=WfV4m4HU2Z3lncx6WBXKIEx2HV9inUUZ0xhDP64l+kkQICU3mYES0TPPa+bhrTvCVy
         dnOdjxxyMZu2AM7riH3cPHPDDTIzsfTkyrRuWbpqGlWegx9tJjD8ygSF8qp030usmaeO
         tflrDgBR4lQ5qMpL40eTh3GIHgW4+scl0dP6BZa2q71c+Etntj+RMEW/1nheZj4EpaUB
         IKETE902TR5zMMgZEviNSo4uZHVhUMvEPOS47PtYFu0JCbwxFC/OawM3RitT4hNQyJ6o
         8OfGQq1BNYx+9xBZ7fD3wvtiFaeAD8WfA4X7s9nyX4unsWZAAo1OJS7j6io6/yHlK3pM
         TDEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SHch7LAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1705176569; x=1705781369; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YZ3acGUkLffI7n9++kiDiIo7dHz0QCLx9HR5zQcvXzM=;
        b=J3aaP/xF0JEI8luzrvZXTrlEI7h4/XzeXanxuKrBNGUl3yfGHoFWhS/MJjShNij52h
         Oh6rM3w7z3xIPdbgzR99UqgV0XI8+u4QfRC5s/eU2E8tetXoEwOe1heZ+usVhW7Kxe68
         mAgMGlxqh/SvDLXgTOuUEoRL7uIv6Ad+p3rWL3E329TGncZH38s3v5xu4R/LqHc+RDG/
         X8k5mP2svKVQjN3+0zn91ZGHcRBv3fM0BYrhZ9CTCX0siDVqSqxDWG0CO2AQFDmoe4ql
         4so+vrzakTWtGkVk66vQNOg59NGF0qQ8cdK1xXj9TMWeKLYpWnP5hvtLUBBOAOcjs+QO
         JvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705176569; x=1705781369;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZ3acGUkLffI7n9++kiDiIo7dHz0QCLx9HR5zQcvXzM=;
        b=QS7K+PBu4qEsUqNlO8cnhh5mJh1TtqREDVche6bL+IRS4oFEicJzX92tf3uI26TwkQ
         HcAuLX1EDpZqldbIAYYrFsxVLIgU/9sXg9HFo6N6VJjZeqEaNiPZXDoLwPBalEgwtJyi
         PJ8A/hT9PkhfmUFjNT3y5cFqBxVlwuwROlgWStGYRAwjB4iOP0jrPTJyDExvI3sCBL9P
         T6uZ+G2Bxc9XTPUFsX0nPT7JF0V0IqIZentLM0vgS2vKTgM+1yhIpzUlvy6BcUX2SvQx
         NJrB8dygnauFQX0GOfLwcglKkxrIWFAsDd+RaYiFtDQyW/uhBELOhtmYo9/nVbiMrYFf
         lGwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxVuvScU6rKKI6PFRFnKth77UlxhjifxVKPA7mFZeI0gWX94puc
	F5HOJZY9DTvscBYbEqok410=
X-Google-Smtp-Source: AGHT+IHg8J8+0kEQlvrk/WeYTqnb8ShKWa7uburl6MC+2S+TDF1ODPpPTPFTtsY7iqfzwDk55fdCdg==
X-Received: by 2002:a05:600c:a002:b0:40d:bef5:d0d3 with SMTP id jg2-20020a05600ca00200b0040dbef5d0d3mr1683923wmb.123.1705176568395;
        Sat, 13 Jan 2024 12:09:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f86:b0:40e:5980:de04 with SMTP id
 n6-20020a05600c4f8600b0040e5980de04ls138637wmq.1.-pod-prod-00-eu; Sat, 13 Jan
 2024 12:09:26 -0800 (PST)
X-Received: by 2002:a05:600c:2981:b0:40e:3b81:efbf with SMTP id r1-20020a05600c298100b0040e3b81efbfmr1552140wmd.54.1705176565658;
        Sat, 13 Jan 2024 12:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705176565; cv=none;
        d=google.com; s=arc-20160816;
        b=rROLX1kNPr2mFWQtjwjRgeimn5ZB19eK7zsbGuuPRo0b9PanROYcgAO+LshxoOpbS2
         pyx3OXQPVxD2AXcDwGBHKsrRxKFQIkmJzmfFt+AV6ZFsgZfVPH5i6ai/GILqecl5UNse
         bmi8e6aYBwIFWH7axl0npEPr7Bk3K4m9jmKOvEDqFqXh10wInMyWXJqWTVoZ8nM9Ktfj
         3QJvn0YqCPB5ZIWU5VeMR4PJtp4DRCypYk0rfM7u/zeL2/zfoYlHsAPn94Y3JaV+8Yg0
         O1ui2bnvqV2N6hK9pVVIfSWIzvnuHL8twQen/VBzSVqSameBNu1dD2jhoNZ4L+aHfds1
         SQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Z+eAA9NHUccUVQZVcgAiI9/3g+qopBSUaGLmRYNPRnQ=;
        fh=xV0wa0Mgs5ocIf1n2t9ZgMFJEALBdodouLvqFRUuVHA=;
        b=Phd2KfSkQFmzB0gTUli99DgCB8MqJ6xy8RDzd+DwJU+hmwGA9c8SScDjhHthUQqTXP
         vBsXrHt8j7OaYw5aaql+Zv9AZWl1WLe6Crg6YGm6RqkJmGZJj+OqqNbFw4UCRT4YFRNM
         hriDORZNmhRILD57K7HFYZvzS+BghF2JK6i3cV/Xtrbvcxu/ZMhsuGskehoksL4u4/PA
         7rrfvlKwulE1tL+qei7yBuF5iLu1xKKz2dC2++8/7le/zOqG9yXEH8lN/xJu57RkjC66
         Thzw2joUUQ0NUPBu6CyugBi3q/Eljk5qyygRfERoqhFVKLtu1M+PEGHREn9JnybpgS2B
         2DSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SHch7LAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id s1-20020a5d69c1000000b003378da52b54si164947wrw.0.2024.01.13.12.09.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 0A4FE2A03AC;
	Sat, 13 Jan 2024 21:09:24 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4TC8cz5VB6zxqr;
	Sat, 13 Jan 2024 21:09:23 +0100 (CET)
Received: from [172.16.2.22] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Jan
 2024 21:09:23 +0100
Message-ID: <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
Date: Sat, 13 Jan 2024 21:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unable to start non root linux cell
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
 <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
 <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=SHch7LAB;
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

On 13/01/2024 18:08, Michele Pescap=C3=A8 wrote:
> Hi,
>=20
> The problem was that the ram regions in the non root configuration=20
> weren't detected as such because of the missing=C2=A0JAILHOUSE_MEM_DMA fl=
ag.=20

Yikes, makes sense.

> After adding that, I also had to add two pio_regions because the non=20
> root linux was crashing because of two ports which aren't present in=20
> /proc/ioports.

Uhm - which PIO ports? Don't simply assign PIO ports. There must be a=20
reason for them. What ports did crash?

Did you disable(!) CONFIG_ISA_DMA_API? Please disable it. Therefore, you=20
have to activate CONFIG_EXPERT first.

I *bet* it was i8237=E2=80=A6

> I also had to add mce=3Doff to the command line because i had an unhandle=
d=20

or disable CONFIG_X86_MCE.

> MSR error, I'll have to disable that in the kernel config.
> At this point the non root linux seems to start, I see the boot log. No=
=20

Excellent!

> way of interacting with it as there is not a login prompt or anything, I=
=20
> think I need to ssh to the cell at this point, right?

Was the initramdisk loaded correctly?

Did you assign - in your non-root cell config - the irqchip and the=20
corresponding interrupts of the uart?

> That means I'll now need to work on those ivshmem net devices.

If you need ivshmem, then this would be the next step.

   Ralf

>=20
> Thanks,
> Michele
>=20
> Il giorno sabato 13 gennaio 2024 alle 15:13:12 UTC+1 Ralf Ramsauer ha=20
> scritto:
>=20
>     Hi,
>=20
>     On 13/01/2024 12:28, Michele Pescap=C3=A8 wrote:
>      > Hi,
>      >
>      > You are right, I got confused about those addresses, my bad. At
>     least
>      > now I know that config is the correct one and I don't have to tink=
er
>      > with it.
>      > I'm back to a kernel panic from the inmate when booting the cell.
>     It's
>      > similar to the one I had earlier, not sure yet of what the
>     problem may be.
>=20
>     Great, we're a step further.
>=20
>      >
>      > Created cell "linux-2"
>      > Page pool usage after cell creation: mem 406/32211, remap
>     16392/131072
>      > Cell "linux-2" can be loaded
>      > CPU 9 received SIPI, vector 100
>      > Started cell "linux-2"
>      > CPU 8 received SIPI, vector 100
>      > No EFI environment detected.
>      > early console in extract_kernel
>      > input_data: 0x000000000275c308
>      > input_len: 0x00000000008b0981
>      > output: 0x0000000001000000
>      > output_len: 0x0000000001fccb30
>      > kernel_total_size: 0x0000000001e28000
>      > needed_size: 0x0000000002000000
>      > trampoline_32bit: 0x000000000009d000
>      >
>      > Decompressing Linux... Parsing ELF... done.
>      > Booting the kernel.
>      > [ =C2=A0 =C2=A00.000000] Linux version 6.2.0-rc3 (root@mp-LINUX-DE=
SKTOP)
>      > (x86_64-buildroot =C2=A0 =C2=A0 =C2=A0 -linux-gnu-gcc.br_real (Bui=
ldroot 2023.11)
>      > 12.3.0, GNU ld (GNU Binutils) 2.40) # =C2=A0 =C2=A0 =C2=A0 2 SMP P=
REEMPT_DYNAMIC
>     Fri
>      > Jan 12 17:36:57 CET 2024
>      > [ =C2=A0 =C2=A00.000000] Command line: earlyprintk=3DttyS0,115200
>      > [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>      > [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>      > [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>      > [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: =
'x87
>     floating
>      > point regi =C2=A0 =C2=A0 =C2=A0 sters'
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
>      > bytes, =C2=A0 =C2=A0 =C2=A0 =C2=A0using 'compacted' format.
>      > [ =C2=A0 =C2=A00.000000] signal: max sigframe size: 1360
>      > [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>      > [ =C2=A0 =C2=A00.000000] BIOS-e801: [mem
>     0x0000000000000000-0x000000000009efff] usable
>=20
>     Okay, here should be all memory regions listed. My non-root Linux in =
my
>     Qemu VM, for example, shows here:
>=20
>     [ 0.000000] BIOS-provided physical RAM map:
>     [ 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000000fffff]
>     usable
>     [ 0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000000100fff]
>     reserved
>     [ 0.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000048fffff]
>     usable
>=20
>     Are you absolutely sure, that you have no further modifications in
>     Jailhouse or the Linux loader?
>=20
>     Actually, in your case, there should be e820 as well (instead of e801=
).
>     Go to the Linux kernel sources, have a look at
>     arch/x86/kernel/e820.c:1279
>=20
>     and Jailhouse's jailhouse-cell-linux:638.
>=20
>     jailhouse-cell-linux fills information of all memory regions into the
>     zero page. Would you please instrument code (Linux/Jailhouse) to see
>     where those regions are not parsed?
>=20
>      > [ =C2=A0 =C2=A00.000000] printk: bootconsole [earlyser0] enabled
>      > [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>      > [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x0000000000000000-0x0000000000001fff] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x0000000000002000-0x000000000000212b] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
>      > [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>      > 0x000000000000212c-0x000000000009efff] u =C2=A0 =C2=A0 =C2=A0 sabl=
e
>      > [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>      > [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>=20
>     Just guessing loud: Hmm, you have guest support enabled, that's not t=
he
>     issue.
>=20
>      > [ =C2=A0 =C2=A00.000000] tsc: Detected 3393.624 MHz processor
>      > [ =C2=A0 =C2=A00.000017] .text .data .bss are not marked as E820_T=
YPE_RAM!
>=20
>     Here's the next error that makes me curious, why you system falls bac=
k
>     to E801...
>=20
>      > [ =C2=A0 =C2=A00.005745] last_pfn =3D 0x2e28 max_arch_pfn =3D 0x40=
0000000
>      > [ =C2=A0 =C2=A00.011025] x86/PAT: PAT support disabled because
>     CONFIG_X86_PAT is
>      > disabled =C2=A0 =C2=A0 =C2=A0 =C2=A0in the kernel.
>=20
>     Please enable CONFIG_X86_PAT and MTRR in your kernel.
>=20
>      > [ =C2=A0 =C2=A00.019362] x86/PAT: Configuration [0-7]: WB =C2=A0WT=
 =C2=A0UC- UC =C2=A0WB
>      =C2=A0WT =C2=A0UC- UC
>      > [ =C2=A0 =C2=A00.034867] Using GB pages for direct mapping
>      > [ =C2=A0 =C2=A00.039193] Kernel panic - not syncing: alloc_low_pag=
es: can not
>      > alloc memory
>=20
>     Yeah, that's the logical aftereffect after the errors above.
>=20
>     Thanks,
>     Ralf
>=20
>      > [ =C2=A0 =C2=A00.046183] CPU: 0 PID: 0 Comm: swapper Not tainted 6=
.2.0-rc3 #2
>      > [ =C2=A0 =C2=A00.052176] Call Trace:
>      > [ =C2=A0 =C2=A00.054606] =C2=A0<TASK>
>      > [ =C2=A0 =C2=A00.056691] =C2=A0? dump_stack_lvl+0x33/0x4e
>      > [ =C2=A0 =C2=A00.060510] =C2=A0? panic+0x157/0x303
>      > [ =C2=A0 =C2=A00.063723] =C2=A0? sprintf+0x56/0x80
>      > [ =C2=A0 =C2=A00.066936] =C2=A0? alloc_low_pages+0x70/0x1a0
>      > [ =C2=A0 =C2=A00.070930] =C2=A0? phys_pmd_init+0x1fc/0x2eb
>      > [ =C2=A0 =C2=A00.074839] =C2=A0? phys_pud_init+0x116/0x2d3
>      > [ =C2=A0 =C2=A00.078744] =C2=A0? __kernel_physical_mapping_init+0x=
11a/0x290
>      > [ =C2=A0 =C2=A00.084128] =C2=A0? init_memory_mapping+0x25e/0x3b0
>      > [ =C2=A0 =C2=A00.088558] =C2=A0? init_range_memory_mapping+0xe7/0x=
145
>      > [ =C2=A0 =C2=A00.093417] =C2=A0? init_mem_mapping+0x242/0x298
>      > [ =C2=A0 =C2=A00.097585] =C2=A0? setup_arch+0x74e/0xcbd
>      > [ =C2=A0 =C2=A00.101231] =C2=A0? start_kernel+0x66/0x8b7
>      > [ =C2=A0 =C2=A00.104965] =C2=A0? load_ucode_bsp+0x43/0x11b
>      > [ =C2=A0 =C2=A00.108873] =C2=A0? secondary_startup_64_no_verify+0x=
e0/0xeb
>      > [ =C2=A0 =C2=A00.114085] =C2=A0</TASK>
>      > [ =C2=A0 =C2=A00.116255] ---[ end Kernel panic - not syncing:
>     alloc_low_pages: can
>      > not all =C2=A0 =C2=A0 =C2=A0 oc memory ]---
>      >
>      >
>      > Thank you for your continuous support,
>      > Michele
>      >
>      > Il giorno sabato 13 gennaio 2024 alle 00:05:43 UTC+1 Ralf
>     Ramsauer ha
>      > scritto:
>      >
>      > Hi Michele,
>      >
>      > On 12/01/2024 14:07, Michele Pescap=C3=A8 wrote:
>      > > jailhouse cell load linux-2 linux-loader.bin -a 0x0
>      > > ../buildroot-2023.11/output/images/bzImage -a 0xffbe00 parameter=
s
>      > -a 0x1000
>      > > jailhouse cell start linux-2
>      > >
>      > > I take it the kernel is loaded at 0xffbe00 which is right at the
>      > edge of
>      > > the low ram region. In fact after issuing the cell load command
>     and
>      > > adjusting the path for the loader I get JAILHOUSE_CELL_LOAD:
>     Invalid
>      > > argument.
>      >
>      > Just tested cell-linux in a qemu machine, there it works, with
>     pretty
>      > similar addresses, which got me confused.
>      >
>      > After double-checking it: 0xffb.e00 is *not* at the edge of low me=
m:
>      >
>      > Low mem is 0x000.000 -- 0x0ff.fff
>      > Comm region is 0x100.000 -- 0x100.fff
>      >
>      > 0xffb.e00 is (obviously) way above.
>      >
>      > Please try to set your high mem's .virt_start to 0x200000. Then,
>      > 0xffbe00 is offsetted ~16MB inside your highmem, and it should wor=
k!
>      >
>      > IOW:
>      >
>      > /* high RAM */
>      > {
>      > .phys_start =3D 0x42300000,
>      > .virt_start =3D 0x200000,
>      > .size =3D 0x11000000,
>      > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>      > JAILHOUSE_MEM_EXECUTE |
>      > JAILHOUSE_MEM_LOADABLE,
>      > },
>      >
>      > Thanks
>      > Ralf
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
>     https://groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a=
72-79da2c434169n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/6712361a-eaef-49cc-8a72-79da2c434169n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434=
169n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/6712361a-eaef-49cc-8a72-79da2c434169n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/860c1e75-c28f-4157-9212-a=
3d87ad25b27n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/860c1e75-c28f-4157-9212-a3d87ad25b27n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b13f671c-b870-48b1-8f39-d5eae43c7a5b%40oth-regensburg.de.
