Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVXES7WQKGQEWDNFSDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 87864D7B25
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:46 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id s3sf12510863edr.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156566; cv=pass;
        d=google.com; s=arc-20160816;
        b=LxD148uZPDpy45/1XdV6K3EZdPtqgTetaoClrsAAEQDifeOfy1f/H04zsyNqjsV3C9
         wJy1uX+Rc8cL3uVU9RBRV5jOoGKRJJUPCKx1oTT9Y6adSST1ZE1mCKel6C1f87/po38x
         LKmGLJx9hAEP0Zbf/pT7FkAciKlAIXlygMOistXTgxjAz/3vK0b1hwESuyZy8pm4YpEO
         gNXm/vHZSvUTJtBazrCB2+bBTDmcRGE2uhAMEOTtkDCMMoWLLm9sVF47e9Fkr4y7wU31
         4kE9tVSExYKpmEBg+VBL90DKtfkgJcYS5Xx3+kZTuNPiFH6m7hgZtT2YNf/xq5cH53g7
         LXEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=eQdOG03zkR9zUvVfpnRz/TLcWkDSK0uNWiE6YNpCacY=;
        b=qRt+Efvk4O0G1UrxlR7jHzG+Nqwlvxw7BwfL/V9uABW1jXJ/CQQqI2VuqVigjh869i
         bevsTxUZDpCVe9YEp75eFHeDZY82DybOq58B4yvjKKnJb4ZfI9ECwe4mmLym7U+MHB/g
         GP02RACv2p+qtfWxwza3waRVPWHwvp+Tz2T15DuZF+v5ygICJOU9c9Ta3aOrmrrc9ej4
         cZ2Bz2L32hbti5izZ69sDFIeYbGQuo3OikgiSjE0X4ASfln/pasieKRZfmDKHvp9Jbmo
         oX9RThn44G5I800Rv9a4GKOi022BnRuz44ckvTrFd4KyUDQ0GD5oTqAkeW9mHUyYhur3
         upgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eQdOG03zkR9zUvVfpnRz/TLcWkDSK0uNWiE6YNpCacY=;
        b=ZvtDzd/y6y35yB73m8UJ+jTmKO0vCCW/zLy5JLxMA2+VfipGfShViL/b6POER+megQ
         gu7IaQ9mbiXnuV9ej4zqq0WRt7fXbDB1AUx6FjhxnOMmCKW2CaiGKocPDYAwXYPFgUqE
         dNrI/p8jeqIp2/ztqPwiEzqJHDLXIlQZ6O2BdvyK6woutIrJLkRoc1TDvf1Cm1CKjZ8U
         dUEjNkR/9ER7CQ9evkwyVYYkd48oJl/W5xZcVc6iTlJ0pv73d/EmkVUrxEXWJSf6l1ci
         KWwgXSIHWBUkCL/kuFKU+dS+b40lmW+4hqWhN0SaQy8kQmgSLUDif8wvVNECtVqhi9kj
         CnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eQdOG03zkR9zUvVfpnRz/TLcWkDSK0uNWiE6YNpCacY=;
        b=ArlJGQeAabgDWCSL9VHY0uEUo4lAWV3D06Tr/7mSPch2SkNywqz/lZNtTLd5LcRCga
         EHVv1leiWqoCSbITyMcJBo6LJpCUAVKtC6eFjsHFdWfaleZmHm4wVahN4rY//q6QPz5y
         bgFr2hg75aaDSZuYWlMy4VhiQU9crV9EEYxlpDCl6Bxi5Dm1nFdTHVNv7tV2s16G/Nzg
         05rxRDwxteSt5q1vN2p25XeLAe7OE05+qCqwYNzm6Nemc73JBa4yBQVicxKzyqxB9iu/
         rA7oCPhkgEYq6qTAs6xc+455jS6LomK1QEFW7c7wysNkSo5KiVRXsTg+Nq4RKc+dxknB
         r4hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVNSWzYo+/Jvh1+yMbxTkL95yvus6Rd5IkYFFmWe1CQTo0RzNHH
	XkBD4Dqfju0rfR+UahjPgr4=
X-Google-Smtp-Source: APXvYqxmZbTcx3MHY4wZTPnsQ29n9Ru9mAsehKPuCPkaaRu1f9CiVurjhCuJWY4LWLArafaOUj4RYA==
X-Received: by 2002:a17:907:36e:: with SMTP id rs14mr35538283ejb.280.1571156566218;
        Tue, 15 Oct 2019 09:22:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1847:: with SMTP id v7ls4335659edy.0.gmail; Tue, 15
 Oct 2019 09:22:45 -0700 (PDT)
X-Received: by 2002:a50:fc86:: with SMTP id f6mr34739651edq.233.1571156565654;
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156565; cv=none;
        d=google.com; s=arc-20160816;
        b=E8EgY0H/MWKIO+uuyhKRVZf2LxgoyMZTsMvMZIlGtFgj4caZICHPJq6B+1CsndCvT0
         KJzhTciOCPB7au6wG9pJyWWuQEPkuPMJLFn+101iZIOoAnx2SWleFw8TOLloIgJmCnno
         uALc5AmbB9mpd297WbOD68xsbNpDC8VbXkhIRO6uSui4zHD/iH6uWFVpaiEHLywyHa6x
         Al4xwKo4J/h2MxWFJWXiRMj+wU8K4BlsAw4o0c+8HahuX6iuhjElFxj5+qeSKMPpjcTv
         tJa9SCK+fA7LpsSDc4/iWWiz2nMYZ/D/vf3yq5T23UiCSUDMMoYTEWXDuBHrIqO++/x9
         /OEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Flfb9efMmcODoETkn5Cj1pKkZ1Q7H2umHq+e4Sgg9yk=;
        b=DACOTyQGEB8jsMZCxSlkQi0lGP4jrIeGjaSmxEJoyoDcRMocJBCsx2G/lCfJalO1Uf
         E8stoGG6vhVr0ejzR4jOHitwBEQtamL+C3lYfvMoIytBqwT4I+jtErSP9L4O7j86NN+n
         hnYixtlvUHM9eqe7vkn+aiOa13H8LzsHkdHvKFqSM6vRA8561vXnOjWYDHRcpGnPiOyM
         a22drBT4TKxxw6ZTdt5VdMzwIIbccVl8ViN6yE0Wmug18CLr1P6/dzGDvE/eH/r/oksV
         RFQL3kkBi90YtVWEfrcdo+H/1bGWVUAA9z3AHzykfVSgMlIJ1Dpg8WZzLWxVpSg/NMJT
         j7Ig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id r3si835810eds.2.2019.10.15.09.22.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11K1lQWzy8C;
	Tue, 15 Oct 2019 18:22:45 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v4 11/13] pyjailhouse: simplify integer formatting for regions in config template
Date: Tue, 15 Oct 2019 18:22:40 +0200
Message-Id: <20191015162242.1238940-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 11 +++++++++++
 tools/root-cell-config.c.tmpl |  6 +++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 004b2b86..1d00f364 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -793,6 +793,17 @@ class IORegion(object):
     def size(self):
         return int(self.stop - self.start)
 
+    def start_str(self):
+        # This method is used in root-cell-config.c.tmpl
+
+        # Python 2 appends a 'L' to hexadecimal format of large integers,
+        # therefore .strip('L') is necessary.
+        return hex(self.start).strip('L')
+
+    def size_str(self):
+        # Comments from start_str() apply here as well.
+        return hex(self.size()).strip('L')
+
 
 class MemRegion(IORegion):
     def __init__(self, start, stop, typestr, comments=None):
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6522ce1..d884089a 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -132,9 +132,9 @@ struct {
 		/* ${c} */
 		% endfor
 		{
-			.phys_start = ${hex(r.start).strip('L')},
-			.virt_start = ${hex(r.start).strip('L')},
-			.size = ${hex(r.size()).strip('L')},
+			.phys_start = ${r.start_str()},
+			.virt_start = ${r.start_str()},
+			.size = ${r.size_str()},
 			.flags = ${r.flagstr('\t\t')},
 		},
 		% endfor
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-12-ralf.ramsauer%40oth-regensburg.de.
