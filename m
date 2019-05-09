Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBE5N2LTAKGQEIJWLEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A09C19415
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 23:07:31 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id v5sf2905208wrn.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557436051; cv=pass;
        d=google.com; s=arc-20160816;
        b=EBTx3zdLQyJb/Q/F9KFwN30uzcMwHd9ILOmOujdZ8C8NZGS2K6ugMKQbRJh79IPkBS
         fuxX8zDE24snp1UFmeePiGyyOfgltfSbnuav0BO4w+YIoV6HVVqIuAeZghOCPj8ay9XH
         V9N2MEecfLqwEHQ6aC13A3iXVUILkcdl8yIsEySMomv2GwpLn7rx4evjo1gURZzAXroB
         LTy4Q6ImFMrwsYJ/fLEfYG2Ofr/EN/YjHUUjo1BlpTCUJlJtL3QvbZCXHR9zR/wz0wZ2
         bKEQFVBFheqvG/7YQKg2dU2xKV1B4RgsEqURQvMPWRoxU3gGbghf25Q8UBLG/pnmY7zp
         7oWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=cZSuhiQki4NutBboWL4GcQVxwER7ob4lI2Urbjnw3rg=;
        b=YHhy09nNSw6hVZ6XgCN3Mgv0F5IXWA9o1/3icroPb2so4v9UiiSEgmDju9OPyx0iOk
         QpXbMgxPnud9wxv4+VCAQ9tfmRtdArxmyAf47kRnKSprxmfYmPYRkVyIcw05pWm0jWA2
         ukT7EtYOR8kuixNPgsjAlFXvImINcahRJt0r+v649eS5N5yVdl9tkK6VEY+Qlq/mk4MD
         jWaeaAi4c0IxCG7t+7336x8/3lB5Km75b9gCdweDXvs4VWlfFnQYOMbZw1Sir6oqH+jl
         zgx9zmYSuExmOHyrU8C3f5D0zkckJ7fhpeI07blDy+UTJzfPGBIUND4iBny9j8etJMel
         LbAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cZSuhiQki4NutBboWL4GcQVxwER7ob4lI2Urbjnw3rg=;
        b=IqjM0iylyVz6blPlOMxzbawXEaug4c4Hte7gmIQ+n84NQlWw/bXPF9gh+P3xxsiJnW
         1RKuoF6sFyJSeNh/xugB9RWgHcPDxnh9yPTYVnhhsnQqu3k9baelkqbcoTG5HvFW7Bvj
         tqqARkHaXnATG4HBxL6yCWZyrEH4sB/qInIjJJdrtVkZ0T9oEJrmCjbFdQ6pWva2C/4h
         PDSVAglBhqOTUWysNlDuWM42szfId7iVJINi9Fz4evHYhFfpjXUa/zZwih7+Ma9S30ZI
         WOVlVDxIapdhxWRaGzw3Jua69cdLz1r3C97aPjusF7HXj9KjfX5pR5rI4IiJG/Fvm/SB
         IXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cZSuhiQki4NutBboWL4GcQVxwER7ob4lI2Urbjnw3rg=;
        b=NxEkjFKtqt/8rwn4eWTsh/3KYs6hTzS4RFwnPTF/fzuwTJ36y3Xadc3XaHma8tX89s
         gwPSLl9YTHMJ4z9Dnlxb31XGBeLba3sMeYRDmB+Uqrmg+jgTrwftTN1sHtOk021wCJAN
         xjjFIPBFK8NkW0hUDYMFOW4zsnMnzaAxhiITG0up+nsHJbrhSJM3bwQ9ZWCG/W+0oKwI
         LFYYz4KMUb8bE45ku1oF+hnJu07MmJ1qrZYzqbls0ImK9n4/cxhk0kDOp8R/7zfIHI2k
         yxRYw8UYSkuOMkBg2aoSKKJ6/FWnQl3p7BfZVLVQEITRJO/e6QCEe9KMIveDdNU6zncZ
         VJxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUq+F9iHhthAkgT7JbpSFm2gdfVPLRiiups6UV/qpWgAj91LDwt
	oKsZSEqZk4itvvdML6Xj5Wg=
X-Google-Smtp-Source: APXvYqwS9kcww91z7Cm8TQwxakwsJPOEb1S/57rpN0s2qTRIsznnqv6Cw8hCumDdJzhpLEPzbhWPiQ==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr4335171wmj.24.1557436051136;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b642:: with SMTP id i2ls846298wre.13.gmail; Thu, 09 May
 2019 14:07:30 -0700 (PDT)
X-Received: by 2002:adf:b447:: with SMTP id v7mr2410570wrd.267.1557436050758;
        Thu, 09 May 2019 14:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557436050; cv=none;
        d=google.com; s=arc-20160816;
        b=QHPLrECaTHE7ZUCDKfVjzdduFRFrQUo+b1tUApVpL8/lC5+MeL1Hi4/h47aU6jKbPh
         SUzvQ+e/L3luXQ3ytpVZ83Kr/a6mWRNC+FRnPJF2F39sPwizzyC/isOprRRtqp07U42g
         3ki5suJCnFkDyd6nnnT+rR57BroKUOYz8Y9DZIU8Ve/L3uTu07Hr36CJ28Bzy8xJDIqC
         gFoLLsvYY7HFKvAylCq590h9NgmD984xB9aNzuJ8KojozOtvL3V2v4JNLablMi335QiG
         +gM+PS3h9gc24wtqRn9CUOlrQ31ZqmbmF1JB43/w39Bi74whmEjN8IH1pb9/PFxxLx+X
         KwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JASwwQYZ1RGGNJfSQeM/vOJklvCrRCHQuGHC9bDoqVM=;
        b=ml5wtwurwlLiYC30zS9OgFerigGZH274jfut0ckovaHmDxgkTM6qaV3PrNgxmuV7QG
         fAn+KYoeaJACjAQHTs6cy+HoyCpm+Xgibi6sLckvuSk0ntfSD3IXsMPXzbP879KTn2UX
         /SLFYVzoFaBaQHX7KDvSGUa5G1wjwj4cPhf3PI/RopkS+GxL/5xaxZC0Lbo69zXrmyvo
         1ZVosGKX4Xcbf4LX9zTlOMmtNlH+V6C1PXc+QvCO5xW0q7Fa7E6Nh5T+DCNvq6g+oZw8
         HR0wVbDRq0g6s2dl0Z6oEgTSBDQtDZE3W8CY9yqDpL+EF9bRxSFM59/gBNHmLLLGmlSn
         wbkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x18si813577wmh.2.2019.05.09.14.07.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450QsG2VQ3zyBH;
	Thu,  9 May 2019 23:07:30 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC PATCH 1/4] inmates: x86: consolidate register definitions
Date: Thu,  9 May 2019 23:07:23 +0200
Message-Id: <20190509210726.23168-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.210016, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

More duplicate register definitions are upcoming, consolidate them
first.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/header-32.S        | 10 +-----
 inmates/lib/x86/header.S           | 13 +-------
 inmates/lib/x86/include/asm/regs.h | 50 ++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 21 deletions(-)
 create mode 100644 inmates/lib/x86/include/asm/regs.h

diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index 6ea8da38..006cce9a 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -37,15 +37,7 @@
  */
 
 #include <inmate.h>
-
-#define X86_CR0_PE		0x00000001
-#define X86_CR0_WP		0x00010000
-#define X86_CR0_PG		0x80000000
-
-#define X86_CR4_PSE		0x00000010
-
-#define MSR_MTRR_DEF_TYPE	0x000002ff
-#define MTRR_ENABLE		0x00000800
+#include <asm/regs.h>
 
 	.code16
 	.section ".boot", "ax"
diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header.S
index 1df4345b..cb886b8e 100644
--- a/inmates/lib/x86/header.S
+++ b/inmates/lib/x86/header.S
@@ -37,18 +37,7 @@
  */
 
 #include <inmate.h>
-
-#define X86_CR0_PE		0x00000001
-#define X86_CR0_WP		0x00010000
-#define X86_CR0_PG		0x80000000
-
-#define X86_CR4_PAE		0x00000020
-
-#define MSR_EFER		0xc0000080
-#define EFER_LME		0x00000100
-
-#define MSR_MTRR_DEF_TYPE	0x000002ff
-#define MTRR_ENABLE		0x00000800
+#include <asm/regs.h>
 
 	.code16
 	.section ".boot", "ax"
diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
new file mode 100644
index 00000000..a004fdd2
--- /dev/null
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -0,0 +1,50 @@
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
+#define X86_CR0_PE		0x00000001
+#define X86_CR0_WP		0x00010000
+#define X86_CR0_PG		0x80000000
+
+#define X86_CR4_PAE		0x00000020
+#define X86_CR4_PSE		0x00000010
+
+#define MSR_EFER		0xc0000080
+#define EFER_LME		0x00000100
+
+#define MSR_MTRR_DEF_TYPE	0x000002ff
+#define MTRR_ENABLE		0x00000800
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509210726.23168-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
