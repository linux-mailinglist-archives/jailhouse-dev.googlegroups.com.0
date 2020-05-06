Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBNGRZP2QKGQETLBVMPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 231051C76B3
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:41:25 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id y66sf799125ede.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:41:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783285; cv=pass;
        d=google.com; s=arc-20160816;
        b=naI/ZEZOI/ZS7jUR+OIxCqtq3IkPBciOWOAGDybvMgIMdcnDIZ5MBKSwA33g1LRWoR
         sB+DFBo7E7cUFB6QYBKK8o1uoMObkWeeOaUrpwLjYj8KhzQuwQa+E+zJlXMxPJCFqWff
         668vRxfr/b+y5hb4YANQkrql6E5WF8KPp9k/ORz2l6/fRNOrzV43Fn262E3JASJiaLUs
         fS8pQkjwVhKtwbPc6c5zJsTK7sEpWPvbIjuOkY1zcI2mz1/Df+1RvLXetLxFaA9vlusc
         6mmKajHXvNidYzx8ROJj39Xqe7ou5Seg2KZESVnpWp2o8jP7y67CguntBG5nFe0QMqGp
         qVbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=ZpcPXRRQUeONTrxANdB7Stqth0OJnptl3eDXrkEgbEI=;
        b=O59rXtI/uY2PRDpW/T2CgQkufcV+iS/pVDc5JdI6kYedSvy9SqSiQs3Hlkcu96/HGH
         yHjZUFmtL5XF+TUzT9sUb25/GjOTUeGw7dRhHcEnmD7qy/0+X3BqUcipGVQ6MKMH8LHe
         ZKiOVe+vBrpOYv5fIFJQSCvhqrcF+r/Q4JD6wCGUBPRWHi26wThnWSBGRxT98vyRkxSJ
         2a1PoXasRbyBSeS5CyzxaRw93/5gjyD6G+SAqSLu2y+Ir39oh4vwndkTJtk9U84WskFK
         FOGipfV85+5KWEjL9KP+sLxvb5b8eZcy2y1c5l+DrQbIXTLVXRnnw3RXagtu3sg4ES/e
         s/wQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kZkOYCxm;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZpcPXRRQUeONTrxANdB7Stqth0OJnptl3eDXrkEgbEI=;
        b=snaAHS4/S/5QhFGbW2r7mhRf1/hyJjFIdAmEQOhLyXqyRLBiIxWr0DjcFtllPcKZoo
         qDLxAjR7jTW1vOagnHf49bQ04PTudo5i035YRCUree23dHLuZN2kCXQ+/Aal22d2heII
         daszxBUuENmaF6oTLC8NL4MpmINm0wf93bBv1AIs+sX4HPrcNppo5o24pLvAIA4Mit6f
         3ETGGVyK+iZzyrtZiiiiXPE7bKZgUe5R7kvpazb5Q0IMiUlZge+TqiDJ9d4dyg811w0Y
         4xfBHB6YWi0AOfqLekMmEKpO1Qk4r4X68AdGvhsRcy0WOB4ObPVBD9GeKblyBt9UhmOJ
         gSNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZpcPXRRQUeONTrxANdB7Stqth0OJnptl3eDXrkEgbEI=;
        b=Ap/x4SmtYOWLZsLnATrovCmw71t+lorb8fQuQwsu4Yq30iU3Pl3K4/C+FMwqidDGDv
         oZ0QbrD6a8uILuZcE2cSq4751gFF7bWFHAnfmFQstHHWvJCDigkuy40CQCAVzihi3f4s
         kqi1RJISsRLvbE7S56fDsRfwAOagt6SJr7tjf7HiF/Zqv1VgQrYqOM+DOl3ROGEh/fRy
         Yg2CChZa/TW5BxW6f14HWdGT4f7DY5TcnEzkSyR92rJYB6fqGs6c7zIdCrcRS0tTQT6p
         EeIJgLidLQQThIonWINUX0Rq+r7rEm65HF6W25nKGwW8qHKHLwRpOYUB1kSPH6R4CfWW
         SP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZpcPXRRQUeONTrxANdB7Stqth0OJnptl3eDXrkEgbEI=;
        b=qM5Jo4mB7jMgV84vM67Z7Lat96AMiw+q9InlGVnDJ3UCH53sBCC4kCjvvbD+Vsj7Jo
         4pDfnP8EZ/pqXozcZ7glwcK9FOkmyW70kbqCTpaecUIhdHA7TrZvP6Os6bHKDcpkmngd
         VKz2ezpt1W5utHXi/Wuz8i+1L1D/8C62dATZIIswmPJP6L3k75iGbcFgP7E/SjW9PT8H
         n4x2CiJMu/f1d4uhEZP2llxOHngg238nqTIXk/cuAyt3B21Ew3yh6D71RGc5koZk5vao
         Nbwjs5HsYmhEiLLxsJQmDHE5rMhfayTZQZtszw2uZNufAwtDFY4Cu96o1vZQDcOYgmJx
         S6ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubHCpj6xgUpi/aGQsUahPqaE9dKgUoH41UW8+DHpc/7XmsMMFjo
	urdMzcWeymoBcd9WNj0f/6M=
X-Google-Smtp-Source: APiQypJTKdWpWvQYrbKsa+XLRBXcOh8kQXI/Au3jHKAVRhsof/dpiT3MKzLXZ7Vgs6PcTIk43kb9jw==
X-Received: by 2002:a17:906:7204:: with SMTP id m4mr8484008ejk.48.1588783284790;
        Wed, 06 May 2020 09:41:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6b89:: with SMTP id l9ls1392347ejr.6.gmail; Wed, 06
 May 2020 09:41:24 -0700 (PDT)
X-Received: by 2002:a17:907:4304:: with SMTP id nh4mr3453893ejb.193.1588783284196;
        Wed, 06 May 2020 09:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783284; cv=none;
        d=google.com; s=arc-20160816;
        b=vkD5GehzT/dYjuFTwPMJvj2QBvlaaYlhKOKNWUU9bHAGE3hC+seHcw1JkgjkKcO7FU
         Q0yscRKMM4lmQfkgGakVngVEHBNCUSSibCl64dZSzHVWeBfXFOQ/XTNHREuoIlFG9uoO
         JcZkJW7uFoVjTMMTLonLQqofcWS9Q8iJfsOalSCjLtq//Cg/pOzIcANtb2IDcvwqnKUH
         VXwCgPuxsvmivmDzhWxRL4rs4s+RKAle1K1ykwSpkOrBeYuVgIQwAKeachwbD4VciQoc
         g55ysOzotoRQXJ1FcA5qTpz4NbV7C5JZSHPTsy3QLqkSUPSPqLTHWOlvi0lL1yWJAfPs
         p5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:to:subject:dkim-signature;
        bh=PHvlrUElCPGr32ahWfOBpYNOMfDDTnrDA0qm73jqwN4=;
        b=QLqqjPEERLsxAVnKpN8gxsM46JTqXoYyP/zLYYlwk5zRUYl8wSDKwf2NDaI1ymrCtr
         KDp7HuJg6441F8vmmqxyO9ma/+4i68FXcdUpWMCDYFUUAeM0RiSt5+B9NGz56K9a7zDI
         esabBts8ILLVNtuaxRLumrlLWppPbdAbCdqK6ANdgm30f0DGjgjT27t8mKys5VNNnl5r
         WYmJcpgZGjz9aw2okcWLidckDiAFkWRxoQ+Z1qnDvWF69P/UgsE2AUvjTxnb4lC4qQLs
         AI0MggQTtyVi3Ws5MaL1afc2aD2lcwWb4rnqh7gDxjKhc8AnwhzY5CDDguCxsdB7byb0
         5wHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kZkOYCxm;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com. [2a00:1450:4864:20::344])
        by gmr-mx.google.com with ESMTPS id f24si129288edw.3.2020.05.06.09.41.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) client-ip=2a00:1450:4864:20::344;
Received: by mail-wm1-x344.google.com with SMTP id g12so3489248wmh.3
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:41:24 -0700 (PDT)
X-Received: by 2002:a1c:5448:: with SMTP id p8mr5226028wmi.173.1588783283486;
        Wed, 06 May 2020 09:41:23 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id m188sm3577543wme.47.2020.05.06.09.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:41:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] hypervisor: introduce a common cache coloring
 interface
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-2-ms@xt3.it>
 <df96a44e-96fe-3b46-2bd4-88a38532ce72@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <afd83f32-7272-d44e-e501-3631b93b7980@gmail.com>
Date: Wed, 6 May 2020 18:40:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <df96a44e-96fe-3b46-2bd4-88a38532ce72@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XYqEKXcye7revmXeib6VaALxBYaAetBxp"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=kZkOYCxm;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::344
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
--XYqEKXcye7revmXeib6VaALxBYaAetBxp
Content-Type: multipart/mixed; boundary="a96WqOmZsxC7dkCmsENgdOxjUrPk5Odn9"

--a96WqOmZsxC7dkCmsENgdOxjUrPk5Odn9
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/4/20 8:31 PM, Jan Kiszka wrote:
> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Add fundamental primitives to implement support for cache coloring.
>> The latter is performed by exploiting the mapping of memories flagged as
>> JAILHOUSE_MEM_COLORED and defined in the inmates' configurations (no
>> root-cell or hypervisor itself supported yet).
>=20
> Does the semantic of jailhouse_memory::size change when
> JAILHOUSE_MEM_COLORED is set? Do I get a region that has the same
> effective size as without coloring, thus uses a larger physical memory
> range? Or do I get a portion from the identically sized physical memory
> range that is defined by the number of colors I use (and alignment
> effects)? Worth to document explicitly, in patch 9 and maybe also here
> in the commit log when adding the flag.
>=20
When you define a memory region as "colored" you get the size you set in
the structure. The problem is that now the rule end_addr =3D phys_start=C2=
=A0+
size is not valid anymore as documented in patch 9. So the memory is
effectively using a wider range than "size". I agree with you that this
should be clarified better in documentation.

>> The interface defines the basic functions that have to be implemented in
>> order to support coloring for a specific architecture.
>=20
> What makes coloring architecture-specific again? Provided you have a set
> associative cache that can be exploited at page boundaries - but that
> aspect is not per-se an architecture feature -, this approach should
> work everywhere, no?
>=20
> I will pick on that aspect in the following a bit more so that the code
> is not needlessly bound to arm64.
>=20

You are completely right. This approach should technically work even on
X86 or armv7 targets. The only architectural dependent parameter that we
need to know is the way size of last level cache.
Considering that, I will re-think better which part is *really*
arch-dependent.
Regarding on this topic I see a possible next proposal where coloring
interface is as architectural independent as possible and, as you said
in later commits, maybe I will try to implement it as a unit.
The only function that has to be arch-dependent should be
`get_llc_way_size`. The latter can be defined as a general function
called by the coloring init (if we want to keep it as discussed later in
the series).

>>
>> Define three main functions:
>> - coloring_paging_init: calculate which bit range in the address is
>> useful
>> =C2=A0=C2=A0 for cache coloring, assuming it limited by the page size an=
d the LLC
>> =C2=A0=C2=A0 way size as happens on arm;
>> - next_colored: calculate the next physical page address that conforms
>> =C2=A0=C2=A0 to a given colors selection and to the bits calculated in t=
he previous
>> =C2=A0=C2=A0 function;
>> - coloring_cell_init: initialize cell colors assignement depending on it=
s
>> =C2=A0=C2=A0 configuration;
>>
>> LLC way size is required for coloring to work and it can be explicitly
>> defined in the root cell configuration. Add a helper function that
>> probes the way size from hardware if the llc_way_size is not set in the
>> root cell configuration.
>>
>> Finally, define a function used to calculate the physical end address of
>> a given memory that is flagged as colored.
>>
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <ms@xt3.it>
>> ---
>> =C2=A0 hypervisor/include/jailhouse/coloring.h | 96 ++++++++++++++++++++=
+++++
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 8 +++
>> =C2=A0 2 files changed, 104 insertions(+)
>> =C2=A0 create mode 100644 hypervisor/include/jailhouse/coloring.h
>>
>> diff --git a/hypervisor/include/jailhouse/coloring.h
>> b/hypervisor/include/jailhouse/coloring.h
>> new file mode 100644
>> index 00000000..9dfe516c
>> --- /dev/null
>> +++ b/hypervisor/include/jailhouse/coloring.h
>> @@ -0,0 +1,96 @@
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
>> +#ifndef _JAILHOUSE_COLORING_H
>> +#define _JAILHOUSE_COLORING_H
>> +
>> +#include <jailhouse/cell.h>
>> +
>> +#ifdef CONFIG_COLORING
>=20
> Please avoid the compile-time config option. I see no reason so far to
> turn the logic off - you can always do that, effectively, by not
> configuring colored regions.
>=20

Ok. I thought that since coloring adds some potentially unused code it
would have been more convenient to avoid compiling it.
I also agree with you that we can remove it and when no coloring region
is specified in the cell configuration it means that coloring will not
be used for that cell.

>> +/**
>> + * Get the way size of last level cache
>> + */
>> +unsigned long get_llc_way_size(void);
>> +
>> +/**
>> + * Init cache coloring on the platform
>> + *
>> + * @param llc_way_size=C2=A0=C2=A0=C2=A0 Last level cache way size in b=
ytes
>> + *
>> + * @return 0 on success, negative error code otherwise.
>> + */
>> +int coloring_paging_init(unsigned int llc_way_size);
>> +
>> +/**
>> + * Init cache coloring data for the cell
>> + *
>> + * @param cell=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cell for which=
 the initialization shall be done.
>> + *
>> + * @return 0 on success, negative error code otherwise.
>> + */
>> +int coloring_cell_init(struct cell *cell);
>> +
>> +/**
>> + * Return physical page address that conforms to the colors selection
>> + * given in color_bitmask
>> + *
>> + * @param phys=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Physical addre=
ss start
>> + * @param color_bitmask=C2=A0=C2=A0=C2=A0 Mask asserting the color indi=
ces to be used
>> + *
>> + * @return The lowest physical page address being greater or equal than
>> + * @param phys and belonging to @param color_bitmask
>> + */
>> +unsigned long next_colored(unsigned long phys, unsigned long
>> *color_bitmask);
>> +
>> +/**
>> + * Return the end address based on color selection
>> + *
>> + * @param start=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Address physi=
cal start
>> + * @param size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size in bytes
>> + * @param color_bitmask=C2=A0=C2=A0=C2=A0 Mask asserting the color indi=
ces to be used
>> + *
>> + * @return The address after @param size memory space starting at
>> @param start
>> + * using coloring selection in @param color_bitmask.
>> + */
>> +unsigned long get_end_addr(unsigned long start, unsigned long size,
>> +=C2=A0=C2=A0=C2=A0 unsigned long *color_bitmask);
>=20
> That function has a too generic name. But maybe it can just be made
> generic - and static when moved into the object that calls it.
>=20
>> +#else
>> +static inline unsigned long get_llc_way_size(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static inline int coloring_paging_init(unsigned int llc_way_size)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static inline int coloring_cell_init(struct cell *cell)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static inline unsigned long
>> +next_colored(unsigned long phys, unsigned long *color_bitmask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return phys;
>> +}
>> +
>> +static inline unsigned long
>> +get_end_addr(unsigned long start, unsigned long size,
>> +=C2=A0=C2=A0=C2=A0 unsigned long *color_bitmask)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return (start + size);
>> +}
>> +#endif /* !CONFIG_COLORING */
>> +
>> +#endif /* !_JAILHOUSE_COLORING_H */
>> diff --git a/include/jailhouse/cell-config.h
>> b/include/jailhouse/cell-config.h
>> index 30ec5d06..8985f8a3 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -114,6 +114,7 @@ struct jailhouse_cell_desc {
>> =C2=A0 #define JAILHOUSE_MEM_LOADABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0040
>> =C2=A0 #define JAILHOUSE_MEM_ROOTSHARED=C2=A0=C2=A0=C2=A0 0x0080
>> =C2=A0 #define JAILHOUSE_MEM_NO_HUGEPAGES=C2=A0=C2=A0=C2=A0 0x0100
>> +#define JAILHOUSE_MEM_COLORED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x0200
>> =C2=A0 #define JAILHOUSE_MEM_IO_UNALIGNED=C2=A0=C2=A0=C2=A0 0x8000
>> =C2=A0 #define JAILHOUSE_MEM_IO_WIDTH_SHIFT=C2=A0=C2=A0=C2=A0 16 /* uses=
 bits 16..19 */
>> =C2=A0 #define JAILHOUSE_MEM_IO_8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
>> @@ -306,6 +307,13 @@ struct jailhouse_system {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 pci_mmconfig=
_end_bus;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8 pci_is_virtu=
al;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16 pci_domain;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Size (B) of each way=
 of the last-level cache where coloring
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * takes place.
>=20
> Size in bytes...
>=20
> And I think llc_way_size is not influenced by the fact coloring is used
> or not ;). You likely mean that it is only relevant when coloring is used=
.
>=20

Yes. The llc_way_size is needed only if coloring is used. I will
rephrase the comment better.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Must be set if get_l=
lc_way_size() fails or does not support
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the platform in use.
>=20
> get_llc_way_size() is an internal implementation detail that does not
> belong into the interface. This is more a "may be probed if 0", if we
> keep probing.
>=20

See my previous comments on the common interface.

Thanks,
Luca
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 llc_way_size;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u16 pm_timer_address;
>>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/afd83f32-7272-d44e-e501-3631b93b7980%40gmail.com.

--a96WqOmZsxC7dkCmsENgdOxjUrPk5Odn9--

--XYqEKXcye7revmXeib6VaALxBYaAetBxp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6LAACgkQI/rjb1Ch
6KsXCQ/9FKIVJiHj8aycPhKD8hnKQ4E0F2ZeO4g4MQRGM+cQxfHY0UWw5WPSEBJG
sgPFk5QwURWkoChZQuLxWJDGr0qBbioXS5Jc21u6MA9TFGqRHFbYyvjAyDNvgc+p
HEkkGPkRK4wku7EL0pVT+XcdeLPMsDKnxPs0V/Spuzk6TLLYPu1e/npHeuocNyvP
h8gJTLXJ2tfMeMmVCFc2xlwxE91RhmeWEwVfwjD70GWDm4+UksED/Jxka4oVoice
eFOz0MYmbodjWjEtXZwyVZ6utwsbxcja+di63hfSxy8gxUoaqPXpkd5yo1L7P8v4
Yf0LkEwmGauWArDYJh5v8+DMRwFJab5EWJyCbktyOZkCJi5kKI1d2AneAEE3nUAm
bPe9Tn20QULkCDhPWg0JSWoi8yiEOEzevfVcPhe3gDGOPWDHPTwIVcEX/RwSg+Du
11lLkSRdjD1Lo20a7RRngE8J6NIoARjkZZNIAm52yKOtglz+llPrOVfoWSOdkG/i
/qjQ+SVvWB0nnS9FstWm2yFeFJAMYFzNSVeP+l178EsKOLb2qEqaXbm81WENJZiD
Fp5zxk28ZMY3Ked8XSpnY1eCnxexTTbt7tQTFSjCorTXxr3fBA+4TdquB2SUzAsy
l7au1NJA8XXV7cFtKfTjW4Rg6edF2bmMQ0gy9ZDV/FPj+PDIJT0=
=3Lvg
-----END PGP SIGNATURE-----

--XYqEKXcye7revmXeib6VaALxBYaAetBxp--
