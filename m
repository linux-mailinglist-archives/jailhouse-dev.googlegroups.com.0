Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBEUWUWGQMGQEJPR5TOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E2B466D11
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Dec 2021 23:39:14 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id g11-20020a1c200b000000b003320d092d08sf531614wmg.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Dec 2021 14:39:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638484754; cv=pass;
        d=google.com; s=arc-20160816;
        b=I775SyoGG2rvT5Q6ZbeYdH6FVlxgadn8CwFdTmcazp755hwqY8zhv9wI2RQAY2CVZ0
         iTAMnIqctGxmhrZ95n1S8VuUr2ap/8PV9IAYtuocpQJ1TAq51TLXjj283wXa6dRRbJ01
         weVT3VqRfXf2AKWlVHI0ID/fQ7jAdLXjDuZX/w7MYrMcLb6N91W1i2C0v6SlUhhSjYUW
         udJrB8UDH7RsiAZM+Y8yK0nDgAJPEC5Zg3acPASXGh2Fi5Q0evyyRLALt4WD6Ek+Us9p
         kNVJpQ8GTpTcR0RGtlXYANV6oF6epoKGOq+A914R+dTAlZix1aokTg7WiDN6TWuXb62x
         GsXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=Pr3aYW1TAexS+TbgQjcIuqmyrQF9HdEK1+7cXsMIRq8=;
        b=QOcRR2ExYfdpnL1fN/zqk4uoudDPqCx/jZ4GLKTR8eyOwObz0WxfVUYmzOQjSRxxcj
         3G2rx18+Jc3UwUDltPTOuKasH0fnmZnnCB8f9ZYsqx7FHwf25e4aqwzvdsSGy8QU4yYj
         U+etDFIbnf90r+8+YWK7IGHTpy9h8uitrhgfQ5EFb2fRZVuRBaxG12QFSVQRxBxelkli
         ipL3wjK3ptDrt2YrC5ywMiCrV5/Rc3VEBKHyzBuxZswC7ys5RN+I06kipf1YR17f/f+w
         435pzZouema0O2LQuVwYfIaRvyk+3esDINCLghZcvfUmKWF2sGb20DYtba1AVTBFmawl
         BjRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZApZQODR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Pr3aYW1TAexS+TbgQjcIuqmyrQF9HdEK1+7cXsMIRq8=;
        b=VL/PyYMNOrxMRs645txezrkYSRP0OcwIcL95ajchT12sA+1YA+QVEuiYUPH7fVioWX
         9rnU9eG/yoPYVsJNDuXfQUKS5M0J/VE+582khclFRaCzgzrSyvk2zc7CWgJrv0lK0ooz
         sK4jVxjdTfKO+igJze/zSaNQvkoPm24Yo7q3ZiEb8wehmqGDkDqGzTgx+Q2ozNVGm591
         DHwbVhXPOqw+zdE1ssDfDdN4rgpCPsSfgsTkqa86dWEH3mjJB6mliLzKNLh7vUiEeTME
         sLmASqiOS1ZfNjxT2tM9iIDmTGENNX7rDmwaoZS69z0EjTJfDjkelVEJ5SY051pnC6Zf
         C2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Pr3aYW1TAexS+TbgQjcIuqmyrQF9HdEK1+7cXsMIRq8=;
        b=tbY2VPUxUKEcHIwcg1Eiq7Tws2kOiJ8mNFAJ1ECcUpaYVtnxa9a/wjpwESkdyvIo6O
         Eh/Qe84RGC8FcT8P74CJTCLZ/6m+gGuOgS5Rv0G+HlYa+jq8xsP+Z4/ZV/UJ7M1m80F6
         qxf/gRep662tSsIFzgK7XEanoiVzeOnKAFwXdYG5MlKUROz9+o5IOsbteNmKPu0XXu99
         nCarCJxYprZ4l+obTUccFxjznZ3bhdk5254e7gFt1KpGnhbKSOE9d46ZDPYGIgipMKB+
         1QS7FV+cTJaSn0O8szReFKH3EqM4b05xKUK6NRNWq37pVtQ7mfpL6K6Y7ZmYnKyDUp0P
         T60w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cHjVuw5GH2l6aIaJldtn6YVf1nwJWB8rYS0hLMQKGDYeDzeBA
	ubcIscIo5w+kROrXUOVaRsM=
X-Google-Smtp-Source: ABdhPJziaXAttP2pEs1P8SxD9DHvVnN+lX9bSWGz6PeIQujqRG+XjOISViRglXZfbWc+MFRRDJDtHg==
X-Received: by 2002:adf:f189:: with SMTP id h9mr18251577wro.463.1638484754443;
        Thu, 02 Dec 2021 14:39:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe0b:: with SMTP id n11ls6220wrr.0.gmail; Thu, 02 Dec
 2021 14:39:13 -0800 (PST)
X-Received: by 2002:adf:d852:: with SMTP id k18mr17739228wrl.391.1638484753460;
        Thu, 02 Dec 2021 14:39:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638484753; cv=none;
        d=google.com; s=arc-20160816;
        b=Qe6V/v3+W0Oj0umQGmMcS78wJzqaKBMeLNHR1ZpWRZS0cDJ830ditZlyQPjYiVmifv
         OBqbBZlnNI5HAPZtIqV1jralNwMLzKwZbHmba3c1cSGSHwVk8y047dAeZGoO2um4GWSN
         /W5M+DShvBtI3YTo/tX3yJsQeFwStM/bUk79+/9jArRzjXZHYIKu2RSGNGsJ3KYowNee
         G2T7DnfSI0Q7qw+/DR/lUwQhbF+CcRMztq4G0J2flGKwPHUagfcRkqi36Q/TpAvtpk7x
         CoCF82ZDoWriDYz313XkxhyciG/8ZW31amFrDL10MnofU4LZITOaueu5u3gHheDWLrut
         UlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TGdkHD7ob5RXcnk6PWRU+o15tYit8ew9715gwJm2K/s=;
        b=eRIFTxMYzaoFn1RL6DNq2ygjcoz8gvZhiE/w7vNeQsxMmhjbzMc4OMHV9mzH6uUIg2
         r9kzKgXMV7iOmlpQqz+ASDd0YBcwegrPqRmygjnv6RlGG6q9eStuDAzeDVvVQUGfCP8k
         dOdQjlNm52V5t9Vk06TMk9mOWOcCdRjtSsYGuk3gXY/MWWScz+km2EQ2/w5vXS81R7j+
         IkX6YKKD3zBNJu5Bq0leUuxCZfdQDS9WN7b/IFqzpOzG91+6DtNOgBwgjYgqr5AENxAO
         bYVSEo5EBJHNMKGayQngr96QTxhbKHpbyCl8UqA69E8RfPEtJWWlybh2SPTxoKAU/kEU
         JJCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZApZQODR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z3si239335wmi.2.2021.12.02.14.39.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 14:39:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4J4rV90hGfzxs4;
	Thu,  2 Dec 2021 23:39:13 +0100 (CET)
Received: from [172.23.3.21] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 23:39:12 +0100
Message-ID: <51f0d564-bcba-23b2-1651-1525d3b35e4d@oth-regensburg.de>
Date: Thu, 2 Dec 2021 23:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [EXT] [PATCH v3 2/2] [RFC] configs: imx8mp: Convert a cell using
 helper files
Content-Language: en-US
To: Stephane Viau <stephane.viau@oss.nxp.com>,
	<jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
References: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
 <20211202154800.2671-3-stephane.viau@oss.nxp.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20211202154800.2671-3-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=ZApZQODR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 02/12/2021 16:48, Stephane Viau wrote:
> Pick a cell and convert it to show the influence of these helper files.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> 
> ---
> 
> v2 -> v3:
> - Get rid of the *_NUM macros in config files and have them computed
>    instead (suggested by Ralf)
> 
> v2:
> - Convert an existing cell to see the impact of the helper files
>    (suggested by Jan)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>   configs/arm64/imx8mp-inmate-demo.c | 161 ++++++++---------------------
>   1 file changed, 45 insertions(+), 116 deletions(-)

nice diffstats.

> 
> diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
> index 127392df..169177ad 100644
> --- a/configs/arm64/imx8mp-inmate-demo.c
> +++ b/configs/arm64/imx8mp-inmate-demo.c
> @@ -1,126 +1,55 @@
>   /*
> - * iMX8MM target - inmate-demo
> + * iMX8MP target - inmate-demo
>    *
> - * Copyright 2020 NXP
> + * Copyright 2020-2021 NXP
>    *
>    * Authors:
>    *  Peng Fan <peng.fan@nxp.com>
> + *  Stephane Viau <stephane.viau@oss.nxp.com>
>    *
>    * This work is licensed under the terms of the GNU GPL, version 2.  See
>    * the COPYING file in the top-level directory.
>    */
>   
> -#include <jailhouse/types.h>
> -#include <jailhouse/cell-config.h>
> -
> -struct {
> -	struct jailhouse_cell_desc cell;
> -	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[8];
> -	struct jailhouse_irqchip irqchips[1];
> -	struct jailhouse_pci_device pci_devices[1];
> -} __attribute__((packed)) config = {
> -	.cell = {
> -		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> -		.revision = JAILHOUSE_CONFIG_REVISION,
> -		.name = "inmate-demo",
> -		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> -
> -		.cpu_set_size = sizeof(config.cpus),
> -		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> -		.num_irqchips = ARRAY_SIZE(config.irqchips),
> -		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> -		/* IVSHMEM_IRQ - 32 */
> -		.vpci_irq_base = 76, /* Not include 32 base */
> -
> -		.console = {
> -			.address = 0x30890000,
> -			.type = JAILHOUSE_CON_TYPE_IMX,
> -			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> -				 JAILHOUSE_CON_REGDIST_4,
> -		},
> -	},
> -
> -	.cpus = {
> -		0x8,
> -	},
> -
> -	.mem_regions = {
> -		/* IVSHMEM shared memory regions (demo) */
> -		{
> -			.phys_start = 0xfd900000,
> -			.virt_start = 0xfd900000,
> -			.size = 0x1000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		{
> -			.phys_start = 0xfd901000,
> -			.virt_start = 0xfd901000,
> -			.size = 0x9000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		{
> -			.phys_start = 0xfd90a000,
> -			.virt_start = 0xfd90a000,
> -			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		{
> -			.phys_start = 0xfd90c000,
> -			.virt_start = 0xfd90c000,
> -			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		{
> -			.phys_start = 0xfd90e000,
> -			.virt_start = 0xfd90e000,
> -			.size = 0x2000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		/* UART2 */ {
> -			.phys_start = 0x30890000,
> -			.virt_start = 0x30890000,
> -			.size = 0x1000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> -		},
> -		/* RAM: start from the bottom of inmate memory */ {
> -			.phys_start = 0xc0000000,
> -			.virt_start = 0,
> -			.size = 0x00010000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> -		},
> -		/* communication region */ {
> -			.virt_start = 0x80000000,
> -			.size = 0x00001000,
> -			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> -				JAILHOUSE_MEM_COMM_REGION,
> -		},
> -	},
> -
> -	.irqchips = {
> -		/* GIC */ {
> -			.address = 0x38800000,
> -			.pin_base = 96,
> -			.pin_bitmap = {
> -				0x1 << (76 + 32 - 96) /* SPI 76 */
> -			},
> -		},
> -	},
> -
> -	.pci_devices = {
> -		{
> -			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> -			.domain = 2,
> -			.bdf = 0 << 3,
> -			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> -			.shmem_regions_start = 0,
> -			.shmem_dev_id = 1,
> -			.shmem_peers = 1,
> -			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> -		},
> -	},
> -};
> +#include "cell-helper.h"
> +
> +/* Name, cores, entry point */
> +#define CONFIG_INMATE_NAME		"inmate-demo"
> +#define CONFIG_INMATE_CORE_BITMAP	(0b1000)
> +#define CONFIG_INMATE_BASE		(0x00000000)
> +
> +/* Memory & peripherals */
> +#define CONFIG_INMATE_REGIONS		\
> +	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)), /* RAM */ \
> +	\
> +	MEM_REGION_ROS( 0xfd900000, 0xfd900000, KB(4)),    /* IVSHMEM */ \
> +	MEM_REGION_RWS( 0xfd901000, 0xfd901000, KB(36)),   /* IVSHMEM */ \
> +	MEM_REGION_ROS( 0xfd90a000, 0xfd90a000, KB(8)),    /* IVSHMEM */ \
> +	MEM_REGION_RWS( 0xfd90c000, 0xfd90c000, KB(8)),    /* IVSHMEM */ \
> +	MEM_REGION_ROS( 0xfd90e000, 0xfd90e000, KB(8)),    /* IVSHMEM */ \

superfluous whitespaces.

> +	\
> +	MMIO_REGION_RW( 0x30890000, 0x30890000, KB(4)),    /* UART2 */   \

No need for the backslash.

> +
> +/* GIC */
> +#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x30890000)
> +#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
> +#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
> +	/* interrupts 32..63 */         \
> +	0,                              \
> +	/* interrupts 64..95 */         \
> +	0,                              \
> +	/* interrupts 96..127 */        \
> +	1 << (76 + 32 - 96), /* SPI */  \
> +	/* interrupts 128..159 */       \
> +	0
> +
> +#define CONFIG_INMATE_VPCI_IRQ_BASE	(76) /* IVSHMEM_IRQ */
> +
> +#define CONFIG_INMATE_PCI_DEVICES	\
> +	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
> +
> +#define CONFIG_INMATE_CONSOLE \
> +	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
> +		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
> +
> +#include "cell-create.h"

In my opinion, it's good to have your patches and helper macros to 
achieve more condensed configs. And they don't have any impact on 
existing configurations. The open question is, if there are any other 
plans on modifying the configuration format. We had a lots of discussion 
on that topic before.

So before posting a new series, I'd say to just wait for further 
comments; no need to hurry.

Thanks!
   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/51f0d564-bcba-23b2-1651-1525d3b35e4d%40oth-regensburg.de.
