Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF90D7B1F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id s16sf2194779wme.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156565; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xa6b1wCS0w1tCVaGKAJF1jBu57l+t2BTZKg27h2cnWFH9AHZOu5Y2QnqAuZx6RAE2E
         /Bg5cyA60EnP3jqLekN2gxctDpm6QP2dDpmWcItYpaV6XSKYFZcqn+faKWPr29GFSB3J
         619QlpOmL4tPC8Eej2xMGUKzEnX5cLgVu/7iB7Rrc+VaJ6tOnpA1aUIhAPsqiOLQJh10
         iJ9foOP/Ru6j+qfGzR3gYedeyBe39J+iOoKHe7JUULmQfZMejKsQ3Ti5961YMEPdFxfy
         mQOY2FcExKEb6EyM9exfdIwsyhOzWxkmmp2e9i0sewld+wkUu2rOHHkNIXtDSqVy+2QE
         KjZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=8j77hsw9A7e+yrrX+4xJ70Qui9qG8bvrKjScVtjkvlM=;
        b=J9CxwHhfkV0aDSFxZ7P6fCRIbwfcXTNPCwCPL/TYyBVzNbGJOAIjJe8SPZrF3sTnEa
         tU2AQNYyxgnFwS4Z3V71CIFuYPcSuqwKB5fqkkbNjmDN59gh07P8SYxxABFghPWEQy1S
         yeheUnF1DkZ/9CgDuxTCOJfNQ3cvSvHbggFHTeYYGL1sAhj5pgnuvaX0FzExoKqwf4Zb
         yzEgX/vBFJvxK3PRSNGgXG45wUwp+QdkvppauEXJRzdeO4WG7UB18ANzL2EQoJJN1qvM
         If7k0Nw9kcd07/VCLq0MPVP+GfJi/dR/284MGbG7BDp6cSkoM7avR6LeE0g1P3/5NMG1
         03EA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8j77hsw9A7e+yrrX+4xJ70Qui9qG8bvrKjScVtjkvlM=;
        b=Ivu0eQZvRQlBGzGP8AFvMpt0HU9NVlKVurq4qOksw9JW9xY5veaKoqu2GArGtgMSRa
         7N1HjPJtOyyJxlueZFYOnT3Vvu3zTw9o1zzj1/KWLFzvWM0sb9uNa4Y2VvMAb/HkX7Nq
         L1tyMhhx2hZ+Xox2AAGkSDkvUqIcIXesZid3H8T7LWiflt/yWyp4m6FtkIsrzS4CVTOZ
         gLToUyj0bzDmK6VNl3d2MZI7qg47ViTKt5HgNKXLZFro4QvxaRhXuz4dm1TapQSzHV3Z
         Cq3BeNxct5HWmtU2JieZ9egZviAN/3XHCGIJgCh7WZn+A96yQBdbOvO/aRWd8YHV2bw3
         Q1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8j77hsw9A7e+yrrX+4xJ70Qui9qG8bvrKjScVtjkvlM=;
        b=U5TidObSY20uVlNZcJvwKEizvAXBD6SDCVVYhfQUl8OlnMatITxlHgAwfo5pQHgWzQ
         pQgZ+GlDc8OMgl8aC1yn29O0sRPdcoLOxZCaKLsvvns2v/7zcrLe0rP7oia/TnsZzDPZ
         oV/Xp6k/hnE+2igkDgieSHhAUwgSWtYWyZda9YOuVq4vT1Y903sTqpOU07BKy+fsBg77
         mm63knUuWquTLuGnhhiIMK0M/0WceF2NQCQTJvUOoSYF9yyP+0G7rHIhFuQ2p/mVw/F2
         7xjVlIR2j65gXHCWVKw5cX8oqqUfb3BHZAOwkorRHpk/yRVwxQbhvKEDl2tZ7vAZTr8o
         3nlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV3jPwCbVnunO3YOaOnTG+W1fj8WHulQWYC30TfClgFkWCv1G9o
	XjQgzil3NQ5EkQmjjK/3Vv4=
X-Google-Smtp-Source: APXvYqyZGkFj/S6wMkO5F8+/AOehnEPeN9yq4N3CUSckCVPqXDjjEARXihpx3UCfHb1J1+TDY/9R4A==
X-Received: by 2002:a5d:4108:: with SMTP id l8mr30272936wrp.391.1571156565325;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9c90:: with SMTP id d16ls7125403wre.14.gmail; Tue, 15
 Oct 2019 09:22:44 -0700 (PDT)
X-Received: by 2002:adf:e688:: with SMTP id r8mr33936955wrm.342.1571156564777;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156564; cv=none;
        d=google.com; s=arc-20160816;
        b=SScx1YL0ezUB1afEz4FcRCfpLuyenUoUE096UzoODNdjoxld0Ay8yWHl5gMBQ7IYqT
         VvnpRvMlnaru0x6GQefMFemeSXk/Wrofi82IFDHae1hLVgSi2y73YBVVqUe9qutzvUf1
         pUXP9/+k3NjCm9aDIg9ewUjnvhrL28t/P6uQdrMyIxMKaW+WtQSTaApxZX3TqilPiyzB
         Y0YYBU3blHR6gOfRNiXkqh+3wqsb0HxuZkI4RBipGmsnXZCvUc45Z0AKG45Kpq2K/zmq
         bwHuqaVWpGq4qVrEy3b7t1rqcOw1Vm8Vcef5O/N2sBXZJIPrfcGbnC4ZafLzwlFbrJW4
         AfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=u3+3MGdII1Elfhv7tTwwkuGzTBFeovmPTyYXHa9oztc=;
        b=ERb0AEEBx8/9iDZaq7qWVcs8NBTwKT4kZUdldgY7hISa0A4M/+FgzRX68Gn6yEGRVT
         vmb2vbuR4QamkEoDPAj8OEp1embaE+9NdjaPcaaAVbKvlNU/Tnl+C1ZIWtdCrUc7QSP+
         aQyN/IBYVTvPSRfXidppByxsEWLn6MzPqgLEIippDsWORs2lJzWu/nlr9hB3lwUs5xs5
         2qd8rzlVD5+CLAEbcjtCKzbILNVuYrKrEUWsXnkXzcG0QUn098WTPEhYMqSr/mNN41ZV
         naqJeBCPKguCXVm9VfLMQ3tPfMBUTh6Fp7TBwj907G82xeyFMSFhVdK+EQXcbhQGI9ek
         FtQg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s194si188750wme.2.2019.10.15.09.22.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11J3D2Hzy7G;
	Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 07/13] pyjailhouse: sysfs_parser: entirely separate IO parsers
Date: Tue, 15 Oct 2019 18:22:36 +0200
Message-Id: <20191015162242.1238940-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Everything is in place, so IOMemRegionTree can be separated from IORegionTree.
Let's give IORegionTree its own constructor.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 4736b798..c2d7686a 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -826,6 +826,12 @@ class IOAPIC:
 
 
 class IORegionTree:
+    def __init__(self, region, level):
+        self.region = region
+        self.level = level
+        self.parent = None
+        self.children = []
+
     @staticmethod
     def parse_io_line(line, TargetClass):
         (region, type) = line.split(' : ', 1)
@@ -837,13 +843,13 @@ class IORegionTree:
 
     @staticmethod
     def parse_io_file(filename, TargetClass):
-        root = IOMemRegionTree(None, 0)
+        root = IORegionTree(None, 0)
         f = input_open(filename)
         lastlevel = 0
         lastnode = root
         for line in f:
             (level, r) = IORegionTree.parse_io_line(line, TargetClass)
-            t = IOMemRegionTree(r, level)
+            t = IORegionTree(r, level)
             if t.level > lastlevel:
                 t.parent = lastnode
             if t.level == lastlevel:
@@ -863,12 +869,6 @@ class IORegionTree:
 
 
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-8-ralf.ramsauer%40oth-regensburg.de.
