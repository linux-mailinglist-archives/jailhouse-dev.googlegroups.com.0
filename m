Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZEGRGPQMGQEIAW22EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2068D685
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:13 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id r17-20020a2eb891000000b00290658792cesf3494515ljp.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772773; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNs2cT1yMV5hiUeFb2DpNXquDa+imFG7Qntll88nOFLDgm73SRCADHf+K05X6WlbfK
         FUmRZYlzjLfdVGsH5cwgZiJ35BYsFEZ9p4iLpnxK0HUt8nfLpUaiiS5jRJTRv9ZX9HGh
         R6sh/U1KMVuStLo6Y+Ia0gpPNYhcceRa6/DC3UIsxyAxWslXdKgiHIJkb6VyOBAOauAu
         ibnmCX3O51q+KXF1kVhGAvMkNGEvhIe0WHkCJbogiayF41hDW6zVG04p+DWIARnI/5XA
         HQlDNBZLJslLpujClC9cGue7PG5/rgBdDDpYcZPo3xGok2TOuxT7tu9uWxglYd9wJLxr
         TWag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0K9glORuPMWtV5JMlIMTQQO4QvopYJ7CmsuLGqZGC4k=;
        b=YkfVAUehBuKpXqy6I337xKjHzORQJ48B4knJc9J3F8qOKLbBGuoyjpcE57INX8RZq6
         XTfCKTA3zDKJS+8zujpVyWmzMXAnalFrixL5kqYrh7OT2fyBY1FQxqNomF4eguNzl9DM
         m79jx58r/4OhUT61rvalwuSx/kozZ9eHCFAw1k+cCji+9mVjHKR6Sw7WtrQmMWx6muLv
         deICZERWY15dULg8Zuk7BvIsAhzN/Ds6aC2kjp3NNC94ZOR2nZ5gc1nAnnnZQBFYUzPf
         WVuRToEl/5ZhGw6W9aiflxfmXAJ7Vv3A0vi01AAIjrQYDO/clzJXyhRl2g5gkOeAAK6K
         I5Qw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0K9glORuPMWtV5JMlIMTQQO4QvopYJ7CmsuLGqZGC4k=;
        b=IIjZLYahF/C/Ow+4ofwpck8esFzSrnvyn5Sf5qX9FjXSoTxh4cRorWp/AEJMAHegNO
         BISe6/Q4Hl8jeTUQrUlPTTmO/kU3AwE9h0qXsaw1O2tqsq1V6zFOsgEmdC79Z6hykr/p
         0JY2sxoD13vM7Kbrxby2asoHfEWd08yaC2qL3AYSBHZ/LsC5t/ht15a5ErzgYWtsg5bm
         6WhEzsM1Tub/DIfdSfOdVCJVkpJYRFAQtWS9aTQc+FgGzs4MOnTBcw9DEzi4YhBuZdtp
         Edqx7wfgzyv0hDou613bsAs9JdlarklloUfmzSgMwzflQW3s1sEXh7nukcBQciuYgJHu
         BZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0K9glORuPMWtV5JMlIMTQQO4QvopYJ7CmsuLGqZGC4k=;
        b=UQxredI7wQQuIyiktk4kaMaggQ5bUwnJ4p47NJp51grvD6QCosvA2oiZAEbw2ueQaw
         t2kGRUrLH+VJAq8HNjdtVF3RovGD04TW7baZP5dzPm/W0xhoZ2+PrPPJN6HwouJVQ8yz
         j4k/PSCVZ/WNtlVKhXw8nhXPSNTEz4g6YTfLT0f0OZVinn28OJzsqWUyWBF7MI968iiK
         8FtjeK4fVhpfgWKR1Px6eis2pijuLbhTUJR13yqxgBkpohnOBwpzjp4kNWBZjvbWFCv8
         DC1jy26VK6i/hgLg6iyDWbw8x66KGQdsowAbq8F6HyGdnk/CLXNEZysCJdT9JPk04gp/
         D/pA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXcl0qJsyBo2lGJxZ5VE99hQp/Cf0H25eLjOSfS51qdBI5Rrnuu
	RMFJPxsc0wqX8aDwskApErM=
X-Google-Smtp-Source: AK7set/v0yvG7riGMy9Zv/+8R6i1xazLEc8ZRoPVmQTiIUZ0cRh6ia7UOJtj2b4Kw/N2oiIsai8Kfw==
X-Received: by 2002:ac2:46e7:0:b0:4d8:7f67:a805 with SMTP id q7-20020ac246e7000000b004d87f67a805mr451104lfo.269.1675772773233;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10c9:b0:4d5:7ca1:c92f with SMTP id
 k9-20020a05651210c900b004d57ca1c92fls72058lfg.2.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:11 -0800 (PST)
X-Received: by 2002:a05:6512:21c8:b0:4aa:8811:4c59 with SMTP id d8-20020a05651221c800b004aa88114c59mr702469lft.28.1675772771283;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772771; cv=none;
        d=google.com; s=arc-20160816;
        b=01rWrsnydYTeI/hHHqLAFMUh0NOZt74s3Z07pK4qcBLnKFNvRq5JFzwXPgasoo7LDx
         K0phI/z848la2PsfBmKRiPah3IDqc68dSFGi95x5pnLWjib0SHTxvSkq8zJa4jMgQmQV
         hKcQsIt6MMGFhLlpfXFC4VQkyiok08d5P3hoIgL5ngM19z1zEri86HQNNiRalp9TaU9p
         6mYG6XzFJmqSD42uv6MI33qLGi18E9dETBg33BzK5YEFTI7fYL7w+TL8iZ9/byEDPQBn
         omx3WFGQ3ita2dibzGXu6FIPETOGksTFT+TfaW/AN+TGomhPFH7zW2cRvlbSCk8ybMJO
         stkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=rSRF+iGweHtIDjjB/tSwiiIRPMHca65dUuWRcsnTSDw=;
        b=i8/7RohJDhld6ctsMwsoYgNSzufGFV1I/vcdDEDmeVHmKNjYsAS2qdlSELeq8UniPd
         E8Kh56U4KC9TBcKDTn0gL0VSf1WznTqBpDZRxx9l5/QtWbBms2t/YIH3297GuyEuDK6j
         oq19TG07k8bUylT9nyHhNmS/bcJIDWCOKl2oSIwfhiMYIy4SP7XRWcbJca+Hf2as7tw/
         G+Xtqc60hgsBJ+FVyVT5jdTEEbZQnADnx+lP1p7h+EwburlCZOd2ViDmOL1K/mytGK+M
         SqA9Iov928kRi8m4cbzHSam9GpPHuhSsEq5RlC4+3s4hYBQSplp6ZJOci+Iw5aA/6q8s
         rluQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f36-20020a0565123b2400b004a222ff195esi638105lfv.11.2023.02.07.04.26.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RQ2pk1zy8J;
	Tue,  7 Feb 2023 13:26:10 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Konrad Schwarz <konrad.schwarz@gmail.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC v2 21/47] core: riscv: implement paging structures
Date: Tue,  7 Feb 2023 13:25:17 +0100
Message-Id: <20230207122543.1128638-22-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_NEGATE 0, __FRAUD_WEBMAIL 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0,
 __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-22-ralf.ramsauer%40oth-regensburg.de.
