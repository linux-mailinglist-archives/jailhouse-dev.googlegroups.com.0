Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBK7GXKAAMGQEF6Z7I5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2F302495
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:47 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id k64sf5798131wmb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576107; cv=pass;
        d=google.com; s=arc-20160816;
        b=GwRxaZzxewZVk1GsELy5HDzy9DHoTlEW0H1GQL4Fgm+OSIrxtLl30UWVTiapQHngDM
         LtHWyRN2NZ+SINI4KkxygqbJK+dJFw8+CFOzdXOo0jHo5VNS70ZYEV5HfTVyDuEiQ6rA
         kP9Fs/sd6HHUMnVCmlClQhSu8tAd3FwBKX7x6DEE/0K4L2ZbCKYoq8cqyalKbKPRhVHG
         FnJJ8brTWvIRo3uu00kmfFDtaUUCoC0ltH6l+mjUqhD1SEB7K8Rzig6tke+pe/dIw8vH
         RQsYCyMfrCAQBlZYlRqTLjs7kk1xmYpAAQq48Pz5DaJDDwX1bNKjJI1LMepSHUmUzKWl
         8urw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=SMZJtAcBxlNZrDAJOyY39ifImwghY2oCV14+y5RcBwg=;
        b=CgvEQMNsD3utH9ZwR2aFBxIw+uBA7dNRWK0cXpm2Up15AAY9TJN2jvosaRfgZoCImd
         fqzRy/EIDdtLnHJ6hlP4FzfX35Ha0QMFTu5pV17sZhZl3rsfCzVH2GM+pWJiM0BL7Skh
         zrfermW+tRM3RGwo8cS2oI/ru4HEhWT8SaYqRhlnPJdqWDeeZLpAbA9vaAweW3uSFn8f
         Gdwk32smkEfGrRJqtu48aNiSaBF8OJqmrwqOOhiPcWH0obnVFoY8l/obn5w5eWLbgdrT
         oAFmrQkJSW4553Dtvd0SXkfli97TfQ9RNc7Kwa9/s7StS4ebDfHywnHmVJLDj9/NctMf
         simw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OQG4YYaz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SMZJtAcBxlNZrDAJOyY39ifImwghY2oCV14+y5RcBwg=;
        b=TM74UC/c+LGePi2Sd53s+mlT6c8r+HytFItH1ezfvoVmQDcY01liRkXWXJTKqAYhtK
         KdM7F+iIvFxgZ3KTpeLa4xWgRHRNv9sBbPTHgLCdI/K1Q43ZNV1tGjMPNoyPhAh9egu4
         A2BauTWvGJI41QFKJ4Cf4fkNUuhul6drWih+fqfECHo6qWpZzHiUA2dj0HvlblYsXala
         7kR3e88BYfnJ0+24EukSz0U95SJq3pcTsMr15fx82iXspZjZ5hO6ElgMDrzOSRZHLQ5+
         sZwQWa2YYHNA1t49v0JkqwbWI2WsMfJVNo8QUulg7+6l0EIfVZ2UEb5oxfU6U4gFS+Oi
         +Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SMZJtAcBxlNZrDAJOyY39ifImwghY2oCV14+y5RcBwg=;
        b=f8pYtjYPtf/JUNeLyO/OyrAsIIdGw5FQ0FiYcAL66Yj2jjY7+TWDPz0/L8FAELF/S0
         F1ju6ZT+gA/fLgbMRpwmPHJAmEOBrth44Wo8AuV5dBXv40QGn7Sr5bblnw/bNEq9sbrw
         1ijgxhOh8dAIS+yOmg8tnwua4dxlZCYYyLSR0yMmUXeoNJ3pivcmixiZL1LCiZmOEk36
         wXEwoFsTJvYg3G/ijDHom1LcXN13Ccob34diJ4B+SwSaD34darjKad+0fUfvkuFLsPSI
         AVDgGi0PkH+Ik5ng43NFXGyrBJcsqysWv3gABDazlPu0Zvs/wMUk1kudt0UO/UTu6boo
         cbOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531LK81nP8FkJ27ey1DBH1WL/7JRlSbXL8kDbLYYUv4KqgAKOQVz
	veVjvHzMLhP3W7nuCcp1Iu8=
X-Google-Smtp-Source: ABdhPJzO0ph8Q4ZCWnKCbp1+DO4v2eJddZFc7NBQ38GfRaGMo9mn6G+5Hcy9+dmbJ73UFs/iTpSaKg==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr535491wrs.217.1611576107695;
        Mon, 25 Jan 2021 04:01:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4485:: with SMTP id j5ls97825wrq.1.gmail; Mon, 25 Jan
 2021 04:01:47 -0800 (PST)
X-Received: by 2002:a5d:524a:: with SMTP id k10mr575764wrc.394.1611576107066;
        Mon, 25 Jan 2021 04:01:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576107; cv=none;
        d=google.com; s=arc-20160816;
        b=SNsJzWcWi8iCrJ6g+Rq8FRSmRPvcp6XM6yCHfLiuTVW/gbnLzuXYGkiHS7SgZPls4Y
         TiU1DhLP4XqTjzNc6Fwrn/RwVRKAKGSlbJDcaqYAVhGrCC3f/l5CqghvdNlAB+9hXDqX
         W6dzFGLsbpPwyL6U73Jl3y6WECmknE9VQ/oiUZGAwAhLA7LYfrkDq+vCqGlGjQ06Uohj
         MsiMKjKTvmGlmr0actRQa0XEC5RuOb1eVewyRh+QzNQ4HzXqcmGEFwBGkL9AONnGX0+s
         VLF4X0/W54gbB/fVIE3OI8/1anb3Y2OQkrviugyriEyr19iJGB7SsiJO0qnilcJ63t7+
         TTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tUUzBA4t1A+4P6Ea4wAO+NztTi9wk5gsVXYRuGWuYnE=;
        b=SMgbbKodmjWmoYJOKTX0e2GZXdr1Vvq7DIaHLvjY17VtwjL9OGxGBOLOvwMejJs2Dm
         y1AMHTyJ5Dwjmtr5l56PeTHuqUbtT6zUfq2DTzjfAptZdhFiHfic+yE8j/3o3MFH55GU
         Ql2cH3bOkShuLPCzWGHlW49cOsOeaLIprUTiHWVGuH6V9+GtMD/nHjQ0hv2I1x54bjmy
         loZLOXemSHe1NJsvZRlonPKS9EsaglTcgYvdvA8YYC32PCH2WwVExZ29wRGG5HjF3ND1
         v8k3MUjs4DXHvBHe0VpS0E1EQCfwQvGeHyHuM0UHXBLLFEEs6Rlhw+6J0kyAvRQDUnBT
         e32Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=OQG4YYaz;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id u24si805446wmm.1.2021.01.25.04.01.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:47 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4B6Fxhz1081;
	Mon, 25 Jan 2021 13:01:46 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
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
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id QtHLPwhSojPG; Mon, 25 Jan 2021 13:01:46 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4B1hzyzyjw;
	Mon, 25 Jan 2021 13:01:45 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 14/23] pyjailhouse: add support for colored regions
Date: Mon, 25 Jan 2021 13:00:35 +0100
Message-Id: <20210125120044.56794-15-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=OQG4YYaz;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
index cad761a5..b612f98e 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-15-andrea.bastoni%40tum.de.
