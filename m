Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBFFN2LTAKGQEWVPY4UY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1F19419
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 23:07:32 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id d13sf551901lfi.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 14:07:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557436052; cv=pass;
        d=google.com; s=arc-20160816;
        b=iPoPhsPpjAC1exlT7y5gpcOEUDD0IJClKXcaB7qZMHi7TJ4MPoJOdvafKvRNvSjXFj
         9h8aUEpzggCqkOFVgsYFdYlcHT7img68fO8cF+XAc1b3jk0IAJKYfyXq6L3Kf643BsLi
         olu42FXuudCnunrlnjJYQjCSRXniH578LVHXvZdsDyV3D/LaQz5pikFIOX8YgpPif2XK
         BtFgxm49FjKnQPCllh6LJbA9IYnJdcBPbmuXeHwM3qQP20yaFKfVLtd639GcVTyzjbtq
         EDc+XraDIiWLQBUih+IQS3AKPie29MWU92kDb15EkHyCyCVfhETg0/Nwj7nsr+j3N2gN
         kZlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=SRyArC2uA0qh/fpunNgy2a3H2qljHNgguRLE/uZ7zS4=;
        b=qP+1YdIiEjXqzKc85IhlELphL7IDVEmAvekGSHYgBEEu30vPi5h5j+PbyF7zmzgRTL
         KZWMqUy/6L+HFVzDJXl/eLEyA2DgO0HS7uRcNzpBpkKwswGnwtE7l0PHluA7DrmbAjSG
         8cy56CRlu2IDfTb8Lr41Ss3l+8NxFhNWPIFmDP7+2NoN0pJXQPHCTumGoxZMS2ZdnmOn
         MEfmN0KaP2CjK3GBfnGLRAyuA9LMGIVGd8BEPt24RiKVY2lMv9LSbHuinkXC/b9Yigwv
         irrByNE0dJk3ZyqiQOFJ/LOj3k9sM1nskzIYtBknpUDbxaxCfdA7/+lnai0nkZo9Cpzz
         eyyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SRyArC2uA0qh/fpunNgy2a3H2qljHNgguRLE/uZ7zS4=;
        b=DxlXIJ9Hms/uH4RIgCiQ3UBW/2krL/8wdxmITQMKV42ltKN6D6uw7znfc9mz1v3XSZ
         n3fqzinHfKy2H3Ut3F+wzBTYJXVLWXCuJlKv5lPOo8EW8n7+IBHb1cjSZvJWOZB94YQg
         MTzklfyTbN6nzX9mP5S6FgCj3St5Tsi6relgBF3PNs8UmCa2BUnjjLgJZ8mwOZE5g5Nm
         g7wbtgXt9ROOPS+arq4jGlBWgc7AnzZY9McqsWkfYN/GCgSp8FjlAX4ZaXVDRS7OB1ze
         QpOcSw2bGUqim+R+B1phVtw1QSMhzXoUnnR5BbdTxlg8E7Sd8iHere68DvERI0GWPxW8
         OObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SRyArC2uA0qh/fpunNgy2a3H2qljHNgguRLE/uZ7zS4=;
        b=ogtHURrTNT9MrN7sNYjniIFDXth0Zn7gXyQd2MznHe0zRA2+eCBoqF56Mm74QjfoJp
         icJzNsXni5LbibYaUCa4MPDvPjl2HZm4OUIInHlnSS2XWqBoJYNuqob2+9aLnJsXtEoH
         ixOEb8K5VrLDedw22ygnS7SuR/dSi/K6IqMyAlLjAzh5snC4IFe8IoSrupPRXw4rLOqG
         BvbN1t7AK65MnZIJBZIHfnnuTofujmFbXmhgnvnvS/PmeZ711MuWcpSOxf9GG5xNZXc1
         A3ysVDJSREhFHb65+G76y/9K93acGnFJ2bnhdfNXbTnxwj55Iuc5oQ4EYormdOt7PsB4
         rvPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU5iUyO74L4SvqoRbhtfKPzTuOadUQGh0TSrjE9Czp9BNfAbiP2
	Fl5GVOXHQvuRPckcNgAjWWg=
X-Google-Smtp-Source: APXvYqzE1Ff+ELHi4EituTfVarYksMQJe049AUTWZxqaOaLcDUjomhlO57I+cEMnOpHqNWaDKf5fpg==
X-Received: by 2002:a2e:5517:: with SMTP id j23mr3633262ljb.5.1557436052353;
        Thu, 09 May 2019 14:07:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:96ce:: with SMTP id d14ls390499ljj.5.gmail; Thu, 09 May
 2019 14:07:31 -0700 (PDT)
X-Received: by 2002:a2e:1293:: with SMTP id 19mr3611695ljs.120.1557436051832;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557436051; cv=none;
        d=google.com; s=arc-20160816;
        b=FmJtr2d9h3Ide3nxEVLruJfKI5sFsEmBK4/C+souACKjgtQlimObD343VLMNLYMoFp
         O6EC/CsblmhmpeEXjZJsxY3SqeDFNH/KlBAFVkUh3a0ZsIgn18NHcY3MSE0LE/lDkd/j
         lO4gW9nmV7XdehlbnU13CrQwDWA5GJIEprAAqZ1knmAHXM7r5JEunj3LDwGaLNKc7R2s
         DmBdKz/yTpYIyNEsgAVL2Tnv3IztQn8kEdW5Eu05xKqJw1+zhVa+V+ZZRvFfQt7yEmm2
         i5Ht5z9FktWJjxb8G5gk+CHsQ+OfqQtgxKuHbXTSfjlOxUEoGwVX/t2FxF3pIb+V+/C5
         6FRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=smGwJ9neRvRCPjw9KP6eZVzHnuajVc7GVHf8c2FZ9hg=;
        b=X3XyrgYICoGt/Y23Dod5z4L3EkJsOUyY21gxRnEHCDKTvH7xbUVbPeo7vHZ4ZtrBMW
         zGJnmOxBON/mMWeMU6913CuImc47hc0tk30YnAlkzSApF1UQmDYfGqZJIGHep5tj7MXM
         +CengTnNcIHN1l9W4hjChqZ79rfvMvx6G6YEKmCwBc94Fkl2ghlQmYzTWjcQUdM1/9ga
         vp0WOMrKY1KUkvE2ksGygOb61xIX009lrs2Cu0yKpY0Y1LY95KFiYC2Qv31BQcK0hDq/
         /iab6sg6bT7YM2bCJ6k+mjbssOfM7I6sJrTm2N6+1n+RoaxMISJcQb+JAHBuhkzUMOWq
         egmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id c22si781066lfh.5.2019.05.09.14.07.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450QsG5HKLzyBS;
	Thu,  9 May 2019 23:07:30 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC PATCH 3/4] inmates: x86: introduce a common assembler entry point
Date: Thu,  9 May 2019 23:07:25 +0200
Message-Id: <20190509210726.23168-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.210016, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0,
 __URI_NO_WWW 0, __URI_NS '
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
 inmates/lib/x86/header-32.S     | 22 +++---------
 inmates/lib/x86/header-64.S     | 22 +++---------
 inmates/lib/x86/header-common.S | 64 +++++++++++++++++++++++++++++++++
 inmates/lib/x86/inmate.lds      |  5 ++-
 5 files changed, 81 insertions(+), 39 deletions(-)
 create mode 100644 inmates/lib/x86/header-common.S

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index e4ae6b7e..9a7292c2 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := ioapic.o printk.o setup.o smp.o uart.o
+TARGETS := header-common.o ioapic.o printk.o setup.o smp.o uart.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_64_ONLY := int.o mem.o pci.o timing.o
@@ -57,7 +57,10 @@ $(obj)/lib32.a: $(lib32-y)
 
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
index 006cce9a..d789e5f5 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -39,22 +39,10 @@
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
-start32:
+	.section ".boot", "ax"
+	.globl x86_start
+x86_start:
 	mov %cr4,%eax
 	or $X86_CR4_PSE,%eax
 	mov %eax,%cr4
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
index cb886b8e..2ccbd169 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -39,22 +39,10 @@
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
-start32:
+	.section ".boot", "ax"
+	.globl x86_start
+x86_start:
 	mov %cr4,%eax
 	or $X86_CR4_PAE,%eax
 	mov %eax,%cr4
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
index 00000000..ffede16c
--- /dev/null
+++ b/inmates/lib/x86/header-common.S
@@ -0,0 +1,64 @@
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
+start32:
+	jmp x86_start
+
+	.section ".boot", "ax"
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509210726.23168-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
