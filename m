Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNPPUHWQKGQECROS27A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C051DAF9B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:16:22 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 190sf1231305wme.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321781; cv=pass;
        d=google.com; s=arc-20160816;
        b=XdrEgQIwPdctn3Lb/G/T4hLmUNqEBwF1R6OfFBKmKqWChA1B/Be9Zd/QlW/fX4MfHF
         UCoAgJdja2L6HwlSAFdRzOcFTFq6aOAW4+LtkJ1QpxMmCUb0SMImis/u17ln+eVPMpwJ
         UgOySm89AVD8MQEdY9WPhyqvkLQum+7QIO/CoIN7snRzCENYXqUiqGHoJ/nrF/c2rof1
         +ZrBLAAROQIMv1+7BLRCE26XVbViXsZgBnrVNgQTjKS7y9HdM8GPOX8KBcrSwZbtpdf0
         7Sf4xPyB37L83kSfFj5bjLOj6cBqpb+xP9+8igOCBofSJwRQP7H2jiglfToF3zltxPJS
         FliQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=uUP6kn7YRMTYULfjDVE+MpoWjQ0mrToiGt6Y+AP58Xo=;
        b=EIlt9rPt0nfCrfiBsvwbwJRPWnvnOvJdYPnh6yAA+nf/JBmJBGjn17ppsDqz9k4VSs
         RQCJmRUVOD1nrq9/YmtAHLNgbXoynKxHXqBaJsP5OiRDHnLOzZff1RJyXa4y8x5AHTjW
         IOHVDNTEuzfZtS2EaUuMRBApgZaA/X5DpKO8w+RndFrFqg23bGDHARZNEwZYgXBIH/t4
         w15ow79CBL1miuFYPWIPQMjvG0w367zEK2mUBx+XESNjGwYjad1AjTUcWd9hmLLMYJb7
         ymm5R22AuTfJohhviEHaokxs/pppr59tFMrvrok42eRel6jOE5EQK9EOKM66ORP0uTdL
         mJEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uUP6kn7YRMTYULfjDVE+MpoWjQ0mrToiGt6Y+AP58Xo=;
        b=KRip2Hp7ZcPx92r/m7wqIaprftIC2CzCQ6P1jJQeJOfHgVskDdGmIIHoO9H5AQZCSu
         H0U2BJ15QqeW5m6KYmT/fCBHixLXDZ5479sCEJjZa4zSCekpcMfHoJCW8SgipzU0Nsg/
         nPGREZnq1SGXVO75DqYahsNjyGslcZ2qOt/ENoKRA9bSyxte3MK5vHD95Yc+aF+waHd9
         7dmNQqkYPTdG8MdDhJc3MfZwNanPsgMFAsdWCWHcwLCW1C4duZ9LDoeEd57R1h+War4K
         4We4ML8K99luS+W4fZzQU6uiXlfh9NS37SNSbvfvrDc4PKQFKON2AlKxg0sfb9aheqAc
         o9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uUP6kn7YRMTYULfjDVE+MpoWjQ0mrToiGt6Y+AP58Xo=;
        b=X+azC7NWKM1Bt+FQ3ceVZj00rMK5s67BcG7XS3qxcxFO1Lpi66p9a6GFr5RpNq2VGI
         k9I3Pc2Q6Fj6l9eYskYtlVdrQGCoj2poXOLMkfMIllFNz83MtU18pk8g9xoCJwBKSRxw
         7dTgTi9QUq6vqe86WvRnchVJlRWa7QT8dXglxtf4TlddkNqAg9MQhNf3kc7I3mg/iiPO
         s0Ydq0doLPLc5bSILJKb9ya28sjzU2NDTbAFq4JDDAnzCImBYCMlQ30CNPOmwNSgc1n1
         xuKzPymgbB1N2nl75SPTrOeORQvYHzHvStDzN1xok7ec29F+SbsZ/vKyWEb1z9fjW5HK
         rN9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgxVSzwijYVuPAlYzffHlf7VCLdAWge+LZkxGFKaKT3MWxrMak
	7hgDGLR641ILCl1OSYxehJM=
X-Google-Smtp-Source: APXvYqyeaje/sN7o2IANFBTbQ7ZCKUcvD2ruQth2q+ezlu5E1TcezP11SlXl5zC4lpHcpf2T6Vv3TQ==
X-Received: by 2002:a1c:a8c9:: with SMTP id r192mr3087808wme.152.1571321781715;
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9e01:: with SMTP id u1ls1078350wre.15.gmail; Thu, 17 Oct
 2019 07:16:20 -0700 (PDT)
X-Received: by 2002:a5d:4885:: with SMTP id g5mr3557049wrq.219.1571321780835;
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321780; cv=none;
        d=google.com; s=arc-20160816;
        b=glF5CqYyneb5RilaxZnBxc3JGyMG6hb6YgTQWlQK0QDBACmbapIyYGORjJ2q8szztW
         PUNIYmxrllIHMVuiZkfd3SyYkNturI4I6+vBXMBkeLTnETqL9ubfCGR+020azKVjLb7d
         e4eLhTAU2Hh5rM3f0t9BCV4KEf65KSl1AXRRG8jbiZQxZ5a0/7n1Y3O3sUSQ25g7/GZG
         IIgj5eP6pSgNCjB/IwODE+kiXY9bT2sGluNp8WHkO94V0osD0WuQdEwdyfO0KXErrnOE
         BpDcol2x9FX5aG+lY4XDMWW9DNZel9EIRIvzQQNV93tQj4+OJpuEKIzJOB/mc9kzrpbW
         Fkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=0ajvt9Gnt2sWbL+O6tuKn6BY7m8R7OIfkneasFLgYrU=;
        b=I1fZ45fow572ZwQsVZGHiuRBI3RNVt5tYOxyx1fTKQZ7flZfqVohBm+WNTK5p6rZoX
         dJAy7+bSWOuaA57d4AuZKBShq6D14hnyDtBT8INh9AW1kO9KpHSFQzxwscVKcN3tTGND
         QI1EUCZ6FOR1qUiELSGqa6HCyNyrNPYDKPtgJ7mLtBF9GvKEVazVYCHyICnk2cVGR7VG
         9ivR/hqi9Az1JdfUrTcLQSpO8RMblrsBaykMs++tuGBM0ZAe7jubYQ82Z5Bx7Qa48IMP
         0YOiwb6UTwz/CZKEY3RpZoei5NK4WBRG3PQxRvtivznYLAv+eXr1qn/EzS8UGkqvkIGR
         K+DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 5si602444wmf.1.2019.10.17.07.16.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9HEGKmv023258
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEGKgk007087
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/4] pyjailhouse: sysfs_parser: Fix some indentions
Date: Thu, 17 Oct 2019 16:16:17 +0200
Message-Id: <2f59730eef8190816389afb1d5a60ad4155375e2.1571321779.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1571321779.git.jan.kiszka@siemens.com>
References: <cover.1571321779.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Complaints of pylint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 1c662280..877f5405 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -408,8 +408,8 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
                                 PCIPCIBridge.get_2nd_busses(d)
                             for d2 in pcidevices:
                                 if (
-                                    d2.bus >= secondbus and
-                                    d2.bus <= subordinate
+                                        d2.bus >= secondbus and
+                                        d2.bus <= subordinate
                                 ):
                                     d2.iommu = len(units) - 1
                             break
@@ -951,11 +951,11 @@ class MemRegion(IORegion):
 
     def flagstr(self, p=''):
         if (
-            self.typestr == 'System RAM' or
-            self.typestr == 'Kernel' or
-            self.typestr == 'RAM buffer' or
-            self.typestr == 'ACPI DMAR RMRR' or
-            self.typestr == 'ACPI IVRS'
+                self.typestr == 'System RAM' or
+                self.typestr == 'Kernel' or
+                self.typestr == 'RAM buffer' or
+                self.typestr == 'ACPI DMAR RMRR' or
+                self.typestr == 'ACPI IVRS'
         ):
             s = 'JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |\n'
             s += p + '\t\tJAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA'
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f59730eef8190816389afb1d5a60ad4155375e2.1571321779.git.jan.kiszka%40siemens.com.
