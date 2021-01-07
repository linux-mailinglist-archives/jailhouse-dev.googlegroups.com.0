Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4WP3P7QKGQETJHR7EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0152ECE2F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:52:35 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id a10sf6218149lfg.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:52:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016755; cv=pass;
        d=google.com; s=arc-20160816;
        b=fqjF2dia0KSMSroTouS2YY/COi6/96p4t5+cCrUq7I83RyYyiM8SPYki9NXbTMoDU9
         B1+Blz0ongF05aS/CVb1lLaHnT09YczJmqvHEDFB5dlxdb8D8djEXjjLfcUwd3590QGb
         yoOwwldtiMIX9ElJx40CQinf4Mk3AJ4g3bqB4Hrxlr42R3S4FfZB//SsmsZSVIof9b32
         AoYpt2gH+/77ucV1TgRTV6dXEB23tCjq02FFd32TjmPNeZ/EbWOP6oBxfC23b1mKG0c5
         HPfAUOAZh/g5wBkUco1Ry4bLzVGAHiFgrcy4RvZ4iSzYzwF30BX+cOx9vLqyv3T9o1+c
         MvIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=S89u0Ez1QG2M4Z9JxfdUaNOJy3z3WPntsP9th2JRqMA=;
        b=Kd8hT7ZxbCxKRSx6dFwotybkaoiyaEeyI/3ee4vcaW6131C/EZIVNLhNBR0d5+DZwq
         nmREmnnxvUgcz6waU/S4yDdz1VZ/Dp1gL5o8jWh8yjv8nv5D1nv648xg6IrF6Y4XJGBP
         3+u2QQj4eMOnc2mdPKhR3ono14S2wxNcEVQiM+vdvAogxBz6dsAPjwFnOsxHbbpMidFU
         2u+RVs2GbZoHM39hUUQYJVjPr+7AyYGRJzZf2PJZs53ppycdAAGpg4Yz7VPvy7xktVzY
         tNpCCxknb/YcGw8ifczuCPMR58sOKWEaSnOJc4mkmRYslMYk9TJ3BPcXE20JtkjHAz3s
         Otxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S89u0Ez1QG2M4Z9JxfdUaNOJy3z3WPntsP9th2JRqMA=;
        b=jFFtsvJByAkzRW3rr4ujraAIGVuxUdyFVFEDXt+36N1VxO4BshcLk7UlUJAIDmjgg+
         IXd44gdZGVk7yrka3JRS/5RFyOuJq0gFP0b3JaH4Kk2j0MWadvvpBrY5tVPW07GcX5sg
         FVYw8GDSoPAfvLkvKxiXYPqa0MzMt5BBf2Jg/CJz8RZUghUeMModwvYnM6WoRb60iKXM
         oMuBmoKptLm40XxbHfGuIiwEb3acf3IZz+LRJpRH4m8yuNYDevkIqK/5Kg6HEw9YkI0L
         A+y9Dpv3iaPqdfKK27d8eiZLsgRcBETMuDEErKH0upVk0KimO16+ec3e43IyuYktH3bd
         cmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S89u0Ez1QG2M4Z9JxfdUaNOJy3z3WPntsP9th2JRqMA=;
        b=KcU0xbHBojEvDvAXDjJMjp1WeNmvkcM2N6GBCJM7RABSFndYr2EIiQIRdHfINs7FoY
         Ke+hn7wFKHstuTXNm4cmXixJpZg11WEp/w7O7Y5lZhyBgRkGsO4m8N2cU3t+BCo2RIGJ
         PE9pGoEIfPjT7PghxjGVfuKlb9qMXay4zdQVTJIJ4QbVWg6vx0fm3M6iKLxgU8NdsrDx
         VBHXdlBlPk5f7cKZXYEs8QB3VLJL3w1sMoZq+vI+Yc3Al4Z2cpNTHoWJYCKrOi3oi+Fm
         ljNxJUB3/OwAQuUPn5gU1nTa44v0I6wNEdZPZ1EisxLSRdu/y/a2TtnWDG75LsS35VIY
         vmag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532IDkbBL1MLKceN9UHkFbugAAIBY0zAdbRP7jrrZcnLoyvW9KMf
	l+TAt5dHP9+uHAMCk7ET5G4=
X-Google-Smtp-Source: ABdhPJySUVXnu+BnRLwtoVTSiLYdlGuELO7JTvZXsqa1A6EP2iM3EEGQUmO/KgsLdcHNgOpS5h1+KQ==
X-Received: by 2002:a05:6512:612:: with SMTP id b18mr4107571lfe.598.1610016754883;
        Thu, 07 Jan 2021 02:52:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6145:: with SMTP id m5ls146985lfk.2.gmail; Thu, 07 Jan
 2021 02:52:33 -0800 (PST)
X-Received: by 2002:a19:520e:: with SMTP id m14mr3521477lfb.591.1610016753675;
        Thu, 07 Jan 2021 02:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016753; cv=none;
        d=google.com; s=arc-20160816;
        b=ippd0F+TjI4c1FtpLuLMjLxXLl5ZdnRzyGnj7zr4pi/O4C5VAX5PnaKbE7Z7Pfi5lU
         6WdGgQyrl5ZSZlkWJhY+ezoxXjqmSvkAPn1pvApzl7Qfq88fU7lbJbsBvbwzduKqq6uR
         mbrLZ2AKSGx5aUsYNi1QnNkfuNDZVPBsiDl17u4kH59Ep2vBy/s1LgSmco95hT5AlMHI
         +QxMKL3cfcxrtmJUPStUbcceAL1QzgCJvEYx4oBQDQH6VV1nuMDiXV375hpZIBrHvDDg
         JBXowMTClq7IgSTGeqXyIEBNrL3a7cWV5h/9cOtrIL4uNaDZ1U5cEFjz6bKi4i73Pf7B
         HnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=bzpXM5ApXAj9AzOmg4AB1a6OK67x4O7Bdkc4M0ydNAM=;
        b=sNBaPdiVGjvC9hNlNLvbrJZj/6Bi4+nhOrAJXwkWZKUo8ODF+61uY+TcwIqPEkp/Ir
         JXkwVNFm7XmnnW9feb/kWWzrK4NmLkAaoTI9QVV2kyp3fzTA5Cb99Y6JOUGHIUC9J5Q2
         WLWz4E3zNVMq8Zjum84TKOfvzZF2WroHmXEYwCF5+cTfYRJRMlKQPrFp848iiOG2lyQE
         Gcj3KpFoOdSWjHpRmiRZ2mSInRvu066WMHu2+5PNULrTImAdp1fEPYtgyzIKd1gPFDjn
         wnO8mk3VqBDVEqWi666/QIbCWhzWovJPe9IYVVhDuRAT9QSQuYwlLhdsimrr104Ze3eG
         cK5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 7si237802lfp.13.2021.01.07.02.52.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:52:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 107AqW0n011083
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107AqWd7019377
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:32 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/3] Config checker improvements
Date: Thu,  7 Jan 2021 11:52:29 +0100
Message-Id: <cover.1610016752.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
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

This should help to find subtle issue due to incorrectly passed-through
resources quicker. The recently posted fix for imx8m is one example, but
we had many in the past.

Jan

Jan Kiszka (3):
  pyjailhouse: config_parser: Enhance parsing of system config
  tools: jailhouse-config-check: Fix error output on hypervisor overlaps
  tools: jailhouse-config-check: Detect non-intercepted critical
    resources

 pyjailhouse/config_parser.py |  89 +++++++++++++++++++++++++++--
 tools/jailhouse-config-check | 105 ++++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 6 deletions(-)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1610016752.git.jan.kiszka%40siemens.com.
