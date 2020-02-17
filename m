Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVRVHZAKGQEEJIUNGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id B18BE160E23
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:54 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id z15sf8671814wrw.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930654; cv=pass;
        d=google.com; s=arc-20160816;
        b=xaMHiFBIUYr4ILRlam5KdWA06mI45JH2IS70FUi2Fd3gCB7TOJHcyyCLvC3nxVec68
         AR2FONf8ODIR3qLq1GfVJaBYxeK/9TH4DO3354ls20U5AMezGu0oicwtWzngTIch7IKa
         hDGB6+DvAH8tD98LJrH9/vHOfIBjUm8RmgLVpcMhgUYWoFe7aBjTM8zo0eyNraObK4y5
         ryyotC8CcnR5wu/iKb/eXOaF46XZmakVlw0avP/fkdG4YMt1RzxWDEWKIWq/i3d4+TAY
         7uN04cn5MsNZMnn0YZ9JGNj5h3j/3bLGzacpluYAvwSi7WKTKWsRsaoMzuXghobYI0pT
         WYTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=XvHGTQxYiAsddxHvR2m6DGsKTMh4Oy8yK2pO38Kic3s=;
        b=rvCcIEicbJ/+xcVXbtuS+M9A3J/OwJe28tRfEFrzFps7Cv+4SHXwyRRnADIK060heb
         7H47fB6DvOvbaocO1PLMNvSWpr1ehtN3GCFj//IktJ0mC/u/kCkyIyvDSOkLjCT6t7lU
         LxYO8XCckRgid7ZD1jWwbQZ9nEQ4DQdGZ5hpmrz/sJMfRDpOzicbUF/iDgdJeMZXNQ0j
         loQ6cC23SEMi12KcloaDbCS5QAJfMu5VvzJ3xvnUnTiAnqh20jJDKhz2+bOX/l3yO79S
         CKnAs7rRI6RawLwsbtKCtMPTKw33boCyprT56eTwqLPw7SVVu9bIJpiNPm7EGEVYOMd+
         eTqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XvHGTQxYiAsddxHvR2m6DGsKTMh4Oy8yK2pO38Kic3s=;
        b=qOpXiEZxAiERHLPrzjE3HVRBBMgrivdW4RuWxjrnx8V8Y93DcVonOZgxEkkYv/L/kp
         XV2BEa19qPcc+iFRx580NRqOQDJkVvbH7Tta9e8Ig7tlLKnounhRQZyZzRZ/gb43oJdk
         ofWYhi0QOwnyMm7ZBNjGx7u1sA2VmSPpjvvMVp0BtIseQS8JnB/AcUD4pIeaC0QN74Gw
         QKQIcPFstSPMsC8/kcpt+vak+2Yi9do0k08eQanbn/OgM/kFVdUhy1Tk6yR5mR+lmzQu
         L2H4FrkSSMylM33T5l6UhC6XEKXZKavew/h5hDDXous3UwJyeK2kZtW4BWfS6Z9yK58o
         CXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XvHGTQxYiAsddxHvR2m6DGsKTMh4Oy8yK2pO38Kic3s=;
        b=h5rIdZo8aXUwJcCKdFmkTVttSbsL9cGf3Lyo+hMYJTq7gbtck0GpEoUXfgrlcREI63
         4127OW2smvu2d4Lnwncz/uyYmPeSyVwKQH9YjtBUIpKduJU1/I8dTpRyQwxh9rGIlAaF
         as6qD/wy4cyC+0xoCzlg7jnOqiKhO3+fikpqk0LDkBbFR11jJQ54JgC8s4nTUJ78znyj
         pC4vrRYHcZX5lOiDn8M8cmMskfvLsxKKWl0CrUpq30wlmuZ3dd5JwprODhOoXB6d7JG9
         tcM5smJGJg7U+4dSseLFH/olNECcgVthPaw8z4fNd0wjq25b3cJyyw4iykJlATQVimGc
         vueg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYx7yc9+P5YLgyFuzZpkirQaVEcoLyO+MlfN94N+prfbqtJ4lC
	V9fxQjylhZM4u/fPBiuxiG0=
X-Google-Smtp-Source: APXvYqzTCVqB7zxjUCei1ytzu9GbI34NucbWfMcYuEc2gw+RVOTlh8kV01b9T/jShN25pfzgCUdhoA==
X-Received: by 2002:a05:600c:2290:: with SMTP id 16mr21426688wmf.93.1581930654441;
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fac2:: with SMTP id a2ls5171674wrs.4.gmail; Mon, 17 Feb
 2020 01:10:53 -0800 (PST)
X-Received: by 2002:adf:ea48:: with SMTP id j8mr22024270wrn.363.1581930653543;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930653; cv=none;
        d=google.com; s=arc-20160816;
        b=NXxvZsnfjyWiuoYqq82XBtza14oSj2W0jiNJ53RQFUFLApAETuIKBQ/VmH5X3BMFbt
         vLYncv+GF0cBwlAQssPyI35zlc9jGchyibpteMgOXXIILDnUeoR76XpN5B1uu8PZ2TpH
         ALKQcKMFWbfRZE6S6YtYrgvwb+HJVTtuBrsO2u4soYbeZKOalqM7zVLOZkRtIzE17g9R
         pdHWJ8HA+CZ0Yapzw3hN1Q3Kz2J63aVcAW9fSXi9CT5PwSfDihz7O8v+WEOZjq0ZcFH4
         LSSB6JeZwNrq9ocVo8Umde7mdolXHTkOQ3owFJHmsBHV7LPp1ODqu6OukS6BfZpFTbaM
         TDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4kNkc9cWD2OLd0xdUYAiS76GQw8fwXGLwjB8bmVhzUQ=;
        b=fIZWBsVdTyjaQOXi598UIJZAIlZyetONYAfIc9JV3G+/j1l17LlzjyQF1uiZzdk3S5
         FauERKlnqnh/odV/cjxGpEAC4ZH20A0SfGSlM4Wb1LFYUCkza/Z95dVgT2usN3KCqLKJ
         1kRxVoE2bqfGA67Nv3hrcHzkUVjFEMGbpGZE5jbyBGciKasuE2ezYb13igthC7nuRXMH
         UwXNSpIbpUuv2zL2YdHYqFml+0qJUWpYjQhqVuPImm7TY1dC+6MEZ+z4RrEuh3Y5ukHO
         SLsK+LxcaIeneJQi/tCVgWzlzm4teAz142MQ5DiuLBurXo5OGx/o8lgc8TN9LqaRydRy
         IaMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w11si752739wmk.0.2020.02.17.01.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 01H9ArBH027776
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3d020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/6] core: Make set/clear_bit generic and non-atomic
Date: Mon, 17 Feb 2020 10:10:49 +0100
Message-Id: <e2562f696de236219f5fba88f64bbe6fb08c4829.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

No caller of these functions exploit their atomicity, and this should
not change. So, simplify the code by using generic non-atomic versions.

On arm and arm64, some macros are folded in the only remaining user,
test_and_set_bit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/bitops.h   | 65 +++++-------------------------
 hypervisor/arch/arm64/include/asm/bitops.h | 54 ++-----------------------
 hypervisor/arch/x86/include/asm/bitops.h   | 31 --------------
 hypervisor/include/jailhouse/bitops.h      | 12 ++++++
 4 files changed, 25 insertions(+), 137 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index fbdcc817..8b9c9d1f 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -10,58 +10,6 @@
  * the COPYING file in the top-level directory.
  */
 
-#define BITOPT_ALIGN(bits, addr)				\
-	do {							\
-		(addr) = (unsigned long *)((u32)(addr) & ~0x3)	\
-			+ (bits) / BITS_PER_LONG;		\
-		(bits) %= BITS_PER_LONG;			\
-	} while (0)
-
-/* Load the cacheline in exclusive state */
-#define PRELOAD(addr)						\
-	asm volatile (".arch_extension mp\n\t"			\
-		      "pldw %0\n\t"				\
-		      : "+Qo" (*(volatile unsigned long *)addr));
-
-static inline __attribute__((always_inline)) void
-clear_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	unsigned long ret, val;
-
-	BITOPT_ALIGN(nr, addr);
-
-	PRELOAD(addr);
-	do {
-		asm volatile (
-			"ldrex	%1, %2\n\t"
-			"bic	%1, %3\n\t"
-			"strex	%0, %1, %2\n\t"
-			: "=r" (ret), "=r" (val),
-			/* declare clobbering of this address to the compiler */
-			  "+Qo" (*(volatile unsigned long *)addr)
-			: "r" (1 << nr));
-	} while (ret);
-}
-
-static inline __attribute__((always_inline)) void
-set_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	unsigned long ret, val;
-
-	BITOPT_ALIGN(nr, addr);
-
-	PRELOAD(addr);
-	do {
-		asm volatile (
-			"ldrex	%1, %2\n\t"
-			"orr	%1, %3\n\t"
-			"strex	%0, %1, %2\n\t"
-			: "=r" (ret), "=r" (val),
-			  "+Qo" (*(volatile unsigned long *)addr)
-			: "r" (1 << nr));
-	} while (ret);
-}
-
 static inline __attribute__((always_inline)) int
 test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
@@ -73,9 +21,15 @@ static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	unsigned long ret, val, test;
 
-	BITOPT_ALIGN(nr, addr);
+	/* word-align */
+	addr = (unsigned long *)((u32)addr & ~0x3) + nr / BITS_PER_LONG;
+	nr %= BITS_PER_LONG;
 
-	PRELOAD(addr);
+	/* Load the cacheline in exclusive state */
+	asm volatile (
+		".arch_extension mp\n\t"
+		"pldw %0\n\t"
+		: "+Qo" (*(volatile unsigned long *)addr));
 	do {
 		asm volatile (
 			"ldrex	%1, %3\n\t"
@@ -91,7 +45,6 @@ static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
 	return !!(test);
 }
 
-
 /* Count leading zeroes */
 static inline unsigned long clz(unsigned long word)
 {
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index df99402d..004c3b44 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -11,55 +11,6 @@
  * the COPYING file in the top-level directory.
  */
 
-#define BITOPT_ALIGN(bits, addr)				\
-	do {							\
-		(addr) = (unsigned long *)((u64)(addr) & ~0x7)	\
-			+ (bits) / BITS_PER_LONG;		\
-		(bits) %= BITS_PER_LONG;			\
-	} while (0)
-
-static inline __attribute__((always_inline)) void
-clear_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	u32 ret;
-	u64 tmp;
-
-	BITOPT_ALIGN(nr, addr);
-
-	/* AARCH64_TODO: do we need to preload? */
-	do {
-		asm volatile (
-			"ldxr	%2, %1\n\t"
-			"bic	%2, %2, %3\n\t"
-			"stxr	%w0, %2, %1\n\t"
-			: "=r" (ret),
-			  "+Q" (*(volatile unsigned long *)addr),
-			  "=r" (tmp)
-			: "r" (1ul << nr));
-	} while (ret);
-}
-
-static inline __attribute__((always_inline)) void
-set_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	u32 ret;
-	u64 tmp;
-
-	BITOPT_ALIGN(nr, addr);
-
-	/* AARCH64_TODO: do we need to preload? */
-	do {
-		asm volatile (
-			"ldxr	%2, %1\n\t"
-			"orr	%2, %2, %3\n\t"
-			"stxr	%w0, %2, %1\n\t"
-			: "=r" (ret),
-			  "+Q" (*(volatile unsigned long *)addr),
-			  "=r" (tmp)
-			: "r" (1ul << nr));
-	} while (ret);
-}
-
 static inline __attribute__((always_inline)) int
 test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
@@ -72,7 +23,10 @@ static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
 	u32 ret;
 	u64 test, tmp;
 
-	BITOPT_ALIGN(nr, addr);
+	/* word-align */
+	addr = (unsigned long *)((u64)addr & ~0x7) + nr / BITS_PER_LONG;
+	nr %= BITS_PER_LONG;
+
 
 	/* AARCH64_TODO: using Inner Shareable DMB at the moment,
 	 * revisit when we will deal with shareability domains */
diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
index 66fc91ab..12d85fdb 100644
--- a/hypervisor/arch/x86/include/asm/bitops.h
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -23,37 +23,6 @@
 #define BITOP_ADDR(x) "+m" (*(volatile long *) (x))
 #endif
 
-#define CONST_MASK_ADDR(nr, addr)	BITOP_ADDR((void *)(addr) + ((nr)>>3))
-#define CONST_MASK(nr)			(1 << ((nr) & 7))
-
-static inline __attribute__((always_inline)) void
-clear_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	if (__builtin_constant_p(nr)) {
-		asm volatile("lock andb %1,%0"
-			: CONST_MASK_ADDR(nr, addr)
-			: "iq" ((u8)~CONST_MASK(nr)));
-	} else {
-		asm volatile("lock btr %1,%0"
-			: BITOP_ADDR(addr)
-			: "Ir" (nr));
-	}
-}
-
-static inline __attribute__((always_inline)) void
-set_bit(unsigned int nr, volatile unsigned long *addr)
-{
-	if (__builtin_constant_p(nr)) {
-		asm volatile("lock orb %1,%0"
-			: CONST_MASK_ADDR(nr, addr)
-			: "iq" ((u8)CONST_MASK(nr))
-			: "memory");
-	} else {
-		asm volatile("lock bts %1,%0"
-			: BITOP_ADDR(addr) : "Ir" (nr) : "memory");
-	}
-}
-
 static inline __attribute__((always_inline)) int
 constant_test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
diff --git a/hypervisor/include/jailhouse/bitops.h b/hypervisor/include/jailhouse/bitops.h
index 426e51f1..e98381d0 100644
--- a/hypervisor/include/jailhouse/bitops.h
+++ b/hypervisor/include/jailhouse/bitops.h
@@ -16,4 +16,16 @@
 #include <jailhouse/types.h>
 #include <asm/bitops.h>
 
+static inline __attribute__((always_inline)) void
+clear_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	addr[nr / BITS_PER_LONG] &= ~(1UL << (nr % BITS_PER_LONG));
+}
+
+static inline __attribute__((always_inline)) void
+set_bit(unsigned int nr, volatile unsigned long *addr)
+{
+	addr[nr / BITS_PER_LONG] |= 1UL << (nr % BITS_PER_LONG);
+}
+
 #endif /* !_JAILHOUSE_BITOPS_H */
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e2562f696de236219f5fba88f64bbe6fb08c4829.1581930651.git.jan.kiszka%40siemens.com.
