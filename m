Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB76D42BAMGQEOR3KF6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id D00CA345942
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:08:31 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id o8sf978426ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 01:08:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616486911; cv=pass;
        d=google.com; s=arc-20160816;
        b=YSGsC2FLNnv5xgifqKRSdrYJ8p8OJnQMYWNtHT9E9hmzc4rrnjmQZzukjsfhgNxotk
         s55z2P/xA08uIGYCyG1Jpk5y84DMIAbClh0ygJt7fjJTCojDWDRss3W36nkpDNaUOHQW
         i4ejTe2KvqsS1H4VrK+dp2P3OKlrUV212Ds/jewlUmj4IW4TEklfTgEk0G11E7wobjRn
         y5Wv/o9wrurUVHsSEYhPOXOfzopiFzaReQsRVRpdXq+Lgl9FnojXHwBvgAT7uXXVstz5
         QeVDZDKjeb8m8y1r5l6qAbVX+9qYToWya6lZgBLW90jMxbtpehWqAPY+E3LKv7jUqvEb
         PhGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fUDbkUgsFvNGcR96yjLqsltA1NT4KNtGaMiYXYmLpm0=;
        b=xsxvH3lHSyURzPaAFuTEsd0ramzgmXPB/7Uqgrxv8TIkX7vfKaMkPUjzAnxuJ5eQZ4
         5xcA/O9xJ6DZOzLTYHS5fAYE4fD4qWJ+8J/zP1g9w8yhLoXij1wG7gBiqwxqpH/DMIim
         f77kNra7gpNDEObiW2v3o+DDCtY3JSIgPTZUlMc+haL6GV2xML+SixMXuvg+gH5n8jO6
         B4mVtlGMitBpkWE/IrGp2H2HjJaIBUjJ+r13wRNsBVdyxweqmKCwPAg24aRZK0L296px
         V0VuUN3TDb/u5S7tWvCi9xj80JZnQmZI6iyO3fysC7cdZ6aDTNo2uGR6Ez1hiaM1Y099
         4m9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fUDbkUgsFvNGcR96yjLqsltA1NT4KNtGaMiYXYmLpm0=;
        b=oNJLihDNBHV7o2fIRF5jyim7Awv3Cx2HVceZLvLlgu7otLbDBRurrD002anYGDU9Ko
         H6CyOSGPmtrqnoFLRT8vLakdUKY8AgAe/T5d8fRCAzmZSaF8RcQgzm34KpPwud5Lxm94
         z4vVi1sLzAhcCzOmCkuN/bDaHVAj+jxri83iaZ01iL+eVcfeP+TVOPRRQPk+iWDL69Z1
         40Lq8WfsPDTO2eYXKktdfqvojMzccsm0QUzq+6namcqn1enI9dcdL6t+KI/rRFZ8HdQc
         b7dUUhODTsjFb6fD88k7aSfXDp0NeLgEt254IGMcvl/4Ow8CUrs01Fk3XEdn/VLijjBy
         Bhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fUDbkUgsFvNGcR96yjLqsltA1NT4KNtGaMiYXYmLpm0=;
        b=UB0coP5EIWmsUYvYL2jO/nzj7O2X5UXtmJA+zAplImg3U4nZdIcGS0WQlRUXYffDGq
         IZWMTW3tbBtLXQtfjSPirp+sYyhe5qTcFh/Uv652re9CUOFBRm/ITsonzJYyael3Ccnt
         1zkci+reRb8JTBbtxgt6jenKdpJ5Bso0iidbFOeEcLcF6FhxwCnzscFoAn30W4rMpYq6
         56xHwy62EM/QZlH+SW+zm79/+8xeMuZGi61pdxdj4D6MirxNeCyiFT+gDIR5TdFUE3K2
         prfLk0UwlPPItLn7LjY4JOd3NRjJ5/m7+v2l4nvd19VB24edeOe97r1dddL4ReedVOWm
         3+eA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532z1RsVZx1+Ky7rUPrfnZZkq73DRoGRr/9W0Ex5FcD2zRgTkd0C
	5bP+rJSpE4v3ovXE5bI5XKQ=
X-Google-Smtp-Source: ABdhPJxPQMjI2ZfWUHHXpRU3vP3LEqb41EyM0VII5PvOiPsI9DzHUrSVq/xN2dDH/KriJjuw2vX03w==
X-Received: by 2002:a2e:8e37:: with SMTP id r23mr2414618ljk.269.1616486911374;
        Tue, 23 Mar 2021 01:08:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6c2:: with SMTP id u2ls4040531lff.3.gmail; Tue, 23
 Mar 2021 01:08:30 -0700 (PDT)
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr2091148lfg.320.1616486910210;
        Tue, 23 Mar 2021 01:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616486910; cv=none;
        d=google.com; s=arc-20160816;
        b=whCNS7I7eW4gnNZkqxbFBO5wCybiPoHl41Y2RzCqmNDSyP+FGALqWl3nNe5U89ZG3s
         jV8Qs/MHjo8SYvJF0tO2j4RU0mUNCyU/ADUpjdO1m6YPhhGK5wb5ip/orAYm7tOW4ZjS
         C59yp3VKLcDlfDPTLOWgikvNcZmycfdzldZoplmqKlXJXmqovwlVa4fdwy1PhmnjdFxG
         UzAQWbHhX7Xpqg/6qnEomLwSg6l/zFw7mrzhHh13hC+aGgkaLSBPGMLfcG5xNKzxuUmO
         /wDAW990K+cPLHCyqT+dLamycxajtzGVVUn/J0ySxZCkprGSl8UezWoKQEwcsmZdMDzW
         nVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=BGquhT/EplcG6pLjowTYTMr71N1KA9rqjIsgLmQPiUM=;
        b=phQ+WH9DKQffW0BuiOGdWJWDdEG22PgH9aSEGav8AwQRojLVQnDTC/Ea6ttO2qNCMA
         bnkg7cjn/5upxEZ4UlKBeP8mI7mjAZ7MBOIixlsM0FWUsfbPbvlU2U2QpQM925tyHwTU
         +5llaLgbmbCYCHCWCUDjnjsJUVawc3NkN8KweeALneeR3wTpbjrJgTUU9NKvpCAVpnHG
         FLgJ35vy9c+MSDtRaziGvqTssd26LFndQAfDh8yRCa6wIXD5T5PtFUEeDbbq+ArKjMwm
         DHhSNKE28/tfBh6kxaG6ov0z/y6PXqWk+GSzdt7mZXZQ4rqbLNJARzGRbWGFKHu89ssD
         adog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id i30si757996lfj.6.2021.03.23.01.08.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 01:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12N88TDB012158
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 09:08:29 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12N83SoB005958;
	Tue, 23 Mar 2021 09:03:28 +0100
Subject: Re: [PATCH 3/5] arm: gic-v3: not overwrite interrupt settings needed
 by EL2
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
References: <20210323062536.3888-1-peng.fan@nxp.com>
 <20210323062536.3888-3-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8f80ddff-7131-2a43-3d53-e06860a181da@siemens.com>
Date: Tue, 23 Mar 2021 09:03:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323062536.3888-3-peng.fan@nxp.com>
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

On 23.03.21 07:25, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse,
> should not allow cells to overwrite the settings, otherwise inmate
> cells might not respond to root cell command 'jailhouse cell destroy [x]'.
> 

Uhh, this is a nasty whole...

Let's rephrase a bit:

"SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse and
must not be controlled by the inmate. E.g., we allowed the inmate to
disabled those interrupts, stalling Jailhouse on management operations."

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/gic-v3.c              | 13 ++++++++++---
>  hypervisor/arch/arm-common/include/asm/control.h |  1 +
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 2293f844..8778f919 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -348,6 +348,7 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
>  						   struct mmio_access *mmio)
>  {
>  	struct public_per_cpu *cpu_public = arg;
> +	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
>  
>  	switch (mmio->address) {
>  	case GICR_TYPER:
> @@ -368,15 +369,21 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
>  	case GICR_SYNCR:
>  		mmio->value = 0;
>  		return MMIO_HANDLED;
> -	case GICR_CTLR:
> -	case GICR_STATUSR:
> -	case GICR_WAKER:
>  	case GICR_SGI_BASE + GICR_ISENABLER:
>  	case GICR_SGI_BASE + GICR_ICENABLER:
>  	case GICR_SGI_BASE + GICR_ISPENDR:
>  	case GICR_SGI_BASE + GICR_ICPENDR:
>  	case GICR_SGI_BASE + GICR_ISACTIVER:
>  	case GICR_SGI_BASE + GICR_ICACTIVER:
> +		if (this_cell() != cpu_public->cell) {
> +			/* ignore access to foreign redistributors */
> +			return MMIO_HANDLED;
> +		}
> +		mmio->value &= ~(SGI_MASK | (1 << mnt_irq));
> +		break;

If we fall through here, we can save the "this_cell() !=
cpu_public->cell" check and reuse the one below.

> +	case GICR_CTLR:
> +	case GICR_STATUSR:
> +	case GICR_WAKER:
>  	case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR, 8, 4):
>  	case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4):
>  		if (this_cell() != cpu_public->cell) {
> diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
> index acebef32..e48269d1 100644
> --- a/hypervisor/arch/arm-common/include/asm/control.h
> +++ b/hypervisor/arch/arm-common/include/asm/control.h
> @@ -15,6 +15,7 @@
>  
>  #define SGI_INJECT	0
>  #define SGI_EVENT	1
> +#define SGI_MASK	((1 << SGI_EVENT) | (1 << SGI_INJECT))
>  
>  #ifndef __ASSEMBLY__
>  
> 

Good catch! Hope there isn't more in the GICv3 path. v2 should have been
reviewed better.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8f80ddff-7131-2a43-3d53-e06860a181da%40siemens.com.
