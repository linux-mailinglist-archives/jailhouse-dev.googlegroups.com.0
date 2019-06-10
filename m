Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBSGD7PTQKGQEX3QGMLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A53BFB4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:37 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id a7sf5125520wro.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207817; cv=pass;
        d=google.com; s=arc-20160816;
        b=STMioBi1yBr5o8VXqhXWSgInG8NdNMLM3FOiQrVO0y263XN/NvAeZWbHSOGKgm5BeS
         OFnlGEa1qUVcsdC487tHiC3Na5+f+8t/S2QQPxTDP6G6+lLwUnXY+AhaXBObInWQv/01
         ycVyGp/L/GHGzq2kFn4wWkb/0/zVCHs9FxJ3yvEscH5IVlH0Bdstwqn/gxrBasPTs3UH
         clmxx3qWckFWqVqgIhXngTYk8cH1aMHWeRb5PuLAzckrNBNTfrneImODQjfcybpiznPr
         H9V37bEKL2/ZIK5nhtlNWDDAfWyMnODauP6gpGVF/s2QBFKkrgWjD1Tj601suVOHNKRj
         Cr2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Wd6pSNJSUfhFTvdm2RbvsgcyY7eU7615qIZ9D9rqFvc=;
        b=LnJMIW7MUtXcZfMq1JQMdWa36CjnmcDhB7U6NW3gZSwgjIvP4vtDsAuMIY9jE7+hSx
         KfJcIThvfx/fRNL6b/HsaCfBGl1AksrtO/RhFFjJBtdh0ZuB5xVyrtJuAXiX3uZlUE7u
         BGdLaK7ElTp5Rza/pQKTEfUgjiawb59neaOh7IpYPyvCaIq0gVUq1W0hQM63xOfDnbu3
         SySNFRS8fRPbm2WJUz+SLq6+CUWpZNdnnE0Kbl677lGNgeCf2xKQbzxdG0m2oPUEUP9g
         85MPo4AKmMEpHmlM8Ta2axciixmX5YESnLETK3N4FJYhacDzegWNtUrBomU4zwdVnFXr
         LzqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wd6pSNJSUfhFTvdm2RbvsgcyY7eU7615qIZ9D9rqFvc=;
        b=luqC6BtOQkm1vdAThZiyE/ZzmOWFH+1AcJ6f2hBpUcb2oejRha/63ck5AbH2EbrI3O
         VJsehyiwpST/iKQHRGQH4Q99NXUPuqyRDFxnvf+9iTgW7dXTtfCeCBadNS5Ya3hulMFg
         140yAENL/+7l5uo5Tlm2e+azG3yEEvQQwOjaZWLO+rJfA9jchvmCcANkiC/43KIB8Phb
         4HQcZj5Jga2RgtbRENcrWwNxMpGJGbpqY9yQUz15hdK+t/DKo/fwNyf4KdS0znjrMtPs
         gLb72oKVTXnYY8YRsM6Eu4fmZthM8JKvmfusl2c7PIpaaygmKNXVAlL+WD2f4CKQsDZR
         vszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wd6pSNJSUfhFTvdm2RbvsgcyY7eU7615qIZ9D9rqFvc=;
        b=FI93uTaWsuUdnEOiYjW0emesdklWybARcu3Xo6Puxib64wpNiaSY52hpR1eLz3TnLe
         jANKsm6tZuyBm/PpwCyZuaMQVIj4CT4uRD0xWc9jOH0bc0v6yTyZxHU4DY18ZyXVg1IQ
         n8dlMw/ewRKUEuU9UgbEI6V28AY+tK8cRW6565DBqfYFXhM/hMEnzZ8r87KNxZOga53c
         Mmxw1kCbJt31nVDOSRQ44oRPQBNVWuXC1h9twSwqp2cl7/m98+WHztdC/9H4ebIUc/eO
         7rg1/nBr0X+dhGFX2rrewupxymbg0Nubmgr7C+UsTnyNGK1WqF+5hHV0SUELyTJoMOMH
         FooQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWtRROeXDzeGmhWnwNZVPGFdPuntJcRsdrp/gjxLWBgQJYulYGR
	/8ApbqU/uza6ipWsOul7zUI=
X-Google-Smtp-Source: APXvYqyRMoJ97EKA89COh03zZNX8+kgp8vJWDf/Gmq/ToisKqJHWQEV//nSHvkHTDmtlCGgKMVVlXA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr23262172wrp.92.1560207816901;
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:448b:: with SMTP id j11ls3822209wrq.3.gmail; Mon, 10 Jun
 2019 16:03:36 -0700 (PDT)
X-Received: by 2002:adf:dd46:: with SMTP id u6mr34092528wrm.286.1560207816414;
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207816; cv=none;
        d=google.com; s=arc-20160816;
        b=xWmODoXO42Do3dNANn3DO28iXOYkYEEC92cES9V5EHrBXsHJY5+GDiwNf4EgQblzxd
         nifm/PNH0aD4Bx2mtQF0QCiwX2WwAwXUKZ+fkzb6MUU8bgdlVsZLOBYtAARP3OuOdUxU
         LXUkshoNuDR5SEnZHKw7VtihYaCc8YETzFWPXaf7EDLN+hoPfEv/cmkaHU0BwOlejnPq
         GzluZMkrfmO7eDR+U1Gj+nn1AFnDSyWQUma8PaVuACEDDQaoB1CfKXVswB0OyBx4d4Lg
         WCKSqVZwxFQPy1wXBEzwY8bIlXgnkMUiPzwDy0T8keKB7xMiwVGTZVtZl7lTTKOKVY5z
         nmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AOtyLbeIqlwS8kYflPSTAU/2fqiig3F+LQXeDMx1Mvc=;
        b=Kg+IS1ohxSraR2ML6TO2zG15Us24i9T76M9lieYo1O0K2aYRsTjesJdqQ0RX5eVG+I
         c4A30Ol5Y5CmMnNsVHPYi/Zx9aWHG3fuEfB2yxndRwhr2BIJu7pCP0x+1XRes4AONe2T
         7D/7ueXU4j61kisgJNmU6kSefPnWT/tIBbX1vF1+LcbUk89XGfs5/olQBkKcdpdpimt9
         Y/Y9vrnPKSh/4XTlYNXyvOeyPlh+biysTed4n1Llt4HG43pJWvvixC51AZnP/Z9fOrl3
         3HkVwd6UX5keHGTxzkoZ34Pr0Xk9EEQIGYn8FNE18uqkXMWQvSnI5trkCSU1aMdzYNIQ
         KWDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id l19si41610wmc.1.2019.06.10.16.03.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wR5VMBzy96;
	Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 09/10] inmates: introduce test.h and test.c
Date: Tue, 11 Jun 2019 01:03:29 +0200
Message-Id: <20190610230330.21419-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

MMIO access tests use the same test pattern. Let's share the code.
Later, we will also reuse it for other tests.

Instead of EXPECT_EQUAL, provide macros that differ between the actual
type (u8, u16, u32, u64). We can still use the same evaluation function
if we first narrow down types, and later expand them again.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/include/test.h         | 21 ++++++++
 inmates/lib/test.c                 | 28 ++++++++++
 inmates/lib/x86/Makefile           |  2 +-
 inmates/tests/x86/mmio-access-32.c | 60 ++++++++-------------
 inmates/tests/x86/mmio-access.c    | 84 +++++++++++++-----------------
 5 files changed, 108 insertions(+), 87 deletions(-)
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c

diff --git a/inmates/lib/include/test.h b/inmates/lib/include/test.h
new file mode 100644
index 00000000..4f4787ae
--- /dev/null
+++ b/inmates/lib/include/test.h
@@ -0,0 +1,21 @@
+/*
+ *
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2018
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define EXPECT_EQUAL_U8(a, b)	__evaluate_u64((u8)(a), (u8)(b), __LINE__)
+#define EXPECT_EQUAL_U16(a, b)	__evaluate_u64((u16)(a), (u16)(b), __LINE__)
+#define EXPECT_EQUAL_U32(a, b)	__evaluate_u64((u32)(a), (u32)(b), __LINE__)
+#define EXPECT_EQUAL_U64(a, b)	__evaluate_u64((u64)(a), (u64)(b), __LINE__)
+
+extern bool all_passed;
+
+void __evaluate_u64(u64 a, u64 b, int line);
diff --git a/inmates/lib/test.c b/inmates/lib/test.c
new file mode 100644
index 00000000..bebfb56e
--- /dev/null
+++ b/inmates/lib/test.c
@@ -0,0 +1,28 @@
+/*
+ *
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2018
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+#include <test.h>
+
+bool all_passed = true;
+
+void __evaluate_u64(u64 a, u64 b, int line)
+{
+	bool passed = (a == b);
+
+	printk("Test at line #%d %s\n", line, passed ? "passed" : "FAILED");
+	if (!passed) {
+		printk(" %llx != %llx\n", (u64)a, (u64)b);
+		all_passed = false;
+	}
+}
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index c75de452..527436ef 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -42,7 +42,7 @@ always := lib.a lib32.a
 
 TARGETS := cpu-features.o excp.o header-common.o int.o ioapic.o printk.o
 TARGETS += setup.o uart.o
-TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
+TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o ../test.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
 TARGETS_64_ONLY := mem.o pci.o smp.o timing.o header-64.o
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index db743410..3c619bdc 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -11,21 +11,7 @@
  */
 
 #include <inmate.h>
-
-#define EXPECT_EQUAL(a, b)	evaluate(a, b, __LINE__)
-
-static bool all_passed = true;
-
-static void evaluate(u32 a, u32 b, int line)
-{
-	bool passed = (a == b);
-
-	printk("Test at line #%d %s\n", line, passed ? "passed" : "FAILED");
-	if (!passed) {
-		printk(" %x != %x\n", a, b);
-		all_passed = false;
-	}
-}
+#include <test.h>
 
 void inmate_main(void)
 {
@@ -39,45 +25,45 @@ void inmate_main(void)
 
 	pattern = 0x11223344;
 	mmio_write32(mmio_reg, pattern);
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U32(*comm_page_reg, pattern);
 
 	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
 	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
-	EXPECT_EQUAL((u16)reg32, (u16)pattern);
+	EXPECT_EQUAL_U16(reg32, pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, pattern);
+	EXPECT_EQUAL_U32(reg32, pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
 	asm volatile("movb (%%eax), %%al"
 		: "=a" (reg32) : "a" (mmio_reg));
 	/* %al should contain 0x44, while higher bits still hold the rest of
 	 * mmio_reg. Test this. */
-	EXPECT_EQUAL(reg32,
+	EXPECT_EQUAL_U32(reg32,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOV_FROM_MEM (8a), 8-bit data, 32-bit address, OP size prefix */
 	asm volatile("data16 mov (%%eax), %%al"
 		: "=a" (reg32) : "a" (mmio_reg));
-	EXPECT_EQUAL(reg32,
+	EXPECT_EQUAL_U32(reg32,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
 	asm volatile("movzxb (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u8)pattern);
+	EXPECT_EQUAL_U32(reg32, (u8)pattern);
 
 	/* MOVZXW (0f b7) */
 	asm volatile("movzxw (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u16)pattern);
+	EXPECT_EQUAL_U16(reg32, (u16)pattern);
 
 	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
 	asm volatile("mov (0x101ff8), %%eax"
 		: "=a" (reg32) : "a" (0));
-	EXPECT_EQUAL(reg32, pattern);
+	EXPECT_EQUAL_U32(reg32, pattern);
 
 	printk("MMIO read test %s\n\n", all_passed ? "passed" : "FAILED");
 
@@ -86,70 +72,70 @@ void inmate_main(void)
 	all_passed = true;
 	pattern = 0x8899aabb;
 	mmio_write32(mmio_reg, ~pattern);
-	EXPECT_EQUAL(*comm_page_reg, ~pattern);
+	EXPECT_EQUAL_U32(*comm_page_reg, ~pattern);
 
 	/* MOV_TO_MEM (89), 32-bit data, mod=0, reg=0, rm=4, SIB.base=5 (disp32) */
 	asm volatile("movl %%eax, (0x101ff8)"
 		: : "a" (pattern));
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U32(*comm_page_reg, pattern);
 
 	/* MOV_TO_MEM (88), 8-bit data */
 	asm volatile("movb %%al, (%%ebx)"
 		: : "a" (0x42), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
+	EXPECT_EQUAL_U32(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
 
 	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
 	asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x23), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
+	EXPECT_EQUAL_U32(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
 
 	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
 	asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
+	EXPECT_EQUAL_U32(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
 
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movl %0, (%%ebx)"
 		: : "i" (0x12345678), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x12345678);
 
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=1 (disp8), reg=0, rm=3 */
 	asm volatile("movl %0, 0x10(%%ebx)"
 		: : "i" (0x11223344), "b" (mmio_reg - 0x10));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x11223344);
 
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=2 (disp32), reg=0, rm=3 */
 	asm volatile("movl %0, 0x10000000(%%ebx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0xccddeeff);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0xccddeeff);
 
 	/* MOVB_TO_MEM (88), mod=0, reg=0, rm=3 */
 	asm volatile("mov %%al, (%%ebx)"
 		: : "a" (0x99), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0xccddee99);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0xccddee99);
 
 	/* MOV_TO_MEM (89), 32-bit data, mod=1 (disp8), reg=0, rm=3 */
 	asm volatile("movl %%eax, 0x10(%%ebx)"
 		: : "a" (0x12345678), "b" (mmio_reg - 0x10));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x12345678);
 
 	/* MOV_TO_MEM (89), 32-bit data, mod=2 (disp32), reg=0, rm=3 */
 	asm volatile("movl %%eax, 0x10000000(%%ebx)"
 		: : "a" (0x12345678), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x12345678);
 
 	/* MOV_TO_MEM (89), 32-bit data, 32-bit address */
 	asm volatile("movl %%eax, 0x10000000(%%ebx)"
 		: : "a" (0x87654321), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x87654321);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x87654321);
 
 	/* MOV_TO_MEM (89), 32-bit data, mod=0, reg=0, rm=4 (SIB) */
 	asm volatile("movl %%eax, (%%ebx,%%ecx)"
 		: : "a" (0x12345678), "b" (mmio_reg), "c" (0));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x12345678);
 
 	/* MOV_TO_MEM (89), 32-bit data, mod=2 (disp32), reg=0, rm=4 (SIB) */
 	asm volatile("movl %%eax, 0x10000000(%%ebx,%%ecx)"
 		: : "a" (0x87654321), "b" (mmio_reg - 0x10000000), "c" (0));
-	EXPECT_EQUAL(*comm_page_reg, 0x87654321);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x87654321);
 
 	printk("MMIO write test %s\n", all_passed ? "passed" : "FAILED");
 }
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index a17455b0..973381cd 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -11,24 +11,10 @@
  */
 
 #include <inmate.h>
-
-#define EXPECT_EQUAL(a, b)	evaluate(a, b, __LINE__)
+#include <test.h>
 
 extern u8 __reset_entry[]; /* assumed to be at 0 */
 
-static bool all_passed = true;
-
-static void evaluate(u64 a, u64 b, int line)
-{
-	bool passed = (a == b);
-
-	printk("Test at line #%d %s\n", line, passed ? "passed" : "FAILED");
-	if (!passed) {
-		printk(" %llx != %llx\n", a, b);
-		all_passed = false;
-	}
-}
-
 /*
  * mmio-access tests different memory access strategies that are intercepted by
  * the hypervisor. Therefore, it maps a second page right behind the
@@ -49,71 +35,71 @@ void inmate_main(void)
 
 	pattern = 0x1122334455667788;
 	mmio_write64(mmio_reg, pattern);
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U64(*comm_page_reg, pattern);
 
 	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
 	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
-	EXPECT_EQUAL((u16)reg64, (u16)pattern);
+	EXPECT_EQUAL_U16(reg64, pattern);
 
 	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, pattern);
+	EXPECT_EQUAL_U64(reg64, pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data */
 	asm volatile("movl (%%rbx), %%eax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u32)pattern);
+	EXPECT_EQUAL_U32(reg64, pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u32)pattern);
+	EXPECT_EQUAL_U32(reg64, pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
 	asm volatile("movb (%%rax), %%al"
 		: "=a" (reg64) : "a" (mmio_reg));
 	/* %al should contain 0x88, while high bits should still hold the rest
 	 * of mmio_reg */
-	EXPECT_EQUAL(reg64,
+	EXPECT_EQUAL_U64(reg64,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOV_FROM_MEM (8a), 8-bit data, 0x66 OP size prefix (ignored) */
 	asm volatile("data16 mov (%%rax), %%al"
 		: "=a" (reg64) : "a" (mmio_reg));
-	EXPECT_EQUAL(reg64,
+	EXPECT_EQUAL_U64(reg64,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
 	asm volatile("movzxb (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	EXPECT_EQUAL_U8(reg64, (u8)pattern);
 
 	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
 	asm volatile("movzxb (%%ebx), %%eax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	EXPECT_EQUAL_U8(reg64, (u8)pattern);
 
 	/* MOVZXW (0f b7) */
 	asm volatile("movzxw (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u16)pattern);
+	EXPECT_EQUAL_U16(reg64, (u16)pattern);
 
 	/* MEM_TO_AX (a1), 64-bit data, 64-bit address */
 	asm volatile("movabs (0x101ff8), %%rax"
 		: "=a" (reg64) : "a" (0));
-	EXPECT_EQUAL(reg64, pattern);
+	EXPECT_EQUAL_U64(reg64, pattern);
 
 	/* MEM_TO_AX (a1), 32-bit data, 64-bit address */
 	asm volatile("movabs (0x101ff8), %%eax"
 		: "=a" (reg64) : "a" (0));
-	EXPECT_EQUAL(reg64, (u32)pattern);
+	EXPECT_EQUAL_U64(reg64, (u32)pattern);
 
 	reg64 = 0ULL;
 	/* MEM_TO_AX (a1), 64-bit data, 32-bit address, AD SZ override prefix */
 	asm volatile("addr32 mov 0x101ff8, %%rax"
 		: "=a" (reg64) : "a" (0));
-	EXPECT_EQUAL(reg64, pattern);
+	EXPECT_EQUAL_U64(reg64, pattern);
 
 	printk("MMIO read test %s\n\n", all_passed ? "passed" : "FAILED");
 
@@ -122,114 +108,114 @@ void inmate_main(void)
 	all_passed = true;
 	pattern = 0x8899aabbccddeeff;
 	mmio_write64(mmio_reg, ~pattern);
-	EXPECT_EQUAL(*comm_page_reg, ~pattern);
+	EXPECT_EQUAL_U64(*comm_page_reg, ~pattern);
 
 	/* MOV_TO_MEM (89), 64-bit data, mod=0, reg=0, rm=4, SIB.base=5 (disp32) */
 	asm volatile("movq %%rax, (0x101ff8)"
 		: : "a" (pattern));
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U64(*comm_page_reg, pattern);
 
 	pattern = ~pattern;
 	/* MOV_TO_MEM (89), 64-bit data, mod=0, reg=0, rm=5 (rip+disp32) */
 	asm volatile("movq %%rax, __reset_entry+0x101ff8(%%rip)"
 		: : "a" (pattern));
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U64(*comm_page_reg, pattern);
 
 	/* MOV_TO_MEM (88), 8-bit data */
 	asm volatile("movb %%al, (%%rbx)"
 		: : "a" (0x42), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
+	EXPECT_EQUAL_U64(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
 
 	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
 	asm volatile("data16 mov %%al, (%%rbx)" : : "a" (0x23), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
+	EXPECT_EQUAL_U64(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
 
 	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
 	asm volatile("mov %%ax, (%%rbx)" : : "a" (0x2342), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
+	EXPECT_EQUAL_U64(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
 
 	/* IMMEDIATE_TO_MEM (c7), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq %0, (%%rbx)"
 		: : "i" (0x12345678), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x12345678);
 
 	/* IMMEDIATE_TO_MEM (c7), 64-bit data, mod=0, reg=0, rm=3, sign-extend */
 	asm volatile("movq %0, (%%rbx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0xffffffffccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0xffffffffccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data */
 	asm volatile("movl %0, (%%rbx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U32(*comm_page_reg, 0x11223344ccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, 32-bit address */
 	asm volatile("movl %0, (%%ebx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=1 (disp8), reg=0, rm=3 */
 	asm volatile("movl %0, 0x10(%%rbx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg - 0x10));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, 32-bit address */
 	asm volatile("movl %0, 0x10(%%ebx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg - 0x10));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=2 (disp32), reg=0, rm=3 */
 	asm volatile("movl %0, 0x10000000(%%rbx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddeeff);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, 32-bit address */
 	asm volatile("movl %0, 0x10000000(%%ebx)"
 		: : "i" (0xccddeeff), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddeeff);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddeeff);
 
 	/* MOVB_TO_MEM (88), mod=0, reg=0, rm=3 */
 	asm volatile("mov %%al, (%%rbx)"
 		: : "a" (0x99), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, 0x11223344ccddee99);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x11223344ccddee99);
 
 	/* MOV_TO_MEM (89), 64-bit data, mod=1 (disp8), reg=0, rm=3 */
 	asm volatile("movq %%rax, 0x10(%%rbx)"
 		: : "a" (0x12345678), "b" (mmio_reg - 0x10));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x12345678);
 
 	/* MOV_TO_MEM (89), 64-bit data, mod=2 (disp32), reg=0, rm=3 */
 	asm volatile("movq %%rax, 0x10000000(%%rbx)"
 		: : "a" (0x12345678), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x12345678);
 
 	mmio_write64(mmio_reg, 0x1122334455667788);
 	/* MOV_TO_MEM (89), 64-bit data, 32-bit address */
 	asm volatile("movq %%rax, 0x10000000(%%ebx)"
 		: : "a" (0x8765432112345678), "b" (mmio_reg - 0x10000000));
-	EXPECT_EQUAL(*comm_page_reg, 0x8765432112345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x8765432112345678);
 
 	/* MOV_TO_MEM (89), 64-bit data, mod=0, reg=0, rm=4 (SIB) */
 	asm volatile("movq %%rax, (%%rbx,%%rcx)"
 		: : "a" (0x12345678), "b" (mmio_reg), "c" (0));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x12345678);
 
 	/* MOV_TO_MEM (89), 64-bit data, mod=2 (disp32), reg=0, rm=4 (SIB) */
 	asm volatile("movq %%rax, 0x10000000(%%rbx,%%rcx)"
 		: : "a" (0x12345678), "b" (mmio_reg - 0x10000000), "c" (0));
-	EXPECT_EQUAL(*comm_page_reg, 0x12345678);
+	EXPECT_EQUAL_U64(*comm_page_reg, 0x12345678);
 
 	pattern = 0xdeadbeef;
 	/* AX_TO_MEM (a3), 32-bit data, 32-bit address */
 	asm volatile(".byte 0x67, 0x48, 0xa3, 0xf8, 0x1f, 0x10, 0x00"
 		: : "a" (pattern));
-	EXPECT_EQUAL(mmio_read32(mmio_reg), (u32)pattern);
+	EXPECT_EQUAL_U32(mmio_read32(mmio_reg), pattern);
 
 	printk("MMIO write test %s\n", all_passed ? "passed" : "FAILED");
 }
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-10-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
