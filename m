Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBSMWQP4AKGQEWCXM7NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x140.google.com (mail-il1-x140.google.com [IPv6:2607:f8b0:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185A2147F3
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 20:32:42 +0200 (CEST)
Received: by mail-il1-x140.google.com with SMTP id d3sf24458755ilq.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 11:32:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593887561; cv=pass;
        d=google.com; s=arc-20160816;
        b=HW5PjjFr7Fu4Do255ShXmLQ/KxJMIoC45gIg2ze5m6dkYj8q7P41z5rA/pIAox17Dz
         wshmIzeHM8Ka+fYxCyg396kfqu9tD9cdIOSJpSFPnoX1QSf4GyP4me8P1VlLE6o8kAUP
         0hW1Wqluk3OQKFYbB+UM77xABtNDTHtmsSS4/Ax1GtUrslq5x9WgtWm/32HzXrq1oO5I
         DHw63rYmTdCBY0kf6r2i1LscvC8M9df3UDsbbcIwMmGlZUOQtqc1/EosBV5aLdNdeiPs
         YoVw+wJ3U6nhQYTpIvjR2rZta0f3wnPDS9XVORy9ubdB5SXDIA/rnz8bWdDOFsd1V+F4
         tVPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=TnJr22TefAPKKyhm7nms65niicbu2TdHktgGMJKRSS8=;
        b=MZ6365nKTy/btKTqg4WK/A6G+Yo0dXIOnuZk3UCtbrdkk6nOSr7rWYXmpp2qwwIXOu
         aAdDVp/raB0W0n9KGymZQVLQzy+tRz9jbhHmEQTsSwToQYJ3kR3O3CHHfPGFiHB0Nk5s
         CoZLrSWFaHG6LEkhz5qq6ihSnLvmJuai5DpWBU9G+q73BiIAUPziJWDme4vvBGkl5pnP
         4Q/IgpVcwkYza/yp2eNgIqF5bZ1peTk3kM39kpqsGyMkrcM3PYza2iPCNvY9UH0LW1iE
         VWjgilYwxuuUNquBHjqrw0z1HF1IXE0eaFtK09IgTiGpiZJpkUsNEDzvNN3Pw8oS09em
         XnEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=AVqkjYyE;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TnJr22TefAPKKyhm7nms65niicbu2TdHktgGMJKRSS8=;
        b=OEqKLHaWk1BCm2g6L5hJODiTs5TUN+AmTRkgaOMUZVMEw2mblIdBxkNPEvxg9g6Oy/
         flm0i8OxoXdML6mK5Ja09uN9QLlpB5mO4Xyx0wjoVrjdQg/Spx5JlAy1CdmGLFrBFfsb
         TEfIaj/O75fONJ++V3skh7I6p4Do+4CCWGYopVSg87UkbIcOLO7iHkDZ/U1lEMk6LFXY
         3MhVQQXJYVMocKFd9gGU/jAP1bip71uoe1fnQqhRzgpjCoZzOGe7LBC2vEH2NyIp6btK
         L6jDZjk3XpGrugqD1z5HCqg46vT+aq/25twYRvZWZKWr47RYkOALNjZIvyOXsCOMh0Cy
         WUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TnJr22TefAPKKyhm7nms65niicbu2TdHktgGMJKRSS8=;
        b=XduuHeIS0B/HQAtcTo0pSCLftkORCBQkrSSvZrhjtPQPvLROJmxdeFgaKeqLwdq/Wk
         +KqEnaQ/Esm96BMGexoDsllYvt7tvs2Uz25F9d8AEZZSO0dpGG6msPjgPLh6GKzNDOWX
         kJ6hx9Fyx0qC+ZHCevAwaAR38hcksc0W/PPcIQdeqNxSNNZE12CpWaEIE3/dns/a3oRb
         lbbfcd5usm9ILNvhTIm9tKdgVV7M9nBqAMhjuoXxA3sP3oOAptLm9A/DJPtGtHU4Zu2R
         h14+HsP39XusV0O4P8Rwr+TSGGfgFlUOF955aVx1aOZEMlduM7eID73Hm0VEBVNRwi3h
         ivSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530X0kCAFVopY6NYQEjfbiVb3PUfsciTX/BJRR44FGXNte2t+p5s
	TFhiN4LnhAU+qe0NRWKM/7Y=
X-Google-Smtp-Source: ABdhPJzrs9OgIhzoNAFZhnxNYepK/mrjrkLs3M4Fe0Z3PrYrKoD2HPGhScbNY0tb/Xb06dVwr/42AA==
X-Received: by 2002:a5e:8d15:: with SMTP id m21mr18255268ioj.60.1593887561472;
        Sat, 04 Jul 2020 11:32:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:1389:: with SMTP id w9ls1767860jad.4.gmail; Sat, 04
 Jul 2020 11:32:41 -0700 (PDT)
X-Received: by 2002:a02:9f8e:: with SMTP id a14mr46365554jam.95.1593887560938;
        Sat, 04 Jul 2020 11:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593887560; cv=none;
        d=google.com; s=arc-20160816;
        b=Uk4WtcLbrshioSj6nsNNcB2F8DPYTL9VeWB8jpvS//3WFpr99Ty4+i0X2fy84QcVPj
         C9Oyr7HdvsuJWxhJuiaHqCx7ZMERvngEzmfFnJvxawSNW6Z05dprDI6mizOcGBUuGBTh
         6YDoMUwCXLXalAjK8pVxACaWd7C5QdKnmgEwwAzpBDxnv7DZH8jRxJ1EUq2InLjeV3YK
         0HWYutdkxonniC78f7VdOLmA/zYrv4FKBN1qUzXGSGdIHSc3IMGnZqiYNoVLZk1SD+v7
         6g0Gc6Pm7qXesNBAbHSXBQ/ZgyFptqB1E8pkzShARVh2QAG280XstnOBveyBsdFKwz0k
         wOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=q7fHr39L2WVhC9SDHv0uH1eC3L1iua3q9R2dkxWrU6E=;
        b=mGNDfWK1bkDKHyzapsp7qIlQxMlR7l/qKNdhk6+PN2KpwLH/FVX/aC6XaHHt0wddiO
         jjXAWMvp5cagnkUzZuCgZL+/XRW/V20t+7vV+cmWFbJuQWwYePTYpIigzyQgc9DlTu9x
         sbASDH19Kj+VVA38PaisIL673driN/AGE92G2/H8vndBkzbrBOmVju6GNltPqZ5pBKNB
         0DmBCyr1xHXFO6CjtVpc/Vval5Gq+xg6t/gywFXYqIAaQw85vpo5xcH/JAbbMaBqOeWy
         r/lq3+xerYg9H7dZr3mBw1u49vpya1q87hs4Rx9ErQwPVS/Peln2vcr2lvRUs/jFhONv
         beBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=AVqkjYyE;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id p1si1139314ioh.3.2020.07.04.11.32.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jul 2020 11:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-cd7bc13.ac4-iad.github.net (github-lowworker-cd7bc13.ac4-iad.github.net [10.52.25.102])
	by smtp.github.com (Postfix) with ESMTP id 92540A0064
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jul 2020 11:32:40 -0700 (PDT)
Date: Sat, 04 Jul 2020 11:32:40 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8787b5-384720@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=AVqkjYyE;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8787b5-384720%40github.com.
