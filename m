Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBAXKRXVQKGQEGFNUVWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B559C8E0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 07:58:26 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id a7sf8926655edm.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Aug 2019 22:58:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566799106; cv=pass;
        d=google.com; s=arc-20160816;
        b=G9Efic33Vg2uDHoyaKNVMbi4ejlemNyEuZpOpb8vkjHXMH2e0aGcsk3q6bGxtaAlxN
         riawJHA5NTv8mPN/hr3ajSJaPO0buIZMG4vQFkkj3MFCpGbQ4aYVdrRwfKh8CN8XFaZT
         g+L9m52qmu7kI8+7y8ZRmQDpIVzXjQ1CLuzA59TXC9P7qvD+3eVp2tglVGBsqBrcC1Xa
         DiJzLcDIKbc3GpQgCmTBXfOpP7SqB1e+rD2TODkYEWFKcd8MPyBR4NXCJ2c6bQ15eVnk
         +R35tlWjGJXyir4CG71v+CulrY711UFjLO2vZ9oseVeSOjEHcG8EoHslNTa/FYnAHosK
         3L1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=j8wPT6LANqwtEqZ4PYkebTgSDH5B39eF2IZFeeLMIRc=;
        b=sFVYRv1yUzs6mAmnyqtxhhqpVhM53bPKP0D0Gm0CobWXQ4DIJY27M5eAhUKS6huRSP
         isYU7/R/04ilpir88Vx227VSi5T6QvuIPJnKYYnrXJCuW7POLf/ghDSdqfDIG9usqz8v
         E2iKvi5AJxLiE0oft4KcNO2i0j3B+eE09zihOOlI8zdP/ZuNWP5kAZwYWJWfoLpDCucL
         tJ8mwgZHKNBusJFfNG0h3nQ3dFzCYDJwYwAGWRkGRu0DXK4v2VBxVv6AIzCkIyxIQATH
         oDevebzW04GchAaZ2Hs5TrQGj8vX5LLWib6t6kDLeBpfx278UwmHLi6QjHb1u3rD7Iya
         PXQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Axj/O+Iw";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j8wPT6LANqwtEqZ4PYkebTgSDH5B39eF2IZFeeLMIRc=;
        b=c/wz37U2coXE3HBmYsTqJG/vdYEYQhermYnptl2IyH8PCyj4rzH1K9sNxBcb5xGwg0
         k5+Y2465XJWtbhKMUD0uWAha/RQEl7E2joHbeDc1v7Pdum6F5iwJy6FIKUDh8K4i4Hp9
         DgY5QUQr0HOkcQ0m9jwFYLCJHFm3xp1xoC0+Mx4woIAIPjSMxJOR7Ae7OmNo7CV0lFTm
         /Dcqi2gqHGhtDYN0PtK79leIEaaoGp6XC9qPGuH4gNY+L1KIXYpRmylfKpXroi12Eba5
         nIh1OVes8rIK3SOOFQm5f7xR56tR3UqWlbAhd8gjRohwFN+DghKnKcQOhAXkIsWyallT
         zxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j8wPT6LANqwtEqZ4PYkebTgSDH5B39eF2IZFeeLMIRc=;
        b=A6DZC4LZo0aBm3E3MtpdNNMi5jLQm0eXjjgBtpe/Ev9RMxdXMzPzdzCLAjljS+/pLV
         gR4DpIgndl8srRtBCDCQ6UpMxzS18FUIMtqtHcdy3XYck3SeWIGzez86qozdDMyehIQh
         UVdEt0F+qMV2fbJ1X6jSl5fNbgcnvRmSQY+ffwq+SMbLfwtnTKmvMo4O1aO2Gd+jqtCv
         uzee0ETrKbE2whN5qzZ/Qye7OJdOGAFvzJI9ik5siMTZp+ABlBY+IPeN+WxuSYqc2ISS
         yadRLz6MPriRXeCqhQP/4/iMCb8pX7ZqHXzV46EUGG/NqzqiHqxaDYwVYL+nkjqrFCPR
         FoVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCa4LVCW1uaeIN7OxRl++cqZ5zno0MuwLXFpCu1CdbqkTkuw7T
	NylMXJ4Wv+Ea7lqr0tVrgXo=
X-Google-Smtp-Source: APXvYqx+R1EY+iLhVT1WBYXSDWkF2t2MJGzDv6FyAy5wdL9GsVo3sUkFx30TY/DbrNhbkmXzoj9orw==
X-Received: by 2002:a50:9401:: with SMTP id p1mr16666732eda.189.1566799106127;
        Sun, 25 Aug 2019 22:58:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8908:: with SMTP id e8ls5647187ede.4.gmail; Sun, 25 Aug
 2019 22:58:25 -0700 (PDT)
X-Received: by 2002:a50:bb23:: with SMTP id y32mr17115074ede.145.1566799105685;
        Sun, 25 Aug 2019 22:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566799105; cv=none;
        d=google.com; s=arc-20160816;
        b=jQQGgsyz8xT6yFU3u1/jaI/y0lA6aEoRgI4ewchEipVc1QhwB5nJCLOQFtgLSpNRYT
         wRvG4xn5D6MNY6w1MRF+ZAGnNh28vIA4It6rtrHKP2VIl+WNdIpHaYoENdOnr8d7LpXh
         la7L9NT/KoYv6sunTO6pFmdnvZvAqIleMiJgNzfXoTn8gUfBZALtkIDGqE9xiXdS7I4X
         nOK+4HCMOKX50WTZZ9TgVt66iKL1bLSo/37SXVLxSNFdxEnkuajfjEInSr+ov9m7mjob
         zExQhLy5CXb//OEg7i3mg3LzazlI6n2FdNuNOKDnxY2R2vszf61vQyND5zbHAWf0iwSv
         x7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=RZpkXzdybGL4JzzVqkDOpjDWJ+6yPpdrjHywIZPsepk=;
        b=iXKDq+JaTscK6oeQ5ShOTe7mJSf71ly26rhqQVkcVA41Gf/zqnnpMYeVhLQ7nXmZ8q
         LWyX8gqLZuRBlSYGyU0iBpKajy6dPPvbjI5UAnZ2bFsJmTqSxuT/c+8ayVuHCP6uaFHv
         034Fe/MmR4nV05Hu6LAPJs51Mp5HKJE4dDBVICV8Yf8/ESEF6GHnNYYWXICwFDtPcafn
         XisVeoBgzQs6bSLvE9oPn3Kqg52BW+mITXSZKSi48CJcPQaKK+VdlzVJWWBr4RFZ5IpY
         Y9uae05HNbGG6qJQk4nY/mAXUrMa4ItqGEfXT3xaT7IY8Qn2fky8WOyZ0QMXcbyLCn5l
         OD3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Axj/O+Iw";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id l17si555201ejg.1.2019.08.25.22.58.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 22:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MX0UC-1hh6bk4C1c-00VwBz; Mon, 26
 Aug 2019 07:58:25 +0200
Subject: Re: [PATCH v4 2/6] arm-common: Introduce iommu functionality
To: Lokesh Vutla <lokeshvutla@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113521.7311-1-lokeshvutla@ti.com>
 <2dc1d2cb-4bb4-03a4-6716-f2311cb10b06@web.de>
 <88328ab5-f553-9cf5-45a3-90fa1fdf1a83@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5d9b8f42-0f2c-d72a-55b3-1358a474e7e3@web.de>
Date: Mon, 26 Aug 2019 07:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <88328ab5-f553-9cf5-45a3-90fa1fdf1a83@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DO0iUVUh5ZCjIkkoOoyZZCF4YRfamw00zr6X96VBRMmBxN9MTLE
 LcCUXxVNrXvr/v/3dyR3X6B/Bg9MTH1f49dLMJqZlY6O1mcXoeF56HcKi2CJrFlegZWJY0g
 pumDVRhopdN6eLhFKYHvGrr+U8PIT/dQFiR3Udrbqm6gNS9WHk+XY60bDzV9vX7wWqAw0vS
 tCcF6+HmGFRMtyY35bHAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/LFhVjaPkkg=:a/A/KUGukvi59h1g6CdfEl
 boSX7dwslGN3QhkKTHO1xQmSAhxiKbVvN4kucD/CIS8fT0EhYhEc9XVE5Z04TSuNZalavW5o4
 GRCu3pCn94fA4x3eeZKTd9MFhm8YLluG2deBJ/8nzcGg6fryMqyE+aq0EsIr5pCvxu29dVoFA
 KVg1wREsE6/+NP1KDqyxuwNpudrL4DAuHci7onOgz1oGgtmfp9xwLch+S26EuxUds4z3BJB1X
 5EPXs43JDFYZbahxlZi1eXAhxqIcxswMLspMOqg6h5GzPRzGmbTcUfPWNpzhudTFNYz4YuhZR
 gbi1oKdo6uTkL72/1zdPZnAhOExdGVyoJJDoByfOW+mFNVkQfHMRx4TI25pp0ysFcOk6ADqRS
 YjKCVpMRLUn7pM1vkSum+c4BcRgmZWrdLeaMTRN61SbpHxB6XbPK8amcbzBtz+XQwWZ3cStGn
 SwpPYF8OPDXFb7mjUwCxouuPCvKrzFQn610yS99T+xqGhqDoCzbhkIpsPLoPug6vlsY/ixw1A
 HmN4M1rGaZRNw76BdtdiLrsjoAeURYd3h1kZevNCuhYO/Z0ojvLv68gKmo6EIwS+owJealH3q
 CHqtvkLVoL7L2Q3zepyzYX58wsamjs+StTKdRlrdUV7XFl3oLbUkY/QH9RuhOHMXzqAhFJEIg
 WdD48dgDJ79lcN0BYxIsZhkTMMeN1lBmGtjcO2uZZ4TTB/zPEf2IMopImZRGlLpYyRCTZctZ4
 7VoK7Okd0s2Ae7uXRLXN2bM5NDQ3az1Nd8HjEE1dOj59Npkco7SPGWgcWggaAl6CpInyFzAYs
 8u9s3JiuAdMcUPlj7BhlrRrPLDQoGHqTvdIPM4qIj2YnAWM9FoRcYqBL2Kt3qaVR455k0iDLD
 NixP48WsN5Hk6R3jEtzi6Hj4KAAcrg7RYYDbd+c2IlEJLiDcl5GmBZ+3EJ6ZEkMFpaMczQI7F
 EKzHjrvTi6sAB8iPG0egQ2Glf6Rr+6GAZTdSnpk0bRapUvpdKvh0Kq3syrngC+I4hnktZkRBM
 bWO2ODZjyLfweDeVZfTxmsXk+GTz1od4WBuSvuwmHiN4I8QMBs6WeUrPYaklPlHBlr8MHQQiM
 6flWI+PZ0r9+5pSBvVuyPc+m/uneqNISik1f7prO0eFcFJ047TTRG+evp1eysO7FdzC5cAt0/
 wwSOo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="Axj/O+Iw";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 26.08.19 05:59, Lokesh Vutla wrote:
> Hi Jan,
>
> [..snip..]
>>>
>>>  =C2=A0 void __attribute__((noreturn)) arch_panic_stop(void)
>>> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h
>>> b/hypervisor/arch/arm-common/include/asm/iommu.h
>>> new file mode 100644
>>> index 00000000..67ac34eb
>>> --- /dev/null
>>> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
>>> @@ -0,0 +1,27 @@
>>> +/*
>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>> + *
>>> + * Copyright (c) 2019 Texas Instruments Incorporated - http://www.ti.c=
om
>>> + *
>>> + * Authors:
>>> + *=C2=A0 Nikhil Devshatwar <nikhil.nd@ti.com>
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#ifndef _JAILHOUSE_ASM_IOMMU_H
>>> +#define _JAILHOUSE_ASM_IOMMU_H
>>> +
>>> +#include <jailhouse/types.h>
>>> +#include <jailhouse/utils.h>
>>> +#include <jailhouse/config.h>
>>
>> Just updated this commit in next: jailhouse/config.h must not be include=
d
>> directly. It is optional, and it included automatically when available.
>
> Just curious, how do you detect these problems? Do you run any static too=
l or
> with manual inspection?

jailhouse-images - it builds the Debian package without a config.h.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5d9b8f42-0f2c-d72a-55b3-1358a474e7e3%40web.de.
