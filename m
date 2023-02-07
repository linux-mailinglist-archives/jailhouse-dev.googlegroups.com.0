Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXEGRGPQMGQEFILWICI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9B68D673
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:05 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id w10-20020a5d544a000000b002c3de7a10b0sf1120595wrv.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772765; cv=pass;
        d=google.com; s=arc-20160816;
        b=CMEeytFJXQJimxqW5OuJc76OyfSEtYoD9i92I8sMVNSD2gi/KRd//QWoVPuts5eSeJ
         BZXn9AeJ1HQAp64c/d4iCTyVyJTH1GlQXhX19MUNnO5V0jQmmx7hCKlWZl8jshwjyuRp
         6Gdtysz2JYM7z/AcQhgFWENciDvoa3aD/wmwhW/NYdfPJ2KJnB/WkwpMSfFReo5Kizqn
         0RKWUJJCWQ2QOcZucRmdmAQWaivL+rIHRChdUpZTLG/E8sFxjape7L7XXMg437P1x0pA
         uOabyuie8OWDHY3xBvLrlokGbjRYNWzMva4qWkVGwghZm7nbGy6nDKwrnNFGzsWGsv3B
         Li3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ia2ZcSB7OKlOhJ5aNvvU/6Yhnq9+EwVueqF3vUVDtoU=;
        b=a/lhVN8m+TEftIU6UNeOQGDSfSW3+WfaVdjKyU7sA8gUmsC43Qat78Oi7feRhE1bWJ
         mXyzXYOPwTxsD6RB71JON2GzU0IF4BICCPl4VTjN+zy9rwL2Kz0eeLbFi0VwlMsEGppL
         zh5742urpNduaMGAAgWxW5eJ2GXyFKRIuYpEewq922EJnYrdZhj9zhkp0IXd2r7vbhei
         Yl6FthwCFWVhHlFqJCU0zxqrmukAi9gXEXN4elOTYbLe/AJGJB7Aw1L5TIQinmUFUVDg
         hV8vEBoS1pNaaulnRevGD96qvLB1yrOHL5Sq+YDNhgBuL17CgzD+Mi8kobmXVuTmIKcz
         w6Zg==
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
        bh=ia2ZcSB7OKlOhJ5aNvvU/6Yhnq9+EwVueqF3vUVDtoU=;
        b=rHPR1GA8kIbYyluG8bXlfh5uAT1cibtcn1gPP/mmp5WWC0H0QVFR654aPK0qd8G/bb
         Gn9y24q8D5GIfEQF1Q9LO6bjFRjZx+za7glA4eCEO92eLW2wDejMU5IThHZ40VCgejSJ
         QaD8tRaUfQOnU7XaT50uqcU92D1Prn0wJFSiPFQ3jLQupdDtevhveTQFBNMk+s+Bv2VH
         o9hRoG0KQSuSWGN+w1MCfifS9cahdi/NG2g/a9Mp9tECxzwzYTi5GGPX83yEYJu+SHsd
         cZ7qv/ozGGY8n25miRn/ChL9VrPQhqn4fXVCmlxMz6B4DuePS0xetwRwvwA1G106GeCh
         qEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ia2ZcSB7OKlOhJ5aNvvU/6Yhnq9+EwVueqF3vUVDtoU=;
        b=2W4lJ0l+gBUnHrjHGGLC8zWUDtiVkBLtthmVGvnEHnSvnwF9WAWJ0BkImh5tDDKrzU
         vWbt7xuCk/6ewpU/5+U1QS4BngS7xUuaSjt9miR51PRIS2UuH7gENYOBWytZcDQiQU74
         u4x6OrvpOd00vyLruChFOTOjLdSRAQD0Mee73JWZ8f0BFckSFVAkdql9xda6jOLRNqCg
         yaXAXsWj03NZIWlbE8FqiA4lgpUmOl/1NRdTBWJgT7t5mU8Rn4aJC8Jep0k9nsG6uJ8k
         9fYWcTpD2/FWFuseuNMnvfVLngGNBHOtyAo6U+/o88eQEoR3FfHsvU6qJ+bjhRLXOP7v
         LueA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUbvcgEM9xsBYLQxKdj6vleTBRuM9hI2uQjj15jLq95eN1YjK0+
	FD98J8XW4z5khl4nIeF/h1hWUw==
X-Google-Smtp-Source: AK7set/X6qAQMNj1pBtY8gyj2ji1xor46KRT3NnNVFantfeRD/4Tf0nnsP+C5dMjH/zbfEn56Gk26w==
X-Received: by 2002:a05:600c:4395:b0:3db:52b:8ffb with SMTP id e21-20020a05600c439500b003db052b8ffbmr1028678wmn.14.1675772765216;
        Tue, 07 Feb 2023 04:26:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c17:b0:3dc:5300:3d83 with SMTP id
 j23-20020a05600c1c1700b003dc53003d83ls8190302wms.0.-pod-control-gmail; Tue,
 07 Feb 2023 04:26:03 -0800 (PST)
X-Received: by 2002:a05:600c:4d21:b0:3de:e447:8025 with SMTP id u33-20020a05600c4d2100b003dee4478025mr2888944wmp.21.1675772763552;
        Tue, 07 Feb 2023 04:26:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772763; cv=none;
        d=google.com; s=arc-20160816;
        b=lgw+MYl1BtGRGeVKCBypCV4kWUo8MP+Pj2imSfZlCWfrLREE1zbwjdSyd2S/4QCIkb
         QAwhX78fUIznIHGcl5UYylijqZ+2va2z/tXWJ1cthglDvUnr6iK+uusj6U1HAzibkdo4
         hiISs3we4bIPE0JgCxYlypVPL7upXTO3DIKJ0XpSWdnJ4EHHTo1chH0SItaxHak9OpuP
         PcO+1jiMNGRv1Fx4FZjmFGsAZMA+oHDvvW9lWmEnakW/GNh98aT0CFoiV3JLox25CbIy
         /O9eZfqXRdAgk/tUDpfbxFEjXeebG9gwGWOqlI+tjW/ljpqI/H6NapuCA/54oNJnHulm
         kehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ZD+tAx10tPlP1Y+G9MWU16gJ4NiaSvhk6eh4OihJjnw=;
        b=mQfvXzXPT+CRdbnIUiI8f66LhTzWLtU7d+bQ8ZSNhqd7xiLpR+i9MVHgzsKlcabOh2
         T1TQqVAAgjsJRSn3XDkOf+KdfmLJa+mpIcWT8fmpUznEGrhJtoM9V82rB1rVBUCbYCmP
         n3MM1kwUbYemO2/fCFoLIBFYbdu019c0ve9leoKmHQMQkWEuCurbKJyRmsR3bAjLXI1V
         ltwoDXtk8NPoxH0qnibuoFouXahaN4tjBrtv5qGWl4snGu1dS3onwhqPTBK+91Wwvg4f
         jGBPTPr9s08PIABfzjs2psIpBA91r3JTBVMZE2hmH5lvfs3DMF9JYOGk5n52/7T7dH0M
         R3tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id l18-20020a05600c1d1200b003dd1c15e7ffsi588412wms.2.2023.02.07.04.26.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RG3QlKzyLG;
	Tue,  7 Feb 2023 13:26:02 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 04/47] core: riscv: define MMIO accessors
Date: Tue,  7 Feb 2023 13:25:00 +0100
Message-Id: <20230207122543.1128638-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

GCC may emit 4x 1 Byte reads in case of our regular mmio_read32
accessor, when used in combination with -Os. Yes, I've seen it.

Define safe handlers to overcome this issue.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/mmio.h | 67 ++++++++++++++++++++++++
 hypervisor/include/jailhouse/mmio.h      |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/hypervisor/arch/riscv/include/asm/mmio.h b/hypervisor/arch/riscv/include/asm/mmio.h
index e69de29b..e19d0cec 100644
--- a/hypervisor/arch/riscv/include/asm/mmio.h
+++ b/hypervisor/arch/riscv/include/asm/mmio.h
@@ -0,0 +1,67 @@
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
+/*
+ * We need those definitions, as I saw the compiler emitting 4x 1B loads in
+ * case of mmio_read32.
+ */
+
+#define DEFINE_MMIO_READ
+#define DEFINE_MMIO_WRITE
+
+static inline void mmio_write8(volatile void *addr, u8 val)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write16(volatile void *addr, u16 val)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write32(volatile void *addr, u32 val)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write64(volatile void *addr, u64 val)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline u8 mmio_read8(const volatile void *addr)
+{
+	u8 val;
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u16 mmio_read16(const volatile void *addr)
+{
+	u16 val;
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u32 mmio_read32(const volatile void *addr)
+{
+	u32 val;
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u64 mmio_read64(const volatile void *addr)
+{
+	u64 val;
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jailhouse/mmio.h
index aa85a089..f5ace9e9 100644
--- a/hypervisor/include/jailhouse/mmio.h
+++ b/hypervisor/include/jailhouse/mmio.h
@@ -32,6 +32,7 @@ struct cell;
  * Define MMIO read accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_READ
 #define DEFINE_MMIO_READ(size)						\
 static inline u##size mmio_read##size(void *address)			\
 {									\
@@ -49,12 +50,14 @@ DEFINE_MMIO_READ(8)
 DEFINE_MMIO_READ(16)
 DEFINE_MMIO_READ(32)
 DEFINE_MMIO_READ(64)
+#endif
 /** @} */
 
 /**
  * Define MMIO write accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_WRITE
 #define DEFINE_MMIO_WRITE(size)						\
 static inline void mmio_write##size(void *address, u##size value)	\
 {									\
@@ -71,6 +74,7 @@ DEFINE_MMIO_WRITE(8)
 DEFINE_MMIO_WRITE(16)
 DEFINE_MMIO_WRITE(32)
 DEFINE_MMIO_WRITE(64)
+#endif
 /** @} */
 
 /**
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-5-ralf.ramsauer%40oth-regensburg.de.
