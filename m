Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR7GXOAAMGQEPWCFWYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD33027F6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 17:35:20 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id e25sf7732689edq.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 08:35:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611592520; cv=pass;
        d=google.com; s=arc-20160816;
        b=o6DQ1DtkKqz/znN13ANocWCubbOENTK6PcsDM7DIG2SPxXPQcKo/+5d4nR6gk7qE0k
         R6B0ZU6zwXIsR/1Z8CT057kszPVUj8KSTMNjZinbhTNNksf2KBKN0FOl7W/5+5pwLMYU
         rwlzSeaQiNHC0VinAPrQJ2oPFky1AjYNNTBiS/IUJjZo4yDHOjwyP/QHuNhXSZ4i87Tu
         4L5e3j6w6soQlC8WpacPULDDDt4ABF+HSUaPD1JAIKCxeExAsqVc3Lo3yiVE1wAnMDS1
         KSxfRCVybLQtGNSfaAv+nlFggvFtfaJ6uI18QwxkNkH5560/0rpDT6LiOvwewxZavoFH
         2CmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=s6SHQwrvMOdSjCn+dMol3XCQ/NSB00E8T/HCBcHlHkU=;
        b=uHjikiaWn6dPLXrNgNLotGtlKz7m+ARev+DNZ/KbD0vzwDczPX13lrLB+jZfgbI04Y
         M8t66e6rsNPD1VRPynVzgyUUEFx3/0vn4zxmKD2uUa05pKAtikLzlzlAWJQyWagFIrrv
         r5ftSCXaumnn8iZSUQbLODCziKUWTW9MUpnwS8M6o+zWNR2sEJUu4uQGi4rA7f685nMS
         NIx1ExvJwrWEh/divm4YCxLPsMf4N4/JjyqPuXYN6ab+7g3RyxC60RMUe+f2dBZTDTh6
         VQ0GkdGNH+6y2RjXZZPuD9v8x6VYb4yUzjIcqwA+q4FcnkOigl+XDtFiSgRPuSwK6uNV
         SvOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=s6SHQwrvMOdSjCn+dMol3XCQ/NSB00E8T/HCBcHlHkU=;
        b=PEx6npg39C9Xfwce9Pm8QPROC9JTJH45yk8k/Ezg4tO2OBWxm2EzhbHj/awK2aESOq
         5IWP9qlhwaYCu/Zs+ZIy+8ZUpVZJ+hf8+YdnGj3/VLXYpHqJtABTJvG5rtOdyfR6+Eej
         TYU2U1Sv8sVGRDC3TavoLIb8+XBD8OUtwLkKqpH8SERooRtYEdOGXgf8BJ+koPyq1bQ8
         zLxZLKSSFRcr1Bqhdu2/xL9U+vaSBFc+Xvj1BWv51xkzfMU/MJn7UlUYYtBeyyGMe4Iz
         SEg/KNNagAsEJ+aTEhzZlY6ikNyv3c6/AwAPna+AtjarpjZdeFAYkQ0UATlH/7rvQrd1
         tZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s6SHQwrvMOdSjCn+dMol3XCQ/NSB00E8T/HCBcHlHkU=;
        b=rBn7kFcVM31Jf8DLDbBvSj68GR8zbKNGYIwdZpaFZdBaaCCw9rZ7lNB9P31DKsd+S4
         5klJgc+IM+v9L70MM3ohILLrlZtrnE9y0YDV6xLxstev70MDVOxHJpZo7D9fLR+iwjGa
         fQNegQUXpCjRFsb/B/Yop7iGnaEi93eh/7FcukmDADdMf/LQoJ25niAdK3P5KnjGegdC
         WFrxDHgSjPoYHM5KIr9zPg4NmKARWZL3xzNUDbryGmmoUhsQtBGxzANe2VcJ/ARwsYzN
         DGKdQ3PlQNvs8r69pT1jBb2ooJorKEYNT41hxqZ/ZL/uxNiM8dg5EAYaM24+aUjkO9xG
         gIrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531y8WYcCmXR+l3PmkpAcT7vQdM305oduGuxQ9KwRMhTA9QCh6E7
	+9ilTGTFaEob6w2h8UyCy9g=
X-Google-Smtp-Source: ABdhPJxofhraFg0zkuihP7aP3954KheLl1pflYfkTrrtU1Qc3WZHiaylXGdrFmEn/Ut76rznYPBYxQ==
X-Received: by 2002:a17:906:30c4:: with SMTP id b4mr906210ejb.456.1611592520171;
        Mon, 25 Jan 2021 08:35:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:520e:: with SMTP id s14ls17104253edd.3.gmail; Mon,
 25 Jan 2021 08:35:19 -0800 (PST)
X-Received: by 2002:aa7:c719:: with SMTP id i25mr1176064edq.197.1611592519254;
        Mon, 25 Jan 2021 08:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611592519; cv=none;
        d=google.com; s=arc-20160816;
        b=zQ9o2XibRTz6CTCeb06mdTJTddJdmy44fJ8ZXzC7yz6yKZ/wfqg+65vbq1YQuYYQAD
         MNK5XV7oQGbs+z8ZSB/W3a0eKnqTpW36PvAi8Rl6LqCC6tPbsb76BZlxJMEcSYtNYwDt
         IH1M9iI1a13qr0lPnYrcN3RpFuJgqTdZ0gE+j+x7tWMtP31Pg+mjYkHgARgiDomE7P/Z
         24YFr22moHxnba5K6HD0S0i4NWvP/B+kN7HmuTixDNTTjZyHLV59BYzzUcWYfvj5pe0F
         YZ9z1vGMOnJobBGDI28DMuKeQRtsprvMZJM9xFrCMnCAtx84yCNbvl4IaHmYtBi9Rvuq
         D6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=gwjWKwxTBTGCVsgKIo6tgstzcju0oNtw3wN6Zvm0aCc=;
        b=WAcAOw0xbawdHmyLDH2czmhY92BBNw4PAn74ZRIzUqyHQbKFpQe2kw/qE5f7osqhbm
         i1NFZl+/BUU0yS6Hw6x3NByQicoHZCNStUuHB1cd4su+hkJb/U2j5cjhN5lwSJkjkJlL
         ApjL9o2jRJclIaiZ0koPvr8MAqdJaU3RkVtz57tMa4FRuxs9aYYVlEqxcw/2JFV7Q5FK
         x6qYvguOX/R7V8xT650/S+Jp4Ji1+Oj8/hBwsqgU/Q5yOE5Ng0svSwFIHB0KU1xK+Z+g
         BzgBaw9Zki1hsvP8cKV49RMLstYc7jd1yHjS7kUwGMREC1ozeLxBS66hZHB2vyRXAA0U
         C7ug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f4si491948edr.2.2021.01.25.08.35.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2021 08:35:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 10PGZIEH029163
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Jan 2021 17:35:18 +0100
Received: from [139.22.43.13] ([139.22.43.13])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10PGZIB6032003
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Jan 2021 17:35:18 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] README: Migrate to travis-ci.com URLs
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <1c93ef09-de48-f1be-edab-51b88da86ddc@siemens.com>
Date: Mon, 25 Jan 2021 17:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The project has been migrated, just update some links.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md    | 6 +++---
 ci/README.md | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index c95e8e07..3029f6a3 100644
--- a/README.md
+++ b/README.md
@@ -61,11 +61,11 @@ Mailing list:
 
 Continuous integration:
 
-  - https://travis-ci.org/siemens/jailhouse
+  - https://travis-ci.com/siemens/jailhouse
 
   - Status:
-    - ![](https://travis-ci.org/siemens/jailhouse.svg?branch=master) on master
-    - ![](https://travis-ci.org/siemens/jailhouse.svg?branch=next) on next
+    - ![](https://travis-ci.com/siemens/jailhouse.svg?branch=master) on master
+    - ![](https://travis-ci.com/siemens/jailhouse.svg?branch=next) on next
 
 Static code analysis:
 
diff --git a/ci/README.md b/ci/README.md
index 3f29848d..9fdf8fcf 100644
--- a/ci/README.md
+++ b/ci/README.md
@@ -2,7 +2,7 @@ Jailhouse Continuous Integration Build Environment
 ==================================================
 
 This collects tools and generates the Linux kernel binaries required to build
-Jailhouse in continuous integration environments. Currently, travis-ci.org is
+Jailhouse in continuous integration environments. Currently, travis-ci.com is
 the target environment.
 
 How to use
-- 
2.26.2


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c93ef09-de48-f1be-edab-51b88da86ddc%40siemens.com.
