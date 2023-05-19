Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBU55T6RQMGQEVS3W5HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7570A0CD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:52 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2aed331e597sf7430131fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528852; cv=pass;
        d=google.com; s=arc-20160816;
        b=VkWcOQdlXVWko7HhWFlbaZHFcLbLDbLZzGiZEqb7JSep7qBI9hTyA0wnNTi3yNRROv
         xHxGEZdm5wH7eCKYlphQumDxlWoImmmTBdov5VKShKiFZYXX2Q0+sfjK+/qylxzATQkO
         k5rR/9zkIq5OD5rF53ZVRZAXw5SEW1qgF2vMMpztZNGJGcwMxlpQH/px/uJA20ELgQwu
         SwjksNfrs0ZBbQBXgw7luG+rL9C9GE4FQG5PFr2T8oRzgeDxftJ/3M7KAn0skRRVt280
         T6V4dbwSVNR4CtVXcQ5TTQCE4xJzbLhmeYqauRsVGVL1FJtXdM+Si2v9TZCKQ2URANuW
         lqig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9u1qB+nTh8fV6GPSp/83sjCSkUxmQU8kO/O96KR6+6U=;
        b=g/Q8NHdT8zf1OO+N82splxV6KF5H4BLULxbRDQhdtdKslzYloyBhZm4WzXM8RJl8G6
         vm0WqUmJNJcmmKKiIF7wl6jUIGyWoez58nT8C1mpE+4YnFJ8SxTtlAPDdHeaoONudUWH
         pM5E2mtiPfG2RCx8aWMfMuW815dqXRkgA/v3zHwBsC4iEICyT8Da19kDHJ++azG6QQIn
         5ZkR9h7sBWgCMMMCbml26d7halcR2nCIhQEYLS2QrASX0nIlaJN2rRJExsOfomobPA4H
         wBv/UmghcmSvWFa4FbUSZdXPD3wpeYb5PXIyROl71oQ/jHS+IdVvGPtFWD1vMNUxQzZB
         sjXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528852; x=1687120852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9u1qB+nTh8fV6GPSp/83sjCSkUxmQU8kO/O96KR6+6U=;
        b=obbR4NTcI7msy1uQE+ZO0M452S9yBU7LPHuz5DAhbc+NyMGBAAgeWc13IFn0pTG8yH
         wMFJVYWrVdZaOPVItmJtsFiFO9+UMm1QKW3ituCwjJpuM51TTbcRLU1AFI4RKTB32fqd
         V+ynRQYTCfMaThM0mlnqHTlyMiOeLc5fRR4a54DM4qRoq+uZNCUnp2+KXhDAhZgeBI35
         Wgndaxygbiti+JopOM8NS/MbcChfyJe5Vfq8bR/UYq0i+utPQOc5eimNDYR0EvKBfwbM
         QLYFkiT1MMx9pgJ0gN28d+/MR1oa2OWzIxSPFQ6yKjwgCSkfoE4OG6rCgIBqmWG5KxOy
         HaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528852; x=1687120852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9u1qB+nTh8fV6GPSp/83sjCSkUxmQU8kO/O96KR6+6U=;
        b=eaqTOQqzTJ1KYw+77mAGLfih0GtU+1dTSNaxO7xNef934xbuZahI2nQQHiX+YqctDK
         PkxZvMN3aDIA650RO6n5kGg4r6v1jqTY2ENgQq+3cLQBVze5JEXRFNtjM7jpwQSNQUYU
         AbjmiFmScdxPmottwvPclNmxPkFphhPz7Mpat9tkbWtdcU1McQLeLSQu4Qqx0Aw32zug
         uxrpqROlseZH25apPxO6cfS34xEb9sN8031Armglf9YRdkyN/T+34MOR0aT46mZorgRa
         omXZbpD8ierQ7wsFL1RhmHO8nla3VT7bcTUHU5MIqK8I8uhOC9F4a86jcpRTwt1z7HNd
         n3rw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwquohoDhZREnk2SkXsA1LncE0kjsGNSRtB0fajXLoYyWNLiH1U
	Zq2POMIC2QB/pKPSruSheOM=
X-Google-Smtp-Source: ACHHUZ78CAZJFn5cdh8PDdjBVrcysoxKlYJqJanc9PWhArLsre8SxF/cN9axa38SMta4CRAUDTO1Yw==
X-Received: by 2002:a2e:be14:0:b0:2a7:6f65:77fe with SMTP id z20-20020a2ebe14000000b002a76f6577femr924424ljq.5.1684528852071;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b889:0:b0:2ae:d6ad:acff with SMTP id r9-20020a2eb889000000b002aed6adacffls397634ljp.1.-pod-prod-04-eu;
 Fri, 19 May 2023 13:40:50 -0700 (PDT)
X-Received: by 2002:ac2:43a4:0:b0:4f2:7b65:baeb with SMTP id t4-20020ac243a4000000b004f27b65baebmr912877lfl.53.1684528850152;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528850; cv=none;
        d=google.com; s=arc-20160816;
        b=K8805EbyDzw1jH2KpXwNTAtdCI+Wnxj1i8xdfku1SooLqmknw+bqMM3EzIhdVZg6Ky
         atsAwNJH6Va4uA+k6aceK0cFNkSVIZ4Fxha0WdZeT8lYjewvb5Af2L4qvICF239c2pnm
         60Wp1dyTY4msQ9hf7Phj4374oSgPgvUbkBCH0sT+ARym+TXOrEM+lvuXnPuo1SmbO1hT
         ecFBGTQ8lmRxrRCuGt6VtE/r0uBw4H/k6kRHULrqi2ZJ18p7/H9SBnCNyF3lDtcFafIp
         j68zKyvG+XbOVOLc0a8sw8jJ2NXLWFUCDDYkS40b7wbnhN15Ovs0S8X/Xlq/I7CNI2c/
         A/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=FtH6FsZMWstZ9noMNQb8Q5gswGdPEq6hqAhWqVVLZXo=;
        b=KohTczNZnPT5R+YH3CrBjowruC/Bnj5NPT+tF7KTgVcfrp10jvxPrLaifkWO2jmupI
         BndWuERMwtpRfOolepSu7701RF5fRIfnNVJ0WzsDTrV/mXkDUTNl7vPGxxWlmKI9QF3/
         z35VRLFCVcwrvr2M6Cm5tn5CQh31Bdq4TfC1lNucZQQx7q4FMqMkXDBwXYbm3ScqpVQ6
         43OGKDZ2g1I/Bo/iKaGhtRKXjYXh/SJ4fXpkhUvKHxel426ebvDccERU0Vv1dj3jTJZa
         +lPOaRvySyK+vjRBUtzOlK+1hUD5/2LEcA+Q0cGmi5aD6EvpYQ3RvUfaIzM1g2JqyVqK
         UmiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f12-20020a0565123b0c00b004f3b0cf753bsi13873lfv.0.2023.05.19.13.40.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdY35k4zxvc;
	Fri, 19 May 2023 22:40:49 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 26/73] core: riscv: introduce asm/bitops.h
Date: Fri, 19 May 2023 22:39:46 +0200
Message-Id: <20230519204033.643200-27-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-27-ralf.ramsauer%40oth-regensburg.de.
