Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2EQR7UAKGQEDDMJYBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B284463C9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 18:16:41 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id y1sf226692lff.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 09:16:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560529001; cv=pass;
        d=google.com; s=arc-20160816;
        b=DSW0DSI40vYqo3pzgzDVjJKFNd1GEAqgnQCP9tTIRNU9ZZk7Ym20W7vF0OukEAXJqA
         eYkOoVn9kTcyK1ncU77CQ6h0Ggkt+OVCHvHz5V2yQnNTdlhjCEZYgPK5uyliKIbIX9Wi
         lz1AazAqnTdIIhNq4Jt9VB3FLHrBbJNEd+s+/hThn4OboTeHuPMLwSbB4NeicSS9VrPr
         1+H+Ek6eiLzTf1nKy3F4wu2YRX3QHXXdb2rSTE4fAeXiUcMmgD9h+ls4RmcSlcX2xkI4
         ioEyD7I5Gv83C1L3aU6lY8Ieyfk/qs85mGA3yWIlzAyDtzhjWr38oCBueY2IcdxLLD/F
         T9XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=Z8V8NBM+m51ZOcqIG2a4NEGyc74lJimo2xhadAYRiQs=;
        b=0WfxodMi2eU4xrflaAIL4ZN4vKypy5xXlUKNDND8vXXYHw11qrESRBiEFnJmyTDxqP
         lwDSXyLotPWVoaDiyDbsbkpFu6K6AURQfJIN122OS/3/52iGW8n9B/fnuJ4axiUNriOp
         cITrVcB5FB+yBYdanFiSgPJh5B1KNdDUw/VRIBGPNkoBT7LuwRRkkoNRxqCzvOyJRa49
         GAlGiwqfeAzo/NOZOqRY1Fx7NrBucW3U/a2HDxmAg4VUeoSfCtmMfI9XYfrwrSx378sb
         Hx6yHBPdVW+fILdQtrgQEIN5Xw08f5c0NeRJUG/MquZ4JuU/AYxQcogJwLazGf5nORxq
         WuGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z8V8NBM+m51ZOcqIG2a4NEGyc74lJimo2xhadAYRiQs=;
        b=Cijpvhnd/gdxOcyvJHd4uIV8NFJplyy/wODEdvi56HWOAPjR8+766nehq8Upvn0WcP
         h2BEglGR7KthklQ0ZXWXjc8QbT3xwpzuboAhv16IHAwyABc7KsxRSQgrSxCnBMwVxFUA
         JABkC8h2HIGkdyhge5GBoUjkPUsacj53+4MXM/8s7AvORGTnWOaSEixcqqJFbgPwXgNx
         iFcTYQg008Gn4xKEtvSiBAGbaz8HTYQsoee0sWW6oocUJT3M3mpVaiTkmeY8XX5gIbmQ
         6GVqOqqsymWC4rNswX6LiQcwIbyz2O+QpjTmY/v7o/OAUXq2oYjqwLxdHuEWDlTIm1Qf
         7Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z8V8NBM+m51ZOcqIG2a4NEGyc74lJimo2xhadAYRiQs=;
        b=KqKAH3d0A5sLeMNwdBPgue+wNl56IVh5aN+ZUn2lZOm+v7m8+jA1fnUPN6/JiQsLOw
         /NJylAUiVt0pYQXWJuoaojURpwAwE53x9BmFF1NqGkiTkMyWUhEnXgs/0NZtTP8HlBGw
         garV0kEL7tvr5iPBvsfZ4U41PvMnvZqHSILiyJRbFlmaFzHlMMP4CvkWlD8bOQMrGzUp
         R0JDrHVjpaera4rKWNGmvuO1gDD4OrKUhbvN26gq35n1G9KNxBy3v/gMjZzjNLoX5xZF
         RsxhhyeUYveaz0MXuwH3fq1Zyl+zL623v7wGVzt0Ew0Tn9nH5XB/REofI8oeZHTFqLOS
         iuHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCAHQPsZ4ZK4ftkI3wrPmtGlBHuqobGoBI+GZNmmsvngD0xXej
	F0u31JlAHbGup8GNNoClzt8=
X-Google-Smtp-Source: APXvYqyLUS0lhI70z0vbOBvt+iC/kENufq1A6nMZWedo0aew1AXQl9WRii6IENmG49ezku7n2BWU0g==
X-Received: by 2002:a2e:534a:: with SMTP id t10mr24595655ljd.109.1560529001063;
        Fri, 14 Jun 2019 09:16:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:2d4e:: with SMTP id t14ls922657lft.7.gmail; Fri, 14 Jun
 2019 09:16:40 -0700 (PDT)
X-Received: by 2002:ac2:5382:: with SMTP id g2mr47307361lfh.92.1560529000267;
        Fri, 14 Jun 2019 09:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560529000; cv=none;
        d=google.com; s=arc-20160816;
        b=qbMj+jV40JFCgsrGXibrZ/aQkH9AINFIgO1PsXGgUdWKhTN3rHYRJJ/mPB6G9nUNyv
         8rEKqRknO3MvqC161JM3H1J4IavujFb0BN2xrBw3vkqpO1cmxy2JhQdzLbDNuZQse7yr
         L1KB8zElfw4YdRkGmFTm0hQJovr1h+6p2mwWy4HaGGXnOe2mz2NhHMWoWL5XUKmFN2S6
         WQZuW45uQJtxsJeD9M0tAOX+1rpsaz5lSB8pHpQUvhiCDJ9kGgjhLtPkv1hDYDF0rOoT
         C/KFy9A9V+0M9bONwXW4DjuuDLPSOAXrx/If4aY6UjvV9SH8Q75MQZcTmg0p+bzaKnzh
         Xw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=5EUPqp2iT/MLtR6NAz6Ddf4up2rJ3MBsAOVQw3L4jjo=;
        b=QQpLPhwF75qQGwrvWxi9ru/kw9ruGeKLp/842P2+jfcjQfQ6ZkZmQ2YBSs8NEA1hS2
         yTcmRHjzpDPizF2ZghinfluLl6tRmM1ZQM8RMAs22Wv7mdoNNRi3nc3eAYhJdyOaxKhV
         r5YXEpOxzbNvc9LL+Y4tKHChkNzu8k/uWkLymmp9Dos+UrVJPYx1uKgKLXC9OuxeJdkw
         KbIUOYypaNWWJVuDLYOTvSsIZny+qwA4x932CsY/YyR33vG1/TTyLr/ApGpy4N2hEBNU
         zcLfx6nS21OhrvzOIm6AFqSEopNF2cYnZP3XEh+BfP2Bb0bBb3hYzkECWdwW/zFVT241
         gVqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v29si195569lfq.2.2019.06.14.09.16.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 09:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5EGGdgZ028816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2019 18:16:39 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5EGGdk4000672;
	Fri, 14 Jun 2019 18:16:39 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] inmates: Add missing FORCE dependencies
Message-ID: <b127de14-55e0-d6cf-e588-da367b96e19f@siemens.com>
Date: Fri, 14 Jun 2019 18:16:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
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

These rules require unconditional evaluation to ensure rebuilds when
only variables change.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/Makefile   | 4 ++--
 inmates/tests/x86/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 527436ef..32968c31 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -63,9 +63,9 @@ targets += header-32.o
 CFLAGS_cpu-features.o += -mno-sse
 
 $(obj)/%-32.o: c_flags += -m32
-$(obj)/%-32.o: $(src)/%.c
+$(obj)/%-32.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 $(obj)/%-32.o: a_flags += -m32
-$(obj)/%-32.o: $(src)/%.S
+$(obj)/%-32.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
diff --git a/inmates/tests/x86/Makefile b/inmates/tests/x86/Makefile
index 51c63917..6c8dc0e7 100644
--- a/inmates/tests/x86/Makefile
+++ b/inmates/tests/x86/Makefile
@@ -24,7 +24,7 @@ sse-demo-y := sse-demo.o
 $(eval $(call DECLARE_32_BIT,sse-demo-32))
 sse-demo-32-y := sse-demo-32.o
 
-$(obj)/sse-demo-32.o: $(src)/sse-demo.c
+$(obj)/sse-demo-32.o: $(src)/sse-demo.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 $(eval $(call DECLARE_TARGETS,$(INMATES)))
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b127de14-55e0-d6cf-e588-da367b96e19f%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
