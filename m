Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBMWSZP2QKGQEQQGWEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8A1C76C7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:43:31 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id j5sf1546669wmi.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:43:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783411; cv=pass;
        d=google.com; s=arc-20160816;
        b=lZjjvgB1Y7kCkJ33YM67jh2dCFQDSnZeBHKrBZAkoFjgLImIAtz89sscL33Orh9WyZ
         c23+rt3TygOWguZ8FXbPRrFCauXWXB2EI7Rn7+iayesV3Rst1fkZ5IdbONFgFynM8PIf
         Rkz0ilH0S+cVecy6CajwvVI9ZsEcaAlZ2Ln1Xfz6WaBfH4asxbFPLi/NMGHzFKHuoy7a
         LvRK+VpLOMkgmlzTPI8eGpQvKD64Ha2Q8KSKp4xtEu7eNAPQu8qQ5r1xJW+BxeECgAjP
         tTP6Ghr4qRQJbhbvHWcCfjymO15Nv8CG0pqhBle9bH+717aNvvDMeiXuF0wbsKJZvq3s
         figQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=yxGcFhthzDY2F+niUOMpH+XC4OhfrQjNlrLB3hTo0Ws=;
        b=Z/0t6g5SK4yDhCE1JOIriFCk1dIjmQEV8VqOPqZ/PIACNem/b5CPLakmVZKbsMCycT
         NCWtIxN1ft+l80Soh4u5XgU2ZWziFEBPijRXmhr9BZJ+iIegLobN98u+F32+ocMc5xdY
         NNo10ZbIbX04a4oaWfZGiNn0Ai5p+QpTuufAhQaYzF6QVwiW6u5Mo4y9B4BekaZM3H6h
         QIxmV4vATzcQ6RroNZobqaMUYhu5tcXNAncajAlIv+QqpBQPSh8AlGDTdbChuw+cmixr
         qus1W1DxPGO8zAMZv2IFbkbo937WEgHYMxLNHWuh8/bBtTL6c4IzqnoYBqmQA27l9Gwk
         GWfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ELDxCWKZ;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yxGcFhthzDY2F+niUOMpH+XC4OhfrQjNlrLB3hTo0Ws=;
        b=jlzrim27zPQj9/qhuH1SnK1MblUYWBJNxTqlj/5V7NajFEJJNqwVlqty72xutayVYV
         S8JsV++3zq67CxT+Xare79/ar2cSRcNnVrCpuB7WvVXoKq5mZN5tOkWOKgrKnnkR3H88
         EtH8y+BcWmSgQnpX9HFWIK562GVA3HYuqeKtSB1f12nuj0vUN37b9c8oOPxZNc6eJsuu
         OyUuRcMPeb9S3bNXLqz3iI5yfzBN+FllhLMPkiqzOdiC5h11079gMUVZE61XXAzbRy3f
         mFw8lgzXb3FGby695GbfGGggqDysY21pTeODd84iY6+z/U71r5NnvWaurP2kmnnUmEsW
         1TVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yxGcFhthzDY2F+niUOMpH+XC4OhfrQjNlrLB3hTo0Ws=;
        b=NIW1WGcgisQ5JhthpCV1Eu2zHiafBDcFv1dPcoXayNVz7/YDnuyaSsEoDVMdMYpnsM
         TzKAWbpux7TPSCoOSbHGRZHWP8yEST8j/1r72cXILqJWQvCUEBxLxZlcYvhvQuzYmNM4
         Ckvc+rEhsM+kgU2mesuq/7N/3pGizfvFwaNLGThpV7ys65l4uzEiDep+kNgrW4/ThxPX
         wkwEbJVjlkvcLAYHJKtgosmwrWCa7Ft7a1trfRS4Jj65k2eXHJCwvWNKEQIYNKlX3wrh
         9cxczEC+Aog/2dn6SMBdXDykRLJKOOEdiZzp94qKb2P5yLlScmjsG2oQmFF8kTF+xmjf
         PQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yxGcFhthzDY2F+niUOMpH+XC4OhfrQjNlrLB3hTo0Ws=;
        b=lcFXvap7X0qkqkiH+UpZm9jkQTGyaIXzqBVcAXjWDkQywZ/mvD30yNLtTl86KmbDea
         v/bu8E7H2as7vTqqLo1DHMjXPx/QxjKwq10rSfrLAgdKYm/X/+lrUyUQz5wQBEwEDaY8
         fvybJJm/ipBM/9R3u4chxExacMpOHiF0yIj+FDT0Eo6nqJwgPo4fTKHLV/TmusFdiOHJ
         6lmLD5H53KfW/m4A57glxYIUXCiQguyZWUw+OQgepc22ExeJJwZ7G4xIeAJhFYhf8KiN
         mOsIqJAn5V1Wv/x827leuRcDACl69rmxv/+1RMQ7Z5WsvnbUWx3iPZgOHbUEPnTbsqDc
         5ZFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubBqN3ZQNdpgK/T0FFbbQHb0R+57WNinDwQV5ChU7spuU7mOx98
	e4HKbVaCt0T4OoQBQa7cOQs=
X-Google-Smtp-Source: APiQypK+tAq79WrS73HbQip3ArCOOpy8WViqU0iegJmrPafYWIkArvlA8bEjaMB4/z1yd0sG35fN4Q==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr5129323wmc.51.1588783410872;
        Wed, 06 May 2020 09:43:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:224f:: with SMTP id a15ls5207346wmm.3.gmail; Wed,
 06 May 2020 09:43:30 -0700 (PDT)
X-Received: by 2002:a1c:f211:: with SMTP id s17mr6008044wmc.168.1588783410230;
        Wed, 06 May 2020 09:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783410; cv=none;
        d=google.com; s=arc-20160816;
        b=N9TJVBtvVHoHBcc1YZsEYfvszw7HRZED7QEb2BZNdgnDacG6mfsPk4k05+LH+JsTO5
         GsSPSHHG0WTpQqZTPdXtHpCgeP8LRlubnyfXkoIBYuC3ysrEbblAaxZgBaHDRmUGDTfn
         e1kOyFvN6/B0CGYEnToB02wx5Srm2JrGTW1YauiJRZLNmgWrx/1EvOIV4T5b3MFwA3qi
         ycOo1rExR2Az2M4ZD23U24+ezw4t/t+HQUXaWfbn/kG0nJb+J2d6NmyWPxOJ56y50etB
         yXiCXWBOM1boNzo8rFrNdlVRcdNK3NeBkibuCeGVf7Bt1MhZmaswLcWP6L/tI53TYAQz
         C2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:cc:to:subject:dkim-signature;
        bh=Tp7Unqp6vKyDgh7zRqyB7kNcYH808UfMXw/qwAFskE8=;
        b=onSugM77k+RicFrx+iDyuUPBhh9HmM836tRNJL/MoLQ/yC1Uc7RqEm1WmhL9BE96cW
         GLHemeZe4VKkE3ZvDyFd1DyZOFRa8lC5zxjdGgY3g5NPgaTFAqOfEWbp9jmlWPx2QYfj
         X57g6cSlBZ9aAf2YG4JiA6mTkrlmnvd0iXwh996noPkNYXSClTJl7i5J4tch4r0Smgfg
         Ypa9lhotsmvqdGmkfoSZ4QgZZRZeXvo1V3sTLepOt4jVLqRHNpMbTheipsaaEtWyz+kX
         vrVBqssCaBqWPF186BbMT6V4Tk/lQ2jmoVLoUDZDaagYnX7qrlaK7VwygmihtGYWebyM
         FYZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ELDxCWKZ;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com. [2a00:1450:4864:20::441])
        by gmr-mx.google.com with ESMTPS id o136si155925wme.0.2020.05.06.09.43.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::441 as permitted sender) client-ip=2a00:1450:4864:20::441;
Received: by mail-wr1-x441.google.com with SMTP id v12so1682546wrp.12
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:43:30 -0700 (PDT)
X-Received: by 2002:adf:80a3:: with SMTP id 32mr10271118wrl.199.1588783409708;
        Wed, 06 May 2020 09:43:29 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id j16sm3480952wru.13.2020.05.06.09.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:28 -0700 (PDT)
Subject: Re: [PATCH v2 7/9] hypervisor, arm64: add cache coloring support
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
Cc: Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-8-ms@xt3.it>
 <08e4aad0-314e-cfee-c4d8-be313903d8b4@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <5b4c903b-edac-5968-e2d8-20779123eb67@gmail.com>
Date: Wed, 6 May 2020 18:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <08e4aad0-314e-cfee-c4d8-be313903d8b4@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MVMWKa62b90zRLijiBRMhyvpAW1qawssl"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ELDxCWKZ;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::441
 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MVMWKa62b90zRLijiBRMhyvpAW1qawssl
Content-Type: multipart/mixed; boundary="xyMjRaZjnER1k93cHTqEVtkl5kr3lgcn3"

--xyMjRaZjnER1k93cHTqEVtkl5kr3lgcn3
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/4/20 8:35 PM, Jan Kiszka wrote:
> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Implement all the functions needed by the coloring interface for the
>> arm64 architecture.
>> Coloring selection is retrieved by the jailhouse_cache structure(s) in
>> cell's configuration. Each structure defines a color range that will be
>> mapped to the corresponding color bitmask. The configuration is
>> cell-wide and will be used with all the memory regions flagged with
>> JAILHOUSE_MEM_COLORED.
>> If no color selection is provided by the user and coloring is enabled,
>> use all the available colors on the platform.
>>
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <ms@xt3.it>
>> Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>
>> ---
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
>> =C2=A0 hypervisor/arch/arm64/coloring.c | 232 ++++++++++++++++++++++++++=
+++++
>> =C2=A0 2 files changed, 233 insertions(+)
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/coloring.c
>>
>> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
>> index c34b0f32..6c566e4d 100644
>> --- a/hypervisor/arch/arm64/Kbuild
>> +++ b/hypervisor/arch/arm64/Kbuild
>> @@ -22,3 +22,4 @@ always :=3D lib.a
>> =C2=A0 lib-y :=3D $(common-objs-y)
>> =C2=A0 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o tra=
ps.o
>> =C2=A0 lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
>> +lib-$(CONFIG_COLORING) +=3D coloring.o
>> diff --git a/hypervisor/arch/arm64/coloring.c
>> b/hypervisor/arch/arm64/coloring.c
>> new file mode 100644
>> index 00000000..cb2d80e9
>> --- /dev/null
>> +++ b/hypervisor/arch/arm64/coloring.c
>> @@ -0,0 +1,232 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) Universita' di Modena e Reggio Emilia, 2020
>> + *
>> + * Authors:
>> + *=C2=A0 Luca Miccio <lucmiccio@gmail.com>
>> + *=C2=A0 Marco Solieri <ms@xt3.it>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + */
>> +#include <jailhouse/coloring.h>
>> +#include <jailhouse/printk.h>
>> +#include <jailhouse/entry.h>
>> +#include <jailhouse/cell.h>
>> +#include <jailhouse/control.h>
>> +
>> +#define for_each_cache_region(cache, config, counter)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0 for ((cache) =3D jailhouse_cell_cache_regions(config=
), (counter) =3D 0;\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (counter) < (config)->=
num_cache_regions;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cache)++, (counter)++=
)
>=20
> Should be factored out and made generally available. I'm carrying
> something similar for Intel CAT (not published yet, so you couldn't know)=
.
>=20
>> +
>> +/** Default color bitmask uses all available colors */
>> +unsigned long color_bitmask_default[COLOR_BITMASK_SIZE];
>> +
>> +/** Do care bits for coloring */
>> +unsigned long addr_col_mask;
>> +
>> +/** Max number of colors available on the platform */
>> +#define COLORING_MAX_NUM ((addr_col_mask >> PAGE_SHIFT) + 1)
>> +
>> +#define MSB_LONG_IDX(word) (word ? (BITS_PER_LONG - clz(word) - 1) : 0)
>=20
> Add blank line.
>=20
>> +static inline unsigned long msb_color_bitmask(unsigned long
>> *color_bitmask)
>=20
> No need for inline.
>=20
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned long ret =3D 0;u
>> +=C2=A0=C2=A0=C2=A0 unsigned int layer =3D COLOR_BITMASK_SIZE - 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!color_bitmask)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 while (!ret) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D MSB_LONG_IDX(color_b=
itmask[layer]);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layer--;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return ret;
>> +}
>> +
>> +#define CTR_LINESIZE_MASK=C2=A0=C2=A0=C2=A0 0x7
>> +#define CTR_SIZE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13
>> +#define CTR_SIZE_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x3FFF
>> +#define CTR_SELECT_L2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 1=
)
>> +#define CTR_SELECT_L3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 2=
)
>> +#define CTR_CTYPEn_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x7
>> +#define CTR_CTYPE2_SHIFT=C2=A0=C2=A0=C2=A0 3
>> +#define CTR_LLC_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << 2)
>> +#define CTR_LOC_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24
>> +#define CTR_LOC_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x7
>> +#define CTR_LOC_NOT_IMPLEMENTED=C2=A0=C2=A0=C2=A0 (1 << 0)
>> +
>> +unsigned long get_llc_way_size(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_sel;
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_global_info;
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_info;
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_line_size;
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_set_num;
>> +=C2=A0=C2=A0=C2=A0 unsigned int cache_sel_tmp;
>> +
>> +=C2=A0=C2=A0=C2=A0 arm_read_sysreg(CLIDR_EL1, cache_global_info);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check if at least L2 is implemented */
>> +=C2=A0=C2=A0=C2=A0 if (((cache_global_info >> CTR_LOC_SHIFT) & CTR_LOC_=
MASK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D CTR_LOC_NOT_IMPLEMENT=
ED) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ERROR: L2 Cache not =
implemented\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return trace_error(-ENODEV);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Save old value of CSSELR_EL1 */
>> +=C2=A0=C2=A0=C2=A0 arm_read_sysreg(CSSELR_EL1, cache_sel_tmp);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Get LLC index */
>> +=C2=A0=C2=A0=C2=A0 if (((cache_global_info >> CTR_CTYPE2_SHIFT) & CTR_C=
TYPEn_MASK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D CTR_LLC_ON)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cache_sel =3D CTR_SELECT_L2;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cache_sel =3D CTR_SELECT_L3;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Select the correct LLC in CSSELR_EL1 */
>> +=C2=A0=C2=A0=C2=A0 arm_write_sysreg(CSSELR_EL1, cache_sel);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Ensure write */
>> +=C2=A0=C2=A0=C2=A0 isb();
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Get info about the LLC */
>> +=C2=A0=C2=A0=C2=A0 arm_read_sysreg(CCSIDR_EL1, cache_info);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* ARM TRM: (Log2(Number of bytes in cache line)) - =
4. */
>> +=C2=A0=C2=A0=C2=A0 cache_line_size =3D 1 << ((cache_info & CTR_LINESIZE=
_MASK) + 4);
>> +=C2=A0=C2=A0=C2=A0 /* ARM TRM: (Number of sets in cache) - 1 */
>> +=C2=A0=C2=A0=C2=A0 cache_set_num =3D ((cache_info >> CTR_SIZE_SHIFT) & =
CTR_SIZE_MASK)
>> + 1;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Restore value in CSSELR_EL1 */
>> +=C2=A0=C2=A0=C2=A0 arm_write_sysreg(CSSELR_EL1, cache_sel_tmp);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Ensure write */
>> +=C2=A0=C2=A0=C2=A0 isb();
>> +
>> +=C2=A0=C2=A0=C2=A0 return (cache_line_size * cache_set_num);
>> +}
>=20
> I see the convenience of this function, I dislike the code size growth.
>=20
> Is there a way for a Linux root user, via some sysfs or proc values to
> find out the required values that - as I assume - are unaccessible from
> userspace via the registers? That would eventually allow to fill
> llc_way_size when calling "jailhouse config create" on a non-x86 target.
>=20

This function is meant to help the user. If no way_size is provided,
coloring cannot be initialized.
I don't know if there are ways from Linux userspace to get this value.
If we remove this function at all, until there is no "jailhouse config
create" for non-x86 target we need to rely on the root cell
"configurator" and I don't know if it is a good approach since this
value is very crucial for the feature.
What do you think?

>> +
>> +int coloring_paging_init(unsigned int llc_way_size)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!llc_way_size) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llc_way_size =3D get_llc_way=
_size();
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!llc_way_size)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn -ENODEV;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /**
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Setup addr_col_mask
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * This mask represents the bits in the address=
 that can be used
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * for defining available colors
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 for (i =3D PAGE_SHIFT; i < MSB_LONG_IDX(llc_way_size=
); i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(i, &addr_col_mask);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (COLORING_MAX_NUM > MAX_COLOR_SUPPORTED)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Setup default color bitmask */
>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < COLORING_MAX_NUM; i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(i, color_bitmask_def=
ault);
>> +
>> +=C2=A0=C2=A0=C2=A0 printk("Coloring information:\n");
>> +=C2=A0=C2=A0=C2=A0 printk("LLC way size: %uKiB\n", llc_way_size >> 10);
>> +=C2=A0=C2=A0=C2=A0 printk("Address color mask: 0x%lx\n", addr_col_mask)=
;
>> +=C2=A0=C2=A0=C2=A0 printk("Max number of avail. colors: %ld\n", COLORIN=
G_MAX_NUM);
>=20
> How much of that information is code debugging, how much is valuable
> when configuring and operating a system?
>=20

You're right. The only information we need is the numbers of colors
available for configuring the cell.

>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +int coloring_cell_init(struct cell *cell)
>> +{
>> +=C2=A0=C2=A0=C2=A0 const struct jailhouse_cache *cache;
>> +=C2=A0=C2=A0=C2=A0 int counter =3D 0;
>> +=C2=A0=C2=A0=C2=A0 int i;
>> +
>> +=C2=A0=C2=A0=C2=A0 memset(cell->arch.color_bitmask, 0,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(unsigned long) * COLO=
R_BITMASK_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Root cell is currently not supported */
>> +=C2=A0=C2=A0=C2=A0 if (cell =3D=3D &root_cell)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 for_each_cache_region(cache, cell->config, counter) =
{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((cache->start + cache->s=
ize) > COLORING_MAX_NUM ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !cac=
he->size) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prin=
tk("Wrong color config. Max value is %ld\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 COLORING_MAX_NUM);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn -ERANGE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D cache->start; i <=
 (cache->start + cache->size); i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_=
bit(i, cell->arch.color_bitmask);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* If no coloring configuration is provided, use all=
 colors
>> available */
>> +=C2=A0=C2=A0=C2=A0 if (!counter)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(cell->arch.color_bitm=
ask, color_bitmask_default,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size=
of(unsigned long) * COLOR_BITMASK_SIZE);
>> +
>> +=C2=A0=C2=A0=C2=A0 printk("Cell [%s] color config: 0x%lx%lx%lx%lx\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell->config->name,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell->arch.color_bitmask[3],=
 cell->arch.color_bitmask[2],
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell->arch.color_bitmask[1],=
 cell->arch.color_bitmask[0]);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +unsigned long next_colored(unsigned long phys, unsigned long
>> *color_bitmask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int high_idx;
>> +=C2=A0=C2=A0=C2=A0 unsigned int phys_col_id;
>> +=C2=A0=C2=A0=C2=A0 unsigned long retval =3D phys;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!color_bitmask)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return phys;
>> +
>> +=C2=A0=C2=A0=C2=A0 high_idx =3D MSB_LONG_IDX(addr_col_mask);
>> +
>> +=C2=A0=C2=A0=C2=A0 phys_col_id =3D (phys & addr_col_mask) >> PAGE_SHIFT=
;
>> +=C2=A0=C2=A0=C2=A0 /**
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Loop over all possible colors starting from =
`phys_col_id` and
>> find
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the next color id that belongs to `color_bit=
mask`.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 while (!test_bit(phys_col_id, color_bitmask)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If we go out of boun=
ds, restart from 0 and carry 1
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * outside addr_col_mas=
k MSB.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (phys_col_id > msb_color_=
bitmask(color_bitmask)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys=
_col_id =3D 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retv=
al +=3D 1UL << (high_idx + 1);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys=
_col_id++;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reset old color configuration */
>> +=C2=A0=C2=A0=C2=A0 retval &=3D ~(addr_col_mask);
>> +=C2=A0=C2=A0=C2=A0 retval |=3D (phys_col_id << PAGE_SHIFT);
>> +
>> +=C2=A0=C2=A0=C2=A0 return retval;
>> +}
>> +
>> +unsigned long get_end_addr(unsigned long start, unsigned long size,
>> +=C2=A0=C2=A0=C2=A0 unsigned long *color_bitmask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned color_num =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Get number of colors from mask */
>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < MAX_COLOR_SUPPORTED; i++)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (test_bit(i, color_bitmas=
k))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 colo=
r_num++;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check if start address is compliant to color sele=
ction */
>> +=C2=A0=C2=A0=C2=A0 start =3D next_colored(start, color_bitmask);
>> +
>> +=C2=A0=C2=A0=C2=A0 return start + PAGE_ALIGN((size*COLORING_MAX_NUM)/co=
lor_num);
>> +}
>>
>=20
> Maybe you can model coloring setup/teardown as a unit, just like CAT
> does. Avoids hooks, but it may require some stubbing as you use only few
> of the common callbacks. Just an idea.
>=20

I like the idea. I will try to implement v3 as a unit.

> In general, please rethink which parts really need to be specific to arm
> and keep only those here.
>

I will do it.

Thanks,
Luca

> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5b4c903b-edac-5968-e2d8-20779123eb67%40gmail.com.

--xyMjRaZjnER1k93cHTqEVtkl5kr3lgcn3--

--MVMWKa62b90zRLijiBRMhyvpAW1qawssl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6S8ACgkQI/rjb1Ch
6Ks1GRAApWVAxFOH+J5HQUjmSjjZIQfUx+HnRb1OUu+OzNCFw4ZHBN8oDngYGadm
5oCDLGhAQ4jE/IgPiKngBBKEuWQzP/3FrBZ9yw4L7Iz1XaYNZA/nraSuMNqbxEsh
ROlwQvTpOoNcDYZgXkRcXwvqSakjGET29pwJwKWkHX+iTQoTjtSiIo6jwQp6yVJd
dpgUX2LW1WUJBgMVJkyOCVrLjeQ5wm03k5XBn1zCd2uthV6sjGyiYBwCEMIAVRpn
dmUdf5X6UbvzpdNe4KoxcTjSvOFIIbVtt2FwWs0eEsIEJC+W3IjuZSUBlsYIl4VV
UW+W0kHiMuNUn6prZ0VbCRWSe4PNp9zE8jj788ew2qJb+uT/bcQ84kTqDJ5hERe9
L+cJxBiprn4hZn9N24QEh7Cmht05QSELy1BlLtcinla4UevdpAT6QuO2ltiIxfPr
1u+xxFrcDHNdxYvFOlsLSeEOi/dXHswGCH+ne65RjXjIg3AdbaCToCWveFWcgQRe
7uaHat4o0OU7j1o/JnIlHbe+mgiQUBA4YxG98WUem6hw2LKBo/WULUh/jLWE/2Mb
qcBd1fpPQyv4qiTquxM70hMW199o59boOWrvcjmVYTREzKqDlh63FTq2Q5kkr3lX
S2SN3iLMr1M2v/hPkxbSPXbhdWcvTokGmpWmUqF6oYkHC0tXOC4=
=Ek2m
-----END PGP SIGNATURE-----

--MVMWKa62b90zRLijiBRMhyvpAW1qawssl--
