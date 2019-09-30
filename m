Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C37C262C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:56 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id s25sf185091wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ve5xhlYnFQkQvQ3tIMRcsGpZvMutsw07eLF7KYoIjHOOptrYex4RN4CFjvl18J3/f/
         o3N3C252wHpNrKcWPPwO/Mw6VtUuLp65+nZaAoaA7+C3fkXPO5D3GdDuQrYbg0s+jw0L
         5QftFvAGzd938wzXT0ycOCJfEpcQETokUnoeewEu8SEyl2yWlDpqAQVDHvkLnqZZJmoR
         MZ/Y1v6rJZGp+YWGEuH8Vx1abFgh5CuPLiVhq+IRrYsFVbLf/vROLw12TFkWQdvSaxwv
         E/GmLSIodGktl79CKNmmfIGMMPBFIH/xoRM9N8fGhYMBUjaXXOGhz9cCngkQKVA0++cn
         k3Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=oNilKG4ovuWobfyxCjzbjX311oxLAXHeKDdpzTC0rjM=;
        b=NpHlz75exCmu5NbmbNoQD/S6sINwdj7J5msafVBr0EeyoLDV9hr790C0tc4DVOI8Ae
         vGsicBzL3v6tXORvcLAj+MkeHIu0W/I7OGmXUyzzjk609Io4OnTpOnMr70KcqWqywQlu
         MnT3QC4h06C4mxtWe9nLxMSnDZgKenMGBELnxlrLP8YA1jqy2QIIgeCrGfIrErdnLaoM
         rjyqyLOTHVf2CHqbMo8JC58PNKvxtXpZ2sr2zyEbYphGaBFsw8GguUnkW8Jegm/nALJ3
         PhPhK353EOj24SKWyfBjEnLWlgnvHl69Itw/aTVgpmup6b7cX0YJhs7Vn40vdlbG5DwL
         vuWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="WJVgI/ic";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oNilKG4ovuWobfyxCjzbjX311oxLAXHeKDdpzTC0rjM=;
        b=hYgtU4cecWb9Z+J2TXR64O3NxA8+mZX6P6NYLQewuUzt8kJaxjUk5DDzbG7fmKsBIq
         1Jc2huU5i07DMwX+hqzEG4ADy25CZytUMoWPaZwv7J6DqxUy/tbvgy8DZWXS0Bav/IQs
         al7oRj506sU4QTFIspzkgf8oap+rLhIXv62ldjtubswTSs5Lxx30ubnsLpUir9nB296w
         WJbRtZKm42CASBcuSNjV806quNwvQw9+q+PtQejYgjygeSm9M6AUIHQ7o4WRlf2iew8y
         bCh+JiEjTavxZcoJ0KlCC/qx8sNVzCi8R1Dco3mE0GxH1IFYKUQgYR6Ibc70fUxHvsmL
         uWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oNilKG4ovuWobfyxCjzbjX311oxLAXHeKDdpzTC0rjM=;
        b=FPSaco+eWvk9N2rsGrvTGF1msrlCwPctaESva4U9UgpiWUeNQxDZlZGLD7JCie9Z+S
         97IVpEE384Jl7ia86kZVYvg1stHRa1VIbVQUTBeXFM9BumfRsq9dGX8wLMH3RxX5f/6i
         IqXbeYS5WDzWXljLh0DyARY9vuZ3//NZao4WZ8cRHQQO/v8PMeVjA6v6wP0+RHFSU+3L
         vJkXcIGokqeCo/6th///HxiNEt0rHgR5Sbskn5TFdzjeLCjt40RPoXNJCYw2tx4PDhhA
         f4VsxC+lRbWrmep7iggmFQLGsBBcvFd+n2kTw3lZksEzZnsep7aUScFYgcnxjKWPIhB4
         Dn+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7hsZOPh+YpIlROaH7FzEY2SYkamLSJuOvTOCgHDzQ/Q2IEp1e
	T0k/iclb8JurORr50Rk5xis=
X-Google-Smtp-Source: APXvYqz936HzdzXDTWAKVm5xO+sXs/lN00m3EMlo+HLOsAyo/ulAvBJr8LE6NFeCjt/dRDfB85r5Wg==
X-Received: by 2002:adf:e9ce:: with SMTP id l14mr15404979wrn.264.1569870835709;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6889:: with SMTP id h9ls3358733wru.13.gmail; Mon, 30 Sep
 2019 12:13:55 -0700 (PDT)
X-Received: by 2002:a5d:6451:: with SMTP id d17mr16003470wrw.260.1569870835166;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870835; cv=none;
        d=google.com; s=arc-20160816;
        b=pYKvASYAwVI5xl1q2Lub4S3IPuv5Dl+fo9YvldTGXJGAmv2A0uIn2/1uQw/2d76UVk
         gPj9iqGG+omO8ZT3uRmVMzbW4NqV7PpC5eIx+RxhwoSwg0Ukkon+0iPCNEwPu0Y072xr
         f9nwxTWckfUnOta1IFZCaFg/gXrXbiXLaBYwca9FfsmA3uUmyIVb/NV52F0BrLzs4X8X
         fBOCVzg3IOViqcwNtomYmvcywCakImxAKnSH4tkF77vHDoaSZq5DWn2J53LeTWE+yu5k
         MBuZ3m+a0BXruIX1veEs/DyLvX5S0L7wHXZIazQUuhRhBIooPEDU2C0MVJejJdRNYSbG
         OC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BNrT7q6VzklhHTNSUTwSh8pApjp646o4aEszWWtf4YU=;
        b=RqQNwJ1cbqw59GI43NLEFvV9+OtHSiF48yfmWMa2PASB62YbslaDSjMQpVVkugB2YV
         riGaoRHHlQAn+8a1HwmE/U1/VKaLZmikIiM8xviRDwSq0UtwcN/V9ZF4TlUn+w6UUOS9
         X1YErmICXh471bKmHzIdh6jjeJ7i1RfD7LBuCaXYD/abItamthSJv4QUmxNs0xAGD5qE
         v7QVnA2gN2NoaSpaeoHo9wCOor+zU2rHegnvFx02d14vxojv4ZT5t6DrY4vaEfCFFQ6f
         igUiwO521ucPhxpdLpex7U8U4CTy2tDy26IzyXXcnH9qt0efK55GwJdi2IT3zW+1Lio4
         ly3Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="WJVgI/ic";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id l3si68229wmg.0.2019.09.30.12.13.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk6PJdzy6H
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 06/14] pyjailhouse: sysfs_parser: introduce new class IORegionTree
Date: Mon, 30 Sep 2019 21:13:14 +0200
Message-ID: <20190930191323.32266-7-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="WJVgI/ic";
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

Do this step by step. First of all, let's create a new routine that is able to
parse a line from /proc/iomem or /proc/ioports. Both files share the same
layout, so we can use a common parser.

Passing the destination type of the entry to the parser allows to share code.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index b0a9bf44..a179461d 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -824,6 +824,17 @@ class IOAPIC:
         return (self.iommu << 16) | self.bdf
 
 
+class IORegionTree:
+    @staticmethod
+    def parse_io_line(line, TargetClass):
+        region, type = line.split(' : ', 1)
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
@@ -864,14 +875,6 @@ class IOMemRegionTree:
 
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
@@ -879,7 +882,7 @@ class IOMemRegionTree:
         lastlevel = 0
         lastnode = root
         for line in f:
-            (level, r) = IOMemRegionTree.parse_iomem_line(line)
+            level, r = IORegionTree.parse_io_line(line, MemRegion)
             t = IOMemRegionTree(r, level)
             if (t.level > lastlevel):
                 t.parent = lastnode
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-7-andrej.utz%40st.oth-regensburg.de.
