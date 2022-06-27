Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBG242KQMGQEGXTVKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B218255B9C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:41 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id az40-20020a05600c602800b003a048edf007sf1164262wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335621; cv=pass;
        d=google.com; s=arc-20160816;
        b=J3pR+swKZIqtm7480n5rrWffd+BoKE/V33/Dxrm6pxxCZS9p30BcZEubEzh/pz7TBL
         f8kY4LHFisoEbe+nnhx3eh0wk9azllIIHP3Dvgorgdn3hjI/auObrZm/l4ySJ8srUXsR
         Ckfik1uC4EuPNu70e1Cvv7RbPWFx/zrNw27W6EqEW/zcgha4OJlXT4tNeKRTIM6SVIKO
         qS5LjjX8NBDincYyIGqz0nmFeZ1L0GfxIh5P+kpO+cgCiTKoXAjGtx92jPkR1ASYKPFO
         AJE/HPYC+LYTVRyb3PofCs6X8Wb97Ik10BWfc86yvw2cA359HOfq3/odr3M35czSBntM
         tDag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ohywvQSvwBMul1Lfha2GjUoNaDGGEPqXNUEc8hHg+/o=;
        b=jL+onabuKHyi6+L7Iv7MMAuQVd/RlNm9iluPwj4uelUemPzJ01+wbVxT5mOx/X7a9p
         fq3xyjgUedV5U47QHjL4k10D9olW838TDalFVY+pLcjn3fVduDUZcvjSdSZdXadJaH1t
         +8rMImdYNGYxXxWPa0biyBrBZWvqCyOlzJFhW6GH+Q7U9nJTy5h9Cvqjv8D9p255kiWS
         sY1nn3TFSI1Au3zNkaSN+bhK4XGe8SEKNViA80JF5hOQ81f+11OJ8SSigYUnltJ0lr+q
         ZRS8dihns3aitkA2inBHSwWkPGByn2wlpjUD3DcpyHO9l4+bZQT7roXM8yUqPlMceu2E
         YOCQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=W0vWOzDr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ohywvQSvwBMul1Lfha2GjUoNaDGGEPqXNUEc8hHg+/o=;
        b=FjwVbv7bdOn+3ASozXtKJ2wTK6d6lx2AhDFWrvWZa0vLuP35QWBfErURpGMPxRVsSM
         LOTPvuB9ohqMWRpH68DJPMUe3pEX2ldAeeltq0W8F+4wpvF/Lb7ls5Er/9EAon9tanAO
         IGy3J+OEUtIzDk1FfIMVTqch6qLGqr0mY8bhb5QQSvMROsgA/ChQeNVHNPyOnASxFta3
         CcPzfWCv7iStaPSU8ULUBaNIXbTKzNRLjEFyLsXl9921RDkU2FgRdPFwB42hVdOEH35d
         yUgjiSpnl/vUc9DxX9l+UegZ8YA/4AOkaQ12vYqwr8e9BzCyvfQdYnKPk8TuZeL8c75C
         a0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ohywvQSvwBMul1Lfha2GjUoNaDGGEPqXNUEc8hHg+/o=;
        b=hzm0/Z2OMuZLm/M2W/2Ez7jyhqe6dHIB+83zJ3CBtNIraBJ8KvpcpGdDmvYGNi/vH5
         2KVEZi1lB71bAn/sPeBJA1glLAfSg/QD572fHY03vEoCc/e+i9vrKGtvOzfdNIMinEiY
         IHkJCmp+3IQHnr7q2BaYwfCn8FA4OJdmdMYzWj+WtxSV8xmfUFnesEKMn5TblCZgdQE6
         6BzRDrJPHICUlTjVPdc3NZwMtRDt8Y2fpyhydQwWmOTNYBb80JpUzHPWmLWCwc/ZtUwY
         hu4y164ZWkOz0O4o/OozN7+BnJJP4uxy9yJ0v6wkZM8eM2eV5qvKCu66OOaEtuDHT8Ic
         95rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora93IBQ4AsCY7pnL6ZkIYGDMrDEiJBJIAEG24RyH5A/c0890ziZb
	0r8fVnkuW1JCMzvJDwdRByA=
X-Google-Smtp-Source: AGRyM1vfIUpyK0UTVEBxObdu+7Ue19ocQbHTnoNcUXA7K02Eg9DRJsKft3PZWgBAUn8q2RBdYbZC9Q==
X-Received: by 2002:adf:ea87:0:b0:21b:83f8:d911 with SMTP id s7-20020adfea87000000b0021b83f8d911mr12079112wrm.556.1656335621466;
        Mon, 27 Jun 2022 06:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4ec7:b0:39c:871d:313f with SMTP id
 g7-20020a05600c4ec700b0039c871d313fls3208267wmq.2.canary-gmail; Mon, 27 Jun
 2022 06:13:39 -0700 (PDT)
X-Received: by 2002:a05:600c:1d94:b0:3a0:4e09:122f with SMTP id p20-20020a05600c1d9400b003a04e09122fmr1912803wms.190.1656335619770;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335619; cv=none;
        d=google.com; s=arc-20160816;
        b=uT5Tcpv7bkIFbDwolLkhfJvH9aJwRhbHwHzc/3F66FUsnnjcmcKypBuiaOdv8VGIhT
         IOn9IdVzMpEMi6QXvuM9iqAMdxSMLvCaAkeMjmAByrDIrhf+zBi2Ieyn3B5BkNhyZslv
         9DTPBHtQt5DbJBbkz2q8HQ01AiUC6U4MGw8DObjnTJNdvMueMKbIkgte2JL+v7fpUXOH
         oozeWKedmkayXB47Us7nXzSU8HzKH+nF7MH0rEPmHlsCD9l7vOAxKjyevydxRaBdmNuK
         bjMWbsfUFd7BadTbuBbzn+aO3pYny05ee3fltEkNS7m3ZqpcICwrKjXnv8Dg7edAndI+
         XiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1pEb3040HghAB/umgu2VYCmwloNoZuekIVAgY6vmCBY=;
        b=opryEViBK1GKUUC3ISvnkjJLBwGp87HlHZxjyWfNKTmfhL8vQtUwBoJwsDAK9x/xU4
         ehQHx9SAW7kirVROKeifxi9Y3QC70K9nnOWhK050/G8Dm+sHjJes4AL6PTUCeTDw6vRH
         DcSkIkHT7FPcnx47I3C5Nqw4cVLHmoIcoxYq83OlX5N8dzPDwKENeEu9S9WaEWmD+uJr
         glzlmvsE5PdejkqB+D3uAQUey3GoI1Xx2FZxSTx7Q8vrK8K7+Gh26mpSbaZHDBu97JKF
         vrWo3+4WBTk3G2n2P1CoWAN94kr/cIxR4jRn985+X9mnqBdrcaLpmUNY+gcXiCUaD1As
         bGOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=W0vWOzDr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id f3-20020a7bcd03000000b0039c4133ae38si474742wmj.2.2022.06.27.06.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp8334H1zy87;
	Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:39 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 20/20] RISC-V cornerstone
Date: Mon, 27 Jun 2022 15:13:29 +0200
Message-ID: <20220627131329.3659-21-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=W0vWOzDr;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This allows to build Jailhouse for RISC-V, using QEMU as a first target.
The assembly entry routine can be called and returns a funky error for
now. All the rest are stubs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
[ralf: rebase to next, add stubs for missing routines]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/qemu-riscv64.c                  | 65 ++++++++++++++++
 driver/main.c                                 |  2 +
 hypervisor/arch/riscv/Kbuild                  | 17 ++++
 hypervisor/arch/riscv/Makefile                | 13 ++++
 hypervisor/arch/riscv/asm-defines.c           | 19 +++++
 hypervisor/arch/riscv/control.c               | 78 +++++++++++++++++++
 hypervisor/arch/riscv/dbg-write.c             | 17 ++++
 hypervisor/arch/riscv/entry.S                 | 17 ++++
 hypervisor/arch/riscv/include/asm/bitops.h    | 37 +++++++++
 hypervisor/arch/riscv/include/asm/cell.h      | 24 ++++++
 hypervisor/arch/riscv/include/asm/control.h   |  0
 hypervisor/arch/riscv/include/asm/ivshmem.h   | 14 ++++
 .../arch/riscv/include/asm/jailhouse_header.h | 14 ++++
 hypervisor/arch/riscv/include/asm/mmio.h      |  0
 hypervisor/arch/riscv/include/asm/paging.h    | 54 +++++++++++++
 .../arch/riscv/include/asm/paging_modes.h     |  0
 hypervisor/arch/riscv/include/asm/percpu.h    | 23 ++++++
 hypervisor/arch/riscv/include/asm/processor.h | 33 ++++++++
 hypervisor/arch/riscv/include/asm/sections.h  | 14 ++++
 hypervisor/arch/riscv/include/asm/spinlock.h  | 27 +++++++
 hypervisor/arch/riscv/include/asm/types.h     | 14 ++++
 hypervisor/arch/riscv/ivshmem.c               | 29 +++++++
 hypervisor/arch/riscv/lib.c                   | 19 +++++
 hypervisor/arch/riscv/paging.c                | 23 ++++++
 hypervisor/arch/riscv/pci.c                   | 49 ++++++++++++
 hypervisor/arch/riscv/setup.c                 | 32 ++++++++
 include/arch/riscv/asm/jailhouse_hypercall.h  | 68 ++++++++++++++++
 inmates/demos/riscv/Makefile                  |  0
 inmates/lib/riscv/Makefile                    |  0
 inmates/tests/riscv/Makefile                  |  0
 inmates/tools/riscv/Makefile                  |  0
 scripts/include.mk                            |  3 +
 32 files changed, 705 insertions(+)
 create mode 100644 configs/riscv/qemu-riscv64.c
 create mode 100644 hypervisor/arch/riscv/Kbuild
 create mode 100644 hypervisor/arch/riscv/Makefile
 create mode 100644 hypervisor/arch/riscv/asm-defines.c
 create mode 100644 hypervisor/arch/riscv/control.c
 create mode 100644 hypervisor/arch/riscv/dbg-write.c
 create mode 100644 hypervisor/arch/riscv/entry.S
 create mode 100644 hypervisor/arch/riscv/include/asm/bitops.h
 create mode 100644 hypervisor/arch/riscv/include/asm/cell.h
 create mode 100644 hypervisor/arch/riscv/include/asm/control.h
 create mode 100644 hypervisor/arch/riscv/include/asm/ivshmem.h
 create mode 100644 hypervisor/arch/riscv/include/asm/jailhouse_header.h
 create mode 100644 hypervisor/arch/riscv/include/asm/mmio.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging_modes.h
 create mode 100644 hypervisor/arch/riscv/include/asm/percpu.h
 create mode 100644 hypervisor/arch/riscv/include/asm/processor.h
 create mode 100644 hypervisor/arch/riscv/include/asm/sections.h
 create mode 100644 hypervisor/arch/riscv/include/asm/spinlock.h
 create mode 100644 hypervisor/arch/riscv/include/asm/types.h
 create mode 100644 hypervisor/arch/riscv/ivshmem.c
 create mode 100644 hypervisor/arch/riscv/lib.c
 create mode 100644 hypervisor/arch/riscv/paging.c
 create mode 100644 hypervisor/arch/riscv/pci.c
 create mode 100644 hypervisor/arch/riscv/setup.c
 create mode 100644 include/arch/riscv/asm/jailhouse_hypercall.h
 create mode 100644 inmates/demos/riscv/Makefile
 create mode 100644 inmates/lib/riscv/Makefile
 create mode 100644 inmates/tests/riscv/Makefile
 create mode 100644 inmates/tools/riscv/Makefile

diff --git a/configs/riscv/qemu-riscv64.c b/configs/riscv/qemu-riscv64.c
new file mode 100644
index 00000000..3c68ad71
--- /dev/null
+++ b/configs/riscv/qemu-riscv64.c
@@ -0,0 +1,65 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for QEMU riscv64 virtual target, 1G RAM, 4 cores
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
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
+	struct jailhouse_cpu cpus[4];
+	struct jailhouse_memory mem_regions[1];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xbfc00000,
+			.size =       0x00400000,
+		},
+		.root_cell = {
+			.name = "qemu-riscv64",
+
+			.num_cpus = ARRAY_SIZE(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		},
+	},
+
+	.cpus = {
+		{
+			.phys_id = 0,
+		},
+		{
+			.phys_id = 1,
+		},
+		{
+			.phys_id = 2,
+		},
+		{
+			.phys_id = 3,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x3fa10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	}
+};
diff --git a/driver/main.c b/driver/main.c
index d0e7f980..d13afeb6 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -162,6 +162,8 @@ static u64 get_physical_cpu_id(void)
 	return read_cpuid_mpidr() & MPIDR_HWID_BITMASK;
 #elif defined(CONFIG_X86)
 	return read_apic_id();
+#elif defined(CONFIG_RISCV)
+	return cpuid_to_hartid_map(smp_processor_id());
 #else
 #	error Unsupported architecture
 #endif
diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
new file mode 100644
index 00000000..dd114a6c
--- /dev/null
+++ b/hypervisor/arch/riscv/Kbuild
@@ -0,0 +1,17 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+-include $(GEN_CONFIG_MK)
+
+always-y := lib.a
+
+lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o lib.o
diff --git a/hypervisor/arch/riscv/Makefile b/hypervisor/arch/riscv/Makefile
new file mode 100644
index 00000000..c41bed7a
--- /dev/null
+++ b/hypervisor/arch/riscv/Makefile
@@ -0,0 +1,13 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+KBUILD_CFLAGS += -mcmodel=medany
diff --git a/hypervisor/arch/riscv/asm-defines.c b/hypervisor/arch/riscv/asm-defines.c
new file mode 100644
index 00000000..17c2f256
--- /dev/null
+++ b/hypervisor/arch/riscv/asm-defines.c
@@ -0,0 +1,19 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/gen-defines.h>
+
+void common(void);
+
+void common(void)
+{
+}
diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
new file mode 100644
index 00000000..ab0bb449
--- /dev/null
+++ b/hypervisor/arch/riscv/control.c
@@ -0,0 +1,78 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/control.h>
+
+int arch_cell_create(struct cell *cell)
+{
+	return -ENOSYS;
+}
+
+int arch_map_memory_region(struct cell *cell,
+			   const struct jailhouse_memory *mem)
+{
+	return -ENOSYS;
+}
+
+int arch_unmap_memory_region(struct cell *cell,
+			     const struct jailhouse_memory *mem)
+{
+	return -ENOSYS;
+}
+
+void arch_check_events(void)
+{
+}
+
+void arch_flush_cell_vcpu_caches(struct cell *cell)
+{
+}
+
+void arch_cell_destroy(struct cell *cell)
+{
+}
+
+void arch_cell_reset(struct cell *cell)
+{
+}
+
+void arch_prepare_shutdown(void)
+{
+}
+
+void __attribute__((noreturn)) arch_panic_stop(void)
+{
+	while (1);
+}
+
+void arch_panic_park(void)
+{
+}
+
+void arch_reset_cpu(unsigned int const cpu_id)
+{
+}
+
+void arch_park_cpu(unsigned int cpu_id)
+{
+}
+
+void arch_send_event(struct public_per_cpu *target_data)
+{
+}
+
+// Likely misplaced
+#include <jailhouse/processor.h>
+unsigned int cpu_by_phys_processor_id(u64 phys_id)
+{
+	return -1;
+}
diff --git a/hypervisor/arch/riscv/dbg-write.c b/hypervisor/arch/riscv/dbg-write.c
new file mode 100644
index 00000000..6bd75887
--- /dev/null
+++ b/hypervisor/arch/riscv/dbg-write.c
@@ -0,0 +1,17 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/printk.h>
+
+void arch_dbg_write_init(void)
+{
+}
diff --git a/hypervisor/arch/riscv/entry.S b/hypervisor/arch/riscv/entry.S
new file mode 100644
index 00000000..def55516
--- /dev/null
+++ b/hypervisor/arch/riscv/entry.S
@@ -0,0 +1,17 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+	.text
+	.globl arch_entry
+arch_entry:
+	li	a0,-55
+	ret
diff --git a/hypervisor/arch/riscv/include/asm/bitops.h b/hypervisor/arch/riscv/include/asm/bitops.h
new file mode 100644
index 00000000..4b7e31b1
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,37 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_BITOPS_H
+#define _JAILHOUSE_ASM_BITOPS_H
+
+static inline __attribute__((always_inline)) int
+test_bit(unsigned int nr, const volatile unsigned long *addr)
+{
+	return 0;
+}
+
+static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
+{
+	return 0;
+}
+
+static inline unsigned long ffzl(unsigned long word)
+{
+	return 0;
+}
+
+static inline unsigned long ffsl(unsigned long word)
+{
+	return 0;
+}
+
+#endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
new file mode 100644
index 00000000..63ba43ce
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -0,0 +1,24 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_CELL_H
+#define _JAILHOUSE_ASM_CELL_H
+
+#include <jailhouse/types.h>
+
+// this shouldn't be here
+#include <jailhouse/cell-config.h>
+
+struct arch_cell {
+};
+
+#endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/control.h b/hypervisor/arch/riscv/include/asm/control.h
new file mode 100644
index 00000000..e69de29b
diff --git a/hypervisor/arch/riscv/include/asm/ivshmem.h b/hypervisor/arch/riscv/include/asm/ivshmem.h
new file mode 100644
index 00000000..03251590
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/ivshmem.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+struct arch_ivshmem_irq_cache {
+};
diff --git a/hypervisor/arch/riscv/include/asm/jailhouse_header.h b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
new file mode 100644
index 00000000..a0c22083
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (C) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define JAILHOUSE_BASE			__JH_CONST_UL(0xffffffdfff000000)
+#define JAILHOUSE_BORROW_ROOT_PT	1
diff --git a/hypervisor/arch/riscv/include/asm/mmio.h b/hypervisor/arch/riscv/include/asm/mmio.h
new file mode 100644
index 00000000..e69de29b
diff --git a/hypervisor/arch/riscv/include/asm/paging.h b/hypervisor/arch/riscv/include/asm/paging.h
new file mode 100644
index 00000000..866f9a3f
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/paging.h
@@ -0,0 +1,54 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_PAGING_H
+#define _JAILHOUSE_ASM_PAGING_H
+
+#include <jailhouse/types.h>
+
+#define PAGE_SHIFT		12
+
+#define MAX_PAGE_TABLE_LEVELS	3
+
+#define PAGE_FLAG_FRAMEBUFFER	0
+#define PAGE_FLAG_DEVICE	0
+
+#define PAGE_DEFAULT_FLAGS	0
+#define PAGE_READONLY_FLAGS	0
+#define PAGE_PRESENT_FLAGS	0
+#define PAGE_NONPRESENT_FLAGS	0
+
+#define INVALID_PHYS_ADDR	(~0UL)
+
+#define TEMPORARY_MAPPING_BASE	0x0000008000000000UL
+#define NUM_TEMPORARY_PAGES	16
+
+#define REMAP_BASE		0xffffff8000000000UL
+#define NUM_REMAP_BITMAP_PAGES	4
+
+#define CELL_ROOT_PT_PAGES	1
+
+#ifndef __ASSEMBLY__
+
+typedef u64 *pt_entry_t;
+
+static inline void arch_paging_flush_page_tlbs(unsigned long page_addr)
+{
+}
+
+static inline void arch_paging_flush_cpu_caches(void *addr, long size)
+{
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* !_JAILHOUSE_ASM_PAGING_H */
diff --git a/hypervisor/arch/riscv/include/asm/paging_modes.h b/hypervisor/arch/riscv/include/asm/paging_modes.h
new file mode 100644
index 00000000..e69de29b
diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
new file mode 100644
index 00000000..fce6c052
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,23 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+// this shouldn't be here
+#include <asm/processor.h>
+
+#define STACK_SIZE			PAGE_SIZE
+
+#define ARCH_PUBLIC_PERCPU_FIELDS					\
+	spinlock_t control_lock;					\
+	;
+
+#define ARCH_PERCPU_FIELDS						\
+	;
diff --git a/hypervisor/arch/riscv/include/asm/processor.h b/hypervisor/arch/riscv/include/asm/processor.h
new file mode 100644
index 00000000..8d4b1c60
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/processor.h
@@ -0,0 +1,33 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_PROCESSOR_H
+#define _JAILHOUSE_ASM_PROCESSOR_H
+
+#include <jailhouse/types.h>
+
+union registers {
+};
+
+static inline void cpu_relax(void)
+{
+}
+
+static inline void memory_barrier(void)
+{
+}
+
+static inline void memory_load_barrier(void)
+{
+}
+
+#endif /* !_JAILHOUSE_ASM_PROCESSOR_H */
diff --git a/hypervisor/arch/riscv/include/asm/sections.h b/hypervisor/arch/riscv/include/asm/sections.h
new file mode 100644
index 00000000..d13a46bd
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/sections.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/* no special sections */
+#define ARCH_SECTIONS
diff --git a/hypervisor/arch/riscv/include/asm/spinlock.h b/hypervisor/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 00000000..a5e707d7
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,27 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_ASM_SPINLOCK_H
+#define _JAILHOUSE_ASM_SPINLOCK_H
+
+typedef struct {
+} spinlock_t;
+
+static inline void spin_lock(spinlock_t *lock)
+{
+}
+
+static inline void spin_unlock(spinlock_t *lock)
+{
+}
+
+#endif /* !_JAILHOUSE_ASM_SPINLOCK_H */
diff --git a/hypervisor/arch/riscv/include/asm/types.h b/hypervisor/arch/riscv/include/asm/types.h
new file mode 100644
index 00000000..b133cf4c
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/types.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#define MAX_CPUS 	__riscv_xlen
+#define BITS_PER_LONG	64
diff --git a/hypervisor/arch/riscv/ivshmem.c b/hypervisor/arch/riscv/ivshmem.c
new file mode 100644
index 00000000..e5dd7973
--- /dev/null
+++ b/hypervisor/arch/riscv/ivshmem.c
@@ -0,0 +1,29 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/entry.h>
+#include <jailhouse/ivshmem.h>
+
+void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
+				    unsigned int vector)
+{
+}
+
+int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
+			     bool enabled)
+{
+	return -ENOSYS;
+}
+
+void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
+{
+}
diff --git a/hypervisor/arch/riscv/lib.c b/hypervisor/arch/riscv/lib.c
new file mode 100644
index 00000000..5fe45bc7
--- /dev/null
+++ b/hypervisor/arch/riscv/lib.c
@@ -0,0 +1,19 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/processor.h>
+
+// Check if it be moved elsewhere
+unsigned long phys_processor_id(void)
+{
+	return 0;
+}
diff --git a/hypervisor/arch/riscv/paging.c b/hypervisor/arch/riscv/paging.c
new file mode 100644
index 00000000..294ea958
--- /dev/null
+++ b/hypervisor/arch/riscv/paging.c
@@ -0,0 +1,23 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/paging.h>
+
+void arch_paging_init(void)
+{
+}
+
+// Might be misplaced
+unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
+{
+	return 0;
+}
diff --git a/hypervisor/arch/riscv/pci.c b/hypervisor/arch/riscv/pci.c
new file mode 100644
index 00000000..067a7651
--- /dev/null
+++ b/hypervisor/arch/riscv/pci.c
@@ -0,0 +1,49 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/entry.h>
+#include <jailhouse/pci.h>
+
+u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
+{
+	return 0;
+}
+
+void arch_pci_write_config(u16 bdf, u16 address, u32 value, unsigned int size)
+{
+}
+
+int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device)
+{
+	return -ENOSYS;
+}
+
+void arch_pci_remove_physical_device(struct pci_device *device)
+{
+}
+
+void arch_pci_set_suppress_msi(struct pci_device *device,
+			       const struct jailhouse_pci_capability *cap,
+			       bool suppress)
+{
+}
+
+int arch_pci_update_msi(struct pci_device *device,
+			const struct jailhouse_pci_capability *cap)
+{
+	return -ENOSYS;
+}
+
+int arch_pci_update_msix_vector(struct pci_device *device, unsigned int index)
+{
+	return -ENOSYS;
+}
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
new file mode 100644
index 00000000..53cdce80
--- /dev/null
+++ b/hypervisor/arch/riscv/setup.c
@@ -0,0 +1,32 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/entry.h>
+
+int arch_init_early(void)
+{
+	return -ENOSYS;
+}
+
+int arch_cpu_init(struct per_cpu *cpu_data)
+{
+	return -ENOSYS;
+}
+
+void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
+{
+	while (1);
+}
+
+void arch_cpu_restore(unsigned int cpu_id, int return_code)
+{
+}
diff --git a/include/arch/riscv/asm/jailhouse_hypercall.h b/include/arch/riscv/asm/jailhouse_hypercall.h
new file mode 100644
index 00000000..7d54047c
--- /dev/null
+++ b/include/arch/riscv/asm/jailhouse_hypercall.h
@@ -0,0 +1,68 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS
+
+#ifndef __ASSEMBLY__
+
+static inline __u32 jailhouse_call(__u32 num)
+{
+	return -ENOSYS;
+}
+
+static inline __u32 jailhouse_call_arg1(__u32 num, __u32 arg1)
+{
+	return -ENOSYS;
+}
+
+static inline __u32 jailhouse_call_arg2(__u32 num, __u32 arg1, __u32 arg2)
+{
+	return -ENOSYS;
+}
+
+struct jailhouse_comm_region {
+        COMM_REGION_GENERIC_HEADER;
+} __attribute__((packed));
+
+static inline void
+jailhouse_send_msg_to_cell(struct jailhouse_comm_region *comm_region,
+			   __u32 msg)
+{
+}
+
+#endif /* !__ASSEMBLY__ */
diff --git a/inmates/demos/riscv/Makefile b/inmates/demos/riscv/Makefile
new file mode 100644
index 00000000..e69de29b
diff --git a/inmates/lib/riscv/Makefile b/inmates/lib/riscv/Makefile
new file mode 100644
index 00000000..e69de29b
diff --git a/inmates/tests/riscv/Makefile b/inmates/tests/riscv/Makefile
new file mode 100644
index 00000000..e69de29b
diff --git a/inmates/tools/riscv/Makefile b/inmates/tools/riscv/Makefile
new file mode 100644
index 00000000..e69de29b
diff --git a/scripts/include.mk b/scripts/include.mk
index d0139d8e..35855e7d 100644
--- a/scripts/include.mk
+++ b/scripts/include.mk
@@ -67,3 +67,6 @@ endif
 ifeq ($(ARCH),aarch64)
 override ARCH = arm64
 endif
+ifeq ($(ARCH),riscv64)
+override ARCH = riscv
+endif
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-21-ralf.ramsauer%40oth-regensburg.de.
