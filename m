Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXPGXX4AKGQEEC77CPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3A2216EB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:34 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id j3sf2632571wrq.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848094; cv=pass;
        d=google.com; s=arc-20160816;
        b=YwADkU3ShEYzzmXlexmmSHOGCMbsNYuLpx+VXE+aBJyo+VZcoqYDqn4FGLIo0P8FEY
         Nu6JZPZA3X/yX1clkw3JzHavt4zT4nrjN4lDHq7w146Mvag2EJuFqw/REwEnqH3PNTMn
         ebbxFS2Pl8q1qUOUTvwEazU9dLM3y29A/pYRGUDoJqxgThsdTOjWmgyJUI55tSLM9Q2u
         mCZ+9WyS9YHU7hv8hu8wpuCAFKALUT2Lch6mC5sGqdUptOU5LC4m66jHQD+7TZbylSRo
         2FeoOL1UH6dRNZPC0htMZcFoBFt3wDId5JxVO4v6IblSa43Jz82vuEZtTpzPxGh+OJbd
         RJug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KHErqEhtTvAYensvMiflxzS+xb24RrZUkFAnV6nBWw8=;
        b=VV5pHoeIXDpYBDK1qarSo4phOTMileByNzhiqwaK6tTTn01dKV8okDZGWHKcFP6vrO
         kJJ9X+xJAr4YBD8yvOQTSVcHiJZsK4um6KbOFqRJqqiJxtzRRw+TSvl60Dzwrk5VeJzZ
         sdOFGCAbZbFY1t/vY5E4uSUqVrDhp0IArg7Zlv04hu2q+JuYk9dFeykYMrSBQTzK8+F8
         xlIR49TKtlYXIXBmyuIjNJlraFe3k+dBQRyLj9Yk19Q/OPL7nRqOR3BdW5gq4KdgrEfm
         0CPzRHJFkfZ2q94bUVu4f9gXyzbRyyO/DTmBCqMAVMmkgQR5BSfEcIPnBn7+FU0DJsOg
         msvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BtNIxrKL;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KHErqEhtTvAYensvMiflxzS+xb24RrZUkFAnV6nBWw8=;
        b=nFCAqiwxqQmlofKX3kPg0RCA2mmBCWBk9+0gFWwMs8tZcli0tkUvqLu1cb/j7eq5TL
         grfbviAEVsCdBUrarRTVIUtdaevuKlXXa5ETzPu+vckdPpIyyhf6ETRGTxWw69WXbox9
         Ezk1wuBo7wEPqpE4aKgSMnbNVbVF+O0svxglNfzQ25zrYV/KLQNW90eH9G7t4BqFRCAU
         U9m2T6XBKMWVeYZ7qlNIcDRGdlV7+tIxiFc3pURC+9YNij2niuHHtG5vUs8fpBORaG5J
         sk9qsojK0lIkwFg9VZTOmuHKr3wENcDEzR40fKUzMnCQyYkXAOq8M8ygr0EERaF/TXom
         tIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KHErqEhtTvAYensvMiflxzS+xb24RrZUkFAnV6nBWw8=;
        b=Yi68CMq55vkTAmzVncu1lUp5rDlZFAnp0Aa+Kn8j/y9NW7IbDEYRTNrDWgmNM5RkK3
         jqzta7Qo8TsNaKai1u5hFIpNtDP0oD3DpByLPNcALZMchq4Shwpfc7onD2thf5XmlGPs
         88X4TSH5iGYh5uY86LaAKGe8XCqMufnLtPQ4Hvgg4Qq01uyHSRknsqfV/OSU3Ot2I61p
         LjASeF577qNWx/tIN6zp291cPUya4SMl+8sEFgmuIHLJcVfZ3kKE7S7F0qXE4vZne+48
         uuRlfbnaxd21178XTVO1lxbj88eM81l/qvXAE0sIYQynJWfDxDh8icj5cUE4RJdtI2iM
         Y4YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YcEq/Vtqb50rTrJbAvEIrGK6Sv16PYs8LH1o0GlA7R2L/TKn4
	BBOhs78UbEHYG9riwS1x0fI=
X-Google-Smtp-Source: ABdhPJzKFGjyN3UVYRF365ZfD60x2LGdRIOFaYV2perMnjUME5WZ2rlhK88BhgT9U5qbWt0QvvDa5Q==
X-Received: by 2002:adf:f311:: with SMTP id i17mr1518123wro.237.1594848094013;
        Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls1170190wmg.0.gmail; Wed, 15 Jul
 2020 14:21:33 -0700 (PDT)
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr1434967wmk.149.1594848093339;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=Al04sJTlKPcCw2xXEHaBgSAXcvZ2rUT639Shh5hz/NlOTFj4oK6kg5xQgmWKrt3sxc
         vQdZxZGMNiDXtroVmZe8zC+7wcZQbU9E5iSmfLDjqIiYSoBEWJ//pFgmAeN9ni4g1987
         ZPI5gDEphna15J2p/cjFAqtnC9G50mcXi4grt4ag/kCCRGpgbmTN1G5ShwLA8NtQz+o8
         2BPxR7pIjdU+FNAtDsTdXOLOGwzaUFDYQ5f4Sw0DpQPgn+bcTWbZYV5BPdOW/Y8rUHcn
         s7iPgQ1XYysyL/fcdcY+kOcg322OqewHX69e14O8Y36xuJvPnCh4/VGp4T6rhKN/MRzg
         NNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gKGAeoeHIloJxD7efJIpLBd+eAkcAO/Qc74/lQMdRDc=;
        b=MOZwYzKfdOXXPW6shouyklMomjmLpct18TrGnayPjy57pApyG/e9DvS+/DdM4RqiYZ
         aD4gXXiPBDrpQEbgnJKChG8rlD/FHPXGQMqAV6CCIeU5wclaa+/fKMqDRwfDGAl/BHSA
         PRl9oHghvbgEQr2c3K0p+8r0wra3P4ysRG4U5cgHpEXMk8u8Z8RGoy+92CDMvJnSAP3Y
         8gON/nTWjp0+9zgCp/cXi+X22x2AQLi4G6PHc7/OTbstg1ZEU701FielN+pOcnlyUdqI
         FWl17KyqDvViEuBjQs+HMWYWRosCPIb2T4LE06A3HYwcEFm7BxroPqEkjS5LJsz22iKZ
         gIYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BtNIxrKL;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id q193si166253wme.0.2020.07.15.14.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgd0Vlnzxyx
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:33 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:32 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 5/7] pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
Date: Wed, 15 Jul 2020 23:21:17 +0200
Message-ID: <20200715212119.48052-6-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BtNIxrKL;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Just like the array of 4 in the C struct.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 6ab769ff..a45aa7d7 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -155,20 +155,30 @@ class CacheRegion(CStruct):
 
 
 class Irqchip(CStruct):
-    __slots__ = 'address', 'id', 'pin_base', 'pin_bitmap_lo', 'pin_bitmap_hi',
+    __slots__ = 'address', 'id', 'pin_base',
     _BIN_FIELD_NUM = len(__slots__)
-    _BIN_FMT = struct.Struct('QIIQQ')
+    _BIN_FMT = struct.Struct('QII')
+    _BIN_FMT_PIN_MAP = struct.Struct('4I')
+
+    # constructed fields
+    __slots__ += 'pin_bitmap',
 
     def __init__(self):
         self.address = 0
         self.id = 0
         self.pin_base = 0
-        self.pin_bitmap_lo = 0
-        self.pin_bitmap_hi = 0
+        self.pin_bitmap = [0,0,0,0]
 
     def is_standard(self):
         return self.address == 0xfec00000
 
+    @classmethod
+    def parse(cls, stream):
+        self = cls.parse_class(cls, stream)
+        pin_fmt = cls._BIN_FMT_PIN_MAP
+        self.pin_bitmap = pin_fmt.unpack_from(stream.read(pin_fmt.size))
+        return self
+
 
 class PIORegion(CStruct):
     __slots__ = 'base', 'length',
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-6-andrej.utz%40st.oth-regensburg.de.
