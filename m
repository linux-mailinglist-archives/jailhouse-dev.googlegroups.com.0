Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIWX5PVAKGQE52IMGTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC294D0C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 20:34:10 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id q45sf2602138eda.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566239650; cv=pass;
        d=google.com; s=arc-20160816;
        b=O2nPLE8xcuanDx5UTNRJYh/bVQZwPnAvYMj3ZkxU/rdU18RHH5M0vqdUMg3uTaBvF/
         J6w/GjhRLToNWpcyhHr9CnpPkrgG5gj9luSUpc8hiNThcQtxciM1jMYOZQaIqT7WIY9r
         km9GLqM+VTTIUH6XitdyRWZilNHQpSkzNuWLC9EXBuPP0dv+eAwmKUdfrKliKc2ShCaX
         dqf/tQtTFpWNsmS7zzIpiprkpwY7Cdmw5HtglSdCgBBofIT0BgfFhBAMKlBJZvRzwe6c
         rMqt4AUFGiuXZt3RrMBWH7Di7JcWAcPJLXfsxbTiX1ruKR0hXYKHCmIqtWH0jH6Vkd3D
         tSpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/UNnk3Wv6Zc2Vxh/Sw+G1xaH1zE8HKeyUxnSPYDKhzA=;
        b=ZgKksZ4HLKDgHAdUYAhYQ5eSIyVWSYxvf9AEhjL+9Y6Dk1TpclTHJjzRnDvO4EDiXg
         fJun/hykmEEQcPnEXNzVl994nJ5nKV22eBAL6xQ7To9k6QyhrTgD7/g5Q7F8uFooGUi0
         pUz07X+gS1YayOW902K0AghKRNFCGcjwCYsHmUL2JUYAzgXxmQnt7rCOSynFm4Wot5HC
         Y01orQvbiWSQ6GxEvnvct+DEkmikgF6Udut6Npxo2h2n2pOPJzDL9ZIliA7gepCO5BKA
         K4yG4sQe6RDl2TQZxrDGNnH+yi6tir/0cN4bHcz0V7l03jPKFxqZrLuEm5UFmF1DV7cV
         TooA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/UNnk3Wv6Zc2Vxh/Sw+G1xaH1zE8HKeyUxnSPYDKhzA=;
        b=awjUSSDwp+Z7atZdTNq5P6apjpHERjktZ//r1K7VMvrMyvCQMWLPvsqC6q5Bys6m4F
         wYu+rVzlFK5xQYU7n/TkZrPPyZrz/RLRShIEBytNThwtGNnXJac42BkvPCCj8Rl+SEnP
         M1/WUpgaCMlJuydUO/MW9Cs8lY2yNY0EXk6rU1NQRvO21E5g30XvUMQTnxuspJ/zrgf8
         LL/9PT81ynlXkKuwCBYbKhCUlHJNI4wumCi+uX/5qGqnRt4LzriBN7fw1W+s+XnOzQ/8
         iayxxjbb6c8r1MWLlSUZ2XBVpVnlk1GB8EAKohwl2zan63HfrbIEqpsdgOKnNDDsjGu5
         M21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/UNnk3Wv6Zc2Vxh/Sw+G1xaH1zE8HKeyUxnSPYDKhzA=;
        b=gxoaTDUAwzWOqjA/KzKTfUy0WdOnEZDPZ02JQpqIS2V+WP+svF6EP7LgYFUo1YAwX/
         SBwv/vUOTZ2OCRM5yTCwlQnW3svS98nTTXwTvddaZ237QF04J9YKHjt43Y8Mb1Dz7YQu
         EsdE5lW1oXHoZVQMlFPW72tsRgqu4glP1obPVyjAU2vE00cfsk8J2UGFBwNWhWY8y3GD
         OO1EnS3HOcnsAvhvGsKCrRkrRnavz00kv3+hvi0Zqb13LmIn39VEmOon+pgLd1xGpUiq
         bexZJCIkYdB7DXLuOMlQeaVx49VZTI/EuchXFhfKo8Ad/pRyaH7NcSmDorbQ1gJaL4q8
         /0Bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2tmGE9vmUYJb7D2cLmWZozIbzi1JCWPXogvGLpk+SMfXvUeCv
	07ciy6dmPyrWslfvCaTHS9I=
X-Google-Smtp-Source: APXvYqxePsb7252HvzonglCuz16wFk6/y25QzWwHqHIVDlF0Vv6KdQkqVCU63E4J0EtMp1j/fah9XQ==
X-Received: by 2002:a17:906:ad82:: with SMTP id la2mr22922192ejb.123.1566239650607;
        Mon, 19 Aug 2019 11:34:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c456:: with SMTP id n22ls4482472edr.0.gmail; Mon, 19 Aug
 2019 11:34:09 -0700 (PDT)
X-Received: by 2002:aa7:dc5a:: with SMTP id g26mr26947810edu.62.1566239649930;
        Mon, 19 Aug 2019 11:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239649; cv=none;
        d=google.com; s=arc-20160816;
        b=AYIk8e39/005FoalDfsDnotNxPLQJjqws+RL9QQ6vv7UiDkKr+NBiVcmn3wqb3TgJf
         nklpWWpmf9WvHvRm840TCbXXOVMozizFaJG1s1hO52SMAt93WXyFnuSLgTI5sfUbMsoI
         AuLUgqu13OVd3ipNHtcko6h8xoQutoubReCoTqadIKY8SXoFEzKx2Xm4vZ8RaGj/Qu4P
         ur0kN12vJwHLJC72+dEIC1gvj/skpWZPsD06sbZr5F0KrNXHix7kxGOBPPVnfq4pYm4k
         r4NqIQvERUCl8DgKpR/odFj8IOoBayGQ7Knfg4TpRiIhGXkHZFxqEXunt8S9EPHDBBaX
         vilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vMwvpVbDkNnQSi6yqcJu5sTOBHRPVoSw02K3Gv+Ho9k=;
        b=Xll6H6oyVNmVNYYExuM5OO7YFpDMaYy+s8KtTm00sv7iVzCuiIOvW7MQWMEWtLOB0E
         eBoGdhK/S6eK1h9oMVjf6v7FE8oYtyVHiZreA4u+qU7FuwmCiipo+h7KLTM8iFNAkcmK
         OQMmmIC2FI7+lp7uILBAiD3XTJL/3oxQcRIqMv4J4Klvv1KJS0hF6qBEczXag/2BrOkf
         85PiLbkkhSk5h/eqnAOS4Ww6kH6fSnFGckCWAANcnXuSPdCObl/9/19BY89ag2RQrzBl
         DpjeedBJQ3itprYotFiD07VKwOOztN0GN+g9Awaess7OSFWZzKXLOG7SamwhRkWxa+5s
         4Lgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id m16si1003472edv.2.2019.08.19.11.34.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 11:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46C2dF2rcmzy51;
	Mon, 19 Aug 2019 20:34:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 1/2] x86/jailhouse: improve setup data version comparison
Date: Mon, 19 Aug 2019 20:34:07 +0200
Message-Id: <20190819183408.988013-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
References: <20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.8.19.182717, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.8.19.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
index 108c48d0d40e..fc65ed3346ac 100644
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
+	memcpy(&setup_data.hdr, mapping, setup_data_len);
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190819183408.988013-2-ralf.ramsauer%40oth-regensburg.de.
