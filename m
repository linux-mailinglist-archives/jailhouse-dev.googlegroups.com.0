Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTFZ42BAMGQEZM5Z2IQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3415A345904
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 08:46:21 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id v5sf374900wml.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 00:46:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616485581; cv=pass;
        d=google.com; s=arc-20160816;
        b=AvRCt2q+E5nhrs0JJtNMaU0IlnlkDEnn+BfvwK/NEXTaGEueEeCUSnCtXNJE9a4iOa
         NYPJ7T8ey7VnL91r3HTU7E2tb+G5AZhsew0d+h9omcLmfBhryY86FeWQNXXdPG0sFO8c
         x0j1cO6ntLhRDUS/B62YygDoo8FSxHyveO7XyDPQ+rHsdb1mYGE2Kw8SjoVffopE1bCb
         nz/U65neBDY7oGGpDClatFswTlkdfe/yvAcg4tUYLNybuqxws4yNXDP5YvrpSoEflxtv
         udYw8/AAMo+muY/PVgxuoGxTGyMyv16JjDiyTLllnDKalLcegMYiaBitjCq/OfD5QDpe
         89GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3gpgd82DoIP4BEDXob0VzPDzbVtWIw1B14P1PZ14g4M=;
        b=IC8t4YU6BKzXqso/vLe1epFKgDQDVgkqX197x5d9DtJmWVzrGeglrUVylJ+NOXi4uC
         cHdBdWc7f5SUJulfTlNX3EtSL0nK2ivwfiu+M8QrMzSCPyE/+1WfUl9qqnqI/fE/W+QU
         RRTRbujpD+O3wIvZuA32uuzTXrq2S4a8KitIDkJnSxRp2wEAijUavEINxRvF77DabdZa
         Mp/7vdRDE1AT9F+JvfdP+JZ0DoF+s607e1hloqDzoqa9BD24uYrG2SKopqlge6LKT0KW
         1NbKIlw4KEGNP5neIjRZegOu/v3FR+g+iDYuG/F9lFsA/7liOCVQHKj4VRA7joB4HB32
         1X6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3gpgd82DoIP4BEDXob0VzPDzbVtWIw1B14P1PZ14g4M=;
        b=CQjo34Nsyk8pgMJQOLB+qcHvjncyd0GAXKk+lmJyVSHYdY8ibyca92T25fXQtf3QKs
         ImRT7HFPuNCdKfrvMIEeDfiJgK6gJ51C7BeMQDQQ084itrOIr25FPOtn4BTnHTN9TALl
         IVUgUVon7gCULIsXJyQS0HzjXM1owO6FT1sBLU6Tw2jkcGPe8R6ReesfYevC7cN0wlc7
         i08ldCjDDbRC50G0BcpaXH7Bs4whl/dVDc+991FGqLaFoavhFRbZDpVU5jelxxjr83li
         MW+R4HO/bD2+7vjTGZj55Z8I3ziY97b4X2/+w7yN5AuXwSSc/b8gR2JRN3waPutKQcfu
         r8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3gpgd82DoIP4BEDXob0VzPDzbVtWIw1B14P1PZ14g4M=;
        b=WtL4hh5qiG/wqyBk9r3P74CflfX9kNnJQZHUvke4N8/DNovmtPmLgHTglNSSXOR8x6
         RnWoXtK4I8LR0WC7Widgd0JZWE/6d47H24lSZROABuitvRHj+z/EfebPHKpplV/DDgD6
         OwMkwcA1nYcjOWE4/icC23S4+8UASWktG8aHtIYiU8uZoTb7tB2h03DWm1pqem4DyIue
         1AzE9b/yX2Y3akJDvqVd7/n8ShN9NhXcCu1DfjtlCe9XGK931gSq3jOIKnwJ+X/HJrAR
         Wy099ToxYX22GoPA2PgiGQn8Nb7QEkOpzLmQmqlBIISixXiWLkGw9ZxqZ/SQaiOnAa67
         6zTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531D6+RV/Ab7j88sH6P9fmaUy9o6B9ad54zHPXTTGfOepMC0Nvdx
	Ss8EIHW2+go/2VqOMLhim+g=
X-Google-Smtp-Source: ABdhPJwL+0wHqSd45PCqe7PKgRMqsD/78UpwYQBctHLeGaKonOICsWMGguitysmqoSvivRklUdHqyw==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr2004055wmh.69.1616485580840;
        Tue, 23 Mar 2021 00:46:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls1490521wru.2.gmail; Tue, 23 Mar
 2021 00:46:19 -0700 (PDT)
X-Received: by 2002:adf:8b58:: with SMTP id v24mr2459454wra.160.1616485579893;
        Tue, 23 Mar 2021 00:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616485579; cv=none;
        d=google.com; s=arc-20160816;
        b=nWmKcfWbXSj87AvvbHjiJwbNegta5EBxRxXUNbgXCsu4PAFs5gKXLK7dWeLVCfViin
         3fOoMXPWquD05Z1eiA0yghqEby9NEXNDfafXd3tyvXtvd3PmNRX8sRkUjd8lftLztV9a
         JxiXFzFQTwSrnRAC/KDFKkFF7Ki71YsaHuFIP7XMulxckcRB2+8TFtViD+aLTxqU8IbK
         nCzDed3LiknSpYjdbcMksmOu/7k6yDc9WzPuRhUo3zGYYY9hRo9nEkrzbajAgd+owgH4
         /TULCsMQtJjgFpXy50lOsrkVL9dVycV6sP6TKxt3jH78GQWY85NRcrEt2AygW8XAxwF1
         33VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=HD9NYixGiZEDV71SkCue9irbNu7PLhVzFkpw8Z41yYQ=;
        b=dnEzrhBFs6XuJxsQEGgaNZGOvr75NYtGiMVsTjL7y2HCN3M6XZQawrLZOF3RiwNz+w
         q+hmrGe5nPh6ER3x2nMAx3yZph/9v6yB7X49TEv1ptqrkepdW6eU7ehKNCzA0wqI9bY3
         fGoZQd2BuQ+vwe6N6jH9WOAuRMIq/Eh9sgMftwRuIwKpUPfY2mVSB6/UqyfLF1+rFns8
         0VWHF/hpMJ9iwZruZCTH20flBEDjfEKsmGIzvyWOYLS5d6x+k9DZ+XDNB/GZVNoCwjG0
         rd23hJ/e/FbxVEhgirQSIFghuvxYozw39T2o95bAfZsekQsJZKtng7uMPe3BflkvAsw4
         s/Iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c9si112640wml.2.2021.03.23.00.46.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 00:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12N7kJP5008714
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Mar 2021 08:46:19 +0100
Received: from [167.87.18.33] ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12N7kJWk021548;
	Tue, 23 Mar 2021 08:46:19 +0100
Subject: Re: [PATCH 1/5] arm: gic-v3: inject irq priority to inmates
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
References: <20210323062536.3888-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ff73ae1f-352d-52a0-c21e-fd7351a444ad@siemens.com>
Date: Tue, 23 Mar 2021 08:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323062536.3888-1-peng.fan@nxp.com>
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

On 23.03.21 07:25, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Inject physical IRQ priority to inmates.
> 

Reasoning is missing, use case description. Specifically as this
approach has no influence on the ordering in the software queue. And as
it's only targeting GICv2. And possibly there are more limitations.

So far the decision was to ignore those rarely used IRQ prios because of
the additional complexity to emulate them accurately.

See also
https://github.com/siemens/jailhouse/commit/03475882880dc5ae49d0852c628a8b8958be80ac.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/gic-v3.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 4ebb2357..2293f844 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -533,9 +533,11 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
>  
>  static int gicv3_inject_irq(u16 irq_id, u16 sender)
>  {
> +	void *gicr = this_cpu_public()->gicr.base + GICR_SGI_BASE;
>  	unsigned int n;
>  	int free_lr = -1;
>  	u32 elsr;
> +	u32 iprio;
>  	u64 lr;
>  
>  	arm_read_sysreg(ICH_ELSR_EL2, elsr);
> @@ -572,6 +574,16 @@ static int gicv3_inject_irq(u16 irq_id, u16 sender)
>  	if (!is_sgi(irq_id)) {
>  		lr |= ICH_LR_HW_BIT;
>  		lr |= (u64)irq_id << ICH_LR_PHYS_ID_SHIFT;
> +
> +		if (is_spi(irq_id))
> +			iprio = mmio_read32(gicd_base + GICD_IPRIORITYR +
> +					    (irq_id & ~3));
> +		else
> +			iprio = mmio_read32(gicr + GICR_IPRIORITYR +
> +					    (irq_id & ~3));
> +
> +		iprio = (iprio >> ((irq_id & 3) * 8)) & 0xff;
> +		lr |= (u64)iprio << ICH_LR_PRIORITY_SHIFT;
>  	}
>  	/* GICv3 doesn't support the injection of the calling CPU ID */
>  
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ff73ae1f-352d-52a0-c21e-fd7351a444ad%40siemens.com.
