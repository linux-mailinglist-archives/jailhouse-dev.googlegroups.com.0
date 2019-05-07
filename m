Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRPRYXTAKGQE4UI3LRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id DF40C163A5
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 14:23:34 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id a28sf2582222lfo.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 05:23:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557231814; cv=pass;
        d=google.com; s=arc-20160816;
        b=eVI2kiy6erLly0EZ9dZ+jZ6TWmHez8FuXUmNfQ/L0Vh/3oPNtAucEwjgU2lgFbvJUA
         fvknrS6vri4dEKKhUWQ+4W7abXmACnvFh6yVLXiIv8TGTSCgwVnjzM+SxXIyPDD8RpOf
         HQ0bvZxvG1LVdPdDdsRiEydgqZnbBDriuSnY4M8s2E1TDB/DqyD9e59WIwdOskh317qz
         /ts5CkO8Mbow4ztsRvA5nryUEmWeUOWQ5nCdOGO6ZuWj7VGIBsxk97+Zjdc39IlPJx7Z
         w/u+kRj7J4/nnVHQVyqUdGVbC9KLV8nOhah10fGKqBRUS2tjsfNOziHlHHBZxzIFfkmu
         eHSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=KipPv1O91QNMoVcObPn/ceKNnNQ2QL4h9fZIHkeF3IY=;
        b=DitEPMocYOHrj+7kzZt8476vcJioPmJmU5aTv/EFpn6s2m429jxhdOrpYN9o2K25jO
         OwmPpsgtbgOEtbBQ0Ow5xleV+VZzUyb1MlAOQQ+fTwGG9+/jcaBrhD+CBEwnwcFDWlHE
         nJHPTMPlwx8w1thdlhRLpBu2V8Q8hOL4Xm5tc8vGe8lmwm8STg9nn/+c21V7xEG7D25v
         MkHnoKnG0xrLsqmYkvifviGY8XLQE3l4dibX9kNW+8l4U2P7nKbnsHhmMvoe0k1InJI7
         NFVWP0TRVL12TEHjNhiQ+0VuHOLn9k3yHwZu1yVfznCVQm7MHcqj7WBrNj2onZGN8i+A
         eUmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KipPv1O91QNMoVcObPn/ceKNnNQ2QL4h9fZIHkeF3IY=;
        b=qv6WHKm2WzskI1f7meMKPY7O/VdlNZHaNYenJcohR2hzc5I9PzKn2QZoRKb8427UWx
         jNameIHVTFSO6Lw8zBZtRkNrZHmLff+xhps/EjEjEkEcqaW/vJRvkO86uqzGDcgNQFkY
         TYG5Sd9qaFvtt7HdDuxNn9lDdDYfev84fLfDlyhQKoOI9jO2sU97LiAGYf0UoRlgXCrA
         R6I/wBbkf3xs1W085y2nM2rVkC29E116z3Ab2muChgxwE4sX0Bh+fXO/k0h5QZOyShYH
         1nyDZnEqBoo6FyXyqeKpm7fWR2ZZEGTT5/TQzl6qplnRrwZ0BNj3yZ7ZHNQW2q2aOtje
         EMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KipPv1O91QNMoVcObPn/ceKNnNQ2QL4h9fZIHkeF3IY=;
        b=mW5h12sS/BQe7QXgwSxRy0y8GjBGNvf3zsEbpTpTyXhHewO9/QasHulVcgVOCEipPP
         e+Ef9oUrLiQYZLWF6Mm2mg3e90WDNbi9CT7Eku9evL9knd1uKiVeoehxj99LGl1VKoFr
         k8E4GyAX2GXBzlpTI8EEyP/pJ5dXj9jLgx0AFvCwj2b9ukYwEXi02euyt/M+3JDWa9fR
         02fdNP/w8yDdH21+CFhbTKwCkhj+AKECQ7R3/e7d7G42YBnXHv6oHiyBIfavOxJzOy7x
         Px103BG5ct+h3nYEJpPI24GoHJ0eFXIjBeLEL+/5ZqfQFMAUV0MTdQyx9iv2WlPZa4jB
         tmGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8P6IXg7k+QEwQxofSaN2IW3ppTbayRiM31x9yH+eNhuo5Pc85
	SfwLiR2zonh8NOMOXv8Xssg=
X-Google-Smtp-Source: APXvYqzCGVlpz+0JD/uMFX09OKUqO1NCf8p6iP5NE/4YGHPVt1sIKFo2SvaqyFj5eWAV8MDjb3/vTg==
X-Received: by 2002:ac2:59d9:: with SMTP id x25mr4976405lfn.123.1557231814242;
        Tue, 07 May 2019 05:23:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:42ca:: with SMTP id n10ls1395169lfl.6.gmail; Tue, 07 May
 2019 05:23:33 -0700 (PDT)
X-Received: by 2002:ac2:545c:: with SMTP id d28mr16143588lfn.144.1557231813414;
        Tue, 07 May 2019 05:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557231813; cv=none;
        d=google.com; s=arc-20160816;
        b=I6y4SXfEW7iAXQBfQSdoArtaCwYhSEesB5SFY68BstpjPEkLPvbuLHf8cSAri1/Owe
         kQ4OeXlKYTAt4m/nd84DkEcQUVGTNErYXgnGTAg68+DDgqJA9C+K9ENU+8X9BPk9ujW3
         bCDYBOA0lGg3p9AMpKGqA+ZJqvKSt2xskt/vtixPnGN6x+0QNwtKRB/UdUNE6uT6FsBq
         EqSS/2GcLT9RxdD7R877uLGZH/nglGW8cXH2BCw0FvYiCGBGoP5Z09mSu/VUIJiqhT42
         U0sdUxH/ZmN59l2lEpbjCUe4DPYI+vBcQ54TZl4xzMgEVkRPsxUmrTuzJOE6WgTiaOFN
         yAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=ECMvRm758PMt6lCu3SehasKw0z/CvzdClvygB2Vbrws=;
        b=vCD4J7miAI/FN1Bwqq8Ak2ef4wWJnH3uHYhox5fPIWjOZcSqf14cA9bPawiUAqh7T3
         w3jGq+iCd5BXWgWpY7HMSnButeZIOHR2qEPTPSJFl/Rh77MtuzzTFIDsaiBD2OzpqUnl
         PKB415nOmbgApnvF6I7BL5Xbixprj4IcJ21mZiiesQW6yCSCwoSu1kxy6B4uSoXdo37N
         tKXSpuHy6PUqkxVnf9eOT4MAz1L9sxKc7HrxEPnxOea7J/ELvcj9FAf+ccc4bqRSZAl8
         bva6HIF7xsCUzw6jWBi/yCu783LqKlCPj3HpB/OtXXPotW1iJPtLa2BGWIL+s/uij1P1
         Tezw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p12si368860ljh.5.2019.05.07.05.23.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 05:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 44yzKc2nHKzy6p;
	Tue,  7 May 2019 14:23:32 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] Documentation: x86: test-device: document the test-device
Date: Tue,  7 May 2019 14:23:31 +0200
Message-Id: <20190507122331.19252-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.7.121816, AntiVirus-Engine: 5.53.0, AntiVirus-Data: 2018.10.22.5530003
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_1099 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

There was no documentation so far. Let's at least mention it in
hypervisor-configuration.md.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 Documentation/hypervisor-configuration.md | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/hypervisor-configuration.md b/Documentation/hypervisor-configuration.md
index 3e975a00..93fc30a4 100644
--- a/Documentation/hypervisor-configuration.md
+++ b/Documentation/hypervisor-configuration.md
@@ -41,3 +41,15 @@ General configuration parameters
      * configurations.
      */
     #define CONFIG_BARE_METAL 1
+
+    /*
+     * Map a second page right behind the comm_region. Access to 0xff8-0xfff
+     * within that page will be intercepted by the hypervisor. The hypervisor
+     * will redirect the access to the comm_region.
+     *
+     * This is a useful debugging option for testing the instruction parser of
+     * the hypervisor. See inmates/tests/x86/mmio-test.c.
+     *
+     * Only available on x86.
+     */
+    #define CONFIG_TEST_DEVICE 1
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190507122331.19252-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
