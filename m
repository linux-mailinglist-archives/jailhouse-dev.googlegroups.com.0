Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVN5T6RQMGQEDJ6ZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79770A0D5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:54 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2ac8c5e4aafsf8044831fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528854; cv=pass;
        d=google.com; s=arc-20160816;
        b=hkhWeDQ0WKTXeJ4MTOm+HbCSozaxhw36yjshDIoXDGuQUmVV16+m7o6UxHqSd6e2a0
         grevBVTud+gABJtPqAzE3eswC2vGcxoDdyPYMwEAbJNYA0GiDU13l+41UwvH28/R8BjW
         9R4Y38gXJvbEhcLFI7tkaKLHzp+fCfabdC+BBFYplqFYilM1q6ddC84r5R+KUDR5qgxW
         cOu4399+3OzU6T/sJqJ5VmdLxpzATm1ZyREF0Mp9NWCLNglsufkqSMo6lBdg+TGhP7bV
         1keCBd2RtbIE6z/kBQM+fQgRRInJMWUpqa4K40lJdqAW4y9Dq41FR6B0aNi0bmyWuUCN
         WGxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=zWw36P8XXDociOv/V2bWr4PGrkqDxoYiefcnq1dhkSU=;
        b=WLIQko9uK/TU/sF/s/xa3W96YpoRtjCg7GWdn8DIf4/pZSQLcVfct7NYd2hFMESFRu
         Lrm7+iR5T00HB3imlEm0BnOU+SCaO1dyRd6O/GPC3sNuuL1UHpRZisjQrZmlruvmc0cg
         ojZvm2Sxdb+SlbWjzwmEUGp7bIZJUZrbWjXTDKInh3uq6+L+kP6tB1gcu/w47ccCLp1y
         JReRh6WzDbZV7U2IdAGp+Lh7jakjFZcsKUKORKOZdaGjcDxC/M5lYNBrJh+QgPDqyYxL
         JeRyffcu8mReENo3i3QfaPCtP2osX0k7KGOh+Hw9iXLkAqfPwLAn9vrnoa6XXg88aAGm
         MU0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWw36P8XXDociOv/V2bWr4PGrkqDxoYiefcnq1dhkSU=;
        b=IYfkH0mERO96/AONNfX2aWtJ/xo0qGJAUlcRI3nie+TV2nqQJGL4NwCP6v8gqrEqdq
         6mHjGSJKuaz4t4DsFzqmRvcU4qwXRBuQ+ilVsKiIhKp/aPI6JY0IGmzbKVegB7OegOQ8
         asEzDdYg8/PU3SijMQiA6mUUHDZ++FKpunBWh3DLzoDvJ5Djj18heA50sEg+TMxv8p3V
         vjF+JaKyIJtv+Bx+H/aeHv2oLCX1uycOCHft0RT7EYlfYQHn+cq/1GBk+zS4NnEshqAF
         WHI5G8AuPNYhry9RjADlJM0de6XATn2Cfkup/4z6xCTxVOEoBI0aEb7XmKZ612KQjLus
         qfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWw36P8XXDociOv/V2bWr4PGrkqDxoYiefcnq1dhkSU=;
        b=FEqc5i/0KcS05Br9ZiqZScVuEQKg7cJczRVCBffx8g+Fvz/QdH5ke41xkEQ4ro8a7z
         kHROMe6GlT1w8swUoMzUDgiEqv8sSW5Upqm53X9r/1oUWs+DwpQCeTv2CsSgSQP98vxw
         koEy6kJ1ngugj5i6IfdhfACEKnT52nIVi7x7dJUmSjYSTQMFDoFBnsedC7gDaQL9eebY
         ZxAQdehG9tBcgpcZQn3LQPJ/qa+fnWMV/M3nrQ5EeltOGc1FvD2rBWRyTyqp/6QXCes4
         FhKJRLViaPDIZ7K4oIi9Dzr2AtDN73RS7z2MON0Ut4nCrLp6MSUo6kduYThblVqVheXD
         Cmzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxMjh7IY1iKI4sYee7OgAc4+tOG/HQHFzFzGtzpC0IWmEZlJBsM
	CmGQz5rsPxd0X/qGUapr+aE=
X-Google-Smtp-Source: ACHHUZ70lfjNTe9PxfVeg8DV5F19CSE8C8wC8CL5tb+TEg5d13Yyw2ufO1DncBSOe/owUWGZmlMmsg==
X-Received: by 2002:a2e:a990:0:b0:2a7:75b2:ae4 with SMTP id x16-20020a2ea990000000b002a775b20ae4mr907588ljq.2.1684528854107;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1597:b0:2ad:a1ce:ff1b with SMTP id
 h23-20020a05651c159700b002ada1ceff1bls389194ljq.0.-pod-prod-02-eu; Fri, 19
 May 2023 13:40:52 -0700 (PDT)
X-Received: by 2002:a2e:8297:0:b0:2af:1dce:8efd with SMTP id y23-20020a2e8297000000b002af1dce8efdmr1061765ljg.36.1684528852287;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528852; cv=none;
        d=google.com; s=arc-20160816;
        b=KUbumGyVnFosr61c0Spm1pZxHcFHEpf3P1eU/Q+dYp+/rAs88/h1MQcXYV3BZjvB0s
         4jTelfcnNgfl6R5wTsolg1MRckzTwAyXu0BWkhKlKCRjQUvTNBldHUewEjILiO0XV1JQ
         weykC7QSJ/POtCBMt8Xt4F8wid502+VPtInULrbCGzET6jRZiZI+hIyWzHtlgCsX47yh
         8Z5l5pWGloFe0sQ83joMpOZZzezkPknLqhuLPEejaNG4Z6FeqljAYcvZuppr+s28MuP8
         wNIJdV6RhOnQJYqeWQDdSwst8L0sUQC4ZFRZPuBclR3PpA6lMdSFulQLD0Ll6CXj9PEj
         Ht2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=u/Nk4n6Cu9ulqOQyO524+d9aeKGd+8CZ/12yX5Ya54k=;
        b=MhpLIBtCLBzSCWmnKT0rzQmEVleRWYa3fi3YqTU7xaytzAXSAKTDcy5SoDxNey1SOk
         q11QqA3CivcwcdnT5aGRwgW0zcXis1EnzmwR/T2IFRuxbOeddHrihBsLJMJxsO2BINLt
         47zvdfyOqrz/alcFtY86kBthG0VvlY264zzh/YPu+XfT0j668iwOVuZ+Do3QOklwIoRc
         USGHR9Cm8LYuUJ8YWVGgUfYr//v0MyTWQPitvyTq2JBLIrg2PaUmrazv5cWNzqxgymmQ
         kKljDnvFfID/rbthwPxvf9+ifqeUHTFwK+htK4zuzK6JKdTNrVzkpDFLJE9IgZhIi2yP
         TPsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s10-20020a2eb62a000000b002a8b2891ba7si305527ljn.1.2023.05.19.13.40.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdb3wblzxvc;
	Fri, 19 May 2023 22:40:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 35/73] core: riscv: implement library routines
Date: Fri, 19 May 2023 22:39:55 +0200
Message-Id: <20230519204033.643200-36-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-36-ralf.ramsauer%40oth-regensburg.de.
