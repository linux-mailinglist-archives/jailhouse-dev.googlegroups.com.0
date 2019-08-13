Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSFSZLVAKGQEAVHF3YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCBA8B63F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 13:04:41 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id t25sf6894366ljc.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 04:04:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565694280; cv=pass;
        d=google.com; s=arc-20160816;
        b=WaQEczGcaRbRQXkQnElM4NdOwi72Cl9Zwj+GG1HrxUdFrSy8FIv7Pz0ds4eltgrsrS
         FVKksfxQdtT9la3vk2WBRqSjLvKoEEUoUDRDMH+4Zm/lfJuPNI8cb0GpfMbxUAH9jEXu
         K0IaJc651RMFOPMfuOBQLVGtNip1Wem7fkAI5Ji9TjPGBPVxLG3MBZfMkVvJaTcbv3qM
         l7UpLNqsZ79eUtZol2cQH0dliCk9e3vWXLyih3qbaABHZbU6nWS8mt1D+AjEd4NMREuj
         0Qj9pDlMyeuCMZSg//6t8AX3s+ejMlQzHWVIEIhste6vLkfIWmJxhAG64brQmFCCMlt/
         ejeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=S5lq7ZOS7j3berDSW5V57cIhim/i2MJvt2542IBFWtw=;
        b=F3NC9U6HdkYaVRlH7KB7r1hj6wqmrvRbJbSPFI0VpYFhrSb9vIRMNZuROfYEvHrMwu
         pHT0tx/+7UMnRz81DpOOUc5eUoJVFFp4WuFIGxAtBa0azWP0soqYNZpluRC+cRkxTqO/
         9tKmZCb96sls6ejOLvDG6guS82NBA0V6Oj/yuNpkA6VPtZG7L1jbW6JX+P3zjC827Guo
         hSIhdS/vLzdc9UabC0dofFVk7+LRN4OODIty5kEpvJQhFiRhQ7ApAN4rBoT/WuZ9U3d8
         Z2GxFsez+lh18SisfEDjT9u4ICFxxzlA9N/lhrlSOtqEo1e+Z0FPDc4oVyptvzVlL+Zt
         QBDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S5lq7ZOS7j3berDSW5V57cIhim/i2MJvt2542IBFWtw=;
        b=M5TFhIfexqpsa2SEFrxMTnh6lYW0Hr0dXnlK81xWDOiVX8zglZpSUpaz8yeeAeXC14
         1L0cHEMI/B0+cyDl8dCXMaOdXjJAjktMgci30y0omnAoAbvPxbeUZDr8FvnNrMYq1pzR
         JchZQIvoTkQpLnaYp6zQqmhucRx/5l5qfYEAqlpuBaxcEoDz6Erjm79s6JA72OhGFjpo
         Rvfk3Mg8ZJjd2qmB+R12dSsM8YMsxrIYEFzCdyqauJVmKCDxdb8f19NJQ8yHMqpazvw8
         YDuxKmCEF3uo0aNXxQtj2Z847EcldMT3w7GHCmGCY8MYKUuHuMmhbqlTyGvymr9GHIHF
         DqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S5lq7ZOS7j3berDSW5V57cIhim/i2MJvt2542IBFWtw=;
        b=GbhQM3WrDsm+Y9eQM92FsDadhr1jD/0ZGbcAiT+AxkHWhcmlHZ5gYdvtO3D1cGRW5c
         rgLBSpNHtHytK1k+5dfhB1NlWnx7gNQFTZU9wphO7OxyeKjnuJ3eu4c3bp9FIADn+QVl
         iLyrBxvFP9aPvFDjAXiHUBlu14l3t64SWN67BJ/aHfXb3giOkGLML+gtSv6RtiJa5xMy
         vXeHTaB+GRcBthAD3uQrngUNVIo+u+Z555DS13p8q8dEqAhvUQWUL6r+VQCB9Nq4A27V
         mt8IUGrriB8wJ7moQddMW0L8o+y6rFaAkZfmMG1C8K9kq2MsDt0PYcPAsAHiKibxK9Ut
         E3dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVawFxSTlVLY4GNfpQgq2drrrxkyokz9Onczyh+AJ89U4V8NEHR
	FEatj2r5+DeSCHkdF3wpmJc=
X-Google-Smtp-Source: APXvYqxfTYzVyX/qtNqzXu3UYfiR7NW2KlCQOxubu5USgQILleAUeuPFe2/uC8KrNtFaCRDBYQylmw==
X-Received: by 2002:a19:750b:: with SMTP id y11mr20386747lfe.99.1565694280602;
        Tue, 13 Aug 2019 04:04:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:1288:: with SMTP id 8ls299023ljs.12.gmail; Tue, 13 Aug
 2019 04:04:39 -0700 (PDT)
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr11007278ljs.44.1565694279810;
        Tue, 13 Aug 2019 04:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565694279; cv=none;
        d=google.com; s=arc-20160816;
        b=G+pyEzAsb5qojhRtUHlRLSmaLTY3tJ1Lx6VzJQ3tYW90Wz9KxX7E7CeiSW7eHtKad5
         /EEtcjC9QfawhnwP3Q1g+dYX7r8q2MWzi9gQ3oDvCfempbMQnthLST3Q7+HO9SgcF1HX
         Eeo4MJw9QHIEPJ0qTLzo6JcWT90EkDqdmfTOxe73Ose+tEM9J/ZASork3xpaDIh5YHS5
         KqUiSVK/NOTDfU9n8p6AwSiaT7iHHwwU3q3ZmZq4GEjj17Q/o7xPg7rXUBhFhzw0A4qL
         eXCKbLvEQ+AqpMX8zMnSG9xHXfp1sPw4JwNJHXu0j3LYmCxecuVrBvSnA+x4xnfu4gz7
         PiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jzYSVfjqZ1ikPsjKOuFl6SZrmLhZnuPcjlVXs/S2LzU=;
        b=oo7EEnKZrJu2xFmwiSwxPqnBQnyG9jpKRAtDTLmmzIKLiyg5ySHOfN+VOyBwcHhc8A
         /Mg6AcQAX7lPezudVzaRndRq51UPiCgQaBQlqg0y7yaBU7glMOv1JxBpXdTqb/vy83E7
         7+dM7VTU7S4+5oMBZcK37fGQiBXnPTelrv1YO5w6lF5Z7cCAKE54DGfQs1ds7oIsAwCp
         aidtCJSzkdXk+Tjprvv6eLpp7Q4sraC5u9cFAMlEWuCdck4LIKTyTqdgKnEHeIThTV93
         87NK83bXz/ZKFOHJE6TlMlRqA0QAf+7JblHK/DkNDimCSTu4dJcOgfEFyApdBVdHKCra
         zLkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h19si518636ljj.3.2019.08.13.04.04.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 04:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7DB4abZ012407
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Aug 2019 13:04:36 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7DB4aXI004256;
	Tue, 13 Aug 2019 13:04:36 +0200
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if
 available
To: hpa@zytor.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
Cc: Ingo Molnar <mingo@redhat.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
 <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
 <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com>
Date: Tue, 13 Aug 2019 13:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com>
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

On 13.08.19 11:32, hpa@zytor.com wrote:
> On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> wrote:
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
>> Beginning from setup_data version 2, Jailhouse will place information
>> of
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
>> arch/x86/include/uapi/asm/bootparam.h |  3 ++
>> arch/x86/kernel/jailhouse.c           | 75 ++++++++++++++++++++++++---
>> 2 files changed, 72 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>> b/arch/x86/include/uapi/asm/bootparam.h
>> index 6163b1afa7b3..2244c493c3c5 100644
>> --- a/arch/x86/include/uapi/asm/bootparam.h
>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>> 		__u8	standard_ioapic;
>> 		__u8	cpu_ids[255];
>> 	} __attribute__((packed)) v1;
>> +	struct {
>> +		__u32	flags;
>> +	} __attribute__((packed)) v2;
>> } __attribute__((packed));
>>
>> /* The so-called "zeropage" */
>> diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>> index e5ac35efc4b3..1c75de1496f3 100644
>> --- a/arch/x86/kernel/jailhouse.c
>> +++ b/arch/x86/kernel/jailhouse.c
>> @@ -11,6 +11,7 @@
>> #include <linux/acpi_pmtmr.h>
>> #include <linux/kernel.h>
>> #include <linux/reboot.h>
>> +#include <linux/serial_8250.h>
>> #include <asm/apic.h>
>> #include <asm/cpu.h>
>> #include <asm/hypervisor.h>
>> @@ -20,8 +21,13 @@
>> #include <asm/reboot.h>
>> #include <asm/setup.h>
>>
>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>> +
>> static __initdata struct jailhouse_setup_data setup_data;
>> #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>> sizeof(setup_data.v1))
>> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
>>
>> static unsigned int precalibrated_tsc_khz;
>>
>> @@ -78,11 +84,13 @@ static void __init
>> jailhouse_get_smp_config(unsigned int early)
>> 		.type = IOAPIC_DOMAIN_STRICT,
>> 		.ops = &mp_ioapic_irqdomain_ops,
>> 	};
>> +#ifdef CONFIG_SERIAL_8250
>> 	struct mpc_intsrc mp_irq = {
>> 		.type = MP_INTSRC,
>> 		.irqtype = mp_INT,
>> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>> 	};
>> +#endif
>> 	unsigned int cpu;
>>
>> 	jailhouse_x2apic_init();
>> @@ -99,12 +107,16 @@ static void __init
>> jailhouse_get_smp_config(unsigned int early)
>> 	if (setup_data.v1.standard_ioapic) {
>> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>
>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>> -		mp_save_irq(&mp_irq);
>> +#ifdef CONFIG_SERIAL_8250
>> +		if (setup_data.hdr.version < 2) {
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
>> 	}
>> }
>>
>> @@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
>> 	return 0;
>> }
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
>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
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
>> static void __init jailhouse_init_platform(void)
>> {
>> 	u64 pa_data = boot_params.hdr.setup_data;
>> @@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
>> 	if (setup_data.hdr.version == 0 ||
>> 	    setup_data.hdr.compatible_version !=
>> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>> -	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
>> +	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN)
>> ||
>> +	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
>> 		goto unsupported;
>>
>> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>> @@ -202,6 +251,20 @@ static void __init jailhouse_init_platform(void)
>> 	 * are none in a non-root cell.
>> 	 */
>> 	disable_acpi();
>> +
>> +#ifdef CONFIG_SERIAL_8250
>> +	/*
>> +	 * There are flags inside setup_data that indicate availability of
>> +	 * platform UARTs since setup data version 2.
>> +	 *
>> +	 * In case of version 1, we don't know which UARTs belong Linux. In
>> +	 * this case, unconditionally register 1:1 mapping for legacy UART
>> IRQs
>> +	 * 3 and 4.
>> +	 */
>> +	if (setup_data.hdr.version > 1)
>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>> +#endif
>> +
>> 	return;
>>
>> unsupported:
> 
> Or you could, you know, pass a data structure that already does this... it's called DSDT.
> 

At least by the time the boot process for Linux under Jailhouse was designed 
(~2015), ACPI was not able to express the minimal hardware we are exposing. So 
we went for "CONFIG_ACPI disabled", and that was rather simple.

There are some new knobs now to get rid of legacy platform components. But, 
e.g., is it ACPI-compliant to expose a PM_TMR block, but nothing else? How would 
you communicate pre-calibrated TSC and APIC frequencies?

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/34984d28-78cf-210a-9bbb-b00d50bee7e1%40siemens.com.
