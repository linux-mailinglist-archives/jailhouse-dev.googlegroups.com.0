Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR5DSHXAKGQEORCNB5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A7F358C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Nov 2019 18:18:00 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id u6sf642672ljg.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Nov 2019 09:18:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573147079; cv=pass;
        d=google.com; s=arc-20160816;
        b=mngB4FiB6t1M488RxLxWpmachxpmx0N1YkY8id/KOyAr5Te4aJ/iVuMpyxDgNR4gX/
         U/8DzgLluUYSmBPbOC0kDfXDcLcVjj/MAM12f2y8qDIaSc32ytENxzA3HEGNX+LzNNt5
         3+QY4W1nqBBGnqKz3zZSQ3W28LQ3I9sdpVMaYo3b49UTsjiaDXe6m7BsXDAqxjPjU7/6
         MbyKnAfhwWsH7Y+40ctBuZIE8qxRnpo39eInszxPh3B3GaKGXQArFuj1FWQXy9Wz/58x
         4UMXc5M8M1xan9OlNZ9Qd43lBm/xVmR3IpnVs1IsOePhOWN/meUHbyhWR15shWEt8Vi1
         NzEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=H0C7RQD0IOlmFQy2qYzMcAtqZBuGxAlv/p45f/1sW+0=;
        b=w6zSg8UHt4neeYp5wqglESQUL/oXHBhpUxS+Ssv+7bQACf9gpFM+1vnUtKl3FG6dPW
         Bb0NjSppEgjJ8sg7w3T3T3AGA1uGi4qNKom8qLq0tUoFrwqTuEA3xwtsJulURZzHjE9h
         bWJJWqg7AyOq2ZzvbjT25FWnIuROr5d9g/XFw6jDvMOSeO+Amua895PzAQCkkt43CtlY
         l2u1jrOnuBp1QqVkw3zJXqlO2D58V2AsvjQhHtcCEUBYgDZcXsLAhef0xlboa9X8nghW
         OUbXzI5603rgdOzsxWIvmRNmLVv9eiqPgffnItjjNeXa67FdtNeHmUVBodug5hHxZh0T
         sSAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H0C7RQD0IOlmFQy2qYzMcAtqZBuGxAlv/p45f/1sW+0=;
        b=cIzw5OMHzgz3FJi2+CGGyjEr28916UNHAQ5cphIsp6dV3XFC8TfDc0B2p85IGZOIBQ
         ZbJtRoMKy0vC65pePUS1CDaLf8N6tGD6dYRFCA2euNDrkhDvgBbS8A6BvOLdI8LePtq/
         bjAwL+Qyfq82A4Z5WlGOm8NbH24GPZj3JUUJYvq6h70FRbZFm7mcu6m+pYvzK/sil+2K
         FKvwvu07W/rWlClsXbNuSytJpSe4O2o9n1b87NNb8P/Vi2b/9VWtCNs4k3XszHz9jTk9
         vnQMpSU5tJF9osn13Buc+DVxBFEccQ9XPsYsI7NPtRHg6S72ZYqXJpmwHkocZnjz+sJ0
         Xb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=H0C7RQD0IOlmFQy2qYzMcAtqZBuGxAlv/p45f/1sW+0=;
        b=R9e9lK5ltBsJm0yBCc31Aac3kKahYlDaooK/7ub6ElMC7VsNkUQL0iNl+1sMaYBlm5
         SQgvpnBI6IWP2z7+mtHi2aX5+VvXaUxcSd+kNTB2RgnIXdWd0ucb35Au35TueVq/61cU
         3msa+HBHUPBGAF3L2WbXSQfmhm4ef0i775PCDfNHr4q+sB8ydOx/RGI43j0KzF9ajInC
         1rDJpjmeREZRrkl1P3Duz2PSLrqz2Pz8liIzRnZQeRvZi1uthh7kuPkk32sYnopc6Eqn
         pbQ6jki/nlhHlbFOZyAPPX50JDhB++GGH6GiIj42Y9RcyqM1UtS0WtjRmX1MuCk0f/3x
         3Zcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/CfN6KQeBmv5932haKlXuGNnmLcxMFVF0lHGAa2jT7kBCdkqK
	dIKyYhX+LCaKjxpJv+CK60c=
X-Google-Smtp-Source: APXvYqw8z37QvQIu+u/kiW13xliZsKsMv2N5NYoT46Js1RoT/ndmzDOpTKqjq7FfLN1ZBGkhsT7epw==
X-Received: by 2002:ac2:46e3:: with SMTP id q3mr3241310lfo.9.1573147079776;
        Thu, 07 Nov 2019 09:17:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:154:: with SMTP id c20ls1198116ljd.3.gmail; Thu, 07
 Nov 2019 09:17:58 -0800 (PST)
X-Received: by 2002:a2e:9842:: with SMTP id e2mr3252497ljj.93.1573147078781;
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573147078; cv=none;
        d=google.com; s=arc-20160816;
        b=Wcakvvk4v2pMjwmYU0ygSsz8OL113jTM/SjotAtFt0XvLKr4OtfJ6cModJBhpmjOFG
         bhegW/ywLhapu2arQUqacV7sxWoKyypmLfoJby6Co3U2u21k7uHm3kfelqeI9EWAazVO
         cYKHLabIF9zJ4y9cp08wh3O+VG53qZqr7nA2QhK5WiqwpYbVljKWUVnH2SiZNxnRGGKH
         VCks19nhtjx+CBzEHeKzbtTYbhutR/MNI+TbVCxUIBj4weiLUNegQ3tgqTrUpvShZ/9m
         uuXMnzGX14NnS3Iw34xwt7WyRa0tCWb32bECNXEk1BxPgqCa+5r0fUk17MX7I+oY7dfF
         CQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=PKqC0IeiiHEvVgOoOHRMeYmcUhAey6FcktSmzlkU8bg=;
        b=dj20EMaPhJC3I0sz101hNhd49b9ixueHm3QseHQkGGAOGrHPlUy+iUoqE7cCZ0nxp9
         sHFJT2M+wAoJhEgYa7eQNbpxLwDJimXE9XS6VDlgR6gavnIiOOfgBhO0TMHhr2dj81vU
         JLCrxg+DRtwOpKPY5v8A23Oo/XH5stPwvYd+U4zrOVNIDLwYkrK4zgUdIf+JaG1M/Y+k
         oGT7OP2x3Mxxa3rFmiNY4MB7vTo/PrdU3lFkq4wAFn6+EjPq2tQ07of5dRnj6palpCPg
         Zd6xiBtGKmZpih9STp8abzPAde6gNUAjI6HFLJ7x0eMslIXaDkNdhCYnFYrfufuy0gmK
         cuVg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j14si190982lfm.2.2019.11.07.09.17.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Nov 2019 09:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xA7HHwEM006922
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA7HHvqx012202
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Nov 2019 18:17:57 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 1/4] Update Isar to latest revision
Date: Thu,  7 Nov 2019 18:17:53 +0100
Message-Id: <53c617feea1b232cd08b2cfa9e7cbaefd85126aa.1573147076.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573147076.git.jan.kiszka@siemens.com>
References: <cover.1573147076.git.jan.kiszka@siemens.com>
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
 kas.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index bbc7e69..f322b88 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 446783f6bc4bc3e96c31da93b5389e391e74d533
+    refspec: ff1cbbee954184066baad814ec88dd736aec447b
     layers:
       meta:
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/53c617feea1b232cd08b2cfa9e7cbaefd85126aa.1573147076.git.jan.kiszka%40siemens.com.
