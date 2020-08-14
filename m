Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL7E3L4QKGQE2DK4EAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15B244C50
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 17:48:00 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id z18sf1598243lji.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 08:48:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597420080; cv=pass;
        d=google.com; s=arc-20160816;
        b=BxLMClcn/0UxPNxgPjwYdvejK8WnJe5Ah6zKTGLpVmq0AuBANJiEuawCm0UyJaqY1M
         PJblF/yUqTnH8DHd7PBiVVnBIcYN723dPRR6hkzxS2/lE2e8DfedPd1amv8AiQS80znQ
         rzx26xDqgLAyQM2BQ5yFgKedLDyR4AoQ7eRwBfefbYx4HwVD6h2zNKG79WG6GDaxB0ly
         3ARSSzsi+8gJx7QF1h7JNov+qb6eno0LMJPIpbCq+JO3raE/dJNbefXCFV2ClgRKjG8s
         VrsJZnedRFdf8FHQJeS3haLBS2O7cLPplN0EQCQb482SzH3w/68f41f/xlmA0/DrEu1C
         Gaaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=7gmAF+VoAZiWO4qDxtqDjm/j01GZbWYO0dhCNz1KQf0=;
        b=thSTBJRpph1KPSEkug+wXUPOzGEjwx9Jdds4TyxndBvajWAXpM5A3xpzJT/lrHGQJG
         YOHblKPe06E2J2xJyG915H2bG/fZ5/9PczyMt6RqfoUIyI+I/Aq+Xz0PmAZg0lgTmReL
         L4f/JIxSX5tm2NcrsOYjp3203ZLcS8L1TVPHVA7mjCx4FS+ptwm5XcI4T8YZQjEGf1oX
         /VSF/fSdTxbINMFYq+BVI4L1erGm1D+fAhYZMYMH2sbbVOdnlZzv8uPKhvUX520brmzq
         3vfE3PdGVU4vBbKNkuE8wUvjb3z88S1z23uD5pqxr1xXwiJ8yjxARfVUc9mqEMPgMgq2
         gZFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7gmAF+VoAZiWO4qDxtqDjm/j01GZbWYO0dhCNz1KQf0=;
        b=bUGa33ZwfPmNl9KIbZHCO+K7Jl8SCDUG1nALpz63WuBF5EtyLtavTNT1eje7/Ny/nL
         0jLFwDIZokdVJkYk+cPDNc0Cx3j2MGUy3nsqfA0gRIpP79LeatKuFoeGyCozPnT7JPHZ
         y2W7XtWiQXgmdtPrcptlhck/hUxVbT6F+N27EC8uvMBuoFAMoC4GNiydEKkgAhRce/up
         6QryneV2DtK+tnQFUHcm+KEQAwwVdLksvNOpjObiPw5Xzlt6w3+wEm3VCW9yiR5xwiYF
         uBz5zxmh9CqyrJbmY8iKWXTOLXCFmMd12L37yZXsW6p2L554Cw+nGmGh+FV9Skk+AN4c
         XQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7gmAF+VoAZiWO4qDxtqDjm/j01GZbWYO0dhCNz1KQf0=;
        b=DImWU0srj5LkfFvYX8/WCo+wyayK2RzqfqSaPMxjUStYo41AM4c6Vw6jDMbHXCFZ7L
         NilJIKb22CNuy8Nj1J9iEqQ6vRlWMw9o4qLCe/oua02WQ2UtkpzTrRtBJu7DmfILQVSa
         HZ3b0mICrciuz1LHrBmu9MUVFsiIgymNR7qIJ6iglWWIDd7Rh4711RLmZsiEy2b3yNPc
         P8II768Vns114v7pCxbMovCoLSg22r8Zk5i/HrzdUQkb3szU5ZCGkQGJBrYRR3MkYyAm
         t8YBzjCi1P9kwDvfr4KKTDDzKOtZHTB+mIiZzGP//8ZXrLoEfun+f24KBSFqHIZRVlYz
         Iwgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304+hdruEwTuZkKwCOnpTVvt7IMvyQ9S09GRQQTmFXatFwEmqzp
	bpj040hQrxpG05PTyk4pQok=
X-Google-Smtp-Source: ABdhPJwpM/Vc5JfvmOL1KZpmJ8bChkpFKiO4ATaPnR6uD96HDBvBm/NXd6w+52JOA/oxcB7BIfauNw==
X-Received: by 2002:a2e:8648:: with SMTP id i8mr1703309ljj.288.1597420079831;
        Fri, 14 Aug 2020 08:47:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4d3:: with SMTP id r19ls117396ljm.3.gmail; Fri, 14 Aug
 2020 08:47:59 -0700 (PDT)
X-Received: by 2002:a2e:8612:: with SMTP id a18mr1606745lji.149.1597420079026;
        Fri, 14 Aug 2020 08:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597420079; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ8GlrwOaQDJ+VpWoDIwmalgwgSgpQ1CzUWVFgyu1xtxxMvoLFycnmzst0f+Y0PXIK
         ykase2LuOYMQriV7sPHilVNftZiWXGaCdVmL8RaZlQELLmIPaAQZ2Re+tuhC7NtsTxYu
         UyUcKwdq4ZTf0yFP/dNfF2IcqrA6tSBiZCYQTTYS+3UiIjSre3VFr/Mj+UU9n/XZZf9w
         cH7qSEg1vJBJHWEgeSy/oyqwKm2Dan+Od1iYRsqR1oSZXDkQ/wsZ5yQWYcnUeYkTG+T1
         KRYkBXCW6mbNWZg/Ao+i14Fffreh5oXbzgfp4md0qkVh33WWFTNixNvlGoUwRFAFZHxX
         0i4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DiuTbITL2fUgYeitR/UaLhOyQWOQMetIUND/KWFWtEQ=;
        b=G/VjgFrIiErp/+ZOaV5GQh7gUwG8WuuiUnGdelqjMysZub9xnOKR43OeIC+24r0zCo
         sp9qHiH4Ffba8abt8tRP+d6BZ/BzDRHokHanNiyryACuY+xnRY8AkmLedZpqbdQb8+Vo
         sweFO+TjUyJcuA8zD+IcXceMKctZwQasP+5cEi2pdce89xhiWQ5q/iAToaYIYKGAvSTH
         VNmjN0/WM07y6aeamvZRfd9a57Q4mgt3hjorHQeTzllvLeORl4bwDgFpH0y+9omoyB0U
         r6azc8JpR+I0D/waU5/mDKE5hmG0aUyUaczhrbLvYN0Sanv39goIR7uk182wo3nn7ryU
         AhiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v3si305533lji.6.2020.08.14.08.47.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 08:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07EFlwsD022278
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 17:47:58 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EFlvQs020974;
	Fri, 14 Aug 2020 17:47:57 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
Date: Fri, 14 Aug 2020 17:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 14.08.20 17:06, Ralf Ramsauer wrote:
> (+Cc Wolfgang, we recently had discussion on the boot process of Jailhous=
e)
>=20
> On 8/14/20 11:43 AM, Jan Kiszka wrote:
>> On 14.08.20 11:08, Peng Fan wrote:
>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>>
>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> Add libbaremetal for sharing code between inmates and jailhouse
>>>>> baremetal loader.
>>>>>
>>>>> The Makefile code is copied from inmates, currently only string.c is
>>>>> moved from inmates to libbaremetal. In future, we might need to share
>>>>> uart/mmu and etc.
>>>>
>>>> Might quickly become confusing to have two libs. What prevents renamin=
g
>>>> inmates/lib completely into libbaremetal? Sure, there are some jailhou=
se
>>>> specifics in inmates/lib, but those could likely be put in some corner=
.
>>>
>>> How about rename inmates to baremetal?
>>> And add bootloader stuff under baremetal?
>>
>> We could do
>>
>> baremetal
>=20
> What we provide is a minimalist runtime environment, which is not just
> limited to baremetal applications (depends on the definition of
> baremetal, though). But=E2=80=A6
>=20
>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
>> =E2=94=9C=E2=94=80=E2=94=80 lib
>> =E2=94=9C=E2=94=80=E2=94=80 tests
>> =E2=94=94=E2=94=80=E2=94=80 tools
>>
>> and put the jailhouse loader under tools. Inmates is a "brand" in
>> Jailhouse context, so it should remain in some form. But it's true, some
>=20
> =E2=80=A6 yep, the branding is the point why we should keep calling them =
'inmates'.
>=20
>> of the existing demo inmates can already run without jailhouse.
>=20
> And that's the second point - we already have some kind of support for
> this kind of use case. However, I agree that I wouldn't expect the
> preloader inside inmates/.
>=20
>>
>> Ralf, what do you think?
>=20
> Peng, I just read the code of the loader and I try to understand what
> how it's exactly working. Nice work! Do I see that correctly: You
> basically "imitate" Linux in a way that you manually do the early setup
> (some register setup, GIC init, kick off all CPUs, hv stubs, ...).
>=20
> IOW, you bring the system to the same state, where the Linux driver
> would hand over Jailhouse. You activate Jailhouse, we then return to the
> loader which got lifted to the first cell, the root cell. Now you use
> the loader to partition the system, i.e., to create cells. Therefore,
> you use the hypercall interface, just like Linux would typically do it
> for us. Finally, there's the hand over to Linux.
>=20
> But do we really need a separate loader? Can't we just place the
> loader-related stuff at, say, the end of jailhouse.bin?
>=20
> To be more concrete, i think it should be possible to have the full
> preloader-thing located under hypervisor/arch/arm64/. It should also be
> possible to link everything that is required into jailhouse.bin - so we
> would get one universal binary instead of a chain of dependent binaries. =
[1]

Interesting idea.

>=20
> Pro: You can make early use of the UART in your preloader without having
> the need to, for example, duplicate drivers. That's quite useful for
> debugging if something goes wrong very early. Secondly, you can also
> piggyback on existing gic routines, no need to reimplement
> phys_processor_id, =E2=80=A6
>=20
> The next thing after early boot would be the handover to jailhouse.
> Before the handover, we set a flag that indicates that we do an early
> boot of Jailhouse. We can use this flag to do the full partitioning of
> the system before we return to the guests in one single step. IOW, we
> never return to the preloader once the handover happened. We can do
> that, as u-boot already placed our guests and we just need to start them
> (as we would start regular cells).
>=20
> The amount of additional logic in the actual hypervisor core should be
> reasonably low.
>=20
> Did you already consider that strategy? Jan, what do you think?

As we are already in visionary phase... There is another use case to=20
consider:

I'd like to have a Jailhouse variant that comes without a root cell.=20
That means, we will need a booting procedure that creates all cells,=20
loads and starts them - and then drops all the logic that could=20
configure or destroy them (or never includes it in the first place -=20
build-time setting). This should reduce the Jailhouse runtime code to=20
much less than 10K LoC.

Peng's approach is useful in case you do want to keep the flexibility to=20
reconfigure the system from a root cell, just like you can do when=20
booting via Linux. The idea of adding a preloader is minimal invasive to=20
the existing setup. My root-less mode will be maximal invasive, though.=20
If root-less would be sufficient for cases you do not want Linux-based=20
boot, we can skip this approach and head for root-less full steam.

If there are use cases for all three variant, we can try to look for=20
common pieces in the two Linux-free options. My root-less mode would=20
also need a single-step "create and start all cells", e.g. And your idea=20
to include the bootstrap logic into an init section of jailhouse.bin is=20
also attractive for both.

Jan

>=20
> Thanks
>    Ralf
>=20
>>
>> Jan
>>
> [1] E.g., we could group early preloader bootup code to an own section
> that we drop once it's not needed any longer.
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5cd1415a-f4d0-b307-e81a-769b7be8eebb%40siemens.com.
