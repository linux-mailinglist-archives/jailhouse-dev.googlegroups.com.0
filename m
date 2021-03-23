Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFXD46BAMGQEONGWKZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE9346011
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:48:07 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id t79sf463797lff.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:48:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507286; cv=pass;
        d=google.com; s=arc-20160816;
        b=VdYnu+TAPcf+eAkz8w61RiL7lpeJ3CnHRxOqZwl2OjRKb8BLbQ97dw1GbKulzzUBpR
         LmzIQEp0boZm4LzaD5oFfe3ejetZR6V3zyup8KvdljPa/sbfQuVvlxP1KLYgVg/bklbZ
         dObhPbouuHY+GtBIgOPsZnA/EY9pv4nfML1zZdleTMkENPsTNd0IlpJ3dVHCKHpzaVQl
         xAlDfWlwlz6ADF0J2gnUBy6/KCypKIphmSRU0ROcaCDJgjK/v+54ItUnRZEuBoJ/Be8a
         nSewZAmLwEtZMzGrtZafThSeLxchPDcLYgB8PwjV8vcOMKCphL6swfmxrGeXyT989B5j
         K5eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Jm8q6nAA1f1Gn04fokEpKKPSBg3yVSsHde7bJx1L6aw=;
        b=ov5ewJA4D2OZNkDTbbt13sXgLrdM7nP+VQTDgUZ6TpyCAF6mg3PZN68YUf4YRq36Hk
         jTg+vY6MF8Yd9nXWJNUA0wFF/vR8aljfjI5SVmefd0kVfCFCptzRcQpm9cbqlSZ5OKHg
         hY6yZPfi0H6ArE5TuWwoQzbovx9jazbyStuP5qTkjsURyh9v7UZWOseJAdfXZpsQV+kF
         lyuGFYjplEq1vaawQ5h4RGf1w2iB8KUJNApvdofmvD80Hs9PdjujLuOhr2s5Fi3B6AZV
         xyabc3HIo8xV4h+DeMgjw2exDs8zgJEuDJCF1LEBySqLXuROZEPSTrF1awBda1/t57Tt
         JW7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jm8q6nAA1f1Gn04fokEpKKPSBg3yVSsHde7bJx1L6aw=;
        b=fXSAfC/VNnoNXyUv8HztRH3ddWdZHwoJyBhLt4p9r7EGlrO7+6fo5vmclZhSD72KBx
         S90TgrRRw7OkUaxVh0UMrXaUBww39mCGi6ZiycKidnkc+SOHykBLq3i8gVivOJF32xSn
         v4pe2UWkoA7eolc5isOXvtvzXanwB2zTjg85TwXBt8Pu6gMU1YrTMx6uyVnxm33Z7cAb
         +mFOaiuN+50hpGjdQWgDY1gVAkLAbIvfRnng20wS26nmHrkfc4son5zBr5kbJBA0A+Dw
         CuI0HSZoC3UMclhr4+fnfuf5aSNpQFby2cXVBnNGHeuG3jucmzoiOj4zoj+vMdMHKojf
         qpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Jm8q6nAA1f1Gn04fokEpKKPSBg3yVSsHde7bJx1L6aw=;
        b=sCbuUl0MojJNWfe2ZS9jJ/UqoMjTMTX/4jsQabY0bol4KYyHH5hgRw+kgamjO/eYWR
         8ZeGaOluh0rF5l7V9e89UBXd9cgwY/NN11AGzNJz7WfZto2V+pNRNE0AgHHA+iUlabzB
         VsAKVzHCUNKFl7Ljo05Adj/75OzvfdPlupTZuPX5f1Slzq7cv1Hc3kYdJDCY8ZHWejlK
         XeVDdYSGsoGaHYS+SJu0/QC2JvtQjQ+9ezuMETfihdsiI0Oc9A9RiTrPjlqGLlvFXeTR
         +3UzYYGQGqKKy0EYz0iTJkQjw+KvVybiZFXl++OHhaK7linQiX75ShdElN9cUE1Huwjk
         quBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hT99CH3pX/8O27xPKc92hnPr7ecOQd7dqBT4JD5CgSNbVynw2
	J3goLLcntytZmEEM+YrUT/o=
X-Google-Smtp-Source: ABdhPJybmP0qupfUE5KYhshOtSNTJw50ogxf8/+R661L/SfMN8VVEqbbCWwsh8PKgLRZAR04yFmfDA==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr3165167lji.317.1616507286849;
        Tue, 23 Mar 2021 06:48:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls3160510ljj.10.gmail; Tue, 23 Mar
 2021 06:48:05 -0700 (PDT)
X-Received: by 2002:a2e:9c50:: with SMTP id t16mr3253587ljj.102.1616507285690;
        Tue, 23 Mar 2021 06:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507285; cv=none;
        d=google.com; s=arc-20160816;
        b=wMAnuQKHhGryfoJdOIJgRfP9F3XlI4fI9xtHlLu4wqC31/MneZfwGj08pClKUup6f6
         1RXBwU64yPJsNldwwS1RD1r5cgHOP14is1sZH/v3JBtRuWoZt0Kh/hggsuEXzlyAbXD/
         7vgtTvUP3CwoO+koD43nrT/kMY5+WsHFqtAwHJIug7gUokGhSOZdgfoIMI+l8FUeIJQ3
         ce2AwUTSylD7o9QQB03jOAOjH5ntEE74Iuod9joMGZM1IizaqZWFTfhF7BFNG+wMQJtK
         v+9EyiFzINd4DlqAD0r8Fa5u0Bqz2QHg8Fp9ZNwCZvqsfG3GzcoK34JeNujGxP9Vlw0f
         uYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+QzTTRIVyKXHJ8ubN9HZwtXiOqic4tL6qEHBm+X8wLc=;
        b=wriergQnyCY0dA/b/B9s5y60GmQorPUsav+uC0ZQa5mrryDTs7a8vX628uG9CmNPs3
         RZSgzj/QlQNbqsPkvaj/a1FeTLt9ljBwHebJaTQdgQIp97TiWfjgMXwkQL28CFmSXaTn
         s0Y01EAF6ZDcihp5x6wdJgEDU2dr11fInybxBUg/LSvEJMZzr7WIUAlOFmDb9fz3wFvQ
         yRjk25Q4KJVcMcrd15jPALiBnGjRGhgTrio7pUfKSb7If7nU7kPQvAjH1UcH3u763LS1
         5rGXZ3GDya4E9R/5lDNf2CDILkpVcwHf84Ao9+iRuytFda0FS2eT9dZ9t9VEwuNwYFgn
         kt1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c17si615537ljn.7.2021.03.23.06.48.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDm4vZ018224
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mo029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 08/11] xradio: Update source and firmware
Date: Tue, 23 Mar 2021 14:47:59 +0100
Message-Id: <8293b716f3af959fac8bd822c76fb518032c40d2.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

This will be needed for switching to kernel 5.10.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/xradio/xradio.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/xradio/xradio.bb b/recipes-kernel/xradio/xradio.bb
index e3f3d06..23d9526 100644
--- a/recipes-kernel/xradio/xradio.bb
+++ b/recipes-kernel/xradio/xradio.bb
@@ -11,15 +11,15 @@
 
 require recipes-kernel/linux-module/module.inc
 
-FW_URL = "https://github.com/armbian/firmware/blob/7172b4b6608b131cbd6c60253c78a231993beed8/xr819"
+FW_URL = "https://github.com/armbian/firmware/blob/aff348fa9eef0fcc97d4f2bb7304f0862baffc20/xr819"
 
 SRC_URI += " \
     git://github.com/fifteenhex/xradio \
     ${FW_URL}/boot_xr819.bin?raw=true;downloadfilename=boot_xr819.bin;sha256sum=6583350b3eb12f70fc6d6081426717bd0019b55c6558ffe820c1548f0702bb8c \
-    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5 \
+    ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=fb81436ad7cc0876614a2a9c2a54c5a93a75315aee164e3a3afe3db80842a9e1 \
     ${FW_URL}/sdd_xr819.bin?raw=true;downloadfilename=sdd_xr819.bin;sha256sum=84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161 \
     file://debian/xradio.install"
-SRCREV = "502489a9389ac7118401dc7271c56d128376e191"
+SRCREV = "6bf0e2e21c80456e2a3d4ad1267caecde7165871"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8293b716f3af959fac8bd822c76fb518032c40d2.1616507282.git.jan.kiszka%40siemens.com.
