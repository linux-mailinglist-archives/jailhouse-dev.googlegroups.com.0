Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAHCYLTAKGQES76I2KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB80155EE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:13 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id r48sf13109917eda.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180673; cv=pass;
        d=google.com; s=arc-20160816;
        b=S49w9VbKc9HOePzB4SpjYFYWp/W5wfQEvH8iiMUObmSUnmMo2pHlvI3N4YrB/1dafW
         B5I8EM0LxIynojxm5L8tQ6AuZFL2MN9bVIU+DZGFBNqHa43u0FnF3/clejgaRjo8aCCT
         6EczTNykAngP80aLxrdccwqly/eMUw52Psf18i+5gOmAuLmkMMtzK+WF56jd5bf3xyKw
         wQxfTeXEm1YRZFD6yOU8pQVYCFA1N5+dQ1EfPvAQXUzDqJG/sjSAaBMSwV3fQSUIaL9W
         aB7m4vUTru8CSVJBY6RAls5LIWDpneSvY6x5BxrjJ2ZepqbFywYAsAxtl4kitaYofqZV
         Zt/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=ckqKnVVpJkJ/a2bGL86TmHM4LG2txK6S6r5TI/SRWC6DIpW7voKv/8Xq7uL6Z9bdtz
         NUJjCIeV6i03WWBKGaO4/GrPKaGBTK6fjWgz2evTR2bwjsYJL4AjGq97X1SqOgF9vjEb
         truKvm1kLLA5vOQEeE/psQDVeZOWC/0Kd0zfM6JqhGarO57RS+2E9v/wJissHHNYqjge
         ICtEGQLccC8peE57F1o9DBSKdwrYUYjrUyO3JabTr9YE+5+uHMgcP0EyXZSRJm6wJA5b
         DQ3qTsls/EnF+HoErbtmhTu+HyTLOtuAQMNC4bljQYtgWG1PDdIXby7Q7P3MZl3rHOgH
         iDEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=tdRYnSrU5VNAG+dq9kxS+SQadtspc6OdLBoth5CDHaAkgZC/ZYQmRw+2002NuhNLtp
         4onkWWE9ucRL9NpCC6shbHeHhZliYo1CvFnJ/l018s6ZE+cGw25DeKVKaH8o9jvcVheE
         YSV7l77aU5Y9j/mQT8mZcRxtMFU9knWUvd3VA5O/ljebnkVD/SWXk4oaPKwbhVSuFVme
         zTgpgJ4BtyZBQY7hDnWB/XgQuUbs6U1QhARUmd8TfapKYR9c8P9chKfvN1z9tCSp5Gy9
         E2C84B7dVobhoOkylnVrKZsiHKknHSYrPCHwueAzvzfVnM582KaZVyancTRf+eYFzqpF
         tO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=niMCqcEJIev2/0TrbCSUi+PsOEvNYK+fAH2Unu8up9m0dUlequ4pJE1hJe3YW7IcQ4
         R96T2wqavj4ar2BbEs5AdYVvlmH1tEUJJo552ZN/BiBQbn7axULRve3/6G+MAj0BdF80
         6oQ4S2QDJijVpZUqnJ4yjEfr7yj58NfkMlP0lGX3AovbpJ3y7jsz9au+xuu75VJ/f5lU
         U5toTdkSASrWIRKSlnrDVYi7jLh4emUz2okAVJSDS912TjGu8l05rI9V4fMyVqkp+yWo
         hbicAuRM2D91ku4V/r3kaEgzQwtbZe1r6wraEqIoTbLrUIp7dALQUwpI4HtG9rW3w1hL
         9YCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWnJysR3y2kfds/75nbj0r3gQNW7SvuEtKtLyS3clJ1AEa8VN5H
	zoGDY33j+Js5OJs1cNv6HYg=
X-Google-Smtp-Source: APXvYqwAZBNwRJbSnRk+C6V+wj8WHzln7BJWGZ5d1iXH4/nV2jTUKKcOJt20QRK41BCIQzgn6KsF5w==
X-Received: by 2002:a50:95b0:: with SMTP id w45mr29119198eda.221.1557180672915;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8406:: with SMTP id 6ls992164edp.10.gmail; Mon, 06 May
 2019 15:11:12 -0700 (PDT)
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr28479579edt.276.1557180672482;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180672; cv=none;
        d=google.com; s=arc-20160816;
        b=vXp4dV2x5nNpMk8zHNg51wVOk2lkUIa+RqtCjAzdOe//uHtQ645pq5HpFDG/7rGJ7J
         LT6qCv1NfytwRywFMpv4H8j+gjk7psbmrddeDAns6dRWvmzciJL0y5kGTAi1TvMAqW2W
         xKMry1SDHEC8ehk13Maax99XxFu/0LIfYLNphm/ZpJiZZgc+fTZ+UUqudQcmJPvF65UG
         NgZcEJQnuhOcoSuLflSJuEllaQ/uAsN6us2F+wrsTsoh0dDbl7Z/pYOadbpMUnNoQ/dQ
         /4AQ2WdvF87dswBGcxAlzyEwM39FdCNlZ8uer/pkhvzjwOZBUM22znslJZFkKCIf+yuI
         aeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SX1bgAVNx0gjJxuPCf93EjhXME9qVETxrxT1B8aLPj0=;
        b=Uf9pxLqXOlnjgZhSCvUxUDprzv0AVlbEqe2HEMo10GtJk2AaJKtblSeqdVNFCbUoBi
         SvDJA+uSNnpmWe4JHYu0n01GLI7d8YrRYHNur1+nLwHjzuhmLITofhI2ATel+o+v93Jo
         3Suvgiy04gtx1kNQqTZIBL1L4GdnweP8mZUoeGQLFAPz2jKUjs6PUojZys6qGc23+xGj
         KTfRcru8FmoJUBOw7oGrYCdvWArzZ6w8m9QfyNJ5iVvzh0JLoxDIPtORa8P1Pe2ZT28J
         kBuXjMJx7D/lKfqVVojB+AmpdWC+a7VNzaRKyusgMbZ1ms4wLBOzbhgoVUBusGEENlpA
         YLDQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s3si358533ejq.0.2019.05.06.15.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ807wmzyB7;
	Tue,  7 May 2019 00:11:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 3/7] pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
Date: Tue,  7 May 2019 00:11:06 +0200
Message-Id: <20190506221110.19495-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Make it easier to read for now and required for upcoming changes.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..4bb50605 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -630,18 +630,19 @@ class PCICapability:
                 cap = next
                 f.seek(cap)
                 (id, version_next) = struct.unpack('<HH', f.read(4))
-                next = version_next >> 4
                 if id == 0xffff:
                     break
-                elif id == 0x0010:  # SR-IOV
+                elif (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
+                    print('WARNING: Ignoring unsupported PCI Express '
+                          'Extended Capability ID %x' % id)
+                    continue
+
+                next = version_next >> 4
+                if id == 0x0010:  # SR-IOV
                     len = 64
                     # access side effects still need to be analyzed
                     flags = PCICapability.RD
                 else:
-                    if (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
-                        print('WARNING: Ignoring unsupported PCI Express '
-                              'Extended Capability ID %x' % id)
-                        continue
                     # unknown/unhandled cap, mark its existence
                     len = 4
                     flags = PCICapability.RD
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
