Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIN5VDUQKGQE3IRXD3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA4A67BA2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id d27sf10570297eda.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=A5X1Ns7//fgHEuAaAMJaqVatrl1X91ctMP/n1phNpaC6Sj+7L1LpsSo1uznY+edX4Q
         se6q8nTCKGlCXdBAyIhdTPP0aFA4lQr1Qe5KpkF1HOMjshMn2YixJXzznR1CZmkdjz0d
         PYFCy19MT1nxzvW/npcMYLvDbhHUF+QKBP6K1V9LzSjfRTm9xRDgF/FzZy0Q/rNdeafF
         mO68VTVmdM/oykhejGPySASepBmhkLhBHNiPzJHAX3IG+hYJrbTIwooNfyavj37CwlyB
         ywOMbirJzhEcIkZwhs7wkZLug6EJAt7nT+jL3phLrAUnSN9unLWWf64Z3TWLMJI3z2Cw
         0O3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=xOH2VYRReFQ4QrzbOyoUQOvZtnApDuGg8THiwNmBqGU=;
        b=SL3b7k7IoANVIyve0gWtopirLmoze7rVbxwkmSInH5kUjkCet+6gV3djHa40VsvvkF
         sE+t9hFX3Pfj6FHHDPPRwh9vVHg5vrFZwzqFzh2QsN4aUOwK2cfH0w5MgmbKFn3GNmD2
         s6PyJJcA93jc05CJsu8rKk4qunbd8rgUXXPFsZ+EycnwSPB5gzMJMLortZrq928MDIic
         eXbz3DdZqth68X3lzm7qVdmZN2ORYuaLesfp9NEIbqgWbPidpnDxc/ToWlc0eivlA30A
         DN6F9hwE9RPnn8R09IE/qcHKRkkifohuQmHSDwrMa+Y/V7tzUbqs7w1pTnKaMcnSK57C
         C0aA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xOH2VYRReFQ4QrzbOyoUQOvZtnApDuGg8THiwNmBqGU=;
        b=ZGJQO5L8gHDk3tVNPO9EhghQ7aeY7/Gz5VdvBUdFFZV9DnrPD4IpFDrv9ydatS/mbw
         boDILqBjPmK3MKvtwZkpN6Okzo2jRyHaSWNhVAwDLeF9ZmajvBXXLciuLsbSrMqAGQBM
         l4cbnCuIF+lDt3D2U92ViO7ELykXzbN8fH779GBSLK0KAZ0WyNcCCqVo5R9xPcqBqWsv
         RtEdLd1QraSovEkbvM+v29mQ3608bFJ/pSXSo1yCC5+sEdh74VaXrai13CtO9Og2pEM7
         jQayiOHDW1Z5e2auCL0QsOcC2QsbmJF8isFjMJU/MoC2G/mqqEvekwGy4ivJcrhp2fDy
         WV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xOH2VYRReFQ4QrzbOyoUQOvZtnApDuGg8THiwNmBqGU=;
        b=UewtbhEmxfyq4SJGJnW38qaVszaKHT5e0mnA8N6pypNAtE8IuEc3wnFmQe6ctXblBT
         wUaZsbFCv4H0TY/cW5pEfbPGUnQXj9SVN3aEOabGp+JJ/Sj5L7roGvtU/NSUsCxu0yH/
         Y7Eis4BRO3C/+NFe+R9u9rYJF/obPoSxJqigP3d2djXyONtA007PivAlshv+XlRk6FSL
         1VGZ1QZbormjR+6lu34pQEfay4o9a1SXSKVXjFqAzppdBAATiD344CH00my6zvbLOwkK
         cJyd3GMYPf+P0vbMgHqXeEipidk0l5FKeeHGx2VTtugAjL63OSi72/jNFL5JKATSwVSc
         d5Kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAunElwiNBlvr6UH/Fjr6tsn8R1aQs6UC9KSNPeQd98bk0dUCc
	naBCrCtIP0wOVvcha4SqprQ=
X-Google-Smtp-Source: APXvYqyiKL9taP/OOgtbKuqN1+k69Dzfik3hW/iJ3XczWWon4wzLpJiAKacCnkMxO9CU6lR8dOcAbA==
X-Received: by 2002:aa7:c559:: with SMTP id s25mr15049439edr.117.1563041441613;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:94ce:: with SMTP id t14ls3079304eda.7.gmail; Sat, 13 Jul
 2019 11:10:41 -0700 (PDT)
X-Received: by 2002:a50:b66f:: with SMTP id c44mr15348185ede.171.1563041441174;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041441; cv=none;
        d=google.com; s=arc-20160816;
        b=0Gd7IhnQyOhYxHJzfueSRiqAWMX3farKAaJgyB++ovS0n+dyZgLEteWKz4bFhuQqot
         njE7lPmEl6oNCBR96zs5svlBSYKUMMczcjPDNnS6+CMGpNZhBbJ2tp0GShDqQq0+xbLJ
         89UZgAZDMSPxcs2I8vtGdrAsD1RoyoLm2e+gM9e6xy9Ot3VQTu/gMAYyq1MqLlJBQyWe
         5iLLTQA9bd472cUAwqsIF6PQoedi+5F9QC/UDX7LK7/PCNqGh1E358dWI7oGpTQamMtX
         AvAxWKF9CfNh3wf0SXcCWUiKTb9/7037kjL940fsxFs4w+cBKG1Zft9TYV0sG32OkCwz
         EXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=N0MzPSKEXb5zldwSIoM9DmEgrtbONHMfAEbqFhUqvT4=;
        b=Ieoh8sO9ElENMSRAfjDULXEd848usAQMxAoSqHMDKO2cABnMn83iEwKkTauIvCRjOa
         FV+izx9JzTcPHJa7UQXylFzlEMabm/jbqNG4leikHVJYjKRmnwnk14Fg52ZZtOfHL77S
         UvISv2gKiVNxPF1ckh1vonTrxWK6v2cbuvHgl19VxavCZPIsDtZf/JffR8vu9R1s0oXn
         7SF0KRIA8I9168D02l6xrAvufglSewAifwtupjoho0aoGZTJN8UCMx9EypQXktYr+KfM
         eHxuoz9MAX7Q0I6oa34pQ5ubSfoR+YrvN0HR0qfZR9cBGqQqn5J3YeUzTHfjVGUvSKHg
         IjlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s30si836964eda.4.2019.07.13.11.10.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsD5Tkzzy2b;
	Sat, 13 Jul 2019 20:10:40 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 09/11] cell-config: introduce pio_whitelist structure and helpers
Date: Sat, 13 Jul 2019 20:10:35 +0200
Message-Id: <20190713181037.4358-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
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
index 76c9e56f..a57fb9ef 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -206,6 +206,17 @@ struct jailhouse_iommu {
 	__u32 amd_features;
 } __attribute__((packed));
 
+struct jailhouse_pio_whitelist {
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-10-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
