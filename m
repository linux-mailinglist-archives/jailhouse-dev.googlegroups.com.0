Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXUGRGPQMGQE2M5PPFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A7768D674
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:07 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id o9-20020adfa109000000b002bfc062eaa8sf2036422wro.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772767; cv=pass;
        d=google.com; s=arc-20160816;
        b=EsZNldUiqnuWRMzqglzKNeWTjI+/zZikesfSN4mwxHrMXemfKS2G92B5iWaljAEIMp
         EjcIX9jK/Be4xOHzq78T54UPOpfO754mFC8fZCyGPXTGiGPtjoXOHtGqBRCl6YwwdJgq
         IEj1ErSeCVoQ7Xlq8UFGIQ2Pa0tbGPdovQAW5+/4ayczQlvLboC7BOqP3PmFcmGAEAMF
         58efB44Iu8DW7gMn2YRABEE4jTGmk0IH8pF17uz1hy7d9h/dzFUIlzU5H1MSGG8lkpy9
         4aC3Wqd2p5je/T1iRqiLAFIwGxwH5yNdmPSLP3fzOGdc4KwQlrGvoTwlrbaktOcZdf4k
         Lwng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Agc0tMBWrOa3e4EHMnL1Y4G9IQzzr8mrb+liISvU/64=;
        b=jvr/nMTKIk/OZfNQ09m0sWDMIpzJOkYtKLt0HzQLIw940TubDa+FZpwEOOVyZ6Ul58
         nKWB0EfK3aWulwsLRSeYsz/tjpSwBCGuwxAUC3rU2BCSmykGqjJ5xgwiSGkz0qIBPSFP
         Ai1rIpUCRVRnybAxh2dA4/45sz7VMURuM2+3fe9YoIwGfmpcx1LsMSQYzamPV9N+73RN
         DVu9ZmsJrVHzrp6pAVsu/2xTi3dmyoMmoPRzJ2NX/o0W+2jH9rVKN3nauXSJJb4r7IgX
         oXs8oxvk89wAypjIsi4JZVbluFT4/eyYQiAthFcjYeCecoEWjRIdPnpt2YJaLo6B0Avt
         lQDw==
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
        bh=Agc0tMBWrOa3e4EHMnL1Y4G9IQzzr8mrb+liISvU/64=;
        b=imMl3Od3eqvHSu+fcYMeETlx+T/e9WXI3tT/7l5lyTAWXB3nf6466PzQ2N6VkztX0/
         UgylcOOZevIQB2OE6VPqtNL1NwEhmMs5IZKasTGZEvP/QmgzrYwGMfcMG3zVKKM0nTXZ
         HQgwWJdPh4FYP6KnBtjcqZ3+MgZLvFK8kwjp6hcHZvwn5X1ResA28GSpZlBYuF7ybpwY
         AkIdXCIR5PwjXP1cR5x1f1sDVWJfSz0hsK2Zj8lUnzMRWjTWUNQAoU2MupjbmNDxLIol
         dZ/e8KGY/POas+Fuwj95W8DIC+CkEJNpMtPVVQA3DqYhYIhm3i2Epm/QdvJehJsShY4X
         qbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agc0tMBWrOa3e4EHMnL1Y4G9IQzzr8mrb+liISvU/64=;
        b=pThJVYGx7xAg+NBGipIhcmQYBj4HH+7cNBy7dv+J8iZ8S/yHm5MwX/OHxGOmi/tlxp
         YD+xK3DeYic1St0gBgq99J5VkfQqsxPmXSZQJMDVA8wJ5r17VNHBKVHn7Q7pfMiT0dLS
         ZSAozwlyINJBn984Xfqc29EfR6bDmePmeRpIBrCrpnnHaHeY+wods8crUdYMo9ZM5R8P
         1qRfaB/jTK8qvzSV9eittBiQ5XmutSIc+f+R4uGWOlprHncQvTwFBKq8LZm2kYa1QS8D
         393di+ELY+xIhEEN3ZA+LIhE9QrlqnSUwYPzgD+Kz6vOAf6ZbsNcetjFZ1vu5niWSPzJ
         socA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWhDiZYXsJp7FKwmGxPQ7m/T/PaKra+euhXOcrZtk+j/pkNHPyc
	mROn9xz5sHKJs38vFMhjfBM=
X-Google-Smtp-Source: AK7set8E1W31JaJ65Jm7aQ0YWgWOtezolNsrjwTLwW+xv/hPe3IYQjRdV/6HeOoL4EdbUDbmWPCV2g==
X-Received: by 2002:a5d:42cf:0:b0:2c3:b47c:a0d3 with SMTP id t15-20020a5d42cf000000b002c3b47ca0d3mr127113wrr.16.1675772767471;
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:18c3:b0:298:bd4a:4dd9 with SMTP id
 w3-20020a05600018c300b00298bd4a4dd9ls21077047wrq.1.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:05 -0800 (PST)
X-Received: by 2002:adf:f44b:0:b0:2bf:e4b2:64a8 with SMTP id f11-20020adff44b000000b002bfe4b264a8mr2667795wrp.42.1675772765779;
        Tue, 07 Feb 2023 04:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772765; cv=none;
        d=google.com; s=arc-20160816;
        b=DZEyA5pR0tm8VvVJwHAIbb26jClZ1m4dhgJT7LSXTO4gu69idVzkYrlamAxycD90Ye
         hMaZsE3RBCZD1nPbtTOtT0IevfD8id1WkoFR/H4Ww1TJ9IojiBVK1GQVYZBYNuod52Rk
         JuYTw8Vd+SGsQID3Umj5YTHMa5J2WWPH7xPDx3xT0RTIkjIGebzQzU9skK6yeiV3OZG5
         QwV4D0cqTUsBpcdS86uHH3A+OGdvX3DDvuF/JB1H38eYNCWiMUS3ukKChc1eE1mEqqOM
         Y39r0doHYkGy7zw1EEgKbGtscjIQ4Rwmi9qcrrbDkvB0mxAWuUqLsN3epT/1VgcZcuv2
         6rpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=73RT8HBzGJ7qfPyirGIcx+f0FBPswdqz0TisuqUjnfc=;
        b=r6ylVBXT6TcpOB/y74oJkOLJRX1vGD2Y1uTYhWGjUIy601uQ9U7kGKY1s6Zv6e8UOL
         won1wp7o9XnQ8JbVFwin4zmDqZV19/jFjY3WBOuAsaQh8CpKlfEFRnVOGESytHKkPcgm
         5IRlfNVf/8ARKYaklgMDxtH26GH8GVfKc/qaCqsk/J2Nnz931mrGTCmVsyRfddcX9ksl
         UfkJ6xeXA7EjEXchwOgVp+3IukJCOFsxIfNW/c9R7ZpLIIKk4d8sxHIqN5LDpprlUoSE
         v7Fx5NhETpNeZLOmMXY+zRP4s8p+OAp6Hw/W3DCsvy3c8m0klkGudzhfPNus9Nz/iVIS
         eirg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bn8-20020a056000060800b002bddc018216si575775wrb.1.2023.02.07.04.26.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RK0WWhzy8J;
	Tue,  7 Feb 2023 13:26:04 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 07/47] core: riscv: add processor.h
Date: Tue,  7 Feb 2023 13:25:03 +0100
Message-Id: <20230207122543.1128638-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
 __URI_NS '
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

Add processor.h. We have 32x 64-Bit registers, x0-x32. x0 is the zero
register. In our case, let's place the program counter at its location.

In cpu_relax, simply do a dummy division, like Linux does. Though there
is a pause instruction in the Zihintpause extensions available, we would
have (a) to discover it and (b) statically patch the instruction to the
routine. Simply don't use it for those reasons...

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since v1: use div for cpu_relax()]
---
 hypervisor/arch/riscv/include/asm/processor.h | 50 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/processor.h b/hypervisor/arch/riscv/include/asm/processor.h
index 8d4b1c60..13c819f0 100644
--- a/hypervisor/arch/riscv/include/asm/processor.h
+++ b/hypervisor/arch/riscv/include/asm/processor.h
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
@@ -16,18 +18,62 @@
 #include <jailhouse/types.h>
 
 union registers {
-};
+	struct {
+		unsigned long pc; /* x0 is zero register, in our case it's PC */
+		unsigned long ra;
+		unsigned long sp;
+		unsigned long gp;
+		unsigned long tp;
+		unsigned long t0;
+		unsigned long t1;
+		unsigned long t2;
+		unsigned long s0;
+		unsigned long s1;
+		unsigned long a0;
+		unsigned long a1;
+		unsigned long a2;
+		unsigned long a3;
+		unsigned long a4;
+		unsigned long a5;
+		unsigned long a6;
+		unsigned long a7;
+		unsigned long s2;
+		unsigned long s3;
+		unsigned long s4;
+		unsigned long s5;
+		unsigned long s6;
+		unsigned long s7;
+		unsigned long s8;
+		unsigned long s9;
+		unsigned long s10;
+		unsigned long s11;
+		unsigned long t3;
+		unsigned long t4;
+		unsigned long t5;
+		unsigned long t6;
+	};
+	struct riscv_raw_registers {
+		unsigned long x[32];
+	} raw;
+} __attribute__ ((__aligned__ (1 << (7 - 3) /* bits/byte */)));
+/* RISC-V ABI requires 128-bit stack alignment */
 
 static inline void cpu_relax(void)
 {
+	int dummy;
+
+	/* In lieu of a halt instruction, induce a long-latency stall. */
+	asm volatile("div %0, %0, zero" : "=r" (dummy));
 }
 
 static inline void memory_barrier(void)
 {
+	asm volatile("fence rw, rw" : : : "memory");
 }
 
 static inline void memory_load_barrier(void)
 {
+	asm volatile("fence r, rw" : : : "memory");
 }
 
 #endif /* !_JAILHOUSE_ASM_PROCESSOR_H */
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-8-ralf.ramsauer%40oth-regensburg.de.
