Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFVQ5XWAKGQEIBIGRDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A8CE748
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 17:21:59 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id n5sf1612010lfi.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 08:21:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570461718; cv=pass;
        d=google.com; s=arc-20160816;
        b=exgid0O71Mg5oMngp5CdQoyrFHYC2/PapQJVp0zZ09hhmlmk3/0KT6vjijvLW8HoHC
         ts1fEzD2DhnYcU4sFu8Zz9a8z6Ykx9FwWMWQrjehUqWan4hZuPVrrTa0bOtUHIxlzQj/
         r6Y4mobAH5XNyAx0VigN5528pwsO6ALW0EM64crC9aVJKbtOIikwCO3b/9EuHNuoDR3e
         yk3C1xNMhUwCSEuydmmHoPVMT8RT2M48s/zSV6F+8xU08Mail99q9h3gLeowOwr8OG75
         p8r+TCQP64kay0X+feBS8edJj9VJ+Z+NFihPcvjuwgPs982qoJFzqlE+AxUDOqQGbK+J
         YHMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=42PGsajyYQ2Jjlg6ApeOnQvyeAGdecCWB/xBK6T6PMc=;
        b=aQwqseMz8plb94PoJ49WXpk30yO0NGIIRMJZYq4tIH4c7zVG31b3SwYuqWgogAW++8
         mMXml2QbE16AR+6DLvbCqtjePP8aJfijYNm88yHwIv+x6UW0mFIKQHVgFCgpcrIHC9Mw
         d259rGRUc4/cnlUS3uRjBUjCvrxk+11BJ5PeKuL9tDlnGOgL7XQqseane4/f/Q9Uhgt9
         3WVXHfRQyUoMD5f/TIiadcRRFBOVRkZzpBiTBq9EPhJBrobrn/cLB5W1fmvdHc8PlAKI
         6ryw2iKKbDt27WhFC8QQBPf/pmys/Lj3e5GiOJ9mXsiW6Zje+59tSNcL9SJVNuLTDdRN
         sPoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=42PGsajyYQ2Jjlg6ApeOnQvyeAGdecCWB/xBK6T6PMc=;
        b=CgSCrNbnym4tE5SFVS5Uc/TQll/KP26mo5RBJdMdd0vtWG7RKFkAaQ61Dt2tzjeAyE
         RS8xqPvBAbLB9XzjAwtV1/WRVpcOrzvgo0fCpTxElOh77DCiXUyQ1K28tzMTH61WaQse
         XTLDEGrmlUDKEt//cwJg4Q3jZn/fxUtAv+LzddISoNpzZ72jlwJWVlR31NTDGtIt5jiy
         CjzGMDBrXix4tTJOfO6e5ciafM6W7aZfCh2lwPsCiRRCnIarYqydILAvwqexdayYEVhv
         nwNcHVv2YWFVcJUYxaYW2DT7lwwyBQyGCIWxTj7Uwnx3UtSlatE3h9YZeDn0i63xT0Yh
         /Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=42PGsajyYQ2Jjlg6ApeOnQvyeAGdecCWB/xBK6T6PMc=;
        b=Eg0yPZFPsY/8Iv/r3a7l8WreyEvmab3VVS+VGeuWLxy5SjrGyKXZ9F/xnwid1f6A9H
         xs+YmWpgGJ8cTGwNc/w9ZcaZ2m2eYnJ00V4S1RnqHsg3ePbzC/pTTUK5Ovuw5F+mHgag
         W2lObM1r5xS+45IM6DKrXwX7viFVghA9idqnrD5RJXvOWyIuFe2lYyv0Vn+xaspmz7lp
         t6LlJAOIkKAmJqXAA9f86IP+xJ7dshC2GGyqWyHkArOh8uBmFcaL2SuJIM7rhwUORgfH
         ICtQRb9KtnramwD+ISa9yA1wN5VcZyX8m5N5g5f5Ea8VLXLgmGg3OWrxR8ccvuiuRaQJ
         bZBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUp7L6pdQbccnMLc+t3meia/3EhfBpT6mAJP9Z3PCggcQweb+zm
	O3YRlc/nEJlRmITa80+SnMk=
X-Google-Smtp-Source: APXvYqyJ2u6tWlG6dX4CLwLv927+FBsz3SLl5FPYZfCFDodqHxWjch8bsJOe1znxxTukCHl31ICA/g==
X-Received: by 2002:a05:6512:304:: with SMTP id t4mr17850522lfp.15.1570461718594;
        Mon, 07 Oct 2019 08:21:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bd0:: with SMTP id w16ls53355ljj.13.gmail; Mon, 07 Oct
 2019 08:21:56 -0700 (PDT)
X-Received: by 2002:a2e:8852:: with SMTP id z18mr18593660ljj.232.1570461716729;
        Mon, 07 Oct 2019 08:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570461716; cv=none;
        d=google.com; s=arc-20160816;
        b=kxKN67jg0TxjBEpq+qNflLsF702F9P8sPVwMxLpLOVFlwuZPt9oGjW7Cpr3yB2if4y
         RBtQJ6qpYcHXDTnbQ6ofv9TUlB76905As4SRrV8KTONfFtT5UmEZFXHQX4CMMcr9QTyL
         DdXHRF3fh/O7vgaWuaLFavnCzmH6lYJuMUvUQcAb5QJA9Gd5dmPUygG0QxaprEt/nI0r
         QZHWjkl6gcfirf8Ly07Z9yg1/yCxmurJJFRDQLivez85Q0uVKJNTozjI+7uQMVDjXX3F
         6hGJBsU+FYRAlDR8LmZVlSD8vtKk3bFKigZlaaJQtLBc/CucsS7stZ1bGzgQBuCSGtG+
         P/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nJauAFUJETI1J5xaA+SfY1YV5xEPpF9paJbLS0R6naM=;
        b=m1TdahD6aC9sttf5vxXN8hlm4OsSkDnV8fBV3Sgfsh4AoB2M+W+BEMOLkSWQZ7MIiT
         tziFtjfGdOSzMm+s9bujVusj/2O9aoWJDmtnDiDYshkO+G29bDLrd8qV7jFNvuSxtTs9
         FN3tP09wdMn624xvjcELqb7Isf9YFUjGmxfE1T8TnxmssIOpZQHVbrOIHAvsIOv1U2wY
         2/NNhvVAvZb6oJ2m7iyaP4EtgH4onKNp9mvqmSGGk3b1XgZYTXdj5GRCxBV8j523OGpO
         d+Y9kzHXbupI3KiPQxsjweEvGn317BruElC39Yd14A+fVWBv1gqGpmc4VW3rn8X4OkaY
         titg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a9si1031968lfk.5.2019.10.07.08.21.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 08:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x97FLk7N003194
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2019 17:21:46 +0200
Received: from [139.23.77.210] ([139.23.77.210])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x97FKInq030040;
	Mon, 7 Oct 2019 17:20:18 +0200
Subject: Re: [PATCH v5 2/2] x86/jailhouse: Only enable platform UARTs if
 available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        jailhouse-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
 <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <26021872-8be0-566f-870e-bddbaf2b0dd4@siemens.com>
Date: Mon, 7 Oct 2019 17:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
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

On 07.10.19 14:38, Ralf Ramsauer wrote:
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
>  arch/x86/include/uapi/asm/bootparam.h |  3 +
>  arch/x86/kernel/jailhouse.c           | 83 +++++++++++++++++++++++----
>  2 files changed, 74 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index 43be437c9c71..db1e24e56e94 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -152,6 +152,9 @@ struct jailhouse_setup_data {
>  		__u8	standard_ioapic;
>  		__u8	cpu_ids[255];
>  	} __attribute__((packed)) v1;
> +	struct {
> +		__u32	flags;
> +	} __attribute__((packed)) v2;
>  } __attribute__((packed));
>  
>  /* The so-called "zeropage" */
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index b9647add0063..95550c08ab23 100644
> --- a/arch/x86/kernel/jailhouse.c
> +++ b/arch/x86/kernel/jailhouse.c
> @@ -11,6 +11,7 @@
>  #include <linux/acpi_pmtmr.h>
>  #include <linux/kernel.h>
>  #include <linux/reboot.h>
> +#include <linux/serial_8250.h>
>  #include <asm/apic.h>
>  #include <asm/cpu.h>
>  #include <asm/hypervisor.h>
> @@ -23,9 +24,22 @@
>  
>  static __initdata struct jailhouse_setup_data setup_data;
>  #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
>  
>  static unsigned int precalibrated_tsc_khz;
>  
> +static void jailhouse_setup_irq(unsigned int irq)
> +{
> +	struct mpc_intsrc mp_irq = {
> +		.type		= MP_INTSRC,
> +		.irqtype	= mp_INT,
> +		.irqflag	= MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
> +		.srcbusirq	= irq,
> +		.dstirq		= irq,
> +	};
> +	mp_save_irq(&mp_irq);
> +}
> +
>  static uint32_t jailhouse_cpuid_base(void)
>  {
>  	if (boot_cpu_data.cpuid_level < 0 ||
> @@ -79,11 +93,6 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>  		.type = IOAPIC_DOMAIN_STRICT,
>  		.ops = &mp_ioapic_irqdomain_ops,
>  	};
> -	struct mpc_intsrc mp_irq = {
> -		.type = MP_INTSRC,
> -		.irqtype = mp_INT,
> -		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
> -	};
>  	unsigned int cpu;
>  
>  	jailhouse_x2apic_init();
> @@ -100,12 +109,12 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>  	if (setup_data.v1.standard_ioapic) {
>  		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>  
> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
> -		mp_save_irq(&mp_irq);
> -
> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
> -		mp_save_irq(&mp_irq);
> +		if (IS_ENABLED(CONFIG_SERIAL_8250) &&
> +		    setup_data.hdr.version < 2) {
> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> +			jailhouse_setup_irq(3);
> +			jailhouse_setup_irq(4);
> +		}
>  	}
>  }
>  
> @@ -138,6 +147,53 @@ static int __init jailhouse_pci_arch_init(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SERIAL_8250
> +static bool jailhouse_uart_enabled(unsigned int uart_nr)
> +{
> +	return setup_data.v2.flags & BIT(uart_nr);
> +}
> +
> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
> +				   u32 *capabilities)
> +{
> +	static const u16 pcuart_base[] = {0x3f8, 0x2f8, 0x3e8, 0x2e8};
> +	unsigned int n;
> +
> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
> +		if (pcuart_base[n] != up->iobase)
> +			continue;
> +
> +		if (jailhouse_uart_enabled(n)) {
> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
> +				up->iobase);
> +			jailhouse_setup_irq(up->irq);
> +		} else {
> +			/* Deactivate UART if access isn't allowed */
> +			up->iobase = 0;
> +		}
> +		break;
> +	}
> +}
> +
> +static void jailhouse_serial_workaround(void)
> +{
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
> +}
> +#else /* !CONFIG_SERIAL_8250 */
> +static inline void jailhouse_serial_workaround(void)
> +{
> +}
> +#endif /* CONFIG_SERIAL_8250 */
> +
>  static void __init jailhouse_init_platform(void)
>  {
>  	u64 pa_data = boot_params.hdr.setup_data;
> @@ -188,7 +244,8 @@ static void __init jailhouse_init_platform(void)
>  	if (setup_data.hdr.version == 0 ||
>  	    setup_data.hdr.compatible_version !=
>  		JAILHOUSE_SETUP_REQUIRED_VERSION ||
> -	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
> +	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
> +	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
>  		goto unsupported;
>  
>  	pmtmr_ioport = setup_data.v1.pm_timer_address;
> @@ -204,6 +261,8 @@ static void __init jailhouse_init_platform(void)
>  	 * are none in a non-root cell.
>  	 */
>  	disable_acpi();
> +
> +	jailhouse_serial_workaround();
>  	return;
>  
>  unsupported:
> 

This was missing yet:

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/26021872-8be0-566f-870e-bddbaf2b0dd4%40siemens.com.
