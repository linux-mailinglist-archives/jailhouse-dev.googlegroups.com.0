Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBHMP7HXAKGQEGRGHD2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07E10ACEF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 10:53:35 +0100 (CET)
Received: by mail-oi1-x239.google.com with SMTP id k137sf2104168oib.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Nov 2019 01:53:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574848414; cv=pass;
        d=google.com; s=arc-20160816;
        b=N6q3xjYgUZLiPbmhqQWfxklJs/lZpUrfc4IBQVAy/wxWLnPSKf7iQcsg++bjhoa43n
         qoep2VtxCCszvw6iEuVOEevIIdSNU4mfv0PS7axNUr5daf1LwgBnWt1aRbg47PBDe5rz
         O/ZNZzqLik2v+qogh5MYkt4YCXFXSXK38Z5p2snaCRU0E6X19w5U5nWxpPsvuhKvtCd9
         mX58ZEmf6H5M6sf7BgZhViheUDYGiLhjp7mopQbnmamxV0UMOD69PeXTSaw3AuIdks/L
         Wf4D+ggXqmgDXv0w2ow2f0HbfnvgNcyD+gA6vUExBwEglgTvQrBJN17C0mXcLjWt9qXX
         zd2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=J/3MRiFFHre83AHVLX/l46TiAxw1S45FlykOXYxHWHs=;
        b=p3KHdnRR20Eq7CZvX9qXem5GIgYwU6NZgCGKaQWzpmHpPpRctnoAKzlceEaXaAlj7b
         NFTVovLSLDgEbuK9rzx9YTWQzmC8z4bSYEyyjC5LlQjz/fXE8xiUGzwozpByCYEFRlWy
         doeXCuYRx1z+g0XDrvxjGhYrn0qv7TO3MybkM+edhwjhCGjSgy1qwyTgn/DQshyoEjKY
         pPS4q0r97BbbMjT7UNQleuQKcEoaLW7IJUaqUKXHzd19pHPeEcp1+jyXl0a2TgB1d1jG
         Yl9O+4oupcj3Y65HPlyT2onfG50h6Jp8GTKcEZ/GR/ZSpl5MI6tSnIDDAjUm+TknuRrA
         8WtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fc6QucXw;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J/3MRiFFHre83AHVLX/l46TiAxw1S45FlykOXYxHWHs=;
        b=XacBelyBkJBrqhl/QW0izXpnUtAAmJMWBnPQ1HM55xXYy1cgQrqFJZwXFxRm44yjNO
         /8ktJ/C7uuEXwDzAYyWCZGDIl9fUX4eTiXH0fngVYmXFo7LKXFEHtcSMPmYL2Lpuxu4x
         cxxiv1agqzJdvO/WJSxvOmwuxvq/j6LBVlcyoQrscVL07Vu4msrEYXTIQffSwBTCei5w
         1pwz1tumlGktAtmPITo4DS3EhS7OR4cGbxY9bd6uFT75dCrvQg4Y1j5JHBF6QtoIeWMU
         cIVWyVLx8w340YLQGqofwrTEK1t8TMeOM2f+qhd46Uf9RU5hdoI1X6tspOKMvLQV09zj
         mTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J/3MRiFFHre83AHVLX/l46TiAxw1S45FlykOXYxHWHs=;
        b=DD52xSGS9TIWJ5Oz8ShcAxRNHormhczmFBbPVWoZgxVXocJlDq80LrSrlggmI+uWsP
         neMktyEI3gSEd+B8Di1LTsAwiCmjn+KwX7uzM8UHdNwovp6TLEkR8te1gobjiQLulSZt
         AmcizJcJeOX3qbajtU21y1FcUoP1hrXuWilCf2710OMn17CXoQNQzaH7VWsO02lCR4mb
         vjqEDd/j1LQ6VyDTBRIk43bQAQH3C66pSxEUXCLDBzMc7wGRtwSu3ANmPbpbj8gfLBUt
         29YqMD0jzXRd7dLjn0foMDJLPGF640xjw552z3eiwy1rnhkCIcoq/I6MRfjTKe2O+Rom
         MqAA==
X-Gm-Message-State: APjAAAUJq4ZUIqUQ5d6xFc+VGoPgwMuOMri2FfGTf9Ag9uiVC2NBlnK8
	HVeWJI4IAq/6PC03E/de10w=
X-Google-Smtp-Source: APXvYqwfa9eWf3PsFiurwC430zKTQwOrh8cMOauZG+2YSxGC5f+oGjcif0cmkQXenj1mXrU/mR8v7A==
X-Received: by 2002:aca:5f02:: with SMTP id t2mr3448808oib.23.1574848413979;
        Wed, 27 Nov 2019 01:53:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:40d:: with SMTP id 13ls1971087oie.0.gmail; Wed, 27 Nov
 2019 01:53:33 -0800 (PST)
X-Received: by 2002:aca:ab15:: with SMTP id u21mr3357770oie.176.1574848413455;
        Wed, 27 Nov 2019 01:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574848413; cv=none;
        d=google.com; s=arc-20160816;
        b=d/nhfAqdkUhVXe/w++CvAuMXpRJkpcD7SsZ7molT3PFPsQ8MaD3wx/i+7zT+4gJiTm
         ge1/rqV6HRpdCZ5pDXAW+tbfycT4xfTBr06VoD5+lGhxzMrmIUp3nG4k43zzXdU7rYFY
         w/Ue0TSfK5xZnBp+SHFyjureCsIlFpA7Ywi+5YSKAnlQEIgIpCSNcVFlH3GFoR/uvjIq
         Qp6XAOqlbey20hsUruX3XagNVsU8DcfiQxAEXYARPNw3uON6LrE2M4fVRV6/Akg58/OX
         WWoCv+lNXM4de2HCny2fyQb2QfZ0XQdh6JdDYjc+/zriWe3mJhVXRp5oR7bHciNJ2GYm
         V5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=dIVX0QM4TwZNa7YWm1SaoWr3m80ksc8w1W8az1kGjx0=;
        b=LDhNA5gwQ+QHwhf6EBUOMW6gjKbbXN5zVdJMiOvOItEVpRbJN8YbD6WJAuQwswoe/t
         AHPeT8KKVdF6BgoJ9YROb8JXBkcvcm4QaYNB5FOzo0KyM0nZZClXkDUL39tHPx7G1T3J
         EHhbPnjP95OuTI3rCohr272fVrWrQPpex23qZxkTh6LZ5TdrnaRiZ4UhgSmfQ6R0WzpU
         Jrxf/qBCi7nCmWcifI4lg++B++MKEGn+BTRz1oAj0+h9uIrAhi42T/qxbhwe/FHuYVBh
         xhrv3b0Q91AKrJcULyf4wC2c2Ma+/s/+ijagvmNqefsXpQix7IjYz6BBrV06JaDKsgZi
         dryQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fc6QucXw;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id j26si519935otk.0.2019.11.27.01.53.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Nov 2019 01:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAR9rXir013878;
	Wed, 27 Nov 2019 03:53:33 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAR9rXEc100015
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Nov 2019 03:53:33 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 27
 Nov 2019 03:53:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 27 Nov 2019 03:53:32 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAR9rUe2062437;
	Wed, 27 Nov 2019 03:53:31 -0600
Subject: Re: ITS emulation in Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>,
        "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <ddc49d2b6a6f47a2b847b44aa1416074@ti.com>
 <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5c5e4cf2-c901-d080-1565-82a16ea45813@ti.com>
Date: Wed, 27 Nov 2019 15:23:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <81a7f9d2-d6b5-0eac-9bb9-1fa14a56df40@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=fc6QucXw;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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


On 19/11/19 12:14 AM, Jan Kiszka wrote:
> Hi Nikhil,
>
> On 18.11.19 14:26, Devshatwar, Nikhil wrote:
>> HI Jan,
>>
>> Current Jailhouse implementation has support for partitioning the SPI=20
>> interrupts on a GICv3.
>>
>> However, the LPI interrupts managed by the GIC ITS cannot be=20
>> partitioned.
>
> Is this something we would need a GICv4 for?

Yes. this applies to GICv3 and GICv4.

>
>>
>> Typical usage of LPI are for connecting PCIe devices on arm64=20
>> platforms where the endpoint sends MSI interrupts.
>>
>> Kernel drivers for GIC assumes full ownership of the ITS module.
>
> Means, it also touches registers it does not own? Or are there=20
> conceptually shared resources in the ITS that everyone needs to access=20
> when programmed own parts of it?

Software needs to access the ID registers, setup base address of the=20
different tables and queues.

Most of this is done once for each PCI device

When emulating, all these accesses should get trapped and policed by=20
Jailhouse

>
>>
>> To enable partitioning of PCI devices/functions (from same or=20
>> different PCI controller) across VMs,
>>
>> One of the key important feature that will be needed is the ITS=20
>> virtualization.
>>
>> Since the GIC ITS does not support per VM tables, one option would be=20
>> to use emulation of the ITS module.
>>
>> Here is the proposal for such an approach.
>>
>> =C2=B7GIC kernel driver allocates separate ITS table in its VM address s=
pace
>>
>> =C2=B7When Jailhouse is enabled, Hypervisor allocates a new ITS table an=
d=20
>> copies the descriptors from root cell
>>
>> =C2=B7All accesses to the ITS registers are trapped and emulated in the=
=20
>> Jailhouse
>>
>> =C2=B7Any attempt from a VM trying to setup the descriptor for a certain=
=20
>> device needs to be policed against VM ownership
>>
>> =C2=B7Jailhouse validates and updates the physical ITS table descriptors=
=20
>> to match the VM maintained tables
>>
>> This will be similar to the approach taken for SMMU stage1 emulation=20
>> developed by Pratyush Yadav.
>>
>> What so you think about adding this support in the Jailhouse?
>>
>> Would you be willing to accept patches for the ITS emulation?
>
> Well, we do want assignment of PCI devices to different cells when=20
> this is feasible, and we do want not only DMA partitioning but also=20
> safe & secure interrupt handling. OTW: Yes, we need something that=20
> enables that.
>
> And when the hardware does not (yet) support us in enforcing the=20
> partitions during runtime, we need to emulate that in software. It's=20
> just the question how complex that emulation needs to become, for=20
> Linux or for "educated" guests.

To give an overview, following will be the changes:

* Initialize ITS as part of the jailhouse enable, setup tables and=20
command queues

* Most ITS MMR emulation will be allow/forbid read/write of a bitfield=20
based on the VM accessing it

* Emulation of base address register write would be to map guest table,=20
copy few entries from guest table to hypervisor maintained table

* Emulate event and command queues similar to the SMMU emulation

* Add support for LPI injection into vCPU (Since VM's CPU affinity is=20
fixed, this can be optimized and can be a blind injection)


>
> BTW, those accesses to the ITS will not be on the interrupt handling=20
> path, will they? Only for the setup and maybe affinity adjustment?
IRQ acknoledgement does not need to access the ITS device table or=20
interrupt translation table.
>
> Jan
>
Regards,

Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5c5e4cf2-c901-d080-1565-82a16ea45813%40ti.com.
