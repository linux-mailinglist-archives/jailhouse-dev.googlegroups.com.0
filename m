Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRWD7PTQKGQER5I7NIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 614663BFAE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id i22sf126367wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207815; cv=pass;
        d=google.com; s=arc-20160816;
        b=GzfMsoXE2qR4TzDEUaeoRNyI+wJ3bcKjRP+6XzZ4DkP0eWbiib2GVxFTc9mx/N8dCC
         xMBoDc1p/rAuwW8ZFzE5O285EaZUlaCiA5DFBUccgrFqRVTLqUjeqPH8tWTnuBGrPCp5
         VC4TIz0uE+4hsTwq3RaLESb5NtsWxgZQXT2uEen1krUzje1oP1h8VEp49odVW6OGlIKa
         W9IVlqgQQiGvvs+M5a6yXYEGoEQmEci2yFpxuwcL+hI87SIzWfRArzBSBmwHd85ft4U2
         ijYASpGImyXAAdg/pB2kntN/JscLnvJMZLmJPhOM8wtZJIQjyyOF013BQGpGJJxTlcMA
         U6mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HxAT5z0JXDFU6+xPs0vFu3wKoBuD84gCXinHTdNY6o4=;
        b=GxcyG6CwDTTYabDOPwjZXzjuA40B1xd58G4QKTotcR2FLCiQyvSW2KdLlh2SDdaM/8
         NamnNY5fX+8/s2AXfLQ2XJwIAo7Dxs6zZvHLrnWp4Rsscp4IM7am2YgePfA64yeOhEfy
         4XlHWgaB5ZiIU+x9R7IZhXDp0pDkLZMhDTheSax3GTxQxLkSTclD87tH54mtB3EUw82y
         titBPYeixVK9Yv+sIqxKXAujn1FGaM9YlnG1oUwv2yHSaxZJgrLu3lj4tB9bx0xTBzmN
         iJYNWD9xdq0Y9OBAFwe6nJt6E5KDyGarJCUcpMTth12DC6DzbqVAWwvHU5RrjowS8koZ
         v+LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HxAT5z0JXDFU6+xPs0vFu3wKoBuD84gCXinHTdNY6o4=;
        b=YYcxU04uH0ZBaxZ66BIcDu1YRJ8mPAq2kTA+p3bXpn1zTSK0a369PC3PVFYEAAy3Go
         aXS+MphoDfh99P4/1yTB0JhyN/BUIHQLvOxLXA3KEoC/3+1fPYn4dE/FQpE1mZESLx1n
         SaScRSlvc/ORHNC/AwU4PKndwUM6YVzCs9bo264EYVKTWGI/lPKDGmLkr2zfkcWya97x
         6g+AQLiDKk/ruIQGKqbBD8e8ey7/lj+flVyRE+kn6TmXpm4CKC8k1K7r69lgDaILbhZL
         Z7x+gVUuqqkM3TO85IL2Vr3n7Rt2lTTTsNEgI7uI8SIEJ1U1WpZVMTCm+Ilq1hliZhwA
         UCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HxAT5z0JXDFU6+xPs0vFu3wKoBuD84gCXinHTdNY6o4=;
        b=qlnvzvubEvLMSK1TdlhUv2LWGx9qjAOJrxnzmMkH4DX4MSgIUq3JUxq68NUGAcrxR1
         x2HYEeCGIDU/XdscQ+dW2aM03TaWYJ9ceozCS5vRPs9wZeSldhARLPbtyBITdVgWCFrI
         YNWO4MMhDbbnULEXDBKPwoqAgGdHmOQNR+WY96NLPg10BMXZ4BiJ8QlH8JNILtPT1Krx
         5CQftAGaL6IoRR4OHz1ogFDvIsJ+JdyJTLWh3I4xxDbc4raskKwMMVtIcJEAqK9dHAC6
         aExJNqokWiG1WKIVSfqtf5AhhwPIWlkNVK2hreBeEtCRKSMwJcCNfOjyxrF8xGO/o+5O
         zLPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzx+RlN4uvKa+ZdQ5kZJc2HJJgAVN2wRzP/2xFJoREo7P0FAR1
	vAxkc/CKUIxp6VAtzJznUn8=
X-Google-Smtp-Source: APXvYqzMzpEcxmk/8YhYxaKsyN21I2XZIhBIA8EAla7tT2lj+5hqv1k2gsDckAbO5B+kCw8jK5VdDQ==
X-Received: by 2002:adf:ef4a:: with SMTP id c10mr33987802wrp.223.1560207815127;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bacb:: with SMTP id w11ls4041825wrg.9.gmail; Mon, 10 Jun
 2019 16:03:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1c6:: with SMTP id t6mr2755408wrx.236.1560207814541;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207814; cv=none;
        d=google.com; s=arc-20160816;
        b=JXUBYjUTeZdHVRSTSCt/Sda9nJYTDU5e5u8gIGmrF5yBWkKRjxZtN5dgqFXuhqkxC4
         RSqAWdNx7mWU3SXtfbzPz61Z+DDZd4w+xajL3VXTr5Fr3Pw/VhtdJKAgskPJwCG52AI0
         StQAHrVnFb2ZaaIVxRSadUGmk/VGmi72KjXy7EhSzrqaygbd609EKq9rBJCjd2XBKNs/
         h+/htEcQ3lyUaMTUf4vYe4oME+KLZSVc/6oYp5x/tdBInJ6aDS0R9+l7JKRWBfFAOdHX
         aYu9CgAGUhRJRWTb0odpeqgfxcyjmhi6N4EtuDs61Q7Ioyykua4c3ctjsZm3GE4Aagny
         vD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gl78cnsA6aP1F7k5xJJciCCGFbfL5gQNTBQwTHZpL44=;
        b=hs3JA/s04u6Be7KwZVxw/3g/68euP+auW3UTyHB0Ud104OS/xjPPt/eBZ/HVdtEIHi
         MmRKuWFxqOrj9CNIyPcK8PQgdeLlyW45OCpBvMGQDSZUcU1wP+UrTvICk5g3r82Eo/4N
         QIHCRW0DGoe+UNUsk94WZxgjy7+LRSZmXkCR/flOq/WhAsC5Xn99rNGkmg42FBvAHBBb
         ZrrvIk8REOV1K8U9M7uZcXJ1cQE/GSXqiEBV/nl077SasRKvNp7rRzOPLaqu2shFNJqg
         ffm6CPbr6es6xgHAxe4ZDCZQbYOGcl/qJ6+tS3/x6kpPaDPUn+lXCzW6Np+FYo+MJK2B
         rchw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n10si41967wmh.0.2019.06.10.16.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wQ0DmXzy96;
	Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 03/10] inmates: x86: use a valid stack for secondary CPUs
Date: Tue, 11 Jun 2019 01:03:23 +0200
Message-Id: <20190610230330.21419-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
index e4f75206..7505b050 100644
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
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
