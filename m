Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAVAT2CQMGQEDIRF3WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07738C53E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:48:34 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id x3-20020a50ba830000b029038caed0dd2esf11178651ede.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:48:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621594114; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qw3T/WNJj3DTCvHh8EUBSomD9ZP+RPEbqfgkz51OVDdnQUsZg6qMvNugRYzn5EkzD2
         CXj1X+D/rc1h5lCxzCXzfOEkvrx7NV4GjcFeH3xMbooLjaqsjWfnjdwFkI68vLOfOIXt
         dcyIwQowqZjE6MDDMYG5dhYuGiCOJ+2JBmkfnYEqGQt6NJNVPfoDZ5b1ZDuNzVKdtgXd
         aP8uWo+FCvtDXgLgKtErV+Mxfyqb9lxjBbuJupMM8X4UswyfCj1YlaiY8ir4ai14jNxl
         o4sXqMfCJrxBUN9m/IZoW4CzzwRJbHwnbHKaSbU1j31fXNeXg6MT4nSAOtkmO/Esy1X/
         Cotg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=vqcL1E4IQXxCWeK18TO+n+mIJacf87dViSKTMo4mOHw=;
        b=R+NijDQgWEdyaKdqCNFtWhy8lQAd1vWLy5/2IuAXrE/EfVm3IUW7Zb6S2VLTx7SFi2
         TI/yhMExRt1yAz7QljrxklFoSYWvSTd0qKG89a6S9ORGPH97pWesFRHt7jGfpR7CAX/o
         KCgTGF9IhYbCNY0PBPtATpjh3yqNfFQJ6bu8+fO8JADWf4ghlNk8R6Q3J7ycSOfuZAFK
         C3ZLfIpiTiYoO9s0mZQGcsDZw/pU4V52YJjx9s03p5BOvpbrUfZuN/DfBG+C+I64UpJ0
         3YczFZHZmC/HE5LTEhlI0UJ6ZCLz3HV8PS8GM7OeYGT5PrLpK4VATuDRKQpEoIPMcamo
         n9EA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vqcL1E4IQXxCWeK18TO+n+mIJacf87dViSKTMo4mOHw=;
        b=FRs2aLwDeZZFzL0CLtGzQFQCC5vadXRVssnOlLsvN+BfSjJePRwSDnB7Vw7C+hvML5
         3O8uc/Ayt8kfSLaLIARlZHmK+2AwqC99+TaYphcwxtU1S3LnYorMZsxDc448E24g09EH
         1/GI7c87rnUMmsgL6e1bzfw8M7+TZsGrzzD2607cerO1OYmYVA1veX763BBnYBEVY9wU
         C79D64ek05kf8Lpg12TLPQCfVWYLpbs5qDw+L50hRBnGNFtJ744TPjQhYYbgu2mPpnBC
         PY3JMSTb1UtCBZXlNDcEu2MHyqahfNW0pjS3nkvZIFKKNC9MNnEOdoJPiDdquGWY43xW
         imVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vqcL1E4IQXxCWeK18TO+n+mIJacf87dViSKTMo4mOHw=;
        b=pOvP8ZxscHs691AI1gRZsyeqQkPK4OwEIn+iM0D+83bAUFan81TrJbPgq671FI5I5v
         3H4gDyG7hG4i5mSiUJ9Cx9UT4XmLtju/6WrEif9FXBBtC+XczpJicRfWYTcURpSWLIuh
         oBBbr5e4x7bRWJQ7xA/x9tj7Io2kH9vgbhHSZBIl805MTcXkIV/Vq/U9nawp3RXpXin0
         lo9Ih1PJoyTA6uFlfmfISVfL99Hu2aW3nz3d0ALn6WWqD1Pu71IKn8JppQx++vWTavUp
         MTO9nIXTtGkBJd8Lta5K1mo5BStmmACrXBHNjynr22z7SRHg3rigt/POKnvx6m3GHZrD
         awcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531u+aRYkIna1eaqXxzxxjPnfrl/99Fguqm4vdZhd0uX6AIMuf30
	GOiaPy7N8zZAVduc0ySMcqs=
X-Google-Smtp-Source: ABdhPJzay9jNfbAJdlH6i5uOn/UW0edXRUNFsj9ND5msu3Pqeue9DqpKd320c3s3YVELtysf1nNreQ==
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr10367579edy.314.1621594114354;
        Fri, 21 May 2021 03:48:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1293:: with SMTP id k19ls60030ejb.9.gmail; Fri, 21
 May 2021 03:48:33 -0700 (PDT)
X-Received: by 2002:a17:906:3544:: with SMTP id s4mr9791395eja.73.1621594113390;
        Fri, 21 May 2021 03:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621594113; cv=none;
        d=google.com; s=arc-20160816;
        b=mHomf9gdnPdY3mH9HJc2uJnJwaVcngoGdFD1r5E0uzHqnt7eGF/7mjePFEJILb+B+V
         68rIyOhChAWthPl0clYiQqEFMEYSGGcz+KMn5OxNg4AmXKA6IZnjgdyzpl7O8qsTwe3A
         AFj4TEe3oBJWHY95CL6wNnNdl7fDjyT3mRCE0kerEr11udzPFVU1YDpmIfQ3ZEBYCTS2
         PufOf0QGxtNBalfNpquE7rNuEWF5Yb7EYLyBUa0O4+4M9dz1clnxxF6CkyA4kmvEn6wt
         TXaOhpzNDX6F82csg4bLqsc9Q7+3DpnKO2SiMaW2zx1y51UzqM8zkeKKxdLDRW8zBKgW
         BqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=H0glV7ErgutAv4c1iJa5vMoafRV7bYwMO2GShqjkTxE=;
        b=dUpKf5nEWotnC0H49GcTZ2Rdg2RPmfmEHE+gr6w9uznlBmNIQP9FWSU8FA8VSUuqpJ
         pcVd+gZh5JCZbBGlxJtChNvAehX6gmv0XYM03IllldKhHqxCHnSDMgu5Lu6eUplQAVax
         7DpDOfIJQ6J/9cGvMKT472SeIb0MV3NZtKnWyfyNmJRpaK0MpWagG3n3ZbhE36bt5AzJ
         YwdBASlVQ6aC63UCmCZBblSj8hmQyhX18LX2gvpP8f9/yL8MG5jbMNdue8u0jQHbUC1M
         nBBExu2ZWRCKPZWxG7j/qhFIcrlKLH36X0ByH7Y26dkgFFeycQQP9aFNT+TRZr4u1MNS
         XoZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n3si282746edy.0.2021.05.21.03.48.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAmXBm013268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:48:33 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcP032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:40 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 20/22] rpi-firmware-brcm80211: Update to latest revision 1:20190114-1+rpt10
Date: Fri, 21 May 2021 12:37:32 +0200
Message-Id: <b16974dc0e91100a6b74d45636396e3e5473e374.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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
 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
index 31fd19b..602d8d7 100644
--- a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
+++ b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
@@ -12,8 +12,8 @@
 inherit dpkg-raw
 
 SRC_URI = "https://github.com/RPi-Distro/firmware-nonfree/archive/${SRCREV}.tar.gz;downloadfilename=firmware-${SRCREV}.tar.gz"
-SRCREV = "00daf85ffa373ecce7836df7543c6ebe4cf43639"
-SRC_URI[sha256sum] = "26e6e4aace9c9d1e9b9b1447f57ebd743dc15f3a337deac9e77d964885fcb3b3"
+SRCREV = "b66ab26cebff689d0d3257f56912b9bb03c20567"
+SRC_URI[sha256sum] = "033a21d19fbdc7617b8c5b58d4be5951e29be5be787a45875b615f4d4dcf3f5b"
 
 do_install() {
     cd ${WORKDIR}/firmware-nonfree-${SRCREV}/brcm
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b16974dc0e91100a6b74d45636396e3e5473e374.1621593454.git.jan.kiszka%40siemens.com.
