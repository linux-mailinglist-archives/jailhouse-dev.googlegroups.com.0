Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBWW35PVAKGQEC73BWBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe39.google.com (mail-vs1-xe39.google.com [IPv6:2607:f8b0:4864:20::e39])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F394D2F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 20:43:39 +0200 (CEST)
Received: by mail-vs1-xe39.google.com with SMTP id a20sf1147382vso.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 11:43:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566240219; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZU5UNEGxt66de8UAxMo0UoH9oa3el1kzIvilhnhtFiq2LxSwSBOrjeZhVOFtFqq6QF
         hJSSJVAFW00KAonQXMxru2Nz1IVOx7yetWxfKAb3PBzTdX7Gz2q2LmUlsXukEpblX+MS
         yMctB+xfJDFn6du2vNiY1yQ4eTymTkcjJd+TQZS1Uq+k6P5fSEb7IpRy6ywr0MbQYKRe
         lCRZnc9KGF9wh1Azn9YWXMs1LEtPxojiNzDvXAzPr0xMRWaGyP8n4InLiMTirFbvJzB+
         YFayhk7he03ThA3lsKl1OmpEvEYfYTi1gJhYAon1aXJ9HHFqFdO2unJFw2+Tluuh3UBr
         ucFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:from:cc:to:subject
         :mime-version:references:in-reply-to:user-agent:date:dkim-filter
         :sender:dkim-signature;
        bh=qGYBWKgmrmkIbOGwuf1F3kYwCNUJfBEILUhnAkxBVOk=;
        b=nCBpCHQOJn+uA/Bjtwt/F5UP0kGpdBIfX2GPWHChWCrTCpptjStAeQsA94DP2/SKRw
         Ut9839NKUSUkWchRULnGpyAVbeBbLY40yXyuU4gkSTrDCY2aRFbl5Im87Y5Eovma8SaS
         Of5YChFPoyYDECIl5eDPAUse9S9Wf7wN+XFmZnZdQ46A1pO3Nm+xV7WaKmaFBxmS8D60
         ZR32c9FwO4R1rNNVuDF9nX/uFYx0crpkYsO1f7HqZf3oPafic1cPyjgRhDcVcBoVZ8bL
         gp0iyOxtPmmndqlmhnL9a7MowDhbpSpajp3RXPgnP2JI3B6uQNCOckzT34NUXF9nFufd
         qVzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=WznIdorO;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:dkim-filter:date:user-agent:in-reply-to:references
         :mime-version:subject:to:cc:from:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qGYBWKgmrmkIbOGwuf1F3kYwCNUJfBEILUhnAkxBVOk=;
        b=Gq5P6W2ba5i6mMwcb8jnZMEogR9kl/8du7uDdguKpxj4Mrx4P2Hbafd8YI8zYjSaC5
         MGRKTzRHXSzCGcU9v+1oOFUP0OLKT9IyYuHy1Z7Ljyck4XmeYz268iwqATs70lCJNskV
         ygjIGie+sYO9/467WLOsBHndPFZoe6flMZMc0UQLgKqUqf7vp8wW404gF4RXE8D/IRQm
         jFAUk+rv85luQ4xoidogHewT7OKcebsHb1UAn0NwmLMjd0hqreAz1mNWTKbEGnedK16+
         okR742sQ8zLE8pYAUwAPQTMZueuQXmX1VCdzRSKPV0+LmDFskeyNXyDOq+/YxcNQk9JP
         3bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:dkim-filter:date:user-agent:in-reply-to
         :references:mime-version:subject:to:cc:from:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qGYBWKgmrmkIbOGwuf1F3kYwCNUJfBEILUhnAkxBVOk=;
        b=EXqnNhlC5b9dCUah6JzXDppxnQ00MYd4p0CY3IaD/y7pcwWR5bx7pljSIfcbnQTjnV
         xiPW4d/eRc1SurJh6aofhvqus9k4McyDXDR8rmmk6uq/9R8qgg1i4bESJbgGqNgl9ZrZ
         nvCq/qZ0vUyOq0pDX1Qa+Fph2xd1IMjNrDrWNsm5WkOOmu0sBUyiOjLWMywi0Bv4DTXI
         p2wmIcqXC7nwjZwM/W1et3+Inhtv3ggLeyu1nxBsWJ5LL6C4/ez8K/aiCgElJaT9TdgL
         XRJ/YlqHwumfOxUHEtiyPCV8BZWuKwH3zlZwc7/T0jwedDb4JtcU4vyQAOqTo6C7b7xl
         rQdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXCmkLfR7kYH0VkrBwbYYSXx8j2suJILCLgxvGb6mTR+x3KP9Zy
	vdruTNLwXTFXHAJHeg+Rthw=
X-Google-Smtp-Source: APXvYqycfmWq7SybKuGzAxNOggigHJoOfbopCv2jL+0mQiz+UZBh+6NoDkOlu83a2GrEnWjCJwf2nA==
X-Received: by 2002:a67:bc7:: with SMTP id 190mr14664553vsl.6.1566240218886;
        Mon, 19 Aug 2019 11:43:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:17c1:: with SMTP id 184ls158855vkx.3.gmail; Mon, 19 Aug
 2019 11:43:38 -0700 (PDT)
X-Received: by 2002:a1f:e586:: with SMTP id c128mr4488819vkh.44.1566240218428;
        Mon, 19 Aug 2019 11:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566240218; cv=none;
        d=google.com; s=arc-20160816;
        b=V6LgggME7ppGzo8V3YqAXVdOoPeVSdut5vRFP9yIeNdPETfwBpN9dkM5zDSNcOugVx
         wpiA+75DxhMeswcArT+6O9+ND95c4fKXdLwP+cCPgvgzcnKgDrP/8rohmVWr7HGnOn0F
         MABka6NNgG3m1f17uIEL7QEVW9N/w0EzvWtef7ekh+hviCLt/i7OmAtS/qNs/gMZfXXl
         4HVHYnk/og80QiMTktV9wWZG2xFoDSBOkrhLppR6PkuFg+WlCevYveeFmvmRRl/+Yane
         Xp2qDRB0Qi2JFs2WdQxyAMo+xykVMiZpX2qAxFomry2+1yyVF2O5I4EQJRZtkziRwLKD
         CRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:from:cc:to:subject:content-transfer-encoding
         :mime-version:references:in-reply-to:user-agent:date:dkim-signature
         :dkim-filter;
        bh=s421riU2a/o9Q/+Dvi2Ylv2eIKt+A1DsWbfIbe2UYo0=;
        b=nKaAjrAvQ3+ALarygj3MklMFpDfkqTK7p3Ic+KCvgZzslkZDrTQ0w93nt1TrdcVS7/
         CL+2dUJ+JG/YPF2uVTqB4jWUqzfnaFQB7IlHQAQjMCzlg6Fw+hNgZDiKFuZMG435bEwZ
         NnlcL9u1vEaJdJgoVkVa25ZzZNNcdOm2KAEiEogcDA2QS3pjcjNtfRGX2u8VRcsm9I3B
         T0lKhIQRNxc4Zu6kM4ifUflSC843jLcpJWJ8xALUmg9puW/Jtrb40JbvlplQzZYCkKWb
         VFsNzGM8EFXzliTh+V2WInbMvVYN7lLINLKQp94ECNQDrr1FHVPF/yTc4hkdijAg1pFK
         d+6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=WznIdorO;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com. [198.137.202.136])
        by gmr-mx.google.com with ESMTPS id v22si789428vsm.0.2019.08.19.11.43.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 11:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) client-ip=198.137.202.136;
Received: from [IPv6:2601:646:8600:3281:49e:1f7d:24c9:c878] ([IPv6:2601:646:8600:3281:49e:1f7d:24c9:c878])
	(authenticated bits=0)
	by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x7JIhNh1055622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 19 Aug 2019 11:43:30 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x7JIhNh1055622
Date: Mon, 19 Aug 2019 11:43:14 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <c106ddb4-809e-0ae9-df02-2e5b22f23b03@oth-regensburg.de>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de> <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de> <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com> <34984d28-78cf-210a-9bbb-b00d50bee7e1@siemens.com> <3D1CA272-5511-4082-9548-050ED4A0543E@zytor.com> <c106ddb4-809e-0ae9-df02-2e5b22f23b03@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
CC: Ingo Molnar <mingo@redhat.com>
From: hpa@zytor.com
Message-ID: <5F992CC8-90A5-46B4-9E78-72F9CA82232F@zytor.com>
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@zytor.com header.s=2019071901 header.b=WznIdorO;       spf=pass
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

On August 19, 2019 10:22:07 AM PDT, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> wrote:
>On 8/14/19 12:53 AM, hpa@zytor.com wrote:
>> On August 13, 2019 4:04:34 AM PDT, Jan Kiszka
><jan.kiszka@siemens.com> wrote:
>>> On 13.08.19 11:32, hpa@zytor.com wrote:
>>>> On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer
>>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>>> ACPI tables aren't available if Linux runs as guest of the
>>> hypervisor
>>>>> Jailhouse. This makes the 8250 driver probe for all platform UARTs
>>> as
>>>>> it assumes that all platform are present in case of !ACPI.
>Jailhouse
>>>>> will stop execution of Linux guest due to port access violation.
>>>>>
>>>>> So far, these access violations could be solved by tuning the
>>>>> 8250.nr_uarts parameter but it has limitations: We can, e.g., only
>>> map
>>>>> consecutive platform UARTs to Linux, and only in the sequence
>0x3f8,
>>>>> 0x2f8, 0x3e8, 0x2e8.
>>>>>
>>>>> Beginning from setup_data version 2, Jailhouse will place
>>> information
>>>>> of
>>>>> available platform UARTs in setup_data. This allows for selective
>>>>> activation of platform UARTs.
>>>>>
>>>>> This patch queries the setup_data version and activates only
>>> available
>>>>> UARTS. It comes with backward compatibility, and will still
>support
>>>>> older setup_data versions. In this case, Linux falls back to the
>old
>>>>> behaviour.
>>>>>
>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>> ---
>>>>> arch/x86/include/uapi/asm/bootparam.h |  3 ++
>>>>> arch/x86/kernel/jailhouse.c           | 75
>>> ++++++++++++++++++++++++---
>>>>> 2 files changed, 72 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/include/uapi/asm/bootparam.h
>>>>> b/arch/x86/include/uapi/asm/bootparam.h
>>>>> index 6163b1afa7b3..2244c493c3c5 100644
>>>>> --- a/arch/x86/include/uapi/asm/bootparam.h
>>>>> +++ b/arch/x86/include/uapi/asm/bootparam.h
>>>>> @@ -150,6 +150,9 @@ struct jailhouse_setup_data {
>>>>> 		__u8	standard_ioapic;
>>>>> 		__u8	cpu_ids[255];
>>>>> 	} __attribute__((packed)) v1;
>>>>> +	struct {
>>>>> +		__u32	flags;
>>>>> +	} __attribute__((packed)) v2;
>>>>> } __attribute__((packed));
>>>>>
>>>>> /* The so-called "zeropage" */
>>>>> diff --git a/arch/x86/kernel/jailhouse.c
>>> b/arch/x86/kernel/jailhouse.c
>>>>> index e5ac35efc4b3..1c75de1496f3 100644
>>>>> --- a/arch/x86/kernel/jailhouse.c
>>>>> +++ b/arch/x86/kernel/jailhouse.c
>>>>> @@ -11,6 +11,7 @@
>>>>> #include <linux/acpi_pmtmr.h>
>>>>> #include <linux/kernel.h>
>>>>> #include <linux/reboot.h>
>>>>> +#include <linux/serial_8250.h>
>>>>> #include <asm/apic.h>
>>>>> #include <asm/cpu.h>
>>>>> #include <asm/hypervisor.h>
>>>>> @@ -20,8 +21,13 @@
>>>>> #include <asm/reboot.h>
>>>>> #include <asm/setup.h>
>>>>>
>>>>> +#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>>>>> +#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>>>>> +	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>>>>> +
>>>>> static __initdata struct jailhouse_setup_data setup_data;
>>>>> #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>>>>> sizeof(setup_data.v1))
>>>>> +#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN +
>>> sizeof(setup_data.v2))
>>>>>
>>>>> static unsigned int precalibrated_tsc_khz;
>>>>>
>>>>> @@ -78,11 +84,13 @@ static void __init
>>>>> jailhouse_get_smp_config(unsigned int early)
>>>>> 		.type = IOAPIC_DOMAIN_STRICT,
>>>>> 		.ops = &mp_ioapic_irqdomain_ops,
>>>>> 	};
>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>> 	struct mpc_intsrc mp_irq = {
>>>>> 		.type = MP_INTSRC,
>>>>> 		.irqtype = mp_INT,
>>>>> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>>> 	};
>>>>> +#endif
>>>>> 	unsigned int cpu;
>>>>>
>>>>> 	jailhouse_x2apic_init();
>>>>> @@ -99,12 +107,16 @@ static void __init
>>>>> jailhouse_get_smp_config(unsigned int early)
>>>>> 	if (setup_data.v1.standard_ioapic) {
>>>>> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
>>>>>
>>>>> -		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>>> -		mp_save_irq(&mp_irq);
>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>> +		if (setup_data.hdr.version < 2) {
>>>>> +			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>>>>> +			mp_save_irq(&mp_irq);
>>>>>
>>>>> -		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>>> -		mp_save_irq(&mp_irq);
>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>>>>> +			mp_save_irq(&mp_irq);
>>>>> +		}
>>>>> +#endif
>>>>> 	}
>>>>> }
>>>>>
>>>>> @@ -137,6 +149,42 @@ static int __init
>jailhouse_pci_arch_init(void)
>>>>> 	return 0;
>>>>> }
>>>>>
>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>> +static const u16 pcuart_base[] = {
>>>>> +	0x3f8,
>>>>> +	0x2f8,
>>>>> +	0x3e8,
>>>>> +	0x2e8,
>>>>> +};
>>>>> +
>>>>> +static void jailhouse_serial_fixup(int port, struct uart_port
>*up,
>>>>> +				   u32 *capabilites)
>>>>> +{
>>>>> +	struct mpc_intsrc mp_irq = {
>>>>> +		.type = MP_INTSRC,
>>>>> +		.irqtype = mp_INT,
>>>>> +		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>>>>> +	};
>>>>> +	unsigned int n;
>>>>> +
>>>>> +	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>>>>> +		if (pcuart_base[n] != up->iobase)
>>>>> +			continue;
>>>>> +
>>>>> +		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
>>>>> +			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>>>>> +				up->iobase);
>>>>> +			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>>>>> +			mp_save_irq(&mp_irq);
>>>>> +		} else {
>>>>> +			/* Deactivate UART if access isn't allowed */
>>>>> +			up->iobase = 0;
>>>>> +		}
>>>>> +		break;
>>>>> +	}
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>> static void __init jailhouse_init_platform(void)
>>>>> {
>>>>> 	u64 pa_data = boot_params.hdr.setup_data;
>>>>> @@ -186,7 +234,8 @@ static void __init
>jailhouse_init_platform(void)
>>>>> 	if (setup_data.hdr.version == 0 ||
>>>>> 	    setup_data.hdr.compatible_version !=
>>>>> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>>>>> -	    (setup_data.hdr.version >= 1 && header.len <
>>> SETUP_DATA_V1_LEN))
>>>>> +	    (setup_data.hdr.version == 1 && header.len <
>>> SETUP_DATA_V1_LEN)
>>>>> ||
>>>>> +	    (setup_data.hdr.version >= 2 && header.len <
>>> SETUP_DATA_V2_LEN))
>>>>> 		goto unsupported;
>>>>>
>>>>> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>>>>> @@ -202,6 +251,20 @@ static void __init
>>> jailhouse_init_platform(void)
>>>>> 	 * are none in a non-root cell.
>>>>> 	 */
>>>>> 	disable_acpi();
>>>>> +
>>>>> +#ifdef CONFIG_SERIAL_8250
>>>>> +	/*
>>>>> +	 * There are flags inside setup_data that indicate availability
>of
>>>>> +	 * platform UARTs since setup data version 2.
>>>>> +	 *
>>>>> +	 * In case of version 1, we don't know which UARTs belong Linux.
>>> In
>>>>> +	 * this case, unconditionally register 1:1 mapping for legacy
>UART
>>>>> IRQs
>>>>> +	 * 3 and 4.
>>>>> +	 */
>>>>> +	if (setup_data.hdr.version > 1)
>>>>> +		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>>>>> +#endif
>>>>> +
>>>>> 	return;
>>>>>
>>>>> unsupported:
>>>>
>>>> Or you could, you know, pass a data structure that already does
>>> this... it's called DSDT.
>>>>
>>>
>>> At least by the time the boot process for Linux under Jailhouse was
>>> designed 
>>> (~2015), ACPI was not able to express the minimal hardware we are
>>> exposing. So 
>>> we went for "CONFIG_ACPI disabled", and that was rather simple.
>>>
>>> There are some new knobs now to get rid of legacy platform
>components.
>>> But, 
>>> e.g., is it ACPI-compliant to expose a PM_TMR block, but nothing
>else?
>>> How would 
>>> you communicate pre-calibrated TSC and APIC frequencies?
>>>
>>> Thanks,
>>> Jan
>> 
>> If ACPI cannot represent something important, I'd like to bring that
>to the attention of the ACPI committee so we can standardize whatever
>is missing.
>
>In an offlist discussion, Jan and I agreed that DSDTs should definitely
>be considered and evaluated in the long run, but for the moment - and
>for what I actually want to achieve with this patch - this should do
>the
>job.
>
>I will send a v3 and address Jan's remarks on patch 1/2.
>
>Thanks
>  Ralf

The request still remains, though: *please* contact me if there are things we need to be able to express in ACPI and can't.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5F992CC8-90A5-46B4-9E78-72F9CA82232F%40zytor.com.
