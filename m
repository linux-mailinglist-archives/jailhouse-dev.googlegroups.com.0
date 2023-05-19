Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUN5T6RQMGQEMGMVOYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 542A870A0C4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:50 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id 4fb4d7f45d1cf-510ec47c66asf2089658a12.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528850; cv=pass;
        d=google.com; s=arc-20160816;
        b=vbbznYmVWiqh3GOkPG+ubxr2s8vXQC3oAKiKV90QOl8GE2tpDBQNkEUo4e578vwAHS
         CmEpOBIApKORMFx2vUFbgRw+7RqfLGAclzxv63vY+nUVEoZW7IANOTAuFRgEr8JQPaka
         JHDCZvF1SpMtLbAiL0qZFdrQsSXg85o/H5KW/1O0z8EIjrNSe3F0qc06uUWwleRoK+ag
         n7ZBddWg/M1hInHdi/X6BJao2RjxVt1u7HmjRai0rQrZI0xGUXRtgdjITVmvSAvXoo+j
         bLI4isS/qwWJhhgVIRKHwP0bCSGcT4NyrGKX2yMqi7+mvaBZ0tgW34VVXWvhQpXuBR9u
         v7Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=roC6/JvpxnysFosnwpEAu6/ZvPc/gTF+WzBL8MVDEWo=;
        b=zDjo5FF90zKWOkgwNwpmtuX+u0XcrhlXmh4XWrzQUcJlypeiVh9fNLxUxNQ0KRk7lc
         3c8+rs8U36TfbQcyRKfv8N+zxx530X52VA2clObRsaUCzkbXl0/aS55Qf0y+cmi/JVcX
         RsBUNyfiKqNYuji9QeBGjSmJkCi62Wl2kj+4h+ullIsj08rsQdrbPo0G9SmLEQXv5I20
         5Q8btfybMxlkezVpt/l4rXYTH2N3Pyx38CoQzFjoZZe2xUXzM9DE9TgPKMBgAt6R4qCr
         BmonkWWlheTm4oRUqlG+d+fbcCdbvZkl4JhPwRBN8+js0rBAMei/b2HUSIJF4VIh3Zi5
         xpqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roC6/JvpxnysFosnwpEAu6/ZvPc/gTF+WzBL8MVDEWo=;
        b=AkMx+u6g77EqxCCSpma5IGYBaF78DqeplIuQbc1K29aD32o4ERyFOSj5drm5/dW2mQ
         L1e3G0OF0fM3aj0laPrGhYmH0S91UWwgi6XdOm/Zuci5eRS+nOHG8Os8K1bZcncpIVkg
         C7ljMu+2cHduP9fDimFFvUHxsXf1EvxtR09Tt3VDt3pbu/66LRVJuWgJ/8idCmr4BMvd
         s6yLiO2HO7lyl58VRL/Cl+8lC7DqzQA6Dz30Qt7w3wb48E1nenmF34zNbwYjA+OUmBLS
         iQfDqZ9HONCVPbfFTneZPJbb7SmLwhOZ2hDVkEEy1HwE/6JUFgIlSzlNqO2G6ghU7CGu
         qdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528850; x=1687120850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roC6/JvpxnysFosnwpEAu6/ZvPc/gTF+WzBL8MVDEWo=;
        b=FdRL0S+WvCgDvUxnL06pKriEAwkpC31F7a1//QesY2Lih+bRvfRV85xUuZWvkIno3C
         +8B8xnueZ5IVp/9uulAIvFUBQqcbmcQsNcCjZ0A0VkHDZmNCXdVMegtLd+Nb6u7JEYG6
         iJ/K/h0JucvTrsicPhmOfbFiR+02r7e0c0Y45kpRiWMpKqo7RKKX0QHNUQAIeo5EJC2t
         XR4jMYtkWN+5UQ3Eq+VlOjQDc8A1dAr7NKcYB73pjIAa25wBCAUX3TTzE3ouly9GWML5
         ybiY/KIi2aTsoUrL8LRS43brJRw8a9yxdIg8aQ1xCkEli+IGxuL6Qml9LdTNnC70JpGR
         X8aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDx6TNbHOVAbU3XIRq3unCeYhbHtYWb+Xkxrapp0wtyTwcppYCIz
	pS/9sdNX4NC9SJdLLYdAr6k=
X-Google-Smtp-Source: ACHHUZ5lledPAx5LriQxnVgjkSNqvo/gQnlGM3IsXgw9/gEFi5JBOGhynEujUD3G+plGfS6SzrtnPA==
X-Received: by 2002:a17:907:2724:b0:93d:1b82:3c13 with SMTP id d4-20020a170907272400b0093d1b823c13mr1094242ejl.7.1684528849937;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d748:0:b0:500:49fe:820 with SMTP id a8-20020aa7d748000000b0050049fe0820ls646157eds.1.-pod-prod-04-eu;
 Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-Received: by 2002:a50:ee1a:0:b0:50b:c6c9:2146 with SMTP id g26-20020a50ee1a000000b0050bc6c92146mr2273954eds.24.1684528848164;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528848; cv=none;
        d=google.com; s=arc-20160816;
        b=u9u60aH3b5PrLFaITPGZxs46+U2Ei0gzjkga/iCtELjILMsaNefcvnuytaPbG8Mw8U
         xksTNcXpxbpk4Kltl9NAn5mvbwnVsROz7n89cxtpVMOZjhG89JVKygofj2bH3jl4xJaG
         rKNPFjcFPsKEJYuJyNDnG7UedyUCrtHpFc141d86iSLsNoOdfaqAOZuG0+jTOPw4wTVy
         VaY7QhvAZrWt7ZYbax8MapjswtAK6mN792Ge4rYs85zanVsTsWyeKYrLRFa36diI8ivw
         +xJnBUr7uPz6eKCujCSiZWXBEjfxp4SlfovfcV8WOmgEErK7apCAgjKyD5ydaF2SE1dg
         S+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Hu5GnkMQ+RdJcU+PvwFxNIRVNktP7KB2YJJ104s+k84=;
        b=fI6VjU2CqSkzzSfCrVrytetHGA/5X3zqnjLaNOsovViEDTsnhuDvpE6JaDM19uecTC
         jpqZ/2MwWhcvZDakyzvRAstjVj/Ktqqtyk6wKMdbH7qNOVxVBxsMw4aTcvje1g3l0IUC
         Fdc89BX1lxODzKYGGeDBxHszIAaCKX01z/PK43vE8JpeNrOjUZY6G4yu5aBiCvQ/izPb
         c+ghANqU51mrIH1zw2fNrHvoENBFXmaoYZKHRRi9URjg9xyHegO7Us40LT+L7wq42AQF
         lsGE7QmpH068zgrTCb2GmTsWoBCEYxYS3ELYEv+iSG9iOaswH7XizvBiP6XwF5IQrZ2q
         ByMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g26-20020aa7c85a000000b00510cd4eed58si20925edt.2.2023.05.19.13.40.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdW4cvbzxpk;
	Fri, 19 May 2023 22:40:47 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 19/73] core: Optimize parsing of large CPU sets
Date: Fri, 19 May 2023 22:39:39 +0200
Message-Id: <20230519204033.643200-20-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Currently, the for_each_cpu iterators scan the whole given CPU set
bitwise. Since we use static CPU set sizes, we scan even more bits
needlessly for most workloads. This is particularly relevant for sending
IPIs that go out to a set of CPUs.

But the common case of having a small and non-sparse bitmap can easily
be optimized by scanning the lower and upper boundaries once during
setup of the CPU set and then using those limits in for_each_cpu*.

At this chance, reduce the type of the boundaries to unsigned int
because we do not support 4 billion CPUs anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/control.c                   | 26 +++++++++++++++++++++++---
 hypervisor/include/jailhouse/control.h |  4 ++--
 hypervisor/include/jailhouse/types.h   |  6 ++++--
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 8eaaa46a..7a5304a0 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -58,6 +58,25 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
 	return cpu;
 }
 
+/**
+ * Update CPU set min/max boundaries.
+ * @param cpu_set	CPU set to update.
+ *
+ * @note For internal use only. CPU set must not be empty.
+ */
+static void cpu_set_update(struct cpu_set *cpu_set)
+{
+	unsigned int cpu, max_cpu = 0;
+
+	cpu_set->min_cpu_id = 0;
+	cpu_set->max_cpu_id = sizeof(cpu_set->bitmap) * 8 - 1;
+
+	cpu_set->min_cpu_id = first_cpu(cpu_set);
+	for_each_cpu(cpu, cpu_set)
+		max_cpu = cpu;
+	cpu_set->max_cpu_id = max_cpu;
+}
+
 /**
  * Suspend a remote CPU.
  * @param cpu_id	ID of the target CPU.
@@ -226,12 +245,10 @@ int cell_init(struct cell *cell)
 {
 	const struct jailhouse_cpu *cell_cpu =
 		jailhouse_cell_cpus(cell->config);
-	unsigned long cpu_set_size = (cell->config->num_cpus + 7) / 8;
 	unsigned int cpu_idx, result;
 
-	if (cpu_set_size > sizeof(cell->cpu_set.bitmap))
+	if (cell->config->num_cpus > sizeof(cell->cpu_set.bitmap) * 8)
 		return trace_error(-EINVAL);
-	cell->cpu_set.max_cpu_id = cpu_set_size * 8 - 1;
 
 	for (cpu_idx = 0; cpu_idx < cell->config->num_cpus; cpu_idx++) {
 		result = cpu_by_phys_processor_id(cell_cpu[cpu_idx].phys_id);
@@ -240,6 +257,7 @@ int cell_init(struct cell *cell)
 
 		set_bit(result, cell->cpu_set.bitmap);
 	}
+	cpu_set_update(&cell->cpu_set);
 
 	return mmio_cell_init(cell);
 }
@@ -358,6 +376,7 @@ static void cell_destroy_internal(struct cell *cell)
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
 	}
+	cpu_set_update(&root_cell.cpu_set);
 
 	for_each_mem_region(mem, cell->config, n) {
 		if (!JAILHOUSE_MEMORY_IS_SUBPAGE(mem))
@@ -493,6 +512,7 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
 	}
+	cpu_set_update(&root_cell.cpu_set);
 
 	/*
 	 * Unmap the cell's memory regions from the root cell and map them to
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index f01af617..2e2446f0 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -44,7 +44,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  *
  * @return First CPU in set, or max_cpu_id + 1 if the set is empty.
  */
-#define first_cpu(set)		next_cpu(INVALID_CPU_ID, (set), INVALID_CPU_ID)
+#define first_cpu(set)	next_cpu((set)->min_cpu_id - 1, (set), INVALID_CPU_ID)
 
 /**
  * Loop-generating macro for iterating over all CPUs in a set.
@@ -67,7 +67,7 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
  * @see for_each_cpu
  */
 #define for_each_cpu_except(cpu, set, exception)		\
-	for ((cpu) = -1;					\
+	for ((cpu) = (set)->min_cpu_id - 1;			\
 	     (cpu) = next_cpu((cpu), (set), (exception)),	\
 	     (cpu) <= (set)->max_cpu_id;			\
 	    )
diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
index 5ca81034..f8580f2f 100644
--- a/hypervisor/include/jailhouse/types.h
+++ b/hypervisor/include/jailhouse/types.h
@@ -23,8 +23,10 @@ typedef enum { true = 1, false = 0 } bool;
 
 /** Describes a CPU set. */
 struct cpu_set {
-	/** Maximum CPU ID expressible with this set. */
-	unsigned long max_cpu_id;
+	/** Smallest CPU ID in the set. */
+	unsigned int min_cpu_id;
+	/** Largest CPU ID in the set. */
+	unsigned int max_cpu_id;
 	/** Bitmap of CPUs in the set. */
 	unsigned long bitmap[(MAX_CPUS + BITS_PER_LONG - 1) / BITS_PER_LONG];
 };
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-20-ralf.ramsauer%40oth-regensburg.de.
