Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSWS3TUQKGQEYWIN7RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id A738371BC2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 17:35:38 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id s18sf20932125wru.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 08:35:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563896138; cv=pass;
        d=google.com; s=arc-20160816;
        b=frJKFZ4JPNeMRO/wGf6OcMyOTOroFl/KUkv7ECq6zBKEmglcBzCDHDjR2N4oU053G9
         +5TzTjT2QXAENt6dxUFvHZu6GAeQZ1fqeh0tOu4zgtaLyfU/GcN/RK2lEM6/nsV/vfEx
         JP6ijzODJjpnn2cGcggv6kepPeZ+j4PmPcg63XJuoDFmfd6O8Aj0PME4yKAYQYG3O3m2
         STpxXYmqLv/woprkNND+iMzJmTSW3cIcGzEFDRkOVrAG8FJ3WJDDJ6+uSnMc1Qm8xyki
         tDme+SrDyeiMRbMVkKtx+RlckdeqxdmzbZUduyZavrgldxPkNpmzIKtRdeHuxIXDjTzI
         IqrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=mEw7LXyHb3ozNQORX5oce3yvouBNtg8HIebufwtjjg8=;
        b=PshnN/IVpX0OEk/Y1xICzjFbUAMnL78UZw+fKd28jI3KoNdQycrLOHB1D5jAetE0Jc
         +wFtvtg1FMzqqdiGaMT7lYWw8H/PqH6fAiVITQ6osK6iTM8ryrK820aKssH+n7SQ0NIr
         kKzBz2ATC7ySrYLLsZ1IEU2QGFeYBWh0yDhr0rSpG6zsL83lzOXHcPLewnkmBsgRGPKE
         N1svxnHdxV0eTSUAAGc53/WQJ8q/HgZUp0ldw/KjYA2SDu+7jO0iEq7kt/d4U+dHc7cw
         S41ljt/8WqnpjSVkz23++PsRaaZqa+2WWTj6S5IcDobBgybplB+F0KuuRU/d+lwAizin
         b1Hg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mEw7LXyHb3ozNQORX5oce3yvouBNtg8HIebufwtjjg8=;
        b=etd65We3u1cDlpKagX9T8vcT27aVFEkcETPaajafnQHCeb1RFXF3/+Ju4vEItZKs/A
         g/D7xoU9brYNs7oUgvxOPXjZ9KXGVoR7Kcwu5YJCkYP8uDyfAzhIyPxbWf7f+0abihS4
         9MD+QLlPyZ/s3Jofl4VgKUx7XZhm6g+kLFiv+LQc4Tnp/pytLru/zGgvCmZe5Gh7yBSb
         kd6FCanUMM5/3hWjCVWcvcdnR5Y2YCimkugoqJ5oJ2dOmlgeKiIqvsboPIk/Mj9P+OJs
         YE9Q7RfGXgo4uUIJn9uczfXufLZpRoU9v5R7Rf76BIGQWhnJs46aa9c8jTU20bNRJnfQ
         Dw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mEw7LXyHb3ozNQORX5oce3yvouBNtg8HIebufwtjjg8=;
        b=pN46UvItZgXhwlXaOlwGwQvMedXZbPeipKmBDfqWSShVQiiR/c/mwQ0ZlljWniisL4
         4ZaSbfFjsIOk3+MZncOy1vBpnz0A2Cd5ObrwC9skYXkAcu3EOWIZ4P7XAEukCjPN9J+I
         uzrjjzO4zPgqZu3PZT3NhS51C4OnnHCUsPLYxkuLWdO2eFxC4d9O5kaDMhHMGrQq1nIQ
         U/xOKjQbIWnjPrUHQD6Y34WK6zDAI9Vq1QRgNhLNCdrkkDdybODZK5G8l5oDko5+dERk
         xlopu+JXVyEb30BEJSvSRFSQP77mLWdbrnZ5YP0az3J/XwDoglfWABgzkk4NJh5lYpFx
         awpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYr1iR0m3Cw7donNHee1CVfWbFbNWNvPQs+ySI/d1Q2TOBRSf6
	55HS+Fr7zVvoB6EY3xha6Po=
X-Google-Smtp-Source: APXvYqwytLhQ5i+czOYziTfEIJj+jkUsZn6zhhztU7ss0Rz+AJVNAb28HJF7wnT8iNSDo3/cFGlurg==
X-Received: by 2002:a1c:c5c2:: with SMTP id v185mr73771251wmf.161.1563896138371;
        Tue, 23 Jul 2019 08:35:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls15555647wmt.0.canary-gmail; Tue,
 23 Jul 2019 08:35:37 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr71594403wme.177.1563896137762;
        Tue, 23 Jul 2019 08:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563896137; cv=none;
        d=google.com; s=arc-20160816;
        b=uI814m6tUwXj2O4QYL3cL+cZbvi1Cy1uSq8VXvpxkEhi2ZiWLAdc4DAA1FYWKyAj9v
         98rMb/ollQPf3xQznWHoOq0wK8MmVkUHebNcUtQsOmdHy/6zuntx7gQckZ8Hfl6liSBP
         mTI1ydHQ2LuucFpqdhh/xiUDVsHj4hP2uabhxwcL8nF+ntx8d7OfZWDM3tblz6XNxx5o
         1L0imp44QkPwNZb5HvM7xHYVy6VnDMuC1LXUiA/L9mz1x76Q2acLNfqvtv4RfMDmVpTK
         3xjeojzj4DS/GH68/3hROEQQnuKlSVna909AaTTwRNhRK+bSwQs+tBy4m/fEXG6TRQbq
         8vMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=RdEF5Qevrdoh/6WbgeAbpecaZwL/jmhyL5/BKuQvhlg=;
        b=nlGpEmmUxKCZlQ1fh8pSnIN3nqni1KPYYGaLT0gZ5ZzdMB7dhtLBm7NN/X5A24DTW5
         OhoQyl8LRCHhYACtnFmxuchKE0Cu8EXtVWKg/bndF1NVenxlVU4UVNP+Q72rAhHfCcsE
         k4jyuFb/TqQnNqxzpj5yDEdOGm6eCmp0bVKvbXCNt/4tckWLJ5MAGO3XMNQbgPyeL18q
         n+Ggje+FXEQ6S1znYLgGK3Em1px6QYiVMCa6c6m/xyC8VzAzaeCf/0p0DNICiYAG0xQL
         VmQxUqGAFJsp2j2aK8dB514tZo8NYUg9KWGwuXYHMAozgp5x+JAWquJusbfghdkKhkyB
         5VFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e12si2108564wma.2.2019.07.23.08.35.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 08:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6NFZbNN026240
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 17:35:37 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NFZbbF023015;
	Tue, 23 Jul 2019 17:35:37 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
 <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
Message-ID: <c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef@siemens.com>
Date: Tue, 23 Jul 2019 17:35:37 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
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

On 23.07.19 17:19, Jan Kiszka wrote:
> On 23.07.19 16:50, Ralf Ramsauer wrote:
>> Two bad news: Linux's 8250 driver needs patching. At least we need some
>> parameter like 8250.platform=disable to disable the probing for platform
>> uarts. Why?
>>
>> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
>> restricted ports. It does touch those ports, as it lacks ACPI platform
>> information and assumes 'any' platform UART is present.
> 
> Yes, nr_uarts is the patch-free approach for now. I once had a hack that
> propagated the information "this is Jailhouse, you may not find platform UARTs"
> to the driver. But that was a hack, so I didn't propose that upstream along with
> the other x86 changes. Plus, there are cases where we do want to use a platform
> uart in the non-root cell.
> 
>>
>> I.e.:
>>   8250.nr_uarts=1 only touches 0x3f8
>>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
>>
>> In addition to that I have a PCI device. And Linux won't probe it until
>> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
>> want to restrict access to 0x2f8), it will never probe the PCI device.
>>
>> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
>> to all ports. Yikes. At least I now know that the PCI device basically
>> works, but still, this needs to be patched.
>>
> 
> OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
> card, but that machine also had no platform UARTs IIRC.
> 
> If there no other way to tell Linux the number of platform UARTs, we will have
> to introduce one, for the sake of this use case already.
> 

Maybe we can do something like arch/x86/platform/ce4100/ce4100.c to "tune" the
platform UARTs (ce4100_serial_fixup). But it still takes an extension of the
boot protocol to provide Linux with the information about available platform UARTs.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c3f7bb71-cfcd-c11f-01a8-e3fe5ad971ef%40siemens.com.
