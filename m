Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBAHCYLTAKGQES76I2KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78C155EF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 00:11:13 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id u186sf3574233wmu.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 15:11:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557180673; cv=pass;
        d=google.com; s=arc-20160816;
        b=uFYwtMbGRckWXKOZ/A+Eubcbw01iayNiQRhtDX0RXga+oLBZVC/dSGbOfH74ihsnLE
         TQzmOJ78eTEmrSQc3txj01YJ1nFtx4Z9aUPq9AZRkQMGdX+gBEJStwrtSZf/UEEf08MY
         e0mpKcY1Mcvh4nJOIXnO8wzOHEEgEei7+9V+CDTsG3IiTKM4EMKbQ9e/fzUwQWscD4OT
         BxCpAloBNMeOPjIX1Mjmr50E9mRxwFH+boiJWpP/XFZnYZcfQPHHlLQ1tNKED7+xZpUf
         dVY6pXb9vg1efaWd6UJ6XsOxkFvYleBewUIKleuH1z757/+l6tBNu/q9H7tw2Uxsa2Dj
         LJVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EOKU+aKxcQXxflyYeSrJxEYJN7zz2c2argrpzkzjv8U=;
        b=iZ86UywVApk9NEO5uq+kfKysNtnzk3ocY2HuiS7hu8WiHFTaGuIYGdFlm0IArtVIkY
         WZxkGRjdD0fmDVVDCmLq4979tsKwxiS+2Cnx/dRx/gkwcdogR0VgJhV3t2jlpPxb/jMt
         8GO8114EtbZyxkeanSRYmNcsHKfBAfijA+W90je8i9rqL4ebvGONtiSrykeFxgErcH/w
         52kIM9ug6l+Xyq05m3pGiRBAPKkAz6WSBSOsv2tEOY6hqi262c1vsABp9PMagrXXV5jQ
         RbZGEoPzyjkf6E+d4ctOEL4qLZpXyPewh4ZemKxTXLrVDSx/61TY1yTT4Blfc7Wuj2Z3
         Ln9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EOKU+aKxcQXxflyYeSrJxEYJN7zz2c2argrpzkzjv8U=;
        b=LKRUKiUnekFNdepOpnTRr9bbur6mk37RM/V8K1QU9FvHiGSB5P+5j3QVo6p5bzKJCA
         YHKX2RXgIhJVz93sIwExvEsvOeMmVSN4S73ra1AyR3xKenEhGXyo928F4tWvfFnAzEq/
         YaAN3SbFAlcmlrT8+ex1IfBGm91RcEM4Ycq7UjH1/YQ2RD5kkXIrWJwsNevsAv8ODBbh
         3O1ht08uYAxQD0qAmjNOi/bL0coq/RfoBHphNtCAixpv7F5a3U+jYd0ukEA9aKsyIZOC
         RP3kyYXvECGHw3QmoyAgndBZ0HwHG5rXewA/w+3JHsM/V33dhckeQ0p1XsvJrU2dfmWW
         Xrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EOKU+aKxcQXxflyYeSrJxEYJN7zz2c2argrpzkzjv8U=;
        b=PvICtISpxTjVugPyp9YrfB8yEnUCoKTRvbmS6OQH61vxu8tcAf0SUXgFBIYN4Jhcr8
         vzYanb+Zs5cmvWVMxMioR41GlazWCYFmI/ksvxTHK2bx0lCIX5XGThdkYi5HIKwc8ATc
         wjPsH+2dbt4S2StYCxfuIaE0HbpjspUqjNLOTBDPYEY28LpZd+FftyAR/tzPiBIoeVQO
         LiYaUThfdLd8IzpWdbYA/ggqbhTFvAypVfP8KpeAis51+vyYgygEb7NOllxUtVcIW6Qk
         BQvcoylsaheami+YQFbi3HTVLQ9+LlO01HS0IT6sxKINamQnyGkpZgpbLAYljr5S3yf/
         Fdzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUtYHKHcIJeBAwIt5klpGZ6HztZQ1GBjpiFgZ6KnbJm/n5n/Kxg
	zIoXoTJ3cGMb+j2p04GD1tE=
X-Google-Smtp-Source: APXvYqwq8skKdzz203uXbNneNy/gZ429fOE1HtEf516KJubToAEtqthJNpaPfW+4OPp9Pp76dbBwbA==
X-Received: by 2002:adf:b243:: with SMTP id y3mr4653178wra.21.1557180673039;
        Mon, 06 May 2019 15:11:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d4cb:: with SMTP id w11ls759462wrk.7.gmail; Mon, 06 May
 2019 15:11:12 -0700 (PDT)
X-Received: by 2002:a05:6000:10:: with SMTP id h16mr20008846wrx.151.1557180672582;
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557180672; cv=none;
        d=google.com; s=arc-20160816;
        b=UflE0fwm0vs+VK6BdILiMjGYm/cCi6Wz1R/O2aIK6YwgjQhLyo0CoacUpbTWlObFiH
         h5pTXmwu6htNZ8i0VRJZbFS4O6F8aX6amOyL6UTyvqzZoJ2gGTuhLA9uGKKnU8wYbnQj
         6AqKW4z1zm0DxjpwbZRSwUksbSHqEFjqo5/YJVVZQPiz8A+q2x9H6UP/FEM/MBW8opha
         cZRCxb4crPZ184od1Hz0RnM7wPoMtrmts0u0B/accddtID4wpXMSNuAloBQLBK87CdYl
         0VSUGGfjirptyABjImUMi51bKnmi9qmeLae6Cm33M4iE73h+KjJGsOEdYfbFbscLYlpK
         DA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LnFaNp3zWtnbHtL5WzrXowqIS8h663foeKN7I+Jb3H4=;
        b=l3EBAc5a5ZebQPB16T7ENHG4nwHyH9q2QaDyKEqvG2u1B//PcrK9/TLe0mhDnipI5W
         /wI/sn2F2GgQwZydgzQshgZIWiiL/4RF9v30mBTv3ysB6/qopDlpG6X4lb/xPH9J+yNP
         mOj+qMURHhJtzee1SUMcud9G8MHPBx+zs4Iyf1eIMPbHeTUKGYNeb631p1nGd5K8uoIa
         5Hdwk3/hVTDOUWIn4RO3wq0nsjAVAh1x3wN0fLCYGz6zCdIviVZ9f5GUSRuXcePeKoBQ
         gYo1bXGI658a+PterRbP54dKMI5uSEE+oW/MtKtHdGzVO7xImXXpxVPtTU2UZBD5JpOs
         UdBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z11si268827wmf.1.2019.05.06.15.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 15:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44ycQ81MZkzyB8;
	Tue,  7 May 2019 00:11:12 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf@vmexit.de>
Subject: [PATCH v2 4/7] pyjailhouse: implement a helper class ExtendedEnum
Date: Tue,  7 May 2019 00:11:07 +0200
Message-Id: <20190506221110.19495-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.6.220017, AntiVirus-Engine: 5.60.0, AntiVirus-Data: 2019.5.6.5600003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

From: Ralf Ramsauer <ralf@vmexit.de>

Pythons Enums have the restriction that they only allow instances of a
with qualified known values. Unknown values are not supported.

In case of PCI capabilities, there might be IDs that do not have
speaking names. In this case, we should use the raw representation.

This helper class provides similar features to Python's enums, but is
specialised for generating C definiton-like things.

For very easy usage in code, I want this 'Enum'-like type to be directly
accessible via attributes. This is generally no problem, but we need to make a
tiny rain dance in order to support both, python2 and python3. The
with_metaclass decorator can be removed once Python 2 is EOL or we decide to
only support Python3.

Signed-off-by: Ralf Ramsauer <ralf@vmexit.de>
---
 pyjailhouse/extendedenum.py | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 pyjailhouse/extendedenum.py

diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
new file mode 100644
index 00000000..f3dd1bb9
--- /dev/null
+++ b/pyjailhouse/extendedenum.py
@@ -0,0 +1,46 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) OTH Regensburg, 2019
+#
+# Authors:
+#  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+
+# Python 2 and 3 have different ways of handling metaclasses. This decorator
+# is a support layer for both and can be removed once Python 2 is no longer
+# supported.
+def with_metaclass(meta):
+    def decorator(cls):
+        body = vars(cls).copy()
+        body.pop('__dict__', None)
+        body.pop('__weakref__', None)
+        return meta(cls.__name__, cls.__bases__, body)
+    return decorator
+
+
+class ExtendedEnumMeta(type):
+    def __getattr__(cls, key):
+        return cls(cls._ids[key])
+
+
+@with_metaclass(ExtendedEnumMeta)
+class ExtendedEnum:
+    def __init__(self, value):
+        self.value = value
+
+    def __str__(self):
+        for key, value in self._ids.items():
+            if value == self.value:
+                return '%s_%s' % (self.__class__.__name__, key)
+
+        return '0x%x' % self.value
+
+    def __eq__(self, other):
+        if isinstance(other, self.__class__):
+            return self.value == other.value
+        elif isinstance(other, int):
+            return self.value == other
+        return False
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
