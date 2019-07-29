Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNEH7PUQKGQEWVQBULQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C378908
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:00:20 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id i44sf37991683eda.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564394420; cv=pass;
        d=google.com; s=arc-20160816;
        b=YmXkb7ZpaF7clIhmEvxIBCW/45/jE6XfYB4sMBUbeXVnZOIGV0e9jziIcvv0pTAwNa
         s/wUxEQibSjd9YBfNIdLr3bAvfaHVa+rybkadcQc61d0RFEP4ZgmTUH84XVaTYf4RDWD
         07zl9oO2KjmPL/rNh7el/4EygCscqDjH48eTwLwADtGfS5So1bSURlgf/8JYLbXk7IQY
         qKEjkmFBLpwjr8uk97Cqx2pOC7bdEuqLi9xuFvQddd637e3+c1WMlNf8ZX0uOxwE2X3N
         5SgCPIZjLg8gBGv+abRpocfsz4hzp6VigdfMmstv9DPCGttRfmF0+SbfxdHAYhwQfwiB
         aOoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jEz1jdLVSp2/RV/shA+QyCLN1B6WQKoaL1XKglGKGes=;
        b=hqzcl7GCeMgtAbWq6LqfROOnbWdSnQtw0Ea5PKgPNrYfgJiCZcfDZVw/g4J9NTZ03L
         7TYcptgc8t0LzV5uszzwkUWLDYq5Ian9OJFSF/K1cpk2GqaP91xqj7mmpOF5BJunOhZc
         Pc5yY78Z1OkTjCnzgq6mrvo9FX8vqLeCQxOSOBNVawwpxFMyXugA8FaM3h038KFr8wQs
         KsBbjXi5xf4fzvM94pC8B+kz417CBM9hvSlzqZHItxqf3NYodBMoeoPT7rVM1FSoCuhD
         tbqFRstO/VZrqihLXS85bNX4P4jDdQu/uY8ECG3VoIzQjQZ07A+CAOk4tM4Nb+QONh+2
         xXcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jEz1jdLVSp2/RV/shA+QyCLN1B6WQKoaL1XKglGKGes=;
        b=AlHqZXW2VcO4BGCPn9i79FiYvJfJwrNl29Eh5hg+shsZBk/nac95pBgW5/6UHHTv1x
         JSO6Fskq44LN86UGd556a2JpsQs6l8cPzp+Rma0moR9WLCsx9HXHG8cFaFvX1ml2Wwaj
         2RkApUCW48X6q9pFInWG3mD8lKjhTK7FpZDyIr9g9MxUEjIXd72DYDBrvaV9awcUHVhj
         AFHvOTwJrI8MkLHFQrhHjN1DXJ2xS3/vWgy0OtOT9e/TA9Q28QCdvWDOGHN1DAidYRS+
         ViSOkPllAGcDgukRBJh9l6iNQDx0mGcxHNAG5SiWKQAhA2hkvAzQn/wgglW6uyF5WWe5
         zclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jEz1jdLVSp2/RV/shA+QyCLN1B6WQKoaL1XKglGKGes=;
        b=EWrn5NrMHHYynWDRJs8Dx8ACu3MyNvppA+fHR5hBLFkchMrMIX+hTecyuKhvc5QVaP
         rlID5M/FyNKYDCKon7r14bT2QchdzwFGslvH9kkN91WGncvBKs4YgZo+rZAaT+kbuNRD
         RU83g8Z6+yAm0dfw5owxsUllWuRbygu3K00PRUadYAbykXg8PP7pP/55k4g6Y9y3TWki
         nlb8x0UXgheU9shFSsHvgaBxCeH9zkmcqbzmNTJqqt3gQJOQE1y4v92HqOzLQZajTscN
         Jg8QWIAXfquf5Tdi9tZtUK5D6GRFLle1J8y2lWI+OMeL/8FmwaI8uskPFiV/zlYmtFjw
         ZNmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLntZPXvIcTsUSLr9qFZD7pO388RXF7rqiaIqIEmn3Mq6pF8Kx
	vfzGoyfYYBXqDMaUU0CsKYg=
X-Google-Smtp-Source: APXvYqxy5g+ye22HWzoZonQnXaa3XHEKNv4TjQOpfuiTCdMmCmr2AegXnOt8KFRN8Ow5zcIxLkizlA==
X-Received: by 2002:a50:89a6:: with SMTP id g35mr98161909edg.145.1564394420549;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f4c3:: with SMTP id v3ls14224389edm.11.gmail; Mon, 29
 Jul 2019 03:00:19 -0700 (PDT)
X-Received: by 2002:a50:941c:: with SMTP id p28mr99527192eda.103.1564394419875;
        Mon, 29 Jul 2019 03:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564394419; cv=none;
        d=google.com; s=arc-20160816;
        b=cxuHDhjw3m0XnE2A6VK5h76Y+ADIi/FJdsuIt9B8BWwPirE9vONvcNYu31+Wl4bzQ5
         IOlrktogixX1S42MwftJZz2l46H/lD7sRyLaV7+JBP0xMhOmyEiyiSH7wCthLeugOO6J
         8Hjcn1dDpxWNpQDrygGG+NwPcZX6kZzM8YyxwVzcw5vRb+x47j+tsHvmTDHwKVhUZclm
         QVmu8VeR6jnpRNk8VK1sVa6fW4L5h+zU+TKHxvLSgTIR8ZY/c7ofyUEP8SFcpbLACKlx
         QwDwGw1rVPmfeQ/JD89CGn4OlpeJh1i/s6lDsgybeDW7qy/WZCjTX5D24AUJJPdHoYY0
         NMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=YUZSRgseTlXQi3+r+9R1hLK6hfTaWqrNwrmf6ygs2nU=;
        b=of/klx50itQlDkFeWakuzOrvERD5p47poLaKw4X03KdslYawcjJV+kBPUvQicbzSfI
         GIexF8NUCq722kF3dqKOcKzTpUCSjdCnGVEBWy60NcWZ1AjNcilkrkgp8Olq348sBOHy
         te6JYnYWlWqE7lq7ZaG3d9qE4meOSj3dODJ4XdMPp30asoXif01SKPdaLv+yeEFa+YUo
         RQvOnlBn3cCfLwiumzh4G9uOsDDTpXYDCP+27TI10HjuOj/xX6f1iU/kfUhCGoMUAAzu
         ukqfF3q2FdHgIOdSjxsENzf3Ad/2hpfL+EfT8y3RqmcIX81pY6vml65m6LvQR7RsCw5N
         0f5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id jz14si2565073ejb.0.2019.07.29.03.00.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45xwD3368Wzy9x;
	Mon, 29 Jul 2019 12:00:19 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/4] tools: jailhouse-cell-linux: Simplify calculation of setup_data
Date: Mon, 29 Jul 2019 12:00:15 +0200
Message-Id: <20190729100018.19411-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
References: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.29.95416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.16.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

The magic constant "25" makes things hard to read. We can abandon this
constant if we let python's struct do the whole calculation.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index ee2c52fd..e23c8982 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -763,13 +763,17 @@ def x86_gen_setup_data(config):
     MAX_CPUS = 255
     SETUP_DATA_VERSION = 1
     standard_ioapic = 0
+    setup_data_hdr_struct = '8xII'
+    setup_data_struct = ('HH12x8xB%ux' % MAX_CPUS)
+
     for irqchip in config.irqchips:
         if irqchip.is_standard():
             standard_ioapic = 1
-    return struct.pack('8xIIHH12x8xB', SETUP_TYPE_JAILHOUSE, 25 + MAX_CPUS,
-                       SETUP_DATA_VERSION, SETUP_DATA_VERSION,
-                       standard_ioapic) + \
-        bytearray(MAX_CPUS)
+
+    return struct.pack(setup_data_hdr_struct, SETUP_TYPE_JAILHOUSE,
+                       struct.calcsize(setup_data_struct)) + \
+           struct.pack(setup_data_struct, SETUP_DATA_VERSION,
+                       SETUP_DATA_VERSION, standard_ioapic)
 
 
 # pretend to be part of the jailhouse tool
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190729100018.19411-2-ralf.ramsauer%40oth-regensburg.de.
