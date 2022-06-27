Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNPB42KQMGQELDM5QZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E5155BA0C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:26 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id bq4-20020a056512150400b0047f7f36efc6sf4672282lfb.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=cjlkp5d7LQe4cu1YPoWQU+NanSvzPmQaMhLxqBlI9CYnjRO7QKSyrYHLQQk9+MVt8P
         RclMXz8UuiGfzc+8nrCk9HZD3xq93gYrNJYFS/OB6Y42ePYeBqnbNYpqCrFxyB7Y/7Tr
         TTaaVFnE+EPbkJhQcFZOTnmR+7I0HpAotynjKeLMZlPSOdmitu3ATfpyQLciMFwMsNsK
         Ol0R1Kvd4N6+dmPHsfr8zMFLKTITATG2W7a6M/uaJTvd+DIfCWZpw5qVzpArLr8kYje8
         5gQbWJQIc7KrXMlNOAjdZ7RznuuJqS7xq91HHIIQ0iWan/7Usj2x5yBa8oyb6n/TwKT8
         e5rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=BE3/jkvDUkTVUP92BYKhimkCThZ4l8yVLnfwc+PdoBc=;
        b=uWiRU2Ar+RY38azcsD09H+eYHLeug5e6Ds7pCjQmuwLuOMB0OYOxiQhSgCZyi3sLHZ
         6a3IN96Z0Ee3Vy3SehwLQjqxJm4t7GPW1HsW0cXuPyCCz4JBBWLAMEcFjjrgyqWECupy
         agd3lKVmpSfbIhbgWhpywWRqAdJpFyW6teJxieCOoUWlawtALQvn87ygsB+4AclrPCb7
         /8sEsQGCyRm50yh4+XvFJGqd70XyxnP5NuQcq3K5InGMWQoWwjA3Qohx4mtu3kRPEL5h
         8gzoe37yJ7ZdwKZ4cQvgULOFqGoMUgY0N2jQVFU2IeaVU/ABk+HBxo0qxiCPOVWVdm/r
         ho7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=op8k1QVp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BE3/jkvDUkTVUP92BYKhimkCThZ4l8yVLnfwc+PdoBc=;
        b=AGTp4+IsKhWxXCvSOpOhznZ7KTAHjSpbSPAGZjTaWDONZqHcSd9AcWC2ipnWl/Jt5/
         CXqD8Q5GCofwil4K6+efIF9/Py9n91stVJPKYhShYIaENBlzgtJ6nS22BxqCfqTQ/qMm
         1YDPgJndbVLEwmtzMUAZEx4Uck+0q2HxYUkvleC+DciLGwneC3pc/UoPlnf+DBygkLkj
         PqeOM55OvtQg/YewqHtHVAr/HCMFq7IkdVBK8INGNT5XMun6NaM/5bfZ7ufjh7EPpFnw
         LmVLhEDrNpfegxgMLXotbb0v24qOSOfaH/DrY9WtZFe3ZSXCllN5AfM2N7oJUkHUoQhV
         KVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BE3/jkvDUkTVUP92BYKhimkCThZ4l8yVLnfwc+PdoBc=;
        b=BQhpMFEQRHBhw3QzouWDgr20HIFSNbtmwT1ZUhDtTjSCi4TuReYC1rnAMulujjLt15
         FthXtVNMfJJhPqbJWr2SX2lpZVKLeh4DiKW/RrDyp5FhiDgPdjXSmpc6aDXC/vwsfODb
         zZ1cUN5LGZOOzfSjvqR3hyQGJOqK//YNE6K/M/xfhy0o957GurQlJmqPuTRaRMbCP8O5
         brpLvDRqT4y+1mICxh4VAmwkXXTyQeUwZPUJ6uSpYT92xf5O1fnus56QA/ivd1iMq8mo
         95AHP2doCRf/A1dETJi+ZdzFY7uid75lg1EkZWGyBXGOvVjs9rkmB01nVILeiuI8c6o1
         zcLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8xA6PVZBYos44j26q+O6rLFOKesxVyvZ/L22vQNIGQZ7WVWCq5
	pEWB29QyW3K0Z5Abx044c/8=
X-Google-Smtp-Source: AGRyM1tty/a0D5Gt9POQcM/09OW5qG+skNsWX/VGtXxYB2cJeKPyXrZImlGvpAdFAsTljvcxv/9Fww==
X-Received: by 2002:ac2:4e4e:0:b0:47f:b3c0:2f3d with SMTP id f14-20020ac24e4e000000b0047fb3c02f3dmr8154418lfr.15.1656336565600;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e81:0:b0:25a:a178:9815 with SMTP id f1-20020a2e9e81000000b0025aa1789815ls1132176ljk.6.gmail;
 Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
X-Received: by 2002:a2e:990:0:b0:25a:7c03:eb70 with SMTP id 138-20020a2e0990000000b0025a7c03eb70mr6957597ljj.350.1656336563940;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=eSx0VOe1XjmrddnjdzHH2RY/X4RSXr4vMqOc4iiz/XUlanX0npS8EPxH5A/E9W2zNo
         dEzn1lhwD8Lg4VnZmbLZb4d7dd5375zFpT6dgOKNx9mWz9vqqbg36vQv/PSwvQVDVGQo
         ksQurHeTheUVDGaPXss5suLeLCXCqYQqdvcx9OjzHL9JtXa7Li6uMaWM9iNSNNAJqjdu
         qDeyowhkuzMMln1vXsidtNoqNnnYNveZzumwKKgCADyBxCoCDeeKuXNeFkHZoZmZVjZv
         BFzYs80d0WfwXzkVBrbttqhBH50Qk27BaEuWb11sD8RUZ9ikK+bX8OtUzGFBeNUPPf5g
         PsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Jnm0VyOOeja7Jr+LKPOrE8BSD9CB3wXL87nwLjiaxuQ=;
        b=eitMz6pTMuriyd3OSRKwHET74KuLPoMcRYMmE6VKQTaa4OPJf0F24c84wSD5u0LcZi
         zoY6Sxf73gtyorOkLAn9GVvpVJu7LJPt/JOhy7Hu71hly+zWYBkm4gTxgdWCiB8eV7J6
         fpEzepbWfqXjhmkVq2UD8wYCSI8UitOWs4Z993eHITPp3zwqGDCw+tP7pvfJ/+prr7UQ
         674h4Yed1EESrbIKSNHFcqD70B89LLtvc1cqT0EBPKVN6XWFqnAdtarxy8TrAfjiLUtL
         mghFIj13+19Tbf9hwv5TVuZwMxskyDMdd2ldNlcLewMyn+vrANaE+NXI3585pgsm/c+A
         iYLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=op8k1QVp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id g14-20020a0565123b8e00b004810be25317si193405lfv.4.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC2bKhzxxZ;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:23 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 37/42] configs: riscv: noelv: Add system configs
Date: Mon, 27 Jun 2022 15:29:00 +0200
Message-ID: <20220627132905.4338-38-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=op8k1QVp;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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
 configs/riscv/noelv.c | 143 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 configs/riscv/noelv.c

diff --git a/configs/riscv/noelv.c b/configs/riscv/noelv.c
new file mode 100644
index 00000000..08389cb0
--- /dev/null
+++ b/configs/riscv/noelv.c
@@ -0,0 +1,143 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for NOEL-V riscv64 target, 1G RAM, 6 cores
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
+	struct jailhouse_cpu cpus[6];
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[0];
+	struct jailhouse_pci_capability pci_caps[0];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0x3fc00000,
+			.size =       0x00400000,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0x40000000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = true,
+			.pci_domain = 0,
+
+			.riscv = {
+				.plic = {
+					.base_address = 0xf8000000,
+					.size = 0x4000000,
+					.max_irq = 31,
+					.max_priority = 7,
+					.hart_to_context = {
+						[0] = 1, /* S-Mode of Hart 0 has PLIC context 1 */
+						[1] = 5, /* S-Mode of Hart 1 has PLIC context 5 */
+						[2] = 9, /* S-Mode of Hart 2 has PLIC context 9 */
+						[3] = 13, /* S-Mode of Hart 3 has PLIC context 13 */
+						[4] = 17, /* S-Mode of Hart 3 has PLIC context 17 */
+						[5] = 21, /* S-Mode of Hart 3 has PLIC context 21 */
+						[6 ... 31] = -1,
+					},
+				},
+			},
+		},
+		.root_cell = {
+			.name = "noelv-riscv64",
+			.num_cpus = ARRAY_SIZE(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
+
+			/*
+			 * This IRQ must be BELOW the .riscv.plic.max_irq, as
+			 * Linux won't address any higher IRQ
+			 */
+			.vpci_irq_base = 28,
+		},
+	},
+
+	.cpus = {
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 0,
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
+	},
+
+	.mem_regions = {
+		{ /* RAM */
+			.phys_start = 0x0,
+			.virt_start = 0x0,
+			.size = 0x3fb00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		{ /* uart@fc001000 */
+			.phys_start = 0xfc001000,
+			.virt_start = 0xfc001000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		{ /* greth@fc084000 */
+			.phys_start = 0xfc084000,
+			.virt_start = 0xfc084000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IVSHMEM shared memory regions (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
+	},
+
+	.irqchips = {
+		/* plic@f8000000 */ {
+			.address = 0xf8000000,
+			.id = 0, /* PLIC */
+			.pin_base = 0,
+			.pin_bitmap = {
+				(1 << 1) | /* UART */
+				(1 << 5), /* greth */
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+	},
+};
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-38-ralf.ramsauer%40oth-regensburg.de.
