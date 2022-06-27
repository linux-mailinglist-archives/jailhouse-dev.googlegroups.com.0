Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2D55B9B4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id z11-20020a05600c0a0b00b003a043991610sf3234969wmp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=mDvp5DRlCP5CkejTwGPbuzXDkzjkpNPK0Ffu27J1aIc3NafbsRWsOnWuT5JLYhAy6v
         ocj9jL3AzrmwwW2mHl846z//aoEOmSD1VmFXAyy98P75JEpPYIQr9cckUyxYeLauozif
         u8A7JlIPyjoYOFqseL8YZ3qBhuT9JblUOCAQp1W57oTXsJwCQRfXO293ki+y1J656VLa
         QBOv+waY3bPeaUtFGntylr9iQV5xlhYiYZHX7QFMdglUbxqQ6cHGitK72maH6jPYSrFI
         N7az/LfnP9z1ZoO/HXg0Vc3sm4Ypo8yJ/+k+CFs3u0bN7ePTc2B9XmvNTv7doJUkD80K
         Bv5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1gLTSi5P8BjlpEGx3TqBvNSsIOSCptF+RYRYL4YArL4=;
        b=vNrcDaGQ4wAOYJ8+MnPQq4sTXuqqO1AWwhWphiMQ+h/aoloEW+dj3cnUIoAgX1hFIT
         cbtjAskzhDsKvhiv4W8zDPBzyFWY0QjAmOojZQL6DkO5fkcyFuejd+lE5BVGSuOOZKB6
         39SYzG5ixQaN2twN84akQh3EUG+SOP+lNKFpztfRuroV3BfirWmCehUr+qpvujTN9hd5
         vN7AcaIH6jKaHgeZ6pPq/CEg3mCVRw+6KNmpEnWleEKIOlTyN8YYN74/IDmiPJKUNfHA
         8TdakYthBT+GpLDXTnv1ytpzr699M6Ju1z8zmWnm9qU166+Yvd0AnKXSkNNBuhLH0FhO
         lCPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oPSTZnPn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1gLTSi5P8BjlpEGx3TqBvNSsIOSCptF+RYRYL4YArL4=;
        b=EE1tJdjIQCYi0Yeu7bxzvjMIPaF4uaIF0/LY5anWfQEmmWIPJTei0EJcPwrjOpN+BL
         rqGieMtsBqv3ewfWW1VW0jiSYZlQhdWBOS+RUa+t8jSB9W91V0N6APWIpMXwQ87F+W15
         kB0YjSTldP53FZXXdEyr4jYc9Dl07y5k2Ok0SenRhEk5x9Su/9mswOxy7OEYq78l1kQu
         QDu9+fjwKrSvNBVeUvOw/maAc4hWOR0eK2ClJj4PEfzG18kKpNjS7TMhvUwUapjRfyfZ
         Zgzrh9cLjaapU/Ij6OLoR30XWIiKLHF3jiXo05i+b3N/bAMSvquE773DWH1QK9w2IPdW
         q31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1gLTSi5P8BjlpEGx3TqBvNSsIOSCptF+RYRYL4YArL4=;
        b=fuUuCdAIGBvMw39SCGxWWLL1x+I7h3sEFbNWCe8LVp4FedHhJnDafjqCdeodORcenA
         WZu1zY9utF6VBv4S30F34b+hYCe+9zVCUptaSr0gAxbyu1o4FsgxclpVmeeD1cccX9zj
         4gxfJ6bc3c5JGz9GjEkd3Sbysuz36xU5xo52F6O9UBj+dN3FLGnrERjOQXHciyNxcKx9
         mquTYMuJrHpKdMEIjjNvTOvLW+z7Uz5k0lSbrGEN7lb9P9OsqCQXoiIFNW6x/qIzUxag
         OeJgUtnsuDuoYeWgBVPH2nTe4KeueqJ3dQR3znZSlivkL/qzBojzpY6Ig2KsG8xgze0f
         FPvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9HmTaEBefwCUgWKZDvN1/PjaTvQT1Z2rE4SyCLU3inwFLm0DdE
	i7xQ41lWRPrU3j5w0TaqS9c=
X-Google-Smtp-Source: AGRyM1vLd6TiDkNbc4Y+opn1siJ8oHKCYjOq7h8qrCrJtaRmvIKPlcS7HZ4D3wipvGsSS4aRof4axw==
X-Received: by 2002:a05:600c:5014:b0:3a0:4867:d234 with SMTP id n20-20020a05600c501400b003a04867d234mr8301115wmr.35.1656335619017;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13018573wrn.1.gmail;
 Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
X-Received: by 2002:a05:6000:18e:b0:21b:89a8:fb49 with SMTP id p14-20020a056000018e00b0021b89a8fb49mr12142971wrx.680.1656335617454;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=cJNWcrV2gB9i6SmH4sFS4I15ZjRRH4pohrErcIthgPZMTvit8DLFjwx2nSSnIoBhEu
         2uBCmdppPJFwe7++GAWpr8GNNfuhkuVQtmdYZjBEEVL8azr6gQcDHm8bxchKen2PiQRO
         6oIOMpV6AQRYFnJmcGIXEO8zss3t9KvOmjY4RGMQhlHDO9JD76Gzol1rdO6cMHKI7Flx
         3ZBekzYb4IrdLfHE3pxCWWEF/ritJgAH44uWbjDSAPAI942m1DfXROwhWTTMuUdjIx9A
         o/s868BL63q8PwhWdsLEwZ/oLFNqxZmUJcDF0hVCKxzwTVdB2d10Igw17XYB1X8Kw+PB
         SH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PCbyq+NBbHVNto0Z0ppEcWWWnBK5qv6DENG1x5E3Xvc=;
        b=MzM5pwb2kSWCr/Tw0oROlH8Bu7F9o+3u+CKYsHmpS6rwh91SonoUAI984ODFTYlfOR
         djFyi2SSQM0J4Z1PbWczN9Yz6+xJD9BIKGP02QIClDUQeA4JvQBcC3BMXhO+YVjAzdOR
         9Jxmji1RfEpAUnQ3xzOnuYiH4IC3uXavnGJLCJuMiL3maMXuKsfEB/YJBZpGvP+cVX/N
         rv8oprgIX7gYh+vx7wzapVU52cH4n80OUkgkkxznPI1iCgVrYCIXtwXukk6j/vj0ZFSp
         RvsBxnPZSmEYo3pi4vcEMDQymZNv3EdeBwCLTdOsLDFgLtuBWwirMLnvrJWNoXXBjU5j
         /nYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oPSTZnPn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p127-20020a1c2985000000b003a045967b2asi219090wmp.4.2022.06.27.06.13.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp8117byzxxR;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 07/20] arm, arm64: Make GICv3 arm64-only
Date: Mon, 27 Jun 2022 15:13:16 +0200
Message-ID: <20220627131329.3659-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=oPSTZnPn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

There is no 32-bit ARM board that we support and that has a GICv3. Very
likely, such a board does not even exist and never will. So move the
GICv3 support in Jailhouse to arm64, removing no longer needed
abstractions.

Rather than stubbing a GICv3 for irqchip_cpu_init, use #ifdef in this
case which is simpler and gives a more accurate error in case someone
configures a v3 for ARM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/Kbuild             |  4 +-
 hypervisor/arch/arm-common/include/asm/gic.h  |  1 -
 hypervisor/arch/arm-common/irqchip.c          |  2 +
 hypervisor/arch/arm/include/asm/arch_gicv3.h  | 53 -------------------
 hypervisor/arch/arm/traps.c                   | 13 ++---
 hypervisor/arch/arm64/Kbuild                  |  2 +-
 .../arch/{arm-common => arm64}/gic-v3.c       | 24 ++++-----
 .../arch/arm64/include/asm/arch_gicv3.h       | 30 -----------
 .../include/asm/gic_v3.h                      | 10 +++-
 hypervisor/arch/arm64/traps.c                 |  2 +-
 10 files changed, 30 insertions(+), 111 deletions(-)
 delete mode 100644 hypervisor/arch/arm/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common => arm64}/gic-v3.c (97%)
 delete mode 100644 hypervisor/arch/arm64/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common => arm64}/include/asm/gic_v3.h (94%)

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 9ddbc950..ee26b58c 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2013-2017
+# Copyright (c) Siemens AG, 2013-2022
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,6 +19,6 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
 objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
-objs-y += gic-v2.o gic-v3.o smccc.o
+objs-y += gic-v2.o smccc.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/include/asm/gic.h b/hypervisor/arch/arm-common/include/asm/gic.h
index e851d375..4eccde1b 100644
--- a/hypervisor/arch/arm-common/include/asm/gic.h
+++ b/hypervisor/arch/arm-common/include/asm/gic.h
@@ -50,6 +50,5 @@ extern void *gicd_base;
 extern spinlock_t dist_lock;
 
 void gic_handle_sgir_write(struct sgi *sgi);
-bool gicv3_handle_sgir_write(u64 sgir);
 #endif /* !__ASSEMBLY__ */
 #endif /* !_JAILHOUSE_ASM_GIC_COMMON_H */
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index fdb15c9d..6e8c8534 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -330,9 +330,11 @@ int irqchip_cpu_init(struct per_cpu *cpu_data)
 		case 2:
 			irqchip = gicv2_irqchip;
 			break;
+#ifdef __aarch64__
 		case 3:
 			irqchip = gicv3_irqchip;
 			break;
+#endif
 		default:
 			return trace_error(-EINVAL);
 		}
diff --git a/hypervisor/arch/arm/include/asm/arch_gicv3.h b/hypervisor/arch/arm/include/asm/arch_gicv3.h
deleted file mode 100644
index 558bc047..00000000
--- a/hypervisor/arch/arm/include/asm/arch_gicv3.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright (c) 2017 Texas Instruments Incorporated - http://www.ti.com/
- *
- * Author:
- *  Lokesh Vutla <lokeshvutla@ti.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#ifndef _JAILHOUSE_ASM_ARM_GIC_V3_H
-#define _JAILHOUSE_ASM_ARM_GIC_V3_H
-
-#include <asm/sysregs.h>
-
-#define ICH_LR0_7(x)		SYSREG_32(4, c12, c12, x)
-#define ICH_LR8_15(x)		SYSREG_32(4, c12, c13, x)
-#define ICH_LRC0_7(x)		SYSREG_32(4, c12, c14, x)
-#define ICH_LRC8_15(x)		SYSREG_32(4, c12, c15, x)
-
-#define ICC_SGI1R_EL1		SYSREG_64(0, c12)
-
-#define ARM_GIC_READ_LR0_7(n, val) do {		\
-	u32 lr##n, lrc##n;			\
-						\
-	arm_read_sysreg(ICH_LR0_7(n), lr##n);	\
-	arm_read_sysreg(ICH_LRC0_7(n), lrc##n);	\
-						\
-	val = ((u64)lrc##n << 32) | lr##n;	\
-} while (0);
-
-#define ARM_GIC_WRITE_LR0_7(n, val) do {		\
-	arm_write_sysreg(ICH_LR0_7(n), (u32)val);	\
-	arm_write_sysreg(ICH_LRC0_7(n), val >> 32);	\
-} while (0);
-
-#define ARM_GIC_READ_LR8_15(n, val) do {		\
-	u32 lr_##n, lrc_##n;				\
-							\
-	arm_read_sysreg(ICH_LR8_15(n), lr_##n);		\
-	arm_read_sysreg(ICH_LRC8_15(n), lrc_##n);	\
-							\
-	val = ((u64)lrc_##n << 32) | lr_##n;		\
-} while (0);
-
-#define ARM_GIC_WRITE_LR8_15(n, val) do {		\
-	arm_write_sysreg(ICH_LR8_15(n), (u32)val);	\
-	arm_write_sysreg(ICH_LRC8_15(n), val >> 32);	\
-} while (0);
-
-#endif /* _JAILHOUSE_ASM_ARM_GIC_V3_H */
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 6b402f74..c5f147b9 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -386,16 +386,9 @@ static enum trap_return arch_handle_cp15_64(struct trap_context *ctx)
 	access_cell_reg(ctx, rt, &lo, true);
 	access_cell_reg(ctx, rt2, &hi, true);
 
-	/* trapped by HCR.IMO/FMO */
-	if (HSR_MATCH_MCRR_MRRC(ctx->hsr, 0, 12)) { /* ICC_SGI1R */
-		if (!gicv3_handle_sgir_write(((u64)hi << 32) | lo))
-			return TRAP_UNHANDLED;
-	} else {
-		/* trapped if HCR.TVM is set */
-		if (!(CP15_64_PERFORM_WRITE(0, 2) ||	/* TTBR0 */
-		    CP15_64_PERFORM_WRITE(1, 2)))	/* TTBR1 */
-			return TRAP_UNHANDLED;
-	}
+	/* trapped if HCR.TVM is set: TTBR0 or TTBR1 */
+	if (!(CP15_64_PERFORM_WRITE(0, 2) || CP15_64_PERFORM_WRITE(1, 2)))
+		return TRAP_UNHANDLED;
 
 	arch_skip_instruction(ctx);
 
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index fd56a4da..6236dab6 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -20,5 +20,5 @@ always-y := lib.a
 # irqchip (common-objs-y), smmu-v3, ti-pvu, smmu, <generic units>
 
 lib-y := $(common-objs-y)
-lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
+lib-y += entry.o setup.o control.o gic-v3.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o smmu.o
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm64/gic-v3.c
similarity index 97%
rename from hypervisor/arch/arm-common/gic-v3.c
rename to hypervisor/arch/arm64/gic-v3.c
index 0429bb81..bdc25c8e 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm64/gic-v3.c
@@ -45,9 +45,9 @@ static u64 gicv3_read_lr(unsigned int reg)
 	u64 val;
 
 	switch (reg) {
-#define __READ_LR0_7(n)					\
-	case n:						\
-		ARM_GIC_READ_LR0_7(n, val)		\
+#define __READ_LR0_7(n)						\
+	case n:							\
+		arm_read_sysreg(ICH_LR0_7_EL2(n), val);		\
 		break;
 
 	__READ_LR0_7(0)
@@ -60,9 +60,9 @@ static u64 gicv3_read_lr(unsigned int reg)
 	__READ_LR0_7(7)
 #undef __READ_LR0_7
 
-#define __READ_LR8_15(n)				\
-	case n+8:					\
-		ARM_GIC_READ_LR8_15(n, val)		\
+#define __READ_LR8_15(n)					\
+	case n+8:						\
+		arm_read_sysreg(ICH_LR8_15_EL2(n), val);	\
 		break;
 
 	__READ_LR8_15(0)
@@ -85,9 +85,9 @@ static u64 gicv3_read_lr(unsigned int reg)
 static void gicv3_write_lr(unsigned int reg, u64 val)
 {
 	switch (reg) {
-#define __WRITE_LR0_7(n)				\
-	case n:						\
-		ARM_GIC_WRITE_LR0_7(n, val)		\
+#define __WRITE_LR0_7(n)					\
+	case n:							\
+		arm_write_sysreg(ICH_LR0_7_EL2(n), val);	\
 		break;
 
 	__WRITE_LR0_7(0)
@@ -100,9 +100,9 @@ static void gicv3_write_lr(unsigned int reg, u64 val)
 	__WRITE_LR0_7(7)
 #undef __WRITE_LR0_7
 
-#define __WRITE_LR8_15(n)				\
-	case n+8:					\
-		ARM_GIC_WRITE_LR8_15(n, val)		\
+#define __WRITE_LR8_15(n)					\
+	case n+8:						\
+		arm_write_sysreg(ICH_LR8_15_EL2(n), val);	\
 		break;
 	__WRITE_LR8_15(0)
 	__WRITE_LR8_15(1)
diff --git a/hypervisor/arch/arm64/include/asm/arch_gicv3.h b/hypervisor/arch/arm64/include/asm/arch_gicv3.h
deleted file mode 100644
index 93908232..00000000
--- a/hypervisor/arch/arm64/include/asm/arch_gicv3.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * Jailhouse, a Linux-based partitioning hypervisor
- *
- * Copyright (c) 2017 Texas Instruments Incorporated - http://www.ti.com/
- *
- * Author:
- *  Lokesh Vutla <lokeshvutla@ti.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#ifndef _JAILHOUSE_ASM_ARM64_GIC_V3_H
-#define _JAILHOUSE_ASM_ARM64_GIC_V3_H
-
-#include <asm/sysregs.h>
-
-#define ICH_LR0_7_EL2(x)		SYSREG_64(4, c12, c12, x)
-#define ICH_LR8_15_EL2(x)		SYSREG_64(4, c12, c13, x)
-
-#define ICC_SGI1R_EL1			SYSREG_64(0, c12, c11, 5)
-
-#define ARM_GIC_READ_LR0_7(n, val)	arm_read_sysreg(ICH_LR0_7_EL2(n), val);
-#define ARM_GIC_WRITE_LR0_7(n, val)	arm_write_sysreg(ICH_LR0_7_EL2(n), val);
-
-#define ARM_GIC_READ_LR8_15(n, val)	arm_read_sysreg(ICH_LR8_15_EL2(n), val);
-#define ARM_GIC_WRITE_LR8_15(n, val)	\
-	arm_write_sysreg(ICH_LR8_15_EL2(n), val);
-
-#endif /* _JAILHOUSE_ASM_ARM64_GIC_V3_H */
diff --git a/hypervisor/arch/arm-common/include/asm/gic_v3.h b/hypervisor/arch/arm64/include/asm/gic_v3.h
similarity index 94%
rename from hypervisor/arch/arm-common/include/asm/gic_v3.h
rename to hypervisor/arch/arm64/include/asm/gic_v3.h
index 853721d6..9672b219 100644
--- a/hypervisor/arch/arm-common/include/asm/gic_v3.h
+++ b/hypervisor/arch/arm64/include/asm/gic_v3.h
@@ -13,8 +13,8 @@
 #ifndef _JAILHOUSE_ASM_GIC_V3_H
 #define _JAILHOUSE_ASM_GIC_V3_H
 
+#include <jailhouse/types.h>
 #include <asm/sysregs.h>
-#include <asm/arch_gicv3.h>
 
 #define GICDv3_CIDR0		0xfff0
 #define GICDv3_PIDR0		0xffe0
@@ -69,6 +69,11 @@
 #define ICH_AP1R2_EL2		SYSREG_32(4, c12, c9, 2)
 #define ICH_AP1R3_EL2		SYSREG_32(4, c12, c9, 3)
 
+#define ICH_LR0_7_EL2(x)	SYSREG_64(4, c12, c12, x)
+#define ICH_LR8_15_EL2(x)	SYSREG_64(4, c12, c13, x)
+
+#define ICC_SGI1R_EL1		SYSREG_64(0, c12, c11, 5)
+
 #define ICC_CTLR_EOImode	0x2
 #define ICC_PMR_MASK		0xff
 #define ICC_PMR_DEFAULT		0xf0
@@ -125,4 +130,7 @@
 #define ICH_LR_PRIORITY_SHIFT	48
 #define ICH_LR_SGI_EOI		(0x1ULL << 41)
 #define ICH_LR_PHYS_ID_SHIFT	32
+
+bool gicv3_handle_sgir_write(u64 sgir);
+
 #endif /* _JAILHOUSE_ASM_GIC_V3_H */
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 488dd7f8..363a1b2a 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -15,7 +15,7 @@
 #include <jailhouse/printk.h>
 #include <asm/control.h>
 #include <asm/entry.h>
-#include <asm/gic.h>
+#include <asm/gic_v3.h>
 #include <asm/mmio.h>
 #include <asm/psci.h>
 #include <asm/smccc.h>
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-8-ralf.ramsauer%40oth-regensburg.de.
