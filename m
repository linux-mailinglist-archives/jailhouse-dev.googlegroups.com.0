Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBW55T6RQMGQELQJNKAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844770A0E6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:00 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 2adb3069b0e04-4edbdd8268bsf2392101e87.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528860; cv=pass;
        d=google.com; s=arc-20160816;
        b=cGCCmc3p4LXPbm0FxqHSzAr74UwtLpxnhdxv1pPb2qSp/C3DVGSpWptirN/3sLjDq8
         buDdaJKCO/j6E3B3b0BVmMLjkwjyz6pGuPinMDRYdFVCXdQMvcMRAb7Nh9n/a3dpYBIZ
         hnkU0g4uIRAzXdEpNnUtZPCpQzEQgpBCYwe/Rt465Uvy9SLF493eia1Lp9zhVX3Kp9Nq
         GSp0lXndjal3hWKHvzYroChhE4ZkEQUCaupjpAWccnlYs9u+kZIxfGJW2ftgVyrBwoR/
         nOJ2AlaJCZZngFmlx4LH0xu26vy8wQbakarpPxN+0BVkZXdjmrftkl0h4X9kaC4ssuOU
         Ie9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MuPHXZ97pDRFxhpc4I87okkHOP9zl8ivD969sX66O3U=;
        b=fsBsb/AR01ylGDJsyTWmngvNvG9qUAl3TjSzcJOj3rWpanpXjVU9tYYIzIjqPGYw/z
         KiO/1zCA6NezqRfaQEc9ktgMsFrjJDdR61C1X3VnTcEjiPkIHMicseGlnA/fHutE4Z5+
         XOIuGdY00YI8dzmF4KClEMGyzW61Fhhl1deYOIFdYb+V0rf+Nph7xacJy7xQx8bYas+E
         nZnIZ1BmECnlM/xKsIvOpTvY/uC6bnTAPrfbBmPpU7vf4I/0wuC4AcJyyqnXancFkzfO
         FFn0q81HOscTZXqjFFxSHlzXr/C7cDcc7Gw1XG99OSU9rPgM3X3t80UyL70OcLXVLpE4
         8rIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuPHXZ97pDRFxhpc4I87okkHOP9zl8ivD969sX66O3U=;
        b=E15q+76Bzn8UAFj+W9xkf2XAQkQUbgiB6FzWbwebdjM2uXyzEA+reVuea5/u9YoZSf
         7dp/LQnap4Ildi79zjijBO+IsAECcaecZ6P7mGEYmOTyDjVyX7p/DxizXSkT+ZwyYCTm
         sa7iPQueLz1TVhYldWlX7hJyqbvPzeZrCpnOj3UsMwK1ixB/31SE2HoHantGTpz9NpqN
         ost85G+7dkst8cdQeJyxcyvx/6wRfCnWdRWU+B/gJ1vbJ6y6ukmL9G0VR7g8FWIeu3hH
         eimOvL5n1ijKXTtP0feEJmxSRTcmPKhvrTrwD4FTkwMS4Af+ynGgMmp8qyiblv27bixB
         BLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuPHXZ97pDRFxhpc4I87okkHOP9zl8ivD969sX66O3U=;
        b=TOHsjAH8PYvJ/zk8bvMMwmYvCYraHogcgobAj0dPT9MXbIEGTw0isvOH7VJdDc0oF6
         4e4KBRPRuvuFTNt7BnPP2rkCdz7NkkmwqNgnHHyxWwCfjq59dSnnebO8BDWU/Ck29JGs
         YeMOI/CNUcLiPv8628flvLa+K2apcjrp3gjXssYuV3tWRMzHsBhF09n2Q49XaN6uEmlS
         Qy91CSbK8HALjXXO5SZ1j/HEqf/jl4XTibt3eRt9NuFrPFIHWPq7S+NCNtjQd+v1zLql
         Es2yMsJchKAxN2J4PwRSYu3IkdDVzxoJPzff4Z9PFHMhynevugmFzvsl0xKa6J0Bsri9
         uRzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyTEBJxuh0sxbhqn/Ap11bci9WfhqNohBPSOSaKrGX9RI3JaI8E
	3Iu7jQKALfTMeNf5UJeHATo=
X-Google-Smtp-Source: ACHHUZ5ue0DThEQEwNqXv9ceSXd7ftvrS+r2T1BP5VP1Wdx5vLmp3mAjE9z9/7XX4iUcERzWhAfe+A==
X-Received: by 2002:ac2:539a:0:b0:4eb:312f:8126 with SMTP id g26-20020ac2539a000000b004eb312f8126mr830749lfh.13.1684528860175;
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:544:b0:2ac:8284:e51 with SMTP id
 q4-20020a05651c054400b002ac82840e51ls717239ljp.1.-pod-prod-07-eu; Fri, 19 May
 2023 13:40:58 -0700 (PDT)
X-Received: by 2002:ac2:57d5:0:b0:4f3:789c:8bcf with SMTP id k21-20020ac257d5000000b004f3789c8bcfmr1109034lfo.4.1684528858217;
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528858; cv=none;
        d=google.com; s=arc-20160816;
        b=FzpaeOkA1vj3c4zR2yY0b+n4j4GIjK2Uyrw2pTBhJ+VI8VUAVx4t9ejBV2C9zJpc3r
         dVeA16VxwlR62kEaJ31MLss3gS0pGgx3MXnq6D6eUgqZcYmpclb0bGKbXl+pUJHwGcBl
         5xp2y+Wsh0Lzeg5C6xKkDE3TPYaYijXYX1lI0zTUImws6QFpsxYUyuJ0cDAKbEeBKOx8
         O7Fgyzm/XAPOqeYrlHgqByFuBNuNWbel+Y/D98qCmkV7MKPL0GfAXpnmfeei/jF1yYkD
         fzW2XGwkEsiIBKvNQQXRCWGmCdowGXoyOdqM+AZelcJc/lWI4WA8c/5cLLcdxMrxXh57
         RGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=p94tHT7/53FSdbJDUtfvU9UtLt1lszYx4HUuX26U4dA=;
        b=YNre18u+Kt+JoY2rP+StG1eySnJAwCFVkk1mb65klqzoge4vHfdPC/jXs9/jIz0DJp
         AoOVWhiw0Ax4GIEHMDNkkw2j1dZuJBcMXDo9Yh8E/c4viMyPxtQRhuStW4lNkori076u
         JnVZKYZMDHs9JQpgnKwigmjp0bEZfgMO1lPZ+QnqKkSI4j76OLH2m/dy65PWabhqeLbD
         fhS/EWM0YALijySTfm9Lo3/01zAzSxlyDUHwz4Tde/6UkURc02ekMbGslP0AhHg5Lwuv
         n/Yf7QG3geuc7pReWN/eLHEPk8HvZr9yGvrC6GCdo6nnDBy4LGc69bM2aVeI3QGLcdsA
         LyMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id i40-20020a0565123e2800b004f3a950560esi11504lfv.7.2023.05.19.13.40.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdj2r99zxpn;
	Fri, 19 May 2023 22:40:57 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 53/73] inmates: riscv: add timer demo
Date: Fri, 19 May 2023 22:40:13 +0200
Message-Id: <20230519204033.643200-54-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
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

Same demo as for other architectures.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/demos/riscv/Makefile       |   3 +-
 inmates/demos/riscv/timer-demo.c   |  57 +++++++++++++++
 inmates/lib/riscv/Makefile         |   2 +-
 inmates/lib/riscv/header.S         |  29 ++++++++
 inmates/lib/riscv/include/inmate.h |  27 +++++++-
 inmates/lib/riscv/inmate.lds.S     |   3 +
 inmates/lib/riscv/irq.c            | 107 +++++++++++++++++++++++++++++
 7 files changed, 225 insertions(+), 3 deletions(-)
 create mode 100644 inmates/demos/riscv/timer-demo.c
 create mode 100644 inmates/lib/riscv/irq.c

diff --git a/inmates/demos/riscv/Makefile b/inmates/demos/riscv/Makefile
index 2f0bac84..e371a29b 100644
--- a/inmates/demos/riscv/Makefile
+++ b/inmates/demos/riscv/Makefile
@@ -12,8 +12,9 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := tiny-demo.bin
+INMATES := tiny-demo.bin timer-demo.bin
 
 tiny-demo-y	:= tiny-demo.o
+timer-demo-y	:= timer-demo.o
 
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/demos/riscv/timer-demo.c b/inmates/demos/riscv/timer-demo.c
new file mode 100644
index 00000000..748219b7
--- /dev/null
+++ b/inmates/demos/riscv/timer-demo.c
@@ -0,0 +1,57 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+
+#include <jailhouse/hypercall.h>
+
+#define TIMEBASE_FREQ	0x989680
+#define TIMER_DELTA	(TIMEBASE_FREQ / 6)
+
+unsigned long timer_next;
+
+static inline u64 timer_ticks_to_ns(u64 ticks)
+{
+	return (1000UL * 1000UL * 1000UL * ticks) / TIMEBASE_FREQ;
+}
+
+unsigned long timer_handler(void)
+{
+	static u64 min_delta = ~0ULL, max_delta = 0;
+	unsigned long delta;
+
+	delta = get_cycles() - timer_next;
+	if (delta < min_delta)
+		min_delta = delta;
+	if (delta > max_delta)
+		max_delta = delta;
+
+	printk("Timer fired, jitter: %6ld ns, min: %6ld ns, max: %6ld ns\n",
+		(long)timer_ticks_to_ns(delta),
+		(long)timer_ticks_to_ns(min_delta),
+		(long)timer_ticks_to_ns(max_delta));
+
+	timer_next += TIMER_DELTA;
+
+	return timer_next;
+}
+
+void inmate_main(void)
+{
+	printk("Initializing the timer...\n");
+	timer_next = get_cycles() + 0x400000;
+	sbi_set_timer(timer_next);
+	timer_enable();
+	enable_irqs();
+
+	halt();
+}
diff --git a/inmates/lib/riscv/Makefile b/inmates/lib/riscv/Makefile
index 9ff57721..3b796dc3 100644
--- a/inmates/lib/riscv/Makefile
+++ b/inmates/lib/riscv/Makefile
@@ -41,6 +41,6 @@ include $(INMATES_LIB)/Makefile.lib
 always-y := lib.a inmate.lds
 
 lib-y := $(common-objs-y)
-lib-y += header.o printk.o setup.o uart.o
+lib-y += header.o irq.o printk.o setup.o uart.o
 
 lib-y += ../cmdline.o ../printk.o ../setup.o ../string.o ../uart-8250.o
diff --git a/inmates/lib/riscv/header.S b/inmates/lib/riscv/header.S
index 3a12f51f..5ddffe79 100644
--- a/inmates/lib/riscv/header.S
+++ b/inmates/lib/riscv/header.S
@@ -36,9 +36,38 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#define STRUCT_REGISTERS_SIZE (32 * 8)
+
+.macro context cmd
+        .irp reg 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, \
+		 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+                \cmd    x\reg, 8*(\reg - 1)(sp)
+        .endr
+.endm
+
 .section ".boot", "ax"
 
 	.globl __reset_entry
 __reset_entry:
 	la	sp, __stack_top
+	addi	sp, sp, -STRUCT_REGISTERS_SIZE
+
+	la	a5 , __ex_stack_top
+	csrw	sscratch, a5
+
+	la	a5, exception_handler
+	csrw	stvec, a5
+
 	j	c_entry
+
+.text
+.align 4
+exception_handler:
+	csrrw	sp, sscratch, sp
+	context	sd
+
+	jal arch_handle_trap
+
+	context	ld
+	csrrw	sp, sscratch, sp
+	sret
diff --git a/inmates/lib/riscv/include/inmate.h b/inmates/lib/riscv/include/inmate.h
index dac9f146..57338d25 100644
--- a/inmates/lib/riscv/include/inmate.h
+++ b/inmates/lib/riscv/include/inmate.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) OTH Regensburg
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
@@ -60,6 +60,9 @@ typedef unsigned long long u64;
 
 #define SR_SIE	0x00000002UL
 
+#define IRQ_S_TIMER	5
+#define IE_TIE		(0x1UL << IRQ_S_TIMER)
+
 #define csr_read(csr)                                           \
 ({                                                              \
 	register unsigned long __v;                             \
@@ -93,11 +96,31 @@ typedef unsigned long long u64;
 			      : "memory");                      \
 })
 
+static inline unsigned long get_cycles(void)
+{
+	return csr_read(time);
+}
+
 static inline void disable_irqs(void)
 {
 	csr_clear(sstatus, SR_SIE);
 }
 
+static inline void enable_irqs(void)
+{
+	csr_set(sstatus, SR_SIE);
+}
+
+static inline void timer_enable(void)
+{
+	csr_set(sie, IE_TIE);
+}
+
+static inline void timer_disable(void)
+{
+	csr_clear(sie, IE_TIE);
+}
+
 static inline void cpu_relax(void)
 {
 	int dummy;
@@ -152,6 +175,8 @@ static inline void mmio_write64(void *address, u64 value)
 	*(volatile u64 *)address = value;
 }
 
+unsigned long timer_handler(void);
+
 #include <inmate_common.h>
 
 #endif /* !_JAILHOUSE_INMATE_H */
diff --git a/inmates/lib/riscv/inmate.lds.S b/inmates/lib/riscv/inmate.lds.S
index cb6e7a76..91bc8f22 100644
--- a/inmates/lib/riscv/inmate.lds.S
+++ b/inmates/lib/riscv/inmate.lds.S
@@ -69,6 +69,9 @@ SECTIONS {
 	. = ALIGN(4096);
 	. = . + 0x1000;
 	__stack_top = .;
+
+	. = . + 0x1000;
+	__ex_stack_top = .;
 }
 
 ENTRY(__reset_entry)
diff --git a/inmates/lib/riscv/irq.c b/inmates/lib/riscv/irq.c
new file mode 100644
index 00000000..8f6d0085
--- /dev/null
+++ b/inmates/lib/riscv/irq.c
@@ -0,0 +1,107 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+
+#define CAUSE_IRQ_FLAG	(1UL << (__riscv_xlen - 1))
+
+void arch_handle_trap(void);
+
+static inline bool is_irq(u64 cause)
+{
+	return !!(cause & CAUSE_IRQ_FLAG);
+}
+
+static inline unsigned long to_irq(unsigned long cause)
+{
+	return cause & ~CAUSE_IRQ_FLAG;
+}
+
+static int handle_irq(unsigned int irq)
+{
+	int err;
+	struct sbiret ret;
+	unsigned long tval;
+
+	switch (irq) {
+		case IRQ_S_TIMER:
+			tval = timer_handler();
+			ret = sbi_set_timer(tval);
+			err = ret.error;
+			break;
+
+		default:
+			err = -1;
+			break;
+	}
+	return err;
+}
+
+/*
+ * Any positive value will reprogramm the timer, -1 will halt the timer.
+ */
+unsigned long __attribute__((weak)) timer_handler(void)
+{
+	return -1;
+}
+
+void arch_handle_trap(void)
+{
+	unsigned long scause = csr_read(scause);
+	int err;
+
+	if (is_irq(scause)) {
+		err = handle_irq(to_irq(scause));
+		goto out;
+	}
+
+	switch (scause) {
+	default:
+		/* We don't have any exception handlers at the moment */
+		printk("Unhandled exception %lu occured.\n", scause);
+		err = -1;
+		break;
+	}
+
+out:
+	if (err) {
+		printk("FATAL INMATE ERROR. HALTED.\n");
+		stop();
+
+	}
+}
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-54-ralf.ramsauer%40oth-regensburg.de.
