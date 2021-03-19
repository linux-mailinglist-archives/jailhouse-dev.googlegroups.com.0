Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKNG2GBAMGQENZ5QHKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C134169E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:49 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id o11sf5378679wrc.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:30:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139049; cv=pass;
        d=google.com; s=arc-20160816;
        b=m/SPlZxSdcUKs3M23vazogw+oYY7FNd/wKgR9MZVeN9FUsiCgOWEcvw21cTrAZHXjq
         7PV6axlZRlVcICp9iOJozjFekIqYxzwsZYxPqSf4nlz48QkKynU34bDFqUXGFIA3xGyZ
         Db1DWov/6sOdYkwwWYSTFx8o28EbUOl4UF0nTzQIyYc8kuh+dME5aMcMCtQ7jm2SZtTx
         ydjj6KOBYhTyPQFEvW2D98j0s3YKF2jylyiqLlEntHiM8oSVpvKyma1gLHZm/J5ZHL5w
         kcNPc+wpvLwNDqcw8S29p8dqKBvlmFn/VFTKM01KU72o2xiXp3INCD/Xb8OJhQ4lCyJt
         XyHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Sv63/O4PYYyhkP6QjpyjMsx6H949QIoCPVb+Ln8J89g=;
        b=ppJvP99d83n290GWwnClxNjqxnvxAJ/wPiVy/ixQuaDI3TX3qplbEDeIoY4H/z0Bli
         Ga/y8iLxHPiYLU1vrJvBtP79FErlK4nM/Az8DuiGdw11xch4KM89VIREP/jJGo6Righp
         8s/nnTsbzk1eIZY4AnLBNg0YYb1hiKfSJxH5NDu6r0SZ2po+f40VsvbYgKmbpaBdvKMb
         nMJJBZB/dhNMW8VrWZwRXFr7ZiD9bALMNSRMSQznlEJ7+mbAovrBizHndOW/VC2UE3wU
         6P4zyvcGtnc78GgyBW7UbafUdFo5WQi6b8UFl/uWMNnqHj955l/YTnHWvr9uFSDXc0zI
         3S0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Sv63/O4PYYyhkP6QjpyjMsx6H949QIoCPVb+Ln8J89g=;
        b=Yer2O/bMtwlpPW/nUOAln4ypaeNUwKdlp8G42Jnfw1jBP/hY4O+/QAnksSDVRGhPmN
         SvZfN+8Tb/DdwCZPnJRMzBM6S4Ibsuaj3fgLT3rxOhewLAJha+/h0mwTZ/7OAQ8dxZyw
         z5uEWiQ41ItbeQk6pq/WAR1lUBnjSxJEQ5kFAUd8QlWBIH4kAVOHpDI6B8HjaM26hiWY
         kngJoxfOqyhXmx9bUB4/Y7NMy0I5h4vRL5nh8Q4Axxu0zCWZBmtMMWrh/6juKYitcUPA
         Abv2h37ZdiL734L98QDM1tNh7BepVvXz9NxNO8nS7pLtfuT2nNst4JGrt4a2g0JcOtBl
         gbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Sv63/O4PYYyhkP6QjpyjMsx6H949QIoCPVb+Ln8J89g=;
        b=Gs2/8p61GeDj1ZWqytXzROoe0Y59FkPv1yGD7kGj3eEKscU37UDWXtlS4iao3Ouhl2
         vhYoFWOZW48HnczCWGEc+lr64nYJ6he8ndl8vLbDHfZ7T+xs30RhYFfilvApSEW2E3OP
         RyQuirMN/yaEE89gcPHeiPrv30WcAt394dmnYt24t+6T7ggPl42EUomImHghGzvF6MVP
         fY2ZaO4bgV0xKogJ8q+dLBJfo0xZ3vl14D8eRAWJES90m9yOAKjQfYIbT8/posJePcO1
         xzSAoNRyQwkLib7okkyCvTl6m/zYJSjPJ5LXCVdmryi/Ew3yzDLvr3vLIpl0FkUQFzSF
         0lxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5330mXkdGEHZGlwKzB9Ao8mk+yPkzDG913l34rZzzN/IEUq77Cn1
	1YkYL6dHR89u6QBA/3HIg/Q=
X-Google-Smtp-Source: ABdhPJwj0mYUmXttW9knp5foCc/yOBDqI6Qi/r8DvhfZsQ2CeI4i2+8cHruBpT9AB72e9ZMNOcGuKQ==
X-Received: by 2002:a1c:e4d4:: with SMTP id b203mr2278419wmh.105.1616139049384;
        Fri, 19 Mar 2021 00:30:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1c8:: with SMTP id b8ls3899470wrd.3.gmail; Fri, 19 Mar
 2021 00:30:48 -0700 (PDT)
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr2975076wrw.95.1616139048361;
        Fri, 19 Mar 2021 00:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139048; cv=none;
        d=google.com; s=arc-20160816;
        b=dlPQI8rjLrdo9lgFtLgCaug8BOyP7grGaDatS8AkOopXJDmNVF5VgtuOSTMAnMuvVS
         4Cyh1dIQQuNKvhecJpuhLEKdnDRuYvAANX45NUJt9Diw+bcAi4+IRaY0hFV4UeGRRYEY
         fHq/M4NJHtPm3I2CB9YOgX94Ji1cNdwsSvALVv68lWXLNNfRj3TXdJBtAeVNnKHMl1CV
         KNsdiDIiGYkMGT9IhK49yar8zh/ErfRdmtc6tTUqyK9smXAGX+5oYvRtHAtqSqg7YDM1
         r2fTC2U/uTrByJ7iAiZ1zrU+tVsyf3qCP7d5nta5HktIKTz+2H2efYYe58YAJn+xS4JV
         otrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=89/jRufROvQucB0dFiV4wv/SfI0pMtc/TO2duaKFDyM=;
        b=lGxWGfA0ClCUnLfRHjNCuRW64D9SEzSIQMLv+v4IlY0a5sHIS+DUhYPeBnOuj+DFTW
         N6IgfPK1YL6tibV4stROS/03jub64gxt+EMk8o5lDQJAD7hmoqpUwSbjMe6ixAOsRKjz
         PsHUWnJ9BmhRzScc18pXvbKxvEpbiUSRhP5l+RJCHMFS86oAkiGhnK+7wJBfgTtS9Euf
         0vc804ihJc3iz4HPOfTysL1nepEwWtSmwxP+0GbrTfVyq23bKAqNbH1LlXG/5ZCEeYxv
         Bor7SjVPuyrU1Dd4sYGjzJ24m6EE4IKgbpYy0wQF8pJVufh8Ef24M9CrtJMPZpR/w6fx
         Vh7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b6si326613wmc.2.2021.03.19.00.30.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7UmEW014207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:30:48 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC8004384;
	Fri, 19 Mar 2021 08:30:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 10/11] arm-common: Handle SDEI case in PSCI CPU_SUSPEND
Date: Fri, 19 Mar 2021 08:30:44 +0100
Message-Id: <f97e8528200c5800a0a2e24494b2451592e1453f.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
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

When suspending the CPU while interrupts are passed through, we cannot
simply call wfi as EL2 is not receiving interrupts as wakeup events -
the CPU would starve.

Factor out arm_cpu_passthru_suspend to handle this case by enabling IMO
and FMO before calling wfi. That ensures that EL2 will resume, and as
interrupts are off in that mode, the events will simply be carried to
EL1 when clearing IMO/FMO before returning.

For ARM, arm_cpu_passthru_suspend remains empty as there is no SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/control.h |  1 +
 hypervisor/arch/arm-common/psci.c                |  4 +++-
 hypervisor/arch/arm/control.c                    |  5 +++++
 hypervisor/arch/arm64/control.c                  | 11 +++++++++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
index 9a5eaba7..acebef32 100644
--- a/hypervisor/arch/arm-common/include/asm/control.h
+++ b/hypervisor/arch/arm-common/include/asm/control.h
@@ -31,6 +31,7 @@ unsigned int arm_cpu_by_mpidr(struct cell *cell, unsigned long mpidr);
 
 void arm_cpu_reset(unsigned long pc, bool aarch32);
 void arm_cpu_park(void);
+void arm_cpu_passthru_suspend(void);
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index 916a6db9..a0f0b6a7 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -106,7 +106,9 @@ long psci_dispatch(struct trap_context *ctx)
 		 * a context-preserving suspend. This is legal according to
 		 * PSCI.
 		 */
-		if (!irqchip_has_pending_irqs()) {
+		if (sdei_available) {
+			arm_cpu_passthru_suspend();
+		} else if (!irqchip_has_pending_irqs()) {
 			asm volatile("wfi" : : : "memory");
 			irqchip_handle_irq();
 		}
diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index 0e7a1b54..46125e1a 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -101,3 +101,8 @@ void arch_panic_park(void)
 	arm_write_banked_reg(ELR_hyp, 0);
 }
 #endif
+
+void arm_cpu_passthru_suspend(void)
+{
+	/* never called */
+}
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 3cb5c3f8..5b41b393 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -99,3 +99,14 @@ void arch_panic_park(void)
 	arm_write_sysreg(ELR_EL2, 0);
 }
 #endif
+
+void arm_cpu_passthru_suspend(void)
+{
+	unsigned long hcr;
+
+	arm_read_sysreg(HCR_EL2, hcr);
+	arm_write_sysreg(HCR_EL2, hcr | HCR_IMO_BIT | HCR_FMO_BIT);
+	isb();
+	asm volatile("wfi" : : : "memory");
+	arm_write_sysreg(HCR_EL2, hcr);
+}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f97e8528200c5800a0a2e24494b2451592e1453f.1616139045.git.jan.kiszka%40siemens.com.
