Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXMWUPUAKGQEA4PURFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C249F36
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 13:30:40 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id b1sf5716325wru.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 04:30:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560857438; cv=pass;
        d=google.com; s=arc-20160816;
        b=pB871ci95liA0SxMXXdxJ3mTau43XfOQe+u3JFWg7WbffMeqpmSaKMINXAoWLA0zA7
         Qp7SNhuQgBzyI70O2gMWjC2ZXy/Faq9t6DL575OQMxdpVrm799XJ0ZqaWCDnFJDcYb1z
         dWPnPifGHpw1YHzv4C7rxkh+uXXhjzpsoZQs64NjfRyh2qnf0z7FBmGqQFYNo3f6Zki5
         rkEV/gaLOhZ4g4cr5JK3k94HNR3Wpk8hOLlkevZR71slK89iktDcsosa0sdUUjdlNRbN
         PiemeDlV1SuxlKPQKsou1Ucr0k8IfINiFxqZR1ghzFpNK8lV/FEJ/V1coVzBSHNAggxX
         xx4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:cc:from:references:to:subject:sender
         :dkim-signature;
        bh=gEmbGLuXLmixkxfeWgZZYhj20cBe1sOdblNPeaDOz74=;
        b=ZVJvCOOKn9IL0yHqYLGsY/23bBLQukHt/PQwg3xwX6NGc6VvFfnIN4Bs3pb+ppevwZ
         pY8j2WcMoArCDaJkz5eo6inReT3IgG040XL0o6Up0XTcSyX6AGWA/30/VkkT2MYDc4T+
         9BWakN+UVlkv4fHjocwkfjOqhDgCVqwyFCsEKmpIHv0SCGZSXd3GSsKsKazY2rISo/Fv
         fO8F7V2TTS6aVc30bpDeBdtgxtBSzzuxcHhbcONDYba79FmwNKz64hoiWw3bYUjxm3MC
         BsHTWNHYBfeCPBeYb4e4EA5qjAYZ6bMDZfHMnMnsENtSdwUBoFyNkQXquDMTYwonTOH2
         SRbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EvRyzFxS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:cc:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gEmbGLuXLmixkxfeWgZZYhj20cBe1sOdblNPeaDOz74=;
        b=hzWFVX31fz/kRkvFX7qe9R1+DGh5JdAYjNdtgK8eQZdQFftTBalhwR5kNTS119+6e/
         gHqL2JmZDFBaoLlOHz//wHPZPsWOjOj2FUa0IO6bYgI48t8pb6sQub7wv8JWPW8J79Ut
         Lz/nx7yTygs/6GOhUhqpB/TtQq8SJo1fHiysl8zeodwbhO1XTmpXpkTyt/MWA/UqsymF
         OnEP5MUlSlYrisUOEBXnYM2ZNlKjUiGs7LVdzZDDh7/fkLoRO4FRy6AXJR3T1xlprF2A
         por4PdVZfFjf1tmNszHfbDw8J6TJY/dCo+E0c0A0ukMDHlKWz5s6vu64uQRsRmZhFy6i
         KseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:cc:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gEmbGLuXLmixkxfeWgZZYhj20cBe1sOdblNPeaDOz74=;
        b=B37qUnGIQSpr/LiGV9Ai3aciBRQiRqgHn77OHiG/zy5WA24Vyj7mKtMuDUI+CRXJCk
         3nSlUl2I0T29frkFmg5t1Jq3e8Uf3+WujJN5BUsBE/iik1eoU0P7KOHpEHCvedYOnMls
         /7qDJ4LGDGk0u8jK11/votXZfaC/FR3E3esPdJfZCpBWI5DorUq7EnkVIUtPY7wREVxw
         yrZU5lMp+Om+e2+EkwfxNldt04morMcabPewnbsgTgwlF9MFB/+qrfFd8Cgmqs1LshrE
         /Bmb/5tlpzLxY3CnTnp7P96ANhts+NRV6Bt8LRDVK4JJNV1g+8jorLLzk4cAZ6hBq3DX
         XwoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUC9HycLycGJ5jjJ9Mj7B0GwQhsJIxyGrIYhiXGWsCYDM845+EF
	0FT5NjGS2guskytk4Wda/uE=
X-Google-Smtp-Source: APXvYqwnqx7Z8lDyCAT452SuZ2FFONrXlo0o52Y7ogYdNg9LH+BDXOhrk5hC7/hjQ1g/N83BSzAbIA==
X-Received: by 2002:a1c:b684:: with SMTP id g126mr3146705wmf.176.1560857437499;
        Tue, 18 Jun 2019 04:30:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e844:: with SMTP id d4ls4696252wrn.7.gmail; Tue, 18 Jun
 2019 04:30:36 -0700 (PDT)
X-Received: by 2002:adf:c614:: with SMTP id n20mr23387119wrg.17.1560857436771;
        Tue, 18 Jun 2019 04:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560857436; cv=none;
        d=google.com; s=arc-20160816;
        b=eQmJu+nTCMX9OXKCbQek9rb27Shh514yq0XtUzPvhCh/eC8mKaP25OklW1bCh9b5xf
         HkvZCvEVj7qYmU/a8r9RWBtjl9RbeXLFZOfJ3q8WCwG95HecqyNsrBIsXebG1nIvhm8M
         t+WR2cy9x+xhvgA84Gg787o+0VzEKm11yk1hH+i2ZxIK1DNnyFVwsK6yKWbQ1PQz9I50
         I8GVuZwlCWfENK54Do7eKbA1ypXjW/yxrZXu+3jG+YtTZ4qmJw3BR3raW1wyXL+e7QlA
         PT+OFjmusKUb7rVKaATSzPx/wMyFXroiDfcci923Ch+ggh+PxgyAyauOV3OGwV9VepTO
         lsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:cc:from:references:to:subject
         :dkim-signature;
        bh=OzkL2PvEbRcBCKH19f+1y60ThaLChYNUSb3p1h5o9DM=;
        b=gVTQeHep+kbOdHz90ygnGSvoMPxNuP7zHl7azm3eUtbzlO4qjmiTv2vqDs3x1SbGV/
         qwyYofhxoV3nmbSYddXE+luk6NBRDli9JRf7yvBaC7qL0GHvKQYNaE/QKyzDf5B6w9i3
         h4OQd2BvBcVWc8YXOSmLpm2ZHQS26/cEG5Wrlj1grpuzh/AdnSsCys6HzSVXjVoRFTwy
         UZcwLc0Uztnvd0/XxaveHCIlIPyfhE4luE9TV4AzNp6zWUMpa7rSyy9AkvV/CVVLLZRF
         QTFlTNWg7FwaCqq8PSElpL5z5Tdcy2I/TYylbmFEh8XXEXbIH+5tDfjINPhP8h+gEKRx
         UitQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EvRyzFxS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f83si64674wme.2.2019.06.18.04.30.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 04:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45Sm982TZLzyH8;
	Tue, 18 Jun 2019 13:30:36 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 18 Jun
 2019 13:30:36 +0200
Subject: Re: Finalizing 0.11
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
 <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
 <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
 <464227aa-f75a-9823-772c-de19242e8576@oth-regensburg.de>
 <159a6d4d-cde4-cd0d-48cb-20be69fca730@siemens.com>
 <cac410c5-4a74-b77b-508c-210f69b14498@oth-regensburg.de>
 <f04f3f96-921b-67c4-2e64-1939d4f04339@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: Mario Mintel <mario.mintel@st.oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <5a83cab4-f342-8e08-7c34-928cfa60272d@oth-regensburg.de>
Date: Tue, 18 Jun 2019 13:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f04f3f96-921b-67c4-2e64-1939d4f04339@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=EvRyzFxS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

On 6/17/19 6:04 PM, Jan Kiszka wrote:
> On 17.06.19 16:14, Ralf Ramsauer wrote:
>> Hi Jan,
>>
>> On 6/17/19 12:47 PM, Jan Kiszka wrote:
>>> On 17.06.19 12:18, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 6/17/19 12:15 PM, Jan Kiszka wrote:
>>>>> On 17.06.19 12:11, Ralf Ramsauer wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On 6/17/19 9:49 AM, Jan Kiszka wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> by the end of this week, I'd like to tag a new release. If you have
>>>>>>> anything pending that should be included, make sure to post it
>>>>>>> soon. My
>>>>>>> integration queue is empty, so also let me know if I missed
>>>>>>> something.
>>>>>>
>>>>>> Andrej still has two patches in his queue, but they're not
>>>>>> necessarily
>>>>>> required for v0.11.
>>>>>>
>>>>>> There's still the MSR bitmap issue on AMD64. Valentine didn't respon=
d
>>>>>> yet, I'll have a look at that soon, it's an open issue that should b=
e
>>>>>> fixed.
>>>>>
>>>>> Let me look into that.
>>>>
>>>> Ok. (Maybe that could also be the issue why apic-demo shows implausibl=
e
>>>> timings on amd64)
>>>>
>>>
>>> Followed up on that thread. Should be quickly resolvable.
>>>
>>>>>
>>>>>>
>>>>>> Other than that, I'm in the meanwhile pretty sure that there's
>>>>>> something
>>>>>> odd with VT-d, but I can't yet tell what it is exactly.
>>>>>
>>>>> Do you need me to write an instrumentation patch?
>>>>
>>>> Maybe. Let me try some other things I wanted to test last week.
>>>> Otherwise I'll return to you.
>>>>
>>>
>>> FWIW, please try this nevertheless:
>>>
>>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>>> index 1cae0dcb..110184fa 100644
>>> --- a/hypervisor/arch/x86/vtd.c
>>> +++ b/hypervisor/arch/x86/vtd.c
>>> @@ -567,6 +567,7 @@ static void vtd_update_irte(unsigned int index,
>>> union vtd_irte content)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *reg_base =3D dmar_reg_base;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int n;
>>> =C2=A0 +printk("%s: index %d, present %d, content %016llx %016llx\n",
>>> __func__, index, content.field.p, content.raw[0], content.raw[1]);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (content.field.p) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Write up=
per half first to preserve non-presence.
>>> @@ -824,6 +825,7 @@ int iommu_map_interrupt(struct cell *cell, u16
>>> device_id, unsigned int vector,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union vtd_irte irte;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int base_index;
>>> =C2=A0 +printk("%s: device %04x, vector %d, irq_msg %016llx\n", __func_=
_,
>>> device_id, vector, *(u64 *)&irq_msg);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base_index =3D vtd_find_int_remap_region=
(device_id);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (base_index < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return base_inde=
x;
>>
>> Please find the hypervisor log and the sysconfig attached. Just for
>> completeness, some other useful stuff is attached, including the output
>> of jailhouse config collect.
>>
>> One remark to the Jailhouse output in console.txt:
>>
>> Everything looks unsuspicious until we add PCI device b3:00.0 that needs
>> to reserve 97(!) interrupts.
>=20
> Well, that's likely what this thing could potentially use, based on its
> MSI-X vector limit (unless we have a bug in reading that from the
> hardware -> config generator).
>=20
>>
>> This is the point where instrumentation starts to output:
>>
>> iommu_map_interrupt: device 0400, vector 3, irq_msg 0001080000002822
>> vtd_update_irte: index 109, present 0, content 0000000000000100
>> 0000000000000400
Short intermediate analysis:

The first non-present device is non-present as !irq_msg.valid. irq_msg
is passed via arch_pci_update_msix_vector and comes from
x86_pci_translate_msi. Inside x86_pci_translate_msi,
iommu_cell_emulates_ir(device->cell) is true, so we call
iommu_get_remapped_root_int.

Inside iommu_get_remapper_interrupt, irq_msg.valid will be set to zero
in vtd.c:803:

        irq_msg.valid =3D
                (root_irte.field.p && root_irte.field.sid =3D=3D device_id)=
;

This is the cause why in the end the present bit of the irte entry is
zero. And here it's getting hot:

  root_irte.field.p: 1
  root_irte.field.sid: 401
  devid: 400

Hmm. Either devid or sid is wrong. Let's skip a few messages and look at
the other non-present entries. Same code path.

  root_irte.field.p: 1
  root_irte.field.sid: 400
  devid: 401

400 and 401 are two phys of the same network card. Someone twists things.

Still not finished debugging, but this seems to be the root cause.

  Ralf

>>
>> The hypervisor stucks for a moment when printing those lines. In sum, it
>> takes a few seconds for Jailhouse to enable.
>>
>> b3:00.0 is a megaraid/megasas standard raid controller, 04:00.0 and
>> 04:00.1 (0x400, 0x401) are the Broadcom network devices that we loose.
>>
>=20
> Let's pick the first:
>=20
> VT-d fault event reported by IOMMU 3:
> =C2=A0Source Identifier (bus:dev.func): 04:00.1
> =C2=A0Fault Reason: 0x22 Fault Info: 1f000000000 Type 0
>=20
> Interestingly, we program not a single present IRTE for that device. So
> the next thing to check is why that is the case, e.g. what happens betwee=
n
>=20
> iommu_map_interrupt: device 0401, vector 0, irq_msg 0001004000002822
>=20
> and
>=20
> vtd_update_irte: index 123, present 0, content 0000000000000100
> 0000000000000401
>=20
>>>
>>> Should list the IRTE entries that are written or invalidated. When
>>> matching their number and device ID against the fault later on, we may
>>> see clearer. If not, we may need to go up further in the call chain, to
>>> the callers of iommu_map_interrupt.
>>
>> After Jailhouse is enabled, and after the VT-d faults occur, we receive
>> a couple of those lines
>>
>> vtd_update_irte: index 16, present 1, content 000100100022010d
>> 000000000004f0f8
>> iommu_map_interrupt: device f0f8, vector 16, irq_msg 0001001000006822
>>
>> on every key press of the serial line.
>=20
> There is probably some mask/unmask going on that we see when it hits the
> virtualized registers.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5a83cab4-f342-8e08-7c34-928cfa60272d%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
