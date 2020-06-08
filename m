Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEF47D3AKGQEIKO67SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id A12851F1762
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:16:33 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id y23sf5668874lfy.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:16:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591614993; cv=pass;
        d=google.com; s=arc-20160816;
        b=ANPOrvLPLk6zTs7MTkGTqAz6p84yA+hw7vyxQvR9OOuUXH3Zw6GLB78FUvY1NdRyvu
         DO/LOSdf05SQqe9qOVBzY2j8ON9HYoLS5ZDdm4ouuyhMinFumQjhGoOOmBWWkrk/4GC2
         ntmFHp7X3BM/JL0Wni+pVKluXfwgOsyj4R/kOaBnNM2vAr4Ny4HiSjwo8oyj09I0NYuM
         ycQieyAJ8N24uLbeEm48PupyOg+/0CoD9GempLrpotExy+8o8/1rXhEq3hzdW/Pkm8PL
         2QdgA39gMAQQBDNqpRY15CJi3pgJ2lZc9pYATi1GMgIV6Sa80axJvLRAgE8u6PSNTJD2
         haJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=nysoR2SpqDZiiDF1jMiYbECy5wjATXyZN6QPMSoyXuc=;
        b=GRe5VRaLaCCvwit+Px7vinqPwyW84cu7Q4Qpo73hO3KiPhQazFRw7xXyywtailLeIP
         qtJVQA8WXyJ53pcN89eNRJtvH+QfsSMTzxwRRLUNXiGiTlfSy4I3qB6WATiagdD0ML0B
         bPrPw53PSBDTWT6gzQap2oa734B5V7xGOOAueH0Zhv1mQCAPPShILvUIk4seVpz4WzUJ
         RIL3ZUJnXtPE+9WrkjXd9As2H2LbhpoOiHNMtsCceRXKEkXIHWr+1l9j34h3qUxuETiz
         XK95hr1wpmDSNdrckI9wb4ES4aZrrBtVERSHEXlCKECIh7z33hLosJuU4Bxb624/fU0U
         RiqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nysoR2SpqDZiiDF1jMiYbECy5wjATXyZN6QPMSoyXuc=;
        b=HDeGqgEscAbKiDrlAWhKebt7eNQ7EvtpxjLzIzhTvkocDINkAhIPi5flpHTaoqX4tz
         51tkzFltibYD73cEGOUQmfQ0AvgmoSX8FXHpqK/RE5VAO0VzXAV7fWBILA8ElNV8EYeo
         LYBdDocAjkwYn5Hj0M0B+8VEiZqErN/V00eOYlvQboOWtRbXpmBsBcT7TRCwNW40scUx
         sAhQ/32vPatc33bMnqcZ+3aukA7k5yC+G30t2npxKXr6SHqpeJeUtkcC5b64hfzqK2/Y
         b1XnrriN263VanxKXzR6ohbqFl7d5b3dFV8bxkHg/4r3qzE6T/z2hgS9VRnlWIXjAzUa
         jXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nysoR2SpqDZiiDF1jMiYbECy5wjATXyZN6QPMSoyXuc=;
        b=cXOXtgbi5OvjzRTNdgeWfouhbFp+fQbVQtARsUPZPjw6EhXUvuyeLrM5O3X/aj5ULC
         1WJqiZeYXVJ/cgBP/wySP63f0ay8jrlFcKoCcGhQuuIoxCMeG+51CB2EtE2f+iaOPxeW
         dFPgGGw9qFOyxajzkvlrgnjVdrFFXnlKVeEPhxGexZyYEf6d6fw/+okbCLSlH7cw54ob
         q8pxcbd8A5uk167GLm2+MQ0guostqDnUrM6vresxizX9cqcHAEi1CAOjsrFh6ICGqWON
         YqZ8PhLAcpW5THU8m5ELSCFMq0Bhk+8P6GA9n2Ml9TN4ujWJsta2MyquhZIP3nreRjxf
         +36w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Mo+LWAFQuK+r6cHWGkp/I3Z012M+tghG+9Psuzfdx2KBElnzW
	sxRov+l7Cs/16tC0n5P9iKI=
X-Google-Smtp-Source: ABdhPJyUlr9O9fpRYY0bItTB38A7U/Rq/uMzB5t7wrjNKQVmgrZMgfeZObeS2stqY70Au6hk3ZHlPQ==
X-Received: by 2002:a2e:954b:: with SMTP id t11mr10737708ljh.98.1591614993085;
        Mon, 08 Jun 2020 04:16:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4b43:: with SMTP id y64ls1992898lfa.2.gmail; Mon, 08 Jun
 2020 04:16:32 -0700 (PDT)
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr12442610lfd.32.1591614992158;
        Mon, 08 Jun 2020 04:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591614992; cv=none;
        d=google.com; s=arc-20160816;
        b=FMVVMPgwuaYn0AoRzNB+aLCydxOt8+Ez6WL6YwQIP4kRcJ9qPZfCqD69DhorfcmtB8
         V9JmjeZYyQBnj0ytmTn5cojchV8wMqde2/cgxJL1r87abZIzxK6SxAkEIQ0+xzbdZgst
         sE4fDQRgzmtXKK69PwaFYUsRgi4ipWdA27QLKZcG2PeL8q7QDEYzilsTrFR6jfTrorKU
         9SZXGaAhpNXlnPgYHDoT/z64Tez+d+LyOGiGlAMYaVzZ+e3hT5kCH7tADWnAJGePDm5Q
         DC9GM+xryD65Z8KpzUjxLoYoVxYY70LlotYEKv0yz3OpCYREufZETArGyzfCtgxxEwlM
         L/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=TaZSs+zW7vgdxGkhuz7C4UrrMK7QyRt0qkRkSi2wzy8=;
        b=nMp+PzJdf2dgLBLn0OMtyuePgUWY7u+6BWV6x0TQIE/rXnd1yw/cY0cZ8ALckzo6Re
         DexSA43XPIFTTp/G6EfHpSt2PA5ccyrlE1bOCGXJensjeYwI+isqgYx3KbppFfUHA495
         0vT/zaKrvPCWuIG42CAf3Lrx5PhMCTNAoEZyF/0obP7T40sJsrV+VIeoNeBO8XXIqrmP
         cK6UOKGSGOGMEPDFbaYYdDDpSbBU0lMcDVv3AHCuUK5mTP+MPzINr1riB+CzoI6tmHV0
         xp71sHIsaM2+QIV55MRRMQbkECsdflyFzP+C1m/QB4tsv6vveYwIoOkSAixqmiXWe9/x
         uK/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v16si552761ljg.4.2020.06.08.04.16.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 058BGVQq029487
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 13:16:31 +0200
Received: from [139.22.122.178] ([139.22.122.178])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058BGUGM007400;
	Mon, 8 Jun 2020 13:16:31 +0200
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
Date: Mon, 8 Jun 2020 13:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608104255.18358-5-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 08.06.20 12:42, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Add a new IVSHMEM PCIe virtual device for a 2 peer
> IVSHMEM demo communication.
>  (0 = root cell, 1 = baremetal / linux-demo)
> Also add the corresponding memory regions for state and output
> aligned at 64k boundary.
> 
> Update the bdf numbers for consistency across all platforms.
> Assign domain = 4 since the platform already has 4 physical
> controllers.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>  configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>  2 files changed, 89 insertions(+), 16 deletions(-)
> 
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index cda1614a..05517751 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -24,9 +24,9 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[18];
> +	struct jailhouse_memory mem_regions[22];
>  	struct jailhouse_irqchip irqchips[4];
> -	struct jailhouse_pci_device pci_devices[1];
> +	struct jailhouse_pci_device pci_devices[2];
>  	__u32 stream_ids[2];
>  } __attribute__((packed)) config = {
>  	.cell = {
> @@ -56,8 +56,35 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		/* IVSHMEM shared memory region for 00:01.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		{
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x89fe10000,
> +			.virt_start = 0x89fe10000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
> +				 JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0x89fe20000,
> +			.virt_start = 0x89fe20000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x89fe30000,
> +			.virt_start = 0x89fe30000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
> +				 JAILHOUSE_MEM_WRITE ,
> +		},

You are missing the state table. Was this tested?

Please derive from existing examples, using the same patterns and sizes.
Reference is qemu-arm64.

Jan

> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 1),
>  		/* ctrl mmr */ {
>  			.phys_start = 0x00100000,
>  			.virt_start = 0x00100000,
> @@ -210,13 +237,24 @@ struct {
>  	},
>  
>  	.pci_devices = {
> -		/* 00:01.0 */ {
> +		/* 00:00.0 (demo) */ {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.bdf = 1 << 3,
> -			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.domain = 4,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>  			.shmem_regions_start = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		/* 00:01.0 (networking) */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 4,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
>  	},
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index 3ac0b57e..41f4c456 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -19,9 +19,9 @@
>  struct {
>  	struct jailhouse_system header;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[36];
> +	struct jailhouse_memory mem_regions[40];
>  	struct jailhouse_irqchip irqchips[6];
> -	struct jailhouse_pci_device pci_devices[1];
> +	struct jailhouse_pci_device pci_devices[2];
>  	__u32 stream_ids[30];
>  } __attribute__((packed)) config = {
>  	.header = {
> @@ -44,7 +44,7 @@ struct {
>  			.pci_mmconfig_base = 0x76000000,
>  			.pci_mmconfig_end_bus = 0,
>  			.pci_is_virtual = 1,
> -			.pci_domain = 3,
> +			.pci_domain = 4,
>  			.iommu_units= {
>  				{
>  					.type = JAILHOUSE_IOMMU_SMMUV3,
> @@ -97,8 +97,33 @@ struct {
>  	},
>  
>  	.mem_regions = {
> -		/* IVSHMEM shared memory region for 00:01.0 */
> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		{
> +			.phys_start = 0x89fe00000,
> +			.virt_start = 0x89fe00000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0x89fe10000,
> +			.virt_start = 0x89fe10000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{
> +			.phys_start = 0x89fe20000,
> +			.virt_start = 0x89fe20000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		{
> +			.phys_start = 0x89fe30000,
> +			.virt_start = 0x89fe30000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe40000, 0),
>  		/* ctrl mmr */ {
>  			.phys_start = 0x00100000,
>  			.virt_start = 0x00100000,
> @@ -374,14 +399,24 @@ struct {
>  	},
>  
>  	.pci_devices = {
> -		/* 0003:00:01.0 */ {
> +		/* 00:00.0 (demo) */ {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 3,
> -			.bdf = 1 << 3,
> -			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.domain = 4,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
>  			.shmem_regions_start = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		/* 00:01.0 (networking) */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 4,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> +			.shmem_regions_start = 4,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
>  			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>  		},
>  	},
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d1f2b18a-2891-61c3-d66b-ce0c95575c09%40siemens.com.
