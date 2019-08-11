Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB6NCYHVAKGQEYQJ55OQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F10892E4
	for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 19:33:45 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id m2sf20055438ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 11 Aug 2019 10:33:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565544825; cv=pass;
        d=google.com; s=arc-20160816;
        b=lu+3+OQKpu2yJ8VorKgZrFEBBieNwYT2DbfXiaSw3MVE/sPdvyV86SsGL2QHJL7KB8
         p2VnkeRkCeikj9Jaip5kyU5On748iEcwAuJkCr9xRcrchto/t0gZ9Q9gMPpA9T715qAl
         rUG730IYFNCRtCJfZveasg2cjTP54lz1htsiy5XlpTv/QqyaCweEdhkYWHKRpVsswh2w
         /ewU+1KD9zoDHWn0N/yFfx8LTv9LEis1/RfrxGs+iK6bqxZIvQVPUdXuu0kuqQN5bv1R
         JMl2aXX1eEaDVNdfiviCKm0HA5MwU4MfvUic20QBlcRHDbbxRcKNaG7l8nzX+1FFFHvP
         YcGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=HKQgKnZL7R9faQ0KxVR/9kXOo8kdPPqzsqYju9C/8TI=;
        b=A1deBjuR+B5i45grrnCZeRQuYJqpWjCnA+RNJ3ya1PQ96XaUihYK9V4/i0TfQV1ZZ2
         ANPVBODxYnHvlikEU5PGzz0Ncw9DlDNKmbt8rNcHO3LWDqp+XxwjsnEje3Fcex0nSIal
         UtT/SFOU9C02q0ZxiEef7Jl5vi07wj6tQO9b0da3lR9/XNGOzsebNY8j6jBA7rtf9r+V
         6CP1esNSpNUOUfNPLNmoq9HII+LJ4cUuKYIo5T4eZzNjGd7oFWcYZTVLCRcof2ZptE81
         WUkQCD/We9rgCO2nIpCG/kP7pXIBcZX/amkrNM+g7Fn2KMNHsj2/4LxFjY4LhyJG1w2p
         KwKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MgqHZNMp;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HKQgKnZL7R9faQ0KxVR/9kXOo8kdPPqzsqYju9C/8TI=;
        b=SPqZu2gOioE++R7NE6PmFP1lycWxvdzG5z3tAPuLMEj5k9QpfSmkUiZf1dJaKidQCs
         hEJRa5DmSSjNMhVGxdGw2lKmcFkd49L+9kzwbo+Df2xvSAH3oTnEaLEAERCbmHvMOqB8
         EXBYTgvV1T1dluZArxxhywPJ1nD6oU5kHTNeZ4cT0Jg+Yo+lMh3E3ITC3WdLfHdar5TK
         s/+FeOG3CBK1cx1PEJaw47D0GHDSDnxdA9HWNrQXga8R+rcN8yrwEEFrdWR8Pj+YAshn
         /AfVub8gHLx99W7hNfPc22NrknBHDlkkAoW4y9fT0vXFk0tMQJ3krq8iC7mnwxu1L3ec
         jwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HKQgKnZL7R9faQ0KxVR/9kXOo8kdPPqzsqYju9C/8TI=;
        b=rZ1En0P3a733slwPqTPxWmob7ylg7QMcmmsxu4+8ZNWyjZQ1olgqSA2Q0yioz/FovE
         /ON1+GMQ5UNbNz7LjsX3iu4BTHSYq//MV2an4PR1SYEQUnjwrK4ulH121Av2OMwhBVnD
         pvwVFA4JKnRcS9HsWgTaqvGHNuJMkuXfx69PtT/oXztwZLCVkQCpwVmTfbj1ka7t8juf
         GOm3TS0Z6QlcTz06VAunIQajsyjrM+zGBIo979gdoKyBNOfPaclhbEXqVQinf0Hpxsvu
         cWkGri+1F46FyzYGBi3k0naS2T9nsGBGvKvb75m/KCdmk74UwcQMbKqAdVhGeR19uZAB
         MuQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU14jLY49k7Amn3tzwtYWpbuJIpEwAoBeDKrTnteHkboQprzbSY
	2evSUTEbEqicoG4VIWVQPZE=
X-Google-Smtp-Source: APXvYqzyfjJ3ICn+Q5yhlry8YWS41Dvau0F4I3ghsLvVremEp1zpJ9PYi9LIXBUr/Q94tZN110ybVg==
X-Received: by 2002:a19:4f42:: with SMTP id a2mr17538273lfk.23.1565544825372;
        Sun, 11 Aug 2019 10:33:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8854:: with SMTP id z20ls11538162ljj.5.gmail; Sun, 11
 Aug 2019 10:33:44 -0700 (PDT)
X-Received: by 2002:a2e:8510:: with SMTP id j16mr362338lji.174.1565544824823;
        Sun, 11 Aug 2019 10:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565544824; cv=none;
        d=google.com; s=arc-20160816;
        b=ylwLR5t0VaUKKZhQXQG04tKvuYYHfBuiiOsQDkRm6FmOV0Qrpuy83zecF7E8E6FA9i
         a3MYKC2fSVHrxEPKlz3yjyc3BqSNFOjSKoiDpWQnqZrz/oDTHeoaN9UZ7Uqs0uLt/wf1
         lEH2fDCf2Bx7krmcxLUNgU7v+pjw2exogijfvc4HPgR1TRJqIpOAZ3b5qBZA2YS3Hxzh
         FU0+OzXXFnd2pU4QELi/bkB1eV6n7UvbCrkU0Zck7Qp2OOE/Yuv3S/NlR4cDIgtkPPzk
         Csca5r7k4x9GsYpoWCGw9lwJC3gYFuL7XagGbDrdyVJZ2kv3+uSXehiMbvbh41G5rZpP
         Sm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=H1hAdxzRYD4qXKdsZ/RUzwTbgRzxFDMrvt3AJ5Z/4xY=;
        b=yp//tMsY2SQJb/cbBGnuPl/rCw3v09FCqAzaajdRBNt8pU4tCze0zIf00l02nSJITG
         XXHxMObkdJiMAZxuy3bTrU/Iq9YXyREYL5h7ez0ZyDzVaWTGNbm2J+LE8/HPUS2eBV2r
         7nLP98grPO8NKeNiEALNA2beTpG5R+sGIQEzxC79zsgQewed3T0DYPYJZV86Xm6FLXyv
         PtbzBJq5nmxfuAolxIn0xgSKi2I1yx+5iFNNPLCb7tND98du+fE+HWX1ljlLcgq+Td1g
         vJYkG5BlLGvNUeW3AvtZdyKJJicKSjzlmSUyoDCntEQDPaL6LtiSqy18hsPw0+9AoSj9
         sZCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MgqHZNMp;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id i21si13467ljj.1.2019.08.11.10.33.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 10:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LeLWz-1ieCkM1q85-00qEPy; Sun, 11
 Aug 2019 19:33:43 +0200
Subject: Re: [PATCH v5 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2
 translations
To: Lokesh Vutla <lokeshvutla@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8e014b47-3eca-68c3-0b9c-3eb5d3265af0@web.de>
Date: Sun, 11 Aug 2019 19:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:btCTOMGXJaqH1atTQsfzk61BUjs5M0cg9T30PSdsttcl45ZuITj
 Z+afiV4b2YawBJByvs8FYtnAvwcqiaRpgRuhgMDHMVijtaNNdR2mI02Gpa80eAlTdSihRBT
 pY4ZO1CvEoGv9cgDF/x3cVxg8d7Elyf8LzbCeGQWmpJh1QVa7NSlulgmfJGCKAXDcLozlN1
 89ChR7ksgxC6xh+WyJQ6Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VZTrXo6zMhU=:Xp8Io+rqj/FJyOisXZkO1b
 YJDLR5nM2j+mq8+8kqKyWl0Cak0AWWxhL4zAjfwO3AbDvTjkF6WWYRaVd1sc0s5aCE2p+TZ/2
 /kmNxt7cb7WjQEO6AmLGoHmIn8c9ILupmwdOINgotMhnScC1B6AGbXQBgzzhtNZOShlIIwVaK
 ctvydi57dl448kZ2hoq32ypVAjnSXvLMZ+F/sf1fu7R1WU+7N7UjwQvQv9+dpz73uygZxjGmX
 fp+TitpyUJtZNp8cgaU3Z5NQbmH7aiTekpHn64Gji2liEbN02xzpExBvPHVhl00lvo/+72aZ0
 gh8j/f1cwzCZyVcq5Q7u9s/pmBh89nTQsCkKfqcUKV3DmPPwPH5NMbGXDIA/Fdxvh4Y+ppP2E
 oTW3H2KL0T62iemGAi93TMckro4twQaaSazf6fmoD/Gez9JZQMM/3pNx5eH6Xvt0xQJrthaHB
 Np+g3XPreWusvR2w9Jbzuy2tX4Nkl7t0Cq1bb9Lo/v5GepJg+TmTUH9gLJ+u6fz4YrOEEB9m4
 Hsp0n7vA7QB1vzCvI+oNKpoRfgHWB5w2WF3kMSP6ZqlagpHWxLOEx7MApv9fp+tbX0Wh5oVdm
 JoKGfnWx6KYQjVvw9KG3c8qFnU8PQgos2OiqJ5U77qnERoDgIdoGeXSGDwlGvyzGROZd7GfAX
 qqClDOTgK+iT24NXk1+N+Wy4ajMU5MipYRnXDqpAxFXxceG+aFSiOhTwN3FcNE1vfFi6oQL3/
 qfNt563B0cwkWEccOFlyaJ2tF2VmpSoaD6gKGKAzUyJWIkSULwCkqe9sAlAVauLEr5E1Qs/cQ
 VaDzMp4T9tEKRb2TdI2IF8e/wPkgCkxk4up1RNV81X1Y2RpMSumjYWK3MKawaCM2rYd3/Iek+
 hV+jtbyMlB0WITbBACjz9vR5fkMt0NN2o0mpdCVlgCihYEXn/iq6kYeW2WGhBL2der3j0+bn+
 JafMSRi8QRLaApIIYEvfYWKXwQdr7xV8IY3sGYKjnMljRHIlDZFvuArre6DBZJTmBw9BgV53l
 YAZNS8b0r6KfJGoltc5CCjQuP9hBVFK3OUHW/X45jophLqSj+D+Fp5kTVwRP4422mFZQUI2Bq
 w4RPbZtG1VE4LB/TsHowDOfWl2QarzNdaXlgluRBkvqlz3VqKOupljnFbGZWUFhHvPwH1pIdZ
 HyUa0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=MgqHZNMp;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 07.08.19 09:55, 'Lokesh Vutla' via Jailhouse wrote:
> This series adds support for SMMUv3. Stream IDs have been added to the
> cell config and they need to be specified in the config before a cell
> can use a stream.
>
> The SMMU driver exposes an emulated SMMU to the guests cells by trapping
> access to the MMIO registers. This is not emulation in the sense that we
> fully emulate the device top to bottom. The emulation is used to provide an
> interface to the SMMU that the hypervisor can control to make sure the
> inmates are not doing anything they should not. The actual translations
> are done by hardware.
>
> The IOMMU definition has been generalised. The AMD and Intel IOMMU
> drivers have been updated to use this definition. I am not very familiar
> with these drivers, so please do take a look to make sure the changes
> are correct and don't create any unwanted problems.
>
> Limitations are mentioned in the 5th patch and work left in the 6th
> patch.
>
>
> Changes since v4:
> - Start the IOMMU #define values with 1
> - Dropped a redundant if check in iommu_count_units
> - Added mmio_register_unmap in smmuv3_cell_exit
>
> Lokesh Vutla (1):
>    arm64: iommu: smmu-v3: Add support for smmu v3 configuration from
>      config files
>
> Nikhil Devshatwar (3):
>    iommu: x86: Generalize iommu definition
>    arm-common: Introduce iommu functionality
>    core: Add stream id list in the cell config
>
> Pratyush Yadav (2):
>    arm64: iommu: smmu-v3: Add data structure initialization and stage 2
>      for SMMUv3
>    arm64: iommu: smmu-v3: Add support for stage 1 translations
>
>   configs/x86/f2a88xm-hd3.c                     |    1 +
>   configs/x86/qemu-x86.c                        |    1 +
>   hypervisor/arch/arm-common/Kbuild             |    2 +-
>   hypervisor/arch/arm-common/control.c          |    2 +
>   hypervisor/arch/arm-common/include/asm/cell.h |    4 +
>   .../arch/arm-common/include/asm/iommu.h       |   36 +
>   hypervisor/arch/arm-common/iommu.c            |   44 +
>   hypervisor/arch/arm-common/mmu_cell.c         |   20 +-
>   hypervisor/arch/arm64/Kbuild                  |    2 +-
>   hypervisor/arch/arm64/smmu-v3.c               | 1999 +++++++++++++++++
>   hypervisor/arch/x86/amd_iommu.c               |    9 +-
>   hypervisor/arch/x86/vtd.c                     |    2 +
>   include/jailhouse/cell-config.h               |   23 +-
>   pyjailhouse/sysfs_parser.py                   |    3 +
>   tools/jailhouse-cell-linux                    |    5 +-
>   tools/jailhouse-hardware-check                |    2 +-
>   tools/root-cell-config.c.tmpl                 |    1 +
>   17 files changed, 2142 insertions(+), 14 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
>   create mode 100644 hypervisor/arch/arm-common/iommu.c
>   create mode 100644 hypervisor/arch/arm64/smmu-v3.c
>

Thanks, updated next with patches 1..5.

I still consider 6 too heavy & risky without a noteworthy use cases. You are
migrating the Linux root cell SMMU usage, right? Is booting without that support
tricky or problematic?

Then, what's the status of MSI remapping? Is this supported by your target
hardware? Or are we just dealing with hard-wired SPIs? If we had a gap here, I
would consider that more important than 2-stage SMMU.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e014b47-3eca-68c3-0b9c-3eb5d3265af0%40web.de.
