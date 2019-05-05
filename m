Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBV63XLTAKGQEI4364XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8765B13EAA
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 11:33:12 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id s70sf11020289qka.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 02:33:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557048791; cv=pass;
        d=google.com; s=arc-20160816;
        b=O1y/JGKZS8CvvgQEMm0CF92nIgZ13JP0pmHElJpl6u4zBQ7gxjWPrrtcekIe44I1VP
         C4lcECVitUnAuN1QLf9QsUlxkLE5ZfhvdcBN/Rf63SAySevYqWy0nJ8smv5oTCDyhsVz
         ztIP/mL2bqO2UU0EuuxPerIPMw9zU7qxvC8FMuo1WRcy8qLtZ4Leb0tQ584XPWpI7yWg
         1btNyVS/TTvO/+zSZsCkELUE4/YHyGesVqVkKlnQXQcIb/OKjXpLmw96Ok93NmERujTH
         6jntBsnSduRq9tCCVLtEsMcDoaIEGPpBhHlIPNSFtBItm/vXl6mtbw5W/jZCaiDw0HAK
         exVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=WWvMIyyl3gn9mvGY6d/yN4XCP7/LbjN5c5PTkqd35uc=;
        b=tMkY7ln8uZzyPtytlAMDZb3J3b88PRgme8OSrDpGY5/ESJkCVLZ6UP2ATaKkeELUck
         QJgm3LD+Xdj6TJUoI1x8zZX0Ic0jZYsZaR4Rw/QoWvMKw95Cv5BBKnMBJTqA26pcbeSU
         slRdORyfb4fyPi+4SkA0PN2p2r+5APsPLEH41rQ9YdaCTC77M6mBtSf8FZtCMC6rKrk2
         2L33uA1hgUXaV+tbF62Ru/cNHNmV5cQcLIio/awlenJ23CVB8sUjlRWk9KBU/YqMVGvb
         Cf3Bzu/pal2MDnacKKA93AVJQTJl7jV2XNqieF5YQvOGCNS3j4Y+8BwGRizAYodUWtbU
         di9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IW6i4nmN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WWvMIyyl3gn9mvGY6d/yN4XCP7/LbjN5c5PTkqd35uc=;
        b=GmQYAi81+LfAl8zfx4FX8BSfDNmjDpG1Rap2ThB8yNZLSmiSe1NDVQMioQnp0I/tIc
         arsyru7N4z54Wmi+hfjwv4maHnIJKQNjOasHVARo2wjUIvs+MmedGp8L5fFWDI9QEwzZ
         Fvc26DXZT/Lphv591dNQtHSQUZq9/5AHl5MNtMIt8zfse24tC8uPsPzU3FZ/hlKckDks
         3n+OXCBU9ZfaSTgtf7BJYtXAZmy5DfSISQSlz7/rsZomRYH1cQ0uzfnnJmO/7fvdMBuF
         pN6UO9FarHldx1DxjiGaXC7mM/sQTOuhx7l6fCuZPFiWwokAkbmD/Kt7O1WCr+BJUNdy
         LpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WWvMIyyl3gn9mvGY6d/yN4XCP7/LbjN5c5PTkqd35uc=;
        b=cd/kpKW4cRjxB1v4qctsteK+hnZjQ+GbS8UYbSv0u9ttykL2cLYwI3XyJUMq1LPbxj
         idcyrvY9PFIDZu9mrRyNb+vPbHS3mqUDdM2LoNaLSFD0c/VpL9s52dSS2MWtZxSIDnIO
         bRT+zvQOZf/Btu7Mey8D8ZtnsGyoNM0WVBmKqRwjl6n52M/5Ly7SxVOagWM/N3l1v2t/
         WWbxYrPnC4gTDaohxEvC0ia8uO3Xoj3PM5Q8khLUeWvzRgKe3Vp1OP8x7ZlozoKbAwLC
         VgdQUGB9bJHC1ltzm53KOCRG9SEqc3fqEe0aIHxTRpzN4bprI7WYXFxr9q0yiPCejpTb
         LuUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUvHOm75qxQpUO9ICXJzSzgTlAnoYEw++5rq5V8x6Ai8Gtc9UG4
	Mpos3CZgggbNsZWYPk0EKs8=
X-Google-Smtp-Source: APXvYqyFOH/iOOIveKyQMypAq1iCIKgzqBZUGSw3HHYRNUrPAU7x+wefPiSMuHE9LH0b/H0tpInS2Q==
X-Received: by 2002:a0c:969d:: with SMTP id a29mr16135426qvd.56.1557048791358;
        Sun, 05 May 2019 02:33:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:2306:: with SMTP id a6ls2536268qta.14.gmail; Sun, 05 May
 2019 02:33:11 -0700 (PDT)
X-Received: by 2002:ac8:2d21:: with SMTP id n30mr16273649qta.96.1557048791010;
        Sun, 05 May 2019 02:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557048791; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBh0RFes3CecIvv1O8OCpwBP5IFyOVpXI4TJkvIlVtNoTOb/mEiIs/ySELShlFnR5x
         P7mnbSd2XBTUZcKDBLAnQSJ5SlOxptJPJEYpaRJXyYqFQkdTLSqaTKhzsRkpjJXvBQQV
         a8NvyhXtqiAoSyU353jJhO1CFtRgckct5I3l/00HcHdBv7zpxRkUK4cXJZUQtsa1YjPc
         AqkZJprCIdbn/jE60eoJ8X0omXXBIvNjtyNVt/dWDjT8Biw+escwSf0AJsAJtjvQnzVC
         GnQolyo+uOjAnIgx49PUX9daeoSe8F0xWnM9dGoL5j3c713zB+9Aul6Uw1NCFOpCE/RX
         fvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=yNW0FNqd/4ip9Oou7WUvIu8Gl3ChD+cZv0eKvDtEErI=;
        b=fu+to9jE5MdJlJwFiPzPzGL5u/e4iIZMwLWANt79Q0YqDD+ZysJe09djB3JHmhiBv5
         TbN9K4PV/SOQ42OC/w3K82qrDD7Fnu9nXNFBVWq3uxPFjkpKJlOToRiTlSRei81rDgwp
         hU2nIkCHB7Q4lB85ZEtIg5mKvjqpkD04ZJoT4wkA+bH0ApceoaHRTDq/LVmYAEGYFgRX
         P5yUrAemVXc55IKJKWIByiuZyJ7ZkW5irZ8Y34mp1sYJC4WvqUlh0zATCoePRPnO5XxQ
         iEyKl0YHaxjNNycTR1MqG8Ylf0t0V/FSk5sz1rpoAba+A0gB9FWTJB+7FVwqu7P7SfZN
         I4fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IW6i4nmN;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id m20si337321qtq.0.2019.05.05.02.33.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 02:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Sun, 05 May 2019 02:33:10 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d235bd-b94228@github.com>
Subject: [siemens/jailhouse] b94228: inmates: Fix RIP-relative test
 mmio-access
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=IW6i4nmN;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
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
  Commit: b94228ca3ac8b41f4389221f1c31dc4d6092c83f
      https://github.com/siemens/jailhouse/commit/b94228ca3ac8b41f4389221f1c31dc4d6092c83f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-05 (Sun, 05 May 2019)

  Changed paths:
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: Fix RIP-relative test mmio-access

Avoid using the cmdline as basis which can move around - as in
91332fa77903. Also makes the thing more readable.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
