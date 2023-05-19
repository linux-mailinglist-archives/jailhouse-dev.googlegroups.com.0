Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D6570A0C9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:51 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2ac7e062911sf19441231fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528851; cv=pass;
        d=google.com; s=arc-20160816;
        b=lIRt3a59SVvyzMCB5wrU4EG1dxaYI/PCVK5ysl8G5iZkcKLuvlJgU/v+aH9vSSXA0t
         32GAywmZq3YDB/RCu1ihg3qz+AuRGFfJhMYDw4dfbPQ27bNVmu25YpxG4KcoY4YGBVtE
         E2wEK3R9aUZdgbXDyyF2FGxe8cGVTnY0xpzVhNlos0VN3pLUTi4zR13Ge8wfjPWkKf+n
         PObvjusl6mkgg2rvwF+PMfKgBIRlE0cBB74IuAnsldh6FGNI5AcppPJ+ZglkBjPN3DR1
         WjxgXJDtXspnf/+QYwaC0gcV3mko3TGdCEz71VxSGT9roMuqvrL9hK87KgaumwCS4BAB
         eAbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KRjMNr24N5WrbMV7GD8BoywVYHQDDNrbl/NLcsbBh+s=;
        b=yCf7oUMDDkU8zApL9bvRf+4aieEOY38OyOCmuyDzUra3xLHlCvx/dJ5FBBybCvN5WP
         Ux51/boquBam3Hte4jUeLPfzHc7oQcD8fgjDwI9P/IUG4q2E3k6sXZyjsJZSwkbiVFZD
         RbyJOKG9V6wcagdMNfFUbqi2+rrELHXKJjXySW3EjEIZY6wIAjCmNdthx06YNbzuccRv
         NTXFno+I7tdXx1G106pgPfBaIsF6or+7xPaLkFhXwQQoeKCRAn+8eZs/1ZByTeDuuEs7
         XrLmZqdq8NOEvp4sMZgey+hZ9V1VPLuTpMJtRHSN1XgVHOVfXelMXURrMDHikzTyHosT
         RKEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRjMNr24N5WrbMV7GD8BoywVYHQDDNrbl/NLcsbBh+s=;
        b=aFoSyrJ+8uccxRg4TyWTJ/QNiUjjhR8NFq7lFfhhK2WIjeXYULmFXiMx5M/w+mlpRg
         e2I6i84y3r+7OYLshzM8PkMFqOGrCp4o5+22oA6YUZbInGNVYWqT9x8aFIVteKgI0YzN
         NWQeepIpGUtvUfx5dYAHHQ2Cq1js64+YKv+6T1dhdcYT3+utWL6DhXIqXLT3UH3R13og
         wpWCMb9/MtCpRmZ9Y/rChumw8mjJexaTE7AKnerhRGu2Xx4Xf/Ziy6y8gSOTk3nRjgWH
         ZPyJdm6Pn8kDyJzRNWHHKGqGecLimTazyD11GjUyZpEgUPqhkHTg5a6T/r/VAPHYfSUG
         irUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRjMNr24N5WrbMV7GD8BoywVYHQDDNrbl/NLcsbBh+s=;
        b=aZ86Z6lWTMe9jaFp9HGxsX6zzjnJeU+palHw3xFbqay6MUIMRPHrEicmE046xVyRKe
         6oIDjCK2r5oUKZIky9bIWHHCPBliufcucl/8ik69fe9l39JGQOsasA1ndM3aA1CMXyd1
         IypKA6Uv6DeoQv+LwTuTuB8Og/xUK7hm5dlV2YICv6144aoeCEUjclstG1cm2CS2Kau7
         wbCZ/7v+LN+FGHMxi9NL0faXsz+7zyTNF7HsrxmO48Yq6umifl1SH9voSantOKR3yfni
         QyPFqXyitbXvblZMYsLofP7jQFhDN6ReX7ER2dZcqs5OJrB8a/kRwR+drkHVeBgln5ZX
         eTxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwIh9+W/OTpv9hJo+LoafBtLcY6FbeDjad5aowZTNwDXCRcVtgn
	GLXYDJq+W4WhzYmlWNtgc4k=
X-Google-Smtp-Source: ACHHUZ4aMdVwh9jOvLs6N/SWIhDMATvCcebqiTovdAgu0YFe4RUs8H2jQeAuh4yo32BGfio+Kxsztg==
X-Received: by 2002:a2e:241a:0:b0:29b:ebfa:765a with SMTP id k26-20020a2e241a000000b0029bebfa765amr740352ljk.6.1684528851204;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5b46:0:b0:4f1:4c37:e1cb with SMTP id i6-20020ac25b46000000b004f14c37e1cbls1546511lfp.0.-pod-prod-09-eu;
 Fri, 19 May 2023 13:40:49 -0700 (PDT)
X-Received: by 2002:a19:f702:0:b0:4f0:da5:773f with SMTP id z2-20020a19f702000000b004f00da5773fmr1152407lfe.25.1684528849198;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528849; cv=none;
        d=google.com; s=arc-20160816;
        b=IhjOpU9ehPkuybSqPL3649BVDCrPHo8n7hSLsLaclbo7k8B1bkb/A5YsQAc4B0hQKD
         YodeD84YcD/n4/cx7GV9ugC40RhnfswMNNj+/4tlS2ZqYtQW2U+G+7B6LSSUOPpFriUO
         O0H4B1GjIv0tCCy4aY7+kBry8qzfNFoY8jDVG2b7X1sC1gShDTW6mBFKTp1mhx+lTLxf
         hHouBg9i92F0JORchtSCVgOr6ryh/TzbxNLVShzICSQpsvhbsYeEGL+Tq9Fauh3bTQt0
         RAXrAvv8n2B73bjgvj4tapmWR0E5oFlUZtlIeIoRqsYruvjOrz+se2jfTcYDY9pATwcW
         M0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Va07Pib7HMRdchT9EH1Rfe9q3uKitlywR2j4Bhd0kB0=;
        b=aIKXJGzfVqGdVUQWYg3kuElGR2H4Dei62ips3YEh+AgLAQA0sSzqHmSQO0C/maddJt
         9t7XcD23p4qpHsveqVO7D7lsOrKd0nTLEHu4vZKuIyq9nhzhESlGn3w8mk15Zci2eO8W
         ywivGu+omi9QHSXCVfK3OUd1Gdzufu/95vAdUXqoxSldynAz/b3f39+V8l94eh9tAybC
         BDiY1mObgHQSF/iZKZJGfoi3A0Jip4uRB+vuaVw3Hf9c/UZx0ZoOvyFLTt8dQf4m2f8y
         miSsGt5DWzrYzD+U5zj5JI0FOr4K0BLKO0ywDp2vWvJTmwQUkcrXP3GAyntkA1HnZG54
         S2lg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bp29-20020a056512159d00b004f194563eb7si8204lfb.10.2023.05.19.13.40.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdX3LnbzxtC;
	Fri, 19 May 2023 22:40:48 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 22/73] driver: sysfs: prepare for exit accounting on RISC-V
Date: Fri, 19 May 2023 22:39:42 +0200
Message-Id: <20230519204033.643200-23-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, TRANSACTIONAL 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_SUBJECT 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __SUBJ_TRANSACTIONAL 0, __SUBJ_TR_GEN 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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

Besides generic traps, we will have a bunch of RISC-V specific traps:

Platform handling:
 - VMEXITS_SBI: Calls from the guest (VS-Mode) to the SBI firmware

IRQ handling:
 - VMEXITS_TIMER: Timers will arrive in S-Mode
 - VMEXITS_IPI: IPIs arrive in S-Mode
 - VMEXITS_VIRQ: external IRQs arrive in S-Mode

Generally, using a simple PLIC, all IRQs will arrive in S-Mode.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[RFC v2: implement fine-granular SBI accounting]
---
 driver/sysfs.c                               | 27 ++++++++++++++++++++
 include/arch/riscv/asm/jailhouse_hypercall.h | 10 +++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index 61b851cc..ac0b88b4 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -163,6 +163,17 @@ JAILHOUSE_CPU_STATS_ATTR(vmexits_smccc, JAILHOUSE_CPU_STAT_VMEXITS_SMCCC);
 #ifdef CONFIG_ARM
 JAILHOUSE_CPU_STATS_ATTR(vmexits_cp15, JAILHOUSE_CPU_STAT_VMEXITS_CP15);
 #endif
+#elif CONFIG_RISCV
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_ipi, JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_rfence,
+			 JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_time,
+			 JAILHOUSE_CPU_STAT_VMEXITS_SBI_TIME);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi_other,
+			 JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_timer, JAILHOUSE_CPU_STAT_VMEXITS_TIMER);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_ipi, JAILHOUSE_CPU_STAT_VMEXITS_IPI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_virq, JAILHOUSE_CPU_STAT_VMEXITS_VIRQ);
 #endif
 
 static struct attribute *cell_stats_attrs[] = {
@@ -188,6 +199,14 @@ static struct attribute *cell_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cell_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_ipi_cell_attr.kattr.attr,
+	&vmexits_sbi_rfence_cell_attr.kattr.attr,
+	&vmexits_sbi_time_cell_attr.kattr.attr,
+	&vmexits_sbi_other_cell_attr.kattr.attr,
+	&vmexits_timer_cell_attr.kattr.attr,
+	&vmexits_ipi_cell_attr.kattr.attr,
+	&vmexits_virq_cell_attr.kattr.attr,
 #endif
 	NULL
 };
@@ -221,6 +240,14 @@ static struct attribute *cpu_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cpu_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_ipi_cpu_attr.kattr.attr,
+	&vmexits_sbi_rfence_cpu_attr.kattr.attr,
+	&vmexits_sbi_time_cpu_attr.kattr.attr,
+	&vmexits_sbi_other_cpu_attr.kattr.attr,
+	&vmexits_timer_cpu_attr.kattr.attr,
+	&vmexits_ipi_cpu_attr.kattr.attr,
+	&vmexits_virq_cpu_attr.kattr.attr,
 #endif
 	NULL
 };
diff --git a/include/arch/riscv/asm/jailhouse_hypercall.h b/include/arch/riscv/asm/jailhouse_hypercall.h
index 7d54047c..107d25e5 100644
--- a/include/arch/riscv/asm/jailhouse_hypercall.h
+++ b/include/arch/riscv/asm/jailhouse_hypercall.h
@@ -36,7 +36,15 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS
+/* CPU statistics, RISC-V-specific part */
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI	JAILHOUSE_GENERIC_CPU_STATS
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE	JAILHOUSE_GENERIC_CPU_STATS + 1
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_TIME	JAILHOUSE_GENERIC_CPU_STATS + 2
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER	JAILHOUSE_GENERIC_CPU_STATS + 3
+#define JAILHOUSE_CPU_STAT_VMEXITS_TIMER	JAILHOUSE_GENERIC_CPU_STATS + 4
+#define JAILHOUSE_CPU_STAT_VMEXITS_IPI		JAILHOUSE_GENERIC_CPU_STATS + 5
+#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 6
+#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 7
 
 #ifndef __ASSEMBLY__
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-23-ralf.ramsauer%40oth-regensburg.de.
