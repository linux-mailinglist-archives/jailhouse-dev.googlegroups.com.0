Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVGQUH6QKGQEJELGIGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226A2AADBB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 22:51:17 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id bs10sf1884854edb.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 13:51:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604872277; cv=pass;
        d=google.com; s=arc-20160816;
        b=lIwuxMnLiUC0v5eO1FEDhR/wNGCXPH7OiSN0tLryJzi0zHpMK0pR03cIXRZGhTR3c4
         acwvX7oGXuvz5NG+0axf876wZjsGCG19TAbCJHKSN1xk5C9Re5d81wkMi76R8x/Bn4p3
         MsprMn2nioZLica8fTJLjc7l0YcGRfJOScThWGQTSl1M9HvOVDez3V+cWCmFursRQ10T
         O65Rpm8BNpv+OMVR3Vx3fyA/SUYhqTSHqJdF3aZzUoe1fSYj88Fmxmpp4TP0bFlysEs6
         7oVBNzhoEF8gRd3l0GWiumY2IiBrOZOubsHl+iZFBim/KtxsQIIJ4HY9QAkI4l5Sna46
         odpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=+bF7uZInQ9TQcl98LOnrnxOGGl3HV1ELHr2/ifik4Ts=;
        b=wA7dgVXT5DWYyk4f/yE5p4pzQiG79Rf53AqUBMZ2bRzGW5EDlxYzqwW3W8+tYd3jc2
         VYERzLr29qvRs6f+bIa81q/127W5SVUftQXIXSXdK6twzdSMnFz6qaUa6wAlDNJx8RnS
         hJa8nDBh+BUtvximuLDbSrU/0D9EpHWngwxiWy4s8kNpDfMOk1kJ+9RSjUN0IDOr8Z7w
         Dj4a3qAxBSQMz/YxGHQHZ1aBJEa/nRhgQ/jQPYmzYJqbgH8SJAhKNJ8Pr4Bye+LfUsb1
         mThlv42N26dvAlaCVD/nOm6F0MdfXF35VuhND5A/QjS/3reHWI05NgX+nY1dYCSSlL9b
         PUVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+bF7uZInQ9TQcl98LOnrnxOGGl3HV1ELHr2/ifik4Ts=;
        b=oRQM7qhi2YqHfa3emEFhyh0SFp+oCBJW5FmGuxCEBfhl6SndHaHXroI8/4ooOoUvOV
         xywouW4nQj7HZ65xypt0qsI90iVaJDI8V2kgmK99SmawGN+4edzA/f6GF9GosZPU+dBk
         /HO6ZuYsWP82aaUmoavVFv/m3ZNK8iQe4T5b19kq2HRrc+ppLcTc9Cn/9CemV3bWSmfh
         uv71jPHW/113D4q+ZwWAw2OpgWvwVYUJKkkJT8C75/U3r3rJrnbTAzZqwCzdDE4/tNn1
         /0d6NX6N4JGol8vGI0xFZvzwrpOjIpbzEaVUk/qY7lCw2hEVJiAyWQOrsTVKLLdLOGAj
         +vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+bF7uZInQ9TQcl98LOnrnxOGGl3HV1ELHr2/ifik4Ts=;
        b=aWn5jI2u5YSkW0cdNO2htG189jKxXPah2SIW0PyJVtrZ233LDyO2sMDfMmsEM1lCaw
         shc3IEO4hxWIWPHzFO239bUal2unk1v4a16dNtQWl+1Psi1KadbvMKxpeQmYi9grOSRj
         cfoqL2Ntdjoctgg4ws4j5RCL/wG4OQsOJ0kr+Ra9MgwxaBburhuK/Uc+v0x5bOg3NCjN
         yBCzHwbsSK127DDEkAXXjNcehnCI86TDGzvBFWW03masSdh+ijdBKVB2rC0U86OV2BJ7
         IBlEqfeFs6YHX49TtD1+fdQpIJ/gkyiCfTMFUUhAqhmtZOs8mOgJyXa2fGVJPIfBRcrC
         v0Ug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530s+ADKWCoagNb4wywZ2pWgrqJnorEmsD0LLnpPXpiY9AmN6Br3
	roVKeiE/WM9vHrFQ945uwoc=
X-Google-Smtp-Source: ABdhPJzeTZY515I/QT5ooQcG5NJWvhSw3iowimY2SAfjOwo2PzoPXW2ODSIgk1ePN69gz06BHhgegQ==
X-Received: by 2002:aa7:d407:: with SMTP id z7mr12704207edq.234.1604872277084;
        Sun, 08 Nov 2020 13:51:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5591:: with SMTP id y17ls3382079ejp.5.gmail; Sun, 08
 Nov 2020 13:51:15 -0800 (PST)
X-Received: by 2002:a17:906:a186:: with SMTP id s6mr12713080ejy.193.1604872275807;
        Sun, 08 Nov 2020 13:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604872275; cv=none;
        d=google.com; s=arc-20160816;
        b=tt3xloiE1ilpNWb1rPXpFZkAn2AgkTEr7xzGyHDwJ9s14IHhNKjDQ0DASPJNBNiJey
         r4LDiWTwESSHikOZPCGbUs8Pa9EFm9Om1u6jGkNjwd74pG25s4/YIjgHUKdGKwROSTaa
         CNL4Czkem3HY5PKP/TZMlAXOI6lnPHBYs8Qbq2kczoJ4sbNHFv+79v2wjBRkLcj6hbF8
         AfSix0XGlYBAasWp19dVEA7d92PmvjPaFX06WmlmCF727zwrCvkCahy2sqlszcBOjab1
         bXz7lP71B8pNbJdzhm+mDS3cvyEXHLeCqVTqxYs33J7PXXg/d7ur7xFPLpY1pOCTLnE4
         EZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ta0MW9F5GWnmoKefKUU2HnAWlJSVL8Yo9SKraY7Jwes=;
        b=iiulhfmmlgM32qJpDhCejTAmjBnK85dRr4FgnjCLTs7qXPbtVtbxuJezT+FyV+hzvD
         gUKM2U8zaUOUt64fC5xn/7uinCXbKAMt5uQN1biDcem3XcJJtshXuMFWwfiNABKs5cGv
         OWNudtlvoqWmcuhW0TkEuOf30RErVSrEsGDaKsRD9dk686XPs7sY7djnaLcrDAeLV6Ls
         kYqBsYMCkKeXkus/Dgfvs1ZVFjCl3w524AA/6z+7ZkYYpMQpGr/0JOkQEGU6jzjqjf9x
         IHwEsur23aNINgEAvQ4V/j3LpUgJx0048lNY/PGMfnevrxq72YVczfsm4x+UVL/ETRvu
         ApWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a11si181708edq.1.2020.11.08.13.51.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 13:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0A8LpFab018019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 22:51:15 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8LpEO7025014;
	Sun, 8 Nov 2020 22:51:15 +0100
Subject: Re: [PATCH v3 17/22] x86: apic: Wsign-compare change to uint and
 update comparison check accordingly
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
 <20201028210933.138379-18-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1c5995d7-8e3e-7132-d3e1-52fb809db242@siemens.com>
Date: Sun, 8 Nov 2020 22:51:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028210933.138379-18-andrea.bastoni@tum.de>
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

On 28.10.20 22:09, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/x86/apic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
> index d36c2033..b49a6745 100644
> --- a/hypervisor/arch/x86/apic.c
> +++ b/hypervisor/arch/x86/apic.c
> @@ -315,7 +315,7 @@ void apic_clear(void)
>  {
>  	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
>  	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
> -	int n;
> +	unsigned int n;
>  
>  	/* Enable the APIC - the cell may have turned it off */
>  	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
> @@ -336,7 +336,7 @@ void apic_clear(void)
>  
>  	/* Clear ISR. This is done in reverse direction as EOI
>  	 * clears highest-priority interrupt ISR bit. */
> -	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
> +	for (n = APIC_NUM_INT_REGS-1; n != 0; n--)

That's not the same. Will follow up with then patch I modifed patch I
applied.

>  		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
>  			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
>  
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c5995d7-8e3e-7132-d3e1-52fb809db242%40siemens.com.
