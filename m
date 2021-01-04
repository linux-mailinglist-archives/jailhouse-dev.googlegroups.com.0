Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJODZP7QKGQESI25C3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 159222E92A9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:38 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id v7sf12853572wra.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752997; cv=pass;
        d=google.com; s=arc-20160816;
        b=xfkdDxC9MY3R8K6+AeznaE/RLq+ndg5gH7HYOmtA41bDd1m/GMmu+uKOMQ5llIQO/Z
         dF7t8znGb6D5qiU8SmFJw7ZjzFw/dekgsOiH/pJg6qfOn4J2AhIp91NHyL5aRldtMUKZ
         GN/WyKpIQERZX3zSQ1A86QmYOTM2kvHJJ4ODj/IUX7yYbZduoJhIYA8M9bSpG5oNj9IC
         v6p5vnE5w4KdhWGZpxGVmVWSldp3rJ+z5lDIbCc80UXWENG1zvJLGDi5gnsAiUgf8lCl
         kHxQFFxQzq1obTma+EEoMWMg2ipFp4yNw4GgVbh/0M14P51xasNjENblFyNe+jS0RgWE
         NShQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=O0skJwha1YYwxvm/Nd/nkb3RaoxXD4WgZ/fnVZMF0Fc=;
        b=zscZxeP9qXxX4T6U8eYhRN3QUtneKoeb94KlnJs5gFwsB90Zy/AnadpBP3C9+7AiGe
         Fh/nbpVkA8UeWlxFk0aW1QUiTnCz6RnQAsCG5lnNmq7zgu0U8XSJr3yfwdpnPUykoLBU
         NhJG3F2yYu2tRiRShjpz6E/AViHNH6H6jDkifwgSbshiXpy6QPqBWC4KQpXoEoSd0JEl
         VuIbG3kdpoS47CfLT/AwTW6jJ5X1CSeuv5G7HbwQBjYGdmQagoRP8TSEK28MP46+o0wO
         eFVJfUN0L6GSTvL5RMXGdh17iCzbfY/ZH1mY70C/521QQZurtaIravJnbDaZyniZ7+vC
         xR6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o8KD4U7p;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O0skJwha1YYwxvm/Nd/nkb3RaoxXD4WgZ/fnVZMF0Fc=;
        b=eC1fYZG2H3v0e6nyenMHYlI1eaCCjfEYWFyaGxqvhlNx46+lH6t/aYIjdK67+4/P59
         2j4SjXNCepIUOOkl1jsM4phtW7NZ2DJpcveKT6uNtawMCauNETHVxQSjWYGx5oEtXEEW
         O4PC3rxczykpsNkV5EyktNiNdP1JM3GObd15gxAGRhmBLxZ/ZJ2vhTtbClp3C/z9UbNh
         AyL+yxE3xXkROZPpvt+YVXOjFOUPysArpyGSNlDyJ12ca2jiaFnrpVsmEA3o//H1xfc7
         H7i9ByJxeO8ox0uQSL2lx8Gyw9s560tqS8mmqTzWn5/ftBMuBKq6p8sVI5VTi9jWDwLS
         3wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O0skJwha1YYwxvm/Nd/nkb3RaoxXD4WgZ/fnVZMF0Fc=;
        b=ulvaqeX7EL3dk149jQSHExtjz/QnI64S1lXKfB2aVDzHMyzl0Rx20IJA2vDlkTjKCZ
         a/4PxuHrVUeaWZKa3jgRExDYQPv18albo8/1JJU7SVMltbj06SQMXrCvQkP3OI9z+BrI
         RnFsciWnE9cKY5/eli9/IhcDT4QFyJpcQUd/Ilih1QumX/oJxgG+57LrGHe6dQsQKmYJ
         eA/zHIRxQ9AkhavNbBceIGanOolw5uI2/fB+7iVLeXIfCy2C5SodJY5VwC2s/ohYgvlk
         T3k6d+bZFA0QgtGCjYkFcout5R+kALpTlD7mZ25g2DPpa6utUv2C9vlXd6ZGjjXvcwXv
         WgjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533GoaLMydsy1IK7e/lb+zdtx00k8snWPhF8RNEniXSlvfVwmUmQ
	4+fzne5hnT0N2E3U47YN3w8=
X-Google-Smtp-Source: ABdhPJw4zta0fen3nQ4Sa6qL05SgAHYm4IfD6GNjzeTHn1uJntymjObSl4WQRITyO1HIJDDXgDrPYg==
X-Received: by 2002:a1c:7909:: with SMTP id l9mr26235822wme.120.1609752997877;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f8e:: with SMTP id f136ls8335470wmf.0.canary-gmail;
 Mon, 04 Jan 2021 01:36:37 -0800 (PST)
X-Received: by 2002:a1c:b407:: with SMTP id d7mr26319951wmf.34.1609752997045;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=xeiwmythmeAcdLW29/l1PA+Ccq52PPMWrrgYHHsdnhFf9GGX2HRXopKfSm4txXQEUP
         EFVd++iH3CZU0Qs/kRkvlWg1RBbG43FCtNpaZ7Y5a0fvYH9CXVgATSsAlzPUFsUW3OkA
         2ilEHsgsbDY5MwYwDjpcH4eguiKuloXJJiuD0ND6RY4VEPLa3fruQEinHUo0c6EctiIx
         AMNOVrXBdd0cAwBaonEjrmJwmSbkYg/qSCF/vXVETTw3OEvivcrBMQOeIkfwO7mAgNI2
         2/5KJigOULF/QfW7/9NFRSPh+ZVlkGgNbj5dHuFP1XguS2Wgy/EkamPT84IjTdT+632A
         sQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=7XtSnA+GczbXqBRe6NMKymbhgr10102yVCVf0wDqcVc=;
        b=dyVzY7mJV4DW/Xz4OyRWJNRFphUmCkWAFJII+MrVitqRABDLbEEguLV3UTZ/loPqKF
         MwcDPmKIJ4SklT/CLMjbVo5Rq6IBx9SouaSTR+AT38olmpkJGdNdafGUJaX6+13SuBQk
         YwNS0Ncate8UUTuAhGezEvMpQ2mJY/BJswmyyNZms8qjOS72J9c01vo2MyDA77kA8fCH
         DnyqUGJdMA8dOLWm+zsiWCZDk7yO/yG4Hj04nyK2FwuwjAM9wqoU0yr+Brk3g4pYaU8e
         5L1+4d6Cv1LSM/M01jMdcCIlvgZ7Bu2oOhJ9sj8114v1SpwDwICo2gfHWgKlTCOmXLzl
         NCTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=o8KD4U7p;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id i206si489832wmi.0.2021.01.04.01.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MPYNR-1ksFYj2d29-004hZo for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/8] arm: Fix access to SPSR from EL2
Date: Mon,  4 Jan 2021 10:36:17 +0100
Message-Id: <9638d507b2f979e0c46a3b557372166408f91b20.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lBaPJ4jlqzbQjVqNHVQjJh4YB/baL3wItaexwbepU4f9Ij5EA9a
 9GMuSL1a1Gs0UjH16Oh3nSutNTsKzo2248JlDKB4zNArVttOoO3zrnw/D7ZOfJgj4yM9cLE
 d0tCqlmSgu+NsRgguUByi0hCdikSQJNoxsFynmmAMNgqaEgBGEK2Rm4guIOLcfrHqyKQUtL
 kP2IAxvMg8UEH73WkANag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oicD1CMIiZY=:hoTbKCbbc8wu6WtEjGjcg5
 XyGNVdM5Za6D0TwvV0vquJFU/wBfFRbAG+wqOPji3aK2+7fOacJ94IPRsCtW2L7/umC+UlI+U
 X2829eWe1dr6WVP7vDW9mAVFf1ppzmdNGiWdpADXT1o3uePzfz5D0Z4v5IfCOf9D7HKvUudtK
 afSYR/zuKkjxZ1UUuXmGr6OXw1Bf80Jkgsye6yuyntMgQGirnQ29o/GSFe12M0Ee7jJaz1Vxz
 F2uH+aYwUDB2rIl40LaFmvi4LOEXWKC6i3NaN466ER02tUojDz2iVlWn2jfM0vyciek8ygJUA
 /9WasrCk2nfpgJFEpqmfA7Yq3/DKswI42DUwmHw3bGxnwlj/FLVzK7UBUwoYcp7Jc13epLJUS
 O1SVo259auG8niYbsBuOS29iHiQL4EB9rTKeUreySg6M+S+cYh9hnwelfDFTSUQBbawuqrqiH
 nvGWfgoqLpsP88AMvkTlCfKNgtrY6N3/bpff9AJiS5b9Jwz8JXEqxTOEf7m+uhV2n9LXzYj8j
 yt3atP7FGC4DhuC03JBiXID0LzAIYfBhzi81txB/FGe3Usydzv7b4xzlp+fkH8GY6AWk4xYP2
 8fqiiJbU/+N7bOXixQ6qGx2rJt09JnHIDY7nL6vXMLd09isCdyFxb2Fia7CWL7z7G0lNZ+fHI
 ufd2aQOvaCfZ5+fmPxPC9RrvqrhkAeI7NhkTiQIu78yyGW3nN2CeMnoOTUzHyBhg6fnqnQBxV
 nDBEoXguxcN1WAojVCQ1bOlqrCxkXt1V6SIfp+LE3o5zUTCCZnT9xw5uIjb6UGyF1sZAJxuO6
 CL9HW/eFZ3wD5AU5VJOx9WDC+5YjiCyKXyiLhqrHFUBzpvSMpHLnRB3+0P2VRXvmMqAEVTdm9
 FkcTzp26lM/JUiy8MXag==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=o8KD4U7p;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9638d507b2f979e0c46a3b557372166408f91b20.1609752982.git.jan.kiszka%40web.de.
