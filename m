Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2OW3HVQKGQEYPENSUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 92956ADBD3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Sep 2019 17:10:34 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id z7sf2761007lfj.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Sep 2019 08:10:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568041834; cv=pass;
        d=google.com; s=arc-20160816;
        b=uov9RuVqwWZR2iDfj4fiCGKCEZGVP7YZwwBmKn/27y6lLq6g6Hv6r1k31UsvOjNu12
         oAgPUFlUp+xBhxPRHRSxz5pRFQ7zbgikUrKVkpCf6UW0r527w8gcVxcGxbxIYeAgH6LO
         NkBUazy3+y49zrCXUExdRylSGRRiQ+3lvj80dTr4NWJS7ibP2yl97HpG+LgX0eGz8Nuk
         bUQb7EF7QKUs8Op22mHES9CPgWfRYKQGBAis/f655GzbTEhJadB5yocevv3jxz1bW7Q4
         UfuaGdpu9DD2sFKHupWtLzki69gLQiJGn7ZOT1gdp2vqQL8fGv+Jp6rqkMEwDvTJ0PVG
         pvjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9O5nUtxmVVwNaQcTu0tjGJY6RkaySQUUeJIEkDVnGlU=;
        b=H7wsq89aDSYeBITr4tInFLkEgl+wCtLYUFEi9gFyWZctx3k5dyaRaVMKrZgWnhJX9p
         TC8Ex+zfo9qz4m0fhnM6KuiaX3aOLKwhMwCxmWsXzR71dVegAMSSb7znRlusfRA6Gde+
         jXbYWZpfB4fJVuRibwUINemnGqEaGoECS0NcfUW904D48AWVE7gc3P5FzDLKJQW5vLS0
         +ZuMs1L8ZJrV2KQ2yMekkYUfqrFOVVUFbO8I+XLXV4ipiJp5HAodEN0xtIqde98gtYyJ
         RtgG01SucT0in5gnmAHj6QyXkyR2itqMboD0ChYmCstB4D518k1NnRzIA7Fsq6ZELG5V
         nwnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9O5nUtxmVVwNaQcTu0tjGJY6RkaySQUUeJIEkDVnGlU=;
        b=Oq6Hu09TFCWhruDXaLzsJhAtAFkt009myejydivRXeWeVMzjQFpzsk/fHrCvdeDMJo
         oN9w09Jcl34uGvSacQcVIqyLshPyCNI3KtV4OSzqpnKLTuS3J9Xdql2XapuOjcAPNp+1
         TPryeF4c4rGyEQI7fgc+tKKOwDpmYjLBGGQH0OUMLivvbOYytjnCzRdUpmViT/kaUKl+
         GBTube3JOwLy799wE9hDUZYnHcZVnJ4IJ4NySJ2fYhc5MVADulcM4DB9QqEW4jX5FIFD
         4s/NBoKbbCVGsFl/VLOrMzl0zTXvceeg8n3980VHiwtOmdoHv6aGrQ9lC1PpB+E4W/xD
         perg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9O5nUtxmVVwNaQcTu0tjGJY6RkaySQUUeJIEkDVnGlU=;
        b=cjT9EuSQ712UVc/S5ROh93roolbeTSB4hfdQGy4lBDv4cfbVXhOZFsG5gRdWjvduyO
         0rMuD+0V07YHnpCXglIuexyItBddMq1F3ty42jw3VmW4DV64IxKc/itokGDQtjY8ya/z
         je6iwtWqUd/Xk+A4R42ADUCTBuOdxGH+/5ZC11/mpWGrMW+slEpLcvGJWEDBUceejoRG
         UvEbSQWJUDj5G09jWmH1rFxf9PRb2Ze4ScZoeL64uTyeRR43SwQsxNhXUgYixZqTEqng
         LVOuQq5yVj/E3MyGW+53Wr3UyPUCKgxNZG7h8t8v23EA9fQxowqzrD3V6kp2VqwVJH/Q
         i2kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBZpI6Ey6UZLptqjxiMR+Mgcl6undNLMVse2n8Pzpcysmzl7xE
	Y5ZdMGdKCHF+wWk6Uh9hCOY=
X-Google-Smtp-Source: APXvYqyiQ2ScODjVn05SIuwXoA1vf9/gDcjBEdjM98eRZeFHK0zE2mr1yf4PzQ15JYHTppiloyrgnQ==
X-Received: by 2002:a19:7515:: with SMTP id y21mr16738262lfe.129.1568041834110;
        Mon, 09 Sep 2019 08:10:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3015:: with SMTP id w21ls1622635ljw.16.gmail; Mon, 09
 Sep 2019 08:10:33 -0700 (PDT)
X-Received: by 2002:a2e:9713:: with SMTP id r19mr16463200lji.121.1568041833315;
        Mon, 09 Sep 2019 08:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568041833; cv=none;
        d=google.com; s=arc-20160816;
        b=X4UZSstjCgwLTrPUs2lSfu24/84rgb1hsCDYTB1n6v/L39tFSYyyUA1H3qAtLbyCuo
         7LOuy36aeFJe95RQa510U2N9pAvII3TyCbtBRnjtycra4FUKEvDkirvrQOufpY7jmved
         AGs7Hx9HqRCJr+zT4RQUZzJPaW8Je62qPooKqXE6vNuIc097MzgNd4A6LlsHuwQd1SAr
         oGy4m113nzwhkQchiJRI4Uji1bSKO3RHaW2L8ggjlqXiwljgvPrLn/dqInEtadqCUPH5
         XCw4Xza3z2ob5TqsvAZT5ZjYZxdobNyZkT0m8HNU9iGTi9I0CwuyUynBKdRhQac3yS78
         2KQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hsX+53MIRfIHUxht5cXucAC/gmgt27W9z1speb2ufgg=;
        b=1COSpaRecmlRUqx1EF1KEs+89Z6HOLZEOY/RWdLnW6IhrZAlZHZTKTWCKOPxf4CAee
         titSFSbdvnHHkm4qszZYc9+EG4tLiNfDE99F3kluberI+SpWRgx7+gAEsUAyrzsxN+Tl
         PgJwaKIb8zM5j3eU8Tbj1DSmeZc/lgjD1et8xk06L+vogJWBB8G1OQk0/rzcY5SvATAn
         Qj7BX73Ab5mQNRg1X2e6P1SxXaoEL6dJ0RC9Y5THmpfsqkeHbOYJQwMzk+iKM7Iz2lL4
         s4QIkiLOEyNdBesbeyTRiV0FFflYGe7ZM2+HDcID+EH7/fDswxwUHuV7B6aSpqgwrGR5
         YM3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id q7si820389lji.5.2019.09.09.08.10.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 08:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46Rs6c1q7qzy4H;
	Mon,  9 Sep 2019 17:10:32 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 2/2] x86/jailhouse: Only enable platform UARTs if available
Date: Mon,  9 Sep 2019 17:10:30 +0200
Message-Id: <20190909151030.152012-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.9.9.150318, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.9.9.5650001
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
index d5400a1503d0..3bc06a9e5f69 100644
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
@@ -22,9 +23,27 @@
 
 static __initdata struct jailhouse_setup_data setup_data;
 #define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
+#define SETUP_DATA_V2_LEN	(SETUP_DATA_V1_LEN + sizeof(setup_data.v2))
 
 static unsigned int precalibrated_tsc_khz;
 
+static bool jailhouse_uart_enabled(unsigned int uart_nr)
+{
+	return setup_data.v2.flags & BIT(uart_nr);
+}
+
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
@@ -78,11 +97,6 @@ static void __init jailhouse_get_smp_config(unsigned int early)
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
@@ -99,12 +113,12 @@ static void __init jailhouse_get_smp_config(unsigned int early)
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
 
@@ -137,6 +151,48 @@ static int __init jailhouse_pci_arch_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_SERIAL_8250
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
@@ -187,7 +243,8 @@ static void __init jailhouse_init_platform(void)
 	if (setup_data.hdr.version == 0 ||
 	    setup_data.hdr.compatible_version !=
 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
 		goto unsupported;
 
 	pmtmr_ioport = setup_data.v1.pm_timer_address;
@@ -203,6 +260,8 @@ static void __init jailhouse_init_platform(void)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190909151030.152012-3-ralf.ramsauer%40oth-regensburg.de.
