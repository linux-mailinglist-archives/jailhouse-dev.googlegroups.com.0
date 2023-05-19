Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVV5T6RQMGQEYOYHMBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5670A0D9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:55 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id ffacd0b85a97d-306489b7585sf1411624f8f.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528855; cv=pass;
        d=google.com; s=arc-20160816;
        b=uifo1xTStzqstRHBf1r/lVVvsI6hkxcnrgZ036sCzyCGKyP/xELmb8qr2LixZen23w
         z5AuFvKupzSNE+GpGv+ORzoHOiASeWBaZVnuTRpeyJ5lKheXarSsLkgYvbCPQCc7g4jv
         xm+LaxM1u9I00NGDTBGSsgibtxsgcFO/sW1BuVsNrYH/yxhZBgVY49eb7kpXwh/ohh2u
         VIzrd+g+091FRira1lLotjXk0OJGgUKTqWrKa2SxOdwDbFB7G9anlOmRsTDDDNc6YxCV
         pyCRTmjCwd9XzJeBVKfISWz3z+vtwgUi7j5jcyyxJRWAHpxC66Saf0liXAKnbhrGZmsd
         Jprw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PcjM0rk2Q0ONfxnjRQjlTdpr0TpLHUIKOuJVEi8p+uU=;
        b=BdtzRdagpNUCNSjitdnt4fxePlKLOg0IlrpVkndI3lwZGQrLU61Og6DhVR/hYMi/xc
         ISyZPxntcg9NPlu0twBAzEghYHRv/buVA4OwKLSwSk6r3NAt4lVY4hX5wJLjRBfkCySp
         0RTTLFdiW6zMbdBX19kd10RrtuMBHPSltDQztGSAk2Gst86XBLRnqvReKdDVmH/8A/KS
         PhhFlhGbbGDaE8gu3zFxwxVisZJ2dzl1nnRA28WGZXxpvNDYaaZ0o8iUcM1QQgMl2lwP
         Ifuds4G73S+rQQO9m3T2/nWlkUONJw2WhLLGd6K8fGet7KljO8KKxDh3zxcpYF3LyNlf
         Q8eQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcjM0rk2Q0ONfxnjRQjlTdpr0TpLHUIKOuJVEi8p+uU=;
        b=hD3ysPsYkp71SvwM9jqFMwwoTssvprGqzgji7YqukiS1KM6Ixd5/sIQZINLmFjOcv2
         5Fv9w2aKe6d/UVEdLririYUp5gkG0CLSloSI3pBv/r8+22MbN9QMJQbbd9sic3Otvw39
         gxEYg791qgfnH92z7V16qRZdMb3f8ZvVTiczoNZAPioYGuUMJ7a2mGJpDXJQg08uRAUW
         5gpO61eMmavOrRErQTTZHDMTkudhjBpAfgm0FpaN3EAjEoMXkgvh3HiDeRCTyc7zb7/P
         F0NK7/XVTnetbM2MTm3ilbkR+jLpQqyXABjPpmMlzHUjZBuKzqXTqrxZFQRZKec2wHAA
         zqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcjM0rk2Q0ONfxnjRQjlTdpr0TpLHUIKOuJVEi8p+uU=;
        b=jZ05zPFRVHoZ9TwGvIDegsRzleOwJqtEQIwQK0PWYsgyPd+8gPpRMW7Rasitt9LBTl
         Qxa+M6PW+JPLa7jmHmWio/PrCrE+2ys76vaqbGFu82uD45wl/bqSNLwFpqZkIwCN5p1Q
         XdtRfHfsxQ8CfYCIAI6VMyRKum0l3LZgKswb2yyN8uCYdNCNWycF/OEY3fYlesn37osP
         SU/HR/9o4Fn6qjq3IBbfKBGri+CeGoTqKFn3PPzBezJj5s5Qb/yS0gE2HpIrXO4BfIa4
         qBdVF2APRtdGasMXASxC1WdKvvNdOKT5kkEM0bsH4br03cyLAIMiy3rSFR8bqxiRWBND
         NU6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxEfgw5Z58E/7L9+7aYVdmQ47hfwQFUsv1O6Hqi7vMtVmcroLC/
	aDVb4L1JItr8OQ3xXIYsisI=
X-Google-Smtp-Source: ACHHUZ4lJcpsiNAo+VacY8bfkCNQhdMvFfz+dlQCYDx11jTQNmiSrnGFuj/5Kb1Ynql6jXnToCtgng==
X-Received: by 2002:adf:f007:0:b0:2f9:20f9:1a3b with SMTP id j7-20020adff007000000b002f920f91a3bmr441392wro.7.1684528855223;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:601b:b0:3f4:24e9:c5 with SMTP id
 az27-20020a05600c601b00b003f424e900c5ls1652059wmb.0.-pod-prod-03-eu; Fri, 19
 May 2023 13:40:53 -0700 (PDT)
X-Received: by 2002:adf:fe83:0:b0:306:3021:2304 with SMTP id l3-20020adffe83000000b0030630212304mr2289625wrr.60.1684528853466;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528853; cv=none;
        d=google.com; s=arc-20160816;
        b=crQbxx39TrCvNx/NEzEqmk38CPMKY7TxUW9x/9HPLjaKBJeoFtd8Q/yp0g2fQmoQn8
         c7XejJN0/wkUT3kyIidt0J7zyeINwJ3RC4qSXQbE8PraDfKjIXtSVSXKZhgKBlEu1gyr
         b/TbkhagfMV466IVH+mrTK0Ds81Z9xukm/AozBCq4XVpPOTsuFLGNWcDtjR2QBR7kGzc
         rmaNpJF2lZDjAbp9lbH72BD/ey0NesQXoKhqXET7LIyRkZu+xbPrLduQXahgaRrsPDtm
         B4u0kdXPaisOJOhCSDltAboZiIe1xYVrxM84SksvnTW3af317VxNmP5x00OKY+n2V+kK
         S0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=8RY27fJav3X7iiUwvYiCNAyfgnIrJv1drwCd7we7tX0=;
        b=kM4mtl1qt5DfQPUgsDLk+yOYjsDBK3LRcj+HhuY8+ND18n5w/0psg2BH8WPwO6nxXd
         ExyzZoFwbwGHxQtIszvPU7sxW7jlPq5OyOk9WepISzrWUvCfnMHPzgZZmA+xnX+F3BUM
         Ud+V4tRMn4K4zZ+d0h5OgnU6UDSZSyn5OFB3rIUdYd1/qN8DXdSpMw+3HcIuVDiNTjlh
         luCZItxFWowiTRmY+HexbXsLIotpeJblsnY7fR5sniCxQWT65abqQUN1Ln1JbvejaJNI
         uJd2wUl7FxEniqhSKEVkaoQbxMjdsVSbspjh7622gVg9Mid2YRMVp9CrrwPLMfLYMfo3
         y7HQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id n15-20020a056000170f00b003093594b640si143wrc.3.2023.05.19.13.40.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdc6VCRzxxV;
	Fri, 19 May 2023 22:40:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Konrad Schwarz <konrad.schwarz@gmail.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 40/73] core: riscv: implement paging structures
Date: Fri, 19 May 2023 22:40:00 +0200
Message-Id: <20230519204033.643200-41-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_BODY_WEBMAIL 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_NEGATE 0, __FRAUD_WEBMAIL 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 hypervisor/arch/riscv/paging.c        | 261 +++++++++++++++++++++++++-
 hypervisor/include/jailhouse/paging.h |   2 +-
 2 files changed, 259 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/paging.c b/hypervisor/arch/riscv/paging.c
index 294ea958..e6d32246 100644
--- a/hypervisor/arch/riscv/paging.c
+++ b/hypervisor/arch/riscv/paging.c
@@ -2,22 +2,277 @@
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-41-ralf.ramsauer%40oth-regensburg.de.
