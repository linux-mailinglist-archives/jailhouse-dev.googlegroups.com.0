Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3O3TTTAKGQE7CJ6DZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D541E844
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 19:01:33 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id h13sf81547wmb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:01:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556557293; cv=pass;
        d=google.com; s=arc-20160816;
        b=l8M6xRCFcpfk4W3wCJHci218v0ITHQsa+vlPEuKkJjzX5G46dyNjAgbi/iEv8yP68D
         FTMwKdsFtB0JOrOCDxVQRBpWymZtvU47SK1LDdG5SjZSu8dNDRBsFjzUbwaiR2Y/pXMh
         rxtQlZZ4LDJC94IosRh/Hcpt9EdkP5+86PKaoeIheQYaeIjXiQOZCOP7IcelG+5scS3c
         PIqASsf3V0HYPAaEOXJj2RhQjHgFniPxF+m1dWBT4SPQppBrzzSe+Ljf6A75PgrDnyNA
         Nyj6l2NeZYTi08XcHwcp+3ApYnS0W4tcndSQZ+awutptmT3yq66U4PKhcCXWtIYTYp6/
         HuLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=3Gann0ahn77lkkYeQfigB/6guCP+PLYLjgGJ41/gqEA=;
        b=i+rrIJEpoN9D4jjbOfeOIKyBrI2do0ibppv8ojh3+Q7Ee8Z58Ypwzc+R/eLD3pKHUH
         vD9Us4c6R9q9mja9TOXkg1tRhz+ve78SnRlaS4zEiR7FlIo405PankBgkNvhXdPagQ43
         QtevQThRbX2MUmzwnb+Nf9NuYFSB35ZnjonSNaSo9oH/hL9OdoooMhboLDlN+URTibBf
         tilcV67YA0Ie4KAOlHWQbS1LFgnMZ/5959kAqgtjLbyDl7eYOFOjvJINUinYj46LyVrk
         KGvkeETuS7a4UQDfPuz1179ZG6kL56tkq2nuQqGgZWmKUAmrshVGD7o5N1Lo+5g9GkaS
         z3/A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IrrbEqIn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3Gann0ahn77lkkYeQfigB/6guCP+PLYLjgGJ41/gqEA=;
        b=Shwipb3h2vnpYIOid19Y767yIHRnM6glWyMg4d7nvSkxDOZQa3ErGb2KjrAmVHuuAR
         2ppRva9ATwGzEMF12LbMbe+nEfW1bHqTmef19hEM/cBWEyXtk0dLA7w87/sQO0+HefMl
         XrOmMCLrNoYouACmyez+rqU6fjVU+Xiwb5xqWcSVsw+n/9ZKG+39d2MWSQQT63dAOP3H
         d/NvFz6WJDeB7rFK03mq2KwwRBNdPq/5rUCxS9Wtefd5Bdas3C6fVraV2Kb0KJQ7uiuE
         RCuJILAOzqKo4IJu86lcpnYFsAxBgK+xohd3ueEHhP7tinioOJUJ0CBy2pNJtRAjR+QF
         blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3Gann0ahn77lkkYeQfigB/6guCP+PLYLjgGJ41/gqEA=;
        b=S6o/BfJ1TDuH6EwgXoEAopBNHpRXycXIaJhhRmqZujvfga6blWJPl5bHgIMzhM00Zy
         K7RXcps1mgW25maFaieS4Cc1pj3cGPSVWEnz3lCCeEXZAp9F6c9ofS7BHBTdOd5CwNZc
         Zqicz3CGprELCiTjFoCcE2hYRWykHpYhF4s4D6ngz62KrQimxZ15Zcut1Ik3HTyCVq22
         XxhxEsNatlldGU8ww3gzcr/hs5deEqbof4bj3yX2fTUnrXZJh5WRlJaeZJX/4G2GxkQc
         lWnAewcWkCIdO24alg+dLNQ04xqxs3co4p91+07S0txXhTgYH+ueeZBJC7/ed+YQQvt1
         skfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXTTHVLwisbgxl9Zoy4yzgu8CoB4j7cfot0TN8hBiIZkGncqkB/
	OtzIwiang75TVkZx2dPtpx0=
X-Google-Smtp-Source: APXvYqymZ/hClL2EJFLoaGG49DZkD2N8S54sdi4WcH9B2H2eBz+ztRYOxy6wG2bmgqUdqgN9w7zpFg==
X-Received: by 2002:adf:ea83:: with SMTP id s3mr5779028wrm.139.1556557293271;
        Mon, 29 Apr 2019 10:01:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9696:: with SMTP id y144ls55648wmd.2.gmail; Mon, 29 Apr
 2019 10:01:32 -0700 (PDT)
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr35889wmb.39.1556557292689;
        Mon, 29 Apr 2019 10:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556557292; cv=none;
        d=google.com; s=arc-20160816;
        b=SFZlGTuuagdF48a/YFGCNHo834dHYCjoRZgX4Uqd87F+aXW5sktFRbkJCDqvtXx/qR
         wS9XM0ZzRMOzwpi8eah2dGvI8GaYYpmyivnKZE3l1ZzGmE/kn8OMBuHsao2uOTETUh4C
         zZwIva4PrxIZcWVRbJyTqegrtOrNo5AT7Lf9Qu85I/QFKU14z7Jvo4+pRYJwuIMVcxJh
         20+yQl0l4+3O4mFOlZJqJx9ikjjskOISgN4FvLRHm5IX5QAEbJVwSQhH066Zg5j25sDA
         wKIcvyk9qHCQGGSprE1mv/5uZ680W47s+llaptGDV95LB1RX+A4pZW/65jENmg+V6ZL0
         5XXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=c3/Q/JEOJ3FrOX43+Tps+TTsk7DINBLJsPszMNLN0Tc=;
        b=YF4soSP6eyw35+pf1JtfQRSgwVM+zeUpdvASKeXk70PVV8qA113amKPCp9qEhHSUyX
         b/WOMw9lpEJf/IJW2u4FKJF3HIPWOL8nCnrdn+p59pEzjaSUo6NNSFjXeemLJ+41p0Db
         pTQHvB9oXaR6gzvkgv9P/8+1WKouh8GcpnIQ3cm1OpNp5g7wZoZFVVx2+ODwfzwqWs7T
         RE6MIPVoOYC59vb9AzcJ8eGb+JutUT8oFX6UYoiCEsEBsDFCGersaasvSAFHeEsK/qWN
         Jf6OuoQDNPqosgr4YYvNEHHuHSUMtZj4xuz3dAeCUk/qr+xvxh1JulnFAcIU84U6Pjdf
         adLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IrrbEqIn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id 4si3703wmd.1.2019.04.29.10.01.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44t9t41rlVzy9y;
	Mon, 29 Apr 2019 19:01:32 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 29 Apr
 2019 19:01:32 +0200
Subject: Re: Running on AMD Ryzen
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Jan Kiszka
	<jan.kiszka@web.de>
CC: Henning Schild <henning.schild@siemens.com>,
	<jailhouse-dev@googlegroups.com>
References: <659b46e1-2852-ebb7-9bdb-74d057aa44d4@st.oth-regensburg.de>
 <a0b17fc8-50ad-efae-6505-96c2d8c3aa32@web.de>
 <7fc9b026-822e-3880-a50c-fafd106d3b00@oth-regensburg.de>
 <aed89b6a-35ca-7d4d-3960-597573abee4d@web.de>
 <ccdbf632-e17f-af7d-d523-92ac0be886b2@oth-regensburg.de>
 <20190327175044.46604e0d@md1za8fc.ad001.siemens.net>
 <aedf806e-0b9a-9599-b2c8-d1e2b6aed876@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <b00bb829-c6f9-ace5-d94c-095155af9909@oth-regensburg.de>
Date: Mon, 29 Apr 2019 19:01:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <aedf806e-0b9a-9599-b2c8-d1e2b6aed876@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IrrbEqIn;
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

the issues described in "JAILHOUSE hangs with exception when trying to
enable the root cell" sound similar to what we experience on our AMD
machine. Unfortunately, patches on latest next won't help.

In the meanwhile, we found out that we can revive 'lost' PCI devices if
we remove broken PCI devices and rescan the whole PCI bus (IOW,
reinitialise the whole device).

While removing PCI devices works smoothly while jailhouse is enabled,
rescanning the whole bus will lead to crashes (basically the same issue
that Hakki described).

During the rescan, there were some patterns of errors that occured:

a) PIO access to 0xcfc for several devices (always address 0x74), like:
FATAL: Invalid PCI config write, port: cfc, size 2, address port: 80000b74

b) MMIO PCI MMCONFIG writes for several devices (always reg 110), like:
FATAL: Invalid PCI MMCONFIG write, device 03:00.0, reg: 110, size: 4

c) For an rtl ethernet card, we had some:
FATAL: Invalid PCI MMCONFIG write, device 03:00.0, reg: 70f, size: 1
which doesn't fit to any capability entry.

For each error, we added the WRITE flag to the corresponding capability.
In some cases, we also had to expand the .len field.

So this makes things kind of working for us at the moment, though I have
no clue what I actually did. :-) I need to learn how PCI works to get a
better understanding.

Anyway, this raises some questions:
  - Why is rescanning the PCI bus dangerous?
  - Did we maybe allow some access that shouldn't be permitted?
  - Why didn't the config generator find the right flags/lengths for
    those caps?

Last but not least:
  - There's still something odd when enabling jailhouse, as we loose
    those devices, and the symptoms are related to those of Hakki. Do
    you see some overlap here?

    Maybe the issue that we face is not specific to AMD.

  Ralf

On 4/4/19 11:24 PM, Andrej Utz wrote:
>=20
>=20
> On 27/03/2019 17:50, Henning Schild wrote:
>> Am Wed, 27 Mar 2019 17:15:37 +0100
>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>>
>>> On 3/26/19 6:03 PM, Jan Kiszka wrote:
>>>> On 26.03.19 17:41, Ralf Ramsauer wrote: =20
>>>>> Hi Jan,
>>>>>
>>>>> On 3/25/19 4:03 PM, Jan Kiszka wrote: =20
>>>>>> On 25.03.19 14:18, Andrej Utz wrote: =20
>>>>>>> Greetings Jailhouse developers,
>>>>>>>
>>>>>>> I am trying to run Jailhouse on AMD Ryzen 2700X (x86_64) with
>>>>>>> B450 chipset and
>>>>>>> got into some problems.
>>>>>>>
>>>>>>> After whitelisting some I/O ports and putting "amd_iommu=3Doff
>>>>>>> mce=3Doff" I managed
>>>>>>> to enable Jailhouse, but instantly lost some USB ports (keyboard
>>>>>>> being one of
>>>>>>> them). After some retries I noticed this happens only 80 % of
>>>>>>> the time and it
>>>>>>> seems that some interrupts are never acknowledged and keep
>>>>>>> blocking the USB hub.
>>>>>>> =20
>>>>>>
>>>>>> A typical pattern if the interrupt controller (IOAPIC or even
>>>>>> APIC) is directly
>>>>>> accesses by the guest. Or of the MSI-X page of a PCI device is
>>>>>> passed through.
>>>>>> Double-check if none of the resources is guest-assigned. Jailhouse
>>>>>> needs to
>>>>>> intercept them. =20
>>>>>
>>>>> Looks like jailhouse-config-create might have issues with parsing
>>>>> IVRS tables on AMD. This is why both irq chips had the same ID in
>>>>> our config (cf. Andrej's attachment). =20
>>>>
>>>> Hmm, another variable shadowing like we have in
>>>> jailhouse-hardware-check?=20
>>>>>
>>>>> Parsing the table with hexdump, AMD's manual and five fingers on
>>>>> two hands gave us the correct ID. Andrej will provide a patch soon.
>>>>> (BTW, the python-parsers are really hard to read) =20
>>>>
>>>> Improvement ideas welcome.
>>>>  =20
>>>>>
>>>>> So our APIC IDs were wrong in the system configuration, but still,
>>>>> this doesn't solve the issue.
>>>>>
>>>>> I double checked that the APIC region is not directly assigned to
>>>>> the guest.
>>>>>
>>>>> So in sum, we currently face two issues on AMD:
>>>>> =C2=A0=C2=A0 - Loose USB interrupts on enabling with high probability=
.
>>>>> Disabling jailhouse works, but won't revive it.
>>>>> =C2=A0=C2=A0 - Loose our network device on cell create
>>>>>
>>>>> Somehow, those two problems smell related, and maybe the second
>>>>> one is indirectly solved after solving the first one. Let's see. =20
>>>>
>>>> Do both interrupts have something in common? Maybe something other
>>>> devices that
>>>> still have working interrupts do not? Are they INTx, MSI, MSI-X? =20
>>>
>>> We had a Vodoo-Debugging session today. All interrupts that seem to
>>> disappear are edge-triggered MSI-X interrupts. The first thing we
>>> tried was pci=3Dnomsi. This turns them to legacy IOAPIC interrupts, but
>>> the problem pattern still remains the same.
>>>
>>> When using legacy interrupts, interrupts looked like this:
>>>   - IRQ 25: xhci (some USB 3.1 ports), enp3s0
>>>   - IRQ 29: xhci (some other USB 3.0)
>>>
>>> So IRQ 25 seems to be shared. The funny thing is that while USB 3.0
>>> (IRQ 29) and enp3s0 (IRQ 25) died, USB 3.1 (also IRQ 25) still worked=
=E2=80=A6
>>>
>>> After a while, we found that if there is no ethernet link (cable
>>> disconnected) and no USB devices connected (we use a PS/2 keyboard for
>>> enabling jh), everything seems to be stable after enabling jh. USB +
>>> Ethernet works fine if we bring up devices after enabling.
>>>
>>> Yes, we tried turning it off and on again :-) Subsequent jailhouse
>>> disable/enable sequences then seem to remain stable, it's look like
>>> that it's 'important' that those devices are disconnected before
>>> enabling jailhouse for the first time.
>>>
>>> So at least we found some pattern so far.
>>
>> Not sure if AMD has an SMI counter, but i wonder whether the BIOS is
>> messing with you. BIOSs oftern emulate "good old" input devs until the
>> OS initializes USB, for keyboard usage in the bootloader and so on.
>> The NIC could have such a thing going on for PXE.
>>
>=20
> We disabled all kinds of legacy and emulation stuff in BIOS/UEFI and
> also its network stack (so no PXE) but results were the same.
>=20
> AMD has SMI counter not as a register but as a event csource from IOMMU.
> I let 'perf stat -e smi_recv -e smi_blk' run for some minutes while
> stessing the hardware and randomly disabling cpu cores, but none of the
> expected SMI events occured.
> Even more suprisingly tracing with 'hwlat' in kernel for a while
> produced not a single trace entry. Seems the hardware is really tame at
> least in that aspect.
>=20
> Andrej
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
