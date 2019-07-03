Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBKMY6LUAKGQEHW5SL4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 567505E28A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 13:06:19 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id u21sf1286294pfn.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 04:06:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562151978; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jg1CPZi0bfTIrivjwdHSVKsX3XUrf+XK44ocWhvgjyqrDpY4Gx4vY12LWzV69rE+Aw
         FSwrkxuIs4g9WGxs0gjDijHo3Fyr7xgtpW+FYtYa2rMqWHBID8Ts3VB8aCYLCAfee1Hr
         qO4NU/cGnBu2bsOS6XCPGcl+ft4OzPKniUa36apZTkXDSVgVPwGQWS9cSSVgd6N//0JC
         ckQJcnDG6NAtiDgvWxzEB8sOakeAE3NnyUD1UwWSlA+T1kt74sQGmmb/t6GNFgczzvQU
         zHvc3KmSnHoPDW8X7q4DWnmYkdweWMGctHQUmKtsmqDinHXdqTBCg9Sy/FpnErV364Iy
         c1ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=FUnIu1psIc4+P0s3OkU5JHit3G2646h4034Q531nJ3Y=;
        b=CX23AVK35bZc2tl0fxNNtWuwrE8w7VNO4BXuiiQ8OanGhE0bD6c9l6YDN17820J1Bp
         8gDBQc19sKJI5D+d0AgcWJebwJ8epJ9IQD8lsFhd7t7K+qJ+8FDUsS18tkZAUiKYOmFa
         pavG6Y++WQiGq+bUB0yvtNuH4YI8RGbgpG8zbVjeXFzYUwFkoiWY2G2/SPuTE/9PGtMo
         yDRkZ2Rm7xPQMoqfSkaSmMnZOXRFcS/8bXOiRJciV+NX2agwBkdu5gwB6PFhmVdLm/A5
         w5F2ddNAyRtqzjcrhDc1dVfsw+6DGYmpaUAIneu4tX4cu2OJU6wRhEeBKcQBGxp8JZaU
         r+CA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MAyolKQg;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FUnIu1psIc4+P0s3OkU5JHit3G2646h4034Q531nJ3Y=;
        b=qj9mPktko1X0YJZdVfzqRC1X7Ajr6KmidZU1dwmszsuDXoaW0xCrlJ0owI1uIUgAv0
         Sm0bxCfpJfHVINjkETTAHC+30CXVzSqkzEScewpnndeS02ostiDkKdWw1hB72sJGvp4C
         978QEXnclDpHB9YZW2vdyrTC02J936u658lx4959IsYUjQY8sth8nqHlnHysp8D+b1gi
         KIy6t4QmEZdQOr9SSLwpzPqTl6YoamTpyc41dqSXHiMtYsNnBqgZhYlwxAKwqoKhKnkb
         T+1Yc9kZ8RrbZzR7IY9cRWSRZEPcfhktu576Ttv8W0hc6tRIsrwUGxJnv7ZOLfPgAUUP
         q2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FUnIu1psIc4+P0s3OkU5JHit3G2646h4034Q531nJ3Y=;
        b=M2N77SIFAsEtwxAVXlbillxTQcTNLy5Ykq2/KRDWtV8bcosRL1poC3Ru4/3aoWSlp6
         Wp+iwKizuYHORwA94ekxX29xGEguMFVFvpGl3nTcx/DO8+UgRXAU2nC+LvrtF9rJqNPh
         5VGIlD+22xC2XU8JKiea1AWsRzvkbfM4Egp9LokFgWhZgACP7+PbLMMtyZMpGvkgDT5p
         KAFvLd0D1F+53w+qaLhSW77cdgWCJ91vzSzt74DLDpnmhG0eEjAWiprGQT5lSsA676I8
         HNuTdB57pfYGVrfVVoA0agU8uIq7pzngOk/uFgFNz7K4t56uR5JqSvgJ38PkVdjHeDAV
         0oqw==
X-Gm-Message-State: APjAAAXv0uqKwtwr4FeKJ61Vb2LOTTfD527GZRf/XpPwkqHm9iXIK1GE
	rt/gi60S403eqi/tZeEz/9U=
X-Google-Smtp-Source: APXvYqzvuYO8wx+46KzWsu/EZITak0N/+YSQJsTcrsiubvzuRv+f2ea11CO3afcYaIFxuGxE9lU3Ow==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr12199706pjt.107.1562151977829;
        Wed, 03 Jul 2019 04:06:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:2426:: with SMTP id h35ls823758pje.3.gmail; Wed, 03
 Jul 2019 04:06:17 -0700 (PDT)
X-Received: by 2002:a17:902:26c:: with SMTP id 99mr43150231plc.215.1562151977388;
        Wed, 03 Jul 2019 04:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562151977; cv=none;
        d=google.com; s=arc-20160816;
        b=kV+BU1H3SMUp8lQhD231RPRZdsV2709/0JpLoOWQbBlHhuCBMkDaBbHH/or7a52mer
         5UrcfjMg350028XnBSEhH+hZojMn47d92cSvdpJz6jmnYzxiWzfMzd5TO4hQM0bRVQb4
         KK8oKvkUcfg7JdvOcCr3K1eYLwUWN1rwb4LmLLd4OxrC3tO0gUpIe3IyUjhNINGYjiZD
         tpr0Wz+W9iaEY3e0dNs1S0nQkOT2PjKuqQRRCdZQhLHb2z1EjpYUrZM7hUvCuDbLhZuv
         D6B0Gt/qGuVwNrrYMAzDEGIY62rSXKKa0z6G0rNPZo4dW6QGdxH0GSJMfG8M40eOyrM7
         7R3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=p9/adA1L6Z/hsDfkLGhwkmJfxRZbUvsZGklUTib0ZWo=;
        b=QxQRJMR+pkzgUeyj4Dm+enB/HhqG+SBCCU+RwT6O3xlyT6ddpsZX73Q5rQl8d96Pc5
         UWN/f9V0s2guxyo2zFtTOFKdvq33aE5nM+q25kvR9sH4kLK8D4erzU7SsVQU4NHppneU
         bEGuAxKuL5jxV9BKPV6dvAVoIGIiISSIuRDWwdqCBP7xNczRsHacuwZyk2SvA3zLGV1i
         4gSCnEqBVplA7Zs1i9o/qhK3SMGhYkC+I6pxItE4Atyn7xLZfdduIxzDIOc9wrSZbOT+
         KuNcju1CaEjtLc7VAhaPiuyKWCyGYUzC8ZyAUpwxxTm450f3wS3O+WyL255N4BbxZdoe
         Ix1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MAyolKQg;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id f184si105583pfb.0.2019.07.03.04.06.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63B6G1d073878;
	Wed, 3 Jul 2019 06:06:16 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63B6GZ7041916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 06:06:16 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 06:06:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 06:06:16 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63B6Dld031757;
	Wed, 3 Jul 2019 06:06:14 -0500
Subject: Re: [PATCH 6/6] arm64: iommu: smmu-v3: Add support for stage 1 and 2
 translations
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-7-p-yadav1@ti.com>
 <47206b1b-aeec-d71c-6f4c-9b4680282ef7@siemens.com>
 <7e76f0f4-f9b8-12db-1dd7-dc63ee7a2004@ti.com>
 <17e77e2c-5f37-4532-858d-04fab20d9ece@siemens.com>
 <a01e9cb2-5c14-5451-156e-faf80bee74e7@ti.com>
 <45656e34-8ff5-80fd-8896-971441c61af2@siemens.com>
 <75ccac5a-5faf-c770-4759-1ea2cc8a47db@ti.com>
 <d52e45be-a5cc-87df-fa21-54e364e4aeab@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <2ee45bc1-ea50-db76-3329-2f5350e6793f@ti.com>
Date: Wed, 3 Jul 2019 16:36:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d52e45be-a5cc-87df-fa21-54e364e4aeab@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=MAyolKQg;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 03/07/19 4:24 PM, Jan Kiszka wrote:
> On 03.07.19 12:33, Pratyush Yadav wrote:
>>
>>
>> On 03/07/19 3:26 PM, Jan Kiszka wrote:
>>> On 03.07.19 11:16, Pratyush Yadav wrote:
>>>>
>>>>
>>>> On 02/07/19 8:58 PM, Jan Kiszka wrote:
>>>>> On 02.07.19 16:57, Pratyush Yadav wrote:
>>>>>>
>>>>>>
>>>>>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>>>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>>>>> A System Memory Management Unit(SMMU) performs a task analogous to=
 a
>>>>>>>> CPU's MMU, translating addresses for device requests from system I=
/O
>>>>>>>> devices before the requests are passed into the system interconnec=
t.
>>>>>>>>
>>>>>>>> Implement a driver for SMMU v3 that maps and unmaps memory for spe=
cified
>>>>>>>> stream ids.
>>>>>>>>
>>>>>>>> An emulated SMMU is presented to inmates by trapping access to the=
 MMIO
>>>>>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SM=
MU memory
>>>>>>>> mapped registers are trapped and then routed to the emulated SMMU.=
 This
>>>>>>>> is not emulation in the sense that we fully emulate the device top=
 to
>>>>>>>> bottom. The emulation is used to provide an interface to the SMMU =
that
>>>>>>>> the hypervisor can control to make sure the inmates are not doing
>>>>>>>> anything they should not. The actual translations are done by hard=
ware.
>>>>>>>>
>>>>>>>> Emulation is needed because both stage 1 and stage 2 parameters ar=
e
>>>>>>>> configured in a single data structure, the stream table entry. For=
 this
>>>>>>>> reason, the inmates can't be allowed to directly control the strea=
m
>>>>>>>> table entries, and by extension, the stream table.
>>>>>>>>
>>>>>>>> The guest cells are assigned stream IDs in their configs and only =
those
>>>>>>>> assigned stream IDs can be used by the cells. There is no checking=
 in
>>>>>>>> place to make sure two cells do not use the same stream IDs. This =
must
>>>>>>>> be taken care of when creating the cell configs.
>>>>>>>>
>>>>>>>> This driver is implemented based on the following assumptions:
>>>>>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 architecture.
>>>>>>>> - SMMU supporting only AARCH64 mode.
>>>>>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible =
with
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the transla=
tion tables of CPU for SMMU.
>>>>>>>>
>>>>>>>> Work left to do:
>>>>>>>> - Route event notifications to the correct cell and identify which=
 event
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>>>>>> - Add support for IRQ and MSI routing.
>>>>>>>> - Add support for PRI queues and ATS.
>>>>>>>> - Identify which cell caused a command queue error and notify it.
>>>>>>>> - Support sub-streams.
>>>>>>>>
>>>>>>>> A lot of the work left is optional features that the SMMU provides=
 like
>>>>>>>> substreams, ATS, PRI. There is little reason to add them unless th=
ere is
>>>>>>>> a use case for them.
>>>>>>>
>>>>>>> One quick question again, I already had it for the RFC round: Would=
 it be tricky to split up this patch into single-stage only + 2-stage suppo=
rt? That would allow me to asses the additional complexity we import by add=
ing 2-stage support. Or is 2-stage support inherently coupled with the SMMU=
 design so that such a split-up would neither make sense nor buy us anythin=
g?
>>>>>>
>>>>>> I considered splitting, but as far as I see, stage 1 and 2 are rathe=
r tightly coupled. If you want, I can split it into two parts where part 1 =
is the defines, data structure declarations, and initialization. Part 2 wil=
l have stage 1 emulation and stage 2.
>>>>>
>>>>> If part 1 will get away without emulating/intercepting bits of the SM=
MU, I bet it will be a win.
>>>>
>>>> It will.
>>>>
>>>>>>
>>>>>> Let me know if you'd prefer that, and I'll send the series tomorrow.=
 It's getting late and I'm about to leave for today.
>>>>>
>>>>> Sure, no hurry!
>>>>>
>>>>>>
>>>>>>> Background is that the majority of use case I see will not need mor=
e than one stage. I particular, you have no need for 2-stage support in sim=
ple bare-metal or RTOS cells, leaving this only potentially relevant for th=
e root cell (or secondary Linux cells). If the feature is complex and can b=
e disabled, we could skip it, reducing the code size.
>>>>>>
>>>>>> Hm, as far as I understand, stage 2 should be always needed because =
you need to translate from IPA to PA every time. Stage 1 could be optional =
if the guest OS handles the scattering or gathering of the buffers. But don=
't you always need to translate from IPA to PA (even though in case of Jail=
house those translations are almost 1:1, and IPA =3D=3D PA)? When would you=
 not need stage 2?
>>>>>>
>>>>>> Anyway, most of the code is setting up the SMMU and the data structu=
res, and stage 1 emulation. Stage 2 only part is very small. Removing it wo=
n't save you more than 10-15 lines.
>>>>>
>>>>> As noted above: If eliminating guest visibility of the SMMU helps get=
ting rid of related emulation and interception logic, I'm sure it will be m=
ore than 10 lines. If we need 2 stages configuration-wise in order to use t=
he SMMU at all, those 2 stages need to stay, of course.
>>>>
>>>> Ah, I thought you meant removing stage 2 and keeping stage 1.
>>>>
>>>> The SMMU can work with either or both stages enabled.
>>>>
>>>>> But I'm not into the details yet, just deriving from the history on I=
OMMU on x86 where you started with 1 stage (what we only support there so f=
ar), and only later on a second one was added in order to allow guests to m=
ap hardware directly while isolating it under own control (e.g. protect aga=
inst userspace-mapped devices). The latter is a bonus feature with use case=
s, though not yet in Jailhouse context.
>>>>
>>>> Guest visibility of the SMMU is useful when you have a device not capa=
ble of scatter-gather operations (we have some on our boards, like the vide=
o decoder). They expect a contiguous buffer of memory to work. Adding stage=
 1 translations eliminates the need for large contiguous buffers. Another u=
se case is when you have a multiple PCI devices under the same cell. You co=
uld easily protect memory regions of the two devices from each other with s=
tage 1 translations.
>>>
>>> I get the first use case (legacy IP support - modern PCI devices no lon=
ger have that issue, thus there was no need on x86 so far), but the second =
one is exactly of that "nice-to-have" category which I consider not yet rel=
evant.
>>>
>>> On the downside is the fact that adding an emulation interface massivel=
y widens the attack surface of the hypervisor. That is easy to get wrong, j=
ust look at [1]. So I would really like to see this optional, either build-=
time or runtime configurable, so that you can turn the interface off if the=
re is no device around anymore that needs it (I assume future IP will remov=
e such limitations more and more).
>>
>> A build-time configuration will need at least 3-4 sets of #ifdefs scatte=
red throughout the driver, but it will reduce the binary size when the emul=
ation is not used. Run time configuration will come at the cost of larger b=
inary size, but only a couple of if statements need to be added. Of course,=
 something in the cell config will also need to be added to tell whether to=
 use both stages or not.
>>
>> Which would you prefer?
>=20
> For the beginning: The simplest approach for you (I would suspect #ifdef =
mess will win). The key is the split-up. Then we will see clearer what need=
s to be managed.

Yes, #ifdef wins.

I am working on the changes suggested in the first patch. If you want, I ca=
n send the series without all comments addressed, but with the SMMU driver =
split into two parts. You can start reviewing it while I fix the other thin=
gs. Then I'll follow up with all the fixes.

Let me know if that'd be better.

> Jan
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2ee45bc1-ea50-db76-3329-2f5350e6793f%40ti.com.
For more options, visit https://groups.google.com/d/optout.
