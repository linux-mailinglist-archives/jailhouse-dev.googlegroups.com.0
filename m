Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B91D7B22
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:46 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id 38sf12526133edr.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156565; cv=pass;
        d=google.com; s=arc-20160816;
        b=S3kfrS144eRTI14b4/2AQZGpAmR1wYKIvcUAUhUHdXItbdMN+fOBnCPACGf38qExIC
         vOu0enpBX0wvYPTCotIH1UvJCdHtbD7LW74HoJcM8boeKYpe2QzHCZDw8Gj08GCRsJ4w
         IyuJN3+WKVhoD5J9ldEJdbDBVIg5lzt/M6zPPT1kAbhtxDdjsCgx8v9e2HkgbnBCs3Wp
         nSwQW45HOvshY9Vqh35xSQYRAeH4OCU7IKWpYN6ekwAIrjkCJdPCbDnPVMkGtPv0BJCK
         rpnJ9sncXfm0rtFQOh56shLuWY/YGDUrwhye2f3cM2Hw6Ns52G5SwgcBDF2mJfxq/TLh
         jEvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=X10COb9PvHLki8vtrXBwnhUtmpOfv+ykJR52/wN89XU=;
        b=Stl+tBeThgcCMwVciNc03/zp9hgA5hj6dOt2zF7ZmrVbzAXCGwscFzvUHgJhk1v9xA
         IudF8GWFhqebAqdXte3oaDwchAKSuVLwjLGzoFiM73xoazt2UYv7mRhiBx79Fg8HZCXE
         Rg/zPUCDrqLRtEA0tf84dd8rSbcgNe13PKP69bC7x1YftUdASMr0/t9asloZyd0ZYiML
         iov3/SOL32qpnKTyK4jRedVeBkvhUBV6M6x5JeoeyH9i8gyILTBkCpsZSr36eAndkvQQ
         ZtKtUaxFz3RNu1SDJDwas86k3bM/Rapsu+C1/IgNuwImNg1eJqVw2EKBOfVix8fiDSBH
         fx/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X10COb9PvHLki8vtrXBwnhUtmpOfv+ykJR52/wN89XU=;
        b=VjZXJ2Q+HGLyRooCRQme1EfBNyc0CGg1cAHPGlKsHDPR+G27YjVDNPi3bq51ijbdaH
         VYijcBrYvA9WaC6YfKcft+x9LKbV2wDmQGHmpAuhx1exOwIomdUe+grKoxLTK3LG9G90
         K/jxARrj3o6kSCProYER88lbewPXbcXIQFrPUEfbiWdY+JSTxc8s4O/c1T6P7xl4J78n
         TZs0fK82d+RrrinwVbjyv/+pMFEQDTyFiYQ+EuO30Sfzbizs5CHZMSFnk89CmRtitWby
         /JmHl7maMpar0jLaNDxdDTA2J0oPPK8XEXSZJHGmD3842ad53CkaxVChsn0ouMe/xtRt
         USIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X10COb9PvHLki8vtrXBwnhUtmpOfv+ykJR52/wN89XU=;
        b=nDpTr+6dkTSNXJg9vgIXTCiUHyeIenNIbhPjN1+r17/dWbzl2SwP+YXgIa1cFPjO1S
         a9ad0SeCwhP+do3OxupjJacvULufdIi609w08oF6pY3QUkAWop8sbyCWyXoe3ok1hg3N
         2Jf3JrAiKc9CIi8A6NErkh+U3tV+xFSqDbFs1xnfREngbHoAuGYwWZMVSBmKOO3/s64r
         OFdAxmj11037jfQ1vF+YPxssxViIMuoqleTfcr29btltX4ZdeVIdOoPOI0eXLfZIbDgN
         gjccPyC28RL5bXeccope2N22j58c+dRgZjtrTn22rV0+iAAvjgzrfQWOZLTTA4o1dXEO
         xhIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUZjrcAYPKuqPvPpxezk/MQdZMpumb7sj2nbC8NNoAWrFIp22gS
	RZHbtkrPFEI8igBHdsclgf0=
X-Google-Smtp-Source: APXvYqyFsuiLiUm6fRJ7TQKv4PThbb0A1r20mSvWnwcP72ouDNoPqcGMz0sH9G6+86zxldxULrIT0A==
X-Received: by 2002:a05:6402:21e8:: with SMTP id ce8mr34683001edb.32.1571156565803;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:69c6:: with SMTP id g6ls4820140ejs.10.gmail; Tue, 15
 Oct 2019 09:22:45 -0700 (PDT)
X-Received: by 2002:a17:906:86c8:: with SMTP id j8mr29903193ejy.32.1571156565090;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156565; cv=none;
        d=google.com; s=arc-20160816;
        b=cOirSfrMwFbWuabMdiRpjELStB7QJ9NPZXrJ8EMJFbcs7F5hfchhu3hiSJCQlfloTC
         A+NnkRe8qGUM1PdjmvVpc9YPBxzGUDrChSDIyTwmnvguG26m33OWdhEIQG8Z/Fo9xQJV
         64xG7OTaCvZTWGw5OF5NObupYvW6I50+ZT6irOlDRZZF9pTqNppVidN6yv1Z6iPQfi1U
         K7qTh77Q2G23oZeOCgQ8sMuX9J8fQkYPJ69cLb7RxaKEhBEnQV+Q++H6amRxYdRyrD/x
         1TgJHBaAzEFiAuyjG1bTncpKx1RdJethtXAxi5kEaoB0fckR9oL+Ru0gDDvGIq+kf7qK
         8atA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=tgQJihBy9idPlQgsLgPHiDkWryQn8oqiBtrsl1NouJQ=;
        b=SC16ul2h4UjNGMRfgT0cawCWlAl4dz/iYWCJ6x176pK6D4cEvVUkx5mAKJjQLAApLi
         Vi78kf/qOAX52Fb+4yJ43TtBeyFE1U6lydOqadoAI0F15UGBFJDrcPcb1kyE9OblHPLv
         nH8ARh0rHMhxeV1l35CvUH0p9GEOoZ8tcWwyyMxXLzM9UHr/MiD9XE+rMaSFun6YF2m/
         T9IRX2NEV7LmlJTPo+X9d36Dyn01zPKixxuuym4boWBLNREyVaIz0Krmuvhi5YSZ2CYq
         ijf2wjQSZbFjvF/mJj90iMmOckdFEtF9wa/ZJDXY1JR6Y8sATOSO3eRRC5080qqA77XN
         yZKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q8si1186121edn.5.2019.10.15.09.22.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11J4YdXzy7N;
	Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 08/13] pyjailhouse: sysfs_parser: remove parse_iomem_file
Date: Tue, 15 Oct 2019 18:22:37 +0200
Message-Id: <20191015162242.1238940-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

No need for it any longer, call IORegionTree parser directly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index c2d7686a..ead20de8 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -97,8 +97,8 @@ def input_listdir(dir, wildcards):
 
 
 def parse_iomem(pcidevices):
-    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(
-        IOMemRegionTree.parse_iomem_file())
+    tree = IORegionTree.parse_io_file('/proc/iomem', MemRegion)
+    (regions, dmar_regions) = IOMemRegionTree.parse_iomem_tree(tree)
 
     rom_region = MemRegion(0xc0000, 0xdffff, 'ROMs')
     add_rom_region = False
@@ -903,10 +903,6 @@ class IOMemRegionTree:
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-9-ralf.ramsauer%40oth-regensburg.de.
