Return-Path: <jailhouse-dev+bncBDAIL6M7XMEBBEEYR3UQKGQEADCNL6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2336285D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jul 2019 20:31:45 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id e16sf3855331lja.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 11:31:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562610705; cv=pass;
        d=google.com; s=arc-20160816;
        b=goCjVFTDC26c4iUUpg8HP2DX3vteOGeD/SNMo7pKcTVi7i5f5O0THsPWXhK5MwVmV5
         1fO7iG81P3i4NWHUEIdoHgK6jiTXOwCqj10N21n2Ft5Q3NK3BMJJyxpqZj48yVG3WMAj
         2MzzxI36lX/J9R1LWVVwYSq+w4PWCnpXJSFYwNWEyolU0ThcjHrLoPm7gTfQ412zwXhi
         iCTsPEeMA78jVysN6YtsIjDRJkUXubQOO7kfuaRKBqCU3gAr8IF2pbVQbmVOpeislaDH
         g5pwqSXJdMeApVbF/VglXUWB/4eBfpFTctlL1/vMP+8wEo1PmgBZ3KaZ511ICgd5FJkg
         qT1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature:dkim-signature;
        bh=A6uiJ9xyX0bsKQmYh9+S79SBduo5IUiBQ3UR1mNyNxY=;
        b=I68lHK7+cAv+YEqk3ka1QEegoaLQbOSg4lGo5hyXzdIzEGVMK84nrbktbmuVaW/mxK
         RUjPsvLmnCftLIjhBzCeZI64ekoLiU2zsKQHKyQctig3LdfHcb52nTkzPkdJufG6oWzU
         vGTc4R/YDJzJNp5Ds4Sa3zPNpIrdNA3MtJ+F9fLxpBfPX3SgxOQXliyQvX5qXdMpRUYw
         KrB3ZnEktHuodU1RgxXiA/i6cyNSus5zYNVCFdteXEpz0L8qCwZ91LL2pz6ZErxakMJX
         SXFzKW20scHCekgvMhdFyCswOvy49G4KLqWd8g58tk9Al/AkDaTWmM4u8ODE8OCR0xYK
         P4gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uv4IlIsI;
       spf=pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A6uiJ9xyX0bsKQmYh9+S79SBduo5IUiBQ3UR1mNyNxY=;
        b=eI0Q6rVJW6xQU0u1TQ6lUX+SQLUSGSv8TP0yaL/5eWE0c77oejJAEq3D2PaotmND74
         r+lwmVI657An61Q17z/GGv6gBnHINNcIEpxXuqrWh33YfIwwveFhEU7g5Kg7ukvfhCyj
         kW/r51tLS6fJSFXhKLI6pserdeA+MjBmn4fMPTVfblQyI4zcqnwWKplH0+q/6E9KTRzQ
         MSoZFXQ/fOFJcLXsI+cq1HiaLbdpEtWYHzDj+XUQ0rgcSCVgKfKvJerRRWsJYBb6YVw6
         +L7xNR6fNb3emCwd0cmUokV7idvdqh4gEkpT/Ss0F2ZEZLgSacq9rD75/mvpWa1HZZT8
         1vHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=A6uiJ9xyX0bsKQmYh9+S79SBduo5IUiBQ3UR1mNyNxY=;
        b=TV2gdYJvVkn9bIk8kqxxl6KX7QbP0d0O84TPwVgomYmtewMjM32SChdijD2ynHKLb2
         UGdwMMxlswGP6rc0tMuaLN57h/GQBOOEXpAA4AeVzTYIbRaP3p7CMKQmFlkOgYR1QjOi
         6mCtpHIFGy3JTwzSqXIe5b6gtSbDStjmXCtwdfdtbs5JGyHHK+V/I/JXGyoqVSdJRq8q
         +OzuuG1k1gmOAw3vPt8QI1CafJ893IM48yROHU1LZrcGT4q1NM1T+32BAH4P7pSCLVdQ
         Ufg9l2ec9Rf/YS9Co3lLpbylJTOk0/9jjDC9WmHsMYUwkGFcam6B7k183vW2737thJbC
         zmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A6uiJ9xyX0bsKQmYh9+S79SBduo5IUiBQ3UR1mNyNxY=;
        b=NrHcqwG1+JTDAQYMPTjFOGF8ftSghgoaxy59OuGHnWDC6eddLfGoAiRs7YLOx8wKYR
         dU38U9ap9zwQTDDUELaptxQuopNoH1gRTVUcPuinxs8UUETDY9CRoZw6KcVLYTFfmF3B
         xbQsvkR46ezoy3HkgY+LLkU2V1kAoz8MQHFbyPhR5cz7nvMqymmdiVOjl2MdExMGdS/h
         2IzX7qCfBAOCv9AdUltrJfCQYDCQLiVqXDNDk6tApn23UMgYk0m8AfnaAIwywPeg7PQX
         02RC+YZR/XVsN6TTcBFNwAJ33mGQxiyzGnBICgQixFKYGRnU+1SWPGPHgHFUCIJUJF1v
         CHZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUJ6IgPKn1LjpAXf79DALE5hk/XyyPzKEdHfHtIxONQxQ2gXa+6
	v0tlr3z/NPL7UGgbTEt/Q18=
X-Google-Smtp-Source: APXvYqzUm3AbYCdpVMuz6DfRkzelJwrE2R1OCOWg6BGwJ3zAkUR85kcNP+IbKXkbzNk1Ry8XbFfyWg==
X-Received: by 2002:ac2:4644:: with SMTP id s4mr46051lfo.158.1562610704827;
        Mon, 08 Jul 2019 11:31:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f715:: with SMTP id z21ls1315483lfe.9.gmail; Mon, 08 Jul
 2019 11:31:43 -0700 (PDT)
X-Received: by 2002:a19:914c:: with SMTP id y12mr7659347lfj.108.1562610703877;
        Mon, 08 Jul 2019 11:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562610703; cv=none;
        d=google.com; s=arc-20160816;
        b=doyRVoFv4zyAbGB58LccgXP6K24KAEzp2GJAw/iRGJAV/Xm6iOMBeY4V2sW731qzrx
         7pdlP6M8UZ5NSawLrQr2eAHmJVfwjM4ZyjII9h6zDvvOJa0PyOfBYvfkG/9DioLKGIei
         8cLap+3os1qMGvCytpIgYEdT8XajDDXw6GnbFrMUYtiERTPXBPXWTw9KhzPYJxfjfn16
         k2WLl4tq3DZCh1LXQC71FApTLEAw2JmSHjJVv0cggbAj0uKfPBk24W+/7XY/hmkLrgj4
         TVTQbv2pCHPH57nmWAKkt+iCQym5K6wwEl/tD02E8vKxvzNZTev4+2+pxC/ns0NBwcdE
         Gf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pVfBEkj1dx4vaTE7eYvB7XA1kSjSjGQTVIUgEgD+LDo=;
        b=Ha5sOANbRaWPsmk/TpnukqMe1NxpuxvV+KU4h222Jh6rC4cehM0hcMDk9c6VI5bkgR
         JrMhLWnlbNgGnfXbDRhyxBmbTJxsBRMm7/OsFZvyoI5U+X0dzY7MlBkurcmq64g9+FL2
         IRrazbpGL22RT8aOTeKRiMlrxbSwvD9Z1fTBdnX7fgtYMvrOXzIkH18QiGC/dxBJMWda
         tsMndA4AbO4jQbkafVNbVJgNNKvKFgcsaaEfmdyn3b3SGxxGgEdE7ACpoOcDdNGT/qP1
         dqdFcLqI80pghTyT/vPPiUXzGSs7wKoLltF1TpouwxpXgvszj5+oYlykOwVnbT8Ad7Xv
         x2ww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uv4IlIsI;
       spf=pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id q25si1120311lfp.0.2019.07.08.11.31.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jphilippe.brucker@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id 31so1443902wrm.1
        for <jailhouse-dev@googlegroups.com>; Mon, 08 Jul 2019 11:31:43 -0700 (PDT)
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr13160502wrt.182.1562610703094;
        Mon, 08 Jul 2019 11:31:43 -0700 (PDT)
Received: from [192.168.0.5] (cpc92304-cmbg19-2-0-cust820.5-4.cable.virginm.net. [82.24.199.53])
        by smtp.gmail.com with ESMTPSA id g12sm885569wrv.9.2019.07.08.11.31.41
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:31:42 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
 <20190705144225.7126-6-p-yadav1@ti.com>
From: Jean-philippe Brucker <jphilippe.brucker@gmail.com>
Message-ID: <d06d6e44-ec75-947c-c45a-0c36c5f63af6@gmail.com>
Date: Mon, 8 Jul 2019 19:31:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705144225.7126-6-p-yadav1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jphilippe.brucker@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Uv4IlIsI;       spf=pass
 (google.com: domain of jphilippe.brucker@gmail.com designates
 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=jphilippe.brucker@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Pratyush, Lokesh,

Nice work! Good to see new SMMUv3 support. I'm quite familiar with the
Linux driver and have a little time to spare, so I have a few comments below.

On 05/07/2019 15:42, 'Pratyush Yadav' via Jailhouse wrote:
[...]
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -0,0 +1,1120 @@
> +/*
> + * Jailhouse AArch64 support
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Authors:
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *  Pratyush Yadav <p-yadav1@ti.com>
> + *
> + * An emulated SMMU is presented to inmates by trapping access to MMIO
> + * registers to enable stage 1 translations. Accesses to the SMMU memory mapped
> + * registers are trapped and then routed to the emulated SMMU. This is not
> + * emulation in the sense that we fully emulate the device top to bottom. The
> + * emulation is used to provied an interface to the SMMU that the hypervisor

                           provide

> + * can control to make sure the inmates are not doing anything they should not.
> + * The actual translations are done by hardware.
> + *
> + * Emulation is needed because both stage 1 and stage 2 parameters are
> + * configured in a single data structure, the stream table entry. For this
> + * reason, the inmates can't be allowed to directly control the stream table
> + * entries, and by extension, the stream table.
> + *
> + * The guest cells are assigned stream IDs in their configs and only those
> + * assigned stream IDs can be used by the cells. There is no checking in place
> + * to make sure two cells do not use the same stream IDs. This must be taken
> + * care of when creating the cell configs.
> + *
> + * This driver is implemented based on the following assumptions:
> + * - Running on a Little endian 64 bit core compatible with ARM v8 architecture.
> + * - SMMU supporting only AARCH64 mode.
> + * - SMMU AARCH 64 stage 2 translation configurations are compatible with ARMv8
> + *   VMSA. So re using the translation tables of CPU for SMMU.
> + *
> + * This driver is loosely based on the Linux kernel SMMU v3 driver.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See the
> + * COPYING file in the top-level directory.
> + */
[...]
> +/*
> + * Stream table.
> + *
> + * Linear: Enough to cover 1 << IDR1.SIDSIZE entries
> + * 2lvl: 128k L1 entries,
> + *       256 lazy entries per table (each table covers a PCI bus)
> + */
> +#define STRTAB_L1_SZ_SHIFT		20
> +#define STRTAB_SPLIT			8
> +
> +#define STRTAB_L1_DESC_DWORDS		1
> +#define STRTAB_L1_DESC_SIZE		(STRTAB_L1_DESC_DWORDS << 3)
> +#define STRTAB_L1_DESC_SPAN		BIT_MASK(4, 0)
> +#define STRTAB_L1_DESC_L2PTR_MASK	BIT_MASK(51, 6)
> +
> +#define STRTAB_STE_DWORDS		8

nit: that could be
#define STRTAB_STE_DWORDS (1 << STRTAB_STE_DWORDS_BITS)

> +#define STRTAB_STE_DWORDS_BITS		3
> +#define STRTAB_STE_SIZE			(STRTAB_STE_DWORDS << 3)
> +#define STRTAB_STE_0_V			(1UL << 0)
> +#define STRTAB_STE_0_CFG		BIT_MASK(3, 1)
> +#define STRTAB_STE_0_CFG_ABORT		0
> +#define STRTAB_STE_0_CFG_BYPASS		4
> +#define STRTAB_STE_0_CFG_S1_TRANS	5
> +#define STRTAB_STE_0_CFG_S2_TRANS	6
> +#define STRTAB_STE_0_S1CTXPTR		BIT_MASK(51, 6)
> +#define STRTAB_STE_0_S1CDMAX		BIT_MASK(63, 59)
> +#define STRTAB_STE_1_S1DSS		BIT_MASK(1, 0)
> +#define STRTAB_STE_1_S1CIR		BIT_MASK(3, 2)
> +#define STRTAB_STE_1_S1COR		BIT_MASK(5, 4)
> +#define STRTAB_STE_1_S1CSH		BIT_MASK(7, 6)
> +#define STRTAB_STE_1_S1STALLD		(1UL << 27)
> +#define STRTAB_CTXDESC_DWORDS		8
> +#define STRTAB_CTXDESC_S1CTXPTR_SHIFT	6

STRTAB_STE_0_S1CTXPTR_SHIFT? But you already have S1CTXPTR above, so I'm
not sure these two lines are useful.

[...]

> +static bool queue_error(struct arm_smmu_queue *q)
> +{
> +	return mmio_read32(q->cons_reg) & 0x1;

This doesn't seem right, the error field in SMMU_CMDQ_CONS is at [30:24]
(CMDQ_CONS_ERR). You could also get the value from q->cons since you read
this after queue_sync_cons().

> +}
> +
> +static void queue_inc_prod(struct arm_smmu_queue *q)
> +{
> +	u32 shift = q->max_n_shift;
> +	u32 prod = (Q_WRP(q->prod, shift) | Q_IDX(q->prod, shift)) + 1;
> +
> +	q->prod = Q_OVF(q->prod) | Q_WRP(prod, shift) | Q_IDX(prod, shift);
> +	mmio_write32(q->prod_reg, q->prod);
> +}
> +
> +static void queue_write(__u64 *dst, __u64 *src, u32 n_dwords)
> +{
> +	int i;
> +
> +	for (i = 0; i < n_dwords; ++i)
> +		*dst++ = *src++;
> +	dsb(ish);

dsb(ishst) should be sufficient

> +}
> +
> +static __u64 *queue_entry(struct arm_smmu_queue *q)
> +{
> +	return q->base + (Q_IDX(q->prod, q->max_n_shift) * q->ent_dwords);
> +}
> +
> +static int queue_insert_raw(struct arm_smmu_queue *q, __u64 *ent)
> +{
> +	while (queue_full(q))
> +	{}

It seems like queue_full() only accesses the shadow version of cons and
prod, so I think you need a queue_sync_cons() in this loop. But given that
you drain the queue for each command below, queue_full() could only happen
if the queue is in error state, in which case this will loop indefinitely.

> +
> +	queue_write(queue_entry(q), ent, q->ent_dwords);
> +	queue_inc_prod(q);
> +	while (!queue_empty(q) && !queue_error(q)) {
> +		queue_sync_cons(q);
> +	}
> +	return 0;
> +}
> +
> +/* High-level queue accessors */
> +static int arm_smmu_cmdq_build_cmd(__u64 *cmd, struct arm_smmu_cmdq_ent *ent)
> +{
> +	u64 vmid = (u64)this_cell()->config->id;

A little redundant since you're setting ent->tlbi.vmid already.

> +	memset(cmd, 0, CMDQ_ENT_SIZE);
> +	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
> +
> +	switch (ent->opcode) {
> +	case CMDQ_OP_TLBI_EL2_ALL:
> +	case CMDQ_OP_TLBI_NSNH_ALL:
> +		break;
> +	case CMDQ_OP_PREFETCH_ADDR:
> +		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
> +		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
> +		/* Fallthrough */
> +	case CMDQ_OP_PREFETCH_CFG:
> +		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
> +		break;
> +	case CMDQ_OP_CFGI_STE:
> +		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
> +		break;
> +	case CMDQ_OP_CFGI_ALL:
> +		/* Cover the entire SID range */
> +		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
> +		break;
> +	case CMDQ_OP_TLBI_NH_VA:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
> +		break;
> +	case CMDQ_OP_TLBI_S2_IPA:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
> +		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> +		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
> +		break;
> +	case CMDQ_OP_TLBI_NH_ASID:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> +		/* Fallthrough */
> +	case CMDQ_OP_TLBI_S12_VMALL:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vmid);
> +		break;
> +	case CMDQ_OP_CMD_SYNC:
> +		if (ent->sync.msiaddr)
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
> +		else
> +			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		/*
> +		 * Commands are written little-endian, but we want the SMMU to
> +		 * receive MSIData, and thus write it back to memory, in CPU
> +		 * byte order, so big-endian needs an extra byteswap here.
> +		 */

The comment doesn't apply anymore, does it?

> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA, ent->sync.msidata);
> +		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
> +		break;
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, __u64 *cmd)
> +{
> +	struct arm_smmu_queue *q = &smmu->cmdq.q;
> +
> +	queue_insert_raw(q, cmd);

nit: you could drop queue_insert_raw() and insert its content here

> +}
> +
> +static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> +				    struct arm_smmu_cmdq_ent *ent)
> +{
> +	u64 cmd[CMDQ_ENT_DWORDS];
> +
> +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
> +		printk("WARN: SMMU ignoring unknown CMDQ opcode 0x%x\n",
> +			 ent->opcode);
> +		return;
> +	}
> +
> +	spin_lock(&smmu->cmdq.lock);
> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
> +	spin_unlock(&smmu->cmdq.lock);
> +}
> +
> +static void arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
> +{
> +	struct arm_smmu_cmdq_ent ent = { .opcode = CMDQ_OP_CMD_SYNC };
> +	u64 cmd[CMDQ_ENT_DWORDS];
> +
> +	arm_smmu_cmdq_build_cmd(cmd, &ent);
> +
> +	spin_lock(&smmu->cmdq.lock);
> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
> +	spin_unlock(&smmu->cmdq.lock);
> +}
> +
> +/* Stream table manipulation functions */
> +static void
> +arm_smmu_write_strtab_l1_desc(__u64 *dst, struct arm_smmu_strtab_l1_desc *desc)
> +{
> +	u64 val = 0;
> +
> +	val |= FIELD_PREP(STRTAB_L1_DESC_SPAN, desc->span);
> +	val |= desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
> +
> +	/* Assuming running on Little endian cpu */
> +	*dst = val;
> +	dsb(ish);

dsb(ishst)? It might be a good idea to add a small comment before each
memory barrier. I'm not sure what this one does for example, does it order
against the subsequent write to SMMU_STRTAB_BASE? If that's the case then
you could move the barrier closer to that write, so it doesn't have to be
done for each L1 descriptor.

> +}
> +
> +static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
> +{
> +	struct arm_smmu_cmdq_ent cmd = {
> +		.opcode	= CMDQ_OP_CFGI_STE,
> +		.cfgi	= {
> +			.sid	= sid,
> +			.leaf	= true,

You probably need leaf = false, because the SMMU could cache l1 stream
table descriptors. I think the Linux driver gets away with it because it
only modifies l1 descriptors before making the stream table visible to the
SMMU through SMMU_STRTAB_BASE (I haven't verified that claim).

> +		},
> +	};
> +
> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +	arm_smmu_cmdq_issue_sync(smmu);
> +}
> +
> +static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
> +				      __u64 *guest_ste, __u64 *dst,
> +				      bool bypass, u32 vmid)
> +{
> +	struct paging_structures *pg_structs = &this_cell()->arch.mm;
> +	u64 val = dst[0], vttbr, mask;
> +
> +	/* Bypass */
> +	if (bypass) {
> +		dst[0] = STRTAB_STE_0_V;

Hm, won't the "dst[0] = val" below clear V?

STE writes in this function might need a little more care. At this point
for example, the SMMU could issue C_BAD_STE events because the STE is
marked valid but is in inconsistent state. It might be best to do the same
as the Linux driver: ensure dst[0].V is clear, write dst[1-3] first, issue
a sync(), then write dst[0] in a single access.

> +		dsb(ish);
> +		val = FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
> +		dst[0] = val;
> +		dst[1] = FIELD_PREP(STRTAB_STE_1_SHCFG,
> +				    STRTAB_STE_1_SHCFG_INCOMING);
> +		dst[2] = vmid;
> +		dsb(ish);
> +		if (smmu) {
> +			arm_smmu_sync_ste_for_sid(smmu, sid);
> +		}
> +		return;
> +	}
> +
> +	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |

One more restriction on the hardware is that the VMID size used by the CPU
must be smaller or equal the size of the VMID supported by the SMMU. If
the CPU is using 16-bit VMID (TCR.VS == 1) but SMMU_IDR0.VMID16 == 0, then
setting the top VMID bits here is illegal.

> +		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
> +		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
> +		 STRTAB_STE_2_S2R;

> +
> +	vttbr = paging_hvirt2phys(pg_structs->root_table);
> +	dst[3] = vttbr & STRTAB_STE_3_S2TTB_MASK;
> +
> +	dst[0] |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
> +	dst[0] |= STRTAB_STE_0_V;

Here as well, it would be better to sync the rest of the STE, then write
dst[0] in a single access.

> +	dsb(ish);

Not sure that's needed, the Linux driver doesn't have a dsb() here

> +
> +	arm_smmu_sync_ste_for_sid(smmu, sid);
> +}
> +
> +static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nent; ++i) {
> +		arm_smmu_write_strtab_ent(NULL, -1, NULL, strtab, true,
> +					  (u32)this_cell()->config->id);
> +		strtab += STRTAB_STE_DWORDS;
> +	}
> +}
> +
> +static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
> +{
> +	void *strtab;
> +	u64 reg;
> +	u32 size;
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +
> +	size = (1 << smmu->sid_bits) * STRTAB_STE_SIZE;
> +	strtab = page_alloc_aligned(&mem_pool, PAGES(size));
> +	if (!strtab) {
> +		printk("ERROR: SMMU failed to allocate l1 stream table (%u bytes)\n",
> +		       size);
> +		return -ENOMEM;
> +	}
> +	cfg->strtab_dma = paging_hvirt2phys(strtab);
> +	cfg->strtab = strtab;
> +	cfg->num_l1_ents = 1 << smmu->sid_bits;
> +
> +	/* Configure strtab_base_cfg for a linear table covering all SIDs */
> +	reg  = FIELD_PREP(STRTAB_BASE_CFG_FMT, STRTAB_BASE_CFG_FMT_LINEAR);
> +	reg |= FIELD_PREP(STRTAB_BASE_CFG_LOG2SIZE, smmu->sid_bits);
> +	cfg->strtab_base_cfg = reg;
> +
> +	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
> +	return 0;
> +}
> +
> +static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	u32 size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
> +	void *strtab = smmu->strtab_cfg.strtab;
> +	unsigned int i;
> +
> +	cfg->l1_desc = page_alloc(&mem_pool, PAGES(size));
> +	if (!cfg->l1_desc) {
> +		printk("ERROR: SMMU failed to allocate l1 stream table desc\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < cfg->num_l1_ents; ++i) {
> +		memset(&cfg->l1_desc[i], 0, sizeof(*cfg->l1_desc));

I might be wrong, but I think pages obtained from mem_pool are initialized
to zero, so you don't need this.

> +		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[i]);
> +		cfg->l1_desc[i].active_stes = 0;

Already initialized to zero

> +		strtab += STRTAB_L1_DESC_SIZE;
> +	}
> +
> +	return 0;
> +}

[...]
> +static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
> +				   struct arm_smmu_queue *q,
> +				   unsigned long prod_off,
> +				   unsigned long cons_off,
> +				   unsigned long dwords)
> +{
> +	/* Queue size is capped to 4K. So allocate 1 page */
> +	q->base = page_alloc(&mem_pool, 1);
> +	if (!q->base) {
> +		printk("ERROR: SMMU failed to allocate queue\n");
> +		return -ENOMEM;
> +	}
> +	q->base_dma = paging_hvirt2phys(q->base);;

(nit: ;;)

[...]
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +	u32 reg, enables;
> +	struct arm_smmu_cmdq_ent cmd;
> +
> +	/* Clear CR0 and sync (disables SMMU and queue processing) */
> +	reg = mmio_read32(smmu->base + ARM_SMMU_CR0);
> +	if (reg & CR0_SMMUEN)
> +		printk("ERROR: SMMU currently enabled! Resetting...\n");

I'm guessing the SMMU is disabled in the root cell before we enable jailhouse?

[...]

> +static void arm_smmu_uninit_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
> +{
> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
> +	struct arm_smmu_strtab_l1_desc *desc;
> +	void *strtab;
> +	u32 size;
> +
> +	desc = &cfg->l1_desc[sid >> STRTAB_SPLIT];
> +
> +	desc->active_stes--;
> +	if (desc->active_stes)
> +		return;
> +
> +	size = 1 << (STRTAB_SPLIT + STRTAB_STE_DWORDS_BITS + 3);
> +	page_free(&mem_pool, desc->l2ptr, PAGES(size));

Might be safer to free the page after clearing the l1_desc and issuing a
CMDQ_CFGI_STE? Here the SMMU can still access the page.

> +	desc->l2ptr = NULL;
> +	desc->l2ptr_dma = 0;
> +	desc->span = 0;
> +	strtab = &cfg->strtab[(sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS];
> +	arm_smmu_write_strtab_l1_desc(strtab, desc);
> +
> +	return;

nit: not needed

[...]
> +static int arm_smmuv3_cell_init(struct cell *cell)
> +{
> +	struct jailhouse_iommu *iommu;
> +	struct arm_smmu_cmdq_ent cmd;
> +	int ret, i, j, sid;
> +
> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
> +		iommu = &system_config->platform_info.arm.iommu_units[i];
> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
> +			continue;
> +
> +		for_each_stream_id(sid, cell->config, j) {
> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
> +			if (ret) {arch_paging_flush_page_tlbs
> +				printk("ERROR: SMMU INIT ste failed: sid = %d\n",
> +				       sid);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +	cmd.tlbi.vmid	= cell->config->id;
> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +	arm_smmu_cmdq_issue_sync(smmu);

By the way, shouldn't there be a CMDQ_OP_TLBI_S2_IPA whenever we do
arch_paging_flush_page_tlbs() on the CPU side?

Thanks,
Jean

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d06d6e44-ec75-947c-c45a-0c36c5f63af6%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
