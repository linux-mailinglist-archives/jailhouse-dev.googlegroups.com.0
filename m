Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIEO373AKGQES7QBZ7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B71ED3C4
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:52:00 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id u15sf930925wmm.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199520; cv=pass;
        d=google.com; s=arc-20160816;
        b=jmo5bZCx63JW7z2fEda1J+xazrMz1/8JBIqpgG6L+C/0rx9hF7xkJC+3KB7qDZtm+G
         KOk3TMDwMm4+1xkgL3ENviyTJX9fmINalpkBgtB0S5chyi/jbIZajndF7soa5InLwBCL
         06HkqQL4MHPTOJ4FRNLyQUh60UHYuG90sD2LweUV/0VeVyLzxbSXWFUbH7rnA+Q6zrIf
         Tqk72IxgpP4FmGgDLrcMmMdnGSmmgfSefhpG8d4hrAd9bBphG3HG46sLjuf+Xbcj9cOj
         DP0zUxHfLuoZ27ZUaVXcTA4mJ8OrN7gswly2mOxLWqq8oQo+qgFGz6pIVkplasXYGccb
         sIAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=aLIY0sHzn1LGoM/kEpt/BBd/i3zHSXUq7A3QOsaBxA0=;
        b=BmVBG9g9hQAFK2qD3jaq9NLIFnkbYaRoD+HOA0RujTxiE/vhFnqGRWXX5AxgXR7dYB
         qdN6jWCSVHwKIOCLKIbmufARBS17O1oC2zcpVx9mER7tXvRQQtp+NxhFy7IsCqwOsAMb
         oQ5H9blEW1m8R9DdLhPV+il69G9Ze3kXGIcKUm9XwrYlpwGJD5bP1nD3X8+nzDAfvf/g
         d1zZnaXeQ/BHE6vjcpYHP1y6+6XpLNd5eyITojKp0bx7n+cLEeEwaSaOzC8ub1doARqv
         DAvPpn9/NgJwPmw+8qr1WlPHsB1QY2GNnIm2FogPK2BRrQKKgW1+CMGk8G71zZ2L/W31
         d7Tw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aLIY0sHzn1LGoM/kEpt/BBd/i3zHSXUq7A3QOsaBxA0=;
        b=PTsJW1lzoBnB2n9NSmmdP4zuFOslcXJ6gF+0C7WALy1qxvRfd8/pM+EwiaFO60SfoJ
         ALivmdcn+Lp3vFQca/AxDVY2fb99RESgP2lN3Ld0jgVd9GRr2yGNTx/OOgAjqfeAsqYR
         nm2JMfGUjLS71cv8LmBUG2C9378jh7T55sMX/lEkSyPlLusBb+WuXllH8XBd9HmBrryg
         h5xqgOk4DFZpUKN8luQ+f410NT2olawwGEwvO2H/nQ/6Sum9SP1VTQgacHzzGuBIGotG
         6YNkMeiGHTbo3gOvBq2ByNcJpY1IRQcjKJdsRgHd8gr+VtxTWXTuQkX6fyOdH0yd2VT3
         CgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aLIY0sHzn1LGoM/kEpt/BBd/i3zHSXUq7A3QOsaBxA0=;
        b=PIIIsPAm1AkY96raxAEdvUlp4vScytKJ+2fMGyA83Pu6lBBXkXiPXgRCNd7Al9BRlu
         qyQs5T9gDW1v2YcW8BX3oJYk7DxYMzT0XgvIBghfibYjonCBWWzFvPlgHzKJ/kxZeVTq
         Ue7KbpVTGkfXTqY/7cGR9GOgTFBcicoITBTzq3Zyax3kMxwbBK5i9/NuVTg2nV0cd/K5
         x0R9JRIbS8GNZI0s3BDmiUbQuYGPPBtOIY7FM/6DEOVzCKHrOa0xTgvQ3EvwVKWuji7+
         k0Whp3A8mKViQEJGa0egOcdgWWiMgMw+BVNX2tGRuyhD/TkxyUHgvy/PrNRE/PsgsUcp
         Rv8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530W3Z0KdQiID+nSaV4GLGP5ewTiOLGj5h7GBr25h55pWyTt9VCT
	2eCU3K9QC3HQTtMuM6COas0=
X-Google-Smtp-Source: ABdhPJzywKvapKkEY3P+Rvvf52kWmg1LG6f/d3i0wvhZup4sWIbJlIG5hnNGvbjxY/YxJuTIlqyw6w==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr114092wrn.139.1591199520448;
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db45:: with SMTP id f5ls3428747wrj.0.gmail; Wed, 03 Jun
 2020 08:51:59 -0700 (PDT)
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr112981wrw.49.1591199519712;
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199519; cv=none;
        d=google.com; s=arc-20160816;
        b=FYI1ic6LXTXM2mEs5Qi1cyaorHB4Y7HD1ghc6QFGy8ICCt2MSc/t9cD7gLzFBYuMg8
         IQymgyPFXqRXbJ3EcRZ1bA1SjpX+E+sq/HDRTu903beKyo3eXl4eE76QS4pf1cHB/IUj
         jn1JEACo67KCGSQLIoVLVreNIoRMrdS1iq21PCOGgTr2mfR1ZvtQRJDSIeZXoowp3GQg
         H8LuUeExfk5FS/EVTIHVnkQMrwjcvu01kCPU78BN/WSGGk2AxsxFS7Y/vbEmP7hOtqCI
         xUhh0l7rnGk7hSfB5CQ6+Dhvzyt8deUll4w+qBMWlI/Mj4X9IkelmABkj287lNXxoDP2
         npsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=dogG+4rIy2rprSG4oT8JoHsbmIXIsuPE55+tq+I9/uY=;
        b=QBpU7xvD8JQMflcqphI5Xml3wROM8XuW5x4V5gdq6V5oeObpgteYxDKijE0ervfni9
         VEqs8y3+EL0Ma7mfe4D5CEPVj0nh3ji2CMH77kcW2Uy0y6pEr/HMpR4dHvy4mNybE0Go
         /7DXYy1qpWkRJg4AcjhBwYtAzTA4OLU2Wjb59glxtB8DjWZfMn7hx6XASPnpsY3pf21Z
         vLQoO0qb1VFIM1/ruNQ1Ad8+7fc9CrHRxbfMbB4+ad9PPfZLEQ7qGFJQ/qsn3LQh3euM
         9XhEw3GfN3Ua1JUusIHYzYmweg1+9w1U6nCuStWJdxErBVieQJJRjdAC4KqlgX086QJN
         jFPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w126si213004wma.4.2020.06.03.08.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 053FpxIK023729
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:59 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FpwjV008838
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:59 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/4] Update to kas 2.1.1
Date: Wed,  3 Jun 2020 17:51:58 +0200
Message-Id: <956acd1dba9e80953b16b7d0037d5c488834aebd.1591199517.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591199517.git.jan.kiszka@siemens.com>
References: <cover.1591199517.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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
 .gitlab-ci.yml  | 2 +-
 build-images.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b91f2dd..7fed103 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: kasproject/kas-isar:2.0
+image: kasproject/kas-isar:2.1.1
 
 variables:
   GIT_STRATEGY: clone
diff --git a/build-images.sh b/build-images.sh
index 21bd36a..f19b324 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -100,7 +100,7 @@ if [ -z ${KAS_DOCKER} ]; then
 	KAS_DOCKER=./kas-docker
 	if [ ! -e ${KAS_DOCKER} ]; then
 		wget -q --show-progress -O ${KAS_DOCKER} \
-		     https://raw.githubusercontent.com/siemens/kas/2.0/kas-docker
+		     https://raw.githubusercontent.com/siemens/kas/2.1.1/kas-docker
 		chmod a+x ${KAS_DOCKER}
 	fi
 fi
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/956acd1dba9e80953b16b7d0037d5c488834aebd.1591199517.git.jan.kiszka%40siemens.com.
