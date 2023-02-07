Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZUGRGPQMGQEOQXEN6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98D68D68A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:14 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id h9-20020a1ccc09000000b003db1c488826sf10508489wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772774; cv=pass;
        d=google.com; s=arc-20160816;
        b=JvHtYOnOcjXBxgL4yx0aUe52AhVNI/QQUdriBJ9qCnwq4YpLqhi/4sVwv9p6FmpZQH
         ZX3XW4UhJhG6UbwlrzXXPuDRdM2Qji9fGHQbFOjhF3tEOVN1IZXElPOn/B1FWC1rB0JQ
         r6jqUwlDHJgewqbSZRfZBr1/r6lUQMfBVniy07zeW1Jv5rVsRCAa2Mg3Na91bcXis9Xy
         pvqFoP9fqL3KqyhF/EUuZ9YYoqgdtLN8RwvZ8dFMdaMTupHdnDsbVCVosJCL0iTs+f3Z
         FeGH8qXWEG8rHBy7yWBRC5m/ui5F8/vfgejDlNUZRLLP7PAo72jI5AKSmLu1SzBqlZv6
         hjIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2U/7patXaR7jfgLP25Bz7/ZNJsvYv3+eiXVi87iXytM=;
        b=Vp2UcB9PLyYyuN5Tg50/rRkDRsFGMJreNfYi3qqDQW99HsTqxyLz0KOMLA10A5zlj4
         TQIfsESSHVNY6phc1v/zvb6f/c6KVxMhEGfVuKsp/Dj3ws8jGxPfbzTjQzGbFizaGs1s
         uMpanTkt1HXNnrU4yJhArmjkKRPk69Hqwf6Utk/c7GXIuMZ0/GstuORC7cPDYn47JupH
         RW9GtDITzLmn7DeZ7oaFeyGt1EDfXF4g21BAy37A/zRmoP/XbuRy1qvV/rwgFjL7dUyg
         DO9fsffCwzrb6Qo29AK+VWWsj/nQ6h6uOxS9ksKQcl6Be6882gs5pSGPS1nlyIXmqmIb
         3IDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U/7patXaR7jfgLP25Bz7/ZNJsvYv3+eiXVi87iXytM=;
        b=SGwANIBlFlS0u67Lu01MvjnnQsZjSfnH4+2M5gv9EMhA/a+bBj5xTEduLmmC57DgnS
         ToNgH/cK6/WUNvOCobx3ohV1h85Qudghl/1r0a+YSg43eurH4gXXFQCJatgnC7ZoZpbF
         JlRxR4o5QSCb5YjCdJw/ANrmLNCPNdeeqHs1MpK/crKpBlS4Vq38KAEGIYk11nNzYroq
         SmwedOxxj6nFCKPL3VSFuoszIXVJeceTc8Fd0Y15ikL3qtWE/EujunO6yFhjJKllfWsH
         tjDUYoE2azeT2hEUXNSgPWFre+AaXYUX4szqzpfD8KAqATPqouxmygmk6HPbcg6MPUzm
         yr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U/7patXaR7jfgLP25Bz7/ZNJsvYv3+eiXVi87iXytM=;
        b=7nHFZjiQPoJ9p0pYKJCd8kEuI/M+XXmWzZu1pyKJkoaNjLc8udGr+YsdpuS/yTqnjw
         YPDMXUl6z1QBg+U2AYObtcgBeu3QeH5RW57282mFKAMZaMw4IsZsAmlhb7K7unwoSEyn
         9opEO2E4eCIB+w/R3icEzw6QB63Nu3pmNx2hD1UrW41p6GjoxPcJ+Ku6Tf4wgyt8Y/6F
         UPFaJ+ZC+APa2q11ueFCXgR+R5/Kd1qPuG5HGv0pHf3f2NV0K+gHj3T3LcrH1HGie8tf
         xG+nxmax/fe54JA6HUCfr8YNenkWM3BT6sJ6NoEvCC0f5eYGgAcMRuUSLLSSnBFdh48n
         J7RA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXINaEjyl64jz4EUb0fZAnrCGkrAJrPH38P+bHr2kngDDQigxPx
	HW0AA62OFFakUU809H5FHHQ=
X-Google-Smtp-Source: AK7set9WDW9s+pdjUchaQMbfejSMi+4Rx23OlxTL6nXpb05ckVPrRU/eMFDoQ3CVkgx3stcxPzQxcA==
X-Received: by 2002:adf:ee8a:0:b0:2c3:ec08:75af with SMTP id b10-20020adfee8a000000b002c3ec0875afmr105283wro.104.1675772774539;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:18c3:b0:298:bd4a:4dd9 with SMTP id
 w3-20020a05600018c300b00298bd4a4dd9ls21077506wrq.1.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:13 -0800 (PST)
X-Received: by 2002:a5d:4b4c:0:b0:2bf:ef3b:d072 with SMTP id w12-20020a5d4b4c000000b002bfef3bd072mr2937494wrs.0.1675772773017;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772773; cv=none;
        d=google.com; s=arc-20160816;
        b=dJJJzg1Briyx/JmLI28TONlvSf+BASLv10QWpZgwYNjpzFQtqQuZDF8VRstdmyGUSc
         A1JR2He4TXfIjWejuHxBuEedA8dh+8sDsqKcGi+opPzrYJTJAbL0yMwpoKL5wnAbrfmb
         QfMF6sNvmrR7s06nDf/c82EPeKQDFjzaMGnHzCDtq+BkJ1AJ8/zHOMtnTu8zTMwgPUBY
         6d+grINRXIo0GCi3h+d61QB8ZanduulqGT3xbG5jjo5cPyDY5nftosiAgwCfRiv9dKe8
         Dz9qU+6IyX3T20hHlcrYADvc4EIUZF66s2vtxn5Zb6KpF2s2J/HWsgCA8eY0DI22GBcE
         +9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=M5l4+aahkvKY3PV1YpLtcsRRh0tRWwSh8gGWM5/4drU=;
        b=JyOlLhtoFqVOyERnqfSaHK6dQPP5U3JY0S/Jvhqv0hORQohV2NJand7DwMBtw8inef
         lc8ynNiZ8hZc2xdvzye6SlhVfO+vD3E1ENbKkYx6rxej9yvTbzFFJ7IgLt1EyS5yZH3W
         ulzjteWROhz4JzXgM8v/JIjEKP9jUWp1priV2nazC5xlw+i/dXMBYXQImJpwdRP3IpdV
         ynjFahW+1YVx1scA6ywOfo/pfKm7BNP/tkN8jIb8JkT//vf13KleEP9dHkP+MU/31yER
         KYKEmyXJ41vmRyqfSkI3kaYX91DROvO3TxLqROZRkG0iJdfrDrraVg2xY1mpyIrbqitv
         DoQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n35-20020a05600c502300b003dfee13a6b4si646584wmr.1.2023.02.07.04.26.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RS4NTSz106g;
	Tue,  7 Feb 2023 13:26:12 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 28/47] arm-common: export for_each_irqchip-macro
Date: Tue,  7 Feb 2023 13:25:24 +0100
Message-Id: <20230207122543.1128638-29-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0,
 __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

We need this macro on RISC-V.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/arm-common/irqchip.c   | 5 -----
 hypervisor/include/jailhouse/control.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index 59e5dd53..c93117d1 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -24,11 +24,6 @@
 #include <asm/irqchip.h>
 #include <asm/smccc.h>
 
-#define for_each_irqchip(chip, config, counter)				\
-	for ((chip) = jailhouse_cell_irqchips(config), (counter) = 0;	\
-	     (counter) < (config)->num_irqchips;			\
-	     (chip)++, (counter)++)
-
 spinlock_t dist_lock;
 
 void *gicd_base;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 2e2446f0..ddb9d039 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -106,6 +106,11 @@ unsigned int next_cpu(unsigned int cpu, struct cpu_set *cpu_set,
 	     (counter) < (config)->num_memory_regions;			\
 	     (mem)++, (counter)++)
 
+#define for_each_irqchip(chip, config, counter)				\
+	for ((chip) = jailhouse_cell_irqchips(config), (counter) = 0;	\
+	     (counter) < (config)->num_irqchips;			\
+	     (chip)++, (counter)++)
+
 /**
  * Check if the CPU is assigned to the specified cell.
  * @param cell		Cell the CPU may belong to.
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-29-ralf.ramsauer%40oth-regensburg.de.
