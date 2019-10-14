Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBC6FSLWQKGQEKSND3CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 6908AD6752
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 18:30:03 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id r187sf190924wme.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Oct 2019 09:30:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571070603; cv=pass;
        d=google.com; s=arc-20160816;
        b=ocJb8Qzj+elFdyFtOoOzMCXXML+HdCicCy1XXE9mbNAAGW6MUtG8LH2wPlJYPUKcwu
         VeSLKaEQ8BIM1W6JJdcmDoIFEVIHnZBjKcNkJyYsAMsJCVEHn8GO7SuAOpdWiOYyaJ9k
         QmEc0ajM28/gF3BCSQQCSE9eMPAKAsXlFnwVTQ7Vo7U8OmuUdifF3mURz37ksCS8LzdE
         T/qgw9JNwU3baRfmkYnjJME8wDsXxzqLUgqAI8ZSQaowV3iLuoMyKp/JQIXNxC+v7b5M
         1ijKewrtHLUASrCkYT91WF5VTFLgQJPVF3NbTIfUv+MArT95O8c/Jj1S8oiubcoLyt6g
         b6Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=UU8m3EUwiEpcjWlE+KaxRfcVCqe43MTpk0ZD0PDauYI=;
        b=DvwkmxuWHy14OgGyoPYE/e0cf/cQB5RbZzSYR/kcTSDyYzckGTp2wmLLXpwpVVFVWu
         6ffAWQ+vasMCax6c6owkEOWkn34147oCLD5fZ1Vb8CkwzRrAXttKLy+J6O0CjzaTlxTz
         cx16V6Xymf+nZF9DktWNculDz/r+IoTHN+toTpWo/r3N4Ns9lDaDL1g3rgqIvi5HNycf
         4hxo6vtfX/cetmKL18EOvXeczBVbLFZL+WHv49CqkL++a7/EEAbyAbFMOG3aSHo3a5yu
         g6vLK7oCDpQg+0U6L+b2d/tpysPh87LtaJj+82t1Hfof26gntoreCSe3zvo747z5b7uB
         M5xg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UU8m3EUwiEpcjWlE+KaxRfcVCqe43MTpk0ZD0PDauYI=;
        b=KOlAFm6joARTtbFxLDCTAr8M6D7hL+E7SeT2w8M2Iwm211djlLJ6vKhF2hr8QFV40E
         hMUb5pU9hOG/Bx0hptNksVzEp2covi7nPdTL5TD3G44GK2xK3aKwm2wwJXYMheVX4444
         6JqRQwpNgIQHGfXLCqBMfQ2Bv1zPCdpoXXm9WeEyLdccnnwlAfhYNuOnn+BxJrKrR8YO
         doFYfUGlf2mHqhcN/nSVdAxdCC+qbU4nKX05x10tFdq+XzQ//FNcLE/q1Atl2rxiorNt
         tw/VEjFqn/d+V6qxS4GyXQeTGw/FbKHRQ9cdofjUSYF5MxtTgWAEyhQxCfmTnJgi4hcV
         Z8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UU8m3EUwiEpcjWlE+KaxRfcVCqe43MTpk0ZD0PDauYI=;
        b=bNWNda5DvLA3eFTUv4EOo78gxVYrvRV/D5prZSPpaAyGHreqq8FxZxGwQOjESRfaO2
         wSEdKymLYtFRRkpt3gNN2WL93UUkN1dAlf5t5pkzv1WIQzAP1oxEvk5tDzYopZo2COY7
         4iIpn9UMXAxT4jdjdIoeOOA8p1DtW4aZHrON9N7NxTqIw3p+hcJzFsJI5mC4IXqlXPP8
         d+ee40GtThp8o/yWsZkGmPa9jRndCgJ5fO/azy83wiG/HAG+Bo5Mkoa/wv8pA1LfaMaQ
         RvejGlKw4c2STpqn/ZyHSRLaya7Ebyo3wYPFsWsHS+q7pmaGvvSswGqseRphBsMa5Bd1
         XE4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWWQOnR2aSSMEuumcw1KP+mIpFziqK0UIrWQSWnXr6Cu1sbuYRa
	Zlxjg8/iG1PYYxGzJ423IhU=
X-Google-Smtp-Source: APXvYqz84vIU2TVZEktG4om9r5p1nIMCPVA9JFu3yx4TsafUqLElxpOPcySHpuwzVc9n3lwOb7l0TA==
X-Received: by 2002:a5d:5681:: with SMTP id f1mr25288678wrv.336.1571070603105;
        Mon, 14 Oct 2019 09:30:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4c42:: with SMTP id n2ls5641693wrt.8.gmail; Mon, 14 Oct
 2019 09:30:02 -0700 (PDT)
X-Received: by 2002:adf:8123:: with SMTP id 32mr27834923wrm.300.1571070602438;
        Mon, 14 Oct 2019 09:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571070602; cv=none;
        d=google.com; s=arc-20160816;
        b=D6BXSsE1UZKpueVzx5fDGGr4b/UzP9FLdiNxWHEt90ucHJUATh43skl1QGSCJvt8y/
         JWy+pQIZZkh+52DETXBve2Eg92Kfgr/4rcpH8EmXMJFE4az4aei+3Db9/SeU8HZAnKde
         oLMD/NPozBRd3TLRxzE0b+RXWfJJGSeEjtEx1MgfLZaDcwYGBi1CYYrvXozPCpr2SJQs
         OZnptk5QlR3AuwU4yA/+tCH1lsHd0cv4yCBL5ZlGlkYEcynZCBN+bmepZz4GPHBQiJwa
         85+RNipN8Pa49OKqkgcJHdXIRlLqTwf+MR2lV7sFJozRg8rV7S4pkfDZviYQDXnPlcev
         3+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=SczKxUKop3m6ikX9FMpVUC60VKbWBIG956GJ0Tp1+CA=;
        b=OUNxVgL4LPdyw41WmXT946WkB0x7Xcy60Pa8iL0dM87XeNJKE/xcLHqZNZ2Yi6rMNm
         c23rdKa+KGyZ6wkl5gyI1bIPx6nKqOTTSAGOfMOj357moUeSFTubWLeBo0DKNDusn4PG
         +q1wO0md0lNW5gqp1RBXEsofVX4bqV4qxYy5UdE9kjz0mBFxom6mnrzJpTnW6nakKMYN
         dyZfymkZ3+3nq14S5p1Ch7ndQ4yAFeDWyhJvu/X2dVF7mEyIsZ3wdNlf/btC/KoUDiTY
         08at5A93CD/j2YYkBF+DmKl1jehjBgKoZOxj3FfGCNzEUMwLmDy+Zmfl8A5OL4YMyHSb
         Av7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o10si1516882wrm.5.2019.10.14.09.30.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 09:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9EGU2rR008661
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2019 18:30:02 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9EGU1nT006002;
	Mon, 14 Oct 2019 18:30:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] Fix typos in CONTRIBUTING.md
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: laysan1509 <laysan1509@mail.ru>
Message-ID: <2d68de4e-3a1c-824e-b6b4-e8f5a94a6d93@siemens.com>
Date: Mon, 14 Oct 2019 18:30:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Reported-by: laysan1509 <laysan1509@mail.ru>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 CONTRIBUTING.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 844fddaa..249618df 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -9,7 +9,7 @@ also sketches the typical integration process of patches.
 Contribution Checklist
 ----------------------
 
-- use git to manage your changes [*recomended*]
+- use git to manage your changes [*recommended*]
 
 - follow Documentation/coding-style.txt coding style [**required**]
     - for python code run pep8 coding style checker [**required**]
@@ -43,8 +43,8 @@ Contribution Checklist
 
 - add Fixes: to all bug-fix commits [*recommended*]
     - the Fixes: tag format shall be:
-        Fixes: 12-byte-hash ("subject of bug-introducting commit")
-    - if you are unsure of the bug-introducting commit do *not* add a
+        Fixes: 12-byte-hash ("subject of bug-introducing commit")
+    - if you are unsure of the bug-introducing commit do *not* add a
       Fixes: tag - no Fixes: tag is better than a wrong Fixes: tag.
 
 - post patches to mailing list [**required**]
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2d68de4e-3a1c-824e-b6b4-e8f5a94a6d93%40siemens.com.
