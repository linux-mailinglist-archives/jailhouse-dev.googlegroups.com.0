Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2PSUH6QKGQEETXQO7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 580742AAE24
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 00:04:10 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id s22sf2486211ljs.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 15:04:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604876650; cv=pass;
        d=google.com; s=arc-20160816;
        b=PASFvjxU1cDF/yYerYKo0Td4zFReg4vGnj4S0l1/KgzzkXBP55ExV4cfpPHGk7vt0G
         eNVneFb7NO+Da+QhaCvpp6fN6DLxif3xyVrk7Ni1LN6+mCfHCWG9qjpDs58Cgua9XaQK
         Rt7AZA40WHS0CQwF/kMTLhleHZzXO66kKPXHZ8W0VfwoXaO4lAj5ZWgPs9Kd+REVWTzr
         ttRuo5cpuDhoCPPxxA67Wpj8aPQ5h/2zPh2jO4oBIdOSxGKlDn9ljicFsKF6iPG0VgYY
         sESK5J4Yb7eY9DDncGtjEVO2vFcna3VRkwxSnCDMlFpnPzN7GA3Gq0HY4InVGjWDdyoo
         ldUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=gPO6lXR5gpHrSK3bCLgOXeblZRaVNqm6yr64aPD/im0=;
        b=ywCg/XceEpEUTuC2l1ukkNnC1dPYmPdtELpvfgYWxdvqrfQidUPxC57lJh9Z37pvI9
         7bivarPnrdlGDyZIBK+7gCrWSM32glPyWmetT1ZcrotK+21imKKMGklBRlxJKCPs8/qO
         sklt6dpeg2Vf3xP/y9916zUec/ZarhArDul/RtMS7MH0BwbPxMocxIUanNoPPXEvYcSO
         5BNdGTaDdX5v2MWPGOeYukOHRLorgBv5iFSKW0uWH6ixfk3eMV7miUMdrnUyBf2Wubj9
         Xw4+X6phsEl2rqbZ/6W5Irc0GY3YAAZf4V+Hvmje3L5acxe5MtBnW6Egi/JmG8LpiMKY
         Fptw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gPO6lXR5gpHrSK3bCLgOXeblZRaVNqm6yr64aPD/im0=;
        b=sKWPlLBqkZNQ7GIXRzvmiZjsHws19E11h1t+FTjsuTzKoUF1t+RRjgalMzuSIQwqDW
         HcFIyuomtjkOLNBWrRoct0pSnoAV/3/P8NiKOwaH+JBeumaz1C9CTKRKTxZvF1xz/9pZ
         RlRwKaOHXOYtgcWw0Pcjgdo3UwXENKAjE7HuA63JBA+jYXDVjyc14kIzIk3BGmvfjdwG
         a8EUx8Wc78KJ2Nh3zrcgvm7VpLgYQPw5cglH2H1QxzZxgPFzWRJYhB85wZeCjnlKrg4V
         P+M1PqTyzubyQeMawnsaZ3WEoOjE3dRZaVQYR/DL2bbMwYkP5MPjblrx3OngpBJZQ+q7
         IIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gPO6lXR5gpHrSK3bCLgOXeblZRaVNqm6yr64aPD/im0=;
        b=pBqU37KAyqZRnrZqqlMedZJ9LC+31MCOa6SNzilHluwlVU+GQ4i5p7RUeLy3uot0Pg
         LsZZOuRg0pNwS68W5eMquv++ge9uU2EDtnAug2TioJIQTDnu3BGJAbbADFgm3l29VmIa
         mdGHEYXQVeFCAZvXZsFwc4dQg0GzUIbJhPAdRw8Acra5o0I2tD+r1CsGn5voWvRS8MyZ
         9F9hpQJbhVjlkM9R/Eiizxeh05f10p0Mm7tbYsfM3BW0hly1rSuNXEXhMuGbYDxqN6zc
         DFQbZp28p1QVIw5vSyBu4IVDMQtg6CYrYSkOPOgNArNYwVGL2Jrviayo4hranQsXC5Po
         dBkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UFq5hiRVgHLVHTzmO8iFxAg4Fgx2yxSJwNkRoQzgL51skr0eD
	A1Edyi/zjCIBO6mpMCmMVss=
X-Google-Smtp-Source: ABdhPJx1OWEUXR/ZYeoELJoGYXO/0JW5miR7GVwrpFTcYq2BsMKzaEN1oE+nwGtWq+HHoef0YtnRyg==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr5093037ljg.333.1604876649921;
        Sun, 08 Nov 2020 15:04:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:480e:: with SMTP id v14ls2360412lfa.2.gmail; Sun, 08 Nov
 2020 15:04:08 -0800 (PST)
X-Received: by 2002:a19:6d16:: with SMTP id i22mr111030lfc.390.1604876648561;
        Sun, 08 Nov 2020 15:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604876648; cv=none;
        d=google.com; s=arc-20160816;
        b=TTcoFA5h4XG+holdihDbUGjrp2YRKpXKJ5d1xFnhSz0ARfsQOiNb6J/27KiQDAU9lO
         0N7Pq6vmROYiaSq02/ekTC7XSmPP9RdlMCaWZeniOTfIYixDNFvpXnC8czVHu712ks2r
         phw7PQxt6aZlHgOZXgGi5+1tFZSAeHfb+JxY98H0yF0WUAjPydY3ITD69sBJ0zFoenaN
         jZccuH3cW3PKo9tQmkGUDPTmyNBO/X5JUhYVM05SVEOaQVuklJUpEec/GlyVhf5AVyvV
         Hgdk4HHYentw0Nt4284I8ubuNPBOC4Rd4oNwH+BrutNoyadXus6XhM1W1Vz0tRBrgrTP
         H5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=77MReiIhnQ89Q1fmqKgVhUeplRrjirFtn+H83t3348E=;
        b=MVBTcVMTynFbzcrJy6Nlh8n8LAvCVzTLyYA8nraecXRi38QRuVPC84bE2KmqMXRvtC
         924Fg6uRKQkBNcCBgK33yriHuJjynjpR65uRKKFiR0Qrp9B/3hSzr9JSlBXuGIX3AMF6
         kZ8pDlNmXkihphoK/jki5ShClUbAuMX+VzIiNNk04dGqSdYSim0r3wV0IMT2lA4s+ARG
         zZrAsK9/sR4nAHZwmGIPN4c2z6x3hBAV7Hp4uM9k4lC9iQqxeowIrvqW7Bz/lAXJdmP3
         Jj3XYmrJdbx2c92d0QmsiKYf6DyXF5mxKZDJwaqhdzO39u/rsep5bS+COJg4Gi59HWQI
         AX+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 26si240435lfr.13.2020.11.08.15.04.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 15:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A8N46qW021123
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Nov 2020 00:04:06 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8N45Qn027790;
	Mon, 9 Nov 2020 00:04:05 +0100
Subject: Re: [PATCH 3/3] hypervisor, configs: remove arm_mmu500 sid_mask and
 update imx8qm config
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com, "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        Peng Fan <peng.fan@nxp.com>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
 <20201104153648.35076-4-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d637b307-9dcc-5a02-9bc6-9fa07d636979@siemens.com>
Date: Mon, 9 Nov 2020 00:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104153648.35076-4-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 04.11.20 16:36, Andrea Bastoni wrote:
> I.MX8QM fixed mask is factored-in into the stream_ids.
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  configs/arm64/imx8qm.c          | 6 ++++--
>  hypervisor/arch/arm64/smmu.c    | 3 ---
>  include/jailhouse/cell-config.h | 4 ----
>  3 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
> index d63c73cf..566fd0ad 100644
> --- a/configs/arm64/imx8qm.c
> +++ b/configs/arm64/imx8qm.c
> @@ -54,7 +54,6 @@ struct {
>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>  					.base = 0x51400000,
>  					.size = 0x40000,
> -					.arm_mmu500.sid_mask = 0x7f80,
>  				},
>  			},
>  
> @@ -209,6 +208,9 @@ struct {
>  	},
>  
>  	.stream_ids = {
> -		0x11, 0x12, 0x13,
> +		/* bits 30 - 16: SMR MASK
> +		 * bits 14 - 0 : SMR ID
> +		 */
> +		0x7f80011, 0x7f80012, 0x7f80013,
>  	},
>  };
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index 191ff154..d2824985 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -157,7 +157,6 @@ struct arm_smmu_device {
>  	unsigned long			pgshift;
>  	u32				num_context_banks;
>  	u32				num_mapping_groups;
> -	u16				arm_sid_mask;
>  	struct arm_smmu_smr		*smrs;
>  };
>  
> @@ -564,8 +563,6 @@ static int arm_smmu_init(void)
>  			continue;
>  
>  		smmu = &smmu_device[num_smmu_devices];
> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
> -
>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>  		if (!smmu->base) {
>  			err = -ENOMEM;
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 472cb4bb..d6315489 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -279,10 +279,6 @@ struct jailhouse_iommu {
>  			__u64 tlb_base;
>  			__u32 tlb_size;
>  		} __attribute__((packed)) tipvu;
> -
> -		struct {
> -			__u32 sid_mask;
> -		} __attribute__((packed)) arm_mmu500;
>  	};
>  } __attribute__((packed));
>  
> 

This concept of masking it SMMUv2-specific? Or would it be worth to
introduce it generically, e.g. by using a 32-bit mask?

If not, then we should model a stream ID entry via a union, something
like this:

union jailhouse_stream_id {
	u32 long_id;
	struct {
		u16 id;
		u16 mask;
	} __attribute__((packed)) mmu500;
} __attribute__((packed));

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d637b307-9dcc-5a02-9bc6-9fa07d636979%40siemens.com.
