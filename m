Return-Path: <jailhouse-dev+bncBCVLJ7OQWEPBBIMHZLVAKGQE6ZD34VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9868B426
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 11:32:19 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id w5sf89916525otg.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 02:32:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565688738; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bt8E89wuOwa8wz+OByBc1yyjg0f5EJAyMVZGvQSRrMlEOvu9r+G1u+hY0mF9vChaXL
         lCI/9KTBko3dSAo8jEeOGxdqWHD7PalFClKu/G69I4WKh2KWdqdvdGBEthq3RsDmE/w7
         prNab804bfwglHLZm7OAU5X223ThG4eZ+ZecPffguWmBLGZ40+w06C5wdaYB7H9S4zNv
         0HBMOX3Ntt91BdoLqTsbtAgxZuSh818BowhVwk1Gc01xFZvWxyXSl/mA5qr3Nfa0R9v4
         6RtHa9vmtlUSeO/6VwrkZI0Fg+oh/m3HJiyIVG4i2UuaxegM68Kuw2xZ7SGU55PFaRc3
         hv5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:from:cc:to:subject
         :mime-version:references:in-reply-to:user-agent:date:dkim-filter
         :sender:dkim-signature;
        bh=OSrZzlhkQEH8X4gqBAmQ1ZPE5o554lNKrnGERxnPE8c=;
        b=WamUFyGZEKNynlfYxCUL7tlEBQ7vj2NV7Y3RG3jGwBtn8f7FzgRWYXB5mhkU+9dIkK
         Ye7w+ZRxfFxvOfpEPyGD6pBTHLj3NEtFc0rPWPKfu5+sd3PdtQ1WPVM/7AdKR69ItA3R
         5+AlZpzUyEjSvaErTkhfCGu6rh25XBgG32iL5yAfW2u8vruFxn49tpN7QwyHfVbYkaiE
         vqyaJvPUbELFlUMDNo6BqlE11qJACRPjUogMTcTraIc1a3cSGYe11YZ6WIkmZnbBi28A
         2hji0+ZEEp69f7+mWaRp5c1SWdhIP9CQQ25YAesknqqtbBr2oeschYJkgVGOa2FHybsj
         v7KA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=KL9nr9+8;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:dkim-filter:date:user-agent:in-reply-to:references
         :mime-version:subject:to:cc:from:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OSrZzlhkQEH8X4gqBAmQ1ZPE5o554lNKrnGERxnPE8c=;
        b=SQy/JbtEfn1K8l++eIh0AdqxTf9F77vz9innsMcNgzevhWDBPcC7Kxi+2kbhG7J+wo
         7nnSEn5/bs1VsZBE4wAtLJl9XRLVvFeOWzY54X4IgOhgsTNIHEF68AnQlh7R3qkvmcYC
         BmbYRcKvNZ1XsVf7jnjPx2TRjhGkoG+HOG6BLHLLvbfMjrOlIufZqkeMzh8CP3dDGLxz
         PcH/fiwpazRnecMBTHgV/paGpWebBpBgOfrQ77vTDk6gYpESWeLGvHsRIIywENExGA25
         GJxJObPuAdE28n/Ye7a5czS5Tl6K6/02VVlwRF8QnnKFViMrrl+IXvXTmpU5z24/DONq
         k+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:dkim-filter:date:user-agent:in-reply-to
         :references:mime-version:subject:to:cc:from:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OSrZzlhkQEH8X4gqBAmQ1ZPE5o554lNKrnGERxnPE8c=;
        b=O7sJ6QkHH7TYgUQXpqT0LMIzPoTzx3ngBhLnLPUrawjxvNmdek4plpNzfRhNp/9u2c
         jiP9Wr0MGvlD+4KccGqva9kRAyDblrrmWcWEb6g4TuZ1D8ATgmpARZitwwgyLsSlD3Zp
         30EIwhNOrqbtnqjJtWIGLZG+ouwfzTAuvbqQpsIoW6Ibj2mJHECsLR5XPmC+eKzyniMz
         NdexXOz4kIR9+taKis7jgKMtgd95W6A68HOrAssfJfn3LDzY1oE2EwS+5jrlr47R9vA2
         pYAsARkoCkTIA4jQtcbcxeGaWTTmbvU2IfS5fxvpAf40bXCmfwSxpzNVDpFAMY6utuXo
         4fFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXfsmrTdb7qGBHWKwzjaIApSzQv9xvJ3jW6uzXEC8ZxkTJfgEcd
	qXxGm/DvozaaqdtqCxTLw80=
X-Google-Smtp-Source: APXvYqytMjPN6/jJmCwdNgUUWRd6STZ8EreTrizm3sGir96UcsdimIYbibJqlwFHxO/XfcFNGxB7pA==
X-Received: by 2002:a6b:f008:: with SMTP id w8mr32530916ioc.60.1565688738005;
        Tue, 13 Aug 2019 02:32:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:9852:: with SMTP id p18ls6513771ios.9.gmail; Tue, 13 Aug
 2019 02:32:17 -0700 (PDT)
X-Received: by 2002:a5e:820a:: with SMTP id l10mr2608572iom.283.1565688737549;
        Tue, 13 Aug 2019 02:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565688737; cv=none;
        d=google.com; s=arc-20160816;
        b=oqVpJtvejgexQmRiEaU9xVP7XwxatRrjTrjAkklCNQMZzJiHVsGnP1hoHfQfWprswu
         jnXv75GqafCVWRQ4psAG5Estreepz4vzqooyBwch0VbAI+KT8C+B69qSZWVPEcp5A/g5
         tw7EHh4Qrl40K51xRdIhxMCiGnDQf83ajvy9xKssuxmHCPAWbXnd/TSPzZ0XxzL64kZI
         lWgQhcaiwXYbgq1MwbdHB5+YCMLcJYUBC/v41D82GZedI8ECl4xxh3NMfFJhQNeuSbdk
         2J/Z0P2tX+no+6vMteH1dTD3uL7bMUFvsamrX/EFHSbqDmlDCNdo7y1ZehPYJGlK/kYX
         DbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:from:cc:to:subject:content-transfer-encoding
         :mime-version:references:in-reply-to:user-agent:date:dkim-signature
         :dkim-filter;
        bh=XO3uubOUvp/Z1sWv1knmDwMEO60S5uxFzI/UvWlKy9U=;
        b=BNvVwhA0VOBWuXUJgDKgztQrPMMkgzBuW2GEIAeltCY+Gg/dtsN4t1+E0KOqhFt/0l
         6PG4ZAmjdQFk33j4zC8T4bBfFZQRCKsalnqPwFtOkgRSZ23huugMKMdOVho6uMsO3X9K
         pCLEtvh/l38Er9WSg+TIeA673/M3VRCCTOiueF22surniCT/oh/1UuOSpMbeoB3MHHwS
         13Zzb9kkiANTP3z5EA+l+b4uiIA6edBQArI+zFV1qj15efWorXg/2yKDb0FgFQ21KC45
         W45M8yIfa7R9C4ldkrnkFT8I4ZXjscQzGEbeo3786STrG7yg7IuwlS/AbG9s97jduxVH
         U6Ug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@zytor.com header.s=2019071901 header.b=KL9nr9+8;
       spf=pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) smtp.mailfrom=hpa@zytor.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=zytor.com
Received: from mail.zytor.com (terminus.zytor.com. [198.137.202.136])
        by gmr-mx.google.com with ESMTPS id q8si605811iot.4.2019.08.13.02.32.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of hpa@zytor.com designates 198.137.202.136 as permitted sender) client-ip=198.137.202.136;
Received: from [IPv6:2601:646:8600:3281:9dd0:96b2:5105:508] ([IPv6:2601:646:8600:3281:9dd0:96b2:5105:508])
	(authenticated bits=0)
	by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x7D9W7Zp1303998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 13 Aug 2019 02:32:11 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x7D9W7Zp1303998
Date: Tue, 13 Aug 2019 02:32:00 -0700
User-Agent: K-9 Mail for Android
In-Reply-To: <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de> <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, jailhouse-dev@googlegroups.com
CC: Ingo Molnar <mingo@redhat.com>
From: hpa@zytor.com
Message-ID: <D0A95275-25B7-4206-82D8-50B2C250F275@zytor.com>
X-Original-Sender: hpa@zytor.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@zytor.com header.s=2019071901 header.b=KL9nr9+8;       spf=pass
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

On August 12, 2019 4:06:50 AM PDT, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de> wrote:
>ACPI tables aren't available if Linux runs as guest of the hypervisor
>Jailhouse. This makes the 8250 driver probe for all platform UARTs as
>it assumes that all platform are present in case of !ACPI. Jailhouse
>will stop execution of Linux guest due to port access violation.
>
>So far, these access violations could be solved by tuning the
>8250.nr_uarts parameter but it has limitations: We can, e.g., only map
>consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
>0x2f8, 0x3e8, 0x2e8.
>
>Beginning from setup_data version 2, Jailhouse will place information
>of
>available platform UARTs in setup_data. This allows for selective
>activation of platform UARTs.
>
>This patch queries the setup_data version and activates only available
>UARTS. It comes with backward compatibility, and will still support
>older setup_data versions. In this case, Linux falls back to the old
>behaviour.
>
>Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>---
> arch/x86/include/uapi/asm/bootparam.h |  3 ++
> arch/x86/kernel/jailhouse.c           | 75 ++++++++++++++++++++++++---
> 2 files changed, 72 insertions(+), 6 deletions(-)
>
>diff --git a/arch/x86/include/uapi/asm/bootparam.h
>b/arch/x86/include/uapi/asm/bootparam.h
>index 6163b1afa7b3..2244c493c3c5 100644
>--- a/arch/x86/include/uapi/asm/bootparam.h
>+++ b/arch/x86/include/uapi/asm/bootparam.h
>@@ -150,6 +150,9 @@ struct jailhouse_setup_data {
> 		__u8	standard_ioapic;
> 		__u8	cpu_ids[255];
> 	} __attribute__((packed)) v1;
>+	struct {
>+		__u32	flags;
>+	} __attribute__((packed)) v2;
> } __attribute__((packed));
> 
> /* The so-called "zeropage" */
>diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
>index e5ac35efc4b3..1c75de1496f3 100644
>--- a/arch/x86/kernel/jailhouse.c
>+++ b/arch/x86/kernel/jailhouse.c
>@@ -11,6 +11,7 @@
> #include <linux/acpi_pmtmr.h>
> #include <linux/kernel.h>
> #include <linux/reboot.h>
>+#include <linux/serial_8250.h>
> #include <asm/apic.h>
> #include <asm/cpu.h>
> #include <asm/hypervisor.h>
>@@ -20,8 +21,13 @@
> #include <asm/reboot.h>
> #include <asm/setup.h>
> 
>+#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
>+#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
>+	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
>+
> static __initdata struct jailhouse_setup_data setup_data;
>#define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) +
>sizeof(setup_data.v1))
>+#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
> 
> static unsigned int precalibrated_tsc_khz;
> 
>@@ -78,11 +84,13 @@ static void __init
>jailhouse_get_smp_config(unsigned int early)
> 		.type = IOAPIC_DOMAIN_STRICT,
> 		.ops = &mp_ioapic_irqdomain_ops,
> 	};
>+#ifdef CONFIG_SERIAL_8250
> 	struct mpc_intsrc mp_irq = {
> 		.type = MP_INTSRC,
> 		.irqtype = mp_INT,
> 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
> 	};
>+#endif
> 	unsigned int cpu;
> 
> 	jailhouse_x2apic_init();
>@@ -99,12 +107,16 @@ static void __init
>jailhouse_get_smp_config(unsigned int early)
> 	if (setup_data.v1.standard_ioapic) {
> 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
> 
>-		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>-		mp_irq.srcbusirq = mp_irq.dstirq = 3;
>-		mp_save_irq(&mp_irq);
>+#ifdef CONFIG_SERIAL_8250
>+		if (setup_data.hdr.version < 2) {
>+			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
>+			mp_irq.srcbusirq = mp_irq.dstirq = 3;
>+			mp_save_irq(&mp_irq);
> 
>-		mp_irq.srcbusirq = mp_irq.dstirq = 4;
>-		mp_save_irq(&mp_irq);
>+			mp_irq.srcbusirq = mp_irq.dstirq = 4;
>+			mp_save_irq(&mp_irq);
>+		}
>+#endif
> 	}
> }
> 
>@@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
> 	return 0;
> }
> 
>+#ifdef CONFIG_SERIAL_8250
>+static const u16 pcuart_base[] = {
>+	0x3f8,
>+	0x2f8,
>+	0x3e8,
>+	0x2e8,
>+};
>+
>+static void jailhouse_serial_fixup(int port, struct uart_port *up,
>+				   u32 *capabilites)
>+{
>+	struct mpc_intsrc mp_irq = {
>+		.type = MP_INTSRC,
>+		.irqtype = mp_INT,
>+		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
>+	};
>+	unsigned int n;
>+
>+	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
>+		if (pcuart_base[n] != up->iobase)
>+			continue;
>+
>+		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
>+			pr_info("Enabling UART%u (port 0x%lx)\n", n,
>+				up->iobase);
>+			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
>+			mp_save_irq(&mp_irq);
>+		} else {
>+			/* Deactivate UART if access isn't allowed */
>+			up->iobase = 0;
>+		}
>+		break;
>+	}
>+}
>+#endif
>+
> static void __init jailhouse_init_platform(void)
> {
> 	u64 pa_data = boot_params.hdr.setup_data;
>@@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
> 	if (setup_data.hdr.version == 0 ||
> 	    setup_data.hdr.compatible_version !=
> 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
>-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
>+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN)
>||
>+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
> 		goto unsupported;
> 
> 	pmtmr_ioport = setup_data.v1.pm_timer_address;
>@@ -202,6 +251,20 @@ static void __init jailhouse_init_platform(void)
> 	 * are none in a non-root cell.
> 	 */
> 	disable_acpi();
>+
>+#ifdef CONFIG_SERIAL_8250
>+	/*
>+	 * There are flags inside setup_data that indicate availability of
>+	 * platform UARTs since setup data version 2.
>+	 *
>+	 * In case of version 1, we don't know which UARTs belong Linux. In
>+	 * this case, unconditionally register 1:1 mapping for legacy UART
>IRQs
>+	 * 3 and 4.
>+	 */
>+	if (setup_data.hdr.version > 1)
>+		serial8250_set_isa_configurator(jailhouse_serial_fixup);
>+#endif
>+
> 	return;
> 
> unsupported:

Or you could, you know, pass a data structure that already does this... it's called DSDT.
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/D0A95275-25B7-4206-82D8-50B2C250F275%40zytor.com.
