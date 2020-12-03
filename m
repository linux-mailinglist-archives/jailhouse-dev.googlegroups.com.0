Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEOUL7AKGQEKOE4AGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BC2CCF8E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 07:36:13 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id u25sf389614ejf.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 22:36:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606977373; cv=pass;
        d=google.com; s=arc-20160816;
        b=swTsxCdhlwASlAnHFzHsYe2I8IfeYEhGgRIkdlLZZFscNyTgolvzk8xDsD8J/dEuCr
         1nzaGS6tnWlj4Upb/jSowzP9UUF/4pzmjvVPP46p7PKZmciQdpmrjUjEY2ZReLYLfDx9
         jryRleuspOVispp0Tq5wDzJ8mF1Kb0N3KDPMGUms0d3ISgsmW6F2eDTnXsA/5RmUijXl
         hdrSRr6nand/U+DgdBn01VWWvN8v7TwXmxggpGk7UY3mc1ExcBlMYG/ul13mfgkoXrh9
         fLCywQw5ZID/te8qy/RZue2QkUCUo4CkVY4WxOeQYbS9di/cyhabapJPQ6Tt0/OBSX/F
         i2Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:sender:dkim-signature;
        bh=GY/hVl05nXGPI4ymE4DFiU1wEWCqHThKI3EG7NPZDtc=;
        b=UAw9rh3CCDLSuTrX6iIQk6+GH23RuTI6EkufLfaA6gJnyFuJUGpQYUAtegBDQ24Z2v
         lVninzbj8AO0ZdYiRmK7i2BCfsDimI6LTiaKIR1oAC/3lYYFzBdQbX474OC1rJdBvNg2
         4tB46l0X6rm4S6zXAEJlI5uk/P3vKt7gl8RWHIePLOUfv5BIfVE24DbxyHX1Nj65u2MT
         hS8/5T03od0CJs0lCm7v/5e22KNsTmr3mYc6XuYQe9XYcIG3+iTSCjQBhQx6qmayER7H
         6R5ZfKXa+1wa3aFrShIVjihipLuZs3u6ucCjQJcec91Cx1lcDoklnhxaLdphlhKn6zWH
         mK1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GY/hVl05nXGPI4ymE4DFiU1wEWCqHThKI3EG7NPZDtc=;
        b=nYhLGD9Z0fgC8vhdWXJlyoUwN6dD6s4sgbG2uICU8UnamI8fnXe6+Lm6OBwly8pv9I
         aEumB2kpVg4uOF7YU2u7/l/uZgF9Pj87FFTzR7qd7yoW0PdklszM3ZZciFnbGYDDHfFD
         Otis4D2+Z59uAC58cfmwQnkLs+WqNr6IetR/nv9YeVBU5tDKGP9eYr2pTo3m9NPdxkSL
         FGr7QqscS978LeTFp04Ekq/rM+oGANPI3WqN+OPnYbYDp6uxBdCa/4YsHb8c95W4JXSv
         4xL5q48U6UiOsVl0PQUunC6z1Q0EdNiv5+O3hle5TqcBPkgSrscqjiFmTrYXiAW5L3Pr
         /OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GY/hVl05nXGPI4ymE4DFiU1wEWCqHThKI3EG7NPZDtc=;
        b=T9wkLCxQlOfDPDUbECJT+WiGGGQ2AQwtwLpbIj3zL0L6NbdpPnMnqZDDruURACSGmT
         axcdulirNWyh9weZ3bDMoBobNBJFxESZC7mBYvMRFFopO9WNvPBM62S4cHQR8Q3ppYZ9
         AhpDr3ZOPOUpLvGa/4PEzOBEEMHn7e9FscZNLkFhJZkfzXbcWSAJYyc8zJdeYfGFIfzZ
         gaqNwD44VHI5D9eumPH/Y1Oarwxh9IGy7N/406vdT8d8cjiaF+gaks2L2+ZKor9xlSzu
         8qgjIUtGRuVWLXZn/RefM8nQH3eXNJQ+ovgDWdX9TrwX0cgrgKP/GfeX099pn2rRjcZC
         44gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Zn5Cbwt9kaZ4mbmkbYgTFTQPYm029DIzG3pnMr7faDvPsLTqS
	O/N5/BrFWWXDiUEt6d+cwfE=
X-Google-Smtp-Source: ABdhPJyeLlX7BFk8J7rweofaVVryLJYsrarazroM6ktNJJeGAmqW/jxfUPLm48H4U4DcT4x1Cn55Bg==
X-Received: by 2002:aa7:d407:: with SMTP id z7mr1573877edq.234.1606977372951;
        Wed, 02 Dec 2020 22:36:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4890:: with SMTP id v16ls1260894ejq.9.gmail; Wed, 02
 Dec 2020 22:36:12 -0800 (PST)
X-Received: by 2002:a17:906:118c:: with SMTP id n12mr1242104eja.167.1606977371927;
        Wed, 02 Dec 2020 22:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606977371; cv=none;
        d=google.com; s=arc-20160816;
        b=ctmZDmNsBp0VL8MMlEupQe7W3jaF//ZHjamibfoUkvBXZbj/gHbuz9kD17dfMXjM++
         sxWAI/4HQrplu+RiwGQPX9FZRRHLPl5FnuB4jvuuJgK24E7nRTlkwilHD2uZNBDpfxsg
         T3XKOM8Vidb/35sZ3+Af89Xw20hX6kKPAmKBh46sODbPCozuKeTCtWtRTZBVCG6L+0ke
         Hsn+OASFWwDfhIeGVrqAaJg8QqDRO1MgtgMgkd+ppsWmczgDPhzVphSfeJqVOFuKcyWt
         GSAPIUiwHVVEc0CKW0hLmGnMp6BZvNlninm0CFxZ5DFOktsjYLfbMHqOR4a3q+99ZAd9
         y2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=a1C+owEokMtz4VxWDdHH0R6ZG67xJxqGuYSLckI8cJU=;
        b=Z2qfcmsSSGDNg8kIvwEBziZizDSuoRbAXuOrECBZBfRiSG1WiEJ7bPBKb2xCc0+9PN
         M1NxGPV+CD5gt5yh3aqde8BlJakBq3CuHSiMb5V5DEvAXi8wfzpq1GFCMhlAlFa0FBBA
         EC3trhv8cmIULwHCw4yysnPdHb+ujdmaBV4eUEBzO4YQwdoScMAQY74yNevVI9X2UsSK
         ogzmOh3f4e6slIaY9DaUDVLfxPFFGfGbxRjHArbGQAH/F8niQPGTA+VgMUGmdKzkofs8
         qC1FhGjT7JTMMXcbnR5oCaZJh0+aQwQI4XGus4kngR3yTb8jPed7pxgRIlaTFEEos/H1
         GaIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j6si16371edl.2.2020.12.02.22.36.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 22:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0B36aBXo028682
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 07:36:11 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B36aAnO016655;
	Thu, 3 Dec 2020 07:36:10 +0100
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
Cc: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, Peng Fan <peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
Date: Thu, 3 Dec 2020 07:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127114140.37179-1-andrea.bastoni@tum.de>
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

On 27.11.20 12:41, Andrea Bastoni wrote:
> The SMMUv2 allows filtering bits when matching stream IDs before they're
> passed to the TCU. In this way multiple streams legally get the same
> translation.
> 
> On boards such as the ZCU Ultrascale+, the master ID needed to identify
> the corresponding SMMU stream ID may be dependent on a specific AXI ID
> that is set by the PL (and could be IP specific).
> 
> One single fixed mask to pass to the SMR to compact multiple stream IDs
> before they "hit" the TCU is not flexible enough. The use-case is to
> compact similar PL-originating masters and have the SMMU behaving the
> same for them (e.g., they're assigned to the same inmate). At the
> same time, one needs a full stream_id to assign e.g., different GEM
> ethernets to different inmates.
> 
> Update a stream_id to support two different interpretations:
> - for the SMMUv2, provide an explicit mask + ID.
> - for the SMMUv3, keep the current single ID.
> 
> This commit updates the SMMUv2 / v3 --including configuration--
> accordingly.

CC'ing Nikil and Peng on their affected code.

> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>  configs/arm64/imx8qm.c                  | 16 +++++--
>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>  configs/arm64/k3-j7200-evm.c            |  2 +-
>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>  configs/arm64/k3-j721e-evm.c            |  2 +-
>  configs/arm64/ultra96.c                 | 11 ++++-
>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>  include/jailhouse/cell-config.h         | 18 ++++---
>  12 files changed, 114 insertions(+), 55 deletions(-)
> 
> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
> index f13ca7bc..e8e8b217 100644
> --- a/configs/arm64/imx8qm-linux-demo.c
> +++ b/configs/arm64/imx8qm-linux-demo.c
> @@ -19,7 +19,7 @@ struct {
>  	struct jailhouse_memory mem_regions[18];
>  	struct jailhouse_irqchip irqchips[4];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[1];
> +	union jailhouse_stream_id stream_ids[1];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> @@ -194,6 +194,9 @@ struct {
>  	},
>  
>  	.stream_ids = {
> -		0x10,
> +		{
> +			.mmu500.mask = 0x7f8,
> +			.mmu500.id = 0x10,

Would list id before the mask.

> +		},
>  	},
>  };
> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
> index d63c73cf..2ec4f4dd 100644
> --- a/configs/arm64/imx8qm.c
> +++ b/configs/arm64/imx8qm.c
> @@ -20,7 +20,7 @@ struct {
>  	struct jailhouse_memory mem_regions[15];
>  	struct jailhouse_irqchip irqchips[3];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[3];
> +	union jailhouse_stream_id stream_ids[3];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -54,7 +54,6 @@ struct {
>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>  					.base = 0x51400000,
>  					.size = 0x40000,
> -					.arm_mmu500.sid_mask = 0x7f80,
>  				},
>  			},
>  
> @@ -209,6 +208,17 @@ struct {
>  	},
>  
>  	.stream_ids = {
> -		0x11, 0x12, 0x13,
> +		{
> +			.mmu500.mask = 0x7f8,
> +			.mmu500.id = 0x11,
> +		},
> +		{
> +			.mmu500.mask = 0x7f8,
> +			.mmu500.id = 0x12,
> +		},
> +		{
> +			.mmu500.mask = 0x7f8,
> +			.mmu500.id = 0x13,
> +		},
>  	},
>  };
> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
> index 90a0ce4c..ace9cd3a 100644
> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
> @@ -26,7 +26,7 @@ struct {
>  	struct jailhouse_memory mem_regions[19];
>  	struct jailhouse_irqchip irqchips[3];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[1];
> +	union jailhouse_stream_id stream_ids[1];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
> index c3ac331d..d0c8aee3 100644
> --- a/configs/arm64/k3-j7200-evm.c
> +++ b/configs/arm64/k3-j7200-evm.c
> @@ -21,7 +21,7 @@ struct {
>  	struct jailhouse_memory mem_regions[32];
>  	struct jailhouse_irqchip irqchips[6];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[1];
> +	union jailhouse_stream_id stream_ids[1];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> index 5b6aa82e..1b8b3c4c 100644
> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> @@ -27,7 +27,7 @@ struct {
>  	struct jailhouse_memory mem_regions[22];
>  	struct jailhouse_irqchip irqchips[4];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[2];
> +	union jailhouse_stream_id stream_ids[2];
>  } __attribute__((packed)) config = {
>  	.cell = {
>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> index ab13fedd..aa5b47a9 100644
> --- a/configs/arm64/k3-j721e-evm.c
> +++ b/configs/arm64/k3-j721e-evm.c
> @@ -22,7 +22,7 @@ struct {
>  	struct jailhouse_memory mem_regions[40];
>  	struct jailhouse_irqchip irqchips[6];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[30];
> +	union jailhouse_stream_id stream_ids[30];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
> index db65ae01..19be84ae 100644
> --- a/configs/arm64/ultra96.c
> +++ b/configs/arm64/ultra96.c
> @@ -21,7 +21,7 @@ struct {
>  	struct jailhouse_memory mem_regions[11];
>  	struct jailhouse_irqchip irqchips[1];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[2];
> +	union jailhouse_stream_id stream_ids[2];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -161,6 +161,13 @@ struct {
>  	},
>  
>  	.stream_ids = {
> -		0x870, 0x871
> +		{
> +			.mmu500.mask = 0x0,
> +			.mmu500.id = 0x870,
> +		},
> +		{
> +			.mmu500.mask = 0x0,
> +			.mmu500.id = 0x871,

Only realizing now: That mask is an "ignore mask", right? Bits set there
are NOT matched against the id. That's modeled after the hardware? Is
this really intuitive? This one confused me at least.

> +		},
>  	},
>  };
> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
> index bdcb04b3..1a5d29b3 100644
> --- a/configs/arm64/zynqmp-zcu102.c
> +++ b/configs/arm64/zynqmp-zcu102.c
> @@ -23,7 +23,7 @@ struct {
>  	struct jailhouse_memory mem_regions[12];
>  	struct jailhouse_irqchip irqchips[1];
>  	struct jailhouse_pci_device pci_devices[2];
> -	__u32 stream_ids[8];
> +	union jailhouse_stream_id stream_ids[3];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -147,6 +147,17 @@ struct {
>  	},
>  
>  	.stream_ids = {
> -		0x860, 0x861, 0x870, 0x871, 0x874, 0x875, 0x876, 0x877
> +		{
> +			.mmu500.mask = 0x0,
> +			.mmu500.id = 0x860,
> +		},
> +		{
> +			.mmu500.mask = 0x0,
> +			.mmu500.id = 0x861,
> +		},
> +		{
> +			.mmu500.mask = 0xf,
> +			.mmu500.id = 0x870,
> +		},
>  	},
>  };
> diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
> index d4b7529d..d306818e 100644
> --- a/hypervisor/arch/arm64/smmu-v3.c
> +++ b/hypervisor/arch/arm64/smmu-v3.c
> @@ -1045,8 +1045,9 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>  	struct arm_smmu_device *smmu = &smmu_devices[0];
>  	struct jailhouse_iommu *iommu;
>  	struct arm_smmu_cmdq_ent cmd;
> -	int ret, sid;
> +	int ret;
>  	unsigned int n, s;
> +	union jailhouse_stream_id sid;

I prefer (inverted) X-mas tree ordering, not only during this season.

>  
>  	if (!iommu_count_units())
>  		return 0;
> @@ -1057,7 +1058,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
>  			continue;
>  
>  		for_each_stream_id(sid, cell->config, s) {
> -			ret = arm_smmu_init_ste(smmu, sid, cell->config->id);
> +			ret = arm_smmu_init_ste(smmu, sid.id, cell->config->id);
>  			if (ret)
>  				return ret;
>  		}
> @@ -1076,7 +1077,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>  	struct arm_smmu_device *smmu = &smmu_devices[0];
>  	struct jailhouse_iommu *iommu;
>  	struct arm_smmu_cmdq_ent cmd;
> -	int sid;
> +	union jailhouse_stream_id sid;
>  	unsigned int n, s;
>  
>  	if (!iommu_count_units())
> @@ -1088,7 +1089,7 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
>  			continue;
>  
>  		for_each_stream_id(sid, cell->config, s) {
> -			arm_smmu_uninit_ste(smmu, sid, cell->config->id);
> +			arm_smmu_uninit_ste(smmu, sid.id, cell->config->id);
>  		}
>  
>  		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
> index df92fb7a..9c625c54 100644
> --- a/hypervisor/arch/arm64/smmu.c
> +++ b/hypervisor/arch/arm64/smmu.c
> @@ -84,6 +84,10 @@
>  #define SMR_VALID			(1 << 31)
>  #define SMR_MASK_SHIFT			16
>  #define SMR_ID_SHIFT			0
> +/* Ignore upper bit in ID and MASK */
> +#define SMR_GET_ID(smr)			((smr) & 0x7fff)
> +/* Mask is already specified from bit 0 in the configuration */
> +#define SMR_GET_MASK(smr)		((smr) & 0x7fff)

BIT_MASK(14, 0)

>  
>  /* Stream-to-Context Register */
>  #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
> @@ -152,7 +156,6 @@ struct arm_smmu_device {
>  	unsigned long			pgshift;
>  	u32				num_context_banks;
>  	u32				num_mapping_groups;
> -	u16				arm_sid_mask;
>  	struct arm_smmu_smr		*smrs;
>  };
>  
> @@ -360,7 +363,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
>  	return 0;
>  }
>  
> -static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
> +static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
>  {
>  	struct arm_smmu_smr *smrs = smmu->smrs;
>  	int free_idx = -EINVAL;
> @@ -388,7 +391,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>  		 * expect simply identical entries for this case, but there's
>  		 * no harm in accommodating the generalisation.
>  		 */
> -		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
> +		if ((mask & smrs[n].mask) == mask &&
>  		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
>  			return n;
>  		}
> @@ -397,7 +400,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
>  		 * though, then there always exists at least one stream ID
>  		 * which would cause a conflict, and we can't allow that risk.
>  		 */
> -		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
> +		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
>  			return -EINVAL;
>  	}
>  
> @@ -409,7 +412,9 @@ static int arm_smmu_cell_init(struct cell *cell)
>  	unsigned int vmid = cell->config->id;
>  	struct arm_smmu_device *smmu;
>  	struct arm_smmu_smr *smr;
> -	unsigned int dev, n, sid;
> +	unsigned int dev, n;
> +	u16 sid, smask;
> +	union jailhouse_stream_id fsid;
>  	int ret, idx;
>  
>  	/* If no sids, ignore */
> @@ -421,19 +426,22 @@ static int arm_smmu_cell_init(struct cell *cell)
>  
>  		smr = smmu->smrs;
>  
> -		for_each_stream_id(sid, cell->config, n) {
> -			ret = arm_smmu_find_sme(sid, smmu);
> +		for_each_stream_id(fsid, cell->config, n) {
> +			sid = SMR_GET_ID(fsid.mmu500.id);
> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
> +
> +			ret = arm_smmu_find_sme(sid, smask, smmu);
>  			if (ret < 0)
>  				return trace_error(ret);
>  			idx = ret;
>  
> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> -			       sid, cell->config->name);
> +			printk("Assigning SID 0x%x, Mask 0x%x to cell \"%s\"\n",
> +			       sid, smask, cell->config->name);
>  
>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
>  
>  			smr[idx].id = sid;
> -			smr[idx].mask = smmu->arm_sid_mask;
> +			smr[idx].mask = smask;
>  			smr[idx].valid = true;
>  
>  			arm_smmu_write_smr(smmu, idx);
> @@ -449,14 +457,18 @@ static int arm_smmu_cell_init(struct cell *cell)
>  }
>  
>  static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
> -					     unsigned int sid, int idx)
> +					     union jailhouse_stream_id fsid,
> +					     int idx)
>  {
> -	unsigned int root_sid, n;
> +	unsigned int n;
> +	union jailhouse_stream_id rsid;
>  
> -	for_each_stream_id(root_sid, root_cell.config, n) {
> -		if (sid == root_sid) {
> -			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
> -			       sid, root_cell.config->name);
> +	for_each_stream_id(rsid, root_cell.config, n) {
> +		if (fsid.id == rsid.id) {
> +			printk("Assigning SID 0x%x Mask: 0x%x to cell \"%s\"\n",
> +			       SMR_GET_ID(fsid.mmu500.id),
> +			       SMR_GET_MASK(fsid.mmu500.mask),
> +			       root_cell.config->name);
>  
>  			/* We just need to update S2CR, SMR can stay as is. */
>  			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
> @@ -471,7 +483,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  {
>  	int id = cell->config->id;
>  	struct arm_smmu_device *smmu;
> -	unsigned int dev, n, sid;
> +	unsigned int dev, n;
> +	u16 sid, smask;
> +	union jailhouse_stream_id fsid;
>  	int idx;
>  
>  	/* If no sids, ignore */
> @@ -479,10 +493,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
>  		return;
>  
>  	for_each_smmu(smmu, dev) {
> -		for_each_stream_id(sid, cell->config, n) {
> -			idx = arm_smmu_find_sme(sid, smmu);
> -			if (idx < 0 ||
> -			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
> +		for_each_stream_id(fsid, cell->config, n) {
> +			sid = SMR_GET_ID(fsid.mmu500.id);
> +			smask = SMR_GET_MASK(fsid.mmu500.mask);
> +
> +			idx = arm_smmu_find_sme(sid, smask, smmu);
> +			if (idx < 0)
> +				continue;
> +
> +			/* return full stream ids */
> +			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
>  				continue;
>  
>  			if (smmu->smrs) {
> @@ -546,8 +566,6 @@ static int arm_smmu_init(void)
>  			continue;
>  
>  		smmu = &smmu_device[num_smmu_devices];
> -		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
> -
>  		smmu->base = paging_map_device(iommu->base, iommu->size);
>  		if (!smmu->base) {
>  			err = -ENOMEM;
> diff --git a/hypervisor/arch/arm64/ti-pvu.c b/hypervisor/arch/arm64/ti-pvu.c
> index 98c1fb5e..bbc633a0 100644
> --- a/hypervisor/arch/arm64/ti-pvu.c
> +++ b/hypervisor/arch/arm64/ti-pvu.c
> @@ -444,7 +444,8 @@ int pvu_iommu_unmap_memory(struct cell *cell,
>  
>  void pvu_iommu_config_commit(struct cell *cell)
>  {
> -	unsigned int i, virtid;
> +	unsigned int i;
> +	union jailhouse_stream_id virtid;
>  
>  	if (pvu_count == 0 || !cell)
>  		return;
> @@ -459,10 +460,10 @@ void pvu_iommu_config_commit(struct cell *cell)
>  			   cell->arch.iommu_pvu.ent_count);
>  
>  	for_each_stream_id(virtid, cell->config, i) {
> -		if (virtid > MAX_VIRTID)
> +		if (virtid.id > MAX_VIRTID)
>  			continue;
>  
> -		pvu_iommu_program_entries(cell, virtid);
> +		pvu_iommu_program_entries(cell, virtid.id);
>  	}
>  
>  	cell->arch.iommu_pvu.ent_count = 0;
> @@ -470,8 +471,9 @@ void pvu_iommu_config_commit(struct cell *cell)
>  
>  static int pvu_iommu_cell_init(struct cell *cell)
>  {
> -	unsigned int i, virtid;
> +	unsigned int i;
>  	struct pvu_dev *dev;
> +	union jailhouse_stream_id virtid;
>  
>  	if (pvu_count == 0)
>  		return 0;
> @@ -484,10 +486,10 @@ static int pvu_iommu_cell_init(struct cell *cell)
>  	dev = &pvu_units[0];
>  	for_each_stream_id(virtid, cell->config, i) {
>  
> -		if (virtid > MAX_VIRTID)
> +		if (virtid.id > MAX_VIRTID)
>  			continue;
>  
> -		if (pvu_tlb_is_enabled(dev, virtid))
> +		if (pvu_tlb_is_enabled(dev, virtid.id))
>  			return -EINVAL;
>  	}
>  	return 0;
> @@ -515,17 +517,18 @@ static int pvu_iommu_flush_context(u16 virtid)
>  
>  static void pvu_iommu_cell_exit(struct cell *cell)
>  {
> -	unsigned int i, virtid;
> +	unsigned int i;
> +	union jailhouse_stream_id virtid;
>  
>  	if (pvu_count == 0)
>  		return;
>  
>  	for_each_stream_id(virtid, cell->config, i) {
>  
> -		if (virtid > MAX_VIRTID)
> +		if (virtid.id > MAX_VIRTID)
>  			continue;
>  
> -		pvu_iommu_flush_context(virtid);
> +		pvu_iommu_flush_context(virtid.id);
>  	}
>  
>  	cell->arch.iommu_pvu.ent_count = 0;
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 472cb4bb..c94385b8 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -279,13 +279,18 @@ struct jailhouse_iommu {
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
> +union jailhouse_stream_id {
> +	__u32 id;
> +	struct {
> +		/* Note: both mask and id are only 15 bits wide */
> +		__u16 mask;
> +		__u16 id;
> +	} __attribute__((packed)) mmu500;
> +} __attribute__((packed));
> +
>  struct jailhouse_pio {
>  	__u16 base;
>  	__u16 length;
> @@ -424,10 +429,11 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
>  		 cell->num_pci_devices * sizeof(struct jailhouse_pci_device));
>  }
>  
> -static inline const __u32 *
> +static inline const union jailhouse_stream_id *
>  jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
>  {
> -	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
> +	return (const union jailhouse_stream_id *)
> +		((void *)jailhouse_cell_pci_caps(cell) +
>  		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
>  }
>  
> 

Looks good to me otherwise.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cfe00e93-66dd-ad37-e30d-2f4e889e4c56%40siemens.com.
