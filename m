Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPGORLUAKGQEBUIBX5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 583B644C6E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 21:42:53 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 21sf81190wmj.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 12:42:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560454973; cv=pass;
        d=google.com; s=arc-20160816;
        b=CnmUVFEP3uEYZJ8P3ft2PZ+BMeOfvOB7MzNJ1gtioVtRLeWHi1n0qurGh1uUmahjg7
         ZrboHV15sitmmwhwiDwiGoBWwwvNX8wxxuoFh+0mdmBQOAHOQ5M5aGh8l7EMIXZP8Qxw
         +2PoZxLem0JjurM7ghJClpjkRpr7nkzkv26lQJRHEoDd03LIogE09cYJJJhZ2tmsNof9
         zoArZqRTf3wa3+V4cD7dfNosEWunliI0uEzfvtQvEndveNhhPI7V6ipyxGwbTsKkqh8x
         B/CYhl/PsQo5X6WUM3tXRPpFrzeaG6mO+/p+bAAWHwiiibSrn7e977S/RXs0XqNtdGF5
         SpWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:subject:sender:dkim-signature;
        bh=Zwuk0aPDerbiZR4fBXVa8TbCVOyt+kXjaB6c01LWeh8=;
        b=fCvHMQjnguvVW5Yx/WoznODieqICpzSMSVctA3uVMIvOMdzZnKkN9KmlhNKNxfV1cD
         xnCMuI6HYPl/92iI/uncVSoI9pxj0nVdcBR40WiSVI0agDJE4MCs+R1vZG2PT51ygNTL
         DcQ5slYH0X0MNT7/meXRdKJLNcDlM99qVVhhbynQ7ypAVKKvjcoGumXa+8QilqWWQIFQ
         OklTarROLAp6RY+TaOhsaNIKRPgQdoQ5Kw08YrsSg/l5UWvKzJjGdc1hVbYqcVnAdlGS
         2QsidIlE2DSBb2u5Pg+eYs+VonyLWID5tZDGUFU/5UHsYFssluox6dhgfzOykW9rHdFh
         yi5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="oYsIOVw/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Zwuk0aPDerbiZR4fBXVa8TbCVOyt+kXjaB6c01LWeh8=;
        b=kkU2KMmn77wgni8S42fJKcL3O2NLcYnzUQdqrnaTtAPtwqTdr0eGDQQDk7e1M4M2sP
         xWSkoMM52mPRxW85IwoJQgqsCcCJqQbtPgGGOeCkW0WD1JhE8tR2PrMiEyFKn3ZKbBa4
         l+ulLWARw5Jgd7RxQV1YjnoWGOPhDwqGNghYZ7Wr6otdr2jEsPnxcb0vchunsQVDsAxj
         IG0owUJQixPBoA4bz2QdajuAKcdecrrSiF+9fnl0rHtFXYaeOpMTnNtZp5TSJR5g280Z
         WKnq8aW09vJN3t7Itt5ucs0iYqbfElNunlB+PN6puHhH2vmwu2UwPL2402fl+fsWFsb8
         7QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Zwuk0aPDerbiZR4fBXVa8TbCVOyt+kXjaB6c01LWeh8=;
        b=BXTXz1EwdY6N1AAi4qfwazRR+Lf5GmWruFRtkjfsDrb0fWcCDWkIgJ/D0GoYfQChPm
         NN02tExp/Cc648epv8TWXYXPbrnF/jVMP6evDREnW0PRWff8f+86rjThxxZvC+jwPQPR
         IgCaGKXJApllgHn1qHlCtuRaNQ388RJyTW9mJtrRmc5WGn26u0M8IHNmqLZccxFRgJMf
         87K7m47DH4zKfyVwLuMp30ZLwvToTwJDqFfl6a9CgSFE3SFz38CsOGhug3OTfSR8jV/y
         /1MR10JaAANXdPE5gks4w9sXR43fcOo5O7yV1iMET54GMKntQZ4Fk135Xd0Y4d7BSS0r
         +jtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVlr4p+PxOlyO381NWVR1HadItih9nb2oXFjCor3prh03zUvUOp
	2812ezRfuc4+oL8Aags/yxQ=
X-Google-Smtp-Source: APXvYqwQG7FYB0LJwG/t/WGjgw7G0XyTTXY8uzCim7m5gNS3MWyjkJP9FJz0UCVqoBKlSsdZIqSx1A==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr3373483wrt.214.1560454972941;
        Thu, 13 Jun 2019 12:42:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a105:: with SMTP id o5ls1639732wro.12.gmail; Thu, 13 Jun
 2019 12:42:52 -0700 (PDT)
X-Received: by 2002:adf:814d:: with SMTP id 71mr12202932wrm.50.1560454972461;
        Thu, 13 Jun 2019 12:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560454972; cv=none;
        d=google.com; s=arc-20160816;
        b=QeOKiZEc/PB6Ai6aKy3V6g7uuOgL4GDPWRikSyhGpAQKb8X6gEK4qKW/FdXC4e4065
         htPZmljpbURnkfP4WOF0Zhl4Wakk49ivYGrAmQ6S8uZgj86dw6fC/6dlYI8rhmEbK2qz
         r/eHS3jBz9iv6BBDHwD680yVTCr1QWXR7MYuVFsVKDhCi2ZlkmBVWsYOnLjt9IxdHw/N
         E8nNY2vl/JTE67Y3zDnV1lRHanm9rVw736a3DjGM8sBQuhYmBaUSzh0dpXhOhBdpisqC
         pAFcwm97zWZRwLsn//JuzWqeahpcbH5CJ7WzUSDgacTp2SgATMajuQ8aRK2dsxEY8eG3
         datQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=HmO+o8bhhau7YCJwQKvOtbMrKsbRiUk5jllE1P+5JsI=;
        b=dIsLd48WtOB3MR4S2B6Cwqb3tUMbq3jbM5gY5/h3H9pnL1xb4/n+vlMx2R7p29q9+Y
         cpEQIX6RrZFF5vOn33K0TDO0erX66lvIy3tysEdmdBSBefxBdaOztU8C2xo7zfnUBrPu
         jtyv75ID6KJlXx5VBrd1jqGZdFygRtl/i757ItzNazWbzjMlz5HzwAUWzeGivPL3l8OO
         Rjg///+ZnVtkNcv3JVyheBV4g046IjcBoFmrbKctpYALuoLWncuBJmS5hIlL0XW+YlFX
         upDBP/1Y6jg+Pa3sRoyIJohy5bl40/EE0PpILiravrEARte1zL8QcijPlbEjPMVdztFH
         XYZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="oYsIOVw/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f11si52536wrw.2.2019.06.13.12.42.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 12:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45PvKS0nlVzyBp;
	Thu, 13 Jun 2019 21:42:52 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 13 Jun
 2019 21:42:51 +0200
Subject: Re: [PATCH v3 09/10] inmates: introduce test.h and test.c
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-10-ralf.ramsauer@oth-regensburg.de>
 <50bfa063-2952-601f-f873-e1fe28185c4d@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <e208129a-7261-e6eb-f146-2b9f538fa0f3@oth-regensburg.de>
Date: Thu, 13 Jun 2019 21:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <50bfa063-2952-601f-f873-e1fe28185c4d@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="oYsIOVw/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 6/11/19 5:56 PM, Jan Kiszka wrote:
> On 11.06.19 01:03, Ralf Ramsauer wrote:
>> MMIO access tests use the same test pattern. Let's share the code.
>> Later, we will also reuse it for other tests.
>>
>> Instead of EXPECT_EQUAL, provide macros that differ between the actual
>> type (u8, u16, u32, u64). We can still use the same evaluation function
>> if we first narrow down types, and later expand them again.
> 
> I don't get the pattern yet: You introduce new macros that type-cast to
> the size
> we want to compare. Still, quite a few call-sites carry their own casts.
> 
> Let's split this up: Part one is the factoring out, part two the type
> changes.

Just rebased the series. Factoring out things is sufficient.

With my MMIO patches, many typecasts were replaced by bitmasks which
makes those macros useless.

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e208129a-7261-e6eb-f146-2b9f538fa0f3%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
