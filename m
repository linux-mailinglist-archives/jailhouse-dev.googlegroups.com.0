Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSN25H7AKGQEC2BIQ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9B2DC6F5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 20:17:30 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id a10sf14042776lfg.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 11:17:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608146249; cv=pass;
        d=google.com; s=arc-20160816;
        b=mxkyHUsbNEOgjaeL4Qq+BgKzEg2L7Gya7cP9bl5pok5JkV/QKR5FfnEgczWzrx+AwM
         TO4x9WA8WLg/g+V3RL8Y+17QW8ybTMYEhn6w38iJ4I3Hq8IixBupU2f++QUSUTGEJpaZ
         VnD20hJII/YU58d5J8+URz032i4b5Pghez10NpXzMxAPFrfpc5IOD1hFZR/66+F4SenX
         p9lRgFhu4NnpsuTosLHpVRviJdEt0szDy8RGoq2GswwqCNDIJNqcH8/hOcDrRWObbp4a
         RpJhfc6z/eONKKYzk8JlQ2aWTybFakJ9Gc6lfgtkZSqx/RFHnR7k8iG4mWcJYEpz72cu
         d0Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=hGkM+XFB1EbvPluhC6QYwF2bXI+Cd1z5uImOq0qKo3k=;
        b=VK+7dyyFinPslj1AX/oX6JMFlCrYFeABQMwbLEs7XK/TP0Zx4EAMG4RYzmc15vK2bB
         Jk/8jLespR5K5iwGpudDM35JSkNvuAgQu3Pbk1jY0wHR+g447ghchJN6RZWuRvnlDAhI
         rCA15JPvVMafJHy/+FSVwCi+Mie37Lx4PQaGohhvI9u1gKB7idDz2UsChyHz6V/SuCCA
         iS9uDzcnfyowKUG5I4E6asU1GmCw1wuUS2uEFS4QNQw2NpY3mhqy/kXGmUGenNKLumw6
         ial0WKFcjVQ+R/lpYN2SSa8XGOx150/2kpILcN0bPTLxBRYf/dIVxhrGD8Ll5QJEXcyn
         lcGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CoEVNlKj;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hGkM+XFB1EbvPluhC6QYwF2bXI+Cd1z5uImOq0qKo3k=;
        b=KQGe1c9l0hiCokzxGqLODXV+N5AtgVd7zkBO6QRxJ5rpi2/itJdbhJCN0fQEsgr4qU
         HC4M7DrFX9df9fxT0HbJqxpZppU7pu6VrN9p08hWfhClFLGr11aSjPAUGLuvEq1wB4s2
         0kGIZwZ0g2FmdZQvcYcOu/JBx94tzo2mOIBSNFFCMnofqNdEFCvmx0qJ9MCNimIXV1H3
         IZdNWJRnDE70NFfNvkkXogpUCE3T1mMblaST0khWqlMNyeVtzoXQfDdiWUpXh98vYDCQ
         YgCebhfHttwKtogzteQAFYILGOVjpRgbZOscBJcShbfQiKWOZsaMF+CpwUQA1oBle9Xu
         WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hGkM+XFB1EbvPluhC6QYwF2bXI+Cd1z5uImOq0qKo3k=;
        b=DwZ8QOR1BvFHAmKhAJbBbhu7sh2jL91d5y8p8kY7rR0K39psx0Sn4WqPeOzd9AKMDm
         eHtEoFA9S3X9pogOwiQtROCQ9A+v34IR5qvAutJvcw5Ndd3KjB/1rKqUaDs2vCskL79J
         0sZAmnWw+6/E+q0G8vI+9UKW4bJuEl/vsOazQ9kLXadI05O3h0/Z7f2zJ32JMi4eLN7h
         cul61yX/46gcAa9UgxhkXIe1ndjn1b7Ke5aGSqwIWCg86B1A11ONYzqewzYHul1Bw4Wc
         66YihTItnUo1UTNOZWd8cBrfEuy5KYm29i1Q6EgKRQtu9nhkhPJeo7FD83aRtI3fhyN4
         O50A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532c0GrHB52bYVbyGVXyzqDqftlEDp6LWLHuxlmcBizo3kTW6lFj
	x6d54EPG/qYi5nT/DdHAlcI=
X-Google-Smtp-Source: ABdhPJxsSyS8/vS5nG0B2+Puj5B5fQFzmhGdQiL9f4l6zG/yLxzGlal4EH8kqig3tAjWuACiXEcVhw==
X-Received: by 2002:a2e:b012:: with SMTP id y18mr14547099ljk.396.1608146249589;
        Wed, 16 Dec 2020 11:17:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8055:: with SMTP id p21ls5329920ljg.5.gmail; Wed, 16 Dec
 2020 11:17:28 -0800 (PST)
X-Received: by 2002:a2e:8e94:: with SMTP id z20mr11389069ljk.450.1608146248242;
        Wed, 16 Dec 2020 11:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608146248; cv=none;
        d=google.com; s=arc-20160816;
        b=vpknZGf/lh0qQoyYxHeGyg8EHGNYOFtuJuWocOEDAgrs2KMHQ5cLtlenI45ume4wJB
         vuyuAKDoCe0txhvbhqTPedLKxsSdqacb3PiakwK2ybXGdXpGyFjNKBg1aYkGOLToa8XM
         2oWCEGZNYd9m02MdesXyc7TPyyVE1it2oMfMztgFJ/9DEGXuLbqO10UUGMyL8rPWxfiE
         v3VZKSBa7WhpykDEi5T0gchlOr+deAqxt2Qz0ynH+XapF5YFCA0pwOXOfzLzThj3ZMYE
         ZEX4Qlmj6YHKY4TPqUlUz9ngFZk9AUrkIPUxaNCIMBt1X6w4/5PDPhCwj9Y4qixcXrxA
         xBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=lZ3TE5vne+7ARrSUst1F4sUr+UU1ZkJS7/k+5HCFT+k=;
        b=iR+GIBAG2TI+W/3lmFNBcYPBv1R12YBq7e5VePaw92L6CH6aGuZ8EkxfmZN94Geubl
         OL2lqyX4uZKjLyJ+u10YrbW2U5wPGpcUvs3wkcXByqEhLwpjKKytIcnUAOGhYxLdeEqA
         uhfdHUtVo16qladrJLXgSTn2EwQMGuxuBRRYtqlrVX1lJ6BacyburlQhxxmZUtSvRlBb
         mNALaMiETSnrXudRquh49Qy6pe3puHofEAkHl2aAPZafI2VRQHOJRemZKc2Gf5vwHqzc
         YV0LONSDan7wANxdJJffI6GFAJ2sMLqDneEtreqdkzt2HAn6m4vZNmF/79m9TMFEvpoa
         HOwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CoEVNlKj;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id j15si201364lfk.12.2020.12.16.11.17.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 11:17:28 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cx4dM3CSyzyQM;
	Wed, 16 Dec 2020 20:17:27 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.871
X-Spam-Level: 
X-Spam-Status: No, score=-2.871 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_BND=0.001, LRZ_HAS_CLANG=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_HTTP_SINGLE=0.001, LRZ_URL_PLAIN_SINGLE=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id XpqTNysGMauB; Wed, 16 Dec 2020 20:17:26 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cx48b1rNwzyWQ;
	Wed, 16 Dec 2020 19:55:59 +0100 (CET)
Subject: Re: Jailhouse Installation Feedback
To: Jan Kiszka <jan.kiszka@siemens.com>,
 Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663A103382B6B698EB2B7EBB6CB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <200a59b2-8745-099a-4172-a29dcd22c65e@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <64c38e90-8dc5-9b2e-804d-3a098825f7d8@tum.de>
Date: Wed, 16 Dec 2020 19:55:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <200a59b2-8745-099a-4172-a29dcd22c65e@siemens.com>
Content-Type: multipart/mixed;
 boundary="------------A90BCD37891EECD124AF8D85"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=CoEVNlKj;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

This is a multi-part message in MIME format.
--------------A90BCD37891EECD124AF8D85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On 16/12/2020 14:34, Jan Kiszka wrote:
> On 10.12.20 16:20, Bram Hooimeijer wrote:
>> Dear Jailhouse community,
>>
>> Over the last days I have been trying to get Jailhouse running on real h=
ardware. I ran into quite some issues, but managed to get it running eventu=
ally.=20
>> For some issues, I was able to find a solution somewhere in the mailing =
archives, but not for all of them. So I thought I'd share my experiences he=
re for future references.=20
>> There's also some solutions which are not entirely clear. If you have an=
y reference on that it would be welcome, but I understand these might be ve=
ry system specific as well.=20
>>
>> ** Installing Jailhouse **
>> * Installing Jailhouse on generic Ubuntu (2.10) gives the following erro=
r:=20
>>> ERROR: modpost: "lapic_timer_period" [/data/ecseqm/jailhouse/510_siemen=
s_jailhouse/driver/jailhouse.ko] undefined!
>>> ERROR: modpost: "__get_vm_area_caller" [/data/ecseqm/jailhouse/510_siem=
ens_jailhouse/driver/jailhouse.ko] undefined!
>>> ERROR: modpost: "ioremap_page_range" [/data/ecseqm/jailhouse/510_siemen=
s_jailhouse/driver/jailhouse.ko] undefined!
>> I believe some of the kernel symbols have been renamed in I believe 5.8.=
 As a solution, I switched to 2.04 LTS (Kernel 5.4), where it installed wit=
hout issues.
>>
>=20
> That used to work by luck for some kernels via ksymall, but that is
> disabled in other kernels for security reasons - and now even removed
> from upstream. You need some patches from the github.com/siemens/linux
> jailhouse-enabling/5.4 queue (or queues/jailhouse for the head queue,
> that's on git.kiszka.org).
>=20
>> ** Enabling Jailhouse
>> * enabling a compiled sysconfig.cell results in:
>>> JAILHOUSE_ENABLE: Invalid argument
>> with dmesg listing:
>>> jailhouse: Not a system configuration
>> This issue was already reported on the mailing list, but I'd like to not=
e that it was not a singular case. Switching from GCC-9 to GCC-7 solved the=
 issue for me too. I guess GCC-9 takes the freedom to move the header away =
from the initial memory location, which results in Jailhouse failing to ver=
ify the .cell to be a system configuration description.=20
>>
>=20
> If that isn't solved in current next, we should address it. The proper
> fix is moving away from gcc to a different way of compiling, but that's
> another story.

If it's the same issue that was reported in October ("Jailhouse in qemu and
ubuntu"), then maybe the attached patch could help.

Thanks,
Andrea

>=20
>> * enabling results in:=20
>>> FATAL: Unhandled MSR write: c8f
>> Ubuntu distributions have CONFIG_X86_CPU_RESCTRL=3Dy kernel config set b=
y default. I do not know how widespread this is. Apparently, this conflicts=
 with jailhouse, as such a Linux kernel tends to write to 0xc8f: IA32_PQR_A=
SSOC. Disabling rdt over the kernel commandline does not solve the issue. P=
erhaps it might be useful to extend the hardware check to check for this fl=
ag? Rebuilding the kernel without RESCTRL fixed the issue.
>>
>> * enabling results in:=20
>>> FATAL: Invalid MMIO/RAM read, addr: 0x0000000087a6e070 size: 8
>>> FATAL: Invalid MMIO/RAM write, addr: 0x0000000087a6e018 size: 0
>> These memory accesses are=20
>>> 86dff000-924fefff : Reserved
>>>   89f5b018-89f5b06f : APEI ERST
>>>   89f5b070-89f5d017 : APEI ERST
>> The APEI ERST are included by jailhouse by default, however the remainde=
r of the reserved region is not. Passing this to jailhouse solves the issue=
. Does anybody have any idea where this region could be used for? I expect =
some bios driver? Is there a way to detect which driver is interfering here=
?=20
>>
>> * Similarly, a violation was found while destroying a non-root cell:=20
>>> FATAL: Invalid PIO read, port: 500 size: 2
>> Which jailhouse identifies as:=20
>>> /* Port I/O: 0510-0515 : ACPI CPU throttle */
>>> PIO_RANGE(0x510, 0x6),
>> Again, passing the port solves the issue. Does anybody have a clue why t=
he CPU throttle is required to destroy a non-root cell? Is it an idea to in=
clude these PIO ports by default in the config creation?
>>
>> The last issues were described to some extend in Jan's ELCE talk in 2016=
, "Tutorial: Bootstrapping the Partitioning Hypervisor Jailhouse". I really=
 liked the introduction and think it is an excellent talk to get started wi=
th Jailhouse.=20
>> However, it is not linked in e.g. the readme or the FAQ. This might be b=
eneficial.
>>
>> If anyone has any ideas about the PIO/Memory requirements, that would be=
 really welcome.=20
>>
>> Thanks for all the efforts put in Jailhouse.=20
>>
>=20
> Thanks for this detailed feedback! In general, we are happy to take
> contributions also to the README or other docs where you see gaps.
> That's best provided by new users as it's too easy for us oversee
> details that we know but that aren't sufficiently documented yet.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/64c38e90-8dc5-9b2e-804d-3a098825f7d8%40tum.de.

--------------A90BCD37891EECD124AF8D85
Content-Type: text/x-diff; charset=UTF-8;
 name="0001-configs-inmates-Makefile-remove-.note.gnu.property-s.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-configs-inmates-Makefile-remove-.note.gnu.property-s.pa";
 filename*1="tch"

From 8dc5f24394f8e7bf9e08618a10a425b502a3319c Mon Sep 17 00:00:00 2001
From: Andrea Bastoni <andrea.bastoni@tum.de>
Date: Wed, 16 Dec 2020 16:57:57 +0100
Subject: [PATCH] configs, inmates: Makefile: remove .note.gnu.property section
 during objcopy

It seems that the .note.gnu.property section is interfering with objcpy and
causes the "JHSYST" identification to be removed from the .cell.

Removing the section while copying the .o fixes the issue:

objcopy --version
GNU objcopy (GNU Binutils for Ubuntu) 2.34

readelf -a jailhouse/configs/x86/qemu-x86.o
...
Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT, SHSTK

hexdump -C jailhouse/configs/x86/qemu-x86.cell
00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|

objcopy -O binary --remove-section=.note.gnu.property
jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell

00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.........:|

Maybe related to:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/Makefile | 2 +-
 inmates/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/Makefile b/configs/Makefile
index 513b0a9b..0e617e4e 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -23,7 +23,7 @@ ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
 KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
 endif
 
-OBJCOPYFLAGS := -O binary
+OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
 
 CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
 
diff --git a/inmates/Makefile b/inmates/Makefile
index 7d3fafa0..a4ab7903 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -36,7 +36,7 @@ KBUILD_CFLAGS += -march=armv7ve
 KBUILD_AFLAGS += -march=armv7ve
 endif
 
-OBJCOPYFLAGS := -O binary
+OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
 # prior to 4.19
 LDFLAGS += --gc-sections -T
 # since 4.19
-- 
2.29.2


--------------A90BCD37891EECD124AF8D85--
