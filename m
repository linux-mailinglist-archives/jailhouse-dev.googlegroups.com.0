Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXUGRGPQMGQE2M5PPFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06668D676
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:07 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id 17-20020a05651c009100b0028f23beb02bsf3520195ljq.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772767; cv=pass;
        d=google.com; s=arc-20160816;
        b=HLH7AyuYgRC2MxdxI4asipEgCLrAIsmU7PhAbNFUVDIWuAM6EqIYXy0db5ej+qUAA9
         acuRGvxpa43LtxRIOjtjXIzsyR2KbfTKq9AmjPtxBnr9bOFBfX3Ll2fgVAupSx6vnn2S
         2UpDeRzUYAAFFvsWGZ6Vyc7MSgbLJp2E8ghB/tHOrzVRTdtKPSWEDYLreVu/kN4y6lxt
         r6NckRXwVoDi8bdW4i6gMwNRNhfq1JbCoz0NKdKPcUq74E8UWRA9IJ7wBNWpAYLKV0V+
         UAbRKe2G+pXOfVeE82bLjOXhnaacW2UWeMQ9aVfZV8Aw7TFK+x2JFZqlcD6qrPv+ayzd
         mSrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OeOi4WFBYhnMuxIQ78Oiz/HAbeNmaoRvt2aDOJrEQ7Q=;
        b=wKSmCCejPAlhycdJI4XQxpJPbN+vuq9bWGr0Ybg3mepcT3FwNw91At1WNc96Sr6+E3
         lk+NxQjQm8AgnhjvpS4fuwSFLuK4Nai1HjW2cUy4IeVWf9+d/UGHs46lAIk0/fR++LJo
         njZVxxT4mJoCr2N4X0gMKQe8mk6jrdhu4AOym2xAQzyXIl2s/eQ8BkjHyVX6NgFRKfnV
         JL3KcaA+cel2bJdkkuVc4to2GclqAK4Q+jWBLt1cRAz0V121DHGT4pVRW+j3OwnLYxK5
         m1T5HLZ8q1bRoJMtGyzSXGRedBSCDnr13xsAettEJgc3gTnghb28u0WoUrroBIfPAOcj
         c4Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeOi4WFBYhnMuxIQ78Oiz/HAbeNmaoRvt2aDOJrEQ7Q=;
        b=tP31iUOIZss5rAqBPdbMYcZZwkxI6+J8QEl7QywPjBKtRCVNPG3gCd+npvnRLp/Z80
         ZnrLTx9ihNZyqo/Psjnh0wEft7VFQNjLbdVfgTTdjb4S3nS8AWZLQReL5C71wrifU+uD
         R+2fQXySj+lL+qfnMRbny36yCRoAIJACIwE/iT9Va8MB3ca8T2ctzrelXCp7+4WVpoE4
         A1shDhorFCM5DiXhTTiLtTkUBMbpizq+KICBUhoDvjyCJGYNi6mKoI0W5SxQtWm9ItiZ
         wlPSFbtc5uRyDCWZ39RMJttQmm0tC/LpLsYicqQ43wY8lAcvaUzg4/8t/Olab+pqO+LF
         q6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeOi4WFBYhnMuxIQ78Oiz/HAbeNmaoRvt2aDOJrEQ7Q=;
        b=rUGuvXo9n2kp4oKO7i7JV184WJ6VjZTbHgo+avoSHxgnspLWxxcXID6j+MuN8gTaR8
         9fNWVrglnyOTkCUe7gqsqrDAr07ihTIrKZRmQsRYXd0jFnwxoaINewZO3LdneqTEu+Np
         fCsqkYL7+fn+eOLYHKE4PuK35QBVVX+d1DTi0dpmg4Sv9culIUq0ZQSHoN448kfeG3Jt
         h9wW9zEGM1gkJYXK6igBdateXzH7QqTr1aorfeCKX5BqNOo2pgphbnw9n0UHDDuwlT2Q
         KwWzQwFJeB9YOpHcJUPlQ5gRRYn305eAE7OgsG0M3czPYvbI+9t3yyeq675RPKZYm9Le
         LJgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUjzAbzB0fjPaG7AORKwDWf5HqC+m5sG9jZVKcCQy6RU2mzd9io
	V0lOSi93Ced7E4zz6TGKJwA=
X-Google-Smtp-Source: AK7set8Ew0eiab6r+G9BK3b+2+OKH4I/uD7lKapJkPEhQD+deYMLFdzFXsbWXFXvYwGPDW+HfhBWCA==
X-Received: by 2002:ac2:4ad9:0:b0:4c5:f1d2:79c0 with SMTP id m25-20020ac24ad9000000b004c5f1d279c0mr463106lfp.203.1675772767291;
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:82cf:0:b0:293:186a:1056 with SMTP id n15-20020a2e82cf000000b00293186a1056ls254267ljh.10.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:05 -0800 (PST)
X-Received: by 2002:a05:651c:1a21:b0:290:4fad:39ad with SMTP id by33-20020a05651c1a2100b002904fad39admr1047807ljb.40.1675772765412;
        Tue, 07 Feb 2023 04:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772765; cv=none;
        d=google.com; s=arc-20160816;
        b=f1C2O3cZJCwcTnLV00JaRtKwvaMph85rGPsJznstItUOXDRRgahmI3NcLwWjSh74R8
         qogqJeupIsa+bbzpcW5AVf//y2nZItHjTzX7omPVKr0MxrwpJ/Q56b41BK9dzbovpaxN
         4NB/rt+HlDVdXVhXhyBoJ2G+t0ZM4Lz8+HUrLiH9plDqrIEZqgwfTbE8JuGv9w41MELp
         TjwEDxh8oS30A+ZcWmPa0yOrNP7xrIoD/JBnX2SzAhsYmrccJvZRsPV4wUGLKcs8ocVZ
         d6Cn3H5ru8sUKcVuQ5Jpl8HB2qqbJXupRUUJvtusrJVYLqcZWQpNzfWO+fEHMKFUvY1W
         sY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=nAYbxk8t4CqCYdiTJgFJBf5jZBnUY6ShAN0VWojmLw4=;
        b=JrR7+LULhYgXN05WAP6dvk/k3W1gMONgn8mVSeY8c5S3hHfuihuBInFwpPGy6c/v3+
         3JeyiD/z/xs5jm09jkoJ3pbitAR5FrO+z3SqKbT7UPyFBSKDWgF9WVWnzO25FcIQ+HaF
         NqIqxvdbsYbDs55NvnCeKxxyINbDTcjgLVqH5pFg5NbOQ9AVKwFhOFKiIkAtD8Iew7xZ
         fYJtLpviGBuPKKSuUDP48hdQm/he6iabHd+mqeb1FP2s9s2OCTbwhnJEvt22SXpWcrel
         ov+zQPn9yxbgG7pbWYFbqyLki/Au1alshDTZxk7rVfkJ1um9vhKGtrS5TspvrXs37UgR
         iwfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id b12-20020a05651c0b0c00b0028d88cd79a3si646702ljr.8.2023.02.07.04.26.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RJ2Fxyzy6b;
	Tue,  7 Feb 2023 13:26:04 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 06/47] core: riscv: introduce asm/bitops.h
Date: Tue,  7 Feb 2023 13:25:02 +0100
Message-Id: <20230207122543.1128638-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

If the ZBB extension (Basic Bitops) would be available, then we could
use more performant bitop routines. However, we would have to discover
and enable them, which makes things more complicated.

Hence, emulate those routines in C for the moment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since v1: Improve comments]
---
 hypervisor/arch/riscv/include/asm/bitops.h | 54 ++++++++++++++++++----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/bitops.h b/hypervisor/arch/riscv/include/asm/bitops.h
index 4b7e31b1..eb1861b7 100644
--- a/hypervisor/arch/riscv/include/asm/bitops.h
+++ b/hypervisor/arch/riscv/include/asm/bitops.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,25 +15,61 @@
 #ifndef _JAILHOUSE_ASM_BITOPS_H
 #define _JAILHOUSE_ASM_BITOPS_H
 
+/* This routine is shared with arm-common */
 static inline __attribute__((always_inline)) int
 test_bit(unsigned int nr, const volatile unsigned long *addr)
 {
-	return 0;
+	return ((1UL << (nr % BITS_PER_LONG)) &
+		(addr[nr / BITS_PER_LONG])) != 0;
 }
 
-static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline long unsigned atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
-	return 0;
+	unsigned long res, mask;
+
+	mask = 1UL << (nr % BITS_PER_LONG);
+	asm volatile("amoor.w.aqrl %0, %2, %1"
+		     : "=r"(res), "+A"(addr[nr / BITS_PER_LONG])
+		     : "r" (mask)
+		     : "memory");
+
+	return (res & mask) != 0;
 }
 
-static inline unsigned long ffzl(unsigned long word)
+/*
+ * Note: the RISC-V Bit Manipulation standard extension will undoubtedly have
+ * more performant implementations of these routines Returns the position of
+ * the least significant 1, MSB=31, LSB=0.
+ * CAUTION: in contrast to POSIX ffs(), LSB = 0
+ */
+static inline unsigned long ffsl(unsigned long word)
 {
-	return 0;
+	register int result;
+
+	if (!word)
+		return BITS_PER_LONG;
+	result = BITS_PER_LONG - 1;
+
+	word = (word - 1) ^ word;
+	/*
+	 * word now contains 0s followed by n 1s, if
+	 * n - 1 was the least significant set bit
+	 */
+
+	while (0 <= (long) word) {
+		word <<= 1;
+		--result;
+	}
+	return result;
 }
 
-static inline unsigned long ffsl(unsigned long word)
+/*
+ * Returns the position of the least significant 0, MSB=31, LSB=0
+ * CAUTION: in contrast to the POSIX ffs(), LSB = 0
+ */
+static inline unsigned long ffzl (register unsigned long word)
 {
-	return 0;
+	return ffsl(~word);
 }
 
 #endif /* !_JAILHOUSE_ASM_BITOPS_H */
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-7-ralf.ramsauer%40oth-regensburg.de.
