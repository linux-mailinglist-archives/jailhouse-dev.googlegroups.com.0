Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZWYRLUAKGQE54OSEQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB044CE2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 22:04:54 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id n49sf309240edd.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560456294; cv=pass;
        d=google.com; s=arc-20160816;
        b=FNaCz3WsnYD05Jyd0u04OSM32wB8F1vtB/SoDV4bSLRtdzJvIWmkJOCa8ZSqK3MLWj
         GMnKEuZstOoT3d4cWd+6+TKKPEQk+6VbY67MWMi6ft8CnyUGjo3I6vShsoixZuC6xe0j
         Fse5kUkV7q5VMK5KWnYqJkKOQqSU+nNDLXKmobwH4Y7bS5KGt/1mzk5JwNyDNyLmyU9s
         QMNQLXjHis9KaAy8234oyR11Ewb8FK19i5BcivpL/KoQLEIQU4DNPT6005uechVZoPD1
         sQM27EDNFt9LRx3WWnXKoQuKaKKrY6Pu+mvCI6mz+GTNCJra+D/b25u1OYpPF9xxfUu2
         poAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YD7ox9jqtYMz/PIqSupiFjiFCNtRXL6rK+g5rameNY0=;
        b=NCw7RaRn1p+SeWVnm3gAeABwc4gXiAZ9hBfvMUxAbu9L13GK5I1V5HaW8OOkxTsnSP
         FJdP8UoTdwREwm5lzSnLKvVGPdBmZFSTwy/KIMCL6fyYAAgUmV5rUeqLpJqwewAEnIHB
         6ybgK81uFdANzo4g3sIyHh1TCyQkQRFAM7aNQIR44jidClka/1y2cxYdHCOR5tTPJaMa
         McOCIriPd6SaCpsWGCkv8l1Yp9DF5RMo1UTMJeE9zHVg05LoLbLk4oldavPYQsgawlVp
         tQdl7/A35uBySN3Nod24p6+sPTIBNXCFTXrDNmV3bxarQTCfq1YmhF6iPFp6IC6y7dx4
         sKgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YD7ox9jqtYMz/PIqSupiFjiFCNtRXL6rK+g5rameNY0=;
        b=Bv5Qx+kJRf//5FaXbMkvfbVyX1+OkwpJMf2jGHGqOJ+FQlNwCgUZ4eGfAH8Hd9PN2w
         NzXjfQyrdaoOLeKK+eH9d19I+zzMJAGTsbLIZ1s/j96+1kEhYN8g6dWXNOswH5fGW/jA
         htdBy8vbIJL/9Mr9FJTOAB9ZvRT/4n4CaV10nlf4G7J/CS5hI3oHhIHz375AhlfMpUFM
         0nlsdNTj2q7ojpgO2XnfNywtt7Pr3XLfaYd2GGVvfQsmmYjhkNGl8ME0SsLF4U7YjNGh
         /3J833syNN3YJWokMWZy8aMeH36u+9Xg2lDnI5h+HVrPgZMh5Rs+KWP/zpe7Kc7lcSb4
         iEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YD7ox9jqtYMz/PIqSupiFjiFCNtRXL6rK+g5rameNY0=;
        b=kqHQKuEUe2pDvghcnN+hPJgMJA9yZOcbSwtVTTlpohNzoXiAtz3sYPSUlHWreMHA9P
         xTasywLqOunmq3Y+92ruOAJLJa7xwRklO8s2jWzxV/aT9dD2E/fufP17MkeEE9BOkNhn
         a1b1ZnXcPOSB80/upV4tubYB3GzBZJMnbUNxokggqRQVwsPUUZCpCaHRP4T32yEEJQwN
         AzxPpFfMq3CdXI5ZXgjGIprp6UbQ2dL3ULN7pYAzYZjmZXn3z5gBr5yVW9lSRT+OcTpz
         oe6GiUHGHlTgbpZaFqVgI+NeQNvJo2xb4bLcA9C0Sm4tO6DeWRrssmzFbRUfjJP18UlT
         s/7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPxTCCBZ5oBXS9z4WfblIRaRBtj1bKAfx3biXOaFa8mKwtaN3P
	YzLYe0lGr6za6awcezLjjdw=
X-Google-Smtp-Source: APXvYqy+ebYwXgAwmL7gicI0K+gX4Jz1VpZuQenG/opz0K2oPBgO2DReDIh9nA+oVSje7MIV+6/izQ==
X-Received: by 2002:a17:906:858f:: with SMTP id v15mr32966536ejx.252.1560456294493;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6c4:: with SMTP id v4ls1615565ejb.12.gmail; Thu, 13
 Jun 2019 13:04:54 -0700 (PDT)
X-Received: by 2002:a17:906:19c1:: with SMTP id h1mr77613846ejd.26.1560456294019;
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560456294; cv=none;
        d=google.com; s=arc-20160816;
        b=r8z6/aByEbrjZKwTtrbqa+AVFR+xJ6H96mBRrWNOd4zPWtzpl/d+6Up8YlkOHnHqZH
         DC5VnVzDyj48oGkuKiI01AqvGppnwbLM+/CXBVgi/LY7XA3osISMNZxKIdJ8NRWpRsUC
         I7JY7YHe67Bz1d5fPDT4VBJMEJj2zqZgR76Wf8lKqzRNkr1C2LJGjJCAL+ziIX2ZQvFQ
         7FItJCbq8Mj+VhqJXfoMNwlyebN7hhOv/+B1iyYV2bXwZWAZemXpvkWLS6T5H+MEo0yN
         /YH14tl8QJjcqqS0k/Fys6Af1dp3ug/s1yZ8Hk6jQKfV1KIfA3CXrWrRCqUj/Pwmqsv3
         jRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WR1mNMDrHK3PfFspoSWNVSgJUMaXsm2U8RLrl+Wz9Ds=;
        b=YVuSC634iqDpwmoO3KS3o9MHokG4I9mhAmWGcPtkP2UvBogKOPNUs8/fdPrK0nssKp
         KMvqh6nGalkr+xW451L1dvdHaRGZjVzR0l7N//WShz96c/3d1TqAaPBrJHKeoWdUCqzK
         ZxCHJbLAEBweIyQ2jyGSce9RGbLRRSa/n6BjgcHzShPiFC4UqnOuObuGPlxRqllf1X41
         7prDbFTSR55/bAk10yS3nX2/9NyW1bd5QXBhykizqCyfPwqzFlp12OoQTTCVL4Oo94f4
         Tf7AT8YExe7Mf+zuAuUOPY6zUXhPRro/T5H2Rp1KZaHBQXZUoRg8eVaBW3Bb10uvR+4L
         +BWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id r27si29035edd.4.2019.06.13.13.04.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 13:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pvps3zwMzy4D;
	Thu, 13 Jun 2019 22:04:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 4/8] inmates: Add string.h
Date: Thu, 13 Jun 2019 22:04:38 +0200
Message-Id: <20190613200442.18984-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
References: <20190613200442.18984-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.195416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.11.5630001
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613200442.18984-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
