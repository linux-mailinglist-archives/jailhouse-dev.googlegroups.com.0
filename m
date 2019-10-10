Return-Path: <jailhouse-dev+bncBAABBEHO7TWAKGQELQITDFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-f56.google.com (mail-wr1-f56.google.com [209.85.221.56])
	by mail.lfdr.de (Postfix) with ESMTPS id C7507D2BB1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 15:50:08 +0200 (CEST)
Received: by mail-wr1-f56.google.com with SMTP id w8sf2804319wrm.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 06:50:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570715408; cv=pass;
        d=google.com; s=arc-20160816;
        b=XYvRcLRPthx5mYVvQqh98QEbmA9Rllc7XOvcIAVs1cbFUS7FXWKInu+O1hlXkjxFiD
         aLo3UJdtDhhajEcl6A55zeGPoPnSXCfjltC5jrgy+xbXP2/VuUtNdZpi80M1p9aXM88O
         4PCSyRrYbrsURChKGshV4uGr7GIFpyDIn5nqY/Lpr1aGYStUA9XFrvtx4m1TwaExjlRZ
         hBhOxjv1Wtc/eShn5R/r/ToOELMf8hUfP1V+fUBdsZ+OSHilB9aJYo4vjZzG6FuXpshj
         A2/MxoMrWsAYybY/V+yqN/JlBm4wh3i+Z2x8+qxNFO4+JGkDejHYLxjvg7wOlsFL8jl+
         SE4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=vbqoU439IF3uDz10R8PjIiIHcPYlpwnnXgaDBFhkXxk=;
        b=X+w89Krn7UAPoigVIFtSIjKPdHjZVEYij9s5aGMeMqpDPoaz0hcz3JO2hmzR8gTrIJ
         9GadSjY6Zg2lBvS2GWVUSCXzf0fLe2y6WlY8wjf42ioPPMapsAqu1V3CQ+TnNjMeSDNc
         V30S4F3cwAiC7n8EMzmHRgNXBSOTQkPtMeC1IgpubeINOGFTolkfG9b0TqgCdcjmyYMD
         fJ7Ln8PaENGz59wBjoELYVqAchEvR7ZSpWua52J5Zk0uorwKEYyvIgdn5t56rK11WRAo
         nc+2omV2hIlsP32M49K1u7sTl0GZwTNls8+BBpnRlj73b8EuaVehEzKduBBk2RHnFDcf
         tqtg==
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
        bh=vbqoU439IF3uDz10R8PjIiIHcPYlpwnnXgaDBFhkXxk=;
        b=to/ILUw47tfdxXM8S1f3gPzAslWDXr1OqVwSbTLnz8etAaQguNNUTOR2Z+rzHzO8uC
         t/Jo5S9woDqNd8421RFTNtgsqztsb3biD0cMdhlljAbrVZ6dfgdAfB7jsKrQy12W4VEC
         bWDnr7N1jNbMDdF+XBX+l6ANSGk38heA8tIX+8nX/D5d3H+zSzdqYZHyHdgsXO+TwzZm
         tgvK15YHxAgdClikU08aQSMDxVCBVGjTKkbPbrqoJSjcOBEhkDZbySZW4JwXxJOMT/s0
         9/1AIsrngkYNShvTF5nZIvl/w6GorwOj3gu6e2AxvY6eW11ofkBTcidaSOZptFMiG+zt
         hfyA==
X-Gm-Message-State: APjAAAW6OTGXzckdgkY0qjCNKu66/UcaFmMw2fMargs3EJqWHy6a9TJO
	lBYf5uGDXH1o/FwjZeNzww8=
X-Google-Smtp-Source: APXvYqx/U6Wa7o2LMPNWdde1lff/oBmQphi6S47v2FKj4Wa6gluBqx7FojZ8CIfyT5uVOgzPyRf9xw==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr8321365wru.4.1570715408548;
        Thu, 10 Oct 2019 06:50:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6889:: with SMTP id h9ls1403151wru.13.gmail; Thu, 10 Oct
 2019 06:50:08 -0700 (PDT)
X-Received: by 2002:adf:fecd:: with SMTP id q13mr7529760wrs.224.1570715407996;
        Thu, 10 Oct 2019 06:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570715407; cv=none;
        d=google.com; s=arc-20160816;
        b=OUHmBMUldG28mrYJQiynWmi30xSx1eX7MCAj7tEH9HrA7Es3LeMjq6roIgS64p2blw
         Tb5/BV3psC1Yzh2I1kuu7M0i4A8/3OObAKuHMfUl9t57BOgU1IGniXlNPCcUXeKGuyAQ
         G05V+4arYxXgYhbiNQy0rlmCNKqcdf8O7sRFtEmTB386IeWywTaKJ6i/5ZuYA7mhdhPX
         87hR7YhVBztLHOQtWJS3ZKbQH5jrWwi6yvjqRTBy8vnBYBqn2wB7QAg0+OWAi9WA82nr
         jmmsxphdVDmBC6B3R7Skfyige3zKHxgtKhBv3lEY1A6Gv3a49ptSZXq/bKO6OE0GNjKI
         Gucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=CbOHDvO6gcJrZtZfDdJYGWVlQUjK0JUJ6T3YeADzxPc=;
        b=uTNV7w35vFeWq3zuv1UR3KCa1LxvQz+Xn8wFleBLClp/+LuScLp0unV0uRT0EhVTQW
         k2K/Z5st/381pUIffspDCay5IshrZ4UJPzvOPrK+KFZM3JxYU5Ivoh6y8xoHmz2FDAhs
         Cf+xtDw3O9b73H+zpyS9d1UH6Oc30pCPtOMaQxpB50iOTZY12JPvQT8f7kX7Kdehb1ld
         bD41dZNgZ18v3RQyujpT6RYRD4kOgvV1ngJLMW+SdQ08PLU3NKKocKRN3xXzUDFYQ8dk
         dROhu+ne4qhlrxp1FrYIaRBBjEkqOkE7bHVHfB2eRFU+xqDnfCj5R2hRCjyxxrWpOwZa
         9pfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id p5si261543wmg.0.2019.10.10.06.50.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Oct 2019 06:50:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tip-bot2@linutronix.de>)
	id 1iIYpN-0001jx-6O; Thu, 10 Oct 2019 15:50:01 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
	by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 92DA71C0082;
	Thu, 10 Oct 2019 15:50:00 +0200 (CEST)
Date: Thu, 10 Oct 2019 13:50:00 -0000
From: "tip-bot2 for Ralf Ramsauer" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] x86/jailhouse: Only enable platform UARTs if available
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Borislav Petkov <bp@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>,
 Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, jailhouse-dev@googlegroups.com,
 Juergen Gross <jgross@suse.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, "x86-ml" <x86@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20191010102102.421035-3-ralf.ramsauer@oth-regensburg.de>
References: <20191010102102.421035-3-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Message-ID: <157071540044.9978.10617239388480450385.tip-bot2@tip-bot2>
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

Commit-ID:     7a56b81c474619fa84c60d07eaa287c8fc33ac3c
Gitweb:        https://git.kernel.org/tip/7a56b81c474619fa84c60d07eaa287c8fc33ac3c
Author:        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
AuthorDate:    Thu, 10 Oct 2019 12:21:02 +02:00
Committer:     Borislav Petkov <bp@suse.de>
CommitterDate: Thu, 10 Oct 2019 15:43:59 +02:00

x86/jailhouse: Only enable platform UARTs if available

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

Query setup_data version and only activate available UARTS. This
patch comes with backward compatibility, and will still support older
setup_data versions. In case of older setup_data versions, Linux falls
back to the old behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: jailhouse-dev@googlegroups.com
Cc: Juergen Gross <jgross@suse.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: x86-ml <x86@kernel.org>
Link: https://lkml.kernel.org/r/20191010102102.421035-3-ralf.ramsauer@oth-regensburg.de
---
 arch/x86/include/uapi/asm/bootparam.h |  3 +-
 arch/x86/kernel/jailhouse.c           | 85 ++++++++++++++++++++++----
 2 files changed, 75 insertions(+), 13 deletions(-)

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
index cf4eb37..6eb8b50 100644
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
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/157071540044.9978.10617239388480450385.tip-bot2%40tip-bot2.
