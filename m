Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZMJZ74QKGQEHUM37PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFCC242841
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 12:31:02 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id o9sf495166lfi.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Aug 2020 03:31:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597228262; cv=pass;
        d=google.com; s=arc-20160816;
        b=i5xoWOLNKf4EFifp79qB9oVulD7oG/XVyEpAH+exe61KE4aVctQ1+jpJYp3WcuCP2M
         4KuCwxjd7sQwZ7DyheXRU3MH+bfRH+Flu/cYadVMot43kUA/A4e6Z8WNrSSYR2jvO8yR
         aP65j/1u3nrf6cBlcMNOePFYikDRbSIeeJZzc3rwx8CGR5G0YQVXNKm7yPgiC6mr93p6
         pNKMEejpP0VRmPWQAScT5Lw4oMkNfDHSOkv5w8Ph43OOyftApJysBPa+GczWoBq0TE1L
         W41LZq4l1XfHQoPe/LaTWIpu7LzGzk3vTQOUiPxBrA/h5y/LHU4WL0tmnuPp7J1yFXoR
         EmPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=tRSNbPNKUSKkQTDXR8/K7v9Wglw0/AC//aVw1LZPZCM=;
        b=NBYCYaFNXi8grBTJIQlmY27ZE/Q3L0T7C4rGkkSR7pZziBvIMjQqkrSkt2U4sfiEzy
         9QHmUFnag1VwJ3Rz3Q/CngMcERGIKpO/zul9plzonbvvM0sIzVxeuJxxdEIr4LoMFqRS
         YVTAieQebKDs3znzQOBd/z6SJKfJQY07TG1iHo5XPW3Iov0dgNcB+qnRqytJfwvRou9l
         kS/4MFE9VE9qp9ifQLqJ9Z50St8uGSlDrCmTUSckbmQob2vm9eh87rz0c9QVM6wd4Pt3
         vE/3q+2MnmF7Mo1hzq6W8yG/JYKgFS8HXr5Jp9IN0o1J3liEPjmsrhXJ7udR741OuqSL
         8cLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tRSNbPNKUSKkQTDXR8/K7v9Wglw0/AC//aVw1LZPZCM=;
        b=eru2lW+7RSkXJ6Px9n2y4onnXtvFov/KkxQ2roqd4wOJ3cWMc9n1c35IeuIU4CE/cN
         /47StjI4ntFda5Y/zO6WIHLiR9SqkOhr9K4kOxQqv3CMjlki7VnxpNBB1P2+kW3fBAG5
         KbCeH68BPkjvx3F/bLjf52AftkeP/bXbydNInLnpDWe4vk40nmU9fc659NBFa6PHPJzV
         7P9QbKV97zxitTX3DMjySK++RA4cQcMCYtGIaR1uwoM0DI8+g8zsj3P48hZQUpFmyE5d
         Vc4pMBDY5yA3E4bCvSV/p62qgPcMqMHRbCcxv38J9pmL1LhxjsgxkopK2cM2v4MxSrV8
         9vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tRSNbPNKUSKkQTDXR8/K7v9Wglw0/AC//aVw1LZPZCM=;
        b=jLMluGkdcb7FL1PvtAB1IrAWM6tlVE+qK+ISe9kzRc131a++f3VsQJUVDTMIQkq/zE
         2eQgF8BPkdja4tyr1NcbmGIyQ0UBZyg5WoiQi131c53HiejtwiWA95dsPCuNfbXl4xWU
         Q61SbUIDJ/Y7LbFj21ZWboAOCtUxi2l6KFvSUSmyeN5vmBnzdORLyfYclItX0l3ICcUm
         qrKlFSqW/idDTpXfW5lOR9WOSfoPfQH19TP+xEzTbhC2vr+ds8mB3xrWFQMvrfsMfXKm
         Ozef20XGwApSkozWcFjf3JgSrP5z5p9FwWR3DJDSwwTDWhjNpjWtO2Sag9v3eHlFGoJO
         cmFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Q/0ltEUTXxkBTpe3jjfiXrDbnV5vQmBIawXenoGJTmSZJe6DI
	W3wx88XVChg/v8EP9Y0Bw1o=
X-Google-Smtp-Source: ABdhPJzmdLP39Sj47RWxa0oUHMgqOj4XqLZkoEMl+8dRSPINVrGK5oGMAM0U5foUAXMfahodQTIu6Q==
X-Received: by 2002:a2e:9ac5:: with SMTP id p5mr5211019ljj.253.1597228262006;
        Wed, 12 Aug 2020 03:31:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8994:: with SMTP id c20ls305473lji.0.gmail; Wed, 12 Aug
 2020 03:31:01 -0700 (PDT)
X-Received: by 2002:a2e:a489:: with SMTP id h9mr5176536lji.121.1597228260983;
        Wed, 12 Aug 2020 03:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597228260; cv=none;
        d=google.com; s=arc-20160816;
        b=M9WwtfhTRu350Sl6miTNgS6S/SvhOsjMOm0KMB254cvDsFLa0Cxp5TyfLzHCGAn+b8
         NCb3+1Xwu/U1B6KesHcOChzVF8Nu83RAQcyIiNFoBEUVPCE0iPHJ0mFIrXap2IxqAVVt
         tBF2I3wmmxLnSrFIRe5hh7ePSvGhZsjtOedWLiz4ESv3acTfvgoa0IcMVBar4qXxBaC2
         Et9lvXkQagdX4mhIVZx/pP4Vt/Z8737vaU1OTGwesTRNHH33oHTTqWDSGns2IdzELuZr
         U8TudGctE3ME3iaDHP2ifAtIh27YedsQLD+VpuBpjvV7GM13XOjP0VJ6qslcodkPXL0M
         fe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vnw+OLH1HrDxs0Aa32v1uG/U8QpkNr1pLYxN5I2CwXI=;
        b=g0bFD/hZs/8d/Nlx68QLl7KYVmtixxCgN5FccsYB6fTp/AtieysEkQa3fLpLZaUDxE
         wuZJVyoPPURkCPymQl4PSTGLDFCP5L0q2lf+YIqEGv5aaN9ZhsdLwlYFo3QI9AXnCJcY
         iHxchjx+K0y5hJZ1jTxT4RHat0JS9zPUz4Q0lBH038WZ5A5eAGp7FTZCxvGlBYjf+/1B
         TzE0PCXMkAkWO8w+QEGDbEkpdS4fLEPtZZvdEv/9maOCa29vv3r/rHbCezr2VveYGwsg
         Ao+LfDZ6XokkHsRuPceViXot4MG3C/7UIftnAH8JgSr1+fn5VSLXYl6Aq26kwx34jH+o
         YT3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v3si53730lji.6.2020.08.12.03.31.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 03:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 07CAV0vu024345
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2020 12:31:00 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07CAUxNT015108;
	Wed, 12 Aug 2020 12:31:00 +0200
Subject: Re: [PATCH V1 1/5] imx8: add lpuart support
To: Alice Guo <alice.guo@nxp.com>, jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
References: <20200811181641.7282-1-alice.guo@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6615b152-6d11-1f63-643a-a48a40e847ba@siemens.com>
Date: Wed, 12 Aug 2020 12:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200811181641.7282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 11.08.20 20:16, Alice Guo wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> On i.MX8/8X family, there is only LPUART. So introduce lpuart support.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> ---
>   hypervisor/arch/arm-common/Kbuild             |  2 +-
>   hypervisor/arch/arm-common/dbg-write.c        |  2 +
>   hypervisor/arch/arm-common/include/asm/uart.h |  3 +-
>   hypervisor/arch/arm-common/uart-imx-lpuart.c  | 38 ++++++++++++
>   include/jailhouse/console.h                   |  1 +
>   inmates/lib/arm-common/Makefile.lib           |  2 +-
>   inmates/lib/arm-common/uart-imx-lpuart.c      | 58 +++++++++++++++++++
>   inmates/lib/arm-common/uart.c                 |  2 +
>   8 files changed, 105 insertions(+), 3 deletions(-)
>   create mode 100644 hypervisor/arch/arm-common/uart-imx-lpuart.c
>   create mode 100644 inmates/lib/arm-common/uart-imx-lpuart.c
> 
> diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
> index 78b9e512..ab86eca6 100644
> --- a/hypervisor/arch/arm-common/Kbuild
> +++ b/hypervisor/arch/arm-common/Kbuild
> @@ -16,7 +16,7 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
>   
>   objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
>   objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
> -objs-y += uart-hscif.o uart-scifa.o uart-imx.o
> +objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
>   objs-y += gic-v2.o gic-v3.o smccc.o
>   
>   common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/hypervisor/arch/arm-common/dbg-write.c b/hypervisor/arch/arm-common/dbg-write.c
> index 64dfef20..d4cd4399 100644
> --- a/hypervisor/arch/arm-common/dbg-write.c
> +++ b/hypervisor/arch/arm-common/dbg-write.c
> @@ -38,6 +38,8 @@ void arch_dbg_write_init(void)
>   		uart = &uart_scifa_ops;
>   	else if (con_type == JAILHOUSE_CON_TYPE_IMX)
>   		uart = &uart_imx_ops;
> +	else if (con_type == JAILHOUSE_CON_TYPE_IMX_LPUART)
> +		uart = &uart_imx_lpuart_ops;
>   
>   	if (uart) {
>   		uart->debug_console = &system_config->debug_console;
> diff --git a/hypervisor/arch/arm-common/include/asm/uart.h b/hypervisor/arch/arm-common/include/asm/uart.h
> index 9317446f..f620501d 100644
> --- a/hypervisor/arch/arm-common/include/asm/uart.h
> +++ b/hypervisor/arch/arm-common/include/asm/uart.h
> @@ -11,4 +11,5 @@
>    */
>   
>   extern struct uart_chip uart_pl011_ops, uart_xuartps_ops, uart_mvebu_ops,
> -			uart_hscif_ops, uart_scifa_ops, uart_imx_ops;
> +			uart_hscif_ops, uart_scifa_ops, uart_imx_ops,
> +			uart_imx_lpuart_ops;
> diff --git a/hypervisor/arch/arm-common/uart-imx-lpuart.c b/hypervisor/arch/arm-common/uart-imx-lpuart.c
> new file mode 100644
> index 00000000..29943de7
> --- /dev/null
> +++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
> @@ -0,0 +1,38 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Copyright 2018 NXP
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
>   #define JAILHOUSE_CON_TYPE_HSCIF	0x0006
>   #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
>   #define JAILHOUSE_CON_TYPE_IMX		0x0008
> +#define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
>   
>   /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
>   #define JAILHOUSE_CON_ACCESS_PIO	0x0000
> diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
> index 3d7b335d..c13696f3 100644
> --- a/inmates/lib/arm-common/Makefile.lib
> +++ b/inmates/lib/arm-common/Makefile.lib
> @@ -40,7 +40,7 @@ objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
>   objs-y += ../printk.o ../pci.o
>   objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
>   objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
> -objs-y += uart-pl011.o
> +objs-y += uart-pl011.o uart-imx-lpuart.o
>   objs-y += gic-v2.o gic-v3.o
>   
>   common-objs-y = $(addprefix ../arm-common/,$(objs-y))
> diff --git a/inmates/lib/arm-common/uart-imx-lpuart.c b/inmates/lib/arm-common/uart-imx-lpuart.c
> new file mode 100644
> index 00000000..4e5d43ef
> --- /dev/null
> +++ b/inmates/lib/arm-common/uart-imx-lpuart.c
> @@ -0,0 +1,58 @@
> +/*
> + * Copyright 2018 NXP
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
>   DECLARE_UART(8250);
>   DECLARE_UART(hscif);
>   DECLARE_UART(imx);
> +DECLARE_UART(imx_lpuart);
>   DECLARE_UART(mvebu);
>   DECLARE_UART(pl011);
>   DECLARE_UART(scifa);
> @@ -51,6 +52,7 @@ struct uart_chip *uart_array[] = {
>   	&UART_OPS_NAME(8250),
>   	&UART_OPS_NAME(hscif),
>   	&UART_OPS_NAME(imx),
> +	&UART_OPS_NAME(imx_lpuart),
>   	&UART_OPS_NAME(mvebu),
>   	&UART_OPS_NAME(pl011),
>   	&UART_OPS_NAME(scifa),
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6615b152-6d11-1f63-643a-a48a40e847ba%40siemens.com.
