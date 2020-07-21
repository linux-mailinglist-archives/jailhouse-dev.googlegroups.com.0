Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAU23X4AKGQE2N4PFOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5F92289AA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 22:16:02 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id a18sf20441wrm.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 13:16:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595362562; cv=pass;
        d=google.com; s=arc-20160816;
        b=n7QGgcKVa233rVAKIbsOrhhXgahSX1zNLJhjFzMYlfZAvEP5F9DfAGvKjr9srmYp0Z
         L1OFulhgSsQbQ2M1DmDlZmGNtZHdwvqS+mtBREUsq89Jlt4akmpbBkNp48KsNHm7BElf
         nag7scQDcOnIDM7oNoy2HxAerOHH+gMdYIn/JcwUU13zXj6QXvwwgW7ABe1kCGeOsLy0
         goNRAOmEeZtaxbNOv6VVFL2j7s4tz2/mV9+zr78PGNQEOPKXNOw46/xufXlsqauM7uNl
         OZtKibraGfGvt3vpAXJfoQAloX1Qcf3Qe9gtB3JsZB8ASFGyWYRLbvbwMR52bnk7Dnkd
         xzzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=AC1jEtU3r+OmMX0O33neOcp+inzw/O9k67HZn72sQhQ=;
        b=EuUe3ovYoBjzLp4gOQJQLffkKsvCxwgM3Xb+I3TCqDy6MypXSqRlkF8/q6VGaDhF0r
         OCIinb2EMlEXCB5ivl1iY4c+yNDe+fepaRgNzsTb+FCsZ88FxNq7MlA7/LmCYJySdeX3
         ybrQknAa/awUFXuf4Yyje5GF5OqaN/eEKKR9QbRZpR2F0vX/rqkwrCDQ1Cf+uMop8Q8M
         JS2rJHE9ZmWGBu813dvjFaVtDkWHd/eZIBG8kLN6XSzUMCQphHV5X+jKsMqXOmyaKsj0
         V9BE/5X5K0QXYdKzn53ldPa5UBvNuwbu5EYyKQDMBKFCC2Zr6x5lUM3r+RNmM1FJOqah
         Ntwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AC1jEtU3r+OmMX0O33neOcp+inzw/O9k67HZn72sQhQ=;
        b=h5O2K5mFEKYohGzDsPCbsvUp35fdqf3zR5gTlOnNKJDNvqactBNEQgDAKNdaavcIx4
         emHklMzCmgp4FU8xk6IwX+4dFKrvCSNg9fMjBgw1ZPcB6yNohoC5Isft0rjEHVT1MIXs
         lqxZw/Xz7t0X8j0Qan4Ir2mE2cG1wRy8DpIuXKAmkjWdwspeQhMsf6K2ntDrjPutU8NA
         I30X1+Dj+stfRHdyPloMdDtFlqhgJnWDqGq0tQhB2XR/1Grry0wIhFI0S8zRgaQSYBe4
         LiOr1I3bb5BYeOR0b3FxpoBLcdC1JTfyT9EGFT46nIcq17sI0kJAnRpp6PC65YbgMvZ6
         FGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AC1jEtU3r+OmMX0O33neOcp+inzw/O9k67HZn72sQhQ=;
        b=GKqivXmMOLCaGryxervA9AoQxBFyDor+0IRzjlLxA3dBdcBxRx4aiZzHLwbr3oOCzz
         oVK7wMcgbgos+DjgwhSMv3Z5D2iVylDgPG5y02XoF5lyIATi/gn0bz50VKmBcXRCnF1E
         1PMOb51MIVry71F244XrzsKgkXkTMFzLKPkMPG+ZafsEQE/AcDYFTdXYnkHGWJY/B8p0
         bSPg6ZKua5XE+HNgSPN+U9fY7jv1kXpBx6XgGiNQ1L/yT9xYLkomhro/iTOxCYPIqctQ
         fv9PdmaiAYAy4IssCah+URMmOKcfyBT2zkIs62JV97iT1POQgBUL1No4I9zLmVcg9VVd
         OfJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532d+ru8B/T0WenuoJPW/ADNRRpaAftR4bYvcSRcbYZu5osqFdAh
	L2TQxjOyG+x5YPlUe8z8Fqs=
X-Google-Smtp-Source: ABdhPJwxG3xRrDVWXWZ2MAv+k1LUbMSWcAc4dzgu9oUEWz5jOxJpPUFnCE3bcYK6/pg4f0AASOuuZw==
X-Received: by 2002:a1c:283:: with SMTP id 125mr4362278wmc.12.1595362562158;
        Tue, 21 Jul 2020 13:16:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls19197wmf.3.canary-gmail; Tue,
 21 Jul 2020 13:16:01 -0700 (PDT)
X-Received: by 2002:a7b:c8c8:: with SMTP id f8mr5722391wml.142.1595362561444;
        Tue, 21 Jul 2020 13:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595362561; cv=none;
        d=google.com; s=arc-20160816;
        b=K6tEZs96x/CoxQtwQzBfae+nKbGDERM+2yQWzFbj4w/A+BTKFBjUFQ1LUKUbbM1zuf
         iny0/txMuibtp2e7w4IFZTgKjLlRzAIeOXQPpJchRvcbMHHWbyLD/zuh17TF2urgNcEn
         uiaAMclLx78H8PFk1hUI5IkoxymltNRoiOGLfNNZqRDftAgTHF0cT46G8CpA0AFTsCvw
         vQ98b/XxUTli6STmEw0Ayq7dL0rYgvZA8J93yH0DwA9wlFwgbABO+tQ9luVoMnDDf2Dm
         VlQGeO+R1kPKqKFbNJw8qcceXjKZhZiNv0d25haz24G1qUUOMaWgw3tMQAVQz5jgh7lb
         Xoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=ofzj8o+h2lya9j5+0M59A2Gf7tu5+1W4faygIxselbE=;
        b=E8R3LjhAy3QhYDo+UABQyphz2b9Za9/fwtwo6eOYNOOto4YhgCN2IMK9TAfRhK1xbn
         R4yYXe0Zzl5pHPtQLYtbjR0KxTHC7XbEAf+lsqYvvb75EhaQZLH7AM4XWtlgw6dnmOO7
         tfzPHiw1tGkiRiueApnOg/fqivimTLN//uj2SMHOkEimhSfHYUciQYjdXhnJJoHdXKtY
         rEkQifuSbd0+hglBKAEh+G3r+Lykv4G4smJmWBk9aFhujIwRw6TRZm+kV7OmtgBJs7jJ
         CKcbAsBkNDapQAgfKen0lYWIJ5rx+NzPQTqJnHsSM0IIrQfWdqmqx0d2Vo9NinrBlEqQ
         kQ6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y12si422099wrt.1.2020.07.21.13.16.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 13:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06LKG08O030788
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 22:16:00 +0200
Received: from [167.87.88.27] ([167.87.88.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06LKFvu7027892;
	Tue, 21 Jul 2020 22:15:57 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
Message-ID: <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
Date: Tue, 21 Jul 2020 22:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 20.07.20 23:29, Jan Kiszka wrote:
> On 20.07.20 18:26, 'Marco Solieri' via Jailhouse wrote:
>> On Wed, Jun 17, 2020 at 10:49:55AM +0200, Jan Kiszka wrote:
>>> On 15.06.20 10:11, Marco Solieri wrote:
>>>> On Wed, May 27, 2020 at 05:20:05PM +0200, Jan Kiszka wrote:
>>>>> On 26.05.20 15:24, Marco Solieri wrote:
>>>>>> On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
>>>>>>> On 22.04.20 10:51, Jan Kiszka wrote:
>>>>>>>> On 22.04.20 09:22, Marco Solieri wrote:
>>>>>>>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>>>>>>>>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>>>>>>>>> Predictability of memory access latency is severely
>>>>>>>>>>> menaced by the multi-core architectures where the
>>>>>>>>>>> last level of cache (LLC) is shared, jeopardizing
>>>>>>>>>>> applicability of many Arm platform in real-time
>>>>>>>>>>> critical and mixed-criticality scenarios. Support
>>>>>>>>>>> for cache coloring is introduced, a transparent
>>>>>>>>>>> software technique allowing partitioning the LLC to
>>>>>>>>>>> avoid mutual interference between inmates. [...]
>>>>>>>>>>
>>>>>>>>>> Thanks for updating this! I will refresh my caches on
>>>>>>>>>> the topic and provide feedback soon (I already have
>>>>>>>>>> some questions and remarks but I'd like to double-check them).
>>>>>>>>>
>>>>>>>>> Looking forward to hear from you.
>>>>>>>>>
>>>>>>>
>>>>>>> Done with the deeper review. Overall, the series looks fairly=20
>>>>>>> good. I see just two bigger open issues:
>>>>>>>
>>>>>>> - inmate loading interface - more architectural independence
>>>>>>>
>>>>>>> But I think those should be solvable.
>>>>>>
>>>>>> The major point you raise is that the impact on the hypervisor=20
>>>>>> code size should be minimised -- the inmate loading interface.=C2=A0=
 We=20
>>>>>> took a while to consider and weigh the
>>>>>> various alternative designs.
>>>>>>
>>>>>> First of all, let us consider the optimal solution in this sense. =
=20
>>>>>> That would be placing the whole colouring logic outside the=20
>>>>>> hypervisor, in the Linux driver, or in the userspace tools.=C2=A0 No=
=20
>>>>>> matter how implemented, this solution would require, sooner or=20
>>>>>> later, to pass to the hypervisor a list of memory regions, one per=
=20
>>>>>> each memory segment to be mapped. Now, such list would grow=20
>>>>>> unacceptably quickly, wasting a lot of memory to store it.=C2=A0 Tak=
e=20
>>>>>> for instance a Linux inmate, and suppose 128 MiB to be its memory=20
>>>>>> reservation requirement.=C2=A0 Now, assume that each consecutive=20
>>>>>> fragment is the shortest possible, i.e. page of 4 KiB.=C2=A0 This me=
ans=20
>>>>>> we need 32 Ki elements, each sizing 16 B, which is 512
>>>>>> KiB in total.
>>>>>>
>>>>>> This brings us to a design conclusion.=C2=A0 The mere colouring logi=
c=20
>>>>>> -- i.e. the algorithm which conceptually expands the colour=20
>>>>>> selection within a memory area into the lengthy list of=20
>>>>>> contiguously-mapped segment (next_col) -- must be placed together=20
>>>>>> with the mapping function (paging_create).
>>>>>>
>>>>>> We believe we can leave everything else outside the hypervisor=20
>>>>>> without much effort.=C2=A0 We can move in the driver: -
>>>>>> the cache probe function (get_llc_waysize) - the initialisation=20
>>>>>> routines (coloring_paging_init and coloring_cell_init).
>>>>>>
>>>>>> We believe this is the best compromise.
>>>>>>
>>>>>> In this case, a minor issue is also worth to be discussed. The=20
>>>>>> cell load function requires an IPA-contiguous mapping for
>>>>>> the memcpy to be efficient.=C2=A0 This in turn requires such mapping=
 to=20
>>>>>> be performed by the driver (we don't want to add an hypercall,=20
>>>>>> right? ;-)), thus including a second copy of the colouring logic=20
>>>>>> (next_col).=C2=A0 It would be nice, perhaps, to have a 'common' sect=
ion=20
>>>>>> where to place code shared
>>>>>> between hypervisor and the driver.
>>>>>
>>>>> Thanks for the explanations. My current feeling is that I need
>>>>> =C2=A0to look closer into the implementation so that I can argue
>>>>> here on eye level. Will try to schedule that soon and come back
>>>>> to you!
>>>>
>>>> Any news about it?=C2=A0 We have time available to follow up for the n=
ext=20
>>>> month or so.
>>>
>>> Not yet. Started to look into it but got distracted again. As it is
>>> more complex than I thought, I need to find some hours of continuous=20
>>> work on that. Should be doable before July, though.
>>
>> We are designing some extensions to the cache colouring feature,=20
>> namely the root-cell dynamic coloring and SMMU support.=C2=A0 Willing to=
=20
>> implement it in the next months, it would be quite valuable for us to
>> have some feedback and agreements about this initial series.
>>
>=20
> Sorry, I'm juggling tasks, and I had to drop and pick up this one=20
> multiple times:
>=20
> I've hacked up striped copying into cell memory into the driver, also
> factoring out a tiny helper (header) to calculate the virtual-to-colored=
=20
> offset into a region. Should be reusable for mapping as well. However,=20
> this work is not yet tested. Let me see what I can do tomorrow morning=20
> so that I can at least share this and you can possibly pick something up.
>=20
> Regarding dynamic coloring, I can only repeat what I stated before,
> multiple times: I'm extremely pessimistic that you can turn on or
> reconfigure an IOMMU while you may have transactions in flight that are
> affected by that change. How to collect the pieces when you do not know
> if a transaction finished and which address it hit, the one before or
> after the change? That is exactly the scenario when trying to move a
> root cell from uncolored to colored memory. IOW: You may implement this
> but you cannot make it robust.
>=20
> A more promising path is pre-linux Jailhouse boot, maybe even without
> root cells after that at all (needed anyway for shrinking the runtime
> code further).
>=20
> More important to me would be coloring of the runtime paths of the
> hypervisor. Here the question is if the simplistic approach taken e.g.
> by Xen to just assign a single color-set to the hypervisor, shared by
> all cells, is enough. Or do we rather want per-cell coloring of the
> hypervisor, using the color of the cell it is serving=3D The latter is
> more complex, I know, but definitely more partitioning friendly (read:
> deterministic). Before deciding which way to take, it would be good to
> have some numbers.
>=20
>>
>>> One feedback I can already provide: Any kind of runtime validation
>>> =C2=A0of the colored config like color_root_cell_management has to be=
=20
>>> moved into jailhouse-config-check.
>>
>> Good idea.=C2=A0 We will look into the script soon (hasn't it been
>> merged, yet, is it?).
>>
>=20
> It's in master. And that reminds me that I still need to review some=20
> related series...
>=20
> Jan
>=20

I've pushed wip/cache-coloring, consisting of your rebased patches plus=20
a hack commit that does not work as-is (maybe just the qemu configs,=20
maybe more) but hopefully gives an idea where I'd like to go for=20
Jailhouse: minimal runtime, most offline or in the driver.

On the hypervisor side, the challenge would now be to enhance existing=20
paging_create/destroy functions with optional coloring, using=20
jailhouse_get_colored_offs() if possible. Furthermore, all the arm64=20
bits should go - none of them is needed if the abstraction is right. A=20
convenience feature "automatic max_cache_colors detection" could go into=20
the driver.

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
jailhouse-dev/76259743-55bf-4d28-f344-1d829e040d00%40siemens.com.
