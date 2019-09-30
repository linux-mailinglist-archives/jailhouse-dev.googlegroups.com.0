Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB5FHZHWAKGQEN34PSXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EB8C2631
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:57 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id p18sf3405291ljn.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870836; cv=pass;
        d=google.com; s=arc-20160816;
        b=f1IKoM3KbULLNsVTxYmlyS7Cam+AOG5NlpZA2ACzdEs40easLfnQ2ryKOWdaG1tI7i
         w9Z3iWlaiKDk+dMRHHDBcHkPZ4HnOqQcJ9ORZjt1zrj+PppGgVGp0KnvZ6JTXJawqmJ3
         eIBQbzizFZmAvKI3RyBfO1jMlPG+17hXvO/O5zg9m7QrtOXeE2jVyA5Q3Klshy+N8cf8
         +S/cvjB5EyW10MuAAZwEDN5yFUG1884vIEST1i8YNrhr6pW3+UQCEVMNZKaDt5Eum+Ec
         9d7u87mfM8P0EYhM1QCaPpGWVy6JnSDqBKbKHmQz9KQNqlJUnrB2Ep1F7qLPdFAIzLuV
         ZEqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=U+pXlBN32uefQBQ37x94nP6y1sL52lvvhM2CpMKSdjE=;
        b=yxdTu9/lcyT1bA/ASCSjosVbYKtrSz4m8Bw9TWhC5+qX1gk2QAIL5AZse9rAHlA9vW
         9OyFil4VrrPfdOictDf8ZJrubBZx+9NJoMM4XBWi58jKEH+HrefxJBpDs1lWILj0yAbW
         NL265pxreQoPJBE7DV3Lg1k0dNtyln3rGV8e90MY8y9A2B0fU3Fd4vt44mEL+zN/aCBz
         d/K4e1K6TSy7sDOsjORYz5m2XECzGusNVUW7acAv2WhLLMYpEda44aQz0thI3J94LQVh
         firx4nJTWaDEW77Ifr21z00WkhfZcvmnPaIGeaYZTqfvpwaNBU7EgmBy3rozWjpHnzH+
         VkyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UA9Q2fT+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U+pXlBN32uefQBQ37x94nP6y1sL52lvvhM2CpMKSdjE=;
        b=BnlUKd8V92lY+6vOCcAK+WOWLDzlEJahmPXkfcwVrtQW0kRr06xAn6WiimGd/CS2S3
         St/O5KRiGTb65tOVl++bnqy4bw5ixvQoF9D7ppQdYooympAtntk2v1/cxlOwD1xFQwdO
         RL/hBj8Zw3zKpqW20NzkuS5Q/GysziI5bpm73Y3pwz+B0plrsQnPVZwK2y/rl2A06um1
         S6nkH1qgjs1tOqwX6N1EMriIjJThCaCeqwXOYhStyo8MlwPPT1WFthrRVJacTC0j1I8Z
         kLp9Xw8riqO6BY1k/NlxtgynwSrcGE7OeVF0gNZ3QJJ549dXakIlC/HXyr5Gq3GsQPiZ
         DpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U+pXlBN32uefQBQ37x94nP6y1sL52lvvhM2CpMKSdjE=;
        b=dvqMPCGOZCQE264AkWMSVRH4m24MInp4HfEtsjTQEKN8IqXNP0FNgK/++gqw6OaPaZ
         U3jkC5yiGqsawBNue6TPkc/DAh851kGB0NC1DHhb7EvQlYDiZ9L2nqszdXw/dxu0XgIw
         bnxDWL08f4XiQnaFnH/N0LLOm8/jMXh3a8OkN3AD5FZxHUd3lbVVFf3rznGkl2e+0pBk
         GfLJeMFG5imn8q/C1YAuk2Ua4fmuaAAmaxulna7wLdRKFPs/Il3SVri7DdE+JO1to68a
         6CYt+kPopfPNmOG1cuJadNSSz10CAtSURESUSpZ5K+dSq04+4Yhlp7dVC4m5kuVm5HfR
         X71g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpVt/gbMVMGY71f1k4MjtI9eTJqNUPy3jecGiOAPnxeGWFscJ1
	eNng7+1jo4fRkRQ6MqaHSro=
X-Google-Smtp-Source: APXvYqzp75F/SUnSEHvuzAa9L4lWwPDLu03y7ItJdvgSASR7tgz/2oqRfxxiFz8K5jkOS6r6HH1Jxw==
X-Received: by 2002:a19:a408:: with SMTP id q8mr11857593lfc.94.1569870836798;
        Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7d02:: with SMTP id y2ls1654275ljc.8.gmail; Mon, 30 Sep
 2019 12:13:56 -0700 (PDT)
X-Received: by 2002:a2e:8857:: with SMTP id z23mr12846351ljj.19.1569870836104;
        Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870836; cv=none;
        d=google.com; s=arc-20160816;
        b=0b/oWs82+l4zQPZp7TLSoLX+Tzab4qbQF0zPLQeo3XK9TFkVEXBfcAvUdyF/bHtWr3
         p9ghdjEruuX/ZkQkKEl9IQTtKyQz+cZ1o6bRR+zjIS0N5E/hy+S4br3o1y0CFM1YY6qH
         hfvsIqHRMAZvhxmJ4Wd/eAy1vsyhC0ym7zD9DKSs6/2rfGv4lROrX+6uWwcKs3X0BAyX
         mS2ZvWOXTIb7dfoA0yiuXn7BiZidnqFhTeH4kwWTGymuOFwIZ5ZUKzTOctGzIOCe4i0F
         JSsMaz7rqCXlMDd+pWtUaeW1jLCKai2tDQMaYSFABVKxRgr6ANolrVppV44uyQDmpv0O
         U0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ofqnke6ldRI6Qirg+OfyjgeIP6IiIIoj3r4/VbTLkQE=;
        b=EecLnqKMqbFcubwSMGH/u49Fwoa+SnHTPlQlQn/hd69D5Jo36Hu/eiJDBKKvEc+otp
         sVHC3iicbYMbUqXzi2tznyk4Z/UoV/lcXOsw399OC8gEXUhn7M1Kt8RAbMcrbc/A1oW5
         qP7C+3HmLNp3mhPa9SNDmXFRGwKJDSwYWSvXMj/6x2JkWmP8ABwuwianne8j4S5uQ+ul
         kBiwpCfh9ravOSbGnL5IjQlpCE1Sl6AQh/TdXVcY/Bg+kuYAsKQoUeGq19NtszTz+pjL
         snERRjmhdZ5zx464l8kXfEOzXPjFglY+yHbqV2vb7cQzxGTRU2xLVojVE26u+wcAxXt7
         wffA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UA9Q2fT+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id y6si755382lji.0.2019.09.30.12.13.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46hsWl1P72zyCg
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:55 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 08/14] pyjailhouse: sysfs_parser: make regions_split_by_kernel static
Date: Mon, 30 Sep 2019 21:13:16 +0200
Message-ID: <20190930191323.32266-9-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=UA9Q2fT+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

No need to access our own tree, make this method static. This allows us to
fully seperate IORegionTree from IOMemRegionTree soon.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index b72be367..cbd6069d 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -868,14 +868,15 @@ class IOMemRegionTree:
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
@@ -937,8 +938,8 @@ class IOMemRegionTree:
             # System RAM on the first level will be added completely,
             # if they don't contain the kernel itself, if they do,
             # we split them
-            if (tree.level == 1 and s == 'System RAM'):
-                regions.extend(tree.regions_split_by_kernel())
+            if tree.level == 1 and s == 'System RAM':
+                regions.extend(IOMemRegionTree.regions_split_by_kernel(tree))
                 continue
 
             # blacklisted on all levels, covers both APIC and IOAPIC
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-9-andrej.utz%40st.oth-regensburg.de.
