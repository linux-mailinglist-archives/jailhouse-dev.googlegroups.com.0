Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBDGYZPYAKGQETP6F6RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D9130E79
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 09:13:02 +0100 (CET)
Received: by mail-io1-xd3f.google.com with SMTP id x10sf6450420iob.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 00:13:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578298381; cv=pass;
        d=google.com; s=arc-20160816;
        b=MqWWUYTyQ9WZBjaixlvsdxExTPeQQ7HfZDVqEcsoxM9k1HNtq7/iPXLomsiKxg3JkL
         thiAd9/CYEWk2BBXxSnp99RHDaXLAaciR3vhG5GKVP1Dp+CdST//HncNhjVHdsKLiUKW
         zRzD4SLHTuIyVTCMz8Sq3ncxojId75ZSG6Hicl6PHq6rpJN8rM139PWe8tO3T27rSGBk
         2qLaSk2ay9q9W7KMEGKMkEbvOqR3y+DYxuzLMj39L0yuZxYqHJKKaq/cNWCIntbxp5zD
         MluR5y2DsJFAR6t0MmFvmDjz0TIN+Bomsn+Ku5GM7fYGfOiO6rhNTCKh44TQse8m94Ab
         Gj0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=YdcfJZ0lPMjRBAzB0TXrsS7JWWqiiBAmhjdYgQj22rs=;
        b=jT6SN5+xTGuu93i7l90HHtbvfQ8m4lB5OO/XplhgJgHhpy3wHrqLjydG2bJQWKxiI4
         aGye3OXpMefGeYg+kknxX5jOBy+uFsQI/6OtuUA1hNFTAqRTaRF9Hcank3cdzoL/tQ3a
         D8ONArDPttggPP3aBOKslZ0Ph+XlaW2570V3Awa2z5NnZsHU2Qhn4PgHmvh8pR6sUfjj
         IAAJ2OTWVqhAu7HjcRNsRaAQd3ePTf3yG4wO5YOW3BLRVDdntiAKDfG2omivXRpQ6tAz
         RVg903zSu4yhZ7GWXt3ywXDmjEdEeSEj+Yvlj+eRjMosH7dpDiXBmVApe7ZMZotAGl06
         dIFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZO0GF+zj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=YdcfJZ0lPMjRBAzB0TXrsS7JWWqiiBAmhjdYgQj22rs=;
        b=Ulxb3EP6XZhIpzAJlRAHvRkbuOzE4FW5x8IpxYkPdNLO0I8KfLqdDXRHcxbzsR26rf
         ZFLrQt1jOcRwyjq2C7+BkOq/jt0niJ+OhOWUPhTuiAiPNCKsAeYOkpcJOCyjukqszpfO
         GkVVPf9HutyXH4UNt+rKh2yIgT/a5zxjUBxzj8Bg1GpWpvVhpxocVv7KfiN80fMUW72y
         51uzyb0Ydt4JpyQcKJsU6brOjWDy0eyWmzCfK4fyCTNHBxHhOoTcO9xO5BA3eBzMby2E
         hi9hbNNLN1cDhnSh4OugRBwCcqs/yQRh3tuQN/VJrgn/1qzvUxLKyehGOy0KORtKVreY
         7ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YdcfJZ0lPMjRBAzB0TXrsS7JWWqiiBAmhjdYgQj22rs=;
        b=VoRY6MhpH7USeT3oT2U9on+/qItTfieXjhKffx/7fEoqtTioI6Ms/TKhZhsfPNruiM
         ahYFj5LeL6BwvUuxlaIRFk+MjhPzGgdbdXNnBfrtND9yJby+iAc4Fp/q4btBKgeK4Mt3
         RM4Z9Rx8V6Uy1w8TNyvl2z/9L4GRUO+4UjCr7FcoPFUlQXHSyEhl3UyDTGSJHIVobZp3
         eYWL21FAtn18tCscDhkeCyJa5hLMVAqLvZ7Z2kz+1p6GFfY5Y+cnk5wqloNg74fvTpY7
         pchMl5hcvGBgzv3t8U72BAPHL3l704GX3dejXUEcOd+ibzLje0HUyouALXN6jQZSWYQo
         PoeQ==
X-Gm-Message-State: APjAAAU0aH7oc5542bMcaJF0phjiPD6SWGZjEMbBxSNT9VclZ3D5EFU7
	ZgBp7bCx1TSZE818hxd3p9w=
X-Google-Smtp-Source: APXvYqwwA/gLwSYZfKv22qWGFxekmGsbLGqPamvC475BYRDyaUiANn9K/xauIPqo0BQIaWziKd71ZA==
X-Received: by 2002:a6b:710f:: with SMTP id q15mr68773581iog.103.1578298381176;
        Mon, 06 Jan 2020 00:13:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:1504:: with SMTP id v4ls7666531ilk.16.gmail; Mon, 06 Jan
 2020 00:13:00 -0800 (PST)
X-Received: by 2002:a92:d344:: with SMTP id a4mr85059196ilh.303.1578298380608;
        Mon, 06 Jan 2020 00:13:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578298380; cv=none;
        d=google.com; s=arc-20160816;
        b=X6MfkekTWnhvjOwWHCQjDGJArxC4dztciG4X9OX/xinIamKTG5CeVZbpTUU6tMZwWo
         rzAWsOGp2qj/44TneWMmSoaFKop4Y6Aejf1d3BVJc4rn8ox2EwhYzqT7hNNfmaKknBLw
         7jS6yHZZgRFlHuBQaCsH21r1jeUU+6zy292i1rLUXho0mG7d93wveVCAoqvKK0T5nWDF
         Df5zVW/6Tj+PZH6dYuHLiVd8SzU9ZojzCmxfZvu7GcsKTYRvCu/G41FCmmsO91sLrO4M
         +wLuobFog92l3xGC9ljj0zKbwygEWr+v8zSbJflc3HKg4zMOrm2VezSHb0+DcYi/0/PA
         50zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=wZ0jQyeY4Y9RpaPhoIXeknJasVxAiHgts1pn6h8w0Oo=;
        b=TH3hjZcDafL+xqgqbc1xmQu2O+i5poSL+ywHBNmxIm0aWY20fPODghPfFGDMiG6pz+
         Se49ngosAsdxZPYkluGrQfLDsrON24vbGAWmM//3Vrh/UJq4kZtf6dzY5dKESwMcN1Mt
         py4zVxo/74X/0CVx9GnO6j8OCKDmyIZOqtWvQmuJDJtGROdvAn6qjoy6uCqBUR8lwLG4
         2vpAqePf1SahD+7Gd1KzPCGgG5mpN9mKNsYyKYrKcoBFm9m65CsZIECvOpWWGcRete7B
         b8dC2ICsEX06tzNS3NxmjX3oQsXlTiWuf8KZgQpmwbjkkeGgTKSiHinpco+lPwV+USCl
         cQNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZO0GF+zj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id z20si2638018ill.5.2020.01.06.00.13.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 00:13:00 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0068D0wx059462;
	Mon, 6 Jan 2020 02:13:00 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0068D0r2067089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2020 02:13:00 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 02:12:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 02:12:59 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0068CvxI096833;
	Mon, 6 Jan 2020 02:12:58 -0600
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
Date: Mon, 6 Jan 2020 13:42:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
Content-Type: multipart/alternative;
	boundary="------------C05FAAE4931319D8384080A8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ZO0GF+zj;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------C05FAAE4931319D8384080A8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 03/01/20 10:22 pm, Jan Kiszka wrote:
> Please make sure a "From:" line is at the top so that I don't have to
> add that manually. git will add that line when you set a different
> --from when calling format-patch.
Sure, This time i used git format-patch ..... -4 to format, annotate and=20
send directly.
will check why the from: line is missing
>
> On 30.12.19 14:24, 'Nikhil Devshatwar' via Jailhouse wrote:
>> Add support for Texas Instrument's Peripheral Virtualization Unit
>> * Define a new IOMMU type and extra fields in the platform_data
>> * Add new cofig option CONFIG_IOMMU_TI_PVU
>> * Integrate with the arm iommu support such that multiple types
>> =C2=A0=C2=A0 of IOMMU can be supported.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 7 +
>> =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 32 +
>> =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>> =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 556 +++++++++++=
+++++++
>> =C2=A0 hypervisor/arch/arm64/ti-pvu_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 141 +++++
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0 8 files changed, 751 insertions(+)
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.=
h
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu_priv.h
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/cell.h=20
>> b/hypervisor/arch/arm-common/include/asm/cell.h
>> index 5b1e4207..9c6e8c6f 100644
>> --- a/hypervisor/arch/arm-common/include/asm/cell.h
>> +++ b/hypervisor/arch/arm-common/include/asm/cell.h
>> @@ -15,10 +15,17 @@
>>
>> =C2=A0 #include <jailhouse/paging.h>
>>
>> +struct pvu_tlb_entry;
>> +
>> =C2=A0 struct arch_cell {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct paging_structures mm;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 irq_bitmap[1024/32];
>> +
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 ent_count;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *entrie=
s;
>> +=C2=A0=C2=A0=C2=A0 } iommu_pvu; /**< ARM PVU specific fields. */
>> =C2=A0 };
>>
>> =C2=A0 #endif /* !_JAILHOUSE_ASM_CELL_H */
>> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h=20
>> b/hypervisor/arch/arm-common/include/asm/iommu.h
>> index dde762c0..399248dc 100644
>> --- a/hypervisor/arch/arm-common/include/asm/iommu.h
>> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
>> @@ -16,6 +16,7 @@
>> =C2=A0 #include <jailhouse/cell.h>
>> =C2=A0 #include <jailhouse/utils.h>
>> =C2=A0 #include <jailhouse/cell-config.h>
>> +#include <asm/ti-pvu.h>
>>
>> =C2=A0 #define for_each_stream_id(sid, config, counter)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ((sid) =3D (jailhouse_cell_stream_ids=
(config)[0]), (counter)=20
>> =3D 0;=C2=A0=C2=A0=C2=A0 \
>> diff --git a/hypervisor/arch/arm-common/include/asm/ti-pvu.h=20
>> b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
>> new file mode 100644
>> index 00000000..a3ef72f7
>> --- /dev/null
>> +++ b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
>> @@ -0,0 +1,32 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2018 Texas Instruments Incorporated -=20
>> http://www.ti.com/
>> + *
>> + * TI PVU IOMMU unit API headers
>> + *
>> + * Authors:
>> + *=C2=A0 Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0=20
>> See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef _IOMMMU_PVU_H_
>> +#define _IOMMMU_PVU_H_
>
> Re-inclusion protection should only be added when actually needed.
>
Got it
>> +
>> +#include <jailhouse/config.h>
>> +
>> +#ifdef CONFIG_IOMMU_TI_PVU
>
> Can we try to model this without a compile-time switch?
>
Only reason I put a config is because this applies only to one platform.
Will remove this in v2

>> +
>> +int pvu_iommu_map_memory(struct cell *cell,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_memor=
y *mem);
>> +
>> +int pvu_iommu_unmap_memory(struct cell *cell,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_memor=
y *mem);
>> +
>> +int pvu_iommu_config_commit(struct cell *cell);
>> +
>> +#endif /* CONFIG_IOMMU_TI_PVU */
>> +
>> +#endif /* _IOMMMU_PVU_H_ */
>> diff --git a/hypervisor/arch/arm-common/iommu.c=20
>> b/hypervisor/arch/arm-common/iommu.c
>> index b3100d03..b6b61f52 100644
>> --- a/hypervisor/arch/arm-common/iommu.c
>> +++ b/hypervisor/arch/arm-common/iommu.c
>> @@ -26,15 +26,24 @@ unsigned int iommu_count_units(void)
>> =C2=A0 int iommu_map_memory_region(struct cell *cell,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_memory *mem)
>> =C2=A0 {
>> +#ifdef CONFIG_IOMMU_TI_PVU
>> +=C2=A0=C2=A0=C2=A0 return pvu_iommu_map_memory(cell, mem);
>> +#endif
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> =C2=A0 int iommu_unmap_memory_region(struct cell *cell,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_memory *m=
em)
>> =C2=A0 {
>> +#ifdef CONFIG_IOMMU_TI_PVU
>> +=C2=A0=C2=A0=C2=A0 return pvu_iommu_unmap_memory(cell, mem);
>> +#endif
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> =C2=A0 void iommu_config_commit(struct cell *cell)
>> =C2=A0 {
>> +#ifdef CONFIG_IOMMU_TI_PVU
>> +=C2=A0=C2=A0=C2=A0 pvu_iommu_config_commit(cell);
>> +#endif
>> =C2=A0 }
>> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
>> index 323b78b6..8012c46e 100644
>> --- a/hypervisor/arch/arm64/Kbuild
>> +++ b/hypervisor/arch/arm64/Kbuild
>> @@ -21,3 +21,4 @@ always :=3D lib.a
>>
>> =C2=A0 lib-y :=3D $(common-objs-y)
>> =C2=A0 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o tra=
ps.o=20
>> smmu-v3.o
>> +lib-$(CONFIG_IOMMU_TI_PVU) +=3D ti-pvu.o
>> diff --git a/hypervisor/arch/arm64/ti-pvu.c=20
>> b/hypervisor/arch/arm64/ti-pvu.c
>> new file mode 100644
>> index 00000000..02380baa
>> --- /dev/null
>> +++ b/hypervisor/arch/arm64/ti-pvu.c
>> @@ -0,0 +1,556 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) 2018 Texas Instruments Incorporated -=20
>> http://www.ti.com/
>> + *
>> + * TI PVU IOMMU unit
>> + *
>> + * Peripheral Virtualization Unit(PVU) is an IOMMU (memory management
>> + * unit for DMA) which is designed for 2nd stage address translation=20
>> in a
>> + * real time manner.
>> + *
>> + * Unlike ARM-SMMU, all the memory mapping information is stored in the
>> + * local registers instead of the in-memory page tables.
>> + *
>> + * There are limitations on the number of available contexts, page=20
>> sizes,
>> + * number of pages that can be mapped, etc.
>> + *
>> + * PVU is desgined to be programmed with all the memory mapping at=20
>> once.
>> + * Therefore, it defers the actual register programming till=20
>> config_commit.
>> + * Also, it does not support unmapping of the pages at runtime.
>> + *
>> + * Authors:
>> + *=C2=A0 Nikhil Devshatwar <nikhil.nd@ti.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0=20
>> See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include <jailhouse/unit.h>
>> +#include <jailhouse/cell.h>
>> +#include <jailhouse/entry.h>
>> +#include <jailhouse/paging.h>
>> +#include <jailhouse/control.h>
>> +#include <jailhouse/printk.h>
>> +#include <asm/iommu.h>
>> +#include <asm/ti-pvu.h>
>> +#include "ti-pvu_priv.h"
>
> Single-user header - let's fold this in.
alright
>
>> +
>> +#define MAX_PVU_ENTRIES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (PAGE=
_SIZE / sizeof (struct=20
>> pvu_tlb_entry))
>> +#define MAX_VIRTID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 7
>> +
>> +static struct pvu_dev pvu_units[JAILHOUSE_MAX_IOMMU_UNITS];
>> +static unsigned int pvu_count;
>> +
>> +static const u64 PVU_PAGE_SIZE_BYTES[] =3D {
>
> This is not a macro or define, so let's decapitalize its name.
will do
>
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_4K]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0=C2=A0 4 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_16K]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0 16 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_64K]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0 64 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_2M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0=C2=A0 2 * 1024 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_32M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0 32 * 1024 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_512M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 512 * 1024 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_1G]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0=C2=A0 1 * 1024 * 1024 * 1024,
>> +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_16G]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D=C2=A0 16ULL * 1024 * 1024 * 1024,
>
> Is there another use case the LPAE_PAGE_SZ constants in sight?
> Otherwise, I would simply fill the array in the right order with the
> actual values.
>
will do
>> +};
>> +
>> +static inline u32 is_aligned(u64 addr, u64 size)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return (addr % size) =3D=3D 0;
>> +}
>> +
>> +static void pvu_tlb_enable(struct pvu_dev *dev, u16 tlbnum)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>> +
>> +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>> +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK=
, 0);
>> +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 1);
>> +}
>> +
>> +static void pvu_tlb_disable(struct pvu_dev *dev, u16 tlbnum)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>> +
>> +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>> +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_EN_MASK, 0);
>> +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_LOG_DIS_MASK=
, 1);
>> +}
>> +
>> +static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>> +
>> +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>> +=C2=A0=C2=A0=C2=A0 if (mmio_read32_field(&tlb->chain, PVU_TLB_EN_MASK))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16 tlb_next)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (tlb_next <=3D tlbnum || tlb_next <=3D dev->max_v=
irtid)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>> +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&tlb->chain, PVU_TLB_CHAIN_MASK, =
tlb_next);
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
>> +
>> +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev->tlb_base + tlbnum;
>> +=C2=A0=C2=A0=C2=A0 return mmio_read32_field(&tlb->chain, PVU_TLB_CHAIN_=
MASK);
>> +}
>> +
>> +static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int i;
>
> Let's use an appropriate unsigned type here, e.g. unsigned int.
will review signedness of all variables and fix it
>
>> +
>> +=C2=A0=C2=A0=C2=A0 for (i =3D dev->max_virtid + 1; i < dev->num_tlbs; i=
++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev->tlb_data[i] =3D=3D =
0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev-=
>tlb_data[i] =3D virtid << dev->num_entries;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn i;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +

[snip]

>> +{
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>
> Huh!? But this breaks cell create/destroy cycles, without any user
> notice, no? And will root cell devices keep access to inmate memory that
> is carved out during cell creation?
>
> Is that a hardware limitation?
>
> Looks like a blocker...
Yes, this is a hardware limitation. I it designed for static partitioning.
Although, I made sure to not break memory isolatio with the following=20
workaround:

When booting a root cell for Jailhouse, you would typically carveout=C2=A0=
=20
memory for the
inmate cell. I have defined the cell configs such that, in the root cell=20
config, RAM region for inmate is
NOT marked with MEM_DMA, this way it never gets mapped in PVU.

When creating cell, root cell maps the inmate RAM loadable region, here=20
that memory is not
mapped in IO space.
---> Limitation of this is that you cannot DMA copy the images in the=20
loadable sections,
 =C2=A0=C2=A0 which we are not doing anyways

When destroying the cell, Jailhouse should map the memory back to the=20
root cell.
Here, again, the inmate RAM region gets ignored in IO mapping because of=20
lacking flag MEM_DMA

cell_create=C2=A0 and cell_destroy work in regression, tested successfully.


>
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +int pvu_iommu_config_commit(struct cell *cell)
>> +{=20

[snip]

>> +#define LPAE_PAGE_SZ_2M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 3
>> +#define LPAE_PAGE_SZ_32M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4
>> +#define LPAE_PAGE_SZ_512M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5
>> +#define LPAE_PAGE_SZ_1G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 6
>> +#define LPAE_PAGE_SZ_16G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7
>> +
>> +#define LPAE_PAGE_PERM_UR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 15)
>> +#define LPAE_PAGE_PERM_UW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 14)
>> +#define LPAE_PAGE_PERM_UX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 13)
>> +#define LPAE_PAGE_PERM_SR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 12)
>> +#define LPAE_PAGE_PERM_SW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 11)
>> +#define LPAE_PAGE_PERM_SX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 10)
>> +
>> +#define LPAE_PAGE_MEM_DEVICE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(0 << 8)
>> +#define LPAE_PAGE_MEM_WRITEBACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 << 8)
>
> These two are unused - accidentally?
>
Unused, will remove
>> +#define LPAE_PAGE_MEM_WRITETHROUGH=C2=A0=C2=A0=C2=A0 (2 << 8) > +
>> +#define LPAE_PAGE_PREFETCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1=
 << 6)
>> +#define LPAE_PAGE_INNER_SHARABLE=C2=A0=C2=A0=C2=A0 (1 << 5)
>
> These two as well. I would recommend adding only used constants.
will do
>
>> +#define LPAE_PAGE_OUTER_SHARABLE=C2=A0=C2=A0=C2=A0 (1 << 4)
>> +
>> +#define LPAE_PAGE_IS_NOALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(0 << 2)
>> +#define LPAE_PAGE_IS_WR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (1 << 2)
>> +#define LPAE_PAGE_IS_RD_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (2 << 2)
>> +#define LPAE_PAGE_IS_RDWR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (3 << 2)
>> +
>> +#define LPAE_PAGE_OS_NOALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(0 << 0)
>> +#define LPAE_PAGE_OS_WR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (1 << 0)
>> +#define LPAE_PAGE_OS_RD_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (2 << 0)
>> +#define LPAE_PAGE_OS_RDWR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (3 << 0)
>
> Here are some unused consts as well.
will remove
>
>> +
>> +struct pvu_hw_tlb_entry {
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg0;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg1;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg2;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg3;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg4;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg5;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg6;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg7;
>
> Do these regs really have no names? Can we use an array then?
Yes, the TRM actually has these names for the TLB entry

>
>> +};
>> +
>> +#define PVU_TLB_EN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (1 << 31)
>> +#define PVU_TLB_LOG_DIS_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(1 << 30)
>> +#define PVU_TLB_FAULT_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1=
 << 29)
>> +#define PVU_TLB_CHAIN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0=
xfff)
>> +
>> +struct pvu_hw_tlb {
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 chain;
>> +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 resv_32[28];
>> +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb_entry=C2=A0=C2=A0=C2=A0 entry[8];
>> +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 resv_4096[3808];
>> +};
>> +
>> +struct pvu_tlb_entry {
>> +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virt_a=
ddr;
>> +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_a=
ddr;
>> +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size;
>> +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags;
>> +};
>> +
>> +struct pvu_dev {
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *cfg_b=
ase;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *tlb_b=
ase;
>> +
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_tl=
bs;
>> +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_en=
tries;
>> +=C2=A0=C2=A0=C2=A0 u16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_vi=
rtid;
>> +
>> +=C2=A0=C2=A0=C2=A0 u16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlb_da=
ta[PVU_NUM_TLBS];
>> +};
>> +
>> +#endif /* __TI_PVU_PRIV_H__ */
>> diff --git a/include/jailhouse/cell-config.h=20
>> b/include/jailhouse/cell-config.h
>> index d435b9f7..9bb84492 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -203,6 +203,7 @@ struct jailhouse_pci_capability {
>> =C2=A0 #define JAILHOUSE_IOMMU_AMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1
>> =C2=A0 #define JAILHOUSE_IOMMU_INTEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 2
>> =C2=A0 #define JAILHOUSE_IOMMU_SMMUV3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 3
>> +#define JAILHOUSE_IOMMU_PVU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4
>>
>> =C2=A0 struct jailhouse_iommu {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 type;
>> @@ -213,6 +214,9 @@ struct jailhouse_iommu {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 amd_base_cap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 amd_msi_cap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 amd_features;
>> +
>> +=C2=A0=C2=A0=C2=A0 __u64 tipvu_tlb_base;
>> +=C2=A0=C2=A0=C2=A0 __u32 tipvu_tlb_size;
>
> Time to stick the amd fields in their own sub-struct, as well as the
> tipvu ones, and then put both struct into a union. Analogously to
> jailhouse_system.platform_info.
Agreed, I will do that.
>
>> =C2=A0 } __attribute__((packed));
>>
>> =C2=A0 struct jailhouse_pio {
>>
>
> Jan

Thanks for the review
Nikhil Devshatwar

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/22d04be0-c674-16a7-f36f-89f06419372c%40ti.com.

--------------C05FAAE4931319D8384080A8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 03/01/20 10:22 pm, Jan Kiszka wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">Please make
      sure a "From:" line is at the top so that I don't have to
      <br>
      add that manually. git will add that line when you set a different
      <br>
      --from when calling format-patch.
      <br>
    </blockquote>
    Sure, This time i used git format-patch ..... -4 to format, annotate
    and send directly.<br>
    will check why the from: line is missing<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      On 30.12.19 14:24, 'Nikhil Devshatwar' via Jailhouse wrote:
      <br>
      <blockquote type=3D"cite">Add support for Texas Instrument's
        Peripheral Virtualization Unit
        <br>
        * Define a new IOMMU type and extra fields in the platform_data
        <br>
        * Add new cofig option CONFIG_IOMMU_TI_PVU
        <br>
        * Integrate with the arm iommu support such that multiple types
        <br>
        =C2=A0=C2=A0 of IOMMU can be supported.
        <br>
        <br>
        Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0=C2=A0 =
7 +
        <br>
        =C2=A0 .../arch/arm-common/include/asm/iommu.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
        <br>
        =C2=A0 .../arch/arm-common/include/asm/ti-pvu.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 32 +
        <br>
        =C2=A0 hypervisor/arch/arm-common/iommu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
        <br>
        =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
        <br>
        =C2=A0 hypervisor/arch/arm64/ti-pvu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 556
        ++++++++++++++++++
        <br>
        =C2=A0 hypervisor/arch/arm64/ti-pvu_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 141 +++++
        <br>
        =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
        <br>
        =C2=A0 8 files changed, 751 insertions(+)
        <br>
        =C2=A0 create mode 100644
        hypervisor/arch/arm-common/include/asm/ti-pvu.h
        <br>
        =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu.c
        <br>
        =C2=A0 create mode 100644 hypervisor/arch/arm64/ti-pvu_priv.h
        <br>
        <br>
        diff --git a/hypervisor/arch/arm-common/include/asm/cell.h
        b/hypervisor/arch/arm-common/include/asm/cell.h
        <br>
        index 5b1e4207..9c6e8c6f 100644
        <br>
        --- a/hypervisor/arch/arm-common/include/asm/cell.h
        <br>
        +++ b/hypervisor/arch/arm-common/include/asm/cell.h
        <br>
        @@ -15,10 +15,17 @@
        <br>
        <br>
        =C2=A0 #include &lt;jailhouse/paging.h&gt;
        <br>
        <br>
        +struct pvu_tlb_entry;
        <br>
        +
        <br>
        =C2=A0 struct arch_cell {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct paging_structures mm;
        <br>
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 irq_bitmap[1024/32];
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 struct {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 ent_count;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_entry *e=
ntries;
        <br>
        +=C2=A0=C2=A0=C2=A0 } iommu_pvu; /**&lt; ARM PVU specific fields. *=
/
        <br>
        =C2=A0 };
        <br>
        <br>
        =C2=A0 #endif /* !_JAILHOUSE_ASM_CELL_H */
        <br>
        diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h
        b/hypervisor/arch/arm-common/include/asm/iommu.h
        <br>
        index dde762c0..399248dc 100644
        <br>
        --- a/hypervisor/arch/arm-common/include/asm/iommu.h
        <br>
        +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
        <br>
        @@ -16,6 +16,7 @@
        <br>
        =C2=A0 #include &lt;jailhouse/cell.h&gt;
        <br>
        =C2=A0 #include &lt;jailhouse/utils.h&gt;
        <br>
        =C2=A0 #include &lt;jailhouse/cell-config.h&gt;
        <br>
        +#include &lt;asm/ti-pvu.h&gt;
        <br>
        <br>
        =C2=A0 #define for_each_stream_id(sid, config,
        counter)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for ((sid) =3D (jailhouse_cell_strea=
m_ids(config)[0]),
        (counter) =3D 0;=C2=A0=C2=A0=C2=A0 \
        <br>
        diff --git a/hypervisor/arch/arm-common/include/asm/ti-pvu.h
        b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
        <br>
        new file mode 100644
        <br>
        index 00000000..a3ef72f7
        <br>
        --- /dev/null
        <br>
        +++ b/hypervisor/arch/arm-common/include/asm/ti-pvu.h
        <br>
        @@ -0,0 +1,32 @@
        <br>
        +/*
        <br>
        + * Jailhouse, a Linux-based partitioning hypervisor
        <br>
        + *
        <br>
        + * Copyright (c) 2018 Texas Instruments Incorporated -
        <a class=3D"moz-txt-link-freetext" href=3D"http://www.ti.com/">http=
://www.ti.com/</a>
        <br>
        + *
        <br>
        + * TI PVU IOMMU unit API headers
        <br>
        + *
        <br>
        + * Authors:
        <br>
        + *=C2=A0 Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
        <br>
        + *
        <br>
        + * This work is licensed under the terms of the GNU GPL,
        version 2.=C2=A0 See
        <br>
        + * the COPYING file in the top-level directory.
        <br>
        + */
        <br>
        +
        <br>
        +#ifndef _IOMMMU_PVU_H_
        <br>
        +#define _IOMMMU_PVU_H_
        <br>
      </blockquote>
      <br>
      Re-inclusion protection should only be added when actually needed.
      <br>
      <br>
    </blockquote>
    Got it<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+
        <br>
        +#include &lt;jailhouse/config.h&gt;
        <br>
        +
        <br>
        +#ifdef CONFIG_IOMMU_TI_PVU
        <br>
      </blockquote>
      <br>
      Can we try to model this without a compile-time switch?
      <br>
      <br>
    </blockquote>
    Only reason I put a config is because this applies only to one
    platform.<br>
    Will remove this in v2<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+
        <br>
        +int pvu_iommu_map_memory(struct cell *cell,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_=
memory *mem);
        <br>
        +
        <br>
        +int pvu_iommu_unmap_memory(struct cell *cell,
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_=
memory *mem);
        <br>
        +
        <br>
        +int pvu_iommu_config_commit(struct cell *cell);
        <br>
        +
        <br>
        +#endif /* CONFIG_IOMMU_TI_PVU */
        <br>
        +
        <br>
        +#endif /* _IOMMMU_PVU_H_ */
        <br>
        diff --git a/hypervisor/arch/arm-common/iommu.c
        b/hypervisor/arch/arm-common/iommu.c
        <br>
        index b3100d03..b6b61f52 100644
        <br>
        --- a/hypervisor/arch/arm-common/iommu.c
        <br>
        +++ b/hypervisor/arch/arm-common/iommu.c
        <br>
        @@ -26,15 +26,24 @@ unsigned int iommu_count_units(void)
        <br>
        =C2=A0 int iommu_map_memory_region(struct cell *cell,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_memory *mem)
        <br>
        =C2=A0 {
        <br>
        +#ifdef CONFIG_IOMMU_TI_PVU
        <br>
        +=C2=A0=C2=A0=C2=A0 return pvu_iommu_map_memory(cell, mem);
        <br>
        +#endif
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
        <br>
        =C2=A0 }
        <br>
        <br>
        =C2=A0 int iommu_unmap_memory_region(struct cell *cell,
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct jailhouse_mem=
ory *mem)
        <br>
        =C2=A0 {
        <br>
        +#ifdef CONFIG_IOMMU_TI_PVU
        <br>
        +=C2=A0=C2=A0=C2=A0 return pvu_iommu_unmap_memory(cell, mem);
        <br>
        +#endif
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
        <br>
        =C2=A0 }
        <br>
        <br>
        =C2=A0 void iommu_config_commit(struct cell *cell)
        <br>
        =C2=A0 {
        <br>
        +#ifdef CONFIG_IOMMU_TI_PVU
        <br>
        +=C2=A0=C2=A0=C2=A0 pvu_iommu_config_commit(cell);
        <br>
        +#endif
        <br>
        =C2=A0 }
        <br>
        diff --git a/hypervisor/arch/arm64/Kbuild
        b/hypervisor/arch/arm64/Kbuild
        <br>
        index 323b78b6..8012c46e 100644
        <br>
        --- a/hypervisor/arch/arm64/Kbuild
        <br>
        +++ b/hypervisor/arch/arm64/Kbuild
        <br>
        @@ -21,3 +21,4 @@ always :=3D lib.a
        <br>
        <br>
        =C2=A0 lib-y :=3D $(common-objs-y)
        <br>
        =C2=A0 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.=
o
        traps.o smmu-v3.o
        <br>
        +lib-$(CONFIG_IOMMU_TI_PVU) +=3D ti-pvu.o
        <br>
        diff --git a/hypervisor/arch/arm64/ti-pvu.c
        b/hypervisor/arch/arm64/ti-pvu.c
        <br>
        new file mode 100644
        <br>
        index 00000000..02380baa
        <br>
        --- /dev/null
        <br>
        +++ b/hypervisor/arch/arm64/ti-pvu.c
        <br>
        @@ -0,0 +1,556 @@
        <br>
        +/*
        <br>
        + * Jailhouse, a Linux-based partitioning hypervisor
        <br>
        + *
        <br>
        + * Copyright (c) 2018 Texas Instruments Incorporated -
        <a class=3D"moz-txt-link-freetext" href=3D"http://www.ti.com/">http=
://www.ti.com/</a>
        <br>
        + *
        <br>
        + * TI PVU IOMMU unit
        <br>
        + *
        <br>
        + * Peripheral Virtualization Unit(PVU) is an IOMMU (memory
        management
        <br>
        + * unit for DMA) which is designed for 2nd stage address
        translation in a
        <br>
        + * real time manner.
        <br>
        + *
        <br>
        + * Unlike ARM-SMMU, all the memory mapping information is
        stored in the
        <br>
        + * local registers instead of the in-memory page tables.
        <br>
        + *
        <br>
        + * There are limitations on the number of available contexts,
        page sizes,
        <br>
        + * number of pages that can be mapped, etc.
        <br>
        + *
        <br>
        + * PVU is desgined to be programmed with all the memory mapping
        at once.
        <br>
        + * Therefore, it defers the actual register programming till
        config_commit.
        <br>
        + * Also, it does not support unmapping of the pages at runtime.
        <br>
        + *
        <br>
        + * Authors:
        <br>
        + *=C2=A0 Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
        <br>
        + *
        <br>
        + * This work is licensed under the terms of the GNU GPL,
        version 2.=C2=A0 See
        <br>
        + * the COPYING file in the top-level directory.
        <br>
        + */
        <br>
        +
        <br>
        +#include &lt;jailhouse/unit.h&gt;
        <br>
        +#include &lt;jailhouse/cell.h&gt;
        <br>
        +#include &lt;jailhouse/entry.h&gt;
        <br>
        +#include &lt;jailhouse/paging.h&gt;
        <br>
        +#include &lt;jailhouse/control.h&gt;
        <br>
        +#include &lt;jailhouse/printk.h&gt;
        <br>
        +#include &lt;asm/iommu.h&gt;
        <br>
        +#include &lt;asm/ti-pvu.h&gt;
        <br>
        +#include "ti-pvu_priv.h"
        <br>
      </blockquote>
      <br>
      Single-user header - let's fold this in.
      <br>
    </blockquote>
    alright<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+
        <br>
        +#define MAX_PVU_ENTRIES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(PAGE_SIZE / sizeof (struct
        pvu_tlb_entry))
        <br>
        +#define MAX_VIRTID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 7
        <br>
        +
        <br>
        +static struct pvu_dev pvu_units[JAILHOUSE_MAX_IOMMU_UNITS];
        <br>
        +static unsigned int pvu_count;
        <br>
        +
        <br>
        +static const u64 PVU_PAGE_SIZE_BYTES[] =3D {
        <br>
      </blockquote>
      <br>
      This is not a macro or define, so let's decapitalize its name.
      <br>
    </blockquote>
    will do<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_4K]=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=C2=A0=C2=A0 4 *
        1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_16K]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D=C2=A0 16 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_64K]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D=C2=A0 64 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_2M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D=C2=A0=C2=A0 2 * 1024 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_32M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D=C2=A0 32 * 1024 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_512M]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D 512 * 1024 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_1G]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D=C2=A0=C2=A0 1 * 1024 * 1024 * 1024,
        <br>
        +=C2=A0=C2=A0=C2=A0 [LPAE_PAGE_SZ_16G]=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D=C2=A0 16ULL * 1024 * 1024 * 1024,
        <br>
      </blockquote>
      <br>
      Is there another use case the LPAE_PAGE_SZ constants in sight?
      <br>
      Otherwise, I would simply fill the array in the right order with
      the
      <br>
      actual values.
      <br>
      <br>
    </blockquote>
    will do<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+};
        <br>
        +
        <br>
        +static inline u32 is_aligned(u64 addr, u64 size)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 return (addr % size) =3D=3D 0;
        <br>
        +}
        <br>
        +
        <br>
        +static void pvu_tlb_enable(struct pvu_dev *dev, u16 tlbnum)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base +=
 tlbnum;
        <br>
        +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;chain,
        PVU_TLB_LOG_DIS_MASK, 0);
        <br>
        +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;chain, PVU_TLB_=
EN_MASK, 1);
        <br>
        +}
        <br>
        +
        <br>
        +static void pvu_tlb_disable(struct pvu_dev *dev, u16 tlbnum)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base +=
 tlbnum;
        <br>
        +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;chain, PVU_TLB_=
EN_MASK, 0);
        <br>
        +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;chain,
        PVU_TLB_LOG_DIS_MASK, 1);
        <br>
        +}
        <br>
        +
        <br>
        +static u32 pvu_tlb_is_enabled(struct pvu_dev *dev, u16 tlbnum)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base +=
 tlbnum;
        <br>
        +=C2=A0=C2=A0=C2=A0 if (mmio_read32_field(&amp;tlb-&gt;chain, PVU_T=
LB_EN_MASK))
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
        <br>
        +=C2=A0=C2=A0=C2=A0 else
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static int pvu_tlb_chain(struct pvu_dev *dev, u16 tlbnum, u16
        tlb_next)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 if (tlb_next &lt;=3D tlbnum || tlb_next &lt;=3D
        dev-&gt;max_virtid)
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base +=
 tlbnum;
        <br>
        +=C2=A0=C2=A0=C2=A0 mmio_write32_field(&amp;tlb-&gt;chain, PVU_TLB_=
CHAIN_MASK,
        tlb_next);
        <br>
        +=C2=A0=C2=A0=C2=A0 return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static u32 pvu_tlb_next(struct pvu_dev *dev, u16 tlbnum)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb *tlb;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 tlb =3D (struct pvu_hw_tlb *)dev-&gt;tlb_base +=
 tlbnum;
        <br>
        +=C2=A0=C2=A0=C2=A0 return mmio_read32_field(&amp;tlb-&gt;chain,
        PVU_TLB_CHAIN_MASK);
        <br>
        +}
        <br>
        +
        <br>
        +static u32 pvu_tlb_alloc(struct pvu_dev *dev, u16 virtid)
        <br>
        +{
        <br>
        +=C2=A0=C2=A0=C2=A0 int i;
        <br>
      </blockquote>
      <br>
      Let's use an appropriate unsigned type here, e.g. unsigned int.
      <br>
    </blockquote>
    will review signedness of all variables and fix it<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+
        <br>
        +=C2=A0=C2=A0=C2=A0 for (i =3D dev-&gt;max_virtid + 1; i &lt; dev-&=
gt;num_tlbs;
        i++) {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dev-&gt;tlb_data[i]=
 =3D=3D 0) {
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dev-&gt;tlb_data[i] =3D virtid &lt;&lt;
        dev-&gt;num_entries;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return i;
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
        <br>
        +=C2=A0 <br>
      </blockquote>
    </blockquote>
    <br>
    [snip]<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+{
        <br>
        +=C2=A0=C2=A0=C2=A0 /*
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
        <br>
      </blockquote>
      <br>
      Huh!? But this breaks cell create/destroy cycles, without any user
      <br>
      notice, no? And will root cell devices keep access to inmate
      memory that
      <br>
      is carved out during cell creation?
      <br>
      <br>
      Is that a hardware limitation?
      <br>
      <br>
      Looks like a blocker...
      <br>
    </blockquote>
    Yes, this is a hardware limitation. I it designed for static
    partitioning.<br>
    Although, I made sure to not break memory isolatio with the
    following workaround:<br>
    <br>
    When booting a root cell for Jailhouse, you would typically
    carveout=C2=A0 memory for the<br>
    inmate cell. I have defined the cell configs such that, in the root
    cell config, RAM region for inmate is<br>
    NOT marked with MEM_DMA, this way it never gets mapped in PVU.<br>
    <br>
    When creating cell, root cell maps the inmate RAM loadable region,
    here that memory is not<br>
    mapped in IO space.<br>
    ---&gt; Limitation of this is that you cannot DMA copy the images in
    the loadable sections,<br>
    =C2=A0=C2=A0 which we are not doing anyways<br>
    <br>
    When destroying the cell, Jailhouse should map the memory back to
    the root cell.<br>
    Here, again, the inmate RAM region gets ignored in IO mapping
    because of lacking flag MEM_DMA<br>
    <br>
    cell_create=C2=A0 and cell_destroy work in regression, tested
    successfully.<br>
    <br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+=C2=A0=C2=A0=C2=A0=C2=A0 */
        <br>
        +=C2=A0=C2=A0=C2=A0 return 0;
        <br>
        +}
        <br>
        +
        <br>
        +int pvu_iommu_config_commit(struct cell *cell)
        <br>
        +{
      </blockquote>
    </blockquote>
    <br>
    [snip]<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+#define LPAE_PAGE_SZ_2M=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3
        <br>
        +#define LPAE_PAGE_SZ_32M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 4
        <br>
        +#define LPAE_PAGE_SZ_512M=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 5
        <br>
        +#define LPAE_PAGE_SZ_1G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6
        <br>
        +#define LPAE_PAGE_SZ_16G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 7
        <br>
        +
        <br>
        +#define LPAE_PAGE_PERM_UR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 15)
        <br>
        +#define LPAE_PAGE_PERM_UW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 14)
        <br>
        +#define LPAE_PAGE_PERM_UX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 13)
        <br>
        +#define LPAE_PAGE_PERM_SR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 12)
        <br>
        +#define LPAE_PAGE_PERM_SW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 11)
        <br>
        +#define LPAE_PAGE_PERM_SX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 10)
        <br>
        +
        <br>
        +#define LPAE_PAGE_MEM_DEVICE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (0 &lt;&lt; 8)
        <br>
        +#define LPAE_PAGE_MEM_WRITEBACK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (1 &lt;&lt; 8)
        <br>
      </blockquote>
      <br>
      These two are unused - accidentally?
      <br>
      <br>
    </blockquote>
    Unused, will remove<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <blockquote type=3D"cite">+#define LPAE_PAGE_MEM_WRITETHROUGH=C2=A0=
=C2=A0=C2=A0 (2
        &lt;&lt; 8) &gt; +
        <br>
        +#define LPAE_PAGE_PREFETCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 6)
        <br>
        +#define LPAE_PAGE_INNER_SHARABLE=C2=A0=C2=A0=C2=A0 (1 &lt;&lt; 5)
        <br>
      </blockquote>
      <br>
      These two as well. I would recommend adding only used constants.
      <br>
    </blockquote>
    will do<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+#define LPAE_PAGE_OUTER_SHARABLE=C2=A0=C2=
=A0=C2=A0 (1
        &lt;&lt; 4)
        <br>
        +
        <br>
        +#define LPAE_PAGE_IS_NOALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (0 &lt;&lt; 2)
        <br>
        +#define LPAE_PAGE_IS_WR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1 &lt;&lt; 2)
        <br>
        +#define LPAE_PAGE_IS_RD_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (2 &lt;&lt; 2)
        <br>
        +#define LPAE_PAGE_IS_RDWR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (3 &lt;&lt; 2)
        <br>
        +
        <br>
        +#define LPAE_PAGE_OS_NOALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (0 &lt;&lt; 0)
        <br>
        +#define LPAE_PAGE_OS_WR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1 &lt;&lt; 0)
        <br>
        +#define LPAE_PAGE_OS_RD_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (2 &lt;&lt; 0)
        <br>
        +#define LPAE_PAGE_OS_RDWR_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (3 &lt;&lt; 0)
        <br>
      </blockquote>
      <br>
      Here are some unused consts as well.
      <br>
    </blockquote>
    will remove<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+
        <br>
        +struct pvu_hw_tlb_entry {
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg0;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg1;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg2;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg3;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg4;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg5;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg6;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eg7;
        <br>
      </blockquote>
      <br>
      Do these regs really have no names? Can we use an array then?
      <br>
    </blockquote>
    Yes, the TRM actually has these names for the TLB entry<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">+};
        <br>
        +
        <br>
        +#define PVU_TLB_EN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (1 &lt;&lt; 31)
        <br>
        +#define PVU_TLB_LOG_DIS_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1 &lt;&lt; 30)
        <br>
        +#define PVU_TLB_FAULT_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 &lt;&lt; 29)
        <br>
        +#define PVU_TLB_CHAIN_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (0xfff)
        <br>
        +
        <br>
        +struct pvu_hw_tlb {
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 chain;
        <br>
        +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 resv_32[28];
        <br>
        +=C2=A0=C2=A0=C2=A0 struct pvu_hw_tlb_entry=C2=A0=C2=A0=C2=A0 entry=
[8];
        <br>
        +=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 resv_4096[3808];
        <br>
        +};
        <br>
        +
        <br>
        +struct pvu_tlb_entry {
        <br>
        +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=
irt_addr;
        <br>
        +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
hys_addr;
        <br>
        +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ize;
        <br>
        +=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
lags;
        <br>
        +};
        <br>
        +
        <br>
        +struct pvu_dev {
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
cfg_base;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
tlb_base;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n=
um_tlbs;
        <br>
        +=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n=
um_entries;
        <br>
        +=C2=A0=C2=A0=C2=A0 u16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m=
ax_virtid;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 u16=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
lb_data[PVU_NUM_TLBS];
        <br>
        +};
        <br>
        +
        <br>
        +#endif /* __TI_PVU_PRIV_H__ */
        <br>
        diff --git a/include/jailhouse/cell-config.h
        b/include/jailhouse/cell-config.h
        <br>
        index d435b9f7..9bb84492 100644
        <br>
        --- a/include/jailhouse/cell-config.h
        <br>
        +++ b/include/jailhouse/cell-config.h
        <br>
        @@ -203,6 +203,7 @@ struct jailhouse_pci_capability {
        <br>
        =C2=A0 #define JAILHOUSE_IOMMU_AMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 1
        <br>
        =C2=A0 #define JAILHOUSE_IOMMU_INTEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2
        <br>
        =C2=A0 #define JAILHOUSE_IOMMU_SMMUV3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3
        <br>
        +#define JAILHOUSE_IOMMU_PVU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 4
        <br>
        <br>
        =C2=A0 struct jailhouse_iommu {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 type;
        <br>
        @@ -213,6 +214,9 @@ struct jailhouse_iommu {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 amd_base_cap;
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 amd_msi_cap;
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 amd_features;
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 __u64 tipvu_tlb_base;
        <br>
        +=C2=A0=C2=A0=C2=A0 __u32 tipvu_tlb_size;
        <br>
      </blockquote>
      <br>
      Time to stick the amd fields in their own sub-struct, as well as
      the
      <br>
      tipvu ones, and then put both struct into a union. Analogously to
      <br>
      jailhouse_system.platform_info.
      <br>
    </blockquote>
    Agreed, I will do that.<br>
    <blockquote type=3D"cite"
      cite=3D"mid:ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de">
      <br>
      <blockquote type=3D"cite">=C2=A0 } __attribute__((packed));
        <br>
        <br>
        =C2=A0 struct jailhouse_pio {
        <br>
        <br>
      </blockquote>
      <br>
      Jan
      <br>
    </blockquote>
    <br>
    Thanks for the review<br>
    Nikhil Devshatwar<br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/22d04be0-c674-16a7-f36f-89f06419372c%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/22d04be0-c674-16a7-f36f-89f06419372c%40ti.com</a>.<br />

--------------C05FAAE4931319D8384080A8--
