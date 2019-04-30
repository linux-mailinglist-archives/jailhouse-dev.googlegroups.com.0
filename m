Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZ4DUPTAKGQEA2LG3RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F1101FC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 23:45:11 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id c14sf16149612wrv.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556660711; cv=pass;
        d=google.com; s=arc-20160816;
        b=GGxR4aOhYYArGlEGD9sMUsuBfkD2rlZ3qFhiQxeXmxTcU4MhzmWALazFhk6rJD+/iC
         OQtAdV5EA9ipnd/pnlvR5XHcSbWtqJhAsyMMg9skvbDQ54wFbmOcgjzRU+WsFY+MjzRc
         0g6biwz2nHLQ6XSrXBXzRm+2t1qdGfYdQ76VSgal/AvYkzdgjTuTiRY9JTYLMtryT2Fw
         3+8CGjConEsVUawOG1Emnln5dtk9/ly72YIQWwPbH1hf7tPgU+BVShEeC6exDeqa2n4u
         b4TbGSYcX00ssJSIgH1d7PQgJmqT/dkqtfUT0vJGc0jNl5+dv0iJ+sFIZcx5+zu7a1Oh
         f5Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=vKVo0YBbiBrRARlWo8cK3PyDAU2O4iceNvj71XiGpOL9mx3qIKUNHnveOJGQHXNlYI
         480y7Olk1qZD399Xac+ClTyx+rMBmuZAwqds/ci/FYLkyjp/AtgXYdVD4rNCmbzdXNLD
         ERN0aiO072o3eB2ZoDQp7JpefDnoE8ZBljGVRLxUZMAxUk2xgu3+95o7XmG13NMsGYRP
         GlnHy26Ajq4NtmLNDAJJj02qS+JR99SsLKPCiGyhxCyGRJz1q/giyX2bP36o6Cr16sez
         /8bV+5cYXrnVObWqPbv7BpcPcYF8+VjtehoA5h6Q3fxB7NI7VQ4u7jx8zkgZ6m/rSO5M
         n2fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=m6tnt2t/i2FsnhRDeRxUyFwajF/oG7/seQZybcznyy++UAHfilqNXhD2tqq3naFBwO
         cLWtmghfjvlL8PuBDZbywAHHAkwVJpigByeHKIroEj5Pw3xAnOqzr0OpfP25ToyY4dIL
         t+1hhRabKySxTrAluke2eRWIQ+Svkh/NoFuj5x2nFYZYB0Lf4tqHvdPUQCJhI4WNJCBZ
         bHpOZsXWlgszjllcB99ngDXM1vj/70czenS1l8ejRMgTUVtS/9dHvwd0W68bwgqHLAT+
         mki/uvkv6qSuROiq4zR0yhWgUAS4B0s+JufqmtvscDbQ4KzSiTkjHdvwxyXkWEE16GVV
         Jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kFK6cphcLNve/lk8iEbYa6x5yiWbibI3yBuO1bxEt80=;
        b=gdiQ4YMM0DXreKQaQhU7Y8TRj8eL4XUNLLE0OcdGuf6Ow2S0q6GmkXEEbt6xLhMlE/
         W9e3F3MuLPIEFMV7LspW2jla2KssR5cmVX9EkvotRxIi0pxWq89w/oZCNOlSIjiVID3V
         biPxMyDtDnweNzNLG0PP5xjWIZ+znJWgpyuNJUqms5QYUZiB8eSmzMTCCBsOvcOZ1iu2
         P+Y5TnsBC6sgWeRP0ySqSdhMK8RLcYr4BZ0BhCIi56J9tGGODd+6b+q4xZKNYht0zQ+6
         DxzZN9x+HggLUky+/HqMeHiTu/atIZBaKwuBTzN1TTK2MZzrWb+EoO0UJo58UCShR5JE
         4CAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV9AE56caGDAdSuckeZLC9EhLOVczPEEVvNc/zzSq7+hoSsYSZT
	FZFICmnAwp2cgx354EeYP1E=
X-Google-Smtp-Source: APXvYqzxpIN3d0gcIIwoF9LojwG6r4wjhxBfH9cXXZCfxzk6nZvxfIxHe8eG/Tim2SrdUBHfOZro5w==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr4778827wmh.32.1556660711422;
        Tue, 30 Apr 2019 14:45:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbda:: with SMTP id n26ls1233366wmi.3.canary-gmail; Tue,
 30 Apr 2019 14:45:10 -0700 (PDT)
X-Received: by 2002:a1c:f312:: with SMTP id q18mr4448237wmq.96.1556660710942;
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556660710; cv=none;
        d=google.com; s=arc-20160816;
        b=aacm9Ve7ILIMKF4k4v4g6X14uv2B078tCfWvD+H+4a3mvK7jvgADv9wwfNCGFzhRWm
         g9w44BLoUda/BvJ3Wpt+o4uM9Am2+vMn+jexKd1QMCNoP2QFGGHW9bZb1JrqrDDwKHTF
         uQH7/kmYEfPhE9zBdJe8Zfg7Mt+HQBsUQ4hHA5KKnewNUyLAW2jzqK2qNyQvEXsaqQ+O
         5lT5z6DNHm6qkiTNQ5mJA8aIyPukm1bsrTF5cOOlHuTTUe0dXzpGPUJ6TmEylfqwvYkb
         JsGam2BwHxJYzscgPiz9aO0TbOA0E50agdRdTvWakk7nHHhOs0hqHaFg/uhwkgNTzIpi
         v7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SX1bgAVNx0gjJxuPCf93EjhXME9qVETxrxT1B8aLPj0=;
        b=ebtyaXiQd/aiVEA7YEb82XJ4wrEU2V2Pyjxc9EqXFD0W4UTVNdpbP6q/13JrX8Ifls
         pYFzeC7Pr1zX3gjQv6jw2QwcHwJ1zqYnyZNiFaqGK26DH/lnds2Au4uvIgREoARckrLh
         7i+d6e9T39LHYwd0Susmq8LZ7xqesgFI/F4E+9f1BpY7azOX9RYg74mGhrohxISJRUr1
         pyN+gz9sdOJWGTPGjmNxM8i83oAsKUYbW1j5jd8RFPCwA4cMdfRREsZkpW2UvxRFaq0f
         B5ZuNla8sl++JF3mFcHnYPBWPN/j1yB+FJnGbODJxJ/hdm4cwEV2OgdqIQ38J6pi1HD4
         n8Ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id n21si126446wmh.4.2019.04.30.14.45.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 14:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44tw6t483wzyBR;
	Tue, 30 Apr 2019 23:45:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 4/5] pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
Date: Tue, 30 Apr 2019 23:45:03 +0200
Message-Id: <20190430214504.2153-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.4.30.213616, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.4.30.5600002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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
