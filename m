Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTEQYXVAKGQENPF77HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A089C57
	for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 13:06:53 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id s18sf8713567wrt.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 12 Aug 2019 04:06:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565608013; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cr6PZOqlJynOTo3bgQPIn0PBnR+GxwruMykuK1LNDxQnfwGCSE6PBCtGMxcXHgsaZ7
         a411Yz/Ahad9sBGMlXb3PX0nH3BwWQU7KBgmcuSM4FSSlcSeKs8/Ph50RYrpPmZJndpE
         nbf8tY04pCLcKBRaow1Ro2iQAtDH0mKiaBY0b3j0u8RNwBHQeZ13rGr9dzIgo4tn9NYD
         Z2wHuaThoFMLAJbLJNU3jW/79/fwK1UHSZG/fT1uBFnfdYxaEOzXb4wX4Pmu4fpBwQMM
         9WZxLLmVCSVr3rHKi3VsSnOjAbYd8pZn9hpeGRgCHap+sZkTzNjUTSRPYFAtD4ZGuiVS
         MVTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LQz8HUULjz9gcsqXXwje48u6kvtWw8RQcLZjn5qj0Nw=;
        b=udFWP4t/1oONNKd7zRRi4ouURhr3oBVCcO8Wmjehs2keaouLUCEB52EpAme/s2FPDW
         iUfcFt3/KtOxjHiapL9ry7jtPSiBHBmTZTb5C/R0OODbBm7RYSvIBS/lNBS2A10jHiAf
         oDbTottMaycdG9SOK15BXCxCTHgWIH6YdmTmCnG6/X6BjoG8bw6bINSAimnQqDxvz1AW
         BtJCMD//dJw0OYx8v9hcpiurWt3snL2t3sHigdPUtK/8KUfZpSUl1kQSbSDKCYqMjr5S
         KFE7NmGNPvVbjs9a+regx45CcTFcHjHmWUaRObRtyNfz22isUL7Vaegq3lDaPsoz7UQC
         rwyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LQz8HUULjz9gcsqXXwje48u6kvtWw8RQcLZjn5qj0Nw=;
        b=mv9ve6rBW4/mAwgN57IAVZlpjYjAsdcZJN13LFCvu9+rejE2pI2SmOa+iXEnUCFVnr
         msXDeFVImqBVnISTShKIqcVhdtGZVFqRZCRs25YvsxQYV5zPowksIOSKt/qUxf5U5Jhg
         RN5Yer9fPHVbI4WruIEK9Unlh3umpEeCOqLVziRPaBRr4kzKqB9+ofd2rPptgVLiO46a
         V+7v3bBp2hDsbtvyT/kfjpW25nayMCmwuJkKL0HCZBWSwSM957ZvEa60ECXcZREy0wRA
         YBAGFAfwMxhcwFucVhkz1UBSagO7WhiruqCKfo7m2KSFZqozlJP79QiZNed7cWP/Da70
         aE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LQz8HUULjz9gcsqXXwje48u6kvtWw8RQcLZjn5qj0Nw=;
        b=sxLpeNiMmukn2lFFfhYLJxsADGtoD5jRcB8QiJgTaaqN5ojH3ux1ApTswFW5rXMX1p
         58DK7NzydK6TkknkHAGN5evvzlG1k3hPErLwuHhZlmyzXpsVnciVuNn3iuNwDqubgrrC
         6IDLKSiy2CrythiS3ZQPIsfnYwYpZ/ccHbWU33lki3nbYFD2WieqFgO6Go4m3YBqGHac
         nyizzuPPXhCglDKaV79QRat/yR12M1aRyRYW3LcCBNO8rzDt/m580ZNaBR2qmFK6/zts
         Vq9tNswg/IQPaqnHQGHfn9Ves3vhx/TFUukSBK+M3+WuR595AuZQCG40clfJg4SywSov
         vepQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4AjPt07m2WWFOZi8FgtV7gWVnYptkiaGai2NtFoomj9SkQZuD
	zlrpjCOTrnDM4lREUukr53U=
X-Google-Smtp-Source: APXvYqxPOUsKtJbNjeg3AYy2ZtIq+KIsjlo3DNBzj8SouHesNniLrQ7V3/A7v2Qf3WYh20tbNVLfxg==
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr11725840wmb.88.1565608013266;
        Mon, 12 Aug 2019 04:06:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7018:: with SMTP id l24ls3495164wmc.3.canary-gmail; Mon,
 12 Aug 2019 04:06:52 -0700 (PDT)
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr28376728wmc.89.1565608012369;
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565608012; cv=none;
        d=google.com; s=arc-20160816;
        b=E9/OQkwjYbjL3HSw5gUZVA4YqlyHa0mlDwgAZw1Dhzo7M6jgl5kQIVAiH7NLlmzOAH
         R88f3FHmP8pzjuXczZDtwgH77HhdbTxnaKSHTo9KiYZMwZLpTb0KsPqf08GfP5t5E7Fa
         3Gwo+VL6TYRyKEdHeoNPWpTFuErgQAFry9rTTT/uCUai06PkR8kRYWUy1IkzrKGcDsbR
         d8AmnU1BZSoG8TEl+Ib7LDSbA7sAPuYEjinQQzZFPMJ85Wu/VXpKJYNoRXbjKdJxDoPg
         MEnmceWNYxgNtIZXSRilalQ9JKVfZqrRTvOR/ZFgNMSJYWrgQBMCC+on5aArmv4A66tM
         kmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=InCJzYC+n4nFc507oLEe72H4Hqp/i9KhqigIPtlT3RE=;
        b=E2J8D4RA+ZtZ3d8zxHkoLcMc2baIpRt7f+I2GeKqAt0c1Ua1VZ7y2jcemQ1JN/IBTp
         wAm5j3ZdQelJOGSm+HAXbqvpSmCFEGfCEEZuk5dUkcUHt+v3S2Mgpe23E5Zu9Yapoa0K
         apYAobB5YCEnmzJ48KDPyHSA+rI9U4eH8OMcufr5eXAskGaxt1ugUY3ujxq9U3GiXfGK
         OXUed6IPnWNB/uXaC34ey6BI6Cn3tBJPVKcICH5rafs0G9/4BsEfuKICAjvoAXYMA9ah
         wRs18S7ATj90uEGEyKy3JSUwYFmFd2yKoMhYMazuxs68L2Z+nybZNSRRFnoMKGIMe+Jk
         hfYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p67si158040wme.2.2019.08.12.04.06.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 04:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 466Y2M6CYqzy7G;
	Mon, 12 Aug 2019 13:06:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 1/2] x86/jailhouse: improve setup data version comparison
Date: Mon, 12 Aug 2019 13:06:49 +0200
Message-Id: <20190812110650.631305-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
References: <20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.12.105717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.8.12.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
---
 arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
 arch/x86/kernel/jailhouse.c           | 49 ++++++++++++++++-----------
 2 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index a06cbf019744..6163b1afa7b3 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -137,15 +137,19 @@ struct boot_e820_entry {
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
index 108c48d0d40e..e5ac35efc4b3 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -21,6 +21,8 @@
 #include <asm/setup.h>
 
 static __initdata struct jailhouse_setup_data setup_data;
+#define SETUP_DATA_V1_LEN	(sizeof(setup_data.hdr) + sizeof(setup_data.v1))
+
 static unsigned int precalibrated_tsc_khz;
 
 static uint32_t jailhouse_cpuid_base(void)
@@ -44,7 +46,7 @@ static void jailhouse_get_wallclock(struct timespec64 *now)
 
 static void __init jailhouse_timer_init(void)
 {
-	lapic_timer_frequency = setup_data.apic_khz * (1000 / HZ);
+	lapic_timer_frequency = setup_data.v1.apic_khz * (1000 / HZ);
 }
 
 static unsigned long jailhouse_get_tsc(void)
@@ -87,14 +89,14 @@ static void __init jailhouse_get_smp_config(unsigned int early)
 
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
@@ -125,9 +127,9 @@ static int __init jailhouse_pci_arch_init(void)
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
@@ -162,16 +164,8 @@ static void __init jailhouse_init_platform(void)
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
@@ -179,13 +173,26 @@ static void __init jailhouse_init_platform(void)
 	if (!pa_data)
 		panic("Jailhouse: No valid setup data found");
 
-	if (setup_data.compatible_version > JAILHOUSE_SETUP_REQUIRED_VERSION)
-		panic("Jailhouse: Unsupported setup data structure");
+	/* setup data must at least contain the header */
+	if (header.len < sizeof(setup_data.hdr))
+		goto unsupported;
 
-	pmtmr_ioport = setup_data.pm_timer_address;
+	pa_data += offsetof(struct setup_data, data);
+	mapping = early_memremap(pa_data, header.len);
+	memcpy(&setup_data.hdr, mapping,
+	       min(sizeof(setup_data), (unsigned long)header.len));
+	early_memunmap(mapping, sizeof(setup_data));
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
@@ -195,6 +202,10 @@ static void __init jailhouse_init_platform(void)
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190812110650.631305-2-ralf.ramsauer%40oth-regensburg.de.
