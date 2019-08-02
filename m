Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMFBSDVAKGQETV7R4VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F647F508
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 12:30:08 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id l24sf36826037wrb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 03:30:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564741808; cv=pass;
        d=google.com; s=arc-20160816;
        b=nWToYb/58IxlRTtILRimNvCSjh8Rp946aS0IyMx4qW1M/lrs21cz42tkIvoNglD13E
         OKOEMIcijDHMGoV3U5Oz2zikoRNWDQZPFyRaEWFxiq9EL+p7DoPKsX8HW6gTPkrmrOml
         UCjSaG8nARyMnxPtzV11aetpcRnlpWcV6t7UXT3AJXoUUdlwrDiBjLA7VgyqLErn9bow
         trT4kab7WR8/u7ZxZwKYdLWWP8jZ2pMgJkeqFz70V1UzJ3/ZWlDdRk73Z0Ai3OpkoE/v
         S2zAf92bbKCrGovTlekyeDN8JIG/3TApQv5nXDgVw40KA3mTxlwpKXh0+57E+a5YZB/2
         drgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=JbpGsSVH3CsbRCl5/D6Z4fH3MHP25b+mKDcQ+HAvrTs=;
        b=RYJKe0j9Ii6uhZaS+qieARpmbszUy2lLMbtd7y1Y9zDtZLeXhEsO0Rcy2wxA0/cP0/
         KJXE03nQeia6erFOpqDk4XtYZWtukNA9DWBZ0H9LaNh/wb0Yy8M/5/Jb9dP7A27Z3Lx0
         ng6DS83+9nK/8kR+eZBuDyromUtGPsyNdwsxSvodf5cLwLj2THeAZvGU8XQTk47fzAIh
         akIwIqS5urCOffJ9vFKCDbscG3dp08MzqXEVMNC41kG573bxicTqYqqHiNJmxtRJrUWT
         nlRq0j3ZsY7mvC838eKNiyfSpeI1oW1bjQxNiBVmNiOOctSu1TPfiKzA8i7bb4Yie7OD
         132A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JbpGsSVH3CsbRCl5/D6Z4fH3MHP25b+mKDcQ+HAvrTs=;
        b=HBwMHxNZ6bI+BuL5+gQm7W19aF8ADSN5L82tH4JZ7l0m+mrV09xMSsek+4A3t+dKmw
         LZvQEN3il9M3hTktRjg9bwgv9k8rF2J/k/i33A++NzL2WgiQBwgCHBxXLSeP3pw0TYdJ
         pAMUkD/XEucafmWdwvpopw6CdmyLcGl68bW3ya7f9BoVOAGS1iFNDAjbmJ1keX5EeY0d
         amYIYUYGrVox3OymRiaQlyTnZe6rM587QFYPGRu4ePHHvefqavx5uPB7cvR0D1TwzQYv
         NQDoL5QVLET75FpgrK8e2zPxH/7i6tVnH1k+FD9CP7GYT7ZuC6GHq9D8WTkK2WthgpzQ
         d6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JbpGsSVH3CsbRCl5/D6Z4fH3MHP25b+mKDcQ+HAvrTs=;
        b=ACExJtgr5g8pwv6w5MuJ803pzVlIWb/iPJ46Ubuw834JzRO3yQzOvvwkSVQOMsNXB8
         QKHpxYys6EM2cX4TBddFnIi8XlA8OxxYnZ8hq1dRnTmfYngEKzjTPBmOetEFJgJdieiA
         QL+rNWR52/kDTAfH2xhzJYHi/fQVRO8pkOQIlJ/iynRRRh0OQM4sWlUYAe8CrINCMOYQ
         VwlVNJrPTXPKZ1u32bnSStsakIloo1UOUsAEWEoXmAkRD8E6deewcop0jIptGl1HZ70v
         brRVLJDvwaPgbiiPcv2dRclViz/ikF4ilSXtHq8Q8oRhuTIpF5+wzw+lzUD71KVweI52
         mo8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbRQH+mL15sQru3zhFbEGEh2m8y3SO72PGBJxSw+S7DWo2iC18
	fZLp+7B5h/vQ/eotv598VDM=
X-Google-Smtp-Source: APXvYqyaMdRoM3NfdvDa6KxMESzk+4Tbj4wn9fEakHpplaUDYpR8ukvqThj73Tp09SHCqqJMnwy0DQ==
X-Received: by 2002:a1c:c747:: with SMTP id x68mr3979652wmf.138.1564741808282;
        Fri, 02 Aug 2019 03:30:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls22436634wrd.5.gmail; Fri, 02 Aug
 2019 03:30:07 -0700 (PDT)
X-Received: by 2002:adf:c613:: with SMTP id n19mr89414649wrg.109.1564741807629;
        Fri, 02 Aug 2019 03:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564741807; cv=none;
        d=google.com; s=arc-20160816;
        b=nRx4ws3TNgNHmAbLtP4Y7T8R2uhJT4qwFULSsq5LMWUTY84Awnjv5R6lNPrYa6Umvt
         8xSvq4gOOvVEk3cmPn6YLMHdjXXiI4L20tR7qcjxTAiOfgHSTboLx8p4CQoSlytKdb8h
         pEbgy8J2BObRJNJns4/IYAIGLAc+zP3DJCMKC/H4bxVToTcB8ICJqJxJD0UIY0v5W37M
         kP9DYXGv2+/z+SAnDdNk52pcisHQUGsSCwjYKIx0yU8UMr3rAKs+PrruNVOidzS2dStP
         m53V9DC6NvUtsERyz+80I09fw4Q+Ep6zewvG+fS8aZNOHwgYZZp+7ktWMpDr4b2u+l1G
         6dlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jDo02LNzagUGVcCCDDwVk2JBxrofcTV+XjqAOi7y5wo=;
        b=BSUPA3jPptw91GReP2KZlVhYgwP3Crw9I913JlyK3kjmNXXC7inZ//SedeZ4jGcNvh
         aclOieanpps/v8WPB22UM0gg1Vb4gQl118KXzsGQIIZL9HWou104RYSBsSGX4tZ+GDp3
         ZAJXMMCG1d4Mzj8b1/ZJUG89JHNfgz3s9rpZt8cn5WVDIjMe0qwSpkjk6Ug1KzfZQf7x
         iGfFeRvFahd0C9vvj4YjTp3th/RLeQZIud/7dHH66bfGLse98I42kRDlR17KjnU1c0z8
         Qb7UmoJVfms6EgkZdozsHHuYeve6DvyNxJ/ZGydABLEGpRH4UdUpJzoYP1kluePZ+Oo2
         j/6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 60si2283211wra.2.2019.08.02.03.30.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 03:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x72AU3kI011437
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2019 12:30:03 +0200
Received: from [167.87.36.50] ([167.87.36.50])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x72AU2i8019507;
	Fri, 2 Aug 2019 12:30:02 +0200
Subject: Re: 64 bit Hypervisor crash at 32 bit WFI instruction
To: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>,
        "Antonios Motakis (Tony)" <antonios.motakis@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
 <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
 <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E41E3@BMK019S01.emtrion.local>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <93235ca9-0149-bdc8-4cf5-858bcda26ec8@siemens.com>
Date: Fri, 2 Aug 2019 12:30:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E41E3@BMK019S01.emtrion.local>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 02.08.19 12:24, von Wiarda, Jan wrote:
> Had another debugging session with a Lauterbach debugger. CPU0 still live=
s, but does not respond to interrupts, as the cell does not respond to ping=
s, nor does the serial console work. When I change the inmate WFI to NOP in=
 a live session on the target, the root cell immediately starts to process =
interrupts again. When WFI is hit, interrupts apparently either don't reach=
 CPU0 or are not processed. Which apparently means, that the inmate's WFI s=
omehow blocks the hypervisor, respectively the root cell. Could this be a G=
IC routing problem?

Not sure if I asked this already, but I've seen this error pattern too ofte=
n:
Double-check if neither the root cell nor the non-root one accidentally got
direct (non-intercepted) access to any of the GIC resources.

Jan

>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka [mailto:jan.kiszka@siemens.com]=20
> Gesendet: Dienstag, 23. Juli 2019 12:20
> An: von Wiarda, Jan; Antonios Motakis (Tony); Mark Rutland
> Cc: JailhouseMailingListe
> Betreff: Re: 64 bit Hypervisor crash at 32 bit WFI instruction
>=20
> On 23.07.19 12:14, von Wiarda, Jan wrote:
>> Hi!
>>
>> With
>>
>> asm volatile("nop" : : : "memory");
>>
>> instead of
>>
>> asm volatile("wfi" : : : "memory");
>>
>> it runs just fine.
>>
>>> Is the root cell cpu (CPU 0) specifically crashing with an unexpected s=
ynchronous exit to Jailhouse? What is the output?
>>
>> No, CPU 0 does not crash with any kind of console output, which makes de=
bugging even more difficult. What I observe is, that after hitting WFI, it =
continues to run for a 1-2 seconds and then it stops. Last thing I see from=
 the instrumented code is a printk() from arch_skip_instruction(), which me=
ans it was handling a SYS64 exit.
>=20
> Maybe interrupts get stalled for the root cell - for whatever reason. Do =
you
> have a hardware debugger to analyze the state of the CPUs? Or use QEMU...
>=20
> Jan
>=20
>>
>>> This is a far shot, but maybe the code generated around the WFI is the =
culprit?
>>
>> You might be right, when I place WFI right after inmate_main(), CPU 0 do=
es not starve. But it's completely strange and undefined behaviour, sometim=
es it crashes if I put the WFI right after a printk(), whereas right before=
 the printk() it doesn't crash.
>>
>> Works:
>>
>> void inmate_main(void)
>> {
>> 		...
>> 		asm volatile("wfi" : : : "memory");
>> 		printk("IVSHMEM: Done setting up...\n");
>> 		printk("IVSHMEM: waiting for interrupt.\n");
>> 		//asm volatile("wfi" : : : "memory");
>> }
>>
>> Does not work:
>>
>> void inmate_main(void)
>> {
>> 		...
>> 		//asm volatile("wfi" : : : "memory");
>> 		printk("IVSHMEM: Done setting up...\n");
>> 		printk("IVSHMEM: waiting for interrupt.\n");
>> 		asm volatile("wfi" : : : "memory");
>> }
>>
>> I know this sounds completely strange but I reproduced this multiple tim=
es, compiler is this:
>>
>> gcc version 6.3.0 20170516 (Debian 6.3.0-18)
>>
>> BR,
>> Jan
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Antonios Motakis (Tony) [mailto:antonios.motakis@huawei.com]=20
>> Gesendet: Dienstag, 23. Juli 2019 06:40
>> An: von Wiarda, Jan; Mark Rutland
>> Cc: JailhouseMailingListe; Jan Kiszka
>> Betreff: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
>>
>> Hi Jan,
>>
>> On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
>>> Hi Mark,
>>>
>>> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is th=
e same for 64 bit and 32 bit inmates when the crash happens, except for HCR=
_RW_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>>>
>>
>> It's quite an interesting crash that you have there; I wouldn't expect t=
his to happen.
>>
>> The idea with trapping WFI/WFE is to be able to suspend a VM that is jus=
t waiting for something to happen. Since Jailhouse is a partitioning hyperv=
isor, you shouldn't need to trap it, nor should its use normally influence =
the other cores. Yet something is amiss here.
>>
>> Is the root cell cpu (CPU 0) specifically crashing with an unexpected sy=
nchronous exit to Jailhouse? What is the output?
>>
>> I don't remember what event 0x28001B maps to, I would check the ARM ARM =
first to figure out what the unexpected event in CPU 0 was, for a clue to m=
otivate further investigation.
>>
>> Additionally, this WFI code instructs the compiler that memory contents =
may change, so ordering of generated instructions, inserted barriers etc, a=
re influenced. This is a far shot, but maybe the code generated around the =
WFI is the culprit? Maybe not, but I would try to rule it out:
>> (a) First I'd try replacing the WFI with a nop, to observe the behavior =
without the WFI but without changing compiler behavior and maintaining any =
compiler barriers.
>> (b) I would also try replacing it with an infinite loop ("b .") to get t=
he inmate to wait forever at this position, and see what happens.
>>
>> Happy debugging :)
>>
>> Best regards,
>> Tony
>>
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/93235ca9-0149-bdc8-4cf5-858bcda26ec8%40siemens.com.
