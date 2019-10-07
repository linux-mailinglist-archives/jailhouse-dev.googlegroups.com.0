Return-Path: <jailhouse-dev+bncBAABBA4G53WAKGQETQTCOVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-f55.google.com (mail-wr1-f55.google.com [209.85.221.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA59CEBB9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 20:25:07 +0200 (CEST)
Received: by mail-wr1-f55.google.com with SMTP id l12sf1848619wrm.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 11:25:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570472707; cv=pass;
        d=google.com; s=arc-20160816;
        b=hN9LdWrL9hGtYWqNrdld0NDjQXFmVKgP2z7noSH0+8OzyIB5qTeMKXdmwnDONjx2ou
         y5bzKcoYsg/R9hOKPJGzrVLHDicGUj4WvRsx5MuTeRk/FxfH+JkUxiK1tnZBI6BvxSMv
         USTuit+JHs+JY8KJysD3CzPAUdznsSYRJtXM2fU5dNDlGQ/Fe3n7BhRO41piUiJ4qK9j
         UkT3VGS48H5/0es0A5vFr0mRGiEioraIui+hM48ExVj2Zw6rUqyNIg8qXHVjYvabO8Ni
         SQBpCxfYh1TQsTinQhLWS9fCwHdc/ghMYTVfLdv1xEZTcQMLijxrqkKI3zp26ov5b8qK
         W3PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=cnydbefUzlvNw4zf2DKSg74rU4KdYnYsJ/ji6FyUSe4=;
        b=hXmSv36qTYW96gmhax88FqtlSpwQqkj2gXWLMZEU/H/61/U5+K6Q6ZEwCh3IdIYi3I
         kvDY50wzMWM1CIH9+94aaN2haFgacwAkKM1/Uqgz+38UVZFDR2wIQA1+ulLSmWphchRQ
         5oHZ8Dgx9cZJ+Fy9JcGY2xPmNtXPWmCXLHogXgZ5W7/6+aW+Ia2sOSRwIhkr9sKrSvve
         BOJdaKWE5Ze39zs/JvIQcuSOpi5/Q7t5OhRMNjwktRhRSH+iepXdqlnSGPdIPZH0+KTy
         FVuoszJJ8kpWXzWTdW+W+NBrFgz7EelxAqf66WUFg9FZqY8p1WZSQCBfCYNDhhGiSLHL
         bJ0A==
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
        bh=cnydbefUzlvNw4zf2DKSg74rU4KdYnYsJ/ji6FyUSe4=;
        b=mBuo9SHKW1teyAhpBIzllKFUZGWpw+TrKeUAYrWd+XW+G+sQEuONsLFPO2l7WWiZUl
         cdDP0DURFQ6vt/oXdn7g5F9f+rG0VLjnPmI1PPFHeK+iemgWHNgt4AaDe2IWm/L/2Mcp
         /W5VES8HccrJ1AmvlVKzws/VvEKGqP1TcM834MEFrRhzPS531Kjr0RGUJDTbO08DTjR6
         9TS9ivuIriFysWou7Q7+gfFyjcg8Xrf28f31oRbRUMyl6ktShEQeJLh/9e1/s8Te5pZU
         Bf/bQOXWJT/kqHaVkIq0rA20xDwen3cP8PBBmEEpaEXTpq9JHDn4VH2ZKbKce3AZnvy0
         FEVw==
X-Gm-Message-State: APjAAAVv9ExX76rNiwaYPMBouEJ9a7PXLNPT2QTVLSYNLohA5klldvPK
	kfjDsG41MMSQoZvBfHG0t5s=
X-Google-Smtp-Source: APXvYqwk1EZajMEL/A3aqKwd7w4BpC5qKtcXTrjmpinrWrfmHkAkkkb1BVad8VZVWoBEjEflRMR2Gg==
X-Received: by 2002:adf:f190:: with SMTP id h16mr3210724wro.357.1570472707459;
        Mon, 07 Oct 2019 11:25:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9d8c:: with SMTP id p12ls221425wre.1.gmail; Mon, 07 Oct
 2019 11:25:06 -0700 (PDT)
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr9818134wrv.235.1570472706878;
        Mon, 07 Oct 2019 11:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570472706; cv=none;
        d=google.com; s=arc-20160816;
        b=V4gIvstHDhMGcoOfP7Bxe9xhzPT7RyzYTY9dgEdULqCRnagVjouWuflHqbdOwHNusM
         4tz2D2nXFOZdAParYQqY9iES0iO4wG9+dUlNv4uA0uEvIbiZzixzVJWem818Tw211R+h
         Jwj935yy7EX9TtjmtivaxdN00N7GlMglfbHWceQWhbPpeDzTrCtwv3J3eE59CAkHD+hV
         4QBWXZoU55ztNj8UuwOjdWrux6pI0b4GlBfvLf3wV5zlZAITRwvLBrBy9ghuEh5wT5aO
         oO1QTXBJfYeXCDamUf6j7Hd1RK+I+LEJdE2v7vAnc8tGcXvvHr71xDEJ5L+fjcb3CqIY
         slqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=nSk3gDCdiKujiI/MfH6yqJo2X7eLRyqcUNRevhIQCPM=;
        b=0keD45nF06FsoC+IgenXXrzUPv+jf4vlJZuPgXUzBN5oARBTIaQ0AUugldtBlQlsWE
         ycfwOICBWWCGQD0VE7l8tj4Gfq37PaU2hkepQ3IqStuaS/CyMTrvqBRPrv+CsT0TtQCR
         VIJUCvEtA4QBoAqX+LhwreCDvcXMswCXHEdhBeJkuhhDu+1crZXtCQ0DumgvLhE4L84v
         tjF7P++qnzL3i2cnOsCZ/m+zB+4W6AEGKAQwQsIDPDiSFn4ISnTV1BKydtAolT0QGiyt
         QZYUGEdy3nN8HiNQipi+1Ddk3e2EFR45QpBViOskaWhg0tHQJg37ra2n8Kgt2g7P1d1O
         eJ9A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id i7si850618wrs.1.2019.10.07.11.25.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 07 Oct 2019 11:25:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tip-bot2@linutronix.de>)
	id 1iHXgv-0002LT-4R; Mon, 07 Oct 2019 20:25:05 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
	by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id A286D1C079B;
	Mon,  7 Oct 2019 20:25:04 +0200 (CEST)
Date: Mon, 07 Oct 2019 18:25:04 -0000
From: "tip-bot2 for Ralf Ramsauer" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] x86/jailhouse: Improve setup data version comparison
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 jailhouse-dev@googlegroups.com, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de>
References: <20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Message-ID: <157047270461.9978.15691766559763031669.tip-bot2@tip-bot2>
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

Commit-ID:     a980bfcccf1ebd7cc404c381ca747191e17bc28f
Gitweb:        https://git.kernel.org/tip/a980bfcccf1ebd7cc404c381ca747191e17bc28f
Author:        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
AuthorDate:    Mon, 07 Oct 2019 14:38:18 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 07 Oct 2019 17:35:50 +02:00

x86/jailhouse: Improve setup data version comparison

We will soon introduce a new setup_data version and extend the
structure. This requires some preparational work for the sanity check of
the header and the check of the version.

Use the following strategy:

1. Ensure that the header declares at least enough space for the version
   and the compatible_version as we must hold that fields for any
   version. Furthermore, the location and semantics of those fields will
   never change.

2. Copy over data -- as much as we can. The length is either limited by
   the header length, or the length of setup_data.

3. Things are now in place -- sanity check if the header length complies
   the actual version.

For future versions of the setup_data, only step 3 requires alignment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: H . Peter Anvin <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: jailhouse-dev@googlegroups.com
Link: https://lkml.kernel.org/r/20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/uapi/asm/bootparam.h | 22 ++++++-----
 arch/x86/kernel/jailhouse.c           | 50 ++++++++++++++++----------
 2 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index c895df5..43be437 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -139,15 +139,19 @@ struct boot_e820_entry {
  * setup data structure.
  */
 struct jailhouse_setup_data {
-	__u16	version;
-	__u16	compatible_version;
-	__u16	pm_timer_address;
-	__u16	num_cpus;
-	__u64	pci_mmconfig_base;
-	__u32	tsc_khz;
-	__u32	apic_khz;
-	__u8	standard_ioapic;
-	__u8	cpu_ids[255];
+	struct {
+		__u16	version;
+		__u16	compatible_version;
+	} __attribute__((packed)) hdr;
+	struct {
+		__u16	pm_timer_address;
+		__u16	num_cpus;
+		__u64	pci_mmconfig_base;
+		__u32	tsc_khz;
+		__u32	apic_khz;
+		__u8	standard_ioapic;
+		__u8	cpu_ids[255];
+	} __attribute__((packed)) v1;
 } __attribute__((packed));
 
 /* The so-called "zeropage" */
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 3ad34f0..b9647ad 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -22,6 +22,8 @@
 #include <asm/jailhouse_para.h>
 
 static __initdata struct jailhouse_setup_data setup_data;
+#define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
+
 static unsigned int precalibrated_tsc_khz;
 
 static uint32_t jailhouse_cpuid_base(void)
@@ -45,7 +47,7 @@ static void jailhouse_get_wallclock(struct timespec64 *now)
 
 static void __init jailhouse_timer_init(void)
 {
-	lapic_timer_period = setup_data.apic_khz * (1000 / HZ);
+	lapic_timer_period = setup_data.v1.apic_khz * (1000 / HZ);
 }
 
 static unsigned long jailhouse_get_tsc(void)
@@ -88,14 +90,14 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 
 	register_lapic_address(0xfee00000);
 
-	for (cpu = 0; cpu < setup_data.num_cpus; cpu++) {
-		generic_processor_info(setup_data.cpu_ids[cpu],
+	for (cpu = 0; cpu < setup_data.v1.num_cpus; cpu++) {
+		generic_processor_info(setup_data.v1.cpu_ids[cpu],
 				       boot_cpu_apic_version);
 	}
 
 	smp_found_config = 1;
 
-	if (setup_data.standard_ioapic) {
+	if (setup_data.v1.standard_ioapic) {
 		mp_register_ioapic(0, 0xfec00000, gsi_top, &ioapic_cfg);
 
 		/* Register 1:1 mapping for legacy UART IRQs 3 and 4 */
@@ -126,9 +128,9 @@ static int __init jailhouse_pci_arch_init(void)
 		pcibios_last_bus = 0xff;
 
 #ifdef CONFIG_PCI_MMCONFIG
-	if (setup_data.pci_mmconfig_base) {
+	if (setup_data.v1.pci_mmconfig_base) {
 		pci_mmconfig_add(0, 0, pcibios_last_bus,
-				 setup_data.pci_mmconfig_base);
+				 setup_data.v1.pci_mmconfig_base);
 		pci_mmcfg_arch_init();
 	}
 #endif
@@ -139,6 +141,7 @@ static int __init jailhouse_pci_arch_init(void)
 static void __init jailhouse_init_platform(void)
 {
 	u64 pa_data = boot_params.hdr.setup_data;
+	unsigned long setup_data_len;
 	struct setup_data header;
 	void *mapping;
 
@@ -163,16 +166,8 @@ static void __init jailhouse_init_platform(void)
 		memcpy(&header, mapping, sizeof(header));
 		early_memunmap(mapping, sizeof(header));
 
-		if (header.type == SETUP_JAILHOUSE &&
-		    header.len >= sizeof(setup_data)) {
-			pa_data += offsetof(struct setup_data, data);
-
-			mapping = early_memremap(pa_data, sizeof(setup_data));
-			memcpy(&setup_data, mapping, sizeof(setup_data));
-			early_memunmap(mapping, sizeof(setup_data));
-
+		if (header.type == SETUP_JAILHOUSE)
 			break;
-		}
 
 		pa_data = header.next;
 	}
@@ -180,13 +175,26 @@ static void __init jailhouse_init_platform(void)
 	if (!pa_data)
 		panic("Jailhouse: No valid setup data found");
 
-	if (setup_data.compatible_version > JAILHOUSE_SETUP_REQUIRED_VERSION)
-		panic("Jailhouse: Unsupported setup data structure");
+	/* setup data must at least contain the header */
+	if (header.len < sizeof(setup_data.hdr))
+		goto unsupported;
 
-	pmtmr_ioport = setup_data.pm_timer_address;
+	pa_data += offsetof(struct setup_data, data);
+	setup_data_len = min(sizeof(setup_data), (unsigned long)header.len);
+	mapping = early_memremap(pa_data, setup_data_len);
+	memcpy(&setup_data, mapping, setup_data_len);
+	early_memunmap(mapping, setup_data_len);
+
+	if (setup_data.hdr.version == 0 ||
+	    setup_data.hdr.compatible_version !=
+		JAILHOUSE_SETUP_REQUIRED_VERSION ||
+	    (setup_data.hdr.version >= 1 && header.len < SETUP_DATA_V1_LEN))
+		goto unsupported;
+
+	pmtmr_ioport = setup_data.v1.pm_timer_address;
 	pr_debug("Jailhouse: PM-Timer IO Port: %#x\n", pmtmr_ioport);
 
-	precalibrated_tsc_khz = setup_data.tsc_khz;
+	precalibrated_tsc_khz = setup_data.v1.tsc_khz;
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	pci_probe = 0;
@@ -196,6 +204,10 @@ static void __init jailhouse_init_platform(void)
 	 * are none in a non-root cell.
 	 */
 	disable_acpi();
+	return;
+
+unsupported:
+	panic("Jailhouse: Unsupported setup data structure");
 }
 
 bool jailhouse_paravirt(void)

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/157047270461.9978.15691766559763031669.tip-bot2%40tip-bot2.
