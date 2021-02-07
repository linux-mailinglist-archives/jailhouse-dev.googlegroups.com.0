Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU7472AAMGQE7YR62QA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5731236A
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 11:17:56 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id k20sf8308972ljk.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 02:17:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612693076; cv=pass;
        d=google.com; s=arc-20160816;
        b=SUfjPO4HX0tEtutZ0WxyA+3icqB7E66iEmZ4ln+HJKFZhdiHxM0D9LrVYUM1JSlpzw
         qH8LIJp8MmTSMHO0LSc7LPkCXtnauwdnlCY8G1U1kO4snMtgn5ilQG1CuYzu0YdL/Y5m
         kWnEHaGYghcmNw5Z3fX5pS3XuvKn1KsrjqSEMvaJCRqAdUBvesWU1YZ/PZ8LAeZl86J7
         0g6QzyYYgKsyXAV3HaLUlnmDWclNVPHIaHghGWvdQE6WKgviFvRoXWVeftoxUfbHKOCo
         PMnZfm5/PgWEBnYDKAjKkO38SIzbvqDYTjymMworQsCM/DpemLUxaBTJitrXU9XJHLLT
         b0og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=QW5uJcWjiX9X6PQKPi+ki5Jr0WddDMynX5RQnThNyxE=;
        b=yJoGyRNyo5Wi8pf5WqDeC9ENEOOZroYk38OE4A0NOmdWiq47KJcKHvrtfW5F9sWpsh
         PTGHxM5NUo/bMU5Jw93NyLc3jifiqv0jpOnDWlycLpMNyNHqBs8W80kXOb412t5NUJvf
         nUDc1tNDG7SDnvqwB6nI8TnO+aSQ57Er6IUklHvlhnciiLPAwBqWTAHkIXzrWvD1EVCS
         2b7gguktRFOISdx2Px57zrWDPTZ16reSNvw+4TAJWyh6yKu4+kCByfAFz6jvp7NRX2Kg
         O2Yn+zELLUOdJHuerYYKIgKeJWzE4Yp0q84jwva5aP8de+9nFjs07eo1160oXeQNJYxp
         UJKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QW5uJcWjiX9X6PQKPi+ki5Jr0WddDMynX5RQnThNyxE=;
        b=GjZU9COTx4c3AkSY9t9GRdWiyYGOMlEkgBdEOXHOAIDImphyD+HZmuUJVmeir4GvR4
         tliCa+njUAWEBfqWhhTJ5N0iccjzrNHRdZBTzbJ8LgQSnXLvhrUawl89H9DnTCykCv4Z
         0hFBlahSmVHxS08aCIF6szVQ8lr7XPV9cME7mqWOg8waQQBJt8ni7bSdpPZKrvgU3bOH
         9rVCx4E22WMuambCoYS4EY/eatE2QT8nq9fIOolnBxd+eXNX/Fv80/VjYO72wKAFnvvd
         URBDNPHAIeC/sXh0KHDetjzrzsx9ln0jor/hA9mXP4XRa0IbT9WEaKcEaVYypIF8XWbh
         NacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QW5uJcWjiX9X6PQKPi+ki5Jr0WddDMynX5RQnThNyxE=;
        b=qTDmf69gySaLDG2ITu2N0m/48SCUinHuL9klVZWo9BEYmXuO4xuv+6eJWs1Xl7KP5G
         hee5Gf9pYt5P9if74IOQ3isk5EJpjKcsDpB8xCfM3ZtNLTEkT0DuzdeemQNSsFk2CbdH
         0q6xvkJtnClnPqLxlq5u0NfJYAaP+GaTcyrCB4N3tbe95X9/nWk9jc7cyli2fyYVDYmD
         r5e34DosIG2cCxQ9BE2wYbZKepAqXuLJ+AwEHAr35H6t9Ew7H3Vzfm3q/rnBiukOdxS1
         OxwpWBpTkEMv+mf2FEP/vDqDeL3m+jrmxOCE8JRshYDXtV9ia2FuQ7qoKCfI6YL6hlzz
         C+hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ppJtFK2d+iqnfmekVA0HHAr16oTwWmnzWf0QU1tpzUWsrFTTH
	GeAdweg83v46xN7Yq5ynl9Y=
X-Google-Smtp-Source: ABdhPJyvoRNnB4wXtDO6HQ1JdSVM1yIehVnPrfcP8Qy/hetYWfoRh9omgdmCek8pYGF1MRXqyGGqzA==
X-Received: by 2002:a2e:9dc5:: with SMTP id x5mr7578382ljj.42.1612693076197;
        Sun, 07 Feb 2021 02:17:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls2118640lff.1.gmail; Sun, 07
 Feb 2021 02:17:55 -0800 (PST)
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr1718877lfg.485.1612693075104;
        Sun, 07 Feb 2021 02:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612693075; cv=none;
        d=google.com; s=arc-20160816;
        b=roSQS6YEp09PmdHEAuQNYDGsmf2whcueVvU8lquh27m5maoxsXqDaK8shZI2jQkf21
         RniYwdVIU09VXRX5iS+wF3EcHcdqRBE7xlp8J7hRNIrX/MWQWN0LNtkqX7tBbchUnKC7
         RgTX3ibuIgZ4rpOpwcqpN/kW9ErTU/Oa0FqnOejeGj6dODI8WX1kew8w58Xrj7qxdTV/
         FChyOuW6k117D1o7yPuYx22GD35L2MDktXxDdvjRR1QQZ1Zcr3T1Fa5HFdQiPDFHZFKP
         1zxkZY37Qc0JHkYnWDxczW6yCiWffhP3hVBllEbktE0Ik3pfc8QDMeC4n8UQGhz5WfYL
         /Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ILPKgn9j/GPKNl0Jq5YXxw8vNkDgxNefJX8lHLUbu00=;
        b=TkZ5TqDFSfXlxbTyRaTN+w9/Rsh1KLu7YYq+x/ROdPIMseKrheftOZE0Sneh6tUA+V
         lNn2iRAaPfda8tBL324F5rrWVTPnAW/K1TEai2E8k0sFGU1VcDhek4SvcfTgOvfThR/p
         yiz3Oe+R0MvLjoL/1+5x3Q8vOOeA3uZ0pQBQILpicyj1Epx31NFXog7HbCJiT9J50Q9n
         rx8Kdyha4HTlqD0JRIFy95T4MUo2mwkAV9Mpc0/QmVflXwKpxsCfUkKwQNJz1i+3wKuH
         mqTwJz1yVzo1ZdDodZi4U8arP8xD4YMqJ+GDUDLPqCQ4rPwSxiW21ELVZZiQk8xA/Zco
         jfwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u7si633278lfg.2.2021.02.07.02.17.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 117AHo5C014018
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 7 Feb 2021 11:17:50 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 117AHo3B015946;
	Sun, 7 Feb 2021 11:17:50 +0100
Subject: Re: [PATCH v1 01/23] arm-common: bitops: add most-significant-bit
 operation
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-2-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4b9466ce-3886-d080-dc41-e667e4e2439d@siemens.com>
Date: Sun, 7 Feb 2021 11:17:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210125120044.56794-2-andrea.bastoni@tum.de>
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

On 25.01.21 13:00, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
> index 808c9a0f..a726862f 100644
> --- a/hypervisor/arch/arm-common/include/asm/bitops.h
> +++ b/hypervisor/arch/arm-common/include/asm/bitops.h
> @@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
>  /* Returns the position of the least significant 1, MSB=31, LSB=0*/
>  static inline unsigned long ffsl(unsigned long word)
>  {
> +	// FIXME: the ffsl on x86 isn't robust.
>  	if (!word)
>  		return 0;
>  	asm volatile ("rbit %0, %0" : "+r" (word));
> @@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
>  {
>  	return ffsl(~word);
>  }
> +
> +static inline unsigned long msbl(unsigned long word)
> +{
> +#if BITS_PER_LONG == 64
> +	return 63 - clz(word);
> +#else
> +	return 32 - clz(word);

31? Something's fishy here.

Jan

> +#endif
> +}
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4b9466ce-3886-d080-dc41-e667e4e2439d%40siemens.com.
