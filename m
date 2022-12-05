Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXEVXCOAMGQE4HW3FQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4F642B28
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Dec 2022 16:14:38 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id v19-20020ac25933000000b004b55ec28779sf2317087lfi.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Dec 2022 07:14:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1670253277; cv=pass;
        d=google.com; s=arc-20160816;
        b=0vQUhlsdTQyb4Kwukxnd8kFeeSmGZzNXi3bFKLqNsvaEypHLxb8i+P/IbxM6+dnCXg
         QpQjdId0OLMLN42HmxyaVoe9Hp5oXY9zzxyrvLITtK5Qlriolb2r7Jp2ptAD4dlWztg4
         E5wi0avH1ESjnpxAx68EsY6A7wQ9nN1wMskeobMA+/kAdnwcd+yCFyBFWyiD8wWYetuK
         sg4qSRL47xUfvCUgrFtTYbgk/yL97ZfBArfg/x7HBWTz/Wk69yTYm4Vly9+qFqJr+I8o
         xQCly0zthsoNsj48RG2ufokcLT0GDM+Aj9xQIag+e7kg9VhXbr0CFEaTJrVo5UglzjMY
         M2nQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ig6Wv7/wz4jXgZV5s2k6tWRs31x62qFHtDO+WXCLoG8=;
        b=G2nSzU9cLxvnaB9+KQNafzniz28btoTeL2gG9GYAMRTkQDBAeTZ2fTXYxjzh+IBqiu
         EE3H8fEDYrmmvifQz6jeTAAmhIH3pMn2/h2Tf2qNd/WmaEEZQDi0z3P+/JLhznKsd0H2
         ZDBHbA7nHwS8VgXZsrf90ztIUXww8sDaI0iRrDLbTjOV8MssazLaCWP+Z6suVKIrvt5X
         0hrYhsSd9bJdnXMM1m34VuvLteyZ+2u1FWgncbw85TQT1SvJDITG+SfRIxrUq59HHtoM
         WvukrxWOy7XZhPCpz3ZBQSgwLr37OL35JskGoCuU6cu+G8bT7Mo7oUvSTs4xy+uZlOTX
         km2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=M6hEQvmx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig6Wv7/wz4jXgZV5s2k6tWRs31x62qFHtDO+WXCLoG8=;
        b=iltWglM1Z+2BMBKeysQSFbkpa9CThM/ommDR0eBuNPE5tIWnLklyYRMk66JT6OjP1n
         /in2Eat/k0qAxwnyOE35W/IZCaIrTud2UKSUsyBYFQbvkILP8dDZ8tG4keVdTg6+nZYk
         I+2jeN3qOyqJog7YAYZEidAixceLx9uc0mwfm3H51K84sGaGgNo8l9gMH8ZZGk/J0TkC
         vdbx6Z6jbQmkiosCjhqbcrEn3n8wr2+2fUaBsjdv10YHCycf0LVQcgw2zwBo2j75GnzA
         PvlvRlZnfzH5H75H5Zf5SegYHxRXfqArhAp9xQQvE8b7G9ELuDY/Pk2iKxz6HWozDTGQ
         7Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig6Wv7/wz4jXgZV5s2k6tWRs31x62qFHtDO+WXCLoG8=;
        b=KCPBKlZDPtnrM3I0lGJTikioiLXbPWlrsa11pP2YJCpZD6ClwJBllFZM2RW/dVLWbC
         e1xBHliiKmMPwqrglzFY4BAUTLQIyAmwKILUakMEMfGE1e+Hc4C+TXmv1Xy/bsANDjLh
         8sVyescvs7HGokHe+/FZQC7tkJFsN+ex3b1IGWxjuSlPSH7HD10pJmgBRiat488Av9wH
         wvktm0Zn/Bnvex/E55KBvT+BQXrvTzi58kvMxXet4ijNxZIu0CHZ5TBZJImrzyB6K7zx
         IrHo6rJEIIwc43EOHPH5vu2UpdB2nAIla0vOukE6tXmkyTaWGScUKh23O8uibL1Mh1r0
         AxjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pnPq8OJIiYIBqi79lVSQAOzRss0cZ0ZyQSKE/QalgYLvMt7FZsf
	hSVUFiYGM5g6tew/VVeU91g=
X-Google-Smtp-Source: AA0mqf4z1qGxR2mc24d0S0KezI7oFsETPVFCa02y+kRmuKqgwh/SqG2NJWFc8fy7UQbwn1wOqgSWTQ==
X-Received: by 2002:a05:651c:1592:b0:277:b9f:cdbd with SMTP id h18-20020a05651c159200b002770b9fcdbdmr28064694ljq.0.1670253277420;
        Mon, 05 Dec 2022 07:14:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:20d1:b0:4a2:3951:eac8 with SMTP id
 u17-20020a05651220d100b004a23951eac8ls751841lfr.0.-pod-prod-gmail; Mon, 05
 Dec 2022 07:14:35 -0800 (PST)
X-Received: by 2002:ac2:414a:0:b0:4af:d23c:f6f5 with SMTP id c10-20020ac2414a000000b004afd23cf6f5mr23837446lfi.298.1670253275480;
        Mon, 05 Dec 2022 07:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670253275; cv=none;
        d=google.com; s=arc-20160816;
        b=Oj7cbSlt738wYvwrECiAFYrERrceCsQB2GWTTa50hrX47iS08p/PpAt4g1u3kBxMfW
         2+9FLDWx2UfZFcgNG0ay1HsvhvpikqQbbD0aUTGjyEM7/EH3FqQ7CGR4Jq1YZc6RCZ/t
         hgipGgXy4HzCANkszlu0VXmPpUbQCe5J6aszQHOfNpnWQNvmrBLPlaBRDiZYrW25wygB
         PtscY7SGYOptiLsWxL+y9BtH29dI212h1CeJWrqdbisnj3xbkl3PZ+yGyi16QlJt47WZ
         wYV+hAqY7VfHBPVeRxxu0fBsNug90DUFMw0KuHQv2sSXPtHoVFQEinn7GJD7KyH7gqcO
         3ZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kjFEWPuuinCrnqPqHzafuaXdUujWOn24RSsuxeh33OY=;
        b=J/gPS/0f8ifInKXeLBgfV3Qol7h7Zf2QZY5KYW2znxVi0qQJWGQSqVYLi3H5pr2sOP
         NAu3LzpU6nauWCF8WTFsFxGB3oCTmVykYVzjBJ/lpj1WNUM4aYZ63szlADuL+KQuJ/in
         M2Q8ZGo1jX3NflKCsQEe3bdViIoAIzTkhZXuoYcZzR3Hz58mEW1LB11sarF5JfLv72mC
         EAg58HWjUlRBifZI4/SXvtKS1TlF7UUmsY0ugpHKHyyoa9GCtVWU2VgQ4A6/QTGi+27U
         yoUl8+L1Pn2h1KxdQvuebcQbJ7ObszOLO2T+S57hj+9FyUcU4MUm5TlVohQrNkS0aY4X
         XHJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=M6hEQvmx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id o17-20020ac25e31000000b00492ce810d43si707872lfg.10.2022.12.05.07.14.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4NQnCG30Twzxsh;
	Mon,  5 Dec 2022 16:14:34 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 5 Dec
 2022 16:14:34 +0100
Message-ID: <34d2d078-1282-c240-9a65-301469b0bbe2@oth-regensburg.de>
Date: Mon, 5 Dec 2022 16:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: RTOS inmate misses interrupts
Content-Language: en-US
To: "nirge...@gmail.com" <nirgeller18@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <fde55f66-2e83-4df2-8f5e-44b0fb831acbn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=M6hEQvmx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Nir,

On 29/11/2022 14:21, nirge...@gmail.com wrote:
> Hi there,
> 
> Our target is Sitara AM5726 , CortexA15 dual core on which we are 
> running Linux on A15 core0 and RTOS on core1.
> 
> __
> 
> RTOS gets periodic interrupt from external hardware via nirq1 pin 
> (dedicated input into ARM gic).____
> 
> Under heavy load in Linux (core 0!), RTOS, which runs on core1 misses 
> interrupts.____

Uhm. Can you reconstruct that issue w/o Jailhouse under Linux?

I mean, can you set the SMP affinity of that IRQ to core 1 under Linux, 
and then write some test application running on core 1 that just 
receives the IRQ. If that issue happens under Linux as well, then you 
know that the issue has probably nothing to do with Jailhouse.


What also might happen: If there's enough pressure on the shared system 
bus when Linux is under load, then you simply loose those IRQs as the 
RTOS doesn't have enough time to handle it. You can test this hypothesis 
if you lower the frequency of the the periodic interrupt. If you still 
loose IRQs, then this should not be the case.

> 
> Questions____
> 
>  1. Does linux/hypervisor participate in interrupt scheduling/forwarding
>     to cell on Core1____

Linux: No, Linux does not participate in anything that is going on on 
CPU 1. That's the idea behind Jailhouse.

Jailhouse: Maybe. On ARM platforms, Jailhouse needs to reinject the 
Interrupt from the hypervisor to the guest, if SDEI is not available. 
Does the Sitara come with support for SDEI support?

(You can btw monitor the exits of the hypervisor with 'jailhouse cell 
stats')

   Ralf

>  2. Is there a description of interrupt forwarding/virtualization scheme
>     to cores (if exists)? Any pointer to document/source code would be
>     appreciated.
> 
> Thanks a lot,
> 
> Nir.
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/fde55f66-2e83-4df2-8f5e-44b0fb831acbn%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/34d2d078-1282-c240-9a65-301469b0bbe2%40oth-regensburg.de.
