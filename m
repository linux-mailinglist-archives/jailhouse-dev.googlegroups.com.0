Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUN63H3AKGQE5FRFZMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0741EBDD1
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:50 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id i199sf3495567lfi.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107409; cv=pass;
        d=google.com; s=arc-20160816;
        b=NDS2zajdgQ9TckOpSX0gtMJ8qhfIuGQeLkD06QrLFclU5d2i8CgoqsLDoW8zL8JU/I
         mLLzpPV//rlysz9TjN3+TbxsT6G6+/Xhp1u5uRq3CLBy1GfMsN0E3zJfzX8KTk5ZtD79
         HFJA+8efnlJF42GUpVdvRXBNi4TdMwepWTNM0SjQK3sJoidvrA0gyOz4Jml1Sgd3CfB2
         hCAhJQm1bMFyrdmULr25Xl7ppD9PriEUS7aBImp68L+An+0EohEphPxRCiFYvFtX6lsQ
         iDCrWj2pvfLxLXAqlZWSfGfG8TGatUJdMKa90U9FO2UuSwggx1uLwtxEAbOCaWhA6rHE
         cl6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=c4/mdVR6Kmar3VFPcwwLEIMxAYlDCjXUMQJ5PLy4MDs=;
        b=mC84eUyRsQnas1o1rsv7FOEdsXoOjYLX41A8+LnIqlyM1yEX2Zw2LSf+p+Q4ZXsGRr
         0FB3lKfBu1eT0TqLZCZJYHQ2gnAiF+MjI/e3w42CLSeuEib7uoo0USsb3Jmszo0jYW14
         8VdUwwDSVn2zlEqx/V0YZeqSdH0VXXj4TLkh3v19QLDRnNkoCfoYmqA+chRToJShW/Ei
         9OgYLrbdVtWLsac46pdGrQOzSV2jrFoaLi6MVorW65YHtclRoZH9ldNoZ8vskhRiD2S6
         KsQ6dv/73D6Tm0v9N8ikgkbeUw7E8+h+yDbStoAJfsPl82fAcXcW+wgkPZZdZFW1xz4w
         Ssxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c4/mdVR6Kmar3VFPcwwLEIMxAYlDCjXUMQJ5PLy4MDs=;
        b=CHKg55vPe4LgmTcPPfFtJb25rEtIjuMH/Ox+kM3IT7Xq4gFoQekvwmYF2qPLSHRxZc
         34Rzqgxufm+HnpnAi4w0XspOuydYW4JQMpTB0xcM3Kn8Xos3mNJg96xTXv2tIz3JxlNe
         9EQAF9Rh7gvnAL3cse+4C83iwR67sbpBxLJTfwxtv1l89Nh2HKJ7lbRRMADfZeVJ25eY
         +oe7BHgMbtAYGsgOBj9/V0Sx8B3JiLAB/ODC7q2iQFWpUpi6oyx2c8X1f3kzI2xO7H9S
         TUqf8n/W1NgZkd8z97XLRrM6jlbqttRG2EBGHqs3+gJDu1xvl/uAy4mE2lE+DvxnMXV3
         lKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c4/mdVR6Kmar3VFPcwwLEIMxAYlDCjXUMQJ5PLy4MDs=;
        b=BDlUt0tVHj0r+8X7mQNp4AcebAfgLfard7tXTguDQEq/TGylYGePq2m0kU3Nevns0m
         2kM2pPn7qiud2Osh8JMlVUDWEb8vPKXMQEn7FXmqqekUfyegOEfL/6vuI+BUQsHKdO+s
         Rmtlt31u2fSQlhJ8T3xtWcZ5ji50dthd4AVxb8BSxOfW7QSDV1ONT0eZwdA5JKHgwFq/
         8zuvF7vk+N5cfFFTTlvpt7s9GOaWIlSMS8uLWrB2b/nrtAJM+Iwg1BSkoePV3uR45VNh
         WHKytTTMphEBYsYxRl7YxyvmDJew8CenrhPgfJOOwX20vZgOUajuvrDG+1rXlJlkhkkn
         D5bQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532gjk+351CLUtwBfECSumubTf51RLDytLJbG4rwgs7k53TduQUV
	wZbEGTMqbW72Eif/AgYNiI4=
X-Google-Smtp-Source: ABdhPJxut173o52/yInxY2983C+0UD5SjGsXcvYibq1T8XdOIIsaAFxIneY+stErFyx0e/OZ00qemg==
X-Received: by 2002:ac2:5f82:: with SMTP id r2mr13619168lfe.119.1591107409623;
        Tue, 02 Jun 2020 07:16:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls1528111lfb.1.gmail; Tue, 02
 Jun 2020 07:16:48 -0700 (PDT)
X-Received: by 2002:a19:7605:: with SMTP id c5mr14038131lff.213.1591107408910;
        Tue, 02 Jun 2020 07:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107408; cv=none;
        d=google.com; s=arc-20160816;
        b=E/FFuaG9v6fgHfBMKiMnx5wGUnNPNMDqbaSFO1rSACSLTivsqTL5rxi7YySIu+MtlY
         9ovMCYEFeCGGrE5cBAj7WVz0Fy8IbrmFsW1eOBjhymcns9nv+y/41vWCuSDuxq0UGP8g
         L7Hsi3Yz7acNk48k0e7iNk9g95xChJnuuLfFtRb6eD+VyhwWW1av6FfbrtidP8z75VZD
         wtbN6xhCEN6VUbDk8iWSNRT1qe3oKeuLU8wsB9aDOWSLJhIgkOIkf8iJGFYzSsNuy7FF
         9z+nXIDMD7Udr1bfGW4DaWN4NGPAAuCXSaV2TYVEdaUSdiljLOV1tSy6blRm9dtJYQZp
         ua6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=z4MhjKqk9w+Sj0XR89xSUq5yi0GaRQORGg2m3S2L1qo=;
        b=eOjS50h5XXoPlamSEmgWgHtuAHm7QDyApFIkG1Y4j7YqVnv/iYCExB9bnFEfJeHeHO
         PRCOfojGKoShdx/3ku4n2Khkj1LZf4KGDjfcNaLUYgB7AdioCBy5IXekC/u4DsVAuTJj
         m+g0jcHZHehgLCO8pfYaMV3gy/yyAAwqehsTZK8Zd65sPLlPIG91nf0eRGsFSbm7chvG
         1t0LIffjw+X8gTf7ScPqqLfjPl3R6+Q0jVMNSZewwqIvS7VvL9GdcF7sa0Emjt6qpdye
         QG785hrsHaK8f7/wQBNEH1leyJ+CPEg/nZYwCRZ/mLQ/VemHVB8ruz1gSYNzse2Ic57H
         GCUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r21si158325ljp.0.2020.06.02.07.16.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGmJJ028578
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:48 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdF028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:47 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/15] pyjailhouse: config_parser: Add SystemConfig
Date: Tue,  2 Jun 2020 16:16:29 +0200
Message-Id: <68401c86c58700c207069a9c423c2a0ed5bb7126.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Add parsing of system configurations. This is so far only processing
essential fields needed to validate the structure, extract the
hypervisor memory and access the root cell data.

The root cell is parsed via CellConfig. As the embedded cell contains no
signature and revision, CellConfig needs to be made aware of this mode.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 43 +++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 43dc1dbc..2d0967d5 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -90,7 +90,7 @@ class PIORegion:
 class CellConfig:
     _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
 
-    def __init__(self, data):
+    def __init__(self, data, root_cell=False):
         self.data = data
 
         try:
@@ -109,10 +109,11 @@ class CellConfig:
              self.vpci_irq_base,
              self.cpu_reset_address) = \
                 struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
-            if str(signature.decode()) != 'JHCELL':
-                raise RuntimeError('Not a cell configuration')
-            if revision != _CONFIG_REVISION:
-                raise RuntimeError('Configuration file revision mismatch')
+            if not root_cell:
+                if str(signature.decode()) != 'JHCELL':
+                    raise RuntimeError('Not a cell configuration')
+                if revision != _CONFIG_REVISION:
+                    raise RuntimeError('Configuration file revision mismatch')
             self.name = str(name.decode())
 
             mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
@@ -137,4 +138,34 @@ class CellConfig:
                 self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
                 pioregion_offs += PIORegion.SIZE
         except struct.error:
-            raise RuntimeError('Not a cell configuration')
+            raise RuntimeError('Not a %scell configuration' %
+                               ('root ' if root_cell else ''))
+
+
+class SystemConfig:
+    _HEADER_FORMAT = '=6sH4x'
+    # ...followed by MemRegion as hypervisor memory
+    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
+
+    def __init__(self, data):
+        self.data = data
+
+        try:
+            (signature,
+             revision) = \
+                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
+
+            if str(signature.decode()) != 'JHSYST':
+                raise RuntimeError('Not a root cell configuration')
+            if revision != _CONFIG_REVISION:
+                raise RuntimeError('Configuration file revision mismatch')
+
+            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
+            self.hypervisor_memory = MemRegion(self.data[offs:])
+
+            offs += struct.calcsize(MemRegion._REGION_FORMAT)
+            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
+        except struct.error:
+            raise RuntimeError('Not a root cell configuration')
+
+        self.root_cell = CellConfig(self.data[offs:], root_cell=True)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68401c86c58700c207069a9c423c2a0ed5bb7126.1591107398.git.jan.kiszka%40siemens.com.
