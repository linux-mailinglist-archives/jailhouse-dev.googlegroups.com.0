Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF6RXPYQKGQEU6OT2WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id C395E14A546
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:43 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id z2sf2562256ljh.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132503; cv=pass;
        d=google.com; s=arc-20160816;
        b=xNAD991ERBB4eUigVd7zay9DimEVUP2NFePqS4Ar5FZZ3QHjQcLICgO+OnuIevvSWg
         BCA/ZkSz2adoNw4V/7z6TXrZsP1+IqM05JnIlr6KDxDECNabQUGkAt7pmwpXdjkrh3ez
         UqUfkVJjHW2GiU0NAMuWHyupxdh9K5KCylZwfZKzSAubHToWyHZCkqk/TIg6BjFHEBP4
         eB8Slb6/byuNvf5A6tSzBJxfOQzkiWOeRZIt3ak4FcSvlJeBAhSaDJ7lflBHeUQcM9gb
         IosnnsbXszhIhUiGJliNfZ+Tbo2bfu0q5HA/BkryVc5kFkbC8EBl+yWF+YUsaU0Oag7X
         PrwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=tMSrJM8FI7lsTekDM1I40ZNJbI0yjinui71lk0Z2UzM=;
        b=CzJK82HNOc2IojQVtthC63r73HKe6tRyO7VDiosKiQ1JMywurwRMfy03ULn/V2bF8p
         FY4//4Y4UgT5nksYoIQPL5eYNcEn+uWRwRJW2631O19ZzMLn4x28almjOX+LFZVM2vFz
         IyuIKL8AEzyUlmBbj+nsv/By4OksNUBTHCPiPG/1dQdjDB4FK+gTKJaFVeyqMQIWgrkD
         FGHyS/lszcEIfP5q+SvLL2jQofdO06uLCbryKMykbNO/wlgHW4xv3/0sAusfAjh6Zzce
         ivYjECkUPmhnCNXMEnHo8mo4ICHfew6qDv8ii1RT0DsY2sZX7BBszmWKNfKAI/n8SRe+
         V6dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aNkbdVkJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tMSrJM8FI7lsTekDM1I40ZNJbI0yjinui71lk0Z2UzM=;
        b=VeuO7YmANZk1gDLitdq/7NyjkTB10crDAd7SKqKQOGKBca2HW1Mc5mufocCTizRsk2
         QbZKzDAgn1xWpTuWO9D+I0uq1lSsY+GF0HXIzchcJ76/KnRriaXXF+Fis7N8ven0084k
         tYpzxjHk8kL/DXqqx7jHeorFowVWPJp1jL/a9uxvMTAPv+BjHe2V75zwsUvuHpQ2DiYE
         6iQDqKV0vak4fWT0oQ9owwwGOMWpIjHdxrzUswNJL8Y28tbwsIr4TN5gPBRjr9RV+wmh
         qFN5u5u94cR+2Apdg1v6bmdpTWW/hVQWOa3bs08h9RhUv+V+xvABhn0bXdaPX/rttxpV
         4KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMSrJM8FI7lsTekDM1I40ZNJbI0yjinui71lk0Z2UzM=;
        b=EOAmHVG+sBF3OupThrCh0gvc5Xjf8h/EuuNERAfhj5VX/aw3WuK3lwx9CrDjwNUAKc
         I1PNfieV/GBgNyMLn51FkWgDHN6Ik2pZkWNIuMSZdLKsXJiwHdwDCqB1c+1RKZL0R3ry
         Bu73Ewrtg/+hH6oO5zQMhJAXrEUtq6//DGWIAtMnPm5OvdAD1a7ILvsPNvlg4ynj/7Z1
         WGjB3FhflnTnilLjGnVUmAbq/8WCItetSc4azF1L1ldcL7Y0JivbT9f3WD+Y/Xds4LCm
         rYNsWh20IeFUM6Sy5FzzZ3EZ3Q4b3rhojPf7uLeXavP1v59v64S5rE0P2G3mYCB4vQnp
         ljhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIvuwfmPb4/kP7y+6W2qv1NZaPoaiZXZL4xk+yepK3S2nLnTJ+
	PleZxfR97a7HB2iBEV3liqA=
X-Google-Smtp-Source: APXvYqwRtvt91BkTwk5RLSA2RUzWkXrQF8/l3wlnyrPVfbRLAiN2P+4ZpORkSZQHB06K7C7HfX5phA==
X-Received: by 2002:a2e:9090:: with SMTP id l16mr10609670ljg.281.1580132503305;
        Mon, 27 Jan 2020 05:41:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c397:: with SMTP id t145ls1091021lff.10.gmail; Mon, 27
 Jan 2020 05:41:42 -0800 (PST)
X-Received: by 2002:ac2:4476:: with SMTP id y22mr7940802lfl.169.1580132502601;
        Mon, 27 Jan 2020 05:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132502; cv=none;
        d=google.com; s=arc-20160816;
        b=nGqpVVnuwJBE6K7OQt0nOHrFGyDOujOEFm8V6OMep4Xcd2Wsc+aO3GtlZnoAhu9dPT
         lRrNYr1PTnQkbioNEMDeuNSoeZvDjbUjA09oylnmlBdh5unh/AHa8EqMwbmfac+2DRGo
         dvXWL4NABc+aYWPkQES6928sjyJcL5KvtS/ZO0M1TaPSNb4B/fwchCfM655deyj/88RA
         Am5OBWontYkAeBl0y/vAreBO8Xpnj6nkthbRuh+BGt74tlWupZdOcRacb3btuNVT2Rqc
         7drSnfuzb7JXWwKpaoZsw892gGhB8uAPT/a2HVXwYlIVBiQWcwesu7fXOB84Ce0rRaky
         TTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=vNpBPAORR8YcaDnzev4laz8tToO9unBedmKqYE0/ETw=;
        b=GSN/gGDPiBKKNn8gEp5h/cyegOO+YRy0TgAEk2xrd1Fl8I4XX2MKkRc7pVJzZO12b9
         Lz9edcZ3JFzzwIPHUXKnzixXmfWVay57dTuVM8dXZVW3mSBfrYsV9zrqWgkN2GKFb39Y
         Y45Cz19D5e2Y3IenT2GozZLMd5VqpRhVUk/XqCAAjdBiIHNqZTr0S1CZtt+MfGr2/ptX
         D1dZEeBXN4+wLWxH5O1sSb1KZZ2OT9kKvKYr6h/p2E7Ya4BGbPXZOshw9camNkjHMVGh
         icOrJMeYC+Q9ainkorsDP8WlSnwGL71Sogl7N6bKpaqXnS3QjtQl0b9i16ez8Oj4iqVJ
         S6Uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=aNkbdVkJ;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id e3si564413ljg.2.2020.01.27.05.41.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MhDYL-1jIIUO3hqb-00MPM7 for
 <jailhouse-dev@googlegroups.com>; Mon, 27 Jan 2020 14:41:41 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] TODO: Update
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <ebcd3968-76d7-374f-e199-944fddcd3210@web.de>
Date: Mon, 27 Jan 2020 14:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:STgVOSWFSRZptv0gUYBGRzhiTXX+worTDx5D4bU6SJ9dTjnW0VJ
 dBN6paptflPFjwdk1XqhRXyj9AANwtVn6GSDtJsa8XLcVqBtxs7w/P/BWy/q3fk6CUjXGx2
 hoe2dHEjHATJSPtAdhuZ3bysazY5ygrWsp3pX92F2SrNZGlyXNNc+OUte53pnAvu9yR82Bb
 ebdYweizIb+37s6DfTH9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RHnht5LKlM=:OGrE1Vm7V2vsOvxWN8oqtH
 PxHd6sGiyLg1pFGvEWTF+Vdbxq2hq+xpK0bg+qmd6bi7f6zK74dTjXfrXBUZ0xvqMcqZlQtbi
 WVTD+Vl0OAzkAOS/1GYWpAeu4SJOak0OezhLbYJiIgfW8ukiCcoCFRXRJyyuMeFwgNyHJIyuj
 HrIU5mfqFApy5Ur71/uFil3ZZcn0StjGlK7HDPXHgmGGrW9FhhGiSQic6TuDZjr+7jHIcPPcv
 ZrHMKmEGh6IzhSxQVqEGf0MwBHb8Aywm0ZEV48MVjAefeuiB/vtgyib0NxqGEAhxtHzlmDDsZ
 LdWQ08piBvpQyPHAOlZ7irPFKXN7kqQDUYFd0KH6U9ie1WW2bzNz1Lkhhs82b+nfLI6jdAWq9
 otaGE+BPkj+e0O1a77rWNNU3xtPBdVz6d6acc2pcI34QDSLHwBRNxSNpTrfq0F8g/H90K8Lv5
 buZ2EOqkrY4Wm9TpLiC6QvNZ2oNgDRFXby7IeBymMGd/5TriSv6HVhsSd9GfFzOgupbqZjO0S
 olT1Vx09Pc9LNq27XlaYMK9I67naSGkY87TGb2Kn5wdYqsGR4rW2E55wasD5yVhwxauOIKMyL
 rek9X4Th6wWwA2GmZcSiktLRRlYEgP5B2ox6FX5r8RR0t8BN6niG1sVoih3zuPpR9nO/T5vqj
 TgJJ4Tf9CtfmvQuDuqI9zEwrCPibBwj8w7MChjVJeTbhBNLGkUfCFGuGKqz7DgNVRssMFYb6J
 M+PJueT8xWf4y3/E4vu5s0SXDMxSsY7aR1ITtnPzGxfmIVBz/aNmgTT+DL8Q+DGXWwWoRtxi5
 6HAmPRclWC1cAjV30lwXryp4JPzmzAPew8PE7pFmBy54MBt6ZFp8ze5mHUIf5RTIRCO4ZCc3D
 gN+HrSBF8HZ38bH0sE0cn5BVLwIZ/xCKkV+Ui9TiLqxK2KTPdZN6dAy6ZS/tUByCVYgdLWE4s
 Bb62SaVbqaZbvHIIkIuiSWFQ7yhMsingu6gb4aMm4TBbP8FQbrM37UP04I/KqRyl305x+2JD2
 7r3ejU7zWUfssi0fPIBk/6y5doTMvdrE8jkmsVIrGik0tYelUt8eJyDdQWDfhUZZr8Q3POzl5
 UAgO3fwYSpKrHQuKf0OAwmRBb4LCauifvD0HZta1/NAAZ8ltrYg2igMPpYy7KL5gKBAw3RsQd
 Vz41c1m+ULOYkRip78xofLG4XCkpqv1aWL0Cbl6ylE8azIYA3mYzjHNwK2paaTyUbgg/AxiHo
 isRHznPZzQ2l/Esph
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=aNkbdVkJ;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Add an entry about VT-d modernization, refine the SMMU to-do now that v3
is available, and drop big-endian - not relevant on ARM in the
foreseeable future.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 TODO.md | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/TODO.md b/TODO.md
index cc4f6c47..e923ce76 100644
--- a/TODO.md
+++ b/TODO.md
@@ -12,6 +12,9 @@ x86 support
     - add support for CDP (code/data L3 partitioning)
     - add support for L2 partitioning (-> Apollo Lake), including accurate
       modeling of the partitioning scope (affected CPUs)
+  - Enable first-level only paging for VT-d
+    - share page table with EPT
+    - deprecate support for legacy format (second-level only)?

 ARM support
   - v7 (32-bit)
@@ -21,13 +24,9 @@ ARM support
     - analyze system control registers access, specifically regarding cache
       maintenance and side effects on neighboring cores
   - common (v7 and v8)
-    - System MMU support
+    - System MMU v2 support
     - re-evaluate IRQ priorities for GIC emulation and possibly add support
     - properly reset interrupts on cell reset or reassignment
-    - support for big endian? (depends on relevant targets)
-      - infrastructure to support BE architectures (byte-swapping services)
-      - usage of that infrastructure in generic subsystems
-      - specific BE support for first target

 Configuration
  - review of format, rework of textual representation
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ebcd3968-76d7-374f-e199-944fddcd3210%40web.de.
