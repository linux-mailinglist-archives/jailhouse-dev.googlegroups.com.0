Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBD4J3P4QKGQEXS7TBVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4D244D4A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 19:06:24 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id h10sf2161190lfp.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 10:06:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597424783; cv=pass;
        d=google.com; s=arc-20160816;
        b=C8xJjLxVGG9wXAO4lHYiEoG1porZyX/McL3sPOgjkpxTFQ6Es7FFNvxK8+zyte85DK
         nvQ1zQlAni5gIYkoS99z2w+4w4aKT0nUR7mXMFm4NZp3ksdIdGzgZtkm5GOBgLVJYBft
         Aiy5lfWJaD+fadBdR3MJAsYfS6/bkslGp6MaJ2cDeyozcNnEs0VUxrcouo0psrbRCpux
         LsxUymGdHABYeRzZhknhALmrnB5JpJSZM9Sm1IgTWQsbr/dExgcjVZPZP7wgVgW0om8G
         KTPpOB+HZeJNN6z+7jALIQQIPkEEFQbRRHX3mZoyjsFMHJLNd7a9gD2qo/T7s6IHzvOg
         NJjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:from:references:cc:to:sender
         :dkim-signature;
        bh=fPqf0wK40zLjxhn8rfbS1+kku/HodwtFTvwY13IIL9U=;
        b=fkN5hJAaFFcxJO/S1ttlEXAPSBpFAOZEiEN0dx+Fnk7Sj2ESYePEj1NxKSOIjRi4r2
         MYvbgsURSaMwdBLvEVpuI+F9CiunCw6pGuAZtiZf/nBzkEMdvbcwXZjIPnQnKjt0pAeV
         zAEGERwUmUC3F654HrI356ZTPKjOMGPulx8gIPCo+lP8R8B6HsqM8l3c8+boOITb4ovS
         me5n+QoZTtvaHEtIHF1tMs4Iu2HTzEDqDcCUNEjzU7lJ12bNM5LN6mUKMTm/5Jtpdk0P
         Fd6A8mx4wCeG97AevJEQ0aX7Xz4fXKD1bB6T7g6k8VDbXi/1YLFjvLSe/Zed1aXE/zPj
         43gQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ntA6U1Go;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fPqf0wK40zLjxhn8rfbS1+kku/HodwtFTvwY13IIL9U=;
        b=UyRBFlv7TcTJwG3k1uAYc6NEnCPNShJeRx/K1PGQwVppukFvuU4sjN1addGCx9yPxG
         aqUQHAHjB726jLgEvoymNxFiCqXo5oeZfDay/7aq6KZqj3rZcGz0b3nEoASBM4jw1c44
         rQEtsPXtbBqZJcg7W7YBCrad1yYWkJvN8zs9H0mvnb9NIKRFqKSHpA5+kDn9mvMJxzB1
         YLt3LPdH0kZz2eHdGbvTQTB9WDla5FEPhrpDcEGpWXmXmommBsbfbFLKAPpRpmsmidJ5
         LRrO1aO/q9vOOLGNUNhZ01G9zX041V6mt5/SAbCBwIS26RDCj8vpXRyEN5iQ8ArJpBEf
         ejlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fPqf0wK40zLjxhn8rfbS1+kku/HodwtFTvwY13IIL9U=;
        b=p9J217/YNzJceQqRPPmoEQkbF+ZbmPO1PtuU19CUF8XaEn8bsHg5NFbhvsKIRHWSWj
         mrX75vM5aQXLvt+4KjS8YQdt7MXM+HcK+GRfxZ6D5bMnybrhQRlwqf8mP65I95f9GeMu
         Glk20thOogdw56T47QMONpJRN5Vb72dhtppg3iA8RadX0xg2AdyX3QEn0K4wjy3ODgzF
         dHCAh6DaDpjwnbB1a5PYCpuaX+OCsJDviVVHBzl6YViIUSbN6FmQun+dt4tlwFp53zBq
         R5GXpxjrRRmxpSpXQg7p+dKdEHOweIMVA05zL75BsQvB72D4i44OOTfe5tO+ZnO/Y3Tc
         Mnjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533W0mDMcUKcv8ZZXQ0yI4Mo4ZI+dzYrf7IMXrnPRWr7b/j4iqE5
	dLx/lWaZbRLvlCFe+DG+wOU=
X-Google-Smtp-Source: ABdhPJxiMhGDfyPsqp+HEwt6L6xjv9rblGpAwTvbqgrU16pUDn6MvcQSJW8jF7uguoSIlpgB8IWTCg==
X-Received: by 2002:a2e:9607:: with SMTP id v7mr1630020ljh.174.1597424783695;
        Fri, 14 Aug 2020 10:06:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b48:: with SMTP id o8ls159856ljj.11.gmail; Fri, 14 Aug
 2020 10:06:23 -0700 (PDT)
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr1824142lji.378.1597424782955;
        Fri, 14 Aug 2020 10:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597424782; cv=none;
        d=google.com; s=arc-20160816;
        b=b4VHhUQ1n5/XNZHHYnUsfNmxRi4VPbvZ5YgvjDx5EkZOXPv/ADGoFFKVWr3v908x/p
         HxvI3mYc3FyOHP/c6YWPYJmRVjxxV5UKM+09iBR1He1vwYgkPq+UFMLnj+9xG0rWJeOy
         QjnLE4dZEYTBo1OdoyH70UvbG5HJiNStDXwoTXmWJu4LK6S7Rh5WuSTLJrf5Bn/JRP3S
         NXDUWxWIPKBiw+GHNot028W60YGya6JyWKy25O2nQD4n/TXgb7sAX/3xabDjKNfkQDGj
         hOYXFc/yMCOV9ZbXE3kXC/qnuMrZ7yyb1T5Zb7CLc62nA1/9C48R+aVs7NrxafMvs8Ao
         5GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:references:cc:to
         :dkim-signature;
        bh=iPuI43jO57LCvHTqQdEY+JwDVUGh6Ov5OucWgrdyS+Y=;
        b=B5wCcNN5j4gh9A/1gETopDKYS/pzTGxQWdsxprx8ZetnODxfrM9FEk2YQREPOidQ+z
         Q8z8GyO28jtqDpghv4G1y4vMzOgKl/N85K9WCnk3JHA/rztGlswXVmbDgu9Su+Z/DO4y
         QM1WiAhDQi9gydbeFv81dqy6T2F6/EdgUk64VJWmse+hvUSbv1+IZk/cLJwS9ENuhpk3
         Rw4WrVbuL3k4h56PQNmCKRPSPs6i6TAH9fzOmEDWnkQzUb32Nu1gbogWicnga7QjrYKC
         prX8ofJJcyviHy58yU6x0Q8P4sV+PmAv3qUjVaQLdEIQ48Az7Q3rX0Ve6zs3EMwwdmXa
         Yryw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ntA6U1Go;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c27si564490ljn.3.2020.08.14.10.06.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 10:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BSqbK6SFlzxts;
	Fri, 14 Aug 2020 19:06:21 +0200 (CEST)
Received: from [IPv6:2a02:8388:7c3:300:4e34:88ff:fe05:eed9]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 14 Aug
 2020 19:06:21 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>
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
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH 06/10] Add libbaremetal
Message-ID: <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
Date: Fri, 14 Aug 2020 19:06:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=ntA6U1Go;
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



On 8/14/20 5:47 PM, Jan Kiszka wrote:
> On 14.08.20 17:06, Ralf Ramsauer wrote:
>> (+Cc Wolfgang, we recently had discussion on the boot process of
>> Jailhouse)
>>
>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>>> On 14.08.20 11:08, Peng Fan wrote:
>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>>
>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>>
>>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>>> baremetal loader.
>>>>>>
>>>>>> The Makefile code is copied from inmates, currently only string.c is
>>>>>> moved from inmates to libbaremetal. In future, we might need to shar=
e
>>>>>> uart/mmu and etc.
>>>>>
>>>>> Might quickly become confusing to have two libs. What prevents
>>>>> renaming
>>>>> inmates/lib completely into libbaremetal? Sure, there are some
>>>>> jailhouse
>>>>> specifics in inmates/lib, but those could likely be put in some
>>>>> corner.
>>>>
>>>> How about rename inmates to baremetal?
>>>> And add bootloader stuff under baremetal?
>>>
>>> We could do
>>>
>>> baremetal
>>
>> What we provide is a minimalist runtime environment, which is not just
>> limited to baremetal applications (depends on the definition of
>> baremetal, though). But=E2=80=A6
>>
>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>>> =E2=94=9C=E2=94=80=E2=94=80 lib
>>> =E2=94=9C=E2=94=80=E2=94=80 tests
>>> =E2=94=94=E2=94=80=E2=94=80 tools
>>>
>>> and put the jailhouse loader under tools. Inmates is a "brand" in
>>> Jailhouse context, so it should remain in some form. But it's true, som=
e
>>
>> =E2=80=A6 yep, the branding is the point why we should keep calling them
>> 'inmates'.
>>
>>> of the existing demo inmates can already run without jailhouse.
>>
>> And that's the second point - we already have some kind of support for
>> this kind of use case. However, I agree that I wouldn't expect the
>> preloader inside inmates/.
>>
>>>
>>> Ralf, what do you think?
>>
>> Peng, I just read the code of the loader and I try to understand what
>> how it's exactly working. Nice work! Do I see that correctly: You
>> basically "imitate" Linux in a way that you manually do the early setup
>> (some register setup, GIC init, kick off all CPUs, hv stubs, ...).
>>
>> IOW, you bring the system to the same state, where the Linux driver
>> would hand over Jailhouse. You activate Jailhouse, we then return to the
>> loader which got lifted to the first cell, the root cell. Now you use
>> the loader to partition the system, i.e., to create cells. Therefore,
>> you use the hypercall interface, just like Linux would typically do it
>> for us. Finally, there's the hand over to Linux.
>>
>> But do we really need a separate loader? Can't we just place the
>> loader-related stuff at, say, the end of jailhouse.bin?
>>
>> To be more concrete, i think it should be possible to have the full
>> preloader-thing located under hypervisor/arch/arm64/. It should also be
>> possible to link everything that is required into jailhouse.bin - so we
>> would get one universal binary instead of a chain of dependent
>> binaries. [1]
>=20
> Interesting idea.
>=20
>>
>> Pro: You can make early use of the UART in your preloader without having
>> the need to, for example, duplicate drivers. That's quite useful for
>> debugging if something goes wrong very early. Secondly, you can also
>> piggyback on existing gic routines, no need to reimplement
>> phys_processor_id, =E2=80=A6
>>
>> The next thing after early boot would be the handover to jailhouse.
>> Before the handover, we set a flag that indicates that we do an early
>> boot of Jailhouse. We can use this flag to do the full partitioning of
>> the system before we return to the guests in one single step. IOW, we
>> never return to the preloader once the handover happened. We can do
>> that, as u-boot already placed our guests and we just need to start them
>> (as we would start regular cells).
>>
>> The amount of additional logic in the actual hypervisor core should be
>> reasonably low.
>>
>> Did you already consider that strategy? Jan, what do you think?
>=20
> As we are already in visionary phase... There is another use case to
> consider:
>=20
> I'd like to have a Jailhouse variant that comes without a root cell.
> That means, we will need a booting procedure that creates all cells,
> loads and starts them - and then drops all the logic that could
> configure or destroy them (or never includes it in the first place -
> build-time setting). This should reduce the Jailhouse runtime code to
> much less than 10K LoC.

Ok, that's indeed an awesome idea.

>=20
> Peng's approach is useful in case you do want to keep the flexibility to
> reconfigure the system from a root cell, just like you can do when

To be honest, I consider the "dynamic" reconfigurability of Jailhouse as
a development and testing utility rather than something that would ever
be useful for operative usage. This includes, of course, jailhouse
disabling.

What would be great would be a single-shot 'jailhouse freeze' (or, ha,
'jailhouse detention') call, that throws away the whole hypercall
interface. Having such a thing, we an drop everything that is somehow
related to cell management: create, start, stop, destroy, stats,
disable, enable, ...

And that would in fact be no big deal: Annotate all affected routines,
replace hyp vectors with stubs, drop the section, done. Every code that
has no other users than from a hypercall can be dropped. Or do I miss
something?

> booting via Linux. The idea of adding a preloader is minimal invasive to
> the existing setup. My root-less mode will be maximal invasive, though.

Why do you think that it would be maximal invasive?

Oh btw: who would receive the freed memory? Would it remain in the
hypervisor or be assigned back to a cell? Though that should probably
only be a few pages.

> If root-less would be sufficient for cases you do not want Linux-based
> boot, we can skip this approach and head for root-less full steam.

root-less means that the detention call (I like that) comes after cell
creation, but before cell start. .oO(we can even drop the cell_start
code, if we find a smart strategy to drop code right before vmreturn)

>=20
> If there are use cases for all three variant, we can try to look for
> common pieces in the two Linux-free options. My root-less mode would
> also need a single-step "create and start all cells", e.g. And your idea
> to include the bootstrap logic into an init section of jailhouse.bin is
> also attractive for both.

Yes, I see the overlaps. By the way... Why don't we actually do:

$ cat jh.bin sys.cell c1.cell c2.cell > jh.image

for the bare metal case?

  Ralf


>=20
> Jan
>=20
>>
>> Thanks
>> =C2=A0=C2=A0 Ralf
>>
>>>
>>> Jan
>>>
>> [1] E.g., we could group early preloader bootup code to an own section
>> that we drop once it's not needed any longer.
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f81327a9-db37-be4d-4aa3-862b7d0416f3%40oth-regensburg.de.
