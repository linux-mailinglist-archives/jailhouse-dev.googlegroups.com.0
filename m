Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4WV275QKGQECCPJE6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393528017E
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Oct 2020 16:42:59 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id l9sf2120693wrq.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Oct 2020 07:42:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601563379; cv=pass;
        d=google.com; s=arc-20160816;
        b=RLg3cvf9rUZGRLPyHrnf/Dft35sGSEEzNlpkYtE1QMEeejh0L0JUsJEQg77f5Sg+tI
         4RCKE9vbvy6OVs4vpkSLDrvNriHB4zBEPwdEA+XxSJOCWGz0YOjl62Bhv3E3FdqNqYSF
         xtkKkI4RdybEhUUtBBk3ZRL+D/AcvwnEJPTJAA6UChELpi62bhVHlHNIJsG8FzeHVl6r
         jDWBGQU57E1dtlWoPd2oIWgjBxnAXJLwziscdIcrVz3yeP6zmMEt0lr1oUMkZMWEkW8x
         gvBXy3jXQcrbXOub/YYhPad3ObTk3z65uhkWkWsoGGvqBbG8kFuDhQBFgTbhD1WDjdyf
         3JSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=P1gfgaKLBl9zKnECpSpFgK4PcoNeDNlDDIJwEfwdvsc=;
        b=gBvgKFaRY05LyeFIq+kquUE0cCdlsJ5mkgGnN2bcLKLCodqv68yqzsZQU+FpW9kvlA
         zHj3b/JbiSgkkZ42LaCk90phOExzt9tcR49umF1VDZVKENTmMjmv499PrNKZxOGg9/0l
         uYLvS28cGMcq7+bf5wb1ZOH851qdmpCZWeUBBx9yH5mUaLqSukYY2mawRj6MDludUVND
         bKRSNWmYZ1Mz77ad4gF7cwF9k7GF8fpBcGrd32xRVMuysTSxBfm29cqR33i7/kuZd3uR
         mVn66tR9RpDdnBZ44aS3E9p6Ulwr4V323lv4owUgFuh2o6rbkiHUQQDUaSLyC52EpOSE
         m4GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ODWNWbjK;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=P1gfgaKLBl9zKnECpSpFgK4PcoNeDNlDDIJwEfwdvsc=;
        b=azxhcuhZfJBLY2QsM+T259qGMlBhW3RpJUsaoJZK4ukqldR1SMEj1h+8X0SPhMKDIn
         JEOZ+LhswhWJPzsRUTAwYMSqBbijHUy9YwIC5ts5nPtSEPUpAGinYwNIUxEWN+neuG2y
         Woq5QMKgBKb0MgA0LQEt8x5cV2XGHkNmOo10jvL3lChyVrdHTfVGRlR6F8glrhlNfGPZ
         YOqS/3dPr1o4A7h5OVe9Rftk9AOURjegzvSp+cq5dk+c9AigETQpZNrGgSLSxCwfd8Xl
         XGb9Fw1TJu8MdvAdroSut/+xr+b8ic79Svwm6k7F/omnj/k1W+CcxNJ8VWua8orb+XhT
         HejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P1gfgaKLBl9zKnECpSpFgK4PcoNeDNlDDIJwEfwdvsc=;
        b=p+j0ViZTuJKNezg7lfwqac75ttB9/l+5Qwvfc1eE8h/9zr83QbZjMKRgoBxoeahpoF
         hPemYXKPVkjSXhMPWcWR54//Qz4JG59j5I8k6SrUYOO8YeAAr2l5nRsXQqVzOfHXNxmE
         adatgOETfAAq4cUiSAXE28QN0mlU0kspRfBvnP9WW4eomDpZwOOPtV2o6Rv56uQ06MFu
         hne4uPVLFAxWDlsoga1wtSOJxDlPIDF0Ay2zQXEH+6K1DLjyFAr0YsyIEs5T6QsBLj8F
         QweFzfOCo23BQFlBHlBqxFyXK2p7KxWv0kcAtvJM+RerYKuUxlzNQh5ieyVfx3zJ9V7e
         yzLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532v2hJmTaTeIgBdQeLvO/ErJqLwefkyOsUe4iBeBSK/BUOQmpUQ
	IqVuU0varH5uG5KgH+hUP6Y=
X-Google-Smtp-Source: ABdhPJzh1D2HtcmLbm7Q6quKBQ5oP7XkObDN04pdt6O8rgCWkiRN9S3yM0PfGDzCmo+8gKH5NzfOKQ==
X-Received: by 2002:a7b:ce0d:: with SMTP id m13mr352957wmc.83.1601563379199;
        Thu, 01 Oct 2020 07:42:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9986:: with SMTP id b128ls3023471wme.3.canary-gmail;
 Thu, 01 Oct 2020 07:42:58 -0700 (PDT)
X-Received: by 2002:a1c:55c3:: with SMTP id j186mr335558wmb.77.1601563378054;
        Thu, 01 Oct 2020 07:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601563378; cv=none;
        d=google.com; s=arc-20160816;
        b=t4agw4PhBi0QYIgYZUkiO5D1VCctTfryBlYlWoSCjluMcXwWC1EI5Id8DkjnYqsLBr
         BCeLUmIfpVZNdRvBhWoTjjSPxi7jYn1pgvkofmCBxXsrl28yr2Tpa3B91hVwo9M0+gT7
         FnzEk8WLd+kSP1ShZWhPKpvyBESve8XmFhUg5/j8VD9X5qy4yt+ziQeMm+yG5QR1cCVI
         HRg8p4umWdkEI1UnVGGJvPcb3qFdEf/iiO1uKikyvCgwfJPGsMNefIqu/0tnYNOLuNwf
         QcdtCja9YAII/SWKDAKU6daKyHNYfeUgh6Qp1gbrRMFoJkoBh+mcl7ALYAm2ForBfXl+
         yGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=YS7bjU90//MKGDjHynMIRzuPuaiLFBBuQnle5pHczHQ=;
        b=XYd4GRkhE/x49AZK+QEZY5EU43yWH44ZMZGgzfGj0IQd6c45qiTe9J40Q13tqSwkia
         e5QtODDx9vAD9rKBDme+J7y0yc0aceri9MIIl1mrWe1vbRm/r6SrNMs/nB5UfQ7fgilI
         5hyo5kpKFkWhgo7t+14pAvHlgKUOT097mqzeXQZQs5oQFCkRsENdE1AGxrgLCG87Ksq4
         A/hNiwAT+BONnKg8r/3yoVeK4hbVnvmxA7u3JxXt2Kv8CwrygFtE1XHY/mogKNfH3iUc
         BVCigYNHYKDYrnYKjkeSgAa+fLrVr4u3Jb8aciUFyRK9sLY36dvDCmPsERLOj+63eUOm
         RbTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ODWNWbjK;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id z11si212411wrp.4.2020.10.01.07.42.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 07:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbTLB-1kyyNM2a8P-00bbnX for
 <jailhouse-dev@googlegroups.com>; Thu, 01 Oct 2020 16:42:57 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] pyjailhouse: sysfs_parser: Fix regions_split_by_kernel corner
 cases
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <b57456ee-5a6e-113d-72f4-3a0cdef95d36@web.de>
Date: Thu, 1 Oct 2020 16:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:Kb/26IGevAyx0RtYIrfjapifvDh/Nm26lQ6pnhXyqBH/w4HfkHs
 zuHo5hAsnhnNyuw516wKMhWJU/6FalbGU/yQy5cOUwH5UUF3wPvH0OZ4LUBt4Ght8RnuZoT
 Ya/rLz6CBezjCukk7R6EXRVfMyBDPPpim7ULGDqUWC44ln3JPnAsF1M9cSDs2o9/7h1UFD7
 7lUWlnDMEKXZyYfok5VcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yeS4qYkrtXY=:KbtJXcDqYdh1afb7DsQ+S7
 8sqURhWrU0WWO4WRvGvUJQ3sBxqwRZA0yF1VJxbcWNFdvnAdEn8proBiFLQ7DIbMRr0biwSIV
 vNezEmc/26QY9zRpvGbiBbGTj+jNlZK8wJ2sOiuuTemBQbg8IFwouE1l6TCgBH5pp4rFF1vlX
 NLWb5NYmBdte/N2DVsywUIlIz1EeSsx9jTtNi3dRCfC57y1da86JfIXig6A2GJ96XbPFNYhMz
 ARJKClTsYMcVww3vc+cTs+ZlLyvngnNGy63OAptzEK09DTo+MhXFs1drP1JxmYLQTdoDov9PE
 UGR/9oMVgvSKpt892r7jytYlUagozfIgWSvJoG+XlWDC05lIQZcSmyksFGThf5+9oFJCOJGmU
 adoeh/3vnWepBTxQPRon24vk/+wjm68qVEPi6gp61ZC1SYsIOL9gTEiP+55zGuIY5sVMUXm4C
 3X6eZ+ah28rz8DuG+IkQECJ3Lzq70MCnFuaQHWrOkNboiWFSO7iV3O6RZG+4vBl5I6BMUxuQS
 8nk/OyE1rFLMh+yANOCVYb0UW+jcv3Ytrnf1hysLGfNZ4YR96/GJGUoDkZ93LiYSP7rxuUbwx
 fYbGW8cXAm4O6kkb2hAu9kc/McJSOYe+MBuRhIIya84d5CvmN6AMMnZq4RxNObNJixrQaDosr
 apwpYWEkUzCvqs+0ylRJzOITUb+QJWbZoDCq9dlXZmQbomfWXHShutGzdoRgef9NdsCp4UWq+
 383GjQJxDlaeh2Oy4lcJZ1Pr0r2iqNafOEOAUQvpzsUPlEl+xt5R92P3TCQl6p4Ay3IKf0CN0
 RtmaDY4w8sotrh8Y3fx3pd695ozoaoWLM160npDop0XBt6xGsff025ctVAnSLCsXz3Vppgj8X
 nPjq4YZ25yVnWGrLpyZgP7bQ2xNCQZBmZsVUfYLvA3j+ruh3sc/LAdBq3AXURuPwv2r6ZmFXv
 dCFyUMuibfVQMf8yXT4lBJG09D+jrNF5ZS6JuxbNwzO3H+aJvTLG6TMI+F85a5tqxBPomklXL
 zMYIlnCWLhW/1+3cwdzl6Z/lIu4puxag0BwtIY3bL3b1HVI9jshggmJkh2UT3v9z/PnDc/86Y
 86I7khV8iI3kzCMm5t8dhgirmjl9JJKDUyilrDfia359MxQuS1CY8KYXfMRdHGwvlpFf0kxyT
 a9X8MRIVNoe52bGxR4gFz5DotsHSL/BCAHUTcuRbGSbVVwJPrda/5QSO2WlydxwofeXybkw81
 a9QH4na3q1t1vpprNphX2tmhH9Cuxi8vlNJ39qg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ODWNWbjK;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

If the kernel is at the beginning or at the end of a region,
before_kernel or after_kernel could stay None, and adding a NoneType
object to the regions will make other parts unhappy. Better construct a
list without any None elements.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 19bc16c5..d1de8c79 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -116,20 +116,19 @@ def regions_split_by_kernel(tree):
     if kernel_stop > r.stop:
         kernel_stop = r.stop

-    before_kernel = None
-    after_kernel = None
+    result = []

     # before Kernel if any
     if r.start < kernel_start:
-        before_kernel = MemRegion(r.start, kernel_start - 1, s)
+        result.append(MemRegion(r.start, kernel_start - 1, s))

-    kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
+    result.append(MemRegion(kernel_start, kernel_stop, "Kernel"))

     # after Kernel if any
     if r.stop > kernel_stop:
-        after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
+        result.append(MemRegion(kernel_stop + 1, r.stop, s))

-    return [before_kernel, kernel_region, after_kernel]
+    return result


 def parse_iomem_tree(tree):
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b57456ee-5a6e-113d-72f4-3a0cdef95d36%40web.de.
