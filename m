Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCM77H4QKGQEHZ2OQJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E7224B58A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 12:25:13 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id z12sf497000wrl.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 03:25:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597919113; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z58yJiG51aiZwl2i15HaccivdFyhWBCq68ETRkjNjLu00XbrwQc1XjSCJVI944Ds9d
         8JEscwF0z4x0r69F/1KWyg8lJFi9votdna3I99KfSr42H+umlJN4sbDrnRJXhYc9i0T5
         UCMP9xCt+CyRuXnPISnirYv4WBanKZWCuyAD83YDzSa0XDdlD26nOyWBuu/KZY1wAAWm
         qL70wgt4WMR024mFwtB8a0cXj+jgSj+bZW+4uB71IsXl72hyeDqDb04w0K3jyYDaVCgj
         hrV20ZpDHjDIfmDNVLsPfOmOCPPxYJ3grc3uu8UGa0nzbFwKSgjEzh9FiT7otgPA0KUN
         xN9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SgiywhvUANSsgpPy4AUGQ3DHXfvtOrvnh1L+kCXhZGI=;
        b=p1SarT6z/AMzQmkldWsk4DZgCe8yFszpiPcbfDhPvGkYhSawAGArNjv2fZSgJ+3yDF
         6pvSOnrI+06DwJHBJXp/eRMH5LKGrA2em9yE4mr3NvMr2UB74BqYegIyD1wHOva5dgch
         trg/wJgtlK9eAKS1Nve/6GHGN6KRAH00/5OVjLsFXwpTcrtVotUJAdbCrpSJ3eP/Ys6V
         W+yddGhGAf9FOf/U73+yrXs7KWnMGhjuOkpgbJu+qMblv7Id+l8OrCpIUq7Xc0bxxqDe
         wmGe4WL/KFy8POYQr6ElfpIPLYBIXI8KGJRYpkBDALcMCY3esDHRFnNoQMwHgSquC7Uh
         RLSQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SgiywhvUANSsgpPy4AUGQ3DHXfvtOrvnh1L+kCXhZGI=;
        b=eeXjOBGC16lsyU7QauT4AB3tMXbN44smljSc2WimGFGUw9sfC5X1A5KSHPQC9tx3n3
         x9CY3NLa7lKH0GKPg35FzhHGtERl6DDGCPSN6xBNOOr0ciByVp+8FMpzlyVFWvMbI+GN
         eJrCTQzAu6goNdDvYWAIKNtTyJOXfHTMqWSXBQRBg2UtcW9O21c53/w8c/0+ahLrLGlA
         cqT5rLlEO5jXDDPBj8uwiNbXuOdI06mU6BcVux8jgZod4D8i+XH4jDpUNrucXLTFrQxS
         vy4cvWR/0NuSrteESzr9ZjHMQgJ/5jYaYvbwtgKwW7i1LxCOWr4+Ew9XlGIWhnztm2sh
         mhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SgiywhvUANSsgpPy4AUGQ3DHXfvtOrvnh1L+kCXhZGI=;
        b=fjkKPZLsApf68XBHcuDvCxYgn56aipMVK/YcxL0eBY/ICgwIgnI9FRPMc+IUFZrt0J
         LCppWgRchJ1fSIEuaxnCKZTPjstyf+QSMnvjOly0iGcgYXkDQP7Xbn5f/4CCpkJe+nLP
         nRQGk1Q8zKWZ+pn6kh/ehal0C23b8d5Sboni2R0uG2TI/LMGZXmYGtIkUm1sRRbRfwvu
         DPtcV4AYnf/q9m9LnQQnP6Ii05kPZiRqEosTSAFcLOpD44KqbrkIl3QIOAS7CfmqSHcR
         Zlc62/9cPE669RJhGzw/uTfsZHjPUwaQMhbqTZ3ro5iujgMLXbeZG/88Xi/jlzyV/0PA
         xXrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533B1fPb9Se+A736kai7VtlGd0LhReJ1dwxR2oC4XaKLy+swxF4i
	3c3HbpuWS5yE2pW8n9L4GMg=
X-Google-Smtp-Source: ABdhPJxny1hFfnpiNVkLW9qNoFC+2W9IrBl+o8oLFHJz8MM2RPnyVtPsyY3ERg8kfSqXCLAsQhtodg==
X-Received: by 2002:adf:fc45:: with SMTP id e5mr2716483wrs.226.1597919113599;
        Thu, 20 Aug 2020 03:25:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls1823985wra.3.gmail; Thu, 20 Aug
 2020 03:25:12 -0700 (PDT)
X-Received: by 2002:adf:ba83:: with SMTP id p3mr2606668wrg.246.1597919112673;
        Thu, 20 Aug 2020 03:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597919112; cv=none;
        d=google.com; s=arc-20160816;
        b=eGIhIA9vS3IylTiXvhoBpW9ms29sxvoY5TPQ9lMhLFPoW+0FIUt4/EfSPqqovWBcn9
         /aXZ2uQGJE16rrOpRHyqQ9DRDYDzRn+U0FXq3t5embcCL7cVLnBTE9Og815LmOOnBkog
         INcOXqdQpQm4co92DFU3mArr6hpHFT2kRd3BgSya0FFOds5YR+HiABPfGpjmRuLC0mcq
         KeKCdJ0ykksX8udw213iEHiCraWqLUNmT8cqiEWNmie5E2U2NcI5T4VMrjIJAU8ueUD8
         sXLS6ddf4GuBUCHBwfI57Kn9pYZyARqRv0zIPcrDI87wUVk6IBNWBPmGXUxA9uv3qRYQ
         NFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=zwsrqdD2Caix1tdiAKiQXQ6OiR5TBz5zrrQkynl94nM=;
        b=VFbLOHDRk9efnuU8cvMewecGWk0kurk6vqp4ATjbjmugk/VB7KYN7ldl9GU5oD67UX
         lFQKuwL25i99JEo0KfGHl56LZoyr+2B6fhuHNEfNrYrJR2IYUSwD7E7KLjVA6e8u/Cu4
         ONLkVfkH0LQ8uS9+oUfd6zhNv+JvBknnxckW8xHFW3DTCwyabV4XZ5Uo6QAoCXw8XZEn
         RAOhAveB4gXpmRz1X9aLYPiGmzlQJ7+Ssu/RBoThJ+VfqScasZiwuS345vqk33VsBAOb
         B5JTqtUb0BcaMzAb4qYtcTkPnEzKkIYMDlN6JcxeoMaZEbvDCxDUMSmiuj017+hO+Yn2
         LgIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j16si64748wrs.5.2020.08.20.03.25.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07KAPClg013171
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Aug 2020 12:25:12 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07KAPAGJ009765;
	Thu, 20 Aug 2020 12:25:11 +0200
Subject: Re: [PATCH 2/5] arm64: no use FPU registers in jailhouse
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200820100707.20013-1-peng.fan@nxp.com>
 <20200820100707.20013-2-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <72a4c105-18c1-6f82-468a-370fae6e7f72@siemens.com>
Date: Thu, 20 Aug 2020 12:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820100707.20013-2-peng.fan@nxp.com>
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

On 20.08.20 12:07, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Some compilers default use hardfloat to generate instructions,
> so it will use some FPU/NEON registers to do some optimization.
> 
> However some inmates might use FPU/NEON registers do some
> calculation such as vector/audio and etc. So we need to disable
> jailhouse use these registers. Use `-march=armv8-a+nofp` for this.
> 
> Reported-by: Michal Hanak <michal.hanak@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm64/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hypervisor/arch/arm64/Makefile b/hypervisor/arch/arm64/Makefile
> index 1eb961d2..0718994d 100644
> --- a/hypervisor/arch/arm64/Makefile
> +++ b/hypervisor/arch/arm64/Makefile
> @@ -11,3 +11,5 @@
>  #
>  
>  LINUXINCLUDE += -I$(src)/arch/arm-common/include
> +
> +KBUILD_CFLAGS += -march=armv8-a+nofp
> 

I suppose the subject should read "Do not use FPU..." :)

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72a4c105-18c1-6f82-468a-370fae6e7f72%40siemens.com.
