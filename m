Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMWC7PUQKGQEO7QCGZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id E154D78B42
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 14:06:10 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id l14sf38156285edw.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 05:06:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564401970; cv=pass;
        d=google.com; s=arc-20160816;
        b=t/QB8M53FnXmp71LVG6/HXbZzI1HhgZFMCulPfsBpejlXaugDUk3ITp2N4xBEq+Jqt
         coYVI9qMwJ/22laSp59Vz/1jisz8A8wlPkHhx+v//6UyJFOTNSeJ9oUegswTwnIUuskU
         jzKc010gSjAHBDFAR/IFKVcx7ierbeOpQAa1hRp270xdIZO7sscKuPPrG0PHK4/km4DG
         gGee9po+pnUOYzr6LTFnbFN+XdqUjk9P4ljMiSRk/KY67AYimLQr5VtTNb5Trgn+ElVE
         Gb4g7NnkGA69U6gkofEJe6sQzddm7W0+eVCd+2U2r4dvysz0l3ix93mRA+L3ifjcCbQP
         87kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ar6w7xVt71GL/olGG+Djp+UmRyn3FBWg79GEGJanUZE=;
        b=eVQF0obZrZWPl1REJbs+mR79l+uiZVmeqHjGeawpcJorJNFVigpHwv0nSuaqDISCyN
         zvfg+h7C62Bt6yF/7gWKqCQcBGI5OPd3iA4/mtkPAIyJBY4YNPxgy8GcAA15+vPQPd0W
         E7ChN9xt04eNuNLV9MrMcH4mCX+legjdfLRZXCsx7LcL4tYvvwmIg/V/V0WIUSfe2YrD
         SrhcUg5cGn0w+9f7aMLz+iIKbur6dZ3X+4vd4ipFoedNTihqwbsnXaM4XqcQcmZRtESH
         LVbBQuxHOFKHlm/x/oCoOHMf5EKta31ldg20pQWXriOMyLhMy/cxFaYPysJ0xMKptyrr
         kMXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ar6w7xVt71GL/olGG+Djp+UmRyn3FBWg79GEGJanUZE=;
        b=RGhwtbaPOhG2Uwo3iUjJKYW91K+AelCGKdxc5dBWzB/KPx5wahc5+3k26ves7ntLCW
         9VlkeLXxcsGSbL+YHxxP9D15mYXWRyAsSiDzPCwybZPklbbhDb63ZiSqleQpL8UsMAxn
         DdfO0TfcqyENSxYRTjSV+K5xhIEWbSGIgIP5+xzpBJesPRWS1vLxW7ZcEzEwcnit7aOI
         NhZhGG4J2eGxxzn9Xu4BRLnN2Z3OmrPFgSLTNhkyZZXvn6PHNY1ZiOngq5+ykFLyo/T5
         Q/312GrrOyCrPeMGSFnyjRyQw2QtSW96Szb5FJ1B8zW0GJ5Vr1DA6yhmBHdFgnIk83yW
         12ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ar6w7xVt71GL/olGG+Djp+UmRyn3FBWg79GEGJanUZE=;
        b=Zy6YTunWhcCSVvc8JDR9o/SG0HuU8eYwCNLkTaHRmYXwZ0XXVcWsCsLkmkNhu3eA0F
         lqwBnCqQahU9jeZ1HYVPzWZR2iy5dFqxWlMnJ8aKilfQa/6f6SlIanLBRIAewohqnf+n
         ncp/mUiffaPauo4xI8pC0g/XNJKIgeV76N68ttB1K1YtHh5laQh14gQ137gfgc+WBZjb
         RHdnu20czXICzzlMfaAid/hLlR7abc2pObvHSJsX/BNQatiDbq6hIoLEKYnApSWxbtII
         NPh4QCEYeTZsTAXV9POsL0xANhRqwGiLWHbZK417eO8U7ZTA51P/x/phzhfdiuErQLIX
         ir8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWbsio53iPhasc9ticNIZuiies0+3c1y4bTDigM5pHSl86fNMqv
	p6hpo3r0Lnd+yDneiTue1sg=
X-Google-Smtp-Source: APXvYqznzFwHBlmlC78YHBsUHiLdHEn0DmFhUOvD32iDe4ucH4xV3gHs0EyahixKeGt9rMOggnC9yQ==
X-Received: by 2002:a17:906:fac7:: with SMTP id lu7mr50150628ejb.109.1564401970685;
        Mon, 29 Jul 2019 05:06:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:404f:: with SMTP id y15ls12837022ejj.7.gmail; Mon,
 29 Jul 2019 05:06:10 -0700 (PDT)
X-Received: by 2002:a17:906:4882:: with SMTP id v2mr23349443ejq.100.1564401970067;
        Mon, 29 Jul 2019 05:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564401970; cv=none;
        d=google.com; s=arc-20160816;
        b=ADVQI5qon4u4MLu6Sttxgw7kTDUU7y+2LmRqygjvlp86YltPzlCi6DCzMMH8RIjz9m
         WMYNwYHL/h9xNgI6d5z/c+ursYXfqML6IRGwECvEUntfDsiS5VcOXWvdTwZZm/M+Uw3G
         W5QXSkOJW/0TNh6eZUzjewql9BqPfdvrC4cpdKl0b+ph1EMkK6xJW2T7ExqxaATGmzYF
         es5RXVr+jUBGNnIUbM0fD0+0M1oMbSpMywVQRWCN5urEdec9rcTyWicTMQdE/z1eP8dl
         kuLNxJAqFccJctMxqh3/YZuU55y9v7tjI8cFazwng9U7D3D+1/38XbH/VC8PsjBWw27Q
         tNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3yWDQ9Wo1wuqOaE4RK+Y+rlQJLnbKAcIoYXQayyeJu8=;
        b=l6VwWtjjQ+ecwB5AJYzaBuGzL0rO+Wwh9zJ4iLRjZybZMb448hgzNQml+JPfB/C0NL
         2IvniMIyzjSwwVjZghnksIY0WSW73sSSpyfqmqNiRcphg2D1rkVFCKwhiaNs44tpd9FK
         8cawrMfLu2J+S8ILccsuXmTF56Uo97P8SP0KR3VDdSPBDtT6ZF755U5OlTSUAG96BBhw
         4ie8OtcWa8XlBZ3OiU1DZ78+b1I7QUfAMUfxWWr15KikTEZ6Xu7zATExLbTj4AW5mGWa
         NHI0t6HLJOykBUD21qSJF3QbNxW03IKBNrXXYs4Sa4gJxbTlYn/ekqkAFtuS19UFe0a0
         1QKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 91si1664332edq.3.2019.07.29.05.06.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6TC69rD023961
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2019 14:06:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6TC69OU001966;
	Mon, 29 Jul 2019 14:06:09 +0200
Subject: Re: [PATCH 0/4] inmates: x86: linux: forward platform UART
 information
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fcd8c641-a260-98f9-5f39-8340259b0cb3@siemens.com>
Date: Mon, 29 Jul 2019 14:06:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 29.07.19 12:00, Ralf Ramsauer wrote:
> Hi,
> 
> non-root Linux will run into trouble, if UARTs (no matter if platform or
> other additional (e.g., PCI)) need to be enabled selectively.
> 
> As Linux doesn't see ACPI tables, it assumes that all UARTs are present.
> So far, we supressed this with 8250.nr_uarts=N. But this workaround has
> the particular UARTs can't be selectively disabled.
> 
> This series adds flags to the setup_data. Bits 0-3 of those flags hold
> information on the availability of platform UARTs.
> 
> On Linux side, we just need this [1] patch. A second patch for Linux [2]
> is optional, but not required for the functionality of this series. It
> enables MSI interrupts on PCI based UARTs, if whitelisted.
> 
> Once we agree on this format and this series is integrated in Jailhouse,
> I will try to mainline the above mentioned patches to Linux.
> 
>   Ralf
> 
> [1] https://github.com/lfd/linux/commit/8e137ee548730eea338aa383a9a09ae050fcc261
> [2] https://github.com/lfd/linux/commit/929cd8e8df9914a84843d23fe2d14470a2db2765
> 
> Ralf Ramsauer (4):
>   tools: jailhouse-cell-linux: Simplify calculation of setup_data
>   tools: jailhouse-cell-linux: Add support for pio_regions
>   inmates: x86: linux-loader: Enrich setup_data with flags
>   tools: jailhouse-cell-linux: fill the flags
> 
>  inmates/tools/x86/linux-loader.c |  2 ++
>  tools/jailhouse-cell-linux       | 36 +++++++++++++++++++++++++++-----
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fcd8c641-a260-98f9-5f39-8340259b0cb3%40siemens.com.
