Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPXD5TWAKGQEMQUHRZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD2CE1E5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 14:38:23 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id y12sf3424279ljc.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 05:38:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570451902; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNAX31XICKAhNn5DV5HJt3VDxlvvdymmI3NlR8uQ0fmyRPMP69H/XQPdZm4yThxY3y
         kP4lMVVnDhdtpiSrVlGYgXYfJ6wHAEd2mjuRCVDIwEtCDgIj+Gp2kSRyhVvusFgQPMq7
         EKPjzW4GGrKvNBheV6J0Xe2muiHPYqWaEAQbgDmj4IAdwrFCicWKT21ero5IV2j9MdU2
         jL9qePwwv6RaRm/0g+IDDfo0g97oDl5ACaoR9wm2TDXefDFGUT0/Y8ECs6JKzXq1rAkD
         781vjKqAQ5TrBV6XWzPRVe4CNHkdc2S12cxHv044Ce97nyfsm/dgZu4SJaPXjVOtvEEt
         rsCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VMItT9hZRjPAgPbSNvQgs8wYROwWkF/I13mRsS9FYes=;
        b=ZnqxudoJfZSZHlc/hRWZ+c78LaggqFEirZPsqmZU4YwFpsdVRKKo8qYzlrIFnVTy5x
         I2exZ8XXkpIQhEuH0zcJcoOninbKE77SvjAYe+L0Cc8dMdM7wcG4TetdbsBMFF8GwWeu
         zvrWri9COzESvrQOoghlsy5mL05Lr6MLQzCcaJuj1AP+H/NxQ3dqqxlF3F1wSB1jq3h2
         1KN98V8hTuDMCHwazqawwaLWzkG25wRO+zZqW3bXx8e46v/iE5zQv0V6fzvRC79QpNcp
         r6ZKsJF37FoMtvGMeocndZypQcJxQWsZ1fjO7peSQ8CTOOWNJrEQVeXa/Ol+zx2X/uja
         wEkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VMItT9hZRjPAgPbSNvQgs8wYROwWkF/I13mRsS9FYes=;
        b=E+GiE3kIarQIxNVsYicnwwwp3RrnOZwzxdCupAmrqdcEan16P5frAc2XVn0QJFdmn7
         g+8+I28b47Ci012/qRbrZ5Zs9FxMQjdZXqAoj3zs86kJ7Fynx+2bZRSKRlDMI4E8y225
         z9BhoIH0kmLzJdAACl/irzwVUTySVKwQvxSC5Rhidm7tFwyfMHZZ7HX8d0OSFL7RbyI2
         gS0m7+wHwXwjA4LPqq7TUUbm6ba+QHyN4pf72ZouJMuJWdEzs2D6LcUGis5Yl/UkP/vU
         wwDe4Eko6rrduxC7pQMtL2CAyaRL88WJT5c/9kaLGewmMNa/i2aB1RCzgGFRWGBEL6c+
         zzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VMItT9hZRjPAgPbSNvQgs8wYROwWkF/I13mRsS9FYes=;
        b=p225VyCt6QeXVEejVn1/QdVmDuH/qJqrY2bOFEm9a/aoee9kusPxzcdNoo5wJHIKWM
         Y10Dcc/PbvRsHSWPuTpAEiPQk/FB0jYVidxW9zkiYU2ZR7wBExd957Apnogas2G8mhVn
         bjPinZoWhIgKTjNGhlmBEpF4FndRiFscUe4bdSQeDiCmwynaJrJHWSlE+87lwPpHr0az
         mAOvyRQ9EjQ+xpK9Vta48HvcjZ16Xl9wujX4bpH8bozBpKGcJc+XO8GHiid2JRuklv8A
         WLnjgArJPXR3iZ/XAQgho4isOfSefjWpUejq5n6CBJ+bsWp1aBzLHzDJAKJzLxU5U1Q8
         4CJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEEY7pBag5Zt2lK3OT2srCxxxLI0CNdYezKzoes9YKP1hihp3k
	gbiLLWxJxfxmeGa1hTjgKMM=
X-Google-Smtp-Source: APXvYqzM6zlx/2qplV2cWp2crMDcxnn6TUwvTb3tBoJgu7QChRLLsDmQatQihV7Ed36tAFT9J9K7Bg==
X-Received: by 2002:a2e:b0c2:: with SMTP id g2mr18625990ljl.217.1570451902470;
        Mon, 07 Oct 2019 05:38:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c4c:: with SMTP id i12ls1511811lfj.2.gmail; Mon, 07 Oct
 2019 05:38:21 -0700 (PDT)
X-Received: by 2002:ac2:5983:: with SMTP id w3mr16290445lfn.121.1570451901753;
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570451901; cv=none;
        d=google.com; s=arc-20160816;
        b=s1r8UyOU57cAx/RJ1vEKdd4vbcjXRBKcBDcNHne/d6m/PXlfHzzYDsWo71jtGJTdzX
         oM41J+dAOuC36SBTJoPHUf5UR02nSI50/Y0qDfEzK1Ow92YcuqMMv2ZsX4ILt0eQX0np
         EJ9mJ8IqrR/c83IQEzq0Y/Ayp1hwB34Lcvk6aZewiJlwG+RQ+RprzMsRkwd1xeFAMlOT
         fellJ5KIOYe1L7GNCtpYzkLiKz7kA/9hDj5wv/CsKqpSM/oELNc/dy4+PcCBlqDs1PbD
         fpBE4QIP98GPJFFLFHQWFD5nAW0CrYDIE5V9QMZwZOK1zHmWrH5aUHqy/9zoTtiYEpp5
         ol3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=x1fkq45t3C8RkrGvul77X+nMBMVXXXxTYvwqYHtXfac=;
        b=iBSr31uMe9TAlC5MxiUPAJjfP9L/vjRJbCUTWIw3jBLZIjKiWUXoNRMGFAo09NCl5P
         tkhnJK4YZcb3bGlz8VR2a2Nth+I3XWwEN+vRxBegAEeeBzViU4B1VOyNkpw/9cmfaK3D
         n3sgZja0upxGyKEk1Ya8DC0vKgUepAx0OWn+xxXKNggGTXOuSOagdUzRVEiLmDsVVjR/
         V72T9zQTeQiZsWah0rcSKmoATIEfE3sVcQ3dyp18av7ect1IlWxSwQLW/4RL4pnxtY3E
         QTwzrXaEpUF8xS8DM88JkfWSZk/CnlR2zpc6mQnoaD9cwiu0WemEsha56Gof2guIxnLV
         ubSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id d3si888147lfq.1.2019.10.07.05.38.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46n0Q462mPzy7G;
	Mon,  7 Oct 2019 14:38:20 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v5 1/2] x86/jailhouse: improve setup data version comparison
Date: Mon,  7 Oct 2019 14:38:18 +0200
Message-Id: <20191007123819.161432-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.7.123317, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.7.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
index 3ad34f01de2a..b9647add0063 100644
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
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007123819.161432-2-ralf.ramsauer%40oth-regensburg.de.
