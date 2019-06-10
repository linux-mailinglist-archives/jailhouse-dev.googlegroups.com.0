Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR6D7PTQKGQEJBDHWHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F1C3BFB1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:36 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id r21sf7958491edp.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207816; cv=pass;
        d=google.com; s=arc-20160816;
        b=z6ZxEHUHwx/qXh946/DdoY6jfPg0hE9f7lZrWIqhtuJjQV4Wsj5nnodfWZAvVtipyi
         0uKeQICC+6GqcDYSbhc4smK2PAvDa62PtwCFP/YnQeSsujvhWfLGcHV4Ou2K4emsKA1/
         8NOSzni6qrAAZancXIDbU7zhp2fhrGJeyzZpYOndsWHaO/oUNqRrCJMaw2uXjmxHHPiq
         IIsgnHRTmyuwp6TtA+seLYZh2eaJyzM0zuLUXN3j71mj8DoK95tD1Q880L+Hs6ZF9Txa
         2EGwBd8EUPqB8BBpSRVglL7TcFHh9Pfxd5bBPFZ6Z592t1KtDy2ccZmniThF/ifbjtTw
         IQrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=xUObAHPcDKGf6PftPBFCELiQcaSP9F8drVUqKhfGMzA=;
        b=HTCkZFASJc4Rm+UcwRcI7YIKakNHcbRsu5jraszYj5vB+TDuXERxar9M9bfXRnD8AX
         IBzMl+onqtVuPGb4cY5xiwF99IL/7b0OeiC80gHUkE8TTbE+P1JK+macwHEn6nlPr6Xy
         hoEa0cWV2smst9TAQVS1PNJCbrhQ/d77SM5Ga6MBvC1CQsWcSzZzz0gQDGR00C5Wmgaa
         SH7dFr5jfaD1UhDu1HZJV4o+5ZRUWgE6eTZIh9IqP9atWmK+ZVgWp7NJkNxAXNN+Vrwj
         MZ4FpaZbMAAv3GrwyZJZOaM0VY63y18DBB9XHUGGA7jRtIhPY7V1r/TQJJbPdc0rA/Tw
         y0Ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xUObAHPcDKGf6PftPBFCELiQcaSP9F8drVUqKhfGMzA=;
        b=PmV7DWiMrKNqvjC110R3JPtBwIT2RENWlQqmMcjfFXY6O9lBX3MzwudLJCGzN6sRvt
         O8obPFPSYJn2Hwv79gs7PGB5OY1GgfsQzRzlzU67gyjTJkh1yINN6P435bkav3UqM2gu
         O7gfgHwYFLJSdQCAjgFHC47pUI/f+b91GjtAbCkHfl57PPJBn6ixP1Y6ZZVO+6vOWXk7
         m9ZPlOFhL0ZU2JITjOwMCMcw8LKh/SpxlAWJWwio/U6wVEv9hV8cF1sYqZHd8K8ALK5+
         2QTnCIJ/JYgNVRkcaD33Yg5cofILnyfVwQNu7Wvc2SSVu0QLW5EGgJ1eWGO9kzDoSxsO
         CgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xUObAHPcDKGf6PftPBFCELiQcaSP9F8drVUqKhfGMzA=;
        b=lm99uH52Q8rAkFgeBeGNH6PxLXhNtFwFoUJPAYHZD1Lqf+1x8pMfGZqbUEFOrh0XqP
         zeyVlseq9k3jYY6tBrgfKzR90UfpMoytqyfuaIBQXHLx0l3nMqpX/jLunlDD77M74D+3
         z/Uxofz84A4Z0BEjcnfW9jGTw9B1mY/M83Pc3BII3/2SaCIf9OlmG6ogwM2qDHY8dBY/
         5vkJ17rSfppfXSvh36noLy4Yx5t7ZUF+4lxU/XTR8dVMcKaFRYhlOlHOA+l+VewFOaog
         SLODMR+WG1c4nEaLKYdKnY+5YNfhg6jhlU3geNAM9NfCDQN6kppvLQMxP1kNTt63zmVQ
         FpMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVmYMkOLEWZHJXX42i4K/LxcBYtL9aeG5Rw1B0YJBmadYfU9puh
	17caFWYaEIgmim2cNT/WD/c=
X-Google-Smtp-Source: APXvYqxui/UF5ad+G6A4/FXzYBhaRTs4fVpbcnXBXAUBq4K71SSSg57M/zILdR+lJJHjv3RPZOaZFQ==
X-Received: by 2002:aa7:c5d2:: with SMTP id h18mr75656526eds.110.1560207815913;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls5093652edx.9.gmail; Mon, 10 Jun
 2019 16:03:35 -0700 (PDT)
X-Received: by 2002:a50:ac07:: with SMTP id v7mr30463297edc.205.1560207815459;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207815; cv=none;
        d=google.com; s=arc-20160816;
        b=VCmpMgc3qZnaOHcL/fUTVpY9ZAGiuhL798f1G4G3chSkvaG98ljChGJlvV9gp/t5RV
         FYOOT4Em44buTeoqyNZBW8odGPIRx0K3pFLMUodrj1XJy2kAJzNUC0jyXIQCIGt69A9N
         JGnmR47OjH68EQqHDvLzoIUsoruY31jbYfebJeyWKlFZt1lhDkkAqYWEuarVY5gOLC8p
         uudicALaseTmH1rAWbHuiYsEN9I0wftoadpz8DcINzXXX3d9myJ3Ld6+pouGVLRXr7ns
         SwB7lHGTMFKJNTpVmCtmv1xTI5khLE3IVrwexovjwJe10xRJVAQD6wI6LH4ENyCu5rm3
         i5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SKhqMvmGXD6l7dTElMLLVtCXGpTatDN29mIpJA3meW4=;
        b=zS6mbZFsruVXf9TH4hiZMyDapmESbHp7MTNQ8pvtdtxw4mZ/pCYmAZGbRo3YDimLh8
         E+yzaHOD8vcGP5DKK+QA4WbOa4dNEDFOi6iLSYE5EpJ7T/elCvYK2cFE7+VTHC+t7I/+
         KfNiH33PTebT6HZNz/+2kfZpcWiOtURuhnC0GQYGjnhFmlT10CdtgKMCSsnjXrmfkJjC
         8uoKpD0c7aWTajDAh+dpwJpTHHxyHS7oeuKwxoGpKbVc+edCC1/LAL87rPOK/tamPt5A
         A38AwrPwsrtzcAzzPy2htpQ2itS2m2fsty/sKo4gl55Z5pYULdxIrRb2R2kRtSgY6OpO
         BNkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id r19si596996edy.5.2019.06.10.16.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wQ6mtvzy9v;
	Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 06/10] inmates: Add string.h
Date: Tue, 11 Jun 2019 01:03:26 +0200
Message-Id: <20190610230330.21419-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

We will need it at another spot, let's share definitions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/arm64/include/asm/sysregs.h |  5 ++--
 inmates/lib/include/string.h            | 40 +++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 inmates/lib/include/string.h

diff --git a/inmates/lib/arm64/include/asm/sysregs.h b/inmates/lib/arm64/include/asm/sysregs.h
index e30f0b7e..8065b89d 100644
--- a/inmates/lib/arm64/include/asm/sysregs.h
+++ b/inmates/lib/arm64/include/asm/sysregs.h
@@ -41,6 +41,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <string.h>
+
 #define SCTLR_EL1_I	(1 << 12)
 #define SCTLR_EL1_C	(1 << 2)
 #define SCTLR_EL1_M	(1 << 0)
@@ -83,9 +85,6 @@
 #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
 
-#define __stringify_1(x...)     #x
-#define __stringify(x...)       __stringify_1(x)
-
 #define SYSREG_32(op1, crn, crm, op2)	s3_##op1 ##_##crn ##_##crm ##_##op2
 
 #define arm_write_sysreg(sysreg, val) \
diff --git a/inmates/lib/include/string.h b/inmates/lib/include/string.h
new file mode 100644
index 00000000..29f5e2db
--- /dev/null
+++ b/inmates/lib/include/string.h
@@ -0,0 +1,40 @@
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
+#define __stringify_1(x...)     #x
+#define __stringify(x...)       __stringify_1(x)
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-7-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
