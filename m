Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBJWE7GCQMGQECDERFAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id E153C39E64B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Jun 2021 20:15:03 +0200 (CEST)
Received: by mail-qk1-x73e.google.com with SMTP id n3-20020a378b030000b02903a624ca95adsf13346754qkd.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Jun 2021 11:15:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623089703; cv=pass;
        d=google.com; s=arc-20160816;
        b=U5u7ebwCp6SjoFSYciODGRDj//NtU2Fmtdry8I55D7EO0alg9TjNd77Au4C4R5uDio
         LgQSfG/6sxq08zmyof4+JKMoD4JsJVMhrZvahhV6MnIrxmNUwnn/BDLnnLX05d0fuFUk
         mdJqPcrbiOLMv4qzCHmzvRd/SiBuSqHp63ckefsXECzUxO2b33JCFbtevBmyCwIPZvVQ
         vQapMvMi6Y/Jb/EzYExpIk38XNMZF0t87cActDc8AYy6ZD6O/cGtITwUGP9zsiIfcBrY
         pJCi9G1e9HECha/CCSWNnmcoP+z2548RjmQ6c5x3NcEdObZO8C4QbXuYbj+O1OReR2vb
         G8fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=7PInonDFp28kCgDjIeOLA/PtAfG+ZX3u9YsSAaehNZI=;
        b=eeNHemWkCjOZMk6x19BJKasYOc0/+UdXrU3P7Nwyw8HhAnXek0LFU6Dl6hREN2kKS2
         pIls+2v7hDNAtTDevQNVovMMFqvy/U0dWePyab53Z38PiTHEHjzZppdpl3VUIkJlJKiQ
         YB5eOiFWXUcuoXfew5aIcWoeqE4Hu86zJ1hHs7BdE36sV3CpHkJgTomrZN/Gi7q5TaQK
         BrDs0MCtWj4k5P6eEFSUZWojB/qaXwu8SUWlhcVC/H3yl3kNmGl6kV1ImJD0y79X9ty4
         kyef+Oh2ASW3cWR8Vz4DZ/S1PexhmxUU0dZUfA/Y8M5wVvtbIvs99qfAaKc1HBH/d2MU
         r8sw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7PInonDFp28kCgDjIeOLA/PtAfG+ZX3u9YsSAaehNZI=;
        b=NHy3xpB29nRXv362ungWkJsE8oSP9VOtqs04tbAdOfBE/sjEG20nUPtZ291loX/3rp
         3g36LKd/Oz+jfe1gLNquMg7TUfoWNtc7o9FXdwpb3FLMlo6xVvafoo5JPfKNtrkyt3xs
         9awlzXh3QH8i5zcp6A6EaAgk6+HmVqQf0DmWtwuWUcoDGe+jT2defcfN61Gp+emSyxW/
         fRG9fUDFfx5eSHt+Nnmo+fFrrj9LvQryr1I1yBqNKrYzLFqTxXjh7ikPaYO6WyXo54G+
         lUrTvXCyXnlwtJOEJgXK5jC48mmAfqnuZwjs5xr0GzF5Fppo/dWlGyyle0NiGtcrWxeA
         4aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7PInonDFp28kCgDjIeOLA/PtAfG+ZX3u9YsSAaehNZI=;
        b=bDI0Zz75nHhcXC8YG3OiV21waKbRWOiYKrueFmKw1JzdkqSMCxEFGQIYtMEukejydA
         giEqXrYyA/K1ILN9CMvA0u1iSxdjJPQvZXJaWNSFVCmti0Q4bDc1NZ3KA567oWEHDc1E
         J7RnbJVzruD40I4gUaaWbzXTIYDlx4p6LTX/YLbFv5R2fzH/DLigNr5c42IjAHYhAO1z
         RMZwSjLVnFsPt02C4bJVuJROlOzib1kL6o1/EA5ytVT1gp9396npjXEajgmc0RnOGris
         vIyOlAMlXd98upPxN1NWlCjHbkVo6OTmRE5BATm2rAbB6eZthMeAF+9E6+r0O+/mU2Ug
         eTmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5307A7ZnkeYl1LRU3IzI5eetIXj5msMkAUaHY2+GTC0nKoraPDR7
	Neeh5PfDdJLtu20aUFH3E+U=
X-Google-Smtp-Source: ABdhPJy8dJf0BgUjE5Ipy9yHyedwP9xQvAhMETbHwsrqLdWiihKVMmW4RheUyv0mbMkOem3t8Bzixg==
X-Received: by 2002:ac8:5e46:: with SMTP id i6mr2511317qtx.366.1623089702789;
        Mon, 07 Jun 2021 11:15:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:d4d:: with SMTP id r13ls1492817qti.6.gmail; Mon, 07 Jun
 2021 11:15:02 -0700 (PDT)
X-Received: by 2002:ac8:5e81:: with SMTP id r1mr14314392qtx.70.1623089702209;
        Mon, 07 Jun 2021 11:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623089702; cv=none;
        d=google.com; s=arc-20160816;
        b=SQ1q8b8fcdsKgDofMNVAzSzujOTlgC0eq9QFDjGC3pqXAU8ixwCHAhF+18OxSZounc
         szSEY/aEe3GMaecFqrg3RmR4sVKZIZTPeLcIZNi9RfWhGhG9PAxBCKExAh44sqc50A7f
         m+b0KvlbvYVJZGZ5VW3V9vqQozwgteG3gXhM/eYPHhO3dwj0hUGNOYwb4jEMvlXXq6Iu
         2Sxp08zHzdKQUho9nCz1RxTNTD1J6CkyaUYDWDJOtbIW322pmA7430zWwNhgNxwDwMb7
         3wMWzRKeR4sz1b4LarhES0s6hq3Mb0D06bgPqabdLy1m08h6PFC+FPM1mJ8t5btlvT1o
         14oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=fKDKYfgKXFyTqsV/6Ai/Cav4nvHxyZQ5csn9CDaoKvA=;
        b=oX2AAdT9BJ8/KfbTDvTwAucutwq/7MHB2kRbR9Zyifp9l8R3sBMqn9I2jDKe+UezP0
         4BmFgtWlw/S4RIpjSuVfs4pzKTnkBNAW1OxD+4Qb2ILARGzFwkExypmV030sOx08dQss
         4ZLYo9V/xHyjC3ZXNTGvJGd7zyukzrftzsug3ufXWxJSfL8XzBgjfZ6qCIIazLnmv/iJ
         cvzeKTIjYWnygnMkr5Nf24QIiH9yoY1OKuS0rN6sWVo0G5ZO6cJloJYmVJxB2P7Eaiye
         6ZitJ0cg96udUeidBymtBsSVMDQmuv9aDUa1pYkUuKhS6UHx8zSjdhdCxxyag8aFFCiD
         8g+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v64si1186007qkc.1.2021.06.07.11.15.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 11:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 157IF04E027040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Jun 2021 20:15:00 +0200
Received: from localhost.localdomain ([167.87.38.117])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 157I7ikG011115;
	Mon, 7 Jun 2021 20:07:45 +0200
From: Henning Schild <henning.schild@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Florian Bezdeka <florian.bezdeka@siemens.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH] customizations: include wildcard into SRC_URI
Date: Mon,  7 Jun 2021 20:07:41 +0200
Message-Id: <20210607180741.12416-1-henning.schild@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

That kind of tells bitbake that the file is "optional" and it will not
warn about it missing when parsing the recipes. It would find it missing
in the install task.

That allows re-using jailhouse-images in projects that do not even
install the customizations package and would receive warnings when not
having a config for the package and their machine.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 recipes-core/customizations/customizations.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/customizations/customizations.bb b/recipes-core/customizations/customizations.bb
index f71a07887bed..c3a1fde01822 100644
--- a/recipes-core/customizations/customizations.bb
+++ b/recipes-core/customizations/customizations.bb
@@ -20,7 +20,7 @@ DESCRIPTION = "demo image customizations"
 
 SRC_URI = " \
     file://postinst \
-    file://.bash_history-${MACHINE} \
+    file://.bash_history* \
     file://e1000e-intx.conf \
     file://ethernet \
     file://ivshmem-net \
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210607180741.12416-1-henning.schild%40siemens.com.
