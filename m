Return-Path: <jailhouse-dev+bncBAABBA4G53WAKGQETQTCOVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-f61.google.com (mail-wm1-f61.google.com [209.85.128.61])
	by mail.lfdr.de (Postfix) with ESMTPS id 69347CEBBA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 20:25:08 +0200 (CEST)
Received: by mail-wm1-f61.google.com with SMTP id 190sf189600wme.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 11:25:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570472708; cv=pass;
        d=google.com; s=arc-20160816;
        b=u6uncQKw/bAgyxuPr7bMlZ6XFJAnqx4W1+C8siwUFIBmWLrRZDe2qkjGvl3b3jks/P
         A/0SLE3CAuMreFdQ6AfTqUJC5GKTTPGGixnlL82YM+7O+p8vZ4x61OZIC57Bf/ycBOL6
         KmmjK+dFTO/qYges88iM8pPiiBIVESc2FNfnTkTg3DByC8EHWxpvXYaws1Zxh7xV4xrV
         eyrip5ThDIuP+74jYSImT+8ayGMKKK4tNdFePIF2yganpEw/hgIJnu4cXdMi22tPJuLj
         eS0XwT+VLBS6M6isGJyQqNW3nlmWrf/Dkwnf+3ponmT8CxSgaM2RG9UlTq5rYTptv2XL
         5H8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=LugrLaamuRl0SYf6fjosCjWnhh1dCleLJ7nYDRc2i8I=;
        b=zbSNKNkAkQL7AfgAfrtcprc5emLvtaHXYF9jo+2moNi06Zo6hiJN/1EM/9CUhhjD/G
         TBepAClUYzL2lA8mQycPux8P4kAvB9JG6yG1tvRgGyWiXUBYyWPiF9y4NRYpwm6RBGRZ
         FZ4hsZWGkB6PPb0uZxDFhZ7MmhVd4WoDModHtohG4JUHmLgqbO9kMHSb72okWFk1cYuv
         m3N3MaZvNwe78J2SmMSIA0nJzEvjvAQ9+23ch0gLOXSJIp0mv43UUdvXQ6c90jPbNp7y
         ahEBCSLeIHfsfnAMC4JDKOuj+1bsu9TiHY/FRcZ0D64tu02l2cCwmcWGWcWqNd0WtDSY
         9S5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:sender:reply-to:to:subject:cc
         :in-reply-to:references:mime-version:message-id:robot-id
         :robot-unsubscribe:precedence:x-original-sender
         :x-original-authentication-results:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LugrLaamuRl0SYf6fjosCjWnhh1dCleLJ7nYDRc2i8I=;
        b=D6wfCuxyrH/Go66ehDUsxNukRqSrCuMjEM1S9q964b8Vpg18hkuzmA0moUFyjii8Vx
         mzzVrQVyrVTSF2V0FwMua11a/gMzF5tiFHG2UepEoYAIlh77DscwYHP5l4s/J8o/ROXV
         CHlKCwee6swV6qaLDqruCGdExUaanuA78IzIZmD1dVpysrpQpyUdOILwz24FexpQnoYs
         0nhtKdHvP9ykVI++QUEwJ3RjnPwSH1Y5F3JSQVcNOqK5jHJfJDSmL3GE7BE486i6vV7b
         KnFSFiBPLvMGRKDw9Ie9aOH2eGWgP9YP6JqhH5yWgv2kQxwq2sZ/lySEdfvRq5WaRlnI
         xpNw==
X-Gm-Message-State: APjAAAXHaQnYsCfxDgGDEI6Yul5CwDeDbnNWAFE8Owwuz/VWftyYzey+
	NYtAhfaTcUrWTqrFAidvHJ0=
X-Google-Smtp-Source: APXvYqxeuPQkJWE2QV1v+iLdr+bOgbFpEvgAFDsftN0o1YL1O8ZLvPWAxccS1PA6gf3vJpAASaRBog==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr21951710wrv.55.1570472708162;
        Mon, 07 Oct 2019 11:25:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c408:: with SMTP id v8ls207014wrf.10.gmail; Mon, 07 Oct
 2019 11:25:07 -0700 (PDT)
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr15505490wrs.82.1570472707142;
        Mon, 07 Oct 2019 11:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570472707; cv=none;
        d=google.com; s=arc-20160816;
        b=STq0uDaHgwL3FHCPZSIRvjcL/qbi4VCbuuo2yf/uhHjXUVYJR1gtcewpdC4fQx92qE
         yqcNCsqfUZXFYXEHzwbmG+rDwDeXu+aa0Wr3n8hpuwEukLoCdG1ORNPgsjyJp9pvMpIC
         QQHL49/S0SfPRD8sFpgT4zvGODxXNalq1ZZKb5Cp87pYKbzpw197MZz3YbAwBF5n16i6
         mfxfZhgCog7VFFyqnLGqvFMlmYeiQfFw4KznQye/L7/yzTZ3mzNC1WWqtJp0FfQjW6hu
         9z5GGLSarmpx/h5C+tPrVBn97nYijuq6t/++LZXBZlBz+QEFvZ0LYrzQpZ8zJUk+hwoH
         yKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=LKoCoDj3r8UBXZSxiz5KP+inLPP1NHi8MyrqKYoPL7U=;
        b=I3g4IQ3CwVUTlO5ocoZacKIzSR8x3gwfQPXVO7LI9V/wMn3e2tLKHvWNyMJKauPw2G
         a6T87WYOEJdjiPyRGD+9Kbo33La/0L+nH3H9jpedveQELBNpKbRDMwMXR6BS1Qqo/zQh
         wYBdMNpDurj5us7DybWef0sm1WjHfKB9Ou17tLOKPWZvEp2NU/aHyZvbEDIv+iaceg6O
         UDSkhqK8CI8sXSW1G9FMR+czZKCRu4TxwKTH0QUS1Jnm9KN2oxx28rXVqGwHC2UASnhx
         Bh59X+XcMgG6AcH+sOj1FV29vKBcOpPe/1qzBj7yTqh/Fety7Le7ijMakdXUvVb9r2Fd
         UZ+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id x8si32535wmk.2.2019.10.07.11.25.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 07 Oct 2019 11:25:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tip-bot2@linutronix.de>)
	id 1iHXgu-0002LS-UO; Mon, 07 Oct 2019 20:25:05 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
	by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 7FF491C032F;
	Mon,  7 Oct 2019 20:25:04 +0200 (CEST)
Date: Mon, 07 Oct 2019 18:25:04 -0000
From: "tip-bot2 for Ralf Ramsauer" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] x86/jailhouse: Enable platform UARTs only if available
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 jailhouse-dev@googlegroups.com, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
References: <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Message-ID: <157047270440.9978.1646295335019419258.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Precedence: list
Content-Type: text/plain; charset="UTF-8"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: tip-bot2@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of tip-bot2@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
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

The following commit has been merged into the x86/platform branch of tip:

Commit-ID:     dac59f1eb78123c3f0e497eb9870ac550c59debb
Gitweb:        https://git.kernel.org/tip/dac59f1eb78123c3f0e497eb9870ac550c59debb
Author:        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
AuthorDate:    Mon, 07 Oct 2019 14:38:19 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 07 Oct 2019 17:35:56 +02:00

x86/jailhouse: Enable platform UARTs only if available

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
Cc: Borislav Petkov <bp@alien8.de>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: jailhouse-dev@googlegroups.com
Link: https://lkml.kernel.org/r/20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/uapi/asm/bootparam.h |  3 +-
 arch/x86/kernel/jailhouse.c           | 83 ++++++++++++++++++++++----
 2 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index 43be437..db1e24e 100644
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
index b9647ad..95550c0 100644
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
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/157047270440.9978.1646295335019419258.tip-bot2%40tip-bot2.
