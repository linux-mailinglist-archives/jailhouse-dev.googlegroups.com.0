Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH5RVHZAKGQEASLWEOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DD160E26
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:56 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id i29sf1609948lfc.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930655; cv=pass;
        d=google.com; s=arc-20160816;
        b=LXTAfbgDf3x21prYeT5tfa66Dk5xe7PP6I828pKnB9FXn9/JutHg9JP40q15kgM02O
         hppEsMxz8cVbZaCYl3QK924ri4OojTlPJj+XWJIv3CuSi4hqwEAWXUJCcgPe/QU2kAE4
         rFhy7lg5ZDyuQ2ofR6YSDACIkEMyXHIGVjp/NTMSmozMOJ05EttvH0P6OMJcXJ/8cxcx
         QeTDtydNLB791BWHSOOfgAKY35Skqzy62kU6vCfGa+7c5mz8TfNfIlhcHwpXQrEYuxDB
         zv4XGmPDNNZjfZaFppM9W29U8+OC7+ddnLOIhNkZja1leJtGYQ19elc1MKua3hyCDNK6
         M5Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=oLthnYz9bJGSaAwCWqiuhOzKIOvMSqBV0fFOJp2p3Ek=;
        b=JGWH3gNRGTNrNkNI5gBXeGUoKLSt72mDcFP/8N289kJ14sB42PZoOAk80JahSVx5+l
         pEaet9tMI/zNw53q9E5ZtV+SVOTEOD0wtfAobq7iMydN2C0YDeP4hWBgR35VEOLKj7s2
         J0fJeVFN7eT5GbBC1SShyxnk9Mzxo7Js37FkmWL3DJltEdHeZoGyduWsr+L6mXhu17W1
         WT1iGK+ho4m6nor/wYQGt56YPLOm5JueqyXCYBCjzpjWbEs4/tPEls4yBDQw+PAqyjVG
         dwXNzLGswtVTz5Sc4ZmAh2GZcf1er56UEPEhn3uvqKSvSzKikGoke3j9CW5gh7LDyQWF
         XiEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oLthnYz9bJGSaAwCWqiuhOzKIOvMSqBV0fFOJp2p3Ek=;
        b=Km6FjcW51A4c38SdUtWe9f3Yx2i7emUBTOoZB4pF0bOEVuPCMabaVHOcKEHN0vrZdG
         Yak+2bZHObyKAmresQ9DVINU3MbwuLnUl0mSqtIpItdZtNzTM14oij686rOsdwGO0kIi
         3oXvXqsxLj/5UV2pImC4bnTjkzw7rLTsyVZliQYbY2kmGjm00t1V+yPyWTYsJLHlUPfG
         O3XkISyieBMNhUfkgd+gsMOl2/WcKMC7i7KWy/D2udYJrr+37WwxXYRJSNUaFdc7YGcI
         7rknDtjOZMct2yO/k+/giJ+o8rrFCRoUhVKCXUWOrA8l+I0kwdwQZGxmTtVc4wRRnsRC
         KcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oLthnYz9bJGSaAwCWqiuhOzKIOvMSqBV0fFOJp2p3Ek=;
        b=okzlESlteAmoqqUnczQfkpJwm+T0ofjsgUCNFeakRBesKIaZboWiP9hfBozu1N8DZz
         UbWx+oS8Sc3ad69vnNPGLonCwe4n38BLdGvKldugZ2QBrLlKJSDHL+p2uAjI/U4BDTic
         ho4XNV8OFW5o1cbFuha46sZMZgVcm00g9KCeMxlBGfqBPWd1KNT6oQj2NuzxwPQARGC+
         5M8LFmFksIx6gga/RccYRAkmMopa9AIVwsoh0QqdCajgvpcoyWiDmPtR2SDS0EQEgC5M
         zPoroWILmx+NbXiRr7TB0aQzWnTjRHUXRXBY2SKqkZSw/VLNX5HRLh221li74YvIdNFb
         FXcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWpIkqZQ6nlaK75VBbYdHq7tCBTxqo6jgZ/tiQSuix4pDAJySk4
	K683FdmJ2BzksWulkX3UVQ0=
X-Google-Smtp-Source: APXvYqyWQvdYDdBxTQMrTOToE/GO+u70J9PhcrOJOZ3gt7//rSVV17hv6cTtc3EXeenVYdwj+ADkeA==
X-Received: by 2002:a05:651c:d4:: with SMTP id 20mr9115642ljr.269.1581930655716;
        Mon, 17 Feb 2020 01:10:55 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c507:: with SMTP id w7ls928354lfe.1.gmail; Mon, 17 Feb
 2020 01:10:54 -0800 (PST)
X-Received: by 2002:ac2:5f68:: with SMTP id c8mr7350767lfc.196.1581930654537;
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930654; cv=none;
        d=google.com; s=arc-20160816;
        b=S//wjFY17dBJAxisx44XxTjomFIjpVlICsM7nzfQ/Vu6pQK4nB0petwHrOA0+Da5NB
         h9DBkdsGoW+OMEFM6V47xCcZNT7m+St9LP7h1xRYa7eBYYWfoCaghCoSaXNVkBy+KjMf
         RkXN/vd64Ki+XxWISWszggn+dKQ2t0L62zbNyCiw1YKpigB6NGqAcZCFJkvLkhAeDv1A
         CBEv/onv+1EYRyp/F72WWYRaVEyJsBOAcI7npxf0rnBProF1a+2KWMpvSDuB/8tLe3y3
         hSUvCBaa0SGZp+pzMqsOVt6eeVf9FbljvD+LLEmOLektzqcIRnXWOHqDGTEngfP9u7iK
         6dQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=ogvhgahKCfjda1BUWyz/u+4j9iNiR0yYLjFYhVC+2hE=;
        b=MZuoS3ekb7uuXninu9yc+aUUslFtHyI7m3TbayESd9Kur/wj+cliI3s+vKvhmMDcSO
         FSz1v3M1yuC7Shndgv4Jo5j/QFSpgaynSUJJ1qjk3e0JR9w3DSGeh/6d+Gkek5TtbshH
         lPFq922QCT2j2VPrAbpQa2o2Or8hYTNcLbNkkSHORZc6VnsqlVbpOjum04s4f27S6QcJ
         +unFHy2o1HtZAeatKo4Cposp1G0QNuWv3emZibsRfQx4Lmb74EDPdAgCXRNmBJYANQpY
         QkvcmeYAJ2c/6mgHBhT+KV8iS7WANtN4oRbgcpE3muiUAXNQNmIfZuk8N1QN9ldaO1YY
         vH/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x5si727827ljh.5.2020.02.17.01.10.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 01H9AroI013211
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3f020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/6] arm, arm64: Factor out common bitops.h
Date: Mon, 17 Feb 2020 10:10:51 +0100
Message-Id: <ca7123a5c58d6e698c5349f29dfbac9a44e5e459.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Most parts are shared, so no point in duplicating them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/{arm => arm-common}/include/asm/bitops.h  | 31 ++-------------------
 hypervisor/arch/arm/include/asm/bitops.h           | 32 +++-------------------
 hypervisor/arch/arm64/include/asm/bitops.h         | 31 ++-------------------
 3 files changed, 9 insertions(+), 85 deletions(-)
 copy hypervisor/arch/{arm => arm-common}/include/asm/bitops.h (59%)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
similarity index 59%
copy from hypervisor/arch/arm/include/asm/bitops.h
copy to hypervisor/arch/arm-common/include/asm/bitops.h
index a0c4e9dd..808c9a0f 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm-common/include/asm/bitops.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2013-2020
+ * Copyright (c) ARM Limited, 2014
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -17,38 +19,11 @@ test_bit(unsigned int nr, const volatile unsigned long *addr)
 		(addr[nr / BITS_PER_LONG])) != 0;
 }
 
-static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
-{
-	unsigned long ret, val, test;
-
-	/* word-align */
-	addr = (unsigned long *)((u32)addr & ~0x3) + nr / BITS_PER_LONG;
-	nr %= BITS_PER_LONG;
-
-	/* Load the cacheline in exclusive state */
-	asm volatile (
-		".arch_extension mp\n\t"
-		"pldw %0\n\t"
-		: "+Qo" (*(volatile unsigned long *)addr));
-	do {
-		asm volatile (
-			"ldrex	%1, %3\n\t"
-			"ands	%2, %1, %4\n\t"
-			"it	eq\n\t"
-			"orreq	%1, %4\n\t"
-			"strex	%0, %1, %3\n\t"
-			: "=r" (ret), "=r" (val), "=r" (test),
-			  "+Qo" (*(volatile unsigned long *)addr)
-			: "r" (1 << nr));
-	} while (ret);
-
-	return !!(test);
-}
-
 /* Count leading zeroes */
 static inline unsigned long clz(unsigned long word)
 {
 	unsigned long val;
+
 	asm volatile ("clz %0, %1" : "=r" (val) : "r" (word));
 	return val;
 }
diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index a0c4e9dd..67aee781 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -2,20 +2,18 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2013-2020
+ * Copyright (c) ARM Limited, 2014
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-static inline __attribute__((always_inline)) int
-test_bit(unsigned int nr, const volatile unsigned long *addr)
-{
-	return ((1UL << (nr % BITS_PER_LONG)) &
-		(addr[nr / BITS_PER_LONG])) != 0;
-}
+/* also include from arm-common */
+#include_next <asm/bitops.h>
 
 static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
@@ -44,25 +42,3 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 
 	return !!(test);
 }
-
-/* Count leading zeroes */
-static inline unsigned long clz(unsigned long word)
-{
-	unsigned long val;
-	asm volatile ("clz %0, %1" : "=r" (val) : "r" (word));
-	return val;
-}
-
-/* Returns the position of the least significant 1, MSB=31, LSB=0*/
-static inline unsigned long ffsl(unsigned long word)
-{
-	if (!word)
-		return 0;
-	asm volatile ("rbit %0, %0" : "+r" (word));
-	return clz(word);
-}
-
-static inline unsigned long ffzl(unsigned long word)
-{
-	return ffsl(~word);
-}
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index 3de2a24d..a4878e0e 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -11,12 +11,8 @@
  * the COPYING file in the top-level directory.
  */
 
-static inline __attribute__((always_inline)) int
-test_bit(unsigned int nr, const volatile unsigned long *addr)
-{
-	return ((1UL << (nr % BITS_PER_LONG)) &
-		(addr[nr / BITS_PER_LONG])) != 0;
-}
+/* also include from arm-common */
+#include_next <asm/bitops.h>
 
 static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
@@ -47,26 +43,3 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 	} while (ret);
 	return !!(test);
 }
-
-/* Count leading zeroes */
-static inline unsigned long clz(unsigned long word)
-{
-	unsigned long val;
-
-	asm volatile ("clz %0, %1" : "=r" (val) : "r" (word));
-	return val;
-}
-
-/* Returns the position of the least significant 1, MSB=63, LSB=0*/
-static inline unsigned long ffsl(unsigned long word)
-{
-	if (!word)
-		return 0;
-	asm volatile ("rbit %0, %0" : "+r" (word));
-	return clz(word);
-}
-
-static inline unsigned long ffzl(unsigned long word)
-{
-	return ffsl(~word);
-}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca7123a5c58d6e698c5349f29dfbac9a44e5e459.1581930651.git.jan.kiszka%40siemens.com.
