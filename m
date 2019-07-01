Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPXP43UAKGQEFOFEIWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D55B5C4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 09:35:28 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 17sf2832574wmj.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 00:35:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561966527; cv=pass;
        d=google.com; s=arc-20160816;
        b=xgt52VeJmNwdVMFaBrQ8FcEScvZFM+zc7keeldjdvbo1/Vbfdeg1uEPPYJxYEbnysU
         /qhpndxolUA/tRafbFuFPk3xyGH4QVctPhWFRepq3txX7dIoxx4ffnuuaHl85qztaqdM
         zoGET8MKx/CKtzREh3L4LjR+9h+dMC1N6j0UyqsAaB3QRJZK2hFw7H449DfTozfaPQsJ
         Nzwy7pMvUXUMMs9gH60QcvXNCS+41n+dbtvYN7MsWGGAoXgTX147Rryqx2qDtOL45A+Q
         JVS/HG1MTWe3rNkUSJRkgDp2Vr7dABX0Wzm19J+nJYFUiyhowIsbhfd02NW444ONcoTb
         77Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=uQtHsK5kWwAgNcdE8rqule6YCWMMnkljzstviRMc/pY=;
        b=JCI1z+H2DI2sLLyZhhbbBbmRfHoaN7w5nGFSMmN+tqWw6BOSvo41FV9maLaVX9BTvM
         4u5hlMYmb2qG6NTpWUKXkhDnjWgukSDfs11P8gk4/VZ6XKkrKHX90Jn1k1xyvfa9XHae
         3DaFIo7uP+WRuVn2Z/gJ/6DJ0Yt6dzcMIQI3UNXTELCQd9haAf4noSnusANsE01dkqHP
         kl3uAZliJWJMjzZGzm0ih4aZOee9wpiGHP7fokIN+7vtZMjWfeoZIw4IjrBcTR1lt62w
         PPAz9087wkuW6cSIEGLoygffXkwRd+3z9E07PeCdPvwR/ER6ZR0O6nO2OAWmB/f+nilH
         8y6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uQtHsK5kWwAgNcdE8rqule6YCWMMnkljzstviRMc/pY=;
        b=GQBH/28n860t6l07pwgPDV0xE5t4xHyvMuZSHe9Msfj5tUf5ssru3Szi5ES155yG8R
         Ne1gt78pFeOG1OWeUynbO/9QhoGH5HWEPZLc1Y0R69kBxBVyGzYg0q6Mz21uZ+fgIcqe
         B1EO3vRX7O40fE//XP0QNr49JbDw1kbRkmq3a8EzK6+nMLGU4qwMM+S+hdtjN8mujZp6
         iJ/AOChXcs7VnEhLAHgljqZMzBd+zxxTFxs1NP+tTvOtsGdVvMKbhxsWLwilbAq6Iy8a
         yyzjWsME2qIe9sbAjaKyB6d86Kp9vBaSYz5cQoK0N3v1z/4di28Vi498gG0L6L6fx2Sy
         FOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uQtHsK5kWwAgNcdE8rqule6YCWMMnkljzstviRMc/pY=;
        b=bVLTJhYu0dqs4dBOAgMO+dzhcNp3dSqGnpkUTgeBH9UtAasewM00A34UhiYjo1SvVn
         kMPlwTxtH9ThnJdqNZyuuSjq5F3PUmVoFlpgWaOHlBVl1ZicXH57HZojVMXhrfIZn8D4
         o8KAFkyvYECudnQmbxI4ppK9lm4TzMAlw5xKc7I1E0k90hHueBgz35+/1QCfz0GRoSAg
         J1Oxxgk3ct3gexoeciawIoLuJMRsl9SNGFsw3esEZtDBvQ+S3shNqJO0vDFxkH3w228h
         4yZKeqJKf/TgGCAqRBIITK4Dzu5tbjfLkMcvcEqMz8hSUCwaEcgltpq9ruJHWS7c1PCK
         mUag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsOIh08mTL2pfMfAReXJQq7ESceBz3h90qQw1vUbHczwkrrulj
	oOqvjHi/W+5sPBXkm9n2krk=
X-Google-Smtp-Source: APXvYqz9+qv4PqpMsStpGBgbIhWPtrrNTRv+O5uk66gL2wh6pJzIIZztqbeuurhW8ZNNP6bZpUr8eg==
X-Received: by 2002:a1c:343:: with SMTP id 64mr16937572wmd.116.1561966526911;
        Mon, 01 Jul 2019 00:35:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4147:: with SMTP id c7ls1909978wrq.15.gmail; Mon, 01 Jul
 2019 00:35:26 -0700 (PDT)
X-Received: by 2002:adf:e705:: with SMTP id c5mr18478043wrm.270.1561966526327;
        Mon, 01 Jul 2019 00:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561966526; cv=none;
        d=google.com; s=arc-20160816;
        b=SIYDeSDecXNEJz34MJevz/ORJvFb6YO6FeQQ7Irc+PUDLeaGbh2k/Fcy9KrA4xk8Ik
         se6DJlCtoYVrLIYY0hqpvQ7dyBx0jqE+qb2hA8xyVvl78Ck+MfJRWBXLmmOlN4ErGnvH
         A83+4I01W++SAkq631IXYlQfLV/z3luTWCLRGywqfDk1qRFD+LRGxDJpHVEvrPBn9rJe
         yd5k5PDp3twHcVSnBBuMn030pgQlXOdxxh+UsG65CWWiKC5yU2nH9vRDHDapH5qWYZXV
         RaLFwrjRyIpOq3nRqUmiSfx1s4J2fAUpzFSTyBYkZ2hsQ0N95bMDYAx6NrNR6wllGo+l
         9Fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iIE+64mb58PusNCf4FfhT+aCRKM/R5v7MZQXXm4mHpQ=;
        b=Qx3SqRuhyXusZBzSzzAedcrHldJJBHfRLO0RtlhRxQzTK68qfYiSUP8p0/qmgO1TIb
         1NQGasMYNRrg6rooR62wEDeA1A5vR2BY2qRNz/wtfsobTxNh4Z9LbF7F7e6HSyuULZiR
         HYz/JDdem1hGOAVV+pzEpJ2Ji2rvwQMq3V+9xX6HR42UadFsniT2XyawigPkfKdWWWhN
         qRfSQnLXvZqTYfCfMaxPuKWaSQrqzrjkLQHXljMiUTvSw4X5TBFx0CvkEJ4F/YggiRtN
         GWhUEtBN0UT4HC8nk/+VGZrXrhlSAKbdtiXPQKJPwl1ARLuBgM3IzNrcvf9z/+Z2yNEi
         ERxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l11si723526wmj.4.2019.07.01.00.35.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 00:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x617ZPRp010989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 09:35:26 +0200
Received: from [167.87.6.27] ([167.87.6.27])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x617ZPTw013878;
	Mon, 1 Jul 2019 09:35:25 +0200
Subject: Re: [PATCH v2] core: Fix aligned_start calculation in
 page_alloc_internal()
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>
References: <20190701072933.10751-1-p-yadav1@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ca30179b-8ffc-b273-89e7-568d2d4fb541@siemens.com>
Date: Mon, 1 Jul 2019 09:35:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190701072933.10751-1-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 01.07.19 09:29, Pratyush Yadav wrote:
> Right now, page_alloc_aligned() can fail to give aligned pages when more
> than one page is being allocated. This is because the aligned_start
> calculation is flawed.
> 
> Taking an example from a test case, let's say 8 pages need to be
> allocated. This means an alignment of 15 bits. The mask here is 0x7. If
> the page pool's base address is 0xffffc021f000, this gives us
> aligned_start = 0x7. This start is clearly not aligned at a 15 bits
> boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
> opposite. It will never be aligned except when the page pool start also
> happens to be aligned at that boundary.
> 
> In the above example, the address of the pointer returned was
> 0xffffc026e000 which is clearly not 15-bit aligned.
> 
> This change fixes this problem. Add align_mask to pool_start, and then
> zero out the bottom mask bits. Adding align_mask ensures that
> aligned_start is always greater than pool_start.
> 
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> ---
> v2:
> As suggested by Jan, simplify aligned_start calculation.
> 
>   hypervisor/paging.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
> index 16687a89..4a24c1f6 100644
> --- a/hypervisor/paging.c
> +++ b/hypervisor/paging.c
> @@ -105,13 +105,15 @@ static unsigned long find_next_free_page(struct page_pool *pool,
>   static void *page_alloc_internal(struct page_pool *pool, unsigned int num,
>   				 unsigned long align_mask)
>   {
> -	/* The pool itself might not be aligned as required. */
> -	unsigned long aligned_start =
> -		((unsigned long)pool->base_address >> PAGE_SHIFT) & align_mask;
> -	unsigned long next = aligned_start;
> -	unsigned long start, last;
> +	unsigned long aligned_start, pool_start, next, start, last;
>   	unsigned int allocated;
>   
> +	pool_start = (unsigned long)pool->base_address >> PAGE_SHIFT;
> +
> +	/* The pool itself might not be aligned as required. */
> +	aligned_start = ((pool_start + align_mask) & ~align_mask) - pool_start;
> +	next = aligned_start;
> +
>   restart:
>   	/* Forward the search start to the next aligned page. */
>   	if ((next - aligned_start) & align_mask)
> 

Thanks, applied. This should finally close the merge window for the release.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca30179b-8ffc-b273-89e7-568d2d4fb541%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
