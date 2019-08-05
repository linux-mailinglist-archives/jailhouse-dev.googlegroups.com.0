Return-Path: <jailhouse-dev+bncBCB7D7MXMMIO5CE75ICRUBF4HGOHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F776811C9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 07:53:52 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id e33sf9994756pgm.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Aug 2019 22:53:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564984431; cv=pass;
        d=google.com; s=arc-20160816;
        b=uJK9Da8PTLkI5OnQXLMJtixpRXKGir2TMV+ch/7apAxuNFs8kVyP0+00qnFOpDq2fW
         fZuKlRRIABlAWLMPBtK5wmY+JEENhY2NL4x4xLwD3uUJItxfZUzVwWqRJXYGig2uXWYm
         a2WDwTlBgmrVB5Eg55BS0vmBlEd51SUkGLEeLDTO4BrB4XvBZpKTXJqSDxwqnwmqL43X
         cD19b4UXhY4CAG1DiLeLoaml4theMgcF0/QhCiF/j+JW7rH/TKHVbCqE7VTgCerTHGMM
         1R1jDSeaxY+pWE67D9fLnGnTaOcCa/HeZpFg+Ur6CqpzG685qNkZiapk3AoxZ8clnxW8
         dwnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=PHeH91g/+Q2/J4uXm/ipfYmbiZODBPKGsOANsOgncNw=;
        b=ZQcbz4JMUtip+5SF7n7G2+tw1vkyTzRpeVhTRg2RZBWteUMEcHi9wxW598VFW7Bh3Q
         sVkkxcu+z4/kjXTmUbmespIkP5sbF21mSSmzFQWmbKHXRIVnVODYtQrtzXBxmsS6Py8J
         LHyiydYOPplaAeUz3z9mS4YsYJHIINHB90kV1Vp2IEPD1npAjoE0JrHx5l+L1le+mxrq
         M8X+JxE1mzCvbl6wIeoeOHSzbaOZPREl1glPqiSCRhhEJleqtCDMIpgfR2BOwpKSZ3/1
         KSAkl6sZs1WvudNw4ae0b0+b2ftvuBTHjVKJCSeCp3yaxKQByqNkx1zJGx0W6eS/3dSH
         nOQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="kWA0e/wj";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=PHeH91g/+Q2/J4uXm/ipfYmbiZODBPKGsOANsOgncNw=;
        b=LKFPuQ8mPSR4D+Ek6wuH7yZyBjfGVSFIWDvqmGiQzMvgPiyA60oVK3TTVC6eWxOVzg
         ZIFO06IZHU9XbAwWc0tHOjHmuFoUCe8sNTwCGQbn2GMTlmkfukWD97yoVz/Y1tEkvVUU
         y41+saKEb0V90E+1iNYoRmkctTwfWgA+pwOprMh2aDwVijbzazqS39FupHjCXaAx6QI4
         GF4go1mukm6JLP4n9+jt8AjtbPQ5s4yIK6zJG6ahb4Yl46L3HLpSZJyYf+v6RlHGpf3S
         PKTy0SXyKLEjClgxRqpWPFuhrRIXKADh+i9/R8fa6K8HDKbSfs1WJf+EKdeH7ZOgTal4
         Mf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PHeH91g/+Q2/J4uXm/ipfYmbiZODBPKGsOANsOgncNw=;
        b=FDuwTgLBG5fiB4KWtBC+q7BpuZ2mXzBTWLk4rwVsrVAyIXHSWSwGhrdvtNCeHIX5BE
         jZ9PCo8MGkiMSytTTI6j38B5QxmwqBFjVGsqiq6nGa+y2rBhkv3mepDqmvjNkwVMcpuL
         wjxv+CH8KVe8bwNuUgmR2ZiqLVonkGf+ZLgBNvwdKZA1BwW5O4smgKRl62wFmTaTt73+
         fpgTI9o0xNXoWQl9LH13SfZcRrOxZWfNSEjvHeQ7YtN/kh8wNfCfnV9LMTHAVRLQ7PdR
         OALsYrvZIrayEC1rJFW8ArwNEsAzBPg5sogQiqCESndATC7urqzLUnH7+8BxPc9DxNVm
         hziA==
X-Gm-Message-State: APjAAAVqfOw5iCEEfENw3RnRLXPCFXHFnApU3rGC3dlfGa7OjG4aigRS
	uDblpX4YF5OmOwqh5P1MiDo=
X-Google-Smtp-Source: APXvYqwfJHB0yUPNHzfxRLVCFEP8R5YR0ZJW0Kd1Z7fQ4FF0k62r7NvqG26qyRv0f3oOznq2p6qEmw==
X-Received: by 2002:a17:90a:b00b:: with SMTP id x11mr16482696pjq.120.1564984430743;
        Sun, 04 Aug 2019 22:53:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:ca05:: with SMTP id x5ls5279498pjt.3.canary-gmail;
 Sun, 04 Aug 2019 22:53:50 -0700 (PDT)
X-Received: by 2002:a17:902:9a04:: with SMTP id v4mr138467276plp.95.1564984430175;
        Sun, 04 Aug 2019 22:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564984430; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLnMi8CIT9tiJ1Je4n7wxOTPN77b17sc9UJ5Ds5k087mlXk41JnR09vosLNuXpzNJK
         zQ9bCOuCQ5iMZonHWGoV/BjlklAPxQkVeTN3srizdJovm0fK1616VHgyR9Nw8DoT/7Sp
         w6lU6O6snW5ZCvZaGoojt4EqHKE7kULOWAQuElBgHD2B4Y/SzWf35/PvE/cITRS2l5ki
         SLkhoUt24Yf/iYUtoM1NY51wtwUSl0R4m39TtM91/umCrZa8Qwbf+9Vz3qQJyPr42eZq
         K23jymJRR6DJD/vv7TEx1WGYN4h9BIlpmb1XWC+ehpPskUNkIR991gz/9hz7krXq5Pwb
         /slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=z2stx5NUSSTdKuqilSOtilZ8NIymsZjl61zxbkbYIv8=;
        b=guAZ6Hx9a1rBzXTNeVhx5xDbUc3TpWPZHF9JbO7y6ovkqp8vcjy+0M33kUwulOHouy
         vDtNEnPpPiLmk9cE8coEw4mvl4eBncr2fTaDoii/pacPCoESUtPGXRDLrEd2OMhIVuCP
         yZwEoc/BsACmoF+W/STdARhOdJxqVMM2U0EBV/+33GaCPptR53ebJ5BP/m2Z9klJP3Sn
         yHwOpOFmZ8ARpa/Xr0i3KCP+fGRlVkjjc+//umJW9Nt5UmW1h3orvoD3eAURmdv+li6W
         BANKC7wjsDU4Sq36E0hpAe8wckSbkVn2ThBFiqr/M/h9JSEwDLjYLUGDktwjJsSopZJX
         RKxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="kWA0e/wj";
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id y13si3326777pfl.3.2019.08.04.22.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Aug 2019 22:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x755rnlu009661;
	Mon, 5 Aug 2019 00:53:49 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x755rnu1087874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Aug 2019 00:53:49 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 00:53:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 00:53:48 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x755rjqS023918;
	Mon, 5 Aug 2019 00:53:46 -0500
Subject: Re: [PATCH v4 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190801113547.7460-1-lokeshvutla@ti.com>
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <4106eb52-b73f-cb70-bb85-ce7b1a882e11@ti.com>
Date: Mon, 5 Aug 2019 11:23:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190801113547.7460-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="kWA0e/wj";       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Hi Jan,

[..snip..]

> +static int arm_smmuv3_cell_init(struct cell *cell)
> +{
> +	struct jailhouse_iommu *iommu;
> +	struct arm_smmu_cmdq_ent cmd;
> +	int ret, i, j, sid;
> +
> +	if (!iommu_count_units())
> +		return 0;
> +
> +	iommu = &system_config->platform_info.arm.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
> +			continue;
> +
> +		for_each_stream_id(sid, cell->config, j) {
> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +	cmd.tlbi.vmid	= cell->config->id;
> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +	arm_smmu_cmdq_issue_sync(smmu);
> +
> +	return 0;
> +}
> +
> +static void arm_smmuv3_cell_exit(struct cell *cell)
> +{
> +	struct jailhouse_iommu *iommu;
> +	struct arm_smmu_cmdq_ent cmd;
> +	int i, j, sid;
> +

I missed the check for iommu_counts here. Can you take care while pushing or do
you want me to re post the series?

	if (!iommu_count_units())
		return 0;

> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
> +		iommu = &system_config->platform_info.arm.iommu_units[i];
> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
> +			continue;
> +
> +		for_each_stream_id(sid, cell->config, j) {
> +			arm_smmu_uninit_ste(&smmu[i], sid, cell->config->id);
> +		}
> +	}
> +
> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +	cmd.tlbi.vmid	= cell->config->id;
> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +	arm_smmu_cmdq_issue_sync(smmu);
> +}

Thanks and regards,
Lokesh

> +
> +static int arm_smmuv3_init(void)
> +{
> +	struct jailhouse_iommu *iommu;
> +	int ret, i;
> +
> +	iommu = &system_config->platform_info.arm.iommu_units[0];
> +	for (i = 0; i < iommu_count_units(); iommu++, i++) {
> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
> +			continue;
> +
> +		smmu[i].base = paging_map_device(iommu->base, iommu->size);
> +
> +		/* ToDo: irq allocation*/
> +
> +		ret = arm_smmu_device_init_features(&smmu[i]);
> +		if (ret)
> +			return ret;
> +
> +		ret = arm_smmu_init_structures(&smmu[i]);
> +		if (ret)
> +			return ret;
> +
> +		/* Reset the device */
> +		ret = arm_smmu_device_reset(&smmu[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return arm_smmuv3_cell_init(&root_cell);
> +}
> +
> +DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmuv3);
> +DEFINE_UNIT_SHUTDOWN_STUB(arm_smmuv3);
> +DEFINE_UNIT(arm_smmuv3, "ARM SMMU v3");
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4106eb52-b73f-cb70-bb85-ce7b1a882e11%40ti.com.
