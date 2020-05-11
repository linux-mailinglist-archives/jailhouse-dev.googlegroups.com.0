Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLWK4T2QKGQEFXERKTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 885BB1CD61E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 12:13:03 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 68sf3354562lfj.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 03:13:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589191983; cv=pass;
        d=google.com; s=arc-20160816;
        b=S+qlWseTOY1lX/gMnkraAuR6WBW4ojfKVJBFYdUtBk6dGezQ8Sh8hG01ptPHlxpWM7
         ig1DeAsKxQnVLLmbN7gMxzsK0ZcRb1EEZwDZ7v11CMU3nk0WPb8EVvsV8jmgJ2B0MxSc
         jiHsB05/RgUA7duzt6GmsdHykTKoCjStgGJRPzdpukxT47sg0KdZcpLO4CTncUQJY1Ne
         RNH2e7XMGymdNQqhZ3U63tZHFXdyUZQlFxiMcYAdz9HWtQTJsHAaNkI++SBcWTRFdE9S
         iRdbgzf1OQLbAnvKS9ML9TyGoeE2RGK1T/oyyyHQ0AlqRHAlWB+thrhKELSbVFE9svYo
         940w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Dilc20H/dyncgoRfwN7hLcns3PqbpOApPrjNwINdID0=;
        b=JoD3WEnU6BbrBdPUtL+TlozIPJIf+H3bRFhmd2tSsDsCqiPVPdIwJOQUoXm8QyffZH
         D+KBQKQU+WCGh0rfkfumchZ951hKaz/4tkSMzgVF1msRpAEj1AJuXGDtj8Gdw2DwFahU
         GrgMkCXPDrfg4Lxgkzd/tdI/KByf1fUfWJqxcR9fYxJekMIPx5v49wgdqm2N7pMNlIWE
         S3s77Wjy1wiWMuDsX1bMhVih9PFRtfV2iC81a1k8TCjuSmVVYOwillXZsfokHySFJS/m
         kDvrmIUzliMYZHNSMRSqy3/aomuWtptaO/EgRQ1K9w8dDRynIaBan82OTWYRWljBH/s6
         4+0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Dilc20H/dyncgoRfwN7hLcns3PqbpOApPrjNwINdID0=;
        b=Fv3/JMk2Npj7zvZwYu/P08iUkj7fT7lxr4kOeXcRvkHQhg5FW9lMyJ84lCJjToCQCj
         ZjAa4ECBLPt8UPjeAMaEYlXG0/yKjPmztMxkr9O6FdSEkcIh2XCk63vUDMBCAAZapYr3
         2nbOEJBmKiP1ujz0sBhoi/PfLoIRRw7H62qQ3lEaU5X2Kr4yHgsUZUwGa/uxMsHB10V/
         p7TleP0oWEdejQT4Rzbmq9GnTJXw0PVEkUQ27l2OkeQe+mH3NT77KdENkJCDaaIev5fC
         UIpD6urMciygCEDr80NVicYIAS5PX1+O2WbLDGS6O0bkpLnnnaUbs16qU3UG+P2MTftY
         QezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Dilc20H/dyncgoRfwN7hLcns3PqbpOApPrjNwINdID0=;
        b=iSa7OqIpYEwQkMUQvOSesari15kwGqAcMaJcssdQiJ0228Hkx29Lx8bnlIYspC5T+d
         9XDSOBcv6vMh74rE2r/yEmc3LGwEAcx8wzUysZXQEJCPa0oH5ZXEQzvkLHfFDYMxBttJ
         nOiMbVA6CbPJEPcUlOYYoAy8A5izf6YWJ/jRaq0ieDKWXiFQhlizfYo3ou1R6J1f2gou
         zG1obn78zHaQrGdCY+56Uf7aXOHfvLw3rrNAuYx8nVW3qACNGfzWCbkHkUB8XPulRr1s
         Gu0vRu49JzX+FQ++r7AjGTk2LFck6B9OsdBN9UZUyc/Az3mQ+pqJFneEfTvGs60lVX/E
         jKKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533HCU0QqNNOHE29CnLt+Gm+ajxUUmrJmGDJUdAxAXJGhm5zAHPU
	2+3wi+7fGqO/GD3Q4qSCpno=
X-Google-Smtp-Source: ABdhPJxTFCazs8CnggmreKhCjXBlBLnjpwb9pyepeinEC3BgtELt1mMSdsJzxgUwLwc+1y790LsqAw==
X-Received: by 2002:ac2:5de6:: with SMTP id z6mr10297270lfq.18.1589191983017;
        Mon, 11 May 2020 03:13:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a12:: with SMTP id h18ls2222743lja.1.gmail; Mon, 11 May
 2020 03:13:02 -0700 (PDT)
X-Received: by 2002:a2e:5847:: with SMTP id x7mr9648809ljd.61.1589191982141;
        Mon, 11 May 2020 03:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589191982; cv=none;
        d=google.com; s=arc-20160816;
        b=GZwHPskpj3C7kpP6LgP2UokVteXC8hQ7ZugvUvCmOtDIfJXWW85e0m1t3SxaONRLUv
         uv93U0gt6TU80EVICxvKkXe4LhBch1AtAwJX36axrRnl+CUr+F2DfRMCiCKvoisYGERw
         EXkdIqQ5BLgAb6gxNoRoUyvtOYVGDSndoAqS7bwn2seIBGEr1zH4o1OMteldgOakz8AT
         BEqqZUz1BadTO6V2+NHQCzBwoIDlun18ryHbu+tLmdeDHjm72GoWLuMVJA2n6QJ8NXpX
         23yO6gdfYPFQkSsRUP3Ak+vQ1R199efdbQO4YSBaeCoH5ubqyoYe3EB8buonbG+lEtfH
         KmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xdU+83PqK3fo5sIYc4t3pkAANwfwhl2Pi45yYlSVt/U=;
        b=ixeF2i8Mub2y6MNDTf93IBT7QY8iiGUTnwTSyo6Yo00V+54f5FkRm8p+4IEsBos2sG
         FOF6wlunVdtk2gsTRo/+o5eqxMWXLiD/qOttjIeH30SjOQuyVSm/nMC1d0tvdyxtcQZ9
         9EJaI3+f8RnARNOGO/2u/Y3YxA8BUY+I9kJMGrU5AtbzV7SlJ5T/iq4zYNok55pC7C/7
         1/vMuSb6ABEEec+b0zIPMVdynrtj1ezVnLrno14T15WMiLVbL4tRH8vxtwBOJXuRfNxu
         yp6ngvWcq+Qc7nWSjj4/w9PelvU6oI1YWNWVpurV/pxtEy3OBbvriTSJIQPwtZ/fzDCM
         kCWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q9si512220lfo.4.2020.05.11.03.13.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 04BAD0cM001957
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 May 2020 12:13:00 +0200
Received: from [167.87.5.144] ([167.87.5.144])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04BACx6n021809;
	Mon, 11 May 2020 12:12:59 +0200
Subject: Re: [PATCH v2 2/9] hypervisor: implement
 paging_create/destroy_colored
To: Luca Miccio <lucmiccio@gmail.com>, Marco Solieri <ms@xt3.it>,
        jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-3-ms@xt3.it>
 <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
 <2146f95d-2c71-db9d-810a-764f1c68d81d@gmail.com>
 <e7c7a7c0-48df-0ebe-0d2d-7715417ee93e@siemens.com>
 <216f41f3-0254-a746-8be2-d2cf45550f4a@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <70fd7d1f-1a0b-7a33-a3d2-1f3340e2fc23@siemens.com>
Date: Mon, 11 May 2020 12:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <216f41f3-0254-a746-8be2-d2cf45550f4a@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 11.05.20 11:02, Luca Miccio wrote:
>=20
>=20
> On 5/6/20 6:51 PM, Jan Kiszka wrote:
>> On 06.05.20 18:42, Luca Miccio wrote:
>>>
>>>
>>> On 5/4/20 8:32 PM, Jan Kiszka wrote:
>>>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>>>
>>>>> Add functions for colored page creation and destruction and initializ=
e
>>>>> coloring on the platform.
>>>>>
>>>>> The story of the life of a coloring page can be summarized as follows=
.
>>>>>
>>>>> 1. Bits in the address that are useful for defining colors are
>>>>> computed,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 and used for all mappings. The page size us=
ed to obtain the lower
>>>>> limit
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 is assumed to be aligned with the `PAGE_SIZ=
E` constant
>>>>> defaulting at
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 4KiB, and also as the unit for the mapping =
operation, even when
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 consecutive pages would be possible.
>>>>>
>>>>> 2. The colored regions can then mapped with a new paging function and
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 destructed with the old one, because `pagin=
g_destroy*` acts on
>>>>> virtual
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 addresses while coloring happens on the phy=
sical ones.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 Paging_create has to handle the remap to ro=
ot_cell too when e.g.
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 destroying cells.
>>>>>
>>>>> 3. The colored unmap function is instead used only when destroying th=
e
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 root cell mapping, since we assume that the=
 root cell uses a 1:1
>>>>> mapping
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 for memory regions.
>>>>>
>>>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>>>> Signed-off-by: Marco Solieri <ms@xt3.it>
>>>>> ---
>>>>>  =C2=A0=C2=A0 hypervisor/include/jailhouse/paging.h |=C2=A0 11 ++
>>>>>  =C2=A0=C2=A0 hypervisor/paging.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
155
>>>>> ++++++++++++++++++++++++++
>>>>>  =C2=A0=C2=A0 2 files changed, 166 insertions(+)
>>>>>
>>>>> diff --git a/hypervisor/include/jailhouse/paging.h
>>>>> b/hypervisor/include/jailhouse/paging.h
>>>>> index 5513c4ec..032a3a04 100644
>>>>> --- a/hypervisor/include/jailhouse/paging.h
>>>>> +++ b/hypervisor/include/jailhouse/paging.h
>>>>> @@ -267,6 +267,17 @@ int paging_destroy(const struct paging_structure=
s
>>>>> *pg_structs,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long virt, unsigned long size,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long paging_flags);
>>>>>  =C2=A0=C2=A0 +int paging_create_colored(const struct paging_structur=
es
>>>>> *pg_structs,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long phys, unsigned long size,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long paging_flags,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long *color_bitmask, bool identity_map);
>>>>> +
>>>>> +int paging_destroy_colored(const struct paging_structures *pg_struct=
s,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long virt, unsigned long size,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long paging_flags,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned long *color_bitmask);
>>>>> +
>>>>>  =C2=A0=C2=A0 void *paging_map_device(unsigned long phys, unsigned lo=
ng size);
>>>>>  =C2=A0=C2=A0 void paging_unmap_device(unsigned long phys, void *virt=
, unsigned
>>>>> long size);
>>>>>  =C2=A0=C2=A0 diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>>>>> index 876f1521..e8f741c2 100644
>>>>> --- a/hypervisor/paging.c
>>>>> +++ b/hypervisor/paging.c
>>>>> @@ -5,6 +5,8 @@
>>>>>  =C2=A0=C2=A0=C2=A0 *
>>>>>  =C2=A0=C2=A0=C2=A0 * Authors:
>>>>>  =C2=A0=C2=A0=C2=A0 *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>>> + *=C2=A0 Luca Miccio <lucmiccio@gmail.com> (cache coloring support)
>>>>> + *=C2=A0 Marco Solieri <ms@xt3.it> (cache coloring support)
>>>>>  =C2=A0=C2=A0=C2=A0 *
>>>>>  =C2=A0=C2=A0=C2=A0 * This work is licensed under the terms of the GN=
U GPL, version 2.
>>>>> See
>>>>>  =C2=A0=C2=A0=C2=A0 * the COPYING file in the top-level directory.
>>>>> @@ -14,6 +16,7 @@
>>>>>  =C2=A0=C2=A0 #include <jailhouse/printk.h>
>>>>>  =C2=A0=C2=A0 #include <jailhouse/string.h>
>>>>>  =C2=A0=C2=A0 #include <jailhouse/control.h>
>>>>> +#include <jailhouse/coloring.h>
>>>>>  =C2=A0=C2=A0 =C2=A0 #define BITS_PER_PAGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (PAGE_SIZE * 8)
>>>>>  =C2=A0=C2=A0 @@ -438,6 +441,153 @@ int paging_destroy(const struct
>>>>> paging_structures *pg_structs,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>  =C2=A0=C2=A0 }
>>>>>  =C2=A0=C2=A0 +/**
>>>>> + * Create or modify a colored page map.
>>>>> + * @param pg_structs=C2=A0=C2=A0=C2=A0 Descriptor of paging structur=
es to be used.
>>>>> + * @param phys=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Physical ad=
dress of the region to be mapped.
>>>>> + * @param size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size of the=
 region.
>>>>> + * @param virt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual add=
ress the region should be mapped to.
>>>>> + * @param access_flags=C2=A0=C2=A0=C2=A0 Flags describing the permit=
ted page access,
>>>>> see
>>>>> + * @ref PAGE_ACCESS_FLAGS.
>>>>> + * @param color_bitmask=C2=A0=C2=A0=C2=A0 Bitmask specifying value o=
f coloring.
>>>>> + * @param identity_map=C2=A0=C2=A0=C2=A0 If true the mapping will be=
 1:1.
>>>>> + *
>>>>> + * @return 0 on success, negative error code otherwise.
>>>>> + *
>>>>> + * @note The function uses only 4 KiB page size for mapping.
>>>>> + *
>>>>> + * @see paging_destroy_colored
>>>>> + * @see paging_get_guest_pages
>>>>> + */
>>>>> +int paging_create_colored(const struct paging_structures *pg_structs=
,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long phys, unsigned long size,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long paging_flags,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned long *color_bitmask, bool identity_map)
>>>>> +{
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 phys &=3D PAGE_MASK;
>>>>> +=C2=A0=C2=A0=C2=A0 virt &=3D PAGE_MASK;
>>>>> +=C2=A0=C2=A0=C2=A0 size =3D PAGE_ALIGN(size);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 while (size > 0) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct paging *pagi=
ng =3D pg_structs->root_paging;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_table_t pt =3D pg_st=
ructs->root_table;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_entry_t pte;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys =3D next_colored(phy=
s, color_bitmask);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (identity_map)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=
irt =3D phys;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
te =3D paging->get_entry(pt, virt);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (paging->page_size =3D=3D PAGE_SIZE) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 paging->set_terminal(pte, phys, access_flags);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* Loop until 4K page size by splitting hugepages */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 err =3D split_hugepage(pg_structs->hv_paging,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging, pte, virt,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging_flags);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pt =3D paging_phys2hvirt(
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paging->get_next_pt(pte));
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }=
 else {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pt =3D page_alloc(&mem_pool, 1);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (!pt)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 paging->set_next_pt(pte, paging_hvirt2phys(pt));
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
aging++;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pg_structs =3D=3D &hv=
_paging_structs)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a=
rch_paging_flush_page_tlbs(virt);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys +=3D paging->page_si=
ze;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virt +=3D paging->page_si=
ze;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size -=3D paging->page_si=
ze;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>
>>>> Isn't paging_create(...) the same as
>>>> paging_create_colored(..., color_bitmask=3Dfull, identity_map=3Ddont-c=
are)?
>>>> Same fore paging_destroy. This duplication of highly sensitive code mu=
st
>>>> be avoided.
>>>>
>>>
>>> Actually paging_create_colored forces the usage of PAGE_SIZE
>>> granularity. Considering that next_colored can be "bypassed" if we use =
0
>>> for color_bitmask, we can choose between passing 0 or full as
>>> color_bitmask if we want to avoid executing unnecessary code. So I thin=
k
>>> that paging_create should be the same as paging_create_colored(...,
>>> color_bitmask=3D[0|full], identity_map=3Ddont-care) only if PAGING_HUGE=
 is
>>> not set in paging_flags. Am I right?
>>> If so, I think that we can integrate the coloring part into
>>> paging_create if it's ok for you. This, of course, will require
>>> modifying all its occurrences.
>>
>> You can provide a wrapper if the common (non-colored) case would just
>> mean passing in common identical additional parameters.
>>
>=20
> Yes. You're right.
>=20
>>>
>>> On the other hand paging_destroy_colored does not seem to be the same a=
s
>>> the non-colored version. As I said we need to use PAGE_SIZE granularity
>>> but looking at paging_destroy, if I understand correctly, it checks onl=
y
>>> if the size to unamp fully covers the hugepage. So I think that if we
>>> try to unmap a colored region bigger than 2 MiB (page entry size after
>>> PAGE_SIZE if the latter is 4KiB), the function will not split the
>>> hugepage. Correct me if I am wrong.
>>>
>>
>> If hugepages can be used or not has nothing to do with whether coloring
>> is used or not. It depends on how large the strides are. If they happen
>> to be wider than the smallest hugepage size, it would in fact be
>> beneficial to have a generic implementation. Can't this already happen
>> with 128 colors and 127 of them assigned to a single inmate?
>>
>=20
> Actually, I didn't get the point here. My concern was that
> paging_destroy does not act *always* on PAGE_SIZE granularity. If we
> need to unmap colored memory with size > 2 MiB from the root cell, how
> can we do it with the current implementation of page_destroy?

My understanding of the difference between colored and uncolored unmap=20
would be the same as for map: The difference is in a stride width >=20
PAGE_SIZE. Necessarily, a stride width must always be page-aligned. If=20
it happens to be larger than a hugepage size, though could be added or=20
dropped as a whole. If it happens to high the middle of a hugepage, this=20
would be just like unmapping hugepage-unaligned regions: the page would=20
have to be broken up. The Jailhouse code should be ready for that. It=20
just needs the additional logic to step according to colors.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/70fd7d1f-1a0b-7a33-a3d2-1f3340e2fc23%40siemens.com.
