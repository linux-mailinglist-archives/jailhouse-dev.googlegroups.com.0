Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNPPUHWQKGQECROS27A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F2DAF9C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:16:22 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id o8sf1235523wmc.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321781; cv=pass;
        d=google.com; s=arc-20160816;
        b=x+7Xe8WqPPCEt3W1rQyIWJLQ+wyrHFaTWz7yvRLFYg3outeBHFAOKVYLcX+98fx+1F
         jgwZZe0KuXOibztosXKh+fg+mTJ8k+Q00eHYTDWAipRByt6rS3DKSKWZbv68TOxKX9N4
         wTcmXCTBDWTYfUjD9cbsZ6m5Z0yoH+nmOrK5ER+LszqNmd3kMpKBL3am8yTzEK5kSWDY
         pJyPxbv6cCoHJFFOJnmgx35irPvG+k8kYIAaCNfaSKo1IQvMKrU9W72ESFZqxTq/jD8I
         GuH+lbCfFhh1+CRKnyGJHxVcc7PPEYZghO6bpK3V2y92RV8nXTyUdFLAKtnR4T7p3rHG
         z8Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ZiVn6W4uN3pYobcBYXvqUvXuD2qZauC/EhTn3L0gaek=;
        b=MYDVk9VjnZpo6PJuWS2K3HnDbeDfvlNibbfDGj2z79EU5+3ElgFt/wxFk2IAo1U24b
         XrybNqxDVrQRVzlyemIKtAiRs/oqvCTlXkhO5sDglovyImtKyrFQuGFgygIe5ieLiU28
         KrNFt2JrJndcxu2UDPA3n0nIXGE99PDbFNRa5Bov84ZRmGVsvpAkvEG2RpUg3rGwRket
         hfqyS+Y5hMe8XDMlTMvR9Q6StM2GbrJG/nV7AY3zey7mKZCOYvZF+iUZBwF6V9KyThWu
         H9oq6rsCedDZ1GCg4HNZ1W1zVJEotwFFIrhtT6H5WdVWoAfl/cxMopgDpid1Hr+UjZGj
         ikQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZiVn6W4uN3pYobcBYXvqUvXuD2qZauC/EhTn3L0gaek=;
        b=b2py5ALz1AnakqPZh7cKRmkFi59C+TsaUlHBdCXLVM9NOBWo8sPaQuoy4Ii8FTKifK
         iCoUQpy7xA4bwQp640mVFjIzxyK7IiRNAn9Hp+9IKpT5kmOUXkxYHWnWv5MnURWHaW+j
         EtH3w9bPoUllt7Rqi+4N2TJdz9Lx+nu3zTIKaGa854TKcpdoRtjRpjhZgkkT7HFN3KCw
         FLBPjkcLRqyvcR/2lQDdTiElD7HdKAaSC19uSrUKpOq8jttFKMG6Z/ihIq6SOJ9ZnICL
         0vEh8hn7RDO3kPzQfbsBR3UqtYNOFNjuFUMGgUmp2x3SuC40WfHFVe9vC5GRBFhrORFw
         xzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZiVn6W4uN3pYobcBYXvqUvXuD2qZauC/EhTn3L0gaek=;
        b=fKVkrw1QAy/Uw1XydXTkPQbYi4dDLsvwJ8S/tkSte+sUTy9OckOp4YWZrIPLcmqoGA
         +0VZ59ty+OkZcU55nEPQs0R+MKcjjTeLn+LI0qYjAhfBL4/F1rpubqSI2sUTZjwKjHIm
         xEoTTwNQJlLOwD+9b5EECOwyookUa2sCSjCjWqTsTLloJbkVxWJ+lnh03MClbEZ370y8
         CTMwLPiFanQEHF5rFv2w6IRfC7i5ra8gAq83ZHXr0hKqVtPlUBpnpcTTKiFLpa6qvUFg
         Y0iL0PeGHOWW6NIbzvwNmit+gQeDyzpAS97lYzrS0SVpp0ZzrEcGtrM847Od4EMCXgeG
         /alg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLs/M15MIasW2P1ydsjMaH3qQ6wiyV0AyAMQihUlhBb/UA1Ifh
	zjfAiDjDFADt88CBP7nA5h4=
X-Google-Smtp-Source: APXvYqztN9+ImjanF81112V/Tkwc+b4dDGzdpqpjUOK5c96AOrQpg7BZ86ZUVkMn0y2ET1QfeWS9tA==
X-Received: by 2002:a5d:694e:: with SMTP id r14mr3532765wrw.232.1571321781819;
        Thu, 17 Oct 2019 07:16:21 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf01:: with SMTP id l1ls1504168wmg.0.gmail; Thu, 17 Oct
 2019 07:16:20 -0700 (PDT)
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr3009657wmk.135.1571321780899;
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321780; cv=none;
        d=google.com; s=arc-20160816;
        b=Th8RtWKggs36AA2acw457jvDn8O/dVeZ4n9wpz/aBMr/g9a6FxoLuQCO2EThC9iBkN
         Mwdb8UP62hgoBLFBMUAeOLoyf2Gt2xcTTOyZMfn3xpT5TAexfhERV2b30OaLKPTk5RoA
         nW+oee2/XIqXcG2fqBTyXklZgWKxuQ/f07zbMU8DhExhj603DCGS6gj6t2XPlU15AeuP
         5AqVnLEO52wAlr0PYCPA6lC28zvI79YUn7egbcUWLGi+7or/QjQnHiTPag0pbzkKoaGm
         fc6C58U8eM/1yZ485MZMfsNXChnTdeqdDfXHVBHWYQ6jkV83TbYHK4iHywPwmxyN+hdU
         1KVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=l15v1cv5p5JsKE9Hkas7e40se37TWzq4SXmsjLW/dm0=;
        b=pURmbRMTqKiS5dusnxtVtzb8urYo4YnBDkMi7685yUhDCnbsnvJkEL4wbskzWF47Gs
         bA0Nq1DrJJZq7taFbsE/pfBEl3/WBxoZAIsZ18xtB+llcRalAWq7LsOgUBSQsNqpyBAw
         H0L8eEzyEl4Ra8vfoq2u3WX3S0vkjHvS23H/NKWLSWY3xY7U4rY/j/9buavJ8iHYA3sy
         x/3He8hccd3RZrJ9ivgrZFIFTJCratZz+1MvCunphjZwqB3p8G9QuBk+o38xiGp5pdHQ
         qcpp8WXKc00DfooobPKHYM4c/RNfPTzWBLl70NHD43cjbtN0aCYFyurD5zG+ACoJEYxH
         OzVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a133si550053wma.4.2019.10.17.07.16.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9HEGKKj023263
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEGKgl007087
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/4] pyjailhouse: sysfs_parser: Avoid len() == 0 like checks
Date: Thu, 17 Oct 2019 16:16:18 +0200
Message-Id: <8ed0aac6ed6d0248e8f955c2719b6afc26a290e4.1571321779.git.jan.kiszka@siemens.com>
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
 pyjailhouse/sysfs_parser.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 877f5405..330d3322 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -101,7 +101,7 @@ def input_listdir(dir, wildcards):
 def regions_split_by_kernel(tree):
     kernel = [x for x in tree.children
               if x.region.typestr.startswith('Kernel')]
-    if len(kernel) == 0:
+    if kernel:
         return [tree.region]
 
     r = tree.region
@@ -157,7 +157,7 @@ def parse_iomem_tree(tree):
             continue
 
         # if the tree continues recurse further down ...
-        if len(tree.children) > 0:
+        if tree.children:
             (temp_regions, temp_dmar_regions) = parse_iomem_tree(tree)
             regions.extend(temp_regions)
             dmar_regions.extend(temp_dmar_regions)
@@ -288,7 +288,7 @@ def parse_pcidevices():
     for dir in list:
         d = PCIDevice.parse_pcidevice_sysfsdir(basedir, dir)
         if d is not None:
-            if len(d.caps) > 0:
+            if d.caps:
                 duplicate = False
                 # look for duplicate capability patterns
                 for d2 in devices:
@@ -1006,7 +1006,7 @@ class IORegionTree:
     def get_leaves(self):
         leaves = []
 
-        if len(self.children):
+        if self.children:
             for child in self.children:
                 leaves.extend(child.get_leaves())
         elif self.region is not None:
@@ -1026,7 +1026,7 @@ class IORegionTree:
                 regions.append(r)
 
             # if the tree continues recurse further down ...
-            if len(tree.children) > 0:
+            if tree.children:
                 regions.extend(tree.find_regions_by_name(name))
 
         return regions
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8ed0aac6ed6d0248e8f955c2719b6afc26a290e4.1571321779.git.jan.kiszka%40siemens.com.
