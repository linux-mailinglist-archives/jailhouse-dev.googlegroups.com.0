Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBF7TYXTAKGQE36MQ6IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A3E163B5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 14:27:03 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id z9sf7936567wrs.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 05:27:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557232023; cv=pass;
        d=google.com; s=arc-20160816;
        b=mKV9AdJ04bXK/ZTjy/0ayBs9bMrkC9m2TffPaepqnP2Ekoziq6X1IW8OgcjjrePs81
         pIRiApqHZCatILo1aHh8ZQiFVTZqaBN7PRxMk2KBA5XVYVh8oRpmqVTYRVnKFlESFb/H
         m8BDu2J3kP1AleSUn1SbubYhyGmIQYlnOChlTXDWNfRdJBD7Fec1NZXohRx20F+8Q6J2
         UD8W/4zuf9Rj9Zd+5OSB6fiemVVi2H7JZp5FZkwUJwF7tSfU5EGsshABL5umtJlQjQja
         VMsZ00nmuE3TwSx6yeG3tGpNZCpm10gimpfkk8XlG2+x2r3+1k6xThL2NmO+uv1qPZF7
         z/IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=OMGfalZRWXu1g9DmkS2h7ZqBvroTIYmuvxHBjwdw3hc=;
        b=rE2lyM4YlELz0SAYqpm9ICwBtdAfCN30lIZrMO730mRaLo/MqYVvS84yUs2PSb7ICc
         cUJJLeC393M9EPReB7RToyMLWGBvRZdTBSVPkDD1MxBLIT2BhAr1JgSn+pvtAx3IxaXY
         7OVLe+vVWfqWYEkgR+0n7mcacFh+TvocSuyMIb83E3uzXr9qJ2/7uwuUJoxiBj7GPjwc
         GLVYrjKh8VW7dmXHjvWjrp67F/PC9tEC5YmQHTqRvj4FL21ZM+h6PcDMM0nEBwUJIkgV
         fdzdBhWyr3KUfR+el6nKSHPDqDJ8nBjZBsQ+K2cfv6CMxab+Ou3wq335S5VldViFYm8N
         vlxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OMGfalZRWXu1g9DmkS2h7ZqBvroTIYmuvxHBjwdw3hc=;
        b=BPnnJczO6hpx42s5/Jqw7RqNuU7lhQ0pAc0eZILProGAo7UCCKtYUJb4CnhC2uY4CR
         aCbykYOWxN09YTgATUk7aQFRnAExEhBAORpRQxsNrpvQ8Om/Qer0omkuusE86x0BmFqV
         Fr9AeWg8C4V+EEoMoN+BOWyd1QOm+WGxVbUdRkksy2/h2cfnU7FLNvbjz4moTtBj2/YJ
         VUyrf9QS26kKqTNiYdoKVmgPEqd9s9SsRArh9XD1rzElIrPnktuzuM9EipDnJ9D5C6MO
         Rr9r/eBeeiTYEUucR8jEUpkE+e1xHw3ayRHiPDrYL8uXSERBoGj8GtZQ/oRgVLCSilkO
         k+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OMGfalZRWXu1g9DmkS2h7ZqBvroTIYmuvxHBjwdw3hc=;
        b=JV1KT+0OPoCxD/PFa8IMKMtOly/Cl6mZp813CwMZp3K5kQVqB7cnLwxea9c6/fcUJL
         XpwYW+36jmHpZyICcuLgfB+DN8wALpYYsWw8yi3eu5FYJ+ULPwFtqGFs5dwnUBiY+4Dj
         Lf7j4FSUgAnF4tHZL2T1omh8gVFSDD184hj7onMVVLytSFZC7ytqCYFESA0OrIb2GygH
         z5eVZBqGkpmCgS5VKu1tiJd1hk2Oh6+BXcsVO6ljJSYySc3AUCSKDlKqkpUv7aqy1OCH
         zuuk/5WROT48g3BF06y9LeUIKNuUhlGqHfgYg4bcKWpimGk81RDCVnZRPqU1kWtjzm+K
         gvsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhLa4eAZWd3qkBrGTlvQsOFAKSZxyiLJSBjEjOQ0mCMgkAIkTx
	dpsWlw+xwcMl9LvjQDgTYno=
X-Google-Smtp-Source: APXvYqxV4hjcJoLg3oDB+6yq55dW6tFPZlaOuiCxGjpD7utqaq7aPn5gk8+FcPC2syD9t9JvG8xSAw==
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr21946585wrr.214.1557232023264;
        Tue, 07 May 2019 05:27:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:6:: with SMTP id h6ls3917441wrx.16.gmail; Tue, 07
 May 2019 05:27:02 -0700 (PDT)
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr24401635wrd.284.1557232022773;
        Tue, 07 May 2019 05:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557232022; cv=none;
        d=google.com; s=arc-20160816;
        b=ESTzbLOGMV79eJ1RQP30/C9vNI0IOAAVxVjzOaPmkuY5vVi+29LEmmrPBTXGcvqS0C
         LegB6CbQoBXrOx9j3RoPdaxChO+LBvVN3ah1DiJX2JYmn9mJhOAINqsw+WfTW/1Sn2eB
         inEBipshDIQXQ2tGI5VYAlWk5/JIa7QN7GmYDSIHqT/3SO45JLh/Xj00k+Q9jnCg5tPa
         K4O+knSS/fWsH41ZPzPxYBINrpi3De/AcPDctB1rvuI4WduWn7/Bhbd3+u0qVUvA+Tht
         VN2bPa7iSKrW1RWZi490FwAMBwKQQqz6XY1odNhXgR77VVHs0xZHZ8C3IV5SiCYLZ2GL
         3QLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=60pewPIP50BXbMZ8lz9ftYATznxffwuRe5fKP1ixCsw=;
        b=Dvx6hshb9/7gezZOUq0bY35i9WgIvykuj0hPWam+b4SElm9c5svZQlHRWvVhtMXTLt
         A8I+aEzpilXXbSVxbX0s6JkeRpoNfFLIDD5jFNQLo5N6TmHdy6Tspox0A2vbN4XVh+C9
         iCewiyYwFikpgiVqUyZze4VqlZ7bHylDr9eFVwnw68vUDYLSVJmjx95jopUhVkJDnu8l
         OYNrHuaROEbtxHQIwvy+V7FQcwV/hmrn0wgqNfp0qKrNgSknGeN57rbvKPWuAX2CpVG6
         qdORJ01hE13dakf6q7KxzKyqiHut5IhVb/slPbDNkfq05/8djsI45kl/gDQ9XP3O0Qoh
         lyZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id z185si752910wmb.0.2019.05.07.05.27.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 05:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44yzPf2g4yzy6p;
	Tue,  7 May 2019 14:27:02 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] Documentation: debug-output: fix typo
Date: Tue,  7 May 2019 14:27:01 +0200
Message-Id: <20190507122701.22129-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.7.121816, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_700_799 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Shoud obviously be 8250.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/debug-output.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
index 22eb634f..e3cea6ba 100644
--- a/Documentation/debug-output.md
+++ b/Documentation/debug-output.md
@@ -158,7 +158,7 @@ inmate command line parameters.
 | con-virtual   | Use secondary virtual console | true / false       | true / false                    |
 
 Available debug output drivers (con-type=):
-x86: none, 8350
+x86: none, 8250
 arm: none, 8250, hscif, imx, mvebu, pl011, scifa, xuartps
 
 Similar to the hypervisor configuration, a zero value for con-divider will skip
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190507122701.22129-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
