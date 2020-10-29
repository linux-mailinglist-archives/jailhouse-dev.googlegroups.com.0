Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEF65T6AKGQEBYITMJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA3029F5B1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 20:59:13 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id o2sf1665546edw.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 12:59:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604001553; cv=pass;
        d=google.com; s=arc-20160816;
        b=CW+ipi0k3LbbGVmg+qSKg/spa6Vm1brcp67WNcf+pdDoPT8LmntGFC8UtrUZStXSFs
         M7OOxnIwR8gJKNE+uVHqBvd0LO7cvZf1Unx648kQXr959bXdiai7HcuffUCbojDwVc1n
         OmF+O+YErpk/7FUcAbslB0942B5LztjWIidp9wo5nTW34ie+nG2wwyC9xoh3GLVNr9Wo
         bIdZGJbZO7xzilAMKYgqfCQZpSxE0pUwFa1PsSoufAPXw7AswYrSCF+uhWhpLN5oMB71
         /PDMn97K5XhuJkvCZ9S5CjaOc3QAhruYTybVVMlYBzKwh5EeLbVtu0GCvX/XG4M3aVpu
         ZOpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HeFAMvgCoBB+2X/79/CDRNXF3Ja81Korh9iu8FVXQQA=;
        b=oMV2BXTe9ypLBGcAbfJuHfHLYmW3wq+fS/TADfaqpag/odTcfY/UqlvJAFdww7lRxq
         HF0jvUHOIIUafTmR3iZksQsHhORNG1koBOgQ5/IS/cn4p4QZjPADFMzunsUQ8OOcKwDE
         saQ7MamJ16XaRpoj1vH1BYmeFxux+OcYEOXqgAoqB1RQpVtCn45IEtHh5go4n0HXKHoy
         2hLMhCFfwiXsecU+cRWxkt5b87V2vlxITUWXh/fpXkQB9J7f2TKc4s7R8rWLAqQdGw6O
         H2MfxgvWTZy6Cbg8UwR8r2hscr08ogh/vPpM5LEV9UU1On9EQh2Jmk/eFTetgpRcdAdC
         YdZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HeFAMvgCoBB+2X/79/CDRNXF3Ja81Korh9iu8FVXQQA=;
        b=KJhJHBZ4PjtSADdJlna+FbDexgLCw6nng9AAbftZYXPdkv4Gx8vYMirKrLAFc5k+rV
         xZAaXVB96YauJ+mdHwABZ225LPg3TnKAF4ttrSBqBLhEm73txhDJZvNXVISzN+IelXCu
         NQCjv3PAAY4tK3gXz+CzrByoVvauh86I6oz57S5mF5UCV08APOdDIo0WnzR/KB3dT1As
         VWWGqHYcJSKhLcySiBqqvIqdZul+qNQOC894LySwYmQs7v4ZTcjtnxBQOxW4tJAjrfLq
         dm/qKU1CtONCXW1osaYLtZkTytbGjQAIAphuBs0PVRzJ1gIcTYIuPXx2Rlj/jxYxApD6
         2O8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HeFAMvgCoBB+2X/79/CDRNXF3Ja81Korh9iu8FVXQQA=;
        b=A0q9cIiycS++5sB39xRl2aJOIPZL1E+sErwpwDMu+7gvf2S+tj4Niu8H9HlAowCC5J
         ZMIN5IqJhdr7Ds0swvHbu/Ebjwf1HHvUg1Zo6odqeBlHHsz4tzE0EPvBeWuRm6TgQCeq
         FGV/vkCYegQgrXpuXOpX2XN8SfJ52DP+vTbV+SQ6bW42cJ4oYjElYzZx0zOCTErFK3Mc
         irKuNvE/VmmIj/JB7unQTjGyzvCh22FMA0vhu8ZLI1YN8XZeGioTYBYwoeuJk5rW4Rz0
         CaqAkMHdWoP3vSUWk5t0q8bF8bUYTAoGcHs7ajJERYXSh2ash6TEdXVxJIN2Mb2dx74M
         tPig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nMDsKTRFvK2ySll49w6LgpzyLLkZoC+trDdWfXrKbH62WzsBX
	hCdriCTEmDa0LR5hTYpqa8o=
X-Google-Smtp-Source: ABdhPJx0Qq42NzTkj4g0Hs3x8iSUSSoI/dnP/ZsZIJKwUJaKPW3HWrN0qNuBIFZvFByozGAZI3H/vg==
X-Received: by 2002:aa7:c054:: with SMTP id k20mr5966224edo.224.1604001552928;
        Thu, 29 Oct 2020 12:59:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:43c6:: with SMTP id i6ls2105813ejs.6.gmail; Thu, 29
 Oct 2020 12:59:12 -0700 (PDT)
X-Received: by 2002:a17:906:4a8d:: with SMTP id x13mr5902453eju.47.1604001551936;
        Thu, 29 Oct 2020 12:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604001551; cv=none;
        d=google.com; s=arc-20160816;
        b=VA7TIH66Oy9fzrCM+apyO3jf9vUwxSrqCvxtVL+fcQQsSwQCHQNrpyUgffp5WjzOM3
         AeL4HmNpU8So+/6+TT5+Ku1vcs9q8r531hSNnG7SD6+QG01OFuqhQAVWsIgEoBZGiMpy
         wwB6CsAk1on2+1SU7r07R8vHnzU3YnbGC87kxWKd11JSCUwZvSjXlC0W2H0D3D6ZCQdK
         uFadAUcJTNMhZ/si+CKlMTxMQFQ1vlzhZkPyj1C+UdyM0T2c33hq2DbFiCp0LpOQ6IIT
         zG3o710NXzPFlwomXRrey1GBkmk5guz+mjX+oml+x7D3QBps5VkNn27i4H/KMSndnWVF
         0gLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LZ15n/6YY3M3E/Taf5H14fF/plC5rxY4fX8aySlY8Uo=;
        b=qCY6I2D7Ucd8cnOWBKK6l412wRtavZuwU+nqVYeojXgqlMzE8D1EBS1pyGjP1BayLn
         Xp8gHwUEsnujldiTnI6JbG3GSN8lytNYMwI4E+9l/u4+vEoiFw+gbe9CxDUCo6LavZGV
         mU+csw0rOWlbQbbOQajQbxlCszXuPrkOYh/qxVZ5/iueRAxt4CxJuvBOdgehYcFzXK6b
         FOh9QnUKTXKDU3/JCyuzq59ZXFca7gYQKQ9VbRc4Zhdpp8i/wv1e4744mOCgv2eXcHQp
         s52J0Ja3dNeNZ5AQCy+qEMih/2SOOvRlvVJmLEoLmBC4VcxxshUpzgM/Us5Cilo9o/8N
         YJxA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g4si99934edt.2.2020.10.29.12.59.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 12:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from sd6.hs-regensburg.de (unknown [IPv6:2001:638:a01:8061:5c51:6883:5436:5db])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4CMbqf665gzxxM;
	Thu, 29 Oct 2020 20:59:10 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3.5] inmates: x86: add cache access time test
Date: Thu, 29 Oct 2020 20:59:10 +0100
Message-Id: <20201029195910.398850-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
References: <20201029145515.386953-2-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2020.10.29.194817, AntiVirus-Engine: 5.77.0, AntiVirus-Data: 2020.10.25.5770002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BADTHINGS 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
since v2:
  - Move host code to tools/demos

since v1:
  - Move host code to tools/

since RFC:
  - move the inmate to demos instead of tests

 .gitignore                               |  1 +
 inmates/demos/x86/Makefile               |  4 +-
 inmates/demos/x86/cache-timings-common.c | 95 ++++++++++++++++++++++++
 inmates/demos/x86/cache-timings.c        | 15 ++++
 tools/Makefile                           |  9 ++-
 tools/demos/cache-timings.c              | 29 ++++++++
 6 files changed, 150 insertions(+), 3 deletions(-)
 create mode 100644 inmates/demos/x86/cache-timings-common.c
 create mode 100644 inmates/demos/x86/cache-timings.c
 create mode 100644 tools/demos/cache-timings.c

diff --git a/.gitignore b/.gitignore
index 1d8905ab..245733cb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@ hypervisor/hypervisor.lds
 inmates/lib/arm/inmate.lds
 inmates/lib/arm64/inmate.lds
 pyjailhouse/pci_defs.py
+tools/demos/cache-timings
 tools/demos/ivshmem-demo
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
index 8cf5df84..62585369 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -35,6 +35,13 @@ KBUILD_CFLAGS += $(call cc-option, -fno-pie)
 KBUILD_CFLAGS += $(call cc-option, -no-pie)
 
 BINARIES := jailhouse demos/ivshmem-demo
+targets += jailhouse.o demos/ivshmem-demo.o
+
+ifeq ($(ARCH),x86)
+BINARIES += demos/cache-timings
+targets += demos/cache-timings.o
+endif # $(ARCH),x86
+
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
@@ -104,8 +111,6 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-targets += jailhouse.o demos/ivshmem-demo.o
-
 $(obj)/%: $(obj)/%.o
 	$(call if_changed,ld)
 
diff --git a/tools/demos/cache-timings.c b/tools/demos/cache-timings.c
new file mode 100644
index 00000000..2c591dab
--- /dev/null
+++ b/tools/demos/cache-timings.c
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201029195910.398850-1-ralf.ramsauer%40oth-regensburg.de.
