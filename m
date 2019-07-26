Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFGP5PUQKGQEOEPICXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 38344764BC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 13:44:21 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id f16sf25416564wrw.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 04:44:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564141461; cv=pass;
        d=google.com; s=arc-20160816;
        b=DwCoR1fjJj7kcrpbkRpUI/5HeOMGE6lO9x922WupagqO2vIAXXYvqVpBWqf/NSP3wC
         3l9qymutQlNBtQvRsNEN8QA5v2+EGgQ6wb0UM1w7fl+jb1TDZGNhroP1LdHh33tGTNvG
         c2cUxFVP/xGpCcqyc3m1LuWTRLx72+yd/W6i0FNdUBg/AnMKB0FzwYR39XFkDgm6MlTo
         oMX3qE2mHl0ORHiuG49Jg3+Lt4Q16QZzP0XOxx0dvmpuEbBleLlehQNAD8/ggRNJZ0lr
         sgsZK1PHwOM9WMGrlM1dZTXsjU8G9kfKhNt8THv7zJC3f+7zRbih0Vc6Oli6DQz31XfI
         IT8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=sHU3/tv6kPgeci/P7fqKX/KbY4E/CjnOc6QeChDzzjQ=;
        b=unCmdpSZnM0guZm3NnmhFJYRFpK038ayopgnjqH2Ll0PTNS49NOk/OfRaqLkpk1bw6
         pxpobHy1VatnM9NlmYP6wmHwdNygyX0KfmNteEQReYGG5htEvHIL79c8rsmEjrobAcH2
         Ap6eu5iRatrfmvi4UPUgEUUlcy8kPiDXmhMl7B11d+EwPT2/FS92vtdqUSu26nQf2Tcb
         oZKTPRk05uvgCJcaRlqxGMur5cA8EBiHH9Ed8EfEO9nlj/mHMMwOdXV7/AgpQPW/SLfe
         Oqk4VVPX9tsosftiSFDWLrZc7nFhPfYkPzhjewRHzR4y/cZsiT4A4wzmB+5kcjGRkHVq
         0keg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sHU3/tv6kPgeci/P7fqKX/KbY4E/CjnOc6QeChDzzjQ=;
        b=Ncb6GwSjRehHxjSiPMLw2byeRLHUvOsJr03eVkTtNC2A7HHTD27LJNU2EUPKZcyKcQ
         O3OVqAqndk58qirQlsLZMr6wMuLqUHFpeOPg/oH9Jl0NSeUOAslT91TsIs837ibWfwDP
         TFWh3M/iYQV3wnkYx4uEKJIjaXYcDblR3aK53OOMQk9Ouzc7KKtZkYwZj9H6X10DK/2E
         WaD/h/vUTgtq6escMEum2zpslBro+Lnmt3TEK38OKuXwQAPoqQKIBz3z+11TUXMmjcek
         tzLI4eMfZEmXj8HG/RGsEWwppyIWwSp8gsPcgpNOhvOEHabOJBMPY2Ju5fKq1t3j7hW5
         52WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sHU3/tv6kPgeci/P7fqKX/KbY4E/CjnOc6QeChDzzjQ=;
        b=ufivdnmUWHVyL9gqPjzMOT+FwFCTiMm+inoJ3ncom4k66byVRRO2y/kVHN/hzebJwU
         CPfTIvy5u7e2p+eKdUW6KfbBIWF7ciBf05BBgSeCM1yHK8Py6ALVp+71SvresPMsT29p
         lfFYRnya2T+sOQ3P1hJkHbxTaYh53XCMblraspWMEECXQnIFKe0IHCY2JU2AEsiuYbDZ
         WJDlySV1ihYTXUYiGGaAvAlgaCmXvsecgHH6+uTmBHb9s4qcW7iHFCxApeMP93m0aGPZ
         Kf2JRLpmABpvY0mhi31WK3bjRse6VyCmp7qpfifRAXEg/9TNHOyUQo54K1A7SflkMoK/
         V9BQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXOs7MvyLyTCwbsIc3pt9Pw8tkOL+XK+xwcGavtNbgzKqX+HtB+
	1Hv0KYVLlsnNrbOAdBsuR4g=
X-Google-Smtp-Source: APXvYqwx1oYQkWU0Zg6+06HXG/l4oTPh0Nt/NYI15gtThV9kYUqe4ES+rzhP+GaJTkSWZ//XW4/Z0g==
X-Received: by 2002:a05:600c:490:: with SMTP id d16mr87241239wme.104.1564141460953;
        Fri, 26 Jul 2019 04:44:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:448b:: with SMTP id j11ls15833997wrq.3.gmail; Fri, 26
 Jul 2019 04:44:20 -0700 (PDT)
X-Received: by 2002:adf:e2c1:: with SMTP id d1mr106169759wrj.283.1564141460357;
        Fri, 26 Jul 2019 04:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564141460; cv=none;
        d=google.com; s=arc-20160816;
        b=BiDIwP7IciEGiPSepnKe0KcxA+89EuP4GR/eprs+V7GF7cQsMAy0jwN4Hx1uJ/2AXj
         mKiQuujNw8VsMb0EYe8e2XAKpnhEXkEPm4HmmOL95N4Oz7rJU+lC1iCaNRneNaNoEmtl
         /VAfCuSvDg2HaFazK4zVAWqwm73cnxonx8BpFn3lJyqHtggZ+T8EjiswE6cUBUZMxdOL
         xXqMToKV+vygSK68pXycCRXWBGorl+D1/vCkx8ryGOx1xNgmuP3qFDUuRWjQrkcEfaUO
         q76IASeTCAjAafSbcbzM7k4z8+qMvsyn1vY/Hr+552IBJCQ7dMQQC2U+gBLWtJw+xvav
         4clA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=n8B6ew48nYyTchN6j7PsfmHd5g4O8ftU35w3Bo19Lm8=;
        b=uFH3AHktb3f1qbLPg3Z54uTIVMsKxkN0IgupAgmrJgl/NZ7h3GVqlzKrN/bAYNPBJf
         r8Q2do6XN2HWrtT3C/TXcXDBYP8wZCXPbvNASa7wO+E6pbOuGl61/DlBVnfuMvFCO7XX
         oQ8EcHnYbnomtSfa6Vxu9QEssR0T3QbzcdkqBOON+IVJZIgSZyCvvpuHycpJEeu1eYHF
         nzsqPOMjlMINkUKMZgcPEa63jg0ddRriiIZMDITaUPHOI5KfYmZmzlCS/1dC0vM58oOo
         KfUgcmPKYxKmQb73OJevqxGpd12lIzEuv+S9UPLlxlZE8w8dpZfQdNrlcHzmF6kRopRS
         lksg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id p23si2134151wma.1.2019.07.26.04.44.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 04:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6QBiJ0d027486
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jul 2019 13:44:20 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6QBiJkm010516;
	Fri, 26 Jul 2019 13:44:19 +0200
Subject: Re: [PATCH v2 4/4] tools: update config generator
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
 <20190725171123.9266-5-ralf.ramsauer@oth-regensburg.de>
 <18abfa57-1e5e-45be-fa3a-850713d2ff1d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <67c28269-d9fd-f084-fdf6-c991b73f0e9f@siemens.com>
Date: Fri, 26 Jul 2019 13:44:19 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <18abfa57-1e5e-45be-fa3a-850713d2ff1d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
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

On 26.07.19 02:02, Ralf Ramsauer wrote:
> On 7/25/19 7:11 PM, Ralf Ramsauer wrote:
>> Obvious what happens here: Align the root cell template.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  tools/jailhouse-cell-linux    |  2 +-
>>  tools/root-cell-config.c.tmpl | 22 +++++++++-------------
>>  2 files changed, 10 insertions(+), 14 deletions(-)
> 
> I forgot one thing in the config generator:
>   s/pio_bitmap_size/num_pio_regions/
> 
> But it doesn't break anything, as this variable is not used.

You likely mean tools/jailhouse-cell-linux, not tools/jailhouse-config-create.

> 
> And another finding:
> $ git grep pio_bitmap_size
> configs/arm64/amd-seattle-gic-demo.c:           .pio_bitmap_size = 0,
> configs/arm64/amd-seattle-uart-demo.c:          .pio_bitmap_size = 0,
> [...]
> 
> Those are futile in two regards: ARM64 doesn't have x86 I/O ports, and
> they're set to zero anyway. I'll write a patch for that.

You mean a removal of all those zero-initializations for configs/arm64? Would be
good. Needs to come before patch 3.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/67c28269-d9fd-f084-fdf6-c991b73f0e9f%40siemens.com.
