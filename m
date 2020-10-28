Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD7G436AKGQEMC47IZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99329D169
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 19:06:08 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id cb27sf110030edb.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 11:06:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603908368; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ubpp6Qqf+Ft//1WVhbO5m6zV3jXZ+2RJ0NWn2KGNcRR+dZWhZhnLQiU/CnEO95gasT
         mM5j/uroQXP2J6078MOs9hXKs14T2vMHL5TztcH5N7vX8VqbZPxQ5vAIzcfx7nmyqCss
         SE97t5Pc/WngilyZqLTLdbFZK12xT0H760Z8IXu7HC8YFjKqm0J6/ErrTOUr3MMl6TlU
         eQEmupjS7mvVAIe+z6aGrcaBCAOqMOF9TU0KV8OkIhR415ZOy7BULM564hSHQJSbeWV1
         +JaC/uFe0QZNDCH8W30kIS5BkzZhzEn+f4rPxKSnP51d10/k/2shWOQqziZ1WynY0olH
         zhtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=T9yo7rYXYaMSD8QTi2OxaawHnqwFBQvCbjzRt3d/sio=;
        b=q7+wXs62VtuG5zfIVaJM08RMYxWLEI+AUOXEcR+ktJk1RaiWEn6PM1X5woZLBdj1iP
         3mLN8uzeNsbOQ9pqCrlgo6wqR53fdgHVO3bWMPYnkeqlBp6OI1hacsKFPVxJaWEBp8Rh
         8qum96ziTlRG1WBS3fJqVuMyjxBRw37dXu184H3V0f3CqtlQQspk7sT3kEhogoP0/t8U
         n2YQlXdagNyx4pDGS9uGZuRnBwBHMsPH46y2FJnsfH6p9Bew9tgDgfrQ14vOXbEzb+oe
         bR7eccUpQcQtZJYBikVrxPKjXFekhAQqGHTq6GTE4+u8VnkggZvVXRY61MHAecykCdTE
         T27A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T9yo7rYXYaMSD8QTi2OxaawHnqwFBQvCbjzRt3d/sio=;
        b=ZnshnOzhMIN8+ndm1O4Go/MYYeXlIHHWlwkb1nAa24JBx7e7640Ho7YFtFcqqNSH4v
         oUMJw3T9Xor/Bag6RlXQuksMePL58qe7/tfWtCH3AMoDpg7mmvTb4hpbQrC7bT6xqLJB
         AsR6grLMRme6jw1vac7hRB2AMDgaibzu5FbtJ2u9y9LDM/3kPt1bytQDTvTzJF64FKk2
         IgnmD93PDpdh9wyFB1TF+VACmcYx468cShfS3798xsyw4cBqy3Py8+VWn7nsF868NDqr
         STKe98lPDNf+8rnNnkmOGxWgdXV5DT8qECIX1oyFUOOXju3mTlzVLrVnx9GJrW0HU4iG
         oVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T9yo7rYXYaMSD8QTi2OxaawHnqwFBQvCbjzRt3d/sio=;
        b=adl+2OaAKyUCy3yuCOY8ECSBcISdf5vhjKUbmmWWKaJRJcST956qKq0ZDXDjFTvjDv
         4l9/vE2tbjhX3CR719Gwb54haM/y4q4H88hB0vtN1cLimmtDVmI4FlLULSQtK2cGpIlv
         JR1tl94aiOSWTljKegwS8ehp9xhuyp5+c3r+MUAvH1Dwe+BNNmeEyC6Y/5Ijx0q7s7xe
         MJmPOfspQ9Gkvn+0msikNMu7QE+NILWE3nKU0Tt/yR7i3cA3XWfyyMqbkNhRZpDGXE8/
         3oLjEgxNkjgSqdRkJOFoFyIq5YkjKbp5EODmi/AeUPOI/hscWpMBozoJxCBHRl/JRhDP
         BYUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qlU/mdGUnbHgKH5iarNaMzf9DyV0BDQi/7RQhTmqRo3bMwGpv
	pz2yn5cHSXY1SIMVLmxdpOQ=
X-Google-Smtp-Source: ABdhPJxp9MW8f6sRcBt8k9A5VOrSjMTQhYcJ5iKhvI6kMThVrxwsnWgAeuTKijlZTSbnGVYaT74YtQ==
X-Received: by 2002:a17:906:b009:: with SMTP id v9mr288365ejy.155.1603908368310;
        Wed, 28 Oct 2020 11:06:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4692:: with SMTP id a18ls226951ejr.0.gmail; Wed, 28
 Oct 2020 11:06:07 -0700 (PDT)
X-Received: by 2002:a17:906:2f97:: with SMTP id w23mr345156eji.54.1603908367141;
        Wed, 28 Oct 2020 11:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603908367; cv=none;
        d=google.com; s=arc-20160816;
        b=LmlYp3zmogjOme2u9SrgLLrzUJ6jvPU8zHSwcnAR54BByOwtPXu0bw0NudLb+GJlpt
         Cu8Diu6xJNRw555bZV+x2yPfJzkl2+fc5HLfZFn8hh7GoAoR6WkyXSghCZotEaNpHqFq
         KuyastDQxGER51s3RQBTM/KCCa24p7bgQBmKu8Gn0g2LfmM6WGUOIoe0kIeQ1TkgUkxv
         HMDOqIidRYs+sQpdNGys6QLQ/GqEaG1sEvxTKdw0d+sRIs/DIRwEd48+56E+rxbCsF61
         k5wu8gxiJXr8Yw4FDZckV4hK+ToDZBx9rweG2PYl9s866RsPbd+ZRI5ZV8I69739h3je
         Wo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=AHXHm4JOmgxJBFlimL/0oCb6tAHezlHx424onbYkVsw=;
        b=sOodedzvCxVw2bJ7tNXFfp4m/Ze6C5n60Yr8epnfMYZFGE/e7yKEUpm3eghEPJIZqO
         NKbBnjwjd/fd0yT9b7hwjwdfvkUsnnopnAj14DB4vYKGy/Bywfbthq9u3nMfoeqBX5rC
         vZxZrYdvz1HM+r4qtz0LKLtZJ7rHFTsG+9JjqczSqQp4JjUkdEjO3D6JTDkhYmMidGPL
         5AN9eG2DywYnk3xFJwSyOVR47MK/ty68dLdGl+wcYwNHwC64xhWb9hP0O0EYXhppSNOX
         zWbf97GrJ8eGjMs+eHB5aaK/rT1etAhn4YDucs96eywlbW0hQoqjUXxU3tBCIGIylOEX
         SKXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h22si16389ejf.0.2020.10.28.11.06.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 11:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09SI66tc023877
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 19:06:06 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SI64VM004883;
	Wed, 28 Oct 2020 19:06:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] driver: Adjust type of __hyp_stub_vectors declaration
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>
Message-ID: <93f4aa0b-d2bf-040d-25c9-d3698975c600@siemens.com>
Date: Wed, 28 Oct 2020 19:06:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Aligns us with an internal declaration in upstream
linux/arch/arm64/kernel/hibernate.c and with an external one in the
linux-imx downstream kernel.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/driver/main.c b/driver/main.c
index edb1e4d4..78af8e97 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -86,7 +86,7 @@ MODULE_FIRMWARE(JAILHOUSE_FW_NAME);
 #endif
 MODULE_VERSION(JAILHOUSE_VERSION);
 
-extern unsigned int __hyp_stub_vectors[];
+extern char __hyp_stub_vectors[];
 
 struct console_state {
 	unsigned int head;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/93f4aa0b-d2bf-040d-25c9-d3698975c600%40siemens.com.
