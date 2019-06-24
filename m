Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIG3YHUAKGQEMUQXIWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFC950244
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:28:48 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id e14sf237861ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:28:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561357728; cv=pass;
        d=google.com; s=arc-20160816;
        b=IQO9reA5dw7VZ8EdZdtkAwnHFaTiPEBqirVTmTe2sV2yZERgqYQRXnP7BdOLtzjRb1
         c8Wmre3lTS8c6hfqLlOL9R/+UX8SrnLFmUzTiATAxfwp717UbLM+6CNBIPa6FkLmbLYo
         FoN2JJQtUlj1BuvMn4V11eG2YqQ30/79YJ+68mLBQbi3JBf1JkBvAgdN/YSu/yBJ978j
         Ff11Zw5ZaAQ+k8zrG5qmluD3oIved2Pt+aLzKBx7+a7fOk/fcPo7sBPAb/E/kyD7+Ist
         ZA7KS05lxrWVx0H4Z59SFHLm53P98vhQEBcclog7w5p/nbTkhXpr/M7N09teeK81xFkO
         y3Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=wfJbDoIJzpWDHhL9LCzg5c5+VCgQyx3DCzhZ0jRkMMc=;
        b=hjbdJJSzji2Ucx3IvR6Kp3GJqACt+GmPwP+B2VaVzOXD0uWB3lbXmlQkx1WqSEt933
         Mu+bITe+TufVQAePS6Xjlt4vZK5JkZjM7hCIxJ4Kf4GPaPRjc94UoJ6GDZ0G5Bcy7xP9
         +mhFqoqoGw79jtWjnr1EvOL2CNbuTHOKH/ngEkdJiB1b/s2i1dG7aeFaDyth5DaP6c9W
         hfwA6fsc+HOMY8rqQ2YPAF0af83mCOySq1Txzog/XaL4zfqw0ogRODcqZODIgvjhZO8g
         MVovo/Q0UkjyibZbE4QoNTt2IBgnO7pwOYsZfXKrMxkukhVZsdwGKlAbIGkf/KjzU5eR
         /qcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wfJbDoIJzpWDHhL9LCzg5c5+VCgQyx3DCzhZ0jRkMMc=;
        b=Y3AETs7OfhLHg6Cmsju4sxmZzqLUJ9xR1dTpZGHxgdJ9I5RJcxbGYIZgHWsxtHCvds
         VuJIgH4f4j8eJyD/d3x8qw54/BXWp7J3zjCPuNAeYKBLWdhKu60pdYYqv4q8VVMDJpHb
         OZK3j0UQc0A1eBp2VdnxgL2xmrLcdkIiRhu3z8LTtprUDGfuWLhy9cL5czRCZYiPJVTH
         ol1cz/sbPTOw5GfEMLPqMbwg9YkoTMPUioNpY23UjZwg4PQj5QZ4k2tr2YrEM8QSFdD+
         2mo2UyreOyV2wLms9OpZyFlDcY8Xeuc77fm22Tej0V2Xgxsy71vEYAF0LpWoX9dA3MCM
         UckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wfJbDoIJzpWDHhL9LCzg5c5+VCgQyx3DCzhZ0jRkMMc=;
        b=jrlO27KT21W+NSGjTkVkJSAukWz6NQMdv4RCMyo+vrYvkn3zCRbb44+xO50FLyDOCi
         rp3BKqYlWkKrf4laQzeM5GvaatbFLOMcEHjmvqD835Pbd730m//wChNoFvhpeUmfDlZS
         VV47C/P8iMyNAOsSi5iEwpSV56M9JljcoMvUROlNcqcg+MEnpTGtlkmEpocjK3TMXnWj
         DsdbVlJ1ZuiOCXlcV479z7COurVHUM5Tpys2q/awXD4itBVPULyvQW6A8mmg+x4cSEZC
         YHqBqrT+Uh1/RYRfVbgYtitKeZmVXvlXn9+ccyVgFh71qB3uGbd21x1aqMVHZb0PWgjQ
         /u5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWmIMwE2wgM6QvULXS7DsY8jZ1jyGwPzxcoTW/CPLAZzRQ5rvCb
	8i6kjcR5dVRsSOQSwfAT/dU=
X-Google-Smtp-Source: APXvYqzpVXB8mgZOIypuYckul4X19U2DQyulUEDNu1ST4cPchkPaec/so9j5zglBd+niH3ZUB23zbg==
X-Received: by 2002:a05:6512:dc:: with SMTP id c28mr74467276lfp.105.1561357728217;
        Sun, 23 Jun 2019 23:28:48 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4316:: with SMTP id l22ls1285147lfh.14.gmail; Sun, 23
 Jun 2019 23:28:47 -0700 (PDT)
X-Received: by 2002:a19:4b4c:: with SMTP id y73mr74076836lfa.129.1561357727545;
        Sun, 23 Jun 2019 23:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561357727; cv=none;
        d=google.com; s=arc-20160816;
        b=PD9sEFKUtwuQ2Aw8Y3c140ML3TOm4HQ2wQqzHjBucIucgKIddQJE67B2zeSj/qyFsn
         TknCKGvF7Bz/jdIUrLTb8/W5IGv3R73bZV2ns+HY+q3zEg0djYSqNHYXoEw/H3lD9aXa
         eES2o755fUhr/lLsEFxfz4ewUINRzWc5XQd4WOGKrPOBBb5E+NZa/+OzWCU3b0+k6WT6
         35ocNJoNbEe0DM7xBrK+X5nuhlU4FKuAjA/DheE5TDSQwmrvYSWMrTcviWdBaniQtvEc
         mOh6G2VZ7jWQPx/x92cVn5Hf3gPrXsMvnacIPjmSXzpVDHCrXmCyc+AKnL7QrraxuwDC
         uLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=55rxylCbzqDQbsIA0hHKD53WFWeGZM48yLQD8zymdtI=;
        b=aIJOnNGazJ1EEHW/8lZKGTnOOzpvpDf2NW5Kcb8R2DTjWGzM4awNd/4Ql/JofiZ5Xv
         JUFffkMvdrM3aLHsz2dvc//xak3I87aFc0csoNPBHn/0xpK4c+WbtTx2LVM417nDyh66
         hjCrVbqBuR7Hs8dyAa+Bm8GFBTsS6pYVhnImGOLu/Zyb048Dd7I+UTnyN/uzb6ZInSZD
         Atjkooo3d0JObNxRXeFv37Ck3SdHf58AQUUFalAR6wcEDSzrZxxYHuX4LZjBWWOZ0Lq4
         NG9q2UyrbMrIsRJisSLyrcXj5fHa9pZaAsnrJlZfxLWFV9MLOFcIUL2vmHpITpGzhbwF
         RFbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y25si504576lfh.3.2019.06.23.23.28.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5O6Sk7C025326
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:46 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.35])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5O6SjUX030166
	for <jailhouse-dev@googlegroups.com>; Mon, 24 Jun 2019 08:28:45 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/3] x86: Fix stalled IRQs after handover
Date: Mon, 24 Jun 2019 08:28:40 +0200
Message-Id: <cover.1561357723.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
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

This series comes out of pre-release testing: With new kernel versions,
we spuriously injected masked MSI vectors that are not acked by Linux,
thus caused interrupt stalling.

Jan

Jan Kiszka (3):
  core, tools: Add msi_maskable flag to jailhouse_pci_device
  x86: pci: Do not inject masked MSI vectors on handover
  core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi

 hypervisor/arch/arm-common/pci.c   |  6 +++---
 hypervisor/arch/x86/pci.c          | 15 ++++++++++-----
 hypervisor/include/jailhouse/pci.h |  8 ++++----
 hypervisor/pci.c                   |  6 +++---
 include/jailhouse/cell-config.h    |  3 ++-
 pyjailhouse/sysfs_parser.py        |  2 ++
 tools/root-cell-config.c.tmpl      |  1 +
 7 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1561357723.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
