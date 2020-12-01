Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJOTTD7AKGQENAE7CQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E412CA15F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 12:31:51 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id a130sf685955wmf.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 03:31:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606822310; cv=pass;
        d=google.com; s=arc-20160816;
        b=rqUuCTRns5ed/SoZuvYRslXcr2SNXnzzi++rgnuM7OKXIvIjh05lHaS4BpWJXqXLgJ
         +OF20w0AfkDBv5Qt08iM2qWJE3+kaKap+lUxUWHkMai+/C1iMBbInBOaPMn73LXSNPIF
         PHb5W3qyiJ1WJ83/uMiw3e9JUY3QqC+KEhZRcnMBVAr+Ry2yXnsDViSCQyNnOVIeMBOQ
         iDdgIOSiTJ8L2xZuE3jbGJf/bIycyPXQjv9cIPmJpggujJRL3eUwK5fap7xHPmDak7S/
         xY3Rpq6altMeRZejzzSSgGKDL3eNZee1Pd48QX+ja3+uLmhLc1YOH5tXhK5rlzHrLxng
         w2ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=CajuGMhiI0W8S1IPjKmjjONRpdHPZH81XvTcEW61w5Q=;
        b=xxsLM4x7jTCVbCTbAkQCMLGZmwiib4L1mcvdx4UPkD/KrED8JGZ/a8PM/VHNRQ5TlX
         UexXq+XjlrIR8Kc+U75VfVJEddUZzx0f9DV8yiPi36sGOZHcm8iwnahCLhR2dZpf0Sf6
         /HE/43ScycC3TOIn3zJwSrMsTzGSY6sQfe446vZ2YsFuYvvLzyk/3YBClZiHHacQ5vX1
         yDAh8rSLS4AXDG4yaQaDBRs3Zx8cUOO/401jG4G7zX6WMsT6Gpz3/zTQLW23tidzGixA
         XB2XKpPPo0yyIyKA0auRqFltJfKr833Nz7x88g44MXO3oKvhooknvRW3CstwQS3w6IfA
         OsyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CajuGMhiI0W8S1IPjKmjjONRpdHPZH81XvTcEW61w5Q=;
        b=LMnKBVfZ3S135CwFgyxgIY6AVugx8GR0E9p5lxaI5XqvrswsO2gFLqSMxiZgDWxClA
         Lin0ppHKl2URVdqrqfKIJEn4r78AEsUPSGq77vTNgt7D0cL+8YFwfyJo2uDtU23+ZbDR
         Y1eUBP/jgYUxADUbAhPIT+naIhj9exIdfMgndSPoxrANyCmNR/Lhva3wIHXen9wHhROQ
         UKiSyh+FICyH8UB/9oxm8ec37swsZIAbNiXR1hbUzjZ5UggPKm7b+UdBmwS25S924nt8
         FfnrsRgiXN0aooehgXEOPdERz80J1xn74CCp/NMkpkm2cpm1YhPEQPyDuo+DRQJAetGM
         9fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CajuGMhiI0W8S1IPjKmjjONRpdHPZH81XvTcEW61w5Q=;
        b=bMT0/YF8zT9KDtUpxmaWmm7ZdgMKnHqNzTdlv7Slfc/qDlbuuvhieX3d2Db46P0/zw
         fDO+TcvU0tL2uNxnU9l3O03u6MkHWXCL1e4gU0g5KwI3d4clJFDad+RWwiwOCvU/wcMX
         quBARow6L+l0lUH9hF0/K4pDyqS0z2Qy00TVKCYlgu4CtSfZs+lZpzEXp9VSMBjJqViC
         t4YS/I3V+UB2dpJsrhI8a4Zi7RrJxGNesLqnGVrRVhQTT8YbNDep8vKc0ifoVN2S1UaZ
         63oun3FYAAbI/JxgxzAM4PbE7xWt2AzkctCg81QWCkBjVlAqP2CmHrBCDF/fcJQmrtVm
         QcKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5326mEvGA2YR8f/PcAByJvB1eod2gkm+j6mWxatlKYHxFz8yXJsi
	uNbQ6hZbscR2HKXwnD5oDfs=
X-Google-Smtp-Source: ABdhPJx7yFeYqTFy5zZo8ZXmiNliHonBcw0USN9Mfp8ZZUkvBDXQCArWr8JQi39BdHmYHmGV6w/43g==
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr3472655wrb.28.1606822310114;
        Tue, 01 Dec 2020 03:31:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbd5:: with SMTP id n21ls759904wmi.3.gmail; Tue, 01 Dec
 2020 03:31:49 -0800 (PST)
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr2256400wmc.117.1606822309116;
        Tue, 01 Dec 2020 03:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606822309; cv=none;
        d=google.com; s=arc-20160816;
        b=yf50okO4Y7zJSa5dp5UsymfXXx9ZaBPGy199hZDbJ/cXf2VcCZAo21S0PgoaXmA1Xk
         HCv8kQ2lclzwbSRohBQUEp8pcgGuijd5trFbK6TVCu/YIpRJ1h0+2QEnfIyM3eFJaOsN
         Sy4vaa5fSBKhTcud0qtB1TcvLzjc/9Jqgj0rgyfNxgg8qovcvuW9q5TeoYvmyz+2dX2S
         kxKbrh3dNf/a+eRWtfTHfD9JH5RDPogz4BouxBcHE4utQTjGM27+Ny4E3FOARzGLM4X2
         +nRH/zVCdpIsJHO7FvXckpJ12PwVa8Afj4ryehn9cE5EsowsPalutb+d7STLpRpruxBQ
         Yziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=WwIkBuVTEygyX4eX+bmbBswn1JYZ85soGnL62utaIgU=;
        b=Z8zvsOzOQd0zcRqtTBymC6Tofyishf9goqyWnLjJS5prZBtOwPdaIYyATZWNfNGDSW
         ktmzQ5gi6Ya4FdBS+UBuIpthwcjfQUQZd3+6rq3eiKpFHcLV4Rt/VRtv1BJ6EAlv9wWF
         2CYrYQByteoAEzhXjg85LfjcpFxGoDTOXnPsHpyeyW7eKVfDQpUnFlr3zY0wFgEDBx8W
         l2jU51W3TMrpJuyDbDnQkXFZI46AZk3EYHSFvDPrIG+3Itea5/W1mzu3QqeMUG8x7jDA
         nDt+yMUrXgLkdRCeaVeQn0RWqVuEBmrEXlmZprr4P8OPz5yr5feXBUtxv1oLD9SA3mMQ
         nikw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id i206si65596wmi.0.2020.12.01.03.31.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B1BVmaB027242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Dec 2020 12:31:48 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B1BVlai004756;
	Tue, 1 Dec 2020 12:31:47 +0100
Subject: Re: JAILHOUSE_ENABLE: Input/output error
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
Date: Tue, 1 Dec 2020 12:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 01.12.20 10:36, Sainz Markel wrote:
> After compiling with the suggested flag, the output of the enable command adds another line:
> 
> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell 
> 
> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 1
> Code location: 0xfffffffff0000050
> Using x2APIC
> /home/msainz/Projects/jailhouse/hypervisor/arch/x86/vmx.c:238: returning error -EIO
> JAILHOUSE_ENABLE: Input/output error

That means your host is missing some essential VMX (VT-x) features. Then
it's either a 10 years old machine, or you are running in a VM, and
nesting does not provide sufficient emulation (KVM would).

Jan

> 
> 
> -----Mensaje original-----
> De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> En nombre de Sainz Markel
> Enviado el: martes, 1 de diciembre de 2020 10:07
> Para: Jan Kiszka <jan.kiszka@siemens.com>; jailhouse-dev@googlegroups.com
> Asunto: RE: JAILHOUSE_ENABLE: Input/output error
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> I did not. I'm running this on a busybox based Linux. No Python installation possible. I'm going to check the mentioned docs, any other output I could upload for you, not dependant on Python?
> 
> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com>
> Enviado el: martes, 1 de diciembre de 2020 10:04
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: JAILHOUSE_ENABLE: Input/output error
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On 01.12.20 08:48, Sainz Markel wrote:
>> Hi there,
>>
>> After being able to resolve the cmdline issue, the following error 
>> comes up when trying to enable the cell:
>>
>> ~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell
>>
>> Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5 Code
>> location: 0xfffffffff0000050 Using x2APIC
>> JAILHOUSE_ENABLE: Input/output error
>>
> 
> Did your target pass "jailhouse hardware check"? If so, enable CONFIG_TRACE_ERROR (see Documentation/hypervisor-configuration.md) to get the origin of this.
> 
> Jan
> 
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40%40PA4PR03MB7184.eurprd03.prod.outlook.com
> 


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/91a25596-5d4e-ff7e-d64b-b407648ed2b4%40siemens.com.
