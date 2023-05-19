Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVV5T6RQMGQEYOYHMBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568B70A0D8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:55 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2af08de8c2fsf20008121fa.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528855; cv=pass;
        d=google.com; s=arc-20160816;
        b=wBYbNHg+0GhUpj8r+Q2VSqdr8Lwqo3wBZ4CugnuoCKNHL0+VmQeL+eAktyUSdgb/sZ
         gMAB3uW2aA7yj98ESOUArLBh5w6uuq75JHmuem2uTLlgpXAQi5PpE0GaOKvoVVblqcsD
         PBIgraNFwYNWqhhd23Gb+UWybqCa3U9vmlmmZpOJ4bmZ94aX3wVP4++GRHM4ghabJjST
         /u8DHYlLd5JvezN/AZStXllX9PmoEbdd2IrCkSN6EHdTWOlqXTnMGNFRAtlqzQitIXFJ
         5bBfWg3EO8Yp3u7DuJxCy8Bnsq3Nj9WYgrHBKBCsJvwO6NwGuwKppD6U0ns4+MXVnKj1
         9N0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GQEVKP+GVAbJG0VvTMXsL4ex8Jb33Bll8dJWpRWNIYU=;
        b=SK+KAa1a4ec+ho3X57iGNZG/05aTz2mrnwbT1EYpbwf6RcQshq5C+sy4B9Oc8YbL57
         hPEqG7MHCTRaiJI1vKKYDqGMr+X80ORhZcLzT3cGC1QlT03NC7rUUQkdjjTbkdCAL91t
         7eDtEeLhnOP+3/0C1ezojuM1U9rr+Kl3h/fqcdFfnAOXpsSZv3MAlX2bV89xauod63R3
         /5ZYNxsHuUfWWCjVuaL4BCEXwjKMPBmDkjvFKup5lkIwN8EFtSXNf71eAd1iv1bc/e4F
         2Rhb3PbrkIHpR6pwnTIzDaA/6DG/jlk0Bxo+tJLeT/3hMM4unjRnCAxIrgkNBL2mrO7W
         aNBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQEVKP+GVAbJG0VvTMXsL4ex8Jb33Bll8dJWpRWNIYU=;
        b=szzzM7GFnGsGp0Vzks5lI8ZqFsnp5qVTSumEehN0ik51BlRi5Eczw48/7jZ9k3NJJd
         /B0S1wwOScyIMCxnvAZF39rbdhmSxyd9EXRynho1RLl/LOeoOhVbWxdI9heNZ4QZnFKr
         qQfBQ5l/fj/N37ouCi1SbgLEKl1rs9peQA+WnmopcoCsDGWOykcJUCVqfflEECrf30sI
         WgAn1ecxp0TPbEpMIGlWoNfPwd3D1WSdstL1ar4AMurjEgm6IoAmrrklUjXGMwHUyMcU
         NXMnSqIVv/oxyJyz8WdQdsZB+sg2Y+BX5N66whFh7t+GRIJFdDJe0ZvVR+APgOJCrOl3
         Socg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQEVKP+GVAbJG0VvTMXsL4ex8Jb33Bll8dJWpRWNIYU=;
        b=FZDXugXmcHHeWEcbSnvHBg65qifYk5NhVgrFzyv2jOhJYviQE2pWOVaXD4zM1CsGut
         6xCp2DqjxiSb/joF4fs4QB+uz4okyhsdu2pFoZUinbDpLUhsM+Z3OIfb2aoemw63F8nE
         eWgOUyQ7/l5sLdBZ3sxqrAj1mH4sLRxjFNRxt/IMXe9QsCCOjUI9iON2bDr8RzvjnCY8
         rEl1dbHrYnoiSC6aHqKHDhV5A3WZuleQ2zxG09QwXXqvRulIbhUaMJTEb6FtZlun3evU
         Rj691OxY2GHVJ88YohQBtnZAquMVtOAujQ66ivaZ+CKE0KOXFXf534gSTItp3njvmxcD
         kI/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzJOYm/AKPg/QEVojp4z6//IL0RYfZE3xhqs9gdCqm2c9l/NnDi
	lpcOD/FBOhd0Dw2sOV92keM=
X-Google-Smtp-Source: ACHHUZ5CEoxEGdABd6XrhHBo8PftNX9ZTXLdS41T5ldJj/gkzTftpUYM1SpOCFTZD0lLFD1qQaL2dA==
X-Received: by 2002:a2e:9115:0:b0:2af:c2b:40b7 with SMTP id m21-20020a2e9115000000b002af0c2b40b7mr748487ljg.8.1684528854573;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7715:0:b0:4f1:4e98:131b with SMTP id s21-20020a197715000000b004f14e98131bls3365193lfc.1.-pod-prod-03-eu;
 Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-Received: by 2002:ac2:5585:0:b0:4ef:f06e:eacf with SMTP id v5-20020ac25585000000b004eff06eeacfmr1147874lfg.27.1684528852538;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528852; cv=none;
        d=google.com; s=arc-20160816;
        b=drGT5cwFtvTxcHvMLUqjEu6+vcc/dPTYbX72PRv6s9KRVRNUAg3uWN1ZBkPhKacuyk
         a4lhCWBmO1txao84WRYryua6f8YojsUzCctqeLufDutAqqMqvSUy+LGroc/uneMM/mth
         CnANrGLoWm7UVld/aIFvWWqYRHjAOHnErcz7jaC6GlhW1JhafnQ7FRR32gBm5Lu5r1v+
         ZC3cwgqBdtU+lxar5GLvTZgVqrYTcC03Nlb5yVq9pXtv6tWKRlFql4rOaGvgmdi70+SN
         DaViHuxYXRHdGoacjWgJqcIfWiKh7cDA1yH9aYZ9vRV9jXHke5owQv2bjpLAcwAXMV86
         L8wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KiVRDfHGT5qo5RNfBapp1hsTOgSK1qh2RpviohNZVRM=;
        b=CLp9iQGuDZ8Ds1LwoXl61qEWBQlmSpZQEg4uKxlafcTe6g9lWnOIdbilERvKxmx+KV
         9VIBk3wnNxuJCOBlLnWYHKz6WdePzN9AHq4zT+v/slMOg0tewgJOyHrCLmBozea2r72D
         1CkWnkTvBKZEqUyCpQEXOaT0TUElYTdKpmCywCDU0mOElKABdMMW79Qt4ql9T+9mA7g2
         J49Emvv/plQE2Rtvlg/8hC+qgKCfIsJukXmUhK5BxBgQc/jt8Ra8QJgFIgAzuyETiKs2
         gOaNvhLYSrD4s1F1La7IchKxuXlJZ2reBgN+zB5100AJVY5WrFPJpZ8uK/eRvjene0PR
         a/hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id e6-20020ac24e06000000b004f3a8f89761si9421lfr.11.2023.05.19.13.40.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdb5XB4zxwN;
	Fri, 19 May 2023 22:40:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 36/73] core: riscv: paging: add headers
Date: Fri, 19 May 2023 22:39:56 +0200
Message-Id: <20230519204033.643200-37-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 hypervisor/arch/riscv/include/asm/paging.h    | 106 ++++++++++++++++--
 .../arch/riscv/include/asm/paging_modes.h     |  18 +++
 hypervisor/include/jailhouse/header.h         |   5 +
 3 files changed, 118 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/paging.h b/hypervisor/arch/riscv/include/asm/paging.h
index 866f9a3f..b34173e8 100644
--- a/hypervisor/arch/riscv/include/asm/paging.h
+++ b/hypervisor/arch/riscv/include/asm/paging.h
@@ -4,7 +4,7 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -14,41 +14,125 @@
 #define _JAILHOUSE_ASM_PAGING_H
 
 #include <jailhouse/types.h>
+#include <jailhouse/header.h>
+#include <asm/csr64.h>
 
 #define PAGE_SHIFT		12
 
-#define MAX_PAGE_TABLE_LEVELS	3
+#define RISCV_PAGE_SV_DEPTH	39
+#define RISCV_HV_PAGE_SV_DEPTH	39
 
+/* SV32 requires 2, SV39 3, SV48 4. Once we support SV57, this should be 5. */
+#define MAX_PAGE_TABLE_LEVELS	4
 #define PAGE_FLAG_FRAMEBUFFER	0
+
+/*
+ * RISC-V does not insert caching/prefetching/... information into page tables.
+ * Instead, this is done via `Physical Memory Attributes'. However, the ISA
+ * does not define a concrete form of PMAs.  E.g., they could be hardcoded by
+ * physical address in a SoC.
+ */
 #define PAGE_FLAG_DEVICE	0
 
-#define PAGE_DEFAULT_FLAGS	0
-#define PAGE_READONLY_FLAGS	0
-#define PAGE_PRESENT_FLAGS	0
+#define RISCV_PAGE_WIDTH	12
+#define RISCV_PTE_SIZE		3
+#define RISCV_PTES_PER_NODE	(RISCV_PAGE_WIDTH - RISCV_PTE_SIZE)
+
+#define RISCV_PTE_V	0
+#define RISCV_PTE_R	1
+#define RISCV_PTE_W	2
+#define RISCV_PTE_X	3
+#define RISCV_PTE_U	4
+#define RISCV_PTE_G	5
+#define RISCV_PTE_A	6
+#define RISCV_PTE_D	7
+
+#define RISCV_PTE_FLAG(FLAG)	(1 << RISCV_PTE_ ## FLAG)
+
+
+#define PAGE_PRESENT_FLAGS		(RISCV_PTE_FLAG(V))
 #define PAGE_NONPRESENT_FLAGS	0
+#define PAGE_GUEST_PRESENT_FLAGS	(PAGE_PRESENT_FLAGS | RISCV_PTE_FLAG(U))
+
+#define	PAGE_DEFAULT_FLAGS	(PAGE_PRESENT_FLAGS | RISCV_PTE_FLAG(R) | \
+				 RISCV_PTE_FLAG(W) | RISCV_PTE_FLAG(X))
+
+#define PAGE_READONLY_FLAGS	(PAGE_PRESENT_FLAGS | RISCV_PTE_FLAG(R))
+
 
 #define INVALID_PHYS_ADDR	(~0UL)
 
-#define TEMPORARY_MAPPING_BASE	0x0000008000000000UL
+#define TEMPORARY_MAPPING_BASE	(~0UL << (RISCV_PAGE_SV_DEPTH - 1))
 #define NUM_TEMPORARY_PAGES	16
 
-#define REMAP_BASE		0xffffff8000000000UL
 #define NUM_REMAP_BITMAP_PAGES	4
+/*
+ * REMAP_BASE hast to be described by the same top-level PTE as JAILHOUSE_BASE,
+ * otherwise it won't be added to non-CPU 0 page tables automatically
+ */
+#define REMAP_BASE\
+	(JAILHOUSE_BASE & ~0UL << (RISCV_HV_PAGE_SV_DEPTH - 9))
 
-#define CELL_ROOT_PT_PAGES	1
+#if REMAP_BASE + (NUM_REMAP_BITMAP_PAGES * 1UL << /*
+				*/   12 /* ld bytes/page
+				*/ +  3 /* ld bits/byte
+				*/ + 12 /* each bit represents a page
+				*/) > JAILHOUSE_BASE
+
+# error Overlap between REMAP area and JAILHOUSE_BASE!
+#endif
+
+#define CELL_ROOT_PT_PAGES	(1 << 2)
+
+#define ATP_MODE_SHIFT		60
+#define ATP_MODE_SV39		0x8
+#define ATP_MODE_SV48		0x9
+#define ATP_MODE_SV57		0xa
 
 #ifndef __ASSEMBLY__
 
-typedef u64 *pt_entry_t;
+#include <jailhouse/string.h>
 
-static inline void arch_paging_flush_page_tlbs(unsigned long page_addr)
+typedef size_t *pt_entry_t;
+
+/* MMU mode for Jailhouse (S-Mode) */
+extern unsigned char hv_atp_mode;
+
+static inline void arch_paging_flush_page_tlbs(size_t page_addr)
 {
+	asm volatile("sfence.vma /* rd, */ zero, %[addr]" :
+		     : [addr] "r" (page_addr));
 }
 
-static inline void arch_paging_flush_cpu_caches(void *addr, long size)
+/*
+ * In RISC-V, the MMU accesses page tables through the caches (the MMU is a
+ * coherent agent)
+ */
+static inline void arch_paging_flush_cpu_caches(void const *addr, size_t size)
 {
 }
 
+#define ENABLE_MMU(NAME, REG)						\
+static inline void enable_mmu_##NAME(u8 mode, unsigned long pt)		\
+{									\
+	u64 atp;							\
+									\
+	atp = (u64)mode << ATP_MODE_SHIFT | (u64)pt >> PAGE_SHIFT;	\
+	asm volatile("sfence.vma\n"					\
+		     "csrw %0, %1\n"					\
+		     "sfence.vma\n"					\
+		     : : "i"(REG), "rK"(atp) : "memory");		\
+}
+
+ENABLE_MMU(satp, CSR_SATP)
+ENABLE_MMU(hgatp, CSR_HGATP)
+
+struct paging_structures;
+struct cell;
+
+void riscv_paging_vcpu_init(struct paging_structures *pg_structs);
+int riscv_paging_cell_init(struct cell *const cell);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* !_JAILHOUSE_ASM_PAGING_H */
diff --git a/hypervisor/arch/riscv/include/asm/paging_modes.h b/hypervisor/arch/riscv/include/asm/paging_modes.h
index e69de29b..b7beb168 100644
--- a/hypervisor/arch/riscv/include/asm/paging_modes.h
+++ b/hypervisor/arch/riscv/include/asm/paging_modes.h
@@ -0,0 +1,18 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/paging.h>
+
+extern const struct paging riscv_Sv39[];
+extern const struct paging riscv_Sv48[];
+extern const struct paging riscv_Sv39x4[];
+extern const struct paging riscv_Sv48x4[];
diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
index 518bc5cb..c5285262 100644
--- a/hypervisor/include/jailhouse/header.h
+++ b/hypervisor/include/jailhouse/header.h
@@ -10,6 +10,9 @@
  * the COPYING file in the top-level directory.
  */
 
+#ifndef _JAILHOUSE_HEADER_H
+#define _JAILHOUSE_HEADER_H
+
 #include <asm/jailhouse_header.h>
 
 #define JAILHOUSE_SIGNATURE	"JAILHOUS"
@@ -94,3 +97,5 @@ struct jailhouse_header {
 };
 
 #endif /* !__ASSEMBLY__ */
+
+#endif /* _JAILHOUSE_HEADER_H */
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-37-ralf.ramsauer%40oth-regensburg.de.
