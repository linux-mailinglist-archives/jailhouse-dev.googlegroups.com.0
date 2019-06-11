Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJUH77TQKGQECEQAGSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9F3D038
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:07:19 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id y24sf21163049edb.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:07:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560265639; cv=pass;
        d=google.com; s=arc-20160816;
        b=uW23XKAreBb/9DKDWkkC8meNZFZVNPWFEX4Xi9EE3iPnSEbR0X2i3C1fdHw/uFNNuU
         SwLrH0oEHUflcGPQr3od/uWCw+V4xBRoMWUTXmguZirDMhEmDncMKeB23AgmMuDElDLM
         0trdfSpEDyqmiDIZBHxwuuxZ73YiiI6tSYIQ+XpVjN3HkGyhqyVeF2izzCo9lSmsiCjW
         LW7gEbRUYUQsBVm6lt6IjYRw4MOSj3VSZvcX00+nFQk32uZY109+2pBnZc0ET3btWW13
         iGjYK0/AjhC0z8M9VOgK/TXAlcl4bG49B7DX4U20EIy/Lzp6g726rP9ZPuz6vUwRieE4
         qO5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=RMScDL4nStJOpPdRCBfpY3bP6PJzW1ANFAYDUZe4+A4=;
        b=qwo38wbmnMICVS5FKymHZ1dETmfGnYBFDRB3rXCnNP7oBuxCnwGRAwnF6OyFc/RpUf
         EMjp3Vs93qSdkMuPoxisfEneGc2mf+ImX1O7tc0JkB0VxWAz7MPchfLL1XrnbOQocZm0
         zE83o2MyC/hy8XUn50K1EU05jnFJDYQzdUaqVyG1gvflz5LCFyKee4Pty04cWB7+5Tkd
         RaHIlf+yNMF5xfAo+oCH5qHtzLNg5lfjsk4gwcRA9X2+ySnMNS88YOs2vVDnbAkUK/0w
         6LrP0ng3LxeBB0YcugiPF4Xrhacs15Z/0ez1NiCBDuW4ezfEukAfelflN/IXQc8/O2VJ
         Z31A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Hepd6MCU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RMScDL4nStJOpPdRCBfpY3bP6PJzW1ANFAYDUZe4+A4=;
        b=bvE9yFrBcC4a/mJz9/rCUQO5Ylqveock4MFYLosW6CsXBB5oN1RRLIG+9xrhVcwzXG
         8ut7J7bUZ9ejrHR7UL9tg7nMcZUT2iF/5cxjr7BqtmEkZAjSMnLoeWJzg2dmpiyVE1bX
         Mc9R3iNgp/Av61B6g3kTHsfUePu3ZSMjiOOJmN7lJsDw5UQMknKU5J6lDTgEFW5RtBAm
         2QN5NZTpmPsHeXqIBJyEKZGdKdpLD4ar6svnolBjuYKGP98pSL2dmG3//UfsyQ1GQluB
         kD9BXk20b27PpKiZHzyVRVlp6em5OEt7liMPdsUG80li69E73VuYq/Y6lsN3J8LvORrB
         IWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RMScDL4nStJOpPdRCBfpY3bP6PJzW1ANFAYDUZe4+A4=;
        b=fC80Geq7YQN90OwTNCfI6VTf1bDG9lqEbiHWJ4q6PgAExtubacjRNxqUUCJmhvAw0s
         woEBZfXWE1z3WDEFXt2Fy3XB6FLsl37Iqf9N7GhJ4VmY6K5qQ+2F1EVMOb3iai6lj7kN
         P6UL26L8AHvDddRpyQ2Uek/TJp6UDoJoofwq9zNAsukOw4BHhkOnQClCWbAcinu5F1bu
         On4nZ77Tqh4U3HH7VjCpxEMA7Fe2i02j1j5hjuq79p8K0CWwMrocl77kg4G1C9v1vZOa
         hjP30onDdr1LGXSJ+3X1nY8aGTmIWCwOWlgbFqWl32Y/38sJXt5GShkbeVAt9PHtOIr1
         ax9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPuGX+RQTFflyIDoRE89SKkNJQJimF4sbuF0duMNrh32rmNoIn
	BgNxzyVtHycS7/teAa1OsEo=
X-Google-Smtp-Source: APXvYqySZC08BenlsmutMxTttIICb2m166yiM2fauS94V7igWgFoh664gBPHuzgIjYzfJlsqvPh5FA==
X-Received: by 2002:a50:b1db:: with SMTP id n27mr36059814edd.62.1560265638911;
        Tue, 11 Jun 2019 08:07:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:3446:: with SMTP id d6ls4737107ejb.2.gmail; Tue, 11
 Jun 2019 08:07:18 -0700 (PDT)
X-Received: by 2002:a17:906:1cc6:: with SMTP id i6mr55360383ejh.100.1560265638387;
        Tue, 11 Jun 2019 08:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560265638; cv=none;
        d=google.com; s=arc-20160816;
        b=zl4zUEUnxAC3u9Y+kTvmL8Gze2eRsYJRqwRWj66kAPWvu5GpQhp5mYCa2Jg3pWMmMg
         yek/PR+M7LXk2OqFC/NMtuhj1Vr/DKQ56oyUYwSa3h+oYIeQ3uq4P9dUhSq2X2j+LT4U
         P9FyjCPXLFLj0dYlfcmJP82KmiFa7fatGoHsn48lROOQrtD/IMvjlPBOCPcD60MId6/3
         P/6CZcJ3PuZdgGQLWUz/SVk+M5uAhm40Wp1GZTYBxyz0ZYJlEB/SYx31vsKbEiCQegmJ
         0aCQzbSN2q0ilCjJ1m+iA5QV+5QLFFI4gR+vUvV0MVnIrJcecerHaNjOP4JTbYXqpo1e
         6l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KljCkYMCz6na4xpIk7Bp3xwj78KT+StZffQCaFBDj8I=;
        b=RYHPj2PHcXCpDOLeRnRB/7a63uqplbtsmIW7qP9/Yfo/Z7DY9FvcLs+bksnK/W6TFL
         SOZD9TUrjEKSQ6I4zRUOr8/0UH0TO5OTNPHv/aH02x+aEfkENQBfRZf1tS3UtIjvkid4
         hBVoYdouWYvKlTb9wZcQxKDE+z0vFCPnLFvqgmMzqww5UvdRqjAsy3Tx8ikke37SSnsj
         TvkYh4H1W98Q2hXKsT3Dxt11XUA0N4D03wFKW6n763V4epNrPSOn4iCxmnex1yded75K
         2q8bAs+G6T//GTTS3B6Abd0aYqWbhVOmwH//7uQqgZGc/hwGYAyCkdu5WbvvRG+dea3f
         5DGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Hepd6MCU;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id x27si819540edd.3.2019.06.11.08.07.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:07:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.208.3] ([46.183.103.8]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MEmoQ-1hKp7n2QWY-00Fzu2; Tue, 11
 Jun 2019 17:07:17 +0200
Subject: Re: [PATCH v3 01/10] inmates: x86: use correct types for
 pm_timer_read
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3e76db5e-9fca-3064-27a2-fb8da0249692@web.de>
Date: Tue, 11 Jun 2019 17:07:14 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190610230330.21419-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:u8A8nQgzRJyr3SmEXRl4pQnOouWp84VQjcAd7bFSmYGhSQ/qqt5
 Se9vUBLLB8KQqRbuQMA5KygodACfORjrIGYTmLs54ib1ZloTri7ja64J6IXf7EPtp6V3iSE
 T6YSSKhW9Tcd4eZIT5y7KNcmkHd/fNXFvxyva7u4GK1bjMwSnTX64CoMWjetOqRD9aYDLgx
 P8DNIeD9xvEgKEzfypc/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5HuuTUIGRlY=:Jzf3h9GuIzVjaXoh6BnsLR
 c+pju1uH/tizVRCorDx+uYS4ZvtIZxMAJdxLtaHezczIqgAsdIh9IV0uiJYKsbFewf5HnMC7k
 9VgikKisN4dGf1G78ykEN5WaFjMgcq2sX0bx8sbWEfsKe841UUb/WjG97Zec3xnV5s4yTkBGf
 M+wYtrgkJHAfO/yOygsHFOavLGk9cH63d7EANUY9/fcJdSxnppALQmRY6/n1A4OllV3o+NxHn
 INnBbJZcksjav2aVeVksd4WH6JSlfwQP5avABQK2XOkg4DPqLZGb7vU4bw7lH+VSB/FMh3uKA
 MSwuEdZldXwDCG/7SakpVcFkcHFixUIOplvagjrGz8nRKk3M9LMxB1+3TFjpvUvb99KcLeuwP
 5Le/4kL5DG6kvEWjI6hrq/lBdG2ZrZSel2KKIkTd4QKjKHCEmsqkSEirQekORUO2zyhwVhYJv
 HrXT4wifU1unv40FgoPikFMC0BheqD8CZl/r/DsBCR+dWo0YSwTLHnjXdv9PenzAhObqYFxvR
 xJsyCfNcTvSGUqV8mRjWx9inES0DYJMJGcmXBk2SvCfhjWzJ10Ol+XwQQ/gQkmQ371faZh3TK
 NAz8FjOZcMMxzqrtbStG8+0JaYYUMxGmKSKob8Whd0Wxct2bPyzeN2euNP6SVO1LVP/zfxi0h
 2ldSKFP+iB381jhZW89T8BtpZupnqqMA1KyR3VgnTQG2Y8wcnxc+YdnfQ1N4iXrQ7RSS0CDS6
 JEdmY23zuc7f304Ukk+ZpN/U4V/271OA5nd5ZpjKUZTqkZHf2MLzgu+X0AahBfv72NDUt+QMi
 PcDwSGd3fKulOBUwSbte2LPsZ+eWzPlK4I3Eaj19J8vxm910f36ZSH7eVRzpcHHSKHR8xvAEn
 VRxLafj3QDC561GKoOM8KCDZNc0K9NGlkJyz/pH7Xk+CG5bnHoSRgBsarYZHfECLeGuwMar0g
 9ZXxlTbiHWoyPNTHhNmFHhorNPq45U7WtmENdyv7bm+nhr1sOrujo
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Hepd6MCU;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.06.19 01:03, Ralf Ramsauer wrote:
> If we should ever compile timing.c for 32 bit inmates, then unsigned long is
> the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too small to
> hold the result.
>
> This ensures that we won't hit a bug when enabling on 32 bit. Once we will
> enable timing.c on 32 bit, we will have to implement 64 bit division
> intrinsics.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/include/inmate.h | 2 +-
>   inmates/lib/x86/timing.c         | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
> index 7664570d..e4f75206 100644
> --- a/inmates/lib/x86/include/inmate.h
> +++ b/inmates/lib/x86/include/inmate.h
> @@ -241,7 +241,7 @@ void ioapic_pin_set_vector(unsigned int pin,
>   			   enum ioapic_trigger_mode trigger_mode,
>   			   unsigned int vector);
>
> -unsigned long pm_timer_read(void);
> +unsigned long long pm_timer_read(void);
>
>   unsigned long tsc_read_ns(void);
>   unsigned long tsc_init(void);
> diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
> index de41fc35..d179da0f 100644
> --- a/inmates/lib/x86/timing.c
> +++ b/inmates/lib/x86/timing.c
> @@ -92,13 +92,13 @@ unsigned long tsc_init(void)
>   	return tsc_freq;
>   }
>
> -unsigned long pm_timer_read(void)
> +unsigned long long pm_timer_read(void)
>   {
>   	unsigned int cpu = cpu_id();
> -	unsigned long tmr;
> +	unsigned long long tmr;
>
> -	tmr = ((inl(comm_region->pm_timer_address) & 0x00ffffff) * NS_PER_SEC)
> -		/ PM_TIMER_HZ;
> +	tmr = ((unsigned long long)(inl(comm_region->pm_timer_address)
> +		& 0x00ffffff) * NS_PER_SEC) / PM_TIMER_HZ;
>   	if (tmr < pm_timer_last[cpu])
>   		pm_timer_overflows[cpu] += PM_TIMER_OVERFLOW;
>   	pm_timer_last[cpu] = tmr;
>

This is not yet consistent: pm_timer_last is still unsigned long.

Do we need the conversion in this series already?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e76db5e-9fca-3064-27a2-fb8da0249692%40web.de.
For more options, visit https://groups.google.com/d/optout.
