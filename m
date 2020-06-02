Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU563H3AKGQELOZEZKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA61EBDD3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:51 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id d6sf1460174wrn.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107411; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOgk3q2bnXX8tdYAIzXeM6tmbyUrA7TMO8FL+S9XazDYiXnCkftnkFAbx0xAaZn6iS
         So/xv56MiWEm/Gk7S8h6o23vpevj61PuajjnNb2XRwe7Xp+6isvOek1JV1220TcbFQeM
         2IRRWimpcBc4KWBzQSYXsCURViItGVSspwJ1kGZgWsMTJgS9gP/rNnPNZW4ToeyQ82SN
         WNnvgzXxXMVHFi046n/rhFJniPYO2/zfjcq7LCF2j24mdBSaMkluXTTsm9VwXSQNRouI
         vX/nyR3sUM3IdAbdzJmVKYAT+Srdo0+SfMEpUKhFPgqbCs/n3+eisuvQ2535jZ4QGwPD
         ukKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=9hDtk21O8jdAgJzxXxFuyhq+r8NsyAiK5VL+pyrfJHM=;
        b=jU8+8aJPD1Uj6aKScIDiI8pmW8ZZG8TeBIhJmwe8FX7QE3LvY4IDyXZqmS8kn78w6L
         g3mMZvr9FNUpO0v+5hFnkc7GBN3cyYU6qrmUuhWBqlWZXWp1PGwxadbzbWfntUjPC2ZF
         bjqq/zSnY0TrDtaExqPhgKdasKJAae8kVLs2GScONe+bT04Uo6erOB9S1RrXqiqzs43J
         LfTSu66Fe4MeYLBcK6aHzFJBIw1bGKGj3AOLjOV8z1yLAqZ4YWLPbj/sqxqjkhR1YC+P
         F7rvqE4XL3xUjXfMb5haU9yMp/D6ufvtIpR/tFq6NUwoZqE8SKJSQ/WSqJW1cuwJs70N
         trAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9hDtk21O8jdAgJzxXxFuyhq+r8NsyAiK5VL+pyrfJHM=;
        b=rb+QOEfNAZQ54Ce4MBpQKdbGIPxoXn9hmU+MZpZcGt9Wyyn6MblF0miGaqJCc6ZGqE
         yNC1YWHco0MHsprc4rqe8he1Ea7iHqnvRsc4fzD5jxdXEmGIK5AgsIcIK0INCGmI/xAW
         XRccU1SKGlo+8ajlxev9C5vB1NOv6bgF+q9+Z2CX1HvLEvXQvM+sqpR1orw1/2cGXTmP
         MnTVh2ZWY6CSt1jUay0b9wJP/94LGCvPZyMNJj32M4XkWttmJQ8n2Om6wqNO2NKhAAYx
         JFlaoFZmGEOQxjFTgJ9oFAqcQ5cHJ23IC2YOHBHpxHWYnqSVNy3Mn6eJQKcvVKVWRHS7
         y75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9hDtk21O8jdAgJzxXxFuyhq+r8NsyAiK5VL+pyrfJHM=;
        b=WgLlkGIxunIc6vBuogDUBkvRniw+Kpsj0/Q0JMkE9/XumNugiPVYURpEfDv61kRWz2
         zRB2h7OZO14rdTsDXn1LtGzVO9j+CUzFBJkEC87pNIoQFtJ0+VFe/3qu0ZE4J6lnAR/W
         +a2ouWnDaFa11fE8kXLmbGoK54raxIwSD1LvtRjbe5GT2HOknQcz0v9lrQpOWputqHxi
         wQ0IEbUScMxcF8oqnUTHHodmnPeWV4TqhovW8RaK38HXn5qsyKfp9E6hgJsVwEveIqYE
         8Lst/vaLpEP6Wlj0TG9JPmG/o6l9uOsSbkFKCuw+9f15lZdcj9Ka74N0eyTiXOepB40F
         z8dQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531YiFi1RVvRKdeAU1JGfN221jGYO+ORvULKSF5qfs6sH3yi06TV
	RlI9H9stiwAVlTziJD2xfj4=
X-Google-Smtp-Source: ABdhPJwuyrvcoUVUdzDEdL/PzXeZ2dJAmImAap4h6e5UNs0uAyUQ7LX/e4my/NjUvUnEdlJNLc/+DQ==
X-Received: by 2002:adf:f5d0:: with SMTP id k16mr28031330wrp.288.1591107411630;
        Tue, 02 Jun 2020 07:16:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db45:: with SMTP id f5ls7837226wrj.0.gmail; Tue, 02 Jun
 2020 07:16:51 -0700 (PDT)
X-Received: by 2002:adf:80eb:: with SMTP id 98mr9637158wrl.351.1591107411027;
        Tue, 02 Jun 2020 07:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107411; cv=none;
        d=google.com; s=arc-20160816;
        b=rSg/DShFK8lmRa8B4VXiKxmmbQsxW5b8neqdMa6RIszvCNGneDavwipkiMBH2V/gTg
         GBNLLfseNJDAr9HlylYuFLUjuSVHIoanXGtRJWVR/N4xfDyQBMP4BX9ja0ORxPr555Br
         2wSAzFZt3We/CETI4jpjR4EKHir49X/KE3zgvfQs42bvHYZXwsgG1sQ+bCdRps5+xzVh
         6YhTrisGynuO6qyOOg1qauvG+i7l+ZO0PYWqVQUh8jlE1OIybV4f6pZsq1oI2x7Lef0r
         03My+Z4RSiiUTVUxPvy0F/PGchOPkI5Y5iSReYCplbediq4xomMe84EvIhssoe+Pic6h
         UEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=FdzZ5zylEZF8pBx6Twu5bFXYksXfkULDPpVEKexeNrI=;
        b=KIyFq09dOYloSLC8gRCzw5ls8HYG/kE3OBOIBt79A5dC6OB6cAQ7BCuvRMxqBiwc54
         A4rGDZeXv9U1kYPeKUA77CYbzgaQl/xPhXXBaJB1ANOuBGFYU2KgzEToqGCyTVh5e0Jl
         sInx1KYrs4kYORi8ngXPtlMu0jwSLqhkox2CK93yLQCG7mCp718RowcRTcePOf+Wnqbn
         1OygVG0q14XN3jh4QgkPM0ch6Ur8LXRt625tYlCxj6LfsQ0niVI6WBAI1o9vMxy2XgGH
         Iym1UbtLlVXcWlHHQ1ZEGIy9YlOPH0Gw58VT4iE4X9ntrmLCA3NNOQrxxe1wHxwnlhDu
         hvcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s137si132712wme.2.2020.06.02.07.16.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGoH3000770
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:50 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdH028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/15] pyjailhouse: config_parser: Add pretty-printing of MemRegion
Date: Tue,  2 Jun 2020 16:16:31 +0200
Message-Id: <76b4537408f5864961d422e02fd0c52f94d3be91.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 9d264d19..efa7d8af 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -23,6 +23,15 @@ from .extendedenum import ExtendedEnum
 _CONFIG_REVISION = 13
 
 
+def flag_str(enum_class, value, separator=' | '):
+    flags = []
+    while value:
+        mask = 1 << (value.bit_length() - 1)
+        flags.insert(0, str(enum_class(mask)))
+        value &= ~mask
+    return separator.join(flags)
+
+
 class JAILHOUSE_MEM(ExtendedEnum, int):
     _ids = {
         'READ':         0x00001,
@@ -53,6 +62,12 @@ class MemRegion:
          self.flags) = \
             struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
 
+    def __str__(self):
+        return ("  phys_start: 0x%016x\n" % self.phys_start) + \
+               ("  virt_start: 0x%016x\n" % self.virt_start) + \
+               ("  size:       0x%016x\n" % self.size) + \
+               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
+
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
                                JAILHOUSE_MEM.WRITE |
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/76b4537408f5864961d422e02fd0c52f94d3be91.1591107398.git.jan.kiszka%40siemens.com.
