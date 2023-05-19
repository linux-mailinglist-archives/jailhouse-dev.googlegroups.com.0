Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTF5T6RQMGQELBDRQ2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49070A0B6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 2adb3069b0e04-4f251247084sf2388651e87.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528846; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hd7CHf0+/kSzGAIj08dykZCdI8fa8Z5NfwnsfNvTSwPGhs42ay0VXUUvehEvTM8M6w
         x96n5FSv3CPQwQuDuRyks6onAbvWSCspbVxPgECDvptn+0LvHuiHATJSrkV34a3D95W1
         JJdd3Aj4NzCZDvnPZLmCqIv2xxVyudh/UeXY8Cj6nOBZy+Bf1kiI2BnrIAlmmPw1Y9T4
         vs3Gsw4xBE3DM/5XH34M8PqpSQyFWSI4hVwV0T9Oa/dCRDb2KYXWIbW8/l/qKM/N45vr
         rMDL45OptwCngwhXAKapI8ZX3RXsoLDuOhdQSWvu+q77dPju/csRwyARzIdnqg/VQDwa
         hc0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YFgXmWx/ywV67JvnSKZKZTIyuJbZTeyYOQPAnk6omjs=;
        b=pVwMfHaYGHpN5YKbDzs/RkxjjUR7CCkwjHUelK9hSMjfyE4MULQbPmLK3LIsqERKk2
         BDGZXYAOMnWGExVyxJHNTIw4c9iP1a1InJXB4gteyVCCm+zSgDem0VpKtmZ4t33Au+ac
         i2YE1t7CtlW+L4Amrq3HTAOAQV4BMjYt+NWCM8kqiA/vhELXvyZh/0zWL/kIeTFFm8N5
         ne82aUg9Xzcgu5pb/MTunZNpvCJw7jZsCvMwNZi6uLlWOQI09nUHz9MwDKslXKvQjfCO
         Q3ey9iI2lnT9jp4NnK+fLuqJexCHfgJnrkDB7MwIXCidYEqOUmcef/jdSTPhfrhMXfAe
         /4SQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528846; x=1687120846;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFgXmWx/ywV67JvnSKZKZTIyuJbZTeyYOQPAnk6omjs=;
        b=RNRe000DDkh//KRrh8ZT3zxnbxFcIa4jvgMtVOmDdh6QeY/ddJNprhFy+0tIXC9beT
         CfO242lY3ccQsBIdsliJaFOLHeF3ysjGS5zv1nQBIC2Vre/rQ1TOKxz/vXs0tyn3pnvV
         JLe95dU9ewjG+RaL389N9qKERbNgztggAgxpiGxRnlfsRUuv5JBPekHPnSJbSCeaDG1q
         o6JSDlBishcskH9pX7o5gE/nvV9h1cnaTt7Xb408GR5EIp7+Y1jRnyFe09kdXskjZg3y
         ZsTpPvqg6UC4+8Bfd1p6NjLo4LZAfH5+ACCzjWVi5lv/Ore8EUkpjSZ+y2h0d5KhMaq5
         iK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528846; x=1687120846;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFgXmWx/ywV67JvnSKZKZTIyuJbZTeyYOQPAnk6omjs=;
        b=FxWT2S516SQt87e3gdnjRSO3KKE3Rnk/YeifXXJMb2c+yUlHlNtD1ctrkrpUBMgRUz
         5t3Z7sXjSdiQuyc0+Q6JIvZtp7+3wpABXzILeAz5L5B1SPaBxhkPTTiZJWreWBhkzS6q
         h2Pe+Qc0kXjYui98Bx6IzMHXkuw3eXOj6dJ1flfj9jZaOigXb7q4xq5uyaZHvac4zG0h
         Ko4uwtjs2IeAUmUKR6Y4utxyoRc5jnnBUiIuo4PTmostSBh1PdiqQT2LTS2ZNhFUtFA5
         d+80i2NLhfSnqkIFz3oztEgSIuo5qZEClDBdh1aw2mh9irYmkezZppnmV5kVwIwNaiAB
         q6Rg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxcq71JEKuBIN1UWLUxOBXQgntUTWBJE5py/r+zsBS2HsjyKV3D
	NvoO1260UjIGf05dN4mVviA=
X-Google-Smtp-Source: ACHHUZ6mjM7GaG0g2FyxBN+RHPpnbWiIY3R+oV/fxjUT0BaBR6BsmR7/EYYcHwxc9EDOI9tAQKl6Zg==
X-Received: by 2002:ac2:5196:0:b0:4f3:b16a:6522 with SMTP id u22-20020ac25196000000b004f3b16a6522mr544199lfi.4.1684528845287;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b888:0:b0:2ad:8fb9:f1b4 with SMTP id r8-20020a2eb888000000b002ad8fb9f1b4ls717763ljp.0.-pod-prod-07-eu;
 Fri, 19 May 2023 13:40:43 -0700 (PDT)
X-Received: by 2002:a2e:9eca:0:b0:2af:23fe:98ef with SMTP id h10-20020a2e9eca000000b002af23fe98efmr935395ljk.50.1684528843248;
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528843; cv=none;
        d=google.com; s=arc-20160816;
        b=LtNu5GAEoJvzOccEr/uv9hpiok4k3dPFU9+XFjPJHAhkkIwBYgL0G83SguWj3JU83C
         6MXVwA/+hv4stLy9N00fRK4VSPSjd79H946dQhZpCGrbUNiRnvWLIZHAeQ+HWnpLUseN
         z/mw+urjmdg7pmbtv8XPRiHopv1iGMMdPBkSiZWpexUnJQqhtOvwmaetPbAPOozRKf0V
         5ISBW7y0RfTEA1m8oouQzuInGIumVc/H7Tb3jIYIVV3OXACMc/2WdpKKHRjRil47AX7E
         3TFW8f62celNr5HYiyvcGUwsawnrO+gfjWuxjwy5OVb5emvTsUeepoGcx7oXXuTI3j2W
         lwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=NUu8Ji9ESYqtbczuhEQ57Y3VykWL5u7AUZx9tjrhPH4=;
        b=ZYW/FgfwzmxSYjPsk5ERvXEnk4qJvZrVXWGX9xh+ieM5cnD2hf5KWqYOW8D9lgxFPT
         z9YSnZCs18vM9uUt7aTcOIZrM57X4y1MzlmvISF7T3PHMhZEiK5LEnStVf8eXlg6CLyt
         08b0Z/kuIVEtLc2dyDjXtPO3XhjuwnEJ3q2IDkWHL5Tr3A8bQPyT4TSl1u1gTK5GQUFl
         PjsQWwMOldiIzzSBdLIFza/D3GmsrVOJptQnfcELT/WAduSXgo1fEFSUzv4r37QcvJjy
         27/g9OvhTB7+ZK9c5K4Pvc6Y7nBsayFzAm9Ugyl7coLxAQsb52vyRZgwOOFFs8U/Lj5q
         kn/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id v23-20020a2e9f57000000b002ada9b7eacdsi304148ljk.4.2023.05.19.13.40.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdQ3GrLzxpl;
	Fri, 19 May 2023 22:40:42 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 02/73] core: Skip arch_flush_cell_vcpu_caches during setup
Date: Fri, 19 May 2023 22:39:22 +0200
Message-Id: <20230519204033.643200-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

There is no need to kick off a vcpu cache flush right after setup. We
just installed the new mapping and didn't use it yet, thus nothing can
be cached.

Actually, this didn't fully trigger a flush on ARM and ARM64 anyway
because those archs didn't kick all CPUs but rather expected them to be
suspended - which they aren't during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/control.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2214406f..5da95ada 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2016
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -285,9 +285,16 @@ static void cell_exit(struct cell *cell)
  */
 void config_commit(struct cell *cell_added_removed)
 {
-	arch_flush_cell_vcpu_caches(&root_cell);
-	if (cell_added_removed && cell_added_removed != &root_cell)
-		arch_flush_cell_vcpu_caches(cell_added_removed);
+	/*
+	 * We do not need to flush the caches during setup, i.e. when the root
+	 * cell was added, because there was no reconfiguration of the new
+	 * mapping done yet.
+	 */
+	if (cell_added_removed != &root_cell) {
+		arch_flush_cell_vcpu_caches(&root_cell);
+		if (cell_added_removed)
+			arch_flush_cell_vcpu_caches(cell_added_removed);
+	}
 
 	arch_config_commit(cell_added_removed);
 	pci_config_commit(cell_added_removed);
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-3-ralf.ramsauer%40oth-regensburg.de.
