Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBVPD6HUAKGQEVYHZBVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id D435D5E0AF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 11:13:58 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id r57sf1452349qtj.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 02:13:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562145238; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z1s9GDpyWfx4Z01V8Lu1oAb+qaM/sFGsWtbqjgZtc5xtPAnbe7VZHl4nTbYmkHnISN
         /Dj7LBT8PKSGTgprxzA1xgIHBaIAKaYt8yHqVDolKVK0RVeZBt/IZyTqOJ8oQ+OOQCfB
         rRAKxcsaJoXWTHKd8x7znu2pGPzOaVPvPxspwzi8y6WXCKrAML4lbUKWBGA1o17xK/w3
         C8Mcpx1+h1gk29BrN6u6+9kIYaf5XXidSKA3bgkooX53NB1I5P9SvMAJtbOy8GMsGgOa
         bbspnWXAdQRNx7y6vitV6+T2TT6WHP3oQLfwyvQvVgXVOIsks1CbQHSpkUxR057VMWTE
         TaPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject:from:dkim-signature;
        bh=PeAdQEH6AoZAmDrUtqzYkLzO7aMz+RccgKGe9OyCww4=;
        b=Q3mO0PaLWcUgOZq/tuGox4jkbLQ3Glt+UMI7oimns1DGw8X2mvFTg1yDsI9Oaa0s/s
         gs6WV6IZ3GlFnLO+c6MxCky9xGI9VogGsDb+Garw+/WXJ/v6hdVXlZncTCa3MpS3ig9H
         Exwj0MgngfED9OksVdashjlExal2/KNsyTDauk8MpscZeeVuGY2UloWGUQVx+BbyWJw0
         Nx/Vgl9xSh1cdxrSIffrLaA8bhLnPA3vkOgWrocOU97ZzQgJb83Qowoz2hY2Tnn41QAk
         pV8wnaok76TqbRdyAK/16OGnGHVqHofcAW7J6irajYhd0K1DqB/ouVAMyGgSkPCQNfo0
         u2Aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yGjWnUtM;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PeAdQEH6AoZAmDrUtqzYkLzO7aMz+RccgKGe9OyCww4=;
        b=ALwtRal/Paa/5Noj84KnYz1eV5CFXp/2zG3W8z8TZTGage6HlLnjLMJGzjnCBbuVzF
         m2OkJnBDFSaSAiolOXQWcR2BZKDWeFJFEtGBsCaOVqs85Oh6np1KnQSDsl5gdw/q0SUa
         ysnlnA0qJoYl2Kjvw2fO4+ILV79TIc0YVUO8EZTCeHSYn5SKD+OflH9un8QG3qR5UTLZ
         xPkQW7SNKc3TwCKobzpdNCrA8eTdJsG5GggJwQifbV6Iv99fPnp9kLKYhIlChR5MzeAx
         gfNq7Pe8rIfWr05Dcf9kqtECHd7e6I8um6FJcovG141lZSRXRZ+0mqSAQXn7X2cuzu78
         W3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PeAdQEH6AoZAmDrUtqzYkLzO7aMz+RccgKGe9OyCww4=;
        b=SEjUWsPrCwogg5qI/EJFHCjhGrc2HGUIWNGHMJk0q7aZd5C6L4LEcbpGrNceOevPXS
         h67FpJa2bxz/nwmsd5y/okRKo5yciMlvjjppBj7zJpQ5cJYOhmYI7dBu2JKcNzZ9QFhb
         w6V+OeT0g+aptCowRJbNLT222hoAv1YH3GAIg4GZ4uSK7kdXpCFdLabIwd9TOYq5Rr9v
         V2+rWqFyIL34cCrh4Rg48eAwaGzAQ/AT+MwESlk3kK/ArkzQI9GQqMBAYNgmJvQAPx2y
         9F+6q/w4IL51AwBTBZaxpYnDwrCmLqmlmL6+L8mv1rvwjenRQQbazOwK4G4o3rOY93ia
         r6ng==
X-Gm-Message-State: APjAAAXAP3SpHf9uYyFIKaNJzfBjNaaibDdvFiQgccBA/Fvzxmkt/RL2
	hACf/2M+bubBWuBQOhriw4g=
X-Google-Smtp-Source: APXvYqw8icHIaNZGgmB/w2dpUMiPzu7Zv32Zl9NZUabQZrnKXXaP3KQIwgKpAYGVUTCu+OIPQE7h2g==
X-Received: by 2002:ac8:4687:: with SMTP id g7mr26926588qto.213.1562145237834;
        Wed, 03 Jul 2019 02:13:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:b147:: with SMTP id a68ls616463qkf.12.gmail; Wed, 03 Jul
 2019 02:13:57 -0700 (PDT)
X-Received: by 2002:a37:9ac9:: with SMTP id c192mr29966379qke.30.1562145237532;
        Wed, 03 Jul 2019 02:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562145237; cv=none;
        d=google.com; s=arc-20160816;
        b=ME6sWnH9BTEdLBx1MOpQjr+toWp8juExIXU5UgbCm3hRua1AgDMBKOxTDrwGLOn8g/
         mE4Ddr48qs/Hr2a2Sp0I4ue9i/454cW6QOSJTDrNSlQGfnKWufiPvBviBREX9tFHp/tg
         g3XbFdO1qnMHjq+uT71FUircwlLPha94+oJu+sCHsLgLsdG/uc7ule1JOQgdgKz6X0n0
         j0bWytdljks14St5IxYtmxili5GaKa1tvOiK1xbgQxvXEnCCgWh5Yf36mnBJAP2W/Lg0
         RQ+BqDkHWI00mvQ2qi96V/G6eX3Nf6i66ZqwA+i8GqP9oMY/tzR4yBJMww6WkFKj2KBf
         kBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from
         :dkim-signature;
        bh=Cq72cHNot0Ey7BOIy9YRa4P9gHQxX/Juo/OUHwiBviE=;
        b=sBZ5pL7WLgYTH0EOso7FCLRbUfoEW0U9syYYbqMHVF398IgbcBXEqPCLFc0htDZL8U
         nRn0Ssl8Uhn2Z4ZLUw385SqK9T2+vci3Id6gRYg2KgfKlGlAd4fYYDrhB1Lp+kOaE35/
         WT9RXzo808isrDjBl8LtwlRGAd0oKBoufpChL4855UoJbOvdZtaM+RaxPLK8ovRXQjyA
         G1hWD55BnW1yFf63Y9FZ6S2nYFn7HZnBemNAATJYPI+PWWSupq6NtjBJKmTAKqY0aNMr
         TMBbZ+FAoAQiKuw56N28WBpIw7963Qz04SYozsrD3BSr0+72M0+Esm9c/qmF72J08aeH
         MGng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yGjWnUtM;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id c39si96165qta.5.2019.07.03.02.13.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 02:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x639DuNG102238;
	Wed, 3 Jul 2019 04:13:56 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x639DuKu011701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2019 04:13:56 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 04:13:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 04:13:56 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x639DsOP006665;
	Wed, 3 Jul 2019 04:13:54 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 3/6] core: Add stream id list in the cell config
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-4-p-yadav1@ti.com>
 <33ad2ca9-c618-1443-9fb4-ab5af325ee25@siemens.com>
Message-ID: <0bfd4d29-4f35-5346-209d-cafcdbdb2151@ti.com>
Date: Wed, 3 Jul 2019 14:44:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <33ad2ca9-c618-1443-9fb4-ab5af325ee25@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=yGjWnUtM;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 02/07/19 9:11 PM, Jan Kiszka wrote:
> On 02.07.19 16:36, Pratyush Yadav wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> When IOMMU drivers are supported, it will setup the IO address
>> translation tables unique for each DMA context in the system.
>=20
> To make it clearer: When ARM IOMMUs are supported...

Will update.

>>
>> A typical DMA context is identified by an integer called stream id.
>> To setup the correct IOMMU mapping, hypervisor should know
>> list of all the streamIDs that should be setup in the IOMMU.
>>
>> Add an array of stream IDs in the cell config, bump up the config revisi=
on.
>> Change the python struct unpacking logic in the tools to reflect
>> revised config structure.
>>
>> [p-yadav1@ti.com: Add size define for stream_ids]
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>> ---
>> =C2=A0 include/jailhouse/cell-config.h | 6 +++++-
>> =C2=A0 tools/jailhouse-cell-linux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>> =C2=A0 tools/jailhouse-hardware-check=C2=A0 | 2 +-
>> =C2=A0 3 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-co=
nfig.h
>> index 198fef5c..caf2fba8 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -50,7 +50,7 @@
>> =C2=A0=C2=A0 * Incremented on any layout or semantic change of system or=
 cell config.
>> =C2=A0=C2=A0 * Also update HEADER_REVISION in tools.
>> =C2=A0=C2=A0 */
>> -#define JAILHOUSE_CONFIG_REVISION=C2=A0=C2=A0=C2=A0 10
>> +#define JAILHOUSE_CONFIG_REVISION=C2=A0=C2=A0=C2=A0 11
>> =C2=A0 =C2=A0 #define JAILHOUSE_CELL_NAME_MAXLEN=C2=A0=C2=A0=C2=A0 31
>> =C2=A0 @@ -74,6 +74,9 @@
>> =C2=A0 =C2=A0 #define JAILHOUSE_CELL_DESC_SIGNATURE=C2=A0=C2=A0=C2=A0 "J=
HCELL"
>> =C2=A0 +#define JAILHOUSE_MAX_STREAMIDS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32
>=20
> At the risk of having asked this already in the RFC:

I thought you meant you wanted to change the hard value of 32 to a size def=
ine. My bad, sorry.

> Is 32 really enough in the foreseeable future? Or should we rather have s=
ome resizable array, analogously to memory regions or PCI devices? That wou=
ld also allow to set it to 0 on non-SMMU platforms.

Seems like a good number. We don't use more than 8 in our boards. But chang=
ing it to a resizeable array should not be a problem either.

Now that I think of it, it is probably a better idea. I'll change it.

>> +#define JAILHOUSE_INVALID_STREAMID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (~0)
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * The jailhouse cell configuration.
>> =C2=A0=C2=A0 *
>> @@ -95,6 +98,7 @@ struct jailhouse_cell_desc {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 pio_bitmap_size;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 num_pci_devices;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 num_pci_caps;
>> +=C2=A0=C2=A0=C2=A0 __u32 stream_ids[JAILHOUSE_MAX_STREAMIDS];
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 vpci_irq_base;
>> =C2=A0 diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-li=
nux
>> index 49babd92..4b6f504b 100755
>> --- a/tools/jailhouse-cell-linux
>> +++ b/tools/jailhouse-cell-linux
>> @@ -564,8 +564,8 @@ class Irqchip:
>> =C2=A0 =C2=A0 =C2=A0 class Config:
>> -=C2=A0=C2=A0=C2=A0 _HEADER_FORMAT =3D '6sH32s4xIIIIIIIIIQ8x32x'
>> -=C2=A0=C2=A0=C2=A0 _HEADER_REVISION =3D 10
>> +=C2=A0=C2=A0=C2=A0 _HEADER_FORMAT =3D '6sH32s4xIIIIIIII128xIQ8x32x'
>> +=C2=A0=C2=A0=C2=A0 _HEADER_REVISION =3D 11
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def __init__(self, config_file):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.data =3D con=
fig_file.read()
>> diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-c=
heck
>> index b86756ac..afd1139b 100755
>> --- a/tools/jailhouse-hardware-check
>> +++ b/tools/jailhouse-hardware-check
>> @@ -136,7 +136,7 @@ class Sysconfig:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X86_MAX_IOMMU_UNITS =3D 8
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X86_IOMMU_SIZE =3D 20
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 HEADER_REVISION =3D 10
>> +=C2=A0=C2=A0=C2=A0 HEADER_REVISION =3D 11
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HEADER_FORMAT =3D '6sH'
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def __init__(self, path):
>>
>=20
> Jan
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0bfd4d29-4f35-5346-209d-cafcdbdb2151%40ti.com.
For more options, visit https://groups.google.com/d/optout.
