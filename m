Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBG5GSSEQMGQEGR724VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48E3F61D7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 17:41:16 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id 192-20020a2e05c90000b02901b91e6a0ebasf7704290ljf.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 08:41:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629819676; cv=pass;
        d=google.com; s=arc-20160816;
        b=WBoR3Qt1TR1P4Fq4XOmPs2Z7htWK2e1vR3dErmqHlKEnRB95qsA91Z9LGTgh1261ME
         jXqIM+BDwMgnJr09gsOi7mchnkQJ1wiKfm69dc6zGTp+lQ+KR+8pRcFbbrLLiUoR8xAH
         fBn64sSK6mI53KPkDt6I15i7IYiatQK8GC6yxWurSmubREAhYsdo4lGtQDve6EG8VkbX
         5MzG6CedeDGlKiWN11o/Jh61l8rydeFW4cburU0GS2fIGgIJFNSpCgm1v7TfcLi98KTj
         z9BI/nrm43F0qR9m80daZJu8bN6wQQqduZAzC05eT74a3z8DfA3FLQ4LxuLd63iEymPS
         KQoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ouJgHrp6rfb8hwIzY2YcW2LnLNix8SlaoK0WMtQRfjk=;
        b=tK5lhThhaC1lHRQToaocEJoz5rVIW5vg7ltVXYSYNJbvuRukLYGQNHaztrCsDlJfLa
         7FFAQt6WB6BEpwZX5cFxtZnqdpDuHyckq5Ldx5hbOnhJPIzeid8WxlU7d4aBmKpmpHNc
         QXVaV3rheu0elzaZ18RtzYG7Nn6G2mJFm26wHYqUBVVw45ScfsCg0mwwMUeBUIZPZzxd
         /yD/SYWfsTy64nMyjO86JuNbXrl8TRVKO+J2cUC7IpQ6Aakh0VgBPYk7KA6gjN475Po4
         y0YOtHbIEu7OZhCxWQR+GBgx1kDhJO9HPEcg19MM2IOIZv2fwHSmshmoYdwe3B6nbgPY
         fClg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ouJgHrp6rfb8hwIzY2YcW2LnLNix8SlaoK0WMtQRfjk=;
        b=rZkhQDy4W3X5Gry8qRuqH7UetbTSYCH6TCJB/8EHqS+1jonkKQZJZb1GhxClatefsH
         elCTDEWrzE6dHxzjQVl91kt2AyHowEZbqnSdlmSrV6Fq/YsCVc3rfT/2Ow/MaebJ4VVG
         Mi7hUVZyfHJ4DSgmRaNLhGDwx9YDxeJL3V/bEAVNmozHovsx8j3s2EBcSkEVoj3aXYmA
         8gIdfU8Hs7dLIOVvOT4N8faDGhU8hejt5w6Y4g+RyoiVCqlYJyCpT+G64DMwz01bxO87
         noUAFCpM3HyBmz7/9ywM9MLGwL2Chg5WIXdg6MatGwYNeZbeIksS8lpQJKqpLp3+wp9/
         ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ouJgHrp6rfb8hwIzY2YcW2LnLNix8SlaoK0WMtQRfjk=;
        b=hROYwS68jpwUJdVmoAke69edQZ9Kcd5d+RJviZrqDHk0pNVZ5mS6U9DxRtQ7WcCLIN
         vz/KNm+QZL+cvK/3mZ7tf6Ac4qF7rQQUDZ03X2TRtQ08CGDVWUJseYz+JG+tl5I6lREG
         fXwLDONU6rFJDDPRMbC8lE4cNQWGSo2rY1pl+pgn9ITQ6L8GPbgYYi+S0LNF4cLmo0kP
         2bB3evUwtr0wL1SHCbXXIC8XFDzlGi3VID5pXWRZQJrD74fR3Rir97jQEjoarv6QsNc3
         4KBNm96gYcaKo6+ZAI4668VHW/NafBeNggrB7eRUAOPj7IijeSaVkU9kphqXpF/xwJiK
         GKjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pe5LwprMEYADp0l1ILS5RlQxcC6XZyU2va3w9PyFdmtBkSCBx
	yPvf8iN3NNHTd3R1UzEcFNA=
X-Google-Smtp-Source: ABdhPJzhC9nMQXClflAF4cLvjqprXQWoh8TvaCPOkHlYgWorSDkdYX29BJHpITiEacWL+Bol4FlVrw==
X-Received: by 2002:a2e:bd85:: with SMTP id o5mr32253922ljq.313.1629819675609;
        Tue, 24 Aug 2021 08:41:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8652:: with SMTP id i18ls3536701ljj.1.gmail; Tue, 24 Aug
 2021 08:41:14 -0700 (PDT)
X-Received: by 2002:a2e:99c8:: with SMTP id l8mr32796124ljj.178.1629819674035;
        Tue, 24 Aug 2021 08:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629819674; cv=none;
        d=google.com; s=arc-20160816;
        b=zGPDSx8RbocFp7ERFqvV4jW5ckaqlaWFxPsp0wpfGa9RCikhf0/lzMCCKOae90Di0u
         zKFvPYZegJY3ItCqmOwBj9LH+GgYBIK0DjoVFSG9huyTAP5HfemMk/88jvYWEmYYWxip
         Zp0mnQRAwZbjnCn3bu0Pd4bgDG04zgBXnPfJQnQsucKRy3WHdiTeLALkROBDhliVd2V9
         1M++r5K+FZ83SCIKTyFM3oLzefCHhxtMqGv7xU3XhpCv9quN0O2MVAkcIlJPhfhEUfpW
         q5Yf5S0VvKpAs2XZ96rhww55sPHXduGPmb7/+kZqPURvUcttiEjBYfiCSsqikNt9/4QV
         r+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=HggCPALjO9B2RRXUlRY5Ed46G5eSASJQFisnsPX31gw=;
        b=mUkp1sDl1GzCoB17fWxPPW3J0/ZuYCuQDhv6ssCZpyqPe1IB5RWy4q/cqt30gmcX3+
         eplBdtYNLjgC/ALYChcg0ONv/tMLg5vVeKkjhC86nQ0FCNS+YXJP4kD5Mnou2CQ858tw
         FHzsu7CpJ0+9//ekIoq+U2Fn4xpwLBp93H2tbvzrWdx+Qjmu87gFVdc3tvpwZfd9HS5D
         kn0eondDy1vb2aZvZIHFGG3mv6AmM16xm+3VqFehwSYUmnkVOJPixmX6kDZMIF2lLv8w
         5ZpcDDl9AdzAUhO/Z3FAcgeL4bLed0iBuJfhLmHqYbzIQqlWukFdRFhCG9yoz0+ivHB7
         mO8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h8si866160lfu.0.2021.08.24.08.41.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OFfDNe029124
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OFfB7j015711
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/2] ci: Update kernel image to 5.10
Date: Tue, 24 Aug 2021 17:41:11 +0200
Message-Id: <f247584f1f5db79c778e25f6840bf0005cdd1342.1629819671.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629819671.git.jan.kiszka@siemens.com>
References: <cover.1629819671.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The 4.13-based kernel image used for CI is not seriously aging,
including warnings with gcc-9 that is now coming via the Ubuntu 20.04 CI
image. Bump to 5.10 which should last for a while.

The kernel image is now fully built. That permits to check all symbols
the driver may need. Therefore, include all currently needed symbol
export patches in the generated kernel.

While updating the kernel configs, switch to defconfigs to reduce the
stored data.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .github/workflows/main.yaml  |    4 +-
 ci/gen-kernel-build.sh       |  155 +-
 ci/kernel-config-amd-seattle | 3221 +--------------------------
 ci/kernel-config-banana-pi   | 2837 +----------------------
 ci/kernel-config-x86         | 4075 +---------------------------------
 5 files changed, 230 insertions(+), 10062 deletions(-)

diff --git a/.github/workflows/main.yaml b/.github/workflows/main.yaml
index fbf38841..18f2891e 100644
--- a/.github/workflows/main.yaml
+++ b/.github/workflows/main.yaml
@@ -47,12 +47,12 @@ jobs:
           key: kernel-build
           path: |
             ci/linux
-            ci/linux-4.13
+            ci/linux-5.10
       - name: Install kernel build environment
         if: ${{ github.event.inputs.clear-cache == 'true' || steps.cache-kernel.outputs.cache-hit != 'true' }}
         run: |
           cd ci
-          rm -rf linux linux-4.13
+          rm -rf linux linux-5.10
           wget http://www.kiszka.org/downloads/jailhouse-ci/kernel-build.tar.xz
           tar xJf kernel-build.tar.xz
       - name: Build
diff --git a/ci/gen-kernel-build.sh b/ci/gen-kernel-build.sh
index df801301..6d7e2ee8 100755
--- a/ci/gen-kernel-build.sh
+++ b/ci/gen-kernel-build.sh
@@ -2,7 +2,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2014-2016
+# Copyright (c) Siemens AG, 2014-2021
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -14,7 +14,7 @@
 BASEDIR=`cd \`dirname $0\`; pwd`
 
 if test -z $KERNEL; then
-	KERNEL=https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.13.tar.xz
+	KERNEL=https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.tar.xz
 fi
 if test -z $PARALLEL_BUILD; then
 	PARALLEL_BUILD=-j16
@@ -40,11 +40,34 @@ prepare_kernel()
 	ln -s linux-* linux
 	cd linux
 	patch -p1 << EOF
+diff --git a/arch/arm/include/asm/virt.h b/arch/arm/include/asm/virt.h
+index dd9697b2bde8..47600a5894b1 100644
+--- a/arch/arm/include/asm/virt.h
++++ b/arch/arm/include/asm/virt.h
+@@ -39,6 +39,8 @@ static inline void sync_boot_mode(void)
+ 	sync_cache_r(&__boot_cpu_mode);
+ }
+ 
++void __hyp_set_vectors(unsigned long phys_vector_base);
++void __hyp_reset_vectors(void);
+ #else
+ #define __boot_cpu_mode	(SVC_MODE)
+ #define sync_boot_mode()
+@@ -73,6 +75,9 @@ static inline bool is_kernel_in_hyp_mode(void)
+ 
+ #define HVC_SET_VECTORS 0
+ #define HVC_SOFT_RESTART 1
++#define HVC_RESET_VECTORS 2
++
++#define HVC_STUB_HCALL_NR 3
+ 
+ #endif /* __ASSEMBLY__ */
+ 
 diff --git a/arch/arm/kernel/armksyms.c b/arch/arm/kernel/armksyms.c
-index 8e8d20cdbce7..a13adac97508 100644
+index 82e96ac83684..354ab3e4e41f 100644
 --- a/arch/arm/kernel/armksyms.c
 +++ b/arch/arm/kernel/armksyms.c
-@@ -20,6 +20,7 @@
+@@ -16,6 +16,7 @@
  
  #include <asm/checksum.h>
  #include <asm/ftrace.h>
@@ -52,7 +75,7 @@ index 8e8d20cdbce7..a13adac97508 100644
  
  /*
   * libgcc functions - functions that are used internally by the
-@@ -181,3 +182,7 @@ EXPORT_SYMBOL(__pv_offset);
+@@ -175,3 +176,7 @@ EXPORT_SYMBOL(__pv_offset);
  EXPORT_SYMBOL(__arm_smccc_smc);
  EXPORT_SYMBOL(__arm_smccc_hvc);
  #endif
@@ -61,10 +84,10 @@ index 8e8d20cdbce7..a13adac97508 100644
 +EXPORT_SYMBOL_GPL(__boot_cpu_mode);
 +#endif
 diff --git a/arch/arm/kernel/hyp-stub.S b/arch/arm/kernel/hyp-stub.S
-index ec7e7377d423..83e65f01ca7f 100644
+index 26d8e03b1dd3..c01622e6d9a4 100644
 --- a/arch/arm/kernel/hyp-stub.S
 +++ b/arch/arm/kernel/hyp-stub.S
-@@ -19,6 +19,7 @@
+@@ -6,6 +6,7 @@
  #include <linux/init.h>
  #include <linux/irqchip/arm-gic-v3.h>
  #include <linux/linkage.h>
@@ -72,17 +95,85 @@ index ec7e7377d423..83e65f01ca7f 100644
  #include <asm/assembler.h>
  #include <asm/virt.h>
  
-@@ -281,4 +282,5 @@ __hyp_stub_trap:	W(b)	__hyp_stub_do_trap
+@@ -189,19 +190,19 @@ ARM_BE8(orr	r7, r7, #(1 << 25))     @ HSCTLR.EE
+ ENDPROC(__hyp_stub_install_secondary)
+ 
+ __hyp_stub_do_trap:
+-#ifdef ZIMAGE
+ 	teq	r0, #HVC_SET_VECTORS
+ 	bne	1f
+-	/* Only the ZIMAGE stubs can change the HYP vectors */
+ 	mcr	p15, 4, r1, c12, c0, 0	@ set HVBAR
+ 	b	__hyp_stub_exit
+-#endif
+ 
+ 1:	teq	r0, #HVC_SOFT_RESTART
+-	bne	2f
++	bne	1f
+ 	bx	r1
+ 
+-2:	ldr	r0, =HVC_STUB_ERR
++1:	teq	r0, #HVC_RESET_VECTORS
++	beq	__hyp_stub_exit
++
++	ldr	r0, =HVC_STUB_ERR
+ 	__ERET
+ 
+ __hyp_stub_exit:
+@@ -210,9 +211,26 @@ __hyp_stub_exit:
+ ENDPROC(__hyp_stub_do_trap)
+ 
+ /*
+- * __hyp_set_vectors is only used when ZIMAGE must bounce between HYP
+- * and SVC. For the kernel itself, the vectors are set once and for
+- * all by the stubs.
++ * __hyp_set_vectors: Call this after boot to set the initial hypervisor
++ * vectors as part of hypervisor installation.  On an SMP system, this should
++ * be called on each CPU.
++ *
++ * r0 must be the physical address of the new vector table (which must lie in
++ * the bottom 4GB of physical address space.
++ *
++ * r0 must be 32-byte aligned.
++ *
++ * Before calling this, you must check that the stub hypervisor is installed
++ * everywhere, by waiting for any secondary CPUs to be brought up and then
++ * checking that BOOT_CPU_MODE_HAVE_HYP(__boot_cpu_mode) is true.
++ *
++ * If not, there is a pre-existing hypervisor, some CPUs failed to boot, or
++ * something else went wrong... in such cases, trying to install a new
++ * hypervisor is unlikely to work as desired.
++ *
++ * When you call into your shiny new hypervisor, sp_hyp will contain junk,
++ * so you will need to set that to something sensible at the new hypervisor's
++ * initialisation entry point.
+  */
+ ENTRY(__hyp_set_vectors)
+ 	mov	r1, r0
+@@ -228,6 +246,12 @@ ENTRY(__hyp_soft_restart)
+ 	ret	lr
+ ENDPROC(__hyp_soft_restart)
+ 
++ENTRY(__hyp_reset_vectors)
++	mov	r0, #HVC_RESET_VECTORS
++	__HVC(0)
++	ret	lr
++ENDPROC(__hyp_reset_vectors)
++
+ #ifndef ZIMAGE
+ .align 2
+ .L__boot_cpu_mode_offset:
+@@ -245,4 +269,5 @@ __hyp_stub_trap:	W(b)	__hyp_stub_do_trap
  __hyp_stub_irq:		W(b)	.
  __hyp_stub_fiq:		W(b)	.
  ENDPROC(__hyp_stub_vectors)
 +EXPORT_SYMBOL_GPL(__hyp_stub_vectors)
  
 diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
-index e1261fbaa374..061b32ef7c74 100644
+index 160f5881a0b7..a055e28be5c2 100644
 --- a/arch/arm64/kernel/hyp-stub.S
 +++ b/arch/arm64/kernel/hyp-stub.S
-@@ -21,6 +21,7 @@
+@@ -10,6 +10,7 @@
  #include <linux/linkage.h>
  #include <linux/irqchip/arm-gic-v3.h>
  
@@ -90,23 +181,50 @@ index e1261fbaa374..061b32ef7c74 100644
  #include <asm/assembler.h>
  #include <asm/kvm_arm.h>
  #include <asm/kvm_asm.h>
-@@ -51,6 +52,7 @@ ENTRY(__hyp_stub_vectors)
+@@ -42,6 +43,7 @@ SYM_CODE_START(__hyp_stub_vectors)
  	ventry	el1_fiq_invalid			// FIQ 32-bit EL1
  	ventry	el1_error_invalid		// Error 32-bit EL1
- ENDPROC(__hyp_stub_vectors)
+ SYM_CODE_END(__hyp_stub_vectors)
 +EXPORT_SYMBOL_GPL(__hyp_stub_vectors)
  
  	.align 11
  
-diff --git a/lib/ioremap.c b/lib/ioremap.c
-index 4bb30206b942..5629eeaba5ae 100644
---- a/lib/ioremap.c
-+++ b/lib/ioremap.c
-@@ -177,3 +177,4 @@ int ioremap_page_range(unsigned long addr,
+diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
+index b3eef1d5c903..b1a6e9c550d4 100644
+--- a/arch/x86/kernel/apic/apic.c
++++ b/arch/x86/kernel/apic/apic.c
+@@ -196,6 +196,7 @@ static struct resource lapic_resource = {
+ };
+ 
+ unsigned int lapic_timer_period = 0;
++EXPORT_SYMBOL_GPL(lapic_timer_period);
+ 
+ static void apic_pm_activate(void);
+ 
+diff --git a/mm/ioremap.c b/mm/ioremap.c
+index 5fa1ab41d152..d63c4ba067f9 100644
+--- a/mm/ioremap.c
++++ b/mm/ioremap.c
+@@ -248,6 +248,7 @@ int ioremap_page_range(unsigned long addr,
  
  	return err;
  }
 +EXPORT_SYMBOL_GPL(ioremap_page_range);
+ 
+ #ifdef CONFIG_GENERIC_IOREMAP
+ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
+diff --git a/mm/vmalloc.c b/mm/vmalloc.c
+index 6ae491a8b210..ae80dbaf743c 100644
+--- a/mm/vmalloc.c
++++ b/mm/vmalloc.c
+@@ -2097,6 +2097,7 @@ struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
+ 	return __get_vm_area_node(size, 1, flags, start, end, NUMA_NO_NODE,
+ 				  GFP_KERNEL, caller);
+ }
++EXPORT_SYMBOL_GPL(__get_vm_area_caller);
+ 
+ /**
+  * get_vm_area - reserve a contiguous kernel virtual area
 EOF
 }
 
@@ -114,7 +232,8 @@ build_kernel()
 {
 	mkdir build-$1
 	cp $BASEDIR/kernel-config-$1 build-$1/.config
-	make O=build-$1 vmlinux $PARALLEL_BUILD ARCH=$2 CROSS_COMPILE=$3
+	make O=build-$1 olddefconfig $PARALLEL_BUILD ARCH=$2 CROSS_COMPILE=$3
+	make O=build-$1 $PARALLEL_BUILD ARCH=$2 CROSS_COMPILE=$3
 	# clean up some unneeded build output
 	find build-$1 \( -name "*.o" -o -name "*.cmd" -o -name ".tmp_*" \) -exec rm -rf {} \;
 }
diff --git a/ci/kernel-config-amd-seattle b/ci/kernel-config-amd-seattle
index ff5c5ac9..a86a2dc8 100644
--- a/ci/kernel-config-amd-seattle
+++ b/ci/kernel-config-amd-seattle
@@ -1,624 +1,77 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Linux/arm64 4.13.0 Kernel Configuration
-#
-CONFIG_ARM64=y
-CONFIG_64BIT=y
-CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
-CONFIG_MMU=y
-CONFIG_ARM64_PAGE_SHIFT=12
-CONFIG_ARM64_CONT_SHIFT=4
-CONFIG_ARCH_MMAP_RND_BITS_MIN=18
-CONFIG_ARCH_MMAP_RND_BITS_MAX=24
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=11
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_RWSEM_XCHGADD_ALGORITHM=y
-CONFIG_GENERIC_BUG=y
-CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_GENERIC_CSUM=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_ZONE_DMA=y
-CONFIG_HAVE_GENERIC_GUP=y
-CONFIG_ARCH_DMA_ADDR_T_64BIT=y
-CONFIG_NEED_DMA_MAP_STATE=y
-CONFIG_NEED_SG_DMA_LENGTH=y
-CONFIG_SMP=y
-CONFIG_SWIOTLB=y
-CONFIG_IOMMU_HELPER=y
-CONFIG_KERNEL_MODE_NEON=y
-CONFIG_FIX_EARLYCON_MEM=y
-CONFIG_PGTABLE_LEVELS=3
-CONFIG_ARCH_SUPPORTS_UPROBES=y
-CONFIG_ARCH_PROC_KCORE_TEXT=y
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_IRQ_WORK=y
-CONFIG_BUILDTIME_EXTABLE_SORT=y
-CONFIG_THREAD_INFO_IN_TASK=y
-
-#
-# General setup
-#
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-# CONFIG_COMPILE_TEST is not set
-CONFIG_LOCALVERSION=""
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
-CONFIG_SYSVIPC_SYSCTL=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_POSIX_MQUEUE_SYSCTL=y
-CONFIG_CROSS_MEMORY_ATTACH=y
-CONFIG_FHANDLE=y
-# CONFIG_USELIB is not set
 CONFIG_AUDIT=y
-CONFIG_HAVE_ARCH_AUDITSYSCALL=y
-CONFIG_AUDITSYSCALL=y
-CONFIG_AUDIT_WATCH=y
-CONFIG_AUDIT_TREE=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
-CONFIG_GENERIC_IRQ_MIGRATION=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_IRQ_DOMAIN=y
-CONFIG_IRQ_DOMAIN_HIERARCHY=y
-CONFIG_GENERIC_MSI_IRQ=y
-CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
-CONFIG_HANDLE_DOMAIN_IRQ=y
-# CONFIG_IRQ_DOMAIN_DEBUG is not set
-CONFIG_IRQ_FORCED_THREADING=y
-CONFIG_SPARSE_IRQ=y
-# CONFIG_GENERIC_IRQ_DEBUGFS is not set
-CONFIG_ARCH_CLOCKSOURCE_DATA=y
-CONFIG_GENERIC_TIME_VSYSCALL=y
-CONFIG_GENERIC_CLOCKEVENTS=y
-CONFIG_ARCH_HAS_TICK_BROADCAST=y
-CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
-
-#
-# Timers subsystem
-#
-CONFIG_TICK_ONESHOT=y
-CONFIG_NO_HZ_COMMON=y
-# CONFIG_HZ_PERIODIC is not set
-# CONFIG_NO_HZ_IDLE is not set
 CONFIG_NO_HZ_FULL=y
-# CONFIG_NO_HZ_FULL_ALL is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
-
-#
-# CPU/Task time and stats accounting
-#
-CONFIG_VIRT_CPU_ACCOUNTING=y
-CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
-# CONFIG_IRQ_TIME_ACCOUNTING is not set
+CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
-
-#
-# RCU Subsystem
-#
-CONFIG_PREEMPT_RCU=y
-# CONFIG_RCU_EXPERT is not set
-CONFIG_SRCU=y
-CONFIG_TREE_SRCU=y
-CONFIG_TASKS_RCU=y
-CONFIG_RCU_STALL_COMMON=y
-CONFIG_RCU_NEED_SEGCBLIST=y
-CONFIG_CONTEXT_TRACKING=y
-# CONFIG_CONTEXT_TRACKING_FORCE is not set
-CONFIG_RCU_NOCB_CPU=y
-CONFIG_BUILD_BIN2C=y
 CONFIG_IKCONFIG=y
-# CONFIG_IKCONFIG_PROC is not set
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
-CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
-CONFIG_GENERIC_SCHED_CLOCK=y
-CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
-CONFIG_CGROUPS=y
-# CONFIG_MEMCG is not set
 CONFIG_BLK_CGROUP=y
-# CONFIG_DEBUG_BLK_CGROUP is not set
-CONFIG_CGROUP_SCHED=y
-CONFIG_FAIR_GROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-# CONFIG_RT_GROUP_SCHED is not set
-# CONFIG_CGROUP_PIDS is not set
-# CONFIG_CGROUP_RDMA is not set
 CONFIG_CGROUP_FREEZER=y
-# CONFIG_CGROUP_HUGETLB is not set
 CONFIG_CPUSETS=y
-CONFIG_PROC_PID_CPUSET=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
-# CONFIG_CGROUP_DEBUG is not set
-CONFIG_SOCK_CGROUP_DATA=y
-# CONFIG_CHECKPOINT_RESTORE is not set
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
 CONFIG_USER_NS=y
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
 CONFIG_SCHED_AUTOGROUP=y
-# CONFIG_SYSFS_DEPRECATED is not set
-CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
-CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_XZ=y
-CONFIG_RD_LZO=y
-CONFIG_RD_LZ4=y
-CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SYSCTL=y
-CONFIG_ANON_INODES=y
-CONFIG_SYSCTL_EXCEPTION_TRACE=y
-CONFIG_BPF=y
-# CONFIG_EXPERT is not set
-CONFIG_MULTIUSER=y
-# CONFIG_SGETMASK_SYSCALL is not set
-CONFIG_SYSFS_SYSCALL=y
-# CONFIG_SYSCTL_SYSCALL is not set
-CONFIG_POSIX_TIMERS=y
-CONFIG_KALLSYMS=y
 CONFIG_KALLSYMS_ALL=y
-# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
-CONFIG_KALLSYMS_BASE_RELATIVE=y
-CONFIG_PRINTK=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
-CONFIG_FUTEX=y
-CONFIG_EPOLL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-# CONFIG_BPF_SYSCALL is not set
-CONFIG_SHMEM=y
-CONFIG_AIO=y
-CONFIG_ADVISE_SYSCALLS=y
-# CONFIG_USERFAULTFD is not set
-CONFIG_PCI_QUIRKS=y
-CONFIG_MEMBARRIER=y
-# CONFIG_EMBEDDED is not set
-CONFIG_HAVE_PERF_EVENTS=y
-# CONFIG_PC104 is not set
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_PERF_EVENTS=y
-# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_SLUB_DEBUG=y
 # CONFIG_COMPAT_BRK is not set
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
-CONFIG_SLAB_MERGE_DEFAULT=y
-# CONFIG_SLAB_FREELIST_RANDOM is not set
-CONFIG_SLUB_CPU_PARTIAL=y
-# CONFIG_SYSTEM_DATA_VERIFICATION is not set
 CONFIG_PROFILING=y
-CONFIG_TRACEPOINTS=y
-# CONFIG_KPROBES is not set
+CONFIG_ARCH_SEATTLE=y
+CONFIG_SCHED_MC=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=8
+CONFIG_HOTPLUG_CPU=y
+CONFIG_CMDLINE="mem=16G"
+# CONFIG_SUSPEND is not set
+CONFIG_ARM64_CRYPTO=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_JUMP_LABEL=y
-# CONFIG_STATIC_KEYS_SELFTEST is not set
-CONFIG_UPROBES=y
-# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
-CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_ARCH_TRACEHOOK=y
-CONFIG_HAVE_DMA_CONTIGUOUS=y
-CONFIG_GENERIC_SMP_IDLE_THREAD=y
-CONFIG_GENERIC_IDLE_POLL_SETUP=y
-CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
-CONFIG_ARCH_HAS_SET_MEMORY=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_CLK=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-CONFIG_HAVE_HW_BREAKPOINT=y
-CONFIG_HAVE_PERF_REGS=y
-CONFIG_HAVE_PERF_USER_STACK_DUMP=y
-CONFIG_HAVE_ARCH_JUMP_LABEL=y
-CONFIG_HAVE_RCU_TABLE_FREE=y
-CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
-CONFIG_HAVE_CMPXCHG_LOCAL=y
-CONFIG_HAVE_CMPXCHG_DOUBLE=y
-CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
-CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
-CONFIG_HAVE_GCC_PLUGINS=y
-# CONFIG_GCC_PLUGINS is not set
-CONFIG_HAVE_CC_STACKPROTECTOR=y
-# CONFIG_CC_STACKPROTECTOR is not set
-CONFIG_CC_STACKPROTECTOR_NONE=y
-# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
-# CONFIG_CC_STACKPROTECTOR_STRONG is not set
-CONFIG_THIN_ARCHIVES=y
-CONFIG_HAVE_CONTEXT_TRACKING=y
-CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
-CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
-CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
-CONFIG_HAVE_ARCH_HUGE_VMAP=y
-CONFIG_MODULES_USE_ELF_RELA=y
-CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
-CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
-CONFIG_ARCH_MMAP_RND_BITS=18
-# CONFIG_HAVE_ARCH_HASH is not set
-# CONFIG_ISA_BUS_API is not set
-CONFIG_CLONE_BACKWARDS=y
-# CONFIG_CPU_NO_EFFICIENT_FFS is not set
-# CONFIG_HAVE_ARCH_VMAP_STACK is not set
-# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
-# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
-CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
-CONFIG_STRICT_MODULE_RWX=y
-# CONFIG_REFCOUNT_FULL is not set
-
-#
-# GCOV-based kernel profiling
-#
-# CONFIG_GCOV_KERNEL is not set
-CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
-# CONFIG_MODULE_FORCE_LOAD is not set
 CONFIG_MODULE_UNLOAD=y
-# CONFIG_MODULE_FORCE_UNLOAD is not set
-# CONFIG_MODVERSIONS is not set
-# CONFIG_MODULE_SRCVERSION_ALL is not set
-# CONFIG_MODULE_SIG is not set
-# CONFIG_MODULE_COMPRESS is not set
-CONFIG_MODULES_TREE_LOOKUP=y
-CONFIG_BLOCK=y
-CONFIG_BLK_SCSI_REQUEST=y
-CONFIG_BLK_DEV_BSG=y
+CONFIG_UNUSED_SYMBOLS=y
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_BLK_DEV_ZONED is not set
 CONFIG_BLK_DEV_THROTTLING=y
-# CONFIG_BLK_DEV_THROTTLING_LOW is not set
-# CONFIG_BLK_CMDLINE_PARSER is not set
-# CONFIG_BLK_WBT is not set
-CONFIG_BLK_DEBUG_FS=y
-# CONFIG_BLK_SED_OPAL is not set
-
-#
-# Partition Types
-#
 CONFIG_PARTITION_ADVANCED=y
-# CONFIG_ACORN_PARTITION is not set
 CONFIG_AIX_PARTITION=y
 CONFIG_OSF_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
-# CONFIG_ATARI_PARTITION is not set
 CONFIG_MAC_PARTITION=y
-CONFIG_MSDOS_PARTITION=y
 CONFIG_BSD_DISKLABEL=y
 CONFIG_MINIX_SUBPARTITION=y
 CONFIG_SOLARIS_X86_PARTITION=y
 CONFIG_UNIXWARE_DISKLABEL=y
 CONFIG_LDM_PARTITION=y
-# CONFIG_LDM_DEBUG is not set
 CONFIG_SGI_PARTITION=y
-# CONFIG_ULTRIX_PARTITION is not set
 CONFIG_SUN_PARTITION=y
 CONFIG_KARMA_PARTITION=y
-CONFIG_EFI_PARTITION=y
-# CONFIG_SYSV68_PARTITION is not set
-# CONFIG_CMDLINE_PARTITION is not set
-CONFIG_BLK_MQ_PCI=y
-
-#
-# IO Schedulers
-#
-CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_DEADLINE=y
-CONFIG_IOSCHED_CFQ=y
-CONFIG_CFQ_GROUP_IOSCHED=y
-# CONFIG_DEFAULT_DEADLINE is not set
-CONFIG_DEFAULT_CFQ=y
-# CONFIG_DEFAULT_NOOP is not set
-CONFIG_DEFAULT_IOSCHED="cfq"
-CONFIG_MQ_IOSCHED_DEADLINE=y
-CONFIG_MQ_IOSCHED_KYBER=y
-# CONFIG_IOSCHED_BFQ is not set
-CONFIG_UNINLINE_SPIN_UNLOCK=y
-CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
-CONFIG_MUTEX_SPIN_ON_OWNER=y
-CONFIG_RWSEM_SPIN_ON_OWNER=y
-CONFIG_LOCK_SPIN_ON_OWNER=y
-CONFIG_FREEZER=y
-
-#
-# Platform selection
-#
-# CONFIG_ARCH_ACTIONS is not set
-# CONFIG_ARCH_SUNXI is not set
-# CONFIG_ARCH_ALPINE is not set
-# CONFIG_ARCH_BCM2835 is not set
-# CONFIG_ARCH_BCM_IPROC is not set
-# CONFIG_ARCH_BERLIN is not set
-# CONFIG_ARCH_BRCMSTB is not set
-# CONFIG_ARCH_EXYNOS is not set
-# CONFIG_ARCH_LAYERSCAPE is not set
-# CONFIG_ARCH_LG1K is not set
-# CONFIG_ARCH_HISI is not set
-# CONFIG_ARCH_MEDIATEK is not set
-# CONFIG_ARCH_MESON is not set
-# CONFIG_ARCH_MVEBU is not set
-# CONFIG_ARCH_QCOM is not set
-# CONFIG_ARCH_REALTEK is not set
-# CONFIG_ARCH_ROCKCHIP is not set
-CONFIG_ARCH_SEATTLE=y
-# CONFIG_ARCH_RENESAS is not set
-# CONFIG_ARCH_STRATIX10 is not set
-# CONFIG_ARCH_TEGRA is not set
-# CONFIG_ARCH_SPRD is not set
-# CONFIG_ARCH_THUNDER is not set
-# CONFIG_ARCH_THUNDER2 is not set
-# CONFIG_ARCH_UNIPHIER is not set
-# CONFIG_ARCH_VEXPRESS is not set
-# CONFIG_ARCH_VULCAN is not set
-# CONFIG_ARCH_XGENE is not set
-# CONFIG_ARCH_ZX is not set
-# CONFIG_ARCH_ZYNQMP is not set
-
-#
-# Bus support
-#
-CONFIG_PCI=y
-CONFIG_PCI_DOMAINS=y
-CONFIG_PCI_DOMAINS_GENERIC=y
-CONFIG_PCI_SYSCALL=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_PCIEAER=y
-CONFIG_PCIE_ECRC=y
-# CONFIG_PCIEAER_INJECT is not set
-CONFIG_PCIEASPM=y
-# CONFIG_PCIEASPM_DEBUG is not set
-CONFIG_PCIEASPM_DEFAULT=y
-# CONFIG_PCIEASPM_POWERSAVE is not set
-# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
-# CONFIG_PCIEASPM_PERFORMANCE is not set
-# CONFIG_PCIE_DPC is not set
-# CONFIG_PCIE_PTM is not set
-CONFIG_PCI_BUS_ADDR_T_64BIT=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI_MSI_IRQ_DOMAIN=y
-# CONFIG_PCI_DEBUG is not set
-# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
-CONFIG_PCI_STUB=y
-CONFIG_PCI_ATS=y
-CONFIG_PCI_IOV=y
-CONFIG_PCI_PRI=y
-CONFIG_PCI_PASID=y
-CONFIG_PCI_LABEL=y
-CONFIG_HOTPLUG_PCI=y
-# CONFIG_HOTPLUG_PCI_CPCI is not set
-# CONFIG_HOTPLUG_PCI_SHPC is not set
-
-#
-# DesignWare PCI Core Support
-#
-# CONFIG_PCIE_DW_PLAT is not set
-# CONFIG_PCI_HISI is not set
-# CONFIG_PCIE_KIRIN is not set
-
-#
-# PCI host controller drivers
-#
-# CONFIG_PCI_HOST_GENERIC is not set
-# CONFIG_PCI_XGENE is not set
-# CONFIG_PCI_HOST_THUNDER_PEM is not set
-# CONFIG_PCI_HOST_THUNDER_ECAM is not set
-
-#
-# PCI Endpoint
-#
-# CONFIG_PCI_ENDPOINT is not set
-
-#
-# PCI switch controller drivers
-#
-# CONFIG_PCI_SW_SWITCHTEC is not set
-
-#
-# Kernel Features
-#
-
-#
-# ARM errata workarounds via the alternatives framework
-#
-CONFIG_ARM64_ERRATUM_826319=y
-CONFIG_ARM64_ERRATUM_827319=y
-CONFIG_ARM64_ERRATUM_824069=y
-CONFIG_ARM64_ERRATUM_819472=y
-CONFIG_ARM64_ERRATUM_832075=y
-CONFIG_ARM64_ERRATUM_843419=y
-CONFIG_CAVIUM_ERRATUM_22375=y
-CONFIG_CAVIUM_ERRATUM_23154=y
-CONFIG_CAVIUM_ERRATUM_27456=y
-CONFIG_CAVIUM_ERRATUM_30115=y
-CONFIG_QCOM_FALKOR_ERRATUM_1003=y
-CONFIG_QCOM_FALKOR_ERRATUM_1009=y
-CONFIG_QCOM_QDF2400_ERRATUM_0065=y
-CONFIG_ARM64_4K_PAGES=y
-# CONFIG_ARM64_16K_PAGES is not set
-# CONFIG_ARM64_64K_PAGES is not set
-CONFIG_ARM64_VA_BITS_39=y
-# CONFIG_ARM64_VA_BITS_48 is not set
-CONFIG_ARM64_VA_BITS=39
-# CONFIG_CPU_BIG_ENDIAN is not set
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_SMT=y
-CONFIG_NR_CPUS=8
-CONFIG_HOTPLUG_CPU=y
-# CONFIG_NUMA is not set
-# CONFIG_PREEMPT_NONE is not set
-# CONFIG_PREEMPT_VOLUNTARY is not set
-CONFIG_PREEMPT=y
-CONFIG_PREEMPT_COUNT=y
-# CONFIG_HZ_100 is not set
-CONFIG_HZ_250=y
-# CONFIG_HZ_300 is not set
-# CONFIG_HZ_1000 is not set
-CONFIG_HZ=250
-CONFIG_SCHED_HRTICK=y
-CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
-CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
-CONFIG_ARCH_SPARSEMEM_ENABLE=y
-CONFIG_ARCH_SPARSEMEM_DEFAULT=y
-CONFIG_ARCH_SELECT_MEMORY_MODEL=y
-CONFIG_HAVE_ARCH_PFN_VALID=y
-CONFIG_HW_PERF_EVENTS=y
-CONFIG_SYS_SUPPORTS_HUGETLBFS=y
-CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
-CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
-CONFIG_SELECT_MEMORY_MODEL=y
-CONFIG_SPARSEMEM_MANUAL=y
-CONFIG_SPARSEMEM=y
-CONFIG_HAVE_MEMORY_PRESENT=y
-CONFIG_SPARSEMEM_EXTREME=y
-CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
-CONFIG_SPARSEMEM_VMEMMAP=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_NO_BOOTMEM=y
-# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
-CONFIG_SPLIT_PTLOCK_CPUS=4
-CONFIG_COMPACTION=y
-CONFIG_MIGRATION=y
-CONFIG_PHYS_ADDR_T_64BIT=y
-CONFIG_BOUNCE=y
 CONFIG_KSM=y
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
-# CONFIG_MEMORY_FAILURE is not set
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
-# CONFIG_ARCH_WANTS_THP_SWAP is not set
 CONFIG_CLEANCACHE=y
 CONFIG_FRONTSWAP=y
-# CONFIG_CMA is not set
 CONFIG_ZSWAP=y
-CONFIG_ZPOOL=y
-# CONFIG_ZBUD is not set
-# CONFIG_Z3FOLD is not set
 CONFIG_ZSMALLOC=y
-# CONFIG_PGTABLE_MAPPING is not set
-# CONFIG_ZSMALLOC_STAT is not set
-CONFIG_GENERIC_EARLY_IOREMAP=y
-# CONFIG_IDLE_PAGE_TRACKING is not set
-# CONFIG_PERCPU_STATS is not set
-# CONFIG_SECCOMP is not set
-# CONFIG_PARAVIRT is not set
-# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
-# CONFIG_CRASH_DUMP is not set
-# CONFIG_XEN is not set
-CONFIG_FORCE_MAX_ZONEORDER=11
-# CONFIG_ARM64_SW_TTBR0_PAN is not set
-
-#
-# ARMv8.1 architectural features
-#
-CONFIG_ARM64_HW_AFDBM=y
-CONFIG_ARM64_PAN=y
-# CONFIG_ARM64_LSE_ATOMICS is not set
-CONFIG_ARM64_VHE=y
-
-#
-# ARMv8.2 architectural features
-#
-CONFIG_ARM64_UAO=y
-CONFIG_ARM64_MODULE_CMODEL_LARGE=y
-# CONFIG_RANDOMIZE_BASE is not set
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="mem=16G"
-# CONFIG_CMDLINE_FORCE is not set
-CONFIG_EFI_STUB=y
-CONFIG_EFI=y
-CONFIG_DMI=y
-
-#
-# Userspace binary formats
-#
-CONFIG_BINFMT_ELF=y
-CONFIG_ELFCORE=y
-CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
-CONFIG_BINFMT_SCRIPT=y
-# CONFIG_HAVE_AOUT is not set
-# CONFIG_BINFMT_MISC is not set
-CONFIG_COREDUMP=y
-# CONFIG_COMPAT is not set
-
-#
-# Power management options
-#
-# CONFIG_SUSPEND is not set
-# CONFIG_PM is not set
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-
-#
-# CPU Power Management
-#
-
-#
-# CPU Idle
-#
-# CONFIG_CPU_IDLE is not set
-# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
-
-#
-# CPU Frequency scaling
-#
-# CONFIG_CPU_FREQ is not set
 CONFIG_NET=y
-CONFIG_NET_INGRESS=y
-
-#
-# Networking options
-#
 CONFIG_PACKET=y
-# CONFIG_PACKET_DIAG is not set
 CONFIG_UNIX=y
-# CONFIG_UNIX_DIAG is not set
-# CONFIG_TLS is not set
-CONFIG_XFRM=y
-CONFIG_XFRM_ALGO=y
 CONFIG_XFRM_USER=y
 CONFIG_XFRM_SUB_POLICY=y
 CONFIG_XFRM_MIGRATE=y
 CONFIG_XFRM_STATISTICS=y
-# CONFIG_NET_KEY is not set
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
@@ -626,2832 +79,252 @@ CONFIG_IP_FIB_TRIE_STATS=y
 CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_ROUTE_VERBOSE=y
-# CONFIG_IP_PNP is not set
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE_DEMUX is not set
-# CONFIG_NET_IP_TUNNEL is not set
 CONFIG_IP_MROUTE=y
 CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_NET_UDP_TUNNEL is not set
-# CONFIG_NET_FOU is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
-CONFIG_TCP_CONG_CUBIC=y
 # CONFIG_TCP_CONG_WESTWOOD is not set
 # CONFIG_TCP_CONG_HTCP is not set
-# CONFIG_TCP_CONG_HSTCP is not set
-# CONFIG_TCP_CONG_HYBLA is not set
-# CONFIG_TCP_CONG_VEGAS is not set
-# CONFIG_TCP_CONG_NV is not set
-# CONFIG_TCP_CONG_SCALABLE is not set
-# CONFIG_TCP_CONG_LP is not set
-# CONFIG_TCP_CONG_VENO is not set
-# CONFIG_TCP_CONG_YEAH is not set
-# CONFIG_TCP_CONG_ILLINOIS is not set
-# CONFIG_TCP_CONG_DCTCP is not set
-# CONFIG_TCP_CONG_CDG is not set
-# CONFIG_TCP_CONG_BBR is not set
-CONFIG_DEFAULT_CUBIC=y
-# CONFIG_DEFAULT_RENO is not set
-CONFIG_DEFAULT_TCP_CONG="cubic"
 CONFIG_TCP_MD5SIG=y
-CONFIG_IPV6=y
 CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_ROUTE_INFO=y
 CONFIG_IPV6_OPTIMISTIC_DAD=y
-# CONFIG_INET6_AH is not set
-# CONFIG_INET6_ESP is not set
-# CONFIG_INET6_IPCOMP is not set
 CONFIG_IPV6_MIP6=y
-# CONFIG_IPV6_ILA is not set
-# CONFIG_INET6_XFRM_TUNNEL is not set
-# CONFIG_INET6_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
-# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
 # CONFIG_IPV6_SIT is not set
-# CONFIG_IPV6_TUNNEL is not set
-# CONFIG_IPV6_FOU is not set
-# CONFIG_IPV6_FOU_TUNNEL is not set
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_SUBTREES=y
 CONFIG_IPV6_MROUTE=y
 CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
 CONFIG_IPV6_PIMSM_V2=y
-# CONFIG_IPV6_SEG6_LWTUNNEL is not set
-# CONFIG_IPV6_SEG6_HMAC is not set
 CONFIG_NETLABEL=y
-CONFIG_NETWORK_SECMARK=y
-CONFIG_NET_PTP_CLASSIFY=y
 CONFIG_NETWORK_PHY_TIMESTAMPING=y
 CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_DEBUG is not set
-CONFIG_NETFILTER_ADVANCED=y
-
-#
-# Core Netfilter Configuration
-#
-CONFIG_NETFILTER_INGRESS=y
-# CONFIG_NETFILTER_NETLINK_ACCT is not set
-# CONFIG_NETFILTER_NETLINK_QUEUE is not set
-# CONFIG_NETFILTER_NETLINK_LOG is not set
-# CONFIG_NF_CONNTRACK is not set
-# CONFIG_NF_LOG_NETDEV is not set
-# CONFIG_NF_TABLES is not set
-CONFIG_NETFILTER_XTABLES=y
-
-#
-# Xtables combined modules
-#
-# CONFIG_NETFILTER_XT_MARK is not set
-
-#
-# Xtables targets
-#
-# CONFIG_NETFILTER_XT_TARGET_AUDIT is not set
-# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
-# CONFIG_NETFILTER_XT_TARGET_HMARK is not set
-# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
-# CONFIG_NETFILTER_XT_TARGET_LED is not set
-# CONFIG_NETFILTER_XT_TARGET_LOG is not set
-# CONFIG_NETFILTER_XT_TARGET_MARK is not set
-# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
-# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
-# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
-# CONFIG_NETFILTER_XT_TARGET_TEE is not set
-# CONFIG_NETFILTER_XT_TARGET_SECMARK is not set
-# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
-
-#
-# Xtables matches
-#
-# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
-# CONFIG_NETFILTER_XT_MATCH_BPF is not set
-# CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
-# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
-# CONFIG_NETFILTER_XT_MATCH_CPU is not set
-# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
-# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
-# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
-# CONFIG_NETFILTER_XT_MATCH_ECN is not set
-# CONFIG_NETFILTER_XT_MATCH_ESP is not set
-# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_HL is not set
-# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
-# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
-# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
-# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
-# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
-# CONFIG_NETFILTER_XT_MATCH_MAC is not set
-# CONFIG_NETFILTER_XT_MATCH_MARK is not set
-# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
-# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
-# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
-# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
-# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
-# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
-# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
-# CONFIG_NETFILTER_XT_MATCH_REALM is not set
-# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
-# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
-# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
-# CONFIG_NETFILTER_XT_MATCH_STRING is not set
-# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
-# CONFIG_NETFILTER_XT_MATCH_TIME is not set
-# CONFIG_NETFILTER_XT_MATCH_U32 is not set
-# CONFIG_IP_SET is not set
-# CONFIG_IP_VS is not set
-
-#
-# IP: Netfilter Configuration
-#
-# CONFIG_NF_DEFRAG_IPV4 is not set
-# CONFIG_NF_SOCKET_IPV4 is not set
-# CONFIG_NF_DUP_IPV4 is not set
-# CONFIG_NF_LOG_ARP is not set
-# CONFIG_NF_LOG_IPV4 is not set
-CONFIG_NF_REJECT_IPV4=y
 CONFIG_IP_NF_IPTABLES=y
-# CONFIG_IP_NF_MATCH_AH is not set
-# CONFIG_IP_NF_MATCH_ECN is not set
-# CONFIG_IP_NF_MATCH_TTL is not set
 CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_TARGET_REJECT=y
-# CONFIG_IP_NF_MANGLE is not set
-# CONFIG_IP_NF_RAW is not set
-# CONFIG_IP_NF_SECURITY is not set
-# CONFIG_IP_NF_ARPTABLES is not set
-
-#
-# IPv6: Netfilter Configuration
-#
-# CONFIG_NF_DEFRAG_IPV6 is not set
-# CONFIG_NF_SOCKET_IPV6 is not set
-# CONFIG_NF_DUP_IPV6 is not set
-# CONFIG_NF_REJECT_IPV6 is not set
-# CONFIG_NF_LOG_IPV6 is not set
-# CONFIG_IP6_NF_IPTABLES is not set
-# CONFIG_IP_DCCP is not set
-# CONFIG_IP_SCTP is not set
-# CONFIG_RDS is not set
-# CONFIG_TIPC is not set
-# CONFIG_ATM is not set
-# CONFIG_L2TP is not set
-# CONFIG_BRIDGE is not set
-CONFIG_HAVE_NET_DSA=y
-# CONFIG_NET_DSA is not set
-# CONFIG_VLAN_8021Q is not set
-# CONFIG_DECNET is not set
-# CONFIG_LLC2 is not set
-# CONFIG_IPX is not set
-# CONFIG_ATALK is not set
-# CONFIG_X25 is not set
-# CONFIG_LAPB is not set
-# CONFIG_PHONET is not set
-# CONFIG_6LOWPAN is not set
-# CONFIG_IEEE802154 is not set
 CONFIG_NET_SCHED=y
-
-#
-# Queueing/Scheduling
-#
-# CONFIG_NET_SCH_CBQ is not set
-# CONFIG_NET_SCH_HTB is not set
-# CONFIG_NET_SCH_HFSC is not set
-# CONFIG_NET_SCH_PRIO is not set
-# CONFIG_NET_SCH_MULTIQ is not set
-# CONFIG_NET_SCH_RED is not set
-# CONFIG_NET_SCH_SFB is not set
-# CONFIG_NET_SCH_SFQ is not set
-# CONFIG_NET_SCH_TEQL is not set
-# CONFIG_NET_SCH_TBF is not set
-# CONFIG_NET_SCH_GRED is not set
-# CONFIG_NET_SCH_DSMARK is not set
-# CONFIG_NET_SCH_NETEM is not set
-# CONFIG_NET_SCH_DRR is not set
-# CONFIG_NET_SCH_MQPRIO is not set
-# CONFIG_NET_SCH_CHOKE is not set
-# CONFIG_NET_SCH_QFQ is not set
-# CONFIG_NET_SCH_CODEL is not set
 CONFIG_NET_SCH_FQ_CODEL=y
-# CONFIG_NET_SCH_FQ is not set
-# CONFIG_NET_SCH_HHF is not set
-# CONFIG_NET_SCH_PIE is not set
-# CONFIG_NET_SCH_INGRESS is not set
-# CONFIG_NET_SCH_PLUG is not set
-# CONFIG_NET_SCH_DEFAULT is not set
-
-#
-# Classification
-#
-CONFIG_NET_CLS=y
-# CONFIG_NET_CLS_BASIC is not set
-# CONFIG_NET_CLS_TCINDEX is not set
-# CONFIG_NET_CLS_ROUTE4 is not set
-# CONFIG_NET_CLS_FW is not set
-# CONFIG_NET_CLS_U32 is not set
-# CONFIG_NET_CLS_RSVP is not set
-# CONFIG_NET_CLS_RSVP6 is not set
-# CONFIG_NET_CLS_FLOW is not set
 CONFIG_NET_CLS_CGROUP=y
-# CONFIG_NET_CLS_BPF is not set
-# CONFIG_NET_CLS_FLOWER is not set
-# CONFIG_NET_CLS_MATCHALL is not set
 CONFIG_NET_EMATCH=y
-CONFIG_NET_EMATCH_STACK=32
-# CONFIG_NET_EMATCH_CMP is not set
-# CONFIG_NET_EMATCH_NBYTE is not set
-# CONFIG_NET_EMATCH_U32 is not set
-# CONFIG_NET_EMATCH_META is not set
-# CONFIG_NET_EMATCH_TEXT is not set
 CONFIG_NET_CLS_ACT=y
-# CONFIG_NET_ACT_POLICE is not set
-# CONFIG_NET_ACT_GACT is not set
-# CONFIG_NET_ACT_MIRRED is not set
-# CONFIG_NET_ACT_SAMPLE is not set
-# CONFIG_NET_ACT_IPT is not set
-# CONFIG_NET_ACT_NAT is not set
-# CONFIG_NET_ACT_PEDIT is not set
-# CONFIG_NET_ACT_SIMP is not set
-# CONFIG_NET_ACT_SKBEDIT is not set
-# CONFIG_NET_ACT_CSUM is not set
-# CONFIG_NET_ACT_VLAN is not set
-# CONFIG_NET_ACT_BPF is not set
-# CONFIG_NET_ACT_SKBMOD is not set
-# CONFIG_NET_ACT_IFE is not set
-# CONFIG_NET_ACT_TUNNEL_KEY is not set
-CONFIG_NET_SCH_FIFO=y
 CONFIG_DCB=y
-CONFIG_DNS_RESOLVER=y
-# CONFIG_BATMAN_ADV is not set
-# CONFIG_OPENVSWITCH is not set
-# CONFIG_VSOCKETS is not set
-# CONFIG_NETLINK_DIAG is not set
-# CONFIG_MPLS is not set
-# CONFIG_HSR is not set
-# CONFIG_NET_SWITCHDEV is not set
-# CONFIG_NET_L3_MASTER_DEV is not set
-# CONFIG_NET_NCSI is not set
-CONFIG_RPS=y
-CONFIG_RFS_ACCEL=y
-CONFIG_XPS=y
 CONFIG_CGROUP_NET_PRIO=y
-CONFIG_CGROUP_NET_CLASSID=y
-CONFIG_NET_RX_BUSY_POLL=y
-CONFIG_BQL=y
-# CONFIG_BPF_JIT is not set
-CONFIG_NET_FLOW_LIMIT=y
-
-#
-# Network testing
-#
-# CONFIG_NET_PKTGEN is not set
 CONFIG_NET_DROP_MONITOR=y
-# CONFIG_HAMRADIO is not set
-# CONFIG_CAN is not set
-# CONFIG_IRDA is not set
-# CONFIG_BT is not set
-# CONFIG_AF_RXRPC is not set
-# CONFIG_AF_KCM is not set
-# CONFIG_STREAM_PARSER is not set
-CONFIG_FIB_RULES=y
-CONFIG_WIRELESS=y
-# CONFIG_CFG80211 is not set
-# CONFIG_LIB80211 is not set
-
-#
-# CFG80211 needs to be enabled for MAC80211
-#
-CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
-# CONFIG_WIMAX is not set
-# CONFIG_RFKILL is not set
-# CONFIG_NET_9P is not set
-# CONFIG_CAIF is not set
-# CONFIG_CEPH_LIB is not set
-# CONFIG_NFC is not set
-# CONFIG_PSAMPLE is not set
-# CONFIG_NET_IFE is not set
-# CONFIG_LWTUNNEL is not set
-# CONFIG_DST_CACHE is not set
-CONFIG_GRO_CELLS=y
-# CONFIG_NET_DEVLINK is not set
-CONFIG_MAY_USE_DEVLINK=y
-CONFIG_HAVE_EBPF_JIT=y
-
-#
-# Device Drivers
-#
-CONFIG_ARM_AMBA=y
-
-#
-# Generic Driver Options
-#
-# CONFIG_UEVENT_HELPER is not set
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_PCIEAER=y
+CONFIG_PCIE_ECRC=y
+CONFIG_PCI_STUB=y
+CONFIG_PCI_IOV=y
+CONFIG_PCI_PRI=y
+CONFIG_PCI_PASID=y
+CONFIG_HOTPLUG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_STANDALONE=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=y
-# CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_EXTRA_FIRMWARE=""
-# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
-CONFIG_ALLOW_DEV_COREDUMP=y
-# CONFIG_DEBUG_DRIVER is not set
 CONFIG_DEBUG_DEVRES=y
-# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
-# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
-# CONFIG_SYS_HYPERVISOR is not set
-# CONFIG_GENERIC_CPU_DEVICES is not set
-CONFIG_GENERIC_CPU_AUTOPROBE=y
-CONFIG_REGMAP=y
-CONFIG_REGMAP_MMIO=y
-# CONFIG_DMA_SHARED_BUFFER is not set
-CONFIG_GENERIC_ARCH_TOPOLOGY=y
-
-#
-# Bus devices
-#
-# CONFIG_ARM_CCI400_PMU is not set
-# CONFIG_ARM_CCI5xx_PMU is not set
-CONFIG_ARM_CCN=y
-# CONFIG_BRCMSTB_GISB_ARB is not set
 CONFIG_VEXPRESS_CONFIG=y
 CONFIG_CONNECTOR=y
-CONFIG_PROC_EVENTS=y
-# CONFIG_MTD is not set
-CONFIG_DTC=y
-CONFIG_OF=y
-# CONFIG_OF_UNITTEST is not set
-CONFIG_OF_FLATTREE=y
-CONFIG_OF_EARLY_FLATTREE=y
-CONFIG_OF_ADDRESS=y
-CONFIG_OF_ADDRESS_PCI=y
-CONFIG_OF_IRQ=y
-CONFIG_OF_NET=y
-CONFIG_OF_MDIO=y
-CONFIG_OF_PCI=y
-CONFIG_OF_PCI_IRQ=y
-CONFIG_OF_RESERVED_MEM=y
-# CONFIG_OF_OVERLAY is not set
-# CONFIG_PARPORT is not set
-CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_NULL_BLK is not set
-# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
-# CONFIG_ZRAM is not set
-# CONFIG_BLK_CPQ_CISS_DA is not set
-# CONFIG_BLK_DEV_DAC960 is not set
-# CONFIG_BLK_DEV_UMEM is not set
-# CONFIG_BLK_DEV_COW_COMMON is not set
-# CONFIG_BLK_DEV_LOOP is not set
-# CONFIG_BLK_DEV_DRBD is not set
-# CONFIG_BLK_DEV_NBD is not set
-# CONFIG_BLK_DEV_SKD is not set
-# CONFIG_BLK_DEV_SX8 is not set
-# CONFIG_BLK_DEV_RAM is not set
-# CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
-# CONFIG_BLK_DEV_RBD is not set
-# CONFIG_BLK_DEV_RSXX is not set
-# CONFIG_BLK_DEV_NVME is not set
-# CONFIG_NVME_FC is not set
-# CONFIG_NVME_TARGET is not set
-
-#
-# Misc devices
-#
-# CONFIG_SENSORS_LIS3LV02D is not set
-# CONFIG_DUMMY_IRQ is not set
-# CONFIG_PHANTOM is not set
-# CONFIG_SGI_IOC4 is not set
-# CONFIG_TIFM_CORE is not set
-# CONFIG_ENCLOSURE_SERVICES is not set
-# CONFIG_HP_ILO is not set
-# CONFIG_SRAM is not set
-CONFIG_VEXPRESS_SYSCFG=y
-# CONFIG_PCI_ENDPOINT_TEST is not set
-# CONFIG_C2PORT is not set
-
-#
-# EEPROM support
-#
-# CONFIG_EEPROM_93CX6 is not set
-# CONFIG_CB710_CORE is not set
-
-#
-# Texas Instruments shared transport line discipline
-#
-# CONFIG_TI_ST is not set
-
-#
-# Altera FPGA firmware download module
-#
-
-#
-# Intel MIC Bus Driver
-#
-
-#
-# SCIF Bus Driver
-#
-
-#
-# VOP Bus Driver
-#
-
-#
-# Intel MIC Host Driver
-#
-
-#
-# Intel MIC Card Driver
-#
-
-#
-# SCIF Driver
-#
-
-#
-# Intel MIC Coprocessor State Management (COSM) Drivers
-#
-
-#
-# VOP Driver
-#
-# CONFIG_GENWQE is not set
-# CONFIG_ECHO is not set
-# CONFIG_CXL_BASE is not set
-# CONFIG_CXL_AFU_DRIVER_OPS is not set
-# CONFIG_CXL_LIB is not set
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-# CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-# CONFIG_SCSI_NETLINK is not set
-# CONFIG_SCSI_MQ_DEFAULT is not set
-CONFIG_SCSI_PROC_FS=y
-
-#
-# SCSI support type (disk, tape, CD-ROM)
-#
 CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
-# CONFIG_CHR_DEV_OSST is not set
 CONFIG_BLK_DEV_SR=y
-CONFIG_BLK_DEV_SR_VENDOR=y
 CONFIG_CHR_DEV_SG=y
-# CONFIG_CHR_DEV_SCH is not set
 CONFIG_SCSI_CONSTANTS=y
 CONFIG_SCSI_LOGGING=y
 CONFIG_SCSI_SCAN_ASYNC=y
-
-#
-# SCSI Transports
-#
-# CONFIG_SCSI_SPI_ATTRS is not set
-# CONFIG_SCSI_FC_ATTRS is not set
-# CONFIG_SCSI_ISCSI_ATTRS is not set
-# CONFIG_SCSI_SAS_ATTRS is not set
-# CONFIG_SCSI_SAS_LIBSAS is not set
-# CONFIG_SCSI_SRP_ATTRS is not set
-CONFIG_SCSI_LOWLEVEL=y
-# CONFIG_ISCSI_TCP is not set
-# CONFIG_ISCSI_BOOT_SYSFS is not set
-# CONFIG_SCSI_CXGB3_ISCSI is not set
-# CONFIG_SCSI_CXGB4_ISCSI is not set
-# CONFIG_SCSI_BNX2_ISCSI is not set
-# CONFIG_BE2ISCSI is not set
-# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
-# CONFIG_SCSI_HPSA is not set
-# CONFIG_SCSI_3W_9XXX is not set
-# CONFIG_SCSI_3W_SAS is not set
-# CONFIG_SCSI_ACARD is not set
-# CONFIG_SCSI_AACRAID is not set
-# CONFIG_SCSI_AIC7XXX is not set
-# CONFIG_SCSI_AIC79XX is not set
-# CONFIG_SCSI_AIC94XX is not set
-# CONFIG_SCSI_HISI_SAS is not set
-# CONFIG_SCSI_MVSAS is not set
-# CONFIG_SCSI_MVUMI is not set
-# CONFIG_SCSI_ADVANSYS is not set
-# CONFIG_SCSI_ARCMSR is not set
-# CONFIG_SCSI_ESAS2R is not set
 CONFIG_MEGARAID_NEWGEN=y
-# CONFIG_MEGARAID_MM is not set
-# CONFIG_MEGARAID_LEGACY is not set
-# CONFIG_MEGARAID_SAS is not set
-# CONFIG_SCSI_MPT3SAS is not set
-# CONFIG_SCSI_MPT2SAS is not set
-# CONFIG_SCSI_SMARTPQI is not set
-# CONFIG_SCSI_UFSHCD is not set
-# CONFIG_SCSI_HPTIOP is not set
-# CONFIG_SCSI_SNIC is not set
-# CONFIG_SCSI_DMX3191D is not set
-# CONFIG_SCSI_FUTURE_DOMAIN is not set
-# CONFIG_SCSI_IPS is not set
-# CONFIG_SCSI_INITIO is not set
-# CONFIG_SCSI_INIA100 is not set
-# CONFIG_SCSI_STEX is not set
-# CONFIG_SCSI_SYM53C8XX_2 is not set
-# CONFIG_SCSI_IPR is not set
-# CONFIG_SCSI_QLOGIC_1280 is not set
-# CONFIG_SCSI_QLA_ISCSI is not set
-# CONFIG_SCSI_DC395x is not set
-# CONFIG_SCSI_AM53C974 is not set
-# CONFIG_SCSI_WD719X is not set
-# CONFIG_SCSI_DEBUG is not set
-# CONFIG_SCSI_PMCRAID is not set
-# CONFIG_SCSI_PM8001 is not set
-# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
 CONFIG_SCSI_DH=y
-# CONFIG_SCSI_DH_RDAC is not set
-# CONFIG_SCSI_DH_HP_SW is not set
-# CONFIG_SCSI_DH_EMC is not set
-# CONFIG_SCSI_DH_ALUA is not set
-# CONFIG_SCSI_OSD_INITIATOR is not set
-CONFIG_HAVE_PATA_PLATFORM=y
 CONFIG_ATA=y
-# CONFIG_ATA_NONSTANDARD is not set
-CONFIG_ATA_VERBOSE_ERROR=y
-CONFIG_SATA_PMP=y
-
-#
-# Controllers with non-SFF native interface
-#
 CONFIG_SATA_AHCI=y
 CONFIG_SATA_AHCI_PLATFORM=y
-# CONFIG_AHCI_CEVA is not set
 CONFIG_AHCI_XGENE=y
-# CONFIG_AHCI_QORIQ is not set
-# CONFIG_SATA_AHCI_SEATTLE is not set
-# CONFIG_SATA_INIC162X is not set
-# CONFIG_SATA_ACARD_AHCI is not set
-# CONFIG_SATA_SIL24 is not set
-CONFIG_ATA_SFF=y
-
-#
-# SFF controllers with custom DMA interface
-#
-# CONFIG_PDC_ADMA is not set
-# CONFIG_SATA_QSTOR is not set
-# CONFIG_SATA_SX4 is not set
-CONFIG_ATA_BMDMA=y
-
-#
-# SATA SFF controllers with BMDMA
-#
 CONFIG_ATA_PIIX=y
-# CONFIG_SATA_DWC is not set
-# CONFIG_SATA_MV is not set
-# CONFIG_SATA_NV is not set
-# CONFIG_SATA_PROMISE is not set
-# CONFIG_SATA_SIL is not set
-# CONFIG_SATA_SIS is not set
-# CONFIG_SATA_SVW is not set
-# CONFIG_SATA_ULI is not set
-# CONFIG_SATA_VIA is not set
-# CONFIG_SATA_VITESSE is not set
-
-#
-# PATA SFF controllers with BMDMA
-#
-# CONFIG_PATA_ALI is not set
-# CONFIG_PATA_AMD is not set
-# CONFIG_PATA_ARTOP is not set
-# CONFIG_PATA_ATIIXP is not set
-# CONFIG_PATA_ATP867X is not set
-# CONFIG_PATA_CMD64X is not set
-# CONFIG_PATA_CYPRESS is not set
-# CONFIG_PATA_EFAR is not set
-# CONFIG_PATA_HPT366 is not set
-# CONFIG_PATA_HPT37X is not set
-# CONFIG_PATA_HPT3X2N is not set
-# CONFIG_PATA_HPT3X3 is not set
-# CONFIG_PATA_IT8213 is not set
-# CONFIG_PATA_IT821X is not set
-# CONFIG_PATA_JMICRON is not set
-# CONFIG_PATA_MARVELL is not set
-# CONFIG_PATA_NETCELL is not set
-# CONFIG_PATA_NINJA32 is not set
-# CONFIG_PATA_NS87415 is not set
-# CONFIG_PATA_OLDPIIX is not set
-# CONFIG_PATA_OPTIDMA is not set
-# CONFIG_PATA_PDC2027X is not set
-# CONFIG_PATA_PDC_OLD is not set
-# CONFIG_PATA_RADISYS is not set
-# CONFIG_PATA_RDC is not set
-# CONFIG_PATA_SCH is not set
-# CONFIG_PATA_SERVERWORKS is not set
-# CONFIG_PATA_SIL680 is not set
-# CONFIG_PATA_SIS is not set
-# CONFIG_PATA_TOSHIBA is not set
-# CONFIG_PATA_TRIFLEX is not set
-# CONFIG_PATA_VIA is not set
-# CONFIG_PATA_WINBOND is not set
-
-#
-# PIO-only SFF controllers
-#
-# CONFIG_PATA_CMD640_PCI is not set
-# CONFIG_PATA_MPIIX is not set
-# CONFIG_PATA_NS87410 is not set
-# CONFIG_PATA_OPTI is not set
-# CONFIG_PATA_PLATFORM is not set
-# CONFIG_PATA_RZ1000 is not set
-
-#
-# Generic fallback / legacy drivers
-#
-# CONFIG_ATA_GENERIC is not set
-# CONFIG_PATA_LEGACY is not set
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=y
-CONFIG_MD_AUTODETECT=y
-# CONFIG_MD_LINEAR is not set
-# CONFIG_MD_RAID0 is not set
-# CONFIG_MD_RAID1 is not set
-# CONFIG_MD_RAID10 is not set
-# CONFIG_MD_RAID456 is not set
-# CONFIG_MD_MULTIPATH is not set
-# CONFIG_MD_FAULTY is not set
-# CONFIG_BCACHE is not set
-CONFIG_BLK_DEV_DM_BUILTIN=y
 CONFIG_BLK_DEV_DM=y
-# CONFIG_DM_MQ_DEFAULT is not set
 CONFIG_DM_DEBUG=y
-CONFIG_DM_BUFIO=y
-# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
-# CONFIG_DM_CRYPT is not set
 CONFIG_DM_SNAPSHOT=y
-# CONFIG_DM_THIN_PROVISIONING is not set
-# CONFIG_DM_CACHE is not set
-# CONFIG_DM_ERA is not set
 CONFIG_DM_MIRROR=y
-# CONFIG_DM_LOG_USERSPACE is not set
-# CONFIG_DM_RAID is not set
 CONFIG_DM_ZERO=y
-# CONFIG_DM_MULTIPATH is not set
-# CONFIG_DM_DELAY is not set
 CONFIG_DM_UEVENT=y
-# CONFIG_DM_FLAKEY is not set
-# CONFIG_DM_VERITY is not set
-# CONFIG_DM_SWITCH is not set
-# CONFIG_DM_LOG_WRITES is not set
-# CONFIG_DM_INTEGRITY is not set
-# CONFIG_TARGET_CORE is not set
-# CONFIG_FUSION is not set
-
-#
-# IEEE 1394 (FireWire) support
-#
-# CONFIG_FIREWIRE is not set
-# CONFIG_FIREWIRE_NOSY is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_CORE=y
-# CONFIG_BONDING is not set
-# CONFIG_DUMMY is not set
-# CONFIG_EQUALIZER is not set
 CONFIG_NET_FC=y
-# CONFIG_IFB is not set
-# CONFIG_NET_TEAM is not set
-# CONFIG_MACVLAN is not set
-# CONFIG_VXLAN is not set
-# CONFIG_MACSEC is not set
-# CONFIG_NETCONSOLE is not set
-# CONFIG_NETPOLL is not set
-# CONFIG_NET_POLL_CONTROLLER is not set
-# CONFIG_TUN is not set
-# CONFIG_TUN_VNET_CROSS_LE is not set
-# CONFIG_VETH is not set
-# CONFIG_NLMON is not set
-# CONFIG_ARCNET is not set
-
-#
-# CAIF transport drivers
-#
-
-#
-# Distributed Switch Architecture drivers
-#
-CONFIG_ETHERNET=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-CONFIG_NET_VENDOR_AGERE=y
-# CONFIG_ET131X is not set
-CONFIG_NET_VENDOR_ALACRITECH=y
-# CONFIG_SLICOSS is not set
-CONFIG_NET_VENDOR_ALTEON=y
-# CONFIG_ACENIC is not set
-# CONFIG_ALTERA_TSE is not set
-CONFIG_NET_VENDOR_AMAZON=y
-CONFIG_NET_VENDOR_AMD=y
-# CONFIG_AMD8111_ETH is not set
-# CONFIG_PCNET32 is not set
 CONFIG_AMD_XGBE=y
-# CONFIG_AMD_XGBE_DCB is not set
-# CONFIG_AMD_XGBE_HAVE_ECC is not set
-CONFIG_NET_VENDOR_AQUANTIA=y
-CONFIG_NET_VENDOR_ARC=y
-CONFIG_NET_VENDOR_ATHEROS=y
-# CONFIG_ATL2 is not set
-# CONFIG_ATL1 is not set
-# CONFIG_ATL1E is not set
-# CONFIG_ATL1C is not set
-# CONFIG_ALX is not set
 # CONFIG_NET_VENDOR_AURORA is not set
-CONFIG_NET_CADENCE=y
-# CONFIG_MACB is not set
-CONFIG_NET_VENDOR_BROADCOM=y
-# CONFIG_B44 is not set
-# CONFIG_BCMGENET is not set
-# CONFIG_BNX2 is not set
-# CONFIG_CNIC is not set
-# CONFIG_TIGON3 is not set
-# CONFIG_BNX2X is not set
-# CONFIG_SYSTEMPORT is not set
-# CONFIG_BNXT is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
-CONFIG_NET_VENDOR_CAVIUM=y
-# CONFIG_THUNDER_NIC_PF is not set
-# CONFIG_THUNDER_NIC_VF is not set
-# CONFIG_THUNDER_NIC_BGX is not set
-# CONFIG_THUNDER_NIC_RGX is not set
-# CONFIG_LIQUIDIO is not set
-# CONFIG_LIQUIDIO_VF is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
 # CONFIG_NET_VENDOR_CISCO is not set
-# CONFIG_DNET is not set
 # CONFIG_NET_VENDOR_DEC is not set
-CONFIG_NET_VENDOR_DLINK=y
-# CONFIG_DL2K is not set
-# CONFIG_SUNDANCE is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
-CONFIG_NET_VENDOR_EZCHIP=y
-# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
-# CONFIG_NET_VENDOR_EXAR is not set
-CONFIG_NET_VENDOR_HISILICON=y
-# CONFIG_HIX5HD2_GMAC is not set
-# CONFIG_HISI_FEMAC is not set
-# CONFIG_HIP04_ETH is not set
-# CONFIG_HNS is not set
-# CONFIG_HNS_DSAF is not set
-# CONFIG_HNS_ENET is not set
-# CONFIG_NET_VENDOR_HP is not set
-CONFIG_NET_VENDOR_INTEL=y
-# CONFIG_E100 is not set
-# CONFIG_E1000 is not set
-# CONFIG_E1000E is not set
-# CONFIG_IGB is not set
-# CONFIG_IGBVF is not set
-# CONFIG_IXGB is not set
-# CONFIG_IXGBE is not set
-# CONFIG_IXGBEVF is not set
-# CONFIG_I40E is not set
-# CONFIG_I40EVF is not set
-# CONFIG_FM10K is not set
 # CONFIG_NET_VENDOR_I825XX is not set
-# CONFIG_JME is not set
-CONFIG_NET_VENDOR_MARVELL=y
-# CONFIG_MVMDIO is not set
-# CONFIG_SKGE is not set
-# CONFIG_SKY2 is not set
 # CONFIG_NET_VENDOR_MELLANOX is not set
-CONFIG_NET_VENDOR_MICREL=y
-# CONFIG_KS8842 is not set
-# CONFIG_KS8851_MLL is not set
-# CONFIG_KSZ884X_PCI is not set
-CONFIG_NET_VENDOR_MYRI=y
-# CONFIG_MYRI10GE is not set
-# CONFIG_FEALNX is not set
-CONFIG_NET_VENDOR_NATSEMI=y
-# CONFIG_NATSEMI is not set
-# CONFIG_NS83820 is not set
-CONFIG_NET_VENDOR_NETRONOME=y
-# CONFIG_NFP is not set
-CONFIG_NET_VENDOR_8390=y
-# CONFIG_NE2K_PCI is not set
-CONFIG_NET_VENDOR_NVIDIA=y
-# CONFIG_FORCEDETH is not set
-CONFIG_NET_VENDOR_OKI=y
-# CONFIG_ETHOC is not set
-CONFIG_NET_PACKET_ENGINE=y
-# CONFIG_HAMACHI is not set
-# CONFIG_YELLOWFIN is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
-CONFIG_NET_VENDOR_QUALCOMM=y
-# CONFIG_QCOM_EMAC is not set
-CONFIG_NET_VENDOR_REALTEK=y
-# CONFIG_8139CP is not set
-# CONFIG_8139TOO is not set
-# CONFIG_R8169 is not set
-CONFIG_NET_VENDOR_RENESAS=y
-CONFIG_NET_VENDOR_RDC=y
-# CONFIG_R6040 is not set
-CONFIG_NET_VENDOR_ROCKER=y
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
-CONFIG_NET_VENDOR_SILAN=y
-# CONFIG_SC92031 is not set
-CONFIG_NET_VENDOR_SIS=y
-# CONFIG_SIS900 is not set
-# CONFIG_SIS190 is not set
-CONFIG_NET_VENDOR_SOLARFLARE=y
-# CONFIG_SFC is not set
-# CONFIG_SFC_FALCON is not set
-CONFIG_NET_VENDOR_SMSC=y
-# CONFIG_SMC91X is not set
-# CONFIG_EPIC100 is not set
-# CONFIG_SMSC911X is not set
-# CONFIG_SMSC9420 is not set
-CONFIG_NET_VENDOR_STMICRO=y
-# CONFIG_STMMAC_ETH is not set
 # CONFIG_NET_VENDOR_SUN is not set
-CONFIG_NET_VENDOR_TEHUTI=y
-# CONFIG_TEHUTI is not set
-CONFIG_NET_VENDOR_TI=y
-# CONFIG_TI_CPSW_ALE is not set
-# CONFIG_TLAN is not set
-CONFIG_NET_VENDOR_VIA=y
-# CONFIG_VIA_RHINE is not set
-# CONFIG_VIA_VELOCITY is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_NET_VENDOR_SYNOPSYS=y
-# CONFIG_DWC_XLGMAC is not set
-# CONFIG_FDDI is not set
-# CONFIG_HIPPI is not set
-CONFIG_MDIO_DEVICE=y
-CONFIG_MDIO_BUS=y
-# CONFIG_MDIO_BCM_UNIMAC is not set
-# CONFIG_MDIO_BITBANG is not set
-# CONFIG_MDIO_BUS_MUX_GPIO is not set
-# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
-# CONFIG_MDIO_HISI_FEMAC is not set
-# CONFIG_MDIO_OCTEON is not set
-# CONFIG_MDIO_THUNDER is not set
-CONFIG_PHYLIB=y
-CONFIG_SWPHY=y
-# CONFIG_LED_TRIGGER_PHY is not set
-
-#
-# MII PHY device drivers
-#
-# CONFIG_AMD_PHY is not set
-# CONFIG_AQUANTIA_PHY is not set
-# CONFIG_AT803X_PHY is not set
-# CONFIG_BCM7XXX_PHY is not set
-# CONFIG_BCM87XX_PHY is not set
-# CONFIG_BROADCOM_PHY is not set
-# CONFIG_CICADA_PHY is not set
-# CONFIG_CORTINA_PHY is not set
-# CONFIG_DAVICOM_PHY is not set
-# CONFIG_DP83848_PHY is not set
-# CONFIG_DP83867_PHY is not set
-CONFIG_FIXED_PHY=y
-# CONFIG_ICPLUS_PHY is not set
-# CONFIG_INTEL_XWAY_PHY is not set
-# CONFIG_LSI_ET1011C_PHY is not set
-# CONFIG_LXT_PHY is not set
-# CONFIG_MARVELL_PHY is not set
-# CONFIG_MARVELL_10G_PHY is not set
-# CONFIG_MICREL_PHY is not set
-# CONFIG_MICROCHIP_PHY is not set
-# CONFIG_MICROSEMI_PHY is not set
-# CONFIG_NATIONAL_PHY is not set
-# CONFIG_QSEMI_PHY is not set
-# CONFIG_REALTEK_PHY is not set
-# CONFIG_SMSC_PHY is not set
-# CONFIG_STE10XP is not set
-# CONFIG_TERANETICS_PHY is not set
-# CONFIG_VITESSE_PHY is not set
-# CONFIG_XILINX_GMII2RGMII is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-CONFIG_USB_NET_DRIVERS=y
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-# CONFIG_USB_RTL8152 is not set
-# CONFIG_USB_LAN78XX is not set
-# CONFIG_USB_USBNET is not set
-# CONFIG_USB_IPHETH is not set
-CONFIG_WLAN=y
-CONFIG_WLAN_VENDOR_ADMTEK=y
-CONFIG_WLAN_VENDOR_ATH=y
-# CONFIG_ATH_DEBUG is not set
-# CONFIG_ATH5K_PCI is not set
-CONFIG_WLAN_VENDOR_ATMEL=y
-CONFIG_WLAN_VENDOR_BROADCOM=y
-CONFIG_WLAN_VENDOR_CISCO=y
-CONFIG_WLAN_VENDOR_INTEL=y
-CONFIG_WLAN_VENDOR_INTERSIL=y
-# CONFIG_HOSTAP is not set
-# CONFIG_PRISM54 is not set
-CONFIG_WLAN_VENDOR_MARVELL=y
-CONFIG_WLAN_VENDOR_MEDIATEK=y
-CONFIG_WLAN_VENDOR_RALINK=y
-CONFIG_WLAN_VENDOR_REALTEK=y
-CONFIG_WLAN_VENDOR_RSI=y
-CONFIG_WLAN_VENDOR_ST=y
-CONFIG_WLAN_VENDOR_TI=y
-CONFIG_WLAN_VENDOR_ZYDAS=y
-CONFIG_WLAN_VENDOR_QUANTENNA=y
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
-# CONFIG_WAN is not set
-# CONFIG_VMXNET3 is not set
-# CONFIG_ISDN is not set
-# CONFIG_NVM is not set
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-CONFIG_INPUT_LEDS=y
-CONFIG_INPUT_FF_MEMLESS=y
-# CONFIG_INPUT_POLLDEV is not set
-# CONFIG_INPUT_SPARSEKMAP is not set
-# CONFIG_INPUT_MATRIXKMAP is not set
-
-#
-# Userland interfaces
-#
 CONFIG_INPUT_MOUSEDEV=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
-# CONFIG_INPUT_JOYDEV is not set
 CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_EVBUG is not set
-
-#
-# Input Device Drivers
-#
-CONFIG_INPUT_KEYBOARD=y
-CONFIG_KEYBOARD_ATKBD=y
-# CONFIG_KEYBOARD_LKKBD is not set
-# CONFIG_KEYBOARD_GPIO is not set
-# CONFIG_KEYBOARD_GPIO_POLLED is not set
-# CONFIG_KEYBOARD_MATRIX is not set
-# CONFIG_KEYBOARD_NEWTON is not set
-# CONFIG_KEYBOARD_OPENCORES is not set
-# CONFIG_KEYBOARD_SAMSUNG is not set
-# CONFIG_KEYBOARD_STOWAWAY is not set
-# CONFIG_KEYBOARD_SUNKBD is not set
-# CONFIG_KEYBOARD_OMAP4 is not set
-# CONFIG_KEYBOARD_XTKBD is not set
-# CONFIG_KEYBOARD_BCM is not set
-CONFIG_INPUT_MOUSE=y
-CONFIG_MOUSE_PS2=y
-CONFIG_MOUSE_PS2_ALPS=y
-CONFIG_MOUSE_PS2_BYD=y
-CONFIG_MOUSE_PS2_LOGIPS2PP=y
-CONFIG_MOUSE_PS2_SYNAPTICS=y
-CONFIG_MOUSE_PS2_CYPRESS=y
-CONFIG_MOUSE_PS2_TRACKPOINT=y
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_MOUSE_PS2_SENTELIC=y
-# CONFIG_MOUSE_PS2_TOUCHKIT is not set
-CONFIG_MOUSE_PS2_FOCALTECH=y
-# CONFIG_MOUSE_SERIAL is not set
-# CONFIG_MOUSE_APPLETOUCH is not set
-# CONFIG_MOUSE_BCM5974 is not set
-# CONFIG_MOUSE_VSXXXAA is not set
-# CONFIG_MOUSE_GPIO is not set
-# CONFIG_MOUSE_SYNAPTICS_USB is not set
 CONFIG_INPUT_JOYSTICK=y
-# CONFIG_JOYSTICK_ANALOG is not set
-# CONFIG_JOYSTICK_A3D is not set
-# CONFIG_JOYSTICK_ADI is not set
-# CONFIG_JOYSTICK_COBRA is not set
-# CONFIG_JOYSTICK_GF2K is not set
-# CONFIG_JOYSTICK_GRIP is not set
-# CONFIG_JOYSTICK_GRIP_MP is not set
-# CONFIG_JOYSTICK_GUILLEMOT is not set
-# CONFIG_JOYSTICK_INTERACT is not set
-# CONFIG_JOYSTICK_SIDEWINDER is not set
-# CONFIG_JOYSTICK_TMDC is not set
-# CONFIG_JOYSTICK_IFORCE is not set
-# CONFIG_JOYSTICK_WARRIOR is not set
-# CONFIG_JOYSTICK_MAGELLAN is not set
-# CONFIG_JOYSTICK_SPACEORB is not set
-# CONFIG_JOYSTICK_SPACEBALL is not set
-# CONFIG_JOYSTICK_STINGER is not set
-# CONFIG_JOYSTICK_TWIDJOY is not set
-# CONFIG_JOYSTICK_ZHENHUA is not set
-# CONFIG_JOYSTICK_JOYDUMP is not set
-# CONFIG_JOYSTICK_XPAD is not set
 CONFIG_INPUT_TABLET=y
-# CONFIG_TABLET_USB_ACECAD is not set
-# CONFIG_TABLET_USB_AIPTEK is not set
-# CONFIG_TABLET_USB_GTCO is not set
-# CONFIG_TABLET_USB_HANWANG is not set
-# CONFIG_TABLET_USB_KBTAB is not set
-# CONFIG_TABLET_USB_PEGASUS is not set
-# CONFIG_TABLET_SERIAL_WACOM4 is not set
 CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_PROPERTIES=y
-# CONFIG_TOUCHSCREEN_AD7879 is not set
-# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
-# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
-# CONFIG_TOUCHSCREEN_DYNAPRO is not set
-# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
-# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
-# CONFIG_TOUCHSCREEN_FUJITSU is not set
-# CONFIG_TOUCHSCREEN_GUNZE is not set
-# CONFIG_TOUCHSCREEN_ELO is not set
-# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
-# CONFIG_TOUCHSCREEN_MTOUCH is not set
-# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
-# CONFIG_TOUCHSCREEN_INEXIO is not set
-# CONFIG_TOUCHSCREEN_MK712 is not set
-# CONFIG_TOUCHSCREEN_PENMOUNT is not set
-# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
-# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
-# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
-# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
-# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
 CONFIG_INPUT_MISC=y
-# CONFIG_INPUT_AD714X is not set
-# CONFIG_INPUT_E3X0_BUTTON is not set
-# CONFIG_INPUT_GPIO_BEEPER is not set
-# CONFIG_INPUT_GPIO_TILT_POLLED is not set
-# CONFIG_INPUT_GPIO_DECODER is not set
-# CONFIG_INPUT_ATI_REMOTE2 is not set
-# CONFIG_INPUT_KEYSPAN_REMOTE is not set
-# CONFIG_INPUT_POWERMATE is not set
-# CONFIG_INPUT_YEALINK is not set
-# CONFIG_INPUT_CM109 is not set
-# CONFIG_INPUT_UINPUT is not set
-# CONFIG_INPUT_PWM_BEEPER is not set
-# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
-# CONFIG_INPUT_ADXL34X is not set
-# CONFIG_INPUT_IMS_PCU is not set
-# CONFIG_INPUT_CMA3000 is not set
-# CONFIG_RMI4_CORE is not set
-
-#
-# Hardware I/O ports
-#
-CONFIG_SERIO=y
-CONFIG_SERIO_SERPORT=y
 CONFIG_SERIO_AMBAKMI=y
-# CONFIG_SERIO_PCIPS2 is not set
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_SERIO_RAW is not set
-# CONFIG_SERIO_ALTERA_PS2 is not set
-# CONFIG_SERIO_PS2MULT is not set
-# CONFIG_SERIO_ARC_PS2 is not set
-# CONFIG_SERIO_APBPS2 is not set
-# CONFIG_USERIO is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-CONFIG_TTY=y
-CONFIG_VT=y
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE=y
-CONFIG_HW_CONSOLE=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_UNIX98_PTYS=y
 # CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_NONSTANDARD=y
-# CONFIG_ROCKETPORT is not set
-# CONFIG_CYCLADES is not set
-# CONFIG_MOXA_INTELLIO is not set
-# CONFIG_MOXA_SMARTIO is not set
-# CONFIG_SYNCLINKMP is not set
-# CONFIG_SYNCLINK_GT is not set
-# CONFIG_NOZOMI is not set
-# CONFIG_ISI is not set
-# CONFIG_N_HDLC is not set
-# CONFIG_N_GSM is not set
-# CONFIG_TRACE_SINK is not set
-CONFIG_DEVMEM=y
-
-#
-# Serial drivers
-#
-CONFIG_SERIAL_EARLYCON=y
 CONFIG_SERIAL_8250=y
 # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-# CONFIG_SERIAL_8250_FINTEK is not set
 CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_DMA=y
-CONFIG_SERIAL_8250_PCI=y
-CONFIG_SERIAL_8250_EXAR=y
 CONFIG_SERIAL_8250_NR_UARTS=32
-CONFIG_SERIAL_8250_RUNTIME_UARTS=4
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
-# CONFIG_SERIAL_8250_ASPEED_VUART is not set
 CONFIG_SERIAL_8250_SHARE_IRQ=y
-# CONFIG_SERIAL_8250_DETECT_IRQ is not set
 CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_8250_FSL=y
-# CONFIG_SERIAL_8250_DW is not set
-# CONFIG_SERIAL_8250_RT288X is not set
-# CONFIG_SERIAL_8250_MOXA is not set
 CONFIG_SERIAL_OF_PLATFORM=y
-
-#
-# Non-8250 serial port support
-#
-# CONFIG_SERIAL_AMBA_PL010 is not set
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST=y
-# CONFIG_SERIAL_UARTLITE is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-# CONFIG_SERIAL_JSM is not set
-# CONFIG_SERIAL_SCCNXP is not set
-# CONFIG_SERIAL_ALTERA_JTAGUART is not set
-# CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_XILINX_PS_UART is not set
-# CONFIG_SERIAL_ARC is not set
-# CONFIG_SERIAL_RP2 is not set
-# CONFIG_SERIAL_FSL_LPUART is not set
-# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
-# CONFIG_SERIAL_DEV_BUS is not set
-# CONFIG_HVC_DCC is not set
-# CONFIG_IPMI_HANDLER is not set
+CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_HW_RANDOM=y
-# CONFIG_HW_RANDOM_TIMERIOMEM is not set
-CONFIG_HW_RANDOM_CAVIUM=y
-# CONFIG_R3964 is not set
-# CONFIG_APPLICOM is not set
-
-#
-# PCMCIA character devices
-#
 CONFIG_RAW_DRIVER=y
 CONFIG_MAX_RAW_DEVS=8192
-# CONFIG_TCG_TPM is not set
-CONFIG_DEVPORT=y
-# CONFIG_XILLYBUS is not set
-
-#
-# I2C support
-#
-# CONFIG_I2C is not set
-# CONFIG_SPI is not set
-# CONFIG_SPMI is not set
-# CONFIG_HSI is not set
-CONFIG_PPS=y
-# CONFIG_PPS_DEBUG is not set
-
-#
-# PPS clients support
-#
-# CONFIG_PPS_CLIENT_KTIMER is not set
-# CONFIG_PPS_CLIENT_LDISC is not set
-# CONFIG_PPS_CLIENT_GPIO is not set
-
-#
-# PPS generators support
-#
-
-#
-# PTP clock support
-#
-CONFIG_PTP_1588_CLOCK=y
-# CONFIG_DP83640_PHY is not set
 CONFIG_GPIOLIB=y
-CONFIG_OF_GPIO=y
-# CONFIG_DEBUG_GPIO is not set
 CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_GENERIC=y
-
-#
-# Memory mapped GPIO drivers
-#
-# CONFIG_GPIO_74XX_MMIO is not set
-# CONFIG_GPIO_ALTERA is not set
-# CONFIG_GPIO_DWAPB is not set
-# CONFIG_GPIO_EXAR is not set
-# CONFIG_GPIO_FTGPIO010 is not set
-CONFIG_GPIO_GENERIC_PLATFORM=y
-# CONFIG_GPIO_GRGPIO is not set
-# CONFIG_GPIO_MOCKUP is not set
-# CONFIG_GPIO_PL061 is not set
-# CONFIG_GPIO_SYSCON is not set
-# CONFIG_GPIO_XGENE is not set
-# CONFIG_GPIO_XILINX is not set
-
-#
-# MFD GPIO expanders
-#
-
-#
-# PCI GPIO expanders
-#
-# CONFIG_GPIO_BT8XX is not set
-# CONFIG_GPIO_PCI_IDIO_16 is not set
-# CONFIG_GPIO_RDC321X is not set
-
-#
-# USB GPIO expanders
-#
-# CONFIG_W1 is not set
-# CONFIG_POWER_AVS is not set
-CONFIG_POWER_RESET=y
-# CONFIG_POWER_RESET_BRCMSTB is not set
 CONFIG_POWER_RESET_GPIO=y
-# CONFIG_POWER_RESET_GPIO_RESTART is not set
-# CONFIG_POWER_RESET_LTC2952 is not set
-# CONFIG_POWER_RESET_RESTART is not set
 CONFIG_POWER_RESET_VEXPRESS=y
 CONFIG_POWER_RESET_XGENE=y
-# CONFIG_POWER_RESET_SYSCON is not set
-# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
-# CONFIG_SYSCON_REBOOT_MODE is not set
-CONFIG_POWER_SUPPLY=y
-# CONFIG_POWER_SUPPLY_DEBUG is not set
-# CONFIG_PDA_POWER is not set
-# CONFIG_TEST_POWER is not set
-# CONFIG_BATTERY_DS2780 is not set
-# CONFIG_BATTERY_DS2781 is not set
-# CONFIG_BATTERY_BQ27XXX is not set
-# CONFIG_CHARGER_MAX8903 is not set
-# CONFIG_CHARGER_GPIO is not set
-# CONFIG_CHARGER_LTC3651 is not set
-CONFIG_HWMON=y
-# CONFIG_HWMON_VID is not set
-# CONFIG_HWMON_DEBUG_CHIP is not set
-
-#
-# Native drivers
-#
-# CONFIG_SENSORS_ASPEED is not set
-# CONFIG_SENSORS_I5K_AMB is not set
-# CONFIG_SENSORS_F71805F is not set
-# CONFIG_SENSORS_F71882FG is not set
-# CONFIG_SENSORS_GPIO_FAN is not set
-# CONFIG_SENSORS_IT87 is not set
-# CONFIG_SENSORS_MAX197 is not set
-# CONFIG_SENSORS_PC87360 is not set
-# CONFIG_SENSORS_PC87427 is not set
-# CONFIG_SENSORS_NTC_THERMISTOR is not set
-# CONFIG_SENSORS_NCT6683 is not set
-# CONFIG_SENSORS_NCT6775 is not set
-# CONFIG_SENSORS_PWM_FAN is not set
-# CONFIG_SENSORS_SHT15 is not set
-# CONFIG_SENSORS_SIS5595 is not set
-# CONFIG_SENSORS_SMSC47M1 is not set
-# CONFIG_SENSORS_SMSC47B397 is not set
-# CONFIG_SENSORS_SCH56XX_COMMON is not set
-# CONFIG_SENSORS_SCH5627 is not set
-# CONFIG_SENSORS_SCH5636 is not set
-# CONFIG_SENSORS_VEXPRESS is not set
-# CONFIG_SENSORS_VIA686A is not set
-# CONFIG_SENSORS_VT1211 is not set
-# CONFIG_SENSORS_VT8231 is not set
-# CONFIG_SENSORS_W83627HF is not set
-# CONFIG_SENSORS_W83627EHF is not set
-# CONFIG_THERMAL is not set
 CONFIG_WATCHDOG=y
 CONFIG_WATCHDOG_CORE=y
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
-# CONFIG_WATCHDOG_SYSFS is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_GPIO_WATCHDOG is not set
-# CONFIG_XILINX_WATCHDOG is not set
-# CONFIG_ARM_SP805_WATCHDOG is not set
-# CONFIG_ARM_SBSA_WATCHDOG is not set
-# CONFIG_CADENCE_WATCHDOG is not set
-# CONFIG_DW_WATCHDOG is not set
-# CONFIG_MAX63XX_WATCHDOG is not set
-# CONFIG_ALIM7101_WDT is not set
-# CONFIG_I6300ESB_WDT is not set
-# CONFIG_MEN_A21_WDT is not set
-
-#
-# PCI-based Watchdog Cards
-#
-# CONFIG_PCIPCWATCHDOG is not set
-# CONFIG_WDTPCI is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
-
-#
-# Watchdog Pretimeout Governors
-#
-# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# Broadcom specific AMBA
-#
-# CONFIG_BCMA is not set
-
-#
-# Multifunction device drivers
-#
-CONFIG_MFD_CORE=y
-# CONFIG_MFD_ATMEL_FLEXCOM is not set
-# CONFIG_MFD_ATMEL_HLCDC is not set
-# CONFIG_MFD_CROS_EC is not set
-# CONFIG_MFD_DLN2 is not set
-# CONFIG_MFD_HI6421_PMIC is not set
-# CONFIG_HTC_PASIC3 is not set
-# CONFIG_LPC_ICH is not set
-# CONFIG_LPC_SCH is not set
-# CONFIG_MFD_JANZ_CMODIO is not set
-# CONFIG_MFD_KEMPLD is not set
-# CONFIG_MFD_MT6397 is not set
-# CONFIG_MFD_VIPERBOARD is not set
-# CONFIG_MFD_RDC321X is not set
-# CONFIG_MFD_RTSX_PCI is not set
-# CONFIG_MFD_RTSX_USB is not set
-# CONFIG_MFD_SM501 is not set
-# CONFIG_ABX500_CORE is not set
-CONFIG_MFD_SYSCON=y
-# CONFIG_MFD_TI_AM335X_TSCADC is not set
-# CONFIG_MFD_TMIO is not set
-# CONFIG_MFD_VX855 is not set
-CONFIG_MFD_VEXPRESS_SYSREG=y
-# CONFIG_REGULATOR is not set
-# CONFIG_MEDIA_SUPPORT is not set
-
-#
-# Graphics support
-#
-CONFIG_VGA_ARB=y
-CONFIG_VGA_ARB_MAX_GPUS=16
-# CONFIG_DRM is not set
-
-#
-# ACP (Audio CoProcessor) Configuration
-#
-# CONFIG_DRM_LIB_RANDOM is not set
-
-#
-# Frame buffer Devices
-#
 CONFIG_FB=y
-# CONFIG_FIRMWARE_EDID is not set
-CONFIG_FB_CMDLINE=y
-CONFIG_FB_NOTIFY=y
-# CONFIG_FB_DDC is not set
-# CONFIG_FB_BOOT_VESA_SUPPORT is not set
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-# CONFIG_FB_SYS_FILLRECT is not set
-# CONFIG_FB_SYS_COPYAREA is not set
-# CONFIG_FB_SYS_IMAGEBLIT is not set
-# CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
-# CONFIG_FB_FOREIGN_ENDIAN is not set
-# CONFIG_FB_SYS_FOPS is not set
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
-
-#
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_CIRRUS is not set
-# CONFIG_FB_PM2 is not set
 CONFIG_FB_ARMCLCD=y
-# CONFIG_FB_CYBER2000 is not set
-# CONFIG_FB_ASILIANT is not set
-# CONFIG_FB_IMSTT is not set
-# CONFIG_FB_UVESA is not set
-# CONFIG_FB_EFI is not set
-# CONFIG_FB_OPENCORES is not set
-# CONFIG_FB_S1D13XXX is not set
-# CONFIG_FB_NVIDIA is not set
-# CONFIG_FB_RIVA is not set
-# CONFIG_FB_I740 is not set
-# CONFIG_FB_MATROX is not set
-# CONFIG_FB_RADEON is not set
-# CONFIG_FB_ATY128 is not set
-# CONFIG_FB_ATY is not set
-# CONFIG_FB_S3 is not set
-# CONFIG_FB_SAVAGE is not set
-# CONFIG_FB_SIS is not set
-# CONFIG_FB_NEOMAGIC is not set
-# CONFIG_FB_KYRO is not set
-# CONFIG_FB_3DFX is not set
-# CONFIG_FB_VOODOO1 is not set
-# CONFIG_FB_VT8623 is not set
-# CONFIG_FB_TRIDENT is not set
-# CONFIG_FB_ARK is not set
-# CONFIG_FB_PM3 is not set
-# CONFIG_FB_CARMINE is not set
-# CONFIG_FB_SMSCUFX is not set
-# CONFIG_FB_UDL is not set
-# CONFIG_FB_IBM_GXT4500 is not set
-# CONFIG_FB_VIRTUAL is not set
-# CONFIG_FB_METRONOME is not set
-# CONFIG_FB_MB862XX is not set
-# CONFIG_FB_BROADSHEET is not set
-# CONFIG_FB_AUO_K190X is not set
 CONFIG_FB_SIMPLE=y
-# CONFIG_FB_SM712 is not set
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
-# CONFIG_BACKLIGHT_PWM is not set
-# CONFIG_BACKLIGHT_PM8941_WLED is not set
-# CONFIG_BACKLIGHT_GPIO is not set
-# CONFIG_VGASTATE is not set
-CONFIG_VIDEOMODE_HELPERS=y
-
-#
-# Console display driver support
-#
-CONFIG_DUMMY_CONSOLE=y
-CONFIG_DUMMY_CONSOLE_COLUMNS=80
-CONFIG_DUMMY_CONSOLE_ROWS=25
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_LOGO_LINUX_CLUT224=y
-# CONFIG_SOUND is not set
-
-#
-# HID support
-#
-CONFIG_HID=y
 CONFIG_HID_BATTERY_STRENGTH=y
 CONFIG_HIDRAW=y
-# CONFIG_UHID is not set
-CONFIG_HID_GENERIC=y
-
-#
-# Special HID drivers
-#
-CONFIG_HID_A4TECH=y
-# CONFIG_HID_ACCUTOUCH is not set
-# CONFIG_HID_ACRUX is not set
-CONFIG_HID_APPLE=y
-# CONFIG_HID_APPLEIR is not set
-# CONFIG_HID_ASUS is not set
-# CONFIG_HID_AUREAL is not set
-CONFIG_HID_BELKIN=y
-# CONFIG_HID_BETOP_FF is not set
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-# CONFIG_HID_CORSAIR is not set
-# CONFIG_HID_CMEDIA is not set
-CONFIG_HID_CYPRESS=y
-# CONFIG_HID_DRAGONRISE is not set
-# CONFIG_HID_EMS_FF is not set
-# CONFIG_HID_ELECOM is not set
-# CONFIG_HID_ELO is not set
-CONFIG_HID_EZKEY=y
-# CONFIG_HID_GEMBIRD is not set
-# CONFIG_HID_GFRM is not set
-# CONFIG_HID_HOLTEK is not set
-# CONFIG_HID_GT683R is not set
-# CONFIG_HID_KEYTOUCH is not set
-# CONFIG_HID_KYE is not set
-# CONFIG_HID_UCLOGIC is not set
-# CONFIG_HID_WALTOP is not set
-# CONFIG_HID_GYRATION is not set
-# CONFIG_HID_ICADE is not set
-CONFIG_HID_ITE=y
-# CONFIG_HID_TWINHAN is not set
-CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_LCPOWER is not set
-# CONFIG_HID_LED is not set
-# CONFIG_HID_LENOVO is not set
-CONFIG_HID_LOGITECH=y
-# CONFIG_HID_LOGITECH_DJ is not set
-# CONFIG_HID_LOGITECH_HIDPP is not set
 CONFIG_LOGITECH_FF=y
 CONFIG_LOGIRUMBLEPAD2_FF=y
 CONFIG_LOGIG940_FF=y
-CONFIG_LOGIWHEELS_FF=y
 CONFIG_HID_MAGICMOUSE=y
-# CONFIG_HID_MAYFLASH is not set
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-# CONFIG_HID_MULTITOUCH is not set
-# CONFIG_HID_NTI is not set
 CONFIG_HID_NTRIG=y
-# CONFIG_HID_ORTEK is not set
-# CONFIG_HID_PANTHERLORD is not set
-# CONFIG_HID_PENMOUNT is not set
-# CONFIG_HID_PETALYNX is not set
-# CONFIG_HID_PICOLCD is not set
-# CONFIG_HID_PLANTRONICS is not set
-# CONFIG_HID_PRIMAX is not set
-# CONFIG_HID_RETRODE is not set
-# CONFIG_HID_ROCCAT is not set
-# CONFIG_HID_SAITEK is not set
-# CONFIG_HID_SAMSUNG is not set
-# CONFIG_HID_SONY is not set
-# CONFIG_HID_SPEEDLINK is not set
-# CONFIG_HID_STEELSERIES is not set
-# CONFIG_HID_SUNPLUS is not set
-# CONFIG_HID_RMI is not set
-# CONFIG_HID_GREENASIA is not set
-# CONFIG_HID_SMARTJOYPLUS is not set
-# CONFIG_HID_TIVO is not set
-# CONFIG_HID_TOPSEED is not set
-# CONFIG_HID_THINGM is not set
-# CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_UDRAW_PS3 is not set
-# CONFIG_HID_WACOM is not set
-# CONFIG_HID_WIIMOTE is not set
-# CONFIG_HID_XINMO is not set
-# CONFIG_HID_ZEROPLUS is not set
-# CONFIG_HID_ZYDACRON is not set
-# CONFIG_HID_SENSOR_HUB is not set
-# CONFIG_HID_ALPS is not set
-
-#
-# USB HID support
-#
-CONFIG_USB_HID=y
 CONFIG_HID_PID=y
 CONFIG_USB_HIDDEV=y
-CONFIG_USB_OHCI_LITTLE_ENDIAN=y
-CONFIG_USB_SUPPORT=y
-CONFIG_USB_COMMON=y
-CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB=y
-CONFIG_USB_PCI=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_DEFAULT_PERSIST=y
-# CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_OTG_WHITELIST is not set
-# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
 CONFIG_USB_MON=y
-# CONFIG_USB_WUSB_CBAF is not set
-
-#
-# USB Host Controller Drivers
-#
-# CONFIG_USB_C67X00_HCD is not set
 CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_PCI=y
-# CONFIG_USB_XHCI_PLATFORM is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
-CONFIG_USB_EHCI_TT_NEWSCHED=y
-CONFIG_USB_EHCI_PCI=y
-# CONFIG_USB_EHCI_HCD_PLATFORM is not set
-# CONFIG_USB_OXU210HP_HCD is not set
-# CONFIG_USB_ISP116X_HCD is not set
-# CONFIG_USB_ISP1362_HCD is not set
-# CONFIG_USB_FOTG210_HCD is not set
 CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PCI=y
-# CONFIG_USB_OHCI_HCD_PLATFORM is not set
 CONFIG_USB_UHCI_HCD=y
-# CONFIG_USB_SL811_HCD is not set
-# CONFIG_USB_R8A66597_HCD is not set
-# CONFIG_USB_HCD_TEST_MODE is not set
-
-#
-# USB Device Class drivers
-#
-# CONFIG_USB_ACM is not set
-# CONFIG_USB_PRINTER is not set
-# CONFIG_USB_WDM is not set
-# CONFIG_USB_TMC is not set
-
-#
-# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
-#
-
-#
-# also be needed; see USB_STORAGE Help for more info
-#
-# CONFIG_USB_STORAGE is not set
-
-#
-# USB Imaging devices
-#
-# CONFIG_USB_MDC800 is not set
-# CONFIG_USB_MICROTEK is not set
-# CONFIG_USBIP_CORE is not set
-# CONFIG_USB_MUSB_HDRC is not set
-# CONFIG_USB_DWC3 is not set
-# CONFIG_USB_DWC2 is not set
-# CONFIG_USB_CHIPIDEA is not set
-# CONFIG_USB_ISP1760 is not set
-
-#
-# USB port drivers
-#
 CONFIG_USB_SERIAL=y
 CONFIG_USB_SERIAL_CONSOLE=y
 CONFIG_USB_SERIAL_GENERIC=y
-# CONFIG_USB_SERIAL_SIMPLE is not set
-# CONFIG_USB_SERIAL_AIRCABLE is not set
-# CONFIG_USB_SERIAL_ARK3116 is not set
-# CONFIG_USB_SERIAL_BELKIN is not set
-# CONFIG_USB_SERIAL_CH341 is not set
-# CONFIG_USB_SERIAL_WHITEHEAT is not set
-# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
-# CONFIG_USB_SERIAL_CP210X is not set
-# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
-# CONFIG_USB_SERIAL_EMPEG is not set
-# CONFIG_USB_SERIAL_FTDI_SIO is not set
-# CONFIG_USB_SERIAL_VISOR is not set
-# CONFIG_USB_SERIAL_IPAQ is not set
-# CONFIG_USB_SERIAL_IR is not set
-# CONFIG_USB_SERIAL_EDGEPORT is not set
-# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
-# CONFIG_USB_SERIAL_F81232 is not set
-# CONFIG_USB_SERIAL_F8153X is not set
-# CONFIG_USB_SERIAL_GARMIN is not set
-# CONFIG_USB_SERIAL_IPW is not set
-# CONFIG_USB_SERIAL_IUU is not set
-# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
-# CONFIG_USB_SERIAL_KEYSPAN is not set
-# CONFIG_USB_SERIAL_KLSI is not set
-# CONFIG_USB_SERIAL_KOBIL_SCT is not set
-# CONFIG_USB_SERIAL_MCT_U232 is not set
-# CONFIG_USB_SERIAL_METRO is not set
-# CONFIG_USB_SERIAL_MOS7720 is not set
-# CONFIG_USB_SERIAL_MOS7840 is not set
-# CONFIG_USB_SERIAL_MXUPORT is not set
-# CONFIG_USB_SERIAL_NAVMAN is not set
-# CONFIG_USB_SERIAL_PL2303 is not set
-# CONFIG_USB_SERIAL_OTI6858 is not set
-# CONFIG_USB_SERIAL_QCAUX is not set
-# CONFIG_USB_SERIAL_QUALCOMM is not set
-# CONFIG_USB_SERIAL_SPCP8X5 is not set
-# CONFIG_USB_SERIAL_SAFE is not set
-# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
-# CONFIG_USB_SERIAL_SYMBOL is not set
-# CONFIG_USB_SERIAL_TI is not set
-# CONFIG_USB_SERIAL_CYBERJACK is not set
-# CONFIG_USB_SERIAL_XIRCOM is not set
-# CONFIG_USB_SERIAL_OPTION is not set
-# CONFIG_USB_SERIAL_OMNINET is not set
-# CONFIG_USB_SERIAL_OPTICON is not set
-# CONFIG_USB_SERIAL_XSENS_MT is not set
-# CONFIG_USB_SERIAL_WISHBONE is not set
-# CONFIG_USB_SERIAL_SSU100 is not set
-# CONFIG_USB_SERIAL_QT2 is not set
-# CONFIG_USB_SERIAL_UPD78F0730 is not set
-# CONFIG_USB_SERIAL_DEBUG is not set
-
-#
-# USB Miscellaneous drivers
-#
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_SEVSEG is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_SISUSBVGA is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_EHSET_TEST_FIXTURE is not set
-# CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_YUREX is not set
-# CONFIG_USB_EZUSB_FX2 is not set
-# CONFIG_USB_LINK_LAYER_TEST is not set
-# CONFIG_USB_CHAOSKEY is not set
-
-#
-# USB Physical Layer drivers
-#
-# CONFIG_USB_PHY is not set
-# CONFIG_NOP_USB_XCEIV is not set
-# CONFIG_USB_GPIO_VBUS is not set
-# CONFIG_USB_ULPI is not set
-# CONFIG_USB_GADGET is not set
-
-#
-# USB Power Delivery and Type-C drivers
-#
-# CONFIG_TYPEC_UCSI is not set
-# CONFIG_USB_LED_TRIG is not set
-# CONFIG_USB_ULPI_BUS is not set
-# CONFIG_UWB is not set
-# CONFIG_MMC is not set
-# CONFIG_MEMSTICK is not set
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-# CONFIG_LEDS_CLASS_FLASH is not set
-# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
-
-#
-# LED drivers
-#
-# CONFIG_LEDS_BCM6328 is not set
-# CONFIG_LEDS_BCM6358 is not set
-# CONFIG_LEDS_GPIO is not set
-# CONFIG_LEDS_PWM is not set
-# CONFIG_LEDS_LT3593 is not set
-
-#
-# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
-#
-# CONFIG_LEDS_SYSCON is not set
-# CONFIG_LEDS_USER is not set
-
-#
-# LED Triggers
-#
 CONFIG_LEDS_TRIGGERS=y
-# CONFIG_LEDS_TRIGGER_TIMER is not set
-# CONFIG_LEDS_TRIGGER_ONESHOT is not set
-# CONFIG_LEDS_TRIGGER_DISK is not set
-# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
-# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
-# CONFIG_LEDS_TRIGGER_CPU is not set
-# CONFIG_LEDS_TRIGGER_GPIO is not set
-# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
-
-#
-# iptables trigger is under Netfilter config (LED target)
-#
-# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
-# CONFIG_LEDS_TRIGGER_CAMERA is not set
-# CONFIG_LEDS_TRIGGER_PANIC is not set
 CONFIG_ACCESSIBILITY=y
 CONFIG_A11Y_BRAILLE_CONSOLE=y
-# CONFIG_INFINIBAND is not set
-CONFIG_EDAC_SUPPORT=y
-# CONFIG_EDAC is not set
-CONFIG_RTC_LIB=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
 # CONFIG_RTC_SYSTOHC is not set
-# CONFIG_RTC_DEBUG is not set
-CONFIG_RTC_NVMEM=y
-
-#
-# RTC interfaces
-#
-CONFIG_RTC_INTF_SYSFS=y
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
-# CONFIG_RTC_DRV_TEST is not set
-
-#
-# I2C RTC drivers
-#
-
-#
-# SPI RTC drivers
-#
-
-#
-# SPI and I2C RTC drivers
-#
-
-#
-# Platform RTC drivers
-#
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1685_FAMILY is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_DS2404 is not set
-# CONFIG_RTC_DRV_EFI is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_MSM6242 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_RP5C01 is not set
-# CONFIG_RTC_DRV_V3020 is not set
-# CONFIG_RTC_DRV_ZYNQMP is not set
-
-#
-# on-CPU RTC drivers
-#
-# CONFIG_RTC_DRV_PL030 is not set
-# CONFIG_RTC_DRV_PL031 is not set
-# CONFIG_RTC_DRV_FTRTC010 is not set
-# CONFIG_RTC_DRV_SNVS is not set
-# CONFIG_RTC_DRV_R7301 is not set
-
-#
-# HID Sensor RTC drivers
-#
-# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
 CONFIG_DMADEVICES=y
-# CONFIG_DMADEVICES_DEBUG is not set
-
-#
-# DMA Devices
-#
-CONFIG_DMA_ENGINE=y
-CONFIG_DMA_OF=y
-# CONFIG_AMBA_PL08X is not set
-# CONFIG_FSL_EDMA is not set
-# CONFIG_INTEL_IDMA64 is not set
-# CONFIG_MV_XOR_V2 is not set
-# CONFIG_PL330_DMA is not set
-# CONFIG_XILINX_DMA is not set
-# CONFIG_XILINX_ZYNQMP_DMA is not set
-# CONFIG_QCOM_HIDMA_MGMT is not set
-# CONFIG_QCOM_HIDMA is not set
-# CONFIG_DW_DMAC is not set
-# CONFIG_DW_DMAC_PCI is not set
-
-#
-# DMA Clients
-#
 CONFIG_ASYNC_TX_DMA=y
-# CONFIG_DMATEST is not set
-
-#
-# DMABUF options
-#
-# CONFIG_SYNC_FILE is not set
 CONFIG_AUXDISPLAY=y
-# CONFIG_HD44780 is not set
-# CONFIG_IMG_ASCII_LCD is not set
-# CONFIG_UIO is not set
-CONFIG_VFIO_IOMMU_TYPE1=y
-CONFIG_VFIO_VIRQFD=y
 CONFIG_VFIO=y
-# CONFIG_VFIO_NOIOMMU is not set
 CONFIG_VFIO_PCI=y
-CONFIG_VFIO_PCI_MMAP=y
-CONFIG_VFIO_PCI_INTX=y
-# CONFIG_VFIO_PLATFORM is not set
-# CONFIG_VFIO_MDEV is not set
-CONFIG_IRQ_BYPASS_MANAGER=y
-# CONFIG_VIRT_DRIVERS is not set
-
-#
-# Virtio drivers
-#
-# CONFIG_VIRTIO_PCI is not set
-# CONFIG_VIRTIO_MMIO is not set
-
-#
-# Microsoft Hyper-V guest support
-#
-# CONFIG_HYPERV_TSCPAGE is not set
 CONFIG_STAGING=y
-# CONFIG_COMEDI is not set
-# CONFIG_RTL8192U is not set
-# CONFIG_RTLLIB is not set
-# CONFIG_R8712U is not set
-# CONFIG_RTS5208 is not set
-# CONFIG_FB_SM750 is not set
-# CONFIG_FB_XGI is not set
-
-#
-# Speakup console speech
-#
-# CONFIG_SPEAKUP is not set
 CONFIG_STAGING_MEDIA=y
-
-#
-# Android
-#
-# CONFIG_STAGING_BOARD is not set
-# CONFIG_LTE_GDM724X is not set
-# CONFIG_LNET is not set
-# CONFIG_DGNC is not set
-# CONFIG_GS_FPGABOOT is not set
-# CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
-# CONFIG_MOST is not set
-# CONFIG_GREYBUS is not set
-# CONFIG_CRYPTO_DEV_CCREE is not set
-
-#
-# USB Power Delivery and Type-C drivers
-#
-# CONFIG_TYPEC_TCPM is not set
-# CONFIG_GOLDFISH is not set
-# CONFIG_CHROME_PLATFORMS is not set
-CONFIG_CLKDEV_LOOKUP=y
-CONFIG_HAVE_CLK_PREPARE=y
-CONFIG_COMMON_CLK=y
-
-#
-# Common Clock Framework
-#
-CONFIG_COMMON_CLK_VERSATILE=y
-CONFIG_CLK_SP810=y
-CONFIG_CLK_VEXPRESS_OSC=y
-# CONFIG_CLK_QORIQ is not set
 CONFIG_COMMON_CLK_XGENE=y
-# CONFIG_COMMON_CLK_NXP is not set
-# CONFIG_COMMON_CLK_PWM is not set
-# CONFIG_COMMON_CLK_PXA is not set
-# CONFIG_COMMON_CLK_PIC32 is not set
-# CONFIG_HWSPINLOCK is not set
-
-#
-# Clock Source drivers
-#
-CONFIG_TIMER_OF=y
-CONFIG_TIMER_PROBE=y
-CONFIG_CLKSRC_MMIO=y
-CONFIG_ARM_ARCH_TIMER=y
-CONFIG_ARM_ARCH_TIMER_EVTSTREAM=y
-CONFIG_ARM_ARCH_TIMER_OOL_WORKAROUND=y
-CONFIG_FSL_ERRATUM_A008585=y
-CONFIG_HISILICON_ERRATUM_161010101=y
-CONFIG_ARM64_ERRATUM_858921=y
-# CONFIG_ARM_TIMER_SP804 is not set
-# CONFIG_ATMEL_PIT is not set
-# CONFIG_SH_TIMER_CMT is not set
-# CONFIG_SH_TIMER_MTU2 is not set
-# CONFIG_SH_TIMER_TMU is not set
-# CONFIG_EM_TIMER_STI is not set
-CONFIG_CLKSRC_VERSATILE=y
-# CONFIG_MAILBOX is not set
-CONFIG_IOMMU_API=y
-CONFIG_IOMMU_SUPPORT=y
-
-#
-# Generic IOMMU Pagetable Support
-#
-CONFIG_IOMMU_IO_PGTABLE=y
-CONFIG_IOMMU_IO_PGTABLE_LPAE=y
-# CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
-# CONFIG_IOMMU_IO_PGTABLE_ARMV7S is not set
-CONFIG_IOMMU_IOVA=y
-CONFIG_OF_IOMMU=y
-CONFIG_IOMMU_DMA=y
 CONFIG_ARM_SMMU=y
-# CONFIG_ARM_SMMU_V3 is not set
-
-#
-# Remoteproc drivers
-#
-# CONFIG_REMOTEPROC is not set
-
-#
-# Rpmsg drivers
-#
-
-#
-# SOC (System On Chip) specific Drivers
-#
-
-#
-# Broadcom SoC drivers
-#
-# CONFIG_SOC_BRCMSTB is not set
-
-#
-# i.MX SoC drivers
-#
-# CONFIG_SUNXI_SRAM is not set
-# CONFIG_SOC_TI is not set
-# CONFIG_PM_DEVFREQ is not set
-# CONFIG_EXTCON is not set
-# CONFIG_MEMORY is not set
-# CONFIG_IIO is not set
-# CONFIG_NTB is not set
-# CONFIG_VME_BUS is not set
 CONFIG_PWM=y
-CONFIG_PWM_SYSFS=y
-# CONFIG_PWM_FSL_FTM is not set
-CONFIG_IRQCHIP=y
-CONFIG_ARM_GIC=y
-CONFIG_ARM_GIC_MAX_NR=1
-CONFIG_ARM_GIC_V2M=y
-CONFIG_ARM_GIC_V3=y
-CONFIG_ARM_GIC_V3_ITS=y
-CONFIG_PARTITION_PERCPU=y
-# CONFIG_IPACK_BUS is not set
 CONFIG_RESET_CONTROLLER=y
-# CONFIG_RESET_ATH79 is not set
-# CONFIG_RESET_BERLIN is not set
-# CONFIG_RESET_GEMINI is not set
-# CONFIG_RESET_IMX7 is not set
-# CONFIG_RESET_LPC18XX is not set
-# CONFIG_RESET_MESON is not set
-# CONFIG_RESET_PISTACHIO is not set
-# CONFIG_RESET_SOCFPGA is not set
-# CONFIG_RESET_STM32 is not set
-# CONFIG_RESET_SUNXI is not set
-# CONFIG_RESET_TI_SYSCON is not set
-# CONFIG_RESET_ZYNQ is not set
-# CONFIG_RESET_TEGRA_BPMP is not set
-# CONFIG_FMC is not set
-
-#
-# PHY Subsystem
-#
-CONFIG_GENERIC_PHY=y
 CONFIG_PHY_XGENE=y
-# CONFIG_BCM_KONA_USB2_PHY is not set
-# CONFIG_PHY_PXA_28NM_HSIC is not set
-# CONFIG_PHY_PXA_28NM_USB2 is not set
-# CONFIG_POWERCAP is not set
-# CONFIG_MCB is not set
-
-#
-# Performance monitor support
-#
-CONFIG_ARM_PMU=y
-CONFIG_RAS=y
-
-#
-# Android
-#
-# CONFIG_ANDROID is not set
-# CONFIG_LIBNVDIMM is not set
+CONFIG_ARM_CCN=y
 CONFIG_DAX=y
-CONFIG_NVMEM=y
-# CONFIG_STM is not set
-# CONFIG_INTEL_TH is not set
-
-#
-# FPGA Configuration Support
-#
-# CONFIG_FPGA is not set
-
-#
-# FSI support
-#
-# CONFIG_FSI is not set
-# CONFIG_TEE is not set
-
-#
-# Firmware Drivers
-#
-CONFIG_ARM_PSCI_FW=y
-# CONFIG_ARM_PSCI_CHECKER is not set
-# CONFIG_FIRMWARE_MEMMAP is not set
-CONFIG_DMIID=y
-# CONFIG_DMI_SYSFS is not set
-# CONFIG_FW_CFG_SYSFS is not set
-CONFIG_HAVE_ARM_SMCCC=y
-# CONFIG_GOOGLE_FIRMWARE is not set
-
-#
-# EFI (Extensible Firmware Interface) Support
-#
-# CONFIG_EFI_VARS is not set
-CONFIG_EFI_ESRT=y
-CONFIG_EFI_PARAMS_FROM_FDT=y
-CONFIG_EFI_RUNTIME_WRAPPERS=y
-CONFIG_EFI_ARMSTUB=y
-# CONFIG_EFI_CAPSULE_LOADER is not set
-# CONFIG_EFI_TEST is not set
-# CONFIG_MESON_SM is not set
-
-#
-# Tegra firmware driver
-#
-# CONFIG_ACPI is not set
-
-#
-# File systems
-#
-CONFIG_DCACHE_WORD_ACCESS=y
-# CONFIG_EXT2_FS is not set
-# CONFIG_EXT3_FS is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_USE_FOR_EXT2=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-# CONFIG_EXT4_ENCRYPTION is not set
-# CONFIG_EXT4_DEBUG is not set
-CONFIG_JBD2=y
-# CONFIG_JBD2_DEBUG is not set
-CONFIG_FS_MBCACHE=y
-# CONFIG_REISERFS_FS is not set
-# CONFIG_JFS_FS is not set
-# CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
-# CONFIG_OCFS2_FS is not set
-# CONFIG_BTRFS_FS is not set
-# CONFIG_NILFS2_FS is not set
-# CONFIG_F2FS_FS is not set
-# CONFIG_FS_DAX is not set
-CONFIG_FS_POSIX_ACL=y
-CONFIG_EXPORTFS=y
-# CONFIG_EXPORTFS_BLOCK_OPS is not set
-CONFIG_FILE_LOCKING=y
-CONFIG_MANDATORY_FILE_LOCKING=y
-# CONFIG_FS_ENCRYPTION is not set
-CONFIG_FSNOTIFY=y
-CONFIG_DNOTIFY=y
-CONFIG_INOTIFY_USER=y
 CONFIG_FANOTIFY=y
 CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
-# CONFIG_QUOTA_DEBUG is not set
-CONFIG_QUOTA_TREE=y
-# CONFIG_QFMT_V1 is not set
 CONFIG_QFMT_V2=y
-CONFIG_QUOTACTL=y
 CONFIG_AUTOFS4_FS=y
-# CONFIG_FUSE_FS is not set
-# CONFIG_OVERLAY_FS is not set
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# CD-ROM/DVD Filesystems
-#
-# CONFIG_ISO9660_FS is not set
-# CONFIG_UDF_FS is not set
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_FS=y
-# CONFIG_MSDOS_FS is not set
 CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_CODEPAGE=437
 CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
-# CONFIG_FAT_DEFAULT_UTF8 is not set
-# CONFIG_NTFS_FS is not set
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_FS=y
 CONFIG_PROC_KCORE=y
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-# CONFIG_PROC_CHILDREN is not set
-CONFIG_KERNFS=y
-CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_TMPFS_XATTR=y
 CONFIG_HUGETLBFS=y
-CONFIG_HUGETLB_PAGE=y
 CONFIG_CONFIGFS_FS=y
 CONFIG_EFIVAR_FS=y
-CONFIG_MISC_FILESYSTEMS=y
-# CONFIG_ORANGEFS_FS is not set
-# CONFIG_ADFS_FS is not set
-# CONFIG_AFFS_FS is not set
-# CONFIG_ECRYPT_FS is not set
-# CONFIG_HFS_FS is not set
-# CONFIG_HFSPLUS_FS is not set
-# CONFIG_BEFS_FS is not set
-# CONFIG_BFS_FS is not set
-# CONFIG_EFS_FS is not set
-# CONFIG_CRAMFS is not set
-# CONFIG_SQUASHFS is not set
-# CONFIG_VXFS_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_OMFS_FS is not set
-# CONFIG_HPFS_FS is not set
-# CONFIG_QNX4FS_FS is not set
-# CONFIG_QNX6FS_FS is not set
-# CONFIG_ROMFS_FS is not set
 CONFIG_PSTORE=y
-CONFIG_PSTORE_ZLIB_COMPRESS=y
-# CONFIG_PSTORE_LZO_COMPRESS is not set
-# CONFIG_PSTORE_LZ4_COMPRESS is not set
-# CONFIG_PSTORE_CONSOLE is not set
-# CONFIG_PSTORE_PMSG is not set
-# CONFIG_PSTORE_FTRACE is not set
-# CONFIG_PSTORE_RAM is not set
-# CONFIG_SYSV_FS is not set
-# CONFIG_UFS_FS is not set
-CONFIG_NETWORK_FILESYSTEMS=y
 CONFIG_NFS_FS=y
 # CONFIG_NFS_V2 is not set
-CONFIG_NFS_V3=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
 CONFIG_NFS_SWAP=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
-CONFIG_PNFS_FILE_LAYOUT=y
-CONFIG_PNFS_BLOCK=y
-CONFIG_PNFS_FLEXFILE_LAYOUT=m
-CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
-# CONFIG_NFS_V4_1_MIGRATION is not set
-CONFIG_NFS_V4_SECURITY_LABEL=y
-# CONFIG_NFS_USE_LEGACY_DNS is not set
-CONFIG_NFS_USE_KERNEL_DNS=y
-CONFIG_NFS_DEBUG=y
 CONFIG_NFSD=y
-CONFIG_NFSD_V2_ACL=y
-CONFIG_NFSD_V3=y
 CONFIG_NFSD_V3_ACL=y
 CONFIG_NFSD_V4=y
-# CONFIG_NFSD_BLOCKLAYOUT is not set
-# CONFIG_NFSD_SCSILAYOUT is not set
-# CONFIG_NFSD_FLEXFILELAYOUT is not set
 CONFIG_NFSD_V4_SECURITY_LABEL=y
-# CONFIG_NFSD_FAULT_INJECTION is not set
-CONFIG_GRACE_PERIOD=y
-CONFIG_LOCKD=y
-CONFIG_LOCKD_V4=y
-CONFIG_NFS_ACL_SUPPORT=y
-CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=y
-CONFIG_SUNRPC_GSS=y
-CONFIG_SUNRPC_BACKCHANNEL=y
-CONFIG_SUNRPC_SWAP=y
-CONFIG_RPCSEC_GSS_KRB5=y
 CONFIG_SUNRPC_DEBUG=y
-# CONFIG_CEPH_FS is not set
-# CONFIG_CIFS is not set
-# CONFIG_NCP_FS is not set
-# CONFIG_CODA_FS is not set
-# CONFIG_AFS_FS is not set
-CONFIG_NLS=y
 CONFIG_NLS_DEFAULT="utf8"
 CONFIG_NLS_CODEPAGE_437=y
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_CODEPAGE_852 is not set
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-# CONFIG_NLS_CODEPAGE_936 is not set
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
-# CONFIG_NLS_CODEPAGE_1250 is not set
-# CONFIG_NLS_CODEPAGE_1251 is not set
 CONFIG_NLS_ASCII=y
-# CONFIG_NLS_ISO8859_1 is not set
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
-# CONFIG_NLS_MAC_ROMAN is not set
-# CONFIG_NLS_MAC_CELTIC is not set
-# CONFIG_NLS_MAC_CENTEURO is not set
-# CONFIG_NLS_MAC_CROATIAN is not set
-# CONFIG_NLS_MAC_CYRILLIC is not set
-# CONFIG_NLS_MAC_GAELIC is not set
-# CONFIG_NLS_MAC_GREEK is not set
-# CONFIG_NLS_MAC_ICELAND is not set
-# CONFIG_NLS_MAC_INUIT is not set
-# CONFIG_NLS_MAC_ROMANIAN is not set
-# CONFIG_NLS_MAC_TURKISH is not set
-# CONFIG_NLS_UTF8 is not set
-# CONFIG_DLM is not set
-# CONFIG_VIRTUALIZATION is not set
-
-#
-# Kernel hacking
-#
-
-#
-# printk and dmesg options
-#
-CONFIG_PRINTK_TIME=y
-CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
-CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
-CONFIG_BOOT_PRINTK_DELAY=y
-CONFIG_DYNAMIC_DEBUG=y
-
-#
-# Compile-time checks and compiler options
-#
-# CONFIG_DEBUG_INFO is not set
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-CONFIG_ENABLE_MUST_CHECK=y
-CONFIG_FRAME_WARN=1024
-CONFIG_STRIP_ASM_SYMS=y
-# CONFIG_READABLE_ASM is not set
-CONFIG_UNUSED_SYMBOLS=y
-# CONFIG_PAGE_OWNER is not set
-CONFIG_DEBUG_FS=y
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_SECTION_MISMATCH is not set
-CONFIG_SECTION_MISMATCH_WARN_ONLY=y
-CONFIG_ARCH_WANT_FRAME_POINTERS=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x0
-CONFIG_MAGIC_SYSRQ_SERIAL=y
-CONFIG_DEBUG_KERNEL=y
-
-#
-# Memory Debugging
-#
-# CONFIG_PAGE_EXTENSION is not set
-# CONFIG_DEBUG_PAGEALLOC is not set
-# CONFIG_PAGE_POISONING is not set
-# CONFIG_DEBUG_PAGE_REF is not set
-# CONFIG_DEBUG_RODATA_TEST is not set
-# CONFIG_DEBUG_OBJECTS is not set
-# CONFIG_SLUB_DEBUG_ON is not set
-# CONFIG_SLUB_STATS is not set
-CONFIG_HAVE_DEBUG_KMEMLEAK=y
-# CONFIG_DEBUG_KMEMLEAK is not set
-# CONFIG_DEBUG_STACK_USAGE is not set
-# CONFIG_DEBUG_VM is not set
-CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
-# CONFIG_DEBUG_VIRTUAL is not set
-CONFIG_DEBUG_MEMORY_INIT=y
-# CONFIG_DEBUG_PER_CPU_MAPS is not set
-CONFIG_HAVE_ARCH_KASAN=y
-# CONFIG_KASAN is not set
-CONFIG_ARCH_HAS_KCOV=y
-# CONFIG_KCOV is not set
-CONFIG_DEBUG_SHIRQ=y
-
-#
-# Debug Lockups and Hangs
-#
-# CONFIG_SOFTLOCKUP_DETECTOR is not set
-# CONFIG_DETECT_HUNG_TASK is not set
-# CONFIG_WQ_WATCHDOG is not set
-# CONFIG_PANIC_ON_OOPS is not set
-CONFIG_PANIC_ON_OOPS_VALUE=0
-CONFIG_PANIC_TIMEOUT=0
-CONFIG_SCHED_DEBUG=y
-CONFIG_SCHED_INFO=y
-# CONFIG_SCHEDSTATS is not set
-# CONFIG_SCHED_STACK_END_CHECK is not set
-# CONFIG_DEBUG_TIMEKEEPING is not set
-# CONFIG_DEBUG_PREEMPT is not set
-
-#
-# Lock Debugging (spinlocks, mutexes, etc...)
-#
-# CONFIG_DEBUG_RT_MUTEXES is not set
-# CONFIG_DEBUG_SPINLOCK is not set
-# CONFIG_DEBUG_MUTEXES is not set
-# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
-# CONFIG_DEBUG_LOCK_ALLOC is not set
-# CONFIG_PROVE_LOCKING is not set
-# CONFIG_LOCK_STAT is not set
-# CONFIG_DEBUG_ATOMIC_SLEEP is not set
-# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
-# CONFIG_LOCK_TORTURE_TEST is not set
-# CONFIG_WW_MUTEX_SELFTEST is not set
-CONFIG_STACKTRACE=y
-# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
-# CONFIG_DEBUG_KOBJECT is not set
-CONFIG_HAVE_DEBUG_BUGVERBOSE=y
-CONFIG_DEBUG_BUGVERBOSE=y
-# CONFIG_DEBUG_LIST is not set
-# CONFIG_DEBUG_PI_LIST is not set
-# CONFIG_DEBUG_SG is not set
-# CONFIG_DEBUG_NOTIFIERS is not set
-# CONFIG_DEBUG_CREDENTIALS is not set
-
-#
-# RCU Debugging
-#
-# CONFIG_PROVE_RCU is not set
-# CONFIG_TORTURE_TEST is not set
-# CONFIG_RCU_PERF_TEST is not set
-# CONFIG_RCU_TORTURE_TEST is not set
-CONFIG_RCU_CPU_STALL_TIMEOUT=60
-# CONFIG_RCU_TRACE is not set
-# CONFIG_RCU_EQS_DEBUG is not set
-# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
-# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
-# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
-# CONFIG_NOTIFIER_ERROR_INJECTION is not set
-# CONFIG_FAULT_INJECTION is not set
-# CONFIG_LATENCYTOP is not set
-CONFIG_NOP_TRACER=y
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_TRACER_MAX_TRACE=y
-CONFIG_TRACE_CLOCK=y
-CONFIG_RING_BUFFER=y
-CONFIG_EVENT_TRACING=y
-CONFIG_CONTEXT_SWITCH_TRACER=y
-CONFIG_TRACING=y
-CONFIG_GENERIC_TRACER=y
-CONFIG_TRACING_SUPPORT=y
-CONFIG_FTRACE=y
-CONFIG_FUNCTION_TRACER=y
-# CONFIG_FUNCTION_GRAPH_TRACER is not set
-# CONFIG_IRQSOFF_TRACER is not set
-# CONFIG_PREEMPT_TRACER is not set
-CONFIG_SCHED_TRACER=y
-# CONFIG_HWLAT_TRACER is not set
-CONFIG_FTRACE_SYSCALLS=y
-CONFIG_TRACER_SNAPSHOT=y
-# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
-CONFIG_BRANCH_PROFILE_NONE=y
-# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
-# CONFIG_PROFILE_ALL_BRANCHES is not set
-CONFIG_STACK_TRACER=y
-CONFIG_BLK_DEV_IO_TRACE=y
-CONFIG_UPROBE_EVENTS=y
-CONFIG_PROBE_EVENTS=y
-CONFIG_DYNAMIC_FTRACE=y
-CONFIG_FUNCTION_PROFILER=y
-CONFIG_FTRACE_MCOUNT_RECORD=y
-# CONFIG_FTRACE_STARTUP_TEST is not set
-# CONFIG_TRACEPOINT_BENCHMARK is not set
-# CONFIG_RING_BUFFER_BENCHMARK is not set
-# CONFIG_RING_BUFFER_STARTUP_TEST is not set
-# CONFIG_TRACE_EVAL_MAP_FILE is not set
-CONFIG_TRACING_EVENTS_GPIO=y
-
-#
-# Runtime Testing
-#
-# CONFIG_LKDTM is not set
-# CONFIG_TEST_LIST_SORT is not set
-# CONFIG_TEST_SORT is not set
-# CONFIG_BACKTRACE_SELF_TEST is not set
-# CONFIG_RBTREE_TEST is not set
-# CONFIG_INTERVAL_TREE_TEST is not set
-# CONFIG_PERCPU_TEST is not set
-CONFIG_ATOMIC64_SELFTEST=y
-# CONFIG_TEST_HEXDUMP is not set
-# CONFIG_TEST_STRING_HELPERS is not set
-CONFIG_TEST_KSTRTOX=y
-# CONFIG_TEST_PRINTF is not set
-# CONFIG_TEST_BITMAP is not set
-# CONFIG_TEST_UUID is not set
-# CONFIG_TEST_RHASHTABLE is not set
-# CONFIG_TEST_HASH is not set
-# CONFIG_DMA_API_DEBUG is not set
-# CONFIG_TEST_LKM is not set
-# CONFIG_TEST_USER_COPY is not set
-# CONFIG_TEST_BPF is not set
-# CONFIG_TEST_FIRMWARE is not set
-# CONFIG_TEST_SYSCTL is not set
-# CONFIG_TEST_UDELAY is not set
-# CONFIG_MEMTEST is not set
-# CONFIG_TEST_STATIC_KEYS is not set
-# CONFIG_BUG_ON_DATA_CORRUPTION is not set
-# CONFIG_TEST_KMOD is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-# CONFIG_KGDB is not set
-CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
-# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
-# CONFIG_UBSAN is not set
-CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
-CONFIG_STRICT_DEVMEM=y
-# CONFIG_IO_STRICT_DEVMEM is not set
-# CONFIG_ARM64_PTDUMP_CORE is not set
-# CONFIG_ARM64_PTDUMP_DEBUGFS is not set
-# CONFIG_PID_IN_CONTEXTIDR is not set
-# CONFIG_ARM64_RANDOMIZE_TEXT_OFFSET is not set
-# CONFIG_DEBUG_WX is not set
-# CONFIG_DEBUG_ALIGN_RODATA is not set
-# CONFIG_ARM64_RELOC_TEST is not set
-# CONFIG_CORESIGHT is not set
-
-#
-# Security options
-#
-CONFIG_KEYS=y
 CONFIG_PERSISTENT_KEYRINGS=y
-CONFIG_BIG_KEYS=y
-# CONFIG_ENCRYPTED_KEYS is not set
-# CONFIG_KEY_DH_OPERATIONS is not set
-# CONFIG_SECURITY_DMESG_RESTRICT is not set
 CONFIG_SECURITY=y
-CONFIG_SECURITY_WRITABLE_HOOKS=y
 CONFIG_SECURITYFS=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_SECURITY_NETWORK_XFRM=y
-# CONFIG_SECURITY_PATH is not set
-CONFIG_LSM_MMAP_MIN_ADDR=65536
-CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
-# CONFIG_HARDENED_USERCOPY is not set
-# CONFIG_FORTIFY_SOURCE is not set
-# CONFIG_STATIC_USERMODEHELPER is not set
 CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=1
 CONFIG_SECURITY_SELINUX_DISABLE=y
-CONFIG_SECURITY_SELINUX_DEVELOP=y
-CONFIG_SECURITY_SELINUX_AVC_STATS=y
 CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
-# CONFIG_SECURITY_SMACK is not set
-# CONFIG_SECURITY_TOMOYO is not set
-# CONFIG_SECURITY_APPARMOR is not set
-# CONFIG_SECURITY_LOADPIN is not set
-# CONFIG_SECURITY_YAMA is not set
-CONFIG_INTEGRITY=y
-# CONFIG_INTEGRITY_SIGNATURE is not set
-CONFIG_INTEGRITY_AUDIT=y
-# CONFIG_IMA is not set
-# CONFIG_EVM is not set
-CONFIG_DEFAULT_SECURITY_SELINUX=y
-# CONFIG_DEFAULT_SECURITY_DAC is not set
-CONFIG_DEFAULT_SECURITY="selinux"
-CONFIG_CRYPTO=y
-
-#
-# Crypto core or helper
-#
-CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD=y
-CONFIG_CRYPTO_AEAD2=y
-CONFIG_CRYPTO_BLKCIPHER=y
-CONFIG_CRYPTO_BLKCIPHER2=y
-CONFIG_CRYPTO_HASH=y
-CONFIG_CRYPTO_HASH2=y
-CONFIG_CRYPTO_RNG=y
-CONFIG_CRYPTO_RNG2=y
-CONFIG_CRYPTO_RNG_DEFAULT=y
-CONFIG_CRYPTO_AKCIPHER2=y
-CONFIG_CRYPTO_KPP2=y
-CONFIG_CRYPTO_ACOMP2=y
-# CONFIG_CRYPTO_RSA is not set
-# CONFIG_CRYPTO_DH is not set
-# CONFIG_CRYPTO_ECDH is not set
-CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_USER is not set
 # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
-# CONFIG_CRYPTO_GF128MUL is not set
-CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_NULL2=y
-# CONFIG_CRYPTO_PCRYPT is not set
-CONFIG_CRYPTO_WORKQUEUE=y
-CONFIG_CRYPTO_CRYPTD=y
-# CONFIG_CRYPTO_MCRYPTD is not set
-# CONFIG_CRYPTO_AUTHENC is not set
-# CONFIG_CRYPTO_TEST is not set
-CONFIG_CRYPTO_SIMD=y
-
-#
-# Authenticated Encryption with Associated Data
-#
-# CONFIG_CRYPTO_CCM is not set
-# CONFIG_CRYPTO_GCM is not set
-# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
 CONFIG_CRYPTO_SEQIV=y
 CONFIG_CRYPTO_ECHAINIV=m
-
-#
-# Block modes
-#
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_CTR=y
 CONFIG_CRYPTO_CTS=y
 CONFIG_CRYPTO_ECB=y
-# CONFIG_CRYPTO_LRW is not set
-# CONFIG_CRYPTO_PCBC is not set
-# CONFIG_CRYPTO_XTS is not set
-# CONFIG_CRYPTO_KEYWRAP is not set
-
-#
-# Hash modes
-#
-# CONFIG_CRYPTO_CMAC is not set
-CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
-# CONFIG_CRYPTO_VMAC is not set
-
-#
-# Digest
-#
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_CRC32 is not set
-CONFIG_CRYPTO_CRCT10DIF=y
-# CONFIG_CRYPTO_GHASH is not set
-# CONFIG_CRYPTO_POLY1305 is not set
-# CONFIG_CRYPTO_MD4 is not set
-CONFIG_CRYPTO_MD5=y
-# CONFIG_CRYPTO_MICHAEL_MIC is not set
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
-CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_SHA512 is not set
-# CONFIG_CRYPTO_SHA3 is not set
-# CONFIG_CRYPTO_TGR192 is not set
-# CONFIG_CRYPTO_WP512 is not set
-
-#
-# Ciphers
-#
-CONFIG_CRYPTO_AES=y
-# CONFIG_CRYPTO_AES_TI is not set
-# CONFIG_CRYPTO_ANUBIS is not set
 CONFIG_CRYPTO_ARC4=y
-# CONFIG_CRYPTO_BLOWFISH is not set
-# CONFIG_CRYPTO_CAMELLIA is not set
-# CONFIG_CRYPTO_CAST5 is not set
-# CONFIG_CRYPTO_CAST6 is not set
 CONFIG_CRYPTO_DES=y
-# CONFIG_CRYPTO_FCRYPT is not set
-# CONFIG_CRYPTO_KHAZAD is not set
-# CONFIG_CRYPTO_SALSA20 is not set
-# CONFIG_CRYPTO_CHACHA20 is not set
-# CONFIG_CRYPTO_SEED is not set
-# CONFIG_CRYPTO_SERPENT is not set
-# CONFIG_CRYPTO_TEA is not set
-# CONFIG_CRYPTO_TWOFISH is not set
-
-#
-# Compression
-#
-# CONFIG_CRYPTO_DEFLATE is not set
-CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_842 is not set
-# CONFIG_CRYPTO_LZ4 is not set
-# CONFIG_CRYPTO_LZ4HC is not set
-
-#
-# Random Number Generation
-#
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRYPTO_DRBG_MENU=y
-CONFIG_CRYPTO_DRBG_HMAC=y
-# CONFIG_CRYPTO_DRBG_HASH is not set
-# CONFIG_CRYPTO_DRBG_CTR is not set
-CONFIG_CRYPTO_DRBG=y
-CONFIG_CRYPTO_JITTERENTROPY=y
-CONFIG_CRYPTO_USER_API=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
-# CONFIG_CRYPTO_USER_API_RNG is not set
-# CONFIG_CRYPTO_USER_API_AEAD is not set
-CONFIG_CRYPTO_HW=y
-# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
 CONFIG_CRYPTO_DEV_CCP=y
 # CONFIG_CRYPTO_DEV_CCP_DD is not set
-# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
-# CONFIG_CRYPTO_DEV_CAVIUM_ZIP is not set
-# CONFIG_ASYMMETRIC_KEY_TYPE is not set
-
-#
-# Certificates for signature checking
-#
-# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
-CONFIG_ARM64_CRYPTO=y
-# CONFIG_CRYPTO_SHA256_ARM64 is not set
-# CONFIG_CRYPTO_SHA512_ARM64 is not set
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-# CONFIG_CRYPTO_CRCT10DIF_ARM64_CE is not set
-# CONFIG_CRYPTO_CRC32_ARM64_CE is not set
-# CONFIG_CRYPTO_AES_ARM64 is not set
-CONFIG_CRYPTO_AES_ARM64_CE=y
-# CONFIG_CRYPTO_AES_ARM64_CE_CCM is not set
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
-# CONFIG_CRYPTO_AES_ARM64_NEON_BLK is not set
-# CONFIG_CRYPTO_CHACHA20_NEON is not set
-# CONFIG_CRYPTO_AES_ARM64_BS is not set
-CONFIG_BINARY_PRINTF=y
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-CONFIG_HAVE_ARCH_BITREVERSE=y
-CONFIG_RATIONAL=y
-CONFIG_GENERIC_STRNCPY_FROM_USER=y
-CONFIG_GENERIC_STRNLEN_USER=y
-CONFIG_GENERIC_NET_UTILS=y
-CONFIG_GENERIC_PCI_IOMAP=y
-CONFIG_GENERIC_IO=y
-CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC16=y
-CONFIG_CRC_T10DIF=y
-# CONFIG_CRC_ITU_T is not set
-CONFIG_CRC32=y
-# CONFIG_CRC32_SELFTEST is not set
-CONFIG_CRC32_SLICEBY8=y
-# CONFIG_CRC32_SLICEBY4 is not set
-# CONFIG_CRC32_SARWATE is not set
-# CONFIG_CRC32_BIT is not set
-# CONFIG_CRC4 is not set
-# CONFIG_CRC7 is not set
-# CONFIG_LIBCRC32C is not set
-# CONFIG_CRC8 is not set
-CONFIG_AUDIT_GENERIC=y
-CONFIG_AUDIT_ARCH_COMPAT_GENERIC=y
-# CONFIG_RANDOM32_SELFTEST is not set
-CONFIG_ZLIB_INFLATE=y
-CONFIG_ZLIB_DEFLATE=y
-CONFIG_LZO_COMPRESS=y
-CONFIG_LZO_DECOMPRESS=y
-CONFIG_LZ4_DECOMPRESS=y
-CONFIG_XZ_DEC=y
-CONFIG_XZ_DEC_X86=y
-CONFIG_XZ_DEC_POWERPC=y
-CONFIG_XZ_DEC_IA64=y
-CONFIG_XZ_DEC_ARM=y
-CONFIG_XZ_DEC_ARMTHUMB=y
-CONFIG_XZ_DEC_SPARC=y
-CONFIG_XZ_DEC_BCJ=y
-# CONFIG_XZ_DEC_TEST is not set
-CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_XZ=y
-CONFIG_DECOMPRESS_LZO=y
-CONFIG_DECOMPRESS_LZ4=y
-CONFIG_GENERIC_ALLOCATOR=y
-CONFIG_ASSOCIATIVE_ARRAY=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT_MAP=y
-CONFIG_HAS_DMA=y
-# CONFIG_DMA_NOOP_OPS is not set
-# CONFIG_DMA_VIRT_OPS is not set
-CONFIG_CPU_RMAP=y
-CONFIG_DQL=y
-CONFIG_GLOB=y
-# CONFIG_GLOB_SELFTEST is not set
-CONFIG_NLATTR=y
-# CONFIG_CORDIC is not set
-# CONFIG_DDR is not set
-# CONFIG_IRQ_POLL is not set
-CONFIG_LIBFDT=y
-CONFIG_OID_REGISTRY=y
-CONFIG_UCS2_STRING=y
-CONFIG_FONT_SUPPORT=y
-# CONFIG_FONTS is not set
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
-# CONFIG_SG_SPLIT is not set
-CONFIG_SG_POOL=y
-CONFIG_ARCH_HAS_SG_CHAIN=y
-CONFIG_SBITMAP=y
+CONFIG_PRINTK_TIME=y
+CONFIG_BOOT_PRINTK_DELAY=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_FRAME_WARN=1024
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x0
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_SHIRQ=y
+# CONFIG_DEBUG_PREEMPT is not set
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FUNCTION_GRAPH_TRACER is not set
+CONFIG_FUNCTION_PROFILER=y
+CONFIG_STACK_TRACER=y
+CONFIG_SCHED_TRACER=y
+CONFIG_FTRACE_SYSCALLS=y
+CONFIG_BLK_DEV_IO_TRACE=y
+CONFIG_ATOMIC64_SELFTEST=y
+CONFIG_TEST_KSTRTOX=y
diff --git a/ci/kernel-config-banana-pi b/ci/kernel-config-banana-pi
index 715ef24a..3ce0ad72 100644
--- a/ci/kernel-config-banana-pi
+++ b/ci/kernel-config-banana-pi
@@ -1,2964 +1,145 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Linux/arm 4.13.0 Kernel Configuration
-#
-CONFIG_ARM=y
-CONFIG_ARM_HAS_SG_CHAIN=y
-CONFIG_MIGHT_HAVE_PCI=y
-CONFIG_SYS_SUPPORTS_APM_EMULATION=y
-CONFIG_HAVE_PROC_CPU=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_RWSEM_XCHGADD_ALGORITHM=y
-CONFIG_FIX_EARLYCON_MEM=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_NEED_DMA_MAP_STATE=y
-CONFIG_ARCH_SUPPORTS_UPROBES=y
-CONFIG_VECTORS_BASE=0xffff0000
-CONFIG_ARM_PATCH_PHYS_VIRT=y
-CONFIG_GENERIC_BUG=y
-CONFIG_PGTABLE_LEVELS=2
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_IRQ_WORK=y
-CONFIG_BUILDTIME_EXTABLE_SORT=y
-
-#
-# General setup
-#
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-# CONFIG_COMPILE_TEST is not set
-CONFIG_LOCALVERSION=""
-CONFIG_LOCALVERSION_AUTO=y
-CONFIG_HAVE_KERNEL_GZIP=y
-CONFIG_HAVE_KERNEL_LZMA=y
-CONFIG_HAVE_KERNEL_XZ=y
-CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_HAVE_KERNEL_LZ4=y
-CONFIG_KERNEL_GZIP=y
-# CONFIG_KERNEL_LZMA is not set
-# CONFIG_KERNEL_XZ is not set
-# CONFIG_KERNEL_LZO is not set
-# CONFIG_KERNEL_LZ4 is not set
-CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SWAP=y
-# CONFIG_SYSVIPC is not set
-# CONFIG_POSIX_MQUEUE is not set
-CONFIG_CROSS_MEMORY_ATTACH=y
-CONFIG_FHANDLE=y
 CONFIG_USELIB=y
-# CONFIG_AUDIT is not set
-CONFIG_HAVE_ARCH_AUDITSYSCALL=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_GENERIC_IRQ_CHIP=y
-CONFIG_IRQ_DOMAIN=y
-CONFIG_IRQ_DOMAIN_HIERARCHY=y
-CONFIG_HANDLE_DOMAIN_IRQ=y
-# CONFIG_IRQ_DOMAIN_DEBUG is not set
-CONFIG_IRQ_FORCED_THREADING=y
-CONFIG_SPARSE_IRQ=y
-# CONFIG_GENERIC_IRQ_DEBUGFS is not set
-CONFIG_ARCH_CLOCKSOURCE_DATA=y
-CONFIG_GENERIC_TIME_VSYSCALL=y
-CONFIG_GENERIC_CLOCKEVENTS=y
-CONFIG_ARCH_HAS_TICK_BROADCAST=y
-CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
-
-#
-# Timers subsystem
-#
-CONFIG_TICK_ONESHOT=y
-CONFIG_NO_HZ_COMMON=y
-# CONFIG_HZ_PERIODIC is not set
-CONFIG_NO_HZ_IDLE=y
-# CONFIG_NO_HZ_FULL is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
-
-#
-# CPU/Task time and stats accounting
-#
-CONFIG_TICK_CPU_ACCOUNTING=y
-# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
-# CONFIG_IRQ_TIME_ACCOUNTING is not set
-# CONFIG_BSD_PROCESS_ACCT is not set
-# CONFIG_TASKSTATS is not set
-
-#
-# RCU Subsystem
-#
-CONFIG_TREE_RCU=y
-# CONFIG_RCU_EXPERT is not set
-CONFIG_SRCU=y
-CONFIG_TREE_SRCU=y
-# CONFIG_TASKS_RCU is not set
-CONFIG_RCU_STALL_COMMON=y
-CONFIG_RCU_NEED_SEGCBLIST=y
-# CONFIG_BUILD_BIN2C is not set
-# CONFIG_IKCONFIG is not set
-CONFIG_LOG_BUF_SHIFT=17
-CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
-CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
-CONFIG_GENERIC_SCHED_CLOCK=y
 CONFIG_CGROUPS=y
-CONFIG_PAGE_COUNTER=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
-CONFIG_MEMCG_SWAP_ENABLED=y
 CONFIG_BLK_CGROUP=y
-# CONFIG_DEBUG_BLK_CGROUP is not set
-CONFIG_CGROUP_WRITEBACK=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_FAIR_GROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
 CONFIG_RT_GROUP_SCHED=y
-# CONFIG_CGROUP_PIDS is not set
-# CONFIG_CGROUP_RDMA is not set
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
-CONFIG_PROC_PID_CPUSET=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
-# CONFIG_CGROUP_DEBUG is not set
-# CONFIG_SOCK_CGROUP_DATA is not set
-# CONFIG_CHECKPOINT_RESTORE is not set
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-# CONFIG_USER_NS is not set
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
-# CONFIG_SCHED_AUTOGROUP is not set
-# CONFIG_SYSFS_DEPRECATED is not set
-# CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
-CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_XZ=y
-CONFIG_RD_LZO=y
-CONFIG_RD_LZ4=y
-# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_SYSCTL=y
-CONFIG_ANON_INODES=y
-CONFIG_HAVE_UID16=y
-CONFIG_BPF=y
-# CONFIG_EXPERT is not set
-CONFIG_UID16=y
-CONFIG_MULTIUSER=y
-# CONFIG_SGETMASK_SYSCALL is not set
-CONFIG_SYSFS_SYSCALL=y
-# CONFIG_SYSCTL_SYSCALL is not set
-CONFIG_POSIX_TIMERS=y
-CONFIG_KALLSYMS=y
-CONFIG_KALLSYMS_ALL=y
-# CONFIG_KALLSYMS_ABSOLUTE_PERCPU is not set
-CONFIG_KALLSYMS_BASE_RELATIVE=y
-CONFIG_PRINTK=y
-CONFIG_PRINTK_NMI=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
-CONFIG_FUTEX=y
-CONFIG_EPOLL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-# CONFIG_BPF_SYSCALL is not set
-CONFIG_SHMEM=y
-CONFIG_AIO=y
-CONFIG_ADVISE_SYSCALLS=y
-# CONFIG_USERFAULTFD is not set
-CONFIG_MEMBARRIER=y
-# CONFIG_EMBEDDED is not set
-CONFIG_HAVE_PERF_EVENTS=y
-CONFIG_PERF_USE_VMALLOC=y
-# CONFIG_PC104 is not set
-
-#
-# Kernel Performance Events And Counters
-#
 CONFIG_PERF_EVENTS=y
-# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_SLUB_DEBUG=y
-# CONFIG_SLUB_MEMCG_SYSFS_ON is not set
-CONFIG_COMPAT_BRK=y
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
-CONFIG_SLAB_MERGE_DEFAULT=y
-# CONFIG_SLAB_FREELIST_RANDOM is not set
-CONFIG_SLUB_CPU_PARTIAL=y
-# CONFIG_SYSTEM_DATA_VERIFICATION is not set
-# CONFIG_PROFILING is not set
-CONFIG_TRACEPOINTS=y
-CONFIG_HAVE_OPROFILE=y
-# CONFIG_KPROBES is not set
-# CONFIG_JUMP_LABEL is not set
-CONFIG_UPROBES=y
-# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
-CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
-CONFIG_ARCH_USE_BUILTIN_BSWAP=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_OPTPROBES=y
-CONFIG_HAVE_NMI=y
-CONFIG_HAVE_ARCH_TRACEHOOK=y
-CONFIG_HAVE_DMA_CONTIGUOUS=y
-CONFIG_GENERIC_SMP_IDLE_THREAD=y
-CONFIG_GENERIC_IDLE_POLL_SETUP=y
-CONFIG_ARCH_HAS_SET_MEMORY=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_CLK=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-CONFIG_HAVE_HW_BREAKPOINT=y
-CONFIG_HAVE_PERF_REGS=y
-CONFIG_HAVE_PERF_USER_STACK_DUMP=y
-CONFIG_HAVE_ARCH_JUMP_LABEL=y
-CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
-CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
-CONFIG_HAVE_GCC_PLUGINS=y
-# CONFIG_GCC_PLUGINS is not set
-CONFIG_HAVE_CC_STACKPROTECTOR=y
-# CONFIG_CC_STACKPROTECTOR is not set
-CONFIG_CC_STACKPROTECTOR_NONE=y
-# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
-# CONFIG_CC_STACKPROTECTOR_STRONG is not set
-CONFIG_THIN_ARCHIVES=y
-CONFIG_HAVE_CONTEXT_TRACKING=y
-CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
-CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
-CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
-CONFIG_MODULES_USE_ELF_REL=y
-CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
-CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
-CONFIG_HAVE_EXIT_THREAD=y
-CONFIG_ARCH_MMAP_RND_BITS_MIN=8
-CONFIG_ARCH_MMAP_RND_BITS_MAX=16
-CONFIG_ARCH_MMAP_RND_BITS=8
-# CONFIG_HAVE_ARCH_HASH is not set
-# CONFIG_ISA_BUS_API is not set
-CONFIG_CLONE_BACKWARDS=y
-CONFIG_OLD_SIGSUSPEND3=y
-CONFIG_OLD_SIGACTION=y
-# CONFIG_CPU_NO_EFFICIENT_FFS is not set
-# CONFIG_HAVE_ARCH_VMAP_STACK is not set
-CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
-CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
-CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
-CONFIG_STRICT_MODULE_RWX=y
-# CONFIG_REFCOUNT_FULL is not set
-
-#
-# GCOV-based kernel profiling
-#
-# CONFIG_GCOV_KERNEL is not set
-CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-CONFIG_MODULES=y
-# CONFIG_MODULE_FORCE_LOAD is not set
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_MODULE_FORCE_UNLOAD is not set
-# CONFIG_MODVERSIONS is not set
-# CONFIG_MODULE_SRCVERSION_ALL is not set
-# CONFIG_MODULE_SIG is not set
-# CONFIG_MODULE_COMPRESS is not set
-# CONFIG_TRIM_UNUSED_KSYMS is not set
-CONFIG_MODULES_TREE_LOOKUP=y
-CONFIG_BLOCK=y
-CONFIG_LBDAF=y
-CONFIG_BLK_SCSI_REQUEST=y
-CONFIG_BLK_DEV_BSG=y
-# CONFIG_BLK_DEV_BSGLIB is not set
-# CONFIG_BLK_DEV_INTEGRITY is not set
-# CONFIG_BLK_DEV_ZONED is not set
-# CONFIG_BLK_DEV_THROTTLING is not set
-# CONFIG_BLK_CMDLINE_PARSER is not set
-# CONFIG_BLK_WBT is not set
-CONFIG_BLK_DEBUG_FS=y
-# CONFIG_BLK_SED_OPAL is not set
-
-#
-# Partition Types
-#
-# CONFIG_PARTITION_ADVANCED is not set
-CONFIG_MSDOS_PARTITION=y
-CONFIG_EFI_PARTITION=y
-
-#
-# IO Schedulers
-#
-CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_DEADLINE=y
-CONFIG_IOSCHED_CFQ=y
-# CONFIG_CFQ_GROUP_IOSCHED is not set
-# CONFIG_DEFAULT_DEADLINE is not set
-CONFIG_DEFAULT_CFQ=y
-# CONFIG_DEFAULT_NOOP is not set
-CONFIG_DEFAULT_IOSCHED="cfq"
-CONFIG_MQ_IOSCHED_DEADLINE=y
-CONFIG_MQ_IOSCHED_KYBER=y
-# CONFIG_IOSCHED_BFQ is not set
-CONFIG_UNINLINE_SPIN_UNLOCK=y
-CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
-CONFIG_MUTEX_SPIN_ON_OWNER=y
-CONFIG_RWSEM_SPIN_ON_OWNER=y
-CONFIG_LOCK_SPIN_ON_OWNER=y
-CONFIG_FREEZER=y
-
-#
-# System Type
-#
-CONFIG_MMU=y
-CONFIG_ARCH_MULTIPLATFORM=y
-# CONFIG_ARCH_EBSA110 is not set
-# CONFIG_ARCH_EP93XX is not set
-# CONFIG_ARCH_FOOTBRIDGE is not set
-# CONFIG_ARCH_NETX is not set
-# CONFIG_ARCH_IOP13XX is not set
-# CONFIG_ARCH_IOP32X is not set
-# CONFIG_ARCH_IOP33X is not set
-# CONFIG_ARCH_IXP4XX is not set
-# CONFIG_ARCH_DOVE is not set
-# CONFIG_ARCH_KS8695 is not set
-# CONFIG_ARCH_W90X900 is not set
-# CONFIG_ARCH_LPC32XX is not set
-# CONFIG_ARCH_PXA is not set
-# CONFIG_ARCH_RPC is not set
-# CONFIG_ARCH_SA1100 is not set
-# CONFIG_ARCH_S3C24XX is not set
-# CONFIG_ARCH_DAVINCI is not set
-# CONFIG_ARCH_OMAP1 is not set
-
-#
-# Multiple platform selection
-#
-
-#
-# CPU Core family selection
-#
-# CONFIG_ARCH_MULTI_V6 is not set
-CONFIG_ARCH_MULTI_V7=y
-CONFIG_ARCH_MULTI_V6_V7=y
-# CONFIG_ARCH_MULTI_CPU_AUTO is not set
-# CONFIG_ARCH_VIRT is not set
-# CONFIG_ARCH_MVEBU is not set
-# CONFIG_ARCH_ACTIONS is not set
-# CONFIG_ARCH_ALPINE is not set
-# CONFIG_ARCH_ARTPEC is not set
-# CONFIG_ARCH_AT91 is not set
-# CONFIG_ARCH_BCM is not set
-# CONFIG_ARCH_BERLIN is not set
-# CONFIG_ARCH_DIGICOLOR is not set
-# CONFIG_ARCH_HIGHBANK is not set
-# CONFIG_ARCH_HISI is not set
-# CONFIG_ARCH_KEYSTONE is not set
-# CONFIG_ARCH_MESON is not set
-# CONFIG_ARCH_MXC is not set
-# CONFIG_ARCH_MEDIATEK is not set
-
-#
-# TI OMAP/AM/DM/DRA Family
-#
-# CONFIG_ARCH_OMAP3 is not set
-# CONFIG_ARCH_OMAP4 is not set
-# CONFIG_SOC_OMAP5 is not set
-# CONFIG_SOC_AM33XX is not set
-# CONFIG_SOC_AM43XX is not set
-# CONFIG_SOC_DRA7XX is not set
-# CONFIG_ARCH_MMP is not set
-# CONFIG_ARCH_QCOM is not set
-# CONFIG_ARCH_REALVIEW is not set
-# CONFIG_ARCH_ROCKCHIP is not set
-# CONFIG_ARCH_SOCFPGA is not set
-# CONFIG_PLAT_SPEAR is not set
-# CONFIG_ARCH_STI is not set
-# CONFIG_ARCH_S5PV210 is not set
-# CONFIG_ARCH_EXYNOS is not set
-# CONFIG_ARCH_RENESAS is not set
 CONFIG_ARCH_SUNXI=y
 # CONFIG_MACH_SUN4I is not set
 # CONFIG_MACH_SUN5I is not set
 # CONFIG_MACH_SUN6I is not set
-CONFIG_MACH_SUN7I=y
 # CONFIG_MACH_SUN8I is not set
 # CONFIG_MACH_SUN9I is not set
-# CONFIG_ARCH_SIRF is not set
-# CONFIG_ARCH_TANGO is not set
-# CONFIG_ARCH_TEGRA is not set
-# CONFIG_ARCH_UNIPHIER is not set
-# CONFIG_ARCH_U8500 is not set
-# CONFIG_ARCH_VEXPRESS is not set
-# CONFIG_ARCH_WM8850 is not set
-# CONFIG_ARCH_ZX is not set
-# CONFIG_ARCH_ZYNQ is not set
-
-#
-# Processor Type
-#
-CONFIG_CPU_V7=y
-CONFIG_CPU_THUMB_CAPABLE=y
-CONFIG_CPU_32v6K=y
-CONFIG_CPU_32v7=y
-CONFIG_CPU_ABRT_EV7=y
-CONFIG_CPU_PABRT_V7=y
-CONFIG_CPU_CACHE_V7=y
-CONFIG_CPU_CACHE_VIPT=y
-CONFIG_CPU_COPY_V6=y
-CONFIG_CPU_TLB_V7=y
-CONFIG_CPU_HAS_ASID=y
-CONFIG_CPU_CP15=y
-CONFIG_CPU_CP15_MMU=y
-
-#
-# Processor Features
-#
-# CONFIG_ARM_LPAE is not set
-# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
-CONFIG_ARM_THUMB=y
-# CONFIG_ARM_THUMBEE is not set
-CONFIG_ARM_VIRT_EXT=y
-CONFIG_SWP_EMULATE=y
-# CONFIG_CPU_BIG_ENDIAN is not set
-# CONFIG_CPU_ICACHE_DISABLE is not set
-# CONFIG_CPU_BPREDICT_DISABLE is not set
-CONFIG_KUSER_HELPERS=y
-CONFIG_VDSO=y
-CONFIG_OUTER_CACHE=y
-CONFIG_OUTER_CACHE_SYNC=y
-CONFIG_MIGHT_HAVE_CACHE_L2X0=y
-CONFIG_CACHE_L2X0=y
-# CONFIG_CACHE_L2X0_PMU is not set
-# CONFIG_PL310_ERRATA_588369 is not set
-# CONFIG_PL310_ERRATA_727915 is not set
-# CONFIG_PL310_ERRATA_753970 is not set
-# CONFIG_PL310_ERRATA_769419 is not set
-CONFIG_ARM_L1_CACHE_SHIFT_6=y
-CONFIG_ARM_L1_CACHE_SHIFT=6
-CONFIG_ARM_DMA_MEM_BUFFERABLE=y
-CONFIG_ARM_HEAVY_MB=y
-CONFIG_ARCH_SUPPORTS_BIG_ENDIAN=y
-CONFIG_DEBUG_ALIGN_RODATA=y
-CONFIG_MULTI_IRQ_HANDLER=y
-# CONFIG_ARM_ERRATA_430973 is not set
 # CONFIG_ARM_ERRATA_643719 is not set
-# CONFIG_ARM_ERRATA_720789 is not set
-# CONFIG_ARM_ERRATA_754322 is not set
-# CONFIG_ARM_ERRATA_754327 is not set
-# CONFIG_ARM_ERRATA_764369 is not set
-# CONFIG_ARM_ERRATA_775420 is not set
-# CONFIG_ARM_ERRATA_798181 is not set
-# CONFIG_ARM_ERRATA_773022 is not set
-# CONFIG_ARM_ERRATA_818325_852422 is not set
-# CONFIG_ARM_ERRATA_821420 is not set
-# CONFIG_ARM_ERRATA_825619 is not set
-# CONFIG_ARM_ERRATA_852421 is not set
-# CONFIG_ARM_ERRATA_852423 is not set
-
-#
-# Bus support
-#
-# CONFIG_PCI is not set
-# CONFIG_PCI_DOMAINS_GENERIC is not set
-# CONFIG_PCI_SYSCALL is not set
-
-#
-# DesignWare PCI Core Support
-#
-
-#
-# PCI Endpoint
-#
-# CONFIG_PCI_ENDPOINT is not set
-# CONFIG_PCCARD is not set
-
-#
-# Kernel Features
-#
-CONFIG_HAVE_SMP=y
 CONFIG_SMP=y
-CONFIG_SMP_ON_UP=y
-CONFIG_ARM_CPU_TOPOLOGY=y
-# CONFIG_SCHED_MC is not set
-# CONFIG_SCHED_SMT is not set
-CONFIG_HAVE_ARM_ARCH_TIMER=y
-# CONFIG_MCPM is not set
-# CONFIG_BIG_LITTLE is not set
-CONFIG_VMSPLIT_3G=y
-# CONFIG_VMSPLIT_3G_OPT is not set
-# CONFIG_VMSPLIT_2G is not set
-# CONFIG_VMSPLIT_1G is not set
-CONFIG_PAGE_OFFSET=0xC0000000
-CONFIG_NR_CPUS=4
-CONFIG_HOTPLUG_CPU=y
-CONFIG_ARM_PSCI=y
-CONFIG_ARCH_NR_GPIO=416
-CONFIG_PREEMPT_NONE=y
-# CONFIG_PREEMPT_VOLUNTARY is not set
-# CONFIG_PREEMPT is not set
-CONFIG_PREEMPT_COUNT=y
-CONFIG_HZ_FIXED=0
-CONFIG_HZ_100=y
-# CONFIG_HZ_200 is not set
-# CONFIG_HZ_250 is not set
-# CONFIG_HZ_300 is not set
-# CONFIG_HZ_500 is not set
-# CONFIG_HZ_1000 is not set
-CONFIG_HZ=100
-CONFIG_SCHED_HRTICK=y
-# CONFIG_THUMB2_KERNEL is not set
-CONFIG_ARM_PATCH_IDIV=y
-CONFIG_AEABI=y
-# CONFIG_OABI_COMPAT is not set
-# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
-# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
-CONFIG_HAVE_ARCH_PFN_VALID=y
 CONFIG_HIGHMEM=y
-CONFIG_HIGHPTE=y
-CONFIG_CPU_SW_DOMAIN_PAN=y
-CONFIG_HW_PERF_EVENTS=y
-CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
 # CONFIG_ARM_MODULE_PLTS is not set
-CONFIG_FLATMEM=y
-CONFIG_FLAT_NODE_MEM_MAP=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_NO_BOOTMEM=y
-# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
-CONFIG_SPLIT_PTLOCK_CPUS=4
-CONFIG_COMPACTION=y
-CONFIG_MIGRATION=y
-# CONFIG_PHYS_ADDR_T_64BIT is not set
-CONFIG_BOUNCE=y
-# CONFIG_KSM is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-# CONFIG_ARCH_WANTS_THP_SWAP is not set
-# CONFIG_CLEANCACHE is not set
-# CONFIG_FRONTSWAP is not set
-# CONFIG_CMA is not set
-# CONFIG_ZPOOL is not set
-# CONFIG_ZBUD is not set
-# CONFIG_ZSMALLOC is not set
-CONFIG_GENERIC_EARLY_IOREMAP=y
-# CONFIG_IDLE_PAGE_TRACKING is not set
-# CONFIG_PERCPU_STATS is not set
-CONFIG_FORCE_MAX_ZONEORDER=11
-CONFIG_ALIGNMENT_TRAP=y
-# CONFIG_UACCESS_WITH_MEMCPY is not set
-# CONFIG_SECCOMP is not set
-CONFIG_SWIOTLB=y
-CONFIG_IOMMU_HELPER=y
-# CONFIG_PARAVIRT is not set
-# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
-# CONFIG_XEN is not set
-
-#
-# Boot options
-#
-CONFIG_USE_OF=y
-CONFIG_ATAGS=y
-# CONFIG_DEPRECATED_PARAM_STRUCT is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
-# CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND is not set
-CONFIG_CMDLINE=""
-# CONFIG_KEXEC is not set
-# CONFIG_CRASH_DUMP is not set
-CONFIG_AUTO_ZRELADDR=y
-# CONFIG_EFI is not set
-
-#
-# CPU Power Management
-#
-
-#
-# CPU Frequency scaling
-#
-# CONFIG_CPU_FREQ is not set
-
-#
-# CPU Idle
-#
-# CONFIG_CPU_IDLE is not set
-# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
-
-#
-# Floating point emulation
-#
-
-#
-# At least one emulation must be selected
-#
 CONFIG_VFP=y
-CONFIG_VFPv3=y
 CONFIG_NEON=y
-# CONFIG_KERNEL_MODE_NEON is not set
-
-#
-# Userspace binary formats
-#
-CONFIG_BINFMT_ELF=y
-CONFIG_ELFCORE=y
-CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
-CONFIG_BINFMT_SCRIPT=y
-# CONFIG_BINFMT_FLAT is not set
-# CONFIG_HAVE_AOUT is not set
-# CONFIG_BINFMT_MISC is not set
-CONFIG_COREDUMP=y
-
-#
-# Power management options
-#
-CONFIG_SUSPEND=y
-CONFIG_SUSPEND_FREEZER=y
-# CONFIG_HIBERNATION is not set
-CONFIG_PM_SLEEP=y
-CONFIG_PM_SLEEP_SMP=y
-# CONFIG_PM_AUTOSLEEP is not set
-# CONFIG_PM_WAKELOCKS is not set
-CONFIG_PM=y
-# CONFIG_PM_DEBUG is not set
-# CONFIG_APM_EMULATION is not set
-CONFIG_PM_OPP=y
-CONFIG_PM_CLK=y
-# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
-CONFIG_CPU_PM=y
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-CONFIG_ARM_CPU_SUSPEND=y
-CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+# CONFIG_SECCOMP is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_NET=y
-
-#
-# Networking options
-#
 CONFIG_PACKET=y
-# CONFIG_PACKET_DIAG is not set
 CONFIG_UNIX=y
-# CONFIG_UNIX_DIAG is not set
-# CONFIG_TLS is not set
-# CONFIG_XFRM_USER is not set
-# CONFIG_NET_KEY is not set
 CONFIG_INET=y
-# CONFIG_IP_MULTICAST is not set
-# CONFIG_IP_ADVANCED_ROUTER is not set
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-# CONFIG_IP_PNP_RARP is not set
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE_DEMUX is not set
-# CONFIG_NET_IP_TUNNEL is not set
-# CONFIG_SYN_COOKIES is not set
-# CONFIG_NET_UDP_TUNNEL is not set
-# CONFIG_NET_FOU is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
-# CONFIG_TCP_CONG_ADVANCED is not set
-CONFIG_TCP_CONG_CUBIC=y
-CONFIG_DEFAULT_TCP_CONG="cubic"
-# CONFIG_TCP_MD5SIG is not set
 # CONFIG_IPV6 is not set
-# CONFIG_NETWORK_SECMARK is not set
-CONFIG_NET_PTP_CLASSIFY=y
-# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
-# CONFIG_NETFILTER is not set
-# CONFIG_IP_DCCP is not set
-# CONFIG_IP_SCTP is not set
-# CONFIG_RDS is not set
-# CONFIG_TIPC is not set
-# CONFIG_ATM is not set
-# CONFIG_L2TP is not set
-# CONFIG_BRIDGE is not set
-CONFIG_HAVE_NET_DSA=y
-# CONFIG_NET_DSA is not set
-# CONFIG_VLAN_8021Q is not set
-# CONFIG_DECNET is not set
-# CONFIG_LLC2 is not set
-# CONFIG_IPX is not set
-# CONFIG_ATALK is not set
-# CONFIG_X25 is not set
-# CONFIG_LAPB is not set
-# CONFIG_PHONET is not set
-# CONFIG_IEEE802154 is not set
-# CONFIG_NET_SCHED is not set
-# CONFIG_DCB is not set
-CONFIG_DNS_RESOLVER=y
-# CONFIG_BATMAN_ADV is not set
-# CONFIG_OPENVSWITCH is not set
-# CONFIG_VSOCKETS is not set
-# CONFIG_NETLINK_DIAG is not set
-# CONFIG_MPLS is not set
-# CONFIG_HSR is not set
-# CONFIG_NET_SWITCHDEV is not set
-# CONFIG_NET_L3_MASTER_DEV is not set
-# CONFIG_NET_NCSI is not set
-CONFIG_RPS=y
-CONFIG_RFS_ACCEL=y
-CONFIG_XPS=y
-# CONFIG_CGROUP_NET_PRIO is not set
-# CONFIG_CGROUP_NET_CLASSID is not set
-CONFIG_NET_RX_BUSY_POLL=y
-CONFIG_BQL=y
-# CONFIG_BPF_JIT is not set
-CONFIG_NET_FLOW_LIMIT=y
-
-#
-# Network testing
-#
-# CONFIG_NET_PKTGEN is not set
-# CONFIG_NET_DROP_MONITOR is not set
-# CONFIG_HAMRADIO is not set
-# CONFIG_CAN is not set
-# CONFIG_IRDA is not set
-# CONFIG_BT is not set
-# CONFIG_AF_RXRPC is not set
-# CONFIG_AF_KCM is not set
-# CONFIG_STREAM_PARSER is not set
-CONFIG_WIRELESS=y
 CONFIG_CFG80211=y
-# CONFIG_NL80211_TESTMODE is not set
-# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
-CONFIG_CFG80211_DEFAULT_PS=y
 CONFIG_CFG80211_DEBUGFS=y
-# CONFIG_CFG80211_INTERNAL_REGDB is not set
-CONFIG_CFG80211_CRDA_SUPPORT=y
-# CONFIG_CFG80211_WEXT is not set
-# CONFIG_LIB80211 is not set
 CONFIG_MAC80211=y
-CONFIG_MAC80211_HAS_RC=y
-CONFIG_MAC80211_RC_MINSTREL=y
-CONFIG_MAC80211_RC_MINSTREL_HT=y
-# CONFIG_MAC80211_RC_MINSTREL_VHT is not set
-CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
-CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
-# CONFIG_MAC80211_MESH is not set
-CONFIG_MAC80211_LEDS=y
-# CONFIG_MAC80211_DEBUGFS is not set
-# CONFIG_MAC80211_MESSAGE_TRACING is not set
-# CONFIG_MAC80211_DEBUG_MENU is not set
-CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
-# CONFIG_WIMAX is not set
-# CONFIG_RFKILL is not set
-# CONFIG_NET_9P is not set
-# CONFIG_CAIF is not set
-# CONFIG_CEPH_LIB is not set
-# CONFIG_NFC is not set
-# CONFIG_PSAMPLE is not set
-# CONFIG_NET_IFE is not set
-# CONFIG_LWTUNNEL is not set
-# CONFIG_DST_CACHE is not set
-# CONFIG_GRO_CELLS is not set
-# CONFIG_NET_DEVLINK is not set
-CONFIG_MAY_USE_DEVLINK=y
-CONFIG_HAVE_CBPF_JIT=y
-
-#
-# Device Drivers
-#
-
-#
-# Generic Driver Options
-#
 CONFIG_UEVENT_HELPER=y
-CONFIG_UEVENT_HELPER_PATH=""
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_STANDALONE=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=y
-CONFIG_FIRMWARE_IN_KERNEL=y
-CONFIG_EXTRA_FIRMWARE=""
-# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
-CONFIG_ALLOW_DEV_COREDUMP=y
-# CONFIG_DEBUG_DRIVER is not set
-# CONFIG_DEBUG_DEVRES is not set
-# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
-# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
-# CONFIG_SYS_HYPERVISOR is not set
-# CONFIG_GENERIC_CPU_DEVICES is not set
-CONFIG_GENERIC_CPU_AUTOPROBE=y
-CONFIG_REGMAP=y
-CONFIG_REGMAP_I2C=y
-CONFIG_REGMAP_SPI=y
-CONFIG_REGMAP_MMIO=y
-# CONFIG_DMA_SHARED_BUFFER is not set
-CONFIG_GENERIC_ARCH_TOPOLOGY=y
-
-#
-# Bus devices
-#
-# CONFIG_ARM_CCI400_PMU is not set
-# CONFIG_ARM_CCI5xx_PMU is not set
-# CONFIG_ARM_CCN is not set
-# CONFIG_BRCMSTB_GISB_ARB is not set
-# CONFIG_SIMPLE_PM_BUS is not set
-# CONFIG_SUNXI_RSB is not set
-# CONFIG_VEXPRESS_CONFIG is not set
-# CONFIG_CONNECTOR is not set
-# CONFIG_MTD is not set
-CONFIG_DTC=y
-CONFIG_OF=y
-# CONFIG_OF_UNITTEST is not set
-CONFIG_OF_FLATTREE=y
-CONFIG_OF_EARLY_FLATTREE=y
-CONFIG_OF_ADDRESS=y
-CONFIG_OF_IRQ=y
-CONFIG_OF_NET=y
-CONFIG_OF_MDIO=y
-CONFIG_OF_RESERVED_MEM=y
-# CONFIG_OF_OVERLAY is not set
-CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
-# CONFIG_PARPORT is not set
-CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_NULL_BLK is not set
-# CONFIG_BLK_DEV_COW_COMMON is not set
-# CONFIG_BLK_DEV_LOOP is not set
-# CONFIG_BLK_DEV_DRBD is not set
-# CONFIG_BLK_DEV_NBD is not set
-# CONFIG_BLK_DEV_RAM is not set
-# CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
-# CONFIG_BLK_DEV_RBD is not set
-# CONFIG_NVME_FC is not set
-
-#
-# Misc devices
-#
-# CONFIG_SENSORS_LIS3LV02D is not set
-# CONFIG_AD525X_DPOT is not set
-# CONFIG_DUMMY_IRQ is not set
-# CONFIG_ICS932S401 is not set
-# CONFIG_ENCLOSURE_SERVICES is not set
-# CONFIG_APDS9802ALS is not set
-# CONFIG_ISL29003 is not set
-# CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
-# CONFIG_SENSORS_BH1770 is not set
-# CONFIG_SENSORS_APDS990X is not set
-# CONFIG_HMC6352 is not set
-# CONFIG_DS1682 is not set
-# CONFIG_TI_DAC7512 is not set
-# CONFIG_USB_SWITCH_FSA9480 is not set
-# CONFIG_LATTICE_ECP3_CONFIG is not set
-# CONFIG_SRAM is not set
-# CONFIG_C2PORT is not set
-
-#
-# EEPROM support
-#
-# CONFIG_EEPROM_AT24 is not set
-# CONFIG_EEPROM_AT25 is not set
-# CONFIG_EEPROM_LEGACY is not set
-# CONFIG_EEPROM_MAX6875 is not set
-# CONFIG_EEPROM_93CX6 is not set
-# CONFIG_EEPROM_93XX46 is not set
-# CONFIG_EEPROM_IDT_89HPESX is not set
-
-#
-# Texas Instruments shared transport line discipline
-#
-# CONFIG_TI_ST is not set
-# CONFIG_SENSORS_LIS3_SPI is not set
-# CONFIG_SENSORS_LIS3_I2C is not set
-
-#
-# Altera FPGA firmware download module
-#
-# CONFIG_ALTERA_STAPL is not set
-
-#
-# Intel MIC Bus Driver
-#
-
-#
-# SCIF Bus Driver
-#
-
-#
-# VOP Bus Driver
-#
-
-#
-# Intel MIC Host Driver
-#
-
-#
-# Intel MIC Card Driver
-#
-
-#
-# SCIF Driver
-#
-
-#
-# Intel MIC Coprocessor State Management (COSM) Drivers
-#
-
-#
-# VOP Driver
-#
-# CONFIG_ECHO is not set
-# CONFIG_CXL_BASE is not set
-# CONFIG_CXL_AFU_DRIVER_OPS is not set
-# CONFIG_CXL_LIB is not set
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-# CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-# CONFIG_SCSI_NETLINK is not set
-# CONFIG_SCSI_MQ_DEFAULT is not set
-CONFIG_SCSI_PROC_FS=y
-
-#
-# SCSI support type (disk, tape, CD-ROM)
-#
 CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
-# CONFIG_CHR_DEV_OSST is not set
-# CONFIG_BLK_DEV_SR is not set
-# CONFIG_CHR_DEV_SG is not set
-# CONFIG_CHR_DEV_SCH is not set
-# CONFIG_SCSI_CONSTANTS is not set
-# CONFIG_SCSI_LOGGING is not set
-# CONFIG_SCSI_SCAN_ASYNC is not set
-
-#
-# SCSI Transports
-#
-# CONFIG_SCSI_SPI_ATTRS is not set
-# CONFIG_SCSI_FC_ATTRS is not set
-# CONFIG_SCSI_ISCSI_ATTRS is not set
-# CONFIG_SCSI_SAS_ATTRS is not set
-# CONFIG_SCSI_SAS_LIBSAS is not set
-# CONFIG_SCSI_SRP_ATTRS is not set
-CONFIG_SCSI_LOWLEVEL=y
-# CONFIG_ISCSI_TCP is not set
-# CONFIG_ISCSI_BOOT_SYSFS is not set
-# CONFIG_SCSI_UFSHCD is not set
-# CONFIG_SCSI_DEBUG is not set
-# CONFIG_SCSI_DH is not set
-# CONFIG_SCSI_OSD_INITIATOR is not set
 CONFIG_ATA=y
-# CONFIG_ATA_NONSTANDARD is not set
-CONFIG_ATA_VERBOSE_ERROR=y
-CONFIG_SATA_PMP=y
-
-#
-# Controllers with non-SFF native interface
-#
-# CONFIG_SATA_AHCI_PLATFORM is not set
-# CONFIG_AHCI_CEVA is not set
 CONFIG_AHCI_SUNXI=y
-# CONFIG_AHCI_QORIQ is not set
-CONFIG_ATA_SFF=y
-
-#
-# SFF controllers with custom DMA interface
-#
-CONFIG_ATA_BMDMA=y
-
-#
-# SATA SFF controllers with BMDMA
-#
-
-#
-# PATA SFF controllers with BMDMA
-#
-
-#
-# PIO-only SFF controllers
-#
-
-#
-# Generic fallback / legacy drivers
-#
-# CONFIG_MD is not set
-# CONFIG_TARGET_CORE is not set
 CONFIG_NETDEVICES=y
-CONFIG_MII=y
-CONFIG_NET_CORE=y
-# CONFIG_BONDING is not set
-# CONFIG_DUMMY is not set
-# CONFIG_EQUALIZER is not set
-# CONFIG_NET_TEAM is not set
-# CONFIG_MACVLAN is not set
-# CONFIG_VXLAN is not set
-# CONFIG_MACSEC is not set
-# CONFIG_NETCONSOLE is not set
-# CONFIG_NETPOLL is not set
-# CONFIG_NET_POLL_CONTROLLER is not set
-# CONFIG_TUN is not set
-# CONFIG_TUN_VNET_CROSS_LE is not set
-# CONFIG_VETH is not set
-# CONFIG_NLMON is not set
-
-#
-# CAIF transport drivers
-#
-
-#
-# Distributed Switch Architecture drivers
-#
-CONFIG_ETHERNET=y
-CONFIG_NET_VENDOR_ALACRITECH=y
-CONFIG_NET_VENDOR_ALLWINNER=y
 CONFIG_SUN4I_EMAC=y
-# CONFIG_ALTERA_TSE is not set
-CONFIG_NET_VENDOR_AMAZON=y
-CONFIG_NET_VENDOR_AQUANTIA=y
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_AURORA is not set
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_DM9000 is not set
-# CONFIG_DNET is not set
-CONFIG_NET_VENDOR_EZCHIP=y
-# CONFIG_EZCHIP_NPS_MANAGEMENT_ENET is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
-CONFIG_NET_VENDOR_HISILICON=y
-# CONFIG_HIX5HD2_GMAC is not set
-# CONFIG_HISI_FEMAC is not set
-# CONFIG_HIP04_ETH is not set
-# CONFIG_HNS is not set
-# CONFIG_HNS_DSAF is not set
-# CONFIG_HNS_ENET is not set
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MICREL is not set
 # CONFIG_NET_VENDOR_MICROCHIP is not set
 # CONFIG_NET_VENDOR_NATSEMI is not set
-CONFIG_NET_VENDOR_NETRONOME=y
-# CONFIG_ETHOC is not set
-CONFIG_NET_VENDOR_QUALCOMM=y
-# CONFIG_QCA7000_SPI is not set
-# CONFIG_QCOM_EMAC is not set
-CONFIG_NET_VENDOR_RENESAS=y
 # CONFIG_NET_VENDOR_ROCKER is not set
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
-CONFIG_NET_VENDOR_SOLARFLARE=y
 # CONFIG_NET_VENDOR_SMSC is not set
-CONFIG_NET_VENDOR_STMICRO=y
 CONFIG_STMMAC_ETH=y
-CONFIG_STMMAC_PLATFORM=y
-# CONFIG_DWMAC_DWC_QOS_ETH is not set
-CONFIG_DWMAC_GENERIC=y
-CONFIG_DWMAC_SUNXI=y
-CONFIG_DWMAC_SUN8I=y
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_NET_VENDOR_SYNOPSYS=y
-# CONFIG_DWC_XLGMAC is not set
-CONFIG_MDIO_DEVICE=y
-CONFIG_MDIO_BUS=y
-# CONFIG_MDIO_BCM_UNIMAC is not set
-# CONFIG_MDIO_BITBANG is not set
-# CONFIG_MDIO_BUS_MUX_GPIO is not set
-# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
-# CONFIG_MDIO_HISI_FEMAC is not set
-CONFIG_MDIO_SUN4I=y
-CONFIG_PHYLIB=y
-CONFIG_SWPHY=y
-# CONFIG_LED_TRIGGER_PHY is not set
-
-#
-# MII PHY device drivers
-#
-# CONFIG_AMD_PHY is not set
-# CONFIG_AQUANTIA_PHY is not set
-# CONFIG_AT803X_PHY is not set
-# CONFIG_BCM7XXX_PHY is not set
-# CONFIG_BCM87XX_PHY is not set
-# CONFIG_BROADCOM_PHY is not set
-# CONFIG_CICADA_PHY is not set
-# CONFIG_CORTINA_PHY is not set
-# CONFIG_DAVICOM_PHY is not set
-# CONFIG_DP83848_PHY is not set
-# CONFIG_DP83867_PHY is not set
-CONFIG_FIXED_PHY=y
-# CONFIG_ICPLUS_PHY is not set
-# CONFIG_INTEL_XWAY_PHY is not set
-# CONFIG_LSI_ET1011C_PHY is not set
-# CONFIG_LXT_PHY is not set
-# CONFIG_MARVELL_PHY is not set
-# CONFIG_MARVELL_10G_PHY is not set
-# CONFIG_MICREL_PHY is not set
-# CONFIG_MICROCHIP_PHY is not set
-# CONFIG_MICROSEMI_PHY is not set
-# CONFIG_NATIONAL_PHY is not set
-# CONFIG_QSEMI_PHY is not set
-# CONFIG_REALTEK_PHY is not set
-# CONFIG_SMSC_PHY is not set
-# CONFIG_STE10XP is not set
-# CONFIG_TERANETICS_PHY is not set
-# CONFIG_VITESSE_PHY is not set
-# CONFIG_XILINX_GMII2RGMII is not set
-# CONFIG_MICREL_KS8995MA is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-CONFIG_USB_NET_DRIVERS=y
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-# CONFIG_USB_RTL8152 is not set
-# CONFIG_USB_LAN78XX is not set
-# CONFIG_USB_USBNET is not set
-# CONFIG_USB_IPHETH is not set
-CONFIG_WLAN=y
-CONFIG_WLAN_VENDOR_ADMTEK=y
-CONFIG_ATH_COMMON=m
-CONFIG_WLAN_VENDOR_ATH=y
-# CONFIG_ATH_DEBUG is not set
-# CONFIG_ATH9K is not set
-# CONFIG_ATH9K_HTC is not set
 CONFIG_CARL9170=m
-CONFIG_CARL9170_LEDS=y
-CONFIG_CARL9170_WPC=y
-# CONFIG_ATH6KL is not set
-# CONFIG_AR5523 is not set
-# CONFIG_ATH10K is not set
-# CONFIG_WCN36XX is not set
-CONFIG_WLAN_VENDOR_ATMEL=y
-# CONFIG_AT76C50X_USB is not set
-CONFIG_WLAN_VENDOR_BROADCOM=y
-# CONFIG_B43 is not set
-# CONFIG_B43LEGACY is not set
-# CONFIG_BRCMSMAC is not set
-# CONFIG_BRCMFMAC is not set
-CONFIG_WLAN_VENDOR_CISCO=y
-CONFIG_WLAN_VENDOR_INTEL=y
-CONFIG_WLAN_VENDOR_INTERSIL=y
-# CONFIG_HOSTAP is not set
-# CONFIG_P54_COMMON is not set
-CONFIG_WLAN_VENDOR_MARVELL=y
-# CONFIG_LIBERTAS is not set
-# CONFIG_LIBERTAS_THINFIRM is not set
-# CONFIG_MWIFIEX is not set
-CONFIG_WLAN_VENDOR_MEDIATEK=y
-# CONFIG_MT7601U is not set
-CONFIG_WLAN_VENDOR_RALINK=y
-# CONFIG_RT2X00 is not set
-CONFIG_WLAN_VENDOR_REALTEK=y
-# CONFIG_RTL8187 is not set
 CONFIG_RTL_CARDS=m
 CONFIG_RTL8192CU=m
-CONFIG_RTLWIFI=m
-CONFIG_RTLWIFI_USB=m
-CONFIG_RTLWIFI_DEBUG=y
-CONFIG_RTL8192C_COMMON=m
-# CONFIG_RTL8XXXU is not set
-CONFIG_WLAN_VENDOR_RSI=y
-# CONFIG_RSI_91X is not set
-CONFIG_WLAN_VENDOR_ST=y
-# CONFIG_CW1200 is not set
-CONFIG_WLAN_VENDOR_TI=y
-# CONFIG_WL1251 is not set
-# CONFIG_WL12XX is not set
-# CONFIG_WL18XX is not set
-# CONFIG_WLCORE is not set
-CONFIG_WLAN_VENDOR_ZYDAS=y
-# CONFIG_USB_ZD1201 is not set
-# CONFIG_ZD1211RW is not set
-CONFIG_WLAN_VENDOR_QUANTENNA=y
-# CONFIG_MAC80211_HWSIM is not set
-# CONFIG_USB_NET_RNDIS_WLAN is not set
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
-# CONFIG_WAN is not set
-# CONFIG_ISDN is not set
-# CONFIG_NVM is not set
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-CONFIG_INPUT_LEDS=y
-# CONFIG_INPUT_FF_MEMLESS is not set
-# CONFIG_INPUT_POLLDEV is not set
-# CONFIG_INPUT_SPARSEKMAP is not set
-# CONFIG_INPUT_MATRIXKMAP is not set
-
-#
-# Userland interfaces
-#
-# CONFIG_INPUT_MOUSEDEV is not set
-# CONFIG_INPUT_JOYDEV is not set
-# CONFIG_INPUT_EVDEV is not set
-# CONFIG_INPUT_EVBUG is not set
-
-#
-# Input Device Drivers
-#
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
-# CONFIG_INPUT_JOYSTICK is not set
-# CONFIG_INPUT_TABLET is not set
-# CONFIG_INPUT_TOUCHSCREEN is not set
-# CONFIG_INPUT_MISC is not set
-# CONFIG_RMI4_CORE is not set
-
-#
-# Hardware I/O ports
-#
-CONFIG_SERIO=y
-CONFIG_SERIO_SERPORT=y
-# CONFIG_SERIO_LIBPS2 is not set
-# CONFIG_SERIO_RAW is not set
-# CONFIG_SERIO_ALTERA_PS2 is not set
-# CONFIG_SERIO_PS2MULT is not set
-# CONFIG_SERIO_ARC_PS2 is not set
-# CONFIG_SERIO_APBPS2 is not set
-# CONFIG_SERIO_SUN4I_PS2 is not set
-# CONFIG_USERIO is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-CONFIG_TTY=y
-CONFIG_VT=y
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE=y
-CONFIG_VT_CONSOLE_SLEEP=y
-CONFIG_HW_CONSOLE=y
-# CONFIG_VT_HW_CONSOLE_BINDING is not set
-CONFIG_UNIX98_PTYS=y
-CONFIG_LEGACY_PTYS=y
-CONFIG_LEGACY_PTY_COUNT=256
-# CONFIG_SERIAL_NONSTANDARD is not set
-# CONFIG_N_GSM is not set
-# CONFIG_TRACE_SINK is not set
-CONFIG_DEVMEM=y
-CONFIG_DEVKMEM=y
-
-#
-# Serial drivers
-#
-CONFIG_SERIAL_EARLYCON=y
 CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
-# CONFIG_SERIAL_8250_FINTEK is not set
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=8
 CONFIG_SERIAL_8250_RUNTIME_UARTS=8
-# CONFIG_SERIAL_8250_EXTENDED is not set
-# CONFIG_SERIAL_8250_ASPEED_VUART is not set
-CONFIG_SERIAL_8250_FSL=y
 CONFIG_SERIAL_8250_DW=y
-# CONFIG_SERIAL_8250_EM is not set
-# CONFIG_SERIAL_8250_RT288X is not set
 CONFIG_SERIAL_OF_PLATFORM=y
-
-#
-# Non-8250 serial port support
-#
-# CONFIG_SERIAL_EARLYCON_ARM_SEMIHOST is not set
-# CONFIG_SERIAL_KGDB_NMI is not set
-# CONFIG_SERIAL_MAX3100 is not set
-# CONFIG_SERIAL_MAX310X is not set
-# CONFIG_SERIAL_UARTLITE is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-CONFIG_CONSOLE_POLL=y
-# CONFIG_SERIAL_SCCNXP is not set
-# CONFIG_SERIAL_SC16IS7XX is not set
-# CONFIG_SERIAL_BCM63XX is not set
-# CONFIG_SERIAL_ALTERA_JTAGUART is not set
-# CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_IFX6X60 is not set
-# CONFIG_SERIAL_XILINX_PS_UART is not set
-# CONFIG_SERIAL_ARC is not set
-# CONFIG_SERIAL_FSL_LPUART is not set
-# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
-# CONFIG_SERIAL_ST_ASC is not set
-# CONFIG_SERIAL_DEV_BUS is not set
-# CONFIG_HVC_DCC is not set
-# CONFIG_IPMI_HANDLER is not set
 # CONFIG_HW_RANDOM is not set
-# CONFIG_R3964 is not set
-# CONFIG_RAW_DRIVER is not set
-# CONFIG_TCG_TPM is not set
-# CONFIG_XILLYBUS is not set
-
-#
-# I2C support
-#
+CONFIG_DEVKMEM=y
 CONFIG_I2C=y
-CONFIG_I2C_BOARDINFO=y
-CONFIG_I2C_COMPAT=y
 CONFIG_I2C_CHARDEV=y
-# CONFIG_I2C_MUX is not set
-CONFIG_I2C_HELPER_AUTO=y
-
-#
-# I2C Hardware Bus support
-#
-
-#
-# I2C system bus drivers (mostly embedded / system-on-chip)
-#
-# CONFIG_I2C_CBUS_GPIO is not set
-# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
-# CONFIG_I2C_EMEV2 is not set
-# CONFIG_I2C_GPIO is not set
 CONFIG_I2C_MV64XXX=y
-# CONFIG_I2C_OCORES is not set
-# CONFIG_I2C_PCA_PLATFORM is not set
-# CONFIG_I2C_PXA_PCI is not set
-# CONFIG_I2C_RK3X is not set
-# CONFIG_I2C_SIMTEC is not set
-# CONFIG_I2C_XILINX is not set
-
-#
-# External I2C/SMBus adapter drivers
-#
-# CONFIG_I2C_DIOLAN_U2C is not set
-# CONFIG_I2C_PARPORT_LIGHT is not set
-# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
-# CONFIG_I2C_TAOS_EVM is not set
-# CONFIG_I2C_TINY_USB is not set
-
-#
-# Other I2C/SMBus bus drivers
-#
-# CONFIG_I2C_STUB is not set
-# CONFIG_I2C_SLAVE is not set
-# CONFIG_I2C_DEBUG_CORE is not set
-# CONFIG_I2C_DEBUG_ALGO is not set
-# CONFIG_I2C_DEBUG_BUS is not set
 CONFIG_SPI=y
-# CONFIG_SPI_DEBUG is not set
-CONFIG_SPI_MASTER=y
-
-#
-# SPI Master Controller Drivers
-#
-# CONFIG_SPI_ALTERA is not set
-# CONFIG_SPI_AXI_SPI_ENGINE is not set
-# CONFIG_SPI_BITBANG is not set
-# CONFIG_SPI_CADENCE is not set
-# CONFIG_SPI_DESIGNWARE is not set
-# CONFIG_SPI_GPIO is not set
-# CONFIG_SPI_FSL_SPI is not set
-# CONFIG_SPI_OC_TINY is not set
-# CONFIG_SPI_PXA2XX_PCI is not set
-# CONFIG_SPI_ROCKCHIP is not set
-# CONFIG_SPI_SC18IS602 is not set
 CONFIG_SPI_SUN4I=y
 CONFIG_SPI_SUN6I=y
-# CONFIG_SPI_XCOMM is not set
-# CONFIG_SPI_XILINX is not set
-# CONFIG_SPI_ZYNQMP_GQSPI is not set
-
-#
-# SPI Protocol Masters
-#
-# CONFIG_SPI_SPIDEV is not set
-# CONFIG_SPI_LOOPBACK_TEST is not set
-# CONFIG_SPI_TLE62X0 is not set
-# CONFIG_SPI_SLAVE is not set
-# CONFIG_SPMI is not set
-# CONFIG_HSI is not set
-CONFIG_PPS=y
-# CONFIG_PPS_DEBUG is not set
-
-#
-# PPS clients support
-#
-# CONFIG_PPS_CLIENT_KTIMER is not set
-# CONFIG_PPS_CLIENT_LDISC is not set
-# CONFIG_PPS_CLIENT_GPIO is not set
-
-#
-# PPS generators support
-#
-
-#
-# PTP clock support
-#
-CONFIG_PTP_1588_CLOCK=y
-
-#
-# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
-#
-CONFIG_PINCTRL=y
-
-#
-# Pin controllers
-#
-CONFIG_PINMUX=y
-CONFIG_PINCONF=y
-CONFIG_GENERIC_PINCONF=y
-# CONFIG_DEBUG_PINCTRL is not set
-# CONFIG_PINCTRL_AMD is not set
-# CONFIG_PINCTRL_MCP23S08 is not set
-# CONFIG_PINCTRL_SINGLE is not set
-# CONFIG_PINCTRL_SX150X is not set
-CONFIG_PINCTRL_SUNXI=y
-CONFIG_PINCTRL_SUN4I_A10=y
-# CONFIG_PINCTRL_SUN5I is not set
-# CONFIG_PINCTRL_SUN6I_A31 is not set
-# CONFIG_PINCTRL_SUN6I_A31_R is not set
-# CONFIG_PINCTRL_SUN8I_A23 is not set
-# CONFIG_PINCTRL_SUN8I_A33 is not set
-# CONFIG_PINCTRL_SUN8I_A83T is not set
-# CONFIG_PINCTRL_SUN8I_A83T_R is not set
-# CONFIG_PINCTRL_SUN8I_A23_R is not set
-# CONFIG_PINCTRL_SUN8I_H3 is not set
-# CONFIG_PINCTRL_SUN8I_H3_R is not set
-# CONFIG_PINCTRL_SUN8I_V3S is not set
-# CONFIG_PINCTRL_SUN9I_A80 is not set
-# CONFIG_PINCTRL_SUN9I_A80_R is not set
-# CONFIG_PINCTRL_SUN50I_A64 is not set
-# CONFIG_PINCTRL_SUN50I_A64_R is not set
-# CONFIG_PINCTRL_SUN50I_H5 is not set
-CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
-CONFIG_GPIOLIB=y
-CONFIG_OF_GPIO=y
-# CONFIG_DEBUG_GPIO is not set
 CONFIG_GPIO_SYSFS=y
-
-#
-# Memory mapped GPIO drivers
-#
-# CONFIG_GPIO_74XX_MMIO is not set
-# CONFIG_GPIO_ALTERA is not set
-# CONFIG_GPIO_DWAPB is not set
-# CONFIG_GPIO_FTGPIO010 is not set
-# CONFIG_GPIO_GENERIC_PLATFORM is not set
-# CONFIG_GPIO_GRGPIO is not set
-# CONFIG_GPIO_MOCKUP is not set
-# CONFIG_GPIO_MPC8XXX is not set
-# CONFIG_GPIO_SYSCON is not set
-# CONFIG_GPIO_XILINX is not set
-# CONFIG_GPIO_ZEVIO is not set
-
-#
-# I2C GPIO expanders
-#
-# CONFIG_GPIO_ADP5588 is not set
-# CONFIG_GPIO_ADNP is not set
-# CONFIG_GPIO_MAX7300 is not set
-# CONFIG_GPIO_MAX732X is not set
-# CONFIG_GPIO_PCA953X is not set
-# CONFIG_GPIO_PCF857X is not set
-# CONFIG_GPIO_SX150X is not set
-# CONFIG_GPIO_TPIC2810 is not set
-
-#
-# MFD GPIO expanders
-#
-# CONFIG_HTC_EGPIO is not set
-
-#
-# SPI GPIO expanders
-#
-# CONFIG_GPIO_74X164 is not set
-# CONFIG_GPIO_MAX7301 is not set
-# CONFIG_GPIO_MC33880 is not set
-# CONFIG_GPIO_PISOSR is not set
-# CONFIG_GPIO_XRA1403 is not set
-
-#
-# USB GPIO expanders
-#
-# CONFIG_W1 is not set
-# CONFIG_POWER_AVS is not set
 CONFIG_POWER_RESET=y
-# CONFIG_POWER_RESET_BRCMKONA is not set
-# CONFIG_POWER_RESET_BRCMSTB is not set
-# CONFIG_POWER_RESET_GPIO is not set
-# CONFIG_POWER_RESET_GPIO_RESTART is not set
-# CONFIG_POWER_RESET_LTC2952 is not set
-# CONFIG_POWER_RESET_RESTART is not set
-# CONFIG_POWER_RESET_VERSATILE is not set
-# CONFIG_POWER_RESET_SYSCON is not set
-# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
-# CONFIG_SYSCON_REBOOT_MODE is not set
 CONFIG_POWER_SUPPLY=y
-# CONFIG_POWER_SUPPLY_DEBUG is not set
-# CONFIG_PDA_POWER is not set
-# CONFIG_TEST_POWER is not set
-# CONFIG_BATTERY_DS2780 is not set
-# CONFIG_BATTERY_DS2781 is not set
-# CONFIG_BATTERY_DS2782 is not set
-# CONFIG_BATTERY_SBS is not set
-# CONFIG_CHARGER_SBS is not set
-# CONFIG_BATTERY_BQ27XXX is not set
-# CONFIG_BATTERY_MAX17040 is not set
-# CONFIG_BATTERY_MAX17042 is not set
-# CONFIG_CHARGER_MAX8903 is not set
-# CONFIG_CHARGER_LP8727 is not set
-# CONFIG_CHARGER_GPIO is not set
-# CONFIG_CHARGER_MANAGER is not set
-# CONFIG_CHARGER_LTC3651 is not set
-# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
-# CONFIG_CHARGER_BQ2415X is not set
-# CONFIG_CHARGER_BQ24257 is not set
-# CONFIG_CHARGER_BQ24735 is not set
-# CONFIG_CHARGER_BQ25890 is not set
-# CONFIG_CHARGER_SMB347 is not set
-# CONFIG_BATTERY_GAUGE_LTC2941 is not set
-# CONFIG_CHARGER_RT9455 is not set
 # CONFIG_HWMON is not set
-# CONFIG_THERMAL is not set
 CONFIG_WATCHDOG=y
-CONFIG_WATCHDOG_CORE=y
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
-# CONFIG_WATCHDOG_SYSFS is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_GPIO_WATCHDOG is not set
-# CONFIG_XILINX_WATCHDOG is not set
-# CONFIG_ZIIRAVE_WATCHDOG is not set
-# CONFIG_CADENCE_WATCHDOG is not set
-# CONFIG_DW_WATCHDOG is not set
 CONFIG_SUNXI_WATCHDOG=y
-# CONFIG_MAX63XX_WATCHDOG is not set
-# CONFIG_MEN_A21_WDT is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
-
-#
-# Watchdog Pretimeout Governors
-#
-# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# Broadcom specific AMBA
-#
-# CONFIG_BCMA is not set
-
-#
-# Multifunction device drivers
-#
-CONFIG_MFD_CORE=y
-# CONFIG_MFD_ACT8945A is not set
-# CONFIG_MFD_SUN4I_GPADC is not set
-# CONFIG_MFD_AS3711 is not set
-# CONFIG_MFD_AS3722 is not set
-# CONFIG_PMIC_ADP5520 is not set
-# CONFIG_MFD_AAT2870_CORE is not set
-# CONFIG_MFD_ATMEL_FLEXCOM is not set
-# CONFIG_MFD_ATMEL_HLCDC is not set
-# CONFIG_MFD_BCM590XX is not set
-# CONFIG_MFD_AXP20X_I2C is not set
-# CONFIG_MFD_CROS_EC is not set
-# CONFIG_MFD_ASIC3 is not set
-# CONFIG_PMIC_DA903X is not set
-# CONFIG_MFD_DA9052_SPI is not set
-# CONFIG_MFD_DA9052_I2C is not set
-# CONFIG_MFD_DA9055 is not set
-# CONFIG_MFD_DA9062 is not set
-# CONFIG_MFD_DA9063 is not set
-# CONFIG_MFD_DA9150 is not set
-# CONFIG_MFD_DLN2 is not set
-# CONFIG_MFD_MC13XXX_SPI is not set
-# CONFIG_MFD_MC13XXX_I2C is not set
-# CONFIG_MFD_HI6421_PMIC is not set
-# CONFIG_HTC_PASIC3 is not set
-# CONFIG_HTC_I2CPLD is not set
-# CONFIG_MFD_KEMPLD is not set
-# CONFIG_MFD_88PM800 is not set
-# CONFIG_MFD_88PM805 is not set
-# CONFIG_MFD_88PM860X is not set
-# CONFIG_MFD_MAX14577 is not set
-# CONFIG_MFD_MAX77620 is not set
-# CONFIG_MFD_MAX77686 is not set
-# CONFIG_MFD_MAX77693 is not set
-# CONFIG_MFD_MAX77843 is not set
-# CONFIG_MFD_MAX8907 is not set
-# CONFIG_MFD_MAX8925 is not set
-# CONFIG_MFD_MAX8997 is not set
-# CONFIG_MFD_MAX8998 is not set
-# CONFIG_MFD_MT6397 is not set
-# CONFIG_MFD_MENF21BMC is not set
-# CONFIG_EZX_PCAP is not set
-# CONFIG_MFD_CPCAP is not set
-# CONFIG_MFD_VIPERBOARD is not set
-# CONFIG_MFD_RETU is not set
-# CONFIG_MFD_PCF50633 is not set
-# CONFIG_MFD_PM8XXX is not set
-# CONFIG_MFD_RT5033 is not set
-# CONFIG_MFD_RTSX_USB is not set
-# CONFIG_MFD_RC5T583 is not set
-# CONFIG_MFD_RK808 is not set
-# CONFIG_MFD_RN5T618 is not set
-# CONFIG_MFD_SEC_CORE is not set
-# CONFIG_MFD_SI476X_CORE is not set
-# CONFIG_MFD_SM501 is not set
-# CONFIG_MFD_SKY81452 is not set
-# CONFIG_MFD_SMSC is not set
-# CONFIG_ABX500_CORE is not set
-# CONFIG_MFD_STMPE is not set
-CONFIG_MFD_SUN6I_PRCM=y
-CONFIG_MFD_SYSCON=y
-# CONFIG_MFD_TI_AM335X_TSCADC is not set
-# CONFIG_MFD_LP3943 is not set
-# CONFIG_MFD_LP8788 is not set
-# CONFIG_MFD_TI_LMU is not set
-# CONFIG_MFD_PALMAS is not set
-# CONFIG_TPS6105X is not set
-# CONFIG_TPS65010 is not set
-# CONFIG_TPS6507X is not set
-# CONFIG_MFD_TPS65086 is not set
-# CONFIG_MFD_TPS65090 is not set
-# CONFIG_MFD_TPS65217 is not set
-# CONFIG_MFD_TI_LP873X is not set
-# CONFIG_MFD_TI_LP87565 is not set
-# CONFIG_MFD_TPS65218 is not set
-# CONFIG_MFD_TPS6586X is not set
-# CONFIG_MFD_TPS65910 is not set
-# CONFIG_MFD_TPS65912_I2C is not set
-# CONFIG_MFD_TPS65912_SPI is not set
-# CONFIG_MFD_TPS80031 is not set
-# CONFIG_TWL4030_CORE is not set
-# CONFIG_TWL6040_CORE is not set
-# CONFIG_MFD_WL1273_CORE is not set
-# CONFIG_MFD_LM3533 is not set
-# CONFIG_MFD_TC3589X is not set
-# CONFIG_MFD_TMIO is not set
-# CONFIG_MFD_T7L66XB is not set
-# CONFIG_MFD_TC6387XB is not set
-# CONFIG_MFD_TC6393XB is not set
-# CONFIG_MFD_ARIZONA_I2C is not set
-# CONFIG_MFD_ARIZONA_SPI is not set
-# CONFIG_MFD_WM8400 is not set
-# CONFIG_MFD_WM831X_I2C is not set
-# CONFIG_MFD_WM831X_SPI is not set
-# CONFIG_MFD_WM8350_I2C is not set
-# CONFIG_MFD_WM8994 is not set
 CONFIG_REGULATOR=y
-# CONFIG_REGULATOR_DEBUG is not set
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
-# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
-# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
-# CONFIG_REGULATOR_ACT8865 is not set
-# CONFIG_REGULATOR_AD5398 is not set
-# CONFIG_REGULATOR_ANATOP is not set
-# CONFIG_REGULATOR_DA9210 is not set
-# CONFIG_REGULATOR_DA9211 is not set
-# CONFIG_REGULATOR_FAN53555 is not set
 CONFIG_REGULATOR_GPIO=y
-# CONFIG_REGULATOR_ISL9305 is not set
-# CONFIG_REGULATOR_ISL6271A is not set
-# CONFIG_REGULATOR_LP3971 is not set
-# CONFIG_REGULATOR_LP3972 is not set
-# CONFIG_REGULATOR_LP872X is not set
-# CONFIG_REGULATOR_LP8755 is not set
-# CONFIG_REGULATOR_LTC3589 is not set
-# CONFIG_REGULATOR_LTC3676 is not set
-# CONFIG_REGULATOR_MAX1586 is not set
-# CONFIG_REGULATOR_MAX8649 is not set
-# CONFIG_REGULATOR_MAX8660 is not set
-# CONFIG_REGULATOR_MAX8952 is not set
-# CONFIG_REGULATOR_MT6311 is not set
-# CONFIG_REGULATOR_PFUZE100 is not set
-# CONFIG_REGULATOR_PV88060 is not set
-# CONFIG_REGULATOR_PV88080 is not set
-# CONFIG_REGULATOR_PV88090 is not set
-# CONFIG_REGULATOR_TPS51632 is not set
-# CONFIG_REGULATOR_TPS62360 is not set
-# CONFIG_REGULATOR_TPS65023 is not set
-# CONFIG_REGULATOR_TPS6507X is not set
-# CONFIG_REGULATOR_TPS65132 is not set
-# CONFIG_REGULATOR_TPS6524X is not set
-# CONFIG_REGULATOR_VCTRL is not set
-# CONFIG_MEDIA_SUPPORT is not set
-
-#
-# Graphics support
-#
-# CONFIG_IMX_IPUV3_CORE is not set
-# CONFIG_DRM is not set
-
-#
-# ACP (Audio CoProcessor) Configuration
-#
-# CONFIG_DRM_LIB_RANDOM is not set
-
-#
-# Frame buffer Devices
-#
 CONFIG_FB=y
-# CONFIG_FIRMWARE_EDID is not set
-CONFIG_FB_CMDLINE=y
-CONFIG_FB_NOTIFY=y
-# CONFIG_FB_DDC is not set
-# CONFIG_FB_BOOT_VESA_SUPPORT is not set
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-# CONFIG_FB_SYS_FILLRECT is not set
-# CONFIG_FB_SYS_COPYAREA is not set
-# CONFIG_FB_SYS_IMAGEBLIT is not set
-# CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
-# CONFIG_FB_FOREIGN_ENDIAN is not set
-# CONFIG_FB_SYS_FOPS is not set
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
-# CONFIG_FB_MODE_HELPERS is not set
-# CONFIG_FB_TILEBLITTING is not set
-
-#
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_OPENCORES is not set
-# CONFIG_FB_S1D13XXX is not set
-# CONFIG_FB_SMSCUFX is not set
-# CONFIG_FB_UDL is not set
-# CONFIG_FB_IBM_GXT4500 is not set
-# CONFIG_FB_VIRTUAL is not set
-# CONFIG_FB_METRONOME is not set
-# CONFIG_FB_BROADSHEET is not set
-# CONFIG_FB_AUO_K190X is not set
 CONFIG_FB_SIMPLE=y
-# CONFIG_FB_SSD1307 is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
-# CONFIG_VGASTATE is not set
-
-#
-# Console display driver support
-#
-CONFIG_DUMMY_CONSOLE=y
-# CONFIG_FRAMEBUFFER_CONSOLE is not set
-# CONFIG_LOGO is not set
-# CONFIG_SOUND is not set
-
-#
-# HID support
-#
-CONFIG_HID=y
-# CONFIG_HID_BATTERY_STRENGTH is not set
-# CONFIG_HIDRAW is not set
-# CONFIG_UHID is not set
-CONFIG_HID_GENERIC=y
-
-#
-# Special HID drivers
-#
-CONFIG_HID_A4TECH=y
-# CONFIG_HID_ACCUTOUCH is not set
-# CONFIG_HID_ACRUX is not set
-CONFIG_HID_APPLE=y
-# CONFIG_HID_APPLEIR is not set
-# CONFIG_HID_ASUS is not set
-# CONFIG_HID_AUREAL is not set
-CONFIG_HID_BELKIN=y
-# CONFIG_HID_BETOP_FF is not set
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-# CONFIG_HID_CORSAIR is not set
-# CONFIG_HID_CMEDIA is not set
-# CONFIG_HID_CP2112 is not set
-CONFIG_HID_CYPRESS=y
-# CONFIG_HID_DRAGONRISE is not set
-# CONFIG_HID_EMS_FF is not set
-# CONFIG_HID_ELECOM is not set
-# CONFIG_HID_ELO is not set
-CONFIG_HID_EZKEY=y
-# CONFIG_HID_GEMBIRD is not set
-# CONFIG_HID_GFRM is not set
-# CONFIG_HID_HOLTEK is not set
-# CONFIG_HID_GT683R is not set
-# CONFIG_HID_KEYTOUCH is not set
-# CONFIG_HID_KYE is not set
-# CONFIG_HID_UCLOGIC is not set
-# CONFIG_HID_WALTOP is not set
-# CONFIG_HID_GYRATION is not set
-# CONFIG_HID_ICADE is not set
-CONFIG_HID_ITE=y
-# CONFIG_HID_TWINHAN is not set
-CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_LCPOWER is not set
-# CONFIG_HID_LED is not set
-# CONFIG_HID_LENOVO is not set
-CONFIG_HID_LOGITECH=y
-# CONFIG_HID_LOGITECH_HIDPP is not set
-# CONFIG_LOGITECH_FF is not set
-# CONFIG_LOGIRUMBLEPAD2_FF is not set
-# CONFIG_LOGIG940_FF is not set
-# CONFIG_LOGIWHEELS_FF is not set
-# CONFIG_HID_MAGICMOUSE is not set
-# CONFIG_HID_MAYFLASH is not set
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-# CONFIG_HID_MULTITOUCH is not set
-# CONFIG_HID_NTI is not set
-# CONFIG_HID_NTRIG is not set
-# CONFIG_HID_ORTEK is not set
-# CONFIG_HID_PANTHERLORD is not set
-# CONFIG_HID_PENMOUNT is not set
-# CONFIG_HID_PETALYNX is not set
-# CONFIG_HID_PICOLCD is not set
 CONFIG_HID_PLANTRONICS=y
-# CONFIG_HID_PRIMAX is not set
-# CONFIG_HID_RETRODE is not set
-# CONFIG_HID_ROCCAT is not set
-# CONFIG_HID_SAITEK is not set
-# CONFIG_HID_SAMSUNG is not set
-# CONFIG_HID_SONY is not set
-# CONFIG_HID_SPEEDLINK is not set
-# CONFIG_HID_STEELSERIES is not set
-# CONFIG_HID_SUNPLUS is not set
-# CONFIG_HID_RMI is not set
-# CONFIG_HID_GREENASIA is not set
-# CONFIG_HID_SMARTJOYPLUS is not set
-# CONFIG_HID_TIVO is not set
-# CONFIG_HID_TOPSEED is not set
-# CONFIG_HID_THINGM is not set
-# CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_UDRAW_PS3 is not set
-# CONFIG_HID_WACOM is not set
-# CONFIG_HID_WIIMOTE is not set
-# CONFIG_HID_XINMO is not set
-# CONFIG_HID_ZEROPLUS is not set
-# CONFIG_HID_ZYDACRON is not set
-# CONFIG_HID_SENSOR_HUB is not set
-# CONFIG_HID_ALPS is not set
-
-#
-# USB HID support
-#
-CONFIG_USB_HID=y
-# CONFIG_HID_PID is not set
-# CONFIG_USB_HIDDEV is not set
-
-#
-# I2C HID support
-#
-# CONFIG_I2C_HID is not set
-CONFIG_USB_OHCI_LITTLE_ENDIAN=y
-CONFIG_USB_SUPPORT=y
-CONFIG_USB_COMMON=y
-CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB=y
-# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_DEFAULT_PERSIST=y
-# CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_OTG is not set
-# CONFIG_USB_OTG_WHITELIST is not set
-# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
-# CONFIG_USB_MON is not set
-# CONFIG_USB_WUSB_CBAF is not set
-
-#
-# USB Host Controller Drivers
-#
-# CONFIG_USB_C67X00_HCD is not set
-# CONFIG_USB_XHCI_HCD is not set
 CONFIG_USB_EHCI_HCD=y
-# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
-CONFIG_USB_EHCI_TT_NEWSCHED=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
-# CONFIG_USB_OXU210HP_HCD is not set
-# CONFIG_USB_ISP116X_HCD is not set
-# CONFIG_USB_ISP1362_HCD is not set
-# CONFIG_USB_FOTG210_HCD is not set
-# CONFIG_USB_MAX3421_HCD is not set
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
-# CONFIG_USB_SL811_HCD is not set
-# CONFIG_USB_R8A66597_HCD is not set
-# CONFIG_USB_HCD_TEST_MODE is not set
-
-#
-# USB Device Class drivers
-#
-# CONFIG_USB_ACM is not set
-# CONFIG_USB_PRINTER is not set
-# CONFIG_USB_WDM is not set
-# CONFIG_USB_TMC is not set
-
-#
-# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
-#
-
-#
-# also be needed; see USB_STORAGE Help for more info
-#
-# CONFIG_USB_STORAGE is not set
-
-#
-# USB Imaging devices
-#
-# CONFIG_USB_MDC800 is not set
-# CONFIG_USB_MICROTEK is not set
-# CONFIG_USBIP_CORE is not set
-# CONFIG_USB_MUSB_HDRC is not set
-# CONFIG_USB_DWC3 is not set
-# CONFIG_USB_DWC2 is not set
-# CONFIG_USB_CHIPIDEA is not set
-# CONFIG_USB_ISP1760 is not set
-
-#
-# USB port drivers
-#
-# CONFIG_USB_SERIAL is not set
-
-#
-# USB Miscellaneous drivers
-#
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_SEVSEG is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_SISUSBVGA is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_EHSET_TEST_FIXTURE is not set
-# CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_YUREX is not set
-# CONFIG_USB_EZUSB_FX2 is not set
-# CONFIG_USB_HUB_USB251XB is not set
-# CONFIG_USB_HSIC_USB3503 is not set
-# CONFIG_USB_HSIC_USB4604 is not set
-# CONFIG_USB_LINK_LAYER_TEST is not set
-
-#
-# USB Physical Layer drivers
-#
-# CONFIG_USB_PHY is not set
-# CONFIG_NOP_USB_XCEIV is not set
-# CONFIG_USB_GPIO_VBUS is not set
-# CONFIG_USB_ISP1301 is not set
-# CONFIG_USB_ULPI is not set
-# CONFIG_USB_GADGET is not set
-
-#
-# USB Power Delivery and Type-C drivers
-#
-# CONFIG_TYPEC_UCSI is not set
-# CONFIG_USB_LED_TRIG is not set
-# CONFIG_USB_ULPI_BUS is not set
-# CONFIG_UWB is not set
 CONFIG_MMC=y
-# CONFIG_MMC_DEBUG is not set
-CONFIG_PWRSEQ_EMMC=y
-CONFIG_PWRSEQ_SIMPLE=y
-CONFIG_MMC_BLOCK=y
-CONFIG_MMC_BLOCK_MINORS=8
-# CONFIG_SDIO_UART is not set
-# CONFIG_MMC_TEST is not set
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-# CONFIG_MMC_SDHCI is not set
-# CONFIG_MMC_DW is not set
-# CONFIG_MMC_VUB300 is not set
-# CONFIG_MMC_USHC is not set
-# CONFIG_MMC_USDHI6ROL0 is not set
 CONFIG_MMC_SUNXI=y
-# CONFIG_MMC_MTK is not set
-# CONFIG_MEMSTICK is not set
-CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
-# CONFIG_LEDS_CLASS_FLASH is not set
-# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
-
-#
-# LED drivers
-#
-# CONFIG_LEDS_BCM6328 is not set
-# CONFIG_LEDS_BCM6358 is not set
-# CONFIG_LEDS_LM3530 is not set
-# CONFIG_LEDS_LM3642 is not set
-# CONFIG_LEDS_PCA9532 is not set
 CONFIG_LEDS_GPIO=y
-# CONFIG_LEDS_LP3944 is not set
-# CONFIG_LEDS_LP3952 is not set
-# CONFIG_LEDS_LP5521 is not set
-# CONFIG_LEDS_LP5523 is not set
-# CONFIG_LEDS_LP5562 is not set
-# CONFIG_LEDS_LP8501 is not set
-# CONFIG_LEDS_LP8860 is not set
-# CONFIG_LEDS_PCA955X is not set
-# CONFIG_LEDS_PCA963X is not set
-# CONFIG_LEDS_DAC124S085 is not set
-# CONFIG_LEDS_REGULATOR is not set
-# CONFIG_LEDS_BD2802 is not set
-# CONFIG_LEDS_LT3593 is not set
-# CONFIG_LEDS_TCA6507 is not set
-# CONFIG_LEDS_TLC591XX is not set
-# CONFIG_LEDS_LM355x is not set
-# CONFIG_LEDS_IS31FL319X is not set
-# CONFIG_LEDS_IS31FL32XX is not set
-
-#
-# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
-#
-# CONFIG_LEDS_BLINKM is not set
-# CONFIG_LEDS_SYSCON is not set
-# CONFIG_LEDS_USER is not set
-
-#
-# LED Triggers
-#
-CONFIG_LEDS_TRIGGERS=y
-# CONFIG_LEDS_TRIGGER_TIMER is not set
-# CONFIG_LEDS_TRIGGER_ONESHOT is not set
-# CONFIG_LEDS_TRIGGER_DISK is not set
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
-# CONFIG_LEDS_TRIGGER_CPU is not set
-# CONFIG_LEDS_TRIGGER_GPIO is not set
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-
-#
-# iptables trigger is under Netfilter config (LED target)
-#
-# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
-# CONFIG_LEDS_TRIGGER_CAMERA is not set
-# CONFIG_LEDS_TRIGGER_PANIC is not set
-# CONFIG_ACCESSIBILITY is not set
-CONFIG_EDAC_ATOMIC_SCRUB=y
-CONFIG_EDAC_SUPPORT=y
-CONFIG_RTC_LIB=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
-CONFIG_RTC_SYSTOHC=y
-CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
-# CONFIG_RTC_DEBUG is not set
-CONFIG_RTC_NVMEM=y
-
-#
-# RTC interfaces
-#
 # CONFIG_RTC_INTF_SYSFS is not set
 # CONFIG_RTC_INTF_PROC is not set
-CONFIG_RTC_INTF_DEV=y
-# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
-# CONFIG_RTC_DRV_TEST is not set
-
-#
-# I2C RTC drivers
-#
-# CONFIG_RTC_DRV_ABB5ZES3 is not set
-# CONFIG_RTC_DRV_ABX80X is not set
-# CONFIG_RTC_DRV_DS1307 is not set
-# CONFIG_RTC_DRV_DS1374 is not set
-# CONFIG_RTC_DRV_DS1672 is not set
-# CONFIG_RTC_DRV_HYM8563 is not set
-# CONFIG_RTC_DRV_MAX6900 is not set
-# CONFIG_RTC_DRV_RS5C372 is not set
-# CONFIG_RTC_DRV_ISL1208 is not set
-# CONFIG_RTC_DRV_ISL12022 is not set
-# CONFIG_RTC_DRV_X1205 is not set
-# CONFIG_RTC_DRV_PCF8523 is not set
-# CONFIG_RTC_DRV_PCF85063 is not set
-# CONFIG_RTC_DRV_PCF8563 is not set
-# CONFIG_RTC_DRV_PCF8583 is not set
-# CONFIG_RTC_DRV_M41T80 is not set
-# CONFIG_RTC_DRV_BQ32K is not set
-# CONFIG_RTC_DRV_S35390A is not set
-# CONFIG_RTC_DRV_FM3130 is not set
-# CONFIG_RTC_DRV_RX8010 is not set
-# CONFIG_RTC_DRV_RX8581 is not set
-# CONFIG_RTC_DRV_RX8025 is not set
-# CONFIG_RTC_DRV_EM3027 is not set
-# CONFIG_RTC_DRV_RV8803 is not set
-
-#
-# SPI RTC drivers
-#
-# CONFIG_RTC_DRV_M41T93 is not set
-# CONFIG_RTC_DRV_M41T94 is not set
-# CONFIG_RTC_DRV_DS1302 is not set
-# CONFIG_RTC_DRV_DS1305 is not set
-# CONFIG_RTC_DRV_DS1343 is not set
-# CONFIG_RTC_DRV_DS1347 is not set
-# CONFIG_RTC_DRV_DS1390 is not set
-# CONFIG_RTC_DRV_MAX6916 is not set
-# CONFIG_RTC_DRV_R9701 is not set
-# CONFIG_RTC_DRV_RX4581 is not set
-# CONFIG_RTC_DRV_RX6110 is not set
-# CONFIG_RTC_DRV_RS5C348 is not set
-# CONFIG_RTC_DRV_MAX6902 is not set
-# CONFIG_RTC_DRV_PCF2123 is not set
-# CONFIG_RTC_DRV_MCP795 is not set
-CONFIG_RTC_I2C_AND_SPI=y
-
-#
-# SPI and I2C RTC drivers
-#
-# CONFIG_RTC_DRV_DS3232 is not set
-# CONFIG_RTC_DRV_PCF2127 is not set
-# CONFIG_RTC_DRV_RV3029C2 is not set
-
-#
-# Platform RTC drivers
-#
-# CONFIG_RTC_DRV_CMOS is not set
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1685_FAMILY is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_DS2404 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_MSM6242 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_RP5C01 is not set
-# CONFIG_RTC_DRV_V3020 is not set
-# CONFIG_RTC_DRV_ZYNQMP is not set
-
-#
-# on-CPU RTC drivers
-#
-# CONFIG_RTC_DRV_SUN6I is not set
 CONFIG_RTC_DRV_SUNXI=y
-# CONFIG_RTC_DRV_FTRTC010 is not set
-# CONFIG_RTC_DRV_SNVS is not set
-# CONFIG_RTC_DRV_R7301 is not set
-
-#
-# HID Sensor RTC drivers
-#
-# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
-# CONFIG_DMADEVICES is not set
-
-#
-# DMABUF options
-#
-# CONFIG_SYNC_FILE is not set
-# CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
-# CONFIG_VIRT_DRIVERS is not set
-
-#
-# Virtio drivers
-#
-# CONFIG_VIRTIO_MMIO is not set
-
-#
-# Microsoft Hyper-V guest support
-#
-# CONFIG_HYPERV_TSCPAGE is not set
-# CONFIG_STAGING is not set
-# CONFIG_GOLDFISH is not set
-# CONFIG_CHROME_PLATFORMS is not set
-CONFIG_CLKDEV_LOOKUP=y
-CONFIG_HAVE_CLK_PREPARE=y
-CONFIG_COMMON_CLK=y
-
-#
-# Common Clock Framework
-#
-# CONFIG_COMMON_CLK_SI5351 is not set
-# CONFIG_COMMON_CLK_SI514 is not set
-# CONFIG_COMMON_CLK_SI570 is not set
-# CONFIG_COMMON_CLK_CDCE706 is not set
-# CONFIG_COMMON_CLK_CDCE925 is not set
-# CONFIG_COMMON_CLK_CS2000_CP is not set
-# CONFIG_CLK_QORIQ is not set
-# CONFIG_COMMON_CLK_NXP is not set
-# CONFIG_COMMON_CLK_PXA is not set
-# CONFIG_COMMON_CLK_PIC32 is not set
-# CONFIG_COMMON_CLK_VC5 is not set
-CONFIG_SUNXI_CCU=y
-# CONFIG_SUN8I_A83T_CCU is not set
-# CONFIG_SUN8I_DE2_CCU is not set
-# CONFIG_SUN8I_R_CCU is not set
-# CONFIG_HWSPINLOCK is not set
-
-#
-# Clock Source drivers
-#
-CONFIG_TIMER_OF=y
-CONFIG_TIMER_PROBE=y
-CONFIG_CLKSRC_MMIO=y
-CONFIG_SUN4I_TIMER=y
-CONFIG_SUN5I_HSTIMER=y
-CONFIG_ARM_ARCH_TIMER=y
-CONFIG_ARM_ARCH_TIMER_EVTSTREAM=y
-# CONFIG_ARM_TIMER_SP804 is not set
-# CONFIG_ATMEL_PIT is not set
-# CONFIG_SH_TIMER_CMT is not set
-# CONFIG_SH_TIMER_MTU2 is not set
-# CONFIG_SH_TIMER_TMU is not set
-# CONFIG_EM_TIMER_STI is not set
-# CONFIG_MAILBOX is not set
 # CONFIG_IOMMU_SUPPORT is not set
-
-#
-# Remoteproc drivers
-#
-# CONFIG_REMOTEPROC is not set
-
-#
-# Rpmsg drivers
-#
-
-#
-# SOC (System On Chip) specific Drivers
-#
-
-#
-# Broadcom SoC drivers
-#
-# CONFIG_SOC_BRCMSTB is not set
-
-#
-# i.MX SoC drivers
-#
-CONFIG_SUNXI_SRAM=y
-# CONFIG_SOC_TI is not set
-# CONFIG_PM_DEVFREQ is not set
-# CONFIG_EXTCON is not set
-# CONFIG_MEMORY is not set
-# CONFIG_IIO is not set
-# CONFIG_PWM is not set
-CONFIG_IRQCHIP=y
-CONFIG_ARM_GIC=y
-CONFIG_ARM_GIC_MAX_NR=1
-# CONFIG_IPACK_BUS is not set
-CONFIG_ARCH_HAS_RESET_CONTROLLER=y
-CONFIG_RESET_CONTROLLER=y
-# CONFIG_RESET_ATH79 is not set
-# CONFIG_RESET_BERLIN is not set
-# CONFIG_RESET_GEMINI is not set
-# CONFIG_RESET_IMX7 is not set
-# CONFIG_RESET_LPC18XX is not set
-# CONFIG_RESET_MESON is not set
-# CONFIG_RESET_PISTACHIO is not set
-# CONFIG_RESET_SOCFPGA is not set
-# CONFIG_RESET_STM32 is not set
-CONFIG_RESET_SUNXI=y
-# CONFIG_RESET_TI_SYSCON is not set
-# CONFIG_RESET_ZYNQ is not set
-# CONFIG_RESET_TEGRA_BPMP is not set
-# CONFIG_FMC is not set
-
-#
-# PHY Subsystem
-#
 CONFIG_GENERIC_PHY=y
-# CONFIG_PHY_SUN9I_USB is not set
-# CONFIG_BCM_KONA_USB2_PHY is not set
-# CONFIG_PHY_PXA_28NM_HSIC is not set
-# CONFIG_PHY_PXA_28NM_USB2 is not set
-# CONFIG_POWERCAP is not set
-# CONFIG_MCB is not set
-
-#
-# Performance monitor support
-#
-CONFIG_ARM_PMU=y
-# CONFIG_RAS is not set
-
-#
-# Android
-#
-# CONFIG_ANDROID is not set
-# CONFIG_DAX is not set
-CONFIG_NVMEM=y
-# CONFIG_NVMEM_SUNXI_SID is not set
-# CONFIG_STM is not set
-# CONFIG_INTEL_TH is not set
-
-#
-# FPGA Configuration Support
-#
-# CONFIG_FPGA is not set
-
-#
-# FSI support
-#
-# CONFIG_FSI is not set
-# CONFIG_TEE is not set
-
-#
-# Firmware Drivers
-#
-CONFIG_ARM_PSCI_FW=y
-# CONFIG_ARM_PSCI_CHECKER is not set
-# CONFIG_FIRMWARE_MEMMAP is not set
-# CONFIG_FW_CFG_SYSFS is not set
-CONFIG_HAVE_ARM_SMCCC=y
-# CONFIG_GOOGLE_FIRMWARE is not set
-
-#
-# Tegra firmware driver
-#
-
-#
-# File systems
-#
-CONFIG_DCACHE_WORD_ACCESS=y
-# CONFIG_EXT2_FS is not set
-# CONFIG_EXT3_FS is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_USE_FOR_EXT2=y
-# CONFIG_EXT4_FS_POSIX_ACL is not set
-# CONFIG_EXT4_FS_SECURITY is not set
-# CONFIG_EXT4_ENCRYPTION is not set
-# CONFIG_EXT4_DEBUG is not set
-CONFIG_JBD2=y
-# CONFIG_JBD2_DEBUG is not set
-CONFIG_FS_MBCACHE=y
-# CONFIG_REISERFS_FS is not set
-# CONFIG_JFS_FS is not set
-# CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
-# CONFIG_BTRFS_FS is not set
-# CONFIG_NILFS2_FS is not set
-# CONFIG_F2FS_FS is not set
-CONFIG_FS_POSIX_ACL=y
-CONFIG_EXPORTFS=y
-# CONFIG_EXPORTFS_BLOCK_OPS is not set
-CONFIG_FILE_LOCKING=y
-CONFIG_MANDATORY_FILE_LOCKING=y
-# CONFIG_FS_ENCRYPTION is not set
-CONFIG_FSNOTIFY=y
-CONFIG_DNOTIFY=y
-CONFIG_INOTIFY_USER=y
-# CONFIG_FANOTIFY is not set
-# CONFIG_QUOTA is not set
-# CONFIG_QUOTACTL is not set
-# CONFIG_AUTOFS4_FS is not set
-# CONFIG_FUSE_FS is not set
-# CONFIG_OVERLAY_FS is not set
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# CD-ROM/DVD Filesystems
-#
-# CONFIG_ISO9660_FS is not set
-# CONFIG_UDF_FS is not set
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_FS=y
-# CONFIG_MSDOS_FS is not set
 CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_CODEPAGE=437
-CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
-# CONFIG_FAT_DEFAULT_UTF8 is not set
-# CONFIG_NTFS_FS is not set
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_FS=y
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-# CONFIG_PROC_CHILDREN is not set
-CONFIG_KERNFS=y
-CONFIG_SYSFS=y
 CONFIG_TMPFS=y
-# CONFIG_TMPFS_POSIX_ACL is not set
-# CONFIG_TMPFS_XATTR is not set
-# CONFIG_HUGETLB_PAGE is not set
-# CONFIG_CONFIGFS_FS is not set
-CONFIG_MISC_FILESYSTEMS=y
-# CONFIG_ORANGEFS_FS is not set
-# CONFIG_ADFS_FS is not set
-# CONFIG_AFFS_FS is not set
-# CONFIG_ECRYPT_FS is not set
-# CONFIG_HFS_FS is not set
-# CONFIG_HFSPLUS_FS is not set
-# CONFIG_BEFS_FS is not set
-# CONFIG_BFS_FS is not set
-# CONFIG_EFS_FS is not set
-# CONFIG_CRAMFS is not set
-# CONFIG_SQUASHFS is not set
-# CONFIG_VXFS_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_OMFS_FS is not set
-# CONFIG_HPFS_FS is not set
-# CONFIG_QNX4FS_FS is not set
-# CONFIG_QNX6FS_FS is not set
-# CONFIG_ROMFS_FS is not set
-# CONFIG_PSTORE is not set
-# CONFIG_SYSV_FS is not set
-# CONFIG_UFS_FS is not set
-CONFIG_NETWORK_FILESYSTEMS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V2=y
-CONFIG_NFS_V3=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-# CONFIG_NFS_SWAP is not set
-# CONFIG_NFS_V4_1 is not set
 CONFIG_ROOT_NFS=y
-# CONFIG_NFS_USE_LEGACY_DNS is not set
-CONFIG_NFS_USE_KERNEL_DNS=y
-# CONFIG_NFSD is not set
-CONFIG_GRACE_PERIOD=y
-CONFIG_LOCKD=y
-CONFIG_LOCKD_V4=y
-CONFIG_NFS_ACL_SUPPORT=y
-CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=y
-CONFIG_SUNRPC_GSS=y
-# CONFIG_SUNRPC_DEBUG is not set
-# CONFIG_CEPH_FS is not set
-# CONFIG_CIFS is not set
-# CONFIG_NCP_FS is not set
-# CONFIG_CODA_FS is not set
-# CONFIG_AFS_FS is not set
-CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="iso8859-1"
 CONFIG_NLS_CODEPAGE_437=y
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_CODEPAGE_852 is not set
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-# CONFIG_NLS_CODEPAGE_936 is not set
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
-# CONFIG_NLS_CODEPAGE_1250 is not set
-# CONFIG_NLS_CODEPAGE_1251 is not set
-# CONFIG_NLS_ASCII is not set
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
-# CONFIG_NLS_MAC_ROMAN is not set
-# CONFIG_NLS_MAC_CELTIC is not set
-# CONFIG_NLS_MAC_CENTEURO is not set
-# CONFIG_NLS_MAC_CROATIAN is not set
-# CONFIG_NLS_MAC_CYRILLIC is not set
-# CONFIG_NLS_MAC_GAELIC is not set
-# CONFIG_NLS_MAC_GREEK is not set
-# CONFIG_NLS_MAC_ICELAND is not set
-# CONFIG_NLS_MAC_INUIT is not set
-# CONFIG_NLS_MAC_ROMANIAN is not set
-# CONFIG_NLS_MAC_TURKISH is not set
-# CONFIG_NLS_UTF8 is not set
-
-#
-# Kernel hacking
-#
-
-#
-# printk and dmesg options
-#
+CONFIG_CRYPTO_SEQIV=y
+CONFIG_CRYPTO_ECHAINIV=m
+CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_PRINTK_TIME=y
-CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
-CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
-# CONFIG_BOOT_PRINTK_DELAY is not set
-# CONFIG_DYNAMIC_DEBUG is not set
-
-#
-# Compile-time checks and compiler options
-#
-# CONFIG_DEBUG_INFO is not set
-CONFIG_ENABLE_WARN_DEPRECATED=y
-CONFIG_ENABLE_MUST_CHECK=y
-CONFIG_FRAME_WARN=1024
-# CONFIG_STRIP_ASM_SYMS is not set
-# CONFIG_READABLE_ASM is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_PAGE_OWNER is not set
 CONFIG_DEBUG_FS=y
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_SECTION_MISMATCH is not set
-CONFIG_SECTION_MISMATCH_WARN_ONLY=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
-CONFIG_MAGIC_SYSRQ_SERIAL=y
+CONFIG_KGDB=y
+CONFIG_KGDB_TESTS=y
 CONFIG_DEBUG_KERNEL=y
-
-#
-# Memory Debugging
-#
-# CONFIG_PAGE_EXTENSION is not set
-# CONFIG_DEBUG_PAGEALLOC is not set
-# CONFIG_PAGE_POISONING is not set
-# CONFIG_DEBUG_PAGE_REF is not set
-# CONFIG_DEBUG_RODATA_TEST is not set
-# CONFIG_DEBUG_OBJECTS is not set
-# CONFIG_SLUB_DEBUG_ON is not set
-# CONFIG_SLUB_STATS is not set
-CONFIG_HAVE_DEBUG_KMEMLEAK=y
-# CONFIG_DEBUG_KMEMLEAK is not set
-# CONFIG_DEBUG_STACK_USAGE is not set
-# CONFIG_DEBUG_VM is not set
-CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
-# CONFIG_DEBUG_VIRTUAL is not set
-CONFIG_DEBUG_MEMORY_INIT=y
-# CONFIG_DEBUG_PER_CPU_MAPS is not set
-# CONFIG_DEBUG_HIGHMEM is not set
-# CONFIG_DEBUG_SHIRQ is not set
-
-#
-# Debug Lockups and Hangs
-#
-# CONFIG_SOFTLOCKUP_DETECTOR is not set
 CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
-# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
-CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
-# CONFIG_WQ_WATCHDOG is not set
-# CONFIG_PANIC_ON_OOPS is not set
-CONFIG_PANIC_ON_OOPS_VALUE=0
-CONFIG_PANIC_TIMEOUT=0
-CONFIG_SCHED_DEBUG=y
-CONFIG_SCHED_INFO=y
 CONFIG_SCHEDSTATS=y
-# CONFIG_SCHED_STACK_END_CHECK is not set
-# CONFIG_DEBUG_TIMEKEEPING is not set
-
-#
-# Lock Debugging (spinlocks, mutexes, etc...)
-#
-CONFIG_DEBUG_RT_MUTEXES=y
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
-CONFIG_DEBUG_LOCK_ALLOC=y
 CONFIG_PROVE_LOCKING=y
-CONFIG_LOCKDEP=y
-# CONFIG_LOCK_STAT is not set
-# CONFIG_DEBUG_LOCKDEP is not set
 CONFIG_DEBUG_ATOMIC_SLEEP=y
 CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
-# CONFIG_LOCK_TORTURE_TEST is not set
-# CONFIG_WW_MUTEX_SELFTEST is not set
-CONFIG_TRACE_IRQFLAGS=y
-CONFIG_STACKTRACE=y
-# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
-# CONFIG_DEBUG_KOBJECT is not set
-CONFIG_DEBUG_BUGVERBOSE=y
-# CONFIG_DEBUG_LIST is not set
-# CONFIG_DEBUG_PI_LIST is not set
-# CONFIG_DEBUG_SG is not set
-# CONFIG_DEBUG_NOTIFIERS is not set
-# CONFIG_DEBUG_CREDENTIALS is not set
-
-#
-# RCU Debugging
-#
-CONFIG_PROVE_RCU=y
-# CONFIG_TORTURE_TEST is not set
-# CONFIG_RCU_PERF_TEST is not set
-# CONFIG_RCU_TORTURE_TEST is not set
-CONFIG_RCU_CPU_STALL_TIMEOUT=21
 # CONFIG_RCU_TRACE is not set
-# CONFIG_RCU_EQS_DEBUG is not set
-# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
-# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
-# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
-# CONFIG_NOTIFIER_ERROR_INJECTION is not set
-# CONFIG_FAULT_INJECTION is not set
-# CONFIG_LATENCYTOP is not set
-CONFIG_NOP_TRACER=y
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_TRACE_CLOCK=y
-CONFIG_RING_BUFFER=y
-CONFIG_EVENT_TRACING=y
-CONFIG_CONTEXT_SWITCH_TRACER=y
-CONFIG_TRACING=y
-CONFIG_GENERIC_TRACER=y
-CONFIG_TRACING_SUPPORT=y
-CONFIG_FTRACE=y
 CONFIG_FUNCTION_TRACER=y
-CONFIG_FUNCTION_GRAPH_TRACER=y
-# CONFIG_IRQSOFF_TRACER is not set
-# CONFIG_SCHED_TRACER is not set
-# CONFIG_HWLAT_TRACER is not set
 CONFIG_FTRACE_SYSCALLS=y
-# CONFIG_TRACER_SNAPSHOT is not set
-CONFIG_BRANCH_PROFILE_NONE=y
-# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
-# CONFIG_PROFILE_ALL_BRANCHES is not set
-# CONFIG_STACK_TRACER is not set
-# CONFIG_BLK_DEV_IO_TRACE is not set
-CONFIG_UPROBE_EVENTS=y
-CONFIG_PROBE_EVENTS=y
-CONFIG_DYNAMIC_FTRACE=y
-CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
-# CONFIG_FUNCTION_PROFILER is not set
-CONFIG_FTRACE_MCOUNT_RECORD=y
-# CONFIG_FTRACE_STARTUP_TEST is not set
-# CONFIG_TRACEPOINT_BENCHMARK is not set
-# CONFIG_RING_BUFFER_BENCHMARK is not set
-# CONFIG_RING_BUFFER_STARTUP_TEST is not set
-# CONFIG_TRACE_EVAL_MAP_FILE is not set
-CONFIG_TRACING_EVENTS_GPIO=y
-
-#
-# Runtime Testing
-#
-# CONFIG_LKDTM is not set
-# CONFIG_TEST_LIST_SORT is not set
-# CONFIG_TEST_SORT is not set
-# CONFIG_BACKTRACE_SELF_TEST is not set
-# CONFIG_RBTREE_TEST is not set
-# CONFIG_INTERVAL_TREE_TEST is not set
-# CONFIG_PERCPU_TEST is not set
-# CONFIG_ATOMIC64_SELFTEST is not set
-# CONFIG_TEST_HEXDUMP is not set
-# CONFIG_TEST_STRING_HELPERS is not set
-# CONFIG_TEST_KSTRTOX is not set
-# CONFIG_TEST_PRINTF is not set
-# CONFIG_TEST_BITMAP is not set
-# CONFIG_TEST_UUID is not set
-# CONFIG_TEST_RHASHTABLE is not set
-# CONFIG_TEST_HASH is not set
-# CONFIG_DMA_API_DEBUG is not set
-# CONFIG_TEST_LKM is not set
-# CONFIG_TEST_USER_COPY is not set
-# CONFIG_TEST_BPF is not set
-# CONFIG_TEST_FIRMWARE is not set
-# CONFIG_TEST_SYSCTL is not set
-# CONFIG_TEST_UDELAY is not set
-# CONFIG_MEMTEST is not set
-# CONFIG_TEST_STATIC_KEYS is not set
-# CONFIG_BUG_ON_DATA_CORRUPTION is not set
-# CONFIG_TEST_KMOD is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-CONFIG_KGDB=y
-CONFIG_KGDB_SERIAL_CONSOLE=y
-CONFIG_KGDB_TESTS=y
-# CONFIG_KGDB_TESTS_ON_BOOT is not set
-# CONFIG_KGDB_KDB is not set
-# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
-# CONFIG_UBSAN is not set
-CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
-# CONFIG_STRICT_DEVMEM is not set
-# CONFIG_ARM_PTDUMP is not set
-CONFIG_ARM_UNWIND=y
-CONFIG_OLD_MCOUNT=y
 CONFIG_DEBUG_USER=y
-# CONFIG_DEBUG_LL is not set
-CONFIG_DEBUG_LL_INCLUDE="mach/debug-macro.S"
-# CONFIG_DEBUG_UART_8250 is not set
-CONFIG_UNCOMPRESS_INCLUDE="debug/uncompress.h"
-# CONFIG_PID_IN_CONTEXTIDR is not set
-# CONFIG_CORESIGHT is not set
-
-#
-# Security options
-#
-CONFIG_KEYS=y
-# CONFIG_PERSISTENT_KEYRINGS is not set
-# CONFIG_BIG_KEYS is not set
-# CONFIG_ENCRYPTED_KEYS is not set
-# CONFIG_KEY_DH_OPERATIONS is not set
-# CONFIG_SECURITY_DMESG_RESTRICT is not set
-# CONFIG_SECURITY is not set
-# CONFIG_SECURITYFS is not set
-CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
-# CONFIG_HARDENED_USERCOPY is not set
-# CONFIG_STATIC_USERMODEHELPER is not set
-CONFIG_DEFAULT_SECURITY_DAC=y
-CONFIG_DEFAULT_SECURITY=""
-CONFIG_CRYPTO=y
-
-#
-# Crypto core or helper
-#
-CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD=y
-CONFIG_CRYPTO_AEAD2=y
-CONFIG_CRYPTO_BLKCIPHER=y
-CONFIG_CRYPTO_BLKCIPHER2=y
-CONFIG_CRYPTO_HASH=y
-CONFIG_CRYPTO_HASH2=y
-CONFIG_CRYPTO_RNG=y
-CONFIG_CRYPTO_RNG2=y
-CONFIG_CRYPTO_RNG_DEFAULT=y
-CONFIG_CRYPTO_AKCIPHER2=y
-CONFIG_CRYPTO_KPP2=y
-CONFIG_CRYPTO_ACOMP2=y
-# CONFIG_CRYPTO_RSA is not set
-# CONFIG_CRYPTO_DH is not set
-# CONFIG_CRYPTO_ECDH is not set
-CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_USER is not set
-CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
-CONFIG_CRYPTO_GF128MUL=y
-CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_NULL2=y
-# CONFIG_CRYPTO_PCRYPT is not set
-CONFIG_CRYPTO_WORKQUEUE=y
-# CONFIG_CRYPTO_CRYPTD is not set
-# CONFIG_CRYPTO_MCRYPTD is not set
-# CONFIG_CRYPTO_AUTHENC is not set
-# CONFIG_CRYPTO_TEST is not set
-
-#
-# Authenticated Encryption with Associated Data
-#
-CONFIG_CRYPTO_CCM=y
-CONFIG_CRYPTO_GCM=y
-# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
-CONFIG_CRYPTO_SEQIV=y
-CONFIG_CRYPTO_ECHAINIV=m
-
-#
-# Block modes
-#
-# CONFIG_CRYPTO_CBC is not set
-CONFIG_CRYPTO_CTR=y
-# CONFIG_CRYPTO_CTS is not set
-# CONFIG_CRYPTO_ECB is not set
-# CONFIG_CRYPTO_LRW is not set
-# CONFIG_CRYPTO_PCBC is not set
-# CONFIG_CRYPTO_XTS is not set
-# CONFIG_CRYPTO_KEYWRAP is not set
-
-#
-# Hash modes
-#
-CONFIG_CRYPTO_CMAC=y
-CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
-# CONFIG_CRYPTO_VMAC is not set
-
-#
-# Digest
-#
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_CRC32 is not set
-# CONFIG_CRYPTO_CRCT10DIF is not set
-CONFIG_CRYPTO_GHASH=y
-# CONFIG_CRYPTO_POLY1305 is not set
-# CONFIG_CRYPTO_MD4 is not set
-# CONFIG_CRYPTO_MD5 is not set
-# CONFIG_CRYPTO_MICHAEL_MIC is not set
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
-# CONFIG_CRYPTO_SHA1 is not set
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_SHA512 is not set
-# CONFIG_CRYPTO_SHA3 is not set
-# CONFIG_CRYPTO_TGR192 is not set
-# CONFIG_CRYPTO_WP512 is not set
-
-#
-# Ciphers
-#
-CONFIG_CRYPTO_AES=y
-# CONFIG_CRYPTO_AES_TI is not set
-# CONFIG_CRYPTO_ANUBIS is not set
-CONFIG_CRYPTO_ARC4=y
-# CONFIG_CRYPTO_BLOWFISH is not set
-# CONFIG_CRYPTO_CAMELLIA is not set
-# CONFIG_CRYPTO_CAST5 is not set
-# CONFIG_CRYPTO_CAST6 is not set
-# CONFIG_CRYPTO_DES is not set
-# CONFIG_CRYPTO_FCRYPT is not set
-# CONFIG_CRYPTO_KHAZAD is not set
-# CONFIG_CRYPTO_SALSA20 is not set
-# CONFIG_CRYPTO_CHACHA20 is not set
-# CONFIG_CRYPTO_SEED is not set
-# CONFIG_CRYPTO_SERPENT is not set
-# CONFIG_CRYPTO_TEA is not set
-# CONFIG_CRYPTO_TWOFISH is not set
-
-#
-# Compression
-#
-# CONFIG_CRYPTO_DEFLATE is not set
-# CONFIG_CRYPTO_LZO is not set
-# CONFIG_CRYPTO_842 is not set
-# CONFIG_CRYPTO_LZ4 is not set
-# CONFIG_CRYPTO_LZ4HC is not set
-
-#
-# Random Number Generation
-#
-CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_CRYPTO_DRBG_MENU=y
-CONFIG_CRYPTO_DRBG_HMAC=y
-# CONFIG_CRYPTO_DRBG_HASH is not set
-# CONFIG_CRYPTO_DRBG_CTR is not set
-CONFIG_CRYPTO_DRBG=y
-CONFIG_CRYPTO_JITTERENTROPY=y
-# CONFIG_CRYPTO_USER_API_HASH is not set
-# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
-# CONFIG_CRYPTO_USER_API_RNG is not set
-# CONFIG_CRYPTO_USER_API_AEAD is not set
-CONFIG_CRYPTO_HW=y
-# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
-# CONFIG_CRYPTO_DEV_SUN4I_SS is not set
-# CONFIG_ASYMMETRIC_KEY_TYPE is not set
-
-#
-# Certificates for signature checking
-#
-# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
-# CONFIG_ARM_CRYPTO is not set
-CONFIG_BINARY_PRINTF=y
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-CONFIG_HAVE_ARCH_BITREVERSE=y
-CONFIG_RATIONAL=y
-CONFIG_GENERIC_STRNCPY_FROM_USER=y
-CONFIG_GENERIC_STRNLEN_USER=y
-CONFIG_GENERIC_NET_UTILS=y
-CONFIG_GENERIC_PCI_IOMAP=y
-CONFIG_GENERIC_IO=y
-CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
-# CONFIG_CRC_CCITT is not set
-CONFIG_CRC16=y
-# CONFIG_CRC_T10DIF is not set
-# CONFIG_CRC_ITU_T is not set
-CONFIG_CRC32=y
-# CONFIG_CRC32_SELFTEST is not set
-CONFIG_CRC32_SLICEBY8=y
-# CONFIG_CRC32_SLICEBY4 is not set
-# CONFIG_CRC32_SARWATE is not set
-# CONFIG_CRC32_BIT is not set
-# CONFIG_CRC4 is not set
-# CONFIG_CRC7 is not set
-# CONFIG_LIBCRC32C is not set
-# CONFIG_CRC8 is not set
-# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
-# CONFIG_RANDOM32_SELFTEST is not set
-CONFIG_ZLIB_INFLATE=y
-CONFIG_LZO_DECOMPRESS=y
-CONFIG_LZ4_DECOMPRESS=y
-CONFIG_XZ_DEC=y
-CONFIG_XZ_DEC_X86=y
-CONFIG_XZ_DEC_POWERPC=y
-CONFIG_XZ_DEC_IA64=y
-CONFIG_XZ_DEC_ARM=y
-CONFIG_XZ_DEC_ARMTHUMB=y
-CONFIG_XZ_DEC_SPARC=y
-CONFIG_XZ_DEC_BCJ=y
-# CONFIG_XZ_DEC_TEST is not set
-CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_XZ=y
-CONFIG_DECOMPRESS_LZO=y
-CONFIG_DECOMPRESS_LZ4=y
-CONFIG_GENERIC_ALLOCATOR=y
-CONFIG_ASSOCIATIVE_ARRAY=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT_MAP=y
-CONFIG_HAS_DMA=y
-# CONFIG_DMA_NOOP_OPS is not set
-# CONFIG_DMA_VIRT_OPS is not set
-CONFIG_CPU_RMAP=y
-CONFIG_DQL=y
-CONFIG_GLOB=y
-# CONFIG_GLOB_SELFTEST is not set
-CONFIG_NLATTR=y
-# CONFIG_CORDIC is not set
-# CONFIG_DDR is not set
-# CONFIG_IRQ_POLL is not set
-CONFIG_LIBFDT=y
-CONFIG_OID_REGISTRY=y
-# CONFIG_SG_SPLIT is not set
-CONFIG_SG_POOL=y
-CONFIG_ARCH_HAS_SG_CHAIN=y
-CONFIG_SBITMAP=y
-CONFIG_VIRTUALIZATION=y
-# CONFIG_VHOST_NET is not set
-# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
diff --git a/ci/kernel-config-x86 b/ci/kernel-config-x86
index 9f1972d0..167cb8ed 100644
--- a/ci/kernel-config-x86
+++ b/ci/kernel-config-x86
@@ -1,836 +1,73 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Linux/x86_64 4.13.0 Kernel Configuration
-#
-CONFIG_64BIT=y
-CONFIG_X86_64=y
-CONFIG_X86=y
-CONFIG_INSTRUCTION_DECODER=y
-CONFIG_OUTPUT_FORMAT="elf64-x86-64"
-CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_MMU=y
-CONFIG_ARCH_MMAP_RND_BITS_MIN=28
-CONFIG_ARCH_MMAP_RND_BITS_MAX=32
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
-CONFIG_NEED_DMA_MAP_STATE=y
-CONFIG_NEED_SG_DMA_LENGTH=y
-CONFIG_GENERIC_ISA_DMA=y
-CONFIG_GENERIC_BUG=y
-CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_ARCH_MAY_HAVE_PC_FDC=y
-CONFIG_RWSEM_XCHGADD_ALGORITHM=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_ARCH_HAS_CPU_RELAX=y
-CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
-CONFIG_HAVE_SETUP_PER_CPU_AREA=y
-CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
-CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
-CONFIG_ARCH_HIBERNATION_POSSIBLE=y
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
-CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
-CONFIG_ZONE_DMA32=y
-CONFIG_AUDIT_ARCH=y
-CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=y
-CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
-CONFIG_HAVE_INTEL_TXT=y
-CONFIG_X86_64_SMP=y
-CONFIG_ARCH_SUPPORTS_UPROBES=y
-CONFIG_FIX_EARLYCON_MEM=y
-CONFIG_PGTABLE_LEVELS=4
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_IRQ_WORK=y
-CONFIG_BUILDTIME_EXTABLE_SORT=y
-CONFIG_THREAD_INFO_IN_TASK=y
-
-#
-# General setup
-#
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_CROSS_COMPILE=""
-# CONFIG_COMPILE_TEST is not set
-CONFIG_LOCALVERSION=""
 # CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_HAVE_KERNEL_GZIP=y
-CONFIG_HAVE_KERNEL_BZIP2=y
-CONFIG_HAVE_KERNEL_LZMA=y
-CONFIG_HAVE_KERNEL_XZ=y
-CONFIG_HAVE_KERNEL_LZO=y
-CONFIG_HAVE_KERNEL_LZ4=y
-CONFIG_KERNEL_GZIP=y
-# CONFIG_KERNEL_BZIP2 is not set
-# CONFIG_KERNEL_LZMA is not set
-# CONFIG_KERNEL_XZ is not set
-# CONFIG_KERNEL_LZO is not set
-# CONFIG_KERNEL_LZ4 is not set
-CONFIG_DEFAULT_HOSTNAME="(none)"
-CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
-CONFIG_SYSVIPC_SYSCTL=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_POSIX_MQUEUE_SYSCTL=y
-CONFIG_CROSS_MEMORY_ATTACH=y
-CONFIG_FHANDLE=y
-CONFIG_USELIB=y
 CONFIG_AUDIT=y
-CONFIG_HAVE_ARCH_AUDITSYSCALL=y
-CONFIG_AUDITSYSCALL=y
-CONFIG_AUDIT_WATCH=y
-CONFIG_AUDIT_TREE=y
-
-#
-# IRQ subsystem
-#
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_GENERIC_IRQ_SHOW=y
-CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
-CONFIG_GENERIC_PENDING_IRQ=y
-CONFIG_GENERIC_IRQ_MIGRATION=y
-CONFIG_IRQ_DOMAIN=y
-CONFIG_IRQ_DOMAIN_HIERARCHY=y
-CONFIG_GENERIC_MSI_IRQ=y
-CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
-# CONFIG_IRQ_DOMAIN_DEBUG is not set
-CONFIG_IRQ_FORCED_THREADING=y
-CONFIG_SPARSE_IRQ=y
-# CONFIG_GENERIC_IRQ_DEBUGFS is not set
-CONFIG_CLOCKSOURCE_WATCHDOG=y
-CONFIG_ARCH_CLOCKSOURCE_DATA=y
-CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
-CONFIG_GENERIC_TIME_VSYSCALL=y
-CONFIG_GENERIC_CLOCKEVENTS=y
-CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
-CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
-CONFIG_GENERIC_CMOS_UPDATE=y
-
-#
-# Timers subsystem
-#
-CONFIG_TICK_ONESHOT=y
-CONFIG_NO_HZ_COMMON=y
-# CONFIG_HZ_PERIODIC is not set
-CONFIG_NO_HZ_IDLE=y
-# CONFIG_NO_HZ_FULL is not set
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
-
-#
-# CPU/Task time and stats accounting
-#
-CONFIG_TICK_CPU_ACCOUNTING=y
-# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
-# CONFIG_IRQ_TIME_ACCOUNTING is not set
+CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BSD_PROCESS_ACCT=y
-# CONFIG_BSD_PROCESS_ACCT_V3 is not set
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
-
-#
-# RCU Subsystem
-#
-CONFIG_TREE_RCU=y
-# CONFIG_RCU_EXPERT is not set
-CONFIG_SRCU=y
-CONFIG_TREE_SRCU=y
-# CONFIG_TASKS_RCU is not set
-CONFIG_RCU_STALL_COMMON=y
-CONFIG_RCU_NEED_SEGCBLIST=y
-# CONFIG_BUILD_BIN2C is not set
-# CONFIG_IKCONFIG is not set
 CONFIG_LOG_BUF_SHIFT=18
-CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
-CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
-CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
-CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
-CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
-CONFIG_ARCH_SUPPORTS_INT128=y
-# CONFIG_NUMA_BALANCING is not set
 CONFIG_CGROUPS=y
-# CONFIG_MEMCG is not set
-# CONFIG_BLK_CGROUP is not set
 CONFIG_CGROUP_SCHED=y
-CONFIG_FAIR_GROUP_SCHED=y
-# CONFIG_CFS_BANDWIDTH is not set
-# CONFIG_RT_GROUP_SCHED is not set
-# CONFIG_CGROUP_PIDS is not set
-# CONFIG_CGROUP_RDMA is not set
 CONFIG_CGROUP_FREEZER=y
-# CONFIG_CGROUP_HUGETLB is not set
 CONFIG_CPUSETS=y
-CONFIG_PROC_PID_CPUSET=y
-# CONFIG_CGROUP_DEVICE is not set
 CONFIG_CGROUP_CPUACCT=y
-# CONFIG_CGROUP_PERF is not set
-# CONFIG_CGROUP_DEBUG is not set
-# CONFIG_SOCK_CGROUP_DATA is not set
-# CONFIG_CHECKPOINT_RESTORE is not set
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
-# CONFIG_USER_NS is not set
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
-# CONFIG_SCHED_AUTOGROUP is not set
-# CONFIG_SYSFS_DEPRECATED is not set
-CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
-CONFIG_RD_GZIP=y
-CONFIG_RD_BZIP2=y
-CONFIG_RD_LZMA=y
-CONFIG_RD_XZ=y
-CONFIG_RD_LZO=y
-CONFIG_RD_LZ4=y
-CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SYSCTL=y
-CONFIG_ANON_INODES=y
-CONFIG_HAVE_UID16=y
-CONFIG_SYSCTL_EXCEPTION_TRACE=y
-CONFIG_HAVE_PCSPKR_PLATFORM=y
-CONFIG_BPF=y
-# CONFIG_EXPERT is not set
-CONFIG_UID16=y
-CONFIG_MULTIUSER=y
-CONFIG_SGETMASK_SYSCALL=y
-CONFIG_SYSFS_SYSCALL=y
-# CONFIG_SYSCTL_SYSCALL is not set
-CONFIG_POSIX_TIMERS=y
-CONFIG_KALLSYMS=y
-# CONFIG_KALLSYMS_ALL is not set
-CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
-CONFIG_KALLSYMS_BASE_RELATIVE=y
-CONFIG_PRINTK=y
-CONFIG_PRINTK_NMI=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_PCSPKR_PLATFORM=y
-CONFIG_BASE_FULL=y
-CONFIG_FUTEX=y
-CONFIG_EPOLL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-# CONFIG_BPF_SYSCALL is not set
-CONFIG_SHMEM=y
-CONFIG_AIO=y
-CONFIG_ADVISE_SYSCALLS=y
-# CONFIG_USERFAULTFD is not set
-CONFIG_PCI_QUIRKS=y
-CONFIG_MEMBARRIER=y
-# CONFIG_EMBEDDED is not set
-CONFIG_HAVE_PERF_EVENTS=y
-# CONFIG_PC104 is not set
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_PERF_EVENTS=y
-# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_SLUB_DEBUG=y
 # CONFIG_COMPAT_BRK is not set
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
-CONFIG_SLAB_MERGE_DEFAULT=y
-# CONFIG_SLAB_FREELIST_RANDOM is not set
-CONFIG_SLUB_CPU_PARTIAL=y
-# CONFIG_SYSTEM_DATA_VERIFICATION is not set
 CONFIG_PROFILING=y
-CONFIG_TRACEPOINTS=y
-CONFIG_CRASH_CORE=y
-CONFIG_KEXEC_CORE=y
-# CONFIG_OPROFILE is not set
-CONFIG_HAVE_OPROFILE=y
-CONFIG_OPROFILE_NMI_TIMER=y
-CONFIG_KPROBES=y
-# CONFIG_JUMP_LABEL is not set
-CONFIG_OPTPROBES=y
-CONFIG_UPROBES=y
-# CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
-CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
-CONFIG_ARCH_USE_BUILTIN_BSWAP=y
-CONFIG_KRETPROBES=y
-CONFIG_HAVE_IOREMAP_PROT=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_OPTPROBES=y
-CONFIG_HAVE_KPROBES_ON_FTRACE=y
-CONFIG_HAVE_NMI=y
-CONFIG_HAVE_ARCH_TRACEHOOK=y
-CONFIG_HAVE_DMA_CONTIGUOUS=y
-CONFIG_GENERIC_SMP_IDLE_THREAD=y
-CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
-CONFIG_ARCH_HAS_SET_MEMORY=y
-CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
-CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
-CONFIG_HAVE_CLK=y
-CONFIG_HAVE_DMA_API_DEBUG=y
-CONFIG_HAVE_HW_BREAKPOINT=y
-CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
-CONFIG_HAVE_USER_RETURN_NOTIFIER=y
-CONFIG_HAVE_PERF_EVENTS_NMI=y
-CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
-CONFIG_HAVE_PERF_REGS=y
-CONFIG_HAVE_PERF_USER_STACK_DUMP=y
-CONFIG_HAVE_ARCH_JUMP_LABEL=y
-CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
-CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
-CONFIG_HAVE_CMPXCHG_LOCAL=y
-CONFIG_HAVE_CMPXCHG_DOUBLE=y
-CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
-CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
-CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
-CONFIG_SECCOMP_FILTER=y
-CONFIG_HAVE_GCC_PLUGINS=y
-# CONFIG_GCC_PLUGINS is not set
-CONFIG_HAVE_CC_STACKPROTECTOR=y
-# CONFIG_CC_STACKPROTECTOR is not set
-CONFIG_CC_STACKPROTECTOR_NONE=y
-# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
-# CONFIG_CC_STACKPROTECTOR_STRONG is not set
-CONFIG_THIN_ARCHIVES=y
-CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
-CONFIG_HAVE_CONTEXT_TRACKING=y
-CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
-CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
-CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
-CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
-CONFIG_HAVE_ARCH_HUGE_VMAP=y
-CONFIG_HAVE_ARCH_SOFT_DIRTY=y
-CONFIG_MODULES_USE_ELF_RELA=y
-CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
-CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
-CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
-CONFIG_HAVE_EXIT_THREAD=y
-CONFIG_ARCH_MMAP_RND_BITS=28
-CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
-CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
-CONFIG_HAVE_COPY_THREAD_TLS=y
-CONFIG_HAVE_STACK_VALIDATION=y
-# CONFIG_HAVE_ARCH_HASH is not set
-# CONFIG_ISA_BUS_API is not set
-CONFIG_OLD_SIGSUSPEND3=y
-CONFIG_COMPAT_OLD_SIGACTION=y
-# CONFIG_CPU_NO_EFFICIENT_FFS is not set
-CONFIG_HAVE_ARCH_VMAP_STACK=y
-CONFIG_VMAP_STACK=y
-# CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
-# CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
-CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
-CONFIG_STRICT_MODULE_RWX=y
-# CONFIG_REFCOUNT_FULL is not set
-
-#
-# GCOV-based kernel profiling
-#
-# CONFIG_GCOV_KERNEL is not set
-CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
-# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-CONFIG_MODULES=y
-# CONFIG_MODULE_FORCE_LOAD is not set
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-# CONFIG_MODVERSIONS is not set
-# CONFIG_MODULE_SRCVERSION_ALL is not set
-# CONFIG_MODULE_SIG is not set
-# CONFIG_MODULE_COMPRESS is not set
-# CONFIG_TRIM_UNUSED_KSYMS is not set
-CONFIG_MODULES_TREE_LOOKUP=y
-CONFIG_BLOCK=y
-CONFIG_BLK_SCSI_REQUEST=y
-CONFIG_BLK_DEV_BSG=y
-# CONFIG_BLK_DEV_BSGLIB is not set
-# CONFIG_BLK_DEV_INTEGRITY is not set
-# CONFIG_BLK_DEV_ZONED is not set
-# CONFIG_BLK_CMDLINE_PARSER is not set
-# CONFIG_BLK_WBT is not set
-CONFIG_BLK_DEBUG_FS=y
-# CONFIG_BLK_SED_OPAL is not set
-
-#
-# Partition Types
-#
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_ACORN_PARTITION is not set
-# CONFIG_AIX_PARTITION is not set
-CONFIG_OSF_PARTITION=y
-CONFIG_AMIGA_PARTITION=y
-# CONFIG_ATARI_PARTITION is not set
-CONFIG_MAC_PARTITION=y
-CONFIG_MSDOS_PARTITION=y
-CONFIG_BSD_DISKLABEL=y
-CONFIG_MINIX_SUBPARTITION=y
-CONFIG_SOLARIS_X86_PARTITION=y
-CONFIG_UNIXWARE_DISKLABEL=y
-# CONFIG_LDM_PARTITION is not set
-CONFIG_SGI_PARTITION=y
-# CONFIG_ULTRIX_PARTITION is not set
-CONFIG_SUN_PARTITION=y
-CONFIG_KARMA_PARTITION=y
-CONFIG_EFI_PARTITION=y
-# CONFIG_SYSV68_PARTITION is not set
-# CONFIG_CMDLINE_PARTITION is not set
-CONFIG_BLOCK_COMPAT=y
-CONFIG_BLK_MQ_PCI=y
-
-#
-# IO Schedulers
-#
-CONFIG_IOSCHED_NOOP=y
-CONFIG_IOSCHED_DEADLINE=y
-CONFIG_IOSCHED_CFQ=y
-# CONFIG_DEFAULT_DEADLINE is not set
-CONFIG_DEFAULT_CFQ=y
-# CONFIG_DEFAULT_NOOP is not set
-CONFIG_DEFAULT_IOSCHED="cfq"
-CONFIG_MQ_IOSCHED_DEADLINE=y
-CONFIG_MQ_IOSCHED_KYBER=y
-# CONFIG_IOSCHED_BFQ is not set
-CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
-CONFIG_INLINE_READ_UNLOCK=y
-CONFIG_INLINE_READ_UNLOCK_IRQ=y
-CONFIG_INLINE_WRITE_UNLOCK=y
-CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
-CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
-CONFIG_MUTEX_SPIN_ON_OWNER=y
-CONFIG_RWSEM_SPIN_ON_OWNER=y
-CONFIG_LOCK_SPIN_ON_OWNER=y
-CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
-CONFIG_QUEUED_SPINLOCKS=y
-CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
-CONFIG_QUEUED_RWLOCKS=y
-CONFIG_FREEZER=y
-
-#
-# Processor type and features
-#
-CONFIG_ZONE_DMA=y
 CONFIG_SMP=y
-CONFIG_X86_FEATURE_NAMES=y
-CONFIG_X86_FAST_FEATURE_TESTS=y
-CONFIG_X86_MPPARSE=y
-# CONFIG_GOLDFISH is not set
-# CONFIG_INTEL_RDT_A is not set
-CONFIG_X86_EXTENDED_PLATFORM=y
-# CONFIG_X86_VSMP is not set
-# CONFIG_X86_GOLDFISH is not set
-# CONFIG_X86_INTEL_MID is not set
-# CONFIG_X86_INTEL_LPSS is not set
-# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
-CONFIG_IOSF_MBI=y
-# CONFIG_IOSF_MBI_DEBUG is not set
-CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
-CONFIG_SCHED_OMIT_FRAME_POINTER=y
-# CONFIG_HYPERVISOR_GUEST is not set
-CONFIG_NO_BOOTMEM=y
-# CONFIG_MK8 is not set
-# CONFIG_MPSC is not set
-# CONFIG_MCORE2 is not set
-# CONFIG_MATOM is not set
-CONFIG_GENERIC_CPU=y
-CONFIG_X86_INTERNODE_CACHE_SHIFT=6
-CONFIG_X86_L1_CACHE_SHIFT=6
-CONFIG_X86_TSC=y
-CONFIG_X86_CMPXCHG64=y
-CONFIG_X86_CMOV=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=64
-CONFIG_X86_DEBUGCTLMSR=y
-CONFIG_CPU_SUP_INTEL=y
-CONFIG_CPU_SUP_AMD=y
-CONFIG_CPU_SUP_CENTAUR=y
-CONFIG_HPET_TIMER=y
-CONFIG_HPET_EMULATE_RTC=y
-CONFIG_DMI=y
-# CONFIG_GART_IOMMU is not set
-CONFIG_CALGARY_IOMMU=y
-CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=y
-CONFIG_SWIOTLB=y
-CONFIG_IOMMU_HELPER=y
-# CONFIG_MAXSMP is not set
-CONFIG_NR_CPUS=64
-CONFIG_SCHED_SMT=y
-CONFIG_SCHED_MC=y
-CONFIG_SCHED_MC_PRIO=y
-# CONFIG_PREEMPT_NONE is not set
-CONFIG_PREEMPT_VOLUNTARY=y
-# CONFIG_PREEMPT is not set
-CONFIG_X86_LOCAL_APIC=y
-CONFIG_X86_IO_APIC=y
 CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
-CONFIG_X86_MCE=y
-# CONFIG_X86_MCELOG_LEGACY is not set
-CONFIG_X86_MCE_INTEL=y
-CONFIG_X86_MCE_AMD=y
-CONFIG_X86_MCE_THRESHOLD=y
-# CONFIG_X86_MCE_INJECT is not set
-CONFIG_X86_THERMAL_VECTOR=y
-
-#
-# Performance monitoring
-#
-CONFIG_PERF_EVENTS_INTEL_UNCORE=y
-CONFIG_PERF_EVENTS_INTEL_RAPL=y
-CONFIG_PERF_EVENTS_INTEL_CSTATE=y
-# CONFIG_PERF_EVENTS_AMD_POWER is not set
-# CONFIG_VM86 is not set
-CONFIG_X86_16BIT=y
-CONFIG_X86_ESPFIX64=y
-CONFIG_X86_VSYSCALL_EMULATION=y
-# CONFIG_I8K is not set
-CONFIG_MICROCODE=y
-CONFIG_MICROCODE_INTEL=y
 CONFIG_MICROCODE_AMD=y
 CONFIG_MICROCODE_OLD_INTERFACE=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
-CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
-CONFIG_ARCH_DMA_ADDR_T_64BIT=y
-CONFIG_X86_DIRECT_GBPAGES=y
 CONFIG_NUMA=y
-CONFIG_AMD_NUMA=y
-CONFIG_X86_64_ACPI_NUMA=y
-CONFIG_NODES_SPAN_OTHER_NODES=y
-# CONFIG_NUMA_EMU is not set
-CONFIG_NODES_SHIFT=6
-CONFIG_ARCH_SPARSEMEM_ENABLE=y
-CONFIG_ARCH_SPARSEMEM_DEFAULT=y
-CONFIG_ARCH_SELECT_MEMORY_MODEL=y
-CONFIG_ARCH_PROC_KCORE_TEXT=y
-CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
-CONFIG_SELECT_MEMORY_MODEL=y
-CONFIG_SPARSEMEM_MANUAL=y
-CONFIG_SPARSEMEM=y
-CONFIG_NEED_MULTIPLE_NODES=y
-CONFIG_HAVE_MEMORY_PRESENT=y
-CONFIG_SPARSEMEM_EXTREME=y
-CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
-CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=y
-CONFIG_SPARSEMEM_VMEMMAP=y
-CONFIG_HAVE_MEMBLOCK=y
-CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
-CONFIG_HAVE_GENERIC_GUP=y
-CONFIG_ARCH_DISCARD_MEMBLOCK=y
-# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
-# CONFIG_MEMORY_HOTPLUG is not set
-CONFIG_SPLIT_PTLOCK_CPUS=4
-CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
-CONFIG_COMPACTION=y
-CONFIG_MIGRATION=y
-CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
-CONFIG_PHYS_ADDR_T_64BIT=y
-CONFIG_BOUNCE=y
-CONFIG_VIRT_TO_BUS=y
-CONFIG_MMU_NOTIFIER=y
-# CONFIG_KSM is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
-# CONFIG_MEMORY_FAILURE is not set
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
-CONFIG_ARCH_WANTS_THP_SWAP=y
-# CONFIG_CLEANCACHE is not set
-# CONFIG_FRONTSWAP is not set
-# CONFIG_CMA is not set
-# CONFIG_ZPOOL is not set
-# CONFIG_ZBUD is not set
-# CONFIG_ZSMALLOC is not set
-CONFIG_GENERIC_EARLY_IOREMAP=y
-CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=y
-# CONFIG_IDLE_PAGE_TRACKING is not set
-CONFIG_ARCH_HAS_ZONE_DEVICE=y
-CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
-CONFIG_ARCH_HAS_PKEYS=y
-# CONFIG_PERCPU_STATS is not set
-# CONFIG_X86_PMEM_LEGACY is not set
 CONFIG_X86_CHECK_BIOS_CORRUPTION=y
-CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
-CONFIG_X86_RESERVE_LOW=64
-CONFIG_MTRR=y
 # CONFIG_MTRR_SANITIZER is not set
-CONFIG_X86_PAT=y
-CONFIG_ARCH_USES_PG_UNCACHED=y
-CONFIG_ARCH_RANDOM=y
-CONFIG_X86_SMAP=y
-# CONFIG_X86_INTEL_MPX is not set
-CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
 CONFIG_EFI=y
-# CONFIG_EFI_STUB is not set
-CONFIG_SECCOMP=y
-# CONFIG_HZ_100 is not set
-# CONFIG_HZ_250 is not set
-# CONFIG_HZ_300 is not set
 CONFIG_HZ_1000=y
-CONFIG_HZ=1000
-CONFIG_SCHED_HRTICK=y
 CONFIG_KEXEC=y
-# CONFIG_KEXEC_FILE is not set
 CONFIG_CRASH_DUMP=y
-# CONFIG_KEXEC_JUMP is not set
-CONFIG_PHYSICAL_START=0x1000000
-CONFIG_RELOCATABLE=y
 # CONFIG_RANDOMIZE_BASE is not set
-CONFIG_PHYSICAL_ALIGN=0x200000
-CONFIG_HOTPLUG_CPU=y
-# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
-# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
-# CONFIG_COMPAT_VDSO is not set
-# CONFIG_LEGACY_VSYSCALL_NATIVE is not set
 CONFIG_LEGACY_VSYSCALL_EMULATE=y
-# CONFIG_LEGACY_VSYSCALL_NONE is not set
-# CONFIG_CMDLINE_BOOL is not set
-CONFIG_MODIFY_LDT_SYSCALL=y
-CONFIG_HAVE_LIVEPATCH=y
-CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
-CONFIG_USE_PERCPU_NUMA_NODE_ID=y
-
-#
-# Power management and ACPI options
-#
-CONFIG_ARCH_HIBERNATION_HEADER=y
-CONFIG_SUSPEND=y
-CONFIG_SUSPEND_FREEZER=y
-CONFIG_HIBERNATE_CALLBACKS=y
 CONFIG_HIBERNATION=y
-CONFIG_PM_STD_PARTITION=""
-CONFIG_PM_SLEEP=y
-CONFIG_PM_SLEEP_SMP=y
-# CONFIG_PM_AUTOSLEEP is not set
-# CONFIG_PM_WAKELOCKS is not set
-CONFIG_PM=y
 CONFIG_PM_DEBUG=y
-# CONFIG_PM_ADVANCED_DEBUG is not set
-# CONFIG_PM_TEST_SUSPEND is not set
-CONFIG_PM_SLEEP_DEBUG=y
-CONFIG_PM_TRACE=y
 CONFIG_PM_TRACE_RTC=y
-CONFIG_PM_CLK=y
-# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
-CONFIG_ACPI=y
-CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
-CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
-CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
-# CONFIG_ACPI_DEBUGGER is not set
-CONFIG_ACPI_SLEEP=y
-# CONFIG_ACPI_PROCFS_POWER is not set
-CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
-# CONFIG_ACPI_EC_DEBUGFS is not set
-CONFIG_ACPI_AC=y
-CONFIG_ACPI_BATTERY=y
-CONFIG_ACPI_BUTTON=y
-CONFIG_ACPI_VIDEO=y
-CONFIG_ACPI_FAN=y
 CONFIG_ACPI_DOCK=y
-CONFIG_ACPI_CPU_FREQ_PSS=y
-CONFIG_ACPI_PROCESSOR_CSTATE=y
-CONFIG_ACPI_PROCESSOR_IDLE=y
-CONFIG_ACPI_CPPC_LIB=y
-CONFIG_ACPI_PROCESSOR=y
-CONFIG_ACPI_HOTPLUG_CPU=y
-# CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
-CONFIG_ACPI_THERMAL=y
-CONFIG_ACPI_NUMA=y
-# CONFIG_ACPI_CUSTOM_DSDT is not set
-CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
-CONFIG_ACPI_TABLE_UPGRADE=y
-# CONFIG_ACPI_DEBUG is not set
-# CONFIG_ACPI_PCI_SLOT is not set
-CONFIG_X86_PM_TIMER=y
-CONFIG_ACPI_CONTAINER=y
-CONFIG_ACPI_HOTPLUG_IOAPIC=y
-# CONFIG_ACPI_SBS is not set
-# CONFIG_ACPI_HED is not set
-# CONFIG_ACPI_CUSTOM_METHOD is not set
-# CONFIG_ACPI_BGRT is not set
-# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
-# CONFIG_ACPI_NFIT is not set
-CONFIG_HAVE_ACPI_APEI=y
-CONFIG_HAVE_ACPI_APEI_NMI=y
-# CONFIG_ACPI_APEI is not set
-# CONFIG_DPTF_POWER is not set
-# CONFIG_ACPI_EXTLOG is not set
-# CONFIG_PMIC_OPREGION is not set
-# CONFIG_ACPI_CONFIGFS is not set
-# CONFIG_SFI is not set
-
-#
-# CPU Frequency scaling
-#
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_ATTR_SET=y
-CONFIG_CPU_FREQ_GOV_COMMON=y
-# CONFIG_CPU_FREQ_STAT is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
 CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
-# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
-# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set
-
-#
-# CPU frequency scaling drivers
-#
-CONFIG_X86_INTEL_PSTATE=y
-# CONFIG_X86_PCC_CPUFREQ is not set
 CONFIG_X86_ACPI_CPUFREQ=y
-CONFIG_X86_ACPI_CPUFREQ_CPB=y
-# CONFIG_X86_POWERNOW_K8 is not set
-# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
-# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
-# CONFIG_X86_P4_CLOCKMOD is not set
-
-#
-# shared options
-#
-# CONFIG_X86_SPEEDSTEP_LIB is not set
-
-#
-# CPU Idle
-#
-CONFIG_CPU_IDLE=y
 CONFIG_CPU_IDLE_GOV_LADDER=y
-CONFIG_CPU_IDLE_GOV_MENU=y
-# CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
-# CONFIG_INTEL_IDLE is not set
-
-#
-# Bus options (PCI etc.)
-#
-CONFIG_PCI=y
-CONFIG_PCI_DIRECT=y
-CONFIG_PCI_MMCONFIG=y
-CONFIG_PCI_DOMAINS=y
-CONFIG_PCIEPORTBUS=y
-# CONFIG_HOTPLUG_PCI_PCIE is not set
-CONFIG_PCIEAER=y
-# CONFIG_PCIE_ECRC is not set
-# CONFIG_PCIEAER_INJECT is not set
-CONFIG_PCIEASPM=y
-# CONFIG_PCIEASPM_DEBUG is not set
-CONFIG_PCIEASPM_DEFAULT=y
-# CONFIG_PCIEASPM_POWERSAVE is not set
-# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
-# CONFIG_PCIEASPM_PERFORMANCE is not set
-CONFIG_PCIE_PME=y
-# CONFIG_PCIE_DPC is not set
-# CONFIG_PCIE_PTM is not set
-CONFIG_PCI_BUS_ADDR_T_64BIT=y
-CONFIG_PCI_MSI=y
-CONFIG_PCI_MSI_IRQ_DOMAIN=y
-# CONFIG_PCI_DEBUG is not set
-# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
-# CONFIG_PCI_STUB is not set
-CONFIG_HT_IRQ=y
-CONFIG_PCI_ATS=y
-CONFIG_PCI_LOCKLESS_CONFIG=y
-# CONFIG_PCI_IOV is not set
-CONFIG_PCI_PRI=y
-CONFIG_PCI_PASID=y
-CONFIG_PCI_LABEL=y
-CONFIG_HOTPLUG_PCI=y
-# CONFIG_HOTPLUG_PCI_ACPI is not set
-# CONFIG_HOTPLUG_PCI_CPCI is not set
-# CONFIG_HOTPLUG_PCI_SHPC is not set
-
-#
-# DesignWare PCI Core Support
-#
-# CONFIG_PCIE_DW_PLAT is not set
-
-#
-# PCI host controller drivers
-#
-# CONFIG_VMD is not set
-
-#
-# PCI Endpoint
-#
-# CONFIG_PCI_ENDPOINT is not set
-
-#
-# PCI switch controller drivers
-#
-# CONFIG_PCI_SW_SWITCHTEC is not set
-CONFIG_ISA_DMA_API=y
-CONFIG_AMD_NB=y
-CONFIG_PCCARD=y
-CONFIG_PCMCIA=y
-CONFIG_PCMCIA_LOAD_CIS=y
-CONFIG_CARDBUS=y
-
-#
-# PC-card bridges
-#
-CONFIG_YENTA=y
-CONFIG_YENTA_O2=y
-CONFIG_YENTA_RICOH=y
-CONFIG_YENTA_TI=y
-CONFIG_YENTA_ENE_TUNE=y
-CONFIG_YENTA_TOSHIBA=y
-# CONFIG_PD6729 is not set
-# CONFIG_I82092 is not set
-CONFIG_PCCARD_NONSTATIC=y
-# CONFIG_RAPIDIO is not set
-# CONFIG_X86_SYSFB is not set
-
-#
-# Executable file formats / Emulations
-#
-CONFIG_BINFMT_ELF=y
-CONFIG_COMPAT_BINFMT_ELF=y
-CONFIG_ELFCORE=y
-CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
-CONFIG_BINFMT_SCRIPT=y
-# CONFIG_HAVE_AOUT is not set
-CONFIG_BINFMT_MISC=y
-CONFIG_COREDUMP=y
 CONFIG_IA32_EMULATION=y
-# CONFIG_IA32_AOUT is not set
-# CONFIG_X86_X32 is not set
-CONFIG_COMPAT_32=y
-CONFIG_COMPAT=y
-CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
-CONFIG_SYSVIPC_COMPAT=y
-CONFIG_X86_DEV_DMA_OPS=y
+CONFIG_EFI_VARS=y
+CONFIG_KPROBES=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_OSF_PARTITION=y
+CONFIG_AMIGA_PARTITION=y
+CONFIG_MAC_PARTITION=y
+CONFIG_BSD_DISKLABEL=y
+CONFIG_MINIX_SUBPARTITION=y
+CONFIG_SOLARIS_X86_PARTITION=y
+CONFIG_UNIXWARE_DISKLABEL=y
+CONFIG_SGI_PARTITION=y
+CONFIG_SUN_PARTITION=y
+CONFIG_KARMA_PARTITION=y
+CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
-CONFIG_NET_INGRESS=y
-
-#
-# Networking options
-#
 CONFIG_PACKET=y
-# CONFIG_PACKET_DIAG is not set
 CONFIG_UNIX=y
-# CONFIG_UNIX_DIAG is not set
-# CONFIG_TLS is not set
-CONFIG_XFRM=y
-CONFIG_XFRM_ALGO=y
 CONFIG_XFRM_USER=y
-# CONFIG_XFRM_SUB_POLICY is not set
-# CONFIG_XFRM_MIGRATE is not set
-# CONFIG_XFRM_STATISTICS is not set
-# CONFIG_NET_KEY is not set
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
-# CONFIG_IP_FIB_TRIE_STATS is not set
 CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_ROUTE_MULTIPATH=y
 CONFIG_IP_ROUTE_VERBOSE=y
@@ -838,3461 +75,219 @@ CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE_DEMUX is not set
-CONFIG_NET_IP_TUNNEL=y
 CONFIG_IP_MROUTE=y
-# CONFIG_IP_MROUTE_MULTIPLE_TABLES is not set
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_NET_UDP_TUNNEL is not set
-# CONFIG_NET_FOU is not set
-# CONFIG_NET_FOU_IP_TUNNELS is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-CONFIG_INET_TUNNEL=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
-CONFIG_TCP_CONG_CUBIC=y
 # CONFIG_TCP_CONG_WESTWOOD is not set
 # CONFIG_TCP_CONG_HTCP is not set
-# CONFIG_TCP_CONG_HSTCP is not set
-# CONFIG_TCP_CONG_HYBLA is not set
-# CONFIG_TCP_CONG_VEGAS is not set
-# CONFIG_TCP_CONG_NV is not set
-# CONFIG_TCP_CONG_SCALABLE is not set
-# CONFIG_TCP_CONG_LP is not set
-# CONFIG_TCP_CONG_VENO is not set
-# CONFIG_TCP_CONG_YEAH is not set
-# CONFIG_TCP_CONG_ILLINOIS is not set
-# CONFIG_TCP_CONG_DCTCP is not set
-# CONFIG_TCP_CONG_CDG is not set
-# CONFIG_TCP_CONG_BBR is not set
-CONFIG_DEFAULT_CUBIC=y
-# CONFIG_DEFAULT_RENO is not set
-CONFIG_DEFAULT_TCP_CONG="cubic"
 CONFIG_TCP_MD5SIG=y
-CONFIG_IPV6=y
-# CONFIG_IPV6_ROUTER_PREF is not set
-# CONFIG_IPV6_OPTIMISTIC_DAD is not set
 CONFIG_INET6_AH=y
 CONFIG_INET6_ESP=y
-# CONFIG_INET6_ESP_OFFLOAD is not set
-# CONFIG_INET6_IPCOMP is not set
-# CONFIG_IPV6_MIP6 is not set
-# CONFIG_IPV6_ILA is not set
-# CONFIG_INET6_XFRM_TUNNEL is not set
-# CONFIG_INET6_TUNNEL is not set
-CONFIG_INET6_XFRM_MODE_TRANSPORT=y
-CONFIG_INET6_XFRM_MODE_TUNNEL=y
-CONFIG_INET6_XFRM_MODE_BEET=y
-# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
-# CONFIG_IPV6_VTI is not set
-CONFIG_IPV6_SIT=y
-# CONFIG_IPV6_SIT_6RD is not set
-CONFIG_IPV6_NDISC_NODETYPE=y
-# CONFIG_IPV6_TUNNEL is not set
-# CONFIG_IPV6_FOU is not set
-# CONFIG_IPV6_FOU_TUNNEL is not set
-# CONFIG_IPV6_MULTIPLE_TABLES is not set
-# CONFIG_IPV6_MROUTE is not set
-# CONFIG_IPV6_SEG6_LWTUNNEL is not set
-# CONFIG_IPV6_SEG6_HMAC is not set
 CONFIG_NETLABEL=y
-CONFIG_NETWORK_SECMARK=y
-CONFIG_NET_PTP_CLASSIFY=y
-# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
 CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_DEBUG is not set
 # CONFIG_NETFILTER_ADVANCED is not set
-
-#
-# Core Netfilter Configuration
-#
-CONFIG_NETFILTER_INGRESS=y
-CONFIG_NETFILTER_NETLINK=y
-CONFIG_NETFILTER_NETLINK_LOG=y
 CONFIG_NF_CONNTRACK=y
-CONFIG_NF_LOG_COMMON=m
-# CONFIG_NF_LOG_NETDEV is not set
-CONFIG_NF_CONNTRACK_SECMARK=y
-CONFIG_NF_CONNTRACK_PROCFS=y
 CONFIG_NF_CONNTRACK_FTP=y
 CONFIG_NF_CONNTRACK_IRC=y
-# CONFIG_NF_CONNTRACK_NETBIOS_NS is not set
 CONFIG_NF_CONNTRACK_SIP=y
 CONFIG_NF_CT_NETLINK=y
-# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
-CONFIG_NF_NAT=m
-CONFIG_NF_NAT_NEEDED=y
-# CONFIG_NF_NAT_AMANDA is not set
-CONFIG_NF_NAT_FTP=m
-CONFIG_NF_NAT_IRC=m
-CONFIG_NF_NAT_SIP=m
-# CONFIG_NF_NAT_TFTP is not set
-# CONFIG_NF_NAT_REDIRECT is not set
-# CONFIG_NF_TABLES is not set
-CONFIG_NETFILTER_XTABLES=y
-
-#
-# Xtables combined modules
-#
-CONFIG_NETFILTER_XT_MARK=m
-
-#
-# Xtables targets
-#
 CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=y
-CONFIG_NETFILTER_XT_TARGET_LOG=m
-CONFIG_NETFILTER_XT_NAT=m
-# CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
 CONFIG_NETFILTER_XT_TARGET_NFLOG=y
-# CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
 CONFIG_NETFILTER_XT_TARGET_SECMARK=y
 CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
-
-#
-# Xtables matches
-#
-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
 CONFIG_NETFILTER_XT_MATCH_POLICY=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
-# CONFIG_IP_SET is not set
-# CONFIG_IP_VS is not set
-
-#
-# IP: Netfilter Configuration
-#
-CONFIG_NF_DEFRAG_IPV4=y
-CONFIG_NF_CONNTRACK_IPV4=y
-# CONFIG_NF_SOCKET_IPV4 is not set
-# CONFIG_NF_DUP_IPV4 is not set
-CONFIG_NF_LOG_ARP=m
-CONFIG_NF_LOG_IPV4=m
-CONFIG_NF_REJECT_IPV4=y
-CONFIG_NF_NAT_IPV4=m
-CONFIG_NF_NAT_MASQUERADE_IPV4=m
-# CONFIG_NF_NAT_PPTP is not set
-# CONFIG_NF_NAT_H323 is not set
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_TARGET_REJECT=y
-CONFIG_IP_NF_NAT=m
 CONFIG_IP_NF_TARGET_MASQUERADE=m
 CONFIG_IP_NF_MANGLE=y
-# CONFIG_IP_NF_RAW is not set
-
-#
-# IPv6: Netfilter Configuration
-#
-CONFIG_NF_DEFRAG_IPV6=y
-CONFIG_NF_CONNTRACK_IPV6=y
-# CONFIG_NF_SOCKET_IPV6 is not set
-# CONFIG_NF_DUP_IPV6 is not set
-CONFIG_NF_REJECT_IPV6=y
-CONFIG_NF_LOG_IPV6=m
 CONFIG_IP6_NF_IPTABLES=y
 CONFIG_IP6_NF_MATCH_IPV6HEADER=y
 CONFIG_IP6_NF_FILTER=y
 CONFIG_IP6_NF_TARGET_REJECT=y
 CONFIG_IP6_NF_MANGLE=y
-# CONFIG_IP6_NF_RAW is not set
-# CONFIG_IP_DCCP is not set
-# CONFIG_IP_SCTP is not set
-# CONFIG_RDS is not set
-# CONFIG_TIPC is not set
-# CONFIG_ATM is not set
-# CONFIG_L2TP is not set
-# CONFIG_BRIDGE is not set
-CONFIG_HAVE_NET_DSA=y
-# CONFIG_NET_DSA is not set
-# CONFIG_VLAN_8021Q is not set
-# CONFIG_DECNET is not set
-# CONFIG_LLC2 is not set
-# CONFIG_IPX is not set
-# CONFIG_ATALK is not set
-# CONFIG_X25 is not set
-# CONFIG_LAPB is not set
-# CONFIG_PHONET is not set
-# CONFIG_6LOWPAN is not set
-# CONFIG_IEEE802154 is not set
 CONFIG_NET_SCHED=y
-
-#
-# Queueing/Scheduling
-#
-# CONFIG_NET_SCH_CBQ is not set
-# CONFIG_NET_SCH_HTB is not set
-# CONFIG_NET_SCH_HFSC is not set
-# CONFIG_NET_SCH_PRIO is not set
-# CONFIG_NET_SCH_MULTIQ is not set
-# CONFIG_NET_SCH_RED is not set
-# CONFIG_NET_SCH_SFB is not set
-# CONFIG_NET_SCH_SFQ is not set
-# CONFIG_NET_SCH_TEQL is not set
-# CONFIG_NET_SCH_TBF is not set
-# CONFIG_NET_SCH_GRED is not set
-# CONFIG_NET_SCH_DSMARK is not set
-# CONFIG_NET_SCH_NETEM is not set
-# CONFIG_NET_SCH_DRR is not set
-# CONFIG_NET_SCH_MQPRIO is not set
-# CONFIG_NET_SCH_CHOKE is not set
-# CONFIG_NET_SCH_QFQ is not set
-# CONFIG_NET_SCH_CODEL is not set
-# CONFIG_NET_SCH_FQ_CODEL is not set
-# CONFIG_NET_SCH_FQ is not set
-# CONFIG_NET_SCH_HHF is not set
-# CONFIG_NET_SCH_PIE is not set
-# CONFIG_NET_SCH_INGRESS is not set
-# CONFIG_NET_SCH_PLUG is not set
-# CONFIG_NET_SCH_DEFAULT is not set
-
-#
-# Classification
-#
-CONFIG_NET_CLS=y
-# CONFIG_NET_CLS_BASIC is not set
-# CONFIG_NET_CLS_TCINDEX is not set
-# CONFIG_NET_CLS_ROUTE4 is not set
-# CONFIG_NET_CLS_FW is not set
-# CONFIG_NET_CLS_U32 is not set
-# CONFIG_NET_CLS_RSVP is not set
-# CONFIG_NET_CLS_RSVP6 is not set
-# CONFIG_NET_CLS_FLOW is not set
-# CONFIG_NET_CLS_CGROUP is not set
-# CONFIG_NET_CLS_BPF is not set
-# CONFIG_NET_CLS_FLOWER is not set
-# CONFIG_NET_CLS_MATCHALL is not set
 CONFIG_NET_EMATCH=y
-CONFIG_NET_EMATCH_STACK=32
-# CONFIG_NET_EMATCH_CMP is not set
-# CONFIG_NET_EMATCH_NBYTE is not set
-# CONFIG_NET_EMATCH_U32 is not set
-# CONFIG_NET_EMATCH_META is not set
-# CONFIG_NET_EMATCH_TEXT is not set
 CONFIG_NET_CLS_ACT=y
-# CONFIG_NET_ACT_POLICE is not set
-# CONFIG_NET_ACT_GACT is not set
-# CONFIG_NET_ACT_MIRRED is not set
-# CONFIG_NET_ACT_SAMPLE is not set
-# CONFIG_NET_ACT_IPT is not set
-# CONFIG_NET_ACT_NAT is not set
-# CONFIG_NET_ACT_PEDIT is not set
-# CONFIG_NET_ACT_SIMP is not set
-# CONFIG_NET_ACT_SKBEDIT is not set
-# CONFIG_NET_ACT_CSUM is not set
-# CONFIG_NET_ACT_VLAN is not set
-# CONFIG_NET_ACT_BPF is not set
-# CONFIG_NET_ACT_SKBMOD is not set
-# CONFIG_NET_ACT_IFE is not set
-# CONFIG_NET_ACT_TUNNEL_KEY is not set
-CONFIG_NET_SCH_FIFO=y
-# CONFIG_DCB is not set
-CONFIG_DNS_RESOLVER=y
-# CONFIG_BATMAN_ADV is not set
-# CONFIG_OPENVSWITCH is not set
-# CONFIG_VSOCKETS is not set
-# CONFIG_NETLINK_DIAG is not set
-# CONFIG_MPLS is not set
-# CONFIG_HSR is not set
-# CONFIG_NET_SWITCHDEV is not set
-# CONFIG_NET_L3_MASTER_DEV is not set
-# CONFIG_NET_NCSI is not set
-CONFIG_RPS=y
-CONFIG_RFS_ACCEL=y
-CONFIG_XPS=y
-# CONFIG_CGROUP_NET_PRIO is not set
-# CONFIG_CGROUP_NET_CLASSID is not set
-CONFIG_NET_RX_BUSY_POLL=y
-CONFIG_BQL=y
-# CONFIG_BPF_JIT is not set
-CONFIG_NET_FLOW_LIMIT=y
-
-#
-# Network testing
-#
-# CONFIG_NET_PKTGEN is not set
-# CONFIG_NET_TCPPROBE is not set
-# CONFIG_NET_DROP_MONITOR is not set
 CONFIG_HAMRADIO=y
-
-#
-# Packet Radio protocols
-#
-# CONFIG_AX25 is not set
-# CONFIG_CAN is not set
-# CONFIG_IRDA is not set
-# CONFIG_BT is not set
-# CONFIG_AF_RXRPC is not set
-# CONFIG_AF_KCM is not set
-# CONFIG_STREAM_PARSER is not set
-CONFIG_FIB_RULES=y
-CONFIG_WIRELESS=y
 CONFIG_CFG80211=y
-# CONFIG_NL80211_TESTMODE is not set
-# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
-CONFIG_CFG80211_DEFAULT_PS=y
-# CONFIG_CFG80211_DEBUGFS is not set
-# CONFIG_CFG80211_INTERNAL_REGDB is not set
-CONFIG_CFG80211_CRDA_SUPPORT=y
-# CONFIG_CFG80211_WEXT is not set
-# CONFIG_LIB80211 is not set
 CONFIG_MAC80211=y
-CONFIG_MAC80211_HAS_RC=y
-CONFIG_MAC80211_RC_MINSTREL=y
-CONFIG_MAC80211_RC_MINSTREL_HT=y
-# CONFIG_MAC80211_RC_MINSTREL_VHT is not set
-CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
-CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
-# CONFIG_MAC80211_MESH is not set
 CONFIG_MAC80211_LEDS=y
-# CONFIG_MAC80211_DEBUGFS is not set
-# CONFIG_MAC80211_MESSAGE_TRACING is not set
-# CONFIG_MAC80211_DEBUG_MENU is not set
-CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
-# CONFIG_WIMAX is not set
 CONFIG_RFKILL=y
-CONFIG_RFKILL_LEDS=y
-CONFIG_RFKILL_INPUT=y
-# CONFIG_NET_9P is not set
-# CONFIG_CAIF is not set
-# CONFIG_CEPH_LIB is not set
-# CONFIG_NFC is not set
-# CONFIG_PSAMPLE is not set
-# CONFIG_NET_IFE is not set
-# CONFIG_LWTUNNEL is not set
-CONFIG_DST_CACHE=y
-CONFIG_GRO_CELLS=y
-# CONFIG_NET_DEVLINK is not set
-CONFIG_MAY_USE_DEVLINK=y
-CONFIG_HAVE_EBPF_JIT=y
-
-#
-# Device Drivers
-#
-
-#
-# Generic Driver Options
-#
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_HOTPLUG_PCI=y
+CONFIG_PCCARD=y
+CONFIG_YENTA=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_STANDALONE=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=y
-CONFIG_FIRMWARE_IN_KERNEL=y
-CONFIG_EXTRA_FIRMWARE=""
-# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
-CONFIG_ALLOW_DEV_COREDUMP=y
-# CONFIG_DEBUG_DRIVER is not set
 CONFIG_DEBUG_DEVRES=y
-# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
-# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
-# CONFIG_SYS_HYPERVISOR is not set
-# CONFIG_GENERIC_CPU_DEVICES is not set
-CONFIG_GENERIC_CPU_AUTOPROBE=y
-CONFIG_REGMAP=y
-CONFIG_REGMAP_I2C=y
-CONFIG_DMA_SHARED_BUFFER=y
-# CONFIG_DMA_FENCE_TRACE is not set
-
-#
-# Bus devices
-#
 CONFIG_CONNECTOR=y
-CONFIG_PROC_EVENTS=y
-# CONFIG_MTD is not set
-# CONFIG_OF is not set
-CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
-# CONFIG_PARPORT is not set
-CONFIG_PNP=y
-CONFIG_PNP_DEBUG_MESSAGES=y
-
-#
-# Protocols
-#
-CONFIG_PNPACPI=y
-CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_NULL_BLK is not set
-# CONFIG_BLK_DEV_FD is not set
-# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
-# CONFIG_BLK_CPQ_CISS_DA is not set
-# CONFIG_BLK_DEV_DAC960 is not set
-# CONFIG_BLK_DEV_UMEM is not set
-# CONFIG_BLK_DEV_COW_COMMON is not set
 CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
-# CONFIG_BLK_DEV_CRYPTOLOOP is not set
-# CONFIG_BLK_DEV_DRBD is not set
-# CONFIG_BLK_DEV_NBD is not set
-# CONFIG_BLK_DEV_SKD is not set
-# CONFIG_BLK_DEV_SX8 is not set
-# CONFIG_BLK_DEV_RAM is not set
-# CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
-# CONFIG_BLK_DEV_RBD is not set
-# CONFIG_BLK_DEV_RSXX is not set
-# CONFIG_BLK_DEV_NVME is not set
-# CONFIG_NVME_FC is not set
-
-#
-# Misc devices
-#
-# CONFIG_SENSORS_LIS3LV02D is not set
-# CONFIG_AD525X_DPOT is not set
-# CONFIG_DUMMY_IRQ is not set
-# CONFIG_IBM_ASM is not set
-# CONFIG_PHANTOM is not set
-# CONFIG_SGI_IOC4 is not set
-# CONFIG_TIFM_CORE is not set
-# CONFIG_ICS932S401 is not set
-# CONFIG_ENCLOSURE_SERVICES is not set
-# CONFIG_HP_ILO is not set
-# CONFIG_APDS9802ALS is not set
-# CONFIG_ISL29003 is not set
-# CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
-# CONFIG_SENSORS_BH1770 is not set
-# CONFIG_SENSORS_APDS990X is not set
-# CONFIG_HMC6352 is not set
-# CONFIG_DS1682 is not set
-# CONFIG_USB_SWITCH_FSA9480 is not set
-# CONFIG_SRAM is not set
-# CONFIG_PCI_ENDPOINT_TEST is not set
-# CONFIG_C2PORT is not set
-
-#
-# EEPROM support
-#
-# CONFIG_EEPROM_AT24 is not set
-# CONFIG_EEPROM_LEGACY is not set
-# CONFIG_EEPROM_MAX6875 is not set
-# CONFIG_EEPROM_93CX6 is not set
-# CONFIG_EEPROM_IDT_89HPESX is not set
-# CONFIG_CB710_CORE is not set
-
-#
-# Texas Instruments shared transport line discipline
-#
-# CONFIG_SENSORS_LIS3_I2C is not set
-
-#
-# Altera FPGA firmware download module
-#
-# CONFIG_ALTERA_STAPL is not set
-# CONFIG_INTEL_MEI is not set
-# CONFIG_INTEL_MEI_ME is not set
-# CONFIG_INTEL_MEI_TXE is not set
-# CONFIG_VMWARE_VMCI is not set
-
-#
-# Intel MIC Bus Driver
-#
-# CONFIG_INTEL_MIC_BUS is not set
-
-#
-# SCIF Bus Driver
-#
-# CONFIG_SCIF_BUS is not set
-
-#
-# VOP Bus Driver
-#
-# CONFIG_VOP_BUS is not set
-
-#
-# Intel MIC Host Driver
-#
-
-#
-# Intel MIC Card Driver
-#
-
-#
-# SCIF Driver
-#
-
-#
-# Intel MIC Coprocessor State Management (COSM) Drivers
-#
-
-#
-# VOP Driver
-#
-# CONFIG_GENWQE is not set
-# CONFIG_ECHO is not set
-# CONFIG_CXL_BASE is not set
-# CONFIG_CXL_AFU_DRIVER_OPS is not set
-# CONFIG_CXL_LIB is not set
-CONFIG_HAVE_IDE=y
-# CONFIG_IDE is not set
-
-#
-# SCSI device support
-#
-CONFIG_SCSI_MOD=y
-# CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-# CONFIG_SCSI_NETLINK is not set
-# CONFIG_SCSI_MQ_DEFAULT is not set
-CONFIG_SCSI_PROC_FS=y
-
-#
-# SCSI support type (disk, tape, CD-ROM)
-#
 CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
-# CONFIG_CHR_DEV_OSST is not set
 CONFIG_BLK_DEV_SR=y
-CONFIG_BLK_DEV_SR_VENDOR=y
 CONFIG_CHR_DEV_SG=y
-# CONFIG_CHR_DEV_SCH is not set
 CONFIG_SCSI_CONSTANTS=y
-# CONFIG_SCSI_LOGGING is not set
-# CONFIG_SCSI_SCAN_ASYNC is not set
-
-#
-# SCSI Transports
-#
 CONFIG_SCSI_SPI_ATTRS=y
-# CONFIG_SCSI_FC_ATTRS is not set
-# CONFIG_SCSI_ISCSI_ATTRS is not set
-# CONFIG_SCSI_SAS_ATTRS is not set
-# CONFIG_SCSI_SAS_LIBSAS is not set
-# CONFIG_SCSI_SRP_ATTRS is not set
 # CONFIG_SCSI_LOWLEVEL is not set
-# CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
-# CONFIG_SCSI_DH is not set
-# CONFIG_SCSI_OSD_INITIATOR is not set
 CONFIG_ATA=y
-# CONFIG_ATA_NONSTANDARD is not set
-CONFIG_ATA_VERBOSE_ERROR=y
-CONFIG_ATA_ACPI=y
-# CONFIG_SATA_ZPODD is not set
-CONFIG_SATA_PMP=y
-
-#
-# Controllers with non-SFF native interface
-#
 CONFIG_SATA_AHCI=y
-# CONFIG_SATA_AHCI_PLATFORM is not set
-# CONFIG_SATA_INIC162X is not set
-# CONFIG_SATA_ACARD_AHCI is not set
-# CONFIG_SATA_SIL24 is not set
-CONFIG_ATA_SFF=y
-
-#
-# SFF controllers with custom DMA interface
-#
-# CONFIG_PDC_ADMA is not set
-# CONFIG_SATA_QSTOR is not set
-# CONFIG_SATA_SX4 is not set
-CONFIG_ATA_BMDMA=y
-
-#
-# SATA SFF controllers with BMDMA
-#
 CONFIG_ATA_PIIX=y
-# CONFIG_SATA_DWC is not set
-# CONFIG_SATA_MV is not set
-# CONFIG_SATA_NV is not set
-# CONFIG_SATA_PROMISE is not set
-# CONFIG_SATA_SIL is not set
-# CONFIG_SATA_SIS is not set
-# CONFIG_SATA_SVW is not set
-# CONFIG_SATA_ULI is not set
-# CONFIG_SATA_VIA is not set
-# CONFIG_SATA_VITESSE is not set
-
-#
-# PATA SFF controllers with BMDMA
-#
-# CONFIG_PATA_ALI is not set
 CONFIG_PATA_AMD=y
-# CONFIG_PATA_ARTOP is not set
-# CONFIG_PATA_ATIIXP is not set
-# CONFIG_PATA_ATP867X is not set
-# CONFIG_PATA_CMD64X is not set
-# CONFIG_PATA_CYPRESS is not set
-# CONFIG_PATA_EFAR is not set
-# CONFIG_PATA_HPT366 is not set
-# CONFIG_PATA_HPT37X is not set
-# CONFIG_PATA_HPT3X2N is not set
-# CONFIG_PATA_HPT3X3 is not set
-# CONFIG_PATA_IT8213 is not set
-# CONFIG_PATA_IT821X is not set
-# CONFIG_PATA_JMICRON is not set
-# CONFIG_PATA_MARVELL is not set
-# CONFIG_PATA_NETCELL is not set
-# CONFIG_PATA_NINJA32 is not set
-# CONFIG_PATA_NS87415 is not set
 CONFIG_PATA_OLDPIIX=y
-# CONFIG_PATA_OPTIDMA is not set
-# CONFIG_PATA_PDC2027X is not set
-# CONFIG_PATA_PDC_OLD is not set
-# CONFIG_PATA_RADISYS is not set
-# CONFIG_PATA_RDC is not set
 CONFIG_PATA_SCH=y
-# CONFIG_PATA_SERVERWORKS is not set
-# CONFIG_PATA_SIL680 is not set
-# CONFIG_PATA_SIS is not set
-# CONFIG_PATA_TOSHIBA is not set
-# CONFIG_PATA_TRIFLEX is not set
-# CONFIG_PATA_VIA is not set
-# CONFIG_PATA_WINBOND is not set
-
-#
-# PIO-only SFF controllers
-#
-# CONFIG_PATA_CMD640_PCI is not set
-# CONFIG_PATA_MPIIX is not set
-# CONFIG_PATA_NS87410 is not set
-# CONFIG_PATA_OPTI is not set
-# CONFIG_PATA_PCMCIA is not set
-# CONFIG_PATA_RZ1000 is not set
-
-#
-# Generic fallback / legacy drivers
-#
-# CONFIG_PATA_ACPI is not set
-# CONFIG_ATA_GENERIC is not set
-# CONFIG_PATA_LEGACY is not set
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=y
-CONFIG_MD_AUTODETECT=y
-# CONFIG_MD_LINEAR is not set
-# CONFIG_MD_RAID0 is not set
-# CONFIG_MD_RAID1 is not set
-# CONFIG_MD_RAID10 is not set
-# CONFIG_MD_RAID456 is not set
-# CONFIG_MD_MULTIPATH is not set
-# CONFIG_MD_FAULTY is not set
-# CONFIG_BCACHE is not set
-CONFIG_BLK_DEV_DM_BUILTIN=y
 CONFIG_BLK_DEV_DM=y
-# CONFIG_DM_MQ_DEFAULT is not set
-# CONFIG_DM_DEBUG is not set
-# CONFIG_DM_CRYPT is not set
-# CONFIG_DM_SNAPSHOT is not set
-# CONFIG_DM_THIN_PROVISIONING is not set
-# CONFIG_DM_CACHE is not set
-# CONFIG_DM_ERA is not set
 CONFIG_DM_MIRROR=y
-# CONFIG_DM_LOG_USERSPACE is not set
-# CONFIG_DM_RAID is not set
 CONFIG_DM_ZERO=y
-# CONFIG_DM_MULTIPATH is not set
-# CONFIG_DM_DELAY is not set
-# CONFIG_DM_UEVENT is not set
-# CONFIG_DM_FLAKEY is not set
-# CONFIG_DM_VERITY is not set
-# CONFIG_DM_SWITCH is not set
-# CONFIG_DM_LOG_WRITES is not set
-# CONFIG_DM_INTEGRITY is not set
-# CONFIG_TARGET_CORE is not set
-# CONFIG_FUSION is not set
-
-#
-# IEEE 1394 (FireWire) support
-#
-# CONFIG_FIREWIRE is not set
-# CONFIG_FIREWIRE_NOSY is not set
 CONFIG_MACINTOSH_DRIVERS=y
 CONFIG_MAC_EMUMOUSEBTN=y
 CONFIG_NETDEVICES=y
-CONFIG_MII=y
-CONFIG_NET_CORE=y
-# CONFIG_BONDING is not set
-# CONFIG_DUMMY is not set
-# CONFIG_EQUALIZER is not set
-# CONFIG_NET_FC is not set
-# CONFIG_IFB is not set
-# CONFIG_NET_TEAM is not set
-# CONFIG_MACVLAN is not set
-# CONFIG_VXLAN is not set
-# CONFIG_MACSEC is not set
 CONFIG_NETCONSOLE=y
-CONFIG_NETPOLL=y
-CONFIG_NET_POLL_CONTROLLER=y
-# CONFIG_TUN is not set
-# CONFIG_TUN_VNET_CROSS_LE is not set
-# CONFIG_VETH is not set
-# CONFIG_NLMON is not set
-# CONFIG_ARCNET is not set
-
-#
-# CAIF transport drivers
-#
-
-#
-# Distributed Switch Architecture drivers
-#
-CONFIG_ETHERNET=y
-CONFIG_NET_VENDOR_3COM=y
-# CONFIG_PCMCIA_3C574 is not set
-# CONFIG_PCMCIA_3C589 is not set
-# CONFIG_VORTEX is not set
-# CONFIG_TYPHOON is not set
-CONFIG_NET_VENDOR_ADAPTEC=y
-# CONFIG_ADAPTEC_STARFIRE is not set
-CONFIG_NET_VENDOR_AGERE=y
-# CONFIG_ET131X is not set
-CONFIG_NET_VENDOR_ALACRITECH=y
-# CONFIG_SLICOSS is not set
-CONFIG_NET_VENDOR_ALTEON=y
-# CONFIG_ACENIC is not set
-# CONFIG_ALTERA_TSE is not set
-CONFIG_NET_VENDOR_AMAZON=y
-# CONFIG_ENA_ETHERNET is not set
-CONFIG_NET_VENDOR_AMD=y
-# CONFIG_AMD8111_ETH is not set
-# CONFIG_PCNET32 is not set
-# CONFIG_PCMCIA_NMCLAN is not set
-# CONFIG_AMD_XGBE is not set
-# CONFIG_AMD_XGBE_HAVE_ECC is not set
-CONFIG_NET_VENDOR_AQUANTIA=y
-# CONFIG_AQTION is not set
-CONFIG_NET_VENDOR_ARC=y
-CONFIG_NET_VENDOR_ATHEROS=y
-# CONFIG_ATL2 is not set
-# CONFIG_ATL1 is not set
-# CONFIG_ATL1E is not set
-# CONFIG_ATL1C is not set
-# CONFIG_ALX is not set
 # CONFIG_NET_VENDOR_AURORA is not set
-CONFIG_NET_CADENCE=y
-# CONFIG_MACB is not set
-CONFIG_NET_VENDOR_BROADCOM=y
-# CONFIG_B44 is not set
-# CONFIG_BCMGENET is not set
-# CONFIG_BNX2 is not set
-# CONFIG_CNIC is not set
 CONFIG_TIGON3=y
-CONFIG_TIGON3_HWMON=y
-# CONFIG_BNX2X is not set
-# CONFIG_BNXT is not set
-CONFIG_NET_VENDOR_BROCADE=y
-# CONFIG_BNA is not set
-CONFIG_NET_VENDOR_CAVIUM=y
-# CONFIG_THUNDER_NIC_PF is not set
-# CONFIG_THUNDER_NIC_VF is not set
-# CONFIG_THUNDER_NIC_BGX is not set
-# CONFIG_THUNDER_NIC_RGX is not set
-# CONFIG_LIQUIDIO is not set
-# CONFIG_LIQUIDIO_VF is not set
-CONFIG_NET_VENDOR_CHELSIO=y
-# CONFIG_CHELSIO_T1 is not set
-# CONFIG_CHELSIO_T3 is not set
-# CONFIG_CHELSIO_T4 is not set
-# CONFIG_CHELSIO_T4VF is not set
-CONFIG_NET_VENDOR_CISCO=y
-# CONFIG_ENIC is not set
-# CONFIG_CX_ECAT is not set
-# CONFIG_DNET is not set
-CONFIG_NET_VENDOR_DEC=y
 CONFIG_NET_TULIP=y
-# CONFIG_DE2104X is not set
-# CONFIG_TULIP is not set
-# CONFIG_DE4X5 is not set
-# CONFIG_WINBOND_840 is not set
-# CONFIG_DM9102 is not set
-# CONFIG_ULI526X is not set
-# CONFIG_PCMCIA_XIRCOM is not set
-CONFIG_NET_VENDOR_DLINK=y
-# CONFIG_DL2K is not set
-# CONFIG_SUNDANCE is not set
-CONFIG_NET_VENDOR_EMULEX=y
-# CONFIG_BE2NET is not set
-CONFIG_NET_VENDOR_EZCHIP=y
-CONFIG_NET_VENDOR_EXAR=y
-# CONFIG_S2IO is not set
-# CONFIG_VXGE is not set
-CONFIG_NET_VENDOR_FUJITSU=y
-# CONFIG_PCMCIA_FMVJ18X is not set
-CONFIG_NET_VENDOR_HP=y
-# CONFIG_HP100 is not set
-CONFIG_NET_VENDOR_INTEL=y
 CONFIG_E100=y
 CONFIG_E1000=y
-# CONFIG_E1000E is not set
-# CONFIG_IGB is not set
-# CONFIG_IGBVF is not set
-# CONFIG_IXGB is not set
-# CONFIG_IXGBE is not set
-# CONFIG_IXGBEVF is not set
-# CONFIG_I40E is not set
-# CONFIG_I40EVF is not set
-# CONFIG_FM10K is not set
-CONFIG_NET_VENDOR_I825XX=y
-# CONFIG_JME is not set
-CONFIG_NET_VENDOR_MARVELL=y
-# CONFIG_MVMDIO is not set
-# CONFIG_SKGE is not set
 CONFIG_SKY2=y
-# CONFIG_SKY2_DEBUG is not set
-CONFIG_NET_VENDOR_MELLANOX=y
-# CONFIG_MLX4_EN is not set
-# CONFIG_MLX4_CORE is not set
-# CONFIG_MLX5_CORE is not set
-# CONFIG_MLXSW_CORE is not set
-# CONFIG_MLXFW is not set
-CONFIG_NET_VENDOR_MICREL=y
-# CONFIG_KS8842 is not set
-# CONFIG_KS8851_MLL is not set
-# CONFIG_KSZ884X_PCI is not set
-CONFIG_NET_VENDOR_MYRI=y
-# CONFIG_MYRI10GE is not set
-# CONFIG_FEALNX is not set
-CONFIG_NET_VENDOR_NATSEMI=y
-# CONFIG_NATSEMI is not set
-# CONFIG_NS83820 is not set
-CONFIG_NET_VENDOR_NETRONOME=y
-# CONFIG_NFP is not set
-CONFIG_NET_VENDOR_8390=y
-# CONFIG_PCMCIA_AXNET is not set
-# CONFIG_NE2K_PCI is not set
-# CONFIG_PCMCIA_PCNET is not set
-CONFIG_NET_VENDOR_NVIDIA=y
 CONFIG_FORCEDETH=y
-CONFIG_NET_VENDOR_OKI=y
-# CONFIG_ETHOC is not set
-CONFIG_NET_PACKET_ENGINE=y
-# CONFIG_HAMACHI is not set
-# CONFIG_YELLOWFIN is not set
-CONFIG_NET_VENDOR_QLOGIC=y
-# CONFIG_QLA3XXX is not set
-# CONFIG_QLCNIC is not set
-# CONFIG_QLGE is not set
-# CONFIG_NETXEN_NIC is not set
-# CONFIG_QED is not set
-CONFIG_NET_VENDOR_QUALCOMM=y
-# CONFIG_QCOM_EMAC is not set
-CONFIG_NET_VENDOR_REALTEK=y
-# CONFIG_8139CP is not set
 CONFIG_8139TOO=y
-CONFIG_8139TOO_PIO=y
-# CONFIG_8139TOO_TUNE_TWISTER is not set
-# CONFIG_8139TOO_8129 is not set
-# CONFIG_8139_OLD_RX_RESET is not set
-# CONFIG_R8169 is not set
-CONFIG_NET_VENDOR_RENESAS=y
-CONFIG_NET_VENDOR_RDC=y
-# CONFIG_R6040 is not set
-CONFIG_NET_VENDOR_ROCKER=y
-CONFIG_NET_VENDOR_SAMSUNG=y
-# CONFIG_SXGBE_ETH is not set
-CONFIG_NET_VENDOR_SEEQ=y
-CONFIG_NET_VENDOR_SILAN=y
-# CONFIG_SC92031 is not set
-CONFIG_NET_VENDOR_SIS=y
-# CONFIG_SIS900 is not set
-# CONFIG_SIS190 is not set
-CONFIG_NET_VENDOR_SOLARFLARE=y
-# CONFIG_SFC is not set
-# CONFIG_SFC_FALCON is not set
-CONFIG_NET_VENDOR_SMSC=y
-# CONFIG_PCMCIA_SMC91C92 is not set
-# CONFIG_EPIC100 is not set
-# CONFIG_SMSC911X is not set
-# CONFIG_SMSC9420 is not set
-CONFIG_NET_VENDOR_STMICRO=y
-# CONFIG_STMMAC_ETH is not set
-CONFIG_NET_VENDOR_SUN=y
-# CONFIG_HAPPYMEAL is not set
-# CONFIG_SUNGEM is not set
-# CONFIG_CASSINI is not set
-# CONFIG_NIU is not set
-CONFIG_NET_VENDOR_TEHUTI=y
-# CONFIG_TEHUTI is not set
-CONFIG_NET_VENDOR_TI=y
-# CONFIG_TI_CPSW_ALE is not set
-# CONFIG_TLAN is not set
-CONFIG_NET_VENDOR_VIA=y
-# CONFIG_VIA_RHINE is not set
-# CONFIG_VIA_VELOCITY is not set
-CONFIG_NET_VENDOR_WIZNET=y
-# CONFIG_WIZNET_W5100 is not set
-# CONFIG_WIZNET_W5300 is not set
-CONFIG_NET_VENDOR_XIRCOM=y
-# CONFIG_PCMCIA_XIRC2PS is not set
-CONFIG_NET_VENDOR_SYNOPSYS=y
-# CONFIG_DWC_XLGMAC is not set
 CONFIG_FDDI=y
-# CONFIG_DEFXX is not set
-# CONFIG_SKFP is not set
-# CONFIG_HIPPI is not set
-# CONFIG_NET_SB1000 is not set
-CONFIG_MDIO_DEVICE=y
-CONFIG_MDIO_BUS=y
-# CONFIG_MDIO_BITBANG is not set
-# CONFIG_MDIO_THUNDER is not set
-CONFIG_PHYLIB=y
-# CONFIG_LED_TRIGGER_PHY is not set
-
-#
-# MII PHY device drivers
-#
-# CONFIG_AMD_PHY is not set
-# CONFIG_AQUANTIA_PHY is not set
-# CONFIG_AT803X_PHY is not set
-# CONFIG_BCM7XXX_PHY is not set
-# CONFIG_BCM87XX_PHY is not set
-# CONFIG_BROADCOM_PHY is not set
-# CONFIG_CICADA_PHY is not set
-# CONFIG_CORTINA_PHY is not set
-# CONFIG_DAVICOM_PHY is not set
-# CONFIG_DP83848_PHY is not set
-# CONFIG_DP83867_PHY is not set
-# CONFIG_FIXED_PHY is not set
-# CONFIG_ICPLUS_PHY is not set
-# CONFIG_INTEL_XWAY_PHY is not set
-# CONFIG_LSI_ET1011C_PHY is not set
-# CONFIG_LXT_PHY is not set
-# CONFIG_MARVELL_PHY is not set
-# CONFIG_MARVELL_10G_PHY is not set
-# CONFIG_MICREL_PHY is not set
-# CONFIG_MICROCHIP_PHY is not set
-# CONFIG_MICROSEMI_PHY is not set
-# CONFIG_NATIONAL_PHY is not set
-# CONFIG_QSEMI_PHY is not set
-# CONFIG_REALTEK_PHY is not set
-# CONFIG_SMSC_PHY is not set
-# CONFIG_STE10XP is not set
-# CONFIG_TERANETICS_PHY is not set
-# CONFIG_VITESSE_PHY is not set
-# CONFIG_XILINX_GMII2RGMII is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-CONFIG_USB_NET_DRIVERS=y
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-# CONFIG_USB_RTL8152 is not set
-# CONFIG_USB_LAN78XX is not set
-# CONFIG_USB_USBNET is not set
-# CONFIG_USB_HSO is not set
-# CONFIG_USB_IPHETH is not set
-CONFIG_WLAN=y
-CONFIG_WLAN_VENDOR_ADMTEK=y
-# CONFIG_ADM8211 is not set
-CONFIG_WLAN_VENDOR_ATH=y
-# CONFIG_ATH_DEBUG is not set
-# CONFIG_ATH5K is not set
-# CONFIG_ATH5K_PCI is not set
-# CONFIG_ATH9K is not set
-# CONFIG_ATH9K_HTC is not set
-# CONFIG_CARL9170 is not set
-# CONFIG_ATH6KL is not set
-# CONFIG_AR5523 is not set
-# CONFIG_WIL6210 is not set
-# CONFIG_ATH10K is not set
-# CONFIG_WCN36XX is not set
-CONFIG_WLAN_VENDOR_ATMEL=y
-# CONFIG_ATMEL is not set
-# CONFIG_AT76C50X_USB is not set
-CONFIG_WLAN_VENDOR_BROADCOM=y
-# CONFIG_B43 is not set
-# CONFIG_B43LEGACY is not set
-# CONFIG_BRCMSMAC is not set
-# CONFIG_BRCMFMAC is not set
-CONFIG_WLAN_VENDOR_CISCO=y
-# CONFIG_AIRO is not set
-# CONFIG_AIRO_CS is not set
-CONFIG_WLAN_VENDOR_INTEL=y
-# CONFIG_IPW2100 is not set
-# CONFIG_IPW2200 is not set
-# CONFIG_IWL4965 is not set
-# CONFIG_IWL3945 is not set
-# CONFIG_IWLWIFI is not set
-CONFIG_WLAN_VENDOR_INTERSIL=y
-# CONFIG_HOSTAP is not set
-# CONFIG_HERMES is not set
-# CONFIG_P54_COMMON is not set
-# CONFIG_PRISM54 is not set
-CONFIG_WLAN_VENDOR_MARVELL=y
-# CONFIG_LIBERTAS is not set
-# CONFIG_LIBERTAS_THINFIRM is not set
-# CONFIG_MWIFIEX is not set
-# CONFIG_MWL8K is not set
-CONFIG_WLAN_VENDOR_MEDIATEK=y
-# CONFIG_MT7601U is not set
-CONFIG_WLAN_VENDOR_RALINK=y
-# CONFIG_RT2X00 is not set
-CONFIG_WLAN_VENDOR_REALTEK=y
-# CONFIG_RTL8180 is not set
-# CONFIG_RTL8187 is not set
-CONFIG_RTL_CARDS=y
-# CONFIG_RTL8192CE is not set
-# CONFIG_RTL8192SE is not set
-# CONFIG_RTL8192DE is not set
-# CONFIG_RTL8723AE is not set
-# CONFIG_RTL8723BE is not set
-# CONFIG_RTL8188EE is not set
-# CONFIG_RTL8192EE is not set
-# CONFIG_RTL8821AE is not set
-# CONFIG_RTL8192CU is not set
-# CONFIG_RTL8XXXU is not set
-CONFIG_WLAN_VENDOR_RSI=y
-# CONFIG_RSI_91X is not set
-CONFIG_WLAN_VENDOR_ST=y
-# CONFIG_CW1200 is not set
-CONFIG_WLAN_VENDOR_TI=y
-# CONFIG_WL1251 is not set
-# CONFIG_WL12XX is not set
-# CONFIG_WL18XX is not set
-# CONFIG_WLCORE is not set
-CONFIG_WLAN_VENDOR_ZYDAS=y
-# CONFIG_USB_ZD1201 is not set
-# CONFIG_ZD1211RW is not set
-CONFIG_WLAN_VENDOR_QUANTENNA=y
-# CONFIG_QTNFMAC_PEARL_PCIE is not set
-# CONFIG_PCMCIA_RAYCS is not set
-# CONFIG_PCMCIA_WL3501 is not set
-# CONFIG_MAC80211_HWSIM is not set
-# CONFIG_USB_NET_RNDIS_WLAN is not set
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
-# CONFIG_WAN is not set
-# CONFIG_VMXNET3 is not set
-# CONFIG_FUJITSU_ES is not set
-# CONFIG_ISDN is not set
-# CONFIG_NVM is not set
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-CONFIG_INPUT_LEDS=y
-CONFIG_INPUT_FF_MEMLESS=y
 CONFIG_INPUT_POLLDEV=y
-CONFIG_INPUT_SPARSEKMAP=y
-# CONFIG_INPUT_MATRIXKMAP is not set
-
-#
-# Userland interfaces
-#
 CONFIG_INPUT_MOUSEDEV=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
-# CONFIG_INPUT_JOYDEV is not set
 CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_EVBUG is not set
-
-#
-# Input Device Drivers
-#
-CONFIG_INPUT_KEYBOARD=y
-# CONFIG_KEYBOARD_ADP5588 is not set
-# CONFIG_KEYBOARD_ADP5589 is not set
-CONFIG_KEYBOARD_ATKBD=y
-# CONFIG_KEYBOARD_QT1070 is not set
-# CONFIG_KEYBOARD_QT2160 is not set
-# CONFIG_KEYBOARD_DLINK_DIR685 is not set
-# CONFIG_KEYBOARD_LKKBD is not set
-# CONFIG_KEYBOARD_TCA6416 is not set
-# CONFIG_KEYBOARD_TCA8418 is not set
-# CONFIG_KEYBOARD_LM8323 is not set
-# CONFIG_KEYBOARD_LM8333 is not set
-# CONFIG_KEYBOARD_MAX7359 is not set
-# CONFIG_KEYBOARD_MCS is not set
-# CONFIG_KEYBOARD_MPR121 is not set
-# CONFIG_KEYBOARD_NEWTON is not set
-# CONFIG_KEYBOARD_OPENCORES is not set
-# CONFIG_KEYBOARD_SAMSUNG is not set
-# CONFIG_KEYBOARD_STOWAWAY is not set
-# CONFIG_KEYBOARD_SUNKBD is not set
-# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
-# CONFIG_KEYBOARD_XTKBD is not set
-CONFIG_INPUT_MOUSE=y
-CONFIG_MOUSE_PS2=y
-CONFIG_MOUSE_PS2_ALPS=y
-CONFIG_MOUSE_PS2_BYD=y
-CONFIG_MOUSE_PS2_LOGIPS2PP=y
-CONFIG_MOUSE_PS2_SYNAPTICS=y
-CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
-CONFIG_MOUSE_PS2_CYPRESS=y
-CONFIG_MOUSE_PS2_LIFEBOOK=y
-CONFIG_MOUSE_PS2_TRACKPOINT=y
-# CONFIG_MOUSE_PS2_ELANTECH is not set
-# CONFIG_MOUSE_PS2_SENTELIC is not set
-# CONFIG_MOUSE_PS2_TOUCHKIT is not set
-CONFIG_MOUSE_PS2_FOCALTECH=y
-CONFIG_MOUSE_PS2_SMBUS=y
-# CONFIG_MOUSE_SERIAL is not set
-# CONFIG_MOUSE_APPLETOUCH is not set
-# CONFIG_MOUSE_BCM5974 is not set
-# CONFIG_MOUSE_CYAPA is not set
-# CONFIG_MOUSE_ELAN_I2C is not set
-# CONFIG_MOUSE_VSXXXAA is not set
-# CONFIG_MOUSE_SYNAPTICS_I2C is not set
-# CONFIG_MOUSE_SYNAPTICS_USB is not set
 CONFIG_INPUT_JOYSTICK=y
-# CONFIG_JOYSTICK_ANALOG is not set
-# CONFIG_JOYSTICK_A3D is not set
-# CONFIG_JOYSTICK_ADI is not set
-# CONFIG_JOYSTICK_COBRA is not set
-# CONFIG_JOYSTICK_GF2K is not set
-# CONFIG_JOYSTICK_GRIP is not set
-# CONFIG_JOYSTICK_GRIP_MP is not set
-# CONFIG_JOYSTICK_GUILLEMOT is not set
-# CONFIG_JOYSTICK_INTERACT is not set
-# CONFIG_JOYSTICK_SIDEWINDER is not set
-# CONFIG_JOYSTICK_TMDC is not set
-# CONFIG_JOYSTICK_IFORCE is not set
-# CONFIG_JOYSTICK_WARRIOR is not set
-# CONFIG_JOYSTICK_MAGELLAN is not set
-# CONFIG_JOYSTICK_SPACEORB is not set
-# CONFIG_JOYSTICK_SPACEBALL is not set
-# CONFIG_JOYSTICK_STINGER is not set
-# CONFIG_JOYSTICK_TWIDJOY is not set
-# CONFIG_JOYSTICK_ZHENHUA is not set
-# CONFIG_JOYSTICK_AS5011 is not set
-# CONFIG_JOYSTICK_JOYDUMP is not set
-# CONFIG_JOYSTICK_XPAD is not set
 CONFIG_INPUT_TABLET=y
-# CONFIG_TABLET_USB_ACECAD is not set
-# CONFIG_TABLET_USB_AIPTEK is not set
-# CONFIG_TABLET_USB_GTCO is not set
-# CONFIG_TABLET_USB_HANWANG is not set
-# CONFIG_TABLET_USB_KBTAB is not set
-# CONFIG_TABLET_USB_PEGASUS is not set
-# CONFIG_TABLET_SERIAL_WACOM4 is not set
 CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_PROPERTIES=y
-# CONFIG_TOUCHSCREEN_AD7879 is not set
-# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
-# CONFIG_TOUCHSCREEN_BU21013 is not set
-# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
-# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
-# CONFIG_TOUCHSCREEN_DYNAPRO is not set
-# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
-# CONFIG_TOUCHSCREEN_EETI is not set
-# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
-# CONFIG_TOUCHSCREEN_FUJITSU is not set
-# CONFIG_TOUCHSCREEN_ILI210X is not set
-# CONFIG_TOUCHSCREEN_GUNZE is not set
-# CONFIG_TOUCHSCREEN_EKTF2127 is not set
-# CONFIG_TOUCHSCREEN_ELAN is not set
-# CONFIG_TOUCHSCREEN_ELO is not set
-# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
-# CONFIG_TOUCHSCREEN_WACOM_I2C is not set
-# CONFIG_TOUCHSCREEN_MAX11801 is not set
-# CONFIG_TOUCHSCREEN_MCS5000 is not set
-# CONFIG_TOUCHSCREEN_MMS114 is not set
-# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
-# CONFIG_TOUCHSCREEN_MTOUCH is not set
-# CONFIG_TOUCHSCREEN_INEXIO is not set
-# CONFIG_TOUCHSCREEN_MK712 is not set
-# CONFIG_TOUCHSCREEN_PENMOUNT is not set
-# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
-# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
-# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
-# CONFIG_TOUCHSCREEN_PIXCIR is not set
-# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
-# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
-# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
-# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
-# CONFIG_TOUCHSCREEN_TSC2004 is not set
-# CONFIG_TOUCHSCREEN_TSC2007 is not set
-# CONFIG_TOUCHSCREEN_SILEAD is not set
-# CONFIG_TOUCHSCREEN_ST1232 is not set
-# CONFIG_TOUCHSCREEN_STMFTS is not set
-# CONFIG_TOUCHSCREEN_SX8654 is not set
-# CONFIG_TOUCHSCREEN_TPS6507X is not set
-# CONFIG_TOUCHSCREEN_ZET6223 is not set
-# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
 CONFIG_INPUT_MISC=y
-# CONFIG_INPUT_AD714X is not set
-# CONFIG_INPUT_BMA150 is not set
-# CONFIG_INPUT_E3X0_BUTTON is not set
-# CONFIG_INPUT_PCSPKR is not set
-# CONFIG_INPUT_MMA8450 is not set
-# CONFIG_INPUT_APANEL is not set
-# CONFIG_INPUT_ATLAS_BTNS is not set
-# CONFIG_INPUT_ATI_REMOTE2 is not set
-# CONFIG_INPUT_KEYSPAN_REMOTE is not set
-# CONFIG_INPUT_KXTJ9 is not set
-# CONFIG_INPUT_POWERMATE is not set
-# CONFIG_INPUT_YEALINK is not set
-# CONFIG_INPUT_CM109 is not set
-# CONFIG_INPUT_UINPUT is not set
-# CONFIG_INPUT_PCF8574 is not set
-# CONFIG_INPUT_ADXL34X is not set
-# CONFIG_INPUT_IMS_PCU is not set
-# CONFIG_INPUT_CMA3000 is not set
-# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
-# CONFIG_INPUT_DRV2665_HAPTICS is not set
-# CONFIG_INPUT_DRV2667_HAPTICS is not set
-# CONFIG_RMI4_CORE is not set
-
-#
-# Hardware I/O ports
-#
-CONFIG_SERIO=y
-CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
-CONFIG_SERIO_I8042=y
-CONFIG_SERIO_SERPORT=y
-# CONFIG_SERIO_CT82C710 is not set
-# CONFIG_SERIO_PCIPS2 is not set
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_SERIO_RAW is not set
-# CONFIG_SERIO_ALTERA_PS2 is not set
-# CONFIG_SERIO_PS2MULT is not set
-# CONFIG_SERIO_ARC_PS2 is not set
-# CONFIG_USERIO is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-CONFIG_TTY=y
-CONFIG_VT=y
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE=y
-CONFIG_VT_CONSOLE_SLEEP=y
-CONFIG_HW_CONSOLE=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_UNIX98_PTYS=y
 # CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_NONSTANDARD=y
-# CONFIG_ROCKETPORT is not set
-# CONFIG_CYCLADES is not set
-# CONFIG_MOXA_INTELLIO is not set
-# CONFIG_MOXA_SMARTIO is not set
-# CONFIG_SYNCLINK is not set
-# CONFIG_SYNCLINKMP is not set
-# CONFIG_SYNCLINK_GT is not set
-# CONFIG_NOZOMI is not set
-# CONFIG_ISI is not set
-# CONFIG_N_HDLC is not set
-# CONFIG_N_GSM is not set
-# CONFIG_TRACE_SINK is not set
-CONFIG_DEVMEM=y
-CONFIG_DEVKMEM=y
-
-#
-# Serial drivers
-#
-CONFIG_SERIAL_EARLYCON=y
 CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
-CONFIG_SERIAL_8250_PNP=y
-# CONFIG_SERIAL_8250_FINTEK is not set
 CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_DMA=y
-CONFIG_SERIAL_8250_PCI=y
-CONFIG_SERIAL_8250_EXAR=y
-# CONFIG_SERIAL_8250_CS is not set
 CONFIG_SERIAL_8250_NR_UARTS=32
-CONFIG_SERIAL_8250_RUNTIME_UARTS=4
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_DETECT_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
-# CONFIG_SERIAL_8250_FSL is not set
-# CONFIG_SERIAL_8250_DW is not set
-# CONFIG_SERIAL_8250_RT288X is not set
-CONFIG_SERIAL_8250_LPSS=y
 # CONFIG_SERIAL_8250_MID is not set
-# CONFIG_SERIAL_8250_MOXA is not set
-
-#
-# Non-8250 serial port support
-#
-# CONFIG_SERIAL_UARTLITE is not set
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-# CONFIG_SERIAL_JSM is not set
-# CONFIG_SERIAL_SCCNXP is not set
-# CONFIG_SERIAL_SC16IS7XX is not set
-# CONFIG_SERIAL_ALTERA_JTAGUART is not set
-# CONFIG_SERIAL_ALTERA_UART is not set
-# CONFIG_SERIAL_ARC is not set
-# CONFIG_SERIAL_RP2 is not set
-# CONFIG_SERIAL_FSL_LPUART is not set
-# CONFIG_SERIAL_DEV_BUS is not set
-# CONFIG_IPMI_HANDLER is not set
+CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_HW_RANDOM=y
-# CONFIG_HW_RANDOM_TIMERIOMEM is not set
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
-CONFIG_HW_RANDOM_VIA=y
+CONFIG_DEVKMEM=y
 CONFIG_NVRAM=y
-# CONFIG_R3964 is not set
-# CONFIG_APPLICOM is not set
-
-#
-# PCMCIA character devices
-#
-# CONFIG_SYNCLINK_CS is not set
-# CONFIG_CARDMAN_4000 is not set
-# CONFIG_CARDMAN_4040 is not set
-# CONFIG_SCR24X is not set
-# CONFIG_IPWIRELESS is not set
-# CONFIG_MWAVE is not set
-# CONFIG_RAW_DRIVER is not set
 CONFIG_HPET=y
 # CONFIG_HPET_MMAP is not set
-# CONFIG_HANGCHECK_TIMER is not set
-# CONFIG_TCG_TPM is not set
-# CONFIG_TELCLOCK is not set
-CONFIG_DEVPORT=y
-# CONFIG_XILLYBUS is not set
-
-#
-# I2C support
-#
-CONFIG_I2C=y
-CONFIG_ACPI_I2C_OPREGION=y
-CONFIG_I2C_BOARDINFO=y
-CONFIG_I2C_COMPAT=y
-# CONFIG_I2C_CHARDEV is not set
-# CONFIG_I2C_MUX is not set
-CONFIG_I2C_HELPER_AUTO=y
-CONFIG_I2C_SMBUS=y
-CONFIG_I2C_ALGOBIT=y
-
-#
-# I2C Hardware Bus support
-#
-
-#
-# PC SMBus host controller drivers
-#
-# CONFIG_I2C_ALI1535 is not set
-# CONFIG_I2C_ALI1563 is not set
-# CONFIG_I2C_ALI15X3 is not set
-# CONFIG_I2C_AMD756 is not set
-# CONFIG_I2C_AMD8111 is not set
 CONFIG_I2C_I801=y
-# CONFIG_I2C_ISCH is not set
-# CONFIG_I2C_ISMT is not set
-# CONFIG_I2C_PIIX4 is not set
-# CONFIG_I2C_NFORCE2 is not set
-# CONFIG_I2C_SIS5595 is not set
-# CONFIG_I2C_SIS630 is not set
-# CONFIG_I2C_SIS96X is not set
-# CONFIG_I2C_VIA is not set
-# CONFIG_I2C_VIAPRO is not set
-
-#
-# ACPI drivers
-#
-# CONFIG_I2C_SCMI is not set
-
-#
-# I2C system bus drivers (mostly embedded / system-on-chip)
-#
-# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
-# CONFIG_I2C_DESIGNWARE_PCI is not set
-# CONFIG_I2C_EMEV2 is not set
-# CONFIG_I2C_OCORES is not set
-# CONFIG_I2C_PCA_PLATFORM is not set
-# CONFIG_I2C_PXA_PCI is not set
-# CONFIG_I2C_SIMTEC is not set
-# CONFIG_I2C_XILINX is not set
-
-#
-# External I2C/SMBus adapter drivers
-#
-# CONFIG_I2C_DIOLAN_U2C is not set
-# CONFIG_I2C_PARPORT_LIGHT is not set
-# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
-# CONFIG_I2C_TAOS_EVM is not set
-# CONFIG_I2C_TINY_USB is not set
-
-#
-# Other I2C/SMBus bus drivers
-#
-# CONFIG_I2C_MLXCPLD is not set
-# CONFIG_I2C_STUB is not set
-# CONFIG_I2C_SLAVE is not set
-# CONFIG_I2C_DEBUG_CORE is not set
-# CONFIG_I2C_DEBUG_ALGO is not set
-# CONFIG_I2C_DEBUG_BUS is not set
-# CONFIG_SPI is not set
-# CONFIG_SPMI is not set
-# CONFIG_HSI is not set
-CONFIG_PPS=y
-# CONFIG_PPS_DEBUG is not set
-
-#
-# PPS clients support
-#
-# CONFIG_PPS_CLIENT_KTIMER is not set
-# CONFIG_PPS_CLIENT_LDISC is not set
-# CONFIG_PPS_CLIENT_GPIO is not set
-
-#
-# PPS generators support
-#
-
-#
-# PTP clock support
-#
-CONFIG_PTP_1588_CLOCK=y
-
-#
-# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
-#
-# CONFIG_GPIOLIB is not set
-# CONFIG_W1 is not set
-# CONFIG_POWER_AVS is not set
-# CONFIG_POWER_RESET is not set
-CONFIG_POWER_SUPPLY=y
-# CONFIG_POWER_SUPPLY_DEBUG is not set
-# CONFIG_PDA_POWER is not set
-# CONFIG_TEST_POWER is not set
-# CONFIG_BATTERY_DS2780 is not set
-# CONFIG_BATTERY_DS2781 is not set
-# CONFIG_BATTERY_DS2782 is not set
-# CONFIG_BATTERY_SBS is not set
-# CONFIG_CHARGER_SBS is not set
-# CONFIG_BATTERY_BQ27XXX is not set
-# CONFIG_BATTERY_MAX17040 is not set
-# CONFIG_BATTERY_MAX17042 is not set
-# CONFIG_CHARGER_MAX8903 is not set
-# CONFIG_CHARGER_LP8727 is not set
-# CONFIG_CHARGER_BQ2415X is not set
-# CONFIG_CHARGER_SMB347 is not set
-# CONFIG_BATTERY_GAUGE_LTC2941 is not set
-CONFIG_HWMON=y
-# CONFIG_HWMON_VID is not set
-# CONFIG_HWMON_DEBUG_CHIP is not set
-
-#
-# Native drivers
-#
-# CONFIG_SENSORS_ABITUGURU is not set
-# CONFIG_SENSORS_ABITUGURU3 is not set
-# CONFIG_SENSORS_AD7414 is not set
-# CONFIG_SENSORS_AD7418 is not set
-# CONFIG_SENSORS_ADM1021 is not set
-# CONFIG_SENSORS_ADM1025 is not set
-# CONFIG_SENSORS_ADM1026 is not set
-# CONFIG_SENSORS_ADM1029 is not set
-# CONFIG_SENSORS_ADM1031 is not set
-# CONFIG_SENSORS_ADM9240 is not set
-# CONFIG_SENSORS_ADT7410 is not set
-# CONFIG_SENSORS_ADT7411 is not set
-# CONFIG_SENSORS_ADT7462 is not set
-# CONFIG_SENSORS_ADT7470 is not set
-# CONFIG_SENSORS_ADT7475 is not set
-# CONFIG_SENSORS_ASC7621 is not set
-# CONFIG_SENSORS_K8TEMP is not set
-# CONFIG_SENSORS_K10TEMP is not set
-# CONFIG_SENSORS_FAM15H_POWER is not set
-# CONFIG_SENSORS_APPLESMC is not set
-# CONFIG_SENSORS_ASB100 is not set
-# CONFIG_SENSORS_ASPEED is not set
-# CONFIG_SENSORS_ATXP1 is not set
-# CONFIG_SENSORS_DS620 is not set
-# CONFIG_SENSORS_DS1621 is not set
-# CONFIG_SENSORS_DELL_SMM is not set
-# CONFIG_SENSORS_I5K_AMB is not set
-# CONFIG_SENSORS_F71805F is not set
-# CONFIG_SENSORS_F71882FG is not set
-# CONFIG_SENSORS_F75375S is not set
-# CONFIG_SENSORS_FSCHMD is not set
-# CONFIG_SENSORS_FTSTEUTATES is not set
-# CONFIG_SENSORS_GL518SM is not set
-# CONFIG_SENSORS_GL520SM is not set
-# CONFIG_SENSORS_G760A is not set
-# CONFIG_SENSORS_G762 is not set
-# CONFIG_SENSORS_HIH6130 is not set
-# CONFIG_SENSORS_I5500 is not set
-# CONFIG_SENSORS_CORETEMP is not set
-# CONFIG_SENSORS_IT87 is not set
-# CONFIG_SENSORS_JC42 is not set
-# CONFIG_SENSORS_POWR1220 is not set
-# CONFIG_SENSORS_LINEAGE is not set
-# CONFIG_SENSORS_LTC2945 is not set
-# CONFIG_SENSORS_LTC2990 is not set
-# CONFIG_SENSORS_LTC4151 is not set
-# CONFIG_SENSORS_LTC4215 is not set
-# CONFIG_SENSORS_LTC4222 is not set
-# CONFIG_SENSORS_LTC4245 is not set
-# CONFIG_SENSORS_LTC4260 is not set
-# CONFIG_SENSORS_LTC4261 is not set
-# CONFIG_SENSORS_MAX16065 is not set
-# CONFIG_SENSORS_MAX1619 is not set
-# CONFIG_SENSORS_MAX1668 is not set
-# CONFIG_SENSORS_MAX197 is not set
-# CONFIG_SENSORS_MAX6639 is not set
-# CONFIG_SENSORS_MAX6642 is not set
-# CONFIG_SENSORS_MAX6650 is not set
-# CONFIG_SENSORS_MAX6697 is not set
-# CONFIG_SENSORS_MAX31790 is not set
-# CONFIG_SENSORS_MCP3021 is not set
-# CONFIG_SENSORS_TC654 is not set
-# CONFIG_SENSORS_LM63 is not set
-# CONFIG_SENSORS_LM73 is not set
-# CONFIG_SENSORS_LM75 is not set
-# CONFIG_SENSORS_LM77 is not set
-# CONFIG_SENSORS_LM78 is not set
-# CONFIG_SENSORS_LM80 is not set
-# CONFIG_SENSORS_LM83 is not set
-# CONFIG_SENSORS_LM85 is not set
-# CONFIG_SENSORS_LM87 is not set
-# CONFIG_SENSORS_LM90 is not set
-# CONFIG_SENSORS_LM92 is not set
-# CONFIG_SENSORS_LM93 is not set
-# CONFIG_SENSORS_LM95234 is not set
-# CONFIG_SENSORS_LM95241 is not set
-# CONFIG_SENSORS_LM95245 is not set
-# CONFIG_SENSORS_PC87360 is not set
-# CONFIG_SENSORS_PC87427 is not set
-# CONFIG_SENSORS_NTC_THERMISTOR is not set
-# CONFIG_SENSORS_NCT6683 is not set
-# CONFIG_SENSORS_NCT6775 is not set
-# CONFIG_SENSORS_NCT7802 is not set
-# CONFIG_SENSORS_NCT7904 is not set
-# CONFIG_SENSORS_PCF8591 is not set
-# CONFIG_PMBUS is not set
-# CONFIG_SENSORS_SHT21 is not set
-# CONFIG_SENSORS_SHT3x is not set
-# CONFIG_SENSORS_SHTC1 is not set
-# CONFIG_SENSORS_SIS5595 is not set
-# CONFIG_SENSORS_DME1737 is not set
-# CONFIG_SENSORS_EMC1403 is not set
-# CONFIG_SENSORS_EMC2103 is not set
-# CONFIG_SENSORS_EMC6W201 is not set
-# CONFIG_SENSORS_SMSC47M1 is not set
-# CONFIG_SENSORS_SMSC47M192 is not set
-# CONFIG_SENSORS_SMSC47B397 is not set
-# CONFIG_SENSORS_SCH56XX_COMMON is not set
-# CONFIG_SENSORS_SCH5627 is not set
-# CONFIG_SENSORS_SCH5636 is not set
-# CONFIG_SENSORS_STTS751 is not set
-# CONFIG_SENSORS_SMM665 is not set
-# CONFIG_SENSORS_ADC128D818 is not set
-# CONFIG_SENSORS_ADS1015 is not set
-# CONFIG_SENSORS_ADS7828 is not set
-# CONFIG_SENSORS_AMC6821 is not set
-# CONFIG_SENSORS_INA209 is not set
-# CONFIG_SENSORS_INA2XX is not set
-# CONFIG_SENSORS_INA3221 is not set
-# CONFIG_SENSORS_TC74 is not set
-# CONFIG_SENSORS_THMC50 is not set
-# CONFIG_SENSORS_TMP102 is not set
-# CONFIG_SENSORS_TMP103 is not set
-# CONFIG_SENSORS_TMP108 is not set
-# CONFIG_SENSORS_TMP401 is not set
-# CONFIG_SENSORS_TMP421 is not set
-# CONFIG_SENSORS_VIA_CPUTEMP is not set
-# CONFIG_SENSORS_VIA686A is not set
-# CONFIG_SENSORS_VT1211 is not set
-# CONFIG_SENSORS_VT8231 is not set
-# CONFIG_SENSORS_W83781D is not set
-# CONFIG_SENSORS_W83791D is not set
-# CONFIG_SENSORS_W83792D is not set
-# CONFIG_SENSORS_W83793 is not set
-# CONFIG_SENSORS_W83795 is not set
-# CONFIG_SENSORS_W83L785TS is not set
-# CONFIG_SENSORS_W83L786NG is not set
-# CONFIG_SENSORS_W83627HF is not set
-# CONFIG_SENSORS_W83627EHF is not set
-# CONFIG_SENSORS_XGENE is not set
-
-#
-# ACPI drivers
-#
-# CONFIG_SENSORS_ACPI_POWER is not set
-# CONFIG_SENSORS_ATK0110 is not set
-CONFIG_THERMAL=y
-CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
-CONFIG_THERMAL_HWMON=y
-CONFIG_THERMAL_WRITABLE_TRIPS=y
-CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
-# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
-# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
-# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
-# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
-CONFIG_THERMAL_GOV_STEP_WISE=y
-# CONFIG_THERMAL_GOV_BANG_BANG is not set
-CONFIG_THERMAL_GOV_USER_SPACE=y
-# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
-# CONFIG_THERMAL_EMULATION is not set
-# CONFIG_INTEL_POWERCLAMP is not set
-CONFIG_X86_PKG_TEMP_THERMAL=m
-# CONFIG_INTEL_SOC_DTS_THERMAL is not set
-
-#
-# ACPI INT340X thermal drivers
-#
-# CONFIG_INT340X_THERMAL is not set
-# CONFIG_INTEL_PCH_THERMAL is not set
 CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_CORE is not set
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
-# CONFIG_WATCHDOG_SYSFS is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-# CONFIG_WDAT_WDT is not set
-# CONFIG_XILINX_WATCHDOG is not set
-# CONFIG_ZIIRAVE_WATCHDOG is not set
-# CONFIG_CADENCE_WATCHDOG is not set
-# CONFIG_DW_WATCHDOG is not set
-# CONFIG_MAX63XX_WATCHDOG is not set
-# CONFIG_ACQUIRE_WDT is not set
-# CONFIG_ADVANTECH_WDT is not set
-# CONFIG_ALIM1535_WDT is not set
-# CONFIG_ALIM7101_WDT is not set
-# CONFIG_F71808E_WDT is not set
-# CONFIG_SP5100_TCO is not set
-# CONFIG_SBC_FITPC2_WATCHDOG is not set
-# CONFIG_EUROTECH_WDT is not set
-# CONFIG_IB700_WDT is not set
-# CONFIG_IBMASR is not set
-# CONFIG_WAFER_WDT is not set
-# CONFIG_I6300ESB_WDT is not set
-# CONFIG_IE6XX_WDT is not set
-# CONFIG_ITCO_WDT is not set
-# CONFIG_IT8712F_WDT is not set
-# CONFIG_IT87_WDT is not set
-# CONFIG_HP_WATCHDOG is not set
-# CONFIG_SC1200_WDT is not set
-# CONFIG_PC87413_WDT is not set
-# CONFIG_NV_TCO is not set
-# CONFIG_60XX_WDT is not set
-# CONFIG_CPU5_WDT is not set
-# CONFIG_SMSC_SCH311X_WDT is not set
-# CONFIG_SMSC37B787_WDT is not set
-# CONFIG_VIA_WDT is not set
-# CONFIG_W83627HF_WDT is not set
-# CONFIG_W83877F_WDT is not set
-# CONFIG_W83977F_WDT is not set
-# CONFIG_MACHZ_WDT is not set
-# CONFIG_SBC_EPX_C3_WATCHDOG is not set
-# CONFIG_NI903X_WDT is not set
-# CONFIG_NIC7018_WDT is not set
-
-#
-# PCI-based Watchdog Cards
-#
-# CONFIG_PCIPCWATCHDOG is not set
-# CONFIG_WDTPCI is not set
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
-
-#
-# Watchdog Pretimeout Governors
-#
-# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-CONFIG_BCMA_POSSIBLE=y
-
-#
-# Broadcom specific AMBA
-#
-# CONFIG_BCMA is not set
-
-#
-# Multifunction device drivers
-#
-# CONFIG_MFD_CORE is not set
-# CONFIG_MFD_AS3711 is not set
-# CONFIG_PMIC_ADP5520 is not set
-# CONFIG_MFD_BCM590XX is not set
-# CONFIG_MFD_AXP20X_I2C is not set
-# CONFIG_MFD_CROS_EC is not set
-# CONFIG_PMIC_DA903X is not set
-# CONFIG_MFD_DA9052_I2C is not set
-# CONFIG_MFD_DA9055 is not set
-# CONFIG_MFD_DA9062 is not set
-# CONFIG_MFD_DA9063 is not set
-# CONFIG_MFD_DA9150 is not set
-# CONFIG_MFD_DLN2 is not set
-# CONFIG_MFD_MC13XXX_I2C is not set
-# CONFIG_HTC_PASIC3 is not set
-# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
-# CONFIG_LPC_ICH is not set
-# CONFIG_LPC_SCH is not set
-# CONFIG_INTEL_SOC_PMIC_CHTWC is not set
-# CONFIG_MFD_INTEL_LPSS_ACPI is not set
-# CONFIG_MFD_INTEL_LPSS_PCI is not set
-# CONFIG_MFD_JANZ_CMODIO is not set
-# CONFIG_MFD_KEMPLD is not set
-# CONFIG_MFD_88PM800 is not set
-# CONFIG_MFD_88PM805 is not set
-# CONFIG_MFD_88PM860X is not set
-# CONFIG_MFD_MAX14577 is not set
-# CONFIG_MFD_MAX77693 is not set
-# CONFIG_MFD_MAX77843 is not set
-# CONFIG_MFD_MAX8907 is not set
-# CONFIG_MFD_MAX8925 is not set
-# CONFIG_MFD_MAX8997 is not set
-# CONFIG_MFD_MAX8998 is not set
-# CONFIG_MFD_MT6397 is not set
-# CONFIG_MFD_MENF21BMC is not set
-# CONFIG_MFD_VIPERBOARD is not set
-# CONFIG_MFD_RETU is not set
-# CONFIG_MFD_PCF50633 is not set
-# CONFIG_MFD_RDC321X is not set
-# CONFIG_MFD_RTSX_PCI is not set
-# CONFIG_MFD_RT5033 is not set
-# CONFIG_MFD_RTSX_USB is not set
-# CONFIG_MFD_RC5T583 is not set
-# CONFIG_MFD_SEC_CORE is not set
-# CONFIG_MFD_SI476X_CORE is not set
-# CONFIG_MFD_SM501 is not set
-# CONFIG_MFD_SKY81452 is not set
-# CONFIG_MFD_SMSC is not set
-# CONFIG_ABX500_CORE is not set
-# CONFIG_MFD_SYSCON is not set
-# CONFIG_MFD_TI_AM335X_TSCADC is not set
-# CONFIG_MFD_LP3943 is not set
-# CONFIG_MFD_LP8788 is not set
-# CONFIG_MFD_TI_LMU is not set
-# CONFIG_MFD_PALMAS is not set
-# CONFIG_TPS6105X is not set
-# CONFIG_TPS6507X is not set
-# CONFIG_MFD_TPS65086 is not set
-# CONFIG_MFD_TPS65090 is not set
-# CONFIG_MFD_TPS65217 is not set
-# CONFIG_MFD_TI_LP873X is not set
-# CONFIG_MFD_TPS65218 is not set
-# CONFIG_MFD_TPS6586X is not set
-# CONFIG_MFD_TPS65912_I2C is not set
-# CONFIG_MFD_TPS80031 is not set
-# CONFIG_TWL4030_CORE is not set
-# CONFIG_TWL6040_CORE is not set
-# CONFIG_MFD_WL1273_CORE is not set
-# CONFIG_MFD_LM3533 is not set
-# CONFIG_MFD_TMIO is not set
-# CONFIG_MFD_VX855 is not set
-# CONFIG_MFD_ARIZONA_I2C is not set
-# CONFIG_MFD_WM8400 is not set
-# CONFIG_MFD_WM831X_I2C is not set
-# CONFIG_MFD_WM8350_I2C is not set
-# CONFIG_MFD_WM8994 is not set
-# CONFIG_REGULATOR is not set
-# CONFIG_MEDIA_SUPPORT is not set
-
-#
-# Graphics support
-#
 CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=y
-# CONFIG_AGP_SIS is not set
-# CONFIG_AGP_VIA is not set
-CONFIG_INTEL_GTT=y
-CONFIG_VGA_ARB=y
-CONFIG_VGA_ARB_MAX_GPUS=16
-# CONFIG_VGA_SWITCHEROO is not set
 CONFIG_DRM=y
-CONFIG_DRM_MIPI_DSI=y
-# CONFIG_DRM_DP_AUX_CHARDEV is not set
-# CONFIG_DRM_DEBUG_MM is not set
-# CONFIG_DRM_DEBUG_MM_SELFTEST is not set
-CONFIG_DRM_KMS_HELPER=y
-CONFIG_DRM_KMS_FB_HELPER=y
-CONFIG_DRM_FBDEV_EMULATION=y
-CONFIG_DRM_FBDEV_OVERALLOC=100
-# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
-
-#
-# I2C encoder or helper chips
-#
-# CONFIG_DRM_I2C_CH7006 is not set
-# CONFIG_DRM_I2C_SIL164 is not set
-# CONFIG_DRM_I2C_NXP_TDA998X is not set
-# CONFIG_DRM_RADEON is not set
-# CONFIG_DRM_AMDGPU is not set
-
-#
-# ACP (Audio CoProcessor) Configuration
-#
-# CONFIG_DRM_NOUVEAU is not set
 CONFIG_DRM_I915=y
-# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
-CONFIG_DRM_I915_CAPTURE_ERROR=y
-CONFIG_DRM_I915_COMPRESS_ERROR=y
-CONFIG_DRM_I915_USERPTR=y
-# CONFIG_DRM_I915_GVT is not set
-# CONFIG_DRM_VGEM is not set
-# CONFIG_DRM_VMWGFX is not set
-# CONFIG_DRM_GMA500 is not set
-# CONFIG_DRM_UDL is not set
-# CONFIG_DRM_AST is not set
-# CONFIG_DRM_MGAG200 is not set
-# CONFIG_DRM_CIRRUS_QEMU is not set
-# CONFIG_DRM_QXL is not set
-# CONFIG_DRM_BOCHS is not set
-CONFIG_DRM_PANEL=y
-
-#
-# Display Panels
-#
-CONFIG_DRM_BRIDGE=y
-CONFIG_DRM_PANEL_BRIDGE=y
-
-#
-# Display Interface Bridges
-#
-# CONFIG_DRM_ANALOGIX_ANX78XX is not set
-# CONFIG_DRM_HISI_HIBMC is not set
-# CONFIG_DRM_TINYDRM is not set
-# CONFIG_DRM_LEGACY is not set
-# CONFIG_DRM_LIB_RANDOM is not set
-
-#
-# Frame buffer Devices
-#
-CONFIG_FB=y
-# CONFIG_FIRMWARE_EDID is not set
-CONFIG_FB_CMDLINE=y
-CONFIG_FB_NOTIFY=y
-# CONFIG_FB_DDC is not set
-# CONFIG_FB_BOOT_VESA_SUPPORT is not set
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-CONFIG_FB_SYS_FILLRECT=y
-CONFIG_FB_SYS_COPYAREA=y
-CONFIG_FB_SYS_IMAGEBLIT=y
-# CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
-# CONFIG_FB_FOREIGN_ENDIAN is not set
-CONFIG_FB_SYS_FOPS=y
-CONFIG_FB_DEFERRED_IO=y
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
-
-#
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_CIRRUS is not set
-# CONFIG_FB_PM2 is not set
-# CONFIG_FB_CYBER2000 is not set
-# CONFIG_FB_ARC is not set
-# CONFIG_FB_ASILIANT is not set
-# CONFIG_FB_IMSTT is not set
-# CONFIG_FB_VGA16 is not set
-# CONFIG_FB_UVESA is not set
-# CONFIG_FB_VESA is not set
 CONFIG_FB_EFI=y
-# CONFIG_FB_N411 is not set
-# CONFIG_FB_HGA is not set
-# CONFIG_FB_OPENCORES is not set
-# CONFIG_FB_S1D13XXX is not set
-# CONFIG_FB_NVIDIA is not set
-# CONFIG_FB_RIVA is not set
-# CONFIG_FB_I740 is not set
-# CONFIG_FB_LE80578 is not set
-# CONFIG_FB_MATROX is not set
-# CONFIG_FB_RADEON is not set
-# CONFIG_FB_ATY128 is not set
-# CONFIG_FB_ATY is not set
-# CONFIG_FB_S3 is not set
-# CONFIG_FB_SAVAGE is not set
-# CONFIG_FB_SIS is not set
-# CONFIG_FB_NEOMAGIC is not set
-# CONFIG_FB_KYRO is not set
-# CONFIG_FB_3DFX is not set
-# CONFIG_FB_VOODOO1 is not set
-# CONFIG_FB_VT8623 is not set
-# CONFIG_FB_TRIDENT is not set
-# CONFIG_FB_ARK is not set
-# CONFIG_FB_PM3 is not set
-# CONFIG_FB_CARMINE is not set
-# CONFIG_FB_SMSCUFX is not set
-# CONFIG_FB_UDL is not set
-# CONFIG_FB_IBM_GXT4500 is not set
-# CONFIG_FB_VIRTUAL is not set
-# CONFIG_FB_METRONOME is not set
-# CONFIG_FB_MB862XX is not set
-# CONFIG_FB_BROADSHEET is not set
-# CONFIG_FB_AUO_K190X is not set
-# CONFIG_FB_SIMPLE is not set
-# CONFIG_FB_SM712 is not set
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-CONFIG_BACKLIGHT_GENERIC=y
-# CONFIG_BACKLIGHT_APPLE is not set
-# CONFIG_BACKLIGHT_PM8941_WLED is not set
-# CONFIG_BACKLIGHT_SAHARA is not set
-# CONFIG_BACKLIGHT_ADP8860 is not set
-# CONFIG_BACKLIGHT_ADP8870 is not set
-# CONFIG_BACKLIGHT_LM3639 is not set
-# CONFIG_BACKLIGHT_LV5207LP is not set
-# CONFIG_BACKLIGHT_BD6107 is not set
-# CONFIG_BACKLIGHT_ARCXCNN is not set
-# CONFIG_VGASTATE is not set
-CONFIG_HDMI=y
-
-#
-# Console display driver support
-#
-CONFIG_VGA_CONSOLE=y
-CONFIG_VGACON_SOFT_SCROLLBACK=y
-CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
-# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
-CONFIG_DUMMY_CONSOLE=y
-CONFIG_DUMMY_CONSOLE_COLUMNS=80
-CONFIG_DUMMY_CONSOLE_ROWS=25
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
-# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_LOGO_LINUX_CLUT224=y
 CONFIG_SOUND=y
-CONFIG_SOUND_OSS_CORE=y
-CONFIG_SOUND_OSS_CORE_PRECLAIM=y
 CONFIG_SND=y
-CONFIG_SND_TIMER=y
-CONFIG_SND_PCM=y
-CONFIG_SND_HWDEP=y
-CONFIG_SND_SEQ_DEVICE=y
-CONFIG_SND_JACK=y
-CONFIG_SND_JACK_INPUT_DEV=y
 CONFIG_SND_OSSEMUL=y
 CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
-CONFIG_SND_PCM_OSS_PLUGINS=y
-CONFIG_SND_PCM_TIMER=y
 CONFIG_SND_HRTIMER=y
-# CONFIG_SND_DYNAMIC_MINORS is not set
-CONFIG_SND_SUPPORT_OLD_API=y
-CONFIG_SND_PROC_FS=y
-CONFIG_SND_VERBOSE_PROCFS=y
-# CONFIG_SND_VERBOSE_PRINTK is not set
-# CONFIG_SND_DEBUG is not set
-CONFIG_SND_VMASTER=y
-CONFIG_SND_DMA_SGBUF=y
 CONFIG_SND_SEQUENCER=y
 CONFIG_SND_SEQ_DUMMY=y
 CONFIG_SND_SEQUENCER_OSS=y
-CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
-CONFIG_SND_SEQ_MIDI_EVENT=y
-# CONFIG_SND_SEQ_MIDI is not set
-# CONFIG_SND_OPL3_LIB_SEQ is not set
-# CONFIG_SND_OPL4_LIB_SEQ is not set
-CONFIG_SND_DRIVERS=y
-# CONFIG_SND_PCSP is not set
-# CONFIG_SND_DUMMY is not set
-# CONFIG_SND_ALOOP is not set
-# CONFIG_SND_VIRMIDI is not set
-# CONFIG_SND_MTPAV is not set
-# CONFIG_SND_SERIAL_U16550 is not set
-# CONFIG_SND_MPU401 is not set
-CONFIG_SND_PCI=y
-# CONFIG_SND_AD1889 is not set
-# CONFIG_SND_ALS300 is not set
-# CONFIG_SND_ALS4000 is not set
-# CONFIG_SND_ALI5451 is not set
-# CONFIG_SND_ASIHPI is not set
-# CONFIG_SND_ATIIXP is not set
-# CONFIG_SND_ATIIXP_MODEM is not set
-# CONFIG_SND_AU8810 is not set
-# CONFIG_SND_AU8820 is not set
-# CONFIG_SND_AU8830 is not set
-# CONFIG_SND_AW2 is not set
-# CONFIG_SND_AZT3328 is not set
-# CONFIG_SND_BT87X is not set
-# CONFIG_SND_CA0106 is not set
-# CONFIG_SND_CMIPCI is not set
-# CONFIG_SND_OXYGEN is not set
-# CONFIG_SND_CS4281 is not set
-# CONFIG_SND_CS46XX is not set
-# CONFIG_SND_CTXFI is not set
-# CONFIG_SND_DARLA20 is not set
-# CONFIG_SND_GINA20 is not set
-# CONFIG_SND_LAYLA20 is not set
-# CONFIG_SND_DARLA24 is not set
-# CONFIG_SND_GINA24 is not set
-# CONFIG_SND_LAYLA24 is not set
-# CONFIG_SND_MONA is not set
-# CONFIG_SND_MIA is not set
-# CONFIG_SND_ECHO3G is not set
-# CONFIG_SND_INDIGO is not set
-# CONFIG_SND_INDIGOIO is not set
-# CONFIG_SND_INDIGODJ is not set
-# CONFIG_SND_INDIGOIOX is not set
-# CONFIG_SND_INDIGODJX is not set
-# CONFIG_SND_EMU10K1 is not set
-# CONFIG_SND_EMU10K1_SEQ is not set
-# CONFIG_SND_EMU10K1X is not set
-# CONFIG_SND_ENS1370 is not set
-# CONFIG_SND_ENS1371 is not set
-# CONFIG_SND_ES1938 is not set
-# CONFIG_SND_ES1968 is not set
-# CONFIG_SND_FM801 is not set
-# CONFIG_SND_HDSP is not set
-# CONFIG_SND_HDSPM is not set
-# CONFIG_SND_ICE1712 is not set
-# CONFIG_SND_ICE1724 is not set
-# CONFIG_SND_INTEL8X0 is not set
-# CONFIG_SND_INTEL8X0M is not set
-# CONFIG_SND_KORG1212 is not set
-# CONFIG_SND_LOLA is not set
-# CONFIG_SND_LX6464ES is not set
-# CONFIG_SND_MAESTRO3 is not set
-# CONFIG_SND_MIXART is not set
-# CONFIG_SND_NM256 is not set
-# CONFIG_SND_PCXHR is not set
-# CONFIG_SND_RIPTIDE is not set
-# CONFIG_SND_RME32 is not set
-# CONFIG_SND_RME96 is not set
-# CONFIG_SND_RME9652 is not set
-# CONFIG_SND_SE6X is not set
-# CONFIG_SND_SONICVIBES is not set
-# CONFIG_SND_TRIDENT is not set
-# CONFIG_SND_VIA82XX is not set
-# CONFIG_SND_VIA82XX_MODEM is not set
-# CONFIG_SND_VIRTUOSO is not set
-# CONFIG_SND_VX222 is not set
-# CONFIG_SND_YMFPCI is not set
-
-#
-# HD-Audio
-#
-CONFIG_SND_HDA=y
 CONFIG_SND_HDA_INTEL=y
 CONFIG_SND_HDA_HWDEP=y
-# CONFIG_SND_HDA_RECONFIG is not set
-# CONFIG_SND_HDA_INPUT_BEEP is not set
-# CONFIG_SND_HDA_PATCH_LOADER is not set
-# CONFIG_SND_HDA_CODEC_REALTEK is not set
-# CONFIG_SND_HDA_CODEC_ANALOG is not set
-# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
-# CONFIG_SND_HDA_CODEC_VIA is not set
-# CONFIG_SND_HDA_CODEC_HDMI is not set
-# CONFIG_SND_HDA_CODEC_CIRRUS is not set
-# CONFIG_SND_HDA_CODEC_CONEXANT is not set
-# CONFIG_SND_HDA_CODEC_CA0110 is not set
-# CONFIG_SND_HDA_CODEC_CA0132 is not set
-# CONFIG_SND_HDA_CODEC_CMEDIA is not set
-# CONFIG_SND_HDA_CODEC_SI3054 is not set
-# CONFIG_SND_HDA_GENERIC is not set
-CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
-CONFIG_SND_HDA_CORE=y
-CONFIG_SND_HDA_I915=y
 CONFIG_SND_HDA_PREALLOC_SIZE=64
-CONFIG_SND_USB=y
-# CONFIG_SND_USB_AUDIO is not set
-# CONFIG_SND_USB_UA101 is not set
-# CONFIG_SND_USB_USX2Y is not set
-# CONFIG_SND_USB_CAIAQ is not set
-# CONFIG_SND_USB_US122L is not set
-# CONFIG_SND_USB_6FIRE is not set
-# CONFIG_SND_USB_HIFACE is not set
-# CONFIG_SND_BCD2000 is not set
-# CONFIG_SND_USB_POD is not set
-# CONFIG_SND_USB_PODHD is not set
-# CONFIG_SND_USB_TONEPORT is not set
-# CONFIG_SND_USB_VARIAX is not set
-CONFIG_SND_PCMCIA=y
-# CONFIG_SND_VXPOCKET is not set
-# CONFIG_SND_PDAUDIOCF is not set
-# CONFIG_SND_SOC is not set
-CONFIG_SND_X86=y
-# CONFIG_HDMI_LPE_AUDIO is not set
-
-#
-# HID support
-#
-CONFIG_HID=y
-# CONFIG_HID_BATTERY_STRENGTH is not set
 CONFIG_HIDRAW=y
-# CONFIG_UHID is not set
-CONFIG_HID_GENERIC=y
-
-#
-# Special HID drivers
-#
-CONFIG_HID_A4TECH=y
-# CONFIG_HID_ACCUTOUCH is not set
-# CONFIG_HID_ACRUX is not set
-CONFIG_HID_APPLE=y
-# CONFIG_HID_APPLEIR is not set
-# CONFIG_HID_ASUS is not set
-# CONFIG_HID_AUREAL is not set
-CONFIG_HID_BELKIN=y
-# CONFIG_HID_BETOP_FF is not set
-CONFIG_HID_CHERRY=y
-CONFIG_HID_CHICONY=y
-# CONFIG_HID_CORSAIR is not set
-# CONFIG_HID_PRODIKEYS is not set
-# CONFIG_HID_CMEDIA is not set
-CONFIG_HID_CYPRESS=y
-# CONFIG_HID_DRAGONRISE is not set
-# CONFIG_HID_EMS_FF is not set
-# CONFIG_HID_ELECOM is not set
-# CONFIG_HID_ELO is not set
-CONFIG_HID_EZKEY=y
-# CONFIG_HID_GEMBIRD is not set
-# CONFIG_HID_GFRM is not set
-# CONFIG_HID_HOLTEK is not set
-# CONFIG_HID_GT683R is not set
-# CONFIG_HID_KEYTOUCH is not set
-# CONFIG_HID_KYE is not set
-# CONFIG_HID_UCLOGIC is not set
-# CONFIG_HID_WALTOP is not set
 CONFIG_HID_GYRATION=y
-# CONFIG_HID_ICADE is not set
-CONFIG_HID_ITE=y
-# CONFIG_HID_TWINHAN is not set
-CONFIG_HID_KENSINGTON=y
-# CONFIG_HID_LCPOWER is not set
-# CONFIG_HID_LED is not set
-# CONFIG_HID_LENOVO is not set
-CONFIG_HID_LOGITECH=y
-# CONFIG_HID_LOGITECH_DJ is not set
-# CONFIG_HID_LOGITECH_HIDPP is not set
 CONFIG_LOGITECH_FF=y
-# CONFIG_LOGIRUMBLEPAD2_FF is not set
-# CONFIG_LOGIG940_FF is not set
-CONFIG_LOGIWHEELS_FF=y
-# CONFIG_HID_MAGICMOUSE is not set
-# CONFIG_HID_MAYFLASH is not set
-CONFIG_HID_MICROSOFT=y
-CONFIG_HID_MONTEREY=y
-# CONFIG_HID_MULTITOUCH is not set
-# CONFIG_HID_NTI is not set
 CONFIG_HID_NTRIG=y
-# CONFIG_HID_ORTEK is not set
 CONFIG_HID_PANTHERLORD=y
 CONFIG_PANTHERLORD_FF=y
-# CONFIG_HID_PENMOUNT is not set
 CONFIG_HID_PETALYNX=y
-# CONFIG_HID_PICOLCD is not set
 CONFIG_HID_PLANTRONICS=y
-# CONFIG_HID_PRIMAX is not set
-# CONFIG_HID_RETRODE is not set
-# CONFIG_HID_ROCCAT is not set
-# CONFIG_HID_SAITEK is not set
 CONFIG_HID_SAMSUNG=y
 CONFIG_HID_SONY=y
-# CONFIG_SONY_FF is not set
-# CONFIG_HID_SPEEDLINK is not set
-# CONFIG_HID_STEELSERIES is not set
 CONFIG_HID_SUNPLUS=y
-# CONFIG_HID_RMI is not set
-# CONFIG_HID_GREENASIA is not set
-# CONFIG_HID_SMARTJOYPLUS is not set
-# CONFIG_HID_TIVO is not set
 CONFIG_HID_TOPSEED=y
-# CONFIG_HID_THINGM is not set
-# CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_UDRAW_PS3 is not set
-# CONFIG_HID_WACOM is not set
-# CONFIG_HID_WIIMOTE is not set
-# CONFIG_HID_XINMO is not set
-# CONFIG_HID_ZEROPLUS is not set
-# CONFIG_HID_ZYDACRON is not set
-# CONFIG_HID_SENSOR_HUB is not set
-# CONFIG_HID_ALPS is not set
-
-#
-# USB HID support
-#
-CONFIG_USB_HID=y
 CONFIG_HID_PID=y
 CONFIG_USB_HIDDEV=y
-
-#
-# I2C HID support
-#
-# CONFIG_I2C_HID is not set
-
-#
-# Intel ISH HID support
-#
-# CONFIG_INTEL_ISH_HID is not set
-CONFIG_USB_OHCI_LITTLE_ENDIAN=y
-CONFIG_USB_SUPPORT=y
-CONFIG_USB_COMMON=y
-CONFIG_USB_ARCH_HAS_HCD=y
 CONFIG_USB=y
-CONFIG_USB_PCI=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-
-#
-# Miscellaneous USB options
-#
-CONFIG_USB_DEFAULT_PERSIST=y
-# CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_OTG is not set
-# CONFIG_USB_OTG_WHITELIST is not set
-# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
 CONFIG_USB_MON=y
-# CONFIG_USB_WUSB_CBAF is not set
-
-#
-# USB Host Controller Drivers
-#
-# CONFIG_USB_C67X00_HCD is not set
-# CONFIG_USB_XHCI_HCD is not set
 CONFIG_USB_EHCI_HCD=y
-# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
-CONFIG_USB_EHCI_PCI=y
-# CONFIG_USB_EHCI_HCD_PLATFORM is not set
-# CONFIG_USB_OXU210HP_HCD is not set
-# CONFIG_USB_ISP116X_HCD is not set
-# CONFIG_USB_ISP1362_HCD is not set
-# CONFIG_USB_FOTG210_HCD is not set
 CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PCI=y
-# CONFIG_USB_OHCI_HCD_PLATFORM is not set
 CONFIG_USB_UHCI_HCD=y
-# CONFIG_USB_SL811_HCD is not set
-# CONFIG_USB_R8A66597_HCD is not set
-# CONFIG_USB_HCD_TEST_MODE is not set
-
-#
-# USB Device Class drivers
-#
-# CONFIG_USB_ACM is not set
 CONFIG_USB_PRINTER=y
-# CONFIG_USB_WDM is not set
-# CONFIG_USB_TMC is not set
-
-#
-# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
-#
-
-#
-# also be needed; see USB_STORAGE Help for more info
-#
 CONFIG_USB_STORAGE=y
-# CONFIG_USB_STORAGE_DEBUG is not set
-# CONFIG_USB_STORAGE_REALTEK is not set
-# CONFIG_USB_STORAGE_DATAFAB is not set
-# CONFIG_USB_STORAGE_FREECOM is not set
-# CONFIG_USB_STORAGE_ISD200 is not set
-# CONFIG_USB_STORAGE_USBAT is not set
-# CONFIG_USB_STORAGE_SDDR09 is not set
-# CONFIG_USB_STORAGE_SDDR55 is not set
-# CONFIG_USB_STORAGE_JUMPSHOT is not set
-# CONFIG_USB_STORAGE_ALAUDA is not set
-# CONFIG_USB_STORAGE_ONETOUCH is not set
-# CONFIG_USB_STORAGE_KARMA is not set
-# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
-# CONFIG_USB_STORAGE_ENE_UB6250 is not set
-# CONFIG_USB_UAS is not set
-
-#
-# USB Imaging devices
-#
-# CONFIG_USB_MDC800 is not set
-# CONFIG_USB_MICROTEK is not set
-# CONFIG_USBIP_CORE is not set
-# CONFIG_USB_MUSB_HDRC is not set
-# CONFIG_USB_DWC3 is not set
-# CONFIG_USB_DWC2 is not set
-# CONFIG_USB_CHIPIDEA is not set
-# CONFIG_USB_ISP1760 is not set
-
-#
-# USB port drivers
-#
-# CONFIG_USB_SERIAL is not set
-
-#
-# USB Miscellaneous drivers
-#
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_SEVSEG is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_SISUSBVGA is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_EHSET_TEST_FIXTURE is not set
-# CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_YUREX is not set
-# CONFIG_USB_EZUSB_FX2 is not set
-# CONFIG_USB_HUB_USB251XB is not set
-# CONFIG_USB_HSIC_USB3503 is not set
-# CONFIG_USB_HSIC_USB4604 is not set
-# CONFIG_USB_LINK_LAYER_TEST is not set
-# CONFIG_USB_CHAOSKEY is not set
-
-#
-# USB Physical Layer drivers
-#
-# CONFIG_USB_PHY is not set
-# CONFIG_NOP_USB_XCEIV is not set
-# CONFIG_USB_ISP1301 is not set
-# CONFIG_USB_GADGET is not set
-
-#
-# USB Power Delivery and Type-C drivers
-#
-# CONFIG_TYPEC_UCSI is not set
-# CONFIG_USB_LED_TRIG is not set
-# CONFIG_USB_ULPI_BUS is not set
-# CONFIG_UWB is not set
-# CONFIG_MMC is not set
-# CONFIG_MEMSTICK is not set
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-# CONFIG_LEDS_CLASS_FLASH is not set
-# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
-
-#
-# LED drivers
-#
-# CONFIG_LEDS_LM3530 is not set
-# CONFIG_LEDS_LM3642 is not set
-# CONFIG_LEDS_PCA9532 is not set
-# CONFIG_LEDS_LP3944 is not set
-# CONFIG_LEDS_LP5521 is not set
-# CONFIG_LEDS_LP5523 is not set
-# CONFIG_LEDS_LP5562 is not set
-# CONFIG_LEDS_LP8501 is not set
-# CONFIG_LEDS_LP8860 is not set
-# CONFIG_LEDS_CLEVO_MAIL is not set
-# CONFIG_LEDS_PCA955X is not set
-# CONFIG_LEDS_PCA963X is not set
-# CONFIG_LEDS_BD2802 is not set
-# CONFIG_LEDS_INTEL_SS4200 is not set
-# CONFIG_LEDS_TCA6507 is not set
-# CONFIG_LEDS_TLC591XX is not set
-# CONFIG_LEDS_LM355x is not set
-
-#
-# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
-#
-# CONFIG_LEDS_BLINKM is not set
-# CONFIG_LEDS_MLXCPLD is not set
-# CONFIG_LEDS_USER is not set
-# CONFIG_LEDS_NIC78BX is not set
-
-#
-# LED Triggers
-#
-CONFIG_LEDS_TRIGGERS=y
-# CONFIG_LEDS_TRIGGER_TIMER is not set
-# CONFIG_LEDS_TRIGGER_ONESHOT is not set
-# CONFIG_LEDS_TRIGGER_DISK is not set
-# CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
-# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
-# CONFIG_LEDS_TRIGGER_CPU is not set
-# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
-
-#
-# iptables trigger is under Netfilter config (LED target)
-#
-# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
-# CONFIG_LEDS_TRIGGER_CAMERA is not set
-# CONFIG_LEDS_TRIGGER_PANIC is not set
-# CONFIG_ACCESSIBILITY is not set
-# CONFIG_INFINIBAND is not set
-CONFIG_EDAC_ATOMIC_SCRUB=y
-CONFIG_EDAC_SUPPORT=y
 CONFIG_EDAC=y
-CONFIG_EDAC_LEGACY_SYSFS=y
-# CONFIG_EDAC_DEBUG is not set
-CONFIG_EDAC_DECODE_MCE=y
-# CONFIG_EDAC_AMD64 is not set
-# CONFIG_EDAC_E752X is not set
-# CONFIG_EDAC_I82975X is not set
-# CONFIG_EDAC_I3000 is not set
-# CONFIG_EDAC_I3200 is not set
-# CONFIG_EDAC_IE31200 is not set
-# CONFIG_EDAC_X38 is not set
-# CONFIG_EDAC_I5400 is not set
-# CONFIG_EDAC_I7CORE is not set
-# CONFIG_EDAC_I5000 is not set
-# CONFIG_EDAC_I5100 is not set
-# CONFIG_EDAC_I7300 is not set
-# CONFIG_EDAC_SBRIDGE is not set
-# CONFIG_EDAC_SKX is not set
-# CONFIG_EDAC_PND2 is not set
-CONFIG_RTC_LIB=y
-CONFIG_RTC_MC146818_LIB=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_HCTOSYS is not set
-CONFIG_RTC_SYSTOHC=y
-CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
-# CONFIG_RTC_DEBUG is not set
-CONFIG_RTC_NVMEM=y
-
-#
-# RTC interfaces
-#
-CONFIG_RTC_INTF_SYSFS=y
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
-# CONFIG_RTC_DRV_TEST is not set
-
-#
-# I2C RTC drivers
-#
-# CONFIG_RTC_DRV_ABB5ZES3 is not set
-# CONFIG_RTC_DRV_ABX80X is not set
-# CONFIG_RTC_DRV_DS1307 is not set
-# CONFIG_RTC_DRV_DS1374 is not set
-# CONFIG_RTC_DRV_DS1672 is not set
-# CONFIG_RTC_DRV_MAX6900 is not set
-# CONFIG_RTC_DRV_RS5C372 is not set
-# CONFIG_RTC_DRV_ISL1208 is not set
-# CONFIG_RTC_DRV_ISL12022 is not set
-# CONFIG_RTC_DRV_X1205 is not set
-# CONFIG_RTC_DRV_PCF8523 is not set
-# CONFIG_RTC_DRV_PCF85063 is not set
-# CONFIG_RTC_DRV_PCF8563 is not set
-# CONFIG_RTC_DRV_PCF8583 is not set
-# CONFIG_RTC_DRV_M41T80 is not set
-# CONFIG_RTC_DRV_BQ32K is not set
-# CONFIG_RTC_DRV_S35390A is not set
-# CONFIG_RTC_DRV_FM3130 is not set
-# CONFIG_RTC_DRV_RX8010 is not set
-# CONFIG_RTC_DRV_RX8581 is not set
-# CONFIG_RTC_DRV_RX8025 is not set
-# CONFIG_RTC_DRV_EM3027 is not set
-# CONFIG_RTC_DRV_RV8803 is not set
-
-#
-# SPI RTC drivers
-#
-CONFIG_RTC_I2C_AND_SPI=y
-
-#
-# SPI and I2C RTC drivers
-#
-# CONFIG_RTC_DRV_DS3232 is not set
-# CONFIG_RTC_DRV_PCF2127 is not set
-# CONFIG_RTC_DRV_RV3029C2 is not set
-
-#
-# Platform RTC drivers
-#
-CONFIG_RTC_DRV_CMOS=y
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1685_FAMILY is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_DS2404 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_MSM6242 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_RP5C01 is not set
-# CONFIG_RTC_DRV_V3020 is not set
-
-#
-# on-CPU RTC drivers
-#
-# CONFIG_RTC_DRV_FTRTC010 is not set
-
-#
-# HID Sensor RTC drivers
-#
-# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
 CONFIG_DMADEVICES=y
-# CONFIG_DMADEVICES_DEBUG is not set
-
-#
-# DMA Devices
-#
-CONFIG_DMA_ENGINE=y
-CONFIG_DMA_ACPI=y
-# CONFIG_INTEL_IDMA64 is not set
-# CONFIG_INTEL_IOATDMA is not set
-# CONFIG_QCOM_HIDMA_MGMT is not set
-# CONFIG_QCOM_HIDMA is not set
-CONFIG_DW_DMAC_CORE=y
-# CONFIG_DW_DMAC is not set
-# CONFIG_DW_DMAC_PCI is not set
-
-#
-# DMA Clients
-#
-# CONFIG_ASYNC_TX_DMA is not set
-# CONFIG_DMATEST is not set
-
-#
-# DMABUF options
-#
-CONFIG_SYNC_FILE=y
-# CONFIG_SW_SYNC is not set
-# CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
-# CONFIG_VFIO is not set
-# CONFIG_VIRT_DRIVERS is not set
-
-#
-# Virtio drivers
-#
-# CONFIG_VIRTIO_PCI is not set
-# CONFIG_VIRTIO_MMIO is not set
-
-#
-# Microsoft Hyper-V guest support
-#
-# CONFIG_HYPERV_TSCPAGE is not set
-# CONFIG_STAGING is not set
-CONFIG_X86_PLATFORM_DEVICES=y
-# CONFIG_ACERHDF is not set
-# CONFIG_ASUS_LAPTOP is not set
-# CONFIG_DELL_LAPTOP is not set
-# CONFIG_DELL_SMO8800 is not set
-# CONFIG_DELL_RBTN is not set
-# CONFIG_FUJITSU_LAPTOP is not set
-# CONFIG_FUJITSU_TABLET is not set
-# CONFIG_AMILO_RFKILL is not set
-# CONFIG_HP_ACCEL is not set
-# CONFIG_HP_WIRELESS is not set
-# CONFIG_MSI_LAPTOP is not set
-# CONFIG_PANASONIC_LAPTOP is not set
-# CONFIG_COMPAL_LAPTOP is not set
-# CONFIG_SONY_LAPTOP is not set
-# CONFIG_IDEAPAD_LAPTOP is not set
-# CONFIG_THINKPAD_ACPI is not set
-# CONFIG_SENSORS_HDAPS is not set
-# CONFIG_INTEL_MENLOW is not set
 CONFIG_EEEPC_LAPTOP=y
-# CONFIG_ASUS_WIRELESS is not set
-# CONFIG_ACPI_WMI is not set
-# CONFIG_TOPSTAR_LAPTOP is not set
-# CONFIG_TOSHIBA_BT_RFKILL is not set
-# CONFIG_TOSHIBA_HAPS is not set
-# CONFIG_ACPI_CMPC is not set
-# CONFIG_INTEL_CHT_INT33FE is not set
-# CONFIG_INTEL_HID_EVENT is not set
-# CONFIG_INTEL_VBTN is not set
-# CONFIG_INTEL_IPS is not set
-# CONFIG_INTEL_PMC_CORE is not set
-# CONFIG_IBM_RTL is not set
-# CONFIG_SAMSUNG_LAPTOP is not set
-# CONFIG_INTEL_OAKTRAIL is not set
-# CONFIG_SAMSUNG_Q10 is not set
-# CONFIG_APPLE_GMUX is not set
-# CONFIG_INTEL_RST is not set
-# CONFIG_INTEL_SMARTCONNECT is not set
-# CONFIG_PVPANIC is not set
-# CONFIG_INTEL_PMC_IPC is not set
-# CONFIG_SURFACE_PRO3_BUTTON is not set
-# CONFIG_INTEL_PUNIT_IPC is not set
-# CONFIG_MLX_PLATFORM is not set
-# CONFIG_MLX_CPLD_PLATFORM is not set
-# CONFIG_INTEL_TURBO_MAX_3 is not set
-CONFIG_PMC_ATOM=y
-# CONFIG_CHROME_PLATFORMS is not set
-CONFIG_CLKDEV_LOOKUP=y
-CONFIG_HAVE_CLK_PREPARE=y
-CONFIG_COMMON_CLK=y
-
-#
-# Common Clock Framework
-#
-# CONFIG_COMMON_CLK_SI5351 is not set
-# CONFIG_COMMON_CLK_CDCE706 is not set
-# CONFIG_COMMON_CLK_CS2000_CP is not set
-# CONFIG_COMMON_CLK_NXP is not set
-# CONFIG_COMMON_CLK_PXA is not set
-# CONFIG_COMMON_CLK_PIC32 is not set
-# CONFIG_HWSPINLOCK is not set
-
-#
-# Clock Source drivers
-#
-CONFIG_CLKEVT_I8253=y
-CONFIG_I8253_LOCK=y
-CONFIG_CLKBLD_I8253=y
-# CONFIG_ATMEL_PIT is not set
-# CONFIG_SH_TIMER_CMT is not set
-# CONFIG_SH_TIMER_MTU2 is not set
-# CONFIG_SH_TIMER_TMU is not set
-# CONFIG_EM_TIMER_STI is not set
-CONFIG_MAILBOX=y
-CONFIG_PCC=y
-# CONFIG_ALTERA_MBOX is not set
-CONFIG_IOMMU_API=y
-CONFIG_IOMMU_SUPPORT=y
-
-#
-# Generic IOMMU Pagetable Support
-#
-CONFIG_IOMMU_IOVA=y
 CONFIG_AMD_IOMMU=y
-# CONFIG_AMD_IOMMU_V2 is not set
-CONFIG_DMAR_TABLE=y
 CONFIG_INTEL_IOMMU=y
-# CONFIG_INTEL_IOMMU_SVM is not set
 # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
-CONFIG_INTEL_IOMMU_FLOPPY_WA=y
-# CONFIG_IRQ_REMAP is not set
-
-#
-# Remoteproc drivers
-#
-# CONFIG_REMOTEPROC is not set
-
-#
-# Rpmsg drivers
-#
-# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
-
-#
-# SOC (System On Chip) specific Drivers
-#
-
-#
-# Broadcom SoC drivers
-#
-
-#
-# i.MX SoC drivers
-#
-# CONFIG_SUNXI_SRAM is not set
-# CONFIG_SOC_TI is not set
-# CONFIG_PM_DEVFREQ is not set
-# CONFIG_EXTCON is not set
-# CONFIG_MEMORY is not set
-# CONFIG_IIO is not set
-# CONFIG_NTB is not set
-# CONFIG_VME_BUS is not set
-# CONFIG_PWM is not set
-CONFIG_ARM_GIC_MAX_NR=1
-# CONFIG_IPACK_BUS is not set
-# CONFIG_RESET_CONTROLLER is not set
-# CONFIG_FMC is not set
-
-#
-# PHY Subsystem
-#
-# CONFIG_GENERIC_PHY is not set
-# CONFIG_BCM_KONA_USB2_PHY is not set
-# CONFIG_PHY_PXA_28NM_HSIC is not set
-# CONFIG_PHY_PXA_28NM_USB2 is not set
-# CONFIG_POWERCAP is not set
-# CONFIG_MCB is not set
-
-#
-# Performance monitor support
-#
-CONFIG_RAS=y
-# CONFIG_THUNDERBOLT is not set
-
-#
-# Android
-#
-# CONFIG_ANDROID is not set
-# CONFIG_LIBNVDIMM is not set
 CONFIG_DAX=y
-CONFIG_NVMEM=y
-# CONFIG_STM is not set
-# CONFIG_INTEL_TH is not set
-
-#
-# FPGA Configuration Support
-#
-# CONFIG_FPGA is not set
-
-#
-# FSI support
-#
-# CONFIG_FSI is not set
-
-#
-# Firmware Drivers
-#
-# CONFIG_EDD is not set
-CONFIG_FIRMWARE_MEMMAP=y
-# CONFIG_DELL_RBU is not set
-# CONFIG_DCDBAS is not set
-CONFIG_DMIID=y
-# CONFIG_DMI_SYSFS is not set
-CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
-# CONFIG_ISCSI_IBFT_FIND is not set
-# CONFIG_FW_CFG_SYSFS is not set
-# CONFIG_GOOGLE_FIRMWARE is not set
-
-#
-# EFI (Extensible Firmware Interface) Support
-#
-CONFIG_EFI_VARS=y
-CONFIG_EFI_ESRT=y
-CONFIG_EFI_RUNTIME_MAP=y
-# CONFIG_EFI_FAKE_MEMMAP is not set
-CONFIG_EFI_RUNTIME_WRAPPERS=y
-# CONFIG_EFI_BOOTLOADER_CONTROL is not set
-# CONFIG_EFI_CAPSULE_LOADER is not set
-# CONFIG_EFI_TEST is not set
-# CONFIG_EFI_DEV_PATH_PARSER is not set
-
-#
-# Tegra firmware driver
-#
-
-#
-# File systems
-#
-CONFIG_DCACHE_WORD_ACCESS=y
-# CONFIG_EXT2_FS is not set
-# CONFIG_EXT3_FS is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_USE_FOR_EXT2=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-# CONFIG_EXT4_ENCRYPTION is not set
-# CONFIG_EXT4_DEBUG is not set
-CONFIG_JBD2=y
-# CONFIG_JBD2_DEBUG is not set
-CONFIG_FS_MBCACHE=y
-# CONFIG_REISERFS_FS is not set
-# CONFIG_JFS_FS is not set
-# CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
-# CONFIG_BTRFS_FS is not set
-# CONFIG_NILFS2_FS is not set
-# CONFIG_F2FS_FS is not set
-# CONFIG_FS_DAX is not set
-CONFIG_FS_POSIX_ACL=y
-CONFIG_EXPORTFS=y
-# CONFIG_EXPORTFS_BLOCK_OPS is not set
-CONFIG_FILE_LOCKING=y
-CONFIG_MANDATORY_FILE_LOCKING=y
-# CONFIG_FS_ENCRYPTION is not set
-CONFIG_FSNOTIFY=y
-CONFIG_DNOTIFY=y
-CONFIG_INOTIFY_USER=y
-# CONFIG_FANOTIFY is not set
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
-# CONFIG_QUOTA_DEBUG is not set
-CONFIG_QUOTA_TREE=y
-# CONFIG_QFMT_V1 is not set
 CONFIG_QFMT_V2=y
-CONFIG_QUOTACTL=y
-CONFIG_QUOTACTL_COMPAT=y
 CONFIG_AUTOFS4_FS=y
-# CONFIG_FUSE_FS is not set
-# CONFIG_OVERLAY_FS is not set
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# CD-ROM/DVD Filesystems
-#
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_ZISOFS=y
-# CONFIG_UDF_FS is not set
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_CODEPAGE=437
-CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
-# CONFIG_FAT_DEFAULT_UTF8 is not set
-# CONFIG_NTFS_FS is not set
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_FS=y
 CONFIG_PROC_KCORE=y
-CONFIG_PROC_VMCORE=y
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-# CONFIG_PROC_CHILDREN is not set
-CONFIG_KERNFS=y
-CONFIG_SYSFS=y
-CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_TMPFS_XATTR=y
 CONFIG_HUGETLBFS=y
-CONFIG_HUGETLB_PAGE=y
-# CONFIG_CONFIGFS_FS is not set
 # CONFIG_EFIVAR_FS is not set
-CONFIG_MISC_FILESYSTEMS=y
-# CONFIG_ORANGEFS_FS is not set
-# CONFIG_ADFS_FS is not set
-# CONFIG_AFFS_FS is not set
-# CONFIG_ECRYPT_FS is not set
-# CONFIG_HFS_FS is not set
-# CONFIG_HFSPLUS_FS is not set
-# CONFIG_BEFS_FS is not set
-# CONFIG_BFS_FS is not set
-# CONFIG_EFS_FS is not set
-# CONFIG_CRAMFS is not set
-# CONFIG_SQUASHFS is not set
-# CONFIG_VXFS_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_OMFS_FS is not set
-# CONFIG_HPFS_FS is not set
-# CONFIG_QNX4FS_FS is not set
-# CONFIG_QNX6FS_FS is not set
-# CONFIG_ROMFS_FS is not set
-# CONFIG_PSTORE is not set
-# CONFIG_SYSV_FS is not set
-# CONFIG_UFS_FS is not set
-CONFIG_NETWORK_FILESYSTEMS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V2=y
-CONFIG_NFS_V3=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-# CONFIG_NFS_SWAP is not set
-# CONFIG_NFS_V4_1 is not set
 CONFIG_ROOT_NFS=y
-# CONFIG_NFS_USE_LEGACY_DNS is not set
-CONFIG_NFS_USE_KERNEL_DNS=y
-# CONFIG_NFSD is not set
-CONFIG_GRACE_PERIOD=y
-CONFIG_LOCKD=y
-CONFIG_LOCKD_V4=y
-CONFIG_NFS_ACL_SUPPORT=y
-CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=y
-CONFIG_SUNRPC_GSS=y
-# CONFIG_SUNRPC_DEBUG is not set
-# CONFIG_CEPH_FS is not set
-# CONFIG_CIFS is not set
-# CONFIG_NCP_FS is not set
-# CONFIG_CODA_FS is not set
-# CONFIG_AFS_FS is not set
-CONFIG_NLS=y
 CONFIG_NLS_DEFAULT="utf8"
 CONFIG_NLS_CODEPAGE_437=y
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_CODEPAGE_852 is not set
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-# CONFIG_NLS_CODEPAGE_936 is not set
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
-# CONFIG_NLS_CODEPAGE_1250 is not set
-# CONFIG_NLS_CODEPAGE_1251 is not set
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
-# CONFIG_NLS_MAC_ROMAN is not set
-# CONFIG_NLS_MAC_CELTIC is not set
-# CONFIG_NLS_MAC_CENTEURO is not set
-# CONFIG_NLS_MAC_CROATIAN is not set
-# CONFIG_NLS_MAC_CYRILLIC is not set
-# CONFIG_NLS_MAC_GAELIC is not set
-# CONFIG_NLS_MAC_GREEK is not set
-# CONFIG_NLS_MAC_ICELAND is not set
-# CONFIG_NLS_MAC_INUIT is not set
-# CONFIG_NLS_MAC_ROMANIAN is not set
-# CONFIG_NLS_MAC_TURKISH is not set
 CONFIG_NLS_UTF8=y
-
-#
-# Kernel hacking
-#
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-
-#
-# printk and dmesg options
-#
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
+CONFIG_SECURITY_SELINUX=y
+CONFIG_SECURITY_SELINUX_BOOTPARAM=y
+CONFIG_SECURITY_SELINUX_DISABLE=y
+CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_DES=y
 CONFIG_PRINTK_TIME=y
-CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
-CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
-# CONFIG_BOOT_PRINTK_DELAY is not set
-# CONFIG_DYNAMIC_DEBUG is not set
-
-#
-# Compile-time checks and compiler options
-#
-# CONFIG_DEBUG_INFO is not set
-CONFIG_ENABLE_WARN_DEPRECATED=y
-CONFIG_ENABLE_MUST_CHECK=y
-CONFIG_FRAME_WARN=2048
-# CONFIG_STRIP_ASM_SYMS is not set
-# CONFIG_READABLE_ASM is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_PAGE_OWNER is not set
-CONFIG_DEBUG_FS=y
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_SECTION_MISMATCH is not set
-CONFIG_SECTION_MISMATCH_WARN_ONLY=y
-CONFIG_ARCH_WANT_FRAME_POINTERS=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_STACK_VALIDATION is not set
-# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
-CONFIG_MAGIC_SYSRQ_SERIAL=y
 CONFIG_DEBUG_KERNEL=y
-
-#
-# Memory Debugging
-#
-# CONFIG_PAGE_EXTENSION is not set
-# CONFIG_DEBUG_PAGEALLOC is not set
-# CONFIG_PAGE_POISONING is not set
-# CONFIG_DEBUG_PAGE_REF is not set
-# CONFIG_DEBUG_RODATA_TEST is not set
-# CONFIG_DEBUG_OBJECTS is not set
-# CONFIG_SLUB_DEBUG_ON is not set
-# CONFIG_SLUB_STATS is not set
-CONFIG_HAVE_DEBUG_KMEMLEAK=y
-# CONFIG_DEBUG_KMEMLEAK is not set
 CONFIG_DEBUG_STACK_USAGE=y
-# CONFIG_DEBUG_VM is not set
-CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
-# CONFIG_DEBUG_VIRTUAL is not set
-CONFIG_DEBUG_MEMORY_INIT=y
-# CONFIG_DEBUG_PER_CPU_MAPS is not set
-CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_HAVE_ARCH_KMEMCHECK=y
-# CONFIG_KMEMCHECK is not set
-CONFIG_HAVE_ARCH_KASAN=y
-# CONFIG_KASAN is not set
-CONFIG_ARCH_HAS_KCOV=y
-# CONFIG_KCOV is not set
-# CONFIG_DEBUG_SHIRQ is not set
-
-#
-# Debug Lockups and Hangs
-#
-# CONFIG_SOFTLOCKUP_DETECTOR is not set
-CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
-# CONFIG_HARDLOCKUP_DETECTOR is not set
-# CONFIG_DETECT_HUNG_TASK is not set
-# CONFIG_WQ_WATCHDOG is not set
-# CONFIG_PANIC_ON_OOPS is not set
-CONFIG_PANIC_ON_OOPS_VALUE=0
-CONFIG_PANIC_TIMEOUT=0
 # CONFIG_SCHED_DEBUG is not set
-CONFIG_SCHED_INFO=y
 CONFIG_SCHEDSTATS=y
-# CONFIG_SCHED_STACK_END_CHECK is not set
-# CONFIG_DEBUG_TIMEKEEPING is not set
-
-#
-# Lock Debugging (spinlocks, mutexes, etc...)
-#
-# CONFIG_DEBUG_RT_MUTEXES is not set
-# CONFIG_DEBUG_SPINLOCK is not set
-# CONFIG_DEBUG_MUTEXES is not set
-# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
-# CONFIG_DEBUG_LOCK_ALLOC is not set
-# CONFIG_PROVE_LOCKING is not set
-# CONFIG_LOCK_STAT is not set
-# CONFIG_DEBUG_ATOMIC_SLEEP is not set
-# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
-# CONFIG_LOCK_TORTURE_TEST is not set
-# CONFIG_WW_MUTEX_SELFTEST is not set
-CONFIG_STACKTRACE=y
-# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
-# CONFIG_DEBUG_KOBJECT is not set
-CONFIG_DEBUG_BUGVERBOSE=y
-# CONFIG_DEBUG_LIST is not set
-# CONFIG_DEBUG_PI_LIST is not set
-# CONFIG_DEBUG_SG is not set
-# CONFIG_DEBUG_NOTIFIERS is not set
-# CONFIG_DEBUG_CREDENTIALS is not set
-
-#
-# RCU Debugging
-#
-# CONFIG_PROVE_RCU is not set
-# CONFIG_TORTURE_TEST is not set
-# CONFIG_RCU_PERF_TEST is not set
-# CONFIG_RCU_TORTURE_TEST is not set
-CONFIG_RCU_CPU_STALL_TIMEOUT=21
 # CONFIG_RCU_TRACE is not set
-# CONFIG_RCU_EQS_DEBUG is not set
-# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
-# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
-# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
-# CONFIG_NOTIFIER_ERROR_INJECTION is not set
-# CONFIG_FAULT_INJECTION is not set
-# CONFIG_LATENCYTOP is not set
-CONFIG_USER_STACKTRACE_SUPPORT=y
-CONFIG_NOP_TRACER=y
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
-CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
-CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
-CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
-CONFIG_HAVE_FENTRY=y
-CONFIG_HAVE_C_RECORDMCOUNT=y
-CONFIG_TRACE_CLOCK=y
-CONFIG_RING_BUFFER=y
-CONFIG_EVENT_TRACING=y
-CONFIG_CONTEXT_SWITCH_TRACER=y
-CONFIG_TRACING=y
-CONFIG_GENERIC_TRACER=y
-CONFIG_TRACING_SUPPORT=y
-CONFIG_FTRACE=y
-# CONFIG_FUNCTION_TRACER is not set
-# CONFIG_IRQSOFF_TRACER is not set
-# CONFIG_SCHED_TRACER is not set
-# CONFIG_HWLAT_TRACER is not set
-# CONFIG_FTRACE_SYSCALLS is not set
-# CONFIG_TRACER_SNAPSHOT is not set
-CONFIG_BRANCH_PROFILE_NONE=y
-# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
-# CONFIG_PROFILE_ALL_BRANCHES is not set
-# CONFIG_STACK_TRACER is not set
 CONFIG_BLK_DEV_IO_TRACE=y
-CONFIG_KPROBE_EVENTS=y
-CONFIG_UPROBE_EVENTS=y
-CONFIG_PROBE_EVENTS=y
-# CONFIG_FTRACE_STARTUP_TEST is not set
-# CONFIG_MMIOTRACE is not set
-# CONFIG_HIST_TRIGGERS is not set
-# CONFIG_TRACEPOINT_BENCHMARK is not set
-# CONFIG_RING_BUFFER_BENCHMARK is not set
-# CONFIG_RING_BUFFER_STARTUP_TEST is not set
-# CONFIG_TRACE_EVAL_MAP_FILE is not set
-
-#
-# Runtime Testing
-#
-# CONFIG_LKDTM is not set
-# CONFIG_TEST_LIST_SORT is not set
-# CONFIG_TEST_SORT is not set
-# CONFIG_KPROBES_SANITY_TEST is not set
-# CONFIG_BACKTRACE_SELF_TEST is not set
-# CONFIG_RBTREE_TEST is not set
-# CONFIG_INTERVAL_TREE_TEST is not set
-# CONFIG_PERCPU_TEST is not set
-# CONFIG_ATOMIC64_SELFTEST is not set
-# CONFIG_TEST_HEXDUMP is not set
-# CONFIG_TEST_STRING_HELPERS is not set
-# CONFIG_TEST_KSTRTOX is not set
-# CONFIG_TEST_PRINTF is not set
-# CONFIG_TEST_BITMAP is not set
-# CONFIG_TEST_UUID is not set
-# CONFIG_TEST_RHASHTABLE is not set
-# CONFIG_TEST_HASH is not set
 CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
-# CONFIG_DMA_API_DEBUG is not set
-# CONFIG_TEST_LKM is not set
-# CONFIG_TEST_USER_COPY is not set
-# CONFIG_TEST_BPF is not set
-# CONFIG_TEST_FIRMWARE is not set
-# CONFIG_TEST_SYSCTL is not set
-# CONFIG_TEST_UDELAY is not set
-# CONFIG_MEMTEST is not set
-# CONFIG_TEST_STATIC_KEYS is not set
-# CONFIG_BUG_ON_DATA_CORRUPTION is not set
-# CONFIG_TEST_KMOD is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-# CONFIG_KGDB is not set
-CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
-# CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
-# CONFIG_UBSAN is not set
-CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
 # CONFIG_STRICT_DEVMEM is not set
-CONFIG_EARLY_PRINTK_USB=y
-CONFIG_X86_VERBOSE_BOOTUP=y
-CONFIG_EARLY_PRINTK=y
 CONFIG_EARLY_PRINTK_DBGP=y
-# CONFIG_EARLY_PRINTK_EFI is not set
-# CONFIG_EARLY_PRINTK_USB_XDBC is not set
-# CONFIG_X86_PTDUMP_CORE is not set
-# CONFIG_X86_PTDUMP is not set
-# CONFIG_EFI_PGT_DUMP is not set
-# CONFIG_DEBUG_WX is not set
-CONFIG_DOUBLEFAULT=y
-# CONFIG_DEBUG_TLBFLUSH is not set
-# CONFIG_IOMMU_STRESS is not set
-CONFIG_HAVE_MMIOTRACE_SUPPORT=y
-# CONFIG_X86_DECODER_SELFTEST is not set
-CONFIG_IO_DELAY_TYPE_0X80=0
-CONFIG_IO_DELAY_TYPE_0XED=1
-CONFIG_IO_DELAY_TYPE_UDELAY=2
-CONFIG_IO_DELAY_TYPE_NONE=3
-CONFIG_IO_DELAY_0X80=y
-# CONFIG_IO_DELAY_0XED is not set
-# CONFIG_IO_DELAY_UDELAY is not set
-# CONFIG_IO_DELAY_NONE is not set
-CONFIG_DEFAULT_IO_DELAY_TYPE=0
 CONFIG_DEBUG_BOOT_PARAMS=y
-# CONFIG_CPA_DEBUG is not set
-CONFIG_OPTIMIZE_INLINING=y
-# CONFIG_DEBUG_ENTRY is not set
-# CONFIG_DEBUG_NMI_SELFTEST is not set
-CONFIG_X86_DEBUG_FPU=y
-# CONFIG_PUNIT_ATOM_DEBUG is not set
-
-#
-# Security options
-#
-CONFIG_KEYS=y
-CONFIG_KEYS_COMPAT=y
-# CONFIG_PERSISTENT_KEYRINGS is not set
-# CONFIG_BIG_KEYS is not set
-# CONFIG_ENCRYPTED_KEYS is not set
-# CONFIG_KEY_DH_OPERATIONS is not set
-# CONFIG_SECURITY_DMESG_RESTRICT is not set
-CONFIG_SECURITY=y
-CONFIG_SECURITY_WRITABLE_HOOKS=y
-# CONFIG_SECURITYFS is not set
-CONFIG_SECURITY_NETWORK=y
-# CONFIG_SECURITY_NETWORK_XFRM is not set
-# CONFIG_SECURITY_PATH is not set
-# CONFIG_INTEL_TXT is not set
-CONFIG_LSM_MMAP_MIN_ADDR=65536
-CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
-# CONFIG_HARDENED_USERCOPY is not set
-# CONFIG_FORTIFY_SOURCE is not set
-# CONFIG_STATIC_USERMODEHELPER is not set
-CONFIG_SECURITY_SELINUX=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=1
-CONFIG_SECURITY_SELINUX_DISABLE=y
-CONFIG_SECURITY_SELINUX_DEVELOP=y
-CONFIG_SECURITY_SELINUX_AVC_STATS=y
-CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
-# CONFIG_SECURITY_SMACK is not set
-# CONFIG_SECURITY_TOMOYO is not set
-# CONFIG_SECURITY_APPARMOR is not set
-# CONFIG_SECURITY_LOADPIN is not set
-# CONFIG_SECURITY_YAMA is not set
-CONFIG_INTEGRITY=y
-# CONFIG_INTEGRITY_SIGNATURE is not set
-CONFIG_INTEGRITY_AUDIT=y
-# CONFIG_IMA is not set
-# CONFIG_EVM is not set
-CONFIG_DEFAULT_SECURITY_SELINUX=y
-# CONFIG_DEFAULT_SECURITY_DAC is not set
-CONFIG_DEFAULT_SECURITY="selinux"
-CONFIG_CRYPTO=y
-
-#
-# Crypto core or helper
-#
-CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD=y
-CONFIG_CRYPTO_AEAD2=y
-CONFIG_CRYPTO_BLKCIPHER=y
-CONFIG_CRYPTO_BLKCIPHER2=y
-CONFIG_CRYPTO_HASH=y
-CONFIG_CRYPTO_HASH2=y
-CONFIG_CRYPTO_RNG=y
-CONFIG_CRYPTO_RNG2=y
-CONFIG_CRYPTO_RNG_DEFAULT=y
-CONFIG_CRYPTO_AKCIPHER2=y
-CONFIG_CRYPTO_KPP2=y
-CONFIG_CRYPTO_ACOMP2=y
-# CONFIG_CRYPTO_RSA is not set
-# CONFIG_CRYPTO_DH is not set
-# CONFIG_CRYPTO_ECDH is not set
-CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_USER is not set
-CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
-CONFIG_CRYPTO_GF128MUL=y
-CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_NULL2=y
-# CONFIG_CRYPTO_PCRYPT is not set
-CONFIG_CRYPTO_WORKQUEUE=y
-# CONFIG_CRYPTO_CRYPTD is not set
-# CONFIG_CRYPTO_MCRYPTD is not set
-CONFIG_CRYPTO_AUTHENC=y
-# CONFIG_CRYPTO_TEST is not set
-
-#
-# Authenticated Encryption with Associated Data
-#
-CONFIG_CRYPTO_CCM=y
-CONFIG_CRYPTO_GCM=y
-# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
-CONFIG_CRYPTO_SEQIV=y
-CONFIG_CRYPTO_ECHAINIV=y
-
-#
-# Block modes
-#
-CONFIG_CRYPTO_CBC=y
-CONFIG_CRYPTO_CTR=y
-# CONFIG_CRYPTO_CTS is not set
-# CONFIG_CRYPTO_ECB is not set
-# CONFIG_CRYPTO_LRW is not set
-# CONFIG_CRYPTO_PCBC is not set
-# CONFIG_CRYPTO_XTS is not set
-# CONFIG_CRYPTO_KEYWRAP is not set
-
-#
-# Hash modes
-#
-CONFIG_CRYPTO_CMAC=y
-CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
-# CONFIG_CRYPTO_VMAC is not set
-
-#
-# Digest
-#
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_CRC32C_INTEL is not set
-# CONFIG_CRYPTO_CRC32 is not set
-# CONFIG_CRYPTO_CRC32_PCLMUL is not set
-# CONFIG_CRYPTO_CRCT10DIF is not set
-CONFIG_CRYPTO_GHASH=y
-# CONFIG_CRYPTO_POLY1305 is not set
-# CONFIG_CRYPTO_POLY1305_X86_64 is not set
-# CONFIG_CRYPTO_MD4 is not set
-CONFIG_CRYPTO_MD5=y
-# CONFIG_CRYPTO_MICHAEL_MIC is not set
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
-CONFIG_CRYPTO_SHA1=y
-# CONFIG_CRYPTO_SHA1_SSSE3 is not set
-# CONFIG_CRYPTO_SHA256_SSSE3 is not set
-# CONFIG_CRYPTO_SHA512_SSSE3 is not set
-# CONFIG_CRYPTO_SHA1_MB is not set
-# CONFIG_CRYPTO_SHA256_MB is not set
-# CONFIG_CRYPTO_SHA512_MB is not set
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_SHA512 is not set
-# CONFIG_CRYPTO_SHA3 is not set
-# CONFIG_CRYPTO_TGR192 is not set
-# CONFIG_CRYPTO_WP512 is not set
-# CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
-
-#
-# Ciphers
-#
-CONFIG_CRYPTO_AES=y
-# CONFIG_CRYPTO_AES_TI is not set
-# CONFIG_CRYPTO_AES_X86_64 is not set
-# CONFIG_CRYPTO_AES_NI_INTEL is not set
-# CONFIG_CRYPTO_ANUBIS is not set
-CONFIG_CRYPTO_ARC4=y
-# CONFIG_CRYPTO_BLOWFISH is not set
-# CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
-# CONFIG_CRYPTO_CAMELLIA is not set
-# CONFIG_CRYPTO_CAMELLIA_X86_64 is not set
-# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
-# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
-# CONFIG_CRYPTO_CAST5 is not set
-# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
-# CONFIG_CRYPTO_CAST6 is not set
-# CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
-CONFIG_CRYPTO_DES=y
-# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
-# CONFIG_CRYPTO_FCRYPT is not set
-# CONFIG_CRYPTO_KHAZAD is not set
-# CONFIG_CRYPTO_SALSA20 is not set
-# CONFIG_CRYPTO_SALSA20_X86_64 is not set
-# CONFIG_CRYPTO_CHACHA20 is not set
-# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
-# CONFIG_CRYPTO_SEED is not set
-# CONFIG_CRYPTO_SERPENT is not set
-# CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
-# CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
-# CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
-# CONFIG_CRYPTO_TEA is not set
-# CONFIG_CRYPTO_TWOFISH is not set
-# CONFIG_CRYPTO_TWOFISH_X86_64 is not set
-# CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
-# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
-
-#
-# Compression
-#
-# CONFIG_CRYPTO_DEFLATE is not set
-# CONFIG_CRYPTO_LZO is not set
-# CONFIG_CRYPTO_842 is not set
-# CONFIG_CRYPTO_LZ4 is not set
-# CONFIG_CRYPTO_LZ4HC is not set
-
-#
-# Random Number Generation
-#
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-CONFIG_CRYPTO_DRBG_MENU=y
-CONFIG_CRYPTO_DRBG_HMAC=y
-# CONFIG_CRYPTO_DRBG_HASH is not set
-# CONFIG_CRYPTO_DRBG_CTR is not set
-CONFIG_CRYPTO_DRBG=y
-CONFIG_CRYPTO_JITTERENTROPY=y
-# CONFIG_CRYPTO_USER_API_HASH is not set
-# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
-# CONFIG_CRYPTO_USER_API_RNG is not set
-# CONFIG_CRYPTO_USER_API_AEAD is not set
-CONFIG_CRYPTO_HW=y
-# CONFIG_CRYPTO_DEV_PADLOCK is not set
-# CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_DESC is not set
-# CONFIG_CRYPTO_DEV_CCP is not set
-# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
-# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
-# CONFIG_CRYPTO_DEV_QAT_C62X is not set
-# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
-# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
-# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
-# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
-# CONFIG_ASYMMETRIC_KEY_TYPE is not set
-
-#
-# Certificates for signature checking
-#
-# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
-CONFIG_HAVE_KVM=y
-CONFIG_VIRTUALIZATION=y
-# CONFIG_KVM is not set
-# CONFIG_VHOST_NET is not set
-# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
-CONFIG_BINARY_PRINTF=y
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-# CONFIG_HAVE_ARCH_BITREVERSE is not set
-CONFIG_RATIONAL=y
-CONFIG_GENERIC_STRNCPY_FROM_USER=y
-CONFIG_GENERIC_STRNLEN_USER=y
-CONFIG_GENERIC_NET_UTILS=y
-CONFIG_GENERIC_FIND_FIRST_BIT=y
-CONFIG_GENERIC_PCI_IOMAP=y
-CONFIG_GENERIC_IOMAP=y
-CONFIG_GENERIC_IO=y
-CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
-CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC16=y
-# CONFIG_CRC_T10DIF is not set
-# CONFIG_CRC_ITU_T is not set
-CONFIG_CRC32=y
-# CONFIG_CRC32_SELFTEST is not set
-CONFIG_CRC32_SLICEBY8=y
-# CONFIG_CRC32_SLICEBY4 is not set
-# CONFIG_CRC32_SARWATE is not set
-# CONFIG_CRC32_BIT is not set
-# CONFIG_CRC4 is not set
-# CONFIG_CRC7 is not set
-# CONFIG_LIBCRC32C is not set
-# CONFIG_CRC8 is not set
-# CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
-# CONFIG_RANDOM32_SELFTEST is not set
-CONFIG_ZLIB_INFLATE=y
-CONFIG_ZLIB_DEFLATE=y
-CONFIG_LZO_COMPRESS=y
-CONFIG_LZO_DECOMPRESS=y
-CONFIG_LZ4_DECOMPRESS=y
-CONFIG_XZ_DEC=y
-CONFIG_XZ_DEC_X86=y
-CONFIG_XZ_DEC_POWERPC=y
-CONFIG_XZ_DEC_IA64=y
-CONFIG_XZ_DEC_ARM=y
-CONFIG_XZ_DEC_ARMTHUMB=y
-CONFIG_XZ_DEC_SPARC=y
-CONFIG_XZ_DEC_BCJ=y
-# CONFIG_XZ_DEC_TEST is not set
-CONFIG_DECOMPRESS_GZIP=y
-CONFIG_DECOMPRESS_BZIP2=y
-CONFIG_DECOMPRESS_LZMA=y
-CONFIG_DECOMPRESS_XZ=y
-CONFIG_DECOMPRESS_LZO=y
-CONFIG_DECOMPRESS_LZ4=y
-CONFIG_GENERIC_ALLOCATOR=y
-CONFIG_INTERVAL_TREE=y
-CONFIG_ASSOCIATIVE_ARRAY=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_IOPORT_MAP=y
-CONFIG_HAS_DMA=y
-# CONFIG_DMA_NOOP_OPS is not set
-# CONFIG_DMA_VIRT_OPS is not set
-CONFIG_CHECK_SIGNATURE=y
-CONFIG_CPU_RMAP=y
-CONFIG_DQL=y
-CONFIG_GLOB=y
-# CONFIG_GLOB_SELFTEST is not set
-CONFIG_NLATTR=y
-# CONFIG_CORDIC is not set
-# CONFIG_DDR is not set
-# CONFIG_IRQ_POLL is not set
-CONFIG_OID_REGISTRY=y
-CONFIG_UCS2_STRING=y
-CONFIG_FONT_SUPPORT=y
-# CONFIG_FONTS is not set
-CONFIG_FONT_8x8=y
-CONFIG_FONT_8x16=y
-# CONFIG_SG_SPLIT is not set
-CONFIG_SG_POOL=y
-CONFIG_ARCH_HAS_SG_CHAIN=y
-CONFIG_ARCH_HAS_PMEM_API=y
-CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
-CONFIG_ARCH_HAS_MMIO_FLUSH=y
-CONFIG_SBITMAP=y
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f247584f1f5db79c778e25f6840bf0005cdd1342.1629819671.git.jan.kiszka%40siemens.com.
