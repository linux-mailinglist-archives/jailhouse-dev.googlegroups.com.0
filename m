Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPMV7D3QKGQEQDWF4BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F2212952
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 18:26:37 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id gz3sf22194513ejb.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 09:26:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593707197; cv=pass;
        d=google.com; s=arc-20160816;
        b=gh3you1vasVUuHVTM82qz0MsgpvqdU/OFgoGWKPDY3DjjilkLIoDD3MPzoar/vGU5r
         qG74P1A1j2LOaZeHin4buVWCrPEXhXms4jvlGntthVirFBH3KDKqQRFylUE5VxhM5QiD
         jW6N7Cb3Q6U3C725n6JgXQq7RyhT+1Cfh8jSSZ1IRcn7zUvjmjbfZr39BZQT05YZ2k4p
         mwzaxK/T7zBPUfNo3sNqxZYvFlMERWPmLQ4ZuXwrBlKwL5hn2WBn16NjQcsdj1epcTLC
         qcLuLn3L9jLG62mXHN7oP9HSbzjzJpqB03EVili05iUyBQ8tmnjezvdifdaAXGa1xcjr
         3SKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=67bLpOPqsI4xldxSOWJHXD/EyOXBqNS4xTG5WNM/ilI=;
        b=nIbLNwFAfhNXyHW341Y5sLCiepHu3VLFw8m9PETDHTP5uaRd9Idzt7lfkRjpCmr0WT
         oJYG0NnaM04hLl0zcJc3gAmoPYXu/or8zqqbhYkrcLmace/BGvjtWasgO9eiAFYQSnav
         7EaLDlf12qtTAUrAJOirSKN8ATsjMyyS0pJ9XdYYAlCB+iFIWHyBZQjw3Mg1+ZPynPSq
         3VglGAWUOlSMUYEQboETBWiivg3fvemlj3PM+y++Z+t3PPsp6os5dSTtZ8wLCUoybsom
         Mry5l/NHBDq5lM/5Zj7fAbHLNSaZ+vkHchck/sZfaZvzFktipCZZSOhcVj0pKTwCJWMg
         4lUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="JJPTIh/0";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=67bLpOPqsI4xldxSOWJHXD/EyOXBqNS4xTG5WNM/ilI=;
        b=TJ8I0xU3pPTUBR6XK90EZlS11rcvP+ebmB3aP2h1ILG2xKEodHU3DqF6x+okCFFUMl
         cCgAnrdVzjrYrVOSDICv2GpStpnsluAM1zz+8ZbUzXcJkn43lmulSezDCOXYwCARhb+2
         FOt6y+hA5pFdn+gmQ4154sIxGZhfGymnvioUbVKoTB3b2AdVtl3638IXuP6QoTuUDb1g
         0oidpr9fIlJaw9AHf73hk4Ys4R/bs8FS2TdQTWHJ9vDae0XUMYM15c7og/MRyM+iMH8J
         Lhvahswnb+8dVST7F3b8ShfydBzO27wz7U5oK1aqU0KiSOmXxC51iPxxhmKwtBCmy7wF
         gkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=67bLpOPqsI4xldxSOWJHXD/EyOXBqNS4xTG5WNM/ilI=;
        b=HWeMviA4ttMb7lSJQ88fvYhlX5BWI6eOguy6Ib/jeuC9Am6tmMdwIleKPvTT9vwFZj
         kzyQaz1I9iys/imM+WYWrWmqitiWl8emfZp+tqTDutqywlLFj1yHbcF9RfPqWsKVhQkb
         Pj8Q6WYNNhrt+epmPkMfRbMeH+Q6XCrjuX20hGFHIbQt982JZrPi81W7YZx5XU6MCYlD
         /X6bz6+pQmcwCLk83W9IpQNInAtgiEKlfqrx0pVfcE81n82BZuAtrzXqqi3WKEPEQzK4
         iz8mhysLUOEaQD3+NTlfETf0CUHESfJNKh57Fx//3CwOoB7iJ5MTVTbyzFp7WFhDfJc/
         AVPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532QRIcat657brwiam7ukCi1ca7hCEO2t7r3wv2psOr0qmaJosAn
	KpqKubKW0QXzPcOvMSQExs0=
X-Google-Smtp-Source: ABdhPJzNnykPh+EmlaQFGniLtneA3Ua0b0xU8XC2qNgjVbg1I1iai9S+4XyIHypZNN89nM5EEU9Y/g==
X-Received: by 2002:a17:906:7247:: with SMTP id n7mr28506920ejk.105.1593707197648;
        Thu, 02 Jul 2020 09:26:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5798:: with SMTP id k24ls2891313ejq.11.gmail; Thu,
 02 Jul 2020 09:26:37 -0700 (PDT)
X-Received: by 2002:a17:906:1491:: with SMTP id x17mr29060764ejc.416.1593707197047;
        Thu, 02 Jul 2020 09:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593707197; cv=none;
        d=google.com; s=arc-20160816;
        b=RG0eqO0L6/AaT1vgnvbO+mp54t2CiA9ItKZC9bHVSluwWB8uUlDDfXtvybxAeAIGy2
         q9zsHEHZ4Bwm6rQ2eFecw5LBrR6elioMXZa8lRN5VQT0N9OL82AF3Wky3+bHY4XpR914
         B70AwmKjQPWu5QHCVy6izAsed1eLO6unsaO68QX2PyRTxHkRNd2yg0d8mqoatSr0LMYH
         EkdCG1PD+ByRn2cqHoXlwKi39uPRIFJHRk6hGUAz6v7Bz5M8esQovEXMaLjKI8T2DKR2
         tfjSSnB8RE7oNKcL+uI4Evi5iIQMp3tyIbSK7fHVkNnMyJkdy7J1RhDVpKgSSqMGnXWm
         2yyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=47NPdpA8Td9fExtAdot+mpEzBhsQvLdnML9l4ytllAY=;
        b=Z/EOsyS7zzekzOCTf3/skhHyZ841LXjpHJD1Bliu3T1l4r5k1+3afkLuPEiuTxDrlp
         zqD1Sv+tLc9ayDONvlq5UgBCEz9Ay2mQsrDin/BCBB63kKbesjKd8lyia9ivpoy8A/JT
         6AoLUggOo2LMKUp2DFAuZ/rdIOvxoxsH4gQ7MWxZDMPnQhRH4JhPLeQmQt7gvHBqeFpa
         Kz84DwXEb/twnFRM8yl83cQquKt4sOWX6WoQsrwov8ig7vVzajdzZMQIpbmrwmjMvh+X
         KP+NnikI8Pgm5G3EU5iAM+A717iM1e3an1YWOVvaLUB3uNfTeQlmtoWiCHPqeVoTFs0v
         1X6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="JJPTIh/0";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id v16si563251eda.5.2020.07.02.09.26.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 09:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49yNlJ4Q9Tzy51;
	Thu,  2 Jul 2020 18:26:36 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 2 Jul 2020
 18:26:36 +0200
Subject: Re: Need help to run Linux in non-root cell
To: Jan Kiszka <jan.kiszka@siemens.com>, Moritz Walker
	<moritzwalker@live.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
References: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a@siemens.com>
 <AM0PR07MB5426401B20187DA3BAB56C4DB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <2b34a9fb-b90c-ef4a-545e-ec0ab7620c78@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <77cfe59d-589c-99dc-e3ef-bd2891d3daf4@oth-regensburg.de>
Date: Thu, 2 Jul 2020 18:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b34a9fb-b90c-ef4a-545e-ec0ab7620c78@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="JJPTIh/0";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 02/07/2020 18:17, Jan Kiszka wrote:
> On 02.07.20 18:07, Moritz Walker wrote:
>>>> =C2=A0Smells like a regression in that branch for non-root Linux. Is t=
hat
>>>> =C2=A0562b04e51bb5e2f04bf175383080333237067c63? Can you share you kern=
el
>>>> config?
>>
>> Yes, its 562b04e51bb5e2f04bf175383080333237067c63. I=C2=A0 attached the
>> kernel config.
>> I also tried the kernel from jailhouse-images (Linux version 5.4.17)
>> which leads to=C2=A0 the same error
>> on my AMD-machine:
>=20
> Ah, AMD! Please see

Yeah, AMD. It isn't always only Intel. :-)

> https://groups.google.com/forum/#!msg/jailhouse-dev/1wRKIiGN0GA/_p_NSIBpD=
wAJ
> - in fact a known issue (hardware misbehavior) that we didn't workaround
> yet.

Yes, just wanted to mention! Looks familiar.

>=20
> Ralf, Andrej, any news here.

Andrej?
It's already been a while. Didn't we already have some preliminary
patches for Linux?

As a hacky workaround, you can try:

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index d36c2033..5160d37d 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -350,7 +350,7 @@ void apic_clear(void)

        /* Finally, reset the TPR again and disable the APIC */
        apic_ops.write(APIC_REG_TPR, 0);
-       apic_ops.write(APIC_REG_SVR, 0xff);
+       //apic_ops.write(APIC_REG_SVR, 0xff);
 }

 static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,


  Ralf


>=20
> Jan
>=20
>>
>> [ =C2=A0 =C2=A05.879554] Switched APIC routing to physical flat.
>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>>
>> The jailhouse-images kernel (5.4.17) works fine on a different machine
>> (Intel).
>> Might this problem be realted to my first machine beeing an AMD-x86 one?
>>
>> Moritz
>>
>>
>>
>> ------------------------------------------------------------------------
>> *Von:* Jan Kiszka <jan.kiszka@siemens.com>
>> *Gesendet:* Donnerstag, 2. Juli 2020 12:56
>> *An:* Moritz Walker <moritzwalker@live.com>;
>> jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>> *Betreff:* Re: Need help to run Linux in non-root cell
>> On 02.07.20 14:04, Moritz Walker wrote:
>>> Hello,
>>>
>>> I need help to run Linux (queues/jailhouse branch) in a non-root cell
>>> on AMD. Root-cell and apic-demo both work fine.
>>> To run the root-cell i run the /jailhouse enable
>>> configs/x86/rootcell.cell/=C2=A0comman, which produces the following ou=
tput:
>>>
>>>
>>> Initializing Jailhouse hypervisor v0.12 (59-g4ce7658d-dirty) on CPU 1
>>> Code location: 0xfffffffff0000050
>>> Using xAPIC
>>> Page pool usage after early setup: mem 75/979, remap 1/131072
>>> Initializing processors:
>>> =C2=A0 =C2=A0CPU 1... (APIC ID 1) OK
>>> [...]
>>> =C2=A0 =C2=A0CPU 7... (APIC ID 5) OK
>>> Initializing unit: AMD IOMMU
>>> AMD IOMMU @0xfeb80000/0x80000
>>> Initializing unit: IOAPIC
>>> Initializing unit: PCI
>>> [...]
>>> Adding PCI device 31:00.0 to cell "RootCell"
>>> Page pool usage after late setup: mem 286/979, remap 16520/131072
>>> Activating hypervisor
>>>
>>>
>>> After that i use the command /jailhouse cell linux
>>> configs/x86/linux-x86-cell.cell ../linux/arch/x86/boot/bzImage -c
>>> "console=3DttyS0,9600"/
>>> to start the non-root linux cell. This writes the following output
>>> via UART:
>>>
>>>
>>> Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
>>> Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
>>> Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
>>> Adding virtual PCI device 00:0f.0 to cell "linux-x86-demo"
>>> Created cell "linux-x86-demo"
>>> Page pool usage after cell creation: mem 343/979, remap 16520/131072
>>> IOMMU 0: Event Log overflow occurred, some events were lost!
>>> Cell "linux-x86-demo" can be loaded
>>> Started cell "linux-x86-demo"
>>> CPU 6 received SIPI, vector 100
>>> CPU 7 received SIPI, vector 100
>>> [ =C2=A0 =C2=A00.000000] Linux version 5.7.0-rc7+ (walker@wubuntu) (gcc=
 version
>>> 9.2.1 20191008 (Ubuntu 9.2.1-9ubuntu2), GNU ld (GNU Binutils for
>>> Ubuntu) 2.33) #2 SMP Wed Jul 1 12:28:55 CEST 2020
>>> [ =C2=A0 =C2=A00.000000] Command line: console=3DttyS0,9600
>>> [ =C2=A0 =C2=A00.000000] KERNEL supported cpus:
>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel
>>> [ =C2=A0 =C2=A00.000000] =C2=A0 AMD AuthenticAMD
>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Hygon HygonGenuine
>>> [ =C2=A0 =C2=A00.000000] =C2=A0 Centaur CentaurHauls
>>> [ =C2=A0 =C2=A00.000000] =C2=A0 zhaoxin =C2=A0 Shanghai
>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 =
floating
>>> point registers'
>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE =
registers'
>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX =
registers'
>>> [ =C2=A0 =C2=A00.000000] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_s=
izes[2]: =C2=A0256
>>> [ =C2=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context =
size is
>>> 832 bytes, using 'compacted' format.
>>> [ =C2=A0 =C2=A00.000000] BIOS-provided physical RAM map:
>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000=
00fffff]
>>> usable
>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x000000000=
0100fff]
>>> reserved
>>> [ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000200000-0x000000000=
48fffff]
>>> usable
>>> [ =C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active
>>> [ =C2=A0 =C2=A00.000000] extended physical RAM map:
>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>> 0x0000000000000000-0x0000000000001fff] usable
>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>> 0x0000000000002000-0x000000000000212b] usable
>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>> 0x000000000000212c-0x00000000000fffff] usable
>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>> 0x0000000000100000-0x0000000000100fff] reserved
>>> [ =C2=A0 =C2=A00.000000] reserve setup_data: [mem
>>> 0x0000000000200000-0x00000000048fffff] usable
>>> [ =C2=A0 =C2=A00.000000] DMI not present or invalid.
>>> [ =C2=A0 =C2=A00.000000] Hypervisor detected: Jailhouse
>>> [ =C2=A0 =C2=A00.000000] tsc: Detected 3599.999 MHz processor
>>> [ =C2=A0 =C2=A00.000016] last_pfn =3D 0x4900 max_arch_pfn =3D 0x4000000=
00
>>> [ =C2=A0 =C2=A00.000863] x86/PAT: Configuration [0-7]: WB =C2=A0WC =C2=
=A0UC- UC =C2=A0WB =C2=A0WP
>>> =C2=A0UC- WT
>>> [ =C2=A0 =C2=A00.001075] total RAM covered: 3583M
>>> [ =C2=A0 =C2=A00.001273] Found optimal setting for mtrr clean up
>>> [ =C2=A0 =C2=A00.001275] =C2=A0gran_size: 64K chunk_size: 64M num_reg: =
4 =C2=A0 lose
>>> cover RAM: 0G
>>> [ =C2=A0 =C2=A00.007671] check: Scanning 1 areas for low memory corrupt=
ion
>>> [ =C2=A0 =C2=A00.007677] Using GB pages for direct mapping
>>> [ =C2=A0 =C2=A00.007943] No NUMA configuration found
>>> [ =C2=A0 =C2=A00.007944] Faking a node at [mem
>>> 0x0000000000000000-0x00000000048fffff]
>>> [ =C2=A0 =C2=A00.007954] NODE_DATA(0) allocated [mem 0x048d5000-0x048ff=
fff]
>>> [ =C2=A0 =C2=A00.008371] Zone ranges:
>>> [ =C2=A0 =C2=A00.008372] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x00000000=
00001000-0x0000000000ffffff]
>>> [ =C2=A0 =C2=A00.008374] =C2=A0 DMA32 =C2=A0 =C2=A0[mem 0x0000000001000=
000-0x00000000048fffff]
>>> [ =C2=A0 =C2=A00.008375] =C2=A0 Normal =C2=A0 empty
>>> [ =C2=A0 =C2=A00.008376] =C2=A0 Device =C2=A0 empty
>>> [ =C2=A0 =C2=A00.008377] Movable zone start for each node
>>> [ =C2=A0 =C2=A00.008381] Early memory node ranges
>>> [ =C2=A0 =C2=A00.008383] =C2=A0 node =C2=A0 0: [mem 0x0000000000001000-=
0x000000000009ffff]
>>> [ =C2=A0 =C2=A00.008384] =C2=A0 node =C2=A0 0: [mem 0x0000000000200000-=
0x00000000048fffff]
>>> [ =C2=A0 =C2=A00.008546] Zeroed struct page in unavailable ranges: 1443=
3 pages
>>> [ =C2=A0 =C2=A00.008547] Initmem setup node 0 [mem
>>> 0x0000000000001000-0x00000000048fffff]
>>> [ =C2=A0 =C2=A00.008887] SFI: Simple Firmware Interface v0.81
>>> http://simplefirmware.org
>>> [ =C2=A0 =C2=A00.008957] IOAPIC[0]: apic_id 0, version 33, address 0xfe=
c00000,
>>> GSI 0-23
>>> [ =C2=A0 =C2=A00.008959] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
>>> [ =C2=A0 =C2=A00.008968] PM: hibernation: Registered nosave memory: [me=
m
>>> 0x00000000-0x00000fff]
>>> [ =C2=A0 =C2=A00.008969] PM: hibernation: Registered nosave memory: [me=
m
>>> 0x00002000-0x00002fff]
>>> [ =C2=A0 =C2=A00.008971] PM: hibernation: Registered nosave memory: [me=
m
>>> 0x000a0000-0x000fffff]
>>> [ =C2=A0 =C2=A00.008972] PM: hibernation: Registered nosave memory: [me=
m
>>> 0x00100000-0x00100fff]
>>> [ =C2=A0 =C2=A00.008973] PM: hibernation: Registered nosave memory: [me=
m
>>> 0x00101000-0x001fffff]
>>> [ =C2=A0 =C2=A00.008975] [mem 0x04900000-0xffffffff] available for PCI =
devices
>>> [ =C2=A0 =C2=A00.008976] Booting paravirtualized kernel on bare hardwar=
e
>>> [ =C2=A0 =C2=A00.008980] clocksource: refined-jiffies: mask: 0xffffffff
>>> max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
>>> [ =C2=A0 =C2=A00.008985] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2
>>> nr_cpu_ids:2 nr_node_ids:1
>>> [ =C2=A0 =C2=A00.009399] percpu: Embedded 56 pages/cpu s192512 r8192 d2=
8672
>>> u1048576
>>> [ =C2=A0 =C2=A00.009426] Built 1 zonelists, mobility grouping on. =C2=
=A0Total pages:
>>> 18026
>>> [ =C2=A0 =C2=A00.009427] Policy zone: DMA32
>>> [ =C2=A0 =C2=A00.009428] Kernel command line: console=3DttyS0,9600
>>> [ =C2=A0 =C2=A00.009468] Dentry cache hash table entries: 16384 (order:=
 5,
>>> 131072 bytes, linear)
>>> [ =C2=A0 =C2=A00.009478] Inode-cache hash table entries: 8192 (order: 4=
, 65536
>>> bytes, linear)
>>> [ =C2=A0 =C2=A00.009498] mem auto-init: stack:off, heap alloc:on, heap =
free:off
>>> [ =C2=A0 =C2=A00.009620] Memory: 37524K/73340K available (14339K kernel=
 code,
>>> 2386K rwdata, 5020K rodata, 2480K init, 5240K bss, 35816K reserved, 0K
>>> [ =C2=A0 =C2=A00.009629] random: get_random_u64 called from
>>> __kmem_cache_create+0x42/0x540 with crng_init=3D0
>>> [ =C2=A0 =C2=A00.009763] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D=
0, CPUs=3D2,
>>> Nodes=3D1
>>> [ =C2=A0 =C2=A00.009779] ftrace: allocating 43599 entries in 171 pages
>>> [ =C2=A0 =C2=A00.028212] ftrace: allocated 171 pages with 5 groups
>>> [ =C2=A0 =C2=A00.028311] rcu: Hierarchical RCU implementation.
>>> [ =C2=A0 =C2=A00.028312] rcu: RCU restricting CPUs from NR_CPUS=3D8192 =
to
>>> nr_cpu_ids=3D2.
>>> [ =C2=A0 =C2=A00.028314] Tasks RCU enabled.
>>> [ =C2=A0 =C2=A00.028315] rcu: RCU calculated value of scheduler-enlistm=
ent
>>> delay is 100 jiffies.
>>> [ =C2=A0 =C2=A00.028316] rcu: Adjusting geometry for rcu_fanout_leaf=3D=
16,
>>> nr_cpu_ids=3D2
>>> [ =C2=A0 =C2=A00.031885] NR_IRQS: 524544, nr_irqs: 424, preallocated ir=
qs: 0
>>> [ =C2=A0 =C2=A00.032007] random: crng done (trusting CPU's manufacturer=
)
>>> [ =C2=A0 =C2=A00.032029] Console: colour dummy device 80x25
>>> [ =C2=A0 =C2=A00.032031] Enabling UART0 (port 0x3f8)
>>> [ =C2=A0 =C2=A05.771306] printk: console [ttyS0] enabled
>>> [ =C2=A0 =C2=A05.820808] APIC: Switch to symmetric I/O mode setup
>>> [ =C2=A0 =C2=A05.879554] Switched APIC routing to physical flat.
>>> FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700)
>>> FATAL: Unhandled APIC access, offset 848, is_write: 1
>>
>> Smells like a regression in that branch for non-root Linux. Is that
>> 562b04e51bb5e2f04bf175383080333237067c63? Can you share you kernel
>> config?
>>
>>> RIP: 0xffffffffab671f72 RSP: 0xffffffffacc03e40 FLAGS: 246
>>> RAX: 0xffffffffab671f70 RBX: 0x0000000000000180 RCX: 0x0000000000000000
>>> RDX: 0x0000000000000000 RSI: 0x0000000000000700 RDI: 0x0000000000000350
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x000000000260a000 CR4: 0x00000000000406b0
>>> EFER: 0x0000000000001d01
>>> Parking CPU 6 (Cell: "linux-x86-demo")
>>>
>>>
>>> Furthermore, if i try to attach an initrd.image
>>> (generated according to
>>> http://www.aclevername.com/articles/linux-xilinx-tutorial/minimalist-in=
itramfs.html)
>>
>>
>>> to the
>>> command via -i, the following error occurs:
>>>
>>>
>>> File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 744,
>>> in <module>
>>> cell.load(args.initrd.read(), arch.ramdisk_adress())
>>> IOError: [Errno 22] Invalid argument
>>>
>>
>> Possibly too large. Check if the one from jailhouse-images works (it's
>> small). Also check if that kernel works for you (older baseline).
>>
>>>
>>> Now my question are:
>>>
>>> =C2=A0 1.=C2=A0 =C2=A0How to configure the non-root linux cell correctl=
y?
>>> =C2=A0 2.=C2=A0 =C2=A0How to boot up a minimal initrd?
>>> =C2=A0 3.=C2=A0 =C2=A0How to compleletey boot a minimal linux distribut=
ion?
>>>
>>> Please kindly find the attached configuration files (.config,
>>> rootcell.c, linux-x86-cell.c).
>>> Any help would be highly appreciated.
>>>
>>
>> First reference point is always
>> https://github.com/siemens/jailhouse-images, and then we can look for
>> the delta that breaks things.
>>
>> Jan
>>
>> --=C2=A0
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
>=20
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/77cfe59d-589c-99dc-e3ef-bd2891d3daf4%40oth-regensburg.de.
