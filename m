Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR6D7PTQKGQEJBDHWHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CAD3BFB0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id n7sf100641wma.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207815; cv=pass;
        d=google.com; s=arc-20160816;
        b=01L+f467dzgycmseTsE0eO0dm036L98OGV6/E1K5fNb9EHqYGDVazOP5BTHOvMQ0MK
         Wn9BZrxah7/IVqmYLJS3EaB2fin6Er6d3vfwRdr3hwlkctI5TaBOgWsqz6Ojc7TS2EzV
         4tFv4eFb7TZHSLOmfq7c1uBKlMZrbMbvj+dS7wuOEaiKG4arjnMNeBiv/S3NSkBHSBbx
         MtL7zC6gUFoGPXv7yjz4sa49G1o9IU7yZAT5SGQyyae96PCnVUOyqXsOoz/az23a9DP5
         uSP93VehExBHl+chPr/LUiw/9rfG3+rBVissrOQoOYB11pYKjUSWvAxoQNynLo2Sj1zZ
         6hEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=S1m4CCaMpj9Mrs4jX6GERGTd53zAiJ84EtwtjLHAU8o=;
        b=VAOPey98Qlhe2B/OP1f5Zc80At/wlm+atXvPpkiZ1MlC3IjEZnnl5TlG443zD9pe+m
         hetfZAPonQ/dfpncDVzz2MxY1SbNspfk7d+CE9aePVYv054JLtXaivVbl+URIUZE9hKx
         7AfbxmZfeI9RS1oFSvKXy/I7Pnbul2q4rzGoLnimVf8gMwadbUYiRN6/ijY2yaInKHKC
         3GB2dXpZ5lt0Q0ANpdiasknuuEVS3/vBibW34zCvkWxkg4wg/dCzgoaurOi9uuZMXHoI
         uwPtDDfzJP0GgGtubBwhPwprjovbTNL4OEykY2T7ggJNmLVo8VVWhtqO83KFkqv8jQfn
         49pA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S1m4CCaMpj9Mrs4jX6GERGTd53zAiJ84EtwtjLHAU8o=;
        b=aC1sV8+hmU/Hb+1S9KOU/1uyMzXSB7rNy2A+ruba2LqqqcTCU3IBQFDycvasIp13WF
         TtLccNUpddb2fn45+x9lWG4QpRYV4Cwdfsi8HY5ROQRc14z5sm0kUSs9bWuOQopvpmvQ
         GjNMki3tMVZiz7RBJaE+2pt+VzwWB49Ka+jJRMzH0L3WAFnx6H7Fu+5IpkUNo8+6/uZ6
         aj3TIZI9FUqOTNT5RFpgEIAqHTZb30zzd7ouj29MK4hyK9XcE7ijwoK6uVsS6XHPho/4
         DPS4DrGPADizabbDt7yJ5Bs0Jea6B5NdeQKVZRiU+O4XypZZnii3LW3X2xhaVs0SlXdn
         Nr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S1m4CCaMpj9Mrs4jX6GERGTd53zAiJ84EtwtjLHAU8o=;
        b=jrOMfDIpaYpg/R4fMaLbUYG7y4dys2DJeLrD4a3YKayUuYT9OOPX9e2lkPNdQim9Lj
         l+XKcfOAYIQs1NVAhGHwDECfuT7euP4Fwp1l5FEKVlguvbF/t7v/WR/Iu/a2wQWk6X67
         5adz79q+uwExP1srUYqCnf2jOIVY3SfOiSRCCZyxOuzVt7LyecnkKEt/a83GGOfzTNA7
         WKSG4LxiIOZG0OIewG5xanbCKjjapr8ixWiVz8Fibcp6QtSo5GMFsTIGEOlevl0HXvCc
         XvzF0k2s8aeWyasPohNtb5SmUtYdPLWFmcfIUm0EAjv5nucJy8Ht8+L55VAslU04wnFQ
         7b4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWisBi1biPv4sCPzTrt/Sl2nGr9byzzXyPszMCYRlcGftOfE30/
	NZQUX5m5uTqf7UN49ljf764=
X-Google-Smtp-Source: APXvYqxAIedqbERG7OIkShGuTDi6BHt55c9OD7RPl9fUABwi7iJhkmKvGOC2RpJzQRHDfTrt6u5KKw==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr27061021wrw.309.1560207815394;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5301:: with SMTP id e1ls4044583wrv.13.gmail; Mon, 10 Jun
 2019 16:03:35 -0700 (PDT)
X-Received: by 2002:a5d:6190:: with SMTP id j16mr389222wru.49.1560207815028;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207815; cv=none;
        d=google.com; s=arc-20160816;
        b=WUdLzKWoG2NwQ3WgYUL6SkvVOXh80OE50I2e76SW3wxo1R+Q0Byu6ICPc+Bt/U8Aef
         wq9zLeGkvVZMnzh5IrWmnPfokE8cG6vAsQpbrZWjzS4L70yraPBGIcStKTjwnok9gfuj
         d6xf8bHvssdREUdVriWGUxAvA/jgKd9o0w41sowCFclkEArFBuuy9e0jDh2SRCKTU6FM
         sorTFQ9OO7b7gO5GuRX7LYRkoWFm92wfSfQ1uR/z0+94fudgodODvxmIGuCVB6zhuXvx
         Gc1LnPCfhKRZleU3qRsUF79X4UNDRekvwmsi2JjyQPQ65TyqXLfEduNkxInrD7O7GvIt
         rqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ALuSE6hBZRWUIObLE49lAoM0c5+ZVRyFSe5MFoPqPqE=;
        b=mRSGvhc31kqsoGxZBjUciYr6mtAQ/P7VlpMmApN8Gnm0H/skp/12/iqnyYjE65vvqt
         GRVhF46LxFRChrm+R28byjdHxvlKT7NwVMMAeZPHNIT52YQtepjFNp6GRmuX2ynSlpqq
         T0iBfY15UZpFRswpCFnwqXimIkyzE8KyGxVIzIxYtExnVSUo/CCwabCKavV8eJ5ooD3R
         NKgR00tr9U5a8dnDEcaJ0D3JLHjsj1rn0p+UVLhgpxU354vEFUV/Dsfmu30G4X4w84aw
         10TJybyYpnLVt5uMBQruap47hLl6WG0qrDkfzOrM4r/5PHD20xjP44CQXPTaEnJmAMC0
         XtDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h10si517586wrv.3.2019.06.10.16.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wQ4bmqzy96;
	Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 05/10] inmates: x86: introduce a common assembler entry point
Date: Tue, 11 Jun 2019 01:03:25 +0200
Message-Id: <20190610230330.21419-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
 inmates/lib/x86/Makefile        |  7 +++--
 inmates/lib/x86/header-32.S     | 17 ++--------
 inmates/lib/x86/header-64.S     | 17 ++--------
 inmates/lib/x86/header-common.S | 56 +++++++++++++++++++++++++++++++++
 inmates/lib/x86/inmate.lds      |  5 ++-
 5 files changed, 71 insertions(+), 31 deletions(-)
 create mode 100644 inmates/lib/x86/header-common.S

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index f54160de..6a47132a 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib
 
 always := lib.a lib32.a
 
-TARGETS := excp.o int.o ioapic.o printk.o setup.o uart.o
+TARGETS := excp.o header-common.o int.o ioapic.o printk.o setup.o uart.o
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
index a0f2d878..50001b22 100644
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
@@ -140,6 +128,7 @@ loader_gdt:
 	.quad	0x00af9b000000ffff
 	.quad	0x00cf93000000ffff
 
+	.globl gdt_ptr
 gdt_ptr:
 	.short	gdt_ptr - loader_gdt - 1
 	.long	loader_gdt
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index 978decb3..8e49d326 100644
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
@@ -142,6 +130,7 @@ gdt:
 	.quad	0x00c09b000000ffff
 	.quad	0x00af9b000000ffff
 
+	.globl gdt_ptr
 gdt_ptr:
 	.short	gdt_ptr - gdt - 1
 	.long	gdt
diff --git a/inmates/lib/x86/header-common.S b/inmates/lib/x86/header-common.S
new file mode 100644
index 00000000..d40d8d5e
--- /dev/null
+++ b/inmates/lib/x86/header-common.S
@@ -0,0 +1,56 @@
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-6-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
