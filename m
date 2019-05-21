Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB44YSDTQKGQEFTYCKDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7D25246
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:27 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id x16sf3376555wru.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449267; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNamIjPMuFXUdFeq+1DEL72MASBVdGj7rkzMCc2zK/Of7EclXz5OiRhSBrus5/izK3
         SgO0APrh9NCS9EQRZ4QdyARpaL/FBf5rxt3f3F/LNPLplOdap/Bc7Zd4NTNzETsd3qbf
         a9NXaIPw7s1h+vb8RYF/Y1PHRDroHYuHkHKRY4Vpec+o1uzmtunbu/BNVcB54STWRpxP
         rFpaevBhYg8YSnvgWVh7qHQA9B1kOZ3TsLjFqBYcqJGzjCtscCV/wSvC33mYkNs9sdgB
         4hQoazFcUz4C1B927ukFINr3M4ByFcpaZQTdnuKmNYtPm1a+GYqQc6Lfx367QMdYRcjK
         yHuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IN4iZNUL7SWXxZLEcBm4UY58i4OWaIN765B1BSB1PKg=;
        b=TO+yLs4kYdYyAleYUYzd74TOvxihIj4dEsOFOm1QtVAvCpwxyi0JS0oYq3vr5npLpp
         FuSyDXauw1JfT4gyXJ36PJebbGqqVmJJaBMAbt1FyC8o66NgudDcB9JrYNPqZDUWsi8p
         ggIc6gJ6ADIyNS+ykJi8wxakWcZvHIHNekzko8TiDawJFuM36kaiYAwZZrtxPulbT5sG
         3x73s8rKLR2g6eye8PfV6BuYfuhGcuoqhaX+EiOrm4sfWtUt6HKIWmeQ6HtMhgLNp8lr
         vbqlaV90kRgHI2zQ8Rp0YPeIx1obkvgu42QiDO9HlKx7ujRT3aWtSyt8hbx4S6+u/eKf
         bkYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IN4iZNUL7SWXxZLEcBm4UY58i4OWaIN765B1BSB1PKg=;
        b=HgdaAuRmKwtB2kCTbOeOrOa+eeKDIQFFYoFsF4x67clWxdpFzzV0cop3MoXX6zRWVx
         QwiT0OQH0RV+YVVzqNMlERfhBgrO2LNotNf0jeFWYEUIbzHA8R5P1kp8zZT5KKKUW3yO
         fNp3zqy343SBAfSMdvrLbl+MPS2JLVztQgL5EmZhEFqFTyrYuh3Dx/ZXnOTswRtHlsVb
         EWaSCI2X37zWaryE6JB/wybmhMHjBkcYSjqY+RkzmATkKwN1j3RMXigE/ApwHBVD54n6
         eogop/uAV8To9lJkWIsbixUGukJ+haC3GZk4j5aeAH2/3UJtqpVwxFj0EveY892Y7MzJ
         9jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IN4iZNUL7SWXxZLEcBm4UY58i4OWaIN765B1BSB1PKg=;
        b=F+NTMcLR+vZAr4C1medxFlgLnu7RfbYYceD+aY95HdFRRnCYN4Qfcm9YdSt99rBkXq
         Te/sfBsvUe85ftaopcUGmz/T+wUE9kV81z1sXuXr3MXpym2+xQUwJlvKm9AFpvxKDeow
         sRgKGcwVh0qXCeEnDBSXUM8TQ5CHARmqvnFVq6p99z+reYO1x9kdbcxlEZxOjhhbnKtY
         qxqmcbbEBn2JzSrTzlvuftTe95oMC6/xoX9boDc1DMTJINWGJ/YwburxeXV0WHFLzWVd
         ay0TeeUuYPabCy4tUlnXW/5JpeypPW7II0DG5Hv1JgtQ5pV471YSSZBA67BsU46mUZvp
         ZKRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUkwuKUHhdNcvRvz4bCV3FS1aa96WfKB+/v4CuxZ7rGaKQZg7MK
	oNull/Ea6Kv7B1Sb6A3RGYc=
X-Google-Smtp-Source: APXvYqz0X0rQDGLMYTXys7ec2RIRHSGmjzcFHiHBsFzzy74dWE/7qSWyFGG7GXKQKC9jmVr+lKieEQ==
X-Received: by 2002:a1c:be12:: with SMTP id o18mr3594765wmf.124.1558449267682;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8184:: with SMTP id 4ls5095164wra.5.gmail; Tue, 21 May
 2019 07:34:27 -0700 (PDT)
X-Received: by 2002:adf:d4c8:: with SMTP id w8mr17173855wrk.2.1558449267237;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449267; cv=none;
        d=google.com; s=arc-20160816;
        b=WuKvpLaR7vEhN5nmz6UF9RlA5sGtImAHFsfWn9myrL7MpbfksbvieJA0ryFwHaMJm2
         uJoQkgk+36E5in1hurniC5W/vGvIGKfESUKkoASsuWQFuu/pkEsRV6NgjPgjmGwM8VFx
         TgE9MyR2hgO1z0/UZarEpD25mE7VIdoer+MKDfUuhxlM+tV4TRlAlGsHPUUXg3qbrh+v
         g9o74sS1N5wfkMeN7LpdZqO+IIDrAFMWF+iAq885uYDghU54J9lrv4dE08fUTnM00//F
         JjHLL47yeURftKUW2tBLOfM9YxGD0sHPNrNQym+UF1bAImOrXMPQJfeiF8B8BDNVgYlI
         wJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gZADB5kkRMosbHEOkzf42YRLdZXfouHlz98lEXWAZFg=;
        b=yDdGUCWP0dg5/1SPfZQAjM8RBQdjs6uPV1xXmLv/GaGmmIl+RCJ0c9x+8Xj/IWaWEV
         yS0m5nJl0a1OgMBvnjzv0BME1xRDtrKFnosCca6mRXp8YS5BU8pwEJGWufXVodIG3WB3
         C8VSzc8Y8abKetUINtr6jQsHj0MYrrm84vXTRKTBygFpGBUOMHPU226Ops+NwHCdLV62
         sbhhTnryVp1nFH25yrPIVJstT7uSDuYPlvZBWbyPdyHXkrCa7UVzeweiO9cbzwkMbFHt
         AuHHAzdENFA+Zh6OdEuVxuvYReXjQMGV4JizyrOWL5Vy/6IoJQOLXVKk1FQNi4oyx306
         a4vA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j129si118059wmj.4.2019.05.21.07.34.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZB5YlqzyB8;
	Tue, 21 May 2019 16:34:26 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 6/6] inmates: x86: Add SSE/AVX test inmate
Date: Tue, 21 May 2019 16:34:23 +0200
Message-Id: <20190521143423.17734-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-7-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
