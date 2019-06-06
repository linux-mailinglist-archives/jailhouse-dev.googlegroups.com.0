Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3FO43TQKGQENTT4ZLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3E38124
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 00:45:00 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id c13sf1983025edx.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 15:45:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559861100; cv=pass;
        d=google.com; s=arc-20160816;
        b=X8nm1kFCrrbvM1ABNFMfxlTd/cTHrnbJ3pr54GZZfEfA1AQ2nXVRm3QJILdrAjbEur
         tfHM26v/Y2JBQJBBR610c/AcuM4upmAJELu4T7lFbwWVw+qiagY79DEcHW2X8YGspZ6d
         6QnRAOhaRowycjsh1TdGVlbTTe47vuo8iiQ/4Vsc1TFqddHeYGGhvs943MALdPkjW9jr
         eFqAZ+0RQhZ/6LX53iAmzKYFVrvDfs0OzBlfNWKvJvv0SuXQy6B9YcuoEyZFTTscgDUu
         LO3iqjXx1YVX317y8GiVfn0XEKHLNdWGg/MMJMzCmKZjCiYC9qSvBu2WwGeDrnr0iwc8
         MT1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Xk8jJ3srPXXV7o5vL3anOokHvzOy/6hSdTW1J1OT4Lk=;
        b=D9EM9odmOiUxozm0YOtaeQd0RXB3FL6+atPmQ+LfDmIHHWRHMErSYx6+syp8bQdI23
         aUXilO1wkYOmFtc767YMFjohhaozjObInyQvfzw9KVQxh3FS1YwqTFGxW73VgiciH7TW
         FQ+BiFJbhl5EzBQwgoPn6vF4cZu4raopqilwniypVN1gdE4f3EbUCDrC7lnf/LP9MjWu
         4+FGP6n6U7cuvPjAlOGW1OnFupn0VJBk06vLdkVAnUIjDax5iAkkKAP/VMwKMBttVhYv
         +07HBC5rgOXP3LZI/SI8Y9FzdXmdChmBDIy17gbS4Gnl3zJJvMGRbOe/QPYLs9odYvSD
         bK5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Xk8jJ3srPXXV7o5vL3anOokHvzOy/6hSdTW1J1OT4Lk=;
        b=gDReICcYbrZz6nTNGI9X/AYW8i6rbbTMOWgtM0QC090a9It14yiucPlBagdKJBRVGF
         W/D3S45ywEraGuHFZkShTlePPI13G7yz4yWF0+nkR8JqQTQ4MzrYSoiVYaMEtFpq8CtN
         96hGJkD6a9rN504lTElZxPEUY0l5jcHPOJubH6ugo4k76qJ5ec8j7/s1xAcHXYW8f+za
         c1ZYA+0dZHjdyhteVCWPyF7MCNk6BXkN8FmpimN3m9G550lGiLYCXQFDV+c36YP3tF/M
         xYSY+hCUSHtSE2DmVQDTxV5aGl0QVqJUV3o6RRR+QAPMNHHc2nyYS8g9yBeLOsfi2zbD
         Qi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Xk8jJ3srPXXV7o5vL3anOokHvzOy/6hSdTW1J1OT4Lk=;
        b=qiWIQMKuEbhnKjXfauRVFb0uAEf8vIDTTeDqSg3H4YlC5lZV/DbXSNhGFnrSz0bFoE
         YRtyX3A2pkfk2HPIJicFXNwZCN/IdVb4X+wYjErs+4Sn/Eor+y6ihmEEkxUt25rdxJ3X
         izPY3dO/N+IhArWjvkgyAMeV5zZzhEXBnXlTPrMa7/5amKpTGU4HutxeTW6lWPi9H9lM
         QqaM1Jhpbcf+kAHYdl/U30U66atdQTOY+U4+SBIowuK514UKT+h9wmZugRZtXGyAfUMW
         hJiL0joCx1W8Cqpnr3paGM+PNCjaWonhbmMRLvkr5rN7cyXicC1Lgq+homMVift+bT98
         CiuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVgzDirXkV5mTdJS29qK5ymrmZaCBOjDnovPa0dSYi1lSjZ1Edm
	XhI349OejKeESNEYOSK2SGY=
X-Google-Smtp-Source: APXvYqws2hYaOqjKvxDlseOCVEKHuGMXNYJtSEC3Ux3+2nxa+CUwzjUGwC3qnVAPkf3WJu3xZtte1Q==
X-Received: by 2002:aa7:ca01:: with SMTP id y1mr25559335eds.124.1559861100546;
        Thu, 06 Jun 2019 15:45:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls2003080edx.9.gmail; Thu, 06 Jun
 2019 15:44:59 -0700 (PDT)
X-Received: by 2002:a50:b6e6:: with SMTP id f35mr13675330ede.82.1559861099943;
        Thu, 06 Jun 2019 15:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559861099; cv=none;
        d=google.com; s=arc-20160816;
        b=kv29tSIibAW/brad8J5k0hsEc7tPDLk+btVTsrABEETGUc4oQ6ZFDfI9gpwaeTrOV5
         DvMzEcMXuMwVP09N6vEEyx+VZnR7ugvcCDTVK0+auXXlAdrNxKmy0xKIuMNL/wJy/JRz
         g9/oGuxGQ2UI5JuvIFM2Rf1QzEeYw+fkgPXIRaeey/mAhn/UedVpFGTxXdNZuzHiqifz
         6m+zTPOQmc9qnI+OU6K5C4x170uwI6OAb5JbDq2uMPV4gVlbx2oNSp9gz+F+zUubc+FH
         gxHLi19uvpcOaU2KeRRKVUerKcVDlahnIUd6y5lwcUwzJ0q7eWHn0S1tc8esgCKP+Xde
         Caig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=XslAmJDpP8q+plAh9dBoWBubjgFs+plJcpnMUHYAMMs=;
        b=zTAovfODGLErCz/90GOTF3tlnnMyzdKY8Ued7MaBws+TD4UnrlUyPAEiMut1tQhqfk
         +Wo+uRlinzgK2+NOATi4bUhyZUN5/ilfHjXbDVzd1urbFIi8DTHnMuhlq7FfVHXAdpsO
         GU/sqBr53cd3ckUVNtOnmu5XHsqex+VR68yeSGqN5BKF0y4c9hS017lqhlgZsYleZWxK
         Hb5R9S1xHJmrVnGsbv8Mhls5uUV9Fjwx4pmwd4qvtam9WWd0GTrXl8NmMFC7x+xPYu95
         8QQIx606ICKWHb5m7cisB6lODjs8tW83M/Ld7QB4ZGiFxCQxFzt1WQgKjlVHTF5wDXue
         vEEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id o1si22357edc.2.2019.06.06.15.44.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 15:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Kghq0k0Lzy6H;
	Fri,  7 Jun 2019 00:44:59 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 1/3] x86: mmio: fix accidental clears of bits in registers
Date: Fri,  7 Jun 2019 00:44:55 +0200
Message-Id: <20190606224457.1053-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.6.223617, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.6.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190606224457.1053-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
