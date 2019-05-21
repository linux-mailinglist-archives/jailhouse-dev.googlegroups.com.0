Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB44YSDTQKGQEFTYCKDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE625247
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:28 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id e20sf3125756ljg.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449267; cv=pass;
        d=google.com; s=arc-20160816;
        b=KE0gqVz3l28SeUVSOOL6LJSw2ma8CxFM2gKYUKK5r6Y+QFQSZjgihBNV3ClSLEI/47
         ganLzNfgeTFXc5ISG1NpqRnorxoiWp1Lj9RX2p9kTem0PJnr5GFB3vzAy9Bwc14tLI1y
         hLtqTxHKKo5LKLxoD7mGk4QFVAgydIxNeQabwetpAqzWgzC6vKUTZ6lRIXT4KMlDLHU8
         nhaCA0TDGVSnEomthWiy4qu/iLxAc1I1DqNqYOknUyl/s0nVwrprR9duC+Iua59pvyY3
         BNskp2lIlqB6swUPD4Qv/Lzk+rQLVnUb5rFZFTOsu3XYVB3aTj+IHWqpvtiNoflm/EvV
         IIZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0gTFn0m9oG/83g1vdnABjPa914un5k/Vu/oR4Rbjmwk=;
        b=CMtrSKvVdCm51fRGsEv+f4abw2ENMGZzsdBUogTkKr1Sh3h8rIpC+rfweGZCWeg/YN
         6Gkyp4k4WMoEVDlCtS98tgXGabj/HSKtQeHmMTLLwCnBx0Ix6jRSljsHf3XmRib01G/G
         USc3nfNwDqReLE/cqnoL557QNI07CibkZ4K8Fz5of/CydxceVxzswacnPBJyRY9TRGt/
         IDQd3pNFpyqUN33OxHG1WOMQS4lHUCAIOpkNXf1lIAGu0lcuUVv5pjzNxnzHOMoEaopB
         LkkWTegT/8r8ww9+jvEufqyXOADE7LoRN4192ntXKZ6sD7PY2yE1c3Ro96rN5njRnOUZ
         xrzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0gTFn0m9oG/83g1vdnABjPa914un5k/Vu/oR4Rbjmwk=;
        b=CRGZ7l4a5Z4YN9OuK1z9GLDifZ0F4D0lOUelIqpkLOE03mLMd4vOCq0ZtidwbJNNPx
         r0IAn3prIsDR82Ak/c10YOa6YAP49ft4va0xkkW7YeMTlHMttIq93SQqkLG5by5eeM2g
         o+MsC6cf6/IcQGI7PuQGWIjABVVdVvvKnocsuXBlY1EMyv5xOcpYFi8skHnifaciuaQG
         5STIY3oQt9bYIgGPVX23qNw0O3RzJ6XG5yEi5bTNRL8xEIshB5XkTqpGm8rYuRjihWbq
         /Qg62ewoKdeJs0FpKbhZJQLMx1Bb/DsxcT0SOoYhoOvv00oc4WnVk7PAOi3LKlKbvRsE
         HIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0gTFn0m9oG/83g1vdnABjPa914un5k/Vu/oR4Rbjmwk=;
        b=on1euG6LG02PubqCKdOSrVN7kbyOkgrdRfKmMOw+sxqcZ/2C3p10nDc0P3zgxHr9Uz
         NofSGgi4X+dqyecladt/2FgYZqFLzBpS6UJgSc5IeawBHSfJQTOpKqmzcmbPevxmC3xI
         jreEaDBBSO/l7U8tvz7zPsEgO9g4pTOWYLlKMg68MaBulWREG6UKkON+0DpFcOPJvgd6
         dQsde1tvWYA0z9Cw87wEa1v0bavFc6z9yDgvTkxWb8pd8aOOA+QRMSiOikNIfCMrWcse
         Ve7le8hrNpEzGYEhqfzzkvJPW29HWogy1ylB8xX+fThHXNTa97Ddu5GBQIMd85hmBVGZ
         Ix2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJlAzbSuvbc4iRxEneeIBLjOqN11BH5TZgAFbAq2XH2HEwpODL
	qd82KuzAODCwhfvAITzDasc=
X-Google-Smtp-Source: APXvYqywd4NCpwuywLpevAW0aXxdlbB9AvCwRe1kwCHrervP7iHMzvc1cbUujqD0T5W5f3w83aabLQ==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr36903037lja.155.1558449267727;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:294b:: with SMTP id p72ls1884306lfp.11.gmail; Tue, 21
 May 2019 07:34:27 -0700 (PDT)
X-Received: by 2002:ac2:5222:: with SMTP id i2mr34667920lfl.80.1558449267218;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449267; cv=none;
        d=google.com; s=arc-20160816;
        b=T3gu9oX7VgIeK5UzqZw8eDOUKseFoVvpTkzyxaiau33HEKdZXEE7QKIfBBDrNmo+aw
         rSvI4bgpt3XzRhP8Hu6j0H80rrx/s6TYTqtbq+TDAsg5XiYMIsV2OICZsGRva3OAiGAp
         HA0tc8CCC54L3egdM6Q5+3T1uW/jk7HD9JY/bFwjuC6H7FKgvMcM+9LYgi6YiFsYcnKO
         SgJjEcuiOHV2IB9+TK/pb5kmaa/heBIWWXOXgs6UKB2AejB9njE7crYZ4ob9k6Lg9mLQ
         vCm2u9sYT6WuyKspWqCKsiKt1zAMGMkCj2RJjGSoRRsJYFiC0psVb9hwALpKixxqpuQB
         q7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=l0EfYdKPWJZrnZA49FkdbQYODdKaYgQAT1ZoPUDstO8=;
        b=fSCsKjd+uExFjwLUp3us6EG/rAGvDRmfUo4zdQLKeE1D2PJ7+l1Ddgd/sje+6Y8uRL
         p3jfFk1i+BGRG8eGtg8bTn9zXxftNRXUShGvOMESYTswKh62+NImJMIlCr9FhZcL42L3
         sgv/xN+Vxf19eRlxMELF4mtzAyvzIfK3tWXdbujSOFTeM87LJVqJu0SHbY6senuObG6n
         ++LrAasLZzVbI9vDtcpUFNWL+bfY0i+cpyG9CZPnwvOaB8vgSz7gum/H1BSGV+i8Kzbt
         cEQ1AHG7K9owpQ8DZJIIZlEtaNQUPH8PIr/TfhZnXnzE+qM3fAEEMtK+bUhGI3hN96Nj
         PWjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id o20si1805285lji.2.2019.05.21.07.34.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZB1dptzy9x;
	Tue, 21 May 2019 16:34:26 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 4/6] inmates: x86: discover and activate SSE/AVX
Date: Tue, 21 May 2019 16:34:21 +0200
Message-Id: <20190521143423.17734-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __OEM_PRICE 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
SSE is not available, stop the inmate.

If AVX is available, activate it (XCR0).

Lookup features that need no explicit activation.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile           |   6 +-
 inmates/lib/x86/cpu-features.c     | 103 +++++++++++++++++++++++++++++
 inmates/lib/x86/header-32.S        |   9 ++-
 inmates/lib/x86/header-64.S        |   9 ++-
 inmates/lib/x86/include/asm/regs.h |  36 ++++++++++
 5 files changed, 158 insertions(+), 5 deletions(-)
 create mode 100644 inmates/lib/x86/cpu-features.c

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index e474ffd0..ed3b04d5 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header-common.o ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := cpu-features.o header-common.o ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
@@ -57,6 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
 
 targets += header-32.o
 
+# Code of this object is called before SSE/AVX is available. Ensure that the
+# compiler won't generate unsupported instructions for this file.
+CFLAGS_cpu-features.o += -mno-sse
+
 $(obj)/%-32.o: c_flags += -m32
 $(obj)/%-32.o: $(src)/%.c
 	$(call if_changed_rule,cc_o_c)
diff --git a/inmates/lib/x86/cpu-features.c b/inmates/lib/x86/cpu-features.c
new file mode 100644
index 00000000..9cf98543
--- /dev/null
+++ b/inmates/lib/x86/cpu-features.c
@@ -0,0 +1,103 @@
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
+/* Must only be called from assembler via jmp */
+void arch_init_features(void);
+
+struct x86_cpu_features x86_cpu_features __attribute__((section(".data")));
+
+/*
+ * We arrive here very early, and we don't have a stack. Take care.
+ *
+ * Every booting CPU will call this function. We make the assumption that all
+ * CPUs have the same feature set. So we don't need any locks when writing to
+ * x86_cpu_features.
+ */
+void __attribute__((naked, noreturn, section(".boot")))
+arch_init_features(void)
+{
+	register u64 features;
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
+		 * We can always safely write SSE + FP, but only set AVX if
+		 * available.
+		 */
+
+		features = cpuid_edax(X86_CPUID_XSTATE, 0);
+		write_xcr0(read_xcr0() | (features & X86_XCR0_AVX) | \
+			   X86_XCR0_SSE | X86_XCR0_X87);
+		x86_cpu_features.avx = !!(features & X86_XCR0_AVX);
+	}
+
+	/* hand control back to assembler */
+	asm volatile("jmp x86_start\t\n");
+}
diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index 30b3f5e3..ca9f77f9 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -63,6 +63,13 @@ start32:
 	mov %eax,%es
 	mov %eax,%ss
 
+	/* Temporarily hand over to C. Note that we don't have a valid stack. */
+	jmp arch_init_features
+
+	/* C will jmp back to x86_start */
+	.globl x86_start
+x86_start:
+
 	xor %ebx,%ebx
 	xchg ap_entry,%ebx
 	or %ebx,%ebx
@@ -74,7 +81,7 @@ start32:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index 2c4caace..53b13173 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -63,10 +63,13 @@ start32:
 	mov $(X86_CR0_PG | X86_CR0_WP | X86_CR0_PE),%eax
 	mov %eax,%cr0
 
-	ljmpl $INMATE_CS64,$start64
+	/* Temporarily hand over to C. Note that we don't have a valid stack. */
+	ljmpl $INMATE_CS64, $arch_init_features
 
+	/* C will jmp back to x86_start. We're now in 64-bit mode. */
 	.code64
-start64:
+	.globl x86_start
+x86_start:
 	xor %rbx,%rbx
 	xchg ap_entry,%rbx
 	or %rbx,%rbx
@@ -78,7 +81,7 @@ start64:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index 85da043b..905d03ee 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -42,15 +42,51 @@
 
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
 
 #ifndef __ASSEMBLY__
 
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
 
 static inline unsigned long read_cr4(void)
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
