Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBUHP7XWAKGQEVJ2RGEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93a.google.com (mail-ua1-x93a.google.com [IPv6:2607:f8b0:4864:20::93a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FED305A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 20:26:26 +0200 (CEST)
Received: by mail-ua1-x93a.google.com with SMTP id m45sf1812775uae.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 11:26:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570731985; cv=pass;
        d=google.com; s=arc-20160816;
        b=k50ymxDZ+KSfnaSDwK8CDTq7YIVG0XgvPigKvrJbV5PtwdygdaNQHiNlFOe4rfbJg1
         BYyeo1WA3tqlrKbNA8dpk6CtmV8254CHQew57iBx2iu5ud/UXrIOsFsxZwpE+1UPEybk
         7U96VugWo7WhJfUdtRKZU2P3MqcjM9Ud99uc1JxFGSSyYRxpVnVfis+um7m3qCg0ake8
         niC9Zfq21ip0GCWeuD5OWQktNzEg3XZHgX1hD/A+6BSNZ/+Pi/Locyv/mQZbffZsuhME
         vpCdCYpTm70yzmLs3PX3AWUu8iWfnXl4gAIi4sG5LI3apdU9s7oqwPvpEJOprSrKFx3A
         Dp6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=D1kyQbo4RJEsda2PQxq3bAbYs/suB8JYNUmsOvVrVmU=;
        b=COExt+hrrpyh2WE5AUY92E8bLf3ZBMrl6gPE16YlYdkOUtFbiNnjLUaMrj5Djmxhsq
         lcpDu6PPA1puEUs6HZ0hx2VKc4rzWWq9Nqwg+FzuxfRDgzORdXIPA/4M2OBNSoIQmr8k
         kbhLdu0H+Li5fL/VSfavDw6V+rUJ9sys37Y5ZvHT/Bn7CspHUJwxaXbmrvj/qp4DNQxF
         PAsmtVUobIqqR70EErSVEz10kR/muBhlhV7i83qaPIKW7TO77jrmXk0ww+t9uIldQMRb
         2fE3uzlu/QqSD/XK9WpdoFdXl1d3zi7puSTsURtdhDRXRU66w0iZ5TTJ8MxFxoZ2uM58
         CLrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y9mR6kfX;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=D1kyQbo4RJEsda2PQxq3bAbYs/suB8JYNUmsOvVrVmU=;
        b=fr3ZBkHgXaOCh/U1F54bRi5e9Z/YP199jXyFh6jlMP2qYHOFYFkgeL3/B6xK8WaIM7
         DjiMlxAGCHf/IHGU9Ua4SzmeXZ4xaynFYQLIMrRykZsUDSVeF5rQCtf1EGBnnEOctzqx
         aWMRtJnTFY7dFrVtHO3SK7z7o5IsWbX3dltdDoAW37I3HuNbqRSrUJQ9Rs0fEdFslp++
         Jy3rwMJJzvZ3DIqnZKEBpZLpJ/IO3IKW1N2xTD6K4557i0MFxk9GlJ4tZkXLnry3n7Wz
         T2oK9Xp7wWm099Jtj0CFlAbt43kkgTQ1KdUIskqGVf9I4cctW4KMYFEpU0fXZR5pw2SJ
         9fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D1kyQbo4RJEsda2PQxq3bAbYs/suB8JYNUmsOvVrVmU=;
        b=UXtBi8dfI3xJOzHpaRQBePzdaKtYKlbOFLUK/UJfaMPiDYGJPkczJImkfSWVstW+en
         TPG05Wwum1wLCIqObW4SBk4jyCsAErpx5iOg2ltAvB2sMo6caqaLBrUy5iaXtLl3Xqpb
         WgoYCq63IcLrVODv9MzYoqD2rXmVOTVkkK6EkiNa5IcPFgvsnmvSRsl91CDHMII41fbJ
         AIvc6HGfUKo26sDmcS2ejOKPzXa+uaD6TLQU9cS+krdDR3Hi11ulddJHeU+jB78t+F4S
         RUFXFu6DjFNwgF+OGpagDefdZZiUrmJlo1BGeH+xZf9l01ODfCFQqqSj3/yFnYfaObCY
         mZZg==
X-Gm-Message-State: APjAAAVfIr+1PSxywILtQVQczkfNV7pWr75aikuArxp664iiApd3h6rK
	Qdrpj03fnz2pBB3L4YGiuz0=
X-Google-Smtp-Source: APXvYqwQU6MmnP10MKAUz3q8BT66ldhI88sgj2rZH6goH0DobPp1cz+/vc28eMrJzOMXkfu67d3t+A==
X-Received: by 2002:a9f:3d82:: with SMTP id c2mr3446699uai.3.1570731985203;
        Thu, 10 Oct 2019 11:26:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:1684:: with SMTP id 126ls489542vsw.4.gmail; Thu, 10 Oct
 2019 11:26:24 -0700 (PDT)
X-Received: by 2002:a05:6102:253:: with SMTP id a19mr6460213vsq.37.1570731984610;
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570731984; cv=none;
        d=google.com; s=arc-20160816;
        b=D12+PmneFdzJyBxznZQFp4LsGVFUNGFOh87DH9Cobh5qEUv51y6UI2rExhZvr45UnM
         XxPY+DPbi96YySL98C9dhXLgJciKgSlVC18XkvwhavgsOpzPCvXkWxte5PvZrmoqBs9c
         KQWFtfO7PIyansaQ6DtJv5moIyRA4/rv1/iWZk6oDrILJnNF9RzbmvbYusaOwtoQNFQw
         fCvw7w2HohKtRifkOzKRZaoKYwcwisVtO5kZm5xTXoAZnNuK/79VUGhOGfh2NHv/E0ty
         bkOy9EAb0dc2CgKFzxKBKbABRCEdIHPPBPY2Lxlc+xuiFjKekDfEdZB3bfqbfa8JwOn+
         5NcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t6EjXXrF+405e7Cxyi+aZ9rIVNYO3wZ7fltlAToFApU=;
        b=PEsq6240+ShJpE3KXZhjPTKVerqAbN6LyjSP2BV8Umyyp48MJJMi+qRRirvf/hSQKG
         cFnwc3fJDgWU+YDDbErdSQXspY5dbyii8KBbLYZNS3fi4WlN79w4KySeZ2J3Ung7rSOv
         0KuejcvXVyF1bjI6IRxYiN+A4Id+dmXTFc3zA5d/axEIL2KWWlGeD6F/nkb7I5raENqR
         ab2bTmjgPclDBPjYN3iP4pde6dSiQ0QiK72fYIk8JyvdSDbPxkV/9iu2X3t77vmnZkOV
         ZN6L76G9foaK0pwgJa9oxLcgMiZLOCKDqpwePZ74Su43OIkqeAiZAQZ7j/KjwO2wr35A
         sNBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y9mR6kfX;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id v4si344677vka.3.2019.10.10.11.26.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 11:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQN1O053744;
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AIQNa1120163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Oct 2019 13:26:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 13:26:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 13:26:23 -0500
Received: from uda0794637.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AIQLl4008251;
	Thu, 10 Oct 2019 13:26:23 -0500
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Vitaly Andrianov <vitalya@ti.com>
Subject: [PATCH 4/4] config: add config files for am572x-evm
Date: Thu, 10 Oct 2019 14:20:50 -0400
Message-ID: <1570731650-5335-5-git-send-email-vitalya@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570731650-5335-1-git-send-email-vitalya@ti.com>
References: <1570731650-5335-1-git-send-email-vitalya@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=y9mR6kfX;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

This commit add root cell configuration and uart and gic inmate demo
configurations for TI AM572X-EVM evaluation board.

Signed-off-by: Vitaly Andrianov <vitalya@ti.com>
---
 configs/arm/am57xx-evm-gic-demo.c  |  76 ++++++++++++++
 configs/arm/am57xx-evm-uart-demo.c |  76 ++++++++++++++
 configs/arm/am57xx-evm.c           | 205 +++++++++++++++++++++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 configs/arm/am57xx-evm-gic-demo.c
 create mode 100644 configs/arm/am57xx-evm-uart-demo.c
 create mode 100644 configs/arm/am57xx-evm.c

diff --git a/configs/arm/am57xx-evm-gic-demo.c b/configs/arm/am57xx-evm-gic-demo.c
new file mode 100644
index 0000000..b4d0fce
--- /dev/null
+++ b/configs/arm/am57xx-evm-gic-demo.c
@@ -0,0 +1,76 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on AM57XX-EVM:
+ *
+ * Copyright (c) Texas Instruments, Inc.
+ *
+ * Authors:
+ *  Vitaly Andrianiov <vitalya@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[4];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "AM57xx-EVM-gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+
+		.console = {
+			.address = 0x48020000,
+			/* .divider = 0x0d, */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART... */ {
+			.phys_start = 0x48020000,
+			.virt_start = 0x48020000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART... */ {
+			.phys_start = 0x48424000,
+			.virt_start = 0x48424000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xee000000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+};
diff --git a/configs/arm/am57xx-evm-uart-demo.c b/configs/arm/am57xx-evm-uart-demo.c
new file mode 100644
index 0000000..0123e4b
--- /dev/null
+++ b/configs/arm/am57xx-evm-uart-demo.c
@@ -0,0 +1,76 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for uart-demo inmate on AM57XX-EVM:
+ *
+ * Copyright (c) Texas Instruments, Inc.
+ *
+ * Authors:
+ *  Vitaly Andrianiov <vitalya@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[4];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "AM57XX-EVM-uart-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+
+		.console = {
+			.address = 0x48020000,
+			/* .divider = 0x0d, */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART... */ {
+			.phys_start = 0x48020000,
+			.virt_start = 0x48020000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART... */ {
+			.phys_start = 0x48424000,
+			.virt_start = 0x48424000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xee000000,
+			.virt_start = 0,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm/am57xx-evm.c b/configs/arm/am57xx-evm.c
new file mode 100644
index 0000000..7573150
--- /dev/null
+++ b/configs/arm/am57xx-evm.c
@@ -0,0 +1,205 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Texas Insturments. Inc, 2016
+ *
+ * Authors:
+ *  Vitaly Andrianov <vitalya@ti.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[17];
+	struct jailhouse_irqchip irqchips[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xef000000,
+			.size = 0x1000000,
+		},
+		.debug_console = {
+			.address = 0x48020000,
+			.size = 0x1000,
+			/* .divider = 26, */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_4 ,
+		},
+		.platform_info.arm = {
+			.gic_version = 2,
+			.gicd_base = 0x48211000,
+			.gicc_base = 0x48212000,
+			.gich_base = 0x48214000,
+			.gicv_base = 0x48216000,
+			.maintenance_irq = 25,
+		},
+		.root_cell = {
+			.name = "AM57XX-EVM",
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* OCMCRAM */ {
+			.phys_start = 0x40300000,
+			.virt_start = 0x40300000,
+			.size = 0x80000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* 0x40380000 - 0x48020000 */ {
+			.phys_start = 0x40380000,
+			.virt_start = 0x40380000,
+			.size = 0x7ca0000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART... */ {
+			.phys_start = 0x48020000,
+			.virt_start = 0x48020000,
+			.size = 0xe0000,//0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* 0x48100000 - 0x48281000 */ {
+			.phys_start = 0x48100000,
+			.virt_start = 0x48100000,
+			.size = 0x110000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/*
+		 * Leave gap for GIC controller 0x48210000 - 0x41220000
+		 */
+		/* 0x48220000 - 0x48281000 */ {
+			.phys_start = 0x48220000,
+			.virt_start = 0x48220000,
+			.size = 0x610000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* OMAP WakeupGen */ {
+			.phys_start = 0x48281000,
+			.virt_start = 0x48281000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PRCM MPU */ {
+			.phys_start = 0x48243000,
+			.virt_start = 0x48243000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* 0x48400000 - 0x48424000 */ {
+			.phys_start = 0x48400000,
+			.virt_start = 0x48400000,
+			.size = 0x24000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART... */ {
+			.phys_start = 0x48424000,
+			.virt_start = 0x48424000,
+			.size = 0x2000,//0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* 0x48426000 - 0x48826000 */ {
+			.phys_start = 0x48426000,
+			.virt_start = 0x48426000,
+			.size = 0x400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* 0x48826000 - 0x48828000 */ {
+			.phys_start = 0x48826000,
+			.virt_start = 0x48826000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* 0x48828000 - 0x4B300000 */ {
+			.phys_start = 0x48828000,
+			.virt_start = 0x48828000,
+			.size = 0x2ad8000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* 0x4B500000 - 0x58000000 */ {
+			.phys_start = 0x4B500000,
+			.virt_start = 0x4B500000,
+			.size = 0xCB00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Display Subsystem & ...*/ {
+			.phys_start = 0x58000000,
+			.virt_start = 0x58000000,
+			.size = 0x8000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x6EF00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* communication region */ {
+			.phys_start = 0xEEF00000,
+			.virt_start = 0xEEF00000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* Leave hole for hypervisor */
+
+		/* RAM */ {
+			.phys_start = 0xF0000000,
+			.virt_start = 0xF0000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x48211000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x48211000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0, 0, 0
+			},
+		},
+	},
+
+};
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1570731650-5335-5-git-send-email-vitalya%40ti.com.
