Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBNMH7PUQKGQEH3RXE3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 864AC7890C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 12:00:22 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id c12sf13205430ljj.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 03:00:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564394422; cv=pass;
        d=google.com; s=arc-20160816;
        b=M7lAoEfUA+sVoX28UXRSQX0hvY3R+JHmnC6/gdavLwk9RC3shEHwYlgZPYbF6hzPDQ
         88OZrmBSxrXhGk8mGibDJx5NZ1B0EpVj2m6mLMPUFpYLhxbGlJf2hmNM61PxQl+lhA6P
         Y1q90y6neR9x1eJ+GldzytskFVVy7XBfAlrEtVBA3ME5iIYhhBvUa0B8AZqtTCPL/DUE
         4s8maXL2x8bZWTkDxhmhHlYB/aK5g3bdx21a6NRW04HJMri0LeDV5aMSVRM04Erhe2Yp
         MH0z97Fzh72841muEFWVpoU2la28CuzDvwgEq2Prd1r0QbtCsJo4WPUWlYcUxZAR11cN
         37Lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ok29DZHVwz5H6EViR+wf3lG4+2Fjtj7V71lxgVX87vo=;
        b=F3lNuCsxUjlcj+ahlTSXIzy4J4iytxqHU2IHvuvn8+j89wCOrTjZKiK/NUCQcRh9xh
         y469uBPoQBRBYAI2rRUd3uph0vkfRU0Qg/chbLxVdYmiHu92QDHZce3yQEFgovze5ArA
         YNEZAG/Otq8rD/Qm7IkV5SCK9zJl7cAe+M81u4ib+pY3ZF1CSsvhzHqUOowpi7IJ+a3N
         Yp9PLD0e6uhxrUxBwnxhDS6sWeDTJNoCvvYNV2tCEcky23xMel85v9+/HAqMfxYWv9Gz
         Yk13qT4AK5IZPoetKhx9sM3G3DwPFSytZzOgtFuwfKwiWyaANR2SzxfKTpZszdJeH+i9
         ewcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ok29DZHVwz5H6EViR+wf3lG4+2Fjtj7V71lxgVX87vo=;
        b=EkhnsvPSl8szzk/gLfC2LF2WWr4D4qK4xHKd8yqXj8Tk9opSMMgmwf71nvVuJa5jjh
         Aw63G+tUU2jdnu+5mBGL3v9ECbl6abSFHWnkXTbi1Arcsyqeo6/wZuN/pdQcFRNGxdYL
         g6u9PjmC7Ci4gpYPxnk4WPUj509sQFEnFRKO2D4P4z6ypPoq4RWu0iwu6UGhBGezdUmn
         nBqxfSJpVuw4HAP447Yo10f7iZctEc4ReU1rGVzySHnf/iCI0njOaOH7HosR0KkLrQi9
         B3vPtbs3n22j854f+AzB6gS8StUy5P37Wgp2scW3K1V175FUL7QLRRYyOi2buJDZD/4T
         7hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ok29DZHVwz5H6EViR+wf3lG4+2Fjtj7V71lxgVX87vo=;
        b=ibLjO17LkqDxeBUtRA6ycm+yprQtptIiTxBTr/lgXWLovlL9vgi2sRje8Gf6u2GnoW
         uS5C8fUADrl/wqixt8N+v93qAc4YNb0frpzcSZGjyDc/luFaE1td9FDb+MrXAVxXNJrs
         G1VBUq4cbhlZbRkNZQ2cIQQrGC+XQZ6LXHIMuzZY4McVWTgru0WaKHcGxQci444gPM93
         FYPqkkDccozN0nSRlcpL6nVJk9kjj9HXOfNCCH7QNf+GfKpumdPTMcLz3qWErovzPc1a
         YlDQ0nFzeBaEz16id5CD+5Njabhyl35bc9VLf+kz80huhlBtjUS7KvFtuogSUz4Cmqv7
         YknA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV5lj6ygEpo38aLMfcLZo9wDTzzFFlK90myHn/+ehjz86u4vIsk
	F/9Nl+LVsb9R8248AjC+g6U=
X-Google-Smtp-Source: APXvYqyJPape4xGWHKaTXdM2BTLC1UhtC/3eUP5vF7x/uvQgqpwfkNBQGmepIYDOsr6C0syYm9ap0g==
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr56524028ljd.190.1564394422146;
        Mon, 29 Jul 2019 03:00:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:157:: with SMTP id c23ls6850209ljd.8.gmail; Mon, 29
 Jul 2019 03:00:20 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr56556905ljj.110.1564394420584;
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564394420; cv=none;
        d=google.com; s=arc-20160816;
        b=BZ+S4PXqTMGrY4Y3HuxBkBUUKSSzgKyoszbtelJ0pIQXDuQwLKEC/au4coBluCbAzr
         wSOjCE4/RiUQhfNPI8d7C7+c7pA1WqAUaGtiNoIm7y1w1dIYHDwoKM7g0gPhA1NvkhWw
         bp/MccDnsY61mbIkJpcrNXDtt6T9dEowVZ9Z+SKadWSOWMW2Dbz4HubjD2bZORhGIJCd
         cPbg3io42eeuHi9KSMFeV4rKVKZli/Sf5tOeynRAIyItNhI1dH3m8h+UE2iuncDqx5zl
         rZOUEo370Q4cjPxoIFQwq2/7JqpMbBTQFr2DT9UIOsofFDIzvi6965j/xAWPrct9wulN
         Qp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Ps6bCNoT5mnd8gQBY0YpIHtByaDygIVOAvQ2QpA5qoI=;
        b=ETt09VffJt1lCQSTkYtlcodpmmkzXXyzHzgh8NDG/sYAsacqMCdYe76dqH4H27hDou
         whD8IcCAXZntcfGwWGy9+qD16j3V9gTD8Gjc2tXOgYzP8vwnhXyx7AwGLnpnrVnFGgN3
         C4jgTwXhrG5QKAeh3jBIeVJPxYFqTE3sk194pw5R4fZuTRuKDD+q2kjcCVJJgqCAqsK2
         izkxI8+k3Qj5RhqNvPAib5JE3vL8sjsrIE9i9gWWZh0B1NzbmYztB9F0c4q37unpt42F
         fpoY/01agS4maYh2obxezZtD391vmy8p5kktrr9iG/a2Vy5O35N/TIeGjRJFOrkjP7T8
         H2sQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b8si2654905lfp.3.2019.07.29.03.00.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 03:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45xwD34QQrzyB7;
	Mon, 29 Jul 2019 12:00:19 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/4] tools: jailhouse-cell-linux: Add support for pio_regions
Date: Mon, 29 Jul 2019 12:00:16 +0200
Message-Id: <20190729100018.19411-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
References: <20190729100018.19411-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.29.95416, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.16.5630000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

We will need to parse pio_regions in the future.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-cell-linux | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index e23c8982..5265b665 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -563,6 +563,15 @@ class Irqchip:
         return self.address == 0xfec00000
 
 
+class PIORegion:
+    _REGION_FORMAT = 'HH'
+    SIZE = struct.calcsize(_REGION_FORMAT)
+
+    def __init__(self, pio_struct):
+        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT, \
+                                                      pio_struct)
+
+
 class Config:
     _HEADER_FORMAT = '6sH32s4xIIIIIIIIIQ8x32x'
     _HEADER_REVISION = 11
@@ -609,6 +618,12 @@ class Config:
                 Irqchip(self.data[irqchip_offs:]))
             irqchip_offs += Irqchip.SIZE
 
+        pioregion_offs = irqchip_offs
+        self.pio_regions = []
+        for n in range(self.num_pio_regions):
+            self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
+            pioregion_offs += PIORegion.SIZE
+
 
 # see linux/Documentation/x86/boot.txt
 class X86SetupHeader:
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190729100018.19411-3-ralf.ramsauer%40oth-regensburg.de.
