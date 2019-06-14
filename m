Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBOGYR7UAKGQEHSOB4TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DA467D9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 20:49:29 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id v15sf684813wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 11:49:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560538169; cv=pass;
        d=google.com; s=arc-20160816;
        b=coNggKZ4//tozyStiazSq5TfTQ9xiKpShXZ9aQ7KivmQaxcJ/O41qgBgLV7o1o6dxK
         asHgLeyz1pUKNXgDTwVaRKBiqFQ3AyH+YoOH9eI4w7GoOXThDLiPgOfx+irwYTzSOcMK
         GHKaPV2UIkH1fz+hgvhf35AtE8z/5wi9cN7FEh449wh/yfztCKGqEqOLAfZwocn1Tqj/
         uXBCtGCiEkCZgtHdS3yLdHBvnNe722EkFAVbkB7Z+mwuuwZtyKaJpg5CJH7hBbuMCGKa
         Rcwg/pfPwpFGkeloh/o1mC/n/RgMUYLWy7TULAZwhEGVccspCUbhT32qArXtjVYvegZq
         wqOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=6JwDGi/luKrMpyVor8HvIxU3oiNoQhU9oIwiePAL2Fk=;
        b=CLfIAiRDN+05KXJdDlDSq9Nz4zD6lgTRIeasVdB22+BminPUrYqaYxPiYCWvGtF3QK
         AHZ/Pr+5tmzxvgzir+Zy28mqBw3+gLm3rJG39vvegYasGtinLwjAo/WuCKQS/tycyT4F
         zWGPdMxawbg61DvY3b4jkWMReVh8KBrMzR6yB/yM/9c3+UApeN8YRbptcWaqD1XAQ7ie
         3UWIGhZNWPRDPIx/P0XUd9s/PozqHn+iWYSr2uAwUN8binLM7JhUJU9VWbN31AcuiPIB
         HQrx3VyUmUW9wfZ/+e9cWSSTgcTd60QTJKnEM7VnemWe9qCB+NMBCk3zph4vf25alJAI
         pKjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6JwDGi/luKrMpyVor8HvIxU3oiNoQhU9oIwiePAL2Fk=;
        b=eCPGYdHzMAqTnTLqtrRBOr7Jt3mzYQF+8pIof8rcxMiVTPr4bQ0NNZr8pCnyWVv+n0
         jISIpZVWyKIREQLs3C7BsPrQIcraVJiw08Gt2LOM1ERPCSgXbsEQmbRJelul+1rPygo2
         IFCrspVTfWKV3GHaPWwrf9sGnSo/B+SH7bIeiAExdeZ/CZhv18uYwZwWHxvLUgMA84s5
         HZf9x+lxyZWTjY0SqgHK7l8xw6J4T6hS0OYYo6qy3MiF8RBFetfpQCIuOqSXLC9S4IRq
         KkI19sffMwpIqtnIyifjsm2kZEN7nEEWMHXfGijG8WhVlRwRZXPc4gFRh3mqflUjyXOj
         meEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6JwDGi/luKrMpyVor8HvIxU3oiNoQhU9oIwiePAL2Fk=;
        b=DDKLfG6LUehTic9oThu4XeAFWBVWZjKBbznxJ/IzyVHL6im2N38KjQ9Aa+WRQNZTGV
         xAF7kIlC0tiEScnQAYlKov/29HQsga/tV49q1fufa8dyLauhjzQ1ro1lS8fZhqvuhIrr
         RXxpxKujOa8PmfcOdaRd0gtKY4/rKNwQTD2MWmJM4rnhdmE+UXCutt6qYO4+6fh3cuzH
         hNXEfvEbn6uOUKIxLUzAkRlfTu7iSE3LFnVdlRVnIDaL4P7veZDLzr4CEHWYuL7nwRtP
         FKCVwCbTmvG/x7uCu6D6+/jmsKK72qIezJ0olu3U2TricVfsDpAKujrzW1vMwJS+PvyX
         Xkug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhJqXRIL4igPlHaHau49mxCmym0AtsPwOANjTPrPn7GBcVpvGI
	eYrIspH9EWlG51in8awmVuI=
X-Google-Smtp-Source: APXvYqysO7Dg7iorAEzOwIsdR9fHTouqjYe4X8xA7pQ2CKU8F9Fmj8ufqbjlhTpBnPzleO8jMDcasw==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr8831658wme.172.1560538169191;
        Fri, 14 Jun 2019 11:49:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edce:: with SMTP id v14ls2441769wro.4.gmail; Fri, 14 Jun
 2019 11:49:28 -0700 (PDT)
X-Received: by 2002:adf:c654:: with SMTP id u20mr5975011wrg.271.1560538168604;
        Fri, 14 Jun 2019 11:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560538168; cv=none;
        d=google.com; s=arc-20160816;
        b=ossMam6fnNNtOv5QqUmPzPhMPsUR9pr2OWf1WvJwfU1YMB9nmuMA2u2SrUHKl6MDyp
         c84FvyOmVY0ajb+m0AUuD2vDdGv31uz+e3o74p72NCM+rkkLRN4bL1PeOYuXljHlQo6E
         GiDjMKoJcA1JAXnbLwpMkg/LSokvoe76TQWkzkdDR9qmXcvHHEA3JO4/REjpJQDgeCIf
         eqShCtkTb9LBc/NGzcA0w29jo2sZPWGcEmjahFibxn8ggbCTQMU/mTB2gaYd+09aeHhp
         wUfgSDD+uNZxkiOxQUkBtzbC/TW5bDhTvhcuuSH+hHMaNg0A6biuFy/dd7ZpotoG/Rxs
         4vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=HO1K7ROkzzmAegt8buBGIcQ2h8FMu2BsnMT9j+e46tg=;
        b=GtpLgiq5eX4NnBcKIjGYZetZtiWXetHQed3qHnJlY29pmJKKiDeNgDdpAirKttGkQw
         xEJs6gfNoCFDa5vgEJcJOghL4dCNUXTWDiavuYZRh2vDPcfb1PFkVfsCS9UyqVTgApe/
         5kVEdgsuggMackuyynuL718Bg7I5ToVO9+nRLwz2eIkxdCmzZnbOipkwDNIxm5UR4mkZ
         bhz4TG4Gt4iYVuqHvH02/zmA6XBGuSl5u0bK7TrqbEHQ9raa3WTtDTNkG5huix+YhWAs
         D9Q3cZcRFb8f1wuX2t3C7Dm7CgWUSnFf1kYCvHwjbOcPla2ufmsUBEWa3ucLuOmc4hAc
         4XMQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id a17si196291wrr.0.2019.06.14.11.49.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 11:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45QV5M3sB6zy5p;
	Fri, 14 Jun 2019 20:49:27 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] scripts: fix comment
Date: Fri, 14 Jun 2019 20:49:26 +0200
Message-Id: <20190614184926.10964-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.14.183916, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.14.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_600_699 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

The file was moved during integration. Align the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 scripts/gen_pci_defs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gen_pci_defs.sh b/scripts/gen_pci_defs.sh
index 40fb3a72..480f7fbb 100755
--- a/scripts/gen_pci_defs.sh
+++ b/scripts/gen_pci_defs.sh
@@ -26,7 +26,7 @@ PCI_EXT_CAP_IDS=$(find_defines $CELL_CONFIG_H PCI_EXT_CAP_ID_)
 
 cat <<END
 # This file is autogenerated. If you need to change it, edit
-# tools/gen_pci_cap_ids.py.sh instead.
+# scripts/gen_pci_defs.sh instead.
 
 from .extendedenum import ExtendedEnum
 
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190614184926.10964-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
