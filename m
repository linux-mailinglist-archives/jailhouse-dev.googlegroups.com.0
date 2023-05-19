Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWF5T6RQMGQE43GKZHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF970A0DF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:57 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 2adb3069b0e04-4f020caac60sf2406078e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528857; cv=pass;
        d=google.com; s=arc-20160816;
        b=dddFHW+1Nqc0f/GGMFkBXV02rEtXL6/iYbFLuQciUdjjIZrFzL/Y+KtRjHj0hctW8S
         RN2e5F/JTcMtBzBfO6gCKE1yRcPkfk+esNVLCjPw1vN0EV24M6FPbch0oMI9zqMi/GBv
         aazbp7yp7tQ60rSJuT+8XP/CRLC7klvPJu6c2CKLjr5oJS/U0rdvChgJFvJNh8F7vgFL
         d5RjMSdwkZX/MGWcWmv3QAFe60qPJCNKeYXVkKk78U4o+05v1VVxVrrP9fEx1XNcgMTy
         LyYPLUKMQkuNchH6E5xkGhXW4m4R1zRiF0YZLBL5pRXGopFsDWyFwQWIjX/CGbabhBHm
         WT0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=XRiOQLBJqbt1aN2vaEdvc6s0GZXHJ+B/p0bc0x2HeRU=;
        b=J8Eao+1+5ND6v7c2YI55E4+uHSDYQGtXoiUPfCSaICYanD4O+/e3xWlxSajqMz0Sz4
         pJRiHzGWNPg5VpAiWMYPfVkAZ5y6qP5pgVAM4Xyp9tvaPjoHVb1VEi+Sa+G96LEVHkPo
         jvI89BNl3EJVIlCuuN/xGZb3EMLu5NCQU8PpXomhEkPxqorE0wtTAUtqz8amKlpQk+2w
         UdQWhPYKM/dBstOUqUhCIDU0fOvNlthJzJnstoKLi9KP7+2iVZtVHkXDPcU1rhMgMYhG
         zcVGRkKFez1f14dX2p/4puFc9ic0rkX7wTYt8YhiUxm0D8YWykLnAisg9a6lvO1zuhFH
         q9jg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRiOQLBJqbt1aN2vaEdvc6s0GZXHJ+B/p0bc0x2HeRU=;
        b=UqMJn9HZ5KMvgriv6UfC19QcNYFMS2hC5HLdHnWXYXuQuNDcueSv/JNNFup34+LzDG
         ufgcmrKxOqKAqh8bH1u1tcpkMvtTLw3PfkmsiJlvn0xY6sovz4DhUU2EUSbtsNvlI5li
         0bFMM5hBc5WErURcuNstsdOha1H48omKNd/f9MuW8qYD6WogrH1r27pWOgCoc60fL3xd
         Pi+8QrVzEVS7mBS36ewbgHYJARAcxWKTrYXphsKmOhAMfYkVyghdzABFKhzfwn+v9WL7
         ngXsof7mclORbPQOMekmBcceJQyxhKohviJzdobM+G/7pwy8f3EEq6SqIYRuXAJFdEaz
         31QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRiOQLBJqbt1aN2vaEdvc6s0GZXHJ+B/p0bc0x2HeRU=;
        b=eQ1Ke4oY3bt/ACyvNmKGXwcrRZ8Y1FwmEdLqrovyOsWpD40ef4c5dqoPDiCdUwKEMj
         SNtnfvWSVlXS/iO3qpx8bojLFNadoZOROgyk+3HlFgkqcx8ux3YCQncmXwbZe3XgZs6A
         +y8J9tLPvwWmfYIWvOemUeqdff5bPM8B/G6zO5Wuz0VX+vw/M0fvi51fmmXduHMASNYb
         PXsBnqECXpDhi76FlABu1Pi9k/uXDfIz2S6RCAWgi3hG3UKfZa0lgbMmX/7N19LZM/5z
         hPY4FYYIwUrZmLL9UlbohERtr5tNhtXNloI49yyIf4zb5o7xbunUf0SnyJPuBPchGUlb
         2Llg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxw1g5A1ae4uIGSCRtzUQ3T2vp++nxaf5RZiJAXJz+FGCUkRqg2
	57P1ATbrCS/s2ks5LOyVph0=
X-Google-Smtp-Source: ACHHUZ6RpfipRDBfMUT2Iyuk9cb4QySigj9vYUpmzq3dHJv1Ls7kZcmGmfw0YmAy2L3Xj16wI/WuoQ==
X-Received: by 2002:ac2:4c09:0:b0:4ef:ec92:5aa1 with SMTP id t9-20020ac24c09000000b004efec925aa1mr838179lfq.12.1684528856666;
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:3852:0:b0:4f0:9517:7df6 with SMTP id d18-20020a193852000000b004f095177df6ls1354149lfj.0.-pod-prod-06-eu;
 Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-Received: by 2002:ac2:5399:0:b0:4f3:7d0e:3680 with SMTP id g25-20020ac25399000000b004f37d0e3680mr1062759lfh.21.1684528854887;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528854; cv=none;
        d=google.com; s=arc-20160816;
        b=j2i08ta+YD21RLbPpo+W/a2gCC1+WLtico41EziDu+9VIsw6/+kEvuLXiBbMzPVkJS
         oaJheLZv3/mWQsWINRM5CqSSOhEmjCyvabqwrLxvsC++X+g7bwXC5i+P3biF1KVH9xqo
         rgKoEtbldOfhpmNBRyGd4ACblDsJvTO/9D43EaDLXz76UIhKdfwo6+wUkA8g7a/Q7aeX
         F0ErEHpQwQ34oXOxFn1fxaV67PSN5R1bQ06JBwCE4tj7dC1kI61aGjO099ipYyRnhC17
         regRDp2AoAXCRYoBLuGR/oWfoiOihizbW/OEkFT9JTwXavxbfJ8hoO/0xlHEB/N4aPdG
         pFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tuVibvEUaoVkl9KNBashkcm09CV6apeFeEoWtLqKoxc=;
        b=A/TlqYOPPtgTrgJ4CipUsSSxo5+ThvKU9jntc9I2OjvRkgBdOuqLxHmDQppK7acDIF
         7zqqtbYFIP2Iw6chmdQM0QZGf1caHbFrbrijut1khOfAyjfJo/gVfQ9rzqYux1O4BqfS
         29hbtCJ7yeZFJJwsy7Wy09xgQ6o/Nfzk3Se/HWn1rhIwRp0UGVYouc2RwKKMXbjpNEmN
         n8d4bEKbv4svIU85OoJpvvsmd7ehgKXRGcY0AFnvkjqd0yFGzYg2cJkh40roSG0viAp3
         DF1QuWHT2WoGPB9PfC8IWXPVhSJvTIDTdWhKKevbAilTMJBR6T8ACr9ygeT0mgov4BU+
         5s6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v20-20020ac258f4000000b004f3b045aa3asi13982lfo.3.2023.05.19.13.40.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdf1G85zxr0;
	Fri, 19 May 2023 22:40:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 44/73] arm-common: export for_each_irqchip-macro
Date: Fri, 19 May 2023 22:40:04 +0200
Message-Id: <20230519204033.643200-45-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-45-ralf.ramsauer%40oth-regensburg.de.
