Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZ4IXT5QKGQEPXFVDXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6A279813
	for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 11:05:44 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id a17sf243263lfl.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 02:05:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601111144; cv=pass;
        d=google.com; s=arc-20160816;
        b=NDlGCpTRD8DFkEnHlWmTb1b8PTQpQYcFz2UOD0KizR+pMztHxtjQq98cbE20prvsKy
         jsSRtEp08JW0jbmV5Di/fuldDVNxtOgx+gw3/9r2D+LBqBCkYfsoFCDsq+V2TGrbE3dm
         MyFnHDSuKKNbGzpu0qtRv+EDPIYttY+gHdN5jVTAeQxTfWcCVrtyhF3x7Er7aREACQ7t
         Gksq8+NU8b0jmlg9to0CDNN7x/9lZPVWQdIbSzXnnqbg237ndVgvz3+QghqNgcze4T4C
         c2TAxXOtC2S0R5S+SbxOOA3sgUcnwKG+PFePeaX+yOqQA6p1UmJp5/bTz41feMgGD8Mk
         6Ppg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=qc2mahgQ0+z0o1PPbEqfPsXA5xomzaQLVs3O611bmFo=;
        b=P7Fn8f7w3OGZKGR9FPIe+DQQxtwyIY8qf+Gkvk2yynQGmYMKTF5qvxqLQ/5bBk3lsH
         0NqI5JefdGyQe3avD+ISt9KxPRNKSTDAL8IDqBJdnYG5WaTMGiUcf6tZvJ7x6JKThso6
         4Ck/w5mp1S6QInUJATWPbdBGEAK+/w6qkjM+kWMi1+niccELFxltgjkqx82oyr2WiGtE
         cqAnpYlN5B8vfijigJJTS1xZX4WHPyw246rvtIH0cWLEvV+oyq7d1Jcl7YKkzKf3/P1i
         Y93m3N366aB8ieuOefGZ44EblWWePhS30U7SzO4CMn6w5RbgQDb9XsJr4hz9NMKmzsvp
         Lx8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qpvuSqET;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qc2mahgQ0+z0o1PPbEqfPsXA5xomzaQLVs3O611bmFo=;
        b=eo/KqChSBFPfiomATU1dykTCD7OL3+p61TQeTj2jvwH7e1VAGTENzHWcg7Xwug8Jpt
         HjlM2E3Y78tRS3osr9ByUeIc4omUtQ23PFmc36kHsV1lJYUrFVdX+dZf2KhbfxV4MnJN
         8gRJRfVf5HMiU0tXFLDrrwT7o13abh3t3EayL6o9BdiySyJRSsK9N73qkFzqXNUiT05W
         n8KqI8xTpVZEcOwX4EVaIsqH831SUUHuD1j/zKhD3vragDkH/lOGNO94UoR3f76LAZKz
         c/DcGhk6SJ+RavRyQGQ1jeaVaMaP36qwhLa63E2gs6jQkxkYdyuS9JQozKaCkVEF1Z6x
         NmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qc2mahgQ0+z0o1PPbEqfPsXA5xomzaQLVs3O611bmFo=;
        b=oWqSpeuqGMl7HAG2yPZUZSu8WWltUR71CgJVUwmZCZCmQIITOQSY23Y+qX3qgwutWy
         VpCeFr/VoCa9O8iZBJkNWFN82+b8rY/CJUCW7oyvyJPikVFCXOyRJVtptuOIHh4XTRzP
         Lu7oyovjFfKz7au/GKetNb+48IPmK/O+m378rleE3cEDyIruIYe1DKT8EUAuKcFLexaH
         iwhFhVV85sl86WCA/o7VTzAVscbnEQjSOScucQVckWBaa1Jj9pkwenU5U6tBToh7/4HP
         6uA1WPTd1RTuLKKM7BR5BlzlnEKEqzcNsRSEyfEX/wMYWtc8NlEO7DWHKxniWhjhqkpE
         702Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327Hx7L+U+c0ZPIx1lGKgJc1pfCRj2qDokd7RZRbsipSnq53am1
	EVV+zdMPS+3dfqDtfl61Dlo=
X-Google-Smtp-Source: ABdhPJxzNnL9vv0QXQ+YLrZYMJScbbpH5iZqBxoTM1ZshOPaXt1nZxfTzH7hdtjyYTiKhgI1OyG1Aw==
X-Received: by 2002:a2e:9815:: with SMTP id a21mr2590842ljj.311.1601111143783;
        Sat, 26 Sep 2020 02:05:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1827604lff.1.gmail; Sat, 26 Sep
 2020 02:05:42 -0700 (PDT)
X-Received: by 2002:ac2:4315:: with SMTP id l21mr976971lfh.494.1601111142340;
        Sat, 26 Sep 2020 02:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601111142; cv=none;
        d=google.com; s=arc-20160816;
        b=uYRNHZd+M2hpqur8TnuqEN+6DaMIrjJBBF2IQjPAtv7tfpxJ/Bkvp0vfA6wu6yW1i1
         FK6RmTm7IXced7+ZfNORz9cfOLRabdLFxVsjqeo5vl1b60ouiuIEgAbHOAU031Vo8FtV
         IyNb/WQUTpUfBxOBBpbO8GsifaKSRkX449LP01DuYvnqBEuCG0kMSe/6LdBEJ23hIkux
         ALzqrN33RIRgx3DCbQcqerwnDMlEfWwX5TN8eia7O5OB2QG7AXqwW+EW6+tuIIV8J0cQ
         dCUZ2PwYtDv7YAf8jlQ0twVN64IOvpsiaycLOwAkuknL18Pa81+pJ57fbc10yfA5HYfq
         EhIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=/ROTTKwZ72AlQlLrqv1QBHD5e7TMbLnSl5nhNrgDSVo=;
        b=pPW4hNzFnNcEQsqKwDYPBsqNGqRUSDgKbxXCFdry7BFxrnW1fq8fkO4mMkU5jeDXsO
         mc3/mrrI7bmCsdZ2AngMvEJH18ikuZgdNQgEQcaSsOWqvJVuUoDMeWIHKwIudOaqX+cI
         UDdwQC2wZ9zWXfGOjeT1NJyU+p85k6FB/Xg+Mi/K1HMXSeWK64pds4BWBQ2FvRVH2qjp
         093/S/jtQNfBNBHuZrfUpe6NANnPny/0fiUIEUPoorEaqF/6Opnc8oZPlzIAa9+Q6h7R
         YinRz/5Sx3te2D3kjGpfJTTp2IBrDffBaygFBB2D2I6JhxwE+Ks7dtzIWdFE5dsl6wrl
         JIIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=qpvuSqET;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id r13si35400ljm.3.2020.09.26.02.05.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 02:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M6QBP-1kfJ8A1q8Z-00yP97; Sat, 26
 Sep 2020 11:05:41 +0200
Subject: Re: arm64-zero-exits trouble
From: Jan Kiszka <jan.kiszka@web.de>
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
 Chase Conklin <chase.conklin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <91E9F831-4F9A-4444-AD9A-3E5C56D3CA70@gmx.de>
 <e0d4c689-8cc3-afb0-5a75-b57229feba1f@siemens.com>
 <0F31A760-66D4-4430-BE71-6126FCF5AD60@gmx.de>
 <64bb13f6-6ae2-09ce-4c61-4c406a360c05@siemens.com>
 <F1455873-4D81-412E-AE3F-B584773FBB29@gmx.de>
 <ac29332c-0c28-2f3f-2ec2-5b0642fff951@siemens.com>
 <f3ca2e5c-b843-db9a-aa8c-864abd2c54e1@siemens.com>
 <2a039ddc-bd8f-eaf9-2494-7f62efb9aa80@siemens.com>
Message-ID: <1efb0fb2-8acf-0ebc-00bf-ce059c9ae833@web.de>
Date: Sat, 26 Sep 2020 11:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2a039ddc-bd8f-eaf9-2494-7f62efb9aa80@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:26GkthY6O4roW0r5EQqUtsQqAV3d1sQk0DpMzg2tBq0kvE5ugSj
 jAqqiBtZL0eLOvkqKRyieQwUDy4TpXsig+McnVgUsjlMTrrieZs9/H2aMQ70Kp1ujaPPJG8
 tdiqbTcz1hyN2CINV7TiT0A8RuvKwA1zxnU1Wl2XfNVq8jU8gJhZI2H89osKAtW2CxC3Wyf
 20VxMJY5aU1dZFlIJBaVw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zbOS3UbyHUM=:FY/nEGZ6iPobwEoSICBTm/
 hHOkAaetsOOpGS5TzGY3IfPd26DEy8SD4h6fnbCNtTUclOsO1tDde1C8hFBi7egn/f9LyjDyb
 60s21UG4sWw3VpDOv3j22VASTWKaVt5inUEizYcB+Z45M2ec0ufb2PXSggX3zWDpVrGxiWDyv
 q+w0sCI+4jfxJtUN0xOT+yWXlEdwHTnrVbp+/1A4leM8Jo3FD19WEW4Ub7hqJGruHWDiocepI
 2eDYnFT+m2PnVZZrPtVjEPT6Lz34XhwIBvxm0zRKJVygIXo/pacdJeE3QpajPk3EV58gjLaLO
 J6PLdH8FKiwyQZ3CRXLOWcyEhlqpdsARqoXdyW7hBtcUtzMbyinbZ36G3EqX7afDg8S//Rjog
 ZWsd2nMOl/ngR6AfOBeeL6/7w9voB8qB6LS3DB3FO8x8va+Z7nFafiTqjhFb8DlX7I//OKLo9
 jWiR7JBZ3GHTVki0sIxA0FCkayTbwczN4CJ+CJxQydbuHT4trS/NUSC3EldFGjHv8Lq3O3GHd
 XxCe1Yox/EzqlnE6Y0qpg250hCH1rD6KjiOLVqEdNNBkJFB+hxrIjVLUz7PbnUhrTYiD985y5
 Ce7Od8zhnzUpK1YkbGMuW2M49awFoOKTQOusMgolqWxCOJm25u9RpyruHEJmmECBJWHSEny8c
 SkmPpXvN6Fpqva6k5z0zc01QJ0/Wu4lNo4ho1J84xgySkMPf6Tf5NAVznuyshU1Ase2JVLqtx
 5d+upo5iIgv/QVUk0d/4KI8oPvRkqEkJz/JmWfXmZTxf4qYEIqt2hLdl9I7XGKKrbWpieB+O8
 DikcR9JVC0QyYNpJLFUHWaOYh0VdfRzIoBwoakO1aKmwY8wVxEVd+qOrPDF5qUqM9n6i1rrZC
 bB3Hse4ml8utmXAZk9wGZSSAUcpfqs4LZyZu2L774jLouzCXEVXbcS87uw/WB+LhkuDMdsJFK
 YUsDFAgM5Dj9SlWuVj8trJFKekPFiYuJe+AhTQ9n7N2gw12e9h4sVmd/feMv/OH1M5rru4n23
 UcejstATP4FMINCps7x3+OXtF5RgDbS7kQKf6khwTYiJ41P5WD5U+eDh+nlc0cskMiUVIIenl
 OzMvVjPUPRMwAq0A9F56kmltQ/YqNI7bCZRsdJfP2P/Zl1RH6sfHdbSme9+qnPjaZt6OwenAR
 jg9GMmaAyW7CDlnGZxbIFOrtLaWppWOrRgfUWvzYcgqs4zcrp78IV4yti/6TzJvcphYIr4InA
 ETFV7KPDZyqzdomf7z8zRQa33eVkFuWT9U+j8+Q==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=qpvuSqET;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 25.09.20 16:53, Jan Kiszka wrote:
> On 25.09.20 16:44, Jan Kiszka wrote:
>> On 25.09.20 16:21, Jan Kiszka wrote:
>>> On 17.09.20 10:36, Oliver Schwartz wrote:
>>>>
>>>>
>>>>> On 17 Sep 2020, at 09:31, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>
>>>>> On 17.09.20 09:16, Oliver Schwartz wrote:
>>>>>>> On 15 Sep 2020, at 11:00, Jan Kiszka <jan.kiszka@siemens.com <mailt=
o:jan.kiszka@siemens.com>> wrote:
>>>>>>>
>>>>>>> On 15.09.20 09:07, Oliver Schwartz wrote:
>>>>>>>> I=E2=80=99m currently trying out the arm64-zero-exits branch and g=
ot stuck.
>>>>>>>> System is a Xilinx ZU9EG on a custom board, similar to zcu102. I=
=E2=80=99ve brought ATF up to date and patched it with Jans patch to enable=
 SDEI. If I don=E2=80=99t enable SDEI in ATF everything works as expected (=
with VM exits for interrupts, of course). Jailhouse source is the tip of br=
anch arm64-zero-exits.
>>>>>>>> If I enable SDEI in ATF, jailhouse works most of the time, except =
for when it doesn=E2=80=99t. Sometimes, =E2=80=98jailhouse enable=E2=80=99 =
results in:
>>>>>>>>> Initializing processors:
>>>>>>>>>  CPU 1... OK
>>>>>>>>>  CPU 0... /home/oliver/0.12-gitAUTOINC+98061469d0-r0/git/hypervis=
or/arch/arm64/setup.c:73: returning error -EIO
>>>>>>>
>>>>>>> Weird - that the SDEI event enable call.
>>>>>>>
>>>>>>>>> FAILED
>>>>>>>>> JAILHOUSE_ENABLE: Input/output error
>>>>>>>> I=E2=80=99ve seen this error only when I enable jailhouse through =
some init script during the boot process, when the system is also busy othe=
rwise. When starting jailhouse on an idle system I haven=E2=80=99t seen thi=
s.
>>>>>>>
>>>>>>> Possibly a regression of my recent refactoring which I didn't manag=
e to test yet. Could you try if
>>>>>>>
>>>>>>> https://github.com/siemens/jailhouse/commits/e0ef829c85895dc6387d5e=
a11b08aa65a456255f
>>>>>>>
>>>>>>> was any better?
>>>>>>>
>>>>>>>> Sometimes it may hang later during =E2=80=98jailhouse enable=E2=80=
=99:
>>>>>>>>> Initializing processors:
>>>>>>>>>  CPU 1... OK
>>>>>>>>>  CPU 0... OK
>>>>>>>>>  CPU 2... OK
>>>>>>>>>  CPU 3... OK
>>>>>>>>> Initializing unit: irqchip
>>>>>>>>> Using SDEI-based management interrupt
>>>>>>>>> Initializing unit: ARM SMMU v3
>>>>>>>>> Initializing unit: PVU IOMMU
>>>>>>>>> Initializing unit: PCI
>>>>>>>>> Adding virtual PCI device 00:00.0 to cell "root"
>>>>>>>>> Page pool usage after late setup: mem 67/992, remap 5/131072
>>>>>>>>> Activating hypervisor
>>>>>>>>> [    5.847540] The Jailhouse is opening.
>>>>>>>> Using a JTAG debugger I see that one or more cores are stuck in hy=
pervisor/arch/arm-common/psci.c, line 105.
>>>>>>>> It may also succeed in stopping one or more CPUs and then hang (ag=
ain with one or more cores stuck in psci.c, line 105):
>>>>>>>>> [    5.810220] The Jailhouse is opening.
>>>>>>>>> [    5.860054] CPU1: shutdown
>>>>>>>>> [    5.862677] psci: CPU1 killed.
>>>>>> Now, with the first problem solved I=E2=80=99ve digged into the seco=
nd one. It=E2=80=99s actually a bit worse than in my initial description: I=
f I just do =E2=80=98jailhouse enable=E2=80=99 the system will always hang =
a few milliseconds after the command completes - the only exception is when=
 =E2=80=98jailhouse create=E2=80=99 is executed immediately afterwards (whi=
ch creates an inmate that uses 3 of 4 CPU cores, leaving just one for Linux=
), which succeeds roughly on every second try. I didn=E2=80=99t notice this=
 initially because I usually start jailhouse with a script that does =E2=80=
=98enable=E2=80=99 and =E2=80=98create=E2=80=99.
>>>>>> The reason for the hangs seems to be the psci emulation in Jailhouse=
, in particular the CPU_SUSPEND calls. These are issued from my (Xilinx-) k=
ernel frequently if Linux has more than one core available. With SDEI disab=
led the core can be woken up again by some interrupt. With SDEI enabled, th=
e core waits forever on the wfi intstruction. Because a suspended core neve=
r wakes up again the whole system hangs at some point.
>>>>>> Any ideas why no interrupts are seen anymore in psci? My guess is th=
at it=E2=80=99s because the inmate (Linux) now has full control over the GI=
C, so it may disable any interrupts before suspending a core, without Jailh=
ouse noticing. If this is the case, it may be necessary to re-enable the IR=
Qs before executing wfi. But I=E2=80=99m missing the big picture here - wha=
t interrupt is the core waiting for in the first place? Any other thoughts?
>>>>>
>>>>> You likely found a bug in the SDEI feature of Jailhouse. The CPU_SUSP=
END emulation assumes non-SDEI operation, i.e. interception of interrupts b=
y the hypervisor, but that is not true in this mode.
>>>>>
>>>>> We need a way to wait for interrupts without actually receiving them =
when they arrive, but rather return to EL1 then. Maybe re-enabling intercep=
tion, waiting, and then disabling it again before returning would do the tr=
ick. But then I also do not understand yet why https://github.com/bao-proje=
ct/bao-hypervisor/blob/master/src/arch/armv8/psci.c gets away with wfi. Pos=
sibly, they run with interrupts on through the hypervisor, though that woul=
d not be straightforward either.
>>>>
>>>> The good news is that there=E2=80=99s an easy workaround, at least on =
my system: disabling suspend calls before starting jailhouse
>>>> (echo 1 >  /sys/devices//system/cpu/cpu<n>/cpuidle/state1/disable).
>>>>
>>>
>>> Seems the reason I was not seeing this so far is that my config [1] was
>>> lacking CONFIG_ARM_PSCI_CPUIDLE. Seeing it now as well, let's debug.
>>>
>>
>> My ideas seems to work (quick hack):
>>
>> diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-com=
mon/psci.c
>> index 6a9abf60..3bb3f6a8 100644
>> --- a/hypervisor/arch/arm-common/psci.c
>> +++ b/hypervisor/arch/arm-common/psci.c
>> @@ -101,6 +101,14 @@ long psci_dispatch(struct trap_context *ctx)
>>
>>  	case PSCI_0_2_FN_CPU_SUSPEND:
>>  	case PSCI_0_2_FN64_CPU_SUSPEND:
>> +		if (sdei_available) {
>> +			unsigned long hcr;
>> +			arm_read_sysreg(HCR_EL2, hcr);
>> +			arm_write_sysreg(HCR_EL2,
>> +					 hcr | HCR_IMO_BIT | HCR_FMO_BIT);
>> +			asm volatile("wfi" : : : "memory");
>> +			arm_read_sysreg(HCR_EL2, hcr);
                           ^^^^^^
Argh...

>> +		} else
>>  		if (!irqchip_has_pending_irqs()) {
>>  			asm volatile("wfi" : : : "memory");
>>  			irqchip_handle_irq();
>>
>> Now, if someone with more architectural knowledge than I could explain
>> why that's the case and if that will work on all platforms, with both
>> GICv2 and v3 (and maybe even v4), we could convert that into real patch.
>> Trying my luck on the CC list...
>>
>
> N=C3=A4=C3=A4, I was too quick: wfi works, i.e. the hypervisor is woken u=
p on
> pending interrupts, but some more bits than simply clearing IMO/FMO in
> HCR are needed in order to forward that pending irq event to EL1 when
> returning to it.
>

With the above fixed to 'write', it now works fine here.

While trying to understand what goes wrong, I also read what happens in
the IMO/FMO-disabled case when an interrupt arrives while in EL2: It
does not count as wakeup event for wfi. Only if IMO/FMO are set (or
TGE), we are kicked out of wfi. And that's actually independent of the
GIC model.

What's once again unclear to me is if/where I need isb. Before the wfi?
Also after restoring HCR_EL2?

Thanks,
Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1efb0fb2-8acf-0ebc-00bf-ce059c9ae833%40web.de.
