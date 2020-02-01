Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBPUM2XYQKGQE7FMIU2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA414F762
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Feb 2020 10:34:55 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id l2sf1673196lfk.23
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Feb 2020 01:34:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580549695; cv=pass;
        d=google.com; s=arc-20160816;
        b=0R3kiOr83cY9mHvn2NGe2Y+p4NT5x9QDq4Fu3+YBoUXkaqQ1O1a6lc+2rfA+DPuust
         OfkR6iIkDojJbclX8DOJ2TePFSIdux42yA/6SbqRf6RIq9nx8OC/lDd7HCgzSm0dFMk1
         VnJTGSRuYNSEMfr5TEHzIxqGvkxiFStYGcLC4EbwQnRQ/0zxGeho99byDwXCVgBr+ubR
         xig524sz6/KcD8GAOoISTgFLR/usSEjl6zVSYepLFvMO8L+CoNFEr7dPvAgo0IhFKjZ1
         +yMXZYhcGdOM1EOR4s5yq7i+lWr/weegVz6ECeHF4AUgNPeiOAnx4y8SrBgEsw6Z5URV
         p4gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fenBWTkeGH2PplNqSCcMDT3cKjoRo+6JSPpaqPAtuI8=;
        b=u8PIMWo5FtmFewgUn4ESkij1PxXji3/vxZvx9a7Fw7SAPutwPBNIoB8CqaNlly6z83
         TAJ/iZV2r2kBctmVQOjMWqaTitYMugWT3ZWzQZ2AAZXSRZkoalkFPmj6Er1/uqvpm0Hx
         V6FBrvyL1sggFh3cQsL2eXN+ZKE1nW1QxUw5llEz4SXYvicnWixmC23UhnhuGmN4/4pN
         JejAvecDwt6VNSfJA2qNB79E81TCN2Ow4r1tM8FJQaEFvL0R3zHSrL9i8/hLxM0Ke5rw
         7wfd7bIo3MWUYyEB08pV3TZuz8T/P0drcbXYK9nvujxF9UJfCj/oD+xcnfhMb580n8Go
         3g7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Y7f5JCCA;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fenBWTkeGH2PplNqSCcMDT3cKjoRo+6JSPpaqPAtuI8=;
        b=QFtrR377HbdyGhAybaAnu+pzzANvpqw8Mi61t6PfVbEX/I4H5zAt/vaX98ItwPwC5U
         yRCApwSv+3j2qEJRcqOUDtv81WihWgfAixacVWGMelv1aYgP6V6513dhZhCO2VhKb30M
         Erp4YcUZClw2657MHMrC8KQF53dPwnLoI+RawPwajLxbNHx3MkU/05VRWI8+q7A2x58P
         pwdP7tHQUwnnYbDVK1tkECepOGWWwQh0GEkgkjeVTWUY5ygHwYW2XVLFz/rSD1Y9ANof
         6vWh4aPiAXj7fDm0LfojL+9Dwh6tWNullh+B2X6rkp215/3PJ9I7PXWjnWau9MWcc7NK
         itDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fenBWTkeGH2PplNqSCcMDT3cKjoRo+6JSPpaqPAtuI8=;
        b=tKwFcc0i14NDFYyr00kSgKv7y1Tzzs/P8Ok6NBvdFklp4DTn+R7jKtN+95tQ2oZRRC
         4aDN7Iwj5BwRs3YBdw3aCu0SGxnTi0w5TQuL3suTryyz15QbrUIapCy4zabq1WZz4beo
         uPijhO4ZmLNm1ZXZtR5QoJf6jPRHoLE+VkOEIobmPNBKC3nfvTftpSL7yHldjOWB8qdJ
         l3+YpEr5kLMtOsCk7PQS6N1n2F5Nj27do0N20/CnZAOl4ip2XukiBXxPCfldwMTe9qKg
         sEsbD03uhJXRBf2NBaPj7nRh2/w4d9UD6cmbXkpv7JbOJOoJtBeFExCurKfXWnVK2z0h
         BUYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2LEoWcRUoVJvGW9pz33ch+4kQ01Ic4S3/kLVVN85HY1e+apVh
	vmEyE0RDkgQjgK1pUyAize4=
X-Google-Smtp-Source: APXvYqzUbomOZDDrSC2pQTH5+Y+tqjjMbUXgHDYhGFu0XliHzlmTGbyOCfjYf1j283R++y6dx/Dylg==
X-Received: by 2002:a2e:8907:: with SMTP id d7mr8698758lji.71.1580549695161;
        Sat, 01 Feb 2020 01:34:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9516:: with SMTP id f22ls555800ljh.2.gmail; Sat, 01 Feb
 2020 01:34:54 -0800 (PST)
X-Received: by 2002:a2e:8745:: with SMTP id q5mr8531168ljj.208.1580549694408;
        Sat, 01 Feb 2020 01:34:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580549694; cv=none;
        d=google.com; s=arc-20160816;
        b=vmezlyGGQ6Ku5buwVeIQc73eDmgvw9wN9zi0QlA4DC3xSeFxoBN5WbTDxBNRB3yA5R
         AUZIZO2M8GT3yVrsGtmPSqnrKBjXkLFe8hKtA5m7wXU7dIZ0/IEuvFxl5mJw17SJqyI9
         5ofT36sageqea4PKbAFhNGH/hnU2DEM3Nc8PATmzO7nH+xIuqnfYs/Pb58+Ilfj1eGeR
         2nReoHw3VK3nwRLBeHjwWm8ib9g2rwghc4dkUlRyreVqBU0MzIS5K+McqUMrlPFaMttp
         j8UIkiHWZAA/28Qa8xgw4jzCa6GQ3H9pV1LTY2wT08bxij9lFy+kxLUAaLuWIYy89T0Y
         jZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=eaMaT9iZT4/4glExapp/Oa0ofDgAHoq/0lTclr3Ahyk=;
        b=Xo6UEGQR/0hGQ7xeF6lNCQQ5RpnnnW2BkwwPppBq8mW0c1ghqX1fkDMic5QeCpi6n3
         6hhXEUD8dFHr3GCcZzG7WrOJIvaNyCFIZldIM3MvFXjh6Ie4Yr+WllDLwoX5n6sUG87N
         HCV4r3RMO9kKEQcTlrmd4mt5EUnbMF0lCDNJHMjeB4/Ekbjmi0OssyPxRrpHbDWnPJdb
         Vj3h2+cyYhrzJ91hKiUPbAa0bFMKwSj2zauCDz7APRmJ9CXlvvRWafK5VOs9dO0GadRR
         qMLnFZXuGtkPMZXTtJXLFssnFsKidxej3uT4TlbLEQ7PIdO3Nbjb1wEc2tHyKi/GYEn3
         DNQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Y7f5JCCA;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id o24si634790lji.4.2020.02.01.01.34.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 01:34:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MTPvz-1j5l8c0Ash-00SLkV; Sat, 01
 Feb 2020 10:34:53 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
 <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
 <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <251365ff-7d39-451c-2b85-e6be4567d3b0@web.de>
Date: Sat, 1 Feb 2020 10:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:996w8QTetjSlA8P1yfoUCnr2gv6j4PSdBNDQUdo3kaqPKCw0JQb
 IgG5Q9jG4LeW4pdBGMH+eH0B6zALyImNablZVvQsy7y/+iWVOesdRxmomF/X2xgJoTpTPyg
 UO80zSgdGd+lBj/73pn4D0EPx7lgv2ZV1RRnsUhqf7b5NhmlO4E9iC2VSNJchRIgJBG0Jty
 VcifYhDohwSfsu1eCefxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y24S0ANsh6w=:FgXZgj0avCRibQPWuN+QWf
 gOHxMPRL9zGXt6tkXQf3IcJqKXNcGGSr54QA3CqBvLx0YIxeTWDV65ptyYcaFWAR9gK3SePBS
 T/0xKVB4qsC3vY8rIY+syoVllUDqjDEavSMGps7nU06HjUOD1P4y5G8qa0th4ErXlCm4KTT+F
 jEKeuSWog0FAarJ8oCS8/NhrhbppMdHPwWhCUjnvRQHTcicUkdtmFBm+CjrVITsBWMu3LdYOw
 CRCZv2nz7eCxoHRJQksVQ7Kgne+aiksApJ4t5nMxxHhDN26DJetaA8b2LyIaMNHzChdbTuR0E
 +a48vSJvG6CRrEy8mWifB9lJ2ylPmlJbwrWETN+TssjVMhx8Dax0LheoyWVkSQQgHrPeN0PCd
 HO7Xm2JKPWi4v0ABqPimrhek5VfpWLRdeOkf2Pb6T0spOxfjxVFR1djTBOBHfUiPfq+G6XFLX
 ktfC+Bvolj9KoxQI48DmO+8TwZkRPp/3ZRKD0cEkeERJ52jb5FAK7RuysM504CR1JqRdPPnur
 j49AdV1zHAY3/9ze2fP3u7vmYZCM+xJygxhpy3M+KFvkeunIhbGhYN8LXgh92zYYNXp1CtvS+
 QUcKA+uPVMz+WS7YSv6WjgLaNqEJEeYfi2WXZzR0aZla1GaUq3FtaFr8bf7dBMvXSh6V7YY7V
 t5sD5DKw6UP8QIwxT8MtwEqiQtkNhr0IYwFxUvDzIIMxq2Git2IdN6WYvAm324NE0+EE14X1j
 d1d2CMkAECPnCIuTAEX6pwxsndAyDbQt4LYs6ihqn2Pi2vGOkxg/qMdg6uW3KOMMeuPdIkaBv
 7/l499BS+RJg7pdc4Rm8kXXXToLjkBaeSZRaitlowa0eQlz4WQSSpjEwwTt3bgwAg8b7snSP/
 Yiyde7d1UYbtVI0L2Q73wzw6g7xHwK1w4gp+OOopOWnnFf53nl1V1CoDn03LY6FClTl6LzeZe
 KfHzdRWw9HbyiYmSnGQo0iTc7iQMsMmY1pGsFFPE8rCPzIkMPjDTbnI9FNtZ9xSnyxSaURwPR
 knYn2fQbS9F2VEUsi9HpLzJDtk9a/70bwk4l+abt6qV8sra8us9DnIWUgjhtlwvXjz2X1KSCv
 OhRauUhHQy/KnIffAATTUm14qE5E8qGBFXt4n8SUpxJtDriLnob66K6prqBiUE2iErvYf3TeH
 khQM9Gm7UWbUQBiOHEEObqtoM6Rm8+D4Pl/v68nEoHbT0/KOyzWD7thvAktze6Z+pXqIx5Di9
 Keo0RiNa5HxovkWwT
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Y7f5JCCA;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.01.20 22:00, Saroj Sapkota wrote:
> Thank you for the prompt reply Jan.
>
> ##>This means I have to compare jetson-tx2.c with /proc/iomem addresses
> and change if there is any deviation?

Yep.

>
> ##>How the address for inmate is allocated, its the spaces of system RAM?

That's what mem= or device tree reservations are for: Keep root Linux
away from some memory that can then be used for non-root inmates and the
hypervisor itself.

>
> ##>where and how can i find the .gicd_base = 0x03881000,(.gicc_base,
> .gich_base, .gicv_base) addresses of the board?
>

Check the device tree of your target.

> ##> last thing how to define .irqchip; pin_base and pin_bitmap?
>

pin_base for the first gicd is always 32 (first SPI). The pin_bitmap of
the root cell should cover all possible SPIs. If those do not fit into
one irqchip, add another one with an appropriate pin_base.

For non-root cells, you only specify the SPIs that those should "steal"
from the root cell.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/251365ff-7d39-451c-2b85-e6be4567d3b0%40web.de.
