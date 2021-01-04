Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7PIZT7QKGQEH2CFO4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F352E988A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:06 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id g16sf13488926wrv.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774206; cv=pass;
        d=google.com; s=arc-20160816;
        b=ternI/aMwgihabQV9mrnnOENkEUGtFMZ+zjuG8SvGlKeENp8dg8fRbcuRLRY+w3unN
         igR1jQtRpGav81IpUKOQUpnOt2StiIEDsPOGA98C2w5Zz1XTVbOmIIf5IXeDoolRGg0h
         GZTMVbU3gPvrIgxfT7JTbCC40SG/O9CzyJeMvvw8U2nWrVPYe/J2/b/Dn1QRoTS5B1Ut
         bVDuGh+DcCSoJ6d9E1DXwkfR4T0oEFwXDCM0fWAUlTNmEh8dc8uLDiQ4/BZu+Kbpl8+B
         bHAuFC7MZGSW99I4wJVNFjcs+2k/L+dItIh7cb1Z9WFahgzSNDNldpTonQru5GlXE28K
         wafA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=3gkFfHYf53G8J+vJPIUyHNoWBTzCw9QTQtocyV18nsM=;
        b=R/Jqpen7FI1Jgmo6rt7y5R1mA79keKcsLwG5Ea73xsWLMA/WimPN3BqUfhKkAG8Atj
         n0mhli4gjenzz5p0PjrK86ejEAJQHmc8cfahspm4bXp5svKMGtgA1aAml/6Uhnon8QJs
         vqGdMubgZ2MMUeDYA71GxV3yAl36U/kf+FEnmuBqxsbYay3J4ddDIqJ0x+a0GTcRXYB3
         yC1njWSDx1ekp8Cu5tQJCW/OTbP8cw3co12rnnwSdIcN1zc/xlFlLqM+naacPvJCvmuZ
         SdTMcF8qyW7nejKf7DST7qsd3jcRyx0mz9cqqeZmUMtYn/25FV2TzHaOB8TZZ83Ul54V
         71rQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YlfjsuQk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3gkFfHYf53G8J+vJPIUyHNoWBTzCw9QTQtocyV18nsM=;
        b=hwN1nzcZ59nm6EdshOhVnIYe0MJ1c+zPsjmgS2xog9yy1qlfBCm3c57MZkUkUTKq+B
         2+4c/zi2LcgqSvVSYJ1gSrhzirQ/klf7WSXGHmF3m1T9GbF2vtajgyBsasO+iECjhLq/
         qU+S/MzGPcM5qc0lmILKyhK0GRdbPeoSBcZmh89bpowlB20GLvNkPzfRfaTvX6gUbj07
         xYtZMhL7Lx2YJs1V6Fg/ekHCv+J063WNkgsu5cUmKYXN/NKLhVCGpr4nKYB1aY45FDYc
         2P1lmClY0Z/5Hqa1Zsl19NftktbLuORu9aleMCmSqxKmytxCA1jMiL1BIs+vFKNUoRjD
         uIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3gkFfHYf53G8J+vJPIUyHNoWBTzCw9QTQtocyV18nsM=;
        b=FE/Mdha0cKyY4+Z3zKm23mQ4MZZl8xJEUsZcsSKyprVpaJc6m8FRAGs6cZciX0BsP9
         3Fbgxb8oIPJpw982b7SZQ9CHeQ94unlB0ilmg1KW+j936AYlrX+2gs57oOnxheKGOvCA
         73J2hw2rY2PepFiI8EsbMMtCH6Pp3nKW9aItVD2j7/NZDWXgPiIBuJjv8l63FOaJZkFW
         B0NGlsi4r95SY44YsIDrYflh8X5GkExBwx8GDZYj5yHsU8oNSvB1xUiV2KgEKBbWTUOQ
         29T6aYmkdoocGIEsBYkL4Z93oRULG6aeOVL56WIcdXTF7ijUuH7af3ycYZfRRjk2jaEG
         mHfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cvb7G77d5imvpFTd8Xkifq20N9PKkJhov4RXxGSuATXMsdDg6
	wXicDTF47QlnXlzZHsj5BsA=
X-Google-Smtp-Source: ABdhPJz1zVP6QsmGSUXz691vhHura8hD7NV0ZsDp3SnBAGv0BVNbUDM8P3qvaHWVc91HOXocIzbloQ==
X-Received: by 2002:a1c:b7d4:: with SMTP id h203mr27643169wmf.59.1609774206376;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:66c5:: with SMTP id k5ls860112wrw.3.gmail; Mon, 04 Jan
 2021 07:30:05 -0800 (PST)
X-Received: by 2002:adf:e688:: with SMTP id r8mr79314260wrm.20.1609774205216;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=MkcRRY8loRWf4QRp/8BrKRd0+9LtxnMdhYdgDj8trge4O/5Mhym7KGhPGsouelanK9
         aCjNlnxMb3JEAhGAEQMo+Y+0OY5uRkodxEe+3Dww7sHZLdux92ZInjpQHJyey9UK3kto
         +3DDgb4xEDSuaaeX0PQfRDR7YJh7CIjEwPiwsQCwyDi5/rjA5fCVC2vqMa5I9myJfxl3
         DK1y1KRwvR37NtO1+vULXAnpyZV1L+TnYI3CWFtiUZRWfLuHK+ovwoPL05ceWOrxoVRV
         v+4M48LG9UI4fynqYAc5od3nD3daCy+tnBnAVcV6v7KGct4axIV/+GyaWpm+wPb5OT/+
         OmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=7XtSnA+GczbXqBRe6NMKymbhgr10102yVCVf0wDqcVc=;
        b=Zv6llyU4VUu8gwyLnu9REi7ChUEgiZSqfPj6bM64PHMj8NEH8DWKSAZKSB5p2I205a
         20DkX6cTy4xVx2u4SiXAKkkPRuq71U6lc0PWroKAatDMfKfrm8+6A/Cg2HMyWNj0tOJM
         zR0r7QfIsIREBivTvmFS25tbxLRTz8bQqrtzPK/z6EPMsPkzP/68ExqEZ8tyztP9jCDw
         ocfeRlbeuAF5OWen2IkBqHjJUfA1DHLqjg6J557NX/z7OjymoiKuU/f4rwsR1fB4cmDC
         bQ72QVHEjlWVrMKMgXtdgB02z+/wvG8ROJP6VPAhOCIUQzsdaYTBYlqqWFOQtG6QtsAn
         mJPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=YlfjsuQk;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id o135si7017wme.3.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MYLii-1kR7Ow3Unq-00VXdG for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:04 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 3/9] arm: Fix access to SPSR from EL2
Date: Mon,  4 Jan 2021 16:29:53 +0100
Message-Id: <9638d507b2f979e0c46a3b557372166408f91b20.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0Iw/N/81pI+lPkC48cIBvauUEvzBVuFvB7L33yIv8Xkr9bA6Y58
 ZEviTTRwhg8C5earH7QltWaManWArbl9xw25CdRqjcHcPvBoFBEEniFQBm520K3rdI5gXoj
 9KjcEXGJAiDG4sUnRK2ND5xeKkb7PKmH6gHzHCLg5dg+Nll7aaaGbyNvDVoyyoXCXIbvB5L
 httwFX/916GKvLcqRnfmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7TRaWHEYK3s=:DT7F175IZmOCa6a/WpsePS
 /rD6nRZ/IOHhUXZBxDfBiLckC8qBFke0p5Bw0EfUa64VBRWaBysHMatYr9jzSQYkgQlMknVep
 BBfVBiWawH7q4Um3vHP0v0mkptfdBAvt4IOJ7ZPuhpNpvuYUfx0/k6/dNQYIDo+lkeXijNI30
 Qd8hAEtYjUd7iARmnecO1+sl6qs6LJmhMn+8NJGxcpXlYQpAymfWNR29tlvOHXxgwvc+hapIH
 PFKM+pnXl91Hfhm07bjFFFgRAfSai6eb5yNhMvXr7Uz3V+2CPN1u8dPVfanSqAruNbnnJlElJ
 4h1VeA0rl682C8jl630Nk+mDX6CUdoksHMLx4/bdpBfpSfjqMkca19vYJ6dlCMhOQyJV4PnFe
 vxql3T94lfPheMK9pCxQRN6tn3wWHvy9Xvdm6Ld3q8ymrg8ru0SlIVX0sp+b4x/yPibL4q39y
 Lht1Y+oxe9Bm3UsJudk/VsJpZTQbznVLcVtfgcjdrswIJcLs8THQBoPsc8O7VTtP4HktlRIg+
 9CWQocK6bRWnwlex1VgP1MrztneD+QG65XLZ64DZs1I59/AsthADxMcqcgHxQJ4jCNct7M529
 HXon3/jg33DPDz7ioe4CRBGnFPTDlUvUwcXFt5gjh7NI6ULeoTEPlh5kX+RecI6/hjqr1ktJ0
 5+NnANBYVlbhPFim6pmYtmjrefBvNENOtdkkxlVoVBoFgPQgF/52RYMn8yMLEpE0nRfFlaUTk
 chl5lr1QanN0/+7z2mGxcxFFLtU3ODq8wRXsfREhS+zvgO1ii6F4wVDd3k5tWmKNICdH5S2/A
 xHB8XSNBL8cMe6c8g8IqJctSnrqTARWnBXOLBJ9rIfo42KKB46cInYfyuXJ51hwG1D1inDW8B
 lOvUsMzeeD6u7qtj7Uaw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=YlfjsuQk;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

When in EL2, banked SPSR_hyp is not accessible. We rather want SPSR of
the current mode. For writing, that means appending fsxc which selects
all bits. Reading means dropping the bank suffix.

Noticed via QEMU. Real HW might have done the intended access so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/control.c |  2 +-
 hypervisor/arch/arm/mmio.c    |  4 ++--
 hypervisor/arch/arm/setup.c   |  2 +-
 hypervisor/arch/arm/traps.c   | 10 +++++-----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index cd68dd9a..0e7a1b54 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -84,7 +84,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(TPIDRURO, 0);
 	arm_write_sysreg(TPIDRPRW, 0);

-	arm_write_banked_reg(SPSR_hyp, RESET_PSR);
+	arm_write_banked_reg(SPSR_fsxc, RESET_PSR);
 	arm_write_banked_reg(ELR_hyp, pc);

 	/* transfer the context that may have been passed to PSCI_CPU_ON */
diff --git a/hypervisor/arch/arm/mmio.c b/hypervisor/arch/arm/mmio.c
index 1c492b43..0162bc7c 100644
--- a/hypervisor/arch/arm/mmio.c
+++ b/hypervisor/arch/arm/mmio.c
@@ -38,7 +38,7 @@ static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 	arm_read_sysreg(TTBCR, ttbcr);

 	arm_read_banked_reg(ELR_hyp, pc);
-	arm_read_banked_reg(SPSR_hyp, cpsr);
+	arm_read_banked_reg(SPSR, cpsr);

 	/* Set cpsr */
 	is_thumb = cpsr & PSR_T_BIT;
@@ -50,7 +50,7 @@ static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 	if (sctlr & SCTLR_EE_BIT)
 		cpsr |= PSR_E_BIT;

-	arm_write_banked_reg(SPSR_hyp, cpsr);
+	arm_write_banked_reg(SPSR_fsxc, cpsr);

 	lr_offset = (is_thumb ? 4 : 0);
 	arm_write_banked_reg(LR_abt, pc + lr_offset);
diff --git a/hypervisor/arch/arm/setup.c b/hypervisor/arch/arm/setup.c
index 115e76e8..adb56f58 100644
--- a/hypervisor/arch/arm/setup.c
+++ b/hypervisor/arch/arm/setup.c
@@ -79,7 +79,7 @@ cpu_prepare_return_el1(struct per_cpu *cpu_data, int return_code)
 	asm volatile (
 		"msr	sp_svc, %0\n\t"
 		"msr	elr_hyp, %1\n\t"
-		"msr	spsr_hyp, %2\n\t"
+		"msr	spsr_fsxc, %2\n\t"
 		:
 		: "r" (cpu_data->linux_sp +
 		       (NUM_ENTRY_REGS * sizeof(unsigned long))),
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 10b3fdbf..6b402f74 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -55,7 +55,7 @@ static bool arch_failed_condition(struct trap_context *ctx)
 	u32 iss = HSR_ISS(ctx->hsr);
 	u32 cpsr, flags, cond;

-	arm_read_banked_reg(SPSR_hyp, cpsr);
+	arm_read_banked_reg(SPSR, cpsr);
 	flags = cpsr >> 28;

 	/*
@@ -99,7 +99,7 @@ static void arch_advance_itstate(struct trap_context *ctx)
 	unsigned long itbits, cond;
 	u32 cpsr;

-	arm_read_banked_reg(SPSR_hyp, cpsr);
+	arm_read_banked_reg(SPSR, cpsr);
 	if (!(cpsr & PSR_IT_MASK(0xff)))
 		return;

@@ -116,7 +116,7 @@ static void arch_advance_itstate(struct trap_context *ctx)
 	cpsr &= ~PSR_IT_MASK(0xff);
 	cpsr |= PSR_IT_MASK(itbits);

-	arm_write_banked_reg(SPSR_hyp, cpsr);
+	arm_write_banked_reg(SPSR_fsxc, cpsr);
 }

 void arch_skip_instruction(struct trap_context *ctx)
@@ -151,7 +151,7 @@ void access_cell_reg(struct trap_context *ctx, u8 reg, unsigned long *val,
 {
 	u32 mode;

-	arm_read_banked_reg(SPSR_hyp, mode);
+	arm_read_banked_reg(SPSR, mode);
 	mode &= PSR_MODE_MASK;

 	switch (reg) {
@@ -234,7 +234,7 @@ static void dump_guest_regs(struct trap_context *ctx)
 	u32 pc, cpsr;

 	arm_read_banked_reg(ELR_hyp, pc);
-	arm_read_banked_reg(SPSR_hyp, cpsr);
+	arm_read_banked_reg(SPSR, cpsr);
 	panic_printk("pc=0x%08x cpsr=0x%08x hsr=0x%08x\n", pc, cpsr, ctx->hsr);
 	for (reg = 0; reg < 15; reg++) {
 		access_cell_reg(ctx, reg, &reg_val, true);
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9638d507b2f979e0c46a3b557372166408f91b20.1609774199.git.jan.kiszka%40web.de.
