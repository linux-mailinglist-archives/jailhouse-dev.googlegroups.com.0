Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBB2XE6HUAKGQEROXVPKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E295E0B6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 11:16:27 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id h184sf806333oif.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 02:16:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562145386; cv=pass;
        d=google.com; s=arc-20160816;
        b=pWSdDtJYsiEoIAdkQzCrmoDOkNKk/pQmfnrNdQFDEONKrso5f9gXZCCGy/mO4T+7gb
         t55vm51itrL54pPRgwXliaGSutEsUovh4mGvi6QuDiCRqjOqF0NDfUiKdmoAGhSalUls
         OwTarsRT7FDBF4PSGSJWg3Equb99n1UeiAuI9FZQUGlccFJDLl2b2g9BhQzd75cEBIVK
         /a3nSV2Xle9gP4ikhsTDcBfqlRqQTgI5E+XhgUraeLxNrtAYlhQE8pozufM0tqf+GsqL
         yEdZdpWQyoDNKt+uBheu6UtGdgnoq0zpa2oWLChAw/cuAauMBgelI36fJxEfBhUH5Flg
         rgFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from:dkim-signature;
        bh=x9amaFt5wsnlt96t8MgN16truAvEqHovk5I8O7o0G4M=;
        b=nsErA9W9qnmxunx/GgOivcSnUctsAzTsFoYrIjj2lPPv0sFouWkdRSlW75FghGIsyt
         rLsIYm5bo/YuGfV9aOnjkoI3elMzfKUx9ty+p1tsSP/BzdmqF6pb7QScMCku6pVc01mT
         eaiSLgOcEQnOL9ZQmvQmm1NibxFiLbfvqvSUtOfJzW4vw046PK1S7AI+P4B9yui7pc7L
         37ZAdV13cFAfADbtqHd62p6n8pLk7ZYEm/Kw8BKjpz7uTvFAqsQbg2pffPhbuEyUz8HA
         v9RZLCa9PjYnGFwV6nLcda4CU9rcGWdhHkQN+PwGS0PUqOPWzXBtnGAYmgShE+bnrzCd
         NnyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YBqO8g3V;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x9amaFt5wsnlt96t8MgN16truAvEqHovk5I8O7o0G4M=;
        b=jboIAeI8Y/NjT4RiYzhL2oHlCNH4aXtbobwkkgnf8wTxzD41Rr8AQuyC6HLHCxs14F
         11UOWx+plBMPiixaJx6WzEyjoH6Ih/z2KyeHw1V1sRGf522wh4CJNhJujrObL1ki41eL
         MGl5yEMXaI5rUjaGYG23KnGvIU5lik0o3CBSWug8+1BhGm2dXdmB9XbFAmWoHVjkHP4A
         M7R8ELf7HyJHwfMx89DkNFmH/PP/9nCx7jSNJncYZBJkSCcQL2UJyIIu4JecnfZd5CAC
         j5999+EmbDgerL0NBj4IpXSWY87R+EAbGsEVoLd+HIGOXfSV0wJ566EdIoIwyKYjNKAW
         TTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x9amaFt5wsnlt96t8MgN16truAvEqHovk5I8O7o0G4M=;
        b=SZnKX92quJjwjJi47uRUVKkdNZ4z1vsraxndy6UhLg1ZejhSFerqoIvaXdCeWma7Qb
         uKKneVczV5rwhkAkotsCEBW03ufAbnYxN8nDRfN+LN1kVI04sM8VkqK0TCXni/RZzt5a
         MZxEqb3MFxoZFS4pFaMd5dZPHS6wHKL6HZzrNffr9s6jO8SxIsVSg4AJs5qXqEVCQPKz
         cF0tTwXvWPXLNvqVU19ynJW9MXJ3WU4ozOO9qJzDJKM4kk/GGH5BqL2PhbqEqP5WaUzc
         UTW/Ob3MKO+iNF4llsqr5C/2ahCP7jmGngFgDpG+zPlsU+tldhLLrB8tREDcoZxpKmzk
         wn/g==
X-Gm-Message-State: APjAAAUjB3WsixgxWc2zYMCtcPvgY+qstGMlBa1MNalnZ+I/7bqAom5x
	NEpJ8Gb3UkJQ17eVGohkzSA=
X-Google-Smtp-Source: APXvYqxlSJnRfQNQefPYS3lgXKx3HqGG+fYvxA84gFnFpardecD1sUVLJjgPlgAl915+asIAsAno2Q==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr29881694otn.327.1562145386205;
        Wed, 03 Jul 2019 02:16:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3db7:: with SMTP id l52ls308617otc.15.gmail; Wed, 03 Jul
 2019 02:16:25 -0700 (PDT)
X-Received: by 2002:a9d:7c83:: with SMTP id q3mr28928648otn.273.1562145385837;
        Wed, 03 Jul 2019 02:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562145385; cv=none;
        d=google.com; s=arc-20160816;
        b=c6w2jsmvUlysL4yKfq5zoNorRwjCdHm2S6KmF355AO5lyMIrsNRBT/Ra4B43ByNuzK
         fbcgl9/W4RP2SxyVeChmBaUj1bufWm1oIcj8WXiF6EijF8o35TeFQH36mdlWgDib/hSw
         ouYhpItbvZO5RVUkFcPe9ZuA2gM5oHqxp+dIbJEW8QZnfabN48PV/8SkajhauJqdg0v2
         lsd5xJ9kRhndDCRwoOz1s26YRg7zYocQ1qJkS5DmWf7FjYPMTmtrw7l5TIc6qwq6geaA
         gEqWnVGKEefRZPDPZTrBJSeHuVtpG/4nGyXA02dj4Tz+V+RC7S3ZKTkR5ityaIg9cl3i
         x/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :dkim-signature;
        bh=wSdRT42x/EdS45KmiOqDFdH1Dboh2HpyQmHhI/mClxY=;
        b=Zsd2wX46jTZCc8nD6k9uGHyQT3qn8cVJaBO4OnCgFvfxi7qvTdIlHvch7NN3mQQRxJ
         1ZIbCQSM/4Gc4vcrwf+3aIa4pVZ7EPLEZw6OcnyePjily8FEMJSXU5ygrQBHSvxN8WUQ
         d4oPV1szEoU0ZExIU6jWP3rBM2xIF1oQk3P2nDsvyzM2op3H14M/ZpYB4zP/fiNKYsNA
         I50tECWh0S8mY1fTd4SVwqYa+AY5HM4S/4UWLiZ1l9b9QXBXDuu9A53eiZfXxsWMoYRY
         Y1tZB6437p32b2QsI1YG4AhBahAo7axABxd/V+VgO9tjMtbd18akzRrJGGBS41FjgkKi
         Boow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YBqO8g3V;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id y188si91126oig.3.2019.07.03.02.16.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x639GPDa048484;
	Wed, 3 Jul 2019 04:16:25 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x639GPec112011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 04:16:25 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 04:16:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 04:16:25 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x639GMA5010651;
	Wed, 3 Jul 2019 04:16:23 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
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
Message-ID: <a01e9cb2-5c14-5451-156e-faf80bee74e7@ti.com>
Date: Wed, 3 Jul 2019 14:46:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <17e77e2c-5f37-4532-858d-04fab20d9ece@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=YBqO8g3V;       spf=pass
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



On 02/07/19 8:58 PM, Jan Kiszka wrote:
> On 02.07.19 16:57, Pratyush Yadav wrote:
>>
>>
>> On 02/07/19 8:12 PM, Jan Kiszka wrote:
>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>> A System Memory Management Unit(SMMU) performs a task analogous to a
>>>> CPU's MMU, translating addresses for device requests from system I/O
>>>> devices before the requests are passed into the system interconnect.
>>>>
>>>> Implement a driver for SMMU v3 that maps and unmaps memory for specifi=
ed
>>>> stream ids.
>>>>
>>>> An emulated SMMU is presented to inmates by trapping access to the MMI=
O
>>>> registers to enable stage 1 translations.=C2=A0 Accesses to the SMMU m=
emory
>>>> mapped registers are trapped and then routed to the emulated SMMU. Thi=
s
>>>> is not emulation in the sense that we fully emulate the device top to
>>>> bottom. The emulation is used to provide an interface to the SMMU that
>>>> the hypervisor can control to make sure the inmates are not doing
>>>> anything they should not. The actual translations are done by hardware=
.
>>>>
>>>> Emulation is needed because both stage 1 and stage 2 parameters are
>>>> configured in a single data structure, the stream table entry. For thi=
s
>>>> reason, the inmates can't be allowed to directly control the stream
>>>> table entries, and by extension, the stream table.
>>>>
>>>> The guest cells are assigned stream IDs in their configs and only thos=
e
>>>> assigned stream IDs can be used by the cells. There is no checking in
>>>> place to make sure two cells do not use the same stream IDs. This must
>>>> be taken care of when creating the cell configs.
>>>>
>>>> This driver is implemented based on the following assumptions:
>>>> - Running on a Little endian 64 bit core compatible with ARM v8
>>>> =C2=A0=C2=A0=C2=A0 architecture.
>>>> - SMMU supporting only AARCH64 mode.
>>>> - SMMU AARCH 64 stage 2 translation configurations are compatible with
>>>> =C2=A0=C2=A0=C2=A0 ARMv8 VMSA. So re-using the translation tables of C=
PU for SMMU.
>>>>
>>>> Work left to do:
>>>> - Route event notifications to the correct cell and identify which eve=
nt
>>>> =C2=A0=C2=A0=C2=A0 needs to go to which cell.
>>>> - Add support for IRQ and MSI routing.
>>>> - Add support for PRI queues and ATS.
>>>> - Identify which cell caused a command queue error and notify it.
>>>> - Support sub-streams.
>>>>
>>>> A lot of the work left is optional features that the SMMU provides lik=
e
>>>> substreams, ATS, PRI. There is little reason to add them unless there =
is
>>>> a use case for them.
>>>
>>> One quick question again, I already had it for the RFC round: Would it =
be tricky to split up this patch into single-stage only + 2-stage support? =
That would allow me to asses the additional complexity we import by adding =
2-stage support. Or is 2-stage support inherently coupled with the SMMU des=
ign so that such a split-up would neither make sense nor buy us anything?
>>
>> I considered splitting, but as far as I see, stage 1 and 2 are rather ti=
ghtly coupled. If you want, I can split it into two parts where part 1 is t=
he defines, data structure declarations, and initialization. Part 2 will ha=
ve stage 1 emulation and stage 2.
>=20
> If part 1 will get away without emulating/intercepting bits of the SMMU, =
I bet it will be a win.

It will.

>>
>> Let me know if you'd prefer that, and I'll send the series tomorrow. It'=
s getting late and I'm about to leave for today.
>=20
> Sure, no hurry!
>=20
>>
>>> Background is that the majority of use case I see will not need more th=
an one stage. I particular, you have no need for 2-stage support in simple =
bare-metal or RTOS cells, leaving this only potentially relevant for the ro=
ot cell (or secondary Linux cells). If the feature is complex and can be di=
sabled, we could skip it, reducing the code size.
>>
>> Hm, as far as I understand, stage 2 should be always needed because you =
need to translate from IPA to PA every time. Stage 1 could be optional if t=
he guest OS handles the scattering or gathering of the buffers. But don't y=
ou always need to translate from IPA to PA (even though in case of Jailhous=
e those translations are almost 1:1, and IPA =3D=3D PA)? When would you not=
 need stage 2?
>>
>> Anyway, most of the code is setting up the SMMU and the data structures,=
 and stage 1 emulation. Stage 2 only part is very small. Removing it won't =
save you more than 10-15 lines.
>=20
> As noted above: If eliminating guest visibility of the SMMU helps getting=
 rid of related emulation and interception logic, I'm sure it will be more =
than 10 lines. If we need 2 stages configuration-wise in order to use the S=
MMU at all, those 2 stages need to stay, of course.

Ah, I thought you meant removing stage 2 and keeping stage 1.

The SMMU can work with either or both stages enabled.

> But I'm not into the details yet, just deriving from the history on IOMMU=
 on x86 where you started with 1 stage (what we only support there so far),=
 and only later on a second one was added in order to allow guests to map h=
ardware directly while isolating it under own control (e.g. protect against=
 userspace-mapped devices). The latter is a bonus feature with use cases, t=
hough not yet in Jailhouse context.

Guest visibility of the SMMU is useful when you have a device not capable o=
f scatter-gather operations (we have some on our boards, like the video dec=
oder). They expect a contiguous buffer of memory to work. Adding stage 1 tr=
anslations eliminates the need for large contiguous buffers. Another use ca=
se is when you have a multiple PCI devices under the same cell. You could e=
asily protect memory regions of the two devices from each other with stage =
1 translations.

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
jailhouse-dev/a01e9cb2-5c14-5451-156e-faf80bee74e7%40ti.com.
For more options, visit https://groups.google.com/d/optout.
