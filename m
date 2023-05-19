Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTV5T6RQMGQEO6BQK2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0370A0BC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:47 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2af225e5b6bsf7134911fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528847; cv=pass;
        d=google.com; s=arc-20160816;
        b=wEunzvjU0u8HZK06P+1zMEWnR5uElKOe3K5LDBPJ3NJ00i5xKkT5nptdjsnv7CiE3r
         yrNnMTrIC+TqcgXZhNNtgSsXO4V594E2BUgnnYZtQZ32bALx13OsdVdUGJKsl8nL3aqN
         rCcNJKw7OSexbqjd4nqc7/sqVo1tXlIhRNcUCSL3ah/+NcE+P81p+aNUEd7PbqjVyGKp
         xtIFZDTyatr9OdUegRJEQRWGtn/ABpjde3ZGnCTd5BS1+5BPjVUcaZJE6Cy3y0QYCHsA
         6i/EVN0VCV0rxp6mDoZgdYAbKSXLQVMfbfDZvxDHQ1ZZIQVowiKel2dWrApQV+CMviHA
         HsPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ad5Z+IdHw3GuS2VacvrXlIup05nKG05mPc05EBH5xzw=;
        b=wDKfm0Y+urAHDoH8tFaZzYzbC6sj4q1UHoH4jU64tPUVHVUFM6tuCq1JxQnCZSmvvi
         cmdM6mDQIDGCRVqU7A7q8yPYbVj7dzHS3T6qc44rAI9eTmCgkFC/V5lsUWtd0GsWq+pm
         C/XoWAk+sgsDGgRHqNENPEnKS9EnQR6NIyVwaB9tahC38WBV1+wJnbxQR/ITsD7XhGYZ
         2XVgsWw4r3wOuCOOp4gm/UsAdWVAE5WXhJBc/Jn+e9qrcnpIwfgHB4g1A37qbeMfe0WK
         Qg1+tGwTPzxIEI8W/8gvHR40LODY3F6FqkgzA2yyXlFBdjYsf+kTqKVUNZsSD1IepsqT
         +M8Q==
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
        bh=Ad5Z+IdHw3GuS2VacvrXlIup05nKG05mPc05EBH5xzw=;
        b=OSOQE1nSPk30yCJWIvUDPsXcIm/j8u2U6DmgYLIvKh4AX9OLTaEgsajbfARz8GHMI1
         NCa8FwoNR8p8CRkwCoDmF7xVmXkCyWee91TSwmnz2R6Gk+8WIpvkVuZWrVRhkwTJ2u4f
         c9tZdZ/rLXyy1I1Tp9e+krRoNNKGyUcmCXHYbCexRvsgdL4CbER7J6VzyGAgbypoXKve
         ZY7W1QIwniCGc9/mOfGz/WVbY3nv/u+rSOD7rdx0YIbyGL0IOGYLGFdz5fUxCpDmjeFM
         Xc8PpjCsVSo3Q/SHlz2akKSS/8PQwinmOmMyxzY4xUG9lulf2t/iftejm+WcbkjYwTXi
         ThnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad5Z+IdHw3GuS2VacvrXlIup05nKG05mPc05EBH5xzw=;
        b=AugEnIEZ7MTIAeGfSdSI+t575mCM+BLz/N24dbDVm37C9jWxClFdan2VvD52rI3m3b
         APrGa00L4bIvh4JBimvBTcv9v1KxdW34Reohl0F39aACPApgnkIx/JBxz3zzHhCAYu0I
         VODaQ2aajAzBSbpF44I+WgzBDAJxkBPvdZXxOy1G6I19IuM4k/5z6onmfYPU9kS+6v2w
         ygMyFkJFVcLKyPBq8nz49bfuLmzIJP7BHT0Tpagq8VF1aOsTAZIPu2G2nqmOKEEydfPL
         OS1+uHZN6R+Vug48drY0LKK4dXeTNygJVPZ1Om49pDgh6Dha7WYTOKrwMfNUgQ8vwdrQ
         6PPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDytKVMYjmH8d23TJCbkJHw+YxsUKS7vPDtKY9aWb2qZsHkhiRNZ
	+wGRy3lGYteR285n1FWwN/w=
X-Google-Smtp-Source: ACHHUZ5Gim+F87IL/7jOfOc4tJU0++FqT3hEOqT399SCYCm5kjR+5qiHGu/tm2lBzx/AMz5n2n1W4g==
X-Received: by 2002:a2e:918e:0:b0:2a7:82a6:a8f5 with SMTP id f14-20020a2e918e000000b002a782a6a8f5mr765871ljg.0.1684528846858;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a99c:0:b0:2af:1a18:4819 with SMTP id x28-20020a2ea99c000000b002af1a184819ls143040ljq.0.-pod-prod-05-eu;
 Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-Received: by 2002:a2e:8404:0:b0:2af:2466:1c18 with SMTP id z4-20020a2e8404000000b002af24661c18mr1072712ljg.18.1684528844942;
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528844; cv=none;
        d=google.com; s=arc-20160816;
        b=FMH1bkuJygRnvjxvWrnnIS2ZkmSnfqbHrwAxFBxyyaHCJ8G8OTJ9triISBZ++D46t3
         xxv8FFE4PD0veVe6FNzDJWgO9wmaber4wUIY07l6PadRc3tiP14yBzXsLTmPNdZHtQ81
         xHlRl2iMiBYBHOPc3jAZqZtrygrnXr1xtcHqM1NV7Jbg9kCATtcNL5/elqWuHCLqj6Vy
         71KHtrTmQt4aNlwCItib+gsuCiR4Ie9YPv7DkrEjgZSE9PGEnNt+SgWjmdM16oAXwpvV
         M1eOYpNkcBSA6qjh4G6jDMFO7PEQ/0rVmcIhBlo+yaSig5+kqWAdXp/p+FpWohQSOs7b
         hflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JsQzZPmXYwTWnGW7GNg7MTEteAg1fZSMY1+40VNGNAU=;
        b=bu0JDyY2yU8ZkZS7X3d5W0wXbyWK/jv1RtRPckAmKo1jGAxxoqNO0CytLwdHZA18ZN
         WSk7ysRzFhiKR3Y3R83zbRaHfDYWBuYG6DHZ3RhWwhmJ1U7MKVICFp+r9L/FvjewXz6j
         PgOLLcSbbQN48LrwmW/zvPTiCQsyEZa3ozUnjbkClFLb1Uk4FIAagGfcOX7W9oICiopB
         mD9Aa7hMKeMO0mwIvKHTS3C3fCa158aFe5Kd47btYYr+aoauv8WsATpu3YR/HnRGTLA3
         ilvfSZjbzEiY4+ho4yDgQqUX3PZ/yE9Fl0r5xyiLSkbK0WpBHkqxbX7g+JgYWXySIob4
         3LGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h16-20020a056512221000b004f3b2f0559asi11390lfu.5.2023.05.19.13.40.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdS1LTpzxpk;
	Fri, 19 May 2023 22:40:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 08/73] x86: Rename CPU_ID_INVALID to APIC_INVALID_CPU
Date: Fri, 19 May 2023 22:39:28 +0200
Message-Id: <20230519204033.643200-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

We already have INVALID_CPU_ID, so better make this 8-bit version of it
apic-specific in its name to reduce confusion.

No functional change.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c             | 12 ++++++------
 hypervisor/arch/x86/include/asm/apic.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index e861ec2f..95edb2db 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -33,7 +33,7 @@ bool using_x2apic;
 /**
  * Mapping from a physical APIC ID to the logical CPU ID as used by Jailhouse.
  */
-static u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = CPU_ID_INVALID };
+static u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = APIC_INVALID_CPU };
 
 /* Initialized for x2APIC, adjusted for xAPIC during init */
 static u32 apic_reserved_bits[] = {
@@ -151,9 +151,9 @@ int apic_cpu_init(struct per_cpu *cpu_data)
 
 	printk("(APIC ID %d) ", apic_id);
 
-	if (apic_id > APIC_MAX_PHYS_ID || cpu_id == CPU_ID_INVALID)
+	if (apic_id > APIC_MAX_PHYS_ID || cpu_id == APIC_INVALID_CPU)
 		return trace_error(-ERANGE);
-	if (apic_to_cpu_id[apic_id] != CPU_ID_INVALID)
+	if (apic_to_cpu_id[apic_id] != APIC_INVALID_CPU)
 		return trace_error(-EBUSY);
 	/* only flat mode with LDR corresponding to logical ID supported */
 	if (!using_x2apic) {
@@ -386,7 +386,7 @@ static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
 
 static void apic_send_logical_dest_ipi(u32 lo_val, u32 hi_val)
 {
-	unsigned int target_cpu_id = CPU_ID_INVALID;
+	unsigned int target_cpu_id = APIC_INVALID_CPU;
 	unsigned long dest = hi_val;
 	unsigned int logical_id;
 	unsigned int cluster_id;
@@ -469,7 +469,7 @@ static bool apic_handle_icr_write(u32 lo_val, u32 hi_val)
 		lo_val &= ~APIC_ICR_DEST_LOGICAL;
 		apic_send_logical_dest_ipi(lo_val, hi_val);
 	} else {
-		target_cpu_id = CPU_ID_INVALID;
+		target_cpu_id = APIC_INVALID_CPU;
 		if (hi_val <= APIC_MAX_PHYS_ID)
 			target_cpu_id = apic_to_cpu_id[hi_val];
 		apic_send_ipi(target_cpu_id, hi_val, lo_val);
diff --git a/hypervisor/arch/x86/include/asm/apic.h b/hypervisor/arch/x86/include/asm/apic.h
index 5bddf4da..17001789 100644
--- a/hypervisor/arch/x86/include/asm/apic.h
+++ b/hypervisor/arch/x86/include/asm/apic.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2017
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 /* currently our limit due to fixed-size APID ID map */
 #define APIC_MAX_PHYS_ID		254
-#define CPU_ID_INVALID			255
+#define APIC_INVALID_CPU		255
 
 #define XAPIC_BASE			0xfee00000
 
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-9-ralf.ramsauer%40oth-regensburg.de.
