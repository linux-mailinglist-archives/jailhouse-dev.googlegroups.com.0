Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ6YRLUAKGQEVVLLCQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 9825444CE6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:56 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id u13sf3393188lfg.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456296; cv=pass;
        d=google.com; s=arc-20160816;
        b=BM0WCCzz5y4KPkqRT0gBvubkMYVE+44/+rWzc54Akdknza1bcjEkFvCAlpBVBHGWOK
         4fmOZ2/AkMODVwO+0ybGGAkzwze8suqftmaH3w1ogMfgz8iBtgh3RNEqnQIGFt8sBsZ+
         sog7RGeJBymgZ/YHPuCmU01KeSNFfUa6gVbITOjfg+LSSXio1lYE1B6g0duhkjN9D90e
         IbN6t05R5lyupshFTlCYSeUeNV44+XAQvFqCnSl/uTOMWWkgAe5b84fpT4ZSXxqP/3aA
         mQN/wCFBTIIjS/Hm2aVNb660nVyTZ556eJRi3eJfi3ZPwb52Jj7vWKR3o9DbjMFChBDx
         4R1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uwLL64RdOiP1PMpYW6u5l0Z1tyT8ANeAk/HogI3OdJk=;
        b=HlZ55OZ5KGIq22jgwFG9j0e/Rz04xWzPxieu8eGvFLpe5iMkEVKfD9HaPo4qkZBc4X
         zMpd5ArgL9x3YW9rM8Ti4BsiW5Bad29k7AS0Lb77uLDgRB6TkQvRsNLwQIjOc/tA1BQa
         bpafeYb5HmpBvbPGstgc1NuWv8XkvOD52OgWQ8Mz2JRC/Xv6FVqkSG/HODwFpMOkkRIi
         vv8oZngTrRsFtfFXA5V2Y6tSTZEHCdlCo7VdE/aicrtvcIP5DBZwUyFBH4pGXa4UwmZU
         5agxQdssq1wjlmCQaVS+W4SehvdkPS+tl7WdXuE1TIs56R3GSJER+M4M00lJa9SAwOLH
         InqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwLL64RdOiP1PMpYW6u5l0Z1tyT8ANeAk/HogI3OdJk=;
        b=CE+Hj430CEXXYknKLxsiSPmaXmFe18XIXXONRZFS1ufjXugQWB8otvtj10R+tmIqF2
         OYCEjb7Vw50IH+QtG3esGvWbsbDCbI88vfKWb0QRtT0W/sbGIKVRNKgSGtbxk+fdFyjp
         XB/btMV9ogPo+AIFl4GhMozsyU3rXlKn+gIG3+YB9a+dhbNKqbzYvCyRNksG4RKNU7JL
         PDVGYfdUNqvgwv7eDxpCZfNE53O89K6nT+boeKumuuINlXFB2Wvoq7Wtg5MLHpOQj7kJ
         4nr7aE8O2ubzGJWVJ/IYdGXbdEcnBDDp9EAGHK93eGaaVYow/6csJRjFW670hSVbpKTl
         B25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwLL64RdOiP1PMpYW6u5l0Z1tyT8ANeAk/HogI3OdJk=;
        b=LQNfPoGpQsyUlB1HIr9sHb8exB7+4BfEO9mHHN4l4mt7O4ncHLngWNDVjMA3AEkUTB
         LZQwM1abS470Zop1oqQvrkA3ZGcgXvoQ4KtQ8+2NZc5JIWKFzkHmSZseESDm1Cdvlzv3
         hW5eQVlPo6RU40v8gYTVi8elqQFbrjoAtdog0GNwbLR5KuE82NQalz4ubmrGooHoVMDP
         7jSb/pj2QiFBzSFKUrRRLcAsYZ3OEWG4OJVJFiKK+OGM7zkutyoxCJ8bBvLZ4Lur8bgz
         POmsqE6PbKfWOhpNxhEHh7xHcRMWf0IMy5fvN5KkxqxbhM7OhDTDt4OnfDuS/Z6UNuJ+
         KtpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbXXV1jL+11rdg93dQr/GE0a6UnHyodomW7DYPF454SRdE5E1N
	1m6zGvuQOObhFWrZJFjVhpk=
X-Google-Smtp-Source: APXvYqzqDJF04E/AP0ghdDhRh8Mh+Rp1kdyrXDsVqJvCvs3BUtndMEbRE2A57NJ6N8ypmKyOFpHtUA==
X-Received: by 2002:a19:4017:: with SMTP id n23mr49755357lfa.112.1560456296116;
        Thu, 13 Jun 2019 13:04:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:614d:: with SMTP id m13ls673062lfk.1.gmail; Thu, 13 Jun
 2019 13:04:55 -0700 (PDT)
X-Received: by 2002:a19:ccc6:: with SMTP id c189mr14228343lfg.160.1560456295495;
        Thu, 13 Jun 2019 13:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456295; cv=none;
        d=google.com; s=arc-20160816;
        b=DBWP9yTwkOSmhT5d2K/D+S+E8+O7h31G+zE2hDd3fc7NSAWIxYAfGkxhIQEvfqRQpH
         d2EMK0Oc2UkiKRQM7fwf4y7amzaR9MR0Hxs9wpCIaLSRJODYkhC2vPPOHuN4OPnhVTva
         SdY0na/9D0EjQSvwk72N7U4U5uQsgrMh0KH7afKuRvcBqokF6ZWsp6MMzD99QKviVyDO
         FREwRBJTgCAXflATa4YptkxAWcjg57bmMzvgXAzkX12rO/zuAoIbtoxFAIiKUUxfnLXm
         MoN0j/hF03Zb66TOeTxxUPb1P2XvY3aTMEoHOjkfVVG8ehrTr3n2I4mAocogs4To4BAI
         5+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0AGgOSqcIDEgJp0xZL18aUDjDSvc58H0eo35drSuiNc=;
        b=MWa95uTfRN7/aOyZ0SOVb74j2uQrKUWEanqpOJ6rK/KQgtduJ+g2eYqrl2VHdOakNQ
         a389HE7Ecr+FVYUvCflJfeN1OGn4SVC8QZTTvNwrlFb8g/dIaaqvzTaqiSUHySMN/0Ra
         0Hoo52qTnO0SsyD5ZBIJ4eax8CBB9affNdxdVpDKsz5/uiVyby68CepY1vUUOcc3AgSB
         CJYZv2CR1VUve0OBqZCSr7y5jCp0IRUKVi+4yGWi+Mi/QGwqTQuZLJ7uk0wduFh2tP1D
         LRIw6AMViEauks6L7DhYxROnPxsgMI6244EgRwIDu4j/mGWrjKL9KO7Ak5LRXKz2S34h
         DHtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h11si74652lja.0.2019.06.13.13.04.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvpt3t4Pzy0s;
	Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 8/8] inmates: x86: Add SSE/AVX test inmate
Date: Thu, 13 Jun 2019 22:04:42 +0200
Message-Id: <20190613200442.18984-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
 inmates/tests/x86/sse-demo.c    | 89 +++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 1 deletion(-)
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
index 00000000..237202d4
--- /dev/null
+++ b/inmates/tests/x86/sse-demo.c
@@ -0,0 +1,89 @@
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
+	xmm_t x_a, x_b, x_result;
+	float f_addend, f_result;
+	double d_a, d_b, d_result;
+
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
+		f_addend = 123.45;
+		f_result = 543.55;
+
+		printk("Testing SSE...\n");
+		asm volatile("addps %1, %0\t\n"
+			     : "+x"(f_result) : "x"(f_addend));
+		/* Test raw result */
+		EXPECT_EQUAL(*(u32*)&f_result, 0x4426c000);
+	}
+
+
+	d_a = 123.45;
+	d_b = 543.55;
+
+	if (x86_cpu_features.sse2) {
+		printk("Testing SSE2...\n");
+		d_result = d_b;
+		asm volatile("addsd %1, %0\t\n"
+			     : "+x"(d_result) : "m"(d_a));
+		EXPECT_EQUAL(d_result, 667);
+	}
+
+	if (x86_cpu_features.avx) {
+		d_result = 0;
+		printk("Testing AVX...\n");
+		asm volatile("vaddsd %2, %1, %0\t\n"
+			     : "=x"(d_result) : "x"(d_a), "m"(d_b));
+		EXPECT_EQUAL(d_result, 667);
+	}
+
+	x_a[0] = 0x00017004200ab0cd;
+	x_a[1] = 0xc000b802f6b31753;
+	x_b[0] = 0xa0005c0252074a9a;
+	x_b[1] = 0x50002e0207b1643c;
+
+	if (x86_cpu_features.pclmulqdq && x86_cpu_features.avx) {
+		printk("Testing AVX PCLMULQDQ...\n");
+		asm volatile("vpclmulqdq %3, %2, %1, %0\t\n"
+			     : "=x"(x_result) : "x"(x_a), "x"(x_b), "i"(0));
+
+		EXPECT_EQUAL(x_result[0], 0x5ff61cc8b1043fa2);
+		EXPECT_EQUAL(x_result[1], 0x00009602d147dc12);
+	}
+
+	if (x86_cpu_features.pclmulqdq) {
+		printk("Testing PCLMULQDQ...\n");
+		asm volatile("pclmulqdq %2, %1, %0\t\n"
+			     : "+x"(x_a) : "x"(x_b), "i"(0));
+
+		EXPECT_EQUAL(x_a[0], 0x5ff61cc8b1043fa2);
+		EXPECT_EQUAL(x_a[1], 0x00009602d147dc12);
+	}
+}
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-9-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
