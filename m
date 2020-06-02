Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY6M3H3AKGQESZL62WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2421EBE69
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:47:00 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id m14sf1480837wrj.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:47:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591109220; cv=pass;
        d=google.com; s=arc-20160816;
        b=ABMTUkAkaBSKEy3Qa28yJegKVLOYIxH3OmA3Sp8ol1xeeNekYpAJNjWdlXh4QnMaDf
         qY7OozCeUvajdeRq6EN3v6oj1jwlGoK+z39jprHOoKEyVY+ZTcsKl3ACudcmxHjkFcYQ
         qLNckFub72JNHPeDOBVeAZFXijutpZ9CQqTZzKKLjBG9OP53za0pj9Rjaz182jh33mO8
         W8j4ZMCezeb/0Xt1ZO8mnIzaUny1u+PeSB2b39tz8BX8ZNuBaQbeipaOcLIaKay22gRC
         /xSHjyfVrDj16L34Tv2wqbRyRkdbrTnjx312V6JVEYkdC3vsAVxT10fvXJpkZ6OTBhuD
         rvoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=iU1FYIuCy77raSnwu7GqgwWS5PTMztbrRbsRB+7QZiI=;
        b=TK/zqXr6nuxjhW74Xq5A96nZ1xR5Oot7DA9EsHP24aK+I0LroyaQbSBWdfKZ3SWsqE
         gwSctcQdtivuyMWSb1bdCjqMCuVqTwazb92EZuZL5SJVgmkCixMcathvRryd64BjMuAF
         KfGRFIrWBEDg/GPrr7KguFVdOPyfldwIalfofVdRn+hIkyYDeePmKse34pOzdHZ/Q2VS
         5gj+WozoTGrIevhHvVOiCRFGcDc8ext0afyA7KzOuQeGU7Dr6qA2xHaCcWCZPO12uhgq
         FAO9mjIFLyicgfwPWp/Us4Wy1bpXHLzGJb6Qm6B2m4gB2cMvb/Y3pT+rs3g1ex5hK7pu
         Ud6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iU1FYIuCy77raSnwu7GqgwWS5PTMztbrRbsRB+7QZiI=;
        b=FE0I/NWXN0YvieC/JI/na/CPTdlsp51hdnViQNmSEZcVU066kx+F1gQqnYL+lY3/pt
         CfCM/DnXFyT+KWZ72UddT6q8qXKl/FrBGwVdwgbGjf5AysX0lcdgt+S3i5OX1MNLqi/4
         a34F+/qs85yOdjZLsdFKfhNsQ6t2Zl3KwBHHBnSW3d/G140BxnDc3ijI/TrGAs9RTps9
         gFQrg5/1FFGiqrM4tRS2IsMLZ/VhMXbhCzD/PBIHpwyM/e1Ub4y1uLGkYI+zjYXdRAgT
         c62fvwMW0PNhD+ZRfJX8EaksQz4YDQKFJBScyXns+ArVfRE9lyN5+nYZcI6VKj/g+m6x
         qN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iU1FYIuCy77raSnwu7GqgwWS5PTMztbrRbsRB+7QZiI=;
        b=g+YPuP6/AjjtCxA5EjrK2rNZrgbMK0JdeJ/bF4nKZg8MQezs6sPzzVgW240IBzpxZ9
         6HHwiO+dip3kyDZf/4xpw3twWXuu3styIJ1iqnA0iLEkyznBJ3s6TKJDG+sM30ZLUk5q
         WmVWe89zHpTW2r+l3RCJPrRj6/bhNej/RxUQL9P1DkMDfP6Rh5SkneGzAxknHkBAgRcY
         H+y+jMCKh/TkWDv4QHRQyFSTVearYQHiK3vGBudzTK8i3FKRRK573kxcGNBE9ig8SWRc
         NlJTElovrmfQJ2jmmMYvDpTPr+eSt2YaouqjcbozGPRoYri+smNoLR0B4SDxRPvANfNV
         dJjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WImMX7H8v/ip3LEb/RvcgAuOMMHzDnGx2phYVCBBQkCu53vuV
	ZM2N7sLz29rUPOV4/lyFktg=
X-Google-Smtp-Source: ABdhPJyD26e27t7m3mgAA45s+Ybet6uoYZTuNXUZec7sE7MnHdSYR6x1ydJqhenm8fNRd5aysba4ww==
X-Received: by 2002:adf:de91:: with SMTP id w17mr28925748wrl.249.1591109219922;
        Tue, 02 Jun 2020 07:46:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ce:: with SMTP id 72ls21545324wrc.1.gmail; Tue, 02 Jun
 2020 07:46:59 -0700 (PDT)
X-Received: by 2002:adf:91c2:: with SMTP id 60mr28645529wri.41.1591109219224;
        Tue, 02 Jun 2020 07:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591109219; cv=none;
        d=google.com; s=arc-20160816;
        b=xiorE/y00sOdVcdWi3P3YaE5rtsIGsFEJ8ORScslXObqy0nrlLQDlOWKDCISPRSd0I
         FJ2xsqKMYKxA1dAqIIOyiPW3qRuVqFSJ3+RYBh/KAR2vnEXSBerfQgyZVF4z082ewS0r
         UH6jLsrsYpW1/3IENuG6NNle9gOPVLKnS3sD205aSOfGaq8rpKMR4mIRgMXz2B5eAZ2A
         H0eGMxzl1SF5lOMmweviD/1eSki34RKyabC8mDSIvJ70TFl+tUMZ3D0gwFTQ6zuw0ON+
         rUbFZ+EdjKVZUoeyk/SLBN3ISTdbqOK0rUyvT7t3YZtuB83Vw7a+05f9atw4VvwKgc6S
         FzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=gKd53zr26qRrz8XUFtY/eAmWVbqSOyVEHtov639RK7o=;
        b=rSBCP7Fadpd8bJC7kQis6WsbXYhKry9TOCcKpbdWBgEMUVlObPtRgUhvmrODZeHFFT
         l/nBkuqYj0x+dR3fuQRDgeuwcEJShqoZQvSv7QR2AhCVHV3hqOp6aBVkToS1etOfQgpK
         iPPU6t0LDfAEkg9i4IjPw4faMMpkaCkTOVZ6Tph4h/N8FS3uibHWQtmuPifrbl8kCvUE
         c24tVTXV6PNxoNDIrBEeop/q8upufb7oJmcz0qz0VSnf2DJk6tp4aghU9CGXumZEEw5n
         UpzqyTYecnp/jPVz7rmTmCgq+YdZK+mrxy9k+Qz2UwT8hY8QnTUWUVnLzjn0pB6blnu6
         pGCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z18si460wml.2.2020.06.02.07.46.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EkwLE009075
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jun 2020 16:46:58 +0200
Received: from [167.87.142.254] ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EktOE030607;
	Tue, 2 Jun 2020 16:46:57 +0200
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
 <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
 <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
 <a826d22a-1c54-3962-b42a-085a8df872ea@ti.com>
 <c1c8004d-b46d-fb4a-b4d8-5556ee8b87c8@web.de>
Message-ID: <596d4db3-2af9-df01-3090-dad8c347eb77@siemens.com>
Date: Tue, 2 Jun 2020 16:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c1c8004d-b46d-fb4a-b4d8-5556ee8b87c8@web.de>
Content-Type: text/plain; charset="UTF-8"
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

On 11.04.20 20:55, Jan Kiszka wrote:
> On 11.04.20 20:37, Nikhil Devshatwar wrote:
>> Hi Jan,
>>
>> On 11/04/20 11:28 pm, Jan Kiszka wrote:
>>> On 11.04.20 19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>> Hi Jan,
>>>>
>>>> On 11/04/20 4:31 pm, Jan Kiszka wrote:
>>>>> From: Jan Kiszka<jan.kiszka@siemens.com>
>>>>>
>>>>> So far, any error returned by a function called by
>>>>> pvu_iommu_config_commit was ignored, only reported to the console.
>>>>> That
>>>>> would have resulted in an inconsistent configuration being run. Also,
>>>>> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all,
>>>>> and
>>>>> the former also returned an incorrect code then.
>>>> This is because I have implemented all the functions with return codes=
.
>>>> I have implemented the pvu_iommu_config_commit with int return type.
>>>>
>>>> =C2=A0From the design perspective, the pvu_xxx APIs are written from a=
ny
>>>> place.
>>>
>>> Nope, they aren't, I checked that.
>>>
>>>> It's the config_commit call which is nont returnable, So that function
>>>> should panic.
>>>>
>>>> So, the only place for panic should be either in the
>>>> pvu_iommu_config_commit
>>>> Or, in the iommu_config_commit
>>>>
>>>> Regards,
>>>> Nikhil D
>>>>> We rather need to panic-stop the system in case some configuration bi=
t
>>>>> cannot be programmed because there is no way to roll back from a
>>>>> config_commit by design.
>>>>>
>>>>> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
>>>>> ---
>>>>>
>>>>> I wonder if there isn't a way - provided it's not too complex - to
>>>>> build
>>>>> up the programming during cell_init/exit, validate it at that chance,
>>>>> cache it, and only apply that state on config_commit. Would mean less
>>>>> panic.
>>>> I gave some thought to create the data structures before config_commit=
.
>>>> But as of now, there is no way that exist.
>>>> Following is the sequence of calls
>>>>
>>>> pvu_iommu_map_memory
>>>> pvu_iommu_map_memory
>>>> ..
>>>> pvu_iommu_map_memory
>>>> pvu_iommu_config_commit
>>>>
>>>> There is nothing that gets called from framework, and there is no
>>>> way to
>>>> figure out if the pvu_iommu_map_memory is the last call
>>>
>>> OK, so none of the error conditions can be predicted from the given
>>> config and current configuration due to the unknown upcoming mappings? =
I
>>> don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
>>> entries checked here come from a a cache, and that is built in
>>> pvu_iommu_map_memory where we are able to return a proper error.
>>>
>> All the alignment check errors are defensive programming only.
>> So it can be guaranteed that these functions will succeed when called
>> from the
>> config_commit, except the alloc_tlb failure.
>>
>> I can maintain a free_entries count per device and check if the entry
>> count
>> exceeds that. Assuming that the last memory_map and config_commit for a
>> cell happen
>> in order before any other cell's map_memory is called.
>>
>> This way, we can track the errors and fail the cell creation.
>=20
> That sounds good.
>=20
>> I would still recommend a return value check and panic to track bugs in
>> the entry creation logic.
>=20
> If there is a real risk that invalid configs we can't catch earlier or
> unexpected hardware state can get us there, yes. For all other cases, I
> would rather recommend to sit down, check the code more than once again
> and exclude programming errors upfront.
>=20

I hope this issue is not forgotten, just in the backlog.

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
jailhouse-dev/596d4db3-2af9-df01-3090-dad8c347eb77%40siemens.com.
