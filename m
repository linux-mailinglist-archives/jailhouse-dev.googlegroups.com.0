Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSFFUCFQMGQEL4Z6KPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64042D80E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 13:21:45 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id a15-20020a056000188f00b00161068d8461sf4310241wri.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 14 Oct 2021 04:21:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634210505; cv=pass;
        d=google.com; s=arc-20160816;
        b=x9RZk296YEBV7v2gMlUyGjjP1vIQZy4CDxKq5bucxsjGNDylWto7Lm4Nnmfi1XqJxA
         ie8lSuqrVS0dBUKwx0NBxUNHwWXYKpWAwIGKqch5Y2KEJ5h82/jvxfgN9cqlQ0vzCSD9
         zQyC2SEDFcesqE5kSR8oTLpnyGxK8cSHeETs9BwO9dU9q9XBTD+GTY7yFX59AWI4UMQm
         /6CIwmlDmNo+wW0CevGHHxsqJ8fgUtk+g8JRDjtCt2mayKHwu25YLP+HmrjInKylOelU
         xGAoSnbEXYYDa2wLn/J3r2WAtaU1g5ZPHoR1EiM2MqNtnEpf2qGnLyqLiNM8BL+Tdr4h
         24iQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=WDYXRWTG6RTcC87oZCfkTTEiV1H8wD77SkDZlArbA1A=;
        b=fkiQvIKzwNVZs9cYeGBWoJF0bB009KsX5tXQmvse9qIqOQKOq+N8gSsTH84/HDN2bZ
         3MtA+yHVb96DVrMitfPL6Bbm5mKo0qwrlz9BoORriSZ6Zg9EriXfE1z06HkOQBH2SBND
         E8P3/+xwLQdJmb2V4dR8ETlzRbF8b7d+7+qldgJWvS8hjQ/76jmlBku0see9iizpQCKS
         S4YI7mZWGmB+vXZei5bGGWNgPpfs3idDyGug7+oAT9C/rQA0G9cI6/SYc9nK6Bi42rub
         pTmIki2LEzI4U6oJDcqbHDkFwmZrUm7XAapKR3S7DTnorB0uzsdrXc/A6pV0MX0jsvPF
         B8Lg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WDYXRWTG6RTcC87oZCfkTTEiV1H8wD77SkDZlArbA1A=;
        b=PKecf8nVcXfgWWSES8+XHmjPK1ZZT9g5flGIEA+evu4KX6Qd31RLJxhrC87iFP+OVT
         q1UPCp09cW5AyP1XyisJumnOdkwUJsBjmuDQEF+lnXGucCs/3MoSB1jd0FrPJvibCwnq
         WfIcHCNvZpC7yfT8DQpKnR9T+Sxzcd9nMH8+d2Swo2do64nHvW9XhIBhI9tlUFDdP3k8
         sjNiVB1kUTwof+fZp962ufNBwZrp4a7Qc3wxfDHQ1MnUV2W4JbBfsLn77086HnPNgfcR
         iUe8VTiLLYRE/RaQon8gZq+1AMYf+wP7WDv7RJ51PH5Se+S8+8C5jcY2UHPDvIHKIszH
         VhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WDYXRWTG6RTcC87oZCfkTTEiV1H8wD77SkDZlArbA1A=;
        b=SznklKdjVTQA0wDzfgIw8cjouyrp32WKY3kzkcONDXpF2UCXld2RjAhIbLQECoB/tk
         xLkGrMIpCOkHiN1AP2sUrXesAO7fY9jZH4GiiIKNswjQijH5Evu93j51Ob/KaNYQuzdn
         kc+oyE3pl+IVq8ZSEOA8EevZHfi5hHthma3mP2ujsLtBv2It73SEGVdWjEFVc1e786Lq
         MoFDjv1rCl0K+oSvDcYOgEVZviYd7tPj2wuXSUBTSU0wJKNc8mwZfuItEvcvvqnR6tZ9
         mF96RvixvQy84eGdu7E/kx0tOu7e1mljdrL1wA9ulMrJDjfcqrxdTlv6AwynTxOyyEhy
         rN8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530al9z5W+Fv7rvXSaQsuJz/l5bECBAtFLxtxSSv6TyA8z+2JkZo
	jHOjJXQ7SHHgetNyO56zqmY=
X-Google-Smtp-Source: ABdhPJwt4LUyii/z7z6EjiXQbPyAvJcN2EVDl4ED+MbuNIdVjRcAB6/FiXAMwlXfHCU8EsZd8cGi+Q==
X-Received: by 2002:adf:97d4:: with SMTP id t20mr5803235wrb.174.1634210505097;
        Thu, 14 Oct 2021 04:21:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a285:: with SMTP id s5ls2813353wra.1.gmail; Thu, 14 Oct
 2021 04:21:44 -0700 (PDT)
X-Received: by 2002:a05:6000:1889:: with SMTP id a9mr6067055wri.400.1634210504029;
        Thu, 14 Oct 2021 04:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634210504; cv=none;
        d=google.com; s=arc-20160816;
        b=zPGv7ai3stXO4ocFoYIylEl0ShyDM1UTGNertahkr5SIbdYpCzXs20QfPmrLdp47IV
         Z8OgXC+2fSpjvthfDusM2vmtMO41s71TUJuE9h5lywPHJ0Ro6GKVAklbBvijjMUFsyjr
         dB8Ogvh405Vc4IIxIFKyaEj1vtGdUW3yDhYkt2A/Fceszq928Js3khJzHFdpthCc9um0
         9vUTi1HJvOtxnI949ZqPEyngR9yRzvKyqYrjPWCE4IgaM+GWuxHUhXDkXXRf5TENvcbH
         1xI82JktQww+r2ekeRdYD0U2fFW4Ap0bA0iPyxcBO571mZaDlP32E2uK+d43Hrnd4HPK
         sGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=dOfD9soBaajhzNpzExUPh2s71lVvfVrlOAFBalqcct4=;
        b=MGnh2s0vnmX8iVur00hpSU1cKOvZAHRBYrnVW2tmyvDBNBtNwBUZ93ysVQzG5VpOq4
         GXyD3fYVPE+7BPvFSZmYpdwwHAt4fQiVWHmN7xXicYjPHVLUJlm613PLff/Fl3QxJQcL
         JrSXq6mZj9tCr+uxJSddR/jAJuDjmAb9wQgOJNdTDAfv0y84oTiDhvs7Z+yU90G/+3l+
         ytT3UVeXq1enyDGSt41qHRXRa8fjbv1Id6HFBLF7RTgF4csY+KozI2mK8ovHufYZIB9B
         xZI+uYH6+1xNcMb7YwfLLkyx1q6YRwsyo8lOWqbQSSLbJHjfYyN/xVG86dZ+QPzouTrz
         NI5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f9si786804wmg.2.2021.10.14.04.21.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Oct 2021 04:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 19EBLhTR016701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Oct 2021 13:21:43 +0200
Received: from [139.22.44.3] ([139.22.44.3])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 19EBLgs8012870;
	Thu, 14 Oct 2021 13:21:43 +0200
Subject: Re: [PATCH 1/2] configs: arm64: Add support for NXP LS2088ARDB
 platform
To: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>,
        jailhouse-dev@googlegroups.com
References: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <adf4fcd1-8e60-fb93-e1ae-209079c55873@siemens.com>
Date: Thu, 14 Oct 2021 13:21:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
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

On 12.10.21 13:56, Anda-Alexandra Dorneanu wrote:
> Add root cell, inmate cell and Linux demo cell configuration files for NXP
> LS2088ARDB platform.
> 
> Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
> ---
>  configs/arm64/ls2088a-rdb-inmate-demo.c | 122 ++++++
>  configs/arm64/ls2088a-rdb-linux-demo.c  | 141 ++++++
>  configs/arm64/ls2088a-rdb.c             | 556 ++++++++++++++++++++++++
>  3 files changed, 819 insertions(+)
>  create mode 100644 configs/arm64/ls2088a-rdb-inmate-demo.c
>  create mode 100644 configs/arm64/ls2088a-rdb-linux-demo.c
>  create mode 100644 configs/arm64/ls2088a-rdb.c
> 

[...]

> diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c b/configs/arm64/ls2088a-rdb-linux-demo.c
> new file mode 100644
> index 00000000..b8e583c0
> --- /dev/null
> +++ b/configs/arm64/ls2088a-rdb-linux-demo.c
> @@ -0,0 +1,141 @@
> +/*
> + * Configuration for LS2088ARDB - linux-demo
> + *
> + * Copyright 2021 NXP
> + *
> + * Authors:
> + *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
> +	struct jailhouse_memory mem_regions[13];
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
> +		.vpci_irq_base = 85 - 32,
> +	},
> +
> +	.cpus = {
> +		0x2,

One thing I missed: This overlaps with the inmate-demo, and we only
assign a single core for Linux here. Can we make this 0xc (core 2 & 3),
like with the other ls* configs?

If it's ok, I'll fix this up in-tree (no need for v2 then).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/adf4fcd1-8e60-fb93-e1ae-209079c55873%40siemens.com.
