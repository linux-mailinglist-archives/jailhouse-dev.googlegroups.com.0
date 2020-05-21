Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4XZTH3AKGQEPBWMYKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B30D1DCDB7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 15:06:59 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q8sf1402120lfb.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 21 May 2020 06:06:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590066419; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wt2qbAT9an1C7lzNCw0VeTmqmDTR0y0RjrZ97ujqLqt0DVxwqLV5N05csqXvxfkFD4
         GDO21Mh7bJMRz1Xqn9PZtMvfuPs0wdHuNi8dA9KADMxbywpxRkoDZOd5X1DcW+Pli3re
         0994GdKSLB5ABfSpEAiQQOmQWxi4LnWnL7m7VLOCKWDT+19QEP8144fv9wO86tYS+GZ4
         jotpE1EAQWTeEDK0QOKwBqw8Yofmr8dhCoZqFm9s0tb4+PYzZCWr6hl0jO05cb2BdaIK
         CT5/U3HVoDpxvI5BuWmWCVHiPn8nw3tHIUxTzV9+4jd/R0Df7mi2lAESnQ6aTx/wPA9M
         SX3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8ZgoroaD1esGOr4OI3RZ/MeXWu/YOvU6qaTSuoQ6tWw=;
        b=qFdOV6hReHlYEn3kjIFo4o86Mfd1Y2NZQcC7t7+RY8dIpaVCA6ToknPAjqYIHsGMav
         dI0AyKmOp85lP+e7eaYofDyb1owXyfPSkNzbcH4JXQ1h0R/tRbdv8CeUaYxsT4Gbi1I5
         GPaSOMdov01YlSbUf+MR/AaDunkSkmisMeVYtp0NohfiLHzmQwVkkIA/on9AHJYjg4Tr
         phX8Q7ZZLL2qH6te/rs959SvhGo1nqWXW1eit+FL5Lrd/a489Ypu3xJzSObpoDSqmK93
         4bSua5E+M6/bkiVmx0ctE1eyJWTNwF9xt7gsoRVyPmCrm8ModfuceTvRoZOGGXDtDqdR
         yZ+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q+t2AyI9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8ZgoroaD1esGOr4OI3RZ/MeXWu/YOvU6qaTSuoQ6tWw=;
        b=qLc7HGqgHw3KaAhupHCExJjxr84wOtlxW9+qm6+EDTyPXmpJwqGaT6HUVbNdZXtKSd
         InC6h1v8UzhgJIH0/i/vSb+mOGep+Z2K73XzF+eIZ3SIqjrtlIOnYHNv0DYBpQflpZ4h
         dYvwSAK6zZt3J7JEweSzU1/3Q3mn/Hqqh+vcAI0hjyt6kwqv4h9ovdx8HHVa9Z/L3uAf
         H5Zy/HXjUSH/gq7QusVZ67qSP1XKWzd5MXVhkSbM8mik22CYIGrRn0K5NQeO2++KeeP6
         FUTZTNPptiDFQR7Pp2A72CoQE9ZccsAUj2S4h+PWeva7fZ4TX0g9vp+LkXrxfAZi0g3I
         UYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8ZgoroaD1esGOr4OI3RZ/MeXWu/YOvU6qaTSuoQ6tWw=;
        b=F9kj/Dj++/8ilCtrzpYOX9HjDQK5SYEAJqRD7ZOdFJdJtIqsfYpGsNI/eNlohsD0uc
         mUcPK6ofedDjdBt0GN4f0O9kWgiBCZJjznlWSLv4gNelNEllMJ0rqgk29PEdhdJTPt1c
         /5VYsoopavi5MEKQoGbOBixQ3wQn7fah29qaamIxcktUOIwtr8k6TlyQyfGNpZtxbPPI
         uw/BS0O4Yb8CP1eJG8oYx2sJPV61sQy5xSfBF2IY49VgHziuWqC8VTa4rp1+rpYJEdha
         4rPdUkb8jRxvG77XTJxzIJLL8GOkINKfSgKZEzZLcR55YEamONXExJ58BvR/OkOVWE1w
         6DEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530TeHOTQiMDKL30FxwAGlaht291cEpAyHOTkGAaXLenn5L2hhXn
	K2CeerqIXBT1x395vBxHM/Q=
X-Google-Smtp-Source: ABdhPJyJNgDxc8aC4g6I0VXy+pUD3G7OKlvpItSY6hN/8lobnYv0eOUY8X2HULS86vyiRT7vuUuZ/A==
X-Received: by 2002:a05:6512:31c5:: with SMTP id j5mr5060577lfe.26.1590066418832;
        Thu, 21 May 2020 06:06:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9194:: with SMTP id f20ls473559ljg.10.gmail; Thu, 21 May
 2020 06:06:58 -0700 (PDT)
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr3055570ljk.460.1590066418028;
        Thu, 21 May 2020 06:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590066418; cv=none;
        d=google.com; s=arc-20160816;
        b=Nzqm/TE/Iv3iLoEvhyX5NhoWHTTLE4b+4+EJ5VCGB/DUu3bYCp4Q0D5ZKiHm7rvi0d
         X7FjbYmSLAfQ52f9bh53iHE50RrRyts+XWdk1S3xe2qdG9xHPQIbrPrBM2VNiskn2wC+
         AMZTENzSeogzzruZ+YjSrd4KflkZ6sK+x8NzZM1Ljeo8FrLQeCNizA1lluUYg5VqIYXx
         bJtFvXD+vaVfSZka9iQE+CERaDiDP1+7ouNv+5PywQQMxEsOsCTdCndg4sb+ULxrlEI2
         35LGhcLxZDox/4dpKvRxp+7DB+bMoA8cIwOvzpa1nQdgzhBKC2KBFYVk978QVbzVoDTe
         bRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Z0agkTgTk9ev8QPH7hG4/KEQ+OqfCEvc+xPq+wRgcyU=;
        b=jGqI7mgNML+xAqzoAr3Y5TJ8HCPweF0Wm6gfgDSgTDXFDUnMxXZ5XPvjDTGI3FUMK3
         +cv0PWDrCLVdAwZppf6t0u/gznIgXMUODWmaX3xZNeI0VAgF+FYotLEB9XB4gYef6z5Y
         RttAr5H5Od+okAyOrau+ZH+wRisqa7kBmiSOIZkABEX4Cwj7QgXEw/Wuxo8Fz+048iAt
         ZLwNk3W2xLHdVlfs7nBzEorpoi+n61fTlduwz1Bxspln1Td5uXbaYAGI1g0B84PyyKul
         KnySw/SKc3vPaU0J/85zI2koSu+Gia9+LucDuxv6pOlDEIrMvd30mpY8njwVeUTmTVsZ
         0Zxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q+t2AyI9;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id m7si293606ljp.5.2020.05.21.06.06.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.53.180]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lhev7-1jG7Ob3NYn-00muVQ; Thu, 21
 May 2020 15:06:56 +0200
Subject: Re: FW: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
To: Alice Guo <alice.guo@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <1588154521-2897-1-git-send-email-peng.fan@nxp.com>
 <014fcc0a-9754-d785-44de-c6f826a5a478@siemens.com>
 <DB8PR04MB70656CE85EAB5D580BD70018E2B60@DB8PR04MB7065.eurprd04.prod.outlook.com>
 <DB8PR04MB7065A13C6B65867E3607589BE2B60@DB8PR04MB7065.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <517307ea-5500-de76-53e1-eafb21118417@web.de>
Date: Thu, 21 May 2020 15:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DB8PR04MB7065A13C6B65867E3607589BE2B60@DB8PR04MB7065.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eiNKcO/ibAhDXwFN+0aEVqRM6Djgj7zUr2W3rOSlzAbsdJHkv+R
 aBvnQlA1oLSadpyNkGlD+d2hyoJmK6gYAfxgdGX3eJaS3BPqXJzvPQ0GBSv04w+6ifZrFFL
 /gqI5Bt/vSdilDkDQdq77zWuXmmQYjsLJdViD1tU8Khg9EUaiieJkN/drRKl0lAAQrt6VW0
 xz1QmcT44dnqyNXDdM3lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J2Mb7givL24=:tLgR62tl9HBuIYj115JRev
 E6d294u9TnUHRLhgyc437n/4wCsnndr8qPr/AZXfFqgxpRAPgOjXK5X0dybEAbO9O+DjS+u3G
 5IgmjmBhBEVLyTU4UPAbrjqYfQ1eNYMYoRI/i3YfENwteNYYvO7BsgkWmbUlIo0F5J+xFdEdZ
 cs8iNIbWgZwjtflkfqRE9NVuvJqCL0XaDEB6zMX8GqMR6oSuYCErFwNTmo6uIQlxXTa2T/KAc
 bhl6ZOaFokBzClwgkphg9TQKTmgm5SURo10IagXKf43Yqarbkwhheim6AD8ulzEuMV95Z9BN4
 SUq3qwUkKc27ZOhmttQBMxvqCV2Q+Exe3vjt+duY+0inXpZd4YQ+QooBtfZwPblG7D1CX3RYr
 Jgusi0RxYN2GVeCd1u78MkHBjeWS1JmyapWFGwPTVKB33zKbn4/D3cJ6TW49/Al0PhLeFJl/l
 /5kf7k/3VW4f57ShLJL+G3Ef2wviyujqLufF+wq1irJT2+/QGiz0R10sTjKfci12UjXLF+nBj
 kmWpX3tR0Hy549+QEqomW2P/j4sIJgk02wZ7hJOmsMzOMC4lkFNT0dknZyMDh82UP45x3C4sU
 O2uwJdK2+WAGiOYcDGU9GlcCN7vJrtxRu6iirV23E/GiFQSLsqYacU5gkkR11qq8h8JBj6xG5
 XMQhpP1UXaJ2EnGO+Ce+3yS8G+E0hYBLJr4r+AMtuAfpbenlVOK8AJm9oKqHU7xVot78xfsQT
 l1E7rkJAirQ7myeNk82mkf36LWwtGen7HQBNzeC09ZYQM4MnxkV/6XYelqltud6/NL1/G+bxG
 9yAYBIXcN+PoG3k09r/IZOaIZGborjIT6U+ZsvtvswEhVImAFaVD2uRZ+AYcuazT8k2hIsOAl
 AqxygQq3y9BJrYRgqn6EMd0Pyk6ZFxRkrxPRo5cf/lY2mU0iU6MjNaqZg1aY+WaJSJedRlLUs
 xuettUPjpIYSIqP/MI/gtqcyRP+Fdt01No5r8dwNPXGo+QNoBEB8lvVtpRsx19kyZjhMCYL1z
 tb+rsMIXkPG1UphfQCNb3xgbSHftwrWQIFKrYQ8975GFjIub0dfvBzpKfxkob+Z8A3dNXLtlK
 NUr5UYKCeewaep7B6eIFJqRt6e4RKrEvwY4iNb0LVTg4tRUOBQFS4Fh16+hoY0nwl97KOnjci
 CKWGVk/FPO1EDGA/OYHrv7dW6ziiBI7WdiR8/rWUlqj8Vpi9wIiV3LomPYNmrbNxmVRVQqIKy
 B9959B2s3phZIXxeo
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=q+t2AyI9;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

On 20.05.20 13:48, Alice Guo wrote:
>
>
>> -----Original Message-----
>> From: Alice Guo
>> Sent: 2020=E5=B9=B45=E6=9C=8820=E6=97=A5 19:43
>> To: Jan Kiszka <jan.kiszka@siemens.com>
>> Subject: RE: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
>>
>>
>>
>>> -----Original Message-----
>>> From: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com>
>>> On Behalf Of Jan Kiszka
>>> Sent: 2020=E5=B9=B45=E6=9C=888=E6=97=A5 23:51
>>> To: Peng Fan <peng.fan@nxp.com>; Alice Guo <alice.guo@nxp.com>;
>>> jailhouse-dev@googlegroups.com
>>> Subject: [EXT] Re: [PATCH V1 1/2] arm64: introduce smmu-v2 support
>>>
>>> Caution: EXT Email
>>>
>>> On 29.04.20 12:02, peng.fan@nxp.com wrote:
>>>> From: Alice Guo <alice.guo@nxp.com>
>>>>
>>>> Support smmu-v2 mmu500, add sid master support, only support stage2
>>>> translation.
>>>>
>>>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>>>> ---
>>>>   hypervisor/arch/arm64/Kbuild          |   1 +
>>>>   hypervisor/arch/arm64/arm-smmu-regs.h | 220 ++++++
>>>>   hypervisor/arch/arm64/smmu.c          | 926
>>> ++++++++++++++++++++++++++
>>>>   include/jailhouse/cell-config.h       |  15 +
>>>>   include/jailhouse/sizes.h             |  47 ++
>>>>   5 files changed, 1209 insertions(+)
>>>>   create mode 100644 hypervisor/arch/arm64/arm-smmu-regs.h
>>>>   create mode 100644 hypervisor/arch/arm64/smmu.c
>>>>   create mode 100644 include/jailhouse/sizes.h
>>>>
>>>> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbui=
ld
>>>> index c34b0f32..e87c6e53 100644
>>>> --- a/hypervisor/arch/arm64/Kbuild
>>>> +++ b/hypervisor/arch/arm64/Kbuild
>>>> @@ -22,3 +22,4 @@ always :=3D lib.a
>>>>   lib-y :=3D $(common-objs-y)
>>>>   lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o traps.=
o
>>>>   lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
>>>> +lib-y +=3D smmu.o
>>>> diff --git a/hypervisor/arch/arm64/arm-smmu-regs.h
>>> b/hypervisor/arch/arm64/arm-smmu-regs.h
>>>> new file mode 100644
>>>> index 00000000..a1226e4a
>>>> --- /dev/null
>>>> +++ b/hypervisor/arch/arm64/arm-smmu-regs.h
>>>> @@ -0,0 +1,220 @@
>>>> +/*
>>>> + * IOMMU API for ARM architected SMMU implementations.
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modi=
fy
>>>> + * it under the terms of the GNU General Public License version 2 as
>>>> + * published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License
>>>> + * along with this program; if not, write to the Free Software
>>>> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07,
>>> USA.
>>>> + *
>>>> + * Copyright (C) 2013 ARM Limited
>>>> + *
>>>> + * Author: Will Deacon <will.deacon@arm.com>
>>>
>>> Is this file a 1:1 copy of the kernel header? Or is it also adopted?
>>>
>>
>> yes, copied from 4.14 kernel
>>
>>>> + */
>>>> +
>>>> +#ifndef _ARM_SMMU_REGS_H
>>>> +#define _ARM_SMMU_REGS_H
>>>> +
>>>> +/* Configuration registers */
>>>> +#define ARM_SMMU_GR0_sCR0            0x0
>>>> +#define sCR0_CLIENTPD                        (1 << 0)
>>>> +#define sCR0_GFRE                    (1 << 1)
>>>> +#define sCR0_GFIE                    (1 << 2)
>>>> +#define sCR0_EXIDENABLE                      (1 << 3)
>>>> +#define sCR0_GCFGFRE                 (1 << 4)
>>>> +#define sCR0_GCFGFIE                 (1 << 5)
>>>> +#define sCR0_USFCFG                  (1 << 10)
>>>> +#define sCR0_VMIDPNE                 (1 << 11)
>>>> +#define sCR0_PTM                     (1 << 12)
>>>> +#define sCR0_FB                              (1 << 13)
>>>> +#define sCR0_VMID16EN                        (1 << 31)
>>>> +#define sCR0_BSU_SHIFT                       14
>>>> +#define sCR0_BSU_MASK                        0x3
>>>> +
>>>> +/* Auxiliary Configuration register */
>>>> +#define ARM_SMMU_GR0_sACR            0x10
>>>> +
>>>> +/* Identification registers */
>>>> +#define ARM_SMMU_GR0_ID0             0x20
>>>> +#define ARM_SMMU_GR0_ID1             0x24
>>>> +#define ARM_SMMU_GR0_ID2             0x28
>>>> +#define ARM_SMMU_GR0_ID3             0x2c
>>>> +#define ARM_SMMU_GR0_ID4             0x30
>>>> +#define ARM_SMMU_GR0_ID5             0x34
>>>> +#define ARM_SMMU_GR0_ID6             0x38
>>>> +#define ARM_SMMU_GR0_ID7             0x3c
>>>> +#define ARM_SMMU_GR0_sGFSR           0x48
>>>> +#define ARM_SMMU_GR0_sGFSYNR0                0x50
>>>> +#define ARM_SMMU_GR0_sGFSYNR1                0x54
>>>> +#define ARM_SMMU_GR0_sGFSYNR2                0x58
>>>> +
>>>> +#define ID0_S1TS                     (1 << 30)
>>>> +#define ID0_S2TS                     (1 << 29)
>>>> +#define ID0_NTS                              (1 << 28)
>>>> +#define ID0_SMS                              (1 << 27)
>>>> +#define ID0_ATOSNS                   (1 << 26)
>>>> +#define ID0_PTFS_NO_AARCH32          (1 << 25)
>>>> +#define ID0_PTFS_NO_AARCH32S         (1 << 24)
>>>> +#define ID0_CTTW                     (1 << 14)
>>>> +#define ID0_NUMIRPT_SHIFT            16
>>>> +#define ID0_NUMIRPT_MASK             0xff
>>>> +#define ID0_NUMSIDB_SHIFT            9
>>>> +#define ID0_NUMSIDB_MASK             0xf
>>>> +#define ID0_EXIDS                    (1 << 8)
>>>> +#define ID0_NUMSMRG_SHIFT            0
>>>> +#define ID0_NUMSMRG_MASK             0xff
>>>> +
>>>> +#define ID1_PAGESIZE                 (1 << 31)
>>>> +#define ID1_NUMPAGENDXB_SHIFT                28
>>>> +#define ID1_NUMPAGENDXB_MASK         7
>>>> +#define ID1_NUMS2CB_SHIFT            16
>>>> +#define ID1_NUMS2CB_MASK             0xff
>>>> +#define ID1_NUMCB_SHIFT                      0
>>>> +#define ID1_NUMCB_MASK                       0xff
>>>> +
>>>> +#define ID2_OAS_SHIFT                        4
>>>> +#define ID2_OAS_MASK                 0xf
>>>> +#define ID2_IAS_SHIFT                        0
>>>> +#define ID2_IAS_MASK                 0xf
>>>> +#define ID2_UBS_SHIFT                        8
>>>> +#define ID2_UBS_MASK                 0xf
>>>> +#define ID2_PTFS_4K                  (1 << 12)
>>>> +#define ID2_PTFS_16K                 (1 << 13)
>>>> +#define ID2_PTFS_64K                 (1 << 14)
>>>> +#define ID2_VMID16                   (1 << 15)
>>>> +
>>>> +#define ID7_MAJOR_SHIFT                      4
>>>> +#define ID7_MAJOR_MASK                       0xf
>>>> +
>>>> +/* Global TLB invalidation */
>>>> +#define ARM_SMMU_GR0_TLBIVMID                0x64
>>>> +#define ARM_SMMU_GR0_TLBIALLNSNH     0x68
>>>> +#define ARM_SMMU_GR0_TLBIALLH                0x6c
>>>> +#define ARM_SMMU_GR0_sTLBGSYNC               0x70
>>>> +#define ARM_SMMU_GR0_sTLBGSTATUS     0x74
>>>> +#define sTLBGSTATUS_GSACTIVE         (1 << 0)
>>>> +
>>>> +/* Stream mapping registers */
>>>> +#define ARM_SMMU_GR0_SMR(n)          (0x800 + ((n) << 2))
>>>> +#define SMR_VALID                    (1 << 31)
>>>> +#define SMR_MASK_SHIFT                       16
>>>> +#define SMR_ID_SHIFT                 0
>>>> +
>>>> +#define ARM_SMMU_GR0_S2CR(n)         (0xc00 + ((n) << 2))
>>>> +#define S2CR_CBNDX_SHIFT             0
>>>> +#define S2CR_CBNDX_MASK                      0xff
>>>> +#define S2CR_EXIDVALID                       (1 << 10)
>>>> +#define S2CR_TYPE_SHIFT                      16
>>>> +#define S2CR_TYPE_MASK                       0x3
>>>> +enum arm_smmu_s2cr_type {
>>>> +     S2CR_TYPE_TRANS,
>>>> +     S2CR_TYPE_BYPASS,
>>>> +     S2CR_TYPE_FAULT,
>>>> +};
>>>
>>> What is the advantage of modelling these as enum? And are we anywhere
>>> relying on their exact values for the width if those types? If so, then
>>> better use u* types and constant #defines.
>>>
>>
>> copied from 4.14 kernel. Should I rebased to 5.7? or any suggestions?
>>

Well, if it's just copied, my question would actually have to go to
Will. Let's keep it like Linux does for now.

>>>> +
>>>> +#define S2CR_PRIVCFG_SHIFT           24
>>>> +#define S2CR_PRIVCFG_MASK            0x3
>>>> +enum arm_smmu_s2cr_privcfg {
>>>> +     S2CR_PRIVCFG_DEFAULT,
>>>> +     S2CR_PRIVCFG_DIPAN,
>>>> +     S2CR_PRIVCFG_UNPRIV,
>>>> +     S2CR_PRIVCFG_PRIV,
>>>> +};
>>>
>>> Same as above.
>>>
>>>> +
>>>> +/* Context bank attribute registers */
>>>> +#define ARM_SMMU_GR1_CBAR(n)         (0x0 + ((n) << 2))
>>>> +#define CBAR_VMID_SHIFT                      0
>>>> +#define CBAR_VMID_MASK                       0xff
>>>> +#define CBAR_S1_BPSHCFG_SHIFT                8
>>>> +#define CBAR_S1_BPSHCFG_MASK         3
>>>> +#define CBAR_S1_BPSHCFG_NSH          3
>>>> +#define CBAR_S1_MEMATTR_SHIFT                12
>>>> +#define CBAR_S1_MEMATTR_MASK         0xf
>>>> +#define CBAR_S1_MEMATTR_WB           0xf
>>>> +#define CBAR_TYPE_SHIFT                      16
>>>> +#define CBAR_TYPE_MASK                       0x3
>>>> +#define CBAR_TYPE_S2_TRANS           (0 << CBAR_TYPE_SHIFT)
>>>> +#define CBAR_TYPE_S1_TRANS_S2_BYPASS (1 << CBAR_TYPE_SHIFT)
>>>> +#define CBAR_TYPE_S1_TRANS_S2_FAULT  (2 << CBAR_TYPE_SHIFT)
>>>> +#define CBAR_TYPE_S1_TRANS_S2_TRANS  (3 << CBAR_TYPE_SHIFT)
>>>> +#define CBAR_IRPTNDX_SHIFT           24
>>>> +#define CBAR_IRPTNDX_MASK            0xff
>>>> +
>>>> +#define ARM_SMMU_GR1_CBA2R(n)                (0x800 + ((n) <<
>> 2))
>>>> +#define CBA2R_RW64_32BIT             (0 << 0)
>>>> +#define CBA2R_RW64_64BIT             (1 << 0)
>>>> +#define CBA2R_VMID_SHIFT             16
>>>> +#define CBA2R_VMID_MASK                      0xffff
>>>> +
>>>> +#define ARM_SMMU_CB_SCTLR            0x0
>>>> +#define ARM_SMMU_CB_ACTLR            0x4
>>>> +#define ARM_SMMU_CB_RESUME           0x8
>>>> +#define ARM_SMMU_CB_TTBCR2           0x10
>>>> +#define ARM_SMMU_CB_TTBR0            0x20
>>>> +#define ARM_SMMU_CB_TTBR1            0x28
>>>> +#define ARM_SMMU_CB_TTBCR            0x30
>>>> +#define ARM_SMMU_CB_CONTEXTIDR               0x34
>>>> +#define ARM_SMMU_CB_S1_MAIR0         0x38
>>>> +#define ARM_SMMU_CB_S1_MAIR1         0x3c
>>>> +#define ARM_SMMU_CB_PAR                      0x50
>>>> +#define ARM_SMMU_CB_FSR                      0x58
>>>> +#define ARM_SMMU_CB_FAR                      0x60
>>>> +#define ARM_SMMU_CB_FSYNR0           0x68
>>>> +#define ARM_SMMU_CB_S1_TLBIVA                0x600
>>>> +#define ARM_SMMU_CB_S1_TLBIASID              0x610
>>>> +#define ARM_SMMU_CB_S1_TLBIVAL               0x620
>>>> +#define ARM_SMMU_CB_S2_TLBIIPAS2     0x630
>>>> +#define ARM_SMMU_CB_S2_TLBIIPAS2L    0x638
>>>> +#define ARM_SMMU_CB_TLBSYNC          0x7f0
>>>> +#define ARM_SMMU_CB_TLBSTATUS                0x7f4
>>>> +#define ARM_SMMU_CB_ATS1PR           0x800
>>>> +#define ARM_SMMU_CB_ATSR             0x8f0
>>>> +
>>>> +#define SCTLR_S1_ASIDPNE             (1 << 12)
>>>> +#define SCTLR_CFCFG                  (1 << 7)
>>>> +#define SCTLR_CFIE                   (1 << 6)
>>>> +#define SCTLR_CFRE                   (1 << 5)
>>>> +#define SCTLR_E                              (1 << 4)
>>>> +#define SCTLR_AFE                    (1 << 2)
>>>> +#define SCTLR_TRE                    (1 << 1)
>>>> +#define SCTLR_M                              (1 << 0)
>>>> +
>>>> +#define CB_PAR_F                     (1 << 0)
>>>> +
>>>> +#define ATSR_ACTIVE                  (1 << 0)
>>>> +
>>>> +#define RESUME_RETRY                 (0 << 0)
>>>> +#define RESUME_TERMINATE             (1 << 0)
>>>> +
>>>> +#define TTBCR2_SEP_SHIFT             15
>>>> +#define TTBCR2_SEP_UPSTREAM          (0x7 << TTBCR2_SEP_SHIFT)
>>>> +#define TTBCR2_AS                    (1 << 4)
>>>> +
>>>> +#define TTBRn_ASID_SHIFT             48
>>>> +
>>>> +#define FSR_MULTI                    (1 << 31)
>>>> +#define FSR_SS                               (1 << 30)
>>>> +#define FSR_UUT                              (1 << 8)
>>>> +#define FSR_ASF                              (1 << 7)
>>>> +#define FSR_TLBLKF                   (1 << 6)
>>>> +#define FSR_TLBMCF                   (1 << 5)
>>>> +#define FSR_EF                               (1 << 4)
>>>> +#define FSR_PF                               (1 << 3)
>>>> +#define FSR_AFF                              (1 << 2)
>>>> +#define FSR_TF                               (1 << 1)
>>>> +
>>>> +#define FSR_IGN                              (FSR_AFF | FSR_ASF
>> | \
>>>> +                                      FSR_TLBMCF | FSR_TLBLKF)
>>>> +#define FSR_FAULT                    (FSR_MULTI | FSR_SS |
>> FSR_UUT |
>>> \
>>>> +                                      FSR_EF | FSR_PF | FSR_TF |
>>> FSR_IGN)
>>>> +
>>>> +#define FSYNR0_WNR                   (1 << 4)
>>>> +
>>>> +#endif /* _ARM_SMMU_REGS_H */
>>>> diff --git a/hypervisor/arch/arm64/smmu.c
>>> b/hypervisor/arch/arm64/smmu.c
>>>> new file mode 100644
>>>> index 00000000..ea1b4c1e
>>>> --- /dev/null
>>>> +++ b/hypervisor/arch/arm64/smmu.c
>>>> @@ -0,0 +1,926 @@
>>>> +/*
>>>> + * Jailhouse, a Linux-based partitioning hypervisor
>>>> + *
>>>> + * Copyright 2018-2020 NXP
>>>> + *
>>>> + * This work is licensed under the terms of the GNU GPL, version 2.  =
See
>>>> + * the COPYING file in the top-level directory.
>>>> + *
>>>> + * Modified from Linux smmu.c
>>>> + */
>>>> +
>>>> +#include <jailhouse/control.h>
>>>> +#include <jailhouse/ivshmem.h>
>>>> +#include <jailhouse/mmio.h>
>>>> +#include <jailhouse/paging.h>
>>>> +#include <jailhouse/pci.h>
>>>> +#include <jailhouse/printk.h>
>>>> +#include <jailhouse/sizes.h>
>>>> +#include <jailhouse/string.h>
>>>> +#include <jailhouse/unit.h>
>>>> +#include <asm/spinlock.h>
>>>> +#include <jailhouse/cell-config.h>
>>>> +
>>>> +#include "arm-smmu-regs.h"
>>>
>>> Are those regs common to anyone? SMMUv3? If not, better fold in. If
>>> there is something to share, then move to include/asm/,
>>>
>>
>> The regs are used by current smmu-v2 driver. not smmuv3. I could check
>> whether smmuv3 could reuse, but I guess no, because the hardware design =
is
>> different.

Then just move the required defines from arm-smmu-regs.h into this c
file. Just like smmu-v3.c does as well.

>>
>>>> +
>>>> +#define ARM_32_LPAE_TCR_EAE          (1 << 31)
>>>> +#define ARM_64_LPAE_S2_TCR_RES1              (1 << 31)
>>>> +
>>>> +#define ARM_LPAE_TCR_EPD1            (1 << 23)
>>>> +
>>>> +#define ARM_LPAE_TCR_TG0_4K          (0 << 14)
>>>> +#define ARM_LPAE_TCR_TG0_64K         (1 << 14)
>>>> +#define ARM_LPAE_TCR_TG0_16K         (2 << 14)
>>>> +
>>>> +#define ARM_LPAE_TCR_SH0_SHIFT               12
>>>> +#define ARM_LPAE_TCR_SH0_MASK                0x3
>>>> +#define ARM_LPAE_TCR_SH_NS           0
>>>> +#define ARM_LPAE_TCR_SH_OS           2
>>>> +#define ARM_LPAE_TCR_SH_IS           3
>>>> +
>>>> +#define ARM_LPAE_TCR_ORGN0_SHIFT     10
>>>> +#define ARM_LPAE_TCR_IRGN0_SHIFT     8
>>>> +#define ARM_LPAE_TCR_RGN_MASK                0x3
>>>> +#define ARM_LPAE_TCR_RGN_NC          0
>>>> +#define ARM_LPAE_TCR_RGN_WBWA                1
>>>> +#define ARM_LPAE_TCR_RGN_WT          2
>>>> +#define ARM_LPAE_TCR_RGN_WB          3
>>>> +
>>>> +#define ARM_LPAE_TCR_SL0_SHIFT               6
>>>> +#define ARM_LPAE_TCR_SL0_MASK                0x3
>>>> +#define ARM_LPAE_TCR_SL0_LVL_2               0
>>>> +#define ARM_LPAE_TCR_SL0_LVL_1               1
>>>> +
>>>> +#define ARM_LPAE_TCR_T0SZ_SHIFT              0
>>>> +#define ARM_LPAE_TCR_SZ_MASK         0xf
>>>> +
>>>> +#define ARM_LPAE_TCR_PS_SHIFT                16
>>>> +#define ARM_LPAE_TCR_PS_MASK         0x7
>>>> +
>>>> +#define ARM_LPAE_TCR_IPS_SHIFT               32
>>>> +#define ARM_LPAE_TCR_IPS_MASK                0x7
>>>> +
>>>> +#define ARM_LPAE_TCR_PS_32_BIT               0x0ULL
>>>> +#define ARM_LPAE_TCR_PS_36_BIT               0x1ULL
>>>> +#define ARM_LPAE_TCR_PS_40_BIT               0x2ULL
>>>> +#define ARM_LPAE_TCR_PS_42_BIT               0x3ULL
>>>> +#define ARM_LPAE_TCR_PS_44_BIT               0x4ULL
>>>> +#define ARM_LPAE_TCR_PS_48_BIT               0x5ULL
>>>> +#define ARM_LPAE_TCR_PS_52_BIT               0x6ULL
>>>> +#define ARM_MMU500_ACTLR_CPRE                (1 << 1)
>>>> +
>>>> +#define ARM_MMU500_ACR_CACHE_LOCK    (1 << 26)
>>>> +#define ARM_MMU500_ACR_S2CRB_TLBEN   (1 << 10)
>>>> +#define ARM_MMU500_ACR_SMTNMB_TLBEN  (1 << 8)
>>>> +
>>>> +#define TLB_LOOP_TIMEOUT             1000000 /* 1s! */
>>>> +#define TLB_SPIN_COUNT                       10
>>>
>>> How do those numbers map to real-time? Are they truly CPU(-frequency)
>>> independent?
>>>
>>
>> The numbers are copied from Linux kernel. Actually the function using th=
e
>> macros are only called by arm_smmu_init in root cell initialization stag=
e, so i
>> suppose it not affect runtime realtime.

With "real-time" I mean that the actual runtime is. Look, upstream has a
udelay in the loop. You don't have anything. So the comment "1s!" is
very likley wrong, and it is the question how to ensure that we wait
sufficiently long on faster CPUs.

>>
>>>> +
>>>> +/* Maximum number of context banks per SMMU */
>>>> +#define ARM_SMMU_MAX_CBS             128
>>>> +
>>>> +/* SMMU global address space */
>>>> +#define ARM_SMMU_GR0(smmu)           ((smmu)->base)
>>>> +#define ARM_SMMU_GR1(smmu)           ((smmu)->base + (1 <<
>>> (smmu)->pgshift))
>>>> +
>>>> +/*
>>>> + * SMMU global address space with conditional offset to access secure
>>>> + * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
>>>> + * nsGFSYNR0: 0x450)
>>>> + */
>>>> +#define ARM_SMMU_GR0_NS(smmu)
>>> \
>>>> +     ((smmu)->base +
>>> \
>>>> +             ((smmu->options &
>> ARM_SMMU_OPT_SECURE_CFG_ACCESS)
>>> \
>>>> +                     ? 0x400 : 0))
>>>> +
>>>> +/* Translation context bank */
>>>> +#define ARM_SMMU_CB(smmu, n) ((smmu)->cb_base + ((n) <<
>>> (smmu)->pgshift))
>>>> +
>>>> +#define MSI_IOVA_BASE                        0x8000000
>>>> +#define MSI_IOVA_LENGTH                      0x100000
>>>> +
>>>> +struct arm_smmu_s2cr {
>>>> +     enum arm_smmu_s2cr_type         type;
>>>> +     enum arm_smmu_s2cr_privcfg      privcfg;
>>>> +     u8                              cbndx;
>>>> +};
>>>> +
>>>> +struct arm_smmu_smr {
>>>> +     u16                             mask;
>>>> +     u16                             id;
>>>> +     bool                            valid;
>>>> +};
>>>> +
>>>> +struct arm_smmu_cb {
>>>> +     u64                             ttbr[2];
>>>> +     u32                             tcr[2];
>>>> +     u32                             mair[2];
>>>> +     struct arm_smmu_cfg             *cfg;
>>>> +};
>>>
>>> Is any of those data structures shared with the hardware? Or are they
>>> just for internal book-keeping? I'm asking because of aligments, packin=
g
>>> etc. Applies to almost all structs you define.
>>>
>>
>> adopted from linux kernel. For internal booking. Should I keep linux cod=
ing style
>> when I adopt linux code, or adapt to jailhouse one?

This was not a style question but a was checking the correctness of the
structure. Style is ok here also for Jailhouse.

>>
>>>> +
>>>> +struct arm_smmu_device {
>>>> +     void    *base;
>>>> +     void    *cb_base;
>>>> +     u32     num_masters;
>>>> +     unsigned long                   pgshift;
>>>> +
>>>> +#define ARM_SMMU_FEAT_COHERENT_WALK  (1 << 0)
>>>> +#define ARM_SMMU_FEAT_STREAM_MATCH   (1 << 1)
>>>> +#define ARM_SMMU_FEAT_TRANS_S1               (1 << 2)
>>>> +#define ARM_SMMU_FEAT_TRANS_S2               (1 << 3)
>>>> +#define ARM_SMMU_FEAT_TRANS_NESTED   (1 << 4)
>>>> +#define ARM_SMMU_FEAT_TRANS_OPS              (1 << 5)
>>>> +#define ARM_SMMU_FEAT_VMID16         (1 << 6)
>>>> +#define ARM_SMMU_FEAT_FMT_AARCH64_4K (1 << 7)
>>>> +#define ARM_SMMU_FEAT_FMT_AARCH64_16K        (1 << 8)
>>>> +#define ARM_SMMU_FEAT_FMT_AARCH64_64K        (1 << 9)
>>>> +#define ARM_SMMU_FEAT_FMT_AARCH32_L  (1 << 10)
>>>> +#define ARM_SMMU_FEAT_FMT_AARCH32_S  (1 << 11)
>>>> +#define ARM_SMMU_FEAT_EXIDS          (1 << 12)
>>>
>>> I would prefer those defines outside of the struct. Also below.
>>>
>>>> +     u32                             features;
>>>> +
>>>> +#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
>>>> +     u32                             options;
>>>> +     enum arm_smmu_arch_version      version;
>>>> +     enum arm_smmu_implementation    model;
>>>> +
>>>> +     u32                             num_context_banks;
>>>> +     u32                             num_s2_context_banks;
>>>> +     struct arm_smmu_cb              *cbs;
>>>> +
>>>> +     u32                             num_mapping_groups;
>>>> +     u16                             streamid_mask;
>>>> +     u16                             smr_mask_mask;
>>>> +     struct arm_smmu_smr             *smrs;
>>>> +     struct arm_smmu_s2cr            *s2crs;
>>>> +     struct arm_smmu_cfg             *cfgs;
>>>> +
>>>> +     unsigned long                   va_size;
>>>> +     unsigned long                   ipa_size;
>>>> +     unsigned long                   pa_size;
>>>> +     unsigned long                   pgsize_bitmap;
>>>> +
>>>> +     u32                             num_global_irqs;
>>>> +     u32                             num_context_irqs;
>>>> +     unsigned int                    *irqs;
>>>> +
>>>> +     spinlock_t                      global_sync_lock;
>>>> +};
>>>> +
>>>> +enum arm_smmu_context_fmt {
>>>> +     ARM_SMMU_CTX_FMT_NONE,
>>>> +     ARM_SMMU_CTX_FMT_AARCH64,
>>>> +     ARM_SMMU_CTX_FMT_AARCH32_L,
>>>> +     ARM_SMMU_CTX_FMT_AARCH32_S,
>>>> +};
>>>> +
>>>> +struct arm_smmu_cfg {
>>>> +     u8                              cbndx;
>>>> +     u8                              irptndx;
>>>> +     union {
>>>> +             u16                     asid;
>>>> +             u16                     vmid;
>>>> +     };
>>>> +     u32                             cbar;
>>>> +     enum arm_smmu_context_fmt       fmt;
>>>> +};
>>>> +#define INVALID_IRPTNDX                      0xff
>>>> +
>>>> +enum arm_smmu_domain_stage {
>>>> +     ARM_SMMU_DOMAIN_S1 =3D 0,
>>>> +     ARM_SMMU_DOMAIN_S2,
>>>> +     ARM_SMMU_DOMAIN_NESTED,
>>>> +     ARM_SMMU_DOMAIN_BYPASS,
>>>> +};
>>>
>>> This enum is even not uses for typechecking. So, simple #defines suffic=
e.
>>>
>>>> +
>>>> +#define s2cr_init_val (struct arm_smmu_s2cr){        \
>>>> +     .type =3D S2CR_TYPE_BYPASS,               \
>>>> +}
>>>> +
>>>> +
>>>> +static struct arm_smmu_device smmu_device;
>>>> +static unsigned long pgsize_bitmap =3D -1;
>>>> +static u16 arm_sid_mask;
>>>
>>> Why a global arm_sid_mask when it is configured per SMMU instance?
>>>
>>
>> I need to rethink about this case, I only took one smmu into considerati=
on when
>> doing i.MX8QM.

If there can be more, we should at least plan for it, specifically when
that is simple enough. And if you assume n =3D=3D 1 for now, at least leave
a comment.

>>
>>>> +
>>>> +static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int
>> idx)
>>>> +{
>>>> +     struct arm_smmu_smr *smr =3D smmu->smrs + idx;
>>>> +     u32 reg =3D smr->id << SMR_ID_SHIFT | smr->mask <<
>>> SMR_MASK_SHIFT;
>>>> +
>>>> +     if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
>>>> +             reg |=3D SMR_VALID;
>>>> +     mmio_write32(ARM_SMMU_GR0(smmu) +
>>> ARM_SMMU_GR0_SMR(idx), reg);
>>>> +}
>>>> +
>>>> +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int
>> idx)
>>>> +{
>>>> +     struct arm_smmu_s2cr *s2cr =3D smmu->s2crs + idx;
>>>> +     u32 reg =3D (s2cr->type & S2CR_TYPE_MASK) << S2CR_TYPE_SHIFT |
>>>> +               (s2cr->cbndx & S2CR_CBNDX_MASK) <<
>>> S2CR_CBNDX_SHIFT |
>>>> +               (s2cr->privcfg & S2CR_PRIVCFG_MASK) <<
>>> S2CR_PRIVCFG_SHIFT;
>>>
>>> We already have the GET_FIELD macro. Maybe some SET_FIELD would be
>>> useful. It would allow to encode the fields in-place, without #defines.
>>>
>>
>> ok, I will adopt jailhouse coding style.
>>
>>>> +
>>>> +     if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs
>> &&
>>>> +         smmu->smrs[idx].valid)
>>>> +             reg |=3D S2CR_EXIDVALID;
>>>> +     mmio_write32(ARM_SMMU_GR0(smmu) +
>>> ARM_SMMU_GR0_S2CR(idx), reg);
>>>> +}
>>>> +
>>>> +static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int
>> idx)
>>>> +{
>>>> +     if (smmu->smrs)
>>>> +             arm_smmu_write_smr(smmu, idx);
>>>> +
>>>> +     arm_smmu_write_s2cr(smmu, idx);
>>>> +}
>>>> +
>>>> +/* Wait for any pending TLB invalidations to complete */
>>>> +static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>>>> +                             void *sync, void *status)
>>>> +{
>>>> +     unsigned int spin_cnt, delay;
>>>> +
>>>> +     mmio_write32(sync, 0);
>>>> +     for (delay =3D 1; delay < TLB_LOOP_TIMEOUT; delay *=3D 2) {
>>>> +             for (spin_cnt =3D TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt=
--) {
>>>> +                     if (!(mmio_read32(status) &
>>> sTLBGSTATUS_GSACTIVE))
>>>> +                             return;
>>>> +                     cpu_relax();
>>>> +             }
>>>> +     }
>>>> +     printk("TLB sync timed out -- SMMU may be deadlocked\n");
>>>
>>> Hmm, end then? Contiue with eyes shut? Shouldn't this error be
>>> propagated? Seems doable, at least for the cases I checked.
>>>
>>
>> 4.14 kernel does this. I need check 5.7 kernel whether there have improv=
ment.

Even if not: No reason for us to ignore errors.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/517307ea-5500-de76-53e1-eafb21118417%40web.de.
