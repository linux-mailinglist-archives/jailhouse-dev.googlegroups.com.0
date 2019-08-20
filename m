Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD4Q53VAKGQEPCMLCMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232A956C8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 07:41:36 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id j16sf6424359wrn.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 22:41:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566279696; cv=pass;
        d=google.com; s=arc-20160816;
        b=HTOetnjM6iTZystdD5+42/GBUQ+O59d7C6sAgaH9Bef1BccoFq1SBnSu36DprBjHVo
         n0Pi1Mq60K/JOLA6d8k9bSQjn4tSZX3CCqzwHD9y+ZUXaKfPrT1eQ7VfsoIvhU5Wixql
         w3QBaH2nuATBbTH0t0YS+7EWHM2ojKmSvaBqn7J7BY2vXbwSpRN51Y4xEgo4CWKGqlod
         tXQ14qMxxGQZ6GPf1k8/XnqKwPUwyn/C/TtV1twjDbP3q2DROoKG+Q2DkC4seKgqQCJf
         SY+Rrj06Ga+3sbHoqGG4v1QC99PZUkI1wDOyqUOz8NX/pE6x1jQOaUJeZVPaI77y6XW6
         39sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=7FlxKks7Uc+UUMTsEbpzO2wvBpnoazwGzww9Zd7VVxA=;
        b=IwFCrbgoDk9pikUNQwTU9o+P00lyt6YIaCN9W/fCwWOWhikNREBPQNJ4QVA998r06J
         NochSZDcqdOqCJobl/TYueddvgpljwsWjcRtoOsnoPzbhF4VARgVyzwFrcMXZdHFqT+b
         dC08Fqv3VkNTin3SJ1CzC1rM1nW6McWlDa4TP/C71+nKTlfg6dNUw9jmr+6wJUrEhHWm
         UhSxbqec/Kqkv2gWWJticjkrtIE94vcLllHSCOgB/BPmKwXzkD0Q7xVYAoR2B3a52oG6
         XlxcmDrTvKNSFq/xezVk/ONVTqRilUb3EmELxjMsyX4lt0dDye/2kOi9TLkpcwpezcXT
         O44w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7FlxKks7Uc+UUMTsEbpzO2wvBpnoazwGzww9Zd7VVxA=;
        b=aFxWo1Zx8eIIykiStGgQXhCIJsqHtWmDphJ7/ehxtZtW5h14JQhp0EM9u/y2Gcp5sD
         AsxmQZdBOaO6JL3447PaduVvzzgNyhPNtQr9zHYWt/fOF2odYrB2wWA9DzoILaY/VY+C
         oKWLHjZqaODNfvg8luJvtih6YjaebOuNZ141/UsFFeaclncNxAkH2XZfm0rAx+acUsnl
         u0/qZ+nl4cKOd7DkrYKnAmvgJJJcPRJxlA4jnDuKUJ+Os7cKNrIZS7wMENY2OOTr7MZ6
         rWUowQdl1YC71Cspr+T0QSHkE7BOXAcRpIpRbSlQJ+p1jJ8p9Rowj4KcmRjBOmPqsLa5
         e5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7FlxKks7Uc+UUMTsEbpzO2wvBpnoazwGzww9Zd7VVxA=;
        b=qkHKHA0T4RpyJJAKq0A8XNLVXca37CC88iFpDJgHSSqedTr21LahsK98W2ZvqXxy6p
         IPZs5pbZ5GfuyctxwuqT8a2EuE6r5XSpyfSf5Eiue4nM3OJs32zdGuawhmSMveNaCQ7q
         S4lGXh3NoCd15BA7awzsUZuAjkklnuItZR6jRrjn3RGcymB5va9fqC/DKduaW7qzbjEy
         dXTzOrCOR6e0MuwNq2nyGw8xBSU9eWYM2l1ofx5ys0g9XJWYVi3Gw6EAgWNOPiwDOUcw
         vnkgMPEeog/evMXS9XyDuptVqPbJF7Tv84HHEH0EP0A27SnWQMvTlVwxfOk7gkaDPpP3
         zICg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxiiKOR06T9HrIRLE8LKiJEq0uqDEVlhO1sx50aELsXmjRBKyr
	hi6dpN4Lpb84k7DbIQ/TtZU=
X-Google-Smtp-Source: APXvYqwtd6/jBuc86V9iwKOE4emqTI6sZIKwaiSxXmoj/U6BV6YtTXe63pH0/rsUBIP3CnUmhkWMFg==
X-Received: by 2002:a5d:4083:: with SMTP id o3mr18687201wrp.150.1566279695851;
        Mon, 19 Aug 2019 22:41:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc01:: with SMTP id f1ls511989wmh.4.canary-gmail; Mon,
 19 Aug 2019 22:41:35 -0700 (PDT)
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr24520479wmb.154.1566279695226;
        Mon, 19 Aug 2019 22:41:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566279695; cv=none;
        d=google.com; s=arc-20160816;
        b=P74+RVmSvOEKnjkn6GtL6vDh551HseC04EOrZ25miRRTJTAJ4JgGvxrLhIbkbS4ox3
         XovbdJylS+L4pqAF/zVBbQ78aa6B2KK9hCHwYGjtgTz789qtmWr3wYeQ9QcCYoMAImLV
         B3Z/Kc01XCqZ8I8PMQU8P5k+CF5hPE9lTJwLnjXSuwxCDgR+hDwUabQ3l7aNV+Y8aaHk
         4qgu0nizs3gZelNPn4fGLiljxgGbOL9crBGtfA54dPrSaFU7QJ7kJYXGCrHtT/R3oxXP
         APvDwOrJm+lfRd7uXpt2Z1f0nuVzJoOp5FE25M0FVl6fCCGpVxFdISRrZseS3MNmLilt
         vjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=q40ZyWf/ILnQsCSuv6xXezybP0wcS1eaC+V2bM/3KaU=;
        b=FwghM8L1NzKUKePhC2B6nJOfG5eeEcf6G1CUiwOgpneaZBLpTTCO2OKQX0sLcOyx1h
         JSKyCuz2s6rc0fTvRrcuWnx1hpNZKEjMji7DwPyU0n0QiVIvQ1Um4OMMw2Zkuejp+Nx4
         QtL3OmwLM02CswTgsLm1VtdEhOCiMtGQEz7vgugrh4MG6KUMFlOdrZ+kigBOM9YchlyR
         CRInd3uZ60IUWQUVqlnmYWA0G3MF9RVz4+KDurrosCnSB5z7yANiCOIJ/UAwlt51v3K2
         3HhwKHfyJbqRtg4IJFN1R9afl1UnXpASshArAXp6QNuwHxYCdSCVcKn4KzO7PgEm+04T
         N39g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w17si605207wmk.1.2019.08.19.22.41.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 22:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x7K5fWm4005344
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2019 07:41:33 +0200
Received: from [167.87.2.254] ([167.87.2.254])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x7K5fVat005998;
	Tue, 20 Aug 2019 07:41:32 +0200
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if
 available
To: hpa@zytor.com, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
Cc: Ingo Molnar <mingo@redhat.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
 <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
 <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com>
 <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com>
 <3D1CA272-5511-4082-9548-050ED4A0543E@zytor.com>
 <c106ddb4-809e-0ae9-df02-2e5b22f23b03@oth-regensburg.de>
 <5F992CC8-90A5-46B4-9E78-72F9CA82232F@zytor.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <73ffd666-d161-fd8e-0bfd-da99ba4fce64@siemens.com>
Date: Tue, 20 Aug 2019 07:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5F992CC8-90A5-46B4-9E78-72F9CA82232F@zytor.com>
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

On 19.08.19 20:43, hpa@zytor.com wrote:
> On August 19, 2019 10:22:07 AM PDT, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> wrote:
>> On 8/14/19 12:53 AM, hpa@zytor.com wrote:
>>> On August 13, 2019 4:04:34 AM PDT, Jan Kiszka
>> <jan.kiszka@siemens.com> wrote:
>>>> On 13.08.19 11:32, hpa@zytor.com wrote:
>>>>> On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer
>>>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>>>> ACPI tables aren't available if Linux runs as guest of the
>>>> hypervisor
>>>>>> Jailhouse. This makes the 8250 driver probe for all platform UARTs
>>>> as
>>>>>> it assumes that all platform are present in case of !ACPI.
>> Jailhouse
>>>>>> will stop execution of Linux guest due to port access violation.
>>>>>>
>>>>>> So far, these access violations could be solved by tuning the
>>>>>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only
>>>> map
>>>>>> consecutive platform UARTs to Linux, and only in the sequence
>> 0x3f8,
>>>>>> 0x2f8, 0x3e8, 0x2e8.
>>>>>>
>>>>>> Beginning from setup_data version 2, Jailhouse will place
>>>> information
>>>>>> of
>>>>>> available platform UARTs in setup_data. This allows for selective
>>>>>> activation of platform UARTs.
>>>>>>
>>>>>> This patch queries the setup_data version and activates only
>>>> available
>>>>>> UARTS. It comes with backward compatibility, and will still
>> support
>>>>>> older setup_data versions. In this case, Linux falls back to the
>> old
>>>>>> behaviour.
>>>>>>
>>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>>> ---
>>>>>> arch/x86/include/uapi/asm/bootparam.h |  3 ++
>>>>>> arch/x86/kernel/jailhouse.c           | 75
>>>> ++++++++++++++++++++++++---
>>>>>> 2 files changed, 72 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>>>>>> b/arch/x86/include/uapi/asm/bootparam.h
>>>>>> index 6163b1afa7b3..2244c493c3c5 100644
>>>>>> --- a/arch/x86/include/uapi/asm/bootparam.h
>>>>>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>>>>>> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>>>>>> 		__u8	standard_ioapic;
>>>>>> 		__u8	cpu_ids[255];
>>>>>> 	} __attribute__((packed)) v1;
>>>>>> +	struct {
>>>>>> +		__u32	flags;
>>>>>> +	} __attribute__((packed)) v2;
>>>>>> } __attribute__((packed));
>>>>>>
>>>>>> /* The so-called "zeropage" */
>>>>>> diff --git a/arch/x86/kernel/jailhouse.c
>>>> b/arch/x86/kernel/jailhouse.c
>>>>>> index e5ac35efc4b3..1c75de1496f3 100644
>>>>>> --- a/arch/x86/kernel/jailhouse.c
>>>>>> +++ b/arch/x86/kernel/jailhouse.c
>>>>>> @@ -11,6 +11,7 @@
>>>>>> #include <linux/acpi_pmtmr.h>
>>>>>> #include <linux/kernel.h>
>>>>>> #include <linux/reboot.h>
>>>>>> +#include <linux/serial_8250.h>
>>>>>> #include <asm/apic.h>
>>>>>> #include <asm/cpu.h>
>>>>>> #include <asm/hypervisor.h>
>>>>>> @@ -20,8 +21,13 @@
>>>>>> #include <asm/reboot.h>
>>>>>> #include <asm/setup.h>
>>>>>>
>>>>>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>>>>>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>>>>>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>>>>>> +
>>>>>> static __initdata struct jailhouse_setup_data setup_data;
>>>>>> #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>>>>>> sizeof(setup_data.v1))
>>>>>> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN +
>>>> sizeof(setup_data.v2))
>>>>>>
>>>>>> static unsigned int precalibrated_tsc_khz;
>>>>>>
>>>>>> @@ -78,11 +84,13 @@ static void __init
>>>>>> jailhouse_get_smp_config(unsigned int early)
>>>>>> 		.type = IOAPIC_DOMAIN_STRICT,
>>>>>> 		.ops = &mp_ioapic_irqdomain_ops,
>>>>>> 	};
>>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>>> 	struct mpc_intsrc mp_irq = {
>>>>>> 		.type = MP_INTSRC,
>>>>>> 		.irqtype = mp_INT,
>>>>>> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>>>> 	};
>>>>>> +#endif
>>>>>> 	unsigned int cpu;
>>>>>>
>>>>>> 	jailhouse_x2apic_init();
>>>>>> @@ -99,12 +107,16 @@ static void __init
>>>>>> jailhouse_get_smp_config(unsigned int early)
>>>>>> 	if (setup_data.v1.standard_ioapic) {
>>>>>> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>>>>>
>>>>>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>>>> -		mp_save_irq(&mp_irq);
>>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>>> +		if (setup_data.hdr.version < 2) {
>>>>>> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>>>> +			mp_save_irq(&mp_irq);
>>>>>>
>>>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>>>> -		mp_save_irq(&mp_irq);
>>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>>>> +			mp_save_irq(&mp_irq);
>>>>>> +		}
>>>>>> +#endif
>>>>>> 	}
>>>>>> }
>>>>>>
>>>>>> @@ -137,6 +149,42 @@ static int __init
>> jailhouse_pci_arch_init(void)
>>>>>> 	return 0;
>>>>>> }
>>>>>>
>>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>>> +static const u16 pcuart_base[] = {
>>>>>> +	0x3f8,
>>>>>> +	0x2f8,
>>>>>> +	0x3e8,
>>>>>> +	0x2e8,
>>>>>> +};
>>>>>> +
>>>>>> +static void jailhouse_serial_fixup(int port, struct uart_port
>> *up,
>>>>>> +				   u32 *capabilites)
>>>>>> +{
>>>>>> +	struct mpc_intsrc mp_irq = {
>>>>>> +		.type = MP_INTSRC,
>>>>>> +		.irqtype = mp_INT,
>>>>>> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>>>> +	};
>>>>>> +	unsigned int n;
>>>>>> +
>>>>>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>>>>>> +		if (pcuart_base[n] != up->iobase)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
>>>>>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>>>>>> +				up->iobase);
>>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>>>>>> +			mp_save_irq(&mp_irq);
>>>>>> +		} else {
>>>>>> +			/* Deactivate UART if access isn't allowed */
>>>>>> +			up->iobase = 0;
>>>>>> +		}
>>>>>> +		break;
>>>>>> +	}
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>> static void __init jailhouse_init_platform(void)
>>>>>> {
>>>>>> 	u64 pa_data = boot_params.hdr.setup_data;
>>>>>> @@ -186,7 +234,8 @@ static void __init
>> jailhouse_init_platform(void)
>>>>>> 	if (setup_data.hdr.version == 0 ||
>>>>>> 	    setup_data.hdr.compatible_version !=
>>>>>> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>>>>>> -	    (setup_data.hdr.version >= 1 && header.len <
>>>> SETUP_DATA_V1_LEN))
>>>>>> +	    (setup_data.hdr.version == 1 && header.len <
>>>> SETUP_DATA_V1_LEN)
>>>>>> ||
>>>>>> +	    (setup_data.hdr.version >= 2 && header.len <
>>>> SETUP_DATA_V2_LEN))
>>>>>> 		goto unsupported;
>>>>>>
>>>>>> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>>>>>> @@ -202,6 +251,20 @@ static void __init
>>>> jailhouse_init_platform(void)
>>>>>> 	 * are none in a non-root cell.
>>>>>> 	 */
>>>>>> 	disable_acpi();
>>>>>> +
>>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>>> +	/*
>>>>>> +	 * There are flags inside setup_data that indicate availability
>> of
>>>>>> +	 * platform UARTs since setup data version 2.
>>>>>> +	 *
>>>>>> +	 * In case of version 1, we don't know which UARTs belong Linux.
>>>> In
>>>>>> +	 * this case, unconditionally register 1:1 mapping for legacy
>> UART
>>>>>> IRQs
>>>>>> +	 * 3 and 4.
>>>>>> +	 */
>>>>>> +	if (setup_data.hdr.version > 1)
>>>>>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>>>>>> +#endif
>>>>>> +
>>>>>> 	return;
>>>>>>
>>>>>> unsupported:
>>>>>
>>>>> Or you could, you know, pass a data structure that already does
>>>> this... it's called DSDT.
>>>>>
>>>>
>>>> At least by the time the boot process for Linux under Jailhouse was
>>>> designed
>>>> (~2015), ACPI was not able to express the minimal hardware we are
>>>> exposing. So
>>>> we went for "CONFIG_ACPI disabled", and that was rather simple.
>>>>
>>>> There are some new knobs now to get rid of legacy platform
>> components.
>>>> But,
>>>> e.g., is it ACPI-compliant to expose a PM_TMR block, but nothing
>> else?
>>>> How would
>>>> you communicate pre-calibrated TSC and APIC frequencies?
>>>>
>>>> Thanks,
>>>> Jan
>>>
>>> If ACPI cannot represent something important, I'd like to bring that
>> to the attention of the ACPI committee so we can standardize whatever
>> is missing.
>>
>> In an offlist discussion, Jan and I agreed that DSDTs should definitely
>> be considered and evaluated in the long run, but for the moment - and
>> for what I actually want to achieve with this patch - this should do
>> the
>> job.
>>
>> I will send a v3 and address Jan's remarks on patch 1/2.
>>
>> Thanks
>>   Ralf
> 
> The request still remains, though: *please* contact me if there are things we need to be able to express in ACPI and can't.
> 

Thanks for the offer. I already provided two questions above.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/73ffd666-d161-fd8e-0bfd-da99ba4fce64%40siemens.com.
