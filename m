Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBU55T6RQMGQEVS3W5HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FC70A0CC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:52 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-3f426d4944fsf13668005e9.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528852; cv=pass;
        d=google.com; s=arc-20160816;
        b=zV/QJnwphHl4NzLnRhyHGSUv7GAbvLel+S5HUuvBQkI5XlGLm7u1kaaoReTiwYG77Y
         duu0SU5zH4NoIvvji2gRYkUH2/GXo8ImdVm+sn19FOJ8uUR20mT3L9xWzACWCdqncfJI
         1q+bQK+GLlruZaSSaN7s250KQ/tJ9P8ykc9lnkRIlz3F99NnNbzcu3T5s9r0hXiC40Z6
         N3xS1C3msdhsaFzNicbyo1uk77DuYbBMdrIT3CSBRRUW/XpZsHgZle6S5pC+0d9VQ531
         d2Q5jGm7DDIStdqIqxcqVzsrLtzTqLK/PjX7pIf/ZeA7dFGfu9Ie2szqjrybgXawLNCZ
         GHMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=v8AP7QIZKZYKbtym44ntBX9KW77aVtg9x2W2QYelkOk=;
        b=GWFq+vKkKX1fl78viz5I2i0lVByaZ2uUh9ZGruXsJixsED969fuNjVh8oNI/qejETk
         dTRzt9507YlLXyEgdhjcCl+A7C6c4MDQ7XgFFpaV4ft0ahnVvp25CYesA0glY2+MQqV3
         qkJ4XXMXqimKyB6pF9pYIxbezGmNlKfYXI3I1z8B9vOfpADFeAaeepVHRP//Fti4kHz7
         ngBgmMee5KG8h8pNWySjEimUzKN7Ti2lJJKL65jGa/LoddYQ5azavc/TDEd1O8ECo7++
         8s/PvTZNqcsza0kfj8vBS/qqtLqRFmcbN1UVhweBcmfwiRmHgKL56zE3+GOiiXgyE5sj
         tqiA==
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
        bh=v8AP7QIZKZYKbtym44ntBX9KW77aVtg9x2W2QYelkOk=;
        b=YKKwA9457CcKmZyUNxpKJoEk/a2lywLjM3Vd3nW2wflTJRs0sn6GWnSAJ8EslIRWUp
         bR570YBMnz1uNHgw5sXi0h6waTu5Ty0Zynf9+TS7AZr2dRXBJu1RHfbabQkmSe/La6/b
         bYGL7E/93D/N30zd8OKqA9j4yvLijVrrhreo9s2wgCV0B5eQwtR4/Iumt9f59iwafgPe
         VP0OtH6PEZ+hp3RW27om2mkD8TD7CeLvz/fcRRFD5NBpzCTXTEgoqMw+M/kGSNebt2Y6
         Y3tWhzsEWANuaEvPsapP0x8y18H+t0DfwsPxNMOc17pOygixptTFBibHhJGUx0ltRfG+
         mB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528852; x=1687120852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8AP7QIZKZYKbtym44ntBX9KW77aVtg9x2W2QYelkOk=;
        b=Hf3WAXB07zxyeQhaRgj141AwGdEltyvzK18TFwcV2pPOUfQgH1adwOiYXE89KI210o
         Xok49f/GswkV4AFwuoxufW5CFBbHEglDOlD5VLjReGmuVgq2WLNkEB2kWgqFnyvJTNyL
         3MGx3kgcSkaB4oQZjrpI0ORru82Rn1mR8QJF7mi3Bp3/FVp/EdmKLGSbZwymWZd1yp2Y
         P7fWPmEVfsMp8dHyOYdgs29R5yag5aEdW2q8jPlvVjpll7m/5I7ik27cnMYd9AIbK8Rn
         l9oFlCmhiFA/8HJ2MQTcHJH+rnO25TvVJhBSg/qZpUAi4ZmIbtMNfsyQLos7AzvtqOGg
         kOOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzIqGRO/YlsRGGcEXk3xyOk767uHE+E6L5Oh1CKZ5grJ99GL8b8
	TNB7qS+LtPDSzsI58BE8gwE=
X-Google-Smtp-Source: ACHHUZ6fF3y4cNmuW3o48awWWOCf7nOG8JtqEkQdXy1wIPcIBYR3UA44b/mDk21NIJO0QADcWvdMZQ==
X-Received: by 2002:a05:600c:217:b0:3f1:72f2:25c6 with SMTP id 23-20020a05600c021700b003f172f225c6mr497506wmi.5.1684528852129;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b0a:b0:3f1:6946:24dd with SMTP id
 m10-20020a05600c3b0a00b003f1694624ddls1877399wms.0.-pod-prod-09-eu; Fri, 19
 May 2023 13:40:50 -0700 (PDT)
X-Received: by 2002:a7b:cb90:0:b0:3f3:1cb7:b2a6 with SMTP id m16-20020a7bcb90000000b003f31cb7b2a6mr2172699wmi.6.1684528850272;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528850; cv=none;
        d=google.com; s=arc-20160816;
        b=Htx8SFG5Yd/yEK3kNMp6EYC/15++THA1oRoPeSlQjJKkc3ywaYxDyR1KcoPtUJYFUp
         tReB0IyrMD9z+uMybSJYpbZ2rYihueQwP+YEDrGt9WkS8TKdKV+UgpAnrf96XxIUam3B
         fUEKgEr+SvqiroWiNL+iTIMtvcGttkZY6nVmbX6oLYs4PXZE3USLry/4LbD3EbT0CU7P
         Pypwxz7LgKIFCt0k5ezjSo4dHme97gZvfmZZ1fuzcAji73T8dW7sIYRzTNcf3em9qcTC
         NUFj0Jnx9mbvFC2iU87TT0D0z7T1aW7ETlXeySVLTPqbZcnNEsoazRumTrzdvSNf02Tm
         XgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vWkw+xTk7OjB8zybeBjtrfnCsNSnqr2oTOR/PDyCpTA=;
        b=v3+7EEXMK3s//3ZbsmjVP1bAp2TUuGtBqR9E/iPDgN/UHysdi4hiKGQpIOnbq+9lj6
         ojd+UNaetWzJ266OjjDYk9V6Fr9dFlwLLQKChUFCVrooE/nf7TnwDASwpai6uzmdgHPL
         zQoy8ob0dbw4NQokrsnntdFXvudvGWJx593X5Sz+FMOwUf7WD3SMcKpOf4sSk4ZMOSJq
         0KhhlJOMrRZf7XN1bKQ441qp5focFUDZDGSs5PnbEuUj/719K8ZmteouMv2noSQDquyE
         m+O7Gw8r1UO19Tt9FLbi1lLFZEY9QjmTntK9egxOWKOa9gGuuuwgP7CyQSGE3hS5+dy6
         HQwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bo2-20020a056000068200b003062fa1b7a0si728wrb.2.2023.05.19.13.40.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdY6NNvzxr0;
	Fri, 19 May 2023 22:40:49 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 28/73] core: riscv: Define percpu fields
Date: Fri, 19 May 2023 22:39:48 +0200
Message-Id: <20230519204033.643200-29-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CP_URI_IN_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
 __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

Nothing special, but two important things: the ipi_cause and the hsm
field.

There's only one single IPI, and we can't differentiate between
different IPI causes. That makes things hard: if an IPI arrives at a
HART, we don't know if it is a management IPI or if the IPI is for our
guest. Hence, store the cause of the ipi for a CPU in the public per CPU
fields.

Simple protocol:
- The sender must hold the receiver's control lock
- The sender must wait until ipi_cause is IPI_CAUSE_NONE.
- The sender must set the cause before sending the IPI.
- The receiver must clear the cause before after finishing the IPI

HSM stands for "HART State Management". Refer to
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#hart-state-management-extension-eid-0x48534d-hsm

We will support HSM for CPU On/Offlining.

For Onlining CPU, we need some user-provided data, which is stored in
the hsm field. Besides that, the state of the hart is stored in
hart_state.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/percpu.h | 36 ++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index fce6c052..f57e6d57 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -2,22 +2,46 @@
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
  */
 
-// this shouldn't be here
 #include <asm/processor.h>
+#include <asm/spinlock.h>
 
-#define STACK_SIZE			PAGE_SIZE
+#define STACK_SIZE	(PAGE_SIZE << 2)
+
+enum sbi_hart_state {
+	STARTED		= 0,
+	STOPPED		= 1,
+	START_PENDING	= 2,
+	STOP_PENDING	= 3,
+	SUSPENDED	= 4,
+	SUSPEND_PENDING = 5,
+	RESUME_PENDING	= 6,
+};
 
 #define ARCH_PUBLIC_PERCPU_FIELDS					\
+	unsigned long phys_id;						\
+	enum {								\
+		IPI_CAUSE_NONE,						\
+		IPI_CAUSE_GUEST,					\
+		IPI_CAUSE_MGMT,						\
+	} ipi_cause;							\
 	spinlock_t control_lock;					\
-	;
+	struct {							\
+		enum sbi_hart_state state;				\
+		unsigned long start_addr;				\
+		unsigned long opaque;					\
+	} hsm;								\
+	bool wait_for_power_on;						\
+	bool reset;							\
+	bool park;
 
-#define ARCH_PERCPU_FIELDS						\
-	;
+#define ARCH_PERCPU_FIELDS
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-29-ralf.ramsauer%40oth-regensburg.de.
