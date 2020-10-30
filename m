Return-Path: <jailhouse-dev+bncBCW2V5WNZMERB5OL576AKGQEB3FBJVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66C2A021F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 11:07:49 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id h8sf2475066wrt.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 03:07:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604052469; cv=pass;
        d=google.com; s=arc-20160816;
        b=M5ktZOzHSBbrYBizadw1//W3KaC73f3OJPHCftwTJxESEIm1O0RA91mjF8myyOUnI8
         pLizRbTSfewu/nwp8tgz6Qy+Sea2otxw0V/eMjO3SzWa4j1JJekuIequZ1dEU8WzFMJd
         n5jOlg+yZTNVIdCk72rOn6zhyJGU20ER92P1NF1/VUHcB4Sr7NJxrIott5wW8rm2XNyh
         gr+qCOLZtEQ+OYJQmdGXU0U6IlcURSsYETP1+Z21FQq6ZpUfwbpmiTGI1kwO7sHfICX4
         obbgxOW28okaLIfxRu7xI2M0ff7FPJjc7vKNatin9VV7Xk2KQsvHzSCHj82KcTDyVJZe
         JIUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=nCmyUDWvVVIVwzwm93opgvjEYfTW8FD0uLWpL/G8aH0=;
        b=BXkB3A0UGT+LQf6u5zoRjtQ0cUD792ZGyrQmaLZbOF+msp6j9WbhVpTecNXQiqS8Oh
         7cf+P9LmcGqgz1RqWGZyMMAQPGuhggmkslqqijUL4xF9q8+ZG7CWtocTTh65jsxqKKTc
         KLObc38Nwg3xf9CDMA/VIpdexZbIE6hH45oXvMAS5syy0bDUD61A2zgI3TXadY8yqMnb
         XNd5/US/tJz+XHP3OFPNOo5cDIfxpkq57CAJNqF6q1j39qEFJWx+q7mYbNvYNRLdEaXO
         HCe697fIZfhrZKfAw3RiSNg+4MCdMKs7SLK6jfpVKi/nRifx9Os1FO5j6J3Sca+enoHz
         6npg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YS9dVzFH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nCmyUDWvVVIVwzwm93opgvjEYfTW8FD0uLWpL/G8aH0=;
        b=K91QEWlKqIJSaVa45BAcYLkqd0tU/5zIsywVi4AqrMTdX2XY/CHbXLarxLIojx9Leb
         fdRiCTllfdWA7B/Xqa7BgHw6UBimApkgE7d9lg2vnFdoVVpZ2UamN6Ama4I4h3hHBBKQ
         OzsnxMVHZKomiSER2NpZ5CrCq8dFZ0kDVvFviwRvvB9TH4nVfQKn2ggqe0CmuYrb8q3u
         QouiDmNv6a2zHTeKX+R7SJNtNbYH8MqHngalBuf9wQ0xbNtxrjLuOIIkmLtr8bYX6dHW
         Q3ebacx3seDD7vh2MuT4zO8XFfTfeEvGIbKiWT6v7bhtZyrsWBPqHcsHDp7rQJ4aZLBb
         WQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nCmyUDWvVVIVwzwm93opgvjEYfTW8FD0uLWpL/G8aH0=;
        b=YDprwHb7XQ4WYcza6UytKrLuaSOplDyzDjCifctOV2TIT7CoU1363gi92zc6AvTbxx
         AzfJhgnYnzIqBUznoS5J3nSLus897i6ZBSZYphVQ75tuMCgz91Kchyfhu7d40lwEE9Eq
         Jcxj1fp4t+EuGntHtgCuYKTz99tuvwldHT6O4uMGp0//Prr2ea7fGDiK9sa/NEn1+ZFc
         kZMyt09RQHq3cEKOTiF0h7nf7pKY5wjWdKKzumStW9ekQW4UeMQkjIee1KV49fvhkyEc
         N1h5HGswBk6o5jEc3c9DXDxCtQpvBGvO9Bj43XhNR/SN7whIVPWrZyW5GJ8lU9u3se9Z
         G+xQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532kDyj8mAZmGBKz3pKu5xtVgGpi30JJGNH1a1BELpWaS2FiCpTg
	zDVuSn0zqcyby574ZVikCC4=
X-Google-Smtp-Source: ABdhPJxwn3zmdXT+e/59CLHDPUgW6fPE6uLJd7DZLrbYqMEPC6SooGP0MUMl3NE4sqUczmtKxKwsBQ==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr1855545wmg.68.1604052469537;
        Fri, 30 Oct 2020 03:07:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls940955wrj.0.gmail; Fri, 30 Oct
 2020 03:07:48 -0700 (PDT)
X-Received: by 2002:adf:8bd5:: with SMTP id w21mr2218940wra.301.1604052468543;
        Fri, 30 Oct 2020 03:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604052468; cv=none;
        d=google.com; s=arc-20160816;
        b=gcfBspryWB1HeqVPfYDEW+s/9kuGeqEBwMmacoGP7T354klveZsmTtTYdrTNN4e8lT
         /oJgABya8/KDfMs3xsOzkytDtsgit0sJYY5qIp22XCyt5J8mKjjyxPF950N3spCNNXmW
         OxCwAskgFZRapSnL4inCBlhHMnmYAqnpI1npJVOyu/HGF364ShbtFtyBAQ2YxCCfn7fd
         QKn/e5NyXZe7H+QGkVSbjdTToergYKPttPlM4zkkXorG4iLuSGh4D8ArQJeuijral0Kg
         ddzzpdhtwVdnao/NrwncOYIPG3yqZK+TuCqdwrLaO3dDqHFHVAgr8R02UYIUOpdAfxz2
         Ad9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=Ceb01Mf89PRy1UpsFitQv++EmjpZ9Za581Np/yNWxi8=;
        b=shYAIDmLhmwHdgsw/iSjVt94xR4dCB5Wl6KP2JXhUmOhAQ509UmemcjYYN3vvyJ1JP
         RWrfe6/CMaD1qFbZr0J6z5eVthliGFcBr1LMPvi2PjXesWUNUrH8QQk6Gz6GDK5fPEgh
         9GCKpqNXIIQ59WA61xS4r5I3w+zJjdAvjYcss2p9XADGuU7BOcHUl0mpUC+asDmKbNSc
         TkX31c6ShXxzoUuJSIOUjR8WkMZzfSdizsLLUd/xpJtgHiBGyjEqqoGKMvOxXF38E5fd
         Nw2dsszmmOMfhApum9tq1FeANrT4ru2jUaQRa4Q2js7OtUB5wMwsDBu5sl5d5KvazBKX
         grgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YS9dVzFH;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id w6si102815wmk.2.2020.10.30.03.07.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 03:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CMyfr1Sv6zyXh;
	Fri, 30 Oct 2020 11:07:48 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -3.126
X-Spam-Level: 
X-Spam-Status: No, score=-3.126 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.253] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id J5SRW5yIWPo2; Fri, 30 Oct 2020 11:07:47 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CMyfn0xGqzySJ;
	Fri, 30 Oct 2020 11:07:44 +0100 (CET)
Subject: Re: [PATCH] arm64: smmu: Enable only on config commit
To: Jan Kiszka <jan.kiszka@siemens.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
 Renato Mancuso <rmancuso@bu.edu>
References: <ac6d8f7d-371d-88ed-bcbc-509926fc5770@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <6b1bad95-118c-4041-2044-0e8c4c44b905@tum.de>
Date: Fri, 30 Oct 2020 11:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ac6d8f7d-371d-88ed-bcbc-509926fc5770@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=YS9dVzFH;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 30/10/2020 10:25, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> There are no tables ready during arm_smmu_init(). Therefore, we need to
> hold back writing sCR0 until config commit.
> 
> This fixes DMA errors during startup.

Thanks! Tested on the ZCU 102, the DMA errors I had are gone.

Andrea

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Replaces "arm64: smmu: Do not enable SMMU if TLB flush fails".
> 
>  hypervisor/arch/arm64/include/asm/smmu.h | 12 ++++++++
>  hypervisor/arch/arm64/iommu.c            |  2 ++
>  hypervisor/arch/arm64/smmu.c             | 35 +++++++++++++++---------
>  3 files changed, 36 insertions(+), 13 deletions(-)
>  create mode 100644 hypervisor/arch/arm64/include/asm/smmu.h
> 
> diff --git a/hypervisor/arch/arm64/include/asm/smmu.h b/hypervisor/arch/arm64/include/asm/smmu.h
> new file mode 100644
> index 00000000..def7cbde
> --- /dev/null
> +++ b/hypervisor/arch/arm64/include/asm/smmu.h
> @@ -0,0 +1,12 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright Siemens AG, 2020
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/cell.h>
> +
> +void arm_smmu_config_commit(struct cell *cell);
> diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
> index 805589b3..ca998789 100644
> --- a/hypervisor/arch/arm64/iommu.c
> +++ b/hypervisor/arch/arm64/iommu.c
> @@ -12,6 +12,7 @@
>  
>  #include <jailhouse/control.h>
>  #include <asm/iommu.h>
> +#include <asm/smmu.h>
>  #include <asm/ti-pvu.h>
>  
>  unsigned int iommu_count_units(void)
> @@ -38,5 +39,6 @@ int iommu_unmap_memory_region(struct cell *cell,
>  
>  void iommu_config_commit(struct cell *cell)
>  {
> +	arm_smmu_config_commit(cell);
>  	pvu_iommu_config_commit(cell);
>  }
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 89631d16..911f50d1 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -14,6 +14,7 @@
>  #include <jailhouse/printk.h>
>  #include <jailhouse/unit.h>
>  #include <asm/iommu.h>
> +#include <asm/smmu.h>
>  
>  #include <jailhouse/cell-config.h>
>  
> @@ -238,7 +239,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	void *gr0_base = ARM_SMMU_GR0(smmu);
>  	unsigned int idx;
>  	u32 reg;
> -	int ret;
>  
>  	/* Clear global FSR */
>  	reg = mmio_read32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR);
> @@ -287,18 +287,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  	/* Invalidate the TLB, just in case */
>  	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
>  	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
> -
> -	/* Enable fault reporting */
> -	reg = sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE;
> -
> -	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
> -	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
> -
> -	/* Push the button */
> -	ret = arm_smmu_tlb_sync_global(smmu);
> -	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
> -
> -	return ret;
> +	return arm_smmu_tlb_sync_global(smmu);
>  }
>  
>  static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
> @@ -512,6 +501,26 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  	}
>  }
>  
> +void arm_smmu_config_commit(struct cell *cell)
> +{
> +	struct arm_smmu_device *smmu;
> +	unsigned int dev;
> +
> +	if (cell != &root_cell)
> +		return;
> +
> +	for_each_smmu(smmu, dev) {
> +		/*
> +		 * Enable fault reporting,
> +		 * private VMIDS, disable TLB broadcasting,
> +		 * fault unmatched streams
> +		 */
> +		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0,
> +			sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE |
> +			sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG);
> +	}
> +}
> +
>  static void arm_smmu_shutdown(void)
>  {
>  	struct arm_smmu_device *smmu;
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6b1bad95-118c-4041-2044-0e8c4c44b905%40tum.de.
