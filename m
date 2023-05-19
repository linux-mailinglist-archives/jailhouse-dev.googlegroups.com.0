Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXN5T6RQMGQEJSKAQOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300E70A0EA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:02 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2af1a18584bsf11992411fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528862; cv=pass;
        d=google.com; s=arc-20160816;
        b=rSnPuPPI46iGtvAa0oeLbvmSYcYtzv0c6I0WT7zJbOymEsQ8994f8qlK4UJg2VLOTs
         XmuBrNuMnz8eYZlOXkVB05wwPi7FewPqyPMJX/POaK1neCeU6tQd7zhDkLQYbQHbVxBb
         WQGd1cIldkmtguDdqvM/FMXgN6Vnrf1/N3nj/ziTG12X3w4kV7e7LgWTRPnaUhCqC8k8
         /DwEeDfL8AusyGUbA79mV6MrpBEb35ca/hzxyasvePhJ7JEwjNNhz5sajDnaIl0Hm/IS
         RAgy9moR4gPrfDEGsJPLg1kdiUoIyFpoAoIJXxf4msYh+gykwQVxLPfgCK3RxK41diPb
         wHZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6rnM4VDjWhCuOOmmGTAt8Wcqz6cFVgCcV6GR60t/Wic=;
        b=GStxEueYEmqGAHoNtS6H3e6iM3ffSc7PtDVcQJra4cufY+BSuTWdyrczgTbVbHa6M8
         5X6cBP9F3v30ellxE1FkdXLqWNpHL2GpGVR7FpIG0inUMdQbCndN7j35C5eea3kOQtmC
         9p7r5uwUk6g6TdMbWI6bxMKLXvks+9UMtJppavwyW1E4G7SAZZVpLQ2fViHLDuHb1Fub
         XfY7WzgW6tWSJl7FN6ZpDzFxWUwHGWqTz80416sdwGoObz1YQz1cadEyreVB5beAcT9S
         /sahL1BaPxD7ZmkV+dDbZql/8CgNbb1RnhSpZEqur93/zozXodsjQXZq54PxCBcSV/gL
         9AKQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rnM4VDjWhCuOOmmGTAt8Wcqz6cFVgCcV6GR60t/Wic=;
        b=noQEoXW9PRgDAa/icJKDT1giQRUxBQQ3PzR187lm7rN7z8SVLMIrMIpVPLu2zCZJNA
         c165ZXBAiYDTbCCIJStOmGIocrMRyu+LyHjjbn+bwMYm/LxB7Sk6UzDk+2fnbfCdOmD+
         XdtQwOR5iiAQcGMuJ0Y+rryxGFVS4uUs3sEYwtPMddxw2vjzNldNMahDFMWasPPZmvjq
         vJW7QfAI8BD/mJbTFVnvmBsIcmtV9v2zz30s2QWvQqDaSUAnNYnJvjMeJc2omJXVxL6U
         Yguk8SdtrxFt2jqxJKUzGHmYu2aZQB8Ywfy7Z6pY0fEdNdjIa2Wq/38zeKrQAjT/wid0
         2GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528862; x=1687120862;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rnM4VDjWhCuOOmmGTAt8Wcqz6cFVgCcV6GR60t/Wic=;
        b=dLO9nk18wlAKwv/Ghp/mJhqOsbFVWJG4t8fB77xsqB2+V+g7VWQQYU+93V3yZtdrmI
         8MFLtUmXmNSysRXuVjMou2VAZSvvVE2XpyhC4AfgTTExLviPNUnGh92oUxNTl1K1gDYa
         USDzsdkag1Kp4OI2RXIQzlqRn/AA7RK6WUcDkQqNw/rfBATQUhkz+92kF+edGGCuammf
         WiljkUUf11aJegnk2xaQgzsh0wDmQODSvpw3qUo4ofTFJFwx7xd+VP/SUtyRlLW896Aw
         jmIG5yIGAplh+hG5gVQ0v+QUXb+Y2nb4K3kuZNoAgKCysm9+O7aQYwe0+n3RjE4zppnB
         xetA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwfLNEZQv9K7CWB8zYBSapN4P2ReDl4Xas72/PFj0XWabWAcNGi
	tOGgfa44gaykn+YwuhqYh1k=
X-Google-Smtp-Source: ACHHUZ5tFzu6uDByoAI9ZAs1A5nWFghrDmESPO8XUkCO84gxUgrQr798qwWj/MlLG/gPVqCd4U85uw==
X-Received: by 2002:a2e:b209:0:b0:2af:22a0:81f3 with SMTP id l9-20020a2eb209000000b002af22a081f3mr753991ljm.2.1684528862128;
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:311c:b0:4f1:4c37:e1cc with SMTP id
 n28-20020a056512311c00b004f14c37e1ccls572498lfb.0.-pod-prod-07-eu; Fri, 19
 May 2023 13:41:00 -0700 (PDT)
X-Received: by 2002:a2e:8782:0:b0:2af:1561:a73e with SMTP id n2-20020a2e8782000000b002af1561a73emr1166635lji.52.1684528860171;
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528860; cv=none;
        d=google.com; s=arc-20160816;
        b=BLt+HLdtMK+DPJBXWO9WpxN9i4mHpe9+0Utap19am0DVSzwfvpaf4SIn+Xwvp/O3Yn
         DfaFED9lJ9qpmTrIOSNrE2H12NTs8NKNWMlCPm9Z2iaPnS72S1sHX7RxmX7d2/ujOSWH
         iEgDqb4sU1n8P7TUc1RG99y/HI8DamcsgWNrUDUh8zf+xyXGtI/yT738NTMP5aZ55wLh
         MxRVKjSu84la6nVDsIL54dvDViSNjk/swBpnbEv6TNGO7uLtyQsbn3lSs989mSmKKP98
         GOCDOkDh7pIISOnyixFTZdO9N7AyJsbPnSu4VcrBclgaWpGokNq7df6jPGaBmvaCPH7w
         nqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=sgXfKvx9r9233bv2GQfNAh1Xi57jblskvkA9IfT+W9E=;
        b=FTndzKEWElGEalLroEFr83gP+kbMICcXbAwcDqlvDRkU+hol6nLSBukO7oiu1byqzE
         PeOD/9guyU9WpGkTAiwjTIfTCjR9DvTiE4ay3rYjLHgW8L65ArOnLnQToTdB2Y5nAXnl
         KnR3mj8hZp5EnHDtjA5Qldk+eJRPBkfogwA6rQ1JjAZxYFhO/sWrQcQJb2mBkErVaj+T
         kfP8FpsBE6t9K34oVBq+C2MWeVThiuTuTVbYxGMbwes4V0q7S5C+4MwYpDAJiJX7Jefq
         jRnm2XfYLjVlnB6q6v4srj395IAfNDRIYo9kjEKzhfiDhALI27lAVFobhiPtaI1RE9Q5
         E4qA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id d24-20020a0565123d1800b004f2538cbe55si12888lfv.1.2023.05.19.13.41.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdl1dPwzy99;
	Fri, 19 May 2023 22:40:59 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 57/73] configs: riscv: qemu: add inmate demo config
Date: Fri, 19 May 2023 22:40:17 +0200
Message-Id: <20230519204033.643200-58-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 configs/riscv/qemu-inmate-demo.c |  1 +
 configs/riscv/qemu-inmate-demo.h | 65 ++++++++++++++++++++++++++++++++
 configs/riscv/qemu-layout.h      |  6 +++
 3 files changed, 72 insertions(+)
 create mode 100644 configs/riscv/qemu-inmate-demo.c
 create mode 100644 configs/riscv/qemu-inmate-demo.h

diff --git a/configs/riscv/qemu-inmate-demo.c b/configs/riscv/qemu-inmate-demo.c
new file mode 100644
index 00000000..f0a3db6c
--- /dev/null
+++ b/configs/riscv/qemu-inmate-demo.c
@@ -0,0 +1 @@
+#include "qemu-inmate-demo.h"
diff --git a/configs/riscv/qemu-inmate-demo.h b/configs/riscv/qemu-inmate-demo.h
new file mode 100644
index 00000000..9d3e7abe
--- /dev/null
+++ b/configs/riscv/qemu-inmate-demo.h
@@ -0,0 +1,65 @@
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
+#include "qemu-layout.h"
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
+		.name = "qemu-inmate-demo",
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
+			.phys_id = 2,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = INMATE_TINY_PHYS,
+			.virt_start = 0x0,
+			.size = INMATE_TINY_SIZE,
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
diff --git a/configs/riscv/qemu-layout.h b/configs/riscv/qemu-layout.h
index 5ec52198..8f4d4554 100644
--- a/configs/riscv/qemu-layout.h
+++ b/configs/riscv/qemu-layout.h
@@ -20,3 +20,9 @@
 #define HV_SIZE			0x600000 /* 6MiB HV Size */
 #define HV_OFFSET		0x200000 /* Recent OpenSBI place DTB there */
 #define HV_PHYS			(MEM_TOP - HV_OFFSET - HV_SIZE)
+
+/* In preparation for IVSHMEM */
+#define IVSHMEM_NET_PHYS	(HV_PHYS - MIB)
+
+#define INMATE_TINY_SIZE	MIB
+#define INMATE_TINY_PHYS	(IVSHMEM_NET_PHYS - INMATE_TINY_SIZE)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-58-ralf.ramsauer%40oth-regensburg.de.
