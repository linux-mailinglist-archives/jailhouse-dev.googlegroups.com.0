Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUM46LUAKGQE2FLXSZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCF5E2B0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 13:15:30 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id v4sf507644ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 04:15:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562152529; cv=pass;
        d=google.com; s=arc-20160816;
        b=bk+PpVjlFfAMfFunZbmKvvFK/HNr+++zB88r3XtLL4Geu/plbdcV6o0sgser6EHoYE
         AXoG4H5408czEFzC7zFstvZ2cAEHJiYUJl+bXa+msNIoMS5aIiJ3xKOzIEmi3bVhYWxe
         JA2vuhw17YWOtD68h3KpMfeNzbEhIEnpwOlNrcIat0GwS32/p1NQOpbLSnDtEkb1GeD0
         xSWwi/VoLZ7RQwIs4kxtXWeM3c9UmzXHjjeustQtJ6oOTdmFygaV9bforZcqoljrI4fG
         rQrS9eTvcJdamLkpoHX35rnePCwmMPmae25P2xzJJPcTNB1Bfor9T+SgahKjpGpA1gVj
         g95w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=EDbZLrjWNIF2ngo/Z6gaIYsRV42qVBLKsEaXdd5L7FI=;
        b=O1aimZfLFpPh7uwH/wb658H9n9kXSzztOntH3yBAaYC1eSZeJUktDcP4uSeu1+zFcT
         9G2Tv4kDQcT56RADPm0cohI9vR/zXhug4/sPPUJMXRB5YnTMip44Xm0/XxPtV0WB2T1S
         RL9HDDlULWgfoMic06uhgL8WROQq0dHwfmj2FQTcltXzjMbdfBCoCS7OcMKAY1BlSGT6
         vkHDZTTjuq4lFAkFi2wgc7rd2wkxvRcN56T6WwOoWYpjjKbFLZmzwBygw2G+8F/C31RC
         SvCqkYX4v6ZOxQ/PxBMTRnBGeElgpMZkHoyO/v0VFixkuhjqWzLQFmftr3U+wXyAUqYG
         HTrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EDbZLrjWNIF2ngo/Z6gaIYsRV42qVBLKsEaXdd5L7FI=;
        b=mf0MAJ1OogB1x9QcB1ptRvxMva3ChBctygZfpKXxMw8wX34LiWhasE2H5PPhG6DYdq
         /AmCllQoGDa7vbhe9n5I9KcSuZSC9WfARCBjFZ8Y/4ntF1MW7pumWaVfLXHoLjiOcKGi
         RgxWJ0uduH0hjod72kKjF3abBzKA4NiAi0o0updq8SoIQ+YcJ0eSfiW9bW9Blyv/gkMa
         EyB1Qic8oyjcCneuERJB1eD0yHL3nEq/ELKh0JmnkBYA7ps9LIGyMGziKp6skcuimZkx
         SClzYPm2jUwhRswSG1MExR76QFSiRJzLnrT8XXt+srmY20GG3jpI0NfR2k/AeeXNKWL0
         5V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EDbZLrjWNIF2ngo/Z6gaIYsRV42qVBLKsEaXdd5L7FI=;
        b=cMkfHkR5DmBTF9F7LHQWnDXgnQLTUHst1y/BSaGvg/szyEvaarXAan8zRNnVwV05ca
         VpZ4tuA00JVbSozjhL4K85SfHUwc39f1yQo/K05KggJM0d9OiBC1oluBtCAnZt3r6GF6
         jXuGA9jOLRGr9WZBNioZhmn5h7NbMovDyC4msbs+hFp/nrTJk0SmTbaBIHVMQ48I4w5H
         v1wbVHnPNgnvY4vi7XTm5uduXOByXufEVF/G8cgzopLcW8OpQA4d2okYYRFIP+jVfvpO
         7H5zjcxC3VRtfVnWn3hkpnrOvCwfqnyvKpBr9vMqd+AJCY8k/TiqI6AhRdAj3m7ji5wW
         5/CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWEAt+gruoJjLw/FCsQm0Ads/IbfkFeRyvRfdCdsFPRRV8rxbjF
	0w3otqMSxTUitVo69Lp5mUc=
X-Google-Smtp-Source: APXvYqx6B0bQJ9ujYhBmrQyDF45UvaJY9XWI5JBzZtBokk9cHlFiY6QX76zN64VfEmQxrAJcxdCuBw==
X-Received: by 2002:a05:651c:213:: with SMTP id y19mr2315581ljn.25.1562152529819;
        Wed, 03 Jul 2019 04:15:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:96d5:: with SMTP id d21ls248447ljj.16.gmail; Wed, 03 Jul
 2019 04:15:28 -0700 (PDT)
X-Received: by 2002:a2e:870f:: with SMTP id m15mr20647404lji.223.1562152528871;
        Wed, 03 Jul 2019 04:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562152528; cv=none;
        d=google.com; s=arc-20160816;
        b=rBK+k5adeB9PEIK40v/sl/2lHXfykNyZWzY8Myme78omGeGzWD2onBpa1a9iSbw+SG
         iYovcSn2x/Lqry3z1PqEXNqhnOVsnAOgR8k989vAnXlPQaPTNI1tfAIwMp/VY0PmKzSM
         6TryZt9McE6mAY/wEmauhlwojnUlKoggsrf0s9l41VrqjE0wDGcMZNdfv3w8QcFvvAVT
         CY4LCDSwtsuN/EmPNfwYqAM9PA2BPnCMnaqXP7/6UPqG5HD32g9FRaodF0wjSVi6DBXE
         bx4foAkZ8iGvwW3tAPe8seVW1QolnCAMgxqqAeo8jS9szZQBBbn9QP81KeIvS6eQCkWL
         bqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=wZc6LBwX4FXHlYZYDmBGzq+OXBP49/psxN4MwTj7LH0=;
        b=cAGxnKX8TyZzrAxTDUuYKJAklp2mCk5Dr4hbxK6H/Z9KQEfa/sd5OYeccZQgszwTVo
         S8+/arJmBfXvf2hmg3oxfIy56+gekLZsYGkSkwB1Yz1ZBBIVNMHZtet1RiLmLLwqep46
         mk6yoGxA9cCiZJ/T9rCYyPA1zixMPcgNEBhFjQHD5aLnZpefs7MYC/g/eUOievcErmVJ
         DqSUN3N0RpUOiJZsV/M8uhvG9WwvwAs2JIBMt3H+tk/76yvtw3oNHrfYJWY0glg0B1Mg
         VdKO6D3RspuluHNkd7mIyR0siiVnk6A1cL5Q/oi70rGd07BDrxZxN6M/PKva/scu2RUI
         n5HQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p85si90637ljp.4.2019.07.03.04.15.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x63BFRkF008826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 13:15:28 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63BFRjO012080;
	Wed, 3 Jul 2019 13:15:27 +0200
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
 <d52e45be-a5cc-87df-fa21-54e364e4aeab@siemens.com>
 <2ee45bc1-ea50-db76-3329-2f5350e6793f@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d6c33b9c-27d3-0789-eae2-9fba72a4e802@siemens.com>
Date: Wed, 3 Jul 2019 13:15:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <2ee45bc1-ea50-db76-3329-2f5350e6793f@ti.com>
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

On 03.07.19 13:06, Pratyush Yadav wrote:
>=20
>=20
> On 03/07/19 4:24 PM, Jan Kiszka wrote:
>> On 03.07.19 12:33, Pratyush Yadav wrote:
>>>
>>>
>>> On 03/07/19 3:26 PM, Jan Kiszka wrote:
>>>> On 03.07.19 11:16, Pratyush Yadav wrote:
>>>>>
>>>>>
>>>>> On 02/07/19 8:58 PM, Jan Kiszka wrote:
>>>>>> On 02.07.19 16:57, Pratyush Yadav wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>>>>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>>>>>> A System Memory Management Unit(SMMU) performs a task analogous t=
o a
>>>>>>>>> CPU's MMU, translating addresses for device requests from system =
I/O
>>>>>>>>> devices before the requests are passed into the system interconne=
ct.
>>>>>>>>>
>>>>>>>>> Implement a driver for SMMU v3 that maps and unmaps memory for sp=
ecified
>>>>>>>>> stream ids.
>>>>>>>>>
>>>>>>>>> An emulated SMMU is presented to inmates by trapping access to th=
e MMIO
>>>>>>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the S=
MMU memory
>>>>>>>>> mapped registers are trapped and then routed to the emulated SMMU=
. This
>>>>>>>>> is not emulation in the sense that we fully emulate the device to=
p to
>>>>>>>>> bottom. The emulation is used to provide an interface to the SMMU=
 that
>>>>>>>>> the hypervisor can control to make sure the inmates are not doing
>>>>>>>>> anything they should not. The actual translations are done by har=
dware.
>>>>>>>>>
>>>>>>>>> Emulation is needed because both stage 1 and stage 2 parameters a=
re
>>>>>>>>> configured in a single data structure, the stream table entry. Fo=
r this
>>>>>>>>> reason, the inmates can't be allowed to directly control the stre=
am
>>>>>>>>> table entries, and by extension, the stream table.
>>>>>>>>>
>>>>>>>>> The guest cells are assigned stream IDs in their configs and only=
 those
>>>>>>>>> assigned stream IDs can be used by the cells. There is no checkin=
g in
>>>>>>>>> place to make sure two cells do not use the same stream IDs. This=
 must
>>>>>>>>> be taken care of when creating the cell configs.
>>>>>>>>>
>>>>>>>>> This driver is implemented based on the following assumptions:
>>>>>>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 architecture.
>>>>>>>>> - SMMU supporting only AARCH64 mode.
>>>>>>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible=
 with
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the trans=
lation tables of CPU for SMMU.
>>>>>>>>>
>>>>>>>>> Work left to do:
>>>>>>>>> - Route event notifications to the correct cell and identify whic=
h event
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>>>>>>> - Add support for IRQ and MSI routing.
>>>>>>>>> - Add support for PRI queues and ATS.
>>>>>>>>> - Identify which cell caused a command queue error and notify it.
>>>>>>>>> - Support sub-streams.
>>>>>>>>>
>>>>>>>>> A lot of the work left is optional features that the SMMU provide=
s like
>>>>>>>>> substreams, ATS, PRI. There is little reason to add them unless t=
here is
>>>>>>>>> a use case for them.
>>>>>>>>
>>>>>>>> One quick question again, I already had it for the RFC round: Woul=
d it be tricky to split up this patch into single-stage only + 2-stage supp=
ort? That would allow me to asses the additional complexity we import by ad=
ding 2-stage support. Or is 2-stage support inherently coupled with the SMM=
U design so that such a split-up would neither make sense nor buy us anythi=
ng?
>>>>>>>
>>>>>>> I considered splitting, but as far as I see, stage 1 and 2 are rath=
er tightly coupled. If you want, I can split it into two parts where part 1=
 is the defines, data structure declarations, and initialization. Part 2 wi=
ll have stage 1 emulation and stage 2.
>>>>>>
>>>>>> If part 1 will get away without emulating/intercepting bits of the S=
MMU, I bet it will be a win.
>>>>>
>>>>> It will.
>>>>>
>>>>>>>
>>>>>>> Let me know if you'd prefer that, and I'll send the series tomorrow=
. It's getting late and I'm about to leave for today.
>>>>>>
>>>>>> Sure, no hurry!
>>>>>>
>>>>>>>
>>>>>>>> Background is that the majority of use case I see will not need mo=
re than one stage. I particular, you have no need for 2-stage support in si=
mple bare-metal or RTOS cells, leaving this only potentially relevant for t=
he root cell (or secondary Linux cells). If the feature is complex and can =
be disabled, we could skip it, reducing the code size.
>>>>>>>
>>>>>>> Hm, as far as I understand, stage 2 should be always needed because=
 you need to translate from IPA to PA every time. Stage 1 could be optional=
 if the guest OS handles the scattering or gathering of the buffers. But do=
n't you always need to translate from IPA to PA (even though in case of Jai=
lhouse those translations are almost 1:1, and IPA =3D=3D PA)? When would yo=
u not need stage 2?
>>>>>>>
>>>>>>> Anyway, most of the code is setting up the SMMU and the data struct=
ures, and stage 1 emulation. Stage 2 only part is very small. Removing it w=
on't save you more than 10-15 lines.
>>>>>>
>>>>>> As noted above: If eliminating guest visibility of the SMMU helps ge=
tting rid of related emulation and interception logic, I'm sure it will be =
more than 10 lines. If we need 2 stages configuration-wise in order to use =
the SMMU at all, those 2 stages need to stay, of course.
>>>>>
>>>>> Ah, I thought you meant removing stage 2 and keeping stage 1.
>>>>>
>>>>> The SMMU can work with either or both stages enabled.
>>>>>
>>>>>> But I'm not into the details yet, just deriving from the history on =
IOMMU on x86 where you started with 1 stage (what we only support there so =
far), and only later on a second one was added in order to allow guests to =
map hardware directly while isolating it under own control (e.g. protect ag=
ainst userspace-mapped devices). The latter is a bonus feature with use cas=
es, though not yet in Jailhouse context.
>>>>>
>>>>> Guest visibility of the SMMU is useful when you have a device not cap=
able of scatter-gather operations (we have some on our boards, like the vid=
eo decoder). They expect a contiguous buffer of memory to work. Adding stag=
e 1 translations eliminates the need for large contiguous buffers. Another =
use case is when you have a multiple PCI devices under the same cell. You c=
ould easily protect memory regions of the two devices from each other with =
stage 1 translations.
>>>>
>>>> I get the first use case (legacy IP support - modern PCI devices no lo=
nger have that issue, thus there was no need on x86 so far), but the second=
 one is exactly of that "nice-to-have" category which I consider not yet re=
levant.
>>>>
>>>> On the downside is the fact that adding an emulation interface massive=
ly widens the attack surface of the hypervisor. That is easy to get wrong, =
just look at [1]. So I would really like to see this optional, either build=
-time or runtime configurable, so that you can turn the interface off if th=
ere is no device around anymore that needs it (I assume future IP will remo=
ve such limitations more and more).
>>>
>>> A build-time configuration will need at least 3-4 sets of #ifdefs scatt=
ered throughout the driver, but it will reduce the binary size when the emu=
lation is not used. Run time configuration will come at the cost of larger =
binary size, but only a couple of if statements need to be added. Of course=
, something in the cell config will also need to be added to tell whether t=
o use both stages or not.
>>>
>>> Which would you prefer?
>>
>> For the beginning: The simplest approach for you (I would suspect #ifdef=
 mess will win). The key is the split-up. Then we will see clearer what nee=
ds to be managed.
>=20
> Yes, #ifdef wins.
>=20
> I am working on the changes suggested in the first patch. If you want, I =
can send the series without all comments addressed, but with the SMMU drive=
r split into two parts. You can start reviewing it while I fix the other th=
ings. Then I'll follow up with all the fixes.
>=20
> Let me know if that'd be better.

If the other changes will take more than a couple of days, go ahead. Otherw=
ise,=20
I would wait for v2 with other remarks addressed.

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
jailhouse-dev/d6c33b9c-27d3-0789-eae2-9fba72a4e802%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
