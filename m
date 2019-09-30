Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE1C262D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:56 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id h6sf4911089wrh.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=bemIesI3k8tb82koyFg6uz9thhBgmhsL4g6in/8+9loQ82+oGv2DyG0U6Qc5PgJnGo
         dGQvgqB6CNYOoVEigkDc+u2IrogLvW9adKNI0hbf/f1p6d4XPdv6CenmSQ1sYbrXR6eQ
         cyQ3zPLLYgU/ybGhp70EpBE3r4CE0s0K6MF65kjOeGRxp9//eyO22sx0RiTc+hD5tUfY
         H3Tpo+RhAJBQY+QJej2tiQYQ+T1sAsxzUraMGT0vz6/BabNi/WmMrx3RB4fgGUrD41Zc
         lDQ82KWOFdrrFGVu/U/PrPlP9JwU51zhMfPizQL2v0n/EXIJdAlsEk5FccJrgTrimUG1
         QK1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/idiZ1icjK6HNqMh6nJN+1Bm9JrGwY5m/ZKdWXhsMUY=;
        b=Og5QvMNmlTu3lUKxYdtiPsLiZECaiJy58fonpGZavJmnv8eIsFi7o9gdDmKHnslEoR
         ZbgmFEa9Y0IljB2y+8UnEhn1dqWoJyQJm9S7hsbTTe54ThmAMn6xM1Ez87ztYWleS8dL
         OMojowsLi4K+oMGSa3hGsqfJWqoy6u5Jqp13Y1mYbm6XBMHF1sniAIzFERz+0ywFAFro
         tLgFABJuduFmfG9Mah1kq+Yh0v8IhEGY95PIXKdeOv1CCrDFMgXSBGjTGK2+zy+srmkj
         MQICI9X8dLgZY9kmBA50kD4Q3rfFqSUpjiGo2mYAe1wQgbcUGmuRwu5ReFPCjCdx+4b6
         ZyeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=lrrvTliu;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/idiZ1icjK6HNqMh6nJN+1Bm9JrGwY5m/ZKdWXhsMUY=;
        b=RcwjxO2TZ4JIkS9Xzmqg57PW1uZkcAu0H3FguetzGE8+hSuzZajOUgoyAxkiuxBnZ6
         WmCzq5kCMiUy0IBuQogklv9bgoG1YHbwiv4Sl/Dg+UF6/Z//zDBIKcCpe6M7blxN3eNt
         zPTqRXsgGmOoELprJfy5fywJQ96bhrT/giETMULqrO0FCvHliRAMGP9Y3ZpSPhX8jXlH
         h8X6/t+0vBtlQ2zf03QABy9VhBfe1MDW1lbDb8yoIxooAmEmt/Zs6vIsE9jdRzEyL1Vi
         Qu/JUoXhcoB/B0/dCUBwn+XUIOmV0PauCq39+BRiF3Y3HE1DYHVBwvcCRAE0dcTghJHh
         5rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/idiZ1icjK6HNqMh6nJN+1Bm9JrGwY5m/ZKdWXhsMUY=;
        b=smChf5ySo1GbQmDxlKnAe685KTORqYkVyVhYMOizruCDPaZOkgIQFqAF99mtbTpvLo
         FAJ3onzNU/IWMw5y5DsNPQvWiqL1is15SaLsFwAi9w7w72ONW8XL658Mam67BZMvBJKW
         u12iH5VLWQKM7+tTpYn6Y4iBul/5TfBKoN4mmXi+PcUSft7THkV9/6xWw2iSWPXEhFOe
         9Rq8y9xRfvLY2Ert+64soYIW3xKkwO9MJJGnclfPykndB4hgFSjizz2kjjxPbwbMgLfy
         EoWSFafFxzuvt+Qdnuo1VAtMvcG/U1pSFdZnxaw0LGZqZyAROwCLn+15BOptSAAzr83U
         bw8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWucjpxvLF0xsxEsdSH66x9kkGHt4Nj3aDK4JEIjo8E8gPp9xX4
	1JvNCAA5lPlWjlgQGxipsVc=
X-Google-Smtp-Source: APXvYqwctS0MQj/EOiPL0EWSuz0/2dypGtd2DXWSs9LgDnr4yP+TWCzqq4D4GN3Y5idE7c+0OS/eMA==
X-Received: by 2002:adf:ce83:: with SMTP id r3mr15918489wrn.219.1569870835858;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls171825wme.1.gmail; Mon, 30 Sep
 2019 12:13:55 -0700 (PDT)
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr575830wmi.39.1569870835283;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870835; cv=none;
        d=google.com; s=arc-20160816;
        b=vh2EdYqb0qvJ3Ssox1qbRDaNtaeQUgqJh6Vn6gRnrQjTJ/FCfBegUqBi0N7HAUCqpb
         /vInO6cBvRmemiyUkG/TS7TvcAqB4BntjbfznkVLoUxl9sdzXXVZ2XMQJO7Fd2kn9OEZ
         IWhGUq/9OvUVSYWqRpZchtRuaUOaCd+vjpdEmN5ec5kehv0wSJhmnvDBjTOUKAVADjVF
         bRME+uZlll0F285gF7gxXaxmdcP43044nY+GwlxM/EB22jo74m0jfa+IvPc61xqFcmCz
         xi+xwnaHLNe027ml9WFh8swNaDhoCFzihlHB8gRZc5i4XhEBlcWqFZlzhN63v/kTYugt
         y+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OumNSRZackC9wXimOmBwdeToM+5CpNaVIOs5+WGbpwo=;
        b=db8g7tNjBBTzp03xyDQQSbA7nxEwIJLoyaK0AqfrJPvBFboFXbWSt0E/xdWuHW1V5P
         DQfxD4ahJzAZaWpGq3JtGczcg8vsNeygTkfPJbQWNVAT4h3KBiPNFRfBzjuVMf9lCmEW
         qrMvRTX7tLRRR0lrsDMqooEZl5dnM3VAY1BbPz/vg7hDMTSJAe3XDevFGKcCC5qG2RoM
         4pzk5GUJzTEfeo40sZnilIUU/O6W7A9+3/SI+RyBJVCuQgM9H02/INeo+mPZKSX91poB
         D2QutHTFZcmG3UpfuNTYG4qOmkq2zScIluSNVkLkagSXwv2zuxFBoCzFECqbXIp2SD0O
         vSdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=lrrvTliu;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id m1si766455wrs.0.2019.09.30.12.13.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hsWl03bXzy6m
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:55 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 07/14] pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
Date: Mon, 30 Sep 2019 21:13:15 +0200
Message-ID: <20190930191323.32266-8-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=lrrvTliu;
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

Move the next part to the new class: the whole file parser.

For the moment, this leaves an ugly one-liner in parse_iomem_file, but let's
keep it for the moment -- we'll clean that up later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 50 ++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index a179461d..b72be367 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -834,6 +834,32 @@ class IORegionTree:
 
         return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
 
+    @staticmethod
+    def parse_io_file(filename, TargetClass):
+        root = IOMemRegionTree(None, 0)
+        f = input_open(filename)
+        lastlevel = 0
+        lastnode = root
+        for line in f:
+            level, r = IORegionTree.parse_io_line(line, TargetClass)
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
@@ -877,29 +903,7 @@ class IOMemRegionTree:
 
     @staticmethod
     def parse_iomem_file():
-        root = IOMemRegionTree(None, 0)
-        f = input_open('/proc/iomem')
-        lastlevel = 0
-        lastnode = root
-        for line in f:
-            level, r = IORegionTree.parse_io_line(line, MemRegion)
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-8-andrej.utz%40st.oth-regensburg.de.
