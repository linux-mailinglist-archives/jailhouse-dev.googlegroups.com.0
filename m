Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQNV5PVAKGQEUWC6HFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5694B8C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 19:22:10 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id r21sf2486419edc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 10:22:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566235330; cv=pass;
        d=google.com; s=arc-20160816;
        b=O/NqMDn4C6HO+Hpu+NdS3a3H+oGLnlS6STHDFU0MWBTdvbTlQug8feJat+0Nmy4Gcu
         xEdIqxuv9XcKTFS+H3v9jXYrFO+OmAy1Cg8aT119zVo1iW9H+OtgoZEvb6d10csLHCSy
         cUN0OmPXkrw6+e2ZtqhBH5R4kEk72uVIK77hEiiu4fOCO3Y2HqJOGU20LHb0BTy1ROFc
         Y9zuTqscFdBf+x/7g7/iOP1ut2EAWGIIe9u1bNdrbZqU3uIIvK0aTIyUmlYh43taWPgj
         9tkaKoNfeYmvioMYJPZQSrUfdwyU4FiAFKzmeCifFTZ4TLV6uRDmO4fWWUA3X/Gv+jhi
         hIPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:subject:autocrypt:openpgp
         :from:references:cc:to:sender:dkim-signature;
        bh=AYu7f7lSsIH/3pVu20yiMxoLVhoTxIkD/3been65pmw=;
        b=wnVZVGGNrTkqhBceqphpD72gSewJOaRoFoUoSJlV9ay+vpAM3mOaeqHPeH0dRV/tI/
         uVGuNJ1MIyrLys1HTraqORRmY7SnRP/XfJOHopwNFopm1PAOScLRBK5mKB8t6V3a/2Go
         45MBUK3pCwMvn/tJ4YtQ//EqfwIp6q2zp1ZvlFcxVdJOG9jxTAYIiIWxyi1UAQ/S5Kz5
         5aRhwRvzzWPdybBRWFJFc99fFNMtNaVLqTF3t0sBabE1jA3LIKSUmKbOFJoe2c4uiJ4c
         aszbQhXe1lHOEhDOyNWO0yJ7i2BRQRVyrLXoR+4vt5qb3kwy8/CdadFkGAzyFIUqmmMc
         6zEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=diFkpIIT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:openpgp:autocrypt:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AYu7f7lSsIH/3pVu20yiMxoLVhoTxIkD/3been65pmw=;
        b=qDmzAQaLe/XO/4o6Fg7RpifMuX+qztsb7Cip2je1zpuI3XeI8UKfmAMzN9zSJHIG/g
         rH5B67XXIY5H+pK5w3HvWDwFdd+jtR95kg1oS7IovmDQoZesebOezMo+mNXgZnSNzY4y
         plikRdah1EU1j2DQt69q9b1XPRVfMpzkqzjGRKhcpFK0rcJzkSN7LfY4zVZJ0xWSACmu
         /jTMOKviqOdh0FHzuDHVu01o6VFpAan/+PCsrTMsAm2Voz2CfvIfLPQRa2sKAhh4q0MD
         l3uEzdEzQ7u0lMSgzdfQDUAcbU/U4nsgTIgEp8SOwyb+KISREtDy+ut+hRB+2awYsOBU
         Huaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AYu7f7lSsIH/3pVu20yiMxoLVhoTxIkD/3been65pmw=;
        b=XmmL7tNfsENVs5+/w3cQ0B+p55hD6ukqF1w1HHhj7L+nIVgfj4loy4KLUK1y9Akedb
         l5zEDBD2S3EZmP0g1E0MgCwW5PXESM+Nr9C15xBFx/QpDwyJNcAAviZ7yGWPyUNejGTt
         oCg7Ht7NpM5a96z+7ArDo4RQuJBtSNVu4+DRk0vfkksEl1LrzmWKa6OE0BKiobnG4+U4
         7/pgQHf1/3mrmyquMfedn2ylLKGzkrxUlVWx/pAWJ1Y0TyrisPD4WfUl/llF8rXP9jvQ
         eSgbjzhD/B+OhWmfEgz9f1B0ZU//t09+Eklwz+c3n8DhJkLvLa4IF2rtrzHFZ7BZHFwO
         lwIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVE9X5pzEXHwUiwS6b2H620nmG1/zeQrSKZTDVCFRDMPZW775hX
	1tKdG4tCr8luh+5z0aLXmns=
X-Google-Smtp-Source: APXvYqwkvDU5gvBigwN50/azT8us1HkuaEr4PSYf+/A5B8mAkEU500AKoWY+y8HPJQ03dy9VQoBvfA==
X-Received: by 2002:a17:906:b283:: with SMTP id q3mr22214000ejz.153.1566235329901;
        Mon, 19 Aug 2019 10:22:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:19d2:: with SMTP id h18ls1894952ejd.8.gmail; Mon, 19
 Aug 2019 10:22:09 -0700 (PDT)
X-Received: by 2002:a17:906:2ac3:: with SMTP id m3mr19302425eje.212.1566235329406;
        Mon, 19 Aug 2019 10:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566235329; cv=none;
        d=google.com; s=arc-20160816;
        b=CXFWRcWaaLUUi3CtVRxQoZjm2PvNbJOJsm+HU6W7MS3TPfnRLD1RGGbjrBcEqflpzu
         M189KzfCPUvOSuY+PZXchs8X6xjhLzrt3XZvRUg5aaxVAmdCVZSYph3WscukdjjEPf85
         nRpJ2ouxRR4LPXMiEN0hVuGSfciH2DOByLSvjMb7MyF3SRWgbxweXKzvPho+qL7Q9agX
         KdDWehLA67jjO2hRXBh+zEdMIJCCzAqUKJn6PNVD2hS5tHOMxBSpBZFcXCWImpaGm8pG
         sxfkNuq0t5lE8Dz9eV4t4EchkEElNi7YtdgKh1ixoCnL5cXvLyZzvSx45RCGyLCosF9i
         ITug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:cc:to:dkim-signature;
        bh=HpPiIn3Tpm7LYaB0fCvclpEUtRGrmqI76YFwt2Qehwc=;
        b=p9H1B0RIpLSHLfFHXuNNTOcqveCI7nOdH7JNt+vO9aRmOM5bxarVU32e9APEXX7EU1
         GodAXpo/8V1sjoz2kO/3EiTGNV8iVapL0E3IqkXN+Pj92JRqNKZkj5l9mKj5WTd8zRx7
         7x/vGJH+5JmeEn7y/vBUmxkffWt5f8nZYEOx3Ryr/NxC/lOAbLfKGOn43V/4hfLDhlM5
         /7Ku7JUl8g5QWEzSvpvxKHrwmrR8a+q7YXwYBVDwKnWuXom+mQTpu948gEHSPh+mBqTp
         Lss47xYh/XnuIZZLIeg4TtRrIUuL0VWki+7yB/SM1h/t+jRngCLhOjbApZ+4ovZbmfDO
         9DXg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=diFkpIIT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id s30si726670eda.4.2019.08.19.10.22.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 10:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46C12863RBzy31;
	Mon, 19 Aug 2019 19:22:08 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 19 Aug
 2019 19:22:08 +0200
To: <hpa@zytor.com>, Jan Kiszka <jan.kiszka@siemens.com>, Thomas Gleixner
	<tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<jailhouse-dev@googlegroups.com>
CC: Ingo Molnar <mingo@redhat.com>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
 <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
 <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com>
 <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com>
 <3D1CA272-5511-4082-9548-050ED4A0543E@zytor.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if
 available
Message-ID: <c106ddb4-809e-0ae9-df02-2e5b22f23b03@oth-regensburg.de>
Date: Mon, 19 Aug 2019 19:22:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3D1CA272-5511-4082-9548-050ED4A0543E@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=diFkpIIT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 8/14/19 12:53 AM, hpa@zytor.com wrote:
> On August 13, 2019 4:04:34 AM PDT, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> On 13.08.19 11:32, hpa@zytor.com wrote:
>>> On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer
>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>> ACPI tables aren't available if Linux runs as guest of the
>> hypervisor
>>>> Jailhouse. This makes the 8250 driver probe for all platform UARTs
>> as
>>>> it assumes that all platform are present in case of !ACPI. Jailhouse
>>>> will stop execution of Linux guest due to port access violation.
>>>>
>>>> So far, these access violations could be solved by tuning the
>>>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only
>> map
>>>> consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
>>>> 0x2f8, 0x3e8, 0x2e8.
>>>>
>>>> Beginning from setup_data version 2, Jailhouse will place
>> information
>>>> of
>>>> available platform UARTs in setup_data. This allows for selective
>>>> activation of platform UARTs.
>>>>
>>>> This patch queries the setup_data version and activates only
>> available
>>>> UARTS. It comes with backward compatibility, and will still support
>>>> older setup_data versions. In this case, Linux falls back to the old
>>>> behaviour.
>>>>
>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>> ---
>>>> arch/x86/include/uapi/asm/bootparam.h |  3 ++
>>>> arch/x86/kernel/jailhouse.c           | 75
>> ++++++++++++++++++++++++---
>>>> 2 files changed, 72 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>>>> b/arch/x86/include/uapi/asm/bootparam.h
>>>> index 6163b1afa7b3..2244c493c3c5 100644
>>>> --- a/arch/x86/include/uapi/asm/bootparam.h
>>>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>>>> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>>>> 		__u8	standard_ioapic;
>>>> 		__u8	cpu_ids[255];
>>>> 	} __attribute__((packed)) v1;
>>>> +	struct {
>>>> +		__u32	flags;
>>>> +	} __attribute__((packed)) v2;
>>>> } __attribute__((packed));
>>>>
>>>> /* The so-called "zeropage" */
>>>> diff --git a/arch/x86/kernel/jailhouse.c
>> b/arch/x86/kernel/jailhouse.c
>>>> index e5ac35efc4b3..1c75de1496f3 100644
>>>> --- a/arch/x86/kernel/jailhouse.c
>>>> +++ b/arch/x86/kernel/jailhouse.c
>>>> @@ -11,6 +11,7 @@
>>>> #include <linux/acpi_pmtmr.h>
>>>> #include <linux/kernel.h>
>>>> #include <linux/reboot.h>
>>>> +#include <linux/serial_8250.h>
>>>> #include <asm/apic.h>
>>>> #include <asm/cpu.h>
>>>> #include <asm/hypervisor.h>
>>>> @@ -20,8 +21,13 @@
>>>> #include <asm/reboot.h>
>>>> #include <asm/setup.h>
>>>>
>>>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>>>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>>>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>>>> +
>>>> static __initdata struct jailhouse_setup_data setup_data;
>>>> #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>>>> sizeof(setup_data.v1))
>>>> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN +
>> sizeof(setup_data.v2))
>>>>
>>>> static unsigned int precalibrated_tsc_khz;
>>>>
>>>> @@ -78,11 +84,13 @@ static void __init
>>>> jailhouse_get_smp_config(unsigned int early)
>>>> 		.type = IOAPIC_DOMAIN_STRICT,
>>>> 		.ops = &mp_ioapic_irqdomain_ops,
>>>> 	};
>>>> +#ifdef CONFIG_SERIAL_8250
>>>> 	struct mpc_intsrc mp_irq = {
>>>> 		.type = MP_INTSRC,
>>>> 		.irqtype = mp_INT,
>>>> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>> 	};
>>>> +#endif
>>>> 	unsigned int cpu;
>>>>
>>>> 	jailhouse_x2apic_init();
>>>> @@ -99,12 +107,16 @@ static void __init
>>>> jailhouse_get_smp_config(unsigned int early)
>>>> 	if (setup_data.v1.standard_ioapic) {
>>>> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>>>
>>>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>> -		mp_save_irq(&mp_irq);
>>>> +#ifdef CONFIG_SERIAL_8250
>>>> +		if (setup_data.hdr.version < 2) {
>>>> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>> +			mp_save_irq(&mp_irq);
>>>>
>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>> -		mp_save_irq(&mp_irq);
>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>> +			mp_save_irq(&mp_irq);
>>>> +		}
>>>> +#endif
>>>> 	}
>>>> }
>>>>
>>>> @@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
>>>> 	return 0;
>>>> }
>>>>
>>>> +#ifdef CONFIG_SERIAL_8250
>>>> +static const u16 pcuart_base[] = {
>>>> +	0x3f8,
>>>> +	0x2f8,
>>>> +	0x3e8,
>>>> +	0x2e8,
>>>> +};
>>>> +
>>>> +static void jailhouse_serial_fixup(int port, struct uart_port *up,
>>>> +				   u32 *capabilites)
>>>> +{
>>>> +	struct mpc_intsrc mp_irq = {
>>>> +		.type = MP_INTSRC,
>>>> +		.irqtype = mp_INT,
>>>> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>> +	};
>>>> +	unsigned int n;
>>>> +
>>>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>>>> +		if (pcuart_base[n] != up->iobase)
>>>> +			continue;
>>>> +
>>>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
>>>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>>>> +				up->iobase);
>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>>>> +			mp_save_irq(&mp_irq);
>>>> +		} else {
>>>> +			/* Deactivate UART if access isn't allowed */
>>>> +			up->iobase = 0;
>>>> +		}
>>>> +		break;
>>>> +	}
>>>> +}
>>>> +#endif
>>>> +
>>>> static void __init jailhouse_init_platform(void)
>>>> {
>>>> 	u64 pa_data = boot_params.hdr.setup_data;
>>>> @@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
>>>> 	if (setup_data.hdr.version == 0 ||
>>>> 	    setup_data.hdr.compatible_version !=
>>>> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>>>> -	    (setup_data.hdr.version >= 1 && header.len <
>> SETUP_DATA_V1_LEN))
>>>> +	    (setup_data.hdr.version == 1 && header.len <
>> SETUP_DATA_V1_LEN)
>>>> ||
>>>> +	    (setup_data.hdr.version >= 2 && header.len <
>> SETUP_DATA_V2_LEN))
>>>> 		goto unsupported;
>>>>
>>>> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>>>> @@ -202,6 +251,20 @@ static void __init
>> jailhouse_init_platform(void)
>>>> 	 * are none in a non-root cell.
>>>> 	 */
>>>> 	disable_acpi();
>>>> +
>>>> +#ifdef CONFIG_SERIAL_8250
>>>> +	/*
>>>> +	 * There are flags inside setup_data that indicate availability of
>>>> +	 * platform UARTs since setup data version 2.
>>>> +	 *
>>>> +	 * In case of version 1, we don't know which UARTs belong Linux.
>> In
>>>> +	 * this case, unconditionally register 1:1 mapping for legacy UART
>>>> IRQs
>>>> +	 * 3 and 4.
>>>> +	 */
>>>> +	if (setup_data.hdr.version > 1)
>>>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>>>> +#endif
>>>> +
>>>> 	return;
>>>>
>>>> unsupported:
>>>
>>> Or you could, you know, pass a data structure that already does
>> this... it's called DSDT.
>>>
>>
>> At least by the time the boot process for Linux under Jailhouse was
>> designed 
>> (~2015), ACPI was not able to express the minimal hardware we are
>> exposing. So 
>> we went for "CONFIG_ACPI disabled", and that was rather simple.
>>
>> There are some new knobs now to get rid of legacy platform components.
>> But, 
>> e.g., is it ACPI-compliant to expose a PM_TMR block, but nothing else?
>> How would 
>> you communicate pre-calibrated TSC and APIC frequencies?
>>
>> Thanks,
>> Jan
> 
> If ACPI cannot represent something important, I'd like to bring that to the attention of the ACPI committee so we can standardize whatever is missing.

In an offlist discussion, Jan and I agreed that DSDTs should definitely
be considered and evaluated in the long run, but for the moment - and
for what I actually want to achieve with this patch - this should do the
job.

I will send a v3 and address Jan's remarks on patch 1/2.

Thanks
  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c106ddb4-809e-0ae9-df02-2e5b22f23b03%40oth-regensburg.de.
