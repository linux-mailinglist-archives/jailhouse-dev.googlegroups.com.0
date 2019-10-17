Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXPUHWQKGQEYUVDFSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E61DAF9E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 16:16:22 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id m8sf480829ljb.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571321782; cv=pass;
        d=google.com; s=arc-20160816;
        b=s6GW1zSsg/AEU+aveIBpkKF7asRpWkcgkiDuE0JXb4w9L1BbqyCzkCGx9NwREUw80+
         OPdGUl6dwdPU1kZun75GZXfdBdHrMUHYoc+QwiJlrwSKLUgLVeXP1Wu9ObMRJ2RLpb5t
         mnnhHhpoao7K2Ik2aMVLL4JIkTxh+nxg/rTw6dhRNba0RHJ6nS2l3WzgMP7V92OqB1vt
         sHADmuCEDP0QxaxRkgTo49uzjwi/4VNvAWqytnqJksyTLIUK0Q4cHQmFUbwGRgAF0FLa
         SoT7LJqtiWlmF92OVbAxUH/X167VBXI8Obwq3pPjfTqMG2zTgkrAGIaTmcexCg+yRLgd
         iz3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=xbh+0dYc3nEcIz5N6fiLjpZuwVMdKJzFyEXnYHlos9w=;
        b=k++GatzZmZENkEqsbQRoJ+PLT9glpmJmDfq0ISbTH8gAUFeN4giND1nuwRTEU7JhXd
         gKTk6iN8zALhYSZbo5f6KWcWtFFoQ0kbWQIyjOtEkmZs3PkNZXQ4XTWHDuUTduVZEYPf
         wdBdeaD3DHWhn3jzGVG31k/nzl45Z/C/k+3ukDsQzBRBB1ZRH+pX+uNfr6fIzutpIbHh
         zY7YZjx4ZKFmSy1Kg1pDcbp089lTh2O2tTqBiKTJ3arX5pEmLUET2C+MYxmysuC2Hmun
         rxJQ65xJm/gM1n0wsqWTiHoMeSl33zR3H8LsOgUA+sQhDPu29jgc0jJU2q+I9Lm1cobo
         TVRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xbh+0dYc3nEcIz5N6fiLjpZuwVMdKJzFyEXnYHlos9w=;
        b=W3sm1ISh8zIH2LyDEicMw09h4h3eTGeb45CL0YQqEX/vdfZnEGqP3W/jAN6PQ5P+7y
         AO6gvX9vTt09QptR7lIz014A4wXi79eT88/VhjciG3+By7OwPKgCuTVpaC4nnpVS2w8x
         2/1nfZXNewfIF8tRemYaqtUTDh1rzWUuHpz9c9jF0Ji/sMh/mMs9kt889Zlj0Uy/M3AE
         PW6B4fwZmSyR2LWvdwBxwBsoCQhZ4kJYG+JnFuOY/AGt+e4BMwdbje8l45JbpzUp10xL
         vDBkA0PIlEnAgx0daW1kmunfpu2vFaGTnMZ1MbM0tgUri4yJYtpNPuRSZ0Qu2O2iodxf
         xqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xbh+0dYc3nEcIz5N6fiLjpZuwVMdKJzFyEXnYHlos9w=;
        b=PvFUMbKvc+ObVzPH0d5CpHuMFcs3VMmgbre5cvXbSA7LMQ3YAhmvwHbsuiRtffKC1a
         u/8WBkrpPj2pKvfLvxKhVebaYxZR7k0C2IWFuiBy0aX8NgywT7+0K0tAKr6i5lJz8+Va
         DitTW0ptdj7ThVgzZXuKxY8RpNiOSVOf4bBE7K5SK0Hz1eoSXmg7O7mXOWVjuYqqW9bH
         VKs5eq2RjH5LusgahE7sxPLVRISvgETshSP8ROwWbYl1cU4YyL7aszFTqa2s+XZlnmw0
         El6u+PF4Q5orCCAziidzz3NKeYzYADTD3WfeHPl0LDKC8n8JdcFLd+TfCPGsNUG9RHXh
         l2Ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIEAsIYAhzQoK2Ac30pKOxbz5Gg4I7YbYC3iiDE7eLzT/uaWOO
	Mk+oUT0ZarEAvK0CQgTIK+g=
X-Google-Smtp-Source: APXvYqxj5HXoa9Dc9y8YpeehMxPgI1qkWTEydxv+NEZvytg5vW0xCTH0WzA6AkHz9zH+HHT/ln8OVA==
X-Received: by 2002:a2e:814a:: with SMTP id t10mr2771837ljg.250.1571321782331;
        Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d9a:: with SMTP id c26ls316824ljj.9.gmail; Thu, 17 Oct
 2019 07:16:20 -0700 (PDT)
X-Received: by 2002:a2e:8793:: with SMTP id n19mr45518lji.139.1571321780976;
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321780; cv=none;
        d=google.com; s=arc-20160816;
        b=esdp0Cdb7RxXm1LQZ39eEreWS1fsVcOxliRMquU1/Fz77u3p01FnFg/y1m9ysrtopV
         KafLbRs6+Mim4Pe4Jx7UmPK68wGViQziZ38P7v1/sfgiI8TATHoJbLdfHC3dWmFK6KbM
         BAebsGON/XvH4LMRz+Jufsv+FuTWF87ie5sFhyMc2UvJNxcTV3p/BTZs6vuuyUX+TuUg
         OFkqtv35o265yV2zUUwuW2y0lnN0YqpvVwJdgXLElbmFar7VJ0nmnnBIoyft1cOSG1ow
         e5/0LkFH/5Vazuv8/W5UMJoeQl1WxfrlOMXljA/HM9ejiPrgTvl7BtTskLwdTMJRNdSo
         mjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=AJRUIYdcHnRu6mjVdxTEs6nTpJxvybAtw0MazXjHzyQ=;
        b=hU1iW18r6J368ftkN1lk1eWPGSdHNTK0h5Rn5FiujouAbvAn7qHJqrQOQGdPH0nu+f
         bUCvm+llnxw1MpADzx2kfdoNKVjk2CaTDmsYMph0Q2wiOASj7jFh952bH4Jb4Ei5vgnD
         0ZnY0OIykTUndDYVkNZZvpCHOnNSq0CfPliT1W80M0B+qMzWx7GnZNOu/PtvVq555a9m
         h8eLfoF7bGJDGHI6Nkf34rTeGf208KAw1ETN+cTbQveC8d+K+QDrrjur8d+STy5+4F1f
         u9pSVd4zVoLAZdH1qnoWBhw3Nz0tG5uTiFG9KKMISP3o5QYvjw1yEON5BQmBEMhcWbf9
         MgkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q25si152483ljg.5.2019.10.17.07.16.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 07:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x9HEGKdP022722
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HEGKgi007087
	for <jailhouse-dev@googlegroups.com>; Thu, 17 Oct 2019 16:16:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/4] pyjailhouse pylint cleanups
Date: Thu, 17 Oct 2019 16:16:15 +0200
Message-Id: <cover.1571321779.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
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

See patches for details.

Jan

Jan Kiszka (4):
  pyjailhouse: cell: Avoid deprecated ctypes.c_buffer
  pyjailhouse: sysfs_parser: Fix some indentions
  pyjailhouse: sysfs_parser: Avoid len() == 0 like checks
  pyjailhouse: sysfs_parser: Raise an error if get_cpu_vendor should
    ever find no match

 pyjailhouse/cell.py         |  2 +-
 pyjailhouse/sysfs_parser.py | 25 +++++++++++++------------
 2 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1571321779.git.jan.kiszka%40siemens.com.
