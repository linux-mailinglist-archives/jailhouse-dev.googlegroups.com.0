Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3C55B9B7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id b2-20020a0565120b8200b00477a4532448sf4709472lfv.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=nqgKi2j1iclOVdMSYO03vZ958gg2UrsJCvlaV7UJ9+V9IsxpFtKqbWnvXKnUMJZ9VH
         F1v7X5HwQ6GvmXg1aYKYKSiuO8noz6pskc9WLJQTk9Bq8bZyCGhkskq6cwp9j3HEauln
         skM84IFfT88igw2OhuPAKeXBTJUc11vp0u918geP3JCGRyM0nHIg3Ps2tY/9XmjPEAzV
         i/wsd5qx6kv2P2hxml/S7jxhtnoSTo/QnAFBoaY0dVD02n53Ov9YymRRnobormM/q51+
         e1MIEVo181iSMuyN2+Qi/ysR81H8eAqQ9IXgycnQf4i5F8S76Zp+a163IuA/Wexvl/HQ
         F6tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pIGyH3rDhxDJh6v5L4uR8d1mdAehIQ5kkP77hV+phPU=;
        b=y1HASD4mmYKSq2tGrqVEkNQefsZm4REH2BkFq4hb5gL8IStghZEehI8frbD5q8A1Qc
         Sz6Zxeg7nAgXxXZOQXdgTVBW/VRT6q6PXGSWY3Sl/uOfotHVwXNV6uzHvphvugWxhl+B
         AFTt2b8DIPLIwhA677mgwRJcQgurTTM4ETh0cDxOuPuukQYopRHngR/2Gp2ySi6JL2rQ
         aLavHSunSeHqCC60Hx9CWwSu+YCC8zZMNCBgArP0QlAiJE5PUWy5FrkBXaM1ayDDBouJ
         rQn4XLCXNM3c99dwB5HZe9Xfwi2MJWK5mpBQmS5BwP11kEALv0LzD4LWcCtNhSWpWBi3
         ICAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pXQnq87v;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pIGyH3rDhxDJh6v5L4uR8d1mdAehIQ5kkP77hV+phPU=;
        b=Q/IqoPGRs7QExsD0KnxtQmfilKGeupEKMDGxvZ5bezA8iLU4mTh+VRuj0o6mc/xHEM
         T1F+kkgWoc6DORbU5oE6dndE0k5kEXulra71+an3++NOhTiDBMLGy/w2DJh6giuVWY8D
         NAcaxdsxWCwtffgKTY382FuVXy9YwaX1F6hTSRPhM0uXq1GdBVErA71J9mOFZmynA90N
         p4ZenvEohxnWjrm64z6MMUdFGPXXI8Q+zr+7CP9C9rMcVdvLJYuDDZ45eRv2c/bJhL92
         t5OwJNF/PJQnwSDNejbGT25eg1LKGBe2frTDUhFIGOabgMuSSsAoPMSXJoU1FC7JNo/X
         Ft+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pIGyH3rDhxDJh6v5L4uR8d1mdAehIQ5kkP77hV+phPU=;
        b=QKZC5GrptGdp71+WMmNROK9wGWqfl+aSC+rhV5MpXfQuo1mC+expz/s2t10qEVBxlC
         zeJMyyJ8wZawPoXJWpvtxfYoWMCqj6hYLHPjknGYKlInYhnqnYwD8KKM2E6zMxINY3In
         bF0SSoOY5tDjB6oTpNzcIIbSjPjufGz9D2/wq0Q7VHYlbinYiI5WJCED7hsZsuBqJvUF
         ZustyPCnuWpys28lWfsi2eCAjp2dcTWGwEhDbO829mZQ4Z7o8qB5F2Grwh+zLdoe649l
         xA1syo9VCYOz3LR9b1+rS75zuRbEjYCdAUkdX58/7hsvS/JfStlBZqsxzls3MvaaHrp3
         2QHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9W091chuXxH5O+Zr9lvCIhH/aR+3H5cOw8ykyt/NM1SKe0COCB
	1TXuEAdR9EyNSZEzAckBOG0=
X-Google-Smtp-Source: AGRyM1sqUeMwxy76T2Rvnlpk3x667618xjJep1BsWXY+4PO0fnqI7FyfbOQI56vVIruzyj6n66TzNA==
X-Received: by 2002:a2e:9ad0:0:b0:25a:7156:26bb with SMTP id p16-20020a2e9ad0000000b0025a715626bbmr6594273ljj.141.1656335618752;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b041:0:b0:25a:7050:86fb with SMTP id d1-20020a2eb041000000b0025a705086fbls3325863ljl.10.gmail;
 Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
X-Received: by 2002:a2e:b911:0:b0:25a:9942:4171 with SMTP id b17-20020a2eb911000000b0025a99424171mr6397451ljb.426.1656335616872;
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335616; cv=none;
        d=google.com; s=arc-20160816;
        b=QbB1Gmb5tOE5+At53ru1XZg0W2WzjVdVKLRwPz75k4nY5Dyd7xv1VZk+Sw9XY0bTUD
         /XZVNeLVQklsAdt3l2cMsgubErI2ZwloC2QeoyFpStPpjJLUiD62Jc3m/3dOnR5blHqN
         pk0LD6m1QAv79oK9W4K+d0XnoJibNHM7/dPawaukjIlbYS+hmXpP5gDCB08IKzQtiTA3
         lkxRkR/X0BB1J4mDKhC5h/9homgQwUpIsFQuocGrg4ReEue6BB03gMgN+RLxgeye7WOL
         Oh8pXpNnKZw2Bd0UWOJHQclOfPjyp0Yuezzwv6ydORwfrltF6OU0O8mk3Z38ww/6Gigg
         W28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S3nDismc4g0n3YlCRoAIENcWIUf3Pm/CxGWH7x+MWi8=;
        b=0A9O341+RX2UcUxtpgFZ5sXWNzdRnbQEeyKzKibmffbcyKl6FiGEoBLFsbnGAjHz1R
         +ikTMUnpXEoVjSr9OWliyjGgI7q35Ufihvd0YtLsDcI+2T2TtVGD8I9P2FkZ7CnXX+fq
         L/CBV/Dh5Un3SSjH+rJ8yCf/u4vgmcp79dDyXCQ24V18xMSYkGm6nefl4zwo9HxtbNRz
         ASIqHcEZwsfXgU2kJ9SRQJYu46nqTsiAO/02szCF0le+XS4ujP+u22Ay/F8atINBFmiv
         xoj0gmWCQ1PhPClPBXdL2eHhuv2xNnRFtHJXOldQgLpqqBin5VtIdY9IfySF863UhpJG
         I90g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pXQnq87v;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id p16-20020a2eb7d0000000b0025a71229262si380769ljo.3.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp800VQSzxxZ;
	Mon, 27 Jun 2022 15:13:36 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:35 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 01/20] core: Add internal event check before hypervisor activation
Date: Mon, 27 Jun 2022 15:13:10 +0200
Message-ID: <20220627131329.3659-2-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=pXQnq87v;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index 5a69710d..03dfc69a 100644
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-2-ralf.ramsauer%40oth-regensburg.de.
