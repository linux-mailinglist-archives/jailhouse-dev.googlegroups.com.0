Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGHO575QKGQE4BM74VQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EFA28450E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:48:25 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id e3sf2079967ljn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:48:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601959704; cv=pass;
        d=google.com; s=arc-20160816;
        b=F8+VUv1xKceiq2mEDr+bCkf9OwoX1U1JUYIJkB4ayA5oDI0BO03vUtDwDiSx6ZObSR
         a9GIwfL5AWNbc36AFYAdlNKj3A6hRzte086qFWKO7RujD7arpBjpytbgXMnLsAGKba6a
         MXt6HeSZmcbUVGej+J96ojZTnn/IMSqA3w/gjJSPMgnzEB1NRQody2A+SNPvr2Y5Cg1/
         BC5LMdlhUGxZlS1FqKmuIVttaOROafYKYIuW0w+G290c/JEwtocpKLXtnzlZw7NRU0bN
         cTI4knIAWiHd4A9u+Py/ztghkXvqHAs9AFeNvOXYp4ClxeedQqS18fTG8qMit2Gsp6jc
         I3pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:cc:references:to:from
         :subject:sender:dkim-signature;
        bh=576bknXj0uYGCBF2eVUucfmE7MLh18plWtrrdpUIORs=;
        b=rXmmIY6xdzzqf8Qy85neNl8hA51nEb3I7vMogNibIr596bulpvKPjF7rwxvU8hTrv/
         MexjzOS3MmrIP7gOX9v/0yiiFQVViofEyswTvTHTNrESZdImsB+6eUgIrvA36Ll0IlE5
         Ndz1Y+94yPbplkXYoi0oOH+u6Y0BpaHu5CcMl11nQXt0KSLpMvIY+0Hde5z7A9hMOhMg
         26HJAZJN4LNEU6dDCTrsgo/KnHILYygsp+mlFfQ8J65yAszNaX5XPH+Qb+clhB4LA6NG
         0VYUwI8z2sMqq8WsE5rzexQCM5ws14DJsC1y1MiYKJ03zrJvW8Ht0G9+0U209W331jFr
         NWuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=576bknXj0uYGCBF2eVUucfmE7MLh18plWtrrdpUIORs=;
        b=RdBFMhgjRuoVT6NmZx9YpnUYlovRGO1KaWu/Pd3sqcPo9rOtNG+X74WeOcuPupEiRX
         hQhM06VTN2AEckTwcqkuowS8hJUEfRHHPwQP7mgi35DP/yNKKKDvE8RMk330va3QFfrJ
         wga8BXCn4w0dDcFpxOfQwVUni3JeSAAYj7qCoFCwW1Gfn0OPI7gR3XO6EtoqvwcXM1M7
         mShHBFdwJYFr9oKY4gZLvAv8G1iQ2aGbydxepC+y/1LbbpSBfxElhaVmouygKH+Dp6VU
         +nFnQz9v46K5558BiHteQdbUpAtJAdWcVe7x3SoxLkBLDpQ424wEOMKLA6MVSfunztWP
         9w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=576bknXj0uYGCBF2eVUucfmE7MLh18plWtrrdpUIORs=;
        b=czcR8NFL0GAbIXmZRrL2QqgwPB3793cUC8DdbF2AD2H2fvEWTIbgcTfjPfP5m2xqJx
         yEIk4o7mcu6rJmhxyMk/6alAHk1z9jRJ3EfIp8H/6ofZQIY5vRSroT//yJUxj/4KwMhQ
         gZtdmM46WHkAWwlWAHC+CkzFfnu9JiaL2lencW7FqJml2mPEAhXLPSqE34DGnCdo7B/9
         CGDNT9aC8RjsA5eBy0nhELErGefI5ZvYmmKVcBKLEMYPjU/drO5NHVVfb4Ih3zotCEZe
         I8uwTrkE2SOL9Pz2zuhSRvaNwtd6QVyRJo5Bqa/j4nhHdDCu99bkS9orzSHDYm6qt/sY
         aC0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HDGeie3zt4Qqq0odMOLlzpNeoKZqbVJBJWRw0JtF1UqvjG/MI
	17dpbp0D7pVt5IRWGZAZ1FA=
X-Google-Smtp-Source: ABdhPJwC5v7zEXn28eiMTOABaABff5UMVoKGs6RTAUEcKhDtkP6eICSLfNKQrRA9sUtmkJVrwipwMA==
X-Received: by 2002:a05:651c:1307:: with SMTP id u7mr1092880lja.267.1601959704666;
        Mon, 05 Oct 2020 21:48:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1295188lfd.3.gmail; Mon, 05
 Oct 2020 21:48:23 -0700 (PDT)
X-Received: by 2002:ac2:44b7:: with SMTP id c23mr813111lfm.128.1601959703485;
        Mon, 05 Oct 2020 21:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601959703; cv=none;
        d=google.com; s=arc-20160816;
        b=Cw3ygt/v3v+tn94YZujNo2kLzIDcAWIjFWimy9m2DEGJHmgcMqdcg0Xb5FM7npsDfJ
         JEJEzMUS8oNaM13/4eoJmJxN1zbFBEDF3qsJbasM7AVKqm0lEWf7V2VENxMDVpeUAwfj
         ibv1yt4crgpMad8+9bc1G0tuiLbGitGYtTNMaK+1LHmn7BL0g0KXAk7H2Uc8nSfWxJ6u
         ql0lMRsqmiNrOd+QZlMOP0AnE6Uz/JDJ/7lZf+3RUaMBTSUYeSIMqCHA405cfovYYuUU
         fSnwAVZ+TjvRyJz8DM5qvn9JqayucXS5bVTw1xfPk01Zqx9fwNPZJpW3erOxX+VGUWRI
         2Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:from:subject;
        bh=BF3wYjHEaSYCySmTuRe5rI5+PUQSBofidHi54KMJK0M=;
        b=g4ZwOfQoenjecZoinBHA4Jyc2ssV4toisTtBxFMZRBhkJcz9j2wAiOoCDjgoEPgDyr
         eSDpgGx5ZdPHUbj4e3PmlXnA0YDt1hrvS8gTWSnW5jGQqBA+/3mvllmOl82wu3z/KEeg
         PJtPMHUPKIqOvYPe3wqFixZeSZo6L4LArJNXsuRFlWNqiQZPIECshe7jLv2RR6wy6iNT
         MhIUwVKNehOCekn6Yv/NcJbAik3erA3wbnBVod8rofR8b2yfMtogi5ND5eQ5ncO4/r0Q
         rbcE7QbLpqFzxhqFmWbqWO+MxOuFhPRKbghteLkJiLBgRHQAD5qjAxSBRjg9UcbC9jXO
         FM1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q11si53079lfo.8.2020.10.05.21.48.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964mKQ4027931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2020 06:48:20 +0200
Received: from [167.87.160.159] ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964mHB2028209;
	Tue, 6 Oct 2020 06:48:18 +0200
Subject: Re: [PATCH 12/45] arm64: smmu: Add shutdown handler
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <0bcb9f9f3795c42576304889855aba72b5f3a67b.1601838005.git.jan.kiszka@siemens.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        Chase Conklin <Chase.Conklin@arm.com>
Message-ID: <aca61191-4d49-044f-cb61-c532492a26df@siemens.com>
Date: Tue, 6 Oct 2020 06:48:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0bcb9f9f3795c42576304889855aba72b5f3a67b.1601838005.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
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

On 04.10.20 20:59, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Properly disable the SMMU on shutdown as well as on errors during setup.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/arm64/smmu.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 34c99a6a..f20a44f6 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -890,6 +890,17 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  	}
>  }
>  
> +static void arm_smmu_shutdown(void)
> +{
> +	struct arm_smmu_device *smmu;
> +	unsigned int dev;
> +
> +	for_each_smmu(smmu, dev) {
> +		mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0,
> +			     sCR0_CLIENTPD);

BTW, does someone know if we need a TLB flush after this as well? My
expectation and understanding of the spec is that this bit makes the
transactions bypass early, but maybe I'm missing something.

Jan

> +	}
> +}
> +
>  static int arm_smmu_init(void)
>  {
>  	struct jailhouse_iommu *iommu;
> @@ -906,8 +917,10 @@ static int arm_smmu_init(void)
>  		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
>  
>  		smmu->base = paging_map_device(iommu->base, iommu->size);
> -		if (!smmu->base)
> -			return -ENOMEM;
> +		if (!smmu->base) {
> +			err = -ENOMEM;
> +			goto error;
> +		}
>  
>  		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
>  
> @@ -915,11 +928,11 @@ static int arm_smmu_init(void)
>  
>  		err = arm_smmu_device_cfg_probe(smmu);
>  		if (err)
> -			return err;
> +			goto error;
>  
>  		err = arm_smmu_device_reset(smmu);
>  		if (err)
> -			return err;
> +			goto error;
>  
>  		arm_smmu_test_smr_masks(smmu);
>  
> @@ -929,9 +942,14 @@ static int arm_smmu_init(void)
>  	if (num_smmu_devices == 0)
>  		return 0;
>  
> -	return arm_smmu_cell_init(&root_cell);
> +	err = arm_smmu_cell_init(&root_cell);
> +	if (!err)
> +		return 0;
> +
> +error:
> +	arm_smmu_shutdown();
> +	return err;
>  }
>  
>  DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
> -DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
>  DEFINE_UNIT(arm_smmu, "ARM SMMU");
> 

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aca61191-4d49-044f-cb61-c532492a26df%40siemens.com.
