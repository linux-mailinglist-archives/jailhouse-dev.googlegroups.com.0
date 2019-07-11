Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7GTPUQKGQEAZQ4MNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D1365323
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:19 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id g2sf2222013wrq.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833699; cv=pass;
        d=google.com; s=arc-20160816;
        b=e76f+XJQBpCOGdnsI7XwoMdA3xtMSdsRscDGJVAY7e5FLkI0YBk9aJlFHWwMJgGRCU
         GDATmJiAFcjCu+Nl+EuBylZvbO3DOG2lj0mDflmj5GTSi+i7i63BNd0Pscdlgk+OYC3o
         MmnR8lHiA0BxY5NqKea2r2uElGKqBCNNKTinx9Gw0o5CJO9BPuKxgdSQvN1/Dm3Ab2jW
         FnPlO44azZ2qTscCtbAxZVyZLM8dstdDoUpe9Y64susBlI3i+3eeFat1kJElODrxxwL7
         mFOL6HifYQG9pL8XdsiK0GBmp4kOXMKV24i3c1J77tyR2a/IWuorsKUNCknSZTeMHT8e
         PuLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=gqTIpwg19BcBoq3UImqV+PVIPovRfx7yY/pmoAxYlrA=;
        b=SATeqKGsGD2vtPOb8Pv62CBdVyXXGx0hcoSFLS6O6ltLbHXUDvFVq3NSxySjVd0A5f
         Tt8qtsgkHIYQCwAdV//2Ia3ZEJ2gS+U7M9G1dQqUHyB3bzOZ5yoJS7FraaLlHUC+la8t
         q/ydSkaoY7A0cjc98IGYooDyXKxyOuJ6VZxMYCEQs2xKJX9hiM59CV7M76JoUpe7QKdM
         y2pFlvaCXGBbAptgubZyyBPjTKMFAkP1XeS4Sprsx43WpKGamjt17I5M7jbAAAnwacx7
         ccrBcu+Bbr4Q7PbwZcjv1oWW+lXOuB9EEgZlVHTroLrGFDGWh2RLrnJ5TuaocLP8uQO1
         2/Iw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gqTIpwg19BcBoq3UImqV+PVIPovRfx7yY/pmoAxYlrA=;
        b=ifxSqD2ntCFNK3fKyavzcvrADXSbQEpUaSKnIcLDHmDLKGTjpZMpTtTJFn7aI6UBsf
         YgAssZldDWgkB9ysK51QtvKZCkn62iIBF5dovU92kK9JxW1as+gfraR5auPv+HZALC6w
         +xOB2cxYZsh/GP+IPWd8O3B/oGnqeCxK1fqo/tdHYy9TfoZ1TB/zsz8/ow74STH0azVU
         xg4JNTIuVJAgqiaI6rZMiWfjBUjbmApow2JKhnjYtOH+RJaeqjJe4/yWHOphPs30qvhv
         +EDkIx1xkK80dv5+SXbhh1IX94rj3Qf9FIiSTSyRRP39G4/XwtlOhFxt9NnWaTtOLuS7
         mRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gqTIpwg19BcBoq3UImqV+PVIPovRfx7yY/pmoAxYlrA=;
        b=N7jWGznPZAYDVytaZn8IGspAccCub2NikETVzOwWhM95VbP/j0VmwUlk7b+gftE+1j
         VlE7RKyzcEz2jwqepATy9EyyGNzx4ojybWbYBMQr0+ofHVWC1wo1fCfnfuma/P0hgSXk
         Te/fgKDTXDsUR/7x3+d2m1y6cP/oPhyQO/0fz84VUWUjztBVfOi/1tWLrXh4l6yZXFGX
         UVCrMJGF5T+GH0e2RalcJIAYo87R98tNbS9Gr60WekmPGh2q423ixcaiMEayoOjgB4h0
         myOLlkheZHzifjE852jH5MeLZhJsam8iGiqZJ3K/B0I86ZKTMWcxYHJ3qj+0ZRu6ohV/
         z+rA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWV/F9yOb3/nedcm3l7fQ4h5mePv23MOuWQi92eKSMWDj5C/okw
	hZIi0ohbd/qbKSUKRPXsFaE=
X-Google-Smtp-Source: APXvYqxTnpBeYprRdOI2uGDSnXUWdsX9dFllRaLRrln1FJbieHCViDaB+AhvIls3b0V4AeymTUwHPA==
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr2934687wmb.150.1562833699527;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c411:: with SMTP id k17ls1936092wmi.1.gmail; Thu, 11 Jul
 2019 01:28:18 -0700 (PDT)
X-Received: by 2002:a1c:407:: with SMTP id 7mr2929418wme.113.1562833698809;
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833698; cv=none;
        d=google.com; s=arc-20160816;
        b=BQ1g5XGsYSqZyEkeZrnlIgTNVGB2dPFMwu/qFS+icTpxxM6aZ6l7TK+UsWH4+bwaxv
         GliHKFkUnpdwsPqmauC+qoAvmzQn9kmFBqlrNIaUMuKU52L0xz6TTJS406kJzZPqr7BW
         ZafRzMJYC5zBZ7aSXB8k38lxCe0Q0rGx0mrVx08MuuONeNIL19HKrjX/tsedm0XOKlAX
         lP9SkNVAmwkMvMj/fdhBza6GYcLcXxAIQ3Lk4dCTrN11vi+xVE6zue4M+z8n4dIkpia5
         QyP4vwzpJwfRUc3pJObyx+PUsIotRbmlJZqQbyZ3QtWDeE9WcJjUFSM0xBdNUMF+7Moi
         u2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=fnVC8VuaJyDWsXjLg83+50xrU03aV4vC1ToUQt0/sg4=;
        b=MzTeCbXTksgMK0tSjqWDq2IZicZYW99YWOb78CzKwYOSHh0bv8Q+IIxXw0oBOQf4my
         hN54dx3fHpI+D6x/X2X1ejoUcSPqXAh3gkgZPxPgwppIDSwmajVBD/Aqkod8nk2SamLy
         8KJ3MEwws/knNWsAuyFPnx2onQGQEpe6XjKp3l5shQmfecS+GUb7U3yjvgCfinyHyspV
         wyxxlZOApw+PRKEXAzPH3ArRLQfcKMmm1e8EqoZ0AEBDFJEW1xZVi3MQZBLiqmj/rYRJ
         6A0urPde5V8TFjI6LrSxk8wzESHFkgHAumpUTfHYQAxX0HYsTiddV+ZFVoGLv7WHP519
         Ccqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e12si262661wma.2.2019.07.11.01.28.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B8SIZa002918
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7Q010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/8] linux-jailhouse: Update to 4.19.56 and 4.19.50-rt22
Date: Thu, 11 Jul 2019 10:28:12 +0200
Message-Id: <72c56271dc96c44a0b15e34a8ab62b0f24cdbef8.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...ailhouse-rt_4.19.37-rt20.bb => linux-jailhouse-rt_4.19.50-rt22.bb} | 4 ++--
 .../linux/{linux-jailhouse_4.19.46.bb => linux-jailhouse_4.19.56.bb}  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.37-rt20.bb => linux-jailhouse-rt_4.19.50-rt22.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.46.bb => linux-jailhouse_4.19.56.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb
similarity index 72%
rename from recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb
index a56aa50..2fbfd48 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.37-rt20.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_4.19.50-rt22.bb
@@ -13,8 +13,8 @@ require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "ca6da44c47571ad3ce911eb92a0174422dd9138f8c70ff2fd35c2a0b7613adfd"
-SRCREV = "64415ba5b24165b1be91bd0533fc9e8ca35f1aa0"
+SRC_URI[sha256sum] = "f68559963019307950e3bbc9ee2cb6d997debca1cfa6435ed79c0bb15682ad57"
+SRCREV = "372c95a9bdd80b5bdbb2ceff2ea741193a187f1f"
 
 do_prepare_build_prepend() {
     cat ${WORKDIR}/preempt-rt.cfg >> ${WORKDIR}/${KERNEL_DEFCONFIG}
diff --git a/recipes-kernel/linux/linux-jailhouse_4.19.46.bb b/recipes-kernel/linux/linux-jailhouse_4.19.56.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_4.19.46.bb
rename to recipes-kernel/linux/linux-jailhouse_4.19.56.bb
index 1f3469e..99edc12 100644
--- a/recipes-kernel/linux/linux-jailhouse_4.19.46.bb
+++ b/recipes-kernel/linux/linux-jailhouse_4.19.56.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_4.19.inc
 
-SRC_URI[sha256sum] = "1d714ffc990de74f877a0cb3a57c897956583346a55e172f669a1864b36c08ca"
-SRCREV = "f402f1d439cc0a2aeeb480c524f722c32e25fa21"
+SRC_URI[sha256sum] = "fe74c652761e9530e5387a3f835c781e99e751174a13cc35cf5d2ca868443b06"
+SRCREV = "e64475bfe9071b9603a59c51875c5503ccc3f785"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72c56271dc96c44a0b15e34a8ab62b0f24cdbef8.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
