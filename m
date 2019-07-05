Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2UH7XUAKGQER2ABURI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id B3824605F9
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 14:34:50 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id o13sf5586065edt.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 05:34:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562330090; cv=pass;
        d=google.com; s=arc-20160816;
        b=YzsmrX6pNoyljiVVOZkDVkdLdlaJGs5B3nciqJLkD4SNEQ177pSwSumRl/LcRmxQj7
         rNx6x0RSvtqG2zy6N7qxMW3WiNYb0wtpRGtrfbVwDO/CgxZPO7S6EX/9azh6jcZLxl9D
         yAmEyVr50jrP08kVeeHVJfAY4AF2WFWu7y4DYUVsxy0uVmDr0bKq3ezJbp1MuUDx/UT7
         X9JGszlghMivUp4rNsx5cBbxMf8AKT4jxHLM+xqVht4rCNUYtI+R6kFNDAKsDcLX0/R4
         4fBrYrAjS71wlxhJOZYRhCLWXIzt2OEnpWwdeRRTSZrBKy5653EG//aIsP2mh8fDpjMv
         +vsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=mrzFXhrufgjB1D7+rlOpgd6fsbuiHSjoPKQITgR/GfM=;
        b=wn5dbKo0+/b4fcMP2axF/PfVTVCHxJe/L+SJfEUpq7wx5uC0VJr0zHPuSXhvyKa/BM
         jKM/jZHCoC8p33oWBcPatYUThcWJ5mcLmYIvrQJdVxVRFyhEFcsKw5I5ewlFveTbr8WJ
         gwU/fSCeesRcWQEa+lBZR3nICiOP7XdfnOfjFhkuUtcS+OxAP8YLLQ9PFCDeiPodZit7
         nxgf4aOK9847R5rNcrXZ18NC7nE2Ph1QNpvoR0bCHombLoCo4AH9OzNttN8K0kfNx6jS
         ckmcG01MonYjkJ61KgAXLWa18ALo6HkphpdJSd3D9v5HRALsWaFL/ZVz+0bcxopqIe32
         NaSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=k5wuPjBc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mrzFXhrufgjB1D7+rlOpgd6fsbuiHSjoPKQITgR/GfM=;
        b=ldhMr60x9eq6e8a3P0WAMrBRtt1JUHN2PRhGqHERHY4wD4G+tH52+O483Ykkscqbct
         ttF66CX7Vg6AMloBL7zrNVsPnUsRc9CcRioBsgeF67c3KfpPWplIx1hlAsoNonnheaGc
         0ZBHk9wXpgyg0Z9PnvhdqCwi4zLJ8ZI2gZ0ZEY9JRcyrn+jUPlCVqdZ1tONjD//EhS1P
         YhHH38I2pd37dKOWqlHVqFjr9bX90bB1PNGYHPYjzGfFA43o0IZYB1MoPxEL7czvwsCX
         6cKRk9d7lIvONguLoqf/aRBHsJLdv5rXfCx9HPawXCOy5iOXsSZItLXAgANSw4Kz+qbS
         uqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mrzFXhrufgjB1D7+rlOpgd6fsbuiHSjoPKQITgR/GfM=;
        b=VaZfB8/x8suKFYirAZDgU69bfHNFqmdnGgCNFna7a2nn8GmvtHq11pgAgamAhFUS5o
         Y13JGdgZVLVF1h4o2Wd5Inb2Rdun8GBmOqqBrVfsNOzyV4GoWco5I0kuECHkjQckL+y6
         mkh31lxXfjG5Cs56W6PXizfaNhKVo0jERvEOfe23rM/w9ibXC1FykXNkt7+ptr7gK0ue
         esygr3m1jTcZOXXITfAlCDnk/YU3BGkYpErXTuwhTha6AfYzHcFNGXVxqeAVOAYtJRRi
         /hrUyQcW3y1h5vlrBS7KNzfFN0pQwf/0XL1lSyEEVRlTju6+t11Ory7H2DeXalhxS55S
         35lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUCo5cRz8iydsxyBPnqekkz0H7qnJ3eZyJ9UHw+ilkNd3xyNlJu
	MJxykUrZ+pA9LTRQPLQ/dSQ=
X-Google-Smtp-Source: APXvYqwZ5hg8JXPwzjMkQyxzr/GnEk9r5t628wIGQ3fecFfK2S3k3tuqZkRd2IQxLXFSuDE7rIfe4A==
X-Received: by 2002:a50:d1c6:: with SMTP id i6mr4173244edg.110.1562330090460;
        Fri, 05 Jul 2019 05:34:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5141:: with SMTP id s1ls2166211ejl.9.gmail; Fri, 05
 Jul 2019 05:34:49 -0700 (PDT)
X-Received: by 2002:a17:906:4e92:: with SMTP id v18mr3403909eju.57.1562330089866;
        Fri, 05 Jul 2019 05:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562330089; cv=none;
        d=google.com; s=arc-20160816;
        b=XxGhnoiz7Y6ybQFw3P3CrAcSfY2B5/5nxy4URj9/MlSfC9w3rLCDOVDZU43X/4+T2b
         uOegd+xw7LE2RRVsNFtd0uZagDq3ZeTc6LCpx5wPmfJu1czPlVzr20ahjPZDLuAAUnaH
         AlPb3oOoxVM2ojOe2ZwiUlopUXo73AirbSkg1lOYPGnVYKKGKHOIWXesNNFSy91IuhHB
         obiMw03G2IEykoiWI9mWTXUvqRY/bdvqkfCM/+KXjAO+WNwW6ImnndY2UuYJKizKzijS
         DqrRjyVIOc6NRCUMiZ+qn832JSIQUGJLQ54uchrzxFqWsIsv4e1Kqg/WVl9bmWuxtYor
         mNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=2aLdJK/7irETyfJFslcO3OsDKWpD+AXaJEpP+CSZPk4=;
        b=x0Cp5idguLmbEosF877WDCiRyDknKkde8yfPliUmlXLwO8jeam1QsSgnXoRGXWtAp6
         OrflPiaOt+/4RQRj8iqn8FWy3SdJR098o4KUxqSXF1CHm8BvvH4z09qSi9QpFvV8QVIo
         k03HCv9qJYYd+h/Y6l8Ch8UltzUmru9hGMJ7rlWVSp0sIGjCWclzP4tR/vR99KWp2c8g
         H0sB42PwCHI5mHRQPwcHtUyv6hNTNZ3xChYpK4zKHXStPl1W64iuLV1aGRiWLpdK7yMD
         FlGjypCU/mcEMylZAdJMG2bQxK7gGM8U0zMA0WaGLbDGwmnpZuFWE0wSbk7RLIAU9jNo
         8CvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=k5wuPjBc;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k51si616660edd.0.2019.07.05.05.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gDnP2Trrzxvw;
	Fri,  5 Jul 2019 14:34:49 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 14:34:49 +0200
Subject: Re: AMD: non-root linux inmates
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
Date: Fri, 5 Jul 2019 14:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=k5wuPjBc;
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



On 7/5/19 8:55 AM, Jan Kiszka wrote:
> On 04.07.19 22:56, Ralf Ramsauer wrote:
>> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>>
>>>>
>>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>>> Hi,
>>>>>>
>>>>>> we have some trouble starting non-root Linux on an AMD box. I alread=
y
>>>>>> tried to narrow things down, but it raised several questions.
>>>>>>
>>>>>>
>>>>>> The main problem is, that non-root Linux tries to write to LVT0, and
>>>>>> jailhouse crashes with:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode (r=
eg 35, value
>>>>>> 00000700)
>>>>>>
>>>>>>
>>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC
>>>>>> reads, we
>>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this
>>>>>> would
>>>>>> be the issue of this bug, as that's an obvious difference between
>>>>>> Intel
>>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX
>>>>>> works
>>>>>> slightly different in these regards (side note: [1]).
>>>>>>
>>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I
>>>>>> intercepted
>>>>>> reads (by removing the present bit of the XAPIC_PAGE of the
>>>>>> guest), and
>>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>>>
>>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>>> non-root
>>>>>> Linux still crashes with the same error.
>>>>>>
>>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>>> forwarded to the hardware, if they were intercepted. So this explain=
s
>>>>>> why the bug still remains. This raised another question regarding
>>>>>> xAPIC
>>>>>> handling on Intel:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. On =
Intel, we do, as we
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=80=
=A6 But why?
>>>>>
>>>>> It accelerates write dispatching at least. I never did the comparison
>>>>> if> using a different access scheme would be beneficial because
>>>>> xAPIC is
>>>>> practically dead on Intel.
>>>>
>>>> Hmm... The change and benchmark should be pretty easy. Once a bunch of
>>>> other issues is solved, I'll maybe have a look at this.
>>>>
>>>
>>> As I said: you will optimize a legacy code path, not practically
>>> relevant. If that will simplify the code, though, I might still be
>>> interested :).
>>>
>>>>>
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to just trap=
 on xAPIC writes on
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Intel? This could be done by switching from=
 APIC_ACCESS
>>>>>> interception
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 to simple write-only trap & emulate (page f=
aults).
>>>>>>
>>>>>> However, back to the initial issue. Looks like the difference betwee=
n
>>>>>> Intel and AMD boot is as follows.
>>>>>>
>>>>>> AMD:
>>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical flat=
.
>>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>>
>>>>>> Intel:
>>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical flat=
.
>>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>>
>>>>>>
>>>>>> This is why the above-mentioned Jailhouse crash occurs. I tried to
>>>>>> find
>>>>>> out why Linux takes this decision on AMD. Our victim is in
>>>>>> apic.c:1587.
>>>>>>
>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>> AMD it
>>>>>> is 0. This is why we take a different path.
>>>>>>
>>>>>> Now the question is simple -- why? :-)
>>>>>>
>>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anythin=
g
>>>>>> else odd?
>>>>>
>>>>> Yes, the ExtINT makes no sense for secondary cells, and it should als=
o
>>>>> not be needed for primary ones. Let's dig deeper:
>>>>>
>>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enable=
d ExtINT on CPU#%d\n", cpu);
>>>>>
>>>>> What are the values here, and which are different?
>>>>
>>>> As already mentioned above, only value differs:
>>>>
>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD
>>>>>> it is 0. This is why we take a different path.
>>>>
>>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>>
>>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before that.
>>> Can't be Jailhouse: we hand it over masked.
>>
>> Yes, I checked this. Actually we do. But...
>>
>> When the cell is created after jailhouse is enabled, apic_clear() will
>> be called when the SIPI is received. There, I added some
>> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>>
>> In addition to that, I instrumented the linux-loader. There, I read back
>> LVT0. Very early, before we hand over to Linux. No one else touches LVT0
>> in the meanwhile. I would see any other guest access as interceptions
>> are instrumented (both, read and write).
>>
>> So in the linux-loader, the read back causes a vmexit, and I read back
>> 0x0.=C2=A0 That's really strange, there is - afaict - no other access in=
 the
>> meanwhile.
>>
>> I don't know what's going on there. I don't see any other modifications
>> of LVT registers in code paths other than apic_clear().
>=20
> Maybe you can lift the setup into KVM and check if you can reproduce
> there as well. That will allow to track down the other access that does
> the enabling. It shouldn't be possible that the hardware does that on
> its own.

Tried to run Jailhouse on QEMU on a AMD machine with nested KVM.

I currently see no way to test this on qemu, as Jailhouse seems to be
pretty unstable. We horribly crash in many situations on kvm:

 - High chance of freezes when enabling jailhouse
 - I loose devices if I don't reroute interrupts to CPU0 before I
   create cells
 - cell destroy doesn't work. We freeze and after a while: "Ignoring NMI
   IPI to CPU 1"
 - Starting causes exceptions inside jailhouse

So Jailhouse definitely runs more stable on bare-metal than on qemu/SVM.
I need to find another way to debug this.

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/08841e36-df70-50e8-8094-426d72fead52%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
