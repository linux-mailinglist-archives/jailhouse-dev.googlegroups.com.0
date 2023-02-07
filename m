Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZMGRGPQMGQEJRRXB6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5068D689
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:14 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id g25-20020aa7c859000000b004a3fe4cbb0csf9851584edt.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772774; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jbvh9EACQeUxPX8OQt9cvvmgDiakKZLCCooGVHpXuvsq1gKyR9C3b/qw4vnxduQvRL
         JKL1EyC21Bonh0K9QfDGHHNt2kJjuKcNQJDHf0g4gDQlLpLrGJcAHt5ghqrMxmFrpN8Y
         AKJVEyRMBRvkc3e3HCQBP0UMl4NlBNalEtmgTz0/qZ2pxsxTj2mQ5MTZ7q2Vbj7fHEf4
         BT1It5lJlJJe+JMoDCDUpEsJknJv9elxQtkjClhqv1sEbOiTpUs/Vf0GROZDe9SJSbcP
         TK662Dd/Me9oSz8/VS5N73ToN69q4tfF92YBDsdjQCezJkl+qL5+MlnYeaAavrctNL77
         SK4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=p3XH8G9uUgiVTDylL6iYuY1fY5Wm8I2IdjbZJholptc=;
        b=I4RTHVyQHKbUS/yuy7kmIvJYm9TqF2thjw8AiZAsym/WWwzgsNsAj1u6IIWJ6IKP6i
         sUfYaX6jbo+1wT4RKFZeWpWNAuE1Uq2rC65T1R7706bl2U78xAm79YMzHLMnbs4PbcLT
         IJwJnP72zOKe9/6uNBksNF/SHFAkG6CeJhfgGEVGanmt9VDKubei1SeomP0Xumy9Q4Ut
         PpCGNo9Hm+NhDbcsvKtG4OUtXsLjNiBYLApplhKMrH8FBgnlQiB3121zvmEt3TUllC7t
         Wmjnryy8qrB/QIwBhTf3pYKQM7QnYxfzTsJwjqpGDJYwQFYT/f8gH9kme5KgvU2ASVu5
         emhA==
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
        bh=p3XH8G9uUgiVTDylL6iYuY1fY5Wm8I2IdjbZJholptc=;
        b=m+0J2otkwrq3UcM+Hpycd27KYngw+PMDkENERTETM47vGEXxNDIGMn6S3e2U3tBkXy
         EPsCEwSa9yZRl1RaZcJyE2zxpebyfGY5WnJiQpoB2nD6IxV+doT1/KAKMFp05HRjs79w
         XYvPAivEUQyuVIv+iQEXePun/1ua0RxRTcWAhnnz7yVNSOhJXRm2l9lssBhjAD1m3IeI
         EvXIzB5pP19HEB4uhRCMsIQWQbEMSh3GIdmAT8Eiv8toD1+Hgx4zl0/G2g+OXhgjtso/
         /tdi5GOm3o9v73tRymfwSQIRE0LQdKM3Ao4R0nZ0vsamicGo+VOsh2gk6o+pDYEoKrWq
         rpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3XH8G9uUgiVTDylL6iYuY1fY5Wm8I2IdjbZJholptc=;
        b=YCTMF0tlnj1N+1bV+IdAfh1rPOlNNBU5PBBrAvvpxfSvetGszVsJiTXNIJKd6lE3Lu
         kw1EbppWKOqkzGvafMRMCn0a0jkwVsRXRQar2cAeJDaK9qDynRWTK1LNphFCrNFBMr4I
         hsegnqpI8+uGbzxcVZ6XSj0V7TLmWpSt90KBYw6kMtBez/dhluKqISjpWMpDLhucD/ur
         gAY34QGMmRSyqdvN3zMMmg8PpHs49opniUQOJWUcz4Ye0OOtg8Gv5ZFM/eOQMiFsIL3l
         1sZ0qvXkYkzef6z4Jys+D50pKrQiOGKM2PrOyeMK0RqSYEckUBaHsrBMeOzPwUxFoiMS
         qZ8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWVpkpVie5RuOr3I8vPYEGSaFExeSMza1OHmp9DyzabMa+nOJHC
	zpvKt4oSV62zAp1H0Vj9FKgchw==
X-Google-Smtp-Source: AK7set9ULf2mkyvXlqlGbpYlxTqk3X7yxnVedFLIh1u0bI7WENwS55wLFQAOfT92WCgP4tMLMbbY6A==
X-Received: by 2002:a17:906:668f:b0:884:d15e:10ff with SMTP id z15-20020a170906668f00b00884d15e10ffmr744539ejo.265.1675772774230;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:e707:0:b0:4a1:ec52:2ed5 with SMTP id a7-20020a50e707000000b004a1ec522ed5ls15264168edn.1.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:12 -0800 (PST)
X-Received: by 2002:a50:aa9b:0:b0:49b:98be:c38 with SMTP id q27-20020a50aa9b000000b0049b98be0c38mr3689243edc.11.1675772772519;
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772772; cv=none;
        d=google.com; s=arc-20160816;
        b=UoKGkgVpWDt1kdRX5gnNl4uRl+WC5ddvJ4zEUghuNMzKtB4MAUoT5D95AflKF1o2Cn
         QqqT380hTy1PIaDTIXkPVdEiNOd3VZZu/zmirLqo+GNKB+Zz/oDIYqGa/RdCk215zeM3
         z51TFTJhK4kPl2GUGoo7UBU+W0iXgb3ADZ0TdHlENadHCX+KvR0k7KQFSCpQPV8YmX5q
         w2BA0n4LFBaXB1Yfa97V+obzn6h8wWl6HCOgyJse5d5ScgHkUqqCjyuudgejiJTWQ9BX
         R4OJsHlVgL7H5PUuu5lLvZTpBuB+X28RIRsCNrK04yfcH30yRS5mfZeiXObZD4vNO+UE
         8/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=G3XhHym1W5lLPtGyeE/pvellaRQsQbTYcNrwnwgyoGI=;
        b=UeLF9vyWMgkvlB4Ar09dg3qqCw/BJjxI2BZWNNDSxuZhTpTlCGKPHsQ+uHL1K+BaVz
         pQeD0B7ZA8RZMmuXAt1Z39IrzcPLxf5myBFNQ85oBFyP4Mr9UjPfVtm/p3QG64bmaiXv
         glDaLEgz4MO3/oRBxSSd4E8Qa1++YXENN6g80w6Nj2A92gS5mpFQSUHN5e8bHjyLOwci
         VzKwM5fbLAKCe2m1aGnDfSi7ZNkn2cBLBYnxwaqxg3VdVOmBg7u0W9aMjXfyOZqSbCyh
         pDsPWxn52iJ4sHK7xd64siLnaNw4kLH0/ADxGq96hWxX/Ee8/RpPrgirz5YJcbJqMR5Y
         hP/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g40-20020a056402322800b004aaa51b36d3si445591eda.5.2023.02.07.04.26.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RS0J07zxvr;
	Tue,  7 Feb 2023 13:26:12 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 26/47] core: forward original HV memory location
Date: Tue,  7 Feb 2023 13:25:22 +0100
Message-Id: <20230207122543.1128638-27-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1200_1299 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0,
 __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

We need this for RISC-V. Makes life easier.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/main.c                         | 1 +
 hypervisor/include/jailhouse/header.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/driver/main.c b/driver/main.c
index 51be11e2..373b77b2 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -517,6 +517,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 
 	header = (struct jailhouse_header *)hypervisor_mem;
 	header->max_cpus = config_header.root_cell.num_cpus;
+	header->initial_load_address = (unsigned long)hypervisor_mem;
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 	header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
index c5285262..574aae3f 100644
--- a/hypervisor/include/jailhouse/header.h
+++ b/hypervisor/include/jailhouse/header.h
@@ -77,6 +77,8 @@ struct jailhouse_header {
 	 * @note Filled at build time */
 	void *gcov_info_head;
 
+	unsigned long initial_load_address;
+
 	/** Configured maximum logical CPU ID + 1.
 	 * @note Filled by Linux loader driver before entry. */
 	unsigned int max_cpus;
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-27-ralf.ramsauer%40oth-regensburg.de.
