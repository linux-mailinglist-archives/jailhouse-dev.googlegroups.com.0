Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHUZQ75QKGQE7EEJAKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F19E126BF45
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:28:14 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 1sf907417lfq.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:28:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600244894; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dq4Er/bvflhN4OUBZXOI6yRiwYcnDWfqwfI/lKtd8j7gg0MMts3kwLmqJyPWokNdvD
         HyimodOYa+XyTU73J8t5UXBR72gV61DM/lszmeim/bgZULGQM++32lcHEykkNolUTl8q
         F4V5j12sqABZHs+FkgwbV8X2THkP9nccSa5BeMSAdcs27+34dgNcSLx1qBztG9Ax4gZH
         NqUp/nEfhdqN3/ikp5rd0hRVs+M9BNBRmoyheOEdChC+W7Ym1LZAw+EYDG1hvA908/S6
         PzAG4i5T4DC5zth/BfxQVVRa/X1AUKJdy+WuyfNK+kxPQj0s3WXA6v2CWZDNjEBmHQUr
         Redw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ym5A1/sP5S1veUhghws3GV54noy3WNL8mavs4XZIUdA=;
        b=k0bvYXYj7Ia0Uebdh9P93V8yD9Vc91ODKpKlrfTXzVLkhMyhsxLqRFTHpvKII6TTcJ
         fYh2Ksutb0o7yDqbk6a7jnTLsK7NcjFIS3rBvCnXOamNtRgbH0S5fd6wpFMhcIlCrEur
         xMQbGM/hEqgCtV87jkttIac3Q1JZ2wbPT+GVnmI2pfjooRghtGYjkP60pLGbFAv92C6a
         P4ylikYbO07DVSK2KB3TqLuNXcP+f1fl2gx0Rjk+ZU15ENlakkAIHIPi30ZNePQT+aVA
         PzZWFV2GMj3+zyy7z4rMnYh/LgoOzdkyogJiPzk1GbgGqoE7hncrEXYUowbaeNHuPGu9
         xOhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ym5A1/sP5S1veUhghws3GV54noy3WNL8mavs4XZIUdA=;
        b=sbO64bnSx5QQHL8p137PiCX/gSC3gkcAWFaaPpOLDobX8eZyfar56Xulnr3kqu3e4J
         tyqpFEvypilzOhY7JjCwbZ6ZWzicuy2YcI4gqqNUD20/xSF8t9xH5W3jgdppAOoeB96H
         tk5x+MqlhG41tjqjf9AkJoSTRiyQIm0dBIJCBValvnIPh2mLKfN7wKHUjb0593RieK32
         DqRscbleKDZgk46ZEjcc/a9IzrlE3wa4tBwhnJxefOlfR4rbqTgqSYQIg/Nw/meWYlpc
         0r6sDhjbnim8c7CDFaZwk6PGgsq23tSgN7/UJZyCQQt/aIWKH1RnnjTdR7D90LkRj3zD
         +cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ym5A1/sP5S1veUhghws3GV54noy3WNL8mavs4XZIUdA=;
        b=YxBcSMaSjlgJ+M6qXV+s09Vqvi9ymLyloCwW8+cOui+pe3QylimVSOCRp+CspAq/0y
         OGfqe0laroq6cF4JN4X33ug6cnjQG7oymNZeQXA2p1iFjyCO/aXkHGuB3DOTqe0BeTuU
         5twIDFHj0nzievpeNRwGFl4kcGH7QmMGzI8q7vypE+Z2MTA/x7X4WiaUEl0wwLhBoswl
         rdq7tJI4v9yhWiyB0IPEQXCwB4QGLP5jE1I4VjJI1jK62nQ3Tbmkhnc05qeo/wwXWL/o
         Qb5jEpSERebYDNUvvO8sQ9r6U9yjP27ZtDcJD3TLe9M9IlHIz3E1s8t2xBsbuDxkjQRV
         CwrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532u9aEtgqRdHRn+WzpFw+0LXOIe3qy9mNl8EuW+LXjGplfYpDDf
	zK1QqC3rwv4yAlQtc+cUEA0=
X-Google-Smtp-Source: ABdhPJy1p87nHdf9SR1/mkpW+fc55m0GwRKMnqRuWMeGfogyMdapKkIZKTTWtVF5Jyf/OWZ0UOy0Hg==
X-Received: by 2002:a2e:9aca:: with SMTP id p10mr8581166ljj.237.1600244894531;
        Wed, 16 Sep 2020 01:28:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls171254ljq.4.gmail; Wed, 16
 Sep 2020 01:28:13 -0700 (PDT)
X-Received: by 2002:a2e:9ada:: with SMTP id p26mr7538487ljj.54.1600244893149;
        Wed, 16 Sep 2020 01:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600244893; cv=none;
        d=google.com; s=arc-20160816;
        b=tGDGSV7rPHQxO8IKd/BG34mI67eike+1lYGoi8PX+ddomSVd/ev2yyD9IYTPPk8nAV
         KebCPAJw+VohZeufPqSMjalT8cZWg2Qj9KPRvitnKT3Nq7fD2zF/AsPujOlaJ1KvPnpN
         ezBeluejI0EcvTLwQjC7BdK+OeRA5j9J8cCvMMgdp1C46mtkTPqP+NVmrz+BqaShXSEV
         ejmnH9VgAgWS+qBGhDxSv8JlV8xBtAE/L1uBMatbDKkeUl95oq4rMWfzqf1molM+0YsX
         1N1MIYlx/j8H0DP5BnsORFA9PIXUVwY0pRmcxGy1gPAlNK/fuFX/HgxIZSBHLcRAu7WV
         L8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ACTu5V1uh+TXO0ZdUb7OEN8E4LU0bwegb3EoVghbQRE=;
        b=T28y0CwyCeW70TjDIA8hif0jCRCs7vPTBU1AXF6cmODJrAOFgTXxfrw1QbhWq1Ttvb
         hheUynYeRXDguJ2358/dlu5B4TZCWTTGsUtqpo1Wk1TeYIHLHmMROASDP+byLk/P1LBk
         o4mpkJxd6PY2MT/vVK6lRg65BtQ4syNJfry7pPWTMnhHpmVgHQOCVXlEJeGvkqKmGmq6
         /ZcS+evla/sz0ZPBveQsSB5OhljsdXnggq8RskIciWzcF5/KiCQh8srRH/dUHs56uelD
         EL0wAiOa6hcRZ8BkEirsagfwDuaB2BlyIwAPyP/hWczqrE0PuWbz2NzRYVrFhONMZTq2
         eaSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t80si342794lff.9.2020.09.16.01.28.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08G8SBLw027178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 10:28:12 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08G8SBI2005693;
	Wed, 16 Sep 2020 10:28:11 +0200
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
Date: Wed, 16 Sep 2020 10:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 16.09.20 09:12, Oliver Schwartz wrote:
> SMC calls may modify registers x0 to x3. To make sure the compiler doesn't
> assume input registers to be constant, also mark these registers as output
> when used as input.
> 
> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
> ---
>   hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
> index 1a5d5c8..e7b6723 100644
> --- a/hypervisor/arch/arm64/include/asm/smc.h
> +++ b/hypervisor/arch/arm64/include/asm/smc.h
> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id, unsigned long par1)
>   	register unsigned long __par1 asm("r1") = par1;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> +		: "=r" (__id), "=r"(__par1)
>   		: "r"(__id), "r"(__par1)
>   		: "memory", "x2", "x3");
>   
> @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id, unsigned long par1,
>   	register unsigned long __par2 asm("r2") = par2;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> +		: "=r" (__id), "=r"(__par1), "=r"(__par2)
>   		: "r"(__id), "r"(__par1), "r"(__par2)
>   		: "memory", "x3");
>   
> @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id, unsigned long par1,
>   	register unsigned long __par5 asm("r5") = par5;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> +		: "=r" (__id), "=r"(__par1), "=r"(__par2), "=r"(__par3)
>   		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>   		  "r"(__par4), "r"(__par5)
>   		: "memory");
> 

Good catch! We likely have the same issue with our hypercall interface 
(jailhouse_hypercall.h).

We should probably look carefully again at how Linux expresses these 
constraints: linux/include/linux/arm-smccc.h. That appears to me like we 
need "+r" for input/output registers and "=&r" for those that are just 
input but might be clobbered on return.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/068286c9-d55d-d259-8243-5dfaf10cba5f%40siemens.com.
