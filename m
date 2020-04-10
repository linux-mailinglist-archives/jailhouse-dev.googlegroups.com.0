Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJ6BYL2AKGQEGJ76YOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF391A488E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Apr 2020 18:36:55 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id q27sf2319607edc.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 Apr 2020 09:36:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586536615; cv=pass;
        d=google.com; s=arc-20160816;
        b=IygCeBH4v26xSqkRJnXilcVHc8rYQiIL918vpj1Yx7gAP5gHYSeqp7LpE0MF3AT5zn
         2Fpj57g2TBTh3wPZhIZXPafI0JD2xdD3+DXIuoro+rolu9UudFDPwdjocKLcw5iYBHqR
         xAd03fENqrS25kmP7Zax8l0dS7VCHcULirs7ilty3o2IzJuuCsfvAonOEkrwFJ6xcQbj
         s11TVDccYyQgOQtZuvkgkQ8xIArz1pvRx0n7UY8CV+RWfx3A3edQ9ENqYA6ACAB7fUvx
         YW1v2FLSq078zQn2mO2U7G2ZyuywXUb5ckAEWnXxnfXi7VePryy+xvJIo3m/TPqbhXta
         zRBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=DuQZ5pyLSdyDERYYotIjZKdQcv+NfhTeUHdik7U/8Q8=;
        b=h5fgBEG4iOyacyBEU/MdlDVPUC79UL8lA/DUaBxjEbXgTX/57UviJGrgxYknt2L6GF
         Ipr4Hf1TknQvoI41BOazB5qOTALuaCCQzNusFbQ4BNBx+cDn/GfrKrhIapWPk8pcFy6e
         CLfKhpWTGR3aGvUbiZrW++D6L7aA3GTdRQHGSIIv9SEFSmIZlln4sXyb6CXU9p5/excD
         ldH1heTLWT39V7+kwK1KWRZYgBBMOPJVRCL2Zd9pA5V//Dt5riL3iiERLYeWDqbF1AVJ
         wy7b3Xl+NZUv1h4EvoieF/5iS/iJaeWzbPcWtcXYbbSYzfRElN6zoapacto2R0oNc+vd
         TcbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Gz3y//pl";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DuQZ5pyLSdyDERYYotIjZKdQcv+NfhTeUHdik7U/8Q8=;
        b=IH8+66Um1hlpuk7zTIidraU6E/n4PpnIqhOJ6bHqi62Khu/r0MG2hGxRXjFuD3uiad
         bi8HauPfE1lAHlgkKoAD++TIw+61l9AmIBXtBRUjjKZtLwhnbKJMv+W2PQvxgX9bzvJd
         R6gfwJo3U0g/Z7STOA4Fe1Q9E+naL7N1mSz1oy5ojAobgpW6l+7VT4AZf8p+LGmktaUi
         wMr8Lvp0jgi+CfC3mww6aHS9liBkE2C2amgNua5q2MmdPRk8qzDTScFKiKwCkpZUVg1M
         t2GDC0vxt36VTj9rhGB4cHd0WKmBRQHNvyygcH9z/AGQNlxGGPZh8H6u+BZwXN5DXHFu
         WpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DuQZ5pyLSdyDERYYotIjZKdQcv+NfhTeUHdik7U/8Q8=;
        b=tx/kemy67Kz6P8CkZd4265OKxa9DtaNO4e7tQW59v8mkOmzDkGgaRvTXYxhe0dc2gL
         eOXweoswWxZAF5qnAcJWmXsPRWPRuev56/1xStAXl5yfYAANU+hAvkVYQ64dYbwFU2MA
         P99CPwgIvZYK94fzakFk8hcV02ZtwmLFrWro2c94X8lJ94tOIm/1yXthLQcsFZKHFWIE
         Oyd0nJ7h7nPATzYVRWEcufjoJ1dKu8S2D2x0yVcCwlv9d3VKX3e5Dc7eLZFiDxd1g3UN
         baTU+jZDrBiMYpmIpYUi+L0mniqRr/+uMM2eeLqpmb5awNDjwIoGMX2J7xiwKEWh+VJD
         +XIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZOxW/tX3ny8wxkubv/cinu+FG5p9VneQnppu2yZt0npLvEr5S9
	PsmdYPA2Vats6FlxMKpFZdo=
X-Google-Smtp-Source: APiQypL+PUxDy1Dq82EFtJAT3Qs2R01lL2V7xMOj9lsOQSzht/lrrJuS3H3LCQ/6zfBXIR5De8JuWA==
X-Received: by 2002:aa7:ca14:: with SMTP id y20mr5770367eds.104.1586536615365;
        Fri, 10 Apr 2020 09:36:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:704d:: with SMTP id r13ls12340596ejj.4.gmail; Fri,
 10 Apr 2020 09:36:54 -0700 (PDT)
X-Received: by 2002:a17:907:2098:: with SMTP id pv24mr4753189ejb.22.1586536614691;
        Fri, 10 Apr 2020 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586536614; cv=none;
        d=google.com; s=arc-20160816;
        b=CokaWV/JMlkT8aSoCTP2cY4m4DtnaLDPasQQZkb0WOeggSBcSqTwvIlsSI0K0ILGBK
         qqyK+z4CSSPCaDZvfUCZpUXkcZik/HSrf7KSvb8z70W+/7kdPMoOPuIzLLSvl4zswP1M
         Urtx2FouOB92UvGG+SQcqaKLSCsWsEcKNBNxwRTGB0c7V54sV1YZu7hvFeBGBEvIR5jV
         PAR9/Y8ByS4jyUIpxAhI+JKUBPbfX0l6n95IG/bLVnqchsU3hb/qNTLqmEo3Xk7GKB0Y
         KmHMrwb16un8fQ+cd+owxDtXkJznWBTQTrsgI4GBIhpZ+uRY7b1i1CxBuNU5QHtXwzEq
         hzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+KdpP7+pOTVND0ZIoIBkIP4cARvVFgqd5Ys7X2Mgkv4=;
        b=Xkuymy87c5R2bQmPw47dGxKota/l4k7hr7l/LAviblA9aHcmXKCZxSxEBTjJXmCJe1
         R7Hu5GUvB2n0xSNUJQ5AoZGOEnEvZnuVvbmjY0m9JQhSNBgks9A8rrn55vxRAZDdVYxE
         F9/+//aGhhet1ujt00EI6osIccY1bmdQ5JP2aEdz9I6Q20t19a6LceRBO1CihyXTMXxO
         1gj+MoRL/TN/XzLMSUmP6/UfNKcXZ3QV2LMzvVaSgYYdnV+ow34qW5meZp6BAihvFqjJ
         tE0VU11+xBB7fs7T+oCunuMiY9yU9cMiOO22RfSmydzQ9q0DDy7iP7K2kGJ6bip91jmb
         Na8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Gz3y//pl";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id t24si103608edy.3.2020.04.10.09.36.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 09:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([80.187.82.138]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MXHOz-1jkNLU3fWf-00WBMx; Fri, 10
 Apr 2020 18:36:54 +0200
Subject: Re: [PATCH V1] Cell configs for imx8mp EVK board.
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200410151804.28069-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9f43c071-4e86-3dea-d0b3-b89e9fa6e25d@web.de>
Date: Fri, 10 Apr 2020 18:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410151804.28069-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:qmfkCYVJhNX6es1gHc3b+9gL0Pc2yWTta2xp8F8kcPtyVdgGo2l
 Ss8yHYaxYgAzlWGKLW3rEvpUuIMZzzpjoqT9fgrUIx9QqiYmKoJw2zt2k2qCWxn9Z6vE0OP
 44ENnA2682Tr+uqQsBN6wkvsXBBAVKbUFbTZCOpYf+X8cyRnnaNOxoTlBnreOchR8TEeBcB
 SOpn3eH7KynxcpjH7kNQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yvFU8bAv4ts=:xN3oIlnU4O2xu0dNUyeK6J
 WysOl+zBRFIfSeE5aoGHjL/LKo50toKdlOUNS7jrHxgLTs93kRNjijLMHGJax0yQN255OyAOP
 /X/3ztPZFzXe03M+wbEI0M5UTRKAEfl797cIkCTITXf/BK6fF4Did3ZJjwBV66IRttXLCkKEG
 6uUFD4YRlvtqRVo3Z6V9z5YZA2MmvkneK1dXpFpbVOdb0mrN8Ls1xQVTXjVVIsIXn/Qyo/S58
 v4lv5QiF9yH9LD263gwW9lDUdt7wU1gyh9QeYfv3Mo3wmxQD/LhhyMwfRKG+cof92Xx2yMf41
 T808/AnFGvkAyrLsQyw20Cy6hzT+NWzKSIljJ1TYf0bB0wOTePaxA8GwXQ+7/EzsDVD7R9XI3
 70+l/imyFE1dBxBr6eWY8G71e9OWp+KD4+UVOGROh9CzfeCmVcS8DJEeFTVwVNpGGjKgohc+u
 +9iCw+BdVTCj5FPsPG7HEwKZGn3IDDcffjwP2XSmWt1JdJTEABKWIT+6sDUUQchJy5uVaZ7QH
 mUItJEaebXRXDwXGqCS2OhX57B+EamkXAjt6ETTnMtKBjoxMMP4K5vGhb77fI2oBe2YTvkpnL
 8Ej7XrVn9/v7byNCLU2+hKihJPdz1op9zbGFV+O/bToDjcAr1KtBTerSIatGFqXWc0miQdTgR
 LwbvuIBTeeF+9AtjhBxBafOSXqE8hKM2I8Zgs0vieZjW/uuWRkCd+f+4/8VMIEB8vzq3nFl4D
 8/WZycDxfdumCed2J+SkTd6PUl/acEI65bZ6uWUh/D2r6jUzBWU1rJoQSOQA9s3jywmRuN8dz
 zTujGn9DqdxxM2umzY0sAGjr5Al+kgYociFTyRZuP8GYM9RK28L9mHJTsVomchdjKEpzBQW8R
 pTawI97fS2p+FQj4YxZUvue9JyFiEp5Kzqc3oywaQ0CltNXl7T2VwiBgEEwmMRfu0/We9UdfZ
 Kpaxwg/ehh0X0iIkRXsjFl1u+8HNccZolzXyfukNGUl80xBupO6b/POvqmt5Er3O0ahmsEFh0
 Iiccc0IPq14GaoS4biy40nvwTZaK0yGaclHUp4PYRul/+xdaV5FwCRAbuUI7F1bocjm0lIebW
 vx73nqqKA/OJE2WyDE1ABilnuBeyQB7Kl+ivvfxYPxdCroU7ERKJpRdqKfgzfN9TCYvqf5ZeG
 AZMmr1RbbljtVd81OC2eidWpFJn2DFlJkc6lTfjpP4CPYR2Bnf2SeZMS1lP3GRfngftOgi6LC
 0w8etA1rdNtfzjatvI0x+HqXl6kgZwRpb3x+nYK0dEFVZtCzIWy6At9Y1lYQmuPpppLuQY7v6
 MEQdkmxLCGCk6znTNRa80gk0+PbbgWS10S02Vk9BWGWe4ULjQoC9PKdL5mpbOsaRtoFeR5Tm
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="Gz3y//pl";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 10.04.20 17:18, Alice Guo wrote:
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   configs/arm64/imx8mp-inmate-demo.c | 126 +++++++++++++++++++
>   configs/arm64/imx8mp-linux-demo.c  | 167 +++++++++++++++++++++++++
>   configs/arm64/imx8mp.c             | 191 +++++++++++++++++++++++++++++
>   3 files changed, 484 insertions(+)
>   create mode 100644 configs/arm64/imx8mp-inmate-demo.c
>   create mode 100644 configs/arm64/imx8mp-linux-demo.c
>   create mode 100644 configs/arm64/imx8mp.c
>
> diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
> new file mode 100644
> index 00000000..795c616f
> --- /dev/null
> +++ b/configs/arm64/imx8mp-inmate-demo.c
> @@ -0,0 +1,126 @@
> +/*
> + * iMX8MM target - inmate-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[8];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "inmate-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		/* IVSHMEM_IRQ - 32 */
> +		.vpci_irq_base = 76, /* Not include 32 base */
> +
> +		.console = {
> +			.address = 0x30890000,
> +			.type = JAILHOUSE_CON_TYPE_IMX,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x8,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory regions (demo) */
> +		{
> +			.phys_start = 0xfd900000,
> +			.virt_start = 0xfd900000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd901000,
> +			.virt_start = 0xfd901000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90a000,
> +			.virt_start = 0xfd90a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90c000,
> +			.virt_start = 0xfd90c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90e000,
> +			.virt_start = 0xfd90e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART2 */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM: start from the bottom of inmate memory */ {
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 96,
> +			.pin_bitmap = {
> +				0x1 << (76 + 32 - 96) /* SPI 76 */
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 1,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
> new file mode 100644
> index 00000000..ff0cdffb
> --- /dev/null
> +++ b/configs/arm64/imx8mp-linux-demo.c
> @@ -0,0 +1,167 @@
> +/*
> + * iMX8MM target - linux-demo
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +/*
> + * Boot 2nd Linux cmdline:
> + * export PATH=$PATH:/usr/share/jailhouse/tools/
> + * jailhouse cell linux imx8mp-linux-demo.cell Image -d imx8mp-evk-inmate.dtb -c "clk_ignore_unused console=ttymxc3,115200 earlycon=ec_imx6q,0x30890000,115200  root=/dev/mmcblk2p2 rootwait rw"
> + */
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_irqchip irqchips[2];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "linux-inmate-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.vpci_irq_base = 154, /* Not include 32 base */
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +			.phys_start = 0xfd900000,
> +			.virt_start = 0xfd900000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd901000,
> +			.virt_start = 0xfd901000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90a000,
> +			.virt_start = 0xfd90a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90c000,
> +			.virt_start = 0xfd90c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0xfd90e000,
> +			.virt_start = 0xfd90e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
> +		/* UART2 earlycon */ {
> +			.phys_start = 0x30890000,
> +			.virt_start = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* UART4 */ {
> +			.phys_start = 0x30a60000,
> +			.virt_start = 0x30a60000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* SHDC3 */ {
> +			.phys_start = 0x30b60000,
> +			.virt_start = 0x30b60000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM: Top at 4GB Space */ {
> +			.phys_start = 0xfdb00000,
> +			.virt_start = 0,
> +			.size = 0x10000, /* 64KB */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
> +			/*
> +			 * We could not use 0x80000000 which conflicts with
> +			 * COMM_REGION_BASE
> +			 */
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3d700000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* uart2/sdhc1 */ {
> +			.address = 0x38800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
> +			},
> +		},
> +		/* IVSHMEM */ {
> +			.address = 0x38800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xf << (154 + 32 - 160) /* SPI 154-157 */
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 2,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 (networking) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
> diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
> new file mode 100644
> index 00000000..b870a788
> --- /dev/null
> +++ b/configs/arm64/imx8mp.c
> @@ -0,0 +1,191 @@
> +/*
> + * i.MX8MM Target
> + *
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Reservation via device tree: reg = <0x0 0xffaf0000 0x0 0x510000>
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[15];
> +	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xfdc00000,
> +			.size =       0x00400000,
> +		},
> +		.debug_console = {
> +			.address = 0x30890000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_CON_TYPE_IMX |
> +				 JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +			.type = JAILHOUSE_CON_TYPE_IMX,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0xfd700000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.pci_domain = 0,
> +
> +			.arm = {
> +				.gic_version = 3,
> +				.gicd_base = 0x38800000,
> +				.gicr_base = 0x38880000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "imx8mp",
> +
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +			/* gpt5/4/3/2 not used by root cell */
> +			.vpci_irq_base = 51, /* Not include 32 base */
> +		},
> +	},
> +
> +	.cpus = {
> +		0xf,
> +	},
> +
> +	.mem_regions = {
> +		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
> +			.phys_start = 0xfd900000,
> +			.virt_start = 0xfd900000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfd901000,
> +			.virt_start = 0xfd901000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xfd90a000,
> +			.virt_start = 0xfd90a000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
> +		},
> +		{
> +			.phys_start = 0xfd90c000,
> +			.virt_start = 0xfd90c000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		{
> +			.phys_start = 0xfd90e000,
> +			.virt_start = 0xfd90e000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ,
> +		},
> +		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
> +		/* IO */ {
> +			.phys_start = 0x00000000,
> +			.virt_start = 0x00000000,
> +			.size =	      0x40000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* RAM 00*/ {
> +			.phys_start = 0x40000000,
> +			.virt_start = 0x40000000,
> +			.size = 0x80000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Inmate memory */{
> +			.phys_start = 0xc0000000,
> +			.virt_start = 0xc0000000,
> +			.size = 0x3d700000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* Loader */{
> +			.phys_start = 0xfdb00000,
> +			.virt_start = 0xfdb00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* OP-TEE reserved memory?? */{
> +			.phys_start = 0xfe000000,
> +			.virt_start = 0xfe000000,
> +			.size = 0x2000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +		/* RAM04 */{
> +			.phys_start = 0x100000000,
> +			.virt_start = 0x100000000,
> +			.size = 0xC0000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +		/* GIC */ {
> +			.address = 0x38800000,
> +			.pin_base = 288,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 0000:00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 0000:00:01.0 (networking) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 0,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 0,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
>

Thanks, applied this as well as the imx8mn patch.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f43c071-4e86-3dea-d0b3-b89e9fa6e25d%40web.de.
