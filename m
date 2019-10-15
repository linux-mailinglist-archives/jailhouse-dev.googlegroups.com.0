Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVHES7WQKGQEICVFMDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A3D7B1C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 18:22:44 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id o128sf1275344wmo.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571156564; cv=pass;
        d=google.com; s=arc-20160816;
        b=1KmdQ3ua33BpQvd56QXVL6aoUQlkVeaG2CrM/bjq4paQB7BmVNdJ3BFtUdZOk5xVU5
         7KdiX7Zj/0Mve6HjJAMdwseIXObXZOGz2m127qy/GMoRWDPHZPBQhSYbp/EWPTVhGxWN
         e7dtISbEDvPbSke0GfDLQDHCx2m17F6s7KdGZxLv/wXfANMWnCgQxkbROW2iUW6Nm+lk
         j2ymYfLT+NnEj5mQfaCzZT7rd7NxPPjcP2EBm/IbQCEmXhchsDkGkgw9jwls61mYDq7p
         rGS/RpmOCCzPfaWLcrkqiK8g2P78clkxh/wxwGOkhJe5bXUBP8dUV1zoMzojd4hhBUOy
         tNFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=mL4kvg9whqAk6Z+HzEeFuz4oPth5fWDQtxIudWSp9Lw=;
        b=RNPITobeNeUnOrv2Tle/V1b7nbjghrNk+ra/W5WOAntecAmiML5yX/kf40rA2J2TLz
         ISpAWPkchN4zRBEBIJS1XQ8p8DtN6qOjelgSWSRVXxeGuiWDxQhEVTlnlsBSNA53aoeR
         G5J9Rw68qAj1lh8ASRcR1fYHjl/p6b6PHuztDLj5w/rapbhVVlOMhIDYZBVzAYSe+NMT
         0f9IsKFYHzFhxa2hkHxog7flfqT4QSQjnrfNF7JVKD0Tc0HWDJpnUWPST+7o3DkNX1x/
         34aFuV+Q+GhMrhaS74x+5uYKFdJQ8J43wo8e5Au8SuvGD65MV5OohA3zZz/Vl6rNyiBC
         6CqQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mL4kvg9whqAk6Z+HzEeFuz4oPth5fWDQtxIudWSp9Lw=;
        b=dchDUdeY1Xsp6Q3PCvCk/Z/6Z1xXCI9pTN0xqU6rl8tjGzl+E6C/bYkVeUvO1TS2SR
         0UUj8br0WUnR/o7Jbe/ELmfXXIG/bVVs5MeoOucFsMhijhjWFWbfi3bJlyi1a22Oy0nW
         diinGp5torRCAJMH/XFuQ0olwGy5at9lja0XdWcm4s7JUAHZg39gRSPJh0Vlfg7X4/MR
         qTmkqocVdbT/7Mq8WVfcEZgmhtNlggMJ2wynZ+u8Gq1MNX3zlUXyXKSRHXNPGttDt5R9
         uEx4w0cb9O5lF/TzmlEdaSKRgUvOg4nVGByydrGqtr4htoZkAf5tRKL5RkjcJmFqNH5B
         pAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mL4kvg9whqAk6Z+HzEeFuz4oPth5fWDQtxIudWSp9Lw=;
        b=VSddBoPdG7Uo6kq7sCesaValRKuPD93rG204N8wLxzJXkBCJXpSuPAPpPc8OZePqCN
         4jIyDASlPADOg8lOFGKoQMtgCwlyCP3BbR09SHDxZJ5ni2Twl8sKIQRdHKZEgnp+nGN0
         ZUmDaoWdB+vaBtz4n1Fl587xu8xFEKpkxb5CYPyjtFGlrvujXUXvKDYQ1iW482bKotGH
         EJg41QDHs8eVd451NQkty8z1g4Res5XqixJMldEB+WqheQVvow7k2xAAEAUr3l4z4nz6
         Qa5r5q6vkquYCc7Nmz9o4swtC6Gkj3hEMQ3xNmcKMB1ByAb+ctfaFCv8X41ThOVWssPp
         tR1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUtG6aCn21zKgPCM/FxdCjX4MrSKsgV4zei3tXhH9Cl10VCRKKj
	gG1msT2ZXjHGyHcCajPAbeY=
X-Google-Smtp-Source: APXvYqx5kPBEYiGJqHcCvF5wCP+wWoxS8CLS5RwDk1GF35k2pbOLN94Sp6qft1ACjNZvGKGKwQ4tMQ==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr19532863wmc.11.1571156564511;
        Tue, 15 Oct 2019 09:22:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4c42:: with SMTP id n2ls7140850wrt.8.gmail; Tue, 15 Oct
 2019 09:22:43 -0700 (PDT)
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr18433643wrj.103.1571156563786;
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571156563; cv=none;
        d=google.com; s=arc-20160816;
        b=yJ3vHILC/+nG28aMBnYsC22Nt495UZQnHoCXIx73VrhtuDUZ2wWQpS1tmeoS2KoWnV
         Sk28Numu6bd4JXtAg27wcLHBReJ3ATR9hzgVOokoV+beDM4EKbAayuatNL/I2TknqsHz
         jZR8IYQmcB8Xv+z5vF83ZKFZNCU8EWUs/yibe7YyFWpjdEg5xAuZNKQN0cdQpQHkcM7K
         4dIhU3nkSdLTkrtU5BP3YMO0/XnB/VZcyqYj7qMMZAKXNUvh0MEAXop0qykicC53hbga
         pURnqIkrEUd7LPgclkaoX3Y4uYpB178AkcmqyZUFxjQbRr19+2EHLxJ64SRSEqHTKkUH
         IPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4lqiKJtUJ7EOBHcZ7jq0O0BQ670Tq2n7xf6SvTk889I=;
        b=oFOktI7CHJSCZBYGzyLNzTKFSSHmOp6+YiuIE1zeedg+/CFynL4IeDQS++w0DXvv4w
         rpLbIvq09+kxrRV58/ysFKf5wmdIVyWbuyPd0Q4ArRelS8J8hnZl0SgxBnCEMBXqtHjX
         bAfK3eyVso1+uSZG0iEYCOKTx2Rqx1mNTeHJS4HMAQXecbcZvXYV5VnHZa2rC5pChsJG
         NwO/EIOXo+jCIekWLDzJxu1HWJL5LeyoBTNLKxqHm9+nIdKfjVbuVwpoSJZDjDeiKSgQ
         qYh9rZKTGTMPtJmiBbrtvEXn5FrW3AmdickSe0S/5YqmkJb2RYtu7NReMzOJPTS4fQoa
         ug+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id r1si1014288wrn.2.2019.10.15.09.22.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 09:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46t11H2wKXzy5M;
	Tue, 15 Oct 2019 18:22:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v4 02/13] pyjailhouse: sysfs_parser: remove dead code
Date: Tue, 15 Oct 2019 18:22:31 +0200
Message-Id: <20191015162242.1238940-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.15.161817, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.15.5650002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_1099 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NAME_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

There are no callers of __str__. Remove it. Seems to be a development
artifact of earlier versions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index c927ebe2..f5071ca7 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -832,17 +832,6 @@ class IOMemRegionTree:
         self.parent = None
         self.children = []
 
-    def __str__(self):
-        s = ''
-        if (self.region):
-            s = (' ' * (self.level - 1)) + str(self.region)
-            if self.parent and self.parent.region:
-                s += ' --> ' + self.parent.region.typestr
-            s += '\n'
-        for c in self.children:
-            s += str(c)
-        return s
-
     def regions_split_by_kernel(self):
         kernel = [x for x in self.children if
                   x.region.typestr.startswith('Kernel ')]
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191015162242.1238940-3-ralf.ramsauer%40oth-regensburg.de.
