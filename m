Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEEM7TWAKGQEDEDSZBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2DD270D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 12:21:04 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id s19sf1587522wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570702864; cv=pass;
        d=google.com; s=arc-20160816;
        b=y4KLWRn2EFbfMTH0BfLsr05nZfxOl3ZXMVW0L8wsPswh5zTRXLuGWOlom1DFIMU49C
         oU3yLMcgJQ7Rwz2Yl+9x4UXgDrzOerliYApM91wJz4hIBZTNHJbe+JZkxQQxCBOsaN/7
         mQg0qk2KcspC1dD2JEEwiwVZeGsGYE18llN6L74X5SSSsDBLIQA3lVzM2MT/LcZkMXa/
         fCJ+W0wVWGlT7ADYrLWjgOGyhJQrV25bln3xG38Q0mXTW4DS+a4cPZ2tRwWNP7fgZuLb
         2TxgeSPTLw5WYSH7ujfq0r4hUdEhL+28cWdFZ3gDIPryj2HLb4q7rDL/Z3REuHk+h3gm
         cqFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=TTmjs/Yq5pI3kGO3qLrZzsMHMiVwQt5knLChaprkMEQ=;
        b=Icw9TxG8QfqDEdWG9TMnh3iro25N0JsKbnwM1t02QRvCkY7nyg6HYpIStNRPmPtLbt
         SwvHUXPz1rga0ZaJWY0GmMI2XL8KCzYHQuNKA4DtfPiLNwrFLudUb7ey3aFVwtsb+c0P
         6q2DKG0te6U3B3CFNacBwaw6Mkre0NfYS1g1z5Ll0sttSfPh8SbL5pBlv1xv0/ATDEkv
         DaRNkfzCgrXC9vh8mJDh5S7+jsBkvfu7JM1dlaqUTSlz68SRxuLMtC1jBN+nrlo8eSC3
         xqMtT4RkSLRYw3hU4cum3uZrYxdcGr2mbU/qPPNs/5sMXcc9OMD+NKhDnlTdbpVhUW5H
         6IAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TTmjs/Yq5pI3kGO3qLrZzsMHMiVwQt5knLChaprkMEQ=;
        b=s0mfejujTf2Wzn24cbnl7KDVhjaUFmYGxDgitT75nTp0sn/f56jCFy5jZtqDhe7XaF
         Bofhk6ijRK/7DM2rduAdgfsmzNLAnlRYwvA4uJz5wdQNUjHhHNr/GG2MPEdJ8iJN7MMv
         uHv7ZOcawcKsUsUzbXVPE0B7fNQL103jv/G0GxMHA1VUChsL7ZsLMgJUNGjokMUIeUjG
         Irfcifb6BhhG22eEHq1/4WOk1I+z0tIcCdfEQn11EfvAbboAxbnJAk/oFfbSDRiqL/g3
         4qpZyROF6sH/JDtgoqJCEK5Gsksjhs8RHjM9nMHML+GVAVzaaDJ4RuTX8dM7OvXy3y77
         rFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TTmjs/Yq5pI3kGO3qLrZzsMHMiVwQt5knLChaprkMEQ=;
        b=ZM98ejVZJ6jjG0p6mjQG+KGX1gGqMdv/WAjXVdmpoi5jWKBMYsTQrLty2hzQVX4tmF
         lUkTfmqnw68Tvo7u5lIp0VYzra0LO/CBwV1jWLyEWdF2X+qAlctuo1wpXcdEQtlaJRrg
         weGHBxlK954dCZfW5Qa9JG6M6SkJwnvbTcfeIj+mxPws+JeetehNIm0qESiDoWs1g5yi
         K5+PAnc2OS2ORuzIhVWK9F0b79z8m41AQ6zXLqdly2YCcOZVAUbY9tSsVsaxX0QO/mAG
         1Y/6C+9PM9Ix4mYSDafVQrwWRvDTpbJGd9fNlPny7WHc2anJxtjBUemJe30XpRcbW1qQ
         +P+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXn/qmxX/kx4/EwlDWRVBEEH3Zook/1yKEbglulBIHbSs4Y7etc
	PIx54PsN1efbjosJXJ4LiAw=
X-Google-Smtp-Source: APXvYqzacJM3UTgEAskFwQixzozgey9GEHv1xso4gMhSSB4i3MGf1LoSstS11RX47GizRVvKx54a0Q==
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr5780449wmh.158.1570702864445;
        Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c44e:: with SMTP id l14ls1190791wmi.4.canary-gmail; Thu,
 10 Oct 2019 03:21:03 -0700 (PDT)
X-Received: by 2002:a1c:f709:: with SMTP id v9mr7438418wmh.42.1570702863722;
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570702863; cv=none;
        d=google.com; s=arc-20160816;
        b=Q29EokXPR7tPIYxzueqc/zhjHtStjz7GrCYSy6XfeW2+qgqYwVu2hU8GKI6LnK1gJl
         oODoQDfPtZUlF25aMekBQPmc9I3uSeFobaIle0G//GKMc1j/J51D5Kd/9xd+sCZcQwOL
         uJkiFc6d+iwCGUmQK7BkHxRzufZRLtc+1HvDJ+E6xy/bna10I4lqYhNv7GV+K102RVmW
         tUmjMXO8ey6xhYyBy2Q4T4uhasAIK8ZSD5B56y+xpGOuGJ1TaO3CrbiE5gsPP2sFdaaw
         whmJLZezbZiJvrWKcqaMeIGwAvel4IEnqIDU8GVhR9wyuLSo9lPw4aX9XgN5IjiSRS6O
         2W1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AruzWfdXO++6HxL4b+L2kz5lkZgFP73PFn+Def+136Q=;
        b=HdAbmn3Te5PIwwHSZeMdyYWS5Cshf4Wvp9rpjjozHvH7cwfOVqDvFmI7nzmUQwE7zo
         0kmf7MWhTEqCyY/9nGm6R4UeYidErObbNwlRyjpSlevhwMRFxUV9Kf67cJgqrmTh1/uT
         yrzWFDD7kfrI2nZFBfO7iKJlWLH+N1WF1nbKK0wX8PMCsUKkSciUa35Obw7o/vV9DW5L
         D9qm2CxcuKrfeouRJs11Bd2WiPlFuQytEcjk80r7bUEjDMpAAA9Da4NkAO4bvqmn1v4z
         2XnC9qLto6hlOFr3F2bBS/GkIM9ROmfrhnm72ow4r5u3YF+n/D1RcvdMbIcOxA/9sW7A
         OjBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p5si228267wmg.0.2019.10.10.03.21.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46pnDH1nsJzyL0;
	Thu, 10 Oct 2019 12:21:03 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 2/2] x86/jailhouse: Only enable platform UARTs if available
Date: Thu, 10 Oct 2019 12:21:02 +0200
Message-Id: <20191010102102.421035-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010102102.421035-1-ralf.ramsauer@oth-regensburg.de>
References: <20191010102102.421035-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.10.101216, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.10.5650000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __PHISH_PHRASE2 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
Jailhouse. This makes the 8250 driver probe for all platform UARTs as it
assumes that all UARTs are present in case of !ACPI. Jailhouse will stop
execution of Linux guest due to port access violation.

So far, these access violations were solved by tuning the 8250.nr_uarts
cmdline parameter, but this has limitations: Only consecutive platform
UARTs can be mapped to Linux, and only in the sequence 0x3f8, 0x2f8,
0x3e8, 0x2e8.

Beginning from setup_data version 2, Jailhouse will place information of
available platform UARTs in setup_data. This allows for selective
activation of platform UARTs.

Query setup_data version and only activate available UARTS. This patch
comes with backward compatibility, and will still support older
setup_data versions.  In case of older setup_data versions, Linux falls
back to the old behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/x86/include/uapi/asm/bootparam.h |  3 +
 arch/x86/kernel/jailhouse.c           | 85 +++++++++++++++++++++++----
 2 files changed, 75 insertions(+), 13 deletions(-)

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
index cf4eb37ad97b..6eb8b50ea07e 100644
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
@@ -21,11 +22,24 @@
 #include <asm/setup.h>
 #include <asm/jailhouse_para.h>
 
-static __initdata struct jailhouse_setup_data setup_data;
+static struct jailhouse_setup_data setup_data;
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
+static inline bool jailhouse_uart_enabled(unsigned int uart_nr)
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
+static void __init jailhouse_serial_workaround(void)
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
@@ -189,7 +245,8 @@ static void __init jailhouse_init_platform(void)
 	if (setup_data.hdr.version == 0 ||
 	    setup_data.hdr.compatible_version !=
 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
 		goto unsupported;
 
 	pmtmr_ioport = setup_data.v1.pm_timer_address;
@@ -205,6 +262,8 @@ static void __init jailhouse_init_platform(void)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191010102102.421035-3-ralf.ramsauer%40oth-regensburg.de.
