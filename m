Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUUS3D5AKGQED6T35VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBE625F7C1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:03 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id x15sf4695079wrm.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474003; cv=pass;
        d=google.com; s=arc-20160816;
        b=naOtawMkR953A2lAwAv0ePl/oNwxWWNvhU3ZprCD8eRH3RVGSOWwo3jmZA3VWx/lkw
         fZMIbiNQc6VGLl0s9xsxrv8FbCGxa4NqlOpSJMTDvsnymJU/Z+yW2+9Nvo5jUR576SKZ
         hVYUhdJj7CSQPUSODJagyQnAC7Lt4WuUx7vEBZLgg5k+QAWE2qfeecxCDVQUMqDwcdgE
         SckXOUypxgHszHagf3W9X3352wSYjMYRculuZa6pY1HynG1xQeviAhwLwtNiT9aQtR/U
         U3yzXLZknnBwaG4JR7hB+8fBUMBmm4CdnvfQK1EdRVKjgYF/VKyiU5ICdeXLSDnr0wIw
         8SdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=b3gT9FKsgxZk+UqLvs3VpxtQYcSAxbS7UgIPAK2PAok=;
        b=iKmGUI3NNbNY/8nZOYiSTU07mkKloliMcwWGZMxsbgAmiMP8hlAokGB5OrHb11CKhY
         ecyoQ/vkKtn1sk63EHvB0N1FsgYFMG+PdpAS2amVzRYVjnRjJ7NSVBhdL9sOymHA9LJO
         QDd3A3AsI8BD40MfsVkIKwQNynC51PZP6CNqsaWavDx9Uf10SaM8CCx4RhPsUhSPn83w
         FaS0AMPkgidNJMpyyC+IYA/+LQZAy0QFOU9XGs0xCcTQ4iidhyJawz1LPLASDHzs9rOR
         r2yCx8WUZDMOpJZt0XgEG4/IDhTnkQ6+n+DPvAkCUeoMoLl53imdEWNzfTPOlroAMKFP
         7FnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b3gT9FKsgxZk+UqLvs3VpxtQYcSAxbS7UgIPAK2PAok=;
        b=RCWyaz6QUkIZlwG8/rvAHH69xzWhzG/50f2chJXgEBytUzt8858qpzRDtEKs+lnZNy
         elk30LAajSxidNTGHG/8bkVGKiUp1zm7je90lYZhalyXTr+8fEtEo7iIBfNfk5y4zHfm
         glDbON4hQntewl6w+HTz7HCFxWzsYL3kRhmZYHEl3FkbrMJwn0MSBSJ3ayFRoeShV7t/
         88iCt7kaUM4KgYd6ljQuoRvmUdSLWBhmggNrLX75vQBNcW0xKKfyRtQzQCg1tHXGQ7U+
         t+1RtnEWLxZSf+ciNjwiBs1bN+kSgmkogUMXmWti7VNdSsvtOrSx22N/tCki4bCHLDkT
         Sopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b3gT9FKsgxZk+UqLvs3VpxtQYcSAxbS7UgIPAK2PAok=;
        b=qqiaxVYRNHSHurp6L8AYgHZcxwSrQX0JmJSySpgnN1kwAcJwl/r7eqRyif42eKh5oC
         2qILzZTRpRmiOz78J2TaPlXTPrSPucWVRa4BADZaGXFUYPiIEGyIGxprnaIhIwhu7F9/
         KlednmTc2rgj+2tcOTzMzbNAdsVZA3P7bcFwHQq9/t0SCMsHDYPNzNTmNJRrtmds7dOw
         0QnaHM6idCfaAiVjHLdMPP/Hol6XAJoQZEkbPPsfrSRRCvZVy688kA5mH5DSkVicSWFQ
         li3qoIPM806Kzj2N/5a7q03SJ26ggUdrI9M7nF901C6tePCcmMVrgbb6AJvGW4jxe5c6
         Uygw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531e2+Jr93A7Do7HqoOC10fXP+RNM2Sy7koPCQdmBdmdl3XsfqII
	3c8UvxEq6SRLsKiHKldV6ms=
X-Google-Smtp-Source: ABdhPJyvLtHXYXEGYMOoYpFd33ymNh4ZUG8Zgr+VKYFfh1ZqzuXLYYshOs5XG+UgzSdyeY+0hOu+TA==
X-Received: by 2002:a1c:a3c4:: with SMTP id m187mr21184429wme.159.1599474003225;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80d7:: with SMTP id b206ls4155311wmd.1.canary-gmail;
 Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr20365677wmg.117.1599474002431;
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474002; cv=none;
        d=google.com; s=arc-20160816;
        b=i9XlMQSmx1zzBx+M2DR5iVYpf8+7Ak5g3mP6m6dnV68kHU4Q641mHJFfQs55Z1a3HS
         JhcFmdU94LId1GmeUhEtXOO4sbESSc1w0g/Amv22jDQUllYXOst/La38AkVmW1jHUgb5
         nNzQA7xCK6bZGqjR8oaU0c06CjzFcEim7uAev1yf1HMbDNtsWGwSmHwlMN8DXk+dEF/A
         skwthlaUpQ2+kUVtOuQ9uEwh8E19PGaG3Viym16XVseEzkO0YXEqIywtkPpcI8PO1/Mb
         Vf2Gkjmoe4WIMmN3OIFbhACZsHZ6BlY68l9ZHQFFfLMVSHxLjeCPOI4jLFhB3lcNv7/3
         71vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=3L8JWZIYqK5/4oQkktksFApWgdNpsdtQ5M3YqPL+2zI=;
        b=0KEunAkYAqOWr9MkhdC2OXpRQt3JqvDD9vd9IQPW/dvDw0JcnV1NKfwZ84LzGNIFVP
         SQoIkfYgs5Z09aCrwppq0vaoi1iH8iJyHXJgQZeltBMhlst2ZDZuYP85dZ5e4JTbJNB6
         ysin+VGHMnxA/XhK2Qx72r2X7SWn/C7JpX3sjsqYWUKjsAJdsBL7/QHKcZaX6H9KY0Gt
         qPHb6jGHhgYDhmuPn2FM9bUuulkot082/83QHQXm8gfgxxODMS2/geEvaoJ1VfShgQQU
         IbzAfIwQRbyY2JLO/h8bALK30bpFGx7TkABA+M0xMbIMlCxAGXelrrhI7WC/db6VRr/8
         CUXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w2si486379wrr.5.2020.09.07.03.20.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 087AK2HV017456
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:02 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2J024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 8/8] pyjailhouse: sysfs_parser: Merge adjacent RAM regions
Date: Mon,  7 Sep 2020 12:19:59 +0200
Message-Id: <3e1ae553f995e2b23867e5f58633beabf0760583.1599473999.git.jan.kiszka@siemens.com>
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

The kernel tends to report regions that are not page-aligned but
directly adjacent. Adding them as-is into the config will make accesses
fail because the regions will end up as incompletely configured sub-page
regions. Detect such cases and merge the regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 7067f779..19bc16c5 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -207,6 +207,12 @@ def parse_iomem(pcidevices):
         # filter out AMD IOMMU regions
         if r.typestr.find('amd_iommu') >= 0:
             append_r = False
+        # merge adjacent RAM regions
+        if append_r and len(ret) > 0:
+            prev = ret[-1]
+            if prev.is_ram() and r.is_ram() and prev.stop + 1 == r.start:
+                prev.stop = r.stop
+                append_r = False
         if append_r:
             ret.append(r)
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3e1ae553f995e2b23867e5f58633beabf0760583.1599473999.git.jan.kiszka%40siemens.com.
