Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB44YSDTQKGQEFTYCKDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BAB25245
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:27 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id l13sf8141817wrw.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449267; cv=pass;
        d=google.com; s=arc-20160816;
        b=GE/lN627UU3Vs7wEN6H1Xe8/w+dI/5eNtqeFY9x2Mod/vj0x838FnXvLgZ4AOgR28W
         z+kB/JBODej0mOXxeWyGU+lG/F5FLL5WEO9/ZyN8tCYAkTR+w4zMJ1cJLPGlQiwgh8PT
         8MQU+B9kdfBKqJWBaKAaCYcq2auMuxY674+H8fgXU9qBXzVZ2LTFLRv/Raj74bA5vNlj
         MNLodsm+Wph4du2RmqTIK67i3ZnB5X2GtHuoPlQ/MlkF6kBB2YvljhlT7JyvZDd/z03o
         s7fahGdWIkPZekZ3YbWo04YDflsnVVyC1EpE6zTsJpwk42AvFS0F9dL9EofBoWVNnisw
         i46A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g8mAYtDZjlQ0mfDahzTUwcwKU5FDyQCu4VSTSTmhMQM=;
        b=n1IiUXsT6x4SMhZ5BjNCevi0Lx5BW++PhD/06Er7l7qQ9Q8aEdGLyeWzs3CaPU+kgq
         t/0oRqpZLaqFBdF7K3/9UjPAF70DlRUCtVS6seeWti5MfIwUXX62JeRw1vgVEhWsUjxn
         oeq0oaVUE17hfkyDioapjcOh0bch6RXfYHPl4h2ZzVdYBSNa4b+lJG2gftxEkpI3araW
         pWKNzUy7zTbgasPy7y0RHwucbaapELSxEKfLXD3AFG1vShkK/TSRvjvdgURVzOQZ/yrY
         omRAfZoIi3yLEdASr9tIRytaphVuVRZ8WXdmejB8/zFzR8kx6wMA7rAJYf0IZUtUTu3T
         4WWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g8mAYtDZjlQ0mfDahzTUwcwKU5FDyQCu4VSTSTmhMQM=;
        b=T/WiE91Pcf8MlboPnlBsHXwdFqffpKLKnsQwkGjUokq/WVuUS8jmzEroOJpU+xjeTw
         itLsBQJ49pTyTdkVLO+9QcGTa/ZBPdKN6SG6Tdvk8WkxQFELHAL9cU3TAQTWlx19G/Hg
         0fmIBNP7+9yTtlCM9X/rKIJYiMEeI2iwfjR8+T9Z6d9P3goa4/wEWGwEs9LxSQFDqapi
         rNqG0+QUuJadJX5VhLZd3LMyLWBKQCseqmwk91VjVVKk0DOZwlBoGzVoCHisyX4YgvHQ
         oTNMyQVWdq5fjYuYjA9fGPaGAOPWU2BM5yDXtKIKYu57eMUtLJROZxoUt1r4mO/NybFX
         viVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g8mAYtDZjlQ0mfDahzTUwcwKU5FDyQCu4VSTSTmhMQM=;
        b=jR/yqIzAbPUMmL25AJqO7wQyJ1RehoLBBVhiYsDr4UcabXbI78K3PSlu2K+fZMBrpl
         SRpA+o7+5SPBQtnGFCTpTMBoux1PtvkG4EU6HOloM0dwxZ/RI7Ptk6KxvTWydM+DsGNI
         hRDYolNpmwU1MqkJ+FLRks0ir+vLtMBslx/xG9OVyCk1R902ZyXu0CsVjCLBk7XES5Y7
         YH8y274/AovBJz3cqV7t7OMXHjz6iZINfiiX/uXQpZ5xbgzyUDYVvG9HJxIaY4Qbe3UD
         ncADTo5ZLGy60VE5DMv5mwUTfOivZDwtV4rzSpGuAb1QvBZfVFq/YuEON8yNQwJiSSna
         MaoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUeBvP8jEp1RimL2GovR3rdTi8uo6LF30T7o3/YYDX4PoesPoA4
	vPNFlvrzH8V+dRcR93eLHEc=
X-Google-Smtp-Source: APXvYqxDeffhf10fno7+d0IHxu5pk5urQYdC+lvBI6rycidIrmTa8Z+nELvERLFKfpIvWSJzc24VAA==
X-Received: by 2002:adf:94a5:: with SMTP id 34mr51571981wrr.275.1558449267614;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9c4f:: with SMTP id f76ls1011420wme.0.gmail; Tue, 21 May
 2019 07:34:27 -0700 (PDT)
X-Received: by 2002:a1c:c004:: with SMTP id q4mr3840884wmf.131.1558449267042;
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449267; cv=none;
        d=google.com; s=arc-20160816;
        b=pQDSwmuZoWm1StA1E7yuIsac5J1wpLTLGdOhF4U93YPl5dH1hojchXl7upodkS+G3s
         ccS6OOgkgaXmyFHXroxdk2ksaL8Und6Gwx/knZfNOPmMepcm1qIeSHTeMpMzDc561m01
         FVGa42kBTvZ8cmtW6Xyj9GIKocS/U9taJ223pSCqit9qQ1IohL5qZMi31WGiFWyg1q3p
         RK/mcJ9bZg5DzupZmWyuWZvSneClHy0JCgYWwB7blmP6CuJ6P8K9gcYawT0phVnILbdA
         tHtqGu3Gm7+JTAolkQr7oggnUZ4uez1SwRlt3+Dv6mzyru9Tyain80PDjDN0GjVbFEMW
         lXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=sQgzEKQPneHWos1QbWFPMnpojpAZqlFXMZn/4IJX3eM=;
        b=p+gXD3E74o99vznZT3WSEGwCExG5f9X1Z83FSbWjw4kbCCa08zLJpCx2Mo2Q8C69I1
         96gzmxeMW9u9wyJ/bPkVkGZCi5xyxVgtKCgSsXrEmDfkD/ysewNCo42eKyhaIem+TnNT
         Wpln/eVoVwAEOoMq5EFM330ewFLnEHzqWfA4EwjpE1Xs+qWwTI4vs95RBskCTnn6fuSE
         dgXY2nOJzPXFOnaTpiHVyXsOoJhMfb0U/4cN8zXyc8VQYcyhWnEhdzgspsvrp9uqCJrR
         Lt8paYKcCgocoCP4fSuDsHGDluedzlXmN7tZzAWw8JciVeqBNVjJgFGwTsP2AZSE3SXW
         mMaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h5si2179115wrc.1.2019.05.21.07.34.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZB3YtTzy6p;
	Tue, 21 May 2019 16:34:26 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 5/6] inmates: introduce test.h and test.c
Date: Tue, 21 May 2019 16:34:22 +0200
Message-Id: <20190521143423.17734-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Jan, if you accept this patch, you should add a BSD header to test.c and
test.h, as they are now part of the inmate library.

 inmates/lib/include/test.h         | 21 +++++++++
 inmates/lib/test.c                 | 28 +++++++++++
 inmates/lib/x86/Makefile           |  2 +-
 inmates/tests/x86/mmio-access-32.c | 52 ++++++++------------
 inmates/tests/x86/mmio-access.c    | 76 ++++++++++++------------------
 5 files changed, 100 insertions(+), 79 deletions(-)
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c

diff --git a/inmates/lib/include/test.h b/inmates/lib/include/test.h
new file mode 100644
index 00000000..eb4e8a6e
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
+#define EXPECT_EQUAL_U8(a, b)	__evaluate_u64((u8)a, (u8)b, __LINE__)
+#define EXPECT_EQUAL_U16(a, b)	__evaluate_u64((u16)a, (u16)b, __LINE__)
+#define EXPECT_EQUAL_U32(a, b)	__evaluate_u64((u32)a, (u32)b, __LINE__)
+#define EXPECT_EQUAL_U64(a, b)	__evaluate_u64((u64)a, (u64)b, __LINE__)
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
index ed3b04d5..f2a547ad 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -41,7 +41,7 @@ include $(INMATES_LIB)/Makefile.lib
 always := lib.a lib32.a
 
 TARGETS := cpu-features.o header-common.o ioapic.o printk.o setup.o smp.o uart.o
-TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
+TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o ../test.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
 TARGETS_64_ONLY := int.o mem.o pci.o timing.o header-64.o
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index 2f47f211..a386c266 100644
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
@@ -39,32 +25,32 @@ void inmate_main(void)
 
 	pattern = 0x11223344;
 	mmio_write32(mmio_reg, pattern);
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U32(*comm_page_reg, pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, pattern);
+	EXPECT_EQUAL_U32(reg32, pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
 	asm volatile("movb (%%ebx), %%al"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u8)pattern);
+	EXPECT_EQUAL_U8(reg32, (u8)pattern);
 
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
 
@@ -73,62 +59,62 @@ void inmate_main(void)
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
-	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00) | 0x42);
+	EXPECT_EQUAL_U8(*comm_page_reg, (pattern & 0xffffff00) | 0x42);
 
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
index 0e6a56b1..93925f95 100644
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
@@ -49,58 +35,58 @@ void inmate_main(void)
 
 	pattern = 0x1122334455667788;
 	mmio_write64(mmio_reg, pattern);
-	EXPECT_EQUAL(*comm_page_reg, pattern);
+	EXPECT_EQUAL_U64(*comm_page_reg, pattern);
 
 	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, pattern);
+	EXPECT_EQUAL_U64(reg64, pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data */
 	asm volatile("movl (%%rbx), %%eax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u32)pattern);
+	EXPECT_EQUAL_U32(reg64, (u32)pattern);
 
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u32)pattern);
+	EXPECT_EQUAL_U32(reg64, (u32)pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
 	asm volatile("movb (%%rbx), %%al"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	EXPECT_EQUAL_U8(reg64, (u8)pattern);
 
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
 	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
 	asm volatile(".byte 0x67, 0x48, 0xa1, 0xf8, 0x1f, 0x10, 0x00"
 		: "=a" (reg64) : "a" (0));
-	EXPECT_EQUAL((u32)reg64, (u32)pattern);
+	EXPECT_EQUAL_U32((u32)reg64, (u32)pattern);
 
 	printk("MMIO read test %s\n\n", all_passed ? "passed" : "FAILED");
 
@@ -109,106 +95,106 @@ void inmate_main(void)
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
-	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffffffffffff00) | 0x42);
+	EXPECT_EQUAL_U64(*comm_page_reg, (pattern & 0xffffffffffffff00) | 0x42);
 
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
+	EXPECT_EQUAL_U32(mmio_read32(mmio_reg), (u32)pattern);
 
 	printk("MMIO write test %s\n", all_passed ? "passed" : "FAILED");
 }
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
