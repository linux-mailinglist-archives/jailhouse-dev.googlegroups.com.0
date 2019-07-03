Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYXX6HUAKGQEB7YLBGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEB85E184
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 11:56:50 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id r21sf1305449edp.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 02:56:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562147810; cv=pass;
        d=google.com; s=arc-20160816;
        b=s0TjLK4560U5q+dQLMJI6alUyxmYcgE+k7IsmalQCyk8fzKExf8feuecZLBPkGIfeY
         dhbzrFq6CdtnHTZ/g9P4Uwn6tKqeui0k7hJGuZlkdKdSZqFgtYYmQONKAZvEbcLnATIk
         ed4mJFP1LCAxB6X1THbRayV0MsysszN8ZFV78/6xpcwOQCn7Ou9uOj3pzR9zuMs5Ty2k
         pO3JLzeMaT+X1ZyjqGM82TB2633fbd3+gTKLTfjzAyHhGNlq/CLzbD809QR29VQCAwk8
         0lyLFwP1t8+zv9xBjtAwUrdBumLkZmp26ClkDSCzwKBrTi9wxB7xwSafnyGZ7u+SxHr9
         Mzow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=utRko3xQ4rw2R818qMcFDLt3RVLhmiUqOutA91jrl0U=;
        b=UgESzdz2cqNedfXUACfTLrr4XCQ5qrIPgfdddH8wcPnt+mIjKrtSMy1t9x/g6t+YJL
         zL/tkWkJ8KjSFs6bVIVP4BRieLPni7XF5f61+u5kTNqPgaB2w4h3OJe/jKSB6UjDl1wP
         nJhTbQyf99SqJsZlT7pTYgikqrrhaGaJaccFu7TFMBkVs2glCBvWUg8efnOqtxmaC0Q5
         8NEh92Y84Zqvz5+W/5bMxCZGkfsNbtGle+dYpR6yFSidUuUWBGK9jLknbbnZJCtKR44S
         MyUaVndYrPZ0CO/oZjf6oICnI06IyBLknonY60o7pXqP2QC+//0jpEuaa6GLRLo73fF6
         5/mg==
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
        bh=utRko3xQ4rw2R818qMcFDLt3RVLhmiUqOutA91jrl0U=;
        b=jUbwcLIB4cH27yLi/tRwBx4W63u1EsgZ93fu6A2sShoe027OdEKaItxHakpMah3c51
         PbOXcn5VdLscbKMO1NMUpahhgU+6twdKC0jmv5h0IKZi9MqZ3aNHXwtVgYoVk8/uN9Mm
         R+z+qcUKzhtDa8GPKZbhBCsyVdSghNlrSbdC+g9/0P6TC9/oz+FNgUT6QynXloOUWLUC
         ERph/vsOyUDmV8IzEPBsv5A4HNg9P0MSC8gjWpbCYe7/lq632eZ5zV3aN/4bXZn8PuSw
         4mJGDEQ9MpAr7eovRJ5oZvzlKT1UVkabsT4cRBxz+5FIJBiym6CKS1Xssq00gd6rawX+
         NSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=utRko3xQ4rw2R818qMcFDLt3RVLhmiUqOutA91jrl0U=;
        b=fRXDiq3gsp/mHJc2Z7m1jL/30DJKGv8pAI4FYULP3TVOsgl6TybBBnmG7Nfk0fy5fz
         DDWsHeKzjqCQKNOm6llGiW6wBgukh0px5T3oIFey7r15ooHCf+kzN4/axLoQWD0vssst
         jNBvWEjGG1Q+NnW+WveKKAdhfws1tTwWhKV0RBT9oFJ6/cxP5kZ/07WxuXqhqAx+Y6fp
         zKJkXGtDUTAoE0wWEU4BkJMwxAblotegRR62tYhr5nAjSiaEa6LrGvLBJKZgmHz15ICe
         J9rVmVZ8bSn1Clohw0JxuUi4EC8EHr5rP9XhJ7GUk2/b5mY46DajaxzfNbeoSm1ezL0n
         TMkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyVgWXScSu30NwcYTcxrBWXBqZxf7k35NTGWv4HLTwjsI4AG+B
	dRV6cfPP8xfkbdO1JXfa9xE=
X-Google-Smtp-Source: APXvYqzUnE1mGQMlJZl2Tjxl1kk3CIJ4xWCE2ETNefEILkqypf/y7ZmEc3cau3YZD84co1uEGzD2LQ==
X-Received: by 2002:a17:906:edd7:: with SMTP id sb23mr23701744ejb.309.1562147810346;
        Wed, 03 Jul 2019 02:56:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:aeee:: with SMTP id f43ls558758edd.15.gmail; Wed, 03 Jul
 2019 02:56:49 -0700 (PDT)
X-Received: by 2002:a50:ac24:: with SMTP id v33mr41385299edc.30.1562147809763;
        Wed, 03 Jul 2019 02:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562147809; cv=none;
        d=google.com; s=arc-20160816;
        b=s14sWUvFsEjwS86yTiGHrx1EPOvzF35EtBLRSTI+ib/2Re3c4HQwVgYByHWkzdD/yE
         vdISxz2fiqkETx5sWqmMN7On9v4uUJozQw5sEuDJQdKyU5uIhUiLLARhJDfEdu/bEX6F
         VToOLZXDXyU7qwkDrlz+0jMrDEvaAlC1Uo8PECckqrd1+JYB647bf/I8+jGxN8BrBqqp
         MZmkLjQXFUKtXrIbBVGYfITwftQ5qeuBSe+XTRsS2y2aOCxFLYVkzJrBA/r488gugSHE
         UOUcivguCmjgdp8NAz1aY8v37zq4BABy2YCCYoIWK7ksYeYh/ZYOkojkaKgflpTorV1O
         UhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SI5HNWudAuovljlGAjOAmSSbAIXG6yKVMaURgADTtPE=;
        b=x3SpL7qnp4GXA55hPx2ynuhdNSXd4Y4y5ushLufo9dL1rIV2aOuE2wK6bZVNszEnJW
         xGsLar7/8ZMSDeB9B5w6bPKnzFLY7H+s3Yl4J4Fkr9fPx6T8mgNCxlKxYzxqKbUu4y9o
         jWpxCyh+5lmWX5AqmZbsjfEQBVaV3PbqbXnLsU95XKjRaBW+UcMbPyiitN1u1UJFXtf8
         t+yfasC+cQ8QDQUfGY+gg2Y6xKM+px11lKboE1soCf6G2vB6gWlA/mKPYLPKk04oHlpr
         5een+ezwZpSJ45ACZv5ct97B/pnigRnCR2id0J+m7ODGDAWA1JXAfi4opkvtqzGl5nFe
         weRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 91si56812edq.3.2019.07.03.02.56.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x639un8k004036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 11:56:49 +0200
Received: from [167.87.3.140] ([167.87.3.140])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x639ulEX031544;
	Wed, 3 Jul 2019 11:56:48 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <45656e34-8ff5-80fd-8896-971441c61af2@siemens.com>
Date: Wed, 3 Jul 2019 11:56:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a01e9cb2-5c14-5451-156e-faf80bee74e7@ti.com>
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

On 03.07.19 11:16, Pratyush Yadav wrote:
>=20
>=20
> On 02/07/19 8:58 PM, Jan Kiszka wrote:
>> On 02.07.19 16:57, Pratyush Yadav wrote:
>>>
>>>
>>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>> A System Memory Management Unit(SMMU) performs a task analogous to a
>>>>> CPU's MMU, translating addresses for device requests from system I/O
>>>>> devices before the requests are passed into the system interconnect.
>>>>>
>>>>> Implement a driver for SMMU v3 that maps and unmaps memory for specif=
ied
>>>>> stream ids.
>>>>>
>>>>> An emulated SMMU is presented to inmates by trapping access to the MM=
IO
>>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMMU =
memory
>>>>> mapped registers are trapped and then routed to the emulated SMMU. Th=
is
>>>>> is not emulation in the sense that we fully emulate the device top to
>>>>> bottom. The emulation is used to provide an interface to the SMMU tha=
t
>>>>> the hypervisor can control to make sure the inmates are not doing
>>>>> anything they should not. The actual translations are done by hardwar=
e.
>>>>>
>>>>> Emulation is needed because both stage 1 and stage 2 parameters are
>>>>> configured in a single data structure, the stream table entry. For th=
is
>>>>> reason, the inmates can't be allowed to directly control the stream
>>>>> table entries, and by extension, the stream table.
>>>>>
>>>>> The guest cells are assigned stream IDs in their configs and only tho=
se
>>>>> assigned stream IDs can be used by the cells. There is no checking in
>>>>> place to make sure two cells do not use the same stream IDs. This mus=
t
>>>>> be taken care of when creating the cell configs.
>>>>>
>>>>> This driver is implemented based on the following assumptions:
>>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>>>  =C2=A0=C2=A0=C2=A0 architecture.
>>>>> - SMMU supporting only AARCH64 mode.
>>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible wit=
h
>>>>>  =C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation tables of=
 CPU for SMMU.
>>>>>
>>>>> Work left to do:
>>>>> - Route event notifications to the correct cell and identify which ev=
ent
>>>>>  =C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>>> - Add support for IRQ and MSI routing.
>>>>> - Add support for PRI queues and ATS.
>>>>> - Identify which cell caused a command queue error and notify it.
>>>>> - Support sub-streams.
>>>>>
>>>>> A lot of the work left is optional features that the SMMU provides li=
ke
>>>>> substreams, ATS, PRI. There is little reason to add them unless there=
 is
>>>>> a use case for them.
>>>>
>>>> One quick question again, I already had it for the RFC round: Would it=
 be tricky to split up this patch into single-stage only + 2-stage support?=
 That would allow me to asses the additional complexity we import by adding=
 2-stage support. Or is 2-stage support inherently coupled with the SMMU de=
sign so that such a split-up would neither make sense nor buy us anything?
>>>
>>> I considered splitting, but as far as I see, stage 1 and 2 are rather t=
ightly coupled. If you want, I can split it into two parts where part 1 is =
the defines, data structure declarations, and initialization. Part 2 will h=
ave stage 1 emulation and stage 2.
>>
>> If part 1 will get away without emulating/intercepting bits of the SMMU,=
 I bet it will be a win.
>=20
> It will.
>=20
>>>
>>> Let me know if you'd prefer that, and I'll send the series tomorrow. It=
's getting late and I'm about to leave for today.
>>
>> Sure, no hurry!
>>
>>>
>>>> Background is that the majority of use case I see will not need more t=
han one stage. I particular, you have no need for 2-stage support in simple=
 bare-metal or RTOS cells, leaving this only potentially relevant for the r=
oot cell (or secondary Linux cells). If the feature is complex and can be d=
isabled, we could skip it, reducing the code size.
>>>
>>> Hm, as far as I understand, stage 2 should be always needed because you=
 need to translate from IPA to PA every time. Stage 1 could be optional if =
the guest OS handles the scattering or gathering of the buffers. But don't =
you always need to translate from IPA to PA (even though in case of Jailhou=
se those translations are almost 1:1, and IPA =3D=3D PA)? When would you no=
t need stage 2?
>>>
>>> Anyway, most of the code is setting up the SMMU and the data structures=
, and stage 1 emulation. Stage 2 only part is very small. Removing it won't=
 save you more than 10-15 lines.
>>
>> As noted above: If eliminating guest visibility of the SMMU helps gettin=
g rid of related emulation and interception logic, I'm sure it will be more=
 than 10 lines. If we need 2 stages configuration-wise in order to use the =
SMMU at all, those 2 stages need to stay, of course.
>=20
> Ah, I thought you meant removing stage 2 and keeping stage 1.
>=20
> The SMMU can work with either or both stages enabled.
>=20
>> But I'm not into the details yet, just deriving from the history on IOMM=
U on x86 where you started with 1 stage (what we only support there so far)=
, and only later on a second one was added in order to allow guests to map =
hardware directly while isolating it under own control (e.g. protect agains=
t userspace-mapped devices). The latter is a bonus feature with use cases, =
though not yet in Jailhouse context.
>=20
> Guest visibility of the SMMU is useful when you have a device not capable=
 of scatter-gather operations (we have some on our boards, like the video d=
ecoder). They expect a contiguous buffer of memory to work. Adding stage 1 =
translations eliminates the need for large contiguous buffers. Another use =
case is when you have a multiple PCI devices under the same cell. You could=
 easily protect memory regions of the two devices from each other with stag=
e 1 translations.

I get the first use case (legacy IP support - modern PCI devices no longer =
have=20
that issue, thus there was no need on x86 so far), but the second one is ex=
actly=20
of that "nice-to-have" category which I consider not yet relevant.

On the downside is the fact that adding an emulation interface massively wi=
dens=20
the attack surface of the hypervisor. That is easy to get wrong, just look =
at=20
[1]. So I would really like to see this optional, either build-time or runt=
ime=20
configurable, so that you can turn the interface off if there is no device=
=20
around anymore that needs it (I assume future IP will remove such limitatio=
ns=20
more and more).

Jan

[1]=20
https://github.com/siemens/jailhouse/commit/ae8b272f997bc720efc7f18476e5a40=
7e2580ead

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/45656e34-8ff5-80fd-8896-971441c61af2%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
