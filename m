Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBW242KQMGQEDUQAJPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955555B9C5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:45 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id i23-20020a2e9417000000b0025a739223d1sf1005027ljh.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335624; cv=pass;
        d=google.com; s=arc-20160816;
        b=lSS8WuNxnqsFNplqVpVSe/wLELpeOzsL1Wxt0B7TUomZAcD0PkCfkpg8HsxqYcami+
         zLs0rOeREnmAY2/Euwj9qpoIsYfnS2alBfgGVMQETwUnzvPZBf9QGJ4daENhEmTdUAbu
         Nd78sWe1OvOMBgjERKDdhUON3OlxIPXNCHFnUWHfdsu9o07VIoRoHYPz5Dzo3LPM76du
         aB0R6jRaQZG8A3WRvbu9RSlQnwAyvJFc6Q32nHmm3iKvjKDakr+ze72imlPPqTfxQDTo
         O0aX5Ok+yjiUC5CkLF/lKZLNxsGqpgGayL6NUtsefC3VdWVBHl60TrqmQmy5E3Xyxk6T
         4Ykw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZYq0a8fChVaDrD1ar2u/rTy2gt6tu6uprqQmJNDssTk=;
        b=ufJQe9toPSb8YHvCKYfUzUcJodO6VCCcy2ZoKWQAKv3DqbYH2m9TbQY2hD3/qHqhuj
         xx2XHsWpyEJow+mUGXklVm7xSVMQAuMbYCN6qRbbWIS8iTlvszl7VlOrIk3L0X9qjkMH
         COvj9fafW0H2qjMt2Vzv9U/wkQzwGNOcUkbg2PQ7HADPqS+DaPtkXlr4TiQZ2Cy5NAkY
         UbHrHSsQEU4+pvqsGFob5CVflsUwdmRJwa67HQLlFjwmuMolPXuDWerKl/wK3Bo5f9MH
         PzuUAt0JTIGKxBujXcq2Tb+1RuQx17m21AUXKWBD3XiWw60yrN4P3y4dPn+4ssuXHAEv
         zLJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=soHEuDct;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZYq0a8fChVaDrD1ar2u/rTy2gt6tu6uprqQmJNDssTk=;
        b=gDVNfQO6PPRAGOn6HJ6D3z1KA+6nHY57BFWEW33wctfgNf9/VnguOIggzxOcPP5if3
         kKBeDJWi5Rz2O2OmJ/M1RIEaveXqOdks12E2qb4EPPK7pd/Ezrf/aWEf9AUibwbGy29w
         JrauWReFBtUZJMgSDgpzCrr9cgirCEMHND5pLDCNUCEv2AScNUEtj8nwubSjgGR/P3m8
         MfRKNXAkOzgp1saa54dTLmXQAB031fapDcD6VN2HD9XIEapbTp/wffuI62T/tqUFbRZY
         gAxcPZzIX4h2BFRd1dxlveJ85f3NxmETrd8T4FCmz22Sonq3yirfxXt6lMmEXWrw0F0g
         byBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZYq0a8fChVaDrD1ar2u/rTy2gt6tu6uprqQmJNDssTk=;
        b=oTcN84C4yPPD1Fna7gxezkOXNyP0tvHjpANaZI2+QG4bZEhKWWnrtSwU9kHXfZyBRj
         wxDUMp+gpuBgFNtqvRkHhG4NnVITXY9e5wh3eQJT/nmxFYGYsKWoqfcoMDLRfASdHXLB
         8vkBBsWs5ydiT/ZDgarENTyAKnMiYu3PplPQnLUg/LB/DgGqIXmd4GFQZCx8Is0xNZrY
         4PUvkRjnb21FqhITpXoO0xNgChN5sSFqbh3sfWolpPkMAS/hzubgsWhJkURMiqv42zSV
         8obnCFAV2NP070hjWzKx650/gQJXK9UDZpJtpcz0meLMB6cZ0D91PFLRPfsszmCKwnxa
         Fi3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+72GMObHAv4dC/GWHmzrchjmjUr4N+ixg1OKkallSwulL+RId8
	OlfEa5z+gB+XxsxuPh+MZPs=
X-Google-Smtp-Source: AGRyM1snaRYfhvX6Ci5bk9lgc9g1ZQ1w4IYfetzFxhllNkyD5Wa/JurOemZs5deKmHCDPLkaj16Pnw==
X-Received: by 2002:ac2:558e:0:b0:47f:777c:a5ed with SMTP id v14-20020ac2558e000000b0047f777ca5edmr8621805lfg.190.1656335623065;
        Mon, 27 Jun 2022 06:13:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls177559lfb.1.gmail; Mon, 27 Jun 2022
 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6512:1508:b0:47f:46c4:82db with SMTP id bq8-20020a056512150800b0047f46c482dbmr8180302lfb.56.1656335618831;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335618; cv=none;
        d=google.com; s=arc-20160816;
        b=obIHSMehhSJ2vvp27z8tx9RdT09ZBA3IYKV8qWnSwVUrIOxK+7T/wW0DMLAYzYGLSi
         XFhpv235YHN0YFPJX0fVR0g4nv5lZZRPKmKHPGjISK1Qt4Ym3rf1uiRDWwZMp+80+o11
         Op/Ju3mfdhtGZ0Q1Q9CWYcT8pkwemay0EwecdWSaHFNIaPGBOdS+V4rYcERVbS34u75y
         dN1nR515s55B1g14cXWXt2EWNybWJyg10C5kUsZ5E3l71T+Loxvtm4wVTPKyHrwMURbY
         ZZGRHRhqsp0t397Ny8lIth8hsleSEba5mB9ygtC68bJ/6gC1urTW6zL4VxdyTey/jt+O
         qCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rSj45UHvrXVW8rdt4pZZIXOuIenzdewsDlqsmI81Qt0=;
        b=VLbiN8jLHF2UGNrALSgerIKBI+HvrjL16PMjOZYciipH5I5WDX3fM08ZdjZ4S7PNar
         xrvzOj2cpKdys3a9eD1jLDxlap6eGrX7EOzTIw3QvEqvwdpNZecMZakdmmnVrcLiQnY1
         yiK9vYje5V47VesYCrRKK5wnmIVELdXjMA0vWHUd6/RmUYsChQJ8fEbw22gRU8CAa56D
         bw3b351JjEipSKyuXsJly22Z25C9yCz6o2IHQ2LWurLiHFjBhsxyeTx5C2xpoAtB+g3Y
         o9WryIue4tjJw/Ectk5zKFriNhqodFILIn+hpVB7q1J0YqUhAmcWV/se26iUNPW7taAD
         zGYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=soHEuDct;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id bp20-20020a056512159400b0047f8c989147si408805lfb.3.2022.06.27.06.13.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp8216dyzy1c;
	Mon, 27 Jun 2022 15:13:38 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 13/20] driver: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:22 +0200
Message-ID: <20220627131329.3659-14-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=soHEuDct;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index ade61edb..9b960013 100644
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
index 64e2b9a4..d0e7f980 100644
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
@@ -399,12 +414,6 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 
 	config_header.root_cell.name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
 
-	max_cpus = get_max_cpus(config_header.root_cell.cpu_set_size, arg);
-	if (max_cpus < 0)
-		return max_cpus;
-	if (max_cpus > UINT_MAX)
-		return -EINVAL;
-
 	if (mutex_lock_interruptible(&jailhouse_lock) != 0)
 		return -EINTR;
 
@@ -450,7 +459,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		goto error_release_fw;
 
 	hv_core_and_percpu_size = header->core_size +
-		max_cpus * header->percpu_size;
+		config_header.root_cell.num_cpus * header->percpu_size;
 	config_size = jailhouse_system_config_size(&config_header);
 	if (hv_core_and_percpu_size >= hv_mem->size ||
 	    config_size >= hv_mem->size - hv_core_and_percpu_size)
@@ -494,7 +503,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	       hv_mem->size - hypervisor->size);
 
 	header = (struct jailhouse_header *)hypervisor_mem;
-	header->max_cpus = max_cpus;
+	header->max_cpus = config_header.root_cell.num_cpus;
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 	header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
@@ -527,6 +536,15 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
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
@@ -579,8 +597,6 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
-	error_code = 0;
-
 	preempt_disable();
 
 	header->online_cpus = num_online_cpus();
diff --git a/driver/main.h b/driver/main.h
index 7c9f661c..3e9fb3fe 100644
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
@@ -21,6 +21,9 @@ extern struct mutex jailhouse_lock;
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-14-ralf.ramsauer%40oth-regensburg.de.
