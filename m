Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR4A6DXAKGQEMS423CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6D1091C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 17:24:40 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id p3sf137734wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 08:24:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574699079; cv=pass;
        d=google.com; s=arc-20160816;
        b=NGZkFOT5Z+PCIcPJnSanRmLp5w+x0v2wDGMg8ZXFCHz12u+eWRL8JUAYtN9DemJWXz
         /V3NVE/NN5VjwONeebfOwJdvpg8Kb3oyTb72XlxHXMhN9RZ06+7a7LYP35ATMEhxfpJs
         ynJYbGOi+LtvngtDMyUBdU6OZPan/IDklihAnZmAh57Ya7mkO9nXm0Xhjn2FwOcYqK+1
         Io0lRLicUSZN2Ye8JIO4Z33ET2Eg1E6hjNS3kp+1Bi92yUSEJH7SJvjFupHqSv5cOEJl
         zPRPgXUChL46o+grCYCVXFLPfZ6WPHQzjqW3rIYe9EOL/CTb6Zo7tMKgjDf/03tAME0h
         6esg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=82/Np2ufDMgH/2+KuyJuVusQB3QknAnSUxtMCrmKF5s=;
        b=kfc6oggpQcuCq2vVYY4en4JlWTvsvzQ1ZRM3mnHt6/8/y56ewKKjZUmhEbcFxGw5hN
         8VVqQDNa2qu2aO+MjBLkigcEOnIyLz2f1/edZwbfjVUruQOocMHi5tthlqg5F+Simzyk
         IpuPqT4w3FnO7UgRglN90GnJupc9O2QUVmmYVyxT/zZLm5VmOzaNd9p4ey7czf+BHylO
         +cQ4P7//7dEmsIWu2uIZNYbP66p9zOd1iDN1Gm8OYYcdkLP/NxK6kdw7xJx2ffOBPSnm
         d9zg47q+J//QZNflytkOcimAFs/Vmw0gTuscu+BAeExSd7QzSbnfwxF6BhtO/wXfssqt
         TfJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=82/Np2ufDMgH/2+KuyJuVusQB3QknAnSUxtMCrmKF5s=;
        b=hiif4UnVmORoEQuLLPItCyznw6jz64b0taOq5g1D6H2lv75ZG30CMVht4j1IQa+iY3
         +CoFx2ng2oTDdwPQoRAP1q7P2M/fjKxvfm3NFmLNm1pTAm3w2KlWoJQQbYzOS4TUNAlV
         4oP6C89rm40fzguz81VKEqy5Z+C4UdbDLyT7B7TezOsq7U4mUjdhQ2SlQsa6U3KD3Hbh
         xtRsvCjr3Z4h5O+c2qg/N2x7vbrZlALWlKump5DOgQubvT0c7qfjptnUXWLnr+xRRnnF
         +9hdT0CT5UyNBgycd7BScBD4MhFjMCWB4Xix3w5CMcaw5LlfeGu5pM1vtemDjl2PTj9s
         Vp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=82/Np2ufDMgH/2+KuyJuVusQB3QknAnSUxtMCrmKF5s=;
        b=dql8BnDkZnw2pHA8hGnWrz9IiIDQmH1PBBK/u/NqZqyvtBFPp13ZOQAdhG2Twnog7R
         YbgEo+iVVbI27sFtKIjQwkrDAY3eEJpGT8eNLe3cnPXAQ6mVNbCxVMFCV2gdOHPiWyOq
         VdP49laFKAsrYYC6ZyWWOcXY6xaEOHt+ubmUqbKvHeh9bi8tfJo623Dajp+Rr8AP7aaW
         SqXkG9ggMOEkm/W6ioA+/M9Fo9Xmj4SZIq+64OVCNOxpMdwzBsLWYcJa0hRDPeNCfW7s
         7dQa73HqgT7vZwbrPp6nbnZAuv9RG9oN4RTbEEQDUENKhFLYQtohvSWQVKnQRqAUtxDY
         TmTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9MNPHW4XZlQBIExZ0rACFzDmnIaNyczrY1+oOUNVYjEeQ6zsI
	z2ERplZh+3sQA7tQnIEGFbs=
X-Google-Smtp-Source: APXvYqwBb2J62MdAPcsL/yxUXPiyfeHq0PCtY9qAcQpGBNuSlZexbD6ieZVVt/wN7OGIQ3ThtiQrUg==
X-Received: by 2002:a5d:5391:: with SMTP id d17mr34701147wrv.382.1574699079731;
        Mon, 25 Nov 2019 08:24:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c447:: with SMTP id l7ls527899wmi.1.canary-gmail; Mon,
 25 Nov 2019 08:24:39 -0800 (PST)
X-Received: by 2002:a05:600c:303:: with SMTP id q3mr16379442wmd.43.1574699078997;
        Mon, 25 Nov 2019 08:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574699078; cv=none;
        d=google.com; s=arc-20160816;
        b=vnoN+nF9Qbhdp+bORtnFKc1tIL5NDlKPrR1tDdUACR1CapKc05j/ylEp423SAowPI6
         uTZZ94Ui9yaDvoPnKc+SuUNA4GkU/7nNQuoR7/WvdeoOaSNo5SAh4ypwI2OQQClzdLpj
         YPIxue81MSzhWrjM8wb9Rv88ThZOwQqhwYBRTpzqeeyvM+tIqLV6gZxa3GlhWFphsMe0
         YV02eVCV+ez308rRASrHvfMYSRSy8oXumuaYEb3qFVkirxGOYjn6fK1+dtydDtNoHJSc
         kGVRO2xuORwMqOnDwJ2/V4vyxLew4/OiWum+bparv8IN1XYMXE9T1IjXsofO7TVEHDiS
         xYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=a9lTQo3xkSeoNcR6LJNvpn680SdTeekmO99DX+szHZg=;
        b=pr6yI1gzVDplpjZq5YM50y82GLZebQfpx/yXrq7vfk7eln4fyogDl8rt7daa04+DLF
         r5ix/553goSRSGCTfpBOGs6t5Z39iDClnOrJIpMVDNuQnmXmJXjMWl3W6xp66TINLtGR
         0UnoPiooSP+qiqN9RitPR94IqeVZSzKZnp6EYwMGgPyEsoP+gxGCwA1eSjuPiddgwuni
         0ULsL8n9oGn+tsJVx4wHqeBss6VJ67jrPJcvW8kHRq7EqfKZoJzcpufRBGPNCJcRc+qh
         APL/FWR1WNojTwSw/9dBrxghNe75lkIaa6Y7L57U/09cQycXlBUY2lru60a6rr4kkhmk
         R9Nw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q128si273495wme.1.2019.11.25.08.24.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 08:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 47MC6Z3W11zyBV;
	Mon, 25 Nov 2019 17:24:38 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] tools: jailhouse-config-create: fix python warnings
Date: Mon, 25 Nov 2019 17:24:37 +0100
Message-Id: <20191125162437.1327636-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.11.25.161517, AntiVirus-Engine: 5.68.0, AntiVirus-Data: 2019.11.25.5680001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_REASONS 0, __PHISH_SPEAR_REASONS2 0, __PHISH_SPEAR_SUBJ_ALERT 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Python 3.8 complains:

  GEN     /home/ralf/jailhouse/tools/jailhouse-config-collect
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if ((options.root is '/') and (os.geteuid() is not 0)):
/home/ralf/jailhouse/tools/jailhouse-config-create:230: SyntaxWarning: "is not" with a literal. Did you mean "!="?
  if ((options.root is '/') and (os.geteuid() is not 0)):

Fix it. And remove some parentheses.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 tools/jailhouse-config-create | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 46de3f65..e746dbf1 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -227,7 +227,7 @@ if options.generate_collector:
     f.close()
     sys.exit(0)
 
-if ((options.root is '/') and (os.geteuid() is not 0)):
+if options.root == '/' and os.geteuid() != 0:
     print('ERROR: You have to be root to work on "/"!', file=sys.stderr)
     sys.exit(1)
 
-- 
2.24.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191125162437.1327636-1-ralf.ramsauer%40oth-regensburg.de.
