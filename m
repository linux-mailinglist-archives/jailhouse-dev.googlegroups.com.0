Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD6IZPYQKGQEO5MHRXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09914DC8F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 15:11:27 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id ck15sf2414670edb.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 06:11:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580393487; cv=pass;
        d=google.com; s=arc-20160816;
        b=jKwti5c5YGEqQv/yuXfQWCivOgJ1lZbhiwMQx36p6Fqf8FS5M95VP/kOF9YNIB7P0M
         qX7Z4BTZ3vnri1yKmrL0IKZx4kK+tPcXyiuGCWVA8LEVDR2qwGNJ3L2HHgAIKHMDm571
         TA5FIXfdLTnxbOLXxGrK1MAM9CWqdPrrhirkXUWeyX16Oxv3IcNNlbgrEUOY66s3at3/
         Nkm9Xodzx0WKeOTEvFsJYtPbcou96ZyMixkxX3F4w3yrYT1vWKxgF/hLw35/23ZvSdCy
         43AXazEx40wVIYmrI0hTbsIN9PqOhwwssvT/l71n8329XUPQ4LSno1LykOdMb4joIGAz
         t37A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=gu6LsBH4Y5E1VbmtMhU3Gm948wgs/RsfCoS1XDop+eA=;
        b=Abiwj6QKejON4sLlIhub0NpA3GWFbOG0BX/12EDa6E/3DaGBFLaiB8fPd8njPRP2US
         xfIsSPFRyZbFaJUy2bFcHZlBXmVxekH9nnGfs5gshF0gNv0ac801Fn63axlzic0kfW7n
         W+2+m15JezOqCDZSGK4enm3Jts8OuLzUyGnLxxhMatHSQdGg76BnEishq7rTnnIyaeap
         lxU5AyXvEHGs+1SyElAOsUuEaqzMcB74HhQKxGqiw9aJUTwaLrBdRa4FS/PcZbNMhZ5z
         M83blibOymYMEh845eFkTHfIE4p528BAifV7PpnovBRjnUn3xf7won3TBslR/LoYmrnz
         g0pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gu6LsBH4Y5E1VbmtMhU3Gm948wgs/RsfCoS1XDop+eA=;
        b=XzBJMlOvk1RZOMmec3jJGRUBn2fHVhJcoCQxkBaeA0hqGU5RYKckL5bPKrV/SjFDhG
         tpydjCvZSQXWxaWhmqWE0VRK24f12gVDnk9XRMq/WZIQeyqYMYSgwPvi62qFeB1FtR7V
         HJ8K7lrXIYvOrq5ALESdQpERMTf6sh/gf697vnmJmi0WbD6qyFcPzo7KDXhPTf2aUSq7
         vPYFB9L6szhDQ3qzYfxJhQpyAHq9Sv/I5JACMZMI83Uz8ITqkDce3+IhP8+CUECA4JMh
         zuJhS1goZRJdjWlKvn/qfrvGxAkouKVONUDJxHc7MFJNHOEM1arqfgL9wiV/eSgc8tdc
         Lwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gu6LsBH4Y5E1VbmtMhU3Gm948wgs/RsfCoS1XDop+eA=;
        b=Ttn2sJwz6vAJzS3zxN1YCIgJEnbwwAbJ04cb8+tR4WdeVDpThEZwN0IiBzhk65+Mji
         T62JRa5mbg0ozrqZuIhEGCezKZB3B4ZD23USaISxkY5HoSFK2jDP+6qu37SMEFWv86w0
         3MAqOLQk1MQd1/txAjGzfAbUsQ+tjna3cznOtJzW1tuZfPOppVGte3RsWKKyEhG/YkWr
         zSPRd+yIT1oVid07XzB7y6Aj9DR5bpl0w/2pAjFoHUBA5jzO3r//YqWZ2l6Hq5fyr1BD
         8dTNpVeyadAP9Y7hEJe8LRTlSC7r3tq76IDxGfQvItN7Zsul3NHVLT+47E5onzlIjMh1
         s05A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmwqdyV4tMOG/pEPGlX3yvOkbwNCk6UkdCWVWBll3opReFQe9J
	lHTfo7FHJLFmzVKzqC5Xxt8=
X-Google-Smtp-Source: APXvYqyGaLpbQ5iq+azLvhdl84FT5gAsUIGrAzQFbijCLsTo5m0q5TdvhuIOrC3Yih8DzS0tWtosqw==
X-Received: by 2002:a05:6402:b62:: with SMTP id cb2mr3958456edb.327.1580393487527;
        Thu, 30 Jan 2020 06:11:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9558:: with SMTP id v24ls1604571eda.2.gmail; Thu, 30 Jan
 2020 06:11:26 -0800 (PST)
X-Received: by 2002:aa7:d1d1:: with SMTP id g17mr4131266edp.185.1580393486734;
        Thu, 30 Jan 2020 06:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580393486; cv=none;
        d=google.com; s=arc-20160816;
        b=BtVz81FXkHRopiJLCMid4BFEuHY71zSqDggNaxqbNc9wirKA5AnV1Idr1rsAGACl7M
         sT3VBV5iow7ptajvmTUhgSM00bT0X83mZwbrwuA1mZ0e96GhSmppaMqNBy3zbuiqvdbi
         68IqA8jY8TB18eWyEwffTyl2Qb8Ex+zbbhB6FpMRlMOD5xQk5djjqCC+aQVJej6OX0Cj
         rfIZK3rshqiEcYejkVwxO6UGkag2MzJBSqbwSyPN5e0S7yQ+hwj2fTj3kFuwqjfta7Im
         1QXLjC7ifofN2OUnWLdZUUXxPTmk+zRkPb0OWEpRO0lKFe4HloSDSA1O8pEky232lYg9
         qWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=oINgQCmCmaixkUCSbGMRWWyqXIIV0A2KyuKfIytOJLY=;
        b=L8/7gbm+6Q6jlZHEjDRtGUqWyOXMzu2FuF45zWeaJT/XdpdKC0Bn5NY0m2ULAl8CcT
         C3C1Bq8pFvuXlsmK0wvtXmCrO4+8KLW5fs8b1Md8SXstY/OZaUyoDxr0JQ3PimZa7Otb
         IrHpPOidbr28uBIDhyVZXOgrNLSl2lvkVZv+hOUBwEChhQX67dimfy9tfr1Sxyd5/jlL
         NtILcaaoQuSr9S3KSe3AHV7xDlpNqkqkIMnIfPK01I5EqbHLfDYW4kcLPN84HNg7dpXq
         lO+venTV4Yhvqa3X89VE283Kd+BE6MtscC6YceFIm7jzXbMAKcFAntj5xDl1t3WaAI1O
         do1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x18si206150eds.2.2020.01.30.06.11.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 06:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00UEBQhn015056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2020 15:11:26 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00UEBP3j000521;
	Thu, 30 Jan 2020 15:11:25 +0100
Subject: Re: [RFC PATCH v1 0/4] Add support for partitioning registers
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20200127135611.21302-1-nikhil.nd@ti.com>
 <e4e85734-bcc5-d833-3f31-53e90c186de3@web.de>
 <d52d8792-9d28-e76c-5f0d-b00e456ae03c@oth-regensburg.de>
 <c02f19d0-183e-a12c-5364-ccb391a2cab8@ti.com>
 <7222df54-40c7-6958-570e-9eb50365e905@web.de>
 <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
 <87f662c1-4be7-747f-5017-088c04f75ae0@web.de>
 <fb168c39-b767-6ae5-3fb0-08d5128a061c@ti.com>
 <7be98c82-d415-8215-d35c-11241d3727cd@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0c50f891-8bc2-ed3d-a487-69837346a873@siemens.com>
Date: Thu, 30 Jan 2020 15:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7be98c82-d415-8215-d35c-11241d3727cd@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 30.01.20 14:38, Ralf Ramsauer wrote:
> On 28/01/2020 09:09, 'Nikhil Devshatwar' via Jailhouse wrote:
>>
>>
>> On 28/01/20 2:41 am, Jan Kiszka wrote:
>>> On 27.01.20 20:41, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 27/01/20 10:03 pm, Jan Kiszka wrote:
>>>>> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>>>>>
>>>>>>
>>>>>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>>>>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>>>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>>>>>
>>>>>>>>> This series adds support for partitioning registers across
>>>>>>>>> different
>>>>>>>>> cells
>>>>>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>>>>>>> where it uses
>>>>>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>>>>>> aligned regions.
>>>>>>>>>
>>>>>>>>> However, most of the embedded platforms will have common set of
>>>>>>>>> registers which
>>>>>>>>> need to be partitioned at the granularity of single register. One
>>>>>>>>> such
>>>>>>>>> example is
>>>>>>>>> the pinmux registers avaialble in many platforms including K3
>>>>>>>>> J721e.
>>>>>>>>>
>>>>>>>>> This series implements a regmap unit which allows to describe the
>>>>>>>>> ownerhip of the
>>>>>>>>> registers using a simple bitmap. This scales well when you have t=
o
>>>>>>>>> partition
>>>>>>>>> hundreds of control module or pinmux registers.
>>>>>>>>>
>>>>>>>>> Nikhil Devshatwar (4):
>>>>>>>>>  =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_r=
egions
>>>>>>>>>  =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for pa=
rtitioning
>>>>>>>>> registers
>>>>>>>>>  =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioning =
registers
>>>>>>>>>  =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG =
registers
>>>>>>>>>
>>>>>>>>>  =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 =
+++-
>>>>>>>>>  =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>>>>>>  =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>>>  =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
>>>>>>>>>  =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=
=C2=A0 47 +++++
>>>>>>>>>  =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 258
>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>  =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>>>>>>  =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>>>>>>  =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>>>>>>  =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>>>>>>  =C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhouse/reg=
map.h
>>>>>>>>>  =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>>>>>
>>>>>>>> Worthwhile to discuss, indeed. The key question for me is how
>>>>>>>> well it
>>>>>>>> could map on other SoCs. Ralf, do you think it could be that simpl=
e,
>>>>>>>> based on your experiments? Or could we also face scenarios where w=
e
>>>>>>> The question is what you try to achieve:
>>>>>>>
>>>>>>> Jan, when you introduced subpaging, the goal was to allow to assign
>>>>>>> devices to different domains, if multiple devices are located on th=
e
>>>>>>> same page. We can observe that pattern on many platforms, and
>>>>>>> subpaging
>>>>>>> provides a "generic" solution.
>>>>>>>
>>>>>>> So what do you try to achieve with subpaging on a byte-wise/bit-wis=
e
>>>>>>> granularity? Make a non-partitionable device partitionable? That wi=
ll
>>>>>>> only work for some rare cases.
>>>>>> The main intention here was not to partition peripheral devices, but
>>>>>> just the registers
>>>>>> which are not really related to any device.
>>>>>>
>>>>>> Most SoCs will have something like this where pinmux registers,
>>>>>> efuse registers, internal muxes, MAC addresses, and other config
>>>>>> options
>>>>>> are provided.
>>>>>
>>>>> Can you point out another SoC that we support which would benefit fro=
m
>>>>> this description method?
>>>>>
>>>>
>>>> e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit
>>>> from this.
>>>> There are lots of pinctrl nodes in the mainline Linux kernel device
>>>> tree[0] and [1]
>>>>
>>>> Currently, the pinmux configuration is described in root cell device
>>>> tree [2] but not available in inmate device tree [3]
>>>>
>>>> [0] -
>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra=
124.dtsi#L334
>>>>
>>>> [1] -
>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra=
124-jetson-tk1.dts#L83
>>>>
>>>> [2] -
>>>> https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra=
124-jetson-tk1.dts#L1035
>>>>
>>>> [3] -
>>>> https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inmat=
e-jetson-tk1.dts
>>>>
>>>>
>>>> With this regmap framwork, it is possible to define the pinmux node su=
ch
>>>> that
>>>> inmate Linux kernel can configure the pinmux when running in
>>>> Jailhouse cell.
>>>>
>>>>>>
>>>>>> This series was intended to solve these kind of register partitionin=
g.
>>>>>
>>>>> So, subpaging does not scale when we have a scattered access map,
>>>>> right?
>>>> Yes
>>>>> But can we use this description method to replace subpaging? The latt=
er
>>>>> registers an contiguous mmio dispatch region, your approach
>>>>> additionally
>>>>> checks within that region a bitmap. A subpage entry can handle up to
>>>>> PAGE_SIZE-1, a regmap currently only 256 bytes.
>>>> regmap implentation can be changed to support 4k pages as well.
>>>> That way, a bitmap can be generated to pass to regmap. But there is
>>>> additional overhead of checking the offset.
>>>> But yes, regmap can replace subpage, however, this change should be
>>>> transparant without having to change the jailhouse_memory descriptions=
.
>>>>
>>>>> I wonder if we can
>>>>> combine both, maybe expand the memory region to optionally refer to a
>>>>> bitmap for finer-grained access control.
>>>> Yes, that is also a good option, This will increas the size of cell
>>>> config though.
>>>
>>> I don't think so, at least not noteworthy.
>>>
>>> One benefit of combining both would be benefiting from the more precise
>>> access size control features of the memory region. The regmap only
>>> supports one register size, memory region all of them. Also, we may sav=
e
>>> quite a bit of registration and dispatching code in the hypervisor.
>>>
>>> How about something like this:
>>>
>>> /* when set, access_bitmap_base is used for subpages */
>>> #define JAILHOUSE_MEM_ACCESS_BITMAP=C2=A0=C2=A0=C2=A0 0x0200
>>>
>>> struct jailhouse_memory {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u64 phys_start;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u64 virt_start;
>=20
> Does the offset inside the page need to be the same for phys and virt?

It should not: virt is where Jailhouse intercepts the guest accesses,=20
phys is where it mapped the real device internally in order to execute=20
those accesses. Practically, we don't exploit that feature so far, though.

>=20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u64 size;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u32 flags;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0__u32 access_bitmap_base;
>=20
> We don't need access_bitmap_base.
>=20
> When we iterate over all memory regions, we know the pointer to the next
> bitmap. Initially, the pointer points to the end of the config. That's
> all information we need. Together with the size member of the current
> region, we can simply online calculate the location of the next bitmap
> and forward the pointer.

Yes, we may be able to generate that pointer while parsing the config=20
and store it in the runtime state of Jailhouse. But we want a pointer=20
when we need to process an access.

>=20
> For the bitmap: Ideally, the first entry of the bitmap is non-zero,
> otherwise phys_start would be off, right?

I don't get this yet.

>=20
>>> } __attribute__((packed));
>>>
>>> Then we would append access bitmaps to the config as needed, and each
>>> access_bitmap_base would point into that data. The size of each bitmap
>>> would be (jailhouse_memory.size + 7) / 8. A bit set in the bitmap means
>>> access allowed. In theory, we would get away with just adding the bitma=
p
>>> test to mmio_handle_subpage.
>=20
> Ack. I like this idea.
>=20
> Bitmap size could also be aligned with the bit width of the target
> architecture. But that's just a minor detail...
>=20
>> I like this as well.
>> Right now I am calling paging_destroy to make sure that the MMIO handler
>> gets triggered.
>> This can be avoided if the mem_region itself can be definesd it as bitma=
p.
>>
>> Ralf, what are your thoughts?
>=20
> We can easily extend this idea to allow for bit wise granularity:
>=20
> #define JAILHOUSE_MEM_ACCESS_BYTEMAP    0x0200
> #define JAILHOUSE_MEM_ACCESS_BITMAP     0x0400
>=20
> struct jailhouse_memory {
> 	__u64 phys_start;
> 	__u64 virt_start;
> 	__u64 size;
> 	__u32 flags;
> } __attribute__((packed));
>=20
> The length of the bitmap is either (.size + 7) / 8 in case of
> JAILHOUSE_MEM_ACCESS_BYTEMAP and .size in case of
> JAILHOUSE_MEM_ACCESS_BITMAP.
>=20

That would be possible, true. Would we have a use case for BITMAP already?

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0c50f891-8bc2-ed3d-a487-69837346a873%40siemens.com.
