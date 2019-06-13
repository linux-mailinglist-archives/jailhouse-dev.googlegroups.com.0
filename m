Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBDVARHUAKGQEMYLLBYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0CC4369E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 15:30:55 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id y130sf1758092wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jun 2019 06:30:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560432654; cv=pass;
        d=google.com; s=arc-20160816;
        b=CUZPX8QPcuVhbbrwpCEyp40vmCeYiySqj2ZlQHHNp9xUc+o0lDOIyiNElhHVJ10lUC
         kqv1HO8eB0jN+2yI7Mzb1DWQ653J43Cl+M/ulgnQpWHYKhQ6CVd4G7VruSnMG1Cidhwu
         se0HxfNAg+ta3/jKRmc74VIcGrGh3MR0VCBH02kDSXUg386bG5mqyFnfJeN+ps6UltRF
         scYxYBq/x1oXB1vqLAZ86LIdXDXjWNgmLxKcQj8m45z2D/dPAqzdSIpBW8VEC0stVCa+
         TKA2GqmJSf5EIQsEpR5iIKU1tSRdQ5+VHi9EnlC6UZaMjwaEgeZNvXVSQWbIuwYCJ9qI
         JHAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=T5Xa61A7ikVmVFr0T/IcpxaPoi5mge+TS7iPr8IhzRc=;
        b=tGj7AqxiVmroJGoj/AtWZnpMABd04/qyuTc+uT3gS/LN5ScAaRC2NG/YLdkwDhsQfZ
         h7k3IsZoMcJ07qu4AuV1BwqiyG23AIu7p/dRFmGadUlAr2PJqzZxwM+JpfQ9a2oy7G86
         e1z8hBthZjD/gNbONpSnJ6qAGYVm8fFqSzxFzuo23aLWW8RTbgBePM7hRPcpK3Nsgyw1
         Un5DZCzoeYmuUTsU/WYpAm6CQ6btxstdyhogUSZbZOMNV5cIQ29Ro/PT4oQCHC19s93w
         9H4ke7ET0RKung9xmohEu0DWuuH7WUgImOLpQ+8P9B0elo4lkGB9vHorcgp209mRKMCs
         VflA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T5Xa61A7ikVmVFr0T/IcpxaPoi5mge+TS7iPr8IhzRc=;
        b=cjCdOWzZT8p9r5UgmuTHQGMrdnt4Gwl0EA0K7qy6kRVhijM/gHfA6xkqgjEUPWr+ry
         I1e0W219mVWZsXC9pDemvdZlAgYqXG1S+pfVtakOmRM9iUhiioBtceNrNOGwPJUm2dLY
         4hNdlahKPqsVHMGEIczv1c+e1zsiSPyaxzuDEPoqvos/OrX6TzXUzmQBM8y8KFWuEMUu
         F6CU5IxTkrvALanoO31SBrViQ+U5d3+omWrZeDsYbFP2XCtyY94ydMGIlIQXc//Za5Uz
         FZ5xKV3ZKbNmq9oGBzfOsClYP6pkCHJg5UetjXcUiy+vtil11K/uEyuWS5ODouxVvHyR
         I5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T5Xa61A7ikVmVFr0T/IcpxaPoi5mge+TS7iPr8IhzRc=;
        b=Ub+IS4/ICDW+IW6olFIRfVh8wyH9KeuDfZW9ZadhDywP9CQmgHff3IlMafiEJf2C5a
         P469jq3BawMLvt9GKd//j+a9cK6PtZq/UIDTrqw88rUvyTXWNMEde4+g40fLK5uGXibJ
         R0oCrVsto/rzkUDiELdySywB9zPMCPt8URH2M+fF/rE7vGwfflLJbzIc1rQj5JnkJvXC
         Ks2JmCJaJMl9zvUG6Wu0oNQot0S2voyErJO+9nGn57XP4lWtIohWu22g7d9eWeIY/oKI
         yrtHc+OQhWVLDIroS3Z7OKTjmEZgQdCDFb8TwTqDDeN0u2pzS/zANZjV6mPvd9nW61ra
         wM2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBbGPMGy50TPCuo3xiDuYn9yESByBsE202MRPfdWtDWlwptmpm
	TOiWQllPxKSpq5AE//5NkXQ=
X-Google-Smtp-Source: APXvYqzd97ayHxNVVi1K7pEDfkW6IpiZIOj9V8S+UjdEqDJ1I8Nzesql7rqPZvxWu/vvGCK+icZVzQ==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr16626727wrt.295.1560432654620;
        Thu, 13 Jun 2019 06:30:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a396:: with SMTP id l22ls410684wrb.2.gmail; Thu, 13 Jun
 2019 06:30:54 -0700 (PDT)
X-Received: by 2002:adf:e691:: with SMTP id r17mr5323868wrm.67.1560432654132;
        Thu, 13 Jun 2019 06:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560432654; cv=none;
        d=google.com; s=arc-20160816;
        b=t8RVdfkGdi2rtsu9wSeW1iCUu5iA+JbkRAYPpVtovYbWazYB+vIio/xOMSny1JGPhn
         X+3q9oihZmi4tZb0CYhmf4cWWHOzAup60i2jQ45CQU/sLhRxj897g9K0jsrRDgRtperg
         3J3wniBkd9p9zMQnu1WIEO8c8bF2yydHMlET3WQTSMhEpO0XM4AEblllaw+l2+TemDDZ
         Ghyc/oBlrvxKT9NcKbBP/iCcuPpt2gkIT4YYD42QPsSV1PzX2wwbjbiUZVszgezvqW4C
         0eTlzyUXDyjGhzX2fc0KYvAFsIbhmxhQXJlJnGU4EZ56fUX/dT/F4ilog8D3wO5QL1JI
         nrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Q/dqiP/FNkW67NyqMs330zMH0wTIPb91jvq9VFH0Sko=;
        b=RsVlrnrqnnQPA+52GZqknZS1wzwNP2PiyTZledTPZDx/fPOJBlhLwy0glJA1A7Z34l
         SRF4l6jPhtzhdzXWO8y595FN5BUSp1TXH0dL5QsOpHvpTlIr/3gCjjsRq2gqCDEVp/EF
         eJkli5TVjH7jtkO0wzm52uXKk5tYC2X7bGvcPvLXkdfDqKPy4C8D/dD5hc9ZNKV0EXev
         2pajLc4AXd0sqF7c3u2CLpsAEBFU+V49ElhTSUHz6GsEB+PbTAyw/Xm611OTYRrPbfw3
         /NaEOo8y7s0P4ad/wXlRc18BtkjdbUpaW0IP+/py0qVcjDmBPHXYM0i6X9UmByF6xrzm
         TBrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x3si270866wmh.4.2019.06.13.06.30.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 06:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Pl4F34PczxtG;
	Thu, 13 Jun 2019 15:30:53 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2] x86: mmio: fix preserve mask for instructions with zero-extend
Date: Thu, 13 Jun 2019 15:30:52 +0200
Message-Id: <20190613133052.8347-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.13.132117, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.13.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

movzx is a move with zero-extend. It will either move 1 byte (0f b6) or
2 bytes (0f b7). The destination are lower 8 or 16 bits. Zero-extend
means that upper bits need to be cleared. The definition of upper bits
depends on the destination register.

We already have a preserve mask that allows us for to clear or preserve
bits when emulating the instruction. In case of movzx, the preserve mask
only depends on the width of the destination register. For the
destination register, we have the following cases:

  - rax -- instruction has REX prefix 0x48 (rex_w set)
  - eax -- default case, no prefix, nothing
  -  ax -- instruction has OP SZ override prefix 0x66
  -  al -- not possible, and doesn't make sense for movzx

Now, rax and eax have the same effect: Always clear all upper bits (IOW,
bits 8-63 if access_size is 1 or bits 16-63 if access_size is 2).
Solution for rax and eax is easy: Simply don't set the preserve mask at
all.

The fun part is if we have the 0x66 operand override size prefix. This
means that the 'visibility' of the destination register is narrowed to
16 bit.

In case of a 1 byte move (0f b6), copy the source to bits 0-7, clear
bits 8-15 and preserve bits 16-63. access_width ensures that we only
copy 8 bit to bits 0-7, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63 and implicitely clear bits 8-15.

In case of a 2 byte move (0f b7), copy the source to bits 0-15, clear
nothing and preserve bits 16-63. access_width ensures that we only copy
16 bit to bits 0-15, and the preserve_mask 0xffff.ffff.ffff.0000 does
the rest: preserve bits 16-63.

Once this pattern is clear, the fix in the hypervisor is straight forward.

Amend existing and add new test cases that test correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Since v1:
  - Rewrite commit message
  - Set the correct preserve_mask
  - Systematically, add tests for all possible combinations
  - Adress Jan's comments

 hypervisor/arch/x86/mmio.c         |  36 +++++++++-
 inmates/tests/x86/mmio-access-32.c |  30 +++++---
 inmates/tests/x86/mmio-access.c    | 108 +++++++++++++++++++++++++----
 3 files changed, 152 insertions(+), 22 deletions(-)

diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index 124f9966..1fcd810a 100644
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
@@ -191,8 +193,38 @@ restart:
 
 	op[2].raw = *ctx.inst;
 
-	if (!ctx.does_write && inst.access_size < 4)
-		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
+	/*
+	 * reg_preserve_mask defaults to 0, and only needs to be set in case of
+	 * reads
+	 */
+	if (!ctx.does_write) {
+		/*
+		 * MOVs on 32 or 64 bit destination registers need no
+		 * adjustment of the reg_preserve_mask, all upper bits will
+		 * always be cleared.
+		 *
+		 * In case of 16 or 8 bit registers, the instruction must only
+		 * modify bits within that width. Therefore, reg_preserve_mask
+		 * may be set to preserve upper bits.
+		 *
+		 * For regular instructions, this is the case if access_size < 4.
+		 *
+		 * For zero-extend instructions, this is the case if the
+		 * operand size override prefix is set.
+		 */
+		if(!ctx.zero_extend && inst.access_size < 4)
+			/*
+			 * Restrict access to the width of the access_size, and
+			 * preserve all other bits
+			 */
+			inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
+		else if (ctx.zero_extend && ctx.has_opsz_prefix)
+			/*
+			 * Always preserve bits 16-63. Potential zero-extend of
+			 * bits 8-15 is ensured by access_size
+			 */
+			inst.reg_preserve_mask = ~BYTE_MASK(2);
+	}
 
 	/* ensure that we are actually talking about mov imm,<mem> */
 	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index db743410..566f8eaa 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -64,15 +64,29 @@ void inmate_main(void)
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
+	/* MOVZXB (66 0f b6), 8-bit data, 32-bit address, zero extend bits 8-15,
+	 * operand size prefix */
+	asm volatile("movzxb (%%eax), %%ax"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32,
+		     ((unsigned long)mmio_reg & ~0xffff) | (pattern & 0xff));
+
+	/* MOVZXW (0f b7), 16-bit data, 32-bit address, zero extend bits
+	 * 16-31 */
+	asm volatile("movzxw (%%eax), %%eax"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32, pattern & 0xffff);
+
+	/* MOVZXW (66 0f b7), 16-bit data, 32-bit address, preserve bits 16-31 */
+	asm volatile(".byte 0x66, 0x0f, 0xb7, 0x00"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32, ((unsigned long)mmio_reg & ~0xffff) |
+			     (pattern & 0xffff));
 
 	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
 	asm volatile("mov (0x101ff8), %%eax"
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index a17455b0..328d19f0 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -84,20 +84,104 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg64,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
-	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
-	asm volatile("movzxb (%%rbx), %%rax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	/* MOVZX test cases */
 
-	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
-	asm volatile("movzxb (%%ebx), %%eax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u8)pattern);
+	/*
+	 * First three tests: MOVZXB (0f b6) with 64-bit address, varying
+	 * register width (rax, eax, ax)
+	 */
 
-	/* MOVZXW (0f b7) */
-	asm volatile("movzxw (%%rbx), %%rax"
-		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-	EXPECT_EQUAL(reg64, (u16)pattern);
+	/* MOVZXB (48 0f b6), 8-bit data, 64-bit address, clear bits 8-63 */
+	asm volatile("movzxb (%%rax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (0f b6), 8-bit data, 64-bit address, clear bits 8-63
+	 * Exposes the same behaviour as 48 0f b6. */
+	asm volatile("movzxb (%%rax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (66 0f b6), 8-bit data, clear bits 8-15, preserve 16-63,
+	 * operand size prefix */
+	asm volatile("movzxb (%%rax), %%ax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
+
+	/*
+	 * Second three tests: MOVZXB (0f b6) with 32-bit address, varying
+	 * register width (rax, eax, ax).
+	 *
+	 * These pattern will cover cases, where we have, e.g., both operand
+	 * prefixes (address size override prefix and operand size override
+	 * prefix), and a REX + adress size override prefix.
+	 */
+
+	/* MOVZXB (67 48 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
+	 * REX_W, AD SZ override prefix */
+	asm volatile("movzxb (%%eax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (67 0f b6), 8-bit data, clear bits 8-63, 32-bit address,
+	 * AD SZ override prefix. Exposes the same behaviour as 67 48 0f b6. */
+	asm volatile("movzxb (%%eax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xff);
+
+	/* MOVZXB (67 66 0f b6), 8-bit data, clear bits 8-15, preserve 16-63,
+	 * 32-bit address, AD SZ override prefix, OP SZ override prefix */
+	asm volatile("movzxb (%%eax), %%ax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffffUL) | (pattern & 0xff));
+
+	/*
+	 * Three tests for: MOVZXW (0f b7) with 64-bit address, varying
+	 * register width (rax, eax, ax).
+	 */
+
+	/* MOVZXW (48 0f b7), 16-bit data, clear bits 16-63, 64-bit address */
+	asm volatile("movzxw (%%rax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (0f b7), 16-bit data, clear bits 16-63, 64-bit address.
+	 * Exposes the same behaviour as 48 0f b7. */
+	asm volatile("movzxw (%%rax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZWW (66 0f b7), 16-bit data, preserve bits 16-63, OP SZ prefix */
+	asm volatile(".byte 0x66, 0x0f, 0xb7, 0x00"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, ((unsigned long)mmio_reg & ~0xffffUL) |
+			     (pattern & 0xffff));
+
+	/*
+	 * Last but not least: MOVZXW (0f b7) with 32-bit address, varying
+	 * register width (rax, eax, ax).
+	 */
+
+	/* MOVZXW (67 48 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
+	 * AD SZ prefix, REX_W */
+	asm volatile("movzxw (%%eax), %%rax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (67 0f b7), 16-bit data, clear bits 16-63, 32-bit address,
+	 * AD SZ prefix. Exposes same behaviour as 67 48 0f b7. */
+	asm volatile("movzxw (%%eax), %%eax"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, pattern & 0xffff);
+
+	/* MOVZXW (67 66 0f b7), 16-bit data, preserve bits 16-63, 32-bit address,
+	 * AD SZ prefix, OP SZ prefix */
+	asm volatile(".byte 0x67, 0x66, 0x0f, 0xb7, 0x00"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, ((unsigned long)mmio_reg & ~0xffffUL) |
+			     (pattern & 0xffff));
 
 	/* MEM_TO_AX (a1), 64-bit data, 64-bit address */
 	asm volatile("movabs (0x101ff8), %%rax"
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190613133052.8347-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
