Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAFUW35QKGQE3DO56KQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 17178278162
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 09:19:29 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id w22sf284400lfl.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 00:19:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601018368; cv=pass;
        d=google.com; s=arc-20160816;
        b=GUu6i6CMYMHkBbK8WJ7friZagomxCgro2zlMYfAa94KQ/gP8YEzKkvXvWVwt92UU3M
         3e7s247GJqT7+p6MepwU50vdg92DNtuvC5ogrVGkB/kkb19RgNmMcSEqmRrSpStgJ4wg
         u4iL4CN+AXgYgPmE9zROsh671xrPQGXMf+uAlRreFH2oqTIUdtppTUW1mPDji7bcGKOL
         o/rEktXbLmAvbbHF6Nj9YV8U30HXJnNEgldzPBuGqa9kdiOdt/d1aXdjzBzTImH8I2TB
         nuktEl7ZZxtZ+mn6WnW6dnavqQKBv3uqSnWxP3FSmK85Z/EGnanKv12EZoiW85D9tRGg
         ZUOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=PokqUrCr5bDmgopM+ojIyKTWoyqlyQXhuKdLlgaQJZY=;
        b=vYtx6/00q72bJN+cCDoYpnlbwlhZqzCoSxF1xjaMrOEinZzaAGcSdFwRD52M9tYK1n
         w5XHiVhxs7rtgy6O7jaHnFl+fbTuvawBOHCcvddx60AxwPxhbnuCRtcMaRFhzC8yNUtZ
         RH+jyCG9yjeJVNlV1Zav+m6BhjTOiXuULsah8PiM43+mQQp3uNCPnuwln+Lcp8rtJQIC
         9BYBmfco75o0jEdeY7EM4+FFL+i8CXNvudvtdg5kupe5blh9z1teG9E8DT/bFXTcIHbO
         TzIkizJlPuTxtD0rCTnKT0GhZY0blzVpHFEd5u4dBfLC4zRvKNKRuIENXRD5N5eZuuq/
         Hxag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PokqUrCr5bDmgopM+ojIyKTWoyqlyQXhuKdLlgaQJZY=;
        b=E8uZp27ZgclMmz40lplimHBfWISpfJnvBF9epVFiPvMcBbczuaKd+tlwL1hvfvmuZt
         mUAraT/uMuWCnKtDp/ANpFVKQEcK43Ir+kC/5MNswuhYQRl4rCFv2Gihs8daSde+hrc2
         0tUM0eU4vVuKOjj9mL8uhrd9y3cTmKHwmb0Rfs1FSs8xP3Y0RJgq2xfwn9wzRSxnOfmT
         VmLbixSTlN0pNYBA9HxFC2uPHZlYCEPN5Xo3dRIYspm6NCrhi8JsjDPMV1PU0m8qyxMO
         r615sOG574rvRSqZ5JiOwIksQFq/P89qhZnpnZ+5uJnbhN3pc62+GqbgF+raUMaNr+9K
         tN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PokqUrCr5bDmgopM+ojIyKTWoyqlyQXhuKdLlgaQJZY=;
        b=IkQj3Ax1qMvcnvCBIe3HWbgXvl7c6dZ/G4Abr5bknevzg/MUt/pQbxBLONdCIT6XtS
         srVvRMbTJT8XgQc2rSXQ8+KULoL3UPrvqDAAQC+miYCam76GVzfifEb2vbAQPR1XBOHU
         efwJRyNmN7esiJ4DqO9ArUKQo+NX92lddxJKf3xcEmt6kR2InQoTNaVgeANsIzdv57u+
         dNmmxoRW8mug6OUY0q0wcrXKc2XjNB3b2odozdOco/5Iv7eYXOGrSq9RMngTcBtEZBzg
         cqsUPDcbd7iMLTjhAXKcmiObnCpvhD0NI2ojn2AfiLJpyaDRP6vdcTsQ4Pj3+vMxC5xi
         6Vnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531TYKbvCNyapc9QgHuqCujhSwfQYQEZYHbWqtz/YWvgp0IABJk3
	gQd5BkkH7OCH5OEeJz7/eYc=
X-Google-Smtp-Source: ABdhPJzCUQ9Ay0Num8hxpYP5O2Up0aHTwwQCqj+EvtP9yy5UXTY55ItdNwws/UjXA4x8kng6OinVgQ==
X-Received: by 2002:a05:651c:110:: with SMTP id a16mr962223ljb.110.1601018368585;
        Fri, 25 Sep 2020 00:19:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls228989ljp.3.gmail; Fri, 25
 Sep 2020 00:19:27 -0700 (PDT)
X-Received: by 2002:a05:651c:1397:: with SMTP id k23mr984026ljb.263.1601018367098;
        Fri, 25 Sep 2020 00:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601018367; cv=none;
        d=google.com; s=arc-20160816;
        b=dgRIBew9iLNmMfsCJRe6M7klVxACgI4TfXuKPU8RrGUkigtJitF2Gl0W9l6RStMsVH
         R5tfU4fKbRCet5TfEzSppWRlZh2l7WvZNgNuYbiJOxEyNiPl6AzW5p6zuMaCrOkdEevu
         yhuBUTAQkNUFL66zRjhzYHXwUATQbsBjR7iHdfvpqtsbA8QyxNHzJVIWeIAz7QAiRRss
         jZ0NzOp19mSbjm0SLGqpb8uAVwTCCdyS5LzXu6B788yY0QS1Hi2tqjX9vkGeJ3/lb8S1
         iHYxpHkFt9bi3PeabodNtP+ONPUwXbWmzMaOR1CdIR/fTduoeLnnJfxEs2wWFxdt68ns
         it7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=R9CO7nssUpqg2xeBbPsetskgQLb0j2pX+tgP4tFJXgU=;
        b=KWY+k0BoNqLje6YnyaQmHpZFlTafrxfK+yKJEEZk705aldoQP9KzDx0NX0IYn+oV78
         KeaX8DBrvoMdSI8OmFdJdc7n6DMPMgPUn6DyW47YnfYMybfLz5QMQgkYfUE3MBSoKrsr
         FKz/QAmKBULx4qHgc2XlVlT9erPJ+kjoskRyKqDzWdKIK6bxP0nLKCS+cSQQ2PHlzzpd
         XsJThZB4jIq7Zzq0Cg1NuxWLHvdwyrXrI+p5OpTntPpB+u1vOPhQkTOmqK4gJLvPb/zj
         yGf+l2BehA3/XAcotQmAVFIbgaCTZEAx3Bq6/AJZge851XMKJL6iAs4laWv2nrExps1w
         GO+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k10si50357ljj.0.2020.09.25.00.19.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P7JQbb025630
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 09:19:26 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P7JP8X020234;
	Fri, 25 Sep 2020 09:19:25 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
Date: Fri, 25 Sep 2020 09:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922064542.26274-5-alice.guo@nxp.com>
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

On 22.09.20 08:45, Alice Guo wrote:
> +		.platform_info = {
> +			/*
> +			 * .pci_mmconfig_base is fixed; if you change it,
> +			 * update the value in mach.h
> +			 * (PCI_CFG_BASE) and regenerate the inmate library
> +			 */
> +			.pci_mmconfig_base = 0xfd700000,
> +			.pci_mmconfig_end_bus = 0x0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 0,
> +
> +			.iommu_units = {
> +				{
> +					.type = JAILHOUSE_IOMMU_ARM_MMU500,
> +					.base = 0x51400000,
> +					.size = 0x40000,
> +					.arm_mmu500.sid_mask = 0x7f80,

How is the sid_mask of a platform retrieved? Can this be derived from 
information in a normal device tree?

Or is this coming from here:

/* ID0 */
id = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_ID0);
[...]
/* Max. number of entries we have for stream matching/indexing */
if (smmu->version == ARM_SMMU_V2 && id & ARM_SMMU_ID0_EXIDS) {
         smmu->features |= ARM_SMMU_FEAT_EXIDS;
         size = 1 << 16;
} else {
         size = 1 << FIELD_GET(ARM_SMMU_ID0_NUMSIDB, id);
}
smmu->streamid_mask = size - 1;

If it were so simple, I would actually say do the same in Jailhouse and 
drop the configurable. We may even demand ARM_SMMU_ID0_EXIDS if that is 
practically the only case in the field by now.

But I'm lacking a full picture yet.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f0d667f-68ea-eacf-7b8b-61652bc0d2ce%40siemens.com.
