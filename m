Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK52Z74QKGQEAFAR6ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BF24292A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 14:14:36 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id z9sf203514ljj.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 05:14:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597234475; cv=pass;
        d=google.com; s=arc-20160816;
        b=h84XHNXzxkknZfqkJsnPzTe6+DMF5jp9EA+iw8wSJIhh1sTcWDV5RSiwiEmB2EfSgS
         0XUddTQQRSZSI4BGvuKk4/kpN4iPoKFRpkmSOQFv4bT8XYbO7s4MiPYX6sKd+yvEwqJR
         AbeiNIFULRTBf7gzInj2Bh/ESWMcbagBpR7gWTI1zHAWdAcY0QV+EeeKB8hlL34+vQf5
         vWYvCoz2boPn9upc408GCseQn81OlkzQ7Z8b+r0o025gRMTM5XUOpkMVWjUJorYvgtnA
         ohQwTJjwy6UdMgDunjqq9IJJQ+dRK3wPTJWehL1VwCqo+2GTWZOGfP+jPPZsZLBET/62
         xeLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=MKkJtA79wPPA2qaUcrA1bxTqdA6zfAS1DFPK+5hol+0=;
        b=gxBJjk2tPQZ2AobPQdd1iiznfnKCklBve3fw/1rsSFi0mTBfNtEi+x8VvPJw8tl7HC
         /vpf6RYkkQA1EIZdeH8hROZ+RM4KVALX1mg8BgbHuLriOKZ2FCuOYbpxcb/mMuEgsAnK
         U4kDMFrHUNC6tpG+1lRLV35KLw6tXq6KNSJZRXkAnO8eJTkyWiTXwX77n8MJbjioGOpS
         Lm06Ai1SLTm0aRzZItqa5+517losLlbG4CIJRvVtr8a0MKIA6PEAaaVHHWMoWk3LF1j2
         iEAd82m+sDw+Z2pmo07Xjq4gYoah6BpRDEYrmhUlJkPFdrxKlUL77Wmm8upjDM1H+Gbv
         mPaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MKkJtA79wPPA2qaUcrA1bxTqdA6zfAS1DFPK+5hol+0=;
        b=WQN6vGgJ89g2QAjBac66m7Pb2NEXV4bPVWYqX7KIjpcHQFxfMqRpPRHMs9GWobPCZe
         C3Fl/ycWpzmfvk9utCosGGVJ282v2r+BRunRA1VfxgH8le5ZEx3PzQE3/KxZ/u/5X7NA
         9valZzMaUcXvgAcicrjF7CmaMbPHYOpRjuMF0luPSVuHBUlc7CPjqzRR70J6guLP9QAD
         LjoQOXYVdCLknVSK0f/505ok617dfFduvWB3hBeQZo4F6lZ5y9QsQuP7tV0CXnS/pZah
         QRluy+lZ4d3tARwGZjIqHQ5hSW1EPgbPPk958uqbLhp8ehbVaq7LE2DUTCikD4/ubeHo
         HvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MKkJtA79wPPA2qaUcrA1bxTqdA6zfAS1DFPK+5hol+0=;
        b=g7L7nq5X97dZG0tlSKNeaPYHa/Zc+x3VcHhfbEhMnIQ7LJeRHfgFQXCBcdqxPGeRR4
         58S6i71nMWo4bKll7oqP+DSpWXKYP6Zve7PZsNvl/fiB44GDJEIqQ8TIA+DwsPwk5Qea
         yIQrUegEbOQU4D478mQnyuxP3n2aLDRnl0ByegrtiUW1MAGzgIzLQvel2pRQAbeEW/Pk
         FnktAJ+bmSERWkNx5UI8Ls0ETdU0BlRWuJerK6+MB+rv3ewZeKyuNi1jWnPtVTU2K3mg
         cymSoUUuFn6ZukywQXQoDrRmENKyMmQjkkO20HWOMG+J3M10T3thPRHxlGk6BwRL5LZV
         xfUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530M87hfcpseiahNiMm4NgCrHxy65nxEXoy7GZvEZW0nfAZ+bnj5
	13VThFvYm5VCnTa03zDyLcc=
X-Google-Smtp-Source: ABdhPJxSapIgceNSGC9Bb1STjQoCHSfeYWdT7PA6zreUl+zjzTM1sC1D2vNxsGj6l7NbwfdFcsmcRQ==
X-Received: by 2002:a2e:b5d6:: with SMTP id g22mr5535544ljn.252.1597234475747;
        Wed, 12 Aug 2020 05:14:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls29413lfk.3.gmail; Wed, 12 Aug
 2020 05:14:35 -0700 (PDT)
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr5626865lfp.10.1597234474940;
        Wed, 12 Aug 2020 05:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597234474; cv=none;
        d=google.com; s=arc-20160816;
        b=bk+K5VSttnskmCBMnToVA7Dqg2/lH1VcRtYiPD/hkBeM0kGil/XYvWh8MwaFDILYQe
         yi4FpM5Q+0poaZKA9EvipD0XZ24JsECgZMzJ8mAZLkNdxDe662O7j5pEEKL0OyHKMWn6
         q9UV2fM03ALfSaU+g7uQaK1b/1mLitZjZlVtwR05Z4SAYamw1+sW2nEmJ525XMMIoxRi
         GfQNqLGaG1LWaqrf7qHSBW0wQqbcyfzsJm/VDL0fGaKOF7Yggb6zFcoe4fkAG37PDgLv
         yXaUpQv+HEIrazrvH9Dqa5jvqQPdAnnXhRnl906zM5fbL8eoXOeaPVWwpJMyjIbxFLk4
         msGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=UmKJT3CAEp3MawALiSHxS1RcfpEKL4PSA5Jl1a7zN14=;
        b=uO8K1EGQ9SjaD71nsbWxsAr1H+g1UauaBmvRzttGhgAR/zmy/ZkfLN9aXaqBXt39nY
         Qf0Z6yHuTj6M13wPRyqAQ+R8YZj88yqw9l5aYlWlhqeIvLC84X4fXPl7Qvip8jZu/rzW
         VCLXPpmMRsvs5J/Qb/PJ58HGXwoiydRNBqFKYcV90GtbfYj1Deycl/oPoGPkEdGwwrBj
         dh5wP757qGEwco9LhrURwtVNQhNji0/xQOguJrQqS0TGe0qi3WWTNFHrhn01S7gaMnhf
         mn79YLkqSwdw9VQ1OFVpWwcnQX6u71m1arhHMUcv2KQ+9I/Xh7t3D04JfqmRDgBnHPlO
         vq8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z22si79093lfd.1.2020.08.12.05.14.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 05:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CCEXG3027632
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 14:14:34 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CCEXPL024338;
	Wed, 12 Aug 2020 14:14:33 +0200
Subject: Re: [PATCH V1 4/5] arm: include: protect header file
 hypervisor/arch/arm/include/asm/bitops.h
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200811181641.7282-1-alice.guo@nxp.com>
 <20200811181641.7282-4-alice.guo@nxp.com>
 <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
Message-ID: <c2539798-5795-2cd0-0688-b20363e7131e@siemens.com>
Date: Wed, 12 Aug 2020 14:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c7a37ee8-371c-d3e2-90a1-7fda635505de@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 12.08.20 13:33, Jan Kiszka wrote:
> On 11.08.20 20:16, Alice Guo wrote:
>> Use "__ARM32_ASM_BITOPS__" to avoid redefine functions declared in
>> hypervisor/arch/arm/include/asm/bitops.h when building for AArch32.
>>
> 
> I do not yet understand the exact need. When does the build break 
> without this patch? After patch 5 or already before it?
> 

Must be a local change on your side: asm/bitops.h must not be included 
directly (see also scripts/header_check) and is otherwise protected by 
jailhouse/bitops.h (_JAILHOUSE_BITOPS_H).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c2539798-5795-2cd0-0688-b20363e7131e%40siemens.com.
