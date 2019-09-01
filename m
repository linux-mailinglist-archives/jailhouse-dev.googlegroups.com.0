Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOHPV7VQKGQE7QQARGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D385A4ABD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  1 Sep 2019 18:54:17 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id t9sf7523613wrx.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Sep 2019 09:54:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567356857; cv=pass;
        d=google.com; s=arc-20160816;
        b=EWV1HPAu9b9ydtlKNeULHirSTf1ynQGhYVJpu45P7bIzlLrReZMVeaBk2VOiT8rkCJ
         3BEGPyayZOCjKJYlx9A9OBHlYxODIYari7/GqdkY6h2dEP6rRk9YLp3IRd3tgm2QgwJ3
         KRItx3uyF4koB6yLlmZb/YWhsTSIzhhD3xWhOTZrKP9IH6DBKiAKDXmHrRVe6M6XWv5n
         87CvFMrlbyk9I6zaBdJ4MWjfWcPk4aa/xEU1Q7hhdSR8d/6A5ZKrvTsN739I5B6Dk4wQ
         Hq5AD7nadCISu+FibUxPcTYLM+x6ItMGrRfxxNSa1l9hSiIy91O6dPLomH5YIf60LekW
         j0Ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=Nbxrdg+BoUmZLaCrX7GnWwluBtAD0K6FFuDe5ZA5fEI=;
        b=w/cDn8CVUoHsI5PI5BFRq8Gg988DemcepRKllYltQxvzK8dKDlDRl7/BjOQ5K4/KeP
         X5zGw7yMeCzoDTeMGpdjyFLAnOn4nKuIuP0oLZmykntqgn5KZYM9/mz9vuKLuKwBmLp+
         k712NRAAgYIXqaiMIYZYTnrGnOpfs5FEMw5oqvBJbp+USTjWjO0HUqZXUDmlln5WyYyT
         D8+HxY7i0z9FkzE0wpq0FkaQV8oXGTaZ8HC5ri8XqdJNioRmx+hC8couNPOgXyRDLSzf
         TRU7qT5XitYPv8WYzQwPivXGYuCD/jdMty6udPQRRVLcDbC+m5rpcq7kRwUgSpwE6owu
         lWHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Nbxrdg+BoUmZLaCrX7GnWwluBtAD0K6FFuDe5ZA5fEI=;
        b=gKo8xVy+t6NwNc+7SU+TNfd23Ot7H17Ja1BAvmB2BJRCb6IdF/89vuYaBl5F/nMQwQ
         mO1B/UsrqZmnQeWpkyQh5f/NrEMR35vJfAzqgYdWag+WEQgY53j0qJ4hocvqVUPXcOu7
         XauP+gO06ArjPluuRz6bNqZMXhnFkHOVfmlvFKJBaKXaH9Kl81NqzTsMUdTQKRgardtA
         YNa/BC/ZYKii+91swRHsRDROSrjcdAw83M2a7zMX/OWZ60ieU47jx1MZYgNzZRpbEhWs
         lULeCjXbrwv53AfjZOFL/1tbeDDZWsXaZmTDMXMy1OSfmzDy0fumL5RuWpqTKaX6Biw7
         gIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Nbxrdg+BoUmZLaCrX7GnWwluBtAD0K6FFuDe5ZA5fEI=;
        b=IldrJmMJPZfIdhJbunx1iRr5S+4NbB5uB7bZm04GgJyz8ZkfkXvyyWNeLSZ7CFbydG
         nbgF/+tpLUBQOcdjcMXFOlLxyHpAr7jbZiquHEdcP4waB8a7qQL6QuGuKV50e49c2/Ss
         EDdonYUmvTjj/1I0k29YjpC1FfvRf/1+Hpw9FPOISQIdp3ibZACd14k89Bn5KhU7Hb81
         12+yBQgB4K0SDdif1vBqt9YOKgfPlZJ4My5kk11d0rESXG1vCUlM0u3WqERE+2dpxjdn
         jro6IFcJeGV4FztPE+GGX2+g3iKmn3WFfLXN0gGeCvcHStzzelSqrlC7RwDdfXzegD0+
         MzOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbJNDhNlamkD+zIqLdkXdeNvozLBGGfeSLc7O/5PGWr3gm0VHk
	LVV35lom4KYq+UtE7uVmTzU=
X-Google-Smtp-Source: APXvYqyYJ3xuEyiWoom+dEcJnLLYJXfrs5x3sTCL/c0ivLsyOcEnkYOxbnGWA/OyN+EL7ye4wUBr5w==
X-Received: by 2002:a05:600c:2151:: with SMTP id v17mr12502041wml.69.1567356856999;
        Sun, 01 Sep 2019 09:54:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc01:: with SMTP id f1ls4605182wmh.4.canary-gmail; Sun,
 01 Sep 2019 09:54:16 -0700 (PDT)
X-Received: by 2002:a1c:7009:: with SMTP id l9mr30980109wmc.159.1567356856380;
        Sun, 01 Sep 2019 09:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567356856; cv=none;
        d=google.com; s=arc-20160816;
        b=mYtPymGGk6hbDUJiOodEDmb38KPWkHVHe3shHBsj9F9kmNPkInoe/INXBej2SHUfgd
         84MQOGPgZ6BNFjUUW3JrzS7EIyUPM9Wl8yXFNvxzAnMw/GL8t3JRfx0RL/4D5axcI5O/
         oQ83jLo21ub9jdt4ToJjxZorLm2unSlEU7RlIL3OUh+sIec+UntH5qbcD3qr608OO3ZS
         ysMJlj3rv3aYa01MVh89dgM9AR4A/cloCguPBScevtojVhx3mKfYDof9t9GtOkLdcazx
         Vdgk398+tGQ3UR3xhBR31Rm4HKRTnRvtCzIvJcysiW5J2RMZkqbE4/cn9cKVW9bA/RGu
         PwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=YZdZ+QOvqWd32tMw1EoCeDC9oy25v3KkO38oCXJEnYE=;
        b=HVcQUfiv3A1Ubo3td4+kieKMAvT02opcN8C7C16LCIsviSp4uCU+e4yunkhjVtpTPP
         4bRjyr5eWmFM1XAdI0VjbPbig9bT0jAV8RFg9OPRpC9/ERnoCh7RtSGu5H3y4nYIktRA
         XbUn78fXTwh/tckwil/jSyHc/yxYZwTEPce7vgQMw6dU3At4OpQ1d9kpK7Vi5A38dQek
         bFjsBZ3gDLKP4H2M1CSzqbs9cfcRW+sAcSCsqGMICDil7/CZUg0I3sa135yrrFQljPpn
         CM/8f6agAggIEuPMRkF0Z4eqZIzOP7ewHIvQP/t2W/SKpW9QWEX1HNwAMIBqvzFpWHBg
         M5xA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a198si850397wma.4.2019.09.01.09.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 09:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x81GsFOu006864
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 1 Sep 2019 18:54:16 +0200
Received: from [139.22.35.14] ([139.22.35.14])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x81GsF0J000712
	for <jailhouse-dev@googlegroups.com>; Sun, 1 Sep 2019 18:54:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] ci: Update build environment to Ubuntu 18.04
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
Date: Sun, 1 Sep 2019 18:54:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This gives newer compilers which may report issues earlier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 8280912d..aaed54db 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -11,7 +11,7 @@
 #
 
 language: c
-dist: xenial
+dist: bionic
 
 compiler:
   - gcc
-- 

2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f2377f95-78fc-4c83-0eb0-204babeb51e6%40siemens.com.
