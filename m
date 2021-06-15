Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQ5MUODAMGQETGXPO6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6643A868C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 18:33:07 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id f22-20020a1c6a160000b029018f49a7efb7sf734279wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 09:33:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623774787; cv=pass;
        d=google.com; s=arc-20160816;
        b=ch/t663RtTEQ6HFWN4pe+Rt0RLHXZNdU0dQrwybsZCggevdLCbCF+cL0RQrplfv/+a
         8Mbj5CCe+agFDDfhmSJJAZOYbRWYMeb5frpR2+yID169+EOmMuZHi/pRi9cFeERCDzGI
         9bSri2V7rRwez8x02zKvPj6uwdDudh4jag/mhwlwhoi/UdfcB9M6EZIBt/mZ90XYw/0R
         9A82tQr9VgBqyNEONieEbQ425QbnFluofmb246dSXSqoAcwMcpBCK4Kzxr7GfrPRuBWO
         2IIzFkAy6Qte7upb9QObIk+xNNNQVuq+p/Y0qIPDE9b5DEzcr4cfAmV/lJyHwlSboUlN
         8MZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KBDzEX+8GGu0y6i5uHm9d4+R+YzMcmSLRmaJPoFkcWQ=;
        b=Yoeso2Tksa40OhBgTxb4/XdD28D/08vHstBOMqVdsfNk90kk4JJVYK0Xkj5jwt/aXi
         7DQPgvNnoBZXLkIPJefLYSfKsZ6vCd0ossKT8TtLfrXjxV5KmEbmcupIuJUgqM0i/8uw
         HoxT3K6nW/jdNoMZFMG1eGIYbNEAcmte3q+3vSz872ZQqZ2ISdY6RLk236minCVc6XLd
         yxyyKOdIhR10lQYvJLnU81snws4ZDZpzAi+L0bBiinLD/8TnIEq6jBSVZ+qJ0XqcfWh8
         oO3sNmtNr2AVuHgABTZC8yJQyjeIRv5mHaXCZhSbnmqFS6qR6kV4y2Ghp1ukFmlObsfm
         h/4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ln/ncSLw";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KBDzEX+8GGu0y6i5uHm9d4+R+YzMcmSLRmaJPoFkcWQ=;
        b=jVFpnFqXsGdjmDO4OuGCFEq/qC95XuXtkkaoS41r+JxaOonPb25NCryEIj9BoDLm3H
         RyQ+s+rxJdVwl3r7aZNluKoV6KYRlcrNBKxpzIzVlPwRihMWzaoqvw8BJaAmwckXZcOQ
         M5wHKvX0Wl5UyFH9d2LgsETKqsYubx7JdPT+47CLjGghcf+EzHXquLMlMW1Hq0FAht/Z
         sYTmwd5YzzUIWw+LUHVhrQzidzwTyS03kZtOvoiBLnpvDmOd81jCJn7ZHfF2NdzO/Q21
         U8kD8IbBHfGi3TQPE6FCmOscwrgdXwyxBX7xlO8jC1JfgnSTw4CDJZwIZiBN8fcK2Fsq
         Scuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KBDzEX+8GGu0y6i5uHm9d4+R+YzMcmSLRmaJPoFkcWQ=;
        b=fXW/nB8LvVoilBfJcmssElyYgFRoz8mmDRP5rAhk0cUa8qkc4x9pA78qceISihYF+E
         D+aa0yG5A862gQbXnbEE+2ssGMz6AsvMUBWkXYtjOlp+dxl8TYs9GeV3OSV3FLmUod6W
         iWCx8vwLnS+OYYlmOuw676EKm663Wk+bIp06PpCQZO3V9Ir1LNCDHsNC44+WJ32vk/jJ
         1m86hFt5UgVe4yTIGSIz+CojHLTPnU+Ta4i+HImLtgL9kNstIHGmU1zEQzJU93CC23VQ
         XSTO6T+IG7rfKt0TQ2zzmrjWx0mfbwktRBs0dP9ZP3BXsCqqxVKBjDK613ChZVS+B7MW
         /3XQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531s0X46bA95bBiVv+KnRtpKIsm9x59kAR/y7RiLhCV44/lnzA20
	T2D9d2PH1y+2tVg+HOh7dI4=
X-Google-Smtp-Source: ABdhPJyvyLgs8HJmWiKjtWawyW2gMao4D3sHS/2VplwZHYhlc9AEGiy/B3XdZzPeNkw+TsZvqvrwYw==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr176105wml.88.1623774787390;
        Tue, 15 Jun 2021 09:33:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c0d1:: with SMTP id s17ls9868254wmh.0.gmail; Tue, 15 Jun
 2021 09:33:06 -0700 (PDT)
X-Received: by 2002:a7b:c097:: with SMTP id r23mr195053wmh.30.1623774786398;
        Tue, 15 Jun 2021 09:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623774786; cv=none;
        d=google.com; s=arc-20160816;
        b=OQcv9Zcb+bj7NcO7EHB///kO2tXaB0ri44sVb3vKN7g9dJWK+XVgofgfdUxiulln13
         LT3tEBnc8H65HEILUw4T6MtsVMsPqvh7ys01rl/o73q8jL4kebM/wbhzRQAxJRogMnBJ
         dhq0yw810RwlFmiQsofJe2HR+ODONOOAXyYD8UQxoMq32NjeCUVSyrXIFuMsDK2lwwii
         CAD1uvgV/hmavxzZCtB6rMSsAKgtVqO7MvcYNdFljT3/dmzC+nodIrmc0k+3FPGpkZD4
         NvbXi1XxNh6jc92KaOZ3BcZpYsAsJ6B2e/DPZNtnRGWwUA95GuQrQEzqSTy493nDlmru
         d4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=1LS4PyOCfydSzN5g1KMlyy0NV1VV6eTXw+gwlHbn6mk=;
        b=y4/e+uuFLsWHo7BSy2t+PSdkUbOZrIjKW1R79cL2vFhROA4TwK9XYAGprSrVw+dd6N
         lBgo6cX2MUwnINYlW/ERdhhCZLQ8dnsGtWsEkxRRkGt19grG5YPiGFfWLURaWjquNHMT
         Mh63uxHiZWHhJEN1u0C5IrIckmHVEN4KA0qK2Qj+HdRBM/z5655c4hdVUeg7FhguMoTy
         pNW2FKx/iJtcAZjof9HBFk9Rxnaxx4a2BED6ezo4joqSHBqZRT4oZGDpetrWmcQ2WSht
         722Ow5hxYbtPP9TrjH7wumO+pbzD3pnWR3Uu4ZSkGXgD9Q0CO7jFohQgEjzpk5jWQxoO
         YiGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ln/ncSLw";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o24si89609wms.2.2021.06.15.09.33.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 09:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4G4DQB0K3szxtH;
	Tue, 15 Jun 2021 18:33:06 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::d104] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 15 Jun 2021 18:33:05 +0200
Subject: Re: cell using rootfs on an external USB key
To: laurent gauty <lgauty@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <d88492f5-3780-4f6e-8fd3-53a609ec4133n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <eca49e52-675e-a8b0-37af-19d5c6b363bb@oth-regensburg.de>
Date: Tue, 15 Jun 2021 18:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d88492f5-3780-4f6e-8fd3-53a609ec4133n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="ln/ncSLw";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 15/06/2021 15:43, laurent gauty wrote:
> Hi,
> 
> I'm planning to have the linux root cell on an MMC card of my board and
> a linux non-root cell on a USB key plugged into the board. The rootfs of
> the inmate for non-root will be stored on a partition of the USB key. So
> here is my question:
> - Do you confirm that i need to declare into the dts of the inmate the
> USB port that will receive the USB key ?
> - Do you confirm that i need to declare the USB port (memory mapped)
> inside the inmate cell ?
> - Did i forget any other steps ?
> 
> Or am i totally wrong ?

We had a similar discussion a short while ago on persistent memory. Ah,
that was you! :)

An USB Port belongs to an USB host controller. The host controller can,
for example, be a PCI device. In that case, the PCI device can be
assigned to cell, but Jailhouse doesn't care what's behind the PCI
device, that's the finest granularity.

The same basically goes for the MMC cards, as Jan explained in the other
thread.

  Ralf

> 
> Thanks,
> 
> regards
> 
> 
> -- 
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/d88492f5-3780-4f6e-8fd3-53a609ec4133n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/d88492f5-3780-4f6e-8fd3-53a609ec4133n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eca49e52-675e-a8b0-37af-19d5c6b363bb%40oth-regensburg.de.
