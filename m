Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E9D7B20
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id w22sf3883527lfe.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156565; cv=pass;
        d=google.com; s=arc-20160816;
        b=b6dBedLpvP2pa2IicqTi4vErQgQQOQQq6AzD6zMqcQn56bTN8GY4zEPS+uY8NBQt2q
         iS+fyo7IyvK37K5Z6m7/a58PepM2BDo9IAdonQMzLXKG5vlEE28b7zIrKW6o0gnZT3u1
         pJxrZZgO2axVJ7TDjmT0aAH3Siuq+ooc/iidEhAj3p6mEXhjBH3xNzpdEtebRSsePK+k
         HylYhM0f7Cwse23f0fbJQwTwzQURnowzmfhyU1DOYd9Hy0PgFb0RGnLaIUdnVp7jdYNW
         20Th3c+JFdeqKkzG8+B6gHXw5AZEp08JK8eB7V3qtX2KaSE4dcMaQ3QOKTrj7fUhuJxv
         PUog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ri1Qy3gvOLrEMovYFLymnSGwdxTQBScEcYouAx8b7oQ=;
        b=SUOO37bXNhlg5DQCyrbL3XciufUhWQTlL/UxnYURUBmJ8+KTwiMtBWsYZ0Gmpv3dLp
         3qZsjcs5ng57QqZcM44YLBiqWtvhGUbMOnAFE4Gm5kmnBHI3SX1sVIhopDMWo1YXHPoW
         AsMFk52FxJgThxEY67m4LkiUoyu11+3PwglcM42OvAjR+H29xjkHJey/R/7IREpUvTgv
         U90GiqAKA0tpxXypIiUPhHwn2YSx4IIwyp/+l6o4h1en7Y5Eyzlt3NbKal82wc79oFMj
         S+hEQS8LIgL3YlEyVM9BAtPjYv9mR/rtUNlfs2oEzclFTWbmvvvlrU0prij2RGRBym1D
         TLEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ri1Qy3gvOLrEMovYFLymnSGwdxTQBScEcYouAx8b7oQ=;
        b=GbOwCkvQ3KFsUOXv/F6jX07TDJWao6NendxdILoprLDJ+HxZPvMvxeG2qD2NWnvmDr
         F0eO1rRBMSejfTfFI+zh8+aB/YhwrSRjW2MwBChona2rfQfCRlkoYjsarqoIZ139mqgv
         e+bdP5Q2917LavCJzbfqIPZjz0F5u/sXVg732xGTxHAu4tMAX8h0iTiQWK008unZ5JM8
         nStw3Ek8XvEAYI6YUnkE1OWez3SW6sGCxr5tGYECvVCuq5aEXZ5BdK8DDKmBpbyhWZdv
         Ws5xZ9Xf4Fgm7yBK9KhueNfQ/Kfn1jvue8uWSC+x2VpFIjysTmX+BPkTJPo8TKYCc/n9
         FpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ri1Qy3gvOLrEMovYFLymnSGwdxTQBScEcYouAx8b7oQ=;
        b=WsJOjDpYcWLSZ8HqGETogExGG7EBVrKYO0V2IGzM5BZhNSo2nXpr2tpkzYHY/ATPSD
         fZQFpQfnutlzUjZgJY560Mg0Yb+x5zGLUkWAl86ClztDDigIs0Z3YagdnFpP+CI39IGC
         cExWH/SVLkhlkkivFqpXtZPJxgjnD5Np8+iCAvB9wT9eeennfOYdRhnB/gNE+1Jk9VWG
         7jOtFkixUsKbbwq1YISMWejvfGU4+t4Dg0NBSGWULvyncyKaIZRxuXU1Gzwca6m3Z58i
         T5Y5OCXDw1Jzwv6cs2alghv4tI/YYP+7hgEaB7FkcnyD5ozKUyIRHcWkmSNGhfNnz8nz
         0wAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6YNPM9ZSie/7DjH4Q2Rau4Y2nzadQba6HnYVXLW6EUvrkYR21
	pC9fq8tZ0ZJSOVjRaJsxqz4=
X-Google-Smtp-Source: APXvYqziiHtL6wglH3f8jbzBunnuo29Ju1Nz8TkMZxXYqsvf6khWAjp01Xga68vmheMgF7BjBB9cSg==
X-Received: by 2002:a19:7404:: with SMTP id v4mr16248900lfe.129.1571156565456;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9786:: with SMTP id y6ls2348344lji.3.gmail; Tue, 15 Oct
 2019 09:22:44 -0700 (PDT)
X-Received: by 2002:a2e:878a:: with SMTP id n10mr3172285lji.229.1571156564850;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156564; cv=none;
        d=google.com; s=arc-20160816;
        b=D762O005Aj6KRM7aRitUP9ox7DsajtQZV3O4bKvi20xciYXw2G/prSPnnFV1jVBNho
         kvXM3P43gyihxJvMwBuwp+VQFY6FgK/uaCZt1yhyXW3BvzgMEh7gcBmbyLpjACDcJMts
         H5uIUF47c8D/EkMx8DjEWHTkf/fCeu5JQJUmKG/v4KHLEsmGU0VAPoi4WCr/BTpIBXH0
         xp5O2n8Ymv3/2XbQ9QlD7tq9DQRbfVNjXbzR4EZHgZvbnG2UatuMw0hGS7P592umDmxl
         AFi9B7ieIRNq+c1WYQ3Y/m4C9DOCcSPfolRBFbWiB30bKgjcKLFSjs3GOhnBwbXRze8D
         9rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=3jSZpOxPWoWmXHx9I1eybGx2Sjc5fV9QxPrwzHMuRQ0=;
        b=Z4Rsm1ZgsY1HgtjplZklB5zlgOd8/FO4/YRGx87x5UqD8vFMK48tR2hWqJxDd3Rze4
         om/DbuKcqUk2Jc9fYbZcN7+pPxZ3V3bUeoeBp8mPk7o9R/lx7x8YjZWo87/5DEJu1qWy
         xiL7xO7PgpJMyzUcpZKiTfhhjMGjrgL2zaG+ZhnfMY4wWlE8//gdm5xFrHK+nE6t7oE2
         /lH+QjF6uRHZkjIarcscW1Km9bgdkhNKTubCRm3s7xpz6IobDBIb8MPlDmnnah5PGcha
         LG05fvPySANZHwTFavQXVPdWrQamWBNbiQs+YfD6ybXViNG5EGMD1B++62ThVhxuM/RJ
         vz3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q25si1220032ljg.5.2019.10.15.09.22.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11H6268zy5s;
	Tue, 15 Oct 2019 18:22:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 04/13] pyjailhouse: sysfs_parser: introduce new class IORegionTree
Date: Tue, 15 Oct 2019 18:22:33 +0200
Message-Id: <20191015162242.1238940-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Do this step by step. First of all, let's create a new routine that is able to
parse a line from /proc/iomem or /proc/ioports. Both files share the same
layout, so they can share a common parser.

Passing the destination type of the entry to the parser allows to share code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 98717b4b..38755404 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -825,6 +825,17 @@ class IOAPIC:
         return (self.iommu << 16) | self.bdf
 
 
+class IORegionTree:
+    @staticmethod
+    def parse_io_line(line, TargetClass):
+        (region, type) = line.split(' : ', 1)
+        level = int(region.count(' ') / 2) + 1
+        type = type.strip()
+        region = [r.strip() for r in region.split('-', 1)]
+
+        return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
+
+
 class IOMemRegionTree:
     def __init__(self, region, level):
         self.region = region
@@ -865,14 +876,6 @@ class IOMemRegionTree:
 
         return [before_kernel, kernel_region, after_kernel]
 
-    @staticmethod
-    def parse_iomem_line(line):
-        a = line.split(':', 1)
-        level = int(a[0].count(' ') / 2) + 1
-        region = a[0].split('-', 1)
-        a[1] = a[1].strip()
-        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])
-
     @staticmethod
     def parse_iomem_file():
         root = IOMemRegionTree(None, 0)
@@ -880,7 +883,7 @@ class IOMemRegionTree:
         lastlevel = 0
         lastnode = root
         for line in f:
-            (level, r) = IOMemRegionTree.parse_iomem_line(line)
+            (level, r) = IORegionTree.parse_io_line(line, MemRegion)
             t = IOMemRegionTree(r, level)
             if (t.level > lastlevel):
                 t.parent = lastnode
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-5-ralf.ramsauer%40oth-regensburg.de.
