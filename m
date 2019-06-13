Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZWYRLUAKGQE54OSEQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC544CE0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id s18sf58511wru.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456294; cv=pass;
        d=google.com; s=arc-20160816;
        b=aIcF3+zQFjZSXqRN9VFgNHZOlEATBtaE1HPPEmxA2YjokOMfWfQ2n+MHOggiEaShRA
         OGCJc3qBqr3lx8QDJK7xAhRs/DwlmJaedu/wx14JFpWmmpyv1nrg8jgLC9Sj9niOShf5
         Q8yG0Yq2/eflPSPgslXrpIUADlJfMw9r8FhCosgumjDuuF7nDtcJb4KPPnsTJbHyfgYj
         QHKFwtDDvBxzaQYAsHdkk+Ptyp6eOFEYQtF+gz+m7v3XmJl9A/xraDv73ctJ6aaspnk5
         UJ8jv0BH7PJG1r/Mxdu+U2kCDyrWEiiOntJVgAQDEDMzwXvZOLvj5+cSpAS2BHrRQzuu
         YRAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kWKLarz5iMuJU8DOS+ubGLkdF/fQq7x9nOiBC2u3Xh8=;
        b=kqTN1s+p2ui0il/INUlJqbHDfT/WaQuq5Z9tZ2K7Sb1QveXw5YNW86Wuub3mn7xXr8
         xcsBHapEDHddK2TPH26XzjdnxYRktYZO4N0+uHdGPiknACRDVBJ05RTu7+jR6FcL+pzQ
         hVxUk5RDmr3lYELifxuskVVgEGGpfjdBR6UrEQ3NJQ8MnBgd7HqwUhc4d2PZOsTjHoIv
         trOJcIz3KQkKfErx+Vts/RtlpLMOmE2/dwdGZksNRoBoxEHg+aN4fsKeOcF4c7LNCccU
         aCpxXbYaOY6j7fa9/B98LEtGYUVthmbyq18qu59C/W/d4iQmG78amAMrd4xxXIlr9oaX
         G+JA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kWKLarz5iMuJU8DOS+ubGLkdF/fQq7x9nOiBC2u3Xh8=;
        b=RnNiQl148DqLH+zNMIwyslXZzSkfJBXFn/ybe8c7BRMvPFKI+XoHoS5Xm4t26seic1
         c9BXrw/rByXzbZJPQ0eTdqBEevExlUnielrW6l0KT2GtFNg7aswTCejnGRdTgmSzb+ZA
         kGKIgVclJa6cgOk1D3jAD1eu8XymFf+h3fbdaS3WhPaJBmCj6G5p50xOqR73nkpiyGEM
         w2gBb068pW4+rcfcBSfvMufLiQa090sLsac+C0Sv7frRL1FvPNjAXZ66035QYXD/kO7n
         wvj+MUPCZAhfC+A/kvPLQG0smI2rGVP4okozMD9TWICEY9l+xNqIjRafsbuWDdGdLNq5
         ZRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kWKLarz5iMuJU8DOS+ubGLkdF/fQq7x9nOiBC2u3Xh8=;
        b=sprKTZe4rsQW8qcE/+tXvNkbZmXvRLTuJJVsSyHsGfO5uLxrIPwaayQAXdX3n8e4Gc
         BEoXRv+RvlSE9JoPXWdBJDIl0v/VIzKjw8n1hk6iGCUiCrtesSb6pefEHL3l9f+QOqEe
         HltiwDNuvZKp8OD5i4qVESnPodXohG3N83QxxkLeHfba87wAzZjPmnSDv9ZthHEovHOU
         hKDRDXdTerj7Iz30sDEPJdP987HE41tLbxmw8JKnTqK5cWyJVdARtxD9BVmK6HqxfIR4
         k3qRz0Hl98/Qa0dpaYPVP+lmutBjVBYBNr3Ozck/limgzn9KFWOsWbx5E8VB56JO4L+w
         mojQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVKAI9TtritPO1mHF8xlR890EiyNoV6mOJfT/6GDVOaZYzA/CS+
	tYKCWlIYnO1JQNwk9vFO35o=
X-Google-Smtp-Source: APXvYqwVM+YTd9NvqAbtQGq5Wj0kQqsLQPwcYUhCgsjBJs9+JTOMUBkNkxmoruxXqN4WX16gZH9/kA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr61776383wrn.204.1560456294188;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edce:: with SMTP id v14ls1663621wro.4.gmail; Thu, 13 Jun
 2019 13:04:53 -0700 (PDT)
X-Received: by 2002:a5d:6212:: with SMTP id y18mr13322577wru.178.1560456293727;
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456293; cv=none;
        d=google.com; s=arc-20160816;
        b=YVzUPBDJmdH+LxcMGM5Ht+TLrZswEf24GUMwlHQY2jl5CP+l475eojH4KNpOfUYNYE
         C3G1y7hT0oAHu2XhMOZ5EKlOLwa5iHwfOqaiUbWvlOjbG07+dB3qzxM82ZlS3rxGwkgG
         q/6+gTGawYcMcotkohn1qJyay6DJIkEcjsiZsAJyoiP7lUftaSv5N6qmj/8Ou8Ia3gcD
         I3kE2wjBE/XVNfTaRrcMyhklrZbEk0xqDZmClDRfzuk4nnnT1ca3V6A/kG1Q3nBOVDpl
         sq12iQm1ybbV0n2nGt32zizyRSaDgqZWuWyXtJInbAi+LrME1QUm/I0kDEtn/PogI22h
         hJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LvWMByaZP8laeVzMhS6c8A3LzW8CvTSHuV3YOmGxaDc=;
        b=oA5ufjFcwbTrhoPjGwLIVByhb5X3hYcg62aG6j4N77PmAUCBE81IA70S8fBJai7bJ3
         AgyEON25rCARF5iBoMUOSknaDcp6LnPLAfOCHOjwH3uuUoPZoJSKgkAnEjDEbq1LzLN+
         x2ofABClEjn4QbQViv5AMa+2f83L4XCQ1Xjs25vrdITUPjoXEc9Rxlt2lubJdGXJhMCj
         5+i+rclA/kvQbVxpDNfol7c10eFE7lt7UGyThBUFtlVScqFZpQP49C8GES2VW21MxZLm
         /sBD/625Z8ScKjLX9yPiEP9VPEkqBQ8Dz5i67P0FhPSG3X3++R9XGwzayCygYpsGVlsb
         r8aQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z11si22013wmc.2.2019.06.13.13.04.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvps2GfQzy2b;
	Thu, 13 Jun 2019 22:04:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 3/8] inmates: x86: introduce a common assembler entry point
Date: Thu, 13 Jun 2019 22:04:37 +0200
Message-Id: <20190613200442.18984-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
