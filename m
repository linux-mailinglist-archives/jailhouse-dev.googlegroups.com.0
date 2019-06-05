Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBU7A37TQKGQEJHTAJ5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 152B63617F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2019 18:39:48 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id h5sf11727272wru.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2019 09:39:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559752787; cv=pass;
        d=google.com; s=arc-20160816;
        b=D+wUdUKcvWF64v4EUi3r0U5748m2zSEpvqNPFO6k6KpGH0E6cOoF+Brr3X7imkVMUq
         P8haUiHwlc0E23Jy2WQgkSjheOO9i8ZtD4jXPOoKqbjRp4VgRvaZX2TIvg8g1T88NhfA
         fJ349XVO0+/qCqKtDJ+FSL1PSwbl1B/i32KKZ+INzak0lHXV3GwrnbKXJgmTlEftZwMn
         hV479zqKRSTVF6HjTtzTikN72jFYLDdER5LKrfveEJc6rCwKBw/MMKfeMH3XNUnPI3Vf
         hUhPypvwG+8WBqul9JaLsLZVEvoBLb5bX9wReRFYJ4qGwgqyGJv4Lb7RsdxdxdbFbesu
         TgTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Bd+PcJuOE+aehJmmtQCrvubwv1JTHMjkVPd2k0b/+jI=;
        b=R8xuOAohDPEmj2t3vgc5jI6Qi05UJB5C8x/kz+g9CuHWW2NNUCK2PubAL6qak4+C8O
         RRDUYFjuye4EtOeB/X8CyPQEOmFrvTN0yes8MkGKo7HwC8uFAdkPm+oEu4fh8phiBD+t
         CAgehKHa/en6vjR929kA7p2hkfOci2fNFx1H19j83cflXi2PSOX816o6Pxc2p/jI0Qmm
         XdL9BGzdPXnkUn/n5c4Q9Gwopr1qVhTzInNS/wxNVOYrPdGDHUtyX/t/hbsv9UQHCeCW
         8DyOiVHVHVhwOGJuE7vEDK8gl+e6KK9Inxzn7zwh8jr/Lz7QdutEQg/+qLRCUD5C7oZE
         zamg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bd+PcJuOE+aehJmmtQCrvubwv1JTHMjkVPd2k0b/+jI=;
        b=ANREQQ1E5PAk3e7OqvkIeMGow92Mk/ZWBeeJt4G9unkas7FRWTzJjMAXBAz6o2xHCd
         9KU4N9XhbK0gcQSToLb3myL6eDBkaanxSDlmwSyTjPmk47lmD4NRtM6uvAK7kIbgQ/bS
         E8ETGXS6CgBdiqaqTRClw8ZCL5/FnHXU7IjA0R4muUyAlwz2D1cQ6mH9pTBCZlXI4gHY
         cfDT3xa6UMDl4M6aYkkDCUp3zCMyHZqWUZRGnpW0ZdgCaxg1uee0m7cnb5MTFVJb/zMj
         kShPJAsvOthpEsn9XtYJzbYZVHRF3JpZrsXKmRGugOtaNUWY7joh1XXG/dRhsW4X0JlO
         getg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bd+PcJuOE+aehJmmtQCrvubwv1JTHMjkVPd2k0b/+jI=;
        b=aiz1J8P/o5g3aaQmTKvZ0MVfK6f718fE8wvbFyh1Y7xoXTVgqsdHGiQsVjxvvb0urk
         NwDDFGD828jW5uvj/FCbRypR0TzXV6v0zjj4rbICXCRX0i75+HAOxZGM1A1ezN8pfIF9
         lTQ2I/DGwnTelT+WG9JNZeOcvKTYHezSgL0ZePDMNjElqLK9fsMeld0lxgrZKklQtT4z
         xRZau22cZWqs3f44cHJfL+dngRTMXnOi/1No2Bdz4jdj7m8cDg8pIuYoiXytrnmkAfNx
         RqUus5H7BvaOOXeXY3acpp0reiF/c1Dcudbl4EzSUwgtmNbQYUWMabk8X9KO6T1sN5rh
         5SYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXRUbpty07pIx2mf4DG0B/AyKOkYTHnG71Wak6RN8KYav0AjKGa
	OIKajQH03uNapCkoz7b5cg4=
X-Google-Smtp-Source: APXvYqz7OffCBIKIk/PXKSsriKCelJHqqO4R1aBDXLMwEWXs0O5pAPKSbN8nac8nRrTHHZG3jCp7Xw==
X-Received: by 2002:adf:90c3:: with SMTP id i61mr11136980wri.48.1559752787787;
        Wed, 05 Jun 2019 09:39:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4f85:: with SMTP id d5ls621122wru.14.gmail; Wed, 05 Jun
 2019 09:39:47 -0700 (PDT)
X-Received: by 2002:a5d:414c:: with SMTP id c12mr12593791wrq.88.1559752787227;
        Wed, 05 Jun 2019 09:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559752787; cv=none;
        d=google.com; s=arc-20160816;
        b=lwFVV5Jhc2mNSwS+RnxyXIUFxnjQRX5AT20S7XKYq6yuqTt4t/bJh0xOPVPHOhc1aC
         NgCrRpYKfydZkIx8NT0KeebmlCcxMRjRi7uIg/X4oxwqQ/z0cozcyjezFnRLfhZU2mt9
         j6J6cjcs1IFYRi09PTRhE5mkz0+/d9sRv7sH8T8EfDMpNvoHaXbsacUVEDmGOIxeowQ1
         NcKA0EfuwcP4mGZc0pCYuN0z88nBHxvHJY8CMJp9vjXmdOOtTRE7cMC4ka2hBRZxbLV3
         gcLYzgoBLzvEqceycYRkhGkU45v7w8/+IGFRwtoxxPJFkTnNsNZnNMWhrQOtA6QRwrFk
         Okuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=OBLq+OR9k5zxDd/OCIR/aIpRQ0PwK7DBF7IV54s5nd0=;
        b=rEnSrgOX0uhqNP/03/PSfWjTIKJvNbheqxQD5wAiVWGsetykx6M/Gyv7iB/EnXRD/g
         IahluPTH4oXNdIqQvCzRihB3iEZKQ97WpIDlsNlNfDXMMR9zQQcNR26bCfhx5oGd5P7P
         osBWNBnlJyBTgI/l65G2ohH0R7j6Rnh/ucEMYDsk/JO4gxqmFK4geT+YQBtAar51dk79
         YV9O+/O/xVc8zmFSuhoAuXvVqw5kp2u+AzCJhCuyzw2lapyl62IHSV3SzIEdLUhZSO5O
         rQ/PzDZlMZH+Fn5xxwLOtfJAXncjX+HpKxBO+luEdo5p0p29n3qjHpdqOqXXx0nLiUrf
         JkqQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f83si804479wme.2.2019.06.05.09.39.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 09:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Jvdt4HFdzyBH;
	Wed,  5 Jun 2019 18:39:46 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jan.kiszka@siemens.com,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] x86: mmio: fix accidental clears of bits in registers
Date: Wed,  5 Jun 2019 18:39:46 +0200
Message-Id: <20190605163946.25316-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.5.163016, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.5.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

We trap certain MMIO accesses and need to emulate their access.

On x86, a 32-bit read will clear bits 32-63 of a register.

Inconsistently, on x86, 16-bit and 8-bit reads must not clear high bits.
Jailhouse erroneously cleared those bits. Prevent this by applying a
preserved mask that keeps bits alive.

Add tests that check correct behaviour.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

This patch is not related to "x86: mmio: add support for 0x66 operand
prefix", it's just a bug that I stumbled over while working on a v2 of
the other patch.

The calculation of the preserve mask dynamically creates a bitmask. At
the moment, only 8 bit support would be required, but it already
supports 16 bit support, as that'll be introduced in the 0x66 operand
prefix override support patch.

 hypervisor/arch/x86/include/asm/mmio.h |  5 +++++
 hypervisor/arch/x86/mmio.c             |  7 ++++++-
 hypervisor/arch/x86/vcpu.c             |  7 +++++--
 inmates/tests/x86/mmio-access-32.c     | 10 +++++++---
 inmates/tests/x86/mmio-access.c        | 10 +++++++---
 5 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/mmio.h b/hypervisor/arch/x86/include/asm/mmio.h
index 756c84a8..e6c4e4dc 100644
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
+	unsigned long read_preserve_mask;
 };
 
 /**
diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index b234bd79..e8bf32bc 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -85,7 +85,8 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
 	struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
 				     .count = 1 };
 	union registers *guest_regs = &this_cpu_data()->guest_regs;
-	struct mmio_instruction inst = { .inst_len = 0 };
+	struct mmio_instruction inst = { .inst_len = 0,
+					 .read_preserve_mask = 0, };
 	u64 pc = vcpu_vendor_get_rip();
 	unsigned int n, skip_len = 0;
 	bool has_immediate = false;
@@ -168,6 +169,10 @@ restart:
 
 	op[2].raw = *ctx.inst;
 
+	if (!does_write && inst.access_size < 4)
+		inst.read_preserve_mask =
+			~((1UL << (inst.access_size * 8)) - 1);
+
 	/* ensure that we are actually talking about mov imm,<mem> */
 	if (op[0].raw == X86_OP_MOV_IMMEDIATE_TO_MEM && op[2].modrm.reg != 0)
 		goto error_unsupported;
diff --git a/hypervisor/arch/x86/vcpu.c b/hypervisor/arch/x86/vcpu.c
index 5a557d0b..3f6a13f1 100644
--- a/hypervisor/arch/x86/vcpu.c
+++ b/hypervisor/arch/x86/vcpu.c
@@ -231,6 +231,7 @@ bool vcpu_handle_mmio_access(void)
 	struct mmio_access mmio = {.size = 0};
 	struct vcpu_mmio_intercept intercept;
 	struct mmio_instruction inst;
+	unsigned long *value;
 
 	vcpu_vendor_get_mmio_intercept(&intercept);
 
@@ -249,8 +250,10 @@ bool vcpu_handle_mmio_access(void)
 
 	result = mmio_handle_access(&mmio);
 	if (result == MMIO_HANDLED) {
-		if (!mmio.is_write)
-			guest_regs->by_index[inst.in_reg_num] = mmio.value;
+		if (!mmio.is_write) {
+			value = &guest_regs->by_index[inst.in_reg_num];
+			*value = (*value & inst.read_preserve_mask) | mmio.value;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190605163946.25316-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
