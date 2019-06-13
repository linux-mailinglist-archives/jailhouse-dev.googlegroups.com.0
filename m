Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZWYRLUAKGQE54OSEQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916F44CE4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:55 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id s18sf58528wru.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456295; cv=pass;
        d=google.com; s=arc-20160816;
        b=yLD3CNz2ffpwr6a7BN0PrymZI7AaiUUVjeznnKh0gSBSjtbH0cpAvnq6fzHjZbc69X
         LNSLH3y3Cz4cDaXmfdCJLzZEEpqmouMMzSbdxQQ4FFEX8Wf4Io9xNQctXrd8/8jWcd7h
         rLziabFSgbixSbp4jEA+nmdKi3IBfq1APcBo9tO4JZSnzf7lg5wN//cZwPQ0fjDewKex
         Fs6pEH/RqetBi4LMtkwp1fN5dkCoukbTFSolgv4nNhzB6xBSUcImn0y9ARLrn1Cynzkd
         ryda1nHWU6W9/gOjPJMH66qgJ9EixpHFu3xgxmxMSt8CPJkLvrp1lk9RiLcBNQV67KVt
         C6Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=X7KByWBZJtpog/e5+VXT94BYrt5y+diDS2cIO91ns9Q=;
        b=jc5wzIu0iDozkynfQB92BFN0qCUz/ypjFx0s2wTA+aa0SZPgHhx12prVsq668hl8Vd
         j3XQL6qm86RKDZhwoax4YosfkXO/LLSMukSLIVuy4wt75AjfYFZmUBvGMGRDcZOAImqD
         x5YpeqnUqTdbIcMNfbfd5Xr9fuIUfOZRKUz4+qP9p1HC/iar0H4b0IFpZjrJjq81ApzC
         JfRhSzhJX8CTZlWxdESMwkPmqOR3TpeZQbjXwqDwo2SMdpAgJzVkZkFOqm7lvr9jaKF6
         o90mUIF6EVUUcAbSpsEd7LhbZT8nb0G+7dnjydAXBSF0+T4Foge+IP4eLmR7otNcoXeL
         Tx6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X7KByWBZJtpog/e5+VXT94BYrt5y+diDS2cIO91ns9Q=;
        b=BDZtlGt1pqb2WnfTB2O/PRZ+mxZcgy7PlCYakoKMIJ8lqAM+ujrhA89qCCraPq25gK
         kveXOqlSzJ9TntZxfDzUM73Ez2T/4iWTjcWyTTrSgi+EmrVY5fhF8WwoKdIkCKrysCSw
         u5RYEvN4T+3TlhjwGWlpokFXK+uU2EnciNFhyP9o/5Y6oZu2uVBtuGB6WrqWnxSo5KFz
         Axbb7TThuI+AEsh8vXPnmS4/9DwsG/kIZLCuI7d8uoYpKf4Dp4U6kLBvIg+Bee1NeYtP
         T7XpiLmbP4dnxJoufY0K0JH1T2hNA1xqe49j2xs3UwtZhZIczNPTjwmxqSQoYPmTAIas
         Mgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X7KByWBZJtpog/e5+VXT94BYrt5y+diDS2cIO91ns9Q=;
        b=YFIGYniUy3co7P2BMGDNrCvPTVUI40B0mCXMy9rYDNNn61nAwENqAwCnae7CYjoZxx
         M/AxkzmfNVq1pYtdoZuEwDHtirCcBuklgHebKNAuCMiyCWTEzkZOw2qnEiW19XRQtMY/
         CyW68ACQ147xgrPntoPBW7+VzqZS3hJ0Gk++r8rcMs1Vi9pmHnusqnM3kW076MzSk72v
         wjIKSWrCYAN0JjS7pQp8rXMW/y4P/mbkCXITP9Sv07uva/g1Oj46/7uGsXMBHMwC1n0a
         U/0KeZTdgub0oJ1Vlx0VpHTJkyr3zO2swyox8A6zcWlOhQckfTMEd/t472+UuhqXbbGZ
         B71Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUn+6c430SbBZJcvHSzXHWD2ZANbuEtSZAMVtylSqiMf/lDoleS
	gmZNX4oVOclm8ibOWCP9CpQ=
X-Google-Smtp-Source: APXvYqzkjnqkTOFL4nSrOyq+MEvJa1QHOm81rr0JPUcxb1p+7E5C6zSluCZFWAh854xG3nUgkqijCg==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr48220751wrn.31.1560456294956;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a105:: with SMTP id o5ls1651039wro.12.gmail; Thu, 13 Jun
 2019 13:04:54 -0700 (PDT)
X-Received: by 2002:adf:efcb:: with SMTP id i11mr10926910wrp.188.1560456294453;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456294; cv=none;
        d=google.com; s=arc-20160816;
        b=ksmgm1QuDbs6END9L9jd7z5xTXVLitgwqWFq+xm3c0vpPmUylp0NhSW+22eVLkdr50
         8ovzE6hygDFKhUg2cpjwbc1d8GHjmtvuSq5WpnlyApuBajXz/SisfFqoKsh9voK5pCEh
         Y+O+IGwIN8kMna+MlJhbe6Z69LNflBsKHk1aDO8z0AJFulM5bHJnHdWcFGDqWIv3U5Wd
         zi4S5EEUMnS/nMc50Jq2uG8qvVJZ7Dc7z/9+tVVnzLM9hWQMhZR3IeDV3Lg3XkZcJMWj
         lIeUVKryDYzXhidstC21vxQSG9VokI9yxGi4TSMWu7l8RD4VtyghnqNZ1CfiSIzhgmzv
         P3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ph4KrnDCf8PtTkcltK5x8xjfLaQtW8XPcotT+Jm0GGE=;
        b=FVrbHz58UCYodq/1d6NaansoMOH06opGacp6oG09YjwfCzMIazoKzY+tWaF0nh+mNq
         ZO2MQsB2BQB1jA1lFtK/ajxo12TcCCXtkMWBi/ePCaY+HhD+/1kHQwcAiAY90J7nd7Lh
         GLQugFezWAIFXSEZ3TjTOJhN+UQDqMDbFMU7wupDlo09T4iH+KNwLuPiiZr5pNctIUrg
         n6F8CUTA4BV9uS3s4a++31oQRO866T1KRe8sb5ni4Qh90lijznoQ1iHYPOBVAvQQ8aSB
         SY3NFjaupacrZwuuQzK1SnLrZpt8RIoNQ/cAJbmjpq7iUopbsqZq9rP8QGB8QyMRXkxz
         tY/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id v11si68888wmc.0.2019.06.13.13.04.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvpt0FVCzxxg;
	Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 6/8] inmates: x86: discover and activate SSE/AVX
Date: Thu, 13 Jun 2019 22:04:40 +0200
Message-Id: <20190613200442.18984-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, TRANSACTIONAL 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __OEM_PRICE 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __TRANSACTIONAL 0, __URI_NO_WWW 0, __URI_NS '
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

Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
hex2str or cmdline_parse routines). Inmates aren't able to execute those
instructions as SSE is not enabled and will crash.

Enabling SSE is the same code for 32 and 64 bit x86 and straight
forward: Lookup SSE/AVX availability via cpuid and set according bits in
control registers.

Simply call the routine before calling the actual C entry point.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile           |  7 ++-
 inmates/lib/x86/cpu-features.c     | 98 ++++++++++++++++++++++++++++++
 inmates/lib/x86/header-32.S        |  5 +-
 inmates/lib/x86/header-64.S        |  5 +-
 inmates/lib/x86/include/asm/regs.h | 36 +++++++++++
 5 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 inmates/lib/x86/cpu-features.c

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 6a47132a..c75de452 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,8 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := excp.o header-common.o int.o ioapic.o printk.o setup.o uart.o
+TARGETS := cpu-features.o excp.o header-common.o int.o ioapic.o printk.o
+TARGETS += setup.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
@@ -57,6 +58,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
 
 targets += header-32.o
 
+# Code of this object is called before SSE/AVX extensions are available. Ensure
+# that the compiler won't generate unsupported instructions for this file.
+CFLAGS_cpu-features.o += -mno-sse
+
 $(obj)/%-32.o: c_flags += -m32
 $(obj)/%-32.o: $(src)/%.c
 	$(call if_changed_rule,cc_o_c)
diff --git a/inmates/lib/x86/cpu-features.c b/inmates/lib/x86/cpu-features.c
new file mode 100644
index 00000000..fccf692a
--- /dev/null
+++ b/inmates/lib/x86/cpu-features.c
@@ -0,0 +1,98 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2019
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <asm/regs.h>
+
+/* Must only be called from assembler header */
+void arch_init_features(void);
+
+struct x86_cpu_features x86_cpu_features;
+
+/*
+ * Every booting CPU will call this function before it enters its final C
+ * entry. We make the assumption that all CPUs have the same feature set. So we
+ * don't need any locks when writing to x86_cpu_features.
+ */
+void __attribute__((section(".boot"))) arch_init_features(void)
+{
+	u64 features;
+
+	features = cpuid_edx(X86_CPUID_FEATURES, 0);
+	/* Check availability of FPU */
+	x86_cpu_features.fpu = !!(features & X86_FEATURE_FPU);
+
+	/* Discover and enable FXSR */
+	if (features & X86_FEATURE_FXSR) {
+		write_cr4(read_cr4() | X86_CR4_OSFXSR);
+		x86_cpu_features.fxsr = true;
+	}
+
+	/* Check availability of SSE */
+	x86_cpu_features.sse = !!(features & X86_FEATURE_SSE);
+	x86_cpu_features.sse2 = !!(features & X86_FEATURE_SSE2);
+
+	/* ECX hides the rest */
+	features = cpuid_ecx(X86_CPUID_FEATURES, 0);
+	x86_cpu_features.sse3 = !!(features & X86_FEATURE_SSE3);
+	x86_cpu_features.sse4_1 = !!(features & X86_FEATURE_SSE4_1);
+	x86_cpu_features.sse4_2 = !!(features & X86_FEATURE_SSE4_2);
+	x86_cpu_features.pclmulqdq = !!(features & X86_FEATURE_PCLMULQDQ);
+
+	if (features & X86_FEATURE_XSAVE) {
+		/* Enable XSAVE related instructions */
+		write_cr4(read_cr4() | X86_CR4_OSXSAVE);
+		x86_cpu_features.xsave = true;
+
+		/*
+		 * Intel SDM 13.2: A bit can be set in XCR0 if and only if the
+		 * corresponding bit is set in this bitmap.  Every processor
+		 * that supports the XSAVE feature set will set EAX[0] (x87
+		 * state) and EAX[1] (SSE state).
+		 *
+		 * We can always set SSE + FP, but only set AVX if available.
+		 */
+
+		features = cpuid_edax(X86_CPUID_XSTATE, 0);
+		write_xcr0(read_xcr0() | (features & X86_XCR0_AVX) | \
+			   X86_XCR0_SSE | X86_XCR0_X87);
+		x86_cpu_features.avx = !!(features & X86_XCR0_AVX);
+	}
+
+	/* hand control back to the header */
+}
diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index 50001b22..afcd8bd1 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -74,7 +74,7 @@ start32:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
@@ -94,6 +94,9 @@ start32:
 call_entry:
 	xor %esp, %esp
 	xchg stack, %esp
+
+	call arch_init_features
+
 	call *%ebx
 
 stop:	cli
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index 8e49d326..4d5a7164 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -78,7 +78,7 @@ start64:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
@@ -98,6 +98,9 @@ start64:
 call_entry:
 	xor %rsp, %rsp
 	xchg stack, %rsp
+
+	call arch_init_features
+
 	callq *%rbx
 
 stop:	cli
diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index 25fb697d..49799193 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -42,10 +42,31 @@
 
 #define X86_CR4_PAE		0x00000020
 #define X86_CR4_PSE		0x00000010
+#define X86_CR4_OSFXSR		0x00000200
+#define X86_CR4_OSXSAVE		0x00040000
+
+#define X86_XCR0_X87		(1 << 0)
+#define X86_XCR0_SSE		(1 << 1)
+#define X86_XCR0_AVX		(1 << 2)
 
 #define MSR_EFER		0xc0000080
 #define EFER_LME		0x00000100
 
+#define X86_CPUID_FEATURES	0x00000001 /* Processor Info and Feature Bits */
+/* Feature bits in EDX */
+# define X86_FEATURE_FPU	(1 << 0)  /* The processor contains an x87 FPU. */
+# define X86_FEATURE_FXSR       (1 << 24) /* FXSAVE/FXRSTOR, CR4.OSFXSR */
+# define X86_FEATURE_SSE	(1 << 25) /* The processor supports SSE */
+# define X86_FEATURE_SSE2	(1 << 26) /* The processor supports SSE2 */
+/* Feature bits in ECX */
+# define X86_FEATURE_SSE3	(1 << 0)  /* The processor supports SSE3 */
+# define X86_FEATURE_PCLMULQDQ	(1 << 1)  /* The processor supports PCLMULQDQ */
+# define X86_FEATURE_SSE4_1	(1 << 19) /* The processor supports SSE4.1 */
+# define X86_FEATURE_SSE4_2	(1 << 20) /* The processor supports SSE4.2 */
+# define X86_FEATURE_XSAVE	(1 << 26) /* XSAVE/..., CR4.OSXSAVE */
+
+#define X86_CPUID_XSTATE	0x0000000d /* Extended state features */
+
 #define MSR_MTRR_DEF_TYPE	0x000002ff
 #define MTRR_ENABLE		0x00000800
 
@@ -53,6 +74,21 @@
 
 #include <string.h>
 
+struct x86_cpu_features {
+	bool avx:1;
+	bool sse:1;
+	bool sse2:1;
+	bool sse3:1;
+	bool sse4_1:1;
+	bool sse4_2:1;
+	bool fpu:1;
+	bool xsave:1;
+	bool fxsr:1;
+	bool pclmulqdq:1;
+};
+
+extern struct x86_cpu_features x86_cpu_features;
+
 #define READ_CR(n)						\
 	static inline unsigned long read_cr##n(void)		\
 	{							\
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-7-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
