Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBC6ZX7YQKGQED5TYWMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x937.google.com (mail-ua1-x937.google.com [IPv6:2607:f8b0:4864:20::937])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8714B0B4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 09:10:52 +0100 (CET)
Received: by mail-ua1-x937.google.com with SMTP id i21sf1386008uac.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 00:10:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580199052; cv=pass;
        d=google.com; s=arc-20160816;
        b=fUofdr4WlaZAJq4EcCjpXxqLNxNeM1IpRouNj5pEaMbbmiThI+ACJRM4rbxUgVQ7il
         NfKY2Sbz1u85HB4ZkUaRSymBwHL6udpMuZBM4rCliC1XWAeNqHOzuWZMJ+uCb5gORm3z
         3cbddlEfVW1PeZEq2nHRC6BYvAU0hkN6uoD8KOAS2HSzhMYnTpDnPZlcjiGjygnkRr3m
         U80y87fJsanwlkIUfPRuVY1naozujfZnYbq8t1fd/xgFan+lX+XnWKmAJlyxQy2GX9Z2
         i5CIBJaCUQPKe7/aDuM7CTQEOnnrtJs0smwLBU4TC2n8FDvZjSCwJQKEUejttru7hazW
         Oj5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=dkTXq3u3L7jwERyYbCUbX1Q5f8l4H+uckaeYdQ7aS2w=;
        b=DM+mciLDWOjZzOFIwMRXE51k533iwOE0I6lVw1AJv+ps00Ul3czwYZ8RLSbs5jLXEc
         KRyIX+F9M0PFQRDrFkxul3LaSj2jM/4RfVPiftxBAKVpvrHQKMltUocpF0KLL2+cNPJp
         dzvu5bSiEa5PZZzJfSLFWpUrmkBC7AaTO89uV371A27jnsu7szdH35UCs1acarTbEWqG
         9r6h3fDJfFfYSlidh+MY/zJVhhyMIuPQH/TRUhIhn0dyq0RPYjJASy61uRS9GdyEcvPe
         9BnTPNG1oBeDVBV6QOpSYA/obZVfrmyRZkObgJCq+jO9xzXh7JOuyJjH+XkWkqfdmRdK
         ou1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PSkpCxCI;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=dkTXq3u3L7jwERyYbCUbX1Q5f8l4H+uckaeYdQ7aS2w=;
        b=B2MH3HetWDB2Y9IjXk1KjAwzla122fGdcyMzuxJWhHhpA5O8V7/nuHRTz9bmCLdUlQ
         SObkzxIkiCTtHVQy+JCof7ljnELJPcCVbD3qfM1qfd3Lb0lJaeOEPPjLSDXehPOSpNvi
         q416JXY9RifpKOfOPsSeJKSRekUK837QFJSH9tU/jXCHsHhReFs63QzZUdE3yA/uSzxU
         JnV1PenEpg6V2TtNKTL3NSE1z8X1Wv8u06fj0K3BmGsvnVOVB7aiyjbiAyUynyRDk2Dr
         OL4xTvp7ofvM8hCrLbF0XJAdj4QXIxq70HYtRwwkg5pkE3Tb9kYl8kUm3wThak6ZbCM9
         PQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dkTXq3u3L7jwERyYbCUbX1Q5f8l4H+uckaeYdQ7aS2w=;
        b=MdKBWWOGU9zaoCVQuiiwox4GXpQoM5A48URoJ4vJRZSWa7QTnVmUDiYodelOniNmB3
         GP9woNkhz6a/metqtK6Y8zDPcQP+MBe/kPAYXZOfJvel++QI07x+Rrr46xNBQ2GIMpaW
         6NWCMArIrrTE+mHeidweePL2aZ5iIWx3ukwXyK51A2jhhpXdb/TMLf+yjC9Hl6WG8zTf
         2zUZ5hByuKXWV85hyI4G08+7L1bMbLbe+Zc/scEysQE0ajVBB+jjjeAzOvy9X9liVT5h
         3hwVfAM7HCVqbw9gmuhxo5+PlVnKDgfMl8VrbDkSUD/ulH3KG+Uf6CKwGYTP8xlceKsm
         V/xg==
X-Gm-Message-State: APjAAAV/sWNqEzh7LTcyBV97NGakK7Na4XY9XxZDX04VKTC/ucEiFdkr
	X0XiBxdaFlnbbi82okPXQlw=
X-Google-Smtp-Source: APXvYqyhJTcrJzShTLJGTZ1eyMdWQ1UD/qrs81bbkW15GIV3ReIOBEYXplHX776BiXQZ1/NUHHCYVw==
X-Received: by 2002:ab0:6881:: with SMTP id t1mr11806663uar.88.1580199051901;
        Tue, 28 Jan 2020 00:10:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:804:: with SMTP id g4ls62569vsb.11.gmail; Tue, 28
 Jan 2020 00:10:51 -0800 (PST)
X-Received: by 2002:a67:2505:: with SMTP id l5mr6195354vsl.204.1580199051083;
        Tue, 28 Jan 2020 00:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580199051; cv=none;
        d=google.com; s=arc-20160816;
        b=ccIn3y3D2qjMztHij8Lk52XhQQt/ZBc2fqAKSjfPPYmJtIm4fuPXZWMVx35Rk1+Af3
         +Nk1lCjWXyMgDMVAssghWLVien654VOg1AXdy02MNJV/kGtG/5Fsc/EY1tIf7iPyMH3t
         paOtjxIf04z5rI5xv2WobDa+OV2PMPzSduCcimYiVlhgdk037kWIqCwzPLKSnvdx8yBU
         pCMxxVAJ9khx8CHWCjFccpxYe+ccdbD5U3/g5r9LP/Qxu6FkQpMubfT+AQm4+OsTMgyW
         n8bYMRe4baRR5yIvHbC0HQPixgxrSCHbh/6vNIJGGmb/irpJ9Zw3dXAtDc4n1BSkUe9N
         uHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zysYSZm+pfG4pDYZUT2uNDplvJeP/YFjzR9TFbdLfa4=;
        b=OPVZlz2f7H4/Qv17gjILY/IYU2TUH6/r7U3UZcFg0A3OtlMSvCPy7+4O685/yEWPR0
         xnjfN5d0/ATRfng3xfSITHNF8MkvDmGSqHdJfhEFoIpYFt8yJV5Ek+saU8Djs6EFUzVi
         DymVhH+8t0ceiUQftDI10M1hRmTE2aC5P3NnV0FLHohrhekvxO3YxOSEIjbrhsSGXP5e
         NAaNQ/Pz96xjbgQcQ1MilpiTEGdwQxdOCUFLtys2b3H7lqYExAzG7c72fX4ZuyYZ1Ryz
         CznClznuVhOf9pwQwMuIh0G4UFcAmsc7xcQj/bgHFSB6GK/Q3DVeavb0nI680gRW/EZm
         EyZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PSkpCxCI;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id t76si775569vkb.1.2020.01.28.00.10.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 00:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00S8AoXK089343;
	Tue, 28 Jan 2020 02:10:50 -0600
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00S8AoTJ061461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2020 02:10:50 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 28
 Jan 2020 02:10:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 28 Jan 2020 02:10:49 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00S8AlsC004563;
	Tue, 28 Jan 2020 02:10:48 -0600
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Jan Kiszka <jan.kiszka@web.de>,
        Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>,
        <jailhouse-dev@googlegroups.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
 <7222df54-40c7-6958-570e-9eb50365e905@web.de>
 <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
 <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <fb168c39-b767-6ae5-3fb0-08d5128a061c@ti.com>
Date: Tue, 28 Jan 2020 13:39:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
Content-Type: multipart/alternative;
	boundary="------------658521E0A9AD3E9657A67BEC"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=PSkpCxCI;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------658521E0A9AD3E9657A67BEC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 28/01/20 2:41 am, Jan Kiszka wrote:
> On 27.01.20 20:41, Nikhil Devshatwar wrote:
>>
>>
>> On 27/01/20 10:03 pm, Jan Kiszka wrote:
>>> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>>>
>>>>>>> This series adds support for partitioning registers across=20
>>>>>>> different
>>>>>>> cells
>>>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>>>>> where it uses
>>>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>>>> aligned regions.
>>>>>>>
>>>>>>> However, most of the embedded platforms will have common set of
>>>>>>> registers which
>>>>>>> need to be partitioned at the granularity of single register. One
>>>>>>> such
>>>>>>> example is
>>>>>>> the pinmux registers avaialble in many platforms including K3=20
>>>>>>> J721e.
>>>>>>>
>>>>>>> This series implements a regmap unit which allows to describe the
>>>>>>> ownerhip of the
>>>>>>> registers using a simple bitmap. This scales well when you have to
>>>>>>> partition
>>>>>>> hundreds of control module or pinmux registers.
>>>>>>>
>>>>>>> Nikhil Devshatwar (4):
>>>>>>> =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_regi=
ons
>>>>>>> =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for parti=
tioning=20
>>>>>>> registers
>>>>>>> =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioning reg=
isters
>>>>>>> =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG reg=
isters
>>>>>>>
>>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++=
-
>>>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>>>> =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
>>>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=
=A0 47 +++++
>>>>>>> =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 258
>>>>>>> ++++++++++++++++++++++++
>>>>>>> =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>>>> =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>>>> =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>> =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap=
.h
>>>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>>>
>>>>>> Worthwhile to discuss, indeed. The key question for me is how=20
>>>>>> well it
>>>>>> could map on other SoCs. Ralf, do you think it could be that simple,
>>>>>> based on your experiments? Or could we also face scenarios where we
>>>>> The question is what you try to achieve:
>>>>>
>>>>> Jan, when you introduced subpaging, the goal was to allow to assign
>>>>> devices to different domains, if multiple devices are located on the
>>>>> same page. We can observe that pattern on many platforms, and=20
>>>>> subpaging
>>>>> provides a "generic" solution.
>>>>>
>>>>> So what do you try to achieve with subpaging on a byte-wise/bit-wise
>>>>> granularity? Make a non-partitionable device partitionable? That will
>>>>> only work for some rare cases.
>>>> The main intention here was not to partition peripheral devices, but
>>>> just the registers
>>>> which are not really related to any device.
>>>>
>>>> Most SoCs will have something like this where pinmux registers,
>>>> efuse registers, internal muxes, MAC addresses, and other config=20
>>>> options
>>>> are provided.
>>>
>>> Can you point out another SoC that we support which would benefit from
>>> this description method?
>>>
>>
>> e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit
>> from this.
>> There are lots of pinctrl nodes in the mainline Linux kernel device
>> tree[0] and [1]
>>
>> Currently, the pinmux configuration is described in root cell device
>> tree [2] but not available in inmate device tree [3]
>>
>> [0] -
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra12=
4.dtsi#L334=20
>>
>> [1] -
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra12=
4-jetson-tk1.dts#L83=20
>>
>> [2] -
>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra12=
4-jetson-tk1.dts#L1035=20
>>
>> [3] -
>> https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inmate-=
jetson-tk1.dts=20
>>
>>
>> With this regmap framwork, it is possible to define the pinmux node such
>> that
>> inmate Linux kernel can configure the pinmux when running in=20
>> Jailhouse cell.
>>
>>>>
>>>> This series was intended to solve these kind of register partitioning.
>>>
>>> So, subpaging does not scale when we have a scattered access map,=20
>>> right?
>> Yes
>>> But can we use this description method to replace subpaging? The latter
>>> registers an contiguous mmio dispatch region, your approach=20
>>> additionally
>>> checks within that region a bitmap. A subpage entry can handle up to
>>> PAGE_SIZE-1, a regmap currently only 256 bytes.
>> regmap implentation can be changed to support 4k pages as well.
>> That way, a bitmap can be generated to pass to regmap. But there is
>> additional overhead of checking the offset.
>> But yes, regmap can replace subpage, however, this change should be
>> transparant without having to change the jailhouse_memory descriptions.
>>
>>> I wonder if we can
>>> combine both, maybe expand the memory region to optionally refer to a
>>> bitmap for finer-grained access control.
>> Yes, that is also a good option, This will increas the size of cell
>> config though.
>
> I don't think so, at least not noteworthy.
>
> One benefit of combining both would be benefiting from the more precise
> access size control features of the memory region. The regmap only
> supports one register size, memory region all of them. Also, we may save
> quite a bit of registration and dispatching code in the hypervisor.
>
> How about something like this:
>
> /* when set, access_bitmap_base is used for subpages */
> #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0 0x0200
>
> struct jailhouse_memory {
> =C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
> =C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;
> =C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
> =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
> =C2=A0=C2=A0=C2=A0=C2=A0__u32 access_bitmap_base;
> } __attribute__((packed));
>
> Then we would append access bitmaps to the config as needed, and each
> access_bitmap_base would point into that data. The size of each bitmap
> would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap means
> access allowed. In theory, we would get away with just adding the bitmap
> test to mmio_handle_subpage.
I like this as well.
Right now I am calling paging_destroy to make sure that the MMIO handler=20
gets triggered.
This can be avoided if the mem_region itself can be definesd it as bitmap.

Ralf, what are your thoughts?

- Nikhil D
>
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fb168c39-b767-6ae5-3fb0-08d5128a061c%40ti.com.

--------------658521E0A9AD3E9657A67BEC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 28/01/20 2:41 am, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:87f662c1-4be7-747f-5017-088c04f75ae0@web.de">On 27.01.20
      20:41, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 27/01/20 10:03 pm, Jan Kiszka wrote:
        <br>
        <blockquote type=3D"cite">On 27.01.20 17:13, Nikhil Devshatwar
          wrote:
          <br>
          <blockquote type=3D"cite">
            <br>
            <br>
            On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
            <br>
            <blockquote type=3D"cite">On 27/01/2020 15:49, Jan Kiszka
              wrote:
              <br>
              <blockquote type=3D"cite">On 27.01.20 14:56, nikhil.nd via
                Jailhouse wrote:
                <br>
                <blockquote type=3D"cite">From: Nikhil
                  Devshatwar<a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
                  <br>
                  <br>
                  This series adds support for partitioning registers
                  across different
                  <br>
                  cells
                  <br>
                  in the Jailhouse. Jailhouse supports partitioning
                  memory regions;
                  <br>
                  where it uses
                  <br>
                  MMU mapping for page aligned regions and subpage
                  handler for non
                  <br>
                  aligned regions.
                  <br>
                  <br>
                  However, most of the embedded platforms will have
                  common set of
                  <br>
                  registers which
                  <br>
                  need to be partitioned at the granularity of single
                  register. One
                  <br>
                  such
                  <br>
                  example is
                  <br>
                  the pinmux registers avaialble in many platforms
                  including K3 J721e.
                  <br>
                  <br>
                  This series implements a regmap unit which allows to
                  describe the
                  <br>
                  ownerhip of the
                  <br>
                  registers using a simple bitmap. This scales well when
                  you have to
                  <br>
                  partition
                  <br>
                  hundreds of control module or pinmux registers.
                  <br>
                  <br>
                  Nikhil Devshatwar (4):
                  <br>
                  =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add US=
B
                  mem_regions
                  <br>
                  =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config=
 for
                  partitioning registers
                  <br>
                  =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partit=
ioning
                  registers
                  <br>
                  =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PAD=
CONFIG
                  registers
                  <br>
                  <br>
                  =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=
=A0 41 +++-
                  <br>
                  =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
                  <br>
                  =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
                  <br>
                  =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
                  <br>
                  =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=
=C2=A0 |=C2=A0 47 +++++
                  <br>
                  =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 258
                  <br>
                  ++++++++++++++++++++++++
                  <br>
                  =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
                  <br>
                  =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
5 +-
                  <br>
                  =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
                  <br>
                  =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deleti=
ons(-)
                  <br>
                  =C2=A0=C2=A0 create mode 100644
                  hypervisor/include/jailhouse/regmap.h
                  <br>
                  =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
                  <br>
                  <br>
                </blockquote>
                Worthwhile to discuss, indeed. The key question for me
                is how well it
                <br>
                could map on other SoCs. Ralf, do you think it could be
                that simple,
                <br>
                based on your experiments? Or could we also face
                scenarios where we
                <br>
              </blockquote>
              The question is what you try to achieve:
              <br>
              <br>
              Jan, when you introduced subpaging, the goal was to allow
              to assign
              <br>
              devices to different domains, if multiple devices are
              located on the
              <br>
              same page. We can observe that pattern on many platforms,
              and subpaging
              <br>
              provides a "generic" solution.
              <br>
              <br>
              So what do you try to achieve with subpaging on a
              byte-wise/bit-wise
              <br>
              granularity? Make a non-partitionable device
              partitionable? That will
              <br>
              only work for some rare cases.
              <br>
            </blockquote>
            The main intention here was not to partition peripheral
            devices, but
            <br>
            just the registers
            <br>
            which are not really related to any device.
            <br>
            <br>
            Most SoCs will have something like this where pinmux
            registers,
            <br>
            efuse registers, internal muxes, MAC addresses, and other
            config options
            <br>
            are provided.
            <br>
          </blockquote>
          <br>
          Can you point out another SoC that we support which would
          benefit from
          <br>
          this description method?
          <br>
          <br>
        </blockquote>
        <br>
        e.g. We support jetson-tk1 which uses Nvidia tegra124. It can
        benefit
        <br>
        from this.
        <br>
        There are lots of pinctrl nodes in the mainline Linux kernel
        device
        <br>
        tree[0] and [1]
        <br>
        <br>
        Currently, the pinmux configuration is described in root cell
        device
        <br>
        tree [2] but not available in inmate device tree [3]
        <br>
        <br>
        [0] -
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124.dtsi#L334">https://elixir.bootlin=
.com/linux/latest/source/arch/arm/boot/dts/tegra124.dtsi#L334</a>
        <br>
        [1] -
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts#L83">https://elixi=
r.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts=
#L83</a>
        <br>
        [2] -
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts#L1035">https://eli=
xir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.d=
ts#L1035</a>
        <br>
        [3] -
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/siemens/jailh=
ouse/blob/master/configs/arm/dts/inmate-jetson-tk1.dts">https://github.com/=
siemens/jailhouse/blob/master/configs/arm/dts/inmate-jetson-tk1.dts</a>
        <br>
        <br>
        With this regmap framwork, it is possible to define the pinmux
        node such
        <br>
        that
        <br>
        inmate Linux kernel can configure the pinmux when running in
        Jailhouse cell.
        <br>
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <br>
            This series was intended to solve these kind of register
            partitioning.
            <br>
          </blockquote>
          <br>
          So, subpaging does not scale when we have a scattered access
          map, right?
          <br>
        </blockquote>
        Yes
        <br>
        <blockquote type=3D"cite">But can we use this description method
          to replace subpaging? The latter
          <br>
          registers an contiguous mmio dispatch region, your approach
          additionally
          <br>
          checks within that region a bitmap. A subpage entry can handle
          up to
          <br>
          PAGE_SIZE-1, a regmap currently only 256 bytes.
          <br>
        </blockquote>
        regmap implentation can be changed to support 4k pages as well.
        <br>
        That way, a bitmap can be generated to pass to regmap. But there
        is
        <br>
        additional overhead of checking the offset.
        <br>
        But yes, regmap can replace subpage, however, this change should
        be
        <br>
        transparant without having to change the jailhouse_memory
        descriptions.
        <br>
        <br>
        <blockquote type=3D"cite">I wonder if we can
          <br>
          combine both, maybe expand the memory region to optionally
          refer to a
          <br>
          bitmap for finer-grained access control.
          <br>
        </blockquote>
        Yes, that is also a good option, This will increas the size of
        cell
        <br>
        config though.
        <br>
      </blockquote>
      <br>
      I don't think so, at least not noteworthy.
      <br>
      <br>
      One benefit of combining both would be benefiting from the more
      precise
      <br>
      access size control features of the memory region. The regmap only
      <br>
      supports one register size, memory region all of them. Also, we
      may save
      <br>
      quite a bit of registration and dispatching code in the
      hypervisor.
      <br>
      <br>
      How about something like this:
      <br>
      <br>
      /* when set, access_bitmap_base is used for subpages */
      <br>
      #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0 0x0200
      <br>
      <br>
      struct jailhouse_memory {
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0__u32 access_bitmap_base;
      <br>
      } __attribute__((packed));
      <br>
      <br>
      Then we would append access bitmaps to the config as needed, and
      each
      <br>
      access_bitmap_base would point into that data. The size of each
      bitmap
      <br>
      would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap
      means
      <br>
      access allowed. In theory, we would get away with just adding the
      bitmap
      <br>
      test to mmio_handle_subpage.
      <br>
    </blockquote>
    I like this as well.<br>
    Right now I am calling paging_destroy to make sure that the MMIO
    handler gets triggered.<br>
    This can be avoided if the mem_region itself can be definesd it as
    bitmap.<br>
    <br>
    Ralf, what are your thoughts?<br>
    <br>
    - Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:87f662c1-4be7-747f-5017-088c04f75ae0@web.de">
      <br>
      Jan
      <br>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fb168c39-b767-6ae5-3fb0-08d5128a061c%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/fb168c39-b767-6ae5-3fb0-08d5128a061c%40ti.com</a>.<br />

--------------658521E0A9AD3E9657A67BEC--
