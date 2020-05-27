Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCGWXH3AKGQEZLCQLZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A71E439D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:28:41 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 141sf6003018ljf.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:28:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590586121; cv=pass;
        d=google.com; s=arc-20160816;
        b=CxCKbbzYT0abndFhCOC0ExI+JtLB+cAtRLxYU642wqsYIeG1qBA4t2BnRhNXUQILFh
         S4eRMc7fnxRf5EM/+i5vEc9PJ0aLzSVFjEJh2ZAAH8bFC2VGfs6af64oYdQk1s/ZBO+8
         NEwJ45mAxCZys3hmDIrqRJqJ41f4iUMna49Yq5CSa+iQo8wHWsz4fSeFUWWcYXsUuhvt
         uauIkcwlxxtNX0c60pLhRSIbGfU2X4Do+9Y0Nl7a3U3MV6EthNbxDWndu1QaNDhl/KLM
         uhNTfbC+id0/lADt/XlKf2z6z6ZxJKOncKM1KLygf+dNigncVZykxY97EQkRKNe6zsEp
         Pi2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4EKPXWGqHuFZ1df9qzcL6vv0Ve4Cm+FEgargeSwKyVU=;
        b=zvsePwayGzfvPwQRaFT00ckKVFhyoCFlT/tKBJk9QZauzIOYAJH8oRuhxM4ZAgXFcx
         xlX3yANCXozbtEg4rSheNAeDvnK/EMTVeWNqb4m8rbw30jhnSzqH4Tp66WLJz1VAIze1
         5Z9l24T72uPtUD3OLVNo9Kal93eyny723yCGTKaSTkFrAtWWIqugaMPxUJFJBcsNdu4C
         7/g5TEgorDeVVtrGmXyxDMwi9HMWnjstPLWLGKeCc+elVhFxs/riRJrv3vmlrPIIM72d
         xx5qks0BNLkqrVpncB+dJhkMFvXfHfT42AVmPqPO4jkcTrBnbvn+1fUueJEE+6z8prTc
         OAHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4EKPXWGqHuFZ1df9qzcL6vv0Ve4Cm+FEgargeSwKyVU=;
        b=n17HqsTNQ+X3XKKoHfZksi4bEiXd8k9OVrBJ9QYvkKVXaHUx9daVZy6rvizsqW8lwQ
         XXwX/V3j7CpzIXMuXvA8Eb5KggXNYBASuBlSrzMeKWiFJ9jxknKeYFtZxa4FJ8UJNcn0
         /Zsgs/fZCT3XDxq3dnHV7ZQH3XpJsZA+SmrK/4JE+eXgnkiIpVHxmXAb9fXxSmqRpzby
         q5DN64UGJRn6ki1M538UGtJf442TtA01IE9nHvsfzZKtrHIuYkDRqRpd3R29tEguDM0I
         Xx6eSdpJD54yH9/ukk+c74FWSCxXqqXLGUSTTQf8xg4Vak2/FufYFYOKb50aMIRDchfx
         12ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4EKPXWGqHuFZ1df9qzcL6vv0Ve4Cm+FEgargeSwKyVU=;
        b=jvj3aVDa2TQPGnYt6AdjT/GxGIlDQNWUQ/iQwPUyndo6n8DBH37U8FKsvufAPucPFm
         DPlVnh+/nld2EKwFRGSR42nmwe28a4kl6Ftco9w9RehuCtyjw4Ayx+70rn1K/NDBHADm
         EoFL0+kSLFCRtU/CvQgkvCRd/r2yNyvXODo5v9XnS0lE0c/fn3vEzyKcv+0uiVifcGiE
         r1JSJpxLvbxezIMpkLeeJFIoixR7/pwMJIbd2itcipQLp+cqMZrzjIoa+5moqNWqWCbc
         hrhpFBz8WWtm5tDQw4ILbZo8gHCwNWrUMSlLQPzL2OmcuU7+LvCU//7E3YCz/vm3puM4
         lujA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uuOZFAcvwbKQorbB87jlTo34dOtRnIUcKEMLAhgnl78tC4Prz
	IRis628ho8VsQU5ch+Bc3d8=
X-Google-Smtp-Source: ABdhPJxsVnpiE41HUGur4z4cVoqe0aOITy7XUI1V5Czx7cWyCgAZlnpqAsLISM2RJk9kAWAiwgDBIw==
X-Received: by 2002:a2e:8901:: with SMTP id d1mr3152018lji.37.1590586121195;
        Wed, 27 May 2020 06:28:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls4277628lfb.1.gmail; Wed, 27
 May 2020 06:28:40 -0700 (PDT)
X-Received: by 2002:a19:8447:: with SMTP id g68mr3203982lfd.132.1590586120234;
        Wed, 27 May 2020 06:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590586120; cv=none;
        d=google.com; s=arc-20160816;
        b=OOSBd1QPyIKSPucVac3UEpUkY/y3HpKsa138OLNYlLqU8/XQcWqbAYPW7IlpBf9EGy
         4aD0CEO8hv+Y85fJq5wFjt2vEv44AU2zRGix/MTykDG717lyklO7nLZie9mL7Y5j/XLf
         nO7k/sB9DYyOiR+DeEdrcn8SzXXHOISBokaiZwipZJ50cXyxSE2GfJ6zeRl1m0b+n1e7
         cch67YQdmCWSfGpX1JL/M+NL8wj72reIM0IbIapN6v2fl9rZjbHjP85dRMs5XhzJPt5/
         IgW/kUYjpDS1aE/nmkitq9o3yPh8LFMu+Wfwbun9M2nPQgrE4mrhvyYNMZz8F9ZTr9/r
         JS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uLZo1jQnId00WAEazYq6/W8q0WBPaiDn4frf30hFYx4=;
        b=Ecg9/b9mAyvfqxHgUix0sy+kF+yUBhlz2fBp/y49Y84nOYMzPb1szSJm2Slm56vndr
         5lupELIqPsQ/5ZMrUN3P6zKx4H5/kNT+rmu5/yT0PDGkM1jwEJq1ybvlnTTw9K48VPBg
         7cld8GZE2jWrA9AigrCaQxFd+wvAaHiThn3fGp1Ik3RlXIQlXOe34dfQUp2lLFZjzqmE
         lsdMR9qqqrWRDOqohz2gwwEXWHV6xYc3p1yUOOH6yfVrAVwrV/jJFySIQHFnHL3MGuuK
         LpmQI1HSEYLAH+VGELZIQufr0dY2RcNKo90KZf7o6Dvws+ORbNoOnjgG5PwyrT+VCdgT
         Wr4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c144si131560lfg.5.2020.05.27.06.28.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RDSddi021884
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 15:28:39 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RDSdvw002737;
	Wed, 27 May 2020 15:28:39 +0200
Subject: Re: [PATCH v1 1/4] configs: k3-j721e-evm: Describe separate IVSHMEM
 regions for demo
To: nikhil.nd@ti.com, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-2-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bb32dba1-73ca-e01c-f894-e24f482516ea@siemens.com>
Date: Wed, 27 May 2020 15:28:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527123225.31726-2-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.05.20 14:32, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> Current IVSHMEM regions are described to be used for ivshmem-net
> driver. For standalone ivshmem communication, these regions need to
> be added explicitly instead of using the macro.
> 
> Add regions for a 2 peer IVSHMEM communication
>  (0 = root cell, 1 = baremetal / linux-demo)
> 
> Also change the protocol to UNDEFINED so that the ivshmem-net driver
> does not get engaged. Switch bdf = 0 for consistency across all
> platforms.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  configs/arm64/k3-j721e-evm-linux-demo.c | 33 ++++++++++++++++++++++---
>  configs/arm64/k3-j721e-evm.c            | 33 +++++++++++++++++++++----
>  2 files changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index cda1614a..b6a56e2e 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -56,8 +56,33 @@ struct {
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
>  		/* ctrl mmr */ {
>  			.phys_start = 0x00100000,
>  			.virt_start = 0x00100000,
> @@ -212,12 +237,12 @@ struct {
>  	.pci_devices = {
>  		/* 00:01.0 */ {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.bdf = 1 << 3,
> +			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
>  			.shmem_dev_id = 1,
>  			.shmem_peers = 2,
> -			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>  		},
>  	},
>  
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index dbf0ca7c..0be0e19f 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -98,8 +98,31 @@ struct {
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
>  		/* ctrl mmr */ {
>  			.phys_start = 0x00100000,
>  			.virt_start = 0x00100000,
> @@ -396,14 +419,14 @@ struct {
>  	},
>  
>  	.pci_devices = {
> -		/* 0003:00:01.0 */ {
> +		/* 00:00.0 */ {
>  			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.bdf = 1 << 3,
> +			.bdf = 0 << 3,
>  			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>  			.shmem_regions_start = 0,
>  			.shmem_dev_id = 0,
>  			.shmem_peers = 2,
> -			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>  		},
>  	},
>  
> 

Do not disable the veth link, add the demo device instead.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb32dba1-73ca-e01c-f894-e24f482516ea%40siemens.com.
