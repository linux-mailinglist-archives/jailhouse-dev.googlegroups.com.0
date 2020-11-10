Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDG4VH6QKGQEYKJNUUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001A2AD3EF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 11:40:13 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id u123sf542613wmu.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 02:40:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605004813; cv=pass;
        d=google.com; s=arc-20160816;
        b=0EeWtZxFcRuXfZ1BffJSST6i5GIKnC6FknY6JGlktRt7tQXcG1TOmII8VSi6d4phqG
         xg9uxlP5I4Wka+O6PeZHzvvRlRsxg4LeIVRmJygae6Urw7ya30JjB4H4jbtzL1hwKOdJ
         PL4a9MQguX/VdhpUR3ZnKpJaNgisagRCv5HgQKKNhh9BkeJZTzErEzNpl5vllZ+36xJ4
         oYNgnZS17xStixuJflCZ+RhXY+H29hMVvg3CBO8PAZppOz848r+MJ3IEwHKLwwv07BYD
         NcpdLvYICxiaAwnA+Kqne1wCCg5O1xej5bEjeGc9vfX00oPjckG4lVe8qzbLculGYh3H
         IUZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=yBw9GG3NUwHsx+gMuSC9+cKFNZgiC6/tH/dWerJlp9k=;
        b=LTFxGQRItYvcsfw2i/3+20qBgzTO4jmZ8vIfOLBUc7VOML+YSwxzy1fbgbjrF6XNvd
         7/qVhuW/+qw17ZRj8SxlaC85C2UiRnlZ4WxFbnYzEMALh2EhYpVbw4NAU5PQsKDfMsNQ
         eByGs5rUJYUWrfG6bwSJM3m4DPy0gUu3Viss7Uu81ous90SOr7MpuJflgkSEGhSh6Eb8
         kqGgccp/ax9yJ9sa9a1ixZr8Dudpg/KL3srHgVynuN8K9FFiZz+YSvJiqmN1gpHaY+qA
         SByBCNU9cMq2dqjIGZz/xRsLZi0cuZkIGRTEioaEdy0Gd6hlPYcNCxoVTYxrjNGEfTE2
         YZEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yBw9GG3NUwHsx+gMuSC9+cKFNZgiC6/tH/dWerJlp9k=;
        b=o1PU6EGE6Yd5vy19+WhNAhKX4zv6cz3t+as7bc3jj7tAK2BtotPpIN2g6OOpifFELV
         sY9uuxPLuntfXsEb2BZD9ZOtO3vD1SQsgt0sawzSVPopOG1mURyr3A3PJD2rphdA8Pa3
         2OYWkvr156fpHQyhgG5fJrO5T+i+bPvgA3ivFgTaE3XggEJ1OszFsdcLGxm5sGoGlcIB
         c3chmxij7K+oLOsUeaFHeN0No17hIud/5+mZnhLUPNa4yaxTGABJVB0kKQtZyk5Sb2qh
         Ih51m7omoQH0L6SxsAP+d6nssYNbdd9ECL620mS9GOmieAsOZmblNLFGTwcks8130ECZ
         CNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yBw9GG3NUwHsx+gMuSC9+cKFNZgiC6/tH/dWerJlp9k=;
        b=GXq/TQf9tcCLtHxzogCd4LEb9hNRSHEdhfo0Skjuhj8/K7LI0+B8N17RazmsknWn2X
         Sr+WaMy7FcEsTKV5RS1HGMGoTbub6p4sQiF9KkUPXLMfEv+U0N0qLuM0aBww4s8Vk4KU
         L6mHdFKAXs0BfmJ5RZhpQN8rIySOjDxipRAI8LJLoYpxaXK7hy91O97EUUiTTUT8f8PX
         Fwa7xEDizfqbzPNcQe5RDZrYdEr4miMFszKxEWC8sjxPBuLzlvIY5ZNOHXHqKehaUfOr
         Bii+coykGf8KokTRYmKSKeaXdtOP3iiA5p+j7XTQF3UBJWb7eU4CzyBNX5T/hnfFtudW
         KYtw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531x7zTwtM57gmNdFw0O/fgh44T1xAzW8o/8vA4x6lNXzgKlPbo/
	GPsbsKf7Wud5ebSzApkx6SM=
X-Google-Smtp-Source: ABdhPJw9JOR1tigBnYB/jmy0ApNorJ6U+HhQZwYPn519jffcmjr692XEOUJgfDnN50Nm4NMMPCRaxw==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr8129018wrq.16.1605004812957;
        Tue, 10 Nov 2020 02:40:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5417:: with SMTP id i23ls990200wmb.2.canary-gmail; Tue,
 10 Nov 2020 02:40:11 -0800 (PST)
X-Received: by 2002:a1c:c906:: with SMTP id f6mr4212574wmb.9.1605004811633;
        Tue, 10 Nov 2020 02:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605004811; cv=none;
        d=google.com; s=arc-20160816;
        b=BVPeo4PXa4wrQ8+Qnvzrc8U+MiFYtk+wLhRgXjqx+zWinP2osxlniS8z91HPcaYSNh
         oPayCmkzrIeP3Q0JPsB1Jokkbt253szRouoFLoh/eLD6SBzBso16++j5qIt0/E+F8ICP
         XhJFBICw1lbQGJsLC8YsZNIOI73rnGWUqF2WZU/o7ez39oAO5ntQHXOI73QiImITYx06
         elh4cccMDmtJkon7h0pvnca2JJm/gVh5KBMgmQh4DrI+7HPBh36CXeig+XcBgdcPpVjK
         SuOvQ7E9oqp1xrJkZ8iJUwUbKHWV6CQ8kYYaUbehcYF/eUGNhOmD3FHM9mMXlEJ8gtHM
         QdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=eHRxFxU4vWDD4945J+M/dp1YmqNByvuu+4AkLfCflr4=;
        b=bKToEF0iMw/uyYfVVpxqcAZueAupNp/GV3TYQ4YwHYr/iqbZwAhY2jqhmxYzDQpkUy
         T3773DzgH7sulozACYEzcyvupRiIVmQlyrgBCX05k9Np9/4L3kQk1GHRcm8wjHilr26I
         4VxznhatcFEKUwX8yQPe2t0GS64AktacjwAWON7DWpQhMUH/Nimpd+IT92w8rJqEPA+m
         7W70tc3eo8NgLvm8Ilq/hDFOb85ocNg0STUnl9kqDwSNywxc5ESOHaHp1jioT93w4sZj
         96XhemoWVc7JFH2MRZ4I7jX0BAp6bC/Zz5/YNgycd/vyLsvrW4TPqYwrO1Xfmn2QDptW
         16/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z83si142431wmc.3.2020.11.10.02.40.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 02:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0AAAeBYj002578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Nov 2020 11:40:11 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AAAeAqj031249;
	Tue, 10 Nov 2020 11:40:10 +0100
Subject: Re: [PATCH v2 1/3] arm64: SMMUv2: Separate stream ID's mask and id
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201109160100.103095-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <13b9ba70-ff2e-aebb-57ca-49572536cbe2@siemens.com>
Date: Tue, 10 Nov 2020 11:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109160100.103095-1-andrea.bastoni@tum.de>
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


On 09.11.20 17:00, Andrea Bastoni wrote:
> The SMMUv2 allows filtering bits when matching stream IDs before they're
> passed to the TCU. In this way multiple streams legally get the same
> translation.
> 
> On boards such as the ZCU Ultrascale+, the master ID needed to identify
> the corresponding SMMU stream ID may be dependent on a specific AXI ID
> that is set by the PL (and could be IP specific).
> 
> One single fixed mask to pass to the SMR to compact multiple stream IDs
> before they "hit" the TCU is not flexible enough. The use-case is to
> compact similar PL-originating masters and have the SMMU behaving the
> same for them (e.g., they're assigned to the same inmate). At the
> same time, one needs a full stream_id to assign e.g., different GEM
> ethernets to different inmates.
> 
> For the MMU-500, provide an explicit mask + id in the configuration and
> update the implementation accordingly.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/arch/arm64/smmu.c    | 73 ++++++++++++++++++++++-----------
>  include/jailhouse/cell-config.h | 15 +++++--
>  2 files changed, 61 insertions(+), 27 deletions(-)
> 
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index df92fb7a..9b824782 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -84,6 +84,10 @@
>  #define SMR_VALID			(1 << 31)
>  #define SMR_MASK_SHIFT			16
>  #define SMR_ID_SHIFT			0
> +/* Ignore upper bit in ID and MASK */
> +#define SMR_GET_ID(smr)			((smr) & 0x7fff)
> +/* Mask is already specified from bit 0 in the configuration */
> +#define SMR_GET_MASK(smr)		((smr) & 0x7fff)
>  
>  /* Stream-to-Context Register */
>  #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> @@ -152,7 +156,6 @@ struct arm_smmu_device {
>  	unsigned long			pgshift;
>  	u32				num_context_banks;
>  	u32				num_mapping_groups;
> -	u16				arm_sid_mask;
>  	struct arm_smmu_smr		*smrs;
>  };
>  
> @@ -164,6 +167,15 @@ static unsigned int num_smmu_devices;
>  	     (counter) < num_smmu_devices;			\
>  	     (smmu)++, (counter)++)
>  
> +#define for_each_mmu500_sid(sid, config, counter)	\
> +	u32 __stub_iter; \
> +	for ((__stub_iter) = (jailhouse_cell_stream_ids(config)[0]), \
> +		(counter) = 0, \
> +		(sid) = (union jailhouse_stream_id)(__stub_iter); \
> +	     (counter) < (config)->num_stream_ids; \
> +	     (__stub_iter) = (jailhouse_cell_stream_ids(config)[++(counter)]), \
> +		(sid) = (union jailhouse_stream_id)(__stub_iter))
> +
>  static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
>  {
>  	struct arm_smmu_smr *smr = smmu->smrs + idx;
> @@ -360,7 +372,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> -static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
> +static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
>  {
>  	struct arm_smmu_smr *smrs = smmu->smrs;
>  	int free_idx = -EINVAL;
> @@ -388,7 +400,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>  		 * expect simply identical entries for this case, but there's
>  		 * no harm in accommodating the generalisation.
>  		 */
> -		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
> +		if ((mask & smrs[n].mask) == mask &&
>  		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
>  			return n;
>  		}
> @@ -397,7 +409,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>  		 * though, then there always exists at least one stream ID
>  		 * which would cause a conflict, and we can't allow that risk.
>  		 */
> -		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
> +		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
>  			return -EINVAL;
>  	}
>  
> @@ -409,7 +421,9 @@ static int arm_smmu_cell_init(struct cell *cell)
>  	unsigned int vmid = cell->config->id;
>  	struct arm_smmu_device *smmu;
>  	struct arm_smmu_smr *smr;
> -	unsigned int dev, n, sid;
> +	unsigned int dev, n;
> +	u16 sid, smask;
> +	union jailhouse_stream_id fsid;
>  	int ret, idx;
>  
>  	/* If no sids, ignore */
> @@ -421,19 +435,22 @@ static int arm_smmu_cell_init(struct cell *cell)
>  
>  		smr = smmu->smrs;
>  
> -		for_each_stream_id(sid, cell->config, n) {
> -			ret = arm_smmu_find_sme(sid, smmu);
> +		for_each_mmu500_sid(fsid, cell->config, n) {
> +			sid = SMR_GET_ID(fsid.mmu500.id);
> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
> +
> +			ret = arm_smmu_find_sme(sid, smask, smmu);
>  			if (ret < 0)
>  				return trace_error(ret);
>  			idx = ret;
>  
> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> -			       sid, cell->config->name);
> +			printk("Assigning SID 0x%x, Mask 0x%x to cell \"%s\"\n",
> +			       sid, smask, cell->config->name);
>  
>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
>  
>  			smr[idx].id = sid;
> -			smr[idx].mask = smmu->arm_sid_mask;
> +			smr[idx].mask = smask;
>  			smr[idx].valid = true;
>  
>  			arm_smmu_write_smr(smmu, idx);
> @@ -449,14 +466,18 @@ static int arm_smmu_cell_init(struct cell *cell)
>  }
>  
>  static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
> -					     unsigned int sid, int idx)
> +					     union jailhouse_stream_id fsid,
> +					     int idx)
>  {
> -	unsigned int root_sid, n;
> +	unsigned int n;
> +	union jailhouse_stream_id rsid;
>  
> -	for_each_stream_id(root_sid, root_cell.config, n) {
> -		if (sid == root_sid) {
> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> -			       sid, root_cell.config->name);
> +	for_each_mmu500_sid(rsid, root_cell.config, n) {
> +		if (fsid.id == rsid.id) {
> +			printk("Assigning SID 0x%x Mask: 0x%x to cell \"%s\"\n",
> +			       SMR_GET_ID(fsid.mmu500.id),
> +			       SMR_GET_MASK(fsid.mmu500.mask),
> +			       root_cell.config->name);
>  
>  			/* We just need to update S2CR, SMR can stay as is. */
>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
> @@ -471,7 +492,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  {
>  	int id = cell->config->id;
>  	struct arm_smmu_device *smmu;
> -	unsigned int dev, n, sid;
> +	unsigned int dev, n;
> +	u16 sid, smask;
> +	union jailhouse_stream_id fsid;
>  	int idx;
>  
>  	/* If no sids, ignore */
> @@ -479,10 +502,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  		return;
>  
>  	for_each_smmu(smmu, dev) {
> -		for_each_stream_id(sid, cell->config, n) {
> -			idx = arm_smmu_find_sme(sid, smmu);
> -			if (idx < 0 ||
> -			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
> +		for_each_mmu500_sid(fsid, cell->config, n) {
> +			sid = SMR_GET_ID(fsid.mmu500.id);
> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
> +
> +			idx = arm_smmu_find_sme(sid, smask, smmu);
> +			if (idx < 0)
> +				continue;
> +
> +			/* return full stream ids */
> +			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
>  				continue;
>  
>  			if (smmu->smrs) {
> @@ -546,8 +575,6 @@ static int arm_smmu_init(void)
>  			continue;
>  
>  		smmu = &smmu_device[num_smmu_devices];
> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
> -
>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>  		if (!smmu->base) {
>  			err = -ENOMEM;
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 472cb4bb..d7a15990 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -279,13 +279,19 @@ struct jailhouse_iommu {
>  			__u64 tlb_base;
>  			__u32 tlb_size;
>  		} __attribute__((packed)) tipvu;
> -
> -		struct {
> -			__u32 sid_mask;
> -		} __attribute__((packed)) arm_mmu500;
>  	};
>  } __attribute__((packed));
>  
> +union jailhouse_stream_id {
> +	/* Note: keep first */
> +	__u32 id;
> +	struct {
> +		/* Note: both mask and id are only 15 bits wide */
> +		__u16 mask;
> +		__u16 id;
> +	} __attribute__((packed)) mmu500;
> +} __attribute__((packed));
> +
>  struct jailhouse_pio {
>  	__u16 base;
>  	__u16 length;
> @@ -427,6 +433,7 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
>  static inline const __u32 *
>  jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
>  {
> +	/* Note: deliver the __u32 full id */
>  	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
>  		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
>  }
> 

Will require some changes, but if we already introduce union, we should
return it, like with the other accessors. Maybe different
for_each-iterators can catch that again.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/13b9ba70-ff2e-aebb-57ca-49572536cbe2%40siemens.com.
