Return-Path: <jailhouse-dev+bncBAABBF543PUQKGQEEI4XMRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2A715CD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 12:14:47 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id n25sf9751892wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 03:14:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563876887; cv=pass;
        d=google.com; s=arc-20160816;
        b=0tj0e2w9ymJaXjem0uHSMFnDr8gDhOP8b+tF8uJoYvn05XqQnSV3pnhuhH7GLgA/zk
         YZKQkS9Bv076w9b81AVFVgWu0GrUTbaWX6PmGp03+K+YXoIBMYUS3JZwP1yphtAUi9Eg
         ouo/bsUwlqUAuZNMA+TOvQIeEJiVeW+G8MCe7o9b3ZdfqzR0HofcgvxCIlS0eNaFD5FH
         VKMVchb168WL2WWwGeG1/T0HiyqNUNs6La7LosQ9r7EZHgJspKNuJjufUAwIvBTKPkYD
         P4e36YeA7Bz6Nfo3iCRDa4Kyr3ZvmvBGQ6yL7opVfw7zO3jHV7WeNl7sjkYWFuOkcDQC
         5iAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:acceptlanguage
         :content-language:accept-language:in-reply-to:references:message-id
         :thread-index:thread-topic:subject:date:cc:to:from:sender
         :dkim-signature;
        bh=YRR1x3TrQ+kWIsbpcwqkG1vuDQYK+e3yVTjTzdDPAfU=;
        b=Dj7Mj1hpc80RJVbj50s/O9dhsv+DyIRV/c1tjAeoj+CxC3vL0AZxdmN5aTZxFz/muS
         +ORBXgA4aUvlzctyOJ7P1Zl1ywNM01Cbu6YPYu2W9GLN5QkEOtsIbAvNUBQ4Q1YwvXOb
         1y+EEb91oi+on0Ke6j7yGgo2jnC4ZnMARZaYv5mCJ5f4CFExzzjW6jWsOpmAXwCg+UR2
         3Vvz4vKvyJsz4OIKutQZ4LPDlN0bq0guc5YW5PZCieLcHicVJS4oK90Ar3mVq7O64Ze7
         jZw8GP3nAJg/1xwWzjQPj2AMsiS2L+m1DE2AvI3plFfv4YCwVJkOT89dYdBWWqv1OYrC
         x96g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:date:subject:thread-topic:thread-index:message-id
         :references:in-reply-to:accept-language:content-language
         :acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YRR1x3TrQ+kWIsbpcwqkG1vuDQYK+e3yVTjTzdDPAfU=;
        b=G63YPRdi7nDxB0WtiaAzGk/+GZc+g4bs81k0i1+iEJyzmLx+stvPJzr5K3ThfCCPU2
         sXeCwiB+RmdVtKV6PKSCEcAsdL1crvPmt3nF3dpJs5DRei2+r4dvLTGN3KpGxC4vE7JB
         OSYa6Eclov964MfhlEBF+5YNlG7AUwwVCQ4olDEJhzh1mQYX3BkRqk22/RiLds2UkzKZ
         o5bPBO+WRIegkuEiwtXz1e7Pn3ngb/A0lzqylLTuVxld/ndxcP/cuMXsA9MV8rUsXJaZ
         u8ZQbZkPYFY8cKZRR6+x1PmF6l+PiZn4S/lLn4/GHd/CBQ1GCFMcKOEQey7AQJ2tlrqx
         Rw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:date:subject:thread-topic
         :thread-index:message-id:references:in-reply-to:accept-language
         :content-language:acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YRR1x3TrQ+kWIsbpcwqkG1vuDQYK+e3yVTjTzdDPAfU=;
        b=G+/5If1Gtr4yf1btL8E0Xa1ARGQSlYXTrZLeA/69oMqSKuiZi7HnU5ceXOxw62fWfD
         8xSDqPaQXlOOy2iK7qcvZrG2Z/6vlq3M/C3kTKzxfWkAgE3kbAJy1exy9Jy5fd+n9miV
         Ix55Bnf1ER/cr6Wr0m7LYQzCi8w/lMiEK56IMBPinZ826iA+M2wByrgPB2pHcqGAOWzG
         aVAiqWG/OdZYfXOTuCthLFBYN81DpwLdiWCUG+cc+u1eWlY1SP2pTsZhg26QHKVj3rLJ
         6o3jLMOzYHyeBNt64r2LV9L07wZtDE0KgVQ2+0dMz2LBsMmHJLRcdoEqdouDnjVTIA3M
         oPQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYyz5uC15WFCXGa18QbhX7wPhfZDurDJVoNm4vafjEXBr+jTTR
	GX54SB+MrQ4IT16RVUZc3Uk=
X-Google-Smtp-Source: APXvYqwohnD5aWF1e6ddJbHpB3u4gtwugL/XxjD4El0p5zi+lwIR7Ea3giy+lE+VFUlmGwBEh0dBmw==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr72379487wml.51.1563876887473;
        Tue, 23 Jul 2019 03:14:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5411:: with SMTP id i17ls15206763wmb.2.canary-gmail;
 Tue, 23 Jul 2019 03:14:46 -0700 (PDT)
X-Received: by 2002:a05:600c:2503:: with SMTP id d3mr70427494wma.41.1563876886763;
        Tue, 23 Jul 2019 03:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563876886; cv=none;
        d=google.com; s=arc-20160816;
        b=w/IaX3HNiv+nnwwQ2rQ6KUIgQyZ/6W/3iWUrXpGJ+ED6KyZiE4ACOmrqmGi0BGu6+/
         U2l0GREZDs5IEIS91iSCggTg2rofuSHJhBaYPb5LxsWnkgNWNFEtbqfoNoXdDlyvLPfh
         qu36nttJvqwfUQMrDejL938LxxIHxa560TnpTyNRbLej7CmHvYtamVuIUjC+fBNmqWAQ
         NNdLkYpONKrXsgHbnsbi8ZfSs1g20zG2SSLEzI40G6Dbu1ddES0pO3IVS0E++MI+ZGw3
         kXEPP1u+uY2rhiW5sMCTpsPGtdyE0AdQx9lVeRi53My14lMwjFbsmFlREZEJQ3vneJi4
         KpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:acceptlanguage:content-language:accept-language
         :in-reply-to:references:message-id:thread-index:thread-topic:subject
         :date:cc:to:from;
        bh=0RgdfikR5sgIBZ3WV2KM6KXmsMLeGWpb1pqfFvlNOls=;
        b=lUv1e7zJlj3SZc3Ko9RcsbrdxdckZ9UfAfBzqdVcGV+WVmXW7z0w2QQQu4DNCdcsIh
         xSZpLBDsfTryHFLF8GawyeCxONWi1shyE7K8jhP43KwTfPZvi83m3Jli7tgLyYZe8pfU
         dTw4g+XvofAH/MDFpe1eHYlVQ84grPXjUm3ElcNvrXgulBRHNwWHi80FpvlEFwqjXZ1f
         VpTyldieSbFvsuj2FIJwPbCpIw+sn4+NRcR3iNORXBieziNvjrDhB+ZvqmRKtVpLuk/l
         +mmnnIw+uxAMACyC7X72LJtb3jzwq9xZ5hcl8A93CKXk8boDITh3cM4BUdElTLZSPmWV
         NSlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
Received: from mail3.emtrion.de (mail3.emtrion.de. [80.150.99.69])
        by gmr-mx.google.com with ESMTPS id b15si1413309wmg.1.2019.07.23.03.14.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 03:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as permitted sender) client-ip=80.150.99.69;
Received: from BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0]) by
 BMK019S01.emtrion.local ([fe80::85d1:497:bc1c:78d0%10]) with mapi; Tue, 23
 Jul 2019 12:14:33 +0200
Content-Type: multipart/mixed;
	boundary="_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3DBDBMK019S01emtr_"
From: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
To: "Antonios Motakis (Tony)" <antonios.motakis@huawei.com>, Mark Rutland
	<mark.rutland@arm.com>
CC: JailhouseMailingListe <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
Date: Tue, 23 Jul 2019 12:14:14 +0200
Subject: AW: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Topic: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
Thread-Index: AdVBEM2xaAHq8Mo/S662uBGeOX2v2gALH+mA
Message-ID: <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
 <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
In-Reply-To: <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
Accept-Language: de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
acceptlanguage: de-DE
x-tm-as-product-ver: SMEX-11.0.0.4283-8.100.1062-24788.000
x-tm-as-result: No--4.124100-8.000000-31
x-tm-as-matchedid: 700225-703140-701090-703503-139010-704053-700759-705153-7
	01058-704074-704498-700278-704328-702975-705161-702852-701432-188019-701443
	-705220-703949-705022-853813-853550-853702-702887-850298-702600-705249-7800
	22-704718-702147-702500-704714-702146-704599-105700-701667-702877-105250-70
	1803-701075-700786-703300-702301-700492-702409-702798-701901-148004-148133-
	42000-42003-63
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Original-Sender: jan.vonwiarda@emtrion.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.vonwiarda@emtrion.de designates 80.150.99.69 as
 permitted sender) smtp.mailfrom=Jan.vonWiarda@emtrion.de
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

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3DBDBMK019S01emtr_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

With

asm volatile("nop" : : : "memory");

instead of

asm volatile("wfi" : : : "memory");

it runs just fine.

> Is the root cell cpu (CPU 0) specifically crashing with an unexpected syn=
chronous exit to Jailhouse? What is the output?

No, CPU 0 does not crash with any kind of console output, which makes debug=
ging even more difficult. What I observe is, that after hitting WFI, it con=
tinues to run for a 1-2 seconds and then it stops. Last thing I see from th=
e instrumented code is a printk() from arch_skip_instruction(), which means=
 it was handling a SYS64 exit.

> This is a far shot, but maybe the code generated around the WFI is the cu=
lprit?

You might be right, when I place WFI right after inmate_main(), CPU 0 does =
not starve. But it's completely strange and undefined behaviour, sometimes =
it crashes if I put the WFI right after a printk(), whereas right before th=
e printk() it doesn't crash.

Works:

void inmate_main(void)
{
		...
		asm volatile("wfi" : : : "memory");
		printk("IVSHMEM: Done setting up...\n");
		printk("IVSHMEM: waiting for interrupt.\n");
		//asm volatile("wfi" : : : "memory");
}

Does not work:

void inmate_main(void)
{
		...
		//asm volatile("wfi" : : : "memory");
		printk("IVSHMEM: Done setting up...\n");
		printk("IVSHMEM: waiting for interrupt.\n");
		asm volatile("wfi" : : : "memory");
}

I know this sounds completely strange but I reproduced this multiple times,=
 compiler is this:

gcc version 6.3.0 20170516 (Debian 6.3.0-18)

BR,
Jan

-----Urspr=C3=BCngliche Nachricht-----
Von: Antonios Motakis (Tony) [mailto:antonios.motakis@huawei.com]=20
Gesendet: Dienstag, 23. Juli 2019 06:40
An: von Wiarda, Jan; Mark Rutland
Cc: JailhouseMailingListe; Jan Kiszka
Betreff: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction

Hi Jan,

On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
> Hi Mark,
>=20
> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the =
same for 64 bit and 32 bit inmates when the crash happens, except for HCR_R=
W_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>=20

It's quite an interesting crash that you have there; I wouldn't expect this=
 to happen.

The idea with trapping WFI/WFE is to be able to suspend a VM that is just w=
aiting for something to happen. Since Jailhouse is a partitioning hyperviso=
r, you shouldn't need to trap it, nor should its use normally influence the=
 other cores. Yet something is amiss here.

Is the root cell cpu (CPU 0) specifically crashing with an unexpected synch=
ronous exit to Jailhouse? What is the output?

I don't remember what event 0x28001B maps to, I would check the ARM ARM fir=
st to figure out what the unexpected event in CPU 0 was, for a clue to moti=
vate further investigation.

Additionally, this WFI code instructs the compiler that memory contents may=
 change, so ordering of generated instructions, inserted barriers etc, are =
influenced. This is a far shot, but maybe the code generated around the WFI=
 is the culprit? Maybe not, but I would try to rule it out:
(a) First I'd try replacing the WFI with a nop, to observe the behavior wit=
hout the WFI but without changing compiler behavior and maintaining any com=
piler barriers.
(b) I would also try replacing it with an infinite loop ("b .") to get the =
inmate to wait forever at this position, and see what happens.

Happy debugging :)

Best regards,
Tony

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD%40BMK019S01.emtrio=
n.local.

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3DBDBMK019S01emtr_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
dgBvAG4AVwBpAGEAcgBkAGEAQABlAG0AdAByAGkAbwBuAC4AZABlAAAAAAAfAGQAAQAAAAoAAABT
AE0AVABQAAAAAAACAUEAAQAAAHQAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIB2AG8AbgAgAFcA
aQBhAHIAZABhACwAIABKAGEAbgAAAFMATQBUAFAAAABKAGEAbgAuAHYAbwBuAFcAaQBhAHIAZABh
AEAAZQBtAHQAcgBpAG8AbgAuAGQAZQAAAB8AGgwBAAAAIAAAAHYAbwBuACAAVwBpAGEAcgBkAGEA
LAAgAEoAYQBuAAAAHwAfDAEAAAAyAAAASgBhAG4ALgB2AG8AbgBXAGkAYQByAGQAYQBAAGUAbQB0
AHIAaQBvAG4ALgBkAGUAAAAAAB8AHgwBAAAACgAAAFMATQBUAFAAAAAAAAIBGQwBAAAAdAAAAAAA
AACBKx+kvqMQGZ1uAN0BD1QCAAAAgHYAbwBuACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAUwBN
AFQAUAAAAEoAYQBuAC4AdgBvAG4AVwBpAGEAcgBkAGEAQABlAG0AdAByAGkAbwBuAC4AZABlAAAA
HwAxQAEAAAACAAAAAAAAAAsAQDoBAAAAHwAwQAEAAAACAAAAAAAAAB8AGgABAAAAEgAAAEkAUABN
AC4ATgBvAHQAZQAAAAAAAwDxPwcEAAALAEA6AQAAAAMA/T/kBAAAAgELMAEAAAAQAAAAG8KEtnYB
5k+Uj308ltsjKQMAFwABAAAAQAA5AACfy2A/QdUBQAAIMNA88Gs/QdUBCwACAAEAAAALACMAAAAA
AAMAJgAAAAAACwApAAAAAAALACsAAAAAAAMALgAAAAAAAwA2AAAAAAAfAHAAAQAAAGwAAABBAFcA
OgAgADYANAAgAGIAaQB0ACAASAB5AHAAZQByAHYAaQBzAG8AcgAgAGMAcgBhAHMAaAAgAGEAdAAg
ADMAMgAgAGIAaQB0ACAAVwBGAEkAIABpAG4AcwB0AHIAdQBjAHQAaQBvAG4AAAACAXEAAQAAABsA
AAAB1UEQzbFoAerwyj9Lrra4EZ45fa/aAAsf6YAAHwA1EAEAAACKAAAAPAA5ADUARgA1ADEARgA0
AEIAOQAwADIAQwBBAEMANAAwAEEARgA0ADUAOQAyADAANQBGADYAMwAyADIARgAwADEAQwA0AEUA
RQAwAEUAMwBEAEIARABAAEIATQBLADAAMQA5AFMAMAAxAC4AZQBtAHQAcgBpAG8AbgAuAGwAbwBj
AGEAbAA+AAAAAAAfADkQAQAAAN4BAAA8ADkANQBGADUAMQBGADQAQgA5ADAAMgBDAEEAQwA0ADAA
QQBGADQANQA5ADIAMAA1AEYANgAzADIAMgBGADAAMQBDADQARQBFADAARQAzAEMAQgA0AEAAQgBN
AEsAMAAxADkAUwAwADEALgBlAG0AdAByAGkAbwBuAC4AbABvAGMAYQBsAD4AIAA8ADIAMAAxADkA
MAA3ADIAMgAwADkANAA3ADUAMgAuAEcAQgAyADgANAAwADAAQABsAGEAawByAGkAZABzAC4AYwBh
AG0AYgByAGkAZABnAGUALgBhAHIAbQAuAGMAbwBtAD4AIAA8ADkANQBGADUAMQBGADQAQgA5ADAA
MgBDAEEAQwA0ADAAQQBGADQANQA5ADIAMAA1AEYANgAzADIAMgBGADAAMQBDADQARQBFADAARQAz
AEQAMQA0AEAAQgBNAEsAMAAxADkAUwAwADEALgBlAG0AdAByAGkAbwBuAC4AbABvAGMAYQBsAD4A
IAA8ADUANQAxADgAYQBiADgAOQAtADEANQBjADcALQBjADEAYwAyAC0AYwA1ADYAZQAtAGYAOAA0
ADAAYwBjADIAOQA2AGMAZQBjAEAAaAB1AGEAdwBlAGkALgBjAG8AbQA+AAAAAAAfAEIQAQAAAGQA
AAA8ADUANQAxADgAYQBiADgAOQAtADEANQBjADcALQBjADEAYwAyAC0AYwA1ADYAZQAtAGYAOAA0
ADAAYwBjADIAOQA2AGMAZQBjAEAAaAB1AGEAdwBlAGkALgBjAG8AbQA+AAAAAwCAEP////8fAPMQ
AQAAAIQAAABBAFcAJQAzAEEAIABBAFcAJQAzAEEAIAA2ADQAIABiAGkAdAAgAEgAeQBwAGUAcgB2
AGkAcwBvAHIAIABjAHIAYQBzAGgAIABhAHQAIAAzADIAIABiAGkAdAAgAFcARgBJACAAaQBuAHMA
dAByAHUAYwB0AGkAbwBuAC4ARQBNAEwAAAALAPQQAAAAAAsA9RAAAAAACwD2EAAAAABAAAcwktrt
az9B1QECARAwAQAAAEYAAAAAAAAAq892ocnX80KwWPR1KKRELAcAlfUfS5AsrECvRZIF9jIvAQC0
ndcJAQAARrBVRfc5qk27e/xZnl0dTAC32mp7tQAAAAADAN4/6f0AAB8A+D8BAAAAIAAAAHYAbwBu
ACAAVwBpAGEAcgBkAGEALAAgAEoAYQBuAAAAAgH5PwEAAACEAAAAAAAAANynQMjAQhAatLkIACsv
4YIBAAAAAAAAAC9PPUZJUlNUIE9SR0FOSVpBVElPTi9PVT1FWENIQU5HRSBBRE1JTklTVFJBVElW
RSBHUk9VUCAoRllESUJPSEYyM1NQRExUKS9DTj1SRUNJUElFTlRTL0NOPUpBTi5WT05XSUFSREEA
HwD6PwEAAAAgAAAAdgBvAG4AIABXAGkAYQByAGQAYQAsACAASgBhAG4AAAACAfs/AQAAAIQAAAAA
AAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089RklSU1QgT1JHQU5JWkFUSU9OL09VPUVYQ0hB
TkdFIEFETUlOSVNUUkFUSVZFIEdST1VQIChGWURJQk9IRjIzU1BETFQpL0NOPVJFQ0lQSUVOVFMv
Q049SkFOLlZPTldJQVJEQQADABlAAAAAAAMAGkAAAAAAAwAJWQEAAAADAACACCAGAAAAAADAAAAA
AAAARgAAAAAQhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAAAwAAgAMgBgAA
AAAAwAAAAAAAAEYAAAAAAYEAAAAAAAAFAACAAyAGAAAAAADAAAAAAAAARgAAAAACgQAAAAAAAAAA
AAADAACAAyAGAAAAAADAAAAAAAAARgAAAAATgQAAAQAAAAsAAIADIAYAAAAAAMAAAAAAAABGAAAA
AByBAAAAAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAJoEAAAAAAAADAACAAyAGAAAAAADAAAAA
AAAARgAAAAAQgQAAAAAAAAMAAIADIAYAAAAAAMAAAAAAAABGAAAAABGBAAAAAAAAAwAAgAMgBgAA
AAAAwAAAAAAAAEYAAAAAKoEAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAAAAApgQAAAAAAAAsA
AIADIAYAAAAAAMAAAAAAAABGAAAAACSBAAAAAAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAALIEA
AAAAAAAfAACAAyAGAAAAAADAAAAAAAAARgAAAAAngQAAAQAAAAIAAAAAAAAAAwAAgAMgBgAAAAAA
wAAAAAAAAEYAAAAAEoEAAAEAAAAfAACAAyAGAAAAAADAAAAAAAAARgAAAAAhgQAAAQAAAAIAAAAA
AAAACwAAgAMgBgAAAAAAwAAAAAAAAEYAAAAAA4EAAAAAAAADAACAAyAGAAAAAADAAAAAAAAARgAA
AAAjgQAA////fwsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAAwAAgAggBgAAAAAAwAAA
AAAAAEYAAAAAAYUAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAAYhQAAAAAAAAsAAIAIIAYA
AAAAAMAAAAAAAABGAAAAAAaFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAgoUAAAAAAAAD
AA00+T8AAAIBFDQBAAAAEAAAAFSUocApfxAbpYcIACsqJRcfAD0AAQAAAAoAAABBAFcAOgAgAAAA
AAAfADcAAQAAAHQAAABBAFcAOgAgAEEAVwA6ACAANgA0ACAAYgBpAHQAIABIAHkAcABlAHIAdgBp
AHMAbwByACAAYwByAGEAcwBoACAAYQB0ACAAMwAyACAAYgBpAHQAIABXAEYASQAgAGkAbgBzAHQA
cgB1AGMAdABpAG8AbgAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAB4AAABhAGMAYwBlAHAAdABs
AGEAbgBnAHUAYQBnAGUAAAAAAAEAAAAMAAAAZABlAC0ARABFAAAAHwAAgIYDAgAAAAAAwAAAAAAA
AEYBAAAAIAAAAHgALQBtAHMALQBoAGEAcwAtAGEAdAB0AGEAYwBoAAAAAQAAAAIAAAAAAAAAHwAA
gIYDAgAAAAAAwAAAAAAAAEYBAAAAKAAAAHgALQB0AG0ALQBhAHMALQBwAHIAbwBkAHUAYwB0AC0A
dgBlAHIAAAABAAAATAAAAFMATQBFAFgALQAxADEALgAwAC4AMAAuADQAMgA4ADMALQA4AC4AMQAw
ADAALgAxADAANgAyAC0AMgA0ADcAOAA4AC4AMAAwADAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AAAeAAAAeAAtAHQAbQAtAGEAcwAtAHIAZQBzAHUAbAB0AAAAAAABAAAAMgAAAE4AbwAtAC0ANAAu
ADEAMgA0ADEAMAAwAC0AOAAuADAAMAAwADAAMAAwAC0AMwAxAAAAAAAfAACAhgMCAAAAAADAAAAA
AAAARgEAAAAkAAAAeAAtAHQAbQAtAGEAcwAtAG0AYQB0AGMAaABlAGQAaQBkAAAAAQAAAPICAAA3
ADAAMAAyADIANQAtADcAMAAzADEANAAwAC0ANwAwADEAMAA5ADAALQA3ADAAMwA1ADAAMwAtADEA
MwA5ADAAMQAwAC0ANwAwADQAMAA1ADMALQA3ADAAMAA3ADUAOQAtADcAMAA1ADEANQAzAC0ANwAJ
ADAAMQAwADUAOAAtADcAMAA0ADAANwA0AC0ANwAwADQANAA5ADgALQA3ADAAMAAyADcAOAAtADcA
MAA0ADMAMgA4AC0ANwAwADIAOQA3ADUALQA3ADAANQAxADYAMQAtADcAMAAyADgANQAyAC0ANwAw
ADEANAAzADIALQAxADgAOAAwADEAOQAtADcAMAAxADQANAAzAAkALQA3ADAANQAyADIAMAAtADcA
MAAzADkANAA5AC0ANwAwADUAMAAyADIALQA4ADUAMwA4ADEAMwAtADgANQAzADUANQAwAC0AOAA1
ADMANwAwADIALQA3ADAAMgA4ADgANwAtADgANQAwADIAOQA4AC0ANwAwADIANgAwADAALQA3ADAA
NQAyADQAOQAtADcAOAAwADAACQAyADIALQA3ADAANAA3ADEAOAAtADcAMAAyADEANAA3AC0ANwAw
ADIANQAwADAALQA3ADAANAA3ADEANAAtADcAMAAyADEANAA2AC0ANwAwADQANQA5ADkALQAxADAA
NQA3ADAAMAAtADcAMAAxADYANgA3AC0ANwAwADIAOAA3ADcALQAxADAANQAyADUAMAAtADcAMAAJ
ADEAOAAwADMALQA3ADAAMQAwADcANQAtADcAMAAwADcAOAA2AC0ANwAwADMAMwAwADAALQA3ADAA
MgAzADAAMQAtADcAMAAwADQAOQAyAC0ANwAwADIANAAwADkALQA3ADAAMgA3ADkAOAAtADcAMAAx
ADkAMAAxAC0AMQA0ADgAMAAwADQALQAxADQAOAAxADMAMwAtAAkANAAyADAAMAAwAC0ANAAyADAA
MAAzAC0ANgAzAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA6AAAAeAAtAHQAbQAtAGEAcwAt
AHUAcwBlAHIALQBhAHAAcAByAG8AdgBlAGQALQBzAGUAbgBkAGUAcgAAAAAAAQAAAAYAAABOAG8A
AAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AdABtAC0AYQBzAC0AdQBzAGUAcgAt
AGIAbABvAGMAawBlAGQALQBzAGUAbgBkAGUAcgAAAAEAAAAGAAAATgBvAAAAAABr8A==

--_000_95F51F4B902CAC40AF459205F6322F01C4EE0E3DBDBMK019S01emtr_--
