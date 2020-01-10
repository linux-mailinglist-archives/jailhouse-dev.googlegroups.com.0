Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPPP4HYAKGQEIIBUZHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8056E136D73
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 14:10:21 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id n18sf1187978edo.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Jan 2020 05:10:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578661821; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZxRoxnD35f1JrrPkOXiM5aNCWLrn6I753TOivkLkjoB0FYPvSnwrtWixJfHAEGStt4
         eyWRv2uJRmBeceCJb+gTFDA18LnU+8U01kPTL8I5VQd/zGAVu9rTVNrHHbSFQXFo7kyo
         IjhZKIq6PgEVJwmwtWprw9yEpcBMelg1a2hri0GMV4/yj8CvVkNNV5suuJUX2zRKvWhw
         s4S8OaTnvOIylPdTYfIHFfNN2KGWCx3D6f9qH8TKEhbCCRz4jY5Z1T6IZSe8XT2717QK
         l4GuuXdNi8urTkGDxyXwxnLjJLDGXedeBVinsA4V2MXw8KQ+C0l6E5naT1589WakA6Fe
         HYLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=L455jhZy9bjohi08QiEMTXYygDMkxzZzqoA4SPUfF0M=;
        b=ZT4pBka56voKtRpXgfmkMrahRXsOfN1gYGG/Zvk+BzgIf7Nalsz6qKyuM0cCAJx/bp
         iF8+5varHXuA8xdVqZdyztCBb/V1J/d3NW1PvusQbt6aGWsA7yWWrDkE3BHJdQH2DncB
         VHWemjmXUepxHj3qXy1K7Oslc3/SSghfzjpoyVL2Swq+rfYRBuW3t4iySdujjAmsHgHE
         6E23VDSVRLZFzzZDlMsArWywhGqiDPmqIdhDxVtSV/z0AK63CaIoUNIaTamV75OBGMYS
         Jy5qkMh0kOYqKxp0rpDnbCtRTYv9CS7o/qWE4s1Q3SjpMwuyCICYMP1nBrtbSBjFzMjP
         abVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L455jhZy9bjohi08QiEMTXYygDMkxzZzqoA4SPUfF0M=;
        b=CZaBBGTlk7sloRDFtJdwCiMXh6539HkMQWatju+aP3bSk5wymEMzcQ5dXT0vK8d8QQ
         IRGc4by7bLphhrtLhuC+tO27AHwswiCdkShUoUlEeQUzoQJZ5J+8cYHbess7xQuOtNnj
         NiOsa8iHRGflHWZ94f8QQz2T1XVTBbBaVXtUepKh4jax9MkaM1DlIW4wIOk7hn9QJiZQ
         YRoSe/IHDjfw4OCy0JDaczlXZfDBKRllGPc0SQRP4UP2vqLL7+dz1B4l1+FbZ2GxmGtr
         ZWaIMqrGGdmAWqBv1EDSEQ9+B8qvWiOjEAYx/kbujk4BuvfoKuP/U3OZwevYKG/WUwTI
         hUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L455jhZy9bjohi08QiEMTXYygDMkxzZzqoA4SPUfF0M=;
        b=I/O6zj3uRr5aDvtA1r9z4qyLeZiM1mWQb24u+aw8oo+rp4mkgWsJnrgbL3HGo68B9I
         AR7r255yYIiqmoBqRl7HQ5oEr9c3pNkr3uRgg22Rni3VZZhS4Yixv28tHEAitLUJx+Pu
         dWhhYXxgtSzJxoo8hzz1sWolQnYs+oF9bPltVP3l11dK0ZnEbTRkhnBtmrSEH7gM4ZyC
         tXBg0BfHs2La/7bvfLl/7rfIMTEaxXf1zKDK/iKpmARhlRYhnSQ33AHqHb/lqN8Oqgko
         5bKKDzmacoTj93bDBDUMmxF83N9Tnwk/3kFY4hDAPrf9YEolC5JgOZf/IDWCRLt/SYjp
         5SnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkWCqMn+K1z7EXo18G3xVEoadlmqeUNx/vN3aF4/ZhrwVEx/PQ
	3ggxJJkNC0P+Z1PWrXqL33U=
X-Google-Smtp-Source: APXvYqzwqglpvz3YFOsZ9KDHxH7Y9MjjK2Aq6pEaFJfiswnGo47asHGNVAvLoqazhrYr2Qj/6LJv6g==
X-Received: by 2002:a50:fd11:: with SMTP id i17mr3433403eds.249.1578661821215;
        Fri, 10 Jan 2020 05:10:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cd1b:: with SMTP id oz27ls1471451ejb.4.gmail; Fri,
 10 Jan 2020 05:10:20 -0800 (PST)
X-Received: by 2002:a17:906:2acb:: with SMTP id m11mr3201687eje.180.1578661820471;
        Fri, 10 Jan 2020 05:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578661820; cv=none;
        d=google.com; s=arc-20160816;
        b=Re/Ksq07gZDJHTw/wrtA5xU2uJfdJ6AxbLW88CG2ESdaVyhALwlR1/7RYo2hkkdTB2
         /m/1KJ/KsCSnFmZzh3lXQCo909SVTG/xvB8BNccoUHEiQoadyK91QREZkgHnUNp36keZ
         MJUS7pFysSxb0Y2S5YqjwyTEZf7T5i6et58XvTMKFAWvJmi1X7Klgp9RVHEZlP+jktGV
         59gBGLRW6RTUhvm+XgRIyZyAiz4pxFKqRXzTiMO1c660vq19uC1geB6bqfMMSOoXb4Vy
         FBSJ3iu478Yo/Ic16KrPrU4Z4st4qKsAZ8vPfov51ChG+m0LkQbCxfKXjn8ur9lgzBBd
         baQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=huP06kCFqc3yV+asONOig0aFPzlhZWGdeegZkXnE91c=;
        b=bmA+yjYnMDgpIWnWdmqEhKcgCayoQwXmbLULh4ccbrMmEAs4Gsr9C55jOwQABeReei
         NWBNOIMntPhDTXbdOFDllWiJ/DT5uYnqfu+Lj5zDvFsN62StJpALDe3ArvST5F9aUIhs
         IAjm89+D9jYWeuE3PE3b9WpYTaf0+qhdxalxKu5MN1oyDglKO7pOBt8ifPhUQzbPwJA+
         W2SrR0RYLHBdZmzJ1zA8hHAghV/E0CBGFnMmpGo4AYxpt8oaLlSTIUsZzwYdaT9CYE3v
         2EeIYNulOw6rwg2O7ABUuBGaU20wKk9rkEpT4Vr1llBJYm8LqDXZz0hRvMwJAUTKRolM
         1V7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id n21si78329eja.0.2020.01.10.05.10.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jan 2020 05:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00ADAJ4s014042
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2020 14:10:20 +0100
Received: from [139.23.73.193] ([139.23.73.193])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00ADAJXj006250;
	Fri, 10 Jan 2020 14:10:19 +0100
Subject: Re: [PATCH v2 0/5] Add support for Texas Instrument's Peripheral
 Virtualization Unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
References: <20200108111825.14280-1-nikhil.nd@ti.com>
 <b562f103-dbab-bd55-728b-18f51ba2c710@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4e65460e-846e-5b1b-6991-7169a9687af7@siemens.com>
Date: Fri, 10 Jan 2020 14:10:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b562f103-dbab-bd55-728b-18f51ba2c710@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 10.01.20 10:20, Nikhil Devshatwar wrote:
> ping

In my backlog queue, but that is long ATM, sorry.

Jan

> 
> Nikhil D
> 
> On 08/01/20 4:48 pm, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar<nikhil.nd@ti.com>
>>
>> This series adds support for TI PVU as an iommu unit.
>> PVU is a 2nd stage only IOMMU which provides realtime address translation.
>>
>> J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
>> when running inside a virtual machine.
>>
>> Changes from v1:
>> * New patch1 for avoiding warning when unmap is called from cell_destroy
>> * Split the patch affecting amd fields into separate one
>> * SMMU fixes are sent in another series
>>
>> Nikhil Devshatwar (5):
>>    core: Update cell_state while destroying the cell
>>    configs: Introduce tipvu IOMMU specific fields in platform_data
>>    arm64: ti-pvu: Add support for ti-pvu iommu unit
>>    configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
>>    configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU
>>
>>   configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
>>   configs/arm64/k3-j721e-evm.c                  |  36 ++
>>   hypervisor/arch/arm-common/include/asm/cell.h |   7 +
>>   .../arch/arm-common/include/asm/iommu.h       |   1 +
>>   .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
>>   hypervisor/arch/arm-common/iommu.c            |   5 +-
>>   hypervisor/arch/arm64/Kbuild                  |   3 +-
>>   hypervisor/arch/arm64/ti-pvu.c                | 581 ++++++++++++++++++
>>   hypervisor/control.c                          |   2 +
>>   include/jailhouse/cell-config.h               |  17 +-
>>   10 files changed, 781 insertions(+), 7 deletions(-)
>>   create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
>>   create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>>
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4e65460e-846e-5b1b-6991-7169a9687af7%40siemens.com.
