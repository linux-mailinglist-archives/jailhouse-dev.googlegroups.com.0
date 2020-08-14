Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPE43P4QKGQEWPHWFYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F0244E36
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 19:47:41 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id d8sf1642857lji.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 10:47:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597427260; cv=pass;
        d=google.com; s=arc-20160816;
        b=aVrnjT7EbpzKo60MhLUjX151+ZB9YNcNi9xxWeZPmW8NNjzmnTTq/ZGLAnFDs9ZNrc
         G6Y1ndOCIfTBmgKCedmKdvKyzIGOcJK/IfKbQZnFSXsJuowiL3eKrBFfii+Ex2tYyHyQ
         ZPFli1xDA2LzRTMtdwMzKekbivUacb1dL4V9ng/LL5mRIJdqytFa3FnJsieEjQdZ8drm
         PxAxGb+SinAbPWab64iGctbyZ2cFL717t8yAWf1gW2lDoWIg9Qt7qVtoIiQCUOLtOPVV
         CbSAUVb5E/idoL6obyZKiQ7QPCrvCwvbBZV+fGDBo5KwJtrp5zPog5U/DYtTFRYMem7M
         OlGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:cc:to:sender
         :dkim-signature;
        bh=8baQcVxnMJHtJI8thdrWsPTg1CFbxqtyCVHgamLYBdw=;
        b=sLL/mHm6tEZt8Em/2wh3JcXKZABEGkE35l+tgtDTEQIp7JpBJ4ICIT0bgJTuf18lSf
         z2VH0ajNGIWoBP6q3ng4BHhnJoqR4T4/GslyXnqj9hHw96pZb/VAPoqvxqVOBq5pmt6q
         JsmZW+m2ussk6vaS0QE8UQu/bcTF9ldv1irz47RuPsvhFEcBUMUoRIryB6Zb+PI3LIRN
         H6BYX+eVzLdupfUpY/y3kKHXoNcG7+iqQ2YZ+qprGcUpNvKOhcw0zddMyC5o8VAxHwWg
         4HMGjar3yP1/z/i+7RuE2dkniaiwBtj7AoeWpCh9e2z+d00JXJXJmfehqkBxfxwfeIDv
         Kjvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GsOqCL4t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8baQcVxnMJHtJI8thdrWsPTg1CFbxqtyCVHgamLYBdw=;
        b=n/IkoH9mdnAl/83ROCmMCzWlZJ/lDveEZlOrzLQSQX7MnWeINZTAj33wTH0783C2Kx
         VmV+vGogvLyJgE6O/hz90wlAcseGHFfr7x0nahuXQTSnOtOHNpqDOoFg2M5ZmAAXrIty
         DtdnXXiMUQdhifVVc3szGv+8OGMimGCyvWghUAZC3fz9ghk98bOUEqKIxencLYRI+EfV
         0ZsuhUJTtxDtJbetyfhs6IeYUGxQYNrCi2qQR5xhHw+lY2FQnvH7aD4wpyFsFjwVrr0o
         s8lxkbCOh+D/+EvmWJOO3qpLzQkX05GO59Qf/wimeOFRpcOvQzdTGFHiodkS5D1agQeW
         Xz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8baQcVxnMJHtJI8thdrWsPTg1CFbxqtyCVHgamLYBdw=;
        b=NxVUIubPvIsdez7a41wExhvIR4suetu3G134IpXuDiqJtan0mFU39DZ5GKN66hUyU5
         ZpIZC4IPpvKF9RpfgsFIFeFNywT/NSPW3qxgDTtj1E0R3LK5Fofin8JVoiB+naLNHVxu
         1Rnl1pQ0kl2C9nsk6IwTUGE6WNG0+u73ngOCkrVTN6xc57+7FN4TBNcwEZpzh8trlG/L
         +kBCnoiw80qBmrO4HCKWfLeLpJVMhME+rFpdOXJdPuvLDL5p4Gd/DkLdlgn5ngLNAUSX
         KinB/eieO69yQsfArsrK+CJwz5ruZOTzABEzTfasBXaOMbmsOxNtdBMgbgqbxpeLeCud
         GjAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cDAM29m3Y3Gi1QlDdrxuWi1713D2DZrKo6ElviJKmPH4/x43v
	6h+CI8VJw+k4tS72u0UbaVI=
X-Google-Smtp-Source: ABdhPJzFcRlhXn3WP6MLBeKC+rnBJXPcTZppA4ZzJ5dS8tgY8EOSXEyRa8f60cP/m/GA+o8ny2yApg==
X-Received: by 2002:a2e:531c:: with SMTP id h28mr1901487ljb.322.1597427260627;
        Fri, 14 Aug 2020 10:47:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7c03:: with SMTP id x3ls178219ljc.5.gmail; Fri, 14 Aug
 2020 10:47:39 -0700 (PDT)
X-Received: by 2002:a2e:3518:: with SMTP id z24mr1844875ljz.360.1597427259717;
        Fri, 14 Aug 2020 10:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597427259; cv=none;
        d=google.com; s=arc-20160816;
        b=sYYBD+Ic0g64W3m/FT7jy5Gw7mSuVfyjlsS9bM0c/oTP+vSfVdk3A3wag2NKYkGdbW
         wOS0MAweI0sxc0tPNasdqdxDzEbho42EogN6mHR7b2Q1qkuk4eGCSCrcLK9f0yVc2sz8
         R3Xe9U4clGb1fT71HykrzA0do/vPtQDYUY6B06asEMzMANnvPpw/TGLBEE7xLUcMPcnO
         665hC/Jkwbd/S3OmUh6C99ttUBMJK+FbALZoLgp7JvlUDwYb1a9z1QolY1atTrz7nG4X
         +hNtNWiYqLrZrWiI2ardi4v+lgRsclAMjcfqHkK4EH9UA11LHxBr3WNCCQ98FGj86y4f
         OgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=MkvVciI76ZKCEaPuXxmTAdQh6WIugkcriRPX5i6klAg=;
        b=huT468r+Hfov3WsNtdqab2LX7P8MKEkphh1gqxcaoBctoosAswMnsi7QRndH+lLPXK
         hIPqktPhboEv9BMXuEY4ZT6iM16J4UyLVaKNKHMOfWwvtznxpyCx9DVrxHUq7yjPi7Ml
         zfL40UpZdl2Ec7YKSH8QITvd4nEXSoB35ugTlwTaWkCYRgYEzq62WDAjbMQvOM3ckKIe
         3PXF3L8Xm1vuFgFEFnDs6ezEBUR8rx8CDTomGox1RuTBcqfq43rUeJIZrrc8/1cO5tAj
         mEVqZEggQZOIm4mdpyTKccEh1X6qAGiO2wcSzLUR+J7clbpt24C+W5PD9/dzsn49K18C
         sWkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GsOqCL4t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f16si285330ljk.5.2020.08.14.10.47.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 10:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BSrVy5zXFzy8Q;
	Fri, 14 Aug 2020 19:47:38 +0200 (CEST)
Received: from [IPv6:2a02:8388:7c3:300:4e34:88ff:fe05:eed9]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 14 Aug
 2020 19:47:38 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Peng Fan <peng.fan@nxp.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH 06/10] Add libbaremetal
Message-ID: <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
Date: Fri, 14 Aug 2020 19:47:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GsOqCL4t;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 8/14/20 7:20 PM, Jan Kiszka wrote:
> On 14.08.20 19:06, Ralf Ramsauer wrote:
>>
>>
>> On 8/14/20 5:47 PM, Jan Kiszka wrote:
>>> On 14.08.20 17:06, Ralf Ramsauer wrote:
>>>> (+Cc Wolfgang, we recently had discussion on the boot process of
>>>> Jailhouse)
>>>>
>>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>>>>> On 14.08.20 11:08, Peng Fan wrote:
>>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>>>>
>>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>>>
>>>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>>>>> baremetal loader.
>>>>>>>>
>>>>>>>> The Makefile code is copied from inmates, currently only
>>>>>>>> string.c is
>>>>>>>> moved from inmates to libbaremetal. In future, we might need to
>>>>>>>> share
>>>>>>>> uart/mmu and etc.
>>>>>>>
>>>>>>> Might quickly become confusing to have two libs. What prevents
>>>>>>> renaming
>>>>>>> inmates/lib completely into libbaremetal? Sure, there are some
>>>>>>> jailhouse
>>>>>>> specifics in inmates/lib, but those could likely be put in some
>>>>>>> corner.
>>>>>>
>>>>>> How about rename inmates to baremetal?
>>>>>> And add bootloader stuff under baremetal?
>>>>>
>>>>> We could do
>>>>>
>>>>> baremetal
>>>>
>>>> What we provide is a minimalist runtime environment, which is not just
>>>> limited to baremetal applications (depends on the definition of
>>>> baremetal, though). But=E2=80=A6
>>>>
>>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
>>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
>>>>> =E2=94=94=E2=94=80=E2=94=80 tools
>>>>>
>>>>> and put the jailhouse loader under tools. Inmates is a "brand" in
>>>>> Jailhouse context, so it should remain in some form. But it's true,
>>>>> some
>>>>
>>>> =E2=80=A6 yep, the branding is the point why we should keep calling th=
em
>>>> 'inmates'.
>>>>
>>>>> of the existing demo inmates can already run without jailhouse.
>>>>
>>>> And that's the second point - we already have some kind of support for
>>>> this kind of use case. However, I agree that I wouldn't expect the
>>>> preloader inside inmates/.
>>>>
>>>>>
>>>>> Ralf, what do you think?
>>>>
>>>> Peng, I just read the code of the loader and I try to understand what
>>>> how it's exactly working. Nice work! Do I see that correctly: You
>>>> basically "imitate" Linux in a way that you manually do the early setu=
p
>>>> (some register setup, GIC init, kick off all CPUs, hv stubs, ...).
>>>>
>>>> IOW, you bring the system to the same state, where the Linux driver
>>>> would hand over Jailhouse. You activate Jailhouse, we then return to
>>>> the
>>>> loader which got lifted to the first cell, the root cell. Now you use
>>>> the loader to partition the system, i.e., to create cells. Therefore,
>>>> you use the hypercall interface, just like Linux would typically do it
>>>> for us. Finally, there's the hand over to Linux.
>>>>
>>>> But do we really need a separate loader? Can't we just place the
>>>> loader-related stuff at, say, the end of jailhouse.bin?
>>>>
>>>> To be more concrete, i think it should be possible to have the full
>>>> preloader-thing located under hypervisor/arch/arm64/. It should also b=
e
>>>> possible to link everything that is required into jailhouse.bin - so w=
e
>>>> would get one universal binary instead of a chain of dependent
>>>> binaries. [1]
>>>
>>> Interesting idea.
>>>
>>>>
>>>> Pro: You can make early use of the UART in your preloader without
>>>> having
>>>> the need to, for example, duplicate drivers. That's quite useful for
>>>> debugging if something goes wrong very early. Secondly, you can also
>>>> piggyback on existing gic routines, no need to reimplement
>>>> phys_processor_id, =E2=80=A6
>>>>
>>>> The next thing after early boot would be the handover to jailhouse.
>>>> Before the handover, we set a flag that indicates that we do an early
>>>> boot of Jailhouse. We can use this flag to do the full partitioning of
>>>> the system before we return to the guests in one single step. IOW, we
>>>> never return to the preloader once the handover happened. We can do
>>>> that, as u-boot already placed our guests and we just need to start
>>>> them
>>>> (as we would start regular cells).
>>>>
>>>> The amount of additional logic in the actual hypervisor core should be
>>>> reasonably low.
>>>>
>>>> Did you already consider that strategy? Jan, what do you think?
>>>
>>> As we are already in visionary phase... There is another use case to
>>> consider:
>>>
>>> I'd like to have a Jailhouse variant that comes without a root cell.
>>> That means, we will need a booting procedure that creates all cells,
>>> loads and starts them - and then drops all the logic that could
>>> configure or destroy them (or never includes it in the first place -
>>> build-time setting). This should reduce the Jailhouse runtime code to
>>> much less than 10K LoC.
>>
>> Ok, that's indeed an awesome idea.
>>
>>>
>>> Peng's approach is useful in case you do want to keep the flexibility t=
o
>>> reconfigure the system from a root cell, just like you can do when
>>
>> To be honest, I consider the "dynamic" reconfigurability of Jailhouse as
>> a development and testing utility rather than something that would ever
>> be useful for operative usage. This includes, of course, jailhouse
>> disabling.
>=20
> Reconfiguration, yes, but reloading can be a topic in certain scenarios.
> The current config locking mechanisms allows to keep this door for the
> root cell open, even while there is a critical cell running.
>=20
>>
>> What would be great would be a single-shot 'jailhouse freeze' (or, ha,
>> 'jailhouse detention') call, that throws away the whole hypercall
>> interface. Having such a thing, we an drop everything that is somehow
>> related to cell management: create, start, stop, destroy, stats,
>> disable, enable, ...
>>
>> And that would in fact be no big deal: Annotate all affected routines,
>> replace hyp vectors with stubs, drop the section, done. Every code that
>> has no other users than from a hypercall can be dropped. Or do I miss
>> something?
>=20
> I haven't thought this through in details yet, but I would be surprised
> if there weren't at least some smaller challenges in implementing that
> cleanly. Still, it's mostly about disabling code.
>=20
>>
>>> booting via Linux. The idea of adding a preloader is minimal invasive t=
o
>>> the existing setup. My root-less mode will be maximal invasive, though.
>>
>> Why do you think that it would be maximal invasive?
>=20
> As it changes the current hypervisor code for sure. Just loading
> Jailhouse via a different thing than Linux does not bring many changes,
> at least to the core. See this series.
>=20
>>
>> Oh btw: who would receive the freed memory? Would it remain in the
>> hypervisor or be assigned back to a cell? Though that should probably
>> only be a few pages.
>=20
> What freed memory? When things are only created, nothing will be freed
> anymore. There will also be no jailhouse disable.

There will, e.g., be a cell_create routine, that will be called once per
cell. After the creation of those cells, drop it, we won't need it again.

If we have a universal binary, there will be a jailhouse disable will be
present in the beginning. Once we decide freeze the configuration, drop
it. If we make those things compile-time configurable, then it has
potential to become a variant hell.

>=20
>>
>>> If root-less would be sufficient for cases you do not want Linux-based
>>> boot, we can skip this approach and head for root-less full steam.
>>
>> root-less means that the detention call (I like that) comes after cell
>> creation, but before cell start. .oO(we can even drop the cell_start
>> code, if we find a smart strategy to drop code right before vmreturn)
>>
>=20
> I would rather envision some alternative configuration that contains all
> cell configs, not just the root cell (which would become a non-root cell
> as well). Loading would have to happen into the target memory regions
> before jailhouse enable, and the enabling would also imply starting all
> cells.
>=20
>>>
>>> If there are use cases for all three variant, we can try to look for
>>> common pieces in the two Linux-free options. My root-less mode would
>>> also need a single-step "create and start all cells", e.g. And your ide=
a
>>> to include the bootstrap logic into an init section of jailhouse.bin is
>>> also attractive for both.
>>
>> Yes, I see the overlaps. By the way... Why don't we actually do:
>>
>> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image

Even better:

cat preloader.bin jh.bin sys.cell c1.cell c2.cell > jh.image

Again, the preloader.bin is still a binary image that only contains the
preloader section, but u-boot can directly jump into it. It is still
developed under hypervisor/arch/foo and hence has full visibility of all
symbols that are available in regular jailhouse code and can potentially
use them. We just exploit the linker to export that section to a
separate binary.

If someone wants bare-metal boot mode, we just glue things together.

>>
>> for the bare metal case?
>=20
> That comes close to what I have in mind, config-wise. sys.cell would
> still need a counter of cells that follow (simple to add to struct
> jailhouse_system).

Not necessarily. We can also define a zero-termination. Once the first
byte of the JHCELL magic isn't present, we're done. But that's details.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9d551e5e-25fb-4c8f-66a4-934187b9650f%40oth-regensburg.de.
