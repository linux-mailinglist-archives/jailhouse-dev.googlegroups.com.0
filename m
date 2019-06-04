Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ5Y3PTQKGQELONSH4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DE3518F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 23:02:31 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id k3sf542734wrq.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jun 2019 14:02:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559682151; cv=pass;
        d=google.com; s=arc-20160816;
        b=PBC+nxc/vbTbbd5Rh9c3V3EHPIsPAzY15HRutpGoNOB02XDT60LT1oxdsO7FNTbYKm
         DLVGZecvdcP3mL33YIFFBMuQ0W8G2xXer6jec1zftDbmr7TyJpLkFtekqK7vCPpk4emm
         VZMmMygtaxLnNoXChZ2UYQedHaV21cFYZBM69TGWdUlqzy75wiwHalr9VAZcchFuHrNj
         Qkm84oFRSGG8lJ+Ug/b63T08pIaWO2vWhvJEVaQxWQ0isWZ996zujIJ0tuYOL8U4pYoW
         mouY2pBUl1/rhTVhTf3DNk4YhsJlGKFAVf7AtjISORTZoLlVvsLISD/FOAPgHD73SWUk
         OSNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=2SQqeDcKd4B4kNunlyVNHScWGQclXfbvJt2tFPEw8+I=;
        b=JnrN+Zin564hm9N4xb/qdeof98H5HiRfFCE8ehC7xa9iIoJeMNMkgl+UbtOw9/AGVG
         bJRSrDGfnh6/ENRwoJudlZ3r+S9EZUE2gePKhTgW0irOX38ccZ7b5Z6mANEDEWbT1fAi
         o/pw8pXEcbw5bU/bEYMcHhMgdIjCmBPyUyw7PKYXYIqA87qITbgf13KQvW31IzznFUTc
         Tey6v/eDxUggoEaFytbSWQcRjjdCj7PI63JXOomc+jJwnQvKB/rnKfimZ5r94YP1F66z
         s98Mckl0jKucFMZurCqh0PI/ozIZdi92XHpoBdk4aOg9XkfgFgUH+tbcFpRrO1ruYBvM
         w3sw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2SQqeDcKd4B4kNunlyVNHScWGQclXfbvJt2tFPEw8+I=;
        b=n82nOkfEJ6D7bOkN25Jnr43AKhzuoySWLR9GhQentB4Drmgs+BurWX+/ywhw2Jsf8t
         jZLhsGUP6XGiEUyvw2WWtJOGQ5XHty6FDqjp3wJ3AoDcd6bShmNefScIVTvaj+9l4g6c
         aPKf6MEcEckltZnRalmVdliauu4boG3xceDYjiyaL+R0E5v1wNLbAeKIrVqU2BkvL5Eo
         el9m92KbOoeyJ1xnvGf+S31PpMKO/KrQgtEEHLKzlw6KQ1yZ/1bSf3/G0J8ZfjIYQhy9
         Y0ltTbXcOTZMlKwajvB5WVTicd9zICQRpVb4WfRpoaHPuEWNCpuGEQjKcKoLa5A9Vgt9
         zocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2SQqeDcKd4B4kNunlyVNHScWGQclXfbvJt2tFPEw8+I=;
        b=L3pzmsRZLcmZX5HLgYpmnTJx++f4NJ48OWOucf3/5dQdA7FZbY5RJ2uu2EhF4jj52s
         aiBhjD/SvH4J98bf7fjpzWfwy0UpjQmCFX+LzmYFEdG8RXwuF1aUGSMQ5/+Tx5BTj4ND
         1wuvymwLZqWxYFyTqPUxYaBQ7l64f/Fiuqwk6lww4jo+KOWUwvw6PtcWQhYPSRrmP1qN
         bHGuYigpCAKt7zdhnHQgKM5q+Wgk8WwNVmYMJa8Ttb+fQkLKLytuPuB6282k/7lAT/7k
         YIwp0JJbPNm5t9OqBUDCKGsy+ppbHfbZ+r5gWx+f7fn7Bj/mfeSDyVdr9ob5SumiA+N5
         KHpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjquYCUxhW0ZOLKbD8OHCEJMTaVOaHFFlDjCksT8wtANRZS5At
	DQfJaKX+KWXi4zstMuAKkr4=
X-Google-Smtp-Source: APXvYqyFykxi1htVC1lrMjKra5i7uZKBX3HGCxxmfI+0yBhV6L9nffVUX/3VkzmUPAyUj29RBkN1eQ==
X-Received: by 2002:adf:baca:: with SMTP id w10mr11621695wrg.230.1559682151591;
        Tue, 04 Jun 2019 14:02:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls62795wmf.2.canary-gmail; Tue,
 04 Jun 2019 14:02:30 -0700 (PDT)
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr7850323wmf.60.1559682150904;
        Tue, 04 Jun 2019 14:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559682150; cv=none;
        d=google.com; s=arc-20160816;
        b=n2aLADLe2038qVUFZ67GbvJwEskdZC0ctcpE7oHc7ygLj4KYfVasGTHD13DaU38YoR
         dJBfZ0dHkbOwgorc52Mu02xDmJ4g21rEhQfJFsAi3+AgsXNoKeuU9pdvm7S4m4SPUghq
         kVr33sensJMuklkF5i4kSLd789fOy/Hpchzt3jz9PyNk/hrMAnfVSLNWKy2HlSSfKx3E
         t5MNt2drZQp4bjwklwYuf+2ZYfg2iMH2RY6fh0dG7Z970VmY/jiICKaAY2otn8bKN4+b
         fapkyDEpkGxVu3ZumCWeyfxJQjYr71hCKNTeRdRnqZRNR8F8BLRmmxRA8q7kYerziA0P
         mBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=gijopRzA6KK0mbETO0CJncxEBhjVFgq2BmCxJRvjb4w=;
        b=n+MY8DVraV9pecROPSHePeUeGajOTmtgjb5Ejdimu1DObJDKF8tB+8FZdED/fO8zt/
         S6wpiwQTq1E7DTboXnXwS4oEjWUhVCL8PnktMgBnwh2nDUbB94uTmZmhPe3GJqxrSH3p
         hiJGyJht/ALHk2cGXVvxa35U3jXi9cswMWyO1OTen2csmtt1o2IAVtuK6R4jmp/8qvys
         rwybSvchnYnqc5PNZsRIaAEYhEU+zONq914ebRo+YnWwgzEbIvXcwNt0yRTZpqqlgzeT
         QPdxp/dCV7+GG9PDIVLpWT+kEvc1hBMOK2MivGeQyPprysPlUvRp+UI+wHQh5sFTWw/R
         Ki7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j18si967420wrc.1.2019.06.04.14.02.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 14:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45JPWV1sY9zyBc;
	Tue,  4 Jun 2019 23:02:30 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Mario Mintel <mario.mintel@st.oth-regensburg.de>
Subject: [PATCH] x86: mmio: add support for 0x66 operand prefix
Date: Tue,  4 Jun 2019 23:02:29 +0200
Message-Id: <20190604210229.23554-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.4.205716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.4.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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
 hypervisor/arch/x86/mmio.c                  | 37 +++++++++++++++++----
 inmates/tests/x86/mmio-access-32.c          |  4 +++
 inmates/tests/x86/mmio-access.c             |  4 +++
 4 files changed, 40 insertions(+), 6 deletions(-)

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
index b234bd79..6d9ad1c5 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -79,6 +79,26 @@ static unsigned int get_address_width(bool has_addrsz_prefix)
 		(!!(cs_attr & VCPU_CS_DB) ^ has_addrsz_prefix) ? 4 : 2;
 }
 
+static unsigned int get_op_width(bool has_rex_w, bool has_opsz_prefix)
+{
+	u16 cs_attr;
+	bool long_mode;
+
+	/* Op size prefix is ignored if rex.w = 1 */
+	if (has_rex_w)
+		return 8;
+
+	cs_attr = vcpu_vendor_get_cs_attr();
+	long_mode = (vcpu_vendor_get_efer() & EFER_LMA) &&
+		    (cs_attr & VCPU_CS_L);
+
+	if (long_mode)
+		/* CS.d is ignored in long mode */
+		return has_opsz_prefix ? 2 : 4;
+
+	return (!!(cs_attr & VCPU_CS_DB) ^ has_opsz_prefix) ? 4 : 2;
+}
+
 struct mmio_instruction
 x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
 {
@@ -94,6 +114,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
 	bool has_rex_w = false;
 	bool has_rex_r = false;
 	bool has_addrsz_prefix = false;
+	bool has_opsz_prefix = false;
 
 	if (!ctx_update(&ctx, &pc, 0, pg_structs))
 		goto error_noinst;
@@ -114,9 +135,13 @@ restart:
 	}
 	switch (op[0].raw) {
 	case X86_PREFIX_ADDR_SZ:
+	case X86_PREFIX_OP_SZ:
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
 			goto error_noinst;
-		has_addrsz_prefix = true;
+		if (op[0].raw == X86_PREFIX_ADDR_SZ)
+			has_addrsz_prefix = true;
+		else
+			has_opsz_prefix = true;
 		goto restart;
 	case X86_OP_MOVZX_OPC1:
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
@@ -134,28 +159,28 @@ restart:
 		does_write = true;
 		break;
 	case X86_OP_MOV_TO_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
 		does_write = true;
 		break;
 	case X86_OP_MOVB_FROM_MEM:
 		inst.access_size = 1;
 		break;
 	case X86_OP_MOV_FROM_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
 		break;
 	case X86_OP_MOV_IMMEDIATE_TO_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
 		has_immediate = true;
 		does_write = true;
 		break;
 	case X86_OP_MOV_MEM_TO_AX:
 		inst.inst_len += get_address_width(has_addrsz_prefix);
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
 		inst.in_reg_num = 15;
 		goto final;
 	case X86_OP_MOV_AX_TO_MEM:
 		inst.inst_len += get_address_width(has_addrsz_prefix);
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = get_op_width(has_rex_w, has_opsz_prefix);
 		inst.out_val = guest_regs->by_index[15];
 		does_write = true;
 		goto final;
diff --git a/inmates/tests/x86/mmio-access-32.c b/inmates/tests/x86/mmio-access-32.c
index 2f47f211..b4f83850 100644
--- a/inmates/tests/x86/mmio-access-32.c
+++ b/inmates/tests/x86/mmio-access-32.c
@@ -41,6 +41,10 @@ void inmate_main(void)
 	mmio_write32(mmio_reg, pattern);
 	EXPECT_EQUAL(*comm_page_reg, pattern);
 
+	/* MOV_FROM_MEM (8b), 16-bit data, 32-bit address, OP size prefix */
+	asm volatile("mov (%%eax), %%ax" : "=a" (reg32) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg32, (u16)pattern);
+
 	/* MOV_FROM_MEM (8b), 32-bit data, 32-bit address */
 	asm volatile("movl (%%ebx), %%eax"
 		: "=a" (reg32) : "a" (0), "b" (mmio_reg));
diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
index 0e6a56b1..86694353 100644
--- a/inmates/tests/x86/mmio-access.c
+++ b/inmates/tests/x86/mmio-access.c
@@ -51,6 +51,10 @@ void inmate_main(void)
 	mmio_write64(mmio_reg, pattern);
 	EXPECT_EQUAL(*comm_page_reg, pattern);
 
+	/* MOV_FROM_MEM (8b), 16-bit data, Ox66 OP size prefix */
+	asm volatile("mov (%%rax), %%ax" : "=a" (reg64) : "a" (mmio_reg));
+	EXPECT_EQUAL(reg64, (u16)pattern);
+
 	/* MOV_FROM_MEM (8b), 64-bit data, mod=0, reg=0, rm=3 */
 	asm volatile("movq (%%rbx), %%rax"
 		: "=a" (reg64) : "a" (0), "b" (mmio_reg));
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190604210229.23554-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
