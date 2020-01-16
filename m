Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31913D7F7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id c17sf9048624wrp.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=ECvAVRLuM3YRu5rFyMYaRyWTYS+/pKV2ohd6f0K9p+OnoHWBTHffypV6fQm9qNcz3d
         G97rAsUmgMDPz//2wZlwvko6YWwFiuc/b5y3pR8532GAfSKX+wBAU1tJSiFI20C/lMYU
         YfKnydTwDmUQVUUwa9Oc4QRK3tvrJPv1bDm7FeT06qpqa/o2oK0xiISCsU9rQihNWAUZ
         xSv+ZFbaK1rMwpsp57Yce2ngv+O7r8Mt5l5iixBC2OXtJYtvGhBe/8nvay50wZ7SNHtG
         w9nrkCnDlHDMQDo0vnbbiBECQHOCEgxgZcVhaJCAnfIpSKmvi9thbVliOfCQK9gcKhAL
         IDtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=allAi4BeZ71C+7HsyQ2omPWvRm7cpar+ObDUr7jlxag=;
        b=fTUn0txWwW1a9TfqMvxwCl+Q7hS2quMN7C9hNL6fEV35RjU3u7f6cFEnGxj3L8OWEi
         iRmmISliH0rK8ptH9DeFIvA2z7wDhteNr5Abmxg48aqzryaV8jDq5TaovRZt2KiLjOA+
         IB9VifTDXgf0M86Xae6DUqRx7MKpuc8mHfEEdu4dyodY2AjDDY7hu6FR3f5CUQQ4Xyvq
         iWRrBq0+clp9J1IhcrI+Y1ZVsKku9ZEH2KB0Brar1p/UJ8sK4wpRXetd/u585Z8s3HMk
         LQOrqZE0d9K0KsytlZ7+uGtcqENicCG0wLInHOApn3zQbRybSD3YFmFoXAvNGYhiiF+P
         BKjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=allAi4BeZ71C+7HsyQ2omPWvRm7cpar+ObDUr7jlxag=;
        b=LGsFe9yWyoIoUSiyxWJVGeeBsb4k+Bm9T0mh6CyaAqQm3k7TMcTufD9r2TtaHdyWQD
         q/Xw/fvwYxow2JSHcGnlPrppizrbE5KmRkhjhxbOVDHOXO6/3T3qbNZLnqnstiMA4BK7
         wbEWMCgoiScg3ZbPGMWstLk9CkU7HpDjDWwYgVJQfnL/GWkSs4bFw9wGTpdnsmO9w75D
         mpeqrSvKZz80JZpqTSz2jE7m9WgAu5DLq3m+pXQQi5l5lQHASzIPsMcupxu5l7TtGcWc
         CrZQfN32/czjuejvoQChwebliVQ1wJwiWneiiW8F5tEHhZeHhnm2UPG08huj61yeJkOn
         B+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=allAi4BeZ71C+7HsyQ2omPWvRm7cpar+ObDUr7jlxag=;
        b=BTWb4GpJS/Wi1vI4QZcOClSIUxF8bAPewOBPKS+GyALmP+dnQLaZXOD/y3rq/cZKQP
         zjquFMzUkOT3Vo+U9xVU0CakIVIEF5JVAXKCYLn3L+UJnDBzIjgIoLmBkVyAQQwCJ93Y
         VGXmOht89V9YnYoeJYSF7w95oxk5QmHBwM2Gy6aR/MT7d8TE0LYlU/NI3aDkYq/dOI66
         8Ma4fNYvj5LGvYamtHqS3CeCBQKRCs5XQ4sxgi0dWr3q5A3iN6bxOiW7iTYAr40C0s4f
         mFYHrieoxyNridVhkolOOlNgVWDn2+ZuNH3qF2BCN6EWLbg++2LPAIgRD1OAOd5INvUQ
         Rtew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXr1xUzBSEFQUqUiShPvhgzhAu8QDKhN3OgdNZIl8d2NdJVVker
	wO8DTQICvnph2v7d3deYF8o=
X-Google-Smtp-Source: APXvYqzLfHTel2/9xUcvzIvf7w6fgAL48PqIrlXz2cbUTph9/3V5AOPRw/W7nYGoB30LokGVIRvdLQ==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr5583904wmj.54.1579170890539;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4d0:: with SMTP id g16ls1025324wmk.2.canary-gmail; Thu,
 16 Jan 2020 02:34:49 -0800 (PST)
X-Received: by 2002:a05:600c:cd:: with SMTP id u13mr5445308wmm.24.1579170889707;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=YfcA93IK9Pdf1kaoTYxmz+1RIAZi9VNBDagb9gjv0qf/EDR3fY2q1F5UbAUNuG4SHe
         bLHzxwRxyzwTWbPNIW+Kn06dQSEcObBjzCAjAIxRa3VmKqogXejvRsKL/iO+F5kz3PDP
         KZzqWQZOoCbrvnnnC1qcDTl32aphZCCR9+MczkyfJyLYuz9tStPlcE2lu/nzoUJvoyqK
         6AZKAlK0lILPm//xVKzgm+dWlO0Wy9Fvnb+irNNzCcnd3lCXouhiOVuNNcbwdDWFer8X
         lFvkyWzl8VzLHLfGoqSAnlpkS758BZA7fPg2pgQnAQ7klwn5wZHugBuflB7yHrcKGkzu
         Jd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=0UXJFgyt/yiJMbBQOR3sTfzrDhtRwB5qzCA4hdCGdY8=;
        b=aSjeq1rBlvjQ5IMqfbwi9gXswORmSUglT3aY6/gQy787nP+/6l3fV3XQfGAIjRXq7A
         FA3do8EBQctWLysjlHUh2Dqmi1BPDPmix0rOZSa0QrfByart3RILQTqxMEeRwpxMP39/
         DnhR8MX0qnbWncC1C9mBHYAxuyuWgx1DtlQLbeLfcvG2tbP5McgZ8m9KcsG/MRQPw9F4
         lgln8PxNb+Xj+4sV9Ek7eF94YR0gYmDobmG3gNxxCvnVxU5phyW2BQU3Y9Psh+AzDtVt
         VlOA/yR1YPymnCUTRi72jiCSaPzscU0uZpsHPmbo62GMQCXpI3ogk7o99yVO+wE53Q6I
         yYUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p16si882105wre.4.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYnKR015284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQH031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 07/18] customizations: Adjust to new ivshmem-net interface names
Date: Thu, 16 Jan 2020 11:34:36 +0100
Message-Id: <1107dc39b514a22602ae7b3f98c06e922585c97d.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

The virtual PCI devices were relocated, and this caused changes to their
topology-derived interface names.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/ivshmem-net | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-core/customizations/files/ivshmem-net b/recipes-core/customizations/files/ivshmem-net
index 1bf38b6..683a7e5 100644
--- a/recipes-core/customizations/files/ivshmem-net
+++ b/recipes-core/customizations/files/ivshmem-net
@@ -9,27 +9,27 @@
 # SPDX-License-Identifier: MIT
 #
 
-allow-hotplug enp0s14
-allow-hotplug enp0s16
-allow-hotplug enp0s0
-allow-hotplug enP1p0s0
+allow-hotplug enp0s15
+allow-hotplug enp0s17
+allow-hotplug enp0s1
+allow-hotplug enP1p0s1
 
-# used on physical PCI bus
-iface enp0s14 inet static
+# used on x86 QEMU
+iface enp0s15 inet static
 	address 192.168.19.1
 	netmask 255.255.255.0
 
 # used on NUC6CAY
-iface enp0s16 inet static
+iface enp0s17 inet static
 	address 192.168.19.1
 	netmask 255.255.255.0
 
 # used on virtual PCI bus, domain 0000
-iface enp0s0 inet static
+iface enp0s1 inet static
 	address 192.168.19.1
 	netmask 255.255.255.0
 
 # used on virtual PCI bus, domain 0001
-iface enP1p0s0 inet static
+iface enP1p0s1 inet static
 	address 192.168.19.1
 	netmask 255.255.255.0
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1107dc39b514a22602ae7b3f98c06e922585c97d.1579170887.git.jan.kiszka%40siemens.com.
