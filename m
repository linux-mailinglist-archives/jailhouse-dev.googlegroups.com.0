Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBHNN7XUAKGQEVGXB5II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD1606E5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 15:54:38 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id r16sf2231923lja.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 06:54:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562334877; cv=pass;
        d=google.com; s=arc-20160816;
        b=mGjH3V0lecrfgUM0TwrAQZSVrRAXv5PgyHG4fh2RWc9adP+YG7hkKhi1I8v5RPtSmA
         EpLtGnRP9jm7euPQWPeh0eVcT/NaBVsXCKxwi0GwKha8xF7G2T7Xcsb0s/h8KjBB5tiJ
         KGvCOv2M2AogE6ituuR4Y1ivyEI+jafQL0Hu/CrBO0FghtOFPi9EaMmXZEVuDtQXvrPy
         RNCrTQJz/bUVVJ9yijdVz17tj37eCwup/h5115p5sMBTdMQj5e14xAyj+CIUOM+NYSkQ
         RvwoXMapRswCOOAMteabeicXbWLXOfarXfGXad7MVVx0WkBjDKW+uxVY7JLU/TTQJm+y
         yzwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=tqi+HstMSvhbWvuD8iY1NPsJvuCrARgfaQMDPSYUaCg=;
        b=f8omUMIOXj0MTI93Gh/84zLgUQhfjLw1sP8w+cO3szycAGUg5acXZiWkLdnWMzZ8zT
         hjpZonb6h6wYhv9K6l8g0O8zCDsU7AfVkXh9kdLJKivHGvCTyi8zug8YL7WaV7bgOLp3
         UbkABoi8LF/JN5CH149mRlKBDsGGJXmy7pAcDd28ue9/NqUpLM1ESxfI7ItZ56xqzpk+
         Oo8y8k0NbFEUSo1S/a2n8DcFNeMkmlnLCQThFShcq7QONdUtJD7Oa3jXGFsmuv0uJYhM
         YLph8A9PXtsTjZS2k2XSh42evxPUrNSnoWKSpchXNMRHbCNkJObfQY8AUaD8J2xhGAzH
         epZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZEnZaeB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tqi+HstMSvhbWvuD8iY1NPsJvuCrARgfaQMDPSYUaCg=;
        b=VvgYGMEYbINzPQ2sxdmpG0ExEWkqz7ANOnlpY6y+Tl/0IP3t2TdsY4Wqzz6q8ytJ9N
         ILGroE13K92cCsrePF+f0PcRBroAlylrVmguhpp6MuRINaVvNPHg2hXnV6vI7yiwIfhF
         fvRufTgKT7N5YNn7H+2jjXEXX7VdPYr1JJwT0kJ6kGub10p2k5XmOC155RBB1ZSeu47K
         ADc2Pa6J8QQXOfWId1+mRoIgAY0o5GqO+AVstDQKR43/dL/HHjGRFXWLlJG074L1rXG2
         ZJ/WUKY21+VqQbJA4TG8KvIvLr/5QSGHBxjrdJhZgueoIg7kImiZUvj1bIa8p3QLCiMi
         KAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tqi+HstMSvhbWvuD8iY1NPsJvuCrARgfaQMDPSYUaCg=;
        b=PE14jm0TVfBKELiqxacRF9evSSJKbWvpQmGWgj2rfLXf0VXAJpAai3TKbg5rq8nCcm
         BAo/nq0jwZ1+B9bHUORx2W8+YgiqSyoVVbKkpWR1G2klCoMpoBo+aKKBuBdepiIrqFKw
         7Ea3tWOSm3wxbyweS4dGAXKUWG2rR10BckPhpE9j4f1eqYqFrwORboYB+ch5i3uxqlLr
         ZWPjDD92ddzbZ35YTYTJpTqEY+iES1jadIsnQAU2SC3QmjgWSrBqxtRG8XwgdLy119cR
         JoiHt2LZmL/BNqEglDO92ZRpeiD3R9nByny6Es0IRJAJkbY09I0jl6kwfXiXRW83YARZ
         6AbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXfCgyQP5SfoywdivrNhPpkS02ymH4pUuXCVXpgTy7NAXXX9e7+
	Mmye7Mdj6lQCEYJ1hhXrshc=
X-Google-Smtp-Source: APXvYqxN6i9lQ2qS3bkJeAbnlIp0txpE7O12/SwvfsTNRms2bwGNnUAjWqBGAJQyFUII1kh1w0lrgQ==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr346800ljh.158.1562334877718;
        Fri, 05 Jul 2019 06:54:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8854:: with SMTP id z20ls1129670ljj.5.gmail; Fri, 05 Jul
 2019 06:54:37 -0700 (PDT)
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr2288532ljj.165.1562334877049;
        Fri, 05 Jul 2019 06:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562334877; cv=none;
        d=google.com; s=arc-20160816;
        b=0z9ImnsIkjCydtV4Kkam/m1u60IpNaukzacSD+kUEtyBdMhhBQsbOANky1HXtXNIYB
         POY+NCL7U9EDL6YJ4peOIkNpsKBGyKb8r+jSwXhPT6O7qR1ypz55HcMMWrEOpPd8xomM
         582M7l/O8oJPX3GPHm7otoc+k7ij0eS72B0n2nAwrXpNRQHErJyPZPa8EX7gBbR+Ovzw
         hjhFbupDFLaATgvPY6DblBiADgiLgOFu4piZGRmH1evB2BgZPWXWkJbEGPJU07TgnOYa
         inV2kMGTSGUeRpTNzPGLFyTsNL1i/oOUTinULdGtxTkWR/Gp4tQNSDeiITGrxOOuA4wg
         yGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=eyT73hcriSV0PDwS1lr5+pyBlS+al/qRF2ZmE5dnlg4=;
        b=y86xeab7hYsbJ3Gll9B+9ICZIN6fJgFY/yFKWqgTEkZbtrJQTPYGLPUkHKaiBWVc3E
         uXxTKEKJ0Z8nJZPwcnPFUpgIi3EEOj3pxQUBDbF01b8TeE2HEnizemwlm7azDSKduxBh
         /H2OS/+HiLvffk0yOtZLhoU0HrM8I5DJnrgWgAt5d+ZxQJrnUhO9fmQj3cWrIWEvpko/
         8qYdBsEd57Uu70QNlDHK2zcur+DEaFevIzz06DkZAkZIoUJWsh4lKXR8SQDvU9SfKREt
         7WExzNXBwLmpBuHDxdCWEI4i1dB1CkRhvQWu7QtfnJXaIG+yM10hXrfM8lzSmm2wjfm8
         L1qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZEnZaeB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id m84si384970lje.1.2019.07.05.06.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 06:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45gGYR6L57zyBK;
	Fri,  5 Jul 2019 15:54:35 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 5 Jul 2019
 15:54:35 +0200
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
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
Date: Fri, 5 Jul 2019 15:54:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HZEnZaeB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 7/5/19 2:36 PM, Jan Kiszka wrote:
> On 05.07.19 14:34, Ralf Ramsauer wrote:
>>
>>
>> On 7/5/19 8:55 AM, Jan Kiszka wrote:
>>> On 04.07.19 22:56, Ralf Ramsauer wrote:
>>>> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>>>>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>>>>
>>>>>>
>>>>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> we have some trouble starting non-root Linux on an AMD box. I
>>>>>>>> already
>>>>>>>> tried to narrow things down, but it raised several questions.
>>>>>>>>
>>>>>>>>
>>>>>>>> The main problem is, that non-root Linux tries to write to LVT0,
>>>>>>>> and
>>>>>>>> jailhouse crashes with:
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delivery=
 mode (reg 35, value
>>>>>>>> 00000700)
>>>>>>>>
>>>>>>>>
>>>>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC
>>>>>>>> reads, we
>>>>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this
>>>>>>>> would
>>>>>>>> be the issue of this bug, as that's an obvious difference between
>>>>>>>> Intel
>>>>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX
>>>>>>>> works
>>>>>>>> slightly different in these regards (side note: [1]).
>>>>>>>>
>>>>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I
>>>>>>>> intercepted
>>>>>>>> reads (by removing the present bit of the XAPIC_PAGE of the
>>>>>>>> guest), and
>>>>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>>>>>
>>>>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>>>>> non-root
>>>>>>>> Linux still crashes with the same error.
>>>>>>>>
>>>>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>>>>> forwarded to the hardware, if they were intercepted. So this
>>>>>>>> explains
>>>>>>>> why the bug still remains. This raised another question regarding
>>>>>>>> xAPIC
>>>>>>>> handling on Intel:
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC re=
ads. On Intel, we do,
>>>>>>>> as we
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 follow the strategy mentioned in [1=
]=E2=80=A6 But why?
>>>>>>>
>>>>>>> It accelerates write dispatching at least. I never did the
>>>>>>> comparison
>>>>>>> if> using a different access scheme would be beneficial because
>>>>>>> xAPIC is
>>>>>>> practically dead on Intel.
>>>>>>
>>>>>> Hmm... The change and benchmark should be pretty easy. Once a
>>>>>> bunch of
>>>>>> other issues is solved, I'll maybe have a look at this.
>>>>>>
>>>>>
>>>>> As I said: you will optimize a legacy code path, not practically
>>>>> relevant. If that will simplify the code, though, I might still be
>>>>> interested :).
>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to j=
ust trap on xAPIC
>>>>>>>> writes on
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intel? This could be done by switch=
ing from APIC_ACCESS
>>>>>>>> interception
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to simple write-only trap & emulate=
 (page faults).
>>>>>>>>
>>>>>>>> However, back to the initial issue. Looks like the difference
>>>>>>>> between
>>>>>>>> Intel and AMD boot is as follows.
>>>>>>>>
>>>>>>>> AMD:
>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical fl=
at.
>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>>>>
>>>>>>>> Intel:
>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical fl=
at.
>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>>>>
>>>>>>>>
>>>>>>>> This is why the above-mentioned Jailhouse crash occurs. I tried to
>>>>>>>> find
>>>>>>>> out why Linux takes this decision on AMD. Our victim is in
>>>>>>>> apic.c:1587.
>>>>>>>>
>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>> AMD it
>>>>>>>> is 0. This is why we take a different path.
>>>>>>>>
>>>>>>>> Now the question is simple -- why? :-)
>>>>>>>>
>>>>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is
>>>>>>>> anything
>>>>>>>> else odd?
>>>>>>>
>>>>>>> Yes, the ExtINT makes no sense for secondary cells, and it should
>>>>>>> also
>>>>>>> not be needed for primary ones. Let's dig deeper:
>>>>>>>
>>>>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE,=
 "enabled ExtINT on CPU#%d\n", cpu);
>>>>>>>
>>>>>>> What are the values here, and which are different?
>>>>>>
>>>>>> As already mentioned above, only value differs:
>>>>>>
>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>> AMD
>>>>>>>> it is 0. This is why we take a different path.
>>>>>>
>>>>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>>>>
>>>>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before that=
.
>>>>> Can't be Jailhouse: we hand it over masked.
>>>>
>>>> Yes, I checked this. Actually we do. But...
>>>>
>>>> When the cell is created after jailhouse is enabled, apic_clear() will
>>>> be called when the SIPI is received. There, I added some
>>>> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>>>>
>>>> In addition to that, I instrumented the linux-loader. There, I read
>>>> back
>>>> LVT0. Very early, before we hand over to Linux. No one else touches
>>>> LVT0
>>>> in the meanwhile. I would see any other guest access as interceptions
>>>> are instrumented (both, read and write).
>>>>
>>>> So in the linux-loader, the read back causes a vmexit, and I read back
>>>> 0x0.=C2=A0 That's really strange, there is - afaict - no other access =
in the
>>>> meanwhile.
>>>>
>>>> I don't know what's going on there. I don't see any other modification=
s
>>>> of LVT registers in code paths other than apic_clear().
>>>
>>> Maybe you can lift the setup into KVM and check if you can reproduce
>>> there as well. That will allow to track down the other access that does
>>> the enabling. It shouldn't be possible that the hardware does that on
>>> its own.
>>
>> Tried to run Jailhouse on QEMU on a AMD machine with nested KVM.
>>
>> I currently see no way to test this on qemu, as Jailhouse seems to be
>> pretty unstable. We horribly crash in many situations on kvm:
>>
>> =C2=A0 - High chance of freezes when enabling jailhouse
>> =C2=A0 - I loose devices if I don't reroute interrupts to CPU0 before I
>> =C2=A0=C2=A0=C2=A0 create cells
>> =C2=A0 - cell destroy doesn't work. We freeze and after a while: "Ignori=
ng NMI
>> =C2=A0=C2=A0=C2=A0 IPI to CPU 1"
>> =C2=A0 - Starting causes exceptions inside jailhouse
>>
>> So Jailhouse definitely runs more stable on bare-metal than on qemu/SVM.
>> I need to find another way to debug this.
>=20
> OK...
>=20
> Next strategy: Frequent read-back and validation of the APIC state. That
> may help to narrow down the point where the bit flips. Make sure you
> read on the right CPU, tough.

Finally=E2=80=A6

I found the evil guy. It's inside apic_clear. The last call to the xapic:

apic.c @ apic_clear
        /* Finally, reset the TPR again and disable the APIC */
        apic_ops.write(APIC_REG_TPR, 0);
        apic_ops.write(APIC_REG_SVR, 0xff);

Disabling the xAPIC via APIC_REG_SVR will reset LVT0 and others to zero.
Seems we must not disable the xAPIC and hand it over enabled, because
then guest will read erroneous initial values.

Commenting out the last line solves the issue. We can now even boot on
multiple CPUs - everything seems to be fine so far.

At least on our machine,
  - disabling the xAPIC clears LVT* registers
  - any write to LVT* will be ignored as long as SVR is disabled
  - If SVR is re-enabled, LVT* will still hold 0, whatever was written
    to it before it was disabled

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
jailhouse-dev/6de58d25-f1d9-b0ea-b0d8-631250e5ddeb%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
