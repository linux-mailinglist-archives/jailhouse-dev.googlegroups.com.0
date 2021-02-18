Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4NDXCAQMGQEWINOWVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2A631E69F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Feb 2021 08:06:25 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id x14sf33009wrr.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Feb 2021 23:06:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613631985; cv=pass;
        d=google.com; s=arc-20160816;
        b=uqSINKzNks+7vNFi/2qrJu7+CNYruIIOxHNCcmZ8nVlguajWT+kZqToPo7gf+xtDdZ
         zNrzYEQ9Jlw66VC9j2Rij55MizB93dApCFwmR1zTAY+JeBeldBmm8LE36FjpC1x0SbMm
         adLrcVz/Y6v8XzsWlS0MBeGzouZn26Wv0K4/F0IkVlJTPfJdcdb3MtAPpVFDjx3pgIjp
         HGrJyYP3VEjQLftVjt7BMmEUZcbueWuH9kcJvgL5rnB7khc4M9LPsLQvJOGRCp3/aE6U
         EO0VQFmO+M7MfMJr+QHp2j+JF7K8MQT+EZVnFV09FZmwyawimJY7i9jY1Jembxp5rqrJ
         O1/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=WJziaZZGtTFkojzs1qGhmJIR8MG4LuiiNTXcmksweFg=;
        b=WkrVq+7sLtfuzRqSJKcXZP89fg1ODg9SQWN4RDg+25StfGzHuTgUI8tYEv9a9GjVYi
         UACv75IvXPXAVVrP7i2u/O0bAdU+5le0JlG8UGyS0UYSRy/TFdigwwoZWa1wq8fSfOHv
         vIMn+8YdHfFo/Ry5SCOemjtD5MsngWvPemMPgzeJcO5HDp40ZBhtj9/shykz1xPeRu1r
         OMt7gSFf4cnI1YXKfArcFpbQlLnelHrQIj4RbALaiWx10pBuIS4/R9StbzxOTaFKqVrH
         UkwZVod+hdacXPgWLosoODXrbJRepIfy+KnZ+hDbIYg23t9kxc+ZxWLqubxRAPiZ+Zlv
         xSDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WJziaZZGtTFkojzs1qGhmJIR8MG4LuiiNTXcmksweFg=;
        b=dJlGvcNeuKt93quYF8hAb4qoGK6tfm9nHSKUwgN7BQcf8zsvOlP7MRYPuq8AilzEB6
         8T9E01ggO1ET8cfWkEQa6OHi8uRA+So379BtIErortqFcSY3ttq7E3hQ7aPS+C1pIAxH
         e01IMi3V74n2tiK8iyYNbvQ4mPxaqoIuT3+q0aTEZVpF++ChoQyGHJHSF1WhqJYLrV+G
         20pgsl0UMbtjuzrvlgsvKNaiMg5oRRJvw+Gn2X+DW8MPRnDZ9e686aWlPnDEJE6PQGlH
         kYWb5PMe1ewa+hLMJHsNf4qzmS8thA4U+l5EUi4yfH0ih8Q+vNFZA79n+O4b9CpznpgJ
         WLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WJziaZZGtTFkojzs1qGhmJIR8MG4LuiiNTXcmksweFg=;
        b=sC2l89xGqagngqyPhSCyoqCtPs2Vr+s/0AeqoozQxFPu2b+P7g4t+u91bum1CZN3K8
         O3QyS6q0GlGGYyIk8H8cgl9YdEn7aalzLojAx9f/uKa6JM1c2dBBf11S3xGPai3zykrG
         qXvwsIVNi4k2HMNl+e5mzSQGM3L6byPTAa5HacxX/SgJ0+eqdtblvdG885XokAVL+a9T
         ycJyKhFEZwMLz1Vlp5UQx7l0Sj62n0dibmheQQ8AJe1mn8lG91GcbbH6y7ALWg7PoSfd
         TDEa1tDrMnPL0mt00EZGPZSK8k/WE+H9P+9QvIXkOMj/LqerG4Pi4tkltREfEro6Lob7
         jzAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DJ6Oo8ZsC1PjT2qqa5FMLmtCW2BJgURrQv+OUyIWYG9azBa2z
	QzjpxAyDLGA2XmtTNjBz0yM=
X-Google-Smtp-Source: ABdhPJz4wIxvhC9oiSolS15MLtB/fjweZqSfXnJE/3GkWLvcjj46WXWphZ1mrTLa1VJG5MOOQTYlqQ==
X-Received: by 2002:a1c:3804:: with SMTP id f4mr2291660wma.115.1613631985430;
        Wed, 17 Feb 2021 23:06:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1371:: with SMTP id q17ls1150135wrz.1.gmail; Wed,
 17 Feb 2021 23:06:24 -0800 (PST)
X-Received: by 2002:adf:bac8:: with SMTP id w8mr2905792wrg.68.1613631984481;
        Wed, 17 Feb 2021 23:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613631984; cv=none;
        d=google.com; s=arc-20160816;
        b=N2R2LR9yyGRzICm71Dee3/wJPsYg+OV5/WLZHUfUa2APn50Gx8AGhdYUeuMU/H254I
         e5tB+SrYCz/ufhT7mLN0tgjOGey3s4Ge1vWaSz7kOEgdWMN5KBx61Vo4T42cwAhP8u5/
         tgGOyp4WulrJBwKJ1TjNtQB7mFzKW5SXJ8onKN1NAoFf1a3tLGOXA4kZgNqPRe5yhpwL
         hYLnUJzhVjSCB6Oz0I/Bv29K5+5QCfzH4owarXg/1u/cwh8sL0JW56FCoEcy6mD0S3o1
         4cQINLXAfLDyjXQraFyEOdBI/DTzVjD4BYpGJ0REsJ35ah8ne1vmn04wg9remIDmWWa+
         nRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+HtrVrDF41zV/FgM8Svr3TvqechIVOZZ63QLJEkcaJg=;
        b=uK4O2akJSunsciuKkBNO8aimdp8H2M+vrcpCEVXYT542kygXchxB9SK2nrmzWSjcCp
         /2wp1F4/u7OA5KaPYfXzd3CVmYQD5CQIKzIEWgBEGAMpFmIIdVK1Ze6QSR3fmK4/FsGg
         T/pUcwe4f03G6+n+xnEIM/PG2knf2NvmjaIwjOIi/lGjd4k0IvK9oRbFi8o+hpP8P9sd
         l+r8UCK81xi6DsA8xvOZ08nqEaDV2bBboLCmvreHkIhkifYRTXqhRZAU0BzwTFmlsNHm
         KxpOLUZGCkZ53H67IE2I/J6vlIiVej+SE9DTlXTJz+g3QVgavsMEusm0Esk85eZF/z6N
         Tm5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t25si169430wmj.0.2021.02.17.23.06.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 23:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 11I76O4c014858
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Feb 2021 08:06:24 +0100
Received: from [139.22.135.163] ([139.22.135.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11I76N8M028059;
	Thu, 18 Feb 2021 08:06:23 +0100
Subject: Re: Overflow in MMIO registration
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
 <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
 <AM0PR03MB4450F982DDD1872D12FA09FBB68B9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <e4e5f179-ae06-6589-95e5-8f0785c8d09e@siemens.com>
 <AM0PR03MB4450BC428F28AF03F2616F33B6869@AM0PR03MB4450.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <41084eda-f26d-5538-f2fe-568cba2285fd@siemens.com>
Date: Thu, 18 Feb 2021 08:06:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <AM0PR03MB4450BC428F28AF03F2616F33B6869@AM0PR03MB4450.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 17.02.21 08:14, Sainz Markel wrote:
> On 12.02.21 10:05, Sainz Markel wrote:
>>>
>>> -----Mensaje original-----
>>> De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: mi=C3=A9rcoles, 10 =
de=20
>>> febrero de 2021 14:33
>>> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
>>> Asunto: Re: Overflow in MMIO registration
>>>
>>> CAUTION: This email originated from outside of the organization. Do not=
 click links or open attachments unless you recognize the sender and know t=
he content is safe.
>>>
>>>
>>> On 10.02.21 14:31, Jan Kiszka wrote:
>>>> On 10.02.21 12:15, Sainz Markel wrote:
>>>>> On 08.02.21 12:24, Kizska Jan wrote:
>>>>>
>>>>>> Something may have caused a subpage MMIO region to be created (page-=
unaligned memory region). If that region split-up didn't exist in the root =
cell already, things will fail. But I suspect that subpage is rather a symp=
tom, not the >cause.
>>>>>
>>>>>> Where there any compiler warnings when building the config? I would =
also recommend checking our configs via "jailhouse config check root.cell c=
ell1.cell cell2.cell ...". Or share what you created.
>>>>>
>>>>>> Jan
>>>>>
>>>>>> --
>>>>>> Siemens AG, T RDA IOT
>>>>>> Corporate Competence Center Embedded Linux
>>>>>
>>>>> There are no warning during compilation and jailhouse config check co=
mmand says it is everything correct.
>>>>>
>>>>> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cel=
l core3-cell.cell core4-cell.cell core5-cell.cell
>>>>>   Reading configuration set:
>>>>>   Root cell:     RootCell (sysconfig.cell)
>>>>>   Non-root cell: core1-cell (core1-cell.cell)
>>>>>  Non-root cell: core2-cell (core2-cell.cell)
>>>>>   Non-root cell: core3-cell (core3-cell.cell)
>>>>>  Non-root cell: core4-cell (core4-cell.cell)
>>>>>  Non-root cell: core5-cell (core5-cell.cell) Overlapping memory=20
>>>>> regions inside cell: None Overlapping memory regions with hypervisor:
>>>>> None Missing PCI MMCONFIG interceptions: None Missing IOMMU
>>>>> interceptions: None Missing resource interceptions for architecture
>>>>> x86: None
>>>>>
>>>>> Attached to the mail the cell files I'm using. The .bin file is the s=
ame as for apic-demo.
>>>>>
>>>>
>>>> Just looking at core1-cell.c reveals that you are neither aligning on=
=20
>>>> physical page boundaries for the base nor using page-aligned sizes.=20
>>>> So it is like I predicted. And it is NOT a simple copy of apic-demo.c.
>>>>
>>>
>>>> ...and we should likely enhance jailhouse-config-check to catch also t=
his case.
>>>
>>> God, don't know what was thinking at... That's working now, cell starts=
 correctly. I can't see any output in the console, what did you mean in a p=
revious main with " Hope you do not let all cells use the same UART console=
 in this duplication (PIO 0x3f8 etc.)." I'm now just creating a single cell=
 and no output is being shown...
>>>
>=20
>> I meant that you cannot hand out the single UART to multiple cells at th=
e same time. There is no virtualization of this resource. You can >use it, =
obviously, to bring up one instance of a cell and then disable it for that =
cell again.
>=20
>> Connection to the cell should go via ivshmem: ivshmem-net or virtio-over=
-ivshmem or something custom.
>=20
> After having modified the .c files to align sizes and boundaries, apparen=
tly cell starts with no issues. I understood what you said about using the =
same UART interface among all cell files and that it won't work. ATM I'm ju=
st starting a single cell and no console output is being displayed. What am=
 I doing wrong? Attached the updates .c files.=20
>=20
>=20

Systematic debugging is needed then: You can get the apic-demo in its
original form work and printing output? Then compare to all your
changes, revert them as long as it's not working. You will likely end up
at the relocated comm region, maybe more.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/41084eda-f26d-5538-f2fe-568cba2285fd%40siemens.com.
