Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXN5T6RQMGQEJSKAQOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8970A0E9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:02 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-4f3b18ee692sf428753e87.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528861; cv=pass;
        d=google.com; s=arc-20160816;
        b=fnf6qEsZ9fwOVea2sNp+q5yCoDB4i14iv/hHnvebi8Y6zKJniH4P0KGhapfpVvSeGu
         0aiBarmp71b4SM49ON2VY3CLM3h9q+gXdXnx5I9mXg64IqrrK9ds6nyD0gjnDEoHeKJ6
         Vn0G47UlrJ8FlLmB7kYHUp2OT7Fl6qwiEjf46M+20H+oWSub5CpOk+MXfHsH3vqKjSba
         my88N7qOtnQPEn8b2ZCdpB2+1Y2IHhlWNRpWe67HiI6bNrpo22lfoS0zT3LaVDZFj+30
         nkQnm4kOISovioiR5daxrtrQjyll1BEpyo1mGm0kKw339OZXU24X+u4jD2+b6h2hjh/T
         AcXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=r9h99nEweqsabhT2RDf+OUVm5Ty8iLcVUovjqLpC+p4=;
        b=puVmSAETsaHnztSXMfzKTVmUZ/MNrpYkGKG9xPGb+KcqXkL4urAhQfhhXFYKuLFaPX
         9FCuzZs9J6X21DKhVKFs27g7SXhiFH3JH1fYm3ZyDA6cOLAyBZmZ8pbI0r1LRHfbP1zg
         FGWSTAwcunzuXR5+HkZ5UT/tLjvWe1KaRXJzHBKhBOpLD+w9fSWX0/tC0Lp1dYlrPdar
         7VXW8mCJvlRS3wMV+TfGN2DRoBg3JHAmM5RdYysWP4jicZYpMTEoNHF+ExM3n6A5BCcf
         QvCPh6Qq5rypRHY+jRiLYqxfEB+ATdDOPAPVxMJqRW+LbCNKrRW69dx1hygCLS7KcmAo
         dgAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528861; x=1687120861;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9h99nEweqsabhT2RDf+OUVm5Ty8iLcVUovjqLpC+p4=;
        b=VS1PHwYHCmLZXR9z0HTvfh5uGNrE8bPgGFyWcBUYmc/BwP4VvSyl+PUIVWWq3VYqOk
         zdq4AXUzzN9+kSodUlP2FUniwAzDCNnGPlmejGbMUuARm3DYB5+rDPCi5fhX8rN5UhS4
         umn9TbW09PSQc0oxUCi2iHpFSKPLxZyqqdqKyTIOSOSQkWszh2TX+FrR3haiBEiJp/dN
         o5IDfMsdIp9IUPk5zpzzSsVugXthh05EwlxEL4QIB4HBoQk/n2bkWrqgIiVLDhEdA+so
         qaR94qzRtMSX43znbLHfzUp7olBpZSdeQKUk+11l1/1DU7ocnnAkQ6VgVV0nVV1PnlZk
         gEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528861; x=1687120861;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9h99nEweqsabhT2RDf+OUVm5Ty8iLcVUovjqLpC+p4=;
        b=KtviZP+B8PkvJb3aHFcd1rGamWh/ee1oxGLu00rhAUvan+Ei37Mxn2RU4LRWY9az1l
         PzhuC2VI3hhNSpmkCXLFk686Iuf5tStw6qLBOh4B33TzVXz9yERnQIHz6+tgVOvyfnnl
         ZQ0ofUoigsR72gdHgy2tpiEfPoWNV/cy8BTAZj7vVZ3OsYzvzyGwjZ35hlVNiDNvYGm9
         lLoENTU0gWrXJTA2D0Dpzap1qBGsixMup3jkf3qtJn/WzhvRaA0reixN9++lGHy0fLCl
         Y7QDtU8ymKVnAMH7tMLCBVBdooLaxWi5KmdOT7sdLAZ42ZWw6qbtw7PXQ6vZqZ2z+FPj
         WTVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzAJL/KM9vmRaycFQcXn7Fxeb8N6WiR1GiRfBNNKlR1zs/pJUmn
	bQf9IdEYotQwTZ2iVw8Pee4=
X-Google-Smtp-Source: ACHHUZ5YiQ6C8pQvrZqVTeIvxE6xXT7UY+q7Cn/4blcrUTlHq1YWg1OUwFPNjoA6Tkquoz4S4WcvDg==
X-Received: by 2002:a05:6512:515:b0:4f3:a483:55f with SMTP id o21-20020a056512051500b004f3a483055fmr794355lfb.4.1684528861555;
        Fri, 19 May 2023 13:41:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2124:b0:2af:25fc:42a2 with SMTP id
 a36-20020a05651c212400b002af25fc42a2ls365087ljq.1.-pod-prod-02-eu; Fri, 19
 May 2023 13:40:59 -0700 (PDT)
X-Received: by 2002:a2e:8091:0:b0:2ad:fef4:94f8 with SMTP id i17-20020a2e8091000000b002adfef494f8mr1177400ljg.6.1684528859722;
        Fri, 19 May 2023 13:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528859; cv=none;
        d=google.com; s=arc-20160816;
        b=O4x/xvKnvxHWQh0eNaRPIbHdNggBFccy5ybpqftChNTNjSzi93Zem110MZ+JyTFTuZ
         0zTzJNbyLlBuszrkDxSqJGzfttdkCG3/dTuneMU+ZlSp20Jwog7MHebrCyeljxHyxFE/
         zNfTZ/rgpmU20EK0nqKXTmXRwx4BVaSNW1sjkIAF4VF0kN/bUEPfnYznFBd9SHPj7CE8
         ihVm/IZtadZHLEDX2AO5mjDg94bOav+pbtsAZO3fVJ32EFtxEorlh/Duqc6inx+xSBPs
         gK8RcCCV603HgpYUB7jS7qfHP1Stc9Nlz86et8yuqP+OikhjE1OiKIibl4VK5Mykc1wm
         eHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dMa1LNNxtZPBLOa/J+wfSgBBZ3B7kgVr2P9SvUtN3gw=;
        b=loMQgBGDQadQe/vNR/tbam+BTdRJln3STQBKuMIh/WOgdnh9OdE7D+EDxxw/w4tF6T
         7vYUE3+rey17POs78mrU/W6oleZDMHRpLaPh7nw2+iqQ+PrittPH/5ceFWyRZrF61a8Z
         m3fsL1LLAdoxMRBPwOsTjz+j4hC7EgTPTR9IyOQNXm/mE/3jzQNf+WIM+2Ud7JvESl3o
         XkIyu29K0Sm7N/x1VwFDfuDTRW3E5GyqO81pOdHYXe7sb6t6SKZLowXr55Z+veD0we1Q
         l3YmCA4D2YzWnA/ihzm9vMYC1t30lR9a/UZVEfycan1Z+khBGBRyuo1TmfenjhG6X1W6
         e0dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id d24-20020a0565123d1800b004f2538cbe55si12886lfv.1.2023.05.19.13.40.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdk246Gzy0n;
	Fri, 19 May 2023 22:40:58 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 56/73] configs: riscv: qemu: add system configs
Date: Fri, 19 May 2023 22:40:16 +0200
Message-Id: <20230519204033.643200-57-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_25 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 configs/riscv/qemu-layout.h  |  22 ++++
 configs/riscv/qemu-plic-mc.c |   2 +
 configs/riscv/qemu-plic-uc.c |   2 +
 configs/riscv/qemu-riscv64.c |  65 ----------
 configs/riscv/qemu.h         | 244 +++++++++++++++++++++++++++++++++++
 5 files changed, 270 insertions(+), 65 deletions(-)
 create mode 100644 configs/riscv/qemu-layout.h
 create mode 100644 configs/riscv/qemu-plic-mc.c
 create mode 100644 configs/riscv/qemu-plic-uc.c
 delete mode 100644 configs/riscv/qemu-riscv64.c
 create mode 100644 configs/riscv/qemu.h

diff --git a/configs/riscv/qemu-layout.h b/configs/riscv/qemu-layout.h
new file mode 100644
index 00000000..5ec52198
--- /dev/null
+++ b/configs/riscv/qemu-layout.h
@@ -0,0 +1,22 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for QEMU riscv64 virtual target, 1G RAM, 6 cores
+ *
+ * Copyright (c) OTH Regensburg, 2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define MIB			(1024UL * 1024UL)
+#define GIB			(1024UL * MIB)
+
+#define MEM_TOP			(0x80000000 + 1 * GIB)
+
+#define HV_SIZE			0x600000 /* 6MiB HV Size */
+#define HV_OFFSET		0x200000 /* Recent OpenSBI place DTB there */
+#define HV_PHYS			(MEM_TOP - HV_OFFSET - HV_SIZE)
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
index 00000000..940efb3f
--- /dev/null
+++ b/configs/riscv/qemu.h
@@ -0,0 +1,244 @@
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
+#include "qemu-layout.h"
+
+struct {
+	struct jailhouse_system header;
+#ifdef QEMU_UC
+	struct jailhouse_cpu cpus[1];
+#elif defined(QEMU_MC)
+	struct jailhouse_cpu cpus[6];
+#endif
+	struct jailhouse_memory mem_regions[9];
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
+			.phys_start = HV_PHYS,
+			.size =       HV_SIZE,
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
+			.size = 0x3f600000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM - OpenSBI DTB */ {
+			.phys_start = 0xbfe00000,
+			.virt_start = 0xbfe00000,
+			.size = 0x2000,
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-57-ralf.ramsauer%40oth-regensburg.de.
