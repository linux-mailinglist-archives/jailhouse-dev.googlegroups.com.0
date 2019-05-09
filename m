Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVV2HTAKGQE3XNY5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 2355218E78
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:35 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id t16sf2411216wrq.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420755; cv=pass;
        d=google.com; s=arc-20160816;
        b=CHHBrhb4StrTtza+lhSOkw1JCiwecUPgmA8BnrcSoiLhQHhNARuA0XWavHrnWCUSu1
         TxJW76gmZcoKsacOSz0r5JlIz1xCKZt+e7mKP6HllX8qs8qSpMrqTI6MSOzq9bS9S5g6
         7LGqWwkNtgEtJqll1lD7L8NbDX+Dpjp5IcYNd/R1oO1QBb4ikeLcNYLDEDhcemYtyx47
         sXQ/SlkRxHshQF9LSdRIpN7UP3yWdl28IAa2ByQYrGzBoCR4MNWn0dgAuU2fCrx5FQvC
         5oPzwekQ3rpiOP8KxHB06iEr2Qovdqliw3F2I0blIjtJLDU1HTZTw3SwO2KCJSqUAnDt
         BZcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EF86yWd1uOUepXMrk5bPjCIqcdyf3MbeEmVWHnwjNQA=;
        b=iWP2ruLCGXJBcJqOq4EK4pp6y0FEsK3zJfG3crk9dSlMr2A25/5gRqe7LTB6iNbc8s
         jHSBvS60MdXmf8Pj1Nr2wtMd6Uhn6lzE1W29to0zZn4686dcxSigjKO6FXbNIrD5Em/9
         TJhEZVccYFv4/fYBkmo0HJzKUj/VcbKqdBUnTfjBJBwJdOJcE0MYHVD44AUy5oQEdEJZ
         qWuEOQdgIDm5f1li66UzimqXLv76HhccNxBoj23hhBuFaTbUoPd3/NQz3MUT3LYEdTnq
         U388lmIlA1muRlC9Tc/W8nt4kueqnsMGqoJohkzw2hRG/Wv+T3fAIhwnHezp1ueC0rvR
         rDCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EF86yWd1uOUepXMrk5bPjCIqcdyf3MbeEmVWHnwjNQA=;
        b=sv7YG6lUxr3NUp1ceQDXgpmyyKq4OW0WNumMct9AMn7sYsWVxA/Wi+3YEdK9qJCGwf
         k9uFXTHvL80a+i8Sq3xLpiojhGkTeuLhfi5dvTAZZNGUTHh7nJlSA+tRfA02YenZ/C++
         eFQBr7KFvKuTzjbg3JDdYEWrqsuL7Zm04JIF3bc64ZheTxWnXocHU1630Mo5LZoB3P+3
         Xt4JZt+eQ3iiZGahvu1RE47go5LspZEZEcNU6qWDswOuGZIn2Ybh3SIygaPy8D2PwERq
         3CQhkVW9fOXbO35mHqLgpVpdcjvkquWO8E+gv8KQNHL4Wg2CW17DqPvsItrembFa8H4U
         0xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EF86yWd1uOUepXMrk5bPjCIqcdyf3MbeEmVWHnwjNQA=;
        b=H6lAFYdOG77KUrDtxDfApr3lBfe0egl5NESsbjdwnMZgzJ6cgZ31Eu5NYfnLRFfjWV
         r7CHzn05p6zbHAR2sG73fiRof01dgvlyk2eDziQY5gHxy1fQ6Ow6wJQIDeXLJW1ZexY6
         G6LYG22zLUAfEUdouzCia8oDTjCvVPvDY5P79DvpIDAj75VCoLV725iGMMM03fAexRfA
         U41t27F0Dv0ZZrSfvlhnT6BDDN4cA0VCJbXHZ0Akhm2PRZ0XLDnRTBBT+qPc71ZHxKL6
         8DrfkVIEFDEV9nx7BIkLkoKPsiYOkxO4tCp+Nh+xDIzpmMJ8gPHj3VPXm90eMqzh+5tH
         18kA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAULMKMLovkK2eT9KCNx1FyY96guI8yvoiD+LnAptWCqvamyItzq
	FB6pQSx+qT9yB606MWicj8o=
X-Google-Smtp-Source: APXvYqwxqBrcPX0Q+J/7QA+CQwSNu8/lU9FZ1WRnkUyF0s5YBvsMZA/3IzQyrfpHlH1dki5jHGBzPQ==
X-Received: by 2002:a1c:ca01:: with SMTP id a1mr3914047wmg.30.1557420754898;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b646:: with SMTP id g67ls832461wmf.3.canary-gmail; Thu,
 09 May 2019 09:52:34 -0700 (PDT)
X-Received: by 2002:a1c:f207:: with SMTP id s7mr3788457wmc.137.1557420754428;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420754; cv=none;
        d=google.com; s=arc-20160816;
        b=eRo5eUl3xnj9OH9fkpldOKQW+wH7jS6qwzdlAGH2Rd7HPTFwW/DpkiIuvN/t2EOkK+
         YUiAW71C0DjimamhWpdAaHEqJkk/9SP3EcGpMhVoLIxGNCISneqDWInvp4e9geIEAPiH
         fBFjvWihNg54J95L79QkPlIAph1GTIG/lv0BeufmhToN4/W/Cq+yoiMywAHp0FBRjW3A
         VqGeNPzzavp1ZqmLi+bwobHtdNRQ2nfH00Y/HnwZAJUhWcLrvfnFUARgsDJmZX6UvHD5
         OvIE808WBwHU2buuKtweNhhCjLsGF9aAsmquh7IVQ8uKMgfKfIi+/T3NQ/OZDAh5UACD
         RJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=k0gt4Pc8MSvQkXkNU8SUCV1s8fVNQmF4gjo3UTlnzaM=;
        b=lVUsFsfm/aB+GeeW8GacdPN7OQtxlah2QicefM0uaazYpxm0xxgP9FTWCNwOLA8p82
         HKd5Kj2CXXH0NXIj8NwwuqtFfjwrSlf26AmGWFZKQYGTtJfMyQLLwEZ8CkspQ31A0Fpb
         ezr+/oyXY4XoXcDTHxH6IDYU+cwRHrhewk8k+MHGYST82n2gqmtBaZuIoH52dK7N8hdf
         wCfW2tyfc8tnAJa/zq9zMXdrsokzALyJBbJgCtOPNbPVSlK81uBpZWz7AMShGuN8afTK
         enjCY0eYAbS746hTJGKAQt1uMhxe9t3TON9GUpN4nSGa3ZWbskpc6TCtC6L7rBPuXFEc
         yw/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id 207si761976wmb.2.2019.05.09.09.52.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC56ZX4zyBS;
	Thu,  9 May 2019 18:52:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 4/6] pyjailhouse: implement a helper class ExtendedEnum
Date: Thu,  9 May 2019 18:52:29 +0200
Message-Id: <20190509165231.18572-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
