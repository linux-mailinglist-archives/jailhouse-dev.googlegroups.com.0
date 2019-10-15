Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVHES7WQKGQEICVFMDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA1D7B1E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id j7sf10422096wrx.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156565; cv=pass;
        d=google.com; s=arc-20160816;
        b=yDHiwMElLCDpMZuMHvT9HmMi543PwagjgMa44rIiZv8qtKEo75Q2XvnGGLVCG96TSN
         kUE0HN1Ry/JQ3MrO9pYDg0fF5rQ4PXyLoM4h9e+01o3KEvNGUhogCaapVktwTJJTZe85
         RW6teaSqOGE0mPxg4UMxOjACLb8KEXM/chgotDuWbhrV2vN1aoKmF8EJDWpe8kbhqQaZ
         R/+/xiOGJO2DLXJ83F338r8FljIm+eU7GPqaJ2hZhNlql2KxPAi4M9KMN2SzJ6MS6jf+
         o5/EMJy/uF1WHchf3mLARbocEEgBBDDf6dQPNGsg4SO0x3UOahhG3Wh717boAIHye4Fk
         Y2rA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=X4brOKbeheEO36MVkiEDt17wXzwpwmkFtxaCYECHkXk=;
        b=BctZYnNrQvYE79u9waN/+D1gM10AZaTPrXprZRpgqtImcM50uo6H9NRH5BvgQPNfDk
         snfMY9eXRsqCsFZhiPv23iZb21S0rpBXnCebITIgKndI4KEGlqtkN8ydb9twdf4+46Cc
         BoManXCEMuQauB9d2q2GkpJmyOr05mrTg/zX9vU2rJF4DypGE7y63fPZQRzaqG4RYNl5
         JqqXTRQfRyUa6tIpbzjcmAHnc+asJQk7YUZYKiihvSUXrPUphu3X5WOCtzYph0QGMiaS
         pwnTdZhGp+5NC0Fh7P4oSUX0EU/zxkIZDMxXDaiTJiA8dpVLBwyqBQ7t/Ej2wSxMNnEO
         uW3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X4brOKbeheEO36MVkiEDt17wXzwpwmkFtxaCYECHkXk=;
        b=FrQaG8hyI8rwylk6vsJV767pWzWbvB495Wz7HCUFD2wDeM4A4RuIx6wFCdr9QGlmOT
         CxGERO/yZIX32TaBchfN6h+Js5RDArJvB6TtTmyQAxM9/8spSKtSsY59PO5z2CjJJVSU
         cLkeyKgdllRoax3dayqSd0iPFSs20AOUoNPVW+Qv66n7Lu5F/asNid38zc+liNwC9QNP
         REg5IBV0b19tvojeH840lmAMx7bmzDC3rFNZBRyTlW6b9b4PLOeD/pGsD0FztLEDDvSd
         q8uDQbD+MQQ3NWRAUx7fJW7kjuorKXfXZ0Ebp1jvbP61eAhtywhDzKPD7V1x7GTUgBHK
         ySfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X4brOKbeheEO36MVkiEDt17wXzwpwmkFtxaCYECHkXk=;
        b=KDEw+GiPf3NowRXJYxVzrcSLGm9fRJO9LvGTMhaTHpCdo6XRWye6QS8GuGMJeGX7dZ
         LkXqybVmjXS0hI8Q94HuuxsigdtjggDG1HcBxjv+h4huT0DkPP5WsMB45qJQCGG3Xzdl
         rN+vUPtXI9NC0xCWo0+9Wg2AqM/RDq0wm3mdAin7fN0NrtTCbt7MddKHbm36gMkb9BAb
         y2EEiSoYe4p9a1rYNFBU5+srJB3PO7xRr5R+4yidCrBp/RyAxH+TqAdsm+3UMr9UWz5D
         ChIjgjQNdduVXAYVzGZ5Ljea3C2NlLvUk/HG0qSslbU3jCjcZLezYeKyS+cQOr13urei
         KdEA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWO4vCAXzLHgM5OmgjFHUBNwGIG0+IbF3YR5qYUzeVlYqqUc0fO
	g9fnHh7oMJb2kit3Udk1gdg=
X-Google-Smtp-Source: APXvYqw/qALDXPmGaXXDPmkMsAPOSMZuw9FlEIDjyHNe0esmWRBByEgQuUT1NrKEkpSq5XkS2t+iNA==
X-Received: by 2002:adf:b102:: with SMTP id l2mr33648236wra.269.1571156565026;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb8a:: with SMTP id t10ls7136657wrn.16.gmail; Tue, 15
 Oct 2019 09:22:44 -0700 (PDT)
X-Received: by 2002:a5d:4685:: with SMTP id u5mr33015594wrq.264.1571156564432;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156564; cv=none;
        d=google.com; s=arc-20160816;
        b=z6bQtGAaaPcRK1754jcP052P1z9JK1Yvtw59j8mKKVWpOo3WoY0nfEpBeSqVijP4Yi
         73bzHamtADjqSf4sCPASxLceLvRfQhs8nZx8yrpEdjmZWhgpB7WDkL7dkOKhDUxnaEKe
         Fc+Ob65OJeqLO3bJridN0HdnQg2R16EhUjjFRBQgTcFKo/9ZAT6rmZ6M0HfWIfzbExY6
         /g2Rv+uST7n8+VOhmLujuINyIMs+UADOdhJOAMBZxgQZ0lsei4d/PlfFZRJTmRZJqP+L
         U81B3S2LOEIen9taLx1ypTDZhXlsAil8QVNdZMcOwIMwnV1OhC4vBZSLFZe/pkXgRP3T
         /jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ExkO8D9eNwA8JevucQzG2k/EGUrRAxKqYZPkW36J4Vs=;
        b=gpfy148Uuqix0lUtX2taBl8CTMj4BvvWMOQv7g6FE4U8IfVAcZnVVjiclnhkxv4gc/
         Hb/xHbTd6O+nh/gnL/6VvCakES4vHrDI5MA9KcJ0K8YreuskYUdlPj0ghYHH8snAyOVn
         vksfyy9nfRSwP9OwJiXZzwxKyR3l2gTfLCl6A2IqeCg1l5K5gJCWzcnVIVtCG1ZLF3LE
         yOO4O06FiEgXSnt0E7eM2ci+WDSIUU6a18FSE90Obn5ap6qaJ26nBba6s08YapF62uZ9
         Z1q2BI665tzQfDjdakHjgu2m5pKLQo58lELZBR4aMWjVUt3ter19nBMmWFlTEMABcBMJ
         kPMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id i7si834218wrs.1.2019.10.15.09.22.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11J0MMSzy6F;
	Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 05/13] pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
Date: Tue, 15 Oct 2019 18:22:34 +0200
Message-Id: <20191015162242.1238940-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Move the next part to the new class: the whole file parser.

For the moment, this leaves an ugly one-liner in parse_iomem_file, but let's
keep it for the moment -- clean that up later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 50 ++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 38755404..d6ddc917 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -835,6 +835,32 @@ class IORegionTree:
 
         return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
 
+    @staticmethod
+    def parse_io_file(filename, TargetClass):
+        root = IOMemRegionTree(None, 0)
+        f = input_open(filename)
+        lastlevel = 0
+        lastnode = root
+        for line in f:
+            (level, r) = IORegionTree.parse_io_line(line, TargetClass)
+            t = IOMemRegionTree(r, level)
+            if t.level > lastlevel:
+                t.parent = lastnode
+            if t.level == lastlevel:
+                t.parent = lastnode.parent
+            if t.level < lastlevel:
+                p = lastnode.parent
+                while t.level < p.level:
+                    p = p.parent
+                t.parent = p.parent
+
+            t.parent.children.append(t)
+            lastnode = t
+            lastlevel = t.level
+        f.close()
+
+        return root
+
 
 class IOMemRegionTree:
     def __init__(self, region, level):
@@ -878,29 +904,7 @@ class IOMemRegionTree:
 
     @staticmethod
     def parse_iomem_file():
-        root = IOMemRegionTree(None, 0)
-        f = input_open('/proc/iomem')
-        lastlevel = 0
-        lastnode = root
-        for line in f:
-            (level, r) = IORegionTree.parse_io_line(line, MemRegion)
-            t = IOMemRegionTree(r, level)
-            if (t.level > lastlevel):
-                t.parent = lastnode
-            if (t.level == lastlevel):
-                t.parent = lastnode.parent
-            if (t.level < lastlevel):
-                p = lastnode.parent
-                while(t.level < p.level):
-                    p = p.parent
-                t.parent = p.parent
-
-            t.parent.children.append(t)
-            lastnode = t
-            lastlevel = t.level
-        f.close()
-
-        return root
+        return IORegionTree.parse_io_file('/proc/iomem', MemRegion)
 
     # find specific regions in tree
     @staticmethod
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-6-ralf.ramsauer%40oth-regensburg.de.
