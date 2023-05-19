Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTF5T6RQMGQELBDRQ2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51270A0B5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 2adb3069b0e04-4f3b27050e7sf341421e87.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528845; cv=pass;
        d=google.com; s=arc-20160816;
        b=hwt0nn/IE/5AYV+R+DgXskAc5t605cBSiD91ceUVrOf/nT/lFwtMPJ58356LEFOedr
         X4odgcYEv3n3fvtrDx4Fo9ifAgyGP4ewy+NWh27nomlyrBInaHD9c6mEp55+nCf7kAeC
         6h1HDlskIxT74skeZTu2ZQ62YICIdWrW2XICeLKzEp56t+52Pl0ZdtpuucGVe7hmUPZE
         SU0NRKMZ3YvaL+lqmCFVKpM593Hg0M1JFN5GzTLM/LccKwo5EADLRoCCi3GLcqx82zq9
         TxHxonG1YXt8CtJphh6tgVExAJyeeJxKAAe/e9+fe7iMWJQO2hW523OI2HmZ9sGwpBnE
         XMaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=35MVTaZKaPU/nCfEJKJVMrNWs/kfExSy1eX1gUaMNug=;
        b=ghYD7Yk5JKCLNRtY9YWXjxPecwYI3L2vnfqXEQ54NoN8hVbBrqrby0kTOttpPk3nFq
         TCIQ7Fr+i8yXjMqXP4dcNRzxdADch605mXin45y3eOg2zgia2VGhAXsUrNsuPLRdNYsZ
         z+YTB3EPRx3EHEYKQSORaiJ5XW5nq8BE9O30+m6CA+gsO1joa23nfoZ47Avf+qYFLvDn
         aEjrU6NtzJ4A2f0HRP8JStk19kWmf8xug8WMWAt29Jx6OHPJwe+mKvM67L9npbnh2HvD
         GV2h7l/Fyf73C8A+8QMvII9VE923gR5jMTV7FkaXO6Md7ONp36J+KoCVOPlatFLucttC
         ubZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35MVTaZKaPU/nCfEJKJVMrNWs/kfExSy1eX1gUaMNug=;
        b=m9bGwxwLh4WYXAPPp1yFHAo7Eoajr2W5ZPFWjL6Ru7AWsaYHVUyGwghHrZjFuhmXyo
         h1pjdkER0vMx74f9WQUgGSII5HSinok5dmwFESqCjMcylyT5EZXrbHAXR8Ro2RU+vvhm
         i5RzZrBI1iKqXjMIXBnmbqE2GXLnoxssN4JJGYTw9MH52vo29LsNMwggYF+Xi3XTJSCS
         /F9CE5MzruDKsbA6y3qdqiwUm9zyMYoq1o6GSSbUVyLoTrvzKq6khKUIZc2Ag/gkUam/
         cYx6DajmlrGeazcj/7fYGdInRr0atcc1jsFQ6/6LTliHKjyJX8yroUUfHpF4GY0E/mu3
         hrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35MVTaZKaPU/nCfEJKJVMrNWs/kfExSy1eX1gUaMNug=;
        b=UXw0Oi+9fVA1P91GUOd4hbNOVO6ZUTEcbyJGBXS4SWfvoSXsvr5RMwAA/mmUIwMgIf
         HKYxbURyb7AKb5f8gykMcGY5SZHX0fCEjn8iZR/JF/y5a9bfgblBD3mKW+ySvkflQrD6
         CUqYykiFPC4EP17KJXJ2hhkZ9owwMI8s/rJ1/1fOjlaM9LKPu1uz2Fre7jkNoycH10Pb
         j0O+EbFAenEwDz2Uc/Q+Cy+/HkeKleF5UAbyHR0IL/ZOxIRVLz8aS10of2l/DvVcwKua
         sRl5bc5RIxc7cNZz4q5qtlRsubz2iJjO7/ZCSyR3ctLS1usMMNuLTdr20+CYqMuw3jBC
         664g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDw0eq7ekWmYcbCyDprmn0P7nrvt7h59BpWGaixWLqYjfbta7O6E
	HDLbDdKxcyOSQKr0MdpxnXc=
X-Google-Smtp-Source: ACHHUZ7SaOPU+OPYUE1HSNbth1JcTHji5b9c2L0dXjqBBWL/Yxqzn33wsFIuvntsdz4oezWUN6NLjg==
X-Received: by 2002:ac2:5973:0:b0:4f2:769a:120a with SMTP id h19-20020ac25973000000b004f2769a120amr831715lfp.10.1684528845243;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7715:0:b0:4f1:422a:cbfe with SMTP id s21-20020a197715000000b004f1422acbfels272782lfc.0.-pod-prod-08-eu;
 Fri, 19 May 2023 13:40:43 -0700 (PDT)
X-Received: by 2002:a05:6512:48f:b0:4eb:336c:f10 with SMTP id v15-20020a056512048f00b004eb336c0f10mr1069627lfq.57.1684528843098;
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528843; cv=none;
        d=google.com; s=arc-20160816;
        b=DYMn1Y9OY4KlF1qZ31UaOn3YSFjzLC8xIn3gk5SOQurvvRy6nu0HlzS3hBOY2SrVoH
         rNGqo2Pf/C0i+dxEd6xCRT/JGS+OUruFmdgLsf5o2K+zno5dxek15orENFjqn2EZ3yyB
         k8Cdl82ZZaqP0PtVgI8Azd3WLyXLM9S+TVB0G3fsZkpHpzqij+BFeoyynQnTuJuorvso
         082CsLFhhPJpiIBj7Q8/Pe9Dpo3XJzF6D5Xj3LflmseFWPHTRShxbo4u4HLaJW4PaHs2
         c7PMQJPKySrFhThMZ64KC9CBW7qSCfoyFbVe9QtCR6akqSdt5Ecgoj+ZlLcMnAsssnQz
         M17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=FaGq7EJoiPSOI9weEyS9lNh1oTtQiQxWLD5ZWLWLoR4=;
        b=c9te+pIrpTmOwQZjrDPMoc/kjXca8SgEQLRHVaAlz21bTMtdmm5uzMRjOJoxNWvYWx
         ODoFBXootMomZcnUZaWj8RJ7fLfcXndYlTC2WuMWguwpX8fMZA6qn8IXSdUDjJRzRn9z
         FP9xUT8QuS3yfIL5D7a1zU8WLoZ+sK0jvQxqHYepl5bNVuM5k5wvxG//fZadtkR5Wzra
         Tvi48lMi1VPpim6exiGldZ+DZzaAc7kdaUs9D4QGpzdjhpengWjqvZiwkGoeIl48xBX5
         pz4NrQJEzRFVnG6GszpLV7SVsT1EoGdD36GTFQHcOvIzCC2yV79W/nHr4v9K4MmAf4nC
         jcng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s18-20020a056512315200b004f145238b58si11912lfi.4.2023.05.19.13.40.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdQ0MShzxpk;
	Fri, 19 May 2023 22:40:42 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 01/73] core: Add internal event check before hypervisor activation
Date: Fri, 19 May 2023 22:39:21 +0200
Message-Id: <20230519204033.643200-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_6000_6999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, TRANSACTIONAL 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __SUBJ_TRANSACTIONAL 0, __SUBJ_TR_GEN 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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

From: Jan Kiszka <jan.kiszka@siemens.com>

If setup code triggers any event that is to be handled on all CPUs, this
should be processed right before VMM activation. Adding this will
consume the superfluous and to-be-removed flush_vcpu_caches. More
importantly, it will enable handling of update_cat properly on Intel
x86. As there might be more cases in the future, install this pattern
for all archs right from the beginning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c      | 7 ++++---
 hypervisor/arch/x86/control.c             | 6 +++---
 hypervisor/arch/x86/include/asm/control.h | 4 +---
 hypervisor/arch/x86/svm.c                 | 6 +++---
 hypervisor/arch/x86/vmx.c                 | 4 ++--
 hypervisor/include/jailhouse/control.h    | 7 ++++++-
 hypervisor/setup.c                        | 5 ++++-
 7 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 9fc42761..400490ae 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -2,7 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) ARM Limited, 2014
- * Copyright (c) Siemens AG, 2016
+ * Copyright (c) Siemens AG, 2016-2022
  *
  * Authors:
  *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
@@ -62,8 +62,9 @@ void arch_park_cpu(unsigned int cpu_id)
 	resume_cpu(cpu_id);
 }
 
-static void check_events(struct public_per_cpu *cpu_public)
+void arch_check_events(void)
 {
+	struct public_per_cpu *cpu_public = this_cpu_public();
 	bool reset = false;
 
 	spin_lock(&cpu_public->control_lock);
@@ -125,7 +126,7 @@ void arch_handle_sgi(u32 irqn, unsigned int count_event)
 	case SGI_EVENT:
 		cpu_public->stats[JAILHOUSE_CPU_STAT_VMEXITS_MANAGEMENT] +=
 			count_event;
-		check_events(cpu_public);
+		arch_check_events();
 		break;
 	default:
 		printk("WARN: unknown SGI received %d\n", irqn);
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 2bc47a6a..b46347cc 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -160,7 +160,7 @@ void x86_send_init_sipi(unsigned int cpu_id, enum x86_init_sipi type,
 	 */
 	if (type == X86_INIT) {
 		while (target_data->init_signaled) {
-			x86_check_events();
+			arch_check_events();
 			cpu_relax();
 		}
 	}
@@ -177,7 +177,7 @@ void __attribute__((weak)) cat_update(void)
 {
 }
 
-void x86_check_events(void)
+void arch_check_events(void)
 {
 	struct public_per_cpu *cpu_public = this_cpu_public();
 	int sipi_vector = -1;
diff --git a/hypervisor/arch/x86/include/asm/control.h b/hypervisor/arch/x86/include/asm/control.h
index 2566e115..7b15de35 100644
--- a/hypervisor/arch/x86/include/asm/control.h
+++ b/hypervisor/arch/x86/include/asm/control.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,5 @@ enum x86_init_sipi { X86_INIT, X86_SIPI };
 void x86_send_init_sipi(unsigned int cpu_id, enum x86_init_sipi type,
 			int sipi_vector);
 
-void x86_check_events(void);
-
 void __attribute__((noreturn))
 x86_exception_handler(struct exception_frame *frame);
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 9b1664a5..1193bd25 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -893,7 +893,7 @@ void vcpu_handle_exit(struct per_cpu *cpu_data)
 		cpu_public->stats[JAILHOUSE_CPU_STAT_VMEXITS_MANAGEMENT]++;
 		/* Temporarily enable GIF to consume pending NMI */
 		asm volatile("stgi; clgi" : : : "memory");
-		x86_check_events();
+		arch_check_events();
 		goto vmentry;
 	case VMEXIT_VMMCALL:
 		vcpu_handle_hypercall();
@@ -944,7 +944,7 @@ void vcpu_handle_exit(struct per_cpu *cpu_data)
 			vmcb->eventinj |= SVM_EVENTINJ_ERR_VALID;
 			vmcb->eventinj_err = vmcb->exitinfo1;
 		}
-		x86_check_events();
+		arch_check_events();
 		goto vmentry;
 	/* TODO: Handle VMEXIT_AVIC_NOACCEL and VMEXIT_AVIC_INCOMPLETE_IPI */
 	default:
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index f610e507..6caf92c8 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -918,7 +918,7 @@ void vcpu_skip_emulated_instruction(unsigned int inst_len)
 static void vmx_check_events(void)
 {
 	vmx_preemption_timer_set_enable(false);
-	x86_check_events();
+	arch_check_events();
 }
 
 static void vmx_handle_exception_nmi(void)
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index f2b07c0d..e0c21270 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -190,6 +190,11 @@ void arch_park_cpu(unsigned int cpu_id);
  */
 void arch_send_event(struct public_per_cpu *target_data);
 
+/**
+ * Check and process any internal events pending for the current CPU.
+ */
+void arch_check_events(void);
+
 /**
  * Performs the architecture-specific steps for mapping a memory region into a
  * cell's address space.
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index f0ee0896..e4e7fe1f 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2017
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -261,6 +261,9 @@ int entry(unsigned int cpu_id, struct per_cpu *cpu_data)
 		return error;
 	}
 
+	/* Process any internal events generated during setup. */
+	arch_check_events();
+
 	if (master)
 		printk("Activating hypervisor\n");
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-2-ralf.ramsauer%40oth-regensburg.de.
