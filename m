Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBZ5TZHWAKGQEDHODCTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D735CC2643
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:39:19 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id c13sf2360761lfk.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:39:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872359; cv=pass;
        d=google.com; s=arc-20160816;
        b=Cr5dBG4UKmcayjd6SmX37MsWzxHHr/zbL+tsd1boSYbQZugiUFbsHKABT4Z5ESlnaG
         zUgmseJMNy8UR32NnK5gOHlOsGyeL4YO5/VKTjZ82PTHSNvSRBuERd5NmZL15e06HmN+
         P2SuKAL6/U/CBxSNg5bJ6iJXfzCujrjzv2FNhbVbi50zKACS3ZJypnlNyMAynZRDds3n
         nV/m0o7/vShmkbBqz+P7jAdPPNJWNlOLbDNd+Ya3oqSd6kvOzJ1ciqTKxKbXhdbcHp7h
         ntU1BNT4s4OiH4A/2Co8v6jtXtiEbKAc+94syyzXenEFa3vcJu2xlGGaD6A7rDCp4ioR
         2y4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pEDVSc/JSu5mULEkrljuzApeYYip/GXcggg2eqGBcAg=;
        b=ejaZuLNgq0Fw3mg7eNe/hcFyzsBBB8IToAfT4sfpdRNt8mUl49S2MFlAw2kNvxhhum
         OKIruPt9klHKIAfMw9XCdTtBbwGMPrYAGES7Lklgy5QRwn5bb+sCnGEne09Kzcsdshbf
         4/iOUySq2X1n/DJgU+W/N6HGUlboCeVah/+8TCDqFSPxEwtgAY+JOAFrDGmrCm56lpvO
         9A80t+HvItuQpJa1utFwzVmhj5sO941hVkKWXHWsAZxHuZxvasrIEDlU5CuOhSDafkJt
         OGlq60ZNxje4bWgAK9D5V48n76aXb4qF4jFa2wTOB+VGM6ouGH9TG3U/D/q5hAx7JtS3
         EwRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HSuBmA+t;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pEDVSc/JSu5mULEkrljuzApeYYip/GXcggg2eqGBcAg=;
        b=MnphmxKJCxNtDr/gARQOpH00e8IaQAOmDByxl+f5H9MUVg36w8Z95Gkh6xXZm3zdsN
         AzokMucVZj9CiFdGl6hfAXEy0I+q4e9TASu9ioG0P+iTsUnqTFLu/sJ+auhHPV2x/2iQ
         N18AdVi87Q03cgF6czTV60G48hFKXAfmKuTVSjVMAkgAfC3YSSDYSp8ly0qluuFOKwhV
         Lc7WJ9k+hHgCHptDjlS86yFswG3v1tdsDABwIQyg/Cm72w/O4Nt+phh/hjzDYvGIeK1/
         QPbm7e9ua9zDeWeHPsY4lY6Lco4yeFGPoeai54e/XLg9ZpwxaC9jds1p6FUhItuTP+xF
         Upaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pEDVSc/JSu5mULEkrljuzApeYYip/GXcggg2eqGBcAg=;
        b=ZUFbW3ooqUjeyvL+C9Zfv+uJkd44OZ8EeNg8E1l41e2BJmUPTD6PiFSNb5HJIYjPgT
         7A1KbADsMZ4pToEQ3gG3WiPP+tsgcLryrzKUckidF5SbO1uR4nXpgUH1ZQK/PRhpnI6b
         b2+fIM0URqyHkuCcefbZ/kBaaDLTMzy+Jc7civM5r1gwLSmCgwmY3ia6TBXVhQwd6K26
         UOGLFGbZjpwz8bUvfgBTPua8RJjX34+UZR+z7FJBA9HeNVcb1niMIJjVljNGOi2BUSVB
         DclAHacAYhzgnu4UVfY/AokmR4VLfoWzVxkLFQkTT42Bpk30/DvuqQOalxf0fh7OGKe2
         tDMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVoISfc2TQ8JgpvjW0nYynP4EJ81vGa2nftuv51ZQy7Q+4IZcm0
	SmnNlexb309vFKMoKDhG1Wc=
X-Google-Smtp-Source: APXvYqwualSgouaS9PoS3msNVZv08njCXpLoPY0FXc92NrQ0Rlt7SraJxzH240Lp+99tqRKYUKyY/w==
X-Received: by 2002:a19:14f:: with SMTP id 76mr12042463lfb.92.1569872359435;
        Mon, 30 Sep 2019 12:39:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c396:: with SMTP id t144ls1251617lff.8.gmail; Mon, 30
 Sep 2019 12:39:18 -0700 (PDT)
X-Received: by 2002:a19:ee02:: with SMTP id g2mr12493299lfb.113.1569872358924;
        Mon, 30 Sep 2019 12:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872358; cv=none;
        d=google.com; s=arc-20160816;
        b=cqObYsyk9KjCFvAtH3rNwzsBzQTN13NY+xDNm17+PA0PwRWUnkNYvN6okkUP0ggxaR
         5yzg/KtcgcjCNloXYFwidLiPCG82X2WsHwBrxhW2w7OoN6AdVH0jaLOrxu90cMQLp0RC
         4mou7+ArTDjKD2QbqLH35K10XzO2XKAJ3sBt7ft68dItfseUJBmwrf+JFWfDM41XPWTi
         9uXCDazlt9ITpnyHgGlqBt+bL3VIxjfuEMkCfBowi7VzQs17RX00OV2fqSSDrCGhCWBS
         tps7HvZ+ptnmsbVFL0oKZvOT59H2LosS6onkW7SQ4fOd7/ahjrkqEQNR1Sp9AseEbxgQ
         5yVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JYsAAqL5roVUz8y69nL2U2xp3QptePNunNQWgPLVfrc=;
        b=wI8UjpiLThMrh7fNZO7AAvPqmRIy8ffzxioBIicOkLs0LK8YKUsZb6XTDPxRYyJpii
         Ko7ZpD0Wz4gXi/HQmsWZcgA3T9WWuKmfXFNX+QtgSHaF/tjORv7AjooijKKac/1yuQR0
         ks64rvPVFSiWFr4fgOoZD0VR/Pvz0YmX33DAEz92w4x5QhYDSjklF30Gtdblrjmogn8K
         vTDB98aLu8l5DR86FH5I2U6r557C/uN4q0BPml2hz1o+Va6SdgzK2xXCY2F8k2USNgwZ
         L+zLmriR6SqFeYKBe2U57manwMvpu3usxRrmRTLy4Bpegi7rnaAq24YtF47+2B/GA996
         7yAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HSuBmA+t;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id o30si729187lfi.0.2019.09.30.12.39.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46ht520crZzy9v
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:39:18 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:39:17 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 10/14] pyjailhouse: sysfs_parser: remove parse_iomem_file
Date: Mon, 30 Sep 2019 21:38:53 +0200
Message-ID: <20190930193857.2866-2-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HSuBmA+t;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

We don't need it, call IORegionTree parser directly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 50ca62fc..d2b36876 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -97,8 +97,8 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    tree = IORegionTree.parse_io_file('/proc/iomem', MemRegion)
+    regions, dmar_regions = IOMemRegionTree.parse_iomem_tree(tree)
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
@@ -902,10 +902,6 @@ class IOMemRegionTree:
 
         return [before_kernel, kernel_region, after_kernel]
 
-    @staticmethod
-    def parse_iomem_file():
-        return IORegionTree.parse_io_file('/proc/iomem', MemRegion)
-
     # find specific regions in tree
     @staticmethod
     def find_regions_by_name(tree, name):
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193857.2866-2-andrej.utz%40st.oth-regensburg.de.
