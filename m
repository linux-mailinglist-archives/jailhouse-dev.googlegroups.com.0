Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTEQYXVAKGQENPF77HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C789C58
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 13:06:53 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id r25sf2484805edp.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 04:06:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565608013; cv=pass;
        d=google.com; s=arc-20160816;
        b=ajntVOxeJbh+AQGm3UfQYVCovQ7IX/P4CAU2Mx5Ai16DJLLM4bIAv8Q6jpNZ2C4MFf
         09ZCA+rynM1dXbvo1ozQaqu47GKd+H3YCG/ewboX+OUV4IKjwOn5v7S30Srf6+RtHU1D
         XuWcBfRtHremFLGaMGt9mJfnjjgTjcJZu656hGQfK9ZinJE31Le94cFwlxvpukBVpI+g
         TxQCKg0O3Nqw9GIGxDSoAb2UbcabTJ9yfUthjKi28sR3hmQ90cdzq6dooD7Hz6m5cQ+Q
         gZRY1xQkvuL7MPVMhKT0EU5E9Tkfu4JNt9aEVR1tC2GjjTW3U+zED2M6f820q6sNagFn
         9gJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=CdTOy0HTa6Q/egM08jO9JFlyvrPX0TIZ3LYkPsYj+4U=;
        b=G2Hq4PWe9mQMjOSnFqpFPFCMb9PCKTeQq8MeoVqNlNgV/xLC1KjBaiLQWrKxYhxhR9
         HmbGCZV3cHrqtfgctr2UlP0LDW2RKyrWlBBmeB4EbuOTbFYiecE5aRbhnTBQeCVlN3SD
         7nGPP0UZDEHEoWeYOtGTiHCgpoAqjuCE7oDOTdWlWG5NqI8dTKS+4Jay+QXsEZN9lwrC
         SRR1QLHJpUay+CYSPh834Fs5QvpVR4RGRuVBVy+NWfz1T+TahtzNpjlY3b0r7sdUhKGa
         +R+MYtAcEH4uOh2aDXMHz4CwcCl8+gZ5K099s2FGU+Fb0+7XIfH0BgqpCk47pFv9JLyj
         vu6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CdTOy0HTa6Q/egM08jO9JFlyvrPX0TIZ3LYkPsYj+4U=;
        b=kDIy5TQ7dPySVlH5akfMGFk/qmKGVN9PO0ODI6SV4+2QX09s03Y+EX63qYZiIbpk4z
         xAtIwJOggf4sxtkHGrx0gN2jSuUwyQLZagOw58lOkXcRil3hkXClU4RPURTfoAuOqEuU
         ULXZ2TSWC22nSMF8yjebFBIabwyQ0BdysrTYD5YzuwQP7ypMCfr83FyKfiP4HCIQJLN3
         hjjb10jvTWcBS7Bykco5zmcebJx5eluFgkXAd+bIlsxRXDCro6F6Nd1ksPbZ5A5yPSBE
         CBJx7Duc6E7vF0k7Dq4+eXrpJ97SSU5vwLSbNeWohSNDtYOROw1986GslYwAA0w6zCug
         4DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CdTOy0HTa6Q/egM08jO9JFlyvrPX0TIZ3LYkPsYj+4U=;
        b=UIefF+gqvp+Wsf3/jh+eEV8FT+0z7awPlqyMxps1eB1ZYEjaDFEZrgZ43ThFobh7FB
         SPJ5X5ydvoEwZeJJgDBq1Go+2Btmts1CO0TJe0QQxYuIVXJRQQ7Ry1eDrsqftCp8gddg
         FDOM/TQzVxbTWFh/EfFw0ild7s1DWISo5St/cD8kkihJTOltRYKLqyCUtjQbVw+UxtuH
         ZazEtc7zvR7JQcZ2nAeR8LIbaDkHQ/jSgbCA9+ytnHkdgd2t/mfsutDr2SoOvEvmEiPa
         px/O8qEB6RBNxj1cTMuuabQLFulL9dygUYCSyCsWnwBm1f3qjzXH1u/K+mWWCqV2NhSG
         pZ6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXto8+qhwaSvGKDODBvrrWlAvF+KzYx+oGJ8+9UQf4+KpB6W14D
	XL6RRe9ee5Aw4VZR5T9jBi0=
X-Google-Smtp-Source: APXvYqxFpawIoUF6GYsYy4CM+Codk4g9Yipu1IPi9yNPyDUvAd+sz+tDiZJRPB4+uoWHUZk0DAt+PQ==
X-Received: by 2002:a17:906:a952:: with SMTP id hh18mr30448035ejb.289.1565608013346;
        Mon, 12 Aug 2019 04:06:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:210f:: with SMTP id qn15ls2243113ejb.2.gmail; Mon,
 12 Aug 2019 04:06:52 -0700 (PDT)
X-Received: by 2002:a17:906:852:: with SMTP id f18mr5062097ejd.18.1565608012661;
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565608012; cv=none;
        d=google.com; s=arc-20160816;
        b=H6LSlnmBNxmWX+3wneoljw+vgK7okuRyByZRVfyq4z+lQsdISH3KSm0ryS0CPE4qUo
         fZ1aBw0ZXZoUchk1jTaZl+44Y/rzqGTNirVhhn8Ta9yuKJcJUvr6atvVBwnfLgWLVIkV
         SKLxwYDFhx8wa/PCOlBL7FGrmuWDcDhv9e2VtePuSR/VJXvou1bTKIzwKVHnowEX7yZD
         qOM5WPbwpGQv+K1eBFMT0wR72sGtJwUXBq9Znii0EPHfhnnZKjOByLyIwyKEgSqejiTO
         sfu9v+CzYFuBo+qVZAw+EpSQsecRhJ9CzQpGBNF9/c/qWXUJKeM5E4tVQ/XNw8QDS3bv
         uGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PrFJ1SUdoMUIfrINak78aFnk16jB4m+9QJE10dZiGL0=;
        b=AftjRSsm4rPoSSjuUA939WNEZP8rSqUv2oLk4IvcOdH8jhfTUwrPdNaqd3A5y8jYp1
         uJHbaYV+klXMjfKovoGEt8+acK1lRfoOm6KorpvsN5JtQKmrD776GQoG4rtFatmQXwL0
         LFsrrekTIuFDp4+H7kJwE86fyQQ6+IFbGq3+TX3EzzFYl2vm3veUtH8NOrv50EKaoMce
         cfFTXQxTEsSP4m3qscrjUHFBznuhGnp5YRuzkY6ANO3rLtuhknMLelEsuQAmXt3Eb8CH
         ncalCW+MhaiL5PNsk5EkpkVBbiITcN2i95ZlVw9tNK3zYxGks2zTeymgE25ukFCvwl2K
         GmgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id m16si193314edv.2.2019.08.12.04.06.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 466Y2N0ntbzy7N;
	Mon, 12 Aug 2019 13:06:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 2/2] x86/jailhouse: Only enable platform UARTs if available
Date: Mon, 12 Aug 2019 13:06:50 +0200
Message-Id: <20190812110650.631305-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.12.105717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.8.12.5630000
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
index e5ac35efc4b3..1c75de1496f3 100644
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
@@ -186,7 +234,8 @@ static void __init jailhouse_init_platform(void)
 	if (setup_data.hdr.version == 0 ||
 	    setup_data.hdr.compatible_version !=
 		JAILHOUSE_SETUP_REQUIRED_VERSION ||
-	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+	    (setup_data.hdr.version == 1 && header.len < SETUP_DATA_V1_LEN) ||
+	    (setup_data.hdr.version >= 2 && header.len < SETUP_DATA_V2_LEN))
 		goto unsupported;
 
 	pmtmr_ioport = setup_data.v1.pm_timer_address;
@@ -202,6 +251,20 @@ static void __init jailhouse_init_platform(void)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190812110650.631305-3-ralf.ramsauer%40oth-regensburg.de.
