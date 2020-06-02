Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVN63H3AKGQEMFUDQFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A61EBDD4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:53 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id a11sf3518646lfk.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107413; cv=pass;
        d=google.com; s=arc-20160816;
        b=UoS0TWZE2aVTpT9YJsycAj8F3njIpSOXUBS19Ga8rFW5qkX518Ej4CufoVsTwzek/U
         6v1AyrqhsNJFi3/zWBtDgJ1o2PzxarSAxuS4UDyLJQa+MCaRovBlp6PZQ8nuYR3EqR4G
         ucagQ2+UH1wWubPX5UxcdkTNLn47AYjv4x/Qq8MrbkRK/6TBBkhoS308yU7WwI+NE8VD
         yd0TzguojWKeaoGzIym+IiJH5h99UMJnEE6uyAqudGBWGlskqB8cjWyFko9J5qhQNEbI
         UgheZsUdvgMNd2OnF+ZD6fX1gCDmkVvcUrcKl+ANe8sy5KR+tD5OOcOvrhN16y5QteEZ
         JEnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=lgIjUAm80sGT9/x62MVRqjosWpIUASwapg3w6lm8gBU=;
        b=zalOXF7GlhcEypgXCNC9Sb41CO7gFPdQdm+eOIFW0DZk29zrm+5HdpO7BpPnD47x1T
         tmvJ3ZiytP4a+ZBcmGew6DxU8B9MWEBQssTGDTFa1SKezEMoNJdRax4qZRrY8PvSNHtP
         e24lKVrU0LJJraNBSStp5ZTW3RcIIyyF4st5Fkq09bNuWIyKF2Z6isyR9/Hlo8tEUyZW
         nFSd6UPVQ9RgSlJ/botGJK+AYn7/eVfNnLezaVBY9iR1/JOundVy96acX5jiEEEyKFt0
         nXTVssHPp6OhcLY5Lp/e7ykr8ZGTV+9/IJ+Sn0FBdUc30jw17A3IF9yo7iudmB4bojbf
         C0Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lgIjUAm80sGT9/x62MVRqjosWpIUASwapg3w6lm8gBU=;
        b=i4pKoaBZY9KnUpXlaQ+FD8x50RwPDIstJe5jTrMaOItR2RivyV+TnncTsRr6Dhvwla
         usGa+cydU7Faa1MMSC5OiFZvbUfJke/Jy+Vg6adNgjvG7qRvEefUNxMU6GCpG1uEzwIJ
         8l8OogH1+pS9tKDluejYsJxBXaIyZCK3U3mbFda52BqDDffXe3pO2pkNaKsBlbnihuTV
         cklRKDifureXrPNuN0mzAwz/CvRONF3EBK5sOvIcQEdiRN6ggeJbrsY5pqPo87EBHKmT
         mCCMzNln0/4m0B0LgMa6rNOYvfVgunwhVge9QQbxVUkfD0wAJkDBoGBSCupt02B7SOZX
         TbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lgIjUAm80sGT9/x62MVRqjosWpIUASwapg3w6lm8gBU=;
        b=o5JUKceNZiG5qUH4Fd8G9qf0TgCLjZr67KB+2BBakdbkce8yACf6C0T69/KGaQdePt
         EXiGp1vdtDz1fVqzyt3h+lXarHoZS6Yj6NvRV4TIT8rv2SNHYxRoQGg5qH68lK9rKvdE
         iLwBPC0g8pd/HVinbr6yzl9NDx32XSl8WTz18rS3+WRpTqr4YUNAo8STeaTHobcgJoF5
         3vqDv3EQ63+eKdmpGOhScG7hjYycnKUmBmJ20/qBsrWJCkMawRDt7Pp3vDaDNQLm7HEh
         RWTNrWhOzxhOgP6csQUGwOmvzs8spMdTVqNkxWXsBOJXXR08zmpUF+SvesDMnmx4dgWq
         BfGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5303kkuQeSckBG5K/dYZ6XSgP+jysZXVQLSFXqrwGIlHFbu6a4nn
	reHTYSQQAWYg6I8nh1eTSVk=
X-Google-Smtp-Source: ABdhPJyREU03SThFiHCSNiHjRiDq5ZWit5jpkVDwczkj8HTnhV8SNXFOylQxaO4X6m++RdIRGZ123Q==
X-Received: by 2002:a2e:a544:: with SMTP id e4mr14221147ljn.264.1591107413547;
        Tue, 02 Jun 2020 07:16:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:92d6:: with SMTP id k22ls1022895ljh.4.gmail; Tue, 02 Jun
 2020 07:16:52 -0700 (PDT)
X-Received: by 2002:a2e:9684:: with SMTP id q4mr13394587lji.431.1591107412776;
        Tue, 02 Jun 2020 07:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107412; cv=none;
        d=google.com; s=arc-20160816;
        b=1Hb0GQ9dwviHdhySWYwWyD0jtrocKzTOWEWlGB9CPyDKlUewn48/UBimBVzmIYMkV7
         b3+Z9pqLWzLix/bxza6mARZ+TKnzGbWXa05tnzB2RRqBCETyON9fbDKyw3mjb59KD8wZ
         pbs604RRzor3/wsSADXh5vMQDVvF5GZFvxh/k0WUNMfHL2Cev0hNI7NkV8gDSjdXrCne
         wnz69QHi3hCaHCz/66qJsMTf9xToT6XLa1h5h54aZKexQQLKCQwXWw/FMVmf7k21ruEs
         0wfyXgQzUp0NU4mX5rdzyMApJ3Hce3MujsmhxUuOYvYph+7uTKH5I0j9rekDQF8oYe5J
         BmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=FtXaJhCPbEhapIj7tLyf5n2yPs66xnT+Mu4KH6Q+uFU=;
        b=I7L0FZ33WPUvU+bd3QRrpXtYs94058L9kr7dAk+irGytTyM2yUSgxf0hTXyU1f60/d
         N7HRTTGGefd2MMkJ0QvECgxJTJWCRu+B8grQq4cIIwbwEbFSsDA128cnmko7oeI8Y/o7
         G4vCeDk6Urzp0ET/RgkznRlXwl86P4tshJE5w4sO1Ea0r/9OByW+eBSRgn9rdj4pngzY
         0RiWBqtWBaEE3lCSouSp2Efozc3Tj+Mq7r9OfLSXiHHP0nHg6dxV4O8A6YLKrX7Gbo+v
         YuS6ioI2W2qB7mLUFYpwCSnz1rdNueRvsNheMUz7O2fHKVh6DQtaThUY2PhEwVpgilT8
         88vg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u23si146384ljg.7.2020.06.02.07.16.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGq9K000790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:52 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdI028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/15] pyjailhouse: config_parser: Add MemRegion overlap helpers
Date: Tue,  2 Jun 2020 16:16:32 +0200
Message-Id: <818fd975706850a640ef20bee12a5d386ec63c29.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add helpers that check if two regions overlap in the physical or virtual
address space. Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index efa7d8af..ccb5aaac 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -84,6 +84,26 @@ class MemRegion:
     def is_comm_region(self):
         return (self.flags & JAILHOUSE_MEM.COMM_REGION) != 0
 
+    def phys_address_in_region(self, address):
+        return address >= self.phys_start and \
+            address < (self.phys_start + self.size)
+
+    def phys_overlaps(self, region):
+        if self.size == 0 or region.size == 0:
+            return False
+        return region.phys_address_in_region(self.phys_start) or \
+            self.phys_address_in_region(region.phys_start)
+
+    def virt_address_in_region(self, address):
+        return address >= self.virt_start and \
+            address < (self.virt_start + self.size)
+
+    def virt_overlaps(self, region):
+        if self.size == 0 or region.size == 0:
+            return False
+        return region.virt_address_in_region(self.virt_start) or \
+            self.virt_address_in_region(region.virt_start)
+
 
 class CacheRegion:
     _REGION_FORMAT = 'IIBxH'
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/818fd975706850a640ef20bee12a5d386ec63c29.1591107398.git.jan.kiszka%40siemens.com.
