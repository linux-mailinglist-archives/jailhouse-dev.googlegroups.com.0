Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAFL2GBAMGQEWQ63CSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC1A3416CD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:40:49 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id h5sf21348070wrr.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139648; cv=pass;
        d=google.com; s=arc-20160816;
        b=E7+R9tV0R9yVuV1lIpf6z81TGyvLnH5kRM96tuxNHed5u+pTrxhez+pQBxi/nmi5cY
         apQZVl/vAHGw0rZLQOydcq5Oth9IZEG59C9C8f2zei08CE4i+vOrFqyR/Akj+lMZk/DO
         zORtSjPGcIuEbJ+1yxWvPNzeSdxG6N1HepDlVCeSqoFEH/EJ48vPJuDnfIj9OlRAE6to
         sABx1s1/7dc+xUKEcsd9eLtzKE3lbLf1byA1NByJVqoWSMaCd9lsbxApLv+UDoTKU6j3
         jNmbsWrzmBwvJnn1hjA5CvVsfTxTbaCxNmkL7fObyjduA+KhghN0M2k6+ViqddxA4/Md
         DL+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kf8GmPcQKmkTvncQNtpyN7dCbFSErCMYHLrmxJbA1fk=;
        b=Z80w5nYIr7SREqnihPxYJ+yLp6F3S4GmcOlT9hADH9jg/W0rSoKgbaHfaqSHC2LHxE
         7EHVp5cC29DUjgagGX4uhAUcpevE9APYnOIJQsVgdMV8sg3qit27PVd7S3MNrMvCvlNj
         RESqZVLPpY2coaKmQMF3Gpvq67PhSQsEILrlwovf1/FMZbGhx3u/p77vOE4eOhN1VTo+
         1tMZP0fCHp2aqUSjF6+nNysKCDLSkkB0yme05KL9Bkf2UhSG/1EAULnae1kKEYfWtLoi
         R+wi4iSQAFtjgghFnQXpg0J6GNrchR5XzLYJZkaR5cvbvTuaFYGPBJxx3cNYk4fj8EUX
         m7+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kf8GmPcQKmkTvncQNtpyN7dCbFSErCMYHLrmxJbA1fk=;
        b=lgAQNEgjPAxH2bELTLmq8BVX8oyFpoO1FaV0I4q3HmS/BdWdQt1L9IJO3EwSA/4Isf
         n00Eeer4fpQ6N8+3DyLXqJQF+OciJNWZdjQDVlwnohAF2lR7IqJ10iegsdjwQ4zjn0tm
         iW9LlJ1LnnnjFdy5cdIJai83QUgR5GwvFsQ4GwdvurskR1anB21kW/ffBQyWOTrL1MAl
         euHfoHICTz+iiEpIgjyOQRCV7b+uWh4IddSrKkGDHolLZ+qQmDM9HuzTt0XC2ylHfd1j
         aWe1uasohagBx6m78r4lIb03FZLuBI8vlkE5XtNvPTOAaoLIwg5CpFLT8CrWzh4WVXQR
         Vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kf8GmPcQKmkTvncQNtpyN7dCbFSErCMYHLrmxJbA1fk=;
        b=mZLyVtgNbesYhS5SYANjHZgm/x2w5QJ6hfEtyr9zpXzdzF/m96i7P6i5zk4NJcm9an
         ZREWmYhNrmnGJEbBJiDD+Kbwu7FmrsZZywL7FbKDfFJneEFbBARXp5/6iF6cv8EVWRH3
         t3IdVrNn4k9KWmoRoBsSStiOMDomtvacZdo5HMi5ZuGa+S06XD2hyPGehAmDEa5emgHi
         uITYhFpUTP+z13QLJa4mqg6Fv4oHTbKQjWDT/VSmrlszk/hPLv0WHFTA5KmLwVaJSg32
         PKO0dycW55U/pM4vCs04eqgXVLZfOKbo7Vxyv0JPS2JFHiHyudtVGwOFW9DH75QfUuIY
         Nb0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533c1EThIpDK1w9m0C/LOPLCeeyMuFs9RhzzH2xB87tDBt4ni1Av
	5WVP/SW2DbZ/EyQpJrDOWaI=
X-Google-Smtp-Source: ABdhPJyN5ZyAQn3UpFmvdLpVkrvf6vUtr1MkAZ8l4VopFVPTN+6upUo6wPwtVdy2HhS/LjvFSN2N1A==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr3145341wrr.12.1616139648869;
        Fri, 19 Mar 2021 00:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls3929369wrb.1.gmail; Fri,
 19 Mar 2021 00:40:47 -0700 (PDT)
X-Received: by 2002:adf:fd48:: with SMTP id h8mr3063013wrs.229.1616139647926;
        Fri, 19 Mar 2021 00:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139647; cv=none;
        d=google.com; s=arc-20160816;
        b=UJ5NhehqdWSGKqlrxac9tsczWGL8QP2eptcTSl5yvWyMPZGNyXvC8VUgSIDoQ770N6
         IXwLG4rwPfkzkVvSCXsmVIU2jJn3MRHkKm2segJEcWpah7UHls29/JQkvN5o25HFe+z5
         YqP2a30nMQhknPQd3j5ufxV4AvWVTZDvMxrViKIGREhigslmP3hkoXRQoNrN9iqbKE/k
         C3JL4R9xyi40iMqpItv9yHQPToEh14q9a+PSXHL+jGxmKupaKuCHd4t+Vtv+KHXoejJT
         1EnaxbGGy1/Rv7sXE2IpbkIVv3SEpxQzMbdINsT8A/O48eS9zTg4YemdEz6roLwN9Gd2
         HR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5qmmuSHDLla5pQ8MOlh9xMaSxRBQpWl+ZhMCa7dz0Go=;
        b=0BDpsQRm4NluIsr1rCDL972a40oKuorHXAAqvabrL70ebQFDA+DY2+tp3kVTwWMNgz
         /LbVuxmorugvhlV0q9VEEx/7GwVkJUfgY6M3bXd23HN7tKiwK01HciKzu2ezFJy2SUwn
         ZVif7NBosCRrN77K/3l+7gVh/wiRn7igf1fXI6OkXKnxt0cDt8iTP0FKAlcxCenznTjo
         5KylV+Z/o3R4MbqE2e1nILSWFrByDm2Bp+rpnEOLK6+vLvIVyCr9DwrPvxUR1tKhAYbI
         OnsGly0bI0Kc0+3IXnDajtmS+97Cnz4Z1AslmD3a0mQKsbMnWwUPQmVU/kiStN9uCILm
         Ha6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s1si154812wru.4.2021.03.19.00.40.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7elwi025502
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:40:47 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC5004384;
	Fri, 19 Mar 2021 08:30:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 07/11] arm64: Add SDEI-based management interrupt handling
Date: Fri, 19 Mar 2021 08:30:41 +0100
Message-Id: <482b64b129b5506065095d4e76165bd53ee87d9e.1616139045.git.jan.kiszka@siemens.com>
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

This brings the arm64-specific bits to handle management interrupts sent
via SDEI.

The pattern for processing them is derived from NMI-based injection on
x86: The SDEI event can come asynchronously at any time while in EL2,
EL1 or EL0. To avoid having to synchronize with running EL2, translate
it into a trap that is triggered on EL1/0 reentry. We use an invalid
VTCR_EL2 value for this and set the per-cpu sdei_event flag. When EL2
finds this flag set on handling the trap, it kicks off SGI_EVENT
handling and restores VTCR_EL2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/arm-common/include/asm/smccc.h       |  8 ++++++++
 hypervisor/arch/arm64/asm-defines.c           |  1 +
 hypervisor/arch/arm64/entry.S                 | 18 ++++++++++++++++++
 hypervisor/arch/arm64/include/asm/entry.h     |  2 ++
 .../arch/arm64/include/asm/percpu_fields.h    |  3 ++-
 hypervisor/arch/arm64/setup.c                 | 19 +++++++++++++++++++
 hypervisor/arch/arm64/traps.c                 | 10 ++++++++++
 7 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h b/hypervisor/arch/arm-common/include/asm/smccc.h
index 0d1ecd86..fdfe49a2 100644
--- a/hypervisor/arch/arm-common/include/asm/smccc.h
+++ b/hypervisor/arch/arm-common/include/asm/smccc.h
@@ -17,8 +17,16 @@
 #define SMCCC_ARCH_WORKAROUND_1		0x80008000
 #define SMCCC_ARCH_WORKAROUND_2		0x80007fff
 
+#define SDEI_EVENT_REGISTER		0xc4000021
+#define SDEI_EVENT_ENABLE		0xc4000022
+#define SDEI_EVENT_COMPLETE		0xc4000025
+#define SDEI_EVENT_UNREGISTER		0xc4000027
+#define SDEI_PE_MASK			0xc400002b
+#define SDEI_PE_UNMASK			0xc400002c
 #define SDEI_EVENT_SIGNAL		0xc400002f
 
+#define SDEI_EV_HANDLED			0
+
 #define ARM_SMCCC_OWNER_MASK		BIT_MASK(29, 24)
 #define ARM_SMCCC_OWNER_SHIFT		24
 
diff --git a/hypervisor/arch/arm64/asm-defines.c b/hypervisor/arch/arm64/asm-defines.c
index 1fcffcc3..774dd145 100644
--- a/hypervisor/arch/arm64/asm-defines.c
+++ b/hypervisor/arch/arm64/asm-defines.c
@@ -29,6 +29,7 @@ void common(void)
 	OFFSET(SYSCONFIG_HYPERVISOR_PHYS, jailhouse_system,
 	       hypervisor_memory.phys_start);
 	OFFSET(PERCPU_ID_AA64MMFR0, per_cpu, id_aa64mmfr0);
+	OFFSET(PERCPU_SDEI_EVENT, per_cpu, sdei_event);
 	BLANK();
 
 	DEFINE(PERCPU_STACK_END,
diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index c958ea4e..3f4ee871 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -539,3 +539,21 @@ __vmreturn:
 	dsb nsh
 	isb
 	.popsection
+
+
+	.globl sdei_handler
+sdei_handler:
+	mov	w0, #1
+	strh	w0, [x1, #PERCPU_SDEI_EVENT]
+
+	mrs	x0, vtcr_el2
+	orr	x0, x0, #0xff
+	msr	vtcr_el2, x0
+	isb
+	tlbi	vmalls12e1is
+
+	ldr	x0, =SDEI_EVENT_COMPLETE
+	mov	x1, #SDEI_EV_HANDLED
+	smc	#0
+
+	b	.
diff --git a/hypervisor/arch/arm64/include/asm/entry.h b/hypervisor/arch/arm64/include/asm/entry.h
index 335ac607..d663cbf6 100644
--- a/hypervisor/arch/arm64/include/asm/entry.h
+++ b/hypervisor/arch/arm64/include/asm/entry.h
@@ -20,3 +20,5 @@ void enable_mmu_el2(u64 ttbr0_el2);
 void __attribute__((noreturn)) shutdown_el2(struct per_cpu *cpu_data);
 
 void __attribute__((noreturn)) vmreturn(union registers *guest_regs);
+
+void sdei_handler(void *param);
diff --git a/hypervisor/arch/arm64/include/asm/percpu_fields.h b/hypervisor/arch/arm64/include/asm/percpu_fields.h
index 2afd32a8..67573fd6 100644
--- a/hypervisor/arch/arm64/include/asm/percpu_fields.h
+++ b/hypervisor/arch/arm64/include/asm/percpu_fields.h
@@ -12,4 +12,5 @@
 
 #define ARCH_PERCPU_FIELDS						\
 	ARM_PERCPU_FIELDS						\
-	unsigned long id_aa64mmfr0;
+	unsigned long id_aa64mmfr0;					\
+	bool sdei_event;
diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index 58c90276..d8c58504 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -19,6 +19,7 @@
 #include <asm/entry.h>
 #include <asm/irqchip.h>
 #include <asm/setup.h>
+#include <asm/smc.h>
 #include <asm/smccc.h>
 
 extern u8 __trampoline_start[];
@@ -62,6 +63,19 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 	if (err)
 		return err;
 
+	if (sdei_available) {
+		if (smc_arg5(SDEI_EVENT_REGISTER, 0,
+			     (unsigned long)sdei_handler, LOCAL_CPU_BASE,
+			     0, 0) != ARM_SMCCC_SUCCESS)
+			return trace_error(-EIO);
+
+		if (smc_arg1(SDEI_EVENT_ENABLE, 0) != ARM_SMCCC_SUCCESS)
+			return trace_error(-EIO);
+
+		if (smc(SDEI_PE_UNMASK) != ARM_SMCCC_SUCCESS)
+			return trace_error(-EIO);
+	}
+
 	/* Setup guest traps */
 	arm_write_sysreg(HCR_EL2, hcr);
 
@@ -99,6 +113,11 @@ void arch_shutdown_self(struct per_cpu *cpu_data)
 	void (*shutdown_func)(struct per_cpu *) =
 		(void (*)(struct per_cpu *))paging_hvirt2phys(shutdown_el2);
 
+	if (sdei_available) {
+		smc(SDEI_PE_MASK);
+		smc_arg1(SDEI_EVENT_UNREGISTER, 0);
+	}
+
 	irqchip_cpu_shutdown(&cpu_data->public);
 
 	/* Free the guest */
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index a9086c79..488dd7f8 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -73,6 +73,16 @@ static enum trap_return handle_iabt(struct trap_context *ctx)
 {
 	unsigned long hpfar, hdfar;
 
+	if (this_cpu_data()->sdei_event) {
+		this_cpu_data()->sdei_event = false;
+		arm_write_sysreg(VTCR_EL2, VTCR_CELL);
+		isb();
+
+		arch_handle_sgi(SGI_EVENT, 1);
+
+		return TRAP_HANDLED;
+	}
+
 	arm_read_sysreg(HPFAR_EL2, hpfar);
 	arm_read_sysreg(FAR_EL2, hdfar);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/482b64b129b5506065095d4e76165bd53ee87d9e.1616139045.git.jan.kiszka%40siemens.com.
