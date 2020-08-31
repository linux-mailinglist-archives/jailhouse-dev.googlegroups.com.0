Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNNWP5AKGQE6YTOQCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D42577C8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:53:54 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id z77sf2093667lfc.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:53:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871233; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zr05kYWTDOXA8vPcIGRV+9jaiwEBpjyt3qqcHxRHmdN4p9bNAvo8DOcxQeMtKQmWbk
         dlkrC0gIcu5O4nkLTdf4s3jmzr2uK/eyVdA27nzTVJ4SmF1eBB/fXkSRy8yLJJ9liMop
         7/idOnr9n8US2t1Q33j5jYQGBOa2Y86YHxQg3Zpjl11FYHa5ZZF+d+eTuYLJ1b/xlGCb
         xYxAJwnUUYm5u9sQt6srjVDsOkXa6gLfAueqqjOMK0FP83W3cafXYOV7VD7ULVj0owrj
         6FQxHm9ohPvRu02suB8g/8hkHUqzGZ3dqks+mluUpYg542EgGJQ2Q4ooO1t+gPplxpuB
         sKLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=VBAIK/HfzJlMzQTVM1yVqxdnPLrmhZwpzNfJRY4UOv8=;
        b=zMYIxC/QMwBOXMORj+ecDIHF8iF+09CYPcdleAKIbdzeJsZAliOZxIgVBMQmBCkVDq
         YbyHsYF3AprC6QRhW6dMXpYkZugf1HFGs4epjmWEOTncFmNg/5X0Py1inzpgRtdLR7eI
         BsWmbdnCfMwmn+Ds0FLXMQ6XjbWLiebT857RbKyidz0eXf69BItN8CRMNRJjckHPpLmA
         V8p/EnwLxaPnxCPYA9BNsRym6yFv7kIYRyA+Yr5Zsw8gliO0gxETHueW/vXiKiacrwFJ
         QI9w1Q4bN0OwowCgNqKM7IqcyGqbq1bomAOPnjQjB2YHR7XQnK0+3U6ufmFZLtmBa2vy
         HAQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VBAIK/HfzJlMzQTVM1yVqxdnPLrmhZwpzNfJRY4UOv8=;
        b=MaZJCNge7YgteGpTiSXODnwrZHDojJZDqBAmS+Jl8isAwWwlkRwoKERKwYjCmNE6Jp
         5F58tIG/Rb7+MaEl4OXnGzQHAwds3Qb09CidU7YYKGQ1YN3vn5NHG8jZnMmAkwSN5xkT
         e/fsMmTutr1h5iO9EmV9C3xNXZRtPn1ralEiNnDaWPcYfsswpkffDhaCmRwaQcVCgr/6
         Tmejve2/oVTfbeWJARtxamrx4m2wjhSWj8invbaglG3j2DxwjLz13xNfm+SNL85AD0qN
         9nWm8TgCVsU55D+W91FPYhNMsXm4YRE5N78PnqA98gdUtov9MtDgjq6pqUlrTYhg8Kzb
         Y1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VBAIK/HfzJlMzQTVM1yVqxdnPLrmhZwpzNfJRY4UOv8=;
        b=tsBHEJWxJPKbBZuEuoYYL31tikq7hc1lZOlg3eJXin0UzXvO+C/s28Cl2Bszs2dBdH
         rqFhCkHYagUWcQux01CPEeybqjJDCfIm5usHiWoL2aMAqC8aWTBty8rqm7Al19V7uhnI
         kzCR8cnTSF9GMxIgWx6H29wg9w71gTyyF/8L6AvlS69zxM5ktdx2yIR0dIYEyEx+8VyI
         WlafpHPilz6MGLzEisI2nL8sEuLBwv3shBtFtHA4H+PqY4M/WwRvQvj9+qkH28JT/vyb
         fWjWuDwNu22n2Fr64TCJp6ZAxq0I3CZz1a8qX5qPRjo0wajUF3Lv7BZ+0gfihMA0GJXi
         Rjvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gwfWakYT9MGvJkrJa1FD3Qzavgpxs2pUxgGPHOsqYyY64e+ed
	VVc3Jq4KDT0pNWqifGdEAwA=
X-Google-Smtp-Source: ABdhPJxKRtI3es/g24q+8/nzbo7MylaStc5foCtEkzjDJShJxGMdrumz4dWqGjv8bETrQ68lCqSxDw==
X-Received: by 2002:a2e:b1c4:: with SMTP id e4mr401989lja.379.1598871233539;
        Mon, 31 Aug 2020 03:53:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1173124lff.0.gmail; Mon, 31
 Aug 2020 03:53:52 -0700 (PDT)
X-Received: by 2002:ac2:5599:: with SMTP id v25mr429107lfg.129.1598871232425;
        Mon, 31 Aug 2020 03:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871232; cv=none;
        d=google.com; s=arc-20160816;
        b=c9VRasGuN5Jem/bkU+UMMYIkMijkyJvZaEPJ8Ld7MpyxXXF3XQll6F6ni18q+yjx4w
         5Jq2UHRACrObx3TAJk9kXNd+yOgyvdMihMkIbBYeh2xv+vgLS5vpVEHv2Alxs1Kkbz+0
         jyd6yseZJ2Nghu5irfRyooDJkRHywQkfMw0w3dOjlH6TAa1AHmBlAON31pRvNmlsr43A
         nmXz5ERhbL/0TZSpdwMmFSt+UpOZ0RvZBDkTEgsxhGlvbQfU3VzNSgxIS6gBItltEogu
         1i8hNtx1sNvXEASD6jafPizHaBB5hEXkSdMETgJQ0FCZtp5YCb/4qfGtehTQpj8CmoN+
         tPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=bOXa5greKDchU7N2zMW2rjna3hjG2vVLN1S23iqwBTY=;
        b=gb4hN6d+DWas6ZVmgvkh/Bp3yxIRJqT0PlOyKK2EiXwwGFl2lismJ3HjuifQRAqQ0+
         UE+O8q9dHmL1ab3y90gxtjENwjbHjPJ2SHMQNX7ZL5Qq97LeIiGldtnRbTgprN0niSHu
         WbjpKGruJ4vEr3D1nnnB+WsLjKP8eSbpw+nK6yhZ4M8MVZ1GfVbe3W5c5svdPKIwl7vT
         t02wFZCjAQjGTgM1jjZagHZ54NctW+w2EIDFUD8DgK4vL+1kOFAmIxNAP2DOCGXDduAr
         J8kRC2ObCszVtU6aZJCuFebfAPnH6xntDVrUK3jOVAlyFyBUtJOaEJEbfBNHtdKHYRDH
         E2Mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a23si271908lji.7.2020.08.31.03.53.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VAro8B023795
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VArnQi026382
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/5] linux-jailhouse: Update stable kernel versions
Date: Mon, 31 Aug 2020 12:53:46 +0200
Message-Id: <00284850651a221063debf9e524be96cda4a86e0.1598871229.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598871229.git.jan.kiszka@siemens.com>
References: <cover.1598871229.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} | 4 ++--
 ...se-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} | 4 ++--
 .../{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb}  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb} (62%)

diff --git a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
rename to recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
index 32db5fd..a8b296e 100644
--- a/recipes-kernel/linux/linux-jailhouse-rpi_5.4.42.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "00028967b4ac4fb78380903d7ea7a952a5016a932e2c266b634f980896e423bc"
-SRCREV = "938661d5eb8740633d427810c37e83f16da8cc8b"
+SRC_URI[sha256sum] = "dc9719a70743bf98057eb1a4d1e40a2cbed9ea08fc752a1a1ddb0285d23a2ede"
+SRCREV = "108bab72978d4ec29ef6ac32506eb1783af599a2"
diff --git a/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb b/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
similarity index 65%
rename from recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
rename to recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
index 03693ae..ed840e9 100644
--- a/recipes-kernel/linux/linux-jailhouse-rt_5.4.43-rt24.bb
+++ b/recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
@@ -13,5 +13,5 @@ require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
 SRC_URI += "file://preempt-rt.cfg"
 
-SRC_URI[sha256sum] = "299f777d0b253a4bbafd40ceade93f967d2bb637ed7bb4a6ed8064474fc08600"
-SRCREV = "db818a378db60497d2e14a697a486826772f5024"
+SRC_URI[sha256sum] = "7b58715af2468353b966dc57ec41737f41cde8729f1e2e209dc1d10e758464a3"
+SRCREV = "951c9e56a32b9ef1f9c1906b5cf8b47a8d953d64"
diff --git a/recipes-kernel/linux/linux-jailhouse_5.4.43.bb b/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
similarity index 62%
rename from recipes-kernel/linux/linux-jailhouse_5.4.43.bb
rename to recipes-kernel/linux/linux-jailhouse_5.4.61.bb
index 5803cc9..2892828 100644
--- a/recipes-kernel/linux/linux-jailhouse_5.4.43.bb
+++ b/recipes-kernel/linux/linux-jailhouse_5.4.61.bb
@@ -11,5 +11,5 @@
 
 require recipes-kernel/linux/linux-jailhouse_5.4.inc
 
-SRC_URI[sha256sum] = "b813375218deffe894443e905351032d58c5746a855acd446258523d767a2177"
-SRCREV = "817f74fae9af14d74e43b69f74b93635dfabb751"
+SRC_URI[sha256sum] = "e6769cfb9fe666372a5baf52e116c6022ee8a0a2de48248a5897c6af54812a8e"
+SRCREV = "eb3ca54a7882348374d7ae32a749459c8bb4decd"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00284850651a221063debf9e524be96cda4a86e0.1598871229.git.jan.kiszka%40siemens.com.
