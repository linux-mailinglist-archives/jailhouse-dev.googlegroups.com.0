Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9E13D7FA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id k18sf9147951wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=viq6zZFyHUVuhmTPaxxEezsfAA446/BldUPk24qytI/poRyjm2tUmC0wCWMr5kOvbI
         eJXeKi2Q1Rv7XLVX9Pnz9F4qq25bKf6DapVZ0L02ByDEvaodqsBybBw4HanOKpC2yvzm
         zydkTmYFrprKZW5hVnN+tntusXZvEFZJW6dzkdNfTCMRPmXZP22Br8efwktckUf+Lpti
         Q+NDMUBszHXMtW2Mw+n/1wWaYt1RSWQu8VvvkS62wXJguM4J8Pc5CPHPr9Kc5MlfVkmq
         5JuFXpMHjKCWZ7itgZ0G6BoGeuuv277486M5lgg44fS12RwGwzAsQuAZhhue2C8eTMzw
         BXtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=mqWSzzmntu+KnESoGWL5wKXKHsAh1XlD+zzStZucJQc=;
        b=VHVf5EkWY1lODyQeP/9YY12kNFdrJs9Sn3Cd/z+1dJlbrfJCY927LbydLnVnmNG/mq
         J+Y/5Kli5IftMKpxe9qYf3kLfOpMayIaU3XInXXbLwnf8SocifUxM0Fd9VNALeiS+2ti
         Gyqf8EWb+06jfVTDQwrdvv83CphMpJe2PGnUHFr/jKOMd9lkkye/U9OAQJ9yHvVs/Wa7
         a53QL6Jev2veq5rDJx3oYGXde5S8QALzAP0k344IyrWorKl1hdW7YNmFGTWcm6aTDyfQ
         GRKYlCc2HQrlhQBq4lz1I23aU8Yi51tVbju6mG62QuLYNPVQJGyElx/QG5yGHSVUpX8d
         hHjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mqWSzzmntu+KnESoGWL5wKXKHsAh1XlD+zzStZucJQc=;
        b=Wt5liuMP+Gu9bmvudR80FjHpXUOfFTT8CaZvDcKUfOM/mfouftZlKKiPccVRf95cFr
         kSmlnUvGNzVpRnW+v/WtUC6CZg/ecT4aAkqmPRcm/Ic0YTzcPMZ3t3MSi+H9AnZmV2JU
         o4hDtq81pnwDCHACh4oDwS3hnfk33CoMEDI1abAnkyCNpzD0gj3sUn2RQ4g0hxPa0XD1
         1PnWrJ43Y16ojao3mHOkibmeAFAPoX1faR7PR190q0bZzmk1fyhKF+0L4qwc3fJYnss3
         bB3NuNpTZ6GLC92ayux6xlPoCdxNX4mhLgeufEfeEbefDAp0k7/OP/dF0CZXXAxUCn37
         7IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mqWSzzmntu+KnESoGWL5wKXKHsAh1XlD+zzStZucJQc=;
        b=XPEF0IW9IoBxlyPT7ROWnhD/Mo94K0tcWFaRl78fiZRNi2m17zA+bM1s8JT6wRZNKt
         r7taQsCNby3bd8FsQ8aSR3xVCTGPwzEkL6Amy6gJaxoPzoqynlPsxyRuqZojDyTmA7qP
         cT1DgY0etFYAQ1CMnPmGmLu9MDvYMKZ4yNzE/c8qrCLKwjpg/jnmVotuK1gNzGkjANzI
         xqkPTbYZqI9oY1w+n1203kXon8sii3k5RaZU+HLZwvu9ZLT379FCfIIsTHWDJSQV9yjr
         0wIabvS3c1wqDU8OicksNWkYppNfzE3OYIT19FzLc3kTjG+0thZ+bZeycozvb1FHrc+v
         ZkDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXuMN65Wh4h4zFOFUpp8X2IGpFfw1W0Fb7Gs9+Qt1j4daRxoNDf
	DRSp0DajoAmeJFAydxT6qpM=
X-Google-Smtp-Source: APXvYqwlVs3hU+0qmRBIOCSbUt5MQesIe/g2n8m0H20LYg1yIBzJvcql/IFMc8aQsndOaWrBvBhFUQ==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr2470027wrs.169.1579170890819;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls7785655wru.13.gmail; Thu, 16 Jan
 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr2546756wrs.365.1579170890044;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=0f0I8uqooxI+MP8uLBpf0QR57LI3c5zZV5TJlUmLnnWdNuK5BIikqzBTI/9AhFJ8Fu
         ttLAC9lNThhNuhZakKozGj0L6yInfKz0QI8eazHrK3vS+7tS4LuZGi587yMUY94vjCy4
         FN1VufYQU5+7+xN1/NFCfuzT/5PUr+hO555CXVf1fz3mKkUXqaPfMNb39uKcjwcdbDGT
         5wpr/zwf9gvcdFWYZKBIaAw4P3HLc0+LrtzIMFfh3tf3bfYebdOqqn4n3F7ErHlMreaC
         R8RqrdtUc2FVsWY8ZO/zi7yrE+w3GcwrcytrNmNfnMK8+0EChIrjr5IOey6oedCFHZIX
         MBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=eOD+iG3ModVH90Jk9jWPWIBIDftRVenn7RHEvDypr58=;
        b=fDUHYMx9+kEvHTt+RprrPDiuhbctQiK8w9MsvCFSzSKNNUKGhStyPEblLQJUa8AoLz
         Jwp77KRWWFbXE1VCybiPtsIWcH9RQRo/1iEhj8tVbnLGuss4V0XyimMP8SiAjhsI7t4u
         EAy6AVTJjcOz0eVTLcLCtB5Jc1L7k9m/bd6VExIQRZ98UfHWKnnNtv4BB7cd7pcJT3+H
         UQVvCAP8a2aTLwIgdR1i+MRWuPTn80lFF6+Dx0zlk1I2GnyezSDsx2EQDBCuweEtC1Bz
         s7W/iA7PuX/LASTnb48SYJBbYFjlPaRhU5r1d689Y4sExlCjXuRgbWY9lr9UsJKRfrqp
         1i9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p16si882107wre.4.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYnts015294
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQL031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 11/18] Temporary set default Jailhouse version to latest
Date: Thu, 16 Jan 2020 11:34:40 +0100
Message-Id: <e4d2d054f429550ddfb3a4827c048eb1d04211ee.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

We are no long compatible with 0.11. Therefore, build for latest by
default until 0.12 is available.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 93bd0a1..8ed65a8 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -15,7 +15,7 @@ KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE = "${MACHINE}.wks"
 
-PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.11"
+PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.9999-next"
 
 USERS += "root"
 # 'root'
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e4d2d054f429550ddfb3a4827c048eb1d04211ee.1579170887.git.jan.kiszka%40siemens.com.
