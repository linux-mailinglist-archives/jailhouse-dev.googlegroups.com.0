Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGNGSSEQMGQE7E6CSBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FB3F61D5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 17:41:14 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id p3-20020a0565121383b0290384997a48fcsf6268160lfa.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 08:41:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629819674; cv=pass;
        d=google.com; s=arc-20160816;
        b=iWuhLM0ZetrZBKJtld0RVAJgMximPjKEDfXbCmk9rhDYA7KWERdMS9cIQwois/wa8/
         wQbl/UVsbyocqMZcs3QXGjA/RTeswTGwnMkRO8IoTHENHNeSaAjU5c+m0Y1d4BsDPOAS
         FIDTYzqsptA9FyQ2o5u/x3Y7mFBW+D4Vg1ey19KuRB4CRnzfZGB4S9p3Wtypi+G5IGuU
         0Xp3wywpsVZn4Iny4KZw1tJcktrDkho3D/ZwU7UVG+wFm0WgUDf4SZEPp/IfLYdez4z1
         Cbmk4BctFVvUhxps5EyLVob3/tztdJFtNmf5FIbf5u9l+pxjR6Eye7ScB0x36rbRHZjz
         tMwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=Tx8FYQ5l8hE9MgEFg2T/8zmhGt+hcqFthFD85glkYiQ=;
        b=vieYhuFbBObWLHwRGk7O0X2NyjANmjrNDHRFWW9HJxeP+3+/gTyluxcRnvNAigc0mq
         AAGC8NcCqq24mkL0NYVHGRHq2a7+O08oUx+0k69ZzYEwiNdX9bunqhTvoxmoLeBjrrKA
         ytsHQsd7uTf8MQi9ppbCz+H1IxxD+AaTKMmr+12xiHqMvLI7CXPwsvGMSW8zfJiB51pC
         h5Gqwqgmvp3+keXqM8lXC9/xPaBnIelT/is2e0AMO9neLyQZ0eHbi86YcDwZe6yOPCFe
         DN2XvtXGuQbCRDYY+p+A10Uy11v9b0UdFavGLFD21nxTfJ6rpbEs03olxn2Yiii2Hq7E
         7DUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tx8FYQ5l8hE9MgEFg2T/8zmhGt+hcqFthFD85glkYiQ=;
        b=tBSph4RKcrVtD7KjcvZ6N0myUaFFUcWq1t+f4M9fRytqgtnuCk9T3KC6WecpaMhArT
         dr5Gux9AAapGfJ7HmK3Eoc+bTjlOjtrPsaI6WHsSNnor0j1035ydTuSj2kjo5H3nrYSI
         FyVLE3//e5w+wSi+sE1GwcSHk1e0ZKu0/e3D4039myLrsIOO0pjKcmc/m9OpHmRkCmGB
         hfG4lBkt0KZKi+MMuYsOE7byeflT4xlxHJDn54NjOfQkwUMPre/y+ecVP4C7g3ClaVFb
         ChqZUuGv+CAR6456t66VYz+dycoN+HsyU+8ZKzzSHeaoGl5zt7NxtWi+R7A9JZ98O6fL
         7yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tx8FYQ5l8hE9MgEFg2T/8zmhGt+hcqFthFD85glkYiQ=;
        b=f51GwOj8BBHaUyTaV4JGjrqkMEU7lqKjh873Lid1oaP6i/qFJlEJK+mUv1d39O2l9W
         H1FodcmFsXeQLB/QnIwirr8zBNjSuPTbtKIZyagcDVouqCXNfpQdl1u+fGIpwU7UXG9a
         uLR0xIIIVkxmSCR46ZAcrXeCK8Sy0vRAIjFRXejc5ULft6cmzegz8jhxjWFDJkqzUDlH
         /88d/A+Y96zpOJr+noHrYKMXgCoEtbYW9jxICS6ECFsXfxh37GXpwNdMVGVXfqtfLR5g
         5ibHx5HEOkdh1wzAqIfEqyrJQhB4hznTZRxD0nQXQIIIvAOh5mjT31/jApwWAYMXcbIv
         P5/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532yJeBDLH6386yRW5CIAPqv9BLyUo/t6/q6R69OW51ltIG1d+dR
	SBMsRmaelSCcd4RMMkuPdCA=
X-Google-Smtp-Source: ABdhPJw+1gfBTPvTxLbRY4R9Co1QpSSpCO2+gJ8siuKEb8VT0yW9lVg2pmzCA2OE/Iw8qPbWD7cEGQ==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr30248605lje.104.1629819673992;
        Tue, 24 Aug 2021 08:41:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9109:: with SMTP id m9ls3537521ljg.2.gmail; Tue, 24 Aug
 2021 08:41:12 -0700 (PDT)
X-Received: by 2002:a2e:b558:: with SMTP id a24mr32133913ljn.225.1629819672600;
        Tue, 24 Aug 2021 08:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629819672; cv=none;
        d=google.com; s=arc-20160816;
        b=X/i2amZl6ZG9pZc/9KWJ1ptuz0oliXTQyam86CDyRMWryPJ5lz7hNTsGfjnpXvqhRl
         oYrqUnPmMFIwb7pgUcB1RGXtq6g01Rx/2qwJ5s9W+GLitIftB34Hp9Nuu9EucT4d95Jx
         1GWTEtmi0oeNC8kNGN6X9EWvyCtXjCJBbgO10Jnzyc4m9Omw5ua2NMbau0xe0GdVru47
         CDyGirKtPQfVIpV0v7KpSfp++hAANiJsy63aBInsVn/RK+HSrLd5mKQVdkNZeU7h7iRk
         Lf/ksgw+5FDtMGEi/EuTfXijKllv/x+hfxygybrRdGspV+i3+nLZdHk+4SaUvzYmuv3t
         /AEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=7XQaXGS0nlaUhnEw1dvacJ0X4Lt7Cb24GcMvs1b0Fkg=;
        b=r6YfRYr+F+tz8GBQTnkNi4now2X5j4HITCdV8tHXt8bHD5cev9NvOTsvuRlTV6eYns
         DhZ06zWwjEqNr7vzH8qmWBIrkdT19goG2w6ezG/VPicz+ebtsV+1W95XNnafLfNIkgHk
         cCPRfa1RWiRc4wOYv/tIj8qFSNJan1xIly72APeqdyWX7UXfxylpfsBudpJc/4MzF1zW
         sGfaLtM/tw/59vGAXVjYgOt/G4rzr4bqpEPZElbO8eOo7GPYRKgbjnkSgtvPg9a46hYN
         cMpfVhj7WG3bWkj5YgIan3f6jOd7oxiOBAdVRohGqHH3K+gUJQ/Udh/2j/IXVcBStZY1
         4GUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z4si338677lfr.2.2021.08.24.08.41.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OFfBmk028501
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OFfB7h015711
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/2] Switch CI to GitHub Actions
Date: Tue, 24 Aug 2021 17:41:09 +0200
Message-Id: <cover.1629819671.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.31.1
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

See patches for details.

Jan

Jan Kiszka (2):
  ci: Migrate to github actions
  ci: Update kernel image to 5.10

 .github/workflows/main.yaml  |   81 +
 .travis.yml                  |   60 -
 CONTRIBUTING.md              |    4 +-
 README.md                    |    6 +-
 ci/README.md                 |   10 +-
 ci/build-all-configs.sh      |    5 -
 ci/coverity-scan-build.sh    |   36 -
 ci/gen-kernel-build.sh       |  155 +-
 ci/kernel-config-amd-seattle | 3221 +--------------------------
 ci/kernel-config-banana-pi   | 2837 +----------------------
 ci/kernel-config-x86         | 4075 +---------------------------------
 11 files changed, 318 insertions(+), 10172 deletions(-)
 create mode 100644 .github/workflows/main.yaml
 delete mode 100644 .travis.yml
 delete mode 100644 ci/coverity-scan-build.sh

-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1629819671.git.jan.kiszka%40siemens.com.
