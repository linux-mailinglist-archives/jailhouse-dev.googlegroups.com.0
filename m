Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBT55T6RQMGQEZ3YMIKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4370A0BE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:48 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 2adb3069b0e04-4f256ddef3asf2376697e87.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528848; cv=pass;
        d=google.com; s=arc-20160816;
        b=pDkxTrlv4BDszXWyEy/lvl2AzdPvNPAIkrWK+hJz75dl1x+tPV+osmELM3wSSJSuvM
         oZf8rURoIrFn1kaiglvNQrNVSpdG2eJ9/2M1+vbZegpVGIS9kiMk0D5QyG3QiDygS4Ag
         t/ygWDLhA8HPHkqQHecPCfx9PkVjABtNpo2nfk+M+tJHA//KmFPq1uO8iXR45UUgOC6S
         NoME2tCNYaux93QyXx6O02U57C0HsrnSNqcLZgJN36bZddeWSyD8+s1QhqpiG6yiyCm2
         jZ+/noQhfIlxT3p9QsVgj2rr3o9vjMTs5SsTza702SuZSw4c3k1AALOcLUEGdXqXQPBr
         IbGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mfpqy0vzEDVpYqpJKJrpHF3+3mOtkT2S5v6/Q5oQkeE=;
        b=DPUsvJXDaejFyykFQ3VQf1qZIFOgVVokt7KJQjObumEziWuiztD+HZ6ghLuclgRMB5
         SdSRlMpvXISuiMMAiR+BYpvVVdZ9xSs803b0fUbBLtQUCZtFLVQExiGB4Gdb8KiXGYJM
         +ON99N9mF41xuJBg4C7h5kfLEyP6qAva3m6vFtKslxJmkkeAclrCp6OCgco2/6w4frOd
         x+QJHsiSwhh30YtgrdNQJP+QLijUKrGNerm3ZsEOOMivlk1cEhaP2dZCij+SIYiVRcuz
         R2lWTiyR9LbriS2dRRF2aIPtWLkJIj3umM9cDEtSlmHxFZh16ytNi1TIzwwiFeAs86qf
         Ke7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528848; x=1687120848;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfpqy0vzEDVpYqpJKJrpHF3+3mOtkT2S5v6/Q5oQkeE=;
        b=IqZLqyNfnjREFYLp4saLnNyvrvkRx62L94l9+XmfwxADIYr2AiLqC9DSyzQvGnkM6f
         LJ5ZsOe8wgsH2U1HnRmYzjsQ8iAkR8BfyLX5F9HCtSTjSibPaj24RPa+teAckQCFNv5y
         pEiciUkMVGi30tnj6yI27QESTKXagSb62mCd8YPeSHXK0r4nfXTB7GulNf4rhyklkRgL
         bP4SMtKrP50zdpJnZHjSDMgYuaWnjt06IkZ3jZai2e25O6u3PQXudOyKiCtvUL+KjDFX
         dcIF7tsrQykZcd4sSGdLTo5HLydumn4G5jeR7S0ZnbPy80zOyNcCK9OwuvhqICmbcava
         J0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528848; x=1687120848;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfpqy0vzEDVpYqpJKJrpHF3+3mOtkT2S5v6/Q5oQkeE=;
        b=CF4V578rExM3+UiuZBwIrCoaPHXbzAj9vyJAkjLrWLeR4uyRSj2Pa8RnwdhjbI330I
         NCNUbc3VW7kZfgYAfwuP1qg+FYuEbu1BQdwkJhLs4DgzoXkBRtW88vH65d70+t3/Ioeq
         OzVe7xf2dGhvnZ3KbBfkexzxp5kl0hWj/8zWL//dQzqo04gO1Ac/L5iJPijBi9uDHy4x
         VrZjgOMPvl0gDo9ngnTBX4GM6cxEczwwfLYBuA4RKagwKPgKXgH4i1CMEn4KHIMoJIrc
         C1m2aF3RtigsVxhytYXJ7fSewmDEE0OY7DXP5enk6+XTbLX/wj8HzDQ2mn2Ff/rtKFBl
         E/Uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyxixvseolNgspqj05Ui1LLKo0Ufoh9HRyDpany+HGfBE1y77AF
	0vFeT27gLjtrnJpx1NWPDxc=
X-Google-Smtp-Source: ACHHUZ6w+VjEfRSC4xewyhRFgn4ELEOfAoAdV08v/Zgof2se7WFiaKlp0wDSziyzJcSXz96HKdTa0Q==
X-Received: by 2002:ac2:446d:0:b0:4e0:822f:9500 with SMTP id y13-20020ac2446d000000b004e0822f9500mr835192lfl.12.1684528847888;
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1597:b0:2ad:a1ce:ff1b with SMTP id
 h23-20020a05651c159700b002ada1ceff1bls389172ljq.0.-pod-prod-02-eu; Fri, 19
 May 2023 13:40:46 -0700 (PDT)
X-Received: by 2002:a2e:3506:0:b0:2a8:c513:7577 with SMTP id z6-20020a2e3506000000b002a8c5137577mr1150288ljz.51.1684528845924;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528845; cv=none;
        d=google.com; s=arc-20160816;
        b=JfREk9KjuwwfqexPaTejlLksVLpP1WC14mzm+fzr06UIi4ohtSu59ZODs8YzRqV1kA
         3Ff09GnkE6/GdWSNUcvuDEDdo8Sf1Ns5Uvtrrqeu/cgMxjl3lT+DNXb4JhMb6lfTuc7K
         Cma6QUPTwgZB4j1xz1uhcfBK7iehjqmVf2e3tT79I/iGl98vU/ytn53ve8gSHX1OaoWH
         Ew+MGkQNSP3EGU9c9pOwQHVoOh+rJsmuCjolVd5mT1J8F4JbUPRW/LY0heukFJhCsIR6
         HPX8HWm22LgiVnwJ0KOcg7veqKHg4t65MFLYDlwLxfBfhUoNLDPRi8yrS4LjjXgMAMsb
         I6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bmKavz0RiSwWD3yDUMisNPYeLFJtQaE6FJ3TjwIX5BM=;
        b=XqIa8EUh8a61e4geFsQqju+dliULQ2z3LcnE6UhhoakiQK4t/oXxaOm5HDH67PlYfw
         k/dMDX/mF4UAg6Oy2KpvNsreeRsLqCUTM28bHA+rRmr9MkNlaOrjayczw9iUozDZv0o1
         gIlsT00kqsaYU2oxpHGv80+SH6sT7a82XUSbztnlZjelUUVb2CWMSum0TmCkMQ30qnSd
         +ow89A5ES4fFc0cbZmAAzYko+AyIymbuDSEv4VRAro5sxWGVElRkjh0cQgUWghFcIW9M
         ogv/2K9uE2eH+HnA9rMxKJ92Ce2/WkZ5vX9tQLZ1gw6kmgQ+NQMrezqAlpRtfA2PxM9L
         E6SQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s10-20020a2eb62a000000b002a8b2891ba7si305511ljn.1.2023.05.19.13.40.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdT1K1Bzxr2;
	Fri, 19 May 2023 22:40:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 12/73] core: Change CPU configuration to an array of structures
Date: Fri, 19 May 2023 22:39:32 +0200
Message-Id: <20230519204033.643200-13-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PASSWORD_IN_BODY 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Switch from a bitmap-based way to an array of structures for describing
cell CPUs. This has the advantage that we can decouple Jailhouse from
CPU enumeration of Linux and pass the physical CPUs to the hypervisor.
Furthermore, the structure can be extended later on to associate
configuration information such as cache partitions with a specific CPU.
To avoid breaking the config parser more than needed, 8 bytes are
already reserved in the new structure.

Note that this commit breaks the build in order to break-up the
upcoming changes into smaller logical pieces.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 17d59306..34abb938 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -59,7 +59,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
  */
-#define JAILHOUSE_CONFIG_REVISION	14
+#define JAILHOUSE_CONFIG_REVISION	15
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -99,7 +99,7 @@ struct jailhouse_cell_desc {
 	__u32 id; /* set by the driver */
 	__u32 flags;
 
-	__u32 cpu_set_size;
+	__u32 num_cpus;
 	__u32 num_memory_regions;
 	__u32 num_cache_regions;
 	__u32 num_irqchips;
@@ -116,6 +116,11 @@ struct jailhouse_cell_desc {
 	struct jailhouse_console console;
 } __attribute__((packed));
 
+struct jailhouse_cpu {
+	__u64 phys_id;
+	__u8 padding[8];
+} __attribute__((packed));
+
 #define JAILHOUSE_MEM_READ		0x0001
 #define JAILHOUSE_MEM_WRITE		0x0002
 #define JAILHOUSE_MEM_EXECUTE		0x0004
@@ -373,7 +378,7 @@ static inline __u32
 jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 {
 	return sizeof(struct jailhouse_cell_desc) +
-		cell->cpu_set_size +
+		cell->num_cpus * sizeof(struct jailhouse_cpu) +
 		cell->num_memory_regions * sizeof(struct jailhouse_memory) +
 		cell->num_cache_regions * sizeof(struct jailhouse_cache) +
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
@@ -390,10 +395,10 @@ jailhouse_system_config_size(struct jailhouse_system *system)
 		jailhouse_cell_config_size(&system->root_cell);
 }
 
-static inline const unsigned long *
-jailhouse_cell_cpu_set(const struct jailhouse_cell_desc *cell)
+static inline const struct jailhouse_cpu *
+jailhouse_cell_cpus(const struct jailhouse_cell_desc *cell)
 {
-	return (const unsigned long *)((const void *)cell +
+	return (const struct jailhouse_cpu *)((const void *)cell +
 		sizeof(struct jailhouse_cell_desc));
 }
 
@@ -401,7 +406,8 @@ static inline const struct jailhouse_memory *
 jailhouse_cell_mem_regions(const struct jailhouse_cell_desc *cell)
 {
 	return (const struct jailhouse_memory *)
-		((void *)jailhouse_cell_cpu_set(cell) + cell->cpu_set_size);
+		((void *)jailhouse_cell_cpus(cell) +
+		 cell->num_cpus * sizeof(struct jailhouse_cpu));
 }
 
 static inline const struct jailhouse_cache *
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-13-ralf.ramsauer%40oth-regensburg.de.
