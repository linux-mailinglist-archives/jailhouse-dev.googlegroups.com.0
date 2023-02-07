Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYUGRGPQMGQEWKW3CTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80F68D67D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:11 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id k9-20020a05600c1c8900b003dc5dec2ac6sf10510437wms.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772771; cv=pass;
        d=google.com; s=arc-20160816;
        b=pdJ1Ym3zYkXBkv0ULBjAYxQ3DLj89wc7EaNaEOoFH3cbRV1jlTfOJ8O8kP4EDgPwoH
         gTWpTCyS0tlJIPTaLV9sw3UNeU5QvfxSZ1PGUq4VSKBc1yng4MyinJVKDCHmFkiG2ovs
         A8JFrHXrBl4weA7sTws20B9ALG0x+fUFDKyqYZpzhik1M211irHsAxa7Q8CU5Xh+gNpv
         xhxqr5WOP+PMwO1B8wBujPu5D5rP5tla4pTDfqclzE+uiVlYYf/r0CsZ0Ha60y6hJbJK
         5m3YAu0C15iQbYNTnUeAMA/IYWIcKjZi3MyMtiJJPCjXtRPBeX7htEtOc38H+hplKLjR
         xFBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=44obJqg4wQeOeSblyrk4GpLNrKYKN4oTnbQVHXyx8pU=;
        b=0RpUc1zL8wPEU9m5MsYAi/2nuMQEjxt0RJHKeR5qqv3lp7AF7D9+iXMLop3epygM2m
         80HSQ3G2jEAx2rEZJ7QWoO9VRZyMHhJ+MfnYYK5i08qOI861aS/Jsx9lQ8SR0t4sPJoF
         70h7teCdE8iOjLKsOf+Jt+aMA81cBU9Znh6gu9L/a+ysSuZfFMQ4tOFIiV5oUD9zyBcv
         E2zzZnmK0yqDlsghGRRb6H7a33qlDf+InDNO333JcyPHjC2TupXA8pj4qanQyM+dVcmG
         bTQSMF+7T/WQDGUtFl8fUGtQyrxI5ru1QeaIXxb9WxO8U9vRbzCv1LoacMvvQciolOJk
         HDWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44obJqg4wQeOeSblyrk4GpLNrKYKN4oTnbQVHXyx8pU=;
        b=W81S0+KbXQR0BmpE3WqPiTKFpbhGWtEKpERd/ywCLDGxenjFeklNDJD9UvuhAjXFly
         bxnrprJLsMziDuyXCeskD5sd3t+/8o8myvZinzOX7RNUUp0jSYn6wt/UHsmk1ONL8ilB
         b6687KN6QxUjxqj5buNIwp45EhsOUy1CB+V5jvQx65JKRXtVtX+hjc3o85bMdqfNuVtH
         OaaWGLHOIL82I3+dOvzR9z6yWOCwFdRheJvYunbI57ZlFSihKG0dTd4/MXjptguoR3T7
         3hN35dgrOHBAwWhkfq6RNFekaBmjUDWuWrY/t62B7jT5UsCVf5PWSvtoOn+HYl6NdCrA
         N7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44obJqg4wQeOeSblyrk4GpLNrKYKN4oTnbQVHXyx8pU=;
        b=JTz1bly5eaKQ8APcsCGAstObNFVgZtZ+Mck1HVsgWZv2TiN+zvEFOsc/vDQByo7kz7
         G5gd2tSaxTu+N4bh9zMjagXZsScdMyJEKvPu18mM7u8wXbAtJMAZq3cVsnsjfEN3zNkD
         x/nAPfcSlKI/4QXKDnRj41GdvQzgyJ9eo5LO0BpXj9uGaIKNkmbNtwk4xDpOAFXQbM1P
         g9mw60uIhYNVOF5N08nmB3kg+qKHTcBmq5mki53BsnTah8d1ik/cYbHsvI3g9VarVEV4
         SIPdxN+Vf1ZrWJmo699puGQ7FcGq3yIDz6PSkkxTmmT43DbrOSZeuC9wh/ijaaklF8k+
         9WSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUtSIoY9Hcir2AMIri7vsjLgDZmqATngDhVZ1motD/kz09xSsBF
	yM09uIBghP15mkGHqc2uw1g=
X-Google-Smtp-Source: AK7set/aLpIL0JUR0DKCzt9vY6gIbcX3NEcchrl+a8pEPhzs3FIP7zj4DVTkUKi5RD/gW5rIG1m86g==
X-Received: by 2002:a05:600c:1d10:b0:3dd:1c46:6c8a with SMTP id l16-20020a05600c1d1000b003dd1c466c8amr1090931wms.121.1675772770859;
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3caa:b0:3cf:72dc:df8 with SMTP id
 bg42-20020a05600c3caa00b003cf72dc0df8ls10088083wmb.0.-pod-canary-gmail; Tue,
 07 Feb 2023 04:26:09 -0800 (PST)
X-Received: by 2002:a05:600c:4485:b0:3df:db20:b0ae with SMTP id e5-20020a05600c448500b003dfdb20b0aemr1801873wmo.17.1675772769124;
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772769; cv=none;
        d=google.com; s=arc-20160816;
        b=K968d52OYbq1s9QWcv2uNm4eqN/1Bq3/tKCOzNyqUPtsAIBDytyX7GF8zPThwPIgaj
         wVtClbKzkUdsJrPeTmyqt6FnJj18WvbtxmkZckKENMdbkU7U6ktbVyNJAqCLRO+youX0
         e7BhHnOCOuQlEcqiJ/eI+c0DoMdSTNl/MXeacPB3Deoudm5Ko91FjrcpjS+N0KyY8BYD
         9cnsLIA7fFT699C02wU86lFOHBmf6r3sbK9K7ysB2FLrCItDFx8UDg18unQNsZegolcZ
         WqvqIyeLX+rbTURkoalc5soNvIIbxuSTFa+PMUObe2GCqHVvCbL7Dw/Qi7jnxp6L1Pz0
         fGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=duK8Jd1eXfjP2yTNVR3Kf+/jKE7kJDivSsJnKPNfloQ=;
        b=niyxE0hO/XIh7RQkEQ91nlPbHvVKbhTGmZI5kJjYlJ+3Cs2f5rVWR/yBZu3DwUYork
         u2n8rgCTcUtyvgbujxihrDe1c3QIvCpsqYMpL1orbChBhyNJ3M4b6rtpCZ9Ivax8ZND/
         gh8U+sybKJJH8M8U+rEv12Fpcp5i3kYTBGS9xclmCayOkqVjYLO8REqtpJbvYK/VmfhP
         /ED9rQjNCgZEbMiVUabuYMq8n1YlpPxtGYgampTzzNWzmgre5A/6/pZoYblWvR5+nlOa
         +l+RCgJ52KEh1ciwe6Y+7a4fTRYpKx1Zxe+DCs9xmtHHMJLH/0CsKYnkrCx/Jvv4/jF0
         ICqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id m17-20020a05600c3b1100b003dc43c78e98si92430wms.0.2023.02.07.04.26.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RN4vqFzy8J;
	Tue,  7 Feb 2023 13:26:08 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 15/47] core: riscv: implement library routines
Date: Tue,  7 Feb 2023 13:25:11 +0100
Message-Id: <20230207122543.1128638-16-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
 __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

On RISC-V, the logical CPU ID should be the same as Linux's ID. A
logical CPU ID is mapped to a HART, the physical ID (phys_id).

All communication with the SBI interface require specification of
physical HART IDs.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c |  7 -------
 hypervisor/arch/riscv/lib.c     | 25 +++++++++++++++++++++----
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index ab0bb449..b848994b 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -69,10 +69,3 @@ void arch_park_cpu(unsigned int cpu_id)
 void arch_send_event(struct public_per_cpu *target_data)
 {
 }
-
-// Likely misplaced
-#include <jailhouse/processor.h>
-unsigned int cpu_by_phys_processor_id(u64 phys_id)
-{
-	return -1;
-}
diff --git a/hypervisor/arch/riscv/lib.c b/hypervisor/arch/riscv/lib.c
index 5fe45bc7..2ea1d5b6 100644
--- a/hypervisor/arch/riscv/lib.c
+++ b/hypervisor/arch/riscv/lib.c
@@ -1,19 +1,36 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
 #include <jailhouse/processor.h>
+#include <jailhouse/percpu.h>
 
-// Check if it be moved elsewhere
 unsigned long phys_processor_id(void)
 {
-	return 0;
+	return this_cpu_public()->phys_id;
+}
+
+unsigned int cpu_by_phys_processor_id(u64 phys)
+{
+	const struct jailhouse_cpu *map = jailhouse_cell_cpus(root_cell.config);
+	unsigned int num_cpus = root_cell.config->num_cpus;
+	unsigned int cpu;
+
+	for (cpu = 0; cpu < num_cpus; cpu++, map++)
+		if (map->phys_id == phys)
+			return cpu;
+
+	/* this should never happen */
+	panic_printk("FATAL: unknown HART ID %llu\n", phys);
+	panic_stop();
 }
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-16-ralf.ramsauer%40oth-regensburg.de.
