Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2MGRGPQMGQES42QTFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949F68D695
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:18 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id s3-20020a50ab03000000b0049ec3a108besf9840731edc.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772778; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xt4a1KXbdcwajM1tbDlA0nYAnSjGnRglWLruBtPWjgw5iNZIboPkAPuMZSj3mFdtZc
         esm4k11YBPUg4U1Y+4dylUcfnL2birZunjBf+oh/nSAV6U9NY9mU6hdWmbA+JA8ESTYU
         Zrdtwe002BAyz4xq7UgdUW3ODxn3XVGmJ2s2bRDDkf6dQ6FHmRr0Q2J+K8eeamFou8Y2
         1M1SM1JMLWP+FTTu2+ZQY8YqvTtWCNLd6pMkBFPZ5oED5SdkAw5Umx9nqu8JCcDqJAD/
         REUkWEKvc7787hYCkT0Uz44f1kbl/mkIwg7F2gC50xPZpoUDEuEog7D+Mi0XiYnxAp8E
         J0og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=a5Wu/ZzM5FVdd9EU/p7CDoFz6yqpkr4lQdys4Q87qe8=;
        b=eeQfjoVd6TvmHJW8ci113QGGd9pm/ZGLriXkJ3qe9n4altvvRgqALNOyd9vw2HDHij
         ZA5MD1XKeADIGITbAXj79xq9z1CsaM3qkpNyUTitmlHDpzU0F9pln3FkX2HEJmvuqQbg
         CnmmRutV5aAI9RBhhs9wP2iyAMJAdZw2Y+NGaISzNUuaLu/dqDhD9R5EutYmmi3vZRrn
         RM3vVMl60za/O/K6YAMQEhDEyQIC/zSo5RpSfJYKWqm3xWZTl47uRCOWigfeMplcjBo0
         9x7jWekLFUzGUH2udJ/l2ZZDKtbWE0THPvqUJCvAe0SHqz0/Wx7Z4dMTSdGawAZ2Ca2A
         nNyw==
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
        bh=a5Wu/ZzM5FVdd9EU/p7CDoFz6yqpkr4lQdys4Q87qe8=;
        b=Qin0nHqApgxENqaVRfyT3RoG9gF55Ism5YTnN++R+FjWgtu3WyYexbXqQJ+aAZADnt
         3rWaBkZae2TwqLkAcE3QZ2t3X2PIEvo6+PCCxEfJWkE3/OCsN1KlxAB2OVgAl4WJdOgO
         0DGsVq4tfaforfCNxXqIXfqD/htf5k2JEhiCYHR0/5IXCiL2OdBVmfa82jseXP00mjVA
         0wsYMtgTjNF7xxxiQ7AC9/vrl8aBL4DWAjwLWgJK7krJnHxsKHF9CHMNulrpdTMQfRVY
         1bm8i5kJEd+uv1Fj2xeWNClT47Eh11pHJNt/GB/Iq5vxcOtSrBfg3iXf93OMXmqssT2o
         cPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5Wu/ZzM5FVdd9EU/p7CDoFz6yqpkr4lQdys4Q87qe8=;
        b=WQ3Y6LzuPZqi/G7+1JSkbnf9pikOWR3A5tjkPPxtniXOePa6ZEVRaoWnyyNO05FZMQ
         w5MXup9xYiD+zVfWOaAO5NVQTg4VyHOM6tIxN/OcIfersZI13FI6LRn3JDcOnizETemm
         cqxaheGirWyp8k1l6LK3uNDIKJ42t/euCuMWaAhBgnAdLaiCz/Fkhy62vIOJpobdl6OF
         3ZYMYnyxBzZjFiT8wLTlhPtNasWjWrXScMgYn9GG/FyCXRJ5K7HoZetc/dF21Ccw3UfU
         qRju9i1ErGebIZuB87ZxO7PMC6n2UwM5rzOPndKeAItix5Ufc3pdrW8GCQUi/MaY5mLt
         fBRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXSlSD+M23S3DqWuw/RGFzHUuVolb1h9XwU/wDfVCaPgGnaxmoT
	5teSmxx+qG27wbJm+UYmX08=
X-Google-Smtp-Source: AK7set/R7349zbQV9CtIpITkU34KguRdBXigXXAlL5gswJmUDpQIM1bEnP4HhTQ66XZn5Fjx0hc1ew==
X-Received: by 2002:a50:9eee:0:b0:4aa:a4f2:ca1a with SMTP id a101-20020a509eee000000b004aaa4f2ca1amr567896edf.0.1675772777920;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1755:b0:4aa:a500:fd39 with SMTP id
 v21-20020a056402175500b004aaa500fd39ls7477128edx.0.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:16 -0800 (PST)
X-Received: by 2002:a50:9b1d:0:b0:4aa:b348:ed36 with SMTP id o29-20020a509b1d000000b004aab348ed36mr3277612edi.31.1675772776331;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772776; cv=none;
        d=google.com; s=arc-20160816;
        b=m6EQgYtgskBsLG6XI85c0JRS5BPYVvn4BGQ9BrPYIvhzDMVskAJ4wfFvit4P5iwEmA
         pF8OqjLD43B5/DJb+lqhQwtY5MebbVaIJkpRN3dnuobLUC7etz5iboV+lotg1KJq7Rb4
         c6D1H7TEG/xjv8M3N121NrBeAvCdibKINUmPdxjoQoSvjxR9u43cHkk1f6jWO++UgI1B
         QDZoKg7yW9/5eNctH2wTi/C5M1SJ/23ERo+GeKZfoJ3PlOxo6gWWBeGo/62x/1w7PH4t
         NpD9h7RbNCNpN3RHHNe4V1MzSARLY0YHxUrxEgDSnbiGiyaNz+MgpmAzjfc3tOgSG8/k
         pMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zJIi6cRv5G15uf76GsX39SmYaYTMHAEOFglOSKkdeJk=;
        b=j96m2dfwgzF8gw3z8sTyAAIYULtrw+bTwiUcyfdf/y/2x5AA3Hd5HcP7lNJIIsBjSN
         DVhfnEPOgTsZ5JUmZnZw4vZgIOcL8DC/wNgMTtzD2fcCsL42hZy+XBraZikbPp4Tq+rJ
         tPQwQMcrJefghCKF5P2kMYsPZ73ftU3TuuMbh96Wc0LwCxG9huSXIxzRqwzKVg24C9zO
         i/5XnzwcUM3PJElgRrKIQbzvRvDcUeb8ybAk7xslOfH1dmYcKkjhMO5ZT86AujCwmtYL
         21hI5I0LsvvekbsDnsAYmSsHzGHBcqf5nK8GmchHNr2gOOf9/jOlzOvycpOQi0PlFibn
         IAnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id fd23-20020a056402389700b0046920d68fe2si568916edb.4.2023.02.07.04.26.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RW68wBz1075;
	Tue,  7 Feb 2023 13:26:15 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 38/47] configs: riscv: qemu: add inmate demo config
Date: Tue,  7 Feb 2023 13:25:34 +0100
Message-Id: <20230207122543.1128638-39-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/qemu-inmate-demo.c | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 configs/riscv/qemu-inmate-demo.c

diff --git a/configs/riscv/qemu-inmate-demo.c b/configs/riscv/qemu-inmate-demo.c
new file mode 100644
index 00000000..88032939
--- /dev/null
+++ b/configs/riscv/qemu-inmate-demo.c
@@ -0,0 +1,64 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Minimal configuration for RISC-V demo inmate, 1 CPU, 1MiB RAM
+ *
+ * Copyright (c) OTH Regensburg 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	struct jailhouse_cpu cpus[1];
+	struct jailhouse_memory mem_regions[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_RISCV64,
+		.name = "QEMU inmate demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_TEST_DEVICE |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
+
+		.num_cpus = ARRAY_SIZE(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.type = JAILHOUSE_CON_TYPE_RISCV_SBI,
+		},
+	},
+
+	.cpus = {
+		{
+			.phys_id = 1,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0xbf800000,
+			.virt_start = 0x0,
+			.size = 1 * 1024 * 1024,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+};
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-39-ralf.ramsauer%40oth-regensburg.de.
