Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWM2W35AKGQEJ3FEXTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5425848B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:52:58 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id z77sf2766697lfc.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:52:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917978; cv=pass;
        d=google.com; s=arc-20160816;
        b=QFTgxIJPZ+Wx74ykPYxxDZLIMzsSCuqFt5VG0W152lem63rmMDJq+41uFAV5iGZkUf
         Ryi7CNFcvv8d9/iLgqy2w/elkKDOzj2Ifq24da7Ph9LAU97cNtiwS9a5Fx9Q/1SkLF8f
         rKqg6BrR7CqAmdakCCSBgGkZkyItjj9PQ+p9vCoIQpD5XvvuTBzW/2TzPoF0UosdMJZp
         EpzUBIaPww0qH1p80yzNsSCnQsbtzPWl9PZBkzkrTpwVnbN/m/ETq9nocAen2UEC+uiP
         mnDOleztCshb+Wsnvh+vRIdb48i7ncXkGc3NdSJdNnt7ii3IaO/Orcy7AA0YrpVvGbr5
         ufOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=8YD3RQv0PYcdgpJ12DUMMt1JTU+LE0sdSHMu0g/AsYY=;
        b=jobgPnZAebTcqDbk7xu+UNe9gdUEXU1zVuTf1Ith67qcadHoNvpMRu+DPrW+CdQ7dU
         5IU0UV7Nl4kGrSSK3DVPzhxW4HeUc+Huq633soWon2j1e+7cz7DzL7wogM+l+r5EdRBI
         T/3p4m250EZZg5Ikv7kHq9WW7Hb7q/D9QkPreG/2ujTlhbXf28BZTIucJ4NPGIkWuMfA
         q/aRhpSWKoCm7CqDNGZ1UhImWpwgyUZtLtHnacmJ3GdWcXU33aRh9pKhPXv2avV0CZxN
         Bwt0UdBPGaVY1N/2rb9maizW6qt1/T+wDSqHbBy7lHQAd/e1i3V9M24SEvLVSpO0OUaE
         KSXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8YD3RQv0PYcdgpJ12DUMMt1JTU+LE0sdSHMu0g/AsYY=;
        b=czvRX2T9TbfRjC+iJtJs1n8ek3vbda4qBnwZXomzcrAs42w+T2jE1hGiXDm3kAp5Jk
         qUTChoqXhIw8pscxuwYfnBQ6ls+rCRpYfB4H3d1qLDM7pJPYQ706AT7zmx9FrWU6QMXP
         UdxvtcUF1DpHJUkby4njj4GGOxZYFdP4OBfQgg2grSUSGCsAejXmJ8Df5HcgfaQ1UqH4
         FRJVhJZsI/vjYoMgY97WHw5TnuWpMKXCC9OPmpc37/aDMq+G3FPq1X6OrifAYEYbk4IX
         ODEpgbA2YBzBWuDB7MaXyL7PpD9ulHlRPQBIp8oO2OiVsEmnj+YPIwfIGrOBRX+I/Aq9
         BcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8YD3RQv0PYcdgpJ12DUMMt1JTU+LE0sdSHMu0g/AsYY=;
        b=i1upwf1eETFVNkJrfuTDhAorVFk+WTBfobDMkcQCn1djMBpLt0M+VRQ0KSoGVoY5oO
         vbHoY2io5jtjx7l6sNv3nGnjXtRIplYmZulf+sFS/T7LrBr4HV74gAu0mvP1j0MLDoH4
         d5ATM0AtSUPoJPgop1fYvAYD3FZo5LNAVIdSP+kbhN5FkL/gTYkwZQcRYWj4/EYV0+CZ
         WTOen18jSxb1bGB2VuwdSVTgpo5Xhu4BL8OinLIRypT6vDicud83dc6hDkSD/7IYVylF
         YfOcEkONBIpSA6lUdJCRKpgIHcx0O+EetJr+9RT6i6S5gNgO0pEdKm7WhFCZTgiaTCNs
         r8tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WZmpvfrfB4qXCjUarD8qcdLjcmNLOhiCgcBhd5g4sV0+17yuT
	Xn/b5hCh+2nREZoHFUybjAM=
X-Google-Smtp-Source: ABdhPJzk70lFiTKC6A+/SAQ3yBTn+Ut9DzTr/eGi9WxbQlSBmoWdiwdDykEXfMfyrl4SVT21T1BBDA==
X-Received: by 2002:a05:651c:217:: with SMTP id y23mr1603532ljn.123.1598917977882;
        Mon, 31 Aug 2020 16:52:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls154357ljh.11.gmail; Mon, 31 Aug
 2020 16:52:56 -0700 (PDT)
X-Received: by 2002:a05:651c:1307:: with SMTP id u7mr1797342lja.267.1598917976892;
        Mon, 31 Aug 2020 16:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917976; cv=none;
        d=google.com; s=arc-20160816;
        b=p9s8WKjBCpeK1VvgZYE3VWopZmh+Rvi3ptVbBcHHwd0XI/eXC5v8neqOqIAsywldDV
         ar0+yNz9yYLCek7/Z48D6Ho6ObERa10O1I4eo2W87IuomWkT48O5PpRW/VmUwe4p9cxU
         kyQ6K1zYkoUURQe/JE0tqarphMuRhSyEbfK0Vn90Hp1lHwWMNyUDbIIm3bpJ+m63DQhU
         mRTUWEyK+MzninL7iG3ulln3hO2dZu4fTMSRfvZ0iN5Xmc1HFJ3VUnZOdCUFC7OcmSRJ
         EBU8mXMVKjL5S1LY8BjBChLo2dMxFpFjwY5zZehenxZFfKOqrJdjkdigVme6loip071f
         1lgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=g/fvIId+JXbDbvAfYjjLO/EFiLIv0If1YAG0HtaMhKE=;
        b=g601YlxiAogFYhetO4eKml7zUuSNjc1juFzYKd7C2Gzf3h9H5qTACDfiboHAfiwhqq
         V4T3gZ8Wsk7Pzxj0v/Tk8/+V47S+KCzn36IzcsE2EgYQNCMvVOcTeumEVYrAi6cn1rCo
         4anS/6ZTYdNKuoe+OqpsEW0GUZ8Gh0PXx54q+2ZzJoBIKroUrBMVZxAd8UvqW22bGe5e
         0SxXnWNFaeXnVgYsEwnEsGpQRRc4LUrrmoVzRurt9lCindOjtxhwVD7YB8XUpAAVqVet
         7FbfZpbXcHjLXb0eIPxYwcTNUPMBdFuvMBAgG3U/PGK9GAgU+Rm5R5+EVV/fuv0hdliA
         emTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t23si185507lfb.3.2020.08.31.16.52.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VNquFO022601
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:56 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorJ007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:55 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 3/7] Update to kas 2.2
Date: Tue,  1 Sep 2020 01:52:46 +0200
Message-Id: <740a09a1d33df34f27ce09267d20afb4f96f3ebb.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598917969.git.jan.kiszka@siemens.com>
References: <cover.1598917969.git.jan.kiszka@siemens.com>
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
 .gitlab-ci.yml  | 2 +-
 build-images.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7fed103..0c03ee1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: kasproject/kas-isar:2.1.1
+image: kasproject/kas-isar:2.2
 
 variables:
   GIT_STRATEGY: clone
diff --git a/build-images.sh b/build-images.sh
index f19b324..45f7079 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -100,7 +100,7 @@ if [ -z ${KAS_DOCKER} ]; then
 	KAS_DOCKER=./kas-docker
 	if [ ! -e ${KAS_DOCKER} ]; then
 		wget -q --show-progress -O ${KAS_DOCKER} \
-		     https://raw.githubusercontent.com/siemens/kas/2.1.1/kas-docker
+		     https://raw.githubusercontent.com/siemens/kas/2.2/kas-docker
 		chmod a+x ${KAS_DOCKER}
 	fi
 fi
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/740a09a1d33df34f27ce09267d20afb4f96f3ebb.1598917969.git.jan.kiszka%40siemens.com.
