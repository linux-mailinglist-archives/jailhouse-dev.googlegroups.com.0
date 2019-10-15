Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPES7WQKGQEPWNUEKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D1D7B24
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:46 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id c6sf4084831wrp.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156566; cv=pass;
        d=google.com; s=arc-20160816;
        b=cLuVfSAfKj/jByewf0FNcrqvMFi4zydDUhMCpsjLecntdQG5an2S7Y9fzcSGptPDtc
         /2TkWLYj2aU+RpEAbZpXDVLTO3rkVwKsi82JU99YwK8CTdrGriBLuoA+KPObo/1V1+qc
         /nFwABzGWS2MiDYt7zHqsaedo2FLEb1OnE2kBzZ5HOXlMl2ttn9uDcgg5VtD2/4ODLTp
         NqTA1VKAYYjqL9hxg0mwHiafHMwns4BvgaoYndd5wIbwiz6Y2Jwn9Q0mvJEEA0M8Kkgz
         GC2Fx/8Z+kXGVw66basqHgjsCfCZhbTCA8PPs3AgFMAzwYZbKC/TmOoboJkHlik0SyYd
         WOTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=01SvlK7n2twGr1AcBUViATFKLya0UT6ARcWMsBXyRRE=;
        b=zgeYDbw87brARB30x7eUr9lJF7LYAtEH9GOmv0UxSehO1G3LkCoJOpnnOzoDjro5WF
         to++xSug4rZVO5STB3b5ez5xwbNY/FsxOL7es9kWyxM0bNnrifK8Ts0OUznCOL1pRp/V
         pj/9ZZUsOPZItNk3U89dkpv2Hjp1LJh8SDE8cMq5jEW59UhODZtAZaRGIMplkPJbPOPq
         MGZlupAhikxjdp1kY25lTioqzPYzw53BuP+vK2U7775j3g/M2FzezoLfEM4fPwQgTi2C
         M7YvS7lho1aj/w9qD79bg2v3MMIQ8V+CUo00IICpG5CU48jd23K3g02EUgiEzNiGL/3k
         mAuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=01SvlK7n2twGr1AcBUViATFKLya0UT6ARcWMsBXyRRE=;
        b=EgWpfoYXqoPW9OUrJ7hCExhVkdHGFHDzTpOObaEtHf3Fjnge9Fhr1yMp4x/sWTMDB/
         QSdP64K5sZ2xB5vBbiqc4bO2W4WOCdopdwzZwpnTYhf+IDVdjGNFf4VliCQWEcSVU5lN
         oufkbI1+g1ntkt3B42BVTyEw19B8I9TM8y3JVg8n5VHgvG1wDr0Pbn5qu/xJlZ6Nvm8n
         wDKlrm+9ZTDjmKrCDBjl3vABlG1py5kQjmepnk7DjyEOdMBjeJ2ga5PEFpDCidejaovj
         txSHhfTmSN/0D7LWVok7MFauj5hsmwToxmW8FBwSACV1eY3+TsOq/xGXZcpFFj8sdHxm
         aDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=01SvlK7n2twGr1AcBUViATFKLya0UT6ARcWMsBXyRRE=;
        b=Bdbfg/gafWDopyba+CEJkFhPWbB42K7S+HhfV9S91ox7XAUqDSTEtkdEO1EyhQtJAm
         RfyCMD6jL1t14e34/JoL5GE0UnScGfrgIi0KyZwlGJZOCPQ98bJ2Hx0goMYEPffzaxC+
         Du7Mzl9+DY1B8b+d4FuYM0mOFI9HF0vXujTzw39HTV3dvyaIadraTw1wMYG+7lwsuxeL
         j8cPVeoOvinSh3A5vDmgPRNCbAXKdNizmOeRaXFtXKoKdZ/hZ0T1oHvuoSsw2/RyXLru
         a+0gFgC0H5fi9j/ci5fjujrkROI1Wqfo8W6fxkCHUmAFB/rayKe/8o6cVRmmVg4B+1um
         1l0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVVnBOKwHnhjKu7kmNfdA7sfUYokLJabhpnDd/7r65zJwBzCZAf
	HHaeSwgLO9YbteAcfPOqycI=
X-Google-Smtp-Source: APXvYqxZZ+vtQRzn4pn2JQkqjNYUODs4vDLC47nwaFrxq9kJDdQoeqIVpuvaRQclnj52i0LIchXQNQ==
X-Received: by 2002:a05:600c:21da:: with SMTP id x26mr20289560wmj.152.1571156566212;
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c408:: with SMTP id v8ls7136147wrf.10.gmail; Tue, 15 Oct
 2019 09:22:45 -0700 (PDT)
X-Received: by 2002:a5d:4302:: with SMTP id h2mr22219102wrq.35.1571156565411;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156565; cv=none;
        d=google.com; s=arc-20160816;
        b=NWWW1iBKyZV8rpeLDN0FoLz7VObLKIUyEUKi58uHhEanj922nX7tmHo1ceasJhdkfO
         0CiQWpzarJrq+vsEcrwdT/Vx/kjowBxRTkVqsq2BbHNQ6Jc9ZRe4rLmgS1bp1MiY3lEi
         fSmlM2Zn4kWiQGOerE1eu8cbYQ5F1BJ7kEmlOSFH/iHiDHoITOns+xiyR6T/o/c79LPq
         KJkYyu2e/Olp+Tsxf+no3Q/tKaifrRZKvQDtdRzdJPXrsJmLqbZt25ryhZ1u4xzBYSH7
         7cTG/kM5LX6iIR6lIv/DlrJesyDDyVoNWm9vPezDNSSnbPuc1FehvV8nkh5hlcHetnNK
         V30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5DVTcO8rAuzUQfjLdRnAmzkwMYXFYq5e4j++9pG0Csk=;
        b=gRyrgd7c7CdyxDvyQmzNiLcd0uYwe50fuSgxQGa58xhg3JaA1VmrHVMKdrJRS82vJY
         KVQJflftY8T2NeJ2PFeT4nFyzHlJokvzPQSCmmg/awbXyHTXGzh2UeuyTP0hi8veOQjO
         NBt5lopem+I2a17RAA2MK+gjdXFjXaKJN2CeO10BshwqsaIE1DXHfUAegAobfHbQR7d/
         Dyl7WhFR9+akfxDjaNyqAFka7jhMbnJi7SPdkx2VsYQpYeR22bKMHFfqj5QO+MwE7ckj
         FIEgIEd8By/ovnOb7m8QrjnipH3WiL2xOfJJY6hHUnfDG3lWkST5HhmswbJ/lAqpdK1A
         04NA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id 5si236462wmf.1.2019.10.15.09.22.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11K0KKdzy85;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 10/13] pyjailhouse: abstract parts of MemRegion into IORegion
Date: Tue, 15 Oct 2019 18:22:39 +0200
Message-Id: <20191015162242.1238940-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_STORAGE_LIMIT2 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

From: Andrej Utz <andrej.utz@st.oth-regensburg.de>

This prepares for the refactor in following commits.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[ralf: add python2 compatibility, add comments to IORegion]
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 260c2aa8..004b2b86 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -780,20 +780,31 @@ class PCIPCIBridge(PCIDevice):
         return (secondbus, subordinate)
 
 
-class MemRegion:
-    def __init__(self, start, stop, typestr, comments=None):
+class IORegion(object):
+    def __init__(self, start, stop, typestr, comments):
         self.start = start
         self.stop = stop
         self.typestr = typestr
         self.comments = comments or []
 
+    def __str__(self):
+        return self.typestr
+
+    def size(self):
+        return int(self.stop - self.start)
+
+
+class MemRegion(IORegion):
+    def __init__(self, start, stop, typestr, comments=None):
+        super(MemRegion, self).__init__(start, stop, typestr, comments)
+
     def __str__(self):
         return 'MemRegion: %08x-%08x : %s' % \
-            (self.start, self.stop, self.typestr)
+            (self.start, self.stop, super(MemRegion, self).__str__())
 
     def size(self):
         # round up to full PAGE_SIZE
-        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000
+        return int((super(MemRegion, self).size() + 0xfff) / 0x1000) * 0x1000
 
     def flagstr(self, p=''):
         if (
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-11-ralf.ramsauer%40oth-regensburg.de.
