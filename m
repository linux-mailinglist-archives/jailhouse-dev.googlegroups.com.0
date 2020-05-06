Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPXZP2QKGQEXMURUJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6961C78D6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 20:01:38 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id m5sf921027edv.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 11:01:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588788098; cv=pass;
        d=google.com; s=arc-20160816;
        b=LJZhB7vfQNuU/3VefuRx0UBWafUQdn9SaetFhxZpnAi4vyARYlcIlfihmIczIs0Huh
         UOsnthbwGp4Xfmo731m98gDYxR/Ao0vA2nny6TPQ89HkbLbfnYPia7nq1Weuxbyv/Xo7
         2xHIVkcDCqD98KYheQnQ5GavS9LwoQmRyAz4lrJKpT8i08kZvX8Wk/uQ8a63mhp0zo3y
         NcbHLMeM6P952dzHXSaSFXJAaEcDJgxq+dXO9fuKNkeYotgpbK8C+Kqqwce6107hM7A6
         IyO3jLQDfSFEKWX8OPFklSV9rBtPxVYEqt/odr2thD8fsA556Ew4pYBmObKypVXm50Aa
         r1Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YXlVjw/LHDwMF3frTFNFqlMS0CGwXBVDVpJvkgLWn0g=;
        b=fiRBxVXJOw0q4C27e3aYLpSnzuq/E5xhzHWlFJ7x0jRqU1Rtqt1wSzitO8zUnk96Dg
         b0ylsxsNfs20uZ/2jXSPGBnBPVVqE8twZ3gSlZ9Mtegn0an5OkShcBfe1qQYqk5OI0Vs
         wIORq8B/CGWea50WYrtWPjbdhe8GHuy0OZw3c+VQOYDAblYZWVscmUa2W/S6K2WQjwHu
         iD/8kkdra+tg5M54dHqnrbEg6dCg+XBsCDLPpihEJOh9Fj+jnABqr4CIfxf1ovtW4oWk
         PHt4V5EJDd0WScvcEq9kAkCXSBwwQMMapS5oALTucXF8/a5befPVagHjZGe9rUgsnxcw
         +z2Q==
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
        bh=YXlVjw/LHDwMF3frTFNFqlMS0CGwXBVDVpJvkgLWn0g=;
        b=hPJlwoX/4G8tNIoblXHst/LCLfKvKVp59fK9mf9hcz2MXSjXOh5dGoTlwevTiQN+nI
         MyiTS0pYUxlADs146oFb2lqYQzjb7k2Oy5P/dNBRxALzdJHVIQLe1PIFaI2LtZ531zG5
         67iq8Zt3P1WuW33KH74yY1P3xv0fU6dKsWSJj8k0Z/18G683MMIOHjMj9tccN1Mv7zbQ
         uPO76RIJp22HT/EAimUI6ibu/D0ZueYE/ukcwrKkAX8ApvmVK0oTX/p/GBTaEvrQimSm
         b6VYh67h+g/omH2LdbNfI/M/LN7kCc5fVwUzhRw0wF2lz5nMACYwi4k3wR1QUetpxtFU
         H68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YXlVjw/LHDwMF3frTFNFqlMS0CGwXBVDVpJvkgLWn0g=;
        b=qXfrFDLs0Gp8ckLdlvozC1eXlE/F/ZyEaY3ZFl6w/SoIN9RdwP38+Vhfc6xnbrg7ZP
         76nSPsWZeb7sbvH2WoYQwVcO4MseE6MMvw6uxfGbrcdSAzHORdfmzpykcKNtoPF2L6PV
         4G3CucLkupPeHe+797Oail7AlnF2ivDH12Q/hzbQ8hokbfSDm232T4iAbGw5VKntgw00
         SV2d4GCGDSKxC6Qjy+6Vb6uGpcYWP/gyZF6LE6XjEXYszPg2tdYRUb9wSdIn/q7/SPFX
         7rGSjRhvs7tuHPSLLOROPVPMMBuxd6a114k3zeEvM5+fGoGoHfVLW0bM4xv2EBoayYWQ
         HUSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYDxHyhqVbUZZ7dB9GhJZ16aGNeSRB72l6+p59IndOWYOzFh1rt
	RNE1Qa0etkz6HQgV81l2vHI=
X-Google-Smtp-Source: APiQypLLOvFKfCuccy7MpHXHkfWSigiYyW4GRV2plb166Hm9K9T0dOpjkveEdNHqbsRaGyJ4t9EcBg==
X-Received: by 2002:aa7:cd01:: with SMTP id b1mr8343619edw.163.1588788098069;
        Wed, 06 May 2020 11:01:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6b89:: with SMTP id l9ls1510344ejr.6.gmail; Wed, 06
 May 2020 11:01:37 -0700 (PDT)
X-Received: by 2002:a17:907:210d:: with SMTP id qn13mr8641912ejb.376.1588788097097;
        Wed, 06 May 2020 11:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588788097; cv=none;
        d=google.com; s=arc-20160816;
        b=nz/oWMBcbjPgNCH5suCBKFqRXGU8NSx3f4qAAsIHrClSmO2+qycGxauRMwLWThOha9
         jj0zjNShKwEOF0JxNQCd1/lciNwO2r7ZwVKVtEdAfcwnWucGMHoE0b6h4SUvlFycmy68
         beUjTvFqMb8xff8FrXPL9uc9OZeM+Yb33xf7K3PEEgPr7KvE0VcZiYaSpkabtHRjv8Jo
         EI4vA6YqZxDbrQbzFZ0zGzRQ7pdWfnG4lTM4y4++6BGOFQzAozybGmJM2cOPxfNeehVM
         rjuZc6UnDGwVI46PaYBGxTZwRTTk+Nod5vimAntlyv6M9a/rN/zEfAQMAIBLRydKtkEJ
         OAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TtKhrtR+355HxfV7vsjNCfS04LGygWsgcTGtrDIaOmA=;
        b=OTOv3y5CT3KOZXKCmBVPJKxzTOzplmNsptc72hzxrjkzOUZS/FITxs7OhJOSLUoOa4
         0egPglMm2zb5AbVc020zzoP5WZSP0tkVW1NstDRjehmsGcrn2UKXMuY0ptmM7YzSvOEC
         rdKfuvATl3K3I1UwBBrzStprjk+DEJvOCHrx//xBDUrKk8bloxErPhShMy/f7qAwVm3c
         22Jo1E9P8WjwuWlcyBLGGDPC+VRJ76UfWQwqcuzuBhYACZSkBLJi3YQ6LBGRTuvNfa7D
         Xyql2XPKAYVRxjMxIYMcarnnIKgqpH2sPJCk4gboGOVogvKKHqtQfXja9sTgrLu9d89x
         YiBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v18si142649eju.1.2020.05.06.11.01.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 11:01:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 046I1aI2002385
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 May 2020 20:01:36 +0200
Received: from [167.87.32.230] ([167.87.32.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 046I1aXY014405;
	Wed, 6 May 2020 20:01:36 +0200
Subject: Re: KALLSYM dependency
To: =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAHFG_=Vnx5ABnpqbg8RkRDxVS9C2X979cfgzFEszcEO6s0wLyQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <17cc7c09-a2a5-5f0e-e51e-5119508e7e9f@siemens.com>
Date: Wed, 6 May 2020 20:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHFG_=Vnx5ABnpqbg8RkRDxVS9C2X979cfgzFEszcEO6s0wLyQ@mail.gmail.com>
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

On 06.05.20 16:01, Fran=C3=A7ois Ozog wrote:
> Hi
>=20
> the symbol "ioremap_page_range" concretely requires
> CONFIG_KALLSYMS_ALL to be defined on aarch64 (not tested on Intel).
>=20

...or a kernel patch [1].

> "ioremap_page_range" is defined by lib/ioremap.o included in lib/lib.a
> and is not an EXPORT_SYMBOL.
>=20
> There is some decoration in main.c:
> RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
> but that only works with CONFIG_KALLSYMS_ALL defined.
>=20
> As I am very bad at kernel build system, I can't enforce the linkage
> of lib/lib.a. I have tried jailhouse-obj +=3D ....../lib/lib.a without
> success.
>=20
> Any idea on how to overcome this?
>=20

I never tried the kallsyms path on non-x86 TBH, and it will likely break=20
anyway with upcoming kernel changes IIUC. So, there will likely be no=20
way to patch (not only for that symbol, see the queue, e.g. [2]) until=20
everything gets upstream.

Note, though, that aarch64 actually has no need for that particular=20
symbol because it already works without borrowing the hypervisor mapping=20
from Linux. The plan for the rest is to adopt that patter, i.e. have=20
relocatable assembly stub that build a small initial mapping, just like=20
aarch64 already does.

Jan

[1]=20
http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommitdiff;h=3D5358fb465b55b4d1047=
21cd3db7d74fe2942ddc9
[2]=20
http://git.kiszka.org/?p=3Dlinux.git;a=3Dcommit;h=3D0ac3cdc541376c838b09dbc=
adf0204696dd084d5

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/17cc7c09-a2a5-5f0e-e51e-5119508e7e9f%40siemens.com.
