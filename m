Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI73ZTXQKGQE4EYTXLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7011DEA0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Dec 2019 08:28:36 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id u18sf2218427wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Dec 2019 23:28:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576222116; cv=pass;
        d=google.com; s=arc-20160816;
        b=zRq13oJc+wEeiEQJXVwSA0imUunuFsjR/Yg+sCjtb9zN8qHjD2u8zbbrWLZfw9+Q34
         z/iXGovV2BygR87ZalMNxt8Ys0VoPOHFs+JVuiJBRbOm7co+S/FNuRqfaGQ78rymVRBC
         8aaieZZcbAAAKTWUcq0bA4jxm5MoEDf9xk+km3pGf3z5EMwTX5a28XRsJMRK9UNRsM4b
         pPTKsmGL3ydzwVZHvHhuvwe+YV3LfkXDYMic4owB6tBDjfal/tlI4eTXsGNaUhChnXis
         WrmvD9j4FxI1qUDX+ZjY0Letvnrfei3IzCJaJ8wqV5NiAhwdoxkyDt1XdHoMO/rdz1+B
         B8Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=lmw0STM0H+xLFpSnsxT76JvbqNkTWb77cHPERkakMHs=;
        b=iV4gqd3Pd4AfNztVKOhk+MxZC2le2u0abTmzl8sJJABYYKYO3GdPEy5X7t0gYuWyUc
         ZJqPtePkx55c0kV/F89RBa7pqFm5DeKLp/nwNqLxvjbMKL0932IH1REqf1kQZLwn/sOv
         yHVLuAUJ5GohMgWGTF1xR641ZokjERS89ENPm5RD/ZUTpEOpTwdCcMAwMZlKY3o0LrFc
         hWz9pRabplNdOwJPa9dqOILlRKwGNcuFmT7f2oP8BTqzbFrsDvWsv6i0LRpmvEAjhyV8
         ZbXY7RlbbAjU2HlAie64aa3qOYYlz6mb3bg3WJmHg6n2v4dBU24yEPEFLwSpbRBh2+QK
         a8fQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lmw0STM0H+xLFpSnsxT76JvbqNkTWb77cHPERkakMHs=;
        b=spTuQ4ekDxZXy18eA22lsrMIHKExvJO+bJotbjwNgVHevdzrWx+p/7OcxxggjdnxtB
         cQnBeiwKl4CSn5gdOM8hyQPJncS3euitmsxFFDTno3sHnZAL4ItbFmfzCKaybfZsLo6s
         3oPB9TIXEUboK4Iv20ZeQNoPg/idU55d9ozYxm4ChpYlSSGWEbi+opUgUYOxQcj08iry
         WwKmQIJAs07rMLa+GXF+Vs8QIpjr9cT1qNOnO/anlr/hcKgGXfnc+r8Ue6e1MVx8PAqZ
         1MLiq6Vchcrcw+GHaREeVpfBCa6C79PdKl3Am//AGZx3vxILigG+5FVEXx66N8jUyYFc
         SByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=lmw0STM0H+xLFpSnsxT76JvbqNkTWb77cHPERkakMHs=;
        b=IIQp0L83khanOIN7kVqyO2+OSWvpm1wRnW5V0mgbzCS+nQofDuUI+Hvro3XvwP58h4
         2niwTkyskVXtBkbRpAGfC5o4cqrJ+6xqGfAdTP630VUJQ0nDmR5kQewSyUOjdhY4Y6hG
         qHC74FzKDhxz1IG1/2GDE7fSqxnec7zgKtlTwmYxj5DRYLOlW4zT76qOGISKzVEJC9FA
         +uXaLz6ybRZNb12J8RY9PDsZXFpJI4FGwE0A8ddmnpeOIsuqo6BQfR8fICC/GREIf+Es
         1naKBH3aK5L1e7tel9UX+F2EMfpXXn4hhbLPIQuVPlG6LsADhUFElocv6w/HJtkpwrF3
         i80A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0rakqHD1qNFG51kkA8jnVY5OFo2nEFrGwtk0hiyBI/bvQAuQk
	3Rtrf/y7S3Be5E95jab4VtI=
X-Google-Smtp-Source: APXvYqzP+wWscDxdq/zQW/fsokfr2qo55sfbWaZdU8rLcX8qlHScUey21ZRJe0No7Z73A7PbfTLeFg==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr11897471wmc.6.1576222115998;
        Thu, 12 Dec 2019 23:28:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c76b:: with SMTP id x11ls4594913wmk.3.gmail; Thu, 12 Dec
 2019 23:28:35 -0800 (PST)
X-Received: by 2002:a1c:7f4e:: with SMTP id a75mr11896493wmd.128.1576222115269;
        Thu, 12 Dec 2019 23:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576222115; cv=none;
        d=google.com; s=arc-20160816;
        b=BgNuKXLPB/E2fyIa4gFanE0JTsShKy40yXUTK8QhGAFNKrvlVgntSqiVPmdEJ69tvV
         Ls4oYgBipQHQnnDRCQ68qkoKf2xGXp6slxmkU1cjMq5dBifXzfoNTM5I5Zl2+D0AExjy
         tuzkDE/pzEy+QKzwdDrdVBdlmNJ+C38x9pnrzMMVZx5StYN3JlYOTb5Qts1P79GpprYZ
         V5ieBhEEJ6fqyyglUNg2NM6oryjQFLOlEXsFBoUm9daVMWFML5QrmYfDXBosEZPIiadC
         t5u3I9LEye16PIrydPiCycv7IucarTB8XGavvD2rJSPSj5d6wujjNP5PYHtvz8qq/XSB
         4znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ykNq+vtYxEv6KCEa//wCPG8OIyS87EJHNn25sASzE1o=;
        b=0T891I2+Xukma73GiE2Sh/HagSu4IISEUJcMOVnXKPoDbdPdTpgMil/bjKklJSFZcb
         GxkFTEBt+3MZvf4QNqjHvpF92nHeEixRHv/Px2JPv1g0tlhvtsCGbOp4vhf4csc1fjfq
         21CBcbM401xDaKRMRz20rhLDePoND0dQi9wSA7E2uQXtHvWhyi0rh/5Vvh9jYPDM0RUi
         FCD5vm/s7qlriAQlDHZr5UsTX8cqixUmSTENiZq447BVz3ZeGbrFq+bZtxQJjp5+F6sv
         y/eNIUC4Rtgru3mn13FgLFlXdqvoyyJKvS3DjxyHuCRN91C03oNJVUDboQQmJxwunZ1b
         7L0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t131si249262wmb.1.2019.12.12.23.28.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Dec 2019 23:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xBD7SYHn013285
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2019 08:28:34 +0100
Received: from [167.87.38.231] ([167.87.38.231])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xBD7SX0T002042;
	Fri, 13 Dec 2019 08:28:34 +0100
Subject: Re: [PATCH 2/2] arm: irqchip: fix memory barrier usage
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20191213032352.8915-1-peng.fan@nxp.com>
 <20191213032352.8915-2-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <12b01559-b4a0-ab1c-c0ac-346cd687b7b2@siemens.com>
Date: Fri, 13 Dec 2019 08:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213032352.8915-2-peng.fan@nxp.com>
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

On 13.12.19 04:05, Peng Fan wrote:
> spin_unlock implies memory barrier, so no need explicit memory_barrier
> when enqueue irq. When irqchip_inject_pending, need a explicit
> memory_barrier after updating pending->header to make it
> visible to enqueue.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/irqchip.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
> index 1c881b64..5abf1c37 100644
> --- a/hypervisor/arch/arm-common/irqchip.c
> +++ b/hypervisor/arch/arm-common/irqchip.c
> @@ -247,13 +247,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
>  		pending->irqs[pending->tail] = irq_id;
>  		pending->sender[pending->tail] = sender;
>  		pending->tail = new_tail;
> -		/*
> -		 * Make the change to pending_irqs.tail visible before the
> -		 * caller sends SGI_INJECT.
> -		 */
> -		memory_barrier();

As we are discussing lockless access to pending from inject_pending, we 
still need a barrier prior to updating tail so that irqs and sender are 
visible and consistent. We do not need /another/ barrier (like now) 
before sending the SGI, though. So:

--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -246,12 +246,12 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	if (new_tail != pending->head) {
 		pending->irqs[pending->tail] = irq_id;
 		pending->sender[pending->tail] = sender;
-		pending->tail = new_tail;
 		/*
-		 * Make the change to pending_irqs.tail visible before the
-		 * caller sends SGI_INJECT.
+		 * Make the entry content visible before updating the tail
+		 * index.
 		 */
 		memory_barrier();
+		pending->tail = new_tail;
 	}
 
 	spin_unlock(&pending->lock);

>  	}
>  
> +	/*
> +	 * spin_unlock will make the change to pending_irqs.tail and
> +	 * entry content visible before the caller sends SGI_INJECT.
> +	 */
>  	spin_unlock(&pending->lock);
>  
>  	/*
> @@ -293,6 +292,9 @@ void irqchip_inject_pending(void)
>  		}
>  
>  		pending->head = (pending->head + 1) % MAX_PENDING_IRQS;
> +
> +		/* Make the change to pending->head visible to enqueue. */

Misplaced. We need to make the pending entry visible prior to updating 
head.

Jan

> +		memory_barrier();
>  	}
>  
>  	/*
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/12b01559-b4a0-ab1c-c0ac-346cd687b7b2%40siemens.com.
