Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWUS6LUAKGQEZUC3SFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B715E260
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 12:54:18 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id l26sf1421241eda.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 03:54:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562151258; cv=pass;
        d=google.com; s=arc-20160816;
        b=OkHTNGkHlRF1ywajYhzi0DpU/zXqKGloXas9oFPvVuW/fl1RJLHzIcC6PhXnevjmvD
         bYHHARDd+OCDp8TDqJoz4sYGYcUP1+aB1gPqsaYkzhR8ngcL5T8vOx5mKYl2s3xbfGab
         nr7Jbzm5p902yD11ksy0QIdCnggfAOWEDpiCLz9gARwszZDHs+JXppAf/0jIQSx1CewT
         7EAC+o2oDsAfk1NAPi8drGkfuw0/Qdy33w7NTLjy1iZFeynnFv0F0q12JhU4AqMuuhpC
         ji035BJSi+4AJ28gAYkDqHcNNjw5o3O/JqSm+3ehuhaqre3X+cf/KPzapsenoE4x77Gd
         412A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=2sedQJdRAfc3RIi5UVshXgHB1+f1KBArqowYPY9QXCk=;
        b=rvhEzWYHISa2TOtH9BOeBLjcdyXGSM73gUndG26o+1B4UEjeUDHN98JFijjxCPkiyn
         +3o7RxE9wKiauNoAFNxVXGW9DFJeiKyz9IxpOVg1K2Bih92qJ//dVAGyNPtjk/I14Pxz
         RrZ0MxzT7D43kSq8UbEtPOBaFhA1Rl9rLlRoXVM8A8j9rNyoYumvYyBDCb0KrWmvJNgT
         zDutuZoPEIBL77aIoHRODghqtdNf/Y6r8l6O8WxaMXJXch81lvQMgOPGXqc1KPStE9Od
         2lJaMJLbmSPqCXUaBio9RrtSO+qvoYlcNw44NeM3WXVpzVdbvbfEDNymwRbcNx5Z2YY9
         h/GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2sedQJdRAfc3RIi5UVshXgHB1+f1KBArqowYPY9QXCk=;
        b=mHhxkjGDc+4CkBdLrfn5NYpAwbZzsalC8O7dFOXGJ91vzcKzQxborlQrB4BzuzPrVR
         AIfOCboz0aKVOEgwKcZ9xQwKKHbIuo7q3iCcEskRjTlAQgejxOTGeQDExcLvYmVBCoAX
         +klDcZ5eygfjuZxAc3unEzv9X/nRxu/Ir0ylAv1RZklXa+LWFYXZlKi8EiWxK8tYVoML
         HWdEEvomxMjaJ+NXaK8LLQIKPeog8PPmAHqcuNW3otsSr2xzwIr2l/ncca4xeoDsp4uU
         w8Yoq0HQ+0bkZYb7FwbJFJlMceyp1chlO6CLWHpiyFDP0STDbqxVV1nBY3CHRaIRMbxX
         oq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2sedQJdRAfc3RIi5UVshXgHB1+f1KBArqowYPY9QXCk=;
        b=kRH/w1srs9SBCq7dG4lnx0dIJGThZnUeAsU3cYhsjd7RnP27GoFZy7i2Q+e6TzW0wz
         /l5fztaDEZEsXctJEODtBX5mUbyp8Rtz2u8tuZVXkw31Pgnp9zQjx0Z2CZ7Z+o9fmH/L
         kYLTPGBA8+u/3xR49BWUVvYN9Dp9U4x9qOojBcFBqC++NNcRHUktZlhOqIgHbJhZjwqC
         VAZ8Kw8WVMYrt5yEoY2hzdVQ415IpXLWcTBQigURN91NDcKI6oNf32s/VSMgO5/0K5ZF
         PJjPHaFLXihadOOanS5kZVRFMlv0AcqyNCGLAWghqmkSOeNyQoApCfBnGehBELJ5a4M0
         L16g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCFxBZnc/5vIDEdVvd9EVtzcduzKTtTxXloGeiAf2KuFGxWEk3
	Td3+FPD7TSvyAA0g95c7Bns=
X-Google-Smtp-Source: APXvYqwdafOfv7W4asfnjs32V5LpzCro1rUsNghfpsKL4kl9ESJIFB7CDG+rHrPR/zoeo9q2VpSaRg==
X-Received: by 2002:a17:906:d6a:: with SMTP id s10mr33012822ejh.180.1562151258264;
        Wed, 03 Jul 2019 03:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls611222edx.9.gmail; Wed, 03 Jul
 2019 03:54:17 -0700 (PDT)
X-Received: by 2002:a05:6402:1658:: with SMTP id s24mr42174913edx.288.1562151257698;
        Wed, 03 Jul 2019 03:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562151257; cv=none;
        d=google.com; s=arc-20160816;
        b=tmyODXJZHSFVKV4UL0HqbnEfhy7zIbb6T/PL6g4bI10BZu5eDZGNUAM6xlbxPiUHD7
         MiQqPg1p2ehIllpmlVUx5wweAGy/A7bMVGls6GvYkVrc7muZPvAF7MuFG7hW6wGq54T7
         bMMnC+jowpw9g8b9LhyjQzMEVeM6y2VvXx5syed9zGE1L1Gmkwofxc9lNJZu52WXJMhu
         S2nXY1z5zHupwqzIiPQWFmJsyDm657hM3SULG0l8OF2mRgkmESB68D65yvCJ268TBo9/
         hotzFUNPDg7WizLK4gVD/Lp4payoID7ns0aKFpcqNfDxMVpK4mdMsHq9O88MBfMi4Rih
         nibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=e7UkjHvU0Zzy4F6BfexnqORpb0Lh7mFAoEt9D9omlJA=;
        b=wH0uSxBqAToFDVaZfmNBKjNxKTIfTMoI5BVrPPF8dIEZb1ZyUjILMHbG8lP3J3XXrI
         bvSvAJ4gDASCLmeO5kK9roNbrHlo4STnK/9GFwsQRcNZ8l3IDV+DmASglwyqO37xBplS
         1Hw09Af+PBj2760czT7P1BEi48VP7TkBAjRVpkdkpWV8cCllnj74ZYFyFLFvUbLcSqeM
         abq/8Htle/qy0tF2Rg1glZ2QpxWzwFECWbKXfEcCxmS3a/WlodCb0XQRRffQ4Ke4ELCn
         O8ArG6FjcaG5tN2plz4HoD26c3O6QapJu7m53XDcIcofWsdJ8YSNAcU017OPZJe/2JF+
         AbdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h23si141340edb.2.2019.07.03.03.54.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 03:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x63AsHKs021079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 12:54:17 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63AsGmh007405;
	Wed, 3 Jul 2019 12:54:16 +0200
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
 <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
 <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
 <17e77e2c-5f37-4532-858d-04fab20d9ece@siemens.com>
 <a01e9cb2-5c14-5451-156e-faf80bee74e7@ti.com>
 <45656e34-8ff5-80fd-8896-971441c61af2@siemens.com>
 <75ccac5a-5faf-c770-4759-1ea2cc8a47db@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d52e45be-a5cc-87df-fa21-54e364e4aeab@siemens.com>
Date: Wed, 3 Jul 2019 12:54:15 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <75ccac5a-5faf-c770-4759-1ea2cc8a47db@ti.com>
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

On 03.07.19 12:33, Pratyush Yadav wrote:
>=20
>=20
> On 03/07/19 3:26 PM, Jan Kiszka wrote:
>> On 03.07.19 11:16, Pratyush Yadav wrote:
>>>
>>>
>>> On 02/07/19 8:58 PM, Jan Kiszka wrote:
>>>> On 02.07.19 16:57, Pratyush Yadav wrote:
>>>>>
>>>>>
>>>>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>>>> A System Memory Management Unit(SMMU) performs a task analogous to =
a
>>>>>>> CPU's MMU, translating addresses for device requests from system I/=
O
>>>>>>> devices before the requests are passed into the system interconnect=
.
>>>>>>>
>>>>>>> Implement a driver for SMMU v3 that maps and unmaps memory for spec=
ified
>>>>>>> stream ids.
>>>>>>>
>>>>>>> An emulated SMMU is presented to inmates by trapping access to the =
MMIO
>>>>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMM=
U memory
>>>>>>> mapped registers are trapped and then routed to the emulated SMMU. =
This
>>>>>>> is not emulation in the sense that we fully emulate the device top =
to
>>>>>>> bottom. The emulation is used to provide an interface to the SMMU t=
hat
>>>>>>> the hypervisor can control to make sure the inmates are not doing
>>>>>>> anything they should not. The actual translations are done by hardw=
are.
>>>>>>>
>>>>>>> Emulation is needed because both stage 1 and stage 2 parameters are
>>>>>>> configured in a single data structure, the stream table entry. For =
this
>>>>>>> reason, the inmates can't be allowed to directly control the stream
>>>>>>> table entries, and by extension, the stream table.
>>>>>>>
>>>>>>> The guest cells are assigned stream IDs in their configs and only t=
hose
>>>>>>> assigned stream IDs can be used by the cells. There is no checking =
in
>>>>>>> place to make sure two cells do not use the same stream IDs. This m=
ust
>>>>>>> be taken care of when creating the cell configs.
>>>>>>>
>>>>>>> This driver is implemented based on the following assumptions:
>>>>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 architecture.
>>>>>>> - SMMU supporting only AARCH64 mode.
>>>>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible w=
ith
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation t=
ables of CPU for SMMU.
>>>>>>>
>>>>>>> Work left to do:
>>>>>>> - Route event notifications to the correct cell and identify which =
event
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>>>>> - Add support for IRQ and MSI routing.
>>>>>>> - Add support for PRI queues and ATS.
>>>>>>> - Identify which cell caused a command queue error and notify it.
>>>>>>> - Support sub-streams.
>>>>>>>
>>>>>>> A lot of the work left is optional features that the SMMU provides =
like
>>>>>>> substreams, ATS, PRI. There is little reason to add them unless the=
re is
>>>>>>> a use case for them.
>>>>>>
>>>>>> One quick question again, I already had it for the RFC round: Would =
it be tricky to split up this patch into single-stage only + 2-stage suppor=
t? That would allow me to asses the additional complexity we import by addi=
ng 2-stage support. Or is 2-stage support inherently coupled with the SMMU =
design so that such a split-up would neither make sense nor buy us anything=
?
>>>>>
>>>>> I considered splitting, but as far as I see, stage 1 and 2 are rather=
 tightly coupled. If you want, I can split it into two parts where part 1 i=
s the defines, data structure declarations, and initialization. Part 2 will=
 have stage 1 emulation and stage 2.
>>>>
>>>> If part 1 will get away without emulating/intercepting bits of the SMM=
U, I bet it will be a win.
>>>
>>> It will.
>>>
>>>>>
>>>>> Let me know if you'd prefer that, and I'll send the series tomorrow. =
It's getting late and I'm about to leave for today.
>>>>
>>>> Sure, no hurry!
>>>>
>>>>>
>>>>>> Background is that the majority of use case I see will not need more=
 than one stage. I particular, you have no need for 2-stage support in simp=
le bare-metal or RTOS cells, leaving this only potentially relevant for the=
 root cell (or secondary Linux cells). If the feature is complex and can be=
 disabled, we could skip it, reducing the code size.
>>>>>
>>>>> Hm, as far as I understand, stage 2 should be always needed because y=
ou need to translate from IPA to PA every time. Stage 1 could be optional i=
f the guest OS handles the scattering or gathering of the buffers. But don'=
t you always need to translate from IPA to PA (even though in case of Jailh=
ouse those translations are almost 1:1, and IPA =3D=3D PA)? When would you =
not need stage 2?
>>>>>
>>>>> Anyway, most of the code is setting up the SMMU and the data structur=
es, and stage 1 emulation. Stage 2 only part is very small. Removing it won=
't save you more than 10-15 lines.
>>>>
>>>> As noted above: If eliminating guest visibility of the SMMU helps gett=
ing rid of related emulation and interception logic, I'm sure it will be mo=
re than 10 lines. If we need 2 stages configuration-wise in order to use th=
e SMMU at all, those 2 stages need to stay, of course.
>>>
>>> Ah, I thought you meant removing stage 2 and keeping stage 1.
>>>
>>> The SMMU can work with either or both stages enabled.
>>>
>>>> But I'm not into the details yet, just deriving from the history on IO=
MMU on x86 where you started with 1 stage (what we only support there so fa=
r), and only later on a second one was added in order to allow guests to ma=
p hardware directly while isolating it under own control (e.g. protect agai=
nst userspace-mapped devices). The latter is a bonus feature with use cases=
, though not yet in Jailhouse context.
>>>
>>> Guest visibility of the SMMU is useful when you have a device not capab=
le of scatter-gather operations (we have some on our boards, like the video=
 decoder). They expect a contiguous buffer of memory to work. Adding stage =
1 translations eliminates the need for large contiguous buffers. Another us=
e case is when you have a multiple PCI devices under the same cell. You cou=
ld easily protect memory regions of the two devices from each other with st=
age 1 translations.
>>
>> I get the first use case (legacy IP support - modern PCI devices no long=
er have that issue, thus there was no need on x86 so far), but the second o=
ne is exactly of that "nice-to-have" category which I consider not yet rele=
vant.
>>
>> On the downside is the fact that adding an emulation interface massively=
 widens the attack surface of the hypervisor. That is easy to get wrong, ju=
st look at [1]. So I would really like to see this optional, either build-t=
ime or runtime configurable, so that you can turn the interface off if ther=
e is no device around anymore that needs it (I assume future IP will remove=
 such limitations more and more).
>=20
> A build-time configuration will need at least 3-4 sets of #ifdefs scatter=
ed throughout the driver, but it will reduce the binary size when the emula=
tion is not used. Run time configuration will come at the cost of larger bi=
nary size, but only a couple of if statements need to be added. Of course, =
something in the cell config will also need to be added to tell whether to =
use both stages or not.
>=20
> Which would you prefer?

For the beginning: The simplest approach for you (I would suspect #ifdef me=
ss=20
will win). The key is the split-up. Then we will see clearer what needs to =
be=20
managed.

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
jailhouse-dev/d52e45be-a5cc-87df-fa21-54e364e4aeab%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
