Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBG242KQMGQEGXTVKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6255B9C0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:41 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id u9-20020adfa189000000b0021b8b3c8f74sf1186865wru.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335621; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRACxrk/s2m72WapJ562/jtHsEwnu4kM6Lpm7c0j8L0dl5gATPpW6RORq3EnM926u0
         2RpyyVsCCM1Vr4wwF89WRK9aaTVBiWGHCKGzqFyRpWzn+DzJnERoibVjLC+zKJFhrrMT
         JmL02tDkGKwd5AnZcTVm3xY+b0uzL2MXn5wnBSikGUqKb/ae68NgFIwmEBxriiP54NdQ
         7ZTulfPzgw9b/+sVOLMzTQlECw1CkdtKu8ldpVpuVPyKoas4IXF+7BgPtdCbRMFb4uKT
         rupuI2FWN3+bp73599ifESlc8xn+QZoxj9k0Mk8TE1Ff+61xyTt9hJjviEUiycuhvomC
         s+9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Fn2P4znfOB2iHYFILMDRgIxO2c47xTKWVytS9vD/yNE=;
        b=eFVix/RRB5wujTpP6OuaC5sUQPyKK51wuJ/P9TuOdu+J+NvvgAs4Ym6/53MkVRYP1t
         jbEQadaLGwJGwVSzvCR1mhEf04V98y/db8zaTrZBBzA48fZePM7u8jCY0oQLQrS9vSRu
         7+6Y42ICoEw5CiNCevAmKgTmyDZRAxBgp7xZwHD7vDhOwRdUWjoIKP0AMeZVPio3QBB0
         WeyiO1Qa9wRU8tI16MShz/ej0/k+iOFJRYaUk93iwe7/3qJYf+BII1eSI/22YteMVCKX
         sXV3FgBTViRC4XzLBBbNu8WgvpCeuD1x1p1zdgIN1tGa2XgQpD9Q+SnQsDk2QT5MN4MS
         yOCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=GF4qLrNZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fn2P4znfOB2iHYFILMDRgIxO2c47xTKWVytS9vD/yNE=;
        b=B244VndKyQmcmMnqxTK4mK1k2fA6xGOFIpW0f7WCc39cfp+Oc4kKRhob7JFnZoOvOJ
         O8IQCxkQto/XbiahcQVCYJLq/89fH7E9wuGlmBjntQ/fsESnHnVHMX+rrDpz2hMmMX2D
         YPlDudYpEV7ebkj4TNcD63o/MiVkF7QHqDuNuysLv8o0FMu5D19lfni34/BzKfZuG8cR
         /zxu7z1RajP2W8w7SBjtnRsLnGYlyTb4+xr0B/Bqu7Rn5Wq5QYUfHNLOr9VCq28wvn1d
         h/EKESHqmVEkWYB4VglDp7YFTM91rSBINIBigZ2N9P1XuXNsM9NDPMFbPSQFRKvydBNj
         ZyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fn2P4znfOB2iHYFILMDRgIxO2c47xTKWVytS9vD/yNE=;
        b=VDS6laVzRJd90mdEx9+tBp16qFU/eMWomHPoXlEbJ4x+MDfVYw0cX6eiN/hgkXYtl/
         gPDhy4VAq8GVQLeYUJ5wl9a/C2Q3mSTPKt5o4jv02GmG/F4EPafWooHUGBsT8Jcw610d
         36UyZq2x9/R+y0fnUG1LDWUb3wRMyCxpj/PXkTv3yUFrAMzd7RYpZcXbn5K7hlEN4CkN
         yRMbTN3Cta8uiw0JVcCkBY4pP6cOaH/LcMXpZ0Wx0kFCgTus75Bb7VOPjors05Fuc7VN
         8K44gOvHFiVQW1pteEAEvbBN6vUdm6/n8HFs0iysES3+d9U8XFzLRXOBqTlfVgLH1+ix
         LZUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9oosdlwzuB41P1LmqiImT0TpxR9QAQwiKAUlcF7Qy/srGqs0PE
	0qwOy9gAluKw0xoCywfpUYM=
X-Google-Smtp-Source: AGRyM1uDxzrfRDKKAb0E9MIOzl5yR5lumYSsJ43exxH2AZTsknHxnyVMKOZbTNuOP0fQp2fKZSM+oA==
X-Received: by 2002:a05:600c:1410:b0:39c:6fef:4b4c with SMTP id g16-20020a05600c141000b0039c6fef4b4cmr19943745wmi.124.1656335621080;
        Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:350f:b0:397:475d:b954 with SMTP id
 h15-20020a05600c350f00b00397475db954ls3207134wmq.0.canary-gmail; Mon, 27 Jun
 2022 06:13:39 -0700 (PDT)
X-Received: by 2002:a7b:c745:0:b0:3a0:43fb:679f with SMTP id w5-20020a7bc745000000b003a043fb679fmr12568777wmk.29.1656335619576;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335619; cv=none;
        d=google.com; s=arc-20160816;
        b=r17qFWa4nOCqkxiEE5P2MwrCtfCzN5ApYGQttfbiytPNp5BS0cWx63GM3nixpJyBBJ
         J892ZfxiYBnEr9roGCuHtWvDCn7bOEKPSjZFIMU294jXCLu8jFKgrXKwYZM9ZWRT7/Eu
         p4/9YKnAhKx8hOR90ZHhGlTIIqn4AceaWDsimHZzGzj42npDNJpfSsDK5SZy5hB+LCO3
         MamrcuOpijN6GYnszI9iCzGvgeZdUR0Yi3ZZafgwzVYcfozJYTHGMRXcaIMrXlMLZ1rU
         8vi0yS3PIU439rQKf6LWkHPcH2zK9aLuJYUYoyoO1vmMDZJbzTOOrXjASr72buodOLYC
         dRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s3AzOT6ve7qyxbOZtaSJxQWdMNlwESngF+f80wX6NC4=;
        b=wKCDH/lVALmR3dQRfefv/Aooh6we3s0p9GUHpNWHvalp6JCsFzFIrTYMISuOGWFq8x
         4XY36upK1QYuL1OASDPtbgJe46ipMZMj9KIvsn7xOq3mzlrju8QkgAdWdTgKuMDLwi+4
         vqvMh+077ykXiiF/TyaUVlkN5VqVhEmkIFDCTqNIMO1FWx4eW275IGtw8sXis/dTWTGh
         4lEB8Mbenpb97J/0jrX5yQFya4cy/8MwM9Ms+r73GCgvR2AXiDttljLDPl+i70Esd0N6
         hdUVR5wP7TSCqant91ouFs/dXLUNBRyR7x/oCpywxmbIvSRYZ+xPyCMCGwPrfJsB+5zu
         2wmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=GF4qLrNZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id l64-20020a1c2543000000b003a04819672csi137167wml.0.2022.06.27.06.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp8329rrzy86;
	Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:38 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 19/20] core: Optimize parsing of large CPU sets
Date: Mon, 27 Jun 2022 15:13:28 +0200
Message-ID: <20220627131329.3659-20-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=GF4qLrNZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Currently, the for_each_cpu iterators scan the whole given CPU set
bitwise. Since we use static CPU set sizes, we scan even more bits
needlessly for most workloads. This is particularly relevant for sending
IPIs that go out to a set of CPUs.

But the common case of having a small and non-sparse bitmap can easily
be optimized by scanning the lower and upper boundaries once during
setup of the CPU set and then using those limits in for_each_cpu*.

At this chance, reduce the type of the boundaries to unsigned int
because we do not support 4 billion CPUs anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/control.c                   | 26 +++++++++++++++++++++++---
 hypervisor/include/jailhouse/control.h |  4 ++--
 hypervisor/include/jailhouse/types.h   |  6 ++++--
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 8eaaa46a..7a5304a0 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -58,6 +58,25 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
 	return cpu;
 }
 
+/**
+ * Update CPU set min/max boundaries.
+ * @param cpu_set	CPU set to update.
+ *
+ * @note For internal use only. CPU set must not be empty.
+ */
+static void cpu_set_update(struct cpu_set *cpu_set)
+{
+	unsigned int cpu, max_cpu = 0;
+
+	cpu_set->min_cpu_id = 0;
+	cpu_set->max_cpu_id = sizeof(cpu_set->bitmap) * 8 - 1;
+
+	cpu_set->min_cpu_id = first_cpu(cpu_set);
+	for_each_cpu(cpu, cpu_set)
+		max_cpu = cpu;
+	cpu_set->max_cpu_id = max_cpu;
+}
+
 /**
  * Suspend a remote CPU.
  * @param cpu_id	ID of the target CPU.
@@ -226,12 +245,10 @@ int cell_init(struct cell *cell)
 {
 	const struct jailhouse_cpu *cell_cpu =
 		jailhouse_cell_cpus(cell->config);
-	unsigned long cpu_set_size = (cell->config->num_cpus + 7) / 8;
 	unsigned int cpu_idx, result;
 
-	if (cpu_set_size > sizeof(cell->cpu_set.bitmap))
+	if (cell->config->num_cpus > sizeof(cell->cpu_set.bitmap) * 8)
 		return trace_error(-EINVAL);
-	cell->cpu_set.max_cpu_id = cpu_set_size * 8 - 1;
 
 	for (cpu_idx = 0; cpu_idx < cell->config->num_cpus; cpu_idx++) {
 		result = cpu_by_phys_processor_id(cell_cpu[cpu_idx].phys_id);
@@ -240,6 +257,7 @@ int cell_init(struct cell *cell)
 
 		set_bit(result, cell->cpu_set.bitmap);
 	}
+	cpu_set_update(&cell->cpu_set);
 
 	return mmio_cell_init(cell);
 }
@@ -358,6 +376,7 @@ static void cell_destroy_internal(struct cell *cell)
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
 	}
+	cpu_set_update(&root_cell.cpu_set);
 
 	for_each_mem_region(mem, cell->config, n) {
 		if (!JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
@@ -493,6 +512,7 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
 	}
+	cpu_set_update(&root_cell.cpu_set);
 
 	/*
 	 * Unmap the cell's memory regions from the root cell and map them to
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index f01af617..2e2446f0 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -44,7 +44,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  *
  * @return First CPU in set, or max_cpu_id + 1 if the set is empty.
  */
-#define first_cpu(set)		next_cpu(INVALID_CPU_ID, (set), INVALID_CPU_ID)
+#define first_cpu(set)	next_cpu((set)->min_cpu_id - 1, (set), INVALID_CPU_ID)
 
 /**
  * Loop-generating macro for iterating over all CPUs in a set.
@@ -67,7 +67,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  * @see for_each_cpu
  */
 #define for_each_cpu_except(cpu, set, exception)		\
-	for ((cpu) = -1;					\
+	for ((cpu) = (set)->min_cpu_id - 1;			\
 	     (cpu) = next_cpu((cpu), (set), (exception)),	\
 	     (cpu) <= (set)->max_cpu_id;			\
 	    )
diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
index 5ca81034..f8580f2f 100644
--- a/hypervisor/include/jailhouse/types.h
+++ b/hypervisor/include/jailhouse/types.h
@@ -23,8 +23,10 @@ typedef enum { true = 1, false = 0 } bool;
 
 /** Describes a CPU set. */
 struct cpu_set {
-	/** Maximum CPU ID expressible with this set. */
-	unsigned long max_cpu_id;
+	/** Smallest CPU ID in the set. */
+	unsigned int min_cpu_id;
+	/** Largest CPU ID in the set. */
+	unsigned int max_cpu_id;
 	/** Bitmap of CPUs in the set. */
 	unsigned long bitmap[(MAX_CPUS + BITS_PER_LONG - 1) / BITS_PER_LONG];
 };
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-20-ralf.ramsauer%40oth-regensburg.de.
