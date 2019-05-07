Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBD77YXTAKGQEID6JS7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AF16402
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 14:52:32 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 17sf2057226ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 05:52:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557233552; cv=pass;
        d=google.com; s=arc-20160816;
        b=VDVgXrPTn4gmBJ2r8pOMBVEm6FID8RznOqtq7mLNAsjkfuWW8LuC3x7w9KNXrw2zS2
         GKh/T2yTfPiMhPj2U1soV1MAwOTtvwCTxqddqgPKdYgXc9ZyAo99Gu4s2+SRhFVENcLr
         HFjX4Wbhyu+oAAnZ3d2xVvxWveTd+HD+1WgTpt1qLBNoLLASTH6ZDrrmwLeFPxISOJys
         AdqB0nz+F9C6m6WfCvV240Sq4xXe/F3iI8d0KlOG4N+zeh2xbOPagWh7ZKoJuLKr6lEf
         yuqkgLCOccSZaqXw8WfxNZs0uN0Wio+bHLB2Clq3YNZc5Nj46wSA0H48gFK/1qbhfcot
         rMmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=ItRqXv7NRdTzoCVzjZnEzRaA013nbuPDy8ezq9E9LrM=;
        b=BFEBnhWSc5nKj64TRD7vHTqZJixM71fu6F/fJm1UQ7to/RT6l0M4BhhnSIwtHS3S6X
         uZRo6ICr+qjvpXIh707j5dR6LwnUjR+f0iaAPfNfeCRn4Q/oVmC/UtEV92T9LkaaxecU
         +56GYN2hYjXk8PDFge/Pxc63zErWki2pfvzSeIw7RD5rEnNfMiZlXA5No7C3NjP+BicT
         /7MmnZnBTOmQwIgQGvqBAfBdEusplmbr4RgYOf7WTWUADpEB14Of50JAW1hh+720lXaw
         pTr/rMA2F/p14EWIBhwG2lnm64IB0B4Dx+K+4nW2D33LifLDdwgrPFBKQ5xYSJL69AnK
         fNpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ItRqXv7NRdTzoCVzjZnEzRaA013nbuPDy8ezq9E9LrM=;
        b=dll42/gpwBeecmajKX90qTxxjiZ01qYWkClk/B19+pZ+bH1JSMUf3y4k8Tx59dkGZO
         eIo77m9UT8/FW37vMTPOb9wFJUUg5JRMb+fqXwSQVsQyLHGYHXHOsKRZEa6NFc/D+3eL
         Fy0FYbcNmpmAzfBLOC5+3mh/kyJ6a48ZIGEClpHDoFb6XgfQBzjK0Pfdr4mZm5f8Hz1p
         nOrcJsDDb0h2tQURWnMAQ1PsvBPvfhNkCADQ7CN0mBu6QDS9grLJsHia5zwWUMvP2igM
         7glDqIOepVLVEb0p9HpfqGZeFklBFyE1bfERgclRUz+dYREpb/DES6wvSshDmDig6LDR
         U0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ItRqXv7NRdTzoCVzjZnEzRaA013nbuPDy8ezq9E9LrM=;
        b=gpfaqM62M9Jr77pdvHICAYT+5x+HAYowQf6ZoyjqWWP8Eam12GirQOsUoFAU18IYDv
         0T+ymBwWborzHKByd+vSsNk0+5QqktbiqPzF2+RkIsJtUnoyciAGK9xdlyuiGHEsviGW
         tEMsX+rS51l0f96Bqshdlj9FaqnvLF0NxZ4iEvb9X4p6oJaYW0XietWr/CbGOpaNaYtc
         W4n951/dQNZ2rKceUegEbmngpk3J0AlMF+3QzDVvfk1nA2v6ez06CttjADOYPQbR00U9
         2LDe/yrtxpHuy/Pud29u1fUig5sLdkrrL0l1U78I0zhftzsgAdK5PL25i87si23CFhUO
         i3TQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWK7T76UkiDfF4D46S+dICI8Ic04Z7uk8juVT6CoVsH9GX5FjOU
	n3ZQGMPtIAMl8artz2bxhHI=
X-Google-Smtp-Source: APXvYqw5XRkG+4vWeLxUCeC8TMElygIUPg23yWMrtdtPBIlbrnFe5UCe1hEud7dw1geOLHrA6LBxtg==
X-Received: by 2002:a2e:9954:: with SMTP id r20mr7835194ljj.24.1557233551930;
        Tue, 07 May 2019 05:52:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls1404299lfm.1.gmail; Tue, 07 May
 2019 05:52:31 -0700 (PDT)
X-Received: by 2002:ac2:42c8:: with SMTP id n8mr3819352lfl.28.1557233551296;
        Tue, 07 May 2019 05:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557233551; cv=none;
        d=google.com; s=arc-20160816;
        b=0/DLDg1cnwgF0bJAd/w+dBz6zkV1tkIWwS6KzqtqR8JqSWKtVCIT022KLhlj7o53Fb
         UGcEFI75sP/ote1+QQy/0HYNL51ANFJicQPjrGu4ZcMNQC9nmh+LNaD6LgGRaKGSO1UU
         QSOsWDpey7av1GeNDeupFvbJ2ocnZxkXvtfFuZ6jePRdG+na4Kr1EM1xzIatCJlgFm8y
         SOlnHmDJWTufUX1BUmwENfWKGn7gGm5kgixGxrjCq+c5I545nTjV3yHSXLHkN5EiZR7b
         IJZKYKnr8eGEay1fbf+xhVRa8xmEm12NHptSNJ5lC5PzgFx/1FDajyI6GAsS08tzvvXE
         DsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=WlBVkqk8iHiHLOffcXrO3rTyY78Y1tGw0/TXG8rGoBU=;
        b=NiWwa+n0hyRPKPZ3wBcjYLxasISrbFhT4lWlOevMffoXFNmFATu1cxqmIjhzz9rFtc
         7Suco4Tp4W1Nf0wUMr0FDqukGuTIvXiUYNEB+j07VBKOSFBoD6whPr4DGvmDmZdALCOb
         0IDjn+1dLtou6E95Kzliu/XsXA20OCZaEuuk+o1CQdImyM2iIscPaze75VjKaQBZDn2Q
         T5Q+TYh/ScFpRV1dpw6NE6YrNP8Fq42LUSD0lo3ZYUDVhPK9doryTCYBCAZB6mIW/vX/
         GqXwbmEGSP+PeFHsDm5llzA9k2qeSe+IzbGhjC7+sGV8+loFaL1Kif9EUBZEbWsOe87Z
         aOWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id c22si518224lfh.5.2019.05.07.05.52.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 05:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44yzz163lBzy6H;
	Tue,  7 May 2019 14:52:29 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] inmates: x86: AMD: use the correct vmmcall instruction
Date: Tue,  7 May 2019 14:52:29 +0200
Message-Id: <20190507125229.29432-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.7.124215, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_WEBMAIL 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

I silently broke AMD inmates a while ago.

In 4d6eb915ca78, I removed the call of hypercall_init() without
reintroducing it at the right location again. No one noticed so far, as
the bug (crash of the cell due to a wrong instruction) only happens on
AMD machines only if they use the virtual debugging console.

Instead of calling hypercall_init() somewhere inside printk, let's move
it to setup.c, as we now have a arch_init_early() routine, which is the
right place for these kind of initialisations.

Also remove X86_FEATURE_VMX, it was never used.

Fixes: 4d6eb915ca78e ("inmates: x86: Use virtual console as additional console")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile    |  2 +-
 inmates/lib/x86/hypercall.c | 61 -------------------------------------
 inmates/lib/x86/setup.c     | 20 +++++++++++-
 3 files changed, 20 insertions(+), 63 deletions(-)
 delete mode 100644 inmates/lib/x86/hypercall.c

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 15db65f8..97a37341 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := header.o hypercall.o ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_64_ONLY := int.o mem.o pci.o timing.o
diff --git a/inmates/lib/x86/hypercall.c b/inmates/lib/x86/hypercall.c
deleted file mode 100644
index fc5cd5ac..00000000
--- a/inmates/lib/x86/hypercall.c
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright (c) Valentine Sinitsyn, 2014
- *
- * Authors:
- *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- *
- * Alternatively, you can use or redistribute this file under the following
- * BSD license:
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- *
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
- * THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <inmate.h>
-
-#define X86_FEATURE_VMX		(1 << 5)
-
-bool jailhouse_use_vmcall = true;
-
-#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
-
-void hypercall_init(void)
-{
-	u32 eax, ebx, ecx, edx;
-
-	asm volatile("cpuid"
-		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
-		: "a" (0)
-		: "memory"
-	);
-
-	if (ebx == AUTHENTIC_AMD(0) &&
-	    edx == AUTHENTIC_AMD(1) &&
-	    ecx == AUTHENTIC_AMD(2))
-		jailhouse_use_vmcall = false;
-}
diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
index f79fd736..869e0962 100644
--- a/inmates/lib/x86/setup.c
+++ b/inmates/lib/x86/setup.c
@@ -1,10 +1,12 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) OTH Regensburg, 2018
+ * Copyright (c) OTH Regensburg, 2018-2019
+ * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
  *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *  Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -38,6 +40,22 @@
 
 #include <inmate.h>
 
+#define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])
+
+bool jailhouse_use_vmcall = true;
+
 void arch_init_early(void)
 {
+	u32 eax, ebx, ecx, edx;
+
+	asm volatile("cpuid"
+		: "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
+		: "a" (0)
+		: "memory"
+	);
+
+	if (ebx == AUTHENTIC_AMD(0) &&
+	    edx == AUTHENTIC_AMD(1) &&
+	    ecx == AUTHENTIC_AMD(2))
+		jailhouse_use_vmcall = false;
 }
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190507125229.29432-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
