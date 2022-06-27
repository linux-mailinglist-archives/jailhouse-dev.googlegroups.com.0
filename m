Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AB55B9B9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id z7-20020a170906434700b007108b59c212sf2406562ejm.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=SQc1w3IDDPGg5V67Gz641NUFUxMEUEbeGdM4SsfR5SLDE8iwu0J51OUfeItTuBdOmQ
         XzY0G5BO/O3AuV8/s/8GVX1OsR3y+exT7z2Eub4DRHmkFF0E3Y78ODeetTDGBgeZUopT
         3H9/dyhECv9iEz/GxiIlm1krFnah5npA7hFOXuSa4QHDK7HEegPZieBEN37dAyDREOJG
         52YGaqmBDdzcGTXGnTSABaTueB2hOpA58L66r07of2EGXl25q/Mo5MIHGpoW7/cz5+A1
         G+eo+oDq7xltcSIqBWLAKo8dQ3hLgfqW1KIxioaiHI+OXUWY7ztXYegNZXlhU14q8i57
         zASQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HuREkCTodK2WqoWV1JZZXAy7+zTaQel+p9JqHVwaClQ=;
        b=a+XXGO6Rx+hxXZYgsQIKG8RnkSq4lPNpJBPyYmQXeUPeel99eYpqwOb8eM14KfOz28
         rKQ8Ukvw09hTASPeuiHsbXqgTYtycpothmP+s2dg/DgaHf5wYAfRfj6hqib+sJMK29ai
         mC0OzV/oSDo1Z4vxPAWu4anLx2JxB4+Reptl5aEDmQtuD2tDaZeZpjnDoUgVryBFbzTl
         lsmVC0D0wmZz8p4brI3gPc265heU285ZpERl2jTbgW478GSHVzAXFI291eYzuKKAowR/
         9u665OCthtHuRYwU0ac5H4qCABZStDxbKNg63LtKcOW5oKJS7pZ6KPZXxCysBRje23AS
         XXfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=dUk4hcvC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HuREkCTodK2WqoWV1JZZXAy7+zTaQel+p9JqHVwaClQ=;
        b=Yo92nj3MyfKzvdF5pFtTDeOl3YXgLrHkR+bpDy2i08bEWfnWy6talemzWX0kniCuUF
         1TdKbCVXMhRXHuk5rgkuyjFi7fYW0Ao27zbjbIRoIvzwvtcVyM76dnOyLyVKpGYUQ1az
         3OLzWnLkV1ODUSfQoLZ30CXk8o17bZdyqyNbwm/j3oHQ0OStnDViGWBNHpYL9FlAqIsM
         YA5doqJdKKL0ciu+pAvo3/E2WGJrs2eMd7bQ0ETpuEr+qf24vr6e2zO7SLfXitPovmJg
         JRDY723int6U3jNbBq68zG33R8pAYWv7EnZQRty5z10+WgPQ5ufb+iVINsDiGvBsuSq0
         9TZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HuREkCTodK2WqoWV1JZZXAy7+zTaQel+p9JqHVwaClQ=;
        b=CX4AgZbE4Gj9sL86FBEgrIv/4m4gUteby+JMrwkr4rzjeQyLNGh0+av+EzsGR06jVw
         BoT88YnOIYgh9H9Vmcn0DUcA0RmVy9CK9FWgzy9lhpUOa8HZEvuIbECwJpQKZF/S/Zpq
         rdrM3MELqgPDLgiBUt9guXL/gNArVLfjTx/hcd9UxnoR4p9ghy/z6ZTtFpGAf7zhhUFD
         mEmAJ5iJA+jIReaUsrecu+MgPTbRUmo0oxhxngt1finiq/heN64xpf08fIZFhSChu2mH
         LVvooP0Pq1mQ3bIRol8ib8kfjGQdfCzjgIb8fbu0iqEDirKq/VYq4EkOfjKN3RaxUx8a
         upNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8NaDvRcx9JZ1Om+DPa60cIKYM/q4i95aOBgCr9kCT5vo9HPXqa
	sgorRU8hOYcKCFQGGZ4ztwk=
X-Google-Smtp-Source: AGRyM1thbrcejYXdn4JFj74uE3l3IAT5bbN2bFoCMo28MvWzSd1uKD1XDhb66CR3QNf7fL2bxznE7Q==
X-Received: by 2002:a17:906:3f1a:b0:715:6fb5:c6d8 with SMTP id c26-20020a1709063f1a00b007156fb5c6d8mr12726641ejj.467.1656335619539;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40c3:b0:435:89f5:289a with SMTP id
 z3-20020a05640240c300b0043589f5289als1368563edb.3.gmail; Mon, 27 Jun 2022
 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6402:750:b0:435:68bb:8552 with SMTP id p16-20020a056402075000b0043568bb8552mr16265643edy.155.1656335617987;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=DbBvMITD4NmOpcAI9awsJFvtzY4zNoBjEMWB2FHV6V8P7SFJ15+84/5jHD1NYJJugX
         wvy0Y5Iu7tfXL6GoH2qHwwDcG9gMHDFVbhaqu8P39fkuvY2btVpySiU9yPqlw7IsIV43
         cutW0sJgUtjE85XBXKm99QdqhzEGuce562Uq2c/hlcvYnUulaPj2HBlaCK2mkbB+pRrH
         zydZqqr4fQqx9UalnWI0S603WSnep4nySrXWtf0iLKx3D6ZEZubBtjea2bS+vmapru7p
         5SRgzOgCfmPU1pdgLKwTAI3DJDxjppSau4aoAPbYpAv/J7xyU3O1FDrFxIc5lXT0KDjW
         uVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mK0z8p4qklb1EgNjSguIJrjpjhhdCm//hTA6uJPB8Hg=;
        b=Y0H7V6vPpQ7OTwgQ+DFc3edEsu+xz2I5Y1dCfdDxcPvjjKGL2cGHIzSG0Bpzn85l/E
         5E+pYBhn5/QMI91rLA986IpT/kzbqTHs56OXtlvU0ZMYDzZdXVcyIyCkAiEq6NeTCyn/
         3xYs7jeuuwJ/7AEvZ1jdxupsg97M/wG9H+nF2sfA+Y6tRRKjIANQm0ZnzOzKye6nuKVt
         ekQ5tujHot+VtiarPhFyfjhmEK7z2wq3GXfLyKlV1i7ZBJ2AI2Nxmw/QKxo9Id2T64da
         rw2oEkb/uCSvLOQjd6ZUB6b6jlWi852VAnxTSAKgLflHueOaaaqvolAYLxTgJiWtFQ32
         D1/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=dUk4hcvC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id ci3-20020a170906c34300b0072546cfeee8si449977ejb.2.2022.06.27.06.13.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp814YwNzxvr;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 10/20] core: Use statically sized cpu sets
Date: Mon, 27 Jun 2022 15:13:19 +0200
Message-ID: <20220627131329.3659-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=dUk4hcvC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Given that we do not face excessive amounts of CPUs so far, are in fact
limited to 254 on x86 e.g., there is no point in the complex bitmap
allocation algorithm used for cpu_set. Introduce a per-arch upper limit
of CPUs (MAX_CPUS) and lay out struct cpu_set accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c      |  8 ++--
 hypervisor/arch/arm-common/gic-v2.c       |  2 +-
 hypervisor/arch/arm-common/irqchip.c      |  2 +-
 hypervisor/arch/arm-common/lib.c          |  2 +-
 hypervisor/arch/arm/include/asm/types.h   |  4 +-
 hypervisor/arch/arm64/gic-v3.c            |  4 +-
 hypervisor/arch/arm64/include/asm/types.h |  2 +
 hypervisor/arch/x86/apic.c                |  4 +-
 hypervisor/arch/x86/cat.c                 |  2 +-
 hypervisor/arch/x86/control.c             |  4 +-
 hypervisor/arch/x86/include/asm/types.h   |  4 +-
 hypervisor/arch/x86/iommu.c               |  4 +-
 hypervisor/control.c                      | 48 +++++++----------------
 hypervisor/include/jailhouse/cell.h       |  8 ++--
 hypervisor/include/jailhouse/control.h    |  4 +-
 hypervisor/include/jailhouse/types.h      |  8 ++--
 hypervisor/setup.c                        |  2 +-
 17 files changed, 48 insertions(+), 64 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index d61c81d9..c4c859ce 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -162,7 +162,7 @@ int arch_cell_create(struct cell *cell)
 
 void arch_cell_reset(struct cell *cell)
 {
-	unsigned int first = first_cpu(cell->cpu_set);
+	unsigned int first = first_cpu(&cell->cpu_set);
 	unsigned int cpu;
 	struct jailhouse_comm_region *comm_region =
 		&cell->comm_page.comm_region;
@@ -179,7 +179,7 @@ void arch_cell_reset(struct cell *cell)
 	 * starts at cpu_reset_address, defined in the cell configuration.
 	 */
 	public_per_cpu(first)->cpu_on_entry = cell->config->cpu_reset_address;
-	for_each_cpu_except(cpu, cell->cpu_set, first)
+	for_each_cpu_except(cpu, &cell->cpu_set, first)
 		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
 
 	arm_cell_dcaches_flush(cell, DCACHE_INVALIDATE);
@@ -194,7 +194,7 @@ void arch_cell_destroy(struct cell *cell)
 	arm_cell_dcaches_flush(cell, DCACHE_INVALIDATE);
 
 	/* All CPUs are handed back to the root cell in suspended mode. */
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		public_per_cpu(cpu)->cpu_on_entry = PSCI_INVALID_ADDRESS;
 
 	arm_paging_cell_destroy(cell);
@@ -204,7 +204,7 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		if (cpu == this_cpu_id())
 			arm_paging_vcpu_flush_tlbs();
 		else
diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 8a9f6201..f1769d2c 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -270,7 +270,7 @@ static void gicv2_adjust_irq_target(struct cell *cell, u16 irq_id)
 		return;
 
 	targets &= ~(0xff << shift);
-	targets |= gicv2_target_cpu_map[first_cpu(cell->cpu_set)] << shift;
+	targets |= gicv2_target_cpu_map[first_cpu(&cell->cpu_set)] << shift;
 
 	mmio_write32(itargetsr, targets);
 }
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 6e8c8534..59e5dd53 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -112,7 +112,7 @@ void gic_handle_sgir_write(struct sgi *sgi)
 		/* Route to the caller itself */
 		irqchip_set_pending(cpu_public, sgi->id);
 	else
-		for_each_cpu(cpu, this_cell()->cpu_set) {
+		for_each_cpu(cpu, &this_cell()->cpu_set) {
 			if (sgi->routing_mode == 1) {
 				/* Route to all (cell) CPUs but the caller. */
 				if (cpu == cpu_public->cpu_id)
diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
index 889b3d14..5c0dde0a 100644
--- a/hypervisor/arch/arm-common/lib.c
+++ b/hypervisor/arch/arm-common/lib.c
@@ -27,7 +27,7 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
 			return cpu;
 
diff --git a/hypervisor/arch/arm/include/asm/types.h b/hypervisor/arch/arm/include/asm/types.h
index 4c4769a5..f84f0155 100644
--- a/hypervisor/arch/arm/include/asm/types.h
+++ b/hypervisor/arch/arm/include/asm/types.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -11,3 +11,5 @@
  */
 
 #define BITS_PER_LONG			32
+
+#define MAX_CPUS			8
diff --git a/hypervisor/arch/arm64/gic-v3.c b/hypervisor/arch/arm64/gic-v3.c
index bdc25c8e..8d18f6ec 100644
--- a/hypervisor/arch/arm64/gic-v3.c
+++ b/hypervisor/arch/arm64/gic-v3.c
@@ -340,7 +340,7 @@ static int gicv3_cpu_shutdown(struct public_per_cpu *cpu_public)
 static void gicv3_adjust_irq_target(struct cell *cell, u16 irq_id)
 {
 	void *irouter = gicd_base + GICD_IROUTER + 8 * irq_id;
-	u64 mpidr = public_per_cpu(first_cpu(cell->cpu_set))->mpidr;
+	u64 mpidr = public_per_cpu(first_cpu(&cell->cpu_set))->mpidr;
 	u32 route = arm_cpu_by_mpidr(cell,
 				     mmio_read64(irouter) & MPIDR_CPUID_MASK);
 
@@ -508,7 +508,7 @@ static enum mmio_result gicv3_handle_irq_route(struct mmio_access *mmio,
 		 * Validate that the target CPU is part of the cell.
 		 * Note that we do not support Interrupt Routing Mode = 1.
 		 */
-		for_each_cpu(cpu, cell->cpu_set)
+		for_each_cpu(cpu, &cell->cpu_set)
 			if ((public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK) ==
 			    mmio->value) {
 				mmio_perform_access(gicd_base, mmio);
diff --git a/hypervisor/arch/arm64/include/asm/types.h b/hypervisor/arch/arm64/include/asm/types.h
index fbec8931..7c88af3d 100644
--- a/hypervisor/arch/arm64/include/asm/types.h
+++ b/hypervisor/arch/arm64/include/asm/types.h
@@ -11,3 +11,5 @@
  */
 
 #define BITS_PER_LONG			64
+
+#define MAX_CPUS			256
diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 95edb2db..9c6313eb 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -250,7 +250,7 @@ bool apic_filter_irq_dest(struct cell *cell, struct apic_irq_message *irq_msg)
 		if (using_x2apic)
 			dest = x2apic_filter_logical_dest(cell, dest);
 		else
-			dest &= cell->cpu_set->bitmap[0];
+			dest &= cell->cpu_set.bitmap[0];
 		/*
 		 * Linux may have programmed inactive vectors with too broad
 		 * destination masks. Return the adjusted mask and do not fail.
@@ -420,7 +420,7 @@ static void apic_send_ipi_all(u32 lo_val, int except_cpu)
 	/* This implicitly selects APIC_ICR_SH_NONE. */
 	lo_val &= APIC_ICR_LVTM_MASK | APIC_ICR_DLVR_MASK |
 		  APIC_ICR_VECTOR_MASK;
-	for_each_cpu_except(cpu, this_cell()->cpu_set, except_cpu)
+	for_each_cpu_except(cpu, &this_cell()->cpu_set, except_cpu)
 		apic_send_ipi(cpu, 0, lo_val);
 }
 
diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index 790584e1..31adb2de 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -38,7 +38,7 @@ static void cat_update_cell(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		if (cpu == this_cpu_id())
 			cat_update();
 		else
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 11cfee49..3d84308d 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -72,7 +72,7 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set) {
+	for_each_cpu(cpu, &cell->cpu_set) {
 		if (cpu == this_cpu_id())
 			vcpu_tlb_flush();
 		else
@@ -93,7 +93,7 @@ void arch_cell_reset(struct cell *cell)
 	comm_region->pm_timer_address =
 		system_config->platform_info.x86.pm_timer_address;
 	/* comm_region, and hence num_cpus, is zero-initialised */
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		comm_region->num_cpus++;
 	comm_region->tsc_khz = system_config->platform_info.x86.tsc_khz;
 	comm_region->apic_khz = system_config->platform_info.x86.apic_khz;
diff --git a/hypervisor/arch/x86/include/asm/types.h b/hypervisor/arch/x86/include/asm/types.h
index 657c47c7..0ebf97f7 100644
--- a/hypervisor/arch/x86/include/asm/types.h
+++ b/hypervisor/arch/x86/include/asm/types.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -17,3 +17,5 @@
  */
 
 #define BITS_PER_LONG			64
+
+#define MAX_CPUS			254
diff --git a/hypervisor/arch/x86/iommu.c b/hypervisor/arch/x86/iommu.c
index 1ecf857a..1bbdddde 100644
--- a/hypervisor/arch/x86/iommu.c
+++ b/hypervisor/arch/x86/iommu.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -34,7 +34,7 @@ struct public_per_cpu *iommu_select_fault_reporting_cpu(void)
 	 * Save this value globally to avoid multiple reports of the same
 	 * case from different CPUs.
 	 */
-	fault_reporting_cpu_id = first_cpu(root_cell.cpu_set);
+	fault_reporting_cpu_id = first_cpu(&root_cell.cpu_set);
 
 	return public_per_cpu(fault_reporting_cpu_id);
 }
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 1e1c7f03..9642493c 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -143,7 +143,7 @@ static void cell_suspend(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu_except(cpu, cell->cpu_set, this_cpu_id())
+	for_each_cpu_except(cpu, &cell->cpu_set, this_cpu_id())
 		suspend_cpu(cpu);
 }
 
@@ -151,7 +151,7 @@ static void cell_resume(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu_except(cpu, cell->cpu_set, this_cpu_id())
+	for_each_cpu_except(cpu, &cell->cpu_set, this_cpu_id())
 		resume_cpu(cpu);
 }
 
@@ -243,36 +243,18 @@ int cell_init(struct cell *cell)
 	const unsigned long *config_cpu_set =
 		jailhouse_cell_cpu_set(cell->config);
 	unsigned long cpu_set_size = cell->config->cpu_set_size;
-	struct cpu_set *cpu_set;
-	int err;
 
-	if (cpu_set_size > PAGE_SIZE)
+	if (cpu_set_size > sizeof(cell->cpu_set.bitmap))
 		return trace_error(-EINVAL);
-	if (cpu_set_size > sizeof(cell->small_cpu_set.bitmap)) {
-		cpu_set = page_alloc(&mem_pool, 1);
-		if (!cpu_set)
-			return -ENOMEM;
-	} else {
-		cpu_set = &cell->small_cpu_set;
-	}
-	cpu_set->max_cpu_id = cpu_set_size * 8 - 1;
-	memcpy(cpu_set->bitmap, config_cpu_set, cpu_set_size);
-
-	cell->cpu_set = cpu_set;
+	cell->cpu_set.max_cpu_id = cpu_set_size * 8 - 1;
+	memcpy(cell->cpu_set.bitmap, config_cpu_set, cpu_set_size);
 
-	err = mmio_cell_init(cell);
-	if (err && cell->cpu_set != &cell->small_cpu_set)
-		page_free(&mem_pool, cell->cpu_set, 1);
-
-	return err;
+	return mmio_cell_init(cell);
 }
 
 static void cell_exit(struct cell *cell)
 {
 	mmio_cell_exit(cell);
-
-	if (cell->cpu_set != &cell->small_cpu_set)
-		page_free(&mem_pool, cell->cpu_set, 1);
 }
 
 /**
@@ -375,10 +357,10 @@ static void cell_destroy_internal(struct cell *cell)
 
 	cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_SHUT_DOWN;
 
-	for_each_cpu(cpu, cell->cpu_set) {
+	for_each_cpu(cpu, &cell->cpu_set) {
 		arch_park_cpu(cpu);
 
-		set_bit(cpu, root_cell.cpu_set->bitmap);
+		set_bit(cpu, root_cell.cpu_set.bitmap);
 		public_per_cpu(cpu)->cell = &root_cell;
 		public_per_cpu(cpu)->failed = false;
 		memset(public_per_cpu(cpu)->stats, 0,
@@ -488,7 +470,7 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 	}
 
 	/* the root cell's cpu set must be super-set of new cell's set */
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		if (!cell_owns_cpu(&root_cell, cpu)) {
 			err = trace_error(-EBUSY);
 			goto err_cell_exit;
@@ -511,10 +493,10 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 	 * Shrinking: the new cell's CPUs are parked, then removed from the root
 	 * cell, assigned to the new cell and get their stats cleared.
 	 */
-	for_each_cpu(cpu, cell->cpu_set) {
+	for_each_cpu(cpu, &cell->cpu_set) {
 		arch_park_cpu(cpu);
 
-		clear_bit(cpu, root_cell.cpu_set->bitmap);
+		clear_bit(cpu, root_cell.cpu_set.bitmap);
 		public_per_cpu(cpu)->cell = cell;
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
@@ -673,7 +655,7 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 	pci_cell_reset(cell);
 	arch_cell_reset(cell);
 
-	for_each_cpu(cpu, cell->cpu_set) {
+	for_each_cpu(cpu, &cell->cpu_set) {
 		public_per_cpu(cpu)->failed = false;
 		arch_reset_cpu(cpu);
 	}
@@ -701,7 +683,7 @@ static int cell_set_loadable(struct per_cpu *cpu_data, unsigned long id)
 	 * Unconditionally park so that the target cell's CPUs don't stay in
 	 * suspension mode.
 	 */
-	for_each_cpu(cpu, cell->cpu_set) {
+	for_each_cpu(cpu, &cell->cpu_set) {
 		public_per_cpu(cpu)->failed = false;
 		arch_park_cpu(cpu);
 	}
@@ -845,7 +827,7 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 
 	if (cpu_data->public.shutdown_state == SHUTDOWN_NONE) {
 		state = num_cells == 1 ? SHUTDOWN_STARTED : -EBUSY;
-		for_each_cpu(cpu, root_cell.cpu_set)
+		for_each_cpu(cpu, &root_cell.cpu_set)
 			public_per_cpu(cpu)->shutdown_state = state;
 	}
 
@@ -1018,7 +1000,7 @@ void panic_park(void)
 		     cell->config->name);
 
 	this_cpu_public()->failed = true;
-	for_each_cpu(cpu, cell->cpu_set)
+	for_each_cpu(cpu, &cell->cpu_set)
 		if (!public_per_cpu(cpu)->failed) {
 			cell_failed = false;
 			break;
diff --git a/hypervisor/include/jailhouse/cell.h b/hypervisor/include/jailhouse/cell.h
index c804a5df..557700e5 100644
--- a/hypervisor/include/jailhouse/cell.h
+++ b/hypervisor/include/jailhouse/cell.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2015
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -41,10 +41,8 @@ struct cell {
 	/** Pointer to static cell description. */
 	struct jailhouse_cell_desc *config;
 
-	/** Pointer to cell's CPU set. */
-	struct cpu_set *cpu_set;
-	/** Stores the cell's CPU set if small enough. */
-	struct cpu_set small_cpu_set;
+	/** Effective cell CPU set. */
+	struct cpu_set cpu_set;
 
 	/** True while the cell can be loaded by the root cell. */
 	bool loadable;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 35634e74..cb720af5 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -115,8 +115,8 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  */
 static inline bool cell_owns_cpu(struct cell *cell, unsigned int cpu_id)
 {
-	return (cpu_id <= cell->cpu_set->max_cpu_id &&
-		test_bit(cpu_id, cell->cpu_set->bitmap));
+	return (cpu_id <= cell->cpu_set.max_cpu_id &&
+		test_bit(cpu_id, cell->cpu_set.bitmap));
 }
 
 bool cpu_id_valid(unsigned long cpu_id);
diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
index 6d78ad6d..5ca81034 100644
--- a/hypervisor/include/jailhouse/types.h
+++ b/hypervisor/include/jailhouse/types.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2018
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -25,10 +25,8 @@ typedef enum { true = 1, false = 0 } bool;
 struct cpu_set {
 	/** Maximum CPU ID expressible with this set. */
 	unsigned long max_cpu_id;
-	/** Bitmap of CPUs in the set.
-	 * @note Typically, the bitmap is extended by embedding this structure
-	 * into a larger buffer. */
-	unsigned long bitmap[1];
+	/** Bitmap of CPUs in the set. */
+	unsigned long bitmap[(MAX_CPUS + BITS_PER_LONG - 1) / BITS_PER_LONG];
 };
 
 typedef signed char s8;
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index e4e7fe1f..91f1ae1a 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -168,7 +168,7 @@ static void init_late(void)
 	const struct jailhouse_memory *mem;
 	struct unit *unit;
 
-	for_each_cpu(cpu, root_cell.cpu_set)
+	for_each_cpu(cpu, &root_cell.cpu_set)
 		expected_cpus++;
 	if (hypervisor_header.online_cpus != expected_cpus) {
 		error = trace_error(-EINVAL);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-11-ralf.ramsauer%40oth-regensburg.de.
