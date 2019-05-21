Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB4UYSDTQKGQE464X7HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602825242
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 16:34:27 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id y12sf30956197ede.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 07:34:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558449266; cv=pass;
        d=google.com; s=arc-20160816;
        b=AG5oNovS5zxezRM+oqr08Tvc/zQiiTgvdo61wGQIpQMxPifAEpoTE+PV+Pyw6xB9bM
         YvrDhH74HAcExdtA5ynkgeQsCE6cGzmICD7QwxUc+/lon8unTOdgbsv9+FZszmAH2DOn
         1K0vPv0TQo4fM8J9Q+LUeEfPGbEO1tNW7mFOV7LAGjchIvauLYcpMXuMpjAjshi4+bEh
         NxWDBuYkQroxK8niFZA8JaY+PmCfveTYyPy+Y3ZKDatuV4TuQsGJES7Ajar/RUwy+joG
         BCFWlUO+n78sJjebdWDxcmk0aPNVTAYLLLPdTORMzsObcmkX7BJN+nf/x0GdmjiGkQ8t
         VWGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KTpfozVzEVy2Q7YKHRAbyEeOV4uEU8kNsAxxckEBnLg=;
        b=frEEo8yiM86ahYqiS/3XPHjjIbHMcdFejvwPJWvW2DXZBp1vF0CnfRo283P0jvwAGq
         DVo/qr03RUdnmeO71NN59Wi2pTUESQnDSnkQ4hFDbP4xKSznBtRdZS3N5ULUGthf+HOc
         yKkNoOuYDxQT2yrrd5ItopitXVp8aiX+c48wSP+zXdgex8mHT5ZQ8d8eTHkuHEBq2Fwe
         2bsATygCLcz4j3RcZjpEK/jcaThTKWpLRGOjOvE2CJ7eR724fegV5ZMYUz10HviSLjPS
         yhOhLTpaBctUewTfvXaMkus+1ZZxu0OvtSGFgW2lUuQIpjDptNpKQczTOmJ7pDS/4Zfi
         JTcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KTpfozVzEVy2Q7YKHRAbyEeOV4uEU8kNsAxxckEBnLg=;
        b=Ip9M4j9IeLihp9S546wgl/1mdgGv6UL68kdL3sJjkz0yVxjiH7tHB7eTkrnFv/msN3
         IttVDpnCmsDWF+iY4+kzBTC1b5c5GQ5WCjhjtDcInj+OR76OSp12xIWRZupLtLM/IpnA
         OCkehPn+oubk5oSpigNHX5N596ll6ncy8B921bRzc5Gjtk5ezFFp5Nk/OPmiai7KUy1S
         oSRYOXPsq4BhvkJrmtszmdB+WRxqWF1EVj+Dbkc4pqCgZZG9yyZJgmnip3T6KGOloWPa
         WX5UNPmq5+9jeLt/+u7o8/g9NcUp9VvRaGV95PTYfz9lcttgmhd++fQV2Y4h5oRPexcL
         j2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KTpfozVzEVy2Q7YKHRAbyEeOV4uEU8kNsAxxckEBnLg=;
        b=qJETH+fcQepkTIGw6IfvdC17ZBo1g/OAZ1b0uLfAEvGMGn47Qt5vjJpsuikdgkVEuI
         OWZggV+bd6P1OyHHcnOQPuwoxqg+TBolLBuYLxvCPs4UuFM6RcWVzdfKyZa7HPDM7GMZ
         kdEUbmrnhKvwWwFEfw/3m7LB5v6PewebbrjRX56vmb0djhmuCjYlgIJrE2cscjqk3LJQ
         UfbamNA+IvwxukymfoasNB3aYDwWpJ74KPd8UJs38c38RgZ+xm6DXj89F1rCwJ1i45PL
         0AKsNO0VOgCuUtdTRl7tKpz9FTGn4ZeSpE1qSZirtN7Pw8KpJCEjtLPiVjLA+SNCuFto
         shXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVq95mgQOxgo0aSxSUTosSGEvzWgS+yO9Y8o1o/llm5wwyInWdJ
	hqpnnDcAv0JD5rDDyzRYu/o=
X-Google-Smtp-Source: APXvYqyJFMFtukPc3adYtNtyNqZjTg/b0MVKFBpi7kbzzHsyRwrMrNFl21OXQ12njutu0is08Ks7aw==
X-Received: by 2002:a50:b78b:: with SMTP id h11mr82442014ede.134.1558449266839;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4a19:: with SMTP id w25ls4772821eju.14.gmail; Tue,
 21 May 2019 07:34:26 -0700 (PDT)
X-Received: by 2002:a17:906:24d8:: with SMTP id f24mr44822776ejb.1.1558449266336;
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449266; cv=none;
        d=google.com; s=arc-20160816;
        b=fZMsEuGXml4ib9Kvs4lXJco6bCxf1PUJ+kRxiVW7oBmVAD6XjbApLzsilHsiViFOeJ
         rk8377xs9qbDMBhSyyyy4Uz1BvIHdGQPu2NQdDIrTXsFc7M0AxMBtabQgavfxCtCczkI
         uaRhPbbNP9baACOoaT9m5VpLGvO9/hNXYEu3ia+I6Isa+QIvVkNNc9VphkSqqfJ/zXME
         +BNR/pMNW9k7AvCzW+Regi+dpduPd83bFR3RqOL+V303MAYz736LzEdoSwefEti8Ooc5
         poVeQ04xhkWUc+iLAUt5z26F9i/BQYWrQrn3DuWoYj6AvI4W+i6KobG9cbx8R2gUdJQL
         EvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=e9hofl+U7AZY1lEODPAjCy4aW9Q62QYoiBpknE+/u6I=;
        b=DAHL3IZhStmzRzM177dlIqXH2FqUPqQNfAO1gmP3E1Q9ry8iTc1GGi6ER8hnOJWNks
         fMNG4DImofrmrwRBSCOfkGbPmLEaw3itReQl39lBThVmElXLQE1WLJ67KsoiQhFh3RxR
         saiNsoR+rAUZfYQo9P9qOpp8jOJfWZjCu80fTkXC+NpuX8El1J5qef01uh9+kfPXjMi/
         ECwQwdFsmeYqaMBa6v3NpxeJwaXR/ErIkmc73OQHFlTXCKUatJSWECsIOVTprvmKSugT
         Gv4JXlA2uw2eODrT7agtMX/8Ufrw11WkGJEqIDrcR6NP1KLDVjM0dnPxpNKkYFsRXwT8
         JZPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z45si2252014edc.3.2019.05.21.07.34.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 457dZ95jYdzyB8;
	Tue, 21 May 2019 16:34:25 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/6] inmates: x86: introduce a common assembler entry point
Date: Tue, 21 May 2019 16:34:19 +0200
Message-Id: <20190521143423.17734-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.21.142716, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Early startup code is equivalent for both, 32 and 64 bit, so let's
consolidate them.

This patch introduces an empty start32 hook that is empty at the moment.
Later, we will use it to enable SSE, which, again, will be the same code
for 32 and 64 bit.

There's only one drawback: We need __reset_entry at 0x0, but it's now up
to the linker's mood which files it places there first. Enforce to
linker to always place __reset_entry to 0x0 by introducing the
subsection .boot.reset_entry.

Additionally, tweak the Makefile a bit.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/Makefile        |  7 ++--
 inmates/lib/x86/header-32.S     | 20 ++---------
 inmates/lib/x86/header-64.S     | 20 ++---------
 inmates/lib/x86/header-common.S | 62 +++++++++++++++++++++++++++++++++
 inmates/lib/x86/inmate.lds      |  5 ++-
 5 files changed, 77 insertions(+), 37 deletions(-)
 create mode 100644 inmates/lib/x86/header-common.S

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index bae59025..e474ffd0 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := header-common.o ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_32_ONLY := header-32.o
@@ -57,7 +57,10 @@ $(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
 
 targets += header-32.o
 
-$(obj)/%-32.o: a_flags += -m32
 $(obj)/%-32.o: c_flags += -m32
 $(obj)/%-32.o: $(src)/%.c
 	$(call if_changed_rule,cc_o_c)
+
+$(obj)/%-32.o: a_flags += -m32
+$(obj)/%-32.o: $(src)/%.S
+	$(call if_changed_rule,as_o_S)
diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index 006cce9a..30b3f5e3 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -39,21 +39,9 @@
 #include <inmate.h>
 #include <asm/regs.h>
 
-	.code16
-	.section ".boot", "ax"
-
-	.globl __reset_entry
-__reset_entry:
-	lgdtl %cs:gdt_ptr
-
-	mov %cr0,%eax
-	or $X86_CR0_PE,%al
-	mov %eax,%cr0
-
-	ljmpl $INMATE_CS32,$start32
-
-
 	.code32
+	.section ".boot", "ax"
+	.globl start32
 start32:
 	mov %cr4,%eax
 	or $X86_CR4_PSE,%eax
@@ -107,11 +95,8 @@ call_entry:
 	mov $stack_top,%esp
 	call *%ebx
 
-stop:	cli
-	hlt
 	jmp stop
 
-
 	.pushsection ".data"
 
 	.globl ap_entry
@@ -139,6 +124,7 @@ loader_gdt:
 	.quad	0x00af9b000000ffff
 	.quad	0x00cf93000000ffff
 
+	.globl gdt_ptr
 gdt_ptr:
 	.short	gdt_ptr - loader_gdt - 1
 	.long	loader_gdt
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index cb886b8e..2c4caace 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -39,21 +39,9 @@
 #include <inmate.h>
 #include <asm/regs.h>
 
-	.code16
-	.section ".boot", "ax"
-
-	.globl __reset_entry
-__reset_entry:
-	lgdtl %cs:gdt_ptr
-
-	mov %cr0,%eax
-	or $X86_CR0_PE,%al
-	mov %eax,%cr0
-
-	ljmpl $INMATE_CS32,$start32
-
-
 	.code32
+	.section ".boot", "ax"
+	.globl start32
 start32:
 	mov %cr4,%eax
 	or $X86_CR4_PAE,%eax
@@ -111,11 +99,8 @@ call_entry:
 	mov $stack_top,%rsp
 	callq *%rbx
 
-stop:	cli
-	hlt
 	jmp stop
 
-
 	.pushsection ".data"
 
 	.globl ap_entry
@@ -141,6 +126,7 @@ gdt:
 	.quad	0x00c09b000000ffff
 	.quad	0x00af9b000000ffff
 
+	.globl gdt_ptr
 gdt_ptr:
 	.short	gdt_ptr - gdt - 1
 	.long	gdt
diff --git a/inmates/lib/x86/header-common.S b/inmates/lib/x86/header-common.S
new file mode 100644
index 00000000..139d4ae2
--- /dev/null
+++ b/inmates/lib/x86/header-common.S
@@ -0,0 +1,62 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2019
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
+#include <asm/regs.h>
+
+	.code16
+	.section ".boot.entry", "ax"
+
+	.globl __reset_entry
+__reset_entry:
+	lgdtl %cs:gdt_ptr
+
+	mov %cr0, %eax
+	or $X86_CR0_PE, %al
+	mov %eax, %cr0
+
+	ljmpl $INMATE_CS32, $start32
+
+	.code32
+	.section ".boot", "ax"
+
+	.globl stop
+stop:
+	cli
+1:	hlt
+	jmp 1b
diff --git a/inmates/lib/x86/inmate.lds b/inmates/lib/x86/inmate.lds
index 95c6ec97..a1ca242f 100644
--- a/inmates/lib/x86/inmate.lds
+++ b/inmates/lib/x86/inmate.lds
@@ -39,7 +39,10 @@
 SECTIONS
 {
 	. = 0;
-	.boot		: { *(.boot) }
+	.boot		: {
+		*(.boot.entry)
+		*(.boot)
+	}
 
 	. = 0x1000;
 	.cmdline	: {
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190521143423.17734-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
