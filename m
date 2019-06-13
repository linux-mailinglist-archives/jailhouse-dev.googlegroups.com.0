Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRPTRHUAKGQEV6BUMKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2A844302
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 18:28:53 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id v15sf2088273wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 09:28:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560443333; cv=pass;
        d=google.com; s=arc-20160816;
        b=P2WdAD/wq3aGdUURCXbAxijIxVmPaWtZHy/5lqnUdZ0chKvsHypMvZMZJQ4ff0i0YS
         vMHUeLESHItmxsGqAg43CTTlJnJxXHZfAJvmP9o0sfBoEBoRvkLxLz4zWqg1c8EdMDOX
         Gheo47ALRCKf9gc1o/IiZuUsRIyvye6cLhjWh36k6MHYHDAenVccZyFmnvkL4K/GwQCX
         rBih2KT4CknRXLY1TI0Si4ciwIjfoiouCpr32fFL8GShEEtPMOzyvvFPuQOEiiTBRZXB
         h4QSuhE0HrbK9F+9U75yxRP/4xISXK1I/jXtN7GbZKW+8MmY/ZTc+Op71GE521XYr8vY
         zaQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=qmPdN6FfB+emRREi9S8ry5/7wcLYqZKHk5oEPxEep4Y=;
        b=SRNr6QvIFwiXzbPK2qhOJLI4JiuE1U0yHFCXW37nAI8Zt9uh4VYxa8pERic8YHfgOf
         Cj+TnexjxRiBVmo0gaG+osb8swummXed8lKbYgIW51QPFzTm2EeVyq2l8v2k8ew1FR+3
         YV3/rpdfj7EZ8l2aaO0wKh/3ombeI/UGvpyjl57QIwesqgiiFPo+HwEjj8ZAYoijzqu0
         LvqPuEankYdV+huXE4OXgK1BIa2sQ0+eGdRflRirnE9JfJvGmp1ELvrOS5Mj41VKqMqc
         LJxadN8fdha1Y0qyKfV3+CB+kXCxJVXJvrT/tU+ENT8lZWXKcFc3bX5/TJ7QUle2dusB
         8tdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qmPdN6FfB+emRREi9S8ry5/7wcLYqZKHk5oEPxEep4Y=;
        b=gpRFb5fdjofmACvxNHhO08PFQnjNA8vfITKYxQhMQjGFoJ0zriWes6MRdTAmh0O0U2
         0lvlcSwpBRnrTG2oti08gUj2NLES+5RSX2IHigJptrDiGwaHsT9vYKHVMf7wt9T/p8kL
         /Wl4VEfNspDl0P93/HihatSM+Oe5D7hcBZwVjyLwlSOeVMBC/Yg1Ud4mDKicJXOdGKHT
         JUZDvtKyHdPXeS+DfhlozHoU+coDSOBlV2rb8AHv4O/ZTWfR5/oPzPCeM1VUMnChccDz
         I3IUSkUMo8GM7YH0lPxClDjQNhSm8vd418xuTd/+XGtEciN3dzu4U3zlrMrtZGSqafay
         Gzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qmPdN6FfB+emRREi9S8ry5/7wcLYqZKHk5oEPxEep4Y=;
        b=S4yiAeK2qzV6/mSxh0x3RvI4vLHiQaR37230fWtzzxp9Ue/nL4L2tFGl95pV6RSMzD
         8WUNuKSBJRRzq59MUFMAnoG5RdMQmqXxb+KLg5u2AxlNPulsmyDQSbipThYbSsr9bROa
         xqFoCrXRMXn+SPwl5PBbFM+kq94F2C37ZXYcBWDNLSLjeeaNrbZDumalofW5/mRIS3hW
         FbisMfYFu8mLdYiZk5WKaUfyDJDH7MouG5bA5lSWP+Xee2ZXLUg2TM2VyJXzWhAxaPIa
         SHkAE6fWonQy+6aEZuELazNHHp4lA1CsA6HAzJzJ5GrXikMmAOIGRG/cBvBheJ9AKZk3
         tzPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWrALrKLTRUWU3D4EJxDKS7CCWW05a0L/XgA2mPD7zX+XQsgjlz
	6f9RbNkas0/iBh5AkDtUs74=
X-Google-Smtp-Source: APXvYqwwV2iaY08DdGFKqG8g3KJtHDH48yavZbhkvziS5OeAcbXBRN27MieThfcntOFdiZNmU4vA3A==
X-Received: by 2002:a5d:528b:: with SMTP id c11mr10923795wrv.25.1560443333716;
        Thu, 13 Jun 2019 09:28:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls1963961wmf.2.canary-gmail;
 Thu, 13 Jun 2019 09:28:53 -0700 (PDT)
X-Received: by 2002:a1c:b757:: with SMTP id h84mr4703862wmf.127.1560443333071;
        Thu, 13 Jun 2019 09:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560443333; cv=none;
        d=google.com; s=arc-20160816;
        b=O5v6NltlWFV5oMj4cntGCT3lfN57bCZa9yuLaB+IrdyNNjy+aXrPqQqZC9Vy4JixG/
         Tkt16DHVueSpP3PlPq0wtFqlIPC+EchK5SQe7N4vrrM/Ox7UPJiMVfzXQ09340pEyr4w
         aKcTqEfiTuyPbZxgfPPmDoxb7OmJVOaQbd3Ad1t1ZnTpho29lijKwYRlv5gx6fR2ZARN
         SgMniBXi6zzU+GvYwX2QxjAyrgAJyUQ5XozzfOZg1OPIJCqb0jOw4BuNF37vN0VjXFwc
         XKTSW+KsUEekQcm0Yq4LpF3tZYEjQPD3jpifzqMokb89b2P6KeFEWhwilAZPWHX40425
         Osnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=B3Lv3j1Nv99DTVLt8okdiABSLtaHa97YQ4WQvVyfWrU=;
        b=ReipnN+tf4hNvAvwdGtxVqZTTJ6M5LNFOuoeVYLxH0EMM31Bf8AhaFxjxDbqG/SBXe
         gvwDFVdQ3g43tB8ON8Zh/wdcDBoGQmLC7+Ra38noQoUSP9DFXDdPlvwHLxl6rLu6GCJI
         MLGzezncnGAMiTeGk68D42o0+Lxh3tpC8qB77cYK9gzDOI8taNlsW8suFeRLQGgepeFB
         rzumM+VB1bDnaR3SGCYDTwiCvjz7Nto++pn2hP1NBWI4BW6H76uqQJOxyuZsP7HGewOF
         HXkC1dsUEbJhenzr/ivD5QBFrSlNgocSdcGdIj7Y860EjxKJ4r6tRDVqaYMJJoqVQfa4
         4k6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h10si27891wrv.3.2019.06.13.09.28.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 09:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5DGSqwB011559
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2019 18:28:52 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5DGSqI9008965;
	Thu, 13 Jun 2019 18:28:52 +0200
Subject: Re: [PATCH] Kbuild: Remove the reference to the formerly supported
 vexpress platform
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190612191746.16654-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <64b1e7a1-45e6-2eed-2969-3d26dfad9a64@siemens.com>
Date: Thu, 13 Jun 2019 18:28:52 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190612191746.16654-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 12.06.19 21:17, Ralf Ramsauer wrote:
> Just a tiny cosmetic fixup: We don't support vexpress any longer. Remove
> the hint to its unit.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   hypervisor/arch/arm/Kbuild | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/arm/Kbuild b/hypervisor/arch/arm/Kbuild
> index 15a318df..e1bec1b7 100644
> --- a/hypervisor/arch/arm/Kbuild
> +++ b/hypervisor/arch/arm/Kbuild
> @@ -15,7 +15,7 @@ include $(src)/../arm-common/Kbuild
>   always := lib.a
>   
>   # units initialization order as defined by linking order:
> -# irqchip (common-objs-y), [vexpress], <generic units>
> +# irqchip (common-objs-y), <generic units>
>   
>   lib-y := $(common-objs-y)
>   lib-y += entry.o setup.o control.o traps.o mmio.o lib.o
> 

Saw this recently as well, but then forgot to patch.

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/64b1e7a1-45e6-2eed-2969-3d26dfad9a64%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
