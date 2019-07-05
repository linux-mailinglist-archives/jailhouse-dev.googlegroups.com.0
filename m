Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2PI7PUAKGQEDC5UKJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E066012F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 08:55:38 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id b12sf5027912eds.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 23:55:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562309738; cv=pass;
        d=google.com; s=arc-20160816;
        b=yZNWypE93DEFi7JxPfFj83rUX2J88AtXpnt93IY7tmb6WkPScRmx6Q104fMAF0XJiF
         mYOwjdYYgI6hxokinEWXJ71AatpKobMNauAE/qQH1S106WmJShf73tbtScPjBrTSjB7p
         VA0wOtKvziavzq/LUPE8Mh8UxeCL/7BMvfKQqRkIv7dBx4pmaoSk1Vw9rcgzFxgW3NFT
         XE0dfJScJKki8zL5YrGwx0Gd1ZcdMxIkKaaKn4Sgc1lvSkKJsv5oopMXy7LBugXta16r
         ghAcFxp80ztjNK0TbOdmAVVdsaIlDeik1chGuaohwbq+y5UxW7x7bbRH/KWCJzSWO2CU
         2m5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=+ADY/edQjkoocsUlhV9AkbFoYwOHUQ0MdXNeIN1c8UU=;
        b=p0ob4i9rYEee1+fRYZmYlF9c6JiutBNszXcR62LCSzE1WbF54s5RVgA5O32UVmUTYn
         TinkR6RQrypxJ8bHrJdRWnN96IBoRWIl25+8M9t1kAeM6BP3FZ9KB+akamqw+lYoCAKF
         Xp7uS4dMlqaiHGyMG8+gCRASXIDXQscISJaka1U3cfuddIaMltz/XzqSevR13S2X2AJ4
         VUjDQx4aTFl8rQqmZvuITS5k684ryYI0Hi9ycvgUy6WMy7z/brre5QES1XUMQX49JldJ
         eWbMxKzriwThgZV/iHqzOfubW8K/WzyMasMgnuqX773v1oD5GhOXpkuVtA2R7DJ5/pOD
         uQqA==
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
        bh=+ADY/edQjkoocsUlhV9AkbFoYwOHUQ0MdXNeIN1c8UU=;
        b=DUlJmjsHVSXKKQ5TGyo68Lz/NYgeOyWXFaXeHSlOEE53e46/Z9O4WBzfRoENpvthjb
         7lqGGKeVE7fCam8nry0JwTRbjqxpnroyX7KJ8SHqWjy6HIiIgQ1NVogijv0topsX+lux
         /JwJV0zMGmVLW5ue5aNRb+hdiOMZBTkvJ2SOS+8MLCqXEYtKyyswu2aDDVQO/kR0nQ4N
         DvcZBZMqpmX35UZP6KOexbLbcO+tAqS1ITQULQmiITDgTDFHKXVC6mfdxmcS+CwXJMCH
         w/YNlXKS8gS/A8Nxyok2RR24aYWEOS/xW8J0kJ/ibHnKjIqCemlMwnBqYwk144n3wzTn
         Uq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+ADY/edQjkoocsUlhV9AkbFoYwOHUQ0MdXNeIN1c8UU=;
        b=lsapwfgNPREOBkkTJDmMWdmbeEuzLexqBtglvpyYfr17/9tbrgTHKFYemQXykw0eqj
         XbylmClMQ8P219YOdWKLeiVG22LrWCGn5Fnf0cMrZzzsdi32Ypnw00rJh9D99cHImnLh
         1OCxgFF+lnhwBtCwUGf2yhf/ItZ21idX0l34Lt3Ybw1LELbGOHRWlCKOw21i3kaXmfIB
         xzL3/fs6zd0T0iSpxlpMpxyxaAvCPqXdwjNK/6HMyLmo5knbgfdDHls1mdKNxWhXshGM
         tJxxHbwYVZAxb5fA7BegS3D5rNg3YVHAMGCLQ33iySnidDDuFC0hALADL/BDWQ/cFv+4
         sZsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsMQ3UD1ToGwBOezYBLa9DWLRFHhT4NcYa1QIAqKVbx6mybTGR
	T/Tjd9sPMyDEPNStjRM4290=
X-Google-Smtp-Source: APXvYqxc4f0hRV2Mcvz9UTFHuJSujeNqUmNSrZwFFkmK9yD1113wCt4+dyDg/rWLG8QBFB9dKLwH1Q==
X-Received: by 2002:a50:89a6:: with SMTP id g35mr2728467edg.145.1562309738047;
        Thu, 04 Jul 2019 23:55:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f4c3:: with SMTP id v3ls2340772edm.11.gmail; Thu, 04 Jul
 2019 23:55:37 -0700 (PDT)
X-Received: by 2002:a50:eb0b:: with SMTP id y11mr2664121edp.224.1562309737510;
        Thu, 04 Jul 2019 23:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562309737; cv=none;
        d=google.com; s=arc-20160816;
        b=zcJitp5wNjU3r+xUWvuVEnHkOTpI5t1d5uxkiNcw7eOtbuyyKrTCb7dFbP/FWcUhwr
         lkDhou7pdrfFI08I41fsYRailk7j6I7X4jge55wIz3CTP/G/gnaPIk37qJczkrEqYmY7
         6Wxh4+WscNt26JCs8afEycErkDue0XyVB2M0t3Uff5syR+4WjEsCkswD03T7QKz0yuMf
         3ZEwXP6N2OeAUh7KEAi/6W20JivTXTeQXkYB1LeqOETFn8XLGAxU172ficF8l3kISr8n
         AOAl3hJPuEhXY73FCSAnNnidpOHmNe0kTIHr3hQGUjRygf2uITW5elEuMt/iw2T0ruIF
         kgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=hZkQ1f2srGseZL6xykQm+NUBor4y6GRkJ+lGnSj4TRQ=;
        b=Om8043UBEM6wjB/gSpHGC2BeEQO4vCpyn3XpIAsr6W5V7xC5Vz/oJ39hVhoXbPXF8w
         oabfn2YXxq/EqsMRPwb8fR05RaPWNVrVdtMfLVItiVHLwDbkAFUXavywN2REULqK5vAw
         JPY1pYBMZtxrW6fnPlkqOw2ALys8T7U7lXi3tJTnKZWxbjfxvtt1t2qpNBZyKXiY2hWn
         7XdVARv06VH7TNaZMvcvO6J5sLEqfcky1icyetLRVe87Hh7xW03UVjsoMKjiYZmsoQEH
         kTny3gMidsxvFbRGD+HUDZy//512+eXPVdRWqyISTrLt3RHoq7WDKq1VP5JrxXOsd/3P
         flpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a41si425280edc.5.2019.07.04.23.55.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 23:55:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x656tbFS020809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Jul 2019 08:55:37 +0200
Received: from [167.87.21.124] ([167.87.21.124])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x656tach016997;
	Fri, 5 Jul 2019 08:55:36 +0200
Subject: Re: AMD: non-root linux inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
Date: Fri, 5 Jul 2019 08:55:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
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

On 04.07.19 22:56, Ralf Ramsauer wrote:
> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>
>>>
>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>> Hi,
>>>>>
>>>>> we have some trouble starting non-root Linux on an AMD box. I already
>>>>> tried to narrow things down, but it raised several questions.
>>>>>
>>>>>
>>>>> The main problem is, that non-root Linux tries to write to LVT0, and
>>>>> jailhouse crashes with:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode (reg 35,=
 value 00000700)
>>>>>
>>>>>
>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC reads, w=
e
>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this woul=
d
>>>>> be the issue of this bug, as that's an obvious difference between Int=
el
>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX work=
s
>>>>> slightly different in these regards (side note: [1]).
>>>>>
>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I intercepte=
d
>>>>> reads (by removing the present bit of the XAPIC_PAGE of the guest), a=
nd
>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>>
>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>> non-root
>>>>> Linux still crashes with the same error.
>>>>>
>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>> forwarded to the hardware, if they were intercepted. So this explains
>>>>> why the bug still remains. This raised another question regarding xAP=
IC
>>>>> handling on Intel:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. On Intel,=
 we do, as we
>>>>>  =C2=A0=C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=80=A6 But=
 why?
>>>>
>>>> It accelerates write dispatching at least. I never did the comparison
>>>> if> using a different access scheme would be beneficial because xAPIC =
is
>>>> practically dead on Intel.
>>>
>>> Hmm... The change and benchmark should be pretty easy. Once a bunch of
>>> other issues is solved, I'll maybe have a look at this.
>>>
>>
>> As I said: you will optimize a legacy code path, not practically
>> relevant. If that will simplify the code, though, I might still be
>> interested :).
>>
>>>>
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to just trap on xA=
PIC writes on
>>>>>  =C2=A0=C2=A0=C2=A0 Intel? This could be done by switching from APIC_=
ACCESS
>>>>> interception
>>>>>  =C2=A0=C2=A0=C2=A0 to simple write-only trap & emulate (page faults)=
.
>>>>>
>>>>> However, back to the initial issue. Looks like the difference between
>>>>> Intel and AMD boot is as follows.
>>>>>
>>>>> AMD:
>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical flat.
>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>
>>>>> Intel:
>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical flat.
>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>
>>>>>
>>>>> This is why the above-mentioned Jailhouse crash occurs. I tried to fi=
nd
>>>>> out why Linux takes this decision on AMD. Our victim is in apic.c:158=
7.
>>>>>
>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD =
it
>>>>> is 0. This is why we take a different path.
>>>>>
>>>>> Now the question is simple -- why? :-)
>>>>>
>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
>>>>> else odd?
>>>>
>>>> Yes, the ExtINT makes no sense for secondary cells, and it should also
>>>> not be needed for primary ones. Let's dig deeper:
>>>>
>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enabled ExtI=
NT on CPU#%d\n", cpu);
>>>>
>>>> What are the values here, and which are different?
>>>
>>> As already mentioned above, only value differs:
>>>
>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD
>>>>> it is 0. This is why we take a different path.
>>>
>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>
>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before that.
>> Can't be Jailhouse: we hand it over masked.
>=20
> Yes, I checked this. Actually we do. But...
>=20
> When the cell is created after jailhouse is enabled, apic_clear() will
> be called when the SIPI is received. There, I added some
> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>=20
> In addition to that, I instrumented the linux-loader. There, I read back
> LVT0. Very early, before we hand over to Linux. No one else touches LVT0
> in the meanwhile. I would see any other guest access as interceptions
> are instrumented (both, read and write).
>=20
> So in the linux-loader, the read back causes a vmexit, and I read back
> 0x0.  That's really strange, there is - afaict - no other access in the
> meanwhile.
>=20
> I don't know what's going on there. I don't see any other modifications
> of LVT registers in code paths other than apic_clear().

Maybe you can lift the setup into KVM and check if you can reproduce there =
as=20
well. That will allow to track down the other access that does the enabling=
. It=20
shouldn't be possible that the hardware does that on its own.

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
jailhouse-dev/12bf6841-413e-58e3-e7ba-0c7a1557bb48%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
