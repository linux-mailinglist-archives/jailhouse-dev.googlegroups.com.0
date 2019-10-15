Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7BD7B21
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id r3sf3889507lfn.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156565; cv=pass;
        d=google.com; s=arc-20160816;
        b=vpDKvFwSJb4xSRGV+M6h7w7inFGAL+UHbrcvRu1xp9Ik2RvDHbyn4666MzKy9DsWis
         zN33/0+Z9SN2ClqAnSJl2XTWy1Fy6vbXn3f0SyYAA5e0pEgN02nX8ZC5nnsvPqrYa9QJ
         yE0MHTjunu/Mmuyw/EwOmp1TJiQCRxG6FvVFgAaq8Vx1c45OxnReH/X+zp81/kTN8IzY
         S/Lc7WKDM5U6PfdHgvs8jzhoUISg5mjMieEpQTc/2G3fq+W3KdbQQVH6OGEBOc3Qs3Yy
         zyVnpPxnP2lmNmI8zeOw7AWp9Yx/Ecvih2IDmFvaklhnV+W+SaMRxJKOVIqhE10eZta/
         QWFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HOKKmg6/feDK8VcBK9ApFLymqHtx8ku3GI7/sjKIR0Q=;
        b=RhwiHjJm6EYzOjjNce11kbvKuHLSyV0BINhOnEXE9So10jAx8lw4rJaw1HlN+bbZ/A
         emfv9riL+A+9g3UimZliyMoYrDeYYfT8z4B/8sShaH/qKBhImL9UOYpWn6hGYqRHpcZ+
         o1THrvibBEpsNUD/EoRmWJvJ5r/tIxNshquxvFdtB26K3xn1tG+oxDjTEK4P30ZF8guw
         1U7fmkfijdPUaKsuBQzrX4ueJAFpid9/hsnk7uYAP0H/4QB2he6YYSVwJzfFnJ4cNHlM
         biBt+/Lqt+GimNVIomkhz8Dlwawa/J+6Z/dxThAZhh77KZZPikzQQvKmHabB3fZ94/pr
         kx/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HOKKmg6/feDK8VcBK9ApFLymqHtx8ku3GI7/sjKIR0Q=;
        b=BgliOndIlZ5ReDaEYOVUy9PTHMsG1kDdtQQxWsP87DuhEw2bviRlS99Kj/XBiWDMhf
         dMOFC5sXSEZ8bjcq6s6ThRCqoK6Co+W018RoUQ0hYkkDhbrzsjA0jenuM/I9ej9mK8DO
         zqDhUmDUBgrghvmOz/yWVJxOAzothN2ix1ZseHXN9AMK1QDWMdFMhFVqpYi/Njkxe3Xx
         h+TpTU9sWYNgljfB2cWbTeMKLcCAtMOR1yL/YjdZzI8/1XBris5xPYxnOYG/vqxMjpRL
         2mSqCgyCwUvyPX7GMfneHCq7MPlCh0wNSZ2aJRGaGPwsPxDGYoeriJ0fXZv5wHfYih3s
         l4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HOKKmg6/feDK8VcBK9ApFLymqHtx8ku3GI7/sjKIR0Q=;
        b=TfEr9+3a38oSDLjstLDtgLRwvvQjtvIENWCVPHmrrKVpXQEO/yYv3drlYJtTE5pRTD
         /3zCwi7IlVt9tIHfawlrlDLHxUKA9YGVD3idusem4ES7QGtfWY1HrTOOFP/qIRvH9xw1
         /QaxslCtDuJ0j3u/2ktKqOg3s9jkM7X3ukFldun8/QJEFrEnIdunXPnBzOjF0D2JUMBm
         Z95vtM2miXtpwsLxVk+wqlqREM4SXSrSH5FF731Vry9I33ZYdcRszu/05gBBJp9XWTmk
         rt6qj5FWaQQiyZYCFiB9X9d3w9YMuEb+Tg5E3FAGBWmL/2N22YPoGu5dMI1CHbZFVzdL
         9FnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVXPElFh2Wxa3UsBO1fH/6ekDEs3VAiyBFx+imR6WV6ps1L6L6E
	k9WlPxPhzu415DuXbSURsN8=
X-Google-Smtp-Source: APXvYqxPARVxU+9pDAYwQvr6KgOuwQ+p5MTHztS1S7a69BOH04Josohxv4VRLbbG/2rVebpH55uJ8g==
X-Received: by 2002:ac2:5a49:: with SMTP id r9mr21033287lfn.54.1571156565478;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5201:: with SMTP id m1ls1694671lfb.3.gmail; Tue, 15 Oct
 2019 09:22:44 -0700 (PDT)
X-Received: by 2002:ac2:4d05:: with SMTP id r5mr21117662lfi.26.1571156564938;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156564; cv=none;
        d=google.com; s=arc-20160816;
        b=RlBNHKnB7jhQaaZsHmGFGK4ezUG5Z2oELGrYiX4JxO3ZZYpIp9CA2bSB/FpJjUIZlp
         vIOf/IO3TgU/aD4xc9nSJsHRyZng/aSj5P7jVD/2hLqbU+lDWPoJjuqN8jAPPTiWzF9L
         RZVhHGWfA3xOyq5F08yENl3czolD16j/kT9ysvsz7yKiK++48DMq0cudD0+d4dtFoYIJ
         6BuuUKxNlTqpjEp3JJVV2aJycG0El2+QnQPCw7MF8B7SqbdSABRz4SWjOk/NX0LVYRS8
         b6LdqYlfCVQwaum25BjjQ1JC7sDN51Zt2Qu9gQSkASwpP+kklfJEDWkODVd0VCfPVczn
         SKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=jRBO/D6oSUGt9tix7eiC44pOZ6rG5w0hZnyMUqx5ZqY=;
        b=tEI6Td9kIdb8x2cL/2qI1HO71oYSDiAbrO88s7ORpuy63jKeRN66q7lGTUpd7ksLJY
         /gXxLCuPTToo8ui2pl2UTlnHWFjKFUH6DftvaboQhQHXy4ItHO0rO1fs31Qu5ryITK6n
         4TzxAyoOqmmlNyiiJj8ZU/dSzSOTCk8LHpi3YKS5d4ZHwk4ctCiq13qLFOqjus9/zMcd
         kcPKglOyj5wv9scosEQQkFGeDHafjCoztNJANncJdN0lpWJD4gOjk4huXTCzI9O7ziM0
         QQIiXFbj6a73UI3HXJF8C+I5Rq6WDChg0wjtYWvyVE5Ed9ZvP4Q/P2uoRnYaqsCtHzEJ
         MsZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q25si1220037ljg.5.2019.10.15.09.22.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11J1rX7zy79;
	Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 06/13] pyjailhouse: sysfs_parser: make regions_split_by_kernel static
Date: Tue, 15 Oct 2019 18:22:35 +0200
Message-Id: <20191015162242.1238940-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

No need to access our own tree, make this method static. This allows to
fully separate IORegionTree from IOMemRegionTree soon.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index d6ddc917..4736b798 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -869,14 +869,15 @@ class IOMemRegionTree:
         self.parent = None
         self.children = []
 
-    def regions_split_by_kernel(self):
-        kernel = [x for x in self.children if
+    @staticmethod
+    def regions_split_by_kernel(tree):
+        kernel = [x for x in tree.children if
                   x.region.typestr.startswith('Kernel ')]
 
         if len(kernel) == 0:
-            return [self.region]
+            return [tree.region]
 
-        r = self.region
+        r = tree.region
         s = r.typestr
 
         kernel_start = kernel[0].region.start
@@ -939,7 +940,7 @@ class IOMemRegionTree:
             # if they don't contain the kernel itself, if they do,
             # we split them
             if tree.level == 1 and s == 'System RAM':
-                regions.extend(tree.regions_split_by_kernel())
+                regions.extend(IOMemRegionTree.regions_split_by_kernel(tree))
                 continue
 
             # blacklisted on all levels, covers both APIC and IOAPIC
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-7-ralf.ramsauer%40oth-regensburg.de.
