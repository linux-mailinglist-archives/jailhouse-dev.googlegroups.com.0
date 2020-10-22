Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB5O4YX6AKGQE6ZWFUYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD9295D6F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 13:35:18 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id c10sf542851ejm.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 04:35:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603366518; cv=pass;
        d=google.com; s=arc-20160816;
        b=vl2Q/y+WFu5ONBNG5OPt594mIoRAcjhROLrUpuxZJ0knnSEnzwsRUuKNv5p1BtAg4h
         Msn8B0hNotS6c3vf8txFByXGSuVbgfbf/Bh5eo9mVzLCN7LL2Wf4VQzdAVQAF4xHYGNv
         7srKYjy3PXTwtBt1ui4SypB17+YM0rx9RJrxD0WKfG0SBqN9BLcaSivTyzD6yVYMpC2z
         vzIhP94M4eGcoWtuIFPAHCoxN6ar/9pv1JdlIx7ao5OtTVoGYGa7t+863Xt+uo872Qgz
         57dEuN3Q6B9Y3QW2W9Y0d88b+Z+SA8sVu9NjpqR7kJiJWlSGfF/aamcutFQnJfkoKSfm
         s4dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:cc:references:to:subject:sender
         :dkim-signature;
        bh=MfZZpfcSH+LszFnLtdhKFS7AIvp9FUCtPTcTB/LfBLc=;
        b=kmpM0Mo12gyWA67IML+/mo+o81/8xIOYX8WYPhL4hEBjoSSDA07tlnMc9BXvzvYsAe
         EYaRYblV69jugMgHO9h3JR39ASPnUtvGTQ9vg3mzodc6j9T1iwCTin3fupJMO7ADX4lC
         Wqhp89275frlQJbixj6XTXohrxaDWU61YITeqGoHPBeZWvBrMpL7sLDKvTwMWFZj6lj7
         6NFv33ETC2ioGYAlmPZ/kX4Y21H7tXlmyYIuXTKPM3TJJHkZtLgWgo5j8yo8jupZdCWe
         ib5/i+m4+td2laUQy/hnNo+FdNrma5ue+6JZOn7KX2pnhCdECcQKuceIn78as6X2jxum
         2JMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ixu/APeN";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MfZZpfcSH+LszFnLtdhKFS7AIvp9FUCtPTcTB/LfBLc=;
        b=jjSyrXLBE6FjDSF2TVqMUHRmeRp+o3LYOsDicv4gdFWXSOVZlxCZw/pVcOOXRgkNOd
         Aw8KOxrIk7B+cRQ5SFZpZW0OgStnMfD+454DYPYB937oP4DnWqAYivHQ9PMh/1Ven5Yg
         ncW/PE3dUcUjmRghiPOrj6DX2VWbbp/Y/UaWj5CN/g0cf/xhFG77w9Ntx46lWrAkqM4u
         Ff/Dt/gmyOKDdRg27L38IIVuzoe1yjckw6xAJHDxcvK3VGgFaThc8+M5A5LIIj4Z8h3j
         eYxEgkM6AkPaXmxzaefGB6nWYwLm5k/xd6oRN7tdMbn5138xHB1jJyqixY1SOehpRqqs
         Yq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MfZZpfcSH+LszFnLtdhKFS7AIvp9FUCtPTcTB/LfBLc=;
        b=rVF7hwrfpb0LEAjLeqDUUdbnHZSbJDFk3ZEIyoHME7ACq4equk9T8rBXqYRH2P59KC
         Y0WeXH0B8Vk20Qk5JDKYgy9f9KL9tj4lGM1JLiAsrhTyeRhQoumJr6+yAiyJm7nb2u/k
         ICW7eNXh3hIB/G1KFVrmOP2wMZQj/QOw9x1Qzr0ocJ8u/bJ+z68kjQ2otrRxjAZKn4OJ
         0UQb8tcbYnt7a+pr0W07l+k624W5zCyUtz7meCZUNPiLmvvn0sATiCeaS8aCX/B3lO3f
         ZebTV4g/NRVtAB1IHpxRiG/9M8ScX8DIKJB4I8EF1WXv+6P2az4BKqvKTbu2FfdeRngS
         ouJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bBHGv104+y4VJ4RMKukJnx70aKM8rFc9xKy1AX6jyGIU66rD6
	T50nm9wJqnkYmIK+E3hj71Y=
X-Google-Smtp-Source: ABdhPJx6zGJErHqIobQ3v5mxDWs7Y3/J2OMYsTCVXq1BOeyLHj+rYJfFlJ5hTexHXdKskSUTP9qOzw==
X-Received: by 2002:a50:8a02:: with SMTP id i2mr1876993edi.40.1603366517905;
        Thu, 22 Oct 2020 04:35:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:38d0:: with SMTP id r16ls697760ejd.2.gmail; Thu, 22
 Oct 2020 04:35:16 -0700 (PDT)
X-Received: by 2002:a17:907:40c0:: with SMTP id nu24mr1869272ejb.359.1603366516662;
        Thu, 22 Oct 2020 04:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603366516; cv=none;
        d=google.com; s=arc-20160816;
        b=bBqmcWRQrZvLqEgBaNyPQIwvgSZ7RezWNgc9bjEg8kT9dX5RChLc45DC7UOw1y4qiS
         dszy6HVUNcJZ2OUzh3xm0XfmFjvrnfSYkN/aw5wQVLH9pfaHzVktLjN1t+v4lWe3bKuJ
         yorSS5SXlBh0vkRTPuhlpBjQmOZk9wJNgX4+RRl1zZxY1VgCoOZqqwOKsMAxYfEWOziw
         G5IW/1UI+siUmXDysDI82sC/itl8fvACFAUNPSK+Qfx6u/EzBa3eagrgiC8GzxRqKOOe
         0VQ5NH0Zaxq5nUKe5wbDLL/HsjRef9uhL1FLyVf7IZ0Y8lILwGsaJHkE9tKiK2Koue6T
         +zIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:cc:references:to:subject
         :dkim-signature;
        bh=k2XUTMkANFH3heRGtGwivitQA+fyFhcz/lbCXhPHNq8=;
        b=Dxx2xQC6dlqbAzbvxrf41FXaGLXYGMJlMCWwJohpdmHI4B86zTp5xcPCXhiF23H8Wc
         8ahjTFZvb2Kp0eINykAjQT+28jo6WQDu2FRpuYa6uFYI8nHb/xT++hIhoA08ZnYCWcZW
         /f59WVXJP7y6FMbSn+7iXh1tGUaeaC68tfqU71Td2rz38Nq3eCw8IpR7+irAXGBT1TRv
         7lguUZrL26m/1OJ3Fe0DjF2HntXCt3ziTD9iugJprTQmtEqAbtol+OlEvicCnv7+wqAA
         JviLuPKWdYA+6jwQ7GWNV/I5KeIunFFJsAyqjo2YewcMKePSuZMedeQJ8mf+ze6Yob2h
         uCTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ixu/APeN";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id dp11si21897ejc.1.2020.10.22.04.35.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 04:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4CH4zS0fRTzxwm;
	Thu, 22 Oct 2020 13:35:16 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 22 Oct
 2020 13:35:15 +0200
Subject: Re: Jailhouse in qemu and ubuntu
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Andrea Bastoni <andrea.bastoni@tum.de>,
	Jari Ronkainen <jari.ronkainen@unikie.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
 <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
 <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
 <3f1b6c78-46f8-424e-7114-11d29103b325@oth-regensburg.de>
 <415463ca-566b-9061-77f2-be88125e1f2b@siemens.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
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
Message-ID: <8b501f7a-4891-ab51-579a-def18e60537c@oth-regensburg.de>
Date: Thu, 22 Oct 2020 13:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <415463ca-566b-9061-77f2-be88125e1f2b@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ixu/APeN";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 22/10/2020 13:04, Jan Kiszka wrote:
> On 22.10.20 13:01, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 10/22/20 12:09 PM, Andrea Bastoni wrote:
>>> Hi,
>>>
>>> On 20/10/2020 12:19, Jari Ronkainen wrote:
>>>> I noticed that dmesg gives me
>>>>
>>>> jailhouse: not as system configuration
>>>
>>> I'm hitting likely the same with Ubuntu 20.04, but not under Debian tes=
ting.
>>>
>>> It seems that the .note.gnu.property section is interfering with objcpy=
 and
>>> causes the "JHSYST" identification to be removed from the .cell.
>>>
>>> Removing the section while copying the .o fixes the issue:
>>>
>>> objcopy --version
>>> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>>>
>>> readelf -a jailhouse/configs/x86/qemu-x86.o
>>> ...
>>> Displaying notes found in: .note.gnu.property
>>>   Owner                Data size        Description
>>>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>>>       Properties: x86 feature: IBT, SHSTK
>>>
>>> hexdump -C jailhouse/configs/x86/qemu-x86.cell
>>> 00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |..........=
..GNU.|
>>
>> And the Gnu comes around and drops its own magic cowpat. ;-)
>>
>=20
> Hehe :)
>=20
>> Jan, maybe it's time to use a linker script for configs? This should
>> avoid such errors in the future. I think we have already seen something
>> similar in the past.
>=20
> I think it's rather time to make use of pyjailhouse, define a simple
> yaml equivalent of the C-based config format, and generate them without
> any C toolchain. I just received (valid) complaints about all that
> fragile num_whatever_elements and indexes again.

Let me Cc Andrej, he's into the config stuff. What do you exactly
envision? I guess you would then also replace all configs with yaml
equivalents?

Makes it really hard to debug if we have a bug in our generator, as we
only have the raw binary. (Not saying that we don't see the same issues
with the GNU toolchain)

I'd at least like to have something like a 'jailhouse config dump' that
creates a yaml from a given .cell file. This could also be used for the
initial conversion of our C configs.

  Ralf

>=20
> Jan
>=20
>>
>>>
>>>
>>> objcopy -O binary --remove-section=3D.note.gnu.property
>>> jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell
>>>
>>> 00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST....=
.....:|
>>
>> This reminds me that I wanted to write an extension for file(1). It'd
>> really be helpful if file would be able do determine if a file actually
>> is a configuration, and then if it is system or a cell config.
>>
>>   Ralf
>>
>>>
>>> Maybe related to:
>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D906414
>>>
>>> Thanks,
>>> Andrea
>>>
>>>>
>>>> , but this is the example .cell file that builds
>>>> with the source code and is used as an example
>>>> in the README.md?
>>>> On Tuesday, October 20, 2020 at 12:56:36 PM UTC+3 Jari Ronkainen wrote=
:
>>>>
>>>>     Hi,
>>>>
>>>>     I'm interested in running ROS2 in a Linux cell, first through
>>>>     QEMU and later on Up Xtreme board.=C2=A0 Apologies for stupid
>>>>     questions,=C2=A0 and please refer me to a more appropriate forum
>>>>     if this is the wrong place for them.
>>>>
>>>>     First I have built a fresh virtual machine and installed Ubuntu
>>>>     20.04 LTS, then installed linux headers, build tools and python
>>>>     through apt.
>>>>
>>>>     The compilation and installing seems to work fine, but when I
>>>>     get to the point where I should do
>>>>
>>>>     # jailhouse enable jailhouse/configs/qemu-x86.cell
>>>>
>>>>     I get an error message
>>>>
>>>>     JAILHOUSE_ENABLE: Invalid argument
>>>>
>>>>     I do not know how to get past this, any help?
>>>>
>>>>
>>>>     Other things is it seems like the documentation is not entirely
>>>>     up to date, and I noticed things like experimental virtio support
>>>>     and IPC reworkings in 0.12 release notes, is there any more info
>>>>     about those in the wild or should I just dig through git commits?
>>>>
>>>> --=20
>>>> You received this message because you are subscribed to the Google Gro=
ups
>>>> "Jailhouse" group.
>>>> To unsubscribe from this group and stop receiving emails from it, send=
 an email
>>>> to jailhouse-dev+unsubscribe@googlegroups.com
>>>> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>>>> To view this discussion on the web visit
>>>> https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9fe=
8-50a39589bd88n%40googlegroups.com
>>>> <https://groups.google.com/d/msgid/jailhouse-dev/b4510771-f6f0-4771-9f=
e8-50a39589bd88n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>=
.
>>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8b501f7a-4891-ab51-579a-def18e60537c%40oth-regensburg.de.
