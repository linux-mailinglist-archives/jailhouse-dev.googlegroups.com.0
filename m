Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBBVGRH3AKGQE4YKWKYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD461D73C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 11:19:03 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id y139sf3721607lff.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 02:19:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589793542; cv=pass;
        d=google.com; s=arc-20160816;
        b=eQztl7wHqcajwGTYh24LXgL1txTqr85VDxdDjRWntkM18MSWMyXYhHew6jsRyxfki8
         bvf+ZyEVllkbsKedwnucdtIuQrsvbn9c2C1qtF8D24+cwqorr5hZbnwkXciAbAOdFZKg
         JK+iVjZipFaoJSceX5meLAs2Sv1kz8EmPZxNjqN9WMxRjIaYlwS/M13zKQS+IaafXMNh
         qmYzZLY/jNiWiQqIhQy+qqkKCvX0sqBm44YL6FgmmcsHcsiSye8pzN1BiFl6e86zbbu7
         JG6tndqw8tb7vuD95U6XgDkptuWAKyrbQD6taV+qRUGY8KxcNCNu7s2Uc78NEIPLfewB
         8XYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=twRAwG0pxRtw3u1YXWbTP6ZI4i2D7sE8GQbCqTKyN3Q=;
        b=FkI3QhS5k9lozNOB4ASn21x7kc9zBOQWnWXye/4/rPaQ1K/sk7VZHWyoWd9dnUUpNv
         gUgF+id5GqGU5qp6hWwd9i4XzTpOhfPVRFGeuh+RaxZsHpnGtlmLMVWxsFbvlee5xCdg
         c+WJPKAqoqtXHtOHtj5ChwxH7k0HSEgE8IP7o2YftZmQP2YOZmBZiX2eSq4TGcEVc+NP
         a5XBJiI6D1UC5BK8XQ7pZ1vPIgemiGhopXw32DysCdrAit40EGZq2SGyVqdM+WknoIhW
         EXov971NdjUhN7dVfTrJIAVWHWlWY1tCR9KJXaV7gfF7zGTtB/EsY+ryHkAI/DWplHs6
         +e1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bBXhWzm8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=twRAwG0pxRtw3u1YXWbTP6ZI4i2D7sE8GQbCqTKyN3Q=;
        b=OETnQ47XkHa41nk6wYsegCcd90K3iEJOEuwnih+ZaH3298a15I6cfGvtv/Rbthw50i
         t7cwQWaS/w0fmPn5vN9za+3tSTziXTmGrCbmxmt+yzaqbZTz9k3BB4RDnzcKSzMEcbQh
         KIhXlYDCRFRpzzS5pPpXqVCB2Ux2klv00bsbAbjBgdteHhaLccgup6B+F9nMMZbLtqPQ
         86TK4Q+VmysN6FPDNVzAReN5bb1lYG/j/drMcj9QnpoTitA/JDokZaCbmWyiijScpJYl
         gACUvlMYzjtzJ3Maowfo6xbspSRGOb0CZJuNuAcfShk01T5ADIuCFE2xC3el5c16EVvF
         jaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=twRAwG0pxRtw3u1YXWbTP6ZI4i2D7sE8GQbCqTKyN3Q=;
        b=JDCO19/+29a8OzhdJFwemJLpMAAgy2BEHt+amcRLeYW3xN+YZ+lp573229riN9fTeX
         Upal6Nz+pLeQ1aFbAlaYWpXm+DG49ImvzHQnpRitOvM+EU9qCWJdIQQxERP7AK/aaFrr
         ROiu73Cjz0vC6QyaNIKVyxi8w8JA+qMBqbOOb7rQUHNkaCrc7LNPMOxsNNEEjOyrRXqS
         GgaGe8TlKcx0akZLNkWpHWGJKNBG4i84boGYGUHUUwuUXiskgTSjEGzuX2Xkf1qTCiE9
         xIdAoJu95SW7D8pTZDNoFd0equn+rDRLkFEfw3iR3/KsfqFqBw6u65WXGxHZOg9DJElN
         GEOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531iBXndyYW3L5SSS6iX81x9wYY4sIJ1tQRqJ3slJdGAVxXFWpG0
	VMFSnKf48DJNN/WaR49a4pQ=
X-Google-Smtp-Source: ABdhPJwEu/vd4GYAEPRctEQoqKjCUxV6VCBHOumFUnxB0QKtsTl+kGxv0xnKo/j87oH8w1JC2VWhQA==
X-Received: by 2002:a19:be11:: with SMTP id o17mr10720201lff.187.1589793542682;
        Mon, 18 May 2020 02:19:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls1313684lfb.1.gmail; Mon, 18
 May 2020 02:19:02 -0700 (PDT)
X-Received: by 2002:a19:fc0a:: with SMTP id a10mr31779lfi.176.1589793541901;
        Mon, 18 May 2020 02:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589793541; cv=none;
        d=google.com; s=arc-20160816;
        b=mIaMlf+nciZt9WoeF6swSgFCgWzCT/Lo/Pv21yXjx1RbDDLy394kLWzwt9QCIdJ68C
         AIKENOk2pp8OCG2ySn9bShhITUXGeQQ1pIJnwPwdFzJ94iaX3/m9iJWi4AJm66C4gRpR
         uB1Cs1gmsFHqMYq/UONHDstnWRzEY1+aOgi/3hllVf77ycKypHaKx9sEvlfH93HP0y2n
         3+xYm/qqGjQlHsCRf/uNPo0bcDEPx877eREAH/6wqbIAPBfpJXc7BDzNglulyFA7Ao3K
         A+nVQMSjm6CSZ92EsYdf9pL8Tgo5s0l4bGcGRMEVAh8p+xMK8h1ff9N2CzDzkt+Oiol4
         aVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=pkjz9nKZEOU5r84++ltoJ8ykPHXfdNDdB/zNa081HLE=;
        b=DdW9LjjlVkWtXfjBoNWfBp4uz1v3ESIclIXAsmly8NPIJGpVUYaWlgDp9SBZC+F/Uk
         DgzRYP3dZW9QJCGLdZksv7ztbwXcY7F5oSgK/dUZH4g2moAu8xB2xWMQS/KhhQBEeWOC
         yAak45Cfx+1NdWNNkz9rFV8/B4i6BaHPUhTPGNnJtIL+KqB3KQ8hui6xNcfZrTK+0FC8
         dhNj4y8XY9rMhGhhFKKY7q9nTjtyIQh5jPIZMPHwVTtsFkyv0bsSS5DtDxfCJUeoASCo
         wFVro9sVraioaDd4/iI3OjgObB+agy++B8R8CvQ7KEPZCGkHlBUGQhQEQv4389dGQIgN
         PlGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bBXhWzm8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id d19si765213lji.3.2020.05.18.02.19.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 02:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49QYNh65JhzyDk;
	Mon, 18 May 2020 11:19:00 +0200 (CEST)
Received: from [172.16.2.21] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 18 May
 2020 11:19:00 +0200
Subject: Re: [PATCH V1 1/2] imx8: add lpuart support
To: Alice Guo <alice.guo@nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20200519161014.20147-1-alice.guo@nxp.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <42c88fa9-c68d-7515-9b72-3b103d166f2e@oth-regensburg.de>
Date: Mon, 18 May 2020 11:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519161014.20147-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US-large
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=bBXhWzm8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 19/05/2020 18:10, Alice Guo wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On i.MX8/8X family, there is only LPUART. So introduce lpuart support.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>  hypervisor/arch/arm-common/Kbuild             |  2 +-
>  hypervisor/arch/arm-common/dbg-write.c        |  2 +
>  hypervisor/arch/arm-common/include/asm/uart.h |  3 +-
>  hypervisor/arch/arm-common/uart-imx-lpuart.c  | 38 ++++++++++++
>  include/jailhouse/console.h                   |  1 +
>  inmates/lib/arm-common/Makefile.lib           |  2 +-
>  inmates/lib/arm-common/uart-imx-lpuart.c      | 58 +++++++++++++++++++
>  inmates/lib/arm-common/uart.c                 |  2 +
>  8 files changed, 105 insertions(+), 3 deletions(-)
>  create mode 100644 hypervisor/arch/arm-common/uart-imx-lpuart.c
>  create mode 100644 inmates/lib/arm-common/uart-imx-lpuart.c
> 
> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
> index 78b9e512..ab86eca6 100644
> --- a/hypervisor/arch/arm-common/Kbuild
> +++ b/hypervisor/arch/arm-common/Kbuild
> @@ -16,7 +16,7 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>  
>  objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>  objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
> -objs-y += uart-hscif.o uart-scifa.o uart-imx.o
> +objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
>  objs-y += gic-v2.o gic-v3.o smccc.o
>  
>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/hypervisor/arch/arm-common/dbg-write.c b/hypervisor/arch/arm-common/dbg-write.c
> index 64dfef20..d4cd4399 100644
> --- a/hypervisor/arch/arm-common/dbg-write.c
> +++ b/hypervisor/arch/arm-common/dbg-write.c
> @@ -38,6 +38,8 @@ void arch_dbg_write_init(void)
>  		uart = &uart_scifa_ops;
>  	else if (con_type == JAILHOUSE_CON_TYPE_IMX)
>  		uart = &uart_imx_ops;
> +	else if (con_type == JAILHOUSE_CON_TYPE_IMX_LPUART)
> +		uart = &uart_imx_lpuart_ops;
>  
>  	if (uart) {
>  		uart->debug_console = &system_config->debug_console;
> diff --git a/hypervisor/arch/arm-common/include/asm/uart.h b/hypervisor/arch/arm-common/include/asm/uart.h
> index 9317446f..f620501d 100644
> --- a/hypervisor/arch/arm-common/include/asm/uart.h
> +++ b/hypervisor/arch/arm-common/include/asm/uart.h
> @@ -11,4 +11,5 @@
>   */
>  
>  extern struct uart_chip uart_pl011_ops, uart_xuartps_ops, uart_mvebu_ops,
> -			uart_hscif_ops, uart_scifa_ops, uart_imx_ops;
> +			uart_hscif_ops, uart_scifa_ops, uart_imx_ops,
> +			uart_imx_lpuart_ops;
> diff --git a/hypervisor/arch/arm-common/uart-imx-lpuart.c b/hypervisor/arch/arm-common/uart-imx-lpuart.c
> new file mode 100644
> index 00000000..aa8a0897
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
> @@ -0,0 +1,38 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
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
> +#include <jailhouse/mmio.h>
> +#include <jailhouse/uart.h>
> +
> +#define UART_DATA		0x1c
> +#define UART_STAT		0x14
> +#define STAT_TDRE		(1 << 23)
> +
> +static void uart_init(struct uart_chip *chip)
> +{
> +}

No initialisation at all?

I think we should at least leave the same comment as in
uart-imx.c: /* Initialisation is currently done by Linux */

Would it be much effort to initialise the UART in Jailhouse, though? I
guess this could probably save confusion of users that try to set the
.divider or other settings in the configuration without success.

  Ralf

> +
> +static bool uart_is_busy(struct uart_chip *chip)
> +{
> +	return !(mmio_read32(chip->virt_base + UART_STAT) & STAT_TDRE);
> +}
> +
> +static void uart_write_char(struct uart_chip *chip, char c)
> +{
> +	mmio_write32(chip->virt_base + UART_DATA, c);
> +}
> +
> +struct uart_chip uart_imx_lpuart_ops = {
> +	.init = uart_init,
> +	.is_busy = uart_is_busy,
> +	.write_char = uart_write_char,
> +};
> diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
> index a6efd37a..34dd7209 100644
> --- a/include/jailhouse/console.h
> +++ b/include/jailhouse/console.h
> @@ -49,6 +49,7 @@
>  #define JAILHOUSE_CON_TYPE_HSCIF	0x0006
>  #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
>  #define JAILHOUSE_CON_TYPE_IMX		0x0008
> +#define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
>  
>  /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
>  #define JAILHOUSE_CON_ACCESS_PIO	0x0000
> diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
> index 3d7b335d..c13696f3 100644
> --- a/inmates/lib/arm-common/Makefile.lib
> +++ b/inmates/lib/arm-common/Makefile.lib
> @@ -40,7 +40,7 @@ objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
>  objs-y += ../printk.o ../pci.o
>  objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
>  objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
> -objs-y += uart-pl011.o
> +objs-y += uart-pl011.o uart-imx-lpuart.o
>  objs-y += gic-v2.o gic-v3.o
>  
>  common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/inmates/lib/arm-common/uart-imx-lpuart.c b/inmates/lib/arm-common/uart-imx-lpuart.c
> new file mode 100644
> index 00000000..bbbb53f2
> --- /dev/null
> +++ b/inmates/lib/arm-common/uart-imx-lpuart.c
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright 2020 NXP
> + *
> + * Authors:
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Alternatively, you can use or redistribute this file under the following
> + * BSD license:
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + *
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
> + * THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include <inmate.h>
> +#include <uart.h>
> +
> +#define UART_DATA		0x1c
> +#define UART_STAT		0x14
> +#define STAT_TDRE		(1 << 23)
> +
> +static void uart_imx_lpuart_init(struct uart_chip *chip)
> +{
> +}
> +
> +static bool uart_imx_lpuart_is_busy(struct uart_chip *chip)
> +{
> +	return !(mmio_read32(chip->base + UART_STAT) & STAT_TDRE);
> +}
> +
> +static void uart_imx_lpuart_write(struct uart_chip *chip, char c)
> +{
> +	mmio_write32(chip->base + UART_DATA, c);
> +}
> +
> +DEFINE_UART(imx_lpuart, "IMX-LPUART", JAILHOUSE_CON_TYPE_IMX_LPUART);
> diff --git a/inmates/lib/arm-common/uart.c b/inmates/lib/arm-common/uart.c
> index 8855d476..90a322b5 100644
> --- a/inmates/lib/arm-common/uart.c
> +++ b/inmates/lib/arm-common/uart.c
> @@ -42,6 +42,7 @@
>  DECLARE_UART(8250);
>  DECLARE_UART(hscif);
>  DECLARE_UART(imx);
> +DECLARE_UART(imx_lpuart);
>  DECLARE_UART(mvebu);
>  DECLARE_UART(pl011);
>  DECLARE_UART(scifa);
> @@ -51,6 +52,7 @@ struct uart_chip *uart_array[] = {
>  	&UART_OPS_NAME(8250),
>  	&UART_OPS_NAME(hscif),
>  	&UART_OPS_NAME(imx),
> +	&UART_OPS_NAME(imx_lpuart),
>  	&UART_OPS_NAME(mvebu),
>  	&UART_OPS_NAME(pl011),
>  	&UART_OPS_NAME(scifa),
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/42c88fa9-c68d-7515-9b72-3b103d166f2e%40oth-regensburg.de.
