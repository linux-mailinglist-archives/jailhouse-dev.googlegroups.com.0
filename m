Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMMDRT5QKGQE7Z5OFVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3126D3A3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 08:26:57 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id s14sf544333ljj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 23:26:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600324017; cv=pass;
        d=google.com; s=arc-20160816;
        b=XLKu+zW12J/8/OejlJK+xqr7JjGE3SN/9A7coo6tKg+OtWDNnV97U/DI1QRI3/4vt6
         iV+gUaLXtHf7Mj5hlwB/fcthgPRdmucAMKAFn6QxFpJGveIDk/LgkSfue6UU7hsTrFI4
         DwCbzPOe7rNlxLm4HdjVLxeCkXw5tZsTd8KqKL/6Bp6EIlIHSorphI3Obnb4ktgoUv5I
         347e7jG3dSp/ePGZn51PL2BEnbUJTVDWyCJTITW11pWIbXU3AwY50ZjyqH3y2O68INPB
         QpwP4EcGFDbSugfJRCQCrghGNUQOK/Fi68VoiIJIGL+gZczyO9v1pbVHbvOkHVtF8t0B
         ENWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=qt5Oj+HSk/PBPzMqo2WNZw9DF18tupXeV46AnT1EKjU=;
        b=BYE1/ZRuP1zb7RGbx0/Mx1d/uNAfQXaNEmV53iOL9s8d4MrpZTef/cSLfhEKeCgmJh
         vQ/zEGYaHsZyhbUP/lHdyl/QjYMEsQvKWwfEctzVxvVMIvRpCgHq/Lw7hUjpeO/MOAxp
         5l0cy3iHLLxIGwLfWo/uis5eivGiQBX2QGGx3aReqm1VB+WzrCRDi05fp8kAzQlKNfW7
         ukylNpS4Ixs6Z9DLihKrVg+Kn9rZzCe06jfQdC0j8abpUFhHWsjQyUCFqIYFjA9qr6nt
         tr5vq2Qfsz98YT4oXYIJkCJzf2w1xMTnMubqp6aBfq+3sslHu4Zixz7nxfpik6dTR4H/
         Or1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qt5Oj+HSk/PBPzMqo2WNZw9DF18tupXeV46AnT1EKjU=;
        b=m7PF3ID5yiYgUAJwsOulMUM4lZPog39l7IJAbbipD7zxIhPUEx8RmqLPjhGWcp6Kco
         v2bFFvGvTMBku1wwZcBZlxnx4QyXqhq6RRf+Groc6qfSBWf86UAyfpOj6+G9BnhqSPWM
         pVyZHHp2Sfy2iFTgnWrYbsf5KSnKwqnb76rCQLlmI7ry/M0mn8WhrykX2tmHRX1etZ44
         JIC7wjTQws5GDK4OghQSnUnwQD2pWF7cOKIKQuSkP47q16ltI5C291L3sDtUNpdGeoyL
         mCNd4ClutMnWM3tiZUwdphJ+3yq8UaLFpNFYG4qHWoJdyMMCwT8t2uyMAbfasUE4MDRs
         EXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qt5Oj+HSk/PBPzMqo2WNZw9DF18tupXeV46AnT1EKjU=;
        b=diphOzv1+snrioj6gCXKZ2TQUxC9fgxrscryTz+K9Gc3Xdfr8yACTeBzIdHRgv5rEe
         H/Im1MJE/d0PjWZfTWKe6MBwPKeU0BACVW4F4Tx15mlOX7BhnbFmKH3U9L4tKNHfkDos
         X+QAVXh30xom2BRNu2B3Fvpfh8V1Q+Mii3aUJxbYJDmACZp3nRZInxG/dL3g2HvmFwdG
         /6yG6V21HMuTOWH5y5KQI/2a1K9CWab6+u7BpEBX8ardnlvudG2dvinlG02Z5RaYo5yR
         0V0JpbDfYdBDt38LUPeT/abdE+Ldg1BaqUvGWBZiVjeJH2XNuL5IKjpPc2aRB91fzCn2
         Da7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uBVeMPtpKUD7Dg3wpgZ+HBzEuP8tZ0bb/sFh6wNH6ZrhyK82v
	l6SfQsVT4zneilFtx3HQpy8=
X-Google-Smtp-Source: ABdhPJwVFAlgf0lromlAI1OJhePhbsqYuuXQhRBzt0ui5tgEHkM4aOdIsfKyp8kbhFYXjtfnCdVlSQ==
X-Received: by 2002:a2e:9cc2:: with SMTP id g2mr2870386ljj.77.1600324017468;
        Wed, 16 Sep 2020 23:26:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:86c8:: with SMTP id n8ls134764ljj.1.gmail; Wed, 16 Sep
 2020 23:26:56 -0700 (PDT)
X-Received: by 2002:a2e:8257:: with SMTP id j23mr9577821ljh.49.1600324016108;
        Wed, 16 Sep 2020 23:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600324016; cv=none;
        d=google.com; s=arc-20160816;
        b=bwYGI05jDRJVu5ZvlCAHb7oJeiAUo5Kp5yqAqFlFD4BsOX5dDLrunvPb6TWRvRtlxO
         DruRETC0Qr//4ZMhQPUbtE7CT9POebrWVQOmfTBWAgMZqC7DM03+xpicBby7l0KMw5mt
         zD6s3/yf4tfX80zYoBiChxB1qzxdVmU252EP7dH9aSNA0xA07ljr/Si9VfCipYR13jAo
         tg14lHcHNyiDkIFGKBhulYk4sh/vFcOozmLIu6CzU1Zik4VmZzFo2d2KSqJ3KQ6MhKRu
         NkVobmiJSAfFQYI3x7vhVZRKNh/k9WSNjrun65SXFzlWVjxlXpvMhmYClaxpRP8jiS2L
         C9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SZfrTXlntB2srjshlah3Dxbr3N6MqrPuSIabqGMNf8s=;
        b=x0r0o0xdHU1GvioUC9zVIjY4FB2N2yITSC1gf3DfPEpTqmQqLCi40jBpzdKXgpKWOl
         Ox8+884MYS4miQej8mL0bvlCfUCBabhFkFWYWdLDy+/H31kF8YPztFNzoKU0wj5cSAnA
         uNrUKu+jmXeVofWMu2EXWK57Fk0OhYzXOV2tsZaxukm217iAGyT5ao20dpIsEs2eZTbh
         4/HaEhfrQ4+4oYMEJT2pO8ADjSQeEaM6a06hGQZF4JN6TnXd9Z5qo+LABancFDV3d4W0
         xx2NimOw22K5KLwwiMwkMdK1QPSPBMEOVW5qMnUkFUWyL6wjW9/iyR9jKgY4CxQgfbv+
         iWhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h22si636841ljh.7.2020.09.16.23.26.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 23:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08H6QrhV011568
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2020 08:26:53 +0200
Received: from [167.87.40.222] ([167.87.40.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08H6QqUA003066;
	Thu, 17 Sep 2020 08:26:52 +0200
Subject: Re: [PATCH V2 1/2] arch64: Make sure SMC and HVC calls don't have
 side effects
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9f124890-9d6f-0fe1-65b9-4a9f5185ed1e@siemens.com>
Date: Thu, 17 Sep 2020 08:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <C9905595-F658-4431-AF1D-F9ECDD38A20C@gmx.de>
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

Subject tag should be "arm64". And the patch should go over next first. 
I can fix up both.

On 16.09.20 15:07, Oliver Schwartz wrote:
> SMC/HVC calls may modify registers x0 to x3. To make sure the compiler
> doesn't assume input registers to be constant, also mark these registers
> as output when used as input.
> 
> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
> ---
>   hypervisor/arch/arm64/include/asm/smc.h      | 13 ++++++-------
>   include/arch/arm64/asm/jailhouse_hypercall.h | 20 +++++++++++---------
>   2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
> index 1a5d5c8..c80fe15 100644
> --- a/hypervisor/arch/arm64/include/asm/smc.h
> +++ b/hypervisor/arch/arm64/include/asm/smc.h
> @@ -28,8 +28,8 @@ static inline long smc_arg1(unsigned long id, unsigned long par1)
>   	register unsigned long __par1 asm("r1") = par1;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> -		: "r"(__id), "r"(__par1)
> +		: "+r" (__id), "+r"(__par1)
> +		:
>   		: "memory", "x2", "x3");
>   

For SMCCC, I'm considering to align fully with Linux, i.e. convert the 
remaining register clobberings into early ones, but I also have no 
strong argument for it.

Ralf, thoughts?

Jan

>   	return __id;
> @@ -43,8 +43,8 @@ static inline long smc_arg2(unsigned long id, unsigned long par1,
>   	register unsigned long __par2 asm("r2") = par2;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> -		: "r"(__id), "r"(__par1), "r"(__par2)
> +		: "+r" (__id), "+r"(__par1), "+r"(__par2)
> +		:
>   		: "memory", "x3");
>   
>   	return __id;
> @@ -62,9 +62,8 @@ static inline long smc_arg5(unsigned long id, unsigned long par1,
>   	register unsigned long __par5 asm("r5") = par5;
>   
>   	asm volatile ("smc #0\n\t"
> -		: "=r" (__id)
> -		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
> -		  "r"(__par4), "r"(__par5)
> +		: "+r" (__id), "+r"(__par1), "+r"(__par2), "+r"(__par3)
> +		: "r"(__par4), "r"(__par5)
>   		: "memory");
>   
>   	return __id;
> diff --git a/include/arch/arm64/asm/jailhouse_hypercall.h b/include/arch/arm64/asm/jailhouse_hypercall.h
> index 108d052..a9d13ee 100644
> --- a/include/arch/arm64/asm/jailhouse_hypercall.h
> +++ b/include/arch/arm64/asm/jailhouse_hypercall.h
> @@ -42,6 +42,7 @@
>   #define JAILHOUSE_CALL_NUM_RESULT	"x0"
>   #define JAILHOUSE_CALL_ARG1		"x1"
>   #define JAILHOUSE_CALL_ARG2		"x2"
> +#define JAILHOUSE_CALL_CLOBBERED	"x3"
>   
>   /* CPU statistics, arm64-specific part */
>   #define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 5
> @@ -54,9 +55,10 @@ static inline __u64 jailhouse_call(__u64 num)
>   
>   	asm volatile(
>   		JAILHOUSE_CALL_INS
> -		: "=r" (num_result)
> -		: "r" (num_result)
> -		: "memory");
> +		: "+r" (num_result)
> +		:
> +		: "memory", JAILHOUSE_CALL_ARG1, JAILHOUSE_CALL_ARG2,
> +		  JAILHOUSE_CALL_CLOBBERED);
>   	return num_result;
>   }
>   
> @@ -67,9 +69,9 @@ static inline __u64 jailhouse_call_arg1(__u64 num, __u64 arg1)
>   
>   	asm volatile(
>   		JAILHOUSE_CALL_INS
> -		: "=r" (num_result)
> -		: "r" (num_result), "r" (__arg1)
> -		: "memory");
> +		: "+r" (num_result), "+r" (__arg1)
> +		:
> +		: "memory", JAILHOUSE_CALL_ARG2, JAILHOUSE_CALL_CLOBBERED);
>   	return num_result;
>   }
>   
> @@ -81,9 +83,9 @@ static inline __u64 jailhouse_call_arg2(__u64 num, __u64 arg1, __u64 arg2)
>   
>   	asm volatile(
>   		JAILHOUSE_CALL_INS
> -		: "=r" (num_result)
> -		: "r" (num_result), "r" (__arg1), "r" (__arg2)
> -		: "memory");
> +		: "+r" (num_result), "+r" (__arg1), "+r" (__arg2)
> +		:
> +		: "memory", JAILHOUSE_CALL_CLOBBERED);
>   	return num_result;
>   }
>   
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f124890-9d6f-0fe1-65b9-4a9f5185ed1e%40siemens.com.
