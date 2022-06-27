Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DA55B9FC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id j7-20020a056512398700b004811ba582d2sf1113991lfu.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=KAyqFAV/bvYeNnhLlJYCwF+qUwPqkaJGK6nSr98eNkHT0sG1F2qiH5x5aFxmnCZr0F
         lvD7A0Y8Xi+t98tvrI0V9HPZh7HoI3IB40hFgJs4Q8PXyyABWSvTCto042IlxbNRlzyI
         x7P73a8c66F4UmJo7rpz/ed0P+ivoUWD/JzjEy5ZvbwfusoQ+QZQVkTB8RsyVlqVCQn8
         X2YWhS8ooOH47jVIepswV+pX/Hr/CZ5IJ/z7Q5NxW9mieDigNFJb+ommpVlGmJsJGnnI
         0MeizzCXE1hCQNd4ZaajDmxQahCnX0MwGrXRu3hIlYIDxyE1jmlS3P4E8wgvSZGKA7vr
         0XQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1DjE/XzfAOX15x1UwZEcQj3DsWpoExJokIBbZslDBxM=;
        b=KbAB+YIeQJPqYBU8neWvtudWqB/nRauzQQTwC83s89pvB+PLw0x48gYfw63BkpP6ge
         Wp7c7Mtch3pUPY/8vsL9jvvNEnbTmsZKMSlLBLJMIjEEye0lWEFMwQKPcN9Vdqp90J7M
         o9gD8Ai8d5mJLqrZQo2gwLSLREUBvDiM5DN8j0249Wj/tnYeS6gK5I5lPLhm/4miRT1U
         HAhzrJ+j0P/dGodmVjO7Z8G4dEcsB5ZcPwKalKRvRLEKDp3HxOyS3G/XNmt9zmGTxKAz
         gaOkY8KeGB2DOyXXoNX3hIa/mnunngSpswEocARLdsuvNX4K1YkD52rgZTcc3gyqkZHt
         3/mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RJiw0wzF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DjE/XzfAOX15x1UwZEcQj3DsWpoExJokIBbZslDBxM=;
        b=bULlf3u4dCS3UzeJY+PJW8PJpimXkpPDafA/6kiP+MZl4TgJ0e3+79RaLoyTxZAYcB
         YSQfDccly+SywD3tMdtKvNuflBzN2OoyVEIDN5ndTlzmr/4BEGlqHrH0TL9cWhu+3gVR
         OG5VAPSWKXEFqDf/yUp6OgCRuUk5RTQ8JRY1Jxbwl7en62ES0z5rhPV7R1usVkCm2Ib4
         NHAlbJyOvu5p9iGUdEOA+pEYPJhrYmv5gd2xXWPvfJn1T6rWB54wyAog4CXsArU99Jps
         4ZRKGnTSRh7gEKknnEwREuvE1TGe4f/tiWs8wjYreiUuf+5CI+Ljg5kurj8guIUi+GKV
         4fCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DjE/XzfAOX15x1UwZEcQj3DsWpoExJokIBbZslDBxM=;
        b=cZsY/Ja2WYfaO7Q4txhyXFjQSf3he8xfcyxq5tcbCYg8S1oi4T4tCRyLiU1M3RUcr+
         iLYV8u93oVEo89N8mwNIPrNleohlMEZMYXUdGSbl9Xnao1JXVaxwaW9dvg26ZCzqGlwj
         B9Ovjr1MgrwavdLmGWmF3KzEvv9cgylaxghH8n0Tqt9j1MDwzI4GbLd/SxlVDhxTWZW8
         /okknCs3SZG4ooBmBefdncN1QOSOOG1fwZdL/gQP72gr9QUZvaiNoamW/+4z/ndcsI0X
         Ng3WDG2+/WJiFY6u1VkDWaONrt7Gp2ZaXzixHgtvH/+FJvhfLQY8FwZDVmypVwA5XNw3
         GoVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/5Y7pvJN6lmLwV3elEMhNwNGKXiNZCN9FXcy2MvioBktcWfDQ6
	rJ8AgZ8wfQ8kL7+kwu/HsL4=
X-Google-Smtp-Source: AGRyM1uG9Zp6U1EFrAyskKo14VSXy8LbUU13omkYIGr5uiV/Hm1oUh9oTkdIg50UbEZCYSl51R2mtw==
X-Received: by 2002:ac2:5a03:0:b0:47f:90ee:4c9 with SMTP id q3-20020ac25a03000000b0047f90ee04c9mr8947033lfn.319.1656336562593;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bf11:0:b0:24a:fdc1:7af4 with SMTP id c17-20020a2ebf11000000b0024afdc17af4ls4766553ljr.1.gmail;
 Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a2e:b892:0:b0:25b:ce73:675f with SMTP id r18-20020a2eb892000000b0025bce73675fmr163562ljp.67.1656336560961;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336560; cv=none;
        d=google.com; s=arc-20160816;
        b=m7S0drrBclKqo6aLbHPu6cBhKBMH5k3mTCaRvFsPZUFcPsObhJY2lELbaauoEPnAgU
         QrhTo0BpcbIeyVtO+HfrAR1+bnLHcoMOCgX2irGqMR7auRHgCnnjU9P+9TVlEz7/SRHi
         uxW4mXKZAHsQc87XsQNZJPmGlRzTiplfAVAC4EvGhZrDqCp2Iw03PrbGeKrCajZ9SF+g
         MSPuStvn+rWWpi/ntZO8rCEEPciPx7fSohalMxrcIFKClkhcl9Q7XYbGufFdQ2eHisD/
         11VPBaGWGS07sKZiHceFr3OmVHSPo7NIwc40pcz59IsBEqyBIwERYe3cpEBwS18P41If
         Urgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X2P8ZYsF8R5RylqdHdNDgTFBoB+ZOYzCDIFzy/lv2EE=;
        b=aPp476cw1AlWrAcWZAitQLpXV7LhhQuqfUNiFq0uSf7jLe7YnicMLwBT1jERgil9N9
         Keq/81+ENYtU2rbogXexNKnuFEoDpRDO9YmWJ8/xI1jy3ZJe10d4NU6OHQ1C126Byjul
         ATBuH/n5H7/UG0lQ3E8FF7Kjk46f/YPBIV75HxDm24QvLM2dlGyq8pxh5bhcX1RKwKPp
         Da1xnwN93QhualWVZADPJCPqnxYMHUUT2LOBXRqaPqOswkywdi7GGXiUzBVqDRqcaJ92
         f6/d5hHeyQe8Jqn21dfUe7B/yC3RUt1txMSv9ZUN0+qi9SrMsSwRLOF/OeyDJ4FVwbMW
         WhXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RJiw0wzF;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id u12-20020a05651206cc00b0047faa025f65si339014lff.12.2022.06.27.06.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV82xCtzxwx;
	Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 20/42] core: riscv: implement paging structures
Date: Mon, 27 Jun 2022 15:28:43 +0200
Message-ID: <20220627132905.4338-21-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=RJiw0wzF;
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

From: Konrad Schwarz <konrad.schwarz@gmail.com>

While we need support for SV39, SV48 AND SV57 in the bootstrapping
pagetables, we can later grade down to SV39.

For hypervisor paging, I chose to use SV39, as it comes with less levels
than the other ones.

For G-Stage (guest) paging, I chose SV39 as well: It is very unlikely
that we need a GP address that is very very high. Independant of the
G-Stage paging, the guest may use any available paging method that it
wants. This means, Linux may enable SV57 paging on top of a SV39
G-stage.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/paging.c        | 262 +++++++++++++++++++++++++-
 hypervisor/include/jailhouse/paging.h |   2 +-
 2 files changed, 260 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/paging.c b/hypervisor/arch/riscv/paging.c
index 294ea958..99a842ea 100644
--- a/hypervisor/arch/riscv/paging.c
+++ b/hypervisor/arch/riscv/paging.c
@@ -2,22 +2,278 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
 #include <jailhouse/paging.h>
+#include <jailhouse/percpu.h>
+#include <asm/csr64.h>
+
+#define HV_PAGING	riscv_Sv39
+#define HV_ATP_MODE	ATP_MODE_SV39
+#define CELL_PAGING	riscv_Sv39x4
+#define CELL_ATP_MODE	ATP_MODE_SV39
+
+#define	PAGE_BITS	12
+#define	WORD_BITS	3 /* 1 << WORD_BITS == sizeof (void *) */
+#define	MAX_FLAG	10
+#define FLAG_MASK	((1 << MAX_FLAG) - 1)
+
+#define	PAGE_LEVEL_BITS		(PAGE_BITS - WORD_BITS)
+#define PAGE_LEVEL_MASK(ROOT)	((1 << (PAGE_LEVEL_BITS + 2 * !!(ROOT))) - 1)
+
+#define	UNTRANSLATED_BITS(LEVEL) \
+			((LEVEL) * PAGE_LEVEL_BITS + PAGE_BITS)
+
+#define	PAGE_TERMINAL_FLAGS \
+	(RISCV_PTE_FLAG(R) | RISCV_PTE_FLAG(W) | RISCV_PTE_FLAG(X))
+
+unsigned char hv_atp_mode;
+static unsigned char cell_atp_mode;
+
+static inline unsigned long pte2phys(unsigned long pte)
+{
+	return (pte & ~FLAG_MASK) << (PAGE_BITS - MAX_FLAG);
+}
+
+static inline unsigned long phys2pte(unsigned long phys)
+{
+	return phys >> (PAGE_BITS - MAX_FLAG);
+}
+
+#define DEF_GET_ENTRY(NAME, LEVEL, ROOT)			\
+static pt_entry_t						\
+sv## NAME ##_vpn## LEVEL ##_get_entry(page_table_t pt,		\
+					unsigned long virt)	\
+{								\
+	return pt + ((virt >> UNTRANSLATED_BITS(LEVEL)) &	\
+		    PAGE_LEVEL_MASK(ROOT));			\
+}
+
+DEF_GET_ENTRY(X, 0, false)
+DEF_GET_ENTRY(X, 1, false)
+DEF_GET_ENTRY(X, 2, false)
+DEF_GET_ENTRY(X, 3, false)
+
+static bool svX_entry_valid(pt_entry_t pte, unsigned long flags)
+{
+	/*
+	 * We must not check flags, we only need to check for the V-bit. PTEs
+	 * are valid, if V is set. If R/W/X is set, then it means that the PTE
+	 * is a leaf.
+	 */
+	return !!(*pte & RISCV_PTE_FLAG(V));
+}
+
+#define DEF_SET_TERMINAL(NAME, FLAGS)					\
+static void sv## NAME ##_vpnX_set_terminal(pt_entry_t pte,		\
+					   unsigned long phys,		\
+					   unsigned long flags)		\
+{									\
+	/*								\
+	 * set A and D flas pre-emptively, to avoid page-faults 	\
+	 * exceptions when the hardware does not set A and D by itself	\
+	 */								\
+	*pte = FLAGS | RISCV_PTE_FLAG(D) | RISCV_PTE_FLAG(A) | flags |	\
+		phys2pte(phys);						\
+}
+
+DEF_SET_TERMINAL(X, 0)
+
+#define DEF_GET_PHYS(LEVEL)					\
+static unsigned long						\
+svX_vpn## LEVEL ##_get_phys (pt_entry_t pte, unsigned long virt)\
+{								\
+	unsigned long entry = *pte;				\
+	if (!(RISCV_PTE_FLAG(V) & entry) ||			\
+	    !(PAGE_TERMINAL_FLAGS & (entry)))			\
+		return INVALID_PHYS_ADDR;			\
+	return pte2phys(entry) |				\
+	       (((1UL << UNTRANSLATED_BITS(LEVEL)) - 1) & virt);\
+}
+
+DEF_GET_PHYS(0)
+DEF_GET_PHYS(1)
+DEF_GET_PHYS(2)
+DEF_GET_PHYS(3)
+
+static unsigned long svX_get_flags(pt_entry_t pte)
+{
+	return *pte & FLAG_MASK;
+}
+
+#define DEF_SET_NEXT(NAME, FLAGS)					\
+static void								\
+sv## NAME ##_vpnX_set_next_pt(pt_entry_t pte, unsigned long next_pt)	\
+{									\
+	*pte = FLAGS | RISCV_PTE_FLAG(V) | phys2pte(next_pt);		\
+}
+
+DEF_SET_NEXT(X, RISCV_PTE_FLAG(G))
+
+static unsigned long svX_vpnX_get_next_pt(pt_entry_t pte)
+{
+	return pte2phys(*pte);
+}
+
+static void svX_clear_entry(pt_entry_t pte)
+{
+	*pte = 0;
+}
+
+static inline bool _svX_page_table_empty(page_table_t page_table,
+					 unsigned long len)
+{
+	unsigned long *page_table_end = page_table + len;
+
+	for (; page_table_end > page_table; ++page_table)
+		if (RISCV_PTE_FLAG (V) & *page_table)
+			return false;
+	return true;
+}
+
+static bool svX_page_table_empty(page_table_t page_table)
+{
+	return _svX_page_table_empty(page_table, 1 << PAGE_LEVEL_BITS);
+}
+
+#define	RISCV_SVX_PAGING_LEVEL(LEVEL)				\
+	{							\
+		.page_size = 1UL << UNTRANSLATED_BITS(LEVEL),	\
+		.get_entry = svX_vpn ## LEVEL ## _get_entry,	\
+		.entry_valid = svX_entry_valid,			\
+		.set_terminal = svX_vpnX_set_terminal,		\
+		.get_phys = svX_vpn## LEVEL ##_get_phys,	\
+		.get_flags = svX_get_flags,			\
+		.set_next_pt = svX_vpnX_set_next_pt,		\
+		.get_next_pt = svX_vpnX_get_next_pt,		\
+		.clear_entry = svX_clear_entry,			\
+		.page_table_empty = svX_page_table_empty,	\
+	}
+
+/* sequence is from root to leaves */
+const struct paging riscv_Sv39[] = {
+	RISCV_SVX_PAGING_LEVEL(2),
+	RISCV_SVX_PAGING_LEVEL(1),
+	RISCV_SVX_PAGING_LEVEL(0),
+};
+
+const struct paging riscv_Sv48[] = {
+	RISCV_SVX_PAGING_LEVEL(3),
+	RISCV_SVX_PAGING_LEVEL(2),
+	RISCV_SVX_PAGING_LEVEL(1),
+	RISCV_SVX_PAGING_LEVEL(0),
+};
+
+/* 4K*2 for level 2, in case of SV39, and for level 3, ind case of SV48 */
+DEF_GET_ENTRY(39x4, 2, true)
+DEF_GET_ENTRY(48x4, 3, true)
+
+/* For the rest (non-root tbls), reuse svX routines */
+#define	sv39x4_vpn0_get_entry	svX_vpn0_get_entry
+#define	sv39x4_vpn1_get_entry	svX_vpn1_get_entry
+
+#define	sv48x4_vpn0_get_entry	svX_vpn0_get_entry
+#define	sv48x4_vpn1_get_entry	svX_vpn1_get_entry
+#define	sv48x4_vpn2_get_entry	svX_vpn2_get_entry
+
+#define	sv39x4_vpn0_get_phys	svX_vpn0_get_phys
+#define	sv48x4_vpn0_get_phys	svX_vpn0_get_phys
+
+#define	sv39x4_vpn1_get_phys	svX_vpn1_get_phys
+#define	sv48x4_vpn1_get_phys	svX_vpn1_get_phys
+
+#define	sv39x4_vpn2_get_phys	svX_vpn2_get_phys
+#define	sv48x4_vpn2_get_phys	svX_vpn2_get_phys
+
+#define	sv48x4_vpn3_get_phys	svX_vpn3_get_phys
+
+DEF_SET_TERMINAL(Xx4, RISCV_PTE_FLAG(U))
+
+DEF_SET_NEXT(Xx4, 0)
+
+static bool svXx4_root_page_table_empty(page_table_t page_table)
+{
+	return _svX_page_table_empty(page_table, 2 << (2 + PAGE_LEVEL_BITS));
+}
+
+#define	RISCV_SVXx4_PAGING_LEVEL(WIDTH, LEVEL, ROOT)		\
+	{							\
+		1UL << UNTRANSLATED_BITS(LEVEL),		\
+		sv ## WIDTH ## x4_vpn ## LEVEL ## _get_entry,	\
+		svX_entry_valid,				\
+		svXx4_vpnX_set_terminal,			\
+		sv ## WIDTH ## x4_vpn ## LEVEL ## _get_phys,	\
+		svX_get_flags,					\
+		svXx4_vpnX_set_next_pt,				\
+		svX_vpnX_get_next_pt,				\
+		svX_clear_entry,				\
+		(ROOT)? svXx4_root_page_table_empty:		\
+				svX_page_table_empty,		\
+	}
+
+/* sequence is from root to leaves */
+const struct paging riscv_Sv39x4[] = {
+	RISCV_SVXx4_PAGING_LEVEL(39, 2, true),
+	RISCV_SVXx4_PAGING_LEVEL(39, 1, false),
+	RISCV_SVXx4_PAGING_LEVEL(39, 0, false),
+};
+
+const struct paging riscv_Sv48x4[] = {
+	RISCV_SVXx4_PAGING_LEVEL(48, 3, true),
+	RISCV_SVXx4_PAGING_LEVEL(48, 2, false),
+	RISCV_SVXx4_PAGING_LEVEL(48, 1, false),
+	RISCV_SVXx4_PAGING_LEVEL(48, 0, false),
+};
 
 void arch_paging_init(void)
 {
+	/*
+	 * Basically, any MMU mode can be used here. Let's choose SV39 for two
+	 * reasons:
+	 *  - It only requires three levels for 4K pages, whereas SV57 requires
+	 *    five levels
+	 *  - In Jailhouse, we typically use 1:1 mappings, and any real
+	 *    hardware should be mapable with a SV39. No need for SV48 or SV57.
+	 *    Guests may still use whatever they want.
+	 *
+	 *    Same arguments apply for cell paging (G-stage paging).
+	 */
+	hv_paging_structs.root_paging = HV_PAGING;
+	hv_atp_mode = HV_ATP_MODE;
+	cell_atp_mode = CELL_ATP_MODE;
 }
 
-// Might be misplaced
-unsigned long arch_paging_gphys2phys(unsigned long gphys, unsigned long flags)
+unsigned long arch_paging_gphys2phys (unsigned long gphys, unsigned long flags)
 {
+	return paging_virt2phys(&this_cell()->arch.mm, gphys, flags);
+}
+
+void riscv_paging_vcpu_init(struct paging_structures *pg_structs)
+{
+	unsigned long table;
+
+	table = paging_hvirt2phys(pg_structs->root_table);
+	enable_mmu_hgatp(ATP_MODE_SV39, table);
+}
+
+int riscv_paging_cell_init(struct cell *cell)
+{
+	cell->arch.mm.hv_paging = 0;
+	cell->arch.mm.root_paging = CELL_PAGING;
+
+	cell->arch.mm.root_table =
+		page_alloc_aligned(&mem_pool, CELL_ROOT_PT_PAGES);
+	if (!cell->arch.mm.root_table)
+		return -ENOMEM;
+
 	return 0;
 }
diff --git a/hypervisor/include/jailhouse/paging.h b/hypervisor/include/jailhouse/paging.h
index d592abad..8841b09e 100644
--- a/hypervisor/include/jailhouse/paging.h
+++ b/hypervisor/include/jailhouse/paging.h
@@ -96,7 +96,7 @@ typedef pt_entry_t page_table_t;
 struct paging {
 	/** Page size of terminal entries in this level or 0 if none are
 	 * supported. */
-	unsigned int page_size;
+	unsigned long page_size;
 
 	/**
 	 * Get entry in given table corresponding to virt address.
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-21-ralf.ramsauer%40oth-regensburg.de.
