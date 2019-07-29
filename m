Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNEH7PUQKGQEWVQBULQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9C7890A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:00:21 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id l24sf29874996wrb.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 03:00:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564394421; cv=pass;
        d=google.com; s=arc-20160816;
        b=fB08JWucCRP7Yac1gHrj4HiaVbEerEypDMGZtwaSfu7ZPVjzRCagmJNO921UkbefnI
         apqTGUVkik0tVNO48Y848TbtqqOpReGSMJCY8GURnGAfhF9Nh18dzTvKXiqEAw05HbGf
         qPErHJ1QjANVIOCZyWqUIyGtr9Zo6neSX6XLTXBNzAr0I+cxolpg24EN8HIqRomg4mG+
         nMejyYfgT0r+lowy3SXUI0qqWMp+QLxS1UWMlj3Wk9o3YZSAj2L0Mw8Zte7PQBxEHDlj
         93EnVpZ8O7WiIrWQJSSMXaJZfTPs42bTY0ItMAi+ljLIGEvI4nNN7Q+reKNl87BJz6QK
         H+3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ub2PGzXGjnxz+b8reLcZ2g3z5UcFPihoaUqCQeXL9pY=;
        b=XU3VzxXXQTvLjSfDZiAjEvWGp44tnlEsQDW9nFAnPr25/4MheD//Kz/dIFG5lGQbL6
         6qyKad7i0mg8FlaHHxSvymY6GNWjSfC+23QtWfWwmGGh48JO0Ci2p+MSHuWMFUOMK520
         n+9eK67f9tN6BnowVL4FgxsL2djLaF8yzDSOdLUB2Qd1jvQ4H8ManH8HvRCLYRygseyb
         AU+yrFBtVkWvZvk/7PbsRLAR/h+4Z0zVkbEbVJ1dkOIo6hWK1QK0I3/FwGLwuL3KAC3n
         Ip97hJLws/Cs99x6k3SEfa4/0lHvAEaJl7w1rMwvUBp+kFoHSHU7u5TMC11LJ/0jgAI3
         K1+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ub2PGzXGjnxz+b8reLcZ2g3z5UcFPihoaUqCQeXL9pY=;
        b=VrJ2NqYSPgagO/hLw44EwQelk00lDj0PX4Y4T7mNldt/4e18QsjGrDaZMlZsvSaYm7
         PwHg5ONtLcaIhaFjq1taKRbv+RjEoZmowKjC3VFYjq1UYb5JX18FTTlTEC+kXQ5k2Zvb
         fJ3DDy+lqd7MsJWiMojhmj2b3UC8cNbQLYyQWJQjZTpvkW5eIJivsurI4y8LgUlOBV23
         0pIOGMRJUbiPeRJnZ77Z2Dqehj1Xjo94AXjRhh6E0/8Vt0NDNNCsvZCnwYJZXpq7X+1t
         LgYWtgjSoAEZlSpKoA1ROrAoT4Hd+KMpVDcBQWiniaAPJRE2YZNl6hx8YNvBUH6Ka0+U
         Rm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ub2PGzXGjnxz+b8reLcZ2g3z5UcFPihoaUqCQeXL9pY=;
        b=S2V+tzYazoUWt7pm1hDOPq3kY7+Ds45bINxzwcbT/Dq05kwVKfqsih4r0hDhKdVJrR
         joIfC5gkf48RdpzGXf74w56xJGZIIfe6VXNsRL7MgVsmzXr5xtu9S/fihSVfVFQHb0KX
         bCi766f9tqZcjVvgfa9pj66mh7KeMxHAlodkD+FkptTRREx09KKTCh/qp28M9rxEzZeZ
         2ofVyH38Iy9GevNIa3TYKcX2UGJU0reSDzAjAXoSHdUGAsvGQ04Xmk0l2YB+0x33y7+A
         TSYIVlfEsnY/Z413pq13CfHwzQ1xO8yWgNipKWVmYk6tH1KIBHS+tdW71ILqoizaIp9B
         vz1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtBB5ZX5+znTibXteI/7FRICp7h3iXGaAHcPMeSFF5t98p4Mpa
	0HLdBOgb94MpBUzlgyiTvhI=
X-Google-Smtp-Source: APXvYqzdb7+TcWNg4ZBabLRzBIRtU8dyD+QjkTGZghyCP8ig61G23EOGtsBCWI1mlsFH0q5SANWV1Q==
X-Received: by 2002:a05:6000:112:: with SMTP id o18mr39332484wrx.153.1564394420892;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a386:: with SMTP id l6ls17795417wrb.16.gmail; Mon, 29
 Jul 2019 03:00:20 -0700 (PDT)
X-Received: by 2002:adf:e602:: with SMTP id p2mr82741597wrm.306.1564394420221;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564394420; cv=none;
        d=google.com; s=arc-20160816;
        b=mIPEIgGCHc/Z+WExr1Hqquy3gDApF361DtW2u1ZXFPGj40AlhM8Pl2YuZrqRmUVRPD
         j2dNmVhzlavOuL61CpEizcaXfDHjHwK4SdEoE17MRBFs8p7zt/dG7/zuepa6c9UKDe+3
         GCyHNKgtzFU0JxEkyq+DiX9BSAwr9nJsTktdOEQbnM6/vmemp9mqmuRYLp1iVlKQvX4H
         6PKkwamfiCd6XGf91/0jescOWHevfaNu5uxlabFuBrb/hQ32HhwOwq3VlckvrlNT/W35
         /oEWRR50l2EuGgQV6EIn5AAC1C0IyNI+rG65CNNBsmOpVroeagSLEImoEsuOaAlfH1uC
         vpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=k25yg3vCBA6DP9h2D1UVmpHZ0MeQCPRYEkUc0HZTvbI=;
        b=colwt3hh6J+3YypO39Xz0k3P67dqdPxRjZznouz21YwCvZIm+FJQb/SnUJzokEr3wt
         2/iS9FhS/xE7Wlff/JoTX28RVg4rg2mb19MzHihkRn1/6MggtubOixwGEoQAn7gJZ8D0
         9aiMCoYQPjZR719mBDfUBdVifU4o7ZCajc9evn2rN/Eoy2xXW+VzKPZSOXASaqaMhhUX
         Rgn3ZnArODNnPpkiLa/y73GboXmdL+2xuCppKtrkdUEeR6zMaJA2P9kSLEAyrAJZntcT
         /XlJX8RPkWHLeUS9YbvE4tbrfPAZ8l4bDNB6xrOvMKDNf80IzGJI5I7L5p3MF1ilC894
         9liQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id u18si3258235wri.5.2019.07.29.03.00.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45xwD35hyLzyB8;
	Mon, 29 Jul 2019 12:00:19 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 3/4] inmates: x86: linux-loader: Enrich setup_data with flags
Date: Mon, 29 Jul 2019 12:00:17 +0200
Message-Id: <20190729100018.19411-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
References: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.29.95416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.16.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Reserve 32 bits in the setup_data for additional flags. Soon,
jailhouse-cell-linux will use them to indicate the availability of
platform UARTs.

We extended the features of the setup_data, but didn't change the
semantics of any other field. So increase the number of the
compatibility version.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/tools/x86/linux-loader.c | 2 ++
 tools/jailhouse-cell-linux       | 7 ++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/inmates/tools/x86/linux-loader.c b/inmates/tools/x86/linux-loader.c
index ce13cc9d..5a42e962 100644
--- a/inmates/tools/x86/linux-loader.c
+++ b/inmates/tools/x86/linux-loader.c
@@ -34,6 +34,8 @@ struct setup_data {
 	u32	apic_khz;
 	u8	standard_ioapic;
 	u8	cpu_ids[SMP_MAX_CPUS];
+	/* Flags bits 0-3: has access to platform UART n */
+	u32	flags;
 } __attribute__((packed));
 
 /* We use the cmdline section for zero page and setup data. */
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 5265b665..fa80e3b4 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -776,10 +776,11 @@ class X86ZeroPage:
 def x86_gen_setup_data(config):
     SETUP_TYPE_JAILHOUSE = 6
     MAX_CPUS = 255
-    SETUP_DATA_VERSION = 1
+    SETUP_DATA_VERSION = 2
+    SETUP_DATA_COMPAT_VERSION = 1
     standard_ioapic = 0
     setup_data_hdr_struct = '8xII'
-    setup_data_struct = ('HH12x8xB%ux' % MAX_CPUS)
+    setup_data_struct = ('HH12x8xB%ux4x' % MAX_CPUS)
 
     for irqchip in config.irqchips:
         if irqchip.is_standard():
@@ -788,7 +789,7 @@ def x86_gen_setup_data(config):
     return struct.pack(setup_data_hdr_struct, SETUP_TYPE_JAILHOUSE,
                        struct.calcsize(setup_data_struct)) + \
            struct.pack(setup_data_struct, SETUP_DATA_VERSION,
-                       SETUP_DATA_VERSION, standard_ioapic)
+                       SETUP_DATA_COMPAT_VERSION, standard_ioapic)
 
 
 # pretend to be part of the jailhouse tool
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190729100018.19411-4-ralf.ramsauer%40oth-regensburg.de.
