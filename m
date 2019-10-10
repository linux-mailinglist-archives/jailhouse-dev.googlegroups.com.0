Return-Path: <jailhouse-dev+bncBAABBDPO7TWAKGQE7PKFCHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-f62.google.com (mail-ed1-f62.google.com [209.85.208.62])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEAED2BB0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 15:50:06 +0200 (CEST)
Received: by mail-ed1-f62.google.com with SMTP id d7sf3641751edp.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 06:50:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570715406; cv=pass;
        d=google.com; s=arc-20160816;
        b=hwbkvKMDZi3GYpWwQluGHgYkBrpDqzXQ9Vl43iFnq1eYaTNTUBtAprpdzApJHxqb1i
         ECrh2eGgP4YUoCkhNHkkLVni0mFqARyYDa/CCnC3W/f9nq0cS/dPcM9JyEouTuU+cJ1z
         4D14OavCKuWQn7QPyyvkqPtpILbxdNrVVGBLV5Fmkm6MUhw+RfJDyjf848FMTdlNvndW
         R3ki2n6wG3c6E7N+kNymhxK3zIr/dosjOnyBTvEIlb9wQ5+oVRZ/KYlkfwonfVmQRdJB
         OEEVVl5QfHlHj0Tzfk0AxUxMFma3d59ARBvg3dEkLt6jTtTgSTkh0pxUiwlOKD5O5U9d
         kD0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=Rg49l/+osG1gTqxJkkoVvJzLsf4VBZBGQr2/c/M97I8=;
        b=OsQxa/EbaYb7MFyKyNe8JBfg1f6fWjewniZ0NwRw+ophUbUTnGCBv2wsc0e83Jwn6z
         /F6X7an4vqTpbU1aN073/30NKW1Nak9w1r4sj208X9sit/XmAJpw/RuH51AoLeNjbI8f
         0ATNGJE4Apylo2ezjnUYoVN284bQrYUaPzBxNosJmwizfRSb/lzPlCDKISblLh4qFwvR
         iYdJq/p2RS/u9ZAkdFe0vugH0jpY8DBtdt5bvweC4PXymrpIKd1WV0Zpd2MoI548SUUJ
         iFlce3DJ+xmEKCspRw8MX6T+PBuawLbG8INbe7wqtCjuiM5JhlC3VpZ4hfFVNfhAAheF
         YF5Q==
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
        bh=Rg49l/+osG1gTqxJkkoVvJzLsf4VBZBGQr2/c/M97I8=;
        b=YacNkCukIFUEMQmj24KjGPIR1DEiIWUJ4QVFJnK53/InDKLysNUw739TA3XFgZ1DmO
         8RAYzvYBE5lZAh5wBP2kwE9YyjWohDKXt7GeFdu/F+YsZQ3BuoQa2IkmXKmfBjRj+f4j
         my7HTo7Jydlw77pBzlN6Ug1ksEerfcm1bi75HRc/C9ShfKqEaNmb9FQSb2cohmJzSmtn
         s81CvH9pIcQp2uwV1Mx8IYPvtV/x+rq8RMb0r9s9b5Ojp32aUN5GtQLrVFOsje49WTrq
         2RO1P+/Lu1thaA2RS9R+Fa1BO0o+GB71UCaxxdcmLpEFWd/MjpF/eJ0VQJ05rvHK4qAo
         CDPQ==
X-Gm-Message-State: APjAAAXd+KAHTGudcablC+xp1XFv4ikOXxTtWyG022IbK9rJsrP3s2mi
	6pVF/NmnzUjTZ0AyDirU3sE=
X-Google-Smtp-Source: APXvYqw/UG1FmALRo9iqLO15tKvBeK/OLJmmZPw/P7eHI+BInplm3VGgfPJOQTYALBcXrfreL9nJyg==
X-Received: by 2002:aa7:c616:: with SMTP id h22mr8141011edq.296.1570715405870;
        Thu, 10 Oct 2019 06:50:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:a51:: with SMTP id bt17ls946754edb.8.gmail; Thu, 10
 Oct 2019 06:50:05 -0700 (PDT)
X-Received: by 2002:a50:f748:: with SMTP id j8mr8124336edn.267.1570715405119;
        Thu, 10 Oct 2019 06:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570715405; cv=none;
        d=google.com; s=arc-20160816;
        b=ODZNBYuGfPoPhRLfkK1J0rz1jn51hVCJ7Mnnib8twqwcrHm3fWJitREUkVELIKPbL8
         fN8l5uopVh4Gyf8XRUGrSL4DmXoDerK+uvDXgzCIO+3EFBxI0++0txav7q1CAvqCCkY3
         K6GR3fwDR6G+4/VcThrM1qmPtOo91U1On8wi8sRNtDA4ODbTB5JxGbIWhQp+7z5uTIWe
         nR/xOyYkHMdiJstzsDKpI0SCvYIQ6v9KqtZLa0q5YZcplaAoEIqW+E7piczpQggxjOsl
         xn6nfnkucgLGJZNcWZIs2vNn1qJtD5Z8+bjUyI25/XdV7UUDYxxPsuEMjuLJoDARJHtq
         tFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:precedence:robot-unsubscribe:robot-id
         :message-id:mime-version:references:in-reply-to:cc:subject:to
         :reply-to:sender:from:date;
        bh=ho0b9/vjEWNQsjRF/gHqEWk6k/32CxPnuV8SOw4YgHM=;
        b=CMoy9CKCfpJF2aneEgpnR35yYby0tyKja1IMchVCHYmPp8wA89LFmvIh8I6UwQfqKo
         YzZlBf9/K+rh0EHYAfDQ7oGCq4mw5XAB4j3MmgrI8i3OW1Bs6tO/O+CW2IXLy1RJgens
         yXVHm7fZQ9n/yY+BNDcb4PeqwyKNzn49mAYIeP/7ncqzzr99/9KWmv6RCcyGq8aYv2qd
         sWkl972oE3rp1/Cr3RLMLmneEos6zoQ1GSrjH7B5kIvMCshSrLgo/QLvxUd+gX714WQ8
         G8neXfJIq7SInIuHaZE/6/qhn04vzTw9/G5rUUSPL04gIKUyzMAXkViO86YgckaoBFFF
         FwdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tip-bot2@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id r3si183eds.2.2019.10.10.06.50.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Oct 2019 06:50:04 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tip-bot2@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tip-bot2@linutronix.de>)
	id 1iIYpN-0001jy-6F; Thu, 10 Oct 2019 15:50:01 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
	by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id BA5351C02FC;
	Thu, 10 Oct 2019 15:50:00 +0200 (CEST)
Date: Thu, 10 Oct 2019 13:50:00 -0000
From: "tip-bot2 for Ralf Ramsauer" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/platform] x86/jailhouse: Improve setup data version comparison
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Borislav Petkov <bp@suse.de>, Jan Kiszka <jan.kiszka@siemens.com>,
 Baoquan He <bhe@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, jailhouse-dev@googlegroups.com,
 Juergen Gross <jgross@suse.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, "x86-ml" <x86@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20191010102102.421035-2-ralf.ramsauer@oth-regensburg.de>
References: <20191010102102.421035-2-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Message-ID: <157071540068.9978.14509461318456247452.tip-bot2@tip-bot2>
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

Commit-ID:     0935e5f7527ccd46163b42e1540409c98e29fe17
Gitweb:        https://git.kernel.org/tip/0935e5f7527ccd46163b42e1540409c98e29fe17
Author:        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
AuthorDate:    Thu, 10 Oct 2019 12:21:01 +02:00
Committer:     Borislav Petkov <bp@suse.de>
CommitterDate: Thu, 10 Oct 2019 15:38:30 +02:00

x86/jailhouse: Improve setup data version comparison

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
Link: https://lkml.kernel.org/r/20191010102102.421035-2-ralf.ramsauer@oth-regensburg.de
---
 arch/x86/include/uapi/asm/bootparam.h | 22 ++++++-----
 arch/x86/kernel/jailhouse.c           | 51 ++++++++++++++++----------
 2 files changed, 45 insertions(+), 28 deletions(-)

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
index 3ad34f0..cf4eb37 100644
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
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/157071540068.9978.14509461318456247452.tip-bot2%40tip-bot2.
