Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBDOTQPZQKGQEMNQXAJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id B602517A4B8
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 12:59:10 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id s10sf444050wrr.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 03:59:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583409550; cv=pass;
        d=google.com; s=arc-20160816;
        b=z1uXxhdayCb1EQ0F0d5oxUSPC9dGpWqzirF5x/SXxlINzqlhTRiriXKAjRYFIZtHdD
         DCdgyos0l1oisQQEdPQ2JnhWEqTk9AZnrTheC9gySuF8qYEpBySH4ZEXGbS4e/ln92in
         A2M0qlhidI/rzKyjB4lawGw0GNCmzb0ipv4XHCLEWypbTVVhjb6vlHqSmvDcSdo6+wqJ
         5Y++qXEaa72KMiBKyiKVcvICia1mi7hdHmg9DMVdZpyUlsUgJzdZqw791PWUyPrqYPIM
         iirXpUSWznUA1ETcQ78uUCsg2TagUK7CgxNcSfI1bUYpl1bn9d4UpN7Nm2wAZGxbwCFm
         /jHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=MCh9fYwqp8w7ADqHAoVjG4ZlWVwqGhKVR38epkLqxQw=;
        b=f7lLzf7LPppw4UMIq8waQd/2sa9IgQvnn5FPue0OlayMOsdGhZPID8d9FMPOKxWc3R
         c/GM1ebNQJAb0IsUJNWLzFi+nma/hm2o9hGjNUmFSUcr3kyV65bA6qX8nzWnXnevu+NC
         ddgD95DunLoWLBg9FeLx7YwRS3IL5WLquT2QJLZiSQv5GVsVHJWv9KDm8e06xrFxxErE
         +fMTQUYOTYDvVxenYWDsa8GLbUlKSFSAAZx4QMQUItBXQteMHZcBQ4JtRe8Smq1aS6rT
         xndOV6Qx/0i636TL46FoTzoRuC1ZfL7MboXBTsjcc51KeN8igXf+DWh+/zuEaLTIJue9
         KIWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RrmAovom;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MCh9fYwqp8w7ADqHAoVjG4ZlWVwqGhKVR38epkLqxQw=;
        b=tlXmyeLslGKtzqsRuu+xpDLe9SFSjYecttWtWZJH2kbA8GgnwrD33DssuwY3PjvjnI
         rtuUeP5n0gd6RR2qWG2pFgTs7exLOvmprvhlOrsZ87JZCvV9osvVGSbKNdrY6t875yZP
         2hxTDZoG+1udmYNSauk0a3IPeTbGMtWiB4k/GO8lxCWRBPotRGrA5of6QQf5qi3e6zBJ
         k7BjKdir4q+9Xt3DIGbLnd6GqAE6B7Mnw32wrBaa+Zcty43raVdzBSuQW9EucV6fcpLi
         0hE419pDGkiRHADez+ijuOsUtogk6YGpRNiaiu3vNeg8YF5HV8twDmCMvYGD5kxVyAd/
         dHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MCh9fYwqp8w7ADqHAoVjG4ZlWVwqGhKVR38epkLqxQw=;
        b=rLTb7q22K8m2e9GyHGa/j+KpmgdR7ZzEYzJiPj4vwxG2wwGT5kmgB0Z4Yp/7runPZN
         u7fjOZkqOmtvdMohvnLQ9NYSY8L4VM15PrOi6x2GzgiYPPUkxBYhklCjXXB/qheCa0ud
         NMLd9UCGXgn9tF8uYu0GI+HjgZxZDlMaI7rYI6ipZ7gW+LfhPzoRy4w7xSdfjxwcZzCq
         ArmxKqXK/KkHTSW6jnaHZ+1SBN6f9nBLFVH9pvW3Y7Txhbo7r2k1nTc4UE2iaZYVwrrU
         ejJGYFW1ejgpWhIqonSPDtVhtK6mRDpXU+wgSK8OH6pCo4nK4Y5gsEryqO6ZjHk4FkkE
         Cltg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2XCzHeW/eJY3pMNBNJ41g7wLignAxUWEQ4DF0ebgznFsUzggxb
	xOz4Ix+NgXG0n82Be8Ya9L0=
X-Google-Smtp-Source: ADFU+vtVuvN6dExVxi8PpexUG32Hbaunft3pXiXx6OazHRuP08BryKoXpTVFq1OaE0GYoukMcuTTvQ==
X-Received: by 2002:a5d:6ac1:: with SMTP id u1mr9452478wrw.383.1583409550359;
        Thu, 05 Mar 2020 03:59:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4441:: with SMTP id x1ls228695wrr.4.gmail; Thu, 05 Mar
 2020 03:59:09 -0800 (PST)
X-Received: by 2002:adf:f547:: with SMTP id j7mr44327wrp.139.1583409549223;
        Thu, 05 Mar 2020 03:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583409549; cv=none;
        d=google.com; s=arc-20160816;
        b=SbRANRUYykM4hMI5CU7ZoCmsV+uKnqXqR68f3bbLZKKQUlB7K4fCaQMHn34We1c9EX
         8VlmN2DeQSrJ5QfvJawIh9H00G1ucWQyskN65wES//f5sbd2pDW0jT4umflLuflslK/L
         o+CpWWdNAutMwlqq4SW5chJe9+Jrhz6AGFpJ/A40R9j4J/7F512tjUT5O0pRuS2IvyHq
         PJLuiYOrINS/B5xPTcKxodlvv6G6PBy6Kr2a6RVoAS/yMmiiyMowx57bKgj/bdTwWATU
         4VXSDEt9vazdgYKX/2sO2LPdRuqRgwA4H4xLB+/NtubdgWAX87ijDlTcLrE1qnQx/Oht
         rBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=imwNS8BXavukZH/wwWSDmT5/+u7His7ZDix979SUWy8=;
        b=aJhZJv9ZCUJppqoXccEHZrPdF9rcK2v3OEbiQOdxOcKFCAZh23qf205WSnQrad1wG4
         ofUKdZMZvORE3ggh/N25TrVlpVY0qDbujkqWCONBsdhBdrp6gm3iW1Pm5UHDRP5siV11
         wbQewSEUrtiSLJcRQ8sGglkeNgqOHn2ovVEPxCL5HJmi5lkOBc3XaTiNkdL2aBDuQaY4
         KxXe4/mkrafP8xMGFDp64IUgCrlUsp5N3t547jOw3ZJGraXrftVQjd9YeanUgMd1JD8q
         inI/fwRnyESKzHhVA9AmoBPJ2Z7w6eY9tnS8quU9KaL+Eqvllpin3qQEKxGdNZH409Di
         gHsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RrmAovom;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id q9si185738wrx.0.2020.03.05.03.59.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 03:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 48Y8Rc5PX4zxpQ;
	Thu,  5 Mar 2020 12:59:08 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 5 Mar 2020
 12:59:08 +0100
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: Jan Kiszka <jan.kiszka@siemens.com>, <peng.fan@nxp.com>,
	<jailhouse-dev@googlegroups.com>
CC: <alice.guo@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
 <a4bd0ce8-988c-c294-1d22-7809236baed5@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <7ecdb38c-72d3-5198-bc11-91ec5c17a138@oth-regensburg.de>
Date: Thu, 5 Mar 2020 12:58:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a4bd0ce8-988c-c294-1d22-7809236baed5@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RrmAovom;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 05/03/2020 11:31, Jan Kiszka wrote:
> On 05.03.20 10:39, peng.fan@nxp.com wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> This patchset tested on i.MX8MN arm64 with quad A53 cores
>>
>> Patch 1 is to align jailhouse_system. Since the loader not have
>> MMU enabled, unaligned access will cause abort.
>>
>> Patch 2 is not that well orgnized. It does GICv3 initialization,
>> SMP boot up. Then kick inmate cell and root cell.
>> Some code are hardcoding for now.
>>
>> The boot log as below, you could see root linux and gic demo both
>> running:
>> root cell not able to manage inmate cell for now. But I think it
>> could be supported. intercell communication not aded currently.
>>
>> =C2=A0From test log, linux root cell boot will cause large latency for
>> gic-demo
>> jitter.
>>
>> It maybe good to use cache color on ARMv8, but still have issues
>> for root cell DMA without SMMU.
>>
>> ## Loading kernel from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Using 'config@1' configuration
>> =C2=A0=C2=A0=C2=A0 Trying 'kernel' kernel subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Kernel Image
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x60000650
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 6072 Bytes =
=3D 5.9 KiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OS:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x40000000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 0x40000000
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> ## Loading fdt from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Using 'config@1' configuration
>> =C2=A0=C2=A0=C2=A0 Trying 'fdt' fdt subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 fdt
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Flat Device Tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x61a90f90
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 39890 Bytes =
=3D 39 KiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x43000000
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading fdt from 0x61a90f90 to 0x43000000
>> =C2=A0=C2=A0=C2=A0 Booting using the fdt blob at 0x43000000
>> ## Loading loadables from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Trying 'hypervisor' loadables subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 Jailhouse hypervisor
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Standalone Program
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x60001e08
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 104456 Bytes=
 =3D 102 KiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x40200000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 unavailable
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading loadables from 0x60001e08 to 0x40200000
>> ## Loading loadables from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Trying 'cell@0' loadables subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 i.MX8MN cell
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Standalone Program
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x6001b610
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 1218 Bytes =
=3D 1.2 KiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x40300000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 unavailable
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading loadables from 0x6001b610 to 0x40300000
>> ## Loading loadables from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Trying 'inmate@0' loadables subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 ROOT CELL image
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Standalone Program
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x6001bad4
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 27720192 Byt=
es =3D 26.4 MiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x40480000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 unavailable
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading loadables from 0x6001bad4 to 0x40480000
>> ## Loading loadables from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Trying 'cell@1' loadables subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 i.MX8MN GIC-CELL
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Standalone Program
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x61a8b4d4
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 236 Bytes =
=3D 236 Bytes
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0x40310000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 unavailable
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading loadables from 0x61a8b4d4 to 0x40310000
>> ## Loading loadables from FIT Image at 60000000 ...
>> =C2=A0=C2=A0=C2=A0 Trying 'inmate@1' loadables subimage
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Description:=C2=A0 i.MX8MN GIC-DEMO
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Type:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Standalone Program
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Compression:=C2=A0 uncompressed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Start:=C2=A0=C2=A0 0x61a8b5c0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 22992 Bytes =
=3D 22.5 KiB
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Architecture: AArch64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load Address: 0xb3c00000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry Point:=C2=A0 unavailable
>> =C2=A0=C2=A0=C2=A0 Verifying Hash Integrity ... OK
>> =C2=A0=C2=A0=C2=A0 Loading loadables from 0x61a8b5c0 to 0xb3c00000
>> =C2=A0=C2=A0=C2=A0 Loading Kernel Image ... OK
>> =C2=A0=C2=A0=C2=A0 Using Device Tree in place at 0000000043000000, end 0=
00000004300cbd1
>>
>> Starting kernel ...
>>
>>
>> Initializing Jailhouse hypervisor v0.12 (20-g40c6fd8f) on CPU 1
>> Code location: 0x0000ffffc0200800
>> Page pool usage after early setup: mem 39/993, remap 0/131072
>> Initializing processors:
>> =C2=A0 CPU 1... OK
>> =C2=A0 CPU 0... OK
>> =C2=A0 CPU 3... OK
>> =C2=A0 CPU 2... OK
>> Initializing unit: irqchip
>> Initializing unit: ARM SMMU v3
>> Initializing unit: PVU IOMMU
>> Initializing unit: PCI
>> Adding virtual PCI device 00:00.0 to cell "imx8mm"
>> Adding virtual PCI device 00:01.0 to cell "imx8mm"
>> Page pool usage after late setup: mem 60/993, remap 144/131072
>> Activating hypervisor
>> Created cell "gic-demo"
>> Page pool usage after cell creation: mem 72/993, remap 144/131072
>> Cell "gic-demo" can be loaded
>> Started cell "gic-demo"
>> Initializing the GIC...
>> Initializing the timer...
>> [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0000000000=
 [0x410fd034]
>> [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 5.4.3-00028-g643910d36b96-di=
rty
>> (Freenix@linux-ljuv) (gcc version 9.2.0 (GCC)) #105 SMP PREEMPT Wed
>> Mar 4 15:21:58 CST 2020
>> [=C2=A0=C2=A0=C2=A0 0.000000] Machine model: NXP i.MX8MNano DDR4 EVK boa=
rd
>> [=C2=A0=C2=A0=C2=A0 0.000000] earlycon: ec_imx6q0 at MMIO 0x000000003089=
0000 (options
>> '115200')
>> [=C2=A0=C2=A0=C2=A0 0.000000] printk: bootconsole [ec_imx6q0] enabled
>> [=C2=A0=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:
>> [=C2=A0=C2=A0=C2=A0 0.000000] efi: UEFI not found.
>> [=C2=A0=C2=A0=C2=A0 0.000000] Reserved memory: created CMA memory pool a=
t
>> 0x000000006a000000, size 640 MiB
>> [=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized node linux,c=
ma,
>> compatible id shared-dma-pool
>> Timer fired, jitter:=C2=A0=C2=A0 2999 ns, min:=C2=A0=C2=A0 2999 ns, max:=
=C2=A0=C2=A0 2999 ns
>> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configuration found
>> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem
>> 0x0000000040000000-0x00000000bdffffff]
>> [=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA [mem 0xbdd04500-0xbdd05fff=
]
>> [=C2=A0=C2=A0=C2=A0 0.000000] Zone ranges:
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA32=C2=A0=C2=A0=C2=A0 [mem 0=
x0000000040000000-0x00000000bdffffff]
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty
>> [=C2=A0=C2=A0=C2=A0 0.000000] Movable zone start for each node
>> [=C2=A0=C2=A0=C2=A0 0.000000] Early memory node ranges
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x000=
0000040000000-0x0000000093bfffff]
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x000=
00000b8000000-0x00000000bb6fffff]
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x000=
00000bbc00000-0x00000000bdffffff]
>> [=C2=A0=C2=A0=C2=A0 0.000000] Zeroed struct page in unavailable ranges: =
256 pages
>> [=C2=A0=C2=A0=C2=A0 0.000000] Initmem setup node 0 [mem
>> 0x0000000040000000-0x00000000bdffffff]
>> Timer fired, jitter:=C2=A0=C2=A0 1624 ns, min:=C2=A0=C2=A0 1624 ns, max:=
=C2=A0=C2=A0 2999 ns
>> [=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.
>> [=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected in firmware.
>> [=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function ID=
s
>> [=C2=A0=C2=A0=C2=A0 0.000000] psci: MIGRATE_INFO_TYPE not supported.
>> [=C2=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Convention v1.1
>> [=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 24 pages/cpu s58904 r8192=
 d31208 u98304
>> [=C2=A0=C2=A0=C2=A0 0.000000] Detected VIPT I-cache on CPU0
>> [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: ARM erratum 845719
>> [=C2=A0=C2=A0=C2=A0 0.000000] CPU features: detected: GIC system registe=
r CPU interface
>> [=C2=A0=C2=A0=C2=A0 0.000000] Built 1 zonelists, mobility grouping on.=
=C2=A0 Total pages:
>> 360612
>> [=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA32
>> [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: console=3Dttymxc1,115=
200
>> earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk1p2 rootwait rw
>> [=C2=A0=C2=A0=C2=A0 0.000000] Dentry cache hash table entries: 262144 (o=
rder: 9,
>> 2097152 bytes, linear)
>> [=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 131072 (or=
der: 8,
>> 1048576 bytes, linear)
>> [=C2=A0=C2=A0=C2=A0 0.000000] mem auto-init: stack:off, heap alloc:off, =
heap free:off
>> Timer fired, jitter:=C2=A0=C2=A0 7999 ns, min:=C2=A0=C2=A0 1624 ns, max:=
=C2=A0=C2=A0 7999 ns
>> [=C2=A0=C2=A0=C2=A0 0.000000] Memory: 742552K/1465344K available (16316K=
 kernel code,
>> 1342K rwdata, 6380K rodata, 2944K init, 1015K bss, 67432K reserved,
>> 655360K cma-reserved)
>> [=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObject=
s=3D0, CPUs=3D4, Nodes=3D1
>> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Preemptible hierarchical RCU implemen=
tation.
>> [=C2=A0=C2=A0=C2=A0 0.000000] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 RCU restricti=
ng CPUs from NR_CPUS=3D256 to
>> nr_cpu_ids=3D4.
>> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0 Tasks RCU enabled.
>> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: RCU calculated value of scheduler-enl=
istment delay
>> is 25 jiffies.
>> [=C2=A0=C2=A0=C2=A0 0.000000] rcu: Adjusting geometry for rcu_fanout_lea=
f=3D16,
>> nr_cpu_ids=3D4
>> [=C2=A0=C2=A0=C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irq=
s: 0
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 128 SPIs implemented
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 0 Extended SPIs implemented
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: Distributor has no Range Selector s=
upport
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: 16 PPIs implemented
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: no VLPI support, no direct LPI supp=
ort
>> [=C2=A0=C2=A0=C2=A0 0.000000] GICv3: CPU0: found redistributor 0 region
>> 0:0x0000000038880000
>> [=C2=A0=C2=A0=C2=A0 0.000000] ITS: No ITS available, not enabling LPIs
>> [=C2=A0=C2=A0=C2=A0 0.000000] random: get_random_bytes called from
>> start_kernel+0x2b8/0x44c with crng_init=3D0
>> [=C2=A0=C2=A0=C2=A0 0.000000] arch_timer: cp15 timer(s) running at 8.00M=
Hz (virt).
>> [=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xfff=
fffffffffff
>> max_cycles: 0x1d854df40, max_idle_ns: 440795202120 ns
>> [=C2=A0=C2=A0=C2=A0 0.000004] sched_clock: 56 bits at 8MHz, resolution 1=
25ns, wraps
>> every 2199023255500ns
>> [=C2=A0=C2=A0=C2=A0 0.008448] Console: colour dummy device 80x25
>> [=C2=A0=C2=A0=C2=A0 0.012571] Calibrating delay loop (skipped), value ca=
lculated
>> using timer frequency.. 16.00 BogoMIPS (lpj=3D32000)
>> [=C2=A0=C2=A0=C2=A0 0.022844] pid_max: default: 32768 minimum: 301
>> [=C2=A0=C2=A0=C2=A0 0.027546] LSM: Security Framework initializing
>> [=C2=A0=C2=A0=C2=A0 0.032169] Mount-cache hash table entries: 4096 (orde=
r: 3, 32768
>> bytes, linear)
>> [=C2=A0=C2=A0=C2=A0 0.039565] Mountpoint-cache hash table entries: 4096 =
(order: 3,
>> 32768 bytes, linear)
>> Timer fired, jitter:=C2=A0=C2=A0 2374 ns, min:=C2=A0=C2=A0 1624 ns, max:=
=C2=A0=C2=A0 7999 ns
>> [=C2=A0=C2=A0=C2=A0 0.071508] ASID allocator initialised with 32768 entr=
ies
>> [=C2=A0=C2=A0=C2=A0 0.079504] rcu: Hierarchical SRCU implementation.
>> [=C2=A0=C2=A0=C2=A0 0.088337] EFI services will not be available.
>> [=C2=A0=C2=A0=C2=A0 0.095538] smp: Bringing up secondary CPUs ...
>> Timer fired, jitter:=C2=A0=C2=A0=C2=A0 749 ns, min:=C2=A0=C2=A0=C2=A0 74=
9 ns, max:=C2=A0=C2=A0 7999 ns
>> [=C2=A0=C2=A0=C2=A0 0.127643] Detected VIPT I-cache on CPU1
>> [=C2=A0=C2=A0=C2=A0 0.127671] GICv3: CPU1: found redistributor 1 region
>> 0:0x00000000388a0000
>> [=C2=A0=C2=A0=C2=A0 0.127700] CPU1: Booted secondary processor 0x0000000=
001 [0x410fd034]
>> [=C2=A0=C2=A0=C2=A0 0.159684] Detected VIPT I-cache on CPU2
>> [=C2=A0=C2=A0=C2=A0 0.159700] GICv3: CPU2: found redistributor 2 region
>> 0:0x00000000388c0000
>> [=C2=A0=C2=A0=C2=A0 0.159717] CPU2: Booted secondary processor 0x0000000=
002 [0x410fd034]
>> [=C2=A0=C2=A0=C2=A0 0.191721] psci: failed to boot CPU3 (-1)
>> [=C2=A0=C2=A0=C2=A0 0.227974] CPU3: failed to boot: -1
>> [=C2=A0=C2=A0=C2=A0 0.231609] smp: Brought up 1 node, 3 CPUs
>> [=C2=A0=C2=A0=C2=A0 0.235680] SMP: Total of 3 processors activated.
>> [=C2=A0=C2=A0=C2=A0 0.240396] CPU features: detected: 32-bit EL0 Support
>> [=C2=A0=C2=A0=C2=A0 0.245568] CPU features: detected: CRC32 instructions
>> [=C2=A0=C2=A0=C2=A0 0.259436] CPU: All CPU(s) started at EL1
>> [=C2=A0=C2=A0=C2=A0 0.260692] alternatives: patching kernel code
>> [=C2=A0=C2=A0=C2=A0 0.266398] devtmpfs: initialized
>> Timer fired, jitter:=C2=A0=C2=A0=C2=A0 749 ns, min: [=C2=A0=C2=A0=C2=A0 =
0.274443] clocksource:
>> jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns:
>> 7645041785100000 ns
>> [=C2=A0=C2=A0=C2=A0 0.281523] futex hash table entries: 1024 (order: 4, =
65536 bytes,
>> linear)
>>
>>
>> Peng Fan (2):
>> =C2=A0=C2=A0 cell-config: reserve an entry to align jailhouse_system
>> =C2=A0=C2=A0 support booting jailhouse before root cell linux
>>
>> =C2=A0 Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 hypervisor/arch/arm-common/include/asm/gic.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +
>> =C2=A0 hypervisor/arch/arm-common/include/asm/gic_v3.h |=C2=A0 18 ++
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
>> =C2=A0 loader/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 49 ++++
>> =C2=A0 loader/configs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 =
+++
>> =C2=A0 loader/fit.its=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 85 ++++++
>> =C2=A0 loader/gic-v3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 154=
 +++++++++++
>> =C2=A0 loader/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 327
>> ++++++++++++++++++++++++
>> =C2=A0 loader/inmate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 63 +++++
>> =C2=A0 loader/lib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 56 ++++
>> =C2=A0 loader/loader.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 15 ++
>> =C2=A0 loader/loader.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 66 +++++
>> =C2=A0 loader/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 194 ++++++++++++++
>> =C2=A0 loader/mmio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 21 ++
>> =C2=A0 loader/psci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 119 +++++++++
>> =C2=A0 16 files changed, 1202 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644 loader/Makefile
>> =C2=A0 create mode 100644 loader/configs.h
>> =C2=A0 create mode 100644 loader/fit.its
>> =C2=A0 create mode 100644 loader/gic-v3.c
>> =C2=A0 create mode 100644 loader/head.S
>> =C2=A0 create mode 100644 loader/inmate.c
>> =C2=A0 create mode 100644 loader/lib.c
>> =C2=A0 create mode 100644 loader/loader.h
>> =C2=A0 create mode 100644 loader/loader.lds.S
>> =C2=A0 create mode 100644 loader/main.c
>> =C2=A0 create mode 100644 loader/mmio.h
>> =C2=A0 create mode 100644 loader/psci.h
>>
>=20
> Nice work! Will try to play with it on other (GICv3) targets.

Yep, really nice work! I'll try to get my hands dirty on it soon. I
should be able to test it on the ESPRESSObin.

>=20
> There is a bit code duplication in the loader. I wonder if we couldn't
> reuse the inmate library for that as well. Inmates can already run
> without Jailhouse, Ralf once enabled that.

I already had a quick look on the code -- from my first look, I think
that should be possible. It should be able to compile loader/inmate.c
like any other regular inmate, and get rid of lib.c

Other than that, I'll have a look at PSCI support for the inmate
library, I still have something in the queue:
  https://github.com/lfd/jailhouse/commits/arm-psci

Thanks
  Ralf

>=20
> Regarding cache coloring: Now that we start Jailhouse before Linux, the
> plan would be to present a sliced (according to colors) memory map to
> Linux via the device tree, just like it was done for the non-root cells
> in the original coloring series. Still, we do want SMMU for all targets
> eventually...
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7ecdb38c-72d3-5198-bc11-91ec5c17a138%40oth-regensburg.de.
