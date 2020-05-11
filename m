Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBMNJ4T2QKGQEA5L6XWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D54551CD465
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 11:02:41 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id d25sf1140399ljo.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 02:02:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589187761; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mb2ln8Op8OGY/+cUHkTCKgDcRJa0n5HqQBS60YqbcBPumnOJaHlqy5btuoriSD4csd
         TgYJtyz9vuB0B1g2kq8h+uJdxdKfhHR+0B/AECW5/1/MWm9h0JBzpETiKFuV6pVA2XOY
         MUEUURgiXQPa90eymQ5imxyTwMzfLQdLSLMbJ2blGEpPmnYEDMXWl8hmyu4I+qHJ36q2
         hBmHyp19NaEll218ufTfWiDTrfKg/FE4IKG+mZhksSkjSCAzcsMJ+D0Pm9DY/J8CMRhb
         uJ7zm35XxceucDZuZiYjBXvudXlL/BbAFfUdU1HYF2DmEAC7qGSxS6sHQnAy26nbSoKR
         Y2Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=Tyf6N9pz4hMCTr7jXsxU8fBxSvUsN7L9V6bvBhRP21Y=;
        b=B5NnZ5zLeer//1OZaajKoOTJDZ5w+dKLD0BadGI3ucezXrDsCjq77+7nXEhWfJt3Fp
         DUhx12C6Tn0Opw+6HDijoXgyFNwKD+Y6GRBIw8ewF02/D3VydHhQWqg0PP62/qp8Xg1/
         BoDKtIZVHp6K1nJ1G8zwJCAHUf86eQLaSQOWvtwQZLc8wztt4BLLhpIEKTO+IQ+nDC55
         fViNTMfxvFYPfikddQo8y1/VBDO/RCvPXF7QrWy+xBoFuNQwLuC4uB4KkKDACNtS7yPH
         y+tJGBuimGwZpPZxKX1Q2fJeuFOU+EoOM4IiETOHGSnzF0AyMW8WiHenWmLhD4oT2oxd
         VMDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Btz3PuDB;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tyf6N9pz4hMCTr7jXsxU8fBxSvUsN7L9V6bvBhRP21Y=;
        b=tLNyV/99rfp0VLO/H/Y9zxtOKaiGEmEZEQrt9Lw137SLjUNBhoX6AgRW1aIl2Kz/vq
         hyPEyFox86rFxHe78hbEBvgQyHF/WSJtg1AdBAgVluVOsO5rd8vddpGFJy3IAqKt90Z7
         TV01EoewU5KEHNy41RgMpjV5zgL+L5cbMc0fS7WKro7KDP3b/gvPQdii88agzru6rG60
         t1cpOdU4oqbExGnHBwxQgbnKpfiLU0o+EEV31TG5r/Dy2USjRiduKMF8C9u6hL2Ibztc
         tNKp14p0klyE+zCCwnaPASBjmtRF88zCoxnageFJwk2uJARJ6AVfTJL1bbFIC6jHh8L8
         DL8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tyf6N9pz4hMCTr7jXsxU8fBxSvUsN7L9V6bvBhRP21Y=;
        b=uBdTSqfbz9KMgdBlHRArXq+xPEjomyGbxPTWkMvzAtB2YVqn2KZnSqVFgDcmzyof+4
         SIB0OgT7rL3TVx4FsbPdOSrSVbotbnbm0zuqXE3SJtrBWZ1HBovFiEfmrDVp5h1L7wax
         bwFXEj6PEHL1vEg5h+YLkYxmtSJKZXlXCfgahJFCzBdFeNoNvhxNJP2/c2iZilcx9LyY
         CNS3iKZ9yOfTZ+41wFHvBWYepTApCfPRkDvaAFj9gsITxq6ZUKYDpWuiISZ0GQb3Ezez
         CAn/HKdf/0fc8BSHcuB+o9DLFWrIfg/LCNBrKa5P1T3yZBS/Qxq2wS31uWfsJheqLix/
         JQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Tyf6N9pz4hMCTr7jXsxU8fBxSvUsN7L9V6bvBhRP21Y=;
        b=YmrDchoWwrWYdezkA36MEuMLRBRjYGmYHVR36vXVEPfEvwo/1lTJGZpYPzV+3PcS/p
         kDzguWgBr411bUh0WVwxate84WDX3OyB7cyhZKdXxOC1tIyEV6HNiJanJ6uyai2yPEN8
         AMzv8SmCQ0+hNKC1ZiTaF5odEJcx7Jj8G+h7TvcY/pKtfrlnKtwe7hvUgg5J4/WJi1kD
         aHQsjwdFb2PUIj+Ig4u5MRCOZI8ZnDVgCl9bdi6MNYXOSJT4j3CK8gYB+sUZeiWalu9D
         TYYv/mKYOwx64J8DcgGLN4GhSliLIlyq4NtvyAWZpT1pSEWqwt3YotF1+/MRUq9H9IKn
         hWZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319SgKXV9gXs41EI56wsHfgsDAbfFkPJJVelkaoCah3OzB75Knf
	kE4lFXZ/6WMMwV0l30ahYKo=
X-Google-Smtp-Source: ABdhPJyo1oF7pUyN9VMKjvPOiqHx26EBX+OVi740ZQypl1Kok3ga7MpJcJ79UChsrFbBB0vBP7A2aw==
X-Received: by 2002:a2e:6a08:: with SMTP id f8mr9862679ljc.8.1589187761348;
        Mon, 11 May 2020 02:02:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:980d:: with SMTP id a13ls2186247ljj.2.gmail; Mon, 11 May
 2020 02:02:40 -0700 (PDT)
X-Received: by 2002:a2e:3809:: with SMTP id f9mr9561559lja.281.1589187760597;
        Mon, 11 May 2020 02:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589187760; cv=none;
        d=google.com; s=arc-20160816;
        b=nbVlHFUtvtBLSGTibRP4HB7zm+aRkLhhWTTPhsOQBeHe/lhRBNpqbxV35vsFndFGIi
         fpRiUZpJQbPV6E/PP2qtvg28Kav/oeuvUA8wiPQYZ2wX6M0fXVCIxVkdkzEkTIYvDKnf
         DvxxCbvsUo+UItWiPYE/CuU9v+ZjVZvClUc6JHKe6n/1gaY6PaZw+T3YBEgVBID6nuW/
         kbLZGpclaVHqIbGP75QjZFJjK7Rc7CI5EMP3LzNRt3I/ip1fGY5O0nRX2ZqsUGOV0Lgz
         DiKyl42thCkgipAUijLXMTEHaLki2LYdZ0AMabXxQYOpa4RWCaxU816Gc3uFp9fGVAGE
         3f8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:to:subject:dkim-signature;
        bh=gPa0R4hyoxjtYFQMHA5l8B3P1uKZ1l18lPk8+98y0TY=;
        b=aPL3x+AtVJu9I/drjMVEQu4xw9GgAvIcRm6P25axvIHUwvBOLqResab+L48AIxzicH
         asezIbhJRUnh5PhoNLfKVuJ+QLslWGYYkEVxWYGiIWIAQJaEl1p/CXsjtMXATlxrXh/Y
         vGpOcVBYPktGRinoPLiMdAVhlmQ9Dgl+3JpyzgJ0F1AdUDpfFxxfBJdVOp4UYPxN7VvS
         N5UzOz/+unEO3KZOCodJUHi/U8hSKXAY/FZNXZbCFvzDZS+6gZW4Kd5DX/p6wTUts3dS
         suHymn+crzyA7qaP8aExzz++igkaKMhsbtOre4FatZQOFLrbhCcGzoHhSI96WrfJCRSU
         Uu3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Btz3PuDB;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com. [2a00:1450:4864:20::342])
        by gmr-mx.google.com with ESMTPS id 186si509284lfj.5.2020.05.11.02.02.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 02:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) client-ip=2a00:1450:4864:20::342;
Received: by mail-wm1-x342.google.com with SMTP id u16so18229212wmc.5
        for <jailhouse-dev@googlegroups.com>; Mon, 11 May 2020 02:02:40 -0700 (PDT)
X-Received: by 2002:a7b:c927:: with SMTP id h7mr29943379wml.122.1589187759594;
        Mon, 11 May 2020 02:02:39 -0700 (PDT)
Received: from [192.168.1.101] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id h20sm5488339wma.6.2020.05.11.02.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 02:02:38 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] hypervisor: implement
 paging_create/destroy_colored
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-3-ms@xt3.it>
 <d492ee67-ee26-3533-5ca6-7c9e3e783abf@siemens.com>
 <2146f95d-2c71-db9d-810a-764f1c68d81d@gmail.com>
 <e7c7a7c0-48df-0ebe-0d2d-7715417ee93e@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <216f41f3-0254-a746-8be2-d2cf45550f4a@gmail.com>
Date: Mon, 11 May 2020 11:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e7c7a7c0-48df-0ebe-0d2d-7715417ee93e@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EOkme503DyIwR1JbA6HVDyknAHLGE0jv8"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Btz3PuDB;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342
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
--EOkme503DyIwR1JbA6HVDyknAHLGE0jv8
Content-Type: multipart/mixed; boundary="aZJK42fdfvZhVBOWIdyejYDVjl6PjnqsT"

--aZJK42fdfvZhVBOWIdyejYDVjl6PjnqsT
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/6/20 6:51 PM, Jan Kiszka wrote:
> On 06.05.20 18:42, Luca Miccio wrote:
>>
>>
>> On 5/4/20 8:32 PM, Jan Kiszka wrote:
>>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>>
>>>> Add functions for colored page creation and destruction and initialize
>>>> coloring on the platform.
>>>>
>>>> The story of the life of a coloring page can be summarized as follows.
>>>>
>>>> 1. Bits in the address that are useful for defining colors are
>>>> computed,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 and used for all mappings. The page size used=
 to obtain the lower
>>>> limit
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 is assumed to be aligned with the `PAGE_SIZE`=
 constant
>>>> defaulting at
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 4KiB, and also as the unit for the mapping op=
eration, even when
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 consecutive pages would be possible.
>>>>
>>>> 2. The colored regions can then mapped with a new paging function and
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 destructed with the old one, because `paging_=
destroy*` acts on
>>>> virtual
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 addresses while coloring happens on the physi=
cal ones.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Paging_create has to handle the remap to root=
_cell too when e.g.
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 destroying cells.
>>>>
>>>> 3. The colored unmap function is instead used only when destroying the
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 root cell mapping, since we assume that the r=
oot cell uses a 1:1
>>>> mapping
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 for memory regions.
>>>>
>>>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>>>> Signed-off-by: Marco Solieri <ms@xt3.it>
>>>> ---
>>>> =C2=A0=C2=A0 hypervisor/include/jailhouse/paging.h |=C2=A0 11 ++
>>>> =C2=A0=C2=A0 hypervisor/paging.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
155
>>>> ++++++++++++++++++++++++++
>>>> =C2=A0=C2=A0 2 files changed, 166 insertions(+)
>>>>
>>>> diff --git a/hypervisor/include/jailhouse/paging.h
>>>> b/hypervisor/include/jailhouse/paging.h
>>>> index 5513c4ec..032a3a04 100644
>>>> --- a/hypervisor/include/jailhouse/paging.h
>>>> +++ b/hypervisor/include/jailhouse/paging.h
>>>> @@ -267,6 +267,17 @@ int paging_destroy(const struct paging_structures
>>>> *pg_structs,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long virt, unsigned long size,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long paging_flags);
>>>> =C2=A0=C2=A0 +int paging_create_colored(const struct paging_structures
>>>> *pg_structs,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long phys, unsigned long size,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long paging_flags,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long *color_bitmask, bool identity_map);
>>>> +
>>>> +int paging_destroy_colored(const struct paging_structures *pg_structs=
,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long virt, unsigned long size,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long paging_flags,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 unsigned long *color_bitmask);
>>>> +
>>>> =C2=A0=C2=A0 void *paging_map_device(unsigned long phys, unsigned long=
 size);
>>>> =C2=A0=C2=A0 void paging_unmap_device(unsigned long phys, void *virt, =
unsigned
>>>> long size);
>>>> =C2=A0=C2=A0 diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>>>> index 876f1521..e8f741c2 100644
>>>> --- a/hypervisor/paging.c
>>>> +++ b/hypervisor/paging.c
>>>> @@ -5,6 +5,8 @@
>>>> =C2=A0=C2=A0=C2=A0 *
>>>> =C2=A0=C2=A0=C2=A0 * Authors:
>>>> =C2=A0=C2=A0=C2=A0 *=C2=A0 Jan Kiszka <jan.kiszka@siemens.com>
>>>> + *=C2=A0 Luca Miccio <lucmiccio@gmail.com> (cache coloring support)
>>>> + *=C2=A0 Marco Solieri <ms@xt3.it> (cache coloring support)
>>>> =C2=A0=C2=A0=C2=A0 *
>>>> =C2=A0=C2=A0=C2=A0 * This work is licensed under the terms of the GNU =
GPL, version 2.
>>>> See
>>>> =C2=A0=C2=A0=C2=A0 * the COPYING file in the top-level directory.
>>>> @@ -14,6 +16,7 @@
>>>> =C2=A0=C2=A0 #include <jailhouse/printk.h>
>>>> =C2=A0=C2=A0 #include <jailhouse/string.h>
>>>> =C2=A0=C2=A0 #include <jailhouse/control.h>
>>>> +#include <jailhouse/coloring.h>
>>>> =C2=A0=C2=A0 =C2=A0 #define BITS_PER_PAGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (PAGE_SIZE * 8)
>>>> =C2=A0=C2=A0 @@ -438,6 +441,153 @@ int paging_destroy(const struct
>>>> paging_structures *pg_structs,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>> =C2=A0=C2=A0 }
>>>> =C2=A0=C2=A0 +/**
>>>> + * Create or modify a colored page map.
>>>> + * @param pg_structs=C2=A0=C2=A0=C2=A0 Descriptor of paging structure=
s to be used.
>>>> + * @param phys=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Physical add=
ress of the region to be mapped.
>>>> + * @param size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Size of the =
region.
>>>> + * @param virt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Virtual addr=
ess the region should be mapped to.
>>>> + * @param access_flags=C2=A0=C2=A0=C2=A0 Flags describing the permitt=
ed page access,
>>>> see
>>>> + * @ref PAGE_ACCESS_FLAGS.
>>>> + * @param color_bitmask=C2=A0=C2=A0=C2=A0 Bitmask specifying value of=
 coloring.
>>>> + * @param identity_map=C2=A0=C2=A0=C2=A0 If true the mapping will be =
1:1.
>>>> + *
>>>> + * @return 0 on success, negative error code otherwise.
>>>> + *
>>>> + * @note The function uses only 4 KiB page size for mapping.
>>>> + *
>>>> + * @see paging_destroy_colored
>>>> + * @see paging_get_guest_pages
>>>> + */
>>>> +int paging_create_colored(const struct paging_structures *pg_structs,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long phys, unsigned long size,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long virt, unsigned long access_flags,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long paging_flags,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned long *color_bitmask, bool identity_map)
>>>> +{
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 phys &=3D PAGE_MASK;
>>>> +=C2=A0=C2=A0=C2=A0 virt &=3D PAGE_MASK;
>>>> +=C2=A0=C2=A0=C2=A0 size =3D PAGE_ALIGN(size);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 while (size > 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct paging *pagin=
g =3D pg_structs->root_paging;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_table_t pt =3D pg_str=
ucts->root_table;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_entry_t pte;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys =3D next_colored(phys=
, color_bitmask);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (identity_map)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vi=
rt =3D phys;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt=
e =3D paging->get_entry(pt, virt);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (paging->page_size =3D=3D PAGE_SIZE) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging->set_terminal(pte, phys, access_flags);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 Loop until 4K page size by splitting hugepages */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 (paging->entry_valid(pte, PAGE_PRESENT_FLAGS)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 err =3D split_hugepage(pg_structs->hv_paging,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 paging, pte, virt,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 paging_flags);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (err)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pt =3D paging_phys2hvirt(
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paging->get_next_pt(pte));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } =
else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pt =3D page_alloc(&mem_pool, 1);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (!pt)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging->set_next_pt(pte, paging_hvirt2phys(pt));
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 flush_pt_entry(pte, paging_flags);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa=
ging++;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pg_structs =3D=3D &hv_=
paging_structs)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ar=
ch_paging_flush_page_tlbs(virt);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys +=3D paging->page_siz=
e;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virt +=3D paging->page_siz=
e;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size -=3D paging->page_siz=
e;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>
>>> Isn't paging_create(...) the same as
>>> paging_create_colored(..., color_bitmask=3Dfull, identity_map=3Ddont-ca=
re)?
>>> Same fore paging_destroy. This duplication of highly sensitive code mus=
t
>>> be avoided.
>>>
>>
>> Actually paging_create_colored forces the usage of PAGE_SIZE
>> granularity. Considering that next_colored can be "bypassed" if we use 0
>> for color_bitmask, we can choose between passing 0 or full as
>> color_bitmask if we want to avoid executing unnecessary code. So I think
>> that paging_create should be the same as paging_create_colored(...,
>> color_bitmask=3D[0|full], identity_map=3Ddont-care) only if PAGING_HUGE =
is
>> not set in paging_flags. Am I right?
>> If so, I think that we can integrate the coloring part into
>> paging_create if it's ok for you. This, of course, will require
>> modifying all its occurrences.
>=20
> You can provide a wrapper if the common (non-colored) case would just
> mean passing in common identical additional parameters.
>=20

Yes. You're right.

>>
>> On the other hand paging_destroy_colored does not seem to be the same as
>> the non-colored version. As I said we need to use PAGE_SIZE granularity
>> but looking at paging_destroy, if I understand correctly, it checks only
>> if the size to unamp fully covers the hugepage. So I think that if we
>> try to unmap a colored region bigger than 2 MiB (page entry size after
>> PAGE_SIZE if the latter is 4KiB), the function will not split the
>> hugepage. Correct me if I am wrong.
>>
>=20
> If hugepages can be used or not has nothing to do with whether coloring
> is used or not. It depends on how large the strides are. If they happen
> to be wider than the smallest hugepage size, it would in fact be
> beneficial to have a generic implementation. Can't this already happen
> with 128 colors and 127 of them assigned to a single inmate?
>=20

Actually, I didn't get the point here. My concern was that
paging_destroy does not act *always* on PAGE_SIZE granularity. If we
need to unmap colored memory with size > 2 MiB from the root cell, how
can we do it with the current implementation of page_destroy?

Luca.
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/216f41f3-0254-a746-8be2-d2cf45550f4a%40gmail.com.

--aZJK42fdfvZhVBOWIdyejYDVjl6PjnqsT--

--EOkme503DyIwR1JbA6HVDyknAHLGE0jv8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl65FKwACgkQI/rjb1Ch
6Ku15Q/9Gg26xoodRCbhR2CAXsExp4b+AdeOwgTmMlTprGLj4YsLYks4fK/vJ0zj
bw+XmL0Q8yvntcZVCGSp52p9PgyMkL0knM7YdyiOJgayYzJnD1UFq7ZkI4GOYMkP
04OFSRjjHyhltyICGFUOlVF/kPdHWL65/4d83eYVPrTMgv4xr4UQcTjbETi/qjzH
B2iPVOl4JO89DkvLMyUbe5gAtnQ64Sk042srQVkFMgJRnl3IzZez90GzvZLQ18J3
kpRGeiHQiOlCpO3XyM2BVnF6I2UAncR4mYSeWX2PU5ye8xj4gzsFcGeBaG8+ucW4
rEKGlrB50oZArzPja5AlTXHZ/QItBSXLEsC4FK1uFqb0TQ/yUybgRMrpj0tOXJTR
DAG1o4bDOtTVPyOkHp987MpG7srvAHGB9CvLsGFMzmf2aTSS7ivCIoqtN1GK/uq5
7LlSE2ZVyUjd+K/SQ6ALbOZBF1PY16zI4H5i0YkdiEnH+ae/cZJKZ1Nc/XD7JcUV
Yuo/SbhxbSybjuxG81NdI1vrigHgtsuuAoy7h85GgU7ZRjIBSdO7OaU5GC9JkmxD
LuD3jYwEu/lWC1PZBLxOPs/pyhsURZuWrqySADq5Md06BWkgFGksGYd/PLKhNBKz
rmyA90zGHCOumXNsXNZPb9wSlB4iIQDJAhnUcLNaEzu/hpieayM=
=g9qm
-----END PGP SIGNATURE-----

--EOkme503DyIwR1JbA6HVDyknAHLGE0jv8--
