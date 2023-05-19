Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBU55T6RQMGQEVS3W5HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576F70A0CF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2af1ed9514bsf10949131fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528853; cv=pass;
        d=google.com; s=arc-20160816;
        b=K8rM4JwrH22dAvkbq2amTLyAd4hma2F9daGRzm8EKpgcDMAjn3qn6OTSCLT5xBrTti
         LD+CLgiaAjoihdTTgtiUjwUG3HMeNd0H1qdGzmosbiHdQEGfk4bZ5AHAKkgv8IUB8jWj
         rSsjAnqbbTHD9EOwVa+fImPD+S3KM/5W4qpdA/6rq2lnUlcBbNV2AZQeivvYUT3KPMb0
         NUSIfmm2B8TxQk07VkfMS7eWM/mvAZlP588wDaJTj4P4kb1a3XTysfBne+ZCzF5pO5eb
         i1qI8ZE8p1E5JCXceojO+uOxYtDpCMU//jbwxqkHLjH9lJT/JEghemZJ2ekc8siVxDSi
         Obyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pvEhcIuOw7cnrpg7+n3k6hYmKQweTFxM7pWJ2dgAVrg=;
        b=BI8W68ebyoBVUHmgwqEEwsl3r5uE1zWwk3m4Ge9UDcClkc3TUseOfKyPtJOGd7hZPW
         BOXWys1gAX0nro8baP2KsLuVffTU29xV/gORucW/oBy4tt/2ggvw6/ZUha58+TMLvbwj
         5Arxq6oaXXlri9pej1uLlWuZOO3n4SiHinjb1HRofmNPAw1N04eI6QTCNeS4Pt+tvf3t
         LCI5cmgGgQE7wtPez/ih3wKVPYjjygwpYDmLgujIL31iU/Lb5FgGwvGoGcU34DtwzJ1x
         rGa5RZs2Y9K/PJrJ2n+NfG6/rObNhWXoRg+nKxniKue7+Bo9ZSEv8BdrCxX88zsQnBTo
         JKAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvEhcIuOw7cnrpg7+n3k6hYmKQweTFxM7pWJ2dgAVrg=;
        b=oWeghRkaUHrPfOz8n7B5Q0K+8jXyhGNERjPDuH4xBbG5lZsfRSRi70+zd/+vrgRZM/
         VLoHG3AtrTwoMfmlnZhOmCJIcmB4yn4ZnjkRo3kDWEIizGKkd43DoCUPaEK6zR//8U17
         quWRZq7UsvMETPAZ/cvlxGWOjFLERgI7Rz7v+X0Q3z5rp7YdREVheRgiDhSQiaga/VxF
         RwnqobYasUQiU30CcfyjeUAl3DpHND7KNWL6YHVM1P/a4D0Mh5+BBNr/EJIBe+KMQmAY
         oAl1ipbfcGlhjWpKQgzQ/EPPvbzDZoO1iVdl8kOycl7CN0Vu+LG9iLJ+nXalDwE+huNs
         Q3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvEhcIuOw7cnrpg7+n3k6hYmKQweTFxM7pWJ2dgAVrg=;
        b=FtK38/l3bTikPYJH6bdXFe840ru6uGZ5MqUXrxGM/e2yAD3wAWZilXWs2FaTWtOE6P
         oE69hjMwY1559NG8+12V3JsfkIop4KTwsf0POC+wchpq0GAnBWdJ2RrseYCX47LAsNO+
         y6zDyhV8Zt9ta0S5RJtKO9bZus93U8tO9UCx9xUW3pRKT4CuTBLdgT8922hIyFBuNUBg
         ceyaSjzNlhA+KD/xy588xZDY5CB5NX9ilCKLsVmc9SV1idueQm0MA/Hvgvg6ZuQFuHWm
         EJAPW7QxW/lJFZqx8K65n1wzH2/oM/V9nNNzeRdpzP22suYbWaqOztJZ+yWgzGy5GJ7i
         rOfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwl4Bx+OtHysiOpi4L+1jLewfyT2UDX2QYkNOjJ9/MQVMisC6YA
	Qm9win0tXRNX6kkendi92e0=
X-Google-Smtp-Source: ACHHUZ7adKsqHyVOUch/yKCRyxVE1cl1sYJ7guWWCDHXPn7pjp4Uk0+z4JvOG4QH02AgLzuCZK0M9w==
X-Received: by 2002:a05:651c:231:b0:2ad:9a87:ed46 with SMTP id z17-20020a05651c023100b002ad9a87ed46mr797219ljn.0.1684528852456;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:54b:b0:2af:5db:ad4d with SMTP id
 q11-20020a05651c054b00b002af05dbad4dls368311ljp.1.-pod-prod-00-eu; Fri, 19
 May 2023 13:40:50 -0700 (PDT)
X-Received: by 2002:a2e:b04d:0:b0:2af:1c6a:43a5 with SMTP id d13-20020a2eb04d000000b002af1c6a43a5mr1048174ljl.5.1684528850413;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528850; cv=none;
        d=google.com; s=arc-20160816;
        b=dtznBjA0kQI3nNMiYC19ZoqgFGQFa81hmJgMgvL4wc/NcINyzU5gT7xus9BlAoXjyI
         50qjJ2g71Vnx3rgs7CPoSXG1re79tBRFuedHKZ26quTQx67ZbHVM8ZVpQp4XIddFLQHL
         y9yQriOp0dzk6UQHwaWy97EUkaBLVjyAuLzIj3THTWOCqgW0SwJPXl4BD8t7O4FVie9o
         SdaXHP1Frfd5M2nWEJEW2rIewBYZUanNH89tBqTfp7v8/kVCaGV8GCIeiQLY90zcM1n0
         5QafC4SOA6Gp9lY7Ckda3vrlNxkk4xeDFBHfAqd1Y7Pxb2GWzWBqEg68VKHEcJ6tTL7M
         iLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IaB6Fd4+y6lE7itMsVlChTMOcaOhs1aslA16ZbxQFcA=;
        b=u3B9Vwdin3QtFMqM9V8sgA3h9dKKgp31DLmslkXEILwUYyismoe/RjNOP5ycz6F26B
         hAVjNWyMwZ0kXhg4yUKGomtvIMxTGW22Bvzbd+GU3ueysAXSuAR7o5xEvap3CjEzx4yh
         tnyZhknyNJxBBzL0dtjhbnSk9p5WOq2DvZmqh1/jJ8sr6qxAHQSR7wVjfDI+SRb7GsyU
         4TWrgylpH9kSvxAFoGr2as3claCHd/r7b26ZY0cLXw1xKB8bkWzJ7+y7BLLGLuuUX1PG
         hpslI5DVCJO09nnyk93KeLfZ09kKgbSRgufO2I3rIyOL3EPiJfqFj5f1eaae38lWTeMS
         J9Aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p5-20020a056512234500b004f175e991fasi8304lfu.13.2023.05.19.13.40.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdY4hNhzxpk;
	Fri, 19 May 2023 22:40:49 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 27/73] core: riscv: add processor.h
Date: Fri, 19 May 2023 22:39:47 +0200
Message-Id: <20230519204033.643200-28-ralf.ramsauer@oth-regensburg.de>
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

Add processor.h. We have 32x 64-Bit registers, x0-x32. x0 is the zero
register. In our case, let's place the program counter at its location.

In cpu_relax, simply do a dummy division, like Linux does. Though there
is a pause instruction in the Zihintpause extensions available, we would
have (a) to discover it and (b) statically patch the instruction to the
routine. Simply don't use it for those reasons...

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since RFC v1: use div for cpu_relax()]
[since RFC v2: add interrupt control routines]
---
 hypervisor/arch/riscv/include/asm/processor.h | 71 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/processor.h b/hypervisor/arch/riscv/include/asm/processor.h
index 8d4b1c60..ed0d9a36 100644
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
@@ -14,20 +16,85 @@
 #define _JAILHOUSE_ASM_PROCESSOR_H
 
 #include <jailhouse/types.h>
+#include <asm/csr64.h>
 
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
+}
+
+static inline void guest_inject_ext(void)
+{
+	csr_set(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline void guest_clear_ext(void)
+{
+	csr_clear(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline void ext_disable(void)
+{
+	csr_clear(sie, IE_EIE);
+}
+
+static inline void ext_enable(void)
+{
+	csr_set(sie, IE_EIE);
 }
 
 #endif /* !_JAILHOUSE_ASM_PROCESSOR_H */
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-28-ralf.ramsauer%40oth-regensburg.de.
