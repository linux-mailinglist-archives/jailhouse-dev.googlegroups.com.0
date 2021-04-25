Return-Path: <jailhouse-dev+bncBAABBUXUSWCAMGQEO3L433I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5C136A7C3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 16:18:59 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id m13-20020a2ea58d0000b02900befedba4e4sf9717764ljp.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 07:18:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619360339; cv=pass;
        d=google.com; s=arc-20160816;
        b=USHFA531iWDcmu4+qRd6BVkvtm9druzIAlRu2Xq7xGrpwPUV5sI4mp8Q87bMJwb+1S
         KerRsrY8oWUYVkP6m2wD6KhCapgqJ/CWP+nuqmhkX6lrOwnI0AhORaL66heHWl5NWT1d
         wda85XzxQXl5QcxJ7N10H6UcRwm1i44GC6soxj4Xeinfdcae3cIyUSloef5NR+MZjxTc
         C/aWNcYGhKgZ8v1vZr4cAu1awnfr70TQK1R/bzZRw6cnoE3V2mEMd0YbC5FIuJtLKWs5
         S8U1rQCD5g6zAtdzFklIfqm2gx487aPuCqV3SogEOLcHyxuRXH1oTtmoOK/mfHoub4Ab
         fAIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=Cra9qYzKcDN7obemn9LPmJwzD+737A0UyZFM1+QO2Is=;
        b=F3yTacMySXcBWJ2xrsbB3i1YJlNVXXcgguwgaUEjKxqipRMlYwU09TgMS2ybM871vr
         YTF31jArNvpUssbGtgyWjcIl+SUJVWLUIYQ8TsMPM1xAtPS/4Mu3/I8sAi4SURui1K3N
         123E9qVOS3tFCFEi609YASxOoc7I0i8/JLs6of9cF7t0+KTc3Qm6ygZXWRErJ3V6hKYx
         0r4U8AxDhFBH9+AJ64NzgkAuvuoc9Ve9OAXmbYpNbJtGmr+t/oFtmh/zgLAHr0pralJb
         KYeeY+b+twOeliEs4IYSH56kh3f5RFUlUeq3l8qrvyI0VWcf4j2k7PBTB0OTzmjXl1lA
         THDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b=iMMZ7PX6;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=o7LHFaqM;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Cra9qYzKcDN7obemn9LPmJwzD+737A0UyZFM1+QO2Is=;
        b=mcNSvKAMUKLs8O2tM5YF5yLHRzYNmcOiAYQeauaHL2MAL0skuzgnCfZAd0CK4Lv5aV
         QaqZlUSMEVa9UOSQHNW/SocfopgtFFAbZahC5JKEPWcndvfk6JU56FH36qu7EEhq4Wzr
         Wqq1PFHVN7WU7dxrY/+fHqePvmLdz0hPdaIIsAEeOU4vqNrhKb6LjSmfc2StF8nLkMQq
         x3k4ivDoXphvONdzctbrBMCdNj27pB0QvoUZHlfHCM0tH7yGoMuREKa6j/8JmvNMwM0S
         gy4hdoUOruasGOPFl3d15Dj2+Ht9lw6MSDk8/xRx8neUfJfCt57MlYloO7PsQrKAndLu
         pxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Cra9qYzKcDN7obemn9LPmJwzD+737A0UyZFM1+QO2Is=;
        b=Pbm7yd4L5JL5fWj9NzpRs2Nlrkp1ajDvREwWkjrpywZFi09wc37lxJnbiD4av7me3v
         Oqb0viE5T84UmlC+LjQLPzD1Q98SkAvpWNlXGQ/GwE9amj325Bua3Nhl/y17xWzfy39L
         QzCBsZZbqXvMDzIfcNn6loKCf9dEcB/sMkbaAO25miwdpjMuQ8+1L4i4BSL6y1k7Di+4
         BGbxEx1gwRz1ZVaD8D0h6aOlUfR/OuBHaF4WPG15iEbduMQR44kUnrpggIo+URyErnNo
         jPmmeKPXf4Qke8A6pEP0iMFvFvRVsNuic+yc2IXHzcH5+69s6o/k3Vu2Q0M21l5kLbs2
         DbgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532O6kaTVFrBFt94+sgVSng0rwk22quwcBn6C3CIZwEFEKA2Yicf
	1GiXQjeMSOEuAI5hbBKPYxI=
X-Google-Smtp-Source: ABdhPJwErnYdb9Ky4I1u/OXh+Y+i3Fy+Pf/KGDq9q1djYAPiNOFUsmmnSw0n0EXS2a1akowTsS/eEw==
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr9666788ljq.373.1619360339161;
        Sun, 25 Apr 2021 07:18:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls5624941lff.3.gmail; Sun, 25
 Apr 2021 07:18:58 -0700 (PDT)
X-Received: by 2002:ac2:5399:: with SMTP id g25mr9759499lfh.433.1619360337994;
        Sun, 25 Apr 2021 07:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619360337; cv=none;
        d=google.com; s=arc-20160816;
        b=X5FURt9GWM+QCuAn0Gb+vYjzcHLPk6lsL3B771O+vkt9hel7kbeYZ12HiV9YQm53bO
         i7QlE6+kBu+nULWAnN8ZVi3cuzd5avGunTTwVDdMqa2sOk7eAUQUWYSZ1wgzdKPtjP0+
         9z6uKnqp3+yDOcpYC3OA+gwFpe0dvFOofPgZgUgXpZRtHG/F5UZW6c8he7Q3f2iJuzR0
         +WSeBC7kzk/7Cu80Khskir1X9VBRbgtUsXe5BluOnhBvc9stJ2EUpbANrsXWnDzQPxNn
         g7zFibixYcAr9pIYBPQkfAytDUaDdrzJCi/2OcV2fu1zw8i9NKOXWAcQO7fV2dUCRL43
         82Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=G9Ek6qno0AMdtuNGKL6d3jKT330GtkBtvzPkd0tgGIg=;
        b=yE6WqhGHif+jgTyUWdh0xgZwlav3LAz2gcFOKst/hCq2zIDKKXGu8eliZ6vfHTcL5w
         CL0yl5DyYvYN0OuobvFd+hdiikIH2mkMLW2h77nYMz9w1sWPkkA1Plhqi3oGnrWiT3RR
         PeUbQRa+2txpIaCIGS7dIPumKERbrORi0iUxeCy6CnCe67AJGt7aEF4NlA8ivBVfXNtA
         s+uJ4V7ImZMakpe4FFyFARG07P0/ga+nnMTKHSE2wenmxrozdYdTwHhZY95BL2I2EcM6
         LpKNqpKkwOq63OuUKW7hh7OYP8UOmOGr+8yWxq3rCrbO5sqmTCo6m6O1AafKicAvIgev
         4KCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de header.s=itmze header.b=iMMZ7PX6;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=o7LHFaqM;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id b12si248502ljo.3.2021.04.25.07.18.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 07:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.82 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Sun, 25 Apr 2021 14:18:52 GMT
Received: from Pickup by email2.uni-rostock.de with Microsoft SMTP Server id
 15.2.858.5; Sun, 25 Apr 2021 14:18:47 +0000
Received: from email1.uni-rostock.de (139.30.22.81) by email2.uni-rostock.de
 (139.30.22.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Sun, 25 Apr 2021
 16:16:44 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.010; Sun, 25 Apr 2021 16:16:44 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@web.de>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwIAD6CkA///bZqAABW1CgP//n1XQ
Date: Sun, 25 Apr 2021 14:16:43 +0000
Message-ID: <e6611daa8bc844dd92151735e8b65296@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
In-Reply-To: <34742299-7898-adb3-30b8-760bc4596e92@web.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.75.241]
x-tm-smex-dtas-header-wtp-uuid: 6479FA19A886652870AA92BFF7187A4D1B43B408
x-tm-smex-dtas-header-wtp-flag: 26FE7549063222D2B04DA65B266F6B9B2E7B6DE80000
	ece27c89-4d09-4ade-8694-0f55c90a4f11:BC4A395C517E27D5DC5D9D61FE921023AB7115
	3C0004d3efdf92-8efe-450d-97f0-d59711ec2bef:E86D7FA298E5BF5C91B1B1620E328B6A
	9CBADDE500004667b671-7a8e-43df-be20-10fdc7e9b63f
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26114.000
x-tm-as-result: No-10--13.769900-8.000000
x-tmase-matchedrid: FylJuUDaq5MMPDZrnvcM98CxC+PryYbTgdkHykGcMpkIs3xaW+K/p4Oe
	bEP+AgB4atStKMEi4EN9H7jaVSoagNZx0BKWTuVW5AXZFsQJLaNAoIbCoNp+DckTTitdbuJdUTH
	YZUh2YAGVKbtYeFYZJI9bHfxDWoibSc0meJ+asnj/Te3t5cJMG8u9eQjEdpjZCXjDiV/HPZzNYm
	nwJ/qUK6/lZs+cKp6WAK/XGs5N9K+1VfXpZHDU6vbta0OAYFzyIiTd2l7lf6Ey/xh6GqNHVYlHI
	JynfcNOrpYdrzWjH/qswmAifnzqPFdy2Ts5I62PSHCU59h5KrE30KSHUeaVmOQydRUvl3QTLPGi
	mV/jCraBAJVs0WwHy2hhauNrKJThEl2tGbkxV6WCCtrY06jaLWCwU6go4mfmCDaSBZ23epomz3Y
	IbdBZEb9gdVor/m57e6WPXQD7Ri/2FRFzO7xwNiAI8aJmq0jwUCwb19dUaUlWvpVGJ7Eisbp7j0
	BB2ob+cZ1lV7X7//C3PHfIkvax4XohyDgDbVJyYXOD42j+641HANTrr3brvGFHVj+6F+rI6qfxT
	V7piR+vceTyCry+PpseC9phu1lg4k/KB72KsFKUzbPKik6p5kKJ5iyNYGPphFgfIrshqgnnXwiy
	1AhQ63gmxYP42vdoAHezqzplY+3sAGjS6lxxKpxVZzZr7+O7CKAZ1WDJaWqhmfuEmalt/ZLpoi6
	YM2WSUlgSdAUIYaApETgQZgLXP7EGspe6+goZ6HuV1BUJYPOrKImBnIKgpm8q9NSoG8s63b+XWg
	ntZKdlh/72u7zZxsUna5thys0Y8aVkBZkOPzKrm7DrUlmNkF+24nCsUSFNBLPx9cDMrKb9b0xgY
	rma7dRnEQCUU+jz9xS3mVzWUuCgZHIBpyeFppsO4pOGQAyfLK23dYyOHZRc/mIAU8fptusoNigY
	paZaftwZ3X11IV0=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--13.769900-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26114.000
x-tm-snts-smtp: EEA0037B97DAD63AC4300140E331C9DAE0B310D7F79AEDE24CAF0003797FC1FD2002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de header.s=itmze header.b=iMMZ7PX6;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=o7LHFaqM;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de
 designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
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

Hello Mr. Kiszka and Mr. Ramsauer,
I managed to make it run on the second host machine with native Ubuntu OS. =
I will discuss with my professor about implementing it on RPi4. I would lik=
e to thank you very much for your assistance.=20
Best regards,

-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@web.de>=20
Gesendet: Sonntag, 25. April 2021 12:30
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer <ralf=
.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

On 25.04.21 12:20, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
> I have one machine with:
> Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz The setup is win10-> Ubuntu=20
> 20 on VMware and I found this while running lscpu:
> Vulnerability Itlb multihit:     KVM: Mitigation: VMX disabled
> Vulnerability L1tf:              Mitigation; PTE Inversion; VMX flush not=
 necessary, SMT disabled
>

VMware does not provide sufficient VT-x virtualization, plus things would b=
ecome too slow with three levels of virtualization (VMware -> KVM
-> Jailhouse). Run Linux with KVM natively.

> The other machine has Ubuntu 18.
> Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz
>
> Both have virtualization VT-x.
>
> I think that I do not simply have access to enabling VT-x from Bios setti=
ngs.

Here, Ubuntu is running natively? And you still have VT-x but not APIC virt=
ualization according to jailhouse hardware check? That would be extremely w=
eird because it's a CPU from 2016 which has all required features to my bes=
t knowledge.

>
> I am thinking of buying a Pi4 and try Jailhouse on real hardware, would t=
hat be a good idea?

It's an architectural switch (not sure which role the arch plays in your
studies) but you will definitely overcome that host OS issue and have reali=
stic benchmark numbers.

Jan

>
> Thanks in advance
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@web.de>
> Gesendet: Sonntag, 25. April 2021 12:05
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Ralf Ramsauer=20
> <ralf.ramsauer@oth-regensburg.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>
> On 25.04.21 11:32, Moustafa Noufale wrote:
>> Yes, the machine is working and jailhouse is present in the list of Modu=
les. However, when I run this command:
>> jailhouse enable /etc/jailhouse/qemu-x86.cell I get on the QEMU side "
>> Input/output error"
>>
>> and on the terminal:
>> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2=20
>> Code location: 0xfffffffff0000050 Using x2APIC
>>
>> Then I ran jailhouse hardware check and everything is available, except =
for:
>> "Virtualize APIC access             MISSING"
>>
>
> Also when running on a native Linux host? This is unusual. What CPU do yo=
u have (lscpu)?
>
> Jan
>
>> Then I tried to figure it out with different ways:
>>     sudo modprobe kvm_amd nested=3D1
>>     sudo modprobe kvm_intel enable_apicv=3D1
>>
>> or editing the kvm.conf file, but with testing with the following comman=
d:
>> cat /sys/module/kvm_intel/parameters/nested
>> returns Y and it is okay.
>> cat /sys/module/kvm_intel/parameters/enable_apicv
>> it returns always N.
>>
>> I tried two setups:
>> 1- Ubuntu 20.1 as a VM on Win10 machine.
>> 2- Ubuntu 18 as the main host machine.
>>
>> Thanks in advance
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Gesendet: Freitag, 23. April 2021 20:40
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>> Betreff: Re: [EXT] AW: AW: Inquiry
>>
>> Hi Moustafa,
>>
>> On 23/04/2021 15:04, Moustafa Noufale wrote:
>>> Hello,
>>> I would like to thank you for your support and maybe you can give me a =
little help with building "jailhouse.ko"
>>> I have tried make, make install with and without root in this directory=
 "jailhouse-master/driver" and I am not sure if I am following the correct =
procedure. What I have done so far is building an image of a virtual x-86 t=
hrough running ./build-images.sh and I can start it using ./start-qemu.sh.
>>
>> Okay - so you did build successfully build your target with jailhouse-im=
ages, and start-qemu.sh gives you a running qemu instance?
>>
>> In this case, everything is already installed and in place. The jailhous=
e module will already be loaded - you can check that with `lsmod`.
>>
>> To enable jailhouse, you can simply check the history of you bash, or ha=
ve a look here:
>>
>> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/
>> c
>> ustomizations/files/.bash_history-qemu-amd64
>>
>> HTH,
>>   Ralf
>>
>>> What I have understood from the tutorial is that I have to inject jailh=
ouse.ko into the kernel and then start the guest.
>>> Thanks in advance
>>> Moustafa Noufale
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> Gesendet: Dienstag, 20. April 2021 11:39
>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
>>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>>> Betreff: Re: AW: Inquiry
>>>
>>> Hi,
>>>
>>> On 20/04/2021 11:29, Moustafa Noufale wrote:
>>>> Hi Mr. Kiszka,
>>>> I have tried to  build an image through running "build-images.sh" with=
 and without root access:
>>>>
>>>> without root access:
>>>>
>>>> Select images to build (space-separated index list): 1
>>>> docker: Got permission denied while trying to connect to the Docker da=
emon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdock=
er.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: p=
ermission denied.
>>>
>>> your local user needs to be in the docker group.
>>>
>>>> See 'docker run --help'.
>>>>
>>>> With root access:
>>>>
>>>> Select images to build (space-separated index list): 1
>>>> Error: Running as root - may break certain recipes.
>>>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to =
override.
>>>
>>> Simply read the error message and follow the instructions: If you want =
to run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environ=
ment. For good reasons: You shouldn't do that as root.
>>>
>>> Anyway, solve the issue by adding your user to the docker group.
>>>
>>>   Ralf
>>>
>>>>
>>>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualiza=
tion.
>>>> I would really appreciate it, if you could me a hint.
>>>> Thanks in advance,
>>>> Moustafa Noufale
>>>>
>>>> -----Urspr=C3=BCngliche Nachricht-----
>>>> Von: Jan Kiszka <jan.kiszka@web.de>
>>>> Gesendet: Samstag, 17. April 2021 11:45
>>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;
>>>> jailhouse-dev@googlegroups.com
>>>> Betreff: Re: Inquiry
>>>>
>>>> Hi Moustafa,
>>>>
>>>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>>>
>>>>> To whom it may concern,
>>>>> I am a Master student in Rostock University and I am studying=20
>>>>> Jailhouse this semester as a Master project and I would like to=20
>>>>> gather information about this Hypervisor, as well as I would like=20
>>>>> to ask, whether it is possible to install it on an Ubuntu Virtual=20
>>>>> Machine? I just need an outline, how I can learn it. I spent today=20
>>>>> reading the code on GitHub, but I need more information and appreciat=
e it if you can help me.
>>>>>
>>>>
>>>> A good starting point for experiments can be the images generated by [=
1], both for KVM VMs, pure QEMU emulation target or also real boards.
>>>> Note that emulating target inside a VM will work but using KVM (for x8=
6) may not or is at least fairly slow. I would recommend a native Linux hos=
t.
>>>>
>>>> Then you will find a lot of presentations on Jailhouse on the internet=
 as well as an (aging) tutorial on how to bring it up on new hardware.
>>>>
>>>> Jan
>>>>
>>>> [1] https://github.com/siemens/jailhouse-images
>>>> [2]
>>>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE
>>>> 2
>>>> 0
>>>> 1
>>>> 6-Jailhouse-Tutorial.pdf [2]
>>>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>>>
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e6611daa8bc844dd92151735e8b65296%40uni-rostock.de.
