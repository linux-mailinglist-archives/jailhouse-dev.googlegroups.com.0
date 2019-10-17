Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNHSUHWQKGQELPGDDCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A122DAFDE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:22:45 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w10sf1042676wrl.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571322165; cv=pass;
        d=google.com; s=arc-20160816;
        b=bWUKuimPVZMlBMlELF8m1p8B4QRXxjH6DOWmuWopxDsTRXr3ri6PDqY7XTUM6R5fgv
         m+Q/hw1O+MBQBYU+ulLFen9kxKuS/IUXK/KHv2ScUtpLG4WmVW/xFDWQqAaD6ArRmP+x
         6vHQXps7pYUNE9z6Teti6teBTjjKkwVsdEvQQbBY7jjLhQ0yjCQfQJ0gFU8b3j88qNpS
         UWkSGOyoTlwm0AGKhx0K19A3iJGa/c8UK/ww1Ale4SubZz4vGqEUGIdEAb4zh9jBJ+nb
         RYKo0n36kMOKmIVtjJmWHjKXPx9MMxlLVdjuD7ye82VLi2fUNQrfmT+unUP466AguRr1
         ytrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=gWNNf7k5WSXclwE6ffhLyKzBv/33FKkE5eHtaC2blcc=;
        b=wgQZ+VoUNsD9/mjk6qSMMe9WfDGJfwevQlOisUKVhKnbj6Xw2dV80n8yDlpwJOKE26
         CqfX4WOh/xejQ44daJN1mSHLXJ1xaeLeNPqGiN7DJbin+IC3RekoePktg5Kf4oSEKVRQ
         qCbia22ih5SZO2PZB4/NZVc7j+rBPkkIyHB3O11PCElXG2DICbeb5afyPlodoePKt5lc
         mF5ssgUKlBqYHtmuyTyrV4LzG/ESsLnWcUNRVDC/BebFAsSk1KqXgbArDuhon3oXgz7T
         6HE3pSHjOrjOsdsVlFkEpmnjW7uIq4g1KvbO21mChrVQAeN2BPqPXf3A1DouuWtED8mW
         9FSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gWNNf7k5WSXclwE6ffhLyKzBv/33FKkE5eHtaC2blcc=;
        b=EnoYfuBnsqyO1u+Q/UB4ELGGtXgIxMIu4ssqzi5mnQwFqlfU3OcEffgkg+O0frLkiN
         xl4IePHJMU83CNp/EdoDkp1Qoj0kBJsOUyvpObThp1fyaFXNGyNDG/+POYT5cInTipP8
         UZNncbt75rGIBJQV/UBsW1SVHpW9E2S/jbqRC1ZdA+p5UxczQadBgI1CyUl7T51J58O5
         WV7HOmyzF5y21bYrlarGb8mjcS3Xm1MesSiTLhH2C2yYPGsz3+n9keDrvoJ8WureJoiZ
         X0KnCcdMG3aNemo+hG3BqPhVFomluRPwNi1c6VAViJGSUIPJ9agexhydA2K7f7JSr+RP
         k03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gWNNf7k5WSXclwE6ffhLyKzBv/33FKkE5eHtaC2blcc=;
        b=q8jC61qAUgu6oN9xIJJR5Xn+CR/6jpbWvMyHDDYMe9EC8pIBFpjfo+A6bY8VxDV1e7
         O89q+9MG0UfrhmCUbFCLb2gIG8j4yZrHthdyrzRiCBlCSMAmFNwq6RgAamviw6RTOY/R
         GaHAhAAGDbGuMn1eR+KyEW/afxRbjWYKusul70nSIYjqrdX3pI86hIpGuX2rVn8d4dqU
         rF2xXh13IAaWMmlC9RT0UIh2X1mALCLGBxj3AesoQwXEn1GfbeJvxNxHmCnyMZTSkWr7
         S1IfGKop1VlTtU8PJuFVd3WfGB7b3o0d/XV+v/jLDxONrbn/VRkb2V10EjTvpOLWSzkX
         sS0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV1QqlG8q8CsC9nlrgqaSKd8LXk+GKggNZl8lo3tzNUaZyk6IaJ
	Z/F136ur9w9L6/fmKPHu4dI=
X-Google-Smtp-Source: APXvYqxqQY24/l7hcz7vuIRkJdJ6yHtjMAZ9TdOveHg3k/f7Z6xooVYTsbJhD+nTTg7YTuB3JsaSrg==
X-Received: by 2002:a1c:48d6:: with SMTP id v205mr2984557wma.35.1571322165236;
        Thu, 17 Oct 2019 07:22:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b7cd:: with SMTP id t13ls1095421wre.5.gmail; Thu, 17 Oct
 2019 07:22:44 -0700 (PDT)
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr3443272wrw.72.1571322164398;
        Thu, 17 Oct 2019 07:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571322164; cv=none;
        d=google.com; s=arc-20160816;
        b=yGLWQyR5q8B2bjTODkhRpoSVer0z7ziySttKmQARgywVAoddxHrfMkvrKgBnNcEbk4
         uxZEhMsyJLw4LGkIlAs+sVGfmIjyuTQg0xvcgMzdAddYOeZUieUYVNc+dOmdl/Z41OPF
         PRxafm5Vd9xV7NiqyqJMoLxNavFxCXQc7YgQnamTCIX8uBsNVBdqNsKQzUn6oQAW+HEe
         9oXgkKnnMz+ZunU+z7jgjMrS1r+NBpi0wOdPsieUURryGFBHoi85EOhTohqUayLkatZG
         7feMLeBOEc/4udDcSddSLIjlDjTR9VcwyHcM2gPX4VngETH4ArlTfy7kKpBBvJJj4JGX
         Ubww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=MbeHVhFJnQMTAk7PBirADMU/Zdec/dkn4tlSQusLUhQ=;
        b=yUT8kTWR02LRXz9AcYWrSWNp0EDWU7KaElYgF+zZsnqdwzZNlTI2tdU+UunbG/eRsp
         JqBrIkNRMMkIZ2I1ecG2xC3rRzRM87m25uXGNIaVdUrvvLA6r1XOuR0f27QDZNKUv5/s
         hqU3rF7nhlrWKydN7qQ+EJcipLiKJcTdX8LVoU/V6WWh2F1RJqn8BVBZnkLwzF63XlzN
         rJ+BbKuqrweUoEtH2zLDhhzYOvuPidlum2CoPADmm8XdA0dX0XREjI07eYDu5QPbjgql
         k66XddC6VNipc4gdwcGp//P2JF8UWNSmiZS+3i1sMaBmLvI+e6ES293RkdjKPKp3yk2R
         XO5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o10si173652wrm.5.2019.10.17.07.22.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x9HEMhFU004930
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:22:44 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEMhS0002592
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:22:43 +0200
Subject: [PATCH v2 3/4] pyjailhouse: sysfs_parser: Avoid len() == 0 like
 checks
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1571321779.git.jan.kiszka@siemens.com>
 <8ed0aac6ed6d0248e8f955c2719b6afc26a290e4.1571321779.git.jan.kiszka@siemens.com>
Message-ID: <5a9c7297-2cec-e7aa-e40a-1217f56914b5@siemens.com>
Date: Thu, 17 Oct 2019 16:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8ed0aac6ed6d0248e8f955c2719b6afc26a290e4.1571321779.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Complaints of pylint.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

change in v2:
 - fix logic inversion in regions_split_by_kernel

 pyjailhouse/sysfs_parser.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 877f5405..85c4929d 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -101,7 +101,7 @@ def input_listdir(dir, wildcards):
 def regions_split_by_kernel(tree):
     kernel = [x for x in tree.children
               if x.region.typestr.startswith('Kernel')]
-    if len(kernel) == 0:
+    if not kernel:
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a9c7297-2cec-e7aa-e40a-1217f56914b5%40siemens.com.
