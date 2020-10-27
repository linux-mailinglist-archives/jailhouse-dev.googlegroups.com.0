Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4N24D6AKGQEZV2BF2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D229ACF5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:15:30 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id m11sf752844ljp.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 06:15:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603804529; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ik0LfTYK2eCY63S82804+5JsIqfTbqF86EDAdiAI4TLoAPTB6yVKpSKnI7pj4dvHem
         to4Kzk8SR0XAc96kf1+caCqQjsBLpo5Zi1jMftK4+vG84GgcpnSNzgRIZw8/BAnkLUP5
         RGB4ZMByGybWw3otfisU9mQTNxhoSzkqlJ7IDdndYjBGg5G03BuydHC/KO7dy29WiXqT
         eBxmD6NbIMuwWQ4NhqBMLyu1Vu8+Sk7d5uajZXHsCv1jc0Xn63E4jvYdxmzhdYNoi2e7
         ZUtJd/pTZi9pFS3QzPoWMl79X1TW+QOf3LH6uUT9guQjKffmV5CcUM4XZASFFQdx03qb
         yvOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=4lsGz3WDmTB03nz/8u4DDz9H8X3/gJKQwp5arHxCQZM=;
        b=GtJIQBNkJkRRlekcE6Jw4iejrj8ahVMSN2JTM8C5zcuhvj8elO3LitNHDwkqG5FhWa
         6muQwgEOinzqmSZh9oQ9JDHM8ih8i43v2q414ZGDTcWJptYKdE69uPQqVDdAjleDaAtr
         LSUCBDq99ewL++rcwxdWGCUonEVdE53J7kFUx7H0w4XNlTmrpu53TeDyfD9q/L6G24ZA
         k3lRYM4dBxvgPQuh93gQSPUb4PHDTET8z3dZUMfNnUdLNzCEkbqOx5IP+GtIzV5IL2vq
         pHI9jxxCSDwass359Ojrd8QdVj7M7+5moWBIBle0igFxdiFuD/pYSVgn535wiWIWc5oX
         h09Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4lsGz3WDmTB03nz/8u4DDz9H8X3/gJKQwp5arHxCQZM=;
        b=FVIdwcVK35Gul6X0rBxrmivI7/H5LsEX60uMb1WO47lYQRQWWIEfKEJsSxl3KBtzs+
         UCii8YHFaEfuNN8gbLIEmnpi+0Q0caVBG9iBPwM/dDQkXENaiHmNmjeANX+y1Z+TQaPt
         6Q+rTpypmTFuKVGhvOJ/j74LbU2aeeTKqmuBdnJqzv9srzxkgrxARQQTVzWDepIF+63T
         J0vjAUErEYNusTWeinvlLL1IAPU28gQUtrOQT3l5l1ePHtE6moK7TAdXJlye7DvzOwyb
         nljc6V/ZY/cV3uM0ScE5VwFOE85P86hXOiqnTNXsS9bi+gQ3ppEkoRkbHzggWKrBfoju
         NGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4lsGz3WDmTB03nz/8u4DDz9H8X3/gJKQwp5arHxCQZM=;
        b=pvqNRT44G7KaY+GuyOG9NPL9fq689Ghz56L1psKydmEzr55J8qw8uIAMyrbtzrGpWn
         /rOqeshZlYKADtjr6jDcBvKlRGkmRBun9vJVENbIdPNWeecv/m9i2hb+NH36BqY+w64q
         UmaGMJ2B+sNUvFXdRqqbni6hQ8j3ZXoo6FlKEIFODtWxpxhfn6/qtFeu5OGkEO07ivcd
         tn9iRPgRXxt918XPQCibmuJy49vld3ZIa1Mjsh7Y35Vu9v2Q7ZV1H8V2968z0IZemFrv
         +i74Jg6LVvez3VTqWjxJseGt/2XdEwB6EAqL/+wLroBsaarmhEX9hJR7pRkI5ZuJarb8
         wSZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gag4JG4BmXIj1lqqVKZvRD0VCbkvHjQAqNSB6xP+vSzQGOCJJ
	Fh8M6T12qP4+zlHiItsy6jc=
X-Google-Smtp-Source: ABdhPJwSOHpfRkjwagIAObXUNxot3inCA4N/ygDo7PkATP080wTAe4yv5FE8ULClxzOjbTF9q6/Ngg==
X-Received: by 2002:ac2:5dea:: with SMTP id z10mr934882lfq.468.1603804529510;
        Tue, 27 Oct 2020 06:15:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls653541lfr.2.gmail; Tue, 27 Oct
 2020 06:15:28 -0700 (PDT)
X-Received: by 2002:a19:f510:: with SMTP id j16mr894444lfb.91.1603804528181;
        Tue, 27 Oct 2020 06:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603804528; cv=none;
        d=google.com; s=arc-20160816;
        b=uMGjY2kZ36Ctd1m/2guzykGlgINrcOq4wyyZOmscu3BPaX9NkcllDtjmho8Lp6EDO4
         +QmXzppviUeFdpoq9NxxRqT+kDav+U2AbQWGgkd8uFw9z0jN7cgfBjjOryc08YLpcvjf
         2lfi8WXYYQBEjLOUvFPssZsVAX3MiKfoHp20My5YdZ+/mQsLYJseC/VbXy2+jnQJQF7K
         9t5kvAr4YZQXLkPCPt886CYqMF2Hm7uH9k4YOjhKno2uWLeXHBeA1zuNqp1HpoJGST9Q
         bF6s2m0ctQHeMQCyyX9/iGpHUEFLh5e50hXxaJLXVkfTT5P9eiOusGXT8IibrFeC2YeB
         zAHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TsnO/LArB3FNyM64JC1vSOTjjVZe/O1ocT283bcLZHA=;
        b=Chup1pevpLR9XzU+JRudvkOoUjNzJRvY7jWcB8ehXFrSHI1yEWulJrUzCUaQzTnR2D
         XeKh+l7O6BZ8HvYhjbP/uw4GxmRK/M2I30TTo2dCtprzdgjjgVrJ6hhgyqVM61bvilnx
         HLzkXuaiwgqafIrFzYE7avEYfPDiAtof/uh4Z/zhn7kU4hehY7zM9FNN34jAqCMsgmP3
         plkZqH98YPivAwyD7YcKe2/k9/RMYUZnc8k7zLCU5IirQAuyj0titfpunFt+WEoihY7H
         LVcPF7FMiQCqJ0aJ/v3+TkZJtOQrFv4E9y6pHG90QXtYQ4r//b0l0akNPGb16vN0+lGM
         xxTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a1si48468lff.2.2020.10.27.06.15.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 06:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RDFR2H028998
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 14:15:27 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RDFRUM032280;
	Tue, 27 Oct 2020 14:15:27 +0100
Subject: Re: [PATCH v2 14/33] hypervisor: printk: Fix Wsign-compare in align()
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-15-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <22f10480-64ae-8aca-ed7c-115a1e376ed1@siemens.com>
Date: Tue, 27 Oct 2020 14:15:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-15-andrea.bastoni@tum.de>
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> Cast width to int. This is complicated to fix without a cast. A possible
> alternative is to cast the char* to an unsigned long "address" type, but
> that is even less intuitive.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/printk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/printk.c b/hypervisor/printk.c
> index c9e22b29..a32ff8c4 100644
> --- a/hypervisor/printk.c
> +++ b/hypervisor/printk.c
> @@ -133,11 +133,11 @@ static char *hex2str(unsigned long long value, char *buf,
>  	return buf;
>  }
>  
> -static char *align(char *p1, char *p0, unsigned long width, char fill)
> +static char *align(char *p1, char *p0, unsigned int width, char fill)
>  {
>  	unsigned int n;
>  
> -	if (p1 - p0 >= width)
> +	if ((p1 - p0) >= (int)width)

p1 is always > p0, so I think it would be more logical to cast the diff
to unsigned int (along with a comment, maybe).

>  		return p1;
>  
>  	for (n = 1; p1 - n >= p0; n++)
> 

You should also fix up the inmate/lib.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22f10480-64ae-8aca-ed7c-115a1e376ed1%40siemens.com.
