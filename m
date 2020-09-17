Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3PZRP5QKGQEUBZ3NQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id A199826D367
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Sep 2020 08:06:37 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 33sf444914wrk.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 23:06:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600322797; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tq8rgns0tY2+J7T5l9RIv9hhhTF+TYjhsAGgioEhWQ96QuCTWnaFip4zXYr9UiwVDF
         GoKoLBdoWDK1OsWaTmFwCWB35VeE/OWiuq94RuMLLcRHoByFVS1QY0swVGBZTjT5FIOC
         hbPmqw36AIYJFd0lKsLUtuGFThd2UfCDxoEyf7Q54WRb7aJZ2nZOD1TbrWohWbILaT88
         9xICjWyV+5pnBLtfJZodEvDdGwJlIxNbaK+4DEmMmdiwt035aH/sLyj4mP2zBUgrz1/1
         Cz/iqUkzAtu6okV51BLaeXSJEwFF/jDKbK2lwF3ADxhFxmQq5ooTXyNk8N4Zvlybt2WE
         2qkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=gUHnEcV13s/wFOZG/6WlEkSotyYgMRpaaZ6a8MFg2FE=;
        b=iA+Efnw/3EqRXTmBatXBJdtl2ZB7hfeEs+cAc1tp5XqUd5dCLztIu0w3F0iglmRWG6
         iv9ZS6tbzUMdWTV8gc3qrcft9EUkmoPAP5pboek00+0eTmG8ogrwAjxDxyMPLaxQrmb6
         ezb17hhoT3P67sYyNsvHJ+YwdufsI4cy+bkBOV87sDM4g0+7nqpGDY/1v5jSXfjbB79p
         FocIUKA3l0FHSZzbUJ2dFOtUeekRnD7v6cVk7UII7Uw+Oat8pN75Rg44RkFSVv5QSkUN
         d9h2kgVL08O9GZbEpsL4Vedf+NJ6pr7yhImNGVXX5bxqDKXysL3eveU8wxRFIOpyFc6C
         Dwbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gUHnEcV13s/wFOZG/6WlEkSotyYgMRpaaZ6a8MFg2FE=;
        b=swKvo1JkCKj9hs0rpKiQUfoNwgjsCwPQo0SPLl+gAOsX6L1jrPUXDSPqrt8DLbVfn7
         0xFEKQ7aIF8YR1RkPyEQWny5W44sNgfBTPk26yJsqbsMA2739nUcK7/1R45WLaH5a44B
         gD3khghF6f8TpUMjWaW+4xPSB3xRwgSQL7q0aJu2ZcVBP1lJ/sFrxDx52kkT1KSkF52a
         TdWo2lfVVGbYp4hiwzCqlyr+zzpmFSPU+Kt6PnX9ncC6gUA5Ov8kS0/o7ifnCwS/mcu1
         duyUFFaqERpCPH2jLDaRfcu7NySfqKfRtRyf6Eq31Ob4MyPbiB64BPvgE2ZnnmYaskeJ
         IkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gUHnEcV13s/wFOZG/6WlEkSotyYgMRpaaZ6a8MFg2FE=;
        b=qLv97P74M18s3AZVwfxZiZPOCFxIk3McNz8dbRGUFZh4ibLpc9gnvVeY9yJlovwT+5
         4YFW5su3JyUqmV5Kjb4WD3w+4QrfeBV+AQBoBfgKPPGr3oZFeDylziKj7ILxOKyNAUOp
         dCKwYPGiANjxmCHwIKmJDK8lx/taytGfciIAuanDS3ucseOfLjqnqsKV0qvTQQRNEVow
         plo1ivK1o/Ria2ugAqwx68PaOjkQcyoohN+Fib5zt6unL6Gabi5FQT+Y9CfDG/Tu5MD2
         rvXrYztzjqd0GAH/CcKpNCjRCKNz3HgXbuNfNV98sWlg07d01arUfa8c9hyCBDj4KHPI
         63uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bglJzj5mujxZ+I5YGCiDkybBlhejn1CHk9AmUpd02Ze19Ce/V
	diVHNdBb1qd8TKnbl6Q8K04=
X-Google-Smtp-Source: ABdhPJwvTdzjx6sZO9YTsjBsA22zo7r+G9TacrR4LONSLGBKa38CDpWUcJjHLUz20OHqHnxzwF6t7Q==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr32164285wrq.313.1600322797421;
        Wed, 16 Sep 2020 23:06:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b86:: with SMTP id b128ls447195wmb.3.canary-gmail; Wed,
 16 Sep 2020 23:06:36 -0700 (PDT)
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr8550808wmd.78.1600322796314;
        Wed, 16 Sep 2020 23:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600322796; cv=none;
        d=google.com; s=arc-20160816;
        b=mMxQfMo8WA8fAd4VAaqTxn4C9lB8f5KuFqw7toHrtD7h+g6ZHm6iZ5776hF2AxOvTa
         I/Wwcnec/X4Ws1fKBsh+mWpdcn2HyJIpgp5RErPiGNZB1r6OErRPWxU6+3p7OYIfDmfY
         mKeE3IwAQ0Wx4iWAq45jBgzgghvv5qZj+2kdS1DupnQ80Vjd+cpViiXIqWlrIW4idTjb
         2O/co1k7SybPLr9neLIJt1ovOHBtxsoFoLc8vJDYYunHgYXvcJyu6t+Bf2eP0xrrFrjB
         uEaQd2l77JhDRvkHyxDqy6IGtMBMZMYIN9uwVdit6mNpRA4uxnkE1msZPuQ2IKDHjg+b
         leww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=wQiBHN0nUSW4YOBcZcoCh7M9mhyMuIpllGGVn+Mjkks=;
        b=oy8qkd1RuQC1m9epUNz4i9N8fnTIONl4y0GaVfj0QuaATG9k6hST8Zq4XKKJR1dO2P
         rtKDrC4PH18Q0oS76JR7lDXGBCqAA1+Q53DqVmF2vnpdXzI6DxbgWirFPSdqt8Ls9bBx
         8qHKB1VhJVXIlLfckr7lLoe183ZskOv3yfi2eF4DxiuZlDmkAyKf6/5X3xUYIoIW6got
         y2l7/AgbMCN+NsJqZjQ2H5TohpeA+FDP3r7Da1LHqczal0V+9A7XMttPjmcbZ9JEn5UO
         v63mDCJsv5xGW38nQbwv8aXXrjYhnhPMN00TI4jx2vMZQGZX2JFxvGXWDIf9XLSBRft/
         cQ7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k14si515289wrx.1.2020.09.16.23.06.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 23:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08H66ZOn030434
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2020 08:06:35 +0200
Received: from [167.87.40.222] ([167.87.40.222])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08H66YG8016443;
	Thu, 17 Sep 2020 08:06:35 +0200
Subject: Re: [PATCH V4 2/5] cell-config: add support for MMU-500 configuration
 in cell-config.h
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200917040554.4599-1-alice.guo@nxp.com>
 <20200917040554.4599-2-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <54b1a19d-871c-b79e-899c-bac4118ab7df@siemens.com>
Date: Thu, 17 Sep 2020 08:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917040554.4599-2-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 17.09.20 06:05, Alice Guo wrote:
> Add JAILHOUSE_IOMMU_ARM_MMU500 to the Jailhouse iommu type. Add
> arm_sid_mask to struct jailhouse_iommu, and it is a mask of StreamID
> bits irrelevant to the matching process.
> 
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   include/jailhouse/cell-config.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 2a968dd5..592341df 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -260,6 +260,7 @@ struct jailhouse_pci_capability {
>   #define JAILHOUSE_IOMMU_INTEL		2
>   #define JAILHOUSE_IOMMU_SMMUV3		3
>   #define JAILHOUSE_IOMMU_PVU		4
> +#define JAILHOUSE_IOMMU_ARM_MMU500	5
>   
>   struct jailhouse_iommu {
>   	__u32 type;
> @@ -279,6 +280,8 @@ struct jailhouse_iommu {
>   			__u32 tlb_size;
>   		} __attribute__((packed)) tipvu;
>   	};
> +
> +	__u32 arm_sid_mask;

This should go into the union as

	struct {
		__u32 sid_mask;
	} __attribute__((packed) mmu500; (or arm_mmu400)

That's because no other IOMMU will have a use for this parameter. The 
packed is unneeded at this stage, just for consistency.

>   } __attribute__((packed));
>   
>   struct jailhouse_pio {
> 

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/54b1a19d-871c-b79e-899c-bac4118ab7df%40siemens.com.
