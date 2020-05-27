Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOGXXH3AKGQEEK3Y55Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC81E43B4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:31:37 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id t2sf5512254lfq.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:31:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590586296; cv=pass;
        d=google.com; s=arc-20160816;
        b=OV/FQuttK5r1Na1fYdAfkCcFWHVHef5TD9BoXeTiMrU7FmxUzBQoQnLGo915gRPJcU
         iEnKgsUU2k4/d79PQqeingq1kYFnmrI8jaSj32ASs7Sw5x9o/WUNKOm037/3jg7KROG5
         TNyQ1WixF5JmcqG4S6yoINN/Jv6O4VIc7PE0X/ffK+XwBLbSU/Rv1Sr5mWcO3yXKWNWb
         swSiA6Me9AKOaZ/sW0lNaKFgO2ui/8/zxn7UR/W/GaDrNUms9C+7CeTe/anhgDDV6MKG
         9qmgzhUU5DKpvN46DpVeHerQSBnwIwaNQ2VqxQ6wE5dKHEI8Ncn/zLCjd3eBJ91ZDUy4
         a6Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DyZR9+UQ8DOsZoRCOh5CaNSu9hltmHmcZWY/4g1Xpuo=;
        b=upXDcS2dggEhEDexKf5+VBJSaHNMMrl2vhDJJpANYjAzL1tCP9ktNtlngAIS4Uw2gm
         3ybG5omS9BVapFeoNlXUKJQMBx0Xiyd9Pc1V8Z/rS80DUvZz9WAuyxB46ALmIlPKcoKF
         lmExWLJBU6k1t4eLPRixLAJlVHAH6PW/9ZRjOeKZ6MsoNzlbdTdTblO4FsiKp+VCx5/T
         Aw0ZFDfi5WllddFj+RD8V47qXd3lYqu72Go9sZsxVG07DUuQr7USUUfjv+kL4rMnDHB+
         /LFF2Tf8wSMoz9lUTy6WF8C6BsWxD3s6i596QZoN2ck+HXVAgGM9sAXaWipm4tlibgO6
         914g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DyZR9+UQ8DOsZoRCOh5CaNSu9hltmHmcZWY/4g1Xpuo=;
        b=flIx7dX5XGRFD345Vt69HnCRrzy+ZwzBsCHCNEFCLGDnxoX7hPqliXI3N9K1ReET/t
         KHBu7CiTFlMgwJBb4+8bgRiQ5dG+5BATCU8sjaMwAH4YV41CDwEzsjVTPBmN/UVbe9xN
         ya4vchyz3quLvVKy0kj2KcpiyKs+p1+UHmBqozqHdOuFUNZBZb5PB908nnMPLeOTf14X
         0cVwpF0MS2HvP+lKUzANezLGcpDDhP1JDNKqYeirJmD2Q1KS1qwucB0kAci4UNTqSEc7
         /UA3ljNHXl5oD8jFv2/dt+NHtFsoL3//Ps6vIKo+2iGV484LFBGPoOFO0xlwlhD3+GU6
         V8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DyZR9+UQ8DOsZoRCOh5CaNSu9hltmHmcZWY/4g1Xpuo=;
        b=b+PzM7IZwzzed6aSpB1AwFtbv/DZGkZ6aDVOAQF7Y3CGnMnDKgvDUG9mQJNOVycKjL
         FX4nnDlD3IOcncASpmCAPnUk7U5uEMIVB4ye2Z+WvrksHfljatLDH+magCuRC7l1IUeq
         ui8LjD7FxUepNlr0KOL1j8QmFx/otYV36k/R02bu6n3tZE6B4k6gQA5J0FuRnMryfuvD
         1Ok4iyQpjf3zmKV84/+MIav7OG2ZTwoxOmRWc0+zin7L5INl4jHwJAzOPllsd0qIWwze
         AMwsqGygYrI3p2e/HGSCPIAkCbsrcgPj2EFzrVrDvp4FO/RMZUlVn3tkgAkE5P5TDlru
         7eRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Fvr0uW9hA3KbgrDwNochX6Z3x6nxHG3V4u6z2H8ZFPL86k7ZX
	4Jrtwp8KcjQLEalrtThsPbo=
X-Google-Smtp-Source: ABdhPJzh8qis+XI6f22AQ71nQdv3ZovZ9qbXZSEuuPwb5MTCoaLArllDlQsve8j3l7KspaRjn8KG/w==
X-Received: by 2002:a2e:2281:: with SMTP id i123mr2953042lji.330.1590586296718;
        Wed, 27 May 2020 06:31:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a53:: with SMTP id k19ls1702421ljj.9.gmail; Wed, 27 May
 2020 06:31:35 -0700 (PDT)
X-Received: by 2002:a2e:7d0a:: with SMTP id y10mr3193175ljc.469.1590586295717;
        Wed, 27 May 2020 06:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590586295; cv=none;
        d=google.com; s=arc-20160816;
        b=IbZWf8tkvA8OPjoGuQ0lfb3fImgqdVxsOGdCrBHkfpx52xo4BpOCbcjwvnMKCXrS1T
         ZqMN5DB7HVX9Y4m5BCykvNIuEXSn885cUSQbMG70vDs0RfhGGa/sxlNNkmFQZVwHZmT5
         VbDyxa4xig4yvoYFsXo/+0+ca5oLEvtZ+VyhZi6vvYPhrdfztUg9Gv58NRx9bHKMqMyD
         t/p1cB7GXGRVIBLhJy7vTWonZtv9+D7GK3aR6oSRSrQkO4vEaHF+jPSUrSiUvgiU/lE8
         lFow7DLneSLG6NS008HxbfcwXkc0hjrOKzhdVNNq6yXeJqhjQTzW9NZ+KWFM/1R9mdNp
         eI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GyQlH1Qzo4i0kaW6eSt02QuBOVMp5EJFyj0H0qaRYlg=;
        b=CNaAb61dEINc+c4tM169chapAcUnXdKFHQGnzmvrjfYoU6iY8jpqk8ElB/pqGMft08
         eMGwQV3y4CkPKskyPkYwChuxKodVwe24tuNhpBl2lFGbUYbaXNliF0XwTihN76+tqOIl
         yCIeGyXUzkDCYMQYvcKgJmWp69DdCw5DeOyAC8OPcb+lZoOrT6O762tFJ9qUYKxRsGB5
         JRwF84mm8d8J1yqL2xhKCnV0RVW3y69/9wNmVxsIMavJKlLTa8yHYhOPFWOPgS93DsaY
         d1Nw8YXpp44Kp1fEGPK7oDWhrBP0jDLvjv4P627U8Qija2ShrIyJWPQiCPGVaU/840FP
         V0Hw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 14si153505lfy.1.2020.05.27.06.31.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDVYtS000433
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:31:34 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDVXmK006780;
	Wed, 27 May 2020 15:31:34 +0200
Subject: Re: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with
 PCIe
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <20200527122358.14723-6-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
Date: Wed, 27 May 2020 15:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527122358.14723-6-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 27.05.20 14:23, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> PCI kernel framework requires that all the instances in the
> device tree either specify the PCIe domain or none does.
> 
> Currently, Jailhouse dynamic overlay describes the PCI domain
> which causes problems because root cell DTS does not describe
> this.
> 
> Fix this by not specifying the domain in root cell config.
> Also, fix the size of the PCI target region to match with the
> correct description in TRM.
> 

Please rather patch your DTs to use the domain ID (upstream). This here
means that you will get a new domain ID on every Jailhouse start.

Jan

> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  configs/arm64/k3-j721e-evm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index 578caf02..dbf0ca7c 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -44,7 +44,7 @@ struct {
>  			.pci_mmconfig_base = 0x76000000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> -			.pci_domain = 3,
> +			.pci_domain = -1,
>  			.arm = {
>  				.gic_version = 3,
>  				.gicd_base = 0x01800000,
> @@ -173,7 +173,7 @@ struct {
>  		/* PCIe Core */ {
>  			.phys_start = 0x0d000000,
>  			.virt_start = 0x0d000000,
> -			.size = 0x01000000,
> +			.size = 0x02000000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> @@ -398,7 +398,6 @@ struct {
>  	.pci_devices = {
>  		/* 0003:00:01.0 */ {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 3,
>  			.bdf = 1 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0134f1de-2f2c-416f-67cf-cc20494de4a9%40siemens.com.
