Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBZFTZHWAKGQECDUPUDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 22678C2642
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:39:17 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id s3sf7022750edr.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:39:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872356; cv=pass;
        d=google.com; s=arc-20160816;
        b=PtwaIlLri94hg4e3OHGldPVqTJUcFHcH3A+UqnlElnhJmT79IyAWtx/F0vLdgQ3XXJ
         hvWT4mwtht8E6le2bE2CftuX8p/twgViZiR5bOqIp+c/Xyg8mVouGqRTN+SMtNR5lhII
         P4BWL4LyFTNnvGR93Xh35LHF3GvCe7Rbvr7o/brHc6l2iHvTF/Y+6JZtzsq6jqYaV1s5
         OXsDttSKJ/hqegdohR0l9dStCA97xXvqYclyrTV/0lnqhIkUDbVHezPlsreVB9B3Q+Jz
         FA2A2EjCKvUJy9smZXrruNw1VqRzXdtbcgHcrZQ3zBJuibHbK4PdPhQJ3ghUgYpLdS7w
         a8oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=WdQ0tagwOb2svQfRXrXi4vU5NbNo6T5ab4lg2WNt8m0=;
        b=Y7ompxRklTW1BfQlwUISYiYqqGNbuc2Z4icBej+Y97UDpWrg9R8V4/pxWRcY+hyftc
         fz0mvW6cs3lAyrZL8g/6DtUOaBUstNg3DG/nU/Tum4GrlpRNjhKD06pDqZll87RNGeUM
         0NO7SUf2Jt0rdufhHt39RLYso9Dsik8gUezd7tovCPVKVAqPWA12tJ19wKaQiIG2PuEn
         zA5SpZl3hPPoWkStQNEzaehHFbefPclRdjkJw2tusgJYgct63tvE1M59lCagFWw4BLwI
         Gq7gFN2HEfNWdAygXgfsMDvk+ljvGOKyamDmH1uz5opvaozinpTGyIOdQdAhEKS8vxRE
         9qkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mkV6CnzR;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WdQ0tagwOb2svQfRXrXi4vU5NbNo6T5ab4lg2WNt8m0=;
        b=NBf226mmE/MyrKt7Uq87M0i6yQ4DPFyZmNE6lYzbavvw0RTfZ8vmH2pXtf9AWOh0Nk
         8QNlGOsVVIV3y6+Y83xo4zu+pD/LMsCCXvtPux9tqJQjWqwcLk1gvACwSLNfoOAYhZp5
         4MWm+EUpjlyjaC9P8bWrGFaoXibQyB0cRrQHH7w3W4jlOqyvIATGjaiqNV/G0fwUJvlC
         /0nY1CibfBlgIVoTd/L/+HCAgoQ2N55naZDmacv380b5OTE0pMj1l+okva1GktplOK+n
         nAvAhFvVUKBpHnTnycv2gO2NUXEp5n3wbFVU77Dge8u2zWCyN8Kay6GApSfvbQYmiOT1
         2Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WdQ0tagwOb2svQfRXrXi4vU5NbNo6T5ab4lg2WNt8m0=;
        b=gDPJDB2qQrxzjK1OEMWoT5HfAyRINDyF4pjtMVBS1U+wQnoG6XKYOLhsaBiwRdfbaY
         pXCxy+Yv/g/AXxTuMz4K5I4PSOtfqUV7JT3BQtYC0DvcVtl+o7xWh3vBBl26/rkU1BKd
         yvUNbg04Y5e1+R6yt68eBOVbW4vN5QLs4eBYCOoloJ5BrortJlhSsvE1F08fj5e25FJU
         oWNSG3onVUkhk8KXapZMJHMkySW9K1LkIui4XUmUDmez2dAbXr6NSUdxv4r4Su+Fk9B+
         0DZv3dYQbHyl4kEba6Vi2Uags5AzM4nVT71OXDoKpVw/bgG0kL+jBUNxCD30GDIOzfRb
         b1xA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIDKAUPZdtj//Un5LrbTj0jlbeijmYouq0YGbvqjt0XMORqaUp
	XPrEe/rKrFHnjZoz7el9WiU=
X-Google-Smtp-Source: APXvYqwY3Pe8jNU2bB/K7zS7NAMhcgKqLcpIJhQ8XAflaihexzFVscLeKrPuwQwF4kHBSj1D8elfvA==
X-Received: by 2002:a50:bb22:: with SMTP id y31mr22271006ede.58.1569872356861;
        Mon, 30 Sep 2019 12:39:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:4420:: with SMTP id om24ls3099774ejb.2.gmail; Mon,
 30 Sep 2019 12:39:16 -0700 (PDT)
X-Received: by 2002:a17:906:1a08:: with SMTP id i8mr21096592ejf.231.1569872356174;
        Mon, 30 Sep 2019 12:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872356; cv=none;
        d=google.com; s=arc-20160816;
        b=G0Pxjeqqn/9eSGsH5pXLhYrA4vvpHoaaz37y4y2lKavMZcXWvUlA4ft2Lx2QbifmLk
         TOm8jKNHPuNSpY7tSjFfUUChbTo/js/dbol/K4VM56px8V1kQUQKwNapKXaLo4qpFa0+
         gRaLBWqzAKhumN203XuYyFodVBe3DbJFXnmjmCnyh0EzAX1Gl1EIwLLpsvSzp/W4cAB7
         H30XX1bVcBDpYkeU4VzH/0dhNmPjujd4lWYkKALXy03vkaGDwgUnAQWm5SOmeaRxJwFF
         h6EjkBCPJO7LXogG0P0KkQ68myMeLN7ymKSYuO4wlgmBLpq4dwDgyoc8WnwMvyToSq/p
         G0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=o9cgG3yTuISggHjXLpKkq2wDKoKH2Ngd0PU3KA2ZQvA=;
        b=wMbt2A8PeXBcrcow5Wn/5GRJwh0fz1hDvcFkKnSb7u/AnDUI0OjX74UnZyWugqTu+h
         DVJqWS6jn3EgBlXY6CCL6fkcfTtGITKZkfun2X8QZv4Q111eZDxUtVJHoJ5aIOE9IW1O
         mDfE0TR7tz/65/qD5zIgIrrjU9lhylKscHbS4r5Is5QquD4ZVNx9EpOa1cQJI43DeADK
         ANfmc2FxGEo2sKJEhEAZfg1931ddsPT4b26gW37aJ263dxgoCKJI/h2Evj5PSmwetpuD
         wuPEiBg8WE1eSp94hXcA1jjq5nFTcqozM8W6Q6NQkpw/zZJ696on9FTPQJfkCxEwGns1
         iJWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mkV6CnzR;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id d27si958389ejt.1.2019.09.30.12.39.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46ht4z5VkSzy2f
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:39:15 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:39:15 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 09/14] pyjailhouse: sysfs_parser: entirely separate IO parsers
Date: Mon, 30 Sep 2019 21:38:52 +0200
Message-ID: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mkV6CnzR;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Everything is in place, we can separate IOMemRegionTree from IORegionTree.
Let's give IORegionTree its own constructor.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index cbd6069d..50ca62fc 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -825,6 +825,12 @@ class IOAPIC:
 
 
 class IORegionTree:
+    def __init__(self, region, level):
+        self.region = region
+        self.level = level
+        self.parent = None
+        self.children = []
+
     @staticmethod
     def parse_io_line(line, TargetClass):
         region, type = line.split(' : ', 1)
@@ -836,13 +842,13 @@ class IORegionTree:
 
     @staticmethod
     def parse_io_file(filename, TargetClass):
-        root = IOMemRegionTree(None, 0)
+        root = IORegionTree(None, 0)
         f = input_open(filename)
         lastlevel = 0
         lastnode = root
         for line in f:
             level, r = IORegionTree.parse_io_line(line, TargetClass)
-            t = IOMemRegionTree(r, level)
+            t = IORegionTree(r, level)
             if t.level > lastlevel:
                 t.parent = lastnode
             if t.level == lastlevel:
@@ -862,12 +868,6 @@ class IORegionTree:
 
 
 class IOMemRegionTree:
-    def __init__(self, region, level):
-        self.region = region
-        self.level = level
-        self.parent = None
-        self.children = []
-
     @staticmethod
     def regions_split_by_kernel(tree):
         kernel = [x for x in tree.children if
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193857.2866-1-andrej.utz%40st.oth-regensburg.de.
