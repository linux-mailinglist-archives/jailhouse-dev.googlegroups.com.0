Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKX3RP5QKGQEERWGCWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36D26D36C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 08:09:46 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id c3sf471378eds.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 23:09:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600322986; cv=pass;
        d=google.com; s=arc-20160816;
        b=s0vSYhaF78AtEIF9a5/L9v5D7fdWT2A3vGP7yPrWLPb2jzWV6UoeZMVPzElUV4fb3z
         Q46oWYm5EShrj7ZJo/oYHYu/qWXeg4XfQ4f7QEqqGk5fkjxlpaaY7MiWjUYC6AWeF6lG
         0NxVcSvNkvQ5euYlI/taRO0wqBRguEKDW28U7iNQUyZqVuqaIwch3EEk8BabRAIBq4ew
         FDgNuMQMDDzCBZcLCGGxz8m+BXcJeJXxPquwCE8Wc3n8b0Kzc8x0ohNslS525Mc/XKXy
         /dU7SW2XIuQI7iFeqD/liXnvtZt0Hh0YYvagf7a7YNv2AqYpoLtZ1q0hb4aRpddd8fIK
         Hd9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=+rUjS0QcNXjDP08ynWYnf2j3b91g0OhwBq0/aQNwJ/8=;
        b=QN4h7zFT/ytij+7rPR5+XBLytL/XGzhYv9uPdL6gs6hl2+ye6nXqSbBA2SaorxtkxD
         u2LJHvjp/GxCnlZPx7uVT/pXYVOQRHsX5bEPIQ7tyslKjmfvUv0ZzTGqXil6URMqoSmY
         sD9P04WW5x3x6iTiijbzY6spEZzAABxgLww39hl0030EZQdxHewIv7qjowW+JZvzZjZJ
         nF1BQO9RTtTXH2+Hw7+gZ5G64Fd0Dgs3zSKJh6xTq2bhe9H/rLeez7teV3zubcsgi27I
         90GJVIbqdTYHLGZzadzb4IB/+4sE+lodvnE0NTdPpXei2gAoX0d4M1kJjSi8Vl4Tdpz+
         vDLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+rUjS0QcNXjDP08ynWYnf2j3b91g0OhwBq0/aQNwJ/8=;
        b=NbWb0Qk7+7S1liRO7XhNxLkbDlEEtkZ8uaYAkmsl2y2F79mTnHUoxsIOE5FYxQSbQl
         +BIzisJtwWPLpjL6q97td1aXIRQY/vWQEcUmwztpP4oANRy/0DChPDy7jY/cfLMvt2XX
         ChPhLC1MY0/oOWDNFC/6hRIVMI1MvluZ/aBxHTAqj/+WsuCYVM3xygEB7W71bWke2Dm4
         zyt6RgRB4y9vnpkeZAA6grlfYk1ChS3Q+LsM5wnS2yUBsMLMDHuNjsgl9WIo7Bnnh2pz
         eHxLfPuQLtx2lSmr1BLyljiyrRr9uD19Jkm8IcxE6QWL7KNB2W5wOq5Gd1QF51slGx+V
         Glaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+rUjS0QcNXjDP08ynWYnf2j3b91g0OhwBq0/aQNwJ/8=;
        b=DO/s9iGxMb956qRZU9QOrBBtSSrC2VJRYbTcZvy0s40+3Sso7tBXnF/jW5670c6iPI
         tn1Fgt03aKQo3ENxUSavG54RF76nrzkikSQg7eFuxA8O0Oi3ZdnmkvzVG2fNq/Qn/W7T
         SrWW30Sm8R+AcRfaTQAn35F+sGadA7AEY9dswfFrzBwbaMPxiJHYYuy5B5INKHC3zzfj
         uauFP7WOgmMLaUEjRm0d5B2t+h9RlWXqQ1jglY3zc46Cp4wLk5v3c4hSnV1y2TzHCesg
         HdxNYT3R90xP/aYuLMyPIJVmSva0YsjT9ZrS0O79mBq7zk5e65SsOYrdla7kU6+DTgfV
         lQaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319CvXoK4XX0jMlujfm1iV/WR+k0/CslNT08lmYryUlpVH/072p
	QpjNc1X+ymTl+AqU88Zr2XU=
X-Google-Smtp-Source: ABdhPJxOT1kNUJCqG6O/XMa13Er5+My5s+9iUc7DcL/KV1KPAeKCN75xsW8QoSYFUuqDZ15Op72+HQ==
X-Received: by 2002:a17:906:cf8b:: with SMTP id um11mr30382997ejb.540.1600322986501;
        Wed, 16 Sep 2020 23:09:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls1161503edh.0.gmail; Wed, 16 Sep
 2020 23:09:45 -0700 (PDT)
X-Received: by 2002:aa7:cf0e:: with SMTP id a14mr31656900edy.81.1600322985242;
        Wed, 16 Sep 2020 23:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600322985; cv=none;
        d=google.com; s=arc-20160816;
        b=Qc1s9L4tsclqGlie0DU26Aq+58Qx162ni2AM5E7jdr5J4gZYZgCLYyzLPXc29Dpax5
         oojOngl9EHWTAgD0rQ+4dB2EPkrBJrg0IbSeC7Z71TcxuglVeXr4+JyBkynVy65xz7NK
         XflW+Wtvj/7g5ootng1QfGE4Q7yQVkpouCDDaHy7LPR9Aw3tma3uTUCztJVX90nLg2XR
         +UtSfXu3eniiNCuIHJvl627OETXe8ZXb2DUJrO/hj1jOj0f4vn3whfBNS0UBarCdelet
         HyM4+A1tKtcn+HIaXY1+xveiF+czA7biwSqmdeWb5JsQO97HuUSjJsyr+MYO3XcLA//g
         8uEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=gdkKu5KAMPBZ8+rOwCjxBlo/yIy9ssOiLlUHMbDYEGk=;
        b=aiGZictGVMfm1Y9QBrq18xKIlHy0rumkXuyhAzyJevA7uNRNba7KVUtP4K/d9oIBhD
         JR34CYfVoSObs9JzEJ1QTm0EpFDwan9PqcMN8OewR+urBJZM/6VyOUk/DsyGScgAw2SE
         z5UeIzdbO8SHPOdJeKc3Y+D4TAcJhoOUWnkspwf6gz0PP67l7m0f/Q1PGF1ESFCTDObo
         45ZM2o5ZKoiNSaBvB+dTaYr8s61EOkJnrW6I+XkR8f0/g7Lv4OeoN/H6CN73GBQ9mdsd
         t0hg8i2C02UdJW7qO5TD89AmqOv5T1pps2s+96593aLZDyP9EYcxVKfMOtxa0bp0f0RP
         sV3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w16si625612edq.4.2020.09.16.23.09.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 23:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08H69jGo000607
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2020 08:09:45 +0200
Received: from [167.87.40.222] ([167.87.40.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08H69hgp018915;
	Thu, 17 Sep 2020 08:09:44 +0200
Subject: Re: [PATCH V4 4/5] arm64: support ARM MMU-500
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200917040554.4599-1-alice.guo@nxp.com>
 <20200917040554.4599-4-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <243bf17f-1b11-64f0-5e7d-a1928d0dd61e@siemens.com>
Date: Thu, 17 Sep 2020 08:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917040554.4599-4-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 17.09.20 06:05, Alice Guo wrote:
> Enable SMMU for processors which use MMU-500 to implement the ARM SMMU
> architecture v2. It supports stage 2 translation that allows a
> hypervisor define the translation tables that translate the IPAs for a
> particular guest operating system to PAs.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
> 
> V4: TLB invalidation operation in arm_smmu_cell_exit() was written at a wrong
> position in V3, so fix it in V4.
> 
>   hypervisor/arch/arm64/Kbuild                |    1 +
>   hypervisor/arch/arm64/include/asm/sysregs.h |    7 +
>   hypervisor/arch/arm64/smmu.c                | 1030 +++++++++++++++++++
>   3 files changed, 1038 insertions(+)
>   create mode 100644 hypervisor/arch/arm64/smmu.c
> 
> diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
> index 6773714d..4d328021 100644
> --- a/hypervisor/arch/arm64/Kbuild
> +++ b/hypervisor/arch/arm64/Kbuild
> @@ -22,3 +22,4 @@ always-y := lib.a
>   lib-y := $(common-objs-y)
>   lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
>   lib-y += iommu.o smmu-v3.o ti-pvu.o
> +lib-y += smmu.o
> diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
> index 5acd6d12..32391937 100644
> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> @@ -182,4 +182,11 @@
>   
>   #endif /* __ASSEMBLY__ */
>   
> +/* Context Bank Index */
> +#define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
> +/*  Register type */
> +#define S2CR_TYPE(s2cr)			SET_FIELD((s2cr), 17, 16)
> +/* Privileged Attribute Configuration */
> +#define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
> +
>   #endif
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> new file mode 100644
> index 00000000..600f4123
> --- /dev/null
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -0,0 +1,1030 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2018-2020 NXP
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Modified from Linux smmu.c
> + */
> +
> +#include <jailhouse/control.h>
> +#include <jailhouse/ivshmem.h>
> +#include <jailhouse/mmio.h>
> +#include <jailhouse/paging.h>
> +#include <jailhouse/pci.h>
> +#include <jailhouse/printk.h>
> +#include <jailhouse/sizes.h>
> +#include <jailhouse/string.h>
> +#include <jailhouse/unit.h>
> +#include <asm/iommu.h>
> +#include <asm/spinlock.h>
> +#include <asm/sysregs.h>
> +#include <jailhouse/cell-config.h>
> +
> +#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
> +#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
> +#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
> +#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
> +#define ARM_SMMU_FEAT_VMID16		(1 << 6)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
> +#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
> +#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
> +#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
> +#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
> +#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
> +
> +#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
> +#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
> +#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
> +#define ARM_LPAE_TCR_SH0_SHIFT		12
> +#define ARM_LPAE_TCR_SH_IS		3
> +#define ARM_LPAE_TCR_ORGN0_SHIFT	10
> +#define ARM_LPAE_TCR_IRGN0_SHIFT	8
> +#define ARM_LPAE_TCR_RGN_WBWA		1
> +#define ARM_LPAE_TCR_RGN_WB		3
> +#define ARM_LPAE_TCR_SL0_SHIFT		6
> +#define ARM_LPAE_TCR_SL0_LVL_1		1
> +#define ARM_LPAE_TCR_T0SZ_SHIFT		0
> +#define ARM_LPAE_TCR_PS_SHIFT		16
> +#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
> +#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
> +#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
> +#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
> +#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
> +#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
> +#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
> +
> +#define TLB_LOOP_TIMEOUT		1000000
> +#define TLB_SPIN_COUNT			10
> +
> +/* SMMU global address space */
> +#define ARM_SMMU_GR0(smmu)		((smmu)->base)
> +#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
> +/*
> + * SMMU global address space with conditional offset to access secure
> + * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
> + * nsGFSYNR0: 0x450)
> + */
> +#define ARM_SMMU_GR0_NS(smmu)						\
> +	((smmu)->base +							\
> +		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
> +			? 0x400 : 0))
> +/* Translation context bank */
> +#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
> +
> +/* Configuration Register 0 */
> +#define ARM_SMMU_GR0_sCR0		0x0
> +#define sCR0_CLIENTPD			(1 << 0)
> +#define sCR0_GFRE			(1 << 1)
> +#define sCR0_GFIE			(1 << 2)
> +#define sCR0_EXIDENABLE			(1 << 3)
> +#define sCR0_GCFGFRE			(1 << 4)
> +#define sCR0_GCFGFIE			(1 << 5)
> +#define sCR0_USFCFG			(1 << 10)
> +#define sCR0_VMIDPNE			(1 << 11)
> +#define sCR0_PTM			(1 << 12)
> +#define sCR0_FB				(1 << 13)
> +#define sCR0_VMID16EN			(1 << 31)
> +#define sCR0_BSU_SHIFT			14
> +#define sCR0_BSU_MASK			0x3
> +
> +/* Auxiliary Configuration Register */
> +#define ARM_SMMU_GR0_sACR		0x10
> +#define ARM_MMU500_ACTLR_CPRE		(1 << 1)
> +#define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
> +#define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
> +#define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
> +
> +/* Identification registers */
> +#define ARM_SMMU_GR0_ID0		0x20
> +#define ARM_SMMU_GR0_ID1		0x24
> +#define ARM_SMMU_GR0_ID2		0x28
> +#define ARM_SMMU_GR0_ID7		0x3c
> +#define ID0_S1TS			(1 << 30)
> +#define ID0_S2TS			(1 << 29)
> +#define ID0_NTS				(1 << 28)
> +#define ID0_SMS				(1 << 27)
> +#define ID0_PTFS_NO_AARCH32		(1 << 25)
> +#define ID0_PTFS_NO_AARCH32S		(1 << 24)
> +#define ID0_CTTW			(1 << 14)
> +#define ID0_NUMSIDB_SHIFT		9
> +#define ID0_NUMSIDB_MASK		0xf
> +#define ID0_EXIDS			(1 << 8)
> +#define ID0_NUMSMRG_SHIFT		0
> +#define ID0_NUMSMRG_MASK		0xff
> +
> +#define ID1_PAGESIZE			(1 << 31)
> +#define ID1_NUMPAGENDXB_SHIFT		28
> +#define ID1_NUMPAGENDXB_MASK		7
> +#define ID1_NUMS2CB_SHIFT		16
> +#define ID1_NUMS2CB_MASK		0xff
> +#define ID1_NUMCB_SHIFT			0
> +#define ID1_NUMCB_MASK			0xff
> +
> +#define ID2_IAS_SHIFT			0
> +#define ID2_IAS_MASK			0xf
> +#define ID2_OAS_SHIFT			4
> +#define ID2_OAS_MASK			0xf
> +#define ID2_UBS_SHIFT			8
> +#define ID2_UBS_MASK			0xf
> +#define ID2_PTFS_4K			(1 << 12)
> +#define ID2_PTFS_16K			(1 << 13)
> +#define ID2_PTFS_64K			(1 << 14)
> +#define ID2_VMID16			(1 << 15)
> +
> +#define ID7_MAJOR_SHIFT			4
> +#define ID7_MAJOR_MASK			0xf
> +
> +/* Global Fault Status Register */
> +#define ARM_SMMU_GR0_sGFSR		0x48
> +
> +/* TLB */
> +#define ARM_SMMU_GR0_TLBIVMID		0X64
> +#define ARM_SMMU_GR0_TLBIALLNSNH	0x68
> +#define ARM_SMMU_GR0_TLBIALLH		0x6c
> +#define ARM_SMMU_GR0_sTLBGSYNC		0x70
> +#define ARM_SMMU_GR0_sTLBGSTATUS	0x74
> +#define sTLBGSTATUS_GSACTIVE		(1 << 0)
> +
> +/* Stream Match Register */
> +#define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
> +#define SMR_VALID			(1 << 31)
> +#define SMR_MASK_SHIFT			16
> +#define SMR_ID_SHIFT			0
> +
> +/* Stream-to-Context Register */
> +#define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> +#define S2CR_EXIDVALID			(1 << 10)
> +
> +/* Context Bank Attribute Registers */
> +#define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
> +#define CBAR_VMID_SHIFT			0
> +#define CBAR_TYPE_SHIFT			16
> +#define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
> +#define CBAR_IRPTNDX_SHIFT		24
> +
> +#define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
> +#define CBA2R_RW64_32BIT		(0 << 0)
> +#define CBA2R_RW64_64BIT		(1 << 0)
> +#define CBA2R_VMID_SHIFT		16
> +
> +/* Stage 1 translation context bank address space */
> +#define ARM_SMMU_CB_SCTLR		0x0
> +#define ARM_SMMU_CB_ACTLR		0x4
> +#define ARM_SMMU_CB_TTBR0		0x20
> +#define ARM_SMMU_CB_TTBR1		0x28
> +#define ARM_SMMU_CB_TTBCR		0x30
> +#define ARM_SMMU_CB_CONTEXTIDR		0x34
> +#define ARM_SMMU_CB_FSR			0x58
> +
> +#define SCTLR_CFCFG			(1 << 7)
> +#define SCTLR_CFIE			(1 << 6)
> +#define SCTLR_CFRE			(1 << 5)
> +#define SCTLR_AFE			(1 << 2)
> +#define SCTLR_TRE			(1 << 1)
> +#define SCTLR_M				(1 << 0)
> +
> +#define FSR_MULTI			(1 << 31)
> +#define FSR_SS				(1 << 30)
> +#define FSR_UUT				(1 << 8)
> +#define FSR_ASF				(1 << 7)
> +#define FSR_TLBLKF			(1 << 6)
> +#define FSR_TLBMCF			(1 << 5)
> +#define FSR_EF				(1 << 4)
> +#define FSR_PF				(1 << 3)
> +#define FSR_AFF				(1 << 2)
> +#define FSR_TF				(1 << 1)
> +#define FSR_IGN				(FSR_AFF | FSR_ASF | \
> +					 FSR_TLBMCF | FSR_TLBLKF)
> +#define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
> +					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
> +
> +enum arm_smmu_s2cr_type {
> +	S2CR_TYPE_TRANS,
> +	S2CR_TYPE_BYPASS,
> +	S2CR_TYPE_FAULT,
> +};
> +
> +#define s2cr_init_val (struct arm_smmu_s2cr){	\
> +	.type = S2CR_TYPE_BYPASS,		\
> +}
> +
> +enum arm_smmu_s2cr_privcfg {
> +	S2CR_PRIVCFG_DEFAULT,
> +	S2CR_PRIVCFG_DIPAN,
> +	S2CR_PRIVCFG_UNPRIV,
> +	S2CR_PRIVCFG_PRIV,
> +};
> +
> +struct arm_smmu_s2cr {
> +	enum arm_smmu_s2cr_type		type;
> +	enum arm_smmu_s2cr_privcfg	privcfg;
> +	u8				cbndx;
> +};
> +
> +struct arm_smmu_smr {
> +	u16				mask;
> +	u16				id;
> +	bool				valid;
> +};
> +
> +enum arm_smmu_context_fmt {
> +	ARM_SMMU_CTX_FMT_NONE,
> +	ARM_SMMU_CTX_FMT_AARCH64,
> +	ARM_SMMU_CTX_FMT_AARCH32_L,
> +	ARM_SMMU_CTX_FMT_AARCH32_S,
> +};
> +
> +struct arm_smmu_cfg {
> +	u8				cbndx;
> +	u8				irptndx;
> +	union {
> +		u16			asid;
> +		u16			vmid;
> +	};
> +	u32				cbar;
> +	enum arm_smmu_context_fmt	fmt;
> +};
> +struct arm_smmu_cb {
> +	u64				ttbr[2];
> +	u32				tcr[2];
> +	u32				mair[2];
> +	struct arm_smmu_cfg		*cfg;
> +};
> +
> +struct arm_smmu_device {
> +	void	*base;
> +	void	*cb_base;
> +	u32	num_masters;
> +	unsigned long			pgshift;
> +	u32				features;
> +	u32				options;
> +	u32				num_context_banks;
> +	u32				num_s2_context_banks;
> +	struct arm_smmu_cb		*cbs;
> +	u32				num_mapping_groups;
> +	u16				streamid_mask;
> +	u16				arm_sid_mask;
> +	u16				smr_mask_mask;
> +	struct arm_smmu_smr		*smrs;
> +	struct arm_smmu_s2cr		*s2crs;
> +	struct arm_smmu_cfg		*cfgs;
> +	unsigned long			va_size;
> +	unsigned long			ipa_size;
> +	unsigned long			pa_size;
> +	unsigned long			pgsize_bitmap;
> +	u32				num_global_irqs;
> +	u32				num_context_irqs;
> +	unsigned int			*irqs;
> +} smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
> +
> +static unsigned long pgsize_bitmap = -1;
> +
> +static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
> +{
> +	struct arm_smmu_smr *smr = smmu->smrs + idx;
> +	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
> +
> +	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
> +		reg |= SMR_VALID;
> +	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
> +}
> +
> +static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
> +{
> +	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
> +	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
> +		  S2CR_PRIVCFG(s2cr->privcfg);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
> +	    smmu->smrs[idx].valid)
> +		reg |= S2CR_EXIDVALID;
> +	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
> +}
> +
> +static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
> +{
> +	if (smmu->smrs)
> +		arm_smmu_write_smr(smmu, idx);
> +
> +	arm_smmu_write_s2cr(smmu, idx);
> +}
> +
> +/* Wait for any pending TLB invalidations to complete */
> +static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
> +				void *sync, void *status)
> +{
> +	unsigned int spin_cnt, delay, i;
> +
> +	mmio_write32(sync, 0);
> +	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> +		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> +			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
> +				return 0;
> +			cpu_relax();
> +		}
> +		for (i = 0; i < 10 * 1000000; i++);
> +	}
> +	printk("TLB sync timed out -- SMMU may be deadlocked\n");
> +
> +	return trace_error(-EINVAL);
> +}
> +
> +static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +	void *base = ARM_SMMU_GR0(smmu);
> +
> +	ret = __arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
> +			    base + ARM_SMMU_GR0_sTLBGSTATUS);
> +
> +	return ret;
> +}
> +
> +static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
> +				       struct arm_smmu_cfg *cfg,
> +				       struct cell *cell)
> +{
> +	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
> +	struct paging_structures *pg_structs;
> +	unsigned long cell_table;
> +	u32 reg;
> +
> +	cb->cfg = cfg;
> +
> +	/* VTCR */
> +	reg = ARM_64_LPAE_S2_TCR_RES1 |
> +	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
> +	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
> +	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
> +
> +	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		reg |= ARM_LPAE_TCR_TG0_4K;
> +		break;
> +	case SZ_64K:
> +		reg |= ARM_LPAE_TCR_TG0_64K;
> +		break;
> +	}
> +
> +	switch (smmu->pa_size) {
> +	case 32:
> +		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 36:
> +		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 40:
> +		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 42:
> +		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 44:
> +		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 48:
> +		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	case 52:
> +		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
> +		break;
> +	default:
> +		printk("Not supported\n");
> +		break;
> +		/* TODO */
> +		//goto out_free_data;
> +	}
> +
> +	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
> +
> +	cb->tcr[0] = reg;
> +
> +	pg_structs = &cell->arch.mm;
> +	cell_table = paging_hvirt2phys(pg_structs->root_table);
> +	u64 vttbr = 0;
> +
> +	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
> +	vttbr |= (u64)(cell_table & TTBR_MASK);
> +	cb->ttbr[0] = vttbr;
> +}
> +
> +static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> +{
> +	void *cb_base, *gr1_base;
> +	struct arm_smmu_cb *cb = &smmu->cbs[idx];
> +	struct arm_smmu_cfg *cfg = cb->cfg;
> +	u32 reg;
> +
> +	cb_base = ARM_SMMU_CB(smmu, idx);
> +
> +	/* Unassigned context banks only need disabling */
> +	if (!cfg) {
> +		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
> +		return;
> +	}
> +
> +	gr1_base = ARM_SMMU_GR1(smmu);
> +
> +	/* CBA2R */
> +	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
> +		reg = CBA2R_RW64_64BIT;
> +	else
> +		reg = CBA2R_RW64_32BIT;
> +	/* 16-bit VMIDs live in CBA2R */
> +	if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +		reg |= cfg->vmid << CBA2R_VMID_SHIFT;
> +
> +	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
> +
> +	/* CBAR */
> +	reg = cfg->cbar;
> +
> +	/*
> +	 * Use the weakest shareability/memory types, so they are
> +	 * overridden by the ttbcr/pte.
> +	 */
> +	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
> +		/* 8-bit VMIDs live in CBAR */
> +		reg |= cfg->vmid << CBAR_VMID_SHIFT;
> +	}
> +	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
> +
> +	/*
> +	 * TTBCR
> +	 * We must write this before the TTBRs, since it determines the
> +	 * access behaviour of some fields (in particular, ASID[15:8]).
> +	 */
> +	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
> +
> +	/* TTBRs */
> +	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
> +		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
> +		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
> +	} else {
> +		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
> +	}
> +
> +	/* SCTLR */
> +	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
> +		SCTLR_M;
> +
> +	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
> +}
> +
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +{
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	int i, ret;
> +	u32 reg, major;
> +
> +	/* Clear global FSR */
> +	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
> +	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
> +
> +	/*
> +	 * Reset stream mapping groups: Initial values mark all SMRn as
> +	 * invalid and all S2CRn as bypass unless overridden.
> +	 */
> +	for (i = 0; i < smmu->num_mapping_groups; ++i)
> +		arm_smmu_write_sme(smmu, i);
> +
> +	/*
> +	 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
> +	 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
> +	 * bit is only present in MMU-500r2 onwards.
> +	 */
> +	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
> +	major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
> +	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
> +	if (major >= 2)
> +		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
> +	/*
> +	 * Allow unmatched Stream IDs to allocate bypass
> +	 * TLB entries for reduced latency.
> +	 */
> +	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
> +
> +	/* Make sure all context banks are disabled and clear CB_FSR */
> +	for (i = 0; i < smmu->num_context_banks; ++i) {
> +		void *cb_base = ARM_SMMU_CB(smmu, i);
> +
> +		arm_smmu_write_context_bank(smmu, i);
> +		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
> +		/*
> +		 * Disable MMU-500's not-particularly-beneficial next-page
> +		 * prefetcher for the sake of errata #841119 and #826419.
> +		 */
> +		reg = mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
> +		reg &= ~ARM_MMU500_ACTLR_CPRE;
> +		mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
> +	}
> +
> +	/* Invalidate the TLB, just in case */
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
> +
> +	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
> +
> +	/* Enable fault reporting */
> +	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
> +
> +	/* Disable TLB broadcasting. */
> +	reg |= (sCR0_VMIDPNE | sCR0_PTM);
> +
> +	/* Enable client access, handling unmatched streams as appropriate */
> +	reg &= ~sCR0_CLIENTPD;
> +	reg &= ~sCR0_USFCFG;
> +
> +	/* Disable forced broadcasting */
> +	reg &= ~sCR0_FB;
> +
> +	/* Don't upgrade barriers */
> +	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_VMID16)
> +		reg |= sCR0_VMID16EN;
> +
> +	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
> +		reg |= sCR0_EXIDENABLE;
> +
> +	/* Push the button */
> +	ret = arm_smmu_tlb_sync_global(smmu);
> +	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
> +
> +	return ret;
> +}
> +
> +static int arm_smmu_id_size_to_bits(int size)
> +{
> +	switch (size) {
> +	case 0:
> +		return 32;
> +	case 1:
> +		return 36;
> +	case 2:
> +		return 40;
> +	case 3:
> +		return 42;
> +	case 4:
> +		return 44;
> +	case 5:
> +	default:
> +		return 48;
> +	}
> +}
> +
> +static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	u32 id;
> +	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
> +	unsigned long size;
> +	int i;
> +
> +	printk("probing hardware configuration...\n");
> +	printk("ARM MMU500 with:\n");
> +
> +	/* ID0 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
> +
> +	/* Only stage 2 translation is supported */
> +	id &= ~(ID0_S1TS | ID0_NTS);
> +
> +	if (id & ID0_S2TS) {
> +		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
> +		printk("\tStage 2 translation\n");
> +	}
> +
> +	if (!(smmu->features &
> +		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
> +		printk("\tNo translation support!\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * In order for DMA API calls to work properly, we must defer to what
> +	 * the FW says about coherency, regardless of what the hardware claims.
> +	 * Fortunately, this also opens up a workaround for systems where the
> +	 * ID register value has ended up configured incorrectly.
> +	 */
> +	cttw_reg = !!(id & ID0_CTTW);
> +	if (cttw_fw || cttw_reg)
> +		printk("\t%scoherent translation table walks\n", cttw_fw ? "" : "non-");
> +	if (cttw_fw != cttw_reg)
> +		printk("\t(IDR0.CTTW is overridden by FW configuration)\n");
> +
> +	/* Max number of entries we have for stream matching/indexing */
> +	if (id & ID0_EXIDS) {
> +		smmu->features |= ARM_SMMU_FEAT_EXIDS;
> +		size = 1 << 16;
> +	} else {
> +		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
> +	}
> +	smmu->streamid_mask = size - 1;
> +
> +	if (id & ID0_SMS) {
> +		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
> +
> +		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
> +		if (size == 0) {
> +			printk("Stream matching is supported, but no SMRs present!\n");
> +			return -ENODEV;
> +		}
> +
> +		/* Zero-initialised to mark as invalid */
> +		smmu->smrs = page_alloc(&mem_pool, PAGES(size * sizeof(*smmu->smrs)));
> +		if (!smmu->smrs)
> +			return -ENOMEM;
> +		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
> +
> +		printk("\tstream matching with %lu SMR groups", size);
> +	}
> +
> +	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs)
> +				 + sizeof(*smmu->cfgs))));
> +	if (!smmu->s2crs) {
> +		page_free(&mem_pool, smmu->smrs, PAGES(size * sizeof(*smmu->smrs)));

No need to free: This is called from arm_smmu_init() only, and that 
function does not have to perform releases on error because the 
hypervisor will not start up at all.

> +		return -ENOMEM;
> +	}
> +
> +	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
> +
> +	/* Configure to Bypass mode */
> +	for (i = 0; i < size; i++)
> +		smmu->s2crs[i] = s2cr_init_val;
> +
> +	smmu->num_mapping_groups = size;
> +
> +	if (!(id & ID0_PTFS_NO_AARCH32)) {
> +		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
> +		if (!(id & ID0_PTFS_NO_AARCH32S))
> +			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
> +	}
> +
> +	/* ID1 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
> +	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
> +
> +	/* Check for size mismatch of SMMU address space from mapped region */
> +	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
> +	size <<= smmu->pgshift;
> +	if (smmu->cb_base != gr0_base + size)
> +		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
> +		       size * 2, (smmu->cb_base - gr0_base) * 2);
> +
> +	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
> +	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
> +	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
> +		printk("Impossible number of S2 context banks!\n");
> +		return -ENODEV;
> +	}
> +	/* TODO Check More */
> +	smmu->num_context_irqs = smmu->num_context_banks;
> +
> +	printk("\t%u context banks (%u Stage 2 only)\n",
> +	       smmu->num_context_banks, smmu->num_s2_context_banks);
> +
> +	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
> +			       * sizeof(*smmu->cbs)));
> +	if (!smmu->cbs) {
> +		/* TODO: Free smrs s2cr */

See above.

> +		return -ENOMEM;
> +	}
> +
> +	/* ID2 */
> +	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
> +	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
> +	smmu->ipa_size = MIN(size, get_cpu_parange());
> +
> +	/* The output mask is also applied for bypass */
> +	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
> +	smmu->pa_size = size;
> +
> +	if (id & ID2_VMID16)
> +		smmu->features |= ARM_SMMU_FEAT_VMID16;
> +
> +	/*
> +	 * What the page table walker can address actually depends on which
> +	 * descriptor format is in use, but since a) we don't know that yet,
> +	 * and b) it can vary per context bank, this will have to do...
> +	 * TODO: DMA?
> +	 */
> +
> +	size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
> +	smmu->va_size = arm_smmu_id_size_to_bits(size);
> +	if (id & ID2_PTFS_4K)
> +		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
> +	if (id & ID2_PTFS_16K)
> +		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
> +	if (id & ID2_PTFS_64K)
> +		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
> +
> +	/* Now we've corralled the various formats, what'll it do? */
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
> +		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
> +	if (smmu->features &
> +	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
> +		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
> +	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
> +		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
> +
> +	if (pgsize_bitmap == -1UL)
> +		pgsize_bitmap = smmu->pgsize_bitmap;
> +	else
> +		pgsize_bitmap |= smmu->pgsize_bitmap;
> +	printk("\tsupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
> +		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
> +		       smmu->va_size, smmu->ipa_size);
> +
> +	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
> +		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
> +		       smmu->ipa_size, smmu->pa_size);
> +
> +	return 0;
> +}
> +
> +static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
> +{
> +	void *gr0_base = ARM_SMMU_GR0(smmu);
> +	u32 smr;
> +
> +	if (!smmu->smrs)
> +		return;
> +
> +	/*
> +	 * SMR.ID bits may not be preserved if the corresponding MASK
> +	 * bits are set, so check each one separately. We can reject
> +	 * masters later if they try to claim IDs outside these masks.
> +	 */
> +	smr = smmu->streamid_mask << SMR_ID_SHIFT;
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
> +
> +	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
> +	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
> +	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
> +	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
> +}
> +
> +static int arm_smmu_find_sme(u16 id, u16 mask, int n)
> +{
> +	struct arm_smmu_device *smmu = &smmu_device[n];
> +	struct arm_smmu_smr *smrs = smmu->smrs;
> +	int i, free_idx = -EINVAL;
> +
> +	/* Stream indexing is blissfully easy */
> +	if (!smrs)
> +		return id;
> +
> +	/* Validating SMRs is... less so */
> +	for (i = 0; i < smmu->num_mapping_groups; ++i) {
> +		if (!smrs[i].valid) {
> +			/*
> +			 * Note the first free entry we come across, which
> +			 * we'll claim in the end if nothing else matches.
> +			 */
> +			if (free_idx < 0)
> +				free_idx = i;
> +			continue;
> +		}
> +		/*
> +		 * If the new entry is _entirely_ matched by an existing entry,
> +		 * then reuse that, with the guarantee that there also cannot
> +		 * be any subsequent conflicting entries. In normal use we'd
> +		 * expect simply identical entries for this case, but there's
> +		 * no harm in accommodating the generalisation.
> +		 */
> +		if ((mask & smrs[i].mask) == mask &&
> +		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
> +			return i;
> +		}
> +		/*
> +		 * If the new entry has any other overlap with an existing one,
> +		 * though, then there always exists at least one stream ID
> +		 * which would cause a conflict, and we can't allow that risk.
> +		 */
> +		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
> +			return -EINVAL;
> +	}
> +
> +	return free_idx;
> +}
> +
> +static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
> +{
> +	smmu->s2crs[idx] = s2cr_init_val;
> +	if (smmu->smrs) {
> +		smmu->smrs[idx].id = 0;
> +		smmu->smrs[idx].mask = 0;
> +		smmu->smrs[idx].valid = false;
> +	}
> +
> +	return true;
> +}
> +
> +#define for_each_smmu_sid(sid, config, counter)				\
> +	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
> +	     (counter) < (config)->num_stream_ids;			\
> +	     (sid)++, (counter)++)
> +
> +static int arm_smmu_cell_init(struct cell *cell)
> +{
> +	struct jailhouse_iommu *iommu;
> +	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
> +	struct arm_smmu_s2cr *s2cr;
> +	struct arm_smmu_cfg *cfg;
> +	struct arm_smmu_smr *smr;
> +	const __u32 *sid;
> +	unsigned int n;
> +	int ret, idx, i;
> +
> +	if (!iommu_count_units())
> +		return 0;
> +
> +	/* If no sids, ignore */
> +	if (!cell->config->num_stream_ids)
> +		return 0;
> +
> +	iommu = &system_config->platform_info.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
> +			continue;
> +
> +		s2cr = smmu_device[i].s2crs;
> +		cfg = &smmu_device[i].cfgs[cell->config->id];
> +
> +		if (smmu_device[i].features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
> +					       ARM_SMMU_FEAT_FMT_AARCH64_16K |
> +					       ARM_SMMU_FEAT_FMT_AARCH64_4K))
> +			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
> +
> +		cfg->cbar = CBAR_TYPE_S2_TRANS;
> +
> +		/* We use cell->config->id here, one cell use one context */
> +		cfg->cbndx = cell->config->id;
> +		cfg->irptndx = cfg->cbndx;
> +		cfg->vmid = cfg->cbndx + 1;
> +
> +		arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
> +		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
> +
> +		smr = smmu_device[i].smrs;
> +
> +		for_each_smmu_sid(sid, cell->config, n) {
> +			ret = arm_smmu_find_sme(*sid,
> +						smmu_device[i].arm_sid_mask, i);
> +			if (ret < 0)
> +				printk("arm_smmu_find_sme error %d\n", ret);

It's still a bug to not bail out on error. We will use a negative ret as 
idx and crash.

> +			idx = ret;
> +
> +			if (type == s2cr[idx].type &&
> +			    cfg->cbndx == s2cr[idx].cbndx)
> +				printk("%s error\n", __func__);

No error handling.

> +
> +			s2cr[idx].type = type;
> +			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
> +			s2cr[idx].cbndx = cfg->cbndx;
> +
> +			arm_smmu_write_s2cr(&smmu_device[i], idx);
> +
> +			smr[idx].id = *sid;
> +			smr[idx].mask = smmu_device[i].arm_sid_mask;
> +			smr[idx].valid = true;
> +
> +			arm_smmu_write_smr(&smmu_device[i], idx);
> +		}
> +
> +		printk("Found %d masters\n", n);
> +
> +		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
> +			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
> +		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
> +		if (ret < 0) {
> +			printk("TLB maintenance operations globally across the SMMU failed!\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void arm_smmu_cell_exit(struct cell *cell)
> +{
> +	const __u32 *sid;
> +	unsigned int n;
> +	int ret, idx, i;
> +	int cbndx = cell->config->id;
> +	struct jailhouse_iommu *iommu;
> +
> +	if (!iommu_count_units())
> +		return;
> +
> +	/* If no sids, ignore */
> +	if (!cell->config->num_stream_ids)
> +		return;
> +
> +	iommu = &system_config->platform_info.iommu_units[0];
> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
> +			continue;
> +
> +		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) + ARM_SMMU_GR0_TLBIVMID,
> +					  smmu_device[i].cbs[cbndx].cfg->vmid);
> +		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
> +		if (ret < 0)
> +			printk("TLB maintenance operations globally across the SMMU failed!\n");
> +
> +		for_each_smmu_sid(sid, cell->config, n) {
> +			ret = arm_smmu_find_sme(*sid,
> +						smmu_device[i].arm_sid_mask, i);
> +			if (ret < 0)
> +				printk("arm_smmu_find_sme error %d\n", ret);
> +			idx = ret;
> +
> +			if (arm_smmu_free_sme(&smmu_device[i], idx))
> +				arm_smmu_write_sme(&smmu_device[i], idx);
> +
> +			smmu_device[i].cbs[cbndx].cfg = NULL;
> +			arm_smmu_write_context_bank(&smmu_device[i], cbndx);
> +		}
> +	}
> +}
> +
> +static int arm_smmu_init(void)
> +{
> +	struct jailhouse_iommu *iommu;
> +	int err, i, num = 0;
> +
> +	iommu = &system_config->platform_info.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
> +			continue;
> +
> +		if (iommu->base) {
> +			num++;
> +
> +			smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
> +			smmu_device[i].arm_sid_mask = iommu->arm_sid_mask;
> +
> +			smmu_device[i].base = paging_map_device(iommu->base,
> +								iommu->size);
> +			if (!smmu_device[i].base)
> +				return -ENOMEM;
> +
> +			smmu_device[i].cb_base = smmu_device[i].base +
> +						 iommu->size / 2;
> +
> +			err = arm_smmu_device_cfg_probe(&smmu_device[i]);
> +			if (err)
> +				return err;
> +
> +			if (smmu_device[i].num_context_banks !=
> +			    smmu_device[i].num_context_irqs) {
> +				printk("found only %d context interrupt(s) but %d required\n",
> +				       smmu_device[i].num_context_irqs,
> +				       smmu_device[i].num_context_banks);
> +				/* TODO: page free smr s2cr cbs */

I think I commented on this before: There are no interrupts in 
Jailhouse, there should be no need for this parity then, no?

> +				return -ENODEV;
> +			}
> +
> +			/* TODO: request irq */

There are no IRQs under Jailhouse. They are off while the hypervisor is 
running. So this comment is misleading.

What do we miss then when not having the asynchronous notification?

> +
> +			err = arm_smmu_device_reset(&smmu_device[i]);
> +			if (err)
> +				return err;
> +
> +			arm_smmu_test_smr_masks(&smmu_device[i]);
> +		}
> +	}
> +
> +	if (num == 0) {
> +		printk("No MMU-500 device found!\n");

I think I stated that earlier: Skip this, it will print on every 
platform that has no MMU-500 *configured*.

> +		return 0;
> +	}
> +
> +	/*
> +	 * For ACPI and generic DT bindings, an SMMU will be probed before
> +	 * any device which might need it, so we want the bus ops in place
> +	 * ready to handle default domain setup as soon as any SMMU exists.
> +	 */

That comment makes no sense for us, does it? There is no ACPI or DT in 
Jailhouse itself.

> +	/* TODO: How handle PCI iommu? */

How about that? Do we miss a feature? Splitting up PCI devices on the 
same host contoller? Or how should this be interpreted?

> +
> +	return arm_smmu_cell_init(&root_cell);
> +}
> +
> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
> +DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
> +DEFINE_UNIT(arm_smmu, "ARM SMMU");
> 

My comments are getting less, but I don't think I found anything new.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/243bf17f-1b11-64f0-5e7d-a1928d0dd61e%40siemens.com.
