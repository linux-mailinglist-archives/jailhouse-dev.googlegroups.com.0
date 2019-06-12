Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVEXQXUAKGQE6YCJQ6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 752EA42F6E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:00:37 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id g2sf1261315wrq.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:00:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560366037; cv=pass;
        d=google.com; s=arc-20160816;
        b=k81vPdKPIi0tYvaO6CPTjVJdRKOah1VfUi3EGhlblUyzHRthA3ap1KzUgArtjdw3wL
         h/fliNtVagJZLd42MUs46sRDkgw59tr/01uYpxkmjXwdTh1bRJViFWoE6K7DjR/EFo6b
         h6BPZvITP1m0t054aS6dBlmBgIdC6TA2WgRif1+yivWt0ejAqW0xnq1HfF9xk3jofnjT
         jeHnLaY80LYp/yto3xpwsP+0eyXxKa+nH3rM7siJGZadrmFroeEX9i7hdrYZEhsz/XtT
         Im8h73ad4uyUsU59UvC0WC66WZtdahiaHXVQR1STa4UJQkCrMgYulD8HrSYYiMsLfkjF
         LycA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=6MslTtMP/4A857u6tWHrMBxOnkGFNnejlyLjmWen/Mg=;
        b=Sg/YiwSO4YP+JpTsp3OBkbH2DjfEKz9l2sGVjpvy5hSfYNMEKU4ElU/CjmseBezbMo
         dFeTvfLR3W+JGzPzv2VrAS54dvOAzPJbgIVFnSLaDoiRDWMdiELl9kMadP3BbvM34C6L
         mQsyZn9ChEx6IKQdlKsr/41iiFKpvsCuqgc4QTE0b0CM6lkUdCtrNMLy8yRuj68Pmhdn
         C+THQOhm+rhXoFc+Jdq5fjuGzGNDfDT4ed4iEFQmk/Ttq9ZgyF0qoE94gCTsnybdbI25
         we3YsgkKsxQ5ZkW2nevEmp7xN/n/zxDLjIjd1tcX7j62fcOfz8ToLSFxTTqoyNkcqpLJ
         /hdg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6MslTtMP/4A857u6tWHrMBxOnkGFNnejlyLjmWen/Mg=;
        b=g5P1lactvQRc6cVeSrlLGddzs0Dm1kNo5MfjfSxH20o9EmPtA0T7Kp55XrJNth1vhk
         ogKWslMCdwJnhmA4GNlJmlI4+EKmOJR9aMEqVp3g50MOxEl7YfSdxTFH7O3CNzi1t782
         3rJMSM5oXkCvz/rm7Gu73TtqwDH7eMkUvw45X0vOknOpoj8JRAnNaI5J6KA3PtJPPyJL
         ZoWU99ZGbpzgMWrLiTy3gyUFMROAh4pf6CxE/CF5yMQ7SuM9+5qlEONYTqu8Kgntiz12
         jyIKNKRWeF3IAwfcqEdcA66I2qcFhQtlzcqqhwZxxqlre/rFdChkPps6jcWOWUSIALAK
         fsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6MslTtMP/4A857u6tWHrMBxOnkGFNnejlyLjmWen/Mg=;
        b=P6cvyvGQRrRAb5aznDd3rfL5+Jvp7g6NpNqXF1/D28UrcYVoPyZu4F94t/LiLER0Os
         3aX3DX5kNK3ij6qTnBywh1v+iO4WhB7VmGV3VIi+TtA9JT9xcNy7Rxgby5n1sFTM8Tt2
         4AmxgN/5aYWwYY0WsyciIKqDJDPgNI+j9S1r7oApJXOMTGHJqSccuJ+0DvhRd5Kn4YYE
         QhKyj76jvddkZurMlK9YiKc2+pw/MfMmZiEEvrP7Wvq6SOMFMiox6jCl/BGl39nOD1l4
         U+3HgTUVHN3nlJe/5CICIVOC76J9cPTgwghZaPTqFGg3BDXApcoiFyht1Hh0TZjYOHIF
         d6tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWl4kT/6zmGykNyYWSfbEsRg+mo+eh31TR9p4EQXVuGfyErHDBI
	cWFUcJ2tnpBevhg/9g/z7Jc=
X-Google-Smtp-Source: APXvYqye57JZW7+vfZZfzhbMzqlMcXtTdjakI74Miukx8DircMFBWm/cVm8bbOnpcYNTQxDQ1crK2Q==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr511314wmb.112.1560366037179;
        Wed, 12 Jun 2019 12:00:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d11:: with SMTP id t17ls995551wmt.0.gmail; Wed, 12 Jun
 2019 12:00:36 -0700 (PDT)
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr470771wmk.5.1560366036345;
        Wed, 12 Jun 2019 12:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560366036; cv=none;
        d=google.com; s=arc-20160816;
        b=oltnlhxE32qGacHs95z8axUD6ve039RpijAOa1OaoAruShu4xG23JeZ3cBFfrFrfhm
         TDhx3PJ2mzlhllVSf7xVTJicIJ0YfiEeXEM8REkPiCn0sG9Op2dQ2STe+O+VyQCriG5E
         c1fjqasq8Zk8pb8MJW6qr5L3VF13EtNSRBBGuGePQ19pA4SXMUAfqk4CsSzWA9mmAJVL
         eYtqsJAcVhfSmvIx4prKxizPeZO2ZTwEgV9KIe8BSrm2tuk6OnYqrvZwJ4Dwp1OWlvB/
         ssBLIy6uZOPGmWwnOFbFrH90I7LFqkBdCAhoXYfhMKmVSsvK9BITmrkJe5KVsmIn7ksN
         +RaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=aK7Kl436sOW74CawDfQIYcbHaBAeu5VzYCW+Z9/WLgI=;
        b=wz57Oqbdhav5JjTlXAMkGjOBCXQYrJkpUC/LbKeWzgubeORUFtXJ8mQZ2ABRFotK11
         WjtSyi2kqtJNuiomJ2niE/heeS5xzhOpIgDcvYaMkaWcrZrLxuT5pc+W1PWNn69G+BHh
         IWttoKDH40bWK4e6VIr1NziIxmgHrkwSIzGrq0lUpUgRv66eI7bEEoGgjjsrD/2Y1SYd
         BblSILYbPxQ/fYCmDi8DcngnoiK4/WD61lLYVmgF35Hn3T5XEX55BkZThvWSEPNlmhpQ
         I2SQ248Gfk8JlE+QsqfVrvc1+2NcE3WPFSJbZy4s5gVUV/xEB0zeTZnhyeVUn7UWj0f/
         KggQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j18si32885wrc.1.2019.06.12.12.00.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45PGR75ZsBzy93;
	Wed, 12 Jun 2019 21:00:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jan.kiszka@siemens.com,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] x86: mmio: fix preserve mask for instructions with zero-extend
Date: Wed, 12 Jun 2019 21:00:35 +0200
Message-Id: <20190612190035.16171-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.185116, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

movzx is a move with zero-extend. This means, it will either move 1 or 2 byte,
and zeroes the rest of the register. The definition of the rest of the
register depends on the operand size override prefix:

  - If OP SZ is not set, always zero the whole register, independent of rex_w.
    This mean all bits can be zeroed if the destination is eax or rax. No need
    to set the preserve mask

  - OP SZ is only set if ax is used. This is the only remaining case.

    The preserve mask then depends on the width of the access. In case of B,
    zero bits 8-15, and preserve 16-63. In case of W, zero nothing, but
    preserve 16-63.

Once this pattern is clear, the fix in the hypervisor is straight forward.

Amend existing and add new test cases that test correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

I'm starting to get frustrated with x86. I thought I catched all
relevant cases, but x86 provides enough complexity for a bunch of corner
cases...

 hypervisor/arch/x86/mmio.c         | 11 ++++-
 inmates/tests/x86/mmio-access-32.c | 24 +++++++----
 inmates/tests/x86/mmio-access.c    | 67 ++++++++++++++++++++++++------
 3 files changed, 80 insertions(+), 22 deletions(-)

diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index 124f9966..76d70053 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -55,6 +55,7 @@ struct parse_context {
 	bool has_rex_r;
 	bool has_addrsz_prefix;
 	bool has_opsz_prefix;
+	bool zero_extend;
 };
 
 static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
@@ -144,6 +145,7 @@ restart:
 		ctx.has_opsz_prefix = true;
 		goto restart;
 	case X86_OP_MOVZX_OPC1:
+		ctx.zero_extend = true;
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
 			goto error_noinst;
 		op[1].raw = *ctx.inst;
@@ -191,8 +193,13 @@ restart:
 
 	op[2].raw = *ctx.inst;
 
-	if (!ctx.does_write && inst.access_size < 4)
-		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
+	if (!ctx.does_write) {
+		if(!ctx.zero_extend && inst.access_size < 4)
+			inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
+		else if (ctx.zero_extend && ctx.has_opsz_prefix)
+			inst.reg_preserve_mask =
+				~BYTE_MASK(inst.access_size ^ 0x3);
+	}
 
 	/* ensure that we are actually talking about mov imm,<mem> */
 	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index db743410..756d3947 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -64,15 +64,23 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg32,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
-	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
-	asm volatile("movzxb (%%ebx), %%eax"
-		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u8)pattern);
+	/* MOVZXB (0f b6), 8-bit data, 32-bit address, zero extend bits 8-31 */
+	asm volatile("movzxb (%%eax), %%eax"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32, pattern & 0xff);
 
-	/* MOVZXW (0f b7) */
-	asm volatile("movzxw (%%ebx), %%eax"
-		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u16)pattern);
+	/* MOVZXB (0f b6), 8-bit data, 32-bit address, zero extend bits 8-16,
+	 * operand size prefix */
+	asm volatile("movzxb (%%eax), %%ax"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32,
+		     ((unsigned long)mmio_reg & ~0xffff) | (pattern & 0xff));
+
+	/* MOVZXW (67 0f b7), 16-bit data, 32-bit address, zero extend bits 16-31,
+	 * AD SZ prefix */
+	asm volatile("movzxw (%%eax), %%eax"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32, pattern & 0xffff);
 
 	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
 	asm volatile("mov (0x101ff8), %%eax"
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index a17455b0..18eab3a5 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -84,20 +84,63 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg64,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
-	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
-	asm volatile("movzxb (%%rbx), %%rax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	/* MOVZXB (48 0f b6), to 64-bit, mod=0, reg=0, rm=3 */
+	asm volatile("movzxb (%%rax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
 
-	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
-	asm volatile("movzxb (%%ebx), %%eax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	/* MOVZXB (0f b6), to 32-bit, clear bits 31-63 */
+	asm volatile("movzxb (%%rax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
 
-	/* MOVZXW (0f b7) */
-	asm volatile("movzxw (%%rbx), %%rax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u16)pattern);
+	/* MOVZXB (66 0f b6), to 32-bit, clear bits 8-16, keep 17-73,
+	 * operand size prefix */
+	asm volatile("movzxb (%%rax), %%ax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
+
+	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
+	 * AD SZ override prefix */
+	asm volatile("movzxb (%%eax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
+	 * AD SZ override prefix */
+	asm volatile("movzxb (%%eax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-16, keep 17-73,
+	 * 32-bit address, AD SZ override prefix, OP SZ override prefix */
+	asm volatile("movzxb (%%eax), %%ax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
+
+	/* MOVZXW (48 0f b7), 16-bit data, clear bits 16-63, 64-bit address */
+	asm volatile("movzxw (%%rax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (0f b7), 16-bit data, clear bits 16-63, 64-bit address */
+	asm volatile("movzxw (%%rax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (67 48 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
+	 * AD SZ prefix */
+	asm volatile("movzxw (%%eax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (67 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
+	 * AD SZ prefix */
+	asm volatile("movzxw (%%eax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
 
 	/* MEM_TO_AX (a1), 64-bit data, 64-bit address */
 	asm volatile("movabs (0x101ff8), %%rax"
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612190035.16171-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
