Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY4GRGPQMGQEFHUAICA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7568D681
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:12 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id s2-20020a2e1502000000b002917ff038dasf3501551ljd.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772772; cv=pass;
        d=google.com; s=arc-20160816;
        b=NxAtrubc2ZfhPj7Ga+ORPwRuvUi4flLj/8IGYnyBmk5Ev+vMWkJu8z3PJV2gHxNF54
         mlrOKW5IzdcOQjJy3hj74ImiVTWEw4sfbFoKSkR1ZEhJ2AL40AwX+XuZkagrO1avydOa
         4VjbmrbmGhaLkru6+KAz9wMqkUhLCb0TuwdTmu5/x8Ikm0NUtM6WaUrIoSaEZr3kQ4+a
         D7eqSnK3GA2fXccJzlZA3H0up9m7iFcqNM0ZuDGHsvevUlv67YRh0lK2Kgm6KFn6IPl4
         if7tkNAi1YExZNK43E8myN49Flw8roeGK+4jLcm4vs88Xe0xlK/DAlMkO3oEUsrNCf2x
         gwQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UPxE9CnfFHZkyqMpjkbmiuUsiFY8nC5thFtZn8IQkTM=;
        b=m2cYh8fC9b01UHocVMV/tUHny6usokoJNUZ1woT8I9bC1gEyoa8RcAx8BqN8fxR7bp
         oivoAbSggs0EqvZblnv8kBLt9fmhLVhQrPbRnQ+p0FKu024qSSwpZZSzDU3xanYpATpE
         QpG+BBvKdZAJGJmEogInZqBSiVXK+sWxthFOGeMYbUjNbWfqRUYlN0znI4CR/yNYuEFN
         QIaIHb/XuqULKC/RFvz653oMvknu5C7mxMBUbDcyvw8GAUlNSNi7LfilRr34VlgeuAqk
         /+yjztuJSvJMmBKxALt9LDJWdNYpLk+OS9zpDVNVBevSJLkNU/4lpJFWHvKMei/tWKQ0
         lltQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPxE9CnfFHZkyqMpjkbmiuUsiFY8nC5thFtZn8IQkTM=;
        b=nw330hl2wcTGXWl2WwmP0TMTKWMzPlPQd+6QjHA4VinGvBfMg/7CB0ZzpMKwLrOkSp
         0KbCn+vTqEvY4J/5EsNnY7CG0ZpXCt0BtucpdJ0/MowL32YBycdnS1dG7EJOTanUG32O
         UeSqbOPA92ajGE6W+5YsN/t+Kbd/9g5RMXo3Z/ThLXGOIDKlGTrsfM2f5Cdpw5kYWb7i
         LR49OzfXiHrHhcUaU1jWdep3BzH7FmrRZe8FKLvY0I5U4JKeLD2puOGnjNx4lxy/rB+A
         CXgSDDO0MQM5TnIY/MxlOwdkZV2Iilp8yOw9qlMyZH2K3vLEZpPsVObMxZ09PL0bbdbd
         b8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPxE9CnfFHZkyqMpjkbmiuUsiFY8nC5thFtZn8IQkTM=;
        b=LunbVECN8yIik7JicDGpcO8VTd0oGX2MC2u0T2y+gJ3ckKtWxE+R0KXlseJMOPZ/Qu
         LYDGijU+zX/TEQhjX09RhOm2nM4lQlMNC0D0QhPGYhZpGyAGHGVl+3vMDTg+tUbpDJhV
         oqV4fCVtbol7/OkOpM5oV5eH85xLDp5ejVDUpVk64HoOS73pCJUhDha8j93nDvhkWYqK
         AvGU3xHWRfcnFCg9wKQQy94KAjC2LrGuomeD2rndZbUmFpws9u4GcbHZ4lWyRYeDme/a
         6CVU7c0JsMIzEOY4Rserlab9ShWgBNRMahW32QyOaNLiEj1DxhUdDJMJVNlk+53Y+fQN
         zyMg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXSXlXr/CNtY8y8a7yqZG+g+WuUhGmNnuKALn9SkWiHwh+XQ1EV
	PkC3VsMVxN8tvTD0fYP/tGs=
X-Google-Smtp-Source: AK7set9egNvhiXMmqkpA70x03wZKoqV+Avu3GkSJzOklTygAIoBq5NvwnBNgwqVnV/AyWn+Oy4KuJA==
X-Received: by 2002:a2e:b55a:0:b0:290:795d:1e07 with SMTP id a26-20020a2eb55a000000b00290795d1e07mr473792ljn.211.1675772771884;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4bcf:0:b0:4c8:8384:83f3 with SMTP id o15-20020ac24bcf000000b004c8838483f3ls72147lfq.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:10 -0800 (PST)
X-Received: by 2002:ac2:5699:0:b0:4b9:a91c:b0c9 with SMTP id 25-20020ac25699000000b004b9a91cb0c9mr812104lfr.7.1675772769974;
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772769; cv=none;
        d=google.com; s=arc-20160816;
        b=dPCpCPvwOnuHz/vh0Wr2/xIx8rn4mF+H+mX/BPoMSFGrkIrbDcOcz+jYSnFsC/zB/+
         DCDX6MipQxK6fxcA35zOcC6jMQpPXvVbGhQ53zElG5BBrjLeRTn0gqGyfdxDtYofpeuG
         2aJGCKYbTaNKIwqKveiXsarwk+Zv8D4Mw/YlUhXJretPXLjan4oWh7+XMwUhbJOtEFZ0
         3hx5VtjDZiEUqVKlv7uiV8DTTeQ4X2UNBpFN32OVuORUmQa6knyqRoWTL62WweOOOW/C
         LY9BykEhlRBhUDfo02VG3BWfbAlgNldBVdpkFrxQkYqLcXwGV+EMUKPj7G4P6/P994sh
         jAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4oxtJ1b3Kk9dswouKsxX2F4OrPFnLjXkzXTJaozwAgw=;
        b=ZWX8psOAF5dk7akgCyaFeBY9BFvaiP6a6ovVJDBRchdXq7DyGBlP/Ui75k1g+GLRhF
         e0RJ0iwnvETpz/J4hEgOqTpVSOojP5wdxuFLn5pO4ahDhMCkaQUaynkJfPFSAcke19OJ
         yiW4t6dnZpoQTO9jeqw41xurgrapKJ4r7qv7ZVJoVsL4tw4ZRJbeEL6RPrZsKWOtrxbb
         8fkTKteURxQeQp1DcoN1jVv2VWaWcHfIAPw+5J3EIFSRrtElU1dfNli6Q0WkNVL9Y7Po
         Pfgg2Lqbkp+GZDCicQx4k5Fpn7iYzSTUf+bx89TctcEiyqvaac7HX1hDfkTSY1Ces5hz
         LK/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f36-20020a0565123b2400b004a222ff195esi638103lfv.11.2023.02.07.04.26.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RP1Hjmz107p;
	Tue,  7 Feb 2023 13:26:09 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 17/47] core: riscv: paging: add headers
Date: Tue,  7 Feb 2023 13:25:13 +0100
Message-Id: <20230207122543.1128638-18-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-18-ralf.ramsauer%40oth-regensburg.de.
