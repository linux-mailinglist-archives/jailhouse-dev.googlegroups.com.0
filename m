Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F075D7B23
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:46 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id l9sf12493108edi.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156566; cv=pass;
        d=google.com; s=arc-20160816;
        b=cI0yoLC+Y6pEUQS+B3FxBh+tB7wyosfOFRPtoBzLFTvN6pvYN7LymbcWztFqYDQSjZ
         xhvcmdeUkpd1VyPBgBsnNx3x0ulOqAxI3NAz3FRtjvknDd2QfdRQQJh+MFlX2K85RmjH
         08TSTNomCwFxEse9uj8ExPtSEvz0yJr+BUxX1Dq7QWK7eSQ6Fdit6ajdvxBcsRxjuiC7
         mB5Z32FFLIm4vJk230+V57vj8uHVvMFmGO2PkU+mZmL3WxjCzEAzKHoeOMQ3G5SIAM25
         MFita/tSmJmCaRElB2kCfxzh82RgPwh0TiVIVq2n6s5Q5GuAPIuqPWibrXyeaZXy8KNy
         9zOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2N73rCx60iBiafonAh0Z2QfORnEwr0Gpyb7kSYf2E1w=;
        b=f2A17eqEjO/abI1ljdAyvjBwaGkQlX3F7cwXxHnC+5LJUrbBpgZO6g6z+x0pMyV/RE
         K8Bj+Q2Dwo8h2XmBxl4A74AsxLT2JjFuQdTZXg8qLXkL4xR4X2g5aQbkII6tEbdvH8QR
         DMePz+oMSDJu5t7XMQ092Y6hEb4FnIuzSZruJy1NNf4QIy1evbVrBK1DaWS5PDNFWWMB
         xjLPxOiTPM2Q3xnIePEUCy1ycK+lewzkW9pR3C7S5s1+x5kdFgXZR0ZzSFWfy4YbfYpB
         FeM/Dn+KtECV23aW8vvSmFGRGk3bGyc9ffWpmDWujU+MyMcKAs/gpO0qhRydTicENoiR
         TkBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2N73rCx60iBiafonAh0Z2QfORnEwr0Gpyb7kSYf2E1w=;
        b=SswPTPppz2TOtWZs7VXxw4eSG6q0DGsdaEErfDm1DWUJqXNwxuEVpuZcXH+My7Q5kr
         RAGRNDLN+aE+dia5xuWRd8Vf0Zzd9xo7l1n5x/QNI/XP8MFgUraYnwY9pLKnTY2P5U3s
         cdAlcQuOQNlhln5s5OV+6ZnEoQAdBIWVq554Y7CmPqPWytLhfDaTEmVSO0vt+nrfsndA
         iB6AQCrbcAlUHcwpebpOKDCZX7OxigS9r0wd90WboWSi8nqPAayedCiuvOwpRyhdqH9O
         yfMw3HVrOyjYSa0JVT2s5uOv7nTc0ywVmKBl4JB+USG/y9Emod97xX4+46kFrlLkq7Jo
         E4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2N73rCx60iBiafonAh0Z2QfORnEwr0Gpyb7kSYf2E1w=;
        b=uBnRAEQ0bL1wnvZSDW4O8nYsr1TU4k1pMwciuoujyM4IOh/TsZ9vhd7UAfQ3Fk8/n5
         x4B96y67mneFz592frlWP0JL4lVwfejtYLb4sw/F8hIuXvmrgLWzaU2htk0FgMp0vUKb
         FIbcivCavEooRejswKgdHaGvC+Cc7lV8LWPkD16NLVlmsnhmEwqjTq6pRnO9OnjCra6a
         LP5kGY/6NB25kpibf3k05vO3mmwBbAaBfhfyaW5bDIbGrFjEXzfYfwtavSV8rkpuUFX8
         XbqDNp+TauOMwhoY57skyDX53UODMAZU6KjtD5JRIhXF1xdD0DHk3tBGWhXi5p1LNjRT
         QI3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWRPytnwV5Cw0r3m+oWajW8EMp9ccmajzJRTcTgchQS0BphOjY
	0eCcD5BZp5ekvI3lqHtNyDs=
X-Google-Smtp-Source: APXvYqyB3NmkEAWURK8C3aacM5bgSBz+HBofTPV9A2ODxoxgbpSbUQ0+B1GNpOsKwDKYp8oT+E5VbQ==
X-Received: by 2002:a50:c90d:: with SMTP id o13mr34284987edh.85.1571156565924;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:a3d7:: with SMTP id ca23ls4831488ejb.0.gmail; Tue,
 15 Oct 2019 09:22:45 -0700 (PDT)
X-Received: by 2002:a17:906:46c3:: with SMTP id k3mr35119987ejs.70.1571156565261;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156565; cv=none;
        d=google.com; s=arc-20160816;
        b=sB6ix9y2PJJavH6rb+b031XhOr4osvWEd8jRlZFtK4t/13oFbIDPjcETj8mO1if4Hd
         sFE1S4koTYVnDWhPlXGONTgfNDHK8j6zg0NgeLXztW0O+thlKY/VRtv3WYJ5F7hmejxq
         89AXJfKfvdfZ+fp77eBfxs44ZIZuoLNgxdmarxwJd7AJIk9kDCKk/AP6S9w6y1cu8RLO
         HCK+dZDP+K7DM71DJkJg19a9Rg0AQuossOOyPSvmS7m9PBmwhERK87InBrlS2biu/fEG
         xkvbzs9obRtWdks6cswUrtmU0oJ+Cheh5ayv4N2VaagqeOvmwVpb9Vb7fHXMe2cANi+L
         We5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=y65CD4WGywPY/Fgkq6CD0AymTJWGxTv0KcF8LkW+3mk=;
        b=myFoJwrzja+YsEFXiWqRVfZILTp48p5KeaLrPEsGYLs2DOLrkcnwaw2gUImpo7VCXn
         3+u7/MJGsofMGmiJZ7vSiNrQuuU6i25JwX/hWZQy60s+b+WNf7lGm6v1D7ndT+zIImZY
         /zzDYB8Y8xsBPaV1YElaxnLTx3QoTM5H4fTNwR1vFhexExKAcVfIpyjXDG7Z/sPRtN71
         uLntDhIu3trO1xRZPmsjcqTEJhfM8PJClESLS92xJi9+r2r/umEsVqLb/+GzYZBkXwHh
         RyX5ztiFIOexYY1Bn9Xkq0sOXotn6+ZmNSmhK4FjFR+enbrWxlgCSY7RcMcl5RYpF9y6
         5cLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id c31si902964edb.0.2019.10.15.09.22.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11J5wnFzy7Q;
	Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 09/13] pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree
Date: Tue, 15 Oct 2019 18:22:38 +0200
Message-Id: <20191015162242.1238940-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

That function Will be reused soon, but in the context if IORegionTree, where it
actually belongs. Move it over to IORegionTree.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 42 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index ead20de8..260c2aa8 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -832,6 +832,23 @@ class IORegionTree:
         self.parent = None
         self.children = []
 
+    # find specific regions in tree
+    def find_regions_by_name(self, name):
+        regions = []
+
+        for tree in self.children:
+            r = tree.region
+            s = r.typestr
+
+            if s.find(name) >= 0:
+                regions.append(r)
+
+            # if the tree continues recurse further down ...
+            if len(tree.children) > 0:
+                regions.extend(tree.find_regions_by_name(name))
+
+        return regions
+
     @staticmethod
     def parse_io_line(line, TargetClass):
         (region, type) = line.split(' : ', 1)
@@ -903,25 +920,6 @@ class IOMemRegionTree:
 
         return [before_kernel, kernel_region, after_kernel]
 
-    # find specific regions in tree
-    @staticmethod
-    def find_regions_by_name(tree, name):
-        regions = []
-
-        for tree in tree.children:
-            r = tree.region
-            s = r.typestr
-
-            if s.find(name) >= 0:
-                regions.append(r)
-
-            # if the tree continues recurse further down ...
-            if len(tree.children) > 0:
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, name))
-
-        return regions
-
     # recurse down the tree
     @staticmethod
     def parse_iomem_tree(tree):
@@ -945,10 +943,8 @@ class IOMemRegionTree:
 
             # generally blacklisted, with a few exceptions
             if s.lower() == 'reserved':
-                regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
-                dmar_regions.extend(
-                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
+                regions.extend(tree.find_regions_by_name('HPET'))
+                dmar_regions.extend(tree.find_regions_by_name('dmar'))
                 continue
 
             # if the tree continues recurse further down ...
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-10-ralf.ramsauer%40oth-regensburg.de.
