Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAXP6PUAKGQEDJYFTEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1D5EBCC
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:44:19 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id i2sf1427706wrp.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179459; cv=pass;
        d=google.com; s=arc-20160816;
        b=B5y+yK+0neF4uP85XRJY6U6SrOwyu6m7CETpTS22Md9B0KO13wgEqCp8U0Xe546+P5
         PK17wf+XAFbQBYSUbWhH6PeaeqNm/bR94gdrcZMUKCcsCbwQT1LaqEunw5ozh6Hfl/09
         oz4Ne92jj+S4tqfTv/G8JWLi9TSfTYpGVDMSnYz7VuYffBahskR5yb52JetBCWrhemx8
         /V23d3Dq+0YXh3SUtkY249ntrYxIJ0Og1aOGQVqB2RatJi0MfDfUC4WcMSU9vxcnJdER
         JRnPGklS8sojbHd1p/zg3g2zsSiCa739KbdOxiSPLRJZZ612/vHegUfDAfcKQcvOzEoL
         lXbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=l2Nnjk7rZ9DfStshGmuc/riThbwHdJUm1W50AQHe3lQ=;
        b=azMuzW22H7fZ8w+omS1mDmHXXIEHeJO18HTPSdOwbrNkircMGKtHPuZ/2KyFTp9wZS
         1OwKJUcIAifOr5deOiM75GEbM3S1T7Dkd2RqIu7xHCHknBQzrzmzTCWrpRMbpFo4uHq5
         tkUTobuLYkzklV4b3FwugHZJWFW/1d044kDuVlpoKw13M9ELOmBA+Unfals1Mc0nbIOj
         D74OftQFN55CvB6WagdMq3dk3TsXbGFbMvtTD3kmJ/MBQ0lMcceDdcSY/WSE1NOps/ER
         bzFBLV2pQNSaoKk1FNKrG4Anep7N9Ip5DnprEtVTK2MKzu05IlXhyZMnPkuSG6nqDjGf
         F+sA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l2Nnjk7rZ9DfStshGmuc/riThbwHdJUm1W50AQHe3lQ=;
        b=LJ/EXt+JSpwIIrc0YPzHi3LOAP5yggwXCHG+EhRh7v+dFTt7i7JpVUBcNy3cDGRyFQ
         k0U9tXkKIL3URDIRGC3zfFz3b0BITavHfnXu79ZjkMUPDlQTNOlO81yDOey/qyKxORy3
         pqau8Mpm+H8jajiKp1RJfhIcbTRgan1ORSktGkzHbWIwV3aRyQ4CWaWtluhgDUlZssND
         EQdNiG2DUbSpd7aBKB2IWqrccfyKTPtTsnEfloujPJGT5gu9N/bt726gMqqcbTc/KJ0N
         Futt55nkSYxABMGEuIEgbH3zS9ykvgd+mauZJgAKZH0x3FTmwhBpA3GsUDew8tnbyD1Q
         Dwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=l2Nnjk7rZ9DfStshGmuc/riThbwHdJUm1W50AQHe3lQ=;
        b=Z8w2LdaVNuUTUszm7liUUVMFIZ/0hc18esWMmsHjaH1SX3hy+kDfDVQGrP6xGdoeth
         wYFkGORysFcAGrXduB/dmo2pUxogfVJSNwZr3L6LEHlni3CYaFYQ8LfUdg1EOdHOWyJ5
         idS6Fm/y1bUfMAU3A5iLyJiHwvdR2+S59swmCldJ/k8jQCjGjtQJFGur0K19X81Rq0O+
         O5PHrjC82WNJVWQ2+yZ8hSMVKzxfrBUd0uXSTJX9lT+vdNiVObuZaMrt4H7so87Kbqea
         mxHkNqeM3DfGNXQW+Zs7TmFr0kfUCzcrdB8iITSAorX+DZM3mRdaM+0kkv8oqlxKp61d
         fpTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXKNUi05DKP3v/Oueo+iX2otZaTd6MXTRqWLXHZ6va0yLKA+Un8
	WNqmW8xacmaMV3QDAhMLkcM=
X-Google-Smtp-Source: APXvYqwAixykzNXCtt7D7DGWsUSM7Gn2J+5EP35Vb2Dp0WH7mxwx/7Zi+UJxkXkzaDDYZgpWzgYOhg==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr31169069wrj.103.1562179459049;
        Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f0cb:: with SMTP id x11ls749203wro.5.gmail; Wed, 03 Jul
 2019 11:44:18 -0700 (PDT)
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr23861590wrk.229.1562179458434;
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179458; cv=none;
        d=google.com; s=arc-20160816;
        b=FQVo7f1d36BeeljJxGUWZ/ZmxOYyBufLR4vA9gSvcha39ECXNRRotaqBS+uigPTGdH
         0fcgVSNmJCU6ZrgsFWPUrx/GktgMXpSV049BArIH1nuSU/ZGw5hAinpjEmV4Y/XlbSAF
         XDNrBknLHmhi1vKJELJp3n+Ok0UhVwytshOGnVrNs9qBLzuzGrgZK2GbjNTblq1NEPef
         TATM37QwajnLucjziIFHBJ3jPdaP70NQTU69pa6mixVbKrvX9dja+gKYD6HgUvY3yh72
         /qqsBVHakh4+LSZs6iVRblVuIr3ZK9x232oC11yuvZH1+D0uH8hMe7f7B5fgfd521iFS
         eyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=VHCkDZThGa+t3s1j1WJ+eGgFoeOpX56upKeoFsRnn7A=;
        b=zP9oHWKYgNM9CmssNp7+Um53aL1g2KJt1bALUwexQfTwF8wpubsVRGjl0jtDY0jeiC
         6Uu1GlJ4QwDjsEA9r/XJkgQfWHGFKuz9CMyPe7BEOZ6bGsxKNjDE1+E8dU02QiBh6nhB
         ufSTJG9L4bhe859CXBpYYHQY17/kBGOR6tOXuTeSBmSqs8DVwLJgVMqz1cIuWQ/3i8ci
         3ksbWoCmFXSzoPDFF/fG/aXUGOXhaLEric2sCfdtSbTQmG4AekOWMQGAUIlVwr5ZkxZx
         2cHdSjLqnXDMANPXno12hTGgOCsDIqoEwMkMMLWWOIglwk5XgAeW2npBeo06V6EsP0y4
         LPbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q14si166105wmc.1.2019.07.03.11.44.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x63IiIpd005673
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
Received: from md1f2u6c.ad001.siemens.net (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63IiHF7023455
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 0/4] Last-minute fixes for DT overlay and qemu-arm64 config
Date: Wed,  3 Jul 2019 20:44:12 +0200
Message-Id: <cover.1562179456.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

We had an ugliness in our device tree overlay for the virtual PCI
controller that the kernel no longer accepts since 4.19.49 (and possibly
some older stable versions as well). This forces us to rework the
overlay once again, moving more parts into the dynamic changeset the
driver puts on top.

I even tried making the whole overlay an of_changeset, but that is not
possible for a module because the kernel does not support creating new
nodes (missing symbols). So, let's stay on the mixed path for now.

The other major change is enhancing the qemu-arm64 root cell config, and
the rest are smaller fixes and improvements along these.

Hope we are good now...

Jan

Jan Kiszka (4):
  driver: Fix memory leak on errors
  driver: Adjust vpci overlay to new DT overlay rules
  driver: Declare virtual PCI controller dma-coherent
  configs: qemu-arm64: Add PCI ECAM region

 configs/arm64/qemu-arm64.c |  9 +++++-
 driver/pci.c               | 73 +++++++++++++++++++++++++++++++++-------------
 driver/vpci_template.dts   | 15 ++++++----
 3 files changed, 71 insertions(+), 26 deletions(-)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1562179456.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
