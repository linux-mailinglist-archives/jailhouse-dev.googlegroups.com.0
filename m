Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZOYRLUAKGQEGJVUAGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62544CDF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id n49sf309194edd.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456293; cv=pass;
        d=google.com; s=arc-20160816;
        b=sR92G9p+0JjXi5riTYWkXIgXYrSXK9vYxR2OROxwRNKtjiBtlcsrstcdT7inEkrxUE
         TH68/fRsRaF+U2D+PcvLwK7pUr1B3hnQFnHUpBy38w6MDJNuPgrzk4l+lPEarbQv3C+n
         Q8weiJafybTd9pvXm5B9KQ92a7UAmReeALQ9AQX8ER4Av2bOc0S1zpKHDaQm20WRi1fl
         ORyYNjn3i5lPX7XoX94KCg0+xbaCEdiTf6S/IOVWEPLZc2Mm+SRH527DxRNHlVWa8u2w
         oydP2KqzrbKcIwqFXQbornKtRqGtIWnLoq8untZZ2c+IznUeXQ2B6lp5mveiaPAVcbzS
         j+9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=24pdXLBqZx0iajLtCQaxp9YujG/CqjraK6sx5lTq0WY=;
        b=j/AHUQT0md0jUCvU6jcRKgaepQgfa/wW8DZ6y2oQ67SgsShnWsJL0gLF2CuXYSH9OA
         had3v4qDtqR3BhPyeVeI2Ag6Op/q9NVmvD47OI+3iRBD/X0+uI05Ot+RL6u1A0KuqqOH
         5sKzkru8B7j6OnExa10GkT6f11bB/M0qJcYzZbPaC3nxXludPA9hTllZBuEsVzI0j/5G
         J6GSwA+G1dMXztJKZaniddLZbZQcUyU4VWpbEvT5wByScLoD8eB0R59JYh4qkCkV1UJ5
         ecaXXgX0TC/Y7eIMwIRCR51QGMai6lL0KjM8FpNLl74B/2VBK48oz94RGxpUyzbmjOFs
         x6Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24pdXLBqZx0iajLtCQaxp9YujG/CqjraK6sx5lTq0WY=;
        b=Z/tQCP4ET4pcxGErDbwmrLH3kahyk6jlFWmcJEX6/2Qkus3qm0A9Dbv8+Tqxu4IezR
         eZsXA4DH2pyyGGwSHsHyAYoQjKsoeAKG2MXgcfo6RIbHcho6dJ4rGxMenXfww/7cCfX9
         wKTETFiIo7YYw1Grxe8Sxt4VCRXqRkJFwUz/25wrMbjxsM9NeJgFJVTM+jeqXyTKA3I8
         +0PoJoKJy9X8V+uMUIoKyNutk6lI6BIOSK2+MjWiYcq42ijW7r9H8Stf5EmEY5ycS7hX
         UL8j+7S5SfK1oaC3WsCz5Wg9UoGXa4FKlxMhHFDiCPmv7nUKX5RykARbco2mEl7JQTPa
         OLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24pdXLBqZx0iajLtCQaxp9YujG/CqjraK6sx5lTq0WY=;
        b=mqTuXCuoAFQpmqCM6wVS0DIsHJ5GkyhUiH4S5DkXhqryScZPtM8CbMeDzQAR6hGoRY
         ANL+vWhWZJr/UOgwg6gMBSne7GL/Cc4fJel9p/mByuLPlTlu7XayFZ1iDazCEi2ZM1D6
         7k4s5VxbHMN1aQC7YIwrUBkIfW42NViKsLXkWKT1QA994QnOHfWAK3U7Pkbvj0+n6WFC
         NC1zJDY8RQXQuLDbnMrhSQF2B0taqsJJB0W/bqdOFx1AaiGsV33f3oBjaqGCDCf6WdjI
         Zr+YFsTi9O3qnMUr0J3WO2YLJVQOf+ocVmGaYMdzM5aYsMowkEMfMU3YKbAgaTPvkBQ8
         v4Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXEhuk0IEzCdUQY8N0Av/HEmwu04Qu1gy8Wsw5HgCZ8oiXVTgXA
	xbwsh89rZahlrnnEwfTUZqQ=
X-Google-Smtp-Source: APXvYqxIgAXA/dkTAa+Qf5xuvWLhu1HH2GgXTUHz2MAflGbpshOQnzGNnb0u0rhW35NVscJ+WJKTbw==
X-Received: by 2002:a50:94a2:: with SMTP id s31mr56600098eda.290.1560456293766;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:942d:: with SMTP id p42ls2043593eda.1.gmail; Thu, 13 Jun
 2019 13:04:53 -0700 (PDT)
X-Received: by 2002:a50:987a:: with SMTP id h55mr56710796edb.108.1560456293320;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456293; cv=none;
        d=google.com; s=arc-20160816;
        b=Mqaay1L7+1vtQACNICa0fsILBSlLQjdrmVEm7ZjgbNFWp3BS/c1v/6KG+o7RGG0lQC
         g9Fqn5CRO9ZYr3S3MPHTabFLixPUYrY9WQRkScViLySCKBioc2tqhqGL4dnpBMfAg/bP
         sHqZJK6u65Gdy6bqfW46EgsLYTsjfsrj2ZNXCmeDyVzcY0WwhcLsnzHDUS6+8i/33CfZ
         DO3OmTMz2ha/HY5wdIwafuMgG6tHe7bjnWzDbBlm8HkW/Tm10sP59mraMQUy2YPZAPNm
         aNg3ObPqJxmxsOxlnwyEMBMVnqKnfitWmavbZn7bHAJSZWL1X7si+dxYd7Vo2GTmaMtJ
         0lyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RydG3fqnoxzDQDwFBCu4Xng4tmyiEy0cwxDuUlyp/70=;
        b=bmb+KDgnUYJvxAj5VLSIwwlBUNIWUWWS5R0TCKACWV7UR7cSZfNG5O4bXLrw8Wv7a1
         M1HdQHeIL+hP+69O++V2jX/VXwibKJ+lPYIPYMaKiWT7seQC2+XVAOWrG0tlDLlBXfQw
         0tPoB8V5O9DAUK5tuZAlFNWl6x/OY1KtHp1atbDre3sHd6INnuYyPRF5CrxiFELJUPoS
         iw3LdjTByynkxdqlcSbBLl1Foc+r/8s5ZaLaPg8r2zub44q/Qchhl+ZRDL6BWzYE6yci
         Yg3Elf9cs2tgMpi4hbdt9tskDCV/0fYCG7tBK8wYyNY3Nbxx4Mou7haTLesit+oSR++f
         deVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x27si34971edd.3.2019.06.13.13.04.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvpr5pKZzy0s;
	Thu, 13 Jun 2019 22:04:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 1/8] inmates: x86: use a valid stack for secondary CPUs
Date: Thu, 13 Jun 2019 22:04:35 +0200
Message-Id: <20190613200442.18984-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Woops -- we shared the stack across CPUs.

To fix this, let the CPU consume the stack pointer held by 'stack'. In case of
the parallel cell startup, only the primary CPU will consume the stack.

After setting the stack, the consumer will zero the variable to signalise that
it's ready (cf. ap_entry).

Even if we don't support SMP for 32 bit inmates, align 32 bit header code, as
well as 64 bit header code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/header-32.S      | 3 ++-
 inmates/lib/x86/header.S         | 3 ++-
 inmates/lib/x86/include/inmate.h | 1 +
 inmates/lib/x86/setup.c          | 2 ++
 inmates/lib/x86/smp.c            | 3 ++-
 5 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index 006cce9a..a0f2d878 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -104,7 +104,8 @@ start32:
 	mov $c_entry,%ebx
 
 call_entry:
-	mov $stack_top,%esp
+	xor %esp, %esp
+	xchg stack, %esp
 	call *%ebx
 
 stop:	cli
diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header.S
index cb886b8e..978decb3 100644
--- a/inmates/lib/x86/header.S
+++ b/inmates/lib/x86/header.S
@@ -108,7 +108,8 @@ start64:
 	mov $c_entry,%rbx
 
 call_entry:
-	mov $stack_top,%rsp
+	xor %rsp, %rsp
+	xchg stack, %rsp
 	callq *%rbx
 
 stop:	cli
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index e57d7271..a3d7601b 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -221,6 +221,7 @@ static inline unsigned int cpu_id(void)
 #define MAX_INTERRUPT_VECTORS	32
 
 extern unsigned long idt[];
+extern void *stack;
 
 void excp_reporting_init(void);
 
diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
index a1455993..807db99e 100644
--- a/inmates/lib/x86/setup.c
+++ b/inmates/lib/x86/setup.c
@@ -42,6 +42,8 @@
 
 #define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
 
+void *stack = (void*)stack_top;
+
 struct desc_table_reg {
 	u16 limit;
 	unsigned long base;
diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c
index 9b983611..94ce2913 100644
--- a/inmates/lib/x86/smp.c
+++ b/inmates/lib/x86/smp.c
@@ -54,6 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
 	u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
 
 	ap_entry = entry;
+	stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
 
 	write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
 	delay_us(10000);
@@ -61,6 +62,6 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
 	delay_us(200);
 	write_msr(X2APIC_ICR, base_val | APIC_DM_SIPI);
 
-	while (ap_entry != NULL)
+	while (ap_entry && stack)
 		cpu_relax();
 }
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
