Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB2GW3HVQKGQEDI5YL3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B851ADBD2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Sep 2019 17:10:33 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id r1sf4598558wmr.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Sep 2019 08:10:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568041833; cv=pass;
        d=google.com; s=arc-20160816;
        b=T/Vg9JxJygQCKNmeUrNZBQmkuNVLmPh62OyUYfHGediCrH8L2H4WLiOHP1RDv1Gynz
         xi7UCA63NnctIfbrNL5yKyJzEyuQeh9D/q7kOAZEMaeLhDKnD0eJWYJVkzkNXP75A5Ih
         JRjqdzjDDp6Hd9VQfonLsSMM1KbkmRXJHpPorPYw4/nBKEiuNY9BGb8paLzGBKj3UfCM
         K+xP+y4mFud/NV/7Ho80agLATcm2eBsXMDu6lNQnquGN6v86ZQ+hp66h7I/kctOFdH2U
         lji8CGZYfKuu4bk4/UmszYmwIat8CZ3qGCT7i7cHPESHHrIYq5P4R/3UKly9652qNwlI
         RxlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kKmcI7vg8to84N9lgmdIp1PK4uIvRDbXPgpuMAJzvnU=;
        b=NhwA3g0k3gYFGHmiKVuZHlKNa5yomk3LkOvJRUeFky005NwtgF2HPMKEwKla++ofrK
         l47YyDvwHalhZbn7eQXKDyVHcg8bYAvinmocM2MxTH64swMTt1khM6xBliNETmOw5bh9
         YQY9QNeS7TlrQjfC7EMa1Yq9L+GvDmQeUJldA+nzUsOVUAebCvskwW2ab3/x8J7LNjGK
         JSzt+9C9TDwY7tfnwy3qoThNKlwJI1VSEzSao0Vxa9Lr3dXqhs6kMuxOxf1avCHXaFcX
         vTVBHrDufvLqL403TWWOmbu+4omQbLnsXYXd+1aHDaWdh+1ceddBLt2SNv5XVTGd3GGV
         X/Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kKmcI7vg8to84N9lgmdIp1PK4uIvRDbXPgpuMAJzvnU=;
        b=m63ADUyd/Oxj6v5aI2pQbBQH0v/gM7bT6EJFewHEWR/u9ljlGaZU+O9Xp2VTEfv9Il
         /sdcXnCp5sQovKyXhq68qzxBCrRH2Vp7hWLzJqGNCLCbspJxbucyM4lRNDo/WL0/h1qe
         VdMH8TgibvGi9CwaOAsG+dY++QEOTDIZpqVFau+m0mPWATLn7NMXmOhpyiwtl4zmdapc
         rZbkDGLBWeOTZWPOWIUZcBkoSaB9EiWKsZ8M/m0V2qJ7CCUccfdqO73LjmATqvPXXK1T
         Z89Y+i80Tt15NKF1kIH7v2/xYWFKXcIrDX9KEc44bh85x9BZ1qd0Cb8cNPa6IpYRnJwA
         BYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kKmcI7vg8to84N9lgmdIp1PK4uIvRDbXPgpuMAJzvnU=;
        b=DrQuvhg0eYzwDAcJtCF8OPEITQMAHglNmkvxyl2dT3RbO2i/dxQmkK9rcAARSbmLy7
         Dd/7DDP96ya1hrEBFPsCk0vjc92kmyJgckbZpsuxDO9zwVWaTQiTo1BzloQVviif1IqY
         yO6Q/YGaXq/YWbwxbRya5PJqQIiKExjDOlYUGANJf7XceF1s36pRA0B1zqzGdMkSBHs+
         bkPJ1lj7/bc2VFY9uJm6suJ+ohdaIxgnPmBKAUBLd2v7uANz4ugVxVHtpLs+Evzsw3wo
         SQmeG+tjoKhadxEAakYfspi1eDyOPQATWYeNgfptS9JHZ+ETRCv998nqCAQkSZL0afty
         2Xkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9HXmtwfCB+Ru/o+bZY/4kArV/UTxzIVBf24qodeGugU6wYtYG
	VOTNEEXI8hfrlxLM0jK5rOU=
X-Google-Smtp-Source: APXvYqzeN+V5LFfopmSrnWbsAotqtfXFXWCMELDmaJOsV3KzatVCrav+d9cO+LThDWc93z8G814PdA==
X-Received: by 2002:a05:600c:2151:: with SMTP id v17mr19788165wml.69.1568041833157;
        Mon, 09 Sep 2019 08:10:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:660f:: with SMTP id n15ls3967597wru.11.gmail; Mon, 09
 Sep 2019 08:10:32 -0700 (PDT)
X-Received: by 2002:adf:eb49:: with SMTP id u9mr1057391wrn.235.1568041832456;
        Mon, 09 Sep 2019 08:10:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568041832; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUxBKyvieUWAMJad90jooe9+wyHn3KtJ2CQ67hdRVdLT97b9RosxlnW8njuSeP1Oq0
         uTHjQdQu32XGPwcNg9CXzjsdgDdis5AsjY+T983oWzf14h0khEc+8eyws22XZba4sg4g
         ZLLWlZ4iGIv7MZY9jwimmBkPfb5YIBAN2Lvk5Bcd9on1WnwhmgEKSty3O32uppABCoa6
         HfwOSgs6gAPZgNFlJWfaTQfiXQR2wrGfyqD6tq5RwGoGnUfKFhhKd1LvmQnGhAqOkXOF
         jDou4QFBI6KyjgbdbiA8+wwyUr5/sIcGi/O4Yi6kL3bU/8OmijR97QkjdmqwfpLUw1vV
         YmmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=oFqM6QUrpY6dkDzLf40RIhZJN/1XLtVz/4B8pa3SfCs=;
        b=vtDVMvVLraMREn+OO42vvvVx/fBPrS4uy4wh9iVuA6ddtO+ZPXRT7YisudHr1QENm1
         2Jhdfdw7iORYly2W6Lx50hzBkn5NHlB1JeabZcs6SNRN4X8uB5ZnYBwdTD/Lejka2QWA
         LsJCntsCn6p8u0HssFTYvJcLk4gtXHZ5cwKcO0KxdSlBW0nMdFp0E/i7w8V1mcCjVSqj
         O0zkoHHdVdOqGeCCZgCDr5T3P/D+9dxMnJiWoNUO3XeAsh31StXIEXA1zPjnY9kBncvf
         x7PFXvSOa45oN2wUMNnaoHlcvrGX9gAiei6me79vLfGQ9kdiQ5PZaNNWcqvYNcWbtVT/
         JFXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j23si13139wmh.3.2019.09.09.08.10.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Sep 2019 08:10:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46Rs6b66sDzy4D;
	Mon,  9 Sep 2019 17:10:31 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v4 1/2] x86/jailhouse: improve setup data version comparison
Date: Mon,  9 Sep 2019 17:10:29 +0200
Message-Id: <20190909151030.152012-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.9.9.150318, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.9.9.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
---
 arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
 arch/x86/kernel/jailhouse.c           | 50 +++++++++++++++++----------
 2 files changed, 44 insertions(+), 28 deletions(-)

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
index 108c48d0d40e..d5400a1503d0 100644
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
@@ -138,6 +140,7 @@ static int __init jailhouse_pci_arch_init(void)
 static void __init jailhouse_init_platform(void)
 {
 	u64 pa_data = boot_params.hdr.setup_data;
+	unsigned long setup_data_len;
 	struct setup_data header;
 	void *mapping;
 
@@ -162,16 +165,8 @@ static void __init jailhouse_init_platform(void)
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
@@ -179,13 +174,26 @@ static void __init jailhouse_init_platform(void)
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
@@ -195,6 +203,10 @@ static void __init jailhouse_init_platform(void)
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
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190909151030.152012-2-ralf.ramsauer%40oth-regensburg.de.
