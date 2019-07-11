Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV6GTPUQKGQEQJLCLXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDA65258
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 09:20:55 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id c18sf1230781lji.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 00:20:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562829655; cv=pass;
        d=google.com; s=arc-20160816;
        b=HmA16qCXNSD9ZQkZim65E86R2EZyZXuFCewccoKohGTCHWJS/7lj9PG4AJ6REMKJXq
         8/mCSqAvMU2/+gCc3/Uiwe3TsyMogFjJB3NmmwL8GKpySUzBhZnRQSI5lSLgfViN0XyF
         UecbMiFvWujEDfvuE6/upWY4xYMuMtRrRdTRPZbY7UrLBIUagdPXfmPr3M0APZFB7GLC
         XNimF7BD4RVEkBOwylKMiHJgdqBGGsIiS89IP7z0oye6rVCs/ZwJqKe6YJaG3U1m/gzG
         NMasQG656+8UhvMApVydqDIqTB5tagyRXcZQV0uw/ovAxPbX3fgY8mDMUAbMQ3dyUA+2
         RsDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=ZjnwyA+ftzo/CcPgK3OvQAVtGf4TyvIs9W5SzKr2OKU=;
        b=dfHCnauYCK52cWe1W6MIWzn1m3hcrbjArU8rNag8A9r+6huAVv3XaryO8mxKp+TUrS
         trnSJ2wF3tIt07c6p3SvjXRJI9grJZuQZACBkteHIYtJW1h7TeYwdRyUNv22J4zVaZeB
         kYCk9Hoivtmilgqe+zomfalXKwuZyAbxnd7IiN2BB54+BRVqLlzHzp5Hds1X4/t3+kaQ
         lqibjrAa5dHMaNC8KWJN/2RYPw61EIi/0bLVQoLth1KAoujyoT4K1RQKLFxriTsBE4Xu
         uoU71BsVT9jK+1twlfxA/o1MeNSxBTFAVzYGnG9kApzXhQts02JZdBm+rcTRxWM+7XQX
         hCdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZjnwyA+ftzo/CcPgK3OvQAVtGf4TyvIs9W5SzKr2OKU=;
        b=okuJMn+IxdqtbotCrwkH9qqq+lztWXnRDmvTKKAMQZ12K+yI7u2oc/WUFT63stpkJm
         fg0oUUju6u7vpoNLyvEjh76Znpk26SzOl/aRedOxGLIckS4nr0az/bk1Gex0bdRGUzst
         ZQ1aLYFVIqZXiywrWk8buklpmqgnZDXpJIvK+M5N3B8vSVcmWT115ZWyFfCF4cCBSCFo
         JsjkMCZ6pj3Zl1wX8p1SkZYjE1Uoyj7G5Mv6q6ygRr9Nj8T6wcK7NeNhTPPQf1uRH+QI
         E7ao+olvs8HqUhmzLjztyTmkY+UxH0LWiuxJnG75SXZKbEoZgMDJPM4QxonKYNA5TEzN
         Vnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZjnwyA+ftzo/CcPgK3OvQAVtGf4TyvIs9W5SzKr2OKU=;
        b=p6sXekaj7s9tn2oSvVgQ549JyDnc+p9GbwFpkGRYtzXSJxxBcWh32tcOC282Htrrax
         vXdq9sH60JwnQmWXF39DUeg4WSTPgBs/RsbGFZAql/zla0q3Q8tUDxxIxn7r8d78WDom
         6ufkjJufbxa+w3yPE5EJDZa2L8ghxMQRwQFhTrQPf/LChFSSHl/zBvoWFcaHzS/Q231Z
         rC4eyeMFc6TJoaXK8XkESHa6PjmkKHGhp0sKmJ81vP+b3Uxu/0qWXzgG3eNFoi57Og+k
         gN7Dxjr514Q9F/tO2tAZwQwKlDRqbZCBHthYQPh+/G+HjruervOcxDKGadtbqhAsHepN
         bu/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGkn9gl+zupKiZvbmLs6CWpQpRcVq5HaPaAsz89VkFXpkTbz+0
	gvoN3EXzwdWTMQgc0PzdIkQ=
X-Google-Smtp-Source: APXvYqwlwbEV454dr5XljUXa+JKMJvtyLQnGrJ6HB4F0zvy/uaxHeHEjbl4ZOuP2izF6Ih4vD0JbwA==
X-Received: by 2002:a19:48c5:: with SMTP id v188mr985801lfa.69.1562829655403;
        Thu, 11 Jul 2019 00:20:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:5b91:: with SMTP id m17ls593282lje.10.gmail; Thu, 11 Jul
 2019 00:20:54 -0700 (PDT)
X-Received: by 2002:a2e:860d:: with SMTP id a13mr1457824lji.215.1562829654711;
        Thu, 11 Jul 2019 00:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562829654; cv=none;
        d=google.com; s=arc-20160816;
        b=tfonlEIv51j7tR87KPHlql6tn9fF1NHv37B6kiF9UksHdmxZF3o+3rL40O/sJ7dvdb
         NkVK5vSjlRrify/2W8uBGeJ2NQCwyK9MxO1Np7e6ETA+angJQ2bUGaDQqrHEuUrJc/E0
         wENTgS0YO65NoRt5mx3+gIOHlBKDwN5S9dQ9D9th9KccbgKwh20bVJ9FYBvd5aCz5SDX
         gAMnJ2HAJQz7NAwa4XGU0i/V3x+WGTYuHGChbjWlGg60tiNht9RhmqJmxWmFzkrTaXz4
         vaMLZDcKZ8npzGKWShfBwi93GDpDDmoQ9ejcxPmEDvFqpE+z6paA+EU1kKpU4F3UhIfI
         ApGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=anb6tDdpkX+jgA2bc0zD98OdQluFW9iXswzpuGp7rH8=;
        b=YcGRO89Lj7gaAodDUUyhHjedQp9jfRtrSDM64CNm6nU+aOSaHwS+q8j0kvQMohPe+l
         /7gYSo1m39JukG11Un3UwgKjxpTMvYlJp+ixJ/in9sR1klCy5IpAZMwerF4k7/FInvaa
         py4YCqE6mveTu4SOeTzG1Izz8DXnAwcPQverDs9jvKTClRbkNLONYeAHK4nHHiL1qpSg
         ejZJjdBr3GI0thvnYoUrFrp0Q/eQ0qkbhDEXzq7kmGjBfLECuSwdCCH9gJ+u1x33IIN3
         YBAhlFfFYNpTzVu4IvxPO5zfLcLAuo3X/ZlIJ3HNycX47VllLozc++plY4f3Qa4GtZRB
         e+ew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q25si311117lfp.0.2019.07.11.00.20.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 00:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B7KrFn022826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 09:20:54 +0200
Received: from [167.87.36.253] ([167.87.36.253])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B7KbmZ020490
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 09:20:38 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] inmates: Make heap relocatable
Message-ID: <91db4318-79c8-e019-d399-01b9da406718@siemens.com>
Date: Thu, 11 Jul 2019 09:20:37 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
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

The initial heap needs to be within the initially mapped memory in order
to allocate page tables from it for mapping more. On x86, growing the
heap beyond the first MB is blocked by the comm region that has to be
located in lower memory in order to avoid conflicts with PCI resources.
Therefore, it is needed to relocate the heap after mapping its
additional space. Inmates should be able to do that by setting heap_pos.
So, make this pointer global.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/alloc.c                 | 2 +-
 inmates/lib/include/inmate_common.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
index 3ada047c..e68e6cc1 100644
--- a/inmates/lib/alloc.c
+++ b/inmates/lib/alloc.c
@@ -38,7 +38,7 @@
 
 #include <inmate.h>
 
-static unsigned long heap_pos = (unsigned long)stack_top;
+unsigned long heap_pos = (unsigned long)stack_top;
 
 void *alloc(unsigned long size, unsigned long align)
 {
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index c85f1383..f2de578e 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -75,6 +75,8 @@ void arch_init_early(void);
 
 void __attribute__((format(printf, 1, 2))) printk(const char *fmt, ...);
 
+extern unsigned long heap_pos;
+
 void *alloc(unsigned long size, unsigned long align);
 
 void *memset(void *s, int c, unsigned long n);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/91db4318-79c8-e019-d399-01b9da406718%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
