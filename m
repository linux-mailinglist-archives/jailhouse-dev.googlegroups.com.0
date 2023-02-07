Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2MGRGPQMGQES42QTFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id AB40168D696
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:18 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id w2-20020a0565120b0200b004cfd8133992sf6269663lfu.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772778; cv=pass;
        d=google.com; s=arc-20160816;
        b=NDSeTbaLf/j/2s0fbl6SAYPrzI5OvQSoLQ+ubBcb8UP8zMl8OqFWgDpFHRdTqXL91z
         tgtFYuOSwjahjhakKKAjba4kltIOZniWKXAq8Z4guKax13hIQgoRq4fgltYvfNLyTaiP
         FtuDf6yHPfy/ynPNgh43UBKxxDKdB/pMmOlvefywrDeWx/49HFR7wOE/v9oqUgEDZinL
         SWTVAYtDx6i/eNv0Kr22Q4HC8qZV0Wmc5f8c8PdtplHqPahKmJtArYCzgO/EHYEfJXRb
         1w0F0NDzrHJc39OsMUn9jZqXM+gerHIDAg/7BJ2j2JcHk/+uw7tiTy8d3misHndyvkXt
         nBsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vGOSwsMTKPwFKHSs7AUaQPgXD5XLML0uNw2AXGgjU+A=;
        b=VDIWPJ/v2SGBAPn3Rihkj+LSO6+WMEgsCZ6GmAwFqJNgHZgpb5q/th8vS6XbX+yZIJ
         TD6rMZpTW5CAiygWX/6c7uwPYRM0JqHVoE8aHTehFR+FZwjjlsSLmwmLQ7e0W/abDROr
         fn3kscecvSuKm2CQC1RIzW9wXWyv6KPtvYMxyHjcjeuafuLSK6RY8WY0LymsJAuWvHQ7
         JbD3MsVHQ/8w7WD5/RIeOSR+hgIaEWEg6WpS9WxR/Si6Dzh4v7aF0cw5FWAmcjvWwJVk
         UpStbM0rgnN6mgEi0CyNFjDonWZV9KWsJtvAq49D6an7FGDhtwOTDejq+4yEcqoQvQS1
         W3aw==
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
        bh=vGOSwsMTKPwFKHSs7AUaQPgXD5XLML0uNw2AXGgjU+A=;
        b=cu32e4mlhKMS7IOiVObuWpqWdzi/hLMV8+k+St7MMIniLbI0kwN4ehtXglotQkmwRJ
         T8apjL2PlJT7e4VWYb63dNWtwWH+rGTQEF/CkTGreloE3TvzbsmKBun7NDkoCEn+rz5O
         zquEH/hg5jZSwg/aZvQdPyVaE9FMj+V+ohjfk/p0A6xFW99FokKRZj2oOwhCtYCdzm62
         uYt0z1tlzAfBRFOK3ISIwavaFSHgjLtlfa26H7fVG+T2jhQSN0SDhBqkqTSa7tljEUi5
         173P65CP2WyDYD7wA5998V5rqSN11TE2ggcWc1vO9VBxCe7zYpPYI/SqhLy9O/gPLV8E
         IaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGOSwsMTKPwFKHSs7AUaQPgXD5XLML0uNw2AXGgjU+A=;
        b=0wm2hmnBFAyIWxXPUSN0CtssaOUtjPf7BSkS/ONOEW77doeIfV6s8JB73pMKxd2xCb
         Cta0VQ5U+P7hbxG8KnGZHYvrCdQ/U+X5FoLn+xGznKJrlyqI1wtF+NZ1dqkNYSq6VLLD
         NR8f2ifNQN8OECWIiFcbEggyNbSq0CGY3C7LRHI5iFmDLPTJHVqLZU5krIjJQxick2iM
         v1ifjrM8KO676IT0Mv/WojGQ+B2F3Dcu+72zotjZqFBjGwZuevIHFcD33dP6gz8TxmES
         zgE4r6Wqof4LXzRYytC8j98MtcK2rP4Bn05VKBMjcGbGwbTOR4Zht7NogMyNCvBhYAzQ
         2S4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWbIqccI5AekeHGv0+tHy2OTtcokf8EdMitmGI/23+OJGel/+X4
	qc4X4bs3gkvjkIQqHrY+dWo=
X-Google-Smtp-Source: AK7set987bN+WbBeh/ONyNYFwu1kmdGDIt2kzhetMR1DAxM+pri7AExYeu/wlAiuGbOfpRfeRXc9lA==
X-Received: by 2002:ac2:5213:0:b0:4cc:53e2:5382 with SMTP id a19-20020ac25213000000b004cc53e25382mr410248lfl.220.1675772778282;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d1f:b0:4d1:8575:2d31 with SMTP id
 d31-20020a0565123d1f00b004d185752d31ls72255lfv.0.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:16 -0800 (PST)
X-Received: by 2002:ac2:5319:0:b0:4db:964:51b5 with SMTP id c25-20020ac25319000000b004db096451b5mr320366lfh.41.1675772776351;
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772776; cv=none;
        d=google.com; s=arc-20160816;
        b=caRSly2EIZpPWmQPhk5964zq8q3lnUNCjpUZkZwv1hau+XUBC8NVU7uFyAzD/+tcRq
         2tbC++bR5+T3NbGOV85ZdaHw7IFv+iP/EP65IRSpOa7b88sCFKL36Zp/g2HMvZOvJvWj
         mc6aTADd+QNx9uKW0WUvtplsSQ3qxSxs2tvtFEKyFHvDN8s1k5Vyck1l58XRjKaqzZ2S
         RRWjEMJtnM+cqqkO4CIlPYxbhABU8asfXS49O4bznnKXpQ23mEOSD5GfD6bd8px/ks3h
         zqmF/1wv61ox7CMlEqKJx7oxnVHEdUdfufMp83mP7VgWSxtSqTxAdY/gtDIRYTGpBh4i
         +vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=rtWj1PyJvBKqe1OnJW7H6aPEVXNg68mkPVTdmpYMZCs=;
        b=TMhs3A/EJxoJO2Ud40xSSIBsMyGmdaRlYBaYIyih0RLm3eBoevnLXOD4UowXhaM4EP
         VCF3IY0sgmH5gsW0B27GHFrNRE76URLfgtefpPpyn7Z3TAWLW6bkV2vopZrK+XLmTUu+
         leUVOAeoMcixuid9CGawGEUdTbiUbe7A07FWGe9brVHtLf3ToWMTSOUuk4ri69j0rjAC
         /wj3icUV6lpSL2Rw1BE8tpsdOLLnjM3O0YiYqc/Qha72q+6L/9lcTPq/exIRL41iK1c+
         DV4MGWzPHN3XferqzVxH42xOzaOcayy59VDGkxzj/nbAB+l/rabyfgSvw7SRh6yvfz8o
         e+XA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f16-20020a05651232d000b004d09f629f63si647746lfg.8.2023.02.07.04.26.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RW3mN0zxvr;
	Tue,  7 Feb 2023 13:26:15 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 37/47] configs: riscv: qemu: add system configs
Date: Tue,  7 Feb 2023 13:25:33 +0100
Message-Id: <20230207122543.1128638-38-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_25 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
 __URI_NS '
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
 configs/riscv/qemu-plic-mc.c |   2 +
 configs/riscv/qemu-plic-uc.c |   2 +
 configs/riscv/qemu-riscv64.c |  65 ----------
 configs/riscv/qemu.h         | 236 +++++++++++++++++++++++++++++++++++
 4 files changed, 240 insertions(+), 65 deletions(-)
 create mode 100644 configs/riscv/qemu-plic-mc.c
 create mode 100644 configs/riscv/qemu-plic-uc.c
 delete mode 100644 configs/riscv/qemu-riscv64.c
 create mode 100644 configs/riscv/qemu.h

diff --git a/configs/riscv/qemu-plic-mc.c b/configs/riscv/qemu-plic-mc.c
new file mode 100644
index 00000000..c70371d2
--- /dev/null
+++ b/configs/riscv/qemu-plic-mc.c
@@ -0,0 +1,2 @@
+#define QEMU_MC
+#include "qemu.h"
diff --git a/configs/riscv/qemu-plic-uc.c b/configs/riscv/qemu-plic-uc.c
new file mode 100644
index 00000000..1439aa95
--- /dev/null
+++ b/configs/riscv/qemu-plic-uc.c
@@ -0,0 +1,2 @@
+#define QEMU_UC
+#include "qemu.h"
diff --git a/configs/riscv/qemu-riscv64.c b/configs/riscv/qemu-riscv64.c
deleted file mode 100644
index 3c68ad71..00000000
--- a/configs/riscv/qemu-riscv64.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Configuration for QEMU riscv64 virtual target, 1G RAM, 4 cores
- *
- * Copyright (c) Siemens AG, 2020
- *
- * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- *
- * NOTE: Add "mem=768M" to the kernel command line.
- */
-
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_system header;
-	struct jailhouse_cpu cpus[4];
-	struct jailhouse_memory mem_regions[1];
-} __attribute__((packed)) config = {
-	.header = {
-		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
-		.hypervisor_memory = {
-			.phys_start = 0xbfc00000,
-			.size =       0x00400000,
-		},
-		.root_cell = {
-			.name = "qemu-riscv64",
-
-			.num_cpus = ARRAY_SIZE(config.cpus),
-			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		},
-	},
-
-	.cpus = {
-		{
-			.phys_id = 0,
-		},
-		{
-			.phys_id = 1,
-		},
-		{
-			.phys_id = 2,
-		},
-		{
-			.phys_id = 3,
-		},
-	},
-
-	.mem_regions = {
-		/* RAM */ {
-			.phys_start = 0x80000000,
-			.virt_start = 0x80000000,
-			.size = 0x3fa10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE,
-		},
-	}
-};
diff --git a/configs/riscv/qemu.h b/configs/riscv/qemu.h
new file mode 100644
index 00000000..c44f5bbf
--- /dev/null
+++ b/configs/riscv/qemu.h
@@ -0,0 +1,236 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for QEMU riscv64 virtual target, 1G RAM, 6 cores
+ *
+ * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * NOTE: Add "mem=768M" to the kernel command line.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+#ifdef QEMU_UC
+	struct jailhouse_cpu cpus[1];
+#elif defined(QEMU_MC)
+	struct jailhouse_cpu cpus[6];
+#endif
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_capability pci_caps[6];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_RISCV64,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			/* N.B.: 2 MiB megapage alignment requirement */
+			.phys_start = 0xbfa00000,
+			.size =       0x00600000,
+		},
+
+		.debug_console = {
+			.type = JAILHOUSE_CON_TYPE_RISCV_SBI,
+		},
+
+		.platform_info = {
+			.pci_mmconfig_base = 0x30000000,
+			.pci_mmconfig_end_bus = 0xff, // ??
+			.riscv = {
+				.irqchip = {
+					.type = JAILHOUSE_RISCV_PLIC,
+					.base_address = 0xc000000,
+					.size = 0x600000,
+					.max_irq = 96,
+					.max_priority = 7,
+					.hart_to_context = {
+						[0] = 1,
+						[1] = 3,
+						[2] = 5,
+						[3] = 7,
+						[4] = 9,
+						[5] = 11,
+						[6 ... 31] = -1,
+					}
+				},
+			},
+		},
+		.root_cell = {
+			.name = "qemu-riscv64",
+			.num_cpus = ARRAY_SIZE(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
+
+			.vpci_irq_base = 32,
+		},
+	},
+
+	.cpus = {
+		{
+			.phys_id = 0,
+		},
+#ifdef QEMU_MC
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+		{
+			.phys_id = 4,
+		},
+		{
+			.phys_id = 5,
+		},
+#endif
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x3f900000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* rtc@101000 */ {
+			.phys_start = 0x00101000,
+			.virt_start = 0x00101000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* uart@10000000 */ {
+			.phys_start = 0x10000000,
+			.virt_start = 0x10000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* test@100000 */ {
+			.phys_start = 0x00100000,
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* flash@20000000 */ {
+			.phys_start = 0x20000000,
+			.virt_start = 0x20000000,
+			.size = 0x02000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* flash@22000000, 2nd range */ {
+			.phys_start = 0x22000000,
+			.virt_start = 0x22000000,
+			.size = 0x02000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* MemRegion: 40040000-4005ffff: e1000e */
+		{
+			.phys_start = 0x40040000,
+			.virt_start = 0x40040000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* MemRegion: 40060000-4007ffff: e1000e */
+		{
+			.phys_start = 0x40060000,
+			.virt_start = 0x40060000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+	},
+	.irqchips = {
+		/* plic@c000000 */ {
+			.address = 0xc000000,
+			.id = 0 /* PLIC */,
+			.pin_base = 0,
+			.pin_bitmap = {
+				(1 << 0xa), /* uart@10000000 */
+				(1 << (0x22 - 0x20)), /* PCI INT C / slot 0 */
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* e1000e */
+			.type = JAILHOUSE_PCI_TYPE_DEVICE,
+			.domain = 0x0000,
+			.bdf = 0x0010,
+			.bar_mask = {
+				0xfffe0000, 0xfffe0000, 0xffffffe0,
+				0xffffc000, 0x00000000, 0x00000000,
+			},
+			.caps_start = 0,
+			.num_caps = 6,
+			.num_msi_vectors = 1,
+			.msi_64bits = 1,
+			.num_msix_vectors = 5,
+			.msix_region_size = 0x1000,
+			.msix_address = 0x40080000,
+		},
+	},
+
+	.pci_caps = {
+		{ /* e1000e */
+			.id = PCI_CAP_ID_PM,
+			.start = 0xc8,
+			.len = 8,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSI,
+			.start = 0xd0,
+			.len = 14,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_EXP,
+			.start = 0xe0,
+			.len = 20,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_CAP_ID_MSIX,
+			.start = 0xa0,
+			.len = 12,
+			.flags = JAILHOUSE_PCICAPS_WRITE,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x100,
+			.len = 4,
+			.flags = 0,
+		},
+		{
+			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
+			.start = 0x140,
+			.len = 4,
+			.flags = 0,
+		},
+	},
+};
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-38-ralf.ramsauer%40oth-regensburg.de.
