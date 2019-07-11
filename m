Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3NOT3UQKGQELFHIRDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44566064
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 22:09:17 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id u19sf2004620wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 13:09:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562875757; cv=pass;
        d=google.com; s=arc-20160816;
        b=GIephDBXd5WWL3zB7M+33dp2y9gu+3MwraqL8SMeorBE5ATmp1rJjbX6ipX8luBVBB
         z++BnwJzl8g65AitteTD2gVpOTdn/oxiu1oQbnaOW1MckjRM+Wo1vRbKxhw9XYAf0zvm
         3vCm129Q5FqkAkZsD3Yt4z1GgrEOQZQ15xpgdwD2H7W63t1uAUkFya7RkqX/VbtoY0Ar
         b9KGXE3Dswd6TUAyVO1X+XvWwaZ36ROZk2wfd3HeJ2R9DNVVHge+tWPnXxPCkmKgqqjj
         N2y0hcnvNrWC0hRNf2RrAyDYTBrcLzPqd2m+wVgRc9f1B1bgFMqJi3Vs+iYdug9f/ajZ
         23Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=PaDlUmKFt4nNi6KJGdcWVh6DOLDkowuVCEUyJO1hAUA=;
        b=uKPCkiInAhidRbs8lxF5g5oBRhzvBXQwgw8yTKmXGKWD3BjRwRwifvqT738ENgMkdv
         C2t/rrgN/JwpUwKiMms1ZObqXNRJMa6jQC0jHX8ZIVh5ObXJP8dY5YHstGJcK4jBy6WD
         rvX/ZxGSASz/vBZrg1kFA1k3bYobPUtDuK9TjOCpHukuo16pFWiMnng/t0N6nKOBFjd8
         cN5aArUxIK/sHbZC+UUbnQnW03JWI8XJ0EoaiElJMha/OGPFEcVaiNSXPIC2Zlsjk40Z
         dc+lryHm/UeR2oxccYxJCnc9/4o5uvAnHK2dhUkFc5BK5AnD23e6M6Z9inHYnF+mKZoZ
         7xtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PaDlUmKFt4nNi6KJGdcWVh6DOLDkowuVCEUyJO1hAUA=;
        b=aK/QKmmD3WGGHGD7ImhqyDr7IWHG6Fuisk+FMMO5eZK7mbmRgzLn4i7VykyA1ZMhtK
         FqafXbjurtJSxV1BCZ3e2LHwNKGAXBaM0Pov+1FrDEwAqGtRz/flTwwIBD1Bzfd999jv
         m8PpTjONRAYWwiWwIXEqnfjI/Nb1g2XTvu+09O/3elwk34I0cbR6mMvIFAtxQxewTe07
         thRQAxHAJm8iiYEmS4O2lfU9OTqqG52wFveGOdvLWD/Ryqsf6dczBJWLrTqcvzzVa8EW
         ymcmvQLO0HpuI8zWRnSq4GMIIPeegw55/lvZTxOzYaU+cKOK1Mt+hUD5SPYQvVWGX8Ax
         SyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PaDlUmKFt4nNi6KJGdcWVh6DOLDkowuVCEUyJO1hAUA=;
        b=nL6qwGilqU+l5eQbyPcYV6bGAdhEmVX/A5Xdg/XCaZS/v9ZuVzCH+5SlZOmRUihGeR
         PlJZUnKkuz0N8w6XP4qwEYkRLGPn0Uskzq80/nUiGCtYhPNONCkGIxYY6GjHuo8+HQ8X
         uwKFpf7ZWEu7M99h2ae3YYwgaCt7J+j2D1DdBu2b2KMyJW7upgEKgnuf9giqAK5eTm/l
         7mGSC55riJJhm5CZ3lTcA4185Ok4aHQ6ZUkX4NyHsZJ386iv0AkUdddktCDdp2Acafym
         iJR7qig+TUe+keLTqsHLRRd+SHwP5tMkPb2+7jz9sa6Ww1/x9MJUcAzdYRC4hdZ+m+j0
         o3yQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLgyWZ4Gy5/E8dBtZhbYdXXAN6bVqQIphIFvhBk3DD/nqEw+Fv
	ivrIvzj8yDsDLeYu1/n0+qM=
X-Google-Smtp-Source: APXvYqwhIU3coGiTMQaxCWVmTeM4u3DMHvtLE97McJyP7/uaHX+WEWDFS6Q5ramZCRym4CJ68vhejQ==
X-Received: by 2002:adf:f088:: with SMTP id n8mr6755242wro.58.1562875757551;
        Thu, 11 Jul 2019 13:09:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls2317142wrd.5.gmail; Thu, 11 Jul
 2019 13:09:16 -0700 (PDT)
X-Received: by 2002:adf:df10:: with SMTP id y16mr6957639wrl.302.1562875756978;
        Thu, 11 Jul 2019 13:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562875756; cv=none;
        d=google.com; s=arc-20160816;
        b=qdveAvcDSRUWfOE33x9JYoUBNovJ59d2tLElPNq2ooHOf/GZhimafJvcpnFOeI8VWw
         a2Tsv9mEQ3V65gYSLcWusH9jJZBEyJTt3f/r44UYUei/b436K7XmvYKCaOUuUE+3qHy/
         83i3goqSJ1huzcTLsfLz7xDC8OJOqnOx+qlmuTDDVrf/1MHJ7pVD/P79QDLKeJgDx+Es
         bRvV/uXfntlnUBOIiXmGveEfW0GyC30HWKFlpT0IzZWMh/isb9HfTRnOLHNhdbCk//YY
         YvNETpKIW50X6ORLem34qHkZRLy6kucNHUt2IKkd0jzqRjC10NJJtGkG99estzdyTuIM
         QM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=FBGkhnjo6NDOKr7gHWYmCOfMAPUxoqvzNrDdGlQRPss=;
        b=KuJ3n3cic53umgEE4xM+7n9sYAMT3VL6mTQr1UneIVjQatYEBROr8FA+ib/oLQeulZ
         lyzzFn13cfwO17Sds13KnhSDkv79WBtD6yXV0ADG9ynj+AJKPFUk6MOtxbUF6NfMMHmt
         oa3YZMBNGZuSxu/KA5NC6u3dm+TnYZharvOBd9wXyCoWTkb9nk+MvXr3p5MrkIZ2GhD6
         Io9AMwXoJtMCk5G/cEHM9zKAhaLReqMzvSNM/MHlTqeBoSVuzQxDxh3aT+Qpgb3h6eUp
         lMLAhsYxIZV2i360wVRfF8MmkjyqUJfmGoYJ+n5nPnIRoAUEO6mq+h+yvWFMXh1dCS1N
         4Bqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q14si386755wmc.1.2019.07.11.13.09.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 13:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45l6b02w46zy6p;
	Thu, 11 Jul 2019 22:09:16 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] pyjailhouse: sysfs_parser: Add more precise length of some extended caps
Date: Thu, 11 Jul 2019 22:09:15 +0200
Message-Id: <20190711200915.21217-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.11.200016, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.11.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

I often run into situations where Linux tries to write to some extended
capabilities. E.g., Linux wants to clear Advanced Error Reporting (ERR)
registers when probing for a device.

At the moment, the crash dump of the cell is hard to interprete, as it
remains unclear if the access is inside a capability, or if the device
just accesses some PCI config space (e.g., accesses beyond PCI spec). At
the moment, all extended capabilities have a fixed length of 4, which
supports the confusion. Four bytes only cover the header of the
capability.

This patch calculates the correct length of PCI caps for the
configuration file -- at least of some capabilities. For some extended
caps this is pretty easy, as they have a fixed length.
  Nevertheless, other vary in their length. In some cases, it's pretty
easy (VNDR, ACS), in other cases it's not worth it (VC, VC9) due to
their complexity.

Caps that aren't handle still result in a length of 4.

Additionally, switch to a hexadecimal representation of the length of
PCI caps in config files.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 35 +++++++++++++++++++++++++++++++----
 tools/root-cell-config.c.tmpl |  2 +-
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 0a690186..a21690db 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -655,14 +655,41 @@ class PCICapability:
 
                 id = PCI_EXT_CAP_ID(id)
                 next = version_next >> 4
-                if id == PCI_EXT_CAP_ID.SRIOV:
+                # access side effects still need to be analyzed
+                flags = PCICapability.RD
+
+                if id == PCI_EXT_CAP_ID.VNDR:
+                    (vsec_len,) = struct.unpack('<I', f.read(4))
+                    len = 4 + (vsec_len >> 20)
+                elif id == PCI_EXT_CAP_ID.ACS:
+                    len = 8
+                    vector_size = 0
+
+                    (acs_cap, acs_ctrl) = struct.unpack('<HH', f.read(4))
+                    if acs_cap & (1 << 5) and acs_ctrl & (1 << 5):
+                        vector_bits = acs_cap >> 8
+                        if vector_bits == 0:
+                            vector_bits = 256
+                        vector_bytes = int((vector_bits + 31) / (8 * 4))
+                        len += vector_bytes
+                elif id in [PCI_EXT_CAP_ID.VC, PCI_EXT_CAP_ID.VC9]:
+                    # parsing is too complex, but we have at least 4 DWORDS
+                    len = 4 * 4
+                elif id == PCI_EXT_CAP_ID.MFVC:
+                    len = 4
+                elif id in [PCI_EXT_CAP_ID.LTR, PCI_EXT_CAP_ID.ARI, PCI_EXT_CAP_ID.PASID]:
+                    len = 8
+                elif id in [PCI_EXT_CAP_ID.DSN, PCI_EXT_CAP_ID.PTM]:
+                    len = 12
+                elif id in [PCI_EXT_CAP_ID.PWR, PCI_EXT_CAP_ID.SECPCI]:
+                    len = 16
+                elif id == PCI_EXT_CAP_ID.MCAST:
+                    len = 48
+                elif id in [PCI_EXT_CAP_ID.SRIOV, PCI_EXT_CAP_ID.ERR]:
                     len = 64
-                    # access side effects still need to be analyzed
-                    flags = PCICapability.RD
                 else:
                     # unknown/unhandled cap, mark its existence
                     len = 4
-                    flags = PCICapability.RD
                 f.seek(cap + 4)
                 content = f.read(len - 4)
                 caps.append(PCICapability(id, True, cap, len, flags, content,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index 81d3a92b..512b9f0d 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -199,7 +199,7 @@ struct {
 		{
 			.id = ${c.gen_id_str()},
 			.start = ${hex(c.start)},
-			.len = ${c.len},
+			.len = ${hex(c.len)},
 			.flags = ${c.flags},
 		},
 		% endfor
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190711200915.21217-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
