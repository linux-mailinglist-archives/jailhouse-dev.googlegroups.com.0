Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2EGRGPQMGQE4IQAOJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8F68D694
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:17 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id x12-20020a056512130c00b004cc7af49b05sf6279202lfu.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772777; cv=pass;
        d=google.com; s=arc-20160816;
        b=yywk2KmlkZthUfRuN9KkMiyTsK2BIwTqHXoUmcdVCKIz3jRxKZaT/dwLqalzL7BmPt
         Rf/r3kkPtr1K11335GazKZuu4GJKwfy91W3ec3u4hfpIhW3uRysYin5KcxpQ6EMLQ5gE
         PseM5nNJRTUThwRPLdVyG/x2gXVT5bgJtef5pl4MiZ6iXLVZUwkzqB55/CuV4jfQDI6b
         J0NvK1FQ5MugrJsk5n+31GWC9QiMvIHu8CwtcP0K/4nlAd+ectrV+D5vwimEoWGDzOS2
         uROy2BLMFDcsF4Jeo7deJDBB0bVasw8cqJaf1JQ17vt/QwmTg/yOn990xeDJ8MncFICj
         oafw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=aXzEIA5GyF9CSc58X08+c+cDtm4qUFhlaC25AmNEWtQ=;
        b=e3uv7mvIvOYU4tVJryMKsRllXZK2vaS9Ub8KNtrYaugRgJPvlfMmLyiMZSvWptvFIt
         sfcdrs37m05SUYIy12a1bYf2ktmW/kh8afqZxievU82R3nXBdjSkSIo6bnrzVOSxJi23
         mV3pan82I0CkCeOlhx4/ogvNbjjhzvLGrUcmvNca1AxCzsyhdhj/KqluFCC6nxvcDvsY
         7NwSjWcQP/eEFIUG3xGa3U8q51wfSKfXnhXsVJLVOjbYXKL2dQwuB2553PL5kFKkCCRc
         n40vlosZSoZE0ThKeJt8jhlj8+oHx3ZnPq/GH1TFE715VadM9bAGtkScRS59vSnRFs/d
         /Zdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXzEIA5GyF9CSc58X08+c+cDtm4qUFhlaC25AmNEWtQ=;
        b=KiLb52FqmZuvLKz4HgUTk5q+x3w/DPgf/ZxAyFTIZZInbtuA75Ji60kEoCt1wuzGB8
         tfDREzcGSDouVFy1Kg7HWDKtOm7/MwfX5VApdD5HhUlvdM5l2UtDoImqM7AgocPSn7XE
         RzETJ6O2PJ6dTiYeQJV9JynWEdKirKavADFCn85dZXaIpFNnHyuvCs5tVqkts/RAtYTY
         QJ2bjI8JS3HxcIOaJyy4GpbHiGngu8XGr8nzmq7aZRs35K9e22/BQm6xzDn+qzFJMFRE
         VrNSACiRgTKEmRxymEyw5VxKzXTEG+0GBmeFgDo8e4LR+2fKBjrwmlIAzIIosD4p+bDb
         hXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXzEIA5GyF9CSc58X08+c+cDtm4qUFhlaC25AmNEWtQ=;
        b=YFuyI+/L95LJYqDjWvLsPkSrS7OUSTH8Pj2vf+Yzyh9dVa/b0LdH4AZuz5Hq5OwhfZ
         0LSL8g3VmyLI+a71+V1Icm2UqxsEtshm2oRpOXJ6yvJcieM5f00P7HQRZTXQMiJH1iQr
         lLGin2PA8wVX0MqvVa3JatqhapPWE4Xub/ovRwhcaKh0JC1Kh2dgmdspDCgfHaoN3MDz
         NplUMeciHEfHM+zbrA1VVT5v5meHskjycusJSG9cksmlC2vmkXahncE+wCSLIEVqEwZS
         w98249MD+DuksuWOfNvYKsB1BDc3GLaX1HWbaW1Lafs2poCKv4JMN7jH2wTTzaVKGwu6
         1Ylg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKX5yXG7zB01x28dC/83zPGN1MOzNxvWgH9yaqTYZHa4mx5RWfG1
	ilsZISli3j/iAfdQBDWV/K0=
X-Google-Smtp-Source: AK7set+tYEoY8Orq5dEMOGsQ192CJBkUybhWeDvvt/9Yws6HglP5pv24p+VIqAU3bkDqJPICz/mU5A==
X-Received: by 2002:a2e:9d47:0:b0:290:4e11:a3b6 with SMTP id y7-20020a2e9d47000000b002904e11a3b6mr530723ljj.75.1675772777270;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4bcf:0:b0:4c8:8384:83f3 with SMTP id o15-20020ac24bcf000000b004c8838483f3ls72295lfq.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:15 -0800 (PST)
X-Received: by 2002:a05:6512:21c8:b0:4d8:6540:a72c with SMTP id d8-20020a05651221c800b004d86540a72cmr752334lft.46.1675772775431;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772775; cv=none;
        d=google.com; s=arc-20160816;
        b=l9a0YG4qnj3Ci8UrqyNVybC9T+523Pn8aqI0B+VCZVk8HVT0wy4Eqp5Qxc5cIjDCDI
         dMs8X3L95Q+xK+kpEgpxa80e7/EU/jmyG1BMgogTObO5dhyWYA3UpH3OMSu+W8uX01v1
         vQmp2zzyQ8Epyv+FHWRTVmytEMcO9FNp/LXeGGDCszeJ25VvHrxGen+ujO7QLm9r4G5e
         S5P+jeeGC36OnwuYkWEgMN5K4k0qEGUxw9dE4EspfDYHe/laJz1zJ6uCdIJDa+oxCje2
         bDo1FrsMBzzVFfstaDxNFVmC0z17hF4XN8JJE5fmdhXKNxDQszjR3dXjqtnSsh6D6wwv
         ZFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KxJkI8MEQIEKaiJZFoZ4fAY6yoYTqPKGwWNq36SZ8e0=;
        b=ZS2bkFRfnqSlqzp+8Z797wN67w32rUcHj7yaZYPTtytvUD7ILvnkKN1W3NTcUqEgd/
         QiuhKEulpl6RT3VzP8UcvmfcZigpMVvWtVfp/fhbAKRFzxkfcWp6qF4rdvb2nZIWmL1A
         bNy1QNwOjBCG+0dTFEi19X6JKN/ATvqOrBvuehw2QPlkkows6s3MFEcPYLRyamtwvxnx
         Vjvdd/vxy7rJJtqlg14vVgiqANPR+i2mJ1l8ozKSa9XckVRQ5OBebutd9uMmwU4N0UWY
         SfYrQNvTzdW41tCBGRKQubK9h2jatqX+GDdepupA985X+XbudEAlJWzP+EPruU4GOZBs
         TB7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f16-20020a05651232d000b004d09f629f63si647742lfg.8.2023.02.07.04.26.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RV4xXyzy8J;
	Tue,  7 Feb 2023 13:26:14 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 34/47] inmates: riscv: add timer demo
Date: Tue,  7 Feb 2023 13:25:30 +0100
Message-Id: <20230207122543.1128638-35-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-35-ralf.ramsauer%40oth-regensburg.de.
