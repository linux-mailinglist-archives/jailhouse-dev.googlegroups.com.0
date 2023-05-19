Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWN5T6RQMGQEYKXMO6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5270A0E2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:58 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f422dc5fafsf23011725e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528858; cv=pass;
        d=google.com; s=arc-20160816;
        b=XSXtWRSn/fDwggWlOzgd4mxai+nG2p5dosw7JxxrNIb9r/8QuKVGCS0ZagPYJLyv7e
         9cRgFgQs+xbJHbbdh1LGuXWu0/QuBSEYP6hTgOeeR5NDFYQpYrx6QevR3rQ2luEG54rp
         /S5wKCglFVJBH+LeWBFZoQxu45nfC1RiAJoHSijh7Ebu4mahHlCsVq1dAMX+mg79SkJX
         bANnqM7spjveSA8Xa+WQIuPSEjQ1ISyFhzdgQUl/5nsooRsZ9h4bLOkyXT+mb1U1UdNk
         /alhvvHC4YIGKq/Tl1Eig5R7nIBFK7gdtothzU3/+ikDgIRmEb/OWs2Pp+7xY2CPP2Vh
         Ox4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LOLHpBxwq0F46I+WQp8rwK/uRki7dJst2M9/8ocMoLQ=;
        b=ieMRKdfUrUQ9uMNHQGlwtZBREo5DcdSZN0hZkW+9SxF69VaRxaXcIbYI9ESVwKwZ3X
         A0ar3g5uTtingr6lOdXdRGykH0S/ZrczxQU4p3q0PMkkqtnXB0MUkWtiq5E2YzbLt1cK
         RTBbTyCTBtEAfJ5MSwAg1eqN75HercGdGGFzUv0aWchDkYV46R6diH1HlhxQ8+CeLwzn
         H5SSTWlOsLc6GHwthzjGe/nN9SCx78o5KkDuFlT/h3tpDBo0adQ5iJFCk2LMjZZut+49
         tf6Le6sAYO1XST5Zct3v+/6QfJ866dDIZfMVoyEhjB04+HgHSHQEzIc57ndjGb6WeKx4
         Uw4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOLHpBxwq0F46I+WQp8rwK/uRki7dJst2M9/8ocMoLQ=;
        b=lYL0J5rIq/cfv3hb7YEDHaRsUoxIQcLttKca68IAY81DSEPR3JfoU8T1kg+vc5IcRY
         V26O2MeTNW/Pnuwnp4+d2IhkRmErPW5K/Sk5iaiepRjSQiW7A223krAEXgtuzBOsL5fF
         5cpF4m3xkfkpPzy2Po8RK9YwdjFDhVNu4Z3bfEzSlwd7xMh4QJq4mN9nSMLmgPWY+at5
         id1EHN//m4g7BlkrbJEsSanwZo/K1Q2FiLo5t/5BhEBIr/6gOi+JLp3rGEWPvVKXguE5
         uGB/hIm8ttZ3Ox2X4Ok9dFWkRwQuhuHvTKji2CyfCo0DZFA0MEsVlsJ9e5I9IkN0rqj0
         fvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528858; x=1687120858;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOLHpBxwq0F46I+WQp8rwK/uRki7dJst2M9/8ocMoLQ=;
        b=SfzSFz+Oj57+IrKjFM3FMuEH5qhQ2resI48zlmXrkxfLdcmpb1U9t9LYnCMW2u0EZZ
         UV03OpQBT+6icCKikT7+4PO8hk0WywsqGQQqsSaRwmpfV+4Y2qwaAjc+JIC/3lsFPrCy
         K0ZqzIK2sc1pdbMZobjYlXFpGNGLogfmEJM+LqIdrr8oUzkMxUkMOmiEvyFE+0Oq+bph
         37qZ0xujvCSYCuxgJRSWpVJc+5Sb3vLnW8YIf/NVUK3k0E20dd+EEcLBj9OSKUwX0mcy
         r1Py1+QVF4I4sfNEfVGWarkClHLf4ag4zirHUX3Qo7v48r86UsfSspbaap69FrqhNEUg
         5jjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyXoyA3uxvYUhpUXryoTLgO4DoEgthbCfro/JavCSQ/fY5UFjKD
	h2r/lpEIuBOYsp/h+JQtHfs=
X-Google-Smtp-Source: ACHHUZ4jEDOQWrimhrXtGN40rMBuXFtHr2bPrSksSup0hCnOemP8sNG0KrMnNQiCvmRRExLFmBVA2Q==
X-Received: by 2002:a05:6000:148:b0:306:2869:a33b with SMTP id r8-20020a056000014800b003062869a33bmr603907wrx.2.1684528857721;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c97:b0:3f5:550:ddc8 with SMTP id
 k23-20020a05600c1c9700b003f50550ddc8ls1512800wms.1.-pod-prod-06-eu; Fri, 19
 May 2023 13:40:55 -0700 (PDT)
X-Received: by 2002:a5d:522a:0:b0:309:5af1:f7ce with SMTP id i10-20020a5d522a000000b003095af1f7cemr1188559wra.4.1684528855928;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528855; cv=none;
        d=google.com; s=arc-20160816;
        b=duiF4AWLlUl9NtI9Sr8WX/TjweL4yyBOGW6/pgR8g5/JqQyUiR6R/msRtSa2CmOqqQ
         ElE3tmV0CrE/kgVgnWXAe8dzXlYTPxC20H75XurVn1h3VL8MdrcERmW4QRTEGVGdZyHu
         z0xNfoPK1K56u+dUo0CZuysZIRR4gcd1D/1ERY8womzDKEFwEtLSCAKoAiYL+mANY8rd
         wHjgxzuSGO7bodkuuomP1V6hJYNpr2Uh8cVhPPaNmiT5JEcdbBEz4UChmJrFwEVBy6s3
         w8ZFWuDaqtbbj/F7rU7UxpdRg8W5QRfcpFpoA0T9z7z4DHJ+gT+IssSZTVYTMDgCcwW8
         zPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ax9n326LnD8LhmqX0ZluleaSK8A7EdezsVoSZQORUiM=;
        b=imLcaNm6FQniqX195u1K5AABiFZTMOGJld1Nw0drERsKJzFzsmTj7uJDtOGS/zZPDv
         zmG/jUIyVYdzI876p9hTG05n3H5QdK29fcxFoDW1g0CZGGtRTaKHViWYOumLc9cdBqqq
         Oz4zEk62a2XfzLRaLwfJk8dpL5B+saNkto+6y73YelPUjF9r5m2uiyM0Rz+drkwHn7zb
         6AuuNai03zvvscgS4TX35aRTxTyWCYluehXxaP8x87+I79UmAWeIZjylwSlx+BonM/YA
         ntRVoNL4fzL7YG/KKzNuCtkv7DTvh+UXcurU6dX1EcDFPI8O+ZGatxVnVb+3slhLUBJl
         huFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id bt16-20020a056000081000b00308f130be6esi2350wrb.0.2023.05.19.13.40.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdg2zCmzxpn;
	Fri, 19 May 2023 22:40:55 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 48/73] core: riscv: implement setup.c
Date: Fri, 19 May 2023 22:40:08 +0200
Message-Id: <20230519204033.643200-49-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

And do some heavy liftig.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: allow access to cycle counter]
[RFC v2: get vmm deactivation under control (didn't work with -O2)]
---
 hypervisor/arch/riscv/entry.S             |  65 ++++++++++
 hypervisor/arch/riscv/include/asm/csr64.h |   1 +
 hypervisor/arch/riscv/setup.c             | 137 ++++++++++++++++++++--
 3 files changed, 195 insertions(+), 8 deletions(-)

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
index 7b4b6a9e..f3cdfc06 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -2,37 +2,158 @@
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
+	csr_write(CSR_HSTATUS, 0);
+
+	return 0;
 }
 
-void __attribute__((noreturn))
-riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
+void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 {
-	while (1);
+	union registers *regs;
+	unsigned long tmp;
+
+	regs = &this_cpu_data()->guest_regs;
+
+	/* VSBE = 0 -> VS-Mode mem accesses are LE */
+	csr_set(CSR_HSTATUS,
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
+	csr_write(CSR_HVIP, tmp << VSIP_TO_HVIP_SHIFT); /* reinject pending */
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
 }
 
-void __attribute__((noreturn)) arch_cpu_activate_vmm(void)
+static unsigned long symbol_offset(const void *addr)
 {
-	while (1);
+	return (unsigned long)addr - (unsigned long)&hypervisor_header;
+}
+
+void __attribute__((noreturn))
+riscv_deactivate_vmm(union registers *regs, int errcode, bool from_ecall)
+{
+	void __attribute__((noreturn))
+		(*deactivate_vmm)(union registers *, int, bool);
+	unsigned long linux_tables_offset, bootstrap_table_phys;
+	u8 atp_mode;
+
+
+	linux_tables_offset =
+		symbol_offset((void*)hypervisor_header.initial_load_address);
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
+			       symbol_offset(&bt_tbl_l0);
+	/* Take Linux's MMU mode */
+	atp_mode = csr_read(CSR_VSATP) >> ATP_MODE_SHIFT;
+	enable_mmu_satp(atp_mode, bootstrap_table_phys);
+
+	/*
+	 * next access to regs will be under Linux's old page table, so amend
+	 * the address
+	 */
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-49-ralf.ramsauer%40oth-regensburg.de.
