Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F26055B9BD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 10-20020a1c020a000000b003a03f8cc1acsf3981377wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335620; cv=pass;
        d=google.com; s=arc-20160816;
        b=PfKSKgZw7Qc25WQXWuH43/WR3x/LhRoy231ChF2EgmOLZI7tvGepKC3ul+YXE46Mk7
         pRFMDG8svwGDnyU44/KHx3qUT1n3qQeD1PYQuhwPsuMKOrcogVkxXLNV3smro9M2YXMH
         WcFVgnI2nh25OBaJH5hDh41rxFTG04UlV0Zq2rtheCoZ6VYyMLDUSOIRkKPEK8lnsVbc
         Ci/34IMQHUKBbiuD34IaVY9QzIgZB42uYcva9cRSH0oN/+HeMikgbc5y4PmrfdGNE+6/
         egvSYPDvepydrLhXWbt9JwM6NuIM/DxpNreL/3Rf6T57T4UqJZefKJWqmYDv+5pghiGj
         i7KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=V47sIZwFHqb11HHYG2VmA+65d8mKVRpuiz7VF9i/fak=;
        b=PS80LWR4SmHmno1v3G6zN0AcQlAggpZzR6d0LzV9YOyFyyH64Kbq6QjUNsNI4313Zp
         GGYDeHaxvF2X/qU2WpEsoA9BkiHOoHZggARhNDXlVmLrbOtnEiNxfsfp5yKSE+31yj0N
         EKWtI07z7uVv1BoumRMl2F0/GUzje3nOhCKPXCSE1rIdpDggK79Ars36XgAUZ0vqzhp6
         9ZXTx8Bod1V705JhQrfyArnhPbBnSU0OMgjEFNCQG3Y3Y+hbUEclAy5RlSXB2EiHFMjr
         dQIjrYVYb4ORE9Z67ZArLpdDsQKh6QvCfLDLKVTXECnkPBkbL34SnsKKkxlvS8KPyTHk
         6vgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="a0/zJEbH";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V47sIZwFHqb11HHYG2VmA+65d8mKVRpuiz7VF9i/fak=;
        b=rk5hXD2wFbQbleKcpeDGjQKKObKrLUIo0TaZDaI+Y+dXFC38KXf26ZEu4SAZhEtl/4
         oGOKU8je1h+emZ1aWUpxDNfD1qQioWtA50LDvvrsqLO15s8EIoqpW8EhGSSFrlt5mF+s
         chlL27wcVhu/USKYcmcPBkb1yTW2Vt6FZBM7e5JU03tNhHrkPbHUpkB0uDLwueidGWP/
         5QqzL83KrRyO7biTGCtlPBK7887rPRoTK70ioNezeayaGiA65kwArPku2+q0RK1/uvUS
         qf/XPcJEtJs1CEu7M+JqYKwImGPh5pu4CtoYqPV5+UuD+5LdnAidKgoKcyV1tvIaxmEX
         84Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V47sIZwFHqb11HHYG2VmA+65d8mKVRpuiz7VF9i/fak=;
        b=AYAs76yhh8wCBGh+RNZ01gwwzLAZddJ5SxmT/35y7v7dDRa6MSSJz3jD1xGIuTeQ6/
         hy0uMnhmdqhi8k6IbgeSY+VbpfSwSs1ehdYaL7rH+amB033G3gbV7cRFiimq/o/dFOmR
         yLECq9dFNpXZ1xt0zNi6QeJ4CQceKd8uJ6XlZ+qAM/oJCFuzkFmdRfsCv04KL4RAw4PL
         +CUUpmfHxKNgcESWVeruqmYP9U50dehKwazOJdbedoREqKPA2jq5DGMRzw6F+PdCBY2P
         bqr+eU8U+KoXZnlWCAIi/Vhyx5NwqsU6WWfyzqIZ/XgKoBHm40bm91CFGjcHMpzZ63bF
         y/dA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9QdV2uOjvCtTI7MwdduQfRuvFO5bCCLN2FZPQtVcd5rL6GSNtg
	2dRtviElAuv53baKBB94DFI=
X-Google-Smtp-Source: AGRyM1vExI1q9j9eAGUdlDHWh3Z7CpRV3X0E6Dd7U2rv7jDaHh52pdagEk1DNEkunJ0eJb23/pltng==
X-Received: by 2002:a5d:4d02:0:b0:21b:89e9:87a9 with SMTP id z2-20020a5d4d02000000b0021b89e987a9mr11937996wrt.601.1656335619940;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5848:0:b0:219:b7ea:18e1 with SMTP id i8-20020a5d5848000000b00219b7ea18e1ls26728427wrf.2.gmail;
 Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id o9-20020a5d47c9000000b0020fe7da6a48mr12414442wrc.315.1656335618552;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335618; cv=none;
        d=google.com; s=arc-20160816;
        b=Ap6GKGze7Ktn+CbaKt0UCd4tePxAcNVHku0Z0GDSyyO8fMWQhxwybPI0avGIm8IVx6
         javNFylfWLCnX1fSNj6tUCRerdeVZlkQp8P1tHS/yerMKZ/xQvI7GlDVxCJ7btI4Yogy
         1X0EOozqU3uo8NYK9l15CAbHwSASpZCagL5mV5BIdfkfBEaWZh3o8Zva42UTSCURfMpz
         KR1TkJC8gPe5bBoB6yRouC6eNMbZaXdNdQ2jBWzbPLi/ycaIQPlMGMZb1z5WE0nkN+LW
         o711mgwUmLHKxUmgHDrG0a7w7zzA8AXpow/sloaLpHXzJmqLh2CztNtEwrb9ONFx/4Yo
         kkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M3VgLdbVR/iGeJeasngO9z3CJwrZiOnYgOE7V+BxftQ=;
        b=hWECRhe6NiuSOFzEL1Lj2ojZxJYfhiOFK5G549g7S5KoZAKMtsqOfsgSeyufQz+8QM
         eQJfDIihkS1783cCzSHhlvxbP6rCaW2ILCGodMe/u/f7Ml9Ub4vBpRx/8CqoiINkjAmV
         aq60vvWw/tYryyGsVOeXa9VHICbGSukka332txY5Ce3RtvctXB4AvTbyKlwr8sb7FY56
         Lv3bUZLB7AAyXnoZciwyoe3AVp0fE2iJdDWH07YqsqEyWpY+oi8YM5zIJd7FK5UoIeCz
         JykhN7IHb5++EQ/I4FWfDOqQqEB/2/FcjKZ1hImEJZ+C1yVN6OumRLDIoeLB25apU13r
         jcPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="a0/zJEbH";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id i17-20020a7bc951000000b0039c903985c6si602033wml.2.2022.06.27.06.13.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp821vKPzy2F;
	Mon, 27 Jun 2022 15:13:38 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:38 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 14/20] core: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:23 +0200
Message-ID: <20220627131329.3659-15-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="a0/zJEbH";
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

These are the necessary changes to adapt the hypervisor core to the new
struct-array CPU configuration format.

Some things become easier: cpu_id_valid() is now a simple inline bounds
check, counting CPUs is already done in the config. Other things become
more complex: An arch-provided cpu_by_phys_processor_id() is now
required in order to map a non-root cell CPU to the logical ID used
inside Jailhouse during cell creation. Jailhouse keeps the bitmap of
assigned CPUs per cell in order to iterate over them without requiring
that physical-to-logical mapping during critical code paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/lib.c         |  6 ++---
 hypervisor/arch/arm-common/psci.c        | 13 +++++----
 hypervisor/arch/arm64/gic-v3.c           | 20 +++++---------
 hypervisor/arch/arm64/paging.c           |  5 ++--
 hypervisor/arch/x86/apic.c               |  8 ++++++
 hypervisor/arch/x86/control.c            |  5 +---
 hypervisor/control.c                     | 34 +++++++++---------------
 hypervisor/include/jailhouse/control.h   |  2 --
 hypervisor/include/jailhouse/percpu.h    |  4 +--
 hypervisor/include/jailhouse/processor.h |  4 ++-
 hypervisor/setup.c                       | 17 ++++++------
 11 files changed, 52 insertions(+), 66 deletions(-)

diff --git a/hypervisor/arch/arm-common/lib.c b/hypervisor/arch/arm-common/lib.c
index 5c0dde0a..b3d48da7 100644
--- a/hypervisor/arch/arm-common/lib.c
+++ b/hypervisor/arch/arm-common/lib.c
@@ -23,12 +23,12 @@ unsigned long phys_processor_id(void)
 	return mpidr & MPIDR_CPUID_MASK;
 }
 
-unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr)
+unsigned int cpu_by_phys_processor_id(u64 phys_id)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, &cell->cpu_set)
-		if (mpidr == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
+	for (cpu = 0; cpu < system_config->root_cell.num_cpus; cpu++)
+		if (phys_id == (public_per_cpu(cpu)->mpidr & MPIDR_CPUID_MASK))
 			return cpu;
 
 	return INVALID_CPU_ID;
diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index a0f0b6a7..e832adf9 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) ARM Limited, 2014
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
@@ -13,6 +13,7 @@
  */
 
 #include <jailhouse/control.h>
+#include <jailhouse/processor.h>
 #include <asm/control.h>
 #include <asm/psci.h>
 #include <asm/smccc.h>
@@ -26,9 +27,8 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
 	unsigned int cpu;
 	long result;
 
-	cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1] & mask);
-	if (cpu == INVALID_CPU_ID)
-		/* Virtual id not in set */
+	cpu = cpu_by_phys_processor_id(ctx->regs[1] & mask);
+	if (!cell_owns_cpu(this_cell(), cpu))
 		return PSCI_DENIED;
 
 	target_data = public_per_cpu(cpu);
@@ -61,10 +61,9 @@ static long psci_emulate_cpu_on(struct trap_context *ctx)
 
 static long psci_emulate_affinity_info(struct trap_context *ctx)
 {
-	unsigned int cpu = arm_cpu_by_mpidr(this_cell(), ctx->regs[1]);
+	unsigned int cpu = cpu_by_phys_processor_id(ctx->regs[1]);
 
-	if (cpu == INVALID_CPU_ID)
-		/* Virtual id not in set */
+	if (!cell_owns_cpu(this_cell(), cpu))
 		return PSCI_DENIED;
 
 	return public_per_cpu(cpu)->wait_for_poweron ?
diff --git a/hypervisor/arch/arm64/gic-v3.c b/hypervisor/arch/arm64/gic-v3.c
index 8d18f6ec..3da0053f 100644
--- a/hypervisor/arch/arm64/gic-v3.c
+++ b/hypervisor/arch/arm64/gic-v3.c
@@ -35,7 +35,6 @@
 
 static unsigned int gic_num_lr;
 static unsigned int gic_num_priority_bits;
-static unsigned int last_gicr;
 static u32 gic_version;
 
 static void *gicr_base;
@@ -136,10 +135,6 @@ static int gicv3_init(void)
 	if (!(mmio_read32(gicd_base + GICD_CTLR) & GICD_CTLR_ARE_NS))
 		return trace_error(-EIO);
 
-	last_gicr = system_config->root_cell.cpu_set_size * 8 - 1;
-	while (!cpu_id_valid(last_gicr))
-		last_gicr--;
-
 	/*
 	 * Let the per-cpu code access the redistributors. This makes the
 	 * assumption, that redistributors can be found in a sequence.
@@ -147,7 +142,7 @@ static int gicv3_init(void)
 	if (gic_version == 4)
 		redist_size = GIC_V4_REDIST_SIZE;
 
-	gicr_size = redist_size * (last_gicr + 1);
+	gicr_size = redist_size * system_config->root_cell.num_cpus;
 	gicr_base = paging_map_device(
 			system_config->platform_info.arm.gicr_base, gicr_size);
 	if (!gicr_base)
@@ -341,8 +336,8 @@ static void gicv3_adjust_irq_target(struct cell *cell, u16 irq_id)
 {
 	void *irouter = gicd_base + GICD_IROUTER + 8 * irq_id;
 	u64 mpidr = public_per_cpu(first_cpu(&cell->cpu_set))->mpidr;
-	u32 route = arm_cpu_by_mpidr(cell,
-				     mmio_read64(irouter) & MPIDR_CPUID_MASK);
+	unsigned int route = cpu_by_phys_processor_id(mmio_read64(irouter) &
+						      MPIDR_CPUID_MASK);
 
 	if (!cell_owns_cpu(cell, route))
 		mmio_write64(irouter, mpidr);
@@ -357,8 +352,8 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 	switch (mmio->address) {
 	case GICR_TYPER:
 		mmio_perform_access(cpu_public->gicr.base, mmio);
-		if (cpu_public->cpu_id == last_gicr)
-				mmio->value |= GICR_TYPER_Last;
+		if (cpu_public->cpu_id == system_config->root_cell.num_cpus - 1)
+			mmio->value |= GICR_TYPER_Last;
 		return MMIO_HANDLED;
 	case GICR_TYPER + 4:
 		mmio_perform_access(cpu_public->gicr.base, mmio);
@@ -409,14 +404,11 @@ static int gicv3_cell_init(struct cell *cell)
 	 * We register all regions so that the cell can iterate over the
 	 * original range in order to find corresponding redistributors.
 	 */
-	for (cpu = 0; cpu < system_config->root_cell.cpu_set_size * 8; cpu++) {
-		if (!cpu_id_valid(cpu))
-			continue;
+	for (cpu = 0; cpu < system_config->root_cell.num_cpus; cpu++)
 		mmio_region_register(cell, public_per_cpu(cpu)->gicr.phys_addr,
 				     gic_version == 4 ? 0x40000 : 0x20000,
 				     gicv3_handle_redist_access,
 				     public_per_cpu(cpu));
-	}
 
 	return 0;
 }
diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index 27adcf55..cc3c50f7 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -38,9 +38,8 @@ unsigned int get_cpu_parange(void)
 	 * for_each_cpu yet. So we need to iterate over the configuration
 	 * of the root cell.
 	 */
-	for (cpu = 0; cpu < system_config->root_cell.cpu_set_size * 8; cpu++)
-		if (cpu_id_valid(cpu) &&
-		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
+	for (cpu = 0; cpu < system_config->root_cell.num_cpus; cpu++)
+		if ((per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
 			cpu_parange_encoded = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
 
 	return cpu_parange_encoded < ARRAY_SIZE(pa_bits) ?
diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index 9c6313eb..74b43e5d 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -140,6 +140,14 @@ unsigned long phys_processor_id(void)
 	return apic_ops.read_id();
 }
 
+unsigned int cpu_by_phys_processor_id(u64 phys_id)
+{
+	unsigned int cpu_id = phys_id < APIC_MAX_PHYS_ID ?
+		apic_to_cpu_id[phys_id] : INVALID_CPU_ID;
+
+	return cpu_id != APIC_INVALID_CPU ? cpu_id : INVALID_CPU_ID;
+}
+
 int apic_cpu_init(struct per_cpu *cpu_data)
 {
 	unsigned int xlc = MAX((apic_ext_features() >> 16) & 0xff,
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 3d84308d..188a6d19 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -88,13 +88,10 @@ void arch_cell_destroy(struct cell *cell)
 void arch_cell_reset(struct cell *cell)
 {
 	struct jailhouse_comm_region *comm_region = &cell->comm_page.comm_region;
-	unsigned int cpu;
 
 	comm_region->pm_timer_address =
 		system_config->platform_info.x86.pm_timer_address;
-	/* comm_region, and hence num_cpus, is zero-initialised */
-	for_each_cpu(cpu, &cell->cpu_set)
-		comm_region->num_cpus++;
+	comm_region->num_cpus = cell->config->num_cpus;
 	comm_region->tsc_khz = system_config->platform_info.x86.tsc_khz;
 	comm_region->apic_khz = system_config->platform_info.x86.apic_khz;
 
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 9642493c..8eaaa46a 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -58,22 +58,6 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
 	return cpu;
 }
 
-/**
- * Check if a CPU ID is contained in the system's CPU set, i.e. the initial CPU
- * set of the root cell.
- * @param cpu_id	CPU ID to check.
- *
- * @return True if CPU ID is valid.
- */
-bool cpu_id_valid(unsigned long cpu_id)
-{
-	const unsigned long *system_cpu_set =
-		jailhouse_cell_cpu_set(&system_config->root_cell);
-
-	return (cpu_id < system_config->root_cell.cpu_set_size * 8 &&
-		test_bit(cpu_id, system_cpu_set));
-}
-
 /**
  * Suspend a remote CPU.
  * @param cpu_id	ID of the target CPU.
@@ -240,14 +224,22 @@ static void cell_reconfig_completed(void)
  */
 int cell_init(struct cell *cell)
 {
-	const unsigned long *config_cpu_set =
-		jailhouse_cell_cpu_set(cell->config);
-	unsigned long cpu_set_size = cell->config->cpu_set_size;
+	const struct jailhouse_cpu *cell_cpu =
+		jailhouse_cell_cpus(cell->config);
+	unsigned long cpu_set_size = (cell->config->num_cpus + 7) / 8;
+	unsigned int cpu_idx, result;
 
 	if (cpu_set_size > sizeof(cell->cpu_set.bitmap))
 		return trace_error(-EINVAL);
 	cell->cpu_set.max_cpu_id = cpu_set_size * 8 - 1;
-	memcpy(cell->cpu_set.bitmap, config_cpu_set, cpu_set_size);
+
+	for (cpu_idx = 0; cpu_idx < cell->config->num_cpus; cpu_idx++) {
+		result = cpu_by_phys_processor_id(cell_cpu[cpu_idx].phys_id);
+		if (result == INVALID_CPU_ID)
+			return -ENOENT;
+
+		set_bit(result, cell->cpu_set.bitmap);
+	}
 
 	return mmio_cell_init(cell);
 }
@@ -892,7 +884,7 @@ static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
 static int cpu_get_info(struct per_cpu *cpu_data, unsigned long cpu_id,
 			unsigned long type)
 {
-	if (!cpu_id_valid(cpu_id))
+	if (cpu_id >= system_config->root_cell.num_cpus)
 		return -EINVAL;
 
 	/*
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index cb720af5..f01af617 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -119,8 +119,6 @@ static inline bool cell_owns_cpu(struct cell *cell, unsigned int cpu_id)
 		test_bit(cpu_id, cell->cpu_set.bitmap));
 }
 
-bool cpu_id_valid(unsigned long cpu_id);
-
 int cell_init(struct cell *cell);
 
 void config_commit(struct cell *cell_added_removed);
diff --git a/hypervisor/include/jailhouse/percpu.h b/hypervisor/include/jailhouse/percpu.h
index 4f0867da..c5a9c109 100644
--- a/hypervisor/include/jailhouse/percpu.h
+++ b/hypervisor/include/jailhouse/percpu.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2018
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -34,7 +34,7 @@ struct public_per_cpu {
 	 *  page walks at any time. */
 	u8 root_table_page[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
 
-	/** Logical CPU ID (same as Linux). */
+	/** Logical CPU ID. */
 	unsigned int cpu_id;
 	/** Owning cell. */
 	struct cell *cell;
diff --git a/hypervisor/include/jailhouse/processor.h b/hypervisor/include/jailhouse/processor.h
index 639b2e5e..26f0907f 100644
--- a/hypervisor/include/jailhouse/processor.h
+++ b/hypervisor/include/jailhouse/processor.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -16,4 +16,6 @@
 
 unsigned long phys_processor_id(void);
 
+unsigned int cpu_by_phys_processor_id(u64 phys_id);
+
 #endif
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 7f7cf041..00bc280c 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -59,6 +59,11 @@ static void init_early(unsigned int cpu_id)
 
 	root_cell.config = &system_config->root_cell;
 
+	if (hypervisor_header.online_cpus != root_cell.config->num_cpus) {
+		error = trace_error(-EINVAL);
+		return;
+	}
+
 	error = arch_init_early();
 	if (error)
 		return;
@@ -99,7 +104,8 @@ static void cpu_init(struct per_cpu *cpu_data)
 
 	printk(" CPU %d... ", cpu_data->public.cpu_id);
 
-	if (!cpu_id_valid(cpu_data->public.cpu_id))
+	if (cpu_data->public.cpu_id >= system_config->root_cell.num_cpus ||
+	    cpu_data->public.cell != NULL)
 		goto failed;
 
 	cpu_data->public.cell = &root_cell;
@@ -160,21 +166,14 @@ failed:
 
 static void init_late(void)
 {
-	unsigned int n, cpu, expected_cpus = 0;
 	const struct jailhouse_memory *mem;
 	struct unit *unit;
+	unsigned int n;
 
 	error = cell_init(&root_cell);
 	if (error)
 		return;
 
-	for_each_cpu(cpu, &root_cell.cpu_set)
-		expected_cpus++;
-	if (hypervisor_header.online_cpus != expected_cpus) {
-		error = trace_error(-EINVAL);
-		return;
-	}
-
 	for_each_unit(unit) {
 		printk("Initializing unit: %s\n", unit->name);
 		error = unit->init();
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-15-ralf.ramsauer%40oth-regensburg.de.
