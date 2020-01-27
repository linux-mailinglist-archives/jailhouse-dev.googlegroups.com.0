Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBUH2XTYQKGQEYM26O7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D1114AAAF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 20:43:14 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id o14sf6727315otp.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 11:43:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580154193; cv=pass;
        d=google.com; s=arc-20160816;
        b=i21/aWYNWk/TVT49SoiZvj9xHDUYNjmHoe3jcpMWvL9tfJP7/xksIVCfeZhnzGvIvQ
         5klEzGw3ml73MfKzKgEGZnB2oFzHddqRwwmnThbT2q+hkIUuRtMY613vdQX8zArRW0/n
         9Ur57TiL1x7fpwLWyKB/4VL7bJSO7XG7p+5w8tIARej5PgurLYDgIOcakwQBpZUEj08U
         P4zIzF+76/ENwd/sFIV0C/3Pr46RtXmW3ET1FDWXZwJLRGLcnguWUD5D1vbvAyq3Sx/D
         ZIWk4HIv/pQ3BjrL5H0zn6lN1LWvy4zaZSm/n/YXtBtPQg3la+E9hmSZ6JjewGKOHLjr
         op+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=XvJnlxwO/WjxfTnbFH2tsse2NY8tR5HsiLAZ2NVKANk=;
        b=twcSNfpDn1K1iReYvv3XLkrjlL+j3Lf6wldRkXLJgJ1maw7FuXVnMlNTo5n24WMxm8
         jWAPBWDGwHwrlJVndgLsG/gxQh9xk4AANx2cAKc4CQGGagfMiquy4SH6I9OrXLLhnGLY
         rdypYiqkGuL1hJ/cG6C9qtAzXwLC3k8SiT63wK2/tcj2tc0A+T4xVrR3MZWNP09ACR8s
         I+V/pJSCiKZctg26ScHFtzDVKD3fkaFYMw2YGzRTXdQ4tMTnOYny9G6RS1IEcQjNWWyZ
         buCaIEVzpQUJdfp2gbt413chXhn4Oi1SJBzNrjSRcRD4hKXboEDTGuKMtXHUBjbIK49C
         MzWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hkl7kBHF;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=XvJnlxwO/WjxfTnbFH2tsse2NY8tR5HsiLAZ2NVKANk=;
        b=eL3OGVepzMHUq/b8zMzm90rgC6Yjs4omwo+3ZpdOq2ZYkk46j+y3slIONYQU6IoneT
         RetfG4HPbREUbGD1wFcxUhnRsMmO3TYZJqkfv7GwkBuCJ/wW1xiJyH/rJ7EYRPT+aynr
         6JcR2fitRjpfQ1XaneBr2gq0k+gU7qIEG4itSXNsRJJE77Jd080K+UnqrGYXyxkJ4Bwu
         lywknk7bV1qyyf4BIovtH/Ug8rcVxA20cBgFAd7wMLvTGflDvdkWFztJgHY8+kGZZBhh
         0jO+0evnkMrpvehdHlkFNQ4ZX1DaxeoMinWHXPtuHszbF2o74P7ofmJS2rwsXnz8FHCJ
         jz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XvJnlxwO/WjxfTnbFH2tsse2NY8tR5HsiLAZ2NVKANk=;
        b=sfCj4BimKT4pqqIN/H3FIth28nuB7wHBa6+wW49hZ7z1e8/jMgNPgoEE3EOahANrAY
         B9UWgRfV5dvBSE2iZJwoVQ94OEO2dXzzhakDG8M8EWmNHw4+SP6lAmE0L0++6YBMd5n1
         jmwOueejeHVjZ95xJbVL/0zRyppTOG0B6JKUHGBF1IhdYvRY393bbKEEjlQduqB/gfzg
         BhU1+muFBCxgxIWA3xPS0U2flDyihnkEZ2pZVnYBsCX4YCmQ2+t4sNuUTyG2tc2mUZm3
         agtBlfqRMLJERzJGvxTCo43aAHuLUkkxugRdjXEYUlC/Cls8+PTu0UcE8mRRaZWcOhx2
         dvQg==
X-Gm-Message-State: APjAAAXHBJ42UVCmMmcKQmwfxmEvoqyKpVe23P+QZJO9MwLpLogGNQnA
	PxdR8aSRmla0Gfc4n2jo2TQ=
X-Google-Smtp-Source: APXvYqxHjBq2WDPya5I2hjIxblDqhx//rx1AE2iH0tTJosMfvvVE0/ShVEc0e19+dnJ/yJ+ER8vKSw==
X-Received: by 2002:aca:1a17:: with SMTP id a23mr468453oia.84.1580154193287;
        Mon, 27 Jan 2020 11:43:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d549:: with SMTP id m70ls1598813oig.10.gmail; Mon, 27
 Jan 2020 11:43:12 -0800 (PST)
X-Received: by 2002:aca:b943:: with SMTP id j64mr453976oif.155.1580154192627;
        Mon, 27 Jan 2020 11:43:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580154192; cv=none;
        d=google.com; s=arc-20160816;
        b=wcNiD7mqT4NPkvzZL6Ubdn+PhRhQIIeDH+AuQ+nbmjl3ialKgQQW5u+BdAmJFplave
         GMcjbBhSt95gyMj0k0MkuK1VnaUzEsA1MOGieugMkYJ64S+3UNdjlPzYSRvswj41Cuxr
         h4g9kbgtu6OhRSihKpuri6FQ3nsYHDPwRLPjjXUmXJQwZsO4IAp/o4G/AGJ2ZRm0yRoz
         ye92lFMd7TrOFVD44ndDFpkmKkE0blFjTkgeZkzxN9pO0Y/osWr7SBQGNPc3Po2Jc+vx
         5TKIqvxTyP9pmCt7g9ZOA7VC4dq09kuVc31Y9tbwbsOYSA2joJ7jCtbzWrwM18RhCqMq
         dCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qDRNEFhKpvpyCqbhNlx+j7+XWk28dKa/5pP+q1PTplo=;
        b=hmpAex4hmP+Bk9BZWsKqQ3sDWed9rzPHzOdnzzKrUONonEnOUCttxZJJPG0rqfs+Le
         BnbZZ7F9x6mtbcHmnoM+AbSmrsGBnqCWBPKFEa+6oTcSY6zk6EO4y6gvnCVNbEooMw9r
         FMO+L5LSUS3UPCdmRH1R2juUyOOv7KzVSdt4Qk7IV04qI6ugU+x4Ue599ByF9jrZ3Km2
         zmAOmTSSeY8mlblY3W7638DePkbkFd0s1RIM65cw0WioamPVR1Yt6+MUdTamFdL8P6uc
         mooySYa7XVU11t55a/JqK7iKLYhwKAxWne0zsr++zjNgHM87HSylYPbhFPZpDmdotyxa
         9tfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hkl7kBHF;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id j26si315412oie.0.2020.01.27.11.43.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 11:43:12 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RJhCAI109998;
	Mon, 27 Jan 2020 13:43:12 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RJhCsR037716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 13:43:12 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 13:43:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 13:43:11 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RJh955075030;
	Mon, 27 Jan 2020 13:43:10 -0600
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
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <0edd40f6-b214-f2ed-93e5-d7866b552088@ti.com>
Date: Tue, 28 Jan 2020 01:11:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7222df54-40c7-6958-570e-9eb50365e905@web.de>
Content-Type: multipart/alternative;
	boundary="------------7CD7CAA24179DF3CD403B2CA"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=hkl7kBHF;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

--------------7CD7CAA24179DF3CD403B2CA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 27/01/20 10:03 pm, Jan Kiszka wrote:
> On 27.01.20 17:13, Nikhil Devshatwar wrote:
>>
>>
>> On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
>>> On 27/01/2020 15:49, Jan Kiszka wrote:
>>>> On 27.01.20 14:56, nikhil.nd via Jailhouse wrote:
>>>>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>>>>
>>>>> This series adds support for partitioning registers across different
>>>>> cells
>>>>> in the Jailhouse. Jailhouse supports partitioning memory regions;
>>>>> where it uses
>>>>> MMU mapping for page aligned regions and subpage handler for non
>>>>> aligned regions.
>>>>>
>>>>> However, most of the embedded platforms will have common set of
>>>>> registers which
>>>>> need to be partitioned at the granularity of single register. One=20
>>>>> such
>>>>> example is
>>>>> the pinmux registers avaialble in many platforms including K3 J721e.
>>>>>
>>>>> This series implements a regmap unit which allows to describe the
>>>>> ownerhip of the
>>>>> registers using a simple bitmap. This scales well when you have to
>>>>> partition
>>>>> hundreds of control module or pinmux registers.
>>>>>
>>>>> Nikhil Devshatwar (4):
>>>>> =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB mem_region=
s
>>>>> =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for partiti=
oning registers
>>>>> =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioning regis=
ters
>>>>> =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONFIG regis=
ters
>>>>>
>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 41 +++-
>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
>>>>> =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
>>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=A0 |=C2=
=A0 47 +++++
>>>>> =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 258=20
>>>>> ++++++++++++++++++++++++
>>>>> =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
>>>>> =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
>>>>> =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>>>>> =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(-)
>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/include/jailhouse/regmap.h
>>>>> =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
>>>>>
>>>> Worthwhile to discuss, indeed. The key question for me is how well it
>>>> could map on other SoCs. Ralf, do you think it could be that simple,
>>>> based on your experiments? Or could we also face scenarios where we
>>> The question is what you try to achieve:
>>>
>>> Jan, when you introduced subpaging, the goal was to allow to assign
>>> devices to different domains, if multiple devices are located on the
>>> same page. We can observe that pattern on many platforms, and subpaging
>>> provides a "generic" solution.
>>>
>>> So what do you try to achieve with subpaging on a byte-wise/bit-wise
>>> granularity? Make a non-partitionable device partitionable? That will
>>> only work for some rare cases.
>> The main intention here was not to partition peripheral devices, but
>> just the registers
>> which are not really related to any device.
>>
>> Most SoCs will have something like this where pinmux registers,
>> efuse registers, internal muxes, MAC addresses, and other config options
>> are provided.
>
> Can you point out another SoC that we support which would benefit from
> this description method?
>

e.g. We support jetson-tk1 which uses Nvidia tegra124. It can benefit=20
from this.
There are lots of pinctrl nodes in the mainline Linux kernel device=20
tree[0] and [1]

Currently, the pinmux configuration is described in root cell device=20
tree [2] but not available in inmate device tree [3]

[0] -=20
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124.d=
tsi#L334
[1] -=20
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-j=
etson-tk1.dts#L83
[2] -=20
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-j=
etson-tk1.dts#L1035
[3] -=20
https://github.com/siemens/jailhouse/blob/master/configs/arm/dts/inmate-jet=
son-tk1.dts

With this regmap framwork, it is possible to define the pinmux node such=20
that
inmate Linux kernel can configure the pinmux when running in Jailhouse cell=
.

>>
>> This series was intended to solve these kind of register partitioning.
>
> So, subpaging does not scale when we have a scattered access map, right?
Yes
> But can we use this description method to replace subpaging? The latter
> registers an contiguous mmio dispatch region, your approach additionally
> checks within that region a bitmap. A subpage entry can handle up to
> PAGE_SIZE-1, a regmap currently only 256 bytes.
regmap implentation can be changed to support 4k pages as well.
That way, a bitmap can be generated to pass to regmap. But there is=20
additional overhead of checking the offset.
But yes, regmap can replace subpage, however, this change should be=20
transparant without having to change the jailhouse_memory descriptions.

> I wonder if we can
> combine both, maybe expand the memory region to optionally refer to a
> bitmap for finer-grained access control.
Yes, that is also a good option, This will increas the size of cell=20
config though.

Regards,
Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0edd40f6-b214-f2ed-93e5-d7866b552088%40ti.com.

--------------7CD7CAA24179DF3CD403B2CA
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
    <div class=3D"moz-cite-prefix">On 27/01/20 10:03 pm, Jan Kiszka wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:7222df54-40c7-6958-570e-9eb50365e905@web.de">On 27.01.20
      17:13, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 27/01/20 9:30 pm, Ralf Ramsauer wrote:
        <br>
        <blockquote type=3D"cite">On 27/01/2020 15:49, Jan Kiszka wrote:
          <br>
          <blockquote type=3D"cite">On 27.01.20 14:56, nikhil.nd via
            Jailhouse wrote:
            <br>
            <blockquote type=3D"cite">From: Nikhil
              Devshatwar<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:n=
ikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
              <br>
              <br>
              This series adds support for partitioning registers across
              different
              <br>
              cells
              <br>
              in the Jailhouse. Jailhouse supports partitioning memory
              regions;
              <br>
              where it uses
              <br>
              MMU mapping for page aligned regions and subpage handler
              for non
              <br>
              aligned regions.
              <br>
              <br>
              However, most of the embedded platforms will have common
              set of
              <br>
              registers which
              <br>
              need to be partitioned at the granularity of single
              register. One such
              <br>
              example is
              <br>
              the pinmux registers avaialble in many platforms including
              K3 J721e.
              <br>
              <br>
              This series implements a regmap unit which allows to
              describe the
              <br>
              ownerhip of the
              <br>
              registers using a simple bitmap. This scales well when you
              have to
              <br>
              partition
              <br>
              hundreds of control module or pinmux registers.
              <br>
              <br>
              Nikhil Devshatwar (4):
              <br>
              =C2=A0=C2=A0=C2=A0 configs: arm64: k3-j721e-linux: Add USB me=
m_regions
              <br>
              =C2=A0=C2=A0=C2=A0 core: Introduce regmaps in cell config for
              partitioning registers
              <br>
              =C2=A0=C2=A0=C2=A0 core: Implement regmap unit for partitioni=
ng registers
              <br>
              =C2=A0=C2=A0=C2=A0 configs: k3-j721e: Add regmaps for PADCONF=
IG registers
              <br>
              <br>
              =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-linux-demo.c |=C2=A0 =
41 +++-
              <br>
              =C2=A0=C2=A0 configs/arm64/k3-j721e-evm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++
              <br>
              =C2=A0=C2=A0 hypervisor/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
              <br>
              =C2=A0=C2=A0 hypervisor/include/jailhouse/cell.h=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
              <br>
              =C2=A0=C2=A0 hypervisor/include/jailhouse/regmap.h=C2=A0=C2=
=A0 |=C2=A0 47 +++++
              <br>
              =C2=A0=C2=A0 hypervisor/regmap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 258
              ++++++++++++++++++++++++
              <br>
              =C2=A0=C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +-
              <br>
              =C2=A0=C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +=
-
              <br>
              =C2=A0=C2=A0 tools/jailhouse-hardware-check=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
              <br>
              =C2=A0=C2=A0 9 files changed, 387 insertions(+), 7 deletions(=
-)
              <br>
              =C2=A0=C2=A0 create mode 100644
              hypervisor/include/jailhouse/regmap.h
              <br>
              =C2=A0=C2=A0 create mode 100644 hypervisor/regmap.c
              <br>
              <br>
            </blockquote>
            Worthwhile to discuss, indeed. The key question for me is
            how well it
            <br>
            could map on other SoCs. Ralf, do you think it could be that
            simple,
            <br>
            based on your experiments? Or could we also face scenarios
            where we
            <br>
          </blockquote>
          The question is what you try to achieve:
          <br>
          <br>
          Jan, when you introduced subpaging, the goal was to allow to
          assign
          <br>
          devices to different domains, if multiple devices are located
          on the
          <br>
          same page. We can observe that pattern on many platforms, and
          subpaging
          <br>
          provides a "generic" solution.
          <br>
          <br>
          So what do you try to achieve with subpaging on a
          byte-wise/bit-wise
          <br>
          granularity? Make a non-partitionable device partitionable?
          That will
          <br>
          only work for some rare cases.
          <br>
        </blockquote>
        The main intention here was not to partition peripheral devices,
        but
        <br>
        just the registers
        <br>
        which are not really related to any device.
        <br>
        <br>
        Most SoCs will have something like this where pinmux registers,
        <br>
        efuse registers, internal muxes, MAC addresses, and other config
        options
        <br>
        are provided.
        <br>
      </blockquote>
      <br>
      Can you point out another SoC that we support which would benefit
      from
      <br>
      this description method?
      <br>
      <br>
    </blockquote>
    <br>
    e.g. We support jetson-tk1 which uses Nvidia tegra124. It can
    benefit from this.<br>
    There are lots of pinctrl nodes in the mainline Linux kernel device
    tree[0] and [1]<br>
    <br>
    Currently, the pinmux configuration is described in root cell device
    tree [2] but not available in inmate device tree [3]<br>
    <br>
    [0] -
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124.dtsi#L334">https://elixir.bootlin=
.com/linux/latest/source/arch/arm/boot/dts/tegra124.dtsi#L334</a><br>
    [1] -
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts#L83">https://elixi=
r.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts=
#L83</a><br>
    [2] -
<a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/linux=
/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.dts#L1035">https://eli=
xir.bootlin.com/linux/latest/source/arch/arm/boot/dts/tegra124-jetson-tk1.d=
ts#L1035</a><br>
    [3] -
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/siemens/jailh=
ouse/blob/master/configs/arm/dts/inmate-jetson-tk1.dts">https://github.com/=
siemens/jailhouse/blob/master/configs/arm/dts/inmate-jetson-tk1.dts</a><br>
    <br>
    With this regmap framwork, it is possible to define the pinmux node
    such that<br>
    inmate Linux kernel can configure the pinmux when running in
    Jailhouse cell.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:7222df54-40c7-6958-570e-9eb50365e905@web.de">
      <blockquote type=3D"cite">
        <br>
        This series was intended to solve these kind of register
        partitioning.
        <br>
      </blockquote>
      <br>
      So, subpaging does not scale when we have a scattered access map,
      right?
      <br>
    </blockquote>
    Yes<br>
    <blockquote type=3D"cite"
      cite=3D"mid:7222df54-40c7-6958-570e-9eb50365e905@web.de">But can we
      use this description method to replace subpaging? The latter
      <br>
      registers an contiguous mmio dispatch region, your approach
      additionally
      <br>
      checks within that region a bitmap. A subpage entry can handle up
      to
      <br>
      PAGE_SIZE-1, a regmap currently only 256 bytes.</blockquote>
    regmap implentation can be changed to support 4k pages as well.<br>
    That way, a bitmap can be generated to pass to regmap. But there is
    additional overhead of checking the offset.<br>
    But yes, regmap can replace subpage, however, this change should be
    transparant without having to change the jailhouse_memory
    descriptions.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:7222df54-40c7-6958-570e-9eb50365e905@web.de"> I wonder
      if we can
      <br>
      combine both, maybe expand the memory region to optionally refer
      to a
      <br>
      bitmap for finer-grained access control.
      <br>
    </blockquote>
    Yes, that is also a good option, This will increas the size of cell
    config though.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
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
om/d/msgid/jailhouse-dev/0edd40f6-b214-f2ed-93e5-d7866b552088%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/0edd40f6-b214-f2ed-93e5-d7866b552088%40ti.com</a>.<br />

--------------7CD7CAA24179DF3CD403B2CA--
