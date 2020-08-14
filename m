Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRMP3P4QKGQEYWW3E6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EF244D6A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 19:20:05 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id a5sf3533354wmj.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 10:20:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597425605; cv=pass;
        d=google.com; s=arc-20160816;
        b=HwH3tOYNH8F3aCbYhNKGKqGzepSLWl+5+PhyBY2bkeVnDVTwW9ovTMp7dDAad8fqn7
         yVGz9LGofO702iwy2SecIpPHvD6/T58CO/kth0qycp6KzPHnmrC1T7zhU9iz4k6s9kMY
         6RZwQiMwlnETNecYu9U9Rvb8jQ4NSu7sXj7l3CDPyVfAKXmlbbD9VeB9m2yR6cJ1Hhl7
         y2jo5KmhAHukI76zvlFVdNIm+hXSeL5wCzQyPBQtSR0WJ94IB76SiLixxWcbplLolrpF
         R8pjS7pFDVBVxSCd3y6L/etcUYlgjIdwJTDwoyuOT62FAjlbp4ikR7vX6bepwQmSv5uY
         G3Gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=/BS5VBMkARfDWt/sUKqdEeOKn6f6vEmRAgEQtuyP/AY=;
        b=w/hhnMDc4bB3FrGoo7PcknoM4XtHu3mSV4jVGIw+4brCB/JSoWNCO5RGQCsUAuYTIg
         toukOnPsCNCjW1S1Qc19NanXrHSVXk56kOq41E/4UZAd7TQUKErRnDWvc7AtdnDGdB3W
         w53O3RrmcHl0OkU/Xb11MBZTRprkd4LjgOklst2GLhMA7O66U+RQUcallicCAgyBWQPJ
         Jbh3kPrcC89h0kiHLledcIYFj859/ZCOCLU1uadJc8Ddxo1/8ZBwsZPX8gWtYYxhzPxi
         ChbTgjpnf1Lgx2zYbiZBYdx0GIsLjAOBnXQDwwGdWP0HBdXh+Ks7G+mU9+BwGsli/IjG
         Umrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/BS5VBMkARfDWt/sUKqdEeOKn6f6vEmRAgEQtuyP/AY=;
        b=ZxOeE5PP85uFPTh6WLlsYWnLgOzTCtH/YBYNJ5k+sNjsL5zNwqk1rhJB3UA/L98+UL
         pLRhB9XAZjnzr04hXqM7RtwJJtnO7ZWbs7uCXnuL80NJMAUYrpAxL2sZeTIuA5kO/Bg1
         7m/embi9sQaxugq+jbu8PXBZTMI28Q7OrcmI+jwLIrDr5n3yvx/fab7VFnhuzWSkrWBh
         37/te3gStNpFCQQwC49Zt1SMotlbkhXHKoxhJ5Heea2bTU86NnjDB2ODV13B4f9EBpzA
         ktevkm1vNqPKwJtfy4fjBFkfDkRwjq8Qcp+OCV95pGBczwk/ZVXDA8XGlBNDuWjHXD2X
         CuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/BS5VBMkARfDWt/sUKqdEeOKn6f6vEmRAgEQtuyP/AY=;
        b=g1ETnzb+oKLXUnLfnzShiPP7gXJlCVnkGaFZqDNP7X/T9Oe8YIcQCqXYR0EsFurPM2
         yFZ3CiPjbgnhSNzX04bsd6W8u/ObygUg1MT3wyyzpKPU2vF/xawEFGh6Bmd4UbZ40VKn
         8+lTnEB1N/upoehM5ljdn0KG0DniR3rD5EMT0LZn4ek+yi2u1uO3u6oiwrWlywQ8AV5p
         uFjX4HpPgEqwFkU9p9THrYMrQsCdqQ/ZWWY1pZ/pxjfFo9vHOyPRbiwfFy56IkQG16cc
         zShjy++AG0kT9HpK2SVQGEdbWyXmP550LaRZoxbO4jxIMPm/Trs0dM76AA7CeEKgP4V/
         GY5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531h5ghU0iu9VJ046pqByW3VcnTpnEt1Y7ZtzyS5TcNYDiNvLpK5
	yTtnmBAW+kEcI61NHZyC6/A=
X-Google-Smtp-Source: ABdhPJzdkyMAmw8Vr4B5M2lFbE6KAd8I5PujYjJaqRq+XbnqkJ6oD11LZekYbTlfJq0Ir3CAz9cfXQ==
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr3740088wrv.423.1597425605549;
        Fri, 14 Aug 2020 10:20:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fa8e:: with SMTP id h14ls688023wrr.0.gmail; Fri, 14 Aug
 2020 10:20:04 -0700 (PDT)
X-Received: by 2002:a5d:6a4a:: with SMTP id t10mr3765337wrw.360.1597425604706;
        Fri, 14 Aug 2020 10:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597425604; cv=none;
        d=google.com; s=arc-20160816;
        b=p1mTTshLi4orjHLoT3d5S6w6JcsrX6hk9ollzJi333zeUyjN6VnN00EZ77GAajPGkk
         +PtgBqaMBr8fUFnPx/p10UePoLyfRyhZ0Yvn3aHctb70jCHVdidSk1ZkAIY1c184fjja
         CZCeZmR/vwyiFbmImCsNmpRKy8AInemMqWpDpV/nw+A2oqwa1DNeXgZuvcSEgnbsU7qb
         GBgXLhgoEFxToeoSX1MDOSlusporGttiiSWfusbHqDtpsP0gFlv1q80i4iE5Rd6Dc3gI
         KoEGSSiFvWve0Jr2Y8WuIY2qB4FDEWaHa7B6+Npz9i0KEVLPimRvcKE1areRSocQXF3m
         y6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=PY3nz2DIWTfMII61EkuTv6813uUUioda1ChsHgKHh1E=;
        b=K7rZtTUxZd9DgV5E70dnOIkkRw63+OkKUiuDgqy/G16ZuKc93RjAnYBb+ExLtn6lQI
         8ZXoOyn58OL9zCdybSMG+7fQxQokTCrpJYlk+PzIaEUNciBdNy5Dh8XFjThfWCAEW2Dc
         QcojxScCOjI/TuSlmr1QQ6GApkMxGkQt62qnfCjgvYfAQXFLsxYUXRzfs6TLItYd3hP2
         MgDJFg4JDnYOVkgpA7CVUfoHuUYJakyI5HLn6VFk5/gmgOX0zaIfOdHJOjLuR4boO8Wg
         Q+0goP39aMExs1HSaoXtXvWXXnyPkHKOAVgiRQcnsomPcQurk/wF/ESZW+4MkUpY6IE0
         eIkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w6si639492wmk.2.2020.08.14.10.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 10:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EHK4MF013356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 19:20:04 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EHK3hQ017590;
	Fri, 14 Aug 2020 19:20:03 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
Date: Fri, 14 Aug 2020 19:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 14.08.20 19:06, Ralf Ramsauer wrote:
>=20
>=20
> On 8/14/20 5:47 PM, Jan Kiszka wrote:
>> On 14.08.20 17:06, Ralf Ramsauer wrote:
>>> (+Cc Wolfgang, we recently had discussion on the boot process of
>>> Jailhouse)
>>>
>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>>>> On 14.08.20 11:08, Peng Fan wrote:
>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>>>
>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>>
>>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>>>> baremetal loader.
>>>>>>>
>>>>>>> The Makefile code is copied from inmates, currently only string.c i=
s
>>>>>>> moved from inmates to libbaremetal. In future, we might need to sha=
re
>>>>>>> uart/mmu and etc.
>>>>>>
>>>>>> Might quickly become confusing to have two libs. What prevents
>>>>>> renaming
>>>>>> inmates/lib completely into libbaremetal? Sure, there are some
>>>>>> jailhouse
>>>>>> specifics in inmates/lib, but those could likely be put in some
>>>>>> corner.
>>>>>
>>>>> How about rename inmates to baremetal?
>>>>> And add bootloader stuff under baremetal?
>>>>
>>>> We could do
>>>>
>>>> baremetal
>>>
>>> What we provide is a minimalist runtime environment, which is not just
>>> limited to baremetal applications (depends on the definition of
>>> baremetal, though). But=E2=80=A6
>>>
>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
>>>> =E2=94=94=E2=94=80=E2=94=80 tools
>>>>
>>>> and put the jailhouse loader under tools. Inmates is a "brand" in
>>>> Jailhouse context, so it should remain in some form. But it's true, so=
me
>>>
>>> =E2=80=A6 yep, the branding is the point why we should keep calling the=
m
>>> 'inmates'.
>>>
>>>> of the existing demo inmates can already run without jailhouse.
>>>
>>> And that's the second point - we already have some kind of support for
>>> this kind of use case. However, I agree that I wouldn't expect the
>>> preloader inside inmates/.
>>>
>>>>
>>>> Ralf, what do you think?
>>>
>>> Peng, I just read the code of the loader and I try to understand what
>>> how it's exactly working. Nice work! Do I see that correctly: You
>>> basically "imitate" Linux in a way that you manually do the early setup
>>> (some register setup, GIC init, kick off all CPUs, hv stubs, ...).
>>>
>>> IOW, you bring the system to the same state, where the Linux driver
>>> would hand over Jailhouse. You activate Jailhouse, we then return to th=
e
>>> loader which got lifted to the first cell, the root cell. Now you use
>>> the loader to partition the system, i.e., to create cells. Therefore,
>>> you use the hypercall interface, just like Linux would typically do it
>>> for us. Finally, there's the hand over to Linux.
>>>
>>> But do we really need a separate loader? Can't we just place the
>>> loader-related stuff at, say, the end of jailhouse.bin?
>>>
>>> To be more concrete, i think it should be possible to have the full
>>> preloader-thing located under hypervisor/arch/arm64/. It should also be
>>> possible to link everything that is required into jailhouse.bin - so we
>>> would get one universal binary instead of a chain of dependent
>>> binaries. [1]
>>
>> Interesting idea.
>>
>>>
>>> Pro: You can make early use of the UART in your preloader without havin=
g
>>> the need to, for example, duplicate drivers. That's quite useful for
>>> debugging if something goes wrong very early. Secondly, you can also
>>> piggyback on existing gic routines, no need to reimplement
>>> phys_processor_id, =E2=80=A6
>>>
>>> The next thing after early boot would be the handover to jailhouse.
>>> Before the handover, we set a flag that indicates that we do an early
>>> boot of Jailhouse. We can use this flag to do the full partitioning of
>>> the system before we return to the guests in one single step. IOW, we
>>> never return to the preloader once the handover happened. We can do
>>> that, as u-boot already placed our guests and we just need to start the=
m
>>> (as we would start regular cells).
>>>
>>> The amount of additional logic in the actual hypervisor core should be
>>> reasonably low.
>>>
>>> Did you already consider that strategy? Jan, what do you think?
>>
>> As we are already in visionary phase... There is another use case to
>> consider:
>>
>> I'd like to have a Jailhouse variant that comes without a root cell.
>> That means, we will need a booting procedure that creates all cells,
>> loads and starts them - and then drops all the logic that could
>> configure or destroy them (or never includes it in the first place -
>> build-time setting). This should reduce the Jailhouse runtime code to
>> much less than 10K LoC.
>=20
> Ok, that's indeed an awesome idea.
>=20
>>
>> Peng's approach is useful in case you do want to keep the flexibility to
>> reconfigure the system from a root cell, just like you can do when
>=20
> To be honest, I consider the "dynamic" reconfigurability of Jailhouse as
> a development and testing utility rather than something that would ever
> be useful for operative usage. This includes, of course, jailhouse
> disabling.

Reconfiguration, yes, but reloading can be a topic in certain scenarios.=20
The current config locking mechanisms allows to keep this door for the=20
root cell open, even while there is a critical cell running.

>=20
> What would be great would be a single-shot 'jailhouse freeze' (or, ha,
> 'jailhouse detention') call, that throws away the whole hypercall
> interface. Having such a thing, we an drop everything that is somehow
> related to cell management: create, start, stop, destroy, stats,
> disable, enable, ...
>=20
> And that would in fact be no big deal: Annotate all affected routines,
> replace hyp vectors with stubs, drop the section, done. Every code that
> has no other users than from a hypercall can be dropped. Or do I miss
> something?

I haven't thought this through in details yet, but I would be surprised=20
if there weren't at least some smaller challenges in implementing that=20
cleanly. Still, it's mostly about disabling code.

>=20
>> booting via Linux. The idea of adding a preloader is minimal invasive to
>> the existing setup. My root-less mode will be maximal invasive, though.
>=20
> Why do you think that it would be maximal invasive?

As it changes the current hypervisor code for sure. Just loading=20
Jailhouse via a different thing than Linux does not bring many changes,=20
at least to the core. See this series.

>=20
> Oh btw: who would receive the freed memory? Would it remain in the
> hypervisor or be assigned back to a cell? Though that should probably
> only be a few pages.

What freed memory? When things are only created, nothing will be freed=20
anymore. There will also be no jailhouse disable.

>=20
>> If root-less would be sufficient for cases you do not want Linux-based
>> boot, we can skip this approach and head for root-less full steam.
>=20
> root-less means that the detention call (I like that) comes after cell
> creation, but before cell start. .oO(we can even drop the cell_start
> code, if we find a smart strategy to drop code right before vmreturn)
>=20

I would rather envision some alternative configuration that contains all=20
cell configs, not just the root cell (which would become a non-root cell=20
as well). Loading would have to happen into the target memory regions=20
before jailhouse enable, and the enabling would also imply starting all=20
cells.

>>
>> If there are use cases for all three variant, we can try to look for
>> common pieces in the two Linux-free options. My root-less mode would
>> also need a single-step "create and start all cells", e.g. And your idea
>> to include the bootstrap logic into an init section of jailhouse.bin is
>> also attractive for both.
>=20
> Yes, I see the overlaps. By the way... Why don't we actually do:
>=20
> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image
>=20
> for the bare metal case?

That comes close to what I have in mind, config-wise. sys.cell would=20
still need a counter of cells that follow (simple to add to struct=20
jailhouse_system).

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
jailhouse-dev/47babf84-565b-db76-7e42-47b0a2d5ed00%40siemens.com.
