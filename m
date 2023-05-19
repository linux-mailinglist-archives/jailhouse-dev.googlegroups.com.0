Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBT55T6RQMGQEZ3YMIKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F1870A0BF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:48 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id ffacd0b85a97d-3079d15b51dsf654046f8f.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528848; cv=pass;
        d=google.com; s=arc-20160816;
        b=DseqVNRZ1Q8RHB3ch81m1as18dfgrugwS9lHzitYbA7wqYWWlMfMVD6HzE/v4XMtGt
         /665VBO8eDgmYfjiQVI7rk5MLS+r/Zy20HF5x265q+0KuiiYAMDC5KINaWwQSVJNdHEe
         Z24rZEEVMkDh3JbsWJk2C7/lz1FKEIkOhaqEZE9JK1hv632HsGYzuT0nXemXZh0UEG3L
         rNgB/MkDAO+mYPmfNoTh0+RaBe1OQlMNPacbn6YT6GKaoE58K6OOx3ujGgToAhcUKuR9
         GhZGxGg3lrjnzklUh3faB4gQNp4O9lA8oSehJtCMLmis0yNy4eoPkys6DBxfAkh5Y0LJ
         HYgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OhCQwo1KIGj/73k3YOtpF9hxZx7jpak6joI7DslhsX4=;
        b=iu1y9hgvmH0u3Pvv7ittk2JXIpRh4JsivNGFO0uj80XCzz9S6dnxqTxkptJp7k8i1l
         de7h3agkD3VCKod/NRJMyMiLoPlHM/ijIRCpMeSrBeunOyvjIS22nBEetYvCbA9b455o
         ee60tf+Ol2eCR1T4Sln58QKOYFPrnhrqJj5gH/wDUuZLQL6tgWstDyfyCw+LhPMw7tGX
         tohWGWsJKt6d6Dyw/CIuHUyO8ywQQ2xiMY4pQknIkCpAZ7JKUF/9zPqZRjzX6HeC5lEx
         CwZ7BBXu4UrCrm3HV2wbwxkBnYYGJpBPii/lle8X6EyTHfN4BvjpFoPQxh0xP5mYuuN7
         QUHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528848; x=1687120848;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhCQwo1KIGj/73k3YOtpF9hxZx7jpak6joI7DslhsX4=;
        b=rtIuNUD4eElDzaeKQAVxxJdQAGEuNxGiSjdaxCS8N/BazAaVGEe50NuNVXLCJrMXxJ
         X3ypd0p9myZfeE9ovsVWV+TpPJPACUDz/udjF1gP/QFUNWXVlmZYrEssmO7KUVmadEQv
         VXGmGe0KuTT96vf34Le9sGIDLKud9ghXd+7kegGJdc1BzO5DAV6aqDnD+0yC57MlQasP
         bmSD5+i19EXIm1Be6LzAzOwZVWFNRhPlQcHwHyh60fosJH0XJClG0nHk049GpaLpG/Xk
         RqfUUK5az3Avzbbd0nL866LLFWTDqiT2uLpydvbsaQXZeaPCnKx3ayIeQyxdEELKZSrV
         +pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528848; x=1687120848;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhCQwo1KIGj/73k3YOtpF9hxZx7jpak6joI7DslhsX4=;
        b=YGBkFQ1KCCpixhQO8/ngne+26Ch3hYVCGbbqBAtyX0Brrg1xPzg2xxrID4RUCLt1fM
         HXj5Uc/2SybkKOq/qSfaJanNM4tX5nUq7FF4o9dGk6CygTGfkjlPecKc525qY3+wWKfT
         OolXMycFomaUQ+qFLNkM09P5R9wZVJpN7cIzfucXPDvbyiL11RyWDfa73/Izo0VZRWQt
         G3iR1iKDjAgdcLQOtZ5+0VQ6CAYrnNUT99UmRLf5mn3PkmW45mCpliMGHinBpDdwRp7B
         oU/V+CTfKBQidzJnpE/rK3ZhCnqyXwDpG3W6fdbW3iuLS9y/JJ4LG1phNT44yjGDEYtg
         UVJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxlCGywt9XktzVvelwQGw7GHYvmMHKBYNspLcEUt8A/w6baGUia
	9jBh2WflVU3NiSAMvPIydas=
X-Google-Smtp-Source: ACHHUZ5IFcQMF7kAhm0zEbnz0aTizaJsaMH7ljzta57sZIv9hxXbsiogM1hJobWpLWxdR3yRhE1yRQ==
X-Received: by 2002:a5d:5c0f:0:b0:309:4935:3bd3 with SMTP id cc15-20020a5d5c0f000000b0030949353bd3mr1604683wrb.5.1684528848073;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da1:b0:3f4:f1c0:4e20 with SMTP id
 p33-20020a05600c1da100b003f4f1c04e20ls1510166wms.0.-pod-prod-06-eu; Fri, 19
 May 2023 13:40:46 -0700 (PDT)
X-Received: by 2002:a7b:c396:0:b0:3f4:29c2:1cd0 with SMTP id s22-20020a7bc396000000b003f429c21cd0mr2360108wmj.25.1684528846424;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528846; cv=none;
        d=google.com; s=arc-20160816;
        b=0uHwhzINCF/kRVbyYz3LNVIQ1YvSaps2G5dyB4eEH5RWhPaFkkOJEyOC2l47WmfMCz
         DxNUjxMo7lO8kK7gT5bKFHsIxhmjzVv0TzVru/+hBDX8SwdoUbVsqTw8MX7C2xtppgO3
         AhisecFVfNhkc/KY4IKTbZBF/FvSk229aV+jedEYz44Kgy+jEZtmb9ryz+y9Ms2zzowt
         Co0BlY56UJ132WVl7TVQDdIPJ5sMG6t07wVw39GoL+/b7zSbQ7tCiSBIx+Nv8NWU1HEG
         jXt0iFZKFQVSa9z6hnmMUbnnObgH7Df/t3TPmaaNLcfv7PVuKaA2ljCkqg5CFcnM4ntS
         wz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PwpRY7o0x2MJzbSigrzKZ65PXHgd8TaO0LHaFsErg54=;
        b=P1FE8MTKcKE0ve8DjoFXDTrM+lU4vRqpwD2txAMYwAbhp5XWD2OVJJK3vW2YtK2mG1
         ecQeHNwRnnV9kHg2AGS/pmpxPmgQVf6emfsJqberk6eUv+TPAYVZ3JWGrWx8ocHUj64H
         N5ZaDi4g5jxL8n+n8biM94C0RUdB0lGn/YAKbUGwZhmqKVChw9cvRjGTxT0X5a4qm2Wl
         +ZIDqvCivii4v4rw52RzC8ZLbj7sNydYmKG0yVSxJqlmJGR8NyK6ajvEDJYcDg1/zY+Y
         /8N0ThxkfBWp7Uyz/drvuve7UoylxK1VsQHtO+FhMfNEb1fYjPXrKhJ/yBNC7LBq1hPr
         PP3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id ay29-20020a05600c1e1d00b003f1942078f5si620610wmb.2.2023.05.19.13.40.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdT5xTCzxrD;
	Fri, 19 May 2023 22:40:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 14/73] core: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:34 +0200
Message-Id: <20230519204033.643200-15-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-15-ralf.ramsauer%40oth-regensburg.de.
