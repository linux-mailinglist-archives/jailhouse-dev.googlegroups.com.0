Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIM63L4QKGQEL22ZVYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B50244A4A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 15:18:26 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id x190sf2017622lff.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 06:18:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597411106; cv=pass;
        d=google.com; s=arc-20160816;
        b=McJ+u8AEI8KS52oy7mos7+iCe/g2fd5JS6Xgz/or2r/Rcb+by9G7AJFjyJbKHLWGBs
         3vbF7KC1SpDmkUo1lbum79X3+gjoszVSoV2ogHIwjKtwJIa+cChPKVvzjB3L7Zq3Q7Vm
         Apo6yEhJD3UaFTmLW8r0JRO4B5HzufSo/Wg6ZPSYacLdJh4UAdrV2Tdu6btLrY0EdGUV
         yemWAZV0cReA9g5oDxfKxHuCR8cL6oubBCudhVeCbQVI2+7OXC2CUqJyUs8gjwKlOyaQ
         IYAdn+IQQtr5vatVcut+CTBPpfmCmRc9JMkpwTJ/gzO+Tyho39wy6c/ULazwrdzZrHKD
         v9rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ffUhsFXsfPvNMUfZu+gd1hxo6QRDJQjRBAKr40sj7+Y=;
        b=alGTnc55ZGf7cmHohxqUsUuXZBPlhOpireK8NlRdsqYEt6uFYW9rt2xIV2WOJuaPAw
         PqegxbJKTGVwYv25ZUUukV+E53i/6r7TEtWgn3utVevLJNiFDgFEmUblNT6aSaGuVtcd
         thsxMVvE5g0sQQ5ZXeZXZGMqHqrh1m+QCTjxKwqSWzFWsRswBWQknh7r7QS9NM0Qarp9
         6yIHjwd1f4yvG57tkSz/dqYku2DS5RhE2fr1EGgIBEmYAFxmnST/PMYz7VVn8CZaP5BB
         xXM+IS9YSb5PdLv/Np2MI95JN+M1o9pTft+kBKbi/+RqKpmQGinrn14tG8UjnSEQQhEP
         0FVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ffUhsFXsfPvNMUfZu+gd1hxo6QRDJQjRBAKr40sj7+Y=;
        b=YDFn27knqrn0FTqzANynRB4+mMIH2zQCMjQxUUqDHZq6rs4ArWGj6qRYZIMp41PS31
         Kj6SZLArOiXcu7aR+D6rS4ftwlK16Z+ZBaEdt/48NjXoOTRASdqxte84Bj57ADE5/xWM
         88bi6vwi8Q6/of4RV6NzOSIeNj8DxmRnIENLnrVcrpAASbRa5Y6tQUet9acfokEjupE8
         2Y3dpN6GPmKiYlRLYiLaeeWurOayj07qmQpSMVp0uYWolBw2hPctCG/67gsuVy8n7hnM
         VHW/gvKRa+msfyuVe3ixJvXqoMpaOBFRulvqWjUf3R4O55ueQ61gLB0RstCK5oJFmrNs
         xAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ffUhsFXsfPvNMUfZu+gd1hxo6QRDJQjRBAKr40sj7+Y=;
        b=JKVbCv+PD7cBt+LiznLfrCR87OJI8zrozV6cjIa6JhboqQZ7aCTiggzPn0eCaq6QAV
         dLe2YhbPUXP6DAOJCm0lq6fPQ/+x9GHymQYBKo4Fzb7oeK2dtpAH3hTsojfNfUHI9MbT
         TDredlRaRQF8LypAPYosAKTNSX11kQS8L/Isg2ETE0gNGud7ZEwx+3NNuTcyU3ehP58E
         UvPPGkrYDgGWP7OOaO/xX6onk9avGwYLBducEEzjOgmrRpDoCkutbAJilQEXNx8I/qJY
         T1kkfbnxx4D5yjxh8ByjHHfODELAa9z7XcZqeeABFSFnJ6AhiVhI1jOxo0TmOPhlZZ9/
         DwVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xkWZnyvVhUx+GXNSrnOkhrPQ0Q8gM2LVv8u6m6mQp/HoJRxWl
	u6aXjaq1J2+7L6Y1jLAq9Y8=
X-Google-Smtp-Source: ABdhPJyZRco9vFT9P1DhldnODs5tZsFiYns4dLa/UKz/1K9P3h6mXTsTAG5XvNI1pEyW7ZYiLqdG6A==
X-Received: by 2002:ac2:5f81:: with SMTP id r1mr1199174lfe.168.1597411105902;
        Fri, 14 Aug 2020 06:18:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8994:: with SMTP id c20ls21909lji.0.gmail; Fri, 14 Aug
 2020 06:18:25 -0700 (PDT)
X-Received: by 2002:a2e:983:: with SMTP id 125mr1403594ljj.32.1597411104977;
        Fri, 14 Aug 2020 06:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597411104; cv=none;
        d=google.com; s=arc-20160816;
        b=h7Jizkng9c+LEmv7SJe+1sIGCVnRwCDFhAN4tIK+zitnRd2uIK1wYIkMaV5oOrDwhH
         ZkhGRsaNA+rhk4fdiMmjpWpzx+HlkMT80se/uD+GZCEo1whMuckq0dJdZZZ2PdSyOFFg
         ci/FT3/YZ4UAL5w20B/3Pu7V341jOYDzGtKRDeTQP0NI9BRJ34op9Rx3xKmsXW6LnAp5
         E7byIRWUZ9n3seCcVuho5ZpJIqcEM5intb3/8K7Dqs3d9voGAok6TNJFC0qNYLuj1/lV
         HmhLf/y7ZIwh0hTrmtdbdm0YRFDZbkKSXOJTT8BEJRfjSDThXpJUrvtItRXyc9Q29uVj
         4qLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=SMSzbQjwwWMVJoWRbCEdUQaibY6t3r8BJOAUa74fyHo=;
        b=D1PDu9lRdONsOcqKnh8d9X4si0X4Sm1Sy6unrKjlDT0J6ubZDHd8kvl3D6HnQv7/wL
         wxyPR4fNBiG3bS8++D9NrA9CvzCttdcu1HP36NXfbfZ7HBUkmZ76NZAjM4Ccl6d4LcLz
         ul3S1nSdzuoqp61C04ocSXWiD+ea/kNBoiPF2/zU34u+bG3tjhdnyVoXkSDbjW2MOFDy
         Q4aTt1fKR2BJg9+ecXy+C3/Z/1x62zHKdMhF3MVz553AjjLf3LK5nwO2gr4mIIpINvFh
         cZSv9fM1lyIJKNtoTgEZIMNaCGxGpfivy2i1pfcpSNa+WxPAxISVN1cEuExTUnMcQ8sx
         eu9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t3si297180ljg.1.2020.08.14.06.18.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 06:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07EDIOcd028959
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Aug 2020 15:18:24 +0200
Received: from [167.87.75.232] ([167.87.75.232])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07EDINWf020599;
	Fri, 14 Aug 2020 15:18:23 +0200
Subject: Re: [PATCH V2 2/4] inmates: gic-v3: solve incompatibility problems in
 gic_v3_init()
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <20200815190949.6837-2-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9f9abcdb-d79d-bd4e-98eb-0d27feedda85@siemens.com>
Date: Fri, 14 Aug 2020 15:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200815190949.6837-2-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 15.08.20 21:09, Alice Guo wrote:
> When the inmate cell is in AArch32 execution state, using mmio_read64()
> to obtain the value of GICR_TYPER will cause error because mmio_read64()
> generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
> "ldrd" belongs to A64 assembly language which is cannot be used in
> AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.
> 
> In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
> state can only support three levels of affinity. So use MPIDR_CPUID_MASK
> to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   inmates/lib/arm-common/gic-v3.c         | 4 +++-
>   inmates/lib/arm/include/asm/sysregs.h   | 2 ++
>   inmates/lib/arm64/include/asm/sysregs.h | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/inmates/lib/arm-common/gic-v3.c b/inmates/lib/arm-common/gic-v3.c
> index 35ee9a6a..cd202a46 100644
> --- a/inmates/lib/arm-common/gic-v3.c
> +++ b/inmates/lib/arm-common/gic-v3.c
> @@ -76,6 +76,7 @@ static int gic_v3_init(void)
>   	map_range(redist_addr, PAGE_SIZE, MAP_UNCACHED);
>   
>   	arm_read_sysreg(MPIDR, mpidr);
> +	mpidr &= MPIDR_CPUID_MASK;
>   	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
>   		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
>   		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
> @@ -87,7 +88,8 @@ static int gic_v3_init(void)
>   		if (GICR_PIDR2_ARCH(pidr) != 3)
>   			break;
>   
> -		typer = mmio_read64(redist_addr + GICR_TYPER);
> +		typer = mmio_read32(redist_addr + GICR_TYPER);
> +		typer |= (u64)mmio_read32(redist_addr + GICR_TYPER + 4) << 32;
>   		if ((typer >> 32) == aff) {
>   			gicr = redist_addr;
>   			break;
> diff --git a/inmates/lib/arm/include/asm/sysregs.h b/inmates/lib/arm/include/asm/sysregs.h
> index 72cabdc5..c0b137c7 100644
> --- a/inmates/lib/arm/include/asm/sysregs.h
> +++ b/inmates/lib/arm/include/asm/sysregs.h
> @@ -77,6 +77,8 @@
>   
>   #define MPIDR		SYSREG_32(0, c0, c0, 5)
>   
> +#define  MPIDR_CPUID_MASK	0x00ffffff
> +
>   #define MPIDR_LEVEL_BITS		8
>   #define MPIDR_LEVEL_MASK		((1 << MPIDR_LEVEL_BITS) - 1)
>   #define MPIDR_LEVEL_SHIFT(level)	(MPIDR_LEVEL_BITS * (level))
> diff --git a/inmates/lib/arm64/include/asm/sysregs.h b/inmates/lib/arm64/include/asm/sysregs.h
> index 8065b89d..6d94a59f 100644
> --- a/inmates/lib/arm64/include/asm/sysregs.h
> +++ b/inmates/lib/arm64/include/asm/sysregs.h
> @@ -75,6 +75,8 @@
>   
>   #define MPIDR	MPIDR_EL1
>   
> +#define MPIDR_CPUID_MASK	0xff00ffffffUL
> +
>   #define MPIDR_LEVEL_BITS_SHIFT	3
>   #define MPIDR_LEVEL_BITS	(1 << MPIDR_LEVEL_BITS_SHIFT)
>   #define MPIDR_LEVEL_MASK	((1 << MPIDR_LEVEL_BITS) - 1)
> 

Looks good, but this needs to be patch 3 because it depends on what is 
currently patch 3.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f9abcdb-d79d-bd4e-98eb-0d27feedda85%40siemens.com.
