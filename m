Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBT55T6RQMGQEZ3YMIKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C89570A0C0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:49 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id 38308e7fff4ca-2af23cfd23asf6224321fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528848; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZyCgm+jMNe8Qv/7f3kG3S8UY8MQEEY3fgjBsY7oV6R/74UzIAjwpaHRT1hHO5YrRKX
         1wFmmiVyEcTDFa2dDluRYg7nu+Zh7Z0frnzhiUWwXHevdRFIIdjFvlxvXt6z6IN+Cwqq
         ipdcXVwORVG5Hx58vrEM57jhDFbypgkoRAmUq62B2ymgrzEpzsxH2H4otHYwUSVBv50v
         GlqcRoNr9Td9HKjdTD3NQ9cLrNwMqjjyuc9RFzHjxNFggdO1iERog+PZ71NiwzhIna+l
         LTpgxYdVGwzDpYZG5WUB+kJscIEhRx37rloxufHL//h53RQgYaJrWc5FtiZurVnddpXP
         ahRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9t0TjVZZPWRoEDZOk17RghfZri3C1/sKFYccVrIwHEc=;
        b=Da68GULihyOe1i7UB7ytGUSoB2kz/+332He/QRMg5Dv+wvts916dsnLcTH2XCKqCC2
         dRqbCDV4ZKS5tbTZFPxWeWVfkiTVvdl0qlFY175EoScw7R0hPf73pBnIwxRerDSK7hbf
         pa4jFMC9V/xEWo7p6GPDRgEdqXwg+CFVQmj88jNjtFtA7afRzV3gSZtB0MRp4H/pxIes
         RaZH7aOwOJuS0hy1p/WLwFJ01nYkvek7JKe8huy3Iw3iMd89Gkx7DD/1VYeRe0T8/f3T
         zsJ0YR5xN64mgV7K0/zCkavI+B0RoZgDqBw9hIOjrlGNtHUErE9YlZgYKxO3VRZRyzYX
         nycQ==
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
        bh=9t0TjVZZPWRoEDZOk17RghfZri3C1/sKFYccVrIwHEc=;
        b=jIBiUKmdI33WJfaoJOwy/+zFHz6wMYHAI5D2appP71pHJYoGDFCbI3pzdpXKe4pvwS
         OBAVaqX/PAABmODiNE3wtpWFepDAKKP+t32A4GFn9Cj0xMrzp+ZXfRYJaPYvA8W4iWh6
         1JSAdjrR2j9Js48jUoDo07vwgFiHEeVbQn9kO8obf8oQEyQQ0lyHLkCSGlSkzgucXehe
         192HjzUJ+B2TosOBBpiT4mcFaYKW1htLfsKqv/3X5Ps88fGxgJu91rjiIC+chnCttgeg
         MCMLTdl4jAMaDkAyq4wVIrkCbNjn4rRjIdgMXKRA9OPFmDjg7JLWflDKzO3hRl6U5oyo
         g7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528848; x=1687120848;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t0TjVZZPWRoEDZOk17RghfZri3C1/sKFYccVrIwHEc=;
        b=fsNo368+++pQujeUC8qryqN2sJBaEAZpCGc75PqnD5TM8T3zDqBmgPQ6uLyvpJKuvU
         OZ8TvmH3ELvsUfuc75CXLI+Ysxtr8Qzactr8qDZU4tZyKkX37T1xSWBWXSAbMiRxZ0P2
         PMKFKpKwMY0lR6cP5sdYfsRA+juA6ZQlnI+nx6HAnSpBEniq36pN0PO5+WnVMUtoGpdF
         nK0kQEmGqz3mrqOLPhnjnMCmC7j4uu4l/CDYmxGdkTxDPIQphboN/zGp4Kr3olm4KeUe
         gTjrBFKbMIrCd48mD1VuQJ5HsL8EwuJWxEdHRWdS4nepjeSoqnZ5V00iyxm6+N8xHCQp
         ffBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyphnyPLkzjRnTE56eM8Js94SEg5SBHpHfDXQFw6JXPO8/elLFQ
	g1OWVZygNX8ouW9bf4jh3HFLgg==
X-Google-Smtp-Source: ACHHUZ64WwZ6GRY+iBn71n3QHnV8FgyjddMm5udM1gM4WVdJcqG20gwXYhoJ+eKMHqs4es7mAKoGqA==
X-Received: by 2002:a19:c517:0:b0:4dd:a4e1:4861 with SMTP id w23-20020a19c517000000b004dda4e14861mr880318lfe.3.1684528848505;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:311c:b0:4f1:3be1:1d6 with SMTP id
 n28-20020a056512311c00b004f13be101d6ls272845lfb.1.-pod-prod-08-eu; Fri, 19
 May 2023 13:40:46 -0700 (PDT)
X-Received: by 2002:a05:6512:21a:b0:4f2:50ea:c7a2 with SMTP id a26-20020a056512021a00b004f250eac7a2mr1160213lfo.40.1684528846331;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528846; cv=none;
        d=google.com; s=arc-20160816;
        b=OAB23Z0uHJfs/6ptDMGy1p083Q8jv8jC/W4j3N0lriBklsblmzEaN11z3os/so9OQ6
         gJkGG1SaH7VTotQQ3aPJy67y27Wwrw8/VvaBxJDzwNchDvZnkAKQ73Fc+vYCWMW8K+lX
         pJpPjfWyz7e5KqrVEQUYh7if5y+DVEQuZQWhl0PCQ8rsWStTLNx47ntbg7u/idmrFBLa
         3eAWh3KQLTxnbfmIUmo0fq+8cgxkVSgC4ZHnaHbkwqm2cssleuVVcG+7kaPSIX66gPIY
         oya5EKd+4/UCHKPAAgF26HArg9i1rQPxG9Mq5VadJ9J7U7m56QnOTXKpjbwfY2KFx6cf
         Rx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Q4hp+CJ4H2f2ICs+NH6IDJ1xinVJF9f8MVPHHtbcx14=;
        b=Ept9qF6YPap/ktVpu39Lm+ztdNgYXaOAVa4YSMK1IEJrKcYW2k8B+3hDujYflr2oNC
         ziCuVHjdzxUU055PU71xuwsM66VVBFa6rJQvfpLu33TwBZC3vqwXEV896y7xF/ef8H+l
         3PYZmOCEHCbbLau6qK7869vrKVCTfMfSpFzQlyQqmwZg+UA9h92BJ8K3VzSSYaFgHgFY
         OzjtMZKbttcaF0EAeO6H90FN1sCnbYlfybvZ/nP+/5eE5v/lVftjqDX787nfterotA1w
         D5XcQ9LzOwxfmVfY9hrf8SEoCOGlW9iz93UCWKT1EUQevW5dvAtjGUSlACfOA7gPFu5C
         uhBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id v20-20020ac258f4000000b004f3b045aa3asi13968lfo.3.2023.05.19.13.40.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdT33Bmzxpk;
	Fri, 19 May 2023 22:40:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 13/73] driver: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:33 +0200
Message-Id: <20230519204033.643200-14-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PASSWORD_IN_BODY 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS , __URI_NS_NXDOMAIN '
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

The new format requires the driver to identify a CPU by its physical ID
and then pass its config array index to the hypervisor, both on enabling
as well as during runtime (status queries).

For that purpose, two per-cpu variables are initialized while enabling
Jailhouse: phys_cpu_id and jailhouse_cpu_id. Those allow to map the
physical and the Jailhouse-logical CPU IDs to the Linux-logical ID.
Where possible, Jailhouse will validate this mapping during setup.

The driver continues to maintain shadow cpumasks for the assigned CPUs
of a cell using Linux IDs so that those masks can be used for iterating
over them on Linux side.

The new configuration format allows the Linux and Jailhouse CPU ordering
to deviate. As this can cause confusion, a warning is issued by the
driver when such a constellation is detected during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/cell.c  | 20 +++++++----
 driver/main.c  | 96 +++++++++++++++++++++++++++++---------------------
 driver/main.h  |  5 ++-
 driver/sysfs.c | 20 +++++++----
 4 files changed, 87 insertions(+), 54 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 11765fa3..6c15dd22 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -47,8 +47,10 @@ void jailhouse_cell_kobj_release(struct kobject *kobj)
 
 static struct cell *cell_create(const struct jailhouse_cell_desc *cell_desc)
 {
+	const struct jailhouse_cpu *cell_cpu = jailhouse_cell_cpus(cell_desc);
+	unsigned int id, n, cpu;
 	struct cell *cell;
-	unsigned int id;
+	u64 phys_cpu;
 	int err;
 
 	if (cell_desc->num_memory_regions >=
@@ -72,10 +74,16 @@ retry:
 
 	cell->id = id;
 
-	bitmap_copy(cpumask_bits(&cell->cpus_assigned),
-		    jailhouse_cell_cpu_set(cell_desc),
-		    min((unsigned int)nr_cpumask_bits,
-		        cell_desc->cpu_set_size * 8));
+	for (n = 0; n < cell_desc->num_cpus; n++) {
+		phys_cpu = cell_cpu[n].phys_id;
+
+		for_each_possible_cpu(cpu) {
+			if (per_cpu(phys_cpu_id, cpu) == phys_cpu) {
+				cpumask_set_cpu(cpu, &cell->cpus_assigned);
+				break;
+			}
+		}
+	}
 
 	cell->num_memory_regions = cell_desc->num_memory_regions;
 	cell->memory_regions = vmalloc(sizeof(struct jailhouse_memory) *
diff --git a/driver/main.c b/driver/main.c
index c8572470..c52874af 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2017
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -39,6 +39,7 @@
 #include <asm/tlbflush.h>
 #ifdef CONFIG_ARM
 #include <asm/virt.h>
+#include <asm/cputype.h>
 #endif
 #ifdef CONFIG_X86
 #include <asm/msr.h>
@@ -97,9 +98,13 @@ DEFINE_MUTEX(jailhouse_lock);
 bool jailhouse_enabled;
 void *hypervisor_mem;
 
+DEFINE_PER_CPU(u64, phys_cpu_id);
+DEFINE_PER_CPU(int, jailhouse_cpu_id) = -1;
+
 static struct device *jailhouse_dev;
 static unsigned long hv_core_and_percpu_size;
 static atomic_t call_done;
+static atomic_t cpu_mismatch;
 static int error_code;
 static struct jailhouse_virt_console* volatile console_page;
 static bool console_available;
@@ -151,6 +156,42 @@ static void init_hypercall(void)
 }
 #endif
 
+static u64 get_physical_cpu_id(void)
+{
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+	return read_cpuid_mpidr() & MPIDR_HWID_BITMASK;
+#elif defined(CONFIG_X86)
+	return read_apic_id();
+#else
+#	error Unsupported architecture
+#endif
+}
+
+static void identify_cpu(void *info)
+{
+	struct jailhouse_cell_desc *root_desc = info;
+	const struct jailhouse_cpu *cell_cpu = jailhouse_cell_cpus(root_desc);
+	u64 phys_id = get_physical_cpu_id();
+	unsigned int cpu;
+
+	for (cpu = 0; cpu < root_desc->num_cpus; cpu++) {
+		if (cell_cpu[cpu].phys_id == phys_id) {
+			this_cpu_write(phys_cpu_id, phys_id);
+			this_cpu_write(jailhouse_cpu_id, cpu);
+
+			if (cpu != smp_processor_id() &&
+			    atomic_inc_return(&cpu_mismatch) == 1)
+				pr_warn("jailhouse: Logical CPU IDs differ between Linux and Jailhouse\n");
+
+			return;
+		}
+	}
+
+	pr_err("jailhouse: Cannot find Linux CPU %d (physical ID 0x%llx) in configuration\n",
+	       smp_processor_id(), phys_id);
+	error_code = -EINVAL;
+}
+
 static void copy_console_page(struct jailhouse_virt_console *dst)
 {
 	unsigned int tail;
@@ -179,27 +220,6 @@ static inline void update_last_console(void)
 	last_console.valid = true;
 }
 
-static long get_max_cpus(u32 cpu_set_size,
-			 const struct jailhouse_system __user *system_config)
-{
-	u8 __user *cpu_set =
-		(u8 __user *)jailhouse_cell_cpu_set(
-				(const struct jailhouse_cell_desc * __force)
-				&system_config->root_cell);
-	unsigned int pos = cpu_set_size;
-	long max_cpu_id;
-	u8 bitmap;
-
-	while (pos-- > 0) {
-		if (get_user(bitmap, cpu_set + pos))
-			return -EFAULT;
-		max_cpu_id = fls(bitmap);
-		if (max_cpu_id > 0)
-			return pos * 8 + max_cpu_id;
-	}
-	return -EINVAL;
-}
-
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(5,8,0)
 #define __get_vm_area(size, flags, start, end)			\
 	__get_vm_area_caller(size, flags, start, end,		\
@@ -240,18 +260,14 @@ void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 static void enter_hypervisor(void *info)
 {
 	struct jailhouse_header *header = info;
-	unsigned int cpu = smp_processor_id();
+	unsigned int cpu = this_cpu_read(jailhouse_cpu_id);
 	int (*entry)(unsigned int);
 	int err;
 
 	entry = header->entry + (unsigned long) hypervisor_mem;
 
-	if (cpu < header->max_cpus)
-		/* either returns 0 or the same error code across all CPUs */
-		err = entry(cpu);
-	else
-		err = -EINVAL;
-
+	/* either returns 0 or the same error code across all CPUs */
+	err = entry(cpu);
 	if (err)
 		error_code = err;
 
@@ -375,7 +391,6 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	unsigned long config_size;
 	unsigned int clock_gates;
 	const char *fw_name;
-	long max_cpus;
 	int err;
 
 	fw_name = jailhouse_get_fw_name();
@@ -403,12 +418,6 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 
 	config_header.root_cell.name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
 
-	max_cpus = get_max_cpus(config_header.root_cell.cpu_set_size, arg);
-	if (max_cpus < 0)
-		return max_cpus;
-	if (max_cpus > UINT_MAX)
-		return -EINVAL;
-
 	if (mutex_lock_interruptible(&jailhouse_lock) != 0)
 		return -EINTR;
 
@@ -454,7 +463,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		goto error_release_fw;
 
 	hv_core_and_percpu_size = header->core_size +
-		max_cpus * header->percpu_size;
+		config_header.root_cell.num_cpus * header->percpu_size;
 	config_size = jailhouse_system_config_size(&config_header);
 	if (hv_core_and_percpu_size >= hv_mem->size ||
 	    config_size >= hv_mem->size - hv_core_and_percpu_size)
@@ -498,7 +507,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	       hv_mem->size - hypervisor->size);
 
 	header = (struct jailhouse_header *)hypervisor_mem;
-	header->max_cpus = max_cpus;
+	header->max_cpus = config_header.root_cell.num_cpus;
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 	header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
@@ -531,6 +540,15 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		goto error_unmap;
 	}
 
+	atomic_set(&cpu_mismatch, 0);
+	error_code = 0;
+
+	on_each_cpu(identify_cpu, &config->root_cell, true);
+	if (error_code) {
+		err = error_code;
+		goto error_unmap;
+	}
+
 	if (config->debug_console.clock_reg) {
 		clock_reg = ioremap(config->debug_console.clock_reg,
 				    sizeof(clock_gates));
@@ -583,8 +601,6 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
-	error_code = 0;
-
 	preempt_disable();
 
 	header->online_cpus = num_online_cpus();
diff --git a/driver/main.h b/driver/main.h
index 9df51aa1..8f45e9f7 100644
--- a/driver/main.h
+++ b/driver/main.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2017
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -29,6 +29,9 @@ extern struct mutex jailhouse_lock;
 extern bool jailhouse_enabled;
 extern void *hypervisor_mem;
 
+DECLARE_PER_CPU(u64, phys_cpu_id);
+DECLARE_PER_CPU(int, jailhouse_cpu_id);
+
 void *jailhouse_ioremap(phys_addr_t phys, unsigned long virt,
 			unsigned long size);
 int jailhouse_console_dump_delta(char *dst, unsigned int head,
diff --git a/driver/sysfs.c b/driver/sysfs.c
index a5a02831..61b851cc 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2020
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -91,10 +91,11 @@ static ssize_t cell_stats_show(struct kobject *kobj,
 	unsigned int code = JAILHOUSE_CPU_INFO_STAT_BASE + stats_attr->code;
 	struct cell *cell = container_of(kobj, struct cell, stats_kobj);
 	unsigned long sum = 0;
+	int jailhouse_cpu, value;
 	unsigned int cpu;
-	int value;
 
 	for_each_cpu(cpu, &cell->cpus_assigned) {
+		jailhouse_cpu = per_cpu(jailhouse_cpu_id, cpu);
 		value = jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO, cpu,
 					    code);
 		if (value > 0)
@@ -112,9 +113,11 @@ static ssize_t cpu_stats_show(struct kobject *kobj,
 		container_of(attr, struct jailhouse_cpu_stats_attr, kattr);
 	unsigned int code = JAILHOUSE_CPU_INFO_STAT_BASE + stats_attr->code;
 	struct cell_cpu *cell_cpu = container_of(kobj, struct cell_cpu, kobj);
-	int value;
+	int jailhouse_cpu, value;
 
-	value = jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO, cell_cpu->cpu,
+	jailhouse_cpu = per_cpu(jailhouse_cpu_id, cell_cpu->cpu);
+
+	value = jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO, jailhouse_cpu,
 				    code);
 	if (value < 0)
 		value = 0;
@@ -252,18 +255,21 @@ static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
 static int print_failed_cpus(char *buf, size_t size, const struct cell *cell,
 			 bool as_list)
 {
+	int jailhouse_cpu, written;
 	cpumask_var_t cpus_failed;
 	unsigned int cpu;
-	int written;
 
 	if (!zalloc_cpumask_var(&cpus_failed, GFP_KERNEL))
 		return -ENOMEM;
 
-	for_each_cpu(cpu, &cell->cpus_assigned)
-		if (jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO, cpu,
+	for_each_cpu(cpu, &cell->cpus_assigned) {
+		jailhouse_cpu = per_cpu(jailhouse_cpu_id, cpu);
+		if (jailhouse_call_arg2(JAILHOUSE_HC_CPU_GET_INFO,
+					jailhouse_cpu,
 					JAILHOUSE_CPU_INFO_STATE) ==
 		    JAILHOUSE_CPU_FAILED)
 			cpumask_set_cpu(cpu, cpus_failed);
+	}
 
 	written = print_cpumask(buf, size, cpus_failed, as_list);
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-14-ralf.ramsauer%40oth-regensburg.de.
