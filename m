Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2V55P3QKGQECIUOPTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4BC20EEB5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:51 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id c25sf16233490edr.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499371; cv=pass;
        d=google.com; s=arc-20160816;
        b=vWQCxaN5k5KqWK6Lh3aDwGVF2S0/gw1BUDHw5Ee/YSyeCAefY1ixDmwEA9bPDTb1Mb
         umps+AVIeKc661TDHsTD6zxBDHpbAJjNSMzlp6xG94D0OrpaiaJ4vN5rQUw8l4zu/n4+
         /wx75Fi1bBJoWzUMb2IA38MBjpMwRHcFhkKFYPe+0B7jOJjhp0Hw5ZNsZ1oVRfygbFU/
         i+mx64MRR60GuoXtSDGgNOC+tpjis05TmjaKNUA2xOmdFwW5XCxtbq/JA1mrDHRhCl7N
         /5DOwc80/aC2LXApI4b9r5ILrIku7jWVZymwFPmn7MyZrXaB3f+Qehmh2tMMhRHq7BEA
         eCaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=m2H55MLjeIeZ63rOjJelO4/sz/5F6A3GI8L2dTzXeLI=;
        b=as5jpI4M682Q6U17qZb2WE+IY19z6MXP4DZ7wifWR0WtsMDS0PqIfMOrs5cZIS46LH
         NOOnt2KjRPM07EmJEfIbk7Osx4gCzrxstu4J0u53+vMaYtzAl/QayR0LEjXESfD88erp
         h97ZhV6sxTc3sCm7Dvh+Ao3Rs/VHiy1tWvvn1ASsZq72/vWK9ZRsfI+Njth6YpHdS3fE
         6Y0JwC825FeOunwtMCIEwV9kt16VYYWW7ciEH+O9XavoshMGLdjkb02RioMV4BmXTRfh
         cqHM+BxSkDDoOpDcf9Prk/Elw84eWRPlU0wojjVnklHERE6QAZIqsM8p2vlO5ftBDu49
         4rgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=MqqsWllH;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m2H55MLjeIeZ63rOjJelO4/sz/5F6A3GI8L2dTzXeLI=;
        b=nqCMkj+cytozE04AtssC1hq9r6S5DxJ2Pv8IoUuCZ8vK43Tas4XpDWslzKezI4z0tZ
         E8FVvQuWqryrviVHfhP67m7U63EnEEJ/QI0gVfg69OA7RTkDhmBXUHLiD+kuxf7nkK5J
         zkpw2zDtOuom7bBpeeOmENcx1W7HwNpFlWY/0ViHUPMZ2D8FGxjj6bDasKUGcmLI0nq3
         sgivOJGbUVbg34xrtvRFPllO2oDkEjn3sRoxrB0n011l3GxLbmWGekHLDCv/MS3HUxb5
         3AzvaCctVF5hRdVJ0rsgb1xgY7Z0U3YwYUaUGcu7uboFhRRKVjW7MTYJhUR9zxSmQWhb
         MGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m2H55MLjeIeZ63rOjJelO4/sz/5F6A3GI8L2dTzXeLI=;
        b=X0yzBX4Ktxh/xWDnJdLMWOybJkryQ/Hxwrnf2PAaCPVM5pz09BipBsa2RdaIKfsXb3
         iTmOGnb9Ota5jfYXhednytcToiGQu/2l68pI1gcWxkxY9fCv4BZDUJtI4glNcIFB5UTl
         QLC+i3kQajMhxjtf3IEhnu8iKMSCptiHMxoN7uFGBtJF48UF7Mi8hH0tXhKxBrg/NOKY
         D6TwDfsKXjRfw+fyMldK5sRJczKuC7/HqySPZimObZCQRahZEZmRRxocI0gg67WDoHOV
         pt9Y4i2RVEjP/npmjZ3TxL+rHffUfTSsdOAXxgbqUvdYTB/OyUSkgyBA04n+wpy5TKYP
         LsXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ktm6br7W7rrz+NXBPifk2rceIW7Mj0lcFXGD3m7ZcD72vVInJ
	KSTS6vhZwyEOyM9JuUksZA4=
X-Google-Smtp-Source: ABdhPJyj+lJ6mNWJRLK/O2rB2wTYFm7ppVbqpZahrc51bj/TfcP6rNHIbyh9/z0+ivjVt6SH1Vv/Yw==
X-Received: by 2002:a17:906:5502:: with SMTP id r2mr15254033ejp.316.1593499370943;
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:b2cd:: with SMTP id cf13ls5888038ejb.10.gmail; Mon,
 29 Jun 2020 23:42:50 -0700 (PDT)
X-Received: by 2002:a17:906:375a:: with SMTP id e26mr17716884ejc.324.1593499370295;
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499370; cv=none;
        d=google.com; s=arc-20160816;
        b=Lx6Qp1tAVaQyk4vgxjCDFC6rewX39PcG31jv5xOGiYjUt3MTSxQzdYffWLvBOPMQ/3
         g9YyEJfeidc+3rtdjuEzZSr1s4tObJUCscg8qv+WjBoTUpzmLGpdkwIV/oN+ws/i6PeQ
         illv9tTxJYxGUGGzyxgoIJSTynHTjv0Asbb4Kon2I5kygpkUSOhK37MbC0/LDG75zGvz
         5O9G+yOJiGyd5QiZCC6UQxj5Buw/66lTXNUbqRSEq6itzDIX+PK8BqlBtZdcbEQFNlLp
         PYbWoZ7TV8+W7jPj90IyLltBj/hV0rIMeV0/F/xlOCuCHwEvczSlPOjgHGmPhCepYTHR
         xrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WQR23+JX+ngzirkC5sATbcPpLUlYYpjIocl3HDBfDQg=;
        b=vDnl9kvAueXD8gAgpSkfweM1yu+4k68dYizU/mlxdF7VGcmPyF8d4IJkQJO1lXhj7h
         WQbWk2ABqAG0450+oAUm4xqmbyyg1pUg64ciBC8vrsmFsSzUG1u3k3llsy3apC3QyH04
         g6nr3yjOxp82zPtguVLcgQixQBQZzwpn9MTA2aHdmWO0963AArwFKWsG8zQp6LqmufDq
         xQhU6XV92AoodZmVgD/ZB+mlpG4GTRQhOYwc3vvsQulczmm/NufnCgTjyzpQVpeVLFcQ
         hcw7ku98ihLgCF49zl/Z/1vaeSvQ3y6dLmX0crWLCrUJAMkG3sN9Zyfk50ywb8SjG2En
         7eEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=MqqsWllH;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id x14si132876edq.2.2020.06.29.23.42.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49wvtd6Xrxzy7F
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:49 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:49 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 05/11] pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
Date: Tue, 30 Jun 2020 08:42:25 +0200
Message-ID: <20200630064228.4742-5-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=MqqsWllH;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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
index 3f20bc61..7b4872e0 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-5-andrej.utz%40st.oth-regensburg.de.
