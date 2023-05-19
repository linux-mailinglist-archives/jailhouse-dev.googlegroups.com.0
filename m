Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTV5T6RQMGQEO6BQK2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A9870A0BD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:48 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2af1a18584bsf11991421fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528847; cv=pass;
        d=google.com; s=arc-20160816;
        b=YQr+yfIQ+63f47Snokcd+UlGbpbizllj86hvy/hdx6li/yHdLGQIXnHdWFiJXoTMJj
         HkraRhu2dCCwvWphOnwumYNV98vmjOH32S9dCePNlrHLao+eW8sw3lpqJVHgePk2Mc3s
         +O7Y8Cf2IEIhkoEPHx8WFGYKLcA31Yknrz+9HNfkmYR/QW6L0zwz1VG1ySUxo5D/xnuL
         6QeFwNA8+3hfbr6hGkEGA0ZdpBot8JiPi+/TrTm94nvBkjgbCRl3tbDGryWMpfu1rNjS
         yQRhUo1qVOB38QUy1DzQvN0Hi7a2X3/qDE+Snze0yyJCyVPEv6XvsqgYTUBRh/BYjLyj
         SRwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g/+Y2dVtP6EThg4nymxqZ8ePROSVzphDwLfFFWJTH5g=;
        b=0jsXIeUBq6pgyIa2zQLh1WJg86y4tBmPU61JAgajop9IqAI06ENNoApIHHItU0vxSU
         AHMqKTy6IioDZh7gK9NBSsXaj+X7YZ3DVZ3R6ftepOJSu/Z4MwZ6K/0K59mii7w5Eo/N
         r1tzTp6l+J5dvg+cPSbllj1+WP/ktoyFBi9BYMdmRWcfk2ToCKklBm8qQNhVcXC2YGeh
         4dt7BwaDAHnnpZMjTBRggxDNKxxJ5hn/5PDW8Gw7h2aprrsSjsSJr9S2nVhcnaOJbuow
         9fhE3R8HT6Y7Tjk3kC05pvJ5mvH3dbUc+VwTHXYzGYClnGiN9qaJ78nGsXyCADEivrJG
         45zg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/+Y2dVtP6EThg4nymxqZ8ePROSVzphDwLfFFWJTH5g=;
        b=tQvUBso163HYLKEffo3rc7ijLR341RWGWLaporjJGDhYA0SF5izivsXDo/di8Z4S3b
         HtE/LRyrRHykZg+EGMIg/63vp9aHNqXcZJetlulhxdBGihQq9iV4n++4WK+WWAdBfz7y
         tNyz7u7EIhd2W6fi0wclyC0vybS1a9qBN8oy2V1PXn7OhT7K5lMNSUUcY1AWAp7dsdmi
         JH7eXiqXlhHBZqVRBnHcnWZY2XHjE9HPERHjUIjmWwOgZORJndlZrGpLlLppFIm22T/4
         Xi2BbXQVd3ujyXITvvceKB0p1gmxWCf1DHqt6IaRJXzNoHnCj6zdSLIutOCr3+EfHFuC
         RpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/+Y2dVtP6EThg4nymxqZ8ePROSVzphDwLfFFWJTH5g=;
        b=dCl88yPcORER3MJsilmem059aeYxV8d7AjmjyvG8h9ao9aRajZxlvghNb/tmUetLj4
         8+cJ3rIay24Svg+PP89FQfgOqzEhOcwplWaB6vl5dOszUc0CV+lEf+FyLrvye5NQwcyA
         5llIPrFGYOMxNuatZGE7iMY3ElAK6GDyKjCItQGH+WXbv+eOCM0QKZIjbbA7VEMSjf8O
         M2hrAUy+awLycYKAO5J6s/esvBi5zCyRNVT32CpqaC7QKIOvoTbLm5tUcPZ7HxIeRKm3
         9AtIROYazhSK/xe5fc7HZ1BwY8jZGlDXouWJuO/z0+6cwucfZEy9jbx8rVSfiD5UjlBe
         Xa6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxsi/eKu1xhZTq8wxnhTMTa8BvVksymqvV/8pYDEv9V1D3JnNHN
	93ZfUkP1vWijrF+ZzP59JkU=
X-Google-Smtp-Source: ACHHUZ7NgsINeNmUFdOCtMcbGJKpmPEcUspSI5Cxj60mHg2lUgpE4tpXXZ0sUiiCbJqLHxxSCiLxQA==
X-Received: by 2002:a2e:7811:0:b0:2ac:771b:ca4a with SMTP id t17-20020a2e7811000000b002ac771bca4amr739113ljc.9.1684528847525;
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7715:0:b0:4f2:5056:2be with SMTP id s21-20020a197715000000b004f2505602bels341072lfc.0.-pod-prod-04-eu;
 Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-Received: by 2002:ac2:4ada:0:b0:4f3:a106:6245 with SMTP id m26-20020ac24ada000000b004f3a1066245mr1028468lfp.23.1684528845457;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528845; cv=none;
        d=google.com; s=arc-20160816;
        b=Gz9HlAGVVURFlXdxPi9emj3/BfGNnoHkjgdMfJA/HVbV2iS0nk0x3sLHFMWb9z5CxC
         n1vKm78+sXW52gdiaGmaxmpXcvC6yuT0JpakaQLPdQCPtHyc48XLsyk8nahiwBGWfRLU
         YyqbaHynyfQEXzjiHTx5FTPBBRad9i52Zg49iggjN/qNU/ii79VyqWOw9VFuWOrK9A1A
         qmonFDtsfLaNFg9FWBtC31heIyRlUkeY+I+DL8zIqw1DIF7sZ0jKDUf0CeRcppFWmFf4
         3jHOYwkgkWhzwowSYfOtNjU/NvQak6uUA8Ka38+toBTiNYY4y8pfhVbcyZ8rZrS3ZoAK
         Jx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=oXIDO1JGJf4VEX7tNE8Ra4zfw+m4Vuvkt/zHkOl9VWQ=;
        b=UZR+5tgxQ94WHB+tLbaQHran3V/wHzb08VIuH7jmEkIQpf4ma3WxWwIq1k8zlAKEs0
         2QBiRjet8U4/kd27HZB1L9KXrWGkHuWMD/UVtDNXqVPSQuWZQmcIogk1d0p+2oV+E3nb
         8D9yVpVEkEXmVKMLieN+C2+rHCjH1dJIEe0tfJx5SfVolua3BfhY90hcvfutzwzHF7y4
         hlD6HemCMaowER251hifHuELNlyqyQvWJNxcBbKcqmUpjs9AOXR10nkFXbwXh5d+MUI3
         vmVzIR1HWGYyu4h/SFhoPmUsc5sxdBfjVHZuYUhuFBXO0Mprd3XAmCgRYBEMCEBl3gbP
         eg5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s18-20020a056512315200b004f145238b58si11916lfi.4.2023.05.19.13.40.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdS4Ll6zxtl;
	Fri, 19 May 2023 22:40:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 10/73] core: Use statically sized cpu sets
Date: Fri, 19 May 2023 22:39:30 +0200
Message-Id: <20230519204033.643200-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-11-ralf.ramsauer%40oth-regensburg.de.
