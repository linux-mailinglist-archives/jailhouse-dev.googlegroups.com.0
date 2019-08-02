Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIO3SDVAKGQEPNET54Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD887F6E8
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 14:33:38 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id v4sf16234419ljk.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Aug 2019 05:33:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564749218; cv=pass;
        d=google.com; s=arc-20160816;
        b=NaRu6ggV7A4n6nMepu0UI03wnIeMHxbekwY0sYU1eD4l7TPA2En2yF1aLAGBs9nY/A
         T1ywEfXd+MnZC484PzeW46mlhY3r43arOlx60MpPNjuwZtOpHPR72nbdlyw/atrmZpD3
         k1PfNk7tX4OYyRYHgH5haRMbWTG8TZJNl9Spcsp0F92qchcKuwHQLgoaBY1q+zOOOuGj
         /LQBXVQ7Hm0k69kmdGzvwoTzalijg/qyr3mmbzN1xsW+N4Xmk4OoxtbwPzLZzliFCthU
         nPUywHtOvS4eMkP8wD+8rzNtsid/B5LEVpSmAUgfTpRCRfGkgbT+Y2yDyGxSxwhZIR0O
         hhEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=C9sEYQRZFQR0sXAe5CLo6PC8AWd3q9Hf2KhPe5L3q6g=;
        b=qRvh83d0aSHhZrEnPvTp9TiZiawxIdC+E6zNK2n7Hf6a7BNJEBGcVyXagVTj1wfXyF
         jwCC6Iw0lFZrcq6lbP/cwDV+GUP6hJ4nILSzUnK+deh7GV95C4UUhuoaxWZx7kiIzadx
         k/MHCJr8NEIqr4NFX1LCZ7dvv+VWUdtLflilHjhK5Xt7Atuktk++8VTngatgFUtOHtmy
         q/95jfy+DiLdBF6TG0P6AeIyVEVi8TQpmftsAUCynFHZAhhcA0nAl3z2joqGUcj4CZ0h
         hQPlNG3U6h7hbLvC+BxM5rdF7zFoKHVmTl3RLoG/ok49hbtnU4woVY0oNkJDZqUSP3df
         RrTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C9sEYQRZFQR0sXAe5CLo6PC8AWd3q9Hf2KhPe5L3q6g=;
        b=RBDPipqq9aVd9fp2IIM//9PhmGp+paMehL4+cLfG3EyNP5FhEZpH2RRzk1ejZG5Tcq
         bvB1umv640/6UKIv0BjqYLqcDAVhinlWxJXdjEQh6YXtbjp1ToR4KR72D71nhTPC6ixI
         G8X4ghtvKWX2KK7qLARU7THm/45Yr/78NBGd0/qJHSfSrKHZ/oku3CS3RIVVlFP+LiHj
         OCb4vKTNPxETYrBalHzis4PBbA13jGEYQrd8Zzto8JNNAVFQpOdPPXCHLZcFuf/dE4ZJ
         S1bS17YVo/CjoD34Zhz1jTPsQQK5Rvg+Te79xSvidM7VfvFrRgYpPLSYVQhFZo6YJO9e
         BL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=C9sEYQRZFQR0sXAe5CLo6PC8AWd3q9Hf2KhPe5L3q6g=;
        b=moGD2F5kRAv+qLKXNeSbiXqMVsTIbXVrxZrEQE0z2p5DuLBhm+trNjKp2HG5iUM2/m
         fShaM7+ojPPjGC9zAq8VDwSMRfXxnhP/0H72q3A7F1LVBheqAtNYSSQV/JOxeps82U26
         Qpv71zRTaeO6O25+oGKZtCN9BO1raTPlWhOAw1gJuMZrUFLvZdYn2zO9nkxAkpbOocKz
         CSjWlladw1m1pIjvMMzvtIYcsXILEtyCj4y/S0/zG+F2cSAh0smajlwy0MXf4dfxi7bH
         ZpJgf5wnaYQUiU/NJ1rodH/tXXy3I9Pr9BxooOdXjz6FBadGxHU9aRoNg9yTw7u1+DEe
         ++gw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUH7wF17//sneOhC61WvFHo3W+oyvozI4qcZYLhYtJi1PjpFYgJ
	Bsw74EyRoWQB1zDiuReKVss=
X-Google-Smtp-Source: APXvYqzSlbrs5J9MX1phS0EO02C2XHyLEFVcV46s3QFo9ii7V9Oxl7FJpj/u86pYrmgx6ckSQn+ovg==
X-Received: by 2002:a2e:9858:: with SMTP id e24mr47094251ljj.91.1564749218255;
        Fri, 02 Aug 2019 05:33:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:67:: with SMTP id i7ls6351355lfo.4.gmail; Fri, 02
 Aug 2019 05:33:37 -0700 (PDT)
X-Received: by 2002:a05:6512:51c:: with SMTP id o28mr66531002lfb.67.1564749217548;
        Fri, 02 Aug 2019 05:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564749217; cv=none;
        d=google.com; s=arc-20160816;
        b=eW5Jc/OChv9kPeIX3my2yMJ0tzQQKnqo4NKeK/Vfv1jHKRzzC9ISBBzJpGw27JKaB5
         nHKbSS+dfCdUdIqpQyA+XAPwGr/6reFheKJyulGDxD38sc9/w3QUHK+0AGqzCfaL70xd
         zZmL6h0bOVFGrTUFKd4sq6Cp/oXsSEjwM4J2NPp/x8f+ZUxeC22A+CQ5Jv4Su/KS+tlg
         E31bzU9SuQX9UhDHHALH3wi1m5xWpdXdtES7G7NdtiYLj3TYjrVO3DvKnz05vXKoClww
         CpJsSMN77GPscYpSA10kjCXx+wfAt8vZLNg4iR8l2N9CnDvsKeFXYqv6E6QVSLPGfCx+
         6byQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=KRrW8Y7T1njOfqF20rr/jG/vbWiY+jkQB6bYPFNNTV4=;
        b=SMHo7pL5lyJm344Z1YE6+rh7U+hNrzsdkSJXn9mzXt1pfU8CnalF1JcH9zfhmFKf18
         +hVjybAaAz0byvfX4EunC67scM/z3ZIuUbmF8+4otFhT8CQHg1KdrWZL+6S5kaL6CaiL
         6Poec9avdJNAh6H7UFaHGVIFlFxtfUUMsZYZiZpfqgv96E5GZmHaK9GVCxLQomTd+SFJ
         UlZM4tRB2M6P6CWHMQXhXm3/M08Rxbt2e+Yi+lhBWPLLQIRycirY4yc/JT+3Pjt7xhLa
         PTwjgBUdB65daxDPJorcOk5yy6qiDt77X/InF/Gnpamzj9oas0coDlkOnZtgQGodnUCw
         uvgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h11si1015202lja.0.2019.08.02.05.33.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 460RR4440lzxxN;
	Fri,  2 Aug 2019 14:33:36 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/jailhouse: Only enable platform UARTs if available
Date: Fri,  2 Aug 2019 14:33:33 +0200
Message-Id: <20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.2.115716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.8.2.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __PHISH_PHRASE2 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
 arch/x86/include/uapi/asm/bootparam.h |  1 +
 arch/x86/kernel/jailhouse.c           | 74 ++++++++++++++++++++++++---
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index a06cbf019744..2d6a40cbf3df 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -146,6 +146,7 @@ struct jailhouse_setup_data {
 	__u32	apic_khz;
 	__u8	standard_ioapic;
 	__u8	cpu_ids[255];
+	__u32	flags;
 } __attribute__((packed));
 
 /* The so-called "zeropage" */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 108c48d0d40e..3b73647b2456 100644
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
@@ -20,6 +21,10 @@
 #include <asm/reboot.h>
 #include <asm/setup.h>
 
+#define SETUP_DATA_FLAGS_PERMIT_PCUART(n) (1 << (n))
+#define SETUP_DATA_FLAGS_HAS_PCUART(flags, n) \
+	!!(flags & SETUP_DATA_FLAGS_PERMIT_PCUART(n))
+
 static __initdata struct jailhouse_setup_data setup_data;
 static unsigned int precalibrated_tsc_khz;
 
@@ -76,11 +81,13 @@ static void __init jailhouse_get_smp_config(unsigned int early)
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
@@ -97,12 +104,16 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 	if (setup_data.standard_ioapic) {
 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
 
-		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
-		mp_irq.srcbusirq = mp_irq.dstirq = 3;
-		mp_save_irq(&mp_irq);
+#ifdef CONFIG_SERIAL_8250
+		if (setup_data.version < 2) {
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
 
@@ -135,6 +146,42 @@ static int __init jailhouse_pci_arch_init(void)
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
+		if (SETUP_DATA_FLAGS_HAS_PCUART(setup_data.flags, n)) {
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
@@ -162,8 +209,12 @@ static void __init jailhouse_init_platform(void)
 		memcpy(&header, mapping, sizeof(header));
 		early_memunmap(mapping, sizeof(header));
 
+		/*
+		 * Version 2 extends version 1 by four byte. We still do
+		 * support version 1.
+		 */
 		if (header.type == SETUP_JAILHOUSE &&
-		    header.len >= sizeof(setup_data)) {
+		    header.len >= (sizeof(setup_data) - 4)) {
 			pa_data += offsetof(struct setup_data, data);
 
 			mapping = early_memremap(pa_data, sizeof(setup_data));
@@ -195,6 +246,17 @@ static void __init jailhouse_init_platform(void)
 	 * are none in a non-root cell.
 	 */
 	disable_acpi();
+
+#ifdef CONFIG_SERIAL_8250
+	/* Since setup_data.version 2 we have flags that indicate availability
+	 * of platform UARTs.
+	 *
+	 * In case of version 1, we don't know which UARTs belong Linux. In
+	 * this case, unconditionally register 1:1 mapping for legacy UART IRQs
+	 * 3 and 4 */
+	if (setup_data.version > 1)
+		serial8250_set_isa_configurator(jailhouse_serial_fixup);
+#endif
 }
 
 bool jailhouse_paravirt(void)
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190802123333.4008-1-ralf.ramsauer%40oth-regensburg.de.
