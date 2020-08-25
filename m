Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBRWKST5AKGQECEXE2YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1933A251B3D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:47 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id i6sf2612279wru.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367047; cv=pass;
        d=google.com; s=arc-20160816;
        b=WAANvLXm64QiC0aRfKEJzmuT4L8Pb9wECmwd+IsWRDkK2tWk4F6K+aSQ74RMRM0JMQ
         74PYaq7LXGRJH72Cp2hI4DjV38p6z8vxxgqfYYDBXCZJEcx4yYhqoiyO/mNt8KcdjIe8
         bo2cZYwsF5EdHDAzG1359n8SuYd9C95Pv1RiUP3GPi7MuktBsKNxui0hh/15XhbuVpFK
         Wkf9lhW5DWAoKiCo2pjlQMIRnCE8eT5V56Wakgt/S6MMMR7SqBy9rzFeRPQYLcxL3oFs
         1/jH/nJII0CljEJyjk4Lek4oas/suoksXjodbAd67QENKTb3wZ4GZRk+SgT7AB5UcIBr
         QxqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MDFDto9NuQaL3QgjWukBrcB13e9hrmK2KVoZwpw57oU=;
        b=vptolojXg51lmIule8bpg1zciRx3lDTgMxzQUFd8OdKgyMLJEJpGIe6VJCk/ec859p
         ReGNOI1Vx++1FC09r+1W8FsQWsPDnY9hhMn8wNpRoHrUPo4suAtVW4D2I5KqX7oygb3R
         8TLQ6S6EtbGiRcnz5xY9Fc8+6YGx0fy6Jmcptj32whhPewiKSmf9E/udweziq3PRM9ZB
         CelVU1SKnyV+0d7j1V+FWep9CYxzwieWr8wuBnCO98+ybrwrOSMyAKb9ezmkwo6+MXA0
         ttMLOg2J04iaeGjIpmQq48+NS25ASePJ2cM7yfyIynq/dxEOUL6pcyONl4zCRO2N4yEG
         a5oA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZDmqjZ0l;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MDFDto9NuQaL3QgjWukBrcB13e9hrmK2KVoZwpw57oU=;
        b=Xb2eNJNuokbUrXArgCwftexiaZZQAdqQmDtkRwujn8SdHVlNlpQxUzXaCCnT6kIY3/
         MibHfo9npxPKq8QDs7hSV05hOqrI71IvkJmJoLFoN/hE9vjIEA4/+ewWeSz/3eBX71ni
         zlY9rHDh8I9aPdRL0czSmT3VuEj2lQpPXGpRpq6qzMDw3yE6rYDHz38C5Ge+hfjqe+se
         GfWDrmUSzCnaBmZ5QlQgWxl35omlYLB7LJWAup5RpTqXZ7x8/mJ828VNKm/rJnJyQ2IS
         z2ZvX6BiXqcx0Cd/M5YNbfTzjspUuCeI9WQ/TKavN1LPOK3QSwhhgLru6ZpWsLfDUd/o
         Js2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MDFDto9NuQaL3QgjWukBrcB13e9hrmK2KVoZwpw57oU=;
        b=oxd+4bK9pk+voKS0rRQPIf67ZoFOtj9dreflr6/fnbJyatEICiah01W+nBPJRLXYJb
         uCsa/omJJaL/cEvC70bv9Rn8oOo4HNox0Nm4gz3p+fbNeRxd5Hqjti7WLgyqqSwRCWg6
         0FuLWSjfszzkpLoPaMybWfq+c0D1WHGJLx1y+399PF8pajNVxixshpvqN82cD4FrlLtk
         6UwcCTTpHYtABob2KSqv03Jl44DHr+4ewrUeCHMuqqA1wjW7IZ9wC3TNxXcVqqz5ZD52
         ut5iLzKe9oHPpf9i7XrQJ+mX8cVr9HcoSNMPLYLUj8NuhQA+WmlyuJ0EBNBf72DKd0it
         4oCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530IIZaqVxJ4aIfhkIugL53fbGXEnVOrqvEJma3SzFN6MhuUqtYY
	7agmHuXB/I5x54EwYGdkkeg=
X-Google-Smtp-Source: ABdhPJz6a5v8F2gjNfzxsSFSQ9pdT3FiSGGBQjZBMqCrstWWRvuTApBtj5KF5f04hgRoq56qEirZLg==
X-Received: by 2002:a1c:8:: with SMTP id 8mr2564427wma.40.1598367046851;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6592:: with SMTP id q18ls3202499wru.0.gmail; Tue, 25 Aug
 2020 07:50:46 -0700 (PDT)
X-Received: by 2002:a5d:494b:: with SMTP id r11mr11607477wrs.419.1598367046126;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367046; cv=none;
        d=google.com; s=arc-20160816;
        b=NQPg9qAG/FWze5Pn3s6LSqOxAmwQtaR1FC8sOS8ZdWtMXIKOfL6QolrZMM8tt9t8TY
         N3i+DIeuUtelCEsSmgir4WVe4y+0cTbUsFoZwamJ/sZ6KKV8kHfKj2eCMTCFxUcZguQ8
         5LDDnebTCp4JPg+ItKhx7ael1NwmHYxUTwJ9k9acyh1TA8ODQaVNKm3o25CoFevq6KOL
         9CtrnqWm4RF+ZbwqblZdgQ81yalsSgPHt9J9E1R35PBM7tZN0EWK+4baaGAWHVaEnTix
         aTlswChgR1jyJpjXqW/Lh5ifY9m+4VipxcHbGXu+4NmbytANDjvpv2y1kuuOPDpPnXy6
         /bjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BmFYkyxAsBN8rhg9/YSFoVVTofOY6fI6NWpmcN1BNvA=;
        b=qHE9EN1XelsUkcb9leL7B7iynkegsfWDDxagMaJFdlnG2GQi8lW/B5ovALrn/xadRt
         FifGLLw96fai5EfOW/d3DRsDvhR9YSYOvmWguL3sAWXJrpVBqgY9T2D7K8VHoR3WLwiz
         RzRo0j67/gzg/uTsz7ExDaZN4suVQatlFZNnf7dl0kxYplMoV/76cJl6TV6uDY0a1e2R
         qGK92iQUSbiwUl/64SllfdJHynyvV/oG3JZwDw15TunJw6k8YJR8EBr3SbdrqVCwDTZ0
         oHM5rEcxQJfigb+IIg6J2dlIZ5WCmtJBBBITMAS921PcICsbdscI+wLFzd11/mjost6P
         3jEA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZDmqjZ0l;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id w6si143251wmk.2.2020.08.25.07.50.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3n5Yjfzy9n
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:45 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:45 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 5/7] pyjailhouse: config_parser: parse pin_bitman in Irqchip as list
Date: Tue, 25 Aug 2020 16:50:30 +0200
Message-ID: <20200825145032.115837-6-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZDmqjZ0l;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-6-andrej.utz%40st.oth-regensburg.de.
