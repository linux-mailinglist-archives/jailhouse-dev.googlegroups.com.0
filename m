Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIWX5PVAKGQE52IMGTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3694D0D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 20:34:11 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id w22sf2599094edx.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 11:34:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566239650; cv=pass;
        d=google.com; s=arc-20160816;
        b=J7TmqcrWJaiKonFTpNzivWlzZJ4fhVv1AIFjhZYYMntlRYc9wPBJbJ7MFO2Oecj4os
         H1xjJ1gmETxbCnf5H7d3tGit8o/9T6YdFu35JFjaXv1oc8CJ8W+tagzKXktLbGTp+LCp
         adtrshnsg9b78fRzhKl5BEvkagVO12MX4LKxSXigWZSwlwF3XkJf7dksh/1zcCMtav/y
         IBnkHXKt8//02fMYhq0yeOGnmmqpmvCc13uU/dQc6vSFGvnx6EwHMEYUyBIXE2Q14NU5
         j/YtvMVPNCC6Z1fv1/JvcDB7CgTtvTEbUmcGzARFwdGaHJsXENX1BlwdqRG/RxPXxN7A
         woyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=peRM6t5OGqHROL2Ha5lLW67tr0X715Aia6D69MfeYJg=;
        b=xqq2CEG9KAh3MOXCjiWgUKh+HpXin9b7/J6AmWto7lFooiNgmV26orETcM/xaW8yFn
         26916BUdiKAAs0093Tu4PdGn+H0YkRUicgoPtblDbLyIUYnS0ygY0wg0XnrcM2WxlV9Y
         x1lscFJ9o1ict1e/HyFVoa3jn31EUY9MhYEEzrfxvvSAEq/6N4/AK3OXWtT9SVlH3bgp
         M/Q9xBMP/AT2palvR7MrMgPqQF8fQmfzqpyOt6M+qIwsliWKrHxW9TnZaFsE1OT1MUKO
         wInC+8hBcmkRcSUNk8m+A1iNhuMAHvhzO36i8QEEBof9BkzqxGrLWXYE+kKJw9JR973S
         qMmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=peRM6t5OGqHROL2Ha5lLW67tr0X715Aia6D69MfeYJg=;
        b=DYXoTIKEcAmeIZVu1riP9voNF/ViUSAFZ6CrOyqGpDq4vwj8QPsJDAFBXGR3TdeVY6
         DEN8bMK1j2YBPIivjmTaYEc5bGFAJ/DCeMaK0GCMXTlNuOeGOSuP1WWmRpMywhX2kUQ7
         SLffK5blFIE89OTD8/PCt1alPlZgA05zFAUcrqxeFj0z/CiRnI9O16Ab7b/Ru59GC921
         wuG5do/hGylTQa+17iwcG1hgWkD2RhDC+GA/MMcJkwA7vBOhcnIQ99JH93vE6j0Hht17
         A8dd7nHT3U25/QVoZxdUaPB353kdEOqTMcUe3bmvCcMyTjQfB57ZBfZzrVF+co1f+hlo
         gEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=peRM6t5OGqHROL2Ha5lLW67tr0X715Aia6D69MfeYJg=;
        b=MSCV0MjGRSITcLp8R5+EI1EV70WZ0+v8m0FhpM648GJYmK0h1c+ZTd1iOGv1u+qRAV
         877m93NSW4RWbYrap9jOKehopZVmHGCoW3BNF1y5BQJiK21zLfUkLimDwfPlHPbnOOMa
         58Uu5LofRgpxsO41UhmpY88U35qNWEIQlMde0oyiDmaNn7ZRj9t6KOuJM9+DDVqR1agf
         ZTduSCGDf8hXduN4Qg9+FkHZo+uBLKYuhKBLa0edSub06iYXKLGvctdZIueKxy0KHarf
         kyH1iFngTuyMWeFp9Of2FxE/ZePweRM4EWfAhkPUPR65bdEEQBaZ4tbEZFYlXdH3w7St
         +7bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2XQ9h5vVegEXH6MBuKT7fGspzqgPUkORCeT4vx7wvXsUk95+s
	wo/Q4ivp7rVKkC0mAwBuuiw=
X-Google-Smtp-Source: APXvYqzMjJ9pzxjFxDNwBv1nUGGIPxVLgEjTJlij09VPTs0kNJfnWQ9TvGOMcT5QQBW+kHBGdR1X/g==
X-Received: by 2002:a50:fa43:: with SMTP id c3mr26704137edq.94.1566239650778;
        Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a1e6:: with SMTP id 93ls4481098edk.5.gmail; Mon, 19 Aug
 2019 11:34:10 -0700 (PDT)
X-Received: by 2002:a50:f285:: with SMTP id f5mr26715069edm.109.1566239650180;
        Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239650; cv=none;
        d=google.com; s=arc-20160816;
        b=hlgceXFLKWWj2ZdOG/mvwNVlDstBqeS9nwTes5q9JJqxWaXzdlXd7O11XBhJFa+98b
         40AkAwjq40NzFawZhsoooLcTA/PeF8mYSxLMFMdk5qZlBqgd8/s+Qg30F+J2u84Y8ZeA
         7QTzbBWMACoq9GYiLc7DDu0CikuInRLS+qkFrVsK/Qj3E+zFtquek4ZvlyIiHAjfhlEt
         IunNDaI+HCGpSO4VltQlhVMYcJiOJNABEAu8UfV3xEkyp1ILFPuLQ+9mwsqvmVB5+N4N
         RcNBTOhwTXagZt1834eWg0zGjFOEJcvzLLkTtcKvjDbZGGpOog1idfuUYsm3hib9nD2B
         gh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=TEoDdniiaN2yY1WYUz2A1aVX0CgNNWRZ2rsfwd20Adg=;
        b=AIYAXX8/c+PqgrjBdPE9X/8RGRUq2TELgAFD+EU/aDwBHGFKDFBs+0cFXCcopRx1lS
         HYp6lOAdwa137wsQLFKvezHwOhellOCWbIdIn3fmTuBfTXNvYqXIporDtKCQ9E473WqL
         e936BIpgWArt4VHnyCPZa/5/dFbtqIV0zwE53WAf2m9mJk8jRfnmDhMfFPHDcZ9II9UY
         iu8HLcHR6L1DoNw4tn0Iw2ZJBTZSuPNkpK4xBfD5/SFyOiODKpd7YavNFcMcR33vpl6s
         FHrNp8sdisg2wO39s7t950eDe+nBUh+8prWeMSSLT+3AyRlGB68VreQeiW6LETS8hgSC
         y2qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id d22si747332edq.5.2019.08.19.11.34.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46C2dF4hP3zy79;
	Mon, 19 Aug 2019 20:34:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 2/2] x86/jailhouse: Only enable platform UARTs if available
Date: Mon, 19 Aug 2019 20:34:08 +0200
Message-Id: <20190819183408.988013-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
References: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.19.182717, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.8.19.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __PHISH_PHRASE2 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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

ACPI tables aren't available if Linux runs as guest of the hypervisor
Jailhouse. This makes the 8250 driver probe for all platform UARTs as
it assumes that all platform are present in case of !ACPI. Jailhouse
will stop execution of Linux guest due to port access violation.

So far, these access violations could be solved by tuning the
8250.nr_uarts parameter but it has limitations: We can, e.g., only map
consecutive platform UARTs to Linux, and only in the sequence 0x3f8,
0x2f8, 0x3e8, 0x2e8.

Beginning from setup_data version 2, Jailhouse will place information of
available platform UARTs in setup_data. This allows for selective
activation of platform UARTs.

This patch queries the setup_data version and activates only available
UARTS. It comes with backward compatibility, and will still support
older setup_data versions. In this case, Linux falls back to the old
behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/x86/include/uapi/asm/bootparam.h |  3 ++
 arch/x86/kernel/jailhouse.c           | 75 ++++++++++++++++++++++++---
 2 files changed, 72 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index 6163b1afa7b3..2244c493c3c5 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -150,6 +150,9 @@ struct jailhouse_setup_data {
 		__u8	standard_ioapic;
 		__u8	cpu_ids[255];
 	} __attribute__((packed)) v1;
+	struct {
+		__u32	flags;
+	} __attribute__((packed)) v2;
 } __attribute__((packed));
 
 /* The so-called "zeropage" */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index fc65ed3346ac..bdc7669fab06 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -11,6 +11,7 @@
 #include <linux/acpi_pmtmr.h>
 #include <linux/kernel.h>
 #include <linux/reboot.h>
+#include <linux/serial_8250.h>
 #include <asm/apic.h>
 #include <asm/cpu.h>
 #include <asm/hypervisor.h>
@@ -20,8 +21,13 @@
 #include <asm/reboot.h>
 #include <asm/setup.h>
 
+#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
+#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
+	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
+
 static __initdata struct jailhouse_setup_data setup_data;
 #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
+#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
 
 static unsigned int precalibrated_tsc_khz;
 
@@ -78,11 +84,13 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 		.type = IOAPIC_DOMAIN_STRICT,
 		.ops = &mp_ioapic_irqdomain_ops,
 	};
+#ifdef CONFIG_SERIAL_8250
 	struct mpc_intsrc mp_irq = {
 		.type = MP_INTSRC,
 		.irqtype = mp_INT,
 		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
 	};
+#endif
 	unsigned int cpu;
 
 	jailhouse_x2apic_init();
@@ -99,12 +107,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 	if (setup_data.v1.standard_ioapic) {
 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
 
-		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
-		mp_irq.srcbusirq = mp_irq.dstirq = 3;
-		mp_save_irq(&mp_irq);
+#ifdef CONFIG_SERIAL_8250
+		if (setup_data.hdr.version < 2) {
+			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
+			mp_irq.srcbusirq = mp_irq.dstirq = 3;
+			mp_save_irq(&mp_irq);
 
-		mp_irq.srcbusirq = mp_irq.dstirq = 4;
-		mp_save_irq(&mp_irq);
+			mp_irq.srcbusirq = mp_irq.dstirq = 4;
+			mp_save_irq(&mp_irq);
+		}
+#endif
 	}
 }
 
@@ -137,6 +149,42 @@ static int __init jailhouse_pci_arch_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_SERIAL_8250
+static const u16 pcuart_base[] = {
+	0x3f8,
+	0x2f8,
+	0x3e8,
+	0x2e8,
+};
+
+static void jailhouse_serial_fixup(int port, struct uart_port *up,
+				   u32 *capabilites)
+{
+	struct mpc_intsrc mp_irq = {
+		.type = MP_INTSRC,
+		.irqtype = mp_INT,
+		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
+	};
+	unsigned int n;
+
+	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
+		if (pcuart_base[n] != up->iobase)
+			continue;
+
+		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.v2.flags, n)) {
+			pr_info("Enabling UART%u (port 0x%lx)\n", n,
+				up->iobase);
+			mp_irq.srcbusirq = mp_irq.dstirq = up->irq;
+			mp_save_irq(&mp_irq);
+		} else {
+			/* Deactivate UART if access isn't allowed */
+			up->iobase = 0;
+		}
+		break;
+	}
+}
+#endif
+
 static void __init jailhouse_init_platform(void)
 {
 	u64 pa_data = boot_params.hdr.setup_data;
@@ -187,7 +235,8 @@ static void __init jailhouse_init_platform(void)
 	if (setup_data.hdr.version == 0 ||
 	    setup_data.hdr.compatible_version !=
 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
 		goto unsupported;
 
 	pmtmr_ioport = setup_data.v1.pm_timer_address;
@@ -203,6 +252,20 @@ static void __init jailhouse_init_platform(void)
 	 * are none in a non-root cell.
 	 */
 	disable_acpi();
+
+#ifdef CONFIG_SERIAL_8250
+	/*
+	 * There are flags inside setup_data that indicate availability of
+	 * platform UARTs since setup data version 2.
+	 *
+	 * In case of version 1, we don't know which UARTs belong Linux. In
+	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
+	 * 3 and 4.
+	 */
+	if (setup_data.hdr.version > 1)
+		serial8250_set_isa_configurator(jailhouse_serial_fixup);
+#endif
+
 	return;
 
 unsupported:
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190819183408.988013-3-ralf.ramsauer%40oth-regensburg.de.
