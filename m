Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZVY23UQKGQEGWUQOVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C846FEA4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 13:22:14 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id f24sf3559859lfk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 04:22:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563794534; cv=pass;
        d=google.com; s=arc-20160816;
        b=jL5xz4XJG7/+lgd3ASTwSqwMmsICy9tuqj1m/totgZyvC1FlNZq8r4lifjhamftsDj
         QHoF3RIk/bsDP+PhqYvT2nahTPIlvOYhwHJdTV2+3z6J1vgMv2ljVEx3h8vvmaCEYUUo
         sXeaMv/cHd8qacFhvqbxKL3+Fn+sS+t4kBIuD7ci4WKoFOgENSlUpG/ojOg/yae7gs1q
         q3CnGszaNt1rkYjsOa6arS+9QymsAjnqI7s3w1ktwx7mh+qwXbbPOgGdlF5aZOz0iNsF
         40M7wRsKN2VOAwfGWtjTmBfngx12dGqPJyofg9WHnTSfbBIQ4Z9VzcqNGkrjYR6FKjvX
         O0Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4+CK4xJVzlKkV8FW+oIUDsYCfNQX+XH4Di0Tmg6qKo8=;
        b=k+xI8ooySgABG1q17UvyZuy41hD421lNNX5mC0cUe6cvp9x6yklxRFIrzvD9VzTCr1
         sItiKniZASNZE5FnUkLMPUx+umFxZHWHbjFKZ9dnpc1Fw6SmvRXeCVjb+As7BagVUGxE
         zz9mnd+cXTzTaJ4AYjiTtc4rmcmN+vX4lNpk97uzTI6vLNsRuxOAVk7Q4vfHZA8g5kOP
         30lLnvd5ICkTixx++xwwJLJC5PWKwcjd9+nveLYUb0KqU7dI1NHLyvpelJVcXJS0F906
         x65nPSVsAcheF631FQn4Kewiv0hO31NW2Ec9jZlcsgi35sLlzn5R6NqKRzZVL9Kf0OEW
         XHhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4+CK4xJVzlKkV8FW+oIUDsYCfNQX+XH4Di0Tmg6qKo8=;
        b=H01Bzp7BWK5VJoajEAUnGex9ONJ6ul+ldQ1jz3Qz99ekdk1078sWd/n814cfYOKRtM
         enoDik8yRyQVLFNq7zAPLJ453OdAv+RbsSqJtl8BtpIKqsmyJtPduR07yXPCuN+pFTU7
         fu++vzSyKd/cANCofsV3kKNgpebEBoK3ZvNPfks7yx55D+I0lD2mXWJQhCJQ85ing3WR
         CKEnQPNZBDKhaDq0p55zK1P2EVNh5XQYqTgBLQmKr9kRty2ppHwQEHM+JySyS71Kfq7g
         yF+O2PFrxF2czEhUA50f1aFY3FtZVcQTGWOSr2cZ5bj2z0coB5m2ne74eZaIjE+akKlS
         2lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4+CK4xJVzlKkV8FW+oIUDsYCfNQX+XH4Di0Tmg6qKo8=;
        b=hI58J0wlyQPZZ8j2c3qXbSm/nWmqt+uoiOZHulj3xYc4jNkwQSiOjmwm3kx83A0X1b
         KGeuzkE1uTHZfUNrHmWIRNu3eoB9g0b+qSHOBkY4VR+7tR0aOa2euy+t1tUms5u33Ag1
         9Oshjo/k822UQ/mxXS8hZfQjGfBFYZA9I5CoF02fqGT24eKO1qJ0b528et9RFZn6lX6g
         neuzBeROUnpDUt0vN8uZRWKgbDXENFKyPJ36hvsXycFV95mDYGUmEQV9vCVw9nW2i/7l
         SmeZpbbe9Amdz0gQ7VyJqj2rn5KhcR077IRhHX2U0Xj3MkCv3d+mvLZvAcXjLpXNjD1t
         peRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWULkSVTzOI+GqrVjuxn2no8OYb4HPIUeQVOHynnjU4NjG9eUn2
	Xh4qDQR4XTZ5xriNTeWW3aQ=
X-Google-Smtp-Source: APXvYqygyL0HxjUf0Hkvl5AMg2xhvf1H1WXr7vv9sPVGHwuOYUvIapnjYPAwGpiZ22d8YR+p1SO/sQ==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr31462866lfl.1.1563794534186;
        Mon, 22 Jul 2019 04:22:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43ca:: with SMTP id u10ls3123284lfl.3.gmail; Mon, 22 Jul
 2019 04:22:13 -0700 (PDT)
X-Received: by 2002:a19:491d:: with SMTP id w29mr31889387lfa.149.1563794533530;
        Mon, 22 Jul 2019 04:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563794533; cv=none;
        d=google.com; s=arc-20160816;
        b=oeNii/B2qMz/Cg75lF4TWylTb1pBL0e3pBGdo7LP3/zys2e9xc9Z8kUBAMKeYKZOk1
         udrGTb3l6sY9dMka1y7298wJ24QJun0vOvjxrUPxYiIl2seTpAOWkxZL2bW99sSuiZeU
         Vnzsnky4b9DJfPhKePPmDdZnFJRXCQDuHQCPbJCHI4tZ+gMjc2zue9ejT5PxRR1MwvGg
         QzAJOH77EF1BSrp3NEATJAed3C+Ro9WwCDT3jQ/9a20plkrmYCQP9EnEvZAnQYsyGwwL
         Xr+33XKl33MPHvDeKEvbt4rqcmUpUSbUsb2ag7YgSTEqAu6f8UBdUbelIZDBEQHTguKm
         wmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=D2r5AW6w7cYF9APo/jAXazrid//0qgYqEGPseLqavw0=;
        b=WnYRzaSq9O4bajROL5teGBH8cMyXKCnyF9NcokBGVO0k8l16rbPL0hMKjbpTXlp3Fr
         Vm8m9oBpvlwycoa1ypMqBIhn6faUVIkA2oINGO5z7y2bj9GsIu/6x/K811zj+Jpp2dDz
         vjx5tgGYTD4g1owx/cWLgeULEKRWJPUENujPvoc1ub4EceP6h+EJvGrIkZdrBqiewGG0
         PdRzfSslcJUwtVuSZZDv7VTahN4147OvwsFXpwJ16oheycvp9KBrnGtKu8EnVIMzxdhF
         pS11NXRLdCutZTKBjkx4sPUm/GRwQ0ktPFnds5ZbOo9fwgCRkZqdz064Qtrq73KS4EEO
         sXqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h11si2136821lja.0.2019.07.22.04.22.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 04:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6MBMC1d002676
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jul 2019 13:22:12 +0200
Received: from [139.23.72.197] ([139.23.72.197])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6MBMBLC024721;
	Mon, 22 Jul 2019 13:22:12 +0200
Subject: Re: [PATCH v3 5/6] arm64: iommu: smmu-v3: Add data structure
 initialization and stage 2 for SMMUv3
To: Lokesh Vutla <lokeshvutla@ti.com>, jailhouse-dev@googlegroups.com
Cc: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-6-p-yadav1@ti.com>
 <9bdee063-99c3-efd6-bb4a-2de6ebf8f1bc@siemens.com>
 <f1e97cca-4909-9c24-e0bd-72c09faed6e0@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b98c35d-923b-3d81-b6a0-86f63e8b8377@siemens.com>
Date: Mon, 22 Jul 2019 13:22:10 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <f1e97cca-4909-9c24-e0bd-72c09faed6e0@ti.com>
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

On 22.07.19 11:51, Lokesh Vutla wrote:
>>> +static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
>>> +{
>>> +	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>>> +	u32 size, l1size;
>>> +	void *strtab;
>>> +	u64 reg;
>>> +	int ret;
>>> +
>>> +	/* Calculate the L1 size, capped to the SIDSIZE. */
>>> +	size = STRTAB_L1_SZ_SHIFT - 3;
>>> +	size = MIN(size, smmu->sid_bits - STRTAB_SPLIT);
>>> +	cfg->num_l1_ents = 1 << size;
>>> +
>>> +	size += STRTAB_SPLIT;
>>> +	if (size < smmu->sid_bits)
>>> +		printk("WARN: SMMU 2-level strtab only covers %u/%u bits of SID\n",
>>> +		       size, smmu->sid_bits);
>>
>> What does that mean for the user? Or the guest?
> 
> This specfies that the driver does not support all the stream ids that hardware
> specifies that are supported. Driver supports for 25 sid bits(with 128K L1
> entries and 256L2 entries). I don't think there would be any realistic use case
> using a stream id with  >  25 bits.
> 

OK. Maybe worth clarify this in form of a comment.

[...]

>>> +
>>> +static int arm_smmuv3_cell_init(struct cell *cell)
>>> +{
>>> +	struct jailhouse_iommu *iommu;
>>> +	struct arm_smmu_cmdq_ent cmd;
>>> +	int ret, i, j, sid;
>>> +
>>> +	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
>>> +		iommu = &system_config->platform_info.arm.iommu_units[i];
>>> +		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
>>> +			continue;
>>> +
>>> +		for_each_stream_id(sid, cell->config, j) {
>>> +			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
>>> +			if (ret) {
>>> +				printk("ERROR: SMMU INIT ste failed: sid = %d\n",
>>> +				       sid);
>>> +				return ret;
>>
>> Do we need any rollback in case only one of many calls fails?
> 
> I don't think so, as that specific stream id will not be supported and rest can
> work as is. Do you see other reason for roll back?

I didn't look into details, if arm_smmu_init_ste leaves anything rollback-worthy
behind, was just asking this question openly to make you check that again.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b98c35d-923b-3d81-b6a0-86f63e8b8377%40siemens.com.
