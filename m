Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBD4M7TWAKGQEVNIM4UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC6D270E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 12:21:04 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id a21sf3290498edt.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570702864; cv=pass;
        d=google.com; s=arc-20160816;
        b=lFxZp0kqC0Zul3bHwoFxPtCGa2UU7x4nRBNfwZIDOevIFFzcgquWym0BWZ+5SQwsvp
         5v9OLRsWKp3ZtedO86V2NvK2nawsOzDgpNveA6m4WzONOgY/cJduRgIcEhKyS3Z3yS9K
         b3X5C+2PpOXOaVqj8VfLG4MoBcKRh+SbGK10rXOR9I4exw6QrUlI2e+XXsgbHfwGzdYm
         5FYA0vNoJds4C+ehb46g2AAVxjZpdki+5PJKOao00FYGKCwtZAZ9PXEE3H0Hw78tWBpr
         pfE8LRzRGRvJtJGylhGLfUz9ZqtTL6OZmZ0tHPtUqENnhERYdLIWnetqiQaVISLqeJuo
         LxTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Cz0FSBO3QMhO4NFMsRn7cQOPXVPyWqdDlBYTclZbjH0=;
        b=oQfcXiw0Y/bcfRVowJ3PFypU7dRBwfO5KeRLD0v221NU4VDOaNhSC867gdUl1aIUUz
         BqFNfHwAR/L0Vl7sU89LvfZ54wDF+jVAdygMoQz98H+gPEQTJ9EcNUlCayxsImzW/I0J
         vFRSFr59kXKJij/ncknXhH3iLzGoXjSdFLDmSLiQiiNGflf58SmpIbmKfttCNDcFX9La
         eQx6LWlFuejpEudI6pVzvfk7uy6UF/dXP6EALJWk0jjFG8b1Pk7SM4F2/+IemfNTkzoj
         ow4dtk8qXILB2Z7PLY5lnspEgc8zErucCzBj/4hGIkvUg5APnDndzzzOZCrM7GVkdhhC
         o4pQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cz0FSBO3QMhO4NFMsRn7cQOPXVPyWqdDlBYTclZbjH0=;
        b=jm9ptPpCC6n3c3svJapJwM381afOkPyxXRhyw4S0uBOZmfczXKTr/2FMdKMI9hGc6c
         9YfytANXLg2WhN12wbxE2OZ8n9rpyLdwY07R/aK7uAt1SiM/QUV0lrvrR1pNPNUhGkBT
         bsVXLOB7LGjPNGJPx7G0tV6bLHEW112zOc9AJcoZSCp/++c5ZirUiqWppa4uMpem8iab
         aloJiXs8j1q5+QdqYW1onomzoBA7JGKVqmZ+ZasoK/+N96/USeh8T22++Jfn1CXs2V/p
         4DQWcMzLqyYa9gs2Pa7TnDOdra8qXIH4T5jNHt0efHmtZZTle3iXagO3/WKNsW1MNSP4
         X+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cz0FSBO3QMhO4NFMsRn7cQOPXVPyWqdDlBYTclZbjH0=;
        b=VqhpJNdxrc/dOxZxsuk7bS2fDI2/YP7VsQabUaUl3e6winw7aIl9uHWM1WvoEqK/7I
         +U9oTdTbX/n3U0kZuOTr9utUUhTeYL30ys8N9eBsRGmZVTvgDwkoAEoGCyqtshKMduu7
         MtPmBcg8Q9t5XrtszXt6p11sLIgtTPUchHuST3AYeG+SqSWxsjotmXLCuy2gMQTx4uLY
         u91ZgasyR5FxoVikFmUwAUBxtM7Zt/DX++5wRlWkP2kVT443OZb4FT7oapvUVYcUlhXa
         CnU2UgwWC5BJz6j72DTCNmRTGYvFa7MNrJAKFNp398+1d3JEx4CP6IQPYm8L01gLIVgL
         oiLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW1p/MjziYMGJI4P9JFU5dU/NtnjMLoXfv/pqz45c5QfD403rxr
	NdPQqWTR9eVPvkkBCYsxsW8=
X-Google-Smtp-Source: APXvYqzBIwa6h9OkRV70pTdahBYSs4sA8/RlCphO66x3YbBsXdtz0y0lvfpp1j+GqYnbIi+Tbaas8Q==
X-Received: by 2002:aa7:ccd3:: with SMTP id y19mr7359828edt.122.1570702864402;
        Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:a585:: with SMTP id a5ls808816edc.11.gmail; Thu, 10 Oct
 2019 03:21:03 -0700 (PDT)
X-Received: by 2002:a05:6402:7ca:: with SMTP id u10mr7347627edy.20.1570702863531;
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570702863; cv=none;
        d=google.com; s=arc-20160816;
        b=y5BcXl/4LSOApPcXiy+hUr2c8Nb2eUPICJ8vcIxxv8rZglgndlRu3I0rQde7O+vsGR
         nUw7NWpSy4YPCYOt3LCKFNsKtmyWxEzUXDfNL60+e4/AzEU76xO73tnVikqo/JSPpR8T
         pD1aTxXvi2bBMAWV4eKFXv3OpI/U9NDfai55U3YAwanfjWOReU4IuehSnrr8InsOGyCo
         802LCekDXFzolalVSH79eYMF5+7l3B4GrubZg5BVrMiaUUrOiSLC1I4QBzhtLosGJAgy
         pQOS8F8j3NARdSLUdQr8j0ggcy1qX202vmWcM+ftLE2hoeJGXI02AOZy6O5t5L5Xh2K/
         mpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=98vdHPDxA3eHkmJ60e7za4MEpD/yyxZE89zEhvsHvVM=;
        b=T9QJsC755hbixZ3EYgYvvTK9XBfap6z09kz/+8AIohIB4KEGxdzdVXG3nnbYXPMVDX
         i6LmwP6HUnqVdpiKdOGmLmdeoNnpxK4G/W6qOr74JeedDUtHjM1q2ZhVT6iT9f8WaAmA
         fkOaAAXtPfB9OCv7sLw8RpMcu7rAnZ9gH5d6iJFqf0VZEzJaO1NQ+Za9Q9i8sZOjTTfM
         UeXn2L1XOJH0aW6Me2ltFFdSwZmDMUSe1NjfHAGi3xXUXEiNaM9Tlx0iOa6KLrCaFKI4
         PllPBTIw/eQqP+fpHA7PqeUggAwgmHiZBtWZrXyb43L1jVHK1MwJLTc/Gm7A+2YLCUdS
         FltQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q8si380313edn.5.2019.10.10.03.21.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46pnDG71rtzyJ4;
	Thu, 10 Oct 2019 12:21:02 +0200 (CEST)
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
Subject: [PATCH v6 1/2] x86/jailhouse: improve setup data version comparison
Date: Thu, 10 Oct 2019 12:21:01 +0200
Message-Id: <20191010102102.421035-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010102102.421035-1-ralf.ramsauer@oth-regensburg.de>
References: <20191010102102.421035-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.10.101216, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.10.5650000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Soon, setup_data will contain information on passed-through platform
UARTs. This requires some preparational work for the sanity check of the
header and the check of the version.

Use the following strategy:

  1. Ensure that the header declares at least enough space for the
     version and the compatible_version as it must hold that fields for
     any version. The location and semantics of header+version fields
     will never change.

  2. Copy over data -- as much as as possible. The length is either
     limited by the header length or the length of setup_data.

  3. Things are now in place -- sanity check if the header length
     complies the actual version.

For future versions of the setup_data, only step 3 requires alignment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/x86/include/uapi/asm/bootparam.h | 22 +++++++-----
 arch/x86/kernel/jailhouse.c           | 51 +++++++++++++++++----------
 2 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index c895df5482c5..43be437c9c71 100644
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
index 3ad34f01de2a..cf4eb37ad97b 100644
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
@@ -180,13 +175,27 @@ static void __init jailhouse_init_platform(void)
 	if (!pa_data)
 		panic("Jailhouse: No valid setup data found");
 
-	if (setup_data.compatible_version > JAILHOUSE_SETUP_REQUIRED_VERSION)
-		panic("Jailhouse: Unsupported setup data structure");
+	/* setup data must at least contain the header */
+	if (header.len < sizeof(setup_data.hdr))
+		goto unsupported;
 
-	pmtmr_ioport = setup_data.pm_timer_address;
+	pa_data += offsetof(struct setup_data, data);
+	setup_data_len = min_t(unsigned long, sizeof(setup_data),
+			       (unsigned long)header.len);
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
@@ -196,6 +205,10 @@ static void __init jailhouse_init_platform(void)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191010102102.421035-2-ralf.ramsauer%40oth-regensburg.de.
