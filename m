Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7CSDVAKGQEXG34CPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD417F735
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 14:48:44 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id f3sf46857521edx.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 05:48:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564750124; cv=pass;
        d=google.com; s=arc-20160816;
        b=biPxWThbGtCNuQWs//sebXymTTp42MqBVTT7CzcYCeqKWnQjeyf7io0/G1lIUiAzui
         Wmr/hSER+DBqiwL1pA8qL7ZcgfxpOwA+YwU8cCF/umFz9DPdVVM7WKMXykfk//7mASrY
         aYDIHlZfoB8NVY92EeK+aoljulYxfYKi6t/mKLBLRWHVlJ7Yizg7o/8IcCfIQehQ4kQZ
         WCGzTRG6o9WlCitJ7ARJAdeG+cLGGWWvYqOkzDiamx+CAT6VIIiSZFWhqGSrX4xI5BhT
         OXH+lPCXzLCO6Jkro/1QwQfnc6Z5nf3p0GRGW7KkgfEXqM26hLyQeXua9/f0tMdJRWhk
         FboA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=72I8dGPfrbptjkm0XCxJMcsKqO9jmftiIyH+SR+LI6k=;
        b=B4Rl08cpvxqwRbb91WF4Ik4e1W8+t/J+S3/aLJ7lkvfXrwHa4qRr6oF65QMRNxMvle
         ojjjLVjDfwa7t+TUC6U128F8RBtyexjh6EBaUOCh7+p0gvwUAAY9wUY3hwLbiW7x2Xum
         Ub2MaDTLDIBTxax2XlGzYU73rZ30RPhqWWv4h71vqBXfPDDRt+JZj03yCOkdXXSVGOfw
         UeYSk44C9Z3fFraVPhVSqccMuVdz8WPHq6lbQXeW595ZpzmbOfF3v/kL8RXnUytaX1Mm
         xkryE8rkBzbZBIr+xSxQho4AcYmyeX2ngn5lJ8aIg4EPs/8H98WK18MkKJ3Ck3c/rm+o
         3IIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=72I8dGPfrbptjkm0XCxJMcsKqO9jmftiIyH+SR+LI6k=;
        b=OijDYxMvMrnmce+E0JIy5yy74cCcFDZxflC4BMgEyiSd8ZcswgwqSYS5x40rl88r8a
         H+vuzcMJ/EBynsw3w3mCDTdcdonMQJgZOPbdzXlp25j30SXmq/Abc3xzJfr03KvWDZ+R
         Hy1cW85CL5xlBJqPSbL+pPLiaOKwDy1S8LYiXRUcV1uyuT7UMLHd48o/NzVDh9rjYiWR
         tFHEqASyjXyagakXkWUGHBDf2onqqxG6I778Ss/hQkuR3BSx3bbDyipZFOooBGE8nqoQ
         vzR6mK1iRCItYkCWA0TNCKHg9hBVldvkRUHcRoCp75Iy/07zj4emAqNy0csLCBXGvwn3
         HI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=72I8dGPfrbptjkm0XCxJMcsKqO9jmftiIyH+SR+LI6k=;
        b=bq8jQtRqyKLS9NVJarxmNC6OVMuRy6Fk8GM+nntARqSQKMVeGBlK2q/38xCKjPMMY6
         l540RKMit+tRW+ZpLdhDLVSVEuWEMr/QEmJP8RCP9LZA0HaMq8wPJMVM+BsuCSbtIqn7
         OmvR6z0FxRgyeHLb0Er8VTF/VP5PsoC6a/jrDpF2Xq7G3WtIM1LY/GETLQkrJvm0zg7F
         KKGAI6dXJvYoq5MIE32GFWAaCOF0FiEgudN8qo2fpIOtwbDorcw0zO+qFLiu7B5RPvms
         YhxrJjIig++4JLIqm7lLX16jGq4b1U185RGNgmWoSP5VepzjPdzdfyDytb5GZEmf8mxX
         lE2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUOWM358fucUGogGeUy2QQyaE9lhwCD2xTKyi1/aiLiUDVB7eVW
	gUW7JUiXVEKBQaeZGywGn8I=
X-Google-Smtp-Source: APXvYqxHWDoZY8zvx9vfPvZhEHRTe1znX+lo4vLRSEE0LIWh5aqyFPGC3aXgEAGB7iaMoU6WE/ZF+g==
X-Received: by 2002:a17:906:7f0f:: with SMTP id d15mr107926765ejr.39.1564750123639;
        Fri, 02 Aug 2019 05:48:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7a3:: with SMTP id h32ls18517668ede.16.gmail; Fri, 02
 Aug 2019 05:48:42 -0700 (PDT)
X-Received: by 2002:aa7:c0cf:: with SMTP id j15mr20995443edp.138.1564750122954;
        Fri, 02 Aug 2019 05:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564750122; cv=none;
        d=google.com; s=arc-20160816;
        b=KoEuWQNLTkFxEiFDPT7IpmIGaESNgm3VNJnJdcdG3QzRFrQNmB9pHuXztwVmc1/4/P
         ZdMR2tS5zVqn5wwSNurJtGAVStE6bNtcmUqj4GNqocliU8YjaYx6BVjIORU/J2S8Pva2
         hzh4u/Gh1zr1HWz8b7Mu3Kdlye9f4oE1QRKuuXrpl/PrwvOZH7EokL2PRBNcgHqaSl9j
         WYR1y5T1/jjzsX31xzvqRDzNBTxn+AsqJOgB+FyKFnyWjkq+sUrOIpP0raniRvZlC/1V
         8EB4L4oKM8VXvhCO1UywXORDXU3uYEgLh0UWFMsZzbk125YFXC+ZCxglD6xdOipGGEUK
         SheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nopygZ6aRb0lgQ/p6PJhNE/ypB7E0sJZoRHvBQx0ua4=;
        b=xx6V9AnC31i/FxyDgfbgrLx07jQABDlTkrHheOqKec4ta1PW8aiNAAp33ZK/pDlsUl
         u4uJwDJK3UbhqHYDekynuhrBO5wgwnKjSyWhQTA8Z6QZ0nVGFsY9xoq8l0uAOu+mWPJw
         MQHSMky06hIaKGjPRSTGYWXGgEgh4QH2N5NGTqZUQ0xXaxoUP11IcOcDlBddCBPF7cMr
         yZ3jprqjiD7CrwW7kb3zuoDA8yeX0i4eNzPXTmli9iDPsn2ZyOK2jag/OOU4OyUPbLo2
         qCugT4czdUamJGSG0sk9QH9KK0cj2WnMsYnEQ42ifCRJCItmjexv0dgJzpopxadeTxBS
         SNog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s30si1033192eda.4.2019.08.02.05.48.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x72CmdJV014674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2019 14:48:39 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x72CmcAJ026414;
	Fri, 2 Aug 2019 14:48:38 +0200
Subject: Re: [PATCH] x86/jailhouse: Only enable platform UARTs if available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
Cc: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <359331f7-9c7b-5e2f-adb6-90294f7ad079@siemens.com>
Date: Fri, 2 Aug 2019 14:48:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de>
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

On 02.08.19 14:33, Ralf Ramsauer wrote:
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
>  arch/x86/include/uapi/asm/bootparam.h |  1 +
>  arch/x86/kernel/jailhouse.c           | 74 ++++++++++++++++++++++++---
>  2 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
> index a06cbf019744..2d6a40cbf3df 100644
> --- a/arch/x86/include/uapi/asm/bootparam.h
> +++ b/arch/x86/include/uapi/asm/bootparam.h
> @@ -146,6 +146,7 @@ struct jailhouse_setup_data {
>  	__u32	apic_khz;
>  	__u8	standard_ioapic;
>  	__u8	cpu_ids[255];
> +	__u32	flags;
>  } __attribute__((packed));
>  
>  /* The so-called "zeropage" */
> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
> index 108c48d0d40e..3b73647b2456 100644
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
> @@ -20,6 +21,10 @@
>  #include <asm/reboot.h>
>  #include <asm/setup.h>
>  
> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
> +
>  static __initdata struct jailhouse_setup_data setup_data;
>  static unsigned int precalibrated_tsc_khz;
>  
> @@ -76,11 +81,13 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>  		.type = IOAPIC_DOMAIN_STRICT,
>  		.ops = &mp_ioapic_irqdomain_ops,
>  	};
> +#ifdef CONFIG_SERIAL_8250
>  	struct mpc_intsrc mp_irq = {
>  		.type = MP_INTSRC,
>  		.irqtype = mp_INT,
>  		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>  	};
> +#endif
>  	unsigned int cpu;
>  
>  	jailhouse_x2apic_init();
> @@ -97,12 +104,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>  	if (setup_data.standard_ioapic) {
>  		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>  
> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
> -		mp_save_irq(&mp_irq);
> +#ifdef CONFIG_SERIAL_8250
> +		if (setup_data.version < 2) {
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
>  	}
>  }
>  
> @@ -135,6 +146,42 @@ static int __init jailhouse_pci_arch_init(void)
>  	return 0;
>  }
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
> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.flags, n)) {
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
>  static void __init jailhouse_init_platform(void)
>  {
>  	u64 pa_data = boot_params.hdr.setup_data;
> @@ -162,8 +209,12 @@ static void __init jailhouse_init_platform(void)
>  		memcpy(&header, mapping, sizeof(header));
>  		early_memunmap(mapping, sizeof(header));
>  
> +		/*
> +		 * Version 2 extends version 1 by four byte. We still do
> +		 * support version 1.
> +		 */
>  		if (header.type == SETUP_JAILHOUSE &&
> -		    header.len >= sizeof(setup_data)) {
> +		    header.len >= (sizeof(setup_data) - 4)) {

Hmm, looking at this again, maybe it's better to have struct setup_data_v1
inside setup_data, instead of a magic "- 4".

>  			pa_data += offsetof(struct setup_data, data);
>  
>  			mapping = early_memremap(pa_data, sizeof(setup_data));
> @@ -195,6 +246,17 @@ static void __init jailhouse_init_platform(void)
>  	 * are none in a non-root cell.
>  	 */
>  	disable_acpi();
> +
> +#ifdef CONFIG_SERIAL_8250
> +	/* Since setup_data.version 2 we have flags that indicate availability
> +	 * of platform UARTs.
> +	 *
> +	 * In case of version 1, we don't know which UARTs belong Linux. In
> +	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
> +	 * 3 and 4 */
> +	if (setup_data.version > 1)
> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
> +#endif
>  }
>  
>  bool jailhouse_paravirt(void)
> 

When addressing the above, you can add my

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/359331f7-9c7b-5e2f-adb6-90294f7ad079%40siemens.com.
