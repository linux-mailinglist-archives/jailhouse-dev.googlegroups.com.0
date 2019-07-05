Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVUI7XUAKGQESYFPFTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id A61ED605FD
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 14:36:38 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id m14sf3678861wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 05:36:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562330198; cv=pass;
        d=google.com; s=arc-20160816;
        b=dGlAJIKktOdIkGinHaN68PbIzBfCmwuyKqya/N3pJIeNDT4hPQs1j9o7UoKp1kgBEB
         XPaAr1E8f1QgHLiOzSiGanNdyhH9dkEMJxk8JqZ57zLOo5oBcVeh0T4XR4b/lxF7MRfy
         5mjcCX5VbXpD2NhEK7S85zRCLlc1uAL/S7qvqHTw9P15NvBcPHA7QYYcLf8uitz4gNrh
         qk7K5q/+L4MPGJA6qr8z4d/uM1L1vXSYHj45KetoFmclC6nq6oMldb2Xr1zDlU0yqMUD
         LX7HK5ZEirn2eoRzcXzheNbxy9TyxUBOh7Dv0E5wHXmHIDGy1g3Q+ZHvMNlG/xYSTHS+
         5BVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=f6+M9kAA2LlWvts7RuZiVFFdwPNDuED9WDPI8WGbbtA=;
        b=MjD4fUElufTJwRwxGQNULUZJPlP2HoQbFBQhH1mNca6Quw0TdbcazCTkRu8zHZflwt
         biM3+oiOqbP76tuzjmCDnwUytZCTtllEbczauYLQwDHMD+66VpTO7pbJZf6NNsDvRLQE
         PuYua4dv6nRyudOIJYd4TITAe9p4mvkoc3ldfieTjHQbsZYd5gA31HAjTFpNAlt9CkR8
         RK4EHWpIGsHTAFqFGCeLUil+u7BoghoXNK8nszqSgVPsTRlZVfDV6ZI76vpKU0rRuWFj
         sfo56dLzZVYlLVCOB06Dt/fI5A4uqYRPzy/8DqVfYl6w8ldcYfaXhWN3kWdu3Zq0h7og
         IK5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f6+M9kAA2LlWvts7RuZiVFFdwPNDuED9WDPI8WGbbtA=;
        b=aUyBLz8JdE3k7MaYkPvH884OIKzaBXkG3QfdYzaWQ96qG3UFaj4IdS35TKkRZY6aHr
         Ay26JIq8CiDToYu3ZnmZdXp7npGevZ9w6E5cXbYW8NwSniI9wh1DLziCnntMMEv23AXL
         NHdT1uxntFmBl1niGbbKvgLwCl2HzHi6BSLh+3JIQgNHYJkhAjQSea73UcxmWGY6oa+c
         dHJSYjYUfqOICIljZ4izbyCNajLFcnUplOHFQT/1aqV+aFiZfSfCkIx3ehmQcP6gmYes
         fLnGCEAbg6cQ+hpit/2s0uV1ZgDJ+VM5YMmBLa6WzdUKGyDweJYxC5yiFVRSLRuRn5fe
         tUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f6+M9kAA2LlWvts7RuZiVFFdwPNDuED9WDPI8WGbbtA=;
        b=dRdjXiNLLdLcQCDHLTrjxbjLV270opAe8+BVuCNP6hwB/jWVd1GiDVLZhooUp8yK28
         sTcVRUGahXHbJ8HV/ERvrAa8RZTM0xDyUx0fiCtkbBq7+TZ6U4nz0vPGd9f2Lol90Ahx
         fLv8KKaXxu4YPP6u/hHnyYTuG99ONvo9Fg2Bwesrjaz59pxGaD4i2cUDX/4nsP4hHNU/
         D6fC1sw/466SA7/P2l49Xp+hlLxvCMnZFzLQgooBzFUGzAS9fjl/haA9okcBVutaTgf9
         BXu0IRUHry9kkI6d9HhxqaFma7zFQ6E9FCgruT42CUlM1e4ulleyDY7C5ejMneZv6bFQ
         tEfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUTelgUAFHK6B3vG9ZDoxUcB6W7DE+rax6oYFvYUNsQUOTAr9/s
	J1m7q+tMojmC/X7kvX2iJ8M=
X-Google-Smtp-Source: APXvYqyixh7aUv0b2nLOQVYm+/8wr3XItK17LqouMcfvloM0roEjDcFkd2wkOvGWvFXbK+StvHkGUg==
X-Received: by 2002:a05:600c:23d2:: with SMTP id p18mr3354690wmb.108.1562330198368;
        Fri, 05 Jul 2019 05:36:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c34f:: with SMTP id l15ls2613211wmj.4.gmail; Fri, 05 Jul
 2019 05:36:37 -0700 (PDT)
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr3574044wmg.164.1562330197626;
        Fri, 05 Jul 2019 05:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562330197; cv=none;
        d=google.com; s=arc-20160816;
        b=P7GbB2ukAZd57CemNGwqXGAjl+9mdL9DV99QLuA1hZXl77cZ8bYzXffBB2116J8YDZ
         THkWIUB66iOcoYDfQxiuSIXw02KRi+9S46OuQEl0AP6e6VDIoXRY+NFZ7dIZaI5dy7k0
         aOk8WIpExb8pEjVNyRFwDk4Wf1nQneoTXs1a3NHJp28tmIuQspIwylAqplXWv9y8m51T
         9+P09WGbrppqPtF9mAy5Lk0wvS6bwhKWbu4mI+cApBDAhiPQbeUJn6a3qz/hLwyoEytR
         dJ7SmMO8xUVIqm1wjZrSSNAmoYWo/C+t6nuim8bx8fRIldFUm8KF/v9oZ5vA97FbUXQ3
         Rqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uhqiXKqz47fR/huHXanTrHgHPapQQ3fdf6z3DNOrky8=;
        b=R7gH3owXGF+bGy2Ts16ff4HFq4oq50/MHxvHw4KWVrnThST49kpJaFTevQlObIyiiI
         bkSpsM2Qtw1JmiG9m6A9OYaopp4WelyghkW38LZAdcnbpPuLmogkgtbUTLqxgbrNW0fK
         fixgto3ZL6vrg6GeVfSNtakv4GpczeSjiB4WCX9YtOPOtqY66kT3QX8asnpxF6y5LJHX
         k62NE2sRvQ3uflVXjXV+iL4UtHs4jbnC5JHQIUCnswkv64mKCiDUmYMP++XLCufDlyvZ
         j/R7VQd77S8HK7yiHW+SPMt2w1rJhr5Z91N+pN1sPumjxYbnnX9KlHVJMXErb3Wspa9E
         4yFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t3si460417wrp.3.2019.07.05.05.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x65Cab0K027337
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Jul 2019 14:36:37 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x65CaZWu001730;
	Fri, 5 Jul 2019 14:36:35 +0200
Subject: Re: AMD: non-root linux inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
Date: Fri, 5 Jul 2019 14:36:35 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 05.07.19 14:34, Ralf Ramsauer wrote:
>=20
>=20
> On 7/5/19 8:55 AM, Jan Kiszka wrote:
>> On 04.07.19 22:56, Ralf Ramsauer wrote:
>>> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>>>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>>>
>>>>>
>>>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> we have some trouble starting non-root Linux on an AMD box. I alrea=
dy
>>>>>>> tried to narrow things down, but it raised several questions.
>>>>>>>
>>>>>>>
>>>>>>> The main problem is, that non-root Linux tries to write to LVT0, an=
d
>>>>>>> jailhouse crashes with:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode =
(reg 35, value
>>>>>>> 00000700)
>>>>>>>
>>>>>>>
>>>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC
>>>>>>> reads, we
>>>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this
>>>>>>> would
>>>>>>> be the issue of this bug, as that's an obvious difference between
>>>>>>> Intel
>>>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX
>>>>>>> works
>>>>>>> slightly different in these regards (side note: [1]).
>>>>>>>
>>>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I
>>>>>>> intercepted
>>>>>>> reads (by removing the present bit of the XAPIC_PAGE of the
>>>>>>> guest), and
>>>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>>>>
>>>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>>>> non-root
>>>>>>> Linux still crashes with the same error.
>>>>>>>
>>>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>>>> forwarded to the hardware, if they were intercepted. So this explai=
ns
>>>>>>> why the bug still remains. This raised another question regarding
>>>>>>> xAPIC
>>>>>>> handling on Intel:
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. O=
n Intel, we do, as we
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=
=80=A6 But why?
>>>>>>
>>>>>> It accelerates write dispatching at least. I never did the compariso=
n
>>>>>> if> using a different access scheme would be beneficial because
>>>>>> xAPIC is
>>>>>> practically dead on Intel.
>>>>>
>>>>> Hmm... The change and benchmark should be pretty easy. Once a bunch o=
f
>>>>> other issues is solved, I'll maybe have a look at this.
>>>>>
>>>>
>>>> As I said: you will optimize a legacy code path, not practically
>>>> relevant. If that will simplify the code, though, I might still be
>>>> interested :).
>>>>
>>>>>>
>>>>>>>
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to just tr=
ap on xAPIC writes on
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 Intel? This could be done by switching fr=
om APIC_ACCESS
>>>>>>> interception
>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 to simple write-only trap & emulate (page=
 faults).
>>>>>>>
>>>>>>> However, back to the initial issue. Looks like the difference betwe=
en
>>>>>>> Intel and AMD boot is as follows.
>>>>>>>
>>>>>>> AMD:
>>>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical fla=
t.
>>>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>>>
>>>>>>> Intel:
>>>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical fla=
t.
>>>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>>>
>>>>>>>
>>>>>>> This is why the above-mentioned Jailhouse crash occurs. I tried to
>>>>>>> find
>>>>>>> out why Linux takes this decision on AMD. Our victim is in
>>>>>>> apic.c:1587.
>>>>>>>
>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>> AMD it
>>>>>>> is 0. This is why we take a different path.
>>>>>>>
>>>>>>> Now the question is simple -- why? :-)
>>>>>>>
>>>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anythi=
ng
>>>>>>> else odd?
>>>>>>
>>>>>> Yes, the ExtINT makes no sense for secondary cells, and it should al=
so
>>>>>> not be needed for primary ones. Let's dig deeper:
>>>>>>
>>>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enab=
led ExtINT on CPU#%d\n", cpu);
>>>>>>
>>>>>> What are the values here, and which are different?
>>>>>
>>>>> As already mentioned above, only value differs:
>>>>>
>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AM=
D
>>>>>>> it is 0. This is why we take a different path.
>>>>>
>>>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>>>
>>>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before that.
>>>> Can't be Jailhouse: we hand it over masked.
>>>
>>> Yes, I checked this. Actually we do. But...
>>>
>>> When the cell is created after jailhouse is enabled, apic_clear() will
>>> be called when the SIPI is received. There, I added some
>>> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>>>
>>> In addition to that, I instrumented the linux-loader. There, I read bac=
k
>>> LVT0. Very early, before we hand over to Linux. No one else touches LVT=
0
>>> in the meanwhile. I would see any other guest access as interceptions
>>> are instrumented (both, read and write).
>>>
>>> So in the linux-loader, the read back causes a vmexit, and I read back
>>> 0x0.=C2=A0 That's really strange, there is - afaict - no other access i=
n the
>>> meanwhile.
>>>
>>> I don't know what's going on there. I don't see any other modifications
>>> of LVT registers in code paths other than apic_clear().
>>
>> Maybe you can lift the setup into KVM and check if you can reproduce
>> there as well. That will allow to track down the other access that does
>> the enabling. It shouldn't be possible that the hardware does that on
>> its own.
>=20
> Tried to run Jailhouse on QEMU on a AMD machine with nested KVM.
>=20
> I currently see no way to test this on qemu, as Jailhouse seems to be
> pretty unstable. We horribly crash in many situations on kvm:
>=20
>   - High chance of freezes when enabling jailhouse
>   - I loose devices if I don't reroute interrupts to CPU0 before I
>     create cells
>   - cell destroy doesn't work. We freeze and after a while: "Ignoring NMI
>     IPI to CPU 1"
>   - Starting causes exceptions inside jailhouse
>=20
> So Jailhouse definitely runs more stable on bare-metal than on qemu/SVM.
> I need to find another way to debug this.

OK...

Next strategy: Frequent read-back and validation of the APIC state. That ma=
y=20
help to narrow down the point where the bit flips. Make sure you read on th=
e=20
right CPU, tough.

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
jailhouse-dev/36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
