Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM7B42KQMGQE2J3YK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF755BA01
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:24 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id t20-20020a1c7714000000b003a032360873sf6678898wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336564; cv=pass;
        d=google.com; s=arc-20160816;
        b=FshFxVBexWxFSzW/CbKhQRvhyR+2ieav7Ze3RrOG1II7TmYENPIP8s0q2Y++/ZzzOL
         DpbPV7bV8on720po9YhEQVLYWaJMFGuh06NzcrLJMBXH5bq3GoJ49lBeOvOJFujyMIue
         i5boGfiWXhRQ3wgCoWIpqYo1oKqKUr4IgRcbcezLmODNOtMdKPNWaofWfJttKWR58pZB
         tqF2rxtLi8jJilP6tWhk70ife5BVlGkOjcEr3ITxRfX0ZvFtTkaY0UbNyJwmqcm6lmbM
         NR1CF9Faen0x3rO4mZp9+7Xlw/lnUbXU8PbDaD4Dpg3l9XchCYeOnvfg+zI3qxwTHiU9
         w6Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5ZxKRCe2YMYUvsmExCmb4LH5Jxwh0IjbnnPCl75l0YM=;
        b=CUT6sQoKHuUF1qQZ7d51sprm2hCuK9nGpqnous8OKh30D+c06a3xari2G3bPOWcmxb
         AmQrYqt1+oswabhGI6Khb9OexOxouzxqU0tHnbFPluiwdtv/8rlH3eg0mLjW9GRtXwYd
         hSi1GMaBf/d9svcf+U+aOZCwxwHCTlUNaMwt2Oly8TV3MHL318er+SA9RuuwxvV/9MqC
         U5C/9K2DpqeHN8rmwdueFrI6plrdJ5AcdDZRehPuirtUXG9w+m0r4KtJHmlHfs78pFgH
         PyU/+qHpN0mkt4RCfcB3M/HWmbH8c+Hln1riQkqTrj/SlsEaglx0Z/ZzR0nT43JAJP3H
         6R0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Aw6SrPj9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ZxKRCe2YMYUvsmExCmb4LH5Jxwh0IjbnnPCl75l0YM=;
        b=YgGy6B8P3er7J5/eSs+M96VJHPu7dofV6QO3xe24+JZNDOxHV0VWszCOxGpMyRBrPa
         AG4N9L6BTjvNCwoux1sJhvit4xISD+bGTfPGqNGDP8ZSgj52ErGVzAVMX+K8pMf9GB0n
         FHra+ycWyyXCS+ZvrE9VyqoEvuUzOeiRYYfcGDg2sCwByeeNywap9UCrDPeWK9uxcUX2
         siKvnRCRftudZoVrXhfF8CpPr99pjjrG3tUwUPZGpbX63wO3vljPYOuXmX6fiRRB53uN
         HK/8EkjwB99XYqXcaJ5QvfBJnvWCZMeh9Orj2Q9GBwoYEbma742GfyJDD3wFFRUnI92m
         FhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ZxKRCe2YMYUvsmExCmb4LH5Jxwh0IjbnnPCl75l0YM=;
        b=AnlWzsd3SBGW3ZaF8+jjca5Gc8JqIZj6EoZBZzYP7qTu/C3EBsgiedeHvtYyTnUJSe
         Ky07/hwuiIMpUPJA6ZR1bCKdDc1iHMl8eKZLHhrCl+DhG1iiHeyE+EogqoV3PK3hm9kR
         SFanxnm/uIzhTdkE8gz+7RqWv9HPeSHANowc54z5qtWgGg+2Y23r6gbvpLtuzS/W4p87
         QdYwRMMR/Hi4rn8Zr7aRMipC5ckP6NQIGBHCC57rJx8K48DSdNvHuKed0FxMtaen29S5
         CIJuxI2DghIEuPXdZMV6rOa0CD4oa12tQ58WrL03qMkSRP+n6pguumFzuzIBarA0jS00
         t11w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/7zmLfEYRDhEEH1SM0jDkO6Wf41IYCLiLvuhQtO3/UqBoD+ZwE
	ViB3fMUzbN79Kjzh9yQI4LQ=
X-Google-Smtp-Source: AGRyM1sDTBr43Rq4hvo57S0Z30S0G1QOfZ4A2VbpE0jgxEf5SpYthUtEL51nu0UtUiHWDtybIQLS/w==
X-Received: by 2002:adf:e104:0:b0:21b:9938:b07a with SMTP id t4-20020adfe104000000b0021b9938b07amr12317746wrz.682.1656336563932;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6dab:0:b0:212:d9db:a98 with SMTP id u11-20020a5d6dab000000b00212d9db0a98ls26785334wrs.3.gmail;
 Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-Received: by 2002:a5d:6986:0:b0:21b:8a3d:341b with SMTP id g6-20020a5d6986000000b0021b8a3d341bmr13026777wru.196.1656336562609;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336562; cv=none;
        d=google.com; s=arc-20160816;
        b=MJn8k/a+OZhphaO2Js03DDzLEviOya2ankU3NFzAZTwg+zdUi2VyIkmkehWnS+QGjs
         X92Q8n836dG5b569Oj/Frg6E/2DLR3ykgm+r9Uc6d7ZYPFM/rvV9TBy8NcOHRvqtzmTI
         IjVKXFDXND23wxxGVfT1ABBFeDB6ZGKhldJ8vJbisGoL5hluhOfww+zb329/h3e0EqJd
         yrL2N0GFeOFXXp5pNR11HEibE+N8MhrbX/tQZyOq2WccC0okVr+49stVTLgYSmXqNtZH
         RDQl26/z7ivN6EaUGvSWu5D0yU4ptbOl0F/FH4R58ZHOdKUihvhW6iNiotHSK/hGmjP/
         2Hug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BkKL0Qi6qqUda1UcyFVS/jkXKdaFmxHXW+WoHmMBNuY=;
        b=ijvk7Z5eVjT01VscxApiaF3FmsYL8Qlkksvr+5oy0V3nSRVplP+attvAEVgIJE6qKQ
         ZoLXU59Av7Tj9Ob0dnJQ+BG2hCp66jOGsJLEUA5Gq1NEogYHvUhrQ5c0uGDYYGx57R1V
         kljOxv4juv3D0OSyToSGyylj2t6qLVucX7NGubdUQnHdus4R1YJXdEkodYK5jk/bJktc
         07kkf+COPgWEKb8zgDzRpOdtpNOt9JpEEidOWUUsfp1qTsAIDPUVDG/0C82CZLM74YUA
         iFGgljTAqIIgBNq0pbdJGJiogIILeTLw6QI1U5MaOWAdDkKAxyNafwiUj8KAy8SX0GAR
         0LMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Aw6SrPj9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id k2-20020a5d6282000000b0021b88d047efsi236214wru.5.2022.06.27.06.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVB29J4zxpy;
	Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 31/42] inmates: riscv: add timer demo
Date: Mon, 27 Jun 2022 15:28:54 +0200
Message-ID: <20220627132905.4338-32-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Aw6SrPj9;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-32-ralf.ramsauer%40oth-regensburg.de.
