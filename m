Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBX576D6QKGQEDHPEECY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 625FD2C16BF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:28 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id 205sf6546209lfb.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164448; cv=pass;
        d=google.com; s=arc-20160816;
        b=X0b12Nys6p14naoYGNPTEDQH7cSLTZPVrKZPv015+sAIl1LbqLcBIIy0zBHZwa6yDd
         ncNiDl5m2hlGmllF1Lfn/EvS+B8g6wMAkNYRvV5NXtf/16PhUXuYCmpVDslBJE87oLxA
         qvDqtObEZ4pqUUk0EraVcCmtZlaFl1fbgEE+I4mVcs60xIOw27LTDyqftjoOthgPU/tk
         GB1TmYRDEVFwEgX22GOKMleMFcRuZ2GW7ZCF2NTtromAkOra7nrhTWurJhpbYfbOFAKo
         Dg8pLYS/nhFTgA4jRtUbi8/32Cn3acEJO4gs7A+6MSnKhDaquhg36SVDbGzuoJvD4U4p
         PTyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vSvpkvc0A0N6eRnQIOis7oSo+LDT7G64/rbMzSYHvoU=;
        b=vkqJ1RPCpYq7mlgV1cJbhCUECkVpH8IhpNABD8UZ7qongHBQrW8iyIx0zXhAqBcbVZ
         /EKTnbm9yWDbnrbFKN9Xig0P6q10oVcsZXzcQEXSsXRLlOqIjutCHJUyc6An9qkOWNs0
         xfSxTkp0Pbdg7TQChPJ6K5mtAtTIo2/PcYfOfEyXX68/k8Hw5xix+GNdUlzD5UWGvpqG
         A8oEUcgZ5YYuL8p+qj/VL5TLDJc5bezuprbOsGpawPOaIFHG3HwsD/qxNJADzLE3/BEQ
         BIu2FoTX6x9MrZcEG6vvxrI5TSIt0LddI7la8Bf0BV0naybG6Ao8Xt2DYq1CQSCVo4xA
         /SxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ny6VN4Qo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vSvpkvc0A0N6eRnQIOis7oSo+LDT7G64/rbMzSYHvoU=;
        b=XojBf9pBE9f61h/KIKrmBUMnqn8OtfUm6NGKVoZGp6X51L3+1QKAb0wIcifw6Wdtud
         YvuBUCqvAhnAruOvLewb4y62aj2MbJrG5346gqzK2Y443OF3KPKuLz68Ceg4Gu4/4Bk+
         1d84Oufw/1I1UOF6O7wxk6MzWx1DN6HbdxPyK61icjRROLCtlLKEzi1kBYL316A3lxC8
         DyYvg4QsqeQDC8rw3fAcvN9a2t3ezIwLtGQ1jmNBi+SSTW2AJ506Hylt7bnkMD+BOFeg
         uq+wc6HyTDvXRVv+3SGnAgEbcVuK7Fb4C5fCv8eBsweTe2ltxSjRlNINiCXYIlZEXTRM
         iLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vSvpkvc0A0N6eRnQIOis7oSo+LDT7G64/rbMzSYHvoU=;
        b=HYNfF/eFy/dGUSZ+TM/3uOndyYSzuupGI7+yQisunF8uCeQL+1pVpdZT8KNUATImpt
         BAjzmoIsrbCHkJZSazmtWpJJtjbATzJejQ+QbqVmRK+WocWCh3gmsDJGxWwlwqyEj0Qv
         qWCwn19eOxvsG/+CJXb76Bm6QTdnuvQifw6nWo0SiQTGJnwljCsKD4Hc9O19uOOzkGFX
         8Y7OxfZt4ci7CQu86cUqGtMc2WYySiOKkMpT2nMoAgi34YHlV0mGZ/5ggsqUTOeCAC89
         WCWiDvVXmvQ0NzYRuFaB7/nCjOt4mYH0T0mw/sqnwZkUtsGLz/hOb45WHOyFtz8G9EZU
         p6nw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533BWFBowzWiFpnT3izLs60Z0CKxq3/5bVc9Z4uNwSyPrZwSlU8P
	cfxBbh2TVaZow1Z9upF4Cg0=
X-Google-Smtp-Source: ABdhPJydo5syD+EtFHoWkZdK8jKyx7WxuFiaryCYqhzwy5W4IB3p2doeejLF1byXNqR2Y4NqQ0Ma6g==
X-Received: by 2002:a2e:855a:: with SMTP id u26mr527039ljj.0.1606164447829;
        Mon, 23 Nov 2020 12:47:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b9a:: with SMTP id z26ls2355263lji.7.gmail; Mon, 23 Nov
 2020 12:47:26 -0800 (PST)
X-Received: by 2002:a2e:97c8:: with SMTP id m8mr433650ljj.338.1606164446738;
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164446; cv=none;
        d=google.com; s=arc-20160816;
        b=QLfP0hbe+b0oDDKBOkPOiSwOOgOk9xuKgxThGToEAwAVPnYdI/5QMXsBjLYsDuI+o/
         JXcsFBsQAMNfUm6j2HEcLLeofHdMCE43SvkZMCcqZE9FJ7tlhb6V9A7EiRYsA/sjXRDa
         nsLBH+cbIk27UEF5LWPcdlMdZ1yvt8ZFA4zv/nCfocj1zA1li2+xi6aEM8XAFKJ45Xon
         9rlvYkBirZ+lJ8KMMv9J+7XqZx8J2qwxkIYN7x6+bPp5Zib++RoNxC2bYOl+JMYO1ACL
         Pf96XoaDKwwGD3Nkuqjk0TisUIXxSI+bHBHtWIVLoy38Vv3vPSm8+4C9h6J1+h0DYq8s
         HTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rjY00iGLJ2WN3mn9jsBFGNrJqILLqzXOQ6LwxLiOnBo=;
        b=cN19dUliNqftQW3/jmizMR49r6b8Dlv/fRwSCTWKuz4kqf6y5nfCZtpIM1jij8RLNw
         rsGxs35FssMXQ1EuTrgTENWIxi1uORb99SmzuQiCJi00Va0vS+NaxBzRQQY0dsV6Akjf
         ATnRfbpcWk8yoJc/DEhKAL44EZVOlJ+SLhe+4EaFR63jXRX3a5PhyqxfWx8fNxTWWtIT
         JQmmohwtazzo8V5NAIjDDYjDwCdx69TgDEAH+okkXi28mYKYAafgwO4NzBnynYaLYoGf
         1o+dT5qBFIamF8WXMi/BcYihE8Gy1KEjEwRPO0CW6xwvPC2fX2Fj2CqOOFPJBgHyYUTl
         T96g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ny6VN4Qo;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id 23si203797lfa.10.2020.11.23.12.47.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cfzjp1gcNzyTx;
	Mon, 23 Nov 2020 21:47:26 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 0kFhpHqgrX8U; Mon, 23 Nov 2020 21:47:26 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjn4ZzTzyTs;
	Mon, 23 Nov 2020 21:47:25 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 14/14] pyjailhouse: add support for colored regions
Date: Mon, 23 Nov 2020 21:46:13 +0100
Message-Id: <20201123204613.252563-15-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ny6VN4Qo;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 pyjailhouse/config_parser.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 47350c6f..3f11946f 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -52,21 +52,23 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 
 
 class MemRegion:
-    _REGION_FORMAT = 'QQQQ'
+    _REGION_FORMAT = 'QQQQQ'
     SIZE = struct.calcsize(_REGION_FORMAT)
 
     def __init__(self, region_struct):
         (self.phys_start,
          self.virt_start,
          self.size,
-         self.flags) = \
+         self.flags,
+		 self.colors) = \
             struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
 
     def __str__(self):
         return ("  phys_start: 0x%016x\n" % self.phys_start) + \
                ("  virt_start: 0x%016x\n" % self.virt_start) + \
                ("  size:       0x%016x\n" % self.size) + \
-               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
+               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags)) + \
+               ("  colors:     0x%016x\n" % self.size)
 
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
@@ -84,6 +86,7 @@ class MemRegion:
     def is_comm_region(self):
         return (self.flags & JAILHOUSE_MEM.COMM_REGION) != 0
 
+	# TODO: add colored versions?
     def phys_address_in_region(self, address):
         return address >= self.phys_start and \
             address < (self.phys_start + self.size)
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-15-andrea.bastoni%40tum.de.
