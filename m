Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPXD5TWAKGQEMQUHRZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2FCE1E4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 14:38:22 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id y25sf8895647edv.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 05:38:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570451902; cv=pass;
        d=google.com; s=arc-20160816;
        b=gIVjSlVDDrMJeUULevZxYqhtne7mtlw7NUgqIuz7GpL5Bf1afwaWbkklDHT9Ebvuqw
         1hY+fV3NqB7qUK9wsOdAPdnm8w0jw0uH/knCJSgnU3h2gSnpXUqS1p8cyae8/0/Ar1Ia
         cY/DdSckhpui9JyHY8xhHaK7DdIr31csG25Qi81ZckhNQHWGu6fMMEgE2drwtV1sAu3a
         I+K82VC729Q5Sn3crtkSK1vVIZrLBAgq47hcFSU2fiXK9aLVzMQDOBoHoYPEcmfwqOKl
         rEIfIPS3UQbiYht1xCZ93fqk+VDQE1pJy3I73pX1DKgQ6EEL2Zi3NI77EhNhUzE4xxeM
         7dxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qXFVMaeMhJ2Ta8MdR8X8Ob626xU3vI7ypJhTmwO7Qkk=;
        b=ryfpS5kEYWt2NqEq98oPZwt6ybO6xyfAYiNNmQ/S6lhMKfpKb44nu9jlZxIjD9DNGg
         UMZ8RikhqeB37alS36JmQfVX2/F20OfQBqIXDUYIrasASmBi/cUQ9+wDshsueowvIwLb
         mQeW5KepNxSixiWHWLCN53//p9iG3l7SAfbgLQcIV7roUqwjHCLsNzcpx29i1xJZgeuc
         r3iZecZhRJiN6aZfDb7JJEb7GRwQJqU33mso78PasJU6ytVq2JMnj8HTmOUJSUnvddIb
         JTuTqG0/fbZwj0/Ap2KymMSImKE9SkOcdGqD0yi6kbrlDi2nirMCytnph4pwHsaLRFWy
         lbnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qXFVMaeMhJ2Ta8MdR8X8Ob626xU3vI7ypJhTmwO7Qkk=;
        b=QDZW8jWWWY+H0bMlQCzkp/OCSHQ4rB6KOTg4Da51tme3Wq6VuoR/HXIInJUcOyof16
         lU31vHtOb9Kkt/yOlijdmOfVS9XQgCaZT5hZQWPLGDmHPTiuf/OJZ95f2PoRsjKJ7PZz
         cTZ3WC40AzF1/TirPUyEiVcgoW+bn5bbTuRGIOPVk6pTWnclTLQaWlfS03YFCzksUjWI
         /PrDo4IsdSEojA3Mx5bJFZOdLqqMmL9Ue97EpXcHdx50kThiJysIqf0VXmGDGGSfvDzd
         8m2tQrkFgPY7psAJQOM07WPW61rjd5x0ShFcv29FowZDCJeB1regH6mTZZcnALBSHF1Y
         UKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qXFVMaeMhJ2Ta8MdR8X8Ob626xU3vI7ypJhTmwO7Qkk=;
        b=lLG+bu9Kg/pj4FKRXZW+L2glZg4jx5uymIQUwwOFqCKX9E5mO929n80xiaVLivzSYI
         rIbYQiyb7chNsjn7cwbUI3L/k+MdoJRa+8iTQcbiagedW/xWAM2PF+TB/cd4lI1780aZ
         5aHIkqAPYkbMnTVkg0frSMKlFZVVOCycrfwmtB7/JPxbvN6dOWzIbpxOULM2Vt1UezuU
         qvBZT5T7GJcjpu3f9NQmfXSXQA1FGU+04FdoHjYKAwLqRX2VUv6e8Oz4JE8uQDbeevUY
         +Mid9KuXgF2IWOrzx77BtchoDjbr6+EXFEToPIOsL7paFiAmIJkINRSHCteVEqGBioPH
         t+4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVuS6IQzRSwIkqpwk0JWP2olMsw0mKLdJ+D10pHsQsM+yGzegMm
	C1IxASGxS0rO0gKeJplU8Cs=
X-Google-Smtp-Source: APXvYqywvXFCoyS408CFqzUGwGdPv3wiyB6jxVqdEw97l3/6eVNHeJ2AltVO/BQ3lmOTzAwde3btqw==
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr28658397edy.212.1570451902462;
        Mon, 07 Oct 2019 05:38:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a2d9:: with SMTP id by25ls2593345ejb.1.gmail; Mon,
 07 Oct 2019 05:38:21 -0700 (PDT)
X-Received: by 2002:a17:906:f259:: with SMTP id gy25mr23860582ejb.2.1570451901622;
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570451901; cv=none;
        d=google.com; s=arc-20160816;
        b=M7fEjU1NKlW4HL9BwE3p2lJWYrGgBLvMnXzyWbVTJTlV1apzFdRMlE/dhsi1w90mKy
         wXJSKXkMNtRj4o9RtjqU+eOx29aU0p61iUQwFL16nahDW9GwFyq4kO2RcpM0H2h/ecq2
         d8ewOW8OR0fd/y8LgKGj8oJ6fG6XxiHbLmA476Q+4VLTN9g0s80VqR8l8mU7ZWFmIxZd
         uq49eOw8vSidbhay9tbIX2d0ri1JP/TfxJWrgdtmWmotjrueZsH4Kjl4L5Nma3W7Ci+h
         E00zQ1qqfS3KJBgVU/MW7eXb0kG1/UOclAR+wJ+dF/669XrwJJYpml1eTkrCLEsu2de5
         Fv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=njVYqqQB3oLYeNF8qovPtiSU6nkwBV7ADMtWVW27/6k=;
        b=JVawDonLOHmGrMa/JqHv3SXz30rnTpA30tmLlP08/XMr6M6peVe6b92fIlGKkVt1kM
         cDba5cJPQOkAD3B8DyNDCHbVfUhItlyJR2Xct+0phbWQVrHwQr9SMwviRQxzz57kG+Yo
         885kJmIEje6OxyZDgpwLLEC8HT+qvcyx+1ilLwLaxhoc79N1/cnzzuhCtnMIQNKpzt9k
         aJx64QwF9zJhFaQKNg7DohyxWrU55k6ZW4atxV6dfSRJWOUtE5i4dugxCT7pf7Av7v70
         jA4axItXAzydiigMz8Pu6aeoElMLXynzBHoqOx86RmO0PXspumFYoYCaKPeOe4mwrevY
         h4jQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id d14si1099250edb.4.2019.10.07.05.38.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46n0Q50mWtzy85;
	Mon,  7 Oct 2019 14:38:21 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v5 2/2] x86/jailhouse: Only enable platform UARTs if available
Date: Mon,  7 Oct 2019 14:38:19 +0200
Message-Id: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.7.123317, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.7.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __PHISH_PHRASE2 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
---
 arch/x86/include/uapi/asm/bootparam.h |  3 +
 arch/x86/kernel/jailhouse.c           | 83 +++++++++++++++++++++++----
 2 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index 43be437c9c71..db1e24e56e94 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -152,6 +152,9 @@ struct jailhouse_setup_data {
 		__u8	standard_ioapic;
 		__u8	cpu_ids[255];
 	} __attribute__((packed)) v1;
+	struct {
+		__u32	flags;
+	} __attribute__((packed)) v2;
 } __attribute__((packed));
 
 /* The so-called "zeropage" */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index b9647add0063..95550c08ab23 100644
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
@@ -23,9 +24,22 @@
 
 static __initdata struct jailhouse_setup_data setup_data;
 #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
+#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
 
 static unsigned int precalibrated_tsc_khz;
 
+static void jailhouse_setup_irq(unsigned int irq)
+{
+	struct mpc_intsrc mp_irq = {
+		.type		= MP_INTSRC,
+		.irqtype	= mp_INT,
+		.irqflag	= MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
+		.srcbusirq	= irq,
+		.dstirq		= irq,
+	};
+	mp_save_irq(&mp_irq);
+}
+
 static uint32_t jailhouse_cpuid_base(void)
 {
 	if (boot_cpu_data.cpuid_level < 0 ||
@@ -79,11 +93,6 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 		.type = IOAPIC_DOMAIN_STRICT,
 		.ops = &mp_ioapic_irqdomain_ops,
 	};
-	struct mpc_intsrc mp_irq = {
-		.type = MP_INTSRC,
-		.irqtype = mp_INT,
-		.irqflag = MP_IRQPOL_ACTIVE_HIGH | MP_IRQTRIG_EDGE,
-	};
 	unsigned int cpu;
 
 	jailhouse_x2apic_init();
@@ -100,12 +109,12 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 	if (setup_data.v1.standard_ioapic) {
 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
 
-		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
-		mp_irq.srcbusirq = mp_irq.dstirq = 3;
-		mp_save_irq(&mp_irq);
-
-		mp_irq.srcbusirq = mp_irq.dstirq = 4;
-		mp_save_irq(&mp_irq);
+		if (IS_ENABLED(CONFIG_SERIAL_8250) &&
+		    setup_data.hdr.version < 2) {
+			/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
+			jailhouse_setup_irq(3);
+			jailhouse_setup_irq(4);
+		}
 	}
 }
 
@@ -138,6 +147,53 @@ static int __init jailhouse_pci_arch_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_SERIAL_8250
+static bool jailhouse_uart_enabled(unsigned int uart_nr)
+{
+	return setup_data.v2.flags & BIT(uart_nr);
+}
+
+static void jailhouse_serial_fixup(int port, struct uart_port *up,
+				   u32 *capabilities)
+{
+	static const u16 pcuart_base[] = {0x3f8, 0x2f8, 0x3e8, 0x2e8};
+	unsigned int n;
+
+	for (n = 0; n < ARRAY_SIZE(pcuart_base); n++) {
+		if (pcuart_base[n] != up->iobase)
+			continue;
+
+		if (jailhouse_uart_enabled(n)) {
+			pr_info("Enabling UART%u (port 0x%lx)\n", n,
+				up->iobase);
+			jailhouse_setup_irq(up->irq);
+		} else {
+			/* Deactivate UART if access isn't allowed */
+			up->iobase = 0;
+		}
+		break;
+	}
+}
+
+static void jailhouse_serial_workaround(void)
+{
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
+}
+#else /* !CONFIG_SERIAL_8250 */
+static inline void jailhouse_serial_workaround(void)
+{
+}
+#endif /* CONFIG_SERIAL_8250 */
+
 static void __init jailhouse_init_platform(void)
 {
 	u64 pa_data = boot_params.hdr.setup_data;
@@ -188,7 +244,8 @@ static void __init jailhouse_init_platform(void)
 	if (setup_data.hdr.version == 0 ||
 	    setup_data.hdr.compatible_version !=
 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
 		goto unsupported;
 
 	pmtmr_ioport = setup_data.v1.pm_timer_address;
@@ -204,6 +261,8 @@ static void __init jailhouse_init_platform(void)
 	 * are none in a non-root cell.
 	 */
 	disable_acpi();
+
+	jailhouse_serial_workaround();
 	return;
 
 unsupported:
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007123819.161432-3-ralf.ramsauer%40oth-regensburg.de.
