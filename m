Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBM25D7AKGQEJSXZLBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa37.google.com (mail-vk1-xa37.google.com [IPv6:2607:f8b0:4864:20::a37])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC42DC15A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 14:35:03 +0100 (CET)
Received: by mail-vk1-xa37.google.com with SMTP id t200sf4057281vkt.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 05:35:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608125702; cv=pass;
        d=google.com; s=arc-20160816;
        b=qj8SfTnQ5v0AYMGIV+rKWm+iEeE3CYUQ/aHVH8Q4qaHj1hPZS0nAAfWy/WSpwFJlq6
         J6OJWUt9vfZHBbrPzcFS/CIpPA+lacsncZKXFsqEtz7GLHopyB5ENy5PBdCsMEdVE/3a
         uxhLISn7z7nQOU5RPeDnrQWjGCeiwhgh6DLTErdGjoTry1bll8b7QM/x/KcMrV9Hct1c
         IFjvhNPGJwd+DNQH0ro4pr0SzesULi9sl+sxInFCg/4nMoP6yTW7vSfeuP/iexXSL0R9
         YHH2fj20JrYKEHv5iI34pYpVKFFT2TOUKan6IRREeqjUGqpM3xcR49KqafsttUzdl2mP
         +eDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ZjwDLXdVvuzb9TTyuPAtM69IEqxJexzjDsUBxnar3HY=;
        b=s6QisHKBZh/Xzs8ktPii31pJ35vkReQdLWZIvCX/Eg8p5RjLlGO6CZP0juP/AraTX/
         PP7GRaP3+XfHVWYBGI5Kl2vU4gIt/pJhB5EH2Woo04XbS7XifzL9nVgnroVD47DFFi8z
         x1vz4B1FiCfinxirCEqG+cWqvMtwMEjBWLJ7vlsA3olRrpduRD+K8DOj8mV0zVDx9wG0
         38m1baJfjT+Lx0JektnKKEWPH5uP5Yw/4OYRy718id/iFUKq9RYsSo4/u8LwRkLBl8ay
         wx9+oUGJkU5nxAKDn0inPqo6paHTXgJDaS5oSuVNYF941mTP3qq9HjwxnThcej3EqQFp
         tdiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZjwDLXdVvuzb9TTyuPAtM69IEqxJexzjDsUBxnar3HY=;
        b=Jc59FVjuNo6UK1lngAe68HSO1rXd48ztbfQlpZZcLTDhJ48vjS2vch00w/QyxndSWF
         WHCoVpJTS607vP1kCXYscnwG3MF15uw6CgIwzmQDnXAkWa7GPVtYK0BJG8/SZ+KRkh9T
         MBOEiLBjQwG8gyZvXuSrkASqJpg/XR3AM3q2H7VxFbDs3Zs/hnl9GanJEsAtCY30bL+1
         Rh5RUUBdgCA50Z+KeckHNmpIVMIGSgCkwG3pUvUqNPULA2NxbdSIZ18xgADI0PVfpx6j
         uZ3k3x4/RIHSDaAI7PXkSzei0pKnSBg0T1SL9/C0L7sqaPQXOgoLuhupMFo1fLR4ScDD
         cIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZjwDLXdVvuzb9TTyuPAtM69IEqxJexzjDsUBxnar3HY=;
        b=b9aI6/mDn7k/SK70wOoA09C5zCB7m836OVZiWnVt3TzkN8Pw9xY+nLv4q/zjAh7/Vr
         GPe2pyiSmpz/Fl5IIrJ/2dXH8LkaxgFH3D+EQpuvNusRwZ3ukPkOx4LiDTNmYUMv2FqF
         uk8QXZCm+mD+EzuIvLeRbdDYDtpm3CS1m+rA+nRp0PM71jX6fTYGJ+fT5uJyWtnSusyq
         +6pc7jttFGdVxv5GhoZTg/gZXZa7fIc5sJKStoDVS5PTsOwa0qVON1lwJ9gQ7fA6rVmP
         0bqPfdJU6ipOOBYCpZES/ToyV3jbEgrzeD4Ke4f2dctMjo/JiGrUo9IeRg2w25oRPPgg
         dhlg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ONurBrqCz/szWNErUxViWttoC5KJ5dnc7olmFY8Yb2WnzDm/d
	3gLad7G3GIYL4asZdS7qgZQ=
X-Google-Smtp-Source: ABdhPJwekdgrU8Ikw2Esj5F6T0ZKgL4Aho8uA5ZsjmwyIfDeX4edjdro9NJyaFTOYEs38tjMETALRg==
X-Received: by 2002:a67:b341:: with SMTP id b1mr31976971vsm.18.1608125702119;
        Wed, 16 Dec 2020 05:35:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:320c:: with SMTP id y12ls2984607vsy.4.gmail; Wed, 16 Dec
 2020 05:35:01 -0800 (PST)
X-Received: by 2002:a67:80d3:: with SMTP id b202mr32956451vsd.2.1608125701228;
        Wed, 16 Dec 2020 05:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608125701; cv=none;
        d=google.com; s=arc-20160816;
        b=aRvAp14S+3md7Xwug/rAY6K/ZWA8S2NA+qdyZBtqXCH9Ljv51ZwN0sz/8KWZuVsf4b
         33hEX7oZnU+AfiQuDVnKFMGAYBjYgDZfb9hRcC5hih2ovG8gYdmH9mv/rQABA7eqA6Yi
         aJ6UNv5oiZX+SVp/4DUeqocRPfzaH71RhKt6Tea1QT0z8GUGXx9i9Cbww0pfN/0CPwxR
         232cdi7ZeiGIVq2e9P4i8B9OHNRCLke046i/g90lhMWr+T/Phjk5izumw9S3U4DxSmlm
         4o8fCoebyeN/e8ReF2BecEjEOUUM/3LyIzD8dsZlIv9bMtPQBsgvpBahQWlyebRv5Jmk
         hq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JWtI04A7cX1hd542oN+WzgyQMYdPMT2focWPXOYtBNY=;
        b=EzLrmdfS3rdLfVQPRi6IQwDwdy8+90lpNmKBAiy2Ow061T/0kgjo3BOHH0ZwQCB4Ii
         /X9rUPN1lNUiyiiPHhDOtyRaeMRSIYES7gOH1GcG45d6ZgNq3rcf8m6acwtTdTtdd3hR
         zkAkfUShYaDgzXit8IVH7uy8XRbgbiMuidQDsdoljzCfzAEli2Q6AVs6ZrjABFL5tth7
         A8LMLQSOPbns4O1xuyAhRhFTz9TRr4ENZooUDBhuwWQbMeK3gT7pDH4GSFBybCZM8/93
         uaKv9J7StZ8V26XkK0CcZGwhgkqKVd/f78AIo1V7HLOhqqhJjFLTTqrHGXs7ZHpVKEgv
         RtmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e2si283079vkk.0.2020.12.16.05.35.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 05:35:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BGDYxdT026062
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Dec 2020 14:34:59 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BGDYxER017266;
	Wed, 16 Dec 2020 14:34:59 +0100
Subject: Re: Jailhouse Installation Feedback
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <200a59b2-8745-099a-4172-a29dcd22c65e@siemens.com>
Date: Wed, 16 Dec 2020 14:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 10.12.20 16:20, Bram Hooimeijer wrote:
> Dear Jailhouse community,
>=20
> Over the last days I have been trying to get Jailhouse running on real ha=
rdware. I ran into quite some issues, but managed to get it running eventua=
lly.=20
> For some issues, I was able to find a solution somewhere in the mailing a=
rchives, but not for all of them. So I thought I'd share my experiences her=
e for future references.=20
> There's also some solutions which are not entirely clear. If you have any=
 reference on that it would be welcome, but I understand these might be ver=
y system specific as well.=20
>=20
> ** Installing Jailhouse **
> * Installing Jailhouse on generic Ubuntu (2.10) gives the following error=
:=20
>> ERROR: modpost: "lapic_timer_period" [/data/ecseqm/jailhouse/510_siemens=
_jailhouse/driver/jailhouse.ko] undefined!
>> ERROR: modpost: "__get_vm_area_caller" [/data/ecseqm/jailhouse/510_sieme=
ns_jailhouse/driver/jailhouse.ko] undefined!
>> ERROR: modpost: "ioremap_page_range" [/data/ecseqm/jailhouse/510_siemens=
_jailhouse/driver/jailhouse.ko] undefined!
> I believe some of the kernel symbols have been renamed in I believe 5.8. =
As a solution, I switched to 2.04 LTS (Kernel 5.4), where it installed with=
out issues.
>=20

That used to work by luck for some kernels via ksymall, but that is
disabled in other kernels for security reasons - and now even removed
from upstream. You need some patches from the github.com/siemens/linux
jailhouse-enabling/5.4 queue (or queues/jailhouse for the head queue,
that's on git.kiszka.org).

> ** Enabling Jailhouse
> * enabling a compiled sysconfig.cell results in:
>> JAILHOUSE_ENABLE: Invalid argument
> with dmesg listing:
>> jailhouse: Not a system configuration
> This issue was already reported on the mailing list, but I'd like to note=
 that it was not a singular case. Switching from GCC-9 to GCC-7 solved the =
issue for me too. I guess GCC-9 takes the freedom to move the header away f=
rom the initial memory location, which results in Jailhouse failing to veri=
fy the .cell to be a system configuration description.=20
>=20

If that isn't solved in current next, we should address it. The proper
fix is moving away from gcc to a different way of compiling, but that's
another story.

> * enabling results in:=20
>> FATAL: Unhandled MSR write: c8f
> Ubuntu distributions have CONFIG_X86_CPU_RESCTRL=3Dy kernel config set by=
 default. I do not know how widespread this is. Apparently, this conflicts =
with jailhouse, as such a Linux kernel tends to write to 0xc8f: IA32_PQR_AS=
SOC. Disabling rdt over the kernel commandline does not solve the issue. Pe=
rhaps it might be useful to extend the hardware check to check for this fla=
g? Rebuilding the kernel without RESCTRL fixed the issue.
>=20
> * enabling results in:=20
>> FATAL: Invalid MMIO/RAM read, addr: 0x0000000087a6e070 size: 8
>> FATAL: Invalid MMIO/RAM write, addr: 0x0000000087a6e018 size: 0
> These memory accesses are=20
>> 86dff000-924fefff : Reserved
>>   89f5b018-89f5b06f : APEI ERST
>>   89f5b070-89f5d017 : APEI ERST
> The APEI ERST are included by jailhouse by default, however the remainder=
 of the reserved region is not. Passing this to jailhouse solves the issue.=
 Does anybody have any idea where this region could be used for? I expect s=
ome bios driver? Is there a way to detect which driver is interfering here?=
=20
>=20
> * Similarly, a violation was found while destroying a non-root cell:=20
>> FATAL: Invalid PIO read, port: 500 size: 2
> Which jailhouse identifies as:=20
>> /* Port I/O: 0510-0515 : ACPI CPU throttle */
>> PIO_RANGE(0x510, 0x6),
> Again, passing the port solves the issue. Does anybody have a clue why th=
e CPU throttle is required to destroy a non-root cell? Is it an idea to inc=
lude these PIO ports by default in the config creation?
>=20
> The last issues were described to some extend in Jan's ELCE talk in 2016,=
 "Tutorial: Bootstrapping the Partitioning Hypervisor Jailhouse". I really =
liked the introduction and think it is an excellent talk to get started wit=
h Jailhouse.=20
> However, it is not linked in e.g. the readme or the FAQ. This might be be=
neficial.
>=20
> If anyone has any ideas about the PIO/Memory requirements, that would be =
really welcome.=20
>=20
> Thanks for all the efforts put in Jailhouse.=20
>=20

Thanks for this detailed feedback! In general, we are happy to take
contributions also to the README or other docs where you see gaps.
That's best provided by new users as it's too easy for us oversee
details that we know but that aren't sufficiently documented yet.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/200a59b2-8745-099a-4172-a29dcd22c65e%40siemens.com.
