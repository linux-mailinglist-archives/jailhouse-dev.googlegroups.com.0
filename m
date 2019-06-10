Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSOD7PTQKGQE3ZXDZVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 747723BFB5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:37 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id l26sf17627313eda.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207817; cv=pass;
        d=google.com; s=arc-20160816;
        b=vf/MDNBHaLUwTGLumy7AUqbZLAMx/MxoDaQ7T30BzdznOdUaQlradpIyUthOwmhP8f
         543XlwvALNdGsvetSL9JT0LjuEgRbynQ7gyFTUzEpOGxdCIocrscYXE4TB+70m2fMnF0
         e6l8xzXmwl4wW81++mWXhEmlSds+ExcI69ALKgBhmMhsT3f8BBkMTHAHRvML+yofrtqn
         SswYv75iWHY4X6lP9JBxE9BGzD/An4WuhVczryqEFyDUieVXSX3hiXpBfZ856veLVQ0S
         molEcNAzaOSuDbj2CfNKfWk2ay/r/c1o9RKEvtFVSKp3v9ZgF743gJBlnnsdeAHUNIgi
         cDtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=zfvGFg1cj6oCSL7dUedrSEFDzP058zhULOPg/L9ztTs=;
        b=Ly9FnQfXkqJTWBdMAGUkKnF5XRJwzDj3fXmXIGtUK7aJvHN+GYnMs9pD+Gy820IuBx
         AIxyyP3CSx2OGLw4M2gR2t9jrul3TcMdieXGJf/UOYlYk5+8e77keNW61ByhNKNzXCTr
         UcvWZfPz11z+kI5FGverg4gQe1ND6MOSztrSc73sgr2kplixX2wTtV9tZ/og+gFgddQi
         Bg5h8jYwAsfo6lH4ajV1UYJ4x0Wv4LPuebjoHgnatPKUrNIrVDjAXBxDW1k9SACSXc2c
         /gq9XsNpVcKrNgm5HH1cQvC0mR1Pnsw317n8Wwya4IUxT6x7w+5lPcdWNJw9Im/NzFqr
         2Y5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zfvGFg1cj6oCSL7dUedrSEFDzP058zhULOPg/L9ztTs=;
        b=QoPjPD/vXp1DwvGgV1p5cmIUOTDlJq09G9cng5eK1+GQdYZ7zAKrhAMaipt3OFtd3B
         atkpigLywL0iXghwi9bDVcxT5b918O0shwUqrawfaZ9v56GOm6AKWgKUX6CKDKljdUPo
         NN9/vNauMk6q9JjAG0zyE5K/llO4L+tMIj8Ywclysd6gsJbt62xVMjube0kUrLWWhncK
         6AZBeCO9G/FEANDPrKBbXWLuG5J1rqtKYYY20JvnEeePBxNIAd4CkS583y/+46EnO/E/
         kl8XAPHQ0n9gFKmpohChazvfgQzdUwG0LM1IIa0m4vlmSgeyFfgG45D0kxmVzv0wK4sR
         DMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zfvGFg1cj6oCSL7dUedrSEFDzP058zhULOPg/L9ztTs=;
        b=XhPw4rwo8iU03NTpISeY9Sx4GvHh361X2r3R3rBYCyexj+3aHQdgLVrVijKtXMFjpC
         xWb7RZIoDlnwnQyYSqJ+w9uFOKkOxWzbECO9Vf8ZEVrMbq8evEzf2hP3vObsawwgL9ss
         SvLnXR62AGtgMXvHX+Vb6YyRugl5S7jATrk2Pbn20suVXPSjacM3QFRuNVCoYc8Cz/VY
         lq3YrYVX+QeBkUme/Z7ZNFIgmYweVGOBuco03OkZRxWwIHbA/ihhXEqrJRdRAeR9Q4Uo
         xKP2qPrqlS8/WrSvsQci+Tw+7ibI1szVmyTJZjl/+wd6sX+oLQ9JTchjV5Xa3eDCGn4h
         yadw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUiLb7ps0TaELgnjpdF4b/eLr3FHnntcXwYC+0J2s7piNWNIMlr
	5TKyzs2qkX6fNxCN8LL6hao=
X-Google-Smtp-Source: APXvYqw1alHyz8aMCT9ryTcQDbXEH/dIWnUXVTBCAtiRVzzRCM6+9DTd7wm+NtIHSyJy4owi3OepDg==
X-Received: by 2002:a17:906:2f15:: with SMTP id v21mr37846115eji.113.1560207817215;
        Mon, 10 Jun 2019 16:03:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2f91:: with SMTP id w17ls4226027eji.16.gmail; Mon,
 10 Jun 2019 16:03:36 -0700 (PDT)
X-Received: by 2002:a17:906:5008:: with SMTP id s8mr25856950ejj.308.1560207816769;
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207816; cv=none;
        d=google.com; s=arc-20160816;
        b=pxw3ZSHdbMsAvHELvhuFr9znqGxgnPdRgEueZFuxP+A65y9fXsOADU0cbuhNI4r5af
         yihY7WTJHUTn77/P0n0wjm9OxayvOPIhEzXij4wP5CU/fbujMFU1l/6foZPfrTgsY0C2
         b1rBR9DJ5apLJrwFfYf+dIVHGaVaeHyFlF0Atbhlv7CBQaurOVkWfoHLqqwS3yFV59XL
         LBcxfsmU8S3Rk7/MHjEHabiJPYuX/uGla3Cr/O9CcG/f8ilF8E9bcLCOn/Hlhb9ICeBy
         tXwrP8IKZuKd46SuIC8sGU98lQudBxiSXxLXu5lONurw5j00DDBgVvCZ/kRQuwzIfPF0
         qcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gZADB5kkRMosbHEOkzf42YRLdZXfouHlz98lEXWAZFg=;
        b=OvPVsE8v6G0KmGvaPGHfY56yvHuYRAgiS/f1uYOYOBSdTkd1gfUjS0XBIeib3MjPju
         wgoRXz3sVZuTs12vUWKf1bT79XIFKHGDC8AM2dPaMLqA7Fj2AE+InBGBOW1nhF02T/YM
         jqhUJGDvJoC/xXe4oobCFFoU+sC6VLkHdtWIPX2q3u7wp4LZeLVusv8bH+0JG1BlnqSy
         1o0sM9ZpUd4mrbuLkNkSZLU6Ny1SjX75enkMtgHuBlwbiuMnsTGXfGr+rNarpelZCXR6
         PjXtad2oiblNFznAOZZfyqVzSYBG8aD+jJewQhUZ8YEk+yIzhCBQlcjZd6y2Ij37UoN8
         1x2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h23si108829edb.2.2019.06.10.16.03.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wS22fkzy9v;
	Tue, 11 Jun 2019 01:03:36 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 10/10] inmates: x86: Add SSE/AVX test inmate
Date: Tue, 11 Jun 2019 01:03:30 +0200
Message-Id: <20190610230330.21419-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Depending on availability, this inmates executes some SSE/AVX
instructions, compares the result against an expected result and exits.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/tests/x86/Makefile      |  7 ++-
 inmates/tests/x86/sse-demo-32.c |  1 +
 inmates/tests/x86/sse-demo.c    | 92 +++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 1 deletion(-)
 create mode 120000 inmates/tests/x86/sse-demo-32.c
 create mode 100644 inmates/tests/x86/sse-demo.c

diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
index 1f30852f..030e20e6 100644
--- a/inmates/tests/x86/Makefile
+++ b/inmates/tests/x86/Makefile
@@ -12,11 +12,16 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := mmio-access.bin mmio-access-32.bin
+INMATES := mmio-access.bin mmio-access-32.bin sse-demo.bin sse-demo-32.bin
 
 mmio-access-y := mmio-access.o
 
 $(eval $(call DECLARE_32_BIT,mmio-access-32))
 mmio-access-32-y := mmio-access-32.o
 
+sse-demo-y := sse-demo.o
+
+$(eval $(call DECLARE_32_BIT,sse-demo-32))
+sse-demo-32-y := sse-demo-32.o
+
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/tests/x86/sse-demo-32.c b/inmates/tests/x86/sse-demo-32.c
new file mode 120000
index 00000000..1136c98f
--- /dev/null
+++ b/inmates/tests/x86/sse-demo-32.c
@@ -0,0 +1 @@
+sse-demo.c
\ No newline at end of file
diff --git a/inmates/tests/x86/sse-demo.c b/inmates/tests/x86/sse-demo.c
new file mode 100644
index 00000000..2d2ff379
--- /dev/null
+++ b/inmates/tests/x86/sse-demo.c
@@ -0,0 +1,92 @@
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
+ */
+
+#include <inmate.h>
+#include <test.h>
+#include <asm/regs.h>
+
+typedef u64 xmm_t __attribute__((vector_size(16)));
+
+void inmate_main(void)
+{
+	printk("CPU supports\n"
+	       "    FPU: %u   FXSR: %u XSAVE: %u\n"
+	       "    SSE: %u   SSE2: %u  SSE3: %u\n"
+	       " SSE4_1: %u SSE4_2: %u   AVX: %u\n"
+	       " PCLMULQDQ: %u\n\n",
+	       x86_cpu_features.fpu, x86_cpu_features.fxsr,
+	       x86_cpu_features.xsave, x86_cpu_features.sse,
+	       x86_cpu_features.sse2, x86_cpu_features.sse3,
+	       x86_cpu_features.sse4_1, x86_cpu_features.sse4_2,
+	       x86_cpu_features.avx, x86_cpu_features.pclmulqdq);
+
+	if (x86_cpu_features.fpu) {
+		float result, addend;
+
+		addend = 123.45;
+		result = 543.55;
+
+		printk("Testing SSE...\n");
+		asm volatile("addps %1, %0\t\n"
+			     : "+x"(result) : "x"(addend));
+		/* Test raw result */
+		EXPECT_EQUAL_U32(*(unsigned int*)&result, 0x4426c000);
+	}
+
+	{
+		double a, b, result;
+
+		a = 123.45;
+		b = 543.55;
+
+		if (x86_cpu_features.sse2) {
+			printk("Testing SSE2...\n");
+			result = b;
+			asm volatile("addsd %1, %0\t\n"
+				     : "+x"(result) : "m"(a));
+			EXPECT_EQUAL_U64((unsigned int)result, 667);
+		}
+
+		if (x86_cpu_features.avx) {
+			result = 0;
+			printk("Testing AVX...\n");
+			asm volatile("vaddsd %2, %1, %0\t\n"
+				     : "=x"(result) : "x"(a), "m"(b));
+			EXPECT_EQUAL_U64((unsigned int)result, 667);
+		}
+	}
+
+	if (x86_cpu_features.pclmulqdq) {
+		xmm_t a = {0x00017004200ab0cd, 0xc000b802f6b31753};
+		xmm_t b = {0xa0005c0252074a9a, 0x50002e0207b1643c};
+
+		printk("Testing PCLMULQDQ...\n");
+		asm volatile("pclmulqdq %2, %1, %0\t\n"
+			     : "+x"(a) : "x"(b), "i"(0));
+
+		EXPECT_EQUAL_U64(a[0], 0x5ff61cc8b1043fa2);
+		EXPECT_EQUAL_U64(a[1], 0x00009602d147dc12);
+	}
+
+	if (x86_cpu_features.pclmulqdq && x86_cpu_features.avx) {
+		xmm_t a = {0x00017004200ab0cd, 0xc000b802f6b31753};
+		xmm_t b = {0xa0005c0252074a9a, 0x50002e0207b1643c};
+		xmm_t result;
+
+		printk("Testing AVX PCLMULQDQ...\n");
+		asm volatile("vpclmulqdq %3, %2, %1, %0\t\n"
+			     : "=x"(result) : "x"(a), "x"(b), "i"(0));
+
+		EXPECT_EQUAL_U64(result[0], 0x5ff61cc8b1043fa2);
+		EXPECT_EQUAL_U64(result[1], 0x00009602d147dc12);
+	}
+}
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-11-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
