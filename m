Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXF5T6RQMGQEVFKOKCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACF70A0E8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:00 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 2adb3069b0e04-4f01644f62esf2105710e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528860; cv=pass;
        d=google.com; s=arc-20160816;
        b=KK3b3lsNfjKZnnynO8IbllUKLUZjhMFxcKiIkUiQtJPzHjha7dny0c1RsYUtq9LD6Z
         kxR4hY9TBZDLVdsmN4vvNtUStWGcOajNmzeXBMeSvQy+dS83uFcq7vy2lowVgf/2z3OE
         LXjrA1xDqf9kMHRBWm9S4MITwaZtwAVnJ+gWBoS+rtcjdrsceG+/LVtO9tA5dsJL2a0E
         YtQmnqeQK93nFVNVSmkdtqOQyl7Ejc7aEIY/pS4JfZdB0vwAgg+uG8x4ItRuoMJjAdYx
         YnX3ec1TvR5ofc4LT5Z8BuKZdbhMFRkTQQHIeBzdFv0NGhF4OVBAu646oNPn7aPQ5q6b
         tyTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=gDxAyz7zJ7f0QlHpmxQ7B4y20hhFndBlGoL/Zk842Zo=;
        b=q1sFgnUAC2kHLILs2NflhMN6JSTUcitRfIemX5rlVw5W1573FbBXZGHXHFPx5qMP9g
         oqd7qCkohZ21g6ksME3dc5UJY+tYmROPHtQfped7JLEO/wCvsuSTkymd/Jac7mOMqxS9
         9bRowI6X7LowsaE6myq1g/zXipaCaMNVvcRGGLm1i/C9h8U7mEEr1u4PbqaSfzznx2ls
         QrdeoOa9O40j3RAHNBhV10Ym1LMx5pxXD3UlO5Ggl+YUN2nfLlotaG3ACNQVYAfdoJP0
         W4mrjrrW19EMPC/pjrADx/VWEOyZSMeMDCHf+sDDOT9NSYNBkOYq3YHj/AhN5xtAzs5J
         1EmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDxAyz7zJ7f0QlHpmxQ7B4y20hhFndBlGoL/Zk842Zo=;
        b=T8jCDBULKTfvX25E5c1EL/GIP8LiQq444l9IwH8pG0YOt5w03A43tQEk9HPI4jW9Uz
         zTN4qXQC8hnE1mRHqq0E0PkMwhApBPljUFKQjHPkxl/cS2BiEO6JJGA68kX20VuHl2mP
         KZShnn9Z+9XGxjWaDxJn3eT0C0+daz5EEi+Bn0DQePW9GJpH4su25aZ+5hIFQqvWSd4P
         cj5Zr6KwBCZsyhEMD3wRVpIPMZwl3S/NH8q4oMdcRVla1Yvr1ixz7qg5UaSt96W4b7+A
         yQewFxKo/nZNoF5kpMhY1KKxTBRViz4v/8xAXP6PHKnb8PTAaN5MvcpWoaJPNge37y3v
         laqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDxAyz7zJ7f0QlHpmxQ7B4y20hhFndBlGoL/Zk842Zo=;
        b=egGpN84oA1g0wR+xbKQpWSVeDVYZ4ByTeurJ8NpYKL0/r1m/I4xw2Fsv9nOhuymVL+
         d1404wRYIHafOsDDaxWb8+PhaNuRJnhoEPdKKCkXgtLEU5RraAtaWRH6AS5YJtvfL1jS
         TEn8DqCZdqnNqxyfU1DbJXv9Q/VD10StJudPt/8QygU3jyj6iVeUP0LbZX6/tikdxe1x
         gu0fckqRTVD+HK+ETN2Yi/s7mgJ92zESeDjeQpdACGJhGVjp7d9iyaKxS5/amhCp6imC
         uRPNEHneoTDwoc1aY9fVjGOlp9hKuXgYd6z9ypm9mT2dOEr/3IDY5WAkUYfn3WfXDom2
         gfaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyu3GLfMeq06xsUSI3WMS6TRwvNflswIsOiNrCQhFnZlMlw4alU
	LulLVwe6DGjK1BzoZDq6K5U=
X-Google-Smtp-Source: ACHHUZ6K6ybibiLex5u/l9ITxchGBa9Yfb22qkk+vDNQzlVzal6DzZnumpfM+PLuN9+uz8YzoNBKVQ==
X-Received: by 2002:a05:651c:14b:b0:2af:22a0:81ea with SMTP id c11-20020a05651c014b00b002af22a081eamr787621ljd.1.1684528860567;
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7807:0:b0:2af:16a2:fb05 with SMTP id t7-20020a2e7807000000b002af16a2fb05ls370172ljc.1.-pod-prod-05-eu;
 Fri, 19 May 2023 13:40:58 -0700 (PDT)
X-Received: by 2002:a2e:a172:0:b0:2af:21d3:a4d9 with SMTP id u18-20020a2ea172000000b002af21d3a4d9mr1074669ljl.45.1684528858780;
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528858; cv=none;
        d=google.com; s=arc-20160816;
        b=0VKRzOsj80TwyXEOT8yE0Q0nhrXGvWL7ZKZCQdFDo0u6nT5wS2ZQC7E1XFhw9Ed7uU
         u+8Oq2UJ0ixaItmzlAMq7LbMxK5XE5QbuZhqYF5pBLxvIR3zbQieDeVKCi45vL0xazpX
         IP9EV555MHk1IHFOuie4zNApGegt5nZQe+lXSyhMqLhXrdzJPznYvM5sqFnVAiZ9Gczk
         qC6vBW59mFaJdo6NaM0UxA0XR+MiBMyJ/MU7yY76xr5K8zx8pD5vbDauy1tiqHJpKJn6
         ET5lqeXQkKwIJfM9Tt3Ba9bzhFxlZ3EVl3bTW3ZyVPAd1HaWO1LO8MO2WuSQ0rjklZCb
         6/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mTaS10jDoVno16JkACUANvfx9xH4oWdTiCMB9OQFNRU=;
        b=kijwjz7B9DUVBhc/v/XJMBsu1zyVtDHmw8lhAukeDwh3dSFeOyiQMn6enZEwBJsl3D
         0k5rOA+Un0e4xR53Wx87e4hwrtyEpqPppYkpbiOhrRpRjo1tdzYOMGZ6Sw3ODijdQru4
         KXMxvDKvBJHOFpHIye+LmwVqQpVevKWveaFwhFA3OsMz1qBeNVf/vIyAT1QQlzG5b5w6
         YQ5AoLLtRRNKprR+oyt3gxkaP+jJ6EQ1i/e8fpiWiu1a56439peqPlGLH2S9twruNkyL
         lvyOGTKm7L534WMy6v1aIaDXP9bdvp4O8d19xA+b7dgGlKM9psDyNCeBDir+1yefcCjL
         RGYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s18-20020a2ea712000000b002a79f4b8367si336517lje.2.2023.05.19.13.40.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdj73xxzxxV;
	Fri, 19 May 2023 22:40:57 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 55/73] inmates: riscv: implement Linux Loader
Date: Fri, 19 May 2023 22:40:15 +0200
Message-Id: <20230519204033.643200-56-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1800_1899 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

The boot protocol is simple:
 - a0 hold the hart id
 - a1 hold the DTB

That's it.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/tools/riscv/Makefile       | 19 +++++++++++++++++++
 inmates/tools/riscv/linux-loader.c | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 inmates/tools/riscv/linux-loader.c

diff --git a/inmates/tools/riscv/Makefile b/inmates/tools/riscv/Makefile
index e69de29b..4a722777 100644
--- a/inmates/tools/riscv/Makefile
+++ b/inmates/tools/riscv/Makefile
@@ -0,0 +1,19 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2013-2015
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+include $(INMATES_LIB)/Makefile.lib
+
+INMATES := linux-loader.bin
+
+linux-loader-y := linux-loader.o
+
+$(eval $(call DECLARE_TARGETS,$(INMATES)))
diff --git a/inmates/tools/riscv/linux-loader.c b/inmates/tools/riscv/linux-loader.c
new file mode 100644
index 00000000..1434cb0a
--- /dev/null
+++ b/inmates/tools/riscv/linux-loader.c
@@ -0,0 +1,25 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *  Stefan Huber <stefan.huber@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <inmate.h>
+
+void inmate_main(void)
+{
+	void (*entry)(u64 hartid, u64 dtb);
+	unsigned long dtb;
+
+	entry = (void *)cmdline_parse_int("kernel", 0);
+	dtb = cmdline_parse_int("dtb", 0);
+
+	entry(hart_id, dtb);
+}
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-56-ralf.ramsauer%40oth-regensburg.de.
