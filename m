Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBB7M6SHUQKGQE5BFKWHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E9632D2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 10:25:36 +0200 (CEST)
Received: by mail-pg1-x53e.google.com with SMTP id t19sf12234112pgh.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 01:25:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562660734; cv=pass;
        d=google.com; s=arc-20160816;
        b=NJdt4pxgddPprg4KMCKluJVQDkim00jKJzhO93B/9Uc2GRUNW/osfOQ+r/IHy0vG6I
         IhMoBqplYh+QpMzygMHflk5gb4ZzUj695B3avIgXhXJ6QOOPv6K8XaCBjDIHMgvObCko
         1iqY1/kuFFHHaw70kd+jdsgWE8i647jdLkc37VK1HXj6DdOqbPD6KzFgd/Uq52Y+GrkE
         o2Q/kdbhPHQhewlprJHw65r9SFaoJwSso0UHxoT1daKq2Al0USn+0I25K/WAt+vO+TIC
         EnesZdXeDZzXjOZehrXUPquR1nLz+wwyKsuUYyh3Tp2PEcsUnbelX7SbkWW7uzQOL+Kl
         qEXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=/UMfsDzwdOQDryYzucuubB72mtrM6/P7eIIRBH5NUgY=;
        b=YSDiBDGbdQEBFy2V+6oBnEXGd5Z2rlDvyxr1sl1haLx9n9NnyTsH+HFd3CN/iCcCMs
         OII7wwoTWZNj3ykPv0Kan9IEPKRxauy0gui+glkZFfvaiGpjyJxX/8fhxLENmYqdQQ/n
         0ASVoRKxsLGhWrxZLZbToQDbiMPJTzjTxaIC1e/T/8q5cs8s0ouDXZkENzpYKWChXPTp
         IwOeW44i/XOOdDggsiwIk8fG1mQrYPMR+TGCR2fnzD25BuSthYu5BBcjA/oTjeqBhTlg
         lDMIUuGWyTYSFgdNhuw3Mj6Y74eO5PhyGbWJ+kTYImWBE1W5d9J19KqnC/NT5shWtp0V
         EkqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Sk3N9oaZ;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=/UMfsDzwdOQDryYzucuubB72mtrM6/P7eIIRBH5NUgY=;
        b=SZHrg3bGF+OKJKh4UjIkD5DC3KeLfdCjAEVJxkBKvrVjtczSFtN1lYRmqVAutkG+Ia
         TDySYXA09WmIAUHZIBSpRIam6VEsSe/6fyZdgrfldEw94nz3SWPDWsV2YPiBEaiUCde3
         zhnHQ6qtEAsjejX6GEVk/iSWhZDR0b6Te6mW6cAZdO/HfsgzP7/JS1A7a80GGJVuezn5
         l70brRccpm81rXGmL6N1GP3vR0Y+AkLi2ZE82zLDrhUTQM5cCjd1q6lD5YVZohgP3af9
         q6ux890oNknFZTFJXyP7Vw+BsjxxorQL9ylJ3kCUEYCY6DnX3hsRicM7Q+96bw0su7Jt
         xnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/UMfsDzwdOQDryYzucuubB72mtrM6/P7eIIRBH5NUgY=;
        b=q3q9d62pDNNG/6ieXnIvT5NKeH/Tx8pj7GVRI/QGrOJFnSZWVzNL/YaY9Y75dPyW6z
         g2e1y12+VzBzpZPzfgW5q6cczHb9+SJEhp7JuCUHFkOh0HwXu6PmfPH1rOy+FNNmkSe+
         zvnF9ieIWtSJ7Jq3jOP4rVHX+1meo34EGmyHSZuJ3HC4HZ7Ih8Bb6vbGwM6Tk/xcXWt7
         EhpHsuhnEXiA5YMQ5Z8rwPApLoxKGenBiHSTx8vgUEgsJMJWZbpJHqK9IFvEOH2GPwMR
         2ZqOW7OZvmPaLyedCuq0nDnIcTy5/z05yyMG90l6VCPfM4AteJV7HGx6grcnkvW6M6Ft
         NKkA==
X-Gm-Message-State: APjAAAWemGqhGpncKyoPG3M6AYsPSD/xZROqLRZk6rCfOonQGlaDYflX
	IodyTEpQenWNd+AI47D3qVU=
X-Google-Smtp-Source: APXvYqxyA7fxZ4BXt0v//LJmG6x2Mt6pyYCXrfr8g/Zg38bYjQgb2c6X5SfJCRxyWW4R+cdd5NSDgw==
X-Received: by 2002:a17:902:29e6:: with SMTP id h93mr29097544plb.297.1562660734084;
        Tue, 09 Jul 2019 01:25:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:c108:: with SMTP id w8ls3386705pgf.5.gmail; Tue, 09 Jul
 2019 01:25:33 -0700 (PDT)
X-Received: by 2002:a65:5cca:: with SMTP id b10mr29709811pgt.365.1562660733281;
        Tue, 09 Jul 2019 01:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562660733; cv=none;
        d=google.com; s=arc-20160816;
        b=V1KT3gcGkKOoYA3t7q0hZzm1vPK9cuBAPX51KcS8Wn74kl7/s7hhk9smhfPjJAJAdg
         hql6/RidTKjNgBQVGmSd3uyNe/ruvYJIH6OagS65Ji9fP2OH+2OKu+5kSHZCZQKVpNGw
         ICW0xaa5fwstjRl8m7P+h2xGYn1wzrPChewFH3a2Bn00b57sU8EuBhWIyNfVu+LQeBi5
         Iu8ToB/fTdVFpeMubRj0sMajFV8zw0DFquKS8V8dGVU0vggpQh9KX0D95rBk8D5I9/SF
         R0uh/97k3JBNM2azeSUnkUOs64O+EUjuC3YJdFiMtCBkFOQyOY7lU5NlnsN2RqashbyM
         O07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=56zzZk+wQWzZXkAzL9pFQS6bQc9fa+rkt2XCS50zd3g=;
        b=RX0s4m/6WKgHysN6SVYynjbLWlaJMTfTc3+RQxlfNXgaMVqLFlzaiELyIXvUwPWVB/
         aciOKUFYMyb59ixoR4PuljU2FqrBvIrD9/dQwcic9wvkBzcJfu2DFK8u0XPkDkrdbtMl
         g3Vyi9d0LuvEc/ugU5p0J0vRI713O2npDJCDAjQt1hOwO7M537dAtgA3OkMtCV4tCpYk
         PUTcYPxuFncrilBIAWWydxx6YBTy4FGGwFv0qaejPo0d0bHeyYH2wViq7NG0k4j7Rihy
         pQUmE8GF9M+QI05NQTg0SA6VPa0Cx8EhuOYjvLpMk4wAKt+t2h3duHyURDZdzSN1Ol6L
         ZbUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Sk3N9oaZ;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id w72si933548pfd.2.2019.07.09.01.25.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 01:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x698PW4I050706;
	Tue, 9 Jul 2019 03:25:32 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x698PW9h095228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 03:25:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 03:25:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 03:25:31 -0500
Received: from [172.24.190.58] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x698PSEN110783;
	Tue, 9 Jul 2019 03:25:29 -0500
Subject: Re: [PATCH v2 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Jean-philippe Brucker <jphilippe.brucker@gmail.com>,
        <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
 <20190705144225.7126-6-p-yadav1@ti.com>
 <d06d6e44-ec75-947c-c45a-0c36c5f63af6@gmail.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <1034733d-6a9a-9949-4a52-f6a4722bdeec@ti.com>
Date: Tue, 9 Jul 2019 13:55:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d06d6e44-ec75-947c-c45a-0c36c5f63af6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Sk3N9oaZ;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 09/07/19 12:01 AM, Jean-philippe Brucker wrote:
> Hi Pratyush, Lokesh,
> 
> Nice work! Good to see new SMMUv3 support. I'm quite familiar with the
> Linux driver and have a little time to spare, so I have a few comments below.

Thanks for the review Jean. Replies inline.

Jan,

If you have any further comments, let me know. Otherwise I'll send a v3
addressing Jean's comments. Also, please review the stage 1 emulation
patch as well.

> On 05/07/2019 15:42, 'Pratyush Yadav' via Jailhouse wrote:
> [...]
>> +++ b/hypervisor/arch/arm64/smmu-v3.c
>> @@ -0,0 +1,1120 @@
>> +/*
>> + * Jailhouse AArch64 support
>> + *
>> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>> + *
>> + * Authors:
>> + *  Lokesh Vutla <lokeshvutla@ti.com>
>> + *  Pratyush Yadav <p-yadav1@ti.com>
>> + *
>> + * An emulated SMMU is presented to inmates by trapping access to MMIO
>> + * registers to enable stage 1 translations. Accesses to the SMMU memory mapped
>> + * registers are trapped and then routed to the emulated SMMU. This is not
>> + * emulation in the sense that we fully emulate the device top to bottom. The
>> + * emulation is used to provied an interface to the SMMU that the hypervisor
> 
>                            provide

Fixed.

>> + * can control to make sure the inmates are not doing anything they should not.
>> + * The actual translations are done by hardware.
>> + *
>> + * Emulation is needed because both stage 1 and stage 2 parameters are
>> + * configured in a single data structure, the stream table entry. For this
>> + * reason, the inmates can't be allowed to directly control the stream table
>> + * entries, and by extension, the stream table.
>> + *
>> + * The guest cells are assigned stream IDs in their configs and only those
>> + * assigned stream IDs can be used by the cells. There is no checking in place
>> + * to make sure two cells do not use the same stream IDs. This must be taken
>> + * care of when creating the cell configs.
>> + *
>> + * This driver is implemented based on the following assumptions:
>> + * - Running on a Little endian 64 bit core compatible with ARM v8 architecture.
>> + * - SMMU supporting only AARCH64 mode.
>> + * - SMMU AARCH 64 stage 2 translation configurations are compatible with ARMv8
>> + *   VMSA. So re using the translation tables of CPU for SMMU.
>> + *
>> + * This driver is loosely based on the Linux kernel SMMU v3 driver.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.  See the
>> + * COPYING file in the top-level directory.
>> + */
> [...]
>> +/*
>> + * Stream table.
>> + *
>> + * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
>> + * 2lvl: 128k L1 entries,
>> + *       256 lazy entries per table (each table covers a PCI bus)
>> + */
>> +#define STRTAB_L1_SZ_SHIFT		20
>> +#define STRTAB_SPLIT			8
>> +
>> +#define STRTAB_L1_DESC_DWORDS		1
>> +#define STRTAB_L1_DESC_SIZE		(STRTAB_L1_DESC_DWORDS << 3)
>> +#define STRTAB_L1_DESC_SPAN		BIT_MASK(4, 0)
>> +#define STRTAB_L1_DESC_L2PTR_MASK	BIT_MASK(51, 6)
>> +
>> +#define STRTAB_STE_DWORDS		8
> 
> nit: that could be
> #define STRTAB_STE_DWORDS (1 << STRTAB_STE_DWORDS_BITS)

Done.

>> +#define STRTAB_STE_DWORDS_BITS		3
>> +#define STRTAB_STE_SIZE			(STRTAB_STE_DWORDS << 3)
>> +#define STRTAB_STE_0_V			(1UL << 0)
>> +#define STRTAB_STE_0_CFG		BIT_MASK(3, 1)
>> +#define STRTAB_STE_0_CFG_ABORT		0
>> +#define STRTAB_STE_0_CFG_BYPASS		4
>> +#define STRTAB_STE_0_CFG_S1_TRANS	5
>> +#define STRTAB_STE_0_CFG_S2_TRANS	6
>> +#define STRTAB_STE_0_S1CTXPTR		BIT_MASK(51, 6)
>> +#define STRTAB_STE_0_S1CDMAX		BIT_MASK(63, 59)
>> +#define STRTAB_STE_1_S1DSS		BIT_MASK(1, 0)
>> +#define STRTAB_STE_1_S1CIR		BIT_MASK(3, 2)
>> +#define STRTAB_STE_1_S1COR		BIT_MASK(5, 4)
>> +#define STRTAB_STE_1_S1CSH		BIT_MASK(7, 6)
>> +#define STRTAB_STE_1_S1STALLD		(1UL << 27)
>> +#define STRTAB_CTXDESC_DWORDS		8
>> +#define STRTAB_CTXDESC_S1CTXPTR_SHIFT	6
> 
> STRTAB_STE_0_S1CTXPTR_SHIFT? But you already have S1CTXPTR above, so I'm
> not sure these two lines are useful.

They aren't. This define was left in as something else I was doing while
trying to figure stage 1 emulation out. Removed.

> [...]
> 
>> +static bool queue_error(struct arm_smmu_queue *q)
>> +{
>> +	return mmio_read32(q->cons_reg) & 0x1;
> 
> This doesn't seem right, the error field in SMMU_CMDQ_CONS is at [30:24]
> (CMDQ_CONS_ERR). You could also get the value from q->cons since you read
> this after queue_sync_cons().

Hm, this doesn't seem right to me either. Not sure why it was added
especially with the hard-coded 0x1. Probably an artifact left over from
debugging.

Anyway, reading CMDQ_CONS_ERR to check if an error happened is not the
correct behavior either. The spec says the value is UNKNOWN when
CMDQ_ERR global error is not active. So we should be reading
SMMU_GERROR.CMDQ_ERR instead.

Will fix.

>> +}
>> +
>> +static void queue_inc_prod(struct arm_smmu_queue *q)
>> +{
>> +	u32 shift = q->max_n_shift;
>> +	u32 prod = (Q_WRP(q->prod, shift) | Q_IDX(q->prod, shift)) + 1;
>> +
>> +	q->prod = Q_OVF(q->prod) | Q_WRP(prod, shift) | Q_IDX(prod, shift);
>> +	mmio_write32(q->prod_reg, q->prod);
>> +}
>> +
>> +static void queue_write(__u64 *dst, __u64 *src, u32 n_dwords)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < n_dwords; ++i)
>> +		*dst++ = *src++;
>> +	dsb(ish);
> 
> dsb(ishst) should be sufficient

Will fix here and in all other cases.

>> +}
>> +
>> +static __u64 *queue_entry(struct arm_smmu_queue *q)
>> +{
>> +	return q->base + (Q_IDX(q->prod, q->max_n_shift) * q->ent_dwords);
>> +}
>> +
>> +static int queue_insert_raw(struct arm_smmu_queue *q, __u64 *ent)
>> +{
>> +	while (queue_full(q))
>> +	{}
> 
> It seems like queue_full() only accesses the shadow version of cons and
> prod, so I think you need a queue_sync_cons() in this loop. But given that
> you drain the queue for each command below, queue_full() could only happen
> if the queue is in error state, in which case this will loop indefinitely.

I'll sync the consumer in the body of the loop, just in case there is a
change in the future that doesn't drain the queue.

Also, why would queue_full() happen when the queue is in error state? In
that function, we don't check the error code, only the write index and
wrap. AFAIK, neither of those are affected when an error is active.

So we should also add queue_error() check here, correct?

>> +
>> +	queue_write(queue_entry(q), ent, q->ent_dwords);
>> +	queue_inc_prod(q);
>> +	while (!queue_empty(q) && !queue_error(q)) {
>> +		queue_sync_cons(q);
>> +	}
>> +	return 0;
>> +}
>> +
>> +/* High-level queue accessors */
>> +static int arm_smmu_cmdq_build_cmd(__u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>> +{
>> +	u64 vmid = (u64)this_cell()->config->id;
> 
> A little redundant since you're setting ent->tlbi.vmid already.

Removed.

>> +	memset(cmd, 0, CMDQ_ENT_SIZE);
>> +	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
>> +
>> +	switch (ent->opcode) {
>> +	case CMDQ_OP_TLBI_EL2_ALL:
>> +	case CMDQ_OP_TLBI_NSNH_ALL:
>> +		break;
>> +	case CMDQ_OP_PREFETCH_ADDR:
>> +		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
>> +		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
>> +		/* Fallthrough */
>> +	case CMDQ_OP_PREFETCH_CFG:
>> +		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
>> +		break;
>> +	case CMDQ_OP_CFGI_STE:
>> +		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>> +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>> +		break;
>> +	case CMDQ_OP_CFGI_ALL:
>> +		/* Cover the entire SID range */
>> +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>> +		break;
>> +	case CMDQ_OP_TLBI_NH_VA:
>> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>> +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
>> +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
>> +		break;
>> +	case CMDQ_OP_TLBI_S2_IPA:
>> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
>> +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
>> +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
>> +		break;
>> +	case CMDQ_OP_TLBI_NH_ASID:
>> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>> +		/* Fallthrough */
>> +	case CMDQ_OP_TLBI_S12_VMALL:
>> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
>> +		break;
>> +	case CMDQ_OP_CMD_SYNC:
>> +		if (ent->sync.msiaddr)
>> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
>> +		else
>> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
>> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
>> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
>> +		/*
>> +		 * Commands are written little-endian, but we want the SMMU to
>> +		 * receive MSIData, and thus write it back to memory, in CPU
>> +		 * byte order, so big-endian needs an extra byteswap here.
>> +		 */
> 
> The comment doesn't apply anymore, does it?

Why not? I'm guessing it's because the driver is written with the
assumption it is running on a little endian core.

In that case, yes, it does not apply. This was taken verbatim from the
Linux driver, so probably why this comment stayed around.

>> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA, ent->sync.msidata);
>> +		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>> +		break;
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, __u64 *cmd)
>> +{
>> +	struct arm_smmu_queue *q = &smmu->cmdq.q;
>> +
>> +	queue_insert_raw(q, cmd);
> 
> nit: you could drop queue_insert_raw() and insert its content here

Done.

>> +}
>> +
>> +static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>> +				    struct arm_smmu_cmdq_ent *ent)
>> +{
>> +	u64 cmd[CMDQ_ENT_DWORDS];
>> +
>> +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
>> +		printk("WARN: SMMU ignoring unknown CMDQ opcode 0x%x\n",
>> +			 ent->opcode);
>> +		return;
>> +	}
>> +
>> +	spin_lock(&smmu->cmdq.lock);
>> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
>> +	spin_unlock(&smmu->cmdq.lock);
>> +}
>> +
>> +static void arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> +{
>> +	struct arm_smmu_cmdq_ent ent = { .opcode = CMDQ_OP_CMD_SYNC };
>> +	u64 cmd[CMDQ_ENT_DWORDS];
>> +
>> +	arm_smmu_cmdq_build_cmd(cmd, &ent);
>> +
>> +	spin_lock(&smmu->cmdq.lock);
>> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
>> +	spin_unlock(&smmu->cmdq.lock);
>> +}
>> +
>> +/* Stream table manipulation functions */
>> +static void
>> +arm_smmu_write_strtab_l1_desc(__u64 *dst, struct arm_smmu_strtab_l1_desc *desc)
>> +{
>> +	u64 val = 0;
>> +
>> +	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, desc->span);
>> +	val |= desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>> +
>> +	/* Assuming running on Little endian cpu */
>> +	*dst = val;
>> +	dsb(ish);
> 
> dsb(ishst)? It might be a good idea to add a small comment before each
> memory barrier. I'm not sure what this one does for example, does it order
> against the subsequent write to SMMU_STRTAB_BASE? If that's the case then
> you could move the barrier closer to that write, so it doesn't have to be
> done for each L1 descriptor.

The idea was to have a data barrier whenever there was any updates to
any of the data structures that the SMMU uses.

Since someone is likely to invalidate the L1 descriptor (though we don't
do it right now, we should), it makes sense to be sure the write went
through before telling the SMMU to read it back.

>> +}
>> +
>> +static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
>> +{
>> +	struct arm_smmu_cmdq_ent cmd = {
>> +		.opcode	= CMDQ_OP_CFGI_STE,
>> +		.cfgi	= {
>> +			.sid	= sid,
>> +			.leaf	= true,
> 
> You probably need leaf = false, because the SMMU could cache l1 stream
> table descriptors. I think the Linux driver gets away with it because it
> only modifies l1 descriptors before making the stream table visible to the
> SMMU through SMMU_STRTAB_BASE (I haven't verified that claim).

Hm, I don't think the Linux driver only modifies L1 descriptors before
making the stream table visible to the SMMU.

arm_smmu_add_device() calls arm_smmu_init_l2_strtab() which modifies the
L1 descriptor. Since a device can be added after the SMMU is
initialised, the Linux driver makes changes to L1 descriptors after the
SMMU is up and the stream table is visible.

Either way, we should be invalidating the L1 descriptors when we
actually update them. And the best place for that would be
arm_smmu_write_strtab_l1_desc().

Unfortunately, I don't think there is a command to invalidate just a L1
descriptor. So we'll probably have to hack around it by invalidating the
first STE for the L1 descriptor with leaf = false.

Any better ideas?

>> +		},
>> +	};
>> +
>> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> +	arm_smmu_cmdq_issue_sync(smmu);
>> +}
>> +
>> +static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
>> +				      __u64 *guest_ste, __u64 *dst,
>> +				      bool bypass, u32 vmid)
>> +{
>> +	struct paging_structures *pg_structs = &this_cell()->arch.mm;
>> +	u64 val = dst[0], vttbr, mask;
>> +
>> +	/* Bypass */
>> +	if (bypass) {
>> +		dst[0] = STRTAB_STE_0_V;
> 
> Hm, won't the "dst[0] = val" below clear V?

Yes it will. This probably got messed up in a bit of last-minute
refactoring I did. Fixed.

> STE writes in this function might need a little more care. At this point
> for example, the SMMU could issue C_BAD_STE events because the STE is
> marked valid but is in inconsistent state. It might be best to do the same
> as the Linux driver: ensure dst[0].V is clear, write dst[1-3] first, issue
> a sync(), then write dst[0] in a single access.

All right. The next patch also touches this function. That will need
fixing too.

>> +		dsb(ish);
>> +		val = FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
>> +		dst[0] = val;
>> +		dst[1] = FIELD_PREP(STRTAB_STE_1_SHCFG,
>> +				    STRTAB_STE_1_SHCFG_INCOMING);
>> +		dst[2] = vmid;
>> +		dsb(ish);
>> +		if (smmu) {
>> +			arm_smmu_sync_ste_for_sid(smmu, sid);
>> +		}
>> +		return;
>> +	}
>> +
>> +	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
> 
> One more restriction on the hardware is that the VMID size used by the CPU
> must be smaller or equal the size of the VMID supported by the SMMU. If
> the CPU is using 16-bit VMID (TCR.VS == 1) but SMMU_IDR0.VMID16 == 0, then
> setting the top VMID bits here is illegal.

We're pulling the VMID from cell->config->id, which is the cell id. This
is a linearly allocated number, so you'd need at least 257 cells to set
any of the top bits. In case of Jailhouse, that would mean at least 257
CPUs. I don't think anyone is using Jailhouse with 256+ CPUs, so this is
not a big problem for now.

And say we do overflow. Say we do have more than 257 cells running. What
do you set the VMID to then? You can't wrap the value back because that
would conflict with another cell. The only course then would be to
terminate the cell, or not use the SMMU for it at all.

Not using the SMMU could work, but it means there would be complications
when the cell expects stage 1 translations.

Again, to me it looks like a problem that is not likely to occur. Jan,
your thoughts about it?

>> +		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
>> +		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>> +		 STRTAB_STE_2_S2R;
> 
>> +
>> +	vttbr = paging_hvirt2phys(pg_structs->root_table);
>> +	dst[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
>> +
>> +	dst[0] |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>> +	dst[0] |= STRTAB_STE_0_V;
> 
> Here as well, it would be better to sync the rest of the STE, then write
> dst[0] in a single access.

Will fix.

>> +	dsb(ish);
> 
> Not sure that's needed, the Linux driver doesn't have a dsb() here

Why not? Do you not want to make sure the writes actually go through
before you sync the STE?

>> +
>> +	arm_smmu_sync_ste_for_sid(smmu, sid);
>> +}
>> +
>> +static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < nent; ++i) {
>> +		arm_smmu_write_strtab_ent(NULL, -1, NULL, strtab, true,
>> +					  (u32)this_cell()->config->id);
>> +		strtab += STRTAB_STE_DWORDS;
>> +	}
>> +}
>> +
>> +static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
>> +{
>> +	void *strtab;
>> +	u64 reg;
>> +	u32 size;
>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>> +
>> +	size = (1 << smmu->sid_bits) * STRTAB_STE_SIZE;
>> +	strtab = page_alloc_aligned(&mem_pool, PAGES(size));
>> +	if (!strtab) {
>> +		printk("ERROR: SMMU failed to allocate l1 stream table (%u bytes)\n",
>> +		       size);
>> +		return -ENOMEM;
>> +	}
>> +	cfg->strtab_dma = paging_hvirt2phys(strtab);
>> +	cfg->strtab = strtab;
>> +	cfg->num_l1_ents = 1 << smmu->sid_bits;
>> +
>> +	/* Configure strtab_base_cfg for a linear table covering all SIDs */
>> +	reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_LINEAR);
>> +	reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
>> +	cfg->strtab_base_cfg = reg;
>> +
>> +	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
>> +	return 0;
>> +}
>> +
>> +static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>> +{
>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>> +	u32 size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
>> +	void *strtab = smmu->strtab_cfg.strtab;
>> +	unsigned int i;
>> +
>> +	cfg->l1_desc = page_alloc(&mem_pool, PAGES(size));
>> +	if (!cfg->l1_desc) {
>> +		printk("ERROR: SMMU failed to allocate l1 stream table desc\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	for (i = 0; i < cfg->num_l1_ents; ++i) {
>> +		memset(&cfg->l1_desc[i], 0, sizeof(*cfg->l1_desc));
> 
> I might be wrong, but I think pages obtained from mem_pool are initialized
> to zero, so you don't need this.

Yes, mem_pool uses the flag PAGE_SCRUB_ON_FREE (which means pages
obtained from mem_pool will be zeroed out on free), but it is not
documented anywhere that pages allocated via mem_pool will be zeroed
out. I'd rather stay on the safer side here.

>> +		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[i]);
>> +		cfg->l1_desc[i].active_stes = 0;
> 
> Already initialized to zero

Fixed.

>> +		strtab += STRTAB_L1_DESC_SIZE;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> [...]
>> +static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>> +				   struct arm_smmu_queue *q,
>> +				   unsigned long prod_off,
>> +				   unsigned long cons_off,
>> +				   unsigned long dwords)
>> +{
>> +	/* Queue size is capped to 4K. So allocate 1 page */
>> +	q->base = page_alloc(&mem_pool, 1);
>> +	if (!q->base) {
>> +		printk("ERROR: SMMU failed to allocate queue\n");
>> +		return -ENOMEM;
>> +	}
>> +	q->base_dma = paging_hvirt2phys(q->base);;
> 
> (nit: ;;)

Fixed.

> [...]
>> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>> +{
>> +	int ret;
>> +	u32 reg, enables;
>> +	struct arm_smmu_cmdq_ent cmd;
>> +
>> +	/* Clear CR0 and sync (disables SMMU and queue processing) */
>> +	reg = mmio_read32(smmu->base + ARM_SMMU_CR0);
>> +	if (reg & CR0_SMMUEN)
>> +		printk("ERROR: SMMU currently enabled! Resetting...\n");
> 
> I'm guessing the SMMU is disabled in the root cell before we enable jailhouse?

If you want stage 2 only, it is. But if you want stage 1 + 2, you need
to enable it in Linux on boot so any devices that need to go through the
SMMU are properly initialized.

Then when Jailhouse comes up, we need to reset it.

> [...]
> 
>> +static void arm_smmu_uninit_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>> +{
>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>> +	struct arm_smmu_strtab_l1_desc *desc;
>> +	void *strtab;
>> +	u32 size;
>> +
>> +	desc = &cfg->l1_desc[sid >> STRTAB_SPLIT];
>> +
>> +	desc->active_stes--;
>> +	if (desc->active_stes)
>> +		return;
>> +
>> +	size = 1 << (STRTAB_SPLIT + STRTAB_STE_DWORDS_BITS + 3);
>> +	page_free(&mem_pool, desc->l2ptr, PAGES(size));
> 
> Might be safer to free the page after clearing the l1_desc and issuing a
> CMDQ_CFGI_STE? Here the SMMU can still access the page.

This function is only called during cell_exit(). Will the SMMU have any
transactions while a cell is exiting?

>> +	desc->l2ptr = NULL;
>> +	desc->l2ptr_dma = 0;
>> +	desc->span = 0;
>> +	strtab = &cfg->strtab[(sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS];
>> +	arm_smmu_write_strtab_l1_desc(strtab, desc);
>> +
>> +	return;
> 
> nit: not needed

Fixed.

> [...]
>> +static int arm_smmuv3_cell_init(struct cell *cell)
>> +{
>> +	struct jailhouse_iommu *iommu;
>> +	struct arm_smmu_cmdq_ent cmd;
>> +	int ret, i, j, sid;
>> +
>> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
>> +		iommu = &system_config->platform_info.arm.iommu_units[i];
>> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
>> +			continue;
>> +
>> +		for_each_stream_id(sid, cell->config, j) {
>> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
>> +			if (ret) {arch_paging_flush_page_tlbs
>> +				printk("ERROR: SMMU INIT ste failed: sid = %d\n",
>> +				       sid);
>> +				return ret;
>> +			}
>> +		}
>> +	}
>> +
>> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
>> +	cmd.tlbi.vmid	= cell->config->id;
>> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> +	arm_smmu_cmdq_issue_sync(smmu);
> 
> By the way, shouldn't there be a CMDQ_OP_TLBI_S2_IPA whenever we do
> arch_paging_flush_page_tlbs() on the CPU side?

I don't think so. Firstly, arch_paging_flush_page_tlbs() is called only
for changes to hypervisor paging structs. Right now, the hypervisor does
not use the SMMU at all. It is only for guest use.

And the guest memory mappings are static and will remain constant from
start till exit. So we should only need to flush these entries when
starting a cell (which we do), and when exiting a cell.

This makes me realise, we should be calling CMDQ_OP_TLBI_S12_VMALL on
cell_exit() too.

> Thanks,
> Jean
> 

-- 
Regards,
Pratyush Yadav

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1034733d-6a9a-9949-4a52-f6a4722bdeec%40ti.com.
For more options, visit https://groups.google.com/d/optout.
