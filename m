Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSGD7PTQKGQEX3QGMLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F23BFB3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:36 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id b4sf3413307wrw.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207816; cv=pass;
        d=google.com; s=arc-20160816;
        b=xdXzfORywi9XsJOZDZ4TiYQQ2U8D/dbXqIE9fxjf8GQ6SQARoC1n/nvd4TO24MnSaO
         Wu2xvyc4VRnorXwtz1UIlNzmexVe71vd0oNk/NJhJcpTnhMGyzNgBKPmMJnWgvg8eHtY
         cxQGDcEyEh1YZsR3zpAGwoENCRvCTYspg72DWtQzoe4Q9TslI2LtKGDUZjuzEV8R6atS
         oRxAMw0qZ6VfWnJtGBIErsT69goq3/upmRkJOgqWEGoS5Aqexk7VMTOGygaIlcyeekvp
         NZkuWdWEpg9DY9b7hjplCS/0ZOyMndJYyHL16lOnZYErjHZ8GPaOd+rbvmuFUBpQoI1i
         DajA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Z5xuFg/tA+Wrfm3utgvLHrmZdeY++zURxLcqsb7GkzA=;
        b=uosRcWRU3QCt/DBqLxKEos6uJkLYRGLDywOaUCIUf0w4b/RpLKc/uqJkRNt2FZSWTH
         IYEFevnFutJ+kck6lTl6A9CVqf1UOtVjSN+tWUQuYC6J8eSkoii+NBiQWRci/LMuktua
         BtvmYDDGz3IHrzC5GLWKBasVDrwFeuY192BFJmueMN18cdNTj6GXLGKiKCFZISGmn1VO
         1FiBQoctRhEiXq18122wBFQRJVbhqXdzOjhG6zyof0jMRfa4y7Qtk3dC+Lra/YiYl1do
         JllwyrU9qJO50PsChG8civ1UKsbayJneDcZhxQX4Rm74y7x23+93bKPnggO8wNvGoXvs
         wHkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5xuFg/tA+Wrfm3utgvLHrmZdeY++zURxLcqsb7GkzA=;
        b=pEJKKQ8toemTq5ry3Dpr3C3Z91gCgYaCRkRjU2lRsTSsr2A2r760kaboqmF8B1j84R
         /BCow8XGb5aOkYkZu4ewXHDYiP3euM6M0kY8NfQrYKQC37ifRhBwgqDBiZL31OOJCnCR
         kbfjh1CXZMTz/kvjLn6v6K8IvjyBhaNeNnO8F2U59bAj0uRUpuqonfNRliXvVN6+p91F
         +Fu1mavBMO+UTC9oRe11HTTfkjzxNUMgHuiAzRE7vLpaHDFThmP3V2rT5tRcFe5+ctFb
         QQsOhmxBNXDEc3kbsjD2QWgRWCW4xs17NN6CkWHVC5B89huOk/CmfctThHJYjyB3QLIF
         CohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5xuFg/tA+Wrfm3utgvLHrmZdeY++zURxLcqsb7GkzA=;
        b=hX+kWw3WdlVu05CsMCAR2ykMc+PPjU95wgZYQaC/y8DH11JjKMcdIUae4f/gRgv4I6
         eRgi1aZNzQzjhrjtLOQ6Zsxobj020Ic6fhg6fS4yqgv3HSuKLkEcVpYhZyx+W+xubcGF
         RlSq2i9DW6BfevFwgmdfL9cq5OKIq+kdIXbXyzprQKiFntAEae/GeyE9675+bHjoUGwX
         EFOIvFfOwQyc6HnWOdLhif3AMYffpLVwlOKjPukRMOlqnPulr6w19V6GEeHQ6ozUY0X3
         Wjl10tKZtXe1TxB/k2EZRLb9uVize2QEBk4LUpcp3EiSK/oK6v/TQ5YuOvql/d+4BF1W
         OUwg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVSImbtbGZzMvMwOSXeshF1TMEfaykTo+nvWoB0nmXiKHOfQGSu
	Ky5Ot07zYJ573zsAPdUbdFE=
X-Google-Smtp-Source: APXvYqwRFtbSre6i6Mw95mfGnofx+TYjfSAzV/hfbjhym/xIdBBWUY71VsPIgLHDD83ATo+LwN22Nw==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr14909225wmb.77.1560207816348;
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d05:: with SMTP id z5ls3986881wrt.15.gmail; Mon, 10 Jun
 2019 16:03:35 -0700 (PDT)
X-Received: by 2002:a5d:534b:: with SMTP id t11mr9853635wrv.61.1560207815887;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207815; cv=none;
        d=google.com; s=arc-20160816;
        b=q1OcbJUSgXMmEt7O6YtqbOcooOvb2lz27LA7mOAP+aEc6c+GVcsq2vC93U9bNA79L2
         KJCBabQg+ctMR4vNfnKA3Ozstc1brIkNaJrO6wH9+leyiTfOPmfVDAfn+Uz0RAfkoLXh
         n9KCaYTx4mLqrA+QaXko1S+maRait3+EFRbWinjQixE2IeGqzFcqs9ftJgC1rhyVn1Qn
         oQb7bUB9E/xmYYvsUAkUCn4SeJVelTeGHt7a5ZKAi3a96G606qFHURkNLvu1JFrVlLyi
         4nLVRlukGH6/tFbNYg15quvw/yffCEEDkPfnrE4flI5PEgqAj4D6aBlOFa0eY9gTnpCL
         a/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mtGPtU67IwoLyWiTe47d5p2iitlt3VPPT3gEDh8+O/I=;
        b=ys36YvcqqrpncAXkPybZOGzN+8yWjoF4dUMqyZZDna3kYnfnK/RCZvZ0RAEUYbU46x
         7swHJiY8I/hsmRcdxIBApVhkdQWksuqb3ZpXw1V00gNPcaGKMjWf/gt7FGZCEaXSV7dt
         AbVhRZs0v4lWJEZeGUOklwA/QsSBGSy8h/r3gDChzlAnbMIegvh3gHrx/flDiBpa2HIG
         UlMdTMiTdG2sflnCOSdLRfQcFbNdgrYl5pGLQ2k7O45kYGhhXkNMhEjqd8gYFMhm/tT/
         NJ+/Q25Icj6Ua5EVAca9hLJ2ZzdQnXDbACbHIR7ex6v5gygAe5AE01YSn7puRV+yd2ob
         Grlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id v11si65082wmc.0.2019.06.10.16.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wR3JYyzy9w;
	Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 08/10] inmates: x86: discover and activate SSE/AVX
Date: Tue, 11 Jun 2019 01:03:28 +0200
Message-Id: <20190610230330.21419-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __OEM_PRICE 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
index cfea8580..bc7adc58 100644
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
 static unsigned long __force_order;
 
 #define READ_CR(n)						\
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-9-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
