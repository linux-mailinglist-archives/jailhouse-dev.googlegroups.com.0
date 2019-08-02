Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBD76SDVAKGQE3XSFITI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A847FB7C
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 15:48:00 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id b12sf46997346eds.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 06:48:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564753680; cv=pass;
        d=google.com; s=arc-20160816;
        b=GTXlpa3aA+NqxDPjT7IMxTocCt9oS7MWgNKUK+nkLaR3Sze2di0MT2dp64b26NeaDr
         dpfv3yW8UNq4WMXg8STe1AFcEZVAV+03tomHTrupEeslSHCZol/nMCv1mYVI+XNiD0Y/
         mAIaLduM0adhY7Zj79qND8BVLRVL12AhCh7+3qWBfq4VbB77YLt3NqJTe+gv4Nz2d6QR
         qxM+GQWERmYNFDxaEUn2i5XZzwTYHOaTPcV6NDUzivcLB0W6bHFnTOGOlsA74XyJQwDw
         xtI8UwAXY0CEchwyC19vSmX135tcgYt5Y8aV2kf0DpZr0OtNqga7vQKN4y4X58cb+wsW
         7qLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:cc
         :to:subject:sender:dkim-signature;
        bh=1KmaPy8YSgllqe7Xgp4C3cc49YGELH+ExLmtKxTmIuE=;
        b=ndFXPs1ppyKRg5QN5QEfffc3kiH3m3gfuRa8bspoxd13DtXrxTWzl6+msbQJsS7a8a
         XAfW0U/17sdqY84TU0NesRTmt3N2h+PVANqyM9fBfl0V8Fl/GECm08zqIPynQEshadb5
         ik+FPaDBpfwbC4UQK9xUSc0Xx2GFX4grndriaIUewnz1pZaI59qXA1LEhjz7FsIQCECK
         84ZH+F2dMOwYU2r+aDA/bD9OHMCWlyDTfCfctulcWVcwildwdB3WTetxs+YFAptoGrja
         J1tQEu/9CH49YjFQRfo46MSkzXa6GYkyYn+xPwYlIg7zltbWv5LPJk+yW62OUnFkvZGC
         qVEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YZYqZ1QP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1KmaPy8YSgllqe7Xgp4C3cc49YGELH+ExLmtKxTmIuE=;
        b=S5xj1BGDYgI17KIS3/ER6kh39aqQwzeZKnDiCEMxwVSu1dSbnSXwlmlOHF3LkJznuh
         htE9Pfm82M/zOzo4/PxeUpu4MlFj7//vc/OXdUxVt975zhCTPIei9SrbFvzwlTFSzCNy
         SFMPI7jEfsoJPLDxez/Bws7ZnNJOpsPa4ilRHn9tXHek2gFVfBcDIOkXDfV2KScmK6Oe
         qfF8+ZMYO/x6SYyvc/5+9+ZZuKacaAZdmx1eDwIoDKKgxof/lQwBRjfE0Y7nU43WWax1
         AjgkBz34wNZvmkDPOq1EA5iqyr8bEHrlkx9899h6cmYIsdzKPQmO8XlqxgKYEdMEaAAe
         y4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1KmaPy8YSgllqe7Xgp4C3cc49YGELH+ExLmtKxTmIuE=;
        b=G+Ihev1woxQKEiuRf4+ssq4U82v03wSFrPiSgy2xUBkAHIm3+KoV51f31urDj3uQXw
         2M4HdBshMhHdb0vNHLNjyF/WkPeudg351AgfCGDx+dpd7GLF/Osd50s+lZxZOpoqYf1N
         TVAfYJ1DVL7+IxKP1OYLXgGSdjqutAjr60tXDhMRxIJ9R8KIoOMKMTZEZpG9twaQajqH
         5eZ8hvJeWPSerbOC9QeCbsQ1Ym2k9RI+CnhrvlHQ6EyE9iD/9McYMqH7VSzX8pDoo/c8
         9hPJVFw8sk+mXwIs/N+fKcweG1aD7BDqFdngzUravewOVs7PT6sGDeyso/rhCp+hFvZL
         Nh+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLHL+oP7ZTVXZOQUPfK4yIPrNvc3I5vjWbre/16p9DgBFLZ4Mw
	xKzc5NITUPg89WWJIYAeyvM=
X-Google-Smtp-Source: APXvYqwjSsHL3tAtPNDbqjNu9Y13WFMxxC5cMfR6Ic6Re8GM5Y3fQSLeGSvgtL0UHONzzXPg5zJfBQ==
X-Received: by 2002:a50:b122:: with SMTP id k31mr120580513edd.204.1564753680240;
        Fri, 02 Aug 2019 06:48:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:9583:: with SMTP id w3ls18561091eda.5.gmail; Fri, 02 Aug
 2019 06:47:59 -0700 (PDT)
X-Received: by 2002:a50:f05a:: with SMTP id u26mr119381630edl.116.1564753679621;
        Fri, 02 Aug 2019 06:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564753679; cv=none;
        d=google.com; s=arc-20160816;
        b=l3HF7ShoCixnsManIj4LF/VYBhj6OqiRdLejGrqNrtEg3c7insNYGvG6iCynmITkwc
         5aRVz6cEM4855Mf8HSOgmQtCs4bd9v67Yeka8YCjp8SPZnGOPX3XINLj9JdZR6BP1Brg
         UbhYV982ALGQItMJsB8ZmeZbgY2YJKAaVRcoFcNLCDjIvR2g0jH8oUgiSZ4/z2X+P27+
         KAaSJmU1+zt8HoB+NxoTk6jwYRkgx0vPpc/x67iPcdpgeLOQERhOBrpcPDvoY9vHK9Uj
         gIZwZY7jxsPCpHj26izk6y0bZ+jW99gzkdwjFwZRPUP9uSdOR90U1LebUO/0NVvF4ocv
         WRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=A5XSghOx8PWM3qQMV7lEJyS6Offa2r/7wt3Ss2TxTYM=;
        b=tAluogToCTzjxwiJgYM1DO8RI8dHTprxVUNd3pzxIuiLZzzyzi9lQ6GcAlbQmJ5h1K
         ZDw8tI+HzSbDzXg4gMVdXw7iObXYcyr/QS0++d3FdfNFx8SaibySIpTlnQLN3p13EwFN
         obdb1P2UD1o4gCJnGFVprx9gNHiCZHz2/n1p9Z8Be6Tj7xsbA5ltz9i2tyDHLBWYS2nD
         NAKMIrq32ao1FQwwkT3suzbzcma2wWOdC/Mn5cAdph1OxpQpDXxKt0pFtfIJ7yi7az7v
         TNpwRCYH7TUE2NoVHM7MmkS/OU3GBGssLzuvX2HJp1PvDuYXXONxFvPsdozI/l+efZMn
         TzuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YZYqZ1QP;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a41si4432922edc.5.2019.08.02.06.47.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 06:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 460T4v0fp9zy9f;
	Fri,  2 Aug 2019 15:47:59 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 2 Aug 2019
 15:47:58 +0200
Subject: Re: [PATCH] x86/jailhouse: Only enable platform UARTs if available
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<jailhouse-dev@googlegroups.com>
CC: Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de>
 <359331f7-9c7b-5e2f-adb6-90294f7ad079@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <d08c2103-f24b-4dd4-2f21-aec6fd068921@oth-regensburg.de>
Date: Fri, 2 Aug 2019 15:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <359331f7-9c7b-5e2f-adb6-90294f7ad079@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=YZYqZ1QP;
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



On 8/2/19 2:48 PM, Jan Kiszka wrote:
> On 02.08.19 14:33, Ralf Ramsauer wrote:
>> ACPI tables aren't available if Linux runs as guest of the hypervisor
>> Jailhouse. This makes the 8250 driver probe for all platform UARTs as
>> it assumes that all platform are present in case of !ACPI. Jailhouse
>> will stop execution of Linux guest due to port access violation.
>>
>> So far, these access violations could be solved by tuning the
>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only map
>> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
>> 0x2f8, 0x3e8, 0x2e8.
>>
>> Beginning from setup_data version 2, Jailhouse will place information of
>> available platform UARTs in setup_data. This allows for selective
>> activation of platform UARTs.
>>
>> This patch queries the setup_data version and activates only available
>> UARTS. It comes with backward compatibility, and will still support
>> older setup_data versions. In this case, Linux falls back to the old
>> behaviour.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  arch/x86/include/uapi/asm/bootparam.h |  1 +
>>  arch/x86/kernel/jailhouse.c           | 74 ++++++++++++++++++++++++---
>>  2 files changed, 69 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
>> index a06cbf019744..2d6a40cbf3df 100644
>> --- a/arch/x86/include/uapi/asm/bootparam.h
>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>> @@ -146,6 +146,7 @@ struct jailhouse_setup_data {
>>  	__u32	apic_khz;
>>  	__u8	standard_ioapic;
>>  	__u8	cpu_ids[255];
>> +	__u32	flags;
>>  } __attribute__((packed));
>>  
>>  /* The so-called "zeropage" */
>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>> index 108c48d0d40e..3b73647b2456 100644
>> --- a/arch/x86/kernel/jailhouse.c
>> +++ b/arch/x86/kernel/jailhouse.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/acpi_pmtmr.h>
>>  #include <linux/kernel.h>
>>  #include <linux/reboot.h>
>> +#include <linux/serial_8250.h>
>>  #include <asm/apic.h>
>>  #include <asm/cpu.h>
>>  #include <asm/hypervisor.h>
>> @@ -20,6 +21,10 @@
>>  #include <asm/reboot.h>
>>  #include <asm/setup.h>
>>  
>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>> +
>>  static __initdata struct jailhouse_setup_data setup_data;
>>  static unsigned int precalibrated_tsc_khz;
>>  
>> @@ -76,11 +81,13 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>>  		.type = IOAPIC_DOMAIN_STRICT,
>>  		.ops = &mp_ioapic_irqdomain_ops,
>>  	};
>> +#ifdef CONFIG_SERIAL_8250
>>  	struct mpc_intsrc mp_irq = {
>>  		.type = MP_INTSRC,
>>  		.irqtype = mp_INT,
>>  		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>  	};
>> +#endif
>>  	unsigned int cpu;
>>  
>>  	jailhouse_x2apic_init();
>> @@ -97,12 +104,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
>>  	if (setup_data.standard_ioapic) {
>>  		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>  
>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>> -		mp_save_irq(&mp_irq);
>> +#ifdef CONFIG_SERIAL_8250
>> +		if (setup_data.version < 2) {
>> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>> +			mp_save_irq(&mp_irq);
>>  
>> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>> -		mp_save_irq(&mp_irq);
>> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>> +			mp_save_irq(&mp_irq);
>> +		}
>> +#endif
>>  	}
>>  }
>>  
>> @@ -135,6 +146,42 @@ static int __init jailhouse_pci_arch_init(void)
>>  	return 0;
>>  }
>>  
>> +#ifdef CONFIG_SERIAL_8250
>> +static const u16 pcuart_base[] = {
>> +	0x3f8,
>> +	0x2f8,
>> +	0x3e8,
>> +	0x2e8,
>> +};
>> +
>> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
>> +				   u32 *capabilites)
>> +{
>> +	struct mpc_intsrc mp_irq = {
>> +		.type = MP_INTSRC,
>> +		.irqtype = mp_INT,
>> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>> +	};
>> +	unsigned int n;
>> +
>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>> +		if (pcuart_base[n] != up->iobase)
>> +			continue;
>> +
>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.flags, n)) {
>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>> +				up->iobase);
>> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>> +			mp_save_irq(&mp_irq);
>> +		} else {
>> +			/* Deactivate UART if access isn't allowed */
>> +			up->iobase = 0;
>> +		}
>> +		break;
>> +	}
>> +}
>> +#endif
>> +
>>  static void __init jailhouse_init_platform(void)
>>  {
>>  	u64 pa_data = boot_params.hdr.setup_data;
>> @@ -162,8 +209,12 @@ static void __init jailhouse_init_platform(void)
>>  		memcpy(&header, mapping, sizeof(header));
>>  		early_memunmap(mapping, sizeof(header));
>>  
>> +		/*
>> +		 * Version 2 extends version 1 by four byte. We still do
>> +		 * support version 1.
>> +		 */
>>  		if (header.type == SETUP_JAILHOUSE &&
>> -		    header.len >= sizeof(setup_data)) {
>> +		    header.len >= (sizeof(setup_data) - 4)) {
> 
> Hmm, looking at this again, maybe it's better to have struct setup_data_v1
> inside setup_data, instead of a magic "- 4".

Thanks for mentioning. But that's probably not enough. From now on, the
size we copy from setup_data depends on the version. I forgot to respect
that.

And this eventually brings me to the point that we need proper version
handling.

> 
>>  			pa_data += offsetof(struct setup_data, data);
>>  
>>  			mapping = early_memremap(pa_data, sizeof(setup_data));
>> @@ -195,6 +246,17 @@ static void __init jailhouse_init_platform(void)
>>  	 * are none in a non-root cell.
>>  	 */
>>  	disable_acpi();
>> +
>> +#ifdef CONFIG_SERIAL_8250
>> +	/* Since setup_data.version 2 we have flags that indicate availability
>> +	 * of platform UARTs.
>> +	 *
>> +	 * In case of version 1, we don't know which UARTs belong Linux. In
>> +	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
>> +	 * 3 and 4 */
>> +	if (setup_data.version > 1)
>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>> +#endif
>>  }
>>  
>>  bool jailhouse_paravirt(void)
>>
> 
> When addressing the above, you can add my
> 
> Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks, but I guess this will now become two patches. The first one for
proper version handling, the second one that implements setup_data
version 2.

Logically, the second patch will stay the same, but there's probably too
much noise from the first patch to keep your Reviewed-by.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d08c2103-f24b-4dd4-2f21-aec6fd068921%40oth-regensburg.de.
