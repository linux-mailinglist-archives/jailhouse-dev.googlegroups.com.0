Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3NO43TQKGQEZ4VY46A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938B38126
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 00:45:02 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id k15sf4233eda.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 15:45:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559861101; cv=pass;
        d=google.com; s=arc-20160816;
        b=okELTAwcpyVN5QQMRbSGbsrJk4QQ7KeyRvOs4A6UKinCotewoZES/r1SC+3lXIw+VP
         iieCuLN2oh1bIqaXSvmF8nKnuTrLHMM/O1uP4ZK7ZJZ+VpzHoTcUoVgJiID51W6AA1Rf
         aKtcbsHiBRwJlq1WemxgDbf7GlgBtN6eZx9RcQ9PrWCk3NihO6OPbQRE45OcZ/Fs2yiq
         +nbo2e3qYyl2QCZiLvUzkLXeYJuuA/7BQoT3g2IjAPls2XK56KamfVYKFm7V87eLsMm1
         L3ReugDjRgML/CSGbpR4pJ7vurUFn1zPt5KVqAZ56mvpm6d/SH/n2vI3DO3UUo0NQ1xd
         qKWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=520BB93qbuORsXKs+VX7oZE7MjsPBFYZWs2uBr/JLgA=;
        b=M+DpwZxT0VasbmKmy+23iN0N9eK7Gq2qorrV6bfyjadwJWFmoF0smlK3gjyJip61jZ
         wKJeCcCLEO9FuaxnqsoMXGz+xNk5pgNRO+Ye4eZ5XepAAtdlFQZeZZTF3kXb5Ix14f0C
         q4XvSF9dgZ9mh7l7I3MBXlhoX1ts09TgjU8Qz9HGT6i5IkbrTNJaCxTsGxiaYZ2fo2mp
         GZWCzpM4I438iVGKRXD2bk6kqRiyf+U0/m6GaezVAr34wu72rEdxwcPz0USnsnsUGrXk
         i0C29R3sEqqDDHtnSwkgS8sDQt2J7pMs3Fc/Sh5aKUuTHffELM5GXyjqzsMiDp9RyAQf
         qQgw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=520BB93qbuORsXKs+VX7oZE7MjsPBFYZWs2uBr/JLgA=;
        b=Bx/5aBADimn3O+VnzXxYuqSI3b7i+5VyVApkfTXDS26YQ8oynaWp7w0he/dv4oa76K
         Y2e0K2275x1lSjsCBNI+aEQK/ow+l37oNIPs1LS00Z4SN3RBV1bQ2oSsjo/gy+fZQc4F
         RoP2LqO9YZQhQln4ambAwZeCeZdndFoUlcKu/WUZK7Wykmo8eGp1ZpZzCz0ZEYKrhRdI
         iTpfPk4qD0H3KgeJ919LLs3iLsc9kl9T/OQdQZXBKh3yQL8NotTb8tjiY288Xslh/ih8
         ue2TQUQpM+gF6EMTshXvRJxgEinLH8osTZPZzCs7v+gDhuVtGx6FgC3GxrodQXVD53u+
         qSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=520BB93qbuORsXKs+VX7oZE7MjsPBFYZWs2uBr/JLgA=;
        b=TyFvnsGHtlBG7Q2L6lgwnq+m06kzB8tQtNV+R1ZnaPvTlH/ugp9Fhoxr9M5+NFnvh0
         14MvOpQSghOD/bAGm/byaepbIl8BZ/j9nYrAQLBPb7rYxmPo02PkR4byrFA+RyAS0pLX
         moLEwsltsLGgOJtDpG6LiAr+mPH5yItaau1kB9PjWg93s6hsSS17qjurYw48VHWBLGYP
         LEYyKzBfioDtb2bB5KHgKZAobZk0mxb4mdpxxR/Jbb0mJ4QqPo38wpsokUT4xz5EHHWh
         TYXLeQIDqM+MJqyCGX5BeiS5jauLMYjcso5io4mi7nNuRqFyR4qhwEVrw5F3cWfz9Rww
         yU/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW+ykne3JC+z/fuzFyOERcx1wZ7WCZwY1XqQEoeXG24cgCzwQVx
	+PNdDzG1BI9DBr3HoCTMUHQ=
X-Google-Smtp-Source: APXvYqzmouyxWkxdaaW+4SXm1/NpDU4aGFmH+l8qlmKzIwnaroodl/9UJzzvgJ1vWTgmlERXLPMFaw==
X-Received: by 2002:a17:906:af68:: with SMTP id os8mr20493160ejb.105.1559861101776;
        Thu, 06 Jun 2019 15:45:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7084:: with SMTP id b4ls645146ejk.6.gmail; Thu, 06
 Jun 2019 15:45:01 -0700 (PDT)
X-Received: by 2002:a17:906:6a90:: with SMTP id p16mr43143154ejr.75.1559861101309;
        Thu, 06 Jun 2019 15:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559861101; cv=none;
        d=google.com; s=arc-20160816;
        b=FACvT5zmzXnLGWFElFeGjHZHu/o0uifrc1FHlQrlYpiJMuxvLDMJW0T+vJUAYIGsNO
         d9Az+34ispCJEQ7RJaos1Y5ZxmxXqsytAnlp12q0h2/wOegV8Qs78MON3IqqrtlKbFlq
         uq+ImGfjxQXyCgW+To/tXeG56snjqhm3bBWoJ5Xy/my6JntQOcssCA2sCaEWRrnMJnH0
         tgqfQGe9Q/U7P010G2aRCU650pJXTq30pwrc+78qB9MH6ZHujN/zDqmOjuAfcav5HSxh
         i5ly0CKQc97MTlZ/XCTqXU3aw4k0PBQ65uL3TuUXJrJzf3ZuqqEaF1qfVzrvd28w+LjR
         uSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=n58xIuteO9habLLKc5XSuyc66hqNWUdOK9vQ8VyzPXA=;
        b=O+zfJuh5Pdl2EOmJqSEJs6dGd1EYzhMnQAwDnPrxjtxvAnqMBnCgdcqI5jDR1RQZ4p
         J86YBe1xRLLGCxdeb0LLjIsceFT5E2sp8DOR0LG/gP6X7DIQn72gyQX/RKYoujYVak3y
         NR7+3EmgmSh+PVoxwgEPnD58oZvqPVrhosqd1Ub9qrYngNfAk+avpVQHTDhUv/OacrNa
         P6ZNFSyPH1PiBc9Gptxo/0k4MYy2nwHk01RNW5rpsI+d0BJliRB8JhR2QUnVvS+GJiRy
         2Zxz9pI3zREVHfD8+GR90Mb9bgwOPZ9kMra7Fl2XPy3gkDoW0b5AgTKf+8E1tddFCrt4
         s+PA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id x27si26474edd.3.2019.06.06.15.45.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 15:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Kghr5VWTzy6H;
	Fri,  7 Jun 2019 00:45:00 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 3/3] x86: mmio: add support for 0x66 operand prefix
Date: Fri,  7 Jun 2019 00:44:57 +0200
Message-Id: <20190606224457.1053-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.6.223617, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.6.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

mov (%rax), %ax is a 16-bit data MOV_FROM_MEM that will emit
0x66 0x8b 0x00.

0x66 is the operand-size override prefix which we currently do not support.

We should support it, as we can find this opcode, for example, for some
mmconfig space access from Linux (e.g., pci_generic_config_read).

This also adds appropriate mmio-access tests.

Tested in QEMU virtual target.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/include/asm/processor.h |  1 +
 hypervisor/arch/x86/mmio.c                  | 47 +++++++++++++++------
 inmates/tests/x86/mmio-access-32.c          | 21 ++++++++-
 inmates/tests/x86/mmio-access.c             | 21 ++++++++-
 4 files changed, 76 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
index 70a6c3ff..d8111690 100644
--- a/hypervisor/arch/x86/include/asm/processor.h
+++ b/hypervisor/arch/x86/include/asm/processor.h
@@ -145,6 +145,7 @@
 
 #define X86_REX_CODE					4
 
+#define X86_PREFIX_OP_SZ				0x66
 #define X86_PREFIX_ADDR_SZ				0x67
 
 #define X86_OP_MOVZX_OPC1				0x0f
diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index df8c97a1..b836f43c 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -54,6 +54,7 @@ struct parse_context {
 	bool has_rex_w;
 	bool has_rex_r;
 	bool has_addrsz_prefix;
+	bool has_opsz_prefix;
 };
 
 static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
@@ -74,14 +75,33 @@ static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
 	return true;
 }
 
-static unsigned int get_address_width(bool has_addrsz_prefix)
+static void parse_widths(struct parse_context *ctx,
+		         struct mmio_instruction *inst, bool parse_addr_width)
 {
 	u16 cs_attr = vcpu_vendor_get_cs_attr();
-	bool long_mode = (vcpu_vendor_get_efer() & EFER_LMA) &&
-		(cs_attr & VCPU_CS_L);
+	bool cs_db = !!(cs_attr & VCPU_CS_DB);
+	bool long_mode =
+		(vcpu_vendor_get_efer() & EFER_LMA) && (cs_attr & VCPU_CS_L);
 
-	return long_mode ? (has_addrsz_prefix ? 4 : 8) :
-		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
+	/* Op size prefix is ignored if rex.w = 1 */
+	if (ctx->has_rex_w) {
+		inst->access_size = 8;
+	} else {
+		if (long_mode)
+		/* CS.d is ignored in long mode */
+			inst->access_size = ctx->has_opsz_prefix ? 2 : 4;
+		else
+			inst->access_size =
+				(cs_db ^ ctx->has_opsz_prefix) ? 4 : 2;
+	}
+
+	if (parse_addr_width) {
+		if (long_mode)
+			inst->inst_len += ctx->has_addrsz_prefix ? 4 : 8;
+		else
+			inst->inst_len +=
+				(cs_db ^ ctx->has_addrsz_prefix) ? 4 : 2;
+	}
 }
 
 struct mmio_instruction
@@ -118,6 +138,11 @@ restart:
 			goto error_noinst;
 		ctx.has_addrsz_prefix = true;
 		goto restart;
+	case X86_PREFIX_OP_SZ:
+		if (!ctx_update(&ctx, &pc, 1, pg_structs))
+			goto error_noinst;
+		ctx.has_opsz_prefix = true;
+		goto restart;
 	case X86_OP_MOVZX_OPC1:
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
 			goto error_noinst;
@@ -134,28 +159,26 @@ restart:
 		ctx.does_write = true;
 		break;
 	case X86_OP_MOV_TO_MEM:
-		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		parse_widths(&ctx, &inst, false);
 		ctx.does_write = true;
 		break;
 	case X86_OP_MOVB_FROM_MEM:
 		inst.access_size = 1;
 		break;
 	case X86_OP_MOV_FROM_MEM:
-		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		parse_widths(&ctx, &inst, false);
 		break;
 	case X86_OP_MOV_IMMEDIATE_TO_MEM:
-		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		parse_widths(&ctx, &inst, false);
 		ctx.has_immediate = true;
 		ctx.does_write = true;
 		break;
 	case X86_OP_MOV_MEM_TO_AX:
-		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
-		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		parse_widths(&ctx, &inst, true);
 		inst.in_reg_num = 15;
 		goto final;
 	case X86_OP_MOV_AX_TO_MEM:
-		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
-		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		parse_widths(&ctx, &inst, true);
 		inst.out_val = guest_regs->by_index[15];
 		ctx.does_write = true;
 		goto final;
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index be1d470f..9c1db1d8 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -41,6 +41,10 @@ void inmate_main(void)
 	mmio_write32(mmio_reg, pattern);
 	EXPECT_EQUAL(*comm_page_reg, pattern);
 
+	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
+	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL((u16)reg32, (u16)pattern);
+
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
@@ -55,6 +59,13 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg32,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
+	/* MOV_FROM_MEM (8a), 8-bit data, 32-bit address, OP size prefix */
+	asm volatile("data16 mov (%%eax), %%al"
+		: "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL((u8)reg32, (u8)pattern);
+	EXPECT_EQUAL(reg32,
+		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
+
 	/* MOVZXB (0f b6), 32-bit data, 32-bit address */
 	asm volatile("movzxb (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
@@ -87,7 +98,15 @@ void inmate_main(void)
 	/* MOV_TO_MEM (88), 8-bit data */
 	asm volatile("movb %%al, (%%ebx)"
 		: : "a" (0x42), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffff00) | 0x42);
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
+
+	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
+	asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x23), "b" (mmio_reg));
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
+
+	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
+	asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "b" (mmio_reg));
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
 
 	/* IMMEDIATE_TO_MEM (c7), 32-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movl %0, (%%ebx)"
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index a9d2fcaf..3794555f 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -51,6 +51,10 @@ void inmate_main(void)
 	mmio_write64(mmio_reg, pattern);
 	EXPECT_EQUAL(*comm_page_reg, pattern);
 
+	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
+	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL((u16)reg64, (u16)pattern);
+
 	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
@@ -75,6 +79,13 @@ void inmate_main(void)
 	EXPECT_EQUAL(reg64,
 		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
 
+	/* MOV_FROM_MEM (8a), 8-bit data */
+	asm volatile("data16 mov (%%rax), %%al"
+		: "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL((u8)reg64, (u8)pattern);
+	EXPECT_EQUAL(reg64,
+		     ((unsigned long)mmio_reg & ~0xffUL) | (pattern & 0xff));
+
 	/* MOVZXB (0f b6), to 64-bit, mod=0, reg=0, rm=3 */
 	asm volatile("movzxb (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
@@ -129,7 +140,15 @@ void inmate_main(void)
 	/* MOV_TO_MEM (88), 8-bit data */
 	asm volatile("movb %%al, (%%rbx)"
 		: : "a" (0x42), "b" (mmio_reg));
-	EXPECT_EQUAL(*comm_page_reg, (pattern & 0xffffffffffffff00) | 0x42);
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x42);
+
+	/* MOV_TO_MEM (88), 8-bit data, OP size prefix */
+	asm volatile("data16 mov %%al, (%%ebx)" : : "a" (0x23), "b" (mmio_reg));
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffUL) | 0x23);
+
+	/* MOV_TO_MEM (89), 16-bit data, OP size prefix */
+	asm volatile("mov %%ax, (%%ebx)" : : "a" (0x2342), "b" (mmio_reg));
+	EXPECT_EQUAL(*comm_page_reg, (pattern & ~0xffffUL) | 0x2342);
 
 	/* IMMEDIATE_TO_MEM (c7), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq %0, (%%rbx)"
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190606224457.1053-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
