Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4EZXYAKGQEWM56NHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 00251131375
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:39 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id w6sf7538661ljo.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320439; cv=pass;
        d=google.com; s=arc-20160816;
        b=RoSn0TiMvMiqB/NkQfr93M9p6B0qdKCf7IiScHdMfVylSXbaa1rR01D3ImAttAnhsD
         ntw3+Mmp60QzOyD3wah2U3Rjsza5oHfdwj7HgxbL5NLR2EwE8jtqIRpwQVKgS/RSRUvc
         427Y1aLEJUsV9J54NTd08tU1a+0r1hEIWLdX5TfA9KTMxWyLeC8D4+x1KaCG7zKW3p6h
         nckwZgC967itegxhiiEFZLZfQCuR2hPIdo9B8XbnA3JMKQjEexm/NfR5gC8M2sHM5k1Q
         L4cZHuM90+BI61W/PsxAh1tLCuTw86TPdOoMiOVc5yr8eNMTngRJ6OGr9x7A6qEQMC+s
         cK4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=NV2AaHTn4UYWvRml8S7nmWR9dWISGLTfRVY3g8NWq9E=;
        b=SCMlX6AzuRl6N2qC0cLa1DDMPYr3UXeCiZX9yh5r4z6d2ZaaFfftDeG30dwhsGFYVh
         LGy0JoAaGt0lkdtD0AMTUnjophY7OeSEZUQsOtREQGcNdWpRNnO8ElloY9Hd2cutlfrC
         8bsMp/o31/5R4qlQ5HJC21Ns1kEZFc3BBa5aPCkXagmQweFQgDgFAhQ79+Y2WsxAj6qW
         nYmOaunhmqWVNstaJU4w/10wIj3FAYWnIak1T+3uLb5rGc9RNkKJtnGhZz0NB9z1KYq9
         80uc2NsWqu+cSbXfBJNBhp659p6t0kRILwSMwRTdgL3cr7w9Fv9LrbD8wcVodAV96pAG
         xZCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NV2AaHTn4UYWvRml8S7nmWR9dWISGLTfRVY3g8NWq9E=;
        b=Io0rvyXX8JWQZXXFamki7dZTA3NuJAOhiqIf8jzjPAfARfb5P0bPQTYUmePSzxkAe8
         xH31QkA5Q7VtVyh06Rz7Hl0LWMseNWW/NjceNvJjylGdd5SH7yqDmQztblj/H2pEyaz7
         ZFwOw9GmxYaPibaIEYIVbm/F63TY8p/77Zwhibe9s0lB5ZO+fjMdtv/slGqknjO1j5FO
         H+ffNLTWbQ0bdQm4YYofcK9Ne2VCgVctqKPyLnssZtUjfKpD/0voM+y4+MgTq3awmdnX
         d+ClxKfzkymcrZL7eN120g3CAB+moQIlQRu7EsetWdCmnNkObSGKZncf+yEfqA/WXNfl
         MlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NV2AaHTn4UYWvRml8S7nmWR9dWISGLTfRVY3g8NWq9E=;
        b=UXGECcRzz40Crv6jxpGOD5BSDlHt6ENffXak6EQwDfVdzDRORiyUeNVig9wbjCtaP+
         67RKF2fIo88vsli0a+k1+C2KhudyJBsSLSO6Q5RHYUavK++l4zxl+rmLkNZXQlqGG9Rq
         VTazSAP8tP61V6nJe6XjgtFH9wpNSmNgHU/3XQNn+aofHRUGtcM31XB1K3YJ3hwfsdtR
         PVexrE+qcQj9WtkovPlBaO0v7h5p1TZ3LoEzkYfA2MlDMZd9oCvV0lUTTjFbEAQ6b1t7
         ljHhF65ReXzdiAyti+5Qe0yWi7gGrVc0fd32r/xkiM7AOrM2b5iVvIxnh6Qpuu7zrYXO
         UNwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXi2i7kl+vONOt6FoZscgd5oBxN5PbAREm85ekh4OMxMa17QIgA
	JYyTYIX0REKotWWlTBEgLhQ=
X-Google-Smtp-Source: APXvYqybhRkVFkI7df6e9mHtyYCDi73eXIVBnxUcmPS713Bz6uMydQT3CzcIiBzVLpBVcJiRRcRX3Q==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr11481770ljl.56.1578320439584;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9709:: with SMTP id r9ls4552506lji.14.gmail; Mon, 06 Jan
 2020 06:20:38 -0800 (PST)
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr59907543ljn.40.1578320438457;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320438; cv=none;
        d=google.com; s=arc-20160816;
        b=CU2Z2MJ+Wf2B1SjWKMdmaFDQuk8jLkoPOZpFzKG06oeVUeWs5gMf2wLs0Qzsd2Tf9u
         uasWgYIV+wf48lr675Lmkvq3W0u5hJBPMgG3QBIFgCGtTG/NwQXMSPW8AcMwoPULFK/Q
         7c2X7Pd46bFoXZebnzO34ro8TRSJS4pSMU5FFG2uIuPfo/lWhgE6RLprSPKBYgDIcMQ2
         I1m+p98cBZItgxmAATkCepFmXQUWnjWoQJ13lAXxyddsLemXCEUSWpE+XM8G5Xsas1pz
         7RA3tdAvY9lrGFX6bFQWJQ0JkYdbI3OJR4Ko22CBUC+YisvwIect0yhwrNkt4M2PNdhO
         xZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=VwMTZehykg1EwgBpseV1m6J4+wKz507bd3yfqryq+Rs=;
        b=TydVbd6zn9htYjjeLIdDHOE45JhlHl3g714Zv6TPMTnu/9uu6I7+tITqMkWf83FLXy
         CqTD2HNe1RkvxR0ZRLEjBn9Oy/pBq6ZSjPlTIBGk7SHpmDycDQwe29nJz91fkgiDEE2L
         F3jgYzQesZv6+2jvc43W8ydTgWXeKUYABkLluAohGlvJXMgFzOzKL1D7SYYVHSFZ0KjL
         NDWLxde2kxdJNTdBXvCONHfSe6H/CYITHfKSafWQf3JW72HCvL5HOK4B9FaerLpf40Kr
         +YibtKWraM2TVtAynqNRzb4jKyBEUDsPAQ/EyfxbaBJwUaHLxx0UoLlg3JmjnBb0IOZj
         Ybuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a4si2170035lfg.1.2020.01.06.06.20.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKbmA016628
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjD008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/19] inmates: Rework interrupt API
Date: Mon,  6 Jan 2020 15:20:21 +0100
Message-Id: <925342bff4101db0065dbc942f5824acaadfc26c.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This generalizes the API for initializing the subsystem and registering
a handler with it. x86 now uses the same pattern as the ARM
architectures: There is only one custom handler that is invoked with the
triggered interrupt number as parameter.

Along this, the API functions are changed to use the more readable "irq"
prefix.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/demos/arm/gic-demo.c            |  2 +-
 inmates/demos/x86/apic-demo.c           |  8 +++---
 inmates/demos/x86/ioapic-demo.c         | 12 ++++++---
 inmates/demos/x86/ivshmem-demo.c        |  5 ++--
 inmates/demos/x86/pci-demo.c            | 12 ++++++---
 inmates/demos/x86/smp-demo.c            | 10 ++++---
 inmates/lib/arm-common/gic.c            |  4 +--
 inmates/lib/arm-common/include/inmate.h |  2 --
 inmates/lib/include/inmate_common.h     |  4 +++
 inmates/lib/x86/Makefile                |  2 +-
 inmates/lib/x86/include/inmate.h        |  6 +----
 inmates/lib/x86/{int.c => irq.c}        | 48 ++++++++++++++++-----------------
 12 files changed, 62 insertions(+), 53 deletions(-)
 rename inmates/lib/x86/{int.c => irq.c} (82%)

diff --git a/inmates/demos/arm/gic-demo.c b/inmates/demos/arm/gic-demo.c
index b2246deb..13db0a41 100644
--- a/inmates/demos/arm/gic-demo.c
+++ b/inmates/demos/arm/gic-demo.c
@@ -57,7 +57,7 @@ static void handle_IRQ(unsigned int irqn)
 void inmate_main(void)
 {
 	printk("Initializing the GIC...\n");
-	gic_setup(handle_IRQ);
+	irq_init(handle_IRQ);
 	gic_enable_irq(TIMER_IRQ);
 
 	printk("Initializing the timer...\n");
diff --git a/inmates/demos/x86/apic-demo.c b/inmates/demos/x86/apic-demo.c
index 5b88f2e0..d9aada6a 100644
--- a/inmates/demos/x86/apic-demo.c
+++ b/inmates/demos/x86/apic-demo.c
@@ -50,11 +50,14 @@ static bool cpu_has_smi_count(void)
 	return false;
 }
 
-static void irq_handler(void)
+static void irq_handler(unsigned int irq)
 {
 	unsigned long delta;
 	u32 smis;
 
+	if (irq != APIC_TIMER_VECTOR)
+		return;
+
 	delta = tsc_read_ns() - expected_time;
 	if (delta < min)
 		min = delta;
@@ -77,8 +80,7 @@ static void init_apic(void)
 {
 	unsigned long apic_freq_khz;
 
-	int_init();
-	int_set_handler(APIC_TIMER_VECTOR, irq_handler);
+	irq_init(irq_handler);
 
 	apic_freq_khz = apic_timer_init(APIC_TIMER_VECTOR);
 	printk("Calibrated APIC frequency: %lu kHz\n", apic_freq_khz);
diff --git a/inmates/demos/x86/ioapic-demo.c b/inmates/demos/x86/ioapic-demo.c
index 141bad51..dfb33b8a 100644
--- a/inmates/demos/x86/ioapic-demo.c
+++ b/inmates/demos/x86/ioapic-demo.c
@@ -32,9 +32,14 @@
 
 static unsigned int pm_base;
 
-static void irq_handler(void)
+static void irq_handler(unsigned int irq)
 {
-	u16 status = inw(pm_base + PM1_STATUS);
+	u16 status;
+
+	if (irq != IRQ_VECTOR)
+		return;
+
+	status = inw(pm_base + PM1_STATUS);
 
 	printk("ACPI IRQ received, status: %04x\n", status);
 	outw(status, pm_base);
@@ -42,8 +47,7 @@ static void irq_handler(void)
 
 void inmate_main(void)
 {
-	int_init();
-	int_set_handler(IRQ_VECTOR, irq_handler);
+	irq_init(irq_handler);
 
 	ioapic_init();
 	ioapic_pin_set_vector(ACPI_GSI, TRIGGER_LEVEL_ACTIVE_HIGH, IRQ_VECTOR);
diff --git a/inmates/demos/x86/ivshmem-demo.c b/inmates/demos/x86/ivshmem-demo.c
index 65541d18..185c9ff7 100644
--- a/inmates/demos/x86/ivshmem-demo.c
+++ b/inmates/demos/x86/ivshmem-demo.c
@@ -107,7 +107,7 @@ static void send_irq(struct ivshmem_dev_data *d)
 	mmio_write32(d->registers + 3, 1);
 }
 
-static void irq_handler(void)
+static void irq_handler(unsigned int irq)
 {
 	printk("IVSHMEM: got interrupt ... %d\n", irq_counter++);
 }
@@ -120,7 +120,7 @@ void inmate_main(void)
 	struct ivshmem_dev_data *d;
 	volatile char *shmem;
 
-	int_init();
+	irq_init(irq_handler);
 
 	while ((ndevices < MAX_NDEV) &&
 	       (-1 != (bdf = pci_find_device(VENDORID, DEVICEID, bdf)))) {
@@ -145,7 +145,6 @@ void inmate_main(void)
 
 		memcpy(d->shmem, str, 32);
 
-		int_set_handler(IRQ_VECTOR + ndevices - 1, irq_handler);
 		pci_msix_set_vector(bdf, IRQ_VECTOR + ndevices - 1, 0);
 		bdf++;
 	}
diff --git a/inmates/demos/x86/pci-demo.c b/inmates/demos/x86/pci-demo.c
index 84d48891..3e48e050 100644
--- a/inmates/demos/x86/pci-demo.c
+++ b/inmates/demos/x86/pci-demo.c
@@ -26,9 +26,14 @@
 
 static void *hdbar;
 
-static void irq_handler(void)
+static void irq_handler(unsigned int irq)
 {
-	u16 statests = mmio_read16(hdbar + HDA_STATESTS);
+	u16 statests;
+
+	if (irq != IRQ_VECTOR)
+		return;
+
+	statests = mmio_read16(hdbar + HDA_STATESTS);
 
 	printk("HDA MSI received (STATESTS: %04x)\n", statests);
 	mmio_write16(hdbar + HDA_STATESTS, statests);
@@ -39,8 +44,7 @@ void inmate_main(void)
 	u64 bar;
 	int bdf;
 
-	int_init();
-	int_set_handler(IRQ_VECTOR, irq_handler);
+	irq_init(irq_handler);
 
 	bdf = pci_find_device(PCI_ID_ANY, PCI_ID_ANY, 0);
 	if (bdf < 0) {
diff --git a/inmates/demos/x86/smp-demo.c b/inmates/demos/x86/smp-demo.c
index d8dac073..cd48332e 100644
--- a/inmates/demos/x86/smp-demo.c
+++ b/inmates/demos/x86/smp-demo.c
@@ -17,8 +17,11 @@
 static volatile bool done;
 static unsigned int main_cpu;
 
-static void ipi_handler(void)
+static void ipi_handler(unsigned int irq)
 {
+	if (irq != IPI_VECTOR)
+		return;
+
 	printk("Received IPI on %d\n", cpu_id());
 	done = true;
 }
@@ -26,7 +29,7 @@ static void ipi_handler(void)
 static void secondary_main(void)
 {
 	printk("Hello from CPU %d!\n", cpu_id());
-	int_send_ipi(main_cpu, IPI_VECTOR);
+	irq_send_ipi(main_cpu, IPI_VECTOR);
 }
 
 void inmate_main(void)
@@ -40,8 +43,7 @@ void inmate_main(void)
 	smp_wait_for_all_cpus();
 	printk("\nFound %d other CPU(s)\n", smp_num_cpus - 1);
 
-	int_init();
-	int_set_handler(IPI_VECTOR, ipi_handler);
+	irq_init(ipi_handler);
 
 	asm volatile("sti");
 
diff --git a/inmates/lib/arm-common/gic.c b/inmates/lib/arm-common/gic.c
index 405984f9..bf00d4a7 100644
--- a/inmates/lib/arm-common/gic.c
+++ b/inmates/lib/arm-common/gic.c
@@ -42,7 +42,7 @@
 extern const struct gic gic_v2;
 extern const struct gic gic_v3;
 
-static irq_handler_t irq_handler = (irq_handler_t)NULL;
+static irq_handler_t irq_handler;
 static const struct gic *gic = &gic_v2;
 
 /* Replaces the weak reference in header.S */
@@ -62,7 +62,7 @@ void vector_irq(void)
 	}
 }
 
-void gic_setup(irq_handler_t handler)
+void irq_init(irq_handler_t handler)
 {
 	if (comm_region->gic_version == 3)
 		gic = &gic_v3;
diff --git a/inmates/lib/arm-common/include/inmate.h b/inmates/lib/arm-common/include/inmate.h
index 61e383a0..86c0806c 100644
--- a/inmates/lib/arm-common/include/inmate.h
+++ b/inmates/lib/arm-common/include/inmate.h
@@ -95,8 +95,6 @@ static inline void __attribute__((noreturn)) halt(void)
 		asm volatile("wfi" : : : "memory");
 }
 
-typedef void (*irq_handler_t)(unsigned int);
-void gic_setup(irq_handler_t handler);
 void gic_enable_irq(unsigned int irq);
 
 unsigned long timer_get_frequency(void);
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index f2de578e..b7226bba 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -97,6 +97,10 @@ enum map_type { MAP_CACHED, MAP_UNCACHED };
 
 void map_range(void *start, unsigned long size, enum map_type map_type);
 
+typedef void(*irq_handler_t)(unsigned int);
+
+void irq_init(irq_handler_t handler);
+
 #define CMDLINE_BUFFER(size) \
 	const char cmdline[size] __attribute__((section(".cmdline")))
 
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index eda484fe..40d3eba2 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := cpu-features.o excp.o header-common.o int.o ioapic.o printk.o
+TARGETS := cpu-features.o excp.o header-common.o irq.o ioapic.o printk.o
 TARGETS += setup.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o ../test.o
 TARGETS += ../uart-8250.o ../printk.o
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index a3d7601b..fb45a945 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -225,11 +225,7 @@ extern void *stack;
 
 void excp_reporting_init(void);
 
-typedef void(*int_handler_t)(void);
-
-void int_init(void);
-void int_set_handler(unsigned int vector, int_handler_t handler);
-void int_send_ipi(unsigned int cpu_id, unsigned int vector);
+void irq_send_ipi(unsigned int cpu_id, unsigned int vector);
 
 enum ioapic_trigger_mode {
 	TRIGGER_EDGE = 0,
diff --git a/inmates/lib/x86/int.c b/inmates/lib/x86/irq.c
similarity index 82%
rename from inmates/lib/x86/int.c
rename to inmates/lib/x86/irq.c
index 663fa65e..dfb78358 100644
--- a/inmates/lib/x86/int.c
+++ b/inmates/lib/x86/irq.c
@@ -44,23 +44,23 @@
 
 extern u8 irq_entry[];
 
-static int_handler_t __attribute__((used)) int_handler[MAX_INTERRUPT_VECTORS];
+static irq_handler_t __attribute__((used)) irq_handler;
 
-void int_init(void)
+void irq_init(irq_handler_t handler)
 {
-	write_msr(X2APIC_SPIV, 0x1ff);
-}
+	unsigned int vector;
+	u64 entry;
 
-void int_set_handler(unsigned int vector, int_handler_t handler)
-{
-	unsigned int int_number = vector - 32;
-	u64 entry = (unsigned long)irq_entry + int_number * 16;
+	write_msr(X2APIC_SPIV, 0x1ff);
 
-	int_handler[int_number] = handler;
+	irq_handler = handler;
 
-	idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
-		((0x8e00 | (entry & 0xffff0000)) << 32);
-	idt[vector * 2 + 1] = entry >> 32;
+	for (vector = 32; vector < 32 + MAX_INTERRUPT_VECTORS; vector++) {
+		entry = (unsigned long)irq_entry + (vector - 32) * 16;
+		idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
+			((0x8e00 | (entry & 0xffff0000)) << 32);
+		idt[vector * 2 + 1] = entry >> 32;
+	}
 }
 
 asm(
@@ -74,11 +74,11 @@ asm(
 
 ".macro irq_prologue irq\n\t"
 #ifdef __x86_64__
-	"push %rax\n\t"
-	"mov $irq * 8,%rax\n\t"
+	"push %rdi\n\t"
+	"mov $irq,%rdi\n\t"
 #else
-	"push %eax\n\t"
-	"mov $irq * 4,%eax\n\t"
+	"push %ecx\n\t"
+	"mov $irq,%ecx\n\t"
 #endif
 	"jmp irq_common\n"
 	".balign 16\n"
@@ -87,7 +87,7 @@ asm(
 	".global irq_entry\n\t"
 	".balign 16\n"
 "irq_entry:\n"
-"irq=0\n"
+"irq=32\n"
 ".rept 32\n"
 	"irq_prologue irq\n\t"
 	"irq=irq+1\n\t"
@@ -95,16 +95,16 @@ asm(
 
 "irq_common:\n\t"
 #ifdef __x86_64__
+	"push %rax\n\t"
 	"push %rcx\n\t"
 	"push %rdx\n\t"
 	"push %rsi\n\t"
-	"push %rdi\n\t"
 	"push %r8\n\t"
 	"push %r9\n\t"
 	"push %r10\n\t"
 	"push %r11\n\t"
 
-	"call *int_handler(%rax)\n\t"
+	"call *irq_handler\n\t"
 
 	"eoi\n\t"
 
@@ -112,34 +112,34 @@ asm(
 	"pop %r10\n\t"
 	"pop %r9\n\t"
 	"pop %r8\n\t"
-	"pop %rdi\n\t"
 	"pop %rsi\n\t"
 	"pop %rdx\n\t"
 	"pop %rcx\n\t"
 	"pop %rax\n\t"
+	"pop %rdi\n\t"
 
 	"iretq"
 #else
-	"push %ecx\n\t"
+	"push %eax\n\t"
 	"push %edx\n\t"
 	"push %esi\n\t"
 	"push %edi\n\t"
 
-	"call *int_handler(%eax)\n\t"
+	"call *irq_handler\n\t"
 
 	"eoi\n\t"
 
 	"pop %edi\n\t"
 	"pop %esi\n\t"
 	"pop %edx\n\t"
-	"pop %ecx\n\t"
 	"pop %eax\n\t"
+	"pop %ecx\n\t"
 
 	"iret"
 #endif
 );
 
-void int_send_ipi(unsigned int cpu_id, unsigned int vector)
+void irq_send_ipi(unsigned int cpu_id, unsigned int vector)
 {
 	write_msr(X2APIC_ICR, ((u64)cpu_id << 32) | APIC_LVL_ASSERT | vector);
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/925342bff4101db0065dbc942f5824acaadfc26c.1578320435.git.jan.kiszka%40siemens.com.
