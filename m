Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV55T6RQMGQEMJFQESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 720BC70A0DC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:56 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 5b1f17b1804b1-3f42b36733asf13573365e9.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528856; cv=pass;
        d=google.com; s=arc-20160816;
        b=z96aJAmreTSr1nJQy9K3AZ0yMgAFRaypMJ/23ftHMxNaHxaDD8XQsWFkjfDGlmV7za
         4TMChGy6rSruV9Rp5F8R2LQ38bSDPDK3tdxfSph5EthLPvRHKDJQ0+BdmsubyvUk5uLG
         50tl9m1BiL+v2Z69L1zBM+0DKNurpTtYX4L5N9blOev+t64pDNDRQ/j2wTGSsRDA18IV
         r+hQwYkb7PHdFMbQGImDHkfQ0hcRov6wjENxr3g4qrYHGct4rd0BZujpN7AJqxd87XMw
         rmFMnkcTOGb185KWlhj3m7+9biaspN4BxZuQQPUBSI4LmKWz+K/MA/wwcaCmBylK1Oqz
         6pzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=RI/5DmgVOY/aWt8Mrj5aVBCFvxu63M/FmtW8SXax5Ws=;
        b=sxO0fEE8LQd6HLT8lGFZyc4e5vzzQu86sz93znM1KObv4XQKLR9IJzR6LCyKtDWwCL
         9JvWAlbm+rEHy4HYmQVzcBHxPavZRQCQt/loKTut+MMlTqrdKM5EdB5XASZDGG1HXpjL
         DXKhgQDIH4xtoR/hFC2U0PNsYPrJlYZTp3VV90t1CnSp9FN+RS9CeGHbR92HHmlEAT6V
         S/Yp6XHHhmTRTIUDRXtK6OzkR+St9KkgEG+SoYW7q7jufiLuI9OoZqNpQkd8wiemgFyf
         phDxFdT3xuSQVg4VIxisAj1Vrwr3J9LHUKpYag2zxMPL4VnDOaaqDk4JUHh50gyjOsrA
         1B5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RI/5DmgVOY/aWt8Mrj5aVBCFvxu63M/FmtW8SXax5Ws=;
        b=pcFYCvPa+wqmf6Qcn9tl+B3QUzy+Nny4JcYin57CFG27NM9PwUa1BdqvBAolYKjEoT
         lAT2QF+QZnyKhxVLO8wyeNY21/K6Fx3dFIUb0gN3juscGCH9RUn+ja3+rUJK/Y9zWQVk
         Z3LmIqZp0xBvPxCq/t1IMhBqFgjR3xsNu7q4wc42+MacsObrfkffXVQFNs9mxtRBilVg
         qQ6drnwMEWzApUD3DxRVFMAQ3PT3PAULUNFkdjq9zY21gX203Q/JcrNX6jr3UPpJOHcI
         Lat9xkCVY2I4tppsJR9l2omIFExsEInqKaDAnGEh1AICzLZ/I9hJNtFShJV9834yDzp/
         Mh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI/5DmgVOY/aWt8Mrj5aVBCFvxu63M/FmtW8SXax5Ws=;
        b=awyki7ZxpI5ZE31KrIxSPIbJl25UadoiJg4Ngce0Mj4tpfvwGpMqb/3j0Cw/Gcvljo
         Xk6zjCUPzCUFWn2nZWu0uCfqL1dqAYq3CyZmzeXwWatD9juZEqzFFRFFaa7WfELFufBe
         e2Xl7odI1MSz4trwMbn0ztHP4PGpm8rbgsFCFqwXY1dVLiIE8/H/VeUPZGHLH9x0fxmQ
         phdoYkYRpmd20MN0DCWmvkpkE0q+E79MZIXftPAcoJF46jWzXQhUjAcxGJwliyzbjqGC
         obCIURCWUxygoHt3NPbOIEpXNwIfQo1hUvAilqcnnuLkT9BQ1V2yY6WlUbd2/sqWi1Iy
         RGgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwinEp34IXbyh309BMHfI04j3NqDGLy8ype8i3weTCTYTbXEzgt
	p0ImHFfyFP0AKgFUBU49tZ8=
X-Google-Smtp-Source: ACHHUZ6lKG0IonnrVHUxKRZcQColnTd0q/GKcgGIULHI/Y5oNvpiCsJD48LgwY/cCbSXeiBzZjTtMQ==
X-Received: by 2002:adf:dcca:0:b0:309:4424:9ce with SMTP id x10-20020adfdcca000000b00309442409cemr425190wrm.5.1684528855729;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:602:b0:306:3b67:c22c with SMTP id
 bn2-20020a056000060200b003063b67c22cls521904wrb.1.-pod-prod-08-eu; Fri, 19
 May 2023 13:40:54 -0700 (PDT)
X-Received: by 2002:a05:6000:1209:b0:2ef:bada:2f25 with SMTP id e9-20020a056000120900b002efbada2f25mr1953238wrx.67.1684528853930;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528853; cv=none;
        d=google.com; s=arc-20160816;
        b=kuzhpM7OZ+5s2cCHPtnZCVUXzay0W5+T0sdB9Az90naCNff07A1mMpKthJDsF/x/3u
         /QSPvvTZO9lj+ycMN/pX8jgZeIer5JVBqusXAsvdE34KfF4hGVqkj7kYJQs5eMxt8ei9
         OTLvxKrE26LBlmCYmkJ3AkbVfhbLG78doZOJhtrW9CWpAtIrDZPkOJdsoglk/o+IvOVs
         XUOZf7fMhEv0YU1Um7iKADgefF8G88bFuHWLhZ2hKCpPSZZCDPoAYOvFHTNrt9Jv4aUP
         1u50FX1yfEIPuqdGGmkDQM/1Ap9SxqI+V9Nc5+kd7DvOdWT0KxKJZ7nZYf9aehW3FP24
         8Nkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Yzvm1k3+7xwtXXc4N0qkalPFp2vT4MEyrhkRzLZCmuY=;
        b=sdNvRtxilRqyF3B/yP4EMwrnatKeJhmmvYwaYQhX4JaDvG6QeUTkMnd3RqoL281nyM
         H/3YFCBwCfwJJPF5uUCgeGltstslJtq/odnvdqUBAYJeelvAZ2zQnw7ou901bUFKZj/2
         Y/ZG2LWRQJUPkUWU0qc5VUnZZb0V1bFVZJKcB/rPHQhssfsN/DIIn6Md4EYXKbLLea4T
         RDKzwhFfTeeYTHDWhGkw+5QSq5wx6GBzlt3NqhjhWBfMX3bBTyrZ2jtoT9a5BPcQlmrF
         fA3Z+zYIW+5O1b89aCU6uerkCLhkqCBq+lOUV5dNJHxWZjfu3V9xehWpCd8SpOrMPzWE
         ZW+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id co6-20020a0560000a0600b003062765f97esi377393wrb.6.2023.05.19.13.40.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdd3r9dzxpk;
	Fri, 19 May 2023 22:40:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 42/73] core: riscv: Add spinlock primitives
Date: Fri, 19 May 2023 22:40:02 +0200
Message-Id: <20230519204033.643200-43-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
 __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-43-ralf.ramsauer%40oth-regensburg.de.
