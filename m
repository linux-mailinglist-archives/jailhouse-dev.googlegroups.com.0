Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTV5T6RQMGQEO6BQK2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5F70A0B9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:47 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 2adb3069b0e04-4edd54a0eaesf2468401e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528847; cv=pass;
        d=google.com; s=arc-20160816;
        b=MsDSYv96OgXcIf2tvdcb+//6tOXheUtGwslNa+LVZbLs8JkgZ2MjQwvPshbkVnd7L+
         TmEuOMQ0WzNUz5TC3EQlFQe0A2r2MQFu9yllLCfIWMUAgn1e/XJoT1Ng5J4J/C0G4NOa
         3RpiqrP0ik4y8t7x7ajWVlbFtJB26oHuCp2R2ISI/qlZfLorQYmKM/rH64zTdAvuvx/+
         Z80D/phr3vPHjxj4FbAn3OPcat785vDUhu9+II5J/q0Kg2TLQGcOcwUlWc5yBVVnVp7c
         tNOeUflLzt6DjWUiVlR16n4Y4zGKRgGSbQRDgEQ5gZapzuswxfRw0RQRuzBZXY3IlEBu
         ksHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LzHl7FO7/gKKAy4tSOqKRZzVG1fwURTcdoI2G+GhTD0=;
        b=CvBJQrvzqXqFXOZPPyv2TEqai9lfmq3SvmXNpveRFRJRXyk//pu6HFeI93wIQOcYhV
         /tX/QIkOKi+1H3HLJPehXKeAfh+eaHS+bEjzXiGSYF4OOAXz1zzX5RCjliqDfepKvIHF
         FxLaUnCo3XE5tE3YE8WKoVo3KURh0esKJA2ELjuzxOStA1ZStf9VBJ8w2k+f//hNqQVF
         SpHR3iEuOIxGqiX1KzcG7fVayu52t5mVvKk13YCpxDUImGYi7SR/mxBN744dLpKH1cmi
         mzWtpQ1nuonGI8rmvr1+bAAnKRQuptlJCheCy/u4bsThwqbM2y43NUYh7klQMY4PXi26
         2DdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzHl7FO7/gKKAy4tSOqKRZzVG1fwURTcdoI2G+GhTD0=;
        b=QhBCkIQaAH9uudFBOmt/21Swlciwzn1R21GtetPbhi/Fj2BmyK/Y8RBQPPiX+qq22t
         YjCcEBTTcu2m+ZjznBZs1ikODmD5t4yNrJgaf4qYn8UIkGtqhy5RM2qy+sPABydIYyuh
         5XXzea+ZF6puJ2GSI4y7OFe9PLvLS/th0aKVNpEVgSv/MKrMiPX7eQ+EubNUqxr/xmiu
         YMfxy6zW4jhtkxrXsjSVDAKlYtyQW6gWary5fyyuJyMyitQUNcg8tRIHg72xnYt/wox0
         fb82sFdBce0nsa+cB+9GYanwrsAo9sjVHL0qnmvaC9G+Y1o+0gTVD4XJ7m3XV1loZBj9
         Xrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzHl7FO7/gKKAy4tSOqKRZzVG1fwURTcdoI2G+GhTD0=;
        b=Th+u/fWZIIQJRc1IfEJfI26WWuxWpCOQycNt7feDfWeFsQSanJaArakBVILWKzqApM
         CH/xhlJdvjgTe+3UIF0eBwMxumKAeG2/wh7cLfNDXl4sG/RH8bal2mTtKZJWUySR3m09
         hycZ+APphh+O++BcmF4Zqxe8u4bNoeUbf+jvOL8yhAVc5BdYGy8k7wVmlxrJxPaCONs3
         utEi7HyFuDJu+eGC/+1FUGD3wopde6luR9P3OLbUUy/FZBquH1VpkVkA6dHx43QACKAQ
         hXToGa+jqyJeVYo/PNTJUAgOMcliZMJah5279xdBsSFw1y+OZAY9IhCruBoy+Z2u14YH
         RJLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxw0hhT2467bj/95nEmMkqllSfromcPIjFr1kN7UKpO1dxLEIgf
	kjMhbOUPUHREbSGlKD5mvQc=
X-Google-Smtp-Source: ACHHUZ4isAOLPwKYIFDnw+y8tWiZCSNT1Mw1Qr1j0guHGFZuZDcdk2v0qX2qHIVLMaiQaYn80w1PuQ==
X-Received: by 2002:a2e:2417:0:b0:2a5:fe8f:ddec with SMTP id k23-20020a2e2417000000b002a5fe8fddecmr759392ljk.2.1684528846764;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5bca:0:b0:4ec:b233:723c with SMTP id u10-20020ac25bca000000b004ecb233723cls1542781lfn.1.-pod-prod-09-eu;
 Fri, 19 May 2023 13:40:44 -0700 (PDT)
X-Received: by 2002:ac2:4843:0:b0:4f3:b258:fee4 with SMTP id 3-20020ac24843000000b004f3b258fee4mr606927lfy.59.1684528844740;
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528844; cv=none;
        d=google.com; s=arc-20160816;
        b=dtC5U7BBrtYZsZDrmVB8p9PyQWNDGfISsH98js8RcTaqAGfNgKeU+pcxKFGSS3aUMC
         r5GPEJn1Ka8k6L6+vsBsAeqmMjAV3lrJ3/onq+iQRXoK/YJacmM5uvZ1zQ8mKhN7Zj1a
         Ddhe6yOvGxHKn2WeX1LdtYTYlL+nj7cLzbalWAagNmDS9LMK6g2+n4QEA42m+vroz11s
         1+ouL+N+akFVRW8CtJz+f3OMYOBr1l5hw2pPQhObdLiFw1LdOWVqjR8X4H4kUNrnXryR
         sBe6zN7XxiR+1HPwE6P4P8sdRNh6US9hB9CETOsfEC4ka48Q5vZsRBJxsKhuDUO42x0A
         1cDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=iOFFt37IG0FYFNdQOP2oxMmkAs7+ri5Az4VmeKCCZps=;
        b=y3gfUXT4jjcrFpHIuJZE/DvNjXBzh2HkZDxVUquGTv80gbGc1c3wzZFBTl29wAq+3x
         5Epbexh9wITMqmR3IcMOjFpznYqv8SuBdroVB8rIBzPbGgJpBb28mWUaHAHKRw3LsM80
         /i9q0M+54FDVVpxOwubLCeNLFKPJ8GzsG2ukMa0sfNoOA/WU3edCqDafAtM7ycMBd4gd
         Z7SDy8skfXbz9QEQVukEMJv7Q6awmqNTWMGfY2ReSMHav4x1RJfyjE2ZwcbPlYcwjzyg
         ly4KoND7cq3FhfSV/ULAHTjiH/i+QINs+u0BWgTLGqrZ9DklXX2MbnsAzskNP0ynnYVK
         yq9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p5-20020a056512234500b004f175e991fasi8297lfu.13.2023.05.19.13.40.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdR4SJKzxtC;
	Fri, 19 May 2023 22:40:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 07/73] arm, arm64: Make GICv3 arm64-only
Date: Fri, 19 May 2023 22:39:27 +0200
Message-Id: <20230519204033.643200-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_ENDS_IN_SLASH 0, __URI_IN_BODY 0, __URI_MAILTO 0,
 __URI_NOT_IMG 0, __URI_NO_PATH 0, __URI_NS , __URI_WITHOUT_PATH 0'
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
index 885eecd4..7e5483e4 100644
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
 objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o uart-scif.o
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-8-ralf.ramsauer%40oth-regensburg.de.
