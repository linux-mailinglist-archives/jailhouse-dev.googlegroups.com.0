Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLWRSPWAKGQEFAWHZLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C15B9385
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 16:56:47 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id k9sf1348677wmb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Sep 2019 07:56:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568991406; cv=pass;
        d=google.com; s=arc-20160816;
        b=ByJEwz1SRJuEKIn7qkMm5rFV8LR6BGQSXEeSV8vxiYm4pUjZAdE/XlYBX7fviees40
         d48evmtWBEy3Ud1Nt6IF2hUz/TWH6KKxL/sbRg4PHBwceWUnTqkGZGq6Q2qEwWcETR6z
         UH3zhVhXttzBsrosNyKboeBJLUEtSw9jkYs1fcGQhkqPpSEL+9SiPQ/IJwg9ikot1jkS
         Fvih2JSldg6b4GqLS9IsvWRV5VWYh4Pe/xzC2nU3H5TGH+CVHYFqDgD2U8Qq36nwhsq7
         CoUp1jLpYqNRLMqDUOAz7sGr6vO601GwZx9GbilqaFDC5TSK0+zuEL4F94ONwH8Kly5p
         QqrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Z0rnvKh8IZiBeiKzo0HolHhzGZUkNVtmoHx790uVkRY=;
        b=EmoPQ/ofKuXWDs2ynGE1Ba0VesENSeZ0B7IWI8/x6nl+re+NVU0jxnZKXdVZgtVdzu
         S99udakolmG08O1tJZZQBLDGqVGdikJ4JauGBxXIjYCSCD5zZTzKmOVWula9o7ITrsWA
         ojzUkMDegI0IbmECM5jkyaHkEMXIRzim8D3ozeRoff18D9EqnRitk/SfAt0E8UHDj8nt
         DrnYmTVamErnE5tGaN77CotCHO5sdHjDNPlQE8jB2jRTKx3YUsEVEB62/QPyc1h6dZZ3
         Qd0Qz8yt/6Qqdu5HrvDhS8aWNzCl2n67varId832kkn/JaB75YwCRV+7e4egbEfFq//D
         cXFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z0rnvKh8IZiBeiKzo0HolHhzGZUkNVtmoHx790uVkRY=;
        b=oZQhqMPAELUis23EgrJrtfHYfI3m4AocnNFzrozEkewURSvas6uj4RruJSqlXwIOS3
         yvspvM3pkzhe+B+4waAd9yfaIjQhwuobkzlswTO4JyODzoI+G6UUBkYoVzDgOLZkfsre
         YYV+28WC3uVuL2mU4G+XelU+VQB771mbKFgcdjVlW0nP0QwBf7CEhis3CTQFT8jJi6pY
         QFjBeMjwJH2UavWKYPzDQukk8EKeZy3uMUPRVfd3LVHiOe635kPtT0yfOHRK5VeO6dqf
         W5QojcPWj5cKLlmc513B17O4PF5xtMQn9LFrJG3TLC3jo1Whq0yUD7z0/oUrVVNnxIGY
         M7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z0rnvKh8IZiBeiKzo0HolHhzGZUkNVtmoHx790uVkRY=;
        b=Xcs3OsO84NhuoSG1/NGdovjVKte77KfNWT+eOVa99WgICbCIdpU9mnUPrFte2Dkujg
         r1ZOZoYOe55mtx0XXUJQ1XDXm+DVTgP7vVn4cneMSWs/1ftr5t9/7bQF+IIzBtKFGufO
         MX6bOfmiYd9JvW1KPUreojv0/Ms9ZmAeii9u1D6RcMJcaSpDQd2Txon0cKNQj8S9cqKr
         G0yXQKCtAtHgu7m9Eh/uDqm3kLuVtiSI70y1qtz2pIFue0Ir502cmRDfZ9wE+U4xqDPD
         Jm/rqcNvRvodTfCDqdmrbJEWW4g01s75uMlTo0qHbgXmxZB9aHfl9gcm4JQ/thAd+fRe
         Brjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8SIXJ/CWIpZHrMhOnXtKJK17xAN2s36xNeXUPJyL+YLaUuowF
	eWoNMSfBKKsVjhcZWlWcyIU=
X-Google-Smtp-Source: APXvYqytD5tPvBGdsy46XyiE3sYdVzKtdB0qZxmOLrqzDva7iMPry5u6DCdhQEFxOStdYW/kuPiWxA==
X-Received: by 2002:adf:9d84:: with SMTP id p4mr12163544wre.39.1568991406847;
        Fri, 20 Sep 2019 07:56:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c408:: with SMTP id v8ls1956146wrf.10.gmail; Fri, 20 Sep
 2019 07:56:46 -0700 (PDT)
X-Received: by 2002:a5d:4dcb:: with SMTP id f11mr6455558wru.239.1568991406223;
        Fri, 20 Sep 2019 07:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568991406; cv=none;
        d=google.com; s=arc-20160816;
        b=YN40P3JnpE2CnyMO+El/XIkBppuvxY9QDe1RBp1uZDKkcNDBPx39hO98m9WSSytVxQ
         e+O834LqssjCNJvwHOi22rMheKMpftXj0PpSWalGtwK97FwrZqwN3G6aI9ZjlKpSA4NG
         qVI4xwDJF7gqY/HMgYkkfwj/tJdgKVVEX5J0W0glEzuWp/9iOGzhrH4nuKaGcHlCwaAL
         vOfVrFLnAWNbNIJHHSHqpmWqZBy1NIzQuCgBK6wx+wRmzsaIDz97PXf1ooDwLO/hqjCr
         Av+2Tf4cL02HRK/llpRBlyqg/pTQgD2j5A1TWaCDcSzQr1UBggNvOEt58UGkNpqozYgG
         C+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=fcTR3FLplwQt14VW6R77IFXs6NPo4wVXULKRKhovN8E=;
        b=yOsW6VtFenyd5Hxhr9XV8qrAGyvkLCgEw91E+wcfvLmMJePoU8iDDOwOM2qUQYzKJG
         uQ5ap89dozbQZWRApLWaWnIuL42Yztk/RgFkEXa3kILWEEho769n5Ww71UgflNHbNquv
         8do2b2/8X53Hk/Jm0RrQTCzp1N8R4VWsapNZkINqh/Zk/y+vmNeFN9nh/WaDedU69PP3
         KuJhhr28p7sRmbjV2SlHgffWU6nwZy3dqp5rGZk3Ch+9mt+DyF6N9CrAIjXkhfjxQAM1
         DBVki34HU/QCFyWI4wmCLx+nqVn7QKIIh8eQJhItBLn6sKtW7Y8JISvPNBVNwQbALUvs
         q0IA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id i21si693426wml.4.2019.09.20.07.56.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 07:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46ZcHd4yHSzy5p;
	Fri, 20 Sep 2019 16:56:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] driver: sysfs: fix parameter usage
Date: Fri, 20 Sep 2019 16:56:44 +0200
Message-Id: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.9.20.144817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.9.20.5650001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

find_cell_cpu gets a cell as parameter, but ignores it. It only uses
root_cell.

This bug never had any consequences, as this routine is only one single
caller, and always gets root_cell as parameter. Nevertheless, fix this
by using the correct parameter.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index a272ef4c..a15a2787 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)
 {
 	struct cell_cpu *cell_cpu;
 
-	list_for_each_entry(cell_cpu, &root_cell->cell_cpus, entry)
+	list_for_each_entry(cell_cpu, &cell->cell_cpus, entry)
 		if (cell_cpu->cpu == cpu)
 			return cell_cpu;
 
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190920145644.2169824-1-ralf.ramsauer%40oth-regensburg.de.
