Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2FTZHWAKGQEBPJUFDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id C9399C2644
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:39:20 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id c23sf7017045edb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:39:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872360; cv=pass;
        d=google.com; s=arc-20160816;
        b=0P8/XlR1gR81iWovwGVTYBHjO2M/ZHN6+WPRb/fo0x0iutRu0uHKw8kQXzwUqkXP7p
         pgmLLk2D0iliIWKWP4Fx7CGY+tmr+1+WhZ8jTllmvdvP8kqAik4HCCP8CtLqJsw/ZR81
         xKtNbvAw/KisJvSvbgbVVyTSJPL43xn5HQIZQEN11J+D4r2cwAnQ1f+oVg4p2OPjVPau
         +9sbYoImEJnTEMP0mlIZo0EnHRA8X7rvmxWus1BkCfIUtvebZI2ZAj/4vhKh0IlTYSEM
         SnUptSreh8X9gNJop573SscSXE5Gccz7z08sq2O1Qzhwt25VwWq97sXv6jmSCUca5czc
         D5dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=C+WUwUnu+Kb7Fe3sIXMZr/bR0915QXivAdE6HREb5UE=;
        b=xV0gbRqTvPbwvxLLv1K+QvP9maHrmSXjtnkK+970GRMODmJ2BR772Z4wENTr3KPwsa
         A/9Md05Rd9f9Pmzt3zQZGTzb5OMOm4//S7n5L+WRnVE5g8GfEO6nqBVBaYmZpiZatRlo
         qThUEq6P+aJt2RW967KDjnixsoNIOsb9XRcQ9Ih4zS1pJqF7iu4vpbG0jjFlLkc4QMna
         NPkYKygtySqN76sQ4QZ6BcElfd0LbEMeJMkbH1Af92YQ7nLNLBfgs2VZCP1Iahpb8D3R
         iaTWbWK984J9RCfxla9X2vh9Wo8yZdmBP8+TerJGUgSCmL75OgxvvSy1IHrwoLV3PvRB
         QRtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZY6D8dTN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C+WUwUnu+Kb7Fe3sIXMZr/bR0915QXivAdE6HREb5UE=;
        b=jCS1ng4VWy9bfe2AYLer3BWVjyKVjdfvoRvaAiHPdEOnpan8B7tYLq1j9aNDQHdsrt
         D7QBs0qQ3Fos1JTpRaHDzGktX0Rmy4xoEob0qUFHaOOVY41tbyXAbC1ZiDUCj6dReS7d
         +fI2xbZDtm71z0E1R8+UPr2oSyNyQOLHAkBR0M64fQY/L6FK3vJ6asovbmIh/qVs5ZIs
         K3vkXDpCL5gemlJPZ7mw9aXVAwaHfv3kFdbKwZkAkvnWjPq2g8STbAVdMqkJFX9puHpR
         cUl/35GuY8AZDq7z287VhYQiUOX0gqqF5IeSaox/znLIIbPWreK+grz6dM+dd2afj6pG
         VuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=C+WUwUnu+Kb7Fe3sIXMZr/bR0915QXivAdE6HREb5UE=;
        b=mTpNZ79gpVjPPxpvf4BR0miiOzlsiUcM4YnMLociRTxk/YHh0L2LMTTXpgKvt6h+nH
         UwEaPgiB20MwADyyelK35FBqsLFuCFpJGAcPmMbWb6r6TI3o872da1dJFT7eWNHLHDPH
         hvoQLsTE15v602RWX4cDlYuikCpLcd6XL+CQ0EMeGJZJj8RcQ0j4WJXVYD/aOWzAcqyi
         vx2JDLb1Lgo0+n5jm9caf5jRbwy0eUzdht7zQ//G3WUKBrjWr7CKMI99yvdr6ct9pSYL
         ZNjEyWIPcaUO/UFR6hVzF8d1GdsmazUA/A3gkg9O48RcBP3f9QUuqPDIw8RYuQfrlO2Y
         pC5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzwylRH9Jf33OiKE52nswQo6HCdwnY3pAnuzeTx07rdyv2GBzG
	6wT6LZ13RfwBI3oqNWKlt5U=
X-Google-Smtp-Source: APXvYqzai2fa7CNEQYbviMpR5fgyqSSdMeZuLZqGr5juXlppXRiRmbO9uGlGuoTLxmlT5mOIrGMn2w==
X-Received: by 2002:a17:906:c721:: with SMTP id fj1mr20480397ejb.177.1569872360499;
        Mon, 30 Sep 2019 12:39:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:1114:: with SMTP id qu20ls3103538ejb.7.gmail; Mon,
 30 Sep 2019 12:39:20 -0700 (PDT)
X-Received: by 2002:a17:906:82c1:: with SMTP id a1mr21234395ejy.187.1569872360000;
        Mon, 30 Sep 2019 12:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872359; cv=none;
        d=google.com; s=arc-20160816;
        b=gpJckevjDb80VDDsbwlRJ2a8se4Mf38j9r6cG+9pDSgTdVv+jpWibrnBtaXQoC0BdB
         Ra/5EeAwEdMyExJY74nd844aOKgkVyS//hMQZmopWOt/5EWZT1SDa64tf4dWABRnqXzK
         o15b6sAZrYAZ8f8pHSZIMWFJNYagmQahmoOPvEZm37EQ5x/U9tgPd2XJjmyRusJXcHGD
         jc4UC8ajnF4gpL86fzP4BR4T6beFMrLSUX71Z7HTOD5/PjafChUtiPC44hHpxTSgX8Do
         5B6ICNdBrc5tlydEBBL1ldvwQ52czkJ0ZGfSHAL3qImyNQgVZwP0s5sdfENa6MNamlzD
         /pfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zsMVWRXrCeahfLRRcJKiSGp8LR8qVgqAcKOgQ7KWrS8=;
        b=S6ezzZE1+tLt/d8BNDIW+XZl+OrnnHppxxQtysEmM4wqDQsTusG1yoeZP6WEHmDA2B
         izyYje0qk5c1QBtTvjebTh0cfyGzJ2qmoHQKmux6Ozg1eOOv+yF3hCqW0Wulh6hUs5qr
         Ki68PJO5WN2ScZxELwyX4sLVDg27Cblz+fvZ6neL1ayJPsB/OHxZVLS5RBgdlCshe92O
         TvYW6zROYj/AwdgH4zesIlz8EF65LK2YyeU7Owdvoddj8NPemxjVMnR0br++c1FJLpby
         FLlD/3xEiH1Dhh1gcieWVhCCIx1UwnD+yPJWADMomSGBO5GI22RdK3HuZgRbZUr468H5
         XP/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZY6D8dTN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id d14si692156edb.4.2019.09.30.12.39.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46ht534V8xzy2f
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:39:19 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:39:19 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 11/14] pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree
Date: Mon, 30 Sep 2019 21:38:54 +0200
Message-ID: <20190930193857.2866-3-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZY6D8dTN;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

We will reuse that function, move it to IORegionTree.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 42 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index d2b36876..3027f82e 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -831,6 +831,23 @@ class IORegionTree:
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
         region, type = line.split(' : ', 1)
@@ -902,25 +919,6 @@ class IOMemRegionTree:
 
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
@@ -944,10 +942,8 @@ class IOMemRegionTree:
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193857.2866-3-andrej.utz%40st.oth-regensburg.de.
