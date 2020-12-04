Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBINYU77AKGQEWNYASPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F442CE851
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Dec 2020 07:50:10 +0100 (CET)
Received: by mail-io1-xd3f.google.com with SMTP id l20sf4098674ioc.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Dec 2020 22:50:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607064609; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ii3DD5xzn4eSQiUk77H17tJ1IKOiC/wtMV2aTI7yQkHSoSEmvCdJ1KY8uCpUaG9Ye1
         D9TGOImaVLb2BJKssqKriDdx/MzvFAoC2gNTwgFgYniN2tR8IlSsRQdYeI/TNoStywYf
         1vLRkoto14yyHqI55r6muhmj2cA9nyhaoK9+3tk1cgyhoIK4FmNZ8POGbQUUzR4oh2dD
         sPcGifxZ+lqlVK02qKR6NsZVFSxbcDnf+mLS4IRfvkrpUQqVQwUYkImiP2dzjC4FBluP
         lBomoKTM6ifsQQI5RmMHiKFESzOn7w/do1MYQe3bvtmN/xNqLzAa2fAu7fd+LHl4jdHo
         o/ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=1YlEix576Mvc+3QkCtMXsqPBDl9NLpSd9Pjrk3OcHp4=;
        b=klwVo42jeqpPv3F3XzONRinP0ccG8eDFNkH6SAaRrKoavLhQEhVR4Qu2DxsmbTHEH6
         PIE9259FWqwZKZfQW5aXnNbB7VhNGwbWAUC90RCyysOgph14wFCk82Ga4UTrUPmm5x7y
         JOe5hRjyS4NY51JzKz5ultfyLuJl5qBqz9lB7+OnA72GM7fLqjvU3hKBrAvYNVJzf/T0
         c50IRDtRMJwuoPzJNYzqHrBMzY6DvKhtDkIxRbLv3diwlKFRlVCVvpP2otUcnOOh/zkO
         D0LV/zfrjg1wa2M8FKmjopesQResId1zLllmA+VtZkV2X1l0B0PVrFNNAG8pRH3R5jiE
         mpDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GpgKQ8Xr;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=1YlEix576Mvc+3QkCtMXsqPBDl9NLpSd9Pjrk3OcHp4=;
        b=amS/cZIpRbgY+cp5T/TUatzauLyzlU9r1zhmE8FJAnddc86XqfxCOfFTnhIn/thex6
         qGcguovQcBRonOrIafAkx9FPfFLHldTt3Kws0wVD5nDKk5+ETkWmsRcylVmLEPuVJzbp
         8T+8Yv2styE6bcnWUbB2xi72sx1EY0sYcPHtGfyJmlKS7Oij47BGwLk+ejlBfL+u85zy
         LvT78X1xBehC/C1I3+Fqg3Ju5lYHUgL6oBZ+Y9ajq8t4Ik2Ff9h9/7t/jiW0SP/KXInl
         VkRqq0g+eBkc3ua8DrrA8uIAN0eAnitXv4ZoCQdIxpv6HAx081DoAGwnDSyU40nptRQr
         Zykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1YlEix576Mvc+3QkCtMXsqPBDl9NLpSd9Pjrk3OcHp4=;
        b=GS21KScz6QZba9ygFjThPrDsA+Ooj8sqdwA6RurQz6B3DjJ2X77wsnKcFn2ehb8mqM
         1Mz8azgRMMLaU9Fn4MVCVVL8s5eASx/M5Etvx8P3HRbcRCsurz5kisgF/+/6uwR1SfvB
         BpM9bM8xMyUNJ0/ZpnaibdgTWYXkm0mczNOzydrFDw90ERSdwEDJ/YSppi7/ebVnSATs
         SA7ZnYur3dJleJLLvc1AjH1d6xV4WFXIpLLvWO5Ts6qNVI2RqpMKoCegp2D0HiGXOB9t
         wrgiFkJXALJ9Y7NIb97zQKPlD9oVCnnSfgl9jkp3ISo790DE+KLgDGxTetrSTgUW2mAs
         VO5Q==
X-Gm-Message-State: AOAM532FLX9/HkdbadBamXK0vcbJYRIF8OaaQYyN3moDOdlf5XV5OoYR
	CAdcHpFLny8BhkDARLOQBOY=
X-Google-Smtp-Source: ABdhPJxA0fpelDkZbOEooiJh4TsFbyR5u53uP0qJHgZQ7EJwMzh3eeR7eMvyZh4oTJ0tFcWc/xUmrw==
X-Received: by 2002:a05:6638:604:: with SMTP id g4mr4525531jar.22.1607064609388;
        Thu, 03 Dec 2020 22:50:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:17ca:: with SMTP id z10ls2049457ilu.2.gmail; Thu,
 03 Dec 2020 22:50:08 -0800 (PST)
X-Received: by 2002:a92:130e:: with SMTP id 14mr4246158ilt.281.1607064608845;
        Thu, 03 Dec 2020 22:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607064608; cv=none;
        d=google.com; s=arc-20160816;
        b=HBZT6hfyoLayCdzb09flGHZYtv6gYw1F3fuLAOlKXI7kQgDipQSVyF2cl95ZpAEzuj
         gjlMtZh389g84yVJmVfv/K/gO8WK3UtntP/OtBOjI6vD7m9f7gO05JDNPHgbSK86CqXv
         zzALyKh+DB0sijjtdksd9SmqiZVL8DEiTe6g0sKbqAWNnU8tZIdBulpCgRX6CfqRA12X
         q6kcUWdnSqBMuTMtpi/GTfA8bpcIgZdfZYRxmlcUF15FKgJYoUfCRts3+5+Kq5t5edJD
         tonam/qOVyijvkC7pZZn0zwAxMpmNXPijfThzvZoA/xglGB2Kr90kIQ6zupsgWvJP/nQ
         E9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=TT8dZxVfuRrpL5TUmQNr2zljoe1OrS31JUd0KsL6mpc=;
        b=d0Q9YA79iR8djEAP88gjU5JOOwfTkUbR3irlpy2PjvNUSUoutEMNyiRwDQA9xS6xwV
         /iCDLOJWTMxSf/PkrOuzDF/QqYXfc3Qk0Z3SG6ahGdJhpQHSiGlf3/BaKF5tj76NVLY3
         OfmvSmEuqL1KgJO61/DzEiHhRCaeRrCL08c1dOwgbDGScLjAh5tFan8dfptSsfdTHbMz
         96GXqLdZUG8Gjj1eB2ZjgWnLzB4r5Oya6Eta0CTnnGvQ3qHdXORd0YN9gP/lHBzLmF72
         LXsHYVr1F98oEXsFWx9TMiNq+Pvq+ykrTlveyBGmj5g/4qldOfGwf2sAV5fCuiQVAJOi
         xj5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GpgKQ8Xr;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id u4si114627ilk.5.2020.12.03.22.50.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 22:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github.com (hubbernetes-node-8f1f80c.ash1-iad.github.net [10.56.122.38])
	by smtp.github.com (Postfix) with ESMTPA id 68D3B900D3C
	for <jailhouse-dev@googlegroups.com>; Thu,  3 Dec 2020 22:50:08 -0800 (PST)
Date: Thu, 03 Dec 2020 22:50:08 -0800
From: "'Jiafei Pan' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/5498cf-af8a66@github.com>
Subject: [siemens/jailhouse] 2533ca: configs: ls1046a-rdb: add cell configure
 files
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=GpgKQ8Xr;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jiafei Pan <noreply@github.com>
Reply-To: Jiafei Pan <noreply@github.com>
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
  Commit: 2533ca36e8ca8464687d8ea062986994de0cf043
      https://github.com/siemens/jailhouse/commit/2533ca36e8ca8464687d8ea062986994de0cf043
  Author: Jiafei Pan <Jiafei.Pan@nxp.com>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    A configs/arm64/ls1046a-rdb-inmate-demo.c
    A configs/arm64/ls1046a-rdb-linux-demo.c
    A configs/arm64/ls1046a-rdb.c

  Log Message:
  -----------
  configs: ls1046a-rdb: add cell configure files

Add root cell, inmate cell, and Linux demo cell configure files
for NXP ls1046a RDB platform.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
[Jan: fix up CPU overlap between inmate-demo and linux-demo]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af8a664fbfa5972c8f11100774c98d3e55a22740
      https://github.com/siemens/jailhouse/commit/af8a664fbfa5972c8f11100774c98d3e55a22740
  Author: Jiafei Pan <Jiafei.Pan@nxp.com>
  Date:   2020-12-04 (Fri, 04 Dec 2020)

  Changed paths:
    A configs/arm64/dts/inmate-ls1046a-rdb.dts

  Log Message:
  -----------
  configs: ls1046a-rdb: Add linux inmate dts demo

Add device tree demo for running Linux as an inmate on
NXP ls1046a RDB board.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5498cf9f5013...af8a664fbfa5

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/5498cf-af8a66%40github.com.
