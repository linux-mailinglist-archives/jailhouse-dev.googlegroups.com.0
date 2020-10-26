Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3UV3P6AKGQEDKZU4YY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4B298D85
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 14:11:11 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id t8sf2616378lfp.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 06:11:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603717870; cv=pass;
        d=google.com; s=arc-20160816;
        b=fA5yv6EZDgcFcK4FPq562wpNkHRfJu6lCHkFTUISHtyN0x0QjeGs4mU8+Ody3q4T1F
         ZqytDLxDlk7qv5YqmPVJ3FqF1u8aGnyw1vtJmgRr+aidzdaHGlZ21S2comm86vsLchxd
         sEFn4g0YErnJ8WKAGQTRaBGorJRDybZsbNS8D5tuGEpZv9Gt0JgwMR0xKZAQHLm0PCNP
         eyXFkkpQKp5mWAmkSuJ7Z9MJP/CaoupVSOwJ+JtuSaGqwJDwYryndDeVKpfebRa3IfgT
         UKyguVGFVlII3JUZvc/NlKXj3Le9EbPkmd7WgVs+6PN1S21a0mkuahyY5pDYTorBBC/X
         vjWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Bk4t9wXuNT5qLqHQC3vMClw+tH2uCrkTgyqx92FSr1I=;
        b=Xxj2gpoWjfWh/YuXhwIBgCknW1xqvSmGFaWGbRnYJ1MmbfMYcYN4dQh+DWokRQooUp
         YLsGE1AlKmV/AUOqICOJ/9hSqo17KN2Q3pFr+MOr0Sl6S2DzONx7yJnvGKIhbYDDvoQm
         JeLAvhEwao6fJ4wYGhQBW7dRvRhV9QJA7wN6jT1PR3OrNPhGpuyWBcC98LxSDCPIRbXj
         Y9G/CIeV3ZkKD7lzTQ/j6+BZWKJk74MoRSERF534BRImLGCuaVLOtFbUfyiZr8+GdO5h
         AYoVK/Q+g+v2s31mU92+DXzlInEVLztEnOHAIQ70wiIy1M+t/NQj7xy2CXU8OmnTN44b
         gjLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bk4t9wXuNT5qLqHQC3vMClw+tH2uCrkTgyqx92FSr1I=;
        b=C2qtAOvbCsvOxCHigDjLKBO9cVXdYri2y5wz/J/pjBGkDTUl+JmM3Vh2vzyXhc6vu7
         XO4ypEtpX3y2Etfzbra5bnaprpqfB8ZDr2v/3K7drUnQWoegRSsibAEuOl9UqRFCJ3Ob
         nQkqhxMMF04HMacZfmMta3z6N0Pi5Iw1IULwxGTrnmCM7yoqhD/mTAu1tIBawkc5SvQl
         ggo/HJHv1n+3jtzlzXV8WoKQbAdrBHLbpQSvquOmnLERvWL6a8jacY2mkd0eGxaALokr
         wbOe0TuOz72v9wpCS4Jkx1FcpIj7DSRlSorJW0dIL0QGRKMm/jSiGdthdz0JQnWZ5pc8
         px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bk4t9wXuNT5qLqHQC3vMClw+tH2uCrkTgyqx92FSr1I=;
        b=IaFACxClHnidK+NAlxFVvgRFZn9dH43tOoMBc0nsgIPVKdAPdBlgFuGNPhG/47kXDB
         LNcEj6WR8lHQYykmKbb0D5zSVg1THUXp4iq4rLvdUGi2W+pu8Mo2ZJ59YagpT7XuAmvH
         Es3VlG1P2yWBwiGRd9FeLa4d5zQ6ZmPcacaVKBmVls28RrHfi+tXXbYU2S+BITWaKz06
         Lb3vbvzlAaaZZ4+WivbgjWwzL42OdlsFaNOcJJ2QiRSu2s6/z0Yud5L1ANPwFmEhGItr
         YU9z5o81pXEBR65A8+/zmH5z4ct3C78FxrbCj+62XMMH90xqAJ7k75f7WxsnUqkURaSB
         AOPw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uIbWhubiOnHMKzLdDEl/7d+3qDiOUvafoR6sxVAow57M0fra8
	W9mHj3qyKtaBwaOEzL+wH4g=
X-Google-Smtp-Source: ABdhPJwYCBbzjxfuuhUX8jtLV1k/4WUUVJeTLHEgZ4He2xBXMtxmazTWfg17sDbUJeKBXlYzWxKwQA==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr5364354ljj.250.1603717870747;
        Mon, 26 Oct 2020 06:11:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f48:: with SMTP id v8ls94074ljk.9.gmail; Mon, 26 Oct
 2020 06:11:09 -0700 (PDT)
X-Received: by 2002:a2e:a410:: with SMTP id p16mr6070605ljn.252.1603717869580;
        Mon, 26 Oct 2020 06:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603717869; cv=none;
        d=google.com; s=arc-20160816;
        b=C72s/Qva6L1h0H0e4IcaebK4bBHHrGUe2WI2Uf/NvTknyyuBvJmUIZ84nboMbhJhiR
         Tqwfs+omREp8fAt4tk+L5/eXrMw43wOR3uK5dGeTnQItfsIACjY6e//wFhos8NlGMkWW
         JtZbAHmnaNsQ6GjH4FtULpsDfabTLzLlxqU4sq4VLIgNepQwCkHI3fXIHTRELeLzUOpg
         Nlc8ERgDkz0iwNj/zDkyULC4rdzXw3ec0yQKVoy/uRPByMi16tSiXK05vbz6RT1hrINd
         A9hX02A4BOyrfOWrfeAwtK4q3pMlA+7P/ySb8Ei1hrrngwf6a9BXaVrIUvQecQm7q0Vz
         du0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Mu95Xxjt0aAAZfjL64vfG4s6jsFCp7l+GSKDBFSbH88=;
        b=Z3bY0DUvoZ9XcAcBjSTInRvizTNtTcMoQFWthvBX2mQ8x5F64W7k7ZdLI5n68TcLbr
         Ba3AXkMartfaxF4i46d2EZ8vhr8qdcistWiM4vKIf/rWUQ5Hrxi8vBC4O/OMl+3uS5Xd
         lrwJqIAXvqI8Xn6DBSh5sANDa2qHnU3H7oN3e5Nkx+rixO8/a/rnm6KTS0wbON1E8IAA
         TsUBe0OopnSzFLU1nDXARgDc8YA78srRsb5fmUeK6V5F6vP0T9NNbGoSornxmzrpM3aC
         3KZn9qND9Qs9JSqys0x4A9U/GSfHb/M5k4dKVoTacQn7G3Lnl53uO+VpE2FHHZNyqDuk
         emJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id w28si333010lfq.3.2020.10.26.06.11.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 06:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from sd6.hs-regensburg.de (unknown [IPv6:2001:638:a01:8061:5c51:6883:5436:5db])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4CKZwD32gWzxwB;
	Mon, 26 Oct 2020 14:11:08 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] inmates: x86: add cache access time test
Date: Mon, 26 Oct 2020 14:11:07 +0100
Message-Id: <20201026131107.266498-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.10.26.130317, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.10.26.5770001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, SENDER_NO_AUTH 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BADTHINGS 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
$ gcc -Os -Wall -Wextra -fno-stack-protector -mno-red-zone -o cache-timings ./inmates/demos/x86/cache-timings-host.c

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

since RFC:
  - move the inmate to demos instead of tests

 inmates/demos/x86/Makefile               |  4 +-
 inmates/demos/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
 inmates/demos/x86/cache-timings-host.c   | 27 +++++++
 inmates/demos/x86/cache-timings.c        | 15 ++++
 4 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 inmates/demos/x86/cache-timings-common.c
 create mode 100644 inmates/demos/x86/cache-timings-host.c
 create mode 100644 inmates/demos/x86/cache-timings.c

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
diff --git a/inmates/demos/x86/cache-timings-host.c b/inmates/demos/x86/cache-timings-host.c
new file mode 100644
index 00000000..229db904
--- /dev/null
+++ b/inmates/demos/x86/cache-timings-host.c
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
-- 
2.29.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201026131107.266498-1-ralf.ramsauer%40oth-regensburg.de.
