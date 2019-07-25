Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPOF47UQKGQEMSNIUOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B27552A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 19:11:26 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id i9sf32503882edr.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 10:11:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564074686; cv=pass;
        d=google.com; s=arc-20160816;
        b=l3eOqi5V/AtVw8Q+GsCKyLuZ40DDL+Xbxfuhe2uvjC370UPv1fVSKgg+kFvXu4hzjq
         1zJZZoxLmXyJB1WcQ1fdXWBDui7On2vHnLjFECYaPhR4A4iB46iIosy58N1EFD9cUPJa
         ll5mu0CnHvG5JHFU4yBJ4PgjCYI3OQugbAYfpo76vPZT7p38UFQACrBwiC9J6dCm6wEM
         GzyZ79BS/r/qaIRMPk3bUPZ+0KKUqxQRcHriJrIyRG5F4kwN9bQrAE/1d6J5ffOYpjcS
         zA0xaLA8LDst0pO7z8NAIV0GYZBV3qQQXfN1SYUd/xLHcwY35/9iQWj5zjygz2kmJJ3F
         daow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=xfhRe2ufvV5mgJE2mQOcD8alwVKUVt8zqam+CidRX5Q=;
        b=lrTSROgkRqfkeQewhxS9/9bVcMFc4Gh55BV9f/SY3JvgyyDYB4N72Yoi0uBQL0sEGQ
         WJKKQ0WnIr7Jc6Y4OIzOijQKOW2ob4XxiNghhT5EiMhn6Ldcxu+UErvA6C6QmWffHrYh
         w2YZ4sm443xqZh1ts22lNUgHterTWNCIfepchM9tJVWJshV+U3BrSuo2FU02EyAS5fK5
         OkTViA2TOJr/ugf39+5QfLmemN97VET3Mt1kLcfxAvJn+qy5JMp/3N/bvxFATtk1hFGH
         +MnmMJW1soNzFma0ptyBSULlNTD92AlCtRmKUcw9ycR2w+PbnSTloAhl+Vm+/X9i7mjy
         4MuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xfhRe2ufvV5mgJE2mQOcD8alwVKUVt8zqam+CidRX5Q=;
        b=fyT6UaPRqXsJIVRO3hxgNNPXDVKWkJMRXv76XEtAbdk9i+Bp2DORP4E0cBgotEr0tO
         BzHLwugj8Kg5n6OJGgnuXYdIV8YMBRqd9MsdG1LLEh2oBNfYLwvXUatrXrDQwgCTORIz
         mRRkSKXiq+/lPr91yQdmqCZquf/SLyKiV6Ta163gWb+N9DnX2mvkPxBzaPPq46L5DPle
         OYor2l1SD7v+C2wQdxyS/Z4FYVQRdsaWSUmQpS2eLRutgV3vpswp+7ThoRBABU9NuPm2
         m/e0FhyEJQameR0WcqhkDurb25GINRYZMIBEzpHMZL3XJwAzK3EXeIGOCB0Gv04cwvbs
         D9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xfhRe2ufvV5mgJE2mQOcD8alwVKUVt8zqam+CidRX5Q=;
        b=ijXO9SK0qcAKDR9xtfSFhooB2ybfF2nkyH4udKHblQWDPkzZsCRLwaQpn6OFyGVIRh
         RpBlvNOng3IaM5iD7w9qOsjEcTQdTBWClJoFWiUq2s/qWBzy3lTXFGt5SSop84Bvdc9P
         mvm4bqh5ykoj+8tG6lBCZG5Ka/P88eYD+ZxJApxKkFEkZ15TpIHNGp6RjAWcuQUmuVjg
         usYu449rPgRzO4XG3KtPYqi+r5x5NIsTSALlPJMdaVOaPAy3tMZB2c7YSX/Vadhsm+0M
         p9l13HDAP2nXKCJ3ZS9IlFg/WEtKWG+x3PnYGxY80R0kTX+ZGC82jxsyaUh+yZCnRqbm
         q1ZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGfAgNKIwmYAm+SEfzN339sBJME91/6HQPyT0nnvpSoytGANvi
	hZ3RwDABm/wsVZrlvq/4Lv0=
X-Google-Smtp-Source: APXvYqxKLxN2IbU1qGF9JOfwd1TPqiNvCpGuP+39Elepaiw+6PPaSSPAQzRFQh+sIJ2cVFZo4i1iDA==
X-Received: by 2002:a50:b34a:: with SMTP id r10mr77592363edd.84.1564074685976;
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ac62:: with SMTP id w31ls11948449edc.10.gmail; Thu, 25
 Jul 2019 10:11:25 -0700 (PDT)
X-Received: by 2002:a50:ad48:: with SMTP id z8mr78041213edc.66.1564074685422;
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564074685; cv=none;
        d=google.com; s=arc-20160816;
        b=JiEdrZJtu1e4QkHIwCYeZTNVL70VNTUwpNnd+4W4dDv6sYceqhdue3rF57lzDbZ2gF
         jZuhtOuiqYef4RdM3EXQpmgHJhonW29OPbOtoz84CMz9v3ADjBhIKRVzPmIqtmBnTsJq
         hqddYlpI09UlEpz+FAWMq6Cx3GMn9k+T4WrZSd713en6+zEkb9In8zPTs0vu+EEDd49e
         9sN3acHfKrHsx89d0EhRMqqMcfZqo6CJAyReDcKvgrnhdxW4Jka8JhVCfaaByHuORUv3
         ZLRqi5PHOGisKp4s1bLcxrN/Mox0LtOFZAKjniXSxok9dqtps3+bT0OJDz9KkcqwuiKa
         qVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=xIdQFqG/CaHhAWl3rBi004YWLI9RIHXGJwd0XBd2+2c=;
        b=ZOdCrRiCRgrF+yU5bzGi0dYrIq97iTkoYQLu+2V7aBrYCA2coOhkGHCvJ+zWwqdhNR
         EWeECug12p2meDpvFaHRdgTCdRpANIAaOvzzrg4CAbljPCDLLTQ5ccGscVH+cwmf8ohT
         22o7wRLXdZyso2PZM74wjCRqB7CljwQaPLW8DWXIaBw0avDPes2Hz9qxV6F3BevTpckw
         8WxNaIStjy7OoEnkR+aD2/k7wChxQy2cHQXzFLQ0K+Df5F/A7/5ssmeZvgbD+7KgKiAn
         YNWLYlvB5z/nnE7wp3mkxqIS9c8IvHcnPWUah4Dt04CBHkwNKGiWWW0TdJ/w8q8SkPoa
         d+8g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id jz14si2162926ejb.0.2019.07.25.10.11.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 10:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45vdzJ6RMczy6m;
	Thu, 25 Jul 2019 19:11:24 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/4] cell-config: introduce pio_whitelist structure and helpers
Date: Thu, 25 Jul 2019 19:11:21 +0200
Message-Id: <20190725171123.9266-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
References: <20190725171123.9266-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.25.164815, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.25.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps to
fill lists in config files.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/jailhouse/cell-config.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 76c9e56f..a95db470 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -206,6 +206,17 @@ struct jailhouse_iommu {
 	__u32 amd_features;
 } __attribute__((packed));
 
+struct jailhouse_pio {
+	__u16 base;
+	__u16 length;
+} __attribute__((packed));
+
+#define PIO_RANGE(__base, __length)	\
+	{				\
+		.base = __base,		\
+		.length = __length,	\
+	}
+
 #define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
 
 /*
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190725171123.9266-3-ralf.ramsauer%40oth-regensburg.de.
