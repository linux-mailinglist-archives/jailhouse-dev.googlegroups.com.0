Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRH4335QKGQE322UBGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668F281F70
	for <lists+jailhouse-dev@lfdr.de>; Sat,  3 Oct 2020 01:56:53 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id a17sf1215348lfl.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Oct 2020 16:56:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601683012; cv=pass;
        d=google.com; s=arc-20160816;
        b=MmRSiSBfnsPgrDbzM23ojFU9dFNRZ9lL4SH0Jeq1KHEqPDVcniHNTb3MscAPtR38fT
         qWnhneO6Xkbevh/dlziVDEb5TCYery3ejILxki8+k+GIjrzUkueLjub/qrcDMPXe4Sst
         0bXts/aCJEPIJbG7oemJRbKyoDHjY6jzPXkHc1ZEDflu1LgCrIt//9VJ3kq0puT8zG9F
         PA615UjBJ+Xk4GERVYZYF34DPQkIkn4dGr6Y7FguIcCV3JSYwBfL7mnaH97Y+4AtRK2H
         YMfpNIFd6DR9yDQwPEicQ0LCmXs07l5HjSXR+ePFWv1ZrdGadYLi7/w+Cu3ZFxVUvtze
         GZ7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=kjfOf+A68yWMtaE1r9ioVayw97uwmFC+qNg0RIgIUgw=;
        b=Rads/02DGMiUS4cDxF2buwl9ewfEyLPddIZQtBGUV7+HMZr+WC6ySoyaoFVFExXJUM
         xSjo72LnvHMXudDeu1k2qzP0fi6ybyBSOGTBQi+XFZTxnasTMKPxmKkgHIOdnVysXFJ9
         TP8U1tCCppUD7UO8dpprNVVk/6mn2egMg767xdCtnNDhtXZpgU3V6QnqDNhZ+dWnUka2
         yPqqmfZ7tFXxadA9hYNogvScfV3cw++PuwGRNu55fXF9W4+WGtSkDuk3x3g0iww4x6zE
         4SMPlRZftRiP9VhR1TPrWq1lktrGGBJIK3N7bF3xCbi3hOhcPqlOU+zGTF/kShP026hY
         6BIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QQ67t7jk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kjfOf+A68yWMtaE1r9ioVayw97uwmFC+qNg0RIgIUgw=;
        b=GRgRB9VKji6Pcu/jIOccqnrlmADSmK74n/5Kn9npc6ea9P9xKZRCmQRz71CksijbEx
         8iN4EMDb0ieZGayYMCEj+TfCgBK4ULislBHbpKqXqafS13csOKz3IexEyNaZfxjra/lE
         3+eXPvUappv6UbXNeaAjiAPV59DcQVgDLx4sRH0jOY9UAZmCbD2SICgaAWmBwg95wAH2
         /1CdvVjLt+X2V1jz1T30KzlyOWbXSk+BXgBPvJV5KL+39UFR/zwTNdgSeAUQsxYx+jos
         qkI5QEyXoGkH9Y8F5iSKbLrZGdxS7nBLViOkFQeflJrwbM8f6KIlbWuGhvYrpZhFdVYh
         7BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kjfOf+A68yWMtaE1r9ioVayw97uwmFC+qNg0RIgIUgw=;
        b=Z7hFdrl0D2DL5GSwWUSGOHCphJNCyoGfBQhMMFCvTUGHEho0v9vBOD8Tc9Rr1ky2hC
         /Kc6DLon1FyVGKknC/UGTATGFYwY5vFEAywPzB69UrGF1HIA0VP9uaYMNdUdT6TGZewJ
         ybltIpvp9d0rJCYWHRTAwyGeXHRZFI4eLKg6+JG2cvgQeDDyF50jDwsbEaQAbibEnchr
         yzn1rhytpC+zAJkr421sY5ddPXEPA50VQkeFLZ2ud8PeAeaPdNaaWFQx00FOOJw9O8Sp
         3vAMi3AUY93bLRoUGX+108j0WNF+XIr6Wy3394ndnHYsiYTJufwTKGHraTfv86XD1c1P
         7lFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Zi032TDU3qo6KizXrO85PfcLytGx7y7fRHlgVoetn3dLGvGMa
	4XQzfyUtEBSGDaT2a6UpbSs=
X-Google-Smtp-Source: ABdhPJxBzr9AZHT1AENexDFNSxvLtL7qObhdJzhWA/0OYhfuJYGuFQ+u+cqmFazbJyBEwk3djzMcGA==
X-Received: by 2002:a2e:b5b9:: with SMTP id f25mr1461290ljn.61.1601683012723;
        Fri, 02 Oct 2020 16:56:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1661215lfn.2.gmail; Fri, 02 Oct
 2020 16:56:51 -0700 (PDT)
X-Received: by 2002:a19:dcb:: with SMTP id 194mr1623022lfn.25.1601683011483;
        Fri, 02 Oct 2020 16:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601683011; cv=none;
        d=google.com; s=arc-20160816;
        b=DYt5rAHo2vipuKDE2XxD/6mLTQNf+4YtkHNHeyr9+C1zb+bNzzKlYIZRlE061FN7VA
         tsdWJagp1G+9Bxj0Az7O91WvTQ0ChK+jl3UOY0aXHZnt0UmOAVQl9y7ICJndEgkCyEwy
         /r2IHpNI1cQzQ7qqKnAJRNF9kEOfabtZ3os6GkqpRGWELBLPSFRYKOWo9UPobZuLrEKo
         k1PwuoEQsNaO/8r1HbWXHiK7MWY5K5QxFasbhpPAKQbui2IyXx4Ekt7BDaKB97xmY1Dd
         4uaRv1yOrHjOLq9u8oId9O7sX9Lph36XOxvHa12yntDVElTQblRdAGqUuZH7flvavwFP
         d5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=REHgAnODQyRsxbyWf5KdhQFfgqWPjP/vuLdrmNkFYYY=;
        b=jYafxPaL/OVau47UXMNs66BzncXYINZZL8j4qDhQtYL9lXoXHD4tqQvLuvE2YnjH7E
         iBKeivNACuzR/30aMhu896dIlJVQRNF3iWnIAWDvn7aQKS54Wvojl05PBWYSNjF4eJHG
         U3g18lr3o43/NyccYkvmrnYMG/vdRQztBVMwJCNnu07Rv+QEwvhnBdAcmmgAjYTFRp/5
         pU26xI1kKkpadzHmaBeRDvrsfVUkVSu/iR0wvuksM8vUZFqshlwr9wUu05O7fRbIiC8c
         wh+unq/gxHXayYJ1WMqvnLyrvTdfQsfMi+N7FFI1sEhJL7OVwnh6WqXEp/bWdTmc1y0n
         BjlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QQ67t7jk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d1si100117lfa.11.2020.10.02.16.56.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2020 16:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4C36NL3mTBzy0g;
	Sat,  3 Oct 2020 01:56:50 +0200 (CEST)
Received: from omega.home (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Sat, 3 Oct 2020
 01:56:49 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: [RFC PATCH] inmates: x86: add cache access time test
Date: Sat, 3 Oct 2020 01:56:40 +0200
Message-ID: <20201002235640.196730-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QQ67t7jk;
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

On x86_64 systems, this test inmate measures the time that is required
to read a value from main memory. Via rdtsc, it measures the CPU cycles
that are required for the access. Acces can either happen cached, or
uncached. In case of uncached access, the cache line will be flushed
before access.

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

The host tool can be compiled with:
$ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timing ./inmates/tests/x86/cache-timings-host.c

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Hi Jan,

what do you think about a test inmate like this one? It's still a RFC patch, as
I'm not sure if the measurement setup is correct. Especially I might have too
much fences.

This test could be extended to run permanently and show the results of the last
1e3, 1e5 and 1e6 runs. Having this, this tool could be used to monitor
influences of the root cell on the non-root cell's caches.


Aaand btw: On a Xeon Gold 5118, we have following values on Linux resp. in the
non-root cell:

Linux:
$ ./cache-timing
Measurement rounds: 10000000
Determining measurement overhead...
  -> Average measurement overhead: 37 cycles
Measuring uncached memory access...
  -> Average uncached memory access: 222 cycles
Measuring cached memory access...
  -> Average cached memory access: 9 cycles

Non-Root:
Cell "apic-demo" can be loaded
Started cell "apic-demo"
CPU 3 received SIPI, vector 100
Measurement rounds: 10000000
Determining measurement overhead...
  -> Average measurement overhead: 82 cycles
Measuring uncached memory access...
  -> Average uncached memory access: 247 cycles
Measuring cached memory access...
  -> Average cached memory access: 19 cycles

Cached Access on Linux is 2x faster than in the non-root cell - if my test is
correct. This can - probably - explained by different cache configurations.
Uncached access happens at almost the same speed.

But do you have an explanation why the overhead measurement is more then 2x
faster on Linux than in the non-root cell?

Thanks
  Ralf

 inmates/tests/x86/Makefile               |  3 +-
 inmates/tests/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
 inmates/tests/x86/cache-timings-host.c   | 27 +++++++
 inmates/tests/x86/cache-timings.c        | 15 ++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 inmates/tests/x86/cache-timings-common.c
 create mode 100644 inmates/tests/x86/cache-timings-host.c
 create mode 100644 inmates/tests/x86/cache-timings.c

diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
index 6c8dc0e7..6e529dde 100644
--- a/inmates/tests/x86/Makefile
+++ b/inmates/tests/x86/Makefile
@@ -12,8 +12,9 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-32.bin
+INMATES := cache-timings.bin mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-32.bin
 
+cache-timings-y := cache-timings.o
 mmio-access-y := mmio-access.o
 
 $(eval $(call DECLARE_32_BIT,mmio-access-32))
diff --git a/inmates/tests/x86/cache-timings-common.c b/inmates/tests/x86/cache-timings-common.c
new file mode 100644
index 00000000..0edf65e6
--- /dev/null
+++ b/inmates/tests/x86/cache-timings-common.c
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
diff --git a/inmates/tests/x86/cache-timings-host.c b/inmates/tests/x86/cache-timings-host.c
new file mode 100644
index 00000000..229db904
--- /dev/null
+++ b/inmates/tests/x86/cache-timings-host.c
@@ -0,0 +1,27 @@
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
+#include "cache-timings-common.c"
+
+int main(void)
+{
+	inmate_main();
+	return 0;
+}
diff --git a/inmates/tests/x86/cache-timings.c b/inmates/tests/x86/cache-timings.c
new file mode 100644
index 00000000..1acc3ee9
--- /dev/null
+++ b/inmates/tests/x86/cache-timings.c
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
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201002235640.196730-1-ralf.ramsauer%40oth-regensburg.de.
