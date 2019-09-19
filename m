Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBEEZR3WAKGQE4GZ7BMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3e.google.com (mail-yw1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 91826B7BC2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 16:11:29 +0200 (CEST)
Received: by mail-yw1-xc3e.google.com with SMTP id p185sf2804749ywb.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Sep 2019 07:11:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568902288; cv=pass;
        d=google.com; s=arc-20160816;
        b=n8EmrMgdOObjfRQL/va1GzYgCFe7wvcj5/f/it5En2jV1PqzzZ4BUUdAXarnJSyT3d
         97OWEw2zDnX2PdIbj7Eb9GA+jNJK4XsbIY2oVcGl8ZslB6kspQ37HVea64w+HweEMZjh
         T2bWQMRAcSN4/u7KwWpfjg7bQEMHT+mxHGJJqdytlrGBLrGsM2iSXqIhs0eMWMvZFrbM
         VxvOTR5mK2xia5RSccEQwJHwq7+EtyAENyXShzLnvBtInzPQw2JuOIW2WjN4IikDz809
         A+Zxx4L5/QybHGvsoPbbma8iWECGyqmMqNe9hpvVSaRF8yTEvsMS/eBoFCfHxvl0Tb/K
         wgbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=OPjZLgdR8JbVsq1hYy4ctLDhU84OvlkpWMi5eQX0k2M=;
        b=H+dPAmrko6nNnjiOterCNxZBfJ/HaCrCj0qiR0rOALjXqL8wMfxXDF5vh4HarizeIT
         YRjyCjvCKursXEC6zGZCbEd3cEWqNloCAmxkxTqiFPhoxHlLhHA7AEI/4rXtCCA/sNLs
         8irdjumTKW3gA8AiaWfCJymY9SWRkRmI0EaxUBk7UZ//rqD/wDERY4gqOt8xtjACNBSw
         ZDkqvhfGXhU4QeqWsRBkdHqZU7Y4dpnNgqLOLSVxWEbEVR2K52o6rkAN1b483D0oeZFi
         l6+3RWjLc5pX1+ajvbT2oGIfcVP8ZkRAD4nk4l1IadcS/iF95jrijaPeLuQIlP7iZVIp
         6n3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OPjZLgdR8JbVsq1hYy4ctLDhU84OvlkpWMi5eQX0k2M=;
        b=DrBtmU64UlaADTbYswevdidV+BG+Z57Id/a6UR8z0VIWzzaS8jtKnCWryyJs0IxcJb
         bqDNNTdzZcU8xnF4PoQ5jpIfAnLH7+E2KVzMVukEfpWE+jPectgAgY3dEAscmI1S2G2I
         xm5of0vzfGqoAwZMTFl3WlWA4Z+Sx88Mckkn5lNLMP24NqHAHWthqktkKAhtd3pragM2
         3nRE3qRn1cn5KxkunnxrTQPOA4CoUtq3p8esAI9WMimQ1fya1YdbDqh80m1p2zR96xvp
         fUDe8tEOrFl0a3YvnWwb5LyToKeUOGLAQptc2DlibbBJGY2hEHyW0zvsHlIbjQkV1FFO
         pFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OPjZLgdR8JbVsq1hYy4ctLDhU84OvlkpWMi5eQX0k2M=;
        b=Mvj9dTFM5k2F9dhisUpzb3SxwZ/hP4VpgOdMo9qQCVX5hfq8jJNItSZ6N9z7uZvOnZ
         rCQ4rFtNNcowzmAtFGrAsNQsIooqRb+QmGIjQtqxLwz7pLO+5A8hevstTbgOIYV2nwhn
         C4sAvuc8vyxt5K0dlcRhlnmUaeH84QFKLQ4ncnaFP/gzVWd1oq3KrQQUMklwakTiP3V2
         CUxAv8NSnsACeERLBkYyl5dxfn3Sn8pZ5nvcIvYP1VtPuffwZCPLpKkzBsCxfMau4mwI
         mu2n7gca/zv50zvifl3Dd6IMGpl9ajyG4oR22xSaTt2tSeHOF+TVL5FJbE8zqUwLjdBQ
         SAUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbK/mxvg8ZFpGMZn3gTJllfeUPlr4BkFJmfLEoSvTjgAOUYxAK
	0Eq+K6KPT1R0a78dN6IA5Mg=
X-Google-Smtp-Source: APXvYqy+DqN7wladd7kc7m3g0XFePXyvXNaMA6+xmFFzMzS6nS0H5wuaMMIoeQFTcPM+Ty3VffC8yg==
X-Received: by 2002:a81:4c95:: with SMTP id z143mr8134474ywa.417.1568902288329;
        Thu, 19 Sep 2019 07:11:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:2494:: with SMTP id k142ls625480ywk.6.gmail; Thu, 19 Sep
 2019 07:11:27 -0700 (PDT)
X-Received: by 2002:a0d:d7d1:: with SMTP id z200mr6591189ywd.464.1568902287883;
        Thu, 19 Sep 2019 07:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568902287; cv=none;
        d=google.com; s=arc-20160816;
        b=mpk57SQzOc8JHopbowWiRHDdhJCgwfVWzQeqPN/cIGOq4WAp+XqVagesiDTh92+Hyr
         66dEc6rN4BYiJP/9PH6yLfzfRcrDS0lGMFskZz/DPDBkW+LtPAGt4JguY5lIheibWZu6
         DbFitKd5RmsmSce1of3Ttj53mOEhvmihuWFIYO4pLzIGyyaox1T535+kJivmHXT2zMHZ
         Y2ACwFEaguLAl5+iInSpHNLoVHzZUeMAjM6AdkzdfJjgK5hxca0rpfMtRdJJpeaSSls7
         TKfxKQFO8QEHtukRTuAlA7AUDsmI6jWUfH4+H+Q7GpWcyM+W26tKEs4WbyBhs1Zc92gZ
         Sm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date;
        bh=2v2VqBp0XzxxQ+RZBc5jNddjI+/YZcw3cVYP1SlMvWY=;
        b=l4iAd5yAn1nBY7EeTWIc+LkE6knU3143z5lR4k1squCOxGrsdNYEENq26QgaNQgBya
         Mi16dC0K2jSYbQH7H78WmJN5523Nh5s4+sI49JJLwczDaTpzOHPFHTo3hckVAFcIrCLB
         eQcooP8OMHKfkjOcbB/p0FmlT4E6jkp6MSSLh/cW8Po96fGoNnvp8VDhe9LVw3NXvqnd
         v4oTSVTwkC4o8bAzAF9e2Xac21cSfAWctujxcUq8ka++kr6zJ/9fEao7px3WUGXBUwBl
         wUtCCDBCZD/1LcXPbKKYbMp6WUNBXQ9hQGUXLl2AkLtUgCQUyOtWsBUAxXS6az54I5eP
         oyuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id x188si754620ywg.0.2019.09.19.07.11.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 07:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-6349a71.ac4-iad.github.net (github-lowworker-6349a71.ac4-iad.github.net [10.52.18.20])
	by smtp.github.com (Postfix) with ESMTP id B496B660990
	for <jailhouse-dev@googlegroups.com>; Thu, 19 Sep 2019 07:11:27 -0700 (PDT)
Date: Thu, 19 Sep 2019 07:11:27 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/955a94-de7a25@github.com>
Subject: [siemens/jailhouse] de7a25: configs: Fix qemu-x86 /wrt VGA access
 window
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: de7a2584ca2c601ac505d45e3b6e1da58ba5d2e9
      https://github.com/siemens/jailhouse/commit/de7a2584ca2c601ac505d45e3b6e1da58ba5d2e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-19 (Thu, 19 Sep 2019)

  Changed paths:
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Fix qemu-x86 /wrt VGA access window

Copy&paste mistake, other target were correctly set to a size of 0x30.

Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a permission bitmap")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/955a94-de7a25%40github.com.
