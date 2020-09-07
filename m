Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUUS3D5AKGQED6T35VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75525F7C3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:03 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id f13sf817911lfs.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474003; cv=pass;
        d=google.com; s=arc-20160816;
        b=XOsPBIEl4CHRz0QhG5a4maulwPf8X6Ywli/ZiDa+Qx/Bwp9EwZHbfotOVoCAAqSF5D
         2u5lJeurlow+ZyW0UpKJQ7CidZXLJuN63lduKwCxzY7zCDAttmNnCrW5i5E0SxPylmfc
         Oo1czsuYi6QLcf8rwakBZn+3KDihYTsJh8ZRy1wYLEW3JHNlIDiCM1IRE5dkke+LeI7X
         GO5MCC6EOcijFFKECwKsD6D9PYHnKGf29cuBy26zlYLXNzj5GsvB4zd6rqcHs22/vE5Y
         qQIIAZfiy13LvSbE/zd92knfvB9C3WwxVY4MtfCJgBeldeyIV4vSpp6M9x/Zlx6MEk6v
         xR/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=xa9fyiogEkaSi20NUMDCCIH+INOndfOObil9g8vIJGY=;
        b=Rqp2faSA/4L6phr9qyhY2cQgufZQSlje2tTzLdDErDuJfIGMTl0BP3EYw0pwSFJffB
         0+dqhUdrL/9VtodnsCBZyQLd6HFRMrtZR8VwUvsVEiTl5YRjFZSjDHRclopynRK9jr1q
         EdbUYfw5HEqWyukNPLYbmSVbNgkGWuQYdbTKipI7b3qANJCX1f00IaOjHmJEUwdNyKyn
         hWQomP0MEAVGicBUgvsNS79m31JmgcNhYje4tEv0sSW/Dll2x1GDlfZK0dQfm6IRDaJw
         dZNLRulPKEjHwfnPoAZOxdBh0JxiKetK/1kx0d9csozS1535lXCCkTdTJW12VJKkuVEr
         gF5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xa9fyiogEkaSi20NUMDCCIH+INOndfOObil9g8vIJGY=;
        b=gMAmVtyxqYrRz/sUYC8fT5wT8qXH1gcPka47pyb3LVe/wZquXhzrqNDFTujbZJAR5B
         /8fvF6c3beg0k7XUv9zGvB+qjLvA3mwGviRCecuth0BQSjTxIwaq4Qy+8z4kdlwRPFsV
         RDygYHskwoc8byA0dkW3ZjEykKD1FJ4i7dkCxD6m5OL4W1BdoG46+r2hcFE1jmdPnsch
         3EPGdAEKmO12Bkf6I0hZnYtfeDRmiCfNSpdWZc86zb/uKiNgmtp9XZhgYhYejL/Lw1yR
         6zjovKT3SdBVuweFXKPq5dcxZgST7qAFA288FX6Nf4z+FVgal6vjDz9g3xnPodftfOoW
         recA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xa9fyiogEkaSi20NUMDCCIH+INOndfOObil9g8vIJGY=;
        b=lcrAGCmedTpVCw4/3ZJ/3RkcAPZsZgokWQBQ7NNnzmBJzEFC/5cSXdQAbX+OZ+rQAO
         10NDNJ491K05KybIs2Ivau6LDdsOBJM9nN3pZjfBmksgRAP9PhBVQ6ZYwpmkgs43Aivk
         xjMqRXQ7mw1IRAzLbMYsuopiIx//bmHHGA7VJ3Ir9QlnREVDGokmURMQ9uSWnoY8Icwa
         aFJXvkjX0qxb8LzlWGSKVrWNE7gmyiLzqAGrBsZ5Gcw3yOpod0tnmV3fMnkrjsPsoyXb
         egT6S+yI5fZsTZruSvftkSJ8GBLma2LlpkLiW5hWFsI5SSZWM/HmT/sMzKOVeP3dnovU
         DWYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ociYdYl0LtEu1nHNgX6wfrS/MNjUcROPGBWj2PZWtTPLcjx+d
	0u6HylJIM9u7bsiakRErMTc=
X-Google-Smtp-Source: ABdhPJx/x3fya6QtKwdl8aHwVKAKPMSp4c9Jkq0Cj6SAIx4VeZ0OHSpvtRoagatgNzdIJ38hqt36gQ==
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr9952887ljh.332.1599474002972;
        Mon, 07 Sep 2020 03:20:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7e02:: with SMTP id z2ls3110098ljc.2.gmail; Mon, 07 Sep
 2020 03:20:02 -0700 (PDT)
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr10362825ljh.311.1599474001952;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474001; cv=none;
        d=google.com; s=arc-20160816;
        b=R6IwNTJXjTgsIHkuA8sbksuTzm2Chgx5kUD/hQ/XcZTpgOlBuVqtDD0IRubC/nLM9Q
         HyMfKOR4w5zrsqnypM6iKmLTkNoNSec9EJuLw9oK9lqAoYSXrlCt7jq+0wNaE9zTEa6+
         ux6VU6ZT7z3Ce1wqtg9iula0X0VxGcstRfRKZ+SC7U6vQQqfg8F9ggcBA0AxY4C6BrIa
         tIS3pstWx5pZBQ+INWLtIHuZzMDm9F/DiY+WoP5FlCkx+2gxLhPU7phNjRc+GAGRlskz
         wQcjO4k0dJGXnrJZ8loztfowMGverWspJHNhjIfdCuQhHklLX8cE7ypxMYqphbXtU408
         lPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=WNpWJI4Hqnkp3qwYnKP5jV/BhLHGTvqx1anO+cN3FYY=;
        b=PwVZAqZx68YC1IIscRT4Wo+VgkPipiwIPMGSd+D/MQWdq+2t0FMewNMZsZ9C7Xd6IC
         H7P0iUbA5uZ56QpocVT68wwx/SnlhrmGm7szLG+6WJvvVy+R9RSwSEGIJoKa7W/6S5iY
         bkXnWsc4e8JnTQWXDGmTAtk1d09tMs3TPe/MXsUfLUGd6KzdSF2MckEATCCUyt5Zrscq
         9f5J6+D77cvA8pc7NL+0kupwXmvBJjkZQUhAm131VyilGKb0jeupHUB7zwaBJ64ea49s
         r/5c1JNgO3En/A9mQxZhnJGPVIx7kVjfg0p64rmPYGP2S/LCL0uPrDQ/mtByg4yZmo3m
         FjLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f12si550884lfs.1.2020.09.07.03.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087AK0YD014836
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2E024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/8] pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment
Date: Mon,  7 Sep 2020 12:19:54 +0200
Message-Id: <e268d2fcf4d0c391ee961703b3f4478c4ebca863.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Makes it easier readable. No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 8debf460..a2ce11a8 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -139,9 +139,9 @@ def parse_iomem_tree(tree):
         r = tree.region
         s = r.typestr
 
-        # System RAM on the first level will be added completely,
-        # if they don't contain the kernel itself, if they do,
-        # we split them
+        # System RAM on the first level will be added completely
+        # if it doesn't contain the kernel itself. If it does,
+        # we split it.
         if tree.level == 1 and s == 'System RAM':
             regions.extend(regions_split_by_kernel(tree))
             continue
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e268d2fcf4d0c391ee961703b3f4478c4ebca863.1599473999.git.jan.kiszka%40siemens.com.
