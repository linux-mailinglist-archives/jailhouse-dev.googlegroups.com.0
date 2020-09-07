Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUUS3D5AKGQED6T35VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ACF25F7C0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:03 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id y15sf4758507ede.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474003; cv=pass;
        d=google.com; s=arc-20160816;
        b=k+9QUlWDGh8BCEbws9t82D6TCkzU1ISHcOG+fMQOgYFiOLDQYXsyhdtP4sOldwjrSF
         YdAVgcREE1uRN52MHhcGiwMM9Sl8dlBXW9O2yaaiRH0TU1SmhzdnP/Ri24jTMYlDM3XT
         JEuCR0abZcQ+m/RMlMzT/nFmi737Xyd7p4HprLVyNmBKKG0u+067AnCj1wLWJBAvW1tI
         F0cVi0CW4sGfkSLWBRWWpijVFcQx83O5tTaGttSegIzag8EjQvWmCh9JsmKXBRlWnCiY
         M5qV2yDsHWUkRZkHtSMziXV52cpl9khBswzHXrwpGkvqwrO4j0OmQ0AhdzWLul+261TU
         obHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=afM574IBX5qmr+7RlP1A6ycZu2nMsRIT/fun10dNC9Q=;
        b=yRg86UZkQ78A1NwUbvTVHaSRqYnpjEJC9X771/JRoYOT8bMcufoU7HKFF4erYPprCa
         Ne1/f6QpSnToMNxHm7mo0IABrqrl/63Yo7PAtjWYMgvEqJlAM6m4E9P2665bP7drIXcU
         yuo5tqQNArhrGoG2UIT0Oq3kqn9bBFTMkweWX/9GvcDKjsuRjDXwGIaLFXiq7Qu63WTn
         8BiJHTW7eshhoY/YrQ50GfdWVRdZ4MH4zIK4HWfzU5QcqBOPDyGxJj7CICrckzS47XFJ
         bkQKdvVv9GagwOw7ejoC93/NaOsTfZbbMNpuxa/9pTXVr/X37nryRm1pa6cpUL2P1Nr4
         +R7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=afM574IBX5qmr+7RlP1A6ycZu2nMsRIT/fun10dNC9Q=;
        b=PdR1/7J6HZR4ZKfDZQitkyaiwxrlI2T3KtyrqQs1VjHfy1JPlddWQQqFGIpqSE1LFR
         rvm7ei5B2rGPiFfDgUu1nPrNtXFz7sTkjE3pSK/vnk9HNdZcBNY/7iTi1iioNpSM92aD
         TpF5EJT7HZM3sq7Mn5tg8LFBW3k1SOZPl9X5GT0tYqzMs347AJdGnTRKFg8PfoXI58iT
         hRWGzA9S9p4pgB9gU2oEuQBGuqNRo3kncURwrVljuxxJR+ABVr8fidhyUpTSpJQbtVle
         zLF3ZEV18BOpK4nWf2tgBqPV2n3xWWJhs3REGe3TIcGvE3Rh+dTOBZqQjgMuU+EM4I1y
         LB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=afM574IBX5qmr+7RlP1A6ycZu2nMsRIT/fun10dNC9Q=;
        b=uZ4iZ9hrkadGNRXW9T3Nha6XLnsDEK5YCbPIfheg9aM1vAEOflQjEolM8rrLW73QCG
         HjeXqoZO3MLabtJbHbkbAooauz9rkqKZPtEIKbidloEzCAYWUe8SlHfjpodlG9G/X5O+
         H5BwNCBriTM5hM0uXanIUGiRph2XwuZmC3VgKEwz49bcLlX3ii0iLOKj/kB+AEtIkm1z
         nB80+cHd4ajtMCLNZGwtt74OlhbDZfI+/moOwyCvq8y0i5pt8D86WGkTjOKNPdYW2GD5
         6P2x3kSYXOe6GQb06+oeSiPYyECJDMQDrV1KuL30IV0WsNohj+X7JHNF2LEZuKT/gr8h
         KyQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530JSOK+b2diMSG7ITcSSTSw2JpPGDkdb5eqpUTlu8vI1SC8CqUb
	gLLoYJC6ZbvmQYoZCMIRbBY=
X-Google-Smtp-Source: ABdhPJyGJklpXmuPEmBeZnywvrBDk9euwM+FJKe35xq4AQjlI1FqBDy+TguPQjCJdfdeItsq5Wd4/g==
X-Received: by 2002:a17:906:bb06:: with SMTP id jz6mr21316745ejb.248.1599474003036;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:71da:: with SMTP id i26ls8171924ejk.6.gmail; Mon, 07
 Sep 2020 03:20:02 -0700 (PDT)
X-Received: by 2002:a17:906:fb8c:: with SMTP id lr12mr21499438ejb.9.1599474002111;
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474002; cv=none;
        d=google.com; s=arc-20160816;
        b=m9bO/aIiPyWdLyeltJnlm5BIjaLkqbSJZM9OLZPXtXUpkwrfn/Nuzrql+J8MYkIH88
         yay5V6REDFZiH/cgsb6Nr6d7FdoizaJW+2Pjv2Z2RGAxQFOyavkESD2vfkP505cuEdxw
         xcR9o5WJKbyFw7/Jg+2fVcF7g//J6guA/TWSXcuT5P/vFTGqLDv95MYLnJ/YlzICgvQS
         nF2seEOXUj4Q2JpKr9ythBCZccdu+JIQTCsqVzWjCdCKo96RscOEBmq6Xt23chAWAMlH
         4n8FzwlDzckbhwzrTuc1gLrKlaqfbftmlf4iWk1CW8VnSSWia8t7Ni4XC5VYUeFakeJM
         52eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=RRtUpz8ogMhRoOw4pEHHwNrufFkUSOR4xMtoKNCd8X0=;
        b=bAhyhRqJcDwyKLSY3RnoXYJpost4gxY1EMzCCGvC3+zZSOLjI+QeiQIbKIjzx/Q4e/
         g8QjGRKlhhffU4RPt90dvO+y7u/rpbcnLI4Kgruh6UPMIqfwhJ69RgTOGDtu485bX8tT
         OP5u2M5PnhnpSiZzkKe/HX6L/rpctuMshTm77if14+HecLIX3ApOAIPoAhSlIzuJmXeb
         bzJh0RkINPRnV79NL1Ee0FESkzJWTVQ61yiWi6ja0yz/ZADQAWxzFXUDDSaM2dLYnfQP
         eL222uXhi6igecJNypuKgUB7bqbDqA6Q8bngi9m4je+DiJQjDAigbBwC26lSr/wsXP2g
         ZI8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k6si426860eds.3.2020.09.07.03.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 087AK1g4017434
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2H024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 6/8] pyjailhouse: sysfs_parser: Always walk reserved regions with children
Date: Mon,  7 Sep 2020 12:19:57 +0200
Message-Id: <231c39f4b31e25d8ef413533e875ad3193a54e97.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
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

Newer kernels and/or certain platforms (seen on AMD R1505G) list a all
PCI resources and some ACPI resources behind a top-level reserved
region. Skipping it leaves the config fairly incomplete.

Also fix up a trivial flake8 reporting at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 7c93b58e..b9e40f65 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -33,6 +33,7 @@ def set_root_dir(dir):
     global root_dir
     root_dir = dir
 
+
 inputs = {
     'files': set(),
     'files_opt': set(),
@@ -150,18 +151,16 @@ def parse_iomem_tree(tree):
         if s.find('PCI MMCONFIG') >= 0 or s.find('APIC') >= 0:
             continue
 
-        # generally blacklisted, with a few exceptions
-        if s.lower() == 'reserved':
-            regions.extend(tree.find_regions_by_name('HPET'))
-            dmar_regions.extend(tree.find_regions_by_name('dmar'))
-            continue
-
         # if the tree continues recurse further down ...
         if tree.children:
             (temp_regions, temp_dmar_regions) = parse_iomem_tree(tree)
             regions.extend(temp_regions)
             dmar_regions.extend(temp_dmar_regions)
             continue
+        else:
+            # blacklisted if it has no children
+            if s.lower() == 'reserved':
+                continue
 
         # add all remaining leaves
         regions.append(r)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/231c39f4b31e25d8ef413533e875ad3193a54e97.1599473999.git.jan.kiszka%40siemens.com.
