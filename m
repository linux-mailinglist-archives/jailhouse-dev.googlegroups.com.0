Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVH4L6AKGQEJQOXSMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24E29CB5F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 22:40:34 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id mm21sf1356341ejb.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 14:40:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603834834; cv=pass;
        d=google.com; s=arc-20160816;
        b=NVLHT/lSvBDhXfVTtfly/4+zwPB09a8j+NERAGQOWX3hWH05/fvHjZHUGomqLDgKTd
         7svHwt7gkfjC+oZhf5HYwmVtKqUDP6Wn9LnW8WHOoU/wTnuQKP5Cel5yINcbykTe7l2F
         /oTfxgiQsCLmu7djkl4V+hKmHBYsEj6+jIm/72UXImkuS34yBlyl2TPAo2hOjEQJeIAc
         DuXk94ozTMfQBB2tXQp/q5VKgxE1+vhwEZRu3AK3XriiWftiVnpqxfQ0TrkDlBaBUj71
         X8crVCoS+YP5OW4HUTQ8VfA7V4MS0NOcFf2Q/Y2W8CuOB76QjTovMrLVR64OVe9HNc2x
         6NkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pvvKFTGJQ/m6KyL5hBbnHltHEntRo6U0gySacx/SBO8=;
        b=hSnAX5aYoRXD4hpi7WdOIQH91C44kPMQazxyybo+bYeDNrFCNA7F+kC496iRU0tYfY
         tKKU6YAULy3lf3hkPTqSHY/E44aDEd3Ya8jGQFoXkd4ZGoA9OZ1gPK7qzAxWMdG714PX
         Q7yVyc9zCXRWIlGQmiawf4hJj6jEoIdIOekVIj7Mfj8qU1O7yJRTBNLzGldarqiZ/agk
         g42bWfuD6L9W5LY/goTx8iO6g2334CJ8EIgw9MnAEI3xQzU38hjLvYheHrEKtAjvvLkC
         kq3LSY0U/j1Tz+V17732HGI4Trzn9bj/2kT1nEYZSk//Tbcly6LG5TpuneAC9a3SppK5
         81dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lleqCcU5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvvKFTGJQ/m6KyL5hBbnHltHEntRo6U0gySacx/SBO8=;
        b=mLRBCO/fkFa9x5ZCnfQ0wug6NQxb9x+b0w6cuqFoINjdDppuX7C2Vua7/gH7U2jjjD
         KZUwwjvU8sB9fHum8TDJqInOvEAoMt2nrAhW+Eb6/LMIV5A9asoz8+uiSDsoQ3sRBphM
         wwZTyK6Tm7BdMMSaxRryFZFSAkbcr1hfQh+9z14RSEZlW9KRFoXcynyXXPa1Vl42D0x7
         jm5kpfn98SvZuYFbrQUCJDIxOmCaor3b89PDZ/9qg5G3ChbA1p8X6i3Az7cz/LQILqvw
         rlQ5w8zCWwxBOt2dDjqUqmSiO1ja+1ZFFTaRiQQgw5aNflf+Cjll4Jp90jRmwzFhXcbD
         k9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pvvKFTGJQ/m6KyL5hBbnHltHEntRo6U0gySacx/SBO8=;
        b=YpuRXWJMl6AOJGWlJzOcyj/o7kGAmYY0ijtxrAHcqy9qDt+PS022oC3J+FR5yWJDy2
         DhAQ5ZIJ3JExKaAE8DkoD+r9Dyso1dSwCNRzS7+eE2rouPiQggD1AeIJ1YdNS64DyVVX
         Y107TY0sy7RUurJvfWeB3WdaszlioT7Wz35rw3iZ/Nr7dkhc+cvuuqYUuX3ByQePS7BP
         2J+2rSe2LlPmqMaQnBXEJgkppmz995cXh7arKS3gONufKsFd48nUw6WS+whEioPAr0F4
         kZ7eaOT/fr/iaDcnNtvLO5CeISbGnInfjc7lptWpM9SteCOJGRpA+X4cuhfvtOfLhMq8
         IfJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531isaIAAIZBsFCDJHp7vE1t8JUkcDoq93AF/PhtF0SbWNcXN6bC
	1ZnrrdGfMlZJVZYuZHyTMRY=
X-Google-Smtp-Source: ABdhPJy5aLg7T2ome5s10f0uE3dhBmolTpmGAPJYLTXpAX7hKBNn6tOFqhRo7APA6shZM0wv0/njiw==
X-Received: by 2002:a05:6402:a45:: with SMTP id bt5mr4558754edb.101.1603834834555;
        Tue, 27 Oct 2020 14:40:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4692:: with SMTP id a18ls1482069ejr.0.gmail; Tue, 27
 Oct 2020 14:40:33 -0700 (PDT)
X-Received: by 2002:a17:906:6cb:: with SMTP id v11mr4584454ejb.31.1603834833527;
        Tue, 27 Oct 2020 14:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603834833; cv=none;
        d=google.com; s=arc-20160816;
        b=FyeM6m4Vdk3Az20coEhP6/RBB7ppEQbF38E44+glmaSeyFP0Q4lBpU0HA+7jf2FDnn
         o6FoBRERE4p85J9WY0xwl08GwE50lTJy+iy2xnRSY1ZNo3+HPW57ld1peo0QT/F45bWS
         ulVll0eQTVD+nrapU86avDbOvFsp9Ru1vIWIT6f55zdf3ZPbc6BnFkKIwsUKQOawwQ6f
         vvKEfZfCu27vQ40Y1BDBs+y/hX0DI0tJaQtzP50ZF5huJivsYg+1vXC4qKxnEDqZvySe
         P4LGUkc17vnKc2+y3h3KMJeeOJAci/n6UvhhNMsnl38vWwTJws8shfxrWVtTRFc0ZJzD
         gebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s2Vr13slIAvjsneuPnTvV51LwxY99AahKVXJ0fS2/do=;
        b=SCNGDKu0ughQLIPUSbLn+d+Z1nOdCEfzRTIAvjTDFZNHz0tcdWRS8xaOiuScPoTaDp
         9wqmurcG1wdyHG6qVNKBjbaZ3Rq8OR9dMjDxfJnfuxkpag4LRt9/JMyKthu1N9iq+fav
         RZh5TuqQwWVbdQU9rd6MJp59burog7lHargki1JETcXUKcqeFMI0vOFDt8tNW4gu8Xbo
         LbaQCRLoUAeRdj3klp1nnnQ39kYm9e02g0jxfldMQrWwFa+6gYccYZlPiAx+dXRbtdcB
         BQxjwXq+b+LhTKAeWuhjhXb3EiEOUzKQA08PXZp/yFupy90ZYoWycYg3h+xfBtQWUcmN
         GGAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lleqCcU5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id ba3si76022edb.2.2020.10.27.14.40.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 14:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4CLQ9Y19cszy6j;
	Tue, 27 Oct 2020 22:40:33 +0100 (CET)
Received: from omega.home (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 27 Oct
 2020 22:40:32 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/2] inmates: x86: add cache access time test
Date: Tue, 27 Oct 2020 22:40:21 +0100
Message-ID: <20201027214021.407707-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
References: <20201027214021.407707-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=lleqCcU5;
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

On x86_64 systems, this test inmate measures the time that is required to read
a value from main memory. Via rdtsc, it measures the CPU cycles that are
required for the access. Access can either happen cached, or uncached. In case
of uncached access, the cache line will be flushed before access.

This tool repeats the measurement for 10e6 times, and outputs the
average cycles that were required for the access. Before accessing the
actual measurement, a dummy test is used to determine the average
overhead of one single measurement.

And that's pretty useful, because this tool gives a lot of insights of
differences between the root and the non-root cell: With tiny effort, we
can also run it on Linux.

If the 'overhead' time differs between root and non-root cell, this can
be an indicator that there might be some timing or speed differences
between the root and non-root cell.

If the 'uncached' or 'cached' average time differs between the non-root
and root cell, it's an indicator that both might have different hardware
configurations / setups.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

since v1:
  - Move host code to tools/

since RFC:
  - move the inmate to demos instead of tests

 .gitignore                               |  1 +
 inmates/demos/x86/Makefile               |  4 +-
 inmates/demos/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
 inmates/demos/x86/cache-timings.c        | 15 ++++
 tools/Makefile                           |  9 ++-
 tools/cache-timings.c                    | 29 ++++++++
 6 files changed, 150 insertions(+), 3 deletions(-)
 create mode 100644 inmates/demos/x86/cache-timings-common.c
 create mode 100644 inmates/demos/x86/cache-timings.c
 create mode 100644 tools/cache-timings.c

diff --git a/.gitignore b/.gitignore
index 4691ff79..89248c17 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
 pyjailhouse/pci_defs.py
+tools/cache-timings
 tools/ivshmem-demo
 tools/jailhouse
 tools/jailhouse-gcov-extract
diff --git a/inmates/demos/x86/Makefile b/inmates/demos/x86/Makefile
index f53b739e..47b79869 100644
--- a/inmates/demos/x86/Makefile
+++ b/inmates/demos/x86/Makefile
@@ -13,7 +13,8 @@
 include $(INMATES_LIB)/Makefile.lib
 
 INMATES := tiny-demo.bin apic-demo.bin ioapic-demo.bin 32-bit-demo.bin \
-	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin
+	pci-demo.bin e1000-demo.bin ivshmem-demo.bin smp-demo.bin \
+	cache-timings.bin
 
 tiny-demo-y	:= tiny-demo.o
 apic-demo-y	:= apic-demo.o
@@ -22,6 +23,7 @@ pci-demo-y	:= pci-demo.o
 e1000-demo-y	:= e1000-demo.o
 ivshmem-demo-y	:= ../ivshmem-demo.o
 smp-demo-y	:= smp-demo.o
+cache-timings-y := cache-timings.o
 
 $(eval $(call DECLARE_32_BIT,32-bit-demo))
 32-bit-demo-y	:= 32-bit-demo.o
diff --git a/inmates/demos/x86/cache-timings-common.c b/inmates/demos/x86/cache-timings-common.c
new file mode 100644
index 00000000..0edf65e6
--- /dev/null
+++ b/inmates/demos/x86/cache-timings-common.c
@@ -0,0 +1,95 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2020
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define ROUNDS	(10 * 1000 * 1000)
+
+union tscval {
+	struct {
+		u32 lo;
+		u32 hi;
+	} __attribute__((packed));
+	u64 val;
+} __attribute__((packed));
+
+static u32 victim;
+
+static inline void clflush(void *addr)
+{
+	asm volatile("clflush %0\t\n"
+		     "mfence\t\n"
+		     "lfence\t\n" : "+m" (*(volatile char *)addr));
+}
+
+#define MEASUREMENT_OVERHEAD	"nop\t\n"
+#define MEASUREMENT_COMMAND	"mov (%%rbx), %%ebx\t\n"
+#define DECLARE_MEASUREMENT(name, flush, meas) \
+	static inline u64 measure_##name(u32 *victim)			\
+	{								\
+		union tscval before, after;				\
+									\
+		if (flush)						\
+			clflush(victim);				\
+		asm volatile("mov %4, %%rbx\t\n"			\
+			     "lfence\t\n"				\
+			     "rdtsc\t\n"				\
+			     "lfence\t\n"				\
+									\
+			     meas					\
+									\
+			     "mov %%eax, %%ebx\t\n"			\
+			     "mov %%edx, %%ecx\t\n"			\
+			     "lfence\t\n"				\
+			     "rdtsc\t\n"				\
+			     "lfence\t\n"				\
+			     "mov %%ebx, %0\t\n"			\
+			     "mov %%ecx, %1\t\n"			\
+			     "mov %%eax, %2\t\n"			\
+			     "mov %%edx, %3\t\n"			\
+			     : "=m"(before.lo), "=m" (before.hi),	\
+			       "=m" (after.lo), "=m" (after.hi)		\
+			     : "m" (victim)				\
+			     : "eax", "rbx", "ecx", "edx");		\
+		return after.val - before.val;				\
+	}
+
+DECLARE_MEASUREMENT(overhead, false, MEASUREMENT_OVERHEAD)
+DECLARE_MEASUREMENT(cached, false, MEASUREMENT_COMMAND)
+DECLARE_MEASUREMENT(uncached, true, MEASUREMENT_COMMAND)
+
+static inline u64 avg_measurement(u64 (*meas)(u32*), u32 *victim,
+				  unsigned int rounds, u64 overhead)
+{
+	u64 cycles = 0;
+	unsigned int i;
+
+	for (i = 0; i < rounds; i++)
+		cycles += meas(victim) - overhead;
+	return cycles / rounds;
+}
+
+void inmate_main(void)
+{
+	u64 cycles, overhead;
+
+	printk("Measurement rounds: %u\n", ROUNDS);
+	printk("Determining measurement overhead...\n");
+	overhead = avg_measurement(measure_overhead, &victim, ROUNDS, 0);
+	printk("  -> Average measurement overhead: %llu cycles\n", overhead);
+
+	printk("Measuring uncached memory access...\n");
+	cycles = avg_measurement(measure_uncached, &victim, ROUNDS, overhead);
+	printk("  -> Average uncached memory access: %llu cycles\n", cycles);
+
+	printk("Measuring cached memory access...\n");
+	cycles = avg_measurement(measure_cached, &victim, ROUNDS, overhead);
+	printk("  -> Average cached memory access: %llu cycles\n", cycles);
+}
diff --git a/inmates/demos/x86/cache-timings.c b/inmates/demos/x86/cache-timings.c
new file mode 100644
index 00000000..1acc3ee9
--- /dev/null
+++ b/inmates/demos/x86/cache-timings.c
@@ -0,0 +1,15 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2020
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+
+#include "cache-timings-common.c"
diff --git a/tools/Makefile b/tools/Makefile
index e6945cd6..33a39d26 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
 BINARIES := jailhouse ivshmem-demo
+targets += jailhouse.o ivshmem-demo.o
+
+ifeq ($(ARCH),x86)
+BINARIES += cache-timings
+targets += cache-timings.o
+endif # $(ARCH),x86
+
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
@@ -104,8 +111,6 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-targets += jailhouse.o ivshmem-demo.o
-
 $(obj)/%: $(obj)/%.o
 	$(call if_changed,ld)
 
diff --git a/tools/cache-timings.c b/tools/cache-timings.c
new file mode 100644
index 00000000..2c591dab
--- /dev/null
+++ b/tools/cache-timings.c
@@ -0,0 +1,29 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2020
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <stdbool.h>
+#include <stdio.h>
+
+#define printk printf
+
+typedef unsigned int u32;
+typedef unsigned long long u64;
+
+void inmate_main(void);
+
+#include "../inmates/demos/x86/cache-timings-common.c"
+
+int main(void)
+{
+	inmate_main();
+	return 0;
+}
-- 
2.29.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201027214021.407707-2-ralf.ramsauer%40oth-regensburg.de.
