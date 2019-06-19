Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBD7TVHUAKGQECB4F66I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x638.google.com (mail-pl1-x638.google.com [IPv6:2607:f8b0:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B994C07E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 20:06:08 +0200 (CEST)
Received: by mail-pl1-x638.google.com with SMTP id e7sf10330106plt.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 11:06:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560967567; cv=pass;
        d=google.com; s=arc-20160816;
        b=XKxGe2IumgOSKtiG9ijWUvr4zFrF7m3VipngQXLUjlLE4CWk8uKT1pe0va2pHmeRZB
         8Zq07U5OPVEQsJgR/c8QPmE09pB/IojoUm298nuPiTy/jYHgGHvRRNiV24p5ImumjFff
         GSCbYyfQD2ACz4RipRhUtVmFaNmJIs8Ss6RccdYfBY0FuVaqiDt61uKBe26wOAJPacCh
         /Dv5hA1ReI/PV/EzQX/QgOXuCOPaWQkJ0adWsMIeMK/e998x6nOSJNAEwMjUGxmxvCmz
         aJ4ycmaedU+8lcrF+OHpajEiqPTrY/YH3K8z8+KHOKURQS8ORru90yL9QZ5X6b6x06Xt
         kVhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=/sWpMnziNOaxT0+YNbPbod9C8w7zOUutJn4QlQN1mR4=;
        b=FRz9x64ZaWTkJUCKSQTuD8TMhdNjBSDwf78M3NjzTh7ggbB0I0jpnD8dKDHw2+L7Yt
         4fONJwJ/ea6+x+a8W5GCsvMsGsOP5FZbZxJ/PHJoAS4F2bBgLh0lRPwlmVfjibNNJ/Ix
         UZ0bagqlC3+0JujCN+6KgHXhTwlX1pEMOpHAgucjR/Js7REbXRgcRRcKpa/2OZCibIaD
         gm4soiD/wiQj7suHiRb9u7KTNnppkTQkzc3km/tzj6yoNAQw1hGwyg8QCud48QNZnepV
         aMvWmwkod+djVfnB/VAlEJoLRG8e8BRrsx70xTU5FWe2B5nPFMqER0A0MlagPG4jASVx
         5WkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XQeWNKTJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/sWpMnziNOaxT0+YNbPbod9C8w7zOUutJn4QlQN1mR4=;
        b=auAGUBXrcv+bn1TunyGa4nFhONIpjEGzp9GIQbF1T+hyjSBZWeEcXj4KLPjWQdw/yq
         p08tD1IsNq1Fk4siqxF9jONxAaozzMShR2SDXJzk9dBonWeKhg7LIMiPtq/opUYnp58b
         E5e0iM44JvSi+FOZb455vKRLXU8Pxcv9Zt/0b+FUgbMWgJVA76kB1E1AA+pPCgJ55zN5
         bUYjKK3FE1h+zppDgao7+0KGB8GZ1DYhK+WkF3eAwr+ORRpMDfA15bMwpKXK/D6zJB3q
         QlIYKUqfmFKalDCJ1XOB7gRPgzqCzY8W02vIIUOQGHyOnxB+HZsiQOXn+3UFzyGhUIvJ
         6gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/sWpMnziNOaxT0+YNbPbod9C8w7zOUutJn4QlQN1mR4=;
        b=qYN3GqJWDhwGq4mIWvUVse1GcRw0LiaBg0nSINv6U6X4M5pHAiktyTFwecTmHspOcz
         fc8pa3dHe5TmJtG8834+rhKIdXPqWtf0Dy1SNCACPfHlWLvNmKddvJfhlPSNKlN7XJH8
         SsavX4sADk7z4Q5/LRmYw6NnfdvKvlc4lbQBuZEcdAmvjrYmwEqix1mQfzW3+k5BiJR4
         1RhYcTjyy+72XzJ65ufK3rLUP9sSQGIFP9xjzdm4L5cdWYiuo3U8IAahbV+iyzCIafTR
         te+Dg9GYV/wUiYToz0k27Uwhl4HuaaF6/NYeAK9azjNqC/r8OFSbiRq6qglH+62RrvFs
         upiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV0TrkStn1qAX+mkmUByHYZaa+4dI+uUeefvB6Rq0nRcxEgOSmB
	Irs6OkDF9ERRinCQXUSSBww=
X-Google-Smtp-Source: APXvYqzynez4pCjHI/mAAtXkm9xmfNSW1rAWn541pIZV7iQ+Sf2psOlfZqQoRLQv5m0r9tPrDoCg7w==
X-Received: by 2002:a63:195b:: with SMTP id 27mr8907872pgz.223.1560967567299;
        Wed, 19 Jun 2019 11:06:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a9:: with SMTP id a38ls681992pla.5.gmail; Wed, 19
 Jun 2019 11:06:06 -0700 (PDT)
X-Received: by 2002:a17:90a:ab0b:: with SMTP id m11mr12910072pjq.73.1560967566700;
        Wed, 19 Jun 2019 11:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560967566; cv=none;
        d=google.com; s=arc-20160816;
        b=uSwRop88vNTQIY7gwkYtvPvi7Tmh5dfSU7IDnsxm9nbTCMqmViEBAyZNqTys7QSJMy
         rlTwowT6uBAp/OG0D03NRPh8si4wasPODT7WfgUqnY11o/8mCogt5GyhfG1J0FJenC6J
         ciiWFxP+sTZ011M6jTffq87qbbQRRrMKoT/iv4dnAupLfIDYf5QpftFS6lNgYuR0UTdv
         KgrCDBDKE3X9xapc+hhYzwgcXLxdhNYy59k3YIkmRk/FS33G44uuaXRTcukROH4+GNa+
         ifM6IO4JQoBZ8V7EN+JJUJAnczlm9AvV2vhcIPvzj550s5A/+0QlkKd81EO+beoih+Mu
         86nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=/nwa5MKml8Gq99yzeBKfM8Rd6Q7q4SOdn43zR1Kg+zk=;
        b=LXxASetIlQmwhgh1yYS735Ai9mWU6Cx36/17YetQfHpup3CZJzv6GqJ/Mc4zVSMvu/
         gQZ4lJFCUb5WvW677TOcfctw+NlqtPLkgx8J3D4JBoY6Kuqg/515BtnwEQUT7nUYBuiR
         FExVFP57oxPuV4JldRB3ime/UKVn91QFK08UGp1RWjzpM7LTKJWxOGXriht+Xiagrr9Z
         m/mA3d68WoP0LonHvTOy6TIbeCwF9GqYkmKYSX2tY+bdPKeUlFGkKZj5Wcubq7Hcq5H9
         rSK1Wy3W7leom13X/t+LIz8bKg9a/FaJ6RuGQAW8XaUQzBOMMa1sJlqUwpGXXnMDCNeg
         UkNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=XQeWNKTJ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id g6si73790pjt.0.2019.06.19.11.06.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 11:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Wed, 19 Jun 2019 11:06:05 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/0238bf-dd6efa@github.com>
Subject: [siemens/jailhouse] 31f8ed: x86: vtd: Print BDF instead of
 hexadecimal device ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=XQeWNKTJ;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 31f8edfd6eb37f82e3e6f1eeda5a6d7799efa41f
      https://github.com/siemens/jailhouse/commit/31f8edfd6eb37f82e3e6f1eeda5a6d7799efa41f
  Author: Mario Mintel <mario.mintel@st.oth-regensburg.de>
  Date:   2019-06-17 (Mon, 17 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/vtd.c

  Log Message:
  -----------
  x86: vtd: Print BDF instead of hexadecimal device address

As it improves readability of hypervisor messages for debugging purposes.

Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dd6efa9840fb5455f9880ec16522fa50a53db9d4
      https://github.com/siemens/jailhouse/commit/dd6efa9840fb5455f9880ec16522fa50a53db9d4
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-19 (Wed, 19 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/mmio.h

  Log Message:
  -----------
  pci: Replace mmio_write64 with mmio_write64_split

MSI-X vector tables hold 64-bit entries. So far, we used mmio_write64 to
set them.

This conforms the PCI specification: "For all accesses to MSI-X Table and MSI-X
PBA fields, software must use aligned full DWORD or aligned full QWORD
transactions; otherwise the result is undefined" (PCI Local Bus Specification
Rev 3.0, chapter 6.8.2).

Nevertheless, some vendors don't support 64-bit writes, e.g., Broadcom ethernet
cards (BCM5720). mmio_write64 stalls, and the transfer won't happen.

Replace mmio_write64 with a wrapper mmio_write64_split that substitutes the
64-bit write with two 32-bit write operations. This accessor first writes the
upper 32 bits and then the lower 32 bits.

Credits go to Jan, the root cause of this bug was found in a private off-list
discussion.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/0238bf8e9751...dd6efa9840fb

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/0238bf-dd6efa%40github.com.
For more options, visit https://groups.google.com/d/optout.
