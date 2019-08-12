Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB66WY3VAKGQEZZNICIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id A042E8A56A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 20:10:03 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id z2sf5995391ede.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 11:10:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565633403; cv=pass;
        d=google.com; s=arc-20160816;
        b=SjilvqPQ74HH0tGyyNvPprTZluTckT7WfBTkPA5JGLcLfHaitIhNYcaKsedRDUjggJ
         jJcyELspD8ZDf8B7qK3sujk1jNA4mWZr0bYa9z2xVsQ8E7DhdOG/DVRJKQnP4qv8ABPf
         wvXJ9fgNDCnwvIAkGvQids7n4jddX8Fwv3Z9x2XzLZyQReGPg578lOPa05D6Bb04yzdt
         j3DsXBiroQh16FKkD0pjtRQ5d39BCHAP4/qENm0coqoA3Xuw6HCzvVoiZ1upHEgsA5QT
         LVLiRmlpX+2C9fbh1yWn4CH2eo554mweSiyP8RR9+P9jT7cI5PzAFCOCvhp6j0fc9L0F
         oUHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ZE5ymC1JLm2/Rv5fDXaPx17SeEmCDiMqqlybdTHQoHk=;
        b=vP7WmE3Yw6d/qUlffrhi0D+LmNiF/89J/iCqOhu2elODhxZRSomUhJig9yCmWwcOv1
         ExPyGUMOFmqhaxNM0uNyb4aRMs+KXUAqFD3CC6Z+8MCLhKrULSvMSyBn4Cyd+rR1hwxv
         8tTFq6qDslBRPfWiUcME3xnbD7eD6x0QyjLEWukqRqNAE/BcGt3LjTWxZWy4Pmlh6agQ
         iU5aTajBoXVPZAeokaU9a2XvcL3EzTmfdTCrqFsWW2VXPUGUWhjOMSYNEwB4pE9lKYRM
         1vjFg2cpVeVizHL38BbkvIc/k9mqxE41o4Hh1ylM7pCwz6aJfpqf7kEGiYqxPMycG2l5
         Vslg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZE5ymC1JLm2/Rv5fDXaPx17SeEmCDiMqqlybdTHQoHk=;
        b=WIFCfhWcGVXDTGY+edOGCj/6OVcohZj/pTt83j5tWqfOtzumTrQYNj7pDPBNadz/qi
         cP/O7fKqzVD4C1zq7PkRGOzbw77p4Miq5+l17waOf4vElveHnqKWQMoF1Cn27lgqsgiM
         WYammQ3EwwYupdRVjzHJ0SBPaGRbMMUI+EhuwWjAkhkfmJuXPPnQLh1d85WmIBC+h47Q
         lijByq1UuOS2fAINkB/7mMJHGcVihig9RTRlyMjcOMXYpU0ZyDNS4wO+0qN5wVk58JRx
         MUZni9R1ITDGLIq4lNWfqo1tUbz18aKz5Bb0ZjD/UB08zAIDyQnqluOOCdo6x4SYwex5
         p6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZE5ymC1JLm2/Rv5fDXaPx17SeEmCDiMqqlybdTHQoHk=;
        b=eRsmVpMzndNkX9APbpWgoetBvjxn7GmtXojKXDgw9/xpsiKKA4jrKJt7K710PhK3IK
         wDbnx90BJIDFKQ8YisKPY3SV0LxastV8ZWWmFeot1DoJEsuVJ+iN14fw5TiYM8h/dk2o
         wuVo3w06lGVgHZuxrSI+Mqq1W/9qJAPYgrbuX5LtoTKIFKIfbDScuUZSNWX1LX5TyxBe
         Wgi+I4GllpaKvJc3uakwa7Y/SPGohSgEJyHT22HO8JEwMHA3exkTuZYEnxnmJAfuyuYq
         NKLjhoz9OGtLWDLfaVTAK3Cutq28koAnyF1o6jaVH52jpCvEcX+Wrou2JEjNYg0Du8Om
         QJAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWNLM7QJdHbxTQT6tvy8KvV44bTkDtmYI2gVbAzEwgE8/SuyulD
	c76aU7nHSe5NLkjIPZguWzg=
X-Google-Smtp-Source: APXvYqzUonWhvK6b93xficUgO/oH0OmRfB840sLfpni3HdLJ2zzKa0EaYQS6SrMf7Bcpjn5nZzfg9w==
X-Received: by 2002:aa7:d916:: with SMTP id a22mr14066155edr.63.1565633403410;
        Mon, 12 Aug 2019 11:10:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:94ce:: with SMTP id t14ls30109755eda.7.gmail; Mon, 12
 Aug 2019 11:10:02 -0700 (PDT)
X-Received: by 2002:a50:f4b6:: with SMTP id s51mr26464503edm.204.1565633402643;
        Mon, 12 Aug 2019 11:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565633402; cv=none;
        d=google.com; s=arc-20160816;
        b=iq41yzLNEqCyhyylEq9KArUu3zclCx5PJ/wQv53VO/f2Fzju1bjRS4ZnAqfRZH0AaU
         KS9oPRsa1hmzj2HK2t3D0vDQ+QiEPSx6u0xZ7dZlfFgJtPmhtMCjsH4veVSdDnXQBg94
         n/RxD2420kApEqZnRrNtHKmPDBegZZPZRJcUt+zU7ZtiT6kJ9sZoro9xqFjSVIKB4wUm
         AIZ6XqgkNCmEzWP8IO3bMR+GgiHePvDexY+wUVxlespp4MZbyOQ45t4npFK6Jfobhl3r
         fUHYBJpu2sQ0Hrs9XSWj6yco2Sq9cEwgQcC89idEh1OyeK7OfO6z1J8q3GdX+LVX/ttM
         fuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=dCHOycubPcpAFGYDL85+11W1iMNILhEhocsnlXgVYTQ=;
        b=gx8xt2Ig+PwiaVG2oQ+LcOx99MuCNvhu1JyVEcStO3SJaSD+dwl+9eRnieB8S1KFeq
         27pgURnUNSFyjIhkGh19qrq7Auqv168oh9oJNN56P81LaVbfdRL57BMJES7FVNpiPaWQ
         LXjb0mTLZmQsqO++W/vBgT5UnwIlfIlwLc5ODEpDoLcxrlD9Ev918pwHRhhvuZPs1qcc
         qNqA/VEtiJ2zfEB2ascQZ/VNXIeRv/bc20Vq5TuyrMb4yLk9xszEBHHrg3FusU/xLwja
         FwpxNU+bfhs1skG8nNQczgYWlHkE9v+/DuaD7BwRRFPT7R0mKBl76ATqfBEVZBz5qHnn
         kaBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d22si298427edq.5.2019.08.12.11.10.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 11:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x7CIA0DJ021096
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Aug 2019 20:10:00 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7CIA0PI004854;
	Mon, 12 Aug 2019 20:10:00 +0200
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if
 available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
 <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a7eec6f9-aa44-cfbc-d2d3-69621781acbc@siemens.com>
Date: Mon, 12 Aug 2019 20:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 12.08.19 13:06, Ralf Ramsauer wrote:
> ACPI tables aren't available if Linux runs as guest of the hypervisor
> Jailhouse. This makes the 8250 driver probe for all platform UARTs as
> it assumes that all platform are present in case of !ACPI. Jailhouse
> will stop execution of Linux guest due to port access violation.
> 
> So far, these access violations could be solved by tuning the
> 8250.nr_uarts parameter but it has limitations: We can, e.g., only map
> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
> 0x2f8, 0x3e8, 0x2e8.
> 
> Beginning from setup_data version 2, Jailhouse will place information of
> available platform UARTs in setup_data. This allows for selective
> activation of platform UARTs.
> 
> This patch queries the setup_data version and activates only available
> UARTS. It comes with backward compatibility, and will still support
> older setup_data versions. In this case, Linux falls back to the old
> behaviour.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   arch/x86/include/uapi/asm/bootparam.h |  3 ++
>   arch/x86/kernel/jailhouse.c           | 75 ++++++++++++++++++++++++---
>   2 files changed, 72 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index 6163b1afa7b3..2244c493c3c5 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>   		__u8	standard_ioapic;
>   		__u8	cpu_ids[255];
>   	} __attribute__((packed)) v1;
> +	struct {
> +		__u32	flags;
> +	} __attribute__((packed)) v2;
>   } __attribute__((packed));
>   
>   /* The so-called "zeropage" */
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index e5ac35efc4b3..1c75de1496f3 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -11,6 +11,7 @@
>   #include <linux/acpi_pmtmr.h>
>   #include <linux/kernel.h>
>   #include <linux/reboot.h>
> +#include <linux/serial_8250.h>
>   #include <asm/apic.h>
>   #include <asm/cpu.h>
>   #include <asm/hypervisor.h>
> @@ -20,8 +21,13 @@
>   #include <asm/reboot.h>
>   #include <asm/setup.h>
>   
> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
> +
>   static __initdata struct jailhouse_setup_data setup_data;
>   #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
>   
>   static unsigned int precalibrated_tsc_khz;
>   
> @@ -78,11 +84,13 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>   		.type = IOAPIC_DOMAIN_STRICT,
>   		.ops = &mp_ioapic_irqdomain_ops,
>   	};
> +#ifdef CONFIG_SERIAL_8250
>   	struct mpc_intsrc mp_irq = {
>   		.type = MP_INTSRC,
>   		.irqtype = mp_INT,
>   		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>   	};
> +#endif
>   	unsigned int cpu;
>   
>   	jailhouse_x2apic_init();
> @@ -99,12 +107,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>   	if (setup_data.v1.standard_ioapic) {
>   		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>   
> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
> -		mp_save_irq(&mp_irq);
> +#ifdef CONFIG_SERIAL_8250
> +		if (setup_data.hdr.version < 2) {
> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
> +			mp_save_irq(&mp_irq);
>   
> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
> -		mp_save_irq(&mp_irq);
> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
> +			mp_save_irq(&mp_irq);
> +		}
> +#endif
>   	}
>   }
>   
> @@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_SERIAL_8250
> +static const u16 pcuart_base[] = {
> +	0x3f8,
> +	0x2f8,
> +	0x3e8,
> +	0x2e8,
> +};
> +
> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
> +				   u32 *capabilites)
> +{
> +	struct mpc_intsrc mp_irq = {
> +		.type = MP_INTSRC,
> +		.irqtype = mp_INT,
> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
> +	};
> +	unsigned int n;
> +
> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
> +		if (pcuart_base[n] != up->iobase)
> +			continue;
> +
> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
> +				up->iobase);
> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
> +			mp_save_irq(&mp_irq);
> +		} else {
> +			/* Deactivate UART if access isn't allowed */
> +			up->iobase = 0;
> +		}
> +		break;
> +	}
> +}
> +#endif
> +
>   static void __init jailhouse_init_platform(void)
>   {
>   	u64 pa_data = boot_params.hdr.setup_data;
> @@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
>   	if (setup_data.hdr.version == 0 ||
>   	    setup_data.hdr.compatible_version !=
>   		JAILHOUSE_SETUP_REQUIRED_VERSION ||
> -	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
> +	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
> +	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
>   		goto unsupported;
>   
>   	pmtmr_ioport = setup_data.v1.pm_timer_address;
> @@ -202,6 +251,20 @@ static void __init jailhouse_init_platform(void)
>   	 * are none in a non-root cell.
>   	 */
>   	disable_acpi();
> +
> +#ifdef CONFIG_SERIAL_8250
> +	/*
> +	 * There are flags inside setup_data that indicate availability of
> +	 * platform UARTs since setup data version 2.
> +	 *
> +	 * In case of version 1, we don't know which UARTs belong Linux. In
> +	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
> +	 * 3 and 4.
> +	 */
> +	if (setup_data.hdr.version > 1)
> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
> +#endif
> +
>   	return;
>   
>   unsupported:
> 

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7eec6f9-aa44-cfbc-d2d3-69621781acbc%40siemens.com.
