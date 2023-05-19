Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1D70A0C6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:51 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 2adb3069b0e04-4ef455ba61csf2433435e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528850; cv=pass;
        d=google.com; s=arc-20160816;
        b=GBwLjAdGSkIldYK8z27SY7711hI0breKDenDVeHAxoS83vW6Xlxct7TYNDR5XHDTHk
         ac3glVVB7AfH5Q5GfXz+gMntuXHioiezzwl+dnN+KOcZKybKl2sRY9ZFKYU+8lqIZLCf
         K2iyUN2aUCBUGza4Trk2e/N9GrRZD9byJIkewzS0PkxCtGQreoIwzYe968SICWlGOYzQ
         t9IUoIWwpFISaODHij4CWW+X8U33lQ4uQOJXHpBwoy8Uwzr5E+1PJQiCfM4eqKR36JlB
         3Za1izF+hJ6mviV41KR1pTIXCUhf8ED+qDnfHh5i40ojvvc6CUhErF/vYr1p4+jZnYCu
         rkSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jecW4ahX+0VCeDvdFq3zpbwpZCTPyrui7QenwwJvKDE=;
        b=I+Sw5nUYpVNegN6WiUFY2EB6V3uCjbzaQWqCE29KNuoAiO4OqQJp0jtNHq7FTw5JEa
         0kFiy4SNhCWMB1reeC87ghWADIkA87ScJYQkYShtSw7qimJ5eRGAM5YKlB/jGk4Pd6N8
         TRARFygMYN+/uyDAJB5THOAA6/AIqMuEE5FRyndqmQDrZBDcmY4avMU8KG9T+gco1hRN
         9D+jQGSdGXOXnsPTyFPHCWu65o87siMcj7WcDutjh/PRdcENUoox5NWTn8VQI+pKK9i7
         Z7pmKp1XKIXaflAjAp7CGdr4rzVji40cFcY05X5SAtGEin9GPr851LUIzA5IdgPcdnkp
         HslQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jecW4ahX+0VCeDvdFq3zpbwpZCTPyrui7QenwwJvKDE=;
        b=r5+NIfvwWTycoBvURG5SFd4u3NZ0IrUrsnsInkT5yOHHlyoh0+Qce8RZf4rEVWDGvM
         FhBKuM/yTqPPzvDSIN652zDOTnq2wnzgQ4Ms4dK1uCIGXt3QUuSACMcaW0MEuS3Ra87k
         wpeNKVXRPF7wKnRU9OX/531WzC5CiPAMPVfk1wEm2ilBo/6r+jqgNfmY8CZyaZaD0Kgy
         xcRQACW0BLNJC7UCTVrxuRr+xyj7CT9PQh+kogBeKY4FAGW6WRfVlI6nBM7kc1oEUDpc
         4iTw1+VVE1rfmzJ6gOQSF0EGTTYY43uoN9mdMP2j0Dq6Wk5mW3LqiaL2y/gyIV8UZ1VG
         W45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jecW4ahX+0VCeDvdFq3zpbwpZCTPyrui7QenwwJvKDE=;
        b=U/tHNQF/fokMzrcau80e3D3T9ugXdDqcrag9z9gVbtJvOzMRv20i5ylr7vQ8EhHV7o
         UeU7shcoMPqOfOjINlwRucX2YRXhPn5Sgk4XN7GH4h4HaPnEWxsKP/OsRmW/8HQDMhXH
         xke1tpe35y/Z9guHLoflMoTviSpRuTXnP1spTQfmKndu2rD24yAgN1BTw4KpUGSk2GGh
         zJgr3AdKOK0qmhOVpZ8X9rwlaTDBucdL+1ofemRk22x8Fwlv0mpd9lEncn0Ey0vAa9iC
         ueOe+R0JxsA65FUWwd9ewXvo0sG5Y8BG9FoL+Cbayo0MimJqiGDJn//ID8Xp6uXpnfMX
         rHaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxRPUKo1vkAqPxSadwehicohwENaJ8cyrJcSo5RsIb9SzC6eV8b
	U3fWWcXMqeJdFcyGDTGoWbU=
X-Google-Smtp-Source: ACHHUZ7XmACco7ua7ES/3eAiX56aREHLjKQmTYx7Ip1JQqnYseVnyN/0YL1eLsJeqDE9sbg9o1/lbw==
X-Received: by 2002:ac2:5333:0:b0:4dd:a058:f08f with SMTP id f19-20020ac25333000000b004dda058f08fmr779644lfh.3.1684528850793;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:19a9:b0:2ac:895a:309f with SMTP id
 bx41-20020a05651c19a900b002ac895a309fls1353105ljb.1.-pod-prod-01-eu; Fri, 19
 May 2023 13:40:48 -0700 (PDT)
X-Received: by 2002:ac2:52ad:0:b0:4f3:87d7:f7a4 with SMTP id r13-20020ac252ad000000b004f387d7f7a4mr1185767lfm.62.1684528848785;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528848; cv=none;
        d=google.com; s=arc-20160816;
        b=C5xfIsMgg8sQ2fkUGvclDQOzrlzOYok4N5EYgErIWs3iomoU1U9SwwlF1XfzSrgXIa
         SkcumppW2uIDk+mcQa0ypqoZv4NYggHrV8oHD0ns4qZSBvFi8E6sJ9jEuDUleS1oi5H/
         U8aFZlzu8UqNT2g48Whd5OycgoQWfu2ArH4BAMC80iWvYJhSY+Q97Scza4bPdyac8dDK
         TfkX/b+T5HKjPnxI9u1wKdth7GMs37W2s9cdiz9CnYzqKzi5W0tObHZudBtPDnM0z+XW
         x7WtFhBA0C0+s2tZ31OA04T5dhil+g+ZecLqf/KJkh5onryUkGNCyKEDaevWh7BV7ovf
         0nTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=OCrUSnTBiwwbVc7Ny1IJK465GjYi9zB7+fcaCCgujak=;
        b=j7xwuQGMD8BBM+jcvMyhmAkQRw74IjpzYeYo5jcCEc/PnCKzsauJRhU2xj4bTo8DPB
         HJx5H2rcMHcVtJnvIM4f4g9UuRmkhsPdjtZ147Qy/s/a+QZel2wnlACS+nXbeyFiJShs
         N8dp3URChxJIyjlqBXrusoTxrgwEeRD2Q3LTdHz1f5PfzpPvSie4iuWL/ksLZfxWYHTz
         c6fdedn6NPVCEoWiRhKvnjz5DX7RJp1EHWEvfVji5fepGEkWMK/H5shyxAlN77U8CBiE
         IIvJYns/BKvjZf3xQnjEwsbhSzWw2lAmM6epceq1OcX4Vg533mNR/hOUW9KhVKgmRZBT
         u9bA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f12-20020a0565123b0c00b004f3b0cf753bsi13870lfv.0.2023.05.19.13.40.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdW6TNfzxpl;
	Fri, 19 May 2023 22:40:47 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 20/73] RISC-V cornerstone
Date: Fri, 19 May 2023 22:39:40 +0200
Message-Id: <20230519204033.643200-21-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, BODY_SIZE_25K_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0,
 __STOCK_PHRASE_25 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 driver/main.h                                 |  4 +
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
 include/jailhouse/cell-config.h               |  1 +
 inmates/demos/riscv/Makefile                  |  0
 inmates/lib/riscv/Makefile                    |  0
 inmates/tests/riscv/Makefile                  |  0
 inmates/tools/riscv/Makefile                  |  0
 scripts/include.mk                            |  3 +
 34 files changed, 710 insertions(+)
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
index c52874af..fc547ac9 100644
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
diff --git a/driver/main.h b/driver/main.h
index 8f45e9f7..5748a4f7 100644
--- a/driver/main.h
+++ b/driver/main.h
@@ -23,6 +23,10 @@
 #define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM
 #elif defined(CONFIG_ARM64)
 #define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM64
+#elif defined(CONFIG_RISCV)
+#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_RISCV64
+#else
+#error	Unsupported architecure!
 #endif
 
 extern struct mutex jailhouse_lock;
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
index 00000000..120859e0
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
+#define MAX_CPUS	__riscv_xlen
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
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 34abb938..56b512a4 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -54,6 +54,7 @@
 #define JAILHOUSE_X86		0
 #define JAILHOUSE_ARM		1
 #define JAILHOUSE_ARM64		2
+#define JAILHOUSE_RISCV64	3
 
 /*
  * Incremented on any layout or semantic change of system or cell config.
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-21-ralf.ramsauer%40oth-regensburg.de.
