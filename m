Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBF5US74AKGQEUVD2TZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46F218A3C
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jul 2020 16:37:11 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id a26sf39693256ejr.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jul 2020 07:37:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594219031; cv=pass;
        d=google.com; s=arc-20160816;
        b=ILZutOa6Fydj1NLrtcUZxfWe7WvTTGk0OcyxRHcv6sscTEReLC4xEckxD3P7/mLX7c
         b9TK3MIzFqHH4dIorRYvu4CBmJ5R2/a0K9X39Tpp4cVd6qviURDH2yxe4xYJt8dFfTrA
         7nxMhmQzFONKxN/8QtvYvvHB/wWekJjiu3zX4xZ+4YYxxU5mGAnPAgff4aCJcBp8XgqD
         C+WMiMC4n4tPUhhc3G+p1UMFASMKeA4CXRdCD91URDJrVkwsL0rHq0IyFcKFgAiorJns
         gt6fGmsrsXjRQ29rOw0mJED2Bu/9YUJwXsT6OSuqkwX2J9bV7SH7NWXEPfygeANZD9x8
         NvzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=hdTaqJthLUghzyMFjzzImrQhDWOWwVVQrabz5JAXV6A=;
        b=naMkJ5Ur13UHb5IJ8H4K8TS4WXpBoP8vBeCll0kGRQvSKx3kyVEzRxl0kguK3PyWOr
         Ls0dA1XYgjGkdjhSi2QtU+UGbAY65MyItZftgC9FQ7EZOejfDHa5TM6aQiLnuRUUqEiJ
         qmkm5gEuuwNwQnfWnQEBfsXzzvEHFuhIeA7x5OC4ZdF6wrROfdk9up1hlx+Jd9/wytmI
         +tRts3bI7XN4vWPWKZLzvr2KE2Iy2yygsjwWUrTxaJRs/a2R15cHV+9HtN/gmqWtq31K
         PMxjMy25ijrwY9EATbpRf3nYPdHlHVuo4279K2wCz22VNZ02Gs8QMN/FX2LDXHjcIweY
         +6AQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="kb/WmEbW";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hdTaqJthLUghzyMFjzzImrQhDWOWwVVQrabz5JAXV6A=;
        b=FyHDnN4+M0YOOu9Jy4Xz9StXO1SQVo0FlATFBeOPFEbbjKnDe/jpKIJy0UzRxOqwq9
         eoaSY6sT6f+naOfiCGfwHLbVbavbge92Uwt24w0L4Nj2KjyltzwVrQYW7R2lm9hfu+kM
         TfICaoMxl7tfUe+jlGCDEmllksh4IgpwNX2JmIo17OV6qwxlZFza9wgVeyFntgecz5NF
         s9pIk7GbbcLJtwCVku+Jhypf6cEqqIz8y1J93nskVDC9dQWGZEqmysZD+tk62UPmcOy2
         sz/qUJvxH7qHV/8gUFS9gmDGQsQFRU50ye8Hm390tV/6dzsJNFvpfIXAW1Hz4p5wTwHg
         znBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hdTaqJthLUghzyMFjzzImrQhDWOWwVVQrabz5JAXV6A=;
        b=sJFnD8iInHVY5kuG1Bd55PlcZrGh+cGxdixyvgCkBYB6aExV9H9Gr9qK6WESSITp2N
         w3CKCCV1AkUyaEWjZDaXUcQSPzWY00aqmq9jti/gl1cP/rCk8qXxryhOoxOF+rHSY4u8
         yZaCgDiqsF/wgnMzlkE8GMJZoKhhzlPxo9YAf4dMAOZWYyoKPC/MYyVYQzsqB8e/yPeS
         ohV4orTGAEhGnzM4BUhOva26u9WA+JkwU/f9m3vPLbBZ/GUYiqVeqDApijYe6WcG0ZjF
         7I9dNhfdh+7jEJGF7iVMoFCNn3cK+b1XsYhXsZaXdanKyvLz15FJxKBhgjytYn1WCceo
         u+yA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mmY6A51ZBTxUK009dOAO5nHWvFFlu5X03LfjIlPtXwjZCxAeQ
	A5BNKwll8AFCfCtSpY1I0FU=
X-Google-Smtp-Source: ABdhPJz7b8TNIQ6iMOuG7oGAh87EGGOej1nxJIlDg8ic6GFrgDHMpQPh2S3VckFJRkr51odYBnyUMQ==
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr66509754edr.148.1594219031353;
        Wed, 08 Jul 2020 07:37:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1fd7:: with SMTP id e23ls1071950ejt.7.gmail; Wed, 08
 Jul 2020 07:37:10 -0700 (PDT)
X-Received: by 2002:a17:906:4949:: with SMTP id f9mr28886845ejt.495.1594219030535;
        Wed, 08 Jul 2020 07:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594219030; cv=none;
        d=google.com; s=arc-20160816;
        b=FbmRBBOU8N/AG7rZJN0xzFytAg+OVEEISVpcKCupz7oFZ5ecHGKRGTF205P0cHtwB6
         xBmcEfwToqToINMhaFvkdpznEQgC5Rg74q+Nv53hhRUTAg5bPP/8Ns4Q/zRuiL6M03Xb
         c/XmM1hNsbltT7vuNgdcFGoRKsv9R/Ms84zzRlA5kSlwzDOMJJyfM7rZ86JIj6jwr9b9
         5TPr1DlDXwi6NrJfsOFy0s5oxuTZFnxrWww+687jkh0gkq4SQVZefv5HzNC0cwWImwEe
         91qkqzdVcu2Ye27oyx1LE4OiJV5RHWuQNIlQ+OXpIUKUwVyLX0HwLx7ofe11pFz14IGB
         EXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=4Gin+B1nnMiE+XKlY7Iya0ks5PTilWhrUkWW0AxyXkI=;
        b=MjjF2WMKSm/MU+BK/3ejm1UmfUzySctsaqvHSGQKJ83ZVvdyhR0LuZhVWmTtrddkOc
         Yl0RysRy4m/sX2SieV+g9FnDsYCo8PJfKM1pFzt43kiZvQFYIWS72Tm3PCyaPhIwqh21
         Z9QE5ojimYbFLnUqTTDD/yF1JWgTDbRLRjxwR8VWrSCY4lf8OM15taQI+wi7AvDgO8He
         HwKNO59XNk4f/0b029u1xTRfI/uIl6/hD7skSDU+hh3UKLbk4g3kxuEab1VvTRYXy8g4
         tytlEP9/Sq2jrLbqfZPvM0LN1zIYizAEjYnYCPzU9peHGyZLBOnw29+WF825d69Jq6ii
         GryQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="kb/WmEbW";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k4si5613edl.4.2020.07.08.07.37.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 07:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4B222G0KDvzxph;
	Wed,  8 Jul 2020 16:37:10 +0200 (CEST)
Received: from [IPv6:2003:e9:af12:3f00:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 8 Jul 2020
 16:37:09 +0200
Subject: Re: Need help to run Linux in non-root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@siemens.com>, Moritz Walker <moritzwalker@live.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a@siemens.com>
 <AM0PR07MB5426401B20187DA3BAB56C4DB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <2b34a9fb-b90c-ef4a-545e-ec0ab7620c78@siemens.com>
 <77cfe59d-589c-99dc-e3ef-bd2891d3daf4@oth-regensburg.de>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <73b73089-a90c-f26f-bc2f-ce716bb1fafb@st.oth-regensburg.de>
Date: Wed, 8 Jul 2020 16:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <77cfe59d-589c-99dc-e3ef-bd2891d3daf4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="kb/WmEbW";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Hi all,

On 02/07/2020 18:26, Ralf Ramsauer wrote:
>=20
>=20
> On 02/07/2020 18:17, Jan Kiszka wrote:
>> On 02.07.20 18:07, Moritz Walker wrote:
>>>>>  =C2=A0Smells like a regression in that branch for non-root Linux. Is=
 that
>>>>>  =C2=A0562b04e51bb5e2f04bf175383080333237067c63? Can you share you ke=
rnel
>>>>> config?
>>>
>>> Yes, its 562b04e51bb5e2f04bf175383080333237067c63. I=C2=A0 attached the
>>> kernel config.
>>> I also tried the kernel from jailhouse-images (Linux version 5.4.17)
>>> which leads to=C2=A0 the same error
>>> on my AMD-machine:
>>
>> Ah, AMD! Please see
>=20
> Yeah, AMD. It isn't always only Intel. :-)
>=20
>> https://groups.google.com/forum/#!msg/jailhouse-dev/1wRKIiGN0GA/_p_NSIBp=
DwAJ
>> - in fact a known issue (hardware misbehavior) that we didn't workaround
>> yet.
>=20
> Yes, just wanted to mention! Looks familiar.
>=20
>>
>> Ralf, Andrej, any news here.
>=20
> Andrej?
> It's already been a while. Didn't we already have some preliminary
> patches for Linux?
>=20
> As a hacky workaround, you can try:
>=20
> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
> index d36c2033..5160d37d 100644
> --- a/hypervisor/arch/x86/apic.c
> +++ b/hypervisor/arch/x86/apic.c
> @@ -350,7 +350,7 @@ void apic_clear(void)
>=20
>          /* Finally, reset the TPR again and disable the APIC */
>          apic_ops.write(APIC_REG_TPR, 0);
> -       apic_ops.write(APIC_REG_SVR, 0xff);
> +       //apic_ops.write(APIC_REG_SVR, 0xff);
>   }
>=20
>   static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
>=20

Or as an alternative apply the following patch to the kernel:=20
https://groups.google.com/d/msg/jailhouse-dev/1wRKIiGN0GA/P5YeS3oqAQAJ

@Jan: Any ideas how to bring the mentioned patch (or something=20
equivalent) upstream? I know its a hack and will add proper CPU family=20
checks, but the linux-x86 folks still may not even touch it. Meanwhile=20
AMD gains market share and as such more people will try to run non-root=20
Linux with their CPUs, run into this bug and request support here or=20
decide to use other hypervisors.

Andrej

 >
>    Ralf
>>
>> Jan
>>
>>>
>>> [ =C2=A0 =C2=A05.879554] Switched APIC routing to physical flat.
>>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>>>
>>> The jailhouse-images kernel (5.4.17) works fine on a different machine
>>> (Intel).
>>> Might this problem be realted to my first machine beeing an AMD-x86 one=
?
>>>
>>> Moritz
>>>
>>>
>>>
>>> -----------------------------------------------------------------------=
-
>>> *Von:* Jan Kiszka <jan.kiszka@siemens.com>
>>> *Gesendet:* Donnerstag, 2. Juli 2020 12:56
>>> *An:* Moritz Walker <moritzwalker@live.com>;
>>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>>> *Betreff:* Re: Need help to run Linux in non-root cell
>>> On 02.07.20 14:04, Moritz Walker wrote:
>>>> Hello,
>>>>
>>>> I need help to run Linux (queues/jailhouse branch) in a non-root cell
>>>> on AMD. Root-cell and apic-demo both work fine.
>>>> To run the root-cell i run the /jailhouse enable
>>>> configs/x86/rootcell.cell/=C2=A0comman, which produces the following o=
utput:
>>>>
>>>>
>>>> Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d-dirty) on CPU 1
>>>> Code location: 0xfffffffff0000050
>>>> Using xAPIC
>>>> Page pool usage after early setup: mem 75/979, remap 1/131072
>>>> Initializing processors:
>>>>  =C2=A0 =C2=A0CPU 1... (APIC ID 1) OK
>>>> [...]
>>>>  =C2=A0 =C2=A0CPU 7... (APIC ID 5) OK
>>>> Initializing unit: AMD IOMMU
>>>> AMD IOMMU @0xfeb80000/0x80000
>>>> Initializing unit: IOAPIC
>>>> Initializing unit: PCI
>>>> [...]
>>>> Adding PCI device 31:00.0 to cell "RootCell"
>>>> Page pool usage after late setup: mem 286/979, remap 16520/131072
>>>> Activating hypervisor
>>>>
>>>>
>>>> After that i use the command /jailhouse cell linux
>>>> configs/x86/linux-x86-cell.cell ../linux/arch/x86/boot/bzImage -c
>>>> "console=3DttyS0,9600"/
>>>> to start the non-root linux cell. This writes the following output
>>>> via UART:
>>>>
>>>>
>>>> Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
>>>> Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
>>>> Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
>>>> Adding virtual PCI device 00:0f.0 to cell "linux-x86-demo"
>>>> Created cell "linux-x86-demo"
>>>> Page pool usage after cell creation: mem 343/979, remap 16520/131072
>>>> IOMMU 0: Event Log overflow occurred, some events were lost!
>>>> Cell "linux-x86-demo" can be loaded
>>>> Started cell "linux-x86-demo"
>>>> CPU 6 received SIPI, vector 100
>>>> CPU 7 received SIPI, vector 100
>>>> [ =C2=A0 =C2=A00.000000] Linux version 5.7.0-rc7+ (walker@wubuntu) (gc=
c version
>>>> 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2), GNU ld (GNU Binutils for
>>>> Ubuntu) 2.33) #2 SMP Wed Jul 1 12:28:55 CEST 2020
>>>> [ =C2=A0 =C2=A00.000000] Command line: console=3DttyS0,9600
>>>> [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>>>> [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Hygon HygonGenuine
>>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Centaur CentaurHauls
>>>> [ =C2=A0 =C2=A00.000000] =C2=A0 zhaoxin =C2=A0 Shanghai
>>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87=
 floating
>>>> point registers'
>>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE=
 registers'
>>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX=
 registers'
>>>> [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_=
sizes[2]: =C2=A0256
>>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context=
 size is
>>>> 832 bytes, using 'compacted' format.
>>>> [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000=
000fffff]
>>>> usable
>>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000=
00100fff]
>>>> reserved
>>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000200000-0x00000000=
048fffff]
>>>> usable
>>>> [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>>>> [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>>> 0x0000000000000000-0x0000000000001fff] usable
>>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>>> 0x0000000000002000-0x000000000000212b] usable
>>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>>> 0x000000000000212c-0x00000000000fffff] usable
>>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>>> 0x0000000000100000-0x0000000000100fff] reserved
>>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>>> 0x0000000000200000-0x00000000048fffff] usable
>>>> [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>>>> [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>>>> [ =C2=A0 =C2=A00.000000] tsc: Detected 3599.999 MHz processor
>>>> [ =C2=A0 =C2=A00.000016] last_pfn =3D 0x4900 max_arch_pfn =3D 0x400000=
000
>>>> [ =C2=A0 =C2=A00.000863] x86/PAT: Configuration [0-7]: WB =C2=A0WC =C2=
=A0UC- UC =C2=A0WB =C2=A0WP
>>>>  =C2=A0UC- WT
>>>> [ =C2=A0 =C2=A00.001075] total RAM covered: 3583M
>>>> [ =C2=A0 =C2=A00.001273] Found optimal setting for mtrr clean up
>>>> [ =C2=A0 =C2=A00.001275] =C2=A0gran_size: 64K chunk_size: 64M num_reg:=
 4 =C2=A0 lose
>>>> cover RAM: 0G
>>>> [ =C2=A0 =C2=A00.007671] check: Scanning 1 areas for low memory corrup=
tion
>>>> [ =C2=A0 =C2=A00.007677] Using GB pages for direct mapping
>>>> [ =C2=A0 =C2=A00.007943] No NUMA configuration found
>>>> [ =C2=A0 =C2=A00.007944] Faking a node at [mem
>>>> 0x0000000000000000-0x00000000048fffff]
>>>> [ =C2=A0 =C2=A00.007954] NODE_DATA(0) allocated [mem 0x048d5000-0x048f=
ffff]
>>>> [ =C2=A0 =C2=A00.008371] Zone ranges:
>>>> [ =C2=A0 =C2=A00.008372] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x0000000=
000001000-0x0000000000ffffff]
>>>> [ =C2=A0 =C2=A00.008374] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x000000000100=
0000-0x00000000048fffff]
>>>> [ =C2=A0 =C2=A00.008375] =C2=A0 Normal =C2=A0 empty
>>>> [ =C2=A0 =C2=A00.008376] =C2=A0 Device =C2=A0 empty
>>>> [ =C2=A0 =C2=A00.008377] Movable zone start for each node
>>>> [ =C2=A0 =C2=A00.008381] Early memory node ranges
>>>> [ =C2=A0 =C2=A00.008383] =C2=A0 node =C2=A0 0: [mem 0x0000000000001000=
-0x000000000009ffff]
>>>> [ =C2=A0 =C2=A00.008384] =C2=A0 node =C2=A0 0: [mem 0x0000000000200000=
-0x00000000048fffff]
>>>> [ =C2=A0 =C2=A00.008546] Zeroed struct page in unavailable ranges: 144=
33 pages
>>>> [ =C2=A0 =C2=A00.008547] Initmem setup node 0 [mem
>>>> 0x0000000000001000-0x00000000048fffff]
>>>> [ =C2=A0 =C2=A00.008887] SFI: Simple Firmware Interface v0.81
>>>> http://simplefirmware.org
>>>> [ =C2=A0 =C2=A00.008957] IOAPIC[0]: apic_id 0, version 33, address 0xf=
ec00000,
>>>> GSI 0-23
>>>> [ =C2=A0 =C2=A00.008959] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
>>>> [ =C2=A0 =C2=A00.008968] PM: hibernation: Registered nosave memory: [m=
em
>>>> 0x00000000-0x00000fff]
>>>> [ =C2=A0 =C2=A00.008969] PM: hibernation: Registered nosave memory: [m=
em
>>>> 0x00002000-0x00002fff]
>>>> [ =C2=A0 =C2=A00.008971] PM: hibernation: Registered nosave memory: [m=
em
>>>> 0x000a0000-0x000fffff]
>>>> [ =C2=A0 =C2=A00.008972] PM: hibernation: Registered nosave memory: [m=
em
>>>> 0x00100000-0x00100fff]
>>>> [ =C2=A0 =C2=A00.008973] PM: hibernation: Registered nosave memory: [m=
em
>>>> 0x00101000-0x001fffff]
>>>> [ =C2=A0 =C2=A00.008975] [mem 0x04900000-0xffffffff] available for PCI=
 devices
>>>> [ =C2=A0 =C2=A00.008976] Booting paravirtualized kernel on bare hardwa=
re
>>>> [ =C2=A0 =C2=A00.008980] clocksource: refined-jiffies: mask: 0xfffffff=
f
>>>> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
>>>> [ =C2=A0 =C2=A00.008985] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2
>>>> nr_cpu_ids:2 nr_node_ids:1
>>>> [ =C2=A0 =C2=A00.009399] percpu: Embedded 56 pages/cpu s192512 r8192 d=
28672
>>>> u1048576
>>>> [ =C2=A0 =C2=A00.009426] Built 1 zonelists, mobility grouping on. =C2=
=A0Total pages:
>>>> 18026
>>>> [ =C2=A0 =C2=A00.009427] Policy zone: DMA32
>>>> [ =C2=A0 =C2=A00.009428] Kernel command line: console=3DttyS0,9600
>>>> [ =C2=A0 =C2=A00.009468] Dentry cache hash table entries: 16384 (order=
: 5,
>>>> 131072 bytes, linear)
>>>> [ =C2=A0 =C2=A00.009478] Inode-cache hash table entries: 8192 (order: =
4, 65536
>>>> bytes, linear)
>>>> [ =C2=A0 =C2=A00.009498] mem auto-init: stack:off, heap alloc:on, heap=
 free:off
>>>> [ =C2=A0 =C2=A00.009620] Memory: 37524K/73340K available (14339K kerne=
l code,
>>>> 2386K rwdata, 5020K rodata, 2480K init, 5240K bss, 35816K reserved, 0K
>>>> [ =C2=A0 =C2=A00.009629] random: get_random_u64 called from
>>>> __kmem_cache_create+0x42/0x540 with crng_init=3D0
>>>> [ =C2=A0 =C2=A00.009763] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D2,
>>>> Nodes=3D1
>>>> [ =C2=A0 =C2=A00.009779] ftrace: allocating 43599 entries in 171 pages
>>>> [ =C2=A0 =C2=A00.028212] ftrace: allocated 171 pages with 5 groups
>>>> [ =C2=A0 =C2=A00.028311] rcu: Hierarchical RCU implementation.
>>>> [ =C2=A0 =C2=A00.028312] rcu: RCU restricting CPUs from NR_CPUS=3D8192=
 to
>>>> nr_cpu_ids=3D2.
>>>> [ =C2=A0 =C2=A00.028314] Tasks RCU enabled.
>>>> [ =C2=A0 =C2=A00.028315] rcu: RCU calculated value of scheduler-enlist=
ment
>>>> delay is 100 jiffies.
>>>> [ =C2=A0 =C2=A00.028316] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16,
>>>> nr_cpu_ids=3D2
>>>> [ =C2=A0 =C2=A00.031885] NR_IRQS: 524544, nr_irqs: 424, preallocated i=
rqs: 0
>>>> [ =C2=A0 =C2=A00.032007] random: crng done (trusting CPU's manufacture=
r)
>>>> [ =C2=A0 =C2=A00.032029] Console: colour dummy device 80x25
>>>> [ =C2=A0 =C2=A00.032031] Enabling UART0 (port 0x3f8)
>>>> [ =C2=A0 =C2=A05.771306] printk: console [ttyS0] enabled
>>>> [ =C2=A0 =C2=A05.820808] APIC: Switch to symmetric I/O mode setup
>>>> [ =C2=A0 =C2=A05.879554] Switched APIC routing to physical flat.
>>>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>>>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>>>
>>> Smells like a regression in that branch for non-root Linux. Is that
>>> 562b04e51bb5e2f04bf175383080333237067c63? Can you share you kernel
>>> config?
>>>
>>>> RIP: 0xffffffffab671f72 RSP: 0xffffffffacc03e40 FLAGS: 246
>>>> RAX: 0xffffffffab671f70 RBX: 0x0000000000000180 RCX: 0x000000000000000=
0
>>>> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x000000000000035=
0
>>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>>> CR0: 0x0000000080050033 CR3: 0x000000000260a000 CR4: 0x00000000000406b=
0
>>>> EFER: 0x0000000000001d01
>>>> Parking CPU 6 (Cell: "linux-x86-demo")
>>>>
>>>>
>>>> Furthermore, if i try to attach an initrd.image
>>>> (generated according to
>>>> http://www.aclevername.com/articles/linux-xilinx-tutorial/minimalist-i=
nitramfs.html)
>>>
>>>
>>>> to the
>>>> command via -i, the following error occurs:
>>>>
>>>>
>>>> File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 744,
>>>> in <module>
>>>> cell.load(args.initrd.read(), arch.ramdisk_adress())
>>>> IOError: [Errno 22] Invalid argument
>>>>
>>>
>>> Possibly too large. Check if the one from jailhouse-images works (it's
>>> small). Also check if that kernel works for you (older baseline).
>>>
>>>>
>>>> Now my question are:
>>>>
>>>>  =C2=A0 1.=C2=A0 =C2=A0How to configure the non-root linux cell correc=
tly?
>>>>  =C2=A0 2.=C2=A0 =C2=A0How to boot up a minimal initrd?
>>>>  =C2=A0 3.=C2=A0 =C2=A0How to compleletey boot a minimal linux distrib=
ution?
>>>>
>>>> Please kindly find the attached configuration files (.config,
>>>> rootcell.c, linux-x86-cell.c).
>>>> Any help would be highly appreciated.
>>>>
>>>
>>> First reference point is always
>>> https://github.com/siemens/jailhouse-images, and then we can look for
>>> the delta that breaks things.
>>>
>>> Jan
>>>
>>> --=20
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> Corporate Competence Center Embedded Linux
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/73b73089-a90c-f26f-bc2f-ce716bb1fafb%40st.oth-regensburg.de.
