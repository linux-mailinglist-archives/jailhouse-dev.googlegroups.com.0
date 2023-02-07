Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2MGRGPQMGQES42QTFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DA68D693
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:17 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id ev18-20020a056402541200b004a621e993a8sf9928260edb.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772777; cv=pass;
        d=google.com; s=arc-20160816;
        b=vFK2qFbggP3BdjhULw/Pd7FbB2aIYFlbLa0r7a5mS3TAIG4TSQiSajA5MIlN8cOa8i
         33hM8BjY/0LpE1PeRCJ37NwtlKViRp6yS+8cEaF/cNBVs7VVzLxJmKC2mvWQ5PRsH5uH
         SkJUc8sOD/F+eqDAkzU9qPcGMCBm57MtBpTF8Ren+lDOt978wfh+TonlHj7Uu+B0Kbia
         ZCzMcbxipOXatH9z9Tc9MQYhq1tHXZEREh+4WnHedGJaxx8yv8bpwI8ukcaDqnxXx6Oy
         sPQxx2isGUMai+xx2HDPg2ndW4cNITqYiewfnaWuqxQHUl82db+8vW5aFXXLalTbBr9r
         N9Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/ftOA3N+fueXhDsKJ7oh1p6hpcVlNFS7ks6AC+MSaWw=;
        b=v5H6/Vnp/Mp+SRnpWyqm4lFIDgoTAVAkkdPVG9x4bWQaV7VGzC7cO+cvoj/HYX4ikE
         smhUhxBvKTi4CXA9LVLcPbNCjW0P/fCnl8uXj481wgmQVIKFVNEK9sB2rLsGa0ko7L26
         9BkgAFpD1p7ds/TvgStwtJZCyRlTxCZ0a/6ku2GYqSTjRxu5MALhnOhITW7gmPc6eryi
         /a5E2Tlh8bLxibHszIOJAzhpUmImqnjRna7KeAiMGhnOhnTw6fuLuE1rwsQLp7+6/Kzo
         XZJdtsYx8STj0iEIFDdpER+P6f2wGE1TWLXgAJij5mxduZ8RrlqSG9D0u+Q8O9pKhzrd
         Xqyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ftOA3N+fueXhDsKJ7oh1p6hpcVlNFS7ks6AC+MSaWw=;
        b=D64bkrpee/l9p4GgHLrHLicIT3Liuf8fP7hqA1DpnMeDj8cAmUd80JXphmPzwb2nEt
         Wy7noDpuS+0R2dGKB45yV6aWRiymnzXVK7OgWsa7H1+za1OU7w9dLHLS7dt3YkRvj3QZ
         Ke/AwShtIaCCaWofDjY8r92XXYsRW3m4Gooi9uYIuH70iDGB3X8pjemePNmT06wWuweG
         GFblMuMCYoaoV1a6upg84wZtmQyFwgwXfBLADMqjYx0VApLK7b96ypDd9QvY/t7zcutp
         /4l6b1/2n8LKAI8jn6EOBKHFwIreqvQBzgUJJeLKER2QZAtU+ureoHWruByRTNzvZCye
         ncTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ftOA3N+fueXhDsKJ7oh1p6hpcVlNFS7ks6AC+MSaWw=;
        b=y4jYhc9oK17zjM6PbuG30Ld4Xr58mt9RB27ziORRzhW/gVtcuV/iE09K4ZOQqL6nMW
         6b97aVyX+EJO7qFYd9eCVbeEiK6k/b/khlBwLbIMgWFtf4bj6sVLmJInq7J83BO4c+A2
         9d4jX491QlnjY9vJ+9SED+UFmjzWE7fzKIdi6KamKIhbAlD81DlkxLhXqnTLNXjjgcNa
         aLnTBeNiFdKTJyzXn0fqDKp6XGHG6F8cwsc/N+gEmxHKO0wlWi/VULPcmQqlTIu10s8G
         MDyOJPTkyIXJOulEsrxanvDOqr7qJ1TjTzgwugUcCn/bW5wB8Yl4QWOAVkYN63LRPaVm
         xs3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXqQXhjUQ2H1BjsKBAE3Q0JeRnxgTliNDgXB8NQaGJsO+9G4T4V
	12oVwQxIY3n6vQgJK9Phi0o=
X-Google-Smtp-Source: AK7set9dunL1shcAF43mA4Rh0jso37MnLfgv6c0Gf69WnhcEsUms92+L9xplEnsau1ev1Tqx5jOXXw==
X-Received: by 2002:a17:906:3e8c:b0:88d:1c7:d3d7 with SMTP id a12-20020a1709063e8c00b0088d01c7d3d7mr893242ejj.183.1675772777427;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:3226:b0:4aa:d8d1:5599 with SMTP id
 g38-20020a056402322600b004aad8d15599ls799046eda.3.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:15 -0800 (PST)
X-Received: by 2002:a50:d0d8:0:b0:4a2:2e8a:14c0 with SMTP id g24-20020a50d0d8000000b004a22e8a14c0mr4003669edf.9.1675772775788;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772775; cv=none;
        d=google.com; s=arc-20160816;
        b=Pk4pqr+sNqzHiPORwv81lhORd2mSgowMvV5E0CLcl4yLh5zUcjCL9Rki5mfUAy9yUP
         iBJZlGWbhp4ZEdLBRpCO8cYjXUUi9YpBPj3R4eo3PyxJAvFI1Fn6Suu2FvKiYe3oUdJ1
         u/7CP+eEDh+KMrTlFYZ2R3/rg8zaFQySAwtpJg8qUGz2IDHyftIogncv72UR+gEfqdHi
         9yGvM2KvqH3kpCTJeb6g9/I6Xhc/qqwK7iwNtVNFoL2wYyPXuLSPRUhmUhtMNkblGwrI
         U92ti6oZKF0fr6PY5v0ljQUkBFl7a6OICFed4AEqvBTkyWGV5RZTgKw7/fifLp4IeIQX
         RENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=pVFVG3CpxDlXerryuD955dzVf/b+bBPQrHZIOsAxyME=;
        b=VnFro23YhLSKIEkvTrBvKQJODTZnnWy6/vnh3uQXq17a6AR1ayDfpQ39tOgpvJEn+N
         7T+xl6f1a2utszKoPoUTi9glUA/akmvcByJWnbBw7pvqx3EX3rXrnTEkRK+htsrSBz7V
         NmmccfYZBogXLVgLBfZNi+O5T1WZ2cfDnAv69cFOkxHQS/ZQsYLOfeBlH5CGypKZTya/
         tllnW1OR6jGVoMx14xzw5c7SbcOENJU7ntLCSZr+i/0RnJyYHyFZKD7N+X356iE/WPne
         w92TyNi8TVVlSOvT5Q2ANly4dtEy764iJfUHcSAujId7mZ2uXlqiMFYinn+i8DtNn9AE
         AXJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id q14-20020a056402248e00b0046c3ce626bdsi652457eda.2.2023.02.07.04.26.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RW2399zyLG;
	Tue,  7 Feb 2023 13:26:15 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 36/47] inmates: riscv: implement Linux Loader
Date: Tue,  7 Feb 2023 13:25:32 +0100
Message-Id: <20230207122543.1128638-37-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1800_1899 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-37-ralf.ramsauer%40oth-regensburg.de.
