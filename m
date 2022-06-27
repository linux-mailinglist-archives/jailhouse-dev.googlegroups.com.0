Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1355B9F3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id k32-20020a05600c1ca000b0039c4cf75023sf7307029wms.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336561; cv=pass;
        d=google.com; s=arc-20160816;
        b=ULDT404ik0PqSS8UPUg1XvsS432cWI5nF+aNB/4eu9yqVY28m2YsaIbtcHNxN95LAq
         4vNLDH+FruIjTu3KjWefwYWiCMx+HXpuetevFC7oT+T9ULNnDi3N9z0HNSMkBo/maLMT
         kso2+LyJsH6D9Am7DzT1rnMuJ18z/6RJh9mEXjdkgk2iCVckuSQMBAIXGlACdlGtUi7Y
         fkr2JrtIB2IA81Ro6qqkuc4YeqeXLiguvqZRl/tsv5pIfCkuxXUnDHAJSBKs2HGtt25b
         JFL67Q+KMmK48Hz4zPQ6ZYyGYioy/nbsaOSk8G/vQpycH6Y0+kWSIMhw6LwZbVJncNzA
         3XHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=04eEdybZTEsMdJVvPeb2LH1jsXJzerbgctt5UemYorQ=;
        b=pP59nkXOVq1TyCBzLvuzUUYne9GOEX6XoZfH4m3tkGvLVjeKTuJnLkz+BRjQJMTg+l
         CHva1P6rnVAM1CUe1vqdev4G6JWWAN372Sw7f10WbGE/Nd62+auHk1l6M7lSVdvHIAn5
         lwAoE3YXmchWpYXcJE3M9dl8QLdZImlG4HdEkcSYKS2LwfGFDtGQf6bjuNHhYd6n67hM
         TyHy9TSmDjgxGiJmbcEXCsXyTejYL/Ibzkuw+4tOuyRQWx3PE5vnPpkudpLX4bRt45se
         0K3e1roRJc0lIsePYyHPiEU6dGHdqrKHzAj8v4p3lNWSm6KE7+CPUFcgsnD7BlFJFjQY
         NOyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kC9ZynAE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=04eEdybZTEsMdJVvPeb2LH1jsXJzerbgctt5UemYorQ=;
        b=BSjcmRN2Lh4Wfu+QT/M9d71iGYpLAbHn2qPIDLz60EixR50jagBPlpZfpm/zuQyqvR
         YO9qU84Pyf7D3RPN4wcf7AlI/a69qhVcusdkAhrcDUwWN7T1mzlCEBYzzJhqtJKqKUNS
         9pr0ThbONznyLkAUhgBtYbTSveUp8M2GsfwyDY5eWEnMcwt9e01xVKuOVOBvtdYkt+j1
         LS/3scguKlC630hoZHbTjCA5vTr/tl55KT19ckkB78QibzkBB6Mp4TH/joZd721gHyGK
         NIGvOx80vAoo9tHpA8i0i5vv8XN0PmgFStdp13wjXs9zVlCFmYS+W8QVis0eLTYV0bih
         0IlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=04eEdybZTEsMdJVvPeb2LH1jsXJzerbgctt5UemYorQ=;
        b=cNbRgFoV0u+ay6bQ4W26cY1on5tOyynbq6/T2PnEOCew1dV1bW59UaYg+znoGhat/Y
         u+zTxC5odAHxd1Yk1UPO4SVaZBGWkPmLiBq0MfhJEjJUSyVYN9+BP/XCPVD/7s/UDzpl
         KqYRQ6mYTTRY6ItmYNrEkHvDdPZ1PdaHOVqrqkNau32nSBbXNnRmBUcXvamxBOIg+v5Q
         9MfZG4V+aOd4I8o/gL/X1l+jmnxWQ9kEywidwgJTQRygzh2Zw9EUyMXvE5yC9gMQE5nk
         8RKlgOk1R6B+kD+CRYL0i2vRS44km9LYP/RANU6HpM+BqnPUloP9Bqf7R92NG5dCfbA9
         vQSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/jYn6etCKFpP/YCrsznSxNO0BayFkxSHC+HIEvqaWZ1SLPWgzh
	P/ZJ7iqAlz9qAL/f34FImA8=
X-Google-Smtp-Source: AGRyM1tq/7rrTuPStEJa98lljUshSN2nZGKDyCnBctM8nw/fOE2fGDTEE+fc7e0KqYHzGFSKSSgmig==
X-Received: by 2002:a5d:4bce:0:b0:21b:9f38:e23d with SMTP id l14-20020a5d4bce000000b0021b9f38e23dmr12377597wrt.322.1656336561181;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083358wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-Received: by 2002:adf:ef10:0:b0:21b:8740:7085 with SMTP id e16-20020adfef10000000b0021b87407085mr12084786wro.9.1656336559768;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336559; cv=none;
        d=google.com; s=arc-20160816;
        b=yrFQUmXr+gooHj0h+7EB9sYcfwVg8mSfdFdifF4s40cGjNu9Cf/rfgGWqqpJRe/LBF
         7dBGa7EjuWxK6HQr6ahdMEUHgrMJFZT37x7x8FMiY5dr872rL9BP2el6XpF+1jn6J8yi
         x6Zd+eida47uMtWGVWe/WtU7Wa0+81b8tnpLUZyacVctUrJSKN6y+huztbY0FRnLICpL
         bReaVXmOGJ4+iDfKS7XQ0qHlmGXtm6IGqHqzV0Uz+wf2Q/rvSOBtkyIW5t/CfTew28dC
         /1a2gtjc6lazWm9jr1WaF+/5XaKk6LPBaSrLliPjibwon1452x5oEWmeIA7g9oaELgHg
         wYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/Ia/m9j+mbo+zBwftYxEfohUErDKYYU0wEy0PY7KR/A=;
        b=G/PiRoeDPi/mlOuVfB4jrRG9blz6+jjF/gbs07ufRBHqMKXIQoqtw2kUnwOJRsQeUq
         NlYJnurGq5PlrKj3RjBzNbTfbiWDh0tP5WFEwAGuMl4m38wAmWfy0lDs5d+X2pVeOKdU
         ALNawCDmGwbDJ8fvfJpxPnzj/beXsKT565CsvZDEnmoxgoSkJYI5E2yKDCHzVhKZoNGX
         3s2SvscwnQyFIMz/Qfj6GdR4XNP+T68wFMOlfE/hFOYaHx+RIkqesZe/ob9jUIPDa5D9
         IjRCnKu2oSn/2t3xG10vEgf4//PNP13sVNQ0t2bjfh055uvDsIcJaOLeTpopNAZkFJZ4
         ZsJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kC9ZynAE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id c15-20020a5d4f0f000000b0021b947060b9si458358wru.6.2022.06.27.06.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV73cn9zy0c;
	Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:19 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 16/42] core: riscv: paging: add headers
Date: Mon, 27 Jun 2022 15:28:39 +0200
Message-ID: <20220627132905.4338-17-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kC9ZynAE;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
 hypervisor/arch/riscv/include/asm/paging.h    | 119 ++++++++++++++++--
 .../arch/riscv/include/asm/paging_modes.h     |  18 +++
 hypervisor/include/jailhouse/header.h         |   5 +
 3 files changed, 130 insertions(+), 12 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/paging.h b/hypervisor/arch/riscv/include/asm/paging.h
index 866f9a3f..5044a5fb 100644
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
@@ -14,41 +14,136 @@
 #define _JAILHOUSE_ASM_PAGING_H
 
 #include <jailhouse/types.h>
+#include <jailhouse/header.h>
+#include <asm/csr64.h>
 
 #define PAGE_SHIFT		12
 
-#define MAX_PAGE_TABLE_LEVELS	3
+#define RISCV_PAGE_SV_DEPTH	39
+#define RISCV_HV_PAGE_SV_DEPTH	39
 
+/*
+ * SV32 requires 2, SV39 3, SV48 4. Once we support SV57, this should be 5.
+ */
+#define MAX_PAGE_TABLE_LEVELS	4
 #define PAGE_FLAG_FRAMEBUFFER	0
+/* RISC-v does not insert caching/prefetching/... information into page tables.
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
+#define RISCV_PTE_RSW	8
+#define RISCV_PTE_RSW_w	2
+
+#define RISCV_PTE_FLAG(FLAG)	(1 << RISCV_PTE_ ## FLAG)
+
+#define	PAGE_DEFAULT_FLAGS	(0\
+				| RISCV_PTE_FLAG (V)\
+				| RISCV_PTE_FLAG (R)\
+				| RISCV_PTE_FLAG (W)\
+				| RISCV_PTE_FLAG (X)\
+					)
+#define PAGE_READONLY_FLAGS	(0\
+				| RISCV_PTE_FLAG (V)\
+				| RISCV_PTE_FLAG (R)\
+				)
+#define PAGE_READWRITE_FLAGS	(0\
+				| RISCV_PTE_FLAG (V)\
+				| RISCV_PTE_FLAG (R)\
+				| RISCV_PTE_FLAG (W)\
+				)
+#define PAGE_PRESENT_FLAGS	(0\
+				| RISCV_PTE_FLAG (V)\
+				)
 #define PAGE_NONPRESENT_FLAGS	0
 
-#define INVALID_PHYS_ADDR	(~0UL)
+#define INVALID_PHYS_ADDR	(~0ul)
 
-#define TEMPORARY_MAPPING_BASE	0x0000008000000000UL
+#define TEMPORARY_MAPPING_BASE	(~0ul << (RISCV_PAGE_SV_DEPTH - 1))
 #define NUM_TEMPORARY_PAGES	16
 
-#define REMAP_BASE		0xffffff8000000000UL
 #define NUM_REMAP_BITMAP_PAGES	4
+/*
+ * REMAP_BASE hast to be described by the same top-level PTE as JAILHOUSE_BASE,
+ * otherwise it won't be added to non-CPU 0 page tables automatically
+ */
+#define REMAP_BASE\
+	(JAILHOUSE_BASE & ~0ul << (RISCV_HV_PAGE_SV_DEPTH - 9))
 
-#define CELL_ROOT_PT_PAGES	1
+#if REMAP_BASE + (NUM_REMAP_BITMAP_PAGES * 1ul << /*
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
+
+typedef size_t *pt_entry_t;
 
-static inline void arch_paging_flush_page_tlbs(unsigned long page_addr)
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-17-ralf.ramsauer%40oth-regensburg.de.
