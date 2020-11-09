Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBYOOUX6QKGQEITHB7GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id B035D2AC057
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 16:59:31 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id b185sf1615621lfg.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 07:59:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604937571; cv=pass;
        d=google.com; s=arc-20160816;
        b=lOIkr46P9kMeX93M6G570FKwD1tPXgknWVTuL/Pmj66jFGP7/xy7VtDCBqxGJakEbP
         pxlGuNzbtcyl4jG0dYd3vc7PalncdV2hLZhpthAqU6odIFukkBLHn1s4oeHpbwi96Pbr
         aLP8FlPI6cByop0zbfBB0hK55Pfv+F+CTe9VR6U3Wyb0z5D2x3kOgstfyTY3kHWkNL5S
         MSiui4kMWc4XGMfzkc8e4hPIhX91yvJ/BJyl5P+6Gm/SzjJwXCQTUQ3hhyGXtLGu2Bb3
         OCtdI6TpNfbaMFO+0FuVDRsLiHjUbVSz1hB7UJPJHpxW0sXKh7/asXAjgxP0TS8xaGMu
         35vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:references:cc:to
         :subject:from:sender:dkim-signature;
        bh=YE2viI/hCCKw0lhSGQCIkm4TjZez3SLZrF0usnlm+3k=;
        b=ATkSMptoqWEV4ZEZw6N6pRTuRDl93iQukOCGncPGSaG/asujGIoh7KMBbIY/VMJb//
         ihrrO4HbmtuysB4iopRRcd8HhSVZL7UZAx/RHgyTa3t85ruthZ3jl4tOjLr3enCSXpO6
         3dD5frZYsGM1P16Ynf3+tNFCTZGDESoX9wbA4tra+8JCvfQQufXmGmS+ltiQU2brciiG
         UePh+rB7isnWzV41T4iqOqlvFOD7imSkiro8d2oHxwUQXUivtC68xN/4y93WPDrtlta7
         mqFTynKqKiYNGgAq9hI+Il6Gv/P5R480uOdBCfW/ytwDUw7LBcdAMDPkJlsILxiYssUH
         094A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OsvtTzYb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YE2viI/hCCKw0lhSGQCIkm4TjZez3SLZrF0usnlm+3k=;
        b=AUmTps2gYon4ryCm8EZDoWOQl1TQRRdnTYmRDQ+jYWtqBm9xHcAUitQ1Y3361eq/nn
         20Jy00tDiOua+1L86pa+IySP2gL0bJmaN/vAgjcrf5dLehvT9fLk/7eQC93o7Q1Oizgg
         4hOqXzIhJmha0LDf+M0X3MfI0eNP/6Vqr3DGA4EZiIkY8SsC/znRi858tbwPfhgATmCB
         QATu9ZKb1hGl0Z9P+JuQQ9IykAz3ye1Enc69Joq6Rh/+qo7z8RUuifuLHADs3WN4gMHL
         z8dYS/uLVO01pJfhxZRVr7XJz6Q7hA2x7yfl+0aFcR/u8ezNe25jguwiSXO5sYFJGt0t
         2YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YE2viI/hCCKw0lhSGQCIkm4TjZez3SLZrF0usnlm+3k=;
        b=HxATM7nSShgAtAz3BNYRbVKyGqRpdJXtoCF+zD/sPZanXzPzUMfxgLG/l3Vicf+vZt
         SMk3rvF+J53J8tt/lMEECNpUbvqGhIeiuTZJYnX2M+1J5lPpcIXY4sQR3fzeCxTX0MHf
         agupXJjE4fKQgZiRihGLocJXU6+6AZNpX6DZt1uwiZ1+pkqHjFCezRvi17W6/D+2X0lr
         feRmmOIH82QXCiBOVtq4sLjlmyUYqx01s3yubOYcpBftBvepYurpiCuzMppLVzqaXVOY
         V5l4A8eImx6VWDkdRdgbVF31iyNyx/uxrzcfMDCQcOcj0VTrQtuJW6LsroywSNcZ7jnM
         9QiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZrMONhH+RAVFwDx5dsU50RdGL3ku6tHXRkfDp+Lh4omzCjqfF
	T0/GmRsqKc8XFDw/u+5J0NA=
X-Google-Smtp-Source: ABdhPJxAYhvSwOdkXRUbTXIfd3YD8Ozsg+3kN2aShw9vMf1iZtR3UhLi1hnvZI25v49Sbr8T7PQb1w==
X-Received: by 2002:a2e:9208:: with SMTP id k8mr5823389ljg.369.1604937570398;
        Mon, 09 Nov 2020 07:59:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ccc2:: with SMTP id c185ls3953412lfg.3.gmail; Mon, 09
 Nov 2020 07:59:29 -0800 (PST)
X-Received: by 2002:a19:7f55:: with SMTP id a82mr1933995lfd.603.1604937568947;
        Mon, 09 Nov 2020 07:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604937568; cv=none;
        d=google.com; s=arc-20160816;
        b=VKTeOV++IJAjSEJvW/7Xe1w910sJkoG+0Erj/T1aRcyk/hPErr6uZVZfO9m9RiusGB
         sEOxXqfAHZZ8hiKy50LdClKEvOKuEPuYPHbyq6cyzBX0z2mp8Q92/vsU2SqMuYKqON9Y
         VtafK3o/7DJrRtTb22epkH76AnlLt4/YHJSEUqc1hSG+ubAXHyXhXbeNCQxAz4R/zLdz
         PeJIeWtHM68MX9cC59RUJUhaVMMDRSoa1Ln9c3n1a2lGO+/HgD+DMXJJCd9U8Dg22D9P
         9YvHbOVigSflid2QRawL+5AaCwrUkfAPoS03Nf4KtE8uZMCE+qGlZOqCqxg5xRLPP8J9
         twgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:cc:to:subject:from
         :dkim-signature;
        bh=iaW15TKgTp62l0TlDTN6tW9ASDik/KmKl0+WcNUGpB0=;
        b=oQ6nPNSfMlzpMsZ6xz5G887JMenhZpY8C1EwPjq5FQpfmbRcPDbtrVHgV67m7mjeyn
         tA+AGAnG3WeJ7XC9lGYSAvjdtDEL6/5vuiY+qCDztFH4z205CI0dkLHNg6YUu0jkPBVX
         +QaqbihX2Wp3oZZycl+3e6rjepGRLk0QKXv2CXmr7DAXP/rfMsy+tvOxPBRchHmfWxfm
         c6fBBAbLS5ypiNJ+awejwXhPyTi6hYa2galU6G2aqApD1ejK9i9xbffJT9le/uvqL/90
         ypN+NCTxZTnHpCn9kN1vN8/gbjJP70FaQtNknTDvmaW6fE/hCLddVtObkP937g/vUeNi
         GE4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OsvtTzYb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id s15si351103ljo.2.2020.11.09.07.59.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 07:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CVG000rzKzyWf;
	Mon,  9 Nov 2020 16:59:28 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.874
X-Spam-Level: 
X-Spam-Status: No, score=-2.874 tagged_above=-999 required=5
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
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Mg02RtGHx9_S; Mon,  9 Nov 2020 16:59:27 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CVFzz1smMzyW6;
	Mon,  9 Nov 2020 16:59:27 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: Re: [PATCH 3/3] hypervisor, configs: remove arm_mmu500 sid_mask and
 update imx8qm config
To: Jan Kiszka <jan.kiszka@siemens.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: "alice.guo@nxp.com" <alice.guo@nxp.com>,
 "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
 <20201104153648.35076-4-andrea.bastoni@tum.de>
 <d637b307-9dcc-5a02-9bc6-9fa07d636979@siemens.com>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <96d07bef-e970-c199-50fc-c9541790f1c3@tum.de>
Date: Mon, 9 Nov 2020 16:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d637b307-9dcc-5a02-9bc6-9fa07d636979@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=OsvtTzYb;       spf=pass
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

Hi,

On 09/11/2020 00:04, Jan Kiszka wrote:
> On 04.11.20 16:36, Andrea Bastoni wrote:
>> I.MX8QM fixed mask is factored-in into the stream_ids.
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  configs/arm64/imx8qm.c          | 6 ++++--
>>  hypervisor/arch/arm64/smmu.c    | 3 ---
>>  include/jailhouse/cell-config.h | 4 ----
>>  3 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>> index d63c73cf..566fd0ad 100644
>> --- a/configs/arm64/imx8qm.c
>> +++ b/configs/arm64/imx8qm.c
>> @@ -54,7 +54,6 @@ struct {
>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>  					.base = 0x51400000,
>>  					.size = 0x40000,
>> -					.arm_mmu500.sid_mask = 0x7f80,
>>  				},
>>  			},
>>  
>> @@ -209,6 +208,9 @@ struct {
>>  	},
>>  
>>  	.stream_ids = {
>> -		0x11, 0x12, 0x13,
>> +		/* bits 30 - 16: SMR MASK
>> +		 * bits 14 - 0 : SMR ID
>> +		 */
>> +		0x7f80011, 0x7f80012, 0x7f80013,
>>  	},
>>  };
>> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
>> index 191ff154..d2824985 100644
>> --- a/hypervisor/arch/arm64/smmu.c
>> +++ b/hypervisor/arch/arm64/smmu.c
>> @@ -157,7 +157,6 @@ struct arm_smmu_device {
>>  	unsigned long			pgshift;
>>  	u32				num_context_banks;
>>  	u32				num_mapping_groups;
>> -	u16				arm_sid_mask;
>>  	struct arm_smmu_smr		*smrs;
>>  };
>>  
>> @@ -564,8 +563,6 @@ static int arm_smmu_init(void)
>>  			continue;
>>  
>>  		smmu = &smmu_device[num_smmu_devices];
>> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
>> -
>>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>>  		if (!smmu->base) {
>>  			err = -ENOMEM;
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>> index 472cb4bb..d6315489 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -279,10 +279,6 @@ struct jailhouse_iommu {
>>  			__u64 tlb_base;
>>  			__u32 tlb_size;
>>  		} __attribute__((packed)) tipvu;
>> -
>> -		struct {
>> -			__u32 sid_mask;
>> -		} __attribute__((packed)) arm_mmu500;
>>  	};
>>  } __attribute__((packed));
>>  
>>
> 
> This concept of masking it SMMUv2-specific? Or would it be worth to
> introduce it generically, e.g. by using a 32-bit mask?

To my understanding this is a specialty of the SMMUv2, but I couldn't find many
details on the PVU.

> If not, then we should model a stream ID entry via a union, something
> like this:
> 
> union jailhouse_stream_id {
> 	u32 long_id;
> 	struct {
> 		u16 id;
> 		u16 mask;
> 	} __attribute__((packed)) mmu500;
> } __attribute__((packed));

This makes the SMMUv2 specification clearer, but it makes somehow longer the
configuration for v3 and PVU. (I assume you want to convert all u32 stream_ids[]
into union jailhouse_stream_id stream_ids[].)

The alternative struct jailhouse_mmu500_stream_id is even worse for maintenance
in the long term.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/96d07bef-e970-c199-50fc-c9541790f1c3%40tum.de.
