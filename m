Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBCP7ZTVAKGQEKGSKL7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 821908C481
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 00:54:03 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id v49sf93503334otb.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 15:54:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565736842; cv=pass;
        d=google.com; s=arc-20160816;
        b=E5+80oeAzj+L5E8Xo6eML2xZDbQSzGlpZg7GezwQT9E5LxM2xePhDj/Nl0UBQup3w8
         Ul2vU4kx1nan0hUpepI3ECmMG1ttlqkaz3D2048SBTqymoeDQawd0SEokyZQtU5ZkQ9m
         n5inryaRDOf+gNtBP7vUSzqjSmeH5qkr+picJOuCAAWifqdjGufDHM9M5CMZd99rta2N
         jK+4nhKDW4SJ1TZH3fb/3tDlNOb9K2H3S/cZPAHE2TYREzUjZrchn9qE7eAcAh3vRXq1
         Wy823idyN6sMcq7ZUPBNVQP9D12PJZli38DRRemkklMZzdu2SL8bCsjtE4CS4PLn2Qng
         vsoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:from:cc:to:subject
         :mime-version:references:in-reply-to:user-agent:date:dkim-filter
         :sender:dkim-signature;
        bh=ZR+4r3gS1D78ivIQH6BGoT3UEmzhEN8nzLp8RBGNPH8=;
        b=CiQg8mn/dzD0vdBhcbA4SZzh8qnczK942MoXhxyaa/CwN3Emreo7SPvf5Y9LjnwF7p
         nxtNoXHEn7M1SWot6xhfwXoJW/bItD8f/hECqYo3GfjIjQSce6ncHZOEHNAIDt8joNAx
         mzUTHXmrRcbVQMQaXPF38UPD0yHV9SVwqHLZVsghK8kFQVhQcynQ5O1aLH26SKvHSNSE
         KYU48HrQgwezxKtG7iKEti+9G06M+JY7zyZ9KgfvRlf2MU7/KDaNUXxy8BlgB8zP1IT4
         FrZmTiYoRR8TxWUJU4QMG59prXzAHMjvmjidPCzLKeARR/ItUFbNaPQ4XmTEXvngiuvU
         Dosg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=CftVUUVV;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:dkim-filter:date:user-agent:in-reply-to:references
         :mime-version:subject:to:cc:from:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZR+4r3gS1D78ivIQH6BGoT3UEmzhEN8nzLp8RBGNPH8=;
        b=i0B3mwKR61mKjtTRLvAeRpDDTc655q5ye2Mqk3wr3eGjyeLqvDzoBAwHBhh9quH2qo
         9IEblFVyDg9rZe5+a3ZBJMaTLQxmFsK8i1E1+dT09JHR7+nxBZ54e93pyM2Bmvh7OtEt
         AsKE3RDaIwG7qaYmkOs3Vf3DfDqj7ygijZ2CyOGf9n7K5uudnWAZtPRKlOMlM82lbvFB
         KO1FvgwqLiXNHX5eXAmonZZHXotorfIGtV2qIm0SiTutQHPIssP1J7LzkwLHIeIRlyEc
         fs2UpWRGxBOZgsr5NGnqSKZ/94VtfQInvlYtYfX3T+kYkgZsLw8M7ofbC0+NX+qEebYX
         qVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:dkim-filter:date:user-agent:in-reply-to
         :references:mime-version:subject:to:cc:from:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZR+4r3gS1D78ivIQH6BGoT3UEmzhEN8nzLp8RBGNPH8=;
        b=ZrGWtGsPrb8Z3WyzPGn9Rn4INh6LqwyWH4CGaYKc0dDnv+Ul+AQIotw/cqbjHCLUD8
         xrobIoG2Cx5mUk2kDcJwU44lizo7GcrdBwCN7OQMCMQopUFBVoYGonhkqkGkEeIww6aR
         GlS2FvZ/Dk1wXKWTDnK++2NwPKelmInS65X2PdAdSZan8FbTQ1EUU/DYWMe6cUUa4YJo
         UCvMe/DqkV3YRA+vqy0yOnzr0pNWpvySEmY8xnQYK366Mk9ytx8Mt1NHT84jmclcCZG5
         6QwN97WOj9/EeOyW21umJ1SZ8GvC/bDxEWtobnlNcTQQdMmD3+XLgsCohJvdoVZPS/t/
         uxYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU7R1yeP5UKniIuh1sLqGv8qpX9soFBNmycnKd0JQmE+mdK/SJO
	h8Ym1s4pQykKnb84Lw9Eo5s=
X-Google-Smtp-Source: APXvYqyzZPDX3Uu4NzktDqFqwTR/nQAZDwzaGgRYe/BGfRgObQblnuMlSnB7iHKIGO9InSfRE+wlxA==
X-Received: by 2002:aca:cc83:: with SMTP id c125mr2826202oig.46.1565736842187;
        Tue, 13 Aug 2019 15:54:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:8e5:: with SMTP id d5ls30076oic.9.gmail; Tue, 13
 Aug 2019 15:54:01 -0700 (PDT)
X-Received: by 2002:aca:b485:: with SMTP id d127mr3378840oif.34.1565736841531;
        Tue, 13 Aug 2019 15:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565736841; cv=none;
        d=google.com; s=arc-20160816;
        b=BaJU6nb7vH8c5/7e/osHy5y4AVNmA+glgX86sJIDz4twuyPspbWJJfbxHz+BXyKAfp
         Xie9J+AMCG+USs7qmpvi47xxO3OZv4WMo3OaA8J1TPdOuBQgPpPd8DD9ZPilFrwl7Jep
         +jIs4WnPm+IW10bddNP6aCq+NUBv2ZHPz4Xpx9bKlT2/DWv7XBTLbIBdv+YoGzwiY+Pr
         +DQ7r3GOJzC0xXaNWPoTATc1BYySFAJ18ED9eeL8ULY3rdu7KgIJJFTfwI2W9IHzxyif
         B3Jzekmu68ZdoQE2kOQHmjPh3BugxRfrUH1+yJmwpCeWdKBeD/4/Ju3C9oV/yeKGArqx
         Rhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:from:cc:to:subject:content-transfer-encoding
         :mime-version:references:in-reply-to:user-agent:date:dkim-signature
         :dkim-filter;
        bh=gHZ+pKsyeLDdPeSd3ixr7z7g54/cRMQuzMjn+qCz0So=;
        b=EKTfoOdEgwxsM7Dx4xUo4iCKlj2pDnnsc3vb9MUaGDUvNRZZn5cmWicNogVbAb8I/j
         POmI9bXUV11Q3dAupWLaGIZAUNPVIZ7OKSTCIUm11UV0GX6Rsnwfqs7Jat1spIv7ERV3
         xAKVcf8McVUfqPfwMc8ZS+qqcQ+lWUga3zv/tW61FW5HM8wmX2SKFXhHe59tvyUDNBNH
         a9whgsS4v4XlFnMBvNsZyNa7H6tdfr7gQuK/TcGfcqL+MVgFj0HJaPYTNSuAwI7KTocS
         OVDIQqESsSKHvQT19sD/XlB+6nC1D9Dn+h1cq/ktgofGX10grzgvXvRk/nFJc50jcO4r
         AmWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=CftVUUVV;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com. [198.137.202.136])
        by gmr-mx.google.com with ESMTPS id w3si488540otl.3.2019.08.13.15.54.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 15:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) client-ip=198.137.202.136;
Received: from [IPv6:2601:646:8600:3281:c464:c577:675:3e4] ([IPv6:2601:646:8600:3281:c464:c577:675:3e4])
	(authenticated bits=0)
	by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x7DMrmun1564544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 13 Aug 2019 15:53:52 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x7DMrmun1564544
Date: Tue, 13 Aug 2019 15:53:39 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de> <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de> <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com> <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if available
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
CC: Ingo Molnar <mingo@redhat.com>
From: hpa@zytor.com
Message-ID: <3D1CA272-5511-4082-9548-050ED4A0543E@zytor.com>
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@zytor.com header.s=2019071901 header.b=CftVUUVV;       spf=pass
 (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted
 sender) smtp.mailfrom=hpa@zytor.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=zytor.com
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

On August 13, 2019 4:04:34 AM PDT, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>On 13.08.19 11:32, hpa@zytor.com wrote:
>> On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer
><ralf.ramsauer@oth-regensburg.de> wrote:
>>> ACPI tables aren't available if Linux runs as guest of the
>hypervisor
>>> Jailhouse. This makes the 8250 driver probe for all platform UARTs
>as
>>> it assumes that all platform are present in case of !ACPI. Jailhouse
>>> will stop execution of Linux guest due to port access violation.
>>>
>>> So far, these access violations could be solved by tuning the
>>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only
>map
>>> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
>>> 0x2f8, 0x3e8, 0x2e8.
>>>
>>> Beginning from setup_data version 2, Jailhouse will place
>information
>>> of
>>> available platform UARTs in setup_data. This allows for selective
>>> activation of platform UARTs.
>>>
>>> This patch queries the setup_data version and activates only
>available
>>> UARTS. It comes with backward compatibility, and will still support
>>> older setup_data versions. In this case, Linux falls back to the old
>>> behaviour.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>> arch/x86/include/uapi/asm/bootparam.h |  3 ++
>>> arch/x86/kernel/jailhouse.c           | 75
>++++++++++++++++++++++++---
>>> 2 files changed, 72 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>>> b/arch/x86/include/uapi/asm/bootparam.h
>>> index 6163b1afa7b3..2244c493c3c5 100644
>>> --- a/arch/x86/include/uapi/asm/bootparam.h
>>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>>> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>>> 		__u8	standard_ioapic;
>>> 		__u8	cpu_ids[255];
>>> 	} __attribute__((packed)) v1;
>>> +	struct {
>>> +		__u32	flags;
>>> +	} __attribute__((packed)) v2;
>>> } __attribute__((packed));
>>>
>>> /* The so-called "zeropage" */
>>> diff --git a/arch/x86/kernel/jailhouse.c
>b/arch/x86/kernel/jailhouse.c
>>> index e5ac35efc4b3..1c75de1496f3 100644
>>> --- a/arch/x86/kernel/jailhouse.c
>>> +++ b/arch/x86/kernel/jailhouse.c
>>> @@ -11,6 +11,7 @@
>>> #include <linux/acpi_pmtmr.h>
>>> #include <linux/kernel.h>
>>> #include <linux/reboot.h>
>>> +#include <linux/serial_8250.h>
>>> #include <asm/apic.h>
>>> #include <asm/cpu.h>
>>> #include <asm/hypervisor.h>
>>> @@ -20,8 +21,13 @@
>>> #include <asm/reboot.h>
>>> #include <asm/setup.h>
>>>
>>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>>> +
>>> static __initdata struct jailhouse_setup_data setup_data;
>>> #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>>> sizeof(setup_data.v1))
>>> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN +
>sizeof(setup_data.v2))
>>>
>>> static unsigned int precalibrated_tsc_khz;
>>>
>>> @@ -78,11 +84,13 @@ static void __init
>>> jailhouse_get_smp_config(unsigned int early)
>>> 		.type = IOAPIC_DOMAIN_STRICT,
>>> 		.ops = &mp_ioapic_irqdomain_ops,
>>> 	};
>>> +#ifdef CONFIG_SERIAL_8250
>>> 	struct mpc_intsrc mp_irq = {
>>> 		.type = MP_INTSRC,
>>> 		.irqtype = mp_INT,
>>> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>> 	};
>>> +#endif
>>> 	unsigned int cpu;
>>>
>>> 	jailhouse_x2apic_init();
>>> @@ -99,12 +107,16 @@ static void __init
>>> jailhouse_get_smp_config(unsigned int early)
>>> 	if (setup_data.v1.standard_ioapic) {
>>> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>>
>>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>> -		mp_save_irq(&mp_irq);
>>> +#ifdef CONFIG_SERIAL_8250
>>> +		if (setup_data.hdr.version < 2) {
>>> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>> +			mp_save_irq(&mp_irq);
>>>
>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>> -		mp_save_irq(&mp_irq);
>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>> +			mp_save_irq(&mp_irq);
>>> +		}
>>> +#endif
>>> 	}
>>> }
>>>
>>> @@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
>>> 	return 0;
>>> }
>>>
>>> +#ifdef CONFIG_SERIAL_8250
>>> +static const u16 pcuart_base[] = {
>>> +	0x3f8,
>>> +	0x2f8,
>>> +	0x3e8,
>>> +	0x2e8,
>>> +};
>>> +
>>> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
>>> +				   u32 *capabilites)
>>> +{
>>> +	struct mpc_intsrc mp_irq = {
>>> +		.type = MP_INTSRC,
>>> +		.irqtype = mp_INT,
>>> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>> +	};
>>> +	unsigned int n;
>>> +
>>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>>> +		if (pcuart_base[n] != up->iobase)
>>> +			continue;
>>> +
>>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
>>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>>> +				up->iobase);
>>> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>>> +			mp_save_irq(&mp_irq);
>>> +		} else {
>>> +			/* Deactivate UART if access isn't allowed */
>>> +			up->iobase = 0;
>>> +		}
>>> +		break;
>>> +	}
>>> +}
>>> +#endif
>>> +
>>> static void __init jailhouse_init_platform(void)
>>> {
>>> 	u64 pa_data = boot_params.hdr.setup_data;
>>> @@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
>>> 	if (setup_data.hdr.version == 0 ||
>>> 	    setup_data.hdr.compatible_version !=
>>> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>>> -	    (setup_data.hdr.version >= 1 && header.len <
>SETUP_DATA_V1_LEN))
>>> +	    (setup_data.hdr.version == 1 && header.len <
>SETUP_DATA_V1_LEN)
>>> ||
>>> +	    (setup_data.hdr.version >= 2 && header.len <
>SETUP_DATA_V2_LEN))
>>> 		goto unsupported;
>>>
>>> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>>> @@ -202,6 +251,20 @@ static void __init
>jailhouse_init_platform(void)
>>> 	 * are none in a non-root cell.
>>> 	 */
>>> 	disable_acpi();
>>> +
>>> +#ifdef CONFIG_SERIAL_8250
>>> +	/*
>>> +	 * There are flags inside setup_data that indicate availability of
>>> +	 * platform UARTs since setup data version 2.
>>> +	 *
>>> +	 * In case of version 1, we don't know which UARTs belong Linux.
>In
>>> +	 * this case, unconditionally register 1:1 mapping for legacy UART
>>> IRQs
>>> +	 * 3 and 4.
>>> +	 */
>>> +	if (setup_data.hdr.version > 1)
>>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>>> +#endif
>>> +
>>> 	return;
>>>
>>> unsupported:
>> 
>> Or you could, you know, pass a data structure that already does
>this... it's called DSDT.
>> 
>
>At least by the time the boot process for Linux under Jailhouse was
>designed 
>(~2015), ACPI was not able to express the minimal hardware we are
>exposing. So 
>we went for "CONFIG_ACPI disabled", and that was rather simple.
>
>There are some new knobs now to get rid of legacy platform components.
>But, 
>e.g., is it ACPI-compliant to expose a PM_TMR block, but nothing else?
>How would 
>you communicate pre-calibrated TSC and APIC frequencies?
>
>Thanks,
>Jan

If ACPI cannot represent something important, I'd like to bring that to the attention of the ACPI committee so we can standardize whatever is missing.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3D1CA272-5511-4082-9548-050ED4A0543E%40zytor.com.
