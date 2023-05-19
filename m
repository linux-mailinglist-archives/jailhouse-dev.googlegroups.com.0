Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZN5T6RQMGQESJOWSDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBF70A0F6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:10 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 5b1f17b1804b1-3f453ff4cdfsf14108145e9.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528870; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pk3e7HF/eBbTMZnnzAnD9zsiDaBDmd6Rkz/r3+w/ewzpGtQwHSHitzLWf5e+QZozn5
         heW80X7wopCI92z7mbHvYQVu1G3xFfDBvdO3p54hu8WK2we26gSkBPnj55aiKZ/wHidB
         6oyl+csIrJBQhqH6gA0d/r/BWw3s97jJYcCgAfIX6csii6I4H5zi1Kj6hINmGgMbhr5c
         Iwb60YweuIa6ULnL069lHxhJ/WO7y5MyiGfc+d4kpu71Nj2GQZnypjSAWLU8vapPvnH5
         RvQLggxeEjYv3tjVJKgukGFNb7ebsbLew7wcHbmEMyckqwoEaLhlHeAYBBdFmkmyslyM
         +y1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=oUZdG7HovqkNTc5EezV8rklJxtO0H+C3LN2vETRZKR4=;
        b=xGdwxC9/5eTZqRj9z8rPjM/E9h2bPb2o4CfIXOSO61xcUlvIrixHguhXrRZF4QuTYs
         aq76hc5b0NShKIhb90xLw11uTcCjeTOPSqxv9iIBfH5M/FDDujJjKDqliIJaHhUTCLDl
         3DQHEnFJJ2EqLjiDguzEC52Q7k3Gg0K9SQi6Hmz5M9pwZ0eHIo2ah+jI0XaUMmzhas2c
         iNhVGlIrcg1zREP1+j+WO4DRFX0nCnOTjBz4Xv5eWmMqs8YAQIPwo5rduJJkwt4e5XrS
         L7dRf6DI5nVYBWcwLk5sFEV9DUoANchWgbHdXuaZ4DWcrm2jrl21nRdiH+lcGcqVZ8k7
         1uHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528870; x=1687120870;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUZdG7HovqkNTc5EezV8rklJxtO0H+C3LN2vETRZKR4=;
        b=HB8jWHYzXgptWFVYARGP1y5UWx4vipq9GbCyNDSMlXymnrQ1Q9fE+NUKmXv5KK40tX
         c7G4N1DLPsyVwpIj1V1EAGnrIcnjJGS1bt0PQC6K+GZzX5zJ0QfPEpnPfYRjuQRLIoSv
         JYU23vhhsPV1t/u1+UjDy1ZnNFdYxT0Gc7uIkCWwVIlBVaQnl1YSDhMb3jaHZypeBWLK
         4vGhwHda429fSRRS6/W7UqfirRsBrOWQ8HQlvxRjfdZsllfBzUbwzKoepdDfeWNwgpUB
         qKbBzlHNitbli70CO1DCGH3NyunPDfHH6hY2iLw/YbIHqG7dw4svBYY8CdCVnhVLgiov
         ishA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528870; x=1687120870;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUZdG7HovqkNTc5EezV8rklJxtO0H+C3LN2vETRZKR4=;
        b=gexFtFQNmZrkQp+9v4KQXTK37YssQ93GLnE6ASo9+j3yhw+sHf+qS9XO6VOVbGWYnI
         mPK3rwTTWzmPojS1TXeoX5NfOvWsHMlRO5wA87i5a3EVHsjU53q4ihFgEbM0cQe011oN
         bk4TB1UwUpbEAX5MFeESqdlGpSAs35YgvQF8aSPnffwlb6QEKqGFxPnA0+8IouoCHdIb
         tHFmlL+yCefYcwCYzY9ppvA+IrTXNvxvT7HXxxQHuYqOUpuBbKO1Wmfcsvn938dPhE5K
         FuzK+kyU7WivxOSfnyxqa0ndmONbpopJ/xzL0PyRMNKRYHwqCm2cL3GHcvHrJ6fZIvHW
         3Ksg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxF4KotXSzwHX6Bl6AklPB0lbvh1tLbLW3DyLDfvGmCCo1vkzEz
	kk7y/FJ74HQdNp3nqVHMtkY=
X-Google-Smtp-Source: ACHHUZ7E0YmwfLCyZ7Nz8DwmO2iKzMqAxn1TyJbstOjLU6LKOieduAq1zRe+s0g8pJ8eiAQ0PRLpwg==
X-Received: by 2002:a5d:6543:0:b0:2f9:b454:1fc1 with SMTP id z3-20020a5d6543000000b002f9b4541fc1mr584895wrv.0.1684528870197;
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c8a:b0:3f5:21c:95cb with SMTP id
 k10-20020a05600c1c8a00b003f5021c95cbls588557wms.1.-pod-prod-08-eu; Fri, 19
 May 2023 13:41:08 -0700 (PDT)
X-Received: by 2002:a1c:790d:0:b0:3f4:21cf:b4a4 with SMTP id l13-20020a1c790d000000b003f421cfb4a4mr2332746wme.20.1684528868461;
        Fri, 19 May 2023 13:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528868; cv=none;
        d=google.com; s=arc-20160816;
        b=saWnyP8M9DKyNFcqzsLza2f+GElILRfBk91rZRhuVGFFgWXZ6rP92QmncYJz7xTHBE
         8SYiS4Ctu/92FYkJVTDzvEPj1cmTqlUqy3akYwIe9saXQ/x5zWlzNyObniQ8v9VIWI3V
         uWb92iOoHetZhubEfDUE2Ocsn+TIeWbKCSGgKfmMnymxnB2JuNrUdIN8k+qbTuVDMqYd
         hiQUads3XwLHWwZV7vXTQx5AuUivh3Umr/q8VQTOYgQDUnuj1PAgisYNaB14CvAEjm4K
         b/zPveeRwF8+mOd4AY/QjdNp6RA1E0GSKexNzZmpIsoZh2WjsRT39+ka3ykY3XNIfWPM
         S9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7ItJjqvLgb9l5Wylu5XFQcVjVs08mx41aMRB8To//0A=;
        b=YTYbRRpbicyf3E8GokohXkKiSwgjk0RI/bQYk+LEvgI/fP3Hq8/H28bnmJ7PR89LPq
         CyTn146yhszUf7Mzz/XcYQs1PM+ZhuT5d6mUGpWxr344UeJeQRrt/XNy/tiUvG12qD3Q
         uH+KCadQt7MWj6O0n0N/X+rz+uTdE2qFSDJieuKfFNgfzktGefR3PkyvfZ8NMscNGpUc
         TE6iXz35hjovrAGJrVOCAar6XPbNrqX6ngCRTWfnecPX/fU3ocrt0fa/UWFWwpIPl11h
         ZRVxtmBD42vtsRXhfy3fTMyi+mAWLYh/Dm1lQWbjkg6AMeQsOq9FahXIaaXAVkAoeCM5
         U8NA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id by3-20020a056000098300b00309385d6135si954wrb.1.2023.05.19.13.41.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdv3bMxzyNl;
	Fri, 19 May 2023 22:41:07 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 68/73] core: riscv: Migrate IMSIC files, if IMSIC is available
Date: Fri, 19 May 2023 22:40:28 +0200
Message-Id: <20230519204033.643200-69-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BEC_SUBJ_KEYWORD 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SHIPPING_PHRASE 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

If an IMSIC is available, i.e., when a valid VS-mode File is set in the
configuration, then migrate corresponding CSR registers over to the
target VS-mode file. Undo it, when disabling jailhouse.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c            |  5 ++
 hypervisor/arch/riscv/include/asm/cell.h   |  2 +
 hypervisor/arch/riscv/include/asm/csr64.h  | 19 ++++++
 hypervisor/arch/riscv/include/asm/percpu.h | 16 ++++-
 hypervisor/arch/riscv/setup.c              | 78 +++++++++++++++++++++-
 5 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index fbd8e81d..c0701abe 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -134,6 +134,9 @@ int arch_cell_create(struct cell *const cell)
 	cell->arch.mm.root_table =
 		page_alloc_aligned(&mem_pool, CELL_ROOT_PT_PAGES);
 
+	/* Always take VS file 1 for every cell, if IMSIC is available */
+	cell->arch.vs_file = imsic_base() ? 1 : 0;
+
 	for_each_cpu(cpu, &cell->cpu_set) {
 		ppc = public_per_cpu(cpu);
 		ppc->wait_for_power_on = false;
@@ -260,6 +263,8 @@ void riscv_park_cpu(void)
 {
 	this_cpu_public()->hsm.state = STOPPED;
 
+	cpu_set_vs_file(this_cell()->arch.vs_file);
+
 	/*
 	 * When parking a HART, we let the CPU spin in a wfi loop. To avoid
 	 * that we busily spin that loop, deactivate interrupts while sitting
diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 2d0002f6..2f1cfbd4 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -37,6 +37,8 @@ struct arch_cell {
 		unsigned int target[APLIC_MAX_VIRQ];
 		unsigned int enabled;
 	} aplic_virq;
+
+	unsigned short vs_file;
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/riscv/include/asm/csr64.h
index a12f3ffb..8651d0f1 100644
--- a/hypervisor/arch/riscv/include/asm/csr64.h
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -41,6 +41,24 @@
 #define CSR_HTINST	0x64a
 #define CSR_HGATP	0x680
 
+/* IMSIC CSRs */
+#define CSR_SISELECT	0x150
+#define  CSR_SIREG_EIDELIVERY	0x70
+#define  CSR_SIREG_EITHRESHOLD	0x72
+#define  CSR_SIREG_EIP0		0x80
+#define  CSR_SIREG_EIE0		0xc0
+#define CSR_SIREG	0x151
+#define CSR_VSISELECT	0x250
+#define CSR_VSIREG	0x251
+
+#define CSR_STOPEI	0x15c
+#define CSR_VSTOPEI	0x25c
+
+#define CSR_STOPI	0xdb0
+#define CSR_VSTOPI	0xeb0
+
+#define TOPI_IID_SHIFT	16
+
 /* Status register flags */
 #define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
 #define SR_MIE		_AC(0x00000008, UL) /* Machine Interrupt Enable */
@@ -131,6 +149,7 @@
 #define HSTATUS_VTVM            _AC(0x00100000, UL)
 #define HSTATUS_VGEIN           _AC(0x0003f000, UL)
 #define HSTATUS_VGEIN_SHIFT     12
+#define HSTATUS_VGEIN_MASK	BIT_MASK(17, HSTATUS_VGEIN_SHIFT)
 #define HSTATUS_HU              _AC(0x00000200, UL)
 #define HSTATUS_SPVP            _AC(0x00000100, UL)
 #define HSTATUS_SPV             _AC(0x00000080, UL)
diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index 4eb88b57..22635a91 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
- * Copyright (c) OTH Regensburg, 2022
+ * Copyright (c) OTH Regensburg, 2022-2023
  *
  * Authors:
  *  Konrad Schwarz <konrad.schwarz@siemens.com>
@@ -12,6 +12,7 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/utils.h>
 #include <asm/processor.h>
 #include <asm/spinlock.h>
 
@@ -27,6 +28,16 @@ enum sbi_hart_state {
 	RESUME_PENDING	= 6,
 };
 
+static inline void cpu_set_vs_file(unsigned int file)
+{
+	u64 hstatus;
+
+	hstatus = csr_read(CSR_HSTATUS);
+	hstatus &= ~HSTATUS_VGEIN_MASK;
+	hstatus |= file << HSTATUS_VGEIN_SHIFT;
+	csr_write(CSR_HSTATUS, hstatus);
+}
+
 #define ARCH_PUBLIC_PERCPU_FIELDS					\
 	unsigned long phys_id;						\
 	enum {								\
@@ -47,6 +58,7 @@ enum sbi_hart_state {
 		u32 enabled_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
 		u32 pending_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
 		unsigned int aplic_pending;				\
-	} virq;
+	} virq;								\
+	unsigned long imsic_base;
 
 #define ARCH_PERCPU_FIELDS
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index b1b93d11..94971dd3 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -16,6 +16,7 @@
 #include <jailhouse/entry.h>
 #include <jailhouse/paging.h>
 #include <jailhouse/percpu.h>
+#include <asm/irqchip.h>
 #include <asm/setup.h>
 
 extern unsigned long bt_tbl_l0[PAGE_SIZE / sizeof(unsigned long)];
@@ -26,6 +27,8 @@ __riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
 
 bool has_sstc;
 
+static bool imsic_migration_done;
+
 int arch_init_early(void)
 {
 	int err;
@@ -34,6 +37,9 @@ int arch_init_early(void)
 	if (err)
 		return err;
 
+	/* Always take VS-file 1, if IMSIC is available */
+	root_cell.arch.vs_file = imsic_base() ? 1 : 0;
+
 	parking_pt.root_paging = root_cell.arch.mm.root_paging;
 
 	err = paging_create(&parking_pt, paging_hvirt2phys(riscv_park_loop),
@@ -43,6 +49,49 @@ int arch_init_early(void)
 	return 0;
 }
 
+static void imsic_migrate_to_vs(unsigned char reg, bool set)
+{
+	u64 val;
+
+	csr_write(CSR_SISELECT, reg);
+	csr_write(CSR_VSISELECT, reg);
+
+	val = csr_read(CSR_SIREG);
+	csr_write(CSR_SIREG, 0);
+	if (set)
+		csr_set(CSR_VSIREG, val);
+	else
+		csr_write(CSR_VSIREG, val);
+}
+
+static void imsic_migrate_to_s(unsigned char reg, bool set)
+{
+	u64 val;
+
+	csr_write(CSR_VSISELECT, reg);
+	csr_write(CSR_SISELECT, reg);
+
+	val = csr_read(CSR_VSIREG);
+	csr_write(CSR_VSIREG, 0);
+
+	if (set)
+		csr_set(CSR_SIREG, val);
+	else
+		csr_write(CSR_SIREG, val);
+}
+
+static void imsic_migrate_regs(void (*migrator)(unsigned char, bool))
+{
+	unsigned short eiep;
+
+	migrator(CSR_SIREG_EIDELIVERY, false);
+	migrator(CSR_SIREG_EITHRESHOLD, false);
+	for (eiep = 0; eiep < (irqchip_max_irq() + 63) / 64; eiep++) {
+		migrator(CSR_SIREG_EIE0 + 2 * eiep, false);
+		migrator(CSR_SIREG_EIP0 + 2 * eiep, true);
+	}
+}
+
 int arch_cpu_init(struct per_cpu *cpu_data)
 {
 	struct public_per_cpu *ppc = &cpu_data->public;
@@ -62,7 +111,17 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 	final_pt = paging_hvirt2phys(&ppc->root_table_page);
 	enable_mmu_satp(hv_atp_mode, final_pt);
 
-	csr_write(CSR_HSTATUS, 0);
+	cpu_set_vs_file(root_cell.arch.vs_file);
+
+	/*
+	 * If VGEIN is set, then we have an IMSIC. Migrate its registers to the
+	 * new VS-mode file. We need to do this very early, in case we have an
+	 * IMSIC, as this migration works on per-cpu CSR registers. Hence, we
+	 * can't do it in aplic_init().
+	 */
+	if (root_cell.arch.vs_file)
+		ppc->imsic_base =
+			imsic_base() + ppc->phys_id * imsic_stride_size();
 
 	return 0;
 }
@@ -123,6 +182,18 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 
 	csr_write(sepc, regs->ra); /* We will use sret, so move ra->sepc */
 
+	/*
+	 * While activating jailhouse, a MSI(-X) might still arrive at the
+	 * S-file until the MSI's address is relocated. In this case, S-Mode
+	 * will still hold pending interrupts. Here, all IRQs (legacy IRQs, as
+	 * well as MSIs) are migrated, and we can safely migrate all pending
+	 * IRQs from the old S-Mode file to the VS-File.
+	 */
+	 if (csr_read(CSR_HSTATUS) & HSTATUS_VGEIN) {
+		imsic_migrate_regs(imsic_migrate_to_vs);
+		imsic_migration_done = true;
+	 }
+
 	tmp = csr_swap(sscratch, regs->sp);
 	asm volatile("mv sp, %0\n"
 		     "j vmreturn\n" : : "r"(tmp));
@@ -144,7 +215,6 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 	u64 timecmp;
 	u8 atp_mode;
 
-
 	linux_tables_offset =
 		symbol_offset((void*)hypervisor_header.initial_load_address);
 
@@ -158,6 +228,10 @@ riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 		csr_write(CSR_STIMECMP, timecmp);
 	}
 
+	/* Migrate the VS-Mode IMSIC file back to the S-Mode file */
+	if ((csr_read(CSR_HSTATUS) & HSTATUS_VGEIN) && imsic_migration_done)
+		imsic_migrate_regs(imsic_migrate_to_s);
+
 	/*
 	 * We don't know which page table is currently active. So in any case,
 	 * just jump back to the bootstrap tables, as they contain the old
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-69-ralf.ramsauer%40oth-regensburg.de.
