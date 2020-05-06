Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAGWZP2QKGQEKN45IWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id D90641C7727
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:51:12 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id p7sf444344ljg.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:51:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783872; cv=pass;
        d=google.com; s=arc-20160816;
        b=z4Ie1zjtYD61UATln9T7mwzpikPc4jYvImLcWS7khx3ZgBHJZQCScjgOUm2hV+x/5P
         ofqw0+7BFezQgPr6bVdhT+Ad/0JSS2TxuxSt3K/iiEs3fcmaD38kOwqMuvLHJg/H/GRA
         QTWmvO3sHxY4MCiBMnoLOumJe1EWf6r7dnoy+DRGgickSEVPxyVtFdIAHSAyZBSgAhUz
         iCkdc3bG4/imPsdWg8celSE85sKY1AC8iLAOBcGCllJ9oegg6JylXPbUVTCv378xsDub
         YeUL6xsAk5LygVJEHYPEqEhEAY1Re4T3rZX6AedEJyAuVI4Ay6JikqL4TIz6fyoO+c0P
         kx4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Ngpt+efjA6Q1lkOsgZSHn+d2osANiml4xcilRwUxiAs=;
        b=uPlFRpdmtKCuvSXYQ18l14xM5LprkpCqx0WnPxorqSZRr6RZhVmuGU/k0spE4l+mVX
         jvQ3pczbtj8Xwd0zvoCqDZWJA9h6zWunBZiV+Fk6upPPC3k8taFCsbYVQ/kVf6oXJ0ve
         xnK+298UiC0r0vs4Uo7Wfnzs0ljkdOw1Ofxg/X0NpFJhEe4IsVLs1j6lcyZpDJpFVwC9
         O868GYQcYaM/XNrzI6Ev+WBv2r6Es616UJBhe/Xg6tIR2VRFDpGAd3KgSfBshYfUfpMm
         pgsFFTX/CaTA5vGFjISYOf40DbcW11D0AJLp+gU4IG9UtMLg+KFJ1cXaAkDqBGFs5FuA
         hplA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ngpt+efjA6Q1lkOsgZSHn+d2osANiml4xcilRwUxiAs=;
        b=moEO6afsenLhGJCifU68441Mk409hyExbGJYkL8QhiFRJhyrN1g6Ih3NYX7h7FPhpX
         Ju2mBTgUWwwITwpgeHbExQVNaYtgjXOSHOdz4U54FAB3CQQQ+6U1/acKquM28GAzYP0j
         W/VSvSupzRVP1PgX2IPAdkZ2AtTA4xkxeBXoJXA9mOAImswiC5IWXBKOe4bDNlMYEpsJ
         jZ94R+ulHhZoYUtDCl9NHTEsz4fpx1v/2pdjLlDvs9LW7QLPBln6zaJ/M8qYW6OKXY4c
         IBzAD5euebz9ex7k2rg2CW5lkjNFOYq0CaEY9T5ga+2G8sY51eOo6+6nNIO8DiUlBLq7
         ccog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ngpt+efjA6Q1lkOsgZSHn+d2osANiml4xcilRwUxiAs=;
        b=iIZ7Z2VBLjzDnLbT2chVBKN29NODnSUKderiNupEzIlq8VXJ2bLpZLG2MuHKCkUSBu
         GoVamJ/p3Ea4HT66Cx6UVa4bZm3ppW22Jvjk90WO8ijsl9fzVaKVik2uW07ug76C5yeq
         v2rxf0ZxcxvFf7ZN4ZPGekmXUfuph0cyIm4mo3c+uIwLFbaPH+1J+vdGWECKYOHcih49
         snutv1vKjtBdeYOtXXZM2GG9G1riL4ICqj9k4PfMHYtpXeC51mjWsgRD/j4CallntH0N
         Es/HKZrCdMWFM+8dGBrOAMe21WBU3gIKgt56vkEeb5GY1qMfHLaz7l7vcZLsZWDbu7RT
         Y9QQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaAtMip+FeAL7Whr1JxUP1TwRwjQ094vr6v8QwvnOnOAtlxTB/D
	wdQNo/3zFl3I/FAjs1a5Y14=
X-Google-Smtp-Source: APiQypL67yl4dCUvERiuHhxAAl9UUn4FM7SN3MWayYC2pk6gD4ghDfcE1wP+U6WOZ/AhEoTHAIE9cg==
X-Received: by 2002:a19:6b13:: with SMTP id d19mr5884531lfa.126.1588783872352;
        Wed, 06 May 2020 09:51:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3208:: with SMTP id y8ls703308ljy.6.gmail; Wed, 06 May
 2020 09:51:11 -0700 (PDT)
X-Received: by 2002:a05:651c:1121:: with SMTP id e1mr5536496ljo.205.1588783871433;
        Wed, 06 May 2020 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783871; cv=none;
        d=google.com; s=arc-20160816;
        b=LNQ6RXSlloOxN/RRT3jdTNp1OE2n7tKbKP4tUFuow+NEQNlnilThRjSasrByFIxIpd
         aj3TvzwXNkVymlYomZ0KC3aOr+x+rHb9y790JcLKL+6flQsFTyxfNsaM5Zdt9fQzSsoC
         dPRmzsXGy58RsPQnYPbIxcDMs8kKAFYbAO3ilEUa7G9SICdPg0QP+kt7arbr7X5LR6nQ
         p1GrZcDsP1lkERoceMDv0FXO5YIxqvn0wX6Aj5rqg4wk9CydlyWnq6xm/4TLbZm4VQn9
         y9GpLTtBgaEjSafKKNFY35IqvMd9qjNeYXc2DjB3AtD41znj0zVP+5pY78PXUGHcWw0G
         J1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ckXEUgqnZAd6RfYrq3uHsaoq8uvpM6j6LymDQL+YnNc=;
        b=qa8EZtBuSdriPHWj8CP5gJgcJK1OVZcoi9VmotofmBeNzA1lnrjDgdwphzJ7OUqybE
         yeC0CCCcSMY6mvVbZdyao2fDkjvwWzhA8o7ttWjYOoBvjqI9gDoISoPxbEF5c0EwwxAT
         pJnysV5nCYjvokw6Is2lsQyGg4Ax8JUAmKsVFjgH26sJRtli+wjUTA0QG5nQ61lgIZcI
         gILg3qbDJmFDBlnyQAPBMH397JoawyEljhunlPQyoKdIa/OnHt7kJXgcJJAFA/6iURgS
         ZLOxRls95ez59MRGG06KFAjY4bRhUVeOLm4WiGMBLA17stm0m6uGMuvmPbd478/9cZYU
         jtMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k13si123557lfg.5.2020.05.06.09.51.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 09:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 046GpA3f021253
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 May 2020 18:51:10 +0200
Received: from [167.87.32.230] ([167.87.32.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 046Gp9dM026516;
	Wed, 6 May 2020 18:51:09 +0200
Subject: Re: [PATCH v2 2/9] hypervisor: implement
 paging_create/destroy_colored
To: Luca Miccio <lucmiccio@gmail.com>, Marco Solieri <ms@xt3.it>,
        jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-3-ms@xt3.it>
 <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
 <2146f95d-2c71-db9d-810a-764f1c68d81d@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e7c7a7c0-48df-0ebe-0d2d-7715417ee93e@siemens.com>
Date: Wed, 6 May 2020 18:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2146f95d-2c71-db9d-810a-764f1c68d81d@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 06.05.20 18:42, Luca Miccio wrote:
>=20
>=20
> On 5/4/20 8:32 PM, Jan Kiszka wrote:
>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>
>>> Add functions for colored page creation and destruction and initialize
>>> coloring on the platform.
>>>
>>> The story of the life of a coloring page can be summarized as follows.
>>>
>>> 1. Bits in the address that are useful for defining colors are computed=
,
>>>  =C2=A0=C2=A0=C2=A0 and used for all mappings. The page size used to ob=
tain the lower
>>> limit
>>>  =C2=A0=C2=A0=C2=A0 is assumed to be aligned with the `PAGE_SIZE` const=
ant defaulting at
>>>  =C2=A0=C2=A0=C2=A0 4KiB, and also as the unit for the mapping operatio=
n, even when
>>>  =C2=A0=C2=A0=C2=A0 consecutive pages would be possible.
>>>
>>> 2. The colored regions can then mapped with a new paging function and
>>>  =C2=A0=C2=A0=C2=A0 destructed with the old one, because `paging_destro=
y*` acts on
>>> virtual
>>>  =C2=A0=C2=A0=C2=A0 addresses while coloring happens on the physical on=
es.
>>>  =C2=A0=C2=A0=C2=A0 Paging_create has to handle the remap to root_cell =
too when e.g.
>>>  =C2=A0=C2=A0=C2=A0 destroying cells.
>>>
>>> 3. The colored unmap function is instead used only when destroying the
>>>  =C2=A0=C2=A0=C2=A0 root cell mapping, since we assume that the root ce=
ll uses a 1:1
>>> mapping
>>>  =C2=A0=C2=A0=C2=A0 for memory regions.
>>>
>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>> Signed-off-by: Marco Solieri <ms@xt3.it>
>>> ---
>>>  =C2=A0 hypervisor/include/jailhouse/paging.h |=C2=A0 11 ++
>>>  =C2=A0 hypervisor/paging.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 155 ++=
++++++++++++++++++++++++
>>>  =C2=A0 2 files changed, 166 insertions(+)
>>>
>>> diff --git a/hypervisor/include/jailhouse/paging.h
>>> b/hypervisor/include/jailhouse/paging.h
>>> index 5513c4ec..032a3a04 100644
>>> --- a/hypervisor/include/jailhouse/paging.h
>>> +++ b/hypervisor/include/jailhouse/paging.h
>>> @@ -267,6 +267,17 @@ int paging_destroy(const struct paging_structures
>>> *pg_structs,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long virt, unsigned long size,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned long paging_flags);
>>>  =C2=A0 +int paging_create_colored(const struct paging_structures *pg_s=
tructs,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long phys, unsigned long size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long paging_flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long *color_bitmask, bool identity_map);
>>> +
>>> +int paging_destroy_colored(const struct paging_structures *pg_structs,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long virt, unsigned long size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long paging_flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long *color_bitmask);
>>> +
>>>  =C2=A0 void *paging_map_device(unsigned long phys, unsigned long size)=
;
>>>  =C2=A0 void paging_unmap_device(unsigned long phys, void *virt, unsign=
ed
>>> long size);
>>>  =C2=A0 diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>>> index 876f1521..e8f741c2 100644
>>> --- a/hypervisor/paging.c
>>> +++ b/hypervisor/paging.c
>>> @@ -5,6 +5,8 @@
>>>  =C2=A0=C2=A0 *
>>>  =C2=A0=C2=A0 * Authors:
>>>  =C2=A0=C2=A0 *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>> + *=C2=A0 Luca Miccio <lucmiccio@gmail.com> (cache coloring support)
>>> + *=C2=A0 Marco Solieri <ms@xt3.it> (cache coloring support)
>>>  =C2=A0=C2=A0 *
>>>  =C2=A0=C2=A0 * This work is licensed under the terms of the GNU GPL, v=
ersion 2.
>>> See
>>>  =C2=A0=C2=A0 * the COPYING file in the top-level directory.
>>> @@ -14,6 +16,7 @@
>>>  =C2=A0 #include <jailhouse/printk.h>
>>>  =C2=A0 #include <jailhouse/string.h>
>>>  =C2=A0 #include <jailhouse/control.h>
>>> +#include <jailhouse/coloring.h>
>>>  =C2=A0 =C2=A0 #define BITS_PER_PAGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (PAGE_SIZE * 8)
>>>  =C2=A0 @@ -438,6 +441,153 @@ int paging_destroy(const struct
>>> paging_structures *pg_structs,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>  =C2=A0 }
>>>  =C2=A0 +/**
>>> + * Create or modify a colored page map.
>>> + * @param pg_structs=C2=A0=C2=A0=C2=A0 Descriptor of paging structures=
 to be used.
>>> + * @param phys=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Physical addr=
ess of the region to be mapped.
>>> + * @param size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size of the r=
egion.
>>> + * @param virt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual addre=
ss the region should be mapped to.
>>> + * @param access_flags=C2=A0=C2=A0=C2=A0 Flags describing the permitte=
d page access,
>>> see
>>> + * @ref PAGE_ACCESS_FLAGS.
>>> + * @param color_bitmask=C2=A0=C2=A0=C2=A0 Bitmask specifying value of =
coloring.
>>> + * @param identity_map=C2=A0=C2=A0=C2=A0 If true the mapping will be 1=
:1.
>>> + *
>>> + * @return 0 on success, negative error code otherwise.
>>> + *
>>> + * @note The function uses only 4 KiB page size for mapping.
>>> + *
>>> + * @see paging_destroy_colored
>>> + * @see paging_get_guest_pages
>>> + */
>>> +int paging_create_colored(const struct paging_structures *pg_structs,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long phys, unsigned long size,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long paging_flags,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long *color_bitmask, bool identity_map)
>>> +{
>>> +
>>> +=C2=A0=C2=A0=C2=A0 phys &=3D PAGE_MASK;
>>> +=C2=A0=C2=A0=C2=A0 virt &=3D PAGE_MASK;
>>> +=C2=A0=C2=A0=C2=A0 size =3D PAGE_ALIGN(size);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 while (size > 0) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct paging *paging=
 =3D pg_structs->root_paging;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_table_t pt =3D pg_stru=
cts->root_table;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_entry_t pte;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys =3D next_colored(phys,=
 color_bitmask);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (identity_map)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vir=
t =3D phys;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte=
 =3D paging->get_entry(pt, virt);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(paging->page_size =3D=3D PAGE_SIZE) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging->set_terminal(pte, phys, access_flags);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Loop until 4K page size by splitting hugepages */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 err =3D split_hugepage(pg_structs->hv_paging,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 paging, pte, virt,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 paging_flags);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (err)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pt =3D paging_phys2hvirt(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paging->get_next_pt(pte));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } e=
lse {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pt =3D page_alloc(&mem_pool, 1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (!pt)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging->set_next_pt(pte, paging_hvirt2phys(pt));
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pag=
ing++;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pg_structs =3D=3D &hv_p=
aging_structs)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arc=
h_paging_flush_page_tlbs(virt);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys +=3D paging->page_size=
;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virt +=3D paging->page_size=
;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size -=3D paging->page_size=
;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>
>> Isn't paging_create(...) the same as
>> paging_create_colored(..., color_bitmask=3Dfull, identity_map=3Ddont-car=
e)?
>> Same fore paging_destroy. This duplication of highly sensitive code must
>> be avoided.
>>
>=20
> Actually paging_create_colored forces the usage of PAGE_SIZE
> granularity. Considering that next_colored can be "bypassed" if we use 0
> for color_bitmask, we can choose between passing 0 or full as
> color_bitmask if we want to avoid executing unnecessary code. So I think
> that paging_create should be the same as paging_create_colored(...,
> color_bitmask=3D[0|full], identity_map=3Ddont-care) only if PAGING_HUGE i=
s
> not set in paging_flags. Am I right?
> If so, I think that we can integrate the coloring part into
> paging_create if it's ok for you. This, of course, will require
> modifying all its occurrences.

You can provide a wrapper if the common (non-colored) case would just=20
mean passing in common identical additional parameters.

>=20
> On the other hand paging_destroy_colored does not seem to be the same as
> the non-colored version. As I said we need to use PAGE_SIZE granularity
> but looking at paging_destroy, if I understand correctly, it checks only
> if the size to unamp fully covers the hugepage. So I think that if we
> try to unmap a colored region bigger than 2 MiB (page entry size after
> PAGE_SIZE if the latter is 4KiB), the function will not split the
> hugepage. Correct me if I am wrong.
>=20

If hugepages can be used or not has nothing to do with whether coloring=20
is used or not. It depends on how large the strides are. If they happen=20
to be wider than the smallest hugepage size, it would in fact be=20
beneficial to have a generic implementation. Can't this already happen=20
with 128 colors and 127 of them assigned to a single inmate?

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
jailhouse-dev/e7c7a7c0-48df-0ebe-0d2d-7715417ee93e%40siemens.com.
