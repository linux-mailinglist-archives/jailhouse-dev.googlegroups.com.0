Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW563PUQKGQEDDUHXEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id AD793715E9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 12:20:11 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id m23sf27938308edr.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 03:20:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563877211; cv=pass;
        d=google.com; s=arc-20160816;
        b=gj8eCndtddpVlb+uGjIk9sFWkHnWZQDN9VgBzxTwR2tcdGMmz9tXr2j4tZRm49xVPt
         Bnh241c9t1RPKniks/ZCbzGMI534s81uo8wYj/UuRPQpYIESCNd66cNPoPtCQJCkaz4H
         X70apPfXnitCn+pIvoiR07lEtoFgdLJSuwiyjPF/pJ8wBqxTGt3rA5cWX248+nvqHhjS
         bA8cvgIAUQ1VhLxCR0ORnUPjUCgYQE3qGWU4nMIgqUy5POlRjgreRJhjtykQb4DUczm5
         vOygvWnbmmn0ZuWFWnEzDpEwbLOoraaNM70HQ7TYjoVsBQubjWgCXmcAVsdSKoTZJCv+
         XDRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=5EAJ4zSx/xP7XdkOm7dm01oh0PZ1t/PhX6cV0ByVpr4=;
        b=eaRDWLPo2KwHNUS7VkY6lucvvJqgtm2RXr7QefsxHtw8XKHvHV0u5zaJttVGXJcSBg
         NzEHbaMqerNVAkqRdkmOBhmK2YuLw1LiboqeAnqhbWMsi7ztyUGax5p1rC2qSF5pZgKp
         aglyZ4xN6/N1dZd/RYYS86LIg8oMGr5HeUdUcA0sVb8piluT+J0q2WcLo/9wJfe29NwB
         7CaAP9Pcnih3wJsyrUcRxlAlTURyJlU4xe5+8hCi0ZQ04Si0Of5DWmA73EYnTf5czYm6
         N+bZW5e7uPbX7q6W/en1uN5XJoMfuT+WrQtco+5OBCreyHQ0IiA+/l/IlFQO0M5XbU1d
         KDJA==
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
        bh=5EAJ4zSx/xP7XdkOm7dm01oh0PZ1t/PhX6cV0ByVpr4=;
        b=M72I/BvmcyRD5t7Gdd0ZyYqOu8zqz2hYwXAqDmT1lmi8SsEPDh4M26O3gX4UrluRC2
         Uad9fxEygxkw6taViwyPHl2yjPwcG8ReBE4u7QkaOjTnOKgCge2UbUHHVBsCDKKO1JWZ
         p+DjknQzHmQY6UGdk9h37bcNQfrg6UCIcgHoPGxYyWqIST2LULfBYxRvKxdM4E2B2RF/
         4Rc243sfBpvKPalZjXaWvRayjpnlSsnyasv/Rcf23Q9krrlMiGeQ5NCMwmcCLOI4AhFE
         KVdebDuhJV0mRy9zDbrYfxt/luJ/aRPDiTrtfo4K7NTf1trc6aquzezNHTw8i5p1qLhK
         efKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5EAJ4zSx/xP7XdkOm7dm01oh0PZ1t/PhX6cV0ByVpr4=;
        b=ANPGmaHJcncNL46jZ6Jr2A3u9Izwph5ElMfAouF9EgOYOOjI8jr9YI2UwLlu7HAdWa
         yjflzhOkudnY62cEPZ4/MXxSP7ik6B3zLhalTl4YNx0wiC6ZqrSQZZtwchoE2aQ4GGxM
         2AIOIQaO0lD9YbC1v08/y2oFS1g+THE9nzBOLaWNuuppW6UPFPi0xntKKhYNw1iNzEra
         AKZS0hfOhW91QHVp4mCbK0vZlB+vRxhp5MD92XyoF3+MaHWJ5oeyqw/rRToH4MrFFT8P
         jknEEQEWV/DZEyZcFgOKLmVToLIwjOHj6zcdNiTXIvDXDqIGUJsRoWo6xZvPbYZ5Q2oo
         wd+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVlCkJgpKAylYstqTx8sK6OduIPyZ93UMvaZv/TmK8JKc6LeFd0
	YcpFMb3yqeEYWCHKyxCgv00=
X-Google-Smtp-Source: APXvYqyyKUSElsLPIyFcWAcwC5kTYkUSMBWBjxb/qRhj9HL7OANn77/gWYpeWE+yHfjcV3ECeObTOA==
X-Received: by 2002:a05:6402:683:: with SMTP id f3mr63381940edy.200.1563877211439;
        Tue, 23 Jul 2019 03:20:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:94ce:: with SMTP id t14ls9975659eda.7.gmail; Tue, 23 Jul
 2019 03:20:10 -0700 (PDT)
X-Received: by 2002:a50:ba19:: with SMTP id g25mr64878686edc.123.1563877210703;
        Tue, 23 Jul 2019 03:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563877210; cv=none;
        d=google.com; s=arc-20160816;
        b=cLc+LWOr8K0ALE2uIHxyi1v9MSFTHDsXqWca6SgMqpVOY34247tEA0QKe7h3VOY/7G
         LcqN2ggH9jZANUO5JJtbRYVMdUQAF6tO4lp0KaY3Ys+2gl6SL1JMe4B+qc9auGqrZidF
         Gfu1N90sJLN4qD87sBC0kDDWvNATI9iqUsOAumJq2KNWv9IEIFjcWShqCVzA9jNDXhQI
         HLyZq9udf4p9rEBljNrqA0rBSqUSpa9qNc0T0mXfEg01bRR02AQmHRvGp74UQHQ4Uy/f
         u788JJF+eth9+RWfZpCRv3fyWx7vC7qtlIq7zN9+go/WvVmlFOVVu3nZF2QxDAu92PHY
         jUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nTey0lLo0UcqpqRyNFxNnpLivdl9zgo4gDMAUfHRDWc=;
        b=Y6IL4cdYEoVNOGv9+iV44UTNxW3kSrohWB5nAb9R2oiQXomVubCVuUh4oo2hjEMMX3
         h/v+yqh+mKZaZ+e30f2INHO1y77nqMVF2M566rpy+J17cMWGIGqyOchbo/r3Qib9Z2ll
         irBAOKNzEISnnZ9bj1Ow5WyGINzk8Kr5aODk06w2po4NwiI18Fm9PDR8b99DTdc/egWD
         Xle1hXzE+D4+FSYtdIsfRh02qN30TW2pzdKEs0EUZwqI8vP9wzNuAaNWeNNlxg0kJQKO
         Iofyo9Ckvl2gjWxgoZi8V9iVwCoipafrcmzQx1kVSBHPw2AtSJSBFdTmUdV9CQO1DWIq
         4oHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b39si2366022edb.1.2019.07.23.03.20.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 03:20:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6NAK6LI025926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 12:20:06 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NAK66o010140;
	Tue, 23 Jul 2019 12:20:06 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <674c6cb2-62ac-456c-2a5e-ac08e94e0262@siemens.com>
Date: Tue, 23 Jul 2019 12:20:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E3DBD@BMK019S01.emtrion.local>
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

On 23.07.19 12:14, von Wiarda, Jan wrote:
> Hi!
>=20
> With
>=20
> asm volatile("nop" : : : "memory");
>=20
> instead of
>=20
> asm volatile("wfi" : : : "memory");
>=20
> it runs just fine.
>=20
>> Is the root cell cpu (CPU 0) specifically crashing with an unexpected sy=
nchronous exit to Jailhouse? What is the output?
>=20
> No, CPU 0 does not crash with any kind of console output, which makes deb=
ugging even more difficult. What I observe is, that after hitting WFI, it c=
ontinues to run for a 1-2 seconds and then it stops. Last thing I see from =
the instrumented code is a printk() from arch_skip_instruction(), which mea=
ns it was handling a SYS64 exit.

Maybe interrupts get stalled for the root cell - for whatever reason. Do yo=
u
have a hardware debugger to analyze the state of the CPUs? Or use QEMU...

Jan

>=20
>> This is a far shot, but maybe the code generated around the WFI is the c=
ulprit?
>=20
> You might be right, when I place WFI right after inmate_main(), CPU 0 doe=
s not starve. But it's completely strange and undefined behaviour, sometime=
s it crashes if I put the WFI right after a printk(), whereas right before =
the printk() it doesn't crash.
>=20
> Works:
>=20
> void inmate_main(void)
> {
> 		...
> 		asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		//asm volatile("wfi" : : : "memory");
> }
>=20
> Does not work:
>=20
> void inmate_main(void)
> {
> 		...
> 		//asm volatile("wfi" : : : "memory");
> 		printk("IVSHMEM: Done setting up...\n");
> 		printk("IVSHMEM: waiting for interrupt.\n");
> 		asm volatile("wfi" : : : "memory");
> }
>=20
> I know this sounds completely strange but I reproduced this multiple time=
s, compiler is this:
>=20
> gcc version 6.3.0 20170516 (Debian 6.3.0-18)
>=20
> BR,
> Jan
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Antonios Motakis (Tony) [mailto:antonios.motakis@huawei.com]=20
> Gesendet: Dienstag, 23. Juli 2019 06:40
> An: von Wiarda, Jan; Mark Rutland
> Cc: JailhouseMailingListe; Jan Kiszka
> Betreff: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
>=20
> Hi Jan,
>=20
> On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
>> Hi Mark,
>>
>> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the=
 same for 64 bit and 32 bit inmates when the crash happens, except for HCR_=
RW_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>>
>=20
> It's quite an interesting crash that you have there; I wouldn't expect th=
is to happen.
>=20
> The idea with trapping WFI/WFE is to be able to suspend a VM that is just=
 waiting for something to happen. Since Jailhouse is a partitioning hypervi=
sor, you shouldn't need to trap it, nor should its use normally influence t=
he other cores. Yet something is amiss here.
>=20
> Is the root cell cpu (CPU 0) specifically crashing with an unexpected syn=
chronous exit to Jailhouse? What is the output?
>=20
> I don't remember what event 0x28001B maps to, I would check the ARM ARM f=
irst to figure out what the unexpected event in CPU 0 was, for a clue to mo=
tivate further investigation.
>=20
> Additionally, this WFI code instructs the compiler that memory contents m=
ay change, so ordering of generated instructions, inserted barriers etc, ar=
e influenced. This is a far shot, but maybe the code generated around the W=
FI is the culprit? Maybe not, but I would try to rule it out:
> (a) First I'd try replacing the WFI with a nop, to observe the behavior w=
ithout the WFI but without changing compiler behavior and maintaining any c=
ompiler barriers.
> (b) I would also try replacing it with an infinite loop ("b .") to get th=
e inmate to wait forever at this position, and see what happens.
>=20
> Happy debugging :)
>=20
> Best regards,
> Tony
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
jailhouse-dev/674c6cb2-62ac-456c-2a5e-ac08e94e0262%40siemens.com.
