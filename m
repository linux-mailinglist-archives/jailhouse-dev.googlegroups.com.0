Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8013D7F2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id y125sf2179269wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=Xr4zlyg0GvZknVO8mzjg4MAsCx+Wgu63jeWp8Wd4eYah1NUc00a5rthyaChcSJ8Zu6
         G7nBncHPhSZQQbZoxi3dCvmB73U2ToonAq881Roto5FEpXsHsaPghKfyDkFucbXitAva
         SDxZ48UaU1jbI1HbvLYxWXAKFd1EEs2hrvtYGQ60qQbqmssX/xX7nDR/YdNgYnwKTpm8
         45SyHJfN6+9+7HUBIb6aWJO2qPfu7bgNo80wtqVQcClJ/JJe/kAIvQs1WAICu671ogIr
         0l3ApdXO6AL/Lj/hFshc6u1acbOGbgF5FOiXscgQt9atbRXtnyYaw3fXIhQX/zX8rFvc
         lo2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=HApcqueKBvXvUkiqZnF9gQCO2dmEX/byaXXCyyVM9ZE=;
        b=dHF9amGWzdyr1ioo9kNpbdAWb1qY1+cKHDJfGyyOP4w3X1a/1Atm3OGhkGdPYh0aVq
         UJVErSWmvLjgmaKXTpRshcQExIhImJo0IH/74l8eqqEwJ0FGzWCIMCg7Go/REbPnPxLn
         jc8wt77rGpuU+I4MEB20YWCPmvSufkzjdYCM5kcHL2xfc6Snjleyr6T/OIkb2jMDUylY
         19PkkFIrkxvipQfXC+rI1XohOTjvqg3NjcA7Sw4Qs9FW09M6TNdkpDU7dHL+zPF5Eti9
         3BqsMif3y4JsvqVc+cPqoKwPUzDufCkg+0gqwT+2kmOvwoJGA9rqEGzoYqYIEVN9Qrk8
         esSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HApcqueKBvXvUkiqZnF9gQCO2dmEX/byaXXCyyVM9ZE=;
        b=XJqqZPxT9OausWiwOeZcIFw+fSkYseddSHcDLIczmQQGh0m78istAVXSzrTJEGBm50
         LrcnReVbDYRdn2bNA+2myTjiC+DsGKtC2KWJULoMhl5/KjVRFeZS4XyGiXDt9qaxtm6X
         u8ERjAemeFVBtrdVtf8N+PusdLK3Z5ntU4cwnm5hYaJl2M1g4q69zZSmgqBzHlrIcloR
         gNpbMJngRXkdVkk9lvYtmUScPnBI/qn8mEqyF8p2/yusirMgbMkA7ME4uWkYjujrPBGW
         0eFNWEwE+uRCDUjjDVDXrTQh5NaU8VQgfGNQMDjsb1agHznyTZlCq8i8qD9AP785P9ku
         AxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HApcqueKBvXvUkiqZnF9gQCO2dmEX/byaXXCyyVM9ZE=;
        b=KIDZbxnV3ZqFm2L+BxL7K3LzN/9j2IXPgesKLqOF3rXIXNKDtnQLlS4gIh6Ib7cUr9
         O3/7ITmhf9kGQQimSm7GZVmHLEUObjNQ7mzV528SQ1GEhsVt342GLFYH0OcwVMO55UJn
         cJ/zkt9WKHnSKNLVnMpi6+s+V7+Ze4KklWSiI6qHP7QG6AfMjdugN2Z4q6E5MWxeWcOH
         nfA8AScdarOSWdAAw/0BXoME8EAV0IdonKmDoOtblWbgxqKgeA/PCb1NFbSO/5KYMcng
         AW66tplnRhmyUGkN1iTkKgj/3oP+rQOlefHP7GaWbj+iAFiq3gvQFNEXbMEvmBGa5jMY
         K/mg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXmdba5lJFdJ245xp7n9Q0sq+SO+8T5g+QoQ6ubs/T6pi9OYwb9
	qQYnT1oNMLZLcRNnjDCZQrg=
X-Google-Smtp-Source: APXvYqyq5Pv/tCfytl8RDvnNWx9nUOP0tiZesj+kaVj1AVqsCUgGf76xO4XE5WsR78jFHMYoCHq5Cw==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr2496612wrq.3.1579170890333;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls7787657wrg.10.gmail; Thu, 16
 Jan 2020 02:34:49 -0800 (PST)
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr2715095wrn.219.1579170889497;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=yrFvek01ohFC9too8amBgIF2uHPwGduHozMY+lneewueFElgo89+xQgPNZaEilpUzW
         +QlMs6Vx/384BIubo9UHEfjcXywHdFB6ddcyit/GktPTNSsZii2lIXzkHWp6tMvjDSPS
         TG4IOuJZqZeHeP1bAfNEVcbIRuyzTn9Ha/wWKHahNXB2RdVmffJ4B3Zb5rO6V8B1EMS2
         y0ZVy8FeLkVIr+LCDsRsnN7gAXQHMJKnH8B5DxseKnHFKU8V5gFoIEBlLiRE4ZgkcuzU
         1+tmKDwuC4zm4ez2gdxxNCR9a4lYlbLanuIUwIcwuorLaqPBFchNGfN2m8ycofJ/f6mZ
         5+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=v48ymalqCvECu4NoLsQNR7EVEf3KNMUlxPmsU5B+8d4=;
        b=1IprnQeW82+huf1dE1G9rIRuXet26DdtGaVdssLVqa+2EFIsDHkoWAFpTE34/P4QWD
         io6XlcOt4bvlrnu0+WqYASoZm9B20ICz5I1Ula9Mil3noYFT7SCp9p0aJKmJxGuXtzF5
         U3K1Fg6wKQu84VH5AaeZlcercRJguQb53xnAMmVG+ywo7LJvk25rKV7WkGvEsDfA/SUn
         HJOoT7/OfliaPXR63+q3zGEKIiw3XtEh12iaYm7sTvvsY2NwxQAJzfiXfJSdlxHvyc18
         Afjej4zdcoFuwcWB/MjuC6G+HeUGrDaoGKKMwb8yhJZBPP1eBzjgIWydIhmyyuKQ2tnU
         4bCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t131si102456wmb.1.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00GAYnTh015550
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQD031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 03/18] Update Isar revision
Date: Thu, 16 Jan 2020 11:34:32 +0100
Message-Id: <42ff3eac3b0129d11feaec7a22eea3f5a1e36223.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This comes with a reworked kernel recipe which applies config fragments
automatically.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 kas.yml                                                 | 2 +-
 recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/kas.yml b/kas.yml
index 72d5348..a5a157b 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 29d3f050659e10292a2fc3fe500381b860a65335
+    refspec: 619d6d88ac8c745282fd16773d50a466567615b6
     layers:
       meta:
 
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb b/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
index 52c54da..b93967d 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_4.19.72-rt26.bb
@@ -15,7 +15,3 @@ SRC_URI += "file://preempt-rt.cfg"
 
 SRC_URI[sha256sum] = "2d4640f928e237254ed4242f75c6133853859d38aa08a6b91fc3a919caa0dc7e"
 SRCREV = "90c6f75204884080b23d30424a4eff313dfeaa7d"
-
-do_prepare_build_prepend() {
-    cat ${WORKDIR}/preempt-rt.cfg >> ${WORKDIR}/${KERNEL_DEFCONFIG}
-}
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/42ff3eac3b0129d11feaec7a22eea3f5a1e36223.1579170887.git.jan.kiszka%40siemens.com.
