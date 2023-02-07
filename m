Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZEGRGPQMGQEIAW22EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EECF68D686
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:13 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id d14-20020a05600c34ce00b003dd07ce79c8sf8081414wmq.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772773; cv=pass;
        d=google.com; s=arc-20160816;
        b=FuW6ksRkvLtbVjYHjeCWGZ976qZdd7JtdfZ2hK2u4RJm0izQ5fQ7bP5A4Oe6OAxpS8
         scKJr8YjYDVQ46tyBsBq8I7HxDIR4xL1CQHCC9PzDMqDBzHebvhmhQEXzCA1Agz7Ct21
         LCD9tkUmphcphZG9yQpnvyNmAgUGvJuL77YXjZvg6uKNxUDgQVI/2B7D4GqiduPs1IP7
         SwZD+k7lWmq4Fw7TFrhkJft6xFmW4jNQf/y0zp4s8NCDvzkNyPL68MMkR16eM/BXBHi9
         /nBCX+XcJn1aNv2+czE3nQj7Ds6JP7qfOqWH3n5Ghb9mo5l0jO/1GzSJEgyGz9lPwHsC
         EW9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DT1UlG4rO7wDk6mMmWPfKuJ6/wr7UzfEEsVPVSIbSM4=;
        b=ehQKw1zW58UJkAjs5NDEOD3LNg4Gwe4cmEu0xiqyM/suiz92BhEb8T5AZk+8C5UlBh
         Rsa39v5CD9dxkMMD+v7t8xpQ5Z+qoJB/qsozOQXchb8e4Tt9fLcaXtF6HE9ES23Td/t3
         KImLYTDXlV/Jt9A5pZFdCk6lUm9d4bkAD+9D64fs3SNIV5vmvWWkNhMaPfNRKQ8TnI4Y
         Ahx0OC9K6jUhpfhZ9SoSNtG65Faxuz1ifatPV+Ca1jFzrQGJDW8evNJeMHC8VTpQWK7U
         sd83UW81LE7d5CR1rblEGS2gsLmezysp54dSZyQFJWYvuHVqsm6LXgg89guYYdOnMlS3
         mJ4A==
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
        bh=DT1UlG4rO7wDk6mMmWPfKuJ6/wr7UzfEEsVPVSIbSM4=;
        b=ADG8cVt4zJxaI2L+KDTXaeoMGE/PoSR3IPq6gr0NfxA5cT45PL3qU+f0tQKsEX750H
         g7zYL/ppSgB1GFvKr+Tw/W8Wyz04YC87E6v0TEJ6IcsY1FZ9cHU54q6FXbiNRqy+CR5Y
         yitVi0h2T/ef5QTV/2RgQ0lkGHV3wJI+Yb6Ff851mjrSH+XXsJk6h9vk2d4//Y3mSkBm
         YUkABoCvwsSz39elVZgcyJiQ8GC+ixiKupa5fsY4lO/SeTnt7cTkFNaUzLzT5hqMd8xb
         IVuVwDBTzF8y98I3az3wMX3hXTLuCrQf4nUw3ewx7n6U6Kkie374fd+LchQYhrSPuncg
         OB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT1UlG4rO7wDk6mMmWPfKuJ6/wr7UzfEEsVPVSIbSM4=;
        b=EfSy53CbJC5Dgw5rR6iFxQW3+6BwlujrYPpS83NDKdb3me94l9edZwFVhekOW53KRF
         2PbNtVlhqbb/MKPmgI34QLiavCSLwO3BTBLesj1dpSj5NNDCE1uekHt468PXPKb5+Rkw
         M/5uu3FNNZSCpwemTYXwRhBbJFG9gqzUJ7zGRqMBHPC1mDuowCxLP82qpEeBUIV6bNdf
         mJtfmnphK+cbf+9fOF9YN/w2HTIvt2fFOxUnkjMH+mlbhZcysFmAcmYYiAZFbyFAM01A
         FWQ+3i6GVklfo6YBIEA9nQt2wH5QiM8DmV+hzyJeypE+vecdxvJJ7yxjglluu1jQIV9e
         vAjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUSplZf5TjMJ8VF0a7Hycwm2zTqtsIqp0KAw7+69VdPBFJb0s3x
	/gYgX6TGla1KayNx4Xxarho=
X-Google-Smtp-Source: AK7set/ibqTOMUtqPcHNn7ZFmnDlBvl4UJCPMAguPgUhwXdnxTbjQubnyO0LWBlutt3IqJgEELVrSA==
X-Received: by 2002:a7b:cc01:0:b0:3dd:e1f9:2506 with SMTP id f1-20020a7bcc01000000b003dde1f92506mr252315wmh.19.1675772773156;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5c05:0:b0:2be:34f5:ab03 with SMTP id cc5-20020a5d5c05000000b002be34f5ab03ls21050221wrb.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:11 -0800 (PST)
X-Received: by 2002:a05:6000:1f14:b0:2c3:ea68:c580 with SMTP id bv20-20020a0560001f1400b002c3ea68c580mr4304694wrb.11.1675772771495;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772771; cv=none;
        d=google.com; s=arc-20160816;
        b=OKVdZkHLkjW3wY2NR45X91ytCxjw65QFrg9oxn+cwAW4XlBagpK2QV9acVr+REgzVh
         iCvEIHIX3jOAbJKYbIW/ZAb65Eo3dUuu0kznhz/vVzxbjjlY5jKtrSvQh/9nFaoEU5vS
         dYIfJv0WWrESGpGw62TC2sFIa6s7oe9/kgWjENJ6Y6nDZXo0i6EPe8AMKVRu5gQVJOix
         hjyNlzFdm3so0uc6UBYbFUHh0mgrd2DMn272mffSCJ/jbCb/CELsjTrLIvpujiWAlG4w
         eJ/tEOyzqrDP5nuKYlAYDezY5NP5GV78OnS1jNNvIV8t0NAFJTA5pmD1LWcI2yIYLSrq
         IsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=kDFdPcbw+9Q6q7IjJ8pdu0V1yXkrrvr3y9C/EoVXzz4=;
        b=NAYmWBa5yElz63ifD9HhEAUV+5MST/BRo41QtNEXwAkBQvhlKXr+EgFFuHRYLg1THE
         0M1wTLC82mJn7/r647Yw4D/PkGTJQGLnUWUtQ0WyNUofJOi0Xn+IKbwjgW2yiSRIZDfL
         VPK9pOT9bfYi10zMeo7ES1t85D0lJKSI7zLM6td2cozsC+NiT/XbQSE1ON0u2/8pPHsS
         g6W5wWZjm1pAU7LpKhCCGwmGNToKFm5bMUz9axxZTQwSqU7gzNwUDtlZxjv+cdwTVBAD
         En7yIvP2A60ArrpkUzirBBb8mz5ujnvlNLtSZ7K5qWAmfdejLly6MTDPMNDDDE6mmiTT
         cVag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u2-20020adfeb42000000b002c08af7815fsi602947wrn.5.2023.02.07.04.26.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RR0PP0z1075;
	Tue,  7 Feb 2023 13:26:11 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 23/47] core: riscv: Add spinlock primitives
Date: Tue,  7 Feb 2023 13:25:19 +0100
Message-Id: <20230207122543.1128638-24-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: fix incorrect asm specifiers]
---
 hypervisor/arch/riscv/include/asm/spinlock.h | 52 +++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/spinlock.h b/hypervisor/arch/riscv/include/asm/spinlock.h
index a5e707d7..4ce2f282 100644
--- a/hypervisor/arch/riscv/include/asm/spinlock.h
+++ b/hypervisor/arch/riscv/include/asm/spinlock.h
@@ -4,7 +4,7 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,15 +13,63 @@
 #ifndef _JAILHOUSE_ASM_SPINLOCK_H
 #define _JAILHOUSE_ASM_SPINLOCK_H
 
+#define	RISCV_USE_LR_SC	1
+
 typedef struct {
+	int unsigned spin; /* has to have offset 0 */
 } spinlock_t;
 
-static inline void spin_lock(spinlock_t *lock)
+static inline void spin_init(spinlock_t *lock)
 {
+	lock->spin = 0;
 }
 
 static inline void spin_unlock(spinlock_t *lock)
 {
+	__asm__ ("\n\
+	.if	%[use_lr_sc]\n\
+	fence	rw, w\n\
+	sw	zero, %[spin]\n\
+	.else\n\
+	amoswap.w.rl	x0, x0, %[spin]\n\
+	.endif\n"
+	: [spin] "=&A" (lock->spin):
+	[use_lr_sc] "n" (RISCV_USE_LR_SC):
+	"memory");
+}
+
+static inline void spin_lock(spinlock_t *lock)
+{
+	/* test and test and set */
+	__asm__ ("\n\
+	.if	%[use_lr_sc]\n\
+\n\
+	la	t2, 1\n\
+\n\
+1:	lw	t1, %[spin]\n\
+	bnez	t1, 1b\n\
+\n\
+2:	lr.w.aq	t1, %[spin]\n\
+	bnez	t1, 1b\n\
+	sc.w	t1, t2, %[spin]\n\
+	bnez	t1, 1b\n\
+\n\
+	.else\n\
+\n\
+	# see figure 8.2 in the RISC-V Unprivileged ISA\n\
+	li	t2, 1\n\
+\n\
+3:	lw	t1, %[spin]\n\
+	bnez	t1, 3b\n\
+\n\
+	amoswap.w.aq	t1, t2, %[spin]\n\
+	bnez	t1, 3b\n\
+\n\
+	.endif\n\
+"	:
+	[spin] "=&A" (lock->spin):
+	[use_lr_sc] "n" (RISCV_USE_LR_SC):
+	"t1", "t2", "memory");
 }
 
 #endif /* !_JAILHOUSE_ASM_SPINLOCK_H */
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-24-ralf.ramsauer%40oth-regensburg.de.
