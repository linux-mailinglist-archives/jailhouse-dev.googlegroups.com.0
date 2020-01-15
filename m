Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB4U73YAKGQETNJZJIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id E656213CF78
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 22:54:15 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id u9sf4457679ljg.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 13:54:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579125255; cv=pass;
        d=google.com; s=arc-20160816;
        b=HMYUthySvqJVbUdoAAnlrAGv4UnmoWUFbFEnRqoJEQomlOHOsyTPpgMDAiTcByvMgm
         a85Ql5epStdTfpqzoXSSwcihJ0jqBQNXBsrcjh3A2Xm3igzOvBU9X8qLHaIWylrMSFvU
         0Yd2urB2rac0SDjDDWNLkTMU5NYce2O4MnzXzs6FQbHVuyEX/vLTtU5yVo/TxfQs+EAB
         3IKUgbypFzhcF5fZJB4dHFAiYY8FNrgrzLJh6YBPaiBmNMpgVFc4anicAGsPfnEXYL/i
         vJ22nHTNQlNshjFbfAhx5VnQgh1tZHjLG0AfdiQThYLh2Sd2AB3W0wz7V1H6z0CcEjo+
         JiMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=6oW3qxEjqZz+2GGmlNcMNan+MtYSVbYskUrtg6IR8+A=;
        b=QRwnYAzp/9bl230ZT1O/tpFzTw56iBuaSymd4WpmjDTyozbF+h9su7aL2tjDzLFzBx
         i72o+wByV447uQ/QBz3WZtDH8YrWb7wmurA1XOix+AM64VGv9ySBxwDGdwqco+hGAume
         PeZKVyy9WYh4q/jSHfURUegVqDI+z2mUGb+l/WrylFiMmoOSYXBOlG/dCXDJgCLV9M6X
         DWPF8eBOw2ZTRWfeQsJc4BAVajtLiO0+pk7rHSLNc3JesmlO/NsUCQIPJB47mvn6OVpl
         T0zAufzCgaUK3e9Jd0tNC+yQYJaMhyrrWLx1ykUB3ViD6qxjauKuWcWgUuhEdNCL8ojP
         L4pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6oW3qxEjqZz+2GGmlNcMNan+MtYSVbYskUrtg6IR8+A=;
        b=A8SlhakpxviF5l+oSnZikUcloq1W/eRV0xYeZxws8TetHwAkRIjWBGQXv0iBLtK+P9
         bb3A9XIr7qnsc8cg94bZoI2kvQetbl211oHh9C0Xu/eZQLblO/5agiHCDDJpODZP3JL1
         BdiZUHQQ5TAvOmgjAQanyeaaJoIz8FY1o4L+0lK6QYea+/9hB32qrjfGiCW2GFE+3l7v
         mU89U7XUkoydQmb1QkDDfHSXXL9X25AB4DQ9SiTUv/rJDDy3A76uq0nRXY24pfs0jiya
         qQgjHlxPtcB+kixrwp+hcVk2CeJ4EB5VlH9S7GmDkuMfd4PVHChKEPKo5yS9lyI2QZ7F
         BWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6oW3qxEjqZz+2GGmlNcMNan+MtYSVbYskUrtg6IR8+A=;
        b=tOWU6Y7Y4GKIujB7Hpy4H+FrA97J6lV16hTE9TASNcGnIjqudoOdHUwoYk9cYocP6g
         njP5HJnZBlvXGP2ShXuf1ur0drywJhPly5yxT94vN6/O95iyWEthLU5X2ZXgVG96GqiK
         UGuXA1Ik1wp06X6t/k4KxXkcK/wQKCCRNagC8QUbWTmJZQGbN2nXh/vg7z8Ud4IK8zof
         8qdVhDZV03unL3Bwd9g2j3IIuI5tNCoshlw9jDY3xKWHCKHcEr3H1BYphMa0Mv7lMRsX
         KRyXoekqUlsb2diSMLAlYwb+REuSOPyPBhdEZuL7r6SarsJf0Wx2MK6DYBfwf9z6WQTh
         5ulA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4TXfLVBwtd+4guarBWbePO2h6ylishjVlJx28gBnyBIR+39Kb
	fXvK0Hb0gabLHOrzrtufSQ8=
X-Google-Smtp-Source: APXvYqwQaCXr+aa6mWfWRvYLzpFInFJZ1y4bL4NPH28LVLmI9xAhOgh5H5ax6OnhFBqs/hLE/FQ5Xg==
X-Received: by 2002:a2e:8651:: with SMTP id i17mr286052ljj.121.1579125255377;
        Wed, 15 Jan 2020 13:54:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4182:: with SMTP id z2ls1944021lfh.9.gmail; Wed, 15 Jan
 2020 13:54:14 -0800 (PST)
X-Received: by 2002:a19:850a:: with SMTP id h10mr548093lfd.89.1579125254559;
        Wed, 15 Jan 2020 13:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579125254; cv=none;
        d=google.com; s=arc-20160816;
        b=Iw2VD7/d/RiFS77TzCkES8NZO4cPztItyof1w1R21A+/kOWyRqDK73mLZALy+Zv4tU
         EIb0lW6sS05YV7zyGyQFTtHiRqJrax8pHjHXTPgXLP/jidthGdc36Ids6ozfoqLi7Jgz
         YyPNlCVyRSM1W1uN0q8dZZZMn4XxKeXbkXajMNHwRYP5q1/7CS5S88IDBQZTvyhw3znt
         qAS/L4/tp3wAvzlBdvmm8IngfQHWcVRDlzM4JIOBTKp8Z+HzFTMPt1lsIFXLtp5GbUP+
         8rKwbrWXomMETZXfS5nZJAHp3xPZ/NeCu0NwURyDp9mtsyXf9FxXnCijEd4PmEp2zx9K
         1oHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=4ywf8n89MbmC9HCvgoQUXB0akXg8So7YlmNkTg8/Zyk=;
        b=yuRVWCvocmTUuIwLy+BCyvPeWrweoTlE+2BlTcYJyCR6EN80QqixCxPf52N1+P1ovR
         SjpiVZp+JwvucV33wRaVj38J2+AiBzHFdDgHPyP4lsrADSudwhfI12ve+/NC4vJVolz3
         jBInF8CoJUR2K2nRvnCpBgCE12ZIvRFA+qQC1QyFqo+pfCVmhR+cgbakZoMDy5GW+Rj8
         87X9IMXMyYRableNF5Z2ZJb34567wYLdVHBGEcJy4T7Q3HQjG1Qyp6Eej8WmawQVbc83
         UzmYkzhuJLI2tuZKb5nB0cdsWxQ0392EiXXckKvVmYt0vpl0Yl07RzO17mjVIUICiQOB
         yJBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o193si915330lff.4.2020.01.15.13.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 13:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00FLsBmc010164
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2020 22:54:11 +0100
Received: from [139.22.32.100] ([139.22.32.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 00FLsAUl011398;
	Wed, 15 Jan 2020 22:54:10 +0100
Subject: Re: [PATCH] arm-common: gic-v3: ensure LR writes are visible
To: Chase Conklin <chase.conklin@arm.com>, jailhouse-dev@googlegroups.com
References: <20200115173339.3317-1-chase.conklin@arm.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3002c7cc-2ab9-6e06-0aec-28e43abf4ee4@siemens.com>
Date: Wed, 15 Jan 2020 22:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200115173339.3317-1-chase.conklin@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 15.01.20 18:33, Chase Conklin wrote:
> The GICv3 architecture does not guarantee that writes to the list
> registers are self-synchronizing. As a result, it is possible for a
> valid interrupt to be written into a list register but have the empty
> list register status register report that list register as not holding
> a valid interrupt. Since the empty list register status registers are
> used to indicate which list registers can be used to inject an
> interrupt to a cell, it is possible for a valid list register entry to
> be overwritten, dropping the corresponding interrupt.
> 
> Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
> Signed-off-by: Chase Conklin <chase.conklin@arm.com>
> ---
>   hypervisor/arch/arm-common/gic-v3.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 906d9a8d..6a1d90f8 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -113,6 +113,12 @@ static void gicv3_write_lr(unsigned int reg, u64 val)
>   	__WRITE_LR8_15(7)
>   #undef __WRITE_LR8_15
>   	}
> +
> +	/*
> +	 * Ensure the write to the LR is visible to the GIC (so that ICH_ELRSR
> +	 * is updated to indicate that the just-written LR is no longer empty)
> +	 */
> +	isb();
>   }
>   
>   static int gicv3_init(void)
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3002c7cc-2ab9-6e06-0aec-28e43abf4ee4%40siemens.com.
