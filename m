Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZHN5HTQKGQEYSH7TJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2F38D75
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 16:38:29 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e6sf955668wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2019 07:38:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559918309; cv=pass;
        d=google.com; s=arc-20160816;
        b=RMxVQd6/W4MpReXJOfzmvOnVG9Q+6r4D/678hXxofO1Y++jaRpfNx6g6zgI/pSXrJe
         jThtsMCt7CZM54orATV0qnkkIM+RPy+w9/PuZB7a3n0/g3aJFeGdTUlJBmThsVUFtPX0
         xgqHvPnnOwl6DWtDsdpqbVh7IuhFJXOyzUP9iJDUgzjGihFipAZblatPVJR15X5+MC+9
         C+2Y3nFyWNeHjoac+R3VmAxSZKRuPvkheZ7m0ruAQr21nII/lXaSH4iAYIP/D7SJAOFV
         LzQBeBqSeE+aZTp9CLPqOW3GtYNLrt+yP3dBRN59x0cH1HQZLl9DTeohjYf277dKtWvg
         EmWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Vj0R+QfyiBYKW6MARU1LwdePQYTLXVGpIp+b2xj3Lfg=;
        b=U3PqD5NztU9iPVBh64gi58CFz8eyejDUkSPX8frETx5tDWUvinyxUpM41eE+5hK0sP
         NMvQiNg9MIJLpnT6RF6aqKkmQt2Mbuho4Z8YfGqHKoISQiKuOULEa2q7OwSM59pTtwIa
         QHtdwJiafIsKdchQSbOP351MQTkSj3jadcWDlXLBB5DH8a+zY1ehTQIiyV3R1Zw2UmUT
         06qDd/q2ze0h2Fe6tWVBQQBn+Yo5pF3q8ktyhhGx51Z1ivoDMK6PF59hEfBBWAZrpipZ
         6drhv3j5c9GbWFIFP0d2nvE9qn2dm/Njd6yzGtHMCDR/cu/YCF3sxKKZ8CxvVnk2Cmpf
         WFpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vj0R+QfyiBYKW6MARU1LwdePQYTLXVGpIp+b2xj3Lfg=;
        b=XuTMW066YBPUUh+M54Zp+uvgBzPkjmBALu0cPXHJXWuGMcJd/DYK6N33N660UtFrhY
         KSd3+dZgTqPnsrz5+/aOeR3CHLyX21FjjiUCZNFRCl7hg/9BIv1zuEvjuBmxJ+kmYzPL
         7hsMROoWryYLjCT27TI+q2R2u3tfSUg6JAwK9gJVoKnLOoAcQ0WN+P5puXcz1IjK3HC7
         lvpFpg6bX+iik5q4X3F0olBfPyM7/4oBz76t7NsHYmyZuG3MjaEiuCsnBM75Q3vOhApU
         E0dnPcMDXMKY4EYQAO+nS6Qs40GrZYKUyW7qKoBbsZEXLPzmJnJLzkefhPVQo4IUPLXh
         X7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Vj0R+QfyiBYKW6MARU1LwdePQYTLXVGpIp+b2xj3Lfg=;
        b=M/mDGwHaOZRyC4H7GGSLnO+yiMaYI4yyQQU/iy6nRzCfawCV5RFwMZ9W3lSpHPqjhs
         fTyJZVcqOA3wBZYDXatT+vTvLkTTeVSlWec2PxdWaDi3ix7eX0WlK1MOh+oKf2Aj24Ak
         mrBzlnUguZtM1gpogNW9fxnXmUAmYlU9wIGBCPoyQyYT/3F/prjFruzFajk4Rtsqj4Ps
         1EMCSdDzjpAVQwt6PFRHMnBfuapAZvfE3WZI9o3+2AOkBkHkJKJU2unjbj/ESMSHiTr3
         8O+S2k2fEcanqS+5eAuIH8p/IZILlpl5txPCK9OpdIFd5dDsHMY54J3qsR2y1zoS30lu
         GoWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWJTFVYuIm7qJ7cqKt2Sp+cpyf2oekv+7e3yCh+JQMxDkcPUGIv
	VUG1CL5y5sl85vsPzEp5w+8=
X-Google-Smtp-Source: APXvYqz5mSO75yfS1PtEfqG3pRjS6UtaLPq5eVKsCHHfW71c8G1dGwKrHrM8rkysshBJPbx/YL6iBQ==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr4850520wrn.258.1559918309118;
        Fri, 07 Jun 2019 07:38:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f505:: with SMTP id t5ls2831620wmh.0.canary-gmail; Fri,
 07 Jun 2019 07:38:28 -0700 (PDT)
X-Received: by 2002:a1c:345:: with SMTP id 66mr2642590wmd.8.1559918308521;
        Fri, 07 Jun 2019 07:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559918308; cv=none;
        d=google.com; s=arc-20160816;
        b=xtAlrAzjXsqG9QuGcw/BoP6B71wwzLJnxFsBt78I4WawALy1jCQe4MFQUlv/xDeX05
         P4qbaGsEKQKXiBIniLwc8ugZvM3BaImAoaJzNPdz4YTgpBVZPcHT6lnzFZJmBAVhmkvQ
         K4NcdnvBVyqfyNx9s0LfmFc6Mizk1Jo0bAhRzsJmXBsIZB3Om/KGkvfhlMeKj50D7x+X
         YUlgm8w69l0cDKcaY4EFYn1LjCUQ8ecXme7XQK/M4YF07aCVPn7bXo1bJmWoMPuGvexm
         TgyO8Rle4kAV104QOpCRoJJpRTyuI9ClnEzv+V6RM8lQZ5WwIsI4H9DWzXOc2bqSMYNz
         r0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=MjPx7eyqAvF9Rj6+y/83EvEQg7sZykQvIjVgXR0fH5A=;
        b=TN4LtA+2P+8maTh9b5Rl3jJLCDqP1ab8hl0KWDc0ZP2Bu1nW09RsekHNokgTPwNI0z
         TI1+OSG7kydkUY9GuWM0x3okQ0+axswo6KMACHhQ89sJk6X1rjJFlfoeF1RvyEvmA2JQ
         uGfjRghWa0mNEH7NU8Qi9LtiLowRnjpAVi7qghJi8UmyGk0UZUGuvlf778+4PmAlV5F4
         x5RKGqFFASqAtX3ZgOyc28udE6vI5TjtbcdNrT9/D5xeqJPRKPkwDL/RPhCi6FvIi/3e
         8aqSw18eilbZAMv5GNh7j/moQk21XPuXxbYzOX8a5HmCsCW7604IhzvAjA3Q6/XJ/Hm4
         aSjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id b9si117219wrj.2.2019.06.07.07.38.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 07:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45L4rz72Xjzy9v;
	Fri,  7 Jun 2019 16:38:27 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Henning Schild <henning.schild@siemens.com>
Subject: [PATCH] inmates: x86: mmio: fix data width of test
Date: Fri,  7 Jun 2019 16:38:25 +0200
Message-Id: <20190607143825.26120-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.7.143017, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1400_1499 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_STORAGE_LIMIT2 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

The sequence 67 48 a1 f8 1f 10 00 is "addr32 mov 0x101ff8, %rax".

In fact, data is accessed 64-bit wide, and not 32-bit wide as the
comment stated, and as the comparison expected.

0x67 only restricts the absolute address operand, and not the data
width.

Let's also use the mnemonic instead of the binary representation.

Cc: Henning Schild <henning.schild@siemens.com>
Fixes: 23f745cbe19089d ("x86: mmio: Skip over address size prefix found in x32 code")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Puh, I hope that this is it with the MMIO stuff...

 inmates/tests/x86/mmio-access.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index 3af0db9b..a17455b0 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -110,10 +110,10 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg64, (u32)pattern);
 
 	reg64 = 0ULL;
-	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
-	asm volatile(".byte 0x67, 0x48, 0xa1, 0xf8, 0x1f, 0x10, 0x00"
+	/* MEM_TO_AX (a1), 64-bit data, 32-bit address, AD SZ override prefix */
+	asm volatile("addr32 mov 0x101ff8, %%rax"
 		: "=a" (reg64) : "a" (0));
-	EXPECT_EQUAL((u32)reg64, (u32)pattern);
+	EXPECT_EQUAL(reg64, pattern);
 
 	printk("MMIO read test %s\n\n", all_passed ? "passed" : "FAILED");
 
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190607143825.26120-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
