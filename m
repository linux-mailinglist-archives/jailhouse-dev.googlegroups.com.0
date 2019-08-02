Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCHCSHVAKGQETCNGLMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF377FF71
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 19:21:13 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id o13sf47422801edt.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 10:21:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564766472; cv=pass;
        d=google.com; s=arc-20160816;
        b=aCzQgY1lLJW6dmmNHpNbujsyAQpizYcK3I0XF/Q2Z3ZzEk6UiFbSSi4ci10+qdFvp9
         4WLvQRB+OPfa8COjYrsxd+3ps1Vs+sup4WoQfyMmhnhvqoG6wtJURknlFzTQxJkojJzR
         mEVOWohmPu++630hnMNFgzeQ++/5HAW7Kne72RGCWSZ9JWxP9uzep6LjsesCf1VRqPd7
         nCk4cqVPHHBdm4FgA77eAL6HSspg6dN5tCYjbWdj7jAV5E2e2BaPgzCl49ISh4P5wAzd
         DalHyexv7wPezZR3A7OIXdEA6Whg74cl/7JigT8QuEa5naQGLrxKZVgQQ9+5dX6p9jUC
         MF5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=S6iS/6iuLi1AlMHv0LpJP+SJMbueMHq3yu7RW77Vk2s=;
        b=bkzsaXHmKz8QMsVGA54zyAyvqMEQTkiuuAkykA6vzc+VmOzFZ8LhKNe+18aDxhxdO5
         c0s+5LB//j+thBtAGKZ1XuqkjwEm8IJzS995NgVgtlwagvDgaR5ucsVD9iG/PwK9sc1x
         o3/5zfX0HNgET27DktKMfSZqe4Sy285zKLYLpIn4FYRXAsO0vvxsIyDwQVXBJyBel4a7
         cOlRDncu1dl8UzTegNMpIfdd4O4a527zlCts+fNYmlDHFlEC4Ni87oImF0j+8ZiUPgK+
         3uJURznG3Lfp6XGlB22Fb3WsZKK57bEgJ2NkYkRt76S/2ZZTWalrGhRnMFr/J64DIl+H
         izMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S6iS/6iuLi1AlMHv0LpJP+SJMbueMHq3yu7RW77Vk2s=;
        b=MNRCrJcjTAGdCpU+TW3JRbkhfkG3Fdg6nbTxWVW+ga/+qf9qZ1agNAgMmAdtW5MjX2
         93wVWiP+TFx+1seixYGJWkiBCD6n632cyHvgIR0siISmq9XbQTnDl1I/Wynmgz9MJWfS
         ZWAUDViJq0Hv3PmNxsq2o/bgZbsisCqHgYUt4XvJuxH/ZqwP1yixdurHhiRdhHot1dR5
         q/MWqZphFL3ilMzrpijyMJaV+eCLzGg0s/MkFQUXXQDYuwK1wxezwMJfn9rSkkrIx4Ye
         048NlPnyv5kLnHyRxNKYB68equzb0OhDEnqHze1ugzbQSKkTb/HHpG/6XN0jjquJI31T
         9Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S6iS/6iuLi1AlMHv0LpJP+SJMbueMHq3yu7RW77Vk2s=;
        b=MGFFDR+6V2XvTPkxKdJ6Ydv9c0FVSwArz1C9IsbqQo18lk8u5zX+63k4m2KZTdU9VE
         gAmCD7JP1c2DJrYuCdvSv1yiM8n9Fcc/wVqT7vLbQndEodMKnBjycbkHDLHE4pDo7GuN
         byf7UM+nPoynNCeGSi4unnFXKajqXn70U4mqbpcYUnGSsIkeJIHtbJ+mgzxfhnEnajcA
         bL5R2Wjex4mW174JKNWJNFqehFn+64ttJEjfX2ZWHq2aDg+wJUfxkpzlLdG/HjdB/gjL
         360quipX9OG8FneGkdqREg1KP0+amSZ+oC/fgLdfh6ur74YQvkR2IdZn33T2w0ghE1Qn
         V/JQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXYEZ5bvWEAPHBVqZyBwA4Qmw9+bIvdhAZAnQd9r7BsvGc9UYTK
	ocziLWxNMUDfUpeNw/1xtGY=
X-Google-Smtp-Source: APXvYqykV0grUHlxdQNCLMAW/XS7HfJwQXh7EZvpeE3SyUoLS1qbNUFIHl3SA5mCARAgVm7CCwqadg==
X-Received: by 2002:a50:aa14:: with SMTP id o20mr121174037edc.165.1564766472706;
        Fri, 02 Aug 2019 10:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8975:: with SMTP id f50ls18924731edf.0.gmail; Fri, 02
 Aug 2019 10:21:12 -0700 (PDT)
X-Received: by 2002:a50:e885:: with SMTP id f5mr48390224edn.188.1564766472060;
        Fri, 02 Aug 2019 10:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564766472; cv=none;
        d=google.com; s=arc-20160816;
        b=ETPReKqj9iEpPMU7XnX++pPi3MPQJFYsdWpCz4dB6J0zp/h4V7hQ5TNe2HrHLxn/m3
         M1skIyTOIFwISUgBQXuOcxDts5i3ojw3ere/2AajBNBrxnbLxap0QWjYGMhLeHtyVONc
         kbeFJleLTYzLka5DlVoZ8ZlYxDf626H9GGlEcAEscETgjLvjgt4uCDsrQl+BEWN3+I8l
         2Q1lfLTr9MDJCA1qk48EK8nGdWUP853QOpW+DMf2KFL/ybEkk8u6W2m2X+PZxyFGY71n
         A3ZvzirWwqXGGWzeyaL71Z1O3kZbE456eRCouBypdFXMtDisz6J0knOKfxfMgpb23sgI
         vQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vE9O5cwomW6Aa9L2C3o2KZyGXlRBlQ/DT4HgVcJhrAs=;
        b=EuKuIfcwrhIE9mytcnyc35zI25lZadz63ZxfLoG+iSu/Js8d/LiBfVcu5fAHTrHv+U
         ynhLXf15SdQjUAq7LL4TAI86Y6gStUWVQ4SqXWPuzD07onDMRdKjrxDMWqF3+oPBbp24
         eidd1B6RT+USSvHeWoF4x1PSBU/2sjIn1FFj3KbIOFULMCt6zogJmYbS5MXLbGgr6K+V
         K2xZr2K5Obs6FcV7c6fV5rIWLXCayijNv6LeZZNVzNchBVTn9mUnlciU554Gti/iSvQ5
         MRO6M/HJ09+MIQmOK6DkBBqCLJV+xKvTGnTMLHnGABBQ0/QXUa0DKmWhkgOxUvG8ika1
         4Gag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k51si2574872edd.0.2019.08.02.10.21.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 10:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x72HLBLd016699
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2019 19:21:11 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x72HLAES027341;
	Fri, 2 Aug 2019 19:21:11 +0200
Subject: Re: [PATCH v4 6/6] arm64: iommu: smmu-v3: Add support for stage 1
 translations
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113553.7509-1-lokeshvutla@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <15b6eacb-a0c5-0f3b-1ec2-950e33859b53@siemens.com>
Date: Fri, 2 Aug 2019 19:21:10 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190801113553.7509-1-lokeshvutla@ti.com>
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

On 01.08.19 13:35, Lokesh Vutla wrote:
> From: Pratyush Yadav <p-yadav1@ti.com>
> 
> An emulated SMMU is presented to inmates by trapping access to the MMIO
> registers to enable stage 1 translations.  Accesses to the SMMU memory
> mapped registers are trapped and then routed to the emulated SMMU. This
> is not emulation in the sense that we fully emulate the device top to
> bottom. The emulation is used to provide an interface to the SMMU that
> the hypervisor can control to make sure the inmates are not doing
> anything they should not. The actual translations are done by hardware.
> 
> Emulation is needed because both stage 1 and stage 2 parameters are
> configured in a single data structure, the stream table entry. For this
> reason, the inmates can't be allowed to directly control the stream
> table entries, and by extension, the stream table and command queue.
> 
> Work left to do:
> - Route event notifications to the correct cell and identify which event
>   needs to go to which cell.
> - Add support for IRQ and MSI routing.
> - Add support for PRI queues and ATS.
> - Identify which cell caused a command queue error and notify it.
> - Support sub-streams.
> 
> A lot of the work left is optional features that the SMMU provides like
> substreams, ATS, PRI. There is little reason to add them unless there is
> a use case for them.
> 
> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  hypervisor/arch/arm-common/include/asm/cell.h |   4 +
>  .../arch/arm-common/include/asm/iommu.h       |   4 +
>  hypervisor/arch/arm-common/iommu.c            |   3 +
>  hypervisor/arch/arm64/smmu-v3.c               | 870 ++++++++++++++++++
>  4 files changed, 881 insertions(+)
> 
> diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
> index 5b1e4207..4eae91d8 100644
> --- a/hypervisor/arch/arm-common/include/asm/cell.h
> +++ b/hypervisor/arch/arm-common/include/asm/cell.h
> @@ -19,6 +19,10 @@ struct arch_cell {
>  	struct paging_structures mm;
>  
>  	u32 irq_bitmap[1024/32];
> +
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	struct arm_smmu_state *smmu_states;
> +#endif
>  };
>  
>  #endif /* !_JAILHOUSE_ASM_CELL_H */
> diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
> index 9f3e8790..98f99ea6 100644
> --- a/hypervisor/arch/arm-common/include/asm/iommu.h
> +++ b/hypervisor/arch/arm-common/include/asm/iommu.h
> @@ -23,6 +23,10 @@
>  	     (counter) < (config)->num_stream_ids;			       \
>  	     (sid) = (jailhouse_cell_stream_ids(config)[++(counter)]))
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +void arm_smmuv3_iommu_config_commit(struct cell *cell);
> +#endif
> +
>  unsigned int iommu_count_units(void);
>  int iommu_map_memory_region(struct cell *cell,
>  			    const struct jailhouse_memory *mem);
> diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
> index cb6fd032..60018232 100644
> --- a/hypervisor/arch/arm-common/iommu.c
> +++ b/hypervisor/arch/arm-common/iommu.c
> @@ -41,4 +41,7 @@ int iommu_unmap_memory_region(struct cell *cell,
>  
>  void iommu_config_commit(struct cell *cell)
>  {
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	arm_smmuv3_iommu_config_commit(cell);
> +#endif /* CONFIG_SMMUV3_STAGE1 */
>  }
> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
> index d7e54350..e53b31ef 100644
> --- a/hypervisor/arch/arm64/smmu-v3.c
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -365,6 +365,30 @@ struct arm_smmu_strtab_cfg {
>  	u32				strtab_base_cfg;
>  };
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +struct arm_smmu_state {
> +	struct arm_smmu_device 		*smmu;
> +	u32 				idr[6];
> +	u32 				cr[3];
> +	u32 				cr0ack;
> +	u32				strtab_base_cfg;
> +	u64				strtab_base;
> +	u64				cmdq_base;
> +	u32				cmdq_prod;
> +	u32				cmdq_cons;
> +	u64				evtq_base;
> +	u32				evtq_prod;
> +	u32				evtq_cons;
> +	u32				gerror;
> +	u32				gerrorn;
> +	u32				irq_ctrl;
> +	u32				irq_ctrlack;
> +	u64				gerror_irq_cfg0;
> +	u64				evtq_irq_cfg0;
> +	/* Not all registers included. Add more as needed. */
> +};
> +#endif /* CONFIG_SMMUV3_STAGE1 */
> +
>  /* An SMMUv3 instance */
>  struct arm_smmu_device {
>  	void				*base;
> @@ -375,6 +399,10 @@ struct arm_smmu_device {
>  	struct arm_smmu_strtab_cfg	strtab_cfg;
>  } smmu[JAILHOUSE_MAX_IOMMU_UNITS];
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +static struct arm_smmu_state state_dump[JAILHOUSE_MAX_IOMMU_UNITS];
> +#endif
> +
>  /* Low-level queue manipulation functions */
>  static bool queue_full(struct arm_smmu_queue *q)
>  {
> @@ -587,6 +615,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
>  {
>  	struct paging_structures *pg_structs = &this_cell()->arch.mm;
>  	u64 val, vttbr;
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	u64 mask;
> +#endif
>  
>  	val = 0;
>  
> @@ -604,6 +635,23 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
>  		return;
>  	}
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	dst[0] = 0;
> +	dsb(ishst);
> +	arm_smmu_sync_ste_for_sid(smmu, sid);
> +
> +	if (guest_ste != NULL) {
> +		if (FIELD_GET(STRTAB_STE_0_S1CDMAX, guest_ste[0]) != 0)
> +			printk("WARN: SMMU sub-streams not supported\n");
> +
> +		val = guest_ste[0];
> +
> +		mask = STRTAB_STE_1_S1COR | STRTAB_STE_1_S1DSS |
> +		       STRTAB_STE_1_S1CSH | STRTAB_STE_1_S1CIR;
> +		dst[1] = guest_ste[1] & mask;
> +	}
> +#endif /* CONFIG_SMMUV3_STAGE1 */
> +
>  	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
>  		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
>  		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
> @@ -1051,11 +1099,744 @@ static void arm_smmu_uninit_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
>  		arm_smmu_uninit_l2_strtab(smmu, sid);
>  }
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +static void arm_smmu_dump_state(struct arm_smmu_state *state,
> +				struct arm_smmu_device *smmu)
> +{
> +	state->smmu = smmu;
> +
> +	state->idr[0] = mmio_read32(smmu->base + ARM_SMMU_IDR0);
> +	state->idr[1] = mmio_read32(smmu->base + ARM_SMMU_IDR1);
> +	state->idr[2] = mmio_read32(smmu->base + ARM_SMMU_IDR2);
> +	state->idr[3] = mmio_read32(smmu->base + ARM_SMMU_IDR3);
> +	state->idr[4] = mmio_read32(smmu->base + ARM_SMMU_IDR4);
> +	state->idr[5] = mmio_read32(smmu->base + ARM_SMMU_IDR5);
> +
> +	state->cr[0] = mmio_read32(smmu->base + ARM_SMMU_CR0);
> +	state->cr[1] = mmio_read32(smmu->base + ARM_SMMU_CR1);
> +	state->cr[2] = mmio_read32(smmu->base + ARM_SMMU_CR2);
> +	state->cr0ack = mmio_read32(smmu->base + ARM_SMMU_CR0ACK);
> +
> +	state->strtab_base = mmio_read64(smmu->base + ARM_SMMU_STRTAB_BASE);
> +	state->strtab_base_cfg = mmio_read32(smmu->base +
> +					     ARM_SMMU_STRTAB_BASE_CFG);
> +	state->cmdq_base = mmio_read64(smmu->base + ARM_SMMU_CMDQ_BASE);
> +	state->cmdq_prod = mmio_read32(smmu->base + ARM_SMMU_CMDQ_PROD);
> +	state->cmdq_cons = mmio_read32(smmu->base + ARM_SMMU_CMDQ_CONS);
> +
> +	state->evtq_base = mmio_read64(smmu->base + ARM_SMMU_EVTQ_BASE);
> +	state->evtq_prod = mmio_read32(smmu->base + ARM_SMMU_EVTQ_PROD);
> +	state->evtq_cons = mmio_read32(smmu->base + ARM_SMMU_EVTQ_CONS);
> +}
> +
> +static bool arm_smmu_cell_can_access_sid(struct cell *cell, u32 sid)
> +{
> +	int i;
> +	u32 config_sid;
> +
> +	for_each_stream_id(config_sid, cell->config, i)
> +		if (config_sid == sid)
> +			return true;
> +
> +	panic_printk("FATAL: Cell %u trying to access stream ID %u. Access denied.\n",
> +		     cell->config->id, sid);
> +	return false;
> +}
> +
> +static int arm_smmu_state_init(struct arm_smmu_state *state,
> +			       struct arm_smmu_device *smmu)
> +{
> +	u32 reg;
> +
> +	state->smmu = smmu;
> +
> +	reg = mmio_read32(smmu->base + ARM_SMMU_IDR0);
> +	/* Tell guests stage 2 is not supported. */
> +	reg = FIELD_CLEAR(IDR0_S2P, reg);
> +	/* ATOS, VATOS, PRI, ATS, HTTU, MSI not supported yet. */
> +	reg = FIELD_CLEAR(IDR0_ATOS, reg);
> +	reg = FIELD_CLEAR(IDR0_VATOS, reg);
> +	reg = FIELD_CLEAR(IDR0_PRI, reg);
> +	reg = FIELD_CLEAR(IDR0_NS1ATS, reg);
> +	reg = FIELD_CLEAR(IDR0_ATS, reg);
> +	reg = FIELD_CLEAR(IDR0_HTTU, reg);
> +	reg = FIELD_CLEAR(IDR0_MSI, reg);
> +
> +	state->idr[0] = reg;
> +
> +	reg = mmio_read32(smmu->base + ARM_SMMU_IDR1);
> +	/* Substreams not supported for now. */
> +	reg = FIELD_CLEAR(IDR1_SSIDSIZE, reg);
> +
> +	state->idr[1] = reg;
> +
> +	state->idr[2] = mmio_read32(smmu->base + ARM_SMMU_IDR2);
> +	state->idr[3] = mmio_read32(smmu->base + ARM_SMMU_IDR3);
> +	state->idr[4] = mmio_read32(smmu->base + ARM_SMMU_IDR4);
> +	state->idr[5] = mmio_read32(smmu->base + ARM_SMMU_IDR5);
> +
> +	/* Reset the control registers. */
> +	state->cr[0] = 0;
> +	state->cr[1] = 0;
> +	state->cr[2] = 0;
> +
> +	state->gerror = 0;
> +	state->gerrorn = 0;
> +
> +	state->cmdq_base = 0;
> +	state->cmdq_prod = 0;
> +	state->cmdq_cons = 0;
> +
> +	state->evtq_base = 0;
> +	state->evtq_prod = 0;
> +	state->evtq_cons = 0;
> +
> +	state->irq_ctrl = 0;
> +	state->irq_ctrlack = 0;
> +	state->evtq_irq_cfg0 = 0;
> +	state->gerror_irq_cfg0 = 0;
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_get_step_from_guest(struct arm_smmu_state *state, u32 sid,
> +					u64 *dest)
> +{
> +	void *step_page;
> +	u64 *step, base_cfg, strtab_base, ste_addr;
> +	u32 log2size;
> +
> +	base_cfg = state->strtab_base_cfg;
> +
> +	/*
> +	 * Directly ANDing with the mask instead of using FIELD_GET() is
> +	 * intentional. The address has to be aligned by 64 bytes, so the
> +	 * bottom 6 bits are always 0, and so skipped when writing them to the
> +	 * register. By ANDing with the mask, we make the bottom 6 bits 0. This
> +	 * is the same for l2ptr calculation below.
> +	 *
> +	 * Using FIELD_GET(STRTAB_BASE_ADDR_MASK, state->strtab_base) << 6
> +	 * would have the same result.
> +	 */
> +	strtab_base = state->strtab_base & STRTAB_BASE_ADDR_MASK;
> +
> +	log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, base_cfg);
> +
> +	/* Check if 2 level walk should be used or 1 level. */
> +	if (FIELD_GET(STRTAB_BASE_CFG_FMT, base_cfg) == STRTAB_BASE_CFG_FMT_2LVL) {
> +		u64 l2ptr, num_l2_ents;
> +		u32 split, idx, span;
> +
> +		split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, base_cfg);
> +
> +		idx = (sid >> split) * STRTAB_L1_DESC_SIZE;
> +		ste_addr = strtab_base + idx;
> +
> +		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
> +						   2, PAGE_DEFAULT_FLAGS);
> +		if (step_page == NULL)
> +			return trace_error(-ENOMEM);
> +
> +		step = step_page + PAGE_OFFSET(ste_addr);
> +
> +		/* Get the second level table base. */
> +		l2ptr = step[0] & STRTAB_L1_DESC_L2PTR_MASK;
> +
> +		span = FIELD_GET(STRTAB_L1_DESC_SPAN, step[0]);
> +		num_l2_ents = 1 << (span - 1);
> +
> +		idx = (sid & ((1 << split) - 1)) * STRTAB_STE_SIZE;
> +		ste_addr = l2ptr + idx;
> +
> +		if (span == 0)
> +			return -ENOENT;
> +
> +		if (span > split + 1 ||
> +		    ste_addr > (l2ptr + num_l2_ents * STRTAB_STE_SIZE)) {
> +			return -EINVAL;
> +		}
> +
> +		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
> +						   2, PAGE_DEFAULT_FLAGS);
> +		if (step_page == NULL)
> +			return trace_error(-ENOMEM);
> +
> +		step = step_page + PAGE_OFFSET(ste_addr);
> +	} else {
> +		u32 num_stes, idx;
> +
> +		num_stes = 1 << log2size;
> +
> +		if (sid >= num_stes)
> +			return -EINVAL;
> +
> +		idx = sid * STRTAB_STE_SIZE;
> +		ste_addr = strtab_base + idx;
> +
> +		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
> +						   2, PAGE_DEFAULT_FLAGS);
> +		if (step_page == NULL)
> +			return trace_error(-ENOMEM);
> +
> +		step = step_page + PAGE_OFFSET(ste_addr);
> +	}
> +
> +	/*
> +	 * Pages mapped via paging_get_guest_pages() are temporary, and valid
> +	 * only until the next call to it. That's why it is better to copy to
> +	 * a buffer rather than returning the pointer directly.
> +	 */
> +	memcpy(dest, step, STRTAB_STE_SIZE);
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_cfgi_ste(struct arm_smmu_state *state, u32 sid)
> +{
> +	struct cell *cell;
> +	u64 guest_ste[STRTAB_STE_DWORDS], *step;
> +	int ret;
> +
> +	cell = this_cell();
> +
> +	/* Whoops, this cell is not allowed to touch this sid. */
> +	if (!arm_smmu_cell_can_access_sid(cell, sid))
> +		return trace_error(-EPERM);
> +
> +	ret = arm_smmu_get_step_from_guest(state, sid, guest_ste);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Get the hardware STE and update it with values from the guest.
> +	 */
> +	step = arm_smmu_get_step_for_sid(state->smmu, sid);
> +
> +	arm_smmu_write_strtab_ent(state->smmu, sid, guest_ste, step, false,
> +				  cell->config->id);
> +
> +	return 0;
> +}
> +
> +/*
> + * ToDo: Use the command queue error registers here.
> + */
> +static int arm_smmu_consume_cmd(struct arm_smmu_state *state)
> +{
> +	struct cell *cell;
> +	void *cmdq_base_page;
> +	struct arm_smmu_cmdq_ent ent;
> +	u64 cmd[CMDQ_ENT_DWORDS], *cmdq_base, cmdq_base_addr;
> +	u32 sid, ssid, cons, shift, idx;
> +	u8 op;
> +	int ret, i;
> +
> +	cell = this_cell();
> +	shift = FIELD_GET(Q_BASE_LOG2SIZE, state->cmdq_base);
> +
> +	if (Q_EMPTY(state->cmdq_prod, state->cmdq_cons, shift)) {
> +		printk("WARN: %s() called but command queue is empty\n",
> +		       __func__);
> +		return 0;
> +	}
> +
> +	cmdq_base_addr = state->cmdq_base & Q_BASE_ADDR_MASK;
> +
> +	/*
> +	 * Map 2 pages in case the base address is not aligned at a page
> +	 * boundary. The queue size is capped at 4k so it can't span more than
> +	 * 2 pages.
> +	 */
> +	cmdq_base_page = paging_get_guest_pages(NULL, cmdq_base_addr, 2,
> +					    PAGE_DEFAULT_FLAGS);
> +	if (cmdq_base_page == NULL)
> +		return trace_error(-ENOMEM);
> +	/*
> +	 * Offset the base page by the offset of q_base from the page boundary.
> +	 * This is to handle the case when the queue base is not page-aligned.
> +	 * For page-aligned base values, the address remains the same.
> +	 */
> +	cmdq_base = cmdq_base_page + PAGE_OFFSET(cmdq_base_addr);
> +
> +	idx = Q_IDX(state->cmdq_cons, shift) * CMDQ_ENT_DWORDS;
> +	cmd[0] = cmdq_base[idx];
> +	cmd[1] = cmdq_base[idx + 1];
> +
> +	op = cmd[0] & CMDQ_0_OP;
> +
> +	ent.opcode = op;
> +
> +	switch (op) {
> +	case CMDQ_OP_CFGI_STE:
> +		sid = FIELD_GET(CMDQ_CFGI_0_SID, cmd[0]);
> +
> +		ret = arm_smmu_cfgi_ste(state, sid);
> +		if (ret) {
> +			return ret;
> +		}
> +		break;
> +	case CMDQ_OP_CFGI_ALL:
> +		/*
> +		 * This might flood the command queue with too many invalidation
> +		 * commands, but we can't directly issue CFGI_ALL because it
> +		 * will affect other cell's STEs.
> +		 *
> +		 * Let's work on the assumption that the number of stream IDs
> +		 * allocated to a cell is a fairly small number.
> +		 */
> +		for_each_stream_id(sid, cell->config, i) {
> +			ret = arm_smmu_cfgi_ste(state, sid);
> +			/*
> +			 * -ENOENT means the STE was not installed by the guest
> +			 * even though we give it access in the config file.
> +			 * Just skip it.
> +			 */
> +			if (ret && ret != -ENOENT) {
> +				return ret;
> +			}
> +		}
> +		break;
> +	case CMDQ_OP_CMD_SYNC:
> +		ent.sync.msiaddr = cmd[1] & CMDQ_SYNC_1_MSIADDR_MASK;
> +		ent.sync.msidata = FIELD_GET(CMDQ_SYNC_0_MSIDATA, cmd[0]);
> +		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
> +		break;
> +	case CMDQ_OP_PREFETCH_ADDR:
> +		ent.prefetch.addr = cmd[1] & CMDQ_PREFETCH_1_ADDR_MASK;
> +		ent.prefetch.size = FIELD_GET(CMDQ_PREFETCH_1_SIZE, cmd[1]);
> +		/* Fallthrough */
> +	case CMDQ_OP_PREFETCH_CFG:
> +		sid = FIELD_GET(CMDQ_PREFETCH_0_SID, cmd[0]);
> +		ssid = FIELD_GET(CMDQ_PREFETCH_0_SSID, cmd[0]);
> +
> +		if (!arm_smmu_cell_can_access_sid(cell, sid))
> +			return trace_error(-EPERM);
> +
> +		ent.prefetch.sid = sid;
> +		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
> +		break;
> +	case CMDQ_OP_TLBI_NH_VA:
> +		ent.tlbi.addr = cmd[1] & CMDQ_TLBI_1_VA_MASK;
> +		ent.tlbi.leaf = FIELD_GET(CMDQ_TLBI_1_LEAF, cmd[1]);
> +		/* Fallthrough */
> +	case CMDQ_OP_TLBI_NH_ASID:
> +		ent.tlbi.asid = FIELD_GET(CMDQ_TLBI_0_ASID, cmd[0]);
> +		/* Fallthrough */
> +	case CMDQ_OP_TLBI_S12_VMALL:
> +		ent.tlbi.vmid = cell->config->id;
> +		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
> +		break;
> +	case CMDQ_OP_TLBI_NSNH_ALL:
> +		/* Only invalidate TLB entries for this cell. */
> +		ent.opcode = CMDQ_OP_TLBI_S12_VMALL;
> +		ent.tlbi.vmid = cell->config->id;
> +		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
> +		break;
> +	case CMDQ_OP_TLBI_EL2_ALL:
> +		/* Don't let guest cells touch EL2 entries. */
> +		break;
> +	default:
> +		printk("Command 0x%x not implemented yet\n", op);
> +		return -EINVAL;
> +	}
> +
> +	cons = state->cmdq_cons;
> +	cons = (Q_WRP(cons, shift) | Q_IDX(cons, shift)) + 1;
> +
> +	state->cmdq_cons = Q_OVF(state->cmdq_cons) | Q_WRP(cons, shift) |
> +			   Q_IDX(cons, shift);
> +
> +	dsb(ishst);
> +	return 0;
> +}
> +
> +static enum mmio_result arm_smmu_state_write64(struct arm_smmu_state *state,
> +					       struct mmio_access *mmio)
> +{
> +	u64 offset;
> +
> +	offset = mmio->address;
> +
> +	switch (offset) {
> +	case ARM_SMMU_CMDQ_BASE:
> +		if (state->idr[1] & IDR1_QUEUES_PRESET)
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		state->cmdq_base = mmio->value;
> +		break;
> +	case ARM_SMMU_EVTQ_BASE:
> +		if (state->idr[1] & IDR1_QUEUES_PRESET)
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		state->evtq_base = mmio->value;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE:
> +		if (state->idr[1] & IDR1_TABLES_PRESET)
> +			/* This register is read-only in preset mode. */
> +			return MMIO_ERROR;
> +		state->strtab_base = mmio->value;
> +		break;
> +	case ARM_SMMU_GERROR_IRQ_CFG0:
> +		state->gerror_irq_cfg0 = mmio->value;
> +		break;
> +	case ARM_SMMU_EVTQ_IRQ_CFG0:
> +		state->gerror_irq_cfg0 = mmio->value;
> +		break;
> +	default:
> +		/* Not a writeable register. */
> +		return MMIO_ERROR;
> +	}
> +
> +	return MMIO_HANDLED;
> +}
> +
> +static enum mmio_result arm_smmu_state_write32(struct arm_smmu_state *state,
> +					       struct mmio_access *mmio)
> +{
> +	u64 offset, value;
> +	u32 shift;
> +	int ret;
> +
> +	offset = mmio->address;
> +
> +	ret = 0;
> +
> +	switch (offset) {
> +	case ARM_SMMU_CR0:
> +		state->cr[0] = mmio->value;
> +		state->cr0ack = mmio->value;
> +		break;
> +	case ARM_SMMU_CR1:
> +		state->cr[1] = mmio->value;
> +		break;
> +	case ARM_SMMU_CR2:
> +		state->cr[2] = mmio->value;
> +		break;
> +	case ARM_SMMU_CMDQ_BASE:	/* 64b */
> +		if (state->idr[1] & IDR1_QUEUES_PRESET) {
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = LOWER_32_BITS(state->cmdq_base);
> +		value |= mmio->value << 32;
> +		state->cmdq_base = value;
> +		break;
> +	case ARM_SMMU_CMDQ_BASE + 4:
> +		if (state->idr[1] & IDR1_QUEUES_PRESET) {
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = UPPER_32_BITS(state->cmdq_base) << 32;
> +		value |= mmio->value;
> +		state->cmdq_base = value;
> +		break;
> +	case ARM_SMMU_CMDQ_PROD:
> +		/* The guest is responsible for checking if queue is full. */
> +		state->cmdq_prod = mmio->value;
> +
> +		if (!FIELD_GET(CR0_CMDQEN, state->cr[0])) {
> +			break;
> +		}
> +
> +		if (FIELD_GET(GERROR_CMDQ_ERR, state->gerror)) {
> +			break;
> +		}
> +
> +		shift = FIELD_GET(Q_BASE_LOG2SIZE, state->cmdq_base);
> +
> +		while (!ret && !Q_EMPTY(state->cmdq_prod, state->cmdq_cons,
> +		       shift)) {
> +			ret = arm_smmu_consume_cmd(state);
> +		}
> +
> +		break;
> +	case ARM_SMMU_CMDQ_CONS:
> +		state->cmdq_cons = mmio->value;
> +		break;
> +	case ARM_SMMU_EVTQ_BASE:	/* 64b */
> +		if (state->idr[1] & IDR1_QUEUES_PRESET) {
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = LOWER_32_BITS(state->evtq_base);
> +		value |= mmio->value << 32;
> +		state->evtq_base = value;
> +		break;
> +	case ARM_SMMU_EVTQ_BASE + 4:
> +		if (state->idr[1] & IDR1_QUEUES_PRESET) {
> +			/* Read only. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = UPPER_32_BITS(state->evtq_base) << 32;
> +		value |= mmio->value;
> +		state->evtq_base = value;
> +		break;
> +	case ARM_SMMU_EVTQ_PROD:
> +		state->evtq_prod = mmio->value;
> +		break;
> +	case ARM_SMMU_EVTQ_CONS:
> +		state->evtq_cons = mmio->value;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE:	/* 64b */
> +		if (state->idr[1] & IDR1_TABLES_PRESET) {
> +			/* This register is read-only in preset mode. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = LOWER_32_BITS(state->strtab_base);
> +		value |= mmio->value << 32;
> +		state->strtab_base = value;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE + 4:
> +		if (state->idr[1] & IDR1_TABLES_PRESET) {
> +			/* This register is read-only in preset mode. */
> +			return MMIO_ERROR;
> +		}
> +
> +		value = UPPER_32_BITS(state->strtab_base) << 32;
> +		value |= mmio->value;
> +		state->strtab_base = value;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE_CFG:
> +		if (state->idr[1] & IDR1_TABLES_PRESET) {
> +			return MMIO_ERROR;
> +		}
> +
> +		/*
> +		 * The split can only be 6, 8, 10 (4kB/16kB/64Bk leaf tables).
> +		 * All other values are reserved and are treated as 6.
> +		 */
> +		if (!(FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 6 ||
> +		    FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 8 ||
> +		    FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 10)) {
> +			mmio->value = FIELD_CLEAR(ARM_SMMU_STRTAB_BASE_CFG,
> +						  mmio->value);
> +			mmio->value |= FIELD_PREP(STRTAB_BASE_CFG_SPLIT, 6);
> +		}
> +
> +		state->strtab_base_cfg = mmio->value;
> +		break;
> +	case ARM_SMMU_GERRORN:
> +		/*
> +		 * The SMMU driver will toggle fields in this register to
> +		 * acknowldge errors. Update GERROR too so software knows it
> +		 * can continue.
> +		 */
> +		state->gerrorn = state->gerror = mmio->value;
> +		break;
> +	case ARM_SMMU_IRQ_CTRL:
> +		/*
> +		 * XXX: IRQs are not supported yet. For now, just let the
> +		 * write go through without any effect. The guest expects to
> +		 * see an acknowldgement in ARM_SMMU_IRQ_CTRLACK.
> +		 */
> +		state->irq_ctrl = mmio->value;
> +		state->irq_ctrlack = mmio->value;
> +		break;
> +	default:
> +		/* Not a writeable register. */
> +		return MMIO_ERROR;
> +	}
> +
> +	if (ret) {
> +		return MMIO_ERROR;
> +	}
> +
> +	return MMIO_HANDLED;
> +}
> +
> +static enum mmio_result arm_smmu_state_read64(struct arm_smmu_state *state,
> +					      struct mmio_access *mmio)
> +{
> +	u64 offset, value;
> +
> +	offset = mmio->address;
> +
> +	switch(offset) {
> +	case ARM_SMMU_CMDQ_BASE:
> +		value = state->cmdq_base;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE:
> +		value = state->strtab_base;
> +		break;
> +	case ARM_SMMU_EVTQ_BASE:
> +		value = state->evtq_base;
> +		break;
> +	default:
> +		return MMIO_ERROR;
> +	}
> +
> +	mmio->value = value;
> +	return MMIO_HANDLED;
> +}
> +
> +static enum mmio_result arm_smmu_state_read32(struct arm_smmu_state *state,
> +					      struct mmio_access *mmio)
> +{
> +	u64 offset;
> +	u32 value;
> +
> +	offset = mmio->address;
> +
> +	switch (offset) {
> +	case ARM_SMMU_CR0:
> +		value = state->cr[0];
> +		break;
> +	case ARM_SMMU_CR1:
> +		value = state->cr[1];
> +		break;
> +	case ARM_SMMU_CR2:
> +		value = state->cr[2];
> +		break;
> +	case ARM_SMMU_CR0ACK:
> +		value = state->cr0ack;
> +		break;
> +	case ARM_SMMU_IDR0:
> +		value = state->idr[0];
> +		break;
> +	case ARM_SMMU_IDR1:
> +		value = state->idr[1];
> +		break;
> +	case ARM_SMMU_IDR2:
> +		value = state->idr[2];
> +		break;
> +	case ARM_SMMU_IDR3:
> +		value = state->idr[3];
> +		break;
> +	case ARM_SMMU_IDR4:
> +		value = state->idr[4];
> +		break;
> +	case ARM_SMMU_IDR5:
> +		value = state->idr[5];
> +		break;
> +	case ARM_SMMU_CMDQ_BASE:	/* 64b */
> +		value = UPPER_32_BITS(state->cmdq_base);
> +		break;
> +	case ARM_SMMU_CMDQ_BASE + 4:
> +		value = LOWER_32_BITS(state->cmdq_base);
> +		break;
> +	case ARM_SMMU_CMDQ_PROD:
> +		value = state->cmdq_prod;
> +		break;
> +	case ARM_SMMU_CMDQ_CONS:
> +		value = state->cmdq_cons;
> +		break;
> +	case ARM_SMMU_EVTQ_BASE:	/* 64b */
> +		value = UPPER_32_BITS(state->evtq_base);
> +		break;
> +	case ARM_SMMU_EVTQ_BASE + 4:
> +		value = LOWER_32_BITS(state->evtq_base);
> +		break;
> +	case ARM_SMMU_EVTQ_PROD:
> +		value = state->evtq_prod;
> +		break;
> +	case ARM_SMMU_EVTQ_CONS:
> +		value = state->evtq_cons;
> +		break;
> +	case ARM_SMMU_STRTAB_BASE:	/* 64b */
> +		value = UPPER_32_BITS(state->strtab_base);
> +		break;
> +	case ARM_SMMU_STRTAB_BASE + 4:
> +		value = LOWER_32_BITS(state->strtab_base);
> +		break;
> +	case ARM_SMMU_STRTAB_BASE_CFG:
> +		value = state->strtab_base_cfg;
> +		break;
> +	case ARM_SMMU_GERROR:
> +		value = state->gerror;
> +		break;
> +	case ARM_SMMU_GERRORN:
> +		value = state->gerrorn;
> +		break;
> +	case ARM_SMMU_IRQ_CTRL:
> +		value = state->irq_ctrl;
> +		break;
> +	case ARM_SMMU_IRQ_CTRLACK:
> +		value = state->irq_ctrlack;
> +		break;
> +	default:
> +		/*
> +		 * The SMMU spec says all undefined register accesses should be
> +		 * RAZ/WI. Keep it like this for now so we know when
> +		 * un-implemented registers are being used, rather than having
> +		 * silent failures all over. Same for handling writes.
> +		 */
> +		return MMIO_ERROR;
> +	}
> +
> +	mmio->value = value;
> +
> +	return MMIO_HANDLED;
> +}
> +
> +static enum mmio_result arm_smmu_mmio_handler(void *arg,
> +					      struct mmio_access *mmio)
> +{
> +	struct arm_smmu_state *state;
> +	enum mmio_result ret;
> +
> +	state = arg;
> +
> +	if (mmio->is_write) {
> +		if (mmio->size == 4)
> +			ret = arm_smmu_state_write32(state, mmio);
> +		else if (mmio->size == 8)
> +			ret = arm_smmu_state_write64(state, mmio);
> +		else
> +			return MMIO_HANDLED;	/* Write-invalidate (WI) */
> +	} else {
> +		if (mmio->size == 4)
> +			ret = arm_smmu_state_read32(state, mmio);
> +		else if (mmio->size == 8)
> +			ret = arm_smmu_state_read64(state, mmio);
> +		else {
> +			mmio->value = 0;
> +			return MMIO_HANDLED;	/* Read As Zero (RAZ) */
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Before loading Jailhouse, the root cell might have set up stream table
> + * entries. Jailhouse replaces the stream table with its own, so install those
> + * entries in the hypervisor's stream table.
> + */
> +static void arm_smmu_init_root_strtab(struct arm_smmu_state *state)
> +{
> +	u64 guest_ste[STRTAB_STE_DWORDS];
> +	u32 sid;
> +	int i, ret;
> +
> +	for_each_stream_id(sid, root_cell.config, i) {
> +		ret = arm_smmu_get_step_from_guest(state, sid, guest_ste);
> +		if (ret)
> +			continue;
> +
> +		if (guest_ste[0] & STRTAB_STE_0_V) {
> +			ret = arm_smmu_cfgi_ste(state, sid);
> +			if (ret)
> +				continue;
> +		}
> +	}
> +}
> +
> +#endif /* CONFIG_SMMUV3_STAGE1 */
> +
>  static int arm_smmuv3_cell_init(struct cell *cell)
>  {
>  	struct jailhouse_iommu *iommu;
>  	struct arm_smmu_cmdq_ent cmd;
>  	int ret, i, j, sid;
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	struct arm_smmu_state *state;
> +	cell->arch.smmu_states = NULL;
> +#endif
>  
>  	if (!iommu_count_units())
>  		return 0;
> @@ -1070,6 +1851,26 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>  			if (ret)
>  				return ret;
>  		}
> +
> +#ifdef CONFIG_SMMUV3_STAGE1
> +		/* Only initialize if stage 1 translations are supported. */
> +		if (smmu[i].features & IDR0_S1P) {
> +			if (cell->arch.smmu_states == NULL) {
> +				cell->arch.smmu_states = page_alloc(&mem_pool,
> +					PAGES(sizeof(*cell->arch.smmu_states) *
> +					JAILHOUSE_MAX_IOMMU_UNITS));
> +				if (cell->arch.smmu_states == NULL)
> +					return trace_error(-ENOMEM);
> +			}
> +
> +			state = &cell->arch.smmu_states[i];
> +			arm_smmu_state_init(state, &smmu[i]);
> +
> +			/* Register the SMMU as an MMIO region. */
> +			mmio_region_register(cell, iommu->base, iommu->size,
> +					     arm_smmu_mmio_handler, state);

Some mmio_region_unregister on cell destruction is missing.

> +		}
> +#endif /* CONFIG_SMMUV3_STAGE1 */
>  	}
>  
>  	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> @@ -1096,6 +1897,12 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>  		}
>  	}
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +	page_free(&mem_pool, cell->arch.smmu_states,
> +		  PAGES(sizeof(*cell->arch.smmu_states) *
> +		  JAILHOUSE_MAX_IOMMU_UNITS));
> +#endif
> +
>  	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
>  	cmd.tlbi.vmid	= cell->config->id;
>  	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> @@ -1124,6 +1931,16 @@ static int arm_smmuv3_init(void)
>  		if (ret)
>  			return ret;
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +		/*
> +		 * The root cell's OS has already initialised the SMMU
> +		 * so the emulated SMMU state won't be correct for the root
> +		 * cell. Dump the current SMMU registers and then we will copy
> +		 * it over later.
> +		 */
> +		arm_smmu_dump_state(&state_dump[i], &smmu[i]);
> +#endif /* CONFIG_SMMUV3_STAGE1 */
> +
>  		/* Reset the device */
>  		ret = arm_smmu_device_reset(&smmu[i]);
>  		if (ret)
> @@ -1133,6 +1950,59 @@ static int arm_smmuv3_init(void)
>  	return arm_smmuv3_cell_init(&root_cell);
>  }
>  
> +#ifdef CONFIG_SMMUV3_STAGE1
> +void arm_smmuv3_iommu_config_commit(struct cell *cell)
> +{
> +	struct jailhouse_iommu *iommu;
> +	struct arm_smmu_state *state;
> +	int i;
> +
> +	if (cell != &root_cell)
> +		return;
> +
> +	/*
> +	 * The SMMU does not support stage 1 translations. So nothing to do
> +	 * here.
> +	 */
> +	if (&cell->arch.smmu_states == NULL)
> +		return;
> +
> +	iommu = &system_config->platform_info.arm.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
> +			continue;
> +
> +		state = &cell->arch.smmu_states[i];
> +
> +		/*
> +		 * The root cell's OS has already initialised the
> +		 * SMMU so in that case copy the state from the SMMU
> +		 * dump.
> +		 */
> +		memcpy(state, &state_dump[i], sizeof(*state));
> +		arm_smmu_init_root_strtab(state);
> +	}
> +
> +	return;
> +}
> +
> +static unsigned int arm_smmuv3_mmio_count_regions(struct cell *cell)
> +{
> +	int i;
> +	unsigned int count;
> +
> +	count = 0;
> +
> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
> +		if (smmu[i].features & IDR0_S1P)
> +			count++;
> +	}
> +
> +	return count;
> +}
> +#else
>  DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmuv3);
> +#endif /* CONFIG_SMMUV3_STAGE1 */
> +
>  DEFINE_UNIT_SHUTDOWN_STUB(arm_smmuv3);
>  DEFINE_UNIT(arm_smmuv3, "ARM SMMU v3");
> 

As I was afraid, this is really a significant extension of the driver, almost
doubling the stage-2-only baseline and adding a lot of register emulation. I'm
holding this back for now as the register interface would require a careful
in-depth review.

Patches 1-5 are queue, though. Will see if I can give them a try as well.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/15b6eacb-a0c5-0f3b-1ec2-950e33859b53%40siemens.com.
