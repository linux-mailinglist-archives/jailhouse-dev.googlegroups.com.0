Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBKEG4TTQKGQECJA3UVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF39373DE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Jun 2019 14:12:24 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 20sf370416wma.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 05:12:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559823144; cv=pass;
        d=google.com; s=arc-20160816;
        b=w9t4qW5IGCuZ9/JEB7sTZE7MTC7oyA6IicHYB6Wq1AgecGDzCv9OextYwVNwageP+B
         rBAA4jkzBXfXnEK1OCS03j0oGoV5WAKZCGM1vvIvV7ltDEf5jFck30k2UQlu/wQspAp5
         Fd0vYErLYb4yLETv9ODWKWzdWtoF4c/MCx3Xw2ESc5w3dFtdfPt5f/nBtmNrLTkCTWNj
         hROoYK94T/HJP4h2oszoyAUh9ColEdAsJgITXwsLrsfVqgdP6C1G4f9h33f6j758MgYe
         6o9n8kDswKrOViiVyfiPsUYVLw16azBIx4PzGe8EMA5zhUbnMNfS3HvNlpFgPVKMx/UI
         PVyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=DQLvXk4uJIHNm4QXJ8h3VW7abooN3p6knCwFPLFX1xM=;
        b=KY6yL4TrC9kBaRaHgjO2XxensTPDEyrj2znqBNPnKXHlOMaCB0rZQQPZLwAhXh4vf/
         08i3enI+TR5Io/MTfv0L6g/6iXJm/JYYUSf1Dld+g8/LWcLQoT3/pZ+DxMZvhgnJVloI
         IENs7Wwv4GllcSKP2zNoxDAl+3II+va+GlY9mMwPgoO7GesJjNfQ/8AJv5/oPM4rwDEl
         THo/IOtHGLsJ5FH3z8VRLKeAJ0FZJJZgiSNnkG4B7+xHGSHpU1tVvZZuCz+AFDQ1+wtY
         kA36FPlqwch1LjBd7LB+WrboCdHPXrvAx9/QRoAv+cBCGfmwgZFPxzhPp+yhwIDVl1Hk
         0PZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DQLvXk4uJIHNm4QXJ8h3VW7abooN3p6knCwFPLFX1xM=;
        b=jjqsHU9e9Nzz1AFNILAxt+8J1mgDq8JlOfx9auQqZCd467sCGa4nRBGaNgEyalsVaE
         vk3f/8nEJpj/l5o9lxj3CYfeK667veCZgoqMN7tWOBWJufZFZ+FupxF+6wWl/uKsFnyz
         XiL3Uh/V3JZEBoIyBzVrpAYk9xcu4mQt3lkUjp/SjHBpSboj71aQ6HRaDm0NhwduaGNm
         z3WZg4bl6NjKrFKIu29pcqgZWBqqNyRtFDqQxbHqc34arziDA9HbcEuwH2b7tI5YI+p+
         60IXOiTUaSFixKHkGzbJ7sjVDeYre6F1rIkK9PVWz5PkioRqspEWIwW2KKgYPRu6HqXt
         hDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DQLvXk4uJIHNm4QXJ8h3VW7abooN3p6knCwFPLFX1xM=;
        b=tMamXodLMj8K5wbNBkYSDnVRG7fwYS8FooGJCC38I41EkS5K81Is/HFw57UUBKrxyQ
         Es3dtZ3I3fn0WfiiJnvxebAHGYN1397hUhwiuI5PY/73UQT+EkVEInadXiRhC7Jn3fGf
         +hPcVw8/13zLTy/t3KCr5UbXopIn0zlnaN5UfwRw97Z1K5vtYHaPvLvM8O4gp0oDiYaJ
         Vd2n1wSGaWH3iVM3d+tRMwnSZVaPI9KO5sA6gRUyUESxn+6eyE45FW7IPqtJqjDpjEEP
         l/WJEPsiqnxR2gRcSr2KOhHn4woi8lpWYbn4I1nEWhrBuYyazUIs0g8TZcAI1JuDwNKH
         Oz+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWetVCyusCCGcl+nkBayUbTHbhyMEAlFKI1iHjgmPI9spuPGKqW
	ujOfbdBXsML2GHO8sTp3rv0=
X-Google-Smtp-Source: APXvYqxuyTwx2cmygeu9zReRoEWbZaBg2SHF42wG20n3Z/8iiHIsfEhf5bY22tsOPpy5jAB2yRnxmg==
X-Received: by 2002:adf:dd91:: with SMTP id x17mr18220386wrl.291.1559823144493;
        Thu, 06 Jun 2019 05:12:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f404:: with SMTP id z4ls1658496wma.1.canary-gmail; Thu,
 06 Jun 2019 05:12:23 -0700 (PDT)
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr20085820wmg.164.1559823143786;
        Thu, 06 Jun 2019 05:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559823143; cv=none;
        d=google.com; s=arc-20160816;
        b=ipVOzTIgyXeK77Q3HPtdSLiWjL72oINdy1hRaiva4eQ8YUK8tlV3FQ6Fg5v9VwXG+C
         WFzZsrserHX5onmdIGS8bwyQDJzSc4Ng5eNJKT6kdXyk5KAl7nlaB3kQTEPHlyqhrB03
         sDsKPS97YixbXjALp8yqqwv8SGCBdlZD9KyZmvJUrSXyBGD8P/gJyvVivK16wppgygRd
         xWRDcrmChm0oRfmlhBY8Y46qD5zr1PxKYIpwYlBd2gUhMXS+lcHmz2SRw0Q9hsSgzqjQ
         27iCP9jQmdNQ1udfHRO/b4ElLdEhc6qr8Bx4GUyPMYufQ5WrzPuEzv/kSElT8z/O6YUI
         O0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=XslAmJDpP8q+plAh9dBoWBubjgFs+plJcpnMUHYAMMs=;
        b=MA5/5xECT8mLes0O6JkEY5SZkZsduHegNkWnN2lY8i4XM5LmNEvG5ng4BgxCh09ulh
         XEHKVeDma7jruDwpq2Nmtc0iSGNYYCmYgZOXAt5iIg6QDDJYoefLDbetNOs9Inv0PoXW
         2VcbreQ3e1I9G74FwxKOjqRjL75mXwCTMekM6TjTDf3HM7Vws65qIypQDFSHq/xiJYvw
         k290gZlT23qZmLvV+SeUbjbpKO8JOZduMZi4nVhXN/HoR227U2Scaz3Q93XKcvcrW9J2
         GfpbMPkO09jbF2234b0KkOLJ1koeqsAhmotMc6kWRkte2wP4I/DgE/PJ8wMOT/NpoNYJ
         RKaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j1si92731wme.3.2019.06.06.05.12.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 05:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45KPft5SPDzy6p;
	Thu,  6 Jun 2019 14:12:22 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jan.kiszka@siemens.com,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2] x86: mmio: fix accidental clears of bits in registers
Date: Thu,  6 Jun 2019 14:12:22 +0200
Message-Id: <20190606121222.15251-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.6.120017, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.6.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

We trap certain MMIO accesses and need to emulate their access.

On x86, a 32-bit read will clear bits 32-63 of a register.

Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
Jailhouse erroneously cleared those bits. Prevent this by applying a
preserved mask that keeps bits alive.

Add tests that check correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/mmio.h |  5 +++++
 hypervisor/arch/x86/mmio.c             |  5 ++++-
 hypervisor/arch/x86/vcpu.c             |  7 +++++--
 inmates/tests/x86/mmio-access-32.c     | 10 +++++++---
 inmates/tests/x86/mmio-access.c        | 10 +++++++---
 5 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/mmio.h b/hypervisor/arch/x86/include/asm/mmio.h
index 756c84a8..4b3b2ea8 100644
--- a/hypervisor/arch/x86/include/asm/mmio.h
+++ b/hypervisor/arch/x86/include/asm/mmio.h
@@ -30,6 +30,11 @@ struct mmio_instruction {
 	/** Output value, already copied either from a register or
          * from an immediate value */
 	unsigned long out_val;
+	/** A read must not clear the upper bits of registers, if the access
+	 * width is smaller than 32 bit. This mask describes the bits that have
+	 * to be preserved.
+	 */
+	unsigned long reg_preserve_mask;
 };
 
 /**
diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index b234bd79..c04cf449 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -85,7 +85,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
 	struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
 				     .count = 1 };
 	union registers *guest_regs = &this_cpu_data()->guest_regs;
-	struct mmio_instruction inst = { .inst_len = 0 };
+	struct mmio_instruction inst = { 0 };
 	u64 pc = vcpu_vendor_get_rip();
 	unsigned int n, skip_len = 0;
 	bool has_immediate = false;
@@ -168,6 +168,9 @@ restart:
 
 	op[2].raw = *ctx.inst;
 
+	if (!does_write && inst.access_size < 4)
+		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
+
 	/* ensure that we are actually talking about mov imm,<mem> */
 	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
 		goto error_unsupported;
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 5a557d0b..a1fb8660 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
 	struct mmio_access mmio = {.size = 0};
 	struct vcpu_mmio_intercept intercept;
 	struct mmio_instruction inst;
+	unsigned long *reg;
 
 	vcpu_vendor_get_mmio_intercept(&intercept);
 
@@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
 
 	result = mmio_handle_access(&mmio);
 	if (result == MMIO_HANDLED) {
-		if (!mmio.is_write)
-			guest_regs->by_index[inst.in_reg_num] = mmio.value;
+		if (!mmio.is_write) {
+			reg= &guest_regs->by_index[inst.in_reg_num];
+			*reg = (*reg & inst.reg_preserve_mask) | mmio.value;
+		}
 		vcpu_skip_emulated_instruction(inst.inst_len);
 		return true;
 	}
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index 2f47f211..be1d470f 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -47,9 +47,13 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg32, pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
-	asm volatile("movb (%%ebx), %%al"
-		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg32, (u8)pattern);
+	asm volatile("movb (%%eax), %%al"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL((u8)reg32, (u8)pattern);
+	/* %al should contain 0x44, while higher bits still hold the rest of
+	 * mmio_reg. Test this. */
+	EXPECT_EQUAL(reg32,
+		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
 	asm volatile("movzxb (%%ebx), %%eax"
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index 0e6a56b1..a9d2fcaf 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -67,9 +67,13 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg64, (u32)pattern);
 
 	/* MOV_FROM_MEM (8a), 8-bit data */
-	asm volatile("movb (%%rbx), %%al"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	asm volatile("movb (%%rax), %%al"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL((u8)reg64, (u8)pattern);
+	/* %al should contain 0x88, while high bits should still hold the rest
+	 * of mmio_reg */
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
 	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
 	asm volatile("movzxb (%%rbx), %%rax"
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190606121222.15251-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
