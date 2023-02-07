Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZUGRGPQMGQEOQXEN6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022468D68C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:15 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id g27-20020a0565123b9b00b004d861df2daesf6233186lfv.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772774; cv=pass;
        d=google.com; s=arc-20160816;
        b=qPSDbKj5raDAMHbC81XR07p8eSx19Ysr/5ouB44lgElciLDR9r8B9ZQyk2hPUEUZZM
         xPSm33AuC3ezxIGYJ8sW7g6C6uAFWpwK9Ivk7Gu1D69F9gsrbbwjXh+SSQnbCfQYUjkP
         VYAcRoYuyHRXyiAHBQMNLW1c/Ovf2TXkEF+GODSrE21QcrtyPBHRCgu0vCq8BaT1JVIU
         6QWpSQDyGwUlyh0ItbHrHyI24HkoD1cIT5Nb+OjVP2BdTM9P1bM6Dh2ebtznE2HSYbUy
         PcUu6wruoXj72lqHVk4/SbE3LPG7UozlfHEMqCdstSuCLZcGU0pTiMtJmGbBPiPt7hZB
         3Wsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=sKhYHfL3qR/Pu2P6RNlWKUjucq8v7MrJ4Pj6bSWTATE=;
        b=i4ytQf6M0LIkSbIRau/TKye2vGP4Ew2yekSz9e3vw3q2+2GvXTwrRO4PKefIiTA19P
         UiuVUnaoACPZuYsPfg1wGzldgtf2TJUNAVGYXFNf9Zzw9CThXSS1A7wMshTzx0uU+zou
         odz1+1EBmxXSt/K+z+DOl0lNpRezEUPktAsyS17jRMXoxmB1gub1tUmj98dtOO3nuk3y
         mFYvzg6hd+qlnsuaGe3Xcrn7+6p7V1oQlmFAIG87tJC+iuq7X7pYYOdoqiIqG6rEoDMP
         Gvb8wfAp8Dwm++XoYLjxwPIt6YTi/4XyG8yQUs43vm/tcoITdDTiqpu7LVxeLfH99ARB
         lQ1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKhYHfL3qR/Pu2P6RNlWKUjucq8v7MrJ4Pj6bSWTATE=;
        b=NGfalhAfkUfYmSXry04MolkHoIIBSLuavCwRZsCBcANxLLUtMpnE5vzOWXQSH4xAFW
         JkNl0zugRleWeXmRMuuO4X1jimFjgUfZbJrOP9a2xvY2w33SDDiL6oplqA6TFlQyOuen
         Rim56zWRIgRnG153L22C7ArDFn4xmOvcABkkVl+vuFApTCAQfFUtf3IHVsRU6H8/3upt
         s4HCV05ghFRdu1rU/1a3wfbMSc0BAhSpnw05fuYVhryi9oFZEnQqvhRY+FgCmmrXmFnQ
         lWMyxCDrOZlIv/QIzGCjsgIXOUEm57K0UgK8BqKkqI+QwEC8OHHiLFwqr+NZaLIB7S4E
         5NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKhYHfL3qR/Pu2P6RNlWKUjucq8v7MrJ4Pj6bSWTATE=;
        b=U0WLlwGJXXdAA6hcIDSXVzehPDYcwBGBrlGoThgHXIc7uEKQZt5BFSDzf5sEaJTtLm
         9JxDJgRWgxxsWtK7sfr9AVdhrNPecYsavY9SiGfwIhJMbp65guttIQQACyejGwF+Pyhj
         7rlDIKSY7TuT3lg4VTTCbBmqoSAH6RMC1mM0sRDKdYQAsN5skTBbbJMfJAhFGwhSfsXV
         LfsmWc23RSgbVky74t6Y6adkGi2coguKXku4idMo/mU9UfFMe/wMZxB0kau9Ck7euVzh
         2FYDW8eoBocnJZQS/qjZx1g0OWhE33I90Qio48X29zLZqyQr4TY8LOH+yTCAaz25uicn
         kqXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXayVnmMClyWHefV3/43tnHjZWQPTPdQDFRfyP5bN7sePNpwJsX
	rfSZ2aZDTYzm4UmNJ//EMQA=
X-Google-Smtp-Source: AK7set91xYJXcQ3POAkvzpEcXUVq7Vx5MYT1C+/t60EgDhf3mQiD8EyT35NIB7hWfjenl0hAn5P//g==
X-Received: by 2002:a2e:8e73:0:b0:27f:b76d:2950 with SMTP id t19-20020a2e8e73000000b0027fb76d2950mr455918ljk.67.1675772774748;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10c9:b0:4d5:7ca1:c92f with SMTP id
 k9-20020a05651210c900b004d57ca1c92fls72111lfg.2.-pod-prod-gmail; Tue, 07 Feb
 2023 04:26:13 -0800 (PST)
X-Received: by 2002:ac2:5d72:0:b0:4d2:cbe3:ac18 with SMTP id h18-20020ac25d72000000b004d2cbe3ac18mr773582lft.39.1675772772971;
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772772; cv=none;
        d=google.com; s=arc-20160816;
        b=eW/vjUQOejQJy5xFkdh+1kRzbydV6xmOz4QaRXPkpbIaGZUlSPMnmmzzyvH2bS/6PA
         cqKMHSiwOrt7gEaVO7YgxmWiO9ZGcnSPiEXlcZilPbcRbECFZol0B9DgssEXLLv3Dkeo
         iBsGy2B98AvEXq2jAp/YUpxPNwZEQKdJEIJ9BQDrJFG25+UIa55sFcIHHxVeZrO/pnmV
         sRGvYaX87tG5k1wyMfrqkGvYWZMNzGVcdDDt9GdVj8pc3Dv0LYMLrYk4w0qIplPrvSqv
         8hoDJbLfW1aIFS2ffMW7imlzT2pqr+x9K59vCfJ/A9tnp8XmT5qz9yafRFPq1yKy17kO
         +BqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mzufbklGOaAv40anK+54LVKz0PRMWoS1tx03ZrmxPCI=;
        b=kb/7Ss8TrZfFpAobAsogIIIooLvvaSZSUa83r+gWJXQGTbAKk4+Kj8nuA3bzerf0kp
         rn5gtyiYXjjF6joPoqDU8Wt8E4ON3+0fPUMckW/rICjSUKc1JIY5l7dWo6wRrBG+p/FI
         HoE3syDnpADYXR1qipM4SNrjS0waaw4X0VGeANhaqCtKTFm/HN3Ds6VXfLUxIdWNrZX9
         CD+P4H9mNBP8AKMz64CkDFFlifHfnwL6nGI3hAwv/pUd0mwZkl8C88dbvtfbbaJx8veX
         xP0Ev9ogfVe/Te14UKQLtLPiyHJxcEo+O0SCShRENoQxaNKSOqN71DZqO5vcenUWICxL
         0t2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id f36-20020a0565123b2400b004a222ff195esi638109lfv.11.2023.02.07.04.26.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RS1v14zyLG;
	Tue,  7 Feb 2023 13:26:12 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 27/47] core: riscv: implement setup.c
Date: Tue,  7 Feb 2023 13:25:23 +0100
Message-Id: <20230207122543.1128638-28-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

And do some heavy liftig.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: allow access to cycle counter]
[RFC v2: get vmm deactivation under control (didn't work with -O2)]
---
 hypervisor/arch/riscv/entry.S             |  65 +++++++++++
 hypervisor/arch/riscv/include/asm/csr64.h |   1 +
 hypervisor/arch/riscv/setup.c             | 133 ++++++++++++++++++++--
 3 files changed, 191 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/riscv/entry.S b/hypervisor/arch/riscv/entry.S
index 524270cf..a7f1ce6e 100644
--- a/hypervisor/arch/riscv/entry.S
+++ b/hypervisor/arch/riscv/entry.S
@@ -353,4 +353,69 @@ virtual_arch_entry:
 
 	mv	a1, a0
 	mv	a0, sp
+	li	a2, 0 /* We don't come from an ecall */
 	j	riscv_deactivate_vmm
+
+
+.global __riscv_deactivate_vmm
+__riscv_deactivate_vmm:
+	/*
+	 * From now on, we can safely access stack variables, but we must not
+	 * use any absolute addresses. We may clobber a0-a7, use them as
+	 * scratch.
+	 */
+	csr_from_csr	satp, CSR_VSATP, a5;
+	sfence.vma
+	/* From here on, Linux's paging is active. */
+
+	/* Restore S-mode CSRs from VS-mode */
+	csr_from_csr	stval, CSR_VSTVAL, a5
+	csr_from_csr	scause, CSR_VSCAUSE, a5
+	csr_from_csr	sscratch, CSR_VSSCRATCH, a5
+	csr_from_csr	sie, CSR_VSIE, a5
+	csr_from_csr	stvec, CSR_VSTVEC, a5
+	csr_from_csr	sstatus, CSR_VSSTATUS, a5
+
+	/* If we didn't come here from en ecall, skip sepc setup */
+	beq a2, x0, 1f
+	/* scratch setup */
+	csrr	a3, sepc
+	addi	a3, a3, 4 /* ecall */
+
+	/* restore original sepc */
+	csrr a4, CSR_VSEPC
+	csrw sepc, a4
+
+1:
+	/* restore registers */
+	ld ra, 8(a0)
+	ld sp, 16(a0)
+	ld gp, 24(a0)
+	ld tp, 32(a0)
+	ld t0, 40(a0)
+	ld t1, 48(a0)
+	ld t2, 56(a0)
+	ld s0, 64(a0)
+	ld s1, 72(a0)
+	/* Skip clobbers a0 - a7 */
+	ld s2, 144(a0)
+	ld s3, 152(a0)
+	ld s4, 160(a0)
+	ld s5, 168(a0)
+	ld s6, 176(a0)
+	ld s7, 184(a0)
+	ld s8, 192(a0)
+	ld s9, 200(a0)
+	ld s10, 208(a0)
+	ld s11, 216(a0)
+	ld t3, 224(a0)
+	ld t4, 232(a0)
+	ld t5, 240(a0)
+	ld t6, 248(a0)
+	mv a0, a1
+
+	/* And we're done. */
+	beq a2, x0, 1f
+	jalr zero, a3, 0
+1:
+	ret
diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/riscv/include/asm/csr64.h
index 3c4fa00f..d0f39e8a 100644
--- a/hypervisor/arch/riscv/include/asm/csr64.h
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -136,6 +136,7 @@
 #define HGATP_VMID_SHIFT	22
 #define HGATP_VMID_WIDTH	7
 
+#define SCOUNTEREN_CY		0x00000001
 #define SCOUNTEREN_TM		0x00000002
 
 #ifndef __ASSEMBLY__
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 7b4b6a9e..eb925bcd 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -2,37 +2,154 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
 #include <jailhouse/entry.h>
-#include <asm/processor.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/percpu.h>
+#include <asm/csr64.h>
 #include <asm/setup.h>
 
+extern unsigned long bt_tbl_l0[PAGE_SIZE / sizeof(unsigned long)];
+
+void riscv_park_loop(void);
+void __attribute((noreturn))
+__riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall);
+
 int arch_init_early(void)
 {
-	return -ENOSYS;
+	int err;
+
+	err = riscv_paging_cell_init(&root_cell);
+	if (err)
+		return err;
+
+	parking_pt.root_paging = root_cell.arch.mm.root_paging;
+
+	err = paging_create(&parking_pt, paging_hvirt2phys(riscv_park_loop),
+			PAGE_SIZE, 0, PAGE_DEFAULT_FLAGS | RISCV_PTE_FLAG(G) |
+			RISCV_PTE_FLAG(U), PAGING_COHERENT | PAGING_NO_HUGE);
+
+	return 0;
 }
 
 int arch_cpu_init(struct per_cpu *cpu_data)
 {
-	return -ENOSYS;
+	struct public_per_cpu *ppc = &cpu_data->public;
+	unsigned long final_pt;
+
+	spin_init(&ppc->control_lock);
+
+	ppc->reset = false;
+	ppc->park = false;
+	ppc->wait_for_power_on = false;
+
+	ppc->phys_id =
+		jailhouse_cell_cpus(root_cell.config)[cpu_data->public.cpu_id]
+		.phys_id;
+	ppc->hsm.state = STARTED;
+
+	final_pt = paging_hvirt2phys(&ppc->root_table_page);
+	enable_mmu_satp(hv_atp_mode, final_pt);
+
+	return 0;
 }
 
-void __attribute__((noreturn))
-riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
+void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
+{
+	union registers *regs;
+	unsigned long tmp;
+
+	regs = &this_cpu_data()->guest_regs;
+
+	/* VSBE = 0 -> VS-Mode mem accesses are LE */
+	csr_write(CSR_HSTATUS,
+		HSTATUS_SPV | /* Return to VS-Mode */
+		(2ULL << HSTATUS_VSXL_SHIFT)); /* xlen = 64 */
+
+	csr_write(CSR_HEDELEG,
+		(1UL << EXC_INST_MISALIGNED) |
+		(1UL << EXC_INST_ACCESS) |
+		(1UL << EXC_INST_ILLEGAL) |
+		(1UL << EXC_BREAKPOINT) |
+		(1UL << EXC_LOAD_ACCESS_MISALIGNED) |
+		(1UL << EXC_LOAD_ACCESS) |
+		(1UL << EXC_AMO_ADDRESS_MISALIGNED) |
+		(1UL << EXC_STORE_ACCESS) |
+		(1UL << EXC_SYSCALL) |
+		(1UL << EXC_INST_PAGE_FAULT) |
+		(1UL << EXC_LOAD_PAGE_FAULT) |
+		(1UL << EXC_STORE_PAGE_FAULT));
+
+	csr_write(CSR_HGEIE, 0);
+	csr_write(CSR_HCOUNTEREN, SCOUNTEREN_CY | SCOUNTEREN_TM);
+	csr_write(CSR_HTIMEDELTA, 0);
+
+	tmp = csr_read(sip);
+	csr_write(sip, tmp); /* clear pending */
+	csr_write(CSR_HVIP, tmp); /* reinject pending */
+
+	riscv_paging_vcpu_init(&this_cell()->arch.mm);
+
+	/* Return value */
+	regs->a0 = 0;
+
+	csr_write(sepc, regs->ra); /* We will use sret, so move ra->sepc */
+
+	tmp = csr_swap(sscratch, regs->sp);
+	asm volatile("mv sp, %0\n"
+		     "j vmreturn\n" : : "r"(tmp));
+
+	__builtin_unreachable();
+}
+
+static unsigned long symbol_offset(const void *addr)
 {
-	while (1);
+	return (unsigned long)addr - (unsigned long)&hypervisor_header;
 }
 
-void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
 {
-	while (1);
+	void __attribute__((noreturn))
+		(*deactivate_vmm)(union registers *regs, int errcode, bool from_ecall);
+	unsigned long linux_tables_offset, bootstrap_table_phys;
+	u8 atp_mode;
+
+
+	linux_tables_offset = symbol_offset((void*)hypervisor_header.initial_load_address);
+
+	/* Do not return to VS-mode, rather return to S-Mode */
+	csr_clear(CSR_HSTATUS, HSTATUS_SPV);
+
+	/*
+	 * We don't know which page table is currently active. So in any case,
+	 * just jump back to the bootstrap tables, as they contain the old
+	 * Linux mapping of Jailhouse
+	 */
+	bootstrap_table_phys = system_config->hypervisor_memory.phys_start +
+		symbol_offset(&bt_tbl_l0);
+	/* Take Linux's MMU mode */
+	atp_mode = csr_read(CSR_VSATP) >> ATP_MODE_SHIFT;
+	enable_mmu_satp(atp_mode, bootstrap_table_phys);
+
+	/* next access to regs will be under Linux's old page table, so amend the address */
+	regs = (void*)regs + linux_tables_offset;
+	deactivate_vmm = __riscv_deactivate_vmm + linux_tables_offset;
+
+	/* Before switching back, we need to jump to original load location */
+	/* Get stack under control */
+	asm volatile("add sp, sp, %0\n" :: "r"(linux_tables_offset) :);
+	deactivate_vmm(regs, errcode, from_ecall);
 }
 
 void arch_cpu_restore(unsigned int cpu_id, int return_code)
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-28-ralf.ramsauer%40oth-regensburg.de.
