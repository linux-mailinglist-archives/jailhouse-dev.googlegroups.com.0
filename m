Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2UKWPVQKGQE64IOJPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADEA4FF3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 09:31:55 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id e25sf425554ljo.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 00:31:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567409514; cv=pass;
        d=google.com; s=arc-20160816;
        b=Mm4o98k9xvGVW7DdAfidBx8ftl1grMvQlXHXj+M9KR2Bmp3R4P6cUhI/at3QAHOFT1
         Liu/C0u7LKAjvJAgrQbk9uk/PvpGK0KrVJTMs3Lmb7Jhfl2McoBBe4xxxFYt2WC+eXya
         pPtVrM590j25ANuSVQSl5yCSMk+G/4n9Rt3yq52m9+07jVjCR5s91RXIN2swEogChCt5
         M7vSVYZCznCCWFFlUaC3gvL7E/UhMEtjGIgoXjHcOJSXV4PkdMbGHT9mIvRcg3s0FFdh
         q/Yj8pKslL/KMKjgz6x0ovYusY4qCLf/WOsphNo641RUEGbdTGM6RQDugK0YDqysSLBj
         bzOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=a9jdak1LACoN4zrGi0hR1DdnrQM/URRH+dNqtkg9l5M=;
        b=XOTTvC3bhrxlKNH8BhJGWCRxHowflZJbamcj/XJvlUmS3uKTXpPpqCEG/O0fthsfg5
         KZ5fpptw06fA86rXXTs7/9L2fFm62R95cg59eDgzt3eX5sKb4KkZ+jHL37Soh4c053eE
         o9bc0Fdqulp2WtKIgK3f+4/UyW6VGewPCtxzTKJBS1TXQAertwGyN/gliJXu4Lu7XSk4
         xY3PNQTiC+Kb6Euh5byJRIuyAhF9nGLDz6ByvWkww2ec1CBVXx/RHVH2KPlQOcXOkeBT
         9tJaDCzeWWbxskKCNV2dciFlF5f+jHw3jMmWPZzYAqFJkPxszdT7oQvyiykM4YFS6G9Y
         piXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=a9jdak1LACoN4zrGi0hR1DdnrQM/URRH+dNqtkg9l5M=;
        b=TqnIbWy/z6JCBkc+DB/y/PnMMvvdqwc4nuhVvLUfr754ODILjKa1MvDqh4LS2rTDSQ
         QgPzsJHoCDoN7QNa+WwRDO78c6dg8G12ozBXJ+ZXDthXqYstQb/lfGGrLhjsQZCiea8q
         mJN5Pc6OUDPXBEF9zrGNn7y0vBKztj1OOgPBUbcIpEepM6usGA/iedyK49yW7yIjHT3M
         5wBo2GB1AylIUWlpYhkG6Vy+2OuoKbVZ8SQ8NbNozap3YOLJ3cX9xntVKPlz5/c6jtv6
         C2ecb4Hnkf/6YyUXKyAnpwMJPwgtQzh19NEkeuR+Sj6Rq7Vzp67w8q6doCJ9wKt/sFnm
         mujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=a9jdak1LACoN4zrGi0hR1DdnrQM/URRH+dNqtkg9l5M=;
        b=qF8SmaO+CF8NsJi9auth3YIni8/1kjv0lfpyyN5NpQYmx6Z6NQPYHQEsNpjhErTzuz
         jE966NaIYVeh/sNuHpm1X210BvYpgBzpDanB0XA0D5YPpivVW95AqyQPFXXLU60qWm5W
         JF9QHwx7UwwFkswtZDnPaN4vNF8c0AGkidy29G4aKnM+8TRpB7PCcy3MxnUqWhS4L/3m
         MFJBvS3qdkYfDmhgfaDeoedYR66S9+V9V5aVFDJoLriw22jtLemGFs7TStAamsVIPd/0
         3c3Gpq6WibuqE+je7BhD6k3qylmDwpBGTmpTyG6StdDFBftvJcsbN4YbtqLyoNmUTPAJ
         udpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWm6FBOCbGxvAUvu+HV8AaX3zYQI2Ry4ly7ipaJgfWuVg/1hzK9
	uc2zxlREqd7CH9GQzEbfx18=
X-Google-Smtp-Source: APXvYqw9kOVpThGadVnMqIRJa36kO59kQuvFmoN5vu3h9SHh8F0gcoQuTPSPne3dg2VBNv/yqOLt2g==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr15207881lji.200.1567409514822;
        Mon, 02 Sep 2019 00:31:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7510:: with SMTP id y16ls1090247lfe.3.gmail; Mon, 02 Sep
 2019 00:31:54 -0700 (PDT)
X-Received: by 2002:ac2:5090:: with SMTP id f16mr2237350lfm.66.1567409514004;
        Mon, 02 Sep 2019 00:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567409514; cv=none;
        d=google.com; s=arc-20160816;
        b=AjqDqxe3KMvh1H6mbb7ixc8S3NyDx+rCzyxWoH4zSb4zTjxKDF8MvMQ6pH4183bC55
         msF0NjJ5a+/oY8A3P/QWPTBqoFduMOLZZqQqfiyWT7LVspoVH4NLjfkvqFCYPk0B9C4F
         ZErtPWSgA8AKLe+l7BoelcgyV+JEizpQdew8Ow+LFupbJmmcoe48gdbMiZm0J/JexE5B
         wTEzhmOhYg7ZbErI/1bSPsLj+yCoiPhBKGnrs7wNN3sgQMW49i239Fos85+7lryHbKay
         LlS0hfuarCGAz9z1IBjTbqC9icfn+y1U7WdfCa1xm/C6m4zEuWHpT1kvD66zl+q4ICso
         zY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=LwLlhuN1dEsozFxL0Bxeefwy9nwE3tZ7Ryx7B8XAdBo=;
        b=rQTTpsCEz4CLd7A23E/kb/z29Qm1UIdaAQmZZ1lKFBkr802S1i8dEprM0UuG0uEIxw
         Lb/4t8sQbTiARdCBcf+cGsd3w5qiAa/3F7tdXwJrWc6ls6UPo4INKnlDqcBTXE79gSZp
         /TSEyyMuDQqdeZyBD1e6IxbCnNweQFpKN9Rh/K3zoJENS45roMbSNaPWRHHgE8p4c7ZO
         JCkzP2HEXKTvG0oc9Mi2ar/UTc6TtZ28iklmtqwL9mn2iKK3RqP4qwg7y+wSz6cTqkC5
         jSOMosgnLD/KDOUSNrv9L+8cvJgRWd/w2EWKddbfQEBFH4ZHcEkgFrDyDjE/YyVkVqJx
         BDUQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z20si167852lfh.2.2019.09.02.00.31.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 00:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x827VrJo028376
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 2 Sep 2019 09:31:53 +0200
Received: from [167.87.32.192] ([167.87.32.192])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x827Vqc8014876
	for <jailhouse-dev@googlegroups.com>; Mon, 2 Sep 2019 09:31:53 +0200
Subject: [PATCH v2] ci: Update build environment to Ubuntu 18.04
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
Message-ID: <57ccfd93-38c8-e58a-5c28-c9b7b5fface0@siemens.com>
Date: Mon, 2 Sep 2019 09:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
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

This allows to switch to gcc 8 which may report issues earlier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - use gcc 8 rather than the default 7

 .travis.yml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 8280912d..2d120561 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -11,7 +11,7 @@
 #
 
 language: c
-dist: xenial
+dist: bionic
 
 compiler:
   - gcc
@@ -20,9 +20,10 @@ addons:
   apt:
     packages:
       - python-mako
-      - gcc-arm-linux-gnueabihf
+      - gcc-8
+      - gcc-8-arm-linux-gnueabihf
       - libc6-dev-armhf-cross
-      - gcc-aarch64-linux-gnu
+      - gcc-8-aarch64-linux-gnu
       - libc6-dev-arm64-cross
   coverity_scan:
     project:
@@ -34,6 +35,9 @@ addons:
     branch_pattern: coverity_scan.*
 
 install:
+  - sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800
+  - sudo update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-8 800
+  - sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-8 800
   # Work around broken certificate of scan.coverity.com
   - sudo curl -s -L https://entrust.com/root-certificates/entrust_l1k.cer -o /usr/local/share/ca-certificates/entrust_l1k.crt
   - sudo update-ca-certificates
-- 

2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/57ccfd93-38c8-e58a-5c28-c9b7b5fface0%40siemens.com.
