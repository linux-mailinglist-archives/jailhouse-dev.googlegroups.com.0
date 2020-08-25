Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5N3ST5AKGQELTHATFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 22545251AB3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:19:35 +0200 (CEST)
Received: by mail-il1-x13f.google.com with SMTP id u7sf9195320ilj.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:19:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598365174; cv=pass;
        d=google.com; s=arc-20160816;
        b=N4MuIfDgOMkF9x3iLpVfAhUqIhC9DVxNFkbB8S6XnNq8Ios1LLN8PUgtPpLM9ZnYHf
         Ev7biqf5IozkGq017AZg1UFGt+T7CDUAGvOmgHIzWALdqlxBpJv8W4yFmIXKtxabzIkB
         Wew/gp4D3ty3prHwm65tsUiql5TKnFJjgzX/Fe3WiySKpFgJYnvPjeSRVhVpWubkOQ1t
         iU7RxIPgics0wAYRhNqa71sxImWrmAXMcrRXqL6uobKwQMDPMxsnV3wSfAgyxg7B8IWR
         mCWtOYjf00Vavxv/y/Kpg/vLaYrqq8+hqnKO/YSsu/e3iuUnZxyGpCo8gA9wxcTjT66/
         Ee6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=i9gxCtsqOaqJxbxb8RDT7kPgs/gBeBlsBK85ce9vEAY=;
        b=EY/EvIl3k0KFZZMtRSr6sAZFDrPLo8jey/NIQpF+VuByWsK4RLDjJUPOlyYdQQ0cP8
         10EMcfPfFbSAOvJ1tMek3ellZ+RcF1MLgCXE0b9er9yRkhvrjkrb18zmgtHJZjg3F2N+
         C1jiRBHmNT1PqYHoHQgie82l7DkuRfmKA7W9/9vrHEIoZ47rR67WJvxx4VhvlqeMjZRP
         Gv9rzwGv5ov/VmroGzpwX+svXJD5YFTojywrKiszXUc78oCoH4Y9LQn/eqeT/0sqRaZ9
         FRd+imA94KRVCYg/GOQ8i4Elu+agHaYjPePhM+AvkkMsWIRbK7p4rSfV7Q1FdQ/UmUmc
         mpIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=br8rHPwG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i9gxCtsqOaqJxbxb8RDT7kPgs/gBeBlsBK85ce9vEAY=;
        b=DB4l56X62GjNRtACf0kP0R+xde/PfAmY4/hXMRQOhloTTZW8Zk1WM2Hru9wGD1g2pu
         RQrghh68c8jRD5Y0UoKzc9qjBR/nrPip17yy49NbrwQy/979FnXbVuKiZY69K+DKsHXf
         ahP16jrYyHDVfJ6zmcAnOwSKOrh/Mnu5fDddyVjhueX2f70SZZfcxFU+pA46lA2X1EgJ
         osiKAWeT4TVoDyJyIle3upBdS0z+Ts1gHwhwX0UN9bGEp7lSHSqDuqvbICUoJ+po7Wch
         ng0v+eA6KYF63cP12UMd4yVxLRHiNh0bXJjQZd2S++4lV6lQ2NVflAt4F9jkt0lr6XEM
         eIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i9gxCtsqOaqJxbxb8RDT7kPgs/gBeBlsBK85ce9vEAY=;
        b=bw7R5Mkcdb4wGKzlVpSMF9h9tl+oA/w+t7B6SKQwGymUyP3Uhl0S29mWWdncw9wtxH
         NSfC9Nq3oPfBjXI1XVsiZ1KowaRCt4pWpC5pmKrIUv7SjDvVxOUlNyPl/IWbnDewptWe
         SqsiJKKbPB3dyUrXCs4CGne5icO+xIPGcCLB719qZR8+eOIu2zr7puHCkXCOKHu9T5KS
         AuIYC8JHiko6PR8ZAGw7gcuYuMyeBZMf4EzcEy3YhegVjo7bsr406MqN5AC6ARc6mr0K
         A2tMgw/X3yLDt5ZzfkuL/TR0uu0D4SPHi9yuENru/6EOfrx5zgtNHpA5YomzX/pGvjn4
         B93A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dqkLYtHKpBugoMZzQSWsDGAQYEBmR/3lLpydsB967S5hp4lqi
	wwZXyDkoFsbmFRBJeYZNdbY=
X-Google-Smtp-Source: ABdhPJxcRPn1uENtnBw6wcr0qqCPyIvnsXWDRDJM8XdbADgz5tq5jcHerb9D4zZiZHaF42a4yO16AA==
X-Received: by 2002:a92:9a48:: with SMTP id t69mr9880167ili.114.1598365173910;
        Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5e:d708:: with SMTP id v8ls209347iom.3.gmail; Tue, 25 Aug
 2020 07:19:33 -0700 (PDT)
X-Received: by 2002:a05:6602:2347:: with SMTP id r7mr9369294iot.60.1598365173459;
        Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598365173; cv=none;
        d=google.com; s=arc-20160816;
        b=osA4s6/ynZyj+8CPBgRkVAgH8PPAbAwvWQ7G49s7aY1fbY9TCTAnHyHH3xboLNEZYk
         s/L7PaXQS1akhMv9N1e3qoue8j8hBcduYdflvDr6XNWGYdH6mxoXbFfmqi4T7W/EssDk
         QuLl8/R2ec6unnYy5IJM28sRMP5NyNGpwJmVqHUFMRL4/4jEh0/9wyc64h0tJJ2ugvnZ
         5aKNZa9bt7D353F8P9gCiyYlFPxhDD7e4nH2KbPM+IgJ2ST2xp3LIAIwJRj7ftftElYI
         z2SO0t1zeZ7RuykUnc8Hs0oEQHhDmHPrVpqPRIuUj9xC4/f2OWXL3YvLLXXJ3n+RxAkE
         Ia+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=q7fHr39L2WVhC9SDHv0uH1eC3L1iua3q9R2dkxWrU6E=;
        b=KyHHZQZJLIW/iubwMVov/yK5fwTL6QuUjTdSvuDdRoFEGnf+TGJJQiprDnX5775+uk
         d3c7Zl7SrDcYjwGHtS0BmexiIRwLHGZDqNgQgmX8IGU0VRnu2hUbRmfEmncohyPPuLxQ
         vz40O4RTPqugI5aYnLsJgobsW9pbsrtRukFscbBy8o+fjjRrjrnMr6Az2aOgP85cn5B1
         8amdV8ucuzmEKXartiAWLQQYM1pzRZyA/aIbuIwCDgoWcjJ44HcQZUuHn+gqIlFV1cGM
         IEMoaMOlHGP9jQiOHxdWYpkCRj/KfDz2m+vMX4t79bNY7JtAmzOtIEYGeUaQxgrSUg9A
         jMcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=br8rHPwG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id j127si518392iof.4.2020.08.25.07.19.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-2ef7ba1.ac4-iad.github.net (github-lowworker-2ef7ba1.ac4-iad.github.net [10.52.16.66])
	by smtp.github.com (Postfix) with ESMTP id 0958034059D
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 07:19:33 -0700 (PDT)
Date: Tue, 25 Aug 2020 07:19:32 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2f0c87-6d7eed@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=br8rHPwG;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2f0c87-6d7eed%40github.com.
