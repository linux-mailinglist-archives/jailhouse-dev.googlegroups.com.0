Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD5S7XUAKGQESIZET7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4260729
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:05:03 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id m14sf3768698wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:05:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562335503; cv=pass;
        d=google.com; s=arc-20160816;
        b=F3pBaWpJ+Q3OgKSZjRJVmZmM/FQua6ImD4TQ6gcB5wEl4nkBVq1WV+OGClqPwEODMV
         pBjkjk5YWg5KfZ8FOncS0HsVlzR8I7JruVCtxFTkX0f6vp+zVTO3bvlLbDSZxq9fmKSb
         5/9xj5leKRgbYORNE90aea8TcajwGxJ6hkk9s4uZPPeH5hnFr6AAPBtvdjt5nwpf1QiP
         4Tbb1+9B4zifyHT1eI2mikdLrg1xnUegNYmbQ34RY/uUfRN5IfoZZEpbb2H9PQTJCgzr
         xo+CDq2uhrXtLgW0W0H7V4LB0vE1oUBcOYf24gE7olMz7ipsk5szpu4lvq7rHNWc9qfP
         gYqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=PNRMc8UovRvSkBVigOCzHot37LI3VzA717mB1yot5Po=;
        b=bFc+ZWizFpOcagkTHnl3s/1IQI/oo7+sDQOCgtE/MGgDZUP8+x0haWvkpxVL1v2Amd
         /Y9OJU4gPXFXD6dT9kM7actLB+GsJ2tU61ANsy42mgBDFt5MTiutaSpT0w8B0CP18mV2
         cg76cxfCwsk/9BYMvi3VePUH5Evv4iXaDsuLHYCz9HpUT3oN+Vp6sTyxZ8nh4MOEOOyI
         bQVruG2ypvnV3cPxrnvAuJpCSfapOK2Yij2DOdt16PfeW2WO+D4+omNmJezeRX8ccbib
         Epi95h1wKflojcnjlL7inuEPNTfn6N+kWOUTkY+MABM939Vo5kpV/GwT0E8m6Lz5NhCn
         qMmQ==
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
        bh=PNRMc8UovRvSkBVigOCzHot37LI3VzA717mB1yot5Po=;
        b=fhVttMkIV25uTb4gTY/P0JstrbdAlyZae1bJtZiKWE5yaVu6pkge65ZS9U3DaiTDTP
         aJJbpoILADcaUoUU4yIiXiCLXnTTvkizZwrGUY2advRdSqmDPsDYm5IstXijlGJ/ZqWg
         TMT7P42SoAWT0Vx7dUWJBzLfOf0FBzCB4cr/vrgwuwBcjepy3HCm883ryiP+8bjJDnb8
         S8fo4NPHQ6ZujnEoX6iQaUqSN2e4gIZqJMUOJwynmSMcTIXhz5NxZ6JTQNTynIUCqUns
         fJvo0tHlUIwMThuco/EH/53u7jzj0cKHTKim4hc/M7cF54lZZhMXJ/4tPZ/ldbHPHJjP
         vmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PNRMc8UovRvSkBVigOCzHot37LI3VzA717mB1yot5Po=;
        b=OKCY/5RBALWzpeIb6HnEQLNvmMwPo5ILk2Pg0LjgsS1IGDgrLMM6yYJMNAT0NBCfIc
         /BOq8Kzm3GQx2Z1oiddb2LBa5f7q0W88nDYb6pRfLRLPIrEGdcsJyOs2GB655sgX0njM
         MYLKkmZ2Wcp2y5qG7PRbVrB3/yNmTOkX0rkHbTazUQFi94C32qMOpcLdCDu1XW6gdhx+
         wXmYh9W0din7IeBPI4Gf1gWecFfMt5DOQdfBpoNtuMHF/R4ZHpksyWA0T6U6LC5CTGSd
         Dn9pk5sX+F5IVedDHWkx59EFsP0zoLMqK3nHBtaVFKijc4mkiSBdPdQ2iDuMil2yw5a5
         1UEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUHHyihi4p9j2whrQl/313+Yhg9ITQV0azKNIQQtXGZpGSELPpI
	gE7qS+yNsWu5NctSJ7knzeE=
X-Google-Smtp-Source: APXvYqw4HSe9DpTLtMZy9BbMKNPwNGnvTLLKTuUxotEqjZIW13cfNF5UziB6OhxUmzRGzmjc9dlCUw==
X-Received: by 2002:a7b:c928:: with SMTP id h8mr3816554wml.93.1562335503134;
        Fri, 05 Jul 2019 07:05:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ee92:: with SMTP id b18ls2079090wro.13.gmail; Fri, 05
 Jul 2019 07:05:01 -0700 (PDT)
X-Received: by 2002:adf:f951:: with SMTP id q17mr4205374wrr.173.1562335501772;
        Fri, 05 Jul 2019 07:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562335501; cv=none;
        d=google.com; s=arc-20160816;
        b=IwHZmfDsVwwPcboI7NAy9j4b9eI7VSFByvinDG13p9dKOKqsKvA1BZVH3p1Q6oDFU7
         /q4QLnfRKmJaMgvnjuOx6QQFKWfZxOBEm5h5bC8xN9Z6Y65VUQ9rUgs80bNuabl+/l4b
         IPLPugN5anPbIpiHBTWI+GEtGrUgxcQmltbiOk+WAwMLmur+rxIT761DYKH5yFodhHii
         tk9HbbiNguLzkStUFXDGMDKzw1DE200cP+wRHfVyV0iGQV4kcZG7LWUiZ24T9nh4LdR4
         DFNxNoqmZ/AK61T899U0JbylYlSF2bqE8u034CdqDuW7dF5XW3uK8TB3qjuPc81RTEro
         G0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=1nit5geBKhYsoa8yZFZSf5/c1lsMxOQ6yV5pKB3PlhE=;
        b=j+v0QsZ5X7JbQwuXlaRaGzGJrxauzdyrGIWql+zp70lyHtoAhv6v/GsrGwlaawJRWI
         vU47vJs9qk9Eh5sNFJTxYhpI5nC/nCnggW+lpbbonGgm/I5wpHGqGm9+WEJuulTluFRq
         Vse0JWYMYA5HMIlfDXzM4z4v01sMumFyin32snUo9eBclBlb0iv3tygyZqrZQj1pJXfR
         nX3Y2C/4iDpJzwwibL8ALdbDCspc28G5mWnjeEcBQmVO1rnK+YF2tzRzeN1HWfVarhix
         TRCu9iDjFFPxn/Re/82+ooYER1+2/pIo4n+p+O3z6X3nmQtyNhJMenIovmRHybegKK1U
         QrFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l11si703554wmj.4.2019.07.05.07.05.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x65E4tGV008998
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Jul 2019 16:04:55 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x65E4t8i021610;
	Fri, 5 Jul 2019 16:04:55 +0200
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
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
Date: Fri, 5 Jul 2019 16:04:54 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
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

On 05.07.19 15:54, Ralf Ramsauer wrote:
>=20
>=20
> On 7/5/19 2:36 PM, Jan Kiszka wrote:
>> On 05.07.19 14:34, Ralf Ramsauer wrote:
>>>
>>>
>>> On 7/5/19 8:55 AM, Jan Kiszka wrote:
>>>> On 04.07.19 22:56, Ralf Ramsauer wrote:
>>>>> On 7/4/19 5:24 PM, Jan Kiszka wrote:
>>>>>> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>>>>>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> we have some trouble starting non-root Linux on an AMD box. I
>>>>>>>>> already
>>>>>>>>> tried to narrow things down, but it raised several questions.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The main problem is, that non-root Linux tries to write to LVT0,
>>>>>>>>> and
>>>>>>>>> jailhouse crashes with:
>>>>>>>>>
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delive=
ry mode (reg 35, value
>>>>>>>>> 00000700)
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Turns out, in comparison to Intel x86, we don't trap on APIC
>>>>>>>>> reads, we
>>>>>>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this
>>>>>>>>> would
>>>>>>>>> be the issue of this bug, as that's an obvious difference between
>>>>>>>>> Intel
>>>>>>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX
>>>>>>>>> works
>>>>>>>>> slightly different in these regards (side note: [1]).
>>>>>>>>>
>>>>>>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I
>>>>>>>>> intercepted
>>>>>>>>> reads (by removing the present bit of the XAPIC_PAGE of the
>>>>>>>>> guest), and
>>>>>>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>>>>>>
>>>>>>>>> I can confirm that we now trap reads as well as writes. But the
>>>>>>>>> non-root
>>>>>>>>> Linux still crashes with the same error.
>>>>>>>>>
>>>>>>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>>>>>>> forwarded to the hardware, if they were intercepted. So this
>>>>>>>>> explains
>>>>>>>>> why the bug still remains. This raised another question regarding
>>>>>>>>> xAPIC
>>>>>>>>> handling on Intel:
>>>>>>>>>
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC =
reads. On Intel, we do,
>>>>>>>>> as we
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 follow the strategy mentioned in =
[1]=E2=80=A6 But why?
>>>>>>>>
>>>>>>>> It accelerates write dispatching at least. I never did the
>>>>>>>> comparison
>>>>>>>> if> using a different access scheme would be beneficial because
>>>>>>>> xAPIC is
>>>>>>>> practically dead on Intel.
>>>>>>>
>>>>>>> Hmm... The change and benchmark should be pretty easy. Once a
>>>>>>> bunch of
>>>>>>> other issues is solved, I'll maybe have a look at this.
>>>>>>>
>>>>>>
>>>>>> As I said: you will optimize a legacy code path, not practically
>>>>>> relevant. If that will simplify the code, though, I might still be
>>>>>> interested :).
>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to=
 just trap on xAPIC
>>>>>>>>> writes on
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Intel? This could be done by swit=
ching from APIC_ACCESS
>>>>>>>>> interception
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to simple write-only trap & emula=
te (page faults).
>>>>>>>>>
>>>>>>>>> However, back to the initial issue. Looks like the difference
>>>>>>>>> between
>>>>>>>>> Intel and AMD boot is as follows.
>>>>>>>>>
>>>>>>>>> AMD:
>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical f=
lat.
>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>>>>>>
>>>>>>>>> Intel:
>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical f=
lat.
>>>>>>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This is why the above-mentioned Jailhouse crash occurs. I tried t=
o
>>>>>>>>> find
>>>>>>>>> out why Linux takes this decision on AMD. Our victim is in
>>>>>>>>> apic.c:1587.
>>>>>>>>>
>>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>>> AMD it
>>>>>>>>> is 0. This is why we take a different path.
>>>>>>>>>
>>>>>>>>> Now the question is simple -- why? :-)
>>>>>>>>>
>>>>>>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is
>>>>>>>>> anything
>>>>>>>>> else odd?
>>>>>>>>
>>>>>>>> Yes, the ExtINT makes no sense for secondary cells, and it should
>>>>>>>> also
>>>>>>>> not be needed for primary ones. Let's dig deeper:
>>>>>>>>
>>>>>>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>>>>>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTIN=
T;
>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOS=
E, "enabled ExtINT on CPU#%d\n", cpu);
>>>>>>>>
>>>>>>>> What are the values here, and which are different?
>>>>>>>
>>>>>>> As already mentioned above, only value differs:
>>>>>>>
>>>>>>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on
>>>>>>>>> AMD
>>>>>>>>> it is 0. This is why we take a different path.
>>>>>>>
>>>>>>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>>>>>>
>>>>>> Ah, ok. Then you need to find the evil guy unmasking LVT0 before tha=
t.
>>>>>> Can't be Jailhouse: we hand it over masked.
>>>>>
>>>>> Yes, I checked this. Actually we do. But...
>>>>>
>>>>> When the cell is created after jailhouse is enabled, apic_clear() wil=
l
>>>>> be called when the SIPI is received. There, I added some
>>>>> instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.
>>>>>
>>>>> In addition to that, I instrumented the linux-loader. There, I read
>>>>> back
>>>>> LVT0. Very early, before we hand over to Linux. No one else touches
>>>>> LVT0
>>>>> in the meanwhile. I would see any other guest access as interceptions
>>>>> are instrumented (both, read and write).
>>>>>
>>>>> So in the linux-loader, the read back causes a vmexit, and I read bac=
k
>>>>> 0x0.=C2=A0 That's really strange, there is - afaict - no other access=
 in the
>>>>> meanwhile.
>>>>>
>>>>> I don't know what's going on there. I don't see any other modificatio=
ns
>>>>> of LVT registers in code paths other than apic_clear().
>>>>
>>>> Maybe you can lift the setup into KVM and check if you can reproduce
>>>> there as well. That will allow to track down the other access that doe=
s
>>>> the enabling. It shouldn't be possible that the hardware does that on
>>>> its own.
>>>
>>> Tried to run Jailhouse on QEMU on a AMD machine with nested KVM.
>>>
>>> I currently see no way to test this on qemu, as Jailhouse seems to be
>>> pretty unstable. We horribly crash in many situations on kvm:
>>>
>>>  =C2=A0 - High chance of freezes when enabling jailhouse
>>>  =C2=A0 - I loose devices if I don't reroute interrupts to CPU0 before =
I
>>>  =C2=A0=C2=A0=C2=A0 create cells
>>>  =C2=A0 - cell destroy doesn't work. We freeze and after a while: "Igno=
ring NMI
>>>  =C2=A0=C2=A0=C2=A0 IPI to CPU 1"
>>>  =C2=A0 - Starting causes exceptions inside jailhouse
>>>
>>> So Jailhouse definitely runs more stable on bare-metal than on qemu/SVM=
.
>>> I need to find another way to debug this.
>>
>> OK...
>>
>> Next strategy: Frequent read-back and validation of the APIC state. That
>> may help to narrow down the point where the bit flips. Make sure you
>> read on the right CPU, tough.
>=20
> Finally=E2=80=A6
>=20
> I found the evil guy. It's inside apic_clear. The last call to the xapic:
>=20
> apic.c @ apic_clear
>          /* Finally, reset the TPR again and disable the APIC */
>          apic_ops.write(APIC_REG_TPR, 0);
>          apic_ops.write(APIC_REG_SVR, 0xff);
>=20
> Disabling the xAPIC via APIC_REG_SVR will reset LVT0 and others to zero.

What?!?

"The ASE bit when set to 0 disables the local APIC temporarily. When the lo=
cal=20
APIC is disabled, SMI, NMI, INIT, Startup, Remote Read, and LINT
interrupts may be accepted; pending interrupts in the ISR and IRR are held,=
 but=20
further fixed, lowest-priority, and ExtInt interrupts are not accepted. All=
 LVT=20
entry mask bits are set and cannot be cleared."

If that is not true for your hardware, it does not conform to its own spec.

> Seems we must not disable the xAPIC and hand it over enabled, because
> then guest will read erroneous initial values.
>=20
> Commenting out the last line solves the issue. We can now even boot on
> multiple CPUs - everything seems to be fine so far.
>=20
> At least on our machine,
>    - disabling the xAPIC clears LVT* registers
>    - any write to LVT* will be ignored as long as SVR is disabled
>    - If SVR is re-enabled, LVT* will still hold 0, whatever was written
>      to it before it was disabled

What a mess. The problem is we try to emulate the specified reset state of =
the=20
APIC here. And this is SVT =3D 0xff, LVT =3D masked.

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
jailhouse-dev/baa5bc4f-74c4-c60e-0283-a8dcef07b8bf%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
