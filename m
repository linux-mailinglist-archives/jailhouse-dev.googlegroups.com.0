Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWF5T6RQMGQE43GKZHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB070A0E0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:57 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id ffacd0b85a97d-3062e5d0cd3sf1524586f8f.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528857; cv=pass;
        d=google.com; s=arc-20160816;
        b=SLl1kNuaRyZWMuQ/vuZQNm221uc7tQx8YLDdBfbpXIroEeaDeKr+eNBXGDwg1gySQ2
         hJ1/Fu1/+oJuRmFfQGYhyb+ahfFt6FP0if6iKojQtKoJnbX8DjuiFU8SHNKps+24DpAY
         Tz2lyceA1sOoGXqgioxDXFeoE/sqcbjo0QbmrHEtvIuzW5eol+RjJOcZZF+LJHuU5Ike
         DNjilJykVYwOVN7yZ8U1l9gYCVVPq6NPgct89T2jBTe/FJfpBAQtDKSnW5IE0ZIb8usW
         elAQKXj1K487shvRtPRA++1s8ISNy0xTHUI7/EHCAr0zsvKdSp+Hq6iKT4ItcGBevydF
         P6VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2u8o25i7kh3lSTqhH7FswUMYTEauL+Xsmf2WGVwgAw0=;
        b=aN+KVjRNObhofKbO/jM8JjNDLdcRAJNQos9OoryUVZYQc9BmzIr3ahjWlh7iMIarhW
         k2zFLpZ5ywMfVNfKsY7znqnJI6uyluE1TKGtpYCN17Z3UA8AAtk9wMA3Om+IpnDDc0te
         2hlJIm1/o8gq4dVZQC94wSd+nFuvytnQv6sZ9witOn5VJ9SazVrSqhP1KpqrVjPR98nx
         yeKu6EOgpTpNAb4NZcUcqxM4EocITulWKoTWL7Pyrrhefh/Y8YfELVMd3hqN3d9akjf1
         i8jpRw4DbeREmqjz8vwHpO5QNuv+a5eCa1Kwy9GVTd/EQf/YMuAZ+RBqx6/F739LeGq/
         EK+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2u8o25i7kh3lSTqhH7FswUMYTEauL+Xsmf2WGVwgAw0=;
        b=WGLyYkKabgWdIxfM8E1B7BPGyVg8q4BCxFy/eA5vncrrEb4fTmz7cPjd7oZvNnfWOL
         m7/lEmfuHO9NDiiEuLefMqOwYUKRq6kio2qaPCIAtqxx2FtRu3Qh2/4zfdqBc8CBLgsh
         jGQqotHVg2kmpBvBHPe4oWe3CcpSEjsZNHPLG0WdAs+m8/U1gnNImb9Hnc98wpWJQPoh
         rU0/yURI5dOjrH6+tRfo2339EG72Fgsah0mnRd45wD7joKQgy8AK7aWDQgWHQKp+Tja5
         0cP4kZ4Op2HMy4sTX0yPKX3OtlAnj9mdqKflV48aV/jmxMrRd97WmkAPcfymP2t/QKIN
         iy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528857; x=1687120857;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u8o25i7kh3lSTqhH7FswUMYTEauL+Xsmf2WGVwgAw0=;
        b=bO00OtM4UVqzFEfBgxZjeZHdBY4zXOIeSFUKClt7jVl23L4MQ+2/J+FaYKWE+YaZzp
         HxML9ilhq7QmY8R4tF5ulViR2bsjgZA9Ysw4yp4xw4EOTa2K7l1m+M+Xn/FU71uJYf6K
         rgrFsoKnYBCZg5n1VFYy7lUnXirZK5h1wcX77HJ9hBAG9+BWIQrHpJL2KzZxriL7u9EY
         N3fd7KkO0qTDnTC+abBVqX7Zk1wp/Wu5d9ZmaxafgwNFJ6TZjbFHCwlUkJ9LbX9+ZeiQ
         NGUmuHI7KSU1r1qpV9UVER1on9cbFYySMOgPn+4SYKnIfF+HDmX/4spRYyrWih9dIzHq
         Ol7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxh4eolQW69yBEI2cDLLkNl/+OrT4r8ROMiyN+qH03Xdx8Dy2FD
	gQ2weKyzIYIEwepDuomHzvg=
X-Google-Smtp-Source: ACHHUZ4wlfj7006qFzcd0ubZjTJp3BwRpUdRs6Lgwof21Ftf2g3jXBFJLDPpiFpnSLC6aTXfI490jw==
X-Received: by 2002:adf:f1d0:0:b0:304:794c:1525 with SMTP id z16-20020adff1d0000000b00304794c1525mr583947wro.2.1684528857271;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:45d1:b0:3f1:7ad0:c34d with SMTP id
 s17-20020a05600c45d100b003f17ad0c34dls687968wmo.0.-pod-prod-00-eu; Fri, 19
 May 2023 13:40:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3146:b0:3f4:ed2a:4347 with SMTP id h6-20020a05600c314600b003f4ed2a4347mr2205265wmo.16.1684528855584;
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528855; cv=none;
        d=google.com; s=arc-20160816;
        b=zD9h6utb0j/Y/fN0plsgNojWATT5UzFFchRFWAw+NAIiul7/kzBwIiDNhirmf/0oaE
         mTChcHSWYdxxgqkXE7Xu+Wgkj1XQ3E0/icfaNp8q4AjaQkCNaafdknedBh/xrERKszro
         mXC4gPTO5eMZXH8a91jG2cIrk8S42FYQr9EQl/zcIeoT9VFCwW9YbNsDNDSgtI4w6fa+
         4YG/PCGrswURPpdBNbjO2n0M6WX0eYYg6IEx0jGL/mWnrVfZ3ySx/T/QbiB3AsW/c7+P
         BLK4XlaLhs+yTqDmv8ryAcn39ZoX6wHa+wsNg0npZezWj0BDf9mC/HboVD+jPGi9E8xO
         JQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ll3IGH8h41vUUIn88cqzN6msNEb1EPaPkfvRpkuarXY=;
        b=gIrxGuWx4fUYibNBoJdMqp4grw9qpT9M7RME42c2k0GH5etp0bPT+TvYgEV7G1pX7g
         iFXNHG1gltfWbFfbif3vwt32Z5SnB5vTMv/Hn5fIv5chq8oF3WvFP8RSOB4P61deZvPw
         cd1wpSjRRD+ELdqv+nyPzsC+mCpYoM8efXyBugEOVhZfaFvXOmUcXMe8HcChEBYtZrV1
         /nH8MexYqgD7METSrL+kggkL/8C+pFqq8uyZlHlMpearHOS3f7S4Xi1mQA75oDnjelwW
         uv03UFp53vyhaTvzinohVPMMQDrk3mDmoD42LtHtqopYS++K5PKPkFipP9ZGC+0lWLzh
         rrKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bg26-20020a05600c3c9a00b003f42786c7b4si290257wmb.0.2023.05.19.13.40.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdg1VpLzxtl;
	Fri, 19 May 2023 22:40:55 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 47/73] core: forward original HV memory location
Date: Fri, 19 May 2023 22:40:07 +0200
Message-Id: <20230519204033.643200-48-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1200_1299 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-48-ralf.ramsauer%40oth-regensburg.de.
