Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ6YRLUAKGQEVVLLCQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993444CE5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:55 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id c27sf329294edn.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456295; cv=pass;
        d=google.com; s=arc-20160816;
        b=uumJvgRidv4ox+3VTkxglcvUQ+z+WcEMblZJFdSvdo12QGhySJWM730ehlQsI5JGrg
         ZnL2V7+8ToQmzg0vZ3Suzi/VXm3CHbF3JcUTySby7rR1e5IbUSJQuZ455T9msGThRIU2
         cIHiIdpeY6cn2uCKg2cMzbR0MT++hsz0xubCbrmgoLCuaLPieVKeNislOyIAKtU9KJ1t
         di2FZOzycNXMDgd6RV3agb2yV9RcSgwvoVwujzHAzVvOtmGQL7/yCcccxVtTLK7kduO5
         IfiCXLWsmQkQBVqfCKwUzX3fOl+IAwEPqbHpLEa/yL8m3tCrzE8xf7ehY4aOaeNs0PVt
         lGJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=QuiGK/XD0I1ZBhkBkHg0XACIwGUGEtZrNtOkbcBd19U=;
        b=lwVhXcvXCkJQTRQZYTyE5dYtank02nMckFvZB+O6W+B6+UJXy6lYNbLKcL/9rC+J/6
         nEF0bYhfAFTcSwLElj3S1MRmGbxSvT+T77vMnIPJGaus3SDrLkfVD4faKTHb54GFdmH0
         6ly3ZSX98WgoiStKt9Fr2kjcjcToTvcV/CDHgSsLX+phHiNYAJFEwWj+XIeLp2ONutaj
         qMZFcC42fpPqPDWyeEfXc3s/H6ULHRq/9NAZ7aW1ug0w8GO/uDemz+wlUVKHNEHT4GCH
         6bbg/LajodOrDtPfC5Hxe6T7+GSwh/T4EH3KiVebFyhn2K5KwYDGnusRF1hFUz87rQPb
         RekA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QuiGK/XD0I1ZBhkBkHg0XACIwGUGEtZrNtOkbcBd19U=;
        b=B+JtBxjZzyLJ1cTy9B89tN2vqVtXfIASNJqiwEhxBAkhqbSI31388w3vfSw2/1iGkG
         FW76faeeyixpXuPEwPn1hcZZ37Ugc/4lmmCz/FNMvbPrUhVDpc/biWVtHtkOyFsLU1eX
         YJ1JaEPZ7T+UzycpCH0LSQ1oUmcjGrlDoli0WUx71yWTACkeZOLTz1KSpF+nkwBgliet
         x4DODWIefJ+ChZxcbIGA0zgcuS5FWM9dWGjzTlrmonGecImMohyeBxoexA2d4lyFmIMP
         GxRlG79a1Jfxa9fghSADbUT0HNj+1RwXdqJdLchIO0njN08oYE0usfaLniPQ20ks+0GT
         G3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QuiGK/XD0I1ZBhkBkHg0XACIwGUGEtZrNtOkbcBd19U=;
        b=EI++phojS/IcGDDGowjCQ7+l77vgREoO3NHw1eBSZKBQgOyApZGl4b9L8nm0WV80mG
         SpelS+KY9BJeKIEIU2NUlLRu3cFKbVdq32Lx22aiCUMznM24rP1euq4l5/QOLMmtXucf
         njoSOczf99bIva7yvSZSIYJmUuuNfUeah1uT1jnIzvAzzzoP88OZDkd6wqjd1ymTzlS2
         NUq0ibF9XLUklLzBh9jea2mZtPX/mzkUyN27o3wTznQ7nM+EZHURlMqwP9jpt0U2Km8z
         Lye3HQLaWJ3H16Sr7soKC3mXw15SOg5xH/K6Hv24d7WFdPW52zsi+CMpn1zirEXyVCyR
         3PeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUbiwEw+jxj1kEGJqPgB2MstqbbkTB94CUN6mdnRux87+HXUtaw
	FGep1XvAu0f6xAqgqXdddqo=
X-Google-Smtp-Source: APXvYqyidyQO6oIp9Wj/Mf0w9tcUh1FPh+vWHUjae44t4TjmnVV92eAi26YnovgBnpTFfpSFjx3eyA==
X-Received: by 2002:a50:b68f:: with SMTP id d15mr22133073ede.39.1560456295233;
        Thu, 13 Jun 2019 13:04:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7084:: with SMTP id b4ls1618623ejk.6.gmail; Thu, 13
 Jun 2019 13:04:54 -0700 (PDT)
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr46605947eje.168.1560456294783;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456294; cv=none;
        d=google.com; s=arc-20160816;
        b=Fm+gVghAyj2Kr0uQr0WktvXTXEcL62bLC2qnyrZQGmYEiLZT8pXt2JMH6ItKw7wMF6
         cimJj/bApJS3LOz7jUk3ezFDDTN2sC5jiqXiUha2UY9H6xJUSx7BKQ08gOyMJNvDZUFv
         BGBk6l/aLJLbXwYf+BkYcXczl3+akKhIbPJd8ACUoo/KmDd2P72tUxSIC7vCHSpEAzFk
         dYA4/2ezQ7903N7SGl5ud1P8NpHVsbu3nm61eFaBf1lyrZfbYYbJZ4cBx60xkS0rlJiv
         nBImG70XdvTxU3PRBgL9Q1RXGKM6WU8EN3Y4iaHBVQwWu3kJFV6hZUCNX4BaDdiHooL1
         R0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/OZVbn0AaKpEb+dwQhmkpupzPgUBYXDoFyOvSfKDJOE=;
        b=WvArM+PEGeQqeII0SefpMtCAFgzW1zmWdT7gIwWyeZyQD/M3rgo4SArvgcd4CKdZkE
         UkZmp5z2nCJ39a7W2bd/NWyESNR/g5cxU9HD5kUpTnLflpj/q7cWS4Enu57GJurjad5b
         RXL6cfunvwzfKYDbonNsfBlotXDaDUrpd5NrTUYU7MxuizSffnPanIEhPzxVUlV/8Bi+
         TsPjkHLMk16sT+mHlQ6v8CeRTvTsAL5+wDQ7uyeXYEj3N6ZcY3/8fxzDOxv4caxcVJXy
         OjDiWqMLJVbZ6dowXcKgvbmBVfrG/1FLKFVm39M7M0ltUKg2ts18HG0Fk73nFnRkpVfL
         XCGA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z20si62880edc.1.2019.06.13.13.04.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvpt2CLMzy18;
	Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 7/8] inmates: introduce test.h and test.c
Date: Thu, 13 Jun 2019 22:04:41 +0200
Message-Id: <20190613200442.18984-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
Later, we will also reuse it for the SSE test.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/include/test.h         | 18 ++++++++++++++++++
 inmates/lib/test.c                 | 28 ++++++++++++++++++++++++++++
 inmates/lib/x86/Makefile           |  2 +-
 inmates/tests/x86/mmio-access-32.c | 16 +---------------
 inmates/tests/x86/mmio-access.c    | 16 +---------------
 5 files changed, 49 insertions(+), 31 deletions(-)
 create mode 100644 inmates/lib/include/test.h
 create mode 100644 inmates/lib/test.c

diff --git a/inmates/lib/include/test.h b/inmates/lib/include/test.h
new file mode 100644
index 00000000..49ce152d
--- /dev/null
+++ b/inmates/lib/include/test.h
@@ -0,0 +1,18 @@
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
+#define EXPECT_EQUAL(a, b)     __evaluate(a, b, __LINE__)
+
+extern bool all_passed;
+
+void __evaluate(u64 a, u64 b, int line);
diff --git a/inmates/lib/test.c b/inmates/lib/test.c
new file mode 100644
index 00000000..808e2b4f
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
+void __evaluate(u64 a, u64 b, int line)
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
index a071f82c..c8a56dcf 100644
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
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index f1525bc6..ea07fd32 100644
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
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-8-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
