Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5HSSEQMGQEEJCITQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-f63.google.com (mail-lf1-f63.google.com [209.85.167.63])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ABB3F61EA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 17:45:00 +0200 (CEST)
Received: by mail-lf1-f63.google.com with SMTP id bu5-20020a056512168500b003d8c0148343sf2649183lfb.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 08:45:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629819840; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lam2lXxZFF+4DK4ptRkHA/7vo9sQa3sBmiKa1+TrzWVJPNoKNlDwccLAMNHmJJ4Fqx
         OHsUTyiHKy4rK6uYlDGLWGdja5lMVB3Y1AcSJlJpYKxidNzx3hLlwDV7JQn1RPEHZHul
         g5F0QTRKWZVCr43ItT67atGuPh+S3RpaAyvTHrvWQn08ft9QBdtUH+5PIdz4Exz0nF88
         e2xBfibN/Bnp0SlVpUQQAe20h+XpvWpomx18ZKxbZH/Z6Gp3rsnIi2ZQuCauiDtNknVz
         2YNgSfRvxMqSqb5ovInQ1mrqi6y1YwtfGCt5AIMIhL+SHHoCCzZ/OvRyj2pR6NL5NmMi
         mCXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=sm6G+vJTLjgXOco1sHdbkdiwIxPbHJU5ezV/FuG6cX0=;
        b=O4jIf8lvq3JmebEiCNbddGoSqCvWdlz/3AYiKqGptKp3hpvwVnZn3lh3pIn+ctXiAY
         sBxcy12uSwhNTqmHsTOUTElgb9qBMpNF/8joQrVse8Z9TGZw4sRp9mjgJ44V/QpyR2GX
         TY+TD8O2v5ufRlYVczaUki6Ucfoj2hLJgY+wX74I1dsaiw90pKtiuyBmyZg3ISMoUZvj
         tmMQOwQw4K6FIHQu5zUsFWF4jobYVDEy5o4ZGRb7pY/0+/1p1BnO+40IGzQ8d/18EyLq
         A9rETx8mSgZdtS8w13cN3kpTUCMogkDcXj61eQYqcnJEF7Ue6na3PIyZuQyAtFrIS/nI
         5jRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sm6G+vJTLjgXOco1sHdbkdiwIxPbHJU5ezV/FuG6cX0=;
        b=ibkzkB0476jW962dS0YoyPWNC9QS4BFa6Cy4LaX4FJi4l5/fkTmAun6Bt9jvwQdH8w
         Uw6/WLzsYxm4XhBV1eGF9x+sIScEiayvjOO6TS47pCTYQyzZZUMUigOSsN6bc4COCSIB
         NzIumugSK5TYWFOLWuDnBTpqerrVnsygmp4SDDEERbxc4mk30LpUueOtHe+wmq81tj4b
         SEqDft9Rlx4h1nrqClIP7eU14Q9nyH0p+8XyjUtQAyc4mTtT593Ol7xO83q9jlnIoKGP
         UCOgs9BRaHnkC/yDqJxw8W4bjQIAIy46+MnvfgaICgGHPTJ1dvCn2Q7pG5nxsUvUdD6T
         U/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sm6G+vJTLjgXOco1sHdbkdiwIxPbHJU5ezV/FuG6cX0=;
        b=EsqSZRtNb4lCvVMx9ZrGNl4SSe0o41cFV6Pc5xBtuAh0iUA5aTwqNF/a4SHXUeZGKY
         pmXjafTcmpav4gVh5N8B2hczpjN66+L0VdysJTXOJPfTnCJxMfsqWlX3wIihGyRAuYYJ
         9sKzEurRq6BAaX6c+dwviDgfX8+xuWVqVu+gE0ZtKyhcrOI7LVjefJSJ63o0UUjk9RS2
         bJxWpVdHZQg58ouyiyIDqJLc0NsYFY8bVzc7XQUAUa0Rqbr0Fs//lAW+kvXl0BUdhSoY
         weASi5kuy7qNeQBTY4Ro8GZ6g1CM11UKXb6viBU0O6pwowUxgymfdok+6PzqriToHFUC
         NROA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YGGjzxDszng2DHjCcuY3UhscraN15t0ocjHG7I+elTNymp/nr
	GqScudfZ1CmkG1mSMDEIgew=
X-Google-Smtp-Source: ABdhPJxQgzumcW0K5Dm6C+xMlpwTEmAxEfKydNgszvZnnDT3e9rCj2jchjePnXlu2IEnQ3XazJOqwA==
X-Received: by 2002:a05:6512:3f9:: with SMTP id n25mr351275lfq.231.1629819840296;
        Tue, 24 Aug 2021 08:44:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2119:: with SMTP id a25ls1967993ljq.9.gmail; Tue,
 24 Aug 2021 08:43:59 -0700 (PDT)
X-Received: by 2002:a2e:9445:: with SMTP id o5mr8139163ljh.300.1629819839046;
        Tue, 24 Aug 2021 08:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629819839; cv=none;
        d=google.com; s=arc-20160816;
        b=j4kPxECi538y5z+3vPzzQZgylyGWoedEoI4CA4EpGPbsbwBjGT5iyt/zFkUn72SHEU
         vcEyHf/R9JQkvBnxuqpvZwW8QLnh4cvy/2HGZP+kIEKqa0AaTitAW9DXOxCJCRWEvxj9
         CnupwS0jCw24A/E5BZer+k69qZXOr5EDRVVBOmZ4e3se2qPceiZ8VKuxGHsEZegOg4O3
         osb58FA85e65Se22+GsSwTFeFDNpjhNXcr8J8WWdIdZ39BGNinTNHEe028ds5R+Y8jnB
         4OAC4b/IyfiTsABFseK3NuMX7+5xW4rpZEPwOgZfndUP9u0sBKXGQ3CL91kFT7kN+50H
         iZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=SjMr3GejXBk3BBB8/StXZwaVNNsMAKZpE3o10kB/q+o=;
        b=rSC1QEk7Em30CTFH6d1k5mJllY4XQo4oKyTvjjZ7kl6iegKy9iG63+9fBr+YWuL/cT
         i37uzOMHisSaZrvu9D08bSqARMJ5BervIrqnG/ExXvnyG2VtmQuDBohp2BeRrSodW6TR
         lwFM95rrvjSh21PI7VGLzK0CfL2ftfF09K+UzDiwSi56LTHZEcmFSamMFqITCJcUsBYK
         x9tkPGvzKObtwyQeXncPwS0XZGlVgoa0kqHFv0sLZdzgNjgXd4FZ742173JqXS3J44Oz
         xH5CZtwNF/iQA1+yoMOIkuNeJq387R7zt/d0fhFiGRvnDACuXYlQ3X8BgcuAgsfhJGns
         BDJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h13si947798ljj.7.2021.08.24.08.43.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OFhw4f029745
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Aug 2021 17:43:58 +0200
Received: from [167.87.75.154] ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OFhv0E017166;
	Tue, 24 Aug 2021 17:43:57 +0200
Subject: Re: [PATCH] inmates: gic-demo: map led_reg
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20210823130258.215378-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9b8c6c73-3d5a-0bf8-7843-28118240ef58@siemens.com>
Date: Tue, 24 Aug 2021 17:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210823130258.215378-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 23.08.21 15:02, Ralf Ramsauer wrote:
> When I introduced MMU support for inmates, I forgot to map the memory
> for LEDs. Fix that by simply mapping it.
> 
> While at it, move the initalisation of led_reg to the top of the routine
> where it should actually be - it should be initialised before the timer
> is armed.
> 
> The mapper will take care that the address will be huge page aligned,
> and the size will be aligned to HUGE_PAGE_SIZE, so there's no need to
> align anything on caller site.
> 
> Fixes: bca43a784716 ("inmates: arm-common: add MMU support")
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> Only compile-time tested! I currently have no device where i could test
> it.
> 

Let me check if the Orange Pi exposes this. But I swear I saw it
blinking since then...

Jan

> Ralf
> 
>  inmates/demos/arm/gic-demo.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/inmates/demos/arm/gic-demo.c b/inmates/demos/arm/gic-demo.c
> index 58feea3f..b0102615 100644
> --- a/inmates/demos/arm/gic-demo.c
> +++ b/inmates/demos/arm/gic-demo.c
> @@ -56,6 +56,12 @@ static void handle_IRQ(unsigned int irqn)
>  
>  void inmate_main(void)
>  {
> +	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
> +	if (led_reg) {
> +		map_range(led_reg, 4, MAP_UNCACHED);
> +		led_pin = cmdline_parse_int("led-pin", 0);
> +	}
> +
>  	printk("Initializing the GIC...\n");
>  	irq_init(handle_IRQ);
>  	irq_enable(TIMER_IRQ);
> @@ -65,8 +71,5 @@ void inmate_main(void)
>  	expected_ticks = timer_get_ticks() + ticks_per_beat;
>  	timer_start(ticks_per_beat);
>  
> -	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
> -	led_pin = cmdline_parse_int("led-pin", 0);
> -
>  	halt();
>  }
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9b8c6c73-3d5a-0bf8-7843-28118240ef58%40siemens.com.
