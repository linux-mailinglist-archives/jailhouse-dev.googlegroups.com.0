Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWU2W35AKGQEZDQNWFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C625848C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:52:59 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id f18sf1701901wrv.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:52:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917978; cv=pass;
        d=google.com; s=arc-20160816;
        b=gBDUyjbyIsLcsb1NiMazvbg+W+i0H1hjzH9UQlA1Z9NQE8Xtmu6aCS/BpMDNxekyey
         Q/QByJ0MFlRtmmcCyzZ5fdV0mZJej2rUmSumiD/Zu6+go5S7qK1tvGqBEeiuPwRCqpYL
         ucr3O53yrbjhPE2ZFuTCtoIEmck+PdaQeOfpQpzVN5+n82y3w5AkEq2VDyDFaPYYFbw3
         PiCqeulHslTWrYMhETkIoVtSvU0pYgQ5DRI58ZE5+yWKsBCoYglfygSUzTfoFloQ1y7N
         A74BiJ5a1RjNeFVMItC5P1WBIYcuGnMc39RpZKa4AxQ198kenY+E4DFXxo0p1H5/K2Nd
         DmAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=rwGnETI7UJqloSCpFyEgVO2iLrWJI/Pzid6rZCOeZGY=;
        b=YvGMx9Qvv+ZIwVL43NjtdG0RU9jxowgQDlQS4UJjqMbIt8+Asa7VCCxwCyTpmKzBqn
         +lhRpU63JtsI4Azci8KoXhOxsy80Ckds4yl/dlReptHHql5wF7nE6xjJovpjJjQVDNQh
         gcg7tykYMc08Q9IfQFmlmWJrExT+GxG1ACx/gy4f9/YKmyS0J9Crnpt/VlB+8mlmc7Za
         TnKT82FGslyNyvKuaiFriPw0iSB4cJYDl0K7tAnSiYBYTkErc+DZryQwCKnIRtBeno3i
         ehQZuXM01bwsG0k6XELAIbstHxfeptQ8wgP+1HRZkqNSPktL01IrAPrEYkw7biOs4R6o
         NZ2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwGnETI7UJqloSCpFyEgVO2iLrWJI/Pzid6rZCOeZGY=;
        b=sJ00aovH9GfKB5PBL4q3u9gviXkAcePZwfzskTf0rIfVsAlUTJ+bCEQ3NXbxrsCTMZ
         JXt30yf0hHhubfreEh+ZTNgOk2Mj2P2pQkgOFSNd+puj1AIKS+7JDSsUDoQV54BLEO78
         aOBW4IMshdgnYgoCcYOSRl8jLZbXVjwiYDP2FFf4PQ9mX86ogT/JiO9zFy1q4Ilr8eg9
         +RU1LRLoi+AfomWZR69GIZZN6xT+oyOLiSmoXNLo1V66ndYYJ83Q/OkqUAYfm6nTy2BG
         YZeIZoRWoafeyDuc5azpuE6vtNminVB+SK8N8TwLUs40+Mc7odEhvb+8macRPTmMxTni
         LPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwGnETI7UJqloSCpFyEgVO2iLrWJI/Pzid6rZCOeZGY=;
        b=fhqu2QcB6Dd5vuxjYLank/6bgz0UdlmAb7WVq17s1SV+0cA3/SHervrEfmTUwfkPcu
         FlUZ0+UW6NWqxXVDTR6Rlk2b5FMTlZJPwTxpcfEiwwzMqhD7FTe23VKsHLasheQ8k5cC
         FXIMfJyolriTgxZ/NzhWCMMAj6Rl1EqTx3Oje3wwShblLzjewvAsvvSCv2LDn7eShUX/
         Iex++EQf87phF63H7/vbNQVnf32fu2/y0IOMby09mD076S5QCRa+pHdc2CjyuFmj0QCk
         5ku0nXG34xVzkwaaiXMdcSqjL9qC5Q/tp4CIQXbwSfTJMNM4cYWt5aQXGltHt3C5n1Oo
         TzeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rhlmDRZRxx5Iod9rYYd9tw2j57eKy2WQZ+NcZe5cdRj8Etwuj
	8HeStIpnVLUX5OvVe++WgJI=
X-Google-Smtp-Source: ABdhPJywd3m73iK2+cFGa97OaFWKwiv2c3uHNabiqxqxbjDSfViwkVY0b4t5D8OLVZWO4rZVaYYAXQ==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr1685855wml.16.1598917978801;
        Mon, 31 Aug 2020 16:52:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ca44:: with SMTP id m4ls280707wml.0.gmail; Mon, 31 Aug
 2020 16:52:57 -0700 (PDT)
X-Received: by 2002:a05:600c:2289:: with SMTP id 9mr1577293wmf.55.1598917977881;
        Mon, 31 Aug 2020 16:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917977; cv=none;
        d=google.com; s=arc-20160816;
        b=WH5p+LbXryNp9yYR+rOe0bm5gCa8aD8+xogcMc7A3/uvQzToZfLSectKuUB058ndGe
         kG/2UGR71ZGVw1O8tOXvgFlISxkf4AYtbq4kVxtzWoT1Fs8/5tpLCkRubUuz+GZwQwux
         17v1+G/aJGkGUY6FbeNHdJEdXEbmpvVGtF2Uyn+ajCqQNQZSpuvzfCsB7ERPooTuVYMq
         jPkf2lWQlbAX3BZDuYFtgc2ZsawJpeY3F5HNYdYCrhP01bZSuLR99ypIBf/ESdvWfTo3
         j1eDBr3vo+lnwiuwEMwBEK+Psp9JPU3C3/tEAjVPahbY854kZgqKyhVM+MZILg5Yj5Q8
         /ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=tJChUFd2QN7OLUCcZWVr4/ZdWAYrf234fHaXl9QUngo=;
        b=nan3joONOBck4toYUVqNYwu0AFS+KVbhnsc3d/1WbnUt4EuTLjZGu+GEUgcrO32H3O
         wMhcNoGCE2y7JdX9sgjx90wdANekvtHLuZl+xVVmpObULvmYT5rFhBadZ/hsdylmK+z2
         7mEGG+jrsby/p8lDN3gac8kGF1U8dB2rA0/j64sFmMi71kZx1cxwZP++KlH/sJ067mW/
         gpL7OCwmAf79xtrgqKTsRuBPX76CohhJF3feW50T07ITOxzqqj1MjN2g5Q87VK/4G016
         NGsZtdAByRJOen9QjcoHYcuFE3MyioI4RlfLMmBCLS2tyW/coYS1W+uz7vG5VN+PgBZL
         sqpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m3si30884wme.0.2020.08.31.16.52.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VNqvn1020161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:57 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorK007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:56 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 4/7] Update Isar revision
Date: Tue,  1 Sep 2020 01:52:47 +0200
Message-Id: <723952bad4215058ac6b4858c0a81a13395e28bd.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
index f710cae..6c3c987 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 351af175bc54a201c6f44307d4e998bd6c0afdb8
+    refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
     layers:
       meta:
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/723952bad4215058ac6b4858c0a81a13395e28bd.1598917969.git.jan.kiszka%40siemens.com.
