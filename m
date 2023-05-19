Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVV5T6RQMGQEYOYHMBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DAF70A0DA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:56 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 2adb3069b0e04-4f381431472sf2367097e87.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528855; cv=pass;
        d=google.com; s=arc-20160816;
        b=ne0fV48zF4QTMP5aaOIMHUMAuvPgNw8VEd1JLFVkH6iPG9n6l/8YphA+aS7oVHTdm7
         DdCfV4EQ5ykEDWKRE277E+xgdUeZdUr99GddQstL2TKWtAEcnn/gNs9AY/xamR8H30WU
         ODk86qsZ3n68GgE2/eCbUu8zQRrM5FYMWrsVAB+gBE7/j5mAcGHHxgeBhWDv+JqrFTqm
         FG2wett9QEWuuFDOL3eye5zb3S2d8kzNN8Sg6/E97c7LrFnNEHGoFLEhnT226nzYsMNL
         9Tbl7ecNtIT/y/ch0vXKccw/xf541RK3xOSBDi/gIzq3ndv7cnEfUkI2iOg9lCvp4kl9
         3sDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ryybrD1+btzy9wSBLYDHhqKDa6k8g8dp3K4hinRj3so=;
        b=vqUQq/IpurIFxbzzCqxoliCB0DBr4VW5mGktnE6Yhbi0qZyFahS967HZI06M6DIMrD
         yY60H8DQ3XaurpAy0oj4dG/N3iMUa0KFGm614cQo0YXTUfLD1wBahY1E0515kl8hu99L
         SdRHHIAWx75XteDKexN236/qQoVoMGEHZ00RmOYpLuI0z8om+Ecfqfwr0GgFbTCyEkgE
         xW7QDk7h7Kb3jxS7TbgGrjA5rmGrwKRZpwlH49Jhk4+8m2v0+oMfOglDLcPU1jMkGK7I
         j4QkU/iV4BMQgwxKYaBR6KDAQAJhZ7Kn/lTzEPitq07JPSmffwL4HLsWg+1uXsNpbu3V
         0mOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryybrD1+btzy9wSBLYDHhqKDa6k8g8dp3K4hinRj3so=;
        b=iDw7W0apukTHU5YHdlAPrbnsSaJ0cDYCG2ZoTTeWm1kg46XGRIO0dsWE+xMiA6RvtD
         3s774CUgsQAO06f32taEC8O6yXOBm3oc/RcYadl5OWVV7UikMFo91AH+UUom/RbvVyuq
         IGzy+eDwOz0khOsK0/xCEm66sWAEtnhNNchaTcZZn9tBD90xZyo8e2Ac+1SHChDv2iG5
         WxzCzktTasH3zTRlEMrSDHH6OvsGoEACt2C1XLyIJOtfC/hWN/UtmqFyHAiUk8WsG+3d
         IQZav/MICZSlTpl8Uepnglie02fTES6YsKrLWSGSmj/nKDClq50RnGDKp0ChxJqLJLlC
         WuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528855; x=1687120855;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryybrD1+btzy9wSBLYDHhqKDa6k8g8dp3K4hinRj3so=;
        b=V/KyfM2teRS6GUCz/ZcFI0xRq5MbvQzqj1jPg5G3gWOqy8sAAqYRVcJXiafK9VwEUt
         66hE2rRzasOtHYmaF7fPza3fYF2hfkZ+1fLEm9gwg+Gz9JekNn/IlGEatyd6EBqNfH56
         C7jQ2RytqTewiXI7RNGA4vTEaVSPs0jGZkkFqtVm2WdbyblVM7CyWSX7lyL8oARUT+i5
         tVUCcGBO45FxHx+s15IRb6BRr3q2ex/vcE//F2i8gaTDAJYYEOQPpBJEMl0oGCVTOuc1
         R0vJ7kf2DHc02Co5O4VI0I49rCpSQlMjdT7qTHjdaHcxeLoZNDX2+iWisCHGj6uX3vnS
         2uYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzbKPp0xChmXSLwOB9RXrXHGi45GxJccoa+7g8PPMH8kR4/dLhO
	m/9wLPFQ34EmWyZbGvVtuDE=
X-Google-Smtp-Source: ACHHUZ72XAm6Pme4kIjS9wMTYyHkDfipLC3i4incX97gt1LDNhtgOR/g9iy3FAepOo+8xZdncoub1A==
X-Received: by 2002:ac2:4a9a:0:b0:4f3:a4ab:a432 with SMTP id l26-20020ac24a9a000000b004f3a4aba432mr854302lfp.6.1684528855305;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a99c:0:b0:2af:1a18:4819 with SMTP id x28-20020a2ea99c000000b002af1a184819ls143081ljq.0.-pod-prod-05-eu;
 Fri, 19 May 2023 13:40:53 -0700 (PDT)
X-Received: by 2002:ac2:5991:0:b0:4db:1e4a:74a1 with SMTP id w17-20020ac25991000000b004db1e4a74a1mr1129225lfn.0.1684528853412;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528853; cv=none;
        d=google.com; s=arc-20160816;
        b=iQixUYmQAcWTLnXbeC/XI4+T1VnSH3zVoa55+p8LzBXqbApD5SoGxQ/laqhvujSFkC
         AJDo133Za35TG+U3vGKA5Imx657yZ8hIW6qsJTkTqesgB7vencFNPxq1FdCdB3iGgS+h
         w+gy2OU2DKqPR1fThfo3bCtiLKlLRAgKD3AxeA1gtZDRYK2f8HtV4ulRLespOdwqLOhU
         jcc7sI2q/cTaEMAqeVaA4/aWKyZR+9ouS4IDvZ7cYb2kAjICJRa0JtGtR1mDts80kQZ5
         tTit1KAn5X2D/eWV5EbAKFGdoHZQKVqf3om6ulbB/0+0DXkOE8A/PCV7QZS0+XowTQmv
         xtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=c2KKEEi5++3kC0lTVrGxRG+qfjP9FYULYI8jJAX7GSw=;
        b=Vai9eP2RPZvYpMeUU01AC75wo0BANXQIs7vy9Kl/wPEhrM/gmniQQPF5g6DopnV/Av
         w1H+MncP3dL7XHqo5WW4ifoGETatqFTdfPANjCZWHZGxUF3yQ12T8bQV+miWwgkPMp28
         geMqKmuqkolN+zla+mspnjP5AwdelSPmwVR3L1AAUt9ZPIFnS//TRdWM9mzlP1DBz2Wm
         mDEXMscxay+VRYGx64sYj3VsqFO8MtETxXFHktmNlhbcqlSdpCP6fOWm5nCmsBBr42vu
         zB5bRJ9pZiOOqfYk+mNn0ZZG45XY1Gv7IYs8lA7DAS23Ipydn7k+Ks5/2ri9kXkxLRjl
         uWNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id bp29-20020a056512159d00b004f194563eb7si8208lfb.10.2023.05.19.13.40.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdc3dWBzxtl;
	Fri, 19 May 2023 22:40:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 39/73] core: riscv: Hypervisor entry code
Date: Fri, 19 May 2023 22:39:59 +0200
Message-Id: <20230519204033.643200-40-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_MEDIA_BODY 0, __CTE 0, __FRAUD_MONEY 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FRAUD_MONEY_VALUE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Now we have to think of Jailhouse's memory layout.

RISC-V has a bunch of MMU variants SVxx (SV39, SV48, SV57), while xx
denotes the number of virtually adressable bits. And there's an
exceptional case: If bit xx-1 is set in a vaddr, then all bits >= XX
must be 1.

For the virtual HV location, we need a virtual address that is valid for
each MMU type. Let's virtually place the hypervisor at the topmost 16
MiB of a SV39. This results in address 0xffff_ffd0_0000_0000.

On RISC-V, Linux could map the hypervisor to any virtual location, so we
need to setup bootstrap page tables that help us to jump to our link
location. Now this gets funny, as we need to support ALL MMU types for
the trampoline, as Linux might map us to a very high address.

The position-independent startup/trampoline code sets up a trampoline
that consists of two entries:
  - Virtual Linux Load Location -> physical HV memory
  - 0xffff_ffd0_0000_0000       -> physical HV memory

The startup code will create and activate this table, and jump to the
destination address where it was linked. From now on, we can use
position-dependant code.

Later, those trampoline page tables will not be destroyed, as we can
reuse them when disabling the hypervisor, or when errors occur during
startup.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild                  |   4 +-
 hypervisor/arch/riscv/entry.S                 | 349 +++++++++++++++++-
 hypervisor/arch/riscv/exception.S             |  91 +++++
 .../arch/riscv/include/asm/jailhouse_header.h |  24 +-
 hypervisor/arch/riscv/include/asm/setup.h     |  14 +
 hypervisor/arch/riscv/setup.c                 |  10 +-
 6 files changed, 481 insertions(+), 11 deletions(-)
 create mode 100644 hypervisor/arch/riscv/exception.S
 create mode 100644 hypervisor/arch/riscv/include/asm/setup.h

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 75252531..7809007c 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,5 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o traps.o
-lib-y += lib.o
+lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o paging.o
+lib-y += pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/entry.S b/hypervisor/arch/riscv/entry.S
index def55516..524270cf 100644
--- a/hypervisor/arch/riscv/entry.S
+++ b/hypervisor/arch/riscv/entry.S
@@ -2,16 +2,355 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-	.text
-	.globl arch_entry
+#include <asm/asm-defines.h>
+#include <asm/csr64.h>
+#include <asm/paging.h>
+
+#define SSTATUS_INITIAL (SR_SPIE | SR_SPP | SR_FS_DIRTY | \
+			 SR_VS_DIRTY | SR_XS_DIRTY | SR_UXL_64)
+
+#define PAGING_FLAGS_NEXT_LEVEL	RISCV_PTE_FLAG(G) | RISCV_PTE_FLAG(V)
+#define PAGING_FLAGS_BOOTSTRAP	PAGE_DEFAULT_FLAGS | RISCV_PTE_FLAG(G)
+
+/*
+ * hideleg needs to be set early, otherwise vsip/vsie are forced to 0. Bits set
+ * here causes aliasing of VSIP/HIP and VSIE/HIE
+ */
+#define INITIAL_HIDELEG \
+	((IE_SIE << VSIP_TO_HVIP_SHIFT) | \
+	(IE_TIE << VSIP_TO_HVIP_SHIFT) | \
+	(IE_EIE << VSIP_TO_HVIP_SHIFT))
+
+#define INITIAL_SIE (IE_SIE | IE_TIE | IE_EIE)
+
+.macro csr_from_csr vsreg, sreg, t
+	csrr	\t, \sreg
+	csrw	\vsreg, \t
+.endm
+
+.macro load_csr	csr, temp, value
+	li	\temp, \value
+	csrw	\csr, \temp
+.endm
+
+.macro access_config op, reg, offset
+	\op	\reg, \offset (t4)
+.endm
+
+.macro ld_constant reg, constant
+	ld	\reg, %lo (pool_\constant - constant_pool) (t6)
+.endm
+
+.macro bootstrap_page macro
+	.irp page,\
+		bt_tbl_l0,\
+		bt_tbl_l1_0,\
+		bt_tbl_l2_0,\
+		bt_tbl_l3_0,\
+		bt_tbl_l1_1,\
+		bt_tbl_l2_1,\
+		bt_tbl_l3_1
+	\macro	\page
+	.endr
+.endm
+.globl bt_tbl_l0
+
+.macro define_page page
+	.p2align RISCV_PAGE_WIDTH
+	\page:
+	.skip (1 << RISCV_PAGE_WIDTH)
+.endm
+
+.macro pool_constant symbol
+	.p2align 3
+	pool_\symbol:
+	.8byte	\symbol
+.endm
+
+/*
+ * level: 0 for 4 KiB leaves
+ * virt: virtual address to map
+ * pte: pte contents: phys addr for leaves, sub node otherwise; clobbered
+ * table: node to write pte to
+ * temp: clobberable register
+ * flags: PTE flag bits
+ */
+.macro riscv_pt_write_pte level, virt, pte, table, temp, flags
+	ori	\pte, \pte, \flags
+	/* RISC-V uses 12-bit _signed_ immediates, so extracting the
+	 * least-significant 12 bits can't be done in a single instruction of
+	 * the base ABI
+	 */
+	srli	\temp, \virt,\
+			(RISCV_PAGE_WIDTH + (\level) * RISCV_PTES_PER_NODE)
+	andi	\temp, \temp, 1 << (RISCV_PAGE_WIDTH - RISCV_PTE_SIZE) - 1
+	slli	\temp, \temp, RISCV_PTE_SIZE
+	add	\temp, \temp, \table
+	sd	\pte, 0 (\temp)
+.endm
+
+.macro riscv_pt_write_address level, virt, addr, table, temp, flags
+	srli	\addr, \addr, 2
+	riscv_pt_write_pte	\level, \virt, \addr, \table, \temp, \flags
+.endm
+
+.macro write_table lvl, table, dst, flags
+	la	t0, \table
+	ld_constant	t3, \dst
+	add	t4, a2, t3
+	riscv_pt_write_address   \lvl, t2, t4, t0, t5, \flags
+.endm
+
+.macro sv57_map_2M l0, l1, l2, l3, phys
+	write_table	4, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	3, \l1, \l2, PAGING_FLAGS_NEXT_LEVEL
+	write_table	2, \l2, \l3, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l3, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+.macro sv48_map_2M l0, l1, l2, phys
+	write_table	3, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	2, \l1, \l2, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l2, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+.macro sv39_map_2M l0, l1, phys
+	write_table	2, \l0, \l1, PAGING_FLAGS_NEXT_LEVEL
+	write_table	1, \l1, \phys, PAGING_FLAGS_BOOTSTRAP
+.endm
+
+/* place large constants into here */
+.section .rodata
+pool_constant	virtual_arch_entry
+bootstrap_page	pool_constant
+
+.p2align 3
+constant_pool:
+.p2align 3
+pool_jailhouse_base:
+	.8byte	JAILHOUSE_BASE
+
+.section .data
+	bootstrap_page	define_page
+	.purgem	define_page
+
+.text
+.globl arch_entry
 arch_entry:
-	li	a0,-55
-	ret
+	/*
+	 * a0: cpuid
+	 * t5: hypervisor_header
+	 * t6: __page_pool
+	 */
+	la	t5, hypervisor_header
+	la	t6, __page_pool
+
+	/*
+	 * t1: max_cpus
+	 * t2: sizeof(struct per_cpu)
+	 * Note: this would also be available directly: sizeof$struct$per_cpu
+	 */
+	lw		t1, HEADER_MAX_CPUS (t5)
+	lw		t2, HEADER_PERCPU_SIZE (t5)
+
+	/* t4: configuration area */
+	mul	t2, t2, t1
+	add	t4, t2, t6
+
+	/* t6: constant_pool */
+	la	t6, constant_pool
+
+	/*
+	 * these pages are used during the initialization phase currently, they
+	 * are not reclaimed afterwards. Create a "bootstrap" paging table
+	 * that maps the the hypervisor image to the logical/physical addresses
+	 * it was linked and also where it was currently linked.
+	 *
+	 * In case of any MMU variant, we always need to map 2M-Pages.
+	 * Depending on the MMU variant, this may require different 'n' levels
+	 * of page tables.
+	 *   SV39: 2 levels
+	 *   SV48: 3 levels
+	 *   SV57: 4 levels
+	 *
+	 * We always require one root table, and then (n-1)*2 subtables.
+	 *   SV39: 1+1*2 = 3 pages
+	 *   SV48: 1+2*2 = 5 pages
+	 *   SV57: 1+3*2 = 7 pages
+	 *
+	 * The problem is the location of those page tables. For the worst
+	 * case, SV57, which we need to prepare for, we would need to reserve 7
+	 * pages somewhere. If we then land on a SV39 system, we waste 4 pages
+	 * (16KiB).
+	 *
+	 * So for the moment, simply always statically allocate 7 pages that
+	 * are dedicated for the bootstrap page tables. We can't reclaim
+	 * memory, as we need those bootstrap tables for the rollback
+	 * trampoline, when disabling the hypervisor.
+	 *
+	 * An alternative I could think of is to allocate those pages at the
+	 * very end of hypervisor_mem. We could fill pages, and mark those
+	 * pages as used during arch_paging_init. This way, we wouldn't waste
+	 * any memory, but it's more complex. For the moment, let's implement
+	 * the simple variant, and allocate 7 pages.
+	 *
+	 * Just some further notes:
+	 * If Linux chose to select, for example, SV48, the the bootstrap
+	 * tables MUST also select SV48. This is, because there's a 99% chance
+	 * that Linux chose an address to remap Jailhouse that is only
+	 * adressable with a SV48. Hence, the trampolin page tables must also
+	 * be at least SV48. Later, when setting up the final tables, we could
+	 * switch down to SV39. This is recommendable, as it requires less page
+	 * table lookups.
+	 *
+	 * t0: Lx VA bootstrap_table_l0
+	 * t3: JH VA of bootstrap_table_hypervisor_l1
+	 */
+	ld_constant	t2, jailhouse_base
+	/* a3: jailhouse_memory.phys_start */
+	access_config	ld, a3, CFG_PHYS_START
+	/* a2: virt_to_phys; phys = virt_to_phys + virt */
+	sub	a2, a3, t2
+
+	/* Get MMU-Variant that Linux currently uses */
+	csrr	a4, satp
+	srli	a4, a4, ATP_MODE_SHIFT
+	/* And choose the same variant for the bootstrap tables */
+	li	t2, ATP_MODE_SV39
+	beq	a4, t2, sv39
+	li	t2, ATP_MODE_SV48
+	beq	a4, t2, sv48
+	li	t2, ATP_MODE_SV57
+	beq	a4, t2, sv57
+
+	/* Unknown MMU type if we reach that */
+1:	wfi
+	j	1b
+
+	/* virt must be held in t2 */
+sv39:
+	ld_constant	t2, jailhouse_base
+	sv39_map_2M	bt_tbl_l0, bt_tbl_l1_0, jailhouse_base
+	la		t2, arch_entry
+	sv39_map_2M	bt_tbl_l0, bt_tbl_l1_1, jailhouse_base
+
+	li	t0,	ATP_MODE_SV39
+	j	setup_satp
+
+sv48:
+	ld_constant	t2, jailhouse_base
+	sv48_map_2M	bt_tbl_l0, bt_tbl_l1_0, bt_tbl_l2_0, jailhouse_base
+	la		t2, arch_entry
+	sv48_map_2M	bt_tbl_l0, bt_tbl_l1_1, bt_tbl_l2_1, jailhouse_base
+
+	li	t0,	ATP_MODE_SV48
+	j	setup_satp
+
+sv57:
+	ld_constant	t2, jailhouse_base
+	sv57_map_2M	bt_tbl_l0, bt_tbl_l1_0, bt_tbl_l2_0, bt_tbl_l3_0, \
+			jailhouse_base
+	la		t2, arch_entry
+	sv57_map_2M	bt_tbl_l0, bt_tbl_l1_1, bt_tbl_l2_1, bt_tbl_l3_1, \
+			jailhouse_base
+
+	li	t0,	ATP_MODE_SV57
+	j	setup_satp
+
+setup_satp:
+	ld_constant	a3, bt_tbl_l0
+	add	a3, a2, a3
+	srli	a3, a3, RISCV_PAGE_WIDTH
+	slli	t0, t0, ATP_MODE_SHIFT
+	or	a3, a3, t0
+
+	sfence.vma	zero, zero
+	csrrw	a4, satp, a3
+	csrw	CSR_VSATP, a4
+
+	ld_constant	t1, virtual_arch_entry
+	/* leave pos independant code with this jump */
+	jalr	t0, t1, 0
+
+	# a0 ... cpuid
+	# a2 ... physical - virtual address offset
+	# a3 ... bootstrap satp
+	# a4 ... linux page table root	(currently unused)
+	# ra ... linux return address
+	# t0 ... return address for call from arch_entry
+virtual_arch_entry:
+	# set up stack pointer -- this is hart-dependent
+
+	# percpu data = pool + cpuid * percpu_size
+	la	t1, __page_pool
+
+	la	t6, hypervisor_header
+	lw	t2, HEADER_PERCPU_SIZE (t6)
+
+	mul	t2, t2, a0
+	add	a1, t2, t1
+	# a1 ... percpu data
+
+	mv	t6, sp	# need to restore this later
+
+	li	t1, PCPU_GUEST_REGS
+	add	sp, a1, t1
+
+	sd	t6, REG_SP (sp)
+	sd	ra, REG_RA (sp)
+	sd	t0, REG_T0 (sp)
+	sd	gp, REG_GP (sp)
+	sd	tp, REG_TP (sp)
+	sd	s0, REG_S0 (sp)
+	sd	s1, REG_S1 (sp)
+	sd	s2, REG_S2 (sp)
+	sd	s3, REG_S3 (sp)
+	sd	s4, REG_S4 (sp)
+	sd	s5, REG_S5 (sp)
+	sd	s6, REG_S6 (sp)
+	sd	s7, REG_S7 (sp)
+	sd	s8, REG_S8 (sp)
+	sd	s9, REG_S9 (sp)
+	sd	s10, REG_S10 (sp)
+	sd	s11, REG_S11 (sp)
+	# fp is s0 -> fp is restored
+
+	# vsstatus receives value of sstatus
+	csr_from_csr	CSR_VSSTATUS, sstatus, t1
+
+	li	t1, SSTATUS_INITIAL
+	csrw	sstatus, t1
+
+	load_csr	CSR_HIDELEG, t1, INITIAL_HIDELEG
+
+	csr_from_csr	CSR_VSIE, sie, t1
+
+	load_csr	sie, t1, INITIAL_SIE
+
+
+	csr_from_csr	CSR_VSCAUSE, scause, t1
+	csr_from_csr	CSR_VSTVAL, stval, t1
+
+	csr_from_csr	CSR_VSSCRATCH, sscratch, t1
+	csrw	sscratch, sp
+
+	csr_from_csr	CSR_VSTVEC, stvec, t1
+	la	t1, nested_exception_handler
+	csrw	stvec, t1
+
+	jal	ra, entry
+	/* return from entry means an error occurred */
+
+	mv	a1, a0
+	mv	a0, sp
+	j	riscv_deactivate_vmm
diff --git a/hypervisor/arch/riscv/exception.S b/hypervisor/arch/riscv/exception.S
new file mode 100644
index 00000000..0c623602
--- /dev/null
+++ b/hypervisor/arch/riscv/exception.S
@@ -0,0 +1,91 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/asm-defines.h>
+
+.macro  load_csr        csr, temp, value
+	li      \temp, \value
+	csrw    \csr, \temp
+.endm
+
+.macro context_save_all cmd
+	.irp reg 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, \
+		 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
+		\cmd    x\reg, 8*(\reg)(sp)
+	.endr
+.endm
+
+/*
+ * This entry point is used when the hypervisor has been entered already. The
+ * existing stack is reused.
+ */
+.align 4
+.globl nested_exception_handler
+nested_exception_handler:
+	/*
+	 * We reuse the old S-Mode stack, so make some place for union
+	 * registers. We must not acces this_cpu()-related stuff, as this will
+	 * point to the old register set. But it's not necessary, as nested
+	 * exception only occur in rare situations, and only one of them (hlvx)
+	 * is recoverable. Performance isn't an optimisation criteria, as a
+	 * nested exception of hlvx will lead to a crash of the cell in any
+	 * case.
+	 */
+	addi	sp, sp, -REGISTERS_SIZE
+	context_save_all sd
+	mv	a0, sp
+	addi	a0, a0, REGISTERS_SIZE
+	sd	a0, REG_SP (sp)
+	addi	a0, a0, -REGISTERS_SIZE
+
+	jal	arch_handle_fault
+
+	context_save_all	ld
+	addi	sp, sp, REGISTERS_SIZE
+	sret
+
+/*
+ * This entry point is used when the guest is running.  A new stack needs to be
+ * established (and is taken from sscratch).
+ */
+.align 4
+.globl exception_handler
+exception_handler:
+	csrrw	sp, sscratch, sp
+	context_save_all sd
+
+	csrr	t1, sscratch
+	sd	t1, REG_SP (sp)
+
+	la	a0, nested_exception_handler
+	csrw	stvec, a0
+
+	mv	a0, sp
+	jal	arch_handle_trap
+
+.globl vmreturn
+vmreturn:
+	la	a0, exception_handler
+	csrw	stvec, a0
+
+	context_save_all ld
+	csrrw	sp, sscratch, sp
+	sret
+
+.p2align	12
+.globl riscv_park_loop
+riscv_park_loop:
+	wfi
+	j riscv_park_loop
+.p2align 12
diff --git a/hypervisor/arch/riscv/include/asm/jailhouse_header.h b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
index a0c22083..c4e1c24c 100644
--- a/hypervisor/arch/riscv/include/asm/jailhouse_header.h
+++ b/hypervisor/arch/riscv/include/asm/jailhouse_header.h
@@ -4,11 +4,29 @@
  * Copyright (C) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#define JAILHOUSE_BASE			__JH_CONST_UL(0xffffffdfff000000)
-#define JAILHOUSE_BORROW_ROOT_PT	1
+/*
+ * RISC-V defined architectural constraints on the address space:
+ * Address immediates are sign extended.
+ *
+ * lui+jalr can jump to absolute addresses +-2 GiB around zero
+ *  --> this best left free for millicode routines (or boot ROM),
+ *      at least on 64-bit machines.
+ *      This is the range 0xffff_ffff_8000_000--0x0000_0000_7fff_ffff
+ *
+ * Legal virtual addresses are sign extensions of the most-significant bit
+ * mapped by the virtual addressing mode; e.g., in Sv39, bits 63:39 of an
+ * address must be a copy of bit 38. Hence, the lowest (signed) address
+ * available is 0xffff_ffc0_0000_0000.
+ *
+ * Linux normally maps itself at 0xffff_ffe0_0000_0000 and modules at
+ * 0xffff_ffd0_0000_0000.
+ */
+
+/* this provides 16 MB of space for the Jailhouse core */
+#define JAILHOUSE_BASE			0xffffffdfff000000
diff --git a/hypervisor/arch/riscv/include/asm/setup.h b/hypervisor/arch/riscv/include/asm/setup.h
new file mode 100644
index 00000000..d8ba88db
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/setup.h
@@ -0,0 +1,14 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022-2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 53cdce80..7b4b6a9e 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -4,13 +4,15 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
 #include <jailhouse/entry.h>
+#include <asm/processor.h>
+#include <asm/setup.h>
 
 int arch_init_early(void)
 {
@@ -22,6 +24,12 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 	return -ENOSYS;
 }
 
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
+{
+	while (1);
+}
+
 void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
 {
 	while (1);
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-40-ralf.ramsauer%40oth-regensburg.de.
