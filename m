Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBZFIY7WQKGQEARZ2NWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id D8287E3867
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 18:42:12 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id 23sf5121287lft.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 09:42:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571935332; cv=pass;
        d=google.com; s=arc-20160816;
        b=fcIDsE5SK7lawXIU2D5wg/ru+Egjy7pTa5BxhRBXTF1w5/xVtnAlN4nCHg79VKVlNn
         FUDB6djjndRrKjnlBnGixWBmBdsohmw6UQBElVH/5EOON//Phno3UugXxfe9zTM7bzR2
         u+Vn/5dWx/nbSj/U7kyWw6p/juedOdfQF/GhZ9Z2x+HTqRmGOO27I0L+CHoenzzSmir7
         CtLEGl0QltMMRffDHT1hi6xbhbEMFkF7qDMInl+BRT4u/eenYi/6hLl5tgJtiHEQHrWj
         4vMJox5pBW6JAhXBLtjFFWMcK8EkWv3h80u/hgKO/0bHpfTYtDEtdMg3X7Cxg69RceFu
         SGJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=MjnYVNle+NrUoFVL6s4NJCEwKZDF44+hLBErKnpd4EU=;
        b=QTL0FVpJOxKyiPA6Q/mfn0qK5tNp4lRHyQ7PZI1kHzF4I4382H7nDVhiloO1EfYDEc
         enj2xVFEX8CiUroQmgx4P/RtofhwcPWEax7xCzHGfxkWYhhrkJCDWnVRfrEZT9kSsqjX
         yyXdXoL6nW0qwkpGZC7ieRkpVwfiJdVi9i8ULE6JLSkvzvvzkWnNGdW4Xh1gO74smFAG
         EKCELHl54yrGVXll0sCJkbGnpAN97vbPzvhsY93mkcKU2w5joyC86qGj+VdnfyHWNS2k
         DO39IBq1L+8ZswnihVQl+/tfbY35/YqgA4C4eUdTI+eAwr1AxnLD+SxJTOlxvqvAYJsk
         ddUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bLqq0Hoa;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MjnYVNle+NrUoFVL6s4NJCEwKZDF44+hLBErKnpd4EU=;
        b=kR0zS4PE7QxE/+MQuIM47c19I7jvkD1XXU7MomtDeSsMiGP1VLQ6JxP6h/koJ+lrSn
         Sm6nYu7x8x7SaMSPvQ4s8+ILlDXE9VVc76rfbGBV4bkEAJTMWullWVFMPzhfxa4tTlnA
         Ut4XSoVuE5AJZIMc5bPOTwvTz41Jf/bzK46nKUfGSps9MbslUZTMRLf/36SMQdmIb3Ko
         y0pZZ1OAMKGLXNh2lv45vFSGrhbuSPXd/2ZsagVoLW29DUIbH9rNrJ3rNqKwnqn+uGRK
         wWMxXfefL4eq7IT1FD824nYSDVW/9Z0adbi6nLGgckCKYo+zZ4b9N2KcTWUEhogRfpz7
         wWhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MjnYVNle+NrUoFVL6s4NJCEwKZDF44+hLBErKnpd4EU=;
        b=DmZ2BZFLhn7NXEqHhZ09YHq+JdfzQm1n7mhAW09LtNCgkWTLIim1yNtD3XZi4UuvpC
         rBF7RjjHe+1Li21j5NpUOF1SK+DrLRgk9au85XP0/H/I0fMUSDwReeoiYPUm7BYJvLB4
         rWZpfppKSP6bSMMxdpxgWLB48SN5K/rI+xinOSVtvRXjqcJMjSj+H/dqggQitP3EENEd
         HpXehYeb7Aq9CzJXzm0GdyKvBzWMZnv/WHN8cmyvkqWjt18zm0oIdD/jiGsZzMbTVSGg
         tbo2HyCP2aLrf2rAvllpEoCuGxDR6ibAviX9IMputcRzQjEG/lC9Y3GMlBnj65u1/i7m
         3t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MjnYVNle+NrUoFVL6s4NJCEwKZDF44+hLBErKnpd4EU=;
        b=Eij4KAX6XOV2RlIb8jTNWQVxEDCcBPbIXAAaufYdOOGl7Znj1KnI4E80gxXCaGsI/c
         MGog5Q06TzY8bJ0v0zH1eYmn2i9L8bRDMAelsSGmA1bmcPbHoR2KM65qKynxLzB0z/KK
         XOERLmtQ3yqiulaxJ7Z/jFv9QiAu8HcxldAOIoPvnIpI3Xvgj+0owMdzIHvasV0+o+mM
         PMLcw1lET5nJFvFgK+jbVCNGDSJmcemTVn5hut9MOmZwmsapN7Y001MlZNCokUuTnQsz
         KDi3BdQM+Hpo10AxO9hnwG8tIHxMpyxhuGgeJ7c/U5ay4Cn5fwP/o/Fq62HGapthU4jo
         ZBVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWHQWt3ZsfXNaNLdDiGU4wzPPdCNU8EMTulMwE90ASNbeWVYkZz
	nY3nXqtd1hZOT+3OrPq8fuU=
X-Google-Smtp-Source: APXvYqzVLYEEcQTrwOYI1PrKInjjj8xtBszXPa/JSqsTHHeCOqLIuhr1WZ49zRLg6+UFcLLJn6afRw==
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr20486131lja.218.1571935332495;
        Thu, 24 Oct 2019 09:42:12 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4349:: with SMTP id m9ls643825lfj.8.gmail; Thu, 24 Oct
 2019 09:42:11 -0700 (PDT)
X-Received: by 2002:a05:6512:4c1:: with SMTP id w1mr26878969lfq.96.1571935331930;
        Thu, 24 Oct 2019 09:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571935331; cv=none;
        d=google.com; s=arc-20160816;
        b=T+GpJ39m5zgyeeBJWObtmdbkaSSQh6x/hNzr6bzaCTgVd1RgVj18OCT6FGk0JgRBfB
         hhB+D4y7rXBcTguOh0YA5PI7VmXRThC7cFY/pxQqwVELHfObkNPTiyvHLMn/RZ2tqevx
         9N+HC1jqPd7SN/AT4owqf/xhMjGmK0KTG9JBlA4dqJO7hWSlAnVB5UUooGELPqTGngVz
         puoD/PID4h2usPNaYlThpoDG4+3aGxks7ViqukPdMdiecZktTAb5m3WlymaaprwgEh1C
         0OL072KwvdQiJTUq+XVPRRuY5DsFRyPKKFambHYiYchpIP239ZAC3BTfo3T2pLkOE3+/
         84gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=cWJ7f5uaaQSF3rdcV5kAgu9VvjDJqJWLgLka1atiahU=;
        b=gybC1G2CHeDXmmR8UxD8Q+YtXFPaHAtRUokOohJ/5NiMEUl81u78Z3C76f/cX9RCkJ
         Jpp6mitnQEQkQzM6xlFEkxd0y1RACLbqPXLGjOjY3OukmHUQIuVXLU8j01AF3/KeQlq3
         MVi3BUkxyPiXQiYl3Aj6ICZ7PPUVAae+rm8kxeG0acq8jGIjIoZ9UrrkZGVngcjmUt7c
         IQimACh9MjFln9w6JZsM+PHYD6f4YJh6u6FSdzCuPT5iqGNKRkZzEq1/MAwT9vGEvgka
         72yunrpzrVYr2XwnKD5uKeY05667dEGqha/6wg/hdvnvF/F6h5TctrEPjiukTEnHgCO9
         X4VA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bLqq0Hoa;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id z9si1731397ljj.4.2019.10.24.09.42.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id s1so18082625wro.0
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Oct 2019 09:42:11 -0700 (PDT)
X-Received: by 2002:adf:9044:: with SMTP id h62mr2920477wrh.91.1571935331034;
        Thu, 24 Oct 2019 09:42:11 -0700 (PDT)
Received: from localhost.localdomain (27.red-79-152-66.dynamicip.rima-tde.net. [79.152.66.27])
        by smtp.googlemail.com with ESMTPSA id 26sm3341383wmi.17.2019.10.24.09.42.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 09:42:10 -0700 (PDT)
From: Alex Largacha <alexlargacha@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Alex Largacha <alexlargacha@gmail.com>
Subject: [PATCH 2/3] inmates: demos: add PL irq lattency measurement test for baremetal inmate
Date: Thu, 24 Oct 2019 18:41:57 +0200
Message-Id: <1571935318-25453-3-git-send-email-alexlargacha@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
X-Original-Sender: alexlargacha@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=bLqq0Hoa;       spf=pass
 (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443
 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
---
 inmates/demos/arm/pl-irq-demo.c | 170 ++++++++++++++++++++++++++++++++++++++++
 inmates/demos/arm64/Makefile    |   3 +-
 2 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 inmates/demos/arm/pl-irq-demo.c

diff --git a/inmates/demos/arm/pl-irq-demo.c b/inmates/demos/arm/pl-irq-demo.c
new file mode 100644
index 0000000..9f7c539
--- /dev/null
+++ b/inmates/demos/arm/pl-irq-demo.c
@@ -0,0 +1,170 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Authors:
+ *  Alejandro Largacha <alexlargacha@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+#include <gic.h>
+
+#define NSEC_PER_SEC 1000000000
+
+#define GPIO_IRQ_NUM 136
+
+#define PWM_TIMER_BASE_ADDRESS 0xA0004000
+#define TIMER_0_CAPTURE_BASE_ADDRESS 0xA0002000
+#define GPIO_STOP_TMR_BASE_ADDRESS 0xA0003000
+#define GPIO_LEDS_BASE_ADDRESS 0xA0001000
+#define GPIO_SWITCH_BASE_ADDRESS 0xA0000000
+#define PL_DEVICES_BASE_ADDRESS GPIO_SWITCH_BASE_ADDRESS
+#define PL_DEVICES_SIZE 0x5000
+
+/* AXI GPIO offsets */
+#define GPIO_DATA (0x0 / 4)
+#define GPIO_TRI (0x4 / 4)
+#define GIER (0x11C / 4)
+#define IP_IER (0x128 / 4)
+#define IP_ISR (0x120 / 4)
+
+/* AXI GPIO offsets */
+#define GBL_INTR (1 << 31)
+
+/* AXI Timer offsets */
+#define XTC_TCSR0_OFFSET (0x0 / 4)
+#define XTC_TLR0_OFFSET (0x4 / 4)
+#define XTC_TCSR1_OFFSET (0x10 / 4)
+#define XTC_TLR1_OFFSET (0x14 / 4)
+
+/* AXI Timer PWM */
+#define CNT_PER_SECOND 100000000
+#define NSEC_PER_CNT (NSEC_PER_SEC / CNT_PER_SECOND)
+#define PWM_PERIOD (100E-3 * CNT_PER_SECOND)
+#define PWM_DUTY (PWM_PERIOD / 2)
+
+/* AXI Timer registers bits */
+#define MDT (1 << 0)
+#define UDT (1 << 1)
+#define GENT (1 << 2)
+#define CAPT (1 << 3)
+#define ARHT (1 << 4)
+#define LOAD (1 << 5)
+#define T0INT (1 << 8)
+#define PWMA (1 << 9)
+#define ENALL (1 << 10)
+
+unsigned int *p_capture_timer = (unsigned int *)TIMER_0_CAPTURE_BASE_ADDRESS;
+unsigned int *p_gpio_capture = (unsigned int *)GPIO_STOP_TMR_BASE_ADDRESS;
+unsigned int *p_gpio_irq = (unsigned int *)GPIO_SWITCH_BASE_ADDRESS;
+
+unsigned int t1;
+unsigned int t2;
+
+static void pwm_timer_init(void) {
+  unsigned int *p_pwm_timer = (unsigned int *)PWM_TIMER_BASE_ADDRESS;
+
+  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), ARHT | UDT);
+  mmio_write32((p_pwm_timer + XTC_TCSR1_OFFSET), ARHT | UDT);
+
+  mmio_write32((p_pwm_timer + XTC_TLR0_OFFSET), PWM_PERIOD);
+  mmio_write32((p_pwm_timer + XTC_TLR1_OFFSET), PWM_DUTY);
+
+  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), PWMA | ARHT | GENT | UDT);
+  mmio_write32((p_pwm_timer + XTC_TCSR1_OFFSET), PWMA | ARHT | GENT | UDT);
+}
+static void pwm_timer_enable(void) {
+  unsigned int reg = 0;
+  unsigned int *p_pwm_timer = (unsigned int *)PWM_TIMER_BASE_ADDRESS;
+
+  reg = mmio_read32(p_pwm_timer);
+
+  reg |= ENALL;
+  mmio_write32((p_pwm_timer + XTC_TCSR0_OFFSET), reg);
+}
+
+static void capture_timer_init(void) {
+  unsigned int reg = 0;
+
+  reg |= T0INT;
+  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+
+  reg |= CAPT | MDT;
+
+  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+
+  reg |= ENALL;
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+}
+
+static void capture_timer_reload(void) {
+
+  unsigned int reg = 0;
+
+  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TLR0_OFFSET), 0);
+  mmio_write32((p_capture_timer + XTC_TLR1_OFFSET), 0);
+
+  reg |= T0INT | LOAD;
+  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+
+  reg = 0;
+  reg |= CAPT | MDT;
+
+  mmio_write32((p_capture_timer + XTC_TCSR0_OFFSET), reg);
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+
+  reg |= ENALL;
+
+  mmio_write32((p_capture_timer + XTC_TCSR1_OFFSET), reg);
+}
+static void gpio_init(void) {
+  /* AXI GPIO IRQ config */
+  /* All inputs */
+  mmio_write32((p_gpio_irq + GPIO_TRI), 0xFF);
+  /* Enable channel 1 interrupts */
+  mmio_write32((p_gpio_irq + IP_IER), 0x1);
+  /* Enable global interrupt */
+  mmio_write32((p_gpio_irq + GIER), GBL_INTR);
+}
+
+static void handle_IRQ(unsigned int irqn) {
+  unsigned int taux = 0;
+  /* gpio to 1  */
+  mmio_write32((p_gpio_capture + GPIO_DATA), 0x1);
+
+  /* Clear channel 1 interrupts */
+  mmio_write32((p_gpio_irq + IP_ISR), 0x1);
+
+  t1 = mmio_read32(p_capture_timer + XTC_TLR0_OFFSET);
+  t2 = mmio_read32(p_capture_timer + XTC_TLR1_OFFSET);
+  taux = t2 - t1;
+
+  /* gpio to 0  */
+  mmio_write32((p_gpio_capture + GPIO_DATA), 0x0);
+  printk("IRQ fired: lattency %u ns\n", taux * NSEC_PER_CNT);
+  capture_timer_reload();
+}
+
+void inmate_main(void) {
+  printk("Jailhouse IRQ lattency test ...\n");
+
+  map_range((void *)PL_DEVICES_BASE_ADDRESS, PL_DEVICES_SIZE, MAP_UNCACHED);
+
+  capture_timer_init();
+  gpio_init();
+  pwm_timer_init();
+
+  gic_setup(handle_IRQ);
+  gic_enable_irq(GPIO_IRQ_NUM);
+
+  pwm_timer_enable();
+
+  halt();
+}
diff --git a/inmates/demos/arm64/Makefile b/inmates/demos/arm64/Makefile
index 49abe09..9378eb9 100644
--- a/inmates/demos/arm64/Makefile
+++ b/inmates/demos/arm64/Makefile
@@ -12,9 +12,10 @@
 
 include $(INMATES_LIB)/Makefile.lib
 
-INMATES := gic-demo.bin uart-demo.bin
+INMATES := gic-demo.bin uart-demo.bin pl-irq-demo.bin
 
 gic-demo-y	:= ../arm/gic-demo.o
 uart-demo-y	:= ../arm/uart-demo.o
+pl-irq-demo-y	:= ../arm/pl-irq-demo.o
 
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1571935318-25453-3-git-send-email-alexlargacha%40gmail.com.
